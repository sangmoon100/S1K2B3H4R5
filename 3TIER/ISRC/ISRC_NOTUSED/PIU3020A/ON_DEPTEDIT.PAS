unit On_DeptEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Tmax_DataSetText, OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl,
  StdCtrls, OnFocusButton, ExtCtrls, Grids, DBGrids, OnGrDBGrid,
  Tmax_session, OnPopupEdit, OnEditCombo;

type
  TFM_DeptEdit = class(TForm)
    PA_buttons: TPanel;
    FB_ok: TOnFocusButton;
    FB_cancel: TOnFocusButton;
    PA_search: TPanel;
    BE_key: TOnButtonEdit;
    QR_grid: TTMaxDataSet;
    DataSource1: TDataSource;
    PA_grid: TPanel;
    GR_1: TOnGrDbGrid;
    procedure FB_okClick(Sender: TObject);
    procedure FB_cancelClick(Sender: TObject);
    procedure GR_1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BE_keyButtonClick(Sender: TObject; ButtonIndex: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
    FG_ORGNUM      : String;
    FG_DEPTCODE    : String;
    FG_DEPTNAME    : String;
    FG_DEPTGUBUN   : String;
    FG_GUBUNNAME   : String;
    FG_SECTCODE    : String;
    FG_FIELDCODE   : String;

    Edit           : TOnWinPopupEdit;
    Insa_Session   : TTMaxSession;

    procedure PL_Init;
  end;

implementation

{$R *.DFM}

procedure TFM_DeptEdit.PL_Init;
var  i : integer;
begin
     QR_grid.Session := Insa_Session;
     with QR_grid do
     begin
          Close;
          //ServiceName := 'HINSA_select';
          //ClearFieldInfo;
          //AddField('orgnum'        , ftString, 100);
          //AddField('deptcode'      , ftString, 100);
          //AddField('deptname'      , ftString, 100);
          //AddField('deptgubun'     , ftString, 100);
          //AddField('gubunName'     , ftString, 100);
          //ServiceName := 'HINSA_pycdept';
          ClearFieldInfo;
          AddField('deptcode'  , ftString,  6);
          AddField('deptname'  , ftString, 60);
          AddField('gubunname' , ftString, 30);
          AddField('deptgubun' , ftString,  3);
          AddField('orgnum'    , ftString,  6);
          AddField('fieldcode' , ftString,  6);
          AddField('Sectcode'  , ftString,  3);
          ClearParamInfo;
          Sql.Clear;
          
          Sql.Text := 'SELECT deptcode, deptname, (select codename from pyccode             '+
                      '                             where codeid = ''I804''                 '+
                      '                               and codeno = a.deptgubun) gubunname,  '+
                      '       deptgubun, orgnum, fieldcode, Sectcode                        '+
                      '  FROM pycdept   a                                                   '+
                      ' WHERE orgnum   like  '''+FG_ORGNUM+'''||''%''                       '+
                      '   AND existon   =     ''1''                                         '+
                      '   AND ((deptlevel  =  ''D0'')  Or                                   '+
                      '        ((deptlevel =  ''E0'') and (substr(deptcode,5,1) > ''1'')))  '+
                      '   and deptcode  <     ''Y''                                         '+
                      '   AND chanmode  <>    ''3''                                         '+
                      '   AND (deptcode LIKE ''%''||'''+BE_key.Text+'''||''%'' OR           '+
                      '        deptname LIKE ''%''||'''+BE_key.Text+'''||''%'')             '+
                      ' ORDER by orgnum desc, deptcode                                      ';
          Open;

          if  not Locate('orgnum,deptname',VarArrayOf([FG_ORGNUM,FG_DEPTCODE]),[loPartialKey]) then  First;
     end;
end;

procedure TFM_DeptEdit.FB_okClick(Sender: TObject);
begin
     FG_ORGNUM      := QR_grid.FieldByName('orgnum').AsString;
     FG_DEPTCODE    := QR_grid.FieldByName('deptcode').AsString;
     FG_DEPTNAME    := QR_grid.FieldByName('deptname').AsString;
     FG_DEPTGUBUN   := QR_grid.FieldByName('deptgubun').AsString;
     FG_GUBUNNAME   := QR_grid.FieldByName('gubunname').AsString;
     FG_SECTCODE    := QR_grid.FieldByName('Sectcode').AsString;
     FG_FIELDCODE   := QR_grid.FieldByName('fieldcode').AsString;
     QR_grid.Close;
     Edit.PopupForm.ClosePopup(True);
end;

procedure TFM_DeptEdit.FB_cancelClick(Sender: TObject);
begin
   //FG_ORGNUM      := '';
     FG_DEPTCODE    := '';
     FG_DEPTNAME    := '';
     QR_grid.Close;
     Edit.PopupForm.ClosePopup(False);
end;

procedure TFM_DeptEdit.GR_1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if  Key = VK_RETURN then
     begin
          if  Tcomponent(Sender).Name = 'GR_1' then
               FB_okClick(Sender);
          if  Tcomponent(Sender).Name = 'BE_key' then
          begin
               PL_Init;
               GR_1.SetFocus;
          end;
          Key := 0;
     end;

     if  Key = VK_ESCAPE then
     begin
          FB_cancelClick(Sender);
          Key := 0;
     end;
end;

procedure TFM_DeptEdit.BE_keyButtonClick(Sender: TObject; ButtonIndex: Integer);
begin
     PL_Init;
     GR_1.SetFocus;
end;

end.
