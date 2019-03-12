unit UEmpForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  peoutlookbtn, ExtCtrls, pegradpanl, StdCtrls, Mask, pebtnedit, Grids,
  DBGrids, pedbgrid, Db, DBTables, pegraphic, DBClient, MIDAScon,
  TXClientDS, Tmax_DataSetText, OnEditBaseCtrl, OnEditStdCtrl, OnGrDBGrid,
  OnFocusButton, OnPopupEdit;

type
  TFm_DestValue = class(TForm)
    Panel1      : TPanel;
    DataSource1 : TDataSource;
    Panel2: TPanel;
    Sb_run: TOnFocusButton;
    Sb_Ok: TOnFocusButton;
    Sb_Close: TOnFocusButton;
    Grid1: TOnGrDbGrid;
    Edit_see: TOnEdit;
    Query1: TTMaxDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Pa_TitleMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure Sb_CloseClick(Sender: TObject);
    procedure Sb_OkClick(Sender: TObject);
    procedure Grid1KeyPress(Sender: TObject; var Key: Char);
//    procedure Query1BeforeCall(DataSet: TDataSet; var Buffer: PChar);
    procedure Edit_seeKeyPress(Sender: TObject; var Key: Char);
    procedure Sb_runClick(Sender: TObject);
    procedure Grid1DblClick(Sender: TObject);
  private
    { Private declarations }
    FStart        : Boolean;
    Fempno        : string;
    Fkorname      : string;
    Forgnum       : string;
    Fdeptcode     : string;
    Fdeptname     : string;
    Fpaycl        : string;
    Fpayclname    : string;
    Fpayra        : string;
    Fpayraname    : string;
    Fjobgun       : string;
    Fjobgunname   : string;
    Fpayrayn      : string;

    procedure SqlOpen;
  public
    //  Tuxedo Component BeforeCall Event 처리변수
    Query1_Pmax : String;
    Query1_Prfd : String;
    Query1_Psfd : array of String;

    Edit      : TOnWinPopupEdit;
    
    FCloseYn : Boolean;

    property empno        : string        read Fempno        write Fempno;
    property korname      : string        read Fkorname      write Fkorname;
    property orgnum       : string        read Forgnum       write Forgnum;
    property deptcode     : string        read Fdeptcode     write Fdeptcode;
    property deptname     : string        read Fdeptname     write Fdeptname;
    property paycl        : string        read Fpaycl        write Fpaycl;
    property payclname    : string        read Fpayclname    write Fpayclname;
    property payra        : string        read Fpayra        write Fpayra;
    property payraname    : string        read Fpayraname    write Fpayraname;
    property jobgun       : string        read Fjobgun       write Fjobgun;
    property jobgunname   : string        read Fjobgunname   write Fjobgunname;
    property payrayn      : string        read Fpayrayn      write Fpayrayn;
  end;

var
  Fm_DestValue: TFm_DestValue;

implementation
uses pit203000;
{$R *.DFM}

procedure TFm_DestValue.FormCreate(Sender: TObject);
begin
  FStart        := True;
  FCloseYn      := False;
end;

procedure TFm_DestValue.FormShow(Sender: TObject);
begin
  if FStart then
    begin
      FStart := not FStart;
      SqlOpen;
    end;
end;

procedure TFm_DestValue.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Query1.Close;
  Action := caFree;
end;

procedure TFm_DestValue.Pa_TitleMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if ssleft in shift then
     begin
       Releasecapture;
       Self.Perform(WM_SYSCOMMAND, $F012, 0);
     end;
end;

procedure TFm_DestValue.Sb_CloseClick(Sender: TObject);
begin
  FCloseYn := True;
  Edit.PopupForm.ClosePopup(False);
end;

procedure TFm_DestValue.Sb_OkClick(Sender: TObject);
begin
  Fempno     := Query1.FieldByName('empno').AsString;
  Fkorname   := Query1.FieldByName('korname').AsString;
  Forgnum    := Query1.FieldByName('orgnum').AsString;
  Fdeptcode  := Query1.FieldByName('deptcode').AsString;
  Fdeptname  := Query1.FieldByName('deptname').AsString;
  Fpaycl     := Query1.FieldByName('paycl').AsString;
  Fpayclname := Query1.FieldByName('payclname').AsString;
  Fpayra     := Query1.FieldByName('payra').AsString;
  Fpayraname := Query1.FieldByName('payraname').AsString;
  Fjobgun    := Query1.FieldByName('jobgun').AsString;
  Fjobgunname:= Query1.FieldByName('jobgunname').AsString;
  Fpayrayn   := Query1.FieldByName('payrayn').AsString;

  FCloseYn := False;
  Edit.PopupForm.ClosePopup(False);
end;

procedure TFm_DestValue.SqlOpen;
var
  i       : integer;
  Field   : TField;
  sEmpno, sKorname, SqlText : string;
begin
  if trim(Edit_see.text) = '' then
  begin
    sEmpno   := Edit_see.text+'%';
    sKorname := Edit_see.text+'%';
  end
  else
  begin
    sEmpno   := Edit_see.text+'%';
    sKorname := '%'+Edit_see.text+'%';
  end;

  SqlText :=
      'SELECT  '+
      ' nvl(        empno      ,'' '') empno     , '+
      ' nvl(        korname    ,'' '') korname   , '+
      ' nvl(        a.orgnum   ,'' '') orgnum    , '+
      ' nvl(        a.deptcode ,'' '') deptcode  , '+
      ' nvl(        d.deptname ,'' '') deptname  , '+
      ' nvl(        paycl      ,'' '') paycl     , '+
      ' nvl(        c.codename ,'' '') payclname , '+
      ' nvl(        payra      ,'' '') payra     , '+
      ' nvl(        b.codename ,'' '') payraname , '+
      ' nvl(        jobgun     ,'' '') jobgun    , '+
      ' nvl(        e.codename ,'' '') jobgunname, '+
      ' nvl(        payrayn    ,'' '') payrayn     '+
      'FROM  pycdept d, pyccode e, pyccode c, pyccode b, pimpmas a  '+
      'WHERE a.orgnum = d.orgnum and a.deptcode = d.deptcode '+
      '  AND a.payra = b.codeno and b.codeid = ''I113''      '+
      '  AND a.paycl = c.codeno and c.codeid = ''I112''      '+
      '  AND a.jobgun= e.codeno and e.codeid = ''I115''      '+
      '  and a.pstate < ''80''                               '+
Format('  and (a.empno like ''%s'' or a.korname like ''%s'')  ',[sEmpno, sKorname])+
      'ORDER BY   a.empno                                    ';

  with Query1 do
  begin
      Close;
      ClearFieldInfo;
      AddField('EMPNO'        , ftString,  4 );
      AddField('KORNAME'      , ftString,  12);
      AddField('ORGNUM'       , ftString,  3 );
      AddField('DEPTCODE'     , ftString,  6 );
      AddField('DEPTNAME'     , ftString,  60);
      AddField('PAYCL'        , ftString,  3 );
      AddField('PAYCLNAME'    , ftString,  20);
      AddField('PAYRA'        , ftString,  3 );
      AddField('PAYRANAME'    , ftString,  20);
      AddField('JOBGUN'       , ftString,  2 );
      AddField('JOBGUNNAME'   , ftString,  20);
      AddField('PAYRAYN'      , ftString,  1 );

      Sql.Clear;
//      ServiceName := 'SPIT2030S4';
      Sql.Text := Sqltext;
      ServiceName := 'PIT2030A_SEL4';
      Open;
    end;

    for i := 0 to Query1.FieldCount - 1 do
      begin
        Field := Query1.Fields[i];
        Field.Visible := False;
        case Field.Index of
            0 : begin
                  Field.Visible      := True;
                  Field.DisplayWidth := 8;
                  Field.DisplayLabel := '사번';
                end;
            1 : begin
                  Field.Visible      := True;
                  Field.DisplayWidth := 12;
                  Field.DisplayLabel := '성명';
                end;
            8 : begin
                  Field.Visible      := True;
                  Field.DisplayWidth := 8;
                  Field.DisplayLabel := '직책';
                end;
            4 : begin
                  Field.Visible      := True;
                  Field.DisplayWidth := 33;
                  Field.DisplayLabel := '부서명';
                end;
        end;
    end;
//    Width := GetDisplayWidth(Grid1.Canvas,Grid1.Font,98) + 36;
  Grid1.SetFocus;
end;

procedure TFm_DestValue.Grid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Chr(13) then
    begin
       Key := #0;
       Sb_OkClick(Sender);
    end;
end;

procedure TFm_DestValue.Edit_seeKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    SqlOpen ;
  end;
end;

procedure TFm_DestValue.Sb_runClick(Sender: TObject);
begin
  SqlOpen ;
end;

procedure TFm_DestValue.Grid1DblClick(Sender: TObject);
begin
  Sb_OkClick(Sender);
end;

end.
