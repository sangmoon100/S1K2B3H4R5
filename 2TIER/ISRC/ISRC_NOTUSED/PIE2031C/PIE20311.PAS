unit pie20311;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, E2031c;

type
  TFpie20311 = class(TForm)
    Inreport: TQuickRep;
    QRBand_Header: TQRBand;
    QRShape84: TQRShape;
    QRShape10: TQRShape;
    QRLabel13: TQRLabel;
    QRLabel4: TQRLabel;
    QRL_curdate: TQRLabel;
    QRLabel7: TQRLabel;
    QRL_WorkDate: TQRLabel;
    QRShape50: TQRShape;
    QRShape51: TQRShape;
    QRShape63: TQRShape;
    QRShape64: TQRShape;
    QRLabel19: TQRLabel;
    QRShape66: TQRShape;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRShape67: TQRShape;
    QRShape1: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape55: TQRShape;
    QRShape56: TQRShape;
    QRShape57: TQRShape;
    QRShape58: TQRShape;
    QRShape59: TQRShape;
    QRShape60: TQRShape;
    QRShape61: TQRShape;
    QRShape62: TQRShape;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRLabel8: TQRLabel;
    QRShape9: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRShape11: TQRShape;
    QRBand_Detail: TQRBand;
    QRL_technique: TQRLabel;
    QRShape31: TQRShape;
    QRL_ppos1: TQRLabel;
    QRShape17: TQRShape;
    QRShape_1: TQRShape;
    QRL_ppos2: TQRLabel;
    QRL_ppos3: TQRLabel;
    QRL_ppos4: TQRLabel;
    QRL_ppos5: TQRLabel;
    QRL_ppos6: TQRLabel;
    QRL_ppos7: TQRLabel;
    QRL_ppos8: TQRLabel;
    QRL_ppos9: TQRLabel;
    QRL_pspe: TQRLabel;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape27: TQRShape;
    QRL_ptemp: TQRLabel;
    QRShape28: TQRShape;
    QRShape33: TQRShape;
    QRL_pcont: TQRLabel;
    QRShape21: TQRShape;
    QRShape26: TQRShape;
    QRBand1: TQRBand;
    QRShape29: TQRShape;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRLabel15: TQRLabel;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRShape40: TQRShape;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRShape42: TQRShape;
    QRShape53: TQRShape;
    QRShape54: TQRShape;
    QRShape65: TQRShape;
    QRShape68: TQRShape;
    QRShape43: TQRShape;
    QRShape69: TQRShape;
    QRShape70: TQRShape;
    QRShape71: TQRShape;
    QRShape72: TQRShape;
    QRShape41: TQRShape;
    QRShape44: TQRShape;
    QRShape47: TQRShape;
    QRShape48: TQRShape;
    QRShape52: TQRShape;
    QRLabel25: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel39: TQRLabel;
    QRShape73: TQRShape;
    QRShape74: TQRShape;
    QRShape75: TQRShape;
    QRShape76: TQRShape;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel65: TQRLabel;
    QRLabel66: TQRLabel;
    QRLabel67: TQRLabel;
    QRLabel68: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    QRLabel72: TQRLabel;
    QRLabel74: TQRLabel;
    QRLabel75: TQRLabel;
    QRLabel77: TQRLabel;
    QRLabel78: TQRLabel;
    QRLabel79: TQRLabel;
    QRLabel80: TQRLabel;
    QRLabel81: TQRLabel;
    QRLabel83: TQRLabel;
    QRLabel84: TQRLabel;
    QRLabel85: TQRLabel;
    QRLabel86: TQRLabel;
    QRLabel87: TQRLabel;
    QRLabel88: TQRLabel;
    QRLabel89: TQRLabel;
    QRLabel90: TQRLabel;
    QRLabel91: TQRLabel;
    QRLabel94: TQRLabel;
    QRLabel95: TQRLabel;
    QRLabel96: TQRLabel;
    QRLabel97: TQRLabel;
    QRLabel100: TQRLabel;
    QRLabel101: TQRLabel;
    QRLabel104: TQRLabel;
    QRLabel105: TQRLabel;
    QRLabel106: TQRLabel;
    QRLabel107: TQRLabel;
    QRLabel108: TQRLabel;
    QRLabel110: TQRLabel;
    QRLabel113: TQRLabel;
    QRLabel115: TQRLabel;
    QRLabel116: TQRLabel;
    QRLabel117: TQRLabel;
    QRLabel118: TQRLabel;
    QRShape2: TQRShape;
    QRShape12: TQRShape;
    QRLabel56: TQRLabel;
    QRLabel59: TQRLabel;
    QRShape22: TQRShape;
    QRLabel64: TQRLabel;
    QRLabel98: TQRLabel;
    QRLabel114: TQRLabel;
    QRLabel123: TQRLabel;
    QRLabel125: TQRLabel;
    QRLabel126: TQRLabel;
    QRLabel127: TQRLabel;
    QRLabel128: TQRLabel;
    QRLabel129: TQRLabel;
    QRLabel102: TQRLabel;
    QRLabel103: TQRLabel;
    QRLabel111: TQRLabel;
    QRLabel131: TQRLabel;
    QRLabel132: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel134: TQRLabel;
    QRLabel135: TQRLabel;
    QRLabel136: TQRLabel;
    QRLabel137: TQRLabel;
    QRLabel138: TQRLabel;
    QRShape49: TQRShape;
    QRShape77: TQRShape;
    QRL_pscon: TQRLabel;
    QRLabel139: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel140: TQRLabel;
    QRLabel133: TQRLabel;
    C: TQRShape;
    QRL_pemp: TQRLabel;
    QRShape79: TQRShape;
    QRShape80: TQRShape;
    QRShape81: TQRShape;
    QRL_pratio: TQRLabel;
    QRLabel12: TQRLabel;
    QRL_ptotcnt: TQRLabel;
    QRL_ptotratio: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel82: TQRLabel;
    QRLabel130: TQRLabel;
    QRShape82: TQRShape;
    QRLabel124: TQRLabel;
    QRLabel141: TQRLabel;
    QRLabel142: TQRLabel;
    QRLabel143: TQRLabel;
    QRLabel144: TQRLabel;
    QRLabel145: TQRLabel;
    QRLabel146: TQRLabel;
    QRLabel147: TQRLabel;
    QRLabel148: TQRLabel;
    QRLabel149: TQRLabel;
    QRLabel150: TQRLabel;
    QRLabel151: TQRLabel;
    QRLabel152: TQRLabel;
    QRLabel109: TQRLabel;
    QRLabel154: TQRLabel;
    QRLabel92: TQRLabel;
    QRLabel73: TQRLabel;
    QRLabel93: TQRLabel;
    QRLabel112: TQRLabel;
    QRLabel120: TQRLabel;
    QRLabel121: TQRLabel;
    QRLabel122: TQRLabel;
    QRLabel155: TQRLabel;
    QRLabel156: TQRLabel;
    QRShape78: TQRShape;
    QRShape45: TQRShape;
    QRLabel99: TQRLabel;
    QRLabel52: TQRLabel;
    LineCheck1: TQRShape;
    LineCheck2: TQRShape;
    procedure InreportPreview(Sender: TObject);
    procedure InreportNeedData(Sender: TObject; var MoreData: Boolean);
    procedure InreportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
     Fin      : file of E2031C.TDataIn;
     FCom     : Textfile;
  end;

var
  Fpie20311: TFpie20311;
//  DataIn   : E2250C.TDataIn; 왼수!!!!!!!!!!!!!

implementation

{$R *.DFM}
uses PePrnview;

procedure TFpie20311.InreportBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var
moredata : Boolean;
begin
  AssignFile(Fin, E2031C.HomeDir+'\list\pie2031c.tmp');
  AssignFile(FCom,E2031C.HomeDir+'\list\pie2031c.dat');
  System.Reset(Fin);   {open}

  QRL_curdate.Caption   := Fpie2031c.L_CurDate.Caption;
  QRL_WorkDate.Caption  := Copy(Fpie2031c.Mrunyymm.Text, 1 , 4) + '년 ' +
                           Copy(Fpie2031c.Mrunyymm.Text, 5 , 2) + '월';

end;

procedure TFpie20311.InreportPreview(Sender: TObject);
begin
     Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,InReport);
     Fm_PreviewForm.Show;
end;

procedure TFpie20311.InreportNeedData(Sender: TObject;
  var MoreData: Boolean);
var
C_ratio1, C_totratio1 : real;
I_pemp1,  I_ptot1     : integer;
S_ppos1 : Integer;
begin
    if not Eof(Fin) then begin
      with DataIn do begin
        QRL_technique.Caption    := '';
        QRL_ppos1.Caption        := '';
        QRL_ppos2.Caption        := '';
        QRL_ppos3.Caption        := '';
        QRL_ppos4.Caption        := '';
        QRL_ppos5.Caption        := '';
        QRL_ppos6.Caption        := '';
        QRL_ppos7.Caption        := '';
        QRL_ppos8.Caption        := '';
        QRL_ppos9.Caption        := '';
        QRL_pspe.Caption         := '';
        QRL_pcont.Caption        := '';
        QRL_pscon.Caption        := '';  //2002.08.29 shm 추가         
        QRL_ptemp.Caption        := '';
        QRL_pratio.Caption       := '';
        QRL_ptotcnt.Caption      := '';
        QRL_ptotratio.Caption    := '';

        Read(Fin, DataIn);

        if Boldline = True then
        begin
            LineCheck1.Pen.Width      := 5;
            LineCheck2.Pen.Width      := 5;

            QRL_technique.Font.Style := [fsBold];
            QRL_technique.Font.Size  := 7
        end else
        begin
            QRL_technique.Font.Style := [];
            LineCheck1.Pen.Width      := 1;
            LineCheck2.Pen.Width      := 1;
        end;

        if trim(techname)   <> '()'    then QRL_technique.Caption  := techname;
        if trim(ppos1)      <> '()'    then QRL_ppos1.Caption      := ppos1;
        if trim(ppos2)      <> '()'    then QRL_ppos2.Caption      := ppos2;
        if trim(ppos3)      <> '()'    then QRL_ppos3.Caption      := ppos3;
        if trim(ppos4)      <> '()'    then QRL_ppos4.Caption      := ppos4;
        if trim(ppos5)      <> '()'    then QRL_ppos5.Caption      := ppos5;
        if trim(ppos6)      <> '()'    then QRL_ppos6.Caption      := ppos6;
        if trim(ppos7)      <> '()'    then QRL_ppos7.Caption      := ppos7;
        if trim(ppos8)      <> '()'    then QRL_ppos8.Caption      := ppos8;
        if trim(ppos9)      <> '()'    then QRL_ppos9.Caption      := ppos9;
        if trim(pspe)       <> '()'    then QRL_pspe.Caption       := pspe;
        if trim(pemp)       <> '()'    then QRL_pemp.Caption       := pemp;
        if trim(pcontsum)   <> '()'    then QRL_pcont.Caption      := pcontsum;
        if trim(psconsum)   <> '()'    then QRL_pscon.Caption      := psconsum; //2002.08.29 shm 추가         
        if trim(pextrsum)   <> '()'    then QRL_ptemp.Caption      := pextrsum;
        if trim(ptot)       <> '()'    then QRL_ptotcnt.Caption    := ptot;

        // 2003.07.18 추가 ,  Fpie2031c.Cur_pemptot, Fpie2031c.Cur_ptotal에 값을 넣어줌
         begin
          Fpie2031c.Query2.Close;
          Fpie2031c.Query2.SQL.Clear;
          Fpie2031c.Query2.SQL.ADD('SELECT SUM(PPOSSUM + PSPE1 +PSPE3 + PSPE4 +PSPE5) PEMP,                      ');
          Fpie2031c.Query2.SQL.ADD('       SUM(PEMPTOT + PCONTSUM + PTEMPSUM + psconsum)  PTOTAL  FROM PIHTOPO   '); //전문계약직 임시 psconsum 2002.08.01 shm
          Fpie2031c.Query2.SQL.ADD(' WHERE TOPOYM = :P_Topoym                                                    ');
          Fpie2031c.Query2.ParamByName('P_topoym').AsString  := Fpie2031c.Mrunyymm.text;
          Fpie2031c.Query2.Open;
         end;

         if Fpie2031c.Query2.Fields[0].AsString = '' then
         begin
            showmessage('작업년월의 해당사항이 없습니다. 현원생성을 먼저 하시고 작업하십시요!');
            Fpie2031c.Query2.Close;
            System.Exit;
         end;

         Fpie2031c.Cur_Pemptot := StrtoInt(Fpie2031c.Query2.Fields[0].AsString);
         Fpie2031c.Cur_Ptotal  := StrtoInt(Fpie2031c.Query2.Fields[1].AsString);
         Fpie2031c.Query2.Close;
        // 여기까지 추가 끝

        I_pemp1     :=  StrtoIntDef(pemp,0);     // 30.29 정규용 수정 StrToInt -> StrToIntDef
        C_ratio1    := (I_pemp1 / Fpie2031c.Cur_pemptot) * 100;
        QRL_pratio.Caption     := FormatFloat('#0.0', C_ratio1);

        I_ptot1     :=  StrtoIntDef(ptot,0);    // 30.29 정규용 수정 StrToInt -> StrToIntDef
        C_totratio1 := (I_ptot1 / Fpie2031c.Cur_ptotal)  * 100;
        QRL_ptotratio.Caption  := FormatFloat('#0.0', C_totratio1);


        MoreData := True;
{       if  not  Eof(Fin) then begin
                 MoreData := True;
        end else MoreData := False;
    end;

    if MoreData = False then
    begin
      System.CloseFile(Fin);
    end;}
      end;
  end;
end;



end.
