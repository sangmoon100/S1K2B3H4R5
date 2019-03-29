{
---------------------Program  Header -------------------------------------------
PROGRAM-NAME    : PIE1030AC(계획인원조정)
SYSTEM-NAME     : 종합인사정보
SUBSYSTEM-NAME  : 인사
Programmer      : 정재헌
Version         : 1.00
Date            : 1996.6.8
Update contents
  1.00     96.06.08   정재헌       신규프로그램 개발      처리명세서
  1.01     01.02.16   서혜미       계약직 계획인원 입력   최준영씨 요청
 30.01   2003.12.12   정규용(자체) PIHTOPO에서 TOPOYM = '999999'인 데이터를 수정하게 수정
                                   계획인원은  TOPOYM = '999999'에서 가져오고
                                   현원은      TOPOYM = 현월에서 가져 온다.
 30.02   2004.02.23   정규용       DEPTLEVEL 필드 추가
--------------------------------------------------------------------------------
}

unit E1030A_oldpaycl;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Mask, Buttons, ExtCtrls,IniFiles, DB, DBTables,
  NumCtrl, numedit;

type
  TFpie2030a = class(TForm)
    Panel1: TPanel;
    L_UserName: TLabel;
    L_CurDate: TLabel;
    Panel4: TPanel;
    BB_Close: TBitBtn;
    Panel10: TPanel;
    Mdeptcode: TMaskEdit;
    guname: TLabel;
    Lorg: TLabel;
    Label40: TLabel;
    Lyymm: TLabel;
    Lboncode: TLabel;
    Ltcretime: TLabel;
    Lpcretime: TLabel;
    Panel14: TPanel;
    Mbigo: TMaskEdit;
    BB_Delete: TBitBtn;
    BB_cancel: TBitBtn;
    BB_Save: TBitBtn;
    P_helpinfo_: TPanel;
    P_Help: TLabel;
    Database1: TDatabase;
    Query1: TQuery;
    Query2: TQuery;
    Panel12: TPanel;
    Panel26: TPanel;
    Panel27: TPanel;
    Panel28: TPanel;
    Panel29: TPanel;
    Panel30: TPanel;
    Panel31: TPanel;
    Panel32: TPanel;
    Panel33: TPanel;
    Panel35: TPanel;
    Panel36: TPanel;
    Panel37: TPanel;
    aaaa: TPanel;
    Label10: TLabel;
    Label11: TLabel;
    CBgubun: TComboBox;
    BB_run: TBitBtn;
    Panel5: TPanel;
    Panel3: TPanel;
    Panel6: TPanel;
    Panel11: TPanel;
    Panel38: TPanel;
    Panel39: TPanel;
    Panel46: TPanel;
    Panel41: TPanel;
    Panel43: TPanel;
    Panel42: TPanel;
    Panel44: TPanel;
    Panel40: TPanel;
    Label15: TLabel;
    Label17: TLabel;
    Label13: TLabel;
    Label26: TLabel;
    Label28: TLabel;
    Label33: TLabel;
    Label30: TLabel;
    Label47: TLabel;
    Label34: TLabel;
    Panel16: TPanel;
    Panel15: TPanel;
    Panel17: TPanel;
    Panel13: TPanel;
    Panel9: TPanel;
    Panel19: TPanel;
    Panel20: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    Panel47: TPanel;
    Label8: TLabel;
    Panel21: TPanel;
    Panel22: TPanel;
    Panel23: TPanel;
    Panel24: TPanel;
    Label6: TLabel;
    Panel45: TPanel;
    Panel25: TPanel;
    Label7: TLabel;
    Label5: TLabel;
    Panel48: TPanel;
    Label9: TLabel;
    Panel2: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel18: TPanel;
    Panel49: TPanel;
    Panel50: TPanel;
    Q_date: TQuery;
    Panel51: TPanel;
    Label12: TLabel;
    Label14: TLabel;
    Panel53: TPanel;
    Panel54: TPanel;
    Label16: TLabel;
    Label18: TLabel;
    Mtdirect: TNumberEdit;
    Mtpos1: TNumberEdit;
    Mtpos2: TNumberEdit;
    Mtpos3: TNumberEdit;
    Mtpos4: TNumberEdit;
    Mtpos5: TNumberEdit;
    Mtpos6: TNumberEdit;
    Mtpos7: TNumberEdit;
    Mtpos8: TNumberEdit;
    Mtpos9: TNumberEdit;
    Ldirsum: TNumberEdit;
    Lppos1: TNumberEdit;
    Lppos2: TNumberEdit;
    Lppos3: TNumberEdit;
    Lppos4: TNumberEdit;
    Lppos5: TNumberEdit;
    Lppos6: TNumberEdit;
    Lppos7: TNumberEdit;
    Lppos8: TNumberEdit;
    Lppos9: TNumberEdit;
    Msum1: TNumberEdit;
    Lsum1: TNumberEdit;
    Mtspe: TNumberEdit;
    Msum2: TNumberEdit;
    Lpspe: TNumberEdit;
    Lsum2: TNumberEdit;
    Mextr: TNumberEdit;
    Lpextr: TNumberEdit;
    Msum3: TNumberEdit;
    Lsum3: TNumberEdit;
    Panel52: TPanel;
    Mtspe2: TNumberEdit;
    Mtspe1: TNumberEdit;
    Mtspe3: TNumberEdit;
    Mtspe4: TNumberEdit;
    Lpspe1: TNumberEdit;
    Lpspe2: TNumberEdit;
    Lpspe3: TNumberEdit;
    Lpspe4: TNumberEdit;
    Mextr1: TNumberEdit;
    Mextr2: TNumberEdit;
    Mextr3: TNumberEdit;
    Lpextr1: TNumberEdit;
    Lpextr2: TNumberEdit;
    Lpextr3: TNumberEdit;
    Mttotal: TNumberEdit;
    Lptotal: TNumberEdit;
    Panel55: TPanel;
    Panel56: TPanel;
    Panel57: TPanel;
    Panel58: TPanel;
    Mfree: TNumberEdit;
    Label19: TLabel;
    Lfree: TNumberEdit;
    Panel59: TPanel;
    Msum4: TNumberEdit;
    Label20: TLabel;
    Lsum4: TNumberEdit;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Jttotal: TNumberEdit;
    Jptotal: TNumberEdit;
    Panel60: TPanel;
    Panel61: TPanel;
    Label24: TLabel;
    Label25: TLabel;
    Label27: TLabel;
    Label29: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    e_deptname: TEdit;
    procedure BB_CloseClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure MdeptcodeDblClick(Sender: TObject);
    procedure BB_SaveClick(Sender: TObject);
    procedure BB_DeleteClick(Sender: TObject);
    procedure BB_cancelClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure MdeptcodeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DataControl(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CBgubunChange(Sender: TObject);
    procedure BB_runClick(Sender: TObject);
    procedure CBgubunKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MttotalClick(Sender: TObject);    {KEY항목확인 및 입력모드로 간다}
    procedure MdeptcodeClick(Sender: TObject);
    procedure CBgubunEnter(Sender: TObject);
    procedure MdeptcodeEnter(Sender: TObject);
    procedure e_deptnameEnter(Sender: TObject);
    procedure e_deptnameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    KeyCheck : integer;     {Enter 키 체크 유무}
    Tlevel   : string;      {인원관리단위}
    
    procedure CallData;
    procedure ClearData;
    procedure Btstate1;
    procedure Btstate2;
    procedure DeptChk;
    procedure CalCulate1;{일반직 합계}
    procedure CalCulate2;{특정직 합계}
    procedure CalCulate3;{임시직 합계}
    procedure CalCulate4;{계획인원총계}
  public
    { Public declarations }
    pempno   : string;{user identification}
    pkorname : string;{user name}
    password : string;{password}
    start    : Integer;{Initialized value}
  end;

var
  Fpie2030a: TFpie2030a;
  ErrorHelp : array[0..255] of char;
  tempyymm,temptcre,temppcre,Fieldcode,boncode,temppo ,sectcode,deptlevel: String[20];
  Dname : String[60];
  DeptCD : String[5];
  Deptcnt,FocusBy : Integer;
implementation
uses dept1lib,winsock,pass, datelib,Timeftp;
{$R *.DFM}

procedure TFpie2030a.BB_CloseClick(Sender: TObject);
var
  BitBtn: Integer;
begin
  BitBtn := Application.MessageBox('종료 하시겠습니까?', 'Message Box',
    mb_OKCancel + mb_DefButton1);
 if Bitbtn = IDOK then
   close;
 if BitBtn = IDCANCEL then

end;

procedure TFpie2030a.Btstate1;
begin
     BB_delete.Enabled := False;
     BB_cancel.Enabled := False;
     BB_save.Visible := False;
     BB_run.Visible  := True;
end;

procedure TFpie2030a.Btstate2;
begin
     BB_delete.Enabled := True;
     BB_cancel.Enabled := True;
     BB_run.Visible  := False;
     BB_save.Visible := True;
end;

procedure TFpie2030a.FormActivate(Sender: TObject);
var
  rStr: string;
begin
   pempno   := PassEmp(cmdline, 1);
   pkorname := PassEmp(cmdline, 2);
   password := PassEmp(cmdline, 3);
   DataBase1.Params[0]  := 'SERVER NAME=' + PassEmp(cmdline, 13);
   DataBase1.Params[1]  := 'USER NAME=' + PassEmp(cmdline, 5);
   DataBase1.Params[16] := 'PASSWORD='  + PassEmp(cmdline, 6);
   start := 0;
   P_help.Caption   := '';
   e_deptname.Text := '';
   Btstate1;
   KeyCheck := 0;

   CBgubun.text := '10';
   guname.Caption := '계획인원/현원';
   {1.현조직차수를 가져온다.................}
   begin
        Query1.Close;
        Query1.SQL.Clear;
        Query1.SQL.ADD(' SELECT  VALUE1 ');
        Query1.SQL.ADD('   FROM  PIMVARI ');
        Query1.SQL.ADD('  WHERE ((GUBUN =''00'') AND ');
        Query1.SQL.ADD('         (SGUBUN =''0001''))');
        Query1.Open;
   end;
   lorg.Caption := Query1.Fields[0].AsString;
   {1.의 끝...............................}
   {2.최종작업년월을 가져온다.................}
   begin
     Query1.Close;
     Query1.SQL.Clear;
     Query1.SQL.ADD(' SELECT  VALUE1,VALUE2       ');
     Query1.SQL.ADD('   FROM  PIMVARI             ');
     Query1.SQL.ADD('  WHERE ((GUBUN =''50'') AND ');
     Query1.SQL.ADD('         (SGUBUN =''0001'')) ');
     Query1.Open;
   end;
   if Query1.Fields[0].AsString = 'C0' then
      Lboncode.Caption := '본부(' + Query1.Fields[0].AsString + ')'
   else    {E0}
      Lboncode.Caption := '과(' + Query1.Fields[0].AsString + ')';
   Tlevel := Copy(Query1.Fields[0].AsString,1,1);           {1자리만 사용}
   tempyymm         := Query1.Fields[1].AsString;
   lyymm.Caption    := Copy(tempyymm,1,4)+'/'+Copy(tempyymm,5,2);
   {2.의 끝...............................}
   {3.계획인원및 현원 생성일자를  가져온다.................}
   begin
        Query1.Close;
        Query1.SQL.Clear;
        Query1.SQL.ADD(' SELECT  VALUE1,VALUE2       ');
        Query1.SQL.ADD('   FROM  PIMVARI             ');
        Query1.SQL.ADD('  WHERE ((GUBUN =''50'') AND ');
        Query1.SQL.ADD('         (SGUBUN =''0002'')) ');
        Query1.Open;
   end;
   temptcre := Query1.Fields[0].AsString;
   temppcre := Query1.Fields[1].AsString;
   Ltcretime.Caption := Copy(temptcre,1,4)+'/'+Copy(temptcre,5,2)+'/'+Copy(temptcre,7,2);
   Lpcretime.Caption := Copy(temppcre,1,4)+'/'+Copy(temppcre,5,2)+'/'+Copy(temppcre,7,2);
   Query1.Close;
   {3.의 끝...............................}
   CBgubun.SetFocus;
   FocusBy  := 0;
end;

procedure TFpie2030a.MdeptcodeDblClick(Sender: TObject);
var
   tdeptcode : String[5];
begin
     tdeptcode := Mdeptcode.text;
     {1.부서코드 및 해당명을 읽어온다..........................................}
     deptForm := TDeptForm.Create(self);
     Try
     deptForm.ShowModal;
     TMaskEdit(Sender).Text := deptForm.Code1;
     TMaskEdit(Sender).Text := deptForm.Code2;
     TMaskEdit(Sender).Text := deptForm.Code3;
     TMaskEdit(Sender).Text := deptForm.Code1;
     e_deptname.Text   := deptForm.CodeName;
     Finally
            deptForm.Free;
     end;
     {1.의 끝..................................................................}
     if Mdeptcode.text = '' then begin
        Mdeptcode.text := tdeptcode;
        end;
     CallData;
     P_help.Caption   := '';
     tdeptcode := '';
     Btstate2;
end;

procedure TFpie2030a.CallData;
begin
     {2.구분, 부서코드,조직차수,작업년월을 키로 하여 해당 데이타를 가져온다....}
     begin
       with Query1 do
       begin
          Close;
          SQL.Clear;
          SQL.ADD(' SELECT  A.TDIRECT,A.TPOS1,A.TPOS2,A.TPOS3,A.TPOS4,A.TPOS5,A.TPOS6,                   ');
          SQL.ADD('         A.TPOS7,A.TPOS8,A.TPOS9,A.TPOSSUM,A.TSPE1,A.TSPE2,A.TSPE3,A.TSPE4,A.TSPESUM, ');
          SQL.ADD('         A.TEXTR1,A.TEXTR2,A.TEXTR3,A.TTEMPSUM,A.TEXTRSUM,                            ');
          SQL.ADD('         A.TTOTAL,                                                                    ');
          SQL.ADD('         B.PDIRSUM,B.PPOS1,B.PPOS2,B.PPOS3,B.PPOS4,B.PPOS5,B.PPOS6,                   ');
          SQL.ADD('         B.PPOS7,B.PPOS8,B.PPOS9,B.PPOSSUM,B.PSPE1,B.PSPE2,B.PSPE3,B.PSPE4,B.PSPESUM, ');
          SQL.ADD('         B.PEXTR1,B.PEXTR2,B.PEXTR3,B.PTEMPSUM,B.PEXTRSUM,                            ');
          SQL.ADD('         B.PTOTAL,A.TPBIGO,                                                           ');
          SQL.ADD('         A.TCONTSUM,B.PCONTSUM,A.TEMPTOT,B.PEMPTOT                                    ');
          SQL.ADD('    FROM PIHTOPO A, PIHTOPO B                                                         ');
          SQL.ADD('   WHERE ((A.TOPOYM =:Altopoym)                                                       ');
          SQL.ADD('     AND  (A.ORGNUM =:lorgnum)                                                        ');
          SQL.ADD('     AND  (A.DEPTCODE =:ldeptcode)                                                    ');
          SQL.ADD('     AND  (A.TPGUBUN =:ltpgubun))                                                     ');
          SQL.ADD('     AND ((B.TOPOYM =:Bltopoym)                                                       ');
          SQL.ADD('     AND  (B.ORGNUM =:lorgnum)                                                        ');
          SQL.ADD('     AND  (B.DEPTCODE =:ldeptcode)                                                    ');
          SQL.ADD('     AND  (B.TPGUBUN =:ltpgubun))                                                     ');
          ParamByName('Altopoym').AsString  := '999999';
          ParamByName('Bltopoym').AsString  := tempyymm;
          ParamByName('lorgnum').AsString  := lorg.Caption;
          ParamByName('ldeptcode').AsString:= Mdeptcode.text;
          ParamByName('ltpgubun').AsString := CBgubun.text;
          Open;
{ ---------------------------------------------------------------------------
   버전    수정일     수정자   수정내용            관련근거
  30.00   1998.12.31  박규석   직위,직급수정       하나로인사재개발
 ---------------------------------------------------------------------------}
//          SQL.ADD(' SELECT  TDIRECT,TPOS1,TPOS2,TPOS3,TPOS4,TPOS5,TPOS6, ');
//          SQL.ADD('         TPOS7,TPOS8,TPOS9,TPOSSUM,TSPE1,TSPE2,TSPE3,TSPE4,TSPESUM, ');  // TPOS8,TPOS9 추가
//          SQL.ADD('         TEXTR1,TEXTR2,TEXTR3,TTEMPSUM,TEXTRSUM, ');  // TTEMPSUM : 협력 추가
//          SQL.ADD('         TTOTAL, ');
//          SQL.ADD('         PDIRSUM,PPOS1,PPOS2,PPOS3,PPOS4,PPOS5,PPOS6, ');
//          SQL.ADD('         PPOS7,PPOS8,PPOS9,PPOSSUM,PSPE1,PSPE2,PSPE3,PSPE4,PSPESUM, '); // PPOS8,PPOS9 추가
//          SQL.ADD('         PEXTR1,PEXTR2,PEXTR3,PTEMPSUM,PEXTRSUM, ');  // PTEMPSUM : 협력 추가
//          SQL.ADD('         PTOTAL,TPBIGO, ');
//          SQL.ADD('         TCONTSUM,PCONTSUM,TEMPTOT,PEMPTOT ');        // TCONTSUM,PCONTSUM 계획(계약추가,1.01 shm)
//          SQL.ADD('   FROM  PIHTOPO A ');                                  // TEMPTOT,PEMPTOT   계획정규직, 현원정규직 추가 1.01
//          SQL.ADD('  WHERE ((TOPOYM =:ltopoym) AND ');
//          SQL.ADD('         (ORGNUM =:lorgnum) AND ');
//          SQL.ADD('         (DEPTCODE =:ldeptcode) AND ');
//          SQL.ADD('         (TPGUBUN =:ltpgubun))');
//          ParamByName('ltopoym').AsString  := '999999';
//          ParamByName('lorgnum').AsString  := lorg.Caption;
//          ParamByName('ldeptcode').AsString:= Mdeptcode.text;
//          ParamByName('ltpgubun').AsString := CBgubun.text;
//          Open;
       end;
     end;
     Mtdirect.value:= Query1.Fields[0].AsInteger; {계획인원 임원}
     Mtpos1.value  := Query1.Fields[1].AsInteger; {계획인원 일반직 SM2급}
     Mtpos2.value  := Query1.Fields[2].AsInteger; {계획인원 일반직 SM1급}
     Mtpos3.value  := Query1.Fields[3].AsInteger; {계획인원 일반직 M2급}
     Mtpos4.value  := Query1.Fields[4].AsInteger; {계획인원 일반직 M1급}
     Mtpos5.value  := Query1.Fields[5].AsInteger; {계획인원 일반직 S2급}
     Mtpos6.value  := Query1.Fields[6].AsInteger; {계획인원 일반직 S1급}
     Mtpos7.value  := Query1.Fields[7].AsInteger; {계획인원 일반직 J3급}
     Mtpos8.value  := Query1.Fields[8].AsInteger; {계획인원 일반직 J2급}
     Mtpos9.value  := Query1.Fields[9].AsInteger; {계획인원 일반직 J1급}
     Msum1.value   := Query1.Fields[10].AsInteger;{계획인원 일반직 소계}
//     Mtspe1.value  := Query1.Fields[11].AsInteger; {계획인원 특정기술직}
//     Mtspe2.value  := Query1.Fields[12].AsInteger;{계획인원 전임행정직 소계}
//     Mtspe3.value  := Query1.Fields[13].AsInteger;{계획인원 특수직}
//     Mtspe4.value  := Query1.Fields[14].AsInteger;{계획인원 특수행정직}
     Mtspe.value   := Query1.Fields[11].AsInteger; {계획인원 특정직}   // TSPE1(특정기술직=특정직)
     Msum2.value   := Query1.Fields[15].AsInteger;{계획인원 특정직소계}
//     Mextr1.value  := Query1.Fields[16].AsInteger;{계획인원 임시직고문}
//     Mextr2.value  := Query1.Fields[17].AsInteger;{계획인원 임시직촉탁}
//     Mextr3.value  := Query1.Fields[18].AsInteger;{계획인원 임시직용무}
//     Mextr.value   := Query1.Fields[19].AsInteger;{계획인원 임시직 협력}
     Msum3.value   := Query1.Fields[19].AsInteger;{계획인원 임시직소계}    // 임시직소계 <= 협력
     Mttotal.value := Query1.Fields[21].AsInteger;{계획인원 총계}
     Ldirsum.value := Query1.Fields[22].AsInteger;{현 원 임원}

     Lppos1.value  := Query1.Fields[23].AsInteger;{현 원 일반직 SM2급}
     Lppos2.value  := Query1.Fields[24].AsInteger;{현 원 일반직 SM1급}
     Lppos3.value  := Query1.Fields[25].AsInteger;{현 원 일반직 M2급}
     Lppos4.value  := Query1.Fields[26].AsInteger;{현 원 일반직 M1급}
     Lppos5.value  := Query1.Fields[27].AsInteger;{현 원 일반직 S2급}
     Lppos6.value  := Query1.Fields[28].AsInteger;{현 원 일반직 S1급}
     Lppos7.value  := Query1.Fields[29].AsInteger;{현 원 일반직 J3급}
     Lppos8.value  := Query1.Fields[30].AsInteger;{현 원 일반직 J2급}
     Lppos9.value  := Query1.Fields[31].AsInteger;{현 원 일반직 J1급}
     Lsum1.value   := Query1.Fields[32].AsInteger;{현 원 일반직 소계}
//     Lpspe2.value  := Query1.Fields[33].AsInteger;{현 원 특정기술직}
//     Lpspe1.value  := Query1.Fields[34].AsInteger;{현 원 전임행정직 소계}
//     Lpspe3.value  := Query1.Fields[35].AsInteger;{현 원 특수직}
//     Lpspe4.value  := Query1.Fields[36].AsInteger;{현 원 특수행정직}
//     Lpspe.value   := Query1.Fields[33].AsInteger;{현 원 특정직}     // PSPE1(특정기술직=특정직)
     Lsum2.value   := Query1.Fields[37].AsInteger;{현 원 특정직소계}
//     Lpextr1.value := Query1.Fields[38].AsInteger;{현 원 임시직고문}
//     Lpextr2.value := Query1.Fields[39].AsInteger;{현 원 임시직촉탁}
//     Lpextr3.value := Query1.Fields[40].AsInteger;{현 원 임시직용무}
     Lpextr.value  := Query1.Fields[41].AsInteger;{현 원 임시직 협력}
     Lsum3.value   := Query1.Fields[41].AsInteger;{현 원 임시직소계}    // 임시직소계 <= 협력
     Lptotal.value := Query1.Fields[43].AsInteger;{현 원 총계}
     Mbigo.Text    := Query1.Fields[44].AsString;{비 고}
//1.01 shm
//     Mfree.value   := Query1.Fields[45].AsInteger;{계획 계약}
//     Lfree.value   := Query1.Fields[46].AsInteger;{계획 현원}
//     Msum4.value   := Query1.Fields[45].AsInteger;{계획 계약 소계}  2002.04.15 shm 계약직+일반직 to로.정여진씨 요청
//     Lsum4.value   := Query1.Fields[46].AsInteger;{계획 현원 소계}     "
     Jttotal.value := Query1.Fields[47].AsInteger;{계획 정규직 소계}  //1.01 shm
     JPtotal.value := Query1.Fields[48].AsInteger;{현원 정규직 소계}  //1.01 shm


     {2.의 끝..................................................................}
end;

procedure TFpie2030a.CalCulate1;
var
data1,data2,data3,data4,data5,data6,data7,data8,data9,data10,data11: Real;
begin
{ ---------------------------------------------------------------------------
   버전    수정일     수정자   수정내용            관련근거
  30.00   1998.12.31  박규석   직위,직급수정       하나로인사재개발
  특정직은 특정, 임시직은 협력만 존재 (전임행정,특수직,고문,촉탁,용무 없어짐)
 ---------------------------------------------------------------------------}
     data2 := Mtpos1.value;
     data3 := Mtpos2.value;
     data4 := Mtpos3.value;
     data5 := Mtpos4.value;
     data6 := Mtpos5.value;
     data7 := Mtpos6.value;
     data8 := Mtpos7.value;
     data9 := Mtpos8.value;
     data10:= Mtpos9.value;
     data11:= data2+data3+data4+data5+data6+data7+data8+data9+data10; //일반직 더함 shm
     Msum1.value := data11;
end;

procedure TFpie2030a.CalCulate2;
var
data1,data2,data3,data4,data5: Real;
begin
{ ---------------------------------------------------------------------------
   버전    수정일     수정자   수정내용            관련근거
  30.00   1998.12.31  박규석   직위,직급수정       하나로인사재개발
  특정직은 특정, 임시직은 협력만 존재 (전임행정,특수직,고문,촉탁,용무 없어짐)
 ---------------------------------------------------------------------------}
{     data1 := Mtspe2.value;
     data2 := Mtspe1.value;
     data3 := Mtspe3.value;
     data4 := Mtspe4.value;
     data5 := data1+data2+data3+data4;
     Msum2.value := data5;
}
     Msum2.value := Mtspe.value;
end;

procedure TFpie2030a.CalCulate3;
var
data1,data2,data3,data4: Real;
begin
{ ---------------------------------------------------------------------------
   버전    수정일     수정자   수정내용            관련근거
  30.00   1998.12.31  박규석   직위,직급수정       하나로인사재개발
  특정직은 특정, 임시직은 협력만 존재 (전임행정,특수직,고문,촉탁,용무 없어짐)
 ---------------------------------------------------------------------------}
{     data1 := Mextr1.value;
     data2 := Mextr2.value;
     data3 := Mextr3.value;
     data4 := data1+data2+data3;
     Msum3.value := data4;
}
     Msum3.value := Mextr.value;
end;

procedure TFpie2030a.CalCulate4;
var
   data1,  data2,  data3,  data4, data7  : Real;
   pdata1, pdata2, pdata3, pdata4,pdata7 : Real;
begin
//계획인원
     data1 := Msum1.value;
     data2 := Msum2.value;
     data3 := Msum3.value;
//     data7 := Msum4.value; 2002.04.15 shm 계약직+일반직 to로.정여진씨 요청
     data4 := Mtdirect.value+data1+data2+data3; //+data7;2002.04.15 shm 계약직+일반직 to로.정여진씨 요청
     Mttotal.value := data4;          //임원계획 + 정규직계획 + 계약계획 + 일반계획 +특정계획 1.01 shm
     Jttotal.value := data1 + data2;  //정규직총계(일반+특정) 1.01
{//현원
     pdata1 := Lsum1.value;
     pdata2 := Lsum2.value;
     pdata3 := Lsum3.value;
     pdata7 := Lsum4.value;
     pdata4 := Ldirsum.value+pdata1+pdata2+pdata3+pdata7;
     Lptotal.value := pdata4; //임원계획 + 정규직계획 + 계약계획 + 일반계획 +특정계획 1.01 shm
     Jptotal.value := pdata1 + pdata2;}
end;

procedure TFpie2030a.BB_SaveClick(Sender: TObject);
var
  BitBtn,ttcheck,topocnt: Integer;
  ltemptot, Ltimsitot : real;
begin
  BitBtn := Application.MessageBox('저장 하시겠습니까?', 'Message Box',
                                          mb_OKCancel + mb_DefButton1);
  if Bitbtn <> IDOK then begin
     Mtdirect.Setfocus;
     FocusBy  := 1;
     System.Exit;
  end;

  ttcheck := 1;
  if (StrToInt(CBgubun.text) = 10) or
     (StrToInt(CBgubun.text) = 20) or
     (StrToInt(CBgubun.text) = 30) then
     ttcheck := 0;
  if ttcheck = 1 then begin
     P_Help.Caption := '구분코드를 확인 하십시오!';
     CBgubun.SetFocus;  FocusBy  := 0;  System.Exit;
  end;

  Ltemptot := (Msum1.value + Msum2.value);   {정규직총계}
  Ltimsitot := Msum3.Value;                  {임용직총계}
  Calculate4;     {총계를 다시한번계산}
  if Mttotal.value < 0 then begin {계획인원총계 타당성 여부를 확인한다. }
     P_Help.Caption := '계획인원을 확인 하십시요 !';
     Mtdirect.SetFocus;  FocusBy  := 1;  System.Exit;
  end;

{ ---------------------------------------------------------------------------
   버전    수정일     수정자   수정내용            관련근거
  30.00   1998.12.31  박규석   직위,직급수정       하나로인사재개발
  특정직은 특정, 임시직은 협력만 존재 (전임행정,특수직,고문,촉탁,용무 없어짐)
 ---------------------------------------------------------------------------}
{  if ((Mtdirect.value < 0) or (Mtpos1.value < 0) or (Mtpos2.value < 0) or
      (Mtpos3.value < 0)   or (Mtpos4.value < 0) or (Mtpos5.value < 0) or
      (Mtpos6.value < 0)   or (Mtpos7.value < 0) or (Msum1.value < 0)  or
      (Mtspe2.value < 0)   or (Mtspe1.value < 0) or (Mtspe3.value < 0) or
      (Mtspe4.value < 0)   or (Msum2.value < 0)  or (Mextr1.value < 0) or
      (Mextr2.value < 0)   or (Mextr3.value < 0) or (Msum3.value < 0)  or
      (Mttotal.value < 0)) then begin
      P_help.Caption := '인원을 확인하십시오. ( - ) 값 확인!';
      Mtdirect.Setfocus;  FocusBy  := 1;  System.Exit;
  end;
}
  if ((Mtdirect.value < 0) or (Mtpos1.value < 0) or (Mtpos2.value < 0) or
      (Mtpos3.value < 0)   or (Mtpos4.value < 0) or (Mtpos5.value < 0) or
      (Mtpos6.value < 0)   or (Mtpos7.value < 0) or (Mtpos8.value < 0) or
      (Mtpos9.value < 0)   or (Msum1.value < 0)  or (Mtspe.value < 0)  or
      (Msum2.value < 0)    or (Mextr.value < 0)  or (Msum3.value < 0)  or
      (Mttotal.value < 0)) then begin
      P_help.Caption := '인원을 확인하십시오. ( - ) 값 확인!';
      Mtdirect.Setfocus;  FocusBy  := 1;  System.Exit;
  end;


 {2.실제 입력이나 저장이 이루어지는 부분.............................}
  temppo := Lyymm.Caption;
  Query1.Close;
  Query1.SQL.CLEAR;
  Query1.SQL.ADD(' SELECT DEPTCODE FROM PIHTOPO ');
  Query1.SQL.ADD('  WHERE ((TOPOYM =:ltopoym) AND');
  Query1.SQL.ADD('         (ORGNUM =:lorgnum) AND ');
  Query1.SQL.ADD('         (DEPTCODE =:ldeptcode) AND ');
  Query1.SQL.ADD('         (TPGUBUN =:ltpgubun)) ');
  Query1.ParamByName('ltopoym').AsString   := '999999';
  Query1.ParamByName('lorgnum').AsString   := Lorg.Caption;
  Query1.ParamByName('ldeptcode').AsString := Mdeptcode.text;
  Query1.ParamByName('ltpgubun').AsString  := CBgubun.text;
  Query1.OPEN;
  topocnt := Query1.RecordCount; {키값에 해당하는 레코드 수}
  Query1.Close;
  Query1.SQL.CLEAR;
  Query1.SQL.ADD(' SELECT FIELDCODE,BONCODE,SECTCODE,DEPTLEVEL FROM PYCDEPT ');
  Query1.SQL.ADD('  WHERE ((ORGNUM =:lorgnum) AND');
  Query1.SQL.ADD('         (DEPTCODE =:ldeptcode)) ');
  Query1.ParamByName('lorgnum').AsString   := Lorg.Caption;
  Query1.ParamByName('ldeptcode').AsString := Mdeptcode.text;
  Query1.OPEN;
  Fieldcode := Query1.Fields[0].AsString;
  Boncode   := Query1.Fields[1].AsString;
  sectcode   := Query1.Fields[2].AsString;
  deptlevel  := Query1.FieldS[3].AsString;
  if topocnt > 0 then
  begin
     P_help.Caption := '자료 수정 중입니다!';
     Application.Processmessages;
     Query2.Close;
     Query2.SQL.CLEAR;
{ ---------------------------------------------------------------------------
   버전    수정일     수정자   수정내용            관련근거
  30.00   1998.12.31  박규석   직위,직급수정       하나로인사재개발
  특정직은 특정, 임시직은 협력만 존재 (전임행정,특수직,고문,촉탁,용무 없어짐)
 ---------------------------------------------------------------------------}
     Query2.SQL.ADD(' UPDATE PIHTOPO ');
     Query2.SQL.ADD('    SET FIELDCODE ='''+Fieldcode+''', BONCODE ='''+Boncode+''', SECTCODE = '''+SECTCODE+''',');
     Query2.SQL.ADD('        DEPTLEVEL ='''+deptlevel+''',                ');
     Query2.SQL.ADD('        TDIRECT ='''+FloatToStr(Mtdirect.value)+''', ');
     Query2.SQL.ADD('        TPOS1 ='''+FloatToStr(Mtpos1.value)+''', ');
     Query2.SQL.ADD('        TPOS2 ='''+FloatToStr(Mtpos2.value)+''', ');
     Query2.SQL.ADD('        TPOS3 ='''+FloatToStr(Mtpos3.value)+''', ');
     Query2.SQL.ADD('        TPOS4 ='''+FloatToStr(Mtpos4.value)+''', ');
     Query2.SQL.ADD('        TPOS5 ='''+FloatToStr(Mtpos5.value)+''', ');
     Query2.SQL.ADD('        TPOS6 ='''+FloatToStr(Mtpos6.value)+''', ');
     Query2.SQL.ADD('        TPOS7 ='''+FloatToStr(Mtpos7.value)+''', ');
     Query2.SQL.ADD('        TPOS8 ='''+FloatToStr(Mtpos8.value)+''', ');  // 추가
     Query2.SQL.ADD('        TPOS9 ='''+FloatToStr(Mtpos9.value)+''', ');  // 추가
     Query2.SQL.ADD('        TPOSSUM ='''+FloatToStr(Msum1.value)+''', ');
//     Query2.SQL.ADD('        TSPE1 ='''+FloatToStr(Mtspe1.value)+''', ');
//     Query2.SQL.ADD('        TSPE2 ='''+FloatToStr(Mtspe2.value)+''', ');
//     Query2.SQL.ADD('        TSPE3 ='''+FloatToStr(Mtspe3.value)+''', ');
//     Query2.SQL.ADD('        TSPE4 ='''+FloatToStr(Mtspe4.value)+''', ');
     Query2.SQL.ADD('        TSPE1 ='''+FloatToStr(Mtspe.value)+''', ');
     Query2.SQL.ADD('        TSPESUM ='''+FloatToStr(Msum2.value)+''', ');
     Query2.SQL.ADD('        TEMPTOT ='''+FloatToStr(ltemptot)+''', ');         //정규직총계(일반+특정) shm
//     Query2.SQL.ADD('        TEXTR1 ='''+FloatToStr(Mextr1.value)+''', ');
//     Query2.SQL.ADD('        TEXTR2 ='''+FloatToStr(Mextr2.value)+''', ');
//     Query2.SQL.ADD('        TEXTR3 ='''+FloatToStr(Mextr3.value)+''', ');
//     Query2.SQL.ADD('        TTEMPSUM ='''+FloatToStr(Mextr.value)+''', ');   //협력 1.01 shm
//     Query2.SQL.ADD('        TEXTRSUM ='''+FloatToStr(Msum3.value)+''', ');   //임시직소계는 저장하지 않는다
     Query2.SQL.ADD('        TTEMPSUM ='''+FloatToStr(Msum3.value)+''', ');     //임시직소계->협력 1.01 shm
//     2002.04.15 shm 계약직+일반직 to로.정여진씨 요청
//     Query2.SQL.ADD('        TCONTSUM ='''+FloatToStr(Msum4.value)+''', ');     //계약직 소계 1.01
//
     Query2.SQL.ADD('        TIMSITOT ='''+FloatToStr(Ltimsitot)+''', ');
//
     Query2.SQL.ADD('        TTOTAL ='''+FloatToStr(Mttotal.value)+''', ');
     Query2.SQL.ADD('        TCRETIME =:lwritetime, TPBIGO ='''+Mbigo.text+''', ');
     Query2.SQL.ADD('        WRITETIME =:lwritetime, WRITEEMP =:lwriteemp ');
     Query2.SQL.ADD('  WHERE ((TOPOYM =:ltopoym) AND ');
     Query2.SQL.ADD('         (ORGNUM =:lorgnum) AND ');
     Query2.SQL.ADD('         (DEPTCODE =:ldeptcode) AND ');
     Query2.SQL.ADD('         (TPGUBUN =:ltpgubun))');

     Query2.ParamByName('ltopoym').AsString   := '999999';
     Query2.ParamByName('lorgnum').AsString   := Lorg.Caption;
     Query2.ParamByName('ldeptcode').AsString := Mdeptcode.text;
     Query2.ParamByName('ltpgubun').AsString  := CBgubun.text;
     Query2.ParamByName('lwritetime').AsString:= Copy(TimeDate(q_DATE),1,15);
     Query2.ParamByName('lwriteemp').AsString := pempno;

     Query2.EXECSQL;
     Query2.CLOSE;
     Btstate1;
     Mdeptcode.SetFocus;
     FocusBy  := 0;
     P_help.Caption := '자료 수정이 완료 되었습니다!';
  end
  else
  begin
     P_help.Caption := '자료 입력 중입니다!';
     Application.Processmessages;
     Query2.Close;
     Query2.SQL.Clear;
{ ---------------------------------------------------------------------------
   버전    수정일     수정자   수정내용            관련근거
  30.00   1998.12.31  박규석   직위,직급수정       하나로인사재개발
  특정직은 특정, 임시직은 협력만 존재 (전임행정,특수직,고문,촉탁,용무 없어짐)
 ---------------------------------------------------------------------------}
{     Query2.SQL.ADD(' INSERT  INTO  PIHTOPO ');
     Query2.SQL.ADD('(TOPOYM,ORGNUM,DEPTCODE,TPGUBUN,FIELDCODE,BONCODE,SECTCODE ');
     Query2.SQL.ADD(' TDIRECT,TPOS1,TPOS2,TPOS3,TPOS4,TPOS5, ');
     Query2.SQL.ADD(' TPOS6,TPOS7,TPOS8,TPOSSUM,TSPE1,TSPE21, ');
     Query2.SQL.ADD(' TSPE22,TSPE23,TSPE24,TSPE25,TSPE26,TSPE27, ');
     Query2.SQL.ADD(' TSPE2,TSPE3,TSPE4,TSPE5,TSPESUM,TEMPTOT, ');
     Query2.SQL.ADD(' TEXTR1,TEXTR2,TEXTR3,TEXTR4,TEXTR5, ');
     Query2.SQL.ADD(' TEXTRSUM,TTEMPSUM,TIMSITOT,TTOTAL,TCRETIME, ');
}
     Query2.SQL.ADD(' INSERT  INTO  PIHTOPO ');
     Query2.SQL.ADD('(TOPOYM,ORGNUM,DEPTCODE,TPGUBUN,FIELDCODE,BONCODE,SECTCODE,DEPTLEVEL ');
     Query2.SQL.ADD(' TDIRECT,TPOS1,TPOS2,TPOS3,TPOS4,TPOS5, ');
     Query2.SQL.ADD(' TPOS6,TPOS7,TPOS8,TPOS9,TPOSSUM,TSPE1,TSPE21, ');
     Query2.SQL.ADD(' TSPE22,TSPE23,TSPE24,TSPE25,TSPE26,TSPE27, ');
     Query2.SQL.ADD(' TSPE2,TSPE3,TSPE4,TSPE5,TSPESUM,TEMPTOT, ');
     Query2.SQL.ADD(' TEXTR1,TEXTR2,TEXTR3,TEXTR4,TEXTR5, ');
//     Query2.SQL.ADD(' TTEMPSUM,TCONTSUM,TIMSITOT,TTOTAL,TCRETIME, ');  //TCONTSUM 추가 1.01 shm
     Query2.SQL.ADD(' TTEMPSUM,TIMSITOT,TTOTAL,TCRETIME, ');             //TCONTSUM 삭제 1.01 shm 2002.04.15
                                                                                             
           // 직위,직급 변경 이전에 Remark 처리됨
{     Query2.SQL.ADD(' PDIR11,PDIR21,PDIR31,PDIR41,PDIR51,PDIR61,PDIR6A, ');
     Query2.SQL.ADD(' PDIR71,PDIR72,PDIR7A,PDIRETC,PDIRSUM, ');
     Query2.SQL.ADD(' PPOS1,PPOS2,PPOS3,PPOS4,PPOS5, ');
     Query2.SQL.ADD(' PPOS6,PPOS7,PPOS8,PPOSSUM, ');
     Query2.SQL.ADD(' PSPE1,PSPE21,PSPE22,PSPE23,PSPE24,PSPE25, ');
     Query2.SQL.ADD(' PSPE26,PSPE27,PSPE2,PSPE3,PSPE4,PSPE5, ');
     Query2.SQL.ADD(' PSPESUM,PEMPTOT, ');
     Query2.SQL.ADD(' PEXTR1,PEXTR2,PEXTR3,PEXTR4,PEXTR5, ');
     Query2.SQL.ADD(' PEXTRSUM,PTEMPSUM,PIMSITOT,PTOTAL,PCRETIME, ');}

     Query2.SQL.ADD(' TPBIGO,WRITETIME,WRITEEMP) ');

//   Query2.SQL.ADD(' VALUES(:ltopoym,:lorgnum,:ldeptcode,:ltpgubun, ');
     Query2.SQL.ADD(' VALUES(''999999'',:lorgnum,:ldeptcode,:ltpgubun, ');

     Query2.SQL.ADD('        '''+Fieldcode+''','''+Boncode+''','''+SECTcode+''','''+deptlevel+ ''',');
     Query2.SQL.ADD('        '''+FloatToStr(Mtdirect.value)+''', ');
     Query2.SQL.ADD('        '''+FloatToStr(Mtpos1.value)+''', ');
     Query2.SQL.ADD('        '''+FloatToStr(Mtpos2.value)+''', ');
     Query2.SQL.ADD('        '''+FloatToStr(Mtpos3.value)+''', ');
     Query2.SQL.ADD('        '''+FloatToStr(Mtpos4.value)+''', ');
     Query2.SQL.ADD('        '''+FloatToStr(Mtpos5.value)+''', ');
     Query2.SQL.ADD('        '''+FloatToStr(Mtpos6.value)+''', ');
     Query2.SQL.ADD('        '''+FloatToStr(Mtpos7.value)+''', ');
     Query2.SQL.ADD('        '''+FloatToStr(Mtpos8.value)+''', ');
     Query2.SQL.ADD('        '''+FloatToStr(Mtpos9.value)+''', ');
//     Query2.SQL.ADD('        '''+IntToStr(0)+''', ');
     Query2.SQL.ADD('        '''+FloatToStr(Msum1.value)+''', ');
     Query2.SQL.ADD('        '''+FloatToStr(Mtspe1.value)+''', ');
     Query2.SQL.ADD('        '''+IntToStr(0)+''','''+IntToStr(0)+''', ');
     Query2.SQL.ADD('        '''+IntToStr(0)+''','''+IntToStr(0)+''', ');
     Query2.SQL.ADD('        '''+IntToStr(0)+''','''+IntToStr(0)+''', ');
     Query2.SQL.ADD('        '''+IntToStr(0)+''', ');
//     Query2.SQL.ADD('        '''+FloatToStr(Mtspe2.value)+''', ');
//     Query2.SQL.ADD('        '''+FloatToStr(Mtspe3.value)+''', ');
//     Query2.SQL.ADD('        '''+FloatToStr(Mtspe4.value)+''', ');
     Query2.SQL.ADD('        '''+IntToStr(0)+''','''+IntToStr(0)+''', ');    // Mtspe2,Mtspe3
     Query2.SQL.ADD('        '''+IntToStr(0)+''', ');                        // Mtspe4

     Query2.SQL.ADD('        '''+IntToStr(0)+''', ');                        // Mtspe5
     Query2.SQL.ADD('        '''+FloatToStr(Msum2.value)+''', ');
     Query2.SQL.ADD('        '''+FloatToStr(ltemptot)+''', ');
//     Query2.SQL.ADD('        '''+FloatToStr(Mextr1.value)+''', ');
//     Query2.SQL.ADD('        '''+FloatToStr(Mextr2.value)+''', ');
//     Query2.SQL.ADD('        '''+FloatToStr(Mextr3.value)+''', ');
     Query2.SQL.ADD('        '''+IntToStr(0)+''','''+IntToStr(0)+''', ');    // Mextr1,Mextr2
     Query2.SQL.ADD('        '''+IntToStr(0)+''','''+IntToStr(0)+''', ');    // Mextr3,Mextr4
     Query2.SQL.ADD('        '''+IntToStr(0)+''', ');                        // Mextr5

     Query2.SQL.ADD('        '''+FloatToStr(Msum3.value)+''', ');            // 임시직소계는 저장하지 않는다
//     Query2.SQL.ADD('        '''+FloatToStr(Mextr.value)+''', ');          // TTEMPSUM 1.01 shm
//     2002.04.15 shm 계약직+일반직 to로.정여진씨 요청
//     Query2.SQL.ADD('        '''+FloatToStr(Msum4.value)+''', ');            // TCONTSUM 추가 1.01 shm

     Query2.SQL.ADD('        '''+FloatToStr(Ltimsitot)+''', ');
     Query2.SQL.ADD('        '''+FloatToStr(Mttotal.value)+''',:ltcretime, ');
{     Query2.SQL.ADD('        '''+IntToStr(0)+''','''+IntToStr(0)+''', ');
     Query2.SQL.ADD('        '''+IntToStr(0)+''','''+IntToStr(0)+''', ');
     Query2.SQL.ADD('        '''+IntToStr(0)+''','''+IntToStr(0)+''', ');
     Query2.SQL.ADD('        '''+IntToStr(0)+''','''+IntToStr(0)+''', ');
     Query2.SQL.ADD('        '''+IntToStr(0)+''','''+IntToStr(0)+''', ');
     Query2.SQL.ADD('        '''+IntToStr(0)+''','''+IntToStr(0)+''', ');
     Query2.SQL.ADD('        '''+IntToStr(0)+''','''+IntToStr(0)+''', ');
     Query2.SQL.ADD('        '''+IntToStr(0)+''','''+IntToStr(0)+''', ');
     Query2.SQL.ADD('        '''+IntToStr(0)+''','''+IntToStr(0)+''', ');
     Query2.SQL.ADD('        '''+IntToStr(0)+''','''+IntToStr(0)+''', ');
     Query2.SQL.ADD('        '''+IntToStr(0)+''','''+IntToStr(0)+''', ');
     Query2.SQL.ADD('        '''+IntToStr(0)+''','''+IntToStr(0)+''', ');
     Query2.SQL.ADD('        '''+IntToStr(0)+''','''+IntToStr(0)+''', ');
     Query2.SQL.ADD('        '''+IntToStr(0)+''','''+IntToStr(0)+''', ');
     Query2.SQL.ADD('        '''+IntToStr(0)+''','''+IntToStr(0)+''', ');
     Query2.SQL.ADD('        '''+IntToStr(0)+''','''+IntToStr(0)+''', ');
     Query2.SQL.ADD('        '''+IntToStr(0)+''','''+IntToStr(0)+''', ');
     Query2.SQL.ADD('        '''+IntToStr(0)+''','''+IntToStr(0)+''', ');
     Query2.SQL.ADD('        '''+IntToStr(0)+''','''+IntToStr(0)+''', ');
     Query2.SQL.ADD('        '''+IntToStr(0)+''','''+IntToStr(0)+''', ');
     Query2.SQL.ADD('        '''+IntToStr(0)+''','''+IntToStr(0)+''', ');
     Query2.SQL.ADD('        '''+IntToStr(0)+''','''+IntToStr(0)+''', NULL, ');}
     Query2.SQL.ADD('        '''+Mbigo.text+''', ');
     Query2.SQL.ADD('        :lwritetime,:lwriteemp)');

//   Query2.ParamByName('ltopoym').AsString    := Copy(temppo,1,4)+Copy(temppo,6,2);
     Query2.ParamByName('lorgnum').AsString    := Lorg.Caption;
     Query2.ParamByName('ldeptcode').AsString  := Mdeptcode.text;
     Query2.ParamByName('ltpgubun').AsString   := CBgubun.text;
     Query2.ParamByName('ltcretime').AsString  := Copy(TimeDate(q_DATE),1,15);
     Query2.ParamByName('lwritetime').AsString := Copy(TimeDate(q_DATE),1,15);
     Query2.ParamByName('lwriteemp').AsString  := pempno;
     Query2.EXECSQL;
     Query2.Close;
     Btstate1;
     Mdeptcode.SetFocus;
     FocusBy  := 0;
     P_help.Caption := '자료 입력이 완료 되었습니다!';
  end;
end;

procedure TFpie2030a.BB_DeleteClick(Sender: TObject);
var
  BitBtn: Integer;
begin
  BitBtn := Application.MessageBox('삭제하시겠습니까?', 'Message Box',
            mb_OKCancel + mb_DefButton1);
  if Bitbtn = IDOK then
  begin
    Query1.Close;
    Query1.SQL.Clear;
    Query1.SQL.ADD('DELETE FROM PIHTOPO ');
    Query1.SQL.ADD('  WHERE ((TOPOYM =:ltopoym) AND ');
    Query1.SQL.ADD('         (ORGNUM =:lorgnum) AND ');
    Query1.SQL.ADD('         (DEPTCODE =:ldeptcode) AND ');
    Query1.SQL.ADD('         (TPGUBUN =:ltpgubun))');
    Query1.ParamByName('ltopoym').AsString  := tempyymm;
    Query1.ParamByName('lorgnum').AsString  := lorg.Caption;
    Query1.ParamByName('ldeptcode').AsString:= Mdeptcode.text;
    Query1.ParamByName('ltpgubun').AsString := CBgubun.text;
    Query1.Execsql;
    ClearData;
    Mdeptcode.setfocus;
    FocusBy  := 0;
    Btstate1;
    P_Help.Caption := '해당 데이타를 삭제했습니다.';
  end
  else begin
    Mtdirect.setfocus;
    FocusBy  := 1;
    Btstate2;
  end;
end;

procedure TFpie2030a.ClearData;
begin
  Mtdirect.value:= 0;
  Mtpos1.value  := 0;
  Mtpos2.value  := 0;
  Mtpos3.value  := 0;
  Mtpos4.value  := 0;
  Mtpos5.value  := 0;
  Mtpos6.value  := 0;
  Mtpos7.value  := 0;
  Mtpos8.value  := 0;  // 추가
  Mtpos9.value  := 0;  // 추가
  Msum1.value   := 0;
  Mtspe.value   := 0;  // 추가
  Mtspe2.value  := 0;
  Mtspe1.value  := 0;
  Mtspe3.value  := 0;
  Mtspe4.value  := 0;
  Msum2.value   := 0;
  Mextr.value   := 0;  // 추가
  Mextr1.value  := 0;
  Mextr2.value  := 0;
  Mextr3.value  := 0;
  Msum3.value   := 0;
  Mttotal.value := 0;
  Ldirsum.value := 0;
  Lppos1.value  := 0;
  Lppos2.value  := 0;
  Lppos3.value  := 0;
  Lppos4.value  := 0;
  Lppos5.value  := 0;
  Lppos6.value  := 0;
  Lppos7.value  := 0;
  Lppos8.value  := 0;  // 추가
  Lppos9.value  := 0;  // 추가
  Lsum1.value   := 0;
  Lpspe.value   := 0;  // 추가
  Lpspe2.value  := 0;
  Lpspe1.value  := 0;
  Lpspe3.value  := 0;
  Lpspe4.value  := 0;
  Lsum2.value   := 0;
  Lpextr.value  := 0;  // 추가
  Lpextr1.value := 0;
  Lpextr2.value := 0;
  Lpextr3.value := 0;
  Lsum3.value   := 0;
  Lptotal.value := 0;
  Mbigo.Text    := '';
end;
procedure TFpie2030a.BB_cancelClick(Sender: TObject);
var
  BitBtn: Integer;
begin
  BitBtn := Application.MessageBox('취소하시겠습니까?', 'Message Box',
    mb_OKCancel + mb_DefButton1);
  if Bitbtn = IDOK then
  begin
    ClearData;
    CallData;
    Mtdirect.setfocus;
    FocusBy := 1;
    Btstate2;
  end
  else
    Mtdirect.setfocus;
    FocusBy := 1;
    Btstate2;
end;

procedure TFpie2030a.FormPaint(Sender: TObject);
VAR
  RSTR : STRING;
begin
  if start = 0 then
  begin
//    if not pass.PassDialog(Self, pempno, pkorname, password) then
//      System.Halt(0);
    start := 1;
    L_UserName.Caption := pkorname+'('+pempno+')';
    rStr               := Timeftp.TimeDate(q_DATE);
    L_CurDate.Caption  := Copy(rStr, 1, 4)+'/'+
                          Copy(rStr, 5, 2)+'/'+
                          Copy(rStr, 7, 2);

  end;
end;

procedure TFpie2030a.MdeptcodeKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if not (ssShift in Shift) then
        begin
        if (key = vk_return) then begin
            DeptChk;
            if Deptcnt > 0 then begin
               if not ((CBgubun.text = '10') or (CBgubun.text = '20') or
                       (CBgubun.text = '30')) then begin
                        P_Help.caption := '구분 확인 바랍니다.';
                        CBgubun.SetFocus;
                        FocusBy  := 0;
                        end
               else begin
                  e_deptname.Text := Dname;
                  Mtdirect.Setfocus;
                  FocusBy  := 1;
                  Btstate2;
                  CallData;
                  P_Help.caption := '';
                  end;
               end
            else begin
               P_Help.caption := '부서코드 확인 바랍니다.';
               Mdeptcode.SetFocus;
               FocusBy  := 0;
               end;
            end;
        end;

     if not (ssShift in Shift) then
        begin
        if (key = vk_tab) then begin
            DeptChk;
            e_deptname.Text := Dname;
            CBgubun.Setfocus;
            FocusBy  := 0;
            end;
        end;

end;

procedure TFpie2030a.DataControl(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
{ ---------------------------------------------------------------------------
   버전    수정일     수정자   수정내용            관련근거
  30.00   1998.12.31  박규석   직위,직급수정       하나로인사재개발
  특정직은 특정, 임시직은 협력만 존재 (전임행정,특수직,고문,촉탁,용무 없어짐)
 ---------------------------------------------------------------------------}

//if not(ssShift  in Shift) then
//begin
//  if (Key = vk_Tab) {or {(Key = vk_Return)} then
{  begin
    P_Help.Caption := '탭 키는 단순이동! ENTER 키는 계산 후 이동!';
    case TComponent(Sender).Tag of
      1 : Mtdirect.SetFocus;
      2 : Mtpos1.SetFocus;
      3 : Mtpos2.SetFocus;
      4 : Mtpos3.SetFocus;
      5 : Mtpos4.SetFocus;
      6 : Mtpos5.SetFocus;
      7 : Mtpos6.SetFocus;
      8 : Mtpos7.SetFocus;
      9 : Msum1.SetFocus;
      10: Mtspe2.SetFocus;
      11: Mtspe1.SetFocus;
      12: Mtspe3.SetFocus;
      13: Mtspe4.SetFocus;
      14: Msum2.SetFocus;
      15: Mextr1.SetFocus;
      16: Mextr2.SetFocus;
      17: Mextr3.SetFocus;
      18: Msum3.SetFocus;
      19: Mbigo.SetFocus;
      20: Mtdirect.SetFocus;
    end; // case end
  end; // inner if end
end // if end
else
}
//begin
//  if (Key = vk_Tab) {or {(Key = vk_Return) }then
{  begin
    P_Help.Caption := '탭 키는 단순이동! ENTER 키는 계산 후 이동!';
    case TComponent(Sender).Tag of
      3 : Mtdirect.SetFocus;
      4 : Mtpos1.SetFocus;
      5 : Mtpos2.SetFocus;
      6 : Mtpos3.SetFocus;
      7 : Mtpos4.SetFocus;
      8 : Mtpos5.SetFocus;
      9 : Mtpos6.SetFocus;
      10: Mtpos7.SetFocus;
      11: Msum1.SetFocus;
      12: Mtspe2.SetFocus;
      13: Mtspe1.SetFocus;
      14: Mtspe3.SetFocus;
      15: Mtspe4.SetFocus;
      16: Msum2.SetFocus;
      17: Mextr1.SetFocus;
      18: Mextr2.SetFocus;
      19: Mextr3.SetFocus;
      20: Msum3.SetFocus;
      1 : Mbigo.SetFocus;
      2 : Mbigo.SetFocus;

    end; // case end
  end; // inner if end
end; // else end

begin
  if (Key = vk_Return) then
  begin
    P_Help.Caption := '탭 키는 단순이동! ENTER 키는 계산 후 이동!';
    case TComponent(Sender).Tag of
      1 : Mtdirect.SetFocus;
      2 : begin
          Mtpos1.SetFocus;
          Calculate1;  Calculate2;  Calculate3;  Calculate4;
          end;
      3 : begin
          Mtpos2.SetFocus;
          Calculate1;  Calculate2;  Calculate3;  Calculate4;
          end;
      4 : begin
          Mtpos3.SetFocus;
          Calculate1;  Calculate2;  Calculate3;  Calculate4;
          end;
      5 : begin
          Mtpos4.SetFocus;
          Calculate1;  Calculate2;  Calculate3;  Calculate4;
          end;
      6 : begin
          Mtpos5.SetFocus;
          Calculate1;  Calculate2;  Calculate3;  Calculate4;
          end;
      7 : begin
          Mtpos6.SetFocus;
          Calculate1;  Calculate2;  Calculate3;  Calculate4;
          end;
      8 : begin
          Mtpos7.SetFocus;
          Calculate1;  Calculate2;  Calculate3;  Calculate4;
          end;
      9 : begin
          Msum1.SetFocus;
          Calculate1;  Calculate2;  Calculate3;  Calculate4;
          end;
      10: begin
          Mtspe2.SetFocus;
          Calculate4;
          end;
      11: begin
          Mtspe1.SetFocus;
          Calculate1;  Calculate2;  Calculate3;  Calculate4;
          end;
      12: begin
          Mtspe3.SetFocus;
          Calculate1;  Calculate2;  Calculate3;  Calculate4;
          end;
      13: begin
          Mtspe4.SetFocus;
          Calculate1;  Calculate2;  Calculate3;  Calculate4;
          end;
      14: begin
          Msum2.SetFocus;
          Calculate1;  Calculate2;  Calculate3;  Calculate4;
          end;
      15: begin
          Mextr1.SetFocus;
          Calculate4;
          end;
      16: begin
          Mextr2.SetFocus;
          Calculate1;  Calculate2;  Calculate3;  Calculate4;
          end;
      17: begin
          Mextr3.SetFocus;
          Calculate1;  Calculate2;  Calculate3;  Calculate4;
          end;
      18: begin
          Msum3.SetFocus;
          Calculate1;  Calculate2;  Calculate3;  Calculate4;
          end;
      19: begin
          Mbigo.SetFocus;
          Calculate4;
          end;
      20: Mtdirect.SetFocus;
    end; // case end
  end; // inner if end
end; // if end
}

if not(ssShift  in Shift) then
begin
  if (Key = vk_Tab) {or {(Key = vk_Return)} then
  begin
    P_Help.Caption := '탭 키는 단순이동! ENTER 키는 계산 후 이동!';
    case TComponent(Sender).Tag of
      1 : Mtdirect.SetFocus;
      2 : Mtpos1.SetFocus;
      3 : Mtpos2.SetFocus;
      4 : Mtpos3.SetFocus;
      5 : Mtpos4.SetFocus;
      6 : Mtpos5.SetFocus;
      7 : Mtpos6.SetFocus;
      8 : Mtpos7.SetFocus;
      9 : Mtpos8.SetFocus;
      10: Mtpos9.SetFocus;
      11: Msum1.SetFocus;
      12: Mtspe.SetFocus;
      13: Msum2.SetFocus;
      15: Mextr.SetFocus;
      16: Msum3.SetFocus;
      19: Mbigo.SetFocus;
      20: Mtdirect.SetFocus;
    end; // case end
  end; // inner if end
end // if end
else
begin
  if (Key = vk_Tab) {or {(Key = vk_Return) }then
  begin
    P_Help.Caption := '탭 키는 단순이동! ENTER 키는 계산 후 이동!';
    case TComponent(Sender).Tag of
      3 : Mtdirect.SetFocus;
      4 : Mtpos1.SetFocus;
      5 : Mtpos2.SetFocus;
      6 : Mtpos3.SetFocus;
      7 : Mtpos4.SetFocus;
      8 : Mtpos5.SetFocus;
      9 : Mtpos6.SetFocus;
      10: Mtpos7.SetFocus;
      11: Mtpos8.SetFocus;
      12: Mtpos9.SetFocus;
      13: Msum1.SetFocus;
      15: Mtspe.SetFocus;
      16: Msum2.SetFocus;
      19: Mextr.SetFocus;
      20: Msum3.SetFocus;
      1 : Mbigo.SetFocus;
      2 : Mbigo.SetFocus;

    end; // case end
  end; // inner if end
end; // else end

begin
  if (Key = vk_Return) then
  begin
    P_Help.Caption := '탭 키는 단순이동! ENTER 키는 계산 후 이동!';
    case TComponent(Sender).Tag of
      1 : Mtdirect.SetFocus;
      2 : begin
          Mtpos1.SetFocus;
          Calculate1;  Calculate2;  Calculate3;  Calculate4;
          end;
      3 : begin
          Mtpos2.SetFocus;
          Calculate1;  Calculate2;  Calculate3;  Calculate4;
          end;
      4 : begin
          Mtpos3.SetFocus;
          Calculate1;  Calculate2;  Calculate3;  Calculate4;
          end;
      5 : begin
          Mtpos4.SetFocus;
          Calculate1;  Calculate2;  Calculate3;  Calculate4;
          end;
      6 : begin
          Mtpos5.SetFocus;
          Calculate1;  Calculate2;  Calculate3;  Calculate4;
          end;
      7 : begin
          Mtpos6.SetFocus;
          Calculate1;  Calculate2;  Calculate3;  Calculate4;
          end;
      8 : begin
          Mtpos7.SetFocus;
          Calculate1;  Calculate2;  Calculate3;  Calculate4;
          end;
      9 : begin
          Mtpos8.SetFocus;
          Calculate1;  Calculate2;  Calculate3;  Calculate4;
          end;
      10: begin
          Mtpos9.SetFocus;
          Calculate1;  Calculate2;  Calculate3;  Calculate4;
          end;
      11: begin
          Msum1.SetFocus;
          Calculate1;  Calculate2;  Calculate3;  Calculate4;
          end;
      12: begin
          Mtspe.SetFocus;
          Calculate4;
          end;
      13: begin
          Msum2.SetFocus;
          Calculate1;  Calculate2;  Calculate3;  Calculate4;
          end;
      15: begin
          Mextr.SetFocus;
          Calculate4;
          end;
      16: begin
          Msum3.SetFocus;
          Calculate1;  Calculate2;  Calculate3;  Calculate4;
          end;
      19: begin
          Mbigo.SetFocus;
          Calculate4;
          end;
      20: Mtdirect.SetFocus;
    end; // case end
  end; // inner if end
end; // if end

end;

procedure TFpie2030a.DeptChk;
begin
     Query1.Close;
     Query1.SQL.Clear;
     Query1.SQL.ADD(' SELECT DEPTCODE,DEPTNAME                                      ');
     Query1.SQL.ADD('   FROM PYCDEPT                                                ');
     Query1.SQL.ADD('  WHERE ((ORGNUM = '''+Lorg.caption+''')                       ');
     if Length(Trim(Mdeptcode.Text)) >= 5 then
        Query1.SQL.ADD('    AND  (DEPTCODE = '''+Mdeptcode.text+''')                   ');
     if Length(Trim(e_deptname.Text)) > 2 then
     begin
        Query1.SQL.ADD('    AND  ( DEPTNAME LIKE ''%'+Trim(e_deptname.Text)+'%'')  ');
     end;
     Query1.SQL.ADD('    AND  (EXISTON  =  ''1'')                                   ');
     Query1.SQL.ADD('    AND  (CHANMODE != ''3'')                                   ');
     Query1.SQL.ADD('    AND  (NVL(SUBSTR(DEPTLEVEL,1,1),'' '') <= '''+Tlevel+''') )');
     Query1.Open;
     Deptcnt := Query1.RecordCount;
     DeptCD  := Query1.Fields[0].AsString;
     Dname   := Query1.Fields[1].AsString;
     Query1.Close;
end;

procedure TFpie2030a.CBgubunChange(Sender: TObject);
begin
     if CBgubun.text = '10' then
        guname.caption := '계획인원/현원'
     else
     if CBgubun.text = '20' then
        guname.caption := '교육/파견'
     else
     if CBgubun.text = '30' then
        guname.caption := '노조전임';

     CallData;
end;

procedure TFpie2030a.BB_runClick(Sender: TObject);
begin
     DeptChk;
     if Deptcnt > 0 then begin
        if not ((CBgubun.text = '10') or (CBgubun.text = '20') or
                (CBgubun.text = '30')) then begin
                 P_Help.caption := '구분 확인 바랍니다.';
                 CBgubun.SetFocus;
                 FocusBy  := 0;
                 end
        else begin
             e_deptname.Text := Dname;
             Mtdirect.Setfocus;
             FocusBy  := 1;
             Btstate2;
             CallData;
             end;
        end
     else begin
        P_Help.caption := '부서코드 확인 바랍니다.';
        Mdeptcode.SetFocus;
        FocusBy  := 0;
        end;
end;

procedure TFpie2030a.CBgubunKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if not (ssShift in Shift) then
        begin
        if (key = vk_tab) or (key = vk_return) then
            if ((CBgubun.text = '10') or (CBgubun.text = '20') or
                (CBgubun.text = '30')) then begin
                 Mdeptcode.Setfocus;
                 FocusBy  := 0;
                 end
            else begin
                 P_Help.caption := '구분 확인 바랍니다.';
                 end;
        end;
end;

procedure TFpie2030a.MttotalClick(Sender: TObject);
begin
     if FocusBy = 0 then
     begin
     DeptChk;
     if Deptcnt > 0 then begin
        if not ((CBgubun.text = '10') or (CBgubun.text = '20') or
                (CBgubun.text = '30')) then begin
                 P_Help.caption := '구분 확인 바랍니다.';
                 CBgubun.SetFocus;
                 FocusBy  := 0;
                 end
        else begin
             e_deptname.Text := Dname;
             Btstate2;
             CallData;
             FocusBy  := 1;
             P_Help.Caption := '';
             end;
        end
     else begin
        P_Help.caption := '부서코드 확인 바랍니다.';
        Mdeptcode.SetFocus;
        FocusBy  := 0;
        end;
     end
     else begin
        P_Help.caption := '탭 키는 단순이동! ENTER 키는 계산 후 이동!';
     end;
end;

procedure TFpie2030a.MdeptcodeClick(Sender: TObject);
begin
     Btstate1;
     FocusBy  := 0;
     P_Help.Caption := '';
end;

procedure TFpie2030a.CBgubunEnter(Sender: TObject);
begin
     Btstate1;
     FocusBy  := 0;
     P_Help.Caption := '';
end;

procedure TFpie2030a.MdeptcodeEnter(Sender: TObject);
begin
  e_deptname.Clear;
  ClearData;
end;

procedure TFpie2030a.e_deptnameEnter(Sender: TObject);
begin
  Mdeptcode.Clear;
  ClearData;
end;

procedure TFpie2030a.e_deptnameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then
  begin
    DeptChk;
    if Deptcnt = 0 then
    begin
      MessageDlg('해당 부서명이 존재하지 않습니다.!!'+#13+#10+''+#13+#10+'다시 검색하세요!', mtError, [mbOK], 0);
      System.Exit;
    end;
    if Deptcnt = 1 then
    begin
      Mdeptcode.Text := DeptCD;
      e_deptname.Text := Dname;
    end;
    if Deptcnt > 1 then
    begin
      deptForm := TDeptForm.Create(self);
      DeptForm.Deptnm.Text := e_deptname.Text;
      deptForm.ShowModal;
      Try
        Mdeptcode.Text  := deptForm.Code1;
        e_deptname.Text := deptForm.CodeName;
      Finally
        deptForm.Free;
      end;
    end;
//  Deptcnt
    Btstate2;
    CallData;
  end;
end;

end.
