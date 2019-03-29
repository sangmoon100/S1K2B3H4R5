unit UPreview;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, quickrpt, ExtCtrls, PeQuickRepPrn, common, Db;

type
  TPreviewForm = class(TForm)
    pequickRepPrn1: TQuickRep;
    PageHeaderBand1: TQRBand;
    A_DetailBand: TQRSubDetail;
    QRL_MSeqno: TQRLabel;
    QRL_DutyLevelName: TQRLabel;
    QRL_PayclName: TQRLabel;
    QRL_DutyDate: TQRLabel;
    QRL_DutyYYMM: TQRLabel;
    QRL_DutyTermrate: TQRLabel;
    PageHeaderBand2: TQRChildBand;
    QRShape10: TQRShape;
    QRShape9: TQRShape;
    QRShape6: TQRShape;
    QRShape3: TQRShape;
    QRLabel11: TQRLabel;
    QRLabel14: TQRLabel;
    QRL_Empno: TQRLabel;
    QRL_Korname: TQRLabel;
    Groupgapband: TQRBand;
    A_GroupHeaderBand: TQRBand;
    QRShape1: TQRShape;
    QRShape53: TQRShape;
    QRShape54: TQRShape;
    QRShape49: TQRShape;
    QRShape47: TQRShape;
    QRShape44: TQRShape;
    QRShape36: TQRShape;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape2: TQRShape;
    QRLabel6: TQRLabel;
    QRL_DutyText: TQRMemo;
    QRL_DutyName: TQRMemo;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape11: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape17: TQRShape;
    QRS_Hor: TQRShape;
    QRShape18: TQRShape;
    QRL_Title: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel1: TQRLabel;
    GroupFooterBand: TQRBand;
    QRS_4: TQRShape;
    QRS_3: TQRShape;
    QRS_2: TQRShape;
    QRS_1: TQRShape;
    QRShape20: TQRShape;
    QRShape16: TQRShape;
    QRShape74: TQRShape;
    QRS_Base: TQRShape;
    QRS_SpecText: TQRShape;
    QRL_SpecText: TQRMemo;
    QRS_SpecTitle: TQRShape;
    QRShape25: TQRShape;
    QRShape12: TQRShape;
    QRLabel45: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel21: TQRLabel;
    QRS_6: TQRShape;
    QRShape24: TQRShape;
    QRLabel23: TQRLabel;
    QRLabel25: TQRLabel;
    QRS_7: TQRShape;
    QRShape27: TQRShape;
    QRLabel26: TQRLabel;
    QRS_8: TQRShape;
    QRShape29: TQRShape;
    QRLabel28: TQRLabel;
    QRS_5: TQRShape;
    QRShape31: TQRShape;
    QRLabel32: TQRLabel;
    QRL_SpecTitle: TQRLabel;
    QRL_EDetNM: TQRMemo;
    QRL_ESkillrate: TQRMemo;
    QRL_EUseYYMM: TQRMemo;
    QRL_PDetNM: TQRMemo;
    QRL_PSkillrate: TQRMemo;
    QRL_PUseYYMM: TQRMemo;
    QRL_PSeqno: TQRMemo;
    QRL_ESeqno: TQRMemo;
    QRLBase1: TQRLabel;
    QRLBase2: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLBase3: TQRLabel;
    QRS_horb: TQRShape;
    procedure PeQuickRepPrn1Preview(Sender: TObject);
    procedure PeQuickRepPrn1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure A_DetailBandNeedData(Sender: TObject; var MoreData: Boolean);
    procedure PageHeaderBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure GroupFooterBandBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
    gOrgnum    : string;
    gDeptcode  : string;
    gCodeno    : string;
    gCut_length: integer;

    gsEmpno     : String;
    gsDutyDate  : String;
    gsDutyno    : String;
    giSeqno     : Integer;

    procedure InitQrLabel(gubun: Integer);
    Procedure GetPageHeader;
  public
    procedure SET_Grid_EqPr(Kind: String);
    { Public declarations }
  end;

var
  PreviewForm: TPreviewForm;

implementation

{$R *.DFM}

uses
  commonDM, UMainForm, PePrnview, datelib, UPitLib, kpaylib;


procedure TPreviewForm.InitQrLabel(gubun: Integer);
var
  i : integer;
begin
    for i := 0 to ComponentCount - 1 do
    begin
        if Components[i] is TQRMemo then
            if TQRMemo(Components[i]).Tag = gubun then
            begin
                TQRMemo(Components[i]).Lines.Clear;
                TQRMemo(Components[i]).Lines.Text := '';
            end;
        if Components[i] is TQRLabel then
            if TQRLabel(Components[i]).Tag = gubun then
            begin
                TQRLabel(Components[i]).Caption := '';
            end;
    end;
end;

procedure TPreviewForm.PeQuickRepPrn1Preview(Sender: TObject);
begin
    Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,PeQuickRepPrn1);
    Fm_PreviewForm.Show;
end;

procedure TPreviewForm.PeQuickRepPrn1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
Var
   value1, value2 : string;
begin
    giSeqno := 0;
    gsEmpno    := '';
    gsDutyDate := '';
    gsDutyno   := '';

    GetPageHeader;
end;

procedure TPreviewForm.GetPageHeader;
var
  Tmp : Tstrings;
  Sqltext : string;
begin
    tmp := TStringList.Create;
    with DM.QCDS do
    begin
        QRL_Title.Caption      := '개인별 직무경력 등록내역';

        QRL_Empno.Caption     := FieldByName('EMPNO').AsString;
        QRL_Korname.Caption   := FieldByName('KORNAME').AsString;
    end;
end;

procedure TPreviewForm.A_DetailBandNeedData(Sender: TObject;
  var MoreData: Boolean);
Var
   sEmpno, sDutyDate, sDutyno: String;
   sTempYYMM, sSysDate: String;
begin
    InitQrLabel(99);

    with DM.QCDS do
    begin
        if EOF then
        begin
            Moredata := False;
            First;
        end
        else
        begin
            sEmpno := FieldByName('EMPNO').AsString;
            if Trim(FieldByName('TODUTYDATE').AsString) = '' then
                sDutyDate := Copy(FieldByName('FRDUTYDATE').AsString,1,4) + '/' + Copy(FieldByName('FRDUTYDATE').AsString,5,2) +'~'+
                             '현재'
            else
                sDutyDate := Copy(FieldByName('FRDUTYDATE').AsString,1,4) + '/' + Copy(FieldByName('FRDUTYDATE').AsString,5,2) +'~'+
                             Copy(FieldByName('TODUTYDATE').AsString,1,4) + '/' + Copy(FieldByName('TODUTYDATE').AsString,5,2) ;
            sDutyno := FieldByName('DUTYNO').AsString;

            if sDutyDate <> gsDutyDate then // All
            begin
                Inc(giSeqno);
                QRS_Hor.Pen.Mode         := pmCopy;

                QRL_MSeqno.Caption       := IntToStr(giSeqno);
                QRL_DutyDate.Caption     := sDutyDate;

                MainForm.fnSetVariable(2);
                if FieldByName('TODUTYDATE').AsString = '' then
                    sTempYYMM := DateCal(FieldByName('FRDUTYDATE').AsString+'01', Copy(MainForm.PSysDate,1,6)+'01')  // datelib
                else
                    sTempYYMM := DateCal(FieldByName('FRDUTYDATE').AsString+'01', FieldByName('TODUTYDATE').AsString+'01'); // datelib
                QRL_DutyYYMM.Caption     := Copy(sTempYYMM,1,2)+'년'+ FormatFloat('00',StrToInt(Copy(sTempYYMM,3,2))+1)+'개월';

                QRL_DutyName.Lines.Text  := FieldByName('DutyName').AsString;
                QRL_DutyTermrate.Caption := FieldByName('DutyTermrate').AsString;
                QRL_DutyText.Lines.Text  := '⊙ ' + FieldByName('DutyText').AsString;
                QRL_DutyLevelName.Caption:= FieldByName('DutyLevelName').AsString;
                QRL_PayclName.Caption    := FieldByName('PayclName').AsString;
            end
            // sDutyDate = gsDutyDate
            else if sDutyno <> gsDutyno then // 연번, 근무기간, 총근무년월 제외
            begin
                QRS_Hor.Pen.Mode         := pmMerge;

                QRL_MSeqno.Caption       := '';
                QRL_DutyDate.Caption     := '';
                QRL_DutyYYMM.Caption     := '';
                QRL_DutyName.Lines.Text  := FieldByName('DutyName').AsString;
                QRL_DutyTermrate.Caption := FieldByName('DutyTermrate').AsString;
                QRL_DutyText.Lines.Text  := '⊙ ' + FieldByName('DutyText').AsString;
                QRL_DutyLevelName.Caption:= FieldByName('DutyLevelName').AsString;
                QRL_PayclName.Caption    := FieldByName('PayclName').AsString;
            end                              // 연번, 근무기간, 총근무년월, 직무, 직무종사기간비중 제외
            // sDutyDate = gsDutyDate
            // sDutyno = gsDutyno then
            else
            begin
                QRS_Hor.Pen.Mode         := pmMerge;

                QRL_MSeqno.Caption       := '';
                QRL_DutyDate.Caption     := '';
                QRL_DutyYYMM.Caption     := '';
                QRL_DutyName.Lines.Text  := '';
                QRL_DutyTermrate.Caption := '';
                QRL_DutyText.Lines.Text  := ' - ' + FieldByName('DutyText').AsString;
                QRL_DutyLevelName.Caption:= '';
                QRL_PayclName.Caption    := '';
            end;

            if (Length(QRL_DutyName.Lines.Text) > 32) or (Length(QRL_DutyText.Lines.Text) > 50) then
                A_DetailBand.Height := QRL_MSeqno.Height * 2 + 2
            else
                A_DetailBand.Height := QRL_MSeqno.Height + 2;

            gsEmpno    := sEmpno;
            gsDutyDate := sDutyDate;
            gsDutyno   := sDutyno;

            Moredata := True;
            DM.QCDS.Next;
        end;
    end;
end;

procedure TPreviewForm.PageHeaderBand1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
//    PageHeaderBand1.Enabled := False;
end;

procedure TPreviewForm.SET_Grid_EqPr(Kind: String);
var
  tmp : TStrings;
  sSQL : String;
  Cnt : integer;
begin
    tmp := TStringList.Create;

    if Kind = 'I711' then
        sSQL:= Format(
               'SELECT                                           '+
               '  b.codeno    mainid   ,  '+
               '  b.codename  mainname ,  '+
               '  c.codeno    subid    ,  '+
               '  c.codename  subname  ,  '+
               '  d.codeno    detid    ,  '+
               '  d.codename  detname  ,  '+
               '  a.skillrate skillrate,  '+
               '  a.useyy     useyy    ,  '+
               '  a.usemm     usemm       '+
               'FROM (select codeno, codename from pishrcode where codeid = ''I711'') b, '+
               '     (select codeno, codename from pishrcode where codeid = ''I711'') c, '+
               '     (select codeno, codename from pishrcode where codeid = ''I711'') d, '+
               '     pishreqip a                         '+
               'WHERE a.empno = ''%s''                   '+
               '  AND substr(a.eqipcode,1,3) =  b.codeno '+
               '  AND substr(a.eqipcode,1,6) =  c.codeno '+
               '  AND a.eqipcode             =  d.codeno '+
               'ORDER BY a.skillrate desc, d.codeno      ',[MainForm.pEmpno])
    else
        sSQL:= Format(
               'SELECT                                           '+
               '  b.codeno    mainid   ,  '+
               '  b.codename  mainname ,  '+
               '  c.codeno    subid    ,  '+
               '  c.codename  subname  ,  '+
               '  d.codeno    detid    ,  '+
               '  d.codename  detname  ,  '+
               '  a.skillrate skillrate,  '+
               '  a.useyy     useyy    ,  '+
               '  a.usemm     usemm       '+
               'FROM (select codeno, codename from pishrcode where codeid = ''I713'') b, '+
               '     (select codeno, codename from pishrcode where codeid = ''I713'') c, '+
               '     (select codeno, codename from pishrcode where codeid = ''I713'') d, '+
               '     pishrprog a                         '+
               'WHERE a.empno = ''%s''                   '+
               '  AND substr(a.progcode,1,2) =  b.codeno '+
               '  AND substr(a.progcode,1,5) =  c.codeno '+
               '  AND a.progcode             =  d.codeno '+
               'ORDER BY a.skillrate desc, d.codeno      ',[MainForm.pEmpno]);

    With DM.QCODE do
    begin
        Close;
        Sql.Clear;
        Sql.Text := sSQL;

      try
        Open;
      except
        Close;
        Messagedlg(' DataBase Engine Error ' + #13+ #13+ ' --> 시스템 관리자에게 연락하세요!',mtError,[mbOK],0);
        System.Exit;
      end;

        Cnt := 1;
        while not Eof do
        begin
            if Cnt <= 25 then
            begin
                if Kind = 'I711' then
                begin
                    QRL_ESeqno.Lines.Add(IntToStr(Cnt));
                    QRL_EDetNM.Lines.Add(FieldByName('DETNAME').AsString);
                    QRL_ESkillrate.Lines.Add(FieldByName('SKILLRATE').AsString);
                    QRL_EUseYYMM.Lines.Add(FieldByName('USEYY').AsString+'년 '+FieldByName('USEMM').AsString+'개월');
                end
                else
                begin
                    QRL_PSeqno.Lines.Add(IntToStr(Cnt));
                    QRL_PDetNM.Lines.Add(FieldByName('DETNAME').AsString);
                    QRL_PSkillrate.Lines.Add(FieldByName('SKILLRATE').AsString);
                    QRL_PUseYYMM.Lines.Add(FieldByName('USEYY').AsString+'년 '+FieldByName('USEMM').AsString+'개월');
                end;

                Inc(Cnt);
                Next;
            end
            else
                Break;
        end;
        Close;
    end;
end;

procedure TPreviewForm.GroupFooterBandBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  iMaxLines: Integer;
  sSQL: String;
begin
    InitQrLabel(77);

    SET_Grid_EqPr('I711');
    SET_Grid_EqPr('I713');

    QRL_SpecText.Lines.Clear;
    sSQL := Format(
          'SELECT spectext FROM pishrspec  ' +
          'WHERE empno = ''%s''      ' ,
          [MainForm.Pempno]);

    with DM.Csel do
    begin
        Close;
        Sql.Clear;
        Sql.Text := sSQL;
        Open;

        //QRL_SpecText.Lines.Add(replace(Fields[0].AsString,#$D#$A,);
        QRL_SpecText.Lines.Add(kpaylib.replace(Fields[0].AsString, #10#10, #13#10));
        Close;
    end;

    iMaxLines := 0;

    if QRL_ESeqno.Lines.Count > QRL_PSeqno.Lines.Count then
        iMaxLines := QRL_ESeqno.Lines.Count
    else
        iMaxLines := QRL_PSeqno.Lines.Count;

    if iMaxLines < 4 then
        iMaxLines := 3;

    QRS_1.Height := QRLBase1.Height * iMaxLines +  2;
    QRS_2.Height := QRLBase1.Height * iMaxLines +  2;
    QRS_3.Height := QRLBase1.Height * iMaxLines +  2;
    QRS_4.Height := QRLBase1.Height * iMaxLines +  2;
    QRS_5.Height := QRLBase1.Height * iMaxLines +  2;
    QRS_6.Height := QRLBase1.Height * iMaxLines +  2;
    QRS_7.Height := QRLBase1.Height * iMaxLines +  2;
    QRS_8.Height := QRLBase1.Height * iMaxLines +  2;

    GroupFooterBand.Height := QRS_1.Top + QRS_1.Height + QRLBase1.Height + 4;
    QRS_SpecTitle.Top  := QRS_1.Top + QRS_1.Height + QRLBase3.Height;
    QRS_SpecText.Top   := QRS_1.Top + QRS_1.Height + QRLBase3.Height;
    QRL_SpecTitle.Top  := QRS_SpecTitle.Top + ((QRS_SpecTitle.Height div 2) - (QRL_SpecTitle.Height div 2));
    QRL_SpecText.Top   := QRS_SpecText.Top  + 4;
end;

end.

