unit pic40701;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Gauges, ExtCtrls, pass, datelib, quickrpt, Db,
  pegradpanl, ComCtrls, Mask, pebtnedit, peextcombo, peoutlookbtn,
  pedeptbtnedit, pecodebtnedit, DBTables, OnFocusButton, OnEditBaseCtrl,
  OnEditStdCtrl, OnEditBtnCtrl, OnEditCombo, MemDS, DBAccess, Ora, Func,
  OnRadioBtn;

type
  TAData = Array[1..80] of String;

  TMainForm = class(TForm)
    Panel1: TPanel;
    Panel9: TPanel;
    Panel5: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    PeJeonGrdPanel2: TPeJeonGrdPanel;
    hp: TStatusBar;
    LPPrint: TPeJeonOutLookBtn;
    Bt_Prn: TPeJeonOutLookBtn;
    PeJeonOutLookBtn1: TPeJeonOutLookBtn;
    Bt_Exit: TPeJeonOutLookBtn;
    Panel7: TPanel;
    E_rabasdate: TMaskEdit;
    Panel2: TPanel;
    RbJobgun1: TRadioButton;
    RbJobgun2: TRadioButton;
    RbJobgun3: TRadioButton;
    RbJobgun4: TRadioButton;
    Panel6: TPanel;
    Panel10: TPanel;
    ChkSawon: TCheckBox;
    PPE_rabasyear: TPePanelEdit;
    RbJobgun5: TRadioButton;
    Panel8: TPanel;
    ChkBujang: TCheckBox;
    Panel3: TPanel;
    Gubun_1: TRadioButton;
    Gubun_2: TRadioButton;
    Panel4: TPanel;
    RbJobgun6: TRadioButton;
    FileOpenDlg: TOpenDialog;
    Chk_Choice: TCheckBox;
    Chk_ChoiceAll: TCheckBox;
    BT_Grade: TOnFocusButton;
    BT_Choice: TOnFocusButton;
    Panel11: TPanel;
    Edit1: TEdit;
    Chk_Silgrade: TCheckBox;
    Panel14: TPanel;
    CB_Bumun: TOnComboEdit;
    OraQuery1: TOraQuery;
    Ora_Picture: TOraQuery;
    Query_KS: TOraQuery;
    Query_KSgrade00: TStringField;
    Query_KSgrade01: TStringField;
    Query_KSgrade02: TStringField;
    Query_KSgrade03: TStringField;
    Query_KSgrade04: TStringField;
    Query_KSSNO: TFloatField;
    Query_KSRANK: TFloatField;
    Query_KSCNT: TFloatField;
    Query_KSRRATE: TStringField;
    Query_KSEMPNO: TStringField;
    Query_KSJOBGUN: TStringField;
    Query_KSJOBGUNNAME: TStringField;
    Query_KSPAYCL: TStringField;
    Query_KSPAYCLNAME: TStringField;
    Query_KSDEPTNAME: TStringField;
    Query_KSDEPTNA3: TStringField;
    Query_KSKORNAME: TStringField;
    Query_KSAGE: TStringField;
    Query_KSSEX: TStringField;
    Query_KSLSCHGR: TStringField;
    Query_KSLSCHGR_1: TStringField;
    Query_KSLSCHNM: TStringField;
    Query_KSLMAJORCODE: TStringField;
    Query_KSUNICODE: TStringField;
    Query_KSUNIMAJOR: TStringField;
    Query_KSEMPDATE: TStringField;
    Query_KSEMPCODE: TStringField;
    Query_KSEMPPAYCL: TStringField;
    Query_KSPAYCLDATE: TStringField;
    Query_KSCPAYCLDATE: TStringField;
    Query_KSPAYCLYYMM: TStringField;
    Query_KSTOTSCR: TFloatField;
    Query_KSPAYCLSCR: TFloatField;
    Query_KSTOTPAYSCR: TFloatField;
    Query_KSQPAYCLSCR: TFloatField;
    Query_KSUPPOINT: TFloatField;
    Query_KSSUMPRIZ: TFloatField;
    Query_KSUPPOINT_2YEAR: TFloatField;
    Query_KSPUNISH: TStringField;
    Query_KSEDUCATE: TStringField;
    Query_BCK: TOraQuery;
    Query_BCKgrade00: TStringField;
    Query_BCKgrade01: TStringField;
    Query_BCKgrade02: TStringField;
    Query_BCKgrade03: TStringField;
    Query_BCKgrade04: TStringField;
    Query_BCKEMPNO: TStringField;
    Query_BCKKORNAME: TStringField;
    Query_BCKPAYCL: TStringField;
    Query_BCKCHOICE: TStringField;
    Query_BCKEDUPOINT: TFloatField;
    Query_BCKFINALGRADE: TStringField;
    Query_BCKVALUESGRADE: TStringField;
    Query_BCKABILITYSCRGRADE: TStringField;
    Query_BCKRESULTSCRGRADE: TStringField;
    Query_BCKCHOICEGUBUN: TFloatField;
    Query_BCKBUMUNCNT: TFloatField;
    Query_BCKBUMUNRANK: TFloatField;
    Query_BCKBUMUNRATE: TStringField;
    Query_BCKVBOIMCNT: TFloatField;
    Query_BCKVBOIMRANK: TFloatField;
    Query_BCKVBIBOIMCNT: TFloatField;
    Query_BCKVBIBOIMRANK: TFloatField;
    Query_BCKAGE: TStringField;
    Query_BCKBOIMCNT: TFloatField;
    Query_BCKBOIMRANK: TFloatField;
    Query_BCKRANK: TFloatField;
    Query_BCKSNO: TFloatField;
    Query_BCKCNT: TFloatField;
    Query_BCKRRATE: TStringField;
    Query_BCKCRATE: TFloatField;
    Query_BCKSHIFTYN: TStringField;
    Query_BCKJOBGUN: TStringField;
    Query_BCKJOBGUNNAME: TStringField;
    Query_BCKPAYCLNAME: TStringField;
    Query_BCKBUNDEPTNAME: TStringField;
    Query_BCKDEPTNAME: TStringField;
    Query_BCKDEPTNA3: TStringField;
    Query_BCKPAYRANAME: TStringField;
    Query_BCKLSCHGRNAME: TStringField;
    Query_BCKLMAJORCODE: TStringField;
    Query_BCKUNICODENAME: TStringField;
    Query_BCKUNIMAJORNAME: TStringField;
    Query_BCKUNIGRYM: TStringField;
    Query_BCKLSCHNM: TStringField;
    Query_BCKLSCHGRYM: TStringField;
    Query_BCKEMPDATE: TStringField;
    Query_BCKEMPCODE: TStringField;
    Query_BCKPAYCLDATE: TStringField;
    Query_BCKCPAYCLDATE: TStringField;
    Query_BCKPAYCLYYMM: TStringField;
    Query_BCKTOTSCR: TFloatField;
    Query_BCKPAYCLSCR: TFloatField;
    Query_BCKQPAYCLSCR: TFloatField;
    Query_BCKTOTPAYSCR: TFloatField;
    Query_BCKUPPOINT: TFloatField;
    Query_BCKSUMPRIZ: TFloatField;
    Query_BCKUPPOINT_2YEAR: TFloatField;
    Query_BCKPUNISH: TStringField;
    Query_BCKEDUCATE: TStringField;
    Panel15: TPanel;
    Chk_BoimBiboim: TOnRadioButton;
    Chk_Boim: TOnRadioButton;
    Chk_BoimNo: TOnRadioButton;
    ChkChajang: TOnRadioButton;
    ChkKwajang: TOnRadioButton;
    ChkDaeri: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Bt_ExitClick(Sender: TObject);
    procedure PeJeonOutLookBtn1Click(Sender: TObject);
    procedure LPPrintClick(Sender: TObject);
    procedure Query_BCKCalcFields(DataSet: TDataSet);
    procedure ChkDaeriClick(Sender: TObject);
    procedure Chk_ChoiceClick(Sender: TObject);
    procedure Chk_ChoiceAllClick(Sender: TObject);
    procedure BT_GradeClick(Sender: TObject);
    procedure BT_ChoiceClick(Sender: TObject);
    procedure Chk_BoimClick(Sender: TObject);
    procedure Chk_SilgradeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure PrintSelect2;
    procedure Convet(var Data: TAData; Value: String);
  public
    { Public declarations }
    payrachdate : String;  // 직책체계변경일
    vEmpno      : String;
    vRabasdate  : String;
    vJobgun     : String;
    vUpManager1, vUpManager2 : String;
  end;

var
  MainForm: TMainForm;
  HomeDir : string;
  HFile   : string;


const
  CodeFile: string = 'pic4070c.cod';
  CodeId  : array[1..10] of string = ('I039','I112','I113','I001','I101','I221','I225','I223','I115','I330');

implementation

{$R *.DFM}

uses
  Pic40707, pic40710, pic40711,  pic40712, pic40713, pic40714, pic40715;

// 폼에 관련된 사항들...........................................................
procedure TMainForm.FormShow(Sender: TObject);
var
  CurDate : String;
begin
  HomeDir := HomeDirOpen;
  vEmpno  := PassEmp(cmdline,1);
  hp.Panels[0].text := '';

  with OraQuery1 do//현승격일로 셋팅.
  begin
       Close;
       SQL.Clear;
       SQL.Add('select to_char(sysdate,''YYYYMMDDHH24MISSD'') S_date, ');
       SQL.Add('       Value1, Text2, Text3                           ');
       SQL.Add('from pimupbas                                         ');
       SQL.Add('where rabasdate = ''00000000''                        ');
       Open;

       CurDate          := FieldByName('S_date').AsString;
       E_rabasdate.Text := FieldByName('Value1').AsString;
       vRabasdate       := FieldByName('Value1').AsString;
       vUpManager1      := FieldByName('Text2').AsString;
       vUpManager2      := FieldByName('Text3').AsString;
       hp.Panels[1].text  := copy(CurDate,1,4) +'/'+ copy(CurDate,5,2) +'/'+ copy(CurDate,7,2);

       Close;
       SQL.Clear;
       SQL.Add('SELECT  value3, value4        FROM pimvari  ');   // 직책체계변경일
       SQL.Add(' WHERE gubun = ''00'' and sgubun = ''0001'' ');
       Open;
       payrachdate := FieldBYName('Value3').Asstring;

       Close;
       SQL.Clear;
       SQL.Add('SELECT value1  FROM pimupbas    ');  //승격종합점수 기준년
       SQL.Add(' WHERE rabasdate = :p_rabasdate ');
       SQL.Add('   AND upcodeno  = ''200''      ');
       ParamByName('p_rabasdate').AsString := vRabasdate;
       Open;
       PPE_rabasyear.Text := FieldBYName('Value1').Asstring;

       Close;
       SQL.Clear;
       SQL.Add('select substr(deptcode,1,2)||'' ''||deptname Bumun   ');
       SQL.Add('  from pycdept                                       ');
       SQL.Add(' where orgnum = '''+ GetOrgnum +'''                  ');
       SQL.Add('   and substr(deptcode,-4) = ''0000''                ');
       SQL.Add('   and deptcode > ''A0000'' and deptcode < ''Y0000'' ');
       Open;

       First;
       CB_Bumun.Items.Clear;
       CB_Bumun.Items.Add('전체');
       while not OraQuery1.Eof do
       begin
            CB_Bumun.Items.Add(Fields[0].AsString);
            Next;
       end;
  end;      

  if not ((vEmpno = vUpManager1) or (vEmpno = vUpManager2) or (Copy(vEmpno,1,1) = 'D') ) then
  begin
       Application.MessageBox(PChar('사용권한이 부족합니다. 자동종료 됩니다.'),'에러',mb_ok);
       Application.Terminate;
       Exit;
  end;

  RbJobgun1.Checked  := True;
  E_rabasdate.SetFocus ;
end;


procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FileExists(HomeDir+'\list\'+HFile)       = True then DeleteFile(PChar(HomeDir+'\list\'+HFile));
  if FileExists(HomeDir+'\list\pic4070c.cod') = True then DeleteFile(PChar(HomeDir+'\list\pic4070c.cod'));

  Ora_Picture.Active    := False;
  Ora_Session.Connected := False;
  Action := caFree;
end;

procedure TMainForm.Bt_ExitClick(Sender: TObject);
begin
  if MessageBox(0,'종료 하시겠습니까 ?.','확 인',MB_YESNO or $0030) = ID_YES then Close;
end;

procedure TMainForm.PeJeonOutLookBtn1Click(Sender: TObject);
begin
  System.exit;
end;

procedure TMainForm.Convet(var Data: TAData; Value: String);
var
  I, J, K: Integer;
  Temp: String;
begin
  J := 1;
  K := 1;
  Temp := '';

  for I := 1 to Length(Value) do
  begin
    if K = 79 then J := J;
    if Value[I] <> ',' then
    begin
         if Value[I] <> ' ' then
         begin
              Temp := Temp + Value[I];
              Inc(J);
         end;
    end
    else
    begin
         Data[K] := Temp;
         Temp := '';
         J := 1;
         Inc(K);
    end;
  end;
  Data[K] := Temp;
end;

procedure TMainForm.ChkDaeriClick(Sender: TObject);
begin
  Chk_Choice.Checked := False;
  ChkChajang.Checked := False;
  ChkKwajang.Checked := False;
  Chk_Boim.Checked   := False;
  Chk_BoimNo.Checked := False;
  Chk_BoimBiboim.Checked  := False;  
end;

procedure TMainForm.Chk_BoimClick(Sender: TObject);
begin
  ChkDaeri.Checked := False;
  ChkSawon.Checked := False;
end;

procedure TMainForm.Chk_ChoiceClick(Sender: TObject);
begin
  Chk_ChoiceAll.Checked := False;
  Chk_Silgrade.Checked  := False;
end;

procedure TMainForm.Chk_ChoiceAllClick(Sender: TObject);
begin
  Chk_Choice.Checked    := False;
  Chk_Silgrade.Checked  := False;  
end;

procedure TMainForm.PrintSelect2;
var vBumun, vRabas1130 : String;
begin
  if      RbJobgun1.Checked = True then  vJobgun := '%'
  else if RbJobgun2.Checked = True then  vJobgun := '11'
  else if RbJobgun3.Checked = True then  vJobgun := '22'
  else if RbJobgun4.Checked = True then  vJobgun := '44'
  else if RbJobgun5.Checked = True then  vJobgun := '45'
  else if RbJobgun6.Checked = True then  vJobgun := '%'; //모든 데이터중 shoftyn='N' 인

  if   CB_Bumun.text = '전체' then vBumun := '%'
  else                             vBumun := Copy(CB_Bumun.text,1,2)+'%';

  vRabas1130 := PPE_rabasyear.Text + '1130';  //2009.11 Add

  with Query_BCK do
  begin
    Close;
    SQL.Clear;
    if Gubun_1.Checked = True then  //평가부서로 인쇄    : 미사용 2009.12.
    begin
         SQL.Add('select a.empno, '''' grade00, ''G+'' grade01, ''G+'' grade02, ''G+'' grade03, ''G+'' grade04,                                         ');
         SQL.Add('       nvl(choice,9999) choice, FinalGrade, ValuesGrade, AbilityscrGrade, ResultscrGrade,                                             ');
         SQL.Add('       Z.bumuncnt, Z.bumunrank,  round(Z.bumunrank / Z.bumuncnt * 100,1) || ''%'' bumunrate,                                          ');
         SQL.Add('       DECODE((select rank from pimupex where rabasdate = :rabasdate and empno=a.empno),'''',c.rank,                                  ');
         SQL.Add('              (select rank from pimupex where rabasdate = :rabasdate and empno=a.empno)             ) rank,                           ');
         SQL.Add('       rank() over (partition by c.jobgun, c.paycl order by c.rank, a.empno) sno,                                                     ');
         SQL.Add('       DECODE((select cnt from pimupex where rabasdate = :rabasdate and empno=a.empno),'''',c.cnt,                                    ');
         SQL.Add('              (select cnt from pimupex where rabasdate = :rabasdate and empno=a.empno)) cnt,                                          ');
         SQL.Add('       DECODE((select rateex from pimupex where rabasdate = :rabasdate and empno=a.empno),'''',round(c.rank / c.cnt * 100,1) || ''%'',');
         SQL.Add('              (select rateex from pimupex where rabasdate = :rabasdate and empno=a.empno)) RRATE,                                     ');
         SQL.Add('       (c.cnt * 0.5) CRATE, a.shiftyn,                                                                                                ');
         SQL.Add('       a.jobgun,  nvl((select codefname from pyccode where codeid=''I115'' and codeno = c.jobgun),'''') jobgunname,                   ');
         SQL.Add('       a.paycl,   nvl((select codename  from pyccode where codeid=''I112'' and codeno = a.paycl ),'''') payclname,                    ');
         SQL.Add('       a.korname,   ''(''||TO_Char(USAAGE)||'')'' age,                                                                                ');
         SQL.Add('       rpad(''A'',60,''A'') bundeptname,                                                                                              ');
         SQL.Add('       nvl((select deptname from pycdept where orgnum=a.orgnum and deptcode = a.deptcode),'''') deptname,                             ');
         SQL.Add('       nvl((select deptna3  from pycdept where orgnum=a.orgnum and deptcode = a.deptcode),'''') deptna3,                              ');
         SQL.Add('       nvl((select codename from pyccode where codeid=''I113'' and codeno = a.payra),'''') payraname,                                 ');
         SQL.Add('       nvl((select codename from pyccode where codeid=''I221'' and codeno = b.lschgr),'''') lschgrname,                               ');
         SQL.Add('       b.lschnm,                                                                                                                      ');
         SQL.Add('       nvl((select codename from pyccode where codeid=''I225'' and codeno = b.lmajorcode),'''') lmajorcode,                           ');
         SQL.Add('       substr(b.lschgrym,1,4) lschgrym,                                                                                               ');
         SQL.Add('       nvl((decode(b.unicode,'''',(select codename from pyccode where codeid=''I223'' and codeno = b.LSCHCODE),                       ');
         SQL.Add('                                  (select codename from pyccode where codeid=''I223'' and codeno = b.unicode))),''고졸'') unicodename,');
         SQL.Add('       decode(b.lschgr,''69'',nvl((select codename from pyccode where codeid=''I225'' and codeno=b.unimajor),''''),'''') unimajorname,');
         SQL.Add('       decode(b.lschgr,''69'',substr(b.unigrym,1,4),'''') unigrym,                                                                    ');
         SQL.Add('       substr(b.empdate,1,4) || ''/'' || substr(b.empdate,5,2) || ''/'' || substr(b.empdate,7,2) empdate,                             ');
         SQL.Add('       nvl((select codename from pyccode where codeid=''I101'' and codeno = b.empcode),'''') empcode,                                 ');
         SQL.Add('       substr(a.paycldate,1,4) || ''/'' || substr(a.paycldate,5,2) || ''/'' || substr(a.paycldate,7,2) paycldate,                     ');
         SQL.Add('       ''(''||substr(b.cpaycldate,1,4)||''/''||substr(b.cpaycldate,5,2)||''/''||substr(b.cpaycldate,7,2)||'')'' cpaycldate,           ');
         SQL.Add('       a.payclyy || ''년'' || a.payclmm || ''월'' payclyymm,                                                                          ');
         SQL.Add('       a.totscr, a.payclscr, nvl(a.totscr,0) + nvl(a.payclscr,0) totpayscr, a.qpayclscr, a.uppoint,                                   ');
         SQL.Add('       nvl(a.prizescr,0) + nvl(a.suggscr,0) sumpriz, a.uppoint_2year,                                                                 ');
         SQL.Add('       (SELECT punish FROM pimupex WHERE rabasdate = :rabasdate and empno=a.empno) punish,                                            ');
         SQL.Add('       (SELECT educate FROM pimupex WHERE rabasdate = :rabasdate and empno=a.empno) educate                                           ');
         SQL.Add('  from pimupmas a, pimpmas b,                                                                                                         ');
         SQL.Add('     (Select empno, FinalGrade, ValuesGrade, AbilityscrGrade, ResultscrGrade from pehevhis                                            ');
         SQL.Add('       Where rabasyear= '''+PPE_rabasyear.Text+''') F,                                                                                ');
         SQL.Add('     (select X.empno, Y.cnt bumuncnt,                                                                                                 ');
         SQL.Add('             rank() over (partition by X.extcode                                                                                      ');
         SQL.Add('             order by X.tot desc, X.gijun1 desc, X.gijun2 desc, X.gijun3 desc,X.gijun4 desc) bumunrank                                ');
         SQL.Add('       from (select empno,   extcode, orgnum,                                                                                         ');
         SQL.Add('                    nvl(totscr,0) + nvl(payclscr,0) tot,                                                                              ');
         SQL.Add('                    nvl(qpayclscr,0) gijun1,                                                                                          ');
         SQL.Add('                    nvl(uppoint,0) gijun2,                                                                                            ');
         SQL.Add('                    nvl(prizescr,0) + nvl(suggscr,0) gijun3,                                                                          ');
         SQL.Add('                    nvl(uppoint_2year,0) gijun4,                                                                                      ');
         SQL.Add('                    paycl                                                                                                             ');
         SQL.Add('               from pimupmas a                                                                                                        ');
         SQL.Add('              where rabasdate  = :rabasdate                                                                                           ');
         SQL.Add('                and paycl between :frpaycl and :topaycl                                                                               ');
         SQL.Add('                and uppointyn  = ''Y''  and edupointyn = ''Y'' and shiftyn = ''Y'' and upyn = ''Y''  ) X,                             ');
         SQL.Add('            (select paycl, count(*) cnt,                                                                                              ');
         SQL.Add('                    extcode                       ');
         SQL.Add('               from pimupmas                                                                                                          ');
         SQL.Add('              where rabasdate  = :rabasdate                                                                                           ');
         SQL.Add('                and paycl between :frpaycl and :topaycl                                                                               ');
         SQL.Add('                and uppointyn  = ''Y''  and edupointyn = ''Y'' and shiftyn = ''Y'' and upyn = ''Y''                                   ');
         SQL.Add('              group by extcode, paycl ) Y                 '); //부문코드 하드코딩 해마다 변경필요
         SQL.Add('      where Y.extcode = X.extcode                                                                                                     ');
         SQL.Add('        and Y.paycl   = X.paycl        ) Z,                                                                                           ');
         SQL.Add('     (select a.empno, a.jobgun, a.paycl,                                                                                              ');
         SQL.Add('             b.cnt,                                                                                                                   ');
         SQL.Add('             rank() over (partition by a.jobgun, a.paycl                                                                              ');
         SQL.Add('                          order by a.tot desc, a.gijun1 desc, a.gijun2 desc, a.gijun3 desc,a.gijun4 desc) rank                        ');
         SQL.Add('        from (select a.empno,   a.paycl,                                                                                              ');
         SQL.Add('                     nvl(a.totscr,0) + nvl(a.payclscr,0)  tot,                                                                        ');
         SQL.Add('                     nvl(a.qpayclscr,0)                   gijun1,                                                                     ');
         SQL.Add('                     nvl(a.uppoint,0)                     gijun2,                                                                     ');
         SQL.Add('                     nvl(a.prizescr,0) + nvl(a.suggscr,0) gijun3,                                                                     ');
         SQL.Add('                     nvl(uppoint_2year,0)                 gijun4,                                                                     ');
         SQL.Add('                     b.evjobgun                           jobgun                                                                      ');
         SQL.Add('               from  pimupmas a, pimragroup b                                                                                         ');
         SQL.Add('              where a.rabasdate = :rabasdate                                                                                          ');
         SQL.Add('                and b.rabasdate = :rabasdate                                                                                          ');
         SQL.Add('                and b.ragroup   = ''01''                                                                                              ');
         SQL.Add('                and a.paycl     = b.rapaycl                                                                                           ');
         SQL.Add('                and a.jobgun    = b.rajobgun                                                                                          ');

         if (ChkChajang.Checked = True) or (ChkKwajang.Checked = True) or (Chk_Boim.Checked = True) or (Chk_Boim.Checked = True) then  //2009 Add
         begin
              SQL.Add('                and a.uppointyn  = ''Y''  and a.edupointyn = ''Y''                                                               ');

              if   RbJobgun6.Checked then  SQL.Add('                and a.shiftyn = ''N'' ')          //*기타직군2 추가로 SQL 추가.dsa2000  2007.12 */
              else                         SQL.Add('                and a.shiftyn = ''Y'' ');
         end;

         if   RbJobgun6.Checked then  SQL.Add('                and a.upyn    = ''N'' ) a,  ')    //SQL.Add('and a.upyn       = ''Y'') a,
         else                         SQL.Add('                and a.upyn    = ''Y'' ) a,  ');

         SQL.Add('           (select count(*) cnt,   b.evjobgun jobgun,  a.paycl paycl                                                                  ');
         SQL.Add('              from pimupmas a, pimragroup b                                                                                           ');
         SQL.Add('             where a.rabasdate = :rabasdate                                                                                           ');
         SQL.Add('               and b.rabasdate = :rabasdate                                                                                           ');
         SQL.Add('               and b.ragroup   = ''01''                                                                                               ');
         SQL.Add('               and a.paycl     = b.rapaycl                                                                                            ');
         SQL.Add('               and a.jobgun    = b.rajobgun                                                                                           ');

         if   RbJobgun6.Checked then SQL.Add('                and a.upyn = ''N'' ')  //      SQL.Add('               and a.upyn      = ''Y''
         else                        SQL.Add('                and a.upyn = ''Y'' ');

         if (ChkChajang.Checked = True) or (ChkKwajang.Checked = True) then
         begin
              SQL.Add('                and a.uppointyn  = ''Y''  and a.edupointyn = ''Y''                                                               ');

              if   RbJobgun6.Checked then  SQL.Add('          and a.shiftyn = ''N'' ')   //*기타직군2 추가로 SQL 추가.dsa2000  2007.12 */
              else                         SQL.Add('          and a.shiftyn = ''Y'' ');
         end;

         SQL.Add('            group by b.evjobgun, a.paycl ) b   ');
         SQL.Add('      where a.paycl  = b.paycl                 ');
         SQL.Add('        and a.jobgun = b.jobgun ) c            ');
         SQL.Add('where a.rabasdate = :rabasdate                 ');
         SQL.Add('  and a.empno     = b.empno                    ');
         SQL.Add('  and a.empno     = c.empno                    ');
         SQL.Add('  and a.empno     = F.empno                    ');
         SQL.Add('  and a.empno     = Z.empno(+)                 ');
         SQL.Add('  and c.jobgun LIKE '''+ vJobgun +'''          ');
         SQL.Add('  and a.paycl between :frpaycl and :topaycl    ');

         if Chk_Choice.Checked = True then //dsa2000  2008.11
         begin
              SQL.Add('  and a.Choice  is not null                                                                               ');
              SQL.Add('order by c.jobgun, c.paycl, nvl(choice,0), c.rank ');
         end
         else if Chk_ChoiceAll.Checked = True then
              SQL.Add('order by c.jobgun, c.paycl, nvl(choice,0), c.rank ')
         else SQL.Add('order by c.jobgun, c.paycl, c.rank                                                                        ');
    end
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    else
    begin  //현부서(부문별) 기준으로 인쇄
         SQL.Add('select a.empno, a.korname, a.paycl, nvl(choice,9999) choice, Edupoint, FinalGrade, ValuesGrade, AbilityscrGrade, ResultscrGrade,      ');
         SQL.Add('       nvl(Vboimcnt,0) Vboimcnt,  nvl(Vboimrank,0) Vboimrank,  nvl(Vbiboimcnt,0) Vbiboimcnt,  nvl(Vbiboimrank,0) Vbiboimrank ,        ');  //보임자,비보임자 같이 한화면에 출력.
         SQL.Add('       ''(''||TO_Char(USAAGE)||'')'' age,   Q.boimcnt,  Q.boimrank,                                                                   ');  //보임자,비보임자 따로 출력
         SQL.Add('       Decode(choice,'''',9,1) ChoiceGubun, Z.bumuncnt, Z.bumunrank,  round(Z.bumunrank / Z.bumuncnt * 100,1) || ''%'' bumunrate,     ');
         SQL.Add('       DECODE((select rank from pimupex where rabasdate = '''+vRabasdate+''' and empno=a.empno),'''', c.rank,                         ');
         SQL.Add('              (select rank from pimupex where rabasdate = '''+vRabasdate+''' and empno=a.empno)               ) rank,                 ');

         if Chk_Silgrade.Checked then  //dsa2000  2009.11 Add
              SQL.Add('       rank() over (partition by substr(a.deptcode,1,2)||''000'',  a.jobgun, c.paycl order by c.rank, a.empno) sno,               ')
         else SQL.Add('       rank() over (partition by substr(a.deptcode,1,1)||''0000'' order by bumunrank, c.rank, a.empno)         sno,               ');

         SQL.Add('       DECODE((select cnt from pimupex where rabasdate = '''+vRabasdate+''' and empno=a.empno),'''', c.cnt,                           ');
         SQL.Add('              (select cnt from pimupex where rabasdate = '''+vRabasdate+''' and empno=a.empno)             ) cnt,                     ');
       //SQL.Add('       DECODE((select rateex from pimupex where rabasdate='''+vRabasdate+''' and empno=a.empno),'''',round(c.rank/c.cnt*100,1)||''%'',');
       //SQL.Add('              (select rateex from pimupex where rabasdate='''+vRabasdate+''' and empno=a.empno)) RRATE,                               ');
         SQL.Add('       decode(Substr(c.rank/c.cnt*100,1,1),''.'', ''0''||round(c.rank/c.cnt*100,1)||''%'', round(c.rank/c.cnt*100,1)||''%'') RRATE,   ');
         SQL.Add('       (c.cnt * 0.45) CRATE,  a.shiftyn,                                                                                              ');
         SQL.Add('       nvl((select codename  from pyccode where codeid=''I115'' and codeno = a.jobgun),'''') jobgun,                                  ');
         SQL.Add('       nvl((select codefname from pyccode where codeid=''I115'' and codeno = a.jobgun),'''') jobgunname,                              ');
         SQL.Add('       nvl((select codename  from pyccode where codeid=''I112'' and codeno = a.paycl ),'''') payclname,                               ');

         if Chk_Silgrade.Checked then  //dsa2000  2009.11 Add
              SQL.Add('       (select rtrim(deptname) from pycdept where orgnum=a.orgnum and deptcode = substr(a.deptcode,1,2)||''000'') bundeptname,   ')
         else SQL.Add('       (select rtrim(deptname) from pycdept where orgnum=a.orgnum and deptcode = substr(a.deptcode,1,1)||''0000'') bundeptname,  ');

         SQL.Add('       nvl((select deptname from pycdept where orgnum=a.orgnum and deptcode = a.deptcode),'''') deptname,                             ');  //jobdept
         SQL.Add('       nvl((select deptna3  from pycdept where orgnum=a.orgnum and deptcode = a.deptcode),'''') deptna3,                              ');  //jobdept
         SQL.Add('       nvl((select codename from pyccode where codeid=''I113'' and codeno   = a.payra   ),'''') payraname,                            ');
         SQL.Add('       nvl((select codename from pyccode where codeid=''I221'' and codeno   = b.lschgr  ),'''') lschgrname,                           ');
         SQL.Add('       nvl((select codename from pyccode where codeid=''I225'' and codeno = b.lmajorcode),'''') lmajorcode,                           ');
         SQL.Add('       nvl((decode(b.unicode,'''',(select codename from pyccode where codeid=''I223'' and codeno = b.LSCHCODE),                       ');
         SQL.Add('                                   ''9000'',''학사(학점은행)'',     ''9990'',''학사(학점은행)'',                                      ');
         SQL.Add('                                  (select codename from pyccode where codeid=''I223'' and codeno = b.unicode))),''고졸'') unicodename,');
         SQL.Add('       decode(b.lschgr,''69'',nvl((select codename from pyccode where codeid=''I225'' and codeno=b.unimajor),''''),'''') unimajorname,');
         SQL.Add('       decode(b.lschgr,''69'',substr(b.unigrym,1,4),'''') unigrym,                                                                    ');
         SQL.Add('       b.lschnm,  substr(b.lschgrym,1,4) lschgrym,                                                                                    ');
         SQL.Add('       substr(b.empdate,1,4) || ''/'' || substr(b.empdate,5,2) || ''/'' || substr(b.empdate,7,2) empdate,                             ');
         SQL.Add('       nvl((select codename from pyccode where codeid=''I101'' and codeno = b.empcode),'''')     empcode,                             ');
         SQL.Add('              substr(a.paycldate,1,4) || ''/'' || substr(a.paycldate,5,2) || ''/'' || substr(a.paycldate,7,2)         paycldate,      ');
         SQL.Add('       ''(''||substr(b.cpaycldate,1,4)|| ''/'' || substr(b.cpaycldate,5,2)|| ''/'' || substr(b.cpaycldate,7,2)||'')'' cpaycldate,     ');
         SQL.Add('       a.payclyy || ''년'' || a.payclmm || ''월'' payclyymm,                                                                          ');
//         SQL.Add('       decode(a.empno,''1031'',92.5,a.totscr) totscr,  a.payclscr, a.qpayclscr,  nvl(decode(a.empno,''1031'',92.5,a.totscr),0) + nvl(a.payclscr,0) totpayscr,');
         SQL.Add('       a.totscr,  a.payclscr, a.qpayclscr,  nvl(a.totscr,0) + nvl(a.payclscr,0) totpayscr,                                            ');
         SQL.Add('       a.uppoint, nvl(a.prizescr,0) + nvl(a.suggscr,0) sumpriz,  a.uppoint_2year,                                                     ');
         SQL.Add('       (SELECT punish  FROM pimupex WHERE rabasdate = '''+vRabasdate+''' and empno=a.empno) punish,                                   ');
         SQL.Add('       (SELECT educate FROM pimupex WHERE rabasdate = '''+vRabasdate+''' and empno=a.empno) educate                                   ');
         SQL.Add('  from pimupmas a, pimpmas b,                                                                                                         ');

         SQL.Add('     (Select Empno, FinalGrade, ValuesGrade, AbilityscrGrade, ResultscrGrade                                                          ');
         SQL.Add('        from pehevhis where rabasyear = '''+PPE_rabasyear.Text+'''            ) F,                                                    ');//dsa2000  2008.12

         SQL.Add('     (select X.empno, Y.cnt bumuncnt,                                                                                                 ');
         SQL.Add('             rank() over (partition by X.extcode                                                                                      ');
         SQL.Add('                          order by X.tot desc, X.gijun1 desc, X.gijun2 desc, X.gijun3 desc,X.gijun4 desc) bumunrank                   ');
         SQL.Add('       from (select empno, substr(deptcode,1,1)||''0000'' extcode, orgnum, paycl ,                                                    ');
//         SQL.Add('                    nvl(decode(a.empno,''1031'',74,a.totscr),0) + nvl(payclscr,0)  tot,                                               ');
         SQL.Add('                    nvl(totscr,0) + nvl(payclscr,0)  tot,                                                                             ');
         SQL.Add('                    nvl(qpayclscr,0)                 gijun1,                                                                          ');
         SQL.Add('                    nvl(uppoint,0)                   gijun2,                                                                          ');
         SQL.Add('                    nvl(prizescr,0) + nvl(suggscr,0) gijun3,                                                                          ');
         SQL.Add('                    nvl(uppoint_2year,0)             gijun4                                                                           ');
         SQL.Add('               from pimupmas a                                                                                                        ');
         SQL.Add('              where rabasdate  = '''+vRabasdate+'''                                                                                   ');
         SQL.Add('                and paycl between :frpaycl and :topaycl                                                                               ');
         SQL.Add('                and uppointyn  = ''Y''  and edupointyn = ''Y'' and shiftyn = ''Y'' and upyn = ''Y''  ) X,                             ');
         SQL.Add('            (select paycl, count(*) cnt, substr(deptcode,1,1)||''0000'' extcode                                                       ');
         SQL.Add('               from pimupmas                                                                                                          ');
         SQL.Add('              where rabasdate  = '''+vRabasdate+'''                                                                                   ');
         SQL.Add('                and paycl between :frpaycl and :topaycl                                                                               ');
         SQL.Add('                and uppointyn  = ''Y''  and edupointyn = ''Y'' and shiftyn = ''Y'' and upyn = ''Y''                                   ');
         SQL.Add('              group by substr(deptcode,1,1)||''0000'', paycl                                         ) Y                              ');
         SQL.Add('      where Y.extcode = X.extcode                                                                                                     ');
         SQL.Add('        and Y.paycl   = X.paycl        ) Z,                                                                                           ');

         //보임자, 비보임자 구분하여 출력.
         SQL.Add('     (select X.empno, Y.cnt boimcnt,                                                                                                  ');
         SQL.Add('             rank() over (partition by X.extcode                                                                                      ');
         SQL.Add('                          order by X.tot desc, X.gijun1 desc, X.gijun2 desc, X.gijun3 desc,X.gijun4 desc) boimrank                    ');
         SQL.Add('       from (select empno, substr(deptcode,1,1)||''0000'' extcode, orgnum, paycl ,                                                    ');
//         SQL.Add('                    nvl(decode(a.empno,''1031'',74,a.totscr),0) + nvl(payclscr,0)  tot,                                               ');
         SQL.Add('                    nvl(totscr,0) + nvl(payclscr,0)  tot,                                                                             ');
         SQL.Add('                    nvl(qpayclscr,0)                 gijun1,                                                                          ');
         SQL.Add('                    nvl(uppoint,0)                   gijun2,                                                                          ');
         SQL.Add('                    nvl(prizescr,0) + nvl(suggscr,0) gijun3,                                                                          ');
         SQL.Add('                    nvl(uppoint_2year,0)             gijun4                                                                           ');
         SQL.Add('               from pimupmas a                                                                                                        ');
         SQL.Add('              where rabasdate  = '''+vRabasdate+'''                                                                                   ');
         SQL.Add('                and paycl between :frpaycl and :topaycl                                                                               ');

         if (Chk_Boim.Checked   = True) then  //2009.12. Add
         SQL.Add('                and empno     in (Select empno from petremas where rabasdate = '''+ vRabas1130 +''' )                                 ');
         if (Chk_BoimNo.Checked = True) then
         SQL.Add('                and empno not in (Select empno from petremas where rabasdate = '''+ vRabas1130 +''' )                                 ');

         SQL.Add('                and uppointyn  = ''Y''  and edupointyn = ''Y'' and shiftyn = ''Y'' and upyn = ''Y''  ) X,                             ');
         SQL.Add('            (select paycl, count(*) cnt,  substr(deptcode,1,1)||''0000'' extcode                                                      ');
         SQL.Add('               from pimupmas                                                                                                          ');
         SQL.Add('              where rabasdate  = '''+vRabasdate+'''                                                                                   ');
         SQL.Add('                and paycl between :frpaycl and :topaycl                                                                               ');

         if (Chk_Boim.Checked   = True) then  //2009.12. Add
         SQL.Add('                and empno     in (Select empno from petremas where rabasdate = '''+ vRabas1130 +''' )                                 ');
         if (Chk_BoimNo.Checked = True) then
         SQL.Add('                and empno not in (Select empno from petremas where rabasdate = '''+ vRabas1130 +''' )                                 ');

         SQL.Add('                and uppointyn  = ''Y''  and edupointyn = ''Y'' and shiftyn = ''Y'' and upyn = ''Y''                                   ');
         SQL.Add('              group by substr(deptcode,1,1)||''0000'', paycl                                         ) Y                              ');
         SQL.Add('      where Y.extcode = X.extcode                                                                                                     ');
         SQL.Add('        and Y.paycl   = X.paycl        ) Q,                                                                                           ');

         //보임자 서열..
         SQL.Add('     (select X.empno, Y.cnt Vboimcnt,                                                                                                ');
         SQL.Add('             rank() over (partition by X.extcode                                                                                      ');
         SQL.Add('                          order by X.tot desc, X.gijun1 desc, X.gijun2 desc, X.gijun3 desc,X.gijun4 desc) Vboimrank                  ');
         SQL.Add('       from (select empno, substr(deptcode,1,1)||''0000'' extcode, orgnum, paycl ,                                                    ');
         SQL.Add('                    nvl(totscr,0) + nvl(payclscr,0)  tot,                                                                             ');
         SQL.Add('                    nvl(qpayclscr,0)                 gijun1,                                                                          ');
         SQL.Add('                    nvl(uppoint,0)                   gijun2,                                                                          ');
         SQL.Add('                    nvl(prizescr,0) + nvl(suggscr,0) gijun3,                                                                          ');
         SQL.Add('                    nvl(uppoint_2year,0)             gijun4                                                                           ');
         SQL.Add('               from pimupmas a                                                                                                        ');
         SQL.Add('              where rabasdate  = '''+vRabasdate+'''                                                                                   ');
         SQL.Add('                and paycl between :frpaycl and :topaycl                                                                               ');
         SQL.Add('                and empno     in (Select empno from petremas where rabasdate = '''+ vRabas1130 +''' )                                 ');
         SQL.Add('                and uppointyn  = ''Y''  and edupointyn = ''Y'' and shiftyn = ''Y'' and upyn = ''Y''  ) X,                             ');
         SQL.Add('            (select paycl, count(*) cnt,  substr(deptcode,1,1)||''0000'' extcode                                                      ');
         SQL.Add('               from pimupmas                                                                                                          ');
         SQL.Add('              where rabasdate  = '''+vRabasdate+'''                                                                                   ');
         SQL.Add('                and paycl between :frpaycl and :topaycl                                                                               ');
         SQL.Add('                and empno     in (Select empno from petremas where rabasdate = '''+ vRabas1130 +''' )                                 ');
         SQL.Add('                and uppointyn  = ''Y''  and edupointyn = ''Y'' and shiftyn = ''Y'' and upyn = ''Y''                                   ');
         SQL.Add('              group by substr(deptcode,1,1)||''0000'', paycl                                         ) Y                              ');
         SQL.Add('      where Y.extcode = X.extcode                                                                                                     ');
         SQL.Add('        and Y.paycl   = X.paycl        ) V,                                                                                           ');

         //비보임자 서열..
         SQL.Add('     (select X.empno, Y.cnt Vbiboimcnt,                                                                                               ');
         SQL.Add('             rank() over (partition by X.extcode                                                                                      ');
         SQL.Add('                          order by X.tot desc, X.gijun1 desc, X.gijun2 desc, X.gijun3 desc,X.gijun4 desc) Vbiboimrank                 ');
         SQL.Add('       from (select empno, substr(deptcode,1,1)||''0000'' extcode, orgnum, paycl ,                                                    ');
         SQL.Add('                    nvl(totscr,0) + nvl(payclscr,0)  tot,                                                                             ');
         SQL.Add('                    nvl(qpayclscr,0)                 gijun1,                                                                          ');
         SQL.Add('                    nvl(uppoint,0)                   gijun2,                                                                          ');
         SQL.Add('                    nvl(prizescr,0) + nvl(suggscr,0) gijun3,                                                                          ');
         SQL.Add('                    nvl(uppoint_2year,0)             gijun4                                                                           ');
         SQL.Add('               from pimupmas a                                                                                                        ');
         SQL.Add('              where rabasdate  = '''+vRabasdate+'''                                                                                   ');
         SQL.Add('                and paycl between :frpaycl and :topaycl                                                                               ');
         SQL.Add('                and empno not in (Select empno from petremas where rabasdate = '''+ vRabas1130 +''' )                                 ');
         SQL.Add('                and uppointyn  = ''Y''  and edupointyn = ''Y'' and shiftyn = ''Y'' and upyn = ''Y''  ) X,                             ');
         SQL.Add('            (select paycl, count(*) cnt,  substr(deptcode,1,1)||''0000'' extcode                                                      ');
         SQL.Add('               from pimupmas                                                                                                          ');
         SQL.Add('              where rabasdate  = '''+vRabasdate+'''                                                                                   ');
         SQL.Add('                and paycl between :frpaycl and :topaycl                                                                               ');
         SQL.Add('                and empno not in (Select empno from petremas where rabasdate = '''+ vRabas1130 +''' )                                 ');
         SQL.Add('                and uppointyn  = ''Y''  and edupointyn = ''Y'' and shiftyn = ''Y'' and upyn = ''Y''                                   ');
         SQL.Add('              group by substr(deptcode,1,1)||''0000'', paycl                                         ) Y                              ');
         SQL.Add('      where Y.extcode = X.extcode                                                                                                     ');
         SQL.Add('        and Y.paycl   = X.paycl        ) W,                                                                                           ');

         SQL.Add('     (select a.empno, a.jobgun, a.paycl, b.cnt,                                                                                       ');
         SQL.Add('             rank() over (partition by a.jobgun, a.paycl                                                                              ');
         SQL.Add('                          order by a.tot desc, a.gijun1 desc, a.gijun2 desc, a.gijun3 desc,a.gijun4 desc) rank                        ');
         SQL.Add('       from (select a.empno, a.paycl,  b.evjobgun jobgun,                                                                             ');
//         SQL.Add('                    nvl(decode(a.empno,''1031'',74,a.totscr),0) + nvl(payclscr,0)  tot,                                                                             ');
         SQL.Add('                    nvl(totscr,0) + nvl(payclscr,0)  tot,                                                                             ');
         SQL.Add('                    nvl(qpayclscr,0)                 gijun1,                                                                          ');
         SQL.Add('                    nvl(uppoint,0)                   gijun2,                                                                          ');
         SQL.Add('                    nvl(prizescr,0) + nvl(suggscr,0) gijun3,                                                                          ');
         SQL.Add('                    nvl(uppoint_2year,0)             gijun4                                                                           ');
         SQL.Add('               from pimupmas a, pimragroup b                                                                                          ');
         SQL.Add('              where a.rabasdate = '''+vRabasdate+'''                                                                                  ');
         SQL.Add('                and b.rabasdate = '''+vRabasdate+'''                                                                                  ');
         SQL.Add('                and b.ragroup   = ''01''                                                                                              ');
         SQL.Add('                and a.paycl     = b.rapaycl                                                                                           ');
         SQL.Add('                and a.jobgun    = b.rajobgun                                                                                          ');

       //if (ChkChajang.Checked = True) or (ChkKwajang.Checked = True)  then
         if (ChkChajang.Checked = True) or (ChkKwajang.Checked = True) or (Chk_Boim.Checked = True) or (Chk_Boim.Checked = True) then  //2009 Add
         begin
              if   RbJobgun6.Checked then  SQL.Add('                and a.uppointyn  = ''Y'' and a.edupointyn = ''Y'' and a.shiftyn = ''N''             ') //*기타직군2 추가로 SQL 추가.dsa2000  2007.12 */
              else                         SQL.Add('                and a.uppointyn  = ''Y'' and a.edupointyn = ''Y'' and a.shiftyn = ''Y''             ');
         end;

         if   RbJobgun6.Checked then SQL.Add('                and a.upyn = ''N'' ) a,                                                                   ')
         else                        SQL.Add('                and a.upyn = ''Y'' ) a,                                                                   ');

         SQL.Add('            (select count(*) cnt,  b.evjobgun jobgun,    a.paycl paycl                                                                ');
         SQL.Add('               from pimupmas a, pimragroup b                                                                                          ');
         SQL.Add('              where a.rabasdate = '''+vRabasdate+'''                                                                                  ');
         SQL.Add('                and b.rabasdate = '''+vRabasdate+'''                                                                                  ');
         SQL.Add('                and b.ragroup   = ''01''                                                                                              ');
         SQL.Add('                and a.paycl     = b.rapaycl                                                                                           ');
         SQL.Add('                and a.jobgun    = b.rajobgun                                                                                          ');

       //if (ChkChajang.Checked = True) or (ChkKwajang.Checked = True)  then
         if (ChkChajang.Checked = True) or (ChkKwajang.Checked = True) or (Chk_Boim.Checked = True) or (Chk_Boim.Checked = True) then  //2009 Add
         begin
              if   RbJobgun6.Checked then  SQL.Add('                and a.uppointyn  = ''Y'' and a.edupointyn = ''Y'' and a.shiftyn = ''N''             ') //*기타직군2 추가로 SQL 추가.dsa2000  2007.12 */
              else                         SQL.Add('                and a.uppointyn  = ''Y'' and a.edupointyn = ''Y'' and a.shiftyn = ''Y''             ');
         end;

         if   RbJobgun6.Checked then SQL.Add('                and a.upyn = ''N'' ')
         else                        SQL.Add('                and a.upyn = ''Y'' ');

         SQL.Add('              group by b.evjobgun, a.paycl ) b ');
         SQL.Add('        where a.paycl  = b.paycl               ');
         SQL.Add('          and a.jobgun = b.jobgun          ) c ');
         SQL.Add(' where a.rabasdate = '''+vRabasdate+'''        ');
         SQL.Add('   and a.empno     = b.empno                   ');
         SQL.Add('   and a.empno     = c.empno                   ');
         SQL.Add('   and a.empno     = F.empno                   ');
         SQL.Add('   and a.empno     = Z.empno(+)                ');
         SQL.Add('   and a.empno     = Q.empno(+)                '); // 보임자 or  비보임자 순위.  2009.12. Add
         SQL.Add('   and a.empno     = W.empno(+)                '); // 보임자 and 비보임자 순위.  2009.12. Add
         SQL.Add('   and a.empno     = V.empno(+)                '); // 보임자 and 비보임자 순위.  2009.12. Add
         SQL.Add('   and c.jobgun LIKE '''+ vJobgun +'''         ');
         SQL.Add('   and a.paycl between :frpaycl and :topaycl   ');

         if Chk_Boim.Checked   = True then  //dsa2000  2009.11 Add
              SQL.Add('   and a.empno     in (Select empno from petremas where rabasdate = '''+ vRabas1130 +''' )');
         if Chk_BoimNo.Checked = True then  //dsa2000  2009.11 Add
              SQL.Add('   and a.empno not in (Select empno from petremas where rabasdate = '''+ vRabas1130 +''' )');

         if Chk_Choice.Checked = True then  //dsa2000  2008.12
         begin
              SQL.Add('   and a.Choice is not null                                                               ');
              SQL.Add( 'order by substr(a.deptcode,1,1)||''0000'', choicegubun, choice, z.BUMUNRANK, c.rank, sno ');
         end
         else if Chk_ChoiceAll.Checked = True then
              SQL.Add(' order by substr(a.deptcode,1,1)||''0000'', choicegubun, choice, z.BUMUNRANK, c.rank, sno ')

         else if Chk_Silgrade.Checked  = True then  //dsa2000 2009.11 Add  경영지원부문 실단위 출력위하여.
         begin
              SQL.Add('   and a.orgnum = '''+ GetOrgnum + '''                                                    ');
              SQL.Add('   and substr(a.extcode,1,2) = '''+Copy(CB_Bumun.text,1,2)+'''                            ');
              SQL.Add(' order by substr(a.deptcode,1,2)||''000'', a.jobgun, c.paycl, c.rank, sno                 ');
         end
         else
         begin
              SQL.Add('   and a.orgnum = '''+ GetOrgnum  +'''                                                    ');
              SQL.Add('   and a.extcode like '''+ vBumun +'''                                                    ');
              SQL.Add(' order by a.extcode, a.jobgun, c.paycl, c.rank, sno                                       ');
         end
    end;
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    if (ChkBujang.Checked = True)  then //부장...
    begin
         ParamByName('frpaycl').AsString := 'C11';
         ParamByName('topaycl').AsString := 'C11';
    end
    else if (ChkChajang.Checked = True) or (Chk_BoimBiboim.Checked = True) or
            (Chk_Boim.Checked   = True) or (Chk_BoimNO.Checked     = True) then  //2009.12. Add
    begin
         ParamByName('frpaycl').AsString := 'C21';
         ParamByName('topaycl').AsString := 'C21';
    end
    else if (ChkKwajang.Checked = True) then
    begin
         ParamByName('frpaycl').AsString := 'D11';
         ParamByName('topaycl').AsString := 'D11';
    end
    else if (ChkDaeri.Checked = True) and (ChkSawon.Checked = True) then
    begin
         ParamByName('frpaycl').AsString := 'D21';
         ParamByName('topaycl').AsString := 'D35';
    end
    else if (ChkDaeri.Checked = True) and (ChkSawon.Checked = False) then
    begin
         ParamByName('frpaycl').AsString := 'D21';
         ParamByName('topaycl').AsString := 'D21';
    end
    else if (ChkDaeri.Checked = False) and (ChkSawon.Checked = True) then
    begin
         ParamByName('frpaycl').AsString := 'D31';
         ParamByName('topaycl').AsString := 'D35';
    end;

    Edit1.Visible := False;
    if (Copy(vEmpno,1,1) = 'D') then Edit1.text    := Sql.text;
    if (Copy(vEmpno,1,1) = 'D') then Edit1.Visible := True;
    Open;
  end;
end;

procedure TMainForm.LPPrintClick(Sender: TObject);
begin
  if  (ChkBujang.Checked = False) and (ChkChajang.Checked = False) and (ChkKwajang.Checked = False) and
      (ChkDaeri.Checked  = False) and (ChkSawon.Checked   = False) and
      (Chk_Boim.Checked  = False) and (Chk_BoimNo.Checked = False) and (Chk_BoimBiboim.Checked = False) then
  begin
       Showmessage('BAND를 선택해 주세요.');
       exit;
  end;

  //////////////////////////////////////////////////////////////////////////////
  if (ChkDaeri.Checked = True) or (ChkSawon.Checked = True) then  // 대리이하     2008  Add
  begin
       if Gubun_1.Checked = True then FmPic40711 := TFmPic40711.Create(self); //평가부서별(직군별) : G2 G3 밴드..(사원 대리)
       if Gubun_2.Checked = True then FmPic40712 := TFmPic40712.Create(self); //현  부서별(부문별) : G2 G3 밴드..(사원 대리)

       Screen.Cursor := crDefault;

       PrintSelect2;       

       if (Gubun_1.Checked = True) and (Query_BCK.RecordCount > 0) then
       begin
            if      (TComponent(Sender).Tag = 1) then FmPic40711.QuickRep1.Preview //화면 출력
            else if (TComponent(Sender).Tag = 2) then FmPic40711.QuickRep1.Print;  //프린터 출력
       end
       else if (Gubun_2.Checked = True) and (Query_BCK.RecordCount > 0) then
       begin
            if      (TComponent(Sender).Tag = 1) then FmPic40712.QuickRep1.Preview //화면 출력
            else if (TComponent(Sender).Tag = 2) then FmPic40712.QuickRep1.Print;  //프린터 출력
       end
       else Application.MessageBox('자료가 없습니다.','승격',mb_ok+mb_IconStop);

      if Gubun_1.Checked = True then FmPic40711.Free;
      if Gubun_2.Checked = True then FmPic40712.Free;
  end

  else if ( (ChkKwajang.Checked = True)  ) then    //과장
  begin
       if Gubun_1.Checked = True then FmPic40707 := TFmPic40707.Create(self); //평가부서로
       if Gubun_2.Checked = True then FmPic40710 := TFmPic40710.Create(self); //현  부서로...

       Screen.Cursor:=crDefault;

       PrintSelect2;

       if (Gubun_1.Checked = True) and (Query_BCK.RecordCount > 0) then
       begin
            if      (TComponent(Sender).Tag = 1) then FmPic40707.QuickRep1.Preview //화면 출력
            else if (TComponent(Sender).Tag = 2) then FmPic40707.QuickRep1.Print;  //프린터 출력
       end
       else if (Gubun_2.Checked = True) and (Query_BCK.RecordCount > 0) then
       begin
            if      (TComponent(Sender).Tag = 1) then FmPic40710.QuickRep1.Preview //화면 출력
            else if (TComponent(Sender).Tag = 2) then FmPic40710.QuickRep1.Print;  //프린터 출력
       end
       else Application.MessageBox('자료가 없습니다.','승격',mb_ok+mb_IconStop);

      if Gubun_1.Checked = True then FmPic40707.Free;
      if Gubun_2.Checked = True then FmPic40710.Free;
  end

  else if ( (ChkBujang.Checked = True) or (ChkChajang.Checked = True) ) then  // 차부장.
  begin
       if Gubun_2.Checked = True then FmPic40714 := TFmPic40714.Create(self); //현부서로...

       Screen.Cursor:=crDefault;

       PrintSelect2;

       if (Gubun_2.Checked = True) and (Query_BCK.RecordCount > 0) then
       begin
            if      (TComponent(Sender).Tag = 1) then FmPic40714.QuickRep1.Preview //화면 출력
            else if (TComponent(Sender).Tag = 2) then FmPic40714.QuickRep1.Print;  //프린터 출력
       end
       else Application.MessageBox('자료가 없습니다.','승격',mb_ok+mb_IconStop);

      if Gubun_2.Checked = True then FmPic40714.Free;
  end

  else if Chk_BoimBiboim.Checked = True then    // 차부장. : 보임, 비보임 서열 동시 출력.
  begin
       if Gubun_2.Checked = True then FmPic40715 := TFmPic40715.Create(self); //현부서로...

       Screen.Cursor:=crDefault;

       PrintSelect2;

       if (Gubun_2.Checked = True) and (Query_BCK.RecordCount > 0) then
       begin
            if      (TComponent(Sender).Tag = 1) then FmPic40715.QuickRep1.Preview //화면 출력
            else if (TComponent(Sender).Tag = 2) then FmPic40715.QuickRep1.Print;  //프린터 출력
       end
       else Application.MessageBox('자료가 없습니다.','승격',mb_ok+mb_IconStop);

      if Gubun_2.Checked = True then FmPic40715.Free;
  end

  else if ( (Chk_Boim.Checked = True) or (Chk_BoimNo.Checked = True) ) then   //2009.11. Add
  begin
       if Gubun_2.Checked = True then FmPic40713 := TFmPic40713.Create(self); //현부서로...

       Screen.Cursor := crDefault;

       PrintSelect2;

       if (Gubun_2.Checked = True) and (Query_BCK.RecordCount > 0) then
       begin
            if      (TComponent(Sender).Tag = 1) then FmPic40713.QuickRep1.Preview //화면 출력
            else if (TComponent(Sender).Tag = 2) then FmPic40713.QuickRep1.Print;  //프린터 출력
       end
       else Application.MessageBox('자료가 없습니다.','승격',mb_ok+mb_IconStop);

      if Gubun_2.Checked = True then FmPic40713.Free;
  end;
end;

procedure TMainForm.Query_BCKCalcFields(DataSet: TDataSet);
var
  GradeYear1, GradeYear2, GradeYear3, GradeYear4, GradeYear5 : String;
begin
  GradeYear1 := inttostr(strtoint(MainForm.PPE_rabasyear.Text) - 4);
  GradeYear2 := inttostr(strtoint(MainForm.PPE_rabasyear.Text) - 3);
  GradeYear3 := inttostr(strtoint(MainForm.PPE_rabasyear.Text) - 2);
  GradeYear4 := inttostr(strtoint(MainForm.PPE_rabasyear.Text) - 1);
  GradeYear5 := inttostr(strtoint(MainForm.PPE_rabasyear.Text));

  with OraQuery1 do
  begin
      Close;
      SQL.Clear;
      SQL.Add('select finalgrade from pehevhis                    ');
      SQL.Add(' where empno     = :empno                          ');
      SQL.Add('   and rabasyear = :rabasyear                      ');
      SQL.Add('   and (trim(upscore) is not null or upscore <> 0) ');

      if (Copy(Query_BCK.FieldByName('paycldate').AsString,1,4) <= GradeYear1) then
      begin
           Close;
           ParamByName('empno').AsString     := Query_BCK.FieldByName('empno').AsString;
           ParamByName('rabasyear').AsString := GradeYear1;
           Open;
           if   RecordCount = 0 then Query_BCKgrade00.Value := ''
           else                      Query_BCKgrade00.Value := OraQuery1.FieldByName('finalgrade').AsString;
      end;

      if (Copy(Query_BCK.FieldByName('paycldate').AsString,1,4) <= GradeYear2) then
      begin
           Close;
           ParamByName('empno').AsString     := Query_BCK.FieldByName('empno').AsString;
           ParamByName('rabasyear').AsString := GradeYear2;
           Open;
           if   RecordCount = 0 then Query_BCKgrade01.Value := ''
           else                      Query_BCKgrade01.Value := OraQuery1.FieldByName('finalgrade').AsString;
      end;

      if (Copy(Query_BCK.FieldByName('paycldate').AsString,1,4) <= GradeYear3) then
      begin
           Close;
           ParamByName('empno').AsString     := Query_BCK.FieldByName('empno').AsString;
           ParamByName('rabasyear').AsString := GradeYear3;
           Open;
           if   RecordCount = 0 then Query_BCKgrade02.Value := ''
           else                      Query_BCKgrade02.Value := OraQuery1.FieldByName('finalgrade').AsString;
      end;

      if (Copy(Query_BCK.FieldByName('paycldate').AsString,1,4) <= GradeYear4) then
      begin
           Close;
           ParamByName('empno').AsString     := Query_BCK.FieldByName('empno').AsString;
           ParamByName('rabasyear').AsString := GradeYear4;
           Open;
           if   RecordCount = 0 then Query_BCKgrade03.Value := ''
           else                      Query_BCKgrade03.Value := OraQuery1.FieldByName('finalgrade').AsString;
      end;

      if (Copy(Query_BCK.FieldByName('paycldate').AsString,1,4) <= GradeYear5) then
      begin
           Close;
           ParamByName('empno').AsString     := Query_BCK.FieldByName('empno').AsString;
           ParamByName('rabasyear').AsString := GradeYear5;
           Open;
           if    RecordCount = 0 then Query_BCKgrade04.Value := ''
           else                       Query_BCKgrade04.Value := OraQuery1.FieldByName('finalgrade').AsString;
      end;

      {//2008년 하드코딩.
      if Query_BCK.FieldByName('empno').AsString ='0433' then  Query_BCKgrade00.Value := 'B0';
      if Query_BCK.FieldByName('empno').AsString ='0433' then  Query_BCKgrade01.Value := 'B0';
      if Query_BCK.FieldByName('empno').AsString ='0433' then  Query_BCKgrade02.Value := 'B0';}
  end;
end;

//dsa2000  2008.12  해당년도의 최종 평가결과를 프린트 하기위하여 인력팀에서 엑셀을 받아 업로드 한다.
//                  역량등급 같은 경우는 시스템에서 계산도 안되는 항목임.
procedure TMainForm.BT_GradeClick(Sender: TObject);
var
  Dest: TStringList;
  I, J: Integer;
  Data: TAData;
  Excel_name: String;
begin
  if MessageDlg('엑셀자료를 저장하시겠습니까 ?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then  System.Exit;

  if FileOpenDlg.Execute then Excel_name := FileOpenDlg.FileName ;

  Dest := TStringList.Create;
  Dest.LoadFromFile(Excel_name);

  if Excel_name <> '' then
  begin
       with OraQuery1 do     //초기화....
       begin
            Close;
            SQL.Clear;
            SQL.Add('update pehevhis                ');
            SQL.Add('   set FinalGrade      = '''', ');
            SQL.Add('       ValuesGrade     = '''', ');
            SQL.Add('       AbilityscrGrade = '''', ');
            SQL.Add('       ResultscrGrade  = ''''  ');
            SQL.Add(' where rabasyear = :rabasyear  ');

            ParamByName('rabasyear').AsString := PPE_rabasyear.Text;
            ExecSQL;
       end;

       for I := 0 to Dest.Count - 1 do
       begin
            Convet(Data, Dest.Strings[I]);

            if (Data[1] <> '사번') and (Data[1] <> '') then
            begin
                 with OraQuery1 do //선택사원 업데이트..
                 begin
                      Close;
                      SQL.Clear;
                      SQL.Add('update pehevhis                ');
                      SQL.Add('   set FinalGrade      = '''', ');
                      SQL.Add('       ValuesGrade     = '''', ');
                      SQL.Add('       AbilityscrGrade = '''', ');
                      SQL.Add('       ResultscrGrade  = ''''  ');
                      SQL.Add(' where rabasyear = :rabasyear  ');
                      SQL.Add('   and empno     = :empno      ');

                      ParamByName('rabasyear').AsString       := PPE_rabasyear.Text;
                      ParamByName('empno').AsString           := Data[1];
                      ParamByName('finalgrade').AsString      := Data[2];
                      ParamByName('ValuesGrade').AsString     := Data[3];
                      ParamByName('abilityscrgrade').AsString := Data[4];
                      ParamByName('resultscrgrade').AsString  := Data[5];
                      ExecSQL;
                 end;
            end;
       end;
       Dest.Free;

       MessageDlg('◈완료◈ 하였습니다.',mtInformation,[mbOk],0);
  end;
end;

//dsa2000  2008.12  각 부문에서 선택한 사원의 순위를 저장하여  프린트 하기위하여 인력팀에서 엑셀을 받아 업로드 한다.
procedure TMainForm.BT_ChoiceClick(Sender: TObject);
var
  Dest: TStringList;
  I, J: Integer;
  Data: TAData;
  Excel_name: String;
begin
  if MessageDlg('엑셀자료를 저장하시겠습니까 ?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then  System.Exit;

  if FileOpenDlg.Execute then Excel_name := FileOpenDlg.FileName ;

  Dest := TStringList.Create;
  Dest.LoadFromFile(Excel_name);

  if Excel_name <> '' then
  begin
       with OraQuery1 do     //초기화....
       begin
            Close;
            SQL.Clear;
            SQL.Add('update pimupmas                          ');
            SQL.Add('   set choice     = ''''                 ');
            SQL.Add(' where rabasdate  = '''+ vRabasdate +''' ');
            ExecSQL;

            Close;
            SQL.Clear;
            SQL.Add('update pimupmas                           ');
            SQL.Add('   set edupointyn = ''N'',                ');
            SQL.Add('       upyn       = ''N''                 ');
            SQL.Add(' where rabasdate  = '''+ vRabasdate +'''  ');
            SQL.Add('   and edupoint   <  10                   ');    //교육포인트 미 충족자 초기화.
            ExecSQL;
       end;

       for I := 0 to Dest.Count - 1 do
       begin
            Convet(Data, Dest.Strings[I]);

            if (Data[1] <> '사번') and (Data[1] <> '') then
            begin
                 with OraQuery1 do //선택사원 : 부문추천순위, 교육포인트여부, 승격여부 업데이트..
                 begin
                      Close;
                      SQL.Clear;
                      SQL.Add('update pimupmas                          ');
                      SQL.Add('   set choice     = :choice,             ');
                      SQL.Add('       edupointyn = ''Y'',               ');
                      SQL.Add('       upyn       = ''Y''                ');
                      SQL.Add(' where rabasdate  = '''+ vRabasdate +''' ');
                      SQL.Add('   and empno      = :empno               ');

                      ParamByName('empno').AsString  := Data[1];
                      ParamByName('choice').AsString := Data[2];
                      ExecSQL;
                 end;
            end;
       end;
       Dest.Free;       
       MessageDlg('◈완료◈ 하였습니다.',mtInformation,[mbOk],0);
  end;
end;


procedure TMainForm.Chk_SilgradeClick(Sender: TObject);
begin
  if   Chk_Silgrade.Checked then
  begin
       Chk_Choice.Checked    := False;
       Chk_ChoiceAll.Checked := False;
       CB_Bumun.ItemIndex    := 5  //경영지원부문.
  end
  else CB_Bumun.ItemIndex    := 0; //전체
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
   Oraconnect;
end;

end.
