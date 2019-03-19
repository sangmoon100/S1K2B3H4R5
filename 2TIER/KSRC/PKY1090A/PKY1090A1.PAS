{-------------------------------------------------------------------------------
 PROGRAM-NAME   : PKY1090A(월변동 자료항목 Clear)
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 파견용역비
 Programmer     : 지순미
 Version        : 1.0
 Date           : 2017.01.20
Update Contents
  버전    수정일       수정자  관련근거       수정내용
  1.00    2017.01.20   지순미  PKC1020G 정규직 소스에서 파견직 분리
--------------------------------------------------------------------------------}
unit PKY1090A1;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, DB, DBTables,
  Pass, MemDS, DBAccess, Ora, OraSmart, Func;

type
  TFM_Main = class(TForm)
    Phelpmsg: TPanel;
    Panel19: TPanel;
    Lempno: TLabel;
    Lsysdate: TLabel;
    Panel4: TPanel;
    bt_prior: TBitBtn;
    bt_next: TBitBtn;
    BBclose: TBitBtn;
    BBone: TBitBtn;
    BBall: TBitBtn;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    maintitle: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    RBgive: TRadioButton;
    RBdeduction: TRadioButton;
    RBcommon: TRadioButton;
    RBcalc: TRadioButton;
    RBall: TRadioButton;
    OraTable1: TOraTable;
    OraTable1DATANO: TStringField;
    OraTable1DATAKIND: TStringField;
    OraTable1DATANAME: TStringField;
    OraTable1DATAFLD: TStringField;
    OraTable1STTKIND: TStringField;
    OraTable1MONTHYN: TStringField;
    OraTable1MOVEKIND: TStringField;
    OraTable1FROMTBL: TStringField;
    OraTable1FROMFLD: TStringField;
    OraTable1WHEREFLD: TStringField;
    OraTable1WHEREVALUE: TStringField;
    OraTable1PCFILE: TStringField;
    OraTable1HANCODE: TStringField;
    OraTable1WORKTIME: TStringField;
    OraTable1WORKMAN: TStringField;
    OraTable1WORKTEL: TStringField;
    OraTable1WORKCNT: TIntegerField;
    OraTable1CLEARYN: TStringField;
    OraTable1CLEARTIME: TStringField;
    OraTable1MOVEYN: TStringField;
    OraTable1MOVETIME: TStringField;
    OraTable1MOVECNT: TIntegerField;
    OraTable1MOVEAMT: TFloatField;
    OraTable1MOVEMAN: TStringField;
    OraTable1SOGUBYN: TStringField;
    OraTable1WRITETIME: TStringField;
    OraTable1WRITEMAN: TStringField;
    OraTable1WORKAMT: TFloatField;
    OraTable1CLEARADD: TStringField;
    OraTable1ROWID: TStringField;
    Qry_tmp: TOraQuery;
    function  process_clear:boolean;
    procedure BBcloseClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure bt_priorClick(Sender: TObject);
    procedure bt_nextClick(Sender: TObject);
    procedure BBoneClick(Sender: TObject);
    procedure BBallClick(Sender: TObject);
    procedure RBcommonClick(Sender: TObject);
    procedure RBgiveClick(Sender: TObject);
    procedure RBdeductionClick(Sender: TObject);
    procedure OraTable1NewRecord(DataSet: TDataSet);
    procedure RBcalcClick(Sender: TObject);
    procedure RBallClick(Sender: TObject);
    procedure BBoneExit(Sender: TObject);
    procedure BBallExit(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);

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

{$R *.DFM}


procedure TFM_Main.FormActivate(Sender: TObject);
begin
     Application.ProcessMessages;

     Pempno   := PassEmp(cmdline,1);
     Pkorname := PassEmp(cmdline,2);
     Pgrade   := Passemp(cmdline,4);

     OraTable1.Active := True;

     if (Copy(Pempno,1,1) = 'D') or ((Copy(Pgrade,3,1) <= 'C') and (fn_YmanagerCheck)) then
     begin
          maintitle.Color := clTeal;
          maintitle.Caption := '월변동 자료항목 Clear[파견직]';
          RBcommon.Enabled := False;
          RBgive.Enabled := False;
          RBdeduction.Enabled := False;
          RBall.Enabled := False;
          RBcalc.Checked := True;
     end
     else
     begin
          MessageBox(handle,'파견직 관리자 외에는 열람할 수 없습니다.','알 림',MB_OK or $0030);
          Close;
     end;
     
     Lempno.Caption := Pkorname+'('+Pempno+')';
     Lsysdate.caption := Fn_GetDateStr;

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

     if (key = 32) then
     begin
          if OraTable1CLEARYN.value = 'Y' then OraTable1CLEARYN.value := 'N'
          else                                 OraTable1CLEARYN.value := 'Y';

          OraTable1.Post;

          if OraTable1.eof = False then OraTable1.Next;
     end;

end;

procedure TFM_Main.bt_priorClick(Sender: TObject);
begin
     OraTable1.prior;
end;

procedure TFM_Main.bt_nextClick(Sender: TObject);
begin
     OraTable1.Next;
end;

procedure TFM_Main.BBoneClick(Sender: TObject);
var
     tmp_Str  : String;
//     qq : TOraQuery;
begin
     if  OraTable1.Recordcount = 0 then
     begin
          Application.MessageBox('clear할 자료가 없습니다.','작업안내',MB_OK);
          exit;
     end;

     tmp_Str := OraTable1DATANAME.Text + '을(를) clear하려고 합니다. 계속하시겠습니까?';

     if Application.MessageBox(pchar(tmp_Str), '작업안내', MB_YesNo) = ID_No then exit;

     OraTable1.Edit;

     Phelpmsg.Caption := OraTable1.FieldByName('dataname').AsString + '을(를) clear 하고 있습니다';

     Application.ProcessMessages;

     if(not process_clear) then exit;

{2008.05.06. 공통모듈 통합
     OraTable1.FieldByName('moveamt').AsFloat := 0;
     OraTable1.FieldByName('movecnt').AsFloat := 0;
     OraTable1.FieldByName('movetime').AsString := '';
     OraTable1.FieldByName('moveman').AsString := '';

     OraTable1CLEARTIME.Text := Fn_GetDateTimeStr;
     OraTable1WRITETIME.Text := Fn_GetDateTimeStr;

     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     try
          with qq do
          begin
               Close;
               SQL.Clear;
               SQL.Add('update pkmpmas set '+ OraTable1DATAFLD.Text + '= ''0'' ');
               SQL.Add(' where empno like ''Y%''                               ');

               ExecSQL;

               Close;
               SQL.Clear;
               SQL.Add('select sum(' + OraTable1DATAFLD.Text + ') amtsum  ');
               SQL.Add('  from pkmpmas                                    ');
               SQL.Add(' where empno like ''Y%''                          ');

               Open;

               if FieldByName('amtsum').AsInteger <> 0 then
               begin
                    tmp_Str := '['+OraTable1.FieldByName('DATANAME').AsString + '] clear 작업 실패했습니다.';
                    Application.MessageBox(pchar(tmp_Str), '작업안내', MB_OK+$0030);
                    Exit;
               end;
          end;
     finally
          qq.Free;
     end;
}     

     OraTable1.Post;

     Phelpmsg.Caption := OraTable1.FieldByName('dataname').AsString + '을(를) clear 하였습니다.';

     Application.ProcessMessages;
end;

function TFM_Main.process_clear:boolean;
var
   tmp_Str : String;
begin
    result := false;

    OraTable1.FieldByName('moveamt').AsFloat   := 0;
    OraTable1.FieldByName('movecnt').AsFloat   := 0;
    OraTable1.FieldByName('movetime').AsString := '';
    OraTable1.FieldByName('moveman').AsString  := '';

    OraTable1CLEARTIME.Text := Fn_GetDateTimeStr;
    //2015.11.19 eyha movetime만 저장하고 갱신일자는 저장되지 않도록 수정
    //OraTable1WRITETIME.Text := Fn_GetDateTimeStr;

    with Qry_tmp do
    begin
        Close;
        SQL.Clear;

        if(OraTable1DATAFLD.Text='NOJOYN') then
            SQl.Add('update pkmpmas set '+ OraTable1DATAFLD.Text + '= ''N'' ')
        else
            SQl.Add('update pkmpmas set '+ OraTable1DATAFLD.Text + '= 0     ');

        SQL.Add(' where empno like ''Y%''                                   ');

        ExecSQL;

        Close;
        SQL.Clear;
        if(OraTable1DATAFLD.Text='NOJOYN') then
            SQL.Add('select sum(DECODE(NOJOYN,''N'',0,1)) amtsum            ')
        else
            SQL.Add('select sum(' +OraTable1DATAFLD.Text + ') amtsum        ');
        SQL.Add('  from pkmpmas                                             ');

        SQL.Add(' where empno like ''Y%''                                   ');
        
        Open;

        if FieldByName('amtsum').AsInteger <> 0 then
        begin
            tmp_Str :=  '['+OraTable1.FieldByName('DATANAME').AsString + '] clear 작업 실패했습니다.'+ #13 +
                        '  운영자에게 문의 하세요.' ;
            Application.MessageBox(pchar(tmp_Str), '작업안내',mb_Ok);
            Exit;
        end;
    end;

    //2015.11.13 eyha 저장하기전 변경전 값을 저장함
    V_datano        := OraTable1.FieldByName('DATANO').AsString      ;
    V_dataname      := OraTable1.FieldByName('DATANAME').AsString    ;


    //2015.11.17 eyha 작업이력 저장
    if not Save_History('월변동 자료항목 Clear','수정',Pempno,W_worktype,'',OraTable1.FieldByName('DATANAME').AsString) then
    begin
        MessageDlg('작업이력저장이 실패 하였습니다...',mtError, [mbOk], 0);
        exit;
    end;

    result := true;
end;

procedure TFM_Main.BBallClick(Sender: TObject);
var
   qq : TOraQuery;
   tmp_Str : String;

begin
     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     try
          with qq do
          begin
               Close;
               SQL.Clear;
               SQL.Add('select datano             ');
               SQL.Add('  from pkmpfld            ');
               SQL.Add(' where clearyn = ''Y''    ');
               SQL.Add('   and monthyn = ''Y''    ');

               if      RBcommon.Checked    = True  then SQL.Add('   and datakind  = ''0'' ')
               else if RBgive.Checked      = True  then SQL.Add('   and datakind  = ''1'' ')
               else if RBdeduction.Checked = True  then SQL.Add('   and datakind  = ''2'' ')
               else if RBcalc.Checked      = True  then SQL.Add('   and datakind  = ''3'' ')
               else if RBAll.Checked       = True  then SQL.Add('   and datakind <> ''3'' ');
               Open;

               if RecordCount = 0 then
               begin
                    MessageDlg('clear 할 항목이 없습니다.', mtInformation, [MBOK], 0);
                    Exit;
               end;

               tmp_Str := IntToStr(OraTable1.RecordCount) + '건의 항목을 Clear 하려고 합니다. 계속 하시곗습니까?';

               if Application.MessageBox(pchar(tmp_Str), '작업안내', MB_YesNo) = ID_NO then Exit;
          end;
     finally
          qq.Free;
     end;

     OraTable1.First;

     while not(OraTable1.eof) do
     begin
          if OraTable1CLEARYN.value = 'Y' then
          begin
               OraTable1.Edit;

               Phelpmsg.Caption := ' ['+IntToStr(OraTable1.RecNo)+'/'+IntToStr(OraTable1.RecordCount)+'] '
                                 + OraTable1.FieldByName('dataname').AsString + '을(를) clear 중...';

               Application.ProcessMessages;

{2008.05.06 공통모듈 통합
               OraTable1.FieldByName('moveamt').AsFloat   := 0;
               OraTable1.FieldByName('movecnt').AsFloat   := 0;
               OraTable1.FieldByName('movetime').AsString := '';
               OraTable1.FieldByName('moveman').AsString  := '';

               OraTable1CLEARTIME.Text := Fn_GetDateTimeStr;
               OraTable1WRITETIME.Text := Fn_GetDateTimeStr;

               qq := TOraQuery.Create(nil);
               qq.Session := Ora_Session;

               try
                    with qq do
                    begin

                         Close;
                         SQL.Clear;
                         SQl.Add('update pkmpmas set '+ OraTable1DATAFLD.Text + '= ''0'' ');
                         SQL.Add(' where empno like ''Y%'' ')

                         ExecSQL;

                         Close;
                         SQL.Clear;
                         SQL.Add('select sum(' +OraTable1DATAFLD.Text + ') amtsum ');
                         SQL.Add('  from pkmpmas                                  ');
                         SQL.Add(' where empno like ''Y%'' ')

                         Open;

                         if FieldByName('amtsum').AsInteger <> 0 then
                         begin
                             tmp_Str := '['+OraTable1.FieldByName('DATANAME').AsString + '] clear 작업 실패했습니다.'+ #13 +
                                        '  운영자에게 문의 하세요.' ;
                             Application.MessageBox(pchar(tmp_Str), '작업안내',mb_Ok);
                             Exit;
                         end;

                         Phelpmsg.Caption := ' ['+IntToStr(OraTable1.RecNo)+'/'+IntToStr(OraTable1.RecordCount)+'] '
                                           + OraTable1.FieldByName('dataname').AsString + '을(를) clear 작업을 완료하였습니다';
                         Application.ProcessMessages;
                    end;
               finally
                    qq.Free;
               end;
}
                if(not process_clear) then exit;

               Phelpmsg.Caption := ' [' +IntToStr(OraTable1.RecNo)+'/'+IntToStr(OraTable1.RecordCount)+'] '
                                        + OraTable1.FieldByName('dataname').AsString + '을(를) clear 작업을 완료하였습니다';
               Application.ProcessMessages;
          end;

          OraTable1.Next;
     end;

     MessageBeep(MB_OK);

     PHelpmsg.Caption := ' 총 '+IntToStr(OraTable1.RecordCount)+'건의 clear 작업이 수행되었습니다';

end;

procedure TFM_Main.RBcommonClick(Sender: TObject);
begin
     OraTable1.Refresh;
     OraTable1.Filter := 'datano >= ''000'' and datano <= ''099'' and monthyn = ''Y'' ';
     OraTable1.Filtered := True;
     DBGrid1.SetFocus;

     W_worktype := '정규직';
end;

procedure TFM_Main.RBgiveClick(Sender: TObject);
begin
     OraTable1.Refresh;
     OraTable1.Filter := 'datano >= ''100'' and datano <= ''199'' and monthyn = ''Y'' ';
     OraTable1.Filtered := True;
     DBGrid1.SetFocus;

     W_worktype := '정규직';
end;

procedure TFM_Main.RBdeductionClick(Sender: TObject);
begin
     OraTable1.Refresh;
     OraTable1.Filter := 'datano >= ''200'' and datano <= ''299'' and monthyn = ''Y'' ';
     OraTable1.Filtered := True;
     DBGrid1.SetFocus;

     W_worktype := '정규직';
end;

procedure TFM_Main.OraTable1NewRecord(DataSet: TDataSet);
begin
     OraTable1CLEARYN.value := 'N';
end;

procedure TFM_Main.RBcalcClick(Sender: TObject);
begin
     OraTable1.Refresh;
     OraTable1.Filter := 'datano >= ''300'' and datano <= ''399'' and monthyn = ''Y'' ';
     OraTable1.Filtered := True;
     DBGrid1.SetFocus;

     W_worktype := '파견직';
end;

procedure TFM_Main.RBallClick(Sender: TObject);
begin
     OraTable1.Refresh;
     OraTable1.Filter := 'datano >= ''000'' and datano <= ''299'' and monthyn = ''Y'' ';
     OraTable1.Filtered := True;
     DBGrid1.SetFocus;

     W_worktype := '정규직';
end;

procedure TFM_Main.BBoneExit(Sender: TObject);
begin
     Phelpmsg.Caption := '';
end;

procedure TFM_Main.BBallExit(Sender: TObject);
begin
     Phelpmsg.Caption := '';
end;

procedure TFM_Main.DBGrid1DblClick(Sender: TObject);
begin

     OraTable1.Edit;

     if OraTable1CLEARYN.value = 'Y' then OraTable1CLEARYN.value := 'N'
     else                                 OraTable1CLEARYN.value := 'Y';

     OraTable1.Post;

end;

procedure TFM_Main.FormCreate(Sender: TObject);
begin
     OraConnect;
end;


Function TFM_Main.Save_History(progid, modflag, modemp, worktype, empno, dataname : String) : Boolean;
var
  qq : TOraQuery;
  V_RECDATA, V_REMARK : string;
begin
  qq := TOraQuery.Create(nil);
  qq.Session := Ora_Session;

  V_RECDATA := '항목번호:'     + V_datano     + '||'
             + '항목명:'       + V_dataname   
             ;
  V_REMARK  := '월변동 자료항목 Clear에서 자료를 저장';

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


