{* ======================= Program Header ======================================

 PROGRAM-NAME   : PKI3010A(���������� ���ذ���)
 SYSTEM-NAME    : �޿�
 SUBSYSTEM-NAME : ������
 Programmer     : ����ȯ
 Version        : 1.00
 Date           : 1997.10.31

Update Contents
   Version    date(yy.mm.dd)     programmer      description     relevant doc.no
   1.00       1997.10.31         ����ȯ          ���ʰ��ߺ�      ���������

============================================================================= *}
unit Drive_s;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DBTables, ComCtrls, StdCtrls, Buttons, ExtCtrls, IniFiles, MemDS,
  DBAccess, Ora, Func, KeyCode;

type
  TfrmMain = class(TForm)
    Panel1: TPanel;
    lblUsername: TLabel;
    lblToday: TLabel;
    Panel5: TPanel;
    lblStatus: TPanel;
    Panel2: TPanel;
    Bevel3: TBevel;
    Bevel2: TBevel;
    btnInput: TBitBtn;
    btnDelete: TBitBtn;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    btnClose: TBitBtn;
    btnDetail: TBitBtn;
    pn: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    sbtnKubun: TSpeedButton;
    sbtnFrom: TSpeedButton;
    sbtnTo: TSpeedButton;
    sbtnJuki: TSpeedButton;
    edKijun: TEdit;
    udJehan: TUpDown;
    Panel6: TPanel;
    Panel8: TPanel;
    dsMain: TDataSource;
    edKubun: TEdit;
    edFrom: TEdit;
    edTo: TEdit;
    pnKubun: TPanel;
    pnFrom: TPanel;
    pnTo: TPanel;
    pnJuki: TPanel;
    edJuki: TEdit;
    edJehan: TEdit;
    edGiwon: TEdit;
    edRatio: TEdit;
    pnGiwon: TPanel;
    pnRatio: TPanel;
    BBhelp: TBitBtn;
    qrMain: TOraQuery;
    procedure sbtnJukiClick(Sender: TObject);
    procedure sbtnKubunClick(Sender: TObject);
    procedure sbtnFromClick(Sender: TObject);
    procedure sbtnToClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnInputClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnDetailClick(Sender: TObject);
    procedure edKijunChange(Sender: TObject);
    procedure edRatioChange(Sender: TObject);
    procedure edJukiChange(Sender: TObject);
    procedure edJehanChange(Sender: TObject);
    procedure edToChange(Sender: TObject);
    procedure edFromChange(Sender: TObject);
    procedure edKubunChange(Sender: TObject);
    procedure edGiwonExit(Sender: TObject);
    procedure edRatioExit(Sender: TObject);
    procedure edToExit(Sender: TObject);
    procedure edFromExit(Sender: TObject);
    procedure edJehanExit(Sender: TObject);
    procedure pnRatioEnter(Sender: TObject);
    procedure edRatioEnter(Sender: TObject);
    procedure edGiwonEnter(Sender: TObject);
    procedure pnGiwonEnter(Sender: TObject);
    procedure BBhelpClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    Function CommaIns(NewStr : String) : String;
    Function CommaDel(NewStr : String) : String;
    Function Get_SysDate : String;
    Function SearchOld(drKubun : String; payFrom: String): Boolean;
    Function Get_CodeName(CodeID, CodeNo : String) : String;

    Procedure Update_Bas ;

  end;

var
  frmMain: TfrmMain;

implementation

Uses
  CodeLib, Drive_s2, Pass, userhelp;
{$R *.DFM}

{-------------------------------------------------------------------------
 ---------   �����̰� ������ �Լ���....   --------------------------------
 ------------------------------------------------------------------------}
(*****  ���ڿ� ',' ����  *****************************************)
Function TfrmMain.CommaIns(NewStr : String) : String;
var
  Rvalue : Double;
Begin
Try
  NewStr := CommaDel(NewStr);
  Rvalue := StrToFloat(NewStr);
  Result := Format('%-.0n',[Rvalue]);
Except on EConvertError Do
  Result := 'X';
End; // Except ..
End;

(*****  ���ڿ��� ',' ����  ***************************************)
Function TfrmMain.CommaDel(NewStr : String) : String;
Var
  i, lstCnt : Byte;
  Rvalue : String;
Begin
  lstCnt := Length(NewStr);
  for i := 1 to lstCnt do Begin
    if NewStr[i] = ',' then Continue;
    AppendStr(Rvalue, NewStr[i]);
  End; // for i := 1....
  Result := Rvalue;
End; // Main Begin...
{------------------------------------------------ CommaDel() -----}

(*****  Code Table���� �ش� �ڵ���� �о��  **********************)
Function TfrmMain.Get_CodeName(CodeID, CodeNo : String) : String;
Begin
  qrMain.Close;
  qrMain.Sql.Clear;
  qrMain.Sql.Add('Select Codename From PYCCODE');
  qrMain.Sql.Add('Where ( codeid = :CodeID ) and ( codeno = :CodeNo ) ');
  qrMain.ParamByName('CodeID').asString := CodeID;
  qrMain.ParamByName('CodeNo').asString := CodeNo;
  qrMain.Open;

  if qrMain.EOF then
    Result := ''
  Else Begin
    Result := qrMain.FieldByName('CodeName').asString;
  End;  // Else Begin...

  qrMain.Close;
End;
{-----------------------------------------  Get_CodeName()  -------}

(*****  �ý����� ��¥�� �ð��� �о��  ****************************)
Function TfrmMain.Get_SysDate : String;
Begin
  qrMain.Close;
  qrMain.Sql.Clear;
  qrMain.Sql.Add(' Select TO_CHAR(SYSDATE,''YYYYMMDDHH24MI'') ');
  qrMain.Sql.ADD(' From DUAL  ');
  qrMAin.Open;
  Result := qrMain.Fields[0].AsString;
End;
{-------------------------------------------------  Get_SysDate  -----}

(***** �̹� ��ϵ� �ڷ� �˻�  ***********************************)
Function TfrmMain.SearchOld(drKubun : String; payFrom: String): Boolean;
Var
  tmp_To, tmp_Juki , tmp_Giwon, tmp_Ratio: String;
Begin
  Screen.Cursor := crHourGlass;
  qrMain.Close;
  qrMain.Sql.Clear;
  qrMain.Sql.Add(' Select * From PKCDRBAS ');
  qrMain.Sql.Add(' Where                       ');
  qrMain.Sql.Add('        drvkind = :drKubun   ');
  qrMain.Sql.Add('        and                  ');
  qrMain.Sql.Add('        payclfr = :payFrom   ');
  qrMain.ParamByName('drKubun').AsString := drKubun;
  qrMain.ParamByName('payFrom').AsString := payFrom;
  qrMain.Open;
  btnSave.Enabled := True;

  if qrMain.Eof then Begin
    lblStatus.Caption := '';
    btnDelete.Enabled := False;
    Screen.Cursor := crDefault;
    Result := False;
  End  // if qrMain.Eof.....
  Else Begin
    lblStatus.Caption := ' �̹� �����ϴ� �ڷḦ ã�ҽ��ϴ� !. ';
    tmp_To := qrMain.FieldByName('payclto').AsString;
    tmp_Juki := qrMain.FieldByName('DRVCYCLE').AsString;
    tmp_Giwon :=
                 CommaIns(IntToStr(qrMain.FieldByName('DRVAMT').AsInteger));
    tmp_Ratio :=
                 CommaIns(IntToStr(qrMain.FieldByName('DRVTAXAMT').AsInteger));
    edKijun.Text := qrMain.FieldByName('DRVDESC').AsString;
    edJehan.Text := IntToStr(qrMain.FieldByName('DRVMAXCNT').AsInteger);
    qrMain.Close;

    edTo.Text   := tmp_To;
    edJuki.Text := tmp_Juki;
    edGiwon.Text := tmp_Giwon;
    pnGiwon.Caption := tmp_Giwon;
    edRatio.Text := tmp_Ratio;
    pnRatio.Caption := tmp_Ratio;
    pnKubun.Caption := Get_CodeName('K530', edKubun.Text);
    pnFrom.Caption  := Get_CodeName('I112', edFrom.Text);
    pnTo.Caption := Get_CodeName('I112', edTo.Text);
    pnJuki.Caption := Get_CodeName('K920', edJuki.Text);
    MessageBeep(mb_OK);
    btnDelete.Enabled := True;
    btnSave.Enabled := False;
    Screen.Cursor := crDefault;
    Result := True;
  End; // Else Begin...

End;
{----------------------------------------------- SearchOld() ----}

(*****************  �������  *********************************)
Procedure TfrmMain.Update_Bas ;
var
  Cur_date : String;
Begin
    //  Update Mode
    Cur_date := Get_SysDate;
    qrMain.Close;
    qrMain.Sql.Clear;
    qrMain.Sql.Add(' Update PKCDRBAS        ');
    qrMain.Sql.Add(' Set                         ');
    if edTo.Text <> '' then Begin
      qrMain.Sql.Add('    payclto   = :payclTo ,   ');
      qrMain.PAramByName('payclTo').AsString := edTo.Text;
    End;
    qrMain.Sql.Add('    drvmaxcnt = :drvmaxCnt , ');
    if pnJuki.Caption <> '' then Begin
      qrMain.Sql.Add('    drvcycle  = :drvCycle  , ');
      qrMain.ParamByName('drvCycle').AsString := edJuki.Text;
    End;
    qrMain.Sql.Add('    drvamt    = :drvAmt    , ');
    qrMain.Sql.Add('    drvtaxamt = :drvTaxamt , ');
    if edKijun.Text <> '' then Begin
      qrMain.Sql.Add('    drvdesc   = :drvDesc ,   ');
      qrMain.ParamByName('drvDesc').AsString := edKijun.Text;
    End;
    qrMain.Sql.Add('    writetime = :xwrite ,    ');
    qrMain.Sql.Add('    writeman  = :writeMan    ');
    qrMain.Sql.Add(' Where drvkind = :drvKind and payclfr = :payclFr ');

    qrMain.ParamByName('drvAmt').AsInteger := StrtoInt(CommaDel(edGiwon.Text));
    qrMain.ParamByName('drvTaxamt').AsInteger :=
                                              StrtoInt(CommaDel(edRatio.Text));
    qrMain.ParamByName('xwrite').AsString := Cur_date;
    qrMain.ParamByName('writeMan').AsString := PEmpNo;
    qrMain.ParamByName('drvKind').AsString := edKubun.Text;
    qrMain.ParamByName('payclFr').AsString := edFrom.Text;
    qrMain.ParamByName('drvmaxCnt').AsInteger := StrtoInt(edJehan.Text);
    qrMain.ExecSql;
    lblStatus.Caption := ' ������ �ڷᰡ �ԷµǾ����ϴ�.';
End;
{--------------------------------------------------   Update_Bas -----}
{==================  �����̰� ������ �Լ��� ��  ========================}


procedure TfrmMain.sbtnKubunClick(Sender: TObject);
begin
Try
  FKeyCode := TFKeyCode.Create(Self);
  FKeyCode.FormData := '�����������ڵ�(K530) ��ȸ';
  FKeyCode.DataVal1 := 'K530';
  FKeyCode.DataVal2 := edKubun.Text;
  if FKeyCode.ShowModal = mrOK then Begin
    edKubun.Text   := FKeyCode.Code;
    pnKubun.Caption := FKeyCode.CodeName;
  End;
Finally
  FKeyCode.Free;
End;
end;

procedure TfrmMain.sbtnFromClick(Sender: TObject);
begin
Try
  FKeyCode := TFKeyCode.Create(Self);
  FKeyCode.FormData := 'BAND�ڵ�(I112) ��ȸ' ;
  FKeyCode.DataVal1 := 'I112';
  FKeyCode.DataVal2 := edFrom.Text;
  if FKeyCode.ShowModal = mrOK then Begin
    edFrom.Text   := FKeyCode.Code;
    pnFrom.Caption := FKeyCode.CodeName;
  End;
Finally
  FKeyCode.Free;
End;
end;

procedure TfrmMain.sbtnToClick(Sender: TObject);
begin
Try
  FKeyCode := TFKeyCode.Create(Self);
  FKeyCode.FormData := 'BAND�ڵ�(I112) ��ȸ';
  FKeyCode.DataVal1 := 'I112';
  FKeyCode.DataVal2 := edTo.Text;
  if FKeyCode.ShowModal = mrOK then Begin
    edTo.Text   := FKeyCode.Code;
    pnTo.Caption := FKeyCode.CodeName;
  End;
Finally
  FKeyCode.Free;
End;
end;

procedure TfrmMain.sbtnJukiClick(Sender: TObject);
begin
Try
  FKeyCode := TFKeyCode.Create(Self);
  FKeyCode.FormData := '�����ֱ��ڵ�(K920) ��ȸ';
  FKeyCode.DataVal1 := 'K920';
  FKeyCode.DataVal2 := edJuki.Text;
  if FKeyCode.ShowModal = mrOK then Begin
    edJuki.Text   := FKeyCode.Code;
    pnJuki.Caption := FKeyCode.CodeName;
  End;
Finally
  FKeyCode.Free;
End;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin

  OraConnect;
  Application.ProcessMessages;

  lblUserName.Caption := PKorName + '(' + PEmpNo + ')';
  lblToday.Caption := FormatDateTime('yyyy-mm-dd', Now);
end;

procedure TfrmMain.btnInputClick(Sender: TObject);
begin
  edKubun.Text := '';
  pnKubun.Caption := '';
  edFrom.Text := '';
  pnFrom.Caption := '';
  edTo.Text := '';
  pnTo.Caption := '';
  edJehan.Text := '0';
  edJuki.Text := '';
  pnJuki.Caption := '';
  edGiwon.Text := '0';
  edRatio.Text := '0';
  edKijun.Text := '';

  lblStatus.Caption := ' �ڷḦ �Է��� [����]�̳� [���] ��ư�� ����ÿ�.';
end;

procedure TfrmMain.btnDeleteClick(Sender: TObject);
Var
  NewStr : String;
  NewPStr : Array[0..255] of Char;
  i : Integer ;
begin

  if (edKubun.Text = '') or (edFrom.Text = '') then Begin
    btnDelete.Enabled := False;
    lblStatus.Caption := ' ���� ���¿����� ���� ����� ����� �� �����ϴ�.';
    MessageBeep(mb_IconQuestion);
    Exit;
  End;

  NewStr := ' ' + pnFrom.Caption + '�� �ش��ϴ� ' + pnKubun.Caption + '��(��)' +
            #13 + #13 + '        ������ ���� �Ͻðڽ��ϱ� ?' ;
  StrPCopy(NewPStr, NewStr);
  i := Application.MessageBox(NewPStr, '���������� ����', mb_OKCANCEL);
  if i = IDOK then Begin
    Screen.Cursor := crHourGlass;
    qrMain.Close;
    qrMain.Sql.Clear;
    qrMain.Sql.Add(' Delete From PKCDRBAS ');
    qrMain.Sql.Add(' Where drvkind = :drKind     ');
    qrMain.Sql.Add('       and payclfr = :pyFrom ');
    qrMain.ParamByName('drKind').AsString := edKubun.Text;
    qrMain.ParamByName('pyFrom').AsString := edFrom.Text;
    qrMain.Execsql;
    lblStatus.Caption := ' ' + pnFrom.Caption + '�� �ش��ϴ� ' + pnKubun.Caption +
                         '��(��) ���� �Ͽ����ϴ�.' ;
    Screen.Cursor := crDefault;
    btnDelete.Enabled := False;
    btnSave.Enabled := True;
  End;  // if i = IDOK....
end;

procedure TfrmMain.btnCancelClick(Sender: TObject);
begin
  if (pnKubun.Caption <> '') and (pnFrom.Caption <> '')then Begin
    if SearchOld(edKubun.Text, edFrom.Text) then
        lblStatus.Caption := ' �ڷḦ �ٽ� �о� �Խ��ϴ�.'
     else Begin
        btnInput.Click;
        lblStatus.Caption := ' �ʱ�ȭ �Ͽ����ϴ�.';
     End;
  End  // if (cbKubun.....
  Else Begin
     btnInput.Click;
     lblStatus.Caption := ' �ʱ�ȭ �Ͽ����ϴ�.';
  End;
  btnSave.Enabled := False;
end;

procedure TfrmMain.btnSaveClick(Sender: TObject);
Var
  Rvalue : Integer;
begin
  Try
    Screen.Cursor := crHourGlass ;
    if (edKubun.Text = '') or (edFrom.Text = '') then Begin
      Application.MessageBox(' �����ϱ⿡ �ڷᰡ ������ �մϴ�!.',
                           '���������� ����', mb_OK);
      Screen.Cursor := crDefault;
      Exit;
    End;

    Rvalue := Application.MessageBox(' Ȯ���� �����Ͻðڽ��ϱ�?'+#13,
                                     '���������� ����', mb_OKCancel);
    if Rvalue <> IDOK then Begin
      Screen.Cursor := crDefault;
      Exit;
    End;

    qrMain.Close;
    qrMain.Sql.Clear;
    qrMain.Sql.Add(' Select Count(*) as Count From PKCDRBAS ');
    qrMain.Sql.Add(' Where drvkind = :drvKind    ');
    qrMain.Sql.Add('     and payclfr = :payclFr  ');
    qrMain.ParamByName('drvKind').AsString := edKubun.Text;
    qrMain.ParamByName('payclFr').AsString := edFrom.Text;
    qrMain.Open;

    if qrMain.FieldByName('Count').AsInteger < 1 then Begin
      // Insert Mode
      qrMain.Last;
      qrMain.Close;
      qrMain.Sql.Clear;
      qrMain.Sql.Add(
       ' Insert Into PKCDRBAS (drvkind, drvname, payclfr) ');
      qrMain.Sql.Add(' Values( :drvKind , :drvName, :payclFr )');
      qrMain.ParamByName('drvKind').AsString := edKubun.Text;
      qrMain.ParamByName('drvName').AsString := pnKubun.Caption;
      qrMain.ParamByName('payclFr').AsString := edFrom.Text;
      qrMain.ExecSql;
      try
       Update_Bas;
       lblStatus.Caption := ' ���ο� �ڷᰡ �ԷµǾ����ϴ�. ';
       btnDelete.Enabled := True;
       btnSave.Enabled := False;
      Except
        qrMain.Close;
        qrMain.Sql.Clear;
        qrMain.Sql.Add(' Delete From PKCDRBAS ');
        qrMain.Sql.Add(' Where drvkind = :drKind     ');
        qrMain.Sql.Add('       and payclfr = :pyFrom ');
        qrMain.ParamByName('drKind').AsString := edKubun.Text;
        qrMain.ParamByName('pyFrom').AsString := edFrom.Text;
        qrMain.Execsql;
        lblStatus.Caption := ' ���� �߻����� ���ο� �ڷ� �Է��� ��� �Ǿ����ϴ�.';
        MessageBeep(mb_IconQuestion);
        btnDelete.Enabled := False;
        btnSave.Enabled := True;
      End;
    End
    Else Begin
      Try
        Update_Bas;
        btnDelete.Enabled := True;
        btnSave.Enabled := False;
      Except
        lblStatus.Caption := ' ���� �߻����� �ڷ� ������ ��� �Ǿ����ϴ�.';
        MessageBeep(mb_IconQuestion);
        btnDelete.Enabled := False;
        btnSave.Enabled := True;
      End;
    End;

  Finally
   // btnDelete.Enabled := True;
   // btnSave.Enabled := False;
    Screen.Cursor := crDefault;
  End;

end;

procedure TfrmMain.btnCloseClick(Sender: TObject);
begin
  Close
end;

procedure TfrmMain.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then Begin
    SelectNext(ActiveControl as TWinControl, True, True);
    Key := #0;
  end;
end;

procedure TfrmMain.btnDetailClick(Sender: TObject);
begin
Try
  MessageBeep(mb_OK);
  Screen.Cursor := crSQLwait;
  frmSub1 := TfrmSub1.Create(Self);
  if frmSub1.ShowModal = mrOK then Begin
    edKubun.Text := frmSub1.Sub_Kubun;
// ����ȣ �۾� ���� �θ� ������ ���� frmSub1.Sub_From �� Sub_Fromcd �� ������.
    edFrom.Text  := frmSub1.Sub_From;
    edTo.Text    := frmSub1.Sub_To;
//    SearchOld(edKubun.Text, edFrom.Text); �ڵ��
// ����ȣ �۾� ��
  End;
Finally
  Screen.Cursor := crDefault;
  frmSub1.Free;
End;
end;

procedure TfrmMain.edKijunChange(Sender: TObject);
begin
  btnSave.Enabled := True;
end;

procedure TfrmMain.edRatioChange(Sender: TObject);
begin
  btnSave.Enabled := True;
end;

procedure TfrmMain.edJukiChange(Sender: TObject);
begin
  edJuki.Text := UpperCase(edJuki.Text);
  pnJuki.Caption := Get_CodeName('K920', edJuki.Text);
  btnSave.Enabled := True;
end;

procedure TfrmMain.edJehanChange(Sender: TObject);
begin
  btnSave.Enabled := True;
end;

procedure TfrmMain.edToChange(Sender: TObject);
begin
  pnTo.Caption := Get_CodeName('I112', edTo.Text);

  btnSave.Enabled := True;
end;

procedure TfrmMain.edFromChange(Sender: TObject);
begin
  pnFrom.Caption := Get_CodeName('I112', edFrom.Text);

  if (pnKubun.Caption <> '') and (pnFrom.Caption <> '') then
    if SearchOld(edKubun.Text, edFrom.Text) then Exit;
  btnSave.Enabled := True;
end;

procedure TfrmMain.edKubunChange(Sender: TObject);
begin
  pnKubun.Caption := Get_CodeName('K530', edKubun.Text);

  if (pnKubun.Caption <> '') and (pnFrom.Caption <> '') then
    if SearchOld(edKubun.Text, edFrom.Text) then Exit;
  btnSave.Enabled := True;

end;

procedure TfrmMain.edGiwonExit(Sender: TObject);
Var
  Value : String;
begin
  Value := CommaIns(edGiwon.Text);
  if Value <> 'X' then Begin
    edGiwon.Text := Value ;
    pnGiwon.Caption := edGiwon.Text;
    pnGiwon.Visible := True;
  End
  Else Begin
    lblStatus.Caption := ' ���ڸ� �Է��� �����մϴ�.';
    MessageBeep(mb_IconQuestion);
    edGiwon.Text := '0';
    edGiwon.SetFocus;
  End; // Else Begin ....

end;

procedure TfrmMain.edRatioExit(Sender: TObject);
Var
  Value : String;
  Giwon, Tax : Integer;
begin
  Value := CommaIns(edRatio.Text);
  if Value <> 'X' then Begin
    edRatio.Text := Value ;
    lblStatus.Caption := '';
  End  // if Value <>......
  Else Begin
    lblStatus.Caption := ' ���ڸ� �Է��� �����մϴ�.';
    MessageBeep(mb_IconQuestion);
    edRatio.Text := '0';
    edRatio.SetFocus;
    Exit;
  End; // Else Begin ....

  Giwon := StrtoInt(CommaDel(edGiwon.Text));
  Tax   := StrToInt(CommaDel(edRatio.Text));
  if Tax > Giwon then Begin
    lblStatus.Caption := ' �����ݿ� ���� ������ �ʹ� �����ϴ�.!';
    MessageBeep(mb_IconQuestion);
    edRatio.SetFocus;
  End
  else Begin
    pnRatio.Caption := edRatio.Text;
    pnRatio.Visible := True;
  End;
end;

procedure TfrmMain.edToExit(Sender: TObject);
begin
  if (edFrom.Text <> '') and (edTo.Text <> '') then Begin
    if edTo.Text < edFrom.Text Then Begin
      lblStatus.Caption := ' BAND ������ �߸� �����Ǿ����ϴ�.';
      MessageBeep(mb_IconQuestion);
      edTo.Text := '';
      edTo.SetFocus;
    End  //  if edTo.Text.....
    Else lblStatus.Caption := '';
  End;
end;

procedure TfrmMain.edFromExit(Sender: TObject);
begin
  if (edTo.Text <> '') and (edFrom.Text <> '') then Begin
    if edTo.Text < edFrom.Text Then Begin
      lblStatus.Caption := ' BAND ������ �߸� �����Ǿ����ϴ�.';
      MessageBeep(mb_IconQuestion);
      edFrom.Text := '';
      edFrom.SetFocus;
    End  //  if edTo.Text.....
    Else lblStatus.Caption := '';
  End;
  
end;

procedure TfrmMain.edJehanExit(Sender: TObject);
Var
  Value : String;
begin
  Value := CommaIns(edJehan.Text);
  if Value <> 'X' then
    edJehan.Text := Value
  Else Begin
    lblStatus.Caption := ' ���ڸ� �Է��� �����մϴ�.';
    MessageBeep(mb_IconQuestion);
    edJehan.Text := '0';
    edJehan.SetFocus;
  End; // Else Begin ....
End;

procedure TfrmMain.edRatioEnter(Sender: TObject);
begin
  pnRatio.Visible := False;
  edRatio.SetFocus;
end;

procedure TfrmMain.pnRatioEnter(Sender: TObject);
begin
  pnRatio.Visible := False;
  edRatio.SetFocus;
end;

procedure TfrmMain.edGiwonEnter(Sender: TObject);
begin
  pnGiwon.Visible := False;
  edGiwon.SetFocus;
end;

procedure TfrmMain.pnGiwonEnter(Sender: TObject);
begin
  pnGiwon.visible := False;
  edGiwon.SetFocus;
end;

procedure TfrmMain.BBhelpClick(Sender: TObject);
var
  HelpForm : THelpForm;
begin
  HelpForm := THelpForm.Create(Self);
  try
    HelpForm.Programid := 'PKI3010A';
    HelpForm.ShowModal;
  finally
    HelpForm.Free;
  end;
end;

end.