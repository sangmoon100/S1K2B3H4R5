unit pib30304;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, DB, StdCtrls, Buttons, Gauges, ExtCtrls, Tabs, TabNotBk,
  Mask, DBTables, Quickrpt, Grids, DBGrids,
  Calen1, pass, Datelib, Timeftp, numedit, jgrid, Func;

type
  Tpib30304Form = class(TForm)
    Panel1: TPanel;
    SpeedButton2: TSpeedButton;
    Label7: TLabel;
    SpeedButton3: TSpeedButton;
    Panel19: TPanel;
    ME_certfr: TMaskEdit;
    ME_certto: TMaskEdit;
    Panel3: TPanel;
    Ed_empno: TEdit;
    Panel2: TPanel;
    BB_Close: TBitBtn;
    BitBtn1: TBitBtn;
    cb_batch: TCheckBox;
    cb_admin: TCheckBox;
    procedure BB_CloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  pib30304Form: Tpib30304Form;
  gi_Certfr, gi_Certto, gi_empno : String;

implementation
uses Pib30301;
{$R *.DFM}

procedure Tpib30304Form.BB_CloseClick(Sender: TObject);
begin
   Close;
end;

procedure Tpib30304Form.FormShow(Sender: TObject);
begin
   ME_certfr.Text := Fn_GetPreday(7) ;
   ME_certto.Text := Copy(Fn_GetDateTimeStr,1,8);
end;

procedure Tpib30304Form.SpeedButton2Click(Sender: TObject);
begin
     calendar := TCalendar.Create(Self);
     Try
        calendar.ShowModal;
        If calendar.DayCaption = '' then exit;

        ME_certfr.Text := calendar.DayCaption;
     Finally
        calendar.Free;
     end;
end;

procedure Tpib30304Form.SpeedButton3Click(Sender: TObject);
begin
     calendar := TCalendar.Create(Self);
     Try
        calendar.ShowModal;
        If calendar.DayCaption = '' then exit;

        ME_certto.Text := calendar.DayCaption;
     Finally
        calendar.Free;
     end;
end;

procedure Tpib30304Form.BitBtn1Click(Sender: TObject);
begin
   gi_Certfr := ME_certfr.Text;
   gi_Certto := ME_certto.Text;
   gi_empno  := Ed_empno.Text;
   if      Pib30301Form.gu1 = 1 then
        Pib30301Form.StuffClick(Pib30301Form.R_a1)
   else if Pib30301Form.gu1 = 2 then
        Pib30301Form.StuffClick(Pib30301Form.R_a2)
   else if Pib30301Form.gu1 = 3 then
        Pib30301Form.StuffClick(Pib30301Form.R_a3)
   else if Pib30301Form.gu1 = 4 then
        Pib30301Form.StuffClick(Pib30301Form.R_a4) 
   else Pib30301Form.StuffClick(Sender);
   Close;
end;

end.
