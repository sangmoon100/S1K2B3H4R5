unit pka4058a2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, pegradpanl, StdCtrls, Mask, Grids, DBGrids, Db, DBTables, pegraphic, DBClient, MIDAScon,
  Tmax_DataSetText, OnDBGrid, OnFocusButton, ComCtrls, OnShapeLabel,
  OnGrDBGrid, OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl,
  OnPopupEdit, OnEditMemo, OnScheme;

type
  TFm_cancelform = class(TForm)
    Panel2: TPanel;
    Sb_Close: TOnFocusButton;
    l_sayu: TOnMemo;
    SF_Main: TOnSchemeForm;
    Sb_Confirm: TOnFocusButton;
    procedure FormCreate(Sender: TObject);
    procedure Sb_CloseClick(Sender: TObject);
    procedure Sb_ConfirmClick(Sender: TObject);
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
  Fm_cancelform : TFm_cancelform;

implementation
uses pka4058a0;
{$R *.DFM}

procedure TFm_cancelform.FormCreate(Sender: TObject);
begin
//    close;
end;

procedure TFm_cancelform.Sb_CloseClick(Sender: TObject);
begin
    FM_Main.cancelsayu := '';
    close;
end;

procedure TFm_cancelform.Sb_ConfirmClick(Sender: TObject);
begin
    FM_Main.cancelsayu := FM_Main.RemoveSpecialChar(l_sayu.text);
    //memo1.text := FM_Main.cancelsayu;
    close;
end;


end.
