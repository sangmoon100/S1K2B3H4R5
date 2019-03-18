unit pkg10303;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, DB, DBTables;

type
  TForm3 = class(TForm)
    Phelpmsg: TPanel;
    DataSource1: TDataSource;
    QryP3: TQuery;
    Panel2: TPanel;
    BBrun: TBitBtn;
    BBhelp: TBitBtn;
    BBclose: TBitBtn;
    DBGrid1: TDBGrid;
    QryDept: TQuery;
    QryP3EMPNO: TStringField;
    QryP3PAYYN: TStringField;
    QryP3KORNAME: TStringField;
    QryP3ORGNUM: TStringField;
    QryP3DEPTCODE: TStringField;
    QryP3deptnm: TStringField;
    BBsrch: TBitBtn;
    QryUP: TQuery;
    BBsearch: TBitBtn;
    Qrysrch2: TQuery;
    procedure BBcloseClick(Sender: TObject);
    procedure QryP3CalcFields(DataSet: TDataSet);
    procedure BBsrchClick(Sender: TObject);
    procedure BBrunClick(Sender: TObject);
    procedure Panel2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure BBsearchClick(Sender: TObject);
  private
         Procedure haji_Load;
         Function DeptA(Orgnum, DeptCode : String) : String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.DFM}

{�ݱ� ��ư�� ��������..........................................................}
procedure TForm3.BBcloseClick(Sender: TObject);
begin
     Close;
end;

{�̽�û �������� ������ List�� �λ� ���� ������..................................}
Procedure TForm3.haji_Load;
begin
     QryP3.Close;
     QryP3.SQL.Clear;
     QryP3.SQL.ADD(' SELECT PKMPMAS.EMPNO, PKMPMAS.KORNAME,       ');
     QryP3.SQL.ADD('        PKMPMAS.ORGNUM, PKMPMAS.DEPTCODE,     ');
     QryP3.SQL.ADD('        PKMPMAS.PAYYN                         ');
     QryP3.SQL.ADD('   FROM DPER.PKMPMAS, DPER.PKMFMMAS           ');
     QryP3.SQL.ADD('  WHERE (PKMPMAS.EMPNO IN PKMFMMAS.EMPNO) AND ');
     QryP3.SQL.ADD('        (PKMPMAS.PAYYN = ''N'' )              ');
     QryP3.Open;

end;

{�μ� �ʵ带 ����� �μ����� �����ش�............................................}
procedure TForm3.QryP3CalcFields(DataSet: TDataSet);
begin
     QryP3.FieldByName('deptnm').AsString := DeptA(QryP3.FieldByName('orgnum').AsString,
                                                   QryP3.FieldByName('deptcode').AsString);
end;

{�μ��� �ҷ����� �Լ�...........................................................}
Function TForm3.DeptA(Orgnum, DeptCode : String) : String;
begin
     QryDept.Close;
     QryDept.SQL.Clear;
     QryDept.SQL.ADD(' SELECT DEPTNAME ');
     QryDept.SQL.ADD('   FROM DPER.PYCDEPT');
     QryDept.SQL.ADD(' WHERE ORGNUM = :orgnum AND ');
     QryDept.SQL.ADD('       DEPTCODE = :deptcode ');
     QryDept.ParamByName('orgnum').AsString := Orgnum;
     QryDept.ParamByName('deptcode').AsString := DeptCode;
     QryDept.Open;

     DeptA := QryDept.FieldByName('deptname').AsString;
end;

{�̽�û �������� ������ List�� �λ� ���� ������..................................}
procedure TForm3.BBsrchClick(Sender: TObject);
begin
     haji_Load;
end;

{���� ��ư�� ������. ��ȸ�� ������ ������ UPDATE �Ѵ�............................}
procedure TForm3.BBrunClick(Sender: TObject);
begin
     QryUP.Close;
     QryUP.SQL.Clear;
     QryUP.SQL.ADD(' UPDATE DPER.PKMFMAPP                                          ');
     QryUP.SQL.ADD('    SET APPKIND = ''B1''                                       ');
     QryUP.SQL.ADD('  WHERE EMPNO = ( SELECT EMPNO                                 ');
     QryUP.SQL.ADD('                    FROM DPER.PKMPMAS, DPER.PKMFMMAS           ');
     QryUP.SQL.ADD('                   WHERE (PKMPMAS.EMPNO IN PKMFMMAS.EMPNO) AND ');
     QryUP.SQL.ADD('                         (PKMPMAS.PAYYN = ''N'' ))             ');
     QryUP.ExecSQL;

end;

{}
procedure TForm3.Panel2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
     Case TBitbtn(Sender).Tag of
          1: Phelpmsg.Caption := '�������� �λ���� �����ڸ� ��ȸ�մϴ�.';
          2: Phelpmsg.Caption := '�������� ���ؿ��� �ʰ��ڸ� ��ȸ�մϴ�.';
          3: Phelpmsg.Caption := '��ȸ�� ������ �ϰ� ó���մϴ�.';
          4: Phelpmsg.Caption := '';
          5: Phelpmsg.Caption := '���α׷� �ݱ�.';
        else
             Phelpmsg.Caption := '';
     end;
end;

{��ȸ2 ��ư�� ������........���ؿ����ʰ���......................................}
procedure TForm3.BBsearchClick(Sender: TObject);
begin
     Qrysrch2.Close;
     Qrysrch2.SQL.Clear;
     Qrysrch2.SQL.ADD(' SELECT PKMPMAS.EMPNO, PKMPMAS.KORNAME,       ');
     Qrysrch2.SQL.ADD('        PKMPMAS.ORGNUM, PKMPMAS,DPETCODE,     ');
     Qrysrch2.SQL.ADD('   FROM DPER.PKMPMAS, DPER.PKMFMMAS           ');
     Qrysrch2.SQL.ADD('  WHERE (PKMPMAS.EMPNO IN PKMFMMAS.EMPNO) AND ');
     Qrysrch2.SQL.ADD('        (PKMFMMAS.                            ');
     Qrysrch2.SQL.ADD('                                              ');

end;

end.


