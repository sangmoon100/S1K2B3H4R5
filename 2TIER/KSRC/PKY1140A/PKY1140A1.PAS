{-------------------------------------------------------------------------------
  o 프로그램명 : PKY1140A(파견직 급여이력 개인별 열람)
  o 시스템명   : 급여
  o 부시스템명 : 파견용역비
  o 작성자     : 지순미
  o 버전       : 1.0
  o 작성일자   : 2017.02.22

  o 변경 이력사항
    버전  일자        작성자          변경내용                          처리명세서 반영여부
    1.0   2017.02.22  지순미          파견직 급여이력 개인별 열람 : PKC3050A 프로그램 ID 변경
-------------------------------------------------------------------------------}
unit PKY1140A1;

interface
                                  
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OnScheme, OnEditBaseCtrl, OnEditStdCtrl, ExtCtrls, OnShapeLabel,
  OnEditBtnCtrl, OnPersonEdit, ComCtrls, Grids, DBGrids, OnGrDBGrid,
  StdCtrls, OnFocusButton, Db, MemDS, DBAccess, Ora, Pass, OnMemDataset,
  OnPopupEdit, OnEditCombo, OraError, OnEditNumCtl, Comobj, OnCheckBox, Func,
  OnRadioBtn, ImgList, OnSkinBtn, OnDBGrid, OnInsaCommon, OnLineLabel,OnStringUtils;

type
  TFM_Main = class(TForm)
    SF_Main      : TOnSchemeForm;
    PA_MainPanel : TPanel;
    PA_Buttons   : TPanel;
    BT_find: TOnFocusButton;
    BT_Exit      : TOnFocusButton;
    SB_Help      : TStatusBar;
    OnSectionLabel1: TOnSectionLabel;
    Shape7: TShape;
    ED_deptname: TOnShapeLabel;
    ED_year: TOnComboEdit;
    Shape1: TShape;
    OnSectionLabel2: TOnSectionLabel;
    Grid1: TOnDBGrid;
    PA_Info: TPanel;
    Shape2: TShape;
    OnSectionLabel3: TOnSectionLabel;
    Tab_Note: TNotebook;
    ED_fixpay: TOnShapeLabel;
    ED_bfixpay: TOnShapeLabel;
    ED_ybonamt: TOnShapeLabel;
    ED_taxpay1: TOnShapeLabel;
    ED_taxpay2: TOnShapeLabel;
    ED_taxpay3: TOnShapeLabel;
    ED_taxpay4: TOnShapeLabel;
    ED_ovtmamt: TOnShapeLabel;
    ED_ovmcamt: TOnShapeLabel;
    ED_mcaramt: TOnShapeLabel;
    ED_sopaysum: TOnShapeLabel;
    ED_aidamt11: TOnShapeLabel;
    ED_aidamt12: TOnShapeLabel;
    ED_aidamt3: TOnShapeLabel;
    ED_HomeSupamt: TOnShapeLabel;
    ED_notaxpay2: TOnShapeLabel;
    ED_paysum: TOnShapeLabel;
    SB_Tab1: TOnSkinButton;
    Shape4: TShape;
    DataSource1: TDataSource;
    ImageList1: TImageList;
    QR_pay: TOraQuery;
    QR_com: TOraQuery;
    QR_comA_OVTMAMT: TFloatField;
    QR_comA_SPTMAMT: TFloatField;
    QR_comA_BONUSAMT: TFloatField;
    QR_comA_TAXAMT: TFloatField;
    QR_comA_PAYSUM: TFloatField;
    QR_comA_DEDSUM: TFloatField;
    QR_comA_REALPAY: TFloatField;
    ED_meddamt: TOnShapeLabel;
    ED_anudamt: TOnShapeLabel;
    ED_empldamt: TOnShapeLabel;
    ED_dedamt1: TOnShapeLabel;
    ED_dedamt2: TOnShapeLabel;
    ED_dedamt3: TOnShapeLabel;
    ED_dedamt4: TOnShapeLabel;
    ED_dedamt5: TOnShapeLabel;
    Eaempno: TOnPersonPopupEdit;
    OraQuery1: TOraQuery;
    QR_payPAYDATE: TStringField;
    QR_payEMPNO: TStringField;
    QR_payKORNAME: TStringField;
    QR_payPAYNUM: TStringField;
    QR_payPAYCL: TStringField;
    QR_payPAYGR: TIntegerField;
    QR_payPSTATE: TStringField;
    QR_payORGNUM: TStringField;
    QR_payDEPTCODE: TStringField;
    QR_payBLDCODE: TStringField;
    QR_payPAYYN: TStringField;
    QR_payPAYCALCKIND: TStringField;
    QR_payDUCALCKIND: TStringField;
    QR_payBPAYCALCKIND: TStringField;
    QR_payBDUCALCKIND: TStringField;
    QR_payPAYBANK: TStringField;
    QR_payPAYACNT: TStringField;
    QR_payBASICAMT: TIntegerField;
    QR_payINFOAMT: TIntegerField;
    QR_payDUTYAMT: TIntegerField;
    QR_payPROMAMT: TIntegerField;
    QR_payBBASICAMT: TIntegerField;
    QR_payBINFOAMT: TIntegerField;
    QR_payBDUTYAMT: TIntegerField;
    QR_payBONUSAMT: TIntegerField;
    QR_payDEVIDEMON: TIntegerField;
    QR_payINCENTAMT: TIntegerField;
    QR_payTRAINAMT: TIntegerField;
    QR_payWINTERAMT: TIntegerField;
    QR_payMBONAMT: TIntegerField;
    QR_payYBONAMT: TIntegerField;
    QR_paySBONAMT: TIntegerField;
    QR_paySBONTAXAMT: TIntegerField;
    QR_payMATEAMT: TIntegerField;
    QR_payPARTAMT: TIntegerField;
    QR_payCHILDAMT: TIntegerField;
    QR_payLICEAMT: TIntegerField;
    QR_payOVTMAMT: TIntegerField;
    QR_paySPTMAMT: TIntegerField;
    QR_payAIDAMT1: TIntegerField;
    QR_payAIDAMT2: TIntegerField;
    QR_payAIDAMT3: TIntegerField;
    QR_payMCARAMT: TIntegerField;
    QR_payMCARTAXAMT: TIntegerField;
    QR_payYUEDUAMT: TIntegerField;
    QR_paySELFEDUAMT: TIntegerField;
    QR_payODAMT: TIntegerField;
    QR_payODTAXAMT: TIntegerField;
    QR_payDRVLICEAMT: TIntegerField;
    QR_payLECTSUPAMT: TIntegerField;
    QR_payEDUSUPAMT: TIntegerField;
    QR_payBOKJISUPAMT: TIntegerField;
    QR_payMEDSUPAMT: TIntegerField;
    QR_payHOMESUPAMT: TIntegerField;
    QR_payLONGSUPAMT: TIntegerField;
    QR_paySUPAMT1: TIntegerField;
    QR_paySUPAMT2: TIntegerField;
    QR_paySUPAMT3: TIntegerField;
    QR_payBASICDED: TIntegerField;
    QR_payMATEDED: TIntegerField;
    QR_payFAMIDED: TIntegerField;
    QR_payOBSDED: TIntegerField;
    QR_paySILVERDED: TIntegerField;
    QR_payWOMANDED: TIntegerField;
    QR_payEDUDED: TIntegerField;
    QR_paySPEDED: TIntegerField;
    QR_payETCDED1: TIntegerField;
    QR_payETCDED2: TIntegerField;
    QR_payTAXPAY: TIntegerField;
    QR_payNOTAXPAY: TIntegerField;
    QR_payTAXBONUS: TIntegerField;
    QR_payPAYSUM: TFloatField;
    QR_payTAXPAYSUM: TFloatField;
    QR_payNOTAXPAYSUM: TFloatField;
    QR_paySAVEAMT1: TIntegerField;
    QR_paySAVEAMT2: TIntegerField;
    QR_paySAVEAMT3: TIntegerField;
    QR_payMEDDAMT: TIntegerField;
    QR_payEMPLDAMT: TIntegerField;
    QR_payANUDAMT: TIntegerField;
    QR_payHSAMT: TIntegerField;
    QR_payFBAMT: TIntegerField;
    QR_payNBAMT: TIntegerField;
    QR_paySACORPAMT: TIntegerField;
    QR_paySABANKAMT: TIntegerField;
    QR_paySANGAMT: TIntegerField;
    QR_payLOANAMT1: TIntegerField;
    QR_payLOANAMT2: TIntegerField;
    QR_payLOANAMT3: TIntegerField;
    QR_payTICKETAMT: TIntegerField;
    QR_payNOJOAMT: TIntegerField;
    QR_paySAUAMT: TIntegerField;
    QR_payIGAMT: TIntegerField;
    QR_paySOBIAMT: TIntegerField;
    QR_payPARKAMT: TIntegerField;
    QR_payCHOLLAMT: TIntegerField;
    QR_payMEDDEDAMT: TIntegerField;
    QR_payEDUDEDAMT: TIntegerField;
    QR_payDEDAMT1: TIntegerField;
    QR_payDEDAMT2: TIntegerField;
    QR_payDEDAMT3: TIntegerField;
    QR_payBONDEDAMT: TIntegerField;
    QR_payLABINDED: TIntegerField;
    QR_payLABNEEDDED: TIntegerField;
    QR_payLABINAMT: TIntegerField;
    QR_payINDED: TIntegerField;
    QR_payTAXINAMT: TIntegerField;
    QR_payCALCTAX: TIntegerField;
    QR_payLABTAXDED: TIntegerField;
    QR_paySAVETAXDED: TIntegerField;
    QR_payINTAX: TIntegerField;
    QR_payJUTAX: TIntegerField;
    QR_payDEDSUM: TIntegerField;
    QR_payREALPAY: TIntegerField;
    QR_payTAXGROSS: TFloatField;
    QR_payNOTAXGROSS: TFloatField;
    QR_payINTAXSUM: TFloatField;
    QR_payCALCTAXSUM: TFloatField;
    QR_payKITA1: TIntegerField;
    QR_payKITA2: TIntegerField;
    QR_payKITA3: TIntegerField;
    QR_payKITA4: TIntegerField;
    QR_payKITA5: TIntegerField;
    QR_payBTAXPAY: TIntegerField;
    QR_payBNOTAXPAY: TIntegerField;
    QR_payBTAXBON: TIntegerField;
    QR_payBNOTAXBON: TIntegerField;
    QR_paySOPAY: TIntegerField;
    QR_paySOBON: TIntegerField;
    QR_payCRETIME: TStringField;
    QR_payWRITETIME: TStringField;
    QR_payWRITEMAN: TStringField;
    QR_payPSUM: TIntegerField;
    QR_payBSUM: TIntegerField;
    QR_payJOBDEPT: TStringField;
    QR_payPAYRA: TStringField;
    QR_payBONCODE: TStringField;
    QR_paySOPAYSUM: TIntegerField;
    QR_paySOBONSUM: TIntegerField;
    QR_payPAYHOLDAMT: TIntegerField;
    QR_payPAYBANK1: TStringField;
    QR_payPAYACNT1: TStringField;
    QR_payYBONAMT12: TIntegerField;
    QR_payOVMCAMT: TIntegerField;
    QR_payCHILDEDUAMT: TIntegerField;
    QR_payMEDPAYAMT: TIntegerField;
    QR_payMEDPAYDEDAMT: TIntegerField;
    QR_payTRAINSUPAMT: TIntegerField;
    QR_payOVMCDED: TIntegerField;
    QR_payFIXPAY: TIntegerField;
    QR_payBFIXPAY: TIntegerField;
    QR_payQUATERPAY: TIntegerField;
    QR_payHOLIPAY: TIntegerField;
    QR_payROLEAMT: TIntegerField;
    QR_payDEDAMT4: TIntegerField;
    QR_payDEDAMT5: TIntegerField;
    QR_payAIDAMT11: TFloatField;
    QR_payAIDAMT12: TFloatField;
    QR_payAIDAMT13: TFloatField;
    QR_payAIDAMT14: TFloatField;
    QR_payAIDAMT21: TFloatField;
    QR_payAIDAMT22: TFloatField;
    QR_payAIDAMT23: TFloatField;
    QR_payAIDAMT24: TFloatField;
    QR_payTAXPAY1: TFloatField;
    QR_payTAXPAY2: TFloatField;
    QR_payTAXPAY3: TFloatField;
    QR_payTAXPAY4: TFloatField;
    QR_payNOTAXPAY1: TFloatField;
    QR_payNOTAXPAY2: TFloatField;
    QR_payNOTAXPAY3: TFloatField;
    QR_payNOTAXPAY4: TFloatField;
    QR_paySOPAYSUM1: TFloatField;
    QR_paySOPAYSUM2: TFloatField;
    QR_paySOPAYSUM3: TFloatField;
    QR_paySOPAYSUM4: TFloatField;
    QR_paySOPAYSUM5: TFloatField;
    QR_paySOPAYSUM6: TFloatField;
    QR_payLECTSUPAMT1: TFloatField;
    QR_payLECTSUPAMT2: TFloatField;
    QR_payEDUSUPAMT1: TFloatField;
    QR_payEDUSUPAMT2: TFloatField;
    QR_payHSORGAMT: TIntegerField;
    QR_payHSINTAMT: TIntegerField;
    QR_payLECTSUPAMT3: TFloatField;
    QR_payLECTSUPAMT4: TFloatField;
    QR_payANUDED: TIntegerField;
    QR_paySTANDDED: TIntegerField;
    QR_payITAMT: TIntegerField;
    QR_payCHILDDED: TIntegerField;
    QR_payYUEDUTAX: TIntegerField;
    QR_payLONGMTAMT: TIntegerField;
    ED_sopaysum1: TOnShapeLabel;
    ED_sopaysum2: TOnShapeLabel;
    ED_sopaysum3: TOnShapeLabel;
    ED_bonusamt: TOnShapeLabel;
    ED_notaxpay1: TOnShapeLabel;
    OnShapeLabel1: TOnShapeLabel;
    OnShapeLabel2: TOnShapeLabel;
    OnShapeLabel3: TOnShapeLabel;
    ED_aidamt13: TOnShapeLabel;
    ED_aidamt14: TOnShapeLabel;
    ED_aidamt1: TOnShapeLabel;
    OnShapeLabel7: TOnShapeLabel;
    OnShapeLabel4: TOnShapeLabel;
    OnShapeLabel5: TOnShapeLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BT_ExitClick(Sender: TObject);
    procedure SB_TabClick(Sender: TObject);
    procedure ED_yearGetImageIndex(Sender: TObject;
      const ItemIndex: Integer; var idx: Integer);
    procedure ED_yearChange(Sender: TObject);
    procedure BT_findClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EaempnoKeyPress(Sender: TObject; var Key: Char);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
    FL_Start    : Boolean;
    FG_Date     : String;
    FG_year     : String;
    FG_Month    : String;
    FG_empno    : String;
    FG_korname  : String;
    GSempno, GSpass, GSgrade : String; //dsa2000  2005.03.
    FL_LastRec  : integer;    {전체 레코드수 }
    FG_basicded, FG_mateded, FG_famided, FG_YuEduNoTax : Double;

    procedure PL_get_pkhphis;
    procedure PL_InitJob;
  public
    { Public declarations }
  end;

var
  FM_Main: TFM_Main;

implementation

{$R *.DFM}

procedure TFM_Main.FormCreate(Sender: TObject);
begin
  FL_Start := True;
end;

procedure TFM_Main.FormPaint(Sender: TObject);
var
  FL_Rect : TRect;
begin
  if FL_Start then
    begin
      FL_Start := False;
      SF_Main.Refresh;
      Application.ProcessMessages;

      PA_MainPanel.SetFocus;
      // 이부분서부터 업무관련 초기화 부분 코딩 처리...
      SB_Help.Panels[1].Text := '기초 데이타 설정중입니다... 잠시만 기다리세요...';
      SB_Help.Perform(WM_PAINT,0,0);

      FG_empno   := Hinsa_Param(CmdLine,1);
      FG_korname := Hinsa_Param(CmdLine,2);
      GSempno    := Hinsa_Param(cmdLine,1);
      GSpass     := Hinsa_Param(cmdLine,3);
      GSgrade    := Hinsa_Param(cmdLine,4);
      OraConnect;
      with OraQuery1 do
      begin
           close;
           Sql.Clear;
           Sql.Add(' select max(paydate) maxpay from pkhpyhis ');
           Open;
           FG_Date  := FieldByName('maxpay').AsString;
      end;
      PL_InitJob;
      SB_Help.Panels[1].Text := '';

   end;
end;

procedure TFM_Main.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
     CanClose := True;
end;

procedure TFM_Main.BT_ExitClick(Sender: TObject);
begin
     Close;
end;


procedure TFM_Main.PL_InitJob;
var
  FL_Date : String;
  FL_Sql  : String;
  FL_IDate: Integer;
begin
     FL_Date    := Copy(FG_Date,1,4);
     if not IsNumber(FL_Date) then
        System.Exit;
     FL_IDate := GetStrToInt(FL_Date);
     ED_year.Items.Clear;
     ED_year.KeyItems.Clear;
     ED_year.Items.Add(IntToStr(FL_IDate-2)+' 년');
     ED_year.Items.Add(IntToStr(FL_IDate-1)+' 년');
     ED_year.Items.Add(FL_Date+' 년');
     ED_year.KeyItems.Add(IntToStr(FL_IDate-2));
     ED_year.KeyItems.Add(IntToStr(FL_IDate-1));
     ED_year.KeyItems.Add(FL_Date);
     FG_Month := Copy(FG_Date,5,2);
     FG_Year  := Copy(FG_Date,1,4);

     ED_year.OnChange  := nil;
     ED_year.ItemIndex := 2;
     
     ED_year.OnChange  := ED_yearChange;
     SB_TabClick(SB_Tab1);

     if (Copy(Pempno,1,1) = 'D') or ((GSgrade[3] <= 'C') and (fn_YmanagerCheck))  then
     begin
          Eaempno.Enabled     := True;
          Eaempno.ButtonWidth := 24;
          Eaempno.Sql         := 'SELECT A.empno, A.korname, A.paycl, A.payra, A.pstate, A.empdate, A.paydunm, A.orgnum, '+
                                 '       D.codename payraname, C.codename payclname, A.deptcode, B.deptname, B.deptna3   '+
                                 '  FROM pycdept B, pyccode C, pyccode D, pimpmas A '+
                                 ' WHERE D.codeid(+) = ''I113''       '+
                                 '   AND A.payra     = D.codeno(+)    '+
                                 '   AND C.codeid(+) = ''I112''       '+
                                 '   AND A.paycl     = C.codeno(+)    '+
                                 '   AND A.orgnum    = B.orgnum(+)    '+
                                 '   AND A.deptcode  = B.deptcode(+)  '+
                                 '   AND (A.empno   like ''%s''  or A.korname    like ''%s'')'+
                                 '   AND substr(A.empno,1,1) = ''Y''  '+
                                 '   AND A.pstate    <    ''80''      '+
                                 ' ORDER BY empno, korname            ';
     end
     else if (Copy(Pempno,1,1) = 'Y') then
     begin
          Eaempno.Enabled     := False;
          Eaempno.ButtonWidth := 0;
     end
     else
     begin
          MessageBox(handle,'파견직과 파견직 관리자 외에는 열람할 수 없습니다.','알 림',MB_OK or $0030);
          Close;
     end;

     if (Copy(Pempno,1,1) = 'Y') then
     begin
          Eaempno.Text   := FG_empno;
          Eaempno.empno  := FG_empno;
          Eaempno.PL_get_singledata;
          ED_deptname.ValueCaption := GetDeptName(Eaempno.orgnum, Eaempno.deptcode);
          BT_FindClick(BT_Find);
     end;
end;

procedure TFM_Main.PL_get_pkhphis;
begin
     if Eaempno.empno = '' then
     begin
          MessageDlg('사원번호가 잘못 되었습니다...', mtInformation, [mbOK], 0);
          System.Exit;
     end;

     with QR_pay do
     begin
          Close ;
          Sql.Clear;
          SQL.Add('  SELECT a.*                        ');
          SQL.Add('  FROM pkhpyhis A, pyccode B        ');
          SQL.Add(' WHERE A.paydate LIKE :paydate      ');
          SQL.Add('   AND A.empno      = :p_empno      ');
          SQL.Add('   AND A.paycl      = B.codeno      ');
          SQL.Add('   AND B.codeid     = ''I112''      ');
          SQL.Add(' ORDER BY paydate DESC              ');
          ParamByName('p_empno').AsString := Eaempno.empno ;
          ParamByName('paydate').AsString := Copy(ED_year.Text,1,4)+'%';


          //Close;
          //Grid1.DataSource         := nil;
          //DataSource1.OnDataChange := nil;
          try
               Open;
               FieldByname('paydate').EditMask  := '####년 ##월;0';
               TFloatField(FieldByname('fixpay')).DisplayFormat    := '#,##0';  // ;0
               TFloatField(FieldByname('paysum')).DisplayFormat    := '#,##0';  // ;0
               TFloatField(FieldByname('intax')).DisplayFormat     := '#,##0';  // ;0
               TFloatField(FieldByname('jutax')).DisplayFormat     := '#,##0';  // ;0
               TFloatField(FieldByname('dedsum')).DisplayFormat    := '#,##0';  // ;0
               TFloatField(FieldByname('realpay')).DisplayFormat   := '#,##0';  // ;0
               TFloatField(FieldByname('NOTAXPAY1')).DisplayFormat := '#,##0';  // ;0
               //Grid1.DataSource := DataSource1;

          except
               Close;
          end;
      end;
end;

procedure TFM_Main.SB_TabClick(Sender: TObject);
begin
     SB_Tab1.BtnDown := False;
     TOnSkinButton(Sender).BtnDown := True;
     if TComponent(Sender).Tag = 1 then
        Tab_Note.ActivePage := '지급항목';
end;

procedure TFM_Main.ED_yearGetImageIndex(Sender: TObject; const ItemIndex: Integer; var idx: Integer);
begin
     idx := 0;
end;

procedure TFM_Main.ED_yearChange(Sender: TObject);
begin
     FG_year := ED_year.KeyItems[ED_year.ItemIndex];

     BT_FindClick(Sender);
end;

procedure TFM_Main.BT_findClick(Sender: TObject);
begin
     SB_Help.Panels[1].Text := '데이타 조회 중입니다... 잠시만 기다리세요...';
     SB_Help.Perform(WM_PAINT,0,0);

     PL_get_pkhphis;
     
     SB_Help.Panels[1].Text := '';
end;

procedure TFM_Main.FormShow(Sender: TObject);
begin
     if FG_empno <> '' then
     begin
          Eaempno.Text := FG_empno;
          Eaempno.PL_get_singledata;
          ED_deptname.ValueCaption := GetDeptName(Eaempno.orgnum, Eaempno.deptcode);
     end;
end;

procedure TFM_Main.EaempnoKeyPress(Sender: TObject; var Key: Char);
begin
     if key = #13 then
     begin
          Eaempno.PL_get_singledata;
          ED_deptname.ValueCaption := GetDeptName(Eaempno.orgnum, Eaempno.deptcode);
          BT_findClick(Sender);
     end;
end;

procedure TFM_Main.DataSource1DataChange(Sender: TObject; Field: TField);
begin
     //Hinsa_Initcomponent(Self,99);
     Hinsa_FieldDisplay(Self, QR_pay, 4, 99);
end;

end.

{
procedure TFM_Main.EaempnoMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
     Hinsa_Initcomponent(Self,99);
     Hinsa_FieldDisplay(Self, QR_pay, 4, 99);
     Eaempno.Text := QR_pay.FieldByName('empno').AsString;
     Eaempno.PL_get_singledata;
end;
}
