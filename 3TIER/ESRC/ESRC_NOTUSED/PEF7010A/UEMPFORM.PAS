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
    Fempno        : string;
    Fkorname      : string;
    FConyn        : string;
    FFinyn        : string;
    SqlText       : string;
  public
    Edit      : TOnWinPopupEdit;

    FCloseYn : Boolean;
    property empno        : string        read Fempno        write Fempno;
    property korname      : string        read Fkorname      write Fkorname;
    property Conyn        : string        read FConyn        write FConyn;
    property Finyn        : string        read FFinyn        write FFinyn;
    procedure SqlOpen;
  end;

var
  Fm_EmpForm : TFm_EmpForm;

implementation

uses PEF7010A1;
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
//  FM_Main.Select_BaseData;
  FM_Main.Ed_empno.Text          := Query1.FieldByName('empno').AsString;
  FM_Main.L_korname.ValueCaption := Query1.FieldByName('korname').AsString;
  Edit.PopupForm.ClosePopup(False);
end;

procedure TFm_EmpForm.SqlOpen;
var
     i       : integer;
     Field   : TField;
     Str     : string;
     OleData : OleVariant;
     SqlText : string;
begin

     SqlText   := ' SELECT A.empno, A.korname,                                                        '+
                  '       (select codename from pyccode where codeid=''I112'' and codeno=A.paycl)  ,  '+
                  '       (select codename from pyccode where codeid=''I113'' and codeno=A.payra)  ,  '+
                  '       (select deptname from pycdept where orgnum=A.orgnum and deptcode=A.deptcode)'+
                  '   FROM  PIMPMAS A                                                                 '+
                  '  WHERE  A.PSTATE   < ''80''                                                       '+
                  '  AND  A.EMPNO IN (SELECT VALUE1 FROM PEAVARI WHERE S_NO = ''001''                 '+
                  '                   UNION                                                           '+
                  '                   SELECT VALUE2 FROM PEAVARI WHERE S_NO = ''001'')                '+
                  '  ORDER BY A.EMPNO ';

     with Query1 do
     begin
       ServiceName := 'HINSA_select';
       ClearFieldInfo;
       AddField('empno'   , ftString, 100);
       AddField('korname' , ftString, 100);
       AddField('Field3'  , ftString, 100);
       AddField('Field4'  , ftString, 100);
       AddField('Field5'  , ftString, 100);

       Close;
       SQl.Clear;
       SQL.Text := SqlText;
       Open;
       if RecordCount > 0 then
       begin
             FM_Main.Ed_empno.Text            := Fields[0].AsString;
             FM_Main.L_korname.ValueCaption   := Fields[1].AsString;
       end;
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
               2 : begin
                        Field.Visible      := True;
                        Field.DisplayWidth := 10;
                        Field.DisplayLabel := '직 급';
                   end;
               3 : begin
                        Field.Visible      := True;
                        Field.DisplayWidth := 10;
                        Field.DisplayLabel := '직 책';
                   end;
               4: begin
                       Field.Visible      := True;
                       Field.DisplayWidth := 15;
                       Field.DisplayLabel := '부 서 명';
                   end;
          end;
     end;
     Width := GetDisplayWidth(Grid1.Canvas,Grid1.Font,60) + 36;
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
