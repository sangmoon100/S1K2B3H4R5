unit pia10804;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, Mask, HanEdit, jeonPan, DeptCode;

type
  Tpia10804Form = class(TForm)
    JeonPanel11: TJeonPanel;
    dept1: THanEdit;
    JeonPanel1: TJeonPanel;
    dept2: THanEdit;
    Bdept1: TSpeedButton;
    Bdept2: TSpeedButton;
    Bsel: TBitBtn;
    Bexit: TBitBtn;
    procedure BDeptClick(Sender: TObject);
    procedure BexitClick(Sender: TObject);
    procedure BselClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  pia10804Form: Tpia10804Form;

implementation
uses pia10801;
{$R *.DFM}

procedure Tpia10804Form.BDeptClick(Sender: TObject);
begin
     FDeptCode := TFDeptCode.Create(Self);
     try
          FDeptCode.EdOrgnum.Text := pia10801Form.WorkMan.Orgnum;
          FDeptCode.ShowModal;

          if FDeptCode.CloseChk = -1 then Exit;

          if Tcomponent(Sender).Tag = 1 then begin
             Dept1.Text     := FDeptCode.GSdeptcode;
             Dept1.SetFocus;
          end;
          if Tcomponent(Sender).Tag = 2 then begin
             Dept2.Text     := FDeptCode.GSdeptcode;
             Dept2.SetFocus;
          end;
     finally
          FDeptCode.Free;
     end;
end;

procedure Tpia10804Form.BexitClick(Sender: TObject);
begin
  pia10801Form.paFrom := '';
  pia10801Form.paTo   := '';
  close;
end;

procedure Tpia10804Form.BselClick(Sender: TObject);
begin
  pia10801Form.paFrom := Dept1.Text;
  pia10801Form.paTo   := Dept2.Text;
  close;
end;

end.
