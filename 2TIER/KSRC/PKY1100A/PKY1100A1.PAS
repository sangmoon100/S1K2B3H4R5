{-------------------------------------------------------------------------------
 PROGRAM-NAME   : PKY1100A(월변동 자료추출(파견직))
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 파견용역비
 Programmer     : 지순미
 Version        : 1.0
 Date           : 2017.01.20
Update Contents
  버전    수정일       수정자  관련근거       수정내용
  1.00    2017.01.20   지순미  PKC1030G 정규직 소스에서 파견직 분리
--------------------------------------------------------------------------------}
unit PKY1100A1;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, DB, DBTables,
  Pass, Tmax_DataSetText, Tmax_session, OnTmaxInsaData, OnInsaCommon, //DRMUnit 2016.07.12 eyha DRM 암호 관련 삭제처리
  MemDS, Ora, OraSmart, Func, DBAccess;

type
  TFM_Main = class(TForm)
    Phelpmsg: TPanel;
    Panel19: TPanel;
    Lempno: TLabel;
    Lsysdate: TLabel;
    Panel4: TPanel;
    BBprior: TBitBtn;
    BBnext: TBitBtn;
    BBclose: TBitBtn;
    BBoneclear: TBitBtn;
    BBallclear: TBitBtn;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    PrintDialog1: TPrintDialog;
    maintitle: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    BBsearch: TBitBtn;
    TMaxSession: TTMaxSession;
    TDS_batch: TTMaxDataSet;
    Memo1: TMemo;
    RGKind: TRadioGroup;
    OraTable1: TOraTable;
    OraTable1DATANO: TStringField;
    OraTable1DATAKIND: TStringField;
    OraTable1DATANAME: TStringField;
    OraTable1DATAFLD: TStringField;
    OraTable1MONTHYN: TStringField;
    OraTable1MOVEKIND: TStringField;
    OraTable1FROMTBL: TStringField;
    OraTable1FROMFLD: TStringField;
    OraTable1WHEREFLD: TStringField;
    OraTable1WHEREVALUE: TStringField;
    OraTable1PCFILE: TStringField;
    OraTable1WORKTIME: TStringField;
    OraTable1WORKMAN: TStringField;
    OraTable1WORKTEL: TStringField;
    OraTable1WORKCNT: TIntegerField;
    OraTable1MOVEYN: TStringField;
    OraTable1MOVETIME: TStringField;
    OraTable1MOVEMAN: TStringField;
    OraTable1WRITETIME: TStringField;
    OraTable1WRITEMAN: TStringField;
    OraTable1WORKAMT: TFloatField;
    OraTable1CLEARADD: TStringField;
    OraTable1MOVECNT: TIntegerField;
    OraTable1MOVEAMT: TFloatField;
    OraQuery1: TOraQuery;
    procedure BBcloseClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BBpriorClick(Sender: TObject);
    procedure BBnextClick(Sender: TObject);
    procedure BBoneclearClick(Sender: TObject);
    procedure BBallclearClick(Sender: TObject);
    procedure BBoneclearExit(Sender: TObject);
    procedure BBallclearExit(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BBsearchClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure RGKindClick(Sender: TObject);
    procedure MOUSEWHEELMessage(var Msg: TMsg; var Handled: Boolean);

  private
    { Private declarations }
    W_worktype : string;  // 0:공통, 1:정규직, 2:파견직(일반직)
    V_datano, V_dataname,V_datafld, V_clearadd, V_monthyn, V_sogubyn, V_pcfile, V_movekind, V_fromtbl, V_fromfld, V_wherefld, V_wherevalue   : string;
    function Save_History(progid, modflag, modemp, worktype, empno, dataname : String) : Boolean;
  public
    { Public declarations }

  end;

var
  FM_Main: TFM_Main;


implementation

uses file_ftp, PKY1100A2;

{$R *.DFM}

procedure TFM_Main.FormCreate(Sender: TObject);
begin
    OraConnect;

    //2016.06.10 eyha TMax 접속 프로그램 변경
    TMaxSession.ServiceTimeOut := 1000;
    TMaxSession.Connect     := False;
    TMaxSession.EnvFileName := GetHomeDir+'\newhana.env';
    TMaxSession.LabelName   := 'HANAROHPER';
    //TMaxSession.EnvFileName := 'D:\SK_WORK\1. src\newhana.env'; //for test by 하은영


     try
          TMaxSession.Connect := True;
          TMaxSession.TMax_Begin(5000);
     except
          Application.MessageBox(PChar('APP서버 접속 실패'),'에러',mb_ok);
          Application.Terminate;
          Exit;
     end;

     Application.OnMessage := MOUSEWHEELMessage; //디비그리드에서 마우스 휠작동을 위한 Application Message 설정.
end;

procedure TFM_Main.FormActivate(Sender: TObject);
begin
     Application.ProcessMessages;

     Pempno   := PassEmp(cmdline,1);
     Pkorname := PassEmp(cmdline,2);
     Pgrade   := Passemp(cmdline,4);

     OraTable1.Active := True;

     if (Copy(Pempno,1,1) = 'D') or ((Copy(Pgrade,3,1) <= 'C') and (fn_YmanagerCheck)) then
     begin
          maintitle.Color    := clTeal;
          maintitle.Caption  := '월변동 자료 추출[파견직]';
          RGKind.ItemIndex   := 4;
          RGKind.Enabled     := false;
          BBallclear.Enabled := False;
     end
     else
     begin
          MessageBox(handle,'파견직 관리자 외에는 열람할 수 없습니다.','알 림',MB_OK or $0030);
          Close;
     end;

     Lempno.Caption := Pkorname+'('+Pempno+')';
     Lsysdate.caption := fn_getDateStr;

     W_worktype := '파견직';
end;

procedure TFM_Main.BBcloseClick(Sender: TObject);
begin
     Close;
end;

procedure TFM_Main.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin    
     OraTable1.Edit;
     // 갱신여부가 'Y'이면'N'로 'N'이면 'Y'로바꾼뒤 다음자료로 이동
     if (key = 32) then
     begin
          if(OraTable1moveyn.value = 'Y') then OraTable1moveyn.value := 'N'
          else                                 OraTable1moveyn.value := 'Y';

          OraTable1.post;

          if OraTable1.eof = False then OraTable1.Next;
     end;

end;

procedure TFM_Main.BBpriorClick(Sender: TObject);
begin
     OraTable1.prior;
end;

procedure TFM_Main.BBnextClick(Sender: TObject);
begin
     OraTable1.Next;
end;

procedure TFM_Main.BBoneclearClick(Sender: TObject);
var
     i : integer;
     F:  System.Text;
     tmp_Str : String;
     Tname, datafld : String;
     RetMsg :String;
     Rundate, ProgId, CmdStr  : String;  //서비스 개발...
     CsvFile : array[0..255] of Char;    //PCSS 복호화 작업
begin
     // 해당자료의 유뮤를 파악
     if OraTable1.RecordCount = 0 then
     begin
          Application.MessageBox('해당자료가 없습니다','작업안내',MB_OK+$0030);
          exit;
     end;

     tmp_Str := OraTable1DATANAME.Text + '를 추출하려고 합니다. 계속하시겠습니까?';

     if Application.MessageBox(pchar(tmp_Str), '작업안내', MB_YesNO+$0020) = ID_No then exit;

     // 갱신방식이 on line 이면
     if OraTable1MOVEKIND.Value = 'O' then
     begin
          Phelpmsg.Caption := ' '+OraTable1DATANAME.Text + '를 추출하고 있습니다';
          Application.ProcessMessages;

          // 자료 화일에서 급여 마스터로 자료를 copy
          with OraQuery1 do
          begin
               Close;
               SQL.Clear;
               SQL.Add('update pkmpmas p                  ');
               SQL.Add('   set '+OraTable1DATAFLD.Text     );

               if (OraTable1CLEARADD.Text = '0') then
                    SQL.Add(' = (select '+OraTable1FROMFLD.Text)
               else
                    SQL.Add(' = (select p.'+OraTable1DATAFLD.Text+'+'+OraTable1FROMFLD.Text);

               SQL.Add('                     from '+OraTable1.FieldByName('fromtbl').AsString+' r ');
               SQL.Add('                    where p.empno = r.empno     ');

               if   OraTable1WHEREFLD.Text = 'BONKIND' then SQL.Add('and nvl(bonyn,''N'') = ''Y'' ');//상여금지급여부 Setting Add..

               if   OraTable1WHEREFLD.text <> ''       then SQL.Add('and '+OraTable1WHEREFLD.Text+' = :L1 )')
               else                                         SQL.Add(' ) ');

               SQL.Add(' where p.empno like ''Y%'' ');

               SQL.Add(' and empno in (select empno ');
               SQL.Add('                from '+OraTable1.FieldByName('fromtbl').AsString        );

               if   OraTable1WHEREFLD.text <> '' then SQL.Add('  where '+OraTable1WHEREFLD.Text+' = :L1 )')
               else                                   SQL.Add(' )');

               if   OraTable1WHEREFLD.text <> '' then ParamByName('L1').AsString := OraTable1WHEREVALUE.text;
               //edit1.text:= sql.text;
               ExecSQL;
          end;
     end
     //=========================================================================
     // Diskette 작업일 경우
     else if OraTable1MOVEKIND.Value = 'D' then
     begin
          Phelpmsg.Caption := ' ' + OraTable1DATANAME.Text + '를 추출하고 있습니다';

          Application.ProcessMessages;

         {2015.04. 계정권한 분리작업 : 임시작업테이블을 고정작업테이블로 대체.  강륜종.
          Tname     := 'T_' + UpperCase(OraTable1DATAFLD.Text);
          Tname_emp := 'T_' + UpperCase(OraTable1DATAFLD.Text) + '_' + Pempno;

          // 임시 table이 존재하는지를 확인후 임시 table이 존재하면 다른 사용자가 프로그램을
          // 실행시키고 있는것이므로 나중에 다시 수행하도록 한다
          with OraQuery1 do
          begin
               Close;
               SQL.Clear;
               SQL.Add('select table_name       ');
               SQL.Add('  from user_tables      ');
               SQL.Add(' where table_name = :L1 ');
               ParamByName('L1').AsString := Tname_emp;
               Open;

               if RecordCount <> 0 then
               begin
                    if Application.MessageBox('이미 작업이 수행중입니다. 이 작업을 중지시키고 재작업 하시겠습니까?',
                                              '작업안내', MB_OKCANCEL + MB_DEFBUTTON1) = IDOK then
                    begin
                         Close;
                         SQL.Clear;
                         SQL.Add('Drop table '+Tname_emp+ '  Cascade Constraints ');
                         ExecSQL;
                    end
                    else exit;
               end;

               //DRMUnit.pas 참조... : PCSS 에 의한 엑셀파일 암호화 파일 Control...
               //fnEncryptFileChorus(OraTable1PCFILE.Text);//DRM 암호화...
               StrCopy(CsvFile, PChar(OraTable1PCFILE.Text));
               fnDecryptFileChorus(CsvFile);  //DRM Excel 파일 복호화 작업....dsa2000  2006.07.  추가...

               FileMode := 0;
               AssignFile(F, OraTable1PCFILE.Text);
               ReSet(F);

               if IOResult <> 0 then
               begin
                    tmp_Str := OraTable1PCFILE.Text + '가 존재하지 않습니다';
                    Application.MessageBox(pchar(tmp_Str), '작업안내', MB_OK+$0030);
                    CloseFile(F);
                    exit;
               end;

               CloseFile(F);

               Close;
               SQL.Clear;

               if Tname = 'T_NOJOYN' then  //dsa2000  2005.10. NOJOYN 인 경우 따로 varchar2 루틴타도록 추가.
                    SQL.Add('create table '+Tname_emp+ '(empno varchar2(4),tvalue varchar2(2)) ')
               else
                    SQL.Add('create table '+Tname_emp+ '(empno varchar2(4),tvalue number(12))  ');

               SQL.Add('storage (initial 32K next 8K minextents 1 maxextents 121 pctincrease 1)');
               ExecSQL;

               Close;
               SQL.Clear;
               SQL.Add('create index '+Tname_emp+'_I on '+Tname_emp+'(empno) ');
               SQL.Add(' storage (initial 8K next 32 minextents 1 maxextents 121 pctincrease 1)');
               ExecSQL;

               // PCfile을 host로 전송
               Phelpmsg.Caption := ' PCfile을 host로 전송하고 있습니다';
               Application.ProcessMessages;

               fileftp(passemp(cmdline,10), passemp(cmdline,11), passemp(cmdline,12), Tname,
                       '/hper/insa/HINSA/data/Kdata', OraTable1PCFILE.Text, RetMsg); ////MIS2 장비 이전에 따른 경로 수정 dsa2000 2004.05.

               Phelpmsg.caption := RetMsg;

               Phelpmsg.Caption := ' 자료를 임시 테이블에 삽입하고 있습니다';
               Application.ProcessMessages;

               Memo1.Clear;
               Rundate := Copy(fn_GetDateTimeStr,1,14);
               ProgId  := 'pkc1030g';
               CmdStr  := '/hper/insa/HINSA/proc/bin/Kbin/pkc1030g /hper/insa/HINSA/data/Kdata/'+Tname+' '+Tname_emp+' '+Pempno+' '+ProgId+' '+Rundate;
               Phelpmsg.Caption := ' 자료를 임시 테이블에 삽입하고 있습니다';
               Application.ProcessMessages;
          end;   }

          Tname := 'Y_' + UpperCase(OraTable1DATAFLD.Text);  //파견직 전용파일 분리.  2015.04.

          datafld := UpperCase(OraTable1DATAFLD.Text);

          //DRMUnit.pas 참조... : PCSS 에 의한 엑셀파일 암호화 파일 Control...
          StrCopy(CsvFile, PChar(OraTable1PCFILE.Text));
          //2015.08.25 eyha 보안문제로 실행하지 않도록 수정
          //fnDecryptFileChorus(CsvFile);  //DRM Excel 파일 복호화 작업....dsa2000  2006.07.  추가...

          FileMode := 0;   {Read Only}
          AssignFile(F, OraTable1PCFILE.Text);
          {$I-}
          ReSet(F);
          {$I+}

          if IOResult <> 0 then
          begin
               tmp_Str := OraTable1PCFILE.Text + '가 존재하지 않습니다';
               Application.MessageBox(pchar(tmp_Str), '작업안내', MB_OK+$0030);
               CloseFile(F);
               exit;
          end;
          CloseFile(F);

          // PCfile을 host로 전송
          Phelpmsg.Caption := ' PCfile을 host로 전송하고 있습니다';
          Application.ProcessMessages;

          fileftp(passemp(cmdline,10), passemp(cmdline,11), passemp(cmdline,12), Tname,
                  '/hper/insa/HINSA/data/Kdata', OraTable1PCFILE.Text, RetMsg);

          Phelpmsg.Caption := RetMsg;
          Phelpmsg.Caption := ' 자료를 임시 테이블에 삽입하고 있습니다';
          Application.ProcessMessages;

          Memo1.Clear;
          Rundate := Copy(fn_GetDateTimeStr,1,14);
          ProgId  := 'pkc1030g';
          CmdStr  := '/hper/insa/HINSA/proc/bin/Kbin/pkc1030g /hper/insa/HINSA/data/Kdata/'+Tname
                    +' '+datafld+' '+Pempno+' '+ProgId+' '+Rundate;
          //일단 여기까지////////////////////////////////////////////////////////////////////
          

          with TDS_batch do
          begin
               Close;
               ServiceName := 'HINSA_batch';
               ClearFieldInfo;
               ClearParamInfo;
               AddParam('cmdstr', 300, CmdStr);
               Execute;

               Close;
               ServiceName := 'SHR0SSEL';
               ClearFieldInfo;
               ClearParamInfo;
               AddField('RESULT', ftString, 5000);
               Sql.Text := Format('SELECT RESULT FROM PYBATLOG '+
                                  ' WHERE RUNDATE = ''%s''     '+
                                  '   AND PROGID  = ''%s''     '+
                                  ' ORDER BY to_number(SEQNO)  ',[Rundate, ProgId ]);
               Open;

               while not Eof do
               begin
                    Memo1.Lines.Add(FieldByName('RESULT').AsString);
                    Next;
               end;
          end;

          if Pos('OK',Memo1.Text ) <= 0 then
          begin
               Phelpmsg.Caption := '임시테이블 삽입 작업실패...';
               Application.ProcessMessages;
               Exit;
          end;

          // 사번중복을 check한다
          Phelpmsg.Caption := ' 사번중복을 check 합니다.';
          Application.ProcessMessages;

          with OraQuery1 do
          begin
               Close;
               SQL.Clear;
               {2015.04. 계정권한 분리작업 : 임시작업테이블을 고정작업테이블로 대체.  강륜종.
               SQL.Add('select empno               ');
               SQL.Add('  from ' + Tname_emp        );
               SQL.Add(' group by empno            ');
               SQL.Add('having count(empno) > 1    '); }
               SQL.Add('select empno                      ');
               SQL.Add('  from PKC1030G_Program           ');
               SQL.Add(' Where Workemp = '''+Pempno +'''  ');
               SQL.Add('   And Datafld = '''+datafld+'''  ');
               SQL.Add(' group by Workemp, Datafld, Empno ');
               SQL.Add('having count(empno) > 1           ');
               Open;

               if RecordCount <> 0 then  {  사번 중복  }
               begin
                    tmp_Str := OraTable1PCFILE.Text + ' 에 ';

                    for i := 1 to RecordCount - 1 do
                    begin
                         tmp_Str := tmp_Str + FieldByName('empno').AsString + ',';
                         OraQuery1.Next;
                    end;

                    tmp_Str := tmp_Str + FieldByName('empno').AsString;
                    tmp_Str := tmp_Str +'의 사번이 중복되었습니다 . 중복된 사번 삭제후 작업을 수행하세요';

                    Application.MessageBox(pchar(tmp_Str), '사번중복', MB_OK+$0030);

                    tmp_Str := 'notepad ' + OraTable1PCFILE.Text;
                    WinExec(pchar(tmp_Str), SW_SHOW);

                    {2015.04. 계정권한 분리작업 : 임시작업테이블을 고정작업테이블로 대체.  강륜종.
                    Close;   SQL.Clear;
                    SQL.Add('drop table ' + Tname_emp);    ExecSQL; }
                    exit;
               end;

               // 자료 화일에서 급여 마스터로 자료를 copy
               Phelpmsg.Caption := ' 자료 화일에서 급여 마스터로 자료를 copy 하고 있습니다';
               Application.ProcessMessages;

               { 삭제 2008.05.06 월 변동 자료 clear 에서 처리토록 함
               if  OraTable1DATAFLD.Text = 'NOJOYN' then  //dsa2000  2005.10. NOJOYN 인 경우 따로 루틴타도록 추가.
               begin
                    Close; SQL.Clear;
                    SQL.Add( 'update pkmpmas set nojoyn = ''N'' ');
                    SQL.Add( ' where pstate < ''80'' ');
                    ExecSQL;
               end;}

               {2015.04. 계정권한 분리작업 : 임시작업테이블을 고정작업테이블로 대체.  강륜종.
               SQL.Clear;
               SQL.Add('update pkmpmas p                               ');
               SQL.Add('   set ' + OraTable1DATAFLD.Text + ' =         ');
               if OraTable1CLEARADD.Text = '0' then
                    SQL.Add(' (select tvalue ' )
               else SQL.Add(' (select tvalue + p.' + OraTable1DATAFLD.Text);
               SQL.Add('         from ' + Tname_emp + ' r    ');
               SQL.Add('        where p.empno = r.empno)     ');
               SQL.Add(' where empno in (select empno              ');
               SQL.Add('                   from ' + Tname_emp + ') ');
               ExecSQL;
               SQL.Clear;
               SQL.Add('drop table '+Tname_emp);
               ExecSQL;                 }
               Close;
               SQL.Clear;
               SQL.Add('update pkmpmas p                               ');
               SQL.Add('   set ' + OraTable1DATAFLD.Text + ' =         ');

               if Tname = 'T_NOJOYN'  then                 //노조원여부 Add  2015.04.
                    SQL.Add(' (select Charvalue ' )
               else if OraTable1CLEARADD.Text = '0' then  //Rewrite
                    SQL.Add(' (select Numvalue ' )
               else SQL.Add(' (select Numvalue + p.' + OraTable1DATAFLD.Text);
               
               SQL.Add('         from PKC1030G_Program r                   ');
               SQL.Add('        Where p.empno = r.empno                    ');
               SQL.Add('          And Workemp = '''+Pempno +'''            ');
               SQL.Add('          And Datafld = '''+datafld+''' )          ');
               SQL.Add(' Where empno in (select empno                      ');
               SQL.Add('                   from PKC1030G_Program           ');
               SQL.Add('                  Where Workemp = '''+Pempno +'''  ');
               SQL.Add('                    And Datafld = '''+datafld+''' )');
               ExecSQL;
          end;
     end;

     // 갱신된 인원과 금액을 구한다
     Phelpmsg.caption := ' 갱신된 인원과 금액 추출중';

     Application.ProcessMessages;

     with OraQuery1 do
     begin
          Close;
          SQL.Clear;
          if  OraTable1DATAFLD.Text = 'NOJOYN' then  //dsa2000  2005.10. NOJOYN 인 경우 따로 루틴타도록 추가.
          begin
               SQL.Add('select count(empno) a, count(' + OraTable1DATAFLD.Text + ') b          ');
               SQL.Add('  from pkmpmas                                                         ');
               SQL.Add(' where empno like ''Y%''                                               ');
               SQL.Add('   and payyn = ''Y''                                                   ');
               SQL.Add('   and ' + OraTable1DATAFLD.Text + ' = ''Y''                           ');
          end
          else
          begin
               SQL.Add('select count(empno) a, sum(' + OraTable1DATAFLD.Text + ') b            ');
               SQL.Add('  from pkmpmas                                                         ');
               SQL.Add(' where empno like ''Y%''                                               ');
               SQL.Add('   and payyn = ''Y'' and ' + OraTable1DATAFLD.Text + ' <> 0            ');
          end;
          open;

          OraTable1.Edit;
          OraTable1MOVECNT.value := FieldByName('a').AsInteger;
          OraTable1MOVEAMT.value := FieldByName('b').AsFloat;
     end;

     // 갱신된 시간을 구한다
     OraTable1.Edit;
     //2013.05.20.hjku. 작업자 등록 추가
     OraTable1MOVEMAN.Text  := Pempno;
     OraTable1MOVETIME.Text := Fn_GetDateTimeStr;


     //2015.11.20 eyha 저장하기전 변경현 값을 저장함
     V_datano        := OraTable1.FieldByName('datano').AsString      ;
     V_dataname      := OraTable1.FieldByName('dataname').AsString    ;
     V_datafld       := OraTable1.FieldByName('datafld').AsString     ;
     V_clearadd      := OraTable1.FieldByName('clearadd').AsString    ;
     V_monthyn       := OraTable1.FieldByName('monthyn').AsString     ;
     V_pcfile        := OraTable1.FieldByName('pcfile').AsString      ;
     V_movekind      := OraTable1.FieldByName('movekind').AsString    ;
     V_fromtbl       := OraTable1.FieldByName('fromtbl').AsString     ;
     V_fromfld       := OraTable1.FieldByName('fromfld').AsString     ;
     V_wherefld      := OraTable1.FieldByName('wherefld').AsString    ;
     V_wherevalue    := OraTable1.FieldByName('wherevalue').AsString  ;

     //2015.11.20 eyha 작업이력 저장
     if not Save_History('월변동 자료 추출','수정',Pempno,W_worktype,'',OraTable1.FieldByName('DATANAME').AsString) then
     begin
        MessageDlg('작업이력저장이 실패 하였습니다...',mtError, [mbOk], 0);
        exit;
     end;


     Phelpmsg.Caption := ' '+OraTable1DATANAME.Text + ' 추출작업을 완료하였습니다';
     Application.ProcessMessages;
     OraTable1.Post;                                                            
     OraTable1.refresh;
end;

procedure TFM_Main.BBallclearClick(Sender: TObject);
var
     tmp_Str : String;
     qq : TOraQuery;
begin
     if RGKind.ItemIndex = 3 then
     begin
          Application.MessageBox('디스켓 작업은 전체 갱신작업을 할수 없습니다','작업안내',MB_OK+$0030);
          exit;
     end;

     if OraTable1.RecordCount = 0 then
     begin
          Application.MessageBox('추출대상이 없습니다','작업안내',MB_OK+$0030);
          exit;
     end;

     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     try
          with qq do
          begin
               Close;
               SQL.Clear;
               SQL.Add('select datano                ');
               SQL.Add('  from pkmpfld               ');
               SQL.Add(' where monthyn= ''Y''        ');
               SQL.Add('   and movekind = :movekind  ');
               SQL.Add('   and moveyn = ''Y''        ');

               if RGKind.ItemIndex = 0 then
               begin
                    SQL.Add('   and datakind = :datakind  ');
                    ParamByName('movekind').AsString := 'O';
                    ParamByName('datakind').AsString := '0';
               end
               else if RGKind.ItemIndex = 1 then
               begin
                    SQL.Add('   and datakind = :datakind  ');
                    ParamByName('movekind').AsString := 'O';
                    ParamByName('datakind').AsString := '1';
               end
               else if RGKind.ItemIndex = 2 then
               begin
                    SQL.Add('   and datakind = :datakind  ');
                    ParamByName('movekind').AsString := 'O';
                    ParamByName('datakind').AsString := '2';
               end
               else if RGkind.ItemIndex = 3 then
               begin
                    ParamByName('movekind').AsString := 'D';
               end
               else if RGkind.ItemIndex = 4 then
               begin
                    SQL.Add('   and datakind = :datakind  ');
                    ParamByName('movekind').AsString := 'O';
                    ParamByName('datakind').AsString := '3';
               end;

               Open;

               if RecordCount = 0 then
               begin
                    Application.MessageBox('추출대상이 없습니다','작업안내',MB_OK);
                    exit;
               end;

               tmp_Str := IntToStr(RecordCount) +'건의 항목자료를 추출하려 합니다. 계속할까요?';

               if Application.MessageBox(pchar(tmp_Str), '작업안내', MB_YesNo) = ID_No then exit;

               OraTable1.First;

               while not OraTable1.eof do
               begin
                    if OraTable1MOVEYN.Text = 'Y' then
                    begin
                         Phelpmsg.Caption := ' ['+IntToStr(OraTable1.RecNo)+'/'+IntToStr(OraTable1.RecordCount)+'] '
                                          + OraTable1DATANAME.Text + '를 추출중';
                         Application.ProcessMessages;

                         Close;
                         SQL.Clear;
                         SQL.Add('update pkmpmas p                 ');
                         SQL.Add('   set '+OraTable1DATAFLD.Text+' ');

                         if (OraTable1CLEARADD.Text = '0') then
                              SQL.Add(' = (select '+OraTable1FROMFLD.AsString)
                         else
                              SQL.Add(' = (select p.'+OraTable1DATAFLD.Text+'+'+OraTable1FROMFLD.AsString);

                         //SQL.Add(' = (select '+OraTable1FROMFLD.AsString+'                     ');
                         SQL.Add('      from '+OraTable1.FieldByName('fromtbl').AsString + ' r ');
                         SQL.Add('     where p.empno = r.empno                                 ');

                         if (OraTable1WHEREFLD.value <> '') then
                              SQL.Add('and '+OraTable1WHEREFLD.Text+' = :L1)')
                         else SQL.Add(')');

                         SQL.Add(' where p.empno like ''Y%''     ');

                         if (OraTable1WHEREFLD.value <> '') then ParamByName('L1').AsString := OraTable1WHEREVALUE.Text;

                         ExecSQL;

                         Phelpmsg.caption := ' ['+IntToStr(OraTable1.RecNo)+'/'+IntToStr(OraTable1.RecordCount)+'] '
                                           + '갱신된 인원과 금액 추출중...';
                         Application.ProcessMessages;

                         Close;
                         SQL.Clear;
                         //dsa2000  2005.10. NOJOYN 인 경우 따로 루틴타도록 추가.
                         //2001.10.08 유효성 갱신건수/금액 추출시 < 0  포함.
                         if  OraTable1DATAFLD.Text = 'NOJOYN' then
                         begin
                              SQL.Add('select count(empno) a,                     ');
                              SQL.Add('       count('+OraTable1DATAFLD.Text+') b  ');
                              SQL.Add('  from pkmpmas                             ');
                              SQL.Add(' where payyn = ''Y''                       ');
                              SQL.Add('   and '+OraTable1DATAFLD.Text+' = ''Y''                    ');
                         end
                         else
                         begin
                              SQL.Add('select count(empno) a,                  ');
                              SQL.Add('       sum('+OraTable1DATAFLD.Text+') b ');
                              SQL.Add('  from pkmpmas                          ');
                              SQL.Add(' where payyn = ''Y''                    ');
                              SQL.Add('   and '+OraTable1DATAFLD.Text+' <> 0   ');
                         end;

                         SQL.Add(' and empno like ''Y%'' ');

                         open;


                         OraTable1.Edit;
                         OraTable1MOVECNT.value := FieldByName('a').AsInteger;
                         OraTable1MOVEAMT.value := FieldByName('b').AsFloat;

                         //2013.05.20.hjku. 작업자 등록 추가
                         OraTable1MOVEMAN.Text  := Pempno;
                         OraTable1MOVETIME.Text := Fn_GetDateTimeStr;

                         //2015.11.20 eyha 저장하기전 변경현 값을 저장함
                         V_datano        := OraTable1.FieldByName('datano').AsString      ;
                         V_dataname      := OraTable1.FieldByName('dataname').AsString    ;
                         V_datafld       := OraTable1.FieldByName('datafld').AsString     ;
                         V_clearadd      := OraTable1.FieldByName('clearadd').AsString    ;
                         V_monthyn       := OraTable1.FieldByName('monthyn').AsString     ;
                         V_pcfile        := OraTable1.FieldByName('pcfile').AsString      ;
                         V_movekind      := OraTable1.FieldByName('movekind').AsString    ;
                         V_fromtbl       := OraTable1.FieldByName('fromtbl').AsString     ;
                         V_fromfld       := OraTable1.FieldByName('fromfld').AsString     ;
                         V_wherefld      := OraTable1.FieldByName('wherefld').AsString    ;
                         V_wherevalue    := OraTable1.FieldByName('wherevalue').AsString  ;

                         //2015.11.20 eyha 작업이력 저장
                         if not Save_History('월변동 자료 추출','수정',Pempno,W_worktype,'',OraTable1.FieldByName('DATANAME').AsString) then
                         begin
                            MessageDlg('작업이력저장이 실패 하였습니다...',mtError, [mbOk], 0);
                            exit;
                         end;

                         OraTable1.Post;

                         Phelpmsg.Caption := ' ['+IntToStr(OraTable1.RecNo)+'/'+IntToStr(OraTable1.RecordCount)+'] '
                                           + OraTable1DATANAME.Text + ' 추출작업을 완료하였습니다';
                    end;

                    OraTable1.Next;

               end; { end of while }
          end;

     finally
          qq.Free;
     end;

     Phelpmsg.Caption := ' 총 '+IntToStr(OraTable1.RecordCount)+'건의 항목이 추출되었습니다';
end;

procedure TFM_Main.RGKindClick(Sender: TObject);
begin
     W_worktype := '정규직';

     if (RGKind.ItemIndex <> 4) then
     begin
          Application.MessageBox('정규직 사번에 대한 작업을'+#13+
                                 '할 수 없습니다.','작업안내',MB_OK+$0030);
          RGKind.ItemIndex := 4;
          System.Exit;
     end;

     case RGKind.ItemIndex of
          0 :
          begin
               OraTable1.Refresh;
               OraTable1.Filter := '(monthyn=''Y'') and (movekind=''O'') and (datano >= ''000'' and datano <= ''099'') ';
               OraTable1.Filtered := True;
          end;
          1 :
          begin
               OraTable1.Refresh;
               OraTable1.Filter := '(monthyn=''Y'') and (movekind=''O'') and (datano >= ''100'' and datano <= ''199'') ';
               OraTable1.Filtered := True;
          end;
          2 :
          begin
               OraTable1.Refresh;
               OraTable1.Filter := '(monthyn=''Y'') and (movekind=''O'') and (datano >= ''200'' and datano <= ''299'') ';
               OraTable1.Filtered := True;
          end;
          3 :
          begin
               OraTable1.Refresh;
               OraTable1.Filter := '(monthyn=''Y'') and (movekind=''D'') and (datano >= ''000'' and datano <= ''299'') ';
               OraTable1.Filtered := True;
          end;
          4 :
          begin
               OraTable1.Refresh;
               OraTable1.Filter := '(monthyn=''Y'') and (datano >= ''300'' and datano <= ''399'')                      ';
               OraTable1.Filtered := True;

               W_worktype := '파견직';
          end;
     end;

end;

procedure TFM_Main.BBoneclearExit(Sender: TObject);
begin
     Phelpmsg.Caption := '';
end;

procedure TFM_Main.BBallclearExit(Sender: TObject);
begin
     Phelpmsg.Caption := '';
end;

procedure TFM_Main.DBGrid1DblClick(Sender: TObject);
begin
     OraTable1.Edit;

     if(OraTable1moveyn.value = 'Y') then OraTable1moveyn.value := 'N'
     else                                 OraTable1moveyn.value := 'Y';

     OraTable1.post;
end;


procedure TFM_Main.BBsearchClick(Sender: TObject);
begin                                   
     with FM_Sub.OraQuery1 do
     begin
          Close;
          SQL.Clear;
          if  OraTable1DATAFLD.Text = 'NOJOYN' then  //dsa2000  2005.10. NOJOYN 인 경우 따로 루틴타도록 추가.
          begin
               SQL.Add('select a.empno,                                                     ');
               SQL.Add('       a.korname,                                                   ');
               SQL.Add('       a.paycl,                                                     ');
               SQL.Add('       a.paygr,                                                     ');
               SQL.Add('       a.pstate,                                                    ');
               SQL.Add('       a.'+OraTable1DATAFLD.Text+' a,                               ');
               SQL.Add('       b.cnt,                                                       ');
               SQL.Add('       b.amtsum                                                     ');
               SQL.Add('  from pkmpmas a,                                                   ');
               SQL.Add('       (select Count(*) cnt,                                        ');
               SQL.Add('               ''--'' amtsum                                        ');
               SQL.Add('          from pkmpmas                                              ');
               SQL.Add('         where (payyn = ''N'' or '+OraTable1DATAFLD.Text+' = ''N'') ');
               //2016.12.26 jissi 임단협 관련(J사번 숫자사번 변환)
               //SQL.Add('           and substr(empno,1,1) not in (''J'',''P'',''Q'',''M'')   ');
               SQL.Add('           and substr(empno,1,1) not in (''P'',''Q'',''M'')         ');
               SQL.Add('           and paycl not in (''H10'')                               ');
               SQL.Add('           and empno like ''Y%''                                    ');

               SQL.Add('           and pstate < ''80'') b                                   ');
               SQL.Add(' where (payyn = ''N'' or '+OraTable1DATAFLD.Text+' = ''N'')         ');
               //2016.12.26 jissi 임단협 관련(J사번 숫자사번 변환)
               //SQL.Add('   and substr(empno,1,1) not in (''J'',''P'',''Q'',''M'')           ');
               SQL.Add('   and substr(empno,1,1) not in (''P'',''Q'',''M'')                 ');
               SQL.Add('   and paycl not in (''H10'')                                       ');
               SQL.Add('   and pstate < ''80''                                              ');
          end
          else
          begin
               SQL.Add('select a.empno,                                                     ');
               SQL.Add('       a.korname,                                                   ');
               SQL.Add('       a.paycl,                                                     ');
               SQL.Add('       a.paygr,                                                     ');
               SQL.Add('       a.pstate,                                                    ');
               SQL.Add('       a.'+OraTable1DATAFLD.Text+' a,                               ');
               SQL.Add('       b.cnt,                                                       ');
               SQL.Add('       b.amtsum                                                     ');
               SQL.Add(' from pkmpmas a,                                                    ');
               SQL.Add('      (select Count(*) cnt,                                         ');
               SQL.Add('              sum('+OraTable1DATAFLD.Text+') amtsum                 ');
               SQL.Add('         from pkmpmas                                               ');
               SQL.Add('        where payyn=''N'' and '+OraTable1DATAFLD.Text+'<>0          ');
               SQL.Add('          and empno like ''Y%''                                     ');

               SQL.Add('        ) b                                                         ');
               SQL.Add(' where payyn=''N'' and '+OraTable1DATAFLD.Text+' <> 0               ');
          end;

          //2008.05.06. 추가
          SQL.Add(' and a.empno like ''Y%''                                                 ');

          open;

          if RecordCount = 0 then
          begin
               Application.MessageBox('지급/공제 불가자 대상에 해당하는 사원이 없습니다','작업안내',MB_OK);
               Exit;
          end;

     end;

     FM_Sub.ShowModal;
     OraTable1.Refresh;
end;

procedure TFM_Main.MOUSEWHEELMessage(var Msg: TMsg;
  var Handled: Boolean);
begin
     if Msg.Message = WM_MOUSEWHEEL then
     begin
          if ActiveControl = TControl(DBGrid1) then
          Begin
               if Msg.wParam > 0 then
               begin
                   keybd_event(VK_UP, VK_UP, 0, 0);
                   keybd_event(VK_UP, VK_UP, KEYEVENTF_KEYUP, 0);
               end
               else if Msg.wParam < 0 then begin
                   keybd_event(VK_DOWN, VK_DOWN, 0, 0);
                   keybd_event(VK_DOWN, VK_DOWN, KEYEVENTF_KEYUP, 0);
               end;
               ActiveControl.Invalidate;
          end;
     end;
end;



Function TFM_Main.Save_History(progid, modflag, modemp, worktype, empno, dataname : String) : Boolean;
var
  qq : TOraQuery;
  V_RECDATA, V_REMARK : string;
begin
  qq := TOraQuery.Create(nil);
  qq.Session := Ora_Session;

  V_RECDATA := '항목번호:'     +  V_datano    + '||'
             + '항목명:'       + V_dataname   + '||'
             + '필드명:'       + V_datafld    + '||'
             + '작업방식:'     + V_clearadd   + '||'
             + '월변동여부:'   + V_monthyn    + '||'
             + 'PC화일:'       + V_pcfile     + '||'
             + '갱신방식:'     + V_movekind   + '||'
             + '자료화일:'     + V_fromtbl    + '||'
             + '자료필드명:'   + V_fromfld    + '||'
             + '조건필드:'     + V_wherefld   + '||'
             + '조건값:'       + V_wherevalue
             ;
  V_REMARK  := '월변동 자료 추출에서 자료를 저장';

  with qq do
  begin
       Close;
       SQL.Clear;
       SQL.Add('call HPER.PKHPHIS_LOG (                        ');
       SQL.Add('        '''+ progid     +''',                  ');  //프로그램 ID
       SQL.Add('        '''+ modflag    +''',                  ');  //변경구분
       SQL.Add('        '''+ modemp     +''',                  ');  //작업자
       SQL.Add('        '''+ worktype   +''',                  ');  //작업구분
       SQL.Add('        '''+ empno      +''',                  ');  //대상사번
       SQL.Add('        '''+ dataname   +''',                  ');  //급여항목명
       SQL.Add('        '''+ V_RECDATA  +''',                  ');  //변경전내용
       SQL.Add('        '''+ V_REMARK   +'''                   ');  //작업내용
       SQL.Add('                         )                     ');

       try
            ExecSql;
       except
            Result := false;
            exit;
       end;
       Result := True;
  end;
end;


end.
