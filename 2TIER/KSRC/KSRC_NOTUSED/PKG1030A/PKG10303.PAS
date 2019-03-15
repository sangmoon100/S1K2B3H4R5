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

{닫기 버튼을 눌렀을때..........................................................}
procedure TForm3.BBcloseClick(Sender: TObject);
begin
     Close;
end;

{미신청 가족수당 해지자 List중 인사 상태 변동자..................................}
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

{부서 필드를 만들고 부서명을 보여준다............................................}
procedure TForm3.QryP3CalcFields(DataSet: TDataSet);
begin
     QryP3.FieldByName('deptnm').AsString := DeptA(QryP3.FieldByName('orgnum').AsString,
                                                   QryP3.FieldByName('deptcode').AsString);
end;

{부서를 불러오는 함수...........................................................}
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

{미신청 가족수당 해지자 List중 인사 상태 변동자..................................}
procedure TForm3.BBsrchClick(Sender: TObject);
begin
     haji_Load;
end;

{해지 버튼을 눌렀다. 조회로 쿼리한 내용을 UPDATE 한다............................}
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
          1: Phelpmsg.Caption := '지급자중 인사상태 변동자를 조회합니다.';
          2: Phelpmsg.Caption := '지급자중 기준연령 초과자를 조회합니다.';
          3: Phelpmsg.Caption := '조회한 내역을 일괄 처리합니다.';
          4: Phelpmsg.Caption := '';
          5: Phelpmsg.Caption := '프로그램 닫기.';
        else
             Phelpmsg.Caption := '';
     end;
end;

{조회2 버튼을 눌렀다........기준연령초과자......................................}
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



