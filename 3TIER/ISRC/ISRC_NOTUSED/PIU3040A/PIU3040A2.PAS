unit PIU3040A2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Tmax_DataSetText, OnDBGrid, StdCtrls, ExtCtrls, OnLineLabel,
  OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl, OnEditMdate, OnShapeLabel,
  OnSkinBtn, Tmax_session, OnInsaCommon, OnFocusButton, TmaxFunc;

type
  TFM_Pihanno = class(TForm)
    PA_Work1: TPanel;
    Shape6: TShape;
    OnSectionLabel2: TOnSectionLabel;
    Shape3: TShape;
    Shape2: TShape;
    Shape1: TShape;
    Label1: TLabel;
    Shape4: TShape;
    SB_Tab1: TOnSkinButton;
    SB_Tab2: TOnSkinButton;
    SB_Tab3: TOnSkinButton;
    Grid1: TOnDBGrid;
    ED_Date1: TOnDateEdit;
    ED_Date2: TOnDateEdit;
    DataSource1: TDataSource;
    QR_an: TTMaxDataSet;
    BT_Find: TOnFocusButton;
    BT_Exit: TOnFocusButton;
    QR_pim: TTMaxDataSet;
    procedure SB_Tab1Click(Sender: TObject);
    procedure BT_ExitClick(Sender: TObject);
    procedure BT_FindClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Insa_Session : TTMaxSession;
    FG_gubun     : Integer;  
    procedure PL_InitForm;
    procedure PL_Select_Data;
  end;

var
  FM_Pihanno: TFM_Pihanno;

implementation

uses PIU3040A1;

{$R *.DFM}

procedure TFM_Pihanno.PL_InitForm;
begin
  FM_Tmax               := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session     := FM_Mainform.TMaxSession;
  ED_Date1.NoFormatDate := FM_Tmax.GetData('empdate',FM_Mainform.PE_empno.empno,'');
  ED_Date2.NoFormatDate := FM_Tmax.GetData('sysdate','','');
end;

procedure TFM_Pihanno.PL_Select_Data;
begin
  with QR_an do
  begin
      Close;
      Sql.Clear;
      Sql.Text := Format(
          'SELECT '+
          '       DECODE(A.anfrdate,'''','' '',  SUBSTR(A.anfrdate,1,4)||''/''||SUBSTR(A.anfrdate,5,2)||''/''||SUBSTR(A.anfrdate,7,2)) anfrdate, '+
          '       DECODE(A.antodate,'''','' '',  SUBSTR(A.antodate,1,4)||''/''||SUBSTR(A.antodate,5,2)||''/''||SUBSTR(A.antodate,7,2)) antodate, '+
          '       A.annono                                                                                                                     , '+
          '       nvl((select codename from pyccode where codeid=''I300'' and codeno = A.ancode),'''') ancodenm                                , '+
          '       decode(a.ancode,''111'',(select codename from pyccode Where codeid = ''I101'' and codeno = A.andetcode)                 , '+
          '                                   (select codename from pyccode where codeid = ''I310'' and codeno = A.andetcode)) andetnm    , '+
          '       nvl((select codename from pyccode where codeid=''I112'' and codeno = A.paycl ),'''') payclnm                                 , '+
          '       A.paygr                                                                                                                      , '+
          '       case when (a.anfrdate >= nvl((select Value3 FROM pimvari where gubun = ''00'' and sgubun = ''0001''),''00000000'') ) then nvl((select codename from pyccode where codeid=''I113'' and codeno = A.payra ),'''') else null end payranm, '+
	  '       case when (a.anfrdate <  nvl((select Value3 FROM pimvari where gubun = ''00'' and sgubun = ''0001''),''00000000'') ) then nvl((select codename from pyccode where codeid=''I113'' and codeno = A.payra ),'''') else null end payra2nm,'+
          '       nvl((select deptname from pycdept where orgnum = A.orgnum and deptcode = A.deptcode),'''') deptname                          , '+
          '       mark1||'' ''||mark2||'' ''||mark3 bigo                '+
          '  FROM pihanno A                                             '+
          ' WHERE A.empno      = ''%s''                                 '+
          '   AND A.ancode in (''111'', ''211'' )                       '+
          '   AND A.anupdyn    = ''Y''                                  '+
          '   AND A.anfrdate between ''%s'' AND ''%s''                  '+
          ' ORDER BY A.comgubun desc, A.anfrdate desc, A.annono desc, A.anseqno desc ',
                 [FM_Mainform.PE_empno.empno, ED_Date1.NoFormatDate, ED_Date2.NoFormatDate]);

{      if FG_Gubun = 1 then
         Sql.Text := Sql.Text + ' AND A.ancode NOT IN (''336'',''337'',''346'',''656'',''452'',''454'',''935'',''995'') ';

      if FG_Gubun = 2 then
         Sql.Text := Sql.Text + ' AND A.ancode in (''111'', ''311'', ''322'', ''342'', ''343'') ';

      if FG_Gubun = 3 then
      begin
          Sql.Text := Sql.Text + ' AND (A.ancode in (''111'', ''211'', ''251'', ''311'',''809'') '+
                                 '      OR SUBSTR(A.ancode,1,2) = ''41'' )                      ';
      end;

      Sql.Text := Sql.Text + ' ORDER BY A.comgubun desc, A.anfrdate desc, A.annono desc, A.anseqno desc ';
}
//            memo1.Text := sql.text;
      Open;       //Edit1.Text := Sql.Text;

      if   RecordCount <= 0 then Grid1.Visible := False
      else                       Grid1.Visible := True;  //showmessage(inttostr(RecordCount));

  end;
end;

procedure TFM_Pihanno.SB_Tab1Click(Sender: TObject);
begin
  SB_Tab1.BtnDown  := False;
  SB_Tab2.BtnDown  := False;
  SB_Tab3.BtnDown  := False;

  FG_Gubun := TComponent(Sender).Tag;
  TOnSkinButton(Sender).BtnDown := True;
  PL_Select_Data;
end;

procedure TFM_Pihanno.BT_ExitClick(Sender: TObject);
begin
   Close;
end;

procedure TFM_Pihanno.BT_FindClick(Sender: TObject);
begin
   SB_Tab1Click(SB_Tab3);
{   if FM_Pihanno <> nil then
   begin
        if FG_Gubun = 1 then  SB_Tab1Click(SB_Tab1);
        if FG_Gubun = 2 then  SB_Tab1Click(SB_Tab2);
        if FG_Gubun = 3 then  SB_Tab1Click(SB_Tab3);
   end;}
end;

procedure TFM_Pihanno.FormShow(Sender: TObject);
begin
    FM_Pihanno.PL_InitForm;
    FG_Gubun := 3;
    FM_Pihanno.BT_FindClick(Sender);
end;

end.
