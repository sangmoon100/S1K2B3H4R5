////////////////////////////////////////////////////////////////////////////////
// 프로그램명 : - STOCK OPTION 개인별 행사현황 및 신청 : PSC1080A
// 개발자     : 강 륜 종
// 개발일자   : 2008.02.14.   
////////////////////////////////////////////////////////////////////////////////

unit psc10801;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ComCtrls, Db, Tmax_DataSetText,
  OnEditBaseCtrl, OnEditStdCtrl, OnEditNumCtl, Grids, DBGrids, OnGrDBGrid,
  OnLineLabel, OnInsaCommon, OnEditBtnCtrl, OnTmaxPersonEdit, OnDBGrid, OnEditMemo,
  OnScheme, OnShapeLabel, OnFocusButton, Tmax_session,
  OnPopupEdit, TmaxFunc, Func;

type
  TFM_Main = class(TForm)
    Panel_Body: TPanel;
    SF_Main: TOnSchemeForm;
    OnShapeLabel2: TOnShapeLabel;
    StatusBar1: TStatusBar;
    TMaxDataSet0: TTMaxDataSet;
    TMaxSession: TTMaxSession;
    ED_EmpNo: TTMaxPersonPopupEdit;
    P_paycl: TOnEdit;
    P_pstate: TOnEdit;
    P_telno: TOnEdit;
    P_RETCONT: TOnEdit;
    P_email: TOnEdit;
    TDS_dml1: TTMaxDataSet;
    OnShapeLabel1: TOnShapeLabel;
    DataSource1: TDataSource;
    P_retdate: TOnMaskEdit;
    p_juminid: TOnEdit;
    p_deptname: TOnEdit;
    p_foreign: TOnEdit;
    DbGrid1: TOnDBGrid;
    BB_simul: TOnFocusButton;
    BB_Save: TOnFocusButton;
    BB_Close: TOnFocusButton;
    Label1: TLabel;
    OnDBGrid1: TOnDBGrid;
    TMaxDataSet2: TTMaxDataSet;
    DataSource2: TDataSource;
    E_SQL: TEdit;
    TMaxDataSet1: TTMaxDataSet;
    Label2: TLabel;
    BB_Help: TOnFocusButton;
    HelpMemo1: TMemo;
    L_Info: TLabel;
    p_CountInfo: TPanel;
    B_image0: TOnFocusButton;
    B_image1: TOnFocusButton;
    P_addr: TOnEdit;
    BT_ScnPrint: TOnFocusButton;
    p_Screen: TPanel;
    p_Appdate: TOnEdit;
    p_Stocknum: TOnEdit;
    p_stockamt: TOnNumberEdit;
    p_taxsum: TOnNumberEdit;
    p_saveamt: TOnNumberEdit;
    p_cprice: TOnNumberEdit;
    P_Account: TOnMaskEdit;
    P_Appcnt: TOnNumberEdit;
    p_sum: TOnNumberEdit;
    OnShapeLabel3: TOnShapeLabel;
    procedure BB_CloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BB_SaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BB_HelpClick(Sender: TObject);
    procedure ED_EmpNoKeyPress(Sender: TObject; var Key: Char);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure BB_simulClick(Sender: TObject);
    Procedure Get_TaxRate( InValue : Real; var A : Integer; var B : Real );
    Procedure Get_Taxlevel;
    Function  Input_Check : Boolean;
    procedure DataSource2DataChange(Sender: TObject; Field: TField);
    procedure B_image0Click(Sender: TObject);
    procedure P_AppcntKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DbGrid1CellClick(Sender: TObject; const ACell: TOnJCell);
    procedure BT_ScnPrintClick(Sender: TObject);
  private
    { Private declarations }
    sEmpno    : String;
    sGrade    : String;
    ParamSQL  : String;
    vSysDate  : String;
    vTaxlevel : Double;
    vTaxpayto : Double;
    vNewTaxRate : Integer;
    vOldTaxrate : Integer;
    vIntax    : Double;
    vJutax    : Double;
    vSeq      : String;
    vStocknum : String;
    vSubnum   : String;
    vFinalCnt : Integer;
    vMessage  : String;
    vPstate   : String;
  public
    { Public declarations }
    vSelect  : Integer;
    procedure TMaxDataSet0Init;
    procedure PL_Select_Data;
    procedure RetrieveData;
    Function  ImageFind(v_empno : String; v_seq : Integer; v_gubun : String) : Integer;

  end;

var
  FM_Main: TFM_Main;

implementation

{$R *.DFM}

uses
  StockXMLUnit, PSC10802;

procedure TFM_Main.BB_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFM_Main.FormCreate(Sender: TObject);
begin
  Self.OnPaint := Nil;
  Application.ProcessMessages;
  SF_Main.Refresh;
  StatusBar1.Panels[1].Text := '종합인사 시스템에 접속 중입니다...';

  TMaxSession.EnvFileName := GetHomeDir+'\newhana.env';   //ShowMessage(GetHomeDir);
  TMaxSession.LabelName   := 'HANAROHPER';
  TMaxSession.Connect     := False;
  TMaxSession.Host        := Hinsa_Param(cmdline,10); //'12.4.13.90';
  TMaxSession.Port        := '9999';

  try
    TMaxSession.Connect := True;
  except
    Application.MessageBox(PChar('APP서버 접속 실패'),'에러',mb_ok);
    Application.Terminate;
    Exit;
  end;

  //2013.11. Add 파라미터와 비교하여 암호 다르면 접속 막음.
  FM_Tmax := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := TMaxSession;
  if FM_Tmax.PassWordChk(Hinsa_Param(cmdline,1), Hinsa_Param(cmdline,3)) = 0 then
    Application.Terminate;

  BT_ScnPrint.Visible := False;
end;

procedure TFM_Main.FormShow(Sender: TObject);
begin
  sEmpno := HInsa_Param(cmdline,1);
  sGrade := HInsa_Param(cmdline,3);

  StatusBar1.Panels[1].Text := '초기자료를 설정하고 있습니다. 잠시만 기다려 주십시요..';

  FM_Tmax           := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := TMaxSession;
  vSysDate          := FM_Tmax.GetData('sysdate','','');
  p_Appdate.Text    := Hinsa_DisplayDate(vSysDate,'-');

  ED_empno.Text  := sEmpno;
  ED_EmpNo.PL_get_singledata;

  PL_Select_Data;

  RetrieveData;

  ///////////////////////////////////////////////////////////////////////////
  TMaxDataSet0Init;
  with TMaxDataSet0 do
  begin
       Sql.Text := 'SELECT groupid, ''field2'', ''field3'', ''field4'',''field5'' '+
                   '  FROM pymenuuser                                             '+
                   ' where empno = '''+ sEmpno +'''                               ';
       //Open;

       //스톡옵션 업무 변경에 따른 종합인사 권한 변경 요청에 의한 변경.    SR-08-13285  2008.07.14.
       // 2096 P413 이 각각 맡은 업무그룹이 따로 있어 사번을 하드코딩함.
       //if  (FieldByName('field1').AsString = 'G204') or (Copy(sEmpno,1,1) = 'D') then //스톡옵션 행사 관리자....
       if  (sEmpno = '0891') or (Copy(sEmpno,1,1) = 'D') then //스톡옵션 행사 관리자....
       begin
            ED_empno.Enabled    := True;
            L_Info.Visible      := True;
            BT_ScnPrint.Visible := True;
            ED_EmpNo.SetFocus;
       end
       else
       begin
            Close;
            Sql.Clear;
            Sql.Text := 'select ''field1'', ''field2'', ''field3'', ''field4'',''field5''          '+
                        '  FROM pstockdet a                                                        '+
                        ' where (stocknum,detdate) = (select stocknum, max(detdate) from pstockdet '+
                        '                              where a.stocknum = stocknum                 '+
                        '			         and a.subnum   = subnum                   '+
                        '			         and a.empno    = empno                    '+
                        '			       group by stocknum   )                       '+
                        '   and owstcnt  > 0                                                       '+
                        '   and empno = '''+ sEmpno +'''                                           ';
            Open;

            if (TMaxDataSet0.RecordCount = 0) then
            begin
                 ShowMessage('귀하는 스톡옵션 잔여수량이 없어 신청권한이 없습니다. 프로그램을 종료합니다.');
                 FM_Main.Close;
            end;

            P_Account.SetFocus;
       end;
  end;
//  if  (Copy(sEmpno,1,1) = 'D') then E_SQL.Visible := True;
  
  StatusBar1.Panels[1].Text := ED_empno.korname + '님의 자료가 조회 되었습니다.';     
end;

//연세율 구하기...    //////////////////////////////////////////////////////////////
Procedure TFM_Main.Get_TaxRate( InValue : Real;  var A : Integer;  var B : Real );
begin
  TMaxDataSet0Init;
  with TMaxDataSet0 do
  begin
       Sql.Text := 'SELECT Taxrate, Yearded, ''field3'', ''field4'',''field5'' '+
                   '  FROM pkcptax                                             '+
                   ' where taxpayfr <= '''+ FloatTostr(InValue) +'''           '+
                   '   and taxpayto >  '''+ FloatTostr(InValue) +'''           '+
                   '   and taxnum = (select ctaxnum from pkcpbas)              ';
       Open;

       A := FieldByName('field1').AsInteger;
       B := FieldByName('field2').AsFloat;
  end;
end;

//전년도 과세표준 구하기...////////////////////////////////////
Procedure TFM_Main.Get_Taxlevel;
begin
  vTaxlevel   := 0;
  vTaxpayto   := 0; 
  vOldTaxrate := 0; 

  TMaxDataSet0Init;
  with TMaxDataSet0 do
  begin
       Sql.Text := 'SELECT Taxlevel,  Taxpayto,  Taxrate,   ''field4'',''field5'' '+
                   '  FROM pkcptax a,                                             '+
                   '       (select empno, Taxlevel                                '+
                   '          from pkhyshis c                                     '+
                   '         where workyy = to_char(sysdate-366,''yyyy'')         '+
                   '           and empno  = '''+ ED_EmpNo.empno +'''    ) b       '+
                   ' where taxpayfr <= b.taxlevel and taxpayto >  b.taxlevel      '+
                   '   and taxnum = (select ctaxnum from pkcpbas)                 ';
       Open;

       if  TMaxDataSet0.RecordCount > 0 then
       begin
            vTaxlevel   := FieldByName('field1').AsFloat;
            vTaxpayto   := FieldByName('field2').AsFloat;
            vOldTaxrate := FieldByName('field3').AsInteger;
       end;
       Close;
  end;
end;

Function TFM_Main.Input_Check;
begin
  Result := True;

  if p_appcnt.Value > vFinalCnt then
  begin
       ShowMessage('잔고수량보다 많은 행사수량을 입력하셨습니다. 수정후 재 신청 하시기 바랍니다.');
       Result := False;
  end;

  if p_appcnt.Value = 0 then
  begin
       ShowMessage('행사수량을 입력하시기 바랍니다.');
       Result := False;
  end;

  TMaxDataSet0Init;
  with TMaxDataSet0 do
  begin
       Sql.Text := 'SELECT substr(replace(savedate,''.'',''''), 1,8) frdate, '+
                   '       substr(replace(savedate,''.'',''''),10,8) todate, '+
                   '       ''field3'', ''field4'',''field5''                 '+
                   '  FROM pstockmas                                         '+
                   ' where to_char(sysdate,''yyyymmdd'')                     '+
                   '       between substr(replace(savedate,''.'',''''), 1,8) '+
                   '       and     substr(replace(savedate,''.'',''''),10,8) '+
                   '   and stocknum = '''+ vStocknum +'''                    '+
                   '   and subnum   = '''+ vSubnum   +'''                    ';
       Open;

       if TMaxDataSet0.RecordCount <= 0 then
       begin
            ShowMessage('행사 가능 기간이 아닙니다. 확인 바랍니다.');
            Result := False;
       end;
       Close;
  end;
end;

procedure TFM_Main.TMaxDataSet0Init;
begin
  with TMaxDataSet0 do
  begin
       ClearFieldInfo;
       AddField('field1' , ftString, 100);
       AddField('field2' , ftString, 100);
       AddField('field3' , ftString, 100);
       AddField('field4' , ftString, 100);
       AddField('field5' , ftString, 100);
       ServiceName := 'HINSA_select';
       Close;
       Sql.Clear;
  end;      
end;

procedure TFM_Main.PL_Select_Data;
begin                       // showmessage(TMaxSession.Host);
  with TMaxDataSet0 do
  begin                                   //서비스사용 프로그램 : PSC1040C PSC1080A PSC1090A
       ServiceName := 'PSC1040C_sel1';    //server Name : htmax_ps11.
       Close;
       Sql.Clear;
       Sql.Text := Format( 'select empno,         '+
                           '       korname,       '+
                           '       paycl,         '+
                           '       pstate,        '+
                           '       telno,         '+
                           '       retcont,       '+
                           '       e_mail,        '+
                           '       empdate,       '+
                           '       retdate,       '+
                           '       curaddr,       '+
                           '       zipno,         '+
                           '       deptname,      '+
                           '       juminid        '+
                           '  from v_pstockinsa   '+
                           ' where empno = ''%s'' ',[ED_EmpNo.empno]);
       ClearFieldInfo;
       AddField('EMPNO'  , ftString,  4);
       AddField('KORNAME', ftString, 12);
       AddField('PAYCL'  , ftString, 20);
       AddField('PSTATE' , ftString, 20);
       AddField('TELNO'  , ftString, 15);
       AddField('RETCONT', ftString, 40);
       AddField('E_MAIL' , ftString, 60);
       AddField('EMPDATE', ftString,  8);
       AddField('RETDATE', ftString,  8);
       AddField('CURADDR', ftString, 80);
       AddField('ZIPNO'  , ftString,  7);
       AddField('DEPTNAME',ftString, 60);
       AddField('JUMINID', ftString, 14);   E_SQL.text := sql.text;
       open;

       if (RecordCount <= 0) and (Copy(sEmpno,1,1) <> 'D') then
       begin
            MessageDlg('귀하는 인사내역이 없습니다. 확인바랍니다.', mtInformation, [mbok], 0) ;
            System.Exit;
       end;

       Hinsa_FieldDisplay(Self,TMaxDataSet0,4,11);
       ED_EmpNo.Text  := FieldByName('EMPNO').AsString+ ' - ' +FieldByName('Korname').AsString;
       P_paycl.Text   := FieldByName('PAYCL').AsString;
       P_pstate.Text  := FieldByName('PSTATE').AsString;
       P_deptname.Text:= FieldByName('DEPTNAME').AsString;
       P_retdate.Text := Hinsa_DisplayDate(FieldByName('retdate').AsString,'-');
       P_juminid.Text := FieldByName('JUMINID').AsString;
       P_telno.Text   := FieldByName('TELNO').AsString;
       P_retcont.Text := FieldByName('RETCONT').AsString;
       P_email.Text   := FieldByName('E_MAIL').AsString;
       P_addr.Text    := FieldByName('CURADDR').AsString;

       if (Copy(P_juminid.Text,8,1) = '1') or (Copy(P_juminid.Text,8,1) = '2') then  p_foreign.Text := '내국인';
       if (Copy(P_juminid.Text,8,1) = '5') or (Copy(P_juminid.Text,8,1) = '6') then  p_foreign.Text := '외국인';          
       TMaxDataSet0.Close;

       //////////////////////////////////////////////////////////////////////
       ServiceName := 'HINSA_select';
       Close;
       Sql.Clear;
       Sql.Text := 'SELECT 1, ''field2'', ''field3'', ''field4'',''field5'' '+
                   '  FROM pimpmas                                          '+
                   ' where pstate < ''80''                                  '+
                   '   and empno  = '''+ ED_EmpNo.empno +'''                ';

       ClearFieldInfo;
       AddField('field1' , ftString, 100);
       AddField('field2' , ftString, 100);
       AddField('field3' , ftString, 100);
       AddField('field4' , ftString, 100);
       AddField('field5' , ftString, 100);
       Open;

       if   TMaxDataSet0.RecordCount = 0 then vPstate := '퇴직'
       else                                   vPstate := '재직';
  end;
end;

procedure TFM_Main.RetrieveData;
begin
  vStocknum := '';
  vSubnum   := '';
  Application.ProcessMessages;
  TMaxDataSet1.Close;
  ParamSQL := 'select x.stocknum, x.subnum,                         '+#13+
              '       x.givedate,                                   '+#13+
              '       x.saveamt,  x.savedate,                       '+#13+
              '       x.savemark, x.saveterm,                       '+#13+
              '       x.stcnt,                                      '+#13+
              '       x.stcnt - nvl(y.appcnt,0) cnt                 '+#13+
              '  from (select distinct a.stocknum     ,             '+#13+
              '               a.subnum                ,             '+#13+
              '               a.givedate              ,             '+#13+
              '               sum(b.stcnt) stcnt      ,             '+#13+
              '               a.saveamt               ,             '+#13+
              '               a.savedate              ,             '+#13+
              '               a.savemark              ,             '+#13+
              '               a.saveterm              ,             '+#13+
              '               empno                                 '+#13+
              '          from pstockmas a, pstockdet b              '+#13+
              '         where a.stocknum = b.stocknum               '+#13+
              '           and a.subnum   = b.subnum                 '+#13+
              '         group by a.stocknum, a.subnum,              '+#13+
              '                  a.givedate,                        '+#13+
              '                  a.saveamt,  a.savedate,            '+#13+
              '                  a.savemark, a.saveterm, empno ) x, '+#13+
              '       (select stocknum,   subnum,   empno,          '+#13+
              '               sum(appcnt) appcnt                    '+#13+
              '          from pstockapp                             '+#13+
              '		 where flowstate <> ''F''              '+#13+
              '         group by stocknum, subnum, empno       ) y  '+#13+
              ' where x.stocknum = y.stocknum(+)                    '+#13+
              '   and x.subnum   = y.subnum(+)                      '+#13+
              '   and x.empno    = y.empno(+)                       '+#13+
              '   and x.empno    = ''' +ED_EmpNo.empno + '''        '+
              ' order by stocknum, subnum                           ';

  with TMaxDataSet1 do
  begin
       ServiceName :='PSC1080A_sel2';  //server Name : htmax_ps11.
       Close;
       Sql.Clear;
       Sql.Add(ParamSQL);

       ClearFieldInfo;
       AddField('STOCKNUM', ftString, 2);
       AddField('SUBNUM'  , ftString, 2);
       AddField('GIVEDATE', ftString, 10);
       AddField('SAVEAMT' , ftFloat,  15);
       AddField('SAVEDATE', ftString, 25);
       AddField('SAVEMARK', ftString, 50);
       AddField('SAVETERM', ftString, 100);
       AddField('STCNT'   , ftFloat,  15);
       AddField('FINALCNT', ftFloat,  10);     //E_SQL.Text := sql.Text;
       Open;

       FieldByName('STOCKNUM').Alignment := taCenter;
       FieldByName('GIVEDATE').Alignment := taCenter;
       FieldByName('SAVEDATE').Alignment := taCenter;
       TFloatField(FieldByName('STCNT')).DisplayFormat   := '#,##0';
       TFloatField(FieldByName('FINALCNT')).DisplayFormat:= '#,##0';          
       TFloatField(FieldByName('SAVEAMT')).DisplayFormat := '#,##0';
  end;
end;

procedure TFM_Main.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  //초기화....
  p_cprice.Value  := 0;
  p_Stocknum.Text := '';
  p_saveamt.Value := 0;
  p_appcnt.Value  := 0;
  p_stockamt.Value:= 0;
  p_taxsum.Value  := 0;
  p_sum.Value     := 0;

  //////////////////////////////////////////////////////////////////////////////

  p_Stocknum.Text := TMaxDataSet1.FieldByName('STOCKNUM').AsString;
  p_saveamt.Value := TMaxDataSet1.FieldByName('SAVEAMT').AsFloat;
  vFinalCnt       := TMaxDataSet1.FieldByName('FINALCNT').AsInteger;

  vStocknum       := TMaxDataSet1.FieldByName('STOCKNUM').AsString;
  vSubnum         := TMaxDataSet1.FieldByName('SUBNUM').AsString;

  //////////////////////////////////////////////////////////////////////////////

  with TMaxDataSet2 do
  begin
       ParamSQL := 'select a.EMPNO,       SEQ,       a.KORNAME,             '+#13+
                   '       STOCKNUM,      SUBNUM,                           '+#13+
                   '       nvl(APPCNT,0),                                   '+#13+
                   '       nvl(CPRICE,0),                                   '+#13+
                   '       nvl(STOCKAMT,0),                                 '+#13+
                   '       nvl(GAINAMT,0),                                  '+#13+
                   '       nvl((INTAX+JUTAX),0) TAXSUM,                     '+#13+
                   '       Account,                                         '+#13+
                   '       decode(flowstate,''A'',''행사개시신청'',         '+#13+
                   '                        ''B'',''서류확인''    ,         '+#13+
                   '                        ''C'',''주금납입확인'',         '+#13+
                   '                        ''D'',''신청완료''    ,         '+#13+
                   '                        ''E'',''신주교부''    ,         '+#13+
                   '                        ''F'',''원천세납부''  ,         '+#13+
                   '                        ''Z'',''행사철회'' ) FLOWSTATE, '+#13+
                   '       APPEMP,     substr(APPDATE,1,8) APPDATE,         '+#13+
                   '       CONEMP,     CONDATE,                             '+#13+
                   '       PAYEMP,     PAYDATE,                             '+#13+
                   '       FixEMP,     FixDATE,                             '+#13+
                   '       GrantEMP,   GrantDATE,                           '+#13+
                   '       TaxEMP,     TaxDATE,                             '+#13+
                   '       CancelEMP,  CancelDATE,                          '+#13+
                   '       Decode(PAYDATE,'''',''N'',''Y'')         PAYYN,  '+#13+
                   '       decode(b.retdate,'''',''재직'',''퇴직'') RETYN   '+#13+
                   '  from pstockapp A, pimpmas B                           '+#13+
                   ' where A.empno = B.empno                                '+#13+
                   '   and flowstate <> ''F''                               '+#13+
                   '   and Stocknum = '''+ vStocknum      + '''             '+#13+
                   '   and Subnum   = '''+ vSubnum        + '''             '+#13+
                   '   and a.empno  = '''+ ED_EmpNo.empno + '''             '+#13+
                   ' order by appdate, seq                                  ';

       ServiceName :='PSC1080A_sel1';
       Close;
       Sql.Clear;
       Sql.Add(ParamSQL);

       ClearFieldInfo;
       AddField('EMPNO'     , ftString,  4);
       AddField('SEQ'       , ftInteger, 2);
       AddField('KORNAME'   , ftString, 12);
       AddField('STOCKNUM'  , ftString,  2);
       AddField('SUBNUM'    , ftString,  2);
       AddField('APPCNT'    , ftFloat,  10);
       AddField('CPRICE'    , ftFloat,   7);
       AddField('STOCKAMT'  , ftFloat,  10);
       AddField('GAINAMT'   , ftFloat,  10);
       AddField('TAXSUM'    , ftFloat,   9);
       AddField('ACCOUNT'   , ftString, 11);
       AddField('FLOWSTATE' , ftString, 15);
       AddField('APPEMP'    , ftString,  4);
       AddField('APPDATE'   , ftString, 15);
       AddField('CONEMP'    , ftString,  4);
       AddField('CONDATE'   , ftString, 15);
       AddField('PAYEMP'    , ftString,  4);
       AddField('PAYDATE'   , ftString, 15);
       AddField('FIXEMP'    , ftString,  4);
       AddField('FIXDATE'   , ftString, 15);
       AddField('GRANTEMP'  , ftString,  4);
       AddField('GRANTDATE' , ftString, 15);
       AddField('TAXEMP'    , ftString,  4);
       AddField('TAXDATE'   , ftString, 15);
       AddField('CancelEMP' , ftString,  4);
       AddField('CancelDATE', ftString, 15);
       AddField('PAYEND'    , ftString,  1);
       AddField('RETYN'     , ftString,  4);  //E_SQL.Text := sql.Text;
       Open;

       p_CountInfo.Visible := False;
       B_image0.Enabled    := True;
       B_image1.Enabled    := True;
       if TMaxDataSet2.RecordCount <= 0 then
       begin
            p_CountInfo.Visible := True;  //ShowMessage('신청내역이 없습니다');
            B_image0.Enabled    := False;
            B_image1.Enabled    := False;
            System.Exit;
       end;

       TFloatField(FieldByName('APPCNT')).DisplayFormat   := '#,##0';
       TFloatField(FieldByName('CPRICE')).DisplayFormat   := '#,##0';
       TFloatField(FieldByName('STOCKAMT')).DisplayFormat := '#,##0';
       TFloatField(FieldByName('TAXSUM')).DisplayFormat   := '#,##0';
  end;

  P_Account.SetFocus;
end;

procedure TFM_Main.BB_HelpClick(Sender: TObject);
begin
  if   HelpMemo1.Visible then HelpMemo1.Visible := False
  else                        HelpMemo1.Visible := True;
end;

procedure TFM_Main.ED_EmpNoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
       ED_empno.PL_get_singledata;

       PL_Select_Data;

       if vPstate = '재직' then
       begin
            //ShowMessage('재직자에 대해서는 신청 작업할수 없습니다.');
            //BB_Save.Enabled  := False;
            //B_image0.Enabled := False;
            //B_image1.Enabled := False;
            //Exit;
       end;

       RetrieveData;

       StatusBar1.Panels[1].Text := ED_empno.korname + '님의 자료가 조회 되었습니다.';
  end;
end;

procedure TFM_Main.BB_simulClick(Sender: TObject);
var
  AllTaxAmt   : Double;
  StockTaxAmt : Double;
  TaxRate : Real;
  YearDed : Real;
  vEndDate : String;
  vEndPrice, vCurJuka :Integer ;
begin
  if not Input_Check then exit;

  //////하나로텔레콤  종가 구하기 ///////////////////////////////////////////
  StatusBar1.Panels[1].Text := '최종 등록된 하나로텔레콤 종가를 읽어 오고 있습니다.';
  Application.ProcessMessages ;

  /////if not fnGetJuka(vEndDate, vEndPrice, vCurJuka) then Exit; XML 에서 읽어오는 종가 사용 안하기로 함.
  TMaxDataSet0Init;
  with TMaxDataSet0 do
  begin
       Sql.Text := 'SELECT stockdate, cprice, ''field3'', ''field4'',''field5'' '+
                   '  FROM pstockbas                                            '+
                   ' where stockdate = (select max(stockdate) from pstockbas)   ';
       Open;

       p_cprice.Value  := FieldByName('field2').AsInteger;
       TMaxDataSet0.Close;
  end;
  ///////////////////////////////////////////////////////////////////////////

  p_stockamt.Value :=  p_saveamt.Value * p_appcnt.Value;        //주금

  /// 소득세 구하기 =========================================================
  StockTaxAmt      := (p_cprice.Value - p_saveamt.Value) * p_appcnt.Value;

  Get_Taxlevel;                                                 //전년도 과세표준, 과세표준To, 세율 구하기..

  AllTaxAmt        := StockTaxAmt + vTaxlevel;                  //전년도 과세표준 더하여 총과세액 구함....

  Get_TaxRate(AllTaxAmt,  vNewTaxRate,  YearDed);               //총과세액의 연세율 구하기

  //: 과세 등급 변동이 되면 차등과세... (//임원 36% 단일과세 / 재직원 전년과세 합산 계산
  if   Copy(ED_EmpNo.empno,1,1) = 'M'    then  vIntax := StockTaxAmt * 20 / 100  //임원 36% 단일과세...
  else if   ED_EmpNo.empno      = 'Q017' then  vIntax := StockTaxAmt * 20 / 100  //임원 36% 단일과세...
  else
  begin //재직 사원
       if   vOldTaxrate = vNewTaxRate then  vIntax := StockTaxAmt * vOldTaxrate / 100
       else                                 vIntax := (AllTaxamt - vTaxpayto) * vNewTaxRate / 100 +
                                                      (vTaxpayto - vTaxlevel) * vOldTaxrate / 100 ;
  end;

  if  vPstate = '퇴직' then vIntax := StockTaxAmt * 20 / 100; //모든 퇴직자 20% 단일과세...

  if vIntax < 0 then vIntax := 0;

  vIntax := Trunc( vIntax / 10) * 10 ;

  vJutax := Trunc( vIntax * 10 / 100 / 10) * 10 ;

  p_taxsum.Value   := vIntax + vJutax;

  p_sum.Value      := p_stockamt.Value + p_taxsum.Value;

  StatusBar1.Panels[1].Text := '계산 완료.';    //OnNumberEdit1.Value :=  vNewTaxRate;
end;


procedure TFM_Main.BB_SaveClick(Sender: TObject);
begin
  if not Input_Check then exit;

  if length(RemoveChar(p_account.Text,'-')) <> 11 then
  begin
       ShowMessage('증권입고계좌번호(11자리)를 정확히 입력하시기 바랍니다.');
       p_account.SetFocus;
       Exit;
  end;

  TMaxDataSet0Init;
  with TMaxDataSet0 do
  begin
       Sql.Text := 'SELECT 1, ''field2'', ''field3'', ''field4'',''field5''    '+
                   '  FROM pstockapp                                           '+
                   ' WHERE empno    = '''+ ED_EmpNo.empno+'''                  '+
                   '   AND Stocknum = '''+ vStocknum     +'''                  '+
                   '   AND Appdate  like  to_char(sysdate,''yyyymmdd'')||''%'' '+
                   '   AND Flowstate <> ''F''                                  ';
       Open;

       if TMaxDataSet0.RecordCount > 0 then
       begin
            ShowMessage('동일차수에 대하여 하루에 한번만 신청 가능합니다.');
            exit;
       end;
  end;

  ///////////////////////////////////////////////////////////////////////////
  BB_simulClick(nil);
  ///////////////////////////////////////////////////////////////////////////
  
  StatusBar1.Panels[1].Text := '';
  if MessageDlg('현재자료 입력한 행사수량만큼 신청하시겠습니까? '+#13+#13+
                '신청후에는 수정 및 취소 할수 없습니다.', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit;

  TMaxDataSet0Init;
  with TMaxDataSet0 do
  begin
       Sql.Text := 'SELECT nvl(max(seq),0)+1, ''field2'', ''field3'', ''field4'',''field5'' '+
                   '  FROM pstockapp                                                        '+
                   ' WHERE empno    = '''+ ED_EmpNo.empno+'''                               '; //Stocknum = '''+ v_stocknum    +'''                               '+
       Open;

       vSeq := FieldByName('field1').AsString;
  end;

  //////////////////////////////////////////////////////////////////////////////
  ParamSQL := 'insert into pstockapp                     '+#13+
              '( empno,        seq,        korname,      '+#13+
              '  stocknum,     subnum,                   '+#13+
              '  appcnt,       stockamt,                 '+#13+
              '  appemp,       appdate,                  '+#13+
              '  flowstate,    Account  )                '+#13+
              '  values                                  '+
              '( '''+  ED_EmpNo.empno               +''','+
              '  '''+  vSeq                         +''','+
              '  '''+  ED_EmpNo.korname             +''','+
              '  '''+  vStocknum                    +''','+
              '  '''+  vSubnum                      +''','+
              '  '''+  FloatToStr(p_appcnt.value)   +''','+
              '  '''+  FloatToStr(p_stockamt.value) +''','+
              '  '''+  sEmpno                       +''','+
              '  TO_CHAR(SYSDATE,''YYYYMMDDHH24MI'')    ,'+
              '  ''A''                                  ,'+
              '  '''+  P_Account.Text               +''')';

  with TDS_dml1 do
  begin
       ServiceName := 'PSC1040C_dml';
       Close;
       Sql.Clear;
       Sql.Add(ParamSQL);        //E_SQL.text := SQl.text;

       if not TDS_dml1.Execute then
       begin
            ShowMessage('저장중 에러가 발생했습니다.');
            System.Exit;
       end
       else ShowMessage('정상적으로 저장 되었습니다.');
  end;

  Application.ProcessMessages;

  with TMaxDataSet2 do
  begin
       Close;
       Open;
       TFloatField(FieldByName('APPCNT')).DisplayFormat   := '#,##0';
       TFloatField(FieldByName('CPRICE')).DisplayFormat   := '#,##0';
       TFloatField(FieldByName('STOCKAMT')).DisplayFormat := '#,##0';
       TFloatField(FieldByName('TAXSUM')).DisplayFormat   := '#,##0';
  end;

  if   vPstate = '퇴직' then
  begin
       if Length(Trim(P_email.Text)) < 10 then ShowMessage('E-Mail를 확인하여 주시기 바랍니다');
       if Length(Trim(P_addr.Text))  < 10 then ShowMessage('신청자의 주소를 확인하여 주시기 바랍니다');
  end;

  StatusBar1.Panels[1].Text := '신청완료.';
end;

procedure TFM_Main.DataSource2DataChange(Sender: TObject; Field: TField);
begin
     p_Appdate.Text  := '';
     P_Account.Text  := '';
     p_cprice.Value  := 0;
     p_appcnt.Value  := 0;
     p_taxsum.Value  := 0;
     p_sum.Value     := 0;
     //////////////////////////////////////////////////////////////////////////////

     if not TMaxDataSet2.Eof then
     begin
          p_Appdate.Text  := TMaxDataSet2.FieldByName('appdate').AsString;
          p_cprice.Value  := TMaxDataSet2.FieldByName('CPRICE').AsFloat;
          p_Stocknum.Text := TMaxDataSet2.FieldByName('STOCKNUM').AsString;
          p_appcnt.Value  := TMaxDataSet2.FieldByName('APPCNT').AsInteger;
          p_stockamt.Value:= TMaxDataSet2.FieldByName('STOCKAMT').AsFloat;
          p_taxsum.Value  := TMaxDataSet2.FieldByName('TAXSUM').AsFloat;
          p_sum.Value     := p_stockamt.Value + p_taxsum.Value;
          P_Account.Text  := TMaxDataSet2.FieldByName('Account').AsString;
     end;
end;

Function TFM_Main.ImageFind(v_empno : String; v_seq : Integer; v_gubun : String) : Integer;
begin
  Result := 0;
  TMaxDataSet0Init;
  with TMaxDataSet0 do
  begin
       Sql.Text := 'SELECT count(*), ''field2'', ''field3'', ''field4'',''field5'' '+
                   '  FROM Pstock_image                                            '+
                   ' WHERE empno    = '''+ v_empno +'''                            '+
                   '   and seq      = '''+FloatToStr(v_seq) +'''                   '+
                   '   and gubun    = '''+ v_gubun +'''                            ';
       Open;

       Result := StrToInt(FieldByName('field1').AsString);
  end;
end;

procedure TFM_Main.B_image0Click(Sender: TObject);
begin
  vMessage := '';
  if      TComponent(Sender).Tag = 0 then vMessage := ' 주민등록증 '
  else if TComponent(Sender).Tag = 1 then vMessage := ' 스톡옵션행사신청서 ';

  vSelect := 0;

  if TMaxDataSet2.RecordCount <= 0 then
  begin
       ShowMessage('스톡옵션 행사 신청한 내역을 클릭후 작업을 진행하시기 바랍니다.');
       Exit;
  end;

  if ImageFind(TMaxDataSet2.FieldByName('empno'   ).AsString,
               TMaxDataSet2.FieldByName('seq'     ).AsInteger,
               IntToStr(TComponent(Sender).Tag)               ) > 0 then
  begin
       if MessageDlg( vMessage + ' 서류가 이미 등록되어있습니다. '+#13+#13+
                     '다시 등록하시겠습니까?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit
       else vSelect := 1;
  end;

  FmImageSave := TFmImageSave.Create(Application);
  try
       FmImageSave.Caption := '[' + vMessage + ' 저장]';
       FmImageSave.CbGubun.ItemIndex := TComponent(Sender).Tag;
       FmImageSave.ShowModal;
  finally
       FmImageSave.Free;
  end;
end;

procedure TFM_Main.P_AppcntKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) or (key = vk_tab) then BB_simulClick(nil);
end;

procedure TFM_Main.DbGrid1CellClick(Sender: TObject;
  const ACell: TOnJCell);
begin
  P_Account.SetFocus;
end;

procedure TFM_Main.BT_ScnPrintClick(Sender: TObject);
begin
  L_Info.Visible      := False;
  BT_ScnPrint.Visible := False;
  p_Screen.Visible    := False;

  FM_Main.PrintScale := poPrintToFit;
  FM_Main.Print;

  L_Info.Visible      := True;
  BT_ScnPrint.Visible := True;
  p_Screen.Visible    := True;
end;

end.
