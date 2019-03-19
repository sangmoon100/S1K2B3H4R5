{===================== Program Header ==========================================
 PROGRAM-NAME   : Pka2010g(인사자료추출)
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 급여인사사항
 Programmer     : 이랑교
 Version        : 30.00
 Date           : 1998.12.30
 userlib        : userhelp

Update Contents
   Version    date(yy.mm.dd)     programmer      description     relevant doc.no
   1.00       1996.10.24         허철행          최초개발본      설계명세서
   30.00      1998.12.30         이랑교          급호 항목을 직급으로   하나로인사재개발
   30.01      2000.07.18         유효성          국내교육후 복귀자는
                                                 월정 연봉을 100%로(EDUTODATE기준)
   30.02      2001.03.05         유효성          임원 연봉제에 따른 기본급,직무수당 update 부분수정
   30.03      2002.08.19         유효성          전문계약직(J사번) 근무지 세팅 추가('AY')
   30.04      2002.08.21         유효성          급여마스터의 근무지와 인사마스터의 근무지가 일치하게 수정
                                                  (전 2002 - 3806)
================================================================================}
unit PKY1020A1;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls, pass, Kylib1,
  Forms, Dialogs, StdCtrls, ExtCtrls, Buttons, DB, DBTables, Mask, Gauges,iniFiles,
  userhelp,registry,csReg, ComCtrls, PDownLoad, Func, MemDS, DBAccess, Ora,
  OraSmart, Grids, DBGrids;
const
    Table_Name  = 'pkmpinsa';

type
  TFM_Main = class(TForm)
    Panel19: TPanel;
    Lempno: TLabel;
    Lsysdate: TLabel;
    Panel2: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    Pwork: TPanel;
    GroupBox2: TGroupBox;
    GroupBox1: TGroupBox;
    GroupBox4: TGroupBox;
    La1: TLabel;
    GroupBox3: TGroupBox;
    Lb1: TLabel;
    Lb2: TLabel;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    Lc1: TLabel;
    GroupBox7: TGroupBox;
    Panel3: TPanel;
    BBsetup: TBitBtn;
    BBrun: TBitBtn;
    BBclose: TBitBtn;
    CBselect: TCheckBox;
    CBprn: TCheckBox;
    CBbatch: TCheckBox;
    Lc2: TLabel;
    Presult: TPanel;
    maintitle: TPanel;
    Panel8: TPanel;
    Panel7: TPanel;
    EYearpaynum: TEdit;
    Lwork: TLabel;
    Lr2: TLabel;
    Lr3: TLabel;
    Lr4: TLabel;
    CBYearpayclgryn: TCheckBox;
    Panel9: TPanel;
    CBpayclgryn: TCheckBox;
    Epaynum: TEdit;
    Label1: TLabel;
    SB_Help: TStatusBar;
    Label2: TLabel;
    Lr1: TLabel;
    Panel4: TPanel;
    Penddate: TPanel;
    procedure BBrunClick(Sender: TObject);
    procedure BBcloseClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure CBselectClick(Sender: TObject);
    procedure CBprnClick(Sender: TObject);
    procedure CBbatchClick(Sender: TObject);
    procedure CBYearpayclgrynClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CBpayclgrynClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    GsMateamt, GsChildAmt, GsParentAmt : real; //가족수당기준금액
    DBErrMsg : Array[0..255] of char;

  public
    { Public declarations }
    GsYearPayNum   : String;
    GsPayNum       : String;  //급호 차수
    GsYearPayDiv   : Integer; //월정급여 안분값.
    GsQuaterPayYm  : String;
    GsHoliPayYm    : String;
    GsTrainRate    : Integer;   //수습사원급여지급율
    GsLiceAmt      : real;        //자격수당기준금액
    GsY_ManRate    : double;  // 2008.03.05 일반직 관리수수료율
    procedure process_backup;
    procedure process_UpdateInsa;
    procedure process_UpdatePmas;
    procedure Process_ChangeCnt;
    procedure Process_UpdatePaynum(v_Table_Name:string);
    procedure Callpka2020c;  // 변동자리스트 출력
    procedure process_pay(v_PayNum, v_YearPayNum, v_Table_Name : string; jobkind : integer);
    procedure Process_YManRate;

  end;

var
  FM_Main: TFM_Main;
  FM_DownLoad: TFM_DownLoad;

implementation

{$R *.DFM}


procedure TFM_Main.FormActivate(Sender: TObject);
var
     qq : TOraQuery;
begin
     Application.ProcessMessages;

     if (Copy(Pempno,1,1) = 'D') or ((Copy(Pgrade,3,1) <= 'C') and (fn_YmanagerCheck)) then
     begin
          maintitle.Color := clTeal;
          maintitle.Caption := '인사자료 추출/갱신[파견직]';
     end
     else
     begin
          MessageBox(handle,'파견직 관리자 외에는 열람할 수 없습니다.','알 림',MB_OK or $0030);
          Close;
     end;


     Lempno.Caption := Pkorname + '(' + Pempno+')';
     Lsysdate.caption := fn_GetDateStr;


     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     try
          with qq do
          begin
               //최종작업일시
               Close;
               SQL.Clear;
               SQL.Add('select max(writetime) "writetime" from '+ Table_Name +' ');
               Open;

               Penddate.Caption  := Copy((FieldByName('writetime').AsString),1,4) + '년' +
                                    Copy((FieldByName('writetime').AsString),5,2) + '월' +
                                    Copy((FieldByName('writetime').AsString),7,2) + '일';

               GsYearPayNum   := '';
               GsYearPayDiv   := 0;
               GsQuaterPayYm  := '';
               GsHoliPayYm    := '';
               GsTrainRate    := 0;
               GsLiceAmt      := 0.0;
               GsY_ManRate    := 0.0;

               //현급여지급월설정
               Close;
               SQL.Clear;
               SQL.Add('select * from pkcpbas ');
               Open;

               GsYearPayNum   := FieldByName('yearpaynum' ).AsString;
               GsPayNum       := FieldByName('cpaynum'    ).AsString;
               GsYearPayDiv   := FieldByName('yearpaydiv' ).AsInteger;
               GsQuaterPayYm  := FieldByName('quaterpayym').AsString;
               GsHoliPayYm    := FieldByName('holipayym'  ).AsString;
               GsTrainRate    := FieldByName('trainrate'  ).AsInteger;   //수습사원급여지급율
               GsLiceAmt      := FieldByName('liceamt'    ).Asfloat;     //자격수당기준금액
               GsY_ManRate    := FieldByName('Y_MANRATE'  ).Asfloat;     //2008.03.05 일반직 관리수수료율               

               // 가족수당기준액 설정
               // 가족수당관련사항 보류...
               GsMateAmt   := 0;
               GsChildAmt  := 0;
               GsParentAmt := 0;

               Close;
               SQL.Clear;
               SQL.Add('select mateamt, childamt, parentamt from pkcfmbas ');
               Open;

               if Recordcount > 0 then
               begin
                    GsMateAmt   := FieldByName('mateamt'  ).Asfloat;
                    GsChildAmt  := FieldByName('childamt' ).Asfloat;
                    GsParentAmt := FieldByName('parentamt').Asfloat;
               end ;
          end;
     finally
          qq.Free;
     end;
     
     CBYearpayclgryn.Enabled := False;
     EYearpaynum.Visible := False;
     CBpayclgryn.Enabled := False;
     Epaynum.Visible := False;
     SB_Help.Panels[1].Text := ' 기초자료조회가 완료 되었습니다,작업조건을 선택하고 실행하세요.';
end;

//------------------------------ User Procedure --------------------------------
// 인사변동자 List 출력 Program Call
procedure TFM_Main.Callpka2020c;
var
     LWerrrtn : word;
     LSfilename : string;
     LAarg : array[0..200] of char;
     ini : TiniFile;
begin
     ini := TiniFile.Create(homediropen+'\insa.ini');      // INSA.INI FILE 생성
     //registry
     ini.WriteString('KY_PKA2020C','인사사항변동자_CHECK_LIST_출력','ON');     // INSA.INI FILE 갱신 (ON)

     SB_Help.Panels[1].Text := ' 인사사항 변동자 CHECH LIST Program 실행중.'+ homediropen;
     application.processmessages;

     LSfilename := homediropen+'\Bin\2tier\pka2020c.exe ,'
                  +Passemp(cmdline, 1) +','+Passemp(cmdline, 2) +','+Passemp(cmdline, 3) +','
                  +Passemp(cmdline, 4) +','+Passemp(cmdline, 5) +','+Passemp(cmdline, 6) +','
                  +Passemp(cmdline, 7) +','+Passemp(cmdline, 8) +','+Passemp(cmdline, 9) +','
                  +Passemp(cmdline,10) +','+Passemp(cmdline,11) +','+Passemp(cmdline,12) +','
                  +Passemp(cmdline,13);

     strpcopy( LAarg, LSfilename );
     LWerrrtn := winexec(LAarg, SW_SHOWNORMAL);
     case LWerrrtn of
          0 : begin
                   MessageBox(handle,'인사사항 변동자 CHECK LIST 프로그램을 실행할수있는 메모리가없습니다. 개발부와상의하세요.',
                                     '인사사항 변동자 CHECK LIST 프로그램 화일오류',MB_ICONWARNING);
                   system.exit;
              end;
          2 : begin
                   MessageBox(handle,pchar('인사사항 변동자 CHECK LIST 프로그램 실행화일이 없습니다. ' +#13+
                                           '인사사항 변동자 CHECK LIST 프로그램을 메뉴에서 먼저 실행하세요. '),
                                           '인사사항 변동자 CHECK LIST 프로그램 화일오류',MB_ICONWARNING);
                   system.exit;
              end;
          3 : begin
                   MessageBox(handle,'인사사항 변동자 CHECK LIST 프로그램의 패스가 없습니다. 개발부와상의하세요.',
                                     '인사사항 변동자 CHECK LIST 프로그램 화일오류',MB_ICONWARNING);
                   system.exit;
              end;
      4..31 : begin
                   MessageBox(handle,'인사사항 변동자 CHECK LIST 프로그램의 오류가 발생했습니다. 개발부와상의하세요.',
                                     '인사사항 변동자 CHECK LIST 프로그램 화일오류',MB_ICONWARNING);
                   system.exit;
              end;
     end;

     SB_Help.Panels[1].Text := ' 인사사항 변동자 CHECK LIST 출력중.';
     application.processmessages;
end;

// 추출 PKMPINSA <-- PIMPMAS
// 인사자료추출 선택
procedure TFM_Main.CBselectClick(Sender: TObject);
begin
     If CBselect.Checked = False then Exit;
     IF IDNO = Application.MessageBox('급여인사자료 화일을 지우고 새로이 생성합니다. 작업하시겠습니까?','안내', MB_YesNo+Mb_IconQuestion) then
     begin
          CBselect.Checked := False;
          Exit;
     end;
end;

// 급여인사자료 변동자Check List 출력 선택
procedure TFM_Main.CBprnClick(Sender: TObject);
begin
     If CBprn.Checked = False then Exit;
end;

// 급여인사사항을 일괄갱신 선택
procedure TFM_Main.CBbatchClick(Sender: TObject);
begin
     If CBbatch.Checked = False then
     begin
          CBYearpayclgryn.Checked := False;
          CBYearpayclgryn.Enabled := False;
          CBpayclgryn.Checked     := False;
          CBpayclgryn.Enabled     := False;
          Exit;
     end;

     If IDNO = Application.MessageBox('급여인사사항을 일괄갱신합니다. 작업하시겠습니까?','안내', MB_YesNo+Mb_IconQuestion) then
     begin
          CBbatch.Checked         := False;
          CBYearpayclgryn.Checked := False;
          CBYearpayclgryn.Enabled := False;
          CBpayclgryn.Checked     := False;
          CBpayclgryn.Enabled     := False;
          Exit;
     end;
     CBYearpayclgryn.Enabled := True;
     CBpayclgryn.Enabled := True;
end;

// 연봉차수를 일괄갱신 선택
procedure TFM_Main.CBYearpayclgrynClick(Sender: TObject);
begin
     If CBYearpayclgryn.Checked = False then
     begin
          EYearpaynum.Visible := False;
          Exit;
     end;

     If IDNO = Application.MessageBox('연봉차수를 일괄갱신합니다[연봉차수를 입력하세요!]. 작업하시겠습니까?','안내', MB_YesNo++$0020) then
     begin
          CBYearpayclgryn.Checked := False;
          EYearpaynum.Visible := False;
          Exit;
     end;

     EYearpaynum.Visible := True;

     // 현 연봉차수 설정
     EYearpaynum.Text  := GsYearPayNum ;
     EYearpaynum.SetFocus;
end;

//인사자료추출작업 START------------------------------------------------------->
procedure TFM_Main.BBrunClick(Sender: TObject);
var
     qq : TOraQuery;
     ObjName : String;
begin
     Presult.Caption  := '';
     SB_Help.Panels[1].Text := '';

     if  (CBselect.Checked = False) and (CBprn.Checked = False) and (CBbatch.Checked = False) then
     begin
          MessageBox(handle,'작업조건을 선택하세요!','선택오류',MB_ICONWARNING+$0040);
          Exit;
     end;

     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     Try
          with qq do
          begin
               // 연봉차수 Check
               if CBYearpayclgryn.Checked = True then
               begin
                    if EYearpaynum.Text = '' then
                    begin
                         MessageBox(handle,'연봉차수를 입력하세요!','입력오류',MB_ICONWARNING+$0040);
                         EYearpaynum.SetFocus;
                         Exit;
                    end;

                    Close;
                    SQL.Clear;
                    SQL.Add('select count(*)  cnt            ');
                    SQL.Add('  from pkhyphis                 ');
                    SQL.Add(' where yearpaynum = :yearpaynum ');

                    ParamByName('yearpaynum').AsString := EYearpaynum.Text;
                    Open;

                    if FieldByName('Cnt').AsInteger = 0 then
                    begin
                         MessageBox(handle,'입력한 연봉차수가 존재하지않습니다. 다시 입력하세요!',
                                           '입력오류',MB_ICONWARNING+$0040);
                         EYearpaynum.Text := '';
                         EYearpaynum.SelectAll;
                         Exit;
                    end;
               end;

               // 급호차수 Check
               if CBpayclgryn.Checked = True then
               begin
                    if Epaynum.Text = '' then
                    begin
                         MessageBox(handle,'급호차수를 입력하세요!','입력오류',MB_ICONWARNING+$0040);
                         Epaynum.SetFocus;
                         Exit;
                    end;

                    Close;
                    SQL.Clear;
                    SQL.Add('select count(*) cnt       ');
                    SQL.Add('  from pkcptbl            ');
                    SQL.Add(' where paynum = :paynum   ');

                    ParamByName('paynum').AsString := Epaynum.Text;
                    Open;

                    if FieldByName('cnt').AsInteger = 0 then
                    begin
                         MessageBox(handle,'입력한 급호차수가 존재하지않습니다. 다시입력하세요!',
                                           '입력오류',MB_ICONWARNING+$0040);
                         Epaynum.Text := '';
                         Epaynum.SetFocus;
                         Exit;
                    end;

                    GsPayNum := Epaynum.Text;
               end;
          end;
     finally
          qq.Free;
     end;

     // 급여인사사항일괄갱신 START
     Try
         if (CBselect.Checked = True) and (CBbatch.Checked = True) then
         begin
              process_backup;
              process_UpdateInsa;
              process_UpdatePmas;
              Process_ChangeCnt;
         end;

         if (CBselect.Checked = True) and (CBbatch.Checked = False) then
         begin
              process_backup;
              process_UpdateInsa;
              Process_ChangeCnt;
         end;

         if (CBselect.Checked = False) and (CBbatch.Checked = True) then
         begin
              process_backup;
              process_UpdatePmas;
              Process_ChangeCnt;
         end;

         // dsa2000  : 2004.09.20. 변동자 Check List 출력 Program Down 또는 Call 하여 실행하기.
         if CBprn.Checked = True then
         begin
              ObjName     := UpperCase('PKA2020C.EXE');
              FM_DownLoad := TFM_DownLoad.Create(Application);
              FM_DownLoad.Show;
              FM_DownLoad.PL_ReadEnv;                     //환경변수값(파라미터) 읽어온다.
              FM_DownLoad.PL_VersionCHK3(2, Copy(ObjName,1,8));  //Call하는 단위 프로그램의 버젼을 체크..

              if (not FM_DownLoad.FL_VersionCHK ) or (not FileExists(HomeDirOpen+'\Bin\2tier\'+ObjName)) then
              begin
                   //2016.06.17 eyha os 보안강화로 인한 프로그램 적용
                   //FM_DownLoad.PL_DownLoad(2,'/hper/insa/hperson/conbin/Kbin',ObjName,Copy(ObjName,1,8),FM_DownLoad.FL_ProgVer); //단위 프로그램 다운받기.
                   FM_DownLoad.PL_DownLoad(2,'/hper/insa/hperson/conbin/Kbin',ObjName,Copy(ObjName,1,8),FM_DownLoad.FL_ProgVer, FL_UnixIP,FL_FtpUser,FL_FtpPass); //단위 프로그램 다운받기.
                   //2016.06.20 eyha PL_DownLoad에 기능이 포함되어 있음
                   //SetKeyValue(HKEY_LOCAL_MACHINE, VERSUBKEY, Copy(ObjName,1,8), FM_DownLoad.FL_ProgVer);   //Down후 레지스트리에 버젼 저장.
              end
              else
              begin
                   ///Callpka2020c;           // 변동자 Check List 출력 Program Call
                   FM_DownLoad.PL_ProgramCall(HomeDirOpen+'\Bin\2Tier\'+ObjName);
                   if FM_DownLoad.FL_Ret < 32 then
                      MessageBox(handle,'화일이 없거나 메모리가 부족합니다..','에 러',MB_OK or $0010);

                   FM_DownLoad.Close;      // 다운로드 폼 닫기.
              end;
              SB_Help.Panels[1].Text := '';
         end;

     Except
         on E : EDataBaseError do
         begin
              MessageBox(handle,StrPcopy(DBErrMsg,E.Message),'자료오류(개발부와 상의하세요)',MB_ICONERROR+$0010);
              Lwork.Visible := False;
              exit;
         end;
    end;

    SB_Help.Panels[1].Text := ' 인사자료 추출작업이 완료되었습니다... ';
    Application.processmessages;

end;

// 종료
procedure TFM_Main.BBcloseClick(Sender: TObject);
begin
     Ora_Session.Free;
     Close;
end;

procedure TFM_Main.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     If IDNO = Application.MessageBox('작업을 종료하시겠습니까?','작업안내', MB_YesNo+ Mb_IconQuestion) then
     begin
          Action := caNone;
          exit;
     end;
end;

// 급여마스터 BACKUP //////////////////////////////////////////////////// START>
procedure TFM_Main.process_backup;
var
     qq : TOraQuery;
begin
     //If CBbackupyn.Checked = False then Exit;

     // 급여마스터백업
     SB_Help.Panels[1].Text := ' [급여마스터백업]화일삭제..생성..자료갱신중...';
     Application.processmessages;

     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     try
          with qq do
          begin
               Close;
               SQL.Clear;
               SQL.Add('select decode(least(to_char(sysdate,''yyyymm''),substr(max(writetime),1,6)),substr(max(writetime),1,6),1,0) con ');
               SQL.Add('  from pkmpmasa                                                                                                 ');

               Open;

               // con = 1 이면 backup  : sysdate > writetime
               if FieldbyName('con').AsString = '0' then Exit;

               Close;
               SQL.Clear;
               SQL.Add('delete from pkmpmasa      ');
               SQL.Add(' where empno like ''Y%''  ');
               ExecSQL;

               Close;
               SQL.Clear;
               SQL.Add('insert into pkmpmasa      ');
               SQL.Add('select * from pkmpmas     ');
               SQL.Add(' where empno like ''Y%''  ');
               ExecSQL;
          end;
     finally
          qq.Free;
     end;
end;

// 급여인사자료갱신
Procedure TFM_Main.process_UpdateInsa;
var
     qq : TOraQuery;
begin
     Lr1.Caption := '♤';
     Lr2.Caption := '♤';
     Lr3.Caption := '♤';
     Lr4.Caption := '♤';

     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     try
          with qq do
          begin
               SB_Help.Panels[1].Text := ' [급여인사자료]화일 자료지우기중...';
               application.processmessages;

               Close;
               SQL.Clear;
               SQL.Add('delete from '+ Table_Name +' ');
               SQL.Add(' where empno like ''Y%''     ');
               Execsql;

               SB_Help.Panels[1].Text := ' 인사자료추출및 등록중...';
               application.processmessages;

               Close;
               SQL.Clear;
               SQL.Add('insert into '+ Table_Name +' ( empno,            ');
               SQL.Add('                               korname,          ');
               SQL.Add('                               juminid,          ');
               SQL.Add('                               paycl,            ');
               SQL.Add('                               paygr,            ');
               SQL.Add('                               payra,            ');
               SQL.Add('                               pstate,           ');
               SQL.Add('                               orgnum,           ');
               SQL.Add('                               deptcode,         ');
               SQL.Add('                               boncode,          ');
               SQL.Add('                               jobdept,          ');
               SQL.Add('                               orgempdate,       ');
               SQL.Add('                               bldcode,          ');
               SQL.Add('                               sex,              ');
               SQL.Add('                               zipno,            ');
               SQL.Add('                               addr,             ');
               SQL.Add('                               firstyn,          ');
               SQL.Add('                               empdate,          ');
               SQL.Add('                               paycldate,        ');
               SQL.Add('                               retdate,          ');
               SQL.Add('                               conamt ,          ');
               SQL.Add('                               yearpaynum,       ');
               SQL.Add('                               paynum,           ');
               SQL.Add('                               groupempdate )    ');
               SQL.Add('select                         empno,            ');
               SQL.Add('                               korname,          ');
               SQL.Add('                               juminid,          ');
               SQL.Add('                               paycl,            ');
               SQL.Add('                               paygr,            ');
               SQL.Add('                               payra,            ');
               SQL.Add('                               pstate,           ');
               SQL.Add('                               orgnum,           ');
               SQL.Add('                               deptcode,         ');
               SQL.Add('                               boncode,          ');
               SQL.Add('                               jobdept,          ');
               SQL.Add('                               orgempdate,       ');
               SQL.Add('                               jobplace,         ');
               SQL.Add('                               sex,              ');
               SQL.Add('                               zipno,            ');
               SQL.Add('                               curaddr,          ');
               SQL.Add('                               eldsonyn,         ');
               SQL.Add('                               empdate,          ');
               SQL.Add('                               paycldate,        ');
               SQL.Add('                               retdate,          ');
               SQL.Add('                               tcontramt,        ');
               SQL.Add('                              :yearpaynum,       ');
               SQL.Add('                              :paynum,           ');
               SQL.Add('                               groupempdate      ');
               SQL.Add('  from pimpmas                                   ');
               SQL.Add(' where empno like ''Y%''                         ');
               ParamByName('yearpaynum').AsString := GsYearPayNum ;
               ParamByName('paynum'    ).AsString := GsPayNum ;
               Execsql;

               //직급변동여부,근무지변동여부 초기값설정
               Close;
               SQL.Clear;
               SQL.Add('update '+ Table_Name +' set payclyn = ''N'', ');
               SQL.Add('                            bldyn   = ''N''  ');
               SQL.Add(' where empno like ''Y%''                     ');

               Execsql;

{               //가족수당수       2012.03.20 kth 가족수당 자격수당 폐지로 주석
               SB_Help.Panels[1].Text := ' 가족수당 해당자[존속/배우자/자녀]수 추출중...';
               application.processmessages;

               Close;
               SQL.Clear;
               SQL.Add('update '+ Table_Name +'  a set ( parentcnt,                                                            ');
               SQL.Add('                                 matecnt,                                                              ');
               SQL.Add('                                 childcnt ) =                                                          ');
               SQL.Add('                       (select   sum(decode(upper(famikind),''B'',1,0)),                               ');
               SQL.Add('                                 sum(decode(upper(famikind),''A'',1,0)),                               ');
               SQL.Add('                                 sum(decode(upper(famikind),''C'',1,0))                                ');
               SQL.Add('                          from pkmfmmas b                                                              ');
               SQL.Add('                         where a.empno = b.empno                                                       ');
               SQL.Add('                           and upper(substr(appkind,1,1)) = ''A''                                      ');
               SQL.Add('                           and upper(famiyn)              = ''Y''                                      ');
               SQL.Add('                           and (famitodate is null or famitodate >= (select cpaydate from pkcpbas)))   ');
//2008.05.30 수정               SQL.Add('                           and famitodate is null  )                                  ');
               SQL.Add(' where a.empno like ''Y%''                                                                             ');
               Execsql;

               //자격수당수
               SB_Help.Panels[1].Text := ' 자격수당 해당자격수 추출중...';
               application.processmessages;

               Close;
               SQL.Clear;
               SQL.Add('update '+ Table_Name +' a set licecnt = (select count(*)           ');
               SQL.Add('                                           from pimlice b          ');
               SQL.Add('                                          where b.empno = a.empno  ');
               SQL.Add('                                            and b.licalyn = ''Y'') ');
               SQL.Add(' where a.empno like ''Y%''                                         ');

               Execsql;  }

               //신규입사자확인
               SB_Help.Panels[1].Text := ' 신규및 기존사원구분 갱신중...';
               application.processmessages;

               Close;
               SQL.Clear;
               SQL.Add('update '+ Table_Name +' a set datakind = ''N'',      ');
               SQL.Add('                              payclyn  = ''Y'',      ');
               SQL.Add('                              bldyn    = ''Y''       ');
               SQL.Add(' where empno not in (select empno from pkmpmas       ');
               SQL.Add('                      where empno = a.empno)         ');
               SQL.Add('   and a.empno like ''Y%''                           ');

               ExecSql;

               // 인사발령자료 확인
               // 직위가 첫자리가 '4', '5' 이었다가 그 범위 밖으로 바뀌면 도대체 해지는 언제되는가 ?!
               // 보임발령후 다른 보임발령이 났을 경우 직책수당을 0으로 SETTING
               //????????????????????????????????????????

               //직급변동여부
               SB_Help.Panels[1].Text := ' 기존사원의 직급변동자 비교 갱신중...';
               application.processmessages;

               Close;
               SQL.Clear;
               SQL.Add('update '+ Table_Name +' a set datakind = ''O'',    ');
               SQL.Add('                              payclyn  = ''Y''     ');
               SQL.Add(' where nvl(datakind,'' '') <> ''N''                ');
               SQL.Add('   and empno in (select b.empno                    ');
               SQL.Add('                   from pkmpmas b                  ');
               SQL.Add('                  where a.empno = b.empno          ');
               SQL.Add('                    and a.paycl <> b.paycl)        ');
               SQL.Add('   and a.empno like ''Y%''                         ');

               Execsql;

               //근무지변동여부
               SB_Help.Panels[1].Text := ' 기존사원의 근무지변동자 비교 갱신중...';
               application.processmessages;

               Close;
               SQL.Clear;
               SQL.Add('update '+ Table_Name +' a set datakind = ''O'',         ');
               SQL.Add('                              bldyn    = ''Y''          ');
               SQL.Add(' where nvl(datakind,'' '') <> ''N''                     ');
               SQL.Add('   and empno in (select b.empno                         ');
               SQL.Add('                   from pkmpmas b                       ');
               SQL.Add('                  where a.empno = b.empno               ');
               SQL.Add('                    and (a.orgnum <> b.orgnum or        ');
               SQL.Add('                         a.deptcode <> b.deptcode ))    ');
               SQL.Add('   and a.empno like ''Y%''                              ');

               Execsql;

               //기타변동여부
               SB_Help.Panels[1].Text := ' 기존사원의 기타변동자 비교 갱신중...';
               application.processmessages;

               Close;
               SQL.Clear;
               //2014.12.17 하은영 기타 변동은  bldyn= 'S'로  변경
               //SQL.Add('update '+ Table_Name +' a set datakind = ''O''                                ');
               SQL.Add('update '+ Table_Name +' a set datakind = ''O''  , bldyn = ''S''                 ');
               SQL.Add(' where nvl(datakind,'' '') <> ''N''                                             ');
               SQL.Add('   and nvl(bldyn   ,'' '') =  ''N''                                             ');
               SQL.Add('   and empno in (select b.empno                                                 ');
               SQL.Add('                   from pkmpmas b, '+ Table_Name +' a                           ');
               SQL.Add('                  where a.empno = b.empno                                       ');
               SQL.Add('                    and ( nvl(a.korname,  '' '') <> nvl(b.korname,  '' '') or   ');
               SQL.Add('                          nvl(a.juminid,  '' '') <> nvl(b.juminid,  '' '') or   ');
               SQL.Add('                          nvl(a.paycl,    '' '') <> nvl(b.paycl,    '' '') or   ');
               SQL.Add('                          nvl(a.payra,    '' '') <> nvl(b.payra,    '' '') or   ');
               SQL.Add('                          nvl(a.pstate,   '' '') <> nvl(b.pstate,   '' '') or   ');
               SQL.Add('                          nvl(a.nojoyn,   '' '') <> nvl(b.nojoyn,   '' '') or   ');
               SQL.Add('                          nvl(a.sex,      '' '') <> nvl(b.sex,      '' '') or   ');
               SQL.Add('                          nvl(a.zipno,    '' '') <> nvl(b.zipno,    '' '') or   ');
               SQL.Add('                          nvl(a.addr,     '' '') <> nvl(b.addr,     '' '') or   ');
               SQL.Add('                          nvl(a.firstyn,  '' '') <> nvl(b.firstyn,  '' '') or   ');
               SQL.Add('                          nvl(a.empdate,  '' '') <> nvl(b.empdate,  '' '') or   ');
               SQL.Add('                          nvl(a.paycldate,'' '') <> nvl(b.paycldate,'' '') or   ');
               SQL.Add('                          nvl(a.retdate,  '' '') <> nvl(b.retdate,  '' '') or   ');
               SQL.Add('                          a.licecnt <> b.licecnt))                              ');
               SQL.Add('   and a.empno like ''Y%''                                                      ');

               ExecSQL;

               //최종작업일시/최종작업자 설정
               Close;
               SQL.Clear;
               SQL.Add('update '+ Table_Name +' set writetime = '''+ fn_GetDateTimeStr +''',');
               SQL.Add('                            writeman  = '''+ Pempno   +'''          ');
               SQL.Add(' where empno like ''Y%''                                            ');

               Execsql;
          end;
     finally
          qq.Free;
     end;
end;



// 2008.03.05 일반직 관리수수로 생성 필드
procedure TFM_Main.process_YManRate;
var
     qq : TOraQuery;
begin
     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     try
          with qq do
          begin
               SB_Help.Panels[1].Text := '파견직사원 관리수수료 추출 중...';
               application.processmessages;

               Close;
               SQL.Clear;
{ 2010.05.10  KTH 파견직 연봉체계 변경 연봉 데이터 수정 연봉 /12 ,수수료는 SI_TOTPAY/12 로 변경.
               SQL.Add('UPDATE PKMPMAS a                                                           ');
               SQL.Add('            set FIXPAY    = (FIXPAY-ROUND(FIXPAY*:Y_MANRATE/100)) ,        ');
               SQL.Add('                NOTAXPAY1 = ROUND(FIXPAY*:Y_MANRATE/100)                   ');
               SQL.Add(' WHERE EMPNO LIKE ''Y%''                                                   ');
               SQL.Add('   AND PSTATE  < ''80''                                                    ');
               ParamByName('Y_MANRATE').AsFloat := GsY_ManRate;                                       }


               SQL.Add('UPDATE PKMPMAS a                                                           ');
               SQL.Add('            set NOTAXPAY1 = (SELECT Trunc(NVL(B.SI_TOTPAY,0)/12)           ');
               SQL.Add('                               FROM PKHYPHIS  B                            ');
               SQL.Add('                              WHERE B.YEARPAYNUM = :YEARPAYNUM             ');
               SQL.Add('                                AND A.EMPNO = B.EMPNO  )                   ');
               SQL.Add(' WHERE EMPNO LIKE ''Y%''                                                   ');
               SQL.Add('   AND PSTATE  < ''80''                                                    ');

               ParamByName('yearpaynum').AsString := EYearpaynum.Text;
               ExecSQL;
          end;
     finally
          qq.Free;
     end;


end;

//*******************************************
// 급여마스터등록중...
procedure TFM_Main.process_UpdatePmas;
var
     qq : TOraQuery;
begin
     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     try
          with qq do
          begin
               SB_Help.Panels[1].Text := ' 신규입사자 자료추출및 급여마스터등록중...';
               application.processmessages;

               Close;
               SQL.Clear;
               SQL.Add('insert into pkmpmas ( empno,           ');
               SQL.Add('                      korname,         ');
               SQL.Add('                      juminid,         ');
               SQL.Add('                      paycl,           ');
               SQL.Add('                      paygr,           ');
               SQL.Add('                      payra,           ');
               SQL.Add('                      payyn,           ');
               SQL.Add('                      pstate,          ');
               SQL.Add('                      orgnum,          ');
               SQL.Add('                      deptcode,        ');
               SQL.Add('                      boncode,         ');
               SQL.Add('                      jobdept,         ');
               SQL.Add('                      nojoyn,          ');
               SQL.Add('                      bldcode,         ');
               SQL.Add('                      sex,             ');
               SQL.Add('                      zipno,           ');
               SQL.Add('                      addr,            ');
               SQL.Add('                      firstyn,         ');
               SQL.Add('                      paynum,          ');
               SQL.Add('                      yearpaynum,      ');
               SQL.Add('                      empdate,         ');
               SQL.Add('                      orgempdate,      ');
               SQL.Add('                      paycldate,       ');
               SQL.Add('                      retdate,         ');
               SQL.Add('                      basicamt,        ');
               SQL.Add('                      infoamt,         ');
               SQL.Add('                      matecnt,         ');
               SQL.Add('                      parentcnt,       ');
               SQL.Add('                      childcnt,        ');
               SQL.Add('                      licecnt,         ');
               SQL.Add('                      groupempdate )   ');
               SQL.Add('select                empno,           ');
               SQL.Add('                      korname,         ');
               SQL.Add('                      juminid,         ');
               SQL.Add('                      paycl,           ');
               SQL.Add('                      paygr,           ');
               SQL.Add('                      payra,           ');
               SQL.Add('                      ''Y'',           ');
               SQL.Add('                      pstate,          ');
               SQL.Add('                      orgnum,          ');
               SQL.Add('                      deptcode,        ');
               SQL.Add('                      boncode,         ');
               SQL.Add('                      jobdept,         ');
               SQL.Add('                      nojoyn,          ');
               SQL.Add('                      bldcode,         ');
               SQL.Add('                      sex,             ');
               SQL.Add('                      zipno,           ');
               SQL.Add('                      addr,            ');
               SQL.Add('                      firstyn,         ');
               SQL.Add('                      paynum,          ');
               SQL.Add('                      yearpaynum,      ');
               SQL.Add('                      empdate,         ');
               SQL.Add('                      orgempdate,      ');
               SQL.Add('                      paycldate,       ');
               SQL.Add('                      retdate,         ');
               SQL.Add('                      basicamt,        ');
               SQL.Add('                      infoamt,         ');
               SQL.Add('                      matecnt,         ');
               SQL.Add('                      parentcnt,       ');
               SQL.Add('                      childcnt,        ');
               SQL.Add('                      licecnt,         ');
               SQL.Add('                      groupempdate     ');
               SQL.Add('from '+ Table_Name +' a                ');
               SQL.Add(' where empno like ''Y%''               ');
               SQL.Add('  and nvl(datakind,'' '') = ''N'' ');
               //2014.01.22.hjku. 오류 수정으로 추가
               SQL.Add('  and not exists (select 1 from pkmpmas where a.empno = empno) ');
               ExecSQL;

               //신규입사자 급여지급여부 N
               SB_Help.Panels[1].Text := ' 신규입사자 급여지급여부(입사포기자)설정중...';
               application.processmessages;

               Close;
               SQL.Clear;
               SQL.Add('update pkmpmas a set payyn = ''N''                   ');
               SQL.Add(' where pstate >= ''80''                              ');
               SQL.Add('   and empno in (select empno                        ');
               SQL.Add('                   from '+ Table_Name +'             ');
               SQL.Add('                  where empno = a.empno              ');
               SQL.Add('                    and nvl(datakind,'' '') = ''N'') ');
               SQL.Add('   and a.empno like ''Y%''                           ');

               ExecSQL;

               //기존변동자자료갱신
               SB_Help.Panels[1].Text := ' 기존변동자 자료갱신중...';
               application.processmessages;

               //급여마스터 변경
               Close;
               SQL.Clear;
               SQL.Add('update pkmpmas a set ( juminid,                        ');
               SQL.Add('                       paycl,                          ');
               SQL.Add('                       paygr,                          ');
               SQL.Add('                       payra,                          ');
               SQL.Add('                       pstate,                         ');
               SQL.Add('                       orgnum,                         ');
               SQL.Add('                       deptcode,                       ');
               SQL.Add('                       boncode,                        ');
               SQL.Add('                       jobdept,                        ');
               SQL.Add('                       nojoyn,                         ');
               SQL.Add('                       sex,                            ');
               SQL.Add('                       zipno,                          ');
               SQL.Add('                       addr,                           ');
               SQL.Add('                       firstyn,                        ');
               SQL.Add('                       empdate,                        ');
               SQL.Add('                       orgempdate,                     ');
               SQL.Add('                       paycldate,                      ');
               SQL.Add('                       retdate,                        ');
               SQL.Add('                       licecnt,                        ');
               SQL.Add('                       groupempdate ) =                ');
               SQL.Add('              (select  b.juminid,                      ');
               SQL.Add('                       b.paycl,                        ');
               SQL.Add('                       b.paygr,                        ');
               SQL.Add('                       b.payra,                        ');
               SQL.Add('                       b.pstate,                       ');
               SQL.Add('                       b.orgnum,                       ');
               SQL.Add('                       b.deptcode,                     ');
               SQL.Add('                       b.boncode,                      ');
               SQL.Add('                       b.jobdept,                      ');
               SQL.Add('                       b.nojoyn,                       ');
               SQL.Add('                       b.sex,                          ');
               SQL.Add('                       b.zipno,                        ');
               SQL.Add('                       b.addr,                         ');
               SQL.Add('                       b.firstyn,                      ');
               SQL.Add('                       b.empdate,                      ');
               SQL.Add('                       b.orgempdate,                   ');
               SQL.Add('                       b.paycldate,                    ');
               SQL.Add('                       b.retdate,                      ');
               SQL.Add('                       b.licecnt,                      ');
               SQL.Add('                       b.groupempdate                  ');
               SQL.Add('                from '+ Table_Name +' b                ');
               SQL.Add('               where a.empno = b.empno)                ');
               SQL.Add('where a.empno in (select empno                         ');
               SQL.Add('                    from '+ Table_Name +'              ');
               SQL.Add('                   where  nvl(datakind,'' '') = ''O'') ');
               SQL.Add('  and a.empno like ''Y%''                              ');

               ExecSQL;

               // 가족수당계 갱신중...           2012.03.20 kth 가족수당 자격수당 폐지로 주석
               //가족수당관련사항 보류...
{               SB_Help.Panels[1].Text := ' 가족/자격수당계 갱신중...';
               application.processmessages;

               Close;
               SQL.Clear;
               SQL.Add('update pkmpmas ');
               SQL.Add('   set famiamt = (matecnt * :mateamt) + (parentcnt * :parentamt) + (childcnt * :childamt), ');
               SQL.Add('       liceamt = licecnt * :liceamt                                                        ');
               SQL.Add(' where empno like ''Y%''                                                                   ');
               SQL.Add('   and pstate  <  ''80''                                                                   ');

               ParamByName('mateamt'  ).AsFloat := GsMateAmt;
               ParamByName('parentamt').AsFloat := GsParentAmt;
               ParamByName('childamt' ).AsFloat := GsChildAmt;
               ParamByName('liceamt'  ).AsFloat := GsLiceAmt;
               ExecSQL;
}

               //근무지변동자 자료갱신
               SB_Help.Panels[1].Text := ' 근무지변동자 자료갱신중...';
               application.processmessages;

               Close;
               SQL.Clear;
               SQL.Add('update pkmpmas a set bldcode = (select b.bldcode            ');
               SQL.Add('                                  from '+ Table_Name +' b   ');
               SQL.Add('                                 where a.empno = b.empno)   ');
               SQL.Add(' where a.empno in (select empno from '+ Table_Name +' )     ');
               SQL.Add('   and a.empno like ''Y%''                                  ');
               ExecSQL;
          end;
     finally
          qq.Free;
     end;


     //급호변동자만
     if ( CBpayclgryn.Checked = False ) and (CBYearpayclgryn.Checked = False) then
          Process_pay(GsPayNum, GsYearPayNum, 'pkmpmas', 0)
     else
     begin
          if CBpayclgryn.Checked     = True then GsPayNum     := Epaynum.Text;
          if CBYearpayclgryn.Checked = True then GsYearPayNum := EYearpaynum.Text;

          Process_UpdatePaynum(' pkmpmas ');
          Process_pay(GsPayNum, GsYearPayNum, 'pkmpmas', 1);
     end;

     Process_YManRate();  //관리수수료를 산출한다.

     Lwork.Visible    := False;
     SB_Help.Panels[1].Text := ' 인사자료 추출작업 종료...';
     application.processmessages;
end;

//변동자 인원
procedure TFM_Main.Process_ChangeCnt;
var
     qq : TOraQuery;
begin
     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     try
          with qq do
          begin
               Close;
               SQL.Clear;
               SQL.Add('select sum(decode(nvl(datakind,''*''),''*'', 0,''N'',1, 0 )) newcnt,   ');
               SQL.Add('       sum(decode(nvl(datakind,''*''),''*'', 0,''O'',1, 0 )) orgcnt,   ');
               SQL.Add('       sum(decode(nvl(payclyn, ''N''),''Y'', 1 , 0 ))        payclcnt, ');
               SQL.Add('       sum(decode(nvl(bldyn,   ''N''),''Y'', 1 , 0 ))        bldcnt    ');
               SQL.Add('  from '+ Table_Name +'                                                ');
               SQL.Add(' where empno like ''Y%''                                               ');

               Open;

               Lr1.Caption := '♤ 신규사원     ( ' + formatfloat('#,##0',FieldByName('newcnt'  ).AsFloat) + ' )명';
               Lr2.Caption := '♤ 기존변동자   ( ' + formatfloat('#,##0',FieldByName('orgcnt'  ).AsFloat) + ' )명';
               Lr3.Caption := '♤ BAND 변동자  ( ' + formatfloat('#,##0',FieldByName('payclcnt').AsFloat) + ' )명';
               Lr4.Caption := '♤ 근무지변동자 ( ' + formatfloat('#,##0',FieldByName('bldcnt'  ).AsFloat) + ' )명';
          end;
     finally
          qq.Free;
     end;
end;

procedure TFM_Main.FormShow(Sender: TObject);
begin
     Lwork.Visible := False;
     SendMessage(pwork.handle,WM_PAINT,0,0);
end;

procedure TFM_Main.CBpayclgrynClick(Sender: TObject);
begin
     If CBpayclgryn.Checked = False then
     begin
          Epaynum.Visible := False;
          Exit;
     end;

     If IDNO = Application.MessageBox('호수를 일괄갱신합니다[급호차수를 입력하세요!. 작업하시겠습니까?','안내', MB_YesNo+Mb_IconQuestion) then
     begin
          CBpayclgryn.Checked := False;
          Epaynum.Visible := False;
          Exit;
     end;

     Epaynum.Visible := True;

     // 현 연봉차수 설정
     Epaynum.Text  := GsPayNum ;
     Epaynum.SetFocus;
end;

procedure TFM_Main.Process_UpdatePaynum(v_Table_Name : string);
var
     qq : TOraQuery;
begin
     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     try
          with qq do
          begin
               //입력급호차수일괄갱신
               Close;
               SQL.Clear;
               SQL.Add('update '+ v_Table_Name +' set yearpaynum = ''' + GsYearPayNum + ''',  ');
               SQL.Add('                              paynum     = ''' + GsPayNum     + '''   ');
               SQL.Add(' where empno like ''Y%''                                              ');
               SQL.Add('   and pstate < ''80''                                                ');

               ExecSQL;

               If CBYearpayclgryn.Checked = True then
               begin
                    SB_Help.Panels[1].Text := ' 급여인사사항 [연봉차수] 일괄갱신중...';
                    application.processmessages;

                    Close;
                    SQL.Clear;
                    SQL.Add('update '+ v_Table_Name +' set yearpaynum = ''' + EYearpaynum.Text + '''  ');
                    SQL.Add(' where empno like ''Y%''                                                 ');
                    SQL.Add('   and pstate < ''80''                                                   ');
                    ExecSQL;
               end;

               If CBpayclgryn.Checked = True then
               begin
                    SB_Help.Panels[1].Text := ' 급여인사사항 [급호차수] 일괄갱신중...';
                    application.processmessages;

                    Close;
                    SQL.Clear;
                    SQL.Add('update '+ v_Table_Name +' set paynum = ''' + Epaynum.Text + ''' ');
                    SQL.Add(' where empno like ''Y%''                                        ');
                    SQL.Add('   and pstate < ''80''                                          ');
                    ExecSQL;
               end;
          end;
     finally
          qq.Free;
     end;
end;

// jobkind  0 : 직급 변동자만
// jobkind  1 : 급호,연봉변동시
procedure TFM_Main.process_pay(v_PayNum, v_YearPayNum, v_Table_Name : string; jobkind : integer);
var
     qq : TOraQuery;
begin
     SB_Help.Panels[1].Text := ' [연봉차수/월정급여/분기급여/계절급여] 일괄갱신중...';
     application.processmessages;

      // 월정급여 갱신
     SB_Help.Panels[1].Text := ' 급여인사사항 [월정급여] 일괄갱신중...';
     application.processmessages;

     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     try
          with qq do
          begin
               //입력급호차수일괄갱신
               Close;
               SQL.Clear;
               SQL.Add('update '+ v_Table_Name + ' a set fixpay = (select ceil(nvl(b.totpay,0) / :yearpaydiv)  ');
               SQL.Add('                                             from pkhyphis  b                          ');
               SQL.Add('                                            where b.yearpaynum = :yearpaynum           ');
               SQL.Add('                                              and a.empno = b.empno)                   ');
               SQL.Add(' where empno like ''Y%''                                                               ');
               SQL.Add('  and yearpaynum = :yearpaynum                                                         ');
               SQL.Add('  and pstate < ''80''                                                                  ');

               ParamByName('yearpaydiv').AsInteger := GsYearPayDiv;
               ParamByName('yearpaynum').AsString  := v_YearPayNum;
               ExecSQL;

               //실적급계약직(Q사번) 월정연봉 갱신 (기존 : 연봉/18  변경 : 연봉 /12) => 요청서 : 2007-12737, 요청자 : 신영섭
               //일반직(Y사번)       월정연봉 갱신 방식 추가 : 연봉 /12              => 요청서 : 2007-24178, 요청자 : 신영섭  2007.10.
               //일반직(J,Q사번)     월정연봉 갱신 방식 추가 : 연봉 /12              => 요청자 : 김경호  2008.11.18

               Close;
               SQL.Clear;
               SQL.Add('update '+ v_Table_Name + ' a set fixpay = (select ceil(nvl(b.totpay,0) / 12)  ');
               SQL.Add('                                             from pkhyphis  b                 ');
               SQL.Add('                                            where b.yearpaynum = :yearpaynum  ');
               SQL.Add('                                              and a.empno = b.empno)          ');
               SQL.Add(' where empno like ''Y%''                                                      ');
               SQL.Add('  and yearpaynum = :yearpaynum                                                ');
               SQL.Add('  and pstate     < ''80''                                                     ');
               ParamByName('yearpaynum').AsString  := v_YearPayNum;
//               sql.savetofile('c:aa.sql');
               ExecSQL;

               //수습사원(월정급여갱신)
               SB_Help.Panels[1].Text := ' 수습사원월정급 갱신중...';

               Close;
               SQL.Clear;
               SQL.Add('update '+ v_Table_Name + ' set fixpay = ceil(nvl(fixpay,0) * :trainrate / 100 ) ');
               SQL.Add(' where empno like ''Y%''                                                        ');
               SQL.Add('   and yearpaynum = :yearpaynum                                                 ');
               SQL.Add('   and pstate <  ''80''                                                         ');
               SQL.Add('   and paycl  >= ''C11''                                                        ');
               SQL.Add('   and payra  =  ''D51''                                                        ');

               ParamByName('trainrate' ).AsInteger := GsTrainRate;
               ParamByName('yearpaynum').AsString  := v_YearPayNum;
               ExecSQL;


               //교육파견사원(월정급여의 70% 지급)
               //국내교육대상자는  월정연봉,분기연봉,명절연봉의 70%를 지급합니다.  //1999.04.14	 정세영
               //국내교육대상자는  월정연봉,분기연봉,명절연봉의 100%를 지급합니다.  //2009.01.21 김태호  (김경호 요청)
               SB_Help.Panels[1].Text := ' 교육파견사원 월정급 갱신중...';
               SB_Help.Panels[1].Text := ' 인사사항이 교육파견 또는 교육구분이 학위취득 또는 파견구분이 교육파견인사람 ';

               Close;
               SQL.Clear;
               SQL.Add('update '+ v_Table_Name + ' set fixpay = ceil(nvl(fixpay,0) * 100 / 100 )                                      ');
               SQL.Add(' where empno like ''Y%''                                                                                      ');
               SQL.Add('   and yearpaynum = :yearpaynum                                                                               ');
               SQL.Add('   and paycl  >= ''C11''                                                                                      ');
               SQL.Add('   and pstate <  ''80''                                                                                       ');
               SQL.Add('   and empno in ( select empno from pimpmas                                                                   ');
               SQL.Add('                  where pstate = ''32''                                                                       ');
               SQL.Add('                     or (edugubun =''4B'' and nvl(edutodate,''99999999'') > substr(:basicdate,1,6)||''01'' )  ');
               SQL.Add('                     or (lsekind  =''25'' and nvl(lsetodate,''99999999'') > substr(:basicdate,1,6)||''01'' )) ');

               ParamByName('YEARPAYnum').AsString := v_YearPayNum;
               ParamByName('basicdate').AsString  := fn_GetDate;
               ExecSQL;


               // null 값 조정
               application.processmessages;

               Close;
               SQL.Clear;
               SQL.Add('update '+ v_Table_Name + ' set fixpay    = nvl(fixpay    ,0), ');
               SQL.Add('                               quaterpay = nvl(quaterpay ,0), ');
               SQL.Add('                               holipay   = nvl(holipay   ,0), ');
               SQL.Add('                               basicamt  = nvl(basicamt  ,0), ');
               SQL.Add('                               dutyamt   = nvl(dutyamt   ,0)  ');
               SQL.Add(' where empno like ''Y%''                                      ');
               SQL.Add('   and pstate  <  ''80''                                      ');
               ExecSQL;
          end;
     finally
          qq.Free;
     end;
end;

procedure TFM_Main.FormCreate(Sender: TObject);
begin
     OraConnect;
end;

end.


