unit PIU30215;

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
    procedure FormCreate(Sender: TObject);
    procedure Pa_TitleMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure Sb_CloseClick(Sender: TObject);
    procedure Sb_OkClick(Sender: TObject);
    procedure Grid1KeyPress(Sender: TObject; var Key: Char);
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
uses PIU30211;
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
  if  (MainForm.AEmpno = Query1.FieldByName('empno').AsString) or (Query1.FieldByName('Status').AsString = '1') then
  begin
    Fempno   := Query1.FieldByName('empno').AsString;
    Fkorname := Query1.FieldByName('korname').AsString;
    //FConyn   := Query1.FieldByName('conyn').AsString;
    //FFinyn   := Query1.FieldByName('finyn').AsString;
    FCloseYn := False;
    Edit.PopupForm.ClosePopup(False);
  end
  else
  begin
    if(MainForm.AEmpno <> Query1.FieldByName('empno').AsString) then
         MessageDlg('사원이 아직 등록 작업을 마치지 않았습니다.'+#13 ,mtError,[mbOK],0)
    else MessageDlg('부문이동 희망부서 등록 대상자가 아닙니다.'+#13 ,mtError,[mbOK],0);
  end;
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
     SqlText   := Format(' SELECT  A.EMPNO, A.KORNAME, A.ORGNUM,B.DEPTCODE,B.DEPTNAME,                    '+ #13#10 +
                       '         A.PAYCL, C.CODENAME PAYCLNAME, A.PAYRA, E.CODENAME PAYRANAME,            '+ #13#10 +
                       '         A.DEPTGUBUN, A.JOBDUTY ,                                                 '+ #13#10 +
                       '         A.CONYN,  a.Sectstatus Status  ,                                         '+ #13#10 +
                       '         decode(A.Sectstatus,''2'',''신청'',''1'',''저장'',''진행전'') prog       '+ #13#10 +
                       '   FROM  PMOVEMAS A, PYCDEPT B, PYCCODE C, PYCCODE E                              '+ #13#10 +
                       '  WHERE  A.DEPTCODE = B.DEPTCODE                                                  '+ #13#10 +
                       '    AND  A.RABASYY  = ''%s''                                                      '+ #13#10 +
                       '    AND  B.ORGNUM   = (SELECT VALUE1 FROM PIMVARI                                 '+ #13#10 +
                       '                        WHERE GUBUN = ''00'' AND SGUBUN = ''0001'')               '+ #13#10 +
                       '    AND  A.PAYCL    = C.CODENO(+) AND C.CODEID(+) = ''I112''                      '+ #13#10 +
                       '    AND  A.PAYRA    = E.CODENO(+) AND E.CODEID(+) = ''I113''                      '+ #13#10 +
                       '    AND  NVL(SECTYN,''N'') = ''Y''                                                '+ #13#10 +
                       //'    AND  SUBSTR(A.EMPNO,1,1) NOT IN (''M'',''Q'',''P'',''Y'',''J'',''I'')         '+ #13#10 +
                       //'    AND  A.PAYRA    >= ''C51''                                                    '+ #13#10 +
                       //'    AND  A.PAYRA    < ''D50''                                                     '+ #13#10 +
                       //'    AND  A.PAYCL    > ''C00''                                                     '+ #13#10 +
                       ' ORDER BY A.SectStatus ,A.DEPTCODE, A.PAYRA, A.EMPNO                           ',[MainForm.gs_Year]);

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
          AddField('PAYRAYN'      , ftString,  2  ); //2016.11.15 사용안함
          AddField('JOBPAYRAYN'   , ftString,  20 ); //2016.11.15 사용안함
          AddField('CONYN'        , ftString,  1  ); //2016.11.15 사용안함
          AddField('Status'       , ftString,  1  );
          AddField('PROG'         , ftString,  11 );
          Sql.Clear;
          Sql.Text    := SqlText;
          //memo1.text  := SqlText;
          ServiceName := 'PIT1030A_SEL9';
          Open;
          Locate('EMPNO',vararrayof([MainForm.Ed_empno.Text]),[loCaseInsensitive]);
     end;

     for i := 0 to Query1.FieldCount - 1 do
     begin
          Field := Query1.Fields[i];
          Field.Visible := False;
          case Field.Index of
               0 : begin
                        Field.Visible      := True;
                        Field.DisplayWidth := 8;
                        Field.DisplayLabel := '사 번';
                   end;
               1 : begin
                        Field.Visible      := True;
                        Field.DisplayWidth := 10;
                        Field.DisplayLabel := '성 명';
                   end;
               8 : begin
                        Field.Visible      := True;
                        Field.DisplayWidth := 8;
                        Field.DisplayLabel := '직 책';
                   end;
               4 : begin
                        Field.Visible      := True;
                        Field.DisplayWidth := 24;
                        Field.DisplayLabel := '부 서 명';
                   end;
               11: begin
                        Field.Visible      := True;
                        Field.DisplayWidth := 12;
                        Field.DisplayLabel := '대상여부';
                   end;
               13: begin
                        Field.Visible      := True;
                        Field.DisplayWidth := 12;
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
end.
