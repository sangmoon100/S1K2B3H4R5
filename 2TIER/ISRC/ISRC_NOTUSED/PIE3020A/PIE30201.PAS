{=============================== Program Header ================================
 PROGRAM-NAME   : PIE3020A(부문인사)
 SYSTEM-NAME    : 인사/인력개발
 SUBSYSTEM-NAME : 부문인사
 Programmer     : 부문인사 [ 부서/BAND별 인원현황 ]
 Version        : 1.0
 Date           : 2012.07.18
Update Contents
  버전    수정일        수정자       수정내용          관련근거
  1.00    2012.07.18    이희용       신규개발          HR팀 요청
================================================================================}

unit PIE30201;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, Gauges, ExtCtrls, Tabs, TabNotBk,
  Mask,  DBTables, Quickrpt, DBGrids, pass, Datelib, Timeftp,
  Db, ComObj, OleCtrls, Grids, kpaylib, MemDS, DBAccess, Ora, Func, DBClient,
  KeyEmpno, keycode,  DeptCode,
  Oninsacommon, OnScheme, OnEditBaseCtrl,
  OnEditStdCtrl, OnLineLabel, OnGrDBGrid, OnFocusButton, Provider;
type
  TMainForm = class(TForm)
    Panel1: TPanel;
    L_Name: TLabel;
    L_Date: TLabel;
    Panel3: TPanel;
    Panel2: TPanel;
    Label7: TLabel;
    Panel14: TPanel;
    P_Body: TPanel;
    ME_WorkDate: TMaskEdit;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Edit1_1: TEdit;
    Edit2_1: TEdit;
    Edit3_1: TEdit;
    Edit4_1: TEdit;
    Edit5_1: TEdit;
    Edit6_1: TEdit;
    Edit7_1: TEdit;
    Edit8_1: TEdit;
    Edit1_2: TEdit;
    Edit2_2: TEdit;
    Edit3_2: TEdit;
    Edit4_2: TEdit;
    Edit5_2: TEdit;
    Edit6_2: TEdit;
    Edit7_2: TEdit;
    Edit8_2: TEdit;
    Edit1_3: TEdit;
    Edit2_3: TEdit;
    Edit3_3: TEdit;
    Edit4_3: TEdit;
    Edit5_3: TEdit;
    Edit6_3: TEdit;
    Edit7_3: TEdit;
    Edit8_3: TEdit;
    Panel15: TPanel;
    Panel17: TPanel;
    Panel5: TPanel;
    G_Progress: TGauge;
    Panel16: TPanel;
    Panel4: TPanel;
    BB_Close: TBitBtn;
    BB_Screen: TBitBtn;
    BB_Print: TBitBtn;
    P_helpinfo: TPanel;
    P_Help: TLabel;
    Label1: TLabel;
    Panel18: TPanel;
    Panel19: TPanel;
    Panel20: TPanel;
    Panel21: TPanel;
    L_LastDate: TPanel;
    L_CurCreate: TPanel;
    L_PlaneCreate: TPanel;
    BB_SetUp: TBitBtn;
    PrinterSetup: TPrinterSetupDialog;
    Btext: TBitBtn;
    SaveDialog1: TSaveDialog;
    NewQry: TOraQuery;
    Query_TotalSum: TOraQuery;
    Q_date: TOraQuery;
    Query_comment1: TOraQuery;
    Q_vari: TOraQuery;
    Query_comment2: TOraQuery;
    Query1: TOraQuery;
    Qbondept: TOraQuery;
    Query_Sectotal: TOraQuery;
    Query_SubTotal: TOraQuery;
    Query_Detail: TOraQuery;
    Query_PartTotal: TOraQuery;
    Q_Updatevari: TOraQuery;
    Qboncode: TOraQuery;
    OraQuery1: TOraQuery;
    Q_variVALUE1: TStringField;
    Q_variVALUE2: TStringField;
    Q_variVALUE3: TStringField;
    Q_variVALUE4: TStringField;
    Ora_Session: TOraSession;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BB_CloseClick(Sender: TObject);
    procedure BB_ScreenClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure Edit1_1Change(Sender: TObject);
    procedure BB_SetUpClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    wordpad   : Boolean;
    pempno, pkorname, password: string;
    deptlevel,pdeptcode,pcount,fincode,detcode : string;
    start: Integer;
    Q_deptcode : string;
    Change_PIMVARI: Boolean;
    rStr: string;
    { Private declarations }
    procedure Data_Display(Sender: TObject);
    Procedure Data_Display_csv(Sender: TObject);
    Procedure Data_Display_csv2(Sender: TObject); //신 BAND체계 양식 (정규용 추가.2004.06.22)
    Procedure Data_Display2;
    Procedure Data_Display_csv3(Sender: TObject); //신 직위BAND체계 양식 (지순미 추가.2008.08.11)
    procedure ShowPreView;
    procedure Executive_Data;
    function  PageCheck(var pageLine : integer; gubun : integer) : Boolean;
    procedure Update_History;
  public
    { Public declarations }
    AReport: TQuickRep;
    payrachym  : string;
    f_SECTCODE : string;
    procedure ClearData;
    function  DeptNameFind : string;

  end;

type
  TDataIn = record
      flag      : string[1];  {C:계속, S:인쇄후 구분선 출력}
      deptcode  : string[6];  //19990511
      deptname  : string[30];
      ttotal    : string[7];
      ptotal    : string[7];
      insuff    : string[7];
      pdirsum   : string[7];
      PDIR71    : string[7];        // 상무보
      PDIR72    : string[7];        // 전문임원
      ppos1     : string[7];
      ppos2     : string[7];
      ppos3     : string[7];
      ppos4     : string[7];
      ppos5     : string[7];
      ppos6     : string[7];
      ppos7     : string[7];
      ppos8     : string[7];
      ppos9     : string[7];
      pspe      : string[7];
      pemp      : string[7];
      pextrsum  : string[7];
      //계약/일반 t/o
      tcontsum  : string[7];
      ttempsum  : string[7];
      // 계약직 관련 수정
      pcontsum  : string[7];
      pimsisum  : string[7]; //2002.04.17 shm 추가 (계약+일반)
      psconsum  : string[7]; //2002.07.29 shm 전문계약직 추가
      psum      : string[7];
      pbumn     : string[1];
      Plevel    : boolean;
      Italicline : boolean;
      Boldline  : boolean;  //30.20
  end;

var
  MainForm: TMainForm;
  Fout : file of TDataIn;
  FCom : Textfile;
  DataIn     : TDataIn;
  ErrorHelp  : array[0..255] of char;
  HomeDir    : string;
  app : Variant;
  Boldline   : Boolean;
  Italicline : boolean;
implementation

{$R *.DFM}

uses
  PIE30202, PIE30205, PIE30207, PIE30208;

const
  sFORMAT = '#####';
  dFORMAT = '(###)';
//11111111111111111111111111111111111111111111111111

procedure TMainForm.FormShow(Sender: TObject);
begin
  if Start = 0 then
  begin
    Application.ProcessMessages;

    Pempno   := PassEmp(CmdLine, 1);
    Pkorname := PassEmp(CmdLine, 2);
    Password := PassEmp(CmdLine, 3);
    Ora_Session.Options.Net   := True;
    Ora_Session.ConnectPrompt := False;
    Ora_Session.Username      := Passemp(cmdline,5);
    Ora_Session.Password      := Passemp(cmdline,6);
    Ora_Session.Server        := Passemp(cmdline,7)+':'+Passemp(cmdline,9)+':'+Passemp(cmdline,8);

    try
      Ora_Session.Connected := True;
    except on E : Exception do
      Application.MessageBox(PChar('서버에 접속할 수 없습니다...'#13#13+E.Message),'알 림',MB_OK);
    end;

    HomeDir := HomeDirOpen;
    AReport := NewPrintForm1.InReport;

    with Query1 do
    begin
      Close;
      Sql.Clear;
      Sql.Add(' SELECT SUBSTRB(SECTCODE,1,1) CODE FROM PICHARE ');
      Sql.Add(' WHERE EMPNO = ''' +pempno+ ''' ');
      Sql.Add('   AND USEYN = ''Y'' ');
      Open;

      f_SECTCODE := Query1.FieldByName('CODE').AsString;
    end;
  end;
end;


procedure TMainForm.FormPaint(Sender: TObject);
var
  i,j : integer;
  EditCom: TEdit;
begin
  if start = 0 then
  begin
    start := 1;
    Application.ProcessMessages;
    L_Date.Caption := fn_GetDateStr;

    rStr := Copy(L_Date.Caption,1,4) + Copy(L_Date.Caption,6,2) + Copy(L_Date.Caption,9,2);


    L_Name.Caption := pkorname+'('+pempno+')';
    P_Help.Caption := '인사변수화일을 읽는 중입니다 !!..';
    SendMessage(P_helpinfo.handle,WM_PAINT,0,0);

    with Q_vari do
    begin
      Close;
      Sql.Clear;
      Sql.Add('SELECT value1,value2,value3,value4 FROM pimvari ');
      Sql.Add('WHERE gubun = :P_gubun AND sgubun = :P_sgubun   ');

      ParamByName('P_gubun').AsString  := '50';
      ParamByName('P_sgubun').AsString := '0001';
      Open; {최종작업년월}

      L_LastDate.Caption := Copy(FieldByName('VALUE2').AsString,1,4)+'.'+
                            Copy(FieldByName('VALUE2').AsString,5,2);
      ME_WorkDate.Text   := Copy(FieldByName('VALUE2').AsString,1,6);
      Close;
     //=======(98.01.21 총무관리본부 파견 계획인원 변수 )
      ParamByName('P_gubun').AsString  := '50';
      ParamByName('P_sgubun').AsString := '1001';
      Open;
      pdeptcode := FieldByName('VALUE1').AsString;
      pcount    := FieldByName('VALUE2').AsString;
      close;
    //========

       ParamByName('P_gubun').AsString  := '50';
       ParamByName('P_sgubun').AsString := '0002';
       Open; {계획인원생성일자, 현원생성일자}
       L_PlaneCreate.Caption := Copy(FieldByName('VALUE1').AsString,1,4)+'.'+
                                Copy(FieldByName('VALUE1').AsString,5,2)+'.'+
                                Copy(FieldByName('VALUE1').AsString,7,2);
       L_CurCreate.Caption   := Copy(FieldByName('VALUE2').AsString,1,4)+'.'+
                                Copy(FieldByName('VALUE2').AsString,5,2)+'.'+
                                Copy(FieldByName('VALUE2').AsString,7,2);
       Close;

       ParamByName('P_gubun').AsString  := 'E2';
       for i := 1 to 8 do begin
          ParamByName('P_sgubun').AsString := 'CM0'+IntToStr(i);
          Open;
          for j := 1 to 3 do  begin
              EditCom := Self.FindComponent('Edit'+IntToStr(i)+'_'+inttostr(j)) as TEdit;
              if EditCom <> nil then
              EditCom.Text := FieldByName('VALUE'+IntToStr(j)).AsString;
          end;
         Close;
       end;
      //=======(2008.08.11  변수직위체계변경월 )
      ParamByName('P_gubun').AsString  := '00';
      ParamByName('P_sgubun').AsString := '0001';
      Open;
      payrachym := FieldByName('VALUE4').AsString;
      close;
    //========

    end; // with vari end
    Change_PIMVARI := False;
    P_Help.Caption := '';
  end;
end;

procedure TMainForm.Data_Display_csv(Sender : TObject);
var
  Fexcel : textfile;
  LineCnt, cnt, ProgressCnt : Integer;
  Buff, Buff1, Buff2, Buff3, Buff4, Fmt : string;
  S, temp, temp2 : String;

begin
  Application.ProcessMessages;
  assignfile(Fexcel, SaveDialog1.FileName);
  rewrite(Fexcel);
  writeln(Fexcel, ',,,,,,부,서,/,직,급,별,,인,원,현,황');
  writeln(Fexcel, '');
  writeln(Fexcel, ',[기준년월] ,:, '+copy(L_Date.Caption,1,4)+' 년, '+copy(L_Date.Caption,6,2)+' 월');
  writeln(Fexcel, '');
  writeln(Fexcel, '부서명,계획대비현황,,,,정,규,직,인,원,계,약,일,반,,');
  writeln(Fexcel, ',부서코드,재무부서코드,상무보이상,계획,현원,과부족,상무보,SM2급,SM1급,M2급,M1급,S2급,S1급,J3급,J2급,J1급,특정,계,계획,전계,계약,일반,계,총계');
/////
  Query_TotalSum.Close;
  G_Progress.Progress := 0;
  Query_TotalSum.ParamByName('P_topoym').AsString := ME_WorkDate.Text;
  Query_TotalSum.Open;

  if Query_TotalSum.RecordCount = 0 then
  begin
       MessageBox(handle,'작업조건에 맞는 자료가 없습니다.','알  림',MB_OK or $0030);
       Query_TotalSum.Close;
       System.Exit;
  end;

  LineCnt := 1;

  with DataIn do
  begin
    ClearData;
    plevel   := false;
    S := '      총     계' + ',,,';

    S  := S + FormatFloat(sFORMAT,   Query_TotalSum.FieldByName('PDIRSUM').AsInteger -
                                     Query_TotalSum.FieldByName('PDIR71').AsInteger)   +','; //상무보이상

//    S  := S + FormatFloat(sFORMAT, Query_TotalSum.FieldByName('TTOTAL').AsInteger) +',';
    s  := s + FormatFloat(sFORMAT, Query_TotalSum.FieldByName('TEMPTOT').AsInteger) +','; //30.21 shm== 계획인원

    S  := S + FormatFloat(sFORMAT, Query_TotalSum.FieldByName('PTOTAL').AsInteger +
                                     Query_TotalSum.FieldByName('PSPE2').AsInteger  +
                                     Query_TotalSum.FieldByName('PDIR71').AsInteger)+',';//현원

    S  := S + FormatFloat(sFORMAT, (Query_TotalSum.FieldByName('PTOTAL').AsInteger +
                                   (Query_TotalSum.FieldByName('PDIR71').AsInteger) +
                                    Query_TotalSum.FieldByName('PSPE2').AsInteger) -
                                    //  Query_TotalSum.FieldByName('TTOTAL').AsInteger)+',';    //3333333
                                    Query_TotalSum.FieldByName('TEMPTOT').AsInteger)+',';//과부족

    S  := S + FormatFloat(sFORMAT, Query_TotalSum.FieldByName('PDIR71' ).AsInteger)+','; //상무보

    S  := S + FormatFloat(sFORMAT, Query_TotalSum.FieldByName('PPOS1'  ).AsInteger+
                                   Query_TotalSum.FieldByName('PSPE21' ).AsInteger)+','; //SM2급

    S  := S + FormatFloat(sFORMAT, Query_TotalSum.FieldByName('PPOS2').AsInteger+
                                     Query_TotalSum.FieldByName('PSPE22').AsInteger)+','; //SM1급

    S  := S + FormatFloat(sFORMAT, Query_TotalSum.FieldByName('PPOS3').AsInteger+
                                     Query_TotalSum.FieldByName('PSPE23').AsInteger)+',';//M2급

    S  := S + FormatFloat(sFORMAT, Query_TotalSum.FieldByName('PPOS4').AsInteger+
                                     Query_TotalSum.FieldByName('PSPE24').AsInteger)+',';//M1급

    S  := S + FormatFloat(sFORMAT, Query_TotalSum.FieldByName('PPOS5').AsInteger+
                                     Query_TotalSum.FieldByName('PSPE25').AsInteger)+',';//S2급

    S  := S + FormatFloat(sFORMAT, Query_TotalSum.FieldByName('PPOS6').AsInteger+
                                     Query_TotalSum.FieldByName('PSPE26').AsInteger)+',';//S1급

    S  := S + FormatFloat(sFORMAT, Query_TotalSum.FieldByName('PPOS7').AsInteger+
                                     Query_TotalSum.FieldByName('PSPE27').AsInteger)+','; //J3급

    S  := S + FormatFloat(sFORMAT, Query_TotalSum.FieldByName('PPOS8').AsInteger)+',';    //J2급

    S  := S + FormatFloat(sFORMAT, Query_TotalSum.FieldByName('PPOS9').AsInteger)+',';   //J1급

    S  := S + FormatFloat(sFORMAT, Query_TotalSum.FieldByName('PSPE').AsInteger)+',';    //특정직

    S  := S + FormatFloat(sFORMAT, Query_TotalSum.FieldByName('PTOTAL').AsInteger+
                                     Query_TotalSum.FieldByName('PSPE2').AsInteger)+',';  //정규직계
    // 계약직 관련 수정

//  S  := S + FormatFloat(sFORMAT, Query_TotalSum.FieldByName('tcontsum').AsInteger)+','; //계약 t/0  2001.08.02 shm

    S  := S + FormatFloat(sFORMAT, Query_TotalSum.FieldByName('ttempsum').AsInteger)+',';// 계약직 계획인원

    S  := S + FormatFloat(sFORMAT, Query_TotalSum.FieldByName('PSCONSUM').AsInteger)+','; //전문계약
    S  := S + FormatFloat(sFORMAT, Query_TotalSum.FieldByName('pcontsum').AsInteger)+','; //계약
    S  := S + FormatFloat(sFORMAT, Query_TotalSum.FieldByName('PEXTRSUM').AsInteger)+','; //일반

    S := S + FormatFloat(sFORMAT, Query_TotalSum.FieldByName('PPTOTAL').AsInteger)+','; //계약계

    S  := S + FormatFloat(sFORMAT, Query_TotalSum.FieldByName('PDIRSUM').AsInteger + //총계   31.71   2004.03.08   정규용   자체
                                   Query_TotalSum.FieldByName('PTOTAL').AsInteger  +
                                   Query_TotalSum.FieldByName('PSPE2').AsInteger   +
                                   Query_TotalSum.FieldByName('PPTOTAL').AsInteger)+ ',';
    writeln(Fexcel, S);

    S := '';
    if Query_TotalSum.FieldByName('PSPE2').AsInteger > 0 then
    begin
      ClearData;
      S := '   (전임행정총계)'+',,';
      S  := S + FormatFloat(dFORMAT, 0)+',';
      S  := S + FormatFloat(dFORMAT, Query_TotalSum.FieldByName('PSPE2').AsInteger)+',';
      S  := S + FormatFloat(dFORMAT, 0)+',';
      S  := S + FormatFloat(dFORMAT, 0)+',';
      S  := S + FormatFloat(dFORMAT, 0)+',';
      S  := S + FormatFloat(dFORMAT, Query_TotalSum.FieldByName('PSPE21').AsInteger)+',';
      S  := S + FormatFloat(dFORMAT, Query_TotalSum.FieldByName('PSPE22').AsInteger)+',';
      S  := S + FormatFloat(dFORMAT, Query_TotalSum.FieldByName('PSPE23').AsInteger)+',';
      S  := S + FormatFloat(dFORMAT, Query_TotalSum.FieldByName('PSPE24').AsInteger)+',';
      S  := S + FormatFloat(dFORMAT, Query_TotalSum.FieldByName('PSPE25').AsInteger)+',';
      S  := S + FormatFloat(dFORMAT, Query_TotalSum.FieldByName('PSPE26').AsInteger)+',';
      S  := S + FormatFloat(dFORMAT, Query_TotalSum.FieldByName('PSPE27').AsInteger)+',';
      S  := S + FormatFloat(dFORMAT, 0)+',';
      S  := S + FormatFloat(dFORMAT, 0)+',';
      S  := S + FormatFloat(dFORMAT, 0)+',';
      S  := S + FormatFloat(dFORMAT, Query_TotalSum.FieldByName('PSPE2').AsInteger)+',';
      S  := S + FormatFloat(dFORMAT, 0)+',';
      // 계약직 관련 수정
      S  := S + FormatFloat(dFORMAT, 0)+',';
      S  := S + FormatFloat(dFORMAT, Query_TotalSum.FieldByName('PSPE2').AsInteger)+',';

      writeln(Fexcel, S);

    end;
    Query_TotalSum.Close;

{-------------------------------------------------------------------------------
  버전     수정일     수정자    관련근거       수정내용
  1.01   1998.04.15   김순례   전(98.4.11)   Sectcode(부문) 추가
 -------------------------------------------------------------------------------}
    {부문별(sectcode) 소계}
      Query_SecTotal.close;
      Query_SecTotal.Sql.Clear;
      Query_SecTotal.Sql.Add('SELECT ORGNUM, ltrim(rtrim(SECTCODE)) SECTCODE, sum(TTOTAL) TTOTAL, sum(TEMPTOT) TEMPTOT,sum(PPOSSUM+PSPE1+PSPE3+PSPE4+PSPE5) PTOTAL, '+ //30.12 TEMPTOT추가
                             '      sum(PDIRSUM) PDIRSUM, sum(PDIR71) PDIR71, sum(PPOS1) PPOS1, sum(PPOS2) PPOS2, sum(PPOS3) PPOS3,                                 '+
                             '      sum(PPOS4) PPOS4, sum(PPOS5) PPOS5, sum(PPOS6) PPOS6, sum(PPOS7) PPOS7, sum(PPOS8) PPOS8, sum(PPOS9) PPOS9,                     '+
                             '      sum(PSPE21) PSPE21, sum(PSPE22) PSPE22, sum(PSPE23) PSPE23, sum(PSPE24) PSPE24, sum(PSPE25) PSPE25,                             '+
                             '      sum(PSPE26) PSPE26, sum(PSPE27) PSPE27, sum(PSPE2) PSPE2, sum(PSPE1+PSPE3+PSPE4+PSPE5) PSPE,                                    '+
                             '      sum(PEXTRSUM+PTEMPSUM) PEXTRSUM, sum(pcontsum) pcontsum, sum(psconsum) psconsum,                                                '+
                             '      sum(tcontsum) tcontsum, sum(ttempsum) ttempsum,sum(PTEMPSUM + PCONTSUM + PSCONSUM) PPTOTAL                                      '+
                             ' FROM  PIHTOPO                                                                                                                        '+
                             ' WHERE TOPOYM = :P_topoym AND TPGUBUN=''10''  AND SECTCODE <> ''Z''                                                                   '+
                             ' GROUP BY ORGNUM,ltrim(rtrim(SECTCODE))                                                                                               '+
                             ' ORDER BY ORGNUM, ltrim(rtrim(SECTCODE))                                                                                              ');

      Query_SecTotal.ParamByName('P_topoym').AsString   := ME_WorkDate.Text;
      Query_SecTotal.Open;
      ProgressCnt := 0;

//PART
      while not Query_SecTotal.Eof do
      begin
      if (Length(Query_SecTotal.FieldByName('sectcode').AsString) = 1) and
         (Query_SecTotal.FieldByName('sectcode').AsString >= 'A')      and     //'A' 사장 (shm)
         (ME_WorkDate.Text >= '200011')                                then
      begin
           Query_PartTotal.Close;
           Query_PartTotal.Sql.Clear;     //부문 total (shm)

        Query_PartTotal.Sql.Add('SELECT ORGNUM, substr(SECTCODE,1,1) sectcode, sum(TTOTAL) TTOTAL,sum(TEMPTOT) TEMPTOT, sum(PPOSSUM+PSPE1+PSPE3+PSPE4+PSPE5) PTOTAL, '+ //30.12 TEMPTOT 추가
                               '      sum(PDIRSUM) PDIRSUM, sum(PDIR71) PDIR71, sum(PPOS1) PPOS1, sum(PPOS2) PPOS2, sum(PPOS3) PPOS3,                                '+
                               '      sum(PPOS4) PPOS4, sum(PPOS5) PPOS5, sum(PPOS6) PPOS6, sum(PPOS7) PPOS7, sum(PPOS8) PPOS8, sum(PPOS9) PPOS9,                    '+
                               '      sum(PSPE21) PSPE21, sum(PSPE22) PSPE22, sum(PSPE23) PSPE23, sum(PSPE24) PSPE24, sum(PSPE25) PSPE25,                            '+
                               '      sum(PSPE26) PSPE26, sum(PSPE27) PSPE27, sum(PSPE2) PSPE2, sum(PSPE1+PSPE3+PSPE4+PSPE5) PSPE,                                   '+
                               '      sum(PEXTRSUM+PTEMPSUM) PEXTRSUM, sum(pcontsum) pcontsum,sum(psconsum) psconsum,                                                '+
                               '      sum(tcontsum) tcontsum, sum(ttempsum) ttempsum,sum(PTEMPSUM + PCONTSUM + PSCONSUM) PPTOTAL                                     '+
                               ' FROM  PIHTOPO                                                                                                                       '+
                               ' WHERE TOPOYM = :P_topoym AND TPGUBUN=''10''                                                                                         '+
                               '  AND  substr(SECTCODE,1,1) = :P_gubun                                                                                               '+
                               ' GROUP BY ORGNUM, substr(SECTCODE,1,1)                                                                                               '+
                               ' ORDER BY ORGNUM, SECTCODE                                                                                                           ');


        Query_PartTotal.ParamByName('P_topoym').AsString   := ME_WorkDate.Text;
        Query_PartTotal.ParamByName('P_gubun').AsString    := Query_SecTotal.FieldByName('sectcode').AsString;
        Query_PartTotal.Open;

        Qbondept.ParamByName('P_orgnum').AsString   := Query_PartTotal.FieldByName('orgnum').AsString;   //차수
        Qbondept.ParamByName('P_deptcode').AsString := Query_PartTotal.FieldByName('sectcode').AsString; //부문코드
//        Qbondept.ParamByName('P_deptcode').AsString := RPAD(Query_PartTotal.FieldByName('sectcode').AsString,5,'0'); //부문코드

////
        s := '';
        deptname   := deptnamefind;
//        S  := S + deptname+',,';
        S  := S + deptname+',';  //2001.09.27 shm
        S  := S + detcode+',,';  //2001.09.27 shm  부서코드 추가
        Boldline   := True;  //본부 글씨굵게..
        Font.size  := 10;
        Italicline := False;

        pbumn    := 'sect';
        P_Help.Caption := '['+deptname+'] 부서/BAND [부문별 소계]를 추출합니다 !!.';
        SendMessage(P_helpinfo.handle,WM_PAINT,0,0);
              ClearData;

//PART
//==============

      S  := S + FormatFloat(sFORMAT, Query_PartTotal.FieldByName('PDIRSUM').AsInteger -
                           Query_PartTotal.FieldByName('PDIR71').AsInteger)+','; //이사이상 임원


      s  := s + FormatFloat(sFORMAT, Query_PartTotal.FieldByName('TEMPTOT').AsInteger) +','; //30.21 shm==


      S  := S + FormatFloat(sFORMAT, Query_PartTotal.FieldByName('PTOTAL').AsInteger+
                           Query_PartTotal.FieldByName('PDIR71').AsInteger+  //이사대우
                           Query_PartTotal.FieldByName('PSPE2').AsInteger)+',';

      S  := S + FormatFloat(sFORMAT, (Query_PartTotal.FieldByName('PTOTAL').AsInteger+
                            Query_PartTotal.FieldByName('PDIR71').AsInteger+
                            Query_PartTotal.FieldByName('PSPE2').AsInteger)-
                            Query_PartTotal.FieldByName('TEMPTOT').AsInteger)+',';
      S  := S + FormatFloat(sFORMAT, Query_PartTotal.FieldByName('PDIR71').AsInteger)+','; //이사대우

      S  := S + FormatFloat(sFORMAT, Query_PartTotal.FieldByName('PPOS1').AsInteger+
                           Query_PartTotal.FieldByName('PSPE21').AsInteger)+',';
      S  := S + FormatFloat(sFORMAT, Query_PartTotal.FieldByName('PPOS2').AsInteger+
                           Query_PartTotal.FieldByName('PSPE22').AsInteger)+',';
      S  := S + FormatFloat(sFORMAT, Query_PartTotal.FieldByName('PPOS3').AsInteger+
                           Query_PartTotal.FieldByName('PSPE23').AsInteger)+',';
      S  := S + FormatFloat(sFORMAT, Query_PartTotal.FieldByName('PPOS4').AsInteger+
                           Query_PartTotal.FieldByName('PSPE24').AsInteger)+',';
      S  := S + FormatFloat(sFORMAT, Query_PartTotal.FieldByName('PPOS5').AsInteger+
                           Query_PartTotal.FieldByName('PSPE25').AsInteger)+',';
      S  := S + FormatFloat(sFORMAT, Query_PartTotal.FieldByName('PPOS6').AsInteger+
                           Query_PartTotal.FieldByName('PSPE26').AsInteger)+',';
      S  := S + FormatFloat(sFORMAT, Query_PartTotal.FieldByName('PPOS7').AsInteger+
                           Query_PartTotal.FieldByName('PSPE27').AsInteger)+',';
      S  := S + FormatFloat(sFORMAT, Query_PartTotal.FieldByName('PPOS8').AsInteger)+',';
      S  := S + FormatFloat(sFORMAT, Query_PartTotal.FieldByName('PPOS9').AsInteger)+',';
      S  := S + FormatFloat(sFORMAT, Query_PartTotal.FieldByName('PSPE').AsInteger)+',';
      S  := S + FormatFloat(sFORMAT, Query_PartTotal.FieldByName('PTOTAL').AsInteger+
                           Query_PartTotal.FieldByName('PSPE2').AsInteger)+',';


      // 계약직 관련 수정
      S  := S + FormatFloat(sFORMAT, Query_PartTotal.FieldByName('ttempsum').AsInteger)+',';//계약 t/0  2001.08.02 shm
      S  := S + FormatFloat(sFORMAT, Query_PartTotal.FieldByName('PSCONSUM').AsInteger)+',';//계약 t/0  2001.08.02 shm
      S  := S + FormatFloat(sFORMAT, Query_PartTotal.FieldByName('pcontsum').AsInteger)+',';//계약

      S  := S + FormatFloat(sFORMAT, Query_PartTotal.FieldByName('PEXTRSUM').AsInteger)+',';//일반


      S := S + FormatFloat(sFORMAT, Query_PartTotal.FieldByName('PPTOTAL').AsInteger)+',';

      S  := S + FormatFloat(sFORMAT,  Query_PartTotal.FieldByName('PDIRSUM').AsInteger + //총계    31.71   2004.03.08   정규용   자체
                                    Query_PartTotal.FieldByName('PTOTAL').AsInteger  +
                                    Query_PartTotal.FieldByName('PSPE2').AsInteger   +
                                    Query_PartTotal.FieldByName('PPTOTAL').AsInteger ) +',';
      writeln(Fexcel, S);

      if  Query_PartTotal.FieldByName('PSPE2').AsInteger > 0 then
      begin
          ClearData;
          S := '   (전임행정총계)'+',,';
          S  := S + FormatFloat(dFORMAT, 0)+',';
          S  := S + FormatFloat(dFORMAT, Query_PartTotal.FieldByName('PSPE2').AsInteger)+',';
          S  := S + FormatFloat(dFORMAT, 0)+',';
          S  := S + FormatFloat(dFORMAT, 0)+',';
          S  := S + FormatFloat(dFORMAT, 0)+',';
          S  := S + FormatFloat(dFORMAT, Query_PartTotal.FieldByName('PSPE21').AsInteger)+',';
          S  := S + FormatFloat(dFORMAT, Query_PartTotal.FieldByName('PSPE22').AsInteger)+',';
          S  := S + FormatFloat(dFORMAT, Query_PartTotal.FieldByName('PSPE23').AsInteger)+',';
          S  := S + FormatFloat(dFORMAT, Query_PartTotal.FieldByName('PSPE24').AsInteger)+',';
          S  := S + FormatFloat(dFORMAT, Query_PartTotal.FieldByName('PSPE25').AsInteger)+',';
          S  := S + FormatFloat(dFORMAT, Query_PartTotal.FieldByName('PSPE26').AsInteger)+',';
          S  := S + FormatFloat(dFORMAT, Query_PartTotal.FieldByName('PSPE27').AsInteger)+',';
          S  := S + FormatFloat(dFORMAT, 0)+',';
          S  := S + FormatFloat(dFORMAT, 0)+',';
          S  := S + FormatFloat(dFORMAT, 0)+',';
          S  := S + FormatFloat(dFORMAT, Query_PartTotal.FieldByName('PSPE2').AsInteger)+',';
          S  := S + FormatFloat(dFORMAT, 0)+',';
          // 계약직 관련 수정
          S  := S + FormatFloat(dFORMAT, 0)+',';
          S  := S + FormatFloat(dFORMAT, Query_PartTotal.FieldByName('PSPE2').AsInteger)+',';
          writeln(Fexcel, S);

      end;
   end;

//sect
      Boldline := False; // 부서명 굵기.
      Italicline := False;
      inc(ProgressCnt);
      G_Progress.Progress := (ProgressCnt*100) div Query_SecTotal.RecordCount;
      SendMessage(Panel5.handle,WM_PAINT,0,0);
      ClearData;

      Qbondept.ParamByName('P_orgnum').AsString   := Query_SecTotal.FieldByName('orgnum').AsString;
      Qbondept.ParamByName('P_deptcode').AsString := Query_SecTotal.FieldByName('sectcode').AsString;
//      Qbondept.ParamByName('P_deptcode').AsString := RPAD(Query_SecTotal.FieldByName('sectcode').AsString,5,'0');
////////////
      S := '';
      deptname := DeptNameFind;  //sectcode 부문명
//      S  := S + deptname+',,'; //sectcode 부문명

      S  := S + deptname+',';    //2001.09.27 shm
      S  := S + detcode+',,';    //2001.09.27 shm  부서코드 추가


      P_Help.Caption := '['+deptname+'] 부서의 데이타를 추출합니다 !!.';

      SendMessage(P_helpinfo.handle,WM_PAINT,0,0);

      S  := S + FormatFloat(sFORMAT, Query_SecTotal.FieldByName('PDIRSUM').AsInteger -
                            Query_SecTotal.FieldByName('PDIR71').AsInteger)+','; //이사이상 임원

      s  := s + FormatFloat(sFORMAT, Query_SecTotal.FieldByName('TEMPTOT').AsInteger) +','; //30.21 shm==

      S  := S + FormatFloat(sFORMAT, Query_SecTotal.FieldByName('PTOTAL').AsInteger+
                           Query_SecTotal.FieldByName('PDIR71').AsInteger+  //이사대우
                           Query_SecTotal.FieldByName('PSPE2').AsInteger)+',';

      S  := S + FormatFloat(sFORMAT, (Query_SecTotal.FieldByName('PTOTAL').AsInteger+
                            Query_SecTotal.FieldByName('PDIR71').AsInteger+
                            Query_SecTotal.FieldByName('PSPE2').AsInteger)-
                            Query_SecTotal.FieldByName('TEMPTOT').AsInteger)+',';
      S  := S + FormatFloat(sFORMAT, Query_SecTotal.FieldByName('PDIR71').AsInteger)+','; //이사대우

      S  := S + FormatFloat(sFORMAT, Query_SecTotal.FieldByName('PPOS1').AsInteger+
                           Query_SecTotal.FieldByName('PSPE21').AsInteger)+',';
      S  := S + FormatFloat(sFORMAT, Query_SecTotal.FieldByName('PPOS2').AsInteger+
                           Query_SecTotal.FieldByName('PSPE22').AsInteger)+',';
      S  := S + FormatFloat(sFORMAT, Query_SecTotal.FieldByName('PPOS3').AsInteger+
                           Query_SecTotal.FieldByName('PSPE23').AsInteger)+',';
      S  := S + FormatFloat(sFORMAT, Query_SecTotal.FieldByName('PPOS4').AsInteger+
                           Query_SecTotal.FieldByName('PSPE24').AsInteger)+',';
      S  := S + FormatFloat(sFORMAT, Query_SecTotal.FieldByName('PPOS5').AsInteger+
                           Query_SecTotal.FieldByName('PSPE25').AsInteger)+',';
      S  := S + FormatFloat(sFORMAT, Query_SecTotal.FieldByName('PPOS6').AsInteger+
                           Query_SecTotal.FieldByName('PSPE26').AsInteger)+',';
      S  := S + FormatFloat(sFORMAT, Query_SecTotal.FieldByName('PPOS7').AsInteger+
                           Query_SecTotal.FieldByName('PSPE27').AsInteger)+',';
      S  := S + FormatFloat(sFORMAT, Query_SecTotal.FieldByName('PPOS8').AsInteger)+',';
      S  := S + FormatFloat(sFORMAT, Query_SecTotal.FieldByName('PPOS9').AsInteger)+',';
      S  := S + FormatFloat(sFORMAT, Query_SecTotal.FieldByName('PSPE').AsInteger)+',';
      S  := S + FormatFloat(sFORMAT, Query_SecTotal.FieldByName('PTOTAL').AsInteger+
                           Query_SecTotal.FieldByName('PSPE2').AsInteger)+',';

      // 계약직 관련 수정
      S  := S + FormatFloat(sFORMAT, Query_SecTotal.FieldByName('ttempsum').AsInteger)+',';//계약 t/0  2001.08.02 shm
      S  := S + FormatFloat(sFORMAT, Query_SecTotal.FieldByName('PSCONSUM').AsInteger)+',';//계약 t/0  2001.08.02 shm
      S  := S + FormatFloat(sFORMAT, Query_SecTotal.FieldByName('pcontsum').AsInteger)+',';//계약

      S  := S + FormatFloat(sFORMAT, Query_SecTotal.FieldByName('PEXTRSUM').AsInteger)+',';//일반

      S := S + FormatFloat(sFORMAT, Query_SecTotal.FieldByName('PPTOTAL').AsInteger)+',';

      S  := S + FormatFloat(sFORMAT, Query_SecTotal.FieldByName('PDIRSUM').AsInteger + //총계
                                     Query_SecTotal.FieldByName('PTOTAL').AsInteger  +
                                     Query_SecTotal.FieldByName('PSPE2').AsInteger   +
                                     Query_SecTotal.FieldByName('PPTOTAL').AsInteger ) +',';
//2222222222222
  if   length(Query_SecTotal.FieldByName('sectcode').AsString) > 1 then
  begin
      writeln(Fexcel, S);
  end;

      if  Query_SecTotal.FieldByName('PSPE2').AsInteger > 0 then
      begin
          ClearData;
          S := '   (전임행정총계)'+',,';
          S  := S + FormatFloat(dFORMAT, 0)+',';
          S  := S + FormatFloat(dFORMAT, Query_SecTotal.FieldByName('PSPE2').AsInteger)+',';
          S  := S + FormatFloat(dFORMAT, 0)+',';
          S  := S + FormatFloat(dFORMAT, 0)+',';
          S  := S + FormatFloat(dFORMAT, 0)+',';
          S  := S + FormatFloat(dFORMAT, Query_SecTotal.FieldByName('PSPE21').AsInteger)+',';
          S  := S + FormatFloat(dFORMAT, Query_SecTotal.FieldByName('PSPE22').AsInteger)+',';
          S  := S + FormatFloat(dFORMAT, Query_SecTotal.FieldByName('PSPE23').AsInteger)+',';
          S  := S + FormatFloat(dFORMAT, Query_SecTotal.FieldByName('PSPE24').AsInteger)+',';
          S  := S + FormatFloat(dFORMAT, Query_SecTotal.FieldByName('PSPE25').AsInteger)+',';
          S  := S + FormatFloat(dFORMAT, Query_SecTotal.FieldByName('PSPE26').AsInteger)+',';
          S  := S + FormatFloat(dFORMAT, Query_SecTotal.FieldByName('PSPE27').AsInteger)+',';
          S  := S + FormatFloat(dFORMAT, 0)+',';
          S  := S + FormatFloat(dFORMAT, 0)+',';
          S  := S + FormatFloat(dFORMAT, 0)+',';
          S  := S + FormatFloat(dFORMAT, Query_SecTotal.FieldByName('PSPE2').AsInteger)+',';
          S  := S + FormatFloat(dFORMAT, 0)+',';
          // 계약직 관련 수정
          S  := S + FormatFloat(dFORMAT, 0)+',';
          S  := S + FormatFloat(dFORMAT, Query_SecTotal.FieldByName('PSPE2').AsInteger)+',';

          writeln(Fexcel, S);

      end;
    //=====================
    //실 단위 소계 별 소계
    Query_SubTotal.Close;
    Query_SubTotal.ParamByName('P_topoym').AsString   := ME_WorkDate.Text;
    Query_SubTotal.ParamByName('P_sectcode').AsString := Query_SecTotal.FieldByName('sectcode').AsString;
    Query_SubTotal.Open;


//=============================== 정규용 막음================================
//=============================================================================
 //  30.19   특이부서라서....예외처리.
//    IF (Query_SubTotal.FieldByName('fieldcode').AsString = 'AJ') THEN
//      Query_SubTotal.Next;
//=============================================================================
    while not Query_SubTotal.Eof do
    begin
      cnt := 0;
      ClearData;
      Qbondept.ParamByName('P_orgnum').AsString   := Query_SubTotal.FieldByName('orgnum').AsString;
      Qbondept.ParamByName('P_deptcode').AsString := Query_SubTotal.FieldByName('fieldcode').AsString;
//      Qbondept.ParamByName('P_deptcode').AsString := RPAD(Query_SubTotal.FieldByName('fieldcode').AsString,5,'0');
 /////////////
      S := '';
      deptname := DeptNameFind;
//      S  := S + DeptName +',,';  //부문명
      S  := S + deptname+',';      //2001.09.27 shm
      S  := S + detcode+',,';      //2001.09.27 shm  부서코드 추가


      temp2 := inttostr(Query_SubTotal.FieldByName('PDIRSUM').AsInteger - Query_SubTotal.FieldByName('PDIR71').AsInteger);
//      showmessage(copy(deptname,1,4));
      if ((deptname+temp2) <> temp) then
      begin
        if  (copy(deptname,1,14) = '독립부서(팀급)') or (copy(deptname,1,8) = '임시조직') then begin end
        else
        begin
        pbumn    := 'sect';
        P_Help.Caption := '['+deptname+'] 부서/BAND [부문별 소계]를 추출합니다 !!.';
        SendMessage(P_helpinfo.handle,WM_PAINT,0,0);

        S  := S + FormatFloat(sFORMAT, Query_SubTotal.FieldByName('PDIRSUM').AsInteger -
                             Query_SubTotal.FieldByName('PDIR71').AsInteger)+',';//이사이상임원

        s  := s + FormatFloat(sFORMAT, Query_SubTotal.FieldByName('TEMPTOT').AsInteger) +','; //30.21 shm==

        S  := S + FormatFloat(sFORMAT, Query_SubTotal.FieldByName('PTOTAL').AsInteger+
                             Query_SubTotal.FieldByName('PDIR71').AsInteger+  //이사대우
                             Query_SubTotal.FieldByName('PSPE2').AsInteger)+',';

        S  := S + FormatFloat(sFORMAT, (Query_SubTotal.FieldByName('PTOTAL').AsInteger+
                              Query_SubTotal.FieldByName('PDIR71').AsInteger+
                              Query_SubTotal.FieldByName('PSPE2').AsInteger)-
                            Query_SubTotal.FieldByName('TEMPTOT').AsInteger)+',';

        S  := S + FormatFloat(sFORMAT, Query_SubTotal.FieldByName('PDIR71').AsInteger)+',';//이사대우
        S  := S + FormatFloat(sFORMAT, Query_SubTotal.FieldByName('PPOS1').AsInteger+
                             Query_SubTotal.FieldByName('PSPE21').AsInteger)+',';
        S  := S + FormatFloat(sFORMAT, Query_SubTotal.FieldByName('PPOS2').AsInteger+
                             Query_SubTotal.FieldByName('PSPE22').AsInteger)+',';
        S  := S + FormatFloat(sFORMAT, Query_SubTotal.FieldByName('PPOS3').AsInteger+
                             Query_SubTotal.FieldByName('PSPE23').AsInteger)+',';
        S  := S + FormatFloat(sFORMAT, Query_SubTotal.FieldByName('PPOS4').AsInteger+
                             Query_SubTotal.FieldByName('PSPE24').AsInteger)+',';
        S  := S + FormatFloat(sFORMAT, Query_SubTotal.FieldByName('PPOS5').AsInteger+
                             Query_SubTotal.FieldByName('PSPE25').AsInteger)+',';
        S  := S + FormatFloat(sFORMAT, Query_SubTotal.FieldByName('PPOS6').AsInteger+
                             Query_SubTotal.FieldByName('PSPE26').AsInteger)+',';
        S  := S + FormatFloat(sFORMAT, Query_SubTotal.FieldByName('PPOS7').AsInteger+
                             Query_SubTotal.FieldByName('PSPE27').AsInteger)+',';
        S  := S + FormatFloat(sFORMAT, Query_SubTotal.FieldByName('PPOS8').AsInteger)+',';
        S  := S + FormatFloat(sFORMAT, Query_SubTotal.FieldByName('PPOS9').AsInteger)+',';
        S  := S + FormatFloat(sFORMAT, Query_SubTotal.FieldByName('PSPE').AsInteger)+',';
        S  := S + FormatFloat(sFORMAT, Query_SubTotal.FieldByName('PTOTAL').AsInteger+
                             Query_SubTotal.FieldByName('PSPE2').AsInteger)+',';

      // 계약직 관련 수정
      S := S + FormatFloat(sFORMAT, Query_SubTotal.FieldByName('ttempsum').AsInteger)+',';//계약 t/0  2001.08.02 shm
      S := S + FormatFloat(sFORMAT, Query_SubTotal.FieldByName('PSCONSUM').AsInteger)+',';//계약 t/0  2001.08.02 shm
      S := S + FormatFloat(sFORMAT, Query_SubTotal.FieldByName('pcontsum').AsInteger)+',';//계약

      S := S + FormatFloat(sFORMAT, Query_SubTotal.FieldByName('PEXTRSUM').AsInteger)+',';//일반

      S := S + FormatFloat(sFORMAT, Query_SubTotal.FieldByName('PPTOTAL').AsInteger)+',';

      S := S + FormatFloat(sFORMAT, Query_SubTotal.FieldByName('PDIRSUM').AsInteger + //총계   31.71   2004.03.08   정규용   자체
                                    Query_SubTotal.FieldByName('PTOTAL').AsInteger  +
                                    Query_SubTotal.FieldByName('PSPE2').AsInteger   +
                                    Query_SubTotal.FieldByName('PPTOTAL').AsInteger ) +',';

        if  ((Query_SubTotal.FieldByName('fieldcode').AsString)  <>
             (Query_SecTotal.FieldByName('sectcode').AsString))  then
//             (copy(Query_SecTotal.FieldByName('sectcode').AsString,1,1)  =  'A') then    //수정해야 한다.
              writeln(Fexcel, S);
        end;
      end;


      if Query_SubTotal.FieldByName('PSPE2').AsInteger > 0 then
      begin
        ClearData;
        S := '   (전임행정총계)'+',,';
        S  := S + FormatFloat(dFORMAT, 0)+',';
        S  := S + FormatFloat(dFORMAT, 0)+',';
        S  := S + FormatFloat(dFORMAT, Query_SubTotal.FieldByName('PSPE2').AsInteger)+',';
        S  := S + FormatFloat(dFORMAT, 0)+',';
        S  := S + FormatFloat(dFORMAT, 0)+',';
        S  := S + FormatFloat(dFORMAT, Query_SubTotal.FieldByName('PSPE21').AsInteger)+',';
        S  := S + FormatFloat(dFORMAT, Query_SubTotal.FieldByName('PSPE22').AsInteger)+',';
        S  := S + FormatFloat(dFORMAT, Query_SubTotal.FieldByName('PSPE23').AsInteger)+',';
        S  := S + FormatFloat(dFORMAT, Query_SubTotal.FieldByName('PSPE24').AsInteger)+',';
        S  := S + FormatFloat(dFORMAT, Query_SubTotal.FieldByName('PSPE25').AsInteger)+',';
        S  := S + FormatFloat(dFORMAT, Query_SubTotal.FieldByName('PSPE26').AsInteger)+',';
        S  := S + FormatFloat(dFORMAT, Query_SubTotal.FieldByName('PSPE27').AsInteger)+',';
        S  := S + FormatFloat(dFORMAT, 0)+',';
        S  := S + FormatFloat(dFORMAT, 0)+',';
        S  := S + FormatFloat(dFORMAT, 0)+',';
        S  := S + FormatFloat(dFORMAT, Query_SubTotal.FieldByName('PSPE2').AsInteger)+',';
        S  := S + FormatFloat(dFORMAT, 0)+',';
        // 계약직 관련 수정
        S  := S + FormatFloat(dFORMAT, 0)+',';
        S  := S + FormatFloat(dFORMAT, Query_SubTotal.FieldByName('PSPE2').AsInteger)+',';
        writeln(Fexcel, S);
      end;

      Query_Detail.close;
      Query_Detail.ParamByName('P_topoym').AsString := ME_WorkDate.Text;
      Query_Detail.ParamByName('P_orgnum').AsString :=
                   Query_SubTotal.FieldByName('ORGNUM').AsString;
      Query_Detail.ParamByName('P_fieldcode').AsString :=
                   Query_SubTotal.FieldByName('FIELDCODE').AsString;
      Query_Detail.ParamByName('P_sectcode').AsString :=
                   Query_SubTotal.FieldByName('SECTCODE').AsString;

      Query_Detail.Open;

      while not Query_Detail.Eof do
      begin
        ClearData;
        if (copy(Query_Detail.FieldByName('TPGUBUN_1').AsString,1,1) = '2') then
        begin
          deptname := '  (파견/교육)';
          plevel := false;
          inc(cnt);
          Fmt := dFormat;
        end
        else
        begin
          Qbondept.ParamByName('P_orgnum').AsString   := Query_SubTotal.FieldByName('ORGNUM').AsString;
          Qbondept.ParamByName('P_deptcode').AsString := Query_Detail.FieldByName('BONCODE').AsString;
          deptcode :=  Qbondept.ParamByName('P_deptcode').AsString;
          S := '';
          deptname := DeptNameFind;      //추가 shm
          S := '  '+DeptNameFind + ',';  //본부명 출력
          plevel   := false;

          if (Query_Detail.FieldByName('TTOTAL').AsInteger = 0) and //44444
             ((Query_Detail.FieldByName('PTOTAL').AsInteger +
               Query_Detail.FieldByName('PEXTRSUM').AsInteger) = 0) then
          begin
            if Query_Detail.FieldByName('PSPE2').AsInteger > 0 then
            begin
              ClearData;
              S := '  (전임행정직)'+',,';
              S  := S + FormatFloat(dFORMAT, 0)+',';
              S  := S + FormatFloat(dFORMAT, 0)+',';
              S  := S + FormatFloat(dFORMAT, Query_Detail.FieldByName('PSPE2').AsInteger)+',';
              S  := S + FormatFloat(dFORMAT, 0)+',';
              S  := S + FormatFloat(dFORMAT, 0)+',';
              S  := S + FormatFloat(dFORMAT, Query_Detail.FieldByName('PSPE21').AsInteger)+',';
              S  := S + FormatFloat(dFORMAT, Query_Detail.FieldByName('PSPE22').AsInteger)+',';
              S  := S + FormatFloat(dFORMAT, Query_Detail.FieldByName('PSPE23').AsInteger)+',';
              S  := S + FormatFloat(dFORMAT, Query_Detail.FieldByName('PSPE24').AsInteger)+',';
              S  := S + FormatFloat(dFORMAT, Query_Detail.FieldByName('PSPE25').AsInteger)+',';
              S  := S + FormatFloat(dFORMAT, Query_Detail.FieldByName('PSPE26').AsInteger)+',';
              S  := S + FormatFloat(dFORMAT, Query_Detail.FieldByName('PSPE27').AsInteger)+',';
              S  := S + FormatFloat(dFORMAT, 0)+',';
              S  := S + FormatFloat(dFORMAT, Query_Detail.FieldByName('PSPE2').AsInteger)+',';
              S  := S + FormatFloat(dFORMAT, 0)+',';
              // 계약직 관련 수정
              S  := S + FormatFloat(dFORMAT, 0)+',';
              S  := S + FormatFloat(dFORMAT, Query_Detail.FieldByName('PSPE2').AsInteger)+',';

              writeln(Fexcel, S);
              end;
             Query_Detail.Next;
             if (Query_Detail.EOF = True) then
             begin
                Break;
             end;
             continue;
          end;
          Fmt := sFormat;
        end; // else begin
        P_Help.Caption := '['+deptname+'] 부서/BAND별 [본부인원계]를 추출합니다 !!.';

        SendMessage(P_helpinfo.handle,WM_PAINT,0,0);
        S := S + detcode+',';  //2001.09.27 shm 추가
        S := S + Fincode+',';
        S := S + FormatFloat(Fmt, Query_Detail.FieldByName('PDIRSUM').AsInteger -
                         Query_Detail.FieldByName('PDIR71').AsInteger)+','; //이사이상임원
//        S := S + FormatFloat(Fmt, Query_Detail.FieldByName('TTOTAL').AsInteger)+',';
        s  := s + FormatFloat(sFORMAT, Query_Detail.FieldByName('TEMPTOT').AsInteger) +','; //30.21 shm==
        if  Query_Detail.FieldByName('BONCODE').Asstring = 'PA000' then
        begin
             S  := S + ''+',';
             S  := S + ''+',';
        end
        else
        begin
             S  := S + FormatFloat(Fmt, Query_Detail.FieldByName('PTOTAL').AsInteger+
                              Query_Detail.FieldByName('PSPE2').AsInteger+
                              Query_Detail.FieldByName('PDIR71').AsInteger)+','; //19990511
             S  := S + FormatFloat(Fmt, (Query_Detail.FieldByName('PTOTAL').AsInteger+
                                           Query_Detail.FieldByName('PDIR71').AsInteger+ //19990511
                                           Query_Detail.FieldByName('PSPE2').AsInteger) -
                                          // Query_Detail.FieldByName('TTOTAL').AsInteger)+','; //33333
                                           Query_Detail.FieldByName('TEMPTOT').AsInteger)+',';
        end;
        // 총무관리본부 파견/교육  계획인원 변수화일에서 읽어온 count
        if ((copy(Query_Detail.FieldByName('TPGUBUN_1').AsString,1,1) = '2'))
           and (Query_Detail.FieldByName('boncode').AsString  = pdeptcode)  then begin
               S := S + FormatFloat(dFORMAT, strtoint(pcount))+',';
               S := S + FormatFloat(Fmt, (Query_Detail.FieldByName('PTOTAL').AsInteger+
                                             Query_Detail.FieldByName('PSPE2').AsInteger) -
                                             (StrToInt(pcount)))+',';
        end;
        S := S + FormatFloat(Fmt, Query_Detail.FieldByName('PDIR71').AsInteger)+','; //이사대우
        S := S + FormatFloat(Fmt, Query_Detail.FieldByName('PPOS1').AsInteger+
                         Query_Detail.FieldByName('PSPE21').AsInteger)+',';
        S := S + FormatFloat(Fmt, Query_Detail.FieldByName('PPOS2').AsInteger+
                         Query_Detail.FieldByName('PSPE22').AsInteger)+',';
        S := S + FormatFloat(Fmt, Query_Detail.FieldByName('PPOS3').AsInteger+
                         Query_Detail.FieldByName('PSPE23').AsInteger)+',';
        S := S + FormatFloat(Fmt, Query_Detail.FieldByName('PPOS4').AsInteger+
                         Query_Detail.FieldByName('PSPE24').AsInteger)+',';
        S := S + FormatFloat(Fmt, Query_Detail.FieldByName('PPOS5').AsInteger+
                         Query_Detail.FieldByName('PSPE25').AsInteger)+',';
        S := S + FormatFloat(Fmt, Query_Detail.FieldByName('PPOS6').AsInteger+
                         Query_Detail.FieldByName('PSPE26').AsInteger)+',';
        S := S + FormatFloat(Fmt, Query_Detail.FieldByName('PPOS7').AsInteger+
                         Query_Detail.FieldByName('PSPE27').AsInteger)+',';
        S := S + FormatFloat(Fmt, Query_Detail.FieldByName('PPOS8').AsInteger)+',';
        S := S + FormatFloat(Fmt, Query_Detail.FieldByName('PPOS9').AsInteger)+',';
        S := S + FormatFloat(Fmt, Query_Detail.FieldByName('PSPE').AsInteger)+',';
        S := S + FormatFloat(Fmt, Query_Detail.FieldByName('PTOTAL').AsInteger+
                         Query_Detail.FieldByName('PSPE2').AsInteger)+',';


      // 계약직 관련 수정
      S  := S + FormatFloat(sFORMAT, Query_Detail.FieldByName('ttempsum').AsInteger)+',';//계약 t/0  2001.08.02 shm
      S  := S + FormatFloat(sFORMAT, Query_Detail.FieldByName('PSCONSUM').AsInteger)+',';//계약 t/0  2001.08.02 shm
      S  := S + FormatFloat(sFORMAT, Query_Detail.FieldByName('pcontsum').AsInteger)+',';//계약


      S  := S + FormatFloat(sFORMAT, Query_Detail.FieldByName('PEXTRSUM').AsInteger)+',';//일반


      S := S + FormatFloat(sFORMAT, Query_Detail.FieldByName('PPTOTAL').AsInteger)+',';

     S  := S + FormatFloat(sFORMAT, Query_Detail.FieldByName('PDIRSUM').AsInteger + //총계 31.71  2004.03.08 정규용 자체
                                    Query_Detail.FieldByName('PTOTAL').AsInteger  +
                                    Query_Detail.FieldByName('PSPE2').AsInteger   +
                                    Query_Detail.FieldByName('PPTOTAL').AsInteger ) +',';

      if  (Query_Detail.FieldByName('BONCODE').Asstring = 'FFF00') or   //경영혁신추진반     2001.02.27 최준영씨 요청
          (Query_Detail.FieldByName('BONCODE').Asstring = 'LPC00') or   //사이버교육원부원장
          (Query_Detail.FieldByName('BONCODE').Asstring = 'LPF00') then //교육사무국
      begin
          Query_Detail.Next;
      end else
        writeln(Fexcel, S);  //8888888

        if Query_Detail.FieldByName('PSPE2').AsInteger > 0 then
        begin
           ClearData;
              S := '  (전임행정직)'+',,';
              S  := S + FormatFloat(dFORMAT, 0)+',';
              S  := S + FormatFloat(dFORMAT, 0)+',';
              S  := S + FormatFloat(dFORMAT, Query_Detail.FieldByName('PSPE2').AsInteger)+',';
              S  := S + FormatFloat(dFORMAT, 0)+',';
              S  := S + FormatFloat(dFORMAT, 0)+',';
              S  := S + FormatFloat(dFORMAT, Query_Detail.FieldByName('PSPE21').AsInteger)+',';
              S  := S + FormatFloat(dFORMAT, Query_Detail.FieldByName('PSPE22').AsInteger)+',';
              S  := S + FormatFloat(dFORMAT, Query_Detail.FieldByName('PSPE23').AsInteger)+',';
              S  := S + FormatFloat(dFORMAT, Query_Detail.FieldByName('PSPE24').AsInteger)+',';
              S  := S + FormatFloat(dFORMAT, Query_Detail.FieldByName('PSPE25').AsInteger)+',';
              S  := S + FormatFloat(dFORMAT, Query_Detail.FieldByName('PSPE26').AsInteger)+',';
              S  := S + FormatFloat(dFORMAT, Query_Detail.FieldByName('PSPE27').AsInteger)+',';
              S  := S + FormatFloat(dFORMAT, 0)+',';
              S  := S + FormatFloat(dFORMAT, Query_Detail.FieldByName('PSPE2').AsInteger)+',';
              S  := S + FormatFloat(dFORMAT, 0)+',';
              // 계약직 관련 수정
              S  := S + FormatFloat(dFORMAT, 0)+',';
              S  := S + FormatFloat(dFORMAT, Query_Detail.FieldByName('PSPE2').AsInteger)+',';

              writeln(Fexcel, S);
        end;
        Query_Detail.Next;
      end; // 본부명을 출력하는 부분의 끝.
      Query_Detail.Close;
      Query_SubTotal.Next; //다음 부문소계를 읽음
    end; // 부문별을 출력하는 부분의 끝.
    Query_SubTotal.Close;
    Query_SecTotal.Next;
   end;                     //sectcode end
    Query_SecTotal.Close;
  end; //with

  //comment 처리
  P_Help.Caption := '부서/BAND별 [총괄사항]을 추출합니다 !!.';
  SendMessage(P_helpinfo.handle,WM_PAINT,0,0);

  Query_comment1.Close;
  Query_comment1.ParamByName('P_topoym').AsString := ME_WorkDate.Text;
  Query_comment1.Open;

  with Query_comment1 do
  begin
    First;
    Buff  := '';
    Buff1 := '';
    Buff2 := '';
    Buff3 := '';
    Buff4 := '';
    if not Eof then
    begin

      PageCheck(LineCnt,2);

      Buff1 := '① 임원 ['+IntToStr(FieldByName('PDIRSUM').AsInteger)+' 명] : ';
      if FieldByName('PDIR11').AsInteger <> 0 then
         Buff1:=Buff1+'회장 '+IntToStr(FieldByName('PDIR11').AsInteger)+', ';
      if FieldByName('PDIR12').AsInteger <> 0 then
         Buff1:=Buff1+'부회장 '+IntToStr(FieldByName('PDIR12').AsInteger)+', ';
      if FieldByName('PDIR21').AsInteger <> 0 then
         Buff1:=Buff1+'사장 '+IntToStr(FieldByName('PDIR21').AsInteger)+', ';
      if FieldByName('PDIR31').AsInteger <> 0 then
         Buff1:=Buff1+'감사 '+IntToStr(FieldByName('PDIR31').AsInteger)+', ';
      if FieldByName('PDIR41').AsInteger <> 0 then
         Buff1:=Buff1+'부사장 '+IntToStr(FieldByName('PDIR41').AsInteger)+', ';
      if FieldByName('PDIR51').AsInteger <> 0 then
         Buff1:=Buff1+'전무 '+IntToStr(FieldByName('PDIR51').AsInteger)+', ';
      if FieldByName('PDIR61').AsInteger <> 0 then
         Buff1:=Buff1+'상무 '+IntToStr(FieldByName('PDIR61').AsInteger)+', ';
      if FieldByName('PDIR71').AsInteger <> 0 then
         Buff2:=Buff2+'상무보 '+IntToStr(FieldByName('PDIR71').AsInteger)+', ';
      if FieldByName('PDIR6A').AsInteger <> 0 then //고문추가(선임필드사용) 2001.10.04 shm
         Buff2:=Buff2+'고문 '+IntToStr(FieldByName('PDIR6A').AsInteger)+', ';
      if FieldByName('PDIRETC').AsInteger <> 0 then
         Buff2:=Buff2+'기타 '+IntToStr(FieldByName('PDIRETC').AsInteger)+', ';

      if (length(Buff1)+length(Buff2)) < 110 then
      begin
         Buff := Buff1 + Buff2;
         writeln(Fexcel, Buff);
         inc(LineCnt);
         PageCheck(LineCnt,2);
      end
      else
      begin
         inc(LineCnt);
         PageCheck(LineCnt,2);
         Buff := '                     ' + Buff2;
         writeln(Fexcel, Buff);
         inc(LineCnt);
         PageCheck(LineCnt,2);
      end;
     end;
  end; //with

  //comment 1
  if Edit1_1.Text+Edit1_2.Text+Edit1_3.Text <> '' then
  begin
    Buff := Edit1_1.Text+Edit1_2.Text+Edit1_3.Text;
//    System.WriteLn(FCom, Buff);
    writeln(Fexcel, Buff);
    inc(LineCnt);
    PageCheck(LineCnt,2);
  end;
  //comment 2 ~ 8
  if Edit2_1.Text+Edit2_2.Text+Edit2_3.Text <> '' then
  begin
    Buff := Edit2_1.Text+Edit2_2.Text+Edit2_3.Text;
//    System.WriteLn(FCom, Buff);
    writeln(Fexcel, Buff);
    inc(LineCnt);
    PageCheck(LineCnt,2);
  end;

  if Edit3_1.Text+Edit3_2.Text+Edit3_3.Text <> '' then
  begin
    Buff := Edit3_1.Text+Edit3_2.Text+Edit3_3.Text;
//    System.WriteLn(FCom, Buff);
    writeln(Fexcel, Buff);
    inc(LineCnt);
    PageCheck(LineCnt,2);
  end;

  if Edit4_1.Text+Edit4_2.Text+Edit4_3.Text <> '' then
  begin
    Buff := Edit4_1.Text+Edit4_2.Text+Edit4_3.Text;
//    System.WriteLn(FCom, Buff);
    writeln(Fexcel, Buff);
    inc(LineCnt);
    PageCheck(LineCnt,2);
  end;

  if Edit5_1.Text+Edit5_2.Text+Edit5_3.Text <> '' then
  begin
    Buff := Edit5_1.Text+Edit5_2.Text+Edit5_3.Text;
//    System.WriteLn(FCom, Buff);
    writeln(Fexcel, Buff);
    inc(LineCnt);
    PageCheck(LineCnt,2);
  end;

  if Edit6_1.Text+Edit6_2.Text+Edit6_3.Text <> '' then
  begin
    Buff := Edit6_1.Text+Edit6_2.Text+Edit6_3.Text;
//    System.WriteLn(FCom, Buff);
    writeln(Fexcel, Buff);
    inc(LineCnt);
    PageCheck(LineCnt,2);
  end;

  if Edit7_1.Text+Edit7_2.Text+Edit7_3.Text <> '' then
  begin
    Buff := Edit7_1.Text+Edit7_2.Text+Edit7_3.Text;
//    System.WriteLn(FCom, Buff);
    writeln(Fexcel, Buff);
    inc(LineCnt);
    PageCheck(LineCnt,2);
  end;

  if Edit8_1.Text+Edit8_2.Text+Edit8_3.Text <> '' then
  begin
    Buff := Edit8_1.Text+Edit8_2.Text+Edit8_3.Text;
//    System.WriteLn(FCom, Buff);
    writeln(Fexcel, Buff);
    inc(LineCnt);
    PageCheck(LineCnt,2);
  end;

  P_Help.Caption := '추출된 자료를 출력합니다.';
  SendMessage(P_helpinfo.handle,WM_PAINT,0,0);

/////
  closefile(Fexcel);

  app := CreateOleObject('Excel.Application');
  app.visible := true;
  app.workbooks.open(SaveDialog1.FileName);
end;

procedure TMainForm.Data_Display_csv2(Sender: TObject);
var
  Fexcel : textfile;
begin
  Application.ProcessMessages;
  assignfile(Fexcel, SaveDialog1.FileName);
  rewrite(Fexcel);
  writeln(Fexcel, ',,,,,,부,서,/,직,급,별,,인,원,현,황');
  writeln(Fexcel, '');
  writeln(Fexcel, ',[기준년월] ,:, '+copy(L_Date.Caption,1,4)+' 년, '+copy(L_Date.Caption,6,2)+' 월');
  writeln(Fexcel, '');
  writeln(Fexcel, '부서명,,임,원,,정,규,직,인,원,,계,약,일,반,,');
  writeln(Fexcel, ',부서코드,상무보이상,상무보,소계,부장,차장,과장,대리,사원,특정,소계,전계,계약,일반,소계,총계');
  Data_Display2;
  with Newqry do
  begin
    First;
    while not Eof do
    begin
      P_Help.Caption := '['+FieldByName('deptname').AsString+'] 근무부서별 인원을 추출합니다 !!.';
      SendMessage(P_helpinfo.handle,WM_PAINT,0,0);
      writeln(Fexcel,
                     FieldByName('deptname').AsString +','+
                     RPAD(FieldByName('deptcode').AsString,5,'0') +','+
                     FieldByName('상무이상').AsString +','+
                     FieldByName('상무보').AsString   +','+
                     FieldByName('임원소계').AsString +','+
                     FieldByName('부장').AsString     +','+
                     FieldByName('차장').AsString     +','+
                     FieldByName('과장').AsString     +','+
                     FieldByName('대리').AsString     +','+
                     FieldByName('사원').AsString     +','+
                     FieldByName('특정').AsString     +','+
                     FieldByName('정규직계').AsString +','+
                     FieldByName('전계').AsString     +','+
                     FieldByName('계약').AsString     +','+
                     FieldByName('일반').AsString     +','+
                     FieldByName('계약계').AsString   +','+
                     FieldByName('총계').AsString        );

      Next;
    end;
  end;
  closefile(Fexcel);
end;

procedure TMainForm.Data_Display_csv3(Sender: TObject);
var
  Fexcel : textfile;
begin
  Application.ProcessMessages;
  assignfile(Fexcel, SaveDialog1.FileName);
  rewrite(Fexcel);
  writeln(Fexcel, ',,,,,,,부서/BAND별 인원 현황');
  writeln(Fexcel, '');
  writeln(Fexcel, ',,[기준년월] :, '+copy(L_Date.Caption,1,4)+' 년 '+copy(L_Date.Caption,6,2)+' 월');
  writeln(Fexcel, '');
  writeln(Fexcel, '부서명,,임원,,,정규직인원,,,,,,,계약직,,파견직,,');
  writeln(Fexcel, ',부서코드,EMD,Non-EMD,소계,L2,L1,G4,G3,G2,P,소계,전/계,계약직,파견직,소계,총계');
  Data_Display2;
  with Newqry do
  begin
    First;
    while not Eof do
    begin
      P_Help.Caption := '['+FieldByName('deptname').AsString+'] 근무부서별 인원을 추출합니다 !!.';
      SendMessage(P_helpinfo.handle,WM_PAINT,0,0);
      writeln(Fexcel,
                     FieldByName('deptname').AsString +','+
                     RPAD(FieldByName('deptcode').AsString,5,'0') +','+
                     FieldByName('상무이상').AsString +','+
                     FieldByName('상무보').AsString   +','+
                     FieldByName('임원소계').AsString +','+
                     FieldByName('부장').AsString     +','+
                     FieldByName('차장').AsString     +','+
                     FieldByName('과장').AsString     +','+
                     FieldByName('대리').AsString     +','+
                     FieldByName('사원').AsString     +','+
                     FieldByName('특정').AsString     +','+
                     FieldByName('정규직계').AsString +','+
                     FieldByName('전계').AsString     +','+
                     FieldByName('계약').AsString     +','+
                     FieldByName('일반').AsString     +','+
                     FieldByName('계약계').AsString   +','+
                     FieldByName('총계').AsString        );
      Next;
    end;
  end;
  closefile(Fexcel);
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  start := 0;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i: Integer;
  EditCom: TEdit;
begin
  if Change_PIMVARI = True then
  begin
    if MessageBox(handle,'변경된 Comment를 저장하시겠습니까 ?..','확  인',MB_YESNO or $0020)
       = ID_YES then
    begin
      for i := 1 to 8 do
      begin
        Q_Updatevari.Close;
        Q_Updatevari.SQL.Clear;
        Q_Updatevari.SQL.Add('UPDATE PIMVARI SET ');
        Q_Updatevari.SQL.Add('VALUE1 = :P_value1, ');
        Q_Updatevari.SQL.Add('VALUE2 = :P_value2, ');
        Q_Updatevari.SQL.Add('VALUE3 = :P_value3  ');

        EditCom := Self.FindComponent('Edit'+IntToStr(i)+'_1') as TEdit;
        if EditCom <> nil then
          Q_Updatevari.ParamByName('P_value1').AsString := EditCom.Text;

        EditCom := Self.FindComponent('Edit'+IntToStr(i)+'_2') as TEdit;
        if EditCom <> nil then
          Q_Updatevari.ParamByName('P_value2').AsString := EditCom.Text;

        EditCom := Self.FindComponent('Edit'+IntToStr(i)+'_3') as TEdit;
        if EditCom <> nil then
          Q_Updatevari.ParamByName('P_value3').AsString := EditCom.Text;

        Q_Updatevari.SQL.Add('WHERE (GUBUN  = :P_gubun ) AND ');
        Q_Updatevari.SQL.Add('      (SGUBUN = :P_sgubun) ');
        Q_Updatevari.ParamByName('P_gubun').AsString  := 'E2';
        Q_Updatevari.ParamByName('P_sgubun').AsString := 'CM0'+IntToStr(i);
        Q_Updatevari.ExecSQL;
        Q_Updatevari.Close;

      end;
    end;
  end;

  for i := 0 to Self.ComponentCount - 1 do
    if (Self.Components[i] is TQuery) then
      TQuery(Self.Components[i]).Close;
  Action := caFree;
end;

procedure TMainForm.Edit1_1Change(Sender: TObject);
begin
  Change_PIMVARI := True;
end;

{-----------------------------------------------------------}
procedure TMainForm.ShowPreView;
begin
{
  PreViewForm := TPreViewForm.Create(self);
  PreViewForm.ShowModal;
  PreViewForm.Free;
}  
end;

procedure TMainForm.ClearData;
begin
  with DataIn do begin
    ttotal    := '';    ptotal    := '';
    insuff    := '';    pdirsum   := ''; //임원
    PDIR71    := ''; //이사대우
    ppos1     := '';    ppos2     := '';
    ppos3     := '';    ppos4     := '';
    ppos5     := '';    ppos6     := '';
    ppos7     := '';    ppos7     := '';
    ppos8     := '';    pspe      := '';
    pemp      := '';    pextrsum  := '';
    // 계약직 관련 수정
    pcontsum  := '';    psum      := '';
  end;
end;

{-----------------------------------------------------------}
procedure TMainForm.BB_CloseClick(Sender: TObject);
begin
    if FileExists(HomeDir+'\list\PIE3020A.tmp') = True then begin
       DeleteFile(PChar(HomeDir+'\list\PIE3020A.tmp'));
       DeleteFile(PChar(HomeDir+'\list\PIE3020A.dat'));
       DeleteFile(PChar(HomeDir+'\list\temp_c.tmp'));
    end;
    Close;
end;

procedure TMainForm.Executive_Data;
begin
   with DataIn do begin
      ttotal   := FormatFloat(dFORMAT, 0);
      ptotal   := FormatFloat(dFORMAT, Query_Detail.FieldByName('PSPE2').AsInteger);
      insuff   := FormatFloat(dFORMAT, 0);
      pdirsum  := FormatFloat(dFORMAT, 0);
      PDIR71   := FormatFloat(dFORMAT, 0);
      ppos1    := FormatFloat(dFORMAT, Query_Detail.FieldByName('PSPE21').AsInteger);
      ppos2    := FormatFloat(dFORMAT, Query_Detail.FieldByName('PSPE22').AsInteger);
      ppos3    := FormatFloat(dFORMAT, Query_Detail.FieldByName('PSPE23').AsInteger);
      ppos4    := FormatFloat(dFORMAT, Query_Detail.FieldByName('PSPE24').AsInteger);
      ppos5    := FormatFloat(dFORMAT, Query_Detail.FieldByName('PSPE25').AsInteger);
      ppos6    := FormatFloat(dFORMAT, Query_Detail.FieldByName('PSPE26').AsInteger);
      ppos7    := FormatFloat(dFORMAT, Query_Detail.FieldByName('PSPE27').AsInteger);
      pspe     := FormatFloat(dFORMAT, 0);
      pemp     := FormatFloat(dFORMAT, Query_Detail.FieldByName('PSPE2').AsInteger);
      pextrsum := FormatFloat(dFORMAT, 0);
      // 계약직 관련 수정
      pcontsum := FormatFloat(dFORMAT, 0);
      psum     := FormatFloat(dFORMAT, Query_Detail.FieldByName('PSPE2').AsInteger);
   end;
end;

function TMainForm.PageCheck(var pageLine : integer; gubun : integer) : Boolean;
begin
  PageCheck := False;
  if pageLine > 48 THEN
  begin
     if gubun = 1 then    //page Skip 여부.
     begin
        ClearData;
        DataIn.flag := 'S';    //S:인쇄후 구분선 출력
        System.Write(Fout, DataIn);
        ClearData;
        DataIn.flag := 'P';
        System.Write(Fout, DataIn);
     end;
     if gubun = 2 then
     begin
        System.WriteLn(FCom, 'PAGESKIP');
     end;
     pageLine := 1;
     PageCheck := True;
  end;
end;

procedure TMainForm.BB_ScreenClick(Sender: TObject);
begin
  P_Help.Caption := '부서/BAND별 [인원 총계]를 추출합니다 !!.';
  SendMessage(P_helpinfo.handle,WM_PAINT,0,0);

  if length(trim(ME_WorkDate.Text)) < 6  then
  begin
    MessageBox(handle,'작업년월 오류입니다.','에  러',MB_OK or $0020);
    ME_WorkDate.SetFocus;
    System.Exit;
  end;

  if (Trim(ME_WorkDate.Text) < '200901') then
  Begin
    MessageBox(handle,'2009년도 자료부터 출력이 가능합니다.','에  러',MB_OK or $0020);
    ME_WorkDate.SetFocus;
    System.Exit;
  End;

  AReport := NewPrintForm1.InReport;    // NewPrintForm1.

  if FileExists(HomeDir+'\list\PIE3020A.tmp') = True then
  begin
       DeleteFile(PChar(HomeDir+'\list\PIE3020A.tmp'));
       DeleteFile(PChar(HomeDir+'\list\PIE3020A.dat'));
       DeleteFile(PChar(HomeDir+'\list\temp_c.tmp'));
  end;

  //인쇄
  if TBitBtn(Sender).Name = 'BB_Print' then
  begin
    AReport := NewPrintForm1.InReport;
    Data_Display2;
    AReport.Print;
  end
  else if TBitBtn(Sender).Name = 'BB_Screen' then   //화면출력
  begin
    AReport := NewPrintForm1.InReport;
    Data_Display2;
    AReport.PreView;
  end
  else if TBitBtn(Sender).Name = 'Btext' then     //excel 변환
  begin
    SaveDialog1.FileName := '부서BAND별인원현황_'+Copy(rStr,1,8)+'.csv';
    if saveDialog1.Execute then
    begin
      Data_Display_csv3(Sender);
      Update_History; //log 남기기 위해 2002.06.25 shm 추가
    end
    else
    begin
      G_Progress.progress := 00;
      P_Help.Caption := '작업을 취소 했습니다.';
      Application.ProcessMessages;
      exit;
    end;
  end;

  P_Help.Caption := '작업이 완료되었습니다.';
  G_Progress.Progress := 0;
  Screen.Cursor := crDefault;
end;

procedure TMainForm.Update_History;
var
  Temp_no    : Integer;
begin
     Query1.Close;
     Query1.Sql.Clear;
     Query1.Sql.Add(' SELECT  NVL(MAX(NO),0) NO  FROM PYMPHIS     ');
     Query1.Sql.Add('  WHERE  PROGID = ''PIE3020A''               ');
     Query1.Open;
     Temp_No    := Query1.FieldByName('NO').AsInteger + 1;
     Query1.Close;


     Query1.Sql.Clear;
     Query1.Sql.Add('INSERT INTO PYMPHIS                                                  ');
     Query1.Sql.Add('   (    NO, EMPNO, KORNAME, PROGID, EXTDATE, EXTCONTENTS          )  ');
     Query1.Sql.Add('VALUES                                                               ');
     Query1.Sql.Add('   (                                                                 ');
     Query1.Sql.Add(format('       ''%d'',',[Temp_NO]        )                             );
     Query1.Sql.Add('       '''+PEMPNO+''','''+PKORNAME+''',''PIE3020A'',                 ');
     Query1.Sql.Add('       '''+RSTR+''',                                                 ');
     Query1.Sql.Add('       ''부서별/BAND별 인원현황을 EXCEL 화일로 출력한다.'')          ');
     Query1.ExecSQL;
     Query1.Close;
end;

//11111111111111111111111111111111111111111111111111
//pppppppppppppppppppppppppppppp
//출력 start//////////////////////////////////////////////////////////////////////////////
procedure TMainForm.Data_Display(Sender : TObject);
var
  LineCnt, cnt, ProgressCnt : Integer;
  Buff, Buff1, Buff2, Buff3, Buff4, Fmt, text : string;
  frun : integer;
  C0_check : integer; //강남지사.. 등 C0 ->D0 라인에 출력하기 위해 CHECK shm
begin
  frun := 1;
  Query_TotalSum.Close;
  G_Progress.Progress := 0;
  Query_TotalSum.ParamByName('P_topoym').AsString := ME_WorkDate.Text;
  Query_TotalSum.Open;
  if Query_TotalSum.RecordCount = 0 then
  begin
    MessageBox(handle,'작업조건에 맞는 자료가 없습니다.','알  림',MB_OK or $0030);
    Query_TotalSum.Close;
    System.Exit;
  end;

  LineCnt := 3;
  AssignFile(Fout, HomeDir+'\list\PIE3020A.tmp');
  System.ReWrite(Fout);

  with DataIn do
  begin
    ClearData;
    plevel   := false;
    deptname := '      총     계';
//계획 : 정규직계획, 현원 : 정규직 현원 임 - 30.21 shm               |
    ttotal   := FormatFloat(sFORMAT, Query_TotalSum.FieldByName('TEMPTOT').AsInteger);
//현원총계 := 현원총계 + 임용직총계 + 이사대우 (shm)
    ptotal   := FormatFloat(sFORMAT, Query_TotalSum.FieldByName('PTOTAL').AsInteger +
                                     Query_TotalSum.FieldByName('PSPE2').AsInteger  +
                                     Query_TotalSum.FieldByName('PDIR71').AsInteger);
//과부족 (shm)
    insuff   := FormatFloat(sFORMAT, (Query_TotalSum.FieldByName('PTOTAL').AsInteger +
                                     (Query_TotalSum.FieldByName('PDIR71').AsInteger) +
                                      Query_TotalSum.FieldByName('PSPE2').AsInteger) -
                                      Query_TotalSum.FieldByName('TEMPTOT').AsInteger);

    pdirsum  := FormatFloat(sFORMAT, Query_TotalSum.FieldByName('PDIRSUM').AsInteger -
                                     Query_TotalSum.FieldByName('PDIR71').AsInteger); //이사이상임원
    PDIR71   := FormatFloat(sFORMAT, Query_TotalSum.FieldByName('PDIR71').AsInteger); //이사대우
    ppos1    := FormatFloat(sFORMAT, Query_TotalSum.FieldByName('PPOS1').AsInteger+
                                     Query_TotalSum.FieldByName('PSPE21').AsInteger);
    ppos2    := FormatFloat(sFORMAT, Query_TotalSum.FieldByName('PPOS2').AsInteger+
                                     Query_TotalSum.FieldByName('PSPE22').AsInteger);
    ppos3    := FormatFloat(sFORMAT, Query_TotalSum.FieldByName('PPOS3').AsInteger+
                                     Query_TotalSum.FieldByName('PSPE23').AsInteger);
    ppos4    := FormatFloat(sFORMAT, Query_TotalSum.FieldByName('PPOS4').AsInteger+
                                     Query_TotalSum.FieldByName('PSPE24').AsInteger);
    ppos5    := FormatFloat(sFORMAT, Query_TotalSum.FieldByName('PPOS5').AsInteger+
                                     Query_TotalSum.FieldByName('PSPE25').AsInteger);
    ppos6    := FormatFloat(sFORMAT, Query_TotalSum.FieldByName('PPOS6').AsInteger+
                                     Query_TotalSum.FieldByName('PSPE26').AsInteger);
    ppos7    := FormatFloat(sFORMAT, Query_TotalSum.FieldByName('PPOS7').AsInteger+
                                     Query_TotalSum.FieldByName('PSPE27').AsInteger);
    ppos8    := FormatFloat(sFORMAT, Query_TotalSum.FieldByName('PPOS8').AsInteger);
    ppos9    := FormatFloat(sFORMAT, Query_TotalSum.FieldByName('PPOS9').AsInteger);
    pspe     := FormatFloat(sFORMAT, Query_TotalSum.FieldByName('PSPE').AsInteger);
    pemp     := FormatFloat(sFORMAT, Query_TotalSum.FieldByName('PTOTAL').AsInteger+
                                     Query_TotalSum.FieldByName('PSPE2').AsInteger);
    pextrsum := FormatFloat(sFORMAT, Query_TotalSum.FieldByName('PEXTRSUM').AsInteger);
    //계약/일반 t/0
    tcontsum := FormatFloat(sFORMAT, Query_TotalSum.FieldByName('tcontsum').AsInteger);
    ttempsum := FormatFloat(sFORMAT, Query_TotalSum.FieldByName('ttempsum').AsInteger);
    // 계약직 관련 수정
    pcontsum := FormatFloat(sFORMAT, Query_TotalSum.FieldByName('pcontsum').AsInteger);
    psconsum := FormatFloat(sFORMAT, Query_TotalSum.FieldByName('psconsum').AsInteger); //2002.07.29 shm 계약+전문계약직,2002.08.21 shm 전문계약직 분리
    //2002.04.17 shm 추가 (정여진씨 요청 계약+일반)
    pimsisum := FormatFloat(sFORMAT, Query_TotalSum.FieldByName('pcontsum').AsInteger  +
                                     Query_TotalSum.FieldByName('pextrsum').AsInteger  +
                                     Query_TotalSum.FieldByName('psconsum').AsInteger);  //전문계약직 추가 2002.07.29 shm

    psum     := FormatFloat(sFORMAT, Query_TotalSum.FieldByName('PTOTAL').AsInteger +
                                     Query_TotalSum.FieldByName('PEXTRSUM').AsInteger+
                                     Query_TotalSum.FieldByName('pcontsum').AsInteger+
                                     Query_TotalSum.FieldByName('PSPE2').AsInteger +
                                     Query_TotalSum.FieldByName('PDIRSUM').AsInteger +
                                     Query_TotalSum.FieldByName('psconsum').AsInteger); //2002.07.29 shm 전문계약직 추가
//총계 (shm)
    flag := 'C';       //C: 인쇄후 구분선없이 출력.
    System.Write(Fout, DataIn);
    Inc(LineCnt);
    ClearData;
    flag := 'S';       //S:인쇄후 구분선 출력
    System.Write(Fout, DataIn);

    if Query_TotalSum.FieldByName('PSPE2').AsInteger > 0 then  //임용직(shm)
    begin
      ClearData;
      deptname := '   (전임행정총계)';
      plevel   := false;
      ttotal   := FormatFloat(dFORMAT, 0);
      ptotal   := FormatFloat(dFORMAT, Query_TotalSum.FieldByName('PSPE2').AsInteger);
      insuff   := FormatFloat(dFORMAT, 0);
      pdirsum  := FormatFloat(dFORMAT, 0);
      PDIR71   := FormatFloat(dFORMAT, 0);
      ppos1    := FormatFloat(dFORMAT, Query_TotalSum.FieldByName('PSPE21').AsInteger);
      ppos2    := FormatFloat(dFORMAT, Query_TotalSum.FieldByName('PSPE22').AsInteger);
      ppos3    := FormatFloat(dFORMAT, Query_TotalSum.FieldByName('PSPE23').AsInteger);
      ppos4    := FormatFloat(dFORMAT, Query_TotalSum.FieldByName('PSPE24').AsInteger);
      ppos5    := FormatFloat(dFORMAT, Query_TotalSum.FieldByName('PSPE25').AsInteger);
      ppos6    := FormatFloat(dFORMAT, Query_TotalSum.FieldByName('PSPE26').AsInteger);
      ppos7    := FormatFloat(dFORMAT, Query_TotalSum.FieldByName('PSPE27').AsInteger);
      ppos8    := FormatFloat(dFORMAT, 0);
      ppos9    := FormatFloat(dFORMAT, 0);
      pspe     := FormatFloat(dFORMAT, 0);
      pemp     := FormatFloat(dFORMAT, Query_TotalSum.FieldByName('PSPE2').AsInteger);
      pextrsum := FormatFloat(dFORMAT, 0);
      //계약,일반 t/o
      tcontsum := FormatFloat(dFORMAT, 0);
      ttempsum := FormatFloat(dFORMAT, 0);
      // 계약직 관련 수정
      pcontsum := FormatFloat(dFORMAT, 0);
      pcontsum := FormatFloat(dFORMAT, 0); //2002.07.29 shm 전문계약직 추가
//2002.04.17 shm 추가 (정여진씨 요청 계약+일반)
      pimsisum := FormatFloat(sFORMAT, Query_TotalSum.FieldByName('pcontsum').AsInteger +
                                       Query_TotalSum.FieldByName('pextrsum').AsInteger +
                                       Query_TotalSum.FieldByName('psconsum').AsInteger); //2002.07.29 shm 전문계약직 추가

      psum     := FormatFloat(dFORMAT, Query_TotalSum.FieldByName('PSPE2').AsInteger);
//x (shm)
      flag := 'C';
      System.Write(Fout, DataIn);
      Inc(LineCnt);
      flag := 'S';
      System.Write(Fout, DataIn);
    end;
    Query_TotalSum.Close;
(*-------------------------------------------------------------------------------
  버전     수정일     수정자    관련근거       수정내용
  1.01   1998.04.15   김순례   전(98.4.11)   Sectcode(부문) 추가
 -------------------------------------------------------------------------------*)
    //부문별(sectcode) 소계
      Query_SecTotal.Close;
      Query_SecTotal.Sql.Clear;
      Query_SecTotal.Sql.Add('SELECT ORGNUM, ltrim(rtrim(SECTCODE)) SECTCODE, sum(TTOTAL) TTOTAL, sum(TEMPTOT) TEMPTOT,sum(PPOSSUM+PSPE1+PSPE3+PSPE4+PSPE5) PTOTAL, '+ //30.12 TEMPTOT추가
                             '      sum(PDIRSUM) PDIRSUM, sum(PDIR71) PDIR71, sum(PPOS1) PPOS1, sum(PPOS2) PPOS2, sum(PPOS3) PPOS3, '+
                             '      sum(PPOS4) PPOS4, sum(PPOS5) PPOS5, sum(PPOS6) PPOS6, sum(PPOS7) PPOS7, sum(PPOS8) PPOS8, sum(PPOS9) PPOS9, '+
                             '      sum(PSPE21) PSPE21, sum(PSPE22) PSPE22, sum(PSPE23) PSPE23, sum(PSPE24) PSPE24, sum(PSPE25) PSPE25,         '+
                             '      sum(PSPE26) PSPE26, sum(PSPE27) PSPE27, sum(PSPE2) PSPE2, sum(PSPE1+PSPE3+PSPE4+PSPE5) PSPE,    '+
                             '      sum(PEXTRSUM+PTEMPSUM) PEXTRSUM, sum(pcontsum) pcontsum,  sum(psconsum) psconsum,  '+ //2002.07.29 shm psconsum 추가
                             '      sum(tcontsum) tcontsum, sum(ttempsum) ttempsum           '+
                             ' FROM  PIHTOPO    '+
                             ' WHERE TOPOYM = :P_topoym AND TPGUBUN=''10''  AND SECTCODE <> ''Z''    '+
                             ' GROUP BY ORGNUM, ltrim(rtrim(SECTCODE)) '+
                             ' ORDER BY ORGNUM, ltrim(rtrim(SECTCODE)) ');

      Query_SecTotal.ParamByName('P_topoym').AsString   := ME_WorkDate.Text;
      Query_SecTotal.Open;
      ProgressCnt := 0;

      while not Query_SecTotal.Eof do
      begin
//==============================================================================//
// 30.33   2002.10.25   손종운   이석희씨 요청   사장 ===> 회장
//==============================================================================//
      if ((Length(Query_SecTotal.FieldByName('sectcode').AsString) = 1) and
          (Query_SecTotal.FieldByName('sectcode').AsString >= 'A')      and     //'A' 사장 (shm)
          (ME_WorkDate.Text >= '200011')) or
         ((Length(Query_SecTotal.FieldByName('sectcode').AsString) = 2) and
          (Query_SecTotal.FieldByName('sectcode').AsString = '3A')      and     //'3A' 회장
          (ME_WorkDate.Text >= '200011'))                               then
//==============================================================================//
      begin
        Query_PartTotal.Close;
        Query_PartTotal.Sql.Clear;     //부문 total (shm)
        if Query_SecTotal.FieldByName('sectcode').AsString = '3A' then
        begin
          Query_PartTotal.Sql.Add('SELECT ORGNUM, substr(SECTCODE,1,2) sectcode, sum(TTOTAL) TTOTAL,sum(TEMPTOT) TEMPTOT, sum(PPOSSUM+PSPE1+PSPE3+PSPE4+PSPE5) PTOTAL, '+ //30.12 TEMPTOT 추가
                                 '      sum(PDIRSUM) PDIRSUM, sum(PDIR71) PDIR71, sum(PPOS1) PPOS1, sum(PPOS2) PPOS2, sum(PPOS3) PPOS3, '+
                                 '      sum(PPOS4) PPOS4, sum(PPOS5) PPOS5, sum(PPOS6) PPOS6, sum(PPOS7) PPOS7, sum(PPOS8) PPOS8, sum(PPOS9) PPOS9, '+
                                 '      sum(PSPE21) PSPE21, sum(PSPE22) PSPE22, sum(PSPE23) PSPE23, sum(PSPE24) PSPE24, sum(PSPE25) PSPE25,         '+
                                 '      sum(PSPE26) PSPE26, sum(PSPE27) PSPE27, sum(PSPE2) PSPE2, sum(PSPE1+PSPE3+PSPE4+PSPE5) PSPE,    '+
                                 '      sum(PEXTRSUM+PTEMPSUM) PEXTRSUM, sum(pcontsum) pcontsum,  sum(psconsum) psconsum,  '+ //2002.07.29 shm psconsum 추가
                                 '      sum(tcontsum) tcontsum, sum(ttempsum) ttempsum            '+
                                 ' FROM  PIHTOPO    '+
                                 ' WHERE TOPOYM = :P_topoym AND TPGUBUN=''10''   '+
                                 '  AND  substr(SECTCODE,1,2) = :P_gubun         '+
                                 ' GROUP BY ORGNUM, substr(SECTCODE,1,2) '+
                                 ' ORDER BY ORGNUM, SECTCODE ');
          Query_PartTotal.ParamByName('P_topoym').AsString   := ME_WorkDate.Text;
          Query_PartTotal.ParamByName('P_gubun').AsString    := Query_SecTotal.FieldByName('sectcode').AsString;
        end
        else
        begin
          Query_PartTotal.Sql.Add('SELECT ORGNUM, substr(SECTCODE,1,1) sectcode, sum(TTOTAL) TTOTAL,sum(TEMPTOT) TEMPTOT, sum(PPOSSUM+PSPE1+PSPE3+PSPE4+PSPE5) PTOTAL, '+ //30.12 TEMPTOT 추가
                                 '      sum(PDIRSUM) PDIRSUM, sum(PDIR71) PDIR71, sum(PPOS1) PPOS1, sum(PPOS2) PPOS2, sum(PPOS3) PPOS3, '+
                                 '      sum(PPOS4) PPOS4, sum(PPOS5) PPOS5, sum(PPOS6) PPOS6, sum(PPOS7) PPOS7, sum(PPOS8) PPOS8, sum(PPOS9) PPOS9, '+
                                 '      sum(PSPE21) PSPE21, sum(PSPE22) PSPE22, sum(PSPE23) PSPE23, sum(PSPE24) PSPE24, sum(PSPE25) PSPE25,         '+
                                 '      sum(PSPE26) PSPE26, sum(PSPE27) PSPE27, sum(PSPE2) PSPE2, sum(PSPE1+PSPE3+PSPE4+PSPE5) PSPE,    '+
                                 '      sum(PEXTRSUM+PTEMPSUM) PEXTRSUM, sum(pcontsum) pcontsum,  sum(psconsum) psconsum,  '+ //2002.07.29 shm psconsum 추가
                                 '      sum(tcontsum) tcontsum, sum(ttempsum) ttempsum            '+
                                 ' FROM  PIHTOPO    '+
                                 ' WHERE TOPOYM = :P_topoym AND TPGUBUN=''10''   '+
                                 '  AND  substr(SECTCODE,1,1) = :P_gubun         '+
                                 ' GROUP BY ORGNUM, substr(SECTCODE,1,1) '+
                                 ' ORDER BY ORGNUM, SECTCODE ');
          Query_PartTotal.ParamByName('P_topoym').AsString   := ME_WorkDate.Text;
          Query_PartTotal.ParamByName('P_gubun').AsString    := Query_SecTotal.FieldByName('sectcode').AsString;
        end;
//==============================================================================//
        Query_PartTotal.Open;

        Qbondept.ParamByName('P_orgnum').AsString   := Query_PartTotal.FieldByName('orgnum').AsString;   //차수
        Qbondept.ParamByName('P_deptcode').AsString :=
                   RPAD(Query_PartTotal.FieldByName('sectcode').AsString,5,'0'); //무문코드

        deptname   := deptnamefind;
        Boldline   := True;  //본부 글씨굵게..
        Font.size  := 10;

        pbumn    := 'sect';
        P_Help.Caption := '['+deptname+'] 부서/BAND [부문별 소계]를 추출합니다 !!.';
        SendMessage(P_helpinfo.handle,WM_PAINT,0,0);

        ttotal   := FormatFloat(sFORMAT, Query_PartTotal.FieldByName('TEMPTOT').AsInteger);  //shm 30.21

        ptotal   := FormatFloat(sFORMAT, Query_PartTotal.FieldByName('PTOTAL').AsInteger+
                                         Query_PartTotal.FieldByName('PDIR71').AsInteger+    //이사대우
                                         Query_PartTotal.FieldByName('PSPE2').AsInteger);
//과부족 shm
        insuff   := FormatFloat(sFORMAT, (Query_PartTotal.FieldByName('PTOTAL').AsInteger+
                                          Query_PartTotal.FieldByName('PDIR71').AsInteger+
                                          Query_PartTotal.FieldByName('PSPE2').AsInteger)-
                                          Query_PartTotal.FieldByName('TEMPTOT').AsInteger);  //30.21
        pdirsum  := FormatFloat(sFORMAT,  Query_PartTotal.FieldByName('PDIRSUM').AsInteger -
                                          Query_PartTotal.FieldByName('PDIR71').AsInteger);   //이사이상임원
        PDIR71   := FormatFloat(sFORMAT,  Query_PartTotal.FieldByName('PDIR71').AsInteger);   //이사대우
        ppos1    := FormatFloat(sFORMAT,  Query_PartTotal.FieldByName('PPOS1').AsInteger+
                                          Query_PartTotal.FieldByName('PSPE21').AsInteger);
        ppos2    := FormatFloat(sFORMAT,  Query_PartTotal.FieldByName('PPOS2').AsInteger+
                                          Query_PartTotal.FieldByName('PSPE22').AsInteger);
        ppos3    := FormatFloat(sFORMAT,  Query_PartTotal.FieldByName('PPOS3').AsInteger+
                                          Query_PartTotal.FieldByName('PSPE23').AsInteger);
        ppos4    := FormatFloat(sFORMAT,  Query_PartTotal.FieldByName('PPOS4').AsInteger+
                                          Query_PartTotal.FieldByName('PSPE24').AsInteger);
        ppos5    := FormatFloat(sFORMAT,  Query_PartTotal.FieldByName('PPOS5').AsInteger+
                                          Query_PartTotal.FieldByName('PSPE25').AsInteger);
        ppos6    := FormatFloat(sFORMAT,  Query_PartTotal.FieldByName('PPOS6').AsInteger+
                                          Query_PartTotal.FieldByName('PSPE26').AsInteger);
        ppos7    := FormatFloat(sFORMAT,  Query_PartTotal.FieldByName('PPOS7').AsInteger+
                                          Query_PartTotal.FieldByName('PSPE27').AsInteger);
        ppos8    := FormatFloat(sFORMAT,  Query_PartTotal.FieldByName('PPOS8').AsInteger);
        ppos9    := FormatFloat(sFORMAT,  Query_PartTotal.FieldByName('PPOS9').AsInteger);
        pspe     := FormatFloat(sFORMAT,  Query_PartTotal.FieldByName('PSPE').AsInteger);
        pemp     := FormatFloat(sFORMAT,  Query_PartTotal.FieldByName('PTOTAL').AsInteger+
                                          Query_PartTotal.FieldByName('PSPE2').AsInteger);
        pextrsum := FormatFloat(sFORMAT,  Query_PartTotal.FieldByName('PEXTRSUM').AsInteger);
        //계약,일반 t/o
        tcontsum := FormatFloat(sFORMAT, Query_PartTotal.FieldByName('tcontsum').AsInteger);
        ttempsum := FormatFloat(sFORMAT, Query_PartTotal.FieldByName('ttempsum').AsInteger);
        // 계약직 관련 수정
        pcontsum := FormatFloat(sFORMAT, Query_PartTotal.FieldByName('pcontsum').AsInteger);
        psconsum := FormatFloat(sFORMAT, Query_PartTotal.FieldByName('psconsum').AsInteger); //2002.07.29 shm 계약+전문계약직,2002.08.21 shm 전문계약직 분리

        //2002.04.17 shm 추가 (정여진씨 요청 계약+일반)
        pimsisum := FormatFloat(sFORMAT, Query_PartTotal.FieldByName('pcontsum').AsInteger +
        // 30.30   2002.09.04   손종운   자체            전문계약직 소계에 포함
                                         Query_PartTotal.FieldByName('psconsum').AsInteger +
        // 30.30   끝
                                         Query_PartTotal.FieldByName('pextrsum').AsInteger);

        psum     := FormatFloat(sFORMAT, Query_PartTotal.FieldByName('PTOTAL').AsInteger +
                                         Query_PartTotal.FieldByName('PEXTRSUM').AsInteger+
                                         Query_PartTotal.FieldByName('pcontsum').AsInteger+
                                         Query_PartTotal.FieldByName('PSPE2').AsInteger +
                                         Query_PartTotal.FieldByName('PDIRSUM').AsInteger +
                                         Query_PartTotal.FieldByName('psconsum').AsInteger); //2002.07.29 shm 전문계약직 추가

//1번째(굵은글씨)
//사장,독립부서,경영기획부문.. 부문 write (shm)
        flag := 'C';
        System.Write(Fout, DataIn);
        Inc(LineCnt);
        if PageCheck(LineCnt,1) = False then
        begin
          ClearData;
          flag := 'S';
          System.Write(Fout, DataIn);
        end;

        if Query_PartTotal.FieldByName('PSPE2').AsInteger > 0 then
        begin
          ClearData;
          deptname := '(전임행정 소계)';
          plevel   := false;
          ttotal   := FormatFloat(dFORMAT, 0);
          ptotal   := FormatFloat(dFORMAT, Query_PartTotal.FieldByName('PSPE2').AsInteger);
          insuff   := FormatFloat(dFORMAT, 0);
          pdirsum  := FormatFloat(dFORMAT, 0);
          PDIR71   := FormatFloat(dFORMAT, 0);
          ppos1    := FormatFloat(dFORMAT, Query_PartTotal.FieldByName('PSPE21').AsInteger);
          ppos2    := FormatFloat(dFORMAT, Query_PartTotal.FieldByName('PSPE22').AsInteger);
          ppos3    := FormatFloat(dFORMAT, Query_PartTotal.FieldByName('PSPE23').AsInteger);
          ppos4    := FormatFloat(dFORMAT, Query_PartTotal.FieldByName('PSPE24').AsInteger);
          ppos5    := FormatFloat(dFORMAT, Query_PartTotal.FieldByName('PSPE25').AsInteger);
          ppos6    := FormatFloat(dFORMAT, Query_PartTotal.FieldByName('PSPE26').AsInteger);
          ppos7    := FormatFloat(dFORMAT, Query_PartTotal.FieldByName('PSPE27').AsInteger);
          ppos8    := FormatFloat(dFORMAT, 0);
          ppos9    := FormatFloat(dFORMAT, 0);
          pspe     := FormatFloat(dFORMAT, 0);
          pemp     := FormatFloat(dFORMAT, Query_PartTotal.FieldByName('PSPE2').AsInteger);
          pextrsum := FormatFloat(dFORMAT, 0);
          //계약,일반 t/o 30.21
          tcontsum := FormatFloat(dFORMAT, 0);
          ttempsum := FormatFloat(dFORMAT, 0);
          // 계약직 관련 수정
          pcontsum := FormatFloat(dFORMAT, 0);
          pcontsum := FormatFloat(dFORMAT, 0);
          //2002.04.17 shm 추가 (정여진씨 요청 계약+일반)
          pimsisum := FormatFloat(sFORMAT, Query_PartTotal.FieldByName('pcontsum').AsInteger +
                                           Query_PartTotal.FieldByName('pextrsum').AsInteger +
                                           Query_PartTotal.FieldByName('psconsum').AsInteger); //2002.07.29 shm 전문계약직 추가

          psum     := FormatFloat(dFORMAT, Query_PartTotal.FieldByName('PSPE2').AsInteger);
//x
          flag := 'C';
          System.Write(Fout, DataIn);
          Inc(LineCnt);
          if PageCheck(LineCnt,1) = False then
          begin
            ClearData;
            flag := 'S';
            System.Write(Fout, DataIn);
          end;
        end;
      end;  // if Length =1 이면...부문이므로....셋팅.
///////////////////////////////////////////////////////
//  수정끝.
///////////////////////////////////////////////////////


      Boldline := False; // 부서명 굵기.
//      Italicline := False;   //////////////////////////////
      inc(ProgressCnt);
      G_Progress.Progress := (ProgressCnt*100) div Query_SecTotal.RecordCount;
      SendMessage(Panel5.handle,WM_PAINT,0,0);
      ClearData;


      Qbondept.ParamByName('P_orgnum').AsString   := Query_SecTotal.FieldByName('orgnum').AsString;
      Qbondept.ParamByName('P_deptcode').AsString := RPAD(Query_SecTotal.FieldByName('sectcode').AsString,5,'0');

      deptname    :=  DeptNameFind; //sectcode 부문명
      plevel := true;               //부문 소계구분..true

      P_Help.Caption := '['+deptname+'] 부서의 데이타를 추출합니다 !!.';
      SendMessage(P_helpinfo.handle,WM_PAINT,0,0);
      Application.ProcessMessages;
//
      ttotal   := FormatFloat(sFORMAT, Query_SecTotal.FieldByName('TEMPTOT').AsInteger); //30.21 shm

      ptotal   := FormatFloat(sFORMAT, Query_SecTotal.FieldByName('PTOTAL').AsInteger+
                                       Query_SecTotal.FieldByName('PDIR71').AsInteger+   //이사대우
                                       Query_SecTotal.FieldByName('PSPE2').AsInteger);
//과부족(shm)
      insuff   := FormatFloat(sFORMAT, (Query_SecTotal.FieldByName('PTOTAL').AsInteger+
                                        Query_SecTotal.FieldByName('PDIR71').AsInteger+
                                        Query_SecTotal.FieldByName('PSPE2').AsInteger)-
                                        Query_SecTotal.FieldByName('TEMPTOT').AsInteger);//30.21
      pdirsum  := FormatFloat(sFORMAT, Query_SecTotal.FieldByName('PDIRSUM').AsInteger -
                                       Query_SecTotal.FieldByName('PDIR71').AsInteger); //이사이상 임원
      PDIR71   := FormatFloat(sFORMAT, Query_SecTotal.FieldByName('PDIR71').AsInteger); //이사대우

      ppos1    := FormatFloat(sFORMAT, Query_SecTotal.FieldByName('PPOS1').AsInteger+
                                       Query_SecTotal.FieldByName('PSPE21').AsInteger);
      ppos2    := FormatFloat(sFORMAT, Query_SecTotal.FieldByName('PPOS2').AsInteger+
                                       Query_SecTotal.FieldByName('PSPE22').AsInteger);
      ppos3    := FormatFloat(sFORMAT, Query_SecTotal.FieldByName('PPOS3').AsInteger+
                                       Query_SecTotal.FieldByName('PSPE23').AsInteger);
      ppos4    := FormatFloat(sFORMAT, Query_SecTotal.FieldByName('PPOS4').AsInteger+
                                       Query_SecTotal.FieldByName('PSPE24').AsInteger);
      ppos5    := FormatFloat(sFORMAT, Query_SecTotal.FieldByName('PPOS5').AsInteger+
                                       Query_SecTotal.FieldByName('PSPE25').AsInteger);
      ppos6    := FormatFloat(sFORMAT, Query_SecTotal.FieldByName('PPOS6').AsInteger+
                                       Query_SecTotal.FieldByName('PSPE26').AsInteger);
      ppos7    := FormatFloat(sFORMAT, Query_SecTotal.FieldByName('PPOS7').AsInteger+
                                       Query_SecTotal.FieldByName('PSPE27').AsInteger);
      ppos8    := FormatFloat(sFORMAT, Query_SecTotal.FieldByName('PPOS8').AsInteger);
      ppos9    := FormatFloat(sFORMAT, Query_SecTotal.FieldByName('PPOS9').AsInteger);
      pspe     := FormatFloat(sFORMAT, Query_SecTotal.FieldByName('PSPE').AsInteger);
      pemp     := FormatFloat(sFORMAT, Query_SecTotal.FieldByName('PTOTAL').AsInteger+
                                       Query_SecTotal.FieldByName('PSPE2').AsInteger);
      pextrsum := FormatFloat(sFORMAT, Query_SecTotal.FieldByName('PEXTRSUM').AsInteger);
      //계약,일반 t/o  30.21
      tcontsum := FormatFloat(sFORMAT, Query_SecTotal.FieldByName('tcontsum').AsInteger);
      ttempsum := FormatFloat(sFORMAT, Query_SecTotal.FieldByName('ttempsum').AsInteger);
      // 계약직 관련 수정
      pcontsum := FormatFloat(sFORMAT, Query_SecTotal.FieldByName('pcontsum').AsInteger);
      psconsum := FormatFloat(sFORMAT, Query_SecTotal.FieldByName('psconsum').AsInteger); //2002.07.29 shm 계약+전문계약직,2002.08.21 shm 전문계약직 분리

      //2002.04.17 shm 추가 (정여진씨 요청 계약+일반)
      pimsisum := FormatFloat(sFORMAT, Query_SecTotal.FieldByName('pcontsum').AsInteger +
      // 30.30   2002.09.04   손종운   자체            전문계약직 소계에 포함
                                       Query_SecTotal.FieldByName('psconsum').AsInteger +
      // 30.30   끝
                                       Query_SecTotal.FieldByName('pextrsum').AsInteger);

      psum     := FormatFloat(sFORMAT, Query_SecTotal.FieldByName('PTOTAL').AsInteger +
                                       Query_SecTotal.FieldByName('PEXTRSUM').AsInteger+
                                       Query_SecTotal.FieldByName('pcontsum').AsInteger+
                                       Query_SecTotal.FieldByName('PSPE2').AsInteger +
                                       Query_SecTotal.FieldByName('PDIRSUM').AsInteger +
                                       Query_SecTotal.FieldByName('psconsum').AsInteger); //2002.07.29 shm 전문계약직 추가
//2번째
//사장, 독립부서,하나로협의회,경영기획부문....(shm)
//자기자신이 또 Write되기 때문에 length로 check하여 부문이상만 write
//==============================================================================//
// 30.33   2002.10.25   손종운   이석희씨 요청   사장 ===> 회장
//==============================================================================//
//  if   length(Query_SecTotal.FieldByName('sectcode').AsString) > 1 then
  if   (length(Query_SecTotal.FieldByName('sectcode').AsString) > 1) and
       (Query_SecTotal.FieldByName('sectcode').AsString <> '3A')then
//==============================================================================//
  begin
      flag := 'C'; System.Write(Fout, DataIn); Inc(LineCnt);
      if PageCheck(LineCnt,1) = False then begin
         ClearData; flag := 'S'; System.Write(Fout, DataIn);
      end;  //2000.11.06
  end;

      if  Query_SecTotal.FieldByName('PSPE2').AsInteger > 0 then begin
          ClearData;
          deptname := '   (전임행정총계)';
          plevel   := false;
          ttotal   := FormatFloat(dFORMAT, 0);
          ptotal   := FormatFloat(dFORMAT, Query_SecTotal.FieldByName('PSPE2').AsInteger);
          insuff   := FormatFloat(dFORMAT, 0);
          pdirsum  := FormatFloat(dFORMAT, 0);
          PDIR71   := FormatFloat(dFORMAT, 0);
          ppos1    := FormatFloat(dFORMAT, Query_SecTotal.FieldByName('PSPE21').AsInteger);
          ppos2    := FormatFloat(dFORMAT, Query_SecTotal.FieldByName('PSPE22').AsInteger);
          ppos3    := FormatFloat(dFORMAT, Query_SecTotal.FieldByName('PSPE23').AsInteger);
          ppos4    := FormatFloat(dFORMAT, Query_SecTotal.FieldByName('PSPE24').AsInteger);
          ppos5    := FormatFloat(dFORMAT, Query_SecTotal.FieldByName('PSPE25').AsInteger);
          ppos6    := FormatFloat(dFORMAT, Query_SecTotal.FieldByName('PSPE26').AsInteger);
          ppos7    := FormatFloat(dFORMAT, Query_SecTotal.FieldByName('PSPE27').AsInteger);
          ppos8    := FormatFloat(dFORMAT, 0);
          ppos9    := FormatFloat(dFORMAT, 0);
          pspe     := FormatFloat(dFORMAT, 0);
          pemp     := FormatFloat(dFORMAT, Query_SecTotal.FieldByName('PSPE2').AsInteger);
          pextrsum := FormatFloat(dFORMAT, 0);
          //계약,일반 t/o
          tcontsum := FormatFloat(dFORMAT, 0);
          ttempsum := FormatFloat(dFORMAT, 0);
// 계약직 관련 수정
          pcontsum := FormatFloat(dFORMAT, 0);
          psconsum := FormatFloat(dFORMAT, 0); //2002.07.29 shm 전문계약직 추가
//2002.04.17 shm 추가 (정여진씨 요청 계약+일반)
          pimsisum := FormatFloat(sFORMAT, Query_SecTotal.FieldByName('pcontsum').AsInteger +
                                           Query_SecTotal.FieldByName('pextrsum').AsInteger +
                                           Query_SecTotal.FieldByName('psconsum').AsInteger); //2002.07.29 shm 전문계약직 추가

          psum     := FormatFloat(dFORMAT, Query_SecTotal.FieldByName('PSPE2').AsInteger);
// x (shm)
          flag := 'C'; System.Write(Fout, DataIn); Inc(LineCnt); Inc(Cnt);
          if PageCheck(LineCnt,1) = False then begin
             ClearData; flag := 'S'; System.Write(Fout, DataIn);
          end;
      end;
//=====================
//실 단위 소계 별 소계
    Query_SubTotal.Close;
    Query_SubTotal.ParamByName('P_topoym').AsString   := ME_WorkDate.Text;
    Query_SubTotal.ParamByName('P_sectcode').AsString := Query_SecTotal.FieldByName('sectcode').AsString;
    Query_SubTotal.Open;


//  30.19   특이부서라서....예외처리.
    IF (Query_SubTotal.FieldByName('fieldcode').AsString = 'AJ') THEN
            Query_SubTotal.Next;

    while not Query_SubTotal.Eof do
    begin
      cnt := 0;
      ClearData;
      Qbondept.ParamByName('P_orgnum').AsString   := Query_SubTotal.FieldByName('orgnum').AsString;
      Qbondept.ParamByName('P_deptcode').AsString := RPAD(Query_SubTotal.FieldByName('fieldcode').AsString,5,'0');

      IF  ((length(Query_SubTotal.FieldByName('fieldcode').AsString) = 3) and
           (Query_SubTotal.FieldByName('fieldcode').AsString <> 'PDC' )) THEN
         deptname   := '  '+ DeptNameFind  //부문명
      ELSE
         deptname   :=  DeptNameFind;  //부문명
//===============================================================================================//

      plevel     := False;         // 소계시 는 출력..
      Boldline   := False; //line
      pbumn    := 'sect';
      P_Help.Caption := '['+deptname+'] 부서/BAND(BAND) [부문별 소계]를 추출합니다 !!.';
      SendMessage(P_helpinfo.handle,WM_PAINT,0,0);

      ttotal   := FormatFloat(sFORMAT, Query_SubTotal.FieldByName('TEMPTOT').AsInteger); //30.21
      ptotal   := FormatFloat(sFORMAT, Query_SubTotal.FieldByName('PTOTAL').AsInteger+
                                       Query_SubTotal.FieldByName('PDIR71').AsInteger+   //이사대우
                                       Query_SubTotal.FieldByName('PSPE2').AsInteger);
//과부족 shm
      insuff   := FormatFloat(sFORMAT, (Query_SubTotal.FieldByName('PTOTAL').AsInteger+
                                        Query_SubTotal.FieldByName('PDIR71').AsInteger+
                                        Query_SubTotal.FieldByName('PSPE2').AsInteger)-
                                        Query_SubTotal.FieldByName('TEMPTOT').AsInteger);//30.21
      pdirsum  := FormatFloat(sFORMAT, Query_SubTotal.FieldByName('PDIRSUM').AsInteger -
                                       Query_SubTotal.FieldByName('PDIR71').AsInteger);  //이사이상임원
      PDIR71   := FormatFloat(sFORMAT, Query_SubTotal.FieldByName('PDIR71').AsInteger);  //이사대우
      ppos1    := FormatFloat(sFORMAT, Query_SubTotal.FieldByName('PPOS1').AsInteger+
                                       Query_SubTotal.FieldByName('PSPE21').AsInteger);
      ppos2    := FormatFloat(sFORMAT, Query_SubTotal.FieldByName('PPOS2').AsInteger+
                                       Query_SubTotal.FieldByName('PSPE22').AsInteger);
      ppos3    := FormatFloat(sFORMAT, Query_SubTotal.FieldByName('PPOS3').AsInteger+
                                       Query_SubTotal.FieldByName('PSPE23').AsInteger);
      ppos4    := FormatFloat(sFORMAT, Query_SubTotal.FieldByName('PPOS4').AsInteger+
                                       Query_SubTotal.FieldByName('PSPE24').AsInteger);
      ppos5    := FormatFloat(sFORMAT, Query_SubTotal.FieldByName('PPOS5').AsInteger+
                                       Query_SubTotal.FieldByName('PSPE25').AsInteger);
      ppos6    := FormatFloat(sFORMAT, Query_SubTotal.FieldByName('PPOS6').AsInteger+
                                       Query_SubTotal.FieldByName('PSPE26').AsInteger);
      ppos7    := FormatFloat(sFORMAT, Query_SubTotal.FieldByName('PPOS7').AsInteger+
                                       Query_SubTotal.FieldByName('PSPE27').AsInteger);
      ppos8    := FormatFloat(sFORMAT, Query_SubTotal.FieldByName('PPOS8').AsInteger);
      ppos9    := FormatFloat(sFORMAT, Query_SubTotal.FieldByName('PPOS9').AsInteger);
      pspe     := FormatFloat(sFORMAT, Query_SubTotal.FieldByName('PSPE').AsInteger);
      pemp     := FormatFloat(sFORMAT, Query_SubTotal.FieldByName('PTOTAL').AsInteger+
                                       Query_SubTotal.FieldByName('PSPE2').AsInteger);
      pextrsum := FormatFloat(sFORMAT, Query_SubTotal.FieldByName('PEXTRSUM').AsInteger);
      //계약,일반 t/o
      tcontsum := FormatFloat(sFORMAT, Query_SubTotal.FieldByName('tcontsum').AsInteger);
      ttempsum := FormatFloat(sFORMAT, Query_SubTotal.FieldByName('ttempsum').AsInteger);
      // 계약직 관련 수정
      pcontsum := FormatFloat(sFORMAT, Query_SubTotal.FieldByName('pcontsum').AsInteger);
      psconsum := FormatFloat(sFORMAT, Query_SubTotal.FieldByName('psconsum').AsInteger); //2002.07.29 shm 계약+전문계약직,2002.08.21 shm 전문계약직 분리

      //2002.04.17 shm 추가 (정여진씨 요청 계약+일반)
      pimsisum := FormatFloat(sFORMAT, Query_SubTotal.FieldByName('pcontsum').AsInteger +
      // 30.30   2002.09.04   손종운   자체            전문계약직 소계에 포함
                                       Query_SubTotal.FieldByName('psconsum').AsInteger +
      // 30.30   끝
                                       Query_SubTotal.FieldByName('pextrsum').AsInteger);

      psum     := FormatFloat(sFORMAT, Query_SubTotal.FieldByName('PTOTAL').AsInteger +
                                       Query_SubTotal.FieldByName('PEXTRSUM').AsInteger+
                                       Query_SubTotal.FieldByName('pcontsum').AsInteger+
                                       Query_SubTotal.FieldByName('PSPE2').AsInteger +
                                       Query_SubTotal.FieldByName('PDIRSUM').AsInteger +
                                       Query_SubTotal.FieldByName('psconsum').AsInteger); //2002.07.29 전문계약직 추가 shm

//3번째
 IF  //(Query_SubTotal.FieldByName('fieldcode').AsString =  'JIU') or 소팀->대팀
     (Query_SubTotal.FieldByName('fieldcode').AsString =  'PCU') or
//==========================================================================================//
// 30.54   2002.12.04   손종운   이석희씨 요청   제주지사 ===> 소계인쇄않되게 ...( 선처리 )
//==========================================================================================//
     (Query_SubTotal.FieldByName('fieldcode').AsString =  'JIW') or
//==========================================================================================//
     (Query_SubTotal.FieldByName('fieldcode').AsString =  'JLU')
      THEN  //2002.02.15 SHM
      Query_SubTotal.Next
 ELSE
 IF  (length(Query_SubTotal.FieldByName('sectcode').AsString) > 1) or
    (length(Query_SubTotal.FieldByName('fieldcode').AsString) > 1) then
 begin
      flag := 'C';
      System.Write(Fout, DataIn);
      Inc(LineCnt);
      if PageCheck(LineCnt,1) = False then
      begin
         ClearData;
         flag := 'S';
         System.Write(Fout, DataIn);
      end;
 end;
//========================================
      if Query_SubTotal.FieldByName('PSPE2').AsInteger > 0 then
      begin
        ClearData;
        deptname := '(전임행정 소계)';
        plevel   := false;
        ttotal   := FormatFloat(dFORMAT, 0);
        ptotal   := FormatFloat(dFORMAT, Query_SubTotal.FieldByName('PSPE2').AsInteger);
        insuff   := FormatFloat(dFORMAT, 0);
        pdirsum  := FormatFloat(dFORMAT, 0);
        PDIR71   := FormatFloat(dFORMAT, 0);
        ppos1    := FormatFloat(dFORMAT, Query_SubTotal.FieldByName('PSPE21').AsInteger);
        ppos2    := FormatFloat(dFORMAT, Query_SubTotal.FieldByName('PSPE22').AsInteger);
        ppos3    := FormatFloat(dFORMAT, Query_SubTotal.FieldByName('PSPE23').AsInteger);
        ppos4    := FormatFloat(dFORMAT, Query_SubTotal.FieldByName('PSPE24').AsInteger);
        ppos5    := FormatFloat(dFORMAT, Query_SubTotal.FieldByName('PSPE25').AsInteger);
        ppos6    := FormatFloat(dFORMAT, Query_SubTotal.FieldByName('PSPE26').AsInteger);
        ppos7    := FormatFloat(dFORMAT, Query_SubTotal.FieldByName('PSPE27').AsInteger);
        ppos8    := FormatFloat(dFORMAT, 0);
        ppos9    := FormatFloat(dFORMAT, 0);
        pspe     := FormatFloat(dFORMAT, 0);
        pemp     := FormatFloat(dFORMAT, Query_SubTotal.FieldByName('PSPE2').AsInteger);
        pextrsum := FormatFloat(dFORMAT, 0);
        //계약,일반 t/o
        tcontsum := FormatFloat(dFORMAT, 0);
        ttempsum := FormatFloat(dFORMAT, 0);
        // 계약직 관련 수정
        pcontsum := FormatFloat(dFORMAT, 0);
        psconsum := FormatFloat(dFORMAT, 0); //2002.07.29 shm 전문계약직 추가
        //2002.04.17 shm 추가 (정여진씨 요청 계약+일반)
        pimsisum := FormatFloat(sFORMAT, Query_SubTotal.FieldByName('pcontsum').AsInteger +
                                         Query_SubTotal.FieldByName('pextrsum').AsInteger +
                                         Query_SubTotal.FieldByName('psconsum').AsInteger); //2002.07.29 전문계약직 추가 shm

        psum     := FormatFloat(dFORMAT, Query_SubTotal.FieldByName('PSPE2').AsInteger);
        flag := 'C';
        System.Write(Fout, DataIn);
        Inc(LineCnt);
        if PageCheck(LineCnt,1) = False then
        begin
          ClearData;
          flag := 'S';
          System.Write(Fout, DataIn);
        end;
      end;

//팀 -shm
//====================
      Query_Detail.close;
      Query_Detail.ParamByName('P_topoym').AsString := ME_WorkDate.Text;
      Query_Detail.ParamByName('P_orgnum').AsString :=
                   Query_SubTotal.FieldByName('ORGNUM').AsString;
      Query_Detail.ParamByName('P_fieldcode').AsString :=
                   Query_SubTotal.FieldByName('FIELDCODE').AsString;
      Query_Detail.ParamByName('P_sectcode').AsString :=
                   Query_SubTotal.FieldByName('SECTCODE').AsString;

      Query_Detail.Open;

      while not Query_Detail.Eof do
      begin
        ClearData;
        if (copy(Query_Detail.FieldByName('TPGUBUN_1').AsString,1,1) = '2') then
        begin
          deptname := '  (파견/교육)';
          plevel := false;
          inc(cnt);
          Fmt := dFormat;
        end
        else
        begin
          Qbondept.ParamByName('P_orgnum').AsString   := Query_SubTotal.FieldByName('ORGNUM').AsString;
          Qbondept.ParamByName('P_deptcode').AsString := Query_Detail.FieldByName('BONCODE').AsString;


          deptcode :=  Qbondept.ParamByName('P_deptcode').AsString;

          IF (Query_Detail.FieldByName('BONCODE').AsString = 'JIE00') OR    //강남지사
             (Query_Detail.FieldByName('BONCODE').AsString = 'JIG00') OR    //강북지사
             (Query_Detail.FieldByName('BONCODE').AsString = 'JII00') OR    //수도권남지사
             (Query_Detail.FieldByName('BONCODE').AsString = 'JIK00') OR    //수도권북지사
             (Query_Detail.FieldByName('BONCODE').AsString = 'JIM00') OR    //충청지사
             (Query_Detail.FieldByName('BONCODE').AsString = 'JIO00') OR    //경북지사
             (Query_Detail.FieldByName('BONCODE').AsString = 'JIQ00') OR    //호남지사
             (Query_Detail.FieldByName('BONCODE').AsString = 'JIS00') OR    //부산지사
             (Query_Detail.FieldByName('BONCODE').AsString = 'JIU00') OR    //강원지사
             (Query_Detail.FieldByName('BONCODE').AsString = 'JLL00') OR    //기업영업1실
             (Query_Detail.FieldByName('BONCODE').AsString = 'JLR00') THEN  //기업영업2실  2002.04.24 이석희씨 요청
          begin
              C0_check := 1
          end else
              C0_check := 0;

          DeptNameFind;
          if  (deptlevel = 'C0') and (C0_check = 0)
          then
              deptname := '  '+DeptNameFind
          else
          if  (deptlevel = 'D0') or (C0_check = 1) then
              deptname := '    '+DeptNameFind;

          plevel   := false;

          if (Query_Detail.FieldByName('TTOTAL').AsInteger = 0) and
             ((Query_Detail.FieldByName('PTOTAL').AsInteger +
               Query_Detail.FieldByName('PdirSUM').AsInteger) = 0) then  //30.23 2001.07.30 shm 임원만 있는 팀은 출력되지 않아서.
          begin                                                          //( PIHTOPO."DEPTLEVEL"  > 'B0') detail query 에 추가. shm
            if Query_Detail.FieldByName('PSPE2').AsInteger > 0 then
            begin
              ClearData;
              deptname := '  (전임행정직)';
              plevel   := false;
              Executive_Data;
              Inc(Cnt);
              flag := 'C';
              System.Write(Fout, DataIn);
              Inc(LineCnt);
              PageCheck(LineCnt,1);
            end;
             Query_Detail.Next;
             if (Query_Detail.EOF = True) then
             begin
                Break;
             end;
             continue;
          end;
          Fmt := sFormat;
        end; // else begin
        P_Help.Caption := '['+deptname+'] 부서/BAND별 [본부인원계]를 추출합니다 !!.';
        SendMessage(P_helpinfo.handle,WM_PAINT,0,0);
             ptotal   := FormatFloat(Fmt, Query_Detail.FieldByName('PTOTAL').AsInteger+
                                          Query_Detail.FieldByName('PSPE2').AsInteger+
                                          Query_Detail.FieldByName('PDIR71').AsInteger); //19990511
             insuff   := FormatFloat(Fmt, (Query_Detail.FieldByName('PTOTAL').AsInteger+
                                           Query_Detail.FieldByName('PDIR71').AsInteger+ //19990511
                                           Query_Detail.FieldByName('PSPE2').AsInteger) -
                                           Query_Detail.FieldByName('TEMPTOT').AsInteger);
        // 총무관리본부 파견/교육  계획인원 변수화일에서 읽어온 count
        if ((copy(Query_Detail.FieldByName('TPGUBUN_1').AsString,1,1) = '2'))
           and (Query_Detail.FieldByName('boncode').AsString  = pdeptcode)  then begin
               ttotal   := FormatFloat(dFORMAT, strtoint(pcount));
               insuff   := FormatFloat(Fmt, (Query_Detail.FieldByName('PTOTAL').AsInteger+
                                             Query_Detail.FieldByName('PSPE2').AsInteger) -
                                             (StrToInt(pcount)));
        end;
        pdirsum  := FormatFloat(Fmt, Query_Detail.FieldByName('PDIRSUM').AsInteger -
                                     Query_Detail.FieldByName('PDIR71').AsInteger); //이사이상임원
        PDIR71   := FormatFloat(Fmt, Query_Detail.FieldByName('PDIR71').AsInteger); //이사대우
        ppos1    := FormatFloat(Fmt, Query_Detail.FieldByName('PPOS1').AsInteger+
                                     Query_Detail.FieldByName('PSPE21').AsInteger);
        ppos2    := FormatFloat(Fmt, Query_Detail.FieldByName('PPOS2').AsInteger+
                                     Query_Detail.FieldByName('PSPE22').AsInteger);
        ppos3    := FormatFloat(Fmt, Query_Detail.FieldByName('PPOS3').AsInteger+
                                     Query_Detail.FieldByName('PSPE23').AsInteger);
        ppos4    := FormatFloat(Fmt, Query_Detail.FieldByName('PPOS4').AsInteger+
                                     Query_Detail.FieldByName('PSPE24').AsInteger);
        ppos5    := FormatFloat(Fmt, Query_Detail.FieldByName('PPOS5').AsInteger+
                                     Query_Detail.FieldByName('PSPE25').AsInteger);
        ppos6    := FormatFloat(Fmt, Query_Detail.FieldByName('PPOS6').AsInteger+
                                     Query_Detail.FieldByName('PSPE26').AsInteger);
        ppos7    := FormatFloat(Fmt, Query_Detail.FieldByName('PPOS7').AsInteger+
                                     Query_Detail.FieldByName('PSPE27').AsInteger);
        ppos8    := FormatFloat(Fmt, Query_Detail.FieldByName('PPOS8').AsInteger);
        ppos9    := FormatFloat(Fmt, Query_Detail.FieldByName('PPOS9').AsInteger);
        pspe     := FormatFloat(Fmt, Query_Detail.FieldByName('PSPE').AsInteger);
        pemp     := FormatFloat(Fmt, Query_Detail.FieldByName('PTOTAL').AsInteger+
                                     Query_Detail.FieldByName('PSPE2').AsInteger);
        pextrsum := FormatFloat(Fmt, Query_Detail.FieldByName('PEXTRSUM').AsInteger);
        //계약,일반 t/o
        tcontsum := FormatFloat(Fmt, Query_Detail.FieldByName('tcontsum').AsInteger);
        ttempsum := FormatFloat(Fmt, Query_Detail.FieldByName('ttempsum').AsInteger);
        // 계약직 관련 수정
        pcontsum := FormatFloat(Fmt, Query_Detail.FieldByName('pcontsum').AsInteger);
        psconsum := FormatFloat(Fmt, Query_Detail.FieldByName('psconsum').AsInteger); //2002.07.29 shm 계약+전문계약직,2002.08.21 shm 전문계약직 분리

        //2002.04.17 shm 추가 (정여진씨 요청 계약+일반)
        pimsisum := FormatFloat(sFORMAT, Query_Detail.FieldByName('pcontsum').AsInteger +
        // 30.30   2002.09.04   손종운   자체            전문계약직 소계에 포함
                                         Query_Detail.FieldByName('psconsum').AsInteger +
        // 30.30   끝
                                         Query_Detail.FieldByName('pextrsum').AsInteger);

        psum     := FormatFloat(Fmt, Query_Detail.FieldByName('PTOTAL').AsInteger +
                                     Query_Detail.FieldByName('PEXTRSUM').AsInteger+
                                     Query_Detail.FieldByName('pcontsum').AsInteger+
                                     Query_Detail.FieldByName('PSPE2').AsInteger +
                                     Query_Detail.FieldByName('PDIRSUM').AsInteger +
                                     Query_Detail.FieldByName('psconsum').AsInteger); //2002.07.29 shm 전문계약직 추가

       Boldline   := False; //line
//     Italicline := False; //////////////////////////////
//4번째
//비서실,홍보실,홍보팀,광고팀,대외협력실...
      if  (Query_Detail.FieldByName('BONCODE').Asstring = 'FFF00') or  //경영혁신추진반     2001.02.27 최준영씨 요청
          (Query_Detail.FieldByName('BONCODE').Asstring = 'LPC00') or  //사이버교육원부원장
          (Query_Detail.FieldByName('BONCODE').Asstring = 'LPF00') then //교육사무국
      begin
          Query_Detail.Next;
      end else
      begin
        flag := 'C';
        System.Write(Fout, DataIn);
        Inc(Cnt);
        Inc(LineCnt);
        PageCheck(LineCnt,1);
      end;



        if Query_Detail.FieldByName('PSPE2').AsInteger > 0 then
        begin
           ClearData;
           deptname := '  (전임행정직)';
           plevel   := false;
           Executive_Data;
           inc(cnt);
           flag := 'C';
           System.Write(Fout, DataIn);
           Inc(LineCnt);
           PageCheck(LineCnt,1);
        end;
        Query_Detail.Next;
      end; // 본부명을 출력하는 부분의 끝.
      Query_Detail.Close;
      if (cnt > 0) and (LineCnt > 1) then
      begin
          flag := 'S';
          System.Write(Fout, DataIn);
      end;
      Query_SubTotal.Next; //다음 부문소계를 읽음
    end; // 부문별을 출력하는 부분의 끝.
    Query_SubTotal.Close;
    Query_SecTotal.Next;
   end;                     //sectcode end
    Query_SecTotal.Close;
  end; //with
  System.CloseFile(Fout);

  //comment 처리
  P_Help.Caption := '부서/BAND별 [총괄사항]을 추출합니다 !!.';
  SendMessage(P_helpinfo.handle,WM_PAINT,0,0);
  AssignFile(FCom, HomeDir+'\list\PIE3020A.dat');
  System.ReWrite(FCom);
  Query_comment1.Close;
  Query_comment1.ParamByName('P_topoym').AsString := ME_WorkDate.Text;
  Query_comment1.Open;
  with Query_comment1 do
  begin
    First;
    Buff  := '';
    Buff1 := '';
    Buff2 := '';
    Buff3 := '';
    Buff4 := '';
    if not Eof then
    begin
(*
      Buff:='① 총괄현원 ['+IntToStr(FieldByName('TOTCUR').AsInteger)+
            ' 명] = 정규직 + 협력[임원은 제외]';
      System.WriteLn(FCom, Buff);
      inc(LineCnt);
*)
      PageCheck(LineCnt,2);

      Buff1 := '① 임원 ['+IntToStr(FieldByName('PDIRSUM').AsInteger)+' 명] : ';
      if FieldByName('PDIR11').AsInteger <> 0 then
         Buff1:=Buff1+'회장 '+IntToStr(FieldByName('PDIR11').AsInteger)+', ';
      if FieldByName('PDIR12').AsInteger <> 0 then
         Buff1:=Buff1+'부회장 '+IntToStr(FieldByName('PDIR12').AsInteger)+', ';
      if FieldByName('PDIR21').AsInteger <> 0 then
         Buff1:=Buff1+'사장 '+IntToStr(FieldByName('PDIR21').AsInteger)+', ';
      if FieldByName('PDIR31').AsInteger <> 0 then
         Buff1:=Buff1+'감사 '+IntToStr(FieldByName('PDIR31').AsInteger)+', ';
      if FieldByName('PDIR41').AsInteger <> 0 then
         Buff1:=Buff1+'부사장 '+IntToStr(FieldByName('PDIR41').AsInteger)+', ';
      if FieldByName('PDIR51').AsInteger <> 0 then
         Buff1:=Buff1+'전무 '+IntToStr(FieldByName('PDIR51').AsInteger)+', ';
      if FieldByName('PDIR61').AsInteger <> 0 then
         Buff1:=Buff1+'상무 '+IntToStr(FieldByName('PDIR61').AsInteger)+', ';
      if FieldByName('PDIR71').AsInteger <> 0 then
         Buff2:=Buff2+'상무보 '+IntToStr(FieldByName('PDIR71').AsInteger)+', ';
      if FieldByName('PDIR6A').AsInteger <> 0 then      //2001.10.04 shm
         Buff2:=Buff2+'고문 '+IntToStr(FieldByName('PDIR6A').AsInteger)+', ';
      if FieldByName('PDIRETC').AsInteger <> 0 then
         Buff2:=Buff2+'기타 '+IntToStr(FieldByName('PDIRETC').AsInteger)+', ';

      if (length(Buff1)+length(Buff2)) < 110 then
      begin
         Buff := Buff1 + Buff2;
         Buff := Copy(Buff, 1, length(Buff)-2);   //끝부분의 ", "제거
         System.WriteLn(FCom, Buff);
         inc(LineCnt);
         PageCheck(LineCnt,2);
      end
      else
      begin
         System.WriteLn(FCom, Buff1);
         inc(LineCnt);
         PageCheck(LineCnt,2);
         Buff := '                     ' + Buff2;
         Buff := Copy(Buff, 1, length(Buff)-2);   //끝부분의 ", "제거
         System.WriteLn(FCom, Buff);
         inc(LineCnt);
         PageCheck(LineCnt,2);
      end;
     end;
  end; //with

  //comment 1  (화면의 주석부분-shm)
  if Edit1_1.Text+Edit1_2.Text+Edit1_3.Text <> '' then
  begin
    Buff := Edit1_1.Text+Edit1_2.Text+Edit1_3.Text;
    System.WriteLn(FCom, Buff);
    inc(LineCnt);
    PageCheck(LineCnt,2);
  end;

  //comment 2 ~ 8
  if Edit2_1.Text+Edit2_2.Text+Edit2_3.Text <> '' then
  begin
    Buff := Edit2_1.Text+Edit2_2.Text+Edit2_3.Text;
    System.WriteLn(FCom, Buff);
    inc(LineCnt);
    PageCheck(LineCnt,2);
  end;

  if Edit3_1.Text+Edit3_2.Text+Edit3_3.Text <> '' then
  begin
    Buff := Edit3_1.Text+Edit3_2.Text+Edit3_3.Text;
    System.WriteLn(FCom, Buff);
    inc(LineCnt);
    PageCheck(LineCnt,2);
  end;

  if Edit4_1.Text+Edit4_2.Text+Edit4_3.Text <> '' then
  begin
    Buff := Edit4_1.Text+Edit4_2.Text+Edit4_3.Text;
    System.WriteLn(FCom, Buff);
    inc(LineCnt);
    PageCheck(LineCnt,2);
  end;

  if Edit5_1.Text+Edit5_2.Text+Edit5_3.Text <> '' then
  begin
    Buff := Edit5_1.Text+Edit5_2.Text+Edit5_3.Text;
    System.WriteLn(FCom, Buff);
    inc(LineCnt);
    PageCheck(LineCnt,2);
  end;

  if Edit6_1.Text+Edit6_2.Text+Edit6_3.Text <> '' then
  begin
    Buff := Edit6_1.Text+Edit6_2.Text+Edit6_3.Text;
    System.WriteLn(FCom, Buff);
    inc(LineCnt);
    PageCheck(LineCnt,2);
  end;

  if Edit7_1.Text+Edit7_2.Text+Edit7_3.Text <> '' then
  begin
    Buff := Edit7_1.Text+Edit7_2.Text+Edit7_3.Text;
    System.WriteLn(FCom, Buff);
    inc(LineCnt);
    PageCheck(LineCnt,2);
  end;

  if Edit8_1.Text+Edit8_2.Text+Edit8_3.Text <> '' then
  begin
    Buff := Edit8_1.Text+Edit8_2.Text+Edit8_3.Text;
    System.WriteLn(FCom, Buff);
    inc(LineCnt);
    PageCheck(LineCnt,2);
  end;

  System.CloseFile(FCom);
  P_Help.Caption := '추출된 자료를 출력합니다.';
  SendMessage(P_helpinfo.handle,WM_PAINT,0,0);
end;

procedure TMainForm.Data_Display2;
begin
  with Newqry do
  begin
    Close;
    SQL.Clear;
//NEW_VERSION
    SQL.Add('SELECT ZZ.*                                                                              '+
            '  FROM (                                                                                 '+
            '         SELECT DECODE(YY.DEPTLEVEL,''D0'',''        ''||YY.DEPTNAME,                    '+
            '                                    ''C0'',''     ''||YY.DEPTNAME,                       '+
            '                                    ''E0'',''        ''||YY.DEPTNAME,                    '+
            '                                    ''B0'',''  ''||YY.DEPTNAME,YY.DEPTNAME) DEPTNAME,    '+
            '                YY.DEPTLEVEL, XX.* FROM                                                  '+
            '              (                                                                          '+
            '               SELECT SUBSTR(B.SECTCODE,1,1) DEPTCODE,A.ORGNUM,                          '+
            '                      NVL(SUM(A.PDIR71 + A.PEMPTOT),0) 현원,                             '+
            '                      SUM(A.PDIRSUM - A.PDIR71 - A.PDIR72)  상무이상 ,                   '+
            '                      SUM(A.PDIR71 + A.PDIR72) 상무보 ,                                  '+
            '                      SUM(A.PDIRSUM) 임원소계,                                           '+
            '                      SUM(A.P10) 부장 ,                                                  '+
            '                      SUM(A.P20) 차장 ,                                                  '+
            '                      SUM(A.P22) 과장,                                                   '+
            '                      SUM(A.P32) 대리 ,                                                  '+
            '                      SUM(A.P40 + A.P42 + A.P44)  사원,                                  '+
            '                      SUM(A.PSPESUM) 특정,                                               '+
            '                      SUM(A.PEMPTOT) 정규직계,                                           '+
            '                      SUM(PSCONSUM) 전계,                                                '+
            '                      SUM(A.PCONTSUM) 계약,                                              '+
            '                      SUM(PIMSITOT) 일반,                                                '+
            '                      SUM(PSCONSUM) + SUM(A.PCONTSUM) +  SUM(PIMSITOT) 계약계,           '+
            '                      SUM(PTOTAL) 총계                                                   '+
            '                 FROM PIHTOPO A, PYCDEPT B                                               '+
            '                WHERE A.ORGNUM = B.ORGNUM                                                '+
            '                  AND A.DEPTCODE = B.DEPTCODE                                            '+
            '                  AND A.TOPOYM = '''+ME_WorkDate.Text+'''                                '+
            '                  AND A.TPGUBUN =''10''                                                  '+
            '                GROUP BY A.ORGNUM,SUBSTR(B.SECTCODE,1,1)                                 '+
            '                UNION                                                                    '+
             '               SELECT SUBSTR(B.DEPTCODE,1,2) DEPTCODE,A.ORGNUM,                         '+
            '                      NVL(SUM(A.PDIR71 + A.PEMPTOT),0) 현원,                             '+
            '                      SUM(A.PDIRSUM - A.PDIR71 - A.PDIR72)  상무이상 ,                   '+
            '                      SUM(A.PDIR71 + A.PDIR72) 상무보 ,                                  '+
            '                      SUM(A.PDIRSUM) 임원소계,                                           '+
            '                      SUM(A.P10) 부장 ,                                                  '+
            '                      SUM(A.P20) 차장 ,                                                  '+
            '                      SUM(A.P22) 과장,                                                   '+
            '                      SUM(A.P32) 대리 ,                                                  '+
            '                      SUM(A.P40 + A.P42 + A.P44)  사원,                                  '+
            '                      SUM(A.PSPESUM) 특정,                                               '+
            '                      SUM(A.PEMPTOT) 정규직계,                                           '+
            '                      SUM(PSCONSUM) 전계,                                                '+
            '                      SUM(A.PCONTSUM) 계약,                                              '+
            '                      SUM(PIMSITOT) 일반,                                                '+
            '                      SUM(PSCONSUM) + SUM(A.PCONTSUM) +  SUM(PIMSITOT) 계약계,           '+
            '                      SUM(PTOTAL) 총계                                                   '+
            '                 FROM PIHTOPO A, PYCDEPT B                                               '+
            '                WHERE A.ORGNUM = B.ORGNUM                                                '+
            '                  AND A.DEPTCODE = B.DEPTCODE                                            '+
            '                  AND A.TOPOYM = '''+ME_WorkDate.Text+'''                                '+
            '                  AND A.TPGUBUN =''10''                                                  '+
            '                  AND A.DEPTLEVEL  > ''A0''                                              '+
            '                GROUP BY A.ORGNUM,SUBSTR(B.DEPTCODE,1,2)                                 '+
            '                UNION                                                                    '+
            '               SELECT SUBSTR(B.DEPTCODE,1,3) DEPTCODE,A.ORGNUM,                          '+
            '                      NVL(SUM(A.PDIR71 + A.PEMPTOT),0) 현원,                             '+
            '                      SUM(A.PDIRSUM - A.PDIR71 - A.PDIR72)  상무이상 ,                   '+
            '                      SUM(A.PDIR71 + A.PDIR72) 상무보 ,                                  '+
            '                      SUM(A.PDIRSUM) 임원소계,                                           '+
            '                      SUM(A.P10) 부장 ,                                                  '+
            '                      SUM(A.P20) 차장 ,                                                  '+
            '                      SUM(A.P22) 과장,                                                   '+
            '                      SUM(A.P32) 대리 ,                                                  '+
            '                      SUM(A.P40 + A.P42 + A.P44)  사원,                                  '+
            '                      SUM(A.PSPESUM) 특정,                                               '+
            '                      SUM(A.PEMPTOT) 정규직계,                                           '+
            '                      SUM(PSCONSUM) 전계,                                                '+
            '                      SUM(A.PCONTSUM) 계약,                                              '+
            '                      SUM(PIMSITOT) 일반,                                                '+
            '                      SUM(PSCONSUM) + SUM(A.PCONTSUM) +  SUM(PIMSITOT) 계약계,           '+
            '                      SUM(PTOTAL) 총계                                                   '+
            '                 FROM PIHTOPO A, PYCDEPT B                                               '+
            '                WHERE A.ORGNUM = B.ORGNUM                                                '+
            '                  AND A.DEPTCODE = B.DEPTCODE                                            '+
            '                  AND A.TOPOYM = '''+ME_WorkDate.Text+'''                                '+
            '                  AND A.TPGUBUN =''10''                                                  '+
            '                  AND A.DEPTLEVEL  > ''B0''                                              '+
            '                GROUP BY A.ORGNUM,SUBSTR(B.DEPTCODE,1,3)                                 '+
            '                UNION                                                                    '+
            '               SELECT SUBSTR(B.DEPTCODE,1,5) DEPTCODE,A.ORGNUM,                          '+
            '                      NVL(SUM(A.PDIR71 + A.PEMPTOT),0) 현원,                             '+
            '                      SUM(A.PDIRSUM - A.PDIR71 - A.PDIR72)  상무이상 ,                   '+
            '                      SUM(A.PDIR71 + A.PDIR72) 상무보 ,                                  '+
            '                      SUM(A.PDIRSUM) 임원소계,                                           '+
            '                      SUM(A.P10) 부장 ,                                                  '+
            '                      SUM(A.P20) 차장 ,                                                  '+
            '                      SUM(A.P22) 과장,                                                   '+
            '                      SUM(A.P32) 대리 ,                                                  '+
            '                      SUM(A.P40 + A.P42 + A.P44)  사원,                                  '+
            '                      SUM(A.PSPESUM) 특정,                                               '+
            '                      SUM(A.PEMPTOT) 정규직계,                                           '+
            '                      SUM(PSCONSUM) 전계,                                                '+
            '                      SUM(A.PCONTSUM) 계약,                                              '+
            '                      SUM(PIMSITOT) 일반,                                                '+
            '                      SUM(PSCONSUM) + SUM(A.PCONTSUM) +  SUM(PIMSITOT) 계약계,           '+
            '                      SUM(PTOTAL) 총계                                                   '+
            '                 FROM PIHTOPO A, PYCDEPT B                                               '+
            '                WHERE A.ORGNUM = B.ORGNUM                                                '+
            '                  AND A.DEPTCODE = B.DEPTCODE                                            '+
            '                  AND A.TOPOYM = '''+ME_WorkDate.Text+'''                                '+
            '                  AND A.TPGUBUN =''10''                                                  '+
            '                  AND A.DEPTLEVEL  > ''C0''                                              '+
            '                GROUP BY A.ORGNUM,SUBSTR(B.DEPTCODE,1,5)                                 '+
            '               ) XX, PYCDEPT YY                                                          '+
            '          WHERE XX.ORGNUM = YY.ORGNUM                                                    '+
            '            AND RPAD(XX.DEPTCODE,5,''0'') = YY.DEPTCODE                                  '+
            '            AND YY.SECTCODE = '''+f_SECTCODE+'''                                         ');  // 부문담당자의 부문자료만 출력(2012.07.18 HeeYong)

        if  Copy(rStr, 1, 6) = ME_WorkDate.text then       //20070511 서혜미 추가 시작
        begin
            SQL.Add('  AND YY.CLOSEDATE IS NULL                                                       '+
                    '          ORDER BY YY.SECTCODE, YY.DEPTORDER )  ZZ ');
        end
        else
        begin
            SQL.Add('  ORDER BY YY.SECTCODE, YY.DEPTORDER)  ZZ        '); //과거조직보기 위해 2007.03.17 서혜미
        end;
    Open;
    if Eof then
    begin
      MessageDlg('출력할  데이터가 없습니다.'+#13+#10+'', mtError, [mbOK], 0);
      System.Exit;
    end;
  end;
end;

function TMainForm.DeptNameFind : string;
begin
  Qbondept.close;
  Qbondept.Open;
  if Qbondept.RecordCount < 1 then
    DeptNameFind := Qbondept.ParamByName('P_deptcode').AsString
  else
  begin
    if Qbondept.FieldByName('DEPTNA3').AsString <> '' then
      DeptNameFind := Qbondept.FieldByName('DEPTNA3').AsString
    else if Qbondept.FieldByName('DEPTNA2').AsString <> '' then
      DeptNameFind := Qbondept.FieldByName('DEPTNA2').AsString
    else if Qbondept.FieldByName('DEPTNA1').AsString <> '' then
      DeptNameFind := Qbondept.FieldByName('DEPTNA1').AsString
    else
      DeptNameFind := Qbondept.FieldByName('DEPTNAME').AsString;
  end;

  DeptLevel  := Qbondept.FieldByName('DEPTLEVEL').AsString;
  fincode    := Qbondept.FieldByName('fincode').AsString;

  detcode   := Qbondept.ParamByName('p_deptcode').AsString;  //2001.09.27 shm 추가
  Qbondept.Close;
end;

procedure TMainForm.BB_SetUpClick(Sender: TObject);
begin
  PrinterSetup.Execute;
end;




end.



