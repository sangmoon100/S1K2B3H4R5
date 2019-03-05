unit PEA1060C2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OnEditStdCtrl, OnEditCombo, ExtCtrls, OnShapeLabel, OnEditBaseCtrl,
  OnEditBtnCtrl, OnTmaxCodeEdit, OnScheme, StdCtrls, OnFocusButton, Db,
  Tmax_DataSetText, OnEditMdate,func, OnPopupEdit, OnEditMemo, OnEditNumCtl, pedbutil;

type
  TFM_TARGET = class(TForm)
    FM_SubForm2_2: TOnSchemeForm;
    Panel1: TPanel;
    PA_Buttons: TPanel;
    OnShapeLabel1: TOnShapeLabel;
    OnShapeLabel4: TOnShapeLabel;
    OnShapeLabel6: TOnShapeLabel;
    OM_PROPELTASK: TOnMemo;
    OnMemo2: TOnMemo;
    OE_DETAILTASK1: TOnEdit;
    Panel2: TPanel;
    BT_save: TOnFocusButton;
    BT_close: TOnFocusButton;
    OE_DETAILTASK2: TOnEdit;
    OE_DETAILTASK3: TOnEdit;
    OE_DETAILTASK5: TOnEdit;
    OE_DETAILTASK4: TOnEdit;
    OE_MAINWEIGHT: TOnNumberEdit;
    OE_DETAILWEIGHT1: TOnNumberEdit;
    OE_DETAILWEIGHT4: TOnNumberEdit;
    OE_DETAILWEIGHT5: TOnNumberEdit;
    OE_DETAILWEIGHT2: TOnNumberEdit;
    OE_DETAILWEIGHT3: TOnNumberEdit;
    TMaxDataSet: TTMaxDataSet;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    GroupBox2: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label1: TLabel;
    procedure BT_closeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure OE_DETAILTASK1Click(Sender: TObject);
    procedure OM_PROPELTASKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BT_saveClick(Sender: TObject);
  private
    function  FL_CheckNullAnswer:Boolean;

  public
    ParamVariant : string;
  end;

var
  FM_TARGET: TFM_TARGET;

implementation

uses Hinsa_TmaxDM, peDm, PeMainForm;

{$R *.DFM}          

procedure TFM_TARGET.FormShow(Sender: TObject);
begin
  ParamVariant := 'SELECT MAINWEIGHT FROM PEHRECMW A                   '+
                  ' WHERE A.RABASDATE = '''+ MainForm.Lrabasdate +'''  '+
                  '   AND A.DEPTCODE  = (SELECT DEPTCODE FROM PEHREMAS '+
                  '                      WHERE RABASDATE = A.RABASDATE '+
                  '                        AND EMPNO     = '''+ MainForm.pEmpno +''') ';

  with MainForm.DBSet1 do
  begin
    Close;
    ServiceName := 'PEA1060A_common';
    ClearFieldInfo;
    AddField('SEL_DATA', ftString, 300);
    ClearParamInfo;
    SQL.Text := ParamVariant;
    Open;
    OE_MAINWEIGHT.Editlabel.Caption := MainForm.Csel_gfd(1);
    Label1.Caption := MainForm.Csel_gfd(1);
    Close;
  end;

  with TMaxDataSet do
  Begin
    ParamVariant := 'SELECT PROPELTASK,    DETAILTASK1,   DETAILTASK2,       '+
                    '       DETAILTASK3,   DETAILTASK4,   DETAILTASK5,       '+
                    '       MAINWEIGHT,    DETAILWEIGHT1, DETAILWEIGHT2,     '+
                    '       DETAILWEIGHT3, DETAILWEIGHT4, DETAILWEIGHT5,     '+
                    '       ''F13'', ''F14'', ''F15'', ''F16'',              '+
                    '       ''F17'', ''F18'', ''F19'', ''F20''               '+
                    '  FROM PEHREAIM_DET A                                   '+
                    ' WHERE A.RABASDATE = '''+ MainForm.Lrabasdate +'''      '+
                    '   AND A.EMPNO     = '''+ MainForm.pEmpno +'''          '+
                    '   AND A.SEQNO   = (SELECT MIN(SEQNO) FROM PEHREAIM_DET '+
                    '                    WHERE RABASDATE = A.RABASDATE       '+
                    '                      AND EMPNO     = A.EMPNO)          ';

    ServiceName := 'HINSA_select20';
    ClearFieldInfo;
    AddField('Field1'  , ftString,  100);
    AddField('Field2'  , ftString,  100);
    AddField('Field3'  , ftString,  100);
    AddField('Field4'  , ftString,  100);
    AddField('Field5'  , ftString,  100);
    AddField('Field6'  , ftString,  100);
    AddField('Field7'  , ftInteger, 100);
    AddField('Field8'  , ftInteger, 100);
    AddField('Field9'  , ftInteger, 100);
    AddField('Field10' , ftInteger, 100);
    AddField('Field11' , ftInteger, 100);
    AddField('Field12' , ftInteger, 100);
    AddField('Field13' , ftString,  100);
    AddField('Field14' , ftString,  100);
    AddField('Field15' , ftString,  100);
    AddField('Field16' , ftString,  100);
    AddField('Field17' , ftString,  100);
    AddField('Field18' , ftString,  100);
    AddField('Field19' , ftString,  100);
    AddField('Field20' , ftString,  100);
    Close;
    SQl.Clear;
    SQL.Text := ParamVariant;
    Open;

    if recordcount = 0 then
    Begin
      //중점추진업무
      if OM_PROPELTASK.Text = '' then
      begin
        OM_PROPELTASK.Font.Color := clGray;
        OM_PROPELTASK.Lines.Add('● 변화/혁신 차원의 업무상 `새로운 시도`가 필요한 과제명(Max 100Byte)');
      end;

      //세부추진활동
      if OE_DETAILTASK1.Text = '' then
      begin
        OE_DETAILTASK1.Font.Color := clGray;
        OE_DETAILTASK1.Text := '● 과제 별 세부 추진 활동 내용(Max 100Byte)';
      end;
      if OE_DETAILTASK2.Text = '' then
      begin
        OE_DETAILTASK2.Font.Color := clGray;
        OE_DETAILTASK2.Text := '● 과제 별 세부 추진 활동 내용(Max 100Byte)';
      end;
      if OE_DETAILTASK3.Text = '' then
      begin
        OE_DETAILTASK3.Font.Color := clGray;
        OE_DETAILTASK3.Text := '● 과제 별 세부 추진 활동 내용(Max 100Byte)';
      end;
      if OE_DETAILTASK4.Text = '' then
      begin
        OE_DETAILTASK4.Font.Color := clGray;
        OE_DETAILTASK4.Text := '● 과제 별 세부 추진 활동 내용(Max 100Byte)';
      end;
      if OE_DETAILTASK5.Text = '' then
      begin
        OE_DETAILTASK5.Font.Color := clGray;
        OE_DETAILTASK5.Text := '● 과제 별 세부 추진 활동 내용(Max 100Byte)';
      end;
      Exit;
    End;

    OM_PROPELTASK.text    := Fields[0].AsString;
    OE_DETAILTASK1.Text   := Fields[1].AsString;
    OE_DETAILTASK2.Text   := Fields[2].AsString;
    OE_DETAILTASK3.Text   := Fields[3].AsString;
    OE_DETAILTASK4.Text   := Fields[4].AsString;
    OE_DETAILTASK5.text   := Fields[5].AsString;
    OE_MAINWEIGHT.text    := Fields[6].AsString;
    OE_DETAILWEIGHT1.Text := Fields[7].AsString;
    OE_DETAILWEIGHT2.Text := Fields[8].AsString;
    OE_DETAILWEIGHT3.Text := Fields[9].AsString;
    OE_DETAILWEIGHT4.Text := Fields[10].AsString;
    OE_DETAILWEIGHT5.text := Fields[11].AsString;
  End;
end;

procedure TFM_TARGET.OE_DETAILTASK1Click(Sender: TObject);
begin
  if (Pos('(Max 100Byte)',TOnEdit(Self.FindComponent('OE_DETAILTASK'+IntToStr(TOnEdit(Sender).tag))).Text)  > 0) then
  TOnEdit(Self.FindComponent('OE_DETAILTASK'+IntToStr(TOnEdit(Sender).tag))).Text := '';

  TOnEdit(Self.FindComponent('OE_DETAILTASK'+IntToStr(TOnEdit(Sender).tag))).Font.Color  := clBlack;
end;

procedure TFM_TARGET.OM_PROPELTASKClick(Sender: TObject);
begin
  if (Pos('(Max 100Byte)',OM_PROPELTASK.Text)  > 0) then OM_PROPELTASK.Text  := '';
  OM_PROPELTASK.Font.Color  := clBlack;
end;

procedure TFM_TARGET.BT_saveClick(Sender: TObject);
var
  vNcnt : integer;
begin
 if (FL_CheckNullAnswer = False) Then Exit;

  ParamVariant := 'SELECT COUNT(EMPNO) FROM PEHREAIM_DET A                 '+
                  ' WHERE A.RABASDATE = '''+ MainForm.Lrabasdate +'''      '+
                  '   AND A.EMPNO     = '''+ MainForm.pEmpno +'''          '+
                  '   AND A.SEQNO   = (SELECT MIN(SEQNO) FROM PEHREAIM_DET '+
                  '                    WHERE RABASDATE = A.RABASDATE       '+
                  '                      AND EMPNO     = A.EMPNO)          ';
  with MainForm.DBSet1 do
  begin
    Close;
    ServiceName := 'PEA1060A_common';
    ClearFieldInfo;
    AddField('SEL_DATA', ftString, 300);
    ClearParamInfo;
    SQL.Text := ParamVariant;
    Open;
    vNcnt  := 0;
    vNcnt  := strtoint(MainForm.Csel_gfd(1));
    Close;
  end;

  with TMaxDataSet do
  begin
    ServiceName := 'PEA1060A_dml';
    Close;
    Sql.Clear;
    if vNcnt = 0 Then
    Begin
      SQL.ADD(' INSERT INTO PEHREAIM_DET ');
      SQL.ADD('(RABASDATE,     EMPNO,         SEQNO,         PROPELTASK,    MAINWEIGHT,    ');
      SQL.ADD(' DETAILTASK1,   DETAILTASK2,   DETAILTASK3,   DETAILTASK4,   DETAILTASK5,   ');
      SQL.ADD(' DETAILWEIGHT1, DETAILWEIGHT2, DETAILWEIGHT3, DETAILWEIGHT4, DETAILWEIGHT5, ');
      SQL.ADD(' WRITEEMP,      WRITETIME)                                                  ');
      SQL.ADD(' VALUES                                          ');
      SQL.ADD(' ( '''+ MainForm.Lrabasdate +''' ,               '); //RABASDATE
      SQL.ADD('   '''+ MainForm.pEmpno +''',                    '); //EMPNO
      SQL.ADD('   ''1'',                                        '); //SEQNO
      SQL.ADD('   '''+ OM_PROPELTASK.Text +''',                 '); //PROPELTASK
      SQL.ADD('   '''+ FloatToStr(OE_MAINWEIGHT.Value) +''',    '); //MAINWEIGHT
      SQL.ADD('   '''+ OE_DETAILTASK1.Text +''',                '); //DETAILTASK1
      SQL.ADD('   '''+ OE_DETAILTASK2.Text +''',                '); //DETAILTASK2
      SQL.ADD('   '''+ OE_DETAILTASK3.Text +''',                '); //DETAILTASK3
      SQL.ADD('   '''+ OE_DETAILTASK4.Text +''',                '); //DETAILTASK4
      SQL.ADD('   '''+ OE_DETAILTASK5.Text +''',                '); //DETAILTASK5
      SQL.ADD('   '''+ FloatToStr(OE_DETAILWEIGHT1.Value) +''', '); //DETAILWEIGHT1
      SQL.ADD('   '''+ FloatToStr(OE_DETAILWEIGHT2.Value) +''', '); //DETAILWEIGHT2
      SQL.ADD('   '''+ FloatToStr(OE_DETAILWEIGHT3.Value) +''', '); //DETAILWEIGHT3
      SQL.ADD('   '''+ FloatToStr(OE_DETAILWEIGHT4.Value) +''', '); //DETAILWEIGHT4
      SQL.ADD('   '''+ FloatToStr(OE_DETAILWEIGHT5.Value) +''', '); //DETAILWEIGHT5
      SQL.ADD('   '''+ peParam(CmdLine,1)                 +''' ,'); //WRITEEMP
      SQL.ADD('   TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'')         '); //WRITETIME
      SQL.ADD(' ) ');
    End
    Else
    Begin
      SQL.Text := 'UPDATE PEHREAIM_DET A' +
                  '   SET PROPELTASK    = '''+ OM_PROPELTASK.Text +''',                 '+
                  '       MAINWEIGHT    = '''+ FloatToStr(OE_MAINWEIGHT.Value) +''',    '+
                  '       DETAILTASK1   = '''+ OE_DETAILTASK1.Text +''',                '+
                  '       DETAILTASK2   = '''+ OE_DETAILTASK2.Text +''',                '+
                  '       DETAILTASK3   = '''+ OE_DETAILTASK3.Text +''',                '+
                  '       DETAILTASK4   = '''+ OE_DETAILTASK4.Text +''',                '+
                  '       DETAILTASK5   = '''+ OE_DETAILTASK5.Text +''',                '+
                  '       DETAILWEIGHT1 = '''+ FloatToStr(OE_DETAILWEIGHT1.Value) +''', '+
                  '       DETAILWEIGHT2 = '''+ FloatToStr(OE_DETAILWEIGHT2.Value) +''', '+
                  '       DETAILWEIGHT3 = '''+ FloatToStr(OE_DETAILWEIGHT3.Value) +''', '+
                  '       DETAILWEIGHT4 = '''+ FloatToStr(OE_DETAILWEIGHT4.Value) +''', '+
                  '       DETAILWEIGHT5 = '''+ FloatToStr(OE_DETAILWEIGHT5.Value) +''', '+
                  '       WRITEEMP      = '''+ peParam(CmdLine,1)                 +''', '+
                  '       WRITETIME     =  TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'')        '+
                  ' WHERE A.RABASDATE   = '''+ MainForm.Lrabasdate +'''                 '+
                  '   AND A.EMPNO       = '''+ MainForm.pEmpno +'''                     '+
                  '   AND A.SEQNO       = (SELECT MIN(SEQNO) FROM PEHREAIM_DET          '+
                  '                        WHERE RABASDATE = A.RABASDATE                '+
                  '                          AND EMPNO     = A.EMPNO)                   ';
    End;     

    if not Execute then
    begin
      MessageDlg('저장에 실패했습니다.', mtWarning, [mbOK], 0);
      Exit;
    end
    Else
    Begin
      MessageDlg('New Challenge 업무목표 등록을 성공 하였습니다.', mtInformation, [mbOK], 0)
    End;
  End;
end;

function TFM_TARGET.FL_CheckNullAnswer:Boolean;
var
  Fi : Integer;
  vTemp : String;
begin
  Result := False;

  if (Pos('(Max 100Byte)' ,OM_PROPELTASK.Text)  > 0) Then OM_PROPELTASK.Text  := '';
  if (Pos('(Max 100Byte)' ,OE_DETAILTASK1.Text) > 0) Then OE_DETAILTASK1.Text := '';
  if (Pos('(Max 100Byte)' ,OE_DETAILTASK2.Text) > 0) Then OE_DETAILTASK2.Text := '';
  if (Pos('(Max 100Byte)' ,OE_DETAILTASK3.Text) > 0) Then OE_DETAILTASK3.Text := '';
  if (Pos('(Max 100Byte)' ,OE_DETAILTASK4.Text) > 0) Then OE_DETAILTASK4.Text := '';
  if (Pos('(Max 100Byte)' ,OE_DETAILTASK5.Text) > 0) Then OE_DETAILTASK5.Text := '';

  if ((trim(OM_PROPELTASK.text) = '') or (Pos('(Max 100Byte)',OM_PROPELTASK.Text) > 0)) Then
  begin
    MessageDlg('중점추진업무 항목을 입력하지 않았습니다.' +#13 + '확인 후 다시입력하십시오.',mtinformation,[mbOK],0);
    OM_PROPELTASK.SetFocus;
    Exit;
  end;

  For Fi := 1 to 5 do
  Begin
    vTemp := IntToStr(Fi);

    if TOnNumberEdit(Self.FindComponent('OE_DETAILWEIGHT'+vTemp)).Value > 0 Then
    begin
      If TOnEdit(Self.FindComponent('OE_DETAILTASK'+vTemp)).Text = '' Then
      Begin
        MessageDlg('세부추진활동을 등록하시기 바랍니다.', mtInformation,[mbOk], 0);
        TOnEdit(Self.FindComponent('OE_DETAILTASK'+vTemp)).SetFocus;
        System.Exit;
      End;
    end;

    if TOnEdit(Self.FindComponent('OE_DETAILTASK'+vTemp)).Text <> '' Then
    begin
      If TOnNumberEdit(Self.FindComponent('OE_DETAILWEIGHT'+vTemp)).Value = 0 Then
      Begin
        MessageDlg('세부추진활동의 비중을 등록하시기 바랍니다.', mtInformation,[mbOk], 0);
        TOnNumberEdit(Self.FindComponent('OE_DETAILWEIGHT'+vTemp)).SetFocus;
        System.Exit;
      End;
    end;
  End;

  If (StrToInt(OE_MAINWEIGHT.EditLabel.Caption) <> (OE_DETAILWEIGHT1.Value + OE_DETAILWEIGHT2.Value + OE_DETAILWEIGHT3.Value
                            + OE_DETAILWEIGHT4.Value + OE_DETAILWEIGHT5.Value)) Then
  begin
    MessageDlg('중점추진업무 비중과 세부추진활동 비중의 합은 같아야 합니다.' +#13 + '확인 후 다시입력하십시오.',mtinformation,[mbOK],0);
    OE_DETAILWEIGHT1.SetFocus;
    Exit;
  end;
    
  Result := True;
end;

procedure TFM_TARGET.BT_closeClick(Sender: TObject);
begin
  Close;
end;

procedure TFM_TARGET.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.


