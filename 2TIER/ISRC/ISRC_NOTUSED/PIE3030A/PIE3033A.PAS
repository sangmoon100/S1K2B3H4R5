unit PIE3033A;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Grids, StdCtrls, Buttons,datelib, DB, DBTables, KeyEmpno,
  MemDS, DBAccess, Ora;

type
  Tpia1064cForm = class(TForm)
    Str1: TStringGrid;
    Bexit: TBitBtn;
    Qemp: TOraQuery;
    QempEMPNO: TStringField;
    QempKORNAME: TStringField;
    procedure FormActivate(Sender: TObject);
    procedure BexitClick(Sender: TObject);
    procedure Str1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Str1GetEditMask(Sender: TObject; ACol, ARow: Longint;
      var Value: string);
  private
    { Private declarations }
    procedure EmpnoDisp(i : integer);
  public
    sRow : integer;
    { Public declarations }
  end;

var
  pia1064cForm: Tpia1064cForm;
  nRow        : integer;
implementation
uses PIE3031A;
{$R *.DFM}

procedure Tpia1064cForm.FormActivate(Sender: TObject);
var
  i : integer;
begin
 str1.Cells[0,0] := '순 번';
 str1.Cells[1,0] := ' 사원번호';
 str1.Cells[2,0] := ' 성    명';
 nRow := 5;
 sRow := 1;
 for i := 1 to 5 do str1.Cells[0,i] := inttostr(i);
end;

procedure Tpia1064cForm.BexitClick(Sender: TObject);
var
  i : integer;
begin
  for i := 1 to 50 do begin
      PIE3031cForm.empnostr[i] := copy(trim(str1.Cells[1,i]),1,4);
  end;
  close;
end;

procedure Tpia1064cForm.EmpnoDisp(i : integer);
begin
  if trim(str1.Cells[1,i]+str1.Cells[2,i]) = '' then System.Exit;

  Qemp.close;
  Qemp.Parambyname('lempno').AsString   := UpperCase(str1.Cells[1,i]);
  Qemp.Parambyname('lkorname').AsString := str1.Cells[2,i];
  Qemp.Open;
  if Qemp.RecordCount > 0 then
  begin
    if Qemp.RecordCount > 1 then
    begin
        FKeyEmpno := TFKeyEmpno.Create(Self);
        try
             FKeyEmpno.EdEmpno.Text := str1.Cells[2,i];
             FKeyEmpno.v_Table_Name := 'pkmpmas';
             FKeyEmpno.ShowModal;

             if FKeyEmpno.CloseChk = -1 then Exit;

             if FKeyEmpno.v_KeyEmpno <> '' then
             begin
                  Str1.Cells[1,i] := FKeyempno.v_KeyEmpno;
                  Str1.Cells[2,i] := FKeyEmpno.v_KeyKorname;
             end;
        finally
             FKeyEmpno.Free;
        end;
    end else begin
        Str1.Cells[1,i] := Qemp.FieldByName('empno').asString;
        Str1.Cells[2,i] := Qemp.FieldByName('korname').asString;
    end;
  end
  else begin
    MessageDlg('해당 사원은 존재하지 않습니다.!!', mtError, [mbOK], 0);
    str1.Col := 2;
    str1.Row := i;
    str1.Cells[2,i] := '';
  end;
  Qemp.Close;
end;

procedure Tpia1064cForm.Str1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  sRow := str1.Row;
  if (Key = vk_Down) then empnoDisp(str1.Row-1);
  if (Key = vk_up)   then empnoDisp(str1.Row+1);
  if (Key = VK_RETURN) then empnoDisp(str1.Row);
  if nRow > 50 then System.Exit;
  if Key = vk_Down then begin
     if str1.Row = nRow then begin
        if nRow > 49 then begin
           MessageBox(handle,'사원번호 입력은 최대 50개까지만 가능합니다..','경 고',MB_OK or $0010);
           system.Exit;
        end;
        inc(nRow);
        str1.RowCount :=(nRow+1);
        str1.Cells[0,nRow] := inttostr(nRow);
     end;
  end;
end;

{
 버전     수정일      수정자   관련근거       수정내용
--------------------------------------------------------------------------------
 1.14   1998.08.19    김혜진  콜(98.8.19)  입력사번순에서 계약직사번 알파벳이 입력되지 않음.
 }
procedure Tpia1064cForm.Str1GetEditMask(Sender: TObject; ACol,
  ARow: Longint; var Value: string);
begin
 sRow := str1.Row;
 if Acol = 1 then Value := 'AAAA';
end;

end.
