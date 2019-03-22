{ header
 ----------------------------------------------------------------------------
  PROGRAM-NAME    : PIC7030a(조직개편 부서배치)
  SYSTEM-NAME     : 종합인사정보
  SUBSYSTEM-NAME  : 인사
  Programmer      : 박규석
  Version         : 30.00
  Date            : 1998.12.29
  
  Update Contents
   버전    수정일     수정자   수정내용             관련근거
  30.00   1998.12.29  박규석   직위,직급수정        하나로인사재개발
  30.01   2000.10.18  강기우   처리Logic 변경       하병수 대리요청.
 ---------------------------------------------------------------------------}


{ *********    1. 조직개편시(차수변경없이 일부 조직만 변경)  --->annono = 'N' ************
  1. 선택한 차수변경일에대한 사원을 추출.
  2. 특정부서만 배치후 부서이동.
    a) 특정 인물 배치는  실제전보.     ------|  '배치'버튼누를시--> Confyn='M'(Move)
    b) 나머지 같은 부서이원은 조직전보.------|
  3. 배치하지 않은 부서는 인사발령안 등록시 발령을 내지 않는다.  Confyn='N'

  *********    2. 차수변경시          ------> annono = 'Y'  ******************************
  1. 선택한 차수변경일에대한 사원을 추출.
  2. 추출시 배치부서명칭 <> 현부서명칭  다르면   조직전보.
            배치부서명칭 =  현부서명칭  같으면   차수변경.
  3. 특정인을 배치후 부서이동.
     a)  특정 부서지정시에       실제전보발령.        --------| '배치'버튼시

  11 -- 실제 전보.
  12 -- 조직 전보.

  * andepcode----> 세부구분
}

unit pic70301;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, jgrid, jeonLab, Mask, pass,
  HanEdit, jeonPan, Db, DBTables, Timeftp, codelib, datelib, ComCtrls, quickrpt, fempno;

type WorkData = record
   PayraYn  : string;
   Boncode  : string;
   Extcode  : string;
   Orgnum   : string;
   Deptcode : string;
end;

type SaveData = record
   dporgnum   : string;
   dpdeptcode : string;
   dpdeptlevel: string;
   dpextcode  : string;
   dpboncode  : string;
   dppayra    : string;
   dppayrayn  : string;
   trgubun    : string;
   confyn     : string;   
end;

type PrnData = record
    gubun     : string[1];
    no        : string[4];
    empno     : string[4];
    korname   : string[12];
    paycl     : string[10];
    deptname  : string[60];
    payra     : string[20];
    empdate   : string[10];
    cpaycldate: string[10];
    realtrdate: string[10];
    dpdeptname: string[30];
    dppayra   : string[20];
end;

type
  TMainForm = class(TForm)
    JeonPanel1: TJeonPanel;
    L_UserName: TLabel;
    L_CurDate: TLabel;
    JeonPanel2: TJeonPanel;
    JeonPanel4: TJeonPanel;
    Bdept1: TSpeedButton;
    Bdept2: TSpeedButton;
    Bpayra: TSpeedButton;
    Bindicate: TSpeedButton;
    Brelease: TSpeedButton;
    JeonPanel5: TJeonPanel;
    JeonPanel6: TJeonPanel;
    deptcode: THanEdit;
    Ordby1: TJeonPanel;
    Ordby2: TJeonPanel;
    Ordby3: TJeonPanel;
    JeonPanel11: TJeonPanel;
    JeonPanel12: TJeonPanel;
    dpdeptcode: THanEdit;
    dppayra: THanEdit;
    Nedeptcode: TJeonPanel;
    Nedpdeptcode: TJeonPanel;
    Nedppayra: TJeonPanel;
    JeonPanel7: TJeonPanel;
    JeonLabel1: TJeonLabel;
    JeonLabel2: TJeonLabel;
    JeonLabel3: TJeonLabel;
    JeonLabel4: TJeonLabel;
    JeonLabel5: TJeonLabel;
    JeonLabel8: TJeonLabel;
    JeonLabel9: TJeonLabel;
    JeonLabel10: TJeonLabel;
    JeonPanel3: TJeonPanel;
    Lookemp: Jdbgrid;
    JeonLabel6: TJeonLabel;
    JeonLabel7: TJeonLabel;
    Panel1: TPanel;
    selEmp: TListBox;
    JeonPanel10: TJeonPanel;
    Bprn1: TBitBtn;
    Bprn2: TBitBtn;
    BSaveIndiCate: TBitBtn;
    BitBtn5: TBitBtn;
    Bexit: TBitBtn;
    Helpdsr: TJeonPanel;
    Label3: TLabel;
    lHelp: TLabel;
    Pgr: TProgressBar;
    JeonPanel8: TJeonPanel;
    Empno: THanEdit;
    BEmpno: TSpeedButton;
    Korname: THanEdit;
    JeonLabel11: TJeonLabel;
    Query1: TQuery;
    JeonPanel9: TJeonPanel;
    dpandepcode: THanEdit;
    Bdepcode: TSpeedButton;
    Nedpandepcode: TJeonPanel;
    ALBindicate: TSpeedButton;
    ALBrelease: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure BexitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LookempDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure selEmpDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure BindicateClick(Sender: TObject);
    procedure BreleaseClick(Sender: TObject);
    procedure BPitremdRunSql(Sender: TObject);
    procedure CodeExit(Sender: TObject);
    procedure CodeChange(Sender: TObject);
    procedure deptcodeKeyPress(Sender: TObject; var Key: Char);
    procedure BDeptClick(Sender: TObject);
    procedure KeyMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BpayraClick(Sender: TObject);
    procedure BSaveIndiCateClick(Sender: TObject);
    procedure BsaveReleaseClick(Sender: TObject);
    procedure BprnClick(Sender: TObject);
    procedure KeyTabControl(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EmpnoDblClick(Sender: TObject);
    procedure DataTabControl(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BdepcodeClick(Sender: TObject);
    procedure ALBindicateClick(Sender: TObject);
    procedure ALBreleaseClick(Sender: TObject);
  private
    { Private declarations }
    ChangeCheck  : Boolean;
    p_empno      : string;
    pkorname     : string;
    password     : string;
    pclass       : string;
    Homedir      : string;
    WorkGubun    : string;
    // 현작업자에 관련된 사항.
    Work       : WorkData;
    // 인사변수에서 읽어온 조직차수 및 조직개편일 임시변수.
    tremddate    : string;
    torgnum      : string;
    // 배치후 저장할 내용.
    Save         : SaveData;
    start        : integer;
    Temppart     : TJeonPanel;
    ReleaseSelect: integer; // 선택한 사원의 index 번호.
    procedure WorkGetOrgnum(vempno : string);
    procedure RemoteConnect(Gubun : integer);
    procedure ServerError;
    procedure KeyClick(Sender : TObject);
    procedure PitremdBatch(Gubun,vempno : string);
    procedure Assign_Data(TempQry : TQuery; const plank,gubun : integer);
    function  BatchCancel : Boolean;
    function  BatchDouble : Boolean;
    function  GetPitremd(Gubun : integer) : Boolean;
    function  EmpFind(str : string) : integer;
  public
    { Public declarations }
    Rpt        : TQuickRep;
    TotalPageCnt: integer;
    CheckEmpno : array[0..10000] of char;
    PrnOrderby : integer; // 출력정렬순서.
    PrnYn      : Boolean;
    CurrOrgnum : String;  // 현조직일.    
    frDeptcode,toDeptcode : string; // 출력범위.
    function  PreviligeCheck(Gubun,vempno : string) : Boolean;
    function  DeptAbbr(s1,s2 : string) : string;
  end;

var
  MainForm: TMainForm;
  TxtFile : string;
  CodeFile: string;
  PrnD    : PrnData;

implementation
uses pic70302,pic70303,pic70304,pic70306, pic70307;

{$R *.DFM}

// 서버 접속에 관련된 부분..........................................................................
procedure TMainForm.ServerError;
begin
   if Messagebox(0,Pchar('서버프로그램에 문제가 발생했습니다 !.'+#13#13+
                         '서버프로그램을 다시접속하시겠습니까 ?.'),
                   '알  림',MB_YESNO or $0030) = ID_YES then begin
      RemoteConnect(2);
      RemoteConnect(1);
   end;
end;

procedure TMainForm.RemoteConnect(Gubun : integer);
begin
   if Gubun = 1 then
   begin
     lHelp.Caption := '☞ 데이타베이스와 접속중입니다 !!.';
     Try
        CData.DataBase1.Params[0]  := 'SERVER NAME='+PassEmp(cmdline,13);
        CData.DataBase1.Params[1]  := 'USER NAME='+PassEmp(cmdline,5);
        CData.DataBase1.Params[19] := 'PASSWORD=' +PassEmp(cmdline,6);
        if CData.Database1.Connected  = False then CData.Database1.Connected := True;
     Except begin
          lHelp.Caption := '';
          Messagebox(0,PChar('데이타베이스 에러입니다 !!.'+#13#13+
                             '관리자에게 문의하신 다음 다시 실행하십시오'),
                             '알  림',MB_OK or $0030);
       end;
     End;
   end else begin
        if CData.DataBase1.Connected = True then CData.DataBase1.Connected := False;
   end;
end;

// 폼에 관련된 사항들...............................................................................
procedure TMainForm.FormCreate(Sender: TObject);
var
  i : integer;
begin
  start    := 0;
  HomeDir  := HomeDirOpen;
  Temppart := nil;
  for i := 0 to sizeof(CheckEmpno)-1 do CheckEmpno[i] := 'N';
end;

procedure TMainForm.FormActivate(Sender: TObject);
begin
  HomeDir  := HomeDirOpen;
  P_empno  := passEmp(cmdline,1);
  pkorname := passEmp(cmdline,2);
  Password := PassEmp(cmdline,3);
  Pclass   := PassEmp(cmdline,4);

  if trim(pclass) = '' then pclass := 'ZZZZZZZZZZ';
end;

{
  o 변수구분(C7),세부구분(0001)을 Key로하여 인사변수화일에서 조직개편기준일,조직개편차수를
    읽어온다.
  o 사용자 확인 및 기초자료 출력
   (1) 작업자의 등급,보임여부,차수,부서,본부,상위부서를 조직개편화일에서 읽어온다.
   (2) IF (작업자등급 = A or B or C)
       - 기초자료를 출력하지 않고 다음작업을 처리한다.
       ELSE IF (작업자보임여부 = 보임(Y))
            - 작업자의 차수,부서코드로 현부서 및 명을 출력한다.
            - 조직개편화일에서 자료를 읽어서 정렬순서대로 출력한다.
              (조직개편기준일 = 인사변수화일 조직개편기준일 AND 인사상태 < 정직(60) AND
               조직차수 = 작업자조직차수 AND 부서코드 = 현부서)
       - 정렬순서 : 현부서(부서+직위+직급+호봉+사번)
                    배치부서(배치후부서+배치후직위+직급+호봉+사번),성명(성명+사번)
       - 추출항목 : 사번,성명,조직차수,부서,직위,본부코드,상위부서코드,배치후조직차수..
                    배치후직위,발송여부
      ELSE
        - 메세지 출력 및 종료 (작업권한 없슴 !!!)
      END IF
}
procedure TMainForm.FormPaint(Sender: TObject);
const
  codeid : array[1..3] of string = ('I112','I113','I310');
var
  CurDate : string;
begin
  if Start = 0 then
  begin
    Start := 1;
    Application.ProcessMessages;
    if trim(Password) = '' then
       halt(0);

    RemoteConnect(1); // 연결
    L_UserName.Caption := pkorname+'('+p_empno+')';

    CurDate  := TimeDate(Query1);
    L_CurDate.Caption := InsaDateFormat(CurDate);

    with CData.Qcod do
    begin
      Close;
      Sql.Clear;
      Sql.Add('SELECT value1 FROM pimvari WHERE gubun=''00'' AND sgubun=''0001'' ');
      Open;
      CurrOrgnum := FieldByName('value1').AsString;  //현조직차수

      close;
      sql.clear;
      sql.add('select value1,value2 from pimvari where gubun = ''C7'' and sgubun = ''0001'' ');
      open;
      if RecordCount = 0 then
          MessageBox(0,'조직개편기준일,조직개편차수가 존재하지 않습니다.','알 림',MB_OK or $0030)
      else
      begin
          tremddate := FieldByName('value1').AsString;
          torgnum   := FieldByName('value2').AsString;
      end;
      close;
    end;
    if  CurrOrgnum = torgnum then
      CurrOrgnum := '조직개편'
    else
      CurrOrgnum := '차수변경';

    TempPart := Ordby1;
    if copy(Pclass,2,1) > 'C' then begin
       WorkGubun := '사용자';
       WorkGetOrgnum(p_empno);
       if Work.Payrayn = 'Y' then begin
          Deptcode.Text      := Work.Deptcode;
          NeDeptcode.Caption := DeptDisp(CData.Qcod,Work.Orgnum,Deptcode.Text,'');
          BPitremdRunSql(TempPart);
       end else begin
          MessageBox(0,'작업권한이 없습니다 !!.','알 림',MB_OK or $0030);
          Halt(0);
       end;
    end else begin
       WorkGubun := '관리자';
       Work.Orgnum := OrgnumDisp(CData.Qcod);
    end;

    TxtFile := HomeDir+'\list\T'+IntToStr(Application.Handle)+'.Dat';
    CodeFile:= 'T'+IntToStr(Application.Handle)+'.Cod';
    MakeCodeFile(CData.Qcod,CodeFile,codeid);
    KeyClick(Sender);
 end;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if FileExists(TxtFile) = True then
      DeleteFile(TxtFile);
   if FileExists(HomeDir+'\list\'+CodeFile) = True then
      DeleteFile(HomeDir+'\list\'+CodeFile);
end;

procedure TMainForm.BexitClick(Sender: TObject);
begin
  if MessageBox(0,'종료 하시겠습니까 ?.','확 인',MB_YESNO or $0030) = ID_YES then
     close;
end;

// 키부분을 마우스 다운을 할 경우...................................................................
procedure TMainForm.KeyMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   KeyClick(Sender);
end;

procedure TMainForm.KeyClick(Sender : TObject);
begin
   CData.Qemd.close;
   Deptcode.SelectAll;
   Deptcode.SetFocus;
   SelEmp.Items.Clear;
   LookEmp.Visible := False;
   ChangeCheck     := False;
   lHelp.Caption   := '';
end;

// 인사마스터에서 해당하는 사번의 내용을 읽어온다...................................................
function TMainForm.EmpFind(str : string) : integer;
begin
  Result := 0;
  with CData.Qsub do begin
    close; sql.clear;
    sql.add(Format('select empno,korname,deptcode from pimpmas '+
                   'where (empno = ''%s'' or korname = ''%s'')',
                   [str,str] ));
    open;
    if RecordCount > 0 then begin
       Result := RecordCount;
       Empno.Text        := FieldByName('empno').AsString;
       Korname.Text      := FieldByName('korname').AsString;
       Deptcode.Text     := FieldByName('Deptcode').AsString;
    end else Korname.Text := '';
    NeDeptcode.Caption   := DeptDisp(CData.QCod,Work.Orgnum,Deptcode.Text,'');
    close;
  end;
end;

// 부서요약명을 읽어온다............................................................................
function TMainForm.DeptAbbr(s1,s2 : string) : string;
begin
   if (trim(s1) = '') or (trim(s2) = '') then begin
      Result := '';
      system.exit;
   end;
   Try
     with CData.Qcod do begin
       close; sql.clear;
       sql.add(Format('select deptabbr,extcode,boncode from pycdept '+
                      'where  (orgnum = ''%s'' and deptcode = ''%s'') ',
              [s1,s2] ));
       open;
       if RecordCount = 0 then Result := '부서에러'
                          else Result := FieldByName('deptabbr').AsString;
       close;
     end;
   Except
      ServerError;
   End;
end;

// 조직개편화일에서 자료를 읽어온다.................................................................
function TMainForm.GetPitremd(Gubun : integer) : Boolean;
begin
  Try
     Result := False;
     with CData.Qemd do begin
       close;   sql.clear;
       sql.add(Format('select rownum rowcnt,empno,korname,orgnum,deptcode,extcode,boncode,payra, '+
                      '       paycl,dporgnum,dpdeptcode,dpextcode,dpdeptlevel,'+
                      '       dpboncode,dppayra,dppayrayn,trgubun,confyn from pitremd '+
                      'where (remddate = ''%s'' and pstate < ''60'') '+
                      '  and (orgnum   = ''%s'' and deptcode = ''%s'') ',
                      [tremddate,Work.Orgnum,Deptcode.Text] ));
       case Gubun of
        1 : sql.add('order by deptcode,payra,paycl,paygr,empno ');
        2 : sql.add('order by dpdeptcode,dppayra,paycl,paygr,empno ');
        3 : sql.add('order by empno,korname ');
       end;
       open;
       if RecordCount = 0 then begin
          close;
          System.exit;
       end;
     end;
     Result := True;
   Except
      ServerError;
   End;
end;

// 현 작업자의 조직차수 및 부서코드를 가져온다......................................................
procedure TMainForm.WorkGetOrgnum(vempno : string);
begin
   Try
     with CData.Qcod do begin
       close;   sql.clear;
       sql.add(Format('select orgnum,deptcode,payrayn,boncode,extcode from pitremd '+
                      'where empno = ''%s'' and remddate = ''%s'' ',[vempno, tremddate] ));
       Open;
       Work.PayraYn  := FieldByName('payrayn').AsString;
       Work.Boncode  := FieldByName('boncode').AsString;
       Work.Extcode  := FieldByName('extcode').AsString;
       Work.Orgnum   := FieldByName('orgnum').AsString;
       Work.Deptcode := FieldByName('deptcode').AsString;
       close;
     end;
   Except
      ServerError;
   End;
end;

{ (*) 권한을 체크한다.
  1. IF 작업자등급 = A or B or C
       - PASS
     ELSE IF (작업자부서 = 대상자부서 or 대상자의 본부코드 or 대상자의 상위부서)
       IF 대상자 발송여부 = 'Y'
          - PASS
       ELSE
          - 이미발송된 자료입니다 !!! (수정을 원하시면 인사부서로 요청하십시오.)
       END IF
     ELSE
       작업권한 없슴.
    END IF
  2. 배치작업시 경신할 배치부서를 확인한다.
     (1) 조직개편차수, 배치부서로 부서코드화일에 존재
         (단, 존재확인시 배치부서등급,상위부서코드,본부코드를 읽어오며, 경신할 배치부서가
              Space면 대상자의 현재 배치후 사항을 저장)
  3. 배치작업시 경신할 배치직위를 확인한다.
     (1) 코드화일에 존재
         (단, 경신할 배치직위가 Space면 대상자의 현재 배치후 사항를 저장)
}
function TMainForm.PreviligeCheck(Gubun,vempno : string) : Boolean;
var                            // ('배치',copy(SelEmp.Items[SelEmp.ItemIndex],1,4)) = True
  rValue : Variant;
begin
  Result := True;
  if copy(Pclass,2,1) > 'C' then
  begin
    if (Work.Deptcode = CData.Qemd.FieldByName('deptcode').AsString) or
       (Work.Deptcode = CData.Qemd.FieldByName('boncode').AsString) or
       (Work.Deptcode = CData.Qemd.FieldByName('extcode').AsString) then
       begin
       if (CData.Qemd.FieldByName('confyn').AsString = 'Y') then
       begin
         if Gubun <> '선택' then
            MessageBox(0,pChar('이미 발송된 자료입니다 !!.'#13#10+
                                '(수정을 원하시면 인사부서로 요청하십시오.)'),'알  림',MB_OK or $0030);
         Result := False;
         system.exit;
       end;
    end
    else
    begin
       if Gubun <> '선택' then MessageBox(0,'작업권한이 없습니다 !!.','알 림',MB_OK or $0030);
       Result := False;
       System.exit;
    end;
  end;

  if Gubun = '선택' then system.exit;

  Save.dporgnum    := '';
  Save.dpdeptcode  := '';
  Save.dpdeptlevel := '';
  Save.dpextcode   := '';
  Save.dpboncode   := '';
  Save.dppayra     := '';
  Save.dppayrayn   := '';
  Save.trgubun     := '';

  with CData.Qcmd do
  begin
    Close;
    sql.clear;
    sql.add(Format('select dporgnum,dpdeptcode,dpdeptlevel,dpextcode,dpboncode,dppayra,'+
                   '       dppayrayn,trgubun from pitremd '+
                   'where empno = ''%s'' and remddate = ''%s'' ',[vempno, tremddate] ));
    Open;
  end;

  if trim(dpDeptcode.Text) = '' then  //배치부서가 NULL일때.
  begin
     Save.dporgnum    := CData.Qcmd.FieldByName('dporgnum').AsString;
     Save.dpdeptcode  := CData.Qcmd.FieldByName('dpdeptcode').AsString;
     Save.dpdeptlevel := CData.Qcmd.FieldByName('dpdeptlevel').AsString;
     Save.dpextcode   := CData.Qcmd.FieldByName('dpextcode').AsString;
     Save.dpboncode   := CData.Qcmd.FieldByName('dpboncode').AsString;
  end
  else                                 //현재배치부서 저장.
  begin
//    GetPycdept(CData.Qcod,torgnum,dpDeptcode.Text,rValue);
    With CData.Qcod do
    begin
      Close;
      Sql.Clear;
      Sql.Add('SELECT deptcode, deptlevel, extcode, boncode FROM pycdept WHERE orgnum='''+torgnum+''' AND deptcode='''+dpDeptcode.Text+'''');
      Open;
      Save.dporgnum    := torgnum;
      Save.dpdeptcode  := FieldByName('deptcode').AsString;
      Save.dpdeptlevel := FieldByName('deptlevel').AsString;
      Save.dpextcode   := FieldByName('extcode').AsString;
      Save.dpboncode   := FieldByName('boncode').AsString;
    end;
  end;

  if trim(dppayra.Text) = '' then
  begin
     Save.dppayra   := CData.Qcmd.FieldByName('dppayra').AsString;
     Save.dppayrayn := CData.Qcmd.FieldByName('dppayrayn').AsString;
  end
  else
  begin
     Save.dppayra   := dppayra.text;
  end;
  CData.Qcmd.close;
end;

// 검새괸 그리드를 다시금 그린다....................................................................
procedure TMainForm.LookempDrawDataCell(Sender: TObject; const Rect: TRect;
  Field: TField; State: TGridDrawState);
  procedure DisplayDefault;
  begin
     with (Sender as Jdbgrid).Canvas do begin
        TextOut((Rect.Left+55),Rect.Top+5  ,CData.Qemd.FieldByName('Korname').AsString);
        TextOut((Rect.Left+55),Rect.Top+25 ,CData.Qemd.FieldByName('Empno').AsString);
        TextOut((Rect.Left+130),Rect.Top+5 ,CData.Qemd.FieldByName('Ndeptcode').AsString);
        TextOut((Rect.Left+300),Rect.Top+5 ,CData.Qemd.FieldByName('Npaycl').AsString);
        TextOut((Rect.Left+130),Rect.Top+25,CData.Qemd.FieldByName('Ndpdeptcode').AsString);
        TextOut((Rect.Left+348),Rect.Top+5 ,CData.Qemd.FieldByName('Npayra').AsString);
        TextOut((Rect.Left+348),Rect.Top+25,CData.Qemd.FieldByName('Ndppayra').AsString);
     end;
  end;
begin
  if gdselected in State then begin
     with (Sender as Jdbgrid).Canvas do begin
         Brush.Color := $00CBBDF0;
         Font.Color  := clBlue;
         Fillrect(Rect);
         Rectangle(Rect.left+1,Rect.Top+1,Rect.Right-1,Rect.Bottom-1);
         if Field.Index = 0 then begin
            if CheckEmpno[CData.Qemd.FieldByName('RowCnt').AsInteger] = 'Y' then
                 TextOut((Rect.Left+10),Rect.Top+20 ,'Ⅹ')
            else TextOut((Rect.Left+10),Rect.Top+20 ,'☞');
            DisplayDefault;
         end;
     end;
  end else begin
     with (Sender as Jdbgrid).Canvas do begin
         Brush.Color := $00E2E2E2;
         Fillrect(Rect);
         Rectangle(Rect.left+1,Rect.Top+1,Rect.Right-1,Rect.Bottom-1);
         if Field.Index = 0 then begin
            if CheckEmpno[CData.Qemd.FieldByName('RowCnt').AsInteger] = 'Y' then
               TextOut((Rect.Left+10),Rect.Top+20 ,'Ⅹ')
            else TextOut((Rect.Left+10),Rect.Top+20 ,'○');
            DisplayDefault;
         end;
     end;
  end;
end;

// 선택한 사원의 리스트박스를 다시금 그린다.........................................................
procedure TMainForm.selEmpDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
var
  offset : integer;
begin
  offset := 8;
  if odSelected in State then begin
     with (Control as TListBox).Canvas do begin
          Brush.Color := $00CBBDF0;
          Font.Color  := clBlue;
          FillRect(Rect);
          Rectangle(Rect.Left+4,Rect.top+2,Rect.Right-4,Rect.Bottom-2);
          TextOut(Rect.Left+8,Rect.Top+offset,'☞ '+PasString(SelEmp.Items[Index],',',1));
     end;
     ReleaseSelect := index;
  end else begin
     with (Control as TListBox).Canvas do begin
          Brush.Color := $00E2E2E2;
          Font.Color  := clBlack;
          FillRect(Rect);
          Rectangle(Rect.Left+4,Rect.top+2,Rect.Right-4,Rect.Bottom-2);
          TextOut(Rect.Left+8,Rect.Top+offset,'o  '+PasString(SelEmp.Items[Index],',',1));
     end;
  end;
end;

// 사원을 지정한다..................................................................................
procedure TMainForm.BindicateClick(Sender: TObject);
var
   str : string;
   i   : integer;
begin
   for i := 0 to SelEmp.Items.Count - 1 do
   begin
     if CData.Qemd.FieldByName('empno').AsString = copy(SelEmp.Items[i],1,4) then
     begin
        MessageBox(0,'선택한 사원입니다 !!.','알  림',MB_OK or $0030);
        system.exit;
     end;
   end;

   if (CheckEmpno[CData.Qemd.FieldByName('RowCnt').AsInteger] = 'Y') then
   begin
      MessageBox(0,'작업권한이 없습니다 !!.','알  림',MB_OK or $0030);
      system.exit;
   end;
   str := CData.Qemd.FieldByName('empno').AsString+'    '+
          CData.Qemd.FieldByName('korname').AsString+','+
          CData.Qemd.FieldByName('deptcode').AsString+','+
          CData.Qemd.FieldByName('payra').AsString+',';
   SelEmp.Items.Add(str);
end;

// 사원을 해제한다..................................................................................
procedure TMainForm.BreleaseClick(Sender: TObject);
var
 i,LastPos : integer;
 Check     : Boolean;
begin
  LastPos := SelEmp.Items.Count-1;
  i := 0;   Check := False;
  while Check = False  do begin
      if SelEmp.Selected[i] = True then begin
         SelEmp.Items.Delete(i);
         LastPos := SelEmp.Items.Count-1;
         i := 0;
      end else inc(i);
      if LastPos < i then Check := True;
  end;
end;

//정려순서에 의해 데이타를 날린다...................................................................
procedure TMainForm.deptcodeKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = chr(13) then
    Key := chr(0);
end;

// 키부분 키제어를 담당한다.........................................................................
procedure TMainForm.KeyTabControl(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if not (ssShift in Shift) then begin
   if (Key = vk_Return) or (Key = vk_Tab) then begin
      case TComponent(Sender).Tag of
        1 : Empno.SetFocus;
        2 : begin
              if trim(Empno.Text) <> '' then EmpFind(empno.Text);
              korname.SetFocus;
            end;
        3 : begin
             Deptcode.SetFocus;
             if Key = vk_Return then begin
               if trim(Empno.Text) = '' then begin
                  if EmpFind(korname.Text) > 1 then EmpnoDblClick(Korname);
               end;
             end;
             if (Key = vk_Return) then BPitremdRunSql(TempPart);
            end;
      end; {case end}
   end; {if end}
   end else begin
   if (Key = vk_Return) or (Key = vk_Tab) then begin
      case TComponent(Sender).Tag of
        1 : Korname.SetFocus;
        2 : Deptcode.SetFocus;
        3 : Empno.SetFocus;
      end; {case end}
   end;
   end;
end;

// 데이타 부분 키제어를 한다........................................................................
procedure TMainForm.DataTabControl(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (Key = vk_Return) or (Key = vk_Tab) then begin
      case TComponent(Sender).Tag of
        1 : dppayra.SetFocus;
        2 : dpdeptcode.SetFocus;        
//        2 : dpandepcode.SetFocus;
//        3 : dpdeptcode.SetFocus;
      end; {case end}
   end; {if end}
end;

// 조직개편 화일에서 조건에 맞는 데이타를 열람을 한다...............................................
procedure TMainForm.BPitremdRunSql(Sender: TObject);
var
  i : integer;
begin
  if Temppart <> nil then
  begin
    Temppart.Color := $00E2E2E2;
    SendMessage(Temppart.Handle,WM_PAINT,0,0);
  end;
  for i := 0 to sizeof(CheckEmpno)-1 do CheckEmpno[i] := 'N';

  Temppart := TJeonPanel(Sender);
  Temppart.Color := $00CBBDF0;
  SendMessage(Temppart.Handle,WM_PAINT,0,0);
  lHelp.Caption := '☞ 키부분에 해당하는 데이타를 찾고 있는 중입니다.';
  SendMessage(HelpDsr.Handle,WM_PAINT,0,0);
  if GetPitremd(TempPart.Tag) = True then
  begin
    LookEmp.Visible := True;
    LookEmp.SetFocus;
  end
  else
  begin
    LookEmp.Visible := False;
    MessageBox(0,'열람 하고자 하는 데이타가 없습니다 !!','알 림',MB_OK or $0030);
    Deptcode.Setfocus;
  end;
  lHelp.Caption := '';
end;

// 코드부분을 빠져나갈때............................................................................
procedure TMainForm.CodeChange(Sender: TObject);
begin
  ChangeCheck := True;
end;

procedure TMainForm.CodeExit(Sender: TObject);
begin
  if ChangeCheck = False then system.exit;
  ChangeCheck := False;
  case THanEdit(Sender).HelpContext of
    1 : NeDeptcode.Caption   := DeptDisp(CData.QCod,Work.Orgnum,Deptcode.Text,'');
    4 : NedpDeptcode.Caption := DeptDisp(CData.QCod,torgnum,dpDeptcode.Text,'');
    5 : Nedppayra.Caption    := CodeDisp(CData.Qcod,'I113',dppayra.Text,CodeFile);
    6 : Nedpandepcode.Caption:= CodeDisp(CData.Qcod,'I310',dpandepcode.Text,CodeFile);    
  end;
end;

// 부서폼을 콜한다..................................................................................
procedure TMainForm.BDeptClick(Sender: TObject);
begin
  if (TComponent(Sender).Name = 'Bdept1') or
     (TComponent(Sender).Name = 'deptcode') then begin
     KeyClick(Sender);
     if (TComponent(Sender).Name = 'deptcode') then system.exit;
  end;
  BonForm := TBonForm.Create(Self);
  Try
    BonForm.deptcode := '';
    BonForm.deptname := '';
    BonForm.boncode  := '';
    BonForm.bonGubun := '';
    if Tcomponent(Sender).Tag = 1 then begin
       BonForm.orgnum   := Work.Orgnum;
       if WorkGubun = '사용자' then begin
          BonForm.boncode  := Work.boncode;
          BonForm.bonGubun := 'Yes';
       end else BonForm.bonGubun := 'No';
    end else begin
       BonForm.orgnum   := torgnum;
       BonForm.bonGubun := 'No';
    end;
    BonForm.ShowModal;
    if BonForm.deptcode <> '' then  begin
       if Tcomponent(Sender).Tag = 1 then begin
          deptcode.Text     := BonForm.deptcode;
          Nedeptcode.Caption:= BonForm.deptname;
          Deptcode.SetFocus;
          BPitremdRunSql(TempPart);
       end;
       if Tcomponent(Sender).Tag = 2 then begin
          dpdeptcode.Text     := BonForm.deptcode;
          Nedpdeptcode.Caption:= BonForm.deptname;
          dpDeptcode.SetFocus;
       end;
    end;
  Finally
    BonForm.Free;
  End;
end;

// 사원폼을 콜한다..................................................................................
procedure TMainForm.EmpnoDblClick(Sender: TObject);
begin
  EmpForm := TempForm.Create(self);
  Try
    if THanEdit(Sender).Tag = 2 then EmpForm.DataVal1 := THanEdit(Sender).Text;
    if THanEdit(Sender).Tag = 3 then EmpForm.DataVal2 := THanEdit(Sender).Text;

    EmpForm.ShowModal;
    if trim(empForm.code) <> '' then begin
       Empno.Text    := EmpForm.Code;
       Korname.Text  := EmpForm.CodeName;
    end;
    EmpFind(Empno.Text);
  Finally
    EmpForm.Free;
  End;
end;

// 코드폼을 콜한다..................................................................................
procedure TMainForm.BpayraClick(Sender: TObject);
begin
  CodeForm := TCodeForm.Create(self);
  Try
     CodeForm.FormData := '직책코드 열람';
     CodeForm.DataVal1  := 'I113';
     CodeForm.ShowModal;
     if CodeForm.Code = '' then System.Exit;
     dppayra.Text      := CodeForm.Code;
     Nedppayra.Caption := CodeForm.CodeName;
     dppayra.SetFocus;
  Finally
    CodeForm.Free;
  END;
end;

{ 배치 일괄작업을 한다.............................................................................
  1. 작업권한 및 경신할 배치부서, 배치직위를 확인한다.
     (1) 권한 - Check - Rtn
  2. IF (배치직위 두번째 = '0' or '5')
        - 배치후보임여부 : 'Y'
     ELSE
        - 배치후보임여부 : 'N'
     END IF
  3. IF (동일업무부서 - 아니오) or (직위 != 배치직위)
        - 전보구분 : 전보(11)
     ELSE
        - 전보구분 : 조직전보(12)
     END IF
  4. 조직개편화일의 해당자료를 수정한다.
     (1) 수정조건 : 조직개편기준일 = 인사변수화일조직개편기준일 AND 사원번호 = 선택사원번호
     (2) 수정항목 : 배치후조직차수(조직개편차수), 배치후부서코드(배치부서),
                    배치후부서등급,상위부서코드,본부코드(존재확인시 읽어온 사항),
                    배치후직위(배치직위),배치후보임여부,전보구분
  5. 선택된 사번에서 제외하며 모든처리 완료후 자료를 재출력한다.
}
procedure TMainForm.BSaveIndiCateClick(Sender: TObject);
var
  rstr : string;
  i, j, LastPos, cnt : integer;
  emp : Array[1..100] of string;
  chk : Boolean;
begin
  rstr := DeptDisp(CData.Qcod,tOrgnum,dpDeptcode.Text,'');
  If (copy(rstr,1,8) = '부서에러') then
  begin
     MessageBox(0,'배치부서 필드 에러입니다 !!.','알 림',MB_OK or $0030);
     dpDeptcode.SetFocus;
     system.exit;
  end;

  If CurrOrgnum = '조직개편' then  //annono = 'N'
  begin
    LastPos := SelEmp.Items.Count;
    For i := 0 to LastPos-1 do
      SelEmp.Selected[i] := True;

    For i := 1 to SelEmp.SelCount do  //선택된사원 실제전보.
    begin
      lHelp.Caption := SelEmp.Items[SelEmp.ItemIndex]+' 사원 배치작업 중입니다 !!.';
      SendMessage(HelpDsr.handle,WM_PAINT,0,0);
      emp[i] := Copy(SelEmp.Items[SelEmp.ItemIndex],1,4);    //사원 저장
      cnt :=  SelEmp.SelCount;
      if PreViligeCheck('배치',copy(SelEmp.Items[SelEmp.ItemIndex],1,4)) = True then  //권한체크
      begin
         if trim(dppayra.text) <> '' then              //보임처리.
         begin
           if (copy(trim(dppayra.text),1,1) >= '1') and (copy(trim(dppayra.text),1,1) <= '5') then
              Save.dppayrayn := 'Y'
           else
              Save.dppayrayn := 'N';
         end;

         Save.trgubun := '11';  //모두 실제전보
         Save.confyn  := 'M';
         PitremdBatch('배치',copy(SelEmp.Items[SelEmp.ItemIndex],1,4));  //실제 저장
         SelEmp.Items.Delete(SelEmp.ItemIndex);
         SendMessage(SelEmp.Handle,WM_PAINT,0,0);
      end;
    end;  //for end

    CData.Qemd.First;
    j := 0;
    For i := 1 to CData.Qemd.RecordCount do  //불려진사원 조직전보.
    begin
      chk := False;
      for j := 1 to cnt + 1 do  //동일사번 check
        If emp[j] = CData.Qemd.FieldByName('empno').AsString then
          chk := True;

      if chk = False then
      begin
        lHelp.Caption := CData.Qemd.FieldByName('empno').AsString +' 사원 배치작업 중입니다 !!.';
        SendMessage(HelpDsr.handle,WM_PAINT,0,0);
        if PreViligeCheck('배치',CData.Qemd.FieldByName('empno').AsString) = True then  //권한체크
        begin
          Save.trgubun := '12';  //조직 전보
          Save.confyn  := 'M';
          PitremdBatch('조직',CData.Qemd.FieldByName('empno').AsString);  //실제 저장.
          SendMessage(SelEmp.Handle,WM_PAINT,0,0);
        end;
      end;    //   if chk = False then
      CData.Qemd.Next;
    end;  //for end

  end
  else if CurrOrgnum = '차수변경' then
  begin
    LastPos := SelEmp.Items.Count;
    for i := 0 to LastPos-1 do
        SelEmp.Selected[i] := True;

    for i := 1 to SelEmp.SelCount do
    begin
      lHelp.Caption := SelEmp.Items[SelEmp.ItemIndex]+' 사원 배치작업 중입니다 !!.';
      SendMessage(HelpDsr.handle,WM_PAINT,0,0);
      if PreViligeCheck('배치',copy(SelEmp.Items[SelEmp.ItemIndex],1,4)) = True then  //권한체크
      begin
        if trim(dppayra.text) <> '' then              //보임처리.
        begin
          if (copy(trim(dppayra.text),1,1) >= '1') and (copy(trim(dppayra.text),1,1) <= '5') then
            Save.dppayrayn := 'Y'
          else
            Save.dppayrayn := 'N';
        end;

        Save.trgubun := '11';  //특정인 수정시 실제전보.
        PitremdBatch('배치',copy(SelEmp.Items[SelEmp.ItemIndex],1,4));  //실제 저장.
        SelEmp.Items.Delete(SelEmp.ItemIndex);
        SendMessage(SelEmp.Handle,WM_PAINT,0,0);
      end;  // if end
    end;  //for end
    
  end;  //  if CurrOrgnum = '조직개편' then
  BPitremdRunSql(Temppart);  // refresh.

end;

{ 발송작업을 한다...........................................................................
  1. 조직개편화일의 해당자료를 수정한다.
     (1) 수정조건 : 조직개편기준일 = 인사변수화일조직개편기준일 AND 사원번호 = 선택사원번호
     (2) 수정항목 : 발송여부(Y)
  2. 선택된 사번에서 제외하며 모든처리 완료후 자료를 재출력한다.
}
procedure TMainForm.BsaveReleaseClick(Sender: TObject);
var
  i,LastPos : integer;
begin
  LastPos := SelEmp.Items.Count;
  for i := 0 to LastPos-1 do
      SelEmp.Selected[i] := True;

  for i := 1 to SelEmp.SelCount do
  begin
    lHelp.Caption := SelEmp.Items[SelEmp.ItemIndex]+' 사원 발송작업 중입니다 !!.';
    SendMessage(HelpDsr.handle,WM_PAINT,0,0);
    PitremdBatch('발송',copy(SelEmp.Items[SelEmp.ItemIndex],1,4));
    SelEmp.Items.Delete(SelEmp.ItemIndex);
    SendMessage(SelEmp.Handle,WM_PAINT,0,0);
  end;
  BPitremdRunSql(Temppart);
end;

// 배치처리를 수정한다..............................................................................
procedure TMainForm.PitremdBatch(Gubun,vempno : string);
begin
   with CData.Qcmd do
   begin
     Close;
     Sql.clear;
     if Gubun = '배치' then
     begin
       sql.add(Format('update pitremd set '+
                        'dporgnum  = ''%s'', dpdeptcode  = ''%s'', dpextcode = ''%s'','+
                        'dpboncode = ''%s'', dpdeptlevel = ''%s'', dppayra   = ''%s'','+
                        'dppayrayn = ''%s'', trgubun     = ''%s'', confyn = ''%s'',  '+
                        'writetime = ''%s'', writeemp    = ''%s'' '+
                        'where (remddate = ''%s'') and (empno = ''%s'') ',
                  [Save.dporgnum,  Save.dpdeptcode,  Save.dpextcode,
                   Save.dpboncode, Save.dpdeptlevel, Save.dppayra,
                   Save.dppayrayn, Save.trgubun, Save.confyn,
                   copy(timedate(Query1),1,15),p_empno,tremddate, vempno] ));
     end
     else if Gubun = '조직' then
     begin
       sql.add(Format('update pitremd set '+
                        'trgubun     = ''%s'', confyn = ''%s'',  '+
                        'writetime = ''%s'', writeemp    = ''%s'' '+
                        'where (remddate = ''%s'') and (empno = ''%s'') ',
                  [Save.trgubun, Save.confyn,
                   copy(timedate(Query1),1,15),p_empno,tremddate, vempno] ));
     end;
     EXECSQL;
     Close;
   end;
end;

// 출력폼을 콜한다..................................................................................
{ 배치 누락자.직책중복자 출력 공통모듈-RTN
  1. 작업등급이 A,B,C 일경우만 전사부서코드를 입력받으며 일반사용자일 경우는
     부서코드From에는 본부코드,부서코드To에는 같은 본부이면서 제일 큰값을 읽어서 출력하고
     작업범위를 입력받지 않는다.
}
procedure TMainForm.BprnClick(Sender: TObject);
var
   PrnCheck : Boolean;
begin
  SubForm := TSubForm.Create(Self);
  Try
     if WorkGubun = '사용자' then SubForm.Conyn := False
                             else SubForm.Conyn := True;
     SubForm.bOrgnum := Work.Orgnum;
     SubForm.ShowModal;
  Finally
     SubForm.Free;
  End;
  if PrnYn = False then System.exit;
  
  // 출력작업을 선정한다.
  lHelp.Caption := '조건에 맞는 데이타를 추출중입니다 !!.';
  Application.ProcessMessages;

  Pgr.Visible := True;
  if TBitBtn(Sender).Tag = 1 then begin
     if PrnYn = True then PrnCheck := BatchCancel;
  end else begin
     if PrnYn = True then PrnCheck := BatchDouble;
  end;
  Pgr.Position := 0;
  Pgr.Visible  := False;
  lHelp.Caption := '작업이 완료되었습니다 !!.';
  Application.ProcessMessages;

  if PrnCheck = True then begin
     if TBitBtn(Sender).Tag = 1 then Rpt := PrnForm1;
     if TBitBtn(Sender).Tag = 2 then Rpt := PrnForm2;
     Rpt.Preview;
  end;
end;

{ 배치 누락자 출력 -RTN
  1.조직개편화일에서 해당자료를 추출하여 출력한다.
    (1) 추출조건 : 조직개편일 = 인사변수화일조직개편기준일 AND 인사상태 < 정직(60) AND
                   부서코드 From <= 부서코드 <= 부서코드To AND NVL(배치후조직차수,'   ') = '   '
    (2) 추출항목 : 사번,성명,직급,조직차수,부서코드,직위,입사일,승격일,전보일
    (3) 추출순서
        - 소속순 : 조직차수,부서코드,직위,직급,호봉,사번
        - 직급순 : 직급,조직차수,부서코드,직위,호봉,사번
  2. 본부별로 페이지 Skip 및 연번을 초기화한다.
}
function TMainForm.BatchCancel : Boolean;
var
   TempSort   : String;
   PrnF       : file of PrnData;
   LinePage   : Boolean;
   i,cnt,pcnt,lank : integer;
begin
   Result := True;
   with CData.Qcmd do begin
       close;   sql.clear;
       sql.add(Format('select empno,korname,orgnum,deptcode,boncode,payra,paycl, '+
                      '       empdate,realtrdate,cpaycldate,dporgnum,dpdeptcode,dppayra  from pitremd '+
                      'where (remddate = ''%s'' and pstate < ''60'') '+
                      '  and (deptcode >= ''%s'' and deptcode <= ''%s'' ) '+
                      '  and ((nvl(dpdeptcode,''      '') = ''      '') or (nvl(dppayra,''   '')=''   '' )'+
                      '   or  (dpdeptcode = ''SSS00'') or (nvl(dporgnum,''   '') = ''   '')) ', [tremddate,frdeptcode,todeptcode] ));
       case PrnOrderby of
        1 : sql.add('order by orgnum,deptcode,payra,paycl,paygr,empno ');
        2 : sql.add('order by paycl,orgnum,deptcode,payra,paygr,empno ');
       end;
       open;
       if RecordCount = 0 then begin
          close;
          MessageBox(0,'출력 하고자 하는 데이타가 없습니다 !!','알 림',MB_OK or $0030);
          Result := False;
          System.exit;
       end;
       System.AssignFile(PrnF,TxtFile);
       System.ReWrite(PrnF);

       TempSort := FieldByName('boncode').AsString;
       Pgr.Max  := RecordCount;
       cnt := 1;  pcnt := 1;  lank := 1;  TotalPageCnt := 1;
       while not Eof do begin
          Pgr.Position := cnt;
          SendMessage(Pgr.Handle,WM_PAINT,0,0);
{          if (FieldByName('boncode').AsString <> TempSort) then begin
              pcnt := 1;
              lank := 1;
              if LinePage = False then begin
                 inc(TotalPageCnt);
                 PrnD.Gubun := 'P'; system.write(PrnF,PrnD);
              end;
              TempSort := FieldByName('boncode').AsString;
          end; }
          Assign_Data(CData.Qcmd,lank,1);
          PrnD.Gubun := 'D'; system.write(PrnF,PrnD);
          Next;
          LinePage := False;
          if (pcnt = 20) and (Eof = False) then begin
             pcnt :=  0;
             inc(TotalPageCnt);
             LinePage := True;
             PrnD.Gubun := 'P'; System.Write(PrnF,PrnD);
          end;
          inc(cnt); inc(pcnt); inc(lank);
       end;
       close; system.close(PrnF);
   end;
end;

{ 직책 중복자 출력 -RTN
  1.조직개편화일에서 해당자료를 추출하여 출력한다.
    (1) 추출조건 : 조직개편일 = 인사변수화일조직개편기준일 AND 인사상태 < 정직(60) AND
                   부서코드 From <= 부서코드 <= 부서코드To AND NVL(배치후조직차수,'   ') <> '   ' AND
                   배치후직위두번째 in ('0','5')
    (2) 추출항목 : 사번,성명,직급,조직차수,부서코드,직위,입사일,승격일,전보일,배치후조직차수,
                   배치후부서코드,배치후직위
    (3) 추출순서
        - 소속순 : 조직차수,부서코드,직위,직급,호봉,사번
        - 직급순 : 직급,조직차수,부서코드,직위,호봉,사번
  2. 직책중복여부를 확인한다.
    (1) 확인조건 : 조직개편일 = 인사변수화일조직개편기준일 AND 인사상태 < 정직(60) AND
                   배치후조직차수 = 추출배치후조직차수 AND 배치후부서코드 = 추출배치후부서코드 AND
                   배치후직위두번째 in ('0','5') AND 사번 <> 추출자사번
    (2) 추출항목 : 사번,성명,직급,조직차수,부서코드,직위,입사일,승격일,전보일,배치후조직차수,
                   배치후부서코드,배치후직위
  3. IF 자료존재시 // 여러건 발생시도 모두 출력
       (1) 상기 (2)번자료에서 추출한 자료항목을 추출한다.
       (2) 직책중복자를 모두 출력한다.
       (3) 소속 및 배치부서명은 부서요약명을 출력한다.
     ELSE
       (1) 출력작업없이 다음작업을 출력한다.
     END IF
  4. 본부별로 페이지 Skip 및 연번을 초기화한다.
}
function TMainForm.BatchDouble : Boolean;
var
   PrnF   : file of PrnData;
   Subtop : Boolean;
   i,cnt,pcnt,lank,SubCount : integer;
begin
   Result := True;
   CData.Qcmd.close;
   CData.Qcmd.sql.clear;
   CData.Qcmd.sql.add(Format('select dporgnum,dpdeptcode,count(dporgnum) cnt  from pitremd '+
                  'where (remddate = ''%s'' and pstate < ''60'') '+
                  '  and (deptcode >= ''%s'' and deptcode <= ''%s'' ) '+
                  '  and (nvl(dporgnum,''   '') <> ''   '') '+
{ ---------------------------------------------------------------------------
   버전    수정일     수정자   수정내용            관련근거
  30.00   1998.12.29  박규석   직위,직급수정       하나로인사재개발
 ---------------------------------------------------------------------------}
//                  '  and (substr(dppayra,2,1) in (''0'',''5'') )',
                  '  and (substr(dppayra,1,1) in (''1'',''2'',''3'',''4'',''5'') )',
                  [tremddate,frdeptcode,todeptcode] ));
   CData.Qcmd.sql.add('group by dporgnum,dpdeptcode order by dporgnum,dpdeptcode ');
   CData.Qcmd.open;
   if CData.Qcmd.RecordCount = 0 then begin
      CData.Qcmd.close;
      MessageBox(0,'출력 하고자 하는 데이타가 없습니다 !!','알 림',MB_OK or $0030);
      Result := False;
      System.exit;
   end;
   System.AssignFile(PrnF,TxtFile);
   System.ReWrite(PrnF);

   Pgr.Max := CData.Qcmd.RecordCount;
   cnt  := 1;
   pcnt := 1;
   lank := 1;
   SubCount := 0;
   TotalPageCnt := 1;

   while not CData.Qcmd.Eof do begin
      Pgr.Position := cnt;
      SendMessage(Pgr.Handle,WM_PAINT,0,0);

      if CData.Qcmd.FieldByName('cnt').AsFloat < 2 then begin
         CData.Qcmd.Next;
         SubCount := 0;
         inc(cnt);
         Continue;
      end;

      with CData.Qsub do begin
         close; sql.clear;
         sql.add(Format('select empno,korname,orgnum,deptcode,boncode,payra,paycl, '+
                  'empdate,realtrdate,cpaycldate,dporgnum,dpdeptcode,dppayra  from pitremd '+
                  'where (remddate = ''%s'' and pstate < ''60'') '+
                  '  and (dporgnum = ''%s'' and dpdeptcode = ''%s'' ) '+
{ ---------------------------------------------------------------------------
   버전    수정일     수정자   수정내용            관련근거
  30.00   1998.12.29  박규석   직위,직급수정       하나로인사재개발
 ---------------------------------------------------------------------------}
//                  '  and (substr(dppayra,2,1) in (''0'',''5'') ) ',
                  '  and (substr(dppayra,1,1) in (''1'',''2'',''3'',''4'',''5'') ) ',
                 [tremddate,CData.Qcmd.FieldByName('dporgnum').AsString,
                            CData.Qcmd.FieldByName('dpdeptcode').AsString] ));
         case PrnOrderby of
           1 : sql.add('order by orgnum,deptcode,payra,paycl,paygr,empno ');
           2 : sql.add('order by paycl,orgnum,deptcode,payra,paygr,empno ');
         end;
         open;
         SubCount := RecordCount;
         if SubCount = 0 then begin
            CData.Qcmd.Next;
            inc(cnt);
            Continue;
         end;

         SubTop := True;
         while not Eof do begin
             Assign_Data(CData.Qsub,lank,2);
             if SubTop = True then begin
                PrnD.No := IntTostr(lank);
             end else begin
                PrnD.No := '';
             end;
             SubTop := False;
             PrnD.Gubun := 'D'; system.write(PrnF,PrnD);
             Next;
             if (pcnt >= 20) and (Eof = False) then begin
                 pcnt   :=  0;
                 SubTop := True;
                 inc(TotalPageCnt);
                 PrnD.Gubun := 'L'; System.Write(PrnF,PrnD);  // 라인을 그린다.
                 PrnD.Gubun := 'P'; System.Write(PrnF,PrnD);  // 페이지를 스킵한다.
             end;
             inc(pcnt);
         end;
         if pcnt <> 1 then begin
            PrnD.Gubun := 'L'; System.Write(PrnF,PrnD);  // 라인을 그린다.
         end;
      end;  // 서브쿼리 End
      CData.Qcmd.Next;
      inc(lank);
      inc(cnt);
   end;
   CData.Qsub.close;
   CData.Qcmd.close;
   system.close(PrnF);
end;

// 출력물 데이타를 할당한다.........................................................................
procedure TMainForm.Assign_Data(TempQry : TQuery; const plank,gubun : integer);
var
   rValue : string;
begin
  with TempQry do begin
     PrnD.no         := FormatFloat('###',plank);
     PrnD.empno      := FieldByName('empno').AsString;
     PrnD.korname    := FieldByName('korname').AsString;
     PrnD.paycl      := CodeDisp(CData.Qcod,'I112',FieldByName('paycl').AsString,CodeFile);
     PrnD.payra      := CodeDisp(CData.Qcod,'I113',FieldByName('payra').AsString,CodeFile);
     if Gubun = 1 then begin
        PrnD.deptname   := DeptDisp(CData.Qcod,FieldByName('orgnum').AsString,
                                               FieldByName('deptcode').AsString,'');
     end else begin
        rValue :=  DeptAbbr(FieldByName('orgnum').AsString,FieldByName('deptcode').AsString);
        PrnD.deptname := rValue;
     end;
     PrnD.empdate    := InsaDateFormat(FieldByName('empdate').AsString);
     PrnD.cpaycldate := InsaDateFormat(FieldByName('cpaycldate').AsString);
     PrnD.realtrdate := InsaDateFormat(FieldByName('realtrdate').AsString);
     if Gubun = 1 then begin
        PrnD.dpdeptname := '';
        PrnD.dppayra    := '';
     end else begin
        rValue :=  DeptAbbr(FieldByName('dporgnum').AsString,FieldByName('dpdeptcode').AsString);
        PrnD.dpdeptname := rValue;
        PrnD.dppayra    := CodeDisp(CData.Qcod,'I113',FieldByName('dppayra').AsString,CodeFile);
     end;
  end;
end;

procedure TMainForm.BdepcodeClick(Sender: TObject);
begin
  CodeForm := TCodeForm.Create(self);
  Try
     CodeForm.FormData := '직위코드 열람';
     CodeForm.DataVal1  := 'I310';
     CodeForm.ShowModal;
     if CodeForm.Code = '' then System.Exit;

     dpandepcode.Text      := CodeForm.Code;
     Nedpandepcode.Caption := CodeForm.CodeName;
     dpandepcode.SetFocus;
  Finally
    CodeForm.Free;
  END;
end;

procedure TMainForm.ALBindicateClick(Sender: TObject);
var
   str : string;
   i   : integer;
begin
  // 권한 체크.
  if (CheckEmpno[CData.Qemd.FieldByName('RowCnt').AsInteger] = 'Y') then
  begin
    MessageBox(0,'작업권한이 없습니다 !!.','알  림',MB_OK or $0030);
    system.exit;
  end;

  for i := SelEmp.Items.Count - 1 downto 0 do  //선택된 사번제거.
    SelEmp.Items.Delete(i);

  CData.Qemd.First;    
  For i := 0 to CData.Qemd.RecordCount - 1 Do  //전체삽입 로직.
  begin
    str := CData.Qemd.FieldByName('empno').AsString+'    '+
           CData.Qemd.FieldByName('korname').AsString+','+
           CData.Qemd.FieldByName('deptcode').AsString+','+
           CData.Qemd.FieldByName('payra').AsString+',';
    SelEmp.Items.Add(str);
    CData.Qemd.Next;
  end;
end;

procedure TMainForm.ALBreleaseClick(Sender: TObject);
var
  i : integer;
begin
  for i := SelEmp.Items.Count - 1 downto 0 do
    SelEmp.Items.Delete(i);
end;

end.
