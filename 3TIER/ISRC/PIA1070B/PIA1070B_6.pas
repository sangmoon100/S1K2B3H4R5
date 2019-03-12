unit PIA1070B_6;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Tmax_DataSetText, OnDBGrid, StdCtrls, ExtCtrls, OnLineLabel,
  OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl, OnEditMdate, OnShapeLabel,
  OnSkinBtn, Tmax_session, OnInsaCommon, TmaxFunc;

type
  TFM_SubForm5 = class(TForm)
    PA_Work1: TPanel;
    Shape6: TShape;
    OnSectionLabel2: TOnSectionLabel;
    Shape3: TShape;
    Shape2: TShape;
    Shape1: TShape;
    Label1: TLabel;
    Grid1: TOnDBGrid;
    QR_an: TTMaxDataSet;
    DataSource1: TDataSource;
    ED_Date1: TOnDateEdit;
    ED_Date2: TOnDateEdit;
    Shape4: TShape;
    ED_empcode: TOnShapeLabel;
    SB_Tab1: TOnSkinButton;
    SB_Tab2: TOnSkinButton;
    SB_Tab3: TOnSkinButton;
    procedure FG_GubunClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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
  FM_SubForm5: TFM_SubForm5;

implementation

uses PIA1070B_1;

{$R *.DFM}

procedure TFM_SubForm5.PL_InitForm;
begin
  ED_Date1.NoFormatDate := FM_Main.FG_empdate;

  FM_Tmax               := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session     := FM_Main.TMaxSession;
  ED_Date2.NoFormatDate := FM_Tmax.GetData('sysdate','','');
end;

//발령 눌렀을때  데이타 바로 보여지도록 2007.06.05 서혜미 (신영섭대리 요청)
procedure TFM_SubForm5.FormCreate(Sender: TObject);
begin
     FG_Gubun := 1;
     PL_Select_Data;
end;


procedure TFM_SubForm5.PL_Select_Data;
begin
  with QR_an do
    begin
      Close;
      Sql.Clear;
      Sql.Text := Format(
                    'SELECT '+
                    '    DECODE(A.anfrdate,'''','' '',  '+
                    '      SUBSTR(A.anfrdate,1,4)||''/''||SUBSTR(A.anfrdate,5,2)||''/''||SUBSTR(A.anfrdate,7,2)) anfrdate, '+
                    '    DECODE(A.antodate,'''','' '',  '+
                    '      SUBSTR(A.antodate,1,4)||''/''||SUBSTR(A.antodate,5,2)||''/''||SUBSTR(A.antodate,7,2)) antodate, '+
                    '   A.annono  ,            '+
                    '   B.codename ancodenm,   '+
                    '   decode(a.ancode,''111'',(select codename from pyccode Where codeid = ''I101'' and codeno= a.andetcode), F.codename) andetnm ,   '+
                    '   C.codename payclnm ,   '+
                    '   NVL(A.paygr,0) paygr,  '+
                    '   case when (a.anfrdate >= ''%s'' ) then D.codename else null end payranm, '+
	            '   case when (a.anfrdate <  ''%s'' ) then D.codename else null end payra2nm,'+
                    '   E.deptname deptname,   '+
                    '   mark1||'' ''||mark2||'' ''||mark3 bigo, '+
                    '   case when G.deptname is not null then G.deptname||''(''||A.addeptcode||'')'' else G.deptname end addeptname, '+
                    '   case when H.codename is not null then H.codename||''(''||A.adpayra||'')'' else H.codename end adpayranm,  '+
                    '   A.displace   place     '+
                    '  FROM pyccode B, pyccode C, pyccode D, pycdept E,  pyccode F, pycdept G, pyccode H, pihanno A '+
                    //'  FROM pyccode B, pyccode C, pyccode D, pycdept E,  pyccode F, pihanno A '+
                    ' WHERE A.empno   = ''%s''   '+
                    '   AND A.anupdyn = ''Y''    '+
                    '   AND (A.anfrdate >= ''%s'' AND A.anfrdate <= ''%s'') '+
                    '   AND B.codeid(+)  = ''I300''    AND B.codeno(+)  = A.ancode    '+
                    '   AND F.codeid(+)  = ''I310''    AND F.codeno(+)  = A.andetcode '+
                    '   AND C.codeid(+)  = ''I112''    AND C.codeno(+)  = A.paycl     '+
                    '   AND D.codeid(+)  = ''I113''    AND D.codeno(+)  = A.payra     '+
                    '   AND E.orgnum(+)  = A.orgnum    AND E.deptcode(+)= A.deptcode  '+
                    '   AND G.orgnum(+)  = A.orgnum    AND G.deptcode(+)= A.addeptcode'+
                    '   AND H.codeid(+)  = ''I113''    AND H.codeno(+)  = A.adpayra   ',
                 [FM_Main.payrachdate,FM_Main.payrachdate,FM_Main.FG_CurEmpno, ED_Date1.NoFormatDate, ED_Date2.NoFormatDate]);
      if FG_Gubun = 1 then
        begin
          Sql.Text := Sql.Text + ' AND (A.ancode NOT IN (''336'',''337'',''346'',''656'',''452'',''454'',''935'',''995'')) ';
        end;

      if FG_Gubun = 2 then
        begin
          Sql.Text := Sql.Text + ' AND ((A.ancode = ''111'') OR (A.ancode = ''311'') OR (A.ancode=''322'') OR (A.ancode=''342'') OR (A.ancode=''343'')) ';
        end;

      if FG_Gubun = 3 then
        begin
          Sql.Text := Sql.Text + ' AND ((A.ancode = ''111'') OR (A.ancode = ''211'') OR (A.ancode=''311'') '+
                                 '  OR  (SUBSTR(A.ancode,1,2) = ''41'') '+
                                 '  OR  (A.ancode = ''809'') OR (A.ancode = ''251'')) ';
        end;

      Sql.Text := Sql.Text + ' ORDER BY A.comgubun desc, A.anfrdate desc, A.annono desc, A.anseqno desc ';
      Open;

      if RecordCount <= 0 then
        Grid1.Visible := False
      else
        Grid1.Visible := True;

    end;
end;

procedure TFM_SubForm5.FG_GubunClick(Sender: TObject);
begin
  SB_Tab1.BtnDown  := False;
  SB_Tab2.BtnDown  := False;
  SB_Tab3.BtnDown  := False;

  FG_Gubun := TComponent(Sender).Tag;
  TOnSkinButton(Sender).BtnDown := True;
  PL_Select_Data;
end;

end.
