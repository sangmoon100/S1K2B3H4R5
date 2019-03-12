unit PZZ10703;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, OnScheme, OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl,
  OnEditCombo, Db, MemDS, DBAccess, Ora, Func, StdCtrls, OnFocusButton,
  ComCtrls, Pass;

type
  TForm3 = class(TForm)
    OnSchemeForm1: TOnSchemeForm;
    Ora_DML: TOraQuery;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel4: TPanel;
    Bevel2: TBevel;
    Panel5: TPanel;
    Panel6: TPanel;
    fb_Copy: TOnFocusButton;
    oe_To: TOnEdit;
    oe_From: TOnEdit;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    fb_Del: TOnFocusButton;
    oe_UserId: TOnEdit;
    Ora_KorName: TOraQuery;
    procedure FormCreate(Sender: TObject);
    procedure fb_CopyClick(Sender: TObject);
  private
    { Private declarations }
    function GetKornameByUserId(UserId : String) : String;
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.DFM}

procedure TForm3.FormCreate(Sender: TObject);
begin
  OraConnect;

  Pempno   := PassEmp(cmdline,1);
end;

procedure TForm3.fb_CopyClick(Sender: TObject);
begin
  if PageControl1.ActivePage = TabSheet1 then // ����� �׷� ���� ����
  begin
    //if IDNO = Application.MessageBox(PChar(oe_Korname.Text+'('+UserId+')�� ����� �׷� ������ �����Ͻðڽ��ϱ�?'),'�۾��ȳ�', MB_YesNo) then Exit;

    with Ora_DML do
    begin
      Close;
      Sql.Clear;
      Sql.Add('DELETE AQGRUSER WHERE USERID = :ToId            ');
      ParamByName('ToId').AsString      := oe_To.Text;
      ExecSQL;

      Sql.Clear;
      Sql.Add('INSERT INTO AQGRUSER                                 ');
      Sql.Add(' VALUE                                               ');
      Sql.Add('      (                                              ');
      Sql.Add('       SELECT GROUPNAME                              ');
      Sql.Add('             ,:ToId                                  ');
      Sql.Add('             ,TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'')  ');
      Sql.Add('             ,:Pempno WRITEMAN                       ');
      Sql.Add('         FROM AQGRUSER                               ');
      Sql.Add('        WHERE USERID = :FromId                       ');
      Sql.Add('      )                                              ');

      ParamByName('FromId').AsString    := oe_From.Text{GetUserIdByUserName(oce_From2.Text)};
      ParamByName('ToId').AsString      := oe_To.Text{GetUserIdByUserName(oce_To2.Text)};
      ParamByName('Pempno').AsString      := Pempno;
      ExecSQL;

      Showmessage('���� ���簡 �Ϸ�ƽ��ϴ�.');
    end; // with end
  end
  else if PageControl1.ActivePage = TabSheet2 then // ����� �׷� ���� ����
  begin
    if IDNO = Application.MessageBox(PChar(GetKornameByUserId(oe_UserId.Text)+'('+oe_UserId.Text+')�� ����� �׷� ������ ��� �����Ͻðڽ��ϱ�?'),'�۾��ȳ�', MB_YesNo) then Exit;

    with Ora_DML do
    begin
      Close;
      Sql.Clear;
      Sql.Add('DELETE AQGRUSER WHERE USERID = :UserId            ');
      ParamByName('UserId').AsString      := oe_UserId.Text;

      ExecSQL;

      Showmessage('�ϰ� ������ �Ϸ�ƽ��ϴ�.');
    end;
  end; // if end
end;

function TForm3.GetKornameByUserId(UserId: String): String;
begin
  with Ora_KorName do
  begin
    Close;
    Sql.Clear;

    Sql.Add('SELECT a.KORNAME                      ');
    Sql.Add('  FROM PIMPMAS a                      ');
    Sql.Add(' WHERE a.EMPNO     = :UserId          ');

    ParamByName('UserId').AsString := UserId;

    Open;

    Result := FieldByName('KORNAME').AsString;
  end;
end;

end.
 