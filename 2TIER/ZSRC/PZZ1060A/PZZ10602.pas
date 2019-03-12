unit PZZ10602;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, MemDS, DBAccess, Ora, Func, Pass;

type
  TUserAuth = class(TForm)
    Ora_Auth: TOraQuery;
    procedure FormCreate(Sender: TObject);

    // 사용자 권한 조회
    //function UserAuthority : Boolean;
    // 그룹 권한 조회
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
  // 환경 셋팅
  OraConnect;
  Pempno   := PassEmp(cmdline,1);
  Pkorname := PassEmp(cmdline,2);
  Pgrade   := Passemp(cmdline,4);

  // 운영 개발자는 모든 사용자 권한으로..
  if Copy(Pempno,1,1) = 'D' then
    Pempno := '0000';
end;

// 사용자 권한 조회
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

// 그룹 권한 조회
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
