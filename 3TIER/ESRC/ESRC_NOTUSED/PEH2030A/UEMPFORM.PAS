unit UEmpForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, pegradpanl, StdCtrls, Mask, Grids, DBGrids, Db, DBTables, pegraphic, DBClient, MIDAScon,
  Tmax_DataSetText, OnDBGrid, OnFocusButton, ComCtrls, OnShapeLabel,
  OnGrDBGrid, OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl,
  OnPopupEdit;

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

    FCloseYn : Boolean;
    property OrgDeptList  : string        read FOrgDept      write FOrgDept;
    property empno        : string        read Fempno        write Fempno;
    property korname      : string        read Fkorname      write Fkorname;
    property Conyn        : string        read FConyn        write FConyn;
    property Finyn        : string        read FFinyn        write FFinyn;
    procedure SqlOpen;
  end;

var
  Fm_EmpForm : TFm_EmpForm;

implementation
uses PEH2030A1;
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

procedure TFm_EmpForm.Sb_CloseClick(Sender: TObject);
begin
     Fempno   := '';
     Fkorname := '';
     FCloseYn := True;
     Edit.PopupForm.ClosePopup(False);
end;

procedure TFm_EmpForm.Sb_OkClick(Sender: TObject);
begin
     Fempno   := Query1.FieldByName('empno').AsString;
     Fkorname := Query1.FieldByName('korname').AsString;
     FConyn   := Query1.FieldByName('conyn').AsString;
     FFinyn   := Query1.FieldByName('finyn').AsString;
     FCloseYn := False;
     Edit.PopupForm.ClosePopup(False);
end;

procedure TFm_EmpForm.SqlOpen;
var
     i       : integer;
     Field   : TField;
     Str     : string;
     OleData : OleVariant;
     SqlText,FOrgDept1,FOrgDept2 : string;
begin
     FOrgDept1 := copy(FOrgDept,3,3);
     FOrgDept2 := copy(FOrgDept,9,4) + '%';

     SqlText := Format(' SELECT  A.EMPNO, A.KORNAME, A.ORGNUM,B.DEPTCODE,B.DEPTNAME,                                           ' +
                       '         A.PAYCL, C.CODENAME PAYCLNAME, A.PAYRA, D.CODENAME PAYRANAME,                                 ' +
                       '         A.RECONYN, E.CODENAME JOBGUNNAME,A.E1PRJCONYN CONYN,A.E1MIDCONYN FINYN,                       ' +
                       '         decode(A.RECONYN,''Y'',decode(A.E2MIDCONYN,''Y'',''2차확인완료'',                             ' +
                       '                                 decode(A.E1MIDCONYN,''Y'',''1차결재완료'',                            ' +
		       '                                  decode(A.E1PRJCONYN,''Y'',DECODE(A.RMIDCONYN, ''Y'', ''등록완료'',   ' +
                       '                                                                   ''등록중''),''목표미설정''))),      ' +
                       '                          ''N'',decode(A.E2MIDCONYN,''Y'',''2차확인완료'',                             ' +
                       '                                       decode(A.E1MIDCONYN,''Y'',''1차결재완료'',                      ' +
                       '                                        DECODE(A.RMIDCONYN, ''Y'', ''등록완료'', ''등록중''))))        ' +
                       '   FROM  PEHREMAS A, PYCDEPT B, PYCCODE C, PYCCODE D, PYCCODE E                                        ' +
                       '  WHERE  A.RABASDATE = ''%s''                                                                          ' +
                       //'    AND  A.RECONYN   = ''Y''                                                                           ' +
                       '    AND  A.DEPTCODE  = B.DEPTCODE                                                                      ' +
                       '    AND  A.ORGNUM    = B.ORGNUM                                                                        ' +
                       '    AND  A.PAYCL     = C.CODENO(+) AND C.CODEID(+) = ''I112''                                          ' +
                       '    AND  A.PAYRA     = D.CODENO(+) AND D.CODEID(+) = ''I113''                                          ' +
                       '    AND  A.JOBGUN    = E.CODENO(+) AND E.CODEID(+) = ''I115''                                          ' +
                       '    AND  A.PAYRA     < ''D40'' ',[FM_Main.sRabasdate]) ;

     if not ((FM_Main.Pempno = FM_Main.Workemp1) or (FM_Main.Pempno = FM_Main.Workemp2) or (copy(FM_Main.Pempno,1,1) = 'D')) then
          SqlText := SqlText + Format(' AND  A.EMPNO = ''%s'' ', [FM_Main.Ed_empno.Text]);
     case  RG_Sort.itemindex  of
           0 :  SqlText := SqlText + ' ORDER  BY A.DEPTCODE, A.PAYRA, A.EMPNO                                                  ' ;
           1 :  SqlText := SqlText + ' ORDER  BY A.DEPTCODE DESC, A.PAYRA, A.EMPNO                                             ' ;
           2 :  SqlText := SqlText + ' ORDER  BY A.EMPNO                                                                       ' ;
           3 :  SqlText := SqlText + ' ORDER  BY A.EMPNO DESC                                                                  ' ;
           4 :  SqlText := SqlText + ' ORDER  BY A.KORNAME, A.PAYRA                                                            ' ;
           5 :  SqlText := SqlText + ' ORDER  BY A.KORNAME DESC, A.PAYRA                                                       ' ;
     end;
     Grid1.DataSource := nil;
     with Query1 do
     begin
          Close;
          ClearFieldInFo;
          AddField('EMPNO'        , ftString,  4  );
          AddField('KORNAME'      , ftString,  12 );
          AddField('ORGNUM'       , ftString,  3  );
          AddField('DEPTCODE'     , ftString,  6  );
          AddField('DEPTNAME'     , ftString,  60 );
          AddField('PAYCL'        , ftString,  3  );
          AddField('PAYCLNAME'    , ftString,  20 );
          AddField('PAYRA'        , ftString,  3  );
          AddField('PAYRANAME'    , ftString,  20 );
          AddField('RECONYN'      , ftString,  2  );
          AddField('JOBGUNNAME'   , ftString,  20 );
          AddField('CONYN'        , ftString,  1  );
          AddField('FINYN'        , ftString,  1  );
          AddField('PROG'         , ftString,  11 );
          Sql.Clear;
          Sql.Text    := SqlText;
          memo1.text  := SqlText;
          ServiceName := 'PIT1030A_SEL9';
          Open;

          if  not Query1.Locate('EMPNO', VarArrayOf([FM_Main.Ed_empno.Text]), [loPartialKey]) then
               Query1.First;
          Grid1.DataSource := ds1;
     end;

     for i := 0 to Query1.FieldCount - 1 do
     begin
          Field := Query1.Fields[i];
          Field.Visible := False;
          case Field.Index of
               0 : begin
                        Field.Visible      := True;
                        Field.DisplayWidth := 9;
                        Field.DisplayLabel := '사 번';
                   end;
               1 : begin
                        Field.Visible      := True;
                        Field.DisplayWidth := 15;
                        Field.DisplayLabel := '성 명';
                   end;
               8 : begin
                        Field.Visible      := True;
                        Field.DisplayWidth := 10;
                        Field.DisplayLabel := '직 책';
                   end;
               4 : begin
                        Field.Visible      := True;
                        Field.DisplayWidth := 30;
                        Field.DisplayLabel := '부 서 명';
                   end;
               13: begin
                        Field.Visible      := True;
                        Field.DisplayWidth := 14;
                        Field.DisplayLabel := '진행상황';
                   end;
          end;
     end;
     Width := GetDisplayWidth(Grid1.Canvas,Grid1.Font,87) + 36;

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

end.
