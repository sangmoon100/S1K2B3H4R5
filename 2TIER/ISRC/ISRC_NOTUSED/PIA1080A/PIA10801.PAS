{header.
-----------------------------------------------------
PROGRAM-NAME    :  PIA1080A(실근무부서지정/해제)
SYSTEM-NAME     : 종합인사정보
SUBSYSTEM-NAME  : 인사
Programmer      : 전철호
Version         : 1.00
Date            : 1997.04
Update contents
  1.00   1997.04    전철호  신규프로그램개발 상세설계서
-----------------------------------------------------}

unit pia10801;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  jeonPan, ExtCtrls, StdCtrls, Mask, HanEdit, DBCGrids, DB, DBTables,
  Gauges, Buttons, DBCtrls, jeonLab,pass,datelib,codetext,Grids, DBGrids,
  jgrid, ComCtrls,Quickrpt,TimeFtp, MemDS, DBAccess, Ora, Func;

type SaveMaster =  record
     jobdept  : string;
     jobplace : string;
end;

type A = record
   mclass    : string;
   payrayn   : string;
   orgnum    : string;
   deptcode  : string;
   jobdept   : string;
   extcode   : string;
   boncode   : string;
end;

type Prn = record
    rcnt      : integer;
    gubun     : char;
    boncode   : string[5];
    deptcode  : string[30];
    empno     : string[4];
    korname   : string[12];
    jobdept   : string[60];
    bjobplace : string[12];
    jobplace  : string[12];
    stotal    : integer;
    ttotal    : integer;
end;

type
  Tpia10801Form = class(TForm)
    JeonPanel1: TJeonPanel;
    JeonPanel2: TJeonPanel;
    Helpdsr: TJeonPanel;
    JeonPanel4: TJeonPanel;
    JeonPanel5: TJeonPanel;
    JeonPanel6: TJeonPanel;
    deptcode: THanEdit;
    Ordby1: TJeonPanel;
    Ordby2: TJeonPanel;
    Ordby3: TJeonPanel;
    DataSource1: TDataSource;
    JeonPanel10: TJeonPanel;
    JeonPanel11: TJeonPanel;
    JeonPanel12: TJeonPanel;
    udeptcode: THanEdit;
    ujobplace: THanEdit;
    Ndeptcode: TJeonPanel;
    Nudeptcode: TJeonPanel;
    nujobplace: TJeonPanel;
    Bdept1: TSpeedButton;
    Bdept2: TSpeedButton;
    Bjob: TSpeedButton;
    JeonPanel7: TJeonPanel;
    JeonLabel1: TJeonLabel;
    JeonLabel2: TJeonLabel;
    JeonLabel3: TJeonLabel;
    JeonLabel4: TJeonLabel;
    JeonLabel5: TJeonLabel;
    Label3: TLabel;
    lHelp: TLabel;
    Bindicate: TSpeedButton;
    Brelease: TSpeedButton;
    Bjobdept: TBitBtn;
    Bjobplace: TBitBtn;
    BSaveIndiCate: TBitBtn;
    BsaveRelease: TBitBtn;
    Bexit: TBitBtn;
    JeonPanel3: TJeonPanel;
    Lookemp: Jdbgrid;
    JeonLabel6: TJeonLabel;
    JeonLabel7: TJeonLabel;
    Panel1: TPanel;
    selEmp: TListBox;
    L_UserName: TLabel;
    L_CurDate: TLabel;
    JeonLabel8: TJeonLabel;
    JeonLabel9: TJeonLabel;
    JeonLabel10: TJeonLabel;
    Qemp: TOraQuery;
    OraQtemp: TOraQuery;
    QCode: TOraQuery;
    Qdept: TOraQuery;
    QempEMPNO: TStringField;
    QempKORNAME: TStringField;
    QempJOBPLACE: TStringField;
    QempJOBDEPT: TStringField;
    QempDEPTCODE: TStringField;
    QempORGNUM: TStringField;
    QempNJobPlace: TStringField;
    QempNjobdept: TStringField;
    QempNdeptcode: TStringField;
    QempNpayra: TStringField;
    QempROWCNT: TFloatField;
    QempPAYRAYN: TStringField;
    QempPAYRA: TStringField;
    procedure QempCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure LookempDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure OrderByClick(Sender: TObject);
    procedure deptcodeExit(Sender: TObject);
    procedure deptcodeChange(Sender: TObject);
    procedure Bdept1Click(Sender: TObject);
    procedure BjobClick(Sender: TObject);
    procedure BexitClick(Sender: TObject);
    procedure selEmpDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure BindicateClick(Sender: TObject);
    procedure deptcodeKeyPress(Sender: TObject; var Key: Char);
    procedure BSaveIndiCateClick(Sender: TObject);
    procedure BreleaseClick(Sender: TObject);
    procedure BsaveReleaseClick(Sender: TObject);
    procedure BprnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    ChangeCheck : Boolean;
    FreeCheck   : Boolean;
    p_empno   : string;
    pkorname  : string;
    Homedir   : string;
    start     : integer;
    Temppart  : TJeonPanel;
    CheckSave : SaveMaster; // 경신될 근무부서,근무지
    uExtCode  : string;     // 경신할 근무부서의 상위부서
    WorkGubun : string;     // 작업자의 등급 판단.
    KeyBonCode: string;     // 발령부서의 본부코드
    DeptSelCheck,tempjobplace : string;
    ReleaseSelect : integer; // 선택한 사원의 index 번호

    function  QCodeDisp(s1,s2 : String) : String;
    function  PreViligeCheck(const CheckEmp,gubun : string) : Boolean;
    procedure ShowHint(Sender: TObject);
    procedure MakeTextFile;
    procedure UsrConfirm;
    procedure UsrCheckingLoad(empParam : string);
    procedure UpDatePimpmas(const key : string);
    procedure ShowPreView;
  public
    { Public declarations }
    CheckEmpno : array[0..10000] of char;
    prnRpt     : TQuickRep;
    WorkMan,InputMan : A;   // 작업권의 체크를 위해
    paFrom,paTo : string;   // 부서코드 From,to
    function  QDeptDisp(s1,s2 : String; gu : integer) : String;
  end;

var
  pia10801Form: Tpia10801Form;

const
   prnsql1: string = ('select a.boncode,a.empno,a.korname,a.deptcode,a.jobdept,a.jobplace,b.placecode,b.deptname,c.deptabbr '+
                      'from pimpmas a,pycdept b,pycdept c '+
                      'where (a.deptcode >= ''%s'' and a.deptcode <= ''%s'') and '+
                      '      (a.pstate < ''80''    and a.deptcode <> a.jobdept) and '+
                      '      (a.jobdept = b.deptcode(+) and a.orgnum = b.orgnum(+)) and '+
                      '      (a.deptcode = c.deptcode(+) and a.orgnum = c.orgnum(+)) '+
                      'order by deptcode,paycl,payra,paygr,empno');
   prnsql2: string = ('select a.boncode,a.empno,a.korname,a.deptcode,a.jobdept,a.jobplace,b.placecode,b.deptname,c.deptabbr '+
                      'from pimpmas a,pycdept b,pycdept c '+
                      'where (a.deptcode >= ''%s'' and a.deptcode <= ''%s'') and '+
                      '      (a.pstate < ''80'')   and '+
                      '      (a.jobdept = b.deptcode(+)  and a.orgnum = b.orgnum(+)) and '+
                      '      (a.deptcode = c.deptcode(+) and a.orgnum = c.orgnum(+)) and '+
                      '      (a.jobplace <> b.placecode) '+
                      'order by a.deptcode,a.paycl,a.payra,a.paygr,a.empno');
   jobsql : string = ('select payrayn,orgnum,deptcode,jobdept,jobplace,payra from pimpmas where empno = ''%s'' ');
   empsql : string = ('select rownum rowcnt,a.empno,a.korname,a.orgnum,a.deptcode,a.jobdept,a.jobplace,'+
                      '       a.payrayn,a.payra from pimpmas a '+
                      'where (a.pstate  < ''80'' and  a.orgnum  = ''%s'') '+
                      '  and (a.deptcode = ''%s'' or  a.jobdept = ''%s'') ');
   //                   '      (a.jobdept in (select b.deptcode from pycdept b '+
   //                   '                     where  b.boncode = ''%s'' and b.orgnum = ''%s''))');

implementation
uses pia10802,pia10803,pia10804,pia10805, Keycode;

{$R *.DFM}

// 출력물 열람화면..............................................................
procedure Tpia10801Form.ShowPreView;
begin
  pia10803Form := Tpia10803Form.Create(Self);
  Try
    pia10803Form.ShowModal;
  Finally
    pia10803Form.Free;
  End;
end;

// 사용자 확인Rtn...............................................................
procedure Tpia10801Form.UsrCheckingLoad(empParam : string);
begin
     with OraQtemp do
     begin
          close;
          sql.clear;
          sql.add(Format(jobSql,[empParam]));
          Open;
          WorkMan.mclass  := copy(Pgrade,2,1);
          WorkMan.payrayn := FieldByName('payrayn').AsString;
          WorkMan.orgnum  := FieldByName('orgnum').AsString;
          WorkMan.deptcode:= FieldByName('deptcode').AsString;
          QdeptDisp(WorkMan.Deptcode,WorkMan.Orgnum,3);
          Close;
     end;
end;

procedure Tpia10801Form.UsrConfirm;
begin
  if WorkMan.mclass <= 'C' then begin
     WorkGubun    := '관리자';
     Ordby1.Color := $00E2E2E2;
     deptcode.SetFocus;
     system.exit;
  end;
  if WorkMan.payrayn = 'Y' then begin
     WorkGubun := '사용자';
     Ndeptcode.Caption := QdeptDisp(WorkMan.Deptcode,WorkMan.orgnum,2);
     deptcode.Text     := WorkMan.Deptcode;
     OrderByClick(ordby1);
     system.exit;
  end;
  MessageBox(0,'당신은 작업권한이 없습니다 !!.','알  림',MB_OK or $0030);
  halt(0);
end;

// 지정,해제작업시 인사마스터를 수정한다........................................
procedure Tpia10801Form.UpDatePimpmas(const key : string);
begin
    with OraQtemp do
    begin
         close;
         Sql.Clear;
         sql.Add(Format('update pimpmas set '+
                        'jobdept = ''%s'',jobplace = ''%s'' where empno = ''%s'' ',
                         [CheckSave.JobDept,CheckSave.JobPlace,key]) );
         EXECSQL;
         Close;
    end;
end;

// 권한 Check-Rtn...............................................................
function Tpia10801Form.PreViligeCheck(const CheckEmp,gubun : string) : Boolean;
var
  i : integer;
  procedure SaveVariable;
  begin
     if   trim(udeptcode.Text) = '' then CheckSave.Jobdept  := OraQtemp.FieldByName('jobdept').AsString
     else                                CheckSave.Jobdept  := trim(udeptcode.Text);
     if   trim(ujobplace.Text) = '' then CheckSave.Jobplace := OraQtemp.FieldByName('jobplace').AsString
     else                                CheckSave.Jobplace := trim(ujobplace.Text);
     UpDatePimpmas(CheckEmp);
  end;
begin
  Result := True;
  // 대상자의 부서코드의 본부코드,,상위부서코드를 읽어온다......................
  if gubun = '지정' then begin
     InputMan.deptcode := Qemp.FieldByName('deptcode').AsString;
     InputMan.orgnum   := Qemp.FieldByName('orgnum').AsString;
     InputMan.payrayn  := Qemp.FieldByName('payrayn').AsString;
     InputMan.jobdept  := Qemp.FieldByName('jobdept').AsString;
     QdeptDisp(InputMan.deptcode,InputMan.orgnum,4);
  end
  else
  begin
     OraQtemp.close; OraQtemp.sql.clear;
     OraQtemp.sql.add(Format(jobSql,[CheckEmp]));
     OraQtemp.Open;
     InputMan.deptcode := OraQtemp.FieldByName('deptcode').AsString;
     InputMan.orgnum   := OraQtemp.FieldByName('orgnum').AsString;
     InputMan.payrayn  := OraQtemp.FieldByName('payrayn').AsString;
     InputMan.jobdept  := OraQtemp.FieldByName('jobdept').AsString;
     QdeptDisp(InputMan.deptcode,InputMan.orgnum,4);
  end;

  if (WorkMan.mClass <= 'C') or
     (WorkMan.deptcode = InputMan.deptcode) or
     (WorkMan.deptcode = InputMan.boncode) or
     (WorkMan.deptcode = InputMan.extcode) then begin
     if gubun = '저장' then begin
        SaveVariable;
        OraQtemp.close;
        system.exit;
     end;
     OraQtemp.close;
     system.exit;
  end;
  if (WorkMan.extcode = InputMan.deptcode) and (InputMan.payrayn <> 'Y') then begin
     if (InputMan.deptcode = InputMan.jobdept) or
        (WorkMan.deptcode = InputMan.jobdept) or
        (WorkMan.deptcode = inputMan.extcode) then begin
        if gubun = '저장' then begin
           if (uDeptcode.Text = WorkMan.deptcode) or
              (uExtCode = WorkMan.deptcode) then begin
              SaveVariable;
              OraQtemp.close;
           end else begin
              MessageBox(0,'작업권한이 없습니다 !!.','알  림',MB_OK or $0030);
              Result := False;
           end;
           OraQtemp.close;
           system.exit;
        end;
        OraQtemp.close;
        system.exit;
     end;
     {if WorkMan.deptcode = InputMan.jobdept then begin
        if gubun = '저장' then begin
           if (uDeptcode.Text = WorkMan.deptcode) then begin
              SaveVariable;
           end else begin
              MessageBox(0,'작업권한이 없습니다 !!.','알  림',MB_OK or $0030);
              Result := False;
           end;
           system.exit;
        end;
        system.exit;
     end;}
  end;
  Result := False;
end;

// 코드의 텍스트화..............................................................
procedure Tpia10801Form.MakeTextFile;
var
  str : string;
begin
 codeToText('c:\insacode.dat','',0);
 with OraQtemp do begin
      close; sql.clear;
      sql.add('select codeid,codeno,codename from pyccode ');
      sql.add('where substr(codeid,1,1) = ''I'' ');
      sql.add('order by codeid,codeno ');
      open;
      while not eof do begin
         str := '';
         str := FieldByName('codeid').AsString+','+
                FieldByName('codeno').AsString+','+
                FieldByName('codename').AsString;
         codeToText('',str,1);
         next;
      end;
      OraQtemp.close;
 end;
 codeToText('','',2);
end;

// 부서,코드명을 보여준다.......................................................
function Tpia10801Form.QCodeDisp(s1,s2 : String) : String;
var
  str : string;
begin
 if trim(s2) <> '' then begin
    if FreeCheck = False then begin
       QCode.Close;
       QCode.Parambyname('lcodeid').AsString  := s1;
       QCode.Parambyname('lcodesub').AsString := s2;
       QCode.Open;
       QCodeDisp := ' '+Qcode.FieldByName('CodeName').AsString;
       if trim(Qcode.FieldByName('CodeName').AsString) = '' then QcodeDisp := '('+s2+')';
    end else begin
       if FileExists('c:\insacode.dat') = False then MakeTextFile;
       str := TextCodeDisp(s1,s2,'c:\insacode.dat');
       QCodeDisp := ' '+str;
       if trim(str) = '' then QcodeDisp := ' 코드에러';
    end;
 end else QCodeDisp := '';
end;

function Tpia10801Form.QDeptDisp(s1,s2 : String; gu : integer) : String;
begin
  QDeptDisp := '';
  if (trim(s1) <> '') and (trim(s2) <> '') then begin
    QDept.Close;
    QDept.ParamByName('ldept').AsString := s1;
    QDept.ParamByName('lorg').AsString  := s2;
    QDept.Open;
    KeyBoncode   := QDept.FieldByName('boncode').AsString;
    tempjobplace := QDept.FieldByName('placecode').AsString;
    if Qdept.RecordCount = 0 then QDeptDisp := ' 코드에러';
    if gu = 1 then QDeptDisp := QDept.FieldByName('deptabbr').AsString;
    if gu = 2 then begin
       if (WorkGubun = '사용자') and (DeptSelCheck = '') then begin
          if WorkMan.Boncode <> QDept.FieldByName('boncode').AsString then begin
             QDeptDisp := ' 코드에러';
             Qdept.close; system.exit;
          end;
       end;
       QDeptDisp := ' '+QDept.FieldByName('deptname').AsString;
    end;
    // 작업자일 경우..
    if gu = 3 then begin
       WorkMan.boncode  := QDept.FieldByName('boncode').AsString;
       WorkMan.extcode  := QDept.FieldByName('extcode').AsString;
    end;
    // 대상자일 경우..
    if gu = 4 then begin
       inputman.boncode  := QDept.FieldByName('boncode').AsString;
       inputman.extcode  := QDept.FieldByName('extcode').AsString;
    end;
    // 경신할 부서의 상위부서를 구할경우
    if gu = 5 then uExtcode := QDept.FieldByName('extcode').AsString;
    if gu = 6 then CheckSave.jobplace := QDept.FieldByName('placecode').AsString;
    QDept.Close;
  end;
end;

// 발령부서,근무지,근무부서를 읽어온다..........................................
procedure Tpia10801Form.QempCalcFields(DataSet: TDataSet);
begin
  if PreViligeCheck('','지정') = False then
     CheckEmpno[Qemp.FieldByName('Rowcnt').AsInteger] := 'Y';
  QempNdeptcode.AsString := QdeptDisp(Qemp.FieldByName('deptcode').AsString,
                                      Qemp.FieldByName('orgnum').AsString,1);
  QempNjobdept.AsString  := QdeptDisp(Qemp.FieldByName('jobdept').AsString,
                                      Qemp.FieldByName('orgnum').AsString,1);
  QempNjobplace.AsString := QCodeDisp('I160',Qemp.FieldByName('jobplace').AsString);
  QempNpayra.AsString    := QCodeDisp('I113',Qemp.FieldByName('payra').AsString);
end;

// 폼에 관련된 사항들...........................................................
procedure Tpia10801Form.ShowHint(Sender: TObject);
begin
   lHelp.Caption := Application.Hint;
end;

procedure Tpia10801Form.FormCreate(Sender: TObject);
var
  i : integer;
begin
  start := 0;
  HomeDir  := HomeDirOpen;
  Application.OnHint := ShowHint;
  Temppart := nil;
  for i := 0 to sizeof(CheckEmpno)-1 do CheckEmpno[i] := 'N';

  Helpdsr.Caption := ' 종합인사시스템에 접속중입니다, 잠시만기다리세요...';
  Application.ProcessMessages;

  OraConnect;

  L_UserName.Caption := Pkorname + '(' + Pempno+')';
  L_CurDate.Caption  := fn_GetDateStr;
end;

procedure Tpia10801Form.FormActivate(Sender: TObject);
begin
  prnRpt   := pia10802Form.Rpt;
  P_empno  := passEmp(cmdline,1);
end;

procedure Tpia10801Form.FormPaint(Sender: TObject);
begin
    FreeCheck := DiskSpaceCheck;
    if FileExists('c:\insacode.dat') = False then
       if FreeCheck = True then begin
          lHelp.Caption := ' ☞ 인사코드 데이타를 다운받고 있습니다 !! (잠시만 기다리세요)';
          SendMessage(HelpDsr.handle,WM_PAINT,0,0);
          MakeTextFile;
       end;
    lHelp.Caption := '';
    //  작업자의 등급,보임여부,조직차수,부서,본부,상위부서를 읽어온다...........
    UsrCheckingLoad(p_empno);
    UsrConfirm;
end;

procedure Tpia10801Form.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   DeleteFile('c:\pia1080a.dat');
end;

procedure Tpia10801Form.BexitClick(Sender: TObject);
begin
//  if MessageBox(handle,'작업을 종료하시겠습니까 ?.','확 인',MB_YESNO or $0030) = ID_YES then
     close;
end;

// 그리드 화면을 재구성한다.....................................................
procedure Tpia10801Form.LookempDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  if gdselected in State then begin
     with (Sender as Jdbgrid).Canvas do begin
       Brush.Color := $00CBBDF0;
       Font.Color  := clBlue;
       Fillrect(Rect);
       Rectangle(Rect.left+1,Rect.Top+1,Rect.Right-1,Rect.Bottom-1);
       if Field.Index = 0 then begin
          if CheckEmpno[Qemp.FieldByName('RowCnt').AsInteger] = 'Y' then
               TextOut((Rect.Left+10),Rect.Top+20 ,'Ⅹ')
          else TextOut((Rect.Left+10),Rect.Top+20 ,'☞');
          TextOut((Rect.Left+60),Rect.Top+25 ,QempEmpno.AsString);
          TextOut((Rect.Left+60),Rect.Top+5  ,QempKorname.AsString);
          TextOut((Rect.Left+137),Rect.Top+5 ,QempNdeptcode.AsString);
          TextOut((Rect.Left+137),Rect.Top+25,QempNjobdept.AsString);
          TextOut((Rect.Left+355),Rect.Top+5 ,QempNpayra.AsString);
          TextOut((Rect.Left+355),Rect.Top+25,QempNjobplace.AsString);
       end;
     end;
  end else begin
     with (Sender as Jdbgrid).Canvas do begin
       Brush.Color := $00E2E2E2;
       Fillrect(Rect);
       Rectangle(Rect.left+1,Rect.Top+1,Rect.Right-1,Rect.Bottom-1);
       if Field.Index = 0 then begin
          if CheckEmpno[Qemp.FieldByName('RowCnt').AsInteger] = 'Y' then
               TextOut((Rect.Left+10),Rect.Top+20 ,'Ⅹ')
          else TextOut((Rect.Left+10),Rect.Top+20 ,'○');
          TextOut((Rect.Left+60),Rect.Top+25 ,QempEmpno.AsString);
          TextOut((Rect.Left+60),Rect.Top+5  ,QempKorname.AsString);
          TextOut((Rect.Left+137),Rect.Top+5 ,QempNdeptcode.AsString);
          TextOut((Rect.Left+137),Rect.Top+25,QempNjobdept.AsString);
          TextOut((Rect.Left+355),Rect.Top+5 ,QempNpayra.AsString);
          TextOut((Rect.Left+355),Rect.Top+25,QempNjobplace.AsString);
       end;
     end;
  end;
end;

procedure Tpia10801Form.selEmpDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
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
          TextOut(Rect.Left+8,Rect.Top+offset,'☞ '+SelEmp.Items[Index]);
     end;
     ReleaseSelect := index;
  end else begin
     with (Control as TListBox).Canvas do begin
          Brush.Color := $00E2E2E2;
          Font.Color  := clBlack;
          FillRect(Rect);
          Rectangle(Rect.Left+4,Rect.top+2,Rect.Right-4,Rect.Bottom-2);
          TextOut(Rect.Left+8,Rect.Top+offset,'o  '+SelEmp.Items[Index]);
     end;
  end;
end;

// 정렬순서를 클릭을 할 경우....................................................
procedure Tpia10801Form.OrderByClick(Sender: TObject);
var
  i : integer;
begin
   if trim(Ndeptcode.Caption) = '코드에러' then begin
      MessageBox(0,'부서 미존재 or 열람권한 없슴 !!','알 림',MB_OK or $0030);
      deptcode.Setfocus;
      system.exit;
   end;
   if Temppart <> nil then begin
      Temppart.Color := $00E2E2E2;
      SendMessage(Temppart.Handle,WM_PAINT,0,0);
   end;
   for i := 0 to sizeof(CheckEmpno)-1 do CheckEmpno[i] := 'N';
   Temppart := TJeonPanel(Sender);
   Temppart.Color := $00CBBDF0;
   SendMessage(Temppart.Handle,WM_PAINT,0,0);
   lHelp.Caption := '☞ 키부분에 해당하는 데이타를 찾고 있는 중입니다.';
   SendMessage(HelpDsr.Handle,WM_PAINT,0,0);
   Qemp.close;  Qemp.sql.clear;
   Qemp.sql.add(Format(empsql,[WorkMan.orgnum,deptcode.Text,
                               deptcode.Text,WorkMan.orgnum]));
   Case TJeonPanel(Sender).Tag of
    1 : Qemp.sql.add('order by a.deptcode,a.paycl,a.payra,a.paygr,a.empno');
    2 : Qemp.sql.add('order by a.jobdept,a.paycl,a.payra,a.paygr,a.empno');
    3 : Qemp.sql.add('order by a.korname,a.empno');
   end;
   Qemp.Open;
   if Qemp.RecordCount > 0 then begin
      LookEmp.Visible := True;
      LookEmp.SetFocus;
   end else begin
      LookEmp.Visible := False;
      MessageBox(0,'열람 하고자 하는 데이타가 없습니다 !!','알 림',MB_OK or $0030);
      deptcode.Setfocus;
   end;
   lHelp.Caption := '';
end;

// 발령부서,경신할 근무부서,경신할 근무지를 빠져나갈때..........................
procedure Tpia10801Form.deptcodeKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = chr(13) then begin
     Ndeptcode.Caption := QDeptDisp(deptcode.Text,WorkMan.Orgnum,2);
     OrderByClick(OrdBy1);
     Key := chr(0);
  end;
end;

procedure Tpia10801Form.deptcodeExit(Sender: TObject);
begin
  if ChangeCheck = False then system.exit;
  ChangeCheck := False;
  if Tcomponent(Sender).Tag = 1 then begin
     //QDeptDisp(DeptForm.deptcode,WorkMan.Orgnum,2);
     //deptcode.Text     := KeyBoncode;
     DeptSelCheck := '';
     Ndeptcode.Caption := QDeptDisp(deptcode.Text,WorkMan.Orgnum,2);
  end;
  if Tcomponent(Sender).Tag = 2 then begin
     tempjobplace := '';
     DeptSelCheck := 'udeptcode';
     Nudeptcode.Caption := QDeptDisp(udeptcode.Text,WorkMan.Orgnum,2);
     uJobplace.Text := tempjobplace;
     NuJobplace.Caption := QcodeDisp('I160',uJobplace.Text);
  end;
  if Tcomponent(Sender).Tag = 3 then begin
     NuJobplace.Caption := QcodeDisp('I160',uJobplace.Text);
  end;
end;

procedure Tpia10801Form.deptcodeChange(Sender: TObject);
begin
  ChangeCheck := True;
end;

procedure Tpia10801Form.Bdept1Click(Sender: TObject);
begin
  if (TComponent(Sender).Name = 'Bdept1') or
     (TComponent(Sender).Name = 'deptcode') then begin
     if Temppart <> nil then Temppart.Color := $00E2E2E2;
     deptcode.SelectAll;
     SelEmp.Items.Clear;
     LookEmp.Visible := False;
     if (TComponent(Sender).Name = 'deptcode') then system.exit;
  end;
  UpDeptForm := TUpDeptForm.Create(Self);
  Try
    // The variables of TupDeptForm Class sets the inital values that
    // it is the space value.
    UpDeptForm.deptcode := '';
    UpDeptForm.deptname := '';
    UpDeptForm.boncode  := '';
    UpDeptForm.bonGubun := '';
    UpDeptForm.orgnum := WorkMan.Orgnum;

    if Tcomponent(Sender).Tag = 1 then begin
       if WorkGubun = '사용자' then begin
          UpDeptForm.boncode  := WorkMan.boncode;
          UpDeptForm.bonGubun := 'Yes';   // 발령부서일경우
       end else UpDeptForm.bonGubun := 'No';
       UpDeptForm.bonyn    := 'No';    // 경신부서일경우
    end else begin
       QDeptDisp(deptcode.Text,WorkMan.Orgnum,2);
       UpDeptForm.boncode  := KeyBonCode;
       UpDeptForm.bonGubun := 'No';
       UpDeptForm.bonyn    := 'Yes';
    end;
    UpDeptForm.ShowModal;
    if UpDeptForm.deptcode <> '' then  begin
       if Tcomponent(Sender).Tag = 1 then begin
          //QDeptDisp(DeptForm.deptcode,WorkMan.Orgnum,2);
          deptcode.Text     := UpDeptForm.deptcode;
          DeptSelCheck      := '';
          Ndeptcode.Caption := QDeptDisp(deptcode.Text,WorkMan.Orgnum,2);
          Deptcode.SetFocus;
          if TempPart = nil then TempPart := OrdBy1;
          OrderByClick(TempPart);
       end;
       if Tcomponent(Sender).Tag = 2 then begin
          udeptcode.Text     := UpDeptForm.deptcode;
          DeptSelCheck       := 'udeptcode';
          Nudeptcode.Caption := QDeptDisp(udeptcode.Text,WorkMan.Orgnum,2);
          uJobplace.Text     := tempjobplace;
          NuJobplace.Caption := QcodeDisp('I160',uJobplace.Text);
          uDeptcode.SetFocus;
       end;
    end;
  Finally
    UpDeptForm.Free;
  End;
end;

procedure Tpia10801Form.BjobClick(Sender: TObject);
var
     qq : TOraQuery;
begin
  FKeyCode := TFKeyCode.Create(Self);
  Try
       FKeyCode.FormData := '근무지코드조회';
       FKeyCode.Dataval1 := 'I160';
       FKeyCode.ShowModal;
       If FKeyCode.CloseChk = -1 then Exit;
       uJobplace.Text     := FKeyCode.Code;
       NuJobplace.Caption := FKeyCode.Codename;
       uJobplace.SetFocus;
  Finally
       FKeyCode.Free;
  end;
end;

// 사원을 선택한다..............................................................
procedure Tpia10801Form.BindicateClick(Sender: TObject);
var
   str : string;
   i   : integer;
begin
   for i := 0 to SelEmp.Items.Count - 1 do begin
       if Qemp.FieldByName('empno').AsString = copy(SelEmp.Items[i],1,4) then begin
          MessageBox(0,'선택한 사원입니다 !!.','알  림',MB_OK or $0030);
          system.exit;
       end;
   end;

   if (CheckEmpno[Qemp.FieldByName('RowCnt').AsInteger] = 'Y') then begin
      MessageBox(0,'작업권한이 없습니다 !!.','알  림',MB_OK or $0030);
      system.exit;
   end;
   str := Qemp.FieldByName('empno').AsString+'    '+Qemp.FieldByName('korname').AsString;
   SelEmp.Items.Add(str);
end;

procedure Tpia10801Form.BreleaseClick(Sender: TObject);
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

// 지정 작업을 수행한다.........................................................
procedure Tpia10801Form.BSaveIndiCateClick(Sender: TObject);
var
  i,LastPos : integer;
begin
  if SelEmp.Items.Count = 0 then begin
     MessageBox(0,'지정할 사원이 없습니다 !!.','알  림',MB_OK or $0030);
     system.exit;
  end;
  if trim(QdeptDisp(uDeptCode.Text,WorkMan.Orgnum,5)) = '코드에러' then begin
     MessageBox(0,'경신할 근무부서 필드에러입니다 !!.','알  림',MB_OK or $0030);
     uDeptCode.SetFocus;
     system.exit;
  end;
  if trim(QcodeDisp('I160',uJobplace.Text)) = '코드에러' then begin
     MessageBox(0,'경신할 근무지 필드에러입니다 !!.','알  림',MB_OK or $0030);
     uDeptCode.SetFocus;
     system.exit;
  end;
  LastPos := SelEmp.Items.Count;
  for i := 0 to LastPos-1 do
      SelEmp.Selected[i] := True;

  for i := 1 to SelEmp.SelCount do begin
      lHelp.Caption := SelEmp.Items[SelEmp.ItemIndex]+' 사원을 경신하고 있는 중입니다 !!.';
      SendMessage(HelpDsr.handle,WM_PAINT,0,0);
      if PreViligeCheck(copy(SelEmp.Items[SelEmp.ItemIndex],1,4),'저장') = True then begin
         SelEmp.Items.Delete(SelEmp.ItemIndex);
         SendMessage(SelEmp.Handle,WM_PAINT,0,0);
      end;
  end;
  OrderByClick(Temppart);
end;

// 해제 작업을 수행한다.........................................................
procedure Tpia10801Form.BsaveReleaseClick(Sender: TObject);
var
  i,LastPos : integer;
  CheckEmp  : string;
begin
  LastPos := SelEmp.Items.Count;
  if LastPos = 0 then begin
     MessageBox(0,'해제할 사원이 없습니다 !!.','알  림',MB_OK or $0030);
     system.exit;
  end;
  for i := 0 to LastPos-1 do
      SelEmp.Selected[i] := True;

  for i := 1 to SelEmp.SelCount do begin
      lHelp.Caption := SelEmp.Items[SelEmp.ItemIndex]+' 사원을 경신하고 있는 중입니다 !!.';
      SendMessage(HelpDsr.handle,WM_PAINT,0,0);
      CheckEmp := copy(SelEmp.Items[SelEmp.ItemIndex],1,4);
      OraQtemp.close;  OraQtemp.sql.clear;
      OraQtemp.sql.add(Format(jobSql,[CheckEmp]));
      OraQtemp.Open;
      CheckSave.JobDept := OraQtemp.FieldByName('deptcode').AsString;
      QdeptDisp(CheckSave.JobDept,WorkMan.Orgnum,6);  // 근무지를 구한다.
      OraQtemp.Close;
      // 저장한다...............................................................
      UpDatePimpmas(CheckEmp);
      SelEmp.Items.Delete(SelEmp.ItemIndex);
      SendMessage(SelEmp.Handle,WM_PAINT,0,0);
  end;
  OrderByClick(Temppart);
end;

// 근무부서 상이자,근무지 상이자 출력...........................................
procedure Tpia10801Form.BprnClick(Sender: TObject);
var
  F        : file of prn;
  pd       : prn;         // 출력할 데이타.
  cnt,scnt,tcnt : integer;
  procedure PageCheck;
  begin
    if (cnt > 16) then begin
       cnt := 1;
       pd.gubun := 'P';
       system.Write(F,pd);
    end;
  end;
begin
  pia10804Form := Tpia10804Form.Create(Self);
  Try
    pia10804Form.ShowModal;
  Finally
    pia10804Form.Free;
  End;
  if trim(paFrom) = '' then system.exit;
   
  lHelp.Caption := '자료를 추출중 입니다  !!.';
  SendMessage(HelpDsr.handle,WM_PAINT,0,0);
  OraQtemp.close; OraQtemp.sql.clear;
  if TComponent(Sender).Tag = 1 then begin
     OraQtemp.sql.add(Format(prnsql1,[paFrom,paTo]) );
     pia10802Form.Content := '근무부서 상이자 List';
  end;
  if TComponent(Sender).Tag = 2 then begin
     OraQtemp.sql.add(Format(prnsql2,[paFrom,paTo]) );
     pia10802Form.Content := ' 근무지 상이자 List';
  end;
  OraQtemp.Open;
  if OraQtemp.RecordCount = 0 then begin
     MessageBox(0,'추출된 자료가 없습니다 !!.','알  림',MB_OK or $0030);
     OraQtemp.close;
     lHelp.Caption := '';
     system.exit;
  end;
  System.AssignFile(F,'c:\pia1080a.dat');
  System.Rewrite(F);
  cnt := 1; scnt := 1; tcnt := 1;
  pia10802Form.tBonCode := OraQtemp.FieldByName('boncode').AsString;
  while not OraQtemp.Eof do begin
    pd.rcnt      := scnt;
    pd.gubun     := 'D';
    pd.boncode   := OraQtemp.FieldByName('boncode').AsString;
    pd.deptcode  := OraQtemp.FieldByName('deptabbr').AsString;
    pd.empno     := OraQtemp.FieldByName('empno').AsString;
    pd.korname   := OraQtemp.FieldByName('korname').AsString;
    pd.jobdept   := OraQtemp.FieldByName('deptname').AsString;
    pd.bjobplace := QcodeDisp('I160',OraQtemp.FieldByName('placecode').AsString);
    pd.jobplace  := QcodeDisp('I160',OraQtemp.FieldByName('jobplace').AsString);
    pd.stotal    := scnt;
    pd.ttotal    := tcnt;
    system.Write(F,pd);
    inc(cnt); inc(scnt); inc(tcnt);
    OraQtemp.Next;
    PageCheck;
    if (pd.boncode <> OraQtemp.FieldByName('boncode').AsString) then begin
       pd.gubun := 'B';
       system.Write(F,pd); inc(cnt);
       PageCheck;
       scnt := 1; cnt := 1;
       pd.gubun   := 'P';
       pd.BonCode := OraQtemp.FieldByName('boncode').AsString;
       system.Write(F,pd);
    end;
  end;
  pd.gubun := 'B'; system.Write(F,pd);
  system.close(F);
//  QRPrinter.OnPreView := ShowPreView;
  prnRpt.PreView;
  lHelp.Caption := '';
  OraQtemp.close;
end;

end.



