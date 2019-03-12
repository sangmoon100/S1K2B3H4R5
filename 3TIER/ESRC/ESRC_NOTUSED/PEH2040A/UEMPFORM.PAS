unit UEmpForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, pegradpanl, StdCtrls, Mask, Grids, DBGrids, Db, DBTables, pegraphic, DBClient, MIDAScon,
  Tmax_DataSetText, OnDBGrid, OnFocusButton, ComCtrls, OnShapeLabel,
  OnGrDBGrid, OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl,  func,
  OnPopupEdit, OnTmaxPersonEdit;

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
    E_Search: TTMaxPersonPopupEdit;
    Sb_search: TOnFocusButton;
    procedure FormCreate(Sender: TObject);
    procedure Pa_TitleMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure Sb_CloseClick(Sender: TObject);
    procedure Sb_OkClick(Sender: TObject);
    procedure Grid1KeyPress(Sender: TObject; var Key: Char);
    procedure E_SearchKeyPress(Sender: TObject; var Key: Char);
    procedure Sb_searchClick(Sender: TObject);
    procedure E_SearchEnter(Sender: TObject);
  private
    { Private declarations }
    FOrgDept      : string;
    Fempno        : string;
    Fkorname      : string;
    FEgubun       : string;
    FConyn        : string;
    FFinyn        : string;
    SqlText       : string;
  public
    Edit      : TOnWinPopupEdit;

    FCloseYn : Boolean;
    property OrgDeptList  : string        read FOrgDept      write FOrgDept;
    property empno        : string        read Fempno        write Fempno;
    property korname      : string        read Fkorname      write Fkorname;
    property Egubun       : string        read FEgubun       write FEgubun;
    property Conyn        : string        read FConyn        write FConyn;
    property Finyn        : string        read FFinyn        write FFinyn;
    procedure SqlOpen;
  end;

var
  Fm_EmpForm : TFm_EmpForm;

implementation
uses PEH2040A1;
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
     if not ((FM_Main.Pempno = FM_Main.Workemp1) or (FM_Main.Pempno = FM_Main.Workemp2) or (FM_Main.Pempno = FM_Main.Workemp3) or
             (FM_Main.Pempno = FM_Main.Workemp4) or (FM_Main.Pempno = FM_Main.Workemp5) or (copy(FM_Main.Pempno,1,1) = 'D')) then //Exit;
        FM_Main.BT_ExitClick(FM_Main.BT_Exit);
end;

procedure TFm_EmpForm.Sb_OkClick(Sender: TObject);
begin
     if  (Query1.FieldByName('egubun').AsString='2차') and (Query1.FieldByName('Finyn').AsString = 'N') then
     begin
          MessageDlg('1차평가자가 [성과 Review 의견 등록]을 아직 마치지 않았습니다.', mtInformation, [mbOK],0);
     end
     else
     begin
          if  (Query1.FieldByName('egubun').AsString='1차') then
          begin
               if  (Query1.FieldByName('Finyn').AsString = 'Y') then
                         MessageDlg('이미 [성과 Review 의견등록]을 최종완료 하였습니다.' + #13+#13+
                                    '[성과 Review 의견등록] 내용 확인만 할수 있습니다.', mtInformation, [mbOK],0)
               else
               if  (Query1.FieldByName('ReConyn').AsString = 'Y') And (Query1.FieldByName('E1PRJCONYN').AsString = 'N') then
                    MessageDlg('해당사원은 업무목표 등록 대상자입니다.' + #13+#13+
                               '업무목표등록/결재를 먼저 완료하신 후 작업하셔야 업적 성과 Review가 제대로 이뤄집니다.', mtInformation, [mbOK],0);
          end;
          Fempno   := Query1.FieldByName('empno').AsString;
          Fkorname := Query1.FieldByName('korname').AsString;
          FEGubun  := Query1.FieldByName('EGubun').AsString;
          FConyn   := Query1.FieldByName('conyn').AsString;
          FFinyn   := Query1.FieldByName('finyn').AsString;
          FCloseYn := False;
          Edit.PopupForm.ClosePopup(False);
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

     SqlText := Format(' SELECT  A.EMPNO, A.KORNAME, A.E1PRJCONYN,B.DEPTCODE,B.DEPTNAME,                                       ' +
                       '         A.PAYCL, C.CODENAME PAYCLNAME, A.PAYRA, D.CODENAME PAYRANAME,                                 ' +
                       '         A.RECONYN,Decode(''%s'',E2empno,''2차'',E1empno,''1차'') EGUBUN,                              ' +
                       '         A.E1MIDCONYN FINYN, A.E2MIDCONYN CONYN,                                                       ' +
                       '         decode(A.RECONYN,''Y'',decode(A.E2MIDCONYN,''Y'',''2차확인완료'',                             ' +
                       '                                 decode(A.E1MIDCONYN,''Y'',''1차결재완료'',                            ' +
		       '                                  decode(A.E1PRJCONYN,''Y'',DECODE(A.RMIDCONYN, ''Y'', ''등록완료'',   ' +
                       '                                                                   ''등록중''),''목표미설정''))),      ' +
                       '                          ''N'',decode(A.E2MIDCONYN,''Y'',''2차확인완료'',                             ' +
                       '                                       decode(A.E1MIDCONYN,''Y'',''1차결재완료'',                      ' +
                       '                                        DECODE(A.RMIDCONYN, ''Y'', ''등록완료'', ''등록중''))))        ' +
                       '   FROM  PEHREMAS A, PYCDEPT B, PYCCODE C, PYCCODE D                                                   ' +
                       '  WHERE  A.RABASDATE = ''%s''                                                                          ' +
//                       '    AND  A.RECONYN   = ''Y''                                                                           ' + //목표등록 대상자 아닌사람도 성과Review할 수 있도록
                       '    AND  A.DEPTCODE  = B.DEPTCODE                                                                      ' +
                       '    AND  A.ORGNUM    = B.ORGNUM                                                                        ' +
                       '    AND  A.PAYCL     = C.CODENO(+) AND C.CODEID(+) = ''I112''                                          ' +
                       '    AND  A.PAYRA     = D.CODENO(+) AND D.CODEID(+) = ''I113''                                          ' +
                       '    AND  A.PAYRA     > ''C11''                                                                         ' +
                       '    AND  A.PAYRA     < ''D40''                                                                         ' +
                       '    AND  ((A.E1EMPNO   = ''%s'') or (A.E2EMPNO   = ''%s''))                                            ' +
                       '  ORDER  BY EGUBUN,A.DEPTCODE, A.PAYRA, A.KORNAME                                                      ',
                       [FM_Main.E_empno.Text, FM_Main.sRabasdate, FM_Main.E_empno.Text, FM_Main.E_empno.Text]);

     with Query1 do
     begin
          Close;
          ClearFieldInFo;
          AddField('EMPNO'        , ftString,  4  );
          AddField('KORNAME'      , ftString,  12 );
          AddField('E1PRJCONYN'   , ftString,  3  );
          AddField('DEPTCODE'     , ftString,  6  );
          AddField('DEPTNAME'     , ftString,  60 );
          AddField('PAYCL'        , ftString,  3  );
          AddField('PAYCLNAME'    , ftString,  20 );
          AddField('PAYRA'        , ftString,  3  );
          AddField('PAYRANAME'    , ftString,  20 );
          AddField('RECONYN'      , ftString,  2  );
          AddField('EGUBUN'       , ftString,  20 );
          AddField('FINYN'        , ftString,  1  );
          AddField('CONYN'        , ftString,  1  );
          AddField('PROG'         , ftString,  11 );
          Sql.Clear;
          Sql.Text    := SqlText;
          memo1.text  := SqlText;
          ServiceName := 'PIT1030A_SEL9';
          Open;
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
procedure TFm_EmpForm.E_SearchKeyPress(Sender: TObject; var Key: Char);
begin
     if  Key = Chr(13) then
     begin
          Key := #0;
          Sb_searchClick(Sender);
     end;
end;

procedure TFm_EmpForm.Sb_searchClick(Sender: TObject);
begin
     if (Query1.RecordCount > 0) and (Trim(E_Search.Text) <> '') then
     begin
          if IsNumber(E_Search.Text)  then
               Query1.Locate('EMPNO',VarArrayOf([E_Search.Text]),[loPartialKey])
          else
               Query1.Locate('KORNAME',VarArrayOf([E_Search.Text]),[loPartialKey]);
          Grid1.SetFocus;
     end;
end;

procedure TFm_EmpForm.E_SearchEnter(Sender: TObject);
begin
     E_Search.Text := '';
end;

end.
