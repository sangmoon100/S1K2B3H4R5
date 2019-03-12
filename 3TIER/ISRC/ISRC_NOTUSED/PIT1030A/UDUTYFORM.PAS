unit UDutyForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ComCtrls, Db, Tmax_DataSetText, OnLineLabel,
  OnEditBaseCtrl, OnEditStdCtrl, Grids, DBGrids, OnGrDBGrid, OnShapeLabel,
  Mask, OnInsaCommon, OnFocusButton, Comobj, OnScheme, OnEditBtnCtrl,
  CheckLst, OnListbox, OnEditMdate, OnEditCombo;

type
  TDutyForm = class(TForm)
    Panel2: TPanel;
    Panel5: TPanel;
    SG1: TStringGrid;
    SG2: TStringGrid;
    SG3: TStringGrid;
    M_Dutyexpl: TMemo;
    MailBtn: TOnFocusButton;
    OKBtn: TOnFocusButton;
    CancelBtn: TOnFocusButton;
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure SG1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SG3DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure CancelBtnClick(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
    procedure SG2Click(Sender: TObject);
    procedure SG1Click(Sender: TObject);
    procedure SG3DblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SG3KeyPress(Sender: TObject; var Key: Char);
    procedure MailBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    START,
    SELECT_YN : Boolean;

    pJobfield , pJobFieldNAME,
    pDUTYKIND, pDUTYKINDNAME,
    pDUTY, pDUTYNAME : String;

    procedure SetGrid(mGrid: TStringGrid; mKey: Integer; KeyGubun, KeyKind, KeyWord : String);
    { Public declarations }
  end;

var
  DutyForm: TDutyForm;

implementation

{$R *.DFM}

uses
//==============================================================================//
// 03.09    2002.04.02      ������      Notes ��� ����
//==============================================================================//
//  tuxCommonDM, UMainForm, TuxLib, HanaroMailForm;
  //tuxCommonDM,
  UMainForm;//, TuxLib;
//==============================================================================//

////////////////////////////////////////////////////////////////////////////////
// User Defined
////////////////////////////////////////////////////////////////////////////////

procedure TDutyForm.SetGrid(mGrid: TStringGrid; mKey: Integer; KeyGubun, KeyKind, KeyWord : String);
var
  Temp : String;
  i, Cnt : Integer;
begin
    case mKey of
      1:  Temp := 'SELECT nvl(  codeno  ,'' '') , ' +
                  '       nvl(  codename,'' '')   ' +
                  'FROM   pyccode                 ' +
                  'WHERE  codeid = ''I116''       ' +
                  '  AND  useyn =''Y'' ';
      2:  Temp := Format(
               'SELECT  ' +
               'nvl(  dutykind     ,'' '') ,      ' +
               'nvl(  dutykindname ,'' '')        ' +
               'FROM pishrdukind                  ' +
               'WHERE jobfield = ''%s''           ' +
               '  AND useyn  = ''Y''              ' +
               'ORDER BY dutykind                 ' ,[KeyGubun]) ;
      3:  Temp:= Format(
               'SELECT ' +
               'nvl( jobfield ,'' '') ,    ' +
               'nvl( dutykind ,'' '') ,    ' +
               'nvl( duty    ,'' '')  ,    ' +
               'nvl( dutyname,'' '')  ,    ' +
               'nvl( dutyexpl,'' '')       ' +
               'FROM pishrduty             ' +
               'WHERE jobfield = ''%s''    ' +
               '  AND dutykind = ''%s''    ' +
               '  AND (UPPER(dutyname) LIKE ''%s'' OR UPPER(duty) LIKE ''%s'') ' +
               '  AND useyn = ''Y''           ' +
               // 'ORDER BY 1                    ' ,[KeyGubun, KeyKind, '%'+KeyWord+'%', '%'+KeyWord+'%']);
               'ORDER BY 1                    ' ,[KeyGubun, KeyKind, '%'+KeyWord+'%', '%'+KeyWord+'%']);
    end; // End -- case

    with MainForm.TCODE do begin
        Close;
        ClearFieldInfo;
        case mKey of
            1,2:
            begin
                AddField('CODE'         , ftString,  40);
                AddField('CODENAME'     , ftString,  80);

                ServiceName := 'PIT1030A_SEL7';
            end;
            3:
            begin
                AddField('JOBFIELD'     , ftString,  2  );
                AddField('DUTYKIND'     , ftString,  10 );
                AddField('DUTY'         , ftString,  10 );
                //2017.02.17.hjku.. Į�� ������ ����.. ����ȣM ��û
                //AddField('DUTYNAME'     , ftString,  20 );
                AddField('DUTYNAME'     , ftString,  30 );
                AddField('DUTYEXPL'     , ftString,  700);

                ServiceName := 'PIT1030A_SEL8';
            end;
        end;
        Sql.Clear;
        Sql.Text := Temp;
        Open;
    end;

    SendMessage(mGrid.Handle, WM_SETREDRAW, 0, 0);
    with mGrid, MainForm.TCODE do begin
        case mKey of
          1,2:
          begin
              RowCount := 1;
              for i:=0 to ColCount-1 do
                  Cells[i, RowCount-1] := '';
              RowHeights[RowCount-1] := 14;

              Cnt := 1;
              while not Eof do begin
                  if Cnt > 1 then RowCount := RowCount + 1;
                  Cells[0,Cnt-1] := FieldByName('CODENAME').AsString;
                  Cells[1,Cnt-1] := FieldByName('CODE').AsString;

                  RowHeights[RowCount-1] := ((Canvas.TextWidth(cells[0,Cnt-1]) div ColWidths[0])) * 12 + 14;
                  Inc(Cnt);
                  Next;
              end;
          end;
          3:
          begin
              M_Dutyexpl.Width    := ColWidths[2];

              RowCount := 2;
              for i:=0 to mGrid.ColCount-1 do
                  mGrid.Cells[i,mGrid.RowCount-1] := '';
              // RowHeights[RowCount-1] := 20;

              Cnt := 1;
              while not Eof do begin
                  if Cnt > 1 then RowCount := RowCount + 1;
                  Cells[3,Cnt] := FieldByName('JOBFIELD').AsString;
                  Cells[4,Cnt] := FieldByName('DUTYKIND').AsString;
                  Cells[0,Cnt] := FieldByName('DUTY').AsString;
                  Cells[1,Cnt] := FieldByName('DUTYNAME').AsString;
                  Cells[2,Cnt] := FieldByName('DUTYEXPL').AsString;
                  // RowHeights[Cnt] := 20 + ((Length(Cells[2,Cnt]) div 58) * 12);
                  M_Dutyexpl.Lines.Text := FieldByName('DUTYEXPL').AsString;
                  if M_Dutyexpl.Lines.Count > 0 then
                      RowHeights[RowCount-1] := (M_Dutyexpl.Lines.Count-1) * 12 + 14
                  else
                      RowHeights[RowCount-1] := 14;

                  //2004.12.22  ��ȿ�� --> �������� �߰� start
                   Temp := Format('SELECT DUTY CODE, DUTYNAME CODENAME  '+
                                  '  FROM PISHRDUTY        '+
		                  ' WHERE USEYN =''N''     '+
		                  '   AND NEWDUTY = ''%s'' ',[FieldByName('DUTY').AsString]);
                   MainForm.TDS1.Close;
                   MainForm.TDS1.ClearFieldInfo;
                   MainForm.TDS1.AddField('CODE'         , ftString,  40);
                   MainForm.TDS1.AddField('CODENAME'     , ftString,  80);
                   MainForm.TDS1.ServiceName := 'PIT1030A_SEL7';
                   MainForm.TDS1.Sql.Text := Temp;
                   MainForm.TDS1.Open;
                   Cells[5,Cnt] := '';
                   while not MainForm.TDS1.Eof do
                     begin
                       Cells[5,Cnt] := Cells[5,Cnt]+ '- '+MainForm.TDS1.FieldByName('CODENAME').AsString +#13;
                       MainForm.TDS1.Next;
                     end;
                  //2004.12.22  ��ȿ�� --> �������� �߰� end

                  Inc(Cnt);
                  Next;
              end;
          end;
        end; // End -- Case
    end; // End -- with mGrid, MainForm.ttxCODE do begin

    MainForm.TCODE.Close;
    SendMessage(mGrid.Handle, WM_SETREDRAW, 1, 0);
    mGrid.Refresh;
end;

////////////////////////////////////////////////////////////////////////////////
// Events
////////////////////////////////////////////////////////////////////////////////

procedure TDutyForm.FormCreate(Sender: TObject);
begin
    START := TRUE;
    SG1.ColWidths[1] := -1;

    SG2.ColWidths[1] := -1;

    SG3.ColWidths[3] := -1;
    SG3.ColWidths[4] := -1;

    SG3.Cols[0].Text := '�����ڵ�';
    SG3.Cols[1].Text := '����';
    SG3.Cols[2].Text := '���ΰ���';
    SG3.Cols[5].Text := '��������';
end;

procedure TDutyForm.FormPaint(Sender: TObject);
begin
    if START = false then Exit;

    Application.ProcessMessages;
    START := False;

    SetGrid(SG1,1,'','','');
    SetGrid(SG2,2,SG1.Cells[1,SG1.Row],'','');
    SetGrid(SG3,3,SG1.Cells[1,SG1.Row],SG2.Cells[1,SG2.Row],'');
end;

procedure TDutyForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key = VK_ESCAPE then  CancelBtn.Click;
end;

procedure TDutyForm.SG1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  Loc : Cardinal;
begin
//2004.12.22 ��ȿ�� �ּ�ó��..R&D�� R_D�� ������ ����� �ּ�ó��
  with (Sender as TStringGrid).Canvas do
  begin
    FillRect(Rect);
    Rect.Top   := Rect.Top + 2;
    Rect.Left  := Rect.Left + 2;

    if (ARow = 0) or (ACol = 0) then
      Loc := DT_CENTER or DT_WORDBREAK
    else
      Loc := DT_LEFT or DT_WORDBREAK;

//2004.12.22 ��ȿ�� --> DT_NOPREFIX:R&D�� R_D�� ǥ�õ��� �ʰ�..
//     DrawText(Handle, PChar((Sender as TStringGrid).Cells[ACol, ARow]), -1, Rect, DT_LEFT or DT_WORDBREAK );
     DrawText(Handle, PChar((Sender as TStringGrid).Cells[ACol, ARow]), -1, Rect, DT_LEFT or DT_WORDBREAK or DT_NOPREFIX);
  end;

end;

procedure TDutyForm.SG3DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  Loc : Cardinal;
begin
 with (Sender as TStringGrid).Canvas do
 begin
    if ARow = 0 then
      Font.Style := [fsBold]
    else
      Font.Style := [];

    FillRect(Rect);
    Rect.Top   := Rect.Top + 2;
    Rect.Left  := Rect.Left + 2;

    if (ARow = 0) or (ACol = 0) then
      Loc := DT_CENTER or DT_WORDBREAK
    else
      Loc := DT_LEFT or DT_WORDBREAK;

    DrawText(Handle, PChar((Sender as TStringGrid).Cells[ACol, ARow]), -1, Rect, Loc);

 end;
end;

procedure TDutyForm.OKBtnClick(Sender: TObject);
begin
     if SG3.Cells[0,SG3.Row] = '' then
     begin
         MessageDlg('���õ� ���������� �����ϴ�.' + #13 +
                    '�����Ͻ÷��� ��� ��ư�� �����ʽÿ�.',mtError,[mbOK],0);
         Exit;
     end;
     SELECT_YN := True;

     pJobfield       := SG3.Cells[3,SG3.Row];
     pJobfieldNAME   := SG1.Cells[0,SG1.Row];

     pDUTYKIND       := SG3.Cells[4,SG3.Row];
     pDUTYKINDNAME   := SG2.Cells[0,SG2.Row];

     pDUTY           := SG3.Cells[0,SG3.Row];
     pDUTYNAME       := SG3.Cells[1,SG3.Row];
     Close;
end;

procedure TDutyForm.CancelBtnClick(Sender: TObject);
begin
    SELECT_YN := False;
    Close;
end;

procedure TDutyForm.SG3KeyPress(Sender: TObject; var Key: Char);
begin
   if (Key = #13) and (SG3.Cells[0,SG3.Row] <> '') then OKBtn.Click;
end;

procedure TDutyForm.SG1Click(Sender: TObject);
begin
   if SG1.Cells[0,SG1.Row] <> '' then
   begin
    SetGrid(SG2, 2, SG1.Cells[1,SG1.Row], '', '');
    SetGrid(SG3, 3, SG1.Cells[1,SG1.Row], SG2.Cells[1,SG2.Row], '');
   end;
end;

procedure TDutyForm.SG2Click(Sender: TObject);
begin
   if SG2.Cells[0,SG1.Row] <> '' then
     SetGrid(SG3, 3, SG1.Cells[1,SG1.Row], SG2.Cells[1,SG2.Row], '');
end;

procedure TDutyForm.SG3DblClick(Sender: TObject);
begin
    if SG3.Cells[0,SG3.Row] <> '' then
       OKBtn.Click;
end;

//==============================================================================//
// 03.09    2002.04.02      ������      Notes ��� ����
//==============================================================================//
procedure TDutyForm.MailBtnClick(Sender: TObject);
//var
//  Temp,
//  mEmpno,
//  mKorname,
//  mTelNum,
//  Msg : String;
//  Fm_MailForm    : TFm_MailForm;
begin
//  Temp:= 'SELECT  ' +
//         'nvl(  value1   ,'' '') || '';'' || ' +
//         'nvl(  value2   ,'' '') || '';'' || ' +
//         'nvl(  value3   ,'' '')              ' +
//         'FROM pishrvari                      ' +
//         'WHERE gubun = ''00'' and sgubun = ''0001''' ;
//
//   tuxCDM.Csel_SQL := Temp;
//   tuxCDM.Csel_Open;
//   if not tuxCDM.Csel_ret then
//   begin
//     Messagedlg('APP-Server Error : ' + tuxCDM.Csel.ServiceName + #13 +
//                '[' + tuxCDM.Csel.HeaderInfo.ErrCode + '] ' + tuxCDM.Csel.HeaderInfo.ErrMsg
//                ,mtError,[mbOK],0);
//     Exit;
//   end;
//
//   mEmpno   := TuxCDM.Csel_gfd(1);
//   mKorname := TuxCDM.Csel_gfd(2);
//   mTelNum  := TuxCDM.Csel_gfd(3);
//
//   tuxCDM.Csel.Close;
//
//   MessageDlg('������ ������ �����ȣ �Է�â�� ' + #$D#$A+
//              '�����λ������ý��� ��й�ȣ�� �ƴ� ' + #$D#$A+
//              '������ "HINT" ��й�ȣ �Դϴ�. '+ #$D#$A+#$D#$A+
//              '�� "HINT" ��й�ȣ�� �����Ͻñ� �ٶ��ϴ�.', mtInformation,[mbOK],0);
//
//    Msg   := '�̰��� �߰��Ͻð� ���� ������ �ۼ��Ͻð� ���Ϲ߼��� Click�Ͻø� ����ڿ��� ��û������ �����ϴ�.' + #$D#$A#$D#$A+
//             '�����о�  : ' + #$D#$A+
//             '��    ��  : ' + #$D#$A+
//             '��    ��  : ' + #$D#$A+
//             '�������� ��ȭ��ȣ : ' +#$D#$A+#$D#$A+
//             '�ǰ� �� ����      : ' +#$D#$A+#$D#$A+
//             '(��) �����о�  : ��Ÿ�����о� ' +#$D#$A+
//             '     ��    ��  : Teaching     ' +#$D#$A+
//             '     ��    ��  : ����         ' ;
//
//    Msg := Msg + #$D#$A#$D#$A + '�� ���Ϲ߼� ���н� �����(��ȭ��ȣ) : ' +mKorname+'(' + mTelNum + ')';
//
//   Fm_MailForm      := TFm_MailForm.Create(Self);
//   Try
//    Fm_MailForm.Pempno       := MainForm.pEmpno;
//    Fm_MailForm.Pkorname     := MainForm.pKorname;
//    Fm_MailForm.E_title.Text := '�ű��ڵ� ��� ��û��';
////    Fm_MailForm.PdefaultMemo := '';
////    Fm_MailForm.Pstate := False;
//    Fm_MailForm.Ed_List.Items.Add(mEmpno+'/'+mKorname);
//    Fm_MailForm.E_memo.Text   := Msg;
//    Fm_MailForm.E_Empno.Visible := False;
//    Fm_MailForm.Bt_Add.Visible := False;
//    Fm_MailForm.Bt_Del.Visible := False;
//    Fm_MailForm.E_title.ReadOnly := True;
//    Fm_MailForm.ShowModal;
//  Finally
//    Fm_MailForm.Destroy;
//  End;
end;
//==============================================================================//
end.