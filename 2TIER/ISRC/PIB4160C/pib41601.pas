{header.
----------------------------------------------------------------------------------
PROGRAM-NAME    :  PIB4160C(보직자 명단)
SYSTEM-NAME     : 종합인사정보
SUBSYSTEM-NAME  : 인사
Programmer      : 전철호
Version         : 1.01
Date            : 1998.12.23
Update contents
  1.00   1996.07.30    전철호          신규프로그램개발    처리명세서
  1.01   1998.12.23    김혜진          직렬=>직군,추출조건변경.
                       실단장추출시 이사대우 포함이면
                       (직위첫자리가='1','2','3')  or (직급='09' and 보임여부='Y') -by 이평로
  30.02  2003.12.10    최상용(요청서)  보임자명단 양식지가 변경          정규용
----------------------------------------------------------------------------------}

unit pib41601;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Gauges, ExtCtrls,pass, DB, DBTables,forgnum,codetext,datelib,
  TimeFtp,Quickrpt, Mask, Comobj, MemDS, DBAccess, Ora, Func;

type DataText = record
     gubun      : string[1];
     deptname   : string[60];
     payra      : string[20];
     korname    : string[10];
     empno      : string[4];
     paycl      : string[20];
     cpaycldate : string[10];
     empdate    : string[10];
     jobgun     : string[20];
end;

type
  Tpib4161cForm = class(TForm)
    Panel19: TPanel;
    L_UserName: TLabel;
    L_CurDate: TLabel;
    Panel11: TPanel;
    Panel2: TPanel;
    Label11: TLabel;
    Panel8: TPanel;
    Panel1: TPanel;
    Panel9: TPanel;
    Panel6: TPanel;
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
    payorder: TRadioButton;
    emporder: TRadioButton;
    Database1: TDatabase;
    QCode: TQuery;
    Qdept: TQuery;
    Qtext: TQuery;
    Bdept: TBitBtn;
    Panel4: TPanel;
    Panel7: TPanel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Query1: TQuery;
    Panel12: TPanel;
    GroupBox1: TGroupBox;
    work1: TRadioButton;
    work2: TRadioButton;
    work3: TRadioButton;
    work4: TRadioButton;
    Bexcel: TBitBtn;
    QExcel: TOraQuery;
    Q_Pihorga: TOraQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure BscreenClick(Sender: TObject);
    procedure ordercheck(Sender: TObject);
    procedure BdeptClick(Sender: TObject);
    procedure BexitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ConditionClick(Sender: TObject);
    procedure work1Click(Sender: TObject);
    procedure BexcelClick(Sender: TObject);
  private
    { Private declarations }
    start    : integer;
    p_empno  : string;
    pkorname : string;
    password : string;
    FreeCheck : Boolean;
    FreeDept  : Boolean;

    fp       : file of DataText;
    pD       : DataText;
    function  QcodeDisp(s1,s2 : string) : string;
    function  QdeptDisp(s1,s2 : string) : string;
    procedure MakeTextFile;
  public
    { Public declarations }
    orderby,condition,workgubun : integer;
    prnRpt      : TQuickRep;
    DetailCount : integer;
  end;

var
  pib4161cForm: Tpib4161cForm;
  ErrorHelp    : array[0..255] of char;
  HomeDir      : string;
  
implementation
uses pib41602;//, pib41603;
{$R *.DFM}

// 코드명을 가져온다............................................................
procedure Tpib4161cForm.MakeTextFile;
var
  str : string;
begin
 codeToText(HomeDir+'\pib4160c.cod','',0);
 with QText do begin
      close; sql.clear;
      sql.add('select codeid,codeno,codename from pyccode                          ');
      sql.add('where (codeid = ''I112'' or codeid = ''I113'' or codeid = ''I115'' )');
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
      QText.close;
 end;
 codeToText('','',2);
end;

function Tpib4161cForm.QcodeDisp(s1,s2 : string) : string;
var
  str : string;
begin
if trim(s2) = '' then begin QcodeDisp := ''; system.exit; end;
if FreeCheck = False then begin
   QCode.Close;
   QCode.Parambyname('lcodeid').AsString  := s1;
   QCode.Parambyname('lcodesub').AsString := s2;
   QCode.Open;
   if trim(QCode.FieldByName('CodeName').AsString) = ''  then
      QcodeDisp := '('+s2+')'
   else QCodeDisp := Qcode.FieldByName('CodeName').AsString;
end else begin
    str := TextCodeDisp(s1,s2,HomeDir+'\pib4160c.cod');
    if trim(str) = '' then QcodeDisp := '('+trim(s2)+')'
                      else QcodeDisp := str;
end;
end;

function Tpib4161cForm.QdeptDisp(s1,s2 : string) : string;
var
  str : string;
begin
 if trim(s2) = '' then begin QDeptDisp := ''; system.exit; end;
 if FreeDept = False then begin
    Qdept.Close;
    Qdept.Parambyname('lorgnum').AsString := s1;
    Qdept.Parambyname('ldept').AsString   := s2;
    Qdept.Open;
    if trim(Qdept.FieldByName('DeptName').AsString) = ''  then
       QdeptDisp := '부서코드('+s2+') '+'조직차수('+s1+')'
    else QdeptDisp := Qdept.FieldByName('DeptName').AsString;
 end else begin
    str := TextDeptDisp(s1,s2,HomeDir+'\pib4160c.dep');
    if trim(str) = '' then QDeptDisp := '부서코드('+s2+') '+'조직차수('+s1+')'
                      else QDeptDisp := str;
 end;
end;

// 폼에 관한 사항들.............................................................
procedure Tpib4161cForm.FormCreate(Sender: TObject);
begin
  start := 0;
end;

procedure Tpib4161cForm.FormActivate(Sender: TObject);
begin
  HomeDir  := HomeDirOpen;
  p_empno  := PassEmp(cmdline,1);
  pkorname := PassEmp(cmdline,2);
  password := PassEmp(cmdline,3);
  prnRpt := PrintForm.QuickRep1;
end;

procedure Tpib4161cForm.FormPaint(Sender: TObject);
var
CurDate: string;
begin

if start = 0 then begin
   start := 1;
   Application.ProcessMessages;
   if DataBase1.Connected then DataBase1.Connected := False; 
   DataBase1.Params[0]  := 'SERVER NAME='+PassEmp(cmdline,13);
   DataBase1.Params[1]  := 'USER NAME='+PassEmp(cmdline,5);
   DataBase1.Params[16] := 'PASSWORD=' +PassEmp(cmdline,6);
   Try
      Database1.Connected := True;
   EXCEPT ON E : EDataBaseError DO begin
     MessageBox(handle,StrPcopy(ErrorHelp,E.Message),'에  러',MB_OK or $0010);
     halt(0);
   end;
   END;

  CurDate  := TimeDate(Query1);
  L_CurDate.Caption  := copy(CurDate,1,4)+'/'+
                        copy(CurDate,5,2)+'/'+
                        copy(CurDate,7,2);

// if PassDialog(pib4161cForm,p_empno,pkorname,password) = False then halt(0);
   L_UserName.Caption := pkorname+'('+p_empno+')';
   FreeCheck := DiskSpaceCheck;
   HelpDsr.Caption := '인사코드 데이타를 다운받고 있습니다 !!(잠시만 기다리세요)';
   SendMessage(hp.handle,WM_PAINT,0,0);
   if FreeCheck = True then MakeTextFile;
   HelpDsr.Caption := '';
   Condition := 1;   workgubun := 1;
   ordercheck(payorder);
 end;
end;

procedure Tpib4161cForm.BexitClick(Sender: TObject);
begin
     close;
end;

procedure Tpib4161cForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  codeToText(HomeDir+'\pib4160c.cod','',3);
  codeToText(HomeDir+'\pib4160c.dep','',3);
end;

// 작성구분을 결정한다..........................................................
procedure Tpib4161cForm.ordercheck(Sender: TObject);
begin
  TRadioButton(Sender).Checked := true;
  if TRadioButton(Sender).Tag = 1 then orderby := 1;
  if TRadioButton(Sender).Tag = 2 then orderby := 2;
end;

procedure Tpib4161cForm.ConditionClick(Sender: TObject);
begin
  TRadioButton(Sender).Checked := true;
  if TRadioButton(Sender).Tag = 1 then Condition := 1;
  if TRadioButton(Sender).Tag = 2 then Condition := 2;
end;

procedure Tpib4161cForm.BscreenClick(Sender: TObject);
begin
  Application.ProcessMessages;
   if TBitBtn(Sender).Name = 'Bscreen' then
     begin
       prnRpt.Preview;
     end else prnRpt.Print;
   HelpDsr.Caption := '작업을 완료하였습니다 !!.';
end;


procedure Tpib4161cForm.BdeptClick(Sender: TObject);
var
  str : string;
begin

 if FreeDept = False then begin
    Bdept.Caption := '부서코드 해제';
 end else begin
    Bdept.Caption := '부서코드 다운';
    deptToText(HomeDir+'\pib4160c.dep','',3);
    FreeDept := False;
    system.exit;
 end;
 FreeDept := DiskSpaceCheck;
 if FreeDept = False then system.exit;
 Try
   forg := Tforg.Create(self);
   forg.filename := 'pib4160c.dep';
   forg.ShowModal;
   if forg.ModalResult <> mrYes then begin
      Bdept.Caption := '부서코드 다운';
      FreeDept      := False;
   end;
 Finally
   forg.Free;
 End;
end;

procedure Tpib4161cForm.work1Click(Sender: TObject);
begin
   workgubun := TRadioButton(Sender).Tag;
   Gr.Progress := 0;
   HelpDsr.Caption := '';
end;


procedure Tpib4161cForm.BexcelClick(Sender: TObject);
var XL, XArr: Variant;
    i,j,k,l: integer;
    SavePlace: TBookmark;
    title : String;
begin
  OraConnect;

  Qexcel.Session := Ora_Session;
  with Qexcel do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select Q.deptname sosok,P.deptcode realdept,substr(P.deptcode,1,2) sectcode, Q.fieldcode, M.SCHGR,                '+
            '       DECODE(P.deptlevel,''E0'',SUBSTR(P.deptname, INSTR(P.deptname,'' '')+1,LENGTH(P.deptname)-INSTR(P.deptname,'' '')+1),p.deptname) teamname, '+
            '       P.deptna3,M.*                                                                                      '+
            'from pycdept P,pycdept Q,                                                                                 '+
            '     (select A.empno,A.orgnum,                                                                            '+
            '             A.deptcode,                                                                                  '+
            '             A.korname name,                                                                              '+
            '             H.codename payra,                                                                            '+
            '             substr(A.juminid,1,2) birth,                                                                 '+
            '             A.orgempdate empdate,                                                                        '+
            '             A.paycldate,A.lschgr lschgr,B.codename lschgrnm,F.SCHGR SCHGR,F.SCHNM schnm,G.codename major '+
            '        from pimpmas A,pyccode B,pimscho F,pyccode G,pyccode H                                            '+
            '       where                                                                                              '+
            '             (B.codeid(+) =''I221'' and A.lschgr = B.codeno(+))                                                 '+
            '          and A.pstate < ''80''                                                                           '+
            '          and A.orgnum = (select value1 from pimvari where gubun =''00'' and sgubun =''0001'')            '+
            '          and A.payrayn = ''Y''                                                                           '+
            '          and A.empno = F.empno(+)                                                                        '+
            '          and (G.codeid(+) = ''I225'' and F.majorcode = G.codeno(+))                                      '+
            '          and (H.codeid(+) = ''I113'' and A.payra = H.codeno(+)) ) M                                       '+
            ' where P.orgnum = (select value1 from pimvari where gubun = ''00'' and sgubun =''0001'')                   '+
            '  and M.deptcode(+) = P.deptcode                                                                          '+
            '  and (not(lschgr > ''40'' and schgr = ''39'') or lschgr is null)                                         ');
    if work1.checked then
     begin
        SQL.Add('  and P.deptlevel <=''A0''                                                 '+
                '  and RPAD(substr(P.deptcode,1,1),5,0) = Q.deptcode                       ');
            end
    else if work2.checked then
     begin
        SQL.Add('  and P.deptlevel =''B0''                                                 '+
                '  and RPAD(substr(P.deptcode,1,1),5,0) = Q.deptcode                       ');
            end
    else if work3.checked then
      begin
        SQL.Add('  and P.deptlevel =''C0''                                                 '+
                '  and P.extcode   = Q.deptcode                                            ');
      end
    else if work4.checked then
      begin
        SQL.Add('  and P.deptlevel  =''D0''                                                 '+
                '  and P.extcode    = Q.deptcode                                            ');
      end;
    SQL.Add('  and P.orgnum   = M.orgnum(+)                                                '+
            '  and P.deptcode = M.deptcode(+)                                              '+
            '  and P.orgnum   = Q.orgnum                                                   '+
            ' order by realdept,teamname,M.SCHGR                                           ');
    Open;
  end;

  if Qexcel.RecordCount < 1 then
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
  XL.WorkSheets[1].Name := '보임자 명단';  //시트명 부여
  XL.WorkSheets[2].Delete;
  //XL.WorkSheets[3].Delete;
  XL.Range['A1:J2'].Merge;               //셀 병합

  if work1.checked then
    title := work1.Caption
  else if work2.checked then
    title := work2.Caption
  else if work3.checked then
    title := work3.Caption
  else if work4.checked then
    title := work4.Caption;

  //TITLE NAME 설정
  XL.Range['A1'].value  := title + ' 명단';
  XL.Range['A1'].font.Size := 16;
  XL.Range['A1'].font.Bold := True;

  //컬럼명 지정_서브타이블 지정
  XArr[ 1]  := '소속'   ;
  XArr[ 2]  := ''       ;
  XArr[ 3]  := '성명'   ;
  XArr[ 4]  := '생년'   ;
  XArr[ 5]  := '직책'   ;
  XArr[ 6]  := '입사일' ;
  XArr[ 7]  := '경력일' ;
  XArr[ 8]  := '학위'   ;
  XArr[ 9]  := '학교'   ;
  XArr[10]  := '전공'   ;

  XL.Range['A3' , 'J3'].Value := XArr;
  k := 3;
  for i := 1 to 10 do
  begin
     XL.Range[CHR(64 + i) + '3'].HorizontalAlignment := 3;
     XL.Range[CHR(64 + i) + '3'].Interior.Color:= $00CBF0B3;
     XL.Range[CHR(64 + i) + '3'].font.Size := 10;
     XL.Range[CHR(64 + i) + '3'].font.Bold := True;
  end;
  XL.Range['A3:B3'].Merge;               //셀 병합

  //검색된 자료를 excel에 export처리 시킨다.
  SavePlace := Qexcel.GetBookmark;
  Qexcel.DisableControls;
  Qexcel.First;

  for i := 1 to  Qexcel.RecordCount do
  begin
     XArr[ 1]  := Qexcel.FieldByName('sosok').AsString;
     XArr[ 2]  := Qexcel.FieldByName('teamname').AsString;
     if Qexcel.FieldByName('empno').AsString = '' then
     begin
       with Q_Pihorga do
       begin
         Close;
         ParamByName('deptcode').AsString := Qexcel.FieldByName('realdept').AsString;
         Open;
         if EOF then
         begin
           XArr[ 3] := '< 공  석 >'
         end
         else
         begin
           XArr[ 3] := '< 겸  직 >  ' + FieldByName('korname').AsString +
                                  '  ' + FieldByName('payraNM').AsString +
                                  '  ( ' + FieldByName('paydunm').AsString + ' )';
         end;
       end;
       XArr[ 4] := '';
       XArr[ 5] := '';
       XArr[ 6] := '';
       XArr[ 7] := '';
       XArr[ 8] := '';
       XArr[ 9] := '';
       XArr[10] := '';
     end
     else
     begin
       XArr[ 3]  := Qexcel.FieldByName('name').AsString;
       XArr[ 4]  := Qexcel.FieldByName('birth').AsString;
       XArr[ 5]  := Qexcel.FieldByName('payra').AsString;
       XArr[ 6]  := Copy(Qexcel.FieldByName('empdate').AsString,3,2) +'.'+
                    Copy(Qexcel.FieldByName('empdate').AsString,5,2) +'.'+ Copy(Qexcel.FieldByName('empdate').AsString,7,2);
       XArr[ 7]  := Copy(Qexcel.FieldByName('paycldate').AsString,3,2) +'.'+
                    Copy(Qexcel.FieldByName('paycldate').AsString,5,2) +'.'+ Copy(Qexcel.FieldByName('paycldate').AsString,7,2);
       XArr[ 8]  := Qexcel.FieldByName('lschgrnm').AsString;
       XArr[ 9]  := Qexcel.FieldByName('schnm').AsString;
       XArr[10]  := Qexcel.FieldByName('major').AsString;
     end;
     XL.Range['A' + IntToStr(k+1), 'J' + IntToStr(k+1)].Value := XArr;
     inc(k);
     Qexcel.Next;
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
  XL.Range['A4', 'A4'].Select;                                 //A4열에 커서 위치시킴
  XL.Visible := true;                                          //엑셀자료 보여줌
  Screen.Cursor := crDefault;
  Qexcel.GotoBookmark(SavePlace);
  Qexcel.FreeBookmark(SavePlace);
  Qexcel.EnableControls;
  helpDsr.caption := '';

  //G_Progress.Progress := 0;
  Qexcel.Close;
  helpDsr.Caption := '작업이 완료되었습니다.';
end;

end.
