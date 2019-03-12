unit PZZ10602;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, MemDS, DBAccess, Ora, Func, Pass;

type
  TUserAuth = class(TForm)
    Ora_Auth: TOraQuery;
    procedure FormCreate(Sender: TObject);

    // ����� ���� ��ȸ
    //function UserAuthority : Boolean;
    // �׷� ���� ��ȸ
    procedure GroupAuthority(UserId : String);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UserAuth: TUserAuth;

implementation

{$R *.DFM}

procedure TUserAuth.FormCreate(Sender: TObject);
begin
  // ȯ�� ����
  OraConnect;
  Pempno   := PassEmp(cmdline,1);
  Pkorname := PassEmp(cmdline,2);
  Pgrade   := Passemp(cmdline,4);

  // � �����ڴ� ��� ����� ��������..
  if Copy(Pempno,1,1) = 'D' then
    Pempno := '0000';
end;

// ����� ���� ��ȸ
{function TUserAuth.UserAuthority: Boolean;
begin
  with Ora_Auth do
  begin
    Close;
    Sql.Clear;

    Sql.Add('SELECT count(USERID) AUTH ');
    Sql.Add('  FROM AQUSER             ');
    Sql.Add(' WHERE USERID = :Pempno   ');

    ParamByName('Pempno').AsString := Pempno;

    Open;

    if FieldByName('AUTH').AsInteger = 1 then Result := True
                                         else Result := False;
  end;

end;}

// �׷� ���� ��ȸ
procedure TUserAuth.GroupAuthority(UserId : String);
begin
  with Ora_Auth do
  begin

    Close;              
    Sql.Clear;

    Sql.Add('SELECT GROUPNAME          ');
    Sql.Add('  FROM AQGRUSER           ');
    Sql.Add(' WHERE USERID = :Pempno   ');
    {Sql.Add(' WHERE (USER01 = :Pempno  ');
    Sql.Add('    or  USER02 = :Pempno  ');
    Sql.Add('    or  USER03 = :Pempno  ');
    Sql.Add('    or  USER04 = :Pempno  ');
    Sql.Add('    or  USER05 = :Pempno  ');
    Sql.Add('    or  USER06 = :Pempno  ');
    Sql.Add('    or  USER07 = :Pempno  ');
    Sql.Add('    or  USER08 = :Pempno  ');
    Sql.Add('    or  USER09 = :Pempno  ');
    Sql.Add('    or  USER10 = :Pempno) ');
    Sql.Add('    or  USER11 = :Pempno  ');
    Sql.Add('    or  USER12 = :Pempno  ');
    Sql.Add('    or  USER13 = :Pempno  ');
    Sql.Add('    or  USER14 = :Pempno  ');
    Sql.Add('    or  USER15 = :Pempno) ');
    Sql.Add(' GROUP BY GROUPNAME       ');}

    ParamByName('Pempno').AsString := UserId;

    Open;
  end;
end;

procedure TUserAuth.FormDestroy(Sender: TObject);
begin
  UserAuth := nil;
end;

end.
