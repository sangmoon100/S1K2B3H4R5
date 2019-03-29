unit pie20807;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls, DB, DBTables, Grids,
  DBGrids, Qrctrls, QuickRpt;

type
  TFpie20807 = class(TForm)
    Query3: TQuery;
    QRBand2: TQRBand;
    QRShape2: TQRShape;
    QRLabel16: TQRLabel;
    QRShape32: TQRShape;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRShape53: TQRShape;
    QRLabel7: TQRLabel;
    QRShape14: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape22: TQRShape;
    QRShape8: TQRShape;
    QRBand3: TQRBand;
    QRShape13: TQRShape;
    QRShape51: TQRShape;
    QRLuniname: TQRLabel;
    QRL3: TQRLabel;
    QRL5: TQRLabel;
    QRL6: TQRLabel;
    QRL7: TQRLabel;
    QRL8: TQRLabel;
    QRL2: TQRLabel;
    QuickReport1: TQuickRep;
    DataSource1: TDataSource;
    Query1: TQuery;
    Query2: TQuery;
    Query4: TQuery;
    QRL1: TQRLabel;
    QRLs: TQRLabel;
    QRShape9: TQRShape;
    QRL4: TQRLabel;
    QRLtt: TQRLabel;
    QRLr: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel14: TQRLabel;
    QRSysData1: TQRSysData;
    QRLyear: TQRLabel;
    QRLabel10: TQRLabel;
    QRShape54: TQRShape;
    QRShape24: TQRShape;
    QRShape27: TQRShape;
    QRShape29: TQRShape;
    QRShape31: TQRShape;
    QRShape33: TQRShape;
    QRShape21: TQRShape;
    QRShape56: TQRShape;
    QRShape11: TQRShape;
    QRShape23: TQRShape;
    QRShape28: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape37: TQRShape;
    QRShape40: TQRShape;
    QRL9: TQRLabel;
    QRL10: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape7: TQRShape;
    QRLabel4: TQRLabel;
    QRShape15: TQRShape;
    QRShape18: TQRShape;
    QRL11: TQRLabel;
    QRShape35: TQRShape;
    QRL0: TQRLabel;
    QRShape41: TQRShape;
    QRLabel30: TQRLabel;
    QRShape47: TQRShape;
    QRLabel20: TQRLabel;
    QRLm: TQRLabel;
    QRLm1: TQRLabel;
    QRLm2: TQRLabel;
    QRLm3: TQRLabel;
    QRLm4: TQRLabel;
    QRLm5: TQRLabel;
    QRLm6: TQRLabel;
    QRLm7: TQRLabel;
    QRLm8: TQRLabel;
    QRLm9: TQRLabel;
    QRLm10: TQRLabel;
    QRLm11: TQRLabel;
    QRLm12: TQRLabel;
    QRShapeS15: TQRShape;
    QRShapeS16: TQRShape;
    QRBand4: TQRBand;
    QRLabel8: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel11: TQRLabel;
    QRShape10: TQRShape;
    QRShape1: TQRShape;
    QRLabel9: TQRLabel;
    QRLs1: TQRLabel;
    QRLs2: TQRLabel;
    QRLs3: TQRLabel;
    QRLs5: TQRLabel;
    QRLs6: TQRLabel;
    QRLs7: TQRLabel;
    QRLs8: TQRLabel;
    QRLsr: TQRLabel;
    QRLstt: TQRLabel;
    QRLs4: TQRLabel;
    QRLst: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape36: TQRShape;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    QRShape42: TQRShape;
    QRShape43: TQRShape;
    QRShape45: TQRShape;
    QRShape46: TQRShape;
    QRShape52: TQRShape;
    QRShape57: TQRShape;
    QRShape30: TQRShape;
    QRShape44: TQRShape;
    QRLs9: TQRLabel;
    QRLs10: TQRLabel;
    QRShape6: TQRShape;
    QRShape25: TQRShape;
    QRLs11: TQRLabel;
    QRShape34: TQRShape;
    QRLs0: TQRLabel;
    QRShape48: TQRShape;
    QRShapeS0: TQRShape;
    QRShape55: TQRShape;
    QRShapeS2: TQRShape;
    QRShapeS1: TQRShape;
    QRShapeS5: TQRShape;
    QRShapeS6: TQRShape;
    QRShapeS7: TQRShape;
    QRShapeS8: TQRShape;
    QRShapeS9: TQRShape;
    QRShapeS10: TQRShape;
    QRShapeS11: TQRShape;
    QRShapeS12: TQRShape;
    QRShapeS13: TQRShape;
    QRShapeS14: TQRShape;
    lblMsg: TQRLabel;
    QRShapeS3: TQRShape;
    QRShape72: TQRShape;
    QRShapeS4: TQRShape;
    QRLabel32: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel15: TQRLabel;
    QRShape74: TQRShape;
    QRShape75: TQRShape;
    QRShape77: TQRShape;
    QRShape78: TQRShape;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRShape26: TQRShape;
    QRShape61: TQRShape;
//    procedure QRBand3BeforePrint(var PrintBand: Boolean);
//    procedure QRBand2BeforePrint(var PrintBand: Boolean);
//    procedure QuickReport1BeforePrint(var PrintReport: Boolean);
//    procedure QRBand3AfterPrint(BandPrinted: Boolean);
//    procedure QRBand4BeforePrint(var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickReport1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QuickReport1Preview(Sender: TObject);
    procedure QRBand3AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickReport1StartPage(Sender: TCustomQuickRep);
    procedure QuickReport1EndPage(Sender: TCustomQuickRep);
    procedure QRBand4AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    { Private declarations }
    SQLCommand : string;
    RecCount : integer;   {전체자료건수}
    PrtCount : integer;   {출력건수}
  public
    { Public declarations }
  end;

var
  Fpie20807: TFpie20807;
  data1,data2,data4,uniname,lpaycl,Mto,Mfr : String;
  idatai,idata1,idata2,idata3,idata4,idata5,idata6,idata7,idata8,idata9,idata10: Integer;
  tsumi,tsum1,tsum2,tsum3,tsum4,tsum5,tsum6,tsum7,tsum8,tsum9,tsum10,tsum11,tsum12,tsumr: Integer;
  data3,idata,sum1,sum2,ttsum1,ttsum2,Tinwon,datacnt,Ci,Li: Integer;
  jdata1,jdata2,jdata3,jdata4,jdatas: Integer;{특정직을 위한 comment}
  rate1,trate : Real;
  tyear,binwon: Integer;{년도 변환용..}
  fyyyy,fyymm,ydata,tyymm: String; {키로 사용할 년월}
  m1,m2,m3,m4,m5,m6,m7,m8,m9,m10,m11,m12 : integer;
  Bandcount:integer;


implementation

{$R *.DFM}

Uses e2080c,peprnView;

//procedure TFpie20807.QRBand3BeforePrint(var PrintBand: Boolean);
//begin
//end;

//procedure TFpie20807.QRBand2BeforePrint(var PrintBand: Boolean);
//end;

//procedure TFpie20807.QuickReport1BeforePrint(var PrintReport: Boolean);
//begin
//end;

//procedure TFpie20807.QRBand3AfterPrint(BandPrinted: Boolean);
//begin
//end;

//procedure TFpie20807.QRBand4BeforePrint(var PrintBand: Boolean);
//begin
//end;

procedure TFpie20807.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  Mfr := Fpie2080c.Mfrym.Text;
  Mto := Fpie2080c.Mtoym.Text;
  idatai := 0;idata1 := 0;  idata2 := 0;  idata3 := 0;  idata4 := 0;  idata5 := 0;
  idata6 := 0;  idata7 := 0;  idata8 := 0;  sum1 := 0;
  idata10 := 0; idata10 := 0; //2002.06.04 SHM 추가

  begin
       Inc(PrtCount);
       Fpie2080c.gauge1.Progress := (PrtCount * 100) div RecCount;
       if (PrtCount >= RecCount) then
          Fpie2080c.gauge1.Progress := 100;
       data1  := Query1.Fields[0].AsString;{년월....}
       {data3  := Query1.Fields[1].AsInteger;{퇴직인원}
       // 민용 막음
       {Query2.Close;
       Query2.SQL.Clear;
       Query2.SQL.ADD(' SELECT SUM(RTINWON), PAYCL              ');
       Query2.SQL.ADD('   FROM PIHTONG a                        ');
//       Query2.SQL.ADD(' (select value1 from pimvari where gubun = ''00'' and sgubun = ''0001'' )b '); //2001.08.08 shm 추가
       Query2.SQL.ADD('  WHERE ((TONGYM >='''+Mfr+''') AND      ');
       Query2.SQL.ADD('         (TONGYM <='''+Mto+''') AND      ');
//       Query2.SQL.ADD('         (PAYCL <= ''99'') AND ');
//       Query2.SQL.ADD('         (PAYCL > ''00'') AND ');
       Query2.SQL.ADD('         (PAYCL <= ''93'') AND ');
       Query2.SQL.ADD('         (substr(PAYCL,1,1) > ''0'') AND ');
       Query2.SQL.ADD('         (TONGYM = '''+data1+'''))       ');
//       Query2.SQL.ADD('    and   a.orgnum = b.value1    ');                                           //2001.08.08 shm 추가
       Query2.SQL.ADD(' GROUP BY PAYCL                          ');
       Query2.Open; }

       with Query2 do
       begin
         Close;
         SQL.Clear;
         if Fpie2080c.RGdangYN.ItemIndex = 0 then
           SQL.Add(' select count(empno),paycl                                      '+
                   '  from pihanno                                                  '+
                   ' where substr(anfrdate,1,6) >='''+Mfr+'''                       '+
                   '   and substr(anfrdate,1,6) <='''+Mto+'''                       '+
                   '   and substr(anfrdate,1,6) = '''+data1+'''                     '+
           	      '   and ancode in (''819'',''829'',''839'',''849'')               '+
                   'group by paycl                                                  ')
         else
           SQL.Add('select count(empno),paycl                                       '+
                   '  from pihanno                                                  '+
                   ' where substr(anfrdate,1,6) >='''+Mfr+'''                       '+
                   '   and substr(anfrdate,1,6) <='''+Mto+'''                       '+
                   '   and substr(anfrdate,1,6)  ='''+data1+'''                     '+
           	      '   and ancode in (''819'',''829'',''839'',''849'')               '+
                   '   and (ancode <> ''819'' or (NVL(andetcode,''ZZ'') <> ''92'')) '+
                   'group by paycl                                                  ');
       end;
       Query2.Open;
       {1.직급별 인원을 계산한다................................}
       while not Query2.EOF do
              begin
                  data2 := Query2.Fields[1].AsString;
                  if (Copy(data2,1,1) = '0') then begin 
                     idatai :=idatai + Query2.Fields[0].AsInteger;
                     end
                  else
                  if (data2 = '11') then begin  //기존(10)
                     idata1 := idata1 + Query2.Fields[0].AsInteger;
                     end
                  else
                  if (data2 = '13') then begin  //기존(20)
                     idata2 := idata2 + Query2.Fields[0].AsInteger;
                     end
                  else
                  if (data2 = '21') then begin  //기존(30)
                     idata3 := idata3 + Query2.Fields[0].AsInteger;
                     end
                  else
                  if (data2 = '23') then begin  //기존(40)
                     idata4 := idata4 + Query2.Fields[0].AsInteger;
                     end
                  else
                  if (data2 = '31') then begin  //기존(50)
                     idata5 := idata5 + Query2.Fields[0].AsInteger;
                     end
                  else
                  if (data2 = '33') then begin  //기존(60)
                     idata6 := idata6 + Query2.Fields[0].AsInteger;
                     end
                  else
                  if (data2 = '41') then begin  //기존(70)
                     idata7 := idata7 + Query2.Fields[0].AsInteger;
                     end
                  else
                  if (data2 = '43') then begin  //기존(15)
                     idata8 := idata8 + Query2.Fields[0].AsInteger;
                     end
                  else
                  if (data2 = '45') then begin  //기존(25)
                     idata9 := idata9 + Query2.Fields[0].AsInteger;
                     end
                  else
                  if (data2 = '93') then begin    {특정기술직(91)}
                     idata10 := idata10 + Query2.Fields[0].AsInteger;
                  end;
                  Query2.next;
                  end;
       {1.의 끝.................................................}
       {2.계와 총원을 구한다....................................}
       begin
       sum1 := idata1+idata2+idata3+idata4+idata5+idata6+idata7+idata8+idata9+idata10;
       sum2 := idatai+idata1+idata2+idata3+idata4+idata5+idata6+idata7+idata8+idata9+idata10;

        m1 :=  m1+idatai;
        m2 :=  m2+idata1;
        m3 :=  m3+idata2;
        m4 :=  m4+idata3;
        m5 :=  m5+idata4;
        m6 :=  m6+idata5;
        m7 :=  m7+idata6;
        m8 :=  m8+idata7;
        m9 :=  m9+idata8;
       m10 := m10+idata9;
       m11 := m11+idata10;
       m12 := m2+m3+m4+m5+m6+m7+m8+m9+m10+m11;
       end;
       {2.의 끝.................................................}
       {전년도말인원을 구한다...............}
       begin
            ydata := Copy(data1,1,6);
            tyear := StrToInt(Copy(ydata,1,4));
            if Copy(ydata,5,2) = '01' then begin
               tyymm := IntToStr(tyear-1)+'12';
               end
            else begin
               tyymm := IntToStr(StrToInt(ydata)-1);
               end;
            Query3.Close;
            Query3.SQL.Clear;
            Query3.SQL.ADD(' SELECT SUM(INWON) ');
            Query3.SQL.ADD('   FROM PIHTONG a  ');
//            Query3.SQL.ADD(' (select value1 from pimvari where gubun = ''00'' and sgubun = ''0001'' )b '); //2001.08.08 shm 추가
            Query3.SQL.ADD('  WHERE ((TONGYM = '''+tyymm+''') AND ');
//            Query3.SQL.ADD('         (PAYCL > ''00'') AND (PAYCL <= ''99'')) ');
            Query3.SQL.ADD('         (substr(PAYCL,1,1) > ''0'') AND (PAYCL <= ''93'')) ');
//            Query3.SQL.ADD('    and   a.orgnum = b.value1    ');                                           //2001.08.08 shm 추가
            Query3.Open;
            binwon := Query3.Fields[0].AsInteger;
       end;
       Query3.Close;
       {퇴직율을 계산한다.}
       if (sum1 <> 0) and (binwon <> 0) then begin
          rate1:= (sum1/binwon)*100;
          end
       else begin
          rate1:= 0;
          end;
       {퇴직율을 보여준다.}
{       if rate1 > 0 then begin}
          QRLr.Caption := FormatFloat('##0.0', rate1);
{          end
       else begin
          QRLr.Caption := '(0.0)';
          end;}

       {100.각 자료를 해당 칸에 입력한다........................}
       begin
            uniname := data1;
       end;
       {3.끝....................................................}

       begin
           fyyyy := Copy(data1,1,4);
           fyymm := fyyyy+'12';

       end;
      if ((uniname <> fyymm) and (uniname <> formatDateTime('YYYYMM',NOW)))  then
       begin
            QRBand3.Height := 33;
            QRLuniname.caption := Copy(uniname,1,4)+'년'+Copy(uniname,5,2)+'월';
            QRL0.Caption := FormatFloat('#,###', idatai);
            QRL1.Caption := FormatFloat('#,###', idata1);
            QRL2.Caption := FormatFloat('#,###', idata2);
            QRL3.Caption := FormatFloat('#,###', idata3);
            QRL4.Caption := FormatFloat('#,###', idata4);
            QRL5.Caption := FormatFloat('#,###', idata5);
            QRL6.Caption := FormatFloat('#,###', idata6);
            QRL7.Caption := FormatFloat('#,###', idata7);
            QRL8.Caption := FormatFloat('#,###', idata8);
            QRL9.Caption := FormatFloat('#,###', idata9);
            QRL10.Caption := FormatFloat('#,###', idata10);
            QRL11.Caption := FormatFloat('#,###', sum1);
            QRLs.Caption := FormatFloat('#,###', sum2);
            QRLtt.Caption:= FormatFloat('#,###', binwon) ;

            QRShapeS0.Enabled  := False;
            QRShapeS1.Enabled  := False;
            QRShapeS2.Enabled  := False;
            QRShapeS3.Enabled  := False;
            QRShapeS4.Enabled  := False;
            QRShapeS5.Enabled  := False;
            QRShapeS6.Enabled  := False;
            QRShapeS7.Enabled  := False;
            QRShapeS8.Enabled  := False;
            QRShapeS9.Enabled  := False;
            QRShapeS10.Enabled := False;
            QRShapeS11.Enabled := False;
            QRShapeS12.Enabled := False;
            QRShapeS13.Enabled := False;
            QRShapeS14.Enabled := False;

            QRShapeS15.Enabled := True;
            QRShapeS16.Enabled := False;

            QRLm.Enabled       := False;
            QRLm1.Enabled      := False;
            QRLm2.Enabled      := False;
            QRLm3.Enabled      := False;
            QRLm4.Enabled      := False;
            QRLm5.Enabled      := False;
            QRLm6.Enabled      := False;
            QRLm7.Enabled      := False;
            QRLm8.Enabled      := False;
            QRLm9.Enabled      := False;
            QRLm10.Enabled     := False;
            QRLm11.Enabled     := False;
            QRLm12.Enabled     := False;
       end
      else
        begin
            QRBand3.Height := 67;
            QRLuniname.caption := Copy(uniname,1,4)+'년'+Copy(uniname,5,2) + '월';
            QRL0.Caption := FormatFloat('#,###', idatai);
            QRL1.Caption := FormatFloat('#,###', idata1);
            QRL2.Caption := FormatFloat('#,###', idata2);
            QRL3.Caption := FormatFloat('#,###', idata3);
            QRL4.Caption := FormatFloat('#,###', idata4);
            QRL5.Caption := FormatFloat('#,###', idata5);
            QRL6.Caption := FormatFloat('#,###', idata6);
            QRL7.Caption := FormatFloat('#,###', idata7);
            QRL8.Caption := FormatFloat('#,###', idata8);
            QRL9.Caption := FormatFloat('#,###', idata9);
            QRL10.Caption := FormatFloat('#,###', idata10);
            QRL11.Caption := FormatFloat('#,###', sum1);
            QRLs.Caption  := FormatFloat('#,###', sum2);
            QRLtt.Caption := FormatFloat('#,###', binwon);

            QRShapeS0.Enabled  := True;
            QRShapeS1.Enabled  := True;
            QRShapeS2.Enabled  := True;
            QRShapeS3.Enabled  := True;
            QRShapeS4.Enabled  := True;
            QRShapeS5.Enabled  := True;
            QRShapeS6.Enabled  := True;
            QRShapeS7.Enabled  := True;
            QRShapeS8.Enabled  := True;
            QRShapeS9.Enabled  := True;
            QRShapeS10.Enabled := True;
            QRShapeS11.Enabled := True;
            QRShapeS12.Enabled := True;
            QRShapeS13.Enabled := True;
            QRShapeS14.Enabled := True;

            QRShapeS15.Enabled := True;
            QRShapeS16.Enabled := True;

            QRLm.Enabled := true;
           // QRLm.caption := '소    계';
            QRLm1.Enabled := true;
            QRLm1.caption := FormatFloat('#,###', m1);
            QRLm2.Enabled := true;
            QRLm2.caption := FormatFloat('#,###', m2);
            QRLm3.Enabled := true;
            QRLm3.caption := FormatFloat('#,###', m3);
            QRLm4.Enabled := true;
            QRLm4.caption := FormatFloat('#,###', m4);
            QRLm5.Enabled := true;
            QRLm5.caption := FormatFloat('#,###', m5);
            QRLm6.Enabled := true;
            QRLm6.caption := FormatFloat('#,###', m6);
            QRLm7.Enabled := true;
            QRLm7.caption := FormatFloat('#,###', m7);
            QRLm8.Enabled := true;
            QRLm8.caption := FormatFloat('#,###', m8);
            QRLm9.Enabled := true;
            QRLm9.caption := FormatFloat('#,###', m9);
            QRLm10.Enabled := true;
            QRLm10.caption := FormatFloat('#,###', m10);
            QRLm11.Enabled := true;
            QRLm11.caption := FormatFloat('#,###', m11);
            QRLm12.Enabled := true;
            QRLm12.caption := FormatFloat('#,###', m12);

            m1:=0; m2:=0; m3:=0; m4:=0; m5:=0; m6:=0; m7:=0; m8:=0; m9:=0; m10:=0; m11:=0; m12:=0;
        end;
       {100.의 끝...............................................}
  end;
  if BandCount = 30 then
    begin
      QuickReport1.NewPage;   // Band갯수가 차면 NewPage
    end;
  Inc(BandCount);
end;

procedure TFpie20807.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  ymd : String;
begin
  ymd := Fpie2080c.L_CurDate.Caption;
  QRLabel12.Caption := '작성일자 : '   + Copy(ymd,1,4) + '/'  + Copy(ymd,6,2)+ '/'+ Copy(ymd,9,2);
  QRLabel13.Caption := '[작업년월] : ' + Copy(Mfr,1,4) + '년 '+ Copy(Mfr,5,2)+ '월'
                                 +' ~ '+ Copy(Mto,1,4) + '년 '+ Copy(Mto,5,2)+ '월';
  QRLyear.Caption   := Copy(Mto,1,4);

end;

procedure TFpie20807.QuickReport1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  Mfr := Fpie2080c.Mfrym.Text;
  Mto := Fpie2080c.Mtoym.Text;
  datacnt:= 0; Ci := 0;
  Li := 0;
  Fpie2080c.P_help.Caption := '자료를 추출 중입니다!';
  Application.Processmessages;

  tsum1  := 0;  tsum2  := 0;  tsum3 := 0;  tsum4 := 0;   tsum5 := 0;
  tsum6  := 0;  tsum7  := 0;  tsum8 := 0;  tsum9 := 0;   tsum10 := 0;
  jdata1 := 0;  jdata2 := 0;  tsumr := 0;
  jdata3 := 0; jdata4  := 0; jdatas := 0;
  {년도를 읽어 온다.......................................................}
  begin
  Query1.Close;
  Query1.SQL.Clear;
  Query1.SQL.ADD(' select DISTINCT TONGYM ');
  Query1.SQL.ADD('   FROM PIHTONG ');
  Query1.SQL.ADD('  WHERE ((TONGYM >='''+Mfr+''') AND  ');
  Query1.SQL.ADD('         (TONGYM <='''+Mto+''') AND  ');
//  Query1.SQL.ADD('         (PAYCL > ''00'') AND  ');
//  Query1.SQL.ADD('         (PAYCL <= ''99'')) ');
  Query1.SQL.ADD('         (substr(PAYCL,1,1) > ''0'') AND  ');
  Query1.SQL.ADD('         (PAYCL <= ''93'')) ');

  //Query1.SQL.ADD('  ORDER BY TONGYM ');
  Query1.Open;
  RecCount := Query1.RecordCount;
  end;
end;

procedure TFpie20807.QuickReport1Preview(Sender: TObject);
begin
   Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,QuickReport1);
end;

procedure TFpie20807.QRBand3AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  tsumi  := tsumi+idatai;
  tsum1  := tsum1+idata1;
  tsum2  := tsum2+idata2;
  tsum3  := tsum3+idata3;
  tsum4  := tsum4+idata4;
  tsum5  := tsum5+idata5;
  tsum6  := tsum6+idata6;
  tsum7  := tsum7+idata7;
  tsum8  := tsum8+idata8;
  tsum9  := tsum9+idata9;    //TSUM8 로 되어있었음 SHM    2002.06.04
  tsum10 := tsum10+idata10;  //"
  tsum11 := tsum1+tsum2+tsum3+tsum4+tsum5+tsum6+tsum7+tsum8+tsum9+tsum10;
  tsum12 := tsumi+tsum1+tsum2+tsum3+tsum4+tsum5+tsum6+tsum7+tsum8+tsum9+tsum10;
  tsumr  := tsumr+binwon;
  Li     := Li+1;
end;

procedure TFpie20807.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
     ttsum1 := tsum1+tsum2+tsum3+tsum4+tsum5+tsum6+tsum7+tsum8+tsum9+tsum10;
     trate  := tsumr/RecCount;
     if (ttsum1 <> 0) and (trate <> 0) then begin {ttsum1:퇴직계,trate:평균인원}
         rate1:= (ttsum1/trate)*100;
         end
     else begin
         rate1:= 0;
         end;
     QRLs0.Caption := FormatFloat('#,###', tsumi);
     QRLs1.Caption := FormatFloat('#,###', tsum1);
     QRLs2.Caption := FormatFloat('#,###', tsum2);
     QRLs3.Caption := FormatFloat('#,###', tsum3);
     QRLs4.Caption := FormatFloat('#,###', tsum4);
     QRLs5.Caption := FormatFloat('#,###', tsum5);
     QRLs6.Caption := FormatFloat('#,###', tsum6);
     QRLs7.Caption := FormatFloat('#,###', tsum7);
     QRLs8.Caption := FormatFloat('#,###', tsum8);
     QRLs9.Caption := FormatFloat('#,###', tsum9);
     QRLs10.Caption := FormatFloat('#,###', tsum10);
     QRLs11.Caption := FormatFloat('#,###', tsum11);
     QRLst.Caption  := FormatFloat('#,###',  tsum12);
     QRLstt.Caption := FormatFloat('#,###', trate) ;
     QRLsr.Caption  := FormatFloat('##0.0', rate1) ;
     jdatas := jdata1+jdata2+jdata3+jdata4;

     if Fpie2080c.RGdangYN.ItemIndex = 0 then
        lblMsg.Caption := '☞ (당연면직 포함)'
     else
        lblMsg.Caption := '☞ (당연면직 제외)';


end;

procedure TFpie20807.QuickReport1StartPage(Sender: TCustomQuickRep);
begin
  BandCount:=0;
end;

procedure TFpie20807.QuickReport1EndPage(Sender: TCustomQuickRep);
begin
  m1:=0; m2:=0; m3:=0; m4:=0; m5:=0; m6:=0; m7:=0; m8:=0; m9:=0; m10:=0; m11:=0; m12:=0;
end;

procedure TFpie20807.QRBand4AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  Fm_PreviewForm.Show;
end;

end.

