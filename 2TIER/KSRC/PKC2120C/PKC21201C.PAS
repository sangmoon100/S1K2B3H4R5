unit PKC21201C;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Gauges, Mask, Calen1, OnFocusButton, pass,
  ComCtrls, Db, MemDS, DBAccess, Ora, DBTables, Grids, DBGrids, Comobj,
  OnShapeLabel, OnGrDBGrid, OnMemDataset;

type
  TFM_PKC2120C = class(TForm)
    Panel19: TPanel;
    L_UserName: TLabel;
    L_CurDate: TLabel;
    Panel11: TPanel;
    Panel2: TPanel;
    Label11: TLabel;
    Panel1: TPanel;
    Panel13: TPanel;
    Panel5: TPanel;
    Panel4: TPanel;
    Panel6: TPanel;
    Image1: TImage;
    Panel7: TPanel;
    Image2: TImage;
    Panel12: TPanel;
    Image3: TImage;
    Panel15: TPanel;
    Panel16: TPanel;
    bt_print: TOnFocusButton;
    bt_excel: TOnFocusButton;
    bt_close: TOnFocusButton;
    SB_Help: TStatusBar;
    Ora_Session: TOraSession;
    Ora_Qry1: TOraQuery;
    bt_execute: TOnFocusButton;
    cbx_all: TCheckBox;
    Label1: TLabel;
    DataSource1: TDataSource;
    DBG_User: TDBGrid;
    StoredProc1: TOraStoredProc;
    med_yymm: TMaskEdit;
    ed_duty: TMaskEdit;
    SpeedButton2: TSpeedButton;
    l_duty: TLabel;
    Label2: TLabel;
    OnShapeLabel1: TOnShapeLabel;
    OnShapeLabel2: TOnShapeLabel;
    bt_delete: TOnFocusButton;
    OnGrDbGrid2: TOnGrDbGrid;
    Memo1: TMemo;
    Ora_Qry2: TOraQuery;
    MD_Data: TOnMemData;
    MD_Datachk: TStringField;
    MD_Datacodeno: TStringField;
    MD_Datacodename: TStringField;
    DataSource2: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton2Click(Sender: TObject);
    procedure bt_closeClick(Sender: TObject);
    procedure cbx_allClick(Sender: TObject);
    procedure bt_executeClick(Sender: TObject);
    procedure bt_previewClick(Sender: TObject);
    procedure bt_excelClick(Sender: TObject);
    //사용자 정의 함수
    procedure Query_Input;
    procedure Query_Output;
    procedure Query_Output_Excel;
    procedure bt_deleteClick(Sender: TObject);

    procedure Query_CodeInput;
    procedure OnGrDbGrid2CellClick(Column: TColumn);
    procedure bt_printClick(Sender: TObject);

    //    Function  FT_SWEEK(in_date : String) : String;
  private
    { Private declarations }
  public
     HomeDir      : String;
     P_SaveEmpno  : String;
     p_korname    : String;
     p_jobdept    : String;
     p_offitel    : String;
     password     : String;
     pDBUsrname   : String;
     pDBPass      : String;
     pSvrname     : String;
     pDBHostIP    : String;
     pInsa        : String;
     pNi          : String;

     FG_Empno     : String;
     FG_UserName  : String;
     FG_Date      : String;
     FG_AllDate   : Real;
     FG_PageCnt   : Integer;

     function  fGetTime(gubn : String) : String;
     procedure pErrCheck(Sender : TObject);
  end;

var
  FM_PKC2120C: TFM_PKC2120C;
  HomeDir   : string;

implementation

uses Codelib, PKC21202C;



{$R *.DFM}
function  TFM_PKC2120C.fGetTime(gubn : String) : String;
begin
   with Ora_Qry1 do
   begin
      Close;
      SQL.Clear;
      SQL.ADD(' SELECT TO_CHAR(SYSDATE,''YYYYMMDD'')   GSsysdate ');
      SQL.ADD('      , TO_CHAR(SYSDATE,''YYYYMM'') - 1 GSmonth   ');
      SQL.ADD('   FROM DUAL                                      ');
      Open;
      if gubn = '1' then FG_Date := FieldByName('GSsysdate').AsString
      else               FG_Date := FieldByName('GSmonth').AsString ;
      Close;
   end;
   Result := FG_Date;
end;

procedure TFM_PKC2120C.Query_CodeInput;
begin
   with Ora_Qry2 do
   begin
      Close;
      SQL.Clear;
      Sql.Add(' select codeid,codeno,codename,codefname,'''' chk from pyccode ');
      Sql.Add('  where nvl(useyn,''Y'') = ''Y''                      ');
      Sql.Add('    and codeid = ''I160''                      ');

      Open;
//      Close;
   end;


   MD_Data.Close;
   MD_Data.Open;

   MD_Data.DisableControls;

   while not Ora_Qry2.eof do
   begin
        MD_Data.Append;
        MD_Data.FieldByName('chk').AsString         := Ora_Qry2.FieldByName('chk').AsString;
        MD_Data.FieldByName('codeno').AsString      := Ora_Qry2.FieldByName('codeno').AsString;
        MD_Data.FieldByName('codename').AsString    := Ora_Qry2.FieldByName('codename').AsString;


        MD_Data.Post;
        Ora_Qry2.Next;
   end;

  MD_Data.EnableControls;
  MD_Data.first;
//   Result := FG_Date;

end;

procedure TFM_PKC2120C.FormCreate(Sender: TObject);
begin
  HomeDir      := HomeDirOpen;
  P_SaveEmpno  := PassEmp(cmdline,1);
  p_korname    := PassEmp(cmdline,2);
  pDBUsrname   := PassEmp(cmdline,5);
  pDBPass      := PassEmp(cmdline,6);
  pDBHostIP    := PassEmp(cmdline,7);
  pInsa        := PassEmp(cmdline,8);
  pNi          := PassEmp(cmdline,9);
  pSvrname     := PassEmp(cmdline,13);

//  Application.ProcessMessages;
  SB_Help.Panels[1].Text := ' 데이타베이스에 접속중입니다...';

  Ora_Session.Connected     := False;
  Ora_Session.ConnectPrompt := False;
  Ora_Session.Options.Net   := True;
  Ora_Session.Username      := pDBUsrname;//'hperson';
  Ora_Session.Password      := pDBPass;//'dbthfk';
  Ora_Session.Server        := pDBHostIP + ':' + pNi + ':' + pInsa ;//pSvrname + ':1522:insa';

  try
    Ora_Session.Connected  := True;

    SB_Help.Panels[1].Text := '....';
  except on E : Exception do
    Application.MessageBox(PChar('서버에 접속할 수 없습니다...'#13#13+ E.Message),'알 림',MB_OK);
  end;
  L_UserName.Caption := p_korname + '('
                      + P_SaveEmpno + ')';

  L_CurDate.Caption := Copy(fGetTime('1'), 1, 4) + '/'
                     + Copy(fGetTime('1'), 5, 2) + '/'
                     + Copy(fGetTime('1'), 7, 2) ;

  med_yymm.Text := Copy(fGetTime('2'), 1, 4) + '-'
                 + Copy(fGetTime('2'), 5, 2) ;
  Query_CodeInput;                 


end;

procedure TFM_PKC2120C.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Ora_Session.Connected := False;
   Action := caFree
end;


procedure TFM_PKC2120C.SpeedButton2Click(Sender: TObject);
begin
   if cbx_all.Checked then
   begin
      MessageBox(Handle, '먼저 전체 체크를 취소하세요..', '경고', MB_ICONWARNING);
      Exit;
   end;

   codeForm := TCodeForm.Create(self);
   try
     case TComponent(Sender).Tag of
        1 : begin
            codeForm.FormData := '근무지코드 열람';
            codeForm.DataVal1 := 'I160';
            codeForm.DataVal2 := ed_duty.Text;
            end;
     end;
     codeForm.ShowModal;

     if CodeForm.Code <> '' then begin
        case TComponent(Sender).Tag of
           1 : begin
                 l_duty.Caption    := CodeForm.Code;
                 ed_duty.Text      := CodeForm.CodeName;
               end;
        end;
     end;

   finally
      codeForm.Free;
   end;
end;

procedure TFM_PKC2120C.bt_closeClick(Sender: TObject);
begin
   Close;
end;

procedure TFM_PKC2120C.pErrCheck(Sender : TObject);
begin
   if med_yymm.Text = '' then
   begin
      MessageBox(Handle, '생성일자를 입력하세요.', '경고', MB_ICONWARNING);
      SB_Help.Panels[1].Text := '...';
      System.Exit;
   end;

   if TOnFocusButton(sender).Name = 'bt_execute' then
   begin
      with Ora_Qry1 do
      begin
         Close;
         SQL.Clear;
         SQL.ADD(' select 1 from PKHWORKT  ');
         SQL.ADD('  where c_yymm = :pc_yymm');
         ParamByName('pc_yymm').AsString := Copy(med_yymm.Text,1,4) + Copy(med_yymm.Text,6,2);
         Open;
         
         if RecordCount > 0 then
         begin
            MessageBox(Handle, '선택 된 월에는 이미 자료가 생성되었습니다.', '경고', MB_ICONWARNING);
            SB_Help.Panels[1].Text := '...';
            Abort;
         end;
      end;
      Exit;
   end;

{   if (not cbx_all.Checked) and (ed_duty.Text = '') then
   begin
      MessageBox(Handle, '근무지를 선택하세요.', '경고', MB_ICONWARNING);
      SB_Help.Panels[1].Text := '...';
      Abort;
   end;}

end;

procedure TFM_PKC2120C.cbx_allClick(Sender: TObject);
var
  i : Integer;
begin
{   if cbx_all.Checked then
   begin
     ed_duty.Text   := '';
     l_duty.Caption := '';
   end;}

  if not MD_Data.Active then MD_Data.Open;

  MD_Data.First;
  for i := 1 to MD_Data.RecordCount do
  begin
       MD_Data.Edit;
       if   cbx_all.Checked then MD_Data.FieldByName('chk').AsString := '◎'
       else                      MD_Data.FieldByName('chk').AsString := '';

       MD_Data.Post;
       MD_Data.Next;
  end;

end;

procedure TFM_PKC2120C.bt_executeClick(Sender: TObject);
begin
   SB_Help.Panels[1].Text := '실행 중입니다. 잠시 기다리세요..';

//   pErrCheck(Sender);

   Query_Input;
end;

procedure TFM_PKC2120C.Query_Input;
var
   iDate : Integer;
   fDate : Real;
   s_yymm : String;
   cnt_i, cnt_o : integer;
begin
   s_yymm := Copy(med_yymm.Text,1,4) + Copy(med_yymm.Text,6,2);

   // 해당월 정상근로일수 조회      FUNCTION : HPER.FT_SWEEK
   if StoredProc1.Prepared = False Then
      StoredProc1.Prepare;
   StoredProc1.ParamByName('IN_DATE').AsString :=  s_yymm;
   StoredProc1.Execproc;
   fDate := StoredProc1.ParamByName('Result').AsInteger;
   //////////////////////////////////////////////////////////////////////////

{
   with Ora_Qry1 do
   begin
      Close;
      SQL.Clear;
      SQL.Add('insert into PKHWORKT                                            ');
      SQL.Add('select ''' + s_yymm  + '''                            c_yymm  , ');//노동통계조사년월
      SQL.Add('       jobplace                                     jobplace  , ');//근무지코드
      SQL.Add('       (select codename from pyccode                            ');
      SQL.Add('       where codeid=''I160'' and codeno = jobplace) jobplacenm, ');//근무지명
      SQL.Add('       sex                                               sex  , ');//성별
      SQL.Add('       cnt_1                                             var1 , ');//전월
      SQL.Add('       decode(sign(cnt_2 - cnt_1),  1, cnt_2 - cnt_1, 0) var2 , ');//입직
      SQL.Add('       decode(sign(cnt_1 - cnt_2),  1, cnt_1 - cnt_2, 0) var3 , ');//이직
      SQL.Add('       cnt_2                                             var4 , ');//당월
      SQL.Add('       cnt_2 * :pDate                                    var5 , ');//정상출근
      SQL.Add('	      cnt_3                                             var6 , ');//휴일출근
      SQL.Add('      (cnt_2 * :pDate) * 8                               var7 , ');//정상근로
      SQL.Add('       cnt_4                                             var8 , ');//초과근로
      SQL.Add('       cnt_5_1                                           var9 , ');//정액
      SQL.Add('       cnt_5_3                                           var10, ');//초과
      SQL.Add('       cnt_5_4 + cnt_5_5                                 var11, ');//특별
      SQL.Add('       cnt_5_2                                           var12, ');//연차
      SQL.Add('       cnt_5_4                                           var13, ');//성과
      SQL.Add('       cnt_5_5                                           var14, ');//소급
      SQL.Add('       sysdate                                       writetime, ');
      SQL.Add('       ''' + P_SaveEmpno + '''                        writeemp, ');
      SQL.Add('       cnt_6                                             var15  ');//2016.05.24 eyha 미출근일수 추가
      SQL.Add('  from (select jobplace                                       , ');
      SQL.Add('               sex                                            , ');
      SQL.Add('               max(decode(gubn, ''1'', cnt1, ''0''))  cnt_1   , '); //--전월
      SQL.Add('               max(decode(gubn, ''2'', cnt1, ''0''))  cnt_2   , '); //--당월
      SQL.Add('               max(decode(gubn, ''3'', cnt1, ''0''))  cnt_3   , '); //--휴일출근
      SQL.Add('               max(decode(gubn, ''4'', cnt1, ''0''))  cnt_4   , '); //--초과근로
      SQL.Add('               max(decode(gubn, ''5'', cnt1, ''0''))  cnt_5_1 , '); //--정액급여
      SQL.Add('               max(decode(gubn, ''5'', cnt2, ''0''))  cnt_5_2 , '); //--연차
      SQL.Add('               max(decode(gubn, ''5'', cnt3, ''0''))  cnt_5_3 , '); //--초과
      SQL.Add('               max(decode(gubn, ''5'', cnt4, ''0''))  cnt_5_4 , '); //--상여
      SQL.Add('               max(decode(gubn, ''5'', cnt5, ''0''))  cnt_5_5 , '); //--소급
      SQL.Add('               max(decode(gubn, ''6'', cnt6, ''0''))  cnt_6     '); //2016.05.24 eyha 미출근일수 추가
      SQL.Add('         from (                                                 ');
                               // 전월
      SQL.Add('               select ''1''           gubn     ,                ');
      SQL.Add('                      a.workyymm      workyymm ,                ');
      SQL.Add('                      a.jobplace      jobplace ,                ');
      SQL.Add('                      a.sex           sex      ,                ');
      SQL.Add('                      sum(1)          cnt1     ,                ');
      SQL.Add('                      1               cnt2     ,                ');
      SQL.Add('                      1               cnt3     ,                ');
      SQL.Add('                      1               cnt4     ,                ');
      SQL.Add('                	     1               cnt5     ,                ');
      SQL.Add('                	     1               cnt6                      ');
      SQL.Add('                 from pihpmas a, pkhphis b                      ');
      SQL.Add('                where a.workyymm =to_char(add_months(to_date(:pc_yymm,''YYYYMM''),-1),''YYYYMM'')                 ');
      SQL.Add('                  and a.sex in (''F'',''M'')                    ');
      SQL.Add('                  and a.empno = b.empno                         ');
      SQL.Add('                  and a.workyymm = b.paydate                    ');
      SQL.Add('                  and ( replace(jobplace,'' '','''') is not null');
      SQL.Add('                        and jobplace is not null )              ');
      SQL.Add('                group by a.workyymm, a.jobplace, a.sex          ');
                                 // 당월말 근로자수
      SQL.Add('                union all                                       ');
      SQL.Add('               select ''2''           gubn     ,                ');
      SQL.Add('                      a.workyymm      workyymm ,                ');
      SQL.Add('                      a.jobplace      jobplace ,                ');
      SQL.Add('                      a.sex           sex      ,                ');
      SQL.Add('                      sum(1)          cnt1     ,                ');
      SQL.Add('                      1               cnt2     ,                ');
      SQL.Add('                      1               cnt3     ,                ');
      SQL.Add('                      1               cnt4     ,                ');
      SQL.Add('                	     1               cnt5     ,                ');
      SQL.Add('                	     1               cnt6                      ');
      SQL.Add('                 from pihpmas a, pkhphis b                      ');
      SQL.Add('                where a.workyymm = :pc_yymm                     ');
      SQL.Add('                  and a.sex in (''F'',''M'')                    ');
      SQL.Add('                  and a.empno = b.empno                         ');
      SQL.Add('                  and a.workyymm = b.paydate                    ');
      SQL.Add('                  and ( replace(jobplace,'' '','''') is not null');
      SQL.Add('                        and jobplace is not null )              ');
      SQL.Add('                group by a.workyymm, a.jobplace, a.sex          ');
                              // 휴일출근일수
      SQL.Add('                union all                                       ');
      SQL.Add('               select /*+ index(b i1_pihpmas) */                ');
      SQL.Add('                      ''3''       gubn     ,                    ');
      SQL.Add('                      c.paydate   workyymm ,                    ');
      SQL.Add('             	        b.jobplace  jobplace ,                    ');
      SQL.Add('                      b.sex       sex      ,                    ');
      SQL.Add('                      sum(ovtmhh)     cnt1     ,                ');
      SQL.Add('                    	 1               cnt2     ,                ');
      SQL.Add('                  	   1               cnt3     ,                ');
      SQL.Add('                 	   1               cnt4     ,                ');
      SQL.Add('                	     1               cnt5     ,                ');
      SQL.Add('                	     1               cnt6                      ');
      SQL.Add('                 from pkhothis a, pihpmas b, pkhphis c          ');
      SQL.Add('                where a.empno = b.empno                         ');
      SQL.Add('                  and a.empno = c.empno                         ');
      SQL.Add('                  and b.sex in (''F'',''M'')                    ');
      SQL.Add('             	    and c.paydate =:pc_yymm                       ');
      SQL.Add('                  and ovtmdate like :pc_yymm||''%''             ');
      SQL.Add('                  and b.workyymm = c.paydate                    ');
      SQL.Add('                  and ( to_char(to_date(OVTMDATE,''YYYYMMDD''),''d'') IN (''1'',''7'') ');
      SQL.Add('                        or  SUBSTR(OVTMDATE,7,2) = ''00'' )     ');
      SQL.Add('                  and conyn  = ''Y''                            ');
      SQL.Add('                  and ( replace(jobplace,'' '','''') is not null');
      SQL.Add('                        and jobplace is not null )              ');
      SQL.Add('                group by c.paydate, b.jobplace, b.sex           ');
      SQL.Add('                union all                                       ');
                               // 초과근무
      SQL.Add('               select /*+ index(b i1_pihpmas) */                ');
      SQL.Add('                      ''4''        gubn       ,                 ');
      SQL.Add('                      c.paydate   workyymm   ,                  ');
      SQL.Add('                      b.jobplace  jobplace   ,                  ');
      SQL.Add('                      b.sex       sex        ,                  ');
      SQL.Add('                      sum(ovtmhh) cnt1       ,                  ');
      SQL.Add('                 	1           cnt2       ,                     ');
      SQL.Add('                  	1           cnt3       ,                     ');
      SQL.Add('                 	1           cnt4       ,                     ');
      SQL.Add('                 	1           cnt5       ,                     ');
      SQL.Add('                 	1           cnt6                             ');
      SQL.Add('                 from pkhothis a, pihpmas b, pkhphis c          ');
      SQL.Add('                where a.empno = b.empno                         ');
      SQL.Add('                  and a.empno = c.empno                         ');
      SQL.Add('                  and paydate =:pc_yymm                         ');
      SQL.Add('                  and ovtmdate like :pc_yymm||''%''             ');
      SQL.Add('                  and conyn =''Y''                              ');
      SQL.Add('                  and b.sex in (''F'',''M'')                    ');
      SQL.Add('                  and ( replace(jobplace,'' '','''') is not null');
      SQL.Add('                        and jobplace is not null )              ');
      SQL.Add('                  and b.workyymm = c.paydate                    ');
      SQL.Add('                group by c.paydate, b.jobplace, b.sex           ');
                                //월급여액
      SQL.Add('                union all                                       ');
      SQL.Add('               select ''5''       ,                             ');
      SQL.Add('                      b.workyymm  ,                             ');
      SQL.Add('                      b.jobplace  ,                             ');
      SQL.Add('                      b.sex       ,                             ');
      SQL.Add('                      sum(paysum-(ovtmamt+quaterpay+holipay+sbonamt+TAXPAY+NOTAXPAY+MEDSUPAMT+HOMESUPAMT)) cnt1,');//--정액급여  kth 2011.04.14 김현순 메니져 요청으로 비과세 삭제
      SQL.Add('                      sum(ybonamt)                   cnt2,      ');//--연차
      SQL.Add('        	             sum(ovtmamt)                   cnt3,      ');//--초과
      SQL.Add('            	     sum(quaterpay+holipay+sbonamt+TAXPAY+NOTAXPAY+MEDSUPAMT+HOMESUPAMT) cnt4,      ');//--상여
      SQL.Add('                      sum(sopaysum)                  cnt5,       ');//--소급
      SQL.Add('                 	   1           cnt6                          ');
      SQL.Add('                 from pkhphis a ,pihpmas b                      ');
      SQL.Add('                where paydate = :pc_yymm                        ');
      SQL.Add('                  and a.empno = b.empno                         ');
      SQL.Add('                  and b.sex in (''F'',''M'')                    ');
      SQL.Add('                  and ( replace(jobplace,'' '','''') is not null');
      SQL.Add('                        and jobplace is not null )              ');
      SQL.Add('                  and b.workyymm = a.paydate                    ');
      SQL.Add('                group by b.workyymm ,b.jobplace, b.sex          ');
      SQL.Add('                union all                                       ');
                              //2016.05.24 eyha 미출근 일수 추가
      SQL.Add('               select ''6''       ,                             ');
      SQL.Add('                      b.workyymm  ,                             ');
      SQL.Add('                      b.jobplace  ,                             ');
      SQL.Add('                      b.sex       ,                             ');
      SQL.Add('                      1                   cnt1,                 ');
      SQL.Add('                      1                   cnt2,                 ');
      SQL.Add('        	             1                   cnt3,                 ');
      SQL.Add('            	         1                   cnt4,                 ');
      SQL.Add('                      1                   cnt5,                 ');
      SQL.Add('                 	   SUM(NVL(A.SPECIAL  ,0)+NVL(A.LONGWORK ,0)+NVL(A.PUBVAC   ,0)+NVL(A.PUBSICK  ,0)+NVL(A.BEAR     ,0)+ ');
      SQL.Add('                 	       NVL(A.CELEB    ,0)+NVL(A.BIRTH    ,0)+NVL(A.HEALTH   ,0)+NVL(A.HALF     ,0)+NVL(A.MONTH    ,0)+ ');
      SQL.Add('                 	       NVL(A.YEAR     ,0)+NVL(a.PRIZE    ,0)+NVL(a.SICK     ,0)+NVL(a.ABSENCE  ,0)+NVL(a.ABSENCE2 ,0)+ ');
      SQL.Add('                 	       NVL(A.WALKOUT  ,0)) CNT6 ');
      SQL.Add('                 from PKHDUTY A ,PIHPMAS B, PKHPHIS C                        ');
      SQL.Add('                where A.DUYYMM = :PC_YYMM                       ');
      SQL.Add('                  AND A.DUYYMM = B.WORKYYMM                     ');
      SQL.Add('                  and a.empno = b.empno                         ');
      SQL.Add('                  and b.sex in (''F'',''M'')                    ');
      SQL.Add('                  and ( replace(jobplace,'' '','''') is not null');
      SQL.Add('                        and jobplace is not null )              ');
      SQL.Add('                  AND A.DUYYMM = c.paydate                      ');
      SQL.Add('                  and a.empno = c.empno                         ');
      SQL.Add('                group by b.workyymm ,b.jobplace, b.sex       )  ');
      SQL.Add('          group by sex, jobplace )                              ');
      ParamByName('pc_yymm').AsString := s_yymm;
      ParamByName('pdate').AsFloat    := fDate;// SP1.ParamByName('Result').AsFloat;
//      sql.savetofile('c:\ha_20160524_1.sql');
      EXECSQL;
      SB_Help.Panels[1].Text := '정상적으로 생성되었습니다.';
   end;
}

   with Ora_Qry1 do
   begin
      //20180919 jhg 전월근로자에서 입직기타제외,이직기타(휴직)제외하기 위해 갯수 추출
      Close;
      SQL.Clear;
      SQL.ADD(' select count(*) cnt from PIHANNO     ');
      SQL.ADD('  where ANFRDATE LIKE to_char(add_months(to_date(:pc_yymm, ''YYYYMM''),-1), ''YYYYMM'')||''%'' ');
      SQL.ADD('    and EMPNO not like ''Y%''     ');
      SQL.ADD('    and ancode = ''514''              ');
      ParamByName('pc_yymm').AsString := Copy(med_yymm.Text,1,4) + Copy(med_yymm.Text,6,2);
      Open;
      cnt_i := fieldbyName('cnt').asInteger;

      Close;
      SQL.Clear;
      SQL.ADD(' select count(*) cnt from PIHANNO                ');
      SQL.ADD('  where ANFRDATE LIKE to_char(add_months(to_date(:pc_yymm, ''YYYYMM''),-1), ''YYYYMM'')||''%''  ');
      SQL.ADD('    and EMPNO not like ''Y%''                ');
      SQL.ADD('    and ancode in (''71'',''72'',''7C'',''78'')  ');
      ParamByName('pc_yymm').AsString := Copy(med_yymm.Text,1,4) + Copy(med_yymm.Text,6,2);
      Open;
      cnt_o := fieldbyName('cnt').asInteger;


      Close;
      SQL.Clear;
      SQL.Add(' insert into PKHWORKT                                            ');
      SQL.Add(' select ''' + s_yymm + '''                             c_yymm  , ');
      SQL.Add('        jobplace                                     jobplace  , ');
      SQL.Add('       (select codename from pyccode                             ');
      SQL.Add('         where codeid=''I160'' and codeno = jobplace) jobplacenm,');
      SQL.Add('        sex                                               sex  , ');
      SQL.Add('        cnt_1 - cnt_12                                    var1 , '); //전월 (휴직자제외)
      SQL.Add('        cnt_7 + cnt_8                                     var2 , '); //입직 총계
      SQL.Add('        cnt_9 + cnt_10 + cnt_11                           var3 , '); //이직 총계
      SQL.Add('        cnt_1 - cnt_12 + cnt_7 + cnt_8 - (cnt_9+cnt_10+cnt_11)     var4 , '); //당월
      SQL.Add('        cnt_2 * :pDate                                    var5 , ');
      SQL.Add('	       cnt_3                                             var6 , ');
      SQL.Add('       (cnt_2 * :pDate) * 8                               var7 , ');
      SQL.Add('        cnt_4                                             var8 , ');
      SQL.Add('        cnt_5_1                                           var9 , ');
      SQL.Add('        cnt_5_3                                           var10, ');
      SQL.Add('        cnt_5_4 + cnt_5_5                                 var11, ');
      SQL.Add('        cnt_5_2                                           var12, ');
      SQL.Add('        cnt_5_4                                           var13, ');
      SQL.Add('        cnt_5_5                                           var14, ');
      SQL.Add('        sysdate                                       writetime, ');
      SQL.Add('        ''' + P_SaveEmpno + '''                        writeemp, ');
      SQL.Add('        cnt_6                                             var15, ');
      SQL.Add('        cnt_7                                             var16, ');
      SQL.Add('        cnt_8                                             var17, ');
      SQL.Add('        cnt_9                                             var18, ');
      SQL.Add('        cnt_10                                            var19, ');
      SQL.Add('        cnt_11                                            var20  ');
      SQL.Add('  from (select jobplace                                        , ');
      SQL.Add('               sex                                             , ');
      SQL.Add('               max(decode(gubn, ''1'',  cnt1,  ''0'')) cnt_1   , ');
      SQL.Add('               max(decode(gubn, ''2'',  cnt1,  ''0'')) cnt_2   , ');
      SQL.Add('               max(decode(gubn, ''3'',  cnt1,  ''0'')) cnt_3   , ');
      SQL.Add('               max(decode(gubn, ''4'',  cnt1,  ''0'')) cnt_4   , ');
      SQL.Add('               max(decode(gubn, ''5'',  cnt1,  ''0'')) cnt_5_1 , ');
      SQL.Add('               max(decode(gubn, ''5'',  cnt2,  ''0'')) cnt_5_2 , ');
      SQL.Add('               max(decode(gubn, ''5'',  cnt3,  ''0'')) cnt_5_3 , ');
      SQL.Add('               max(decode(gubn, ''5'',  cnt4,  ''0'')) cnt_5_4 , ');
      SQL.Add('               max(decode(gubn, ''5'',  cnt5,  ''0'')) cnt_5_5 , ');
      SQL.Add('               max(decode(gubn, ''6'',  cnt6,  ''0'')) cnt_6   , ');
      SQL.Add('               max(decode(gubn, ''7'',  cnt7,  ''0'')) cnt_7   , ');
      SQL.Add('               max(decode(gubn, ''8'',  cnt8,  ''0'')) cnt_8   , ');
      SQL.Add('               max(decode(gubn, ''9'',  cnt9,  ''0'')) cnt_9   , ');
      SQL.Add('               max(decode(gubn, ''10'', cnt10, ''0'')) cnt_10  , ');
      SQL.Add('               max(decode(gubn, ''11'', cnt11, ''0'')) cnt_11  , ');
      SQL.Add('               max(decode(gubn, ''12'', cnt12, ''0'')) cnt_12  , ');
      SQL.Add('               max(decode(gubn, ''13'', cnt13, ''0'')) cnt_13    ');
      SQL.Add('         from (                                                  ');
      SQL.Add('               select ''1''           gubn     ,                 ');
      SQL.Add('                      a.workyymm      workyymm ,                 ');
      SQL.Add('                      a.jobplace      jobplace ,                 ');
      SQL.Add('                      a.sex           sex      ,                 ');
      SQL.Add('                      sum(1)          cnt1     ,                 ');
      SQL.Add('                      1               cnt2     ,                 ');
      SQL.Add('                      1               cnt3     ,                 ');
      SQL.Add('                      1               cnt4     ,                 ');
      SQL.Add('                      1               cnt5     ,                 ');
      SQL.Add('                      1               cnt6     ,                 ');
      SQL.Add('                      1               cnt7     ,                 ');
      SQL.Add('                      1               cnt8     ,                 ');
      SQL.Add('                      1               cnt9     ,                 ');
      SQL.Add('                      1               cnt10    ,                 ');
      SQL.Add('                      1               cnt11    ,                 ');
      SQL.Add('                      1               cnt12    ,                 ');
      SQL.Add('                      1               cnt13                      ');
      SQL.Add('                 from pihpmas a                                  ');
      SQL.Add('                where a.workyymm = to_char(add_months(to_date(:pc_yymm, ''YYYYMM''),-1), ''YYYYMM'') ');
      SQL.Add('                  and a.sex in (''F'',''M'')                     ');
      SQL.Add('                  AND a.EMPNO not like ''Y%''                    ');
      SQL.Add('                  and a.PSTATE < ''80''                          ');
      SQL.Add('                  and a.PSTATEYN = ''Y''                         ');
      SQL.Add('                  and ( replace(jobplace,'' '','''') is not null ');
      SQL.Add('                        and jobplace is not null )               ');
      SQL.Add('                group by a.workyymm, a.jobplace, a.sex           ');
      SQL.Add('                union all                                        ');
      SQL.Add('               select ''2''           gubn     ,                 ');
      SQL.Add('                      a.workyymm      workyymm ,                 ');
      SQL.Add('                      a.jobplace      jobplace ,                 ');
      SQL.Add('                      a.sex           sex      ,                 ');
      SQL.Add('                      sum(1)          cnt1     ,                 ');
      SQL.Add('                      1               cnt2     ,                 ');
      SQL.Add('                      1               cnt3     ,                 ');
      SQL.Add('                      1               cnt4     ,                 ');
      SQL.Add('                	     1               cnt5     ,                 ');
      SQL.Add('                	     1               cnt6     ,                 ');
      SQL.Add('                      1               cnt7     ,                 ');
      SQL.Add('                      1               cnt8     ,                 ');
      SQL.Add('                      1               cnt9     ,                 ');
      SQL.Add('                	     1               cnt10    ,                 ');
      SQL.Add('                	     1               cnt11    ,                 ');
      SQL.Add('                      1               cnt12    ,                 ');
      SQL.Add('                      1               cnt13                      ');
      SQL.Add('                 from pihpmas a, pkhphis b                       ');
      SQL.Add('                where a.workyymm = :pc_yymm                      ');
      SQL.Add('                  and a.sex in (''F'',''M'')                     ');
      SQL.Add('                  and a.empno = b.empno                          ');
// 20181022 csi HR고도화
//      SQL.Add('                  and a.workyymm = b.paydate                     ');
      SQL.Add('                  and a.workyymm = SUBSTR(b.paydate,1,6)        ');
      SQL.Add('                  and ( replace(jobplace,'' '','''') is not null ');
      SQL.Add('                        and jobplace is not null )               ');
      SQL.Add('                group by a.workyymm, a.jobplace, a.sex           ');
      SQL.Add('                union all                                        ');
      SQL.Add('               select /*+ index(b i1_pihpmas) */                 ');
      SQL.Add('                      ''3''       gubn      ,                    ');
// 20181022 csi HR고도화
//      SQL.Add('                      c.paydate   workyymm  ,                    ');
      SQL.Add('                      SUBSTR(c.paydate,1,6)   workyymm ,         ');

      SQL.Add('             	     b.jobplace  jobplace  ,                    ');
      SQL.Add('                      b.sex       sex       ,                    ');
      SQL.Add('                      sum(ovtmhh)     cnt1  ,                    ');
      SQL.Add('                      1               cnt2  ,                    ');
      SQL.Add('                      1               cnt3  ,                    ');
      SQL.Add('                      1               cnt4  ,                    ');
      SQL.Add('                	     1               cnt5  ,                    ');
      SQL.Add('                	     1               cnt6  ,                    ');
      SQL.Add('                      1               cnt7  ,                    ');
      SQL.Add('                      1               cnt8  ,                    ');
      SQL.Add('                      1               cnt9  ,                    ');
      SQL.Add('                	     1               cnt10 ,                    ');
      SQL.Add('                	     1               cnt11 ,                    ');
      SQL.Add('                      1               cnt12 ,                    ');
      SQL.Add('                      1               cnt13                      ');
      SQL.Add('                 from pkhothis a, pihpmas b, pkhphis c           ');
      SQL.Add('                where a.empno = b.empno                          ');
      SQL.Add('                  and a.empno = c.empno                          ');
      SQL.Add('                  and b.sex in (''F'',''M'')                     ');
// 20181022 csi HR고도화
//      SQL.Add('             	 and c.paydate = :pc_yymm                       ');
      SQL.Add('             	 and SUBSTR(c.paydate,1,6) = :pc_yymm           ');

      SQL.Add('                  and ovtmdate like :pc_yymm||''%''              ');
// 20181022 csi HR고도화
//      SQL.Add('                  and b.workyymm = c.paydate                     ');
      SQL.Add('                  and b.workyymm = SUBSTR(c.paydate,1,6)        ');

      SQL.Add('                  and ( to_char(to_date(OVTMDATE,''YYYYMMDD''),''d'') IN (''1'',''7'') ');
      SQL.Add('                        or SUBSTR(OVTMDATE,7,2) = ''00'' )       ');
      SQL.Add('                  and conyn = ''Y''                              ');
      SQL.Add('                  and ( replace(jobplace,'' '','''') is not null ');
      SQL.Add('                        and jobplace is not null )               ');
// 20181022 csi HR고도화
//      SQL.Add('                group by c.paydate, b.jobplace, b.sex            ');
      SQL.Add('                group by substr(c.paydate,1,6), b.jobplace, b.sex  ');

      SQL.Add('                union all                                        ');
      SQL.Add('               select /*+ index(b i1_pihpmas) */                 ');
      SQL.Add('                      ''4''       gubn       ,                   ');
// 20181022 csi HR고도화
//    SQL.Add('                      c.paydate   workyymm   ,                   ');
      SQL.Add('                      SUBSTR(c.paydate,1,6)   workyymm   ,       ');

      SQL.Add('                      b.jobplace  jobplace   ,                   ');
      SQL.Add('                      b.sex       sex        ,                   ');
      SQL.Add('                      sum(ovtmhh) cnt1       ,                   ');
      SQL.Add('                      1           cnt2       ,                   ');
      SQL.Add('                      1           cnt3       ,                   ');
      SQL.Add('                      1           cnt4       ,                   ');
      SQL.Add('                      1           cnt5       ,                   ');
      SQL.Add('                      1           cnt6       ,                   ');
      SQL.Add('                      1           cnt7       ,                   ');
      SQL.Add('                      1           cnt8       ,                   ');
      SQL.Add('                      1           cnt9       ,                   ');
      SQL.Add('                	     1           cnt10      ,                   ');
      SQL.Add('                	     1           cnt11      ,                   ');
      SQL.Add('                      1           cnt12      ,                   ');
      SQL.Add('                      1           cnt13                          ');
      SQL.Add('                 from pkhothis a, pihpmas b, pkhphis c           ');
      SQL.Add('                where a.empno = b.empno                          ');
      SQL.Add('                  and a.empno = c.empno                          ');
      SQL.Add('                  and c.paydate  like :pc_yymm||''%''            '); //20181113 jhg
      SQL.Add('                  and a.ovtmdate like :pc_yymm||''%''            '); //20181113 jhg
      SQL.Add('                  and a.conyn = ''Y''                            '); //20181113 jhg
      SQL.Add('                  and b.sex in (''F'',''M'')                     ');
      SQL.Add('                  and ( replace(jobplace,'' '','''') is not null ');
      SQL.Add('                        and jobplace is not null )               ');
// 20181022 csi HR고도화
//    SQL.Add('                  and b.workyymm = c.paydate                     ');
      SQL.Add('                  and b.workyymm = SUBSTR(c.paydate,1,6)        ');

//      SQL.Add('                group by c.paydate, b.jobplace, b.sex            ');
      SQL.Add('                group by substr(c.paydate,1,6), b.jobplace, b.sex  ');

      SQL.Add('                union all                                        ');
      SQL.Add('               select ''5''           gubn    ,                  ');
      SQL.Add('                      b.workyymm      workyymm,                  ');
      SQL.Add('                      b.jobplace      jobplace,                  ');
      SQL.Add('                      b.sex           sex     ,                  ');
      SQL.Add('                      sum(paysum-(ovtmamt+quaterpay+holipay+sbonamt+TAXPAY+NOTAXPAY+MEDSUPAMT+HOMESUPAMT)) cnt1,   ');
      SQL.Add('                      sum(ybonamt)    cnt2    ,                  ');
      SQL.Add('        	             sum(ovtmamt)    cnt3    ,                  ');
      SQL.Add('            	     sum(quaterpay+holipay+sbonamt+TAXPAY+NOTAXPAY+MEDSUPAMT+HOMESUPAMT) cnt4, ');
      SQL.Add('                      sum(sopaysum)   cnt5    ,                  ');
      SQL.Add('                      1               cnt6    ,                  ');
      SQL.Add('                      1               cnt7    ,                  ');
      SQL.Add('                      1               cnt8    ,                  ');
      SQL.Add('                      1               cnt9    ,                  ');
      SQL.Add('                	     1               cnt10   ,                  ');
      SQL.Add('                	     1               cnt11   ,                  ');
      SQL.Add('                      1               cnt12   ,                  ');
      SQL.Add('                      1               cnt13                      ');
      SQL.Add('                 from pkhphis a, pihpmas b                       ');
// 20181022 csi HR고도화
//    SQL.Add('                where paydate = :pc_yymm                         ');
      SQL.Add('                where substr(a.paydate,1,6) = :pc_yymm             ');

      SQL.Add('                  and a.empno = b.empno                          ');
      SQL.Add('                  and b.sex in (''F'',''M'')                     ');
      SQL.Add('                  and ( replace(jobplace,'' '','''') is not null ');
      SQL.Add('                        and jobplace is not null )               ');
// 20181022 csi HR고도화
//    SQL.Add('                  and b.workyymm = a.paydate                     ');
      SQL.Add('                  and b.workyymm = substr(a.paydate,1,6)                     ');

      SQL.Add('                group by b.workyymm, b.jobplace, b.sex           ');
      SQL.Add('                union all                                        ');
      SQL.Add('               select ''6''       gubn,                          ');
      SQL.Add('                      b.workyymm  ,                              ');
      SQL.Add('                      b.jobplace  ,                              ');
      SQL.Add('                      b.sex       ,                              ');
      SQL.Add('                      1               cnt1     ,                 ');
      SQL.Add('                      1               cnt2     ,                 ');
      SQL.Add('        	             1               cnt3     ,                 ');
      SQL.Add('            	     1               cnt4     ,                 ');
      SQL.Add('                      1               cnt5     ,                 ');
      SQL.Add('                      SUM(NVL(A.SPECIAL  ,0)+NVL(A.LONGWORK ,0)+NVL(A.PUBVAC   ,0)+NVL(A.PUBSICK  ,0)+NVL(A.BEAR     ,0)+   ');
      SQL.Add('                          NVL(A.CELEB    ,0)+NVL(A.BIRTH    ,0)+NVL(A.HEALTH   ,0)+NVL(A.HALF     ,0)+NVL(A.MONTH    ,0)+   ');
      SQL.Add('                          NVL(A.YEAR     ,0)+NVL(a.PRIZE    ,0)+NVL(a.SICK     ,0)+NVL(a.ABSENCE  ,0)+NVL(a.ABSENCE2 ,0)+   ');
      SQL.Add('                          NVL(A.WALKOUT  ,0)) CNT6 ,             ');
      SQL.Add('                      1               cnt7     ,                 ');
      SQL.Add('                      1               cnt8     ,                 ');
      SQL.Add('                      1               cnt9     ,                 ');
      SQL.Add('                	     1               cnt10    ,                 ');
      SQL.Add('                	     1               cnt11    ,                 ');
      SQL.Add('                      1               cnt12    ,                 ');
      SQL.Add('                      1               cnt13                      ');
      SQL.Add('                 from PKHDUTY A, PIHPMAS B, PKHPHIS C            ');
      SQL.Add('                where A.DUYYMM = :pc_yymm                        ');
      SQL.Add('                  AND A.DUYYMM = B.WORKYYMM                      ');
      SQL.Add('                  and a.empno = b.empno                          ');
      SQL.Add('                  and b.sex in (''F'',''M'')                     ');
      SQL.Add('                  and ( replace(jobplace,'' '','''') is not null ');
      SQL.Add('                        and jobplace is not null )               ');
// 20181022 csi HR고도화
//      SQL.Add('                  AND A.DUYYMM = c.paydate                       ');
      SQL.Add('                  AND A.DUYYMM = substr(c.paydate,1,6)                      ');
      SQL.Add('                  and a.empno = c.empno                          ');
      SQL.Add('                group by b.workyymm, b.jobplace, b.sex           ');
      SQL.Add('                union all                                        ');
      SQL.Add('               select ''7''           gubn     ,                 ');
      SQL.Add('                      a.workyymm      workyymm ,                 ');
      SQL.Add('                      a.jobplace      jobplace ,                 ');
      SQL.Add('                      a.sex           sex      ,                 ');
      SQL.Add('                      1               cnt1     ,                 ');
      SQL.Add('                      1               cnt2     ,                 ');
      SQL.Add('                      1               cnt3     ,                 ');
      SQL.Add('                      1               cnt4     ,                 ');
      SQL.Add('                      1               cnt5     ,                 ');
      SQL.Add('                      1               cnt6     ,                 ');
      SQL.Add('                      sum(1)          cnt7     ,                 ');
      SQL.Add('                      1               cnt8     ,                 ');
      SQL.Add('                      1               cnt9     ,                 ');
      SQL.Add('                      1               cnt10    ,                 ');
      SQL.Add('                      1               cnt11    ,                 ');
      SQL.Add('                      1               cnt12    ,                 ');
      SQL.Add('                      1               cnt13                      ');
      SQL.Add('                 from pihpmas a, PIHANNO C                       ');
      SQL.Add('                where a.workyymm = :pc_yymm                      ');
      SQL.Add('                  and a.sex in (''F'',''M'')                     ');
      SQL.Add('                  and a.empno not like ''Y%''                    ');
      SQL.Add('                  and (replace(jobplace,'' '','''') is not null  ');
      SQL.Add('                       and jobplace is not null )                ');
      SQL.Add('                  and a.empno = c.empno                          ');
      SQL.Add('                  and c.ANFRDATE like a.workyymm||''%''          ');
      SQL.Add('                  and c.ANCODE IN (''111'',''131'')              ');
      SQL.Add('                group by a.workyymm, a.jobplace, a.sex           ');
      SQL.Add('                union all                                        ');
      SQL.Add('               select ''8''           gubn     ,                 ');
      SQL.Add('                      a.workyymm      workyymm ,                 ');
      SQL.Add('                      a.jobplace      jobplace ,                 ');
      SQL.Add('                      a.sex           sex      ,                 ');
      SQL.Add('                      1               cnt1     ,                 ');
      SQL.Add('                      1               cnt2     ,                 ');
      SQL.Add('                      1               cnt3     ,                 ');
      SQL.Add('                      1               cnt4     ,                 ');
      SQL.Add('                      1               cnt5     ,                 ');
      SQL.Add('                      1               cnt6     ,                 ');
      SQL.Add('                      1               cnt7     ,                 ');
      SQL.Add('                      sum(1)          cnt8     ,                 ');
      SQL.Add('                      1               cnt9     ,                 ');
      SQL.Add('                      1               cnt10    ,                 ');
      SQL.Add('                      1               cnt11    ,                 ');
      SQL.Add('                      1               cnt12    ,                 ');
      SQL.Add('                      1               cnt13                      ');
      SQL.Add('                 from pihpmas a, PIHANNO C                       ');
      SQL.Add('                where a.workyymm = :pc_yymm                      ');
      SQL.Add('                  and a.empno not like ''Y%''                    ');
      SQL.Add('                  and (replace(jobplace,'' '','''') is not null  ');
      SQL.Add('                       and jobplace is not null)                 ');
      SQL.Add('                  and a.empno = c.empno                          ');
      SQL.Add('                  and c.ANFRDATE like a.workyymm||''%''          ');
      SQL.Add('                  and c.ANCODE = ''514''                         ');
      SQL.Add('                group by a.workyymm, a.jobplace, a.sex           ');
      SQL.Add('                union all                                        ');
      SQL.Add('               select ''9''             gubn   ,                 ');
      SQL.Add('                      a.workyymm      workyymm ,                 ');
      SQL.Add('                      a.jobplace      jobplace ,                 ');
      SQL.Add('                      a.sex           sex      ,                 ');
      SQL.Add('                      1               cnt1     ,                 ');
      SQL.Add('                      1               cnt2     ,                 ');
      SQL.Add('                      1               cnt3     ,                 ');
      SQL.Add('                      1               cnt4     ,                 ');
      SQL.Add('                      1               cnt5     ,                 ');
      SQL.Add('                      1               cnt6     ,                 ');
      SQL.Add('                      1               cnt7     ,                 ');
      SQL.Add('                      1               cnt8     ,                 ');
      SQL.Add('                      sum(1)          cnt9     ,                 ');
      SQL.Add('                      1               cnt10    ,                 ');
      SQL.Add('                      1               cnt11    ,                 ');
      SQL.Add('                      1               cnt12    ,                 ');
      SQL.Add('                      1               cnt13                      ');
      SQL.Add('                 from pihpmas a, PIHANNO C                       ');
      SQL.Add('                where a.workyymm = :pc_yymm                      ');
      SQL.Add('                  and a.empno not like ''Y%''                    ');
      SQL.Add('                  and (replace(jobplace,'' '','''') is not null  ');
      SQL.Add('                       and jobplace is not null)                 ');
      SQL.Add('                  and a.empno = c.empno                          ');
      SQL.Add('                  and c.ANFRDATE like a.workyymm||''%''          ');
      SQL.Add('                  and c.ANDETCODE = ''91''                       ');
      SQL.Add('                group by a.workyymm, a.jobplace ,a.sex           ');
      SQL.Add('                union all                                        ');
      SQL.Add('               select ''10''          gubn     ,                 ');
      SQL.Add('                      a.workyymm      workyymm ,                 ');
      SQL.Add('                      a.jobplace      jobplace ,                 ');
      SQL.Add('                      a.sex           sex      ,                 ');
      SQL.Add('                      1               cnt1     ,                 ');
      SQL.Add('                      1               cnt2     ,                 ');
      SQL.Add('                      1               cnt3     ,                 ');
      SQL.Add('                      1               cnt4     ,                 ');
      SQL.Add('                      1               cnt5     ,                 ');
      SQL.Add('                      1               cnt6     ,                 ');
      SQL.Add('                      1               cnt7     ,                 ');
      SQL.Add('                      1               cnt8     ,                 ');
      SQL.Add('                      1               cnt9     ,                 ');
      SQL.Add('                      sum(1)          cnt10    ,                 ');
      SQL.Add('                      1               cnt11    ,                 ');
      SQL.Add('                      1               cnt12    ,                 ');
      SQL.Add('                      1               cnt13                      ');
      SQL.Add('                 from pihpmas a, PIHANNO C                       ');
      SQL.Add('                where a.workyymm = :pc_yymm                      ');
      SQL.Add('                  and a.empno not like ''Y%''                    ');
      SQL.Add('                  and (replace(jobplace,'' '','''') is not null  ');
      SQL.Add('                       and jobplace is not null)                 ');
      SQL.Add('                  and a.empno = c.empno                          ');
      SQL.Add('                  and c.ANFRDATE like a.workyymm||''%''          ');
      SQL.Add('                  and c.ANCODE in (''619'',''629'',''839'')      ');
      SQL.Add('                group by a.workyymm, a.jobplace, a.sex           ');
      SQL.Add('                UNION ALL                                        ');
      SQL.Add('             select ''11''          gubn     ,                   ');
      SQL.Add('                    a.workyymm      workyymm ,                   ');
      SQL.Add('                    a.jobplace      jobplace ,                   ');
      SQL.Add('                    a.sex           sex      ,                   ');
      SQL.Add('                    1               cnt1     ,                   ');
      SQL.Add('                    1               cnt2     ,                   ');
      SQL.Add('                    1               cnt3     ,                   ');
      SQL.Add('                    1               cnt4     ,                   ');
      SQL.Add('                    1               cnt5     ,                   ');
      SQL.Add('                    1               cnt6     ,                   ');
      SQL.Add('                    1               cnt7     ,                   ');
      SQL.Add('                    1               cnt8     ,                   ');
      SQL.Add('                    1               cnt9     ,                   ');
      SQL.Add('                    1               cnt10    ,                   ');
      SQL.Add('                    sum(1)          cnt11    ,                   ');
      SQL.Add('                    1               cnt12    ,                   ');
      SQL.Add('                    1               cnt13                        ');
      SQL.Add('               from pihpmas a, PIHANNO C                         ');
      SQL.Add('              where a.workyymm = :pc_yymm                        ');
      SQL.Add('                and a.empno not like ''Y%''                      ');
      SQL.Add('                and (replace(a.jobplace,'' '','''') is not null  ');
      SQL.Add('                     and a.jobplace is not null)                 ');
      SQL.Add('                and a.empno = c.empno                            ');
      SQL.Add('                and c.ANFRDATE like a.workyymm||''%''            ');
      SQL.Add('                and c.ANDETCODE IN (''93'',''92'',''71'',''72'',''7C'',''78'')  ');
      SQL.Add('              group by a.workyymm, a.jobplace, a.sex             ');
      SQL.Add('              UNION ALL                                          ');
      SQL.Add('             select ''12''          gubn     ,                   ');
      SQL.Add('                    a.workyymm      workyymm ,                   ');
      SQL.Add('                    a.jobplace      jobplace ,                   ');
      SQL.Add('                    a.sex           sex      ,                   ');
      SQL.Add('                    1               cnt1     ,                   ');
      SQL.Add('                    1               cnt2     ,                   ');
      SQL.Add('                    1               cnt3     ,                   ');
      SQL.Add('                    1               cnt4     ,                   ');
      SQL.Add('                    1               cnt5     ,                   ');
      SQL.Add('                    1               cnt6     ,                   ');
      SQL.Add('                    1               cnt7     ,                   ');
      SQL.Add('                    1               cnt8     ,                   ');
      SQL.Add('                    1               cnt9     ,                   ');
      SQL.Add('                    1               cnt10    ,                   ');
      SQL.Add('                    1               cnt11    ,                   ');
      SQL.Add('                    sum(1)          cnt12    ,                   ');
      SQL.Add('                    1               cnt13                        ');
      SQL.Add('               FROM PIHPMAS a inner join PIHANNO b               ');
      SQL.Add('                 on a.empno = b.EMPNO                            ');
      SQL.Add('                and b.ANFRDATE LIKE a.WORKYYMM||''%''            ');
      SQL.Add('                and b.ANDETCODE IN (''71'',''72'',''7C'',''78'') ');
      SQL.Add('              where a.WORKYYMM = to_char(add_months(to_date(:pc_yymm, ''YYYYMM''),-1), ''YYYYMM'')  ');
      SQL.Add('                and a.empno not like ''Y%''                      ');
      SQL.Add('                and (replace(a.jobplace,'' '','''') is not null  ');
      SQL.Add('                     and a.jobplace is not null)                 ');
      SQL.Add('              group by a.workyymm, a.jobplace, a.sex             ');
      SQL.Add('             UNION ALL                                           ');
      SQL.Add('             select ''13''           gubn    ,                   ');
      SQL.Add('                    a.workyymm      workyymm ,                   ');
      SQL.Add('                    a.jobplace      jobplace ,                   ');
      SQL.Add('                    a.sex           sex      ,                   ');
      SQL.Add('                    1               cnt1     ,                   ');
      SQL.Add('                    1               cnt2     ,                   ');
      SQL.Add('                    1               cnt3     ,                   ');
      SQL.Add('                    1               cnt4     ,                   ');
      SQL.Add('                    1               cnt5     ,                   ');
      SQL.Add('                    1               cnt6     ,                   ');
      SQL.Add('                    1               cnt7     ,                   ');
      SQL.Add('                    1               cnt8     ,                   ');
      SQL.Add('                    1               cnt9     ,                   ');
      SQL.Add('                    1               cnt10    ,                   ');
      SQL.Add('                    1               cnt11    ,                   ');
      SQL.Add('                    1               cnt12    ,                   ');
      SQL.Add('                    sum(1)          cnt13                        ');
      SQL.Add('               from pihpmas a, PIHANNO C                         ');
      SQL.Add('              where a.workyymm = to_char(add_months(to_date(:pc_yymm, ''YYYYMM''),-1), ''YYYYMM'')  ');
      SQL.Add('                and a.empno not like ''Y%''                      ');
      SQL.Add('                and (replace(a.jobplace,'' '','''') is not null  ');
      SQL.Add('                     and a.jobplace is not null)                 ');
      SQL.Add('                and a.empno = c.empno                            ');
      SQL.Add('                and c.ANFRDATE like a.workyymm||''%''            ');
      SQL.Add('                and c.ANCODE = ''514''                           ');
      SQL.Add('              group by a.workyymm, a.jobplace, a.sex             ');
      SQL.Add('                )                                                ');
      SQL.Add('          group by sex, jobplace )                               ');

      ParamByName('pc_yymm').AsString := s_yymm;
      ParamByName('pdate').AsFloat    := fDate;// SP1.ParamByName('Result').AsFloat;
//      sql.savetofile('c:\ha_20180918.sql');
      EXECSQL;
      SB_Help.Panels[1].Text := '정상적으로 생성되었습니다.';
   end;

   //20180911 jhg 김윤진m 요청으로 수정
{   with Ora_Qry1 do
   begin
      Close;
      SQL.Clear;
      SQL.Add('insert into PKHWORKT                                            ');
      SQL.Add('select ''' + s_yymm  + '''                            c_yymm  , '); //노동통계조사년월
      SQL.Add('       jobplace                                     jobplace  , '); //근무지코드
      SQL.Add('       (select codename from pyccode                            ');
      SQL.Add('       where codeid=''I160'' and codeno = jobplace) jobplacenm, '); //근무지명
      SQL.Add('       ''''                                              sex  , ');//성별      
      SQL.Add('       cnt_1                                             var1 , '); //전월
      SQL.Add('       cnt_7 + cnt_8                                     var2 , '); //입직 총계
      SQL.Add('       cnt_9 + cnt_10 + cnt_11                           var3 , '); //이직 총계
      SQL.Add('       cnt_2                                             var4 , '); //당월
      SQL.Add('       cnt_2 * :pDate                                    var5 , '); //정상출근
      SQL.Add('	      cnt_3                                             var6 , '); //휴일출근
      SQL.Add('      (cnt_2 * :pDate) * 8                               var7 , '); //정상근로
      SQL.Add('       cnt_4                                             var8 , '); //초과근로
      SQL.Add('       cnt_5_1                                           var9 , '); //정액
      SQL.Add('       cnt_5_3                                           var10, '); //초과
      SQL.Add('       cnt_5_4 + cnt_5_5                                 var11, '); //특별
      SQL.Add('       cnt_5_2                                           var12, '); //연차
      SQL.Add('       cnt_5_4                                           var13, '); //성과
      SQL.Add('       cnt_5_5                                           var14, '); //소급
      SQL.Add('       sysdate                                       writetime, ');
      SQL.Add('       ''' + P_SaveEmpno + '''                        writeemp, ');
      SQL.Add('       cnt_6                                             var15, '); //2016.05.24 eyha 미출근일수 추가
      SQL.Add('       cnt_7                                             var16, '); //입직 채용
      SQL.Add('       cnt_8                                             var17, '); //입직 기타
      SQL.Add('       cnt_9                                             var18, '); //이직 자발적이직
      SQL.Add('       cnt_10                                            var19, '); //이직 비자발적이직
      SQL.Add('       cnt_11                                            var20  '); //이직 기타
      SQL.Add('  from (select jobplace                                       , ');
      SQL.Add('               max(decode(gubn, ''1'',  cnt1, ''0'')) cnt_1   , '); //--전월
      SQL.Add('               max(decode(gubn, ''2'',  cnt1, ''0'')) cnt_2   , '); //--당월
      SQL.Add('               max(decode(gubn, ''3'',  cnt1, ''0'')) cnt_3   , '); //--휴일출근
      SQL.Add('               max(decode(gubn, ''4'',  cnt1, ''0'')) cnt_4   , '); //--초과근로
      SQL.Add('               max(decode(gubn, ''5'',  cnt1, ''0'')) cnt_5_1 , '); //--정액급여
      SQL.Add('               max(decode(gubn, ''5'',  cnt2, ''0'')) cnt_5_2 , '); //--연차
      SQL.Add('               max(decode(gubn, ''5'',  cnt3, ''0'')) cnt_5_3 , '); //--초과
      SQL.Add('               max(decode(gubn, ''5'',  cnt4, ''0'')) cnt_5_4 , '); //--상여
      SQL.Add('               max(decode(gubn, ''5'',  cnt5, ''0'')) cnt_5_5 , '); //--소급
      SQL.Add('               max(decode(gubn, ''6'',  cnt6, ''0'')) cnt_6   , '); //2016.05.24 eyha 미출근일수 추가
      SQL.Add('               max(decode(gubn, ''7'',  cnt7, ''0'')) cnt_7   , '); //--입직 채용
      SQL.Add('               max(decode(gubn, ''8'',  cnt8, ''0'')) cnt_8   , '); //--입직 기타
      SQL.Add('               max(decode(gubn, ''9'',  cnt9, ''0'')) cnt_9   , '); //--이직 자발적이직
      SQL.Add('               max(decode(gubn, ''10'', cnt10, ''0'')) cnt_10 , '); //--이직 비자발적이직
      SQL.Add('               max(decode(gubn, ''11'', cnt11, ''0'')) cnt_11   '); //--이직 기타
      SQL.Add('         from (                                                 ');
                              // 전월
      SQL.Add('               select ''1''           gubn     ,                ');
      SQL.Add('                      a.workyymm      workyymm ,                ');
      SQL.Add('                      a.jobplace      jobplace ,                ');
      SQL.Add('                      sum(1)          cnt1     ,                ');
      SQL.Add('                      1               cnt2     ,                ');
      SQL.Add('                      1               cnt3     ,                ');
      SQL.Add('                      1               cnt4     ,                ');
      SQL.Add('                	     1               cnt5     ,                ');
      SQL.Add('                	     1               cnt6     ,                ');
      SQL.Add('                      1               cnt7     ,                ');
      SQL.Add('                      1               cnt8     ,                ');
      SQL.Add('                      1               cnt9     ,                ');
      SQL.Add('                	     1               cnt10    ,                ');
      SQL.Add('                	     1               cnt11                     ');
      SQL.Add('                 from pihpmas a, pkhphis b                      ');
      SQL.Add('                where a.workyymm =to_char(add_months(to_date(:pc_yymm,''YYYYMM''),-1),''YYYYMM'')   ');
      SQL.Add('                  and a.empno = b.empno                         ');
      SQL.Add('                  and a.workyymm = b.paydate                    ');
      SQL.Add('                  and ( replace(jobplace,'' '','''') is not null');
      SQL.Add('                        and jobplace is not null )              ');
      SQL.Add('                group by a.workyymm, a.jobplace                 ');
                               // 당월말 근로자수
      SQL.Add('                union all                                       ');
      SQL.Add('               select ''2''           gubn     ,                ');
      SQL.Add('                      a.workyymm      workyymm ,                ');
      SQL.Add('                      a.jobplace      jobplace ,                ');
      SQL.Add('                      sum(1)          cnt1     ,                ');
      SQL.Add('                      1               cnt2     ,                ');
      SQL.Add('                      1               cnt3     ,                ');
      SQL.Add('                      1               cnt4     ,                ');
      SQL.Add('                	     1               cnt5     ,                ');
      SQL.Add('                	     1               cnt6     ,                ');
      SQL.Add('                      1               cnt7     ,                ');
      SQL.Add('                      1               cnt8     ,                ');
      SQL.Add('                      1               cnt9     ,                ');
      SQL.Add('                	     1               cnt10    ,                ');
      SQL.Add('                	     1               cnt11                     ');
      SQL.Add('                 from pihpmas a, pkhphis b                      ');
      SQL.Add('                where a.workyymm = :pc_yymm                     ');
      SQL.Add('                  and a.empno = b.empno                         ');
      SQL.Add('                  and a.workyymm = b.paydate                    ');
      SQL.Add('                  and ( replace(jobplace,'' '','''') is not null');
      SQL.Add('                        and jobplace is not null )              ');
      SQL.Add('                group by a.workyymm, a.jobplace                 ');
                              // 휴일출근일수
      SQL.Add('                union all                                       ');
      SQL.Add('               select /*+ index(b i1_pihpmas) */                ');
      SQL.Add('                      ''3''       gubn     ,                    ');
      SQL.Add('                      c.paydate   workyymm ,                    ');
      SQL.Add('             	     b.jobplace  jobplace ,                    ');
      SQL.Add('                      sum(ovtmhh)     cnt1     ,                ');
      SQL.Add('                      1               cnt2     ,                ');
      SQL.Add('                      1               cnt3     ,                ');
      SQL.Add('                      1               cnt4     ,                ');
      SQL.Add('                	     1               cnt5     ,                ');
      SQL.Add('                	     1               cnt6     ,                ');
      SQL.Add('                      1               cnt7     ,                ');
      SQL.Add('                      1               cnt8     ,                ');
      SQL.Add('                      1               cnt9     ,                ');
      SQL.Add('                	     1               cnt10    ,                ');
      SQL.Add('                	     1               cnt11                     ');
      SQL.Add('                 from pkhothis a, pihpmas b, pkhphis c          ');
      SQL.Add('                where a.empno = b.empno                         ');
      SQL.Add('                  and a.empno = c.empno                         ');
      SQL.Add('             	 and c.paydate =:pc_yymm                       ');
      SQL.Add('                  and ovtmdate like :pc_yymm||''%''             ');
      SQL.Add('                  and b.workyymm = c.paydate                    ');
      SQL.Add('                  and ( to_char(to_date(OVTMDATE,''YYYYMMDD''),''d'') IN (''1'',''7'') ');
      SQL.Add('                        or  SUBSTR(OVTMDATE,7,2) = ''00'' )     ');
      SQL.Add('                  and conyn  = ''Y''                            ');
      SQL.Add('                  and ( replace(jobplace,'' '','''') is not null');
      SQL.Add('                        and jobplace is not null )              ');
      SQL.Add('                group by c.paydate, b.jobplace                  ');
      SQL.Add('                union all                                       ');
                               // 초과근무
      SQL.Add('               select /*+ index(b i1_pihpmas) */                ');
      SQL.Add('                      ''4''        gubn       ,                 ');
      SQL.Add('                      c.paydate   workyymm   ,                  ');
      SQL.Add('                      b.jobplace  jobplace   ,                  ');
      SQL.Add('                      sum(ovtmhh) cnt1       ,                  ');
      SQL.Add('                      1           cnt2       ,                  ');
      SQL.Add('                      1           cnt3       ,                  ');
      SQL.Add('                      1           cnt4       ,                  ');
      SQL.Add('                      1           cnt5       ,                  ');
      SQL.Add('                      1           cnt6       ,                  ');
      SQL.Add('                      1           cnt7       ,                  ');
      SQL.Add('                      1           cnt8       ,                  ');
      SQL.Add('                      1           cnt9       ,                  ');
      SQL.Add('                	     1           cnt10      ,                  ');
      SQL.Add('                	     1           cnt11                         ');
      SQL.Add('                 from pkhothis a, pihpmas b, pkhphis c          ');
      SQL.Add('                where a.empno = b.empno                         ');
      SQL.Add('                  and a.empno = c.empno                         ');
      SQL.Add('                  and paydate =:pc_yymm                         ');
      SQL.Add('                  and ovtmdate like :pc_yymm||''%''             ');
      SQL.Add('                  and conyn =''Y''                              ');
      SQL.Add('                  and ( replace(jobplace,'' '','''') is not null');
      SQL.Add('                        and jobplace is not null )              ');
      SQL.Add('                  and b.workyymm = c.paydate                    ');
      SQL.Add('                group by c.paydate, b.jobplace                  ');
                               //월급여액
      SQL.Add('                union all                                       ');
      SQL.Add('               select ''5''       ,                             ');
      SQL.Add('                      b.workyymm  ,                             ');
      SQL.Add('                      b.jobplace  ,                             ');
      SQL.Add('                      sum(paysum-(ovtmamt+quaterpay+holipay+sbonamt+TAXPAY+NOTAXPAY+MEDSUPAMT+HOMESUPAMT)) cnt1,');//--정액급여  kth 2011.04.14 김현순 메니져 요청으로 비과세 삭제
      SQL.Add('                      sum(ybonamt)                   cnt2,      ');//--연차
      SQL.Add('        	             sum(ovtmamt)                   cnt3,      ');//--초과
      SQL.Add('            	     sum(quaterpay+holipay+sbonamt+TAXPAY+NOTAXPAY+MEDSUPAMT+HOMESUPAMT) cnt4,      ');//--상여
      SQL.Add('                      sum(sopaysum)                  cnt5,      ');//--소급
      SQL.Add('                      1           cnt6 ,                        ');
      SQL.Add('                      1               cnt7     ,                ');
      SQL.Add('                      1               cnt8     ,                ');
      SQL.Add('                      1               cnt9     ,                ');
      SQL.Add('                	     1               cnt10    ,                ');
      SQL.Add('                	     1               cnt11                     ');
      SQL.Add('                 from pkhphis a ,pihpmas b                      ');
      SQL.Add('                where paydate = :pc_yymm                        ');
      SQL.Add('                  and a.empno = b.empno                         ');
      SQL.Add('                  and ( replace(jobplace,'' '','''') is not null');
      SQL.Add('                        and jobplace is not null )              ');
      SQL.Add('                  and b.workyymm = a.paydate                    ');
      SQL.Add('                group by b.workyymm ,b.jobplace                 ');
      SQL.Add('                union all                                       ');
                              //2016.05.24 eyha 미출근 일수 추가
      SQL.Add('               select ''6''       ,                             ');
      SQL.Add('                      b.workyymm  ,                             ');
      SQL.Add('                      b.jobplace  ,                             ');
      SQL.Add('                      1                   cnt1,                 ');
      SQL.Add('                      1                   cnt2,                 ');
      SQL.Add('        	             1                   cnt3,                 ');
      SQL.Add('            	     1                   cnt4,                 ');
      SQL.Add('                      1                   cnt5,                 ');
      SQL.Add('                      SUM(NVL(A.SPECIAL ,0)+NVL(A.LONGWORK ,0)+NVL(A.PUBVAC ,0)+NVL(A.PUBSICK ,0)+NVL(A.BEAR     ,0)+ ');
      SQL.Add('                          NVL(A.CELEB   ,0)+NVL(A.BIRTH    ,0)+NVL(A.HEALTH ,0)+NVL(A.HALF    ,0)+NVL(A.MONTH    ,0)+ ');
      SQL.Add('                          NVL(A.YEAR    ,0)+NVL(a.PRIZE    ,0)+NVL(a.SICK   ,0)+NVL(a.ABSENCE ,0)+NVL(a.ABSENCE2 ,0)+ ');
      SQL.Add('                          NVL(A.WALKOUT ,0)) CNT6 ,             ');
      SQL.Add('                      1               cnt7     ,                ');
      SQL.Add('                      1               cnt8     ,                ');
      SQL.Add('                      1               cnt9     ,                ');
      SQL.Add('                	     1               cnt10    ,                ');
      SQL.Add('                	     1               cnt11                     ');      
      SQL.Add('                 from PKHDUTY A ,PIHPMAS B, PKHPHIS C           ');
      SQL.Add('                where A.DUYYMM = :pc_yymm                       ');
      SQL.Add('                  AND A.DUYYMM = B.WORKYYMM                     ');
      SQL.Add('                  and a.empno = b.empno                         ');
      SQL.Add('                  and ( replace(jobplace,'' '','''') is not null');
      SQL.Add('                        and jobplace is not null )              ');
      SQL.Add('                  AND A.DUYYMM = c.paydate                      ');
      SQL.Add('                  and a.empno = c.empno                         ');
      SQL.Add('                group by b.workyymm ,b.jobplace                 ');
      SQL.Add('                union all                                       ');
                              //20180911 입직 채용
      SQL.Add('               select ''7''           gubn     ,                ');
      SQL.Add('                      a.workyymm      workyymm ,                ');
      SQL.Add('                      a.jobplace      jobplace ,                ');
      SQL.Add('                      1               cnt1     ,                ');
      SQL.Add('                      1               cnt2     ,                ');
      SQL.Add('                      1               cnt3     ,                ');
      SQL.Add('                      1               cnt4     ,                ');
      SQL.Add('                      1               cnt5     ,                ');
      SQL.Add('                      1               cnt6     ,                ');
      SQL.Add('                      sum(1)          cnt7     ,                ');
      SQL.Add('                      1               cnt8     ,                ');
      SQL.Add('                      1               cnt9     ,                ');
      SQL.Add('                      1               cnt10    ,                ');
      SQL.Add('                      1               cnt11                     ');
      SQL.Add('                 from pihpmas a, pkhphis b , PIHANNO C          ');
      SQL.Add('                where a.workyymm = :pc_yymm                     ');
      SQL.Add('                  and a.empno = b.empno                         ');
      SQL.Add('                  and a.workyymm = b.paydate                    ');
      SQL.Add('                  and (replace(jobplace,'' '','''') is not null ');
      SQL.Add('                       and jobplace is not null )               ');
      SQL.Add('                  and a.empno = c.empno                         ');
      SQL.Add('                  and c.ANFRDATE like a.workyymm||''%''         ');
      SQL.Add('                  and c.ANCODE IN (''111'',''131'')             ');
      SQL.Add('                group by a.workyymm, a.jobplace                 ');
      SQL.Add('                union all                                       ');
                              //20180911 입직 - 기타 (복직)
      SQL.Add('               select ''8''           gubn     ,                ');
      SQL.Add('                      a.workyymm      workyymm ,                ');
      SQL.Add('                      a.jobplace      jobplace ,                ');
      SQL.Add('                      1               cnt1     ,                ');
      SQL.Add('                      1               cnt2     ,                ');
      SQL.Add('                      1               cnt3     ,                ');
      SQL.Add('                      1               cnt4     ,                ');
      SQL.Add('                      1               cnt5     ,                ');
      SQL.Add('                      1               cnt6     ,                ');
      SQL.Add('                      1               cnt7     ,                ');
      SQL.Add('                      sum(1)          cnt8     ,                ');
      SQL.Add('                      1               cnt9     ,                ');
      SQL.Add('                      1               cnt10    ,                ');
      SQL.Add('                      1               cnt11                     ');
      SQL.Add('                 from pihpmas a, pkhphis b , PIHANNO C          ');
      SQL.Add('                where a.workyymm = :pc_yymm                     ');
      SQL.Add('                  and a.empno = b.empno                         ');
      SQL.Add('                  and a.workyymm = b.paydate                    ');
      SQL.Add('                  and (replace(jobplace,'' '','''') is not null ');
      SQL.Add('                       and jobplace is not null)                ');
      SQL.Add('                  and a.empno = c.empno                         ');
      SQL.Add('                  and c.ANFRDATE like a.workyymm||''%''         ');
      SQL.Add('                  and c.ANCODE = ''514''                        ');
      SQL.Add('                group by a.workyymm, a.jobplace                 ');
      SQL.Add('               union all                                        ');
                             //20180911 이직 - 자발적이직 : 의원면직(91)
      SQL.Add('              select ''9''           gubn     ,                 ');
      SQL.Add('                     a.workyymm      workyymm ,                 ');
      SQL.Add('                     a.jobplace      jobplace ,                 ');
      SQL.Add('                     1               cnt1     ,                 ');
      SQL.Add('                     1               cnt2     ,                 ');
      SQL.Add('                     1               cnt3     ,                 ');
      SQL.Add('                     1               cnt4     ,                 ');
      SQL.Add('                     1               cnt5     ,                 ');
      SQL.Add('                     1               cnt6     ,                 ');
      SQL.Add('                     1               cnt7     ,                 ');
      SQL.Add('                     1               cnt8     ,                 ');
      SQL.Add('                     sum(1)          cnt9     ,                 ');
      SQL.Add('                     1               cnt10    ,                 ');
      SQL.Add('                     1               cnt11                      ');
      SQL.Add('                from pihpmas a, pkhphis b , PIHANNO C           ');
      SQL.Add('               where a.workyymm = :pc_yymm                      ');
      SQL.Add('                 and a.empno = b.empno                          ');
      SQL.Add('                 and a.workyymm = b.paydate                     ');
      SQL.Add('                 and (replace(jobplace,'' '','''') is not null  ');
      SQL.Add('                      and jobplace is not null)                 ');
      SQL.Add('                 and a.empno = c.empno                          ');
      SQL.Add('                 and c.ANFRDATE like a.workyymm||''%''          ');
      SQL.Add('                 and c.ANDETCODE = ''91''                       ');
      SQL.Add('               group by a.workyymm, a.jobplace                  ');
      SQL.Add('              union all                                         ');
                            //20180911 이직 - 비자발적이직 : 계약해지(97), 권고사직(62), 징계해고(61)
      SQL.Add('             select ''10''           gubn    ,                  ');
      SQL.Add('                    a.workyymm      workyymm ,                  ');
      SQL.Add('                    a.jobplace      jobplace ,                  ');
      SQL.Add('                    1               cnt1     ,                  ');
      SQL.Add('                    1               cnt2     ,                  ');
      SQL.Add('                    1               cnt3     ,                  ');
      SQL.Add('                    1               cnt4     ,                  ');
      SQL.Add('                    1               cnt5     ,                  ');
      SQL.Add('                    1               cnt6     ,                  ');
      SQL.Add('                    1               cnt7     ,                  ');
      SQL.Add('                    1               cnt8     ,                  ');
      SQL.Add('                    1               cnt9     ,                  ');
      SQL.Add('                    sum(1)          cnt10    ,                  ');
      SQL.Add('                    1               cnt11                       ');
      SQL.Add('               from pihpmas a, pkhphis b , PIHANNO C            ');
      SQL.Add('              where a.workyymm = :pc_yymm                       ');
      SQL.Add('                and a.empno = b.empno                           ');
      SQL.Add('                and a.workyymm = b.paydate                      ');
      SQL.Add('                and (replace(jobplace,'' '','''') is not null   ');
      SQL.Add('                     and jobplace is not null)                  ');
      SQL.Add('                and a.empno = c.empno                           ');
      SQL.Add('                and c.ANFRDATE like a.workyymm||''%''           ');
      SQL.Add('                and c.ANDETCODE IN (''97'',''62'',''61'')       ');
      SQL.Add('              group by a.workyymm, a.jobplace                   ');
      SQL.Add('             UNION ALL                                          ');
                            //20180911 이직 - 기타 : 정년퇴직(93), 당연면직(92), 공상휴직(71), 병상휴직(72), 병상(난임)휴직(7C), 육아휴직(78)
      SQL.Add('             select ''11''           gubn    ,                  ');
      SQL.Add('                    a.workyymm      workyymm ,                  ');
      SQL.Add('                    a.jobplace      jobplace ,                  ');
      SQL.Add('                    1               cnt1     ,                  ');
      SQL.Add('                    1               cnt2     ,                  ');
      SQL.Add('                    1               cnt3     ,                  ');
      SQL.Add('                    1               cnt4     ,                  ');
      SQL.Add('                    1               cnt5     ,                  ');
      SQL.Add('                    1               cnt6     ,                  ');
      SQL.Add('                    1               cnt7     ,                  ');
      SQL.Add('                    1               cnt8     ,                  ');
      SQL.Add('                    1               cnt9     ,                  ');
      SQL.Add('                    1               cnt10    ,                  ');
      SQL.Add('                    sum(1)          cnt11                       ');
      SQL.Add('               from pihpmas a, pkhphis b , PIHANNO C            ');
      SQL.Add('              where a.workyymm = :pc_yymm                       ');
      SQL.Add('                and a.empno = b.empno                           ');
      SQL.Add('                and a.workyymm = b.paydate                      ');
      SQL.Add('                and (replace(jobplace,'' '','''') is not null   ');
      SQL.Add('                     and jobplace is not null)                  ');
      SQL.Add('                and a.empno = c.empno                           ');
      SQL.Add('                and c.ANFRDATE like a.workyymm||''%''           ');
      SQL.Add('                and c.ANDETCODE IN (''93'',''92'',''71'',''72'',''7C'',''78'')  ');
      SQL.Add('              group by a.workyymm, a.jobplace                   ');
      SQL.Add('           )                                                    ');
      SQL.Add('          group by jobplace )                                   ');

      ParamByName('pDate').AsFloat    := fDate;// SP1.ParamByName('Result').AsFloat;
      ParamByName('pc_yymm').AsString := s_yymm;
      //sql.savetofile('c:\pkc2120c_20180912.sql');
      EXECSQL;
      SB_Help.Panels[1].Text := '정상적으로 생성되었습니다.';
   end;
}

end;

procedure TFM_PKC2120C.bt_deleteClick(Sender: TObject);
var
  s_yymm : String;
begin
  s_yymm := Copy(med_yymm.Text,1,4)+'년 '+Copy(med_yymm.Text,6,2)+'월';

  if MessageDlg(s_yymm + ' 데이터를 삭제 하시겠습니까 ?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
     s_yymm := Copy(med_yymm.Text,1,4) + Copy(med_yymm.Text,6,2);

     with Ora_Qry1 do
     begin
       Close;
       Sql.Clear;
       Sql.Add ('Select 1 From PKHWORKT Where c_yymm = :pc_yymm ');
       ParamByName('pc_yymm').AsString :=  s_yymm;
       Open;

       if Ora_Qry1.RecordCount <> 0 then
       begin
         Close;
         Sql.Clear;
         Sql.Add ('Delete From PKHWORKT Where c_yymm = :pc_yymm ');
         ParamByName('pc_yymm').AsString :=  s_yymm;
         ExecSQL;
         SB_Help.Panels[1].Text := '정상적으로 삭제되었습니다.';
       end
       else
         ShowMessage('삭제할 데이터가 존재하지 않습니다.');
     end;
  end;
end;

procedure TFM_PKC2120C.bt_previewClick(Sender: TObject);
begin
   SB_Help.Panels[1].Text := '자료 조회 중 입니다.';

   pErrCheck(Sender);
   FG_PageCnt := 1;

   Query_Output;

   if FM_PRINT = Nil then
      FM_PRINT:=FM_PRINT.Create(Nil);


   FM_PRINT.Q_REP1.Preview;

   Inc(FG_PageCnt);
end;

procedure TFM_PKC2120C.Query_Output;
var
   s_yymm,chk_code : String;
   i,j : integer;
   fDate  : Real;
begin
   //2015.03.12 하은영 응답자를 로그인 사원의 정보로 출력되도록 수정
   p_jobdept    := '';
   p_offitel    := '';
   with Ora_Qry1 do
   begin
     Close;
     SQL.Clear;
     SQL.ADD('SELECT empno, JOBDEPT, OFFITEL, (SELECT DEPTNAME FROM PYCDEPT WHERE ORGNUM = A.ORGNUM AND DEPTCODE = A.JOBDEPT) JOBDEPTNM ');
     SQL.ADD('FROM PIMPMAS a             ');
     SQL.ADD('WHERE EMPNO =:empno        ');
     ParamByName('empno').AsString  := P_SaveEmpno;

     Open;
     if RecordCount >= 1 then
     begin
       p_jobdept    := FieldByName('JOBDEPTNM').AsString;
       p_offitel    := FieldByName('OFFITEL').AsString;
     end;
   end;


   s_yymm := Copy(med_yymm.Text,1,4) + Copy(med_yymm.Text,6,2);

   // 해당월 정상근로일수 조회      FUNCTION : HPER.FT_SWEEK
   if StoredProc1.Prepared = False Then
      StoredProc1.Prepare;
   StoredProc1.ParamByName('IN_DATE').AsString := s_yymm;
   StoredProc1.Execproc;
   FG_AllDate := StoredProc1.ParamByName('Result').AsInteger;
   j := 0;
//   chk_code := '1';
   MD_Data.First;
   for i := 1 to MD_Data.RecordCount do
   begin
        if MD_Data.FieldByName('chk').AsString = '◎' then
        begin
              j := j+ 1;
        end;
        MD_Data.Next;
   end;


   with Ora_Qry1 do
   begin
     Close;
     SQL.Clear;
     SQL.ADD('select c_yymm                                               ,');
     //2015.01.30 하은영 출력 근무지를 정상적으로 출력하지 못함에 수정
     {SQL.Add('       decode(:pjob,'''','''',jobplace||'' - '') jobplace   ,');
     if  j > 1 then
         SQL.Add('       ''전체''||'' - ''||''' + inttostr(j) + '''    jobplacenm ,')
     else
         SQL.Add('       decode(jobplacenm,'''',''전체'',jobplacenm)    jobplacenm ,');}
     SQL.Add('       '''' jobplace   ,');
     SQL.Add('       jobplacenm    jobplacenm ,');

     //2015.01.30 하은영 구분을 남/여 -> 전체/여로 출력되도록 요청 (이명노)
     {SQL.ADD('       max(decode(sex, ''M'', var1))             var1_m     ,');
     SQL.ADD('       max(decode(sex, ''F'', var1))             var1_f     ,');
     SQL.ADD('       max(decode(sex, ''M'', var2))             var2_m     ,');
     SQL.ADD('       max(decode(sex, ''F'', var2))             var2_f     ,');
     SQL.ADD('       max(decode(sex, ''M'', var3))             var3_m     ,');
     SQL.ADD('       max(decode(sex, ''F'', var3))             var3_f     ,');
     SQL.ADD('       max(decode(sex, ''M'', var4))             var4_m     ,');
     SQL.ADD('       max(decode(sex, ''F'', var4))             var4_f     ,');
     SQL.ADD('       max(decode(sex, ''M'', var5))             var5_m     ,');
     SQL.ADD('       max(decode(sex, ''F'', var5))             var5_f     ,');
     SQL.ADD('       max(decode(sex, ''M'', var6))             var6_m     ,');
     SQL.ADD('       max(decode(sex, ''F'', var6))             var6_f     ,');
     SQL.ADD('       max(decode(sex, ''M'', var7))             var7_m     ,');
     SQL.ADD('       max(decode(sex, ''F'', var7))             var7_f     ,');
     SQL.ADD('       max(decode(sex, ''M'', var8))             var8_m     ,');
     SQL.ADD('       max(decode(sex, ''F'', var8))             var8_f     ,');
     SQL.ADD('       max(decode(sex, ''M'', var9))             var9_m     ,');
     SQL.ADD('       max(decode(sex, ''F'', var9))             var9_f     ,');
     SQL.ADD('       max(decode(sex, ''M'', var10))            var10_m    ,');
     SQL.ADD('       max(decode(sex, ''F'', var10))            var10_f    ,');
     SQL.ADD('       max(decode(sex, ''M'', var11))            var11_m    ,');
     SQL.ADD('       max(decode(sex, ''F'', var11))            var11_f    ,');
     SQL.ADD('       max(decode(sex, ''M'', var12))            var12_m    ,');
     SQL.ADD('       max(decode(sex, ''F'', var12))            var12_f    ,');
     SQL.ADD('       max(decode(sex, ''M'', var13))            var13_m    ,');
     SQL.ADD('       max(decode(sex, ''F'', var13))            var13_f    ,');
     SQL.ADD('       max(decode(sex, ''M'', var14))            var14_m    ,');
     SQL.ADD('       max(decode(sex, ''F'', var14))            var14_f     ');}

     SQL.ADD('       sum(nvl(var1,0))                          var1_m     ,');
     SQL.ADD('       max(decode(sex, ''F'', var1))             var1_f     ,');
     SQL.ADD('       sum(nvl(var2,0))                          var2_m     ,');
     SQL.ADD('       max(decode(sex, ''F'', var2))             var2_f     ,');
     SQL.ADD('       sum(nvl(var3,0))                          var3_m     ,');
     SQL.ADD('       max(decode(sex, ''F'', var3))             var3_f     ,');
     SQL.ADD('       sum(nvl(var4,0))                          var4_m     ,');
     SQL.ADD('       max(decode(sex, ''F'', var4))             var4_f     ,');
     SQL.ADD('       sum(nvl(var5,0))                          var5_m     ,');
     SQL.ADD('       max(decode(sex, ''F'', var5))             var5_f     ,');
     SQL.ADD('       sum(nvl(var6,0))                          var6_m     ,');
     SQL.ADD('       max(decode(sex, ''F'', var6))             var6_f     ,');
     SQL.ADD('       sum(nvl(var7,0))                          var7_m     ,');
     SQL.ADD('       max(decode(sex, ''F'', var7))             var7_f     ,');
     SQL.ADD('       sum(nvl(var8,0))                          var8_m     ,');
     SQL.ADD('       max(decode(sex, ''F'', var8))             var8_f     ,');
     SQL.ADD('       sum(nvl(var9,0))                          var9_m     ,');
     SQL.ADD('       max(decode(sex, ''F'', var9))             var9_f     ,');
     SQL.ADD('       sum(nvl(var10,0))                         var10_m    ,');
     SQL.ADD('       max(decode(sex, ''F'', var10))            var10_f    ,');
     SQL.ADD('       sum(nvl(var11,0))                         var11_m    ,');
     SQL.ADD('       max(decode(sex, ''F'', var11))            var11_f    ,');
     SQL.ADD('       sum(nvl(var12,0))                         var12_m    ,');
     SQL.ADD('       max(decode(sex, ''F'', var12))            var12_f    ,');
     SQL.ADD('       sum(nvl(var13,0))                         var13_m    ,');
     SQL.ADD('       max(decode(sex, ''F'', var13))            var13_f    ,');
     SQL.ADD('       sum(nvl(var14,0))                         var14_m    ,');
     SQL.ADD('       max(decode(sex, ''F'', var14))            var14_f    ,');
     SQL.ADD('       sum(nvl(var15,0))                         var15_m    ,');  //2016.05.24 eyha 미출근일수 추가
     SQL.ADD('       max(decode(sex, ''F'', var15))            var15_f    ,');
     SQL.ADD('       sum(nvl(var16,0))                         var16_m    ,');  //2018.09.12 jhg 입직 채용
     SQL.ADD('       max(decode(sex, ''F'', var16))            var16_f    ,');
     SQL.ADD('       sum(nvl(var17,0))                         var17_m    ,');  //2018.09.12 jhg 입직 기타
     SQL.ADD('       max(decode(sex, ''F'', var17))            var17_f    ,');
     SQL.ADD('       sum(nvl(var18,0))                         var18_m    ,');  //2018.09.12 jhg 이직 자발적이직
     SQL.ADD('       max(decode(sex, ''F'', var18))            var18_f    ,');
     SQL.ADD('       sum(nvl(var19,0))                         var19_m    ,');  //2018.09.12 jhg 이직 비자발적
     SQL.ADD('       max(decode(sex, ''F'', var19))            var19_f    ,');
     SQL.ADD('       sum(nvl(var20,0))                         var20_m    ,');  //2018.09.12 jhg 이직 기타
     SQL.ADD('       max(decode(sex, ''F'', var20))            var20_f     ');
     SQL.ADD('  from PKHWORKT                                              ');
     SQL.ADD(' where c_yymm = :pc_yymm                                     ');
     SQL.ADD('   and jobplace in (''1''                                    ');
//     if  not cbx_all.Checked then
//     begin
          try
              MD_Data.First;
              for i := 1 to MD_Data.RecordCount do
              begin
                   if MD_Data.FieldByName('chk').AsString = '◎' then
                   begin
                         sql.add(' ,'''+MD_Data.FieldByName('codeno').AsString+''' ');
                   end;
                   MD_Data.Next;
              end;
          finally
//              MD_Data.Free;
              MD_Data.first;
          end;
//     end;
     SQL.ADD(' ) group by  c_yymm, jobplace, jobplacenm                      ');
//     SQL.ADD('   and jobplace in ( '''+ chk_code+''')          ');
//     SQL.ADD('   and jobplace = : pjob                                     ');

     ParamByName('pc_yymm').AsString     := s_yymm;

//     if  not cbx_all.Checked then
//     ParamByName('pjob').AsString   := l_duty.Caption;
//     sql.savetofile('c:\ha_20160524_2.sql');
     Open;
     if RecordCount <= 0 then
        MessageBox(Handle, '출력할 데이터가 없습니다.', '경고', MB_ICONWARNING);

     SB_Help.Panels[1].Text := '완료되었습니다.';
   end;
end;

procedure TFM_PKC2120C.Query_Output_Excel;
var
   s_yymm : String;
   i : integer;
begin
   s_yymm := Copy(med_yymm.Text,1,4) + Copy(med_yymm.Text,6,2);
   with Ora_Qry1 do
   begin
      Close;
      SQL.Clear;

      //2015.01.30 하은영 구분을 남/여 -> 전체/여로 출력되도록 요청 (이명노)
      {SQL.ADD('select jobplacenm||'' - ''||jobplace   jobplace,              ');
      SQL.ADD('       decode(sex, ''F'',''여'', ''M'',''남'','''') sex,      ');
      SQL.ADD('       var1, var2, var3, var4, var5, var6, var7,              ');
      SQL.ADD('       var8, var9, var10, var11, var12, var13, var14          ');
      SQL.ADD('  from PKHWORKT                                               ');
      SQL.ADD(' where c_yymm = :pc_yymm  and jobplace in (''1''              ');}


      //전체
      SQL.ADD('select jobplacenm||'' - ''||jobplace   jobplace,                             ');
      SQL.ADD('       ''전체'' sex,                                                         ');
      SQL.ADD('       sum(nvl(var1,0)) var1, sum(nvl(var2,0)) var2, sum(nvl(var3,0)) var3,  ');
      SQL.ADD('       sum(nvl(var4,0)) var4, sum(nvl(var5,0)) var5, sum(nvl(var6,0)) var6,  ');
      SQL.ADD('       sum(nvl(var7,0)) var7, sum(nvl(var8,0)) var8, sum(nvl(var9,0)) var9,  ');
      SQL.ADD('       sum(nvl(var10,0)) var10, sum(nvl(var11,0)) var11, sum(nvl(var12,0)) var12,  ');
      SQL.ADD('       sum(nvl(var13,0)) var13, sum(nvl(var14,0)) var14, sum(nvl(var15,0)) var15   ');  //2016.05.24 eyha 미출근일수 추가 
      SQL.ADD('  from PKHWORKT                                               ');
      SQL.ADD(' where c_yymm = :pc_yymm                                      ');
      SQL.ADD('   and jobplace in (''1''                                     ');

      try
          MD_Data.First;
          for i := 1 to MD_Data.RecordCount do
          begin
               if MD_Data.FieldByName('chk').AsString = '◎' then
               begin
                     sql.add(' ,'''+MD_Data.FieldByName('codeno').AsString+''' ');
               end;
               MD_Data.Next;
          end;
      finally
          MD_Data.first;
      end;

      SQL.ADD(' ) group by  c_yymm, jobplace, jobplacenm                     ');
      SQL.ADD(' union all                                                    ');

      //여자
      SQL.ADD('select jobplacenm||'' - ''||jobplace   jobplace,              ');
      SQL.ADD('       ''여'' sex,                                            ');
      SQL.ADD('       var1, var2, var3, var4, var5, var6, var7,              ');
      SQL.ADD('       var8, var9, var10, var11, var12, var13, var14, var15   ');
      SQL.ADD('  from PKHWORKT                                               ');
      SQL.ADD(' where c_yymm = :pc_yymm                                      ');
      SQL.ADD('   and sex =  ''F''                                           ');
      SQL.ADD('   and jobplace in (''1''                                     ');

      try
          MD_Data.First;
          for i := 1 to MD_Data.RecordCount do
          begin
               if MD_Data.FieldByName('chk').AsString = '◎' then
               begin
                     sql.add(' ,'''+MD_Data.FieldByName('codeno').AsString+''' ');
               end;
               MD_Data.Next;
          end;
      finally
          MD_Data.first;
      end;

      SQL.ADD(' ) union all                                                  ');


      SQL.ADD('select '' '', ''합계'',                                       ');
      SQL.ADD('       sum(var1), sum(var2), sum(var3), sum(var4), sum(var5), ');
      SQL.ADD('       sum(var6), sum(var7), sum(var8), sum(var9), sum(var10),');
      SQL.ADD('	      sum(var11),sum(var12),sum(var13),sum(var14),sum(var15) ');
      SQL.ADD('  from PKHWORKT                                               ');
      SQL.ADD(' where c_yymm = :pc_yymm  and jobplace in (''1''              ');
      try
          MD_Data.First;
          for i := 1 to MD_Data.RecordCount do
          begin
               if MD_Data.FieldByName('chk').AsString = '◎' then
               begin
                     sql.add(' ,'''+MD_Data.FieldByName('codeno').AsString+''' ');
               end;
               MD_Data.Next;
          end;
      finally
          MD_Data.first;
      end;

      SQL.ADD(' ) order by 1, 2 desc                                               ');

      ParamByName('pc_yymm').AsString     := s_yymm;


//     sql.savetofile('c:\ha_20160524_3.sql');

      Open;
   end;
end;
procedure TFM_PKC2120C.bt_excelClick(Sender: TObject);
var XL, XArr: Variant;
    i,j,k,Cap_empno: integer;
    SavePlace: TBookmark;
begin
  pErrCheck(Sender);

  Query_Output_Excel;

  if Ora_Qry1.RecordCount <= 1 then
  begin
    showmessage('엑셀 변환할 자료가 없습니다.');
    exit;
  end;
  SB_Help.Panels[1].Text := 'Excel이 설치되어 있는지 검색하고 있습니다.';

  XArr := VarArrayCreate([1, DBG_User.Columns.Count], VarVariant); //Gird 출력시
  try
    XL := CreateOLEObject('Excel.Application');
  except
    MessageDlg('Excel이 설치되어 있지 않습니다.', MtWarning, [mbok], 0);
    SB_Help.Panels[1].Text  := '...';
    Exit;
  end;

  SB_Help.Panels[1].Text := '자료를 변환하고 있습니다.';
  XL.WorkBooks.Add; //새로운 페이지 생성
  XL.Visible := false;
  XL.WorkSheets[1].Name := '노동통계조사표';  //시트명 부여
  XL.Range['A1:'+CHR(64 + DBG_User.Columns.Count)+'2'].Merge;               //셀 병합 Gird 출력시

  //TITLE NAME 설정
  XL.Range['A1'].value := '노동통계조사표';
  XL.Range['A1'].font.Size := 16;

  //컬럼명 지정_서브타이블 지정
  for i := 1 to DBG_User.Columns.Count do XArr[i]  := DBG_User.Columns[i-1].Title.Caption;

  XL.Range['A3' , CHR(64 + DBG_User.Columns.Count)+'3'].Value := XArr;  //Gird 출력시
  k := 3;
  for i := 1 to DBG_User.Columns.Count do     //Gird 출력시
  begin
     XL.Range[CHR(64 + i) + '3'].HorizontalAlignment := 3;
     XL.Range[CHR(64 + i) + '3'].Interior.Color:= $00CBF0B3;
     XL.Range[CHR(64 + i) + '3'].font.Size := 10;
     XL.Range[CHR(64 + i) + '3'].font.Bold := True;
  end;

  //검색된 자료를 excel에 export처리 시킨다.
  SavePlace := Ora_Qry1.GetBookmark;
  Ora_Qry1.DisableControls;
  Ora_Qry1.First;

  for i := 1 to  Ora_Qry1.RecordCount do
  begin
     for j := 1 to DBG_User.Columns.Count do
         XArr[j]  :=  DBG_User.Fields[j-1].AsString;
     XL.Range['A' + IntToStr(k+1), CHR(64 + DBG_User.Columns.Count) + IntToStr(k+1)].Value := XArr;
     inc(k);
     Ora_Qry1.Next;
  end;

  //여기서 부터는 EXPORT된 EXCEL자료를 예쁘게 꾸미는 부분입니다.
   XL.Range['A1', CHR(64 + DBG_User.Columns.Count) + IntToStr(k)].Borders.LineStyle := 1;    //테두리선을 만든다.  1은 실선
   XL.Range['A1', CHR(64 + DBG_User.Columns.Count) + IntToStr(k)].Borders.Weight := 2;       //테두리선 두깨 설정  2는 보통두깨, 3은 무지 두꺼움
   XL.Range['A1', CHR(64 + DBG_User.Columns.Count) + IntToStr(k)].Borders.ColorIndex := 1;   //테두리선 색상설정  1은 검은색
   XL.Range['A1', CHR(64 + DBG_User.Columns.Count) + IntToStr(k)].font.name := '굴림체';
   XL.Range['A1', 'A1'].HorizontalAlignment := 3;               //가운데 정렬
   XL.Range['A4', CHR(64 + DBG_User.Columns.Count) + IntToStr(k)].font.Size := 9;
   XL.Range['A4', CHR(64 + DBG_User.Columns.Count) + IntToStr(k)].HorizontalAlignment := 2;  //좌측정렬
   XL.Range['A1', CHR(64 + DBG_User.Columns.Count) + IntToStr(k)].Select;                    //자료를 모두 SELECT한 후 --하는 이유:  AutoFit 처리하기 위해서임
   XL.Selection.Columns.AutoFit;                                //자동정렬
   XL.Range['A4', 'A4'].Select;                                 //A4열에 커서 위치시킴
   XL.Visible := true;                                          //엑셀자료 보여줌
   Screen.Cursor := crDefault;
   Ora_Qry1.GotoBookmark(SavePlace);
   Ora_Qry1.FreeBookmark(SavePlace);
   Ora_Qry1.EnableControls;
   SB_Help.Panels[1].Text := '';
end;


{
Function TPIB30201F.FT_SWEEK(in_date : String) : String;
var
  iIdx, iCnt, iDcnt, iChk, i_tot : Integer;
begin
      Qra_f1.Close;
      Qra_f1.SQL.Clear;
      Qra_f1.SQL.ADD('SELECT TO_CHAE(LAST_DAY(TO_DATE(''' + in_date + ''',''yyyymm''))          ');
      Qra_f1.SQL.ADD('                      - TO_DATE(''' + in_date + ''',''yyyymm'') + 1) v_dcnt ');
      Qra_f1.SQL.ADD('  FROM DUAL                                                       ');
      Qra_f1.OPEN;
      iDnt := StrToInt(FieldByName('v_dcnt').AsString);

      if iIdx := 0 to iDnt - 1 then
      begin

         Close;
         SQL.Clear;
         SQL.ADD('	SELECT TO_CHAR(TO_DATE(in_date|| LPAD(iIdx,2,0) ),''d'')      ');
         SQL.ADD('	 FROM dual                                                    ');
         OPEN;

      end;
   end;
  FOR iIdx IN 1..iDcnt LOOP

	SELECT TO_CHAR(TO_DATE(in_date|| LPAD(iIdx,2,0) ),'d')
	  INTO iChk
	 FROM dual ;

    SELECT count(*)
      INTO iCnt
      FROM PKCHOLI
     WHERE holidate like in_date || '%'
       AND TO_CHAR( TO_DATE(holidate,'YYYYMMDD'), 'd') not in ('1','7');

	IF ((iChk = 1) or (iChk = 7))  THEN  v_tot := v_tot ;
	ELSE                            	   v_tot := v_tot + 1;
	END IF;
	
	
  END LOOP; 
  
  RETURN(v_tot - iCnt);
END;
 }
 

procedure TFM_PKC2120C.OnGrDbGrid2CellClick(Column: TColumn);
begin
  if not MD_Data.Active then MD_Data.Open;

  if MD_Data.State <> dsEdit then MD_Data.Edit;

  if  MD_Data.FieldByName('chk').AsString = '◎' then MD_Data.FieldByName('chk').AsString := ''
  else                                                MD_Data.FieldByName('chk').AsString := '◎';
  MD_Data.Post;
end;

procedure TFM_PKC2120C.bt_printClick(Sender: TObject);
begin
   SB_Help.Panels[1].Text := '자료 조회 중 입니다.';

   pErrCheck(Sender);
   FG_PageCnt := 1;

   Query_Output;

   if FM_PRINT = Nil then
      FM_PRINT:=FM_PRINT.Create(Nil);

   FM_PRINT.Q_REP1.Print;

   Inc(FG_PageCnt);
end;

end.
