unit PTA30101;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OnScheme, ExtCtrls, OnEditStdCtrl, OnEditBaseCtrl, OnEditBtnCtrl,
  OnPopupEdit, OnShapeLabel, Grids, DBGrids, OnGrDBGrid, ComCtrls,
  OnTmaxPersonEdit, StdCtrls, OnFocusButton, OnEditCombo, OnEditNumCtl,
  OnEditMdate, Db, MemDS, DBAccess, Ora, Oninsacommon,
  OnPersonEdit, OnCodeEdit, Pass, Func, PDownLoad;

type
  TMainForm = class(TForm)
    Panel1: TPanel;
    SF_Main: TOnSchemeForm;
    OnShapeLabel1: TOnShapeLabel;
    ED_edu_typeF: TOnWinPopupEdit;
    L_edu_nameF: TOnShapeLabel;
    Grid_lst: TOnGrDbGrid;
    OnShapeLabel3: TOnShapeLabel;
    SB_Help: TStatusBar;
    BT_add: TOnFocusButton;
    BT_find: TOnFocusButton;
    BT_save: TOnFocusButton;
    BT_cancel: TOnFocusButton;
    BT_del: TOnFocusButton;
    BT_close: TOnFocusButton;
    Panel2: TPanel;
    ED_edu_type: TOnWinPopupEdit;
    ED_edu_date_from: TOnDateEdit;
    NE_edu_time: TOnNumberEdit;
    RB_score_fix: TRadioButton;
    RB_score_time: TRadioButton;
    NE_score: TOnNumberEdit;
    CB_edu_pass_yn: TOnComboEdit;
    NE_edu_score: TOnNumberEdit;
    ED_edu_date_to: TOnDateEdit;
    Label3: TLabel;
    OnShapeLabel5: TOnShapeLabel;
    Label1: TLabel;
    Ora_Session: TOraSession;
    Ora_Qry1: TOraQuery;
    ED_empno: TOnPersonPopupEdit;
    ED_empnoF: TOnPersonPopupEdit;
    CB_edu_titleF: TOnComboEdit;
    CB_base_yyF: TOnComboEdit;
    NE_base_score: TOnNumberEdit;
    NE_base_time: TOnNumberEdit;
    NE_base_tscore: TOnNumberEdit;
    Ora_Save: TOraQuery;
    BT_mod: TOnFocusButton;
    CB_base_yy: TOnComboEdit;
    ED_edu_title: TOnEdit;
    ED_remark: TOnEdit;
    Ora_Grid: TOraQuery;
    DataSource1: TDataSource;
    ED_edu_pass_cd: TOnCodePopupEdit;
    Ora_Date: TOraQuery;
    Query1: TOraQuery;
    ED_educode: TOnWinPopupEdit;
    OE_Ekind: TOnEdit;
    OE_Bumoon: TOnEdit;
    OE_Track: TOnEdit;
    OE_Level: TOnEdit;
    BT_EduAdd: TOnFocusButton;
    L_edu_name: TOnShapeLabel;
    procedure BT_closeClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure BT_addClick(Sender: TObject);
    procedure BT_saveClick(Sender: TObject);
    procedure BT_modClick(Sender: TObject);
    procedure BT_cancelClick(Sender: TObject);
    procedure BT_delClick(Sender: TObject);
    procedure ED_empnoKeyPress(Sender: TObject; var Key: Char);
    procedure RB_score_fixClick(Sender: TObject);
    procedure ED_empnoFKeyPress(Sender: TObject; var Key: Char);
    procedure BT_findClick(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure ED_edu_typeFInitPopup(Sender: TObject);
    procedure ED_edu_typeFCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure Calc_Edu_Score(Sender: TObject);
    procedure ED_edu_typeInitPopup(Sender: TObject);
    procedure ED_edu_typeCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure ED_edu_pass_cdKeyPress(Sender: TObject; var Key: Char);
    procedure Grid_lstCellClick(Column: TColumn);
    procedure ED_educodeInitPopup(Sender: TObject);
    procedure ED_educodeCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure BT_EduAddClick(Sender: TObject);
    procedure ED_educodeKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    GSHomeDir  : string;
    JobMode : String;
    SqlStr  : String;
    Cur_Empno, Cur_Edu_type, Cur_Edu_date : String;

    procedure Set_InputField(arg1 : Boolean; arg2 : String );
    procedure Set_BtnEnable(gubun : Char);
    procedure Retrieve;
    procedure PL_get_Edudata;
    procedure Save_Edu2His(InEmpno : String) ;
    function  DataChk : Boolean ;
  public
    { Public declarations }
    GSempno   : String[4];     //Login사번
    GSkorname : String[12];    //Login성명
    GSgrade   : String[10];    //등급
    GSsysdate : String[15];
    v_edu_title : String;
    workemp1, workemp2, workemp3, workemp4, workemp5  : String;
    workemp6, workemp7, workemp8, workemp9, workemp10 : String;
  end;

  var
  MainForm: TMainForm;

implementation

uses PTA30102, PTA30103;

{$R *.DFM}

procedure TMainForm.FormPaint(Sender: TObject);
begin
  Self.OnPaint := Nil;
  Application.ProcessMessages;
  SF_Main.Refresh;

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
        CB_base_yyF.items.Clear;
        CB_base_yyF.KeyItems.Clear;
        CB_base_yy.items.Clear;
        CB_base_yy.KeyItems.Clear;
        while not eof do
        begin
           CB_base_yyF.Items.Add(fields[0].AsString +'년');
           CB_base_yyF.KeyItems.Add(fields[0].AsString);
           CB_base_yy.Items.Add(fields[0].AsString +'년');
           CB_base_yy.KeyItems.Add(fields[0].AsString);
           next;
        end;
        last;
        if Copy(GSsysdate,1,4) <> fields[0].AsString then
        begin
           CB_base_yyF.Items.Add(Copy(GSsysdate,1,4) +'년');
           CB_base_yyF.KeyItems.Add(Copy(GSsysdate,1,4));
           CB_base_yy.Items.Add(Copy(GSsysdate,1,4) +'년');
           CB_base_yy.KeyItems.Add(Copy(GSsysdate,1,4));
        end;
      end;
  end;

  CB_base_yyF.Text         := Copy(GSsysdate,1,4) +'년';
  ED_empnoF.Text           := '';
  ED_edu_typeF.Text        := '전체';
  L_edu_nameF.ValueCaption := '전체';

  CB_edu_titleF.Clear;
  CB_edu_titleF.Items.Clear;
  CB_edu_titleF.Items.Add('전체');
  CB_edu_titleF.ItemIndex := 0;

  BT_cancelClick(Sender);
end;

procedure TMainForm.BT_addClick(Sender: TObject);
begin
  JobMode            := 'I';
  Set_InputField(True,  '추가');
  Set_BtnEnable('I');
  ED_empno.Setfocus;
end;

procedure TMainForm.BT_saveClick(Sender: TObject);
var
  score_type : String;
  imsi_Empno, imsi_Edu_type, imsi_Edu_date, imsi_Edu_title : String;
begin
  if not ((JobMode = 'I') or (JobMode = 'U')) then
    Exit;

  if not DataChk then
    Exit;

  Calc_Edu_Score(Sender);

  if RB_score_fix.Checked then
    score_type := '고정Point'
  else if RB_score_time.Checked then
    score_type := '시간Point';

  imsi_Empno     := Copy(ED_empno.Text,1,4);
  imsi_Edu_type  := ED_edu_type.Text;
  imsi_Edu_date  := ED_edu_date_from.NoFormatDate;
  imsi_Edu_title := ED_edu_title.Text;
  if JobMode = 'I' then
  begin
       if ED_edu_type.Text = '3001' then
       begin
         // 온라인 교육만 교육유형 중복 허용
         SqlStr := Format('Select Count(*) from pedu2item   '+
                          ' where base_yy   = ''%s''        '+
                          '   and empno     = ''%s''        '+
                          '   and edu_type  = ''%s''        '+
                          '   and edu_date_from = ''%s''    '+
                          '   and edu_title = ''%s''        ',
                          [CB_base_yy.KeyItems[CB_base_yy.ItemIndex],  Copy(ED_empno.Text,1,4),
                           ED_edu_type.Text,ED_edu_date_from.NoFormatDate,ED_edu_title.Text]);
       end
       else
       begin
         //LEARNING POINT 중복자료 확인(YY_BASE, EMPNO, edu_type, edu_date_from (PK INDEX))
         SqlStr := Format('Select Count(*) from pedu2item   '+
                          ' where base_yy   = ''%s''        '+
                          '   and empno     = ''%s''        '+
                          '   and edu_type  = ''%s''        '+
                          '   and edu_date_from = ''%s''    ',
                          [CB_base_yy.KeyItems[CB_base_yy.ItemIndex],  Copy(ED_empno.Text,1,4),
                           ED_edu_type.Text,ED_edu_date_from.NoFormatDate ]);
       end;

       Query1.Close;
       Query1.Sql.Text := SqlStr;
       Query1.Open;
       if Query1.Fields[0].AsInteger = 1 then
       begin
            MessageDlg('LEARNING POINT 중복된 자료입니다. 확인 바랍니다.', mtInformation, [mbOk], 0);
            System.exit;
       end;                            

       //IDP 입력자료 확인(YY_BASE, EMPNO, EDUCODE (PK INDEX))
       SqlStr := Format('Select Count(*) from PEIDPHIS '+
                        ' where base_yy   = ''%s''     '+
                        '   and empno     = ''%s''     '+
                        '   and educode   = ''%s'' ',
                        [CB_base_yy.KeyItems[CB_base_yy.ItemIndex],  Copy(ED_empno.Text,1,4),
                         ED_educode.Text]);

       Query1.Close;
       Query1.Sql.Text := SqlStr;
       Query1.Open;
       if Query1.Fields[0].AsInteger = 1 then
       begin
            MessageDlg('IDP 자료에 중복자료가 존재합니다. 확인 바랍니다.', mtInformation, [mbOk], 0);
            System.exit;
       end;

  end;

  if JobMode = 'I' then
  Begin
    SqlStr := Format('insert into pedu2item                          '+
                     '(base_yy,        empno,          edu_type,     '+
                     ' edu_title,      edu_date_from,  edu_date_to,  '+
                     ' edu_pass_cd,    edu_time,       score_type,   '+
                     ' base_score,     base_time,      base_tscore,  '+
                     ' score,          edu_pass_yn,    remark,       '+
                     ' edu_score,      writetime,      writeman, educode) '+
                     'values                                         '+
                     '(''%s'',         ''%s'',         ''%s'',       '+
                     ' ''%s'',         ''%s'',         ''%s'',       '+
                     ' ''%s'',           %f,           ''%s'',       '+
                     '   %f  ,           %f,             %f,         '+
                     '   %f  ,         ''%s'',         ''%s'',       '+
                     '   %f  ,         to_char(sysdate, ''yyyymmddhh24miss''), ''%s'', ''%s'')  ',
                     [CB_base_yy.KeyItems[CB_base_yy.ItemIndex],  Copy(ED_empno.Text,1,4),  ED_edu_type.Text,
                      ED_edu_title.Text, ED_edu_date_from.NoFormatDate, ED_edu_date_to.NoFormatDate,
                      ED_edu_pass_cd.codeno, NE_edu_time.Value,  score_type,
                      NE_base_score.Value, NE_base_time.Value, NE_base_tscore.Value,
                      NE_score.Value,  CB_edu_pass_yn.Text, ED_remark.Text,
                      NE_edu_score.Value, GSempno, ED_educode.Text ]);
  End
  Else
  Begin
    SqlStr := Format('update pedu2item                '+
                     '   set edu_title   = ''%s'',    '+
                     '       edu_date_to = ''%s'',    '+
                     '       edu_pass_cd = ''%s'',    '+
                     '       edu_time    = %f,        '+
                     '       score_type  = ''%s'',    '+
                     '       base_score  = %f,        '+
                     '       base_time   = %f,        '+
                     '       base_tscore = %f,        '+
                     '       score       = %f,        '+
                     '       edu_pass_yn = ''%s'',    '+
                     '       remark      = ''%s'',    '+
                     '       edu_score   = %f,        '+
                     '       writetime   = to_char(sysdate, ''yyyymmddhh24miss''), '+
                     '       writeman    = ''%s'',     '+
                     '       educode     = ''%s''     '+
                     'where base_yy  = ''%s''         '+
                     '  and empno    = ''%s''         '+
                     '  and edu_type = ''%s''         '+
                     '  and edu_date_from = ''%s''    '+
                     '  and edu_title = ''%s''        ',
                     [ED_edu_title.Text,   ED_edu_date_to.NoFormatDate,
                      ED_edu_pass_cd.codeno, NE_edu_time.Value,  score_type,
                      NE_base_score.Value, NE_base_time.Value, NE_base_tscore.Value,
                      NE_score.Value,  CB_edu_pass_yn.Text, ED_remark.Text,
                      NE_edu_score.Value, GSempno, ED_educode.Text,
                      CB_base_yy.KeyItems[CB_base_yy.ItemIndex],  Copy(ED_empno.Text,1,4),
                      ED_edu_type.Text,ED_edu_date_from.NoFormatDate, v_edu_title ]);
  End;

  Try
    Ora_Session.StartTransaction;
    Ora_Save.Close;
    Ora_Save.Sql.Text := SqlStr;
    Ora_Save.ExecSql;

    Save_Edu2His(Copy(ED_empno.Text,1,4));
    Ora_Session.Commit;
  Except on E: EDatabaseError do
    begin
      MessageBox(handle,PChar(E.Message),'에  러',MB_OK or $0010);
      Ora_Session.Rollback;
      Exit;
    end;
  end;

  MessageDlg('교육 이수 내역이 저장되었습니다',mtInformation, [mbOk ],0) ;
  Retrieve;

  Ora_Grid.Locate('EMPNO;EDU_DATE_FROM;EDU_TITLE',VarArrayOf([imsi_Empno, imsi_Edu_date, imsi_Edu_title]), [loCaseInsensitive]);

  JobMode               := 'F';
  Set_InputField(False, '' );
  Set_BtnEnable('F');
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

      if FieldByName('cnt').AsInteger = 0 then
        SaveMode := 'I'
      else
        SaveMode := 'U';
    end;

  if SaveMode = 'I' then
    SqlStr := Format('insert into pedu2his                                                        '+
                     '(base_yy,   empno,      orgnum,     deptcode,                               '+
                     ' teamcode,  payra,      payrayn,    paycl,                                  '+
                     ' tot_count, tot_sc,     req_sc,     opt_sc,   writetime,   writeman)        '+
                     '(select ''%s'', a.empno, b.orgnum , b.deptcode,                             '+
                     '        decode(d.deptlevel, ''E0'', d.extcode, d.deptcode ) teamcode,       '+
                     '        b.payra, b.payrayn,                                                 '+
                     '        case when to_char(sysdate,''yyyymmdd'') <                           '+
                     '     (select value3 from pimvari where gubun = ''00'' and sgubun = ''0001'')'+
                     '             then decode(b.payra,''2C'',  ''0C'',b.paycl)                   '+
                     '             else decode(b.payra,''C11'',''C00'',b.paycl) end paycl,        '+
                     '        count(*) tot_count, sum(a.edu_score) tot_sc,                        '+
		     '	      sum(decode(c.req_yn,''Y'', a.edu_score,0)) req_sc,                  '+
		     '	      sum(decode(c.req_yn,''N'', a.edu_score,0)) opt_sc,                  '+
		     '	      to_char(sysdate, ''yyyymmddhh24miss''), ''%s''                      '+
                     '   from pedu2item a, pimpmas b, pedu2type c, pycdept d                      '+
                     '  where a.base_yy  = ''%s''                                                 '+
		     '	  and a.empno    = b.empno                                                '+
                     '    and b.orgnum   = d.orgnum                                               '+
		     '    and b.deptcode = d.deptcode                                             '+
		     '	  and a.edu_type = c.edu_type                                             '+
		     '	  and a.empno    = ''%s''                                                 '+
		     '	 group by a.empno ,b.orgnum , b.deptcode, decode(d.deptlevel, ''E0'', d.extcode, d.deptcode ), b.payra, b.payrayn, b.paycl)    ',
                     [CB_base_yy.KeyItems[CB_base_yy.ItemIndex], GSempno, CB_base_yy.KeyItems[CB_base_yy.ItemIndex],InEmpno])
  else if SaveMode ='U' then
    SqlStr := Format('update pedu2his                                                             '+
		     '   set (tot_count, tot_sc, req_sc, opt_sc, writetime, writeman) =           '+
		     '       (select count(*) tot_count, sum(a.edu_score) tot_sc,                 '+
		     '               sum(decode(c.req_yn,''Y'', a.edu_score,0)) req_sc,           '+
		     '               sum(decode(c.req_yn,''N'', a.edu_score,0)) opt_sc,           '+
		     '               to_char(sysdate, ''yyyymmddhh24miss''), ''%s''               '+
		     '	        from pedu2item a, pedu2type c                                     '+
		     '	       where a.edu_type = c.edu_type                                      '+
		     '	         and a.base_yy = ''%s''                                           '+
		     '	         and a.empno = ''%s'' )                                           '+
                     ' where base_yy = ''%s''   '+
                     '   and empno   = ''%s''   ',
                     [GSempno, CB_base_yy.KeyItems[CB_base_yy.ItemIndex], InEmpno , CB_base_yy.KeyItems[CB_base_yy.ItemIndex], InEmpno]);

  with Ora_Save do
    begin
      Close;
      Sql.Text := SqlStr;
      ExecSql;
    end;
end;

function TMainForm.DataChk : Boolean ;
begin
  Result := True;

  if Trim(ED_empno.Text) ='' then
    begin
      MessageDlg('사원을 정확히 입력해 주세요..', mtError, [mbok], 0) ;
      Result := False;
      exit;
    end;

  if Trim(CB_base_yy.Text) = '' then
    begin
      MessageDlg('기준년도를 정확히 입력해 주세요..', mtError, [mbok], 0) ;
      Result := False;
      exit;
    end;

  if Trim(ED_edu_type.Text) = '' then
    begin
      MessageDlg('교육유형을 정확히 입력해 주세요..', mtError, [mbok], 0) ;
      Result := False;
      exit;
    end;

  if Trim(ED_edu_title.Text) = '' then
    begin
      MessageDlg('과정명을 정확히 입력해 주세요..', mtError, [mbok], 0) ;
      Result := False;
      exit;
    end;

  if (ED_edu_date_from.NoformatDate = '00000000') or
     (ED_edu_date_to.NoformatDate = '00000000') then
    begin
      MessageDlg('교육기간을 정확히 입력해 주세요..', mtError, [mbok], 0) ;
      Result := False;
      exit;
    end;

  if ED_edu_date_from.NoformatDate > ED_edu_date_to.NoformatDate then
    begin
      MessageDlg('교육기간 To가 From보다 작을수 없습니다...', mtInformation, [mbOK], 0);
      Result := False;
      exit;
    end;

  if Trim(ED_edu_pass_cd.Text) = '' then
    begin
      MessageDlg('교육 수료코드를 정확히 입력해 주세요..', mtError, [mbok], 0) ;
      Result := False;
      exit;
    end;

//  if NE_edu_time.Value = 0 then
//    begin
//      MessageDlg('교육시간을 정확히 입력해 주세요..', mtError, [mbok], 0) ;
//      Result := False;
//      exit;
//    end;

  if not (RB_score_fix.Checked or RB_score_time.Checked) then
    begin
      MessageDlg('Point부여기준을 정확히 입력해 주세요..', mtError, [mbok], 0) ;
      Result := False;
      exit;
    end;

//2005.1.4 유효성--> 인력개발팀 요청 :기준Point 0도 입력 가능하게 수정
//  if RB_score_fix.Checked and (NE_base_score.Value = 0) then
//    begin
//      MessageDlg('기준Point을 정확히 입력해 주세요..', mtError, [mbok], 0) ;
//      Result := False;
//      exit;
//    end;

//  if RB_score_time.Checked and ((NE_base_time.Value = 0)  or (NE_base_tscore.Value = 0 )) then
//    begin
//      MessageDlg('기준시간/Point을 정확히 입력해 주세요..', mtError, [mbok], 0) ;
//      Result := False;
//      exit;
//    end;

  if CB_edu_pass_yn.ItemIndex = -1 then
    begin
      MessageDlg('수료여부를 정확히 입력해 주세요..', mtError, [mbok], 0) ;
      Result := False;
      exit;
    end;
end;       

procedure TMainForm.BT_modClick(Sender: TObject);
begin
  JobMode            := 'U';
  Set_InputField(True, '수정' );
  Set_BtnEnable('I');
end;

procedure TMainForm.BT_cancelClick(Sender: TObject);
begin
  JobMode            := 'F';
  if Ora_Grid.Active then
    Ora_Grid.Locate('EMPNO;EDU_TYPE;EDU_DATE_FROM',VarArrayOf([Cur_Empno, Cur_Edu_type, Cur_Edu_date]), [loCaseInsensitive]);

  Set_InputField(False, '취소');
  Set_BtnEnable('N');
end;

procedure TMainForm.BT_delClick(Sender: TObject);
begin
  if (ED_empno.Text = '') or (ED_edu_type.Text ='') or (ED_edu_date_from.NoFormatDate='00000000') then
    begin
      MessageDlg('삭제할 자료를 선택해 주세요', mtError, [mbOk],0);
      Exit;
    end;

  if MessageDlg('삭제하시겠습니까?',mtConfirmation, [mbYes, mbNo ],0) <> mrYes then
    System.Exit;

  SqlStr := Format('delete from pedu2item   '+
                   ' where base_yy  = ''%s'' '+
                   '   and empno    = ''%s'' '+
                   '   and edu_type = ''%s''     '+
                   '   and edu_date_from = ''%s'' '+
                   '   and edu_title = ''%s'' ',
                   [CB_base_yy.KeyItems[CB_base_yy.ItemIndex], Copy(ED_empno.Text,1,4), ED_edu_type.Text, ED_edu_date_from.NoFormatDate, v_edu_title]);

  Ora_Save.Close;
  Ora_Save.Sql.Text := SqlStr;
  Ora_Save.ExecSql;

  Save_Edu2His(Copy(ED_empno.Text,1,4));

  SqlStr := Format('select count(*) cnt from pedu2item '+
                   ' where base_yy = ''%s'' '+
                   '   and empno   = ''%s'' ',[CB_base_yy.KeyItems[CB_base_yy.ItemIndex], Copy(ED_empno.Text,1,4)]);

  with Ora_Qry1 do
    begin
      Close;
      Sql.Text := SqlStr;
      Open;

      if FieldByName('cnt').AsInteger = 0 then
        begin
          SqlStr := Format('delete from pedu2his    '+
                           ' where base_yy = ''%s'' '+
                           '   and empno   = ''%s'' ',[CB_base_yy.KeyItems[CB_base_yy.ItemIndex], Copy(ED_empno.Text,1,4)]);

          Ora_Save.Close;
          Ora_Save.Sql.Text := SqlStr;
          Ora_Save.ExecSql;
        end;
    end;

  MessageDlg('삭제 되었습니다',mtInformation, [mbOk ],0) ;
  Retrieve;
end;

procedure TMainForm.Set_InputField(arg1 : Boolean; arg2 : String );
begin
  Grid_lst.Enabled         := not arg1;
  ED_empno.Enabled         := arg1;
  CB_base_yy.Enabled       := arg1;
  ED_edu_type.Enabled      := arg1;
  ED_edu_title.Enabled     := arg1;
  ED_edu_date_from.Enabled := arg1;
  ED_edu_date_to.Enabled   := arg1;
  ED_edu_pass_cd.Enabled   := arg1;
  NE_edu_time.Enabled      := arg1;
  NE_score.Enabled         := arg1;
  RB_score_fix.Enabled     := arg1;
  RB_score_time.Enabled    := arg1;

  ED_educode.Enabled       := arg1;
  BT_EduAdd.Enabled        := arg1;

  if arg1 then
    begin
      if RB_score_fix.Checked then
        NE_base_score.Enabled      := arg1;

      if RB_score_time.Checked then
        begin
          NE_base_time.Enabled     := arg1;
          NE_base_tscore.Enabled   := arg1;
        end;
    end
  else
    begin
      NE_base_score.Enabled    := arg1;
      NE_base_time.Enabled     := arg1;
      NE_base_tscore.Enabled   := arg1;
    end;

  CB_edu_pass_yn.Enabled   := arg1;
  ED_remark.Enabled        := arg1;

  if (arg2 = '추가') then
    begin
      ED_empno.Text                 := '';
{      ED_edu_type.Text              := '';
      L_edu_name.ValueCaption       := '';
      ED_edu_title.Text             := '';
      ED_edu_date_from.NoFormatDate := '00000000';
      ED_edu_date_to.NoFormatDate   := '00000000';
      ED_edu_pass_cd.Text           := '';
      NE_edu_time.Value             := 0.0;
      RB_score_fix.Checked          := False;
      NE_base_score.Value           := 0.0;
      NE_base_score.Enabled         := False;
      RB_score_time.Checked         := False;
      NE_base_time.Value            := 0.0;
      NE_base_time.Enabled          := False;
      NE_base_tscore.Value          := 0.0;
      NE_base_tscore.Enabled        := False;
      NE_edu_score.Value            := 0;
}
      NE_score.Value                := 0;
      CB_edu_pass_yn.ItemIndex      := 0;
      ED_remark.Text                := '';
    end
  else if (arg2= '수정') then//update 안되는 필드들
    begin
      ED_empno.Enabled              := False;
      CB_base_yy.Enabled            := False;
      ED_edu_type.Enabled           := False;
      ED_edu_date_from.Enabled      := False;
     // ED_edu_title.Enabled          := False;
    end;
end;

procedure TMainForm.Set_BtnEnable(gubun : Char);
begin
  if gubun ='F' then  //default
    begin
      BT_find.Enabled   := True;
      BT_add.Enabled    := True;
      BT_mod.Enabled    := True;
      BT_save.Enabled   := False;
      BT_cancel.Enabled := False;
      BT_del.Enabled    := True;
    end
  else if gubun ='I' then //수정상태
    begin
      BT_find.Enabled   := False;
      BT_add.Enabled    := False;
      BT_mod.Enabled    := False;
      BT_save.Enabled   := True;
      BT_cancel.Enabled := True;
      BT_del.Enabled    := False;
    end
  else if gubun ='N' then //no data
    begin
      BT_find.Enabled   := True;    
      BT_add.Enabled    := True;
      BT_mod.Enabled    := False;
      BT_save.Enabled   := False;
      BT_cancel.Enabled := False;
      BT_del.Enabled    := False;
    end;
end;

procedure TMainForm.ED_empnoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    ED_empno.PL_get_singledata;
end;

procedure TMainForm.RB_score_fixClick(Sender: TObject);
begin
  if RB_score_fix.Enabled and RB_score_fix.Checked then
    begin
      NE_base_score.Enabled  := True;

      NE_base_time.Value     := 0.0;
      NE_base_tscore.Value   := 0.0;
      NE_base_time.Enabled   := False;
      NE_base_tscore.Enabled := False;
    end
  else if RB_score_time.Enabled and RB_score_time.Checked then
    begin
      NE_base_score.Value    := 0.0;
      NE_base_score.Enabled  := False;

      NE_base_time.Enabled   := True;
      NE_base_tscore.Enabled := True;
    end;
end;

procedure TMainForm.ED_empnoFKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    ED_empnoF.PL_get_singledata;
end;

procedure TMainForm.BT_findClick(Sender: TObject);
begin
  Retrieve;
end;

procedure TMainForm.Retrieve;
begin
  with Ora_Grid do
    begin
      Close;
      Sql.Clear;
      Sql.Add('SELECT A.EMPNO,          B.KORNAME,      A.EDU_TYPE,      C.EDU_NAME,    A.EDU_TITLE, ');
      Sql.Add('       A.EDU_DATE_FROM,  A.EDU_DATE_TO,  A.EDU_PASS_CD,   D.CODENAME  EDU_PASS_NAME,  ');
      Sql.Add('       A.EDU_TIME,       A.SCORE_TYPE,   A.SCORE,         A.BASE_SCORE,  A.BASE_TIME, ');
      Sql.Add('       A.BASE_TSCORE,    A.EDU_PASS_YN,  A.REMARK,        A.BASE_YY,     A.EDU_SCORE, ');
      Sql.Add('       A.EDUCODE                                                                      ');
      Sql.Add(' FROM PEDU2ITEM A, PIMPMAS B, PEDU2TYPE C, PYCCODE D                                  ');
      Sql.Add('WHERE A.EMPNO        = B.EMPNO                 ');
      Sql.Add('  AND A.EDU_TYPE     = C.EDU_TYPE              ');
      Sql.Add('  AND D.CODEID(+)    = ''I604''                ');
      Sql.Add('  AND A.EDU_PASS_CD  = D.CODENO(+)             ');
      Sql.Add('  AND A.BASE_YY      = :BASE_YY                ');
      ParamByName('BASE_YY').AsString     := CB_base_yyF.KeyItems[CB_base_yyF.ItemIndex];

      if Trim(ED_empnoF.Text) <> '' then
        begin
          Sql.Add('  AND A.EMPNO        = :empno                  ');
          ParamByName('empno').AsString  := ED_empnoF.empno;
        end;

      if ED_edu_typeF.Text <> '전체' then
        begin
          Sql.Add('  AND A.EDU_TYPE     = :EDU_TYPE               ');
          ParamByName('EDU_TYPE').AsString    := ED_edu_typeF.Text;
        end;

      if CB_edu_titleF.Text <> '전체' then
        begin
          Sql.Add('  AND A.EDU_TITLE    = :EDU_TITLE               ');
          ParamByName('EDU_TITLE').AsString    :=CB_edu_titleF.Text;
        end;

      Open;
      DataSource1.OnDataChange := nil;
      FieldByName('EMPNO').Alignment       := taCenter;
      FieldByName('EDU_PASS_YN').Alignment := taCenter;
      FieldByName('EDU_DATE_FROM').EditMask := '!9999/99/00;0;_';
      FieldByName('EDU_DATE_TO').EditMask := '!9999/99/00;0;_';
      DataSource1.OnDataChange := DataSource1DataChange;
    end;
end;

procedure TMainForm.Calc_Edu_Score(Sender: TObject);
begin
  if CB_edu_pass_yn.Text = 'Y' then
    begin
      if RB_score_fix.Checked then
        begin
          NE_edu_score.Value := NE_base_score.Value;
        end
      else if RB_score_time.Checked then
        begin
          if NE_base_time.Value = 0 then
            NE_base_time.Value := 1;

          Ora_Qry1.Close;
          Ora_Qry1.Sql.Text := 'select ceil((:edu_time / :base_time) * :base_tscore * 10) /10 edu_score  from dual';
          Ora_Qry1.ParamByName('edu_time').AsFloat    := NE_edu_time.Value;
          Ora_Qry1.ParamByName('base_time').AsFloat   := NE_base_time.Value;
          Ora_Qry1.ParamByName('base_tscore').AsFloat := NE_base_tscore.Value;
          Ora_Qry1.Open;
          NE_edu_score.Value := Ora_Qry1.FieldByName('edu_score').AsFloat;
        end;
    end
  else
    NE_edu_score.Value := 0;
end;

procedure TMainForm.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  ED_empno.Text           := Ora_Grid.FieldByName('EMPNO').AsString+' - '+Ora_Grid.FieldByName('KORNAME').AsString ;
  CB_base_yy.Text         := Ora_Grid.FieldByName('BASE_YY').AsString+'년';
  ED_edu_type.Text        := Ora_Grid.FieldByName('EDU_TYPE').AsString;
  L_edu_name.ValueCaption := Ora_Grid.FieldByName('EDU_NAME').AsString;
  ED_edu_title.Text       := Ora_Grid.FieldByName('EDU_TITLE').AsString;
  v_edu_title             := Ora_Grid.FieldByName('EDU_TITLE').AsString;

  ED_edu_date_from.NoFormatDate   := Ora_Grid.FieldByName('EDU_DATE_FROM').AsString;
  ED_edu_date_to.NoFormatDate     := Ora_Grid.FieldByName('EDU_DATE_TO').AsString;
  ED_edu_pass_cd.Text             := Ora_Grid.FieldByName('EDU_PASS_CD').AsString;
  ED_edu_pass_cd.PL_get_singledata;
  NE_edu_time.Value               := Ora_Grid.FieldByName('EDU_TIME').AsFloat;

  if (Ora_Grid.FieldByName('SCORE_TYPE').AsString = '고정학점' ) or
     (Ora_Grid.FieldByName('SCORE_TYPE').AsString = '고정Point') then
    RB_score_fix.Checked := True
  else
    RB_score_time.Checked := True;

  NE_base_score.Value     := Ora_Grid.FieldByName('BASE_SCORE').AsFloat;
  NE_base_time.Value      := Ora_Grid.FieldByName('BASE_TIME').AsFloat;
  NE_base_tscore.Value    := Ora_Grid.FieldByName('BASE_TSCORE').AsFloat;
  NE_score.Value          := Ora_Grid.FieldByName('SCORE').AsFloat;
  CB_edu_pass_yn.Text     := Ora_Grid.FieldByName('EDU_PASS_YN').AsString;
  NE_edu_score.Value      := Ora_Grid.FieldByName('EDU_SCORE').AsFloat;
  ED_remark.Text          := Ora_Grid.FieldByName('REMARK').AsString;
  ED_educode.Text         := Ora_Grid.FieldByName('EDUCODE').AsString;
  OE_Ekind.Text           := Copy(Ora_Grid.FieldByName('EDUCODE').AsString, 1,2);
  OE_Bumoon.Text          := Copy(Ora_Grid.FieldByName('EDUCODE').AsString, 3,1);
  OE_Track.Text           := Copy(Ora_Grid.FieldByName('EDUCODE').AsString, 4,2);
  OE_Level.Text           := Copy(Ora_Grid.FieldByName('EDUCODE').AsString, 6,2);

  if Trim(ED_empno.Text) = ''then
    Set_BtnEnable('N')
  else
    Set_BtnEnable('F');
end;

procedure TMainForm.ED_edu_typeFCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
  if CForm.Code <> '' then
    begin
      ED_edu_typeF.Text          := CForm.Code;
      L_edu_nameF.ValueCaption   := CForm.CodeName;

      //과정명 콤보박스 Setting
      CB_edu_titleF.Clear;
      CB_edu_titleF.Items.Clear;
      CB_edu_titleF.Items.Add('전체');

      if (ED_edu_typeF.Text <> '전체') then
        begin
          Ora_Qry1.Close;
          Ora_Qry1.Sql.Clear;
          Ora_Qry1.Sql.Add('SELECT DISTINCT EDU_TITLE EDU_TITLE  ');
          Ora_Qry1.Sql.Add('  FROM PEDU2ITEM            ');
          Ora_Qry1.Sql.Add(' WHERE BASE_YY  = :BASE_YY  ');
          Ora_Qry1.Sql.Add('   AND EDU_TYPE = :EDU_TYPE ');
          Ora_Qry1.ParamByName('BASE_YY').AsString   := CB_base_yyF.KeyItems[CB_base_yyF.ItemIndex];
          Ora_Qry1.ParamByName('EDU_TYPE').AsString  := ED_edu_typeF.Text;
          Ora_Qry1.Open;

          Ora_Qry1.First;

          while not Ora_Qry1.Eof do
            begin
              CB_edu_titleF.Items.Add(Ora_Qry1.FieldByName('EDU_TITLE').AsString);
              Ora_Qry1.Next;
            end;
        end;
      CB_edu_titleF.ItemIndex := 0;
    end;
end;

procedure TMainForm.ED_edu_typeInitPopup(Sender: TObject);
begin
  CForm.Edit          := TOnWinPopupEdit(Sender);
  TOnWinPopupEdit(Sender).PopupControl := CForm ;
end;

procedure TMainForm.ED_edu_typeCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
  if CForm.Code <> '' then
    begin
      ED_edu_type.Text          := CForm.Code;
      L_edu_name.ValueCaption   := CForm.CodeName;
    end;
end;

procedure TMainForm.ED_edu_pass_cdKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    ED_edu_pass_cd.PL_get_singledata;
end;

procedure TMainForm.Grid_lstCellClick(Column: TColumn);
begin
{  if Ora_Grid.RecordCount > 1 then
    System.Exit;

  ED_empno.Text           := Ora_Grid.FieldByName('EMPNO').AsString+' - '+Ora_Grid.FieldByName('KORNAME').AsString;
  CB_base_yy.Text         := Ora_Grid.FieldByName('BASE_YY').AsString+'년';
  ED_edu_type.Text        := Ora_Grid.FieldByName('EDU_TYPE').AsString;
  L_edu_name.ValueCaption := Ora_Grid.FieldByName('EDU_NAME').AsString;
  ED_edu_title.Text       := Ora_Grid.FieldByName('EDU_TITLE').AsString;

  ED_edu_date_from.NoFormatDate   := Ora_Grid.FieldByName('EDU_DATE_FROM').AsString;
  ED_edu_date_to.NoFormatDate     := Ora_Grid.FieldByName('EDU_DATE_TO').AsString;
  ED_edu_pass_cd.Text             := Ora_Grid.FieldByName('EDU_PASS_CD').AsString;
  ED_edu_pass_cd.PL_get_singledata;
  NE_edu_time.Value               := Ora_Grid.FieldByName('EDU_TIME').AsFloat;

  if (Ora_Grid.FieldByName('SCORE_TYPE').AsString = '고정학점' ) or
     (Ora_Grid.FieldByName('SCORE_TYPE').AsString = '고정Point') then
    RB_score_fix.Checked := True
  else
    RB_score_time.Checked := True;

  NE_base_score.Value     := Ora_Grid.FieldByName('BASE_SCORE').AsFloat;
  NE_base_time.Value      := Ora_Grid.FieldByName('BASE_TIME').AsFloat;
  NE_base_tscore.Value    := Ora_Grid.FieldByName('BASE_TSCORE').AsFloat;
  NE_score.Value          := Ora_Grid.FieldByName('SCORE').AsFloat;
  CB_edu_pass_yn.Text     := Ora_Grid.FieldByName('EDU_PASS_YN').AsString;
  NE_edu_score.Value      := Ora_Grid.FieldByName('EDU_SCORE').AsFloat;
  ED_remark.Text          := Ora_Grid.FieldByName('REMARK').AsString;

  if Trim(ED_empno.Text) = ''then
    Set_BtnEnable('N')
  else
    Set_BtnEnable('F');
}
end;

procedure TMainForm.ED_edu_typeFInitPopup(Sender: TObject);
begin
  CForm.Edit          := TOnWinPopupEdit(Sender);
  TOnWinPopupEdit(Sender).PopupControl := CForm ;
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
    ED_educode.Text   := CEduForm.Code;
    ED_edu_title.Text := CEduForm.CodeName;
    OE_Ekind.Text     := CEduForm.Ekind;
    OE_Bumoon.Text    := CEduForm.Bumoon;
    OE_Track.Text     := CEduForm.Track;
    OE_Level.Text     := CEduForm.Level;
  end;
end;

procedure TMainForm.BT_EduAddClick(Sender: TObject);
var LSfilename : string;
    LAarg : array[0..200] of char;
begin
  //기준관리 화면Load시 코드등록 화면 호출
  Ora_Save.Close;
  Ora_Save.Sql.Clear;
  Ora_Save.SQL.ADD(' UPDATE peIDPbas '         );
  Ora_Save.SQL.ADD(' SET Value2    = ''Y'' '   );
  Ora_Save.SQL.ADD(' where base_yy = ''0000'' ');
  Ora_Save.SQL.ADD('   and gubun   = ''00''   ');
  Ora_Save.SQL.ADD('   and sgubun  = ''0000'' ');
  Ora_Save.ExecSql;

  FM_DownLoad := TFM_DownLoad.Create(Application);
  FM_DownLoad.Show;
  FM_DownLoad.PL_ReadEnv;                     //환경변수값(파라미터) 읽어온다.
  FM_DownLoad.PL_VersionCHK3(3, 'PEK2010A');  //Call하는 단위 프로그램의 버젼을 체크..
  if  (not FM_DownLoad.FL_VersionCHK ) or
  (not FileExists(GSHomeDir+'\Bin\2tier\PEK2010A.EXE')) then
  begin
    FM_DownLoad.PL_DownLoad(3,'/hper/insa/hperson/conbin/Ebin','PEK2010A.EXE','PEK2010A',FM_DownLoad.FL_ProgVer, FL_UnixIP,FL_FtpUser,FL_FtpPass); //단위 프로그램 다운받기.
  end
  else
  begin
    FM_DownLoad.SB_Help.Panels[1].Text := '로컬PC의 프로그램을 실행합니다.';
    LSfilename := GSHomeDir          +'\Bin\2Tier\PEK2010A.EXE ,'
                + Ed_empno.Text      +','+Passemp(cmdline,2) +','+'@@@@@'+','   //패스워드 체크 방지용.
                + Passemp(cmdline,4) +','+Passemp(cmdline,5) +','+Passemp(cmdline,6) +','
                + Passemp(cmdline,7) +','+Passemp(cmdline,8) +','+Passemp(cmdline,9) +','
                + Passemp(cmdline,10)+','+Passemp(cmdline,11)+','+Passemp(cmdline,12)+','
                + Passemp(cmdline,13)+','+Passemp(cmdline,14)+','+Passemp(cmdline,15);

    strpcopy( LAarg, LSfilename );
    winexec(LAarg, SW_SHOWNORMAL);

    FM_DownLoad.Close;      // 다운로드 폼 닫기.
  end;
end;


procedure TMainForm.ED_educodeKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    PL_get_Edudata;
end;

procedure TMainForm.PL_get_Edudata;
begin
  if Trim(CB_base_yy.Text) = '' then
  begin
    MessageDlg('기준년도를 정확히 입력해 주세요..', mtError, [mbok], 0) ;
    System.exit;
  end;

  SqlStr := Format(' SELECT EDUNAME, ' +
                   '   SUBSTRB(EDUCODE, 1,2) CN_EKIND, ' +
                   '   SUBSTRB(EDUCODE, 3,1) CN_BUMOON,' +
                   '   SUBSTRB(EDUCODE, 4,2) CN_TRACK, ' +
                   '   SUBSTRB(EDUCODE, 6,2) CN_LEVEL  ' +
                   ' FROM PEIDPCRS           ' +
                   ' WHERE BASE_YY = ''%s''  ' +
                   '   AND EDUCODE = ''%s''  ',[CB_base_yy.KeyItems[CB_base_yy.ItemIndex], ED_educode.Text]);
  with Ora_Qry1 do
  begin
    Close;
    Sql.Text := SqlStr;
    Open;

    if (fields[0].AsString) = '' Then
    Begin
       MessageDlg(' 입력한 교육코드가 존재하지 않습니다. 정확히 입력해 주세요.' ,mtError,[mbOK],0);
       ED_educode.SetFocus;
       System.Exit;
    End Else
    Begin
      ED_edu_title.Text := Ora_Qry1.FieldByName('EDUNAME').AsString ;
      OE_Ekind.Text     := Ora_Qry1.FieldByName('CN_EKIND').AsString ;
      OE_Bumoon.Text    := Ora_Qry1.FieldByName('CN_BUMOON').AsString ;
      OE_Track.Text     := Ora_Qry1.FieldByName('CN_TRACK').AsString ;
      OE_Level.Text     := Ora_Qry1.FieldByName('CN_LEVEL').AsString ;
    End;
  end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  VarLoading;
end;

procedure TMainForm.BT_closeClick(Sender: TObject);
begin
  Close;
end;

end.
