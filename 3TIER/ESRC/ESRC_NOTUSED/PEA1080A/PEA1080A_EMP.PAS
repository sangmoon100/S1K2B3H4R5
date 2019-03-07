unit PEA1080A_Emp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OnDBGrid, ExtCtrls, StdCtrls, OnFocusButton, Db, Tmax_DataSetText, Tmax_session,
  OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl, OnPopupEdit, Grids,
  DBGrids, OnGrDBGrid, Func;

type
  TFM_empno = class(TForm)
    QR_pimpmas: TTMaxDataSet;
    DataSource1: TDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    BT_Confirm: TOnFocusButton;
    GR_pimpmas: TOnGrDbGrid;
    BE_Key: TOnButtonEdit;
    procedure BT_ConfirmClick(Sender: TObject);
    procedure Grid1DblClick(Sender: TObject);
    procedure GR_pimpmasApplyCellAttribute(Sender: TObject; Field: TField;
      Canvas: TCanvas; Rect: TRect; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Edit         : TOnWinPopupEdit;
    Insa_Session : TTMaxSession;
    FL_Start     : Boolean;
    procedure Part_search;
  end;

var
  FM_empno: TFM_empno;

implementation

uses PEA1080A1;

{$R *.DFM}

procedure TFM_empno.BT_ConfirmClick(Sender: TObject);
begin
  Edit.PopupForm.ClosePopup(True);
end;

procedure TFM_empno.FormShow(Sender: TObject);
begin
  Part_search;
end;

procedure TFM_empno.Grid1DblClick(Sender: TObject);
begin
  BT_ConfirmClick(Sender);
end;

procedure TFM_empno.Part_search;
begin
  QR_pimpmas.Session := Insa_Session;
  QR_pimpmas.ServiceName := 'HINSA_pimpmas';

  try
    with QR_pimpmas do
    begin
         Close;
         Sql.Clear;
         SQL.ADD('SELECT A.empno, A.korname, A.paycl, A.payra, A.orgnum, A.deptcode, A.pstate,                ');
         SQL.ADD('    D.codename payraname, C.codename payclname, B.deptname, B.deptna3, B.extcode,           ');
         SQL.ADD('    case when a.pstate < ''80'' then ''ÀçÁ÷'' else ''Åð»ç'' end empdate,'' '',juminid,'' '' ');
         SQL.ADD('  FROM pycdept B, pyccode C, pyccode D, pimpmas A                                           ');
         SQL.ADD(' WHERE D.codeid(+) = ''I113''     ');
         SQL.ADD('   AND A.payra     = D.codeno(+)  ');
         SQL.ADD('   AND C.codeid(+) = ''I112''     ');
         SQL.ADD('   AND A.paycl     = C.codeno(+)  ');
         SQL.ADD('   AND A.orgnum    = B.orgnum(+)  ');
         SQL.ADD('   AND A.deptcode  = B.deptcode(+)');
         SQL.ADD('   AND A.pstate   < ''80''        ');
         Sql.Add('   and A.paycl between ''C11'' and ''D31''                                                  ');
         SQL.ADD('   AND (A.deptcode  like replace('''+FM_Main.FG_dept + ''' ,''0'','''') || ''%''            ');
         SQL.ADD('       Or A.jobdept like replace('''+FM_Main.FG_dept + ''' ,''0'','''') || ''%'')           ');
         SQL.ADD('   UNION     '); //ÀÌÇÏ °âÁ÷.
         SQL.ADD('SELECT A.empno, A.korname, A.paycl, A.payra, A.orgnum, A.deptcode, A.pstate,                ');
         SQL.ADD('       D.codename payraname, C.codename payclname, B.deptname, B.deptna3, B.extcode,        ');
         SQL.ADD(' case when a.pstate < ''80'' then ''ÀçÁ÷'' else ''Åð»ç'' end empdate,'' '','' '','' ''      ');
         SQL.ADD('  FROM pycdept B, pyccode C, pyccode D, pimpmas A                                           ');
         SQL.ADD(' WHERE D.codeid(+) = ''I113''     ');
         SQL.ADD('   AND A.payra     = D.codeno(+)  ');
         SQL.ADD('   AND C.codeid(+) = ''I112''     ');
         SQL.ADD('   AND A.paycl     = C.codeno(+)  ');
         SQL.ADD('   AND A.orgnum    = B.orgnum(+)  ');
         SQL.ADD('   AND A.deptcode  = B.deptcode(+)');
         SQL.ADD('   AND A.pstate    < ''80''       ');
         Sql.Add('   and A.paycl between ''C11'' and ''D31''                                                  ');
         SQL.ADD('   AND A.jobdept in ( select addeptcode                                                     ');
         SQL.ADD('                        from ( select * from pihanno                                        ');
         SQL.ADD('                             	where empno = '''+ FM_Main.FG_empno + '''                     ');
         SQL.ADD('                                  and ancode in (''233'',''243'')                           ');
         SQL.ADD('                                  and orgnum =  (select value1 from pimvari where gubun = ''00'' and sgubun = ''0001'' )    ');
         SQL.ADD('                                minus       	                                              ');
         SQL.ADD('                               select * from pihanno                                        ');
         SQL.ADD('                                where empno = '''+ FM_Main.FG_empno + '''                   ');
         SQL.ADD('                                  and ancode in (''238'',''248'')                           ');
         SQL.ADD('                                  and orgnum =  (select value1 from pimvari where gubun = ''00'' and sgubun = ''0001'' )) ) ');
         SQL.ADD(' ORDER By empdate,deptcode,payra,empno ');
         Open;

         if   Trim(FM_Main.E_empno.Text) = '' then First
         else if IsNumber(Copy(FM_Main.E_empno.Text,1,4)) then
              Locate('EMPNO',vararrayof([ Copy(FM_Main.E_empno.Text,1,4) ]),[loCaseInsensitive])
         else if not IsNumber(Copy(FM_Main.E_empno.Text,1,4)) then
              Locate('KORNAME',vararrayof([ FM_Main.E_empno.Text ]),[loCaseInsensitive]);
    end;
  except
    QR_pimpmas.Close;
  end;
end;

procedure TFM_empno.GR_pimpmasApplyCellAttribute(Sender: TObject;
  Field: TField; Canvas: TCanvas; Rect: TRect; State: TGridDrawState);
begin
  if QR_pimpmas.FieldByName('pstate').AsString < '80' then
  begin
       Canvas.Font.Style := [];
       Canvas.Font.Color := clBlack;
  end
  else
  begin
       Canvas.Font.Style := [fsStrikeOut];
       Canvas.Font.Color := clBlue;
  end;
end;

end.
