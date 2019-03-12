unit pvb1010a2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Tmax_DataSetText, Tmax_session, OnInsaCommon, OnLineLabel,
  OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl, OnEditMdate, OnShapeLabel,
  OnSkinBtn, OnTmaxPersonEdit, OnPopupEdit, OnEditMemo, OnDBGrid, StdCtrls,
  OnFocusButton, OnTmaxDeptEdit, Db, On_pvprolist, On_pvperson,
  Tmax_DmlSet, OnStringUtils, OnEditCombo, ImgList, Grids, DBGrids, 
  OnTmaxCodeEdit, TmaxFunc, OnMemDataset;

type
  TFM_SubForm1 = class(TForm)
    PA_work: TPanel;
    OnSectionLabel1: TOnSectionLabel;
    Shape7: TShape;
    ED_off_date: TOnDateEdit;
    ED_off_deptcode: TOnShapeLabel;
    ED_off_empno: TOnShapeLabel;
    ED_off_jobplace: TOnShapeLabel;
    ED_off_payra: TOnShapeLabel;
    BT_mail: TOnSkinButton;
    ED_sec_empno: TTMaxPersonPopupEdit;
    ED_sec_payra: TOnShapeLabel;
    ED_sec_deptcode: TOnShapeLabel;
    ED_off_tel1: TOnEdit;
    ED_off_tel2: TOnEdit;
    Shape1: TShape;
    OnSectionLabel2: TOnSectionLabel;
    ED_off_indatefr: TOnDateEdit;
    ED_off_indateto: TOnDateEdit;
    Shape2: TShape;
    ED_v_pcid: TOnWinPopupEdit;
    ED_v_content: TOnMemo;
    Grid1: TOnDBGrid;
    OnShapeLabel4: TOnShapeLabel;
    ED_floor: TOnEdit;
    ED_off_deptlist: TTMaxDeptPopupEdit;
    Shape3: TShape;
    OnSectionLabel3: TOnSectionLabel;
    BT_ins1: TOnSkinButton;
    BT_del1: TOnSkinButton;
    OnShapeLabel5: TOnShapeLabel;
    Grid2: TOnDBGrid;
    BT_ins2: TOnSkinButton;
    BT_del2: TOnSkinButton;
    ED_v_korname: TOnWinPopupEdit;
    ED_off_time: TOnMaskEdit;
    ED_v_propose: TOnEdit;
    Shape4: TShape;
    OnSectionLabel4: TOnSectionLabel;
    ED_v_juminid: TOnShapeLabel;
    ED_v_company: TOnShapeLabel;
    DataSource1: TDataSource;
    QR_com: TTMaxDataSet;
    Shape5: TShape;
    Label1: TLabel;
    QR_dml: TTMaxDML;
    QR_book: TTMaxDataSet;
    QR_vlist: TTMaxDataSet;
    QR_dlist: TTMaxDataSet;
    ED_off_intimefr1: TOnComboEdit;
    ImageList1: TImageList;
    ED_off_intimefr2: TOnComboEdit;
    Label3: TLabel;
    Label4: TLabel;
    ED_off_intimeto1: TOnComboEdit;
    Label5: TLabel;
    ED_off_intimeto2: TOnComboEdit;
    Label6: TLabel;
    QR_Batch: TTMaxDataSet;
    PA_place: TPanel;
    SB_mail: TOnSkinButton;
    ED_jobplace: TTMaxCodePopupEdit;
    BT_pclose: TOnSkinButton;
    Label2: TLabel;
    Label7: TLabel;
    MD_Data: TOnMemData;
    MD_Datachk: TStringField;
    DataSource2: TDataSource;
    MD_Datav_juminid: TStringField;
    MD_Datav_korname: TStringField;
    MD_Datav_infoyn: TStringField;
    MD_Datav_id: TStringField;
    MD_Datav_pid: TStringField;
    MD_Datav_company: TStringField;
    OnSectionLabel5: TOnSectionLabel;
    ED_off_jobplace1: TTMaxCodePopupEdit;
    procedure ED_sec_empnoReadEnded(Sender: TObject);
    procedure ED_v_pcidInitPopup(Sender: TObject);
    procedure ED_v_pcidCloseUp(Sender: TObject; var Text: String; var Accept: Boolean);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ED_v_kornameInitPopup(Sender: TObject);
    procedure ED_v_kornameCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure BT_ins1Click(Sender: TObject);
    procedure BT_del1Click(Sender: TObject);
    procedure BT_ins2Click(Sender: TObject);
    procedure BT_del2Click(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure SB_mailClick(Sender: TObject);
    procedure OncomboGetImageIndex(Sender: TObject;
      const ItemIndex: Integer; var idx: Integer);
    procedure ED_off_indatefrDateChange(Sender: TObject);
    procedure BT_mailClick(Sender: TObject);
    procedure BT_pcloseClick(Sender: TObject);
    procedure Grid2CellClick(Sender: TObject; const ACell: TOnJCell);
    procedure DataSource2DataChange(Sender: TObject; Field: TField);
    procedure ED_off_indatetoDateChange(Sender: TObject);
    procedure ED_off_indatetoExit(Sender: TObject);
  private
    { Private declarations }
    FM_pro : TFM_pvprolist;
    FM_per : TFM_perlist;

    function  PL_Get_vid : String;
    function  PL_Get_pcname(AKey : String) : String;
    function  PL_Select_visitlist(AKey : String) : Boolean;
    function  PL_Select_deptlist(AKey : String) : Boolean;
    procedure PL_Get_empno;
    procedure PL_pvbook_FieldSet(AGubun : String = '저장');
    procedure PL_pvvisit_FieldSet(AGubun : String = '추가');
    procedure PL_pvdept_FieldSet(AGubun : String = '추가');
    function  Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String) : Boolean; //2007.08.01.dsa2000
  public
    { Public declarations }
    Insa_Session : TTMaxSession;
    FG_v_id      : String;
    FG_empno     : String;
    FG_off_empno : String;
    FG_korname   : String;
    FG_Ins       : Boolean;
    FG_infoyn    : String;
    FG_count     : Integer;
    FG_detail1   : Boolean;
    FG_detail2   : Boolean;
    FG_Date      : String;
        
    FG_Mailempno   : String;
    FG_MailKorname : String;

    procedure PL_InitForm;
    function  PL_Select_bookvisit(AKey : String) : Boolean;
    function  PL_Detail_Exists : Boolean;
    procedure PL_VisitInsert;
    procedure PL_VisitDelete;
    function  PL_VisitSaveCheck : Boolean;
    procedure PL_VisitSave(AGubun : String);
    function  PL_Get_jobplacename(AKey : String) : String;
  end;

var
  FM_SubForm1: TFM_SubForm1;

implementation

uses pvb1010a1;

{$R *.DFM}

procedure TFM_SubForm1.PL_InitForm;
begin
  QR_com.Session          := Insa_Session;
  QR_dml.Session          := Insa_Session;
  QR_book.Session         := Insa_Session;
  QR_vlist.Session        := Insa_Session;
  QR_dlist.Session        := Insa_Session;
  QR_batch.Session        := Insa_Session;  
  ED_sec_empno.Session    := Insa_Session;
  ED_off_deptlist.Session := Insa_Session;
  ED_jobplace.Session     := Insa_Session;
  ED_off_jobplace1.Session:= Insa_Session;

  if FG_Ins then
    begin
      PL_VisitInsert;
    end
 else
   begin
      FM_PVB1010A.SB_Help.Panels[1].Text := '방문자 예약정보를 읽고 있는 중입니다... 잠시만 기다리세요...';
      FM_PVB1010A.SB_Help.Perform(WM_PAINT,0,0);
      PL_Get_empno;
      ED_sec_empno.PL_get_singledata;


      ED_v_propose.Enabled := True;
      PL_Select_bookvisit(FG_v_id);

      if FG_infoyn = '미방문' then
        begin
          FM_PVB1010A.BT_new.Enabled    := True;
          FM_PVB1010A.BT_Save.Enabled   := True;
          FM_PVB1010A.BT_Cancel.Enabled := True;
          //jissi 버튼 비활성화
          BT_ins1.Enabled := False;
          BT_del1.Enabled := False;
          BT_ins2.Enabled := False;
          BT_del2.Enabled := False;
        end
      else
        begin
          FM_PVB1010A.BT_new.Enabled    := True;
          FM_PVB1010A.BT_Save.Enabled   := False;
          FM_PVB1010A.BT_Cancel.Enabled := False;
          BT_ins1.Enabled := False;
          BT_del1.Enabled := False;
          BT_ins2.Enabled := False;
          BT_del2.Enabled := False;
        end;

      if ED_v_propose.Text = '' then
        ED_v_propose.Enabled := False;

     PL_Select_deptlist(FG_v_id);
     PL_Select_visitlist(FG_v_id);
     FM_PVB1010A.SB_Help.Panels[1].Text := '';
     ED_off_deptlist.SetFocus;
   end;
end;

procedure TFM_SubForm1.FormCreate(Sender: TObject);
begin
  FG_Ins     := False;
  FG_count   := 0;
  FG_infoyn  := '미방문';
  FG_detail1 := False;
  FG_detail2 := False;
  Application.CreateForm(TFM_pvprolist, FM_pro);
  Application.CreateForm(TFM_perlist, FM_per);
end;

procedure TFM_SubForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  FM_pro.Free;
  FM_per.Free;
  CanClose := True;
end;

procedure TFM_SubForm1.ED_sec_empnoReadEnded(Sender: TObject);
begin
  ED_sec_payra.ValueCaption    := ED_sec_empno.payraname;
  ED_sec_deptcode.ValueCaption := ED_sec_empno.deptname;
  if FG_ins then
    begin
      ED_off_deptlist.Text := ED_sec_empno.deptcode;
      ED_off_deptlist.PL_get_singledata;
    end;
end;

procedure TFM_SubForm1.ED_v_pcidInitPopup(Sender: TObject);
begin
  FM_pro.Insa_Session  := Insa_Session;
  FM_per.BE_key.Text   := '';
  TOnWinPopupEdit(Sender).PopupControl := FM_pro;
  FM_pro.Edit     := TOnWinPopupEdit(Sender);
  FM_pro.PL_Init;
end;

procedure TFM_SubForm1.ED_v_pcidCloseUp(Sender: TObject; var Text: String; var Accept: Boolean);
var
  FL_Text : String;
begin
  FL_Text := TOnWinPopupEdit(Sender).Text;
  if Accept then
    begin
      TOnWinPopupEdit(Sender).Text := FM_pro.FG_v_pcname;
      TOnWinPopupEdit(Sender).Hint := FM_pro.FG_v_pcid;
      Accept := False;
    end;
  TOnWinPopupEdit(Sender).PopupControl := nil;
  if TOnWinPopupEdit(Sender).Hint = '9999' then
    ED_v_propose.Enabled := True
  else
    ED_v_propose.Enabled := False;
end;

procedure TFM_SubForm1.ED_v_kornameInitPopup(Sender: TObject);
begin
  FM_per.Insa_Session  := Insa_Session;
  FM_per.FG_empno      := FG_empno;
  FM_per.BE_key.Text   := '';
  TOnWinPopupEdit(Sender).PopupControl := FM_per;
  FM_per.Edit     := TOnWinPopupEdit(Sender);
  FM_per.PL_Init;
end;

procedure TFM_SubForm1.ED_v_kornameCloseUp(Sender: TObject;
  var Text: String; var Accept: Boolean);
var
  FL_Text : String;
begin
  FL_Text := TOnWinPopupEdit(Sender).Text;
  if Accept then
    begin
      TOnWinPopupEdit(Sender).Text := FM_per.FG_v_korname;
      TOnWinPopupEdit(Sender).Hint := FM_per.FG_v_pid;
      ED_v_juminid.ValueCaption    := FM_per.FG_v_juminid;
      ED_v_company.ValueCaption    := FM_per.FG_v_company;
      Accept := False;
    end;
  TOnWinPopupEdit(Sender).PopupControl := nil;
end;

procedure TFM_SubForm1.PL_pvbook_FieldSet(AGubun : String = '저장');
begin
  FM_Tmax           := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := Insa_Session;
  FG_Date           := FM_Tmax.GetData('sysdate','','');
  ///////////////////////////////////////////////////////////////////////

  with QR_dml do
    begin
      TableName   := 'pvbookvisit';
      ServiceName := 'PVB1010A_dml';
      ClearFieldInfo;
      DataSet.ClearParamInfo;

      DataSet.AddParam('gubun',4 , AGubun);
      DataSet.AddParam('v_id', 15, FG_v_id);

      AddField('v_id'          ,FG_v_id                ,ftString, False, True, True, '=');
      AddField('off_empno'     ,FG_off_empno           ,ftString, True, False, False, '');
      AddField('sec_empno'     ,ED_sec_empno.empno     ,ftString, True, False, False, '');
      AddField('placecode'     ,ED_off_jobplace1.codeno,ftString, True, False, False, '');
      AddField('off_tel1'      ,ED_off_tel1.Text       ,ftString, True, False, False, '');
      AddField('off_tel2'      ,ED_off_tel2.Text       ,ftString, True, False, False, '');
      AddField('off_date'      ,ED_off_date.NoformatDate,ftString, True, False, False, '');
      AddField('off_time'      ,ED_off_time.Text       ,ftString, True, False, False, '');
      AddField('off_indatefr'  ,ED_off_indatefr.NoformatDate,ftString, True, False, False, '');
      AddField('off_indateto'  ,ED_off_indateto.NoformatDate,ftString, True, False, False, '');
      AddField('off_intimefr'  ,ED_off_intimefr1.Text+ED_off_intimefr2.Text, ftString, True, False, False, '');
      AddField('off_intimeto'  ,ED_off_intimeto1.Text+ED_off_intimeto2.Text, ftString, True, False, False, '');
      AddField('v_pcid'        ,ED_v_pcid.Hint         ,ftString, True, False, False, '');
      AddField('v_propose'     ,ED_v_propose.Text      ,ftString, True, False, False, '');
      AddField('v_content'     ,QuotationDelete(ED_v_content.Lines.Text),ftString, True, False, False, '');
      AddField('v_infoyn'      ,FG_infoyn              ,ftString, True, False, False, '');
      AddField('writetime'     ,FG_Date                ,ftString, True, False, False, '');
      AddField('writeman'      ,FG_empno               ,ftString, True, False, False, '');
    end;
end;

procedure TFM_SubForm1.PL_pvvisit_FieldSet(AGubun : String = '추가');
begin
  FM_Tmax           := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := Insa_Session;
  FG_Date           := FM_Tmax.GetData('sysdate','','');
  ///////////////////////////////////////////////////////////////////////

  with QR_dml do
  begin
       TableName   := 'pvvisitlist';
       ServiceName := 'PVB1010A_dml';
       ClearFieldInfo;
       DataSet.ClearParamInfo;

       DataSet.AddParam('gubun',4 , '저장');
       DataSet.AddParam('v_id', 15, FG_v_id);

       if AGubun = '삭제' then
       begin
            AddField('v_id'   ,FG_v_id             ,ftString, False, True, True, '=');
            AddField('v_pid'  ,ED_v_korname.Hint   ,ftString, False, True, True, '=');
       end
       else
       begin
            AddField('v_id'   ,FG_v_id             ,ftString, True, False, False, '');
            AddField('v_pid'  ,ED_v_korname.Hint   ,ftString, True, False, False, '');
       end;
       AddField('v_infoyn'  ,'미방문'  ,ftString, True, False, False, '');
       AddField('writetime' ,FG_Date   ,ftString, True, False, False, '');
       AddField('writeman'  ,FG_empno  ,ftString, True, False, False, '');
  end;
end;


procedure TFM_SubForm1.PL_pvdept_FieldSet(AGubun : String = '추가');
begin
  FM_Tmax           := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := Insa_Session;
  FG_Date           := FM_Tmax.GetData('sysdate','','');
  ///////////////////////////////////////////////////////////////////////

  with QR_dml do
    begin
      TableName   := 'pvdeptlist';
      ServiceName := 'PVB1010A_dml';
      ClearFieldInfo;
      DataSet.ClearParamInfo;

      DataSet.AddParam('gubun',4 , '저장');
      DataSet.AddParam('v_id', 15, FG_v_id);

      if AGubun = '삭제' then
        begin
          AddField('v_id', FG_v_id, ftString, False, True, True, '=');
          AddField('orgnum'  ,ED_off_deptlist.orgnum  ,ftString, False, True, True, '=');
          AddField('deptcode',ED_off_deptlist.deptcode,ftString, False, True, True, '=');
        end
      else
        begin
          AddField('v_id', FG_v_id, ftString, True, False, False, '');
          AddField('orgnum'  ,ED_off_deptlist.orgnum  ,ftString, True, False, False, '');
          AddField('deptcode',ED_off_deptlist.deptcode,ftString, True, False, False, '');
        end;
      AddField('floor'     ,ED_floor.Text  ,ftString, True, False, False, '');
      AddField('writetime' ,FG_Date        ,ftString, True, False, False, '');
      AddField('writeman'  ,FG_empno       ,ftString, True, False, False, '');
    end;
end;

procedure TFM_SubForm1.PL_VisitInsert;
begin
  FM_Tmax           := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := Insa_Session;
  FG_Date           := FM_Tmax.GetData('sysdate','','');
  ///////////////////////////////////////////////////////////////////////

  if (FG_ins) and (FG_count > 0) then
    begin
      if MessageDlg('방문예약 등록 중입니다...다시 방문예약을 작성 하시겠습니까 ?.', mtConfirmation, [mbYES, mbNO], 0) = mrNO then
        System.Exit;
    end;

  FG_count := 1;
  Hinsa_InitComponent(Self,11);
  FG_ins           := True;
  FG_v_id          := '';
  FG_off_empno                 := FG_empno;
  ED_off_date.NoFormatDate     := Copy(FG_Date,1,8);
  ED_off_time.Text             := Copy(FG_Date,9,4);
  ED_off_indatefr.NoFormatDate := Copy(FG_Date,1,8);
  ED_off_indateto.NoFormatDate := Copy(FG_Date,1,8);
  ED_off_intimefr1.Text        := '09';
  ED_off_intimeto1.Text        := '18';
  ED_off_intimefr2.Text        := '00';
  ED_off_intimeto2.Text        := '00';
  FG_infoyn                    := '미방문';
  //jissi 버튼 비활성화
  BT_ins1.Enabled := False;
  BT_del1.Enabled := False;
  BT_ins2.Enabled := False;
  BT_del2.Enabled := False;

  QR_vlist.Close;
  QR_dlist.Close;

  QR_dlist.UseMemory := True;
  QR_vlist.UseMemory := True;
  
  QR_vlist.Open;
  QR_dlist.Open;
  
  PL_Get_empno;
  ED_sec_empno.Text := FG_empno;
  ED_sec_empno.PL_get_singledata;

  FG_detail1 := False;
  FG_detail2 := False;
  ED_off_tel1.SetFocus;
end;

procedure TFM_SubForm1.PL_VisitDelete;
begin
  if MessageDlg('방문정보 삭제를 하시겠습니까 ?.'#13#13+
                '※ 알림: 방문정보 삭제시 방문부서/방문자 목록도 함께 삭제 됩니다.', mtConfirmation, [mbYES, mbNO], 0) = mrNO then
    System.Exit;

// 2004.7.9 유효성 추가 : bug 수정
  if Trim(FG_v_id) = '' then
    begin
      MessageDlg('방문정보가 저장된 상태가 아닙니다..삭제할 자료가 없습니다...', mtInformation, [mbOK], 0);
      System.Exit;
    end;
// 추가 end

  if FG_infoyn = '방문' then
    begin
      MessageDlg('방문한 방문정보는 삭제 할 수 없습니다...', mtInformation, [mbOK], 0);
      System.Exit;
    end;

  FM_PVB1010A.SB_Help.Panels[1].Text := '데이타 삭제중입니다... 잠시만 기다리세요...';
  FM_PVB1010A.SB_Help.Perform(WM_PAINT,0,0);

  PL_pvbook_FieldSet('삭제');

  FG_ins := False;
  QR_dml.Delete;

  if not QR_dml.Execute then
    begin
      FM_PVB1010A.SB_Help.Panels[1].Text := '';
      System.Exit;
    end;

  FM_PVB1010A.SB_Help.Panels[1].Text := '';
  MessageDlg('방문예약 정보 삭제가 완료 되었습니다...', mtInformation, [mbOK], 0);
  PL_VisitInsert;
end;

function TFM_SubForm1.PL_VisitSaveCheck : Boolean;
begin
  Result := False;

  Grid1.SetFocus;
  if MessageDlg('방문정보 데이타를 저장 하시겠습니까 ?.', mtConfirmation, [mbYES, mbNO], 0) = mrNO then
    System.Exit;

  if FG_empno = '' then
    begin
      MessageDlg('신청자 정보가 없습니다...', mtInformation, [mbOK], 0);
      System.Exit;
    end;

  if FG_infoyn = '방문' then
    begin
      MessageDlg('방문한 방문정보는 수정할 수 없습니다...', mtInformation, [mbOK], 0);
      System.Exit;
    end;

  if ED_off_date.NoFormatDate = '00000000' then
    begin
      MessageDlg('신청일을 입력하세요...', mtInformation, [mbOK], 0);
      ED_off_date.SetFocus;
      System.Exit;
    end;

  if ED_off_time.Text = '' then
    begin
      MessageDlg('신청시간을 입력하세요...', mtInformation, [mbOK], 0);
      ED_off_time.SetFocus;
      System.Exit;
    end;

  if (trim(ED_off_jobplace1.Text) = '') then
    begin
      MessageDlg('방문지를 등록하지 않으셨습니다...', mtInformation, [mbOK], 0);
      ED_off_jobplace1.SetFocus;
      System.Exit;
    end;

  if ED_sec_empno.empno = '' then
    begin
      MessageDlg('실방문자를 입력하세요...', mtInformation, [mbOK], 0);
      ED_sec_empno.SetFocus;
      System.Exit;
    end;

  if ED_off_tel1.Text = '' then
    begin
      MessageDlg('연락처1을 입력하세요...', mtInformation, [mbOK], 0);
      ED_off_tel1.SetFocus;
      System.Exit;
    end;

  if ED_off_indatefr.NoformatDate = '00000000' then
    begin
      MessageDlg('출입요청일시 From을 입력하세요...', mtInformation, [mbOK], 0);
      ED_off_indatefr.SetFocus;
      System.Exit;
    end;

  if ED_off_indateto.NoformatDate = '00000000' then
    begin
      MessageDlg('출입요청일시 To를 입력하세요...', mtInformation, [mbOK], 0);
      ED_off_indateto.SetFocus;
      System.Exit;
    end;

  if (ED_v_pcid.Hint = '9999') then
    begin
      if (ED_v_propose.Text = '') then
        begin
          MessageDlg('기타 방문목적을 입력하세요...', mtInformation, [mbOK], 0);
          ED_v_propose.SetFocus;
          System.Exit;
        end;
    end
  else
    begin
      if (ED_v_pcid.Hint = '') then
        begin
          MessageDlg('방문목적을 입력하세요...', mtInformation, [mbOK], 0);
          ED_v_pcid.SetFocus;
          System.Exit;
        end;
    end;

  if ( (ED_off_indatefr.NoformatDate + ED_off_intimefr1.Text + ED_off_intimefr2.Text) >=
       (ED_off_indateto.NoformatDate + ED_off_intimeto1.Text + ED_off_intimeto2.Text) ) then
    begin
      MessageDlg('출입요청일시 To가 From보다 작을수 없습니다...', mtInformation, [mbOK], 0);
      ED_off_indateto.SetFocus;
      System.Exit;
    end;

  if (QR_vlist.RecordCount <= 0) or (QR_dlist.RecordCount <= 0) then
    begin
      MessageDlg('방문부서/방문자를 등록하세요...', mtInformation, [mbOK], 0);
      System.Exit;
    end;
      
  Result := True;
end;

procedure TFM_SubForm1.PL_VisitSave(AGubun : String);
var
  Comp : TTMaxDataSet;
  FL_ok: Boolean;

  procedure PL_DML_Set;
  begin
    FM_Tmax           := TFM_Tmax.Create(Self);
    FM_Tmax.T_Session := Insa_Session;
    FG_Date           := FM_Tmax.GetData('sysdate','','');
    ///////////////////////////////////////////////////////////////////////
    if ED_off_time.Text      = '' then ED_off_time.Text := '0000';
    if ED_off_intimefr1.Text = '' then ED_off_intimefr1.Text := '00';
    if ED_off_intimefr2.Text = '' then ED_off_intimefr2.Text := '00';
    if ED_off_intimeto1.Text = '' then ED_off_intimeto1.Text := '00';
    if ED_off_intimeto2.Text = '' then ED_off_intimeto2.Text := '00';

    with QR_Batch do
      begin
        FieldByName('v_id').AsString           := FG_v_id;
        FieldByName('off_empno').AsString      := FG_off_empno;
        FieldByName('sec_empno').AsString      := ED_sec_empno.empno;
        FieldByName('placecode').AsString      := ED_off_jobplace1.codeno;
        FieldByName('off_tel1').AsString       := ED_off_tel1.Text;
        FieldByName('off_tel2').AsString       := ED_off_tel2.Text;
        FieldByName('off_date').AsString       := ED_off_date.NoformatDate;
        FieldByName('off_time').AsString       := ED_off_time.Text;
        FieldByName('off_indatefr').AsString   := ED_off_indatefr.NoformatDate;
        FieldByName('off_intimefr').AsString   := ED_off_intimefr1.Text+ED_off_intimefr2.Text;
        FieldByName('off_indateto').AsString   := ED_off_indateto.NoformatDate;
        FieldByName('off_intimeto').AsString   := ED_off_intimeto1.Text+ED_off_intimeto2.Text;
        FieldByName('v_pcid').AsString         := ED_v_pcid.Hint;
        FieldByName('v_propose').AsString      := ED_v_propose.Text;
        FieldByName('v_content').AsString      := QuotationDelete(ED_v_content.Lines.Text);
        FieldByName('v_infoyn').AsString       := FG_infoyn;
        FieldByName('writeman').AsString       := FG_empno;
        FieldByName('writetime').AsString      := Copy(FG_Date,1,15);
      end;
  end;
begin
  if not PL_VisitSaveCheck then
    System.Exit;

  FG_count := 0;
  FM_PVB1010A.SB_Help.Panels[1].Text := '데이타 저장중입니다... 잠시만 기다리세요...';
  FM_PVB1010A.SB_Help.Perform(WM_PAINT,0,0);

  if not FG_ins then
    begin
      PL_pvbook_FieldSet;
      QR_dml.Update;
      FL_ok := QR_dml.Execute;
      ED_off_deptlist.SetFocus;

      FM_PVB1010A.SB_Help.Panels[1].Text := '';
      System.Exit;
    end;

  FG_v_id := PL_Get_vid;
  if QR_vlist.RecordCount >= QR_dlist.RecordCount then
    Comp := QR_vlist
  else
    Comp := QR_dlist;

  Comp.First;
  with QR_Batch do
    begin
      Close;
      Open;
      while not Comp.Eof do
        begin
          Append;
          PL_DML_Set;
          Post;
          Comp.Next;
        end;

      First;
      QR_dlist.First;
      while not QR_dlist.Eof do
        begin
          Edit;
          FieldByName('orgnum').AsString   := QR_dlist.FieldByName('orgnum').AsString;
          FieldByName('deptcode').AsString := QR_dlist.FieldByName('deptcode').AsString;
          FieldByName('floor').AsString    := QR_dlist.FieldByName('floor').AsString;
          Post;
          Next;
          QR_dlist.Next;
        end;

      First;
      QR_vlist.First;
      while not QR_vlist.Eof do
        begin
          Edit;
          FieldByName('v_pid').AsString := QR_vlist.FieldByName('v_pid').AsString;
          Post;
          Next;
          QR_vlist.Next;
        end;

      BuildBatchData;
      FL_ok := Execute;
      if FL_ok then FG_ins := False;

      FM_PVB1010A.SB_Help.Panels[1].Text := '';
      Close;
    end;

  if FL_ok then
  begin
       MessageDlg('방문예약 정보가 저장 되었습니다...', mtInformation, [mbOK], 0);
  end;
end;

function TFM_SubForm1.PL_Select_bookvisit(AKey : String) : Boolean;
begin
  Result := True;
  with QR_book do
    begin
      Close;
      ServiceName := 'PVB1010A_sbook';
      Sql.Text := 'SELECT               '+
                  '    v_id        ,    '+
                  '    off_empno   ,    '+
                  '    sec_empno   ,    '+
                  '    placecode   ,    '+
                  '    off_tel1    ,    '+
                  '    off_tel2    ,    '+
                  '    off_date    ,    '+
                  '    off_time    ,    '+
                  '    off_indatefr,    '+
                  '    off_indateto,    '+
                  '    off_intimefr,    '+
                  '    off_intimeto,    '+
                  '    v_pcid      ,    '+
                  '    v_propose   ,    '+
                  '    v_content   ,    '+
                  '    v_infoyn         '+
                  '  FROM pvbookvisit   '+
                  ' WHERE v_id = ''%s'' ';

      Sql.Text := Format(Sql.Text,[AKey]);
      if Open then
        begin
          Hinsa_FieldDisplay(Self, QR_book, 4, 11);
          FG_v_id           := FieldByName('v_id').AsString;
          ED_sec_empno.Text := FieldByName('sec_empno').AsString;
          ED_off_empno.Hint := FieldByName('off_empno').AsString;
          ED_v_pcid.Hint    := FieldByName('v_pcid').AsString;
          ED_v_pcid.Text    := PL_Get_pcname(FieldByName('v_pcid').AsString);
          if ED_v_pcid.Hint = '9999' then
            ED_v_propose.Enabled := True;
          ED_off_intimefr1.Text := Copy(Trim(FieldByName('off_intimefr').AsString),1,2);
          ED_off_intimefr2.Text := Copy(Trim(FieldByName('off_intimefr').AsString),3,2);
          ED_off_intimeto1.Text := Copy(Trim(FieldByName('off_intimeto').AsString),1,2);
          ED_off_intimeto2.Text := Copy(Trim(FieldByName('off_intimeto').AsString),3,2);

          ED_off_jobplace1.codeno := FieldByName('placecode').AsString;
          ED_off_jobplace1.Text   := PL_Get_jobplacename(FG_v_id);
          Result := True;
        end;
      Close;
    end;
end;


function TFM_SubForm1.PL_Select_visitlist(AKey : String) : Boolean;
begin
  Result := True;
  with QR_vlist do
  begin
      Close;
      UseMemory := False;
      ServiceName := 'PVB1010A_svisit';
      Sql.Text := 'SELECT                 '+
                  '    A.v_id            ,'+
                  '    A.v_pid           ,'+
                  '    A.v_infoyn        ,'+
                  '    '''' v_juminid    ,'+   //jissi 2013.04.09  주민번호 삭제 요청(SR-1304-0356) SUBSTR(B.v_juminid,1,9)||''*****''
                  '    B.v_korname       ,'+
                  '    B.v_company       ,'+
                  '    B.v_tel           ,'+  //유효성 : 연락처, 핸드폰 추가
                  '    B.v_hp            ,'+  //추가 end
                  '    A.v_indatefr      ,'+
                  '    A.v_intimefr      ,'+
                  '    A.v_indateto      ,'+
                  '    A.v_intimeto      ,'+
                  '    A.v_cardno        ,'+
                  '    A.v_cardoutdate   ,'+
                  '    A.v_cardouttime   ,'+
                  '    A.v_cardinyn      ,'+
                  '    A.v_cardindate    ,'+
                  '    A.v_cardintime    ,'+
                  '    A.v_cardnoinsayu  ,'+
                  '    A.v_cardnoinresult,'+
                  '    A.v_juminyn       ,'+
                  '    A.v_juminnosayu   ,'+
                  '    A.v_inid          ,'+
                  '    A.v_outid         ,'+
                  '    A.writeman         '+
                  '  FROM pvvisitlist A, pvperson B '+
                  ' WHERE A.v_id  = ''%s''     '+
                  '   AND A.v_pid = B.v_pid(+) ';

      Sql.Text  := Format(Sql.Text,[AKey]);
      Open;
      FG_detail2 := (QR_vlist.RecordCount > 0);

      
      //여러명 선택 일괄 삭제기능 추가/ dsa2000  2010.06.
      MD_Data.Close;
      MD_Data.Open;
      MD_Data.DisableControls;

      while not QR_vlist.eof do
      begin
           MD_Data.Append;
           MD_Data.FieldByName('v_id').AsString      := FieldByName('v_id').AsString;
           MD_Data.FieldByName('v_pid').AsString     := FieldByName('v_pid').AsString;
           MD_Data.FieldByName('v_infoyn').AsString  := FieldByName('v_infoyn').AsString;
           MD_Data.FieldByName('v_korname').AsString := FieldByName('v_korname').AsString;
           MD_Data.FieldByName('v_juminid').AsString := FieldByName('v_juminid').AsString;
           MD_Data.FieldByName('chk').AsString       := '';
           MD_Data.Post;
           Next;
      end;
      MD_Data.EnableControls;
  end;
end;

function TFM_SubForm1.PL_Select_deptlist(AKey : String) : Boolean;
begin
  Result := True;
  with QR_dlist do
    begin
      Close;
      UseMemory := False;
      ServiceName := 'PVB1010A_sdept';
      Sql.Text := 'SELECT               '+
                  '    A.v_id     ,     '+
                  '    A.orgnum   ,     '+
                  '    A.deptcode ,     '+
                  '    B.deptname|| '' ''||B.deptna3, '+
                  '    A.floor          '+
                  '  FROM pvdeptlist A, pvpycdept B '+
                  ' WHERE  A.v_id     = ''%s''        '+
                  '   AND  A.orgnum   = B.orgnum(+)   '+
                  '   AND  A.deptcode = B.deptcode(+) ';

      Sql.Text  := Format(Sql.Text,[AKey]);
      Open;
      FG_detail1 := (QR_dlist.RecordCount > 0);
    end;
end;

function TFM_SubForm1.PL_Get_jobplacename(AKey : String) : String;
var s : String;
begin
  Result := '';
  if AKey = '' then
    System.Exit;

  with QR_com do
    begin
      Close;
      ServiceName := 'HINSA_select';
      ClearFieldInfo;
      AddField('field1'  , ftString, 100);
      AddField('field2'  , ftString, 100);
      AddField('field3'  , ftString, 100);
      AddField('field4'  , ftString, 100);
      AddField('field5'  , ftString, 100);
      Sql.Clear;
      Sql.Text := Format('SELECT placecode, b.codename,''3'',''4'',''5'' '+
                         '  FROM pvbookvisit A, pyccode b                '+
                         ' WHERE a.v_id = ''%s''                         '+
                         '   and b.codeid(+) = ''I160''                  '+
                         '   and a.placecode = b.codeno(+)               ', [AKey]);
      if Open then
        begin
          S :=  Trim(FieldByName('field2').AsString);
          Result := s;
        end;
      Close;
   end;
end;

procedure TFM_SubForm1.PL_Get_empno;
var
  FL_Sql : String;
begin
  FM_PVB1010A.PL_Com_Contructor(QR_com);
  with QR_com do
    begin
      Close;
      FL_Sql := Format('SELECT a.korname, b.codename, a.jobplace, c.codename, d.deptname||'' ''||d.deptna3  '+
                       '  FROM pvpimpmas a, pyccode b, pyccode c, pvpycdept d '+
                       ' WHERE a.empno    = ''%s''        '+
                       '   AND b.codeid(+)= ''I113''      '+
                       '   AND c.codeid(+)= ''I160''      '+
                       '   AND a.payra    = b.codeno(+)   '+
                       '   AND a.jobplace = c.codeno(+)   '+
                       '   AND a.orgnum   = d.orgnum(+)   '+
                       '   AND a.deptcode = d.deptcode(+) ',
                       [FG_off_empno]);
      Sql.Text := FL_Sql;
      if Open then
        begin
          ED_off_empno.ValueCaption    := FG_off_empno + ' - ' + FieldByName('field1').AsString;
          ED_off_payra.ValueCaption    := FieldByName('field2').AsString;
          ED_off_deptcode.ValueCaption := FieldByName('field5').AsString;
          ED_off_jobplace.ValueCaption := FieldByName('field4').AsString;
          ED_off_jobplace.Hint         := FieldByName('field3').AsString;

          ED_off_jobplace1.Text        := FieldByName('field4').AsString;
          ED_off_jobplace1.codeno      := FieldByName('field3').AsString;

        end;
      Close;
    end;
end;

function TFM_SubForm1.PL_Get_vid : String;
begin
  Result := '';
  with QR_com do
    begin
      Close;
      ServiceName := 'HINSA_select';
      ClearFieldInfo;
      AddField('field1'  , ftString, 100);
      AddField('field2'  , ftString, 100);
      AddField('field3'  , ftString, 100);
      AddField('field4'  , ftString, 100);
      AddField('field5'  , ftString, 100);
      Sql.Clear;
      Sql.Text := 'SELECT /*+ index_desc (A) */ NVL(MAX(v_id),0) + 1 cnt, ''2'',''3'',''4'',''5'' '+
                  '  FROM pvbookvisit A '+
                  ' WHERE rownum = 1 ';
      if Open then
        begin
          Result := FillDataFix(Result,15 - Length(Trim(FieldByName('field1').AsString)),'0');
          Result := Result + Trim(FieldByName('field1').AsString);
        end;
      Close;
   end;
end;

function TFM_SubForm1.PL_Get_pcname(AKey : String) : String;
begin
  Result := '';
  if AKey = '' then
    System.Exit;

  with QR_com do
    begin
      Close;
      ServiceName := 'HINSA_select';
      ClearFieldInfo;
      AddField('field1'  , ftString, 100);
      AddField('field2'  , ftString, 100);
      AddField('field3'  , ftString, 100);
      AddField('field4'  , ftString, 100);
      AddField('field5'  , ftString, 100);
      Sql.Clear;
      Sql.Text := Format('SELECT v_pcname, ''2'',''3'',''4'',''5'' '+
                         '  FROM pvprolist A '+
                         ' WHERE v_pcid = ''%s'' ', [AKey]);
      if Open then
        begin
          Result := Trim(FieldByName('field1').AsString);
        end;
      Close;
   end;
end;

function TFM_SubForm1.PL_Detail_Exists : Boolean;
begin
  Result := False;

  if FG_v_id <> '' then
    if (not FG_detail1) or (not FG_detail2) then
      System.Exit;

  Result := True;
end;

procedure TFM_SubForm1.DataSource2DataChange(Sender: TObject; Field: TField);
begin
  if not QR_vlist.Active then  System.Exit;

  with QR_vlist do
  begin
       ED_v_korname.Hint         := FieldByName('v_pid').AsString;
       ED_v_korname.Text         := FieldByName('v_korname').AsString;
       ED_v_juminid.ValueCaption := FieldByName('v_juminid').AsString;
       ED_v_company.ValueCaption := FieldByName('v_company').AsString;
  end;
end;

procedure TFM_SubForm1.ED_off_indatefrDateChange(Sender: TObject);
begin
  ED_off_indateto.NoFormatDate := ED_off_indatefr.NoFormatDate;
end;

procedure TFM_SubForm1.BT_ins1Click(Sender: TObject);
begin
  if ED_off_deptlist.deptcode = '' then
    begin
      MessageDlg('방문부서를 입력하세요...', mtInformation, [mbOK], 0);
      ED_off_deptlist.SetFocus;
      System.Exit;
    end;

  if ED_floor.Text = '' then
    begin
      MessageDlg('방문층을 입력하세요...', mtInformation, [mbOK], 0);
      ED_floor.SetFocus;
      System.Exit;
    end;

  DataSource1.OnDataChange := nil;

  QR_dlist.DisableControls;
  QR_dlist.First;
  if QR_dlist.Locate('deptcode',VarArrayOf([ED_off_deptlist.deptcode]),[]) then
    begin
      QR_dlist.EnableControls;
      MessageDlg('이미 부서가 등록 되었습니다...', mtInformation, [mbOK], 0);
      DataSource1.OnDataChange := DataSource1DataChange;
      System.Exit;
    end;
  QR_dlist.EnableControls;
  
  FM_PVB1010A.SB_Help.Panels[1].Text := '방문부서 목록에 추가중입니다...';
  FM_PVB1010A.SB_Help.Perform(WM_PAINT,0,0);

  if not FG_ins then
    begin
      PL_pvdept_FieldSet;
      QR_dml.Insert;
      if not QR_dml.Execute then
        begin
          FM_PVB1010A.SB_Help.Panels[1].Text := '';
          DataSource1.OnDataChange := DataSource1DataChange;
          System.Exit;
        end;
    end;

  if not QR_dlist.Active then
    begin
      DataSource1.OnDataChange := DataSource1DataChange;
      System.Exit;
    end;

  with QR_dlist do
    begin
      Append;
      FieldByName('v_id').AsString     := FG_v_id;
      FieldByName('orgnum').AsString   := ED_off_deptlist.orgnum;
      FieldByName('deptcode').AsString := ED_off_deptlist.deptcode;
      FieldByName('deptname').AsString := ED_off_deptlist.deptname;
      FieldByName('floor').AsString    := ED_floor.Text;
      Post;
    end;

  FG_detail1 := (QR_dlist.RecordCount > 0);

  DataSource1.OnDataChange := DataSource1DataChange;
  FM_PVB1010A.SB_Help.Panels[1].Text := '';
end;

procedure TFM_SubForm1.BT_del1Click(Sender: TObject);
begin
  FM_PVB1010A.SB_Help.Panels[1].Text := '방문부서 목록에서 삭제중입니다...';
  FM_PVB1010A.SB_Help.Perform(WM_PAINT,0,0);

  DataSource1.OnDataChange := nil;
  if not FG_ins then
    begin
      PL_pvdept_FieldSet('삭제');
      QR_dml.Delete;
      if not QR_dml.Execute then
        begin
          FM_PVB1010A.SB_Help.Panels[1].Text := '';
          DataSource1.OnDataChange := DataSource1DataChange;
          System.Exit;
        end;
     end;
     
  with QR_dlist do
    begin
      Delete;
    end;

  FG_detail1 := (QR_dlist.RecordCount > 0);
  if not FG_detail1 then
    begin
      ED_off_deptlist.Text     := '';
      ED_off_deptlist.orgnum   := '';
      ED_off_deptlist.deptcode := '';
    end;

  DataSource1.OnDataChange := DataSource1DataChange;
  FM_PVB1010A.SB_Help.Panels[1].Text := '';
end;

procedure TFM_SubForm1.BT_ins2Click(Sender: TObject);
begin
  if (ED_v_korname.Hint = '') or (Trim(ED_v_korname.Text) = '') then
  begin
       MessageDlg('방문자를 입력하세요...', mtInformation, [mbOK], 0);
       ED_v_korname.SetFocus;
       System.Exit;
  end;

  DataSource2.OnDataChange := nil;

  QR_vlist.DisableControls;
  QR_vlist.First;
  if QR_vlist.Locate('v_pid',VarArrayOf([ED_v_korname.Hint]),[]) then
  begin
       QR_vlist.EnableControls;
       MessageDlg('이미 방문자가 등록 되었습니다...', mtInformation, [mbOK], 0);
       DataSource2.OnDataChange := DataSource2DataChange;
       System.Exit;
  end;
  QR_vlist.EnableControls;

  FM_PVB1010A.SB_Help.Panels[1].Text := '방문자 목록에 추가중입니다...';
  FM_PVB1010A.SB_Help.Perform(WM_PAINT,0,0);

  if not FG_ins then
  begin
       PL_pvvisit_FieldSet;
       QR_dml.Insert;
       if not QR_dml.Execute then
       begin
            FM_PVB1010A.SB_Help.Panels[1].Text := '';
            DataSource2.OnDataChange := DataSource2DataChange;
            System.Exit;
       end;
  end;

  with QR_vlist do
  begin
       Append;
       FieldByName('v_id').AsString       := FG_v_id;
       FieldByName('v_pid').AsString      := ED_v_korname.Hint;
       FieldByName('v_infoyn').AsString   := '미방문';
       FieldByName('v_juminid').AsString  := ED_v_juminid.ValueCaption;
       FieldByName('v_korname').AsString  := ED_v_korname.Text;
       FieldByName('v_company').AsString  := ED_v_company.ValueCaption;
       Post;
  end;
  FG_detail2 := (QR_vlist.RecordCount > 0);

  DataSource2.OnDataChange := DataSource2DataChange;

  FM_PVB1010A.SB_Help.Panels[1].Text := '';


  //여러명 선택 일괄 삭제기능 추가/ dsa2000  2010.06.
  DataSource2.DataSet := QR_vlist;

  if not MD_Data.Active then MD_Data.Open;
  MD_Data.DisableControls;

  MD_Data.Append;
  MD_Data.FieldByName('v_id').AsString      := QR_vlist.FieldByName('v_id').AsString;
  MD_Data.FieldByName('v_pid').AsString     := QR_vlist.FieldByName('v_pid').AsString;
  MD_Data.FieldByName('v_infoyn').AsString  := QR_vlist.FieldByName('v_infoyn').AsString;
  MD_Data.FieldByName('v_juminid').AsString := QR_vlist.FieldByName('v_juminid').AsString;
  MD_Data.FieldByName('v_korname').AsString := QR_vlist.FieldByName('v_korname').AsString;
  MD_Data.FieldByName('v_company').AsString := QR_vlist.FieldByName('v_company').AsString;
  MD_Data.FieldByName('chk').AsString       := '';
  MD_Data.Post;

  MD_Data.EnableControls;
end;

procedure TFM_SubForm1.BT_del2Click(Sender: TObject);
var i, cnt  : Integer;
begin
  FM_PVB1010A.SB_Help.Panels[1].Text := '방문자 목록에서 삭제중입니다...';
  FM_PVB1010A.SB_Help.Perform(WM_PAINT,0,0);

  //여러명 선택 일괄 삭제기능 추가 dsa2000  2010.06.
  cnt := 0;
  if MD_Data.Eof then Exit;

  if MessageDlg('선택한 방문자를 일괄 삭제 하시겠습니까?',mtConfirmation, [mbYes,mbNo ],0)<> mrYes then Exit;

  MD_Data.First;
  for i := 1 to MD_Data.RecordCount do
  begin
       if MD_Data.FieldByName('chk').AsString = '◎' then
       begin
            with QR_com do
            begin
                 Close;
                 ServiceName := 'PZD1020A_dml';
                 Sql.Clear;
                 Sql.Add('Delete pvvisitlist                                             ');
                 Sql.Add(' Where v_id  = '''+ MD_Data.FieldByName('v_id').AsString  +''' ');
                 Sql.Add('   And v_pid = '''+ MD_Data.FieldByName('v_pid').AsString +''' ');

                 if not Execute then
                 begin
                      Application.Messagebox('삭제에 실패했습니다.','작업안내',mb_ok+ mb_IconStop);
                      Exit;
                 end;
            end;
            cnt := cnt + 1;
       end;
       MD_Data.Next;
  end;
  PL_Select_visitlist(FG_v_id);

  DataSource2.DataSet := QR_vlist;

  MessageDlg(IntToStr(cnt)+'건의 자료가 삭제 완료되었습니다.',mtInformation, [mbOk ],0);
  FM_PVB1010A.SB_Help.Panels[1].Text := '';
{ //기존 한건씩 삭제하던 루틴.
  DataSource2.OnDataChange := nil;
  if not FG_ins then
  begin
       PL_pvvisit_FieldSet('삭제');
       QR_dml.Delete;
       if not QR_dml.Execute then
       begin
            FM_PVB1010A.SB_Help.Panels[1].Text := '';
            DataSource2.OnDataChange := DataSource2DataChange;
            System.Exit;
       end;
  end;

  with QR_vlist do
  begin
       Delete;
  end;
  FG_detail2 := (QR_vlist.RecordCount > 0);

  if not FG_detail2 then
  begin
       ED_v_korname.Text := '';
       ED_v_korname.Hint := '';
  end;
  DataSource2.OnDataChange := DataSource2DataChange;  }
end;

procedure TFM_SubForm1.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  if not QR_dlist.Active then System.Exit;
  with QR_dlist do
  begin
      ED_off_deptlist.Text     := FieldByName('deptcode').AsString +' - '+ FieldByName('deptname').AsString;
      ED_off_deptlist.orgnum   := FieldByName('orgnum').AsString;
      ED_off_deptlist.deptcode := FieldByName('deptcode').AsString;
      ED_off_deptlist.deptname := FieldByName('deptname').AsString;
      ED_floor.Text            := FieldByName('floor').AsString;
  end;
end;

procedure TFM_SubForm1.OncomboGetImageIndex(Sender: TObject; const ItemIndex: Integer; var idx: Integer);
begin
  idx := 0;
end;

procedure TFM_SubForm1.BT_mailClick(Sender: TObject);
begin
  PL_Get_empno; //근태 등록/결재 프로그램에서 변경내역을 다시 한번 체크하기 위해.
  
  PA_Place.Visible := True;
end;

procedure TFM_SubForm1.BT_pcloseClick(Sender: TObject);
begin
  PA_place.Visible := False;
end;

procedure TFM_SubForm1.SB_mailClick(Sender: TObject);
var
   SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String;
begin
  PA_Place.Visible := False;
  //////////////////////////////////////////////////////////////////////////////
  //EAI 연동을 통한 Web Hint로 메일 발송을 위하여 PZHMAIL 테이블에 Insert...2007.08.01   dsa2000
  SendProgID  := 'PVB1010A';
  SendEmpno   := FG_empno;
  RcveEmpno   := FG_Mailempno;
  MailSubject := FG_korname + ' (' + FG_empno+ ') 사원이 근무지 변경을 요청했습니다..';
  MailBody    := '현재 ['+ED_off_jobplace.ValueCaption + '] 근무지로 되어 있습니다.'#13#10#13#10+
                 '['+ED_jobplace.Text + ']으로 근무지를 변경해주세요...';
  ReceiveYN   := 'N';
  //if ChkReceive.Checked then ReceiveYN := 'Y';

  if Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN) then
       MessageDlg('메일 전송이 성공 하였습니다...',mtInformation, [mbOk], 0)
  else
  begin
       MessageDlg('메일 전송이 실패 하였습니다...',mtError, [mbOk], 0);
       exit;
  end
end;

//EAI 연동을 통한 Web Hint로 메일 발송을 위하여 PZHMAIL 테이블에 Insert...2007.08.01   dsa2000
Function TFM_SubForm1.Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String) : Boolean;
begin
  with QR_com do
  begin
       ServiceName := 'PKA4040A_dml';
       Close;
       SQL.Clear;
       SQL.Add('insert into PZHMAIL                         ');
       SQL.Add('values (to_char(sysdate,''YYYYMMDDHHMISS''),');  //SENDTIME   메일발송 작업시간
       SQL.Add('        '''+ SendProgID   +''',             ');  //SENDPROG   발송프로그램 ID
       SQL.Add('        '''+ SendEmpno    +''',             ');  //SEND_PER   발신자 사번
       SQL.Add('        '''+ RcveEmpno    +''',             ');  //RCVR_PER,  수신자 사번
       SQL.Add('        ''''                  ,             ');  //REFR_PER   불필요(종합인사)
       SQL.Add('        '''+ MailSubject  +''',             ');  //SUBJECT    메일제목
       SQL.Add('        ''''                  ,             ');  //HEADER1    불필요(종합인사)
       SQL.Add('        '''+ MailBody     +''',             ');  //BODY1      메일내용
       SQL.Add('        ''''                  ,             ');  //TAIL1      불필요(종합인사)
       SQL.Add('        '''+ ReceiveYN    +''',             ');  //RECEIVEYN  'Y' 일경우 메일 읽었을경우 송신자에게 수신확인 메일 보내주기
       SQL.Add('        ''N''                 ,             ');  //EAI_FLAG
       SQL.Add('        ''''                  )             ');  //EAI_DATE

       try
            Execute;
       except
            Result := false;
            exit;
       end;
       Result := True;
  end;
end;

//여러명 선택 일괄 삭제기능 추가/ dsa2000  2010.06.
procedure TFM_SubForm1.Grid2CellClick(Sender: TObject;
  const ACell: TOnJCell);
begin
  DataSource2.DataSet := MD_Data;

  if not MD_Data.Active then MD_Data.Open;

  if MD_Data.State <> dsEdit then MD_Data.Edit;

  if  MD_Data.FieldByName('chk').AsString = '◎' then MD_Data.FieldByName('chk').AsString := ''
  else                                                MD_Data.FieldByName('chk').AsString := '◎';

  MD_Data.Post;
end;

procedure TFM_SubForm1.ED_off_indatetoDateChange(Sender: TObject);
var Days : integer;
    frDate,toDate : String;
begin
   if ED_off_indatefr.Date > ED_off_indateto.Date then
   begin
        MessageDlg('출입요청일시From('+ED_off_indatefr.Text+')이 출입요청일시To('+ED_off_indateto.Text+')보다 큽니다.',mtError, [mbOk], 0);
        ED_off_indateto.Setfocus;
   end;

   frDate := copy(ED_off_indatefr.Text,1,4)+copy(ED_off_indatefr.Text,7,2) +copy(ED_off_indatefr.Text,11,2);
   toDate := copy(ED_off_indateto.Text,1,4)+copy(ED_off_indateto.Text,7,2) +copy(ED_off_indateto.Text,11,2);

   with QR_com do
   begin
      Close;
      ServiceName := 'HINSA_select';
      ClearFieldInfo;
      AddField('field1'  , ftString, 100);
      AddField('field2'  , ftString, 100);
      AddField('field3'  , ftString, 100);
      AddField('field4'  , ftString, 100);
      AddField('field5'  , ftString, 100);
      Sql.Clear;
      Sql.Add('select to_date('''+ToDate+''',''YYYYMMDD'') - to_date('''+FrDate+''',''YYYYMMDD'') + 1 field1, ');
      Sql.Add('       '''' field2,'''' field3,'''' field4,'''' field5 from dual');

      if Open then
      begin
           Days := FieldByName('field1').AsInteger;
      end;
      Close;
   end;

   if Days > 7 then
   begin
        MessageDlg('출입요청기간은 1주일이내로 등록해주시기 바랍니다.',mtError, [mbOk], 0);
        ED_off_indateto.Setfocus;
   end;
end;

procedure TFM_SubForm1.ED_off_indatetoExit(Sender: TObject);
begin
   ED_off_indatetoDateChange(Sender);
end;

end.

