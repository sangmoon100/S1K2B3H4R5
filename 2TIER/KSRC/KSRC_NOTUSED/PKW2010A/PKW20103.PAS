unit pkw20103;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Db, DBTables, peoutlookbtn, Ora, Func;//PASS,

type
  TMainForm = class(TForm)
    Panel1: TPanel;
    Lempno: TLabel;
    Lsysdate: TLabel;
    Panel9: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    Bt_Exit: TPeJeonOutLookBtn;
    Sb_Fpkcigbas: TPeJeonOutLookBtn;
    Sb_Fpkcigtbl: TPeJeonOutLookBtn;
    procedure FormActivate(Sender: TObject);
    procedure Sb_FpkcigbasClick(Sender: TObject);
    procedure Sb_FpkcigtblClick(Sender: TObject);
    procedure Bt_ExitClick(Sender: TObject);

  private
    { Private declarations }
    SelForm  : TForm;
    procedure SubFormCreate(Sender : TObject);

  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses pkw20101, pkw20201, pkw20104;


{$R *.DFM}
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
            sb_Fpkcigbas.Font.Color := clBlue;
            sb_Fpkcigtbl.Font.Color := clBlack;
            SelForm := TFpkcigbas.Create(nil);
          end;
      2 : begin
            sb_Fpkcigbas.Font.Color := clBlack;
            sb_Fpkcigtbl.Font.Color := clBlue;
            SelForm := TFpkcigtbl.Create(nil);
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

procedure TMainForm.FormActivate(Sender: TObject);
begin
     OraConnect;
     Application.ProcessMessages;
     Lempno.Caption := Pkorname+'('+Pempno+')';

     Lsysdate.caption := fn_GetDateStr;

     SubFormCreate(sb_Fpkcigbas);
end;

procedure TMainForm.Sb_FpkcigbasClick(Sender: TObject);
begin
   SubFormCreate(Sender);
end;

procedure TMainForm.Sb_FpkcigtblClick(Sender: TObject);
begin
  SubFormCreate(Sender);
end;

procedure TMainForm.Bt_ExitClick(Sender: TObject);
begin
  if DM.Table1.Modified = True then
     begin
          if Application.MessageBox('자료가 변경되었습니다. 종료하시겠습니까?', '작업안내', mb_YesNo) = IDYES then
          begin
               DM.Table1.Cancel;
               Close;
          end
          else
              exit;
     end
     else
         if IDNO = Application.MessageBox('작업을 종료하시겠습니까?',  '작업안내', MB_YesNo) then
          exit;
          Close;
end;

end.
