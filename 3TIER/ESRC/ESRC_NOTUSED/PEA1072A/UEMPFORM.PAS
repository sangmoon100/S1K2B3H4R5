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
    SqlText       : string;
  public
    Edit      : TOnWinPopupEdit;

    FCloseYn : Boolean;
    property OrgDeptList  : string        read FOrgDept      write FOrgDept;
    property empno        : string        read Fempno        write Fempno;
    property korname      : string        read Fkorname      write Fkorname;
    procedure SqlOpen;
  end;

var
  Fm_EmpForm : TFm_EmpForm;

implementation
uses   PEA1072A1;
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
     if Query1.FieldByName('E1Valconyn').AsString = 'N' then
     begin
          MessageDlg('1차평가자께서 최종평가완료하지 않으신 평가자입니다.'+#13#13+
                     '궁금하신 사항은 HR팀에 문의하여 주십시오.',mtInformation,[mbOK],0);
     end;
//     else
     begin
          Fempno   := Query1.FieldByName('empno').AsString;
          Fkorname := Query1.FieldByName('korname').AsString;
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
     SqlText : string;
begin
       SqlText := Format(' SELECT  A.EMPNO, A.KORNAME, A.ORGNUM,B.DEPTCODE,B.DEPTNAME,                      '+
                         '         A.PAYCL, C.CODENAME PAYCLNAME, A.PAYRA, E.CODENAME PAYRANAME,            '+
                         '         A.jobgun , D.codename,                                                   '+
                         '         A.E1valconyn conyn, null,                                                '+
                         '         decode(A.E1valconyn, ''Y'',''평가완료'',''미평가'') prog                 '+
                         '   FROM  PEHREMAS A, PYCDEPT B, PYCCODE C, PYCCODE D, PYCCODE E                   '+
                         '  WHERE  A.RABASDATE= ''%s''                                                      '+
                         '    AND  A.RESTIYN  = ''Y''                                                       '+
                         '    AND  A.DEPTCODE = B.DEPTCODE                                                  '+
                         '    AND  A.ORGNUM   = B.ORGNUM                                                    '+
                         '    AND  A.PAYCL    = C.CODENO(+) AND C.CODEID(+) = ''I112''                      '+
                         '    AND  A.JOBGUN   = D.CODENO(+) AND D.CODEID(+) = ''I115''                      '+
                         '    AND  A.PAYRA    = E.CODENO(+) AND E.CODEID(+) = ''I113''                      '+
                         '    AND  A.empno    in  (select empno from petremas where rabasdate = ''%s'')     '
                         ,[FM_MAIN.vRabasdate,FM_MAIN.vRabasdate]);

       if  (FM_MAIN.AEmpno = FM_MAIN.Workemp1) or (FM_MAIN.AEmpno = FM_MAIN.Workemp2) or
           (FM_MAIN.AEmpno = FM_MAIN.Workemp3) or (FM_MAIN.AEmpno = FM_MAIN.Workemp4) or
           (FM_MAIN.AEmpno = FM_MAIN.Workemp5) or (Copy(FM_MAIN.AEmpno,1,1)   = 'D') then

       else if (FM_Main.vRabasdate = FM_Main.vRabasNew) then //평가결과오픈시           
            SqlText := SqlText + Format('  AND (   (A.EMPNO     = ''%s'')   ',[FM_MAIN.AEmpno])+
                                 Format('       or (A.E1EMPNO   = ''%s'')   ',[FM_MAIN.AEmpno])+
                                 Format('       or (A.E2EMPNO   = ''%s'') ) ',[FM_MAIN.AEmpno])

       else //조직개편이후 : 평가 이후에 팀장 변경시 새로운 팀장이 이전 평가 내역 볼수 있도록.
            SqlText := SqlText + Format('  AND  A.empno in (select empno from PEHREMAS where rabasdate = ''%s'' ', [FM_MAIN.vRabasNew])+
                                 Format('  AND (   (A.E1EMPNO   = ''%s'')     ',[FM_MAIN.AEmpno]  )+
                                 Format('       or (A.E2EMPNO   = ''%s'') ) ) ',[FM_MAIN.AEmpno] );

       SqlText := SqlText + ' ORDER BY A.DEPTCODE, A.PAYRA, A.EMPNO ';

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
          AddField('JOBGUN'       , ftString,  2  );
          AddField('JOBGUNNAME'   , ftString,  20 );
          AddField('E1VALCONYN'   , ftString,  1  );
          AddField('FINYN'        , ftString,  1  );
          AddField('PROG'         , ftString,  11 );
          Sql.Clear;
          Sql.Text    := SqlText;
          memo1.text  := SqlText;
          ServiceName := 'PIT1030A_SEL9';
          Open;
          if FM_Main.E_empno.Text <> '' then
             Locate('EMPNO',vararrayof([FM_Main.E_empno.Text]),[loCaseInsensitive]);
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
