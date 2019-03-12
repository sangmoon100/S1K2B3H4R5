unit UPIA1070B_6;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Tmax_DataSetText, OnDBGrid, StdCtrls, ExtCtrls, OnLineLabel,
  OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl, OnEditMdate, OnShapeLabel,
  OnSkinBtn, Tmax_session, OnInsaCommon;

type
  TAnnoForm = class(TForm)
    PA_Work1: TPanel;
    Shape6: TShape;
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
    Label3: TLabel;
    L_emp: TOnShapeLabel;
    SB_Close: TOnSkinButton;
    procedure FG_GubunClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure SB_CloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FG_gubun     : Integer;
    procedure PL_Select_Data;
  end;

var
  AnnoForm: TAnnoForm;

implementation

uses UMainForm;

{$R *.DFM}

procedure TAnnoForm.PL_Select_Data;
begin
  Perform(WM_NEXTDLGCTL,0,0);
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
                    '   A.paygr   ,            '+
                    '   case when (a.anfrdate >= ''%s'' ) then D.codename else null end payranm, '+
	            '   case when (a.anfrdate <  ''%s'' ) then D.codename else null end payra2nm,'+
                    '   E.deptname deptname,   '+
                    '   mark1||'' ''||mark2||'' ''||mark3 bigo '+
                    '  FROM pyccode B, pyccode C, pyccode D, pycdept E, pyccode F, pihanno A '+
                    ' WHERE A.empno   = ''%s''   '+
                    '   AND A.anupdyn = ''Y''    '+
                    '   AND (A.anfrdate >= ''%s'' AND A.anfrdate <= ''%s'') '+
                    '   AND B.codeid(+)  = ''I300''    AND B.codeno(+)  = A.ancode    '+
                    '   AND F.codeid(+)  = ''I310''    AND F.codeno(+)  = A.andetcode '+
                    '   AND C.codeid(+)  = ''I112''    AND C.codeno(+)  = A.paycl     '+
                    '   AND D.codeid(+)  = ''I113''    AND D.codeno(+)  = A.payra     '+
                    '   AND E.orgnum(+)  = A.orgnum    AND E.deptcode(+)= A.deptcode  ',
                 [MainForm.payrachdate,MainForm.payrachdate,Copy(L_emp.ValueCaption,1,4), ED_Date1.NoFormatDate, ED_Date2.NoFormatDate]);
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

procedure TAnnoForm.FG_GubunClick(Sender: TObject);
begin
  SB_Tab1.BtnDown  := False;
  SB_Tab2.BtnDown  := False;
  SB_Tab3.BtnDown  := False;

  FG_Gubun := TComponent(Sender).Tag;
  TOnSkinButton(Sender).BtnDown := True;
  PL_Select_Data;
end;

procedure TAnnoForm.FormPaint(Sender: TObject);
begin
  AnnoForm.OnPaint := Nil;
  FG_GubunClick(SB_Tab1);
end;

procedure TAnnoForm.SB_CloseClick(Sender: TObject);
begin
  Close;
end;

end.
