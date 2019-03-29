unit PIT20500;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, OnSkinBtn, ComCtrls, OnScheme, Db, MemDS, DBAccess, Ora, pass, Grids;

type
  TMainForm = class(TForm)
    Pa_Work: TPanel;
    P_helpinfo: TStatusBar;
    OnSchemeForm1: TOnSchemeForm;
    Qry_pmas1: TOraQuery;
    Qry_dept: TOraQuery;
    Qry_empfind: TOraQuery;
    Qry_pmas2: TOraQuery;
    Qry_pmas3: TOraQuery;
    Das_pmas: TDataSource;
    Qry_empfindEMPNO: TStringField;
    Qry_empfindKORNAME: TStringField;
    Qry_empfindDEPTNAME: TStringField;
    Qry_empfindAFTDEPTNAME1: TStringField;
    Qry_empfindAFTDEPTNAME2: TStringField;
    Qry_empfindAFTDEPTNAME3: TStringField;
    Qry_empfindAFTCONYN1: TStringField;
    Qry_empfindAFTCONYN2: TStringField;
    Qry_empfindAFTCONYN3: TStringField;
    Qry_empfindSTATE1: TStringField;
    Qry_empfindSTATE2: TStringField;
    Qry_empfindSTATE3: TStringField;
    Bt_Form1: TOnSkinButton;
    Bt_Form2: TOnSkinButton;
    bt_exit: TOnSkinButton;
    Bt_Form3: TOnSkinButton;
    Qry_deptInsert: TOraQuery;
    Bt_Form4: TOnSkinButton;
    Ory_vari: TOraQuery;
    Ory_monum: TOraQuery;
    Ory_deptcode: TOraQuery;
    Qry_empfindAFTDEPTCODE1: TStringField;
    Qry_empfindAFTDEPTCODE2: TStringField;
    Qry_empfindAFTDEPTCODE3: TStringField;
    Qry_empfindSTATE: TStringField;
    Ora_Session: TOraSession;
    procedure ButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bt_exitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    gsMonum : String;
    selForm : TForm;
    HomeDir     : String;
    P_SaveEmpno : String;
    p_korname   : String;
    password    : String;
    pDBUsrname  : String;
    pDBPass     : String;
    pSvrname    : String;
    procedure PStringGridClear(sgd : TStringGrid; sCol, sRow : Integer);
  end;

var
  MainForm: TMainForm;

implementation

uses PIT20501, PIT20502, PIT20503, PIT20504;

{$R *.DFM}

procedure TMainForm.ButtonClick(Sender: TObject);
begin
  Try
    if (SelForm <> nil) or Assigned(SelForm) then
    begin
      SelForm.Free;
      SelForm := nil;
    end;

    Bt_Form1.BtnDown  := False;
    Bt_Form2.BtnDown  := False;
    Bt_Form3.BtnDown  := False;
    Bt_Form4.BtnDown  := False;

    TOnSkinButton(Sender).BtnDown := True;

    case TComponent(Sender).Tag of
      1 : selForm := TFm_SubForm1.Create(nil);
      2 : SelForm := TFm_SubForm2.Create(nil);
      3 : SelForm := TFm_SubForm3.Create(nil);
      4 : SelForm := TFm_SubForm4.Create(nil);
    end;

    if Assigned(SelForm) then
    begin
      SelForm.BorderStyle := bsNone;
      SelForm.Parent      := Pa_Work;
      SelForm.WindowState := wsMaximized;
      SelForm.Tag         := 1;
      SelForm.Show;
    end;

  Except
    begin
      SelForm.Free;
      SelForm := nil;
    end;
  End;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  Application.ProcessMessages;
//  P_helpinfo.Text := ' 데이타베이스에 접속중입니다...';

//  HomeDir      := HomeDirOpen;
  P_SaveEmpno  := PassEmp(cmdline,1);
  p_korname    := PassEmp(cmdline,2);
  password     := PassEmp(cmdline,3);
  pDBUsrname   := PassEmp(cmdline,5);
  pDBPass      := PassEmp(cmdline,6);
  pSvrname     := PassEmp(cmdline,13);

  Ora_Session.Connected     := False;
  Ora_Session.ConnectPrompt := False;
  Ora_Session.Options.Net   := True;

  Ora_Session.Options.Net   := True;
  Ora_Session.ConnectPrompt := False;
  Ora_Session.Username      := PassEmp(cmdline,5);
  Ora_Session.Password      := PassEmp(cmdline,6);
  Ora_Session.Server        := PassEmp(cmdline,7)+':'+PassEmp(cmdline,9)+':'+PassEmp(cmdline,8);
  try
     Ora_Session.Connected := True;
  except on E : Exception do
     Application.MessageBox(PChar('서버에 접속할 수 없습니다...'#13#13+E.Message),'알 림',MB_OK);
  end;

{
  Ora_Session.Username      := 'hperson';
  Ora_Session.Password      := 'dbthfk';
  Ora_Session.Server        := '10.4.4.61:1522:insa';
  jissi home
  Ora_Session.Username      := 'system';
  Ora_Session.Password      := 'manager';
  Ora_Session.Server        := 'dsa2000-com:1521:dsainsa'; {}

   gsMonum := 'M02';

  try
    Ora_Session.Connected  := True;
  except on E : Exception do
    Application.MessageBox(PChar('서버에 접속할 수 없습니다...'#13#13+
                                 E.Message),'알 림',MB_OK);
  end;
end;


procedure TMainForm.bt_exitClick(Sender: TObject);
begin
   Close;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;
//-----------------------------------------------------------------------------------------------------------------------

procedure TMainForm.PStringGridClear(sgd : TStringGrid; sCol, sRow : Integer);
var
   iIdx , jIdx : Integer;
begin
   for iIdx := 0 to sCol  - 1 do
      for jIdx := 1 to sRow - 1 do
      sgd.Cells[iIdx, jIdx] := '';
   sgd.RowCount := 2;
end;
//-----------------------------------------------------------------------------------------------------------------------


end.
