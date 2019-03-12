unit UPreview3;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, TuxLib;

type
  TRptPerDetail = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRL_Title: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel14: TQRLabel;
    L_Page: TQRLabel;
    QRShape23: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRLabel28: TQRLabel;
    QRLabel18: TQRLabel;
    L_Korname: TQRLabel;
    L_Empno: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRS_Detail1_hor: TQRShape;
    QRL_Seqno: TQRLabel;
    QRL_FrDutydate: TQRLabel;
    QRShape14: TQRShape;
    QRShape53: TQRShape;
    QRShape55: TQRShape;
    QRShape56: TQRShape;
    QRShape57: TQRShape;
    QRShape58: TQRShape;
    QRS_Detail1_ver: TQRShape;
    QRL_DutyKindName: TQRMemo;
    QRL_DutyName: TQRMemo;
    QRL_DutyTermRate: TQRMemo;
    QRL_DutyYYMM: TQRMemo;
    QRShape54: TQRShape;
    QRL_DutyText: TQRMemo;
    QRShape59: TQRShape;
    QRL_DutyLevelName: TQRMemo;
    QRShape1: TQRShape;
    PageHeaderBand2: TQRChildBand;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    L_Deptname: TQRLabel;
    L_PayRaname: TQRLabel;
    L_PayClname: TQRLabel;
    L_JobGunname: TQRLabel;
    L_Sexname: TQRLabel;
    L_Toeicscore: TQRLabel;
    QRShape28: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRLabel27: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    L_schgr1: TQRLabel;
    L_schnm1: TQRLabel;
    L_majornm1: TQRLabel;
    L_schfrym1: TQRLabel;
    L_schgr2: TQRLabel;
    L_schnm2: TQRLabel;
    L_majornm2: TQRLabel;
    L_schfrym2: TQRLabel;
    L_schgr3: TQRLabel;
    L_schnm3: TQRLabel;
    L_majornm3: TQRLabel;
    L_schfrym3: TQRLabel;
    L_schgr4: TQRLabel;
    L_schnm4: TQRLabel;
    L_majornm4: TQRLabel;
    L_schfrym4: TQRLabel;
    L_schgr5: TQRLabel;
    L_schnm5: TQRLabel;
    L_majornm5: TQRLabel;
    L_schfrym5: TQRLabel;
    L_schgr6: TQRLabel;
    L_schnm6: TQRLabel;
    L_majornm6: TQRLabel;
    L_schfrym6: TQRLabel;
    QRShape89: TQRShape;
    L_Empdate: TQRLabel;
    QRLabel77: TQRLabel;
    L_schgr7: TQRLabel;
    L_schnm7: TQRLabel;
    L_majornm7: TQRLabel;
    L_schfrym7: TQRLabel;
    QRShape31: TQRShape;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel37: TQRLabel;
    L_carplace1: TQRLabel;
    L_carjobnm1: TQRLabel;
    L_carfrdate1: TQRLabel;
    L_carplace2: TQRLabel;
    L_carjobnm2: TQRLabel;
    L_carfrdate2: TQRLabel;
    L_carplace3: TQRLabel;
    L_carjobnm3: TQRLabel;
    L_carfrdate3: TQRLabel;
    L_carplace4: TQRLabel;
    L_carjobnm4: TQRLabel;
    L_carfrdate4: TQRLabel;
    L_carplace5: TQRLabel;
    L_carjobnm5: TQRLabel;
    L_carfrdate5: TQRLabel;
    L_carplace6: TQRLabel;
    L_carjobnm6: TQRLabel;
    L_carfrdate6: TQRLabel;
    L_carplace7: TQRLabel;
    L_carjobnm7: TQRLabel;
    L_carfrdate7: TQRLabel;
    PageHeaderBand3: TQRChildBand;
    QRLabel1: TQRLabel;
    QRShape106: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel23: TQRLabel;
    QRShape107: TQRShape;
    QRShape108: TQRShape;
    QRShape110: TQRShape;
    QRShape111: TQRShape;
    QRShape112: TQRShape;
    QRLabel43: TQRLabel;
    QRShape113: TQRShape;
    QRLabel3: TQRLabel;
    QRShape109: TQRShape;
    QRShape105: TQRShape;
    QRSubDetail3: TQRChildBand;
    QRS_Detail3_hor1: TQRShape;
    QRShape77: TQRShape;
    QRShape78: TQRShape;
    QRShape79: TQRShape;
    QRShape102: TQRShape;
    QRShape69: TQRShape;
    QRLabel97: TQRLabel;
    QRLabel100: TQRLabel;
    QRLabel101: TQRLabel;
    QRShape72: TQRShape;
    QRShape74: TQRShape;
    QRShape75: TQRShape;
    QRLabel103: TQRLabel;
    QRLabel104: TQRLabel;
    QRShape80: TQRShape;
    QRL_Sseqno: TQRMemo;
    QRL_SEduName: TQRMemo;
    QRL_SPointName: TQRMemo;
    QRL_SEdufrdate: TQRMemo;
    QRS_Detail3_hor2: TQRShape;
    QRShape83: TQRShape;
    QRShape84: TQRShape;
    QRShape85: TQRShape;
    QRShape88: TQRShape;
    QRShape103: TQRShape;
    QRShape104: TQRShape;
    QRShape70: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel83: TQRLabel;
    QRLabel84: TQRLabel;
    QRShape76: TQRShape;
    QRShape81: TQRShape;
    QRShape82: TQRShape;
    QRLabel85: TQRLabel;
    QRLabel87: TQRLabel;
    QRShape86: TQRShape;
    QRShape87: TQRShape;
    QRLabel96: TQRLabel;
    QRL_LSeqno: TQRMemo;
    QRL_LLicename: TQRMemo;
    QRL_Licrank: TQRMemo;
    QRL_LLicGetDate: TQRMemo;
    QRL_LLicalfield: TQRMemo;
    QRS_Detail3_ver1: TQRShape;
    QRSubDetail4: TQRChildBand;
    QRShape5: TQRShape;
    QRShape39: TQRShape;
    QRLabel10: TQRLabel;
    QRL_SpecText: TQRLabel;
    QRSubDetail2: TQRBand;
    QRS_Detail2_hor1: TQRShape;
    QRShape4: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape10: TQRShape;
    QRShape13: TQRShape;
    QRShape49: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel78: TQRLabel;
    QRLabel79: TQRLabel;
    QRLabel80: TQRLabel;
    QRShape40: TQRShape;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    QRShape43: TQRShape;
    QRLabel81: TQRLabel;
    QRLabel82: TQRLabel;
    QRShape44: TQRShape;
    QRL_ESeqno: TQRMemo;
    QRL_ESubName: TQRMemo;
    QRL_EDetName: TQRMemo;
    QRL_ESkillrate: TQRMemo;
    QRL_EUseYYMM: TQRMemo;
    QRS_Detail2_hor2: TQRShape;
    QRShape15: TQRShape;
    QRShape52: TQRShape;
    QRShape98: TQRShape;
    QRShape99: TQRShape;
    QRShape100: TQRShape;
    QRShape101: TQRShape;
    QRShape51: TQRShape;
    QRLabel11: TQRLabel;
    QRShape61: TQRShape;
    QRLabel88: TQRLabel;
    QRLabel89: TQRLabel;
    QRLabel90: TQRLabel;
    QRShape50: TQRShape;
    QRShape62: TQRShape;
    QRShape63: TQRShape;
    QRShape64: TQRShape;
    QRLabel91: TQRLabel;
    QRLabel92: TQRLabel;
    QRL_PSeqno: TQRMemo;
    QRL_PSubName: TQRMemo;
    QRL_PDetName: TQRMemo;
    QRL_PSkillrate: TQRMemo;
    QRL_PUseYYMM: TQRMemo;
    QRS_Detail2_ver1: TQRShape;
    QRShape3: TQRShape;
    QRSysData1: TQRSysData;
    procedure RptPerDetailBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure RptPerDetailPreview(Sender: TObject);
    procedure RptPerDetailNeedData(Sender: TObject; var MoreData: Boolean);
    procedure PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail1NeedData(Sender: TObject; var MoreData: Boolean);
    procedure QRSubDetail4AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure PageHeaderBand2AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure PageHeaderBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
     giSeqno: Integer;
     gsEmpTemp, gsEmpno: String;
     gvTemp : OleVariant;
     gbDetailExt, gbDetailCont: Boolean;
     giNewEmp : Integer;
     procedure fzInitial;
     procedure fzInitialize(mTag: Integer);
     function  fnDateFormat(mSrcDate: String): String;
     procedure fzSetPageHeader;
     procedure fzSetDetails(mTag, mHeight: Integer);
     procedure fzSetDetail2;
     procedure fzSetDetail3;
     procedure fzSetDetail4;
  end;

var
  RptPerDetail: TRptPerDetail;

implementation

{$R *.DFM}

uses
  pit203000, peprnView;

function TRptPerDetail.fnDateFormat(mSrcDate: String): String;
var
  i: Integer;
  sDate: String[10];
begin
  Result := '';

  if length(mSrcDate) >= 6 then
    Result := copy(mSrcDate,1,4) + '.' + copy(mSrcDate,5,2);
  if length(mSrcDate) = 8 then
    Result := Result + '.' + copy(mSrcDate,7,2);
end;

procedure TRptPerDetail.fzSetDetails(mTag, mHeight: Integer);
var
  i, iH: Integer;
begin
  if mTag = 111 then
    iH := 10
  else
    iH := 16;
  for i := 0 to ComponentCount -1 do
  begin
    if TControl(Components[i]).Tag = mTag then
    begin
      if Components[i] is TQRShape then
        TControl(Components[i]).Height := (mHeight)*iH +9;
      if Components[i] is TQRMemo then
        TControl(Components[i]).Height := (mHeight)*iH;
    end;
  end;
end;

procedure TRptPerDetail.fzInitialize(mTag: Integer);
var
  i: Integer;
begin
  for i := 0 to ComponentCount -1 do
  begin
    if TControl(Components[i]).Tag = mTag then
    begin
      if Components[i] is TQRLabel then
        TQRLabel(Components[i]).Caption := '';
      if Components[i] is TQRMemo then
        TQRMemo(Components[i]).Lines.Clear;
    end;
  end;
end;

procedure TRptPerDetail.RptPerDetailBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  gbDetailExt := True;
  fzInitial;
end;

procedure TRptPerDetail.fzInitial;
begin
  fzInitialize(11);
  fzInitialize(88);
  fzInitialize(99);
  fzInitialize(111);
  fzInitialize(222);
  fzInitialize(333);
  fzInitialize(444);
end;

procedure TRptPerDetail.RptPerDetailPreview(Sender: TObject);
begin
  Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,RptPerDetail);
  Fm_PreviewForm.Show;
end;

procedure TRptPerDetail.RptPerDetailNeedData(Sender: TObject;
  var MoreData: Boolean);
var
  ParamVariant: String;
  Q_field: TQRLabel;
  i: Integer;
begin
  with MainForm.TMain do
  begin
    if EOF then
    begin
      MoreData := False;
      First;
    end
    else
    begin
      giNewEmp:= 0;
      giSeqno := 0;
      L_Page.Caption := '0';
      PageHeaderBand2.Enabled := True;
      PageHeaderBand3.Enabled := True;
      gsEmpno := FieldByName('EMPNO').AsString;
      gvTemp  := gsEmpno;

      //MainForm.fzOpenDataSets_Det(2, ''''+gsEmpno+'''');
      fzSetPageHeader;

      MainForm.TDuty.First;
      if MainForm.TDuty.Locate('EMPNO',  VararrayOf([gvTemp]), [loCaseInsensitive]) then
        gbDetailCont := True
      else
        gbDetailCont := False;

      MoreData := True;
      Next;
    end;
  end;
end;

procedure TRptPerDetail.fzSetPageHeader;
var
  Q_field: TQRLabel;
  i: Integer;
begin
  with MainForm.TMain do
  begin
    L_Korname.Caption     := FieldByName('KORNAME').AsString;
    L_empno.Caption       := FieldByName('EMPNO').AsString;
    L_Deptname.Caption    := FieldByName('DEPTNAME').AsString;
    L_PayRaname.Caption   := FieldByName('PAYRANAME').AsString;
    if MainForm.PayraChdate > MainForm.P_sysdate then
       L_PayClname.Caption   := FieldByName('IMASPAYCLNAME').AsString
    else
       L_PayClname.Caption   := '';
    L_JobGunname.Caption  := FieldByName('JOBGUNNAME').AsString;
    L_Empdate.Caption     := fnDateFormat(FieldByName('EMPDATE').AsString);
    L_SexName.Caption     := FieldByName('SEX').AsString;
    L_ToeicScore.Caption  := FieldByName('TOEICSCORE').AsString;
  end;

  fzInitialize(88);

  i := 1;
  //MainForm.fzOpenDataSets_Det(7, ''''+gsEmpno+'''');
  with MainForm.TSCH do
  begin
    First;
    if Locate('EMPNO', VararrayOf([gvTemp]), [loCaseInsensitive]) then
    begin
      while (not EOF) and (gsEmpno = FieldByName('EMPNO').AsString) and (i < 8) do
      begin
        Q_field := Self.FindComponent('L_schgr'+IntToStr(i)) as TQRLabel;
        Q_field.Caption := FieldByName('SCHGRNAME').AsString;
        Q_field := Self.FindComponent('L_schnm'+IntToStr(i)) as TQRLabel;
        Q_field.Caption := FieldByName('SCHNM').AsString;
        Q_field := Self.FindComponent('L_majornm'+IntToStr(i)) as TQRLabel;
        Q_field.Caption := FieldByName('MAJORNAME').AsString;
        Q_field := Self.FindComponent('L_schfrym'+IntToStr(i)) as TQRLabel;
        Q_field.Caption := fnDateFormat(copy(FieldByName('SCHFRYM').AsString,1,6))+'~'+
                           fnDateFormat(copy(FieldByName('SCHTOYM').AsString,1,6));

        Inc(i);
        Next;
      end;
    end;
  end;

  i := 1;
  //MainForm.fzOpenDataSets_Det(8, ''''+gsEmpno+'''');
  with MainForm.TCARR do
  begin
    First;
    if Locate('EMPNO', VararrayOf([gvTemp]), [loCaseInsensitive]) then
    begin
      while (not EOF) and (gsEmpno = FieldByName('EMPNO').AsString) and (i < 8) do
      begin
        Q_field := Self.FindComponent('L_carplace'+IntToStr(i)) as TQRLabel;
        Q_field.Caption := FieldByName('CARPLACE').AsString;
        Q_field := Self.FindComponent('L_carjobnm'+IntToStr(i)) as TQRLabel;
        Q_field.Caption := FieldByName('CARJOBNM').AsString;
        Q_field := Self.FindComponent('L_carfrdate'+IntToStr(i)) as TQRLabel;
        Q_field.Caption := fnDateFormat(FieldByName('CARFRDATE').AsString)+'~'+
                           fnDateFormat(FieldByName('CARTODATE').AsString);

        Inc(i);
        Next;
      end;
    end;
  end;
end;

procedure TRptPerDetail.QRSubDetail1NeedData(Sender: TObject;
  var MoreData: Boolean);
var
  sFrDutyDate, sDutyno: String;
  iMax: Integer;
begin
  iMax := 1;
  if not gbDetailCont then
  begin
    MoreData := False
  end
  else
  begin
    with MainForm.TDuty do
    begin
      gbDetailCont := False;
      MoreData     := False;

      sFrDutyDate := FieldByName('FRDUTYDATE').AsString;
      sDutyno     := '';
      PageHeaderBand3.Enabled := True;
      while (not EOF) and (gsEmpno = FieldByName('EMPNO').AsString) do
      begin
        gbDetailCont := True;
        MoreData     := True;

        if (sFrDutyDate <> FieldByName('FRDUTYDATE').AsString) then
          Break;

        if iMax = 1 then
        begin
          Inc(giSeqno);
          QRL_Seqno.Caption           := IntToStr(giSeqno);
          QRL_FrDutydate.Caption      := fnDateFormat(FieldByName('FRDUTYDATE').AsString)+' ~ '+
                                         fnDateFormat(FieldByName('TODUTYDATE').AsString);
          QRL_DutyTermRate.Lines.Text := FieldByName('DUTYTERMRATE').AsString+'%';
          QRL_DutyYYMM.Lines.Text     := Format('%2d년%2d개월',[FieldByName('DUTYYYMM').AsInteger div 12,
                                                                FieldByName('DUTYYYMM').AsInteger mod 12]);
          QRL_DutyKindName.Lines.Text := FieldByName('DUTYKINDNAME').AsString;
          QRL_DutyName.Lines.Text     := FieldByName('DUTYNAME').AsString;
          QRL_DutyText.Lines.Text     := '⊙ ' + FieldByName('DUTYTEXT').AsString;
          QRL_DutyLevelName.Lines.Text:= FieldByName('DUTYLEVELNAME').AsString;
        end
        else
        if sDutyno <> FieldByName('DUTYNO').AsString then
        begin
          //Inc(giSeqno);
          //QRL_Seqno.Caption          := IntToStr(giSeqno);
          //QRL_FrDutydate.Caption     := fnDateFormat(FieldByName('FRDUTYDATE').AsString)+' ~ '+
          //                              fnDateFormat(FieldByName('TODUTYDATE').AsString);
          QRL_DutyTermRate.Lines.Text := QRL_DutyTermRate.Lines.Text  +#13+ FieldByName('DUTYTERMRATE').AsString+'%';
          QRL_DutyYYMM.Lines.Text     := QRL_DutyYYMM.Lines.Text      +#13+ Format('%2d년%2d개월',[FieldByName('DUTYYYMM').AsInteger div 12,
                                                                                                   FieldByName('DUTYYYMM').AsInteger mod 12]);
          QRL_DutyKindName.Lines.Text := QRL_DutyKindName.Lines.Text  +#13+ FieldByName('DUTYKINDNAME').AsString;
          QRL_DutyName.Lines.Text     := QRL_DutyName.Lines.Text      +#13+ FieldByName('DUTYNAME').AsString;
          QRL_DutyText.Lines.Text     := QRL_DutyText.Lines.Text      +#13+ '⊙ ' + FieldByName('DUTYTEXT').AsString;
          QRL_DutyLevelName.Lines.Text:= QRL_DutyLevelName.Lines.Text +#13+ FieldByName('DUTYLEVELNAME').AsString;
        end
        else
        begin
          QRL_DutyTermRate.Lines.Text := QRL_DutyTermRate.Lines.Text  +#13+ '';
          QRL_DutyYYMM.Lines.Text     := QRL_DutyYYMM.Lines.Text      +#13+ '';
          QRL_DutyKindName.Lines.Text := QRL_DutyKindName.Lines.Text  +#13+ '';
          QRL_DutyName.Lines.Text     := QRL_DutyName.Lines.Text      +#13+ '';
          //QRL_DutyText.Lines.Add(Text     := QRL_DutyText.Lines.Text      +'- ' + FieldByName('DUTYTEXT').AsString;
          QRL_DutyText.Lines.Add(' - ' + FieldByName('DUTYTEXT').AsString);
          QRL_DutyLevelName.Lines.Text:= QRL_DutyLevelName.Lines.Text +#13+ '';
        end;
        sFrDutyDate := FieldByName('FRDUTYDATE').AsString;
        sDutyno     := FieldByName('DUTYNO').AsString;

        Inc(iMax);
        Next;
        giNewEmp := 1;
      end;

      fzSetDetails(111, iMax);
      QRS_Detail1_hor.Top := QRS_Detail1_ver.Top + QRS_Detail1_ver.Height;
      QRSubDetail1.Height := QRS_Detail1_ver.Top + QRS_Detail1_ver.Height + 2;

      if (EOF) or (gsEmpno <> FieldByName('EMPNO').AsString) then
      begin
        if (giNewEmp = 1) then
        begin
          giNewEmp:=2;
          fzSetDetail2;
        end;
      end;
    end;
  end;
end;

procedure TRptPerDetail.fzSetDetail2;
var
  i, iMax: Integer;
begin
  iMax := 1;

  fzInitialize(222);
  i := 1;
  with MainForm.TEqip do
  begin
    //if not EOF then
    First;
    if Locate('EMPNO', VararrayOf([gvTemp]), [loCaseInsensitive]) then
    begin
      while (not EOF) and (gsEmpno = FieldByName('EMPNO').AsString) do
      begin
        QRL_ESeqno.Lines.Add(IntToStr(i));
        QRL_ESubName.Lines.Add(FieldByName('SUBNAME').AsString);
        QRL_EDetName.Lines.Add(FieldByName('EQIPNAME').AsString);
        QRL_ESkillrate.Lines.Add(FieldByName('SKILLRATE').AsString);
        QRL_EUseYYMM.Lines.Add(Format('%s년 %s개월',[FieldByName('USEYY').AsString,
                                                     FieldByName('USEMM').AsString]));

        Inc(i);
        Next;
      end;
    end;
  end;
  iMax := i;

  i := 1;
  with MainForm.TProg do
  begin
    //if not EOF then
    First;
    if Locate('EMPNO', VararrayOf([gvTemp]), [loCaseInsensitive]) then
    begin
      while (not EOF) and (gsEmpno = FieldByName('EMPNO').AsString) do
      begin
        QRL_PSeqno.Lines.Add(IntToStr(i));
        QRL_PSubName.Lines.Add(FieldByName('SUBNAME').AsString);
        QRL_PDetName.Lines.Add(FieldByName('PROGNAME').AsString);
        QRL_PSkillrate.Lines.Add(FieldByName('SKILLRATE').AsString);
        QRL_PUseYYMM.Lines.Add(Format('%s년 %s개월',[FieldByName('USEYY').AsString,
                                                     FieldByName('USEMM').AsString]));

        Inc(i);
        Next;
      end;
    end;
  end;

  if (iMax < i) then iMax := i;
  if iMax > 1 then Dec(iMax);
  fzSetDetails(222, iMax);
  QRS_Detail2_hor1.Top := QRS_Detail2_ver1.Top + QRS_Detail2_ver1.Height;
  QRS_Detail2_hor2.Top := QRS_Detail2_ver1.Top + QRS_Detail2_ver1.Height;
  QRSubDetail2.Height  := QRS_Detail2_hor1.Top + 5;

  fzSetDetail3;
end;

procedure TRptPerDetail.fzSetDetail3;
var
  i, iMax: Integer;
begin
  iMax := 1;

  fzInitialize(333);
  i := 1;
  with MainForm.TLice do
  begin
    //if not EOF then
    First;
    if Locate('EMPNO', VararrayOf([gvTemp]), [loCaseInsensitive]) then
    begin
      while (not EOF) and (gsEmpno = FieldByName('EMPNO').AsString) do
      begin
        QRL_LSeqno.Lines.Add(IntToStr(i));
        QRL_LLicename.Lines.Add(FieldByName('LICENAME').AsString);
        QRL_Licrank.Lines.Add(FieldByName('LICRANK').AsString);
        QRL_LLicGetDate.Lines.Add(fnDateFormat(FieldByName('LICGETDATE').AsString));
        QRL_LLicalfield.Lines.Add(FieldByName('LICALFIELD').AsString);

        Inc(i);
        Next;
      end;
    end
    else
    begin
      QRL_LSeqno.Lines.Text := '';
      QRL_LLicename.Lines.Text := '';
      QRL_Licrank.Lines.Text := '';
      QRL_LLicGetDate.Lines.Text := '';
      QRL_LLicalfield.Lines.Text := '';
    end;
  end;
  iMax := i;

  i := 1;
  with MainForm.TEdu do
  begin
    //if not EOF then
    First;
    if Locate('EMPNO', VararrayOf([gvTemp]), [loCaseInsensitive]) then
    begin
      while (not EOF) and (gsEmpno = FieldByName('EMPNO').AsString) do
      begin
        QRL_Sseqno.Lines.Add(IntToStr(i));
        QRL_SEduName.Lines.Add(FieldByName('CURRNAME').AsString);
        QRL_SPointName.Lines.Add(FieldByName('POINTNAME').AsString);
        QRL_SEdufrdate.Lines.Add(fnDateFormat(FieldByName('EDUFRDATE').AsString)+'~'+
                                 fnDateFormat(FieldByName('EDUTODATE').AsString));

        Inc(i);
        Next;
      end;
    end
    else
    begin
      QRL_Sseqno.Lines.Text := '';
      QRL_SEduName.Lines.Text := '';
      QRL_SPointName.Lines.Text := '';
      QRL_SEdufrdate.Lines.Text := '';
    end;
  end;

  if (iMax < i) then iMax := i;
  if iMax > 1 then Dec(iMax);

  fzSetDetails(333, iMax);
  QRS_Detail3_hor1.Top := QRS_Detail3_ver1.Top + QRS_Detail3_ver1.Height;
  QRS_Detail3_hor2.Top := QRS_Detail3_ver1.Top + QRS_Detail3_ver1.Height;
  QRSubDetail3.Height  := QRS_Detail3_hor1.Top + 5;

  fzSetDetail4;
end;

procedure TRptPerDetail.fzSetDetail4;
begin
  fzInitialize(444);
  with MainForm.TETC do
  begin
    First;
    if Locate('EMPNO', VararrayOf([gvTemp]), [loCaseInsensitive]) then
      QRL_SpecText.Lines.Add(MainForm.TETC.FieldByName('SPECTEXT').AsString)
  end;
end;

procedure TRptPerDetail.PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  L_Page.Caption := IntToStr(StrToIntDef(L_Page.Caption,0)+1);
end;

procedure TRptPerDetail.PageHeaderBand1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  if (giNewEmp > 1) then
  begin
    giNewEmp := 0;
    PageHeaderBand3.Enabled := False;
  end;
end;

procedure TRptPerDetail.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  giNewEmp := 1;
    PageHeaderBand3.Enabled := true;
end;

procedure TRptPerDetail.QRSubDetail4AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  if not MainForm.TMain.EOF then
  begin
    EndPage;
    PageHeaderBand2.Enabled := True;
    PageHeaderBand3.Enabled := True;
    fzInitial;
  end;
end;

procedure TRptPerDetail.PageHeaderBand2AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  PageHeaderBand2.Enabled := False;
end;


end.


