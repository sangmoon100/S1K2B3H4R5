{-------------------------------------------------------------------------------
PROGRAM-NAME   : psc3120g.exe(우리사주 우리사주 대부이자 당월공제금 생성 )
SYSTEM-NAME    : 종합인사정보
SUBSYSTEM-NAME : 복리후생(우리사주/대부 및 상환)
Programmer     : 허 철행
Version        : 1.00
Date           : 1997.12.01
Update Contents
  1.00    97.12.01       허철행     신규 프로그램 개발        상세처리명세서
-------------------------------------------------------------------------------}
unit psc31201;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Db, DBTables, Buttons, Gauges, Mask, ComCtrls, pass,
  userhelp, FormMon1, comobj, CheckLst, Menus, Tmax_session, TmaxFunc, Func,
  OnInsaCommon,  Tmax_DataSetText; //엑셀..

type
  TF_psc31201 = class(TForm)
    Shape1: TShape;
    Panel1: TPanel;
    P_r1: TPanel;
    Image5: TImage;
    Panel3: TPanel;
    L_empinfo: TLabel;
    L_sysdate: TLabel;
    Panel5: TPanel;
    P_help: TPanel;
    ME_exyymm: TMaskEdit;
    SpeedButton1: TSpeedButton;
    Panel2: TPanel;
    Panel6: TPanel;
    P_r2: TPanel;
    Panel8: TPanel;
    Gauge1: TGauge;
    BB_run: TBitBtn;
    BB_close: TBitBtn;
    DB1: TDatabase;
    Query1: TQuery;
    Query2: TQuery;
    Bt_1: TBitBtn;
    ExcelQry: TQuery;
    Bt_2: TBitBtn;
    Bt_3: TBitBtn;
    Bt_4: TBitBtn;
    Bt_5: TBitBtn;
    Bt_6: TBitBtn;
    BB_1: TBitBtn;
    BB_2: TBitBtn;
    BB_Send: TBitBtn;
    BB_excel: TBitBtn;
    Panel4: TPanel;
    TDS_batch: TTMaxDataSet;
    TMaxSession: TTMaxSession;
    BTN_1: TBitBtn;
    BTN_2: TBitBtn;
    BitBtn1: TBitBtn;
    procedure BB_runClick(Sender: TObject);
    procedure BB_closeClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Bt_1Click(Sender: TObject);
    procedure BB_1Click(Sender: TObject);
    procedure BB_SendClick(Sender: TObject);
    procedure BB_excelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BTN_1Click(Sender: TObject);
  private
    { Private declarations }
  CmdStr : string;

  public
    { Public declarations }
  GSempno    : String[4];
  GSkorname  : String[12];
  GSPassword : String[10];
  GSgrade    : String[10];
  GSsysdate  : String;
  end;

var
  F_psc31201: TF_psc31201;

implementation

{$R *.DFM}

// 실행
procedure TF_psc31201.BB_runClick(Sender: TObject);
begin
  BB_run.enabled := false;
  Gauge1.Progress := 0;
  P_r1.caption := '';
  sendmessage(P_r1.handle,WM_PAINT,0,0);
  P_r2.caption := '';
  sendmessage(P_r2.handle,WM_PAINT,0,0);
  p_help.caption := ' 자료검사중...';
  sendmessage(p_help.handle,WM_PAINT,0,0);
  Query1.Close;
  Query1.sql.Clear;
  Query1.sql.Add('select *  ');
  Query1.sql.Add('from psemhis ');
  Query1.sql.Add('where exdate = '''+ME_exyymm.Text+''' ');
  Query1.sql.Add('  and exmdate is null ');
  Query1.sql.Add('  and exiamt > 0 ');
  Query1.Open;
  Gauge1.Progress := 5;
  if Query1.RecordCount < 1 then begin
    P_help.Caption := ' 상환이력에 계산된자료가 없어 추출할 수 없습니다.';
    sendmessage(p_help.handle,WM_PAINT,0,0);
    messagebeep(1);
    Gauge1.Progress := 0;
    P_r1.caption := '';
    sendmessage(P_r1.handle,WM_PAINT,0,0);
    P_r2.caption := '';
    sendmessage(P_r2.handle,WM_PAINT,0,0);
    BB_run.enabled := true;
    System.Exit;
  end;
  Query1.Close;
  Query1.sql.Clear;
  Query1.sql.Add('select *  ');
  Query1.sql.Add('from   psexdedo ');
  Query1.sql.Add('where  exyymm = '''+ME_exyymm.Text+''' ');
  Query1.Open;
  Gauge1.Progress := 10;
  Query2.Close;
  Query2.sql.Clear;
  Query2.sql.Add('select *  ');
  Query2.sql.Add('from   psexdedb ');
  Query2.sql.Add('where  exyymm = '''+ME_exyymm.Text+''' ');
  Query2.Open;
  Gauge1.Progress := 20;
  if (Query1.RecordCount > 0) or (Query2.RecordCount > 0) then begin
    if Application.MessageBox('당월공제금이 존재합니다 재생성 하시겠습니까?','작업안내',MB_yesno) = id_yes then
     begin
       P_help.caption := ' 재계산(자료삭제)중...';
       sendmessage(P_help.handle,WM_PAINT,0,0);
       Query1.Close;
       Query1.sql.Clear;
       Query1.sql.Add('delete from psexdedo ');
       Query1.sql.Add('where  exyymm = '''+ME_exyymm.Text+''' ');
       Query1.ExecSql;
       Gauge1.Progress := 30;
       Query1.Close;
       Query1.sql.Clear;
       Query1.sql.Add('delete from psexdedb ');
       Query1.sql.Add('where  exyymm = '''+ME_exyymm.Text+''' ');
       Query1.ExecSql;
     end else
     begin
       Gauge1.Progress := 0;
       P_r1.caption := '';
       sendmessage(P_r1.handle,WM_PAINT,0,0);
       P_r2.caption := '';
       sendmessage(P_r2.handle,WM_PAINT,0,0);
       BB_run.enabled := true;
       P_help.caption := ' 작업이 취소되었습니다...';
       sendmessage(P_help.handle,WM_PAINT,0,0);
       system.exit;
     end;
  end;
  //----------------------------------------------------------------------------
  P_help.caption := ' 자료추출 및 생성중(회사대부 이자공제금)...';
  sendmessage(P_help.handle,WM_PAINT,0,0);
  Gauge1.Progress := 40;
  Query1.Close;
  Query1.SQL.Clear;
  Query1.SQL.ADD(' INSERT INTO PSEXDEDO ');
  Query1.SQL.ADD(' (exyymm,empno,korname,excpamtsum,exiamtsum,exdedsum,writetime,writeman) ');
  Query1.SQL.ADD(' (select '''+ME_exyymm.Text+''', empno, korname, ');
  Query1.SQL.ADD('  sum(excpamt), sum(exiamt), sum(exdedamt), ');
  Query1.SQL.ADD('  '''+GSsysdate+''', '''+GSempno+''' ');
  Query1.SQL.ADD(' from  psemhis ');
  Query1.SQL.ADD(' where exdate = '''+ME_exyymm.Text+''' ');
  Query1.SQL.ADD(' and stlorg = ''ZZ'' ');
  Query1.SQL.ADD(' and exdedamt > 0 ');
  Query1.SQL.ADD(' and exyn = ''Y'' ');
  Query1.SQL.ADD(' group by empno, korname) ');
  Query1.ExecSql;
  //----------------------------------------------------------------------------
  P_help.caption := ' 자료추출 및 생성중(은행대부 이자 공제금)...';
  sendmessage(P_help.handle,WM_PAINT,0,0);
  Gauge1.Progress := 50;
  Query1.Close;
  Query1.SQL.Clear;
  Query1.SQL.ADD(' INSERT INTO PSEXDEDB ');
  Query1.SQL.ADD(' (exyymm,empno,korname,excpamtsum,exiamtsum,exdedsum,writetime,writeman) ');
  Query1.SQL.ADD(' (select '''+ME_exyymm.Text+''', empno, korname, ');
  Query1.SQL.ADD('  sum(excpamt), sum(exiamt), sum(exdedamt), ');
  Query1.SQL.ADD('  '''+GSsysdate+''', '''+GSempno+''' ');
  Query1.SQL.ADD(' from psemhis ');
  Query1.SQL.ADD(' where exdate = '''+ME_exyymm.Text+''' ');
  Query1.SQL.ADD(' and stlorg <> ''ZZ'' ');
  Query1.SQL.ADD(' and exdedamt > 0 ');
  Query1.SQL.ADD(' and exyn = ''Y'' ');
  Query1.SQL.ADD(' group by empno,korname) ');
  Query1.ExecSql;
  //----------------------------------------------------------------------------
  P_help.caption := ' 작업결과 출력중...';
  sendmessage(P_help.handle,WM_PAINT,0,0);
  Gauge1.Progress := 60;
  Query1.Close;
  Query1.SQL.Clear;
  Query1.SQL.ADD(' select empno ');
  Query1.SQL.ADD(' from psexdedo ');
  Query1.SQL.ADD(' where exyymm = '''+ME_exyymm.Text+''' ');
  Query1.Open;
  P_r1.caption := ' '+formatfloat('#,##0',Query1.Recordcount)+' 명 /';
  sendmessage(P_r1.handle,WM_PAINT,0,0);
  Gauge1.Progress := 70;
  Query1.Close;
  Query1.SQL.Clear;
  Query1.SQL.ADD(' select empno ');
  Query1.SQL.ADD(' from psexdedb ');
  Query1.SQL.ADD(' where exyymm = '''+ME_exyymm.Text+''' ');
  Query1.Open;
  P_r2.caption := ' '+formatfloat('#,##0',Query1.Recordcount)+' 명 /';
  sendmessage(P_r2.handle,WM_PAINT,0,0);
  Gauge1.Progress := 80;
  Query1.Close;
  Query1.SQL.Clear;
  Query1.SQL.ADD(' select sum(exdedsum) S ');
  Query1.SQL.ADD(' from psexdedo ');
  Query1.SQL.ADD(' where exyymm = '''+ME_exyymm.Text+''' ');
  Query1.Open;
  Gauge1.Progress := 90;
  P_r1.caption := P_r1.caption+' '+formatfloat('#,##0',Query1.fieldbyname('S').Asfloat)+' 원';
  sendmessage(P_r1.handle,WM_PAINT,0,0);
  Query1.Close;
  Query1.SQL.Clear;
  Query1.SQL.ADD(' select sum(exdedsum) S ');
  Query1.SQL.ADD(' from psexdedb ');
  Query1.SQL.ADD(' where exyymm = '''+ME_exyymm.Text+''' ');
  Query1.Open;
  P_r2.caption := P_r2.caption+' '+formatfloat('#,##0',Query1.fieldbyname('S').Asfloat)+' 원';
  sendmessage(P_r2.handle,WM_PAINT,0,0);
  Gauge1.Progress := 100;
  P_help.caption := ' 작업이 종료되었습니다...';
  sendmessage(P_help.handle,WM_PAINT,0,0);
  BB_run.enabled := true;
end;

// 종료
procedure TF_psc31201.BB_closeClick(Sender: TObject);
begin
    close;
end;

// 공제년월
procedure TF_psc31201.SpeedButton1Click(Sender: TObject);
//var
//  calendar2: Tcalendar2;
begin
{  calendar2 := TCalendar2.Create(Self);
  Try
    calendar2.ShowModal;
    if calendar2.GIcloseChk  <> -1 then
    ME_exyymm.text := calendar2.GSym;
  Finally
    calendar2.Free
  end;
}
    Try
        MonthForm := TMonthForm.Create(Self);
        MonthForm.ShowModal;
        if MonthForm.DayCaption <> '' then
           ME_exyymm.Text := Copy(MonthForm.DayCaption,1,6);//+'-'+Copy(MonthForm.DayCaption,5,2);
    Finally
        MonthForm.Free;
    End;
end;

// 도움말
procedure TF_psc31201.Bt_1Click(Sender: TObject);
var XL, XArr: Variant;
    i,j,k: integer;
    SavePlace: TBookmark;
begin
(* 20110902 회사/은행별 적용 HeeYong

{ //전체자료 추출할때..}
//2011.08.16 KTH 계좌번호,당월원금,당월이자,당월원리금 추가 4차 제일 버튼 안보이게 처리 
  case TComponent(Sender).Tag  of
       1: with ExcelQry do
          begin
               close;
               Sql.Clear;
               Sql.Add('select a.empno 사번, a.korname 성명,                    ');
               Sql.Add('       (select codename from pyccode                    ');
               Sql.Add('         where codeid = ''I114''                        ');
               Sql.Add('           and codeno = b.pstate) 인사상태,             ');
               Sql.Add('       b.juminid 주민번호,                              ');
	       Sql.Add('       min((select bankacnt from Pslmas c               ');
               Sql.Add('             where a.empno = c.empno                    ');
               Sql.Add('               and a.divseqnum =c.divseqnum             ');
               Sql.Add('               and a.stclass   = c.stclass              ');
               Sql.Add('               and a.stlorg    = c.stlorg )) 계좌번호,  ');
	       Sql.Add('       sum(a.excpamt) 당월원금,sum(a.exiamt) 당월이자,  ');
               Sql.Add('       sum(exdedamt) 당월원리금                         ');
               Sql.Add('  from psemhis a, pimpmas b                             ');
               Sql.Add(' where exdate    = '''+ME_exyymm.Text+'''               ');
               Sql.Add('   and corpname  = ''하나로''                           ');
               Sql.Add('   and divseqnum = 1                                    ');
               Sql.Add('   and stlorg    = ''ZZ''                               ');
               Sql.Add('   and a.empno   = b.empno                              ');
               Sql.Add('   and exdedamt  > 0                                    ');
               Sql.Add('   and exyn      = ''Y''                                ');
               Sql.Add(' group by a.empno, a.korname, b.pstate, b.juminid       ');
               open;
          end;
       2: with ExcelQry do
          begin
               close;
               Sql.Clear;
               Sql.Add('select a.empno 사번, a.korname 성명,                    ');
               Sql.Add('       (select codename from pyccode                    ');
               Sql.Add('         where codeid = ''I114''                        ');
               Sql.Add('           and codeno = b.pstate) 인사상태,             ');
               Sql.Add('       b.juminid 주민번호,                              ');
	       Sql.Add('       min((select bankacnt from Pslmas c               ');
               Sql.Add('             where a.empno = c.empno                    ');
               Sql.Add('               and a.divseqnum =c.divseqnum             ');
               Sql.Add('               and a.stclass   = c.stclass              ');
               Sql.Add('               and a.stlorg    = c.stlorg )) 계좌번호,  ');
	       Sql.Add('       sum(a.excpamt) 당월원금,sum(a.exiamt) 당월이자,  ');
               Sql.Add('       sum(exdedamt) 당월원리금                         ');
               Sql.Add('  from psemhis a, pimpmas b                             ');
               Sql.Add(' where exdate    = '''+ME_exyymm.Text+'''               ');
               Sql.Add('   and corpname  = ''하나로''                           ');
               Sql.Add('   and divseqnum = 2                                    ');
               Sql.Add('   and stlorg    = ''05''                               ');
               Sql.Add('   and a.empno   = b.empno                              ');
               Sql.Add('   and exdedamt  > 0                                    ');
               Sql.Add('   and exyn      = ''Y''                                ');
               Sql.Add(' group by a.empno, a.korname, b.pstate, b.juminid       ');
               open;
          end;
       3: with ExcelQry do
          begin
               close;
               Sql.Clear;
               Sql.Add('select a.empno 사번, a.korname 성명,                    ');
               Sql.Add('       (select codename from pyccode                    ');
               Sql.Add('         where codeid = ''I114''                        ');
               Sql.Add('           and codeno = b.pstate) 인사상태,             ');
               Sql.Add('       b.juminid 주민번호,                              ');
	       Sql.Add('       min((select bankacnt from Pslmas c               ');
               Sql.Add('             where a.empno = c.empno                    ');
               Sql.Add('               and a.divseqnum =c.divseqnum             ');
               Sql.Add('               and a.stclass   = c.stclass              ');
               Sql.Add('               and a.stlorg    = c.stlorg )) 계좌번호,  ');
	       Sql.Add('       sum(a.excpamt) 당월원금,sum(a.exiamt) 당월이자,  ');
               Sql.Add('       sum(exdedamt) 당월원리금                         ');
               Sql.Add('  from psemhis a, pimpmas b                             ');
               Sql.Add(' where exdate    = '''+ME_exyymm.Text+'''               ');
               Sql.Add('   and corpname  = ''하나로''                           ');
               Sql.Add('   and divseqnum = 3                                    ');
               Sql.Add('   and stlorg    = ''81''                               ');
               Sql.Add('   and a.empno   = b.empno                              ');
               Sql.Add('   and exdedamt  > 0                                    ');
               Sql.Add('   and exyn      = ''Y''                                ');
               Sql.Add(' group by a.empno, a.korname, b.pstate, b.juminid       ');
               open;
          end;
       4: with ExcelQry do
          begin
               close;
               Sql.Clear;
               Sql.Add('select a.empno 사번, a.korname 성명,                    ');
               Sql.Add('       (select codename from pyccode                    ');
               Sql.Add('         where codeid = ''I114''                        ');
               Sql.Add('           and codeno = b.pstate) 인사상태,             ');
               Sql.Add('       b.juminid 주민번호,                              ');
	       Sql.Add('       min((select bankacnt from Pslmas c               ');
               Sql.Add('             where a.empno = c.empno                    ');
               Sql.Add('               and a.divseqnum =c.divseqnum             ');
               Sql.Add('               and a.stclass   = c.stclass              ');
               Sql.Add('               and a.stlorg    = c.stlorg )) 계좌번호,  ');
	       Sql.Add('       sum(a.excpamt) 당월원금,sum(a.exiamt) 당월이자,  ');
               Sql.Add('       sum(exdedamt) 당월원리금                         ');
               Sql.Add('  from psemhis a, pimpmas b                             ');
               Sql.Add(' where exdate    = '''+ME_exyymm.Text+'''               ');
               Sql.Add('   and corpname  = ''하나로''                           ');
               Sql.Add('   and divseqnum = 4                                    ');
               Sql.Add('   and stlorg    = ''23''                               ');
               Sql.Add('   and a.empno   = b.empno                              ');
               Sql.Add('   and exdedamt  > 0                                    ');
               Sql.Add('   and exyn      = ''Y''                                ');
               Sql.Add(' group by a.empno, a.korname, b.pstate, b.juminid       ');
               open;
          end;
       5: with ExcelQry do
          begin
               close;
               Sql.Clear;
               Sql.Add('select a.empno 사번, a.korname 성명,                    ');
               Sql.Add('       (select codename from pyccode                    ');
               Sql.Add('         where codeid = ''I114''                        ');
               Sql.Add('           and codeno = b.pstate) 인사상태,             ');
               Sql.Add('       b.juminid 주민번호,                              ');
	       Sql.Add('       min((select bankacnt from Pslmas c               ');
               Sql.Add('             where a.empno = c.empno                    ');
               Sql.Add('               and a.divseqnum =c.divseqnum             ');
               Sql.Add('               and a.stclass   = c.stclass              ');
               Sql.Add('               and a.stlorg    = c.stlorg )) 계좌번호,  ');
	       Sql.Add('       sum(a.excpamt) 당월원금,sum(a.exiamt) 당월이자,  ');
               Sql.Add('       sum(exdedamt) 당월원리금                         ');
               Sql.Add('  from psemhis a, pimpmas b                             ');
               Sql.Add(' where exdate    = '''+ME_exyymm.Text+'''               ');
               Sql.Add('   and corpname  = ''하나로''                           ');
               Sql.Add('   and divseqnum = 5                                    ');
               Sql.Add('   and stlorg    = ''11''                               ');
               Sql.Add('   and a.empno   = b.empno                              ');
               Sql.Add('   and exdedamt  > 0                                    ');
               Sql.Add('   and exyn      = ''Y''                                ');
               Sql.Add(' group by a.empno, a.korname, b.pstate, b.juminid       ');
               open;
          end;
       6: with ExcelQry do
          begin
               close;
               Sql.Clear;
               Sql.Add('select a.empno 사번, a.korname 성명,                    ');
               Sql.Add('       (select codename from pyccode                    ');
               Sql.Add('         where codeid = ''I114''                        ');
               Sql.Add('           and codeno = b.pstate) 인사상태,             ');
               Sql.Add('       b.juminid 주민번호,                              ');
	       Sql.Add('       min((select bankacnt from Pslmas c               ');
               Sql.Add('             where a.empno = c.empno                    ');
               Sql.Add('               and a.divseqnum =c.divseqnum             ');
               Sql.Add('               and a.stclass   = c.stclass              ');
               Sql.Add('               and a.stlorg    = c.stlorg )) 계좌번호,  ');
	       Sql.Add('       sum(a.excpamt) 당월원금,sum(a.exiamt) 당월이자,  ');
               Sql.Add('       sum(exdedamt) 당월원리금                         ');
               Sql.Add('  from psemhis a, pimpmas b                             ');
               Sql.Add(' where exdate    = '''+ME_exyymm.Text+'''               ');
               Sql.Add('   and corpname  = ''하나로''                           ');
               Sql.Add('   and divseqnum = 5                                    ');
               Sql.Add('   and stlorg    = ''10''                               ');
               Sql.Add('   and a.empno   = b.empno                              ');
               Sql.Add('   and exdedamt  > 0                                    ');
               Sql.Add('   and exyn      = ''Y''                                ');
               Sql.Add(' group by a.empno, a.korname, b.pstate, b.juminid       ');
               open;
          end;
  end;

  if ExcelQry.RecordCount < 1 then
  begin
    showmessage('엑셀 변환할 자료가 없습니다.');
    exit;
  end;

  XArr := VarArrayCreate([1, 8], VarVariant);
  try
    XL := CreateOLEObject('Excel.Application');
  except
    MessageDlg('Excel이 설치되어 있지 않습니다.', MtWarning, [mbok], 0);
    Exit;
  end;

  XL.WorkBooks.Add; //새로운 페이지 생성
  XL.Visible := false;
  case TComponent(Sender).Tag  of
       1: XL.WorkSheets[1].Name := '1차(회사)';  //시트명 부여
       2: XL.WorkSheets[1].Name := '2차(외환)';  //시트명 부여
       3: XL.WorkSheets[1].Name := '3차(하나)';  //시트명 부여
       4: XL.WorkSheets[1].Name := '4차(제일)';  //시트명 부여
       5: XL.WorkSheets[1].Name := '5차(농협)';  //시트명 부여
       6: XL.WorkSheets[1].Name := '5차(농협2)';  //시트명 부여
  end;
  XL.Range['A1:H2'].Merge;               //셀 병합

  //TITLE NAME 설정
  case TComponent(Sender).Tag  of
       1: XL.Range['A1'].value := '1차(회사)_'+ME_exyymm.Text;
       2: XL.Range['A1'].value := '2차(외환)_'+ME_exyymm.Text;
       3: XL.Range['A1'].value := '3차(하나)_'+ME_exyymm.Text;
       4: XL.Range['A1'].value := '4차(제일)_'+ME_exyymm.Text;
       5: XL.Range['A1'].value := '5차(농협)_'+ME_exyymm.Text;
       6: XL.Range['A1'].value := '5차(농협2)_'+ME_exyymm.Text;
  end;
  XL.Range['A1'].font.Size := 11;

  //컬럼명 지정_서브타이블 지정
  XArr[ 1]  := '사원번호'  ;
  XArr[ 2]  := '사원성명'  ;
  XArr[ 3]  := '인사상태'  ;
  XArr[ 4]  := '주민번호'  ;
  XArr[ 5]  := '계좌번호'  ;
  XArr[ 6]  := '당월원금'  ;
  XArr[ 7]  := '당월이자'  ;
  XArr[ 8]  := '당월원리금';

  XL.Range['A3' , 'H3'].Value := XArr;
  k := 3;
  for i := 1 to 8 do
  begin
     XL.Range[CHR(64 + i) + '3'].HorizontalAlignment := 3;
     XL.Range[CHR(64 + i) + '3'].Interior.Color:= $00CBF0B3;
     XL.Range[CHR(64 + i) + '3'].font.Size := 10;
     XL.Range[CHR(64 + i) + '3'].font.Bold := True;
  end;

  //검색된 자료를 excel에 export처리 시킨다.
  ExcelQry.First;     //Showmessage(inttostr(Qry_pmas.RecordCount));

  for i := 1 to  ExcelQry.RecordCount do
  begin
     XArr[ 1]  := ''''+ExcelQry.FieldbyName('사번').AsString;
     XArr[ 2]  := ExcelQry.FieldbyName('성명').AsString;
     XArr[ 3]  := ExcelQry.FieldbyName('인사상태').AsString;
     XArr[ 4]  := Copy(ExcelQry.FieldByName('주민번호').AsString, 1, 13);// +  '*****';
     XArr[ 5]  := ExcelQry.FieldByName('계좌번호').AsString;
     XArr[ 6]  := ExcelQry.FieldByName('당월원금').AsString;
     XArr[ 7]  := ExcelQry.FieldByName('당월이자').AsString;
     XArr[ 8]  := ExcelQry.FieldByName('당월원리금').AsString;
     XL.Range['A' + IntToStr(k+1), 'H' + IntToStr(k+1)].Value := XArr;
     inc(k);
     ExcelQry.Next;
  end;
  //여기서 부터는 EXPORT된 EXCEL자료를 예쁘게 꾸미는 부분입니다.
   XL.Range['A1', 'H' + IntToStr(k)].Borders.LineStyle := 1;    //테두리선을 만든다.  1은 실선
   XL.Range['A1', 'H' + IntToStr(k)].Borders.Weight := 2;       //테두리선 두깨 설정  2는 보통두깨, 3은 무지 두꺼움
   XL.Range['A1', 'H' + IntToStr(k)].Borders.ColorIndex := 1;   //테두리선 색상설정  1은 검은색
   XL.Range['A1', 'H' + IntToStr(k)].font.name := '굴림체';
   XL.Range['A1', 'A1'].HorizontalAlignment := 3;               //가운데 정렬
   XL.Range['A3', 'H' + IntToStr(k)].font.Size := 9;
   XL.Range['E4', 'H' + IntToStr(k)].HorizontalAlignment :=  1; //우측정렬
   XL.Range['A1', 'H' + IntToStr(k)].Select;                    //자료를 모두 SELECT한 후 --하는 이유:  AutoFit 처리하기 위해서임
   XL.Selection.Columns.AutoFit;                                //자동정렬
   XL.Range['A4', 'A4'].Select;                                 //A4열에 커서 위치시킴
   XL.Visible := true;                                          //엑셀자료 보여줌
   Screen.Cursor := crDefault;
*)
end;

procedure TF_psc31201.BB_1Click(Sender: TObject);
var XL, XArr: Variant;
    i,j,k: integer;
    SavePlace: TBookmark;
begin
{ //전체자료 추출할때..}
   case TComponent(Sender).Tag  of
        1: with ExcelQry do
           begin
                close;
                Sql.Clear;
                Sql.Add('select corpname 회사명, divseqnum 차수,                           ');
                Sql.Add('       (select codename from pyccode                              ');
                Sql.Add('         where codeid = ''K910'' and codeno = a.stlorg) 대부기관, ');
                Sql.Add('       sum(excpamt) 공제원금,sum(exiamt) 공제이자,                ');
                Sql.Add('       sum(exdedamt) 공제총액, count(*) 건수                      ');
                Sql.Add('  from psemhis a                                                  ');
                Sql.Add(' where exdate   = '''+ME_exyymm.Text+'''                          ');
                Sql.Add('   and exdedamt > 0                                               ');
                Sql.Add('   and exyn     = ''Y''                                           ');
                Sql.Add(' group by corpname, divseqnum, stlorg                             ');
                Sql.Add(' order by corpname desc, divseqnum                                ');
                open;
           end;
        2: with ExcelQry do
           begin
                close;
                Sql.Clear;
                Sql.Add('select ''회사공제금'' 설명, ');
                Sql.Add('       sum(excpamtsum) 공제원금, sum(exiamtsum) 공제이자, ');
                Sql.Add('       sum(exdedsum) 공제총액, count(*) 인원,             ');
                Sql.Add('       min(writetime) 시작시간, max(writeman) 작업자      ');
                Sql.Add('  from psexdedo                                           ');
                Sql.Add(' where exyymm = '''+ME_exyymm.Text+'''                    ');
                Sql.Add(' union ');
                Sql.Add('select ''은행공제금'' 설명, ');
                Sql.Add('       sum(excpamtsum) 공제원금, sum(exiamtsum) 공제이자, ');
                Sql.Add('       sum(exdedsum) 공제총액, count(*) 인원,             ');
                Sql.Add('       min(writetime) 시작시간, max(writeman) 작업자      ');
                Sql.Add('  from psexdedb                                           ');
                Sql.Add(' where exyymm = '''+ME_exyymm.Text+'''                    ');
                open;
           end;
   end;

   if ExcelQry.RecordCount < 1 then
   begin
     showmessage('엑셀 변환할 자료가 없습니다.');
     exit;
   end;

   XArr := VarArrayCreate([1, 7], VarVariant);
   try
     XL := CreateOLEObject('Excel.Application');
   except
     MessageDlg('Excel이 설치되어 있지 않습니다.', MtWarning, [mbok], 0);
     Exit;
   end;

   XL.WorkBooks.Add; //새로운 페이지 생성
   XL.Visible := false;
   case TComponent(Sender).Tag  of
       1: begin
               XL.WorkSheets[1].Name := '총괄내역(우리사주)';  //시트명 부여
               XL.Range['A1:G2'].Merge;                        //셀 병합
               XL.Range['A1'].value := '총괄내역(우리사주)_'+ME_exyymm.Text; //TITLE NAME 설정
               XL.Range['A1'].font.Size := 11;
                 //컬럼명 지정_서브타이블 지정
               XArr[ 1]  := '회사명'    ;
               XArr[ 2]  := '차수'      ;
               XArr[ 3]  := '대부기관'  ;
               XArr[ 4]  := '공제원금'  ;
               XArr[ 5]  := '공제이자'  ;
               XArr[ 6]  := '공제총액'  ;
               XArr[ 7]  := '건수'      ;

               XL.Range['A3' , 'G3'].Value := XArr;
          end;
       2: begin
               XL.WorkSheets[1].Name := '당월내역(급여)';      //시트명 부여
               XL.Range['A1:G2'].Merge;                        //셀 병합
               XL.Range['A1'].value := '당월내역(급여)_'+ME_exyymm.Text; //TITLE NAME 설정
               XL.Range['A1'].font.Size := 11;
                 //컬럼명 지정_서브타이블 지정
               XArr[ 1]  := '설명'            ;
               XArr[ 2]  := '공제원금'  ;
               XArr[ 3]  := '공제이자'  ;
               XArr[ 4]  := '공제총액'        ;
               XArr[ 5]  := '인원'            ;
               XArr[ 6]  := '자료생성시작시간';
               XArr[ 7]  := '작업자'          ;

               XL.Range['A3' , 'G3'].Value := XArr;
          end;
   end;

   k := 3;
   for i := 1 to ExcelQry.FieldCount do
   begin
      XL.Range[CHR(64 + i) + '3'].HorizontalAlignment := 3;
      XL.Range[CHR(64 + i) + '3'].Interior.Color:= $00CBF0B3;
      XL.Range[CHR(64 + i) + '3'].font.Size := 10;
      XL.Range[CHR(64 + i) + '3'].font.Bold := True;
   end;

   //검색된 자료를 excel에 export처리 시킨다.
   ExcelQry.First;     //Showmessage(inttostr(Qry_pmas.RecordCount));
   case TComponent(Sender).Tag  of
       1: begin
               for i := 1 to  ExcelQry.RecordCount do
               begin
                  XArr[ 1]  := ExcelQry.FieldbyName('회사명').AsString;
                  XArr[ 2]  := ExcelQry.FieldbyName('차수').AsString;
                  XArr[ 3]  := ExcelQry.FieldByName('대부기관').AsString;
                  XArr[ 4]  := ExcelQry.FieldByName('공제원금').AsString;
                  XArr[ 5]  := ExcelQry.FieldByName('공제이자').AsString;
                  XArr[ 6]  := ExcelQry.FieldByName('공제총액').AsString;
                  XArr[ 7]  := ExcelQry.FieldByName('건수').AsString;
                  XL.Range['A' + IntToStr(k+1), 'G' + IntToStr(k+1)].Value := XArr;
                  inc(k);
                  ExcelQry.Next;
               end;
               //여기서 부터는 EXPORT된 EXCEL자료를 예쁘게 꾸미는 부분입니다.
               XL.Range['A1', 'G' + IntToStr(k)].Borders.LineStyle := 1;    //테두리선을 만든다.  1은 실선
               XL.Range['A1', 'G' + IntToStr(k)].Borders.Weight := 2;       //테두리선 두깨 설정  2는 보통두깨, 3은 무지 두꺼움
               XL.Range['A1', 'G' + IntToStr(k)].Borders.ColorIndex := 1;   //테두리선 색상설정  1은 검은색
               XL.Range['A1', 'G' + IntToStr(k)].font.name := '굴림체';
               XL.Range['A1', 'A1'].HorizontalAlignment := 3;               //가운데 정렬
               XL.Range['A3', 'G' + IntToStr(k)].font.Size := 9;
               XL.Range['D4', 'G' + IntToStr(k)].HorizontalAlignment :=  1; //우측정렬
               XL.Range['A1', 'G' + IntToStr(k)].Select;                    //자료를 모두 SELECT한 후 --하는 이유:  AutoFit 처리하기 위해서임
          end;
       2: begin
              for i := 1 to  ExcelQry.RecordCount do
              begin
                 XArr[ 1]  := ExcelQry.FieldbyName('설명').AsString;
                 XArr[ 2]  := ExcelQry.FieldByName('공제원금').AsString;
                 XArr[ 3]  := ExcelQry.FieldByName('공제이자').AsString;
                 XArr[ 4]  := ExcelQry.FieldByName('공제총액').AsString;
                 XArr[ 5]  := ExcelQry.FieldbyName('인원').AsString;
                 XArr[ 6]  := COPY(ExcelQry.FieldByName('시작시간').AsString, 1,4)+'-'+
                              COPY(ExcelQry.FieldByName('시작시간').AsString, 5,2)+'-'+
                              COPY(ExcelQry.FieldByName('시작시간').AsString, 7,2)+' '+
                              COPY(ExcelQry.FieldByName('시작시간').AsString, 9,2)+':'+
                              COPY(ExcelQry.FieldByName('시작시간').AsString,11,2);
                 XArr[ 7]  := ExcelQry.FieldByName('작업자').AsString;
                 XL.Range['A' + IntToStr(k+1), 'G' + IntToStr(k+1)].Value := XArr;
                 inc(k);
                 ExcelQry.Next;
              end;
              //여기서 부터는 EXPORT된 EXCEL자료를 예쁘게 꾸미는 부분입니다.
              XL.Range['A1', 'G' + IntToStr(k)].Borders.LineStyle := 1;    //테두리선을 만든다.  1은 실선
              XL.Range['A1', 'G' + IntToStr(k)].Borders.Weight := 2;       //테두리선 두깨 설정  2는 보통두깨, 3은 무지 두꺼움
              XL.Range['A1', 'G' + IntToStr(k)].Borders.ColorIndex := 1;   //테두리선 색상설정  1은 검은색
              XL.Range['A1', 'G' + IntToStr(k)].font.name := '굴림체';
              XL.Range['A1', 'A1'].HorizontalAlignment := 3;               //가운데 정렬
              XL.Range['A3', 'G' + IntToStr(k)].font.Size := 9;
              XL.Range['C4', 'C' + IntToStr(k)].HorizontalAlignment :=  1; //우측정렬
              XL.Range['A1', 'G' + IntToStr(k)].Select;                    //자료를 모두 SELECT한 후 --하는 이유:  AutoFit 처리하기 위해서임
         end;
   end;

   XL.Selection.Columns.AutoFit;                                //자동정렬
   XL.Range['A4', 'A4'].Select;                                 //A4열에 커서 위치시킴
   XL.Visible := true;                                          //엑셀자료 보여줌
   Screen.Cursor := crDefault;
end;

procedure TF_psc31201.BB_SendClick(Sender: TObject);
var   Seqno  : integer;
begin
  Query1.Close;
  Query1.SQL.Clear;
  Query1.SQL.ADD('Select nvl(Max(seqno),0)+1 seqno from POKLDMAS   ');
  Query1.SQL.ADD(' where Budat like  '''+ME_exyymm.Text+'''||''%'' ');
  Query1.SQL.ADD('   and Zloan_type   = ''2''                      ');
  Query1.Open;

  Seqno := Query1.FieldByName('Seqno').AsInteger;

  if  Seqno = 1 then
  begin
       if Application.MessageBox('IFRS 전송 자료를 생성하시겠습니까?','작업안내',MB_yesno) = id_no then
          exit;
  end
  else
  begin
       if Application.MessageBox('당월 전송 자료가 존재합니다. 전송자료를 재생성 하시겠습니까?'+#13,'작업안내',MB_yesno) = id_no then
          exit;
  end;

  P_help.caption := ' IFRS 전송 자료를 생성하는 중입니다(5분가량 소요됨)...';
  Query2.Close;
  Query2.SQL.Clear;
  Query2.SQL.ADD(' insert into POKLDMAS                                                                                                                                     ');
  Query2.SQL.ADD(' Select SEQNO, BUKRS, BUDAT, ZEMP_NO, ZLOAN_TYPE, SEQ, 												    ');
  Query2.SQL.ADD('        MAX(ZNAME),     MAX(KOSTL),      MAX(ZDATE_START), MAX(ZDATE_START2),                                                                             ');
  Query2.SQL.ADD('        MAX(ZDATE_END), MAX(ZYEAR2),     MAX(ZYEAR),       MAX(ZREPAY_TYPE), MAX(ZRATE), MAX(WAERS),                                                      ');
  Query2.SQL.ADD('    	  MAX(ZROAN_AMT1),MAX(ZROAN_AMT1) - MAX(ZROAN_AMT2)  ZROAN_AMT2, MAX(ZROAN_AMT3),  MAX(ZROAN_AMT1) - (MAX(ZROAN_AMT2) + MAX(ZROAN_AMT3)) ZROAN_AMT4,');
  Query2.SQL.ADD('    	  MAX(ZDATE_CRE), MAX(ZSTATUS),    MAX(EAI_FLAG),    MAX(EAI_DATE),    MAX(WRITETIME), MAX(WRITEMAN)                                                ');
  Query2.SQL.ADD(' FROM                                                                                                                                                     ');
  QUERY2.SQL.ADD('  (SELECT '+InttoStr(Seqno)+' SEQNO,''H100'' BUKRS, TO_CHAR(LAST_DAY(TO_DATE('''+ME_exyymm.Text+'''||''25'')),''YYYYMMDD'') BUDAT,                        ');
  QUERY2.SQL.ADD('          A.EMPNO ZEMP_NO, ''2''   ZLOAN_TYPE,                                                                                                            ');
  QUERY2.SQL.ADD(' 	    TO_NUMBER(A.DIVSEQNUM||A.STCLASS) SEQ,                                                                                                          ');
  QUERY2.SQL.ADD(' 	    A.KORNAME ZNAME,                                                                                                                                ');
  QUERY2.SQL.ADD('          (Select Fincode From Pycdept Where Orgnum=Z.Orgnum And Deptcode=Z.Deptcode) KOSTL,                     ');
  //QUERY2.SQL.ADD(' 	    (SELECT decode(substr(c.tribegb,1,1),''2'',k.jobdept,k.deptcode)  FROM PYCDEPT C ,PIMPMAS K                                                                                                                 ');
  //QUERY2.SQL.ADD(' 	      WHERE C.ORGNUM   = K.ORGNUM                                                                          ');
  //QUERY2.SQL.ADD(' 	        AND C.DEPTCODE = K.DEPTCODE AND K.EMPNO = A.EMPNO) KOSTL,
  QUERY2.SQL.ADD('          A.STLDATE ZDATE_START,                                          ');
  QUERY2.SQL.ADD(' 	    (SELECT STESDATE FROM PSHLBAS WHERE DIVSEQNUM = A.DIVSEQNUM AND STCLASS = A.STCLASS AND STLORG = A.STLORG AND STLDATE = A.STLDATE) ZDATE_START2,');
  QUERY2.SQL.ADD(' 	    (SELECT STEDDATE FROM PSHLBAS WHERE DIVSEQNUM = A.DIVSEQNUM AND STCLASS = A.STCLASS AND STLORG = A.STLORG AND STLDATE = A.STLDATE) ZDATE_END,   ');
  QUERY2.SQL.ADD(' 	    (SELECT SYEAR2   FROM PSHLBAS WHERE DIVSEQNUM = A.DIVSEQNUM AND STCLASS = A.STCLASS AND STLORG = A.STLORG AND STLDATE = A.STLDATE) ZYEAR2,      ');
  QUERY2.SQL.ADD(' 	    (SELECT SYEAR    FROM PSHLBAS WHERE DIVSEQNUM = A.DIVSEQNUM AND STCLASS = A.STCLASS AND STLORG = A.STLORG AND STLDATE = A.STLDATE) ZYEAR,       ');
  QUERY2.SQL.ADD(' 	    (SELECT STYPE    FROM PSHLBAS WHERE DIVSEQNUM = A.DIVSEQNUM AND STCLASS = A.STCLASS AND STLORG = A.STLORG AND STLDATE = A.STLDATE) ZREPAY_TYPE, ');
  QUERY2.SQL.ADD(' 	    (SELECT STIRATE  FROM PSHLBAS WHERE DIVSEQNUM = A.DIVSEQNUM AND STCLASS = A.STCLASS AND STLORG = A.STLORG AND STLDATE = A.STLDATE) ZRATE,       ');
  QUERY2.SQL.ADD(' 	    ''KRW'' WAERS, A.STLAMT  ZROAN_AMT1,                                                                                                            ');
  QUERY2.SQL.ADD('          (SELECT SUM(EXCPAMT) FROM PSEMHIS WHERE CORPNAME = A.CORPNAME AND DIVSEQNUM = A.DIVSEQNUM AND STCLASS = A.STCLASS AND STLORG = A.STLORG AND EMPNO = A.EMPNO AND EXDATE < :SDATE) ZROAN_AMT2, ');
  QUERY2.SQL.ADD('          (SELECT SUM(EXCPAMT) FROM PSEMHIS WHERE CORPNAME = A.CORPNAME AND DIVSEQNUM = A.DIVSEQNUM AND STCLASS = A.STCLASS AND STLORG = A.STLORG AND EMPNO = A.EMPNO AND EXDATE = :SDATE) ZROAN_AMT3, ');
  QUERY2.SQL.ADD(' 	    TO_CHAR(SYSDATE, ''YYYYMMDD'') ZDATE_CRE, '''' ZSTATUS ,''N'' EAI_FLAG, '''' EAI_DATE, '''+GSsysdate+''' WRITETIME, '''+GSempno+''' WRITEMAN    ');
  QUERY2.SQL.ADD('     FROM PSLMAS A ,                                                                                                             ');
  QUERY2.SQL.ADD('               (Select Empno, X.Orgnum, Case When (X.Tribegb=''2'' And Y.Tribegb=''2'') Or (M.Tjobduty=''09'') Then M.Jobdept  Else M.Deptcode End Deptcode ');
  QUERY2.SQL.ADD('                From Pimpmas M, Pycdept X, Pycdept Y                                                            ');
  QUERY2.SQL.ADD('                Where M.Orgnum=X.Orgnum And M.Deptcode=X.Deptcode                                               ');
  QUERY2.SQL.ADD('                  and m.orgnum=y.orgnum and m.jobdept =y.deptcode ) z                                           ');
  QUERY2.SQL.ADD('    WHERE  a.Empno = Z.Empno                                                                                    ');
  QUERY2.SQL.ADD('       and       EXISTS(SELECT * FROM PSEMHIS                                                                          ');
  QUERY2.SQL.ADD('                 WHERE DIVSEQNUM(+) = A.DIVSEQNUM AND EMPNO(+)   = A.EMPNO   AND STCLASS(+)  = A.STCLASS        ');
  QUERY2.SQL.ADD('                   AND STLORG(+)    = A.STLORG    AND STLDATE(+) = A.STLDATE AND CORPNAME(+) = A.CORPNAME       ');
  QUERY2.SQL.ADD('                   AND EXDATE(+) = :SDATE         AND STLORG    = ''ZZ''         AND CORPNAME  = ''하나로'')) A ');
  Query2.SQL.ADD('  where not((ZROAN_AMT2 = 0 AND (ZROAN_AMT1-(ZROAN_AMT2+ZROAN_AMT3)) = 0)                                       ');
  Query2.SQL.ADD('         or (ZROAN_AMT3 = 0 And (ZROAN_AMT1-(ZROAN_AMT2+ZROAN_AMT3)) = 0))                                      ');
  QUERY2.SQL.ADD('  GROUP BY SEQNO, BUKRS, BUDAT, ZEMP_NO, ZLOAN_TYPE, SEQ                                                                                                  ');
  QUERY2.SQL.ADD('  ORDER BY ZEMP_NO, SEQ                                                                                                                                   ');

{ HeeYong(2011.06.30) : 같은달에 여러번 나누어서 상환 할 경우, 오류발생하여 위의 문장으로 수정함.
               Sample : SELECT * FROM psemhis WHERE EXDATE = '201106' AND EMPNO = '0078' AND DIVSEQNUM = '3'
  Query2.SQL.ADD(' insert into POKLDMAS                                                                                                                                     ');
  Query2.SQL.ADD(' Select SEQNO, BUKRS, BUDAT, ZEMP_NO, ZLOAN_TYPE, SEQ, ZNAME, KOSTL, ZDATE_START, ZDATE_START2,                                                           ');
  Query2.SQL.ADD('        ZDATE_END, ZYEAR2, ZYEAR, ZREPAY_TYPE, ZRATE, WAERS, ZROAN_AMT1, ZROAN_AMT2, ZROAN_AMT3, ZROAN_AMT4,                                              ');
  Query2.SQL.ADD(' 	  ZDATE_CRE, ZSTATUS, EAI_FLAG, EAI_DATE, WRITETIME, WRITEMAN                                                                                       ');
  Query2.SQL.ADD('   from                                                                                                                                                   ');
  Query2.SQL.ADD('  (select '+inttoStr(Seqno)+' seqno,''H100'' BUKRS, to_char(Last_day(To_date('''+ME_exyymm.Text+'''||''25'')),''YYYYMMDD'') BUDAT,                        ');
  Query2.SQL.ADD('          a.empno ZEMP_NO, ''2''   ZLOAN_TYPE,                                                                                                            ');
  Query2.SQL.ADD(' 	    to_number(a.divseqnum||a.stclass) SEQ,                                                                                                          ');
  Query2.SQL.ADD(' 	    a.korname ZNAME,                                                                                                                                ');
  Query2.SQL.ADD(' 	    (Select fincode  from pycdept                                                                                                                   ');
  Query2.SQL.ADD(' 	      where orgnum   = (select orgnum   from pimpmas where empno = a.empno)                                                                         ');
  Query2.SQL.ADD(' 	        and deptcode = (select deptcode from pimpmas where empno = a.empno)) KOSTL, a.STLDATE ZDATE_START,                                          ');
  Query2.SQL.ADD(' 	    (select STESDATE from pshlbas where divseqnum = a.divseqnum and stclass = a.stclass and stlorg = a.stlorg and stldate = a.stldate) ZDATE_START2,');
  Query2.SQL.ADD(' 	    (select STEDDATE from pshlbas where divseqnum = a.divseqnum and stclass = a.stclass and stlorg = a.stlorg and stldate = a.stldate) ZDATE_END,   ');
  Query2.SQL.ADD(' 	    (select SYEAR2   from pshlbas where divseqnum = a.divseqnum and stclass = a.stclass and stlorg = a.stlorg and stldate = a.stldate) ZYEAR2,      ');
  Query2.SQL.ADD(' 	    (select SYEAR    from pshlbas where divseqnum = a.divseqnum and stclass = a.stclass and stlorg = a.stlorg and stldate = a.stldate) ZYEAR,       ');
  Query2.SQL.ADD(' 	    (select STYPE    from pshlbas where divseqnum = a.divseqnum and stclass = a.stclass and stlorg = a.stlorg and stldate = a.stldate) ZREPAY_TYPE, ');
  Query2.SQL.ADD(' 	    (select STIRATE  from pshlbas where divseqnum = a.divseqnum and stclass = a.stclass and stlorg = a.stlorg and stldate = a.stldate) ZRATE,       ');
  Query2.SQL.ADD(' 	    ''KRW'' WAERS, a.STLAMT  ZROAN_AMT1,                                                                                                            ');
  Query2.SQL.ADD(' 	    case when (substr(a.EXDATE,1,6) is null) or (substr(a.EXDATE,1,6) >= :SDate)  then a.STBIAMT                                                    ');
  Query2.SQL.ADD(' 	    else case when (substr(a.EXDATE,1,6) is not null) and (substr(a.EXDATE,1,6) < :SDate) then a.STBIAMT- a.EXCPAMT                                 ');
  Query2.SQL.ADD(' 	              else a.STLAMT - a.EXCPamt end end  ZROAN_AMT2,                                                                                        ');
  Query2.SQL.ADD(' 	    NVL(b.EXCPamt,0) ZROAN_AMT3,                                                                                                                    ');
  Query2.SQL.ADD(' 	    case when (substr(a.EXDATE,1,6) is null) or (substr(a.EXDATE,1,6) <= :SDate)  then a.STIRAMT else a.STIRAMT + a.EXCPamt end ZROAN_AMT4,         ');
  Query2.SQL.ADD(' 	    to_char(sysdate, ''YYYYMMDD'') ZDATE_CRE, '''' ZSTATUS ,''N'' EAI_FLAG, '''' EAI_DATE, '''+GSsysdate+''' WRITETIME, '''+GSempno+''' WRITEMAN    ');
  Query2.SQL.ADD('     from pslmas a, psemhis b                                                                                                                             ');
  Query2.SQL.ADD('    where a.DIVSEQNUM = b.DIVSEQNUM(+) and a.EMPNO     = b.EMPNO    (+) and a.STCLASS   = b.STCLASS  (+)                                                  ');
  Query2.SQL.ADD('      and a.STLORG    = b.STLORG   (+) and a.STLDATE   = b.STLDATE  (+) and a.CORPNAME  = b.CORPNAME (+)                                                  ');
  Query2.SQL.ADD('      and b.exdate(+) = :SDate         and a.STLORG    = ''ZZ''         and a.corpname  = ''하나로''     ) a                                              ');
  Query2.SQL.ADD('  where not((ZROAN_AMT2 = 0 And ZROAN_AMT4 = 0) or (ZROAN_AMT3 = 0 And ZROAN_AMT4 = 0))                                                                   ');
  Query2.SQL.ADD('  order by ZEMP_NO, SEQ                                                                                                                                   ');
}
  Query2.ParamByName('SDATE').AsString :=  ME_exyymm.Text;
  Query2.ExecSql;

  Query2.Close;

//  CmdStr := '/var/mte/adapter/conf/DEV5/PIM/PIM.PIMFI2010B.SND.sh';     // 개발장비경로
  CmdStr := '/var/mte/adapter/conf/MIS2/PIM/PIM.PIMFI2010B.SND.sh';   // 운영장비경로

  with TDS_batch do
  begin
       Close;
       ServiceName := 'HINSA_batch';
       ClearFieldInfo;
       ClearParamInfo;
       AddParam('cmdstr', 300, CmdStr);
       Try
           TDS_batch.Execute;
       except
           begin
                Query2.Close;
                Query2.SQL.Clear;
                Query2.SQL.ADD(' Delete from POKLDMAS  ');
                Query2.SQL.ADD('  Where Budat like  '''+ME_exyymm.Text+'''||''%'' ');
                Query2.SQL.ADD('    And Zloan_type  = ''2''                       ');
                Query2.SQL.ADD('    And Seqno       = '+inttoStr(Seqno)+'         ');
                Query2.ExecSql;
                P_help.caption := ' 전송작업이 실패했습니다...';
                exit;
           end;
       end;
       P_help.caption := ' 전송작업이 완료되었습니다...'
  end;

end;

procedure TF_psc31201.BB_excelClick(Sender: TObject);
var  Seqno    : integer;
     XL, XArr : Variant;
     i,j,k    : integer;
     SavePlace: TBookmark;
begin
   Query1.Close;
   Query1.SQL.Clear;
   Query1.SQL.ADD('Select nvl(Max(seqno),0) seqno from POKLDMAS     ');
   Query1.SQL.ADD(' where Budat like  '''+ME_exyymm.Text+'''||''%'' ');
   Query1.SQL.ADD('   and Zloan_type  = ''2''                       ');
   Query1.Open;

   Seqno := Query1.FieldByName('Seqno').AsInteger;
   if  Seqno = 0 then
   begin
        MessageDlg('당월의 IFRS 전송내역이 없습니다.', MtWarning, [mbok], 0);
        exit;
   end;

   ExcelQry.Close;
   ExcelQry.SQL.Clear;
   ExcelQry.SQL.ADD('Select SEQNO, BUKRS, BUDAT, ZEMP_NO, ZLOAN_TYPE,     ');
   ExcelQry.SQL.ADD('       SEQ, ZNAME, KOSTL, ZDATE_START, ZDATE_START2, ');
   ExcelQry.SQL.ADD('       ZDATE_END, ZYEAR2, ZYEAR, ZREPAY_TYPE, ZRATE, ');
   ExcelQry.SQL.ADD('       WAERS, ZROAN_AMT1, ZROAN_AMT2, ZROAN_AMT3,    ');
   ExcelQry.SQL.ADD('  	    ZROAN_AMT4, ZDATE_CRE, ZSTATUS, EAI_FLAG,     ');
   ExcelQry.SQL.ADD('       EAI_DATE, WRITETIME, WRITEMAN from POKLDMAS   ');
   ExcelQry.SQL.ADD(' where Budat like  '''+ME_exyymm.Text+'''||''%''     ');
   ExcelQry.SQL.ADD('   and Zloan_type  = ''2''                           ');
   ExcelQry.SQL.ADD('   and Seqno       = '+inttoStr(Seqno)+'             ');
   ExcelQry.Open;

   if ExcelQry.RecordCount < 1 then
   begin
     showmessage('엑셀 변환할 자료가 없습니다.');
     exit;
   end;

   XArr := VarArrayCreate([1, 26], VarVariant);
   try
     XL := CreateOLEObject('Excel.Application');
   except
     MessageDlg('Excel이 설치되어 있지 않습니다.', MtWarning, [mbok], 0);
     Exit;
   end;

   XL.WorkBooks.Add; //새로운 페이지 생성
   XL.Visible := false;

   XL.WorkSheets[1].Name := '우리사주 IFRS 전송내역';  //시트명 부여
   XL.Range['A1:Z2'].Merge;                        //셀 병합
   XL.Range['A1'].value := '우리사주 IFRS 전송내역_'+ME_exyymm.Text; //TITLE NAME 설정
   XL.Range['A1'].font.Size := 11;
     //컬럼명 지정_서브타이블 지정
   XArr[ 1]  := '순번'        ;
   XArr[ 2]  := '회사코드'    ;
   XArr[ 3]  := '전표기일'    ;
   XArr[ 4]  := '사번'        ;
   XArr[ 5]  := '대여금유형'  ;
   XArr[ 6]  := '회차'        ;
   XArr[ 7]  := '성명'        ;
   XArr[ 8]  := '부서코드'    ;
   XArr[ 9]  := '대출일'      ;
   XArr[10]  := '상환시작일'  ;
   XArr[11]  := '만기상환일'  ;
   XArr[12]  := '거치기간'    ;
   XArr[13]  := '대출기간'    ;
   XArr[14]  := '상환조건'    ;
   XArr[15]  := '이자율'      ;
   XArr[16]  := '통화키'      ;
   XArr[17]  := '대출금'      ;
   XArr[18]  := '전월미상환액';
   XArr[19]  := '상환액'      ;
   XArr[20]  := '총미상환액'  ;
   XArr[21]  := '생성일자'    ;
   XArr[22]  := '상태'        ;
   XArr[23]  := 'EAI전송여부' ;
   XArr[24]  := 'EAI전송시간' ;
   XArr[25]  := '작업시간'      ;
   XArr[26]  := '작업자'    ;

   XL.Range['A3' , 'Z3'].Value := XArr;

   k := 3;
   for i := 1 to ExcelQry.FieldCount do
   begin
      XL.Range[CHR(64 + i) + '3'].HorizontalAlignment := 3;
      XL.Range[CHR(64 + i) + '3'].Interior.Color:= $00CBF0B3;
      XL.Range[CHR(64 + i) + '3'].font.Size := 10;
      XL.Range[CHR(64 + i) + '3'].font.Bold := True;
   end;

   //검색된 자료를 excel에 export처리 시킨다.
   ExcelQry.First;     //Showmessage(inttostr(ExcelQry.RecordCount));

   for i := 1 to  ExcelQry.RecordCount do
   begin
      XArr[ 1]  := ExcelQry.FieldbyName('SEQNO').AsString;
      XArr[ 2]  := ExcelQry.FieldbyName('BUKRS').AsString;
      XArr[ 3]  := ExcelQry.FieldByName('BUDAT').AsString;
      XArr[ 4]  := ''''+ExcelQry.FieldByName('ZEMP_NO').AsString;
      XArr[ 5]  := ExcelQry.FieldByName('ZLOAN_TYPE').AsString;
      XArr[ 6]  := ExcelQry.FieldbyName('SEQ').AsString;
      XArr[ 7]  := ExcelQry.FieldbyName('ZNAME').AsString;
      XArr[ 8]  := ExcelQry.FieldbyName('KOSTL').AsString;
      XArr[ 9]  := ExcelQry.FieldByName('ZDATE_START').AsString;
      XArr[10]  := ExcelQry.FieldByName('ZDATE_START2').AsString;
      XArr[11]  := ExcelQry.FieldByName('ZDATE_END').AsString;
      XArr[12]  := ExcelQry.FieldbyName('ZYEAR2').AsString;
      XArr[13]  := ExcelQry.FieldbyName('ZYEAR').AsString;
      XArr[14]  := ExcelQry.FieldByName('ZREPAY_TYPE').AsString;
      XArr[15]  := ExcelQry.FieldByName('ZRATE').AsString;
      XArr[16]  := ExcelQry.FieldByName('WAERS').AsString;
      XArr[17]  := ExcelQry.FieldbyName('ZROAN_AMT1').AsString;
      XArr[18]  := ExcelQry.FieldbyName('ZROAN_AMT2').AsString;
      XArr[19]  := ExcelQry.FieldByName('ZROAN_AMT3').AsString;
      XArr[20]  := ExcelQry.FieldByName('ZROAN_AMT4').AsString;
      XArr[21]  := ExcelQry.FieldByName('ZDATE_CRE').AsString;
      XArr[22]  := ExcelQry.FieldbyName('ZSTATUS').AsString;
      XArr[23]  := ExcelQry.FieldbyName('EAI_FLAG').AsString;
      XArr[24]  := ExcelQry.FieldByName('EAI_DATE').AsString;
      XArr[25]  := ExcelQry.FieldByName('WRITETIME').AsString;
      XArr[26]  := ''''+ExcelQry.FieldByName('WRITEMAN').AsString;
      XL.Range['A' + IntToStr(k+1), 'Z'+intToStr(k+1)].Value := XArr;
      inc(k);
      ExcelQry.Next;
   end;
   //여기서 부터는 EXPORT된 EXCEL자료를 예쁘게 꾸미는 부분입니다.
   XL.Range['A1', 'Z' + IntToStr(k)].Borders.LineStyle := 1;    //테두리선을 만든다.  1은 실선
   XL.Range['A1', 'Z' + IntToStr(k)].Borders.Weight := 2;       //테두리선 두깨 설정  2는 보통두깨, 3은 무지 두꺼움
   XL.Range['A1', 'Z' + IntToStr(k)].Borders.ColorIndex := 1;   //테두리선 색상설정  1은 검은색
   XL.Range['A1', 'Z' + IntToStr(k)].font.name := '굴림체';
   XL.Range['A1', 'A1'].HorizontalAlignment := 3;               //가운데 정렬
   XL.Range['A3', 'Z' + IntToStr(k)].font.Size := 9;
   XL.Range['D4', 'Z' + IntToStr(k)].HorizontalAlignment :=  1; //우측정렬
   XL.Range['A1', 'Z' + IntToStr(k)].Select;                    //자료를 모두 SELECT한 후 --하는 이유:  AutoFit 처리하기 위해서임

   XL.Selection.Columns.AutoFit;                                //자동정렬
   XL.Range['A4', 'A4'].Select;                                 //A4열에 커서 위치시킴
   XL.Visible := true;                                          //엑셀자료 보여줌
   Screen.Cursor := crDefault;

end;

procedure TF_psc31201.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     if FileExists('c:\jissi.sql') then    DeleteFile('c:\jissi.sql');
end;

procedure TF_psc31201.FormCreate(Sender: TObject);
var
  i : Integer;
begin
  Application.ProcessMessages;
  GSempno    := PassEmp(cmdline,1);
  GSkorname  := PassEmp(cmdline,2);
  GSPassword := PassEmp(cmdline,3);
  GSgrade    := PassEmp(cmdline,4);

  for i := 0 to DB1.Params.Count - 1 do
  begin
    if System.Pos('SERVER NAME',DB1.Params[i]) > 0 then
      DB1.Params[i] := 'SERVER NAME=' + PassEmp(cmdline,13);
    if Pos('USER NAME',DB1.Params[i]) > 0 then
      DB1.Params[i] := 'USER NAME='+PassEmp(CmdLine,5);
    if Pos('PASSWORD',DB1.Params[i]) > 0 then
     DB1.Params[i]  := 'PASSWORD='+PassEmp(CmdLine,6);
  end;
  DB1.connected := True;

  TMaxSession.ServiceTimeOut := 1000;
  TMaxSession.Connect     := False;
  TMaxSession.EnvFileName := GetHomeDir+'\newhana.env';
//  TMaxSession.EnvFileName := 'd:\source\newhana.env';
  TMaxSession.LabelName   := 'HANAROHPER';

  Try
    TMaxSession.Connect := True;
    TMaxSession.TMax_Begin(5000);
  except
    Application.MessageBox(PChar('APP서버 접속 실패'),'에러',mb_ok);
    Application.Terminate;
    Exit;
  end;
  
  Query1.Close;
  Query1.sql.Clear;
  Query1.sql.Add('select to_char(sysdate,''YYYYMMDDHH24MISSD'') T1 from dual  ');
  Query1.Open;
  GSsysdate := Query1.FieldByName('T1').AsString;
  L_sysdate.Caption := Copy(GSsysdate,1,4) + '-' +  Copy(GSsysdate,5,2) + '-' +
                       Copy(GSsysdate,7,2);
  L_empinfo.Caption := GSkorname + '(' + GSempno + ')';
  ME_exyymm.text    := Copy(GSsysdate,1,6);

  Application.ProcessMessages;
end;

procedure TF_psc31201.BTN_1Click(Sender: TObject);
var XL, XArr: Variant;
    i,j,k: integer;
    SavePlace: TBookmark;
begin
  case TComponent(Sender).Tag  of
  1: with ExcelQry do     //기관별
    begin
      close;
      Sql.Clear;
      Sql.Add('select a.divseqnum 배정차수,                           ');
      Sql.Add(''' '' 주식구분,                                        ');
      Sql.Add('(select codename from pyccode                          ');
      Sql.Add(' where codeid = ''K910''                               ');
      Sql.Add('   and a.stlorg = codeno(+)) 대부기관,                 ');
      Sql.Add('a.empno 사번, a.korname 성명,                          ');
      Sql.Add('       (select codename from pyccode                   ');
      Sql.Add('         where codeid = ''I114''                       ');
      Sql.Add('           and codeno = b.pstate) 인사상태,            ');
      Sql.Add('       b.juminid 주민번호,                             ');
      Sql.Add('       max(c.bankacnt) 계좌번호,                       ');
      Sql.Add('       sum(a.excpamt) 당월원금,sum(a.exiamt) 당월이자, ');
      Sql.Add('       sum(exdedamt) 당월원리금                        ');
      Sql.Add('  from psemhis a, pimpmas b, pslmas c                  ');
      Sql.Add(' where a.exdate    = '''+ME_exyymm.Text+'''            ');
      Sql.Add('   and a.empno     = b.empno                           ');
      Sql.Add('   and a.corpname  = c.corpname                        ');
      Sql.Add('   and a.divseqnum = c.divseqnum                       ');
      Sql.Add('   and a.stclass   = c.stclass                         ');
      Sql.Add('   and a.stlorg    = c.stlorg                          ');
      Sql.Add('   and a.empno     = c.empno                           ');
      Sql.Add('   and a.exdedamt  > 0                                 ');
      Sql.Add('   and a.exyn      = ''Y''                             ');
      Sql.Add(' group by a.divseqnum, a.stlorg, a.empno, a.korname, b.pstate, b.juminid ');
      Sql.Add(' order by 1,2,3                                        ');
      open;
    end;

  2: with ExcelQry do     //은행
    begin
      close;
      Sql.Clear;
      Sql.Add('select                                                 ');
      Sql.Add(''' '' 배정차수,                                        ');
      Sql.Add(''' '' 주식구분,                                        ');
      Sql.Add(''' '' 대부기관,                                        ');
      Sql.Add('a.empno 사번, a.korname 성명,                          ');
      Sql.Add('       (select codename from pyccode                   ');
      Sql.Add('         where codeid = ''I114''                       ');
      Sql.Add('           and codeno = b.pstate) 인사상태,            ');
      Sql.Add('       b.juminid 주민번호,                             ');
      Sql.Add('       max(c.bankacnt) 계좌번호,                       ');
      Sql.Add('       sum(a.excpamt) 당월원금,sum(a.exiamt) 당월이자, ');
      Sql.Add('       sum(exdedamt) 당월원리금                        ');
      Sql.Add('  from psemhis a, pimpmas b, pslmas c                  ');
      Sql.Add(' where a.exdate    = '''+ME_exyymm.Text+'''            ');
      Sql.Add('   and a.corpname  = ''하나로''                        ');
      Sql.Add('   and a.stlorg    = ''ZZ''                            ');
      Sql.Add('   and a.empno     = b.empno                           ');
      Sql.Add('   and a.corpname  = c.corpname                        ');
      Sql.Add('   and a.divseqnum = c.divseqnum                       ');
      Sql.Add('   and a.stclass   = c.stclass                         ');
      Sql.Add('   and a.stlorg    = c.stlorg                          ');
      Sql.Add('   and a.empno     = c.empno                           ');
      Sql.Add('   and a.exdedamt  > 0                                 ');
      Sql.Add('   and a.exyn      = ''Y''                             ');
      Sql.Add(' group by a.empno, a.korname, b.pstate, b.juminid      ');
      Sql.Add(' order by 1,2                                          ');
      open;
    end;

  3: with ExcelQry do     //은행
    begin
      close;
      Sql.Clear;
      Sql.Add('select                                                 ');
      Sql.Add(''' '' 배정차수,                                        ');
      Sql.Add(''' '' 주식구분,                                        ');
      Sql.Add(''' '' 대부기관,                                        ');
      Sql.Add('a.empno 사번, a.korname 성명,                          ');
      Sql.Add('       (select codename from pyccode                   ');
      Sql.Add('         where codeid = ''I114''                       ');
      Sql.Add('           and codeno = b.pstate) 인사상태,            ');
      Sql.Add('       b.juminid 주민번호,                             ');
      Sql.Add('       max(c.bankacnt) 계좌번호,                       ');
      Sql.Add('       sum(a.excpamt) 당월원금,sum(a.exiamt) 당월이자, ');
      Sql.Add('       sum(exdedamt) 당월원리금                        ');
      Sql.Add('  from psemhis a, pimpmas b, pslmas c                  ');
      Sql.Add(' where a.exdate    = '''+ME_exyymm.Text+'''            ');
      Sql.Add('   and a.corpname  = ''하나로''                        ');
      Sql.Add('   and a.stlorg    <> ''ZZ''                           ');
      Sql.Add('   and a.empno     = b.empno                           ');
      Sql.Add('   and a.corpname  = c.corpname                        ');
      Sql.Add('   and a.divseqnum = c.divseqnum                       ');
      Sql.Add('   and a.stclass   = c.stclass                         ');
      Sql.Add('   and a.stlorg    = c.stlorg                          ');
      Sql.Add('   and a.empno     = c.empno                           ');
      Sql.Add('   and a.exdedamt  > 0                                 ');
      Sql.Add('   and a.exyn      = ''Y''                             ');
      Sql.Add(' group by a.empno, a.korname, b.pstate, b.juminid      ');
      Sql.Add(' order by 1,2                                          ');
      open;
    end;
  End;

  if ExcelQry.RecordCount < 1 then
  begin
    showmessage('엑셀 변환할 자료가 없습니다.');
    exit;
  end;

  XArr := VarArrayCreate([1, 11], VarVariant);
  try
    XL := CreateOLEObject('Excel.Application');
  except
    MessageDlg('Excel이 설치되어 있지 않습니다.', MtWarning, [mbok], 0);
    Exit;
  end;

  XL.WorkBooks.Add; //새로운 페이지 생성
  XL.Visible := false;

  case TComponent(Sender).Tag  of
    1: XL.WorkSheets[1].Name := '기관별';        //시트명 부여
    2: XL.WorkSheets[1].Name := '개인별(회사)';  //시트명 부여
    3: XL.WorkSheets[1].Name := '개인별(은행)';  //시트명 부여
  end;

  //TITLE NAME 설정
  case TComponent(Sender).Tag  of
    1: XL.Range['A1'].value := '회사_'+ME_exyymm.Text;
    2: XL.Range['A1'].value := '개인별(회사)_'+ME_exyymm.Text;
    3: XL.Range['A1'].value := '개인별(은행)_'+ME_exyymm.Text;
  end;

  XL.Range['A1:K2'].Merge;               //셀 병합
  XL.Range['A1'].font.Size := 11;

  //컬럼명 지정_서브타이블 지정
  XArr[ 1]  := '배정차수'  ;
  XArr[ 2]  := '주식구분'  ;
  XArr[ 3]  := '대부기관'  ;
  XArr[ 4]  := '사원번호'  ;
  XArr[ 5]  := '사원성명'  ;
  XArr[ 6]  := '인사상태'  ;
  XArr[ 7]  := '주민번호'  ;
  XArr[ 8]  := '계좌번호'  ;
  XArr[ 9]  := '당월원금'  ;
  XArr[10]  := '당월이자'  ;
  XArr[11]  := '당월원리금';

  XL.Range['A3' , 'K3'].Value := XArr;
  k := 3;
  for i := 1 to 11 do
  begin
     XL.Range[CHR(64 + i) + '3'].HorizontalAlignment := 3;
     XL.Range[CHR(64 + i) + '3'].Interior.Color:= $00CBF0B3;
     XL.Range[CHR(64 + i) + '3'].font.Size := 10;
     XL.Range[CHR(64 + i) + '3'].font.Bold := True;
  end;

  //검색된 자료를 excel에 export처리 시킨다.
  ExcelQry.First;     //Showmessage(inttostr(Qry_pmas.RecordCount));

  for i := 1 to  ExcelQry.RecordCount do
  begin
     XArr[ 1]  := ExcelQry.FieldbyName('배정차수').AsString;
     XArr[ 2]  := ExcelQry.FieldbyName('주식구분').AsString;
     XArr[ 3]  := ExcelQry.FieldbyName('대부기관').AsString;
     XArr[ 4]  := ''''+ExcelQry.FieldbyName('사번').AsString;
     XArr[ 5]  := ExcelQry.FieldbyName('성명').AsString;
     XArr[ 6]  := ExcelQry.FieldbyName('인사상태').AsString;
     XArr[ 7]  := Copy(ExcelQry.FieldByName('주민번호').AsString, 1, 14);// +  '*****';
     XArr[ 8]  := ExcelQry.FieldByName('계좌번호').AsString;
     XArr[ 9]  := ExcelQry.FieldByName('당월원금').AsString;
     XArr[10]  := ExcelQry.FieldByName('당월이자').AsString;
     XArr[11]  := ExcelQry.FieldByName('당월원리금').AsString;
     XL.Range['A' + IntToStr(k+1), 'K' + IntToStr(k+1)].Value := XArr;
     inc(k);
     ExcelQry.Next;
  end;
  //여기서 부터는 EXPORT된 EXCEL자료를 예쁘게 꾸미는 부분입니다.
   XL.Range['A1', 'K' + IntToStr(k)].Borders.LineStyle := 1;    //테두리선을 만든다.  1은 실선
   XL.Range['A1', 'K' + IntToStr(k)].Borders.Weight := 2;       //테두리선 두깨 설정  2는 보통두깨, 3은 무지 두꺼움
   XL.Range['A1', 'K' + IntToStr(k)].Borders.ColorIndex := 1;   //테두리선 색상설정  1은 검은색
   XL.Range['A1', 'K' + IntToStr(k)].font.name := '굴림체';
   XL.Range['A1', 'A1'].HorizontalAlignment := 3;               //가운데 정렬
   XL.Range['A3', 'K' + IntToStr(k)].font.Size := 9;
   XL.Range['E4', 'K' + IntToStr(k)].HorizontalAlignment :=  1; //우측정렬
   XL.Range['A1', 'K' + IntToStr(k)].Select;                    //자료를 모두 SELECT한 후 --하는 이유:  AutoFit 처리하기 위해서임
   XL.Selection.Columns.AutoFit;                                //자동정렬
   XL.Range['A4', 'A4'].Select;                                 //A4열에 커서 위치시킴
   XL.Visible := true;                                          //엑셀자료 보여줌
   Screen.Cursor := crDefault;
end;

end.
