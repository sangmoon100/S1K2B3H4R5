unit pvb1010a3;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Tmax_DataSetText, Tmax_session, OnInsaCommon, OnEditBaseCtrl,
  OnEditStdCtrl, OnEditBtnCtrl, OnEditMdate, OnLineLabel, StdCtrls,
  OnEditCombo, ImgList, OnDBGrid, OnSkinBtn, Db,
  OnCalendarUtil, TmaxFunc;

type
  TFM_SubForm2 = class(TForm)
    PA_work: TPanel;
    Shape7: TShape;
    OnSectionLabel1: TOnSectionLabel;
    ED_off_datefr: TOnDateEdit;
    Label1: TLabel;
    ED_v_infoyn: TOnComboEdit;
    ImageList1: TImageList;
    ED_off_dateto: TOnDateEdit;
    OnSectionLabel2: TOnSectionLabel;
    Shape1: TShape;
    Grid1: TOnDBGrid;
    BT_find: TOnSkinButton;
    QR_book: TTMaxDataSet;
    DataSource1: TDataSource;
    Label2: TLabel;
    Shape2: TShape;
    ED_v_company: TOnEdit;
    Label3: TLabel;
    procedure ED_v_infoynGetImageIndex(Sender: TObject;
      const ItemIndex: Integer; var idx: Integer);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BT_findClick(Sender: TObject);
    procedure Grid1DblClick(Sender: TObject);
    procedure ED_v_infoynKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure PL_Select_bookvisit;
  public
    { Public declarations }
    Insa_Session : TTMaxSession;
    FG_empno     : String;
    FG_Date      : String;

    procedure PL_InitForm(AGubun : Boolean);
  end;

var
  FM_SubForm2: TFM_SubForm2;

implementation

uses pvb1010a1, pvb1010a2;

{$R *.DFM}

procedure TFM_SubForm2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  QR_book.Close;
  CanClose := True;
end;

procedure TFM_SubForm2.ED_v_infoynGetImageIndex(Sender: TObject; const ItemIndex: Integer; var idx: Integer);
begin
  idx := 0;
end;

procedure TFM_SubForm2.PL_InitForm(AGubun : Boolean);
begin
  FM_Tmax           := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := Insa_Session;
  FG_Date           := FM_Tmax.GetData('sysdate','','');
  ///////////////////////////////////////////////////////////////////////

  QR_book.Session := Insa_Session;
  if AGubun then
    begin
      ED_off_datefr.NoFormatDate := GetDateMinus(Copy(FG_Date,1,8),-30);
      ED_off_dateto.NoFormatDate := Copy(FG_Date,1,8);

      PL_Select_bookvisit;
    end;
end;

procedure TFM_SubForm2.PL_Select_bookvisit;
begin
  with QR_book do
    begin
      Close;
      ServiceName := 'PVB1010A_lbook';
      Sql.Text := 'SELECT                 '+
                  '    A.v_id        ,    '+
                  '    (A.off_date||SUBSTR(A.off_time,1,4)), '+
                  '    A.off_empno   ,    '+
                  '    (A.sec_empno||''-''||C.korname),  '+
                  '    A.placecode   ,    '+
                  '    (A.off_indatefr||A.off_intimefr), '+
                  '    (A.off_indateto||A.off_intimeto), '+
                  '    A.v_pcid      ,    '+
                  '    B.v_pcname    ,    '+
                  '    DECODE(A.v_pcid,''9999'',A.v_propose,B.v_pcname),  '+
                  '    A.v_infoyn         '+
                  '  FROM pvbookvisit A, pvprolist B, pvpimpmas C  ';
      if ED_v_company.Text <> '' then
        begin
          Sql.Text := Sql.Text + Format(', (SELECT DISTINCT v_id FROM pvvisitlist A, pvperson B '+
                                        '    WHERE A.v_pid = B.v_pid          '+
                                        '      AND B.v_company LIKE ''%s'') D ',['%'+ED_v_company.Text+'%']);
        end;

      Sql.Text := Sql.Text +
                  Format(' WHERE (A.off_date >= ''%s'' AND A.off_date <= ''%s'') '+
                         '   AND A.off_empno = ''%s''      '+
                         '   AND A.v_infoyn  = ''%s''      '+
                         '   AND A.v_pcid    = B.v_pcid(+) '+
                         '   AND A.sec_empno = C.empno(+)  ',
                         [ED_off_datefr.NoFormatDate, ED_off_dateto.NoFormatDate,
                          FG_empno, ED_v_infoyn.Text]);
      if ED_v_company.Text <> '' then
        Sql.Text := Sql.Text +' AND A.v_id = D.v_id ';
      Sql.Text := Sql.Text + ' ORDER BY A.off_date DESC, A.off_time DESC, A.off_indatefr DESC ';
      Open;
      FieldByName('off_date').EditMask     := '0000년00월00일 00:00;0;';
      FieldByName('off_indatefr').EditMask := '0000년00월00일 00:00;0;';
      FieldByName('off_indateto').EditMask := '0000년00월00일 00:00;0;';
    end;
end;

procedure TFM_SubForm2.BT_findClick(Sender: TObject);
begin
  PL_Select_bookvisit;
end;

procedure TFM_SubForm2.Grid1DblClick(Sender: TObject);
begin
  if FM_SubForm1 = nil then
    Application.CreateForm(TFM_SubForm1, FM_SubForm1);
  FM_SubForm1.Insa_Session := Insa_Session;
  FM_SubForm1.FG_empno     := FG_empno;
  FM_SubForm1.FG_ins       := False;
  FM_SubForm1.FG_off_empno := QR_book.FieldByName('off_empno').AsString;  
  FM_SubForm1.FG_v_id      := QR_book.FieldByName('v_id').AsString;
  FM_SubForm1.FG_infoyn    := QR_book.FieldByName('v_infoyn').AsString;
  FM_PVB1010A.PL_ShowPanel(FM_SubForm1.PA_Work);
  Application.ProcessMessages;

  FM_PVB1010A.SB_Tab1.BtnDown  := True;
  FM_PVB1010A.SB_Tab2.BtnDown  := False;
  FM_PVB1010A.BT_find.Enabled  := False;
  FM_PVB1010A.BT_copy.Enabled  := False;  
  FM_SubForm1.PL_InitForm;
end;

procedure TFM_SubForm2.ED_v_infoynKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    begin
      BT_findClick(Sender);
      Key := 0;
    end;
end;

end.
