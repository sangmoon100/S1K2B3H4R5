unit PTA30801;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OnScheme, ExtCtrls, OnEditStdCtrl, OnEditBaseCtrl, OnEditBtnCtrl,
  OnPopupEdit, OnShapeLabel, Grids, DBGrids, OnGrDBGrid, ComCtrls,
  OnTmaxPersonEdit, StdCtrls, OnFocusButton, OnEditCombo, OnEditNumCtl,
  OnEditMdate, Db, MemDS, DBAccess, Ora, Oninsacommon,  OnPersonEdit,
  OnCodeEdit, Pass, Func;

type
  TMainForm = class(TForm)
    Panel1: TPanel;
    SF_Main: TOnSchemeForm;
    OnShapeLabel1: TOnShapeLabel;
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
    Ora_Session: TOraSession;
    Ora_Qry1: TOraQuery;
    ED_empnoF: TOnPersonPopupEdit;
    Ora_Save: TOraQuery;
    BT_mod: TOnFocusButton;
    Ora_Grid: TOraQuery;
    DataSource1: TDataSource;
    Ed_Team: TOnWinPopupEdit;
    L_teamnm: TOnShapeLabel;
    ED_empno: TOnPersonPopupEdit;
    ED_teamF: TOnWinPopupEdit;
    L_teamnmF: TOnShapeLabel;
    CB_base_yy: TOnComboEdit;
    CB_base_yyF: TOnComboEdit;
    OnShapeLabel2: TOnShapeLabel;
    procedure BT_closeClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure BT_addClick(Sender: TObject);
    procedure BT_saveClick(Sender: TObject);
    procedure BT_modClick(Sender: TObject);
    procedure BT_cancelClick(Sender: TObject);
    procedure BT_delClick(Sender: TObject);
    procedure ED_empnoKeyPress(Sender: TObject; var Key: Char);
    procedure ED_empnoFKeyPress(Sender: TObject; var Key: Char);
    procedure BT_findClick(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure Grid_lstCellClick(Column: TColumn);
    procedure ED_teamFChange(Sender: TObject);
    procedure ED_teamFCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure ED_teamFInitPopup(Sender: TObject);
    procedure Ed_TeamChange(Sender: TObject);
    procedure Ed_TeamCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
  private
    { Private declarations }
    JobMode : String;
    SqlStr  : String;
    Cur_Empno, Cur_Sectcode, Cur_base_yy, Nbase_yy : String;
    Tmp_Empno : String;    

    procedure Set_InputField(arg1 : Boolean; arg2 : String );
    procedure Set_BtnEnable(gubun : Char);
    procedure Retrieve;
    function  DataChk : Boolean ;
  public
    { Public declarations }
    GSempno   : String[4];     //Login사번
    GSkorname : String[12];    //Login성명
    GSgrade   : String[10];    //등급
    GSsysdate : String[15];
  end;

var
  MainForm: TMainForm;

implementation

uses PTA30802;

{$R *.DFM}

procedure TMainForm.BT_closeClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.FormPaint(Sender: TObject);
begin
     Self.OnPaint := Nil;
     Application.ProcessMessages;
     SF_Main.Refresh;
     SB_help.Panels[1].Text := '인사 시스템에 접속 중입니다...';
     Application.ProcessMessages;

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

     if (GSgrade[5] > 'C') then
     begin
          MessageDlg('귀하는 작업권한이 없습니다. 프로그램을 종료합니다.', mtInformation, [mbOk], 0);
          BT_CloseClick(Self);
          Exit;
     end;

     GSsysdate                := Fn_GetDateTimeStr;
     ED_empnoF.Text           := '';
     L_teamnmF.ValueCaption   := '';

     // 기준년도 검색 (교육이수 max값)
     SqlStr := ' select max(base_yy) base_yy  from pedu2team ';
     with Ora_Qry1 do
       begin
         Close;
         Sql.Text := SqlStr;
         Open;
         CB_base_yyF.Text      := FieldByName('BASE_YY').AsString +'년';
         CB_base_yy.Text       := FieldByName('BASE_YY').AsString +'년';
         Nbase_yy              := FieldByName('BASE_YY').AsString +'년';
       end;

     BT_cancelClick(Sender);
end;

procedure TMainForm.BT_addClick(Sender: TObject);
begin
  JobMode            := 'I';
  Set_InputField(True,  '추가');
  Set_BtnEnable('I');
  ED_team.Setfocus;
end;

procedure TMainForm.BT_saveClick(Sender: TObject);
var
  score_type : String;
  imsi_Sectcode, imsi_Empno, imsi_base_yy : String;
begin
  if not ((JobMode = 'I') or (JobMode = 'U')) then
    Exit;

  if not DataChk then
    Exit;

  imsi_Sectcode := ED_Team.Text;
  imsi_Empno    := Copy(ED_empno.Text,1,4);
  imsi_base_yy  := CB_base_yy.KeyItems[CB_base_yy.ItemIndex];

  if JobMode = 'I' then
    begin
      SqlStr := Format(' select count(*) cnt from pedu2right  ' +
                       '  where sectcode=''%s'' and empno=''%s'' and base_yy=''%s'' ',
                       [ED_team.Text, Copy(ED_empno.Text,1,4), CB_base_yy.KeyItems[CB_base_yy.ItemIndex] ]);
      with Ora_Qry1 do
        begin
          Close;
          Sql.Text := SqlStr;
          Open;
          if FieldByName('CNT').AsInteger > 0 then
            begin
              MessageDlg('자료가 중복됩니다..', mtError, [mbok], 0) ;
              exit;
            end;
        end;

      SqlStr := Format(' select count(*) cnt from pedu2right  ' +
                       '  where sectcode=''%s'' and base_yy=''%s''',[ED_team.Text,CB_base_yy.KeyItems[CB_base_yy.ItemIndex] ]);
      with Ora_Qry1 do
        begin
          Close;
          Sql.Text := SqlStr;
          Open;
          if FieldByName('CNT').AsInteger > 5 then
            begin
              MessageDlg('부문별로 5명까지만 등록 가능합니다..', mtError, [mbok], 0) ;
              exit;
            end;
        end;

      SqlStr := Format('insert into pedu2right   (sectcode, empno, base_yy, writeman, writetime) ' +
                       'values     (''%s'', ''%s'', ''%s'', ''%s'', to_char(sysdate, ''yyyymmddhh24miss'') ) ',
                       [ED_team.Text,  Copy(ED_empno.Text,1,4),
                          CB_base_yy.KeyItems[CB_base_yy.ItemIndex], GSempno ]);
    end
  else
    SqlStr := Format('update pedu2right               '+
                     '   set empno       = ''%s'',    '+
                     '       writetime   = to_char(sysdate, ''yyyymmddhh24miss''), '+
                     '       writeman    = ''%s''     '+
                     'where sectcode = ''%s'' and base_yy = ''%s'' and empno = ''%s''  ',
                     [Copy(ED_empno.Text,1,4), GSempno, ED_team.Text,
                           CB_base_yy.KeyItems[CB_base_yy.ItemIndex], Tmp_empno ]);
  Try
    Ora_Session.StartTransaction;
    Ora_Save.Close;
    Ora_Save.Sql.Text := SqlStr;
    Ora_Save.ExecSql;

    Ora_Session.Commit;
  Except on E: EDatabaseError do
    begin
      MessageBox(handle,PChar(E.Message),'에  러',MB_OK or $0010);
      Ora_Session.Rollback;
      Exit;
    end;
  end;

  MessageDlg('교육이수 팀 KPI조회 권한 내역이 저장되었습니다',mtInformation, [mbOk ],0) ;
  Retrieve;

  Ora_Grid.Locate('SECTCODE;EMPNO;BASE_YY;',VarArrayOf([imsi_Sectcode,imsi_Empno,imsi_base_yy]), [loCaseInsensitive]);

  JobMode               := 'F';
  Set_InputField(False, '' );
  Set_BtnEnable('N');
end;

function TMainForm.DataChk : Boolean ;
begin
  Result := True;

  if (Trim(ED_Team.Text) ='') or (Trim(L_Teamnm.ValueCaption) ='')  then
    begin
      MessageDlg('부문을 정확히 입력해 주세요..', mtError, [mbok], 0) ;
      Result := False;
      exit;
    end;

  if Trim(ED_empno.Text) ='' then
    begin
      MessageDlg('사원을 정확히 입력해 주세요..', mtError, [mbok], 0) ;
      Result := False;
      exit;
    end;

  SqlStr := Format(' select sectcode from pycdept a, pimpmas  b where a.deptcode=b.deptcode ' +
                   ' and a.orgnum=(select value1 from pimvari where gubun=''00'' and sgubun=''0001'') '+
                   ' and b.empno = ''%s'' ', [Copy(ED_empno.Text,1,4)]);
  with Ora_Qry1 do
    begin
      Close;
      Sql.Text := SqlStr;
      Open;        //입력받은 부문과 사원의 부서 부문이 틀리면
      if Copy(FieldByName('SECTCODE').AsString,1,1) <> Copy(ED_team.Text,1,1) then
        begin
          MessageDlg('선택하신 부문코드와 사원의 부문코드가 맞지 않습니다..', mtError, [mbok], 0) ;
          Result := False;
          exit;
        end;
    end;
end;

procedure TMainForm.BT_modClick(Sender: TObject);
begin
  JobMode            := 'U';
  Set_InputField(True, '수정' );
  Set_BtnEnable('I');
  Tmp_empno := Copy(Ed_empno.Text,1,4);
  ED_empno.Setfocus;
end;

procedure TMainForm.BT_cancelClick(Sender: TObject);
begin
  JobMode            := 'F';
  if Ora_Grid.Active then
    Ora_Grid.Locate('SECTCODE;EMPNO;BASE_YY;',VarArrayOf([Cur_Sectcode, Cur_Empno, Cur_base_yy]), [loCaseInsensitive]);

  Set_InputField(False, '취소');
  Set_BtnEnable('N');
end;

procedure TMainForm.BT_delClick(Sender: TObject);
begin
  if (ED_empno.Text = '') or (ED_team.Text ='') or (CB_base_yy.Text ='') then
    begin
      MessageDlg('삭제할 자료를 선택해 주세요', mtError, [mbOk],0);
      Exit;
    end;

  if MessageDlg('삭제하시겠습니까?',mtConfirmation, [mbYes, mbNo ],0) <> mrYes then
    System.Exit;

  SqlStr := Format('delete from pedu2right   '+
                   ' where sectcode = ''%s'' '+
                   '   and empno    = ''%s'' '+
                   '   and base_yy  = ''%s'' ',
                   [ ED_team.Text, Copy(ED_empno.Text,1,4), CB_base_yy.KeyItems[CB_base_yy.ItemIndex] ]);
  Ora_Save.Close;
  Ora_Save.Sql.Text := SqlStr;
  Ora_Save.ExecSql;

  MessageDlg('삭제 되었습니다',mtInformation, [mbOk ],0) ;
  Retrieve;
end;

procedure TMainForm.Set_InputField(arg1 : Boolean; arg2 : String );
begin
  Grid_lst.Enabled         := not arg1;
  ED_team.Enabled          := arg1;
  ED_empno.Enabled         := arg1;
  CB_base_yy.Enabled       := arg1;

  if (arg2 = '추가') then
    begin
      ED_team.Text                  := '';
      L_teamnm.ValueCaption         := '';
      ED_empno.Text                 := '';
      CB_base_yy.Text               := Nbase_yy;
    end
  else if (arg2= '수정') then//update 안되는 필드들
    begin
      ED_team.Enabled               := False;
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
      Sql.Add(' select a.sectcode ,                ');
      Sql.Add('  (select deptname from pycdept c where c.deptcode=a.sectcode ');
      Sql.Add('    and orgnum=(select value1 from pimvari where gubun =''00'' and sgubun =''0001'')) sectname, ');
      Sql.Add(' a.base_yy, a.empno, b.korname      ');
      Sql.Add(' from   pedu2right a, pimpmas b     ');
      Sql.Add(' where  a.empno    = b.empno        ');
      if Trim(CB_base_yyF.Text) <> '' then
        begin
          Sql.Add('   and  a.base_yy  = :base_yy      ');
          ParamByName('base_yy').AsString  := CB_base_yyF.KeyItems[CB_base_yyF.ItemIndex];
        end;

      if Trim(ED_empnoF.Text) <> '' then
        begin
          Sql.Add('   and  a.empno    = :empno        ');
          ParamByName('empno').AsString  := Copy(ED_empnoF.Text,1,4);
        end;

      if Trim(ED_teamF.Text) <> '' then
        begin
          Sql.Add('   and  a.sectcode = :sectcode     ');
          ParamByName('sectcode').AsString  := ED_teamF.Text;
        end;

      Sql.Add('  order by a.base_yy,a.sectcode,b.paycl ');
      Open;
      DataSource1.OnDataChange := nil;
      FieldByName('EMPNO').Alignment       := taCenter;
      DataSource1.OnDataChange := DataSource1DataChange;
    end;
end;

procedure TMainForm.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  ED_empno.Text         := Ora_Grid.FieldByName('EMPNO').AsString+' - '+Ora_Grid.FieldByName('KORNAME').AsString ;
  ED_team.Text          := Ora_Grid.FieldByName('SECTCODE').AsString;
  Cb_base_yy.Text       := Ora_Grid.FieldByName('BASE_YY').AsString+'년';
  L_teamnm.ValueCaption := Ora_Grid.FieldByName('SECTNAME').AsString;

  if Trim(ED_empno.Text) = ''then
    Set_BtnEnable('N')     
  else
    Set_BtnEnable('F');
end;

procedure TMainForm.Grid_lstCellClick(Column: TColumn);
begin
  if Ora_Grid.RecordCount > 1 then
    System.Exit;

  ED_empno.Text         := Ora_Grid.FieldByName('EMPNO').AsString+' - '+Ora_Grid.FieldByName('KORNAME').AsString;
  ED_team.Text          := Ora_Grid.FieldByName('SECTCODE').AsString;
  Cb_base_yy.Text       := Ora_Grid.FieldByName('BASE_YY').AsString+'년';  
  L_teamnm.ValueCaption := Ora_Grid.FieldByName('SECTNAME').AsString;

  if Trim(ED_empno.Text) = ''then
    Set_BtnEnable('N')
  else
    Set_BtnEnable('F');
end;

procedure TMainForm.ED_teamFChange(Sender: TObject);
begin
     Ora_Grid.Close;
     L_teamnmF.ValueCaption := '';
end;

procedure TMainForm.ED_teamFCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
     if TeamForm.GSsectcode <> '' then
     begin
          ED_teamF.Text            := TeamForm.GSsectcode;
          L_teamnmF.ValueCaption   := TeamForm.GSsectname;
     end;
end;

procedure TMainForm.ED_teamFInitPopup(Sender: TObject);
begin
     TeamForm.Edit         := TOnWinPopupEdit(Sender);
     TeamForm.FormShow(Sender);

     TOnWinPopupEdit(Sender).PopupControl := TeamForm ;
end;

procedure TMainForm.Ed_TeamChange(Sender: TObject);
begin
     L_teamnm.ValueCaption := '';
end;

procedure TMainForm.Ed_TeamCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
     if TeamForm.GSsectcode <> '' then
     begin
          ED_team.Text            := TeamForm.GSsectcode;
          L_teamnm.ValueCaption   := TeamForm.GSsectname;
     end;
end;

end.
