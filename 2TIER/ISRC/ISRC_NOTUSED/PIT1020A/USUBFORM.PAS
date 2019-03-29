unit USubForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, pebtnedit, Grids, ExtCtrls, peoutlookbtn, pegradpanl;

type
  TSubForm = class(TForm)
    BT_SubDutyAdd: TPeJeonOutLookBtn;
    BT_SubDutyDelete: TPeJeonOutLookBtn;
    BT_SubDutyEdit: TPeJeonOutLookBtn;
    Panel4: TPanel;
    SG_Sub: TStringGrid;
    E_SubDutyText: TPePanelEdit;
    E_DutyText: TPePanelEdit;
    Panel1: TPanel;
    PeJeonGrdPanel1: TPeJeonGrdPanel;
    OKBtn: TPeJeonOutLookBtn;
    ExitBtn: TPeJeonOutLookBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure ExitBtnClick(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
    procedure SG_SubDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SG_SubClick(Sender: TObject);
    procedure BT_SubDutyEditClick(Sender: TObject);
    procedure BT_SubDutyDeleteClick(Sender: TObject);
    procedure E_SubDutyTextKeyPress(Sender: TObject; var Key: Char);
    procedure BT_SubDutyAddClick(Sender: TObject);
    procedure E_DutyTextExit(Sender: TObject);
  private
    { Private declarations }
  public
    START, SELECT_YN : Boolean;
    RTN_Memo : TMemo;
    RTN_Text : TLabel;

    { Public declarations }
  end;

var
  SubForm: TSubForm;

implementation

{$R *.DFM}

uses
  URegForm, UpitLib;

procedure TSubForm.FormCreate(Sender: TObject);
var
  i, j: Integer;
begin
    START := True;

    with SG_Sub do
    begin
        RowCount := 1;
        for i:= 0 to RowCount -1 do
            for j:= 1 to ColCount -1 do
                Cells[j,i] := '';
    end;
end;

procedure TSubForm.FormPaint(Sender: TObject);
var
  i: Integer;
begin
    if START = False Then Exit;
    START := False;
    Application.ProcessMessages;

    with SG_Sub do
    begin
        E_DutyText.Text := RTN_Text.Caption;

        RowCount := RTN_Memo.Lines.Count;
        for i:= 0 to RTN_Memo.Lines.Count -1 do
        begin
            Cells[0,i] := RTN_Memo.Lines[i];
            Cells[1,i] := inttostr(i);     // 의미없슴
            Cells[2,i] := 'A';   // 의미없슴
        end;
    end;

    E_DutyText.SetFocus;
    BT_SubDutyEdit.Hint := 'ADD';
    SG_SubClick(Sender);
end;

procedure TSubForm.SG_SubDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
    with (Sender as TStringGrid).Canvas do
    begin
        //Brush.Color := $00F2F3F4;
        //Font.Color  := clBlack;

        FillRect(Rect);
        Rect.Top   := Rect.Top + 2;
        Rect.Left  := Rect.Left + 2;

        DrawText(Handle, PChar((Sender as TStringGrid).Cells[ACol, ARow]), -1, Rect, DT_LEFT or DT_WORDBREAK);
    end;
end;

procedure TSubForm.SG_SubClick(Sender: TObject);
begin
    if Trim(SG_Sub.Cells[0,SG_Sub.Row]) <> '' then
    begin
        E_SubDutyText.Text := SG_Sub.Cells[0,SG_Sub.Row];
        BT_SubDutyEdit.Hint := 'EDIT';
    end;
end;

procedure TSubForm.BT_SubDutyAddClick(Sender: TObject);
begin
     if (Trim(E_DutyText.Text) = '') then
     begin
         MessageDlg('먼저 직무내용(광의)을 등록하십시오.' + #13 +
                    '등록 순서 오류 ',mtError,[mbOK],0);
         E_DutyText.SetFocus;
         Exit;
     end;

     BT_SubDutyEdit.Hint := 'ADD';
     E_SubDutyText.Clear;
     E_SubDutyText.SetFocus;
end;

procedure TSubForm.BT_SubDutyEditClick(Sender: TObject);
var
  Max : Integer;

  function GetMaxSeq:Integer;
  var i : integer;
  begin
      Result := 1;
      for i := 0 to SG_Sub.RowCount -1 do
        if SG_Sub.Cells[1,i] <> '' then
          if Result < StrToInt(SG_Sub.Cells[1,i]) then
            Result := StrToInt(SG_Sub.Cells[1,i]);
      Result := Result + 1;
  end;
begin
    if (Trim(E_DutyText.Text) = '') then
    begin
        MessageDlg('먼저 직무내용(광의)을 등록하십시오.',mtError,[mbOK],0);
        E_DutyText.SetFocus;
        Exit;
    end;

    if Trim(E_SubDutyText.Text) <> '' then
    begin

       if BT_SubDutyEdit.Hint = 'ADD' then
       begin
           if (Trim(SG_Sub.Cells[0,0]) <> '') then
               SG_Sub.RowCount := SG_Sub.RowCount + 1;
           Max := GetMaxSeq;
           SG_Sub.Cells[0,SG_Sub.RowCount-1] := E_SubDutyText.Text;
           SG_Sub.Cells[1,SG_Sub.RowCount-1] := IntToStr(MAX);
           SG_Sub.Cells[2,SG_Sub.RowCount-1] := 'A';

           SG_Sub.RowHeights[SG_Sub.RowCount-1] := ((SG_Sub.Canvas.TextWidth(SG_Sub.cells[0,SG_Sub.RowCount-1]) div SG_Sub.ColWidths[0])) * 12 + 16;
           SG_Sub.Row := SG_Sub.RowCount - 1;
       end
       else if BT_SubDutyEdit.Hint = 'EDIT' then
       begin
         SG_Sub.Cells[0,SG_Sub.Row] := E_SubDutyText.Text;
         if (SG_Sub.Cells[2,SG_Sub.Row] = 'D') or
            (SG_Sub.Cells[2,SG_Sub.Row] = 'U') then
            SG_Sub.Cells[2,SG_Sub.Row] := 'U'
         else
            SG_Sub.Cells[2,SG_Sub.Row] := 'A';

         SG_Sub.RowHeights[SG_Sub.Row] := ((SG_Sub.Canvas.TextWidth(SG_Sub.cells[0,SG_Sub.Row]) div SG_Sub.ColWidths[0])) * 12 + 16;
       end;

       E_SubDutyText.Clear;
       BT_SubDutyEdit.Hint := 'ADD';
       E_SubDutyText.SetFocus;
    end;
end;

procedure TSubForm.BT_SubDutyDeleteClick(Sender: TObject);
begin
    if SG_Sub.Cells[0,SG_Sub.Row] <> '' then
    begin
        if MessageDlg('"' + SG_Sub.Cells[0,SG_Sub.Row] + '" 직무내용(협의)을 삭제하시겠습니까? '
                      , mtInformation,[mbYes, mbNo],0) = mrNo then Exit;
        fzSGDeleteRow(SG_Sub,SG_Sub.Row);
        E_SubDutyText.Clear;
        E_SubDutyText.SetFocus;
    end;
end;

procedure TSubForm.E_SubDutyTextKeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #13 then
    begin
        if BT_SubDutyEdit.Visible then
            BT_SubDutyEdit.Click
        else
            BT_SubDutyAdd.Click;
        E_SubDutyText.SetFocus;
        Key := #0;
    end;
end;

procedure TSubForm.OKBtnClick(Sender: TObject);
var
  i: Integer;
begin
    with SG_Sub do
    begin
        RTN_Text.Caption := E_DutyText.Text;

        RTN_Memo.Lines.Clear;
        for i:= 0 to RowCount -1 do
            RTN_Memo.Lines.Add(Cells[0,i]);
    end;

    SELECT_YN := True;
    Close;
end;

procedure TSubForm.ExitBtnClick(Sender: TObject);
begin
//    if MessageDlg(' 저장하지 않은 데이타는 손실될 수 있습니다.'+#13+
//                  ' 그래도 종료하시겠습니까? ', mtInformation,[mbYes, mbNo],0) = mrNo then
//        System.Exit;
    SELECT_YN := False;
    Close;
end;

procedure TSubForm.E_DutyTextExit(Sender: TObject);
begin
    // DutyText.Color := clWhite;
    if (Trim(E_DutyText.Text) = '') and
       ((SG_Sub.RowCount > 1) or (Trim(SG_Sub.Cells[0,0])<>'')) then
    begin
      if MessageDlg('직무내용(광의)의 등록된 내용이 없으면' + #13 +
                    '직무내용(협의)의 등록된 내용은 모두 삭제됩니다.' + #13 +
                    '직무내용(협의)의 등록된 내용을 삭제하시겠습까?' ,mtInformation,[mbYes,mbNo],0) = mrNo then
      begin
        E_DutyText.SetFocus;
        Exit;
      end;
      SG_Sub.RowCount := 1;
      SG_Sub.Cells[0,0] := '';
      SG_Sub.Cells[1,0] := '';
    end;
end;

end.

