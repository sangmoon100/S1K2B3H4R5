unit PIA1070B_5;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Tmax_session, OnInsaCommon, Tmax_DataSetText, OnDBGrid, StdCtrls,
  ExtCtrls, OnLineLabel, OnShapeLabel, Db;

type
  TFM_SubForm4 = class(TForm)
    PA_Work1: TPanel;
    Shape6: TShape;
    OnSectionLabel2: TOnSectionLabel;
    Shape3: TShape;
    Shape2: TShape;
    Shape1: TShape;
    Label1: TLabel;
    Grid1: TOnDBGrid;
    DataSource1: TDataSource;
    QR_po: TTMaxDataSet;
    Panel1: TPanel;
    Shape4: TShape;
    NreClass: TOnShapeLabel;
    reno: TOnShapeLabel;
    rewname: TOnShapeLabel;
    Npaycl1: TOnShapeLabel;
    paygr1: TOnShapeLabel;
    Npayra1: TOnShapeLabel;
    deptcode: TOnShapeLabel;
    orgnum: TOnShapeLabel;
    deptname1: TOnShapeLabel;
    rekindnm: TOnShapeLabel;
    reorgnm: TOnShapeLabel;
    recause: TOnShapeLabel;
    rebase: TOnShapeLabel;
    remethod: TOnShapeLabel;
    reamt: TOnShapeLabel;
    rerayn: TOnShapeLabel;
    repoint: TOnShapeLabel;
    redate: TOnShapeLabel;
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
//    procedure DBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
//      Field: TField );

  private
    { Private declarations }
    start : integer;
//    procedure reFind;
    procedure DispData;

  public
    { Public declarations }
    Insa_Session : TTMaxSession;
    procedure PL_InitForm;
    procedure PL_Select_Data;
  end;

var
  FM_SubForm4: TFM_SubForm4;

implementation

uses PIA1070B_1;
{$R *.DFM}

procedure TFM_SubForm4.PL_InitForm;
begin
  QR_po.Session := Insa_Session;
end;

procedure TFM_SubForm4.PL_Select_Data;
var SqlText : String;
begin
  SqlText := Format('select                      '+
                    'nvl(empno    ,'' ''),       '+
                    'nvl(korname  ,'' ''),       '+
                    'nvl(orgnum   ,'' ''),       '+
                    'nvl(deptcode ,'' ''),       '+
                    'nvl(paycl    ,'' ''),       '+
                    'nvl(to_char(paygr),''0''),  '+
                    'nvl(payra    ,'' ''),       '+
                    'nvl(reno     ,'' ''),       '+
                    'nvl(redate   ,'' ''),       '+
                    'nvl(reclass  ,'' ''),       '+
                    '(SELECT codename            '+
                    ' from pyccode               '+
                    ' where codeid = ''I240''    '+
                    ' AND codeno = reclass),     '+
                    'nvl(rewname  ,'' ''),       '+
                    'nvl(rekind   ,'' ''),       '+
                    'nvl(rekindnm ,'' ''),       '+
                    'nvl(recause  ,'' ''),       '+
                    'nvl(rebase   ,'' ''),       '+
                    'nvl(to_char(reamt),''0''),  '+
                    'nvl(remethod ,'' ''),       '+
                    'nvl(reorg    ,'' ''),       '+
                    'nvl(reorgnm  ,'' ''),       '+
                    'nvl(retime   ,'' ''),       '+
                    'decode(retime,''1'',''입사전'','+
                    '              ''2'',''입사후''), '+
                    'nvl(rerayn   ,'' ''),       '+
                    'nvl(to_char(repoint),''0''),'+
                    'nvl(writetime,'' ''),       '+
                    'nvl(writeemp ,'' '')        '+
                    'from pimrewa                '+
                    'where empno = ''%s'' '+
                    'order by redate ',
                    [FM_Main.FG_CurEmpno]);
  with QR_po do
  begin
    Close;
    //콤포넌트에 추가하였으면 아래 항목은 제외.
    ClearFieldInfo;
    AddField('EMPNO'        , ftString,  4  );
    AddField('KORNAME'      , ftString,  12 );
    AddField('ORGNUM'       , ftString,  3  );
    AddField('DEPTCODE'     , ftString,  6  );
    AddField('PAYCL'        , ftString,  3  );
    AddField('PAYGR'        , ftFloat ,  3  );
    AddField('PAYRA'        , ftString,  3  );
    AddField('RENO'         , ftString,  11 );
    AddField('REDATE'       , ftString,  8  );
    AddField('RECLASS'      , ftString,  2  );
    AddField('NRECLASS'     , ftString,  100);
    AddField('REWNAME'      , ftString,  30 );
    AddField('REKIND'       , ftString,  4  );
    AddField('REKINDNM'     , ftString,  20 );
    AddField('RECAUSE'      , ftString,  50 );
    AddField('REBASE'       , ftString,  40 );
    AddField('REAMT'        , ftFloat ,  12 );
    AddField('REMETHOD'     , ftString,  30 );
    AddField('REORG'        , ftString,  3  );
    AddField('REORGNM'      , ftString,  20 );
    AddField('RETIME'       , ftString,  1  );
    AddField('NRETIME'      , ftString,  10 );
    AddField('RERAYN'       , ftString,  1  );
    AddField('REPOINT'      , ftFloat ,  5  );
    AddField('WRITETIME'    , ftString,  15 );
    AddField('WRITEEMP'     , ftString,  4  );
    Sql.Clear;
    Sql.Text := SqlText;
    ServiceName := 'PIA1070B_sel9';
    Open;
//    bCallFlag := ServiceCall('SPIA1070S9');
    if RecordCount <= 0 then
    begin
      Grid1.Visible := False;
      Panel1.Visible := False;
    end
    else
    begin
      Grid1.Visible := True;
      Panel1.Visible := True;
    end;
  end;
end;
////////////////////////////////////////////////////////////
// 해딩시힝에 맞는 데이타를 화면에 뿌려준다.....................................
procedure TFM_SubForm4.DispData;
begin
   reno.ValueCaption      := QR_po.FieldByName('reno').AsString;
   Nreclass.ValueCaption  := FM_Main.PL_Get_Code('I240',QR_po.FieldByName('reclass').AsString);
   rewname.ValueCaption   := QR_po.FieldByName('rewname').AsString;
   deptcode.ValueCaption  := QR_po.FieldByName('deptcode').AsString;
   orgnum.ValueCaption    := QR_po.FieldByName('orgnum').AsString;
   deptname1.ValueCaption := FM_Main.PL_Get_Dept(deptcode.ValueCaption,orgnum.ValueCaption);
   Npaycl1.ValueCaption   := FM_Main.PL_Get_Code('I112',QR_po.FieldByName('paycl').AsString);
//   paygr1.Caption    := QR_po.FieldByName('paygr').AsString;
   Npayra1.ValueCaption   := FM_Main.PL_Get_Code('I113',QR_po.FieldByName('payra').AsString);
   rekindnm.ValueCaption  := QR_po.FieldByName('rekindnm').AsString;
   if trim(QR_po.FieldByName('redate').AsString) <> '' then
      redate.ValueCaption := copy(QR_po.FieldByName('redate').AsString,1,4)+'/'+
                        copy(QR_po.FieldByName('redate').AsString,5,2)+'/'+
                        copy(QR_po.FieldByName('redate').AsString,7,2)
   else redate.ValueCaption:= '';
   reorgnm.ValueCaption   := QR_po.FieldByName('reorgnm').AsString;
   recause.ValueCaption   := QR_po.FieldByName('recause').AsString;
   rebase.ValueCaption    := QR_po.FieldByName('rebase').AsString;
   remethod.ValueCaption  := QR_po.FieldByName('remethod').AsString;
   reamt.ValueCaption     := FormatFloat('###,###,##0 ',QR_po.FieldByName('reamt').AsFloat);
   rerayn.ValueCaption    := QR_po.FieldByName('rerayn').AsString;
   repoint.ValueCaption   := FormatFloat('#0.00 ',QR_po.FieldByName('repoint').AsFloat);
end;

procedure TFM_SubForm4.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
    DispData;
end;

end.
