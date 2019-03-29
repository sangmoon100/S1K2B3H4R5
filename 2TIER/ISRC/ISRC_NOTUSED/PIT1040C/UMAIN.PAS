//===================== Program Header =========================================
//PROGRAM-NAME    : PIT1040C(인적자원정보검색;2Tier)
//SYSTEM-NAME     : 종합인사정보
//SUBSYSTEM-NAME  : 인사
//Programmer      : 윤형식
//Version         : 30.00
//Date            : 2001.04.18
//library         :
//
//Update Contents
// Version date(yy.mm.dd) programmer  relevant doc.no    description
//  1.00   2001.04.06     손종운                         3Tier => 2Tier 변환
// 30.00   2001.04.18     윤형식      by 정세영(인사팀)  일괄정보검색 가능(사번범위, 부서범위등)
// 30.01   2001.05.10     윤형식      by 정세영(인사팀)  Non-Visible부분(시작일, 종료일, 종사기간, 비중)에 대한 표시제한 삭제
//                                                       화면,출력에서 학력->학교로 대치(최종학교추가)
// 30.02   2001.10.08     서혜미         정세영(인사팀)  입력사번순 추가 요청.
//------------------------------------------------------------------------------

unit umain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, pegradpanl, peoutlookbtn, ComCtrls, pedate, pedbutil,
  StdCtrls, pedbdate, Db, Comobj, Grids, DBGrids;


type
  TMain = class(TForm)
    St_Help: TStatusBar;
    subpanel: TPeJeonGrdPanel;
    Pa_Work: TPeJeonGrdPanel;
    pe_Date: TPeDbDate;
    pa_title: TPeJeonGrdPanel;
    s_form1: TPeJeonOutLookBtn;
    s_Form2: TPeJeonOutLookBtn;
    Bt_exit: TPeJeonOutLookBtn;
    L_Inform: TLabel;
    bt_download: TPeJeonOutLookBtn;
    ds1: TDataSource;
    DBG_User: TDBGrid;
    save_dlg: TSaveDialog;
    sgd1: TStringGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormPaint(Sender: TObject);
    procedure Bt_ExitClick(Sender: TObject);
    procedure SubFormCreate(Sender : TObject);
    procedure s_form1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bt_downloadClick(Sender: TObject);
  private
    { Private declarations }
    Start : Boolean;
  public
    { Public declarations }
    Pempno, Pkorname, Password, Ppermission, Ppaycl, Ppayra, PSysdate: String;
    pTmpFrdate, pTmpTodate: String;
  end;

var
  Main: TMain;
  SelForm: TForm;

  // Global Variables
  gsSqlMain, gsSqlDuty, gsSqlEqip, gsSqlProg, gsSqlLice: String;
  gsEmpnoList, gsOrderBy: String;
  gssql:String;

implementation

uses
  pit1040c0, pit1040c1, pit1040c9; //, pit1040c9;

{$R *.DFM}

procedure TMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TMain.FormPaint(Sender: TObject);
begin
  if start then
  begin
    start := False;
    try
      pEmpno   := peParam(CmdLine,1);
      pKorname := peParam(CmdLine,2);
      Password := peParam(CmdLine,3);
      Ppermission := copy(peParam(CmdLine,4),2,1);

      L_Inform.Caption := '';

      Self.Show;
      Self.Update;
      Application.ProcessMessages;

      if not PeDBConnect(CmdLine, DM.DataBase1, St_Help) then
      begin
        Postmessage(Self.Handle, WM_CLOSE, 0, 0);
        Exit;
      end;

      pe_Date.GetDate;
//    St_Help.Panels[1].Text := ' ' + pe_Date.DateFrm;
      UpDateWindow(St_Help.Handle);

      with DM.qryTemp do
      begin
        CLOSE;
        SQL.Clear;
        SQL.Add('SELECT               '+
                '  i.paycl    ,       '+
                '  i.payra    ,       '+
                '  I.payrayn  ,       '+
                '  to_char(sysdate,''YYYYMMDD'') sys_date, '+
                '  v.value1   ,       '+
                '  v.value2           '+
                'FROM pimpmas i, pishrvari v                 '+
                'WHERE empno = '''+Main.Pempno+'''                '+
                '  AND gubun = ''00'' and sgubun = ''0004''  ');
        Open;

        if Bof AND Eof then
          Exit;

        Ppaycl   := FieldByName('paycl').AsString;
        Ppayra   := FieldByName('payra').AsString;
        PSysdate := FieldByName('sys_date').AsString;
        pTmpFrdate := FieldByName('value1').AsString;
        pTmpTodate := FieldByName('value2').AsString;
        Close;
      end;

      if UpperCase(Ppermission) <= 'B'  then
          Ppayra := '00';

      if (not((Ppayra < '6') or ((Ppayra >='A') and (Ppayra < 'B')))) and (UpperCase(Ppermission) >= 'C')  then
      begin
          MessageDlg(' 사용권한이 없습니다.  팀장이상만 사용가능합니다.', mtInformation,[mbYes],0);
          Close;
      end
      else if (Main.PSysdate >= Main.pTmpFrdate) and (Main.PSysdate <= Main.pTmpTodate) then
      begin
          MessageDlg(' 직무경력 등록 기간중입니다. 결재완료되지 않은 자료는 부정확할 수 있습니다.', mtInformation,[mbYes],0);
          L_Inform.Caption := '직무경력 등록 기간중';
      end;

      SubFormCreate(S_Form1);
      Application.ProcessMessages;
    except on E:Exception do
      begin
        MessageDlg('실행중 다음과 같은 오류가 발생하였습니다.관리자에게 문의바랍니다.'+
                  Chr(13) + Chr(10) + E.Message, mtError, [mbOK], 0);
        PostMessage(Self.Handle, WM_CLOSE, 0, 0);
      end;
    end;
    St_Help.Panels[0].Text := '';
    Application.ProcessMessages;
  end;
end;

procedure TMain.SubFormCreate(Sender : TObject);
begin
  try
    if (SelForm <> nil) or Assigned(SelForm) then
      begin
        SelForm.Free;
        SelForm := nil;
      end;
    case TComponent(Sender).Tag of
      1 : begin
          Pa_Title.Caption := '';
          s_Form1.Font.Color := clPurple;
          s_Form2.Font.Color := clBlack;
          Application.Processmessages;
          SelForm := TMainform2.Create(nil);
        end;
      2 : begin
          Pa_Title.Caption := '';
          s_Form1.Font.Color := clBlack;
          s_Form2.Font.Color := clPurple;
          Application.Processmessages;
          SelForm := TMainform.Create(nil);
        end;
    end;
    SelForm.Parent      := Pa_Work;
    SelForm.WindowState := wsMaximized;
    SelForm.Show;
  except
    begin
      SelForm.Free;
      SelForm := nil;
    end;
  end;
end;

procedure TMain.Bt_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TMain.s_form1Click(Sender: TObject);
begin
  SubFormCreate(Sender);
end;

procedure TMain.FormCreate(Sender: TObject);
begin
   Start := True;
   sgd1.Cells[0 , 0] := '연번'               ;
   sgd1.Cells[1 , 0] := '성명'               ;
   sgd1.Cells[2 , 0] := '사번'               ;
   sgd1.Cells[3 , 0] := '조직차수'           ;
   sgd1.Cells[4 , 0] := '부서코드'           ;
   sgd1.Cells[5 , 0] := '부서명'             ;
   sgd1.Cells[6 , 0] := 'BAND코드'           ;
   sgd1.Cells[7 , 0] := '현BAND'             ;
   sgd1.Cells[8 , 0] := '직무번호'           ;
   sgd1.Cells[9 , 0] := '담당업무코드'       ;
   sgd1.Cells[10, 0] := '담당업무'           ;
   sgd1.Cells[11, 0] := '직종코드'           ;
   sgd1.Cells[12, 0] := '직종'               ;
   sgd1.Cells[13, 0] := '직무코드'           ;
   sgd1.Cells[14, 0] := '직무'               ;
   sgd1.Cells[15, 0] := '직무시작일'         ;
   sgd1.Cells[16, 0] := '직무종료일'         ;
   sgd1.Cells[17, 0] := '종사비중'           ;
   sgd1.Cells[18, 0] := '종사년월'           ;
   sgd1.Cells[19, 0] := '직무수준코드'       ;
   sgd1.Cells[20, 0] := '직무수준'           ;
   sgd1.Cells[21, 0] := '당시BAND'           ;
   sgd1.Cells[22, 0] := '최종학력코드'       ;
   sgd1.Cells[23, 0] := '최종학력'           ;
   sgd1.Cells[24, 0] := '최종학교코드'       ;
   sgd1.Cells[25, 0] := '최종학교'           ;
   sgd1.Cells[26, 0] := '전공코드'           ;
   sgd1.Cells[27, 0] := '전공'               ;
   sgd1.Cells[28, 0] := 'TOEIC'              ;
   sgd1.Cells[29, 0] := '성별'               ;
   sgd1.Cells[30, 0] := '(광의) 직무내용'    ;
   sgd1.Cells[31, 0] := '(협의) 직무내용1'   ;
   sgd1.Cells[32, 0] := '(협의) 직무내용2'   ;
   sgd1.Cells[33, 0] := '(협의) 직무내용3'   ;
   sgd1.Cells[34, 0] := '(협의) 직무내용4'   ;
   sgd1.Cells[35, 0] := '(협의) 직무내용5'   ;
   sgd1.Cells[36, 0] := '(협의) 직무내용6'   ;
   sgd1.Cells[37, 0] := '(협의) 직무내용7'   ;
   sgd1.Cells[38, 0] := '(협의) 직무내용8'   ;
   sgd1.Cells[39, 0] := '(협의) 직무내용9'   ;
   sgd1.Cells[40, 0] := '(협의) 직무내용10'  ;
   sgd1.Cells[41, 0] := '(협의) 직무내용11'  ;
   sgd1.Cells[42, 0] := '(협의) 직무내용12'  ;
   sgd1.Cells[43, 0] := '(협의) 직무내용13'  ;
   sgd1.Cells[44, 0] := '(협의) 직무내용14'  ;
   sgd1.Cells[45, 0] := '(협의) 직무내용15'  ;
   sgd1.Cells[46, 0] := '(협의) 직무내용16'  ;
   sgd1.Cells[47, 0] := '(협의) 직무내용17'  ;
   sgd1.Cells[48, 0] := '(협의) 직무내용18'  ;
   sgd1.Cells[49, 0] := '(협의) 직무내용19'  ;
   sgd1.Cells[50, 0] := '(협의) 직무내용20'  ;
   sgd1.Cells[51, 0] := '(협의) 직무내용21'  ;


end;

procedure TMain.bt_downloadClick(Sender: TObject);
var XL, XArr: Variant;
    i,j,k,Cap_empno: integer;
    SavePlace: TBookmark;
begin
   with DM.qryExcel do
   begin
      Close;
      SQL.Clear;
      SQL.Text :=
      '   select  rownum                                                                                                 '+
      '        ,  b.korname                                korname                                                       '+
      '        ,  b.empno                                  empno                                                         '+
      '        ,  b.orgnum                                 orgnum                                                        '+
      '        ,  b.deptcode                               deptcode                                                      '+
      '        ,  (select deptname  from pycdept where deptcode = b.deptcode and orgnum = b.orgnum) deptname             '+
      '        ,  m.paycl                                  paycl                                                         '+
      '      	 ,  (select codename from pyccode where codeid = ''I113'' and codeno = m.payra)    m_payra                 '+
      '        ,  b.dutyno                                 dutyno                                                        '+
      '        ,  m.tjobduty                               tjobduty                                                      '+
      '      	 ,  (select codename from pyccode where codeid = ''I702'' and codeno = m.tjobduty)   m_tjobduty            '+
      '        ,  b.dutykind                               dutykind                                                      '+
      '        ,  f.dutykindname                           dutykindname                                                  '+
      '        ,  b.duty                                   duty                                                          '+
      '        ,  g.dutyname                               dutyname                                                      '+
      '        ,  b.frdutydate                             frdutydate                                                    '+
      '        ,  b.todutydate                             todutydate                                                    '+
      '        ,  b.dutytermrate                           dutytermrate                                                  '+
      '        ,  b.dutyyy || ''년'' || dutymm || ''월''   dutyyy_mm                                                     '+
      '        ,  b.dutylevel                              dutylevel                                                     '+
      '        ,  h.dutylevelname                          dutylevelname                                                 '+
      '      	 ,  (select codename from pyccode where codeid = ''I113'' and codeno = b.payra)    b_payra                 '+
      '        ,  m.LSCHGR                                 lschgr                                                        '+
      '      	 ,  (select codename from pyccode where codeid = ''I221'' and codeno = m.lschdeg)  m_lschdeg               '+
      '        ,  m.LSCHCODE                               lschcode                                                      '+
      '        ,  m.LSCHNM                                 lschnm                                                        '+
      '        ,  m.LMAJORCODE                             lmajorcode                                                    '+
      '      	 ,  (select codename from pyccode where codeid = ''C103'' and codeno = m.lmajorcode)  m_lmajorcode         '+
      '   	    ,  m.TOEICSCORE                             toeicscore                                                    '+
      '        ,  m.SEX                                    SEX                                                           '+
      '        ,  b.dutytext                               dutytext                                                      '+
      '        ,  z.c0                                     c0                                                            '+
      '        ,  z.c1                                     c1                                                            '+
      '        ,  z.c2                                     c2                                                            '+
      '        ,  z.c3                                     c3                                                            '+
      '        ,  z.c4                                     c4                                                            '+
      '        ,  z.c5                                     c5                                                            '+
      '        ,  z.c6                                     c6                                                            '+
      '        ,  z.c7                                     c7                                                            '+
      '        ,  z.c8                                     c8                                                            '+
      '        ,  z.c9                                     c9                                                            '+
      '        ,  z.c10                                    c10                                                           '+
      '        ,  z.c11                                    c11                                                           '+
      '        ,  z.c12                                    c12                                                           '+
      '        ,  z.c13                                    c13                                                           '+
      '        ,  z.c14                                    c14                                                           '+
      '        ,  z.c15                                    c15                                                           '+
      '        ,  z.c16                                    c16                                                           '+
      '        ,  z.c17                                    c17                                                           '+
      '        ,  z.c18                                    c18                                                           '+
      '        ,  z.c19                                    c19                                                           '+
      '        ,  z.c20                                    c20                                                           '+
      '     from pishrmas b                                                                                              '+
      '        , pishrdukind f                                                                                           '+
      '        , pishrduty   g                                                                                           '+
      '        , pishrlevel  h                                                                                           '+
      '        , pimpmas m                                                                                               '+
      '        , (select a.empno,                                                                                        '+
      '   	              a.dutyno,                                                                                       '+
      '   		      	      max(decode(mod(a.subdutyno,(select max(subdutyno)  from pishrsub )),0,subdutytext)) c0,         '+
      '   		      	      max(decode(mod(a.subdutyno,(select max(subdutyno)  from pishrsub )),1,subdutytext)) c1,         '+
      '   		      	      max(decode(mod(a.subdutyno,(select max(subdutyno)  from pishrsub )),2,subdutytext)) c2,         '+
      '   		      	      max(decode(mod(a.subdutyno,(select max(subdutyno)  from pishrsub )),3,subdutytext)) c3,         '+
      '   		      	      max(decode(mod(a.subdutyno,(select max(subdutyno)  from pishrsub )),4,subdutytext)) c4,         '+
      '   		      	      max(decode(mod(a.subdutyno,(select max(subdutyno)  from pishrsub )),5,subdutytext)) c5,         '+
      '   		      	      max(decode(mod(a.subdutyno,(select max(subdutyno)  from pishrsub )),6,subdutytext)) c6,         '+
      '   		      	      max(decode(mod(a.subdutyno,(select max(subdutyno)  from pishrsub )),7,subdutytext)) c7,         '+
      '   		      	      max(decode(mod(a.subdutyno,(select max(subdutyno)  from pishrsub )),8,subdutytext)) c8,         '+
      '   		      	      max(decode(mod(a.subdutyno,(select max(subdutyno)  from pishrsub )),9,subdutytext)) c9,         '+
      '   		      	      max(decode(mod(a.subdutyno,(select max(subdutyno)  from pishrsub )),10,subdutytext)) c10,       '+
      '   		      	      max(decode(mod(a.subdutyno,(select max(subdutyno)  from pishrsub )),11,subdutytext)) c11,       '+
      '   		      	      max(decode(mod(a.subdutyno,(select max(subdutyno)  from pishrsub )),12,subdutytext)) c12,       '+
      '   		      	      max(decode(mod(a.subdutyno,(select max(subdutyno)  from pishrsub )),13,subdutytext)) c13,       '+
      '   		      	      max(decode(mod(a.subdutyno,(select max(subdutyno)  from pishrsub )),14,subdutytext)) c14,       '+
      '   		      	      max(decode(mod(a.subdutyno,(select max(subdutyno)  from pishrsub )),15,subdutytext)) c15,       '+
      '   		      	      max(decode(mod(a.subdutyno,(select max(subdutyno)  from pishrsub )),16,subdutytext)) c16,       '+
      '   		      	      max(decode(mod(a.subdutyno,(select max(subdutyno)  from pishrsub )),17,subdutytext)) c17,       '+
      '   		      	      max(decode(mod(a.subdutyno,(select max(subdutyno)  from pishrsub )),18,subdutytext)) c18,       '+
      '   		      	      max(decode(mod(a.subdutyno,(select max(subdutyno)  from pishrsub )),19,subdutytext)) c19,       '+
      '   		      	      max(decode(mod(a.subdutyno,(select max(subdutyno)  from pishrsub )),20,subdutytext)) c20        '+
      '             from pishrsub a                                                                                      '+
	     '           group by a.empno, a.dutyno ) z                                                                         '+
      '           where nvl(todutydate,''299912'') = (select max(nvl(todutydate,''299912''))                             '+
      '                                               from pishrmas                                                      '+
      '                                              where empno = b.empno)                                              '+
      '             and b.dutytermrate in ( select max(dutytermrate)                                                     '+
      '                                       from pishrmas                                                              '+
      '                                      where empno = b.empno                                                       '+
      '                                        and nvl(todutydate ,''299912'') = (select max(nvl(todutydate,''299912'')) '+
      '                                                                           from pishrmas                          '+
      '                                                                          where empno = b.empno))                 '+
      '      and m.pstate < ''80''                                                                                       '+
      '      and b.empno     = z.empno  (+)                                                                              '+
      '      and b.dutyno    = z.dutyno (+)                                                                              '+
      '      and b.empno     = m.empno                                                                                   '+
      '      and b.dutylevel = h.dutylevel                                                                               '+
      '      and b.dutykind  = g.dutykind                                                                                '+
      '      and b.duty      = g.duty                                                                                    '+
      '      and b.dutykind  = f.dutykind                                                                                '+
      '      and b.empno      not like ''M%''                                                                            '+
      '    order by rownum, b.empno                                                                                      ';

{      '   		        from pishrsub a, pishrmas b                                                                      '+
      '            where a.empno = b.empno                                                                           '+
      '              and a.dutyno = b.dutyno                                                                         '+
      '              and nvl(b.todutydate ,''299912'') > to_char(sysdate,''YYYYMM'')                                 '+
      '   		       group by a.empno, a.dutyno ) z                                                                    '+
      '    where nvl(b.todutydate ,''299912'') > to_char(sysdate,''YYYYMM'')                                         '+
      '      and m.pstate <''80''                                                                                    '+
      '      and a.empno = b.empno                                                                                   '+
      '      and a.dutykind = b.dutykind                                                                             '+
      '      and b.deptcode = c.deptcode                                                                             '+
      '      and a.empno    = m.empno                                                                                '+
      '      and b.dutykind = f.dutykind                                                                             '+
      '      and b.dutykind = g.dutykind                                                                             '+
      '      and b.duty     = g.duty                                                                                 '+
      '      and b.dutylevel = h.dutylevel                                                                           '+
      '      and b.empno      = z.empno                                                                              '+
      '      and b.dutyno     = z.dutyno                                                                             '+
      '      and m.orgnum = (select value1                                                                           '+
      '                        from pimvari                                                                          '+
      '                       where gubun = ''00''                                                                   '+
      '                         and sgubun = ''0001'')                                                               '+
      '   order by rownum, a.empno                                                                                   '; }
      open;
   end;
//--------------
  if DM.qryExcel.RecordCount < 1 then
  begin
    showmessage('엑셀 변환할 자료가 없습니다.');
    exit;
  end;
  st_help.SimpleText := 'Excel이 설치되어 있는지 검색하고 있습니다.';

  XArr := VarArrayCreate([1, DBG_User.Columns.Count], VarVariant); //Gird 출력시
  try
    XL := CreateOLEObject('Excel.Application');
  except
    MessageDlg('Excel이 설치되어 있지 않습니다.', MtWarning, [mbok], 0);
    st_help.SimpleText := '';
    Exit;
  end;

  st_help.SimpleText := '자료를 변환하고 있습니다.';
  XL.WorkBooks.Add; //새로운 페이지 생성
  XL.Visible := false;
  XL.WorkSheets[1].Name := '마지막 직무';  //시트명 부여
//  XL.Range['A1:'+CHR(64 + DBG_User.Columns.Count)+'2'].Merge;               //셀 병합 Gird 출력시
//  XL.Range['A1:' + 'BA2'].Merge;               //셀 병합 Gird 출력시


  //TITLE NAME 설정
//  XL.Range['A1'].value := '마지막직무 추출내역';
//  XL.Range['A1'].font.Size := 16;
//  XL.Range['A1'].font.Color := clBlack;

  //컬럼명 지정_서브타이블 지정
  for i := 1 to DBG_User.Columns.Count do
  begin
    if DBG_User.Columns[i-1].Title.Caption = '사원번호' then
      Cap_empno := i;
    XArr[i]  := DBG_User.Columns[i-1].Title.Caption;
  end;

//XL.Range['A3' , CHR(64 + DBG_User.Columns.Count)+'3'].Value := XArr;  //Gird 출력시
  XL.Range['A1' , 'AZ1'].Value := XArr;  //Gird 출력시
  k := 1;
//  Exit;
  for i := 1 to DBG_User.Columns.Count do     //Gird 출력시
  begin
//     XL.Range[CHR(64 + i) + '3'].HorizontalAlignment := 3;
//     XL.Range[CHR(64 + i) + '3'].Interior.Color:= $00CBF0B3;
//     XL.Range[CHR(64 + i) + '3'].font.Size := 10;
//     XL.Range[CHR(64 + i) + '3'].font.Bold := True;
  end;

  //검색된 자료를 excel에 export처리 시킨다.
  SavePlace := DM.qryExcel.GetBookmark;
  DM.qryExcel.DisableControls;
  DM.qryExcel.First;

  for i := 1 to  DM.qryExcel.RecordCount do
  begin
     for j := 1 to DBG_User.Columns.Count do
     begin
//       if j  = Cap_empno then   //사원번호 칼럼에 ' 문자 넣어주기 위해.
//         XArr[j]  := ''''+DBG_User.Fields[j-1].AsString
//       else
         XArr[j]  := ''''+ DBG_User.Fields[j-1].AsString;
     end;
// XL.Range['A' + IntToStr(k+1), CHR(64 + DBG_User.Columns.Count) + IntToStr(k+1)].Value := XArr;
   XL.Range['A' + IntToStr(k+1), 'AZ'+ IntToStr(k+1)].Value := XArr;
     inc(k);
     DM.qryExcel.Next;
  end;
  //여기서 부터는 EXPORT된 EXCEL자료를 예쁘게 꾸미는 부분입니다.
   XL.Range['A1', 'AZ1'].Interior.Color := clYellow;
   XL.Range['A1', 'AZ' + IntToStr(k)].Borders.LineStyle := 1;    //테두리선을 만든다.  1은 실선
   XL.Range['A1', 'AZ' + IntToStr(k)].Borders.Weight := 2;       //테두리선 두깨 설정  2는 보통두깨, 3은 무지 두꺼움
   XL.Range['A1', 'AZ' + IntToStr(k)].Borders.ColorIndex := 1;   //테두리선 색상설정  1은 검은색
   XL.Range['A1', 'AZ' + IntToStr(k)].font.name := '굴림체';
   XL.Range['A1', 'A1'].HorizontalAlignment := 3;               //가운데 정렬
   XL.Range['A2', 'AZ' + IntToStr(k)].font.Size := 9;
   XL.Range['A2', 'AZ' + IntToStr(k)].HorizontalAlignment := 2;  //좌측정렬
   XL.Range['A1', 'AZ' + IntToStr(k)].Select;                    //자료를 모두 SELECT한 후 --하는 이유:  AutoFit 처리하기 위해서임
   XL.Selection.Columns.AutoFit;                                //자동정렬
   XL.Range['A2', 'A2'].Select;                                 //A4열에 커서 위치시킴
   XL.Visible := true;                                          //엑셀자료 보여줌
   Screen.Cursor := crDefault;
   DM.qryExcel.GotoBookmark(SavePlace);
   DM.qryExcel.FreeBookmark(SavePlace);
   DM.qryExcel.EnableControls;
//   showmessage(IntToStr(DBG_User.Columns.Count));
   st_help.SimpleText := '';

//   ================
end;
end.
