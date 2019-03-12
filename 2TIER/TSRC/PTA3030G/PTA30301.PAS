unit PTA30301;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OnScheme, StdCtrls, OnFocusButton, OnEditNumCtl, OnEditStdCtrl, ComCtrls,
  OnEditBaseCtrl, OnEditBtnCtrl, OnEditCombo, Gauges, ExtCtrls, Db, MemDS,
  DBAccess, Ora, OnInsaCommon, Pass, Func, OnPopupEdit, Grids,
  DBGrids, OnGrDBGrid, OnShapeLabel, OnTmaxPersonEdit, OnPersonEdit, Mask,
  pebtnedit;

type
  TMainForm = class(TForm)
    Panel1: TPanel;
    SB_Help: TStatusBar;
    SF_Main: TOnSchemeForm;
    Ora_Session: TOraSession;
    Ora_Qry1: TOraQuery;
    OpenDialog1: TOpenDialog;
    Ora_Save: TOraQuery;
    Ora_Date: TOraQuery;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Gauge1: TGauge;
    CB_base_yy: TOnComboEdit;
    Panel7: TPanel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    ED_File: TOnEdit;
    ED_Error: TOnEdit;
    NE_ReadCount: TOnNumberEdit;
    NE_ErrorCount: TOnNumberEdit;
    NE_ProcessCount: TOnNumberEdit;
    BT_File: TOnFocusButton;
    BT_Error: TOnFocusButton;
    BT_Run: TOnFocusButton;
    BT_close: TOnFocusButton;
    Memo1: TMemo;
    Panel2: TPanel;
    Panel3: TPanel;
    OnFocusButton1: TOnFocusButton;
    BT_Del: TOnFocusButton;
    DataSource1: TDataSource;
    Ora_Grid: TOraQuery;
    BT_Ser: TOnFocusButton;
    GroupBox1: TGroupBox;
    ED_educode: TOnWinPopupEdit;
    ED_edutitle: TOnShapeLabel;
    CB_base_yyF: TOnComboEdit;
    GroupBox2: TGroupBox;
    Ed_STime: TOnMaskEdit;
    ED_empnoF: TOnComboEdit;
    Panel4: TPanel;
    Grid_lst: TOnGrDbGrid;
    Panel5: TPanel;
    LB_Cnt: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    procedure BT_closeClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure BT_FileClick(Sender: TObject);
    procedure BT_ErrorClick(Sender: TObject);
    procedure BT_RunClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BT_SerClick(Sender: TObject);
    procedure ED_educodeInitPopup(Sender: TObject);
    procedure ED_educodeCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure CB_base_yyFChange(Sender: TObject);
    procedure BT_DelClick(Sender: TObject);
  private
    { Private declarations }
    ReadCount, ErrorCount, ProcessCount : Integer;    // 읽은건수,오류건수,처리건수
    TotalCount : Integer;                             // 데이타파일의 건수
    E, F : TextFile;
    EmpNoList, EDUTypeList, EDUPassCDList : TStrings;     // 사번,교육유형,교육형태 리스트
    SqlStr     : String;

    Empno         : String[4];
    Edu_type      : String[4];
    Edu_title     : String[80];
    Edu_date_from : String[8];
    Edu_date_to   : String[8];
    Edu_pass_cd   : String[3];
    Edu_time      : String[5];
    Score_type    : String[15];
    Base_score    : String[5];
    Base_time     : String[5];
    Base_tscore   : String[5];
    Score         : String[3];
    Edu_pass_yn   : String[1];
    Remark        : String[100];
    Edu_score     : String[5];
    Educode       : String[12];

    procedure pGetList;                               // 사번,교육유형,교육형태 리스트 가져오기
    procedure pSetCount;
    procedure pIncReadCount;                          // 읽은건수 1증가하고 판넬에 반영
    procedure pIncErrorCount;                         // 에러건수 1증가하고 판넬에 반영
    procedure pIncProcessCount;                       // 처리건수 1증가하고 판넬에 반영
    procedure pWriteError(No: Integer; Emp, ErrS: String);  // 데이타에러시 파일에 기록루틴

    procedure Save_Edu2His(InEmpno : String) ;
    procedure Calc_Edu_Score;
    procedure YY_Search;

    function Valid_Check : Boolean;
    function fCheckEmpno(Empno: String): Boolean;          // 사번 체크루틴
    function fCheckDate(Indate : String): Boolean;         // 날짜 유효성 체크루틴
    function fCheckEDUType(EDUType: String): Boolean;      // 교육유형 체크루틴
    function fCheckEDUPassCD(EDUPassCD: String): Boolean;

    function MyPasString(const S, Delimiters : string; Num : integer) : string;
    Function  To_DateTime(Tmp :String):Extended;

  public
    { Public declarations }
    GSempno   : String[4];     //Login사번
    GSkorname : String[12];    //Login성명
    GSgrade   : String[10];    //등급
    GSsysdate : String[15];
    workemp1, workemp2, workemp3, workemp4, workemp5  : String;
    workemp6, workemp7, workemp8, workemp9, workemp10 : String;
  end;

var
  MainForm: TMainForm;

implementation

uses PTA30303;

{$R *.DFM}

procedure TMainForm.FormPaint(Sender: TObject);
begin
  Self.OnPaint := Nil;
  Application.ProcessMessages;
  SF_Main.Refresh;
  SB_help.Panels[1].Text := '인사 시스템에 접속 중입니다...';

  Application.ProcessMessages;
  SB_Help.Panels[1].Text := ' 데이타베이스에 접속중입니다...';

  Ora_Session.Options.Net   := True;
  Ora_Session.ConnectPrompt := False;
  Ora_Session.Username      := Passemp(cmdline,5);
  Ora_Session.Password      := Passemp(cmdline,6);
  Ora_Session.Server        := Passemp(cmdline,7)+':'+Passemp(cmdline,9)+':'+Passemp(cmdline,8);
  try
     Ora_Session.Connected := True;
  except on E : Exception do
     Application.MessageBox(PChar('서버에 접속할 수 없습니다...'#13#13+E.Message),'알 림',MB_OK);
  end;

  SB_help.Panels[1].Text := '';

  GSempno   := Passemp(cmdline,1);
  GSkorname := Passemp(cmdline,2);
  GSgrade   := Passemp(cmdLine,4);
  GSsysdate := Fn_GetDateTimeStr;

  with Ora_Qry1 do
  begin
    close;
    Sql.Clear;
    Sql.Add('select Value1,  Value2,  Value3,  Value4,  Value5,   ');
    Sql.Add('       Value6,  Value7,  Value8,  Value9,  Value10   ');
    Sql.Add('  from peIDPbas a                                    ');
    Sql.Add(' WHERE a.base_yy = '''+Copy(GSsysdate,1,4)+'''  ');
    Sql.Add('   AND a.gubun   = ''01''                            ');
    Sql.Add('   AND a.sgubun  = ''0001''                          ');
    Open;

    workemp1 := fields[0].AsString;
    workemp2 := fields[1].AsString;
    workemp3 := fields[2].AsString;
    workemp4 := fields[3].AsString;
    workemp5 := fields[4].AsString;
    workemp6 := fields[5].AsString;
    workemp7 := fields[6].AsString;
    workemp8 := fields[7].AsString;
    workemp9 := fields[8].AsString;
    workemp10:= fields[9].AsString;
  end;

  (* 각 부문별 담당자 로그인 2017.1.17 박주영M 요청 HeeYong*)
  if Not((GSempno = WorkEmp1) or (GSempno = WorkEmp2) or (GSempno = WorkEmp3) or
         (GSempno = WorkEmp4) or (GSempno = WorkEmp5) or (GSempno = WorkEmp6) or
         (GSempno = WorkEmp7) or (GSempno = WorkEmp8) or (GSempno = WorkEmp9) or
         (GSempno = WorkEmp10) or (copy(GSempno,1,1) = 'D')) then
  begin
    MessageDlg('귀하는 작업권한이 없습니다. 프로그램을 종료합니다.', mtInformation, [mbOk], 0);
    BT_CloseClick(Self);
    Exit;
  end;

  with Ora_Date do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select distinct base_yy from pedu2base order by 1');
    Open;

    if recordcount  > 0 then
    begin
      CB_base_yy.items.Clear;
      CB_base_yy.KeyItems.Clear;
      CB_base_yyF.items.Clear;
      CB_base_yyF.KeyItems.Clear;
      while not eof do
      begin
         CB_base_yy.Items.Add(fields[0].AsString +'년');
         CB_base_yy.KeyItems.Add(fields[0].AsString);
         CB_base_yyF.Items.Add(fields[0].AsString +'년');
         CB_base_yyF.KeyItems.Add(fields[0].AsString);
         next;
      end;
      last;
      if Copy(GSsysdate,1,4) <> fields[0].AsString then
      begin
         CB_base_yy.Items.Add(Copy(GSsysdate,1,4) +'년');
         CB_base_yy.KeyItems.Add(Copy(GSsysdate,1,4));
         CB_base_yyF.Items.Add(Copy(GSsysdate,1,4) +'년');
         CB_base_yyF.KeyItems.Add(Copy(GSsysdate,1,4));
      end;
    end;
  end;

  CB_base_yy.Text  := Copy(GSsysdate,1,4) +'년';
  CB_base_yyF.Text := Copy(GSsysdate,1,4) +'년';
  //     Ed_STime.Text    := Copy(Fn_GetDateTimeStr,1,12);

  // 사번,교육유형,교육형태 리스트 가져오기
  pGetList;
end;

procedure TMainForm.BT_FileClick(Sender: TObject);
begin
     ReadCount    := 0;
     ErrorCount   := 0;
     ProcessCount := 0;
     pSetCount;

     Gauge1.Progress := 0;

     if OpenDialog1.Execute then
     begin
          ED_File.Text  := OpenDialog1.FileName;
          ED_Error.Text := MyPasString(ED_File.Text,'.',1) + '.bad' ;
          ED_File.SetFocus;
     end;
end;

procedure TMainForm.BT_ErrorClick(Sender: TObject);
begin
     WinExec(PChar('C:\WINDOWS\NOTEPAD.EXE '+ED_Error.Text),SW_SHOW );
end;

procedure TMainForm.BT_RunClick(Sender: TObject);
var
     S : String;
     CsvFile  : array [0..255] of Char; //PCSS 복호화 작업
begin
     if MessageDlg('일괄 저장작업을 하시겠습니까?', mtConfirmation, [MBYes , MBNo], 0) = mrNo then Exit;

     // 데이타파일 존재여부 체크
     if FileExists(ED_File.Text) = False then
     begin
          MessageDlg('데이터 화일이 있는지 확인하십시요.',mtError, [MBOk], 0);
          ED_File.Setfocus;
          Exit;
     end;

     if Trim(ED_Error.Text) = '' then
     begin
          MessageDlg('오류 기록 화일명이 없습니다. 확인후 다시 작업하세요.',mtError, [MBOk], 0);
          ED_Error.SetFocus;
          Exit;
     end;

      ReadCount    := 0;
      ErrorCount   := 0;
      ProcessCount := 0;
      pSetCount;
      Gauge1.Progress := 0;

      Memo1.Clear;
      Memo1.Lines.LoadFromFile(ED_File.Text);
      TotalCount := Memo1.Lines.Count;

//jissi 2010.08.11 주석처리     // 데이타파일 오픈
//      AssignFile(F, ED_File.Text);
//      Reset(F);

        //DRMUnit.pas 참조... : PCSS 에 의한 엑셀파일 암호화 파일 Control...
      //fnEncryptFileChorus(OraTable1PCFILE.Text);//DRM 암호화...
      StrCopy(CsvFile, PChar(ED_File.Text));
//      fnDecryptFileChorus(CsvFile);  //DRM Excel 파일 복호화 작업....dsa2000  2006.07.  추가...
      System.AssignFile(F,CsvFile);   //System.AssignFile(F,FileOpenDlg.FileName);
      System.Reset(F);

      // 에러파일 오픈
      AssignFile(E, ED_Error.Text);
      ReWrite(E);

      Try
           Try
                Ora_Session.StartTransaction;
                while not Eof(F) do
                begin
                     Readln(F, S);
                     Empno         := MyPasString(S,',',1);
                     Edu_type      := MyPasString(S,',',2);
                     Edu_title     := MyPasString(S,',',3);
                     Edu_date_from := MyPasString(S,',',4);
                     Edu_date_to   := MyPasString(S,',',5);
                     Edu_pass_cd   := MyPasString(S,',',6);
                     Edu_time      := Trim(MyPasString(S,',',7));
//                     Score_type    := MyPasString(S,',',8);
//                     Base_score    := Trim(MyPasString(S,',',9));
//                     Base_time     := Trim(MyPasString(S,',',10));
//                     Base_tscore   := Trim(MyPasString(S,',',11));
                     Score         := Trim(MyPasString(S,',',8));
                     Edu_pass_yn   := MyPasString(S,',',9);
                     Remark        := MyPasString(S,',',10);
                     Educode       := Trim(MyPasString(S,',',11));

                     SB_Help.Panels[1].Text := '['+EmpNo+'] Learning Point 내역을 등록 하고있습니다 !!';

                     pIncReadCount;                                // 읽은 갯수 1 증가
                     Application.ProcessMessages;

                     if Edu_time    = '' then Edu_time    := '0';
//                     if Base_score  = '' then Base_score  := '0';
//                     if Base_time   = '' then Base_time   := '0';
//                     if Base_tscore = '' then Base_tscore := '0';
                     if Score       = '' then Score       := '0';

                     if Valid_Check = False then Continue;

                     Calc_Edu_Score;

                     //테이블에 update
                     SqlStr := Format('insert into pedu2item ( base_yy,              '+
                                      '                        empno,                '+
                                      '                        edu_type,             '+
                                      '                        edu_title,            '+
                                      '                        edu_date_from,        '+
                                      '                        edu_date_to,          '+
                                      '                        edu_pass_cd,          '+
                                      '                        edu_time,             '+
                                      '                        score,                '+
                                      '                        edu_pass_yn,          '+
                                      '                        remark,               '+
                                      '                        edu_score,            '+
                                      '                        writetime,            '+
                                      '                        writeman,             '+
                                      '                        educode )             '+
                                      '               values                         '+
                                      '(''%s'',         ''%s'',         ''%s'',      '+
                                      ' ''%s'',         ''%s'',         ''%s'',      '+
                                      ' ''%s'',           %f,                        '+
                                      '   %f  ,         ''%s'',         ''%s'',      '+
                                      '   %f  ,         to_char(sysdate, ''yyyymmddhh24miss''), ''%s'', ''%s'') ',
                                      [CB_base_yy.KeyItems[CB_base_yy.ItemIndex],  Empno,  Edu_type,
                                       Edu_title, Edu_date_from, Edu_date_to,
                                       Edu_pass_cd, StrToFloat(Edu_time),
                                       StrToFloat(Score),  Edu_pass_yn, Remark,
                                       StrToFloat(Edu_score), GSempno, Educode ]) ;

                     Ora_Save.Close;
                     Ora_Save.Sql.Text := SqlStr;
                     Ora_Save.ExecSql;

                     Save_Edu2His(Empno);

                     pIncProcessCount;                                    // 처리건수 1 증가
                     Gauge1.Progress :=  Round((ReadCount / TotalCount) * 100) ;
                end;  //end of while

                Ora_Session.Commit;
           Except
                on E: EDatabaseError do
                begin
                     MessageBox(handle,PChar(E.Message),'에  러',MB_OK or $0010);
                     Ora_Session.Rollback;
                     Abort;
                end;
           end;
      Finally
           pSetCount;

           WriteLn(E, '********* Learning Point 내역 일괄등록 작업 종료 ***********');
           WriteLn(E, 'Read Count    : ' + IntToStr(ReadCount));
           WriteLn(E, 'Error Count   : ' + IntToStr(ErrorCount));
           WriteLn(E, 'Process Count : ' + IntToStr(ProcessCount));

           CloseFile(F);
           CloseFile(E);

           Gauge1.Progress := 0;
           SB_Help.Panels[1].Text := '작업을 모두 마쳤습니다.. ';
      end;
end;

procedure TMainForm.Calc_Edu_Score;
begin
  if   Edu_pass_yn = 'Y' then Edu_score := score
  else                        Edu_score := '0';
end;


function TMainForm.Valid_Check : Boolean;
begin
     Result := False;

     if fCheckEmpNo(Empno) = False then
     begin
          pIncErrorCount;
          pWriteError(ReadCount, EmpNo, '사번에러');
          Exit;
     end;

     if fCheckDate(Edu_date_from) = False then
     begin
          pIncErrorCount;
          pWriteError(ReadCount, EmpNo, '교육기간FROM에러');
          Exit;
     end;

     if fCheckDate(Edu_date_to) = False then
     begin
          pIncErrorCount;
          pWriteError(ReadCount, EmpNo, '교육기간To에러');
          Exit;
     end;

     if fCheckEDUType(Edu_type) = False then
     begin
          pIncErrorCount;
          pWriteError(ReadCount, EmpNo, '교육유형에러');
          Exit;
     end;

     if fCheckEDUPassCd(Edu_pass_cd) = False then
     begin
          pIncErrorCount;
          pWriteError(ReadCount, EmpNo, '교육수료코드에러');
          Exit;
     end;

(* Learning Point 폐지(교육자료 조회 기능만 요청 : 박주영M) 2017.1.17 HeeYong
     if (UpperCase(Score_type) <> UpperCase('고정Point')) and (UpperCase(Score_type) <> UpperCase('시간Point')) then
     begin
          pIncErrorCount;
          pWriteError(ReadCount, EmpNo, 'Point부여기준에러');
          Exit;
     end;
*)
     //2005.1.4 유효성 --> 인력개발팀 요청 : 기준Point 0도 입력 가능하게 수정
     //  if (Uppercase(Score_type) =Uppercase('고정Point')) and (Base_score = '0') then
     //    begin
     //      pIncErrorCount;
     //      pWriteError(ReadCount, EmpNo, '기준Point에러');
     //      Exit;
     //    end;

     //  if (Uppercase(Score_type) =Uppercase('시간Point')) and ((Base_time = '0') or (Base_tscore = '0') ) then
     //    begin
     //      pIncErrorCount;
     //      pWriteError(ReadCount, EmpNo, '기준시간/기준시간당Point에러');
     //      Exit;
     //    end;

     if (Edu_pass_yn ='') then
     begin
          pIncErrorCount;
          pWriteError(ReadCount, EmpNo, '교육수료여부에러');
          Exit;
     end;

     // 현재 데이타의 키값으로 DB에 존재하는 데이타가 있는지 체크
     if  Edu_type = '3001' then   // 온라인 교육만 교육유형 중복 허용
        with Ora_Qry1 do
        begin
          Close;
          Sql.Clear;
          Sql.Add('SELECT EMPNO                              ');
          Sql.Add('  FROM PEDU2ITEM                          ');
          Sql.Add(' WHERE BASE_YY       = :BASE_YY           ');
          Sql.Add('   AND EMPNO         = :EMPNO             ');
          Sql.Add('   AND EDU_TYPE      = :EDU_TYPE          ');
          Sql.Add('   AND EDU_DATE_FROM = :EDU_DATE_FROM     ');
          Sql.Add('   AND EDU_TITLE     = :EDU_TITLE         ');
          ParamByName('BASE_YY').AsString       := CB_base_yy.KeyItems[CB_base_yy.ItemIndex];
          ParamByName('EMPNO').AsString         := Empno;
          ParamByName('EDU_TYPE').AsString      := Edu_type;
          ParamByName('EDU_DATE_FROM').AsString := Edu_date_from;
          ParamByName('EDU_TITLE').AsString     := Edu_Title;
          Open;

          if not Ora_Qry1.EOF then
          begin
               pIncErrorCount;
               pWriteError(ReadCount, EmpNo, '중복에러');
               Exit;
          end;
        end
     else
       with Ora_Qry1 do
       begin
            Close;
            Sql.Clear;
            Sql.Add('SELECT EMPNO                              ');
            Sql.Add('  FROM PEDU2ITEM                          ');
            Sql.Add(' WHERE BASE_YY       = :BASE_YY           ');
            Sql.Add('   AND EMPNO         = :EMPNO             ');
            Sql.Add('   AND EDU_TYPE      = :EDU_TYPE          ');
            Sql.Add('   AND EDU_DATE_FROM = :EDU_DATE_FROM     ');
            ParamByName('BASE_YY').AsString       := CB_base_yy.KeyItems[CB_base_yy.ItemIndex];
            ParamByName('EMPNO').AsString         := Empno;
            ParamByName('EDU_TYPE').AsString      := Edu_type;
            ParamByName('EDU_DATE_FROM').AsString := Edu_date_from;
            Open;

            if not Ora_Qry1.EOF then
            begin
                 pIncErrorCount;
                 pWriteError(ReadCount, EmpNo, '중복에러');
                 Exit;
            end;
       end;

    with Ora_Qry1 do  // BASE_YY, EMPNO, EDUCODE 중복확인
    begin             // IDP와 연결하기 위하여 중복 불가 : HeeYong. 2012.03.23
      Close;
      Sql.Clear;
      Sql.Add('SELECT EMPNO                ');
      Sql.Add('  FROM PEDU2ITEM            ');
      Sql.Add(' WHERE BASE_YY   = :BASE_YY ');
      Sql.Add('   AND EMPNO     = :EMPNO   ');
      Sql.Add('   AND EDUCODE   = :EDUCODE ');

      ParamByName('BASE_YY').AsString := CB_base_yy.KeyItems[CB_base_yy.ItemIndex];
      ParamByName('EMPNO').AsString   := Empno;
      ParamByName('EDUCODE').AsString := Educode;
      Open;

      if not Ora_Qry1.EOF then
      begin
           pIncErrorCount;
           pWriteError(ReadCount, EmpNo, '교육코드 중복에러');
           Exit;
      end;
    end;

     Result := True;
end;

procedure TMainForm.Save_Edu2His(InEmpno : String) ;
var
     SaveMode  : String;
begin
     SqlStr := Format('select count(*) cnt from pedu2his '+
                      ' where base_yy = ''%s'' '+
                      '   and empno   = ''%s'' ',[CB_base_yy.KeyItems[CB_base_yy.ItemIndex], InEmpno]);
     with Ora_Qry1 do
     begin
          Close;
          Sql.Text := SqlStr;
          Open;

          if FieldByName('cnt').AsInteger = 0 then SaveMode := 'I'
          else                                     SaveMode := 'U';
     end;

     if SaveMode = 'I' then
     begin
          SqlStr := Format('insert into pedu2his                                                              '+
                           '(base_yy,   empno,      orgnum,     deptcode,                                     '+
                           ' teamcode,  payra,      payrayn,    paycl,                                        '+
                           ' tot_count, tot_sc,     req_sc,     opt_sc,   writetime,   writeman)              '+
                           '(select ''%s'', a.empno, b.orgnum , b.deptcode,                                   '+
                           '        decode(d.deptlevel, ''E0'', d.extcode, d.deptcode ) teamcode,             '+
                           '        b.payra, b.payrayn,                                                       '+
                           '        case when to_char(sysdate,''yyyymmdd'') <                                 '+
                           '   (select value3 from pimvari where gubun = ''00'' and sgubun = ''0001'')        '+
	                   '             then decode(b.payra,''2C'', ''0C'', b.paycl)                         '+
                           '             else decode(b.payra,''C11'',''C00'',b.paycl) end paycl,              '+
                           '        count(*) tot_count, sum(a.edu_score) tot_sc,                              '+
                           '	      sum(decode(c.req_yn,''Y'', a.edu_score,0)) req_sc,                      '+
                           '	      sum(decode(c.req_yn,''N'', a.edu_score,0)) opt_sc,                      '+
                           '	      to_char(sysdate, ''yyyymmddhh24miss''), ''%s''                          '+
                           '   from pedu2item a, pimpmas b, pedu2type c, pycdept d                            '+
                           '  where a.base_yy  = ''%s''                                                       '+
                           '	  and a.empno    = b.empno                                                    '+
                           '    and b.orgnum   = d.orgnum                                                     '+
                           '    and b.deptcode = d.deptcode                                                   '+
                           '	  and a.edu_type = c.edu_type                                                 '+
                           '	  and a.empno    = ''%s''                                                     '+
                           '	 group by a.empno ,b.orgnum , b.deptcode, decode(d.deptlevel, ''E0'', d.extcode, d.deptcode ), b.payra, b.payrayn, b.paycl)    ',
                           [CB_base_yy.KeyItems[CB_base_yy.ItemIndex], GSempno, CB_base_yy.KeyItems[CB_base_yy.ItemIndex], InEmpno]);
     end
     else if SaveMode ='U' then
     begin
          SqlStr := Format('update pedu2his                                                                   '+
                           '   set (tot_count, tot_sc, req_sc, opt_sc, writetime, writeman) =                 '+
                           '       (select count(*) tot_count, sum(a.edu_score) tot_sc,                       '+
                           '               sum(decode(c.req_yn,''Y'', a.edu_score,0)) req_sc,                 '+
                           '               sum(decode(c.req_yn,''N'', a.edu_score,0)) opt_sc,                 '+
                           '               to_char(sysdate, ''yyyymmddhh24miss''), ''%s''                     '+
                           '	        from pedu2item a, pedu2type c                                         '+
                           '	       where a.edu_type = c.edu_type                                          '+
                           '	         and a.base_yy = ''%s''                                               '+
                           '	         and a.empno = ''%s'' )                                               '+
                           ' where base_yy = ''%s''   '+
                           '   and empno   = ''%s''   ',
                           [GSempno, CB_base_yy.KeyItems[CB_base_yy.ItemIndex], InEmpno , CB_base_yy.KeyItems[CB_base_yy.ItemIndex], InEmpno]);
     end;

     with Ora_Save do
     begin
          Close;
          Sql.Text := SqlStr;
          ExecSql;
     end;
end;

// 읽은건수, 오류건수, 처리건수를 화면에 반영하는 루틴
procedure TMainForm.pSetCount;
begin
  NE_ReadCount.Value    := ReadCount;
  NE_ErrorCount.Value   := ErrorCount;
  NE_ProcessCount.Value := ProcessCount;
end;

// 에러건수를 1 증가시키고 화면에 반영하는 루틴
procedure TMainForm.pIncErrorCount;
begin
  Inc(ErrorCount);
  NE_ErrorCount.Value   := ErrorCount;
end;

// 읽은건수를 1 증가시키고 화면에 반영하는 루틴
procedure TMainForm.pIncReadCount;
begin
  Inc(ReadCount);
  NE_ReadCount.Value    := ReadCount;
end;

// 처리건수를 1 증가시키고 화면에 반영하는 루틴
procedure TMainForm.pIncProcessCount;
begin
  Inc(ProcessCount);
  NE_ProcessCount.Value := ProcessCount;
end;

function TMainForm.fCheckDate(InDate : String) : Boolean;
var
     Temp   : Real;
begin
  if Length(InDate) <> 8 then
  begin
    Result := False;
    System.Exit;
  end;

  InDate := Copy(InDate,1,4) + DateSeParator + Copy(InDate,5,2) + DateSeParator + Copy(InDate,7,2);
  Try
    Temp := StrToDate(InDate);
  Except
    on EConvertError do
    begin
      Result := False;
      System.Exit;
    end;
  end;

  Result := True;
end;

function TMainForm.fCheckEmpno(Empno: String): Boolean;
begin
  Result := True;

  if EmpNo = '' then
  begin
    Result := False;
    Exit;
  end;

  Result := not (EmpNoList.IndexOf(EmpNo) = -1);
end;

function TMainForm.fCheckEDUType(EDUType: String): Boolean;
begin
  Result := True;

  if EDUType = '' then
  begin
    Result := False;
    Exit;
  end;

  Result := not (EDUTypeList.IndexOf(EDUType) = -1);
end;

function TMainForm.fCheckEDUPassCD(EDUPassCD: String): Boolean;
begin
  Result := True;

  if EDUPassCD = '' then
  begin
    Result := False;
    Exit;
  end;

  Result := not (EDUPassCDList.IndexOf(EDUPassCD) = -1);
end;

// 사번,교육유형,교육형태 리스트 가져오기
procedure TMainForm.pGetList;
begin
  with Ora_Qry1 do
  begin
    // 인사마스터에서 사번 가져오기
    EmpNoList := TStringList.Create;
    Close;
    Sql.Clear;
    Sql.Add('SELECT EMPNO FROM PIMPMAS');
    Open;

    while not Eof do
    begin
      EmpNoList.Add(FieldByName('EMPNO').AsString);
      Next;
    end;

    // 코드테이블에서 교육유형코드 가져오기
    EDUTypeList := TStringList.Create;
    Close;
    Sql.Clear;
    Sql.Add('SELECT EDU_TYPE FROM PEDU2TYPE');
    Open;

    while not Eof do
    begin
      EDUTypeList.Add(FieldByName('EDU_TYPE').AsString);
      Next;
    end;

    // 코드테이블에서 교육형태코드 가져오기
    EDUPassCdList := TStringList.Create;
    Close;
    Sql.Clear;
    Sql.Add('SELECT CODENO FROM PYCCODE WHERE CODEID =''I604'' ');
    Open;

    while not Eof do
    begin
      EDUPassCdList.Add(FieldByName('CODENO').AsString);
      Next;
    end;
  end;
end;

// 데이타 에러시 파일에 Write 하는 루틴
procedure TMainForm.pWriteError(No: Integer; Emp, ErrS: String);
var
     S : String;
begin
     S := '순번 : ' + IntToStr(No) + ' '+ '사번(' + Emp + ')  -> ' + ErrS;
     Writeln(E, S);
end;

function TMainForm.MyPasString(const S, Delimiters : string; Num : integer) : string;
var
     I, Len, Count : Integer;
begin
     Count := 0;
     Len := Length(S);
     I := 1;

     Result := '';

     while I <= Len do
     begin
          Result := Result + S[I];
          if Pos(Delimiters, Copy(s, i, 50000)) = 1 then
          begin
               Inc(Count);
               if Count = Num then
               begin
                    Result := Copy(Result, 1, Length(Result) - 1);
                    Break;
               end
               else
               begin
                    Result := '';
                    I := I + Length(Delimiters) - 1;
               end;
          end;
          I := I + 1;
     end;

     if (Num < 1) or (Num > Count + 1) then Result := '';

     Result := Trim(Result);
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  EmpNoList.Free;
  EDUTypeList.Free;
  EDUPassCDList.Free;
end;

procedure TMainForm.ED_educodeInitPopup(Sender: TObject);
begin
  CEduForm.Edit          := TOnWinPopupEdit(Sender);
  TOnWinPopupEdit(Sender).PopupControl := CEduForm ;
end;

procedure TMainForm.ED_educodeCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
  if CEduForm.Code <> '' then
  begin
    ED_educode.Text  := CEduForm.Code;
    ED_edutitle.ValueCaption := CEduForm.CodeName;
  end;
end;

Function TMainForm.To_DateTime(Tmp :String):Extended;
var
   A            : Extended;
   B            : Extended;
   Buf          : String;
begin
  Buf    := Copy(Tmp,1,4) + DateSeparator +
            Copy(Tmp,5,2) + DateSeparator +
            Copy(Tmp,7,2);

  A      := StrToDate(Buf);
  Buf    := Copy(Tmp,9,2) + TimeSeparator + Copy(Tmp,11,2);
  B      := StrToTime(Buf);
  Result := A + B;
end;


procedure TMainForm.BT_SerClick(Sender: TObject);
begin
  with Ora_Grid do
  begin
    Close;
    Sql.Clear;
    Sql.Add(' SELECT A.BASE_YY, A.EMPNO, (SELECT KORNAME FROM PIMPMAS WHERE EMPNO = A.EMPNO) KORNAME, ');
    Sql.Add('        A.EDU_TYPE, A.EDUCODE, A.EDU_TITLE,                                              ');
    Sql.Add('        SUBSTR(A.WRITETIME,1,4)||''-''||SUBSTR(A.WRITETIME,5,2) ||''-''||SUBSTR(A.WRITETIME,7,2)||'' ''||   ');
    Sql.Add('        SUBSTR(A.WRITETIME,9,2)||'':''||SUBSTR(A.WRITETIME,11,2)||'':''||SUBSTR(A.WRITETIME,13,2) INS_TIME, ');
    Sql.Add('        (SELECT KORNAME FROM PIMPMAS WHERE EMPNO = A.WRITEMAN) WRITEMAN ');
    Sql.Add(' FROM PEDU2ITEM A  ');
    Sql.Add(' WHERE A.BASE_YY   = :BASE_YY   ');
    Sql.Add('   AND A.EDUCODE   = :EDUCODE   ');
    Sql.Add('   AND A.WRITEMAN  LIKE :WRITEMAN|| ''%'' ');
    Sql.Add('   AND A.WRITETIME LIKE :WRITETIME|| ''%'' ');
    ParamByName('BASE_YY').AsString   := CB_base_yyF.KeyItems[CB_base_yyF.ItemIndex];
    ParamByName('EDUCODE').AsString   := ED_educode.Text;
    ParamByName('WRITEMAN').AsString  := Copy(ED_empnoF.Text,1,4);
    ParamByName('WRITETIME').AsString := Ed_STime.Text;
    Open;

    LB_Cnt.Caption := '조회건수 : ' + IntToStr(Ora_Grid.recordcount);
  end;

  If (Ora_Grid.recordcount > 0) Then BT_Del.Enabled := True
  Else                               BT_Del.Enabled := False;
end;

procedure TMainForm.CB_base_yyFChange(Sender: TObject);
begin
  YY_Search;
end;

procedure TMainForm.YY_Search;
Begin
  with Ora_Date do
  begin
    Close;
    SQL.Clear;
    SQL.Add(' SELECT DISTINCT WRITEMAN ||'' ''||');
    SQL.Add('       (SELECT KORNAME FROM PIMPMAS WHERE EMPNO = A.WRITEMAN) WRITEMAN');
    Sql.Add(' FROM PEDU2ITEM A ');
    Sql.Add(' WHERE A.BASE_YY = :BASE_YY ');
    ParamByName('BASE_YY').AsString   := Copy(CB_base_yyF.Text,1,4);

    Open;

    First;
    ED_empnoF.Text := '';
    ED_empnoF.items.Clear;
    while not eof do
    begin
      ED_empnoF.Items.Add(fields[0].AsString);
      next;
    end;
  end;
End;

procedure TMainForm.BT_DelClick(Sender: TObject);
begin
  if (Ora_Grid.recordcount = 0) then
  begin
    MessageDlg('삭제할 자료를 조회하시기 바랍니다', mtError, [mbOk],0);
    Exit;
  end;

  if MessageDlg('조회된 ' + IntToStr(Ora_Grid.recordcount) + '건을 삭제하시겠습니까?',mtConfirmation, [mbYes, mbNo ],0) <> mrYes then
    System.Exit;

  with Ora_Save do
  begin
    Close;
    SQL.Clear;
    Sql.Add(' DELETE FROM PEDU2ITEM   ');
    Sql.Add(' WHERE BASE_YY   = :BASE_YY   ');
    Sql.Add('   AND EDUCODE   = :EDUCODE   ');
    Sql.Add('   AND WRITEMAN  LIKE :WRITEMAN|| ''%'' ');
    Sql.Add('   AND WRITETIME LIKE :WRITETIME|| ''%'' ');
    ParamByName('BASE_YY').AsString   := CB_base_yyF.KeyItems[CB_base_yyF.ItemIndex];
    ParamByName('EDUCODE').AsString   := ED_educode.Text;
    ParamByName('WRITEMAN').AsString  := Copy(ED_empnoF.TExt,1,4);
    ParamByName('WRITETIME').AsString := Ed_STime.Text;

    Close;
    ExecSql;
  End;

  MessageDlg('삭제 되었습니다',mtInformation, [mbOk ],0) ;
  BT_SerClick(Sender);
end;

procedure TMainForm.BT_closeClick(Sender: TObject);
begin
  Close;
end;

end.
