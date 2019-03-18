unit FMempno;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, Db, MemDS, DBAccess, Ora, StdCtrls, Buttons;

type
  TempForm = class(TForm)
    OraQuery1: TOraQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    OraQuery1EMPNO: TStringField;
    OraQuery1KORNAME: TStringField;
    OKBtn: TBitBtn;
    exit: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure exitClick(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    DataVal1 : String;
    Empno    : String;  {코드}
    KorName  : String;  {코드명}
  end;

var
  empForm: TempForm;

implementation

{$R *.DFM}

uses pkg5010a1;

procedure TempForm.FormActivate(Sender: TObject);
begin
  with OraQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add ( 'SELECT EMPNO, KORNAME    ');
    SQL.Add ( '  FROM PIMPMAS           ');
    SQL.Add ( ' WHERE PSTATE < ''70''   ');
//infra    SQL.Add ( '   AND PAYRA  > ''2C''   ');
    SQL.Add ( '   AND PAYRA  > ''C11''                                    ');
    SQL.Add ( '   AND DEPTCODE          ');
    SQL.Add ( '       LIKE ( SELECT DISTINCT SUBSTR(DEPTCODE,1,4)||''%''  ');
    SQL.Add ( '                FROM PYCDEPT B, PIMVARI C                  ');
    SQL.Add ( '               WHERE C.GUBUN  = ''00''                     ');
    SQL.Add ( '                 AND C.SGUBUN = ''0001''                   ');
    SQL.Add ( '                 AND B.ORGNUM = C.VALUE1                   ');
    SQL.Add ( '                 AND B.DEPTNAME LIKE ''%인력개발%''  )     ');
    SQL.Add ( ' ORDER BY PAYRA, EMPNO                                     ');

    Open;
  end;
end;

procedure TempForm.DBGrid1DblClick(Sender: TObject);
begin
   Empno    := OraQuery1Empno.AsString;
   KorName  := OraQuery1KorName.AsString;
   ModalResult := mrOK;
   OraQuery1.Close;

   close;
end;

procedure TempForm.DBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
  Field: TField; State: TGridDrawState);
begin
   Empno    := OraQuery1Empno.AsString;
   KorName  := OraQuery1KorName.AsString;
end;

procedure TempForm.exitClick(Sender: TObject);
begin
  Empno := '';
  Korname := '';
  ModalResult := mrCancel;

  OraQuery1.Close;
  close;
end;

procedure TempForm.OKBtnClick(Sender: TObject);
begin
   Empno   := OraQuery1Empno.AsString;
   KorName := OraQuery1Korname.AsString;
   ModalResult := mrOK;

   OraQuery1.Close;
   close;
end;

procedure TempForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := CaFree;
end;

end.
