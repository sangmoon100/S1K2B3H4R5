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
uses PIU3010A1;
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
     if  (FM_MAIN.AEmpno = Query1.FieldByName('empno').AsString) or (Query1.FieldByName('Conyn').AsString = 'Y') then
     begin
          if  Query1.FieldByName('Finyn').AsString = 'Y' then
               MessageDlg('이미 [자기진단서 및 경력계획서 결재]를 최종완료 하였습니다.' + #13+#13+
                          '[자기진단서 및 경력계획서 결재] 내용 확인만 할수 있습니다.', mtConfirmation, [mbOK],0);
          Fempno   := Query1.FieldByName('empno').AsString;
          Fkorname := Query1.FieldByName('korname').AsString;
          FConyn   := Query1.FieldByName('conyn').AsString;
          FFinyn   := Query1.FieldByName('finyn').AsString;
          FCloseYn := False;
          Edit.PopupForm.ClosePopup(False);
     end
     else
     begin
          MessageDlg('사원이 아직 등록 작업을 마치지 않았습니다.'+#13 ,mtError,[mbOK],0);
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

{     SqlText   := Format(' SELECT  A.EMPNO, A.KORNAME, A.ORGNUM,B.DEPTCODE,B.DEPTNAME,                      '+
                         '         A.PAYCL, C.CODENAME PAYCLNAME, A.PAYRA, E.CODENAME PAYRANAME,            '+
                         '         A.PAYRAYN , A.JOBPAYRAYN ,                                               '+
                         '         D.CONYN,D.FINYN,                                                         '+
                         '         decode(D.finyn,''R'',''반려'',''Y'',''결재완료'',                        '+
                         '         decode(D.conyn,''Y'',''결재상신중'', ''등록중'')) prog                   '+
                         '   FROM  PIMEEMP A, PYCDEPT B, PYCCODE C, PYCCODE E, PIME1EMP M,                  '+
                         '        (select empno,nvl(conyn,''Z'') conyn, nvl(e1conyn,''Z'') finyn            '+
                         '           from PMPATHMAS ) D                                                     '+
                         '  WHERE  A.PSTATE   < ''80''                                                      '+
                         '    AND  A.DEPTCODE = B.DEPTCODE                                                  '+
                         '    AND  B.ORGNUM   = (SELECT VALUE1 FROM PIMVARI                                 '+
                         '                        WHERE GUBUN = ''00'' AND SGUBUN = ''0001'')               '+
                         '    AND  A.PAYCL    = C.CODENO(+) AND C.CODEID(+) = ''I112''                      '+
                         '    AND  A.PAYRA    = E.CODENO(+) AND E.CODEID(+) = ''I113''                      '+
                         '    AND  A.EMPNO    = D.EMPNO(+)                                                  '+
                         '    AND  A.EMPNO    = M.EMPNO(+)                                                  '+
                         '    AND  SUBSTR(A.EMPNO,1,1) NOT IN (''M'',''Q'',''P'',''Y'',''J'',''I'')         '+
//                         '    AND  (((A.PAYRA > ''C51'') AND  (A.PAYRA  < ''D50'') AND  (A.EEMPNO =''%s'')) '+
                         '    AND  (((A.PAYRA > ''C51'') AND  (A.PAYRA  < ''D50'') AND  (M.EEMPNO =''%s'')) '+
                         '     or   ((A.PAYRA = ''C51'') AND  (M.EEMPNO = ''%s'')))                         '+
                         '    AND  A.PAYCL    > ''C00''                                                     '+
                         '  ORDER BY A.DEPTCODE, A.PAYRA, A.EMPNO          ',[FM_MAIN.AEmpno,FM_MAIN.AEmpno]);
}
     SqlText   := Format(' SELECT  A.EMPNO, A.KORNAME, A.ORGNUM,B.DEPTCODE,B.DEPTNAME,                      '+ #13#10 +
                         '         A.PAYCL, C.CODENAME PAYCLNAME, A.PAYRA, E.CODENAME PAYRANAME,            '+ #13#10 +
                         '         A.PAYRAYN , A.JOBPAYRAYN ,                                               '+ #13#10 +
                         '         D.CONYN,D.FINYN,                                                         '+ #13#10 +
                         '         decode(D.finyn,''R'',''반려'',''Y'',''결재완료'',                        '+ #13#10 +
                         '         decode(D.conyn,''Y'',''결재상신중'', ''등록중'')) prog                   '+ #13#10 +
                         '   FROM  PIMEEMP A, PYCDEPT B, PYCCODE C, PYCCODE E, pimeemp M,                  '+ #13#10 +
                         '        (select empno,nvl(conyn,''Z'') conyn, nvl(e1conyn,''Z'') finyn            '+ #13#10 +
                         '           from PMPATHMAS ) D                                                     '+ #13#10 +
                         '  WHERE  A.PSTATE   < ''80''                                                      '+ #13#10 +
                         '    AND  A.DEPTCODE = B.DEPTCODE                                                  '+ #13#10 +
                         '    AND  B.ORGNUM   = (SELECT VALUE1 FROM PIMVARI                                 '+ #13#10 +
                         '                        WHERE GUBUN = ''00'' AND SGUBUN = ''0001'')               '+ #13#10 +
                         '    AND  A.PAYCL    = C.CODENO(+) AND C.CODEID(+) = ''I112''                      '+ #13#10 +
                         '    AND  A.PAYRA    = E.CODENO(+) AND E.CODEID(+) = ''I113''                      '+ #13#10 +
                         '    AND  A.EMPNO    = D.EMPNO(+)                                                  '+ #13#10 +
                         '    AND  A.EMPNO    = M.EMPNO(+)                                                  '+ #13#10 +
(*2017.01.10.hjku.. J사번 정규직 사번 전환 관련 수정.. 안효상M
                         '    AND  SUBSTR(A.EMPNO,1,1) NOT IN (''M'',''Q'',''P'',''Y'',''J'',''I'')         '+ #13#10 +
*)                         
                         '    AND  FINDHIRE(A.EMPNO) NOT IN (''M'',''Q'',''P'',''Y'',''J'',''I'')         '+ #13#10 +
//                         '    AND  (((A.PAYRA > ''C51'') AND  (A.PAYRA  < ''D50'') AND  (A.EEMPNO =''%s'')) '+
                         '    AND  (((A.PAYRA > ''C51'') AND  (A.PAYRA  < ''D50'') AND  (M.EEMPNO =''%s'')) '+ #13#10 +
                         '     or   ((A.PAYRA = ''C51'') AND  (M.EEMPNO = ''%s'')))                         '+ #13#10 +
                         '    AND  A.PAYCL    > ''C00''                                                     '+ #13#10 +
                         //2015.12.04.hjku.. 'A0005','A0007','A0009'는 결재에서 제외
                         '    AND A.JOBDEPT not in (''A0005'',''A0007'',''A0009'')                          '+ #13#10 +
                         '  ORDER BY A.DEPTCODE, A.PAYRA, A.EMPNO          ',[FM_MAIN.AEmpno,FM_MAIN.AEmpno]);

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
          AddField('PAYRAYN'      , ftString,  2  );
          AddField('JOBPAYRAYN'   , ftString,  20 );
          AddField('CONYN'        , ftString,  1  );
          AddField('FINYN'        , ftString,  1  );
          AddField('PROG'         , ftString,  11 );
          Sql.Clear;
          Sql.Text    := SqlText;
          //memo1.text  := SqlText;
          ServiceName := 'PIT1030A_SEL9';
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
                        Field.DisplayWidth := 8;
                        Field.DisplayLabel := '사 번';
                   end;
               1 : begin
                        Field.Visible      := True;
                        Field.DisplayWidth := 12;
                        Field.DisplayLabel := '성 명';
                   end;
               8 : begin
                        Field.Visible      := True;
                        Field.DisplayWidth := 10;
                        Field.DisplayLabel := '직 책';
                   end;
               4 : begin
                        Field.Visible      := True;
                        Field.DisplayWidth := 32;
                        Field.DisplayLabel := '부 서 명';
                   end;
               13: begin
                        Field.Visible      := True;
                        Field.DisplayWidth := 16;
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
