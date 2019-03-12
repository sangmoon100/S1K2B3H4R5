unit PZX1011A;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OnScheme, StdCtrls, Buttons, Db, MemDS, DBAccess, Ora, Pass, Func, Menus, Comobj,
  ComCtrls, jpeg, ExtCtrls, OnFocusButton;

type
  TMainForm = class(TForm)
    SF_Main: TOnSchemeForm;
    SB_Help: TStatusBar;
    Panel1: TPanel;
    Label2: TLabel;
    OraQuery1: TOraQuery;
    L_hint1: TLabel;
    L_hint2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Memo1: TMemo;
    BT_Close: TOnFocusButton;
    BT_Excel1: TOnFocusButton;
    BT_Excel2: TOnFocusButton;
    procedure BT_Excel1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BBExcel2Click(Sender: TObject);
    procedure BT_CloseClick(Sender: TObject);
  private
    { Private declarations }
    procedure ExcelExtract(ExcelQry : TOraQuery; SheetName : String); //dsa2000 Add 2018.12.
  public
    { Public declarations }
    GSGroupId : String[4];     //GroupId
  end;

var
  MainForm: TMainForm;

implementation

{$R *.DFM}

procedure TMainForm.FormShow(Sender: TObject);
begin
  SB_Help.Panels[1].Text :=' 종합인사시스템에 접속중입니다...';

  Self.OnPaint := Nil;
  Application.ProcessMessages;
  SF_Main.Refresh;

  OraConnect;

  with OraQuery1 do
  begin
       close;
       Sql.Clear;
       Sql.Text := 'select Groupid from pymenuuser              '+
                   ' where empno = '''+ Passemp(cmdline,1) +''' ';
       open;
       GSGroupID := Fields[0].AsString;
  end;

  if  (GSGroupid = 'G042') then
  begin
       BT_Excel1.Enabled := False;
       L_hint1.Enabled   := False;
  end
  else if  (GSGroupid = 'G052') or (GSGroupid = 'G053') or (GSGroupid = 'G062') then
  begin
       BT_Excel2.Enabled := False;
       L_hint2.Enabled   := False;
  end;
  //dsa2000 2017.02.08. 인사담당자2 그룹 추가하면서 이하 구문 삭제 함. : 그룹추가시마다 소스 수정을 방지하기 위해.  
  {else if not (GSGroupid = 'G001') or (GSGroupid = 'G011') then
  begin
       Showmessage('프로그램 접근 권한이 없습니다. 프로그램을 종료합니다.');
       BT_CloseClick(Sender);
  end; }

  SB_Help.Panels[1].Text :=' ';
end;

//엑셀추출
procedure TMainForm.ExcelExtract(ExcelQry : TOraQuery; SheetName : String);
var XL, XArr: Variant;
    i,j,k, vFieldsCount, v26, Cap1,Cap2,Cap3,Cap4,Cap5,Cap6,Cap7,Cap8 : integer;
    SavePlace: TBookmark;
begin
  if ExcelQry.RecordCount = 0 then
  begin
       ShowMessage('추출할 내역이 존재하지 않습니다');
       Exit;
  end;

  vFieldsCount := ExcelQry.Fields.Count;

  XArr := VarArrayCreate([1, vFieldsCount], VarVariant); //Gird 출력시
  try
      XL := CreateOLEObject('Excel.Application');
  except
      MessageDlg('Excel이 설치되어 있지 않습니다.', MtWarning, [mbok], 0);
      Exit;
  end;

  XL.WorkBooks.Add; //새로운 페이지 생성
  XL.Visible := false;
  XL.WorkSheets[1].Name := SheetName; //AqueryExcel.Caption;  //시트명 부여
  //XL.Range['A1'].value := L_QueryName.ValueCaption; //TITLE NAME 설정
  XL.Range['A1'].font.Size := 15;

  for i := 1 to vFieldsCount do
  begin
       if (Trim(ExcelQry.Fields[i-1].FullName) = '사번') or
          (Trim(ExcelQry.Fields[i-1].FullName) = '사 번') or
          (Trim(ExcelQry.Fields[i-1].FullName) = '사원번호') then Cap1 := i;
       if (Trim(ExcelQry.Fields[i-1].FullName) = '부서등급') then Cap2 := i;
       if (Trim(ExcelQry.Fields[i-1].FullName) = '시작시간') then Cap3 := i;
       if (Trim(ExcelQry.Fields[i-1].FullName) = '종료일시') then Cap4 := i;
       if (Trim(ExcelQry.Fields[i-1].FullName) = '주민번호') then Cap5 := i;
       if (Trim(ExcelQry.Fields[i-1].FullName) = '은행코드') then Cap6 := i;
       if (Trim(ExcelQry.Fields[i-1].FullName) = '계좌번호') then Cap7 := i;
       if (Trim(ExcelQry.Fields[i-1].FullName) = 'BAND(181231)') then Cap8 := i;
       
       XArr[i] := ExcelQry.Fields[i-1].FullName;
  end;

  v26 := Trunc(vFieldsCount/26);

  if (v26 > 0) then XL.Range['A1', CHR(64+v26) + CHR(64 + vFieldsCount-(26 * v26))+'1'].Value := XArr
  else              XL.Range['A1',               CHR(64 + vFieldsCount           )+'1'].Value := XArr;

  j := 1; //showmessage('26 * v26 : '+inttostr((26 * v26)));
  for i := 1 to vFieldsCount do
  begin
       if i >= 27 then
       begin
            XL.Range[CHR(64+j) + CHR(64 + i-(26 * j)) + '1'].HorizontalAlignment := 3;
            XL.Range[CHR(64+j) + CHR(64 + i-(26 * j)) + '1'].Interior.Color      := $00CBF0B3;
            XL.Range[CHR(64+j) + CHR(64 + i-(26 * j)) + '1'].font.Size           := 11;
            XL.Range[CHR(64+j) + CHR(64 + i-(26 * j)) + '1'].font.Bold           := True;
            
            if (i-26*j) > 25 then j := j + 1; //if (i-26*j) >25 then showmessage(inttostr(i-26*j));
       end
       else
       begin                      //A  ~
            XL.Range[CHR(64 + i)                      + '1'].HorizontalAlignment := 3;
            XL.Range[CHR(64 + i)                      + '1'].Interior.Color      := $00CBF0B3;
            XL.Range[CHR(64 + i)                      + '1'].font.Size           := 11;
            XL.Range[CHR(64 + i)                      + '1'].font.Bold           := True;
       end;
  end;

  //검색된 자료를 excel에 export처리 시킨다.
  SavePlace := ExcelQry.GetBookmark;
  ExcelQry.DisableControls;
  ExcelQry.First;

  k := 1;
  for i := 1 to ExcelQry.RecordCount do
  begin
       for j := 1 to vFieldsCount do
       begin
            if  (j = Cap1) or (j = Cap2) or (j = Cap3) or (j = Cap4) or (j = Cap5) or (j = Cap6) or (j = Cap7) or (j = Cap8) then
                 XArr[j] := ''''+ExcelQry.Fields[j-1].AsString //숫자로 구성된 데이터에 ' 문자 넣어주기 위해.
            else XArr[j] := ExcelQry.Fields[j-1].AsString;
       end;

       if (v26 > 0) then XL.Range['A' + IntToStr(k+1), CHR(64+v26) + CHR(64 + vFieldsCount-(26 * v26))+ IntToStr(k+1)].Value := XArr
       else              XL.Range['A' + IntToStr(k+1),               CHR(64 + vFieldsCount           )+ IntToStr(k+1)].Value := XArr;

       inc(k);
       ExcelQry.Next;
  end;

  if (v26 > 0) then //and (vFieldsCount >= (26 * v26 + 1)) then            //HA ~
  begin
       XL.Range['A1', CHR(64+v26) + CHR(64 + vFieldsCount-(26 * v26)) + IntToStr(k)].Borders.LineStyle := 1;
       XL.Range['A2', CHR(64+v26) + CHR(64 + vFieldsCount-(26 * v26)) + IntToStr(k)].font.Size := 9;
       XL.Range['A1', CHR(64+v26) + CHR(64 + vFieldsCount-(26 * v26)) + IntToStr(k)].Select;
  end
  else                                   //A  ~
  begin
       XL.Range['A1', CHR(64 + vFieldsCount) + IntToStr(k)].Borders.LineStyle := 1;     //테두리선을 만든다.  1은 실선
       XL.Range['A2', CHR(64 + vFieldsCount) + IntToStr(k)].font.Size := 9;
       //XL.Range['A1', CHR(64 + vFieldsCount) + IntToStr(k)].font.name := '굴림체';
       //XL.Range['A2', CHR(64 + vFieldsCount) + IntToStr(k)].HorizontalAlignment := 1; //우측정렬
       XL.Range['A1', CHR(64 + vFieldsCount) + IntToStr(k)].Select;                     //자료를 모두 SELECT한 후 --하는 이유:  AutoFit 처리하기 위해서임
  end;

  XL.Selection.Columns.AutoFit;                   //자동정렬
  XL.Range['A1', 'A1'].HorizontalAlignment := 3;  //가운데 정렬
  XL.Range['A1', 'A1'].Select;                    //열에 커서 위치시킴
  XL.Visible := true;                             //Excel 자료 보여줌
  Screen.Cursor := crDefault;

  ExcelQry.GotoBookmark(SavePlace);
  ExcelQry.FreeBookmark(SavePlace);
  ExcelQry.EnableControls;
end;



procedure TMainForm.BT_Excel1Click(Sender: TObject);
var XL, XArr: Variant;
    i,j,k,Cap_empno: integer;
    SavePlace: TBookmark;
begin
  SB_Help.Panels[1].Text :=' 엑셀 변환할 자료를 검색중입니다.';

  with OraQuery1 do
  begin
       close; Sql.Clear;
       Sql.Add('Select A.Empno 사번,  A.Korname 성명,  A.Juminid 주민번호, Pstateyn 현원여부, Func_Codename(''I114'',A.Pstate) 인사상태,       ');
       Sql.Add('       A.Empdate 최초입사일,  A.Orgempdate SKB입사일,  Retcont 휴대폰, Skemail Sk그룹메일,                                     ');
       Sql.Add('      (Select Deptname From Pycdept Where Orgnum=B.Orgnum And Deptcode=Rpad(B.Sectcode ,5,''0'')) 부문명 ,                     ');
       Sql.Add('       Rpad(B.Sectcode ,5,''0'') 부문코드,                                                                                     ');
       Sql.Add('      (Select Deptname From Pycdept Where Orgnum=B.Orgnum And Deptcode=Rpad(B.Fieldcode,5,''0'')) "실/본부명",                 ');
       Sql.Add('       Rpad(B.Fieldcode,5,''0'') "실/본부코드",  B.Deptname 부서명,  A.Deptcode 부서코드,                                      ');
       Sql.Add('      (Select Deptname From Pycdept Where Orgnum=A.Orgnum And Deptcode= A.Jobdept) 근무부서명, A.Jobdept 근무부서코드,         ');
       Sql.Add('       Func_Codename(''I113'',Payra)    직책,      A.Payra    직책코드,                                                        ');
       Sql.Add('       Func_Codename(''I113'',JobPayra) 근무직책,  A.JobPayra 근무직책코드,                                                    ');
       Sql.Add('       Func_Codename(''I160'',Jobplace) 근무지,    Func_Codename(''I115'',Jobgun) 직군,                                        ');
       Sql.Add('       Func_Codename(''I112'',Paycl)    Band명,    A.Paycl Band코드,                     A.Paycldate Band기준일,               ');

       Sql.Add('      (Select Listagg(Info,'' ★ '') Within Group(Order By Annono)                                                             ');   //2018.12.05. 겸직|겸무|파견_가로출력 추가 dsa2000
       Sql.Add('        From (Select Empno, Annono, Ancode, Andetcode, Func_Deptname(Orgnum,Addeptcode)||''(''||Addeptcode||'')'' Info         ');
       Sql.Add('                From Pihanno M                                                                                                 ');
       Sql.Add('               Where Anupdyn= ''Y''                                                                                            ');
       Sql.Add('                 And Orgnum = Func_Orgnum                                                                                      ');
       Sql.Add('                 And Ancode In (''233'', ''234'')                                                                              ');
       Sql.Add('                 And Nvl(Antodate, ''99999999'') >= To_Char(Sysdate, ''YYYYMMDD'')                                             ');
       Sql.Add('                 And Not Exists(Select 1 From Pihanno B Where M.Empno  = B.Empno                                               ');
       Sql.Add('                                                          And B.Anupdyn= ''Y''                                                 ');
       Sql.Add('                                                          And M.Anfrdate < B.Anfrdate                                          ');
       Sql.Add('                                                          And B.Ancode = Decode(M.Ancode,''233'',''238'',''234'', ''235'','''')');
       Sql.Add('                                                          And B.Orgnum = Func_Orgnum                                           ');
       Sql.Add('                                                          And Nvl(M.Addeptcode,'' '')= Nvl(B.Addeptcode,'' '')                 ');
       Sql.Add('                                                          And Nvl(M.Adpayra,'' '')= Nvl(B.Adpayra,'' ''))    )                 ');
       Sql.Add('       Where Empno= A.Empno Group By Empno) "겸직|겸무_부서",                                                                  ');
       Sql.Add('      (Select Listagg(Info,'' ★ '') Within Group(Order By Annono)                                                             ');   //2018.12.05. 겸직|겸무|파견_가로출력 추가 dsa2000
       Sql.Add('        From (Select Empno, Annono, Ancode, Andetcode, Func_Codename(''I113'',M.Adpayra)||''(''||Adpayra||'')'' Info           ');
       Sql.Add('                From Pihanno M                                                                                                 ');
       Sql.Add('               Where Anupdyn= ''Y''                                                                                            ');
       Sql.Add('                 And Orgnum = Func_Orgnum                                                                                      ');
       Sql.Add('                 And Ancode In (''233'', ''234'')                                                                              ');
       Sql.Add('                 And Nvl(Antodate, ''99999999'') >= To_Char(Sysdate, ''YYYYMMDD'')                                             ');
       Sql.Add('                 And Not Exists(Select 1 From Pihanno B Where M.Empno  = B.Empno                                               ');
       Sql.Add('                                                          And B.Anupdyn= ''Y''                                                 ');
       Sql.Add('                                                          And M.Anfrdate < B.Anfrdate                                          ');
       Sql.Add('                                                          And B.Ancode = Decode(M.Ancode,''233'',''238'',''234'', ''235'','''')');
       Sql.Add('                                                          And B.Orgnum = Func_Orgnum                                           ');
       Sql.Add('                                                          And Nvl(M.Addeptcode,'' '')= Nvl(B.Addeptcode,'' '')                 ');
       Sql.Add('                                                          And Nvl(M.Adpayra,'' '')= Nvl(B.Adpayra,'' ''))    )                 ');
       Sql.Add('       Where Empno= A.Empno Group By Empno) "겸직|겸무_직책",                                                                  ');

       Sql.Add('      (Select Listagg(Info,'' ★ '') Within Group(Order By Annono)                                                             ');   //2018.12.05. 겸직|겸무|파견_가로출력 추가 dsa2000
       Sql.Add('        From (Select Empno, Annono, Ancode, Func_Deptname(Orgnum,Addeptcode)||''(''||Nvl(Addeptcode,''그룹파견'')||'')'' Info  ');
       Sql.Add('                From Pihanno M                                                                                                 ');
       Sql.Add('               Where Anupdyn= ''Y''                                                                                            ');
       Sql.Add('                 And Orgnum = Func_Orgnum                                                                                      ');
       Sql.Add('                 And Ancode In (''411'', ''412'')                                                                              ');
       Sql.Add('                 And Nvl(Antodate, ''99999999'') >= To_Char(Sysdate, ''YYYYMMDD'')                                             ');
       Sql.Add('                 And Not Exists(Select 1 From Pihanno B Where M.Empno  = B.Empno                                               ');
       Sql.Add('                                                          And B.Anupdyn= ''Y''                                                 ');
       Sql.Add('                                                          And M.Anfrdate < B.Anfrdate                                          ');
       Sql.Add('                                                          And B.Ancode = Decode(M.Ancode,''411'',''414'',''412'', ''414'','''')');
       Sql.Add('                                                          And B.Orgnum = Func_Orgnum                                           ');
       Sql.Add('                                                          And Nvl(M.Addeptcode,'' '')= Nvl(B.Addeptcode,'' '')                 ');
       Sql.Add('                                                          And Nvl(M.Adpayra,'' '')= Nvl(B.Adpayra,'' ''))    )                 ');
       Sql.Add('       Where Empno= A.Empno Group By Empno) "파견_부서",                                                                       ');

       Sql.Add('      (Select Listagg(Info,'' ★ '') Within Group(Order By Annono)                                                             ');   //2018.12.05. 겸직|겸무|파견_가로출력 추가 dsa2000
       Sql.Add('        From (Select Empno, Annono, Ancode, Func_Deptname(Orgnum,Addeptcode)||''(''||Nvl(Addeptcode,''그룹파견'')||'')'' Info  ');
       Sql.Add('                From Pihanno M                                                                                                 ');
       Sql.Add('               Where Anupdyn= ''Y''                                                                                            ');
       Sql.Add('                 And Orgnum = Func_Orgnum                                                                                      ');
       Sql.Add('                 And Ancode In (''411'', ''412'')                                                                              ');
       Sql.Add('                 And Nvl(Antodate, ''99999999'') >= To_Char(Sysdate, ''YYYYMMDD'')                                             ');
       Sql.Add('                 And Not Exists(Select 1 From Pihanno B Where M.Empno  = B.Empno                                               ');
       Sql.Add('                                                          And B.Anupdyn= ''Y''                                                 ');
       Sql.Add('                                                          And M.Anfrdate < B.Anfrdate                                          ');
       Sql.Add('                                                          And B.Ancode = Decode(M.Ancode,''411'',''414'',''412'', ''414'','''')');
       Sql.Add('                                                          And B.Orgnum = Func_Orgnum                                           ');
       Sql.Add('                                                          And Nvl(M.Addeptcode,'' '')= Nvl(B.Addeptcode,'' '')                 ');
       Sql.Add('                                                          And Nvl(M.Adpayra,'' '')= Nvl(B.Adpayra,'' ''))    )                 ');
       Sql.Add('       Where Empno= A.Empno Group By Empno) "파견_직책",                                                                       ');

       //2019.01.  2019년1월 정규직 BAND체계변경으로 20181231일자의 BAND정보 추출 가능토록 변경 dsa2000
       sql.Add('       His.Paycl181231                                                                    "BAND(181231)",                      ');
       sql.Add('      (Select CODENAME from PYCCODE where CODEID = ''I112'' And Codeno = His.Paycl181231) "BAND명(181231)",                    ');
       sql.Add('       His.Cpaycldate181231                                                               "BAND승격일(181231)",                ');
       sql.Add('       His.Paycldate181231                                                                "BAND조정일(181231)",                ');
       sql.Add('       His.PayclYMD181231                                                                 "현BAND근무기간(181231)"             ');
       Sql.Add('  from pimpmas a, pycdept b,                                                                                                   ');
       sql.Add('       (Select Empno,                                                                                                          ');
       sql.Add('               Paycl Paycl181231,                                                                                              ');
       sql.Add('               Cpaycldate Cpaycldate181231,                                                                                    ');
       sql.Add('               Paycldate  Paycldate181231,                                                                                     ');
       sql.Add('               Payclyy||''년''||Payclmm||''월''||Paycldd||''일'' PayclYMD181231                                                ');
       sql.Add('         From Pimpmas_Hint M                                                                                                   ');
       sql.Add('        Where Workdate=''20181231'' ) His                                                                                      ');
       Sql.Add(' where A.pstate < ''80''                                                                                                       ');
       Sql.Add('   and A.ORGNUM = B.ORGNUM   And A.deptcode = b.deptcode                                                                       ');
       sql.Add('   and a.Empno = His.Empno(+)                                                                                                  '); //~2019.01.  2019년 정규직 BAND체계변경으로
       {Sql.Add('  from pimpmas a, pycdept b                                                                                                   ');
       Sql.Add(' where A.pstate < ''80''                                                                                                       ');
       Sql.Add('   and A.ORGNUM = B.ORGNUM   And A.deptcode = b.deptcode                                                                       '); }
       
       //인사권자 및 HR팀원을 제외한 기타 인력에 대한 임원 정보 검색 제한 2014.02.03 김현순M요청
       //if  not ((GSGroupid = 'G001') or (GSGroupid ='G002') or (GSGroupid = 'G011') or (GSGroupid = 'G062')) then
       if  not ((GSGroupid = 'G001') or (GSGroupid ='G002') or (GSGroupid = 'G011') or (GSGroupid = 'G012') or (GSGroupid = 'G062')) then //DSA2000 2017.02.08 인사담당자2 그룹 추가
       Sql.Add('   and A.empno not like ''M%''                 ');

       Sql.Add(' order by A.Deptcode, A.payra, A.paycl, A.empno');  //edit1.text := sql.text;       
       open;
  end;

  if OraQuery1.RecordCount < 1 then
  begin
       SB_Help.Panels[1].Text :='';
       showmessage('엑셀 변환할 자료가 없습니다.');
       exit;
  end;

   ExcelExtract(OraQuery1,BT_Excel1.Caption); //2018.12. Add

   SB_Help.Panels[1].Text := '추출완료';
end;

procedure TMainForm.BBExcel2Click(Sender: TObject);
var XL, XArr: Variant;
    i,j,k,Cap_empno: integer;
    SavePlace: TBookmark;
begin
  SB_Help.Panels[1].Text :=' 엑셀 변환할 자료를 검색중입니다.';

  with OraQuery1 do
  begin
       close;
       Sql.Clear;
       Sql.Add('Select A.empno 사번,  A.korname 성명,  substr(A.juminid,1,7)||''*******'' 주민번호,                                 ');
       Sql.Add('      (Select codename from pyccode where codeid = ''I114'' and codeno  = A.pstate  ) 인사상태, pstateyn   현원여부,');
       Sql.Add('      (Select deptname from pycdept where orgnum = A.orgnum and deptcode= A.deptcode) 부서명  , A.deptcode 부서코드,');
       Sql.Add('      (Select codename from pyccode where codeid = ''I113'' and codeno  = A.payra   ) 직책    , A.payra    직책코드,');
       Sql.Add('       A.Empdate 최초입사일, A.orgempdate 입사일,                                                                   ');
       Sql.Add('      (Select codename from pyccode where codeid = ''I160'' and codeno  = A.jobplace) 근무지,	  	            ');
       Sql.Add('      (Select codename from pyccode where codeid = ''I115'' and codeno  = A.jobgun  ) 직군,                         ');
       //2017.01.05 jissi SR-1701-0225 HR운영팀 김우정 P762 임원에 대한 은행명/계좌번호 조회되도록 변경
       //Sql.Add('      (Select codename from pyccode where codeid = ''K910'' and codeno  = b.PAYBANK ) 은행,     b.PAYBANK  은행코드,');
       //Sql.Add('       b.PAYACNT "계 좌 번 호", retcont 휴대폰                                                                      ');
       Sql.Add('       decode(substr(A.empno,1,1),''M''                                                                             ');
       Sql.Add('                                 ,(Select codename from pyccode where codeid = ''K910''                             ');
       Sql.Add('                                      and codeno  = (Select PAYBANK from pkzmpmas where empno=A.empno))             ');
       Sql.Add('                                 ,(Select codename from pyccode where codeid = ''K910'' and codeno=b.PAYBANK)) 은행,');
       Sql.Add('       decode(substr(A.empno,1,1),''M''                                                                             ');
       Sql.Add('                                 ,(Select PAYBANK  from pkzmpmas where empno = A.empno)                             ');
       Sql.Add('                                 ,b.PAYBANK)  은행코드,                                                             ');
       Sql.Add('       decode(substr(A.empno,1,1),''M''                                                                             ');
       Sql.Add('                                 ,(Select payacnt  from pkzmpmas where empno = A.empno)                             ');
       Sql.Add('                                 ,b.PAYACNT) "계좌번호",retcont 휴대폰,A.offitel 내선번호                           ');
       Sql.Add('  from pimpmas a, pkmpmas b                                                                                         ');
       Sql.Add(' where A.pstate < ''80''                                                                                            ');
       Sql.Add('   and A.empno  = b.empno(+)                                                                                        ');
       
       //인사권자 및 HR팀원을 제외한 기타 인력에 대한 임원 정보 검색 제한 2014.02.03 김현순M요청
       //if  not ((GSGroupid = 'G001') or (GSGroupid ='G002') or (GSGroupid = 'G011') or (GSGroupid = 'G062')) then
       if  not ((GSGroupid = 'G001') or (GSGroupid ='G002') or (GSGroupid = 'G011') or (GSGroupid = 'G012') or (GSGroupid = 'G062')) then //DSA2000 2017.02.08 인사담당자2 그룹 추가
       Sql.Add('   and A.empno not like ''M%''                                                                                      ');
       Sql.Add(' order by A.payra, A.paycl, A.empno                                                                                 ');
       open;
  end;
  if OraQuery1.RecordCount < 1 then
  begin
       SB_Help.Panels[1].Text :='';
       showmessage('엑셀 변환할 자료가 없습니다.');
       exit;
  end;

  ExcelExtract(OraQuery1,BT_Excel2.Caption); //2018.12. Add

  SB_Help.Panels[1].Text := '';
end;

procedure TMainForm.BT_CloseClick(Sender: TObject);
begin
  Close;
end;


end.
