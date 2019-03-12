{-------------------------------------------------------------------------------
  o 프로그램명 :
  o 시스템명   : 종합인사정보시스템
  o 부시스템명 : 기타 
  o 작성자     : 강륜종
  o 버전       : 1.00
  o 작성일자   : 2017.02.
-------------------------------------------------------------------------------}
unit PZZ1050A1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, MemDS, DBAccess, Ora, ComCtrls, StdCtrls,
  ExtCtrls, Buttons, Grids, DBGrids, OnRegistry, OnEditBaseCtrl,
  OnEditStdCtrl, OnEditBtnCtrl, OnEditCombo, OnFocusButton, OnShapeLabel,
  OnPersonEdit, OnGrDBGrid, OnScheme, Func;

type
  TFM_Main = class(TForm)
    OraGrid: TOraQuery;
    DataSource1: TDataSource;
    OraExec: TOraQuery;
    BT_Close: TOnFocusButton;
    BT_Save: TOnFocusButton;
    BT_BatchSave: TOnFocusButton;
    E_UserNew: TOnPersonPopupEdit;
    E_BatchGubun: TOnComboEdit;
    E_Tier: TOnComboEdit;
    E_Gubun: TOnComboEdit;
    E_Progid: TOnEdit;
    Grid1: TOnGrDbGrid;
    E_Empno: TOnEdit;
    E_Useyn: TOnComboEdit;
    E_TierA: TOnComboEdit;
    E_GubunA: TOnComboEdit;
    E_ProgidA: TOnEdit;
    SF_Main: TOnSchemeForm;
    OnShapeLabel1: TOnShapeLabel;
    OnShapeLabel2: TOnShapeLabel;
    SB_Help: TStatusBar;
    OnShapeLabel3: TOnShapeLabel;
    L_Progname: TOnShapeLabel;
    E_Subkey: TOnEdit;
    E_SubkeyA: TOnEdit;
    E_EmpnoA22: TOnPersonPopupEdit;
    E_Help: TMemo;
    BT_Help: TOnFocusButton;
    E_EmpnoA: TOnEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BT_CloseClick(Sender: TObject);
    procedure BT_SaveClick(Sender: TObject);
    procedure BT_BatchSaveClick(Sender: TObject);
    procedure E_BatchGubunChange(Sender: TObject);
    procedure E_TierChange(Sender: TObject);
    procedure E_ProgidKeyPress(Sender: TObject; var Key: Char);
    procedure E_ProgidAKeyPress(Sender: TObject; var Key: Char);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure E_ProgidAExit(Sender: TObject);
    procedure BT_HelpClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    vSql : String;
    vTier, vGubun, vProgid, vEmpno, vUseyn, vSubkey, vNewEmp : String;
    vGroupID : String;
    procedure OpenEmpList;
    procedure OpenProgname;

  end;

const
  PASS_KEY = CHR(VK_RETURN);

var
  FM_Main: TFM_Main;

implementation

{$R *.DFM}

procedure TFM_Main.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFM_Main.BT_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFM_Main.FormCreate(Sender: TObject);
begin
  Application.ProcessMessages;

  OraConnect;
  OraGrid.Session := Ora_Session;
  OraExec.Session := Ora_Session;

  E_Help.Visible := False;
  SB_Help.Panels[1].Text :=' DB 접속 완료.';
end;

procedure TFM_Main.FormShow(Sender: TObject);
begin        
  if Copy(Pempno,1,1) <> 'D' then
  begin
       ShowMessage('귀하는 접근 권한이 부족합니다. 프로그램을 종료합니다.');
       Application.Terminate;
  end;

  OpenEmpList;

  E_Empno.SetFocus;
end;

procedure TFM_Main.OpenEmpList;
begin
  vTier := Copy(Trim(E_Tier.Text),1,1);
  if (E_Tier.Text='ALL') or (vTier = '') then vTier := '%';

  vGubun := Copy(Trim(E_Gubun.Text),1,1);
  if (E_Gubun.Text='ALL') or (vGubun = '') then vGubun := '%';

  vProgid := Trim(E_Progid.Text) +'%';

  vEmpno := Trim(E_Empno.Text) +'%';

  vUseyn := Copy(Trim(E_Useyn.Text),1,1);
  if (E_Useyn.Text='ALL') or (vUseyn = '') then vUseyn := '%';

  with OraGrid do
  begin
       Close;
       Sql.Clear;
       Sql.Add('Select Decode(Tier, ''2'',''2Tier'' ,  ''3'',''3Tier'', Tier) Tier,      ');
       Sql.Add('       Decode(Gubun,''1'',''1.인사'',  ''2'',''2.급여'',                 ');
       Sql.Add('                    ''3'',''3.평가'',  ''4'',''4.복리후생'',             ');
       Sql.Add('                    ''5'',''5.기타'',  ''7'',''7.교육'',Gubun) Gubun,    ');
       Sql.Add('       Progid, Empno, Useyn, Subkey,                                     ');
       Sql.Add('      (Select korname From Pimpmas Where Empno=A.Empno) Korname,         ');
       Sql.Add('       Nvl((Select Progname||Decode(Useyn,''N'','' - 사용안함'','''')    ');
       Sql.Add('         From Pymenulist                                                 ');
       Sql.Add('        Where Tier=A.Tier And Gubun=A.Gubun And Progid=A.Progid),''종합인사메뉴'') Progname');
       Sql.Add('  From PZManager A                                                       ');
       Sql.Add(' Where Tier   Like '''+vTier  +'''                                       ');
       Sql.Add('   And Gubun  Like '''+vGubun +'''                                       ');
       Sql.Add('   And Progid Like '''+vProgid+'''                                       ');
       Sql.Add('   And Empno  Like '''+vEmpno +'''                                       ');
       Sql.Add('   And Useyn  Like '''+vUseyn +'''                                       ');
       Sql.Add(' Order By 1,2,3,4                                                        ');  //E_SubkeyA.Text := sql.text;
       Open;
  end;

  SB_Help.Panels[1].Text :=' 조회 완료.';
end;

procedure TFM_Main.OpenProgname;
begin
  vTier   := Copy(Trim(E_TierA.Text ),1,1);
  vGubun  := Copy(Trim(E_GubunA.Text),1,1);
  vProgid := Trim(E_ProgidA.Text);

  with OraExec do
  begin
       Close;
       Sql.Clear;
       Sql.Add('Select Progname From Pymenulist');
       Sql.Add(' Where Tier   = '''+vTier  +'''');
       Sql.Add('   And Gubun  = '''+vGubun +'''');
       Sql.Add('   And Progid = '''+vProgid+'''');
       Sql.Add('   And Useyn  = ''Y''          ');     E_Help.Text := Sql.text;
       Open;
       L_Progname.LabelCaption := Fields[0].AsString;
  end;
end;

procedure TFM_Main.E_TierChange(Sender: TObject);
begin
  OpenEmpList;
end;

procedure TFM_Main.E_ProgidKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then OpenEmpList;
end;

procedure TFM_Main.E_BatchGubunChange(Sender: TObject);
begin
  E_UserNew.Text := '';
  E_Subkey.Text := '';
  E_UserNew.Enabled := False;
  E_Subkey.Enabled := False;

  if (E_BatchGubun.Text = '1.담당자추가') or (E_BatchGubun.Text = '2.담당자변경') then
     E_UserNew.Enabled := True;
     
  if E_BatchGubun.Text = '5.추가KEY' then
     E_Subkey.Enabled := True;
end;

procedure TFM_Main.BT_BatchSaveClick(Sender: TObject);
var vBatchUseyn : String;
begin
  vNewEmp := Copy(Trim(E_UserNew.Text),1,4);    //추가or변경할 사번

  OpenEmpList;  //변수 할당을 위해 조회

  if OraGrid.RecordCount = 0 then
  begin
       ShowMessage('변경할 프로그램을 조회 후 작업하세요!!!');
       Exit;
  end;

  if (E_BatchGubun.Text = '1.담당자추가') or (E_BatchGubun.Text = '2.담당자변경') then
  begin
       with OraGrid do
       begin
            Close;
            Sql.Clear;
            Sql.Add('Select 1 From PZManager           ');
            Sql.Add(' Where Tier   Like '''+vTier  +'''');
            Sql.Add('   And Gubun  Like '''+vGubun +'''');
            Sql.Add('   And Progid Like '''+vProgid+'''');
            Sql.Add('   And Empno  Like '''+vNewEmp+'''');  //추가or변경 사번
            Sql.Add('   And Useyn  Like '''+vUseyn +'''');  E_Help.Text := Sql.text; 
            Open;

            if Fields[0].AsInteger <> 0 then
            begin
                 OpenEmpList;
                 ShowMessage(E_UserNew.Text+ '에게 기존에 등록된 프로그램 존재합니다.!!!');
                 Exit;
            end;
       end;
  end;
  //////////////////////////////////////////////////////////////////////////////

  
  if E_BatchGubun.Text = '1.담당자추가' then  //인수인계위해 과도기 기간
  begin      
       with OraExec do
       begin
            Close;
            Sql.Clear;
            Sql.Add('Insert into PZManager                      ');
            Sql.Add('Select Tier, Gubun, Progid,                ');
            Sql.Add('       '''+vNewEmp+''',                    ');
            Sql.Add('       Useyn,                              ');
            Sql.Add('       SubKey,                             ');
            Sql.Add('       '''+Pempno+''',                     ');
            Sql.Add('       to_char(sysdate,''YYYYMMDD-HH24MI'')');
            Sql.Add('  From PZManager A                         ');
            Sql.Add(' Where Tier   Like '''+vTier  +'''         ');
            Sql.Add('   And Gubun  Like '''+vGubun +'''         ');
            Sql.Add('   And Progid Like '''+vProgid+'''         ');
            Sql.Add('   And Empno  Like '''+vEmpno +'''         ');
            Sql.Add('   And Useyn  Like '''+vUseyn +'''         ');  E_Help.Text := Sql.text; 
            ExecSql;
       end;
  end
  else if E_BatchGubun.Text = '2.담당자변경' then  //담당자 교체시
  begin
       with OraExec do
       begin
            Close;
            Sql.Clear;
            Sql.Add('Update PZManager                                     ');
            Sql.Add('   Set Empno    ='''+vNewEmp+''',                    ');
            Sql.Add('       Writeman ='''+Pempno +''',                    ');
            Sql.Add('       Writetime=to_char(sysdate,''YYYYMMDD-HH24MI'')');
            Sql.Add(' Where Tier   Like '''+vTier  +'''                   ');
            Sql.Add('   And Gubun  Like '''+vGubun +'''                   ');
            Sql.Add('   And Progid Like '''+vProgid+'''                   ');
            Sql.Add('   And Empno  Like '''+vEmpno +'''                   ');
            Sql.Add('   And Useyn  Like '''+vUseyn +'''                   ');  E_Help.Text := Sql.text; 
            ExecSql;
       end;
  end
  else if (E_BatchGubun.Text = '3.미사용') or (E_BatchGubun.Text = '4.사용') then
  begin
       if E_BatchGubun.Text = '3.미사용' then vBatchUseyn := 'N'
       else                                   vBatchUseyn := 'Y';
       
       with OraExec do
       begin
            Close;
            Sql.Clear;
            Sql.Add('Update PZManager                                     ');
            Sql.Add('   Set Useyn    ='''+vBatchUseyn+''',                ');
            Sql.Add('       Writeman ='''+Pempno     +''',                ');
            Sql.Add('       Writetime=to_char(sysdate,''YYYYMMDD-HH24MI'')');
            Sql.Add(' Where Tier   Like '''+vTier  +'''                   ');
            Sql.Add('   And Gubun  Like '''+vGubun +'''                   ');
            Sql.Add('   And Progid Like '''+vProgid+'''                   ');
            Sql.Add('   And Empno  Like '''+vEmpno +'''                   ');
            Sql.Add('   And Useyn  Like '''+vUseyn +'''                   ');  E_Help.Text := Sql.text;
            ExecSql;
       end;
  end
  else if E_BatchGubun.Text = '5.추가KEY' then
  begin
       with OraExec do
       begin
            Close;
            Sql.Clear;
            Sql.Add('Update PZManager                                     ');
            Sql.Add('   Set Subkey   ='''+E_Subkey.Text+''',              ');
            Sql.Add('       Writeman ='''+Pempno       +''',              ');
            Sql.Add('       Writetime=to_char(sysdate,''YYYYMMDD-HH24MI'')');
            Sql.Add(' Where Tier   Like '''+vTier  +'''                   ');
            Sql.Add('   And Gubun  Like '''+vGubun +'''                   ');
            Sql.Add('   And Progid Like '''+vProgid+'''                   ');
            Sql.Add('   And Empno  Like '''+vEmpno +'''                   ');
            Sql.Add('   And Useyn  Like '''+vUseyn +'''                   ');  E_Help.Text := Sql.text; 
            ExecSql;
       end;
  end;

  if Trim(E_UserNew.Text) <> '' then E_Empno.Text := Copy(E_UserNew.Text,1,4) ;

  E_BatchGubun.ItemIndex := -1;
  E_UserNew.Text := '';
  E_UserNew.Enabled:= False;
  E_Subkey.Enabled := False;

  OpenEmpList;  //결과 조회  
end;

procedure TFM_Main.BT_SaveClick(Sender: TObject);
begin
  OpenProgname;

  vNewEmp := Copy(Trim(E_EmpnoA.Text),1,4);  //추가할 사번 
  vSubkey := Trim(E_SubkeyA.Text);

  if (vTier='') or (vGubun='') or (L_Progname.LabelCaption='') or (Length(vNewEmp)<>4) then
  begin
       ShowMessage('해당 프로그램이 "사용안함" 이거나 오등록 내역이 있습니다.');
       Exit;
  end;
  
  vSql := 'Select Func_ManagerChk('''+vTier  +''','+
          '                       '''+vGubun +''','+
          '                       '''+vProgid+''','+
          '                       '''+vNewEmp+''','+
          '                       '''+vSubkey+''' ) From Dual';
          
  If OraSqlOpen(vSql) = '0' then  //기 등록내역 체크
  begin
       with OraExec do
       begin
            Close;
            Sql.Clear;
            Sql.Add('Insert into PZManager     ');
            Sql.Add(' Values ('''+vTier  +''', ');
            Sql.Add('         '''+vGubun +''', ');
            Sql.Add('         '''+vProgid+''', ');
            Sql.Add('         '''+vNewEmp+''', ');
            Sql.Add('         ''Y'',           ');
            Sql.Add('         '''+vSubkey+''', ');
            Sql.Add('         '''+Pempno +''', ');
            Sql.Add(' to_char(sysdate,''YYYYMMDD-HH24MISS'') )');
            ExecSql;
       end;
  end
  Else
  begin
       ShowMessage('현재 해당 프로그램이 '+ E_EmpnoA.Text +'에게 지정되어 있습니다.');
       Exit;
       {with OraExec do
       begin
            Close;
            Sql.Clear;
            Sql.Add('Update PZManager                   ');
            Sql.Add('   Set Empno     = '''+vEmpno +''',');
            Sql.Add('       Subkey    = '''+vSubkey+''',');
            Sql.Add('       Writeman  = '''+Pempno +''',');
            Sql.Add('       Writetime = to_char(sysdate,''YYYYMMDD-HH24MI'')');
            Sql.Add(' Where Tier   = '''+vTier     +'''');
            Sql.Add('   And Gubun  = '''+vGubun    +'''');
            Sql.Add('   And Progid = '''+vProgid   +'''');
            ExecSql;
       end;}
  end;

  E_Empno.Text := vNewEmp;
  
  OpenEmpList;
end;

procedure TFM_Main.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  if OraGrid.RecordCount = 0 then Exit;
  
  E_TierA.Text  := OraGrid.FieldByName('Tier').AsString;
  E_GubunA.Text := OraGrid.FieldByName('Gubun').AsString;
  E_ProgidA.Text:= OraGrid.FieldByName('Progid').AsString;
  L_Progname.LabelCaption := OraGrid.FieldByName('Progname').AsString;
end;

procedure TFM_Main.E_ProgidAKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then E_EmpnoA.SetFocus;
end;

procedure TFM_Main.E_ProgidAExit(Sender: TObject);
begin
  OpenProgname;
end;

procedure TFM_Main.BT_HelpClick(Sender: TObject);
begin
  if E_Help.Visible then E_Help.Visible := False
  else                   E_Help.Visible := True;
end;

end.

