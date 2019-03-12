unit UEmpForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, pegradpanl, StdCtrls, Mask, Grids, DBGrids, Db, DBTables, pegraphic, DBClient, MIDAScon,
  Tmax_DataSetText, OnDBGrid, OnFocusButton, ComCtrls, OnShapeLabel,
  OnGrDBGrid, OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl,
  OnPopupEdit, OnEditMemo;

type
  TFm_EmpForm = class(TForm)
    ds1: TDataSource;
    Query1: TTMaxDataSet;
    Panel2: TPanel;
    BB_close: TOnFocusButton;
    Sb_Ok: TOnFocusButton;
    Sb_Close: TOnFocusButton;
    Grid1: TOnGrDbGrid;
    Memo1: TMemo;
    RG_Sort: TRadioGroup;
    E_Notice: TOnMemo;
    procedure FormCreate(Sender: TObject);
    procedure Pa_TitleMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure Sb_CloseClick(Sender: TObject);
    procedure Sb_OkClick(Sender: TObject);
    procedure Grid1KeyPress(Sender: TObject; var Key: Char);
    procedure RG_SortClick(Sender: TObject);
  private
    { Private declarations }
    FOrgDept      : string;
    Fempno        : string;
    Fkorname      : string;
    FConyn        : string;
    FFinyn        : string;
    SqlText       : string;
  public
    Edit      : TOnWinPopupEdit;

    FCloseYn  : Boolean;
    FSelectYn : Boolean;
//    property OrgDeptList  : string        read FOrgDept      write FOrgDept;
    property empno        : string        read Fempno        write Fempno;
    property korname      : string        read Fkorname      write Fkorname;
    property Conyn        : string        read FConyn        write FConyn;
    property Finyn        : string        read FFinyn        write FFinyn;
    procedure SqlOpen;
  end;

var
  Fm_EmpForm : TFm_EmpForm;

implementation
uses UMainForm;
{$R *.DFM}

procedure TFm_EmpForm.FormCreate(Sender: TObject);
begin
     FCloseYn      := False;
end;

procedure TFm_EmpForm.Pa_TitleMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if  ssleft in shift then
  begin
       Releasecapture;
       Self.Perform(WM_SYSCOMMAND, $F012, 0);
  end;
end;

procedure TFm_EmpForm.Sb_OkClick(Sender: TObject);
begin
  if  (FM_MAIN.AEmpno = Query1.FieldByName('empno').AsString) or (Query1.FieldByName('Conyn').AsString = 'Y') then
  begin
       if  Query1.FieldByName('Finyn').AsString = 'Y' then
            MessageDlg('이미 [IDP 등록 결재]를 완료 하였습니다.' + #13+#13+
                       '내용 확인만 할수 있습니다.', mtConfirmation, [mbOK],0);
       Fempno   := Query1.FieldByName('empno').AsString;
       Fkorname := Query1.FieldByName('korname').AsString;
       FConyn   := Query1.FieldByName('conyn').AsString;
       FFinyn   := Query1.FieldByName('finyn').AsString;
       FCloseYn := False;
       Edit.PopupForm.ClosePopup(False);
  end
  else
  begin
       If  (Query1.FieldByName('Finyn').AsString = 'R') Then
       Begin
            Fempno   := Query1.FieldByName('empno').AsString;
            Fkorname := Query1.FieldByName('korname').AsString;
            FConyn   := Query1.FieldByName('conyn').AsString;
            FFinyn   := Query1.FieldByName('finyn').AsString;
            FCloseYn := False;
            FM_MAIN.Select_BaseData;
            Edit.PopupForm.ClosePopup(False);
       End
       Else
            MessageDlg('구성원이 아직 등록 작업을 마치지 않았습니다.'+#13 ,mtError,[mbOK],0);
  end;
end;

procedure TFm_EmpForm.SqlOpen;
var
  i       : integer;
  Field   : TField;
  Str     : string;
  OleData : OleVariant;
  SqlText : string;
begin
{
  SqlText :=  ' SELECT  A.EMPNO, A.KORNAME, A.ORGNUM,B.DEPTCODE,B.DEPTNAME,                      '+
              '         A.PAYCL, C.CODENAME PAYCLNAME, A.PAYRA, E.CODENAME PAYRANAME,            '+
              '         A.PAYRAYN , A.JOBPAYRAYN ,                                               '+
              '         D.CONYN,D.FINYN,                                                         '+
              '         decode(D.finyn,''R'',''반려'',''Y'',''결재완료'',                        '+
              '         decode(D.conyn,''Y'',''결재상신중'', ''등록중'')) prog                   '+
              '   FROM  PIMPMAS A, PYCDEPT B, PYCCODE C, PYCCODE E,                              '+
              '        (select empno,nvl(RVALCONYN,''Z'') conyn, nvl(E1VALCONYN,''Z'') finyn,    '+
              '         E1EMPNO from PEIDPMAS WHERE BASE_YY = '''+ FM_Main.sbase_yy +''') D       '+
              ' WHERE a.pstate   <  '''+FM_Main.pstate +'''                                      '+
              '   AND a.payra    >= '''+FM_Main.payrafr+'''                                      '+
              '   AND a.payra    <= '''+FM_Main.payrato+'''                                      '+
              '   AND a.empno    not in ('''+FM_Main.objemp1 +''', '''+FM_Main.objemp2  +''' ,   '+
              '                          '''+FM_Main.objemp3 +''', '''+FM_Main.objemp4  +''' ,   '+
              '                          '''+FM_Main.objemp5 +''', '''+FM_Main.objemp6  +''' ,   '+
              '                          '''+FM_Main.objemp7 +''', '''+FM_Main.objemp8  +''' ,   '+
              '                          '''+FM_Main.objemp9 +''', '''+FM_Main.objemp10 +'''  )  '+
              '   AND a.deptcode not in ('''+FM_Main.objdept1+''', '''+FM_Main.objdept2 +''' ,   '+
              '                          '''+FM_Main.objdept3+''', '''+FM_Main.objdept4 +''' ,   '+
              '                          '''+FM_Main.objdept5+''', '''+FM_Main.objdept6 +''' ,   '+
              '                          '''+FM_Main.objdept7+''', '''+FM_Main.objdept8 +''' ,   '+
              '                          '''+FM_Main.objdept9+''', '''+FM_Main.objdept10+'''  )  '+
              '    AND  A.DEPTCODE = B.DEPTCODE                                                  '+
              '    AND  A.ORGNUM   = B.ORGNUM                                                    '+
              '    AND  A.PAYCL    = C.CODENO(+) AND C.CODEID(+) = ''I112''                      '+
              '    AND  A.PAYRA    = E.CODENO(+) AND E.CODEID(+) = ''I113''                      '+
              '    AND  A.EMPNO    = D.EMPNO(+)                                                  '+
              '    AND  SUBSTR(A.EMPNO,1,1) NOT IN (''Q'',''P'',''Y'',''J'')                     ';
}

  SqlText :=  ' SELECT  A.EMPNO, A.KORNAME, B.DEPTNAME, D.CONYN, D.FINYN,                        '+
              '         decode(D.finyn,''R'',''반려'',''Y'',''결재완료'',                        '+
              '         decode(D.conyn,''Y'',''결재상신중'', ''등록중'')) prog,                  '+
              '         F.BAND, F.PAYCLPOINT, F.YEARPOINT, F.APPPOINT                            '+
              '   FROM  PIMPMAS A, PYCDEPT B, PYCCODE C, PYCCODE E,                              '+
              '        (select empno,nvl(RVALCONYN,''Z'') conyn, nvl(E1VALCONYN,''Z'') finyn,    '+
              '         E1EMPNO from PEIDPMAS WHERE BASE_YY = '''+ Copy(FM_Main.VSysdate,1,4) +''' '+
              '        ) D, '+
              '	       (SELECT EMPNO, BAND, DECODE(PAYCLPOINT, 0, 0, DECODE(AVG_SCORE, 0, 0, NVL(TRUNC(PAYCLPOINT/AVG_SCORE), 0))) BANDYEAR, '+
              '                NVL(PAYCLPOINT, 0) PAYCLPOINT, NVL(YEARPOINT,0)  YEARPOINT,  '+
              '                NVL(DECODE(BAND, ''L2'', 0, DECODE(SIGN(AVG100POINT), 1, AVG100POINT, 0)), 0) APPPOINT '+
              '	        FROM(SELECT A.EMPNO, TRUNC(AVG(C.TOT_SCORE),1) AVG_SCORE, '+
              '	                    MAX((SELECT CODENAME FROM PYCCODE WHERE CODEID = ''I112'' '+
              '                     AND CODENO   = A.PAYCL)) BAND, ' +
              '		            NVL(SUM(DECODE(C.BASE_YY, '''+ Copy(FM_Main.VSysdate,1,4) +''', C.TOT_SCORE, 0)),0) YEARPOINT, '+
              '		            NVL(SUM(C.TOT_SCORE),0)   PAYCLPOINT, ' +
              '		 	    TRUNC(NVL(SUM(C.TOT_SCORE),0) / TRUNC(DECODE(SIGN(AVG(C.TOT_SCORE)),1, '+
              '		 	    AVG(C.TOT_SCORE), 1), 1)) * 100 - (NVL(SUM(C.TOT_SCORE),0)) AVG100POINT '+
              '		     FROM PIMPMAS A,  PEDU2HIS C '+
              '		     WHERE A.EMPNO    = C.EMPNO  '+
              '		       AND C.BASE_YY <> ''2005'' '+
              '		       AND A.PSTATE   < ''80''   '+
              '		     GROUP BY A.EMPNO)           '+
              '        ) F'+
              ' WHERE a.pstate   <  '''+FM_Main.pstate +'''                                      '+
              '   AND a.payra    >= '''+FM_Main.payrafr+'''                                      '+
              '   AND a.payra    <= '''+FM_Main.payrato+'''                                      '+
              '   AND a.empno    not in ('''+FM_Main.objemp1 +''', '''+FM_Main.objemp2  +''' ,   '+
              '                          '''+FM_Main.objemp3 +''', '''+FM_Main.objemp4  +''' ,   '+
              '                          '''+FM_Main.objemp5 +''', '''+FM_Main.objemp6  +''' ,   '+
              '                          '''+FM_Main.objemp7 +''', '''+FM_Main.objemp8  +''' ,   '+
              '                          '''+FM_Main.objemp9 +''', '''+FM_Main.objemp10 +'''  )  '+
              '   AND a.deptcode not in ('''+FM_Main.objdept1+''', '''+FM_Main.objdept2 +''' ,   '+
              '                          '''+FM_Main.objdept3+''', '''+FM_Main.objdept4 +''' ,   '+
              '                          '''+FM_Main.objdept5+''', '''+FM_Main.objdept6 +''' ,   '+
              '                          '''+FM_Main.objdept7+''', '''+FM_Main.objdept8 +''' ,   '+
              '                          '''+FM_Main.objdept9+''', '''+FM_Main.objdept10+'''  )  '+
              '    AND  A.DEPTCODE = B.DEPTCODE                                                  '+
              '    AND  A.ORGNUM   = B.ORGNUM                                                    '+
              '    AND  A.PAYCL    = C.CODENO(+) AND C.CODEID(+) = ''I112''                      '+
              '    AND  A.PAYRA    = E.CODENO(+) AND E.CODEID(+) = ''I113''                      '+
              '    AND  A.EMPNO    = D.EMPNO(+)                                                  '+
              '    AND  A.EMPNO    = F.EMPNO(+)                                                  ';
//              '    AND  SUBSTR(A.EMPNO,1,1) NOT IN (''Q'',''P'',''Y'',''J'')                     ';

    SqlText := SqlText + Format(' AND(((A.PAYRA > ''C51'') AND  (A.PAYRA  <= ''H10'') AND  (D.E1EMPNO =''%s'')) '+
                                ' or  ((A.PAYRA = ''C51'') AND  (D.E1EMPNO = ''%s''))) ', [FM_MAIN.pEmpno,FM_MAIN.pEmpno]);
  case  RG_Sort.itemindex  of
        0 :  SqlText := SqlText + ' ORDER  BY A.DEPTCODE, A.PAYRA, A.EMPNO                      ' ;
        1 :  SqlText := SqlText + ' ORDER  BY A.DEPTCODE DESC, A.PAYRA, A.EMPNO                 ' ;
        2 :  SqlText := SqlText + ' ORDER  BY A.EMPNO                                           ' ;
        3 :  SqlText := SqlText + ' ORDER  BY A.EMPNO DESC                                      ' ;
        4 :  SqlText := SqlText + ' ORDER  BY A.KORNAME, A.PAYRA                                ' ;
        5 :  SqlText := SqlText + ' ORDER  BY A.KORNAME DESC, A.PAYRA                           ' ;
  end;
  with Query1 do
  begin
       Close;
       ClearFieldInFo;
       AddField('EMPNO'     , ftString, 100);
       AddField('KORNAME'   , ftString, 100);
       AddField('DEPTNAME'  , ftString, 100);
       AddField('CONYN'     , ftString, 100);
       AddField('FINYN'     , ftString, 100);
       AddField('BAND'      , ftString, 100);
       AddField('PROG'      , ftString, 100);
       AddField('PAYCLPOINT', ftString, 100);
       AddField('YEARPOINT' , ftString, 100);
       AddField('APPPOINT'  , ftString, 100);
       Sql.Clear;
       Sql.Text    := SqlText;
       memo1.text  := SqlText;
       ServiceName := 'HINSA_select10';
       Open;
       Locate('EMPNO',vararrayof([FM_Main.Ed_empno.Text]),[loCaseInsensitive]);
  end;

  for i := 0 to Query1.FieldCount - 1 do
  begin
       Field := Query1.Fields[i];
       Field.Visible := False;

       case Field.Index of
         0 : begin
               Field.Visible      := True;
               Field.DisplayWidth := 7;
               Field.DisplayLabel := '사 번';
             end;
         1 : begin
               Field.Visible      := True;
               Field.DisplayWidth := 10;
               Field.DisplayLabel := '성 명';
             end;
         2 : begin
               Field.Visible      := True;
               Field.DisplayWidth := 15;
               Field.DisplayLabel := '부 서 명';
             end;
         5 : begin
               Field.Visible      := True;
               Field.DisplayWidth := 12;
               Field.DisplayLabel := '진행사항';
             end;
         6 : begin
               Field.Visible      := True;
               Field.DisplayWidth := 5;
               Field.DisplayLabel := 'BAND';
               Field.Alignment    := taCenter;
             end;
(*
         6 : begin
               Field.Visible      := True;
               Field.DisplayWidth := 5;
               Field.DisplayLabel := '연 차';
               Field.Alignment    := taRightJustify;
             end;
*)
         7 : begin
               Field.Visible      := True;
               Field.DisplayWidth := 5;
               Field.DisplayLabel := '취득누계';
               Field.Alignment    := taRightJustify;
             end;
         8 : begin
               Field.Visible      := True;
               Field.DisplayWidth := 5;
               Field.DisplayLabel := '금년누계';
               Field.Alignment    := taRightJustify;
             end;
         9: begin
               Field.Visible      := True;
               Field.DisplayWidth := 5;
               Field.DisplayLabel := '필요POINT';
               Field.Alignment    := taRightJustify;
            end;
       end;
  end;

  if FSelectYn = False Then Exit;
  Width := GetDisplayWidth(Grid1.Canvas,Grid1.Font,87) + 12;

  FSelectYn := False;
end;

procedure TFm_EmpForm.Grid1KeyPress(Sender: TObject; var Key: Char);
begin
  if  Key = Chr(13) then
  begin
       Key := #0;
       Sb_OkClick(Sender);
  end;
end;
                                                                                              
procedure TFm_EmpForm.RG_SortClick(Sender: TObject);
begin
  SqlOpen;
end;

procedure TFm_EmpForm.Sb_CloseClick(Sender: TObject);
begin
  Fempno   := '';
  Fkorname := '';
  FCloseYn := True;
  Edit.PopupForm.ClosePopup(False);
end;

end.
