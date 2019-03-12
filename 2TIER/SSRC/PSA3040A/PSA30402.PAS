unit Psa30402;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Mask;
type
  TFpsa30402 = class(TForm)
    Shape7: TShape;
    Label1: TLabel;
    Label2: TLabel;
    PA: TPanel;
    Panel1: TPanel;
    Panel3: TPanel;
    PD: TPanel;
    Panel5: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    Panel6: TPanel;
    BitBtn2: TBitBtn;
    PB: TPanel;
    PC: TPanel;
    PE: TPanel;
    PF: TPanel;
    Panel7: TPanel;
    MEdate_1: TMaskEdit;
    BitBtn3: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    GSClose : integer;
  end;

var
  Fpsa30402: TFpsa30402;

implementation

uses Psa30401, kylib1;
{$R *.DFM}

procedure TFpsa30402.BitBtn2Click(Sender: TObject);
begin
  GSClose := -1;
  Close;
end;

procedure TFpsa30402.FormActivate(Sender: TObject);
begin
  FPsa30401.EempnoGubun := FPsa30401.OraQuery2F_EMPNO.AsString;
  PA.Caption    := FPsa30401.OraQuery2F_EMPNO.AsString;
  PB.Caption    := Copy(FPsa30401.OraQuery2F_LOANDATE.AsString, 1, 4) + '-' +
                   Copy(FPsa30401.OraQuery2F_LOANDATE.AsString, 5, 2) + '-' +
                   Copy(FPsa30401.OraQuery2F_LOANDATE.AsString, 7, 2);
  PC.Caption    := Copy(FPsa30401.OraQuery2F_REPTODATE.AsString, 1, 4) + '-' +
                   Copy(FPsa30401.OraQuery2F_REPTODATE.AsString, 5, 2);
  PD.Caption    := FPsa30401.OraQuery2F_KORNAME.AsString;
  PE.Caption    := Format('%12.0n', [FPsa30401.OraQuery2F_LOANAMT.AsFloat]);
  PF.Caption    := Format('%12.0n', [FPsa30401.OraQuery2F_BEFOREAMT.AsFloat]);
  MEdate_1.Text := Copy(Trim(FPsa30401.Ppre.Caption),1,4)+Copy(Trim(FPsa30401.Ppre.Caption),6,2)+
                   Copy(Trim(FPsa30401.Ppre.Caption),9,2);
end;

procedure TFpsa30402.BitBtn3Click(Sender: TObject);
begin
  if Length(Trim(MEdate_1.Text)) = 8 then
  begin
       if DateCheck(Copy(MEdate_1.Text,1,4),Copy(MEdate_1.Text,5,2),Copy(MEdate_1.Text,7,2))= -1 then
       begin
            MessageBox(Handle,'일시상환일자 확인바랍니다', '일자오류', mb_iconwarning);
            MEdate_1.SetFocus;
            Exit;
       end
       else
       begin
            GSClose := 1;
            Close;
       end;
  end
  else
  begin
       MessageBox(Handle,'일시상환일자 확인바랍니다', '일자오류', mb_iconwarning);
       MEdate_1.SetFocus;
       Exit;
  end;
end;

end.
