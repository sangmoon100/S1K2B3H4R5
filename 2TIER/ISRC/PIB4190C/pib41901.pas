{ header
 ----------------------------------------------------------------------------
  PROGRAM-NAME    : pib4190C(팀장명단 출력)
  SYSTEM-NAME     : 종합인사정보
  SUBSYSTEM-NAME  : 인사
  Programmer      : kcj
  Version         : 1.01
  Date            : 1998.12.23
  Update Contents
    1.00    1998.11.1   권창진                     신규프로그램 개발   처리명세서
    1.01    1998.12.23  김혜진                     팀장추출조건 변경.
    1.02    2001.10.12  서혜미  이석희씨 요청      korage -> usaage 로 변경
    1.03    2002.01.15  서혜미  이석희씨 요청      담당명단 추가.
    1.04    2002.05.07  서혜미  이석희씨 요청      대팀장명단 추가, 전체명단 수정
                                                   출력폼 수정, 부서level 별 출력 양식 변경
   30.06    2003.08.11  정규용   이석희 요청       공석일경우도 deptna3 찍히게
   30.07    2003.08.18  정규용   신영섭 요청       라디오박스를 체크박스 교체(교차선택가능하게 수정)
   30.07    2003.09.06  정규용   유효성대리 지적   전체적인 로직 변경(속도를 빠르게하기 위해)
 ---------------------------------------------------------------------------}
unit pib41901;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Gauges, ExtCtrls, pass, datelib, timeftp, quickrpt, Db,
  Dept2Lib, Func, Comobj, jpeg ;

//  프린터 출력물 레코드 집합1.
type PrnData1 = record
//   gubun      : string[1];
   no         : string[3];
   empno      : string[4];
   deptna1    : string[16];   //2001.01.10 shm 2자리 늘임.
   deptna2    : string[30];
   deptna3    : string[30];   //2002.01.15 shm insert
   korname    : string[8];
   age        : string[6];
   paycl      : string[10];
   payra      : string[10]; //2004.08.18 정규용 직위 추가
   pacldate   : string[8];
   orgempdate : string[8];
   lsch       : string[8];
   schcode    : array[0..2] of string[4];
   majcode    : array[0..2] of string[4];
   school     : array[0..2] of string[20];
   major      : array[0..2] of string[12];
   gray       : array[0..2] of string[6];
   doub       : string[6];  // 겸직
   deptlevel  : string[2];  //deptlevel 추가 shm
end;

type
  TMainForm = class(TForm)
    Panel19: TPanel;
    L_UserName: TLabel;
    L_CurDate: TLabel;
    Panel11: TPanel;
    Panel2: TPanel;
    Label11: TLabel;
    Panel8: TPanel;
    Panel1: TPanel;
    Panel9: TPanel;
    Panel3: TPanel;
    Gr: TGauge;
    Panel10: TPanel;
    Panel5: TPanel;
    Bexit: TBitBtn;
    Bscreen: TBitBtn;
    Bprint: TBitBtn;
    hp: TPanel;
    helpDsr: TLabel;
    helpLabel: TLabel;
    Panel16: TPanel;
    deptcodefr: TEdit;
    deptcodeto: TEdit;
    Label3: TLabel;
    Panel4: TPanel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    cb_A1: TCheckBox;
    cb_A2: TCheckBox;
    cb_A3: TCheckBox;
    cb_A4: TCheckBox;
    Bexcel: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BexitClick(Sender: TObject);
    procedure BscreenClick(Sender: TObject);
    procedure deptcodeDblClick(Sender: TObject);
    procedure deptcodefrKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BexcelClick(Sender: TObject);
  private
    { Private declarations }
    P_empno,pkorname,password,pclass : string;
    start    : Boolean;
    oldfieldcode, deg :string ;
    procedure Assign_PrnData1(lank : integer);
    procedure Assign_Null(lank : integer);
//    procedure Assign_dept;
    function  Control_Process_Rtn : integer;
//    procedure Recordclear;  //2002.05.09 shm 추가

  public
    { Public declarations }
    Rpt          : TQuickRep;
    tcount       : integer;
    workgubun    : integer;
    CurDate      : String;
    GsysDate     : String;
    payrachdate  : String;
    function IsBefCheckedCBox(cb_Tag : integer): Boolean;
  end;

var
  MainForm: TMainForm;
  HomeDir : string;
  HFile   : string;
  PrnD    : PrnData1;
  PrnF    : file of PrnData1;
  Boldline   : Boolean;  
//const
 // CodeFile: string = 'pib4190c.cod';
//  CodeId  : array[1..5] of string = ('I221','I225','I223','I112','I113');

implementation

uses pib41902,pib41904,pib41903;
{$R *.DFM}

// 폼에 관련된 사항들...........................................................
procedure TMainForm.FormCreate(Sender: TObject);
begin
  start   := True;
end;

procedure TMainForm.FormActivate(Sender: TObject);
begin
  HomeDir  := HomeDirOpen;
  p_empno  := PassEmp(cmdline,1);
  pkorname := PassEmp(cmdline,2);
  password := PassEmp(cmdline,3);
  Pclass   := PassEmp(cmdline,4);
  Helpdsr.Caption := '';
  cb_A1.Checked := False;
  cb_A2.Checked := False;
  cb_A3.Checked := False;
  cb_A4.Checked := False;
end;

procedure TMainForm.FormPaint(Sender: TObject);
begin
  if start = True then begin
     start := False;
     OraConnect;
     Pempno   := PassEmp(cmdline,1);
     Pkorname := PassEmp(cmdline,2);
     Pgrade   := Passemp(cmdline,4);
     {
     cdata.DataBase1.Params[0]  := 'SERVER NAME='+PassEmp(cmdline,13);
     CData.DataBase1.Params[1]  := 'USER NAME='+PassEmp(cmdline,5);
     CData.DataBase1.Params[19] := 'PASSWORD=' +PassEmp(cmdline,6);
     Application.Processmessages;
     Try
         CData.Database1.Connected := True;
     EXCEPT ON E : EDataBaseError DO begin
         MessageBox(handle,Pchar(E.Message),'에  러',MB_OK or $0010);
         halt(0);
       end;
     END; }
     CurDate     := fn_GetDateStr;//TimeDate(Cdata.Ora_Qvari);
     Gsysdate    := copy(CurDate,1,4)+
                    copy(CurDate,6,2)+
                    copy(CurDate,9,2);
     payrachdate := CData.payrachdateSelect('00','0001');
     //L_CurDate.Caption  := copy(CurDate,1,4)+'/'+
     //                      copy(CurDate,5,2)+'/'+
     //                      copy(CurDate,7,2);
     L_CurDate.Caption := fn_GetDateStr;
     //if PassDialog(MainForm,p_empno,pkorname,password) = False then halt(0);
     L_UserName.Caption := pkorname+'('+p_empno+')';

     //출력폼 생성...
//     HelpDsr.Caption := '코드화일을 받는중입니다 !!.(잠시만 기다리세요.)';
//     SendMessage(hp.handle,WM_PAINT,0,0);
//     MakeCodeFile(CData.Qvari,codeFile,codeid);

//     HelpDsr.Caption := '';
//     HFile := 'Pib4190c.tmp';
  end;
//  RadioButton1Click(Radiobutton2);         2002.05.08 shm 
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//   if FileExists(HomeDir+'\list\'+HFile) = True then begin
//      DeleteFile(PChar(HomeDir+'\list\'+HFile));
//   end;
//   if FileExists(HomeDir+'\list\pib4190c.cod') = True then begin
//      DeleteFile(PChar(HomeDir+'\list\pib4190c.cod'));
//   end;
end;

procedure TMainForm.BexitClick(Sender: TObject);
begin
     close;
end;

//  화면/출력으로 데이타를 보여준다.............................................
procedure TMainForm.BscreenClick(Sender: TObject);
begin
  HelpDsr.Caption := '해당 데이타를 추출중입니다.';
  SendMessage(Hp.handle,WM_PAINT,0,0);
  if (not cb_A1.checked) and (not cb_A2.checked) and (not cb_A3.checked) and (not cb_A4.checked) then
  begin
     MessageBox(0,'작업구분을 선택하십시요!!.','알  림',MB_OK or $0030);
     system.exit;
  end;
//  if Control_Process_Rtn = 0 then begin   ///////////////////////////////
//     MessageBox(0,'해당자료가 없습니다 !!.','알  림',MB_OK or $0030);
//     system.exit;
//  end;
  // 화면으로 데이타를 보낼때..
//  Bscreen.Enabled := False;    2002.05.07 shm
//  BPrint.Enabled  := False;
  if TBitBtn(Sender).Name = 'Bscreen' then begin
      Rpt := PrnForm1;
      Rpt.Preview;
  end;
  // 프린터로 데이타를 보낼때.
  if TBitBtn(Sender).Name = 'Bprint' then begin
     Rpt := PrnForm1;
     Rpt.Print;
     Bscreen.Enabled := True;
     BPrint.Enabled  := True;
  end;
  Application.ProcessMessages;
  HelpDsr.Caption := '작업이 완료되었습니다..';
end;


{...............................................................................
 작업처리 - RTN
...............................................................................}
{...............................................................................
  관리자 처리 - RTN
...............................................................................}
function TMainForm.Control_Process_Rtn : integer;
var
  i,lank,pcnt : integer;
begin
{  oldFieldCode := '';
  with CData.Qmain do begin
     close; sql.clear;
     sql.Add('select  aa.org, aa.dept, aa.field, cc.empno sabun, cc.adpayrayn, cc.deptlevel '+  //deptlevel 추가 shm
             'from  (select orgnum org, deptcode dept, fieldcode field '+
             '        from pycdept                                      '+
             '       where chanmode <> ''3'' ');
//    1999.1.19  성용권  팀장추출조건 변경.
//if workgubun = 1 then  // 실장 이상 (안씀 2002.05.07 shm)
//     sql.Add('       where deptlevel = ''B0'' ');   // 실장 이상 2002.01.01 shm
//     sql.Add('       where deptlevel in (''A0'',''B0'',''C0'')  ');   // 실단장  ---------
//if workgubun = 2 then  // 팀장
//     sql.Add('       where deptlevel = ''C0'' ');   // 팀장    2002.01.01 shm
//     sql.Add('       where deptlevel = ''D0'' ');     // 소팀장

//if workgubun = 4 then                                 // 담당    2002.01.14 shm
//     sql.Add('       where deptlevel = ''C0'' ');   // 팀장    2002.01.01 shm
//     sql.Add('       where deptlevel = ''E0'' ');
//if workgubun = 5 then                                 // 대팀장  2002.01.14 shm
//     sql.Add('       where deptlevel = ''C0'' ');
//if workgubun = 6 then                                 // 보임자  2002.05.07 shm
//     sql.Add('       where deptlevel in (''C0'',''D0'',''E0'') '); //대팀+소팀+담당

//if workgubun = 3 then  // 전체
//     sql.Add('       where deptlevel in (''B0'',''C0'') ');  // 실단장 + 팀장
//     sql.Add('       where deptlevel in (''A0'',''B0'',''C0'',''D0'',''E0'') ');  // 실장이상 + 팀장
//     sql.Add('         and chanmode != ''3'' '+
            // by shm

// 정규용 수정
       sql.Add('       and existon = ''1''                                        '+
               '       and orgnum = (select value1 from pimvari                   '+
               '                       where gubun = ''00'' and sgubun = ''0001'')'+
               '       and deptcode between '''+deptcodefr.Text+'''               '+
               '                          and '''+deptcodeto.Text+''') aa,        '+
               '     (select  empno, orgnum, deptcode                             '+
               '        from  pimpmas                                             '+
               '       where  pstate < ''60''  and payra in (');  // pstate '10' 에서 '60'으로 수정
       if cb_A1.Checked then
       begin
         sql.Add('''0A''');  // 부문/단장
       end;
       if cb_A2.Checked then
       begin
         if IsBefCheckedCBox(2) then
           sql.Add(',''16'',''18'',''19''')  // 실/본부/원/소/지사장
         else
           sql.Add('''16'',''18'',''19''')  // 실/본부/원/소/지사장
       end;
       if cb_A3.Checked then
       begin
         if IsBefCheckedCBox(3) then
           sql.Add(',''2C''')  // 팀장
         else
           sql.Add('''2C''')
       end;
       if cb_A4.Checked then
       begin
         if IsBefCheckedCBox(4) then
           sql.Add(',''4C''')  // 담당
         else
           sql.Add('''4C''')
       end;
//  1.01    1998.12.23  김혜진  팀장추출조건 변경.
//          1999.1.19   성용권  팀장추출조건 변경. (실단장에 '0' 추가)

//if workgubun = 1 then  // 실단장
//     sql.Add('       where  substr(payra,1,1) in (''0'',''1'',''2'',''3'') ');
//if workgubun = 2 then  // 소팀장
//     sql.Add('       where  substr(payra,1,1) in (''4'',''5'') ');
//if workgubun = 5 then  // 대팀장   2002.05.07 SHM 추가
//     sql.Add('       where  substr(payra,1,1) in (''2'',''4'') ');
//if workgubun = 6 then  // 보임자   2002.05.07 SHM 추가
//     sql.Add('       where  substr(payra,1,1) in (''2'',''4'') ');
//if workgubun = 4 then  // 담당
//     sql.Add('       where  substr(payra,1,2) in (''4C'') ');
//if workgubun = 3 then  // 실단장 + 팀장
//     sql.Add('       where  substr(payra,1,1) in (''0'',''1'',''2'',''3'',''4'',''5'') ');

//          1999.1.19   성용권  팀장추출조건 변경.
     sql.Add('         ) and  payrayn = ''Y'' ' + // 보임여부가 'Y'인 조건 추가
//             '         and  payra   <> ''4C'' '+       //2002.01.01 shm
             '         and  deptcode between '''+deptcodefr.Text+''' '+
             '                           and '''+deptcodeto.Text+''') bb, ');
     sql.Add('         (SELECT ORGNUM, DEPTCODE, EMPNO, ADPAYRAYN, deptlevel '); //deptlevel 추가 shm
     sql.Add('          FROM PIHORGA ');                       // 조직도
     sql.Add('          WHERE ORGNUM = (SELECT VALUE1 ');      // 현재 조직차수
     sql.Add('                          FROM PIMVARI ');
     sql.Add('                          WHERE GUBUN = ''00'' AND SGUBUN = ''0001'') ');
     sql.Add('          AND ORGYM =  (SELECT VALUE1 ');        // 조직도 최종생성년월
     sql.Add('                        FROM PIMVARI ');
     sql.Add('                        WHERE GUBUN = ''B2'' AND SGUBUN = ''0000'') ');
     sql.Add('          AND GUBUN = ''0'' ');                  // 조직인 경우
     sql.Add('          AND PAYRAYN = ''Y'') CC ');            // 보임여부
     sql.Add('where aa.dept  = bb.deptcode '+
             '  and aa.org   = bb.orgnum '+
             '  and aa.dept  = cc.deptcode '+
             '  and aa.org   = cc.orgnum ');
      Open;
      tcount := RecordCount;
      Result := RecordCount;
      if RecordCount = 0 then begin
         close;  system.exit;
      end;
      System.AssignFile(PrnF,HomeDir+'\list\'+HFile);
      System.ReWrite(PrnF);
      pcnt := 1;  lank := 1;   first;
      while not Eof do begin
         if lank = recordcount then Gr.Progress := 100
         else Gr.Progress := (lank*100) div recordcount;
         SendMessage(Panel3.handle,WM_PAINT,0,0);

         Assign_dept;               // 부서명 assign
// kcj 예외처리 catv망기술님은 겸직
         Assign_Null(lank);    // file변수에 null assign , 공직
         if not((FieldByName('sabun').AsString = '') and
               (CData.Qmain.FieldByName('dept').AsString <> 'KA100'))  then
              Assign_PrnData1(lank); // file변수에 assign

         System.Write(PrnF,PrnD);
         Next;
         inc(pcnt); inc(lank);
      end;
      close; system.close(PrnF); Gr.Progress := 0;
  end;  // with
end;

procedure TMainForm.Assign_dept;
begin
 with CData.Qmain do begin
   // 부서
   PrnD.deptlevel       := FieldByName('deptlevel').AsString;
  //   PrnD.deptna1    := '';
   PrnD.deptna2    := CData.DeptnaDisp(FieldByName('org').AsString,
                                       FieldByName('dept').AsString);
// if (workgubun = 4) or (workgubun = 3) or (workgubun = 6) then      //2001.01.15 shm  1.03
   PrnD.deptna3    := CData.Deptna3Disp(FieldByName('org').AsString,  //2002.05.07 shm  1.04
                                       FieldByName('dept').AsString);

   if trim(oldFieldcode) <> trim(FieldByName('field').AsString) then
   begin
      PrnD.deptna1    := CData.DeptnaDisp(FieldByName('org').AsString,
                                            FieldByName('field').AsString);
      oldFieldcode    := FieldByName('field').AsString
   end
 end; }{with}
end;

// 추출한 데이타를 임시변수에 할당한다..........................................
procedure TMainForm.Assign_PrnData1(lank : integer);
var
   key : string;
begin
 // 겸직일 경우
{ if CData.Qmain.FieldByName('adpayrayn').AsString = 'Y' then
      PrnD.doub := '겸 직'
 else
      PrnD.doub := '';
 key := Cdata.Qmain.FieldByName('sabun').AsString ;

// 사원정보 fetch
 with CData.QRais do begin
     close; sql.clear;
     sql.add('select empno,korname, orgnum, deptcode, fieldcode, cpaycldate, orgempdate,'+
             '       paycl, payra, nvl(cpaycldate,cardate) paycleyear,lschdeg, '+
             '       lschcode,lmajorcode,lschgrym,lschnm, '+
             '       unicode,unimajor,unigrym,usaage '+  //korage->usaaage 로 변경 shm 2001.10.12
             'from   pimpmas '+
             'where  empno = '''+key+'''');
     open;

   PrnD.no         := FormatFloat('###',lank);
   PrnD.empno      := FieldByName('empno').AsString;
   PrnD.korname    := FieldByName('korname').AsString;
//   PrnD.age        := '('+FieldByName('korage').AsString+'세)';
   PrnD.age        := '('+FieldByName('usaage').AsString+'세)';
   PrnD.paycl      := CodeDisp(CData.Qvari,'I112',FieldByName('paycl').AsString,codefile);
   PrnD.payra      := CodeDisp(CData.Qvari,'I113',FieldByName('payra').AsString,codefile);  //정규용 직위 추가
   PrnD.orgempdate := Copy(FieldByName('orgempdate').AsString,3,2)+'.'+  //2002.01.14 shm 이석희씨 요청.
                      Copy(FieldByName('orgempdate').AsString,5,2)+'.'+
                      Copy(FieldByName('orgempdate').AsString,7,2);

   PrnD.pacldate   := Copy(FieldByName('paycleyear').AsString,3,2)+'.'+
                      Copy(FieldByName('paycleyear').AsString,5,2)+'.'+
                      Copy(FieldByName('paycleyear').AsString,7,2);
   if Trim(PrnD.pacldate) = '..' then
      PrnD.pacldate := '';
   deg  := trim(FieldByName('lschdeg').Asstring);
   if CodeDisp(CData.Qvari,'I221',deg,codefile) = '전문대졸' then
     PrnD.lsch       := '전졸'
   else
     PrnD.lsch       := CodeDisp(CData.Qvari,'I221',deg,codefile);
   // 학교
   if (trim(FieldByName('lschdeg').Asstring) <= '39') then  //고졸이하 이면
   begin
       PrnD.school[0]    := FieldByName('lschnm').AsString;
       PrnD.major[0]     := '';
       PrnD.gray[0]      := copy(FieldByName('lschgrym').AsString,3,2)+'.'+
                            copy(FieldByName('lschgrym').AsString,5,2);
   end
   else                                                // 전문대졸 이상이면
       select_pimscho(PrnD.empno,deg) ;
 end;} {with}
end;
// 추출한 데이타를 임시변수에 할당한다...공직..................................
procedure TMainForm.Assign_Null(lank : integer);
var i : integer;
begin
  { PrnD.no         := FormatFloat('###',lank);
   PrnD.empno      := '';
   PrnD.korname    := '공 석';
   PrnD.age        := '';
   PrnD.paycl      := '';
   PrnD.pacldate   := '';
   PrnD.orgempdate := '';
   PrnD.lsch       := '';
   PrnD.doub       := '';

   // 학교
   for i := 0 to 2 do begin
      PrnD.school[i]    := '';
      PrnD.major[i]     := '';
      PrnD.gray[i]      := '';
   end; }
end;

procedure TMainForm.deptcodeDblClick(Sender: TObject);
begin
     Fdept2lib := TFdept2lib.Create(Self);
     Try
       Fdept2lib.ShowModal;
       If Fdept2lib.GIcloseChk = 0 then  begin
          if TEdit(Sender).Tag = 1 then
             deptcodefr.Text := Fdept2lib.GSdeptcode
          else
             deptcodeto.Text := Fdept2lib.GSdeptcode
       end; // If
     Finally
       Fdept2lib.Free;
     end;
end;

procedure TMainForm.deptcodefrKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_F1 then deptcodeDblClick(Sender);
end;

function TMainForm.IsBefCheckedCBox(cb_Tag : integer):Boolean;
//정규용 추가 이전 콤보박스의 체크유무 체크
var
  i : integer;
  cbTemp : TComponent;
begin
  Result := False;
  for i := 1 to cb_Tag do
  begin
    cbTemp:=FindComponent('cb_A'+IntToStr(cb_Tag-i));
    if Assigned(cbTemp) and (cbTemp is TCheckBox) then
    begin
      if (cbTemp as TCheckBox).Checked then
      begin
        Result := True;
        Exit;
      end;
   end;
  end;
end;

procedure TMainForm.BexcelClick(Sender: TObject);
var XL, XArr: Variant;
    i,j,k,l: integer;
    iRoopCnt :integer;
    SavePlace: TBookmark;
    title,subSQL : String;
    tmp_empdate, tmp_school, tmp_major, tmp_gray : String;
    Tempstream : TMemoryStream;
    iJPG       : TJPEGImage;
    iBMP       : TBitmap;
    Dir, BMPFileName: String;
begin
  if (not cb_A1.checked) and (not cb_A2.checked) and (not cb_A3.checked) and (not cb_A4.checked) then
  begin
     MessageBox(0,'작업구분을 선택하십시요!!.','알  림',MB_OK or $0030);
     system.exit;
  end;

  with CData.Ora_Excel do
  begin
    subSQL := 'payra in (';
    if Mainform.Gsysdate < Mainform.payrachdate then
    begin
        if cb_A1.Checked then
        begin
          subSQL := subSQL +'''12''';  // 부문장
        end;
        if cb_A2.Checked then
        begin
          if MainForm.IsBefCheckedCBox(2) then
            subSQL := subSQL +',''14'''  // 본부장
          else
            subSQL := subSQL +'''14''';  // 본부장
        end;
        if cb_A3.Checked then
        begin
          if IsBefCheckedCBox(3) then
            subSQL := subSQL + ',''16'',''19'''  // 실/지사장
          else
            subSQL := subSQL +'''16'',''19''';   // 실/지사장
        end;
        if cb_A4.Checked then
        begin
          if MainForm.IsBefCheckedCBox(4) then
           subSQL := subSQL + ',''2C'',''2C5'''  // 팀장,PL
          else
           subSQL := subSQL + '''2C'',''2C5''';  // 팀장,PL
        end;
    end
    else
    begin
        if cb_A1.Checked then
        begin
             subSQL := subSQL +'''A51'',''A61'',''A65''';  // 부문장, 단장, 트라이브장
        end;
        if cb_A2.Checked then
        begin
          if IsBefCheckedCBox(2) then
            subSQL := subSQL +',''A71'''  // 실장
          else
            subSQL := subSQL +'''A71''';  // 실장
        end;
        if cb_A3.Checked then
        begin
          if IsBefCheckedCBox(3) then
            subSQL := subSQL + ',''A81'',''A84'',''A91'''  // 본부장,그룹장,담당
          else
            subSQL := subSQL +'''A81'',''A84'',''A91''';   // 본부장,그룹장,담당
        end;
        if cb_A4.Checked then
        begin
          if IsBefCheckedCBox(4) then
           subSQL := subSQL + ',''C11'',''C51'',''C12'',''C20'''  // 팀장,PL,챕터장,스쿼드장
          else
           subSQL := subSQL + '''C11'',''C51'',''C12'') or (jobpayra =''C20'' ';  // 팀장,PL,챕터장,스쿼드장
        end;
    end;

    subSQL := subSQL + ')';
    if cb_A4.Checked then
      subSQL := '(' + subSQL + ')';
    subSQL := 'and ' +  subSQL;
    Close;
    SQL.Clear;
    SQL.Add('select COUNT(empno) Cnt from pimpmas  where pstate <''80'' ');
    SQL.Add(subSQL);
    Open;
    //orgRecCnt := FieldByName('cnt').AsInteger;
    Close;
    SQL.Clear;

    SQL.Add('select A.empno,A.korname,B.deptname,B.deptna3, C.photo,                '+
            '       (select codename from pyccode                                   '+
            '         where codeid=''I112''                                         '+
            '          and codeno =a.paycl)  payclnm,                               '+
            '       (select codename from pyccode                                   '+
            '         where codeid=''I113''                                         '+
            '          and codeno =a.payra) payranm,                                '+
            '       A.orgempdate,nvl(cpaycldate,cardate) paycldate,A.usaage         '+
            '  from pimpmas A, pycdept B, cimphot C                                 '+
            'where A.orgnum   = B.orgnum                                            '+
            '  and A.deptcode = B.deptcode                                          '+
            '  and A.empno    = C.empno                                             '+
            '  and A.pstate   < ''60''                                              ');
    SQL.Add(SubSQL);
    SQL.Add(' order by A.deptcode');

    Open;
  end;

  if CData.Ora_Excel.RecordCount < 1 then
  begin
    showmessage('엑셀 변환할 자료가 없습니다.');
    exit;
  end
  else
  begin

    helpDsr.Caption := 'Excel이 설치되어 있는지 검색하고 있습니다.';

    XArr := VarArrayCreate([1, 10], VarVariant);
    try
      XL := CreateOLEObject('Excel.Application');
    except
      MessageDlg('Excel이 설치되어 있지 않습니다.', MtWarning, [mbok], 0);
      helpDsr.caption := '';
      Exit;
    end;

  end;

  helpDsr.caption := '자료를 변환하고 있습니다.';
  XL.WorkBooks.Add; //새로운 페이지 생성
  XL.Visible            := false;
  XL.WorkSheets[1].Name := '직책자 명단';  //시트명 부여
  XL.WorkSheets[2].Delete;
  //XL.WorkSheets[3].Delete;
  XL.Range['A1:J2'].Merge;               //셀 병합

  {if work1.checked then
    title := work1.Caption
  else if work2.checked then
    title := work2.Caption
  else if work3.checked then
    title := work3.Caption
  else if work4.checked then
    title := work4.Caption; }
  if cb_A1.Checked then
  begin
    title := title + '부문장/단장' ;
  end;
  if cb_A2.Checked then
  begin
     if IsBefCheckedCBox(2) then
       title := title + '/실장'
     else
       title := title + '실장';
  end;
  if cb_A3.Checked then
  begin
    if MainForm.IsBefCheckedCBox(3) then
      title := title + '/본부장/그룹장/담당'
    else
      title := title + '본부장/그룹장/담당'
  end;
  if cb_A4.Checked then
  begin
    if IsBefCheckedCBox(4) then
      title := title + '/팀장'
    else
      title := title + '팀장';
  end;

  //TITLE NAME 설정
  XL.Range['A1'].value  := title + ' 명단';
  XL.Range['A1'].font.Size := 16;
  XL.Range['A1'].font.Bold := True;

  //컬럼명 지정_서브타이블 지정
  XArr[ 1]  := 'No'     ;
  XArr[ 2]  := '부서명' ;
  XArr[ 3]  := '성명'   ;
  XArr[ 4]  := '직책'   ;
  XArr[ 5]  := '입사일' ;
  XArr[ 6]  := '학위'   ;
  XArr[ 7]  := '학교명' ;
  XArr[ 8]  := '전공명' ;
  XArr[ 9]  := '졸업'   ;
  XArr[10]  := '사진'   ;

  XL.Range['A3' , 'J3'].Value := XArr;
  k := 3;
  for i := 1 to 10 do
  begin
     XL.Range[CHR(64 + i) + '3'].HorizontalAlignment := 3;
     XL.Range[CHR(64 + i) + '3'].Interior.Color:= $00CBF0B3;
     XL.Range[CHR(64 + i) + '3'].font.Size := 10;
     XL.Range[CHR(64 + i) + '3'].font.Bold := True;
  end;
  //XL.Range['A3:B3'].Merge;               //셀 병합

  //검색된 자료를 excel에 export처리 시킨다.
  SavePlace := CData.Ora_Excel.GetBookmark;
  CData.Ora_Excel.DisableControls;
  CData.Ora_Excel.First;

  with CData.Ora_Excel do
  begin
    for i := 1 to  RecordCount do
    begin
      XArr[ 1]  := IntToStr(i);
      XArr[ 2]  := FieldByName('deptname').AsString {+ #13#10 +
                   FieldByName('deptna3').AsString};
      XArr[ 3]  := FieldByName('korname').AsString + #13#10 +
                   '(' + FieldByName('usaage').AsString+ '세)';
      XArr[ 4]  := FieldByName('payranm').AsString;
      tmp_empdate  := Copy(FieldByName('orgempdate').AsString,3,2)+'.'+
                      Copy(FieldByName('orgempdate').AsString,5,2)+'.'+
                      Copy(FieldByName('orgempdate').AsString,7,2);
      if FieldByName('paycldate').AsString <> '' then
      begin
        tmp_empdate := tmp_empdate + #13#10 +
                       Copy(FieldByName('paycldate').AsString,3,2)+'.'+
                       Copy(FieldByName('paycldate').AsString,5,2)+'.'+
                       Copy(FieldByName('paycldate').AsString,7,2);
      end;
      XArr[ 5]  := tmp_empdate;

      iRoopCnt := 0;
      with CData.Ora_Query2 do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select A.empno,A.schgr,decode(D.codename,''전문대졸'',''전졸'',D.codename) schgrNM, A.schcode, '+
                '       B.codename schcodename, A.majorcode,           '+
                '       C.codename majorcodename, A.schtoym            '+
                ' from pimscho A,pyccode B, pyccode C, pyccode D       '+
                ' where (A.schgr = D.codeno and D.codeid =''I221'')    '+
                '   and (A.schcode = B.codeno and B.codeid =''I223'')  '+
                '   and (A.majorcode = C.codeno and C.codeid =''I225'')'+
                '   and A.empno = ''' + CData.Ora_Excel.FieldByName('empno').AsString + ''''+
                'order by A.schgr desc');
        Open;

        while not EOF do
        begin
          iRoopCnt := iRoopCnt + 1;
          case iRoopCnt of
             1: begin
                  XArr[ 6]   := FieldByName('schgrNM').AsString;
                  tmp_school := FieldByName('schcodename').AsString;
                  tmp_major  := FieldByName('majorcodename').AsString;
                  tmp_gray   := Copy(FieldByName('schtoym').AsString,3,2)+'.'+
                                Copy(FieldByName('schtoym').AsString,5,2);
                end;
             2: begin
                  tmp_school := tmp_school + #13#10 + FieldByName('schcodename').AsString;
                  tmp_major  := tmp_major + #13#10 + FieldByName('majorcodename').AsString;
                  tmp_gray   := tmp_gray + #13#10 +
                                Copy(FieldByName('schtoym').AsString,3,2)+'.'+
                                Copy(FieldByName('schtoym').AsString,5,2);
                end;
             3: begin
                  tmp_school := tmp_school + #13#10 + FieldByName('schcodename').AsString;
                  tmp_major  := tmp_major + #13#10 + FieldByName('majorcodename').AsString;
                  tmp_gray   := tmp_gray + #13#10 +
                                Copy(FieldByName('schtoym').AsString,3,2)+'.'+
                                Copy(FieldByName('schtoym').AsString,5,2);
                end;
          end;
          Next;
        end;
      end;
      XArr[ 7]  := tmp_school;
      XArr[ 8]  := tmp_major;
      XArr[ 9]  := tmp_gray;

      {TBLOBField(FieldByName('photo')).SaveToStream(Tempstream);
      Tempstream.Position := 0;
      iJPG.LoadFromStream(Tempstream);}

      XL.Range['A' + IntToStr(k+1), 'J' + IntToStr(k+1)].Value := XArr;

      Dir := 'c:\insa\list\';
      BMPFileName := Dir + Trim(FieldByName('empno').AsString) + '.jpg';
      TGraphicField(FieldByName('photo')).SaveToFile(BMPFileName);
      XL.Range['J' + IntToStr(k+1), 'J' + IntToStr(k+1)].Select;
      XL.ActiveSheet.Pictures.Insert(BMPFileName).Select;
      XL.Selection.ShapeRange.Width := 75;
      XL.Selection.ShapeRange.Height := 80;
      XL.Selection.ShapeRange.left := XL.ActiveSheet.Range['J' + IntToStr(k+1), 'J' + IntToStr(k+1)].left + 2;
      XL.Selection.ShapeRange.top := XL.ActiveSheet.Range['J' + IntToStr(k+1), 'J' + IntToStr(k+1)].top + 2;

      inc(k);
      Next;
    end;
  end;

  //여기서 부터는 EXPORT된 EXCEL자료를 예쁘게 꾸미는 부분입니다.
  XL.Range['A1', 'J' + IntToStr(k)].Borders.LineStyle   := 1;  //테두리선을 만든다.  1은 실선
  XL.Range['A1', 'J' + IntToStr(k)].Borders.Weight      := 2;  //테두리선 두깨 설정  2는 보통두깨, 3은 무지 두꺼움
  XL.Range['A1', 'J' + IntToStr(k)].Borders.ColorIndex  := 1;  //테두리선 색상설정  1은 검은색
  XL.Range['A1', 'J' + IntToStr(k)].font.name := '맑은 고딕';//'굴림체';
  XL.Range['A1', 'A1'].HorizontalAlignment              := 3;  //가운데 정렬
  XL.Range['A3', 'J' + IntToStr(k)].font.Size           := 9;
  XL.Range['A5', 'J' + IntToStr(k)].HorizontalAlignment := 1;  //좌측정렬
  //XL.Range['J4', 'J' + IntToStr(k)].HorizontalAlignment := 1;  //우측정렬
  //XL.Range['K4', 'V' + IntToStr(k)].HorizontalAlignment := 2;  //좌측정렬
  XL.Range['A1', 'J' + IntToStr(k)].Select;                    //자료를 모두 SELECT한 후 --하는 이유:  AutoFit 처리하기 위해서임
  XL.Selection.Columns.AutoFit;                                //자동정렬
  XL.Range['A4', 'J' + IntToStr(k)].Select;
  XL.Selection.Columns.RowHeight := 86;
  XL.Range['J' + IntToStr(k), 'J' + IntToStr(k)].Select;
  XL.Selection.Columns.ColumnWidth := 12;
  XL.Range['A4', 'A4'].Select;                                 //A4열에 커서 위치시킴
  XL.Visible := true;                                          //엑셀자료 보여줌
  Screen.Cursor := crDefault;
  CData.Ora_Excel.GotoBookmark(SavePlace);
  CData.Ora_Excel.FreeBookmark(SavePlace);
  CData.Ora_Excel.EnableControls;
  helpDsr.caption := '';

  //G_Progress.Progress := 0;
  CData.Ora_Excel.Close;
  helpDsr.Caption := '작업이 완료되었습니다.';
end;

end.
