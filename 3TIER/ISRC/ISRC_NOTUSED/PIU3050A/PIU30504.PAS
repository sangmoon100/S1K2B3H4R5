unit PIU30504;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, pegradpanl, StdCtrls, Mask, Grids, DBGrids, Db, DBTables, pegraphic, DBClient, MIDAScon,
  Tmax_DataSetText, OnDBGrid, OnFocusButton, ComCtrls, OnShapeLabel,
  OnGrDBGrid, OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl,
  OnPopupEdit, OnEditMemo, OnScheme;

type
  TFm_returnform = class(TForm)
    Panel2: TPanel;
    Sb_Close: TOnFocusButton;
    l_returnsayu: TOnMemo;
    SF_Main: TOnSchemeForm;
    L_empno: TOnShapeLabel;
    L_korname: TOnShapeLabel;
    L_payraname: TOnShapeLabel;
    L_deptname: TOnShapeLabel;
    L_bigo: TOnShapeLabel;
    bt_confirm: TOnFocusButton;
    procedure FormCreate(Sender: TObject);
    procedure Sb_CloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FOrgDept      : string;
    Fempno        : string;
    Fkorname      : string;
    FConyn        : string;
    FFinyn        : string;
    SqlText       : string;
  public
    GsEmpno, GsKorname, GsPayraname, GsDeptname, Gsbigo: String;
    GsHopesayu: WideString;
  end;

var
  Fm_returnform : TFm_returnform;

implementation
uses PIU30501;
{$R *.DFM}

procedure TFm_returnform.FormCreate(Sender: TObject);
begin
    close;
end;

procedure TFm_returnform.Sb_CloseClick(Sender: TObject);
begin
 //    Edit.PopupForm.ClosePopup(False);
 close;
end;

procedure TFm_returnform.FormShow(Sender: TObject);
begin  
    L_Empno.ValueCaption     := GsEmpno;
    L_Korname.ValueCaption   := GsKorname;
    L_Payraname.ValueCaption := GsPayraname;
    L_Deptname.ValueCaption  := GsDeptname;
    L_Bigo.ValueCaption      := Gsbigo;
end;

end.
