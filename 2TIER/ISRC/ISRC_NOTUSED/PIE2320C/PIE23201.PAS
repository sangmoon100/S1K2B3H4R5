{
---------------------Program  Header -------------------------------------------
PROGRAM-NAME    : PIE2340C (직급별 월 인원현황)
SYSTEM-NAME     : 종합인사정보
SUBSYSTEM-NAME  : 인사
Programmer      :
Version         : 1.00
Date            : 2005.02.14
Update contents
  버전     수정일     수정자   관련근거        수정내용
--------------------------------------------------------------------------------
  % 주의 : 아래의 코드내용이 바뀌더라도 기존반영사항은 놔둔다.(과거 자료를 볼수도 있으므로)  %
}

unit PIE23201;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, Gauges, ExtCtrls, Tabs, TabNotBk,
  Mask, DBTables, Quickrpt,  DBGrids, pass, Datelib, Timeftp,
  Db , ComObj, OleCtrls,Grids,kpaylib;

type
  TMainForm = class(TForm)

    Database1: TDatabase;
    Panel1: TPanel;
    L_Name: TLabel;
    L_Date: TLabel;
    Panel3: TPanel;
    Panel2: TPanel;
    Label7: TLabel;
    Panel14: TPanel;
    P_Body: TPanel;
    ME_WorkDate: TMaskEdit;
    Panel15: TPanel;
    Panel17: TPanel;
    Panel5: TPanel;
    G_Progress: TGauge;
    Panel16: TPanel;
    Panel4: TPanel;
    BB_Close: TBitBtn;
    BB_Screen: TBitBtn;
    BB_Print: TBitBtn;
    P_helpinfo: TPanel;
    P_Help: TLabel;
    Label1: TLabel;
    BB_SetUp: TBitBtn;
    PrinterSetup: TPrinterSetupDialog;
    Q_date: TQuery;
    Btext: TBitBtn;
    Query1: TQuery;
    SaveDialog1: TSaveDialog;
    NewQry: TQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BB_CloseClick(Sender: TObject);
    procedure BB_ScreenClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure BB_SetUpClick(Sender: TObject);

  private
    pempno, pkorname, password: string;
    start: Integer;
    rStr: string;
    DataCount : integer;
    { Private declarations }
    Procedure Data_Display_csv2(Sender: TObject); // 신 직급체계 양식 (정규용 추가.2004.06.22)
    Procedure Data_Display2;
    procedure ShowPreView;
    procedure Update_History;
    procedure DataExist;   {자료존재여부 확인}
  public
    { Public declarations }
    AReport: TQuickRep;
  end;

var
  MainForm: TMainForm;
  ErrorHelp  : array[0..255] of char;
  HomeDir    : string;
implementation

{$R *.DFM}

uses
  PIE23207, PIE23203;

// 자료 Excel 전환
procedure TMainForm.Data_Display_csv2(Sender: TObject);
var
  Fexcel : textfile;
begin
  Application.ProcessMessages;
  assignfile(Fexcel, SaveDialog1.FileName);
  rewrite(Fexcel);
  writeln(Fexcel, ',,,,,,,,부,서,직,종,별,,인,원,현,황');
  writeln(Fexcel, '');
  writeln(Fexcel, ',[기준년월] ,:, '+L_Date.Caption+' 년');
  writeln(Fexcel, '');
  writeln(Fexcel, ',,,,,,,,,,,정,규,직,,,,,,,,,비정,규직');
  writeln(Fexcel, ',,,,,경,영,관,리,,마,케,팅,영,업,R&D,,기,,술,,,,');
  writeln(Fexcel, '부서명,총계,임원,소계,감사,경영기획,경영지원,인사조직,CR,파이낸스,기업영업,마케팅,매스영업,사업관리,신규사업,연구개발,N/W계획,N/W구축,N/W운용,N/W지원,IT,특정,전문,계약직,파견직');
  Data_Display2;
  with Newqry do
  begin
    First;
    while not Eof do
    begin
      P_Help.Caption := '부서 직종별 인력현황을 추출합니다 !!.';
      SendMessage(P_helpinfo.handle,WM_PAINT,0,0);
      writeln(Fexcel,
                     FieldByName('부서명'  ).AsString +','+
                     FieldByName('총계'    ).AsString +','+
                     FieldByName('임원'    ).AsString +','+
                     FieldByName('소계1'   ).AsString +','+
                     FieldByName('감사'    ).AsString +','+
                     FieldByName('경영기획').AsString +','+
                     FieldByName('경영지원').AsString +','+
                     FieldByName('인사조직').AsString +','+
                     FieldByName('CR'      ).AsString +','+
                     FieldByName('파이낸스').AsString +','+
                     FieldByName('기업영업').AsString +','+
                     FieldByName('마케팅'  ).AsString +','+
                     FieldByName('매스영업').AsString +','+
                     FieldByName('사업관리').AsString +','+
                     FieldByName('신규사업').AsString +','+
                     FieldByName('연구개발').AsString +','+
                     FieldByName('NW계획'  ).AsString +','+
                     FieldByName('NW구축'  ).AsString +','+
                     FieldByName('NW운용'  ).AsString +','+
                     FieldByName('NW지원'  ).AsString +','+
                     FieldByName('IT'      ).AsString +','+
                     FieldByName('특정'    ).AsString +','+
                     FieldByName('전문'    ).AsString +','+
                     FieldByName('계약'    ).AsString +','+
                     FieldByName('파견'    ).AsString );

      Next;
    end;
  end;
  closefile(Fexcel);
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  start := 0;
end;

procedure TMainForm.FormActivate(Sender: TObject);
begin
  if Start = 0 then
  begin
    pempno   := PassEmp(cmdline, 1);
    pkorname := PassEmp(cmdline, 2);
    password := PassEmp(cmdline, 3);
    DataBase1.Params[0]  := 'SERVER NAME=' + PassEmp(cmdline, 13);
    DataBase1.Params[1]  := 'USER NAME=' + PassEmp(cmdline, 5);
    DataBase1.Params[19] := 'PASSWORD='  + PassEmp(cmdline, 6);
    HomeDir := HomeDirOpen;

    AReport := NewPrintForm.InReport;
  end;
end;

procedure TMainForm.FormPaint(Sender: TObject);
var
//  rStr: string;
  i,j : integer;
  EditCom: TEdit;
begin
  if start = 0 then begin
    start := 1;
    Application.ProcessMessages;
    Try
       Database1.Connected := True;
    EXCEPT ON E : EDataBaseError DO begin
       MessageBox(handle,StrPcopy(ErrorHelp,E.Message),'에  러',MB_OK or $0010);
       halt(1);
    end;
    END;

   rStr := TimeDate(Q_date);
   L_Date.Caption := Copy(rStr, 1, 4)+'/'+
                     Copy(rStr, 5, 2)+'/'+
                     Copy(rStr, 7, 2);


   ME_WorkDate.Text := Copy(rStr, 1, 6); // 작업년도

    P_Help.Caption := '';
  end;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

{-----------------------------------------------------------}
procedure TMainForm.ShowPreView;
begin
  PreViewForm := TPreViewForm.Create(self);
  PreViewForm.ShowModal;
  PreViewForm.Free;
end;

{-----------------------------------------------------------}
procedure TMainForm.BB_CloseClick(Sender: TObject);
begin
    if FileExists(HomeDir+'\list\PIE2320C.tmp') = True then begin
       DeleteFile(PChar(HomeDir+'\list\PIE2320C.tmp'));
       DeleteFile(PChar(HomeDir+'\list\PIE2320C.dat'));
       DeleteFile(PChar(HomeDir+'\list\temp_c.tmp'));
    end;
    Close;
end;

procedure TMainForm.BB_ScreenClick(Sender: TObject);
begin
  P_Help.Caption := '부서직종별 인원현황을 추출합니다 !!.';
  SendMessage(P_helpinfo.handle,WM_PAINT,0,0);

  if length(trim(ME_WorkDate.Text)) < 6  then
  begin
    MessageBox(handle,'작업년도 오류입니다.','에  러',MB_OK or $0020);
    ME_WorkDate.SetFocus;
    System.Exit;
  end;

  AReport := NewPrintForm.InReport;

  if FileExists(HomeDir+'\list\PIE2320C.tmp') = True then begin
     DeleteFile(PChar(HomeDir+'\list\PIE2320C.tmp'));
     DeleteFile(PChar(HomeDir+'\list\PIE2320C.dat'));
     DeleteFile(PChar(HomeDir+'\list\temp_c.tmp'));
  end;

  {인쇄}
  if TBitBtn(Sender).Name = 'BB_Print' then
  begin
    DataExist;
    if DataCount < 1 then ShowMessage('해당자료가 없습니다.')
    else
       if AReport = NewPrintForm.InReport then
          Data_Display2;
       AReport.Print;
  end
  else if TBitBtn(Sender).Name = 'BB_Screen' then   //화면출력
  begin
    DataExist;
    if DataCount < 1 then ShowMessage('해당자료가 없습니다.')
    else
       if AReport = NewPrintForm.InReport then
          Data_Display2;
       AReport.PreView;
  end
  else if TBitBtn(Sender).Name = 'Btext' then     //excel 변환
  begin
    SaveDialog1.FileName := '부서직종별인원현황_'+Copy(rStr,1,8)+'.csv';
    if saveDialog1.Execute then
    begin
      Data_Display_csv2(Sender);
      Update_History; //log 남기기 위해 2002.06.25 shm 추가
    end
    else
    begin
      G_Progress.progress := 00;
      P_Help.Caption := '작업을 취소 했습니다.';
      Application.ProcessMessages;
      exit;
    end;
  end;

  P_Help.Caption := '작업이 완료되었습니다.';
  G_Progress.Progress := 0;
  Screen.Cursor := crDefault;
end;

procedure TMainForm.Update_History;
var
  Temp_no    : Integer;
begin
     Query1.Close;
     Query1.Sql.Clear;
     Query1.Sql.Add(' SELECT  NVL(MAX(NO),0) NO  FROM PYMPHIS     ');
     Query1.Sql.Add('  WHERE  PROGID = ''PIE2320C''               ');
     Query1.Open;
     Temp_No    := Query1.FieldByName('NO').AsInteger + 1;
     Query1.Close;


     Query1.Sql.Clear;
     Query1.Sql.Add('INSERT INTO PYMPHIS                                      ');
     Query1.Sql.Add('   ( NO, EMPNO, KORNAME, PROGID, EXTDATE, EXTCONTENTS )  ');
     Query1.Sql.Add('VALUES                                                   ');
     Query1.Sql.Add('   (                                                     ');
     Query1.Sql.Add(format('       ''%d'',',[Temp_NO]        )                 );
     Query1.Sql.Add('       '''+PEMPNO+''','''+PKORNAME+''',''PIE2320C'',     ');
     Query1.Sql.Add('       '''+RSTR+''',                                     ');
     Query1.Sql.Add('       ''부서직종별 인원현황을 EXCEL 화일로 출력한다.'')  ');
     Query1.ExecSQL;
     Query1.Close;
end;


procedure TMainForm.Data_Display2;
begin
  with Newqry do
  begin
    Close;
    Sql.Clear;

    if ME_WorkDate.Text = Copy(rStr, 1, 6) then
      Sql.text := 'SELECT MAX(T.코드) "코드", MAX(T.부서명) "부서명" '
            +#13+ '      ,SUM(T.소계1) + SUM(T.소계2) + SUM(T.임원) "총계" '
            +#13+ '      ,SUM(T.임원) "임원", SUM(T.소계1) "소계1" '
            +#13+ '      ,SUM(T.감사) "감사", SUM(T.경영기획) "경영기획", SUM(T.경영지원) "경영지원" '
            +#13+ '      ,SUM(T.인사조직) "인사조직", SUM(T.CR) "CR", SUM(T.파이낸스) "파이낸스" '
            +#13+ '      ,SUM(T.기업영업) "기업영업", SUM(T.마케팅) "마케팅", SUM(T.매스영업) "매스영업" '
            +#13+ '      ,SUM(T.사업관리) "사업관리", SUM(T.신규사업) "신규사업", SUM(T.연구개발) "연구개발" '
            +#13+ '      ,SUM(T.NW계획) "NW계획", SUM(T.NW구축) "NW구축", SUM(T.NW운용) "NW운용" '
            +#13+ '      ,SUM(T.NW지원) "NW지원", SUM(T.IT) "IT", SUM(T.특정) "특정" '
            +#13+ '      ,SUM(T.소계2) "소계2",SUM(T.전문) "전문", SUM(T.계약) "계약", SUM(T.파견) "파견" '
            +#13+ '  FROM '
            +#13+ '       ( '
            +#13+ '       SELECT X.DEPTCODE "코드", X.DEPTNAME "부서명" '
            +#13+ '             ,SUM(X.임원) "임원" '
            +#13+ '             ,SUM(X.특정) "소계1" '
            +#13+ '             ,0 "감사" ,0 "경영기획" ,0 "경영지원" ,0 "인사조직" ,0 "CR" ,0 "파이낸스" '
            +#13+ '             ,0 "기업영업" ,0 "마케팅" ,0 "매스영업" ,0 "사업관리" ,0 "신규사업" '
            +#13+ '             ,0 "연구개발" ,0 "NW계획" ,0 "NW구축" ,0 "NW운용" ,0 "NW지원" ,0 "IT" '
            +#13+ '             ,SUM(X.특정) "특정" '
            +#13+ '             ,SUM(X.전문) + SUM(X.계약) + SUM(X.파견) "소계2" '
            +#13+ '             ,SUM(X.전문) "전문" ,SUM(X.계약) "계약" ,SUM(X.파견) "파견" '
            +#13+ '         FROM '
            +#13+ '             ( '
            +#13+ '              SELECT ''ZZZZZ'' DEPTCODE, ''총계'' DEPTNAME '
            +#13+ '       		    ,NVL(DECODE(A.JOBGUN, ''00'', COUNT(A.DEPTCODE)), 0) "임원" '
            +#13+ '              	    ,NVL(DECODE(A.JOBGUN, ''50'', COUNT(A.DEPTCODE)), 0) "특정" '
            +#13+ '                    ,NVL(DECODE(A.JOBGUN, ''70'', COUNT(A.DEPTCODE)), 0) "전문" '
            +#13+ '                    ,NVL(DECODE(A.JOBGUN, ''90'', COUNT(A.DEPTCODE)), 0) "계약" '
            +#13+ '                    ,NVL(DECODE(A.JOBGUN, ''H1'', COUNT(A.DEPTCODE)), 0) "파견" '
            +#13+ '                FROM PIMPMAS A '
            +#13+ '               WHERE A.JOBGUN IN (''H1'', ''90'', ''70'', ''50'', ''00'') '
            +#13+ '                 AND A.PSTATEYN = ''Y'' '
            +#13+ '               GROUP BY A.JOBGUN '
            +#13+ '             ) X '
            +#13+ '        GROUP BY X.DEPTCODE, X.DEPTNAME '
            +#13+ '        UNION ALL '
            +#13+ '       SELECT X.DEPTCODE, X.DEPTNAME '
            +#13+ '             ,0 "임원" '
            +#13+ '             ,SUM(X.감사)     + SUM(X.경영기획) + SUM(X.경영지원) + SUM(X.인사조직) + SUM(X.CR)       + SUM(X.파이낸스) + '
            +#13+ '              SUM(X.기업영업) + SUM(X.마케팅)   + SUM(X.매스영업) + SUM(X.사업관리) + SUM(X.신규사업) + SUM(X.연구개발) + '
            +#13+ '              SUM(X.NW계획)   + SUM(X.NW구축)   + SUM(X.NW운용)   + SUM(X.NW지원)   + SUM(X.IT)       "소계1" '
            +#13+ '             ,SUM(X.감사)     "감사" '
            +#13+ '             ,SUM(X.경영기획) "경영기획" '
            +#13+ '             ,SUM(X.경영지원) "경영지원" '
            +#13+ '             ,SUM(X.인사조직) "인사조직" '
            +#13+ '             ,SUM(X.CR)       "CR" '
            +#13+ '             ,SUM(X.파이낸스) "파이낸스" '
            +#13+ '             ,SUM(X.기업영업) "기업영업" '
            +#13+ '             ,SUM(X.마케팅)   "마케팅" '
            +#13+ '             ,SUM(X.매스영업) "매스영업" '
            +#13+ '             ,SUM(X.사업관리) "사업관리" '
            +#13+ '             ,SUM(X.신규사업) "신규사업" '
            +#13+ '             ,SUM(X.연구개발) "연구개발" '
            +#13+ '             ,SUM(X.NW계획)   "NW계획" '
            +#13+ '             ,SUM(X.NW구축)   "NW구축" '
            +#13+ '             ,SUM(X.NW운용)   "NW운용" '
            +#13+ '             ,SUM(X.NW지원)   "NW지원" '
            +#13+ '             ,SUM(X.IT)       "IT" '
            +#13+ '             ,0 "특정" '
            +#13+ '             ,0 "소계2" '
            +#13+ '             ,0 "전문" ,0 "계약" ,0 "파견" '
            +#13+ '         FROM '
            +#13+ '             ( '
            +#13+ '              SELECT ''ZZZZZ'' DEPTCODE, ''총계'' DEPTNAME '
            +#13+ '                    ,NVL(DECODE(A.JOBKIND, ''11110'', COUNT(A.JOBKIND)), 0) "감사" '
            +#13+ '                    ,NVL(DECODE(A.JOBKIND, ''11130'', COUNT(A.JOBKIND)), 0) "경영기획" '
            +#13+ '                    ,NVL(DECODE(A.JOBKIND, ''11150'', COUNT(A.JOBKIND)), 0) "경영지원" '
            +#13+ '                    ,NVL(DECODE(A.JOBKIND, ''11170'', COUNT(A.JOBKIND)), 0) "인사조직" '
            +#13+ '                    ,NVL(DECODE(A.JOBKIND, ''11190'', COUNT(A.JOBKIND)), 0) "CR" '
            +#13+ '                    ,NVL(DECODE(A.JOBKIND, ''11210'', COUNT(A.JOBKIND)), 0) "파이낸스" '
            +#13+ '                    ,NVL(DECODE(A.JOBKIND, ''22110'', COUNT(A.JOBKIND)), 0) "기업영업" '
            +#13+ '                    ,NVL(DECODE(A.JOBKIND, ''22130'', COUNT(A.JOBKIND)), 0) "마케팅" '
            +#13+ '                    ,NVL(DECODE(A.JOBKIND, ''22150'', COUNT(A.JOBKIND)), 0) "매스영업" '
            +#13+ '                    ,NVL(DECODE(A.JOBKIND, ''22170'', COUNT(A.JOBKIND)), 0) "사업관리" '
            +#13+ '                    ,NVL(DECODE(A.JOBKIND, ''22190'', COUNT(A.JOBKIND)), 0) "신규사업" '
            +#13+ '                    ,NVL(DECODE(A.JOBKIND, ''33110'', COUNT(A.JOBKIND)), 0) "연구개발" '
            +#13+ '                    ,NVL(DECODE(A.JOBKIND, ''44110'', COUNT(A.JOBKIND)), 0) "NW계획" '
            +#13+ '                    ,NVL(DECODE(A.JOBKIND, ''44130'', COUNT(A.JOBKIND)), 0) "NW구축" '
            +#13+ '                    ,NVL(DECODE(A.JOBKIND, ''44150'', COUNT(A.JOBKIND)), 0) "NW운용" '
            +#13+ '                    ,NVL(DECODE(A.JOBKIND, ''44170'', COUNT(A.JOBKIND)), 0) "NW지원" '
            +#13+ '                    ,NVL(DECODE(A.JOBKIND, ''44190'', COUNT(A.JOBKIND)), 0) "IT" '
            +#13+ '                FROM PIMPMAS A '
            +#13+ '               WHERE A.JOBGUN IN (''44'', ''33'', ''22'', ''11'') '
            +#13+ '                 AND A.PSTATEYN = ''Y'' '
            +#13+ '               GROUP BY A.JOBKIND '
            +#13+ '             ) X '
            +#13+ '        GROUP BY X.DEPTCODE, X.DEPTNAME '
            +#13+ '       ) T '
            +#13+ ' GROUP BY T.코드 '
            +#13+ ' UNION ALL '
            +#13+ 'SELECT MAX(T.코드) "코드", MAX(T.부서명) "부서명" '
            +#13+ '      ,SUM(T.소계1) + SUM(T.소계2) + SUM(T.임원) "총계" '
            +#13+ '      ,SUM(T.임원) "임원", SUM(T.소계1) "소계1" '
            +#13+ '      ,SUM(T.감사) "감사", SUM(T.경영기획) "경영기획", SUM(T.경영지원) "경영지원" '
            +#13+ '      ,SUM(T.인사조직) "인사조직", SUM(T.CR) "CR", SUM(T.파이낸스) "파이낸스" '
            +#13+ '      ,SUM(T.기업영업) "기업영업", SUM(T.마케팅) "마케팅", SUM(T.매스영업) "매스영업" '
            +#13+ '      ,SUM(T.사업관리) "사업관리", SUM(T.신규사업) "신규사업", SUM(T.연구개발) "연구개발" '
            +#13+ '      ,SUM(T.NW계획) "NW계획", SUM(T.NW구축) "NW구축", SUM(T.NW운용) "NW운용" '
            +#13+ '      ,SUM(T.NW지원) "NW지원", SUM(T.IT) "IT", SUM(T.특정) "특정" '
            +#13+ '      ,SUM(T.소계2) "소계2",SUM(T.전문) "전문", SUM(T.계약) "계약", SUM(T.파견) "파견" '
            +#13+ '  FROM '
            +#13+ '       ( '
            +#13+ '       SELECT X.DEPTCODE "코드", X.DEPTNAME "부서명" '
            +#13+ '             ,SUM(X.임원) "임원" '
            +#13+ '             ,SUM(X.특정) "소계1" '
            +#13+ '             ,0 "감사" ,0 "경영기획" ,0 "경영지원" ,0 "인사조직" ,0 "CR" ,0 "파이낸스" '
            +#13+ '             ,0 "기업영업" ,0 "마케팅" ,0 "매스영업" ,0 "사업관리" ,0 "신규사업" '
            +#13+ '             ,0 "연구개발" ,0 "NW계획" ,0 "NW구축" ,0 "NW운용" ,0 "NW지원" ,0 "IT" '
            +#13+ '             ,SUM(X.특정) "특정" '
            +#13+ '             ,SUM(X.전문) + SUM(X.계약) + SUM(X.파견) "소계2" '
            +#13+ '             ,SUM(X.전문) "전문" ,SUM(X.계약) "계약" ,SUM(X.파견) "파견" '
            +#13+ '         FROM '
            +#13+ '             ( '
            +#13+ '              SELECT DECODE(A.JOBGUN, ''00'', B.DEPTCODE, DECODE(B.DEPTLEVEL, ''C0'', B.DEPTCODE, B.EXTCODE))  DEPTCODE '
            +#13+ '       	            ,DECODE(A.JOBGUN, ''00'', B.DEPTNAME, DECODE(B.DEPTLEVEL, ''C0'', B.DEPTNAME, B.DEPTNAME)) DEPTNAME '
            +#13+ '                    ,NVL(DECODE(A.JOBGUN, ''00'', COUNT(A.DEPTCODE)), 0) "임원" '
            +#13+ '                    ,NVL(DECODE(A.JOBGUN, ''50'', COUNT(A.DEPTCODE)), 0) "특정" '
            +#13+ '                    ,NVL(DECODE(A.JOBGUN, ''70'', COUNT(A.DEPTCODE)), 0) "전문" '
            +#13+ '                    ,NVL(DECODE(A.JOBGUN, ''90'', COUNT(A.DEPTCODE)), 0) "계약" '
            +#13+ '                    ,NVL(DECODE(A.JOBGUN, ''H1'', COUNT(A.DEPTCODE)), 0) "파견" '
            +#13+ '                FROM PIMPMAS A '
            +#13+ '                    ,PYCDEPT B '
            +#13+ '               WHERE A.ORGNUM   = B.ORGNUM '
            +#13+ '                 AND A.DEPTCODE = B.DEPTCODE '
            +#13+ '                 AND A.PSTATEYN = ''Y'' '
            +#13+ '                 AND A.JOBGUN IN (''H1'', ''90'', ''70'', ''50'', ''00'') --IN (''H1'', ''90'', ''70'', ''50'', ''00'') '
            +#13+ '               GROUP BY DECODE(A.JOBGUN, ''00'', B.DEPTCODE, DECODE(B.DEPTLEVEL, ''C0'', B.DEPTCODE, B.EXTCODE)), '
            +#13+ '       		        DECODE(A.JOBGUN, ''00'', B.DEPTNAME, DECODE(B.DEPTLEVEL, ''C0'', B.DEPTNAME, B.DEPTNAME)), A.JOBGUN '
            +#13+ '             ) X '
            +#13+ '        GROUP BY X.DEPTCODE, X.DEPTNAME '
            +#13+ '        UNION ALL '
            +#13+ '       SELECT X.DEPTCODE, X.DEPTNAME '
            +#13+ '             ,0 "임원" '
            +#13+ '             ,SUM(X.감사)     + SUM(X.경영기획) + SUM(X.경영지원) + SUM(X.인사조직) + SUM(X.CR)       + SUM(X.파이낸스) + '
            +#13+ '              SUM(X.기업영업) + SUM(X.마케팅)   + SUM(X.매스영업) + SUM(X.사업관리) + SUM(X.신규사업) + SUM(X.연구개발) + '
            +#13+ '              SUM(X.NW계획)   + SUM(X.NW구축)   + SUM(X.NW운용)   + SUM(X.NW지원)   + SUM(X.IT)       "소계1" '
            +#13+ '             ,SUM(X.감사)     "감사" '
            +#13+ '             ,SUM(X.경영기획) "경영기획" '
            +#13+ '             ,SUM(X.경영지원) "경영지원" '
            +#13+ '             ,SUM(X.인사조직) "인사조직" '
            +#13+ '             ,SUM(X.CR)       "CR" '
            +#13+ '             ,SUM(X.파이낸스) "파이낸스" '
            +#13+ '             ,SUM(X.기업영업) "기업영업" '
            +#13+ '             ,SUM(X.마케팅)   "마케팅" '
            +#13+ '             ,SUM(X.매스영업) "매스영업" '
            +#13+ '             ,SUM(X.사업관리) "사업관리" '
            +#13+ '             ,SUM(X.신규사업) "신규사업" '
            +#13+ '             ,SUM(X.연구개발) "연구개발" '
            +#13+ '             ,SUM(X.NW계획)   "NW계획" '
            +#13+ '             ,SUM(X.NW구축)   "NW구축" '
            +#13+ '             ,SUM(X.NW운용)   "NW운용" '
            +#13+ '             ,SUM(X.NW지원)   "NW지원" '
            +#13+ '             ,SUM(X.IT)       "IT" '
            +#13+ '             ,0 "특정" '
            +#13+ '             ,0 "소계2" '
            +#13+ '             ,0 "전문" ,0 "계약" ,0 "파견" '
            +#13+ '         FROM '
            +#13+ '             ( '
            +#13+ '              SELECT DECODE(B.DEPTLEVEL, ''40'', B.DEPTCODE, ''A0'', B.DEPTCODE, ''B0'', B.DEPTCODE, ''C0'', B.DEPTCODE, B.EXTCODE) DEPTCODE, '
            +#13+ '                     DECODE(B.DEPTLEVEL, ''40'', B.DEPTABBR, ''A0'', B.DEPTABBR, ''B0'', B.DEPTABBR, ''C0'', B.DEPTABBR, B.DEPTNAME) DEPTNAME '
            +#13+ '                    ,NVL(DECODE(A.JOBKIND, ''11110'', COUNT(A.JOBKIND)), 0) "감사" '
            +#13+ '                    ,NVL(DECODE(A.JOBKIND, ''11130'', COUNT(A.JOBKIND)), 0) "경영기획" '
            +#13+ '                    ,NVL(DECODE(A.JOBKIND, ''11150'', COUNT(A.JOBKIND)), 0) "경영지원" '
            +#13+ '                    ,NVL(DECODE(A.JOBKIND, ''11170'', COUNT(A.JOBKIND)), 0) "인사조직" '
            +#13+ '                    ,NVL(DECODE(A.JOBKIND, ''11190'', COUNT(A.JOBKIND)), 0) "CR" '
            +#13+ '                    ,NVL(DECODE(A.JOBKIND, ''11210'', COUNT(A.JOBKIND)), 0) "파이낸스" '
            +#13+ '                    ,NVL(DECODE(A.JOBKIND, ''22110'', COUNT(A.JOBKIND)), 0) "기업영업" '
            +#13+ '                    ,NVL(DECODE(A.JOBKIND, ''22130'', COUNT(A.JOBKIND)), 0) "마케팅" '
            +#13+ '                    ,NVL(DECODE(A.JOBKIND, ''22150'', COUNT(A.JOBKIND)), 0) "매스영업" '
            +#13+ '                    ,NVL(DECODE(A.JOBKIND, ''22170'', COUNT(A.JOBKIND)), 0) "사업관리" '
            +#13+ '                    ,NVL(DECODE(A.JOBKIND, ''22190'', COUNT(A.JOBKIND)), 0) "신규사업" '
            +#13+ '                    ,NVL(DECODE(A.JOBKIND, ''33110'', COUNT(A.JOBKIND)), 0) "연구개발" '
            +#13+ '                    ,NVL(DECODE(A.JOBKIND, ''44110'', COUNT(A.JOBKIND)), 0) "NW계획" '
            +#13+ '                    ,NVL(DECODE(A.JOBKIND, ''44130'', COUNT(A.JOBKIND)), 0) "NW구축" '
            +#13+ '                    ,NVL(DECODE(A.JOBKIND, ''44150'', COUNT(A.JOBKIND)), 0) "NW운용" '
            +#13+ '                    ,NVL(DECODE(A.JOBKIND, ''44170'', COUNT(A.JOBKIND)), 0) "NW지원" '
            +#13+ '                    ,NVL(DECODE(A.JOBKIND, ''44190'', COUNT(A.JOBKIND)), 0) "IT" '
            +#13+ '                FROM PIMPMAS A '
            +#13+ '                    ,PYCDEPT B '
            +#13+ '               WHERE A.ORGNUM   = B.ORGNUM '
            +#13+ '                 AND A.DEPTCODE = B.DEPTCODE '
            +#13+ '                 AND A.PSTATEYN = ''Y'' '
            +#13+ '                 AND A.JOBGUN IN (''44'', ''33'', ''22'', ''11'') '
            +#13+ '               GROUP BY DECODE(B.DEPTLEVEL, ''40'', B.DEPTCODE, ''A0'', B.DEPTCODE, ''B0'', B.DEPTCODE, ''C0'', B.DEPTCODE, B.EXTCODE) , '
            +#13+ '                        DECODE(B.DEPTLEVEL, ''40'', B.DEPTABBR, ''A0'', B.DEPTABBR, ''B0'', B.DEPTABBR, ''C0'', B.DEPTABBR, B.DEPTNAME), '
            +#13+ '                        A.JOBGUN, A.JOBKIND '
            +#13+ '             ) X '
            +#13+ '        GROUP BY X.DEPTCODE, X.DEPTNAME '
            +#13+ '       ) T '
            +#13+ ' GROUP BY T.코드 '
    else
    begin
       Sql.text := 'SELECT MAX(T.코드) "코드", MAX(T.부서명) "부서명" '
            +#13+ '      ,SUM(T.소계1) + SUM(T.소계2) + SUM(T.임원) "총계" '
            +#13+ '      ,SUM(T.임원) "임원", SUM(T.소계1) "소계1" '
            +#13+ '      ,SUM(T.감사) "감사", SUM(T.경영기획) "경영기획", SUM(T.경영지원) "경영지원" '
            +#13+ '      ,SUM(T.인사조직) "인사조직", SUM(T.CR) "CR", SUM(T.파이낸스) "파이낸스" '
            +#13+ '      ,SUM(T.기업영업) "기업영업", SUM(T.마케팅) "마케팅", SUM(T.매스영업) "매스영업" '
            +#13+ '      ,SUM(T.사업관리) "사업관리", SUM(T.신규사업) "신규사업", SUM(T.연구개발) "연구개발" '
            +#13+ '      ,SUM(T.NW계획) "NW계획", SUM(T.NW구축) "NW구축", SUM(T.NW운용) "NW운용" '
            +#13+ '      ,SUM(T.NW지원) "NW지원", SUM(T.IT) "IT", SUM(T.특정) "특정" '
            +#13+ '      ,SUM(T.소계2) "소계2",SUM(T.전문) "전문", SUM(T.계약) "계약", SUM(T.파견) "파견" '
            +#13+ '  FROM '
            +#13+ '       ( '
            +#13+ '       SELECT X.DEPTCODE "코드", X.DEPTNAME "부서명" '
            +#13+ '             ,SUM(X.임원) "임원" '
            +#13+ '             ,SUM(X.특정) "소계1" '
            +#13+ '             ,0 "감사" ,0 "경영기획" ,0 "경영지원" ,0 "인사조직" ,0 "CR" ,0 "파이낸스" '
            +#13+ '             ,0 "기업영업" ,0 "마케팅" ,0 "매스영업" ,0 "사업관리" ,0 "신규사업" '
            +#13+ '             ,0 "연구개발" ,0 "NW계획" ,0 "NW구축" ,0 "NW운용" ,0 "NW지원" ,0 "IT" '
            +#13+ '             ,SUM(X.특정) "특정" '
            +#13+ '             ,SUM(X.전문) + SUM(X.계약) + SUM(X.파견) "소계2" '
            +#13+ '             ,SUM(X.전문) "전문" ,SUM(X.계약) "계약" ,SUM(X.파견) "파견" '
            +#13+ '         FROM '
            +#13+ '             ( '
            +#13+ '              SELECT ''ZZZZZ'' DEPTCODE, ''총계'' DEPTNAME '
            +#13+ '       		    ,NVL(DECODE(A.JOBGUN, ''00'', COUNT(A.DEPTCODE)), 0) "임원" '
            +#13+ '              	    ,NVL(DECODE(A.JOBGUN, ''50'', COUNT(A.DEPTCODE)), 0) "특정" '
            +#13+ '                    ,NVL(DECODE(A.JOBGUN, ''70'', COUNT(A.DEPTCODE)), 0) "전문" '
            +#13+ '                    ,NVL(DECODE(A.JOBGUN, ''90'', COUNT(A.DEPTCODE)), 0) "계약" '
            +#13+ '                    ,NVL(DECODE(A.JOBGUN, ''H1'', COUNT(A.DEPTCODE)), 0) "파견" '
            +#13+ '                FROM PIMPMAS A '
            +#13+ '               WHERE A.JOBGUN IN (''H1'', ''90'', ''70'', ''50'', ''00'') '
            +#13+ '                 AND A.PSTATEYN = ''Y'' '
            +#13+ '               GROUP BY A.JOBGUN '
            +#13+ '             ) X '
            +#13+ '        GROUP BY X.DEPTCODE, X.DEPTNAME '
            +#13+ '        UNION ALL '
            +#13+ '       SELECT X.DEPTCODE, X.DEPTNAME '
            +#13+ '             ,0 "임원" '
            +#13+ '             ,SUM(X.감사)     + SUM(X.경영기획) + SUM(X.경영지원) + SUM(X.인사조직) + SUM(X.CR)       + SUM(X.파이낸스) + '
            +#13+ '              SUM(X.기업영업) + SUM(X.마케팅)   + SUM(X.매스영업) + SUM(X.사업관리) + SUM(X.신규사업) + SUM(X.연구개발) + '
            +#13+ '              SUM(X.NW계획)   + SUM(X.NW구축)   + SUM(X.NW운용)   + SUM(X.NW지원)   + SUM(X.IT)       "소계1" '
            +#13+ '             ,SUM(X.감사)     "감사" '
            +#13+ '             ,SUM(X.경영기획) "경영기획" '
            +#13+ '             ,SUM(X.경영지원) "경영지원" '
            +#13+ '             ,SUM(X.인사조직) "인사조직" '
            +#13+ '             ,SUM(X.CR)       "CR" '
            +#13+ '             ,SUM(X.파이낸스) "파이낸스" '
            +#13+ '             ,SUM(X.기업영업) "기업영업" '
            +#13+ '             ,SUM(X.마케팅)   "마케팅" '
            +#13+ '             ,SUM(X.매스영업) "매스영업" '
            +#13+ '             ,SUM(X.사업관리) "사업관리" '
            +#13+ '             ,SUM(X.신규사업) "신규사업" '
            +#13+ '             ,SUM(X.연구개발) "연구개발" '
            +#13+ '             ,SUM(X.NW계획)   "NW계획" '
            +#13+ '             ,SUM(X.NW구축)   "NW구축" '
            +#13+ '             ,SUM(X.NW운용)   "NW운용" '
            +#13+ '             ,SUM(X.NW지원)   "NW지원" '
            +#13+ '             ,SUM(X.IT)       "IT" '
            +#13+ '             ,0 "특정" '
            +#13+ '             ,0 "소계2" '
            +#13+ '             ,0 "전문" ,0 "계약" ,0 "파견" '
            +#13+ '         FROM '
            +#13+ '             ( '
            +#13+ '              SELECT ''ZZZZZ'' DEPTCODE, ''총계'' DEPTNAME '
            +#13+ '                    ,NVL(DECODE(A.JOBKIND, ''11110'', COUNT(A.JOBKIND)), 0) "감사" '
            +#13+ '                    ,NVL(DECODE(A.JOBKIND, ''11130'', COUNT(A.JOBKIND)), 0) "경영기획" '
            +#13+ '                    ,NVL(DECODE(A.JOBKIND, ''11150'', COUNT(A.JOBKIND)), 0) "경영지원" '
            +#13+ '                    ,NVL(DECODE(A.JOBKIND, ''11170'', COUNT(A.JOBKIND)), 0) "인사조직" '
            +#13+ '                    ,NVL(DECODE(A.JOBKIND, ''11190'', COUNT(A.JOBKIND)), 0) "CR" '
            +#13+ '                    ,NVL(DECODE(A.JOBKIND, ''11210'', COUNT(A.JOBKIND)), 0) "파이낸스" '
            +#13+ '                    ,NVL(DECODE(A.JOBKIND, ''22110'', COUNT(A.JOBKIND)), 0) "기업영업" '
            +#13+ '                    ,NVL(DECODE(A.JOBKIND, ''22130'', COUNT(A.JOBKIND)), 0) "마케팅" '
            +#13+ '                    ,NVL(DECODE(A.JOBKIND, ''22150'', COUNT(A.JOBKIND)), 0) "매스영업" '
            +#13+ '                    ,NVL(DECODE(A.JOBKIND, ''22170'', COUNT(A.JOBKIND)), 0) "사업관리" '
            +#13+ '                    ,NVL(DECODE(A.JOBKIND, ''22190'', COUNT(A.JOBKIND)), 0) "신규사업" '
            +#13+ '                    ,NVL(DECODE(A.JOBKIND, ''33110'', COUNT(A.JOBKIND)), 0) "연구개발" '
            +#13+ '                    ,NVL(DECODE(A.JOBKIND, ''44110'', COUNT(A.JOBKIND)), 0) "NW계획" '
            +#13+ '                    ,NVL(DECODE(A.JOBKIND, ''44130'', COUNT(A.JOBKIND)), 0) "NW구축" '
            +#13+ '                    ,NVL(DECODE(A.JOBKIND, ''44150'', COUNT(A.JOBKIND)), 0) "NW운용" '
            +#13+ '                    ,NVL(DECODE(A.JOBKIND, ''44170'', COUNT(A.JOBKIND)), 0) "NW지원" '
            +#13+ '                    ,NVL(DECODE(A.JOBKIND, ''44190'', COUNT(A.JOBKIND)), 0) "IT" '
            +#13+ '                FROM PIHPMAS A '
            +#13+ '               WHERE A.WORKYYMM = :WORKYYMM '
            +#13+ '                 AND A.JOBGUN IN (''44'', ''33'', ''22'', ''11'') '
            +#13+ '                 AND A.PSTATEYN = ''Y'' '
            +#13+ '               GROUP BY A.JOBKIND '
            +#13+ '             ) X '
            +#13+ '        GROUP BY X.DEPTCODE, X.DEPTNAME '
            +#13+ '       ) T '
            +#13+ ' GROUP BY T.코드 '
            +#13+ ' UNION ALL '
            +#13+ 'SELECT MAX(T.코드) "코드", MAX(T.부서명) "부서명" '
            +#13+ '      ,SUM(T.소계1) + SUM(T.소계2) + SUM(T.임원) "총계" '
            +#13+ '      ,SUM(T.임원) "임원", SUM(T.소계1) "소계1" '
            +#13+ '      ,SUM(T.감사) "감사", SUM(T.경영기획) "경영기획", SUM(T.경영지원) "경영지원" '
            +#13+ '      ,SUM(T.인사조직) "인사조직", SUM(T.CR) "CR", SUM(T.파이낸스) "파이낸스" '
            +#13+ '      ,SUM(T.기업영업) "기업영업", SUM(T.마케팅) "마케팅", SUM(T.매스영업) "매스영업" '
            +#13+ '      ,SUM(T.사업관리) "사업관리", SUM(T.신규사업) "신규사업", SUM(T.연구개발) "연구개발" '
            +#13+ '      ,SUM(T.NW계획) "NW계획", SUM(T.NW구축) "NW구축", SUM(T.NW운용) "NW운용" '
            +#13+ '      ,SUM(T.NW지원) "NW지원", SUM(T.IT) "IT", SUM(T.특정) "특정" '
            +#13+ '      ,SUM(T.소계2) "소계2",SUM(T.전문) "전문", SUM(T.계약) "계약", SUM(T.파견) "파견" '
            +#13+ '  FROM '
            +#13+ '       ( '
            +#13+ '       SELECT X.DEPTCODE "코드", X.DEPTNAME "부서명" '
            +#13+ '             ,SUM(X.임원) "임원" '
            +#13+ '             ,SUM(X.특정) "소계1" '
            +#13+ '             ,0 "감사" ,0 "경영기획" ,0 "경영지원" ,0 "인사조직" ,0 "CR" ,0 "파이낸스" '
            +#13+ '             ,0 "기업영업" ,0 "마케팅" ,0 "매스영업" ,0 "사업관리" ,0 "신규사업" '
            +#13+ '             ,0 "연구개발" ,0 "NW계획" ,0 "NW구축" ,0 "NW운용" ,0 "NW지원" ,0 "IT" '
            +#13+ '             ,SUM(X.특정) "특정" '
            +#13+ '             ,SUM(X.전문) + SUM(X.계약) + SUM(X.파견) "소계2" '
            +#13+ '             ,SUM(X.전문) "전문" ,SUM(X.계약) "계약" ,SUM(X.파견) "파견" '
            +#13+ '         FROM '
            +#13+ '             ( '
            +#13+ '              SELECT DECODE(A.JOBGUN, ''00'', B.DEPTCODE, DECODE(B.DEPTLEVEL, ''C0'', B.DEPTCODE, B.EXTCODE))  DEPTCODE '
            +#13+ '       	            ,DECODE(A.JOBGUN, ''00'', B.DEPTNAME, DECODE(B.DEPTLEVEL, ''C0'', B.DEPTNAME, B.DEPTNAME)) DEPTNAME '
            +#13+ '                    ,NVL(DECODE(A.JOBGUN, ''00'', COUNT(A.DEPTCODE)), 0) "임원" '
            +#13+ '                    ,NVL(DECODE(A.JOBGUN, ''50'', COUNT(A.DEPTCODE)), 0) "특정" '
            +#13+ '                    ,NVL(DECODE(A.JOBGUN, ''70'', COUNT(A.DEPTCODE)), 0) "전문" '
            +#13+ '                    ,NVL(DECODE(A.JOBGUN, ''90'', COUNT(A.DEPTCODE)), 0) "계약" '
            +#13+ '                    ,NVL(DECODE(A.JOBGUN, ''H1'', COUNT(A.DEPTCODE)), 0) "파견" '
            +#13+ '                FROM PIHPMAS A '
            +#13+ '                    ,PYCDEPT B '
            +#13+ '               WHERE A.WORKYYMM = :WORKYYMM '
            +#13+ '                 AND A.ORGNUM   = B.ORGNUM '
            +#13+ '                 AND A.DEPTCODE = B.DEPTCODE '
            +#13+ '                 AND A.PSTATEYN = ''Y'' '
            +#13+ '                 AND A.JOBGUN IN (''H1'', ''90'', ''70'', ''50'', ''00'') --IN (''H1'', ''90'', ''70'', ''50'', ''00'') '
            +#13+ '               GROUP BY DECODE(A.JOBGUN, ''00'', B.DEPTCODE, DECODE(B.DEPTLEVEL, ''C0'', B.DEPTCODE, B.EXTCODE)), '
            +#13+ '       		        DECODE(A.JOBGUN, ''00'', B.DEPTNAME, DECODE(B.DEPTLEVEL, ''C0'', B.DEPTNAME, B.DEPTNAME)), A.JOBGUN '
            +#13+ '             ) X '
            +#13+ '        GROUP BY X.DEPTCODE, X.DEPTNAME '
            +#13+ '        UNION ALL '
            +#13+ '       SELECT X.DEPTCODE, X.DEPTNAME '
            +#13+ '             ,0 "임원" '
            +#13+ '             ,SUM(X.감사)     + SUM(X.경영기획) + SUM(X.경영지원) + SUM(X.인사조직) + SUM(X.CR)       + SUM(X.파이낸스) + '
            +#13+ '              SUM(X.기업영업) + SUM(X.마케팅)   + SUM(X.매스영업) + SUM(X.사업관리) + SUM(X.신규사업) + SUM(X.연구개발) + '
            +#13+ '              SUM(X.NW계획)   + SUM(X.NW구축)   + SUM(X.NW운용)   + SUM(X.NW지원)   + SUM(X.IT)       "소계1" '
            +#13+ '             ,SUM(X.감사)     "감사" '
            +#13+ '             ,SUM(X.경영기획) "경영기획" '
            +#13+ '             ,SUM(X.경영지원) "경영지원" '
            +#13+ '             ,SUM(X.인사조직) "인사조직" '
            +#13+ '             ,SUM(X.CR)       "CR" '
            +#13+ '             ,SUM(X.파이낸스) "파이낸스" '
            +#13+ '             ,SUM(X.기업영업) "기업영업" '
            +#13+ '             ,SUM(X.마케팅)   "마케팅" '
            +#13+ '             ,SUM(X.매스영업) "매스영업" '
            +#13+ '             ,SUM(X.사업관리) "사업관리" '
            +#13+ '             ,SUM(X.신규사업) "신규사업" '
            +#13+ '             ,SUM(X.연구개발) "연구개발" '
            +#13+ '             ,SUM(X.NW계획)   "NW계획" '
            +#13+ '             ,SUM(X.NW구축)   "NW구축" '
            +#13+ '             ,SUM(X.NW운용)   "NW운용" '
            +#13+ '             ,SUM(X.NW지원)   "NW지원" '
            +#13+ '             ,SUM(X.IT)       "IT" '
            +#13+ '             ,0 "특정" '
            +#13+ '             ,0 "소계2" '
            +#13+ '             ,0 "전문" ,0 "계약" ,0 "파견" '
            +#13+ '         FROM '
            +#13+ '             ( '
            +#13+ '              SELECT DECODE(B.DEPTLEVEL, ''40'', B.DEPTCODE, ''A0'', B.DEPTCODE, ''B0'', B.DEPTCODE, ''C0'', B.DEPTCODE, B.EXTCODE) DEPTCODE, '
            +#13+ '                     DECODE(B.DEPTLEVEL, ''40'', B.DEPTABBR, ''A0'', B.DEPTABBR, ''B0'', B.DEPTABBR, ''C0'', B.DEPTABBR, B.DEPTNAME) DEPTNAME '
            +#13+ '                    ,NVL(DECODE(A.JOBKIND, ''11110'', COUNT(A.JOBKIND)), 0) "감사" '
            +#13+ '                    ,NVL(DECODE(A.JOBKIND, ''11130'', COUNT(A.JOBKIND)), 0) "경영기획" '
            +#13+ '                    ,NVL(DECODE(A.JOBKIND, ''11150'', COUNT(A.JOBKIND)), 0) "경영지원" '
            +#13+ '                    ,NVL(DECODE(A.JOBKIND, ''11170'', COUNT(A.JOBKIND)), 0) "인사조직" '
            +#13+ '                    ,NVL(DECODE(A.JOBKIND, ''11190'', COUNT(A.JOBKIND)), 0) "CR" '
            +#13+ '                    ,NVL(DECODE(A.JOBKIND, ''11210'', COUNT(A.JOBKIND)), 0) "파이낸스" '
            +#13+ '                    ,NVL(DECODE(A.JOBKIND, ''22110'', COUNT(A.JOBKIND)), 0) "기업영업" '
            +#13+ '                    ,NVL(DECODE(A.JOBKIND, ''22130'', COUNT(A.JOBKIND)), 0) "마케팅" '
            +#13+ '                    ,NVL(DECODE(A.JOBKIND, ''22150'', COUNT(A.JOBKIND)), 0) "매스영업" '
            +#13+ '                    ,NVL(DECODE(A.JOBKIND, ''22170'', COUNT(A.JOBKIND)), 0) "사업관리" '
            +#13+ '                    ,NVL(DECODE(A.JOBKIND, ''22190'', COUNT(A.JOBKIND)), 0) "신규사업" '
            +#13+ '                    ,NVL(DECODE(A.JOBKIND, ''33110'', COUNT(A.JOBKIND)), 0) "연구개발" '
            +#13+ '                    ,NVL(DECODE(A.JOBKIND, ''44110'', COUNT(A.JOBKIND)), 0) "NW계획" '
            +#13+ '                    ,NVL(DECODE(A.JOBKIND, ''44130'', COUNT(A.JOBKIND)), 0) "NW구축" '
            +#13+ '                    ,NVL(DECODE(A.JOBKIND, ''44150'', COUNT(A.JOBKIND)), 0) "NW운용" '
            +#13+ '                    ,NVL(DECODE(A.JOBKIND, ''44170'', COUNT(A.JOBKIND)), 0) "NW지원" '
            +#13+ '                    ,NVL(DECODE(A.JOBKIND, ''44190'', COUNT(A.JOBKIND)), 0) "IT" '
            +#13+ '                FROM PIHPMAS A '
            +#13+ '                    ,PYCDEPT B '
            +#13+ '               WHERE A.WORKYYMM = :WORKYYMM '
            +#13+ '                 AND A.ORGNUM   = B.ORGNUM '
            +#13+ '                 AND A.DEPTCODE = B.DEPTCODE '
            +#13+ '                 AND A.PSTATEYN = ''Y'' '
            +#13+ '                 AND A.JOBGUN IN (''44'', ''33'', ''22'', ''11'') '
            +#13+ '               GROUP BY DECODE(B.DEPTLEVEL, ''40'', B.DEPTCODE, ''A0'', B.DEPTCODE, ''B0'', B.DEPTCODE, ''C0'', B.DEPTCODE, B.EXTCODE) , '
            +#13+ '                        DECODE(B.DEPTLEVEL, ''40'', B.DEPTABBR, ''A0'', B.DEPTABBR, ''B0'', B.DEPTABBR, ''C0'', B.DEPTABBR, B.DEPTNAME), '
            +#13+ '                        A.JOBGUN, A.JOBKIND '
            +#13+ '             ) X '
            +#13+ '        GROUP BY X.DEPTCODE, X.DEPTNAME '
            +#13+ '       ) T '
            +#13+ ' GROUP BY T.코드 ' ;
            ParamByName('WORKYYMM').AsString := ME_WorkDate.Text;
    end;

    Open;
    if Eof then
    begin
      MessageDlg('출력할 데이터가 없습니다.'+#13+#10+'', mtError, [mbOK], 0);
      System.Exit;
    end;
  end;
end;

procedure TMainForm.BB_SetUpClick(Sender: TObject);
begin
  PrinterSetup.Execute;
end;


Procedure TMainForm.DataExist;
begin
   DataCount := 0;
   begin
      Query1.Close;
      Query1.SQL.Clear;
      Query1.SQL.ADD('SELECT COUNT(*) CNT FROM PIHPMAS ');
      Query1.SQL.ADD(' WHERE WORKYYMM = ''' + ME_WorkDate.Text + ''' ');
      Query1.Open;
      DataCount := Query1.FieldByName('CNT').AsInteger;
//      DataCount := Query1.RecordCount;
      if ME_WorkDate.Text = Copy(rStr, 1, 6) then
      DataCount := 9999;
      Query1.Close;
   end;
end;


end.

