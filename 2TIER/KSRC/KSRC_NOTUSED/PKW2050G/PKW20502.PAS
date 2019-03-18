{===================== Program Header ==========================================
PROGRAM-NAME    :  PKW2050G(일반직 근태마감/집계)
SYSTEM-NAME     : 종합인사정보
SUBSYSTEM-NAME  : 급여
Programmer      : 유효성
Version         : 1.00
Date            : 2000.05.10

Update Contents
 Version date(yy.mm.dd) programmer  relevant doc.no    description
  1.01    2001.04.02      유효성      BY 정여진       입사포기자('80')는 체크리스트에서 제외
-------------------------------------------------------------------------------}
unit pkw20502;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  peoutlookbtn, StdCtrls, ExtCtrls, Func;//, pass

type
  TMainForm = class(TForm)
    Panel1: TPanel;
    Lempno: TLabel;
    Lsysdate: TLabel;
    Panel9: TPanel;
    Panel2: TPanel;
    Bt_Exit: TPeJeonOutLookBtn;
    Sb_Fpkhigduty: TPeJeonOutLookBtn;
    Sb_Fpkhigdusum: TPeJeonOutLookBtn;
    Panel4: TPanel;
    procedure FormActivate(Sender: TObject);
    procedure Sb_FpkhigdutyClick(Sender: TObject);
    procedure Sb_FpkhigdusumClick(Sender: TObject);
    procedure Bt_ExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    start: Boolean;
    SelForm  : TForm;
    procedure SubFormCreate(Sender : TObject);

  public
    { Public declarations }

  end;

var
  MainForm: TMainForm;

implementation

uses pkw20503, pkw20504,pkw20501 ;

{$R *.DFM}

procedure TMainForm.FormCreate(Sender: TObject);
begin
  start := false;
end;

procedure TMainForm.FormActivate(Sender: TObject);
begin
     if start then
       System.exit;

     OraConnect;
     start := true;

     Lempno.Caption := Pkorname+'('+Pempno+')';

     Lsysdate.caption := fn_GetDateStr;

     SubFormCreate(sb_Fpkhigduty);

end;

procedure TMainForm.SubFormCreate(Sender : TObject);
begin
  Try
    if (SelForm <> nil) or Assigned(SelForm) then
      begin
        SelForm.Free;
        SelForm := nil;
      end;

    case TComponent(Sender).Tag of
      1 : begin
            sb_Fpkhigduty.Font.Color  := clBlue;
            sb_Fpkhigdusum.Font.Color := clBlack;
            SelForm := TFpkhigduty.Create(nil);
          end;
      2 : begin
            sb_Fpkhigduty.Font.Color  := clBlack;
            sb_Fpkhigdusum.Font.Color := clBlue;
            SelForm := TFpkhigdusum.Create(nil);
          end;

    end;
    SelForm.Parent      := Panel4;
    SelForm.WindowState := wsMaximized;
    SelForm.Show;
  Except
    begin
      SelForm.Free;
      SelForm := nil;
    end;
  End;
end;

procedure TMainForm.Sb_FpkhigdutyClick(Sender: TObject);
begin
   SubFormCreate(Sender);
end;

procedure TMainForm.Sb_FpkhigdusumClick(Sender: TObject);
begin
   SubFormCreate(Sender);
end;

procedure TMainForm.Bt_ExitClick(Sender: TObject);
begin
  close;
end;

end.
