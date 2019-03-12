unit Pit203030;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  peextcombo, peoutlookbtn, ExtCtrls, StdCtrls, Mask, pebtnedit,
  PeJeonLabel, OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl, db,
  OnTmaxPersonEdit, OnShapeLabel, OnTmaxCodeEdit, OnTmaxDeptEdit,
  OnFocusButton, OnEditCombo, pegradpanl, OnEditMemo, Grids, DBGrids,
  OnGrDBGrid;
//
type
  TFm_SubForm3 = class(TForm)
    Panel1: TPanel;
    From: TLabel;
    MoniGrid: TOnGrDbGrid;
    Shape1: TShape;
    Label1: TLabel;
    DataSource1: TDataSource;
    Shape2: TShape;
    Label2: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure data_display;
    procedure MoniGridDblClick(Sender: TObject);
  private
    { Private declarations }
    Start    : Boolean;
  public
    { Public declarations }
    SelForm       : TForm;
  end;

var
  Fm_SubForm3: TFm_SubForm3;

implementation

uses
  pit203000, pit203011, pit203020;

{$R *.DFM}

procedure TFm_SubForm3.FormCreate(Sender: TObject);
begin
  Start := True;
end;

procedure TFm_SubForm3.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFm_SubForm3.FormShow(Sender: TObject);
begin
  if Start then
  begin
    Start := not Start;
    Application.ProcessMessages;
    data_display;
  end;
end;

procedure TFm_SubForm3.data_display;
var
  Tem : String;
  i : Integer;
  Field: TField;
begin
  Tem  := 'select  '+
          '  nvl(a.orgnum,    '' '') orgnum,                          '+
          '  nvl(a.deptcode,  '' '') deptcode,                        '+
          '  nvl(b.deptname,  '' '') deptname,                        '+
          '  nvl(a.monum   ,  '' '') monum,                           '+
          '  nvl(to_char(a.collectcnt), ''0''  ) collectcnt,          '+
          '  nvl(to_char(a.supplecnt),  ''0'' ) supplecnt,            '+
          '  nvl(to_char(a.collectcnt - a.supplecnt), ''0'') diffcnt, '+
          '  nvl(a.dutydesc,  '' '') dutydesc,                        '+
          '  nvl(a.condition, '' '') condition,                       '+
          '  nvl(a.repempno,  '' '') repempno,                        '+
          '  nvl(a.repyn,     '' '') repyn,                           '+
          '  nvl(a.conempno,  '' '') conempno,                        '+
          '  nvl(a.conyn,     '' '') conyn,                           '+
          '  nvl(a.closeyn,   '' '') closeyn,                         '+
          '  nvl(to_char(a.closedate),  ''0''  ) closedate,           '+
          '  nvl(a.writetime, '' '') writetime,                       '+
          '  nvl(a.writeemp,  '' '') writeemp                         '+
          'from pischndept a, pycdept b                               '+
   format('where a.orgnum = ''%s''                                    '+
          '  and a.orgnum = b.orgnum                                  '+
          '  and a.deptcode  = b.deptcode                             '+
          '  and a.closeyn   = ''N''                                  '+
          '  and a.conyn     = ''Y''                                  '+
          '  and a.monum     = ''%s''                                 '+
          'order by  a.orgnum desc, a.deptcode                        ',
          [MainForm.pOrgnum, MainForm.gsMonum]);

  With MainForm.Tcollect do
  begin
    Close;
    ClearFieldInfo;
    AddField('조직차수'     , ftString,  3  );
    AddField('부서코드'     , ftString,  6  );
    AddField('부서명'       , ftString,  60 );
    AddField('모집차수'     , ftString,  8  );
    AddField('모집인원'     , ftString,  40 );
    AddField('충원인원'     , ftString,  40 );
    AddField('미충원인원'   , ftString,  40 );
    AddField('수행예정직무' , ftString,  600);
    AddField('자격요건'     , ftString,  600);
    AddField('상신사번'     , ftString,  4  );
    AddField('상신여부'     , ftString,  1  );
    AddField('결재사번'     , ftString,  4  );
    AddField('결재여부'     , ftString,  1  );
    AddField('모집마감여부' , ftString,  1  );
    AddField('모집마감일'   , ftString,  40 );
    AddField('WRITETIME'    , ftString,  15 );
    AddField('WRITEEMP'     , ftString,  4  );
    Sql.Clear;
    Sql.Text := Tem;
//    edit1.Text := Sql.Text;
    ServiceName := 'PIT2030A_SEL2';
    Open;

//      TFunc_TQueryAuto('SPIT2030S2', Tem, MainForm.TTXcollect);
    for i := 0 to FieldCount - 1 do
    begin
      Field := Fields[i];
      Field.Alignment := taCenter;
      case Field.Index of

         0 : Field.Visible := False;      // orgnum
         1 : Field.Visible := False;      // deptcode
         2 : begin
               Field.DisplayWidth := 75;//55;    //DEPTNAME
               Field.Alignment := taLeftJustify;
             end;
         3 : begin
               Field.DisplayWidth := 30;//20;               //monum
               Field.Alignment := taCenter;
//               Field.EditMask := '9999/99/99;0;_' ;    //regdate
             end;
         4 : Field.DisplayWidth := 15;    //COLLECTCNT
//         5 : Field.DisplayWidth := 15;    // SUPPLECNT'
//         6 : Field.DisplayWidth := 15;    //diff
         5 : Field.Visible := False;      // SUPPLECNT'
         6 : Field.Visible := False;      //diff
         7 : Field.Visible := False;      //DUTYDESC'
         8 : Field.Visible := False;      //CONDITION'
         9 : Field.Visible := False;      //REPEMPNO'
        10 : Field.Visible := False;      //REPYN'
        11 : Field.Visible := False;      //CONEMPNO'
        12 : Field.Visible := False;      //CONYN'
        13 : Field.Visible := False;      //CLOSEYN'
        14 : Field.Visible := False;      //CLOSEDATE'
        15 : Field.Visible := False;      //WRITEEMP'
        16 : Field.Visible := False;      //WRITETIME'
      end;
    end;

  end;
end;

procedure TFm_SubForm3.MoniGridDblClick(Sender: TObject);
var
  sDeptcode: String;
begin
  Try
    SelForm := TFm_SubForm2.Create(nil);

    sDeptcode := MainForm.Tcollect.FieldByName('부서코드').Asstring;

    if Assigned(SelForm) then
    begin
      SelForm.Caption     := '사내인재 모집내역';
      SelForm.Tag         := 1;
      SelForm.Position    := poScreenCenter;
      SelForm.BorderStyle := bsSingle;
      SelForm.ShowModal;
    end;

    if MainForm.gbChanged = True then
    begin
      MainForm.Tcollect.DisableControls;
      data_display;
      MainForm.Tcollect.Locate('부서코드', sDeptcode, [loPartialKey]);
      MainForm.Tcollect.EnableControls;
    end;

  Finally
      SelForm.Free;
  End;
end;

end.
