unit Psa32402;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Mask, OnScheme, OnEditStdCtrl,
  OnEditBaseCtrl, OnFocusButton;
type
  TFpsa32402 = class(TForm)
    PA: TOnEdit;
    PD: TOnEdit;
    PB: TOnEdit;
    PE: TOnEdit;
    PC: TOnEdit;
    PF: TOnEdit;
    MEdate_1: TOnMaskEdit;
    SF_Main: TOnSchemeForm;
    Panel1: TPanel;
    BitBtn2: TOnFocusButton;
    BitBtn3: TOnFocusButton;
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
  Fpsa32402: TFpsa32402;

implementation

uses Psa32401, kylib1;
{$R *.DFM}

procedure TFpsa32402.BitBtn2Click(Sender: TObject);
begin
  GSClose := -1;
  Close;
end;

procedure TFpsa32402.FormActivate(Sender: TObject);
begin
  FPsa32401.EempnoGubun := FPsa32401.OraQuery2F_EMPNO.AsString;
  PA.Text    := FPsa32401.OraQuery2F_EMPNO.AsString;
  PB.Text    := Copy(FPsa32401.OraQuery2F_LOANDATE.AsString, 1, 4) + '-' +
                   Copy(FPsa32401.OraQuery2F_LOANDATE.AsString, 5, 2) + '-' +
                   Copy(FPsa32401.OraQuery2F_LOANDATE.AsString, 7, 2);
  PC.Text    := Copy(FPsa32401.OraQuery2F_REPTODATE.AsString, 1, 4) + '-' +
                   Copy(FPsa32401.OraQuery2F_REPTODATE.AsString, 5, 2);
  PD.Text    := FPsa32401.OraQuery2F_KORNAME.AsString;
  PE.Text    := Format('%12.0n', [FPsa32401.OraQuery2F_LOANAMT.AsFloat]);
  PF.Text    := Format('%12.0n', [FPsa32401.OraQuery2F_BEFOREAMT.AsFloat]);
  MEdate_1.Text := Copy(Trim(FPsa32401.Ppre.Text),1,4)+Copy(Trim(FPsa32401.Ppre.Text),6,2)+
                   Copy(Trim(FPsa32401.Ppre.Text),9,2);
  MEdate_1.SetFocus;
end;

procedure TFpsa32402.BitBtn3Click(Sender: TObject);
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
