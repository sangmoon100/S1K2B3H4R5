unit PIU30502;

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
    Panel3: TPanel;
    E_cond: TOnButtonEdit;
    procedure FormCreate(Sender: TObject);
    procedure Pa_TitleMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure Sb_CloseClick(Sender: TObject);
    procedure Sb_OkClick(Sender: TObject);
    procedure Grid1KeyPress(Sender: TObject; var Key: Char);
    procedure E_condButtonClick(Sender: TObject; ButtonIndex: Integer);
    procedure E_condKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    FOrgDept      : string;
    Feempno        : string;
    Fekorname      : string;
    Fedeptcode    : String;
    Fedeptname    : String;
    FConyn        : string;
    FFinyn        : string;
    SqlText       : string;
  public
    Edit      : TOnWinPopupEdit;

    FCloseYn : Boolean;
    property OrgDeptList  : string        read FOrgDept      write FOrgDept;
    property empno        : string        read Feempno       write Feempno;
    property korname      : string        read Fekorname     write Fekorname;
    property deptcode     : string        read Fedeptcode    write Fedeptcode;
    property deptname     : string        read Fedeptname    write Fedeptname;
    property Conyn        : string        read FConyn        write FConyn;
    property Finyn        : string        read FFinyn        write FFinyn;
    procedure SqlOpen;
  end;

var
  Fm_EmpForm : TFm_EmpForm;

implementation
uses PIU30501;
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
     Feempno   := '';
     Fekorname := '';
     FCloseYn := True;
     Edit.PopupForm.ClosePopup(False);
end;

procedure TFm_EmpForm.Sb_OkClick(Sender: TObject);
begin
    Feempno   := Query1.FieldByName('eempno').AsString;
    Fekorname := Query1.FieldByName('ekorname').AsString;
    Fedeptcode:= Query1.FieldByName('edeptcode').AsString;
    Fedeptname:= Query1.FieldByName('edeptname').AsString;

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
  with  Query1  do
  begin
       Close;
       ClearFieldInfo;
       AddField('EEMPNO'      , ftString, 100);
       AddField('EKORNAME'    , ftString, 100);
       AddField('EPAYCLNAME'  , ftString, 100);
       AddField('EPAYRANAME'  , ftString, 100);
       AddField('EPAYRAYN'    , ftString, 100);
       AddField('EORGNUM'     , ftString, 100);
       AddField('edeptcode'   , ftString, 100);
       AddField('edeptname'   , ftString, 100);
       AddField('EJOBPAYRA'   , ftString, 100);
       AddField('EJOBPAYRAYN' , ftString, 100);
       Sql.Clear;
       Sql.Text := 'select distinct EEMPNO ' +
                   '               , EKORNAME ' +
                   '		   , C.CODENAME EPAYCLNAME ' +
                   '		   , E.CODENAME EPAYRANAME ' +
                   ' 		   , EPAYRAYN ' +
                   ' 		   , EORGNUM ' +
                   ' 		   , edeptcode ' +
                   '		   , trim(b.deptname) edeptname ' +
                   ' 		   , EJOBPAYRA ' +
                   ' 		   , EJOBPAYRAYN ' +
                   '  from pimeemp	a, pycdept b, PYCCODE C, PYCCODE E  ' +
                   '  where a.EORGNUM = b.ORGNUM ' +
                   '    and a.edeptcode = b.deptcode ' +
                   '	AND  A.EPAYCL    = C.CODENO(+) AND C.CODEID(+) = ''I112''                           ' +
                   '	AND  A.EPAYRA    = E.CODENO(+) AND E.CODEID(+) = ''I113''	 ' +
            format('	and (a.EEMPNO like ''%s'' or a.EKORNAME like ''%s'' ) ', ['%'+E_cond.text+'%','%'+E_cond.text+'%']) +
                   '	order by eempno ' ;;
       ServiceName := 'HINSA_select10';
       //memo1.text := Sql.Text;
       Open;

       {GSMEpayra  := FieldByName('PAYRA').AsString;
       MEpayra.ValueCaption := Get_CodeName('I113',FieldByName('payra').AsString);    //Á÷À§
       VDeptname  := FieldByName('DEPTNAME').AsString;
       VJuminid   := FieldByName('JUMINID').AsString;
       VStdate    := FieldByName('ORGEMPDATE').AsString;
       VEDdate    := FieldByName('RETDATE').AsString;
       VDuYY      := FieldByName('HANADUYY').AsString;
       VDuMM      := FieldByName('HANADUMM').AsString;
       VKORNAME   := FieldByName('KORNAME').AsString;
       VPresName  := FieldByName('PRESNAME').AsString;
       VCompNAME  := FieldByName('COMPNAME').AsString;

       Close;   }
  end;
end;

procedure TFm_EmpForm.Grid1KeyPress(Sender: TObject; var Key: Char);
begin
     if  Key = Chr(13) then
     begin
          Key := #0;
          Sb_OkClick(Sender);
     end;
end;
procedure TFm_EmpForm.E_condButtonClick(Sender: TObject;
  ButtonIndex: Integer);
begin
    SqlOpen;
end;

procedure TFm_EmpForm.E_condKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    E_condButtonClick(Sender, 0);
end;

end.
