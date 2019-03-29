unit Pit1040c10;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Grids, StdCtrls, Buttons,datelib, DB, DBTables,fempno;

type
  Tpit1040c10Form = class(TForm)
    Str1: TStringGrid;
    Bexit: TBitBtn;
    Qemp: TQuery;
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
    empnostr  : array[1..50] of string[4];
    { Public declarations }
  end;

var
  pit1040c10Form: Tpit1040c10Form;
  nRow        : integer;
implementation
uses pit1040c9;
{$R *.DFM}

procedure Tpit1040c10Form.FormActivate(Sender: TObject);
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

procedure Tpit1040c10Form.BexitClick(Sender: TObject);
var
  i : integer;
begin
  for i := 1 to 50 do begin
    //  mainForm2.empnostr[i] := copy(trim(str1.Cells[1,i]),1,4);
      empnostr[i] := copy(trim(str1.Cells[1,i]),1,4);
  end;
  close;
end;

procedure Tpit1040c10Form.EmpnoDisp(i : integer);
begin
  if trim(str1.Cells[1,i]+str1.Cells[2,i]) = '' then System.Exit;

  Qemp.close;
  Qemp.Parambyname('lempno').AsString   := UpperCase(str1.Cells[1,i]);
  Qemp.Parambyname('lkorname').AsString := str1.Cells[2,i];
  Qemp.Open;
  if Qemp.RecordCount > 0 then begin
     if Qemp.RecordCount > 1 then begin
        empForm := TempForm.Create(self);
        Try
          empForm.DataVal2 := str1.Cells[2,i];
          empForm.ShowModal;
          Str1.Cells[1,i] := empForm.Code;
          Str1.Cells[2,i] := empForm.CodeName;
        Finally
          empForm.Free;
        End;
     end else begin
         Str1.Cells[1,i] := Qemp.FieldByName('empno').asString;
         Str1.Cells[2,i] := Qemp.FieldByName('korname').asString;
     end;
  end;
  Qemp.Close;
end;

procedure Tpit1040c10Form.Str1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
sRow := str1.Row;
if (Key = vk_Down) then empnoDisp(str1.Row-1);
if (Key = vk_up)   then empnoDisp(str1.Row+1);

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
procedure Tpit1040c10Form.Str1GetEditMask(Sender: TObject; ACol,
  ARow: Longint; var Value: string);
begin
 sRow := str1.Row;
 if Acol = 1 then Value := 'AAAA';
end;

end.
