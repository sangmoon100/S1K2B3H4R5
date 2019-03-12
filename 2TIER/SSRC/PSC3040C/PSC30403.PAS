unit psc30403;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, quickrpt, Qrctrls, Db, DBTables, qrprntr;

type
  TPrintForm = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRBand2: TQRBand;
    QRLempno: TQRLabel;
    QRLkorname: TQRLabel;
    QRLstlorg: TQRLabel;
    QRLstldate: TQRLabel;
    QRLstlamt: TQRLabel;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRBand3: TQRBand;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLsum_cnt: TQRLabel;
    QRLsum_stlamt: TQRLabel;
    QRLabel16: TQRLabel;
    QryA: TQuery;
    DataSource1: TDataSource;
    QryB: TQuery;
    QRLdivseqnum: TQRLabel;
    QRLstclass: TQRLabel;
    QryA_1: TQuery;
    procedure QuickRep1Preview(Sender: TObject);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    PageCnt : integer;
    procedure Get_datas;
    procedure Get_Nextdatas;
    procedure init_code(const Codeids : array of String);
    function PyccodeA(codeid,codeno : String) : String;
  end;

var
  PrintForm   : TPrintForm;
  CodeString  : TStringList;
  DataString  : TStringList;
  sum_cnt     : Integer;
  sum_stlamt  : Double;
  NextFlag    : Boolean;
  inwon       : Integer;
implementation

uses psc30401, psc30402;
{$R *.DFM}

// 코드설정.....................................................................
procedure TPrintForm.init_code;
var
  i : Integer;
begin
  CodeString := TStringList.Create;
  DataString := TStringList.Create;

  QryB.Close;
  QryB.sql.Clear;
  QryB.sql.Add('select codeid,codeno,codename from pyccode      ');
  QryB.sql.Add('where');
  for i := 0 to High(codeids) - 1 do
    QryB.sql.Add('(codeid = '''+codeids[i]+''') or              ');
    QryB.sql.Add('(codeid = '''+codeids[High(codeids)]+''')     ');
    QryB.Open;

  While not QryB.EOF do
  begin
    CodeString.Add(QryB.FieldByName('codeid').AsString +
                   QryB.FieldByName('codeno').AsString);
    DataString.Add(QryB.FieldByName('codename').AsString);
    QryB.Next;
  end;
  QryB.Close;
end;

// 코드조회.....................................................................
function TPrintForm.PyccodeA(codeid,codeno : String) : String;
var
  ind : Integer;
begin
  ind := CodeString.IndexOf(codeid + codeno);
  if ind > -1 then
    PyccodeA := DataString.Strings[ind]
  else
    PyccodeA := '';
end;

procedure TPrintForm.Get_datas;
begin
  MainForm.p_help.Caption := ' 작업중입니다...';
  Application.ProcessMessages;

  QryA.Close;
  QryA.sql.Clear;
  QryA.sql.Add(' select empno, korname, stlorg, stldate, stlamt, stclass        ');
  QryA.sql.Add(' from   pslmas                                                  ');
  QryA.sql.Add(' where  corpname = :corpname                                    ');
  QryA.sql.Add(' and    divseqnum = :divseqnum                                  ');
  QryA.sql.Add(' and    stclass like :stclass                                   ');
  QryA.sql.Add(' order by stclass, stlorg, empno                                ');
  QryA.ParamByName('corpname').AsString := MainForm.CB_corpname.Text;
  QryA.ParamByName('divseqnum').AsFloat := MainForm.SE_divseqnum.value;
  if Copy(MainForm.CB_stclass.Text,1,1) <> '6' then
     QryA.ParamByName('stclass').AsString  := Copy(MainForm.CB_stclass.Text,1,1) + '%'
  else
     QryA.ParamByName('stclass').AsString  := '%';
  QryA.Open;
end;

procedure TPrintForm.Get_Nextdatas;
begin
  QryA_1.Close;
  QryA_1.sql.Clear;
  QryA_1.sql.Add(' select empno, korname, stlorg, stldate, stlamt, stclass        ');
  QryA_1.sql.Add(' from   pslmas                                                  ');
  QryA_1.sql.Add(' where  corpname = :corpname                                    ');
  QryA_1.sql.Add(' and    divseqnum = :divseqnum                                  ');
  QryA_1.sql.Add(' and    stclass like :stclass                                   ');
  QryA_1.sql.Add(' order by stclass, stlorg, empno                                ');
  QryA_1.ParamByName('corpname').AsString := MainForm.CB_corpname.Text;
  QryA_1.ParamByName('divseqnum').AsFloat := MainForm.SE_divseqnum.value;
  if Copy(MainForm.CB_stclass.Text,1,1) <> '6' then
     QryA_1.ParamByName('stclass').AsString  := Copy(MainForm.CB_stclass.Text,1,1) + '%'
  else
     QryA_1.ParamByName('stclass').AsString  := '%';
  QryA_1.Open;
end;

procedure TPrintForm.QuickRep1Preview(Sender: TObject);
begin
  PreviewForm.QRPreview1.QRPrinter := TQRPrinter(Sender);
  PreviewForm.Show;
end;

procedure TPrintForm.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  Inc(inwon);
  QuickRep1.QRPrinter.Progress := (inwon * 100) div QryA.RecordCount;
  Application.ProcessMessages;

  QRLempno.Caption   := QryA.FieldByName('empno').AsString;
  QRLkorname.Caption := QryA.FieldByName('korname').AsString;
  QRLstlorg.Caption  := PyccodeA('K910',QryA.FieldByName('stlorg').AsString);
  QRLstldate.Caption := Copy(QryA.FieldByName('stldate').AsString,1,4) + '.' +
                        Copy(QryA.FieldByName('stldate').AsString,5,2) + '.' +
                        Copy(QryA.FieldByName('stldate').AsString,7,2);
  QRLstlamt.Caption  := FormatFloat('#,##0',QryA.FieldByName('stlamt').AsFloat);
  QryA_1.Next;
  sum_cnt    := sum_cnt + 1;
  sum_stlamt := QryA.FieldByName('stlamt').AsFloat + sum_stlamt;
end;

procedure TPrintForm.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLsum_cnt.Caption    := IntToStr(sum_cnt);
  QRLsum_stlamt.Caption := FormatFloat('#,##0',sum_stlamt);
end;

procedure TPrintForm.QRBand2AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  if Copy(MainForm.CB_stclass.Text,1,1) = '4' then
  begin
    if QryA.FieldByName('stclass').AsString <> QryA_1.FieldByName('stclass').AsString then
    begin
      NextFlag := True;
      QryA.Next;
      QuickRep1.NewPage;
    end else
      NextFlag := False;
  end;
end;

procedure TPrintForm.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
if Copy(MainForm.CB_stclass.Text,1,1) = '6' then
    begin
      if QryA.FieldByName('stclass').AsString = '1' then
        QRLstclass.Caption := '사주우선'
      else if QryA.FieldByName('stclass').AsString = '2' then
        QRLstclass.Caption := '사주실권'
      else if QryA.FieldByName('stclass').AsString = '3' then
        QRLstclass.Caption := '주주우선'
      else if QryA.FieldByName('stclass').AsString = '4' then
        QRLstclass.Caption := '주주우선(예탁)'
      else if QryA.FieldByName('stclass').AsString = '5' then
        QRLstclass.Caption := '주주우선(비예탁)'
      end
    else
      QRLstclass.Caption := Copy(MainForm.CB_stclass.Text,5,13);

  if NextFlag then
    QryA.Prior;
end;

procedure TPrintForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CodeString.Free;
  DataString.Free;
  CanClose := True;
end;

procedure TPrintForm.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  inwon      := 0;
  sum_cnt    := 0;
  sum_stlamt := 0;
  NextFlag   := False;
  QRLdivseqnum.Caption := MainForm.SE_divseqnum.Text;
end;

end.
