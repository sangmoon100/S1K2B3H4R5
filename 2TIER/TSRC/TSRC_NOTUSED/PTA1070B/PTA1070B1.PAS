{
---------------------Program  Header -------------------------------------------
PROGRAM-NAME    : PTA1070B(사이버연수원 자료 생성)
SYSTEM-NAME     : 종합인사정보
SUBSYSTEM-NAME  : 인력개발
Programmer      : 서혜미
Version         : 30.00
Date            : 2002.04.30
Update contents
    버전     수정일        수정자   관련근거              수정내용
    1.01     2002.05.23    서혜미   인력개발팀(신동삼)    기초자료 추출 추가
    1.02     2002.05.28    서혜미   인력개발팀(손필영)    부서자료 추출 추가
    30.01    2004.05.28    정규용   전산처리요청서(박경철) INSERT 쿼리 수정 nvl(sumpoint,0) <> 0 =>  nvl(sumpoint,'0') <> '0'
                                                           추출 정상완료시만 엑셀추출 버튼 활성화 
--------------------------------------------------------------------------------
}

unit pta1070b1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, Gauges, Mask, DBTables, pass,DateLib,DB,TimeFtp;


type
  TFpta1070b1 = class(TForm)
    Panel1: TPanel;
    L_Name: TLabel;
    CurDate: TLabel;
    Panel8: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Panel9: TPanel;
    Panel3: TPanel;
    Panel6: TPanel;
    Label2: TLabel;
    Lastworkdate1: TLabel;
    Panel4: TPanel;
    Panel11: TPanel;
    Workdate: TMaskEdit;
    Panel5: TPanel;
    Gauge1: TGauge;
    Panel10: TPanel;
    Panel7: TPanel;
    BB_Run: TBitBtn;
    P_helpinfo: TPanel;
    P_Help: TLabel;
    Label3: TLabel;
    Queryv: TQuery;
    Label4: TLabel;
    Lastempno1: TLabel;
    Lastkorname1: TLabel;
    Query_Run: TQuery;
    Query_del: TQuery;
    SaveDialog1: TSaveDialog;
    Query_detail: TQuery;
    Query_main: TQuery;
    SaveDialog2: TSaveDialog;
    BBexcel: TBitBtn;
    Database1: TDatabase;
    Panel12: TPanel;
    Panel13: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Lastworkdate2: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Lastempno2: TLabel;
    Lastkorname2: TLabel;
    BBExcel2: TBitBtn;
    SaveDialog3: TSaveDialog;
    Query_Fore: TQuery;
    Query1: TQuery;
    Panel14: TPanel;
    BBExcel3: TBitBtn;
    Query_Base: TQuery;
    SaveDialog4: TSaveDialog;
    Query_BaseEMPNO: TStringField;
    Query_BaseKORNAME: TStringField;
    Query_BaseJUMINID: TStringField;
    Query_BaseZIPNO: TStringField;
    Query_BaseCURADDR: TStringField;
    Query_BaseTELNO: TStringField;
    Query_BasePAYCL: TStringField;
    Query_BasePAYRA: TStringField;
    Query_BaseLAST_SCHOL: TStringField;
    Query_BaseCOMP_TEL: TStringField;
    Query_BaseEMAIL_ADD: TStringField;
    Panel15: TPanel;
    BBExcel4: TBitBtn;
    Label11: TLabel;
    Label13: TLabel;
    Lastworkdate3: TLabel;
    Lastempno3: TLabel;
    Lastworkdate4: TLabel;
    Lastempno4: TLabel;
    Lastkorname3: TLabel;
    Lastkorname4: TLabel;
    BB_Close: TBitBtn;
    Query_Dept: TQuery;
    SaveDialog5: TSaveDialog;
    Query_BaseJOBDEPT: TStringField;
    procedure BB_CloseClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure ReadPimvari;
    procedure Excel_conversion;
    procedure BB_RunClick(Sender: TObject);
    procedure BBexcelClick(Sender: TObject);
    procedure BBExcel2Click(Sender: TObject);
    procedure BBExcel3Click(Sender: TObject);
    procedure BBExcel4Click(Sender: TObject);
  private
    { Private declarations }
    Orgnum       : string;        //현조직차수
    Lworkdate1   : string;        //최종작업일 (교육이수)
    Lempno1      : string;        //최종작업자 사번
    Lkorname1    : string;        //최종작업자 성명
    Lworkdate2   : string;        //최종작업일 (외국어)
    Lempno2      : string;        //최종작업자 사번
    Lkorname2    : string;        //최종작업자 성명
    Lworkdate3   : string;        //최종작업일 (기초자료)
    Lempno3      : string;        //최종작업자 사번
    Lkorname3    : string;        //최종작업자 성명
    Lworkdate4   : string;        //최종작업일 (부서)
    Lempno4      : string;        //최종작업자 사번
    Lkorname4    : string;        //최종작업자 성명
    up_writetime : string;
    GUBUN        : INTEGER;       //엑셀추출시 자료 구분 2002.06.26 SHM
    SysDate      : string;
    procedure Update_History;
  public
    { Public declarations }
    PaintCount : integer;
    Pempno   : string;
    Pkorname : string;
    Password : string;
    WorkOK   : Boolean;
  end;

var
  Fpta1070b1: TFpta1070b1;
  ErrorHelp   : array[0..255] of char;

implementation
{$R *.DFM}

procedure TFpta1070b1.BB_CloseClick(Sender: TObject);
begin
    Close;
end;

procedure TFpta1070b1.FormActivate(Sender: TObject);
begin
     PaintCount := 0;
     Pempno   := PassEmp(CmdLine, 1);
     Pkorname := PassEmp(CmdLine, 2);
     Password := PassEmp(cmdLine, 3);
end;

procedure TFpta1070b1.FormPaint(Sender: TObject);
//var
//SysDate:string;
begin
  Application.ProcessMessages;

  if paintcount = 0 then
  begin
    DataBase1.Params[0]  := 'SERVER NAME=' + PassEmp(cmdline, 13);
    DataBase1.Params[1]  := 'USER NAME='   + PassEmp(cmdline, 5);
    DataBase1.Params[16] := 'PASSWORD='    + PassEmp(cmdline, 6);
    Try
       Database1.Connected := True;
     EXCEPT ON E : EDataBaseError DO begin
       MessageBox(handle,StrPcopy(ErrorHelp,E.Message),'에  러',MB_OK or $0010);
       halt(0);
     end;
     END;
     L_Name.Caption    := Pkorname +  '(' + Pempno + ')';
     SysDate           := TimeDate(Query1);
     up_writetime      := sysdate;
     CurDate.Caption := Copy(SysDate,1,4)+'/'+Copy(SysDate,5,2)+'/'+Copy(SysDate,7,2);

     Workdate.Text     := Copy(SysDate, 1, 8);
     ReadPimvari;      //최종작업일자 read

     Lastworkdate1.Caption := Copy(Lworkdate1,1,4)+'/'+Copy(Lworkdate1,5,2)+'/'+Copy(Lworkdate1,7,2);
     Lastempno1.Caption    := Lempno1;
     Lastkorname1.Caption  := '['+Lkorname1+']';
     Lastworkdate2.Caption := Copy(Lworkdate2,1,4)+'/'+Copy(Lworkdate2,5,2)+'/'+Copy(Lworkdate2,7,2);
     Lastempno2.Caption    := Lempno2;
     Lastkorname2.Caption  := '['+Lkorname2+']';

     Lastworkdate3.Caption := Copy(Lworkdate3,1,4)+'/'+Copy(Lworkdate3,5,2)+'/'+Copy(Lworkdate3,7,2);
     Lastempno3.Caption    := Lempno3;
     Lastkorname3.Caption  := '['+Lkorname3+']';
     Lastworkdate4.Caption := Copy(Lworkdate4,1,4)+'/'+Copy(Lworkdate4,5,2)+'/'+Copy(Lworkdate4,7,2);
     Lastempno4.Caption    := Lempno4;
     Lastkorname4.Caption  := '['+Lkorname4+']';


     P_help.Caption        := '작업조건을 확인후 실행하십시요.';

     Workdate.Setfocus;
     PaintCount := 1;
    end;
end;

procedure TFpta1070b1.ReadPimvari;
begin
     Queryv.Close;           {현조직차수}
     Queryv.SQL.Clear;
     Queryv.SQL.ADD(' SELECT VALUE1 FROM PIMVARI ');
     Queryv.SQL.ADD(' WHERE GUBUN = ''00'' AND SGUBUN = ''0001'' ');
     Queryv.Open;
     Orgnum := Queryv.FieldByName('value1').AsString;

     Queryv.Close;           {교육이수 최종작업일자}
     Queryv.SQL.Clear;
     Queryv.SQL.ADD(' SELECT VALUE1,VALUE2,VALUE3, ');
     Queryv.SQL.ADD('        TO_CHAR(ADD_MONTHS(TO_DATE(SUBSTR(VALUE1,1,6), ''YYYYMM''), 1), ''YYYYMM'') ');
     Queryv.SQL.ADD(' FROM PIMVARI  WHERE GUBUN = ''E0'' AND SGUBUN = ''0001'' ');
     Queryv.Open;
     Lworkdate1 := Queryv.FieldByName('value1').AsString;
     Lempno1    := Queryv.FieldByName('value2').AsString;
     Lkorname1  := Queryv.FieldByName('value3').AsString;


     Queryv.Close;           {외국어 최종작업일자}
     Queryv.SQL.Clear;
     Queryv.SQL.ADD(' SELECT VALUE1,VALUE2,VALUE3 FROM PIMVARI ');
     Queryv.SQL.ADD(' WHERE GUBUN = ''E0'' AND SGUBUN = ''0002'' ');
     Queryv.Open;
     Lworkdate2 := Queryv.FieldByName('value1').AsString;
     Lempno2    := Queryv.FieldByName('value2').AsString;
     Lkorname2  := Queryv.FieldByName('value3').AsString;

     Queryv.Close;           {기초자료 최종작업일자}
     Queryv.SQL.Clear;
     Queryv.SQL.ADD(' SELECT VALUE1,VALUE2,VALUE3 FROM PIMVARI ');
     Queryv.SQL.ADD(' WHERE GUBUN = ''E0'' AND SGUBUN = ''0003'' ');
     Queryv.Open;
     Lworkdate3 := Queryv.FieldByName('value1').AsString;
     Lempno3    := Queryv.FieldByName('value2').AsString;
     Lkorname3  := Queryv.FieldByName('value3').AsString;

     Queryv.Close;           {부서 최종작업일자}
     Queryv.SQL.Clear;
     Queryv.SQL.ADD(' SELECT VALUE1,VALUE2,VALUE3 FROM PIMVARI ');
     Queryv.SQL.ADD(' WHERE GUBUN = ''E0'' AND SGUBUN = ''0004'' ');
     Queryv.Open;
     Lworkdate4 := Queryv.FieldByName('value1').AsString;
     Lempno4    := Queryv.FieldByName('value2').AsString;
     Lkorname4  := Queryv.FieldByName('value3').AsString;



     Queryv.Close;
end;


procedure TFpta1070b1.BB_RunClick(Sender: TObject);
begin
  P_help.Caption    := '교육이수 기존자료를 삭제하는 중입니다!';
  SendMessage(P_helpinfo.handle,WM_PAINT,0,0);
  Gauge1.Progress   := 5;

  Query_Del.Close;
  Query_Del.Sql.Clear;
  Query_Del.Sql.Add('DELETE FROM History_Main_EDU');
  Query_Del.ExecSQL;

  Gauge1.Progress   := 10;
  Query_Del.Close;
  Query_Del.Sql.Clear;
  Query_Del.Sql.Add('DELETE FROM History_Detail_EDU');
  Query_Del.ExecSQL;

  WorkOK := False; // 2004.05.28 정규용 추가 (작업 성공여부에 따라 엑셀추출버튼  Enable 혹은 Disable
  Database1.StartTransaction;
  Try
        P_help.Caption    := '교육부서주관교육을 추출하고 있습니다.';
        SendMessage(P_helpinfo.handle,WM_PAINT,0,0);
        Gauge1.Progress   := 20;
        //1.교육부서주관교육 pro*c 에 넣을 query: max 점수 없음
        Query_Run.Close;
        Query_Run.Sql.Clear;
        Query_Run.Sql.Add('INSERT INTO  History_Detail_EDU                                                                                 '+
                          'select a.empno em_no,a.korname,'''',                                                                         '+//a.paycl
                          ' 	   decode(a.paycl,b.paycl,decode(f.edufrdate,a.edufrdate,11,12),decode(a.edufrdate,x.edufrdate,11,12)) flag, '+
                          '       edudesc cName,a.edufrdate||'' ~ ''||a.edutodate cTerm,'''' pGrade,                                 '+//p.codename pGrade
                          '       a.eduterm||'' ''||a.eduunit uTime,a.edupoint gPoint,                                                     '+
                          '	   decode(a.paycl,b.paycl,''유효'',''무효'') isValidUp,finishyn isComplete,                                  '+
                          '	   decode(a.paycl,b.paycl,c.sum_edupoint,null) sumPoint,                                                     '+
                          '	   decode(a.paycl,b.paycl,c.sum_edupoint,null) vaildPoint,null                                               '+
                          ' from  peduhis a, pimpmas b, pyccode p,                                                                         '+
                          ' (select a.empno empno,sum(edupoint) sum_edupoint                                                               '+
                          '     from peduhis a, pimpmas b                                                                                  '+
                          '    where a.empno = b.empno                                                                                     '+
                          '	  and a.paycl = b.paycl                                                                                      '+
                          '      and substr(a.pointcode,1,1) = ''1''                                                                       '+ //필수,선택 전체학점.
                          '      and a.empno >= ''0000'' and a.empno <= ''ZZZZ''                                                           '+
                          '	  group by a.empno) c,                                                                                       '+
                          ' (select  a.empno empno,min(a.edufrdate) edufrdate                                                              '+ //현직급에서의 필수교육
                          '     from peduhis a, pimpmas b                                                                                  '+
                          '    where a.empno = b.empno                                                                                     '+
                          '	  and a.paycl = b.paycl                                                                                      '+
                          '      and a.pointcode = ''101''                                                                                 '+
                          '      and a.empno >= ''0000'' and a.empno <= ''ZZZZ''                                                           '+
                          '  	  group by a.empno) f,                                                                                       '+
                          ' (select  a.empno empno,min(a.edufrdate) edufrdate                                                              '+ //전직급에서의 필수교육
                          '     from peduhis a, pimpmas b                                                                                  '+
                          '    where a.empno = b.empno                                                                                     '+
                          '	  and a.paycl <> b.paycl                                                                                     '+
                          '      and a.pointcode = ''101''                                                                                 '+ //필수만
                          '      and a.empno >= ''0000'' and a.empno <= ''ZZZZ''                                                           '+
                          ' 	  group by a.empno) x	  	                                                                                 '+
                          'where  a.empno = b.empno                                                                                        '+
                          '  and  a.empno = c.empno(+)                                                                                     '+
                          '  and  a.empno = f.empno(+)                                                                                     '+
                          '  and  a.empno = x.empno(+)                                                                                     '+
                          '  and  b.pstateyn = ''Y''                                                                                       '+
                          '  and  a.paycl  = p.codeno and p.codeid = ''I112''                                                              '+
                          '  and  a.empno >= ''0000''  and a.empno <= ''ZZZZ''                                                             '+
                          '  and  substr(a.pointcode,1,1) = ''1''                                                                          '); //currcode에 상관없이 pointcode 가 1인거

        P_help.Caption    := '국내외 위탁교육 추출하고 있습니다.';
        SendMessage(P_helpinfo.handle,WM_PAINT,0,0);
        Gauge1.Progress   := 30;
        Query_Run.ExecSQL;

        //2.국내외위탁교육 max:국내->2점,해외->2점 finish
        Query_Run.Close;
        Query_Run.Sql.Clear;
        Query_Run.Sql.Add('INSERT INTO  History_Detail_EDU                                                                                                    '+
                          'select a.empno em_no,a.korname,'''',decode(a.pointcode,''200'',21,22) flag,edudesc cName, '+//a.paycl
                          '	   a.edufrdate||'' ~ ''||a.edutodate cTerm,'''' pGrade,                                     '+//p.codename pGrade
                          '       a.eduterm||'' ''||a.eduunit uTime,c.point gPoint,                                                                           '+
                          '	   decode(a.paycl,b.paycl,''유효'',''무효'') isValidUp, finishyn isComplete,                                                  '+
                          '       decode(a.paycl,b.paycl,decode(a.pointcode,''200'',m.sum_edupoint,                                                           '+
                          '	                                             ''300'',x.sum_edupoint,null)) sumPoint,                                          '+
                          '  	   decode(a.paycl,b.paycl,nvl(m.max_edupoint,0)+nvl(x.max_edupoint,0)) vaildPoint,                                            '+
                          '	   decode(a.paycl,b.paycl,decode(a.pointcode,''200'',m.eduterm ||'' ''||''시간'',''300'',x.eduterm ||'' ''||''일'')) sumTime  '+
                          ' from  peduhis a, pimpmas b, pedutbl c, pyccode p,                                     '+
                          ' (select a.empno empno,sum(point) sum_edupoint,sum(eduterm) eduterm,                   '+
                          '         decode(sign(sum(point) - 2),''-1'',sum(point),''2'') max_edupoint             '+
                          '    from peduhis a, pimpmas b, pedutbl c                                               '+
                          '   where a.empno = b.empno                                                             '+
                          '     and a.empno >= ''0000'' and a.empno <= ''ZZZZ''                                   '+
                          '	 and a.paycl = b.paycl                                                            '+
                          '	 and a.pointcode = c.pointcode                                                    '+
                          '	 and a.pointcode = ''200''                                                        '+
                          '	 and a.eduterm between c.frvalue and c.tovalue                                    '+
                          '	 group by a.empno) m,                                                             '+
                          ' (select a.empno empno,sum(point) sum_edupoint,sum(eduterm) eduterm,                   '+
                          '         decode(sign(sum(point) - 2),''-1'',sum(point),''2'') max_edupoint             '+
                          '    from peduhis a, pimpmas b, pedutbl c                                               '+
                          '   where a.empno = b.empno                                                             '+
                          '     and a.empno  >= ''0000'' and a.empno <= ''ZZZZ''                                  '+
                          '	 and a.paycl = b.paycl                                                            '+
                          '	 and a.pointcode = c.pointcode                                                    '+
                          '	 and a.pointcode = ''300''                                                        '+
                          '	 and a.eduterm between c.frvalue and c.tovalue                                    '+
                          '	 group by a.empno) x                                                              '+
                          'where  a.empno = b.empno                                                               '+
                          '  and  a.empno = m.empno(+)                                                            '+
                          '  and  a.empno = x.empno(+)                                                            '+
                          '  and  a.paycl = p.codeno and p.codeid = ''I112''                                      '+
                          '  and  a.empno  >= ''0000'' and a.empno <= ''ZZZZ''                                    '+
                          '  and  b.pstateyn = ''Y''                                                              '+
                          '  and  a.pointcode = c.pointcode                                                       '+
                          '  and  a.pointcode in (''200'',''300'')                                                '+
                          'and  a.eduterm between c.frvalue and c.tovalue                                         ');

        P_help.Caption    := 'cyber 교육을 추출하고 있습니다.';
        SendMessage(P_helpinfo.handle,WM_PAINT,0,0);
        Gauge1.Progress   := 40;
        Query_Run.ExecSQL;

        //3. cyber 교육 : 최대 3학점 finish
        Query_Run.Close;
        Query_Run.Sql.Clear;
        Query_Run.Sql.Add('INSERT INTO  History_Detail_EDU                                                         '+
                          'select a.empno em_no,a.korname,'''',decode(a.currcode,''801'',31) flag,edudesc cName,'+//a.paycl,
                          '       a.edufrdate||'' ~ ''||a.edutodate uTerm,'''' pGrade,                       '+//p.codename pGrade
                          '	   a.eduterm||'' ''||a.eduunit uTime,a.edupoint gPoint,                            '+
                          '	   decode(a.paycl,b.paycl,''유효'',''무효'') isValidUp,finishyn isComplete,        '+
                          '	   decode(a.paycl,b.paycl,c.sum_edupoint,null) sumPoint,                           '+
                          '	   decode(a.paycl,b.paycl,c.max_edupoint,null) validPoint,null                     '+
                          ' from  peduhis a, pimpmas b, pyccode p,                                                 '+
                          ' (select a.empno,sum(edupoint) sum_edupoint,                                            '+
                          '         decode(sign(sum(edupoint) - 3),''-1'',sum(edupoint),''3'') max_edupoint        '+
                          '     from peduhis a, pimpmas b                                                          '+
                          '    where a.empno = b.empno                                                             '+
                          '	  and a.paycl = b.paycl                                                            '+
                          '	  and b.pstateyn = ''Y''                                                           '+
                          '      and a.pointcode in (''700'',''702'')                                              '+
                          '	  and a.empno  >= ''0000'' and a.empno <= ''ZZZZ''                                 '+
                          '	  group by a.empno) c                                                              '+
                          'where  a.empno = b.empno                                                                '+
                          '  and  a.empno = c.empno(+)                                                             '+
                          '  and  a.paycl = p.codeno and p.codeid = ''I112''                                       '+
                          '  and  b.pstateyn = ''Y''                                                               '+
                          '  and  a.empno  >= ''0000'' and a.empno <= ''ZZZZ''                                     '+
                          '  and  a.pointcode in (''700'',''702'')                                                 ');

        P_help.Caption    := '기타교육을 추출하고 있습니다.';
        SendMessage(P_helpinfo.handle,WM_PAINT,0,0);
        Gauge1.Progress   := 50;
        Query_Run.ExecSQL;

        //4.기타교육(직무통신교육) 최대:2학점 finisy,독서통신교육 추가
        Query_Run.Close;
        Query_Run.Sql.Clear;
        Query_Run.Sql.Add('INSERT INTO  History_Detail_EDU                                                                 '+
                          'select a.empno em_no,a.korname,'''',decode(a.currcode,''601'',41,42) flag,edudesc cName,     '+//a.paycl
                          '       a.edufrdate||'' ~ ''||a.edutodate cTerm,'''' pGrade,                               '+//p.codename pGrade
                          '       a.eduterm||'' ''||a.eduunit uTime,a.edupoint gPoint,                                     '+
                          '	   decode(a.paycl,b.paycl,''유효'',''무효'') isValidUp,finishyn isComplete,                '+
                          '       decode(a.paycl,b.paycl,decode(a.pointcode,''400'',c.sum_edupoint,                        '+
                          '	                                             ''500'',d.sum_edupoint,null)) sumPoint,       '+
                          '  	   decode(a.paycl,b.paycl,nvl(c.max_edupoint,0)+nvl(d.max_edupoint,0)) vaildPoint,null	   '+
                          ' from  peduhis a, pimpmas b, pyccode p,                                                         '+
                          ' (select a.empno empno,sum(edupoint) sum_edupoint,                                              '+
                          '         decode(sign(sum(edupoint) - 2),''-1'',sum(edupoint),''2'') max_edupoint                '+
                          '     from peduhis a, pimpmas b                                                                  '+
                          '    where a.empno = b.empno                                                                     '+
                          '	  and a.paycl = b.paycl                                                                    '+
                          '      and a.pointcode = ''400''	                                                           '+
                          '      and a.empno  >= ''0000'' and a.empno <= ''ZZZZ''                                          '+
                          '	group by a.empno  ) c,                                                                     '+
                          ' (select a.empno empno,sum(edupoint) sum_edupoint,                                              '+
                          '         decode(sign(sum(edupoint) - 2),''-1'',sum(edupoint),''2'') max_edupoint                '+
                          '     from peduhis a, pimpmas b                                                                  '+
                          '    where a.empno = b.empno                                                                     '+
                          '	  and a.paycl = b.paycl                                                                    '+
                          '      and a.pointcode = ''500''	                                                           '+
                          '      and a.empno  >= ''0000'' and a.empno <= ''ZZZZ''                                          '+
                          '	group by a.empno  ) d	                                                                   '+
                          'where  a.empno = b.empno                                                                        '+
                          '  and  a.empno = c.empno(+)                                                                     '+
                          '  and  a.empno = d.empno(+)                                                                     '+
                          '  and  a.paycl = p.codeno and p.codeid = ''I112''                                               '+
                          '  and  b.pstateyn = ''Y''                                                                       '+
                          '  and  a.empno  >= ''0000'' and a.empno <= ''ZZZZ''                                             '+
                          '  and  a.pointcode in (''400'',''500'')                                                         ');

        P_help.Caption    := '사내강사인센티브교육을 추출하고 있습니다.';
        SendMessage(P_helpinfo.handle,WM_PAINT,0,0);
        Gauge1.Progress   := 60;
        Query_Run.ExecSQL;

        //5.사내강사인센티브:최대3학점 finisy
        Query_Run.Close;
        Query_Run.Sql.Clear;
        Query_Run.Sql.Add('INSERT INTO  History_Detail_EDU                                                   '+
                          'select a.empno em_no,a.korname,'''',decode(a.currcode,''701'',51) flag,        '+//a.paycl,
                          '       a.edudesc cName,a.edufrdate||'' ~ ''||a.edutodate cTerm,'''' pGrade,'+ //p.codename pGrade
                          '       a.eduterm||'' ''||a.eduunit uTime,c.point gPoint,                          '+
                          '	   decode(a.paycl,b.paycl,''유효'',''무효'') isValidUp,finishyn isComplete,    '+
                          '  	   decode(a.paycl,b.paycl,m.sum_edupoint,null) sumPoint,                       '+
                          '  	   decode(a.paycl,b.paycl,m.max_edupoint,null) validPoint,                     '+
                          '	   decode(a.paycl,b.paycl,m.eduterm ||'' ''|| ''시간'') sumTime                '+
                          ' from  peduhis a, pimpmas b, pedutbl c,pyccode p,                                 '+
                          '   (select x.empno empno,sum(point) sum_edupoint, x.eduterm eduterm,              '+
                          '           decode(sign(sum(point) - 3),''-1'',sum(point),''3'') max_edupoint      '+
                          '       from pimpmas b, pedutbl c,                                                 '+
                          '	      (select a.empno,sum(eduterm) eduterm, pointcode                          '+
                          '	         from peduhis a, pimpmas b where pointcode = ''600''                   '+
                          '		      and a.empno = b.empno and a.paycl = b.paycl                          '+
                          '   	     group by a.empno,pointcode) x                                         '+
                          '   where x.empno = b.empno                                                        '+
                          '     and x.empno  >= ''0000'' and x.empno <= ''ZZZZ''                             '+
                          '	 and x.pointcode = c.pointcode                                                 '+
                          '	 and x.eduterm between c.frvalue and c.tovalue                                 '+
                          '	 group by x.empno, x.eduterm) m                                                '+
                          'where  a.empno = b.empno                                                          '+
                          '  and  a.empno = m.empno(+)                                                       '+
                          '  and  a.paycl = p.codeno and p.codeid = ''I112''                                 '+
                          '  and  b.pstateyn = ''Y''                                                         '+
                          '  and  a.empno  >= ''0000'' and a.empno <= ''ZZZZ''                               '+
                          '  and  a.pointcode = c.pointcode                                                  '+
                          '  and  a.pointcode = ''600''                                                      '+
                          '  and  a.eduterm between c.frvalue and c.tovalue                                  ');

        P_help.Caption    := '특례교육을 추출하고 있습니다.';
        SendMessage(P_helpinfo.handle,WM_PAINT,0,0);
        Gauge1.Progress   := 70;
        Query_Run.ExecSQL;

        //6. 특례적용
        Query_Run.Close;
        Query_Run.Sql.Clear;
        Query_Run.Sql.Add('INSERT INTO  History_Detail_EDU                                                                '+
                          'select a.empno em_no,a.korname,'''',decode(substr(a.currcode,1,1),9,61) flag,edudesc cName, '+//a.paycl
                          '       a.edufrdate||'' ~ ''||a.edutodate uTerm,p.codename pGrade,                              '+
                          '	   a.eduterm||'' ''||a.eduunit uTime,a.edupoint gPoint,                                     '+
                          '	   decode(a.paycl,b.paycl,''유효'',''무효'') isValidUp,finishyn isComplete,                 '+
                          '	   decode(a.paycl,b.paycl,c.sum_edupoint,null) sumPoint,                                    '+
                          '	   decode(a.paycl,b.paycl,c.sum_edupoint,null) validPoint,null                              '+
                          ' from  peduhis a, pimpmas b, pyccode p,                                                        '+
                          ' (select a.empno,sum(edupoint) sum_edupoint                                                    '+
                          '     from peduhis a, pimpmas b                                                                 '+
                          '    where a.empno = b.empno                                                                    '+
                          '	  and a.paycl = b.paycl                                                                     '+
                          '	  and b.pstateyn = ''Y''                                                                    '+
                          '      and substr(a.currcode,1,1) = ''9''                                                       '+
                          '	  and a.empno  >= ''0000'' and a.empno <= ''ZZZZ''                                          '+
                          '	  group by a.empno) c                                                                       '+
                          'where  a.empno = b.empno                                                                       '+
                          '  and  a.empno = c.empno(+)                                                                    '+
                          '  and  a.paycl = p.codeno and p.codeid = ''I112''                                              '+
                          '  and  b.pstateyn = ''Y''                                                                      '+
                          'and  a.empno  >= ''0000'' and a.empno <= ''ZZZZ''                                              '+
                          'and  substr(a.currcode,1,1) = ''9''                                                            ');

        P_help.Caption    := '부서주관교육을 추출하고 있습니다.';
        SendMessage(P_helpinfo.handle,WM_PAINT,0,0);
        Gauge1.Progress   := 80;
        Query_Run.ExecSQL;

        //7.부서주관교육 추가
        //Query_Run.Close;
        Query_Run.Sql.Clear;
        Query_Run.Sql.Add('INSERT INTO  History_Detail_EDU                                                     '+
                          'select a.empno em_no,a.korname,'''',decode(a.currcode,''805'',71) flag,             '+//a.paycl
                          '       a.edudesc cName,a.edufrdate||'' ~ ''||a.edutodate cTerm, '''' pGrade,  '+//p.codename pGrade
                          '       a.eduterm||'' ''||a.eduunit uTime,c.point gPoint,                            '+
                          '	   decode(a.paycl,b.paycl,''유효'',''무효'') isValidUp,finishyn isComplete,      '+
                          '  	   decode(a.paycl,b.paycl,m.sum_edupoint,null) sumPoint,                         '+
                          '  	   decode(a.paycl,b.paycl,m.max_edupoint,null) validPoint,                       '+
                          '	   decode(a.paycl,b.paycl,m.eduterm ||'' ''|| ''시간'') sumTime                  '+
                          ' from  peduhis a, pimpmas b, pedutbl c,pyccode p,                                   '+
                          '   (select x.empno empno,sum(point) sum_edupoint, x.eduterm eduterm,                '+
                          '           decode(sign(sum(point) - 1),''-1'',sum(point),''1'') max_edupoint        '+
                          '       from pimpmas b, pedutbl c,                                                   '+
                          '	      (select a.empno,sum(eduterm) eduterm, pointcode                            '+
                          '	         from peduhis a, pimpmas b where pointcode = ''805''                     '+
                          '		      and a.empno = b.empno and a.paycl = b.paycl                            '+
                          '   	     group by a.empno,pointcode) x                                           '+
                          '   where x.empno = b.empno                                                          '+
                          '     and x.empno  >= ''0000'' and x.empno <= ''ZZZZ''                               '+
                          '	 and x.pointcode = c.pointcode                                                   '+
                          '	 and x.eduterm between c.frvalue and c.tovalue                                   '+
                          '	 group by x.empno, x.eduterm) m                                                  '+
                          'where  a.empno = b.empno                                                            '+
                          '  and  a.empno = m.empno(+)                                                         '+
                          '  and  a.paycl = p.codeno and p.codeid = ''I112''                                   '+
                          '  and  b.pstateyn = ''Y''                                                           '+
                          '  and  a.empno  >= ''0000'' and a.empno <= ''ZZZZ''                                 '+
                          '  and  a.pointcode = c.pointcode                                                    '+
                          '  and  a.pointcode = ''805''                                                        '+
                          '  and  a.eduterm between c.frvalue and c.tovalue                                    ');

        Gauge1.Progress   := 85;
        Query_Run.ExecSQL;

        //8.필수교육 미수료자
        Query_Run.Sql.Clear;
        Query_Run.Sql.Add('insert into History_Detail_EDU                                                                                               '+
                          '             (  em_no,korname,  paycl, flag,cname,cterm,pgrade,utime,gpoint,isvalidup,iscomplete,sumpoint,validpoint,sumtime)'+
                          '(select empno,korname,'''',''11'' ,'' '' ,''99999999'' ,'' '','' '','' '','' '','' '', '' '' ,'' '','' ''    from pimpmas   '+
                          'where empno in                                                                                                               '+
                          '(select distinct em_no from History_Detail_EDU                                                                               '+
                          'minus                                                                                                                        '+
                          'select distinct em_no                                                                                                        '+
                          'from History_Detail_EDU a, pimpmas b                                                                                         '+
                          'where a.em_no = b.empno                                                                                                      '+
                          'and   a.paycl = b.paycl                                                                                                      '+
                          'and   a.flag in (''11'' ,''12'' )))                                                                                          ');

        Gauge1.Progress   := 90;
        Query_Run.ExecSQL;

        //9.승격자 이후 수정사항 main 최종
        Query_Run.Sql.Clear;
        Query_Run.Sql.Add('Insert into History_Main_EDU                                                                                                    '+
                          'select distinct a.empno em_no,a.pstate isService,a.cpaycldate rpptopmDa,                                                        '+
                          '                 decode(z.finishyn,''Y'' ,''Y'' ,''N'' ) isComplete,                                                            '+
                          '	   to_number(decode(z.finishyn,''Y'' ,nvl(z.sumpoint,''0'') + nvl(y.validpoint,''0'') + nvl(x.validpoint,''0'') +            '+
                          '                   nvl(w.validpoint,''0'') + nvl(v.validpoint,''0'')+ nvl(u.validpoint,''0'')+ nvl(p.validpoint,''0''),         '+
                          '                  (nvl(z.sumpoint,''0'') + nvl(y.validpoint,''0'') + nvl(x.validpoint,''0'') +                                  '+
                          '                   nvl(w.validpoint,''0'') + nvl(v.validpoint,''0'') + nvl(u.validpoint,''0'') + nvl(p.validpoint,''0''))/2)) sPoint, '+
                          '	   z.sumpoint sValue1,y.validpoint sValue2,                                                                                  '+
                          '	   x.validpoint sValue3,w.validpoint sValue4,v.validpoint sValue5,u.validpoint sValue6,p.validpoint sValue7                  '+
                          '  from                                                                                                                          '+
                          '(select distinct a.empno em_no,replace(b.sumpoint,'' '',0) sumpoint,nvl(zz.finishyn,''N'' ) finishyn                            '+
                          'from pimpmas a, History_Detail_EDU b,                                                                                           '+
                          '	(select distinct em_no,korname,sumpoint,iscomplete finishyn                                                                  '+
                          '       from history_detail_EDU a,                                                                                               '+
                          '         (select  b.empno empno,nvl(min(a.edufrdate),''99999999'' ) edufrdate                                                   '+
                          '            from peduhis a, pimpmas b                                                                                           '+
                          '           where a.empno(+) = b.empno                                                                                           '+
                          '             and a.paycl(+) = b.paycl                                                                                           '+
                          '             and a.pointcode(+) = ''101''                                                                                       '+
                          '             and a.empno(+) >= ''0000''  and a.empno(+) <= ''ZZZZ''                                                             '+
                          '      	  group by b.empno) f                                                                                                    '+
                          '	    where a.em_no = f.empno(+)                                                                                               '+
                          '        and substr(a.CTERM,1,8) = f.edufrdate                                                                                   '+
                          '        and flag in (''11'' ,''12'' )) zz                                                                                       '+
                          'where zz.em_no(+) = a.empno		                                                                                             '+
                          '  and a.pstateyn = ''Y''                                                                                                        '+
                          '  and a.empno = b.em_no                                                                                                         '+
                          '  and b.flag in (''11'' ,''12'' ) and a.paycl = b.paycl) z,                                                                     '+
                          '     (select distinct em_no,korname,validpoint,flag                                                                             '+
                          '       from history_detail_EDU                                                                                                  '+
                          '      where nvl(sumpoint,''0'') <> ''0''                                                                                                '+
                          '        and flag in (''21'' ,''22'' )) y,                                                                                       '+
                          '     (select distinct em_no,korname,validpoint,flag                                                                             '+
                          '       from history_detail_EDU                                                                                                  '+
                          '      where nvl(sumpoint,''0'') <> ''0''                                                                                                '+
                          '        and flag = ''31''   ) x,                                                                                                '+
                          '     (select distinct em_no,korname,validpoint,flag                                                                             '+
                          '       from history_detail_EDU                                                                                                  '+
                          '      where nvl(sumpoint,''0'') <> ''0''                                                                                                '+
                          '        and flag in (''41'' ,''42'' )) w,                                                                                       '+
                          '     (select distinct em_no,korname,validpoint,flag                                                                             '+
                          '       from history_detail_EDU                                                                                                  '+
                          '      where nvl(sumpoint,''0'') <> ''0''                                                                                                '+
                          '        and flag = ''51''   ) v,                                                                                                '+
                          '     (select distinct em_no,korname,validpoint,flag                                                                             '+
                          '       from history_detail_EDU                                                                                                  '+
                          '      where nvl(sumpoint,''0'') <> ''0''                                                                                                '+
                          '        and flag = ''61''   ) u,                                                                                                '+
                          '     (select distinct em_no,korname,validpoint,flag                                                                             '+
                          '       from history_detail_EDU                                                                                                  '+
                          '      where nvl(sumpoint,''0'') <> ''0''                                                                                                '+
                          '        and flag = ''71''   ) p,                                                                                                '+
                          '     (select a.empno,b.codename pstate,a.cpaycldate cpaycldate from pimpmas a, pyccode b                                        '+
                          '       where a.pstate = b.codeno and b.codeid = ''I114''                                                                        '+
                          '         and a.pstateyn = ''Y'' ) a                                                                                             '+
                          'where z.em_no(+) = a.empno                                                                                                      '+
                          '  and z.em_no = y.em_no(+)                                                                                                      '+
                          '  and z.em_no = x.em_no(+)                                                                                                      '+
                          '  and z.em_no = w.em_no(+)                                                                                                      '+
                          '  and z.em_no = v.em_no(+)                                                                                                      '+
                          '  and z.em_no = u.em_no(+)                                                                                                      '+
                          '  and z.em_no = p.em_no(+)                                                                                                      ');

        Gauge1.Progress   := 100;
        Query_Run.ExecSQL;

      EXCEPT ON E : EDataBaseError DO
      Begin
        Database1.Rollback;
        WorkOK := False;
        MessageDlg('데이터 추출에 실패했습니다.'+#13+#10+''+#13+#10+'시스템 관리자에게 문의하세요~~', mtError, [mbOK], 0);
        System.exit;
      End;
  End; //Try
  Database1.commit;
  WorkOK := True;

  P_help.Caption    := '추출이 완료되었습니다!';

  if WorkOK then
  begin
   BBexcel.Enabled  := True;
  end;

  SendMessage(P_helpinfo.handle,WM_PAINT,0,0);

  Gauge1.Progress   := 0;
end;

procedure TFpta1070b1.BBexcelClick(Sender: TObject);
begin
   Excel_conversion;
   GUBUN := 1;
   Update_History; //log 남기기 위해 2002.06.26 shm 추가
end;

procedure TFpta1070b1.Update_History;
var
  Temp_no    : Integer;
begin
     Query1.Close;
     Query1.Sql.Clear;
     Query1.Sql.Add(' SELECT  NVL(MAX(NO),0) NO  FROM PYMPHIS     ');
     Query1.Sql.Add('  WHERE  PROGID = ''PTA1070B''               ');
     Query1.Open;
     Temp_No    := Query1.FieldByName('NO').AsInteger + 1;
     Query1.Close;

     if  gubun = 1 then
     begin
         Query1.Sql.Clear;
         Query1.Sql.Add('INSERT INTO PYMPHIS                                                  ');
         Query1.Sql.Add('   (    NO, EMPNO, KORNAME, PROGID, EXTDATE, EXTCONTENTS          )  ');
         Query1.Sql.Add('VALUES                                                               ');
         Query1.Sql.Add('   (                                                                 ');
         Query1.Sql.Add(format('       ''%d'',',[Temp_NO]        )                             );
         Query1.Sql.Add('       '''+PEMPNO+''','''+PKORNAME+''',''PTA1070B'',                 ');
         Query1.Sql.Add('       '''+sysdate+''',                                              ');
         Query1.Sql.Add('       ''(사이버연수원)교육이수학점 현황을 EXCEL 화일로 출력한다.'')                    ');
         Query1.ExecSQL;
         Query1.Close;
     end else
     if  gubun = 2 then
     begin
         Query1.Sql.Clear;
         Query1.Sql.Add('INSERT INTO PYMPHIS                                                  ');
         Query1.Sql.Add('   (    NO, EMPNO, KORNAME, PROGID, EXTDATE, EXTCONTENTS          )  ');
         Query1.Sql.Add('VALUES                                                               ');
         Query1.Sql.Add('   (                                                                 ');
         Query1.Sql.Add(format('       ''%d'',',[Temp_NO]        )                             );
         Query1.Sql.Add('       '''+PEMPNO+''','''+PKORNAME+''',''PTA1070B'',                 ');
         Query1.Sql.Add('       '''+sysdate+''',                                              ');
         Query1.Sql.Add('       ''(사이버연수원)외국어학점 현황을 EXCEL 화일로 출력한다.'')                    ');
         Query1.ExecSQL;
         Query1.Close;
     end else
     if  gubun = 3 then
     begin
         Query1.Sql.Clear;
         Query1.Sql.Add('INSERT INTO PYMPHIS                                                  ');
         Query1.Sql.Add('   (    NO, EMPNO, KORNAME, PROGID, EXTDATE, EXTCONTENTS          )  ');
         Query1.Sql.Add('VALUES                                                               ');
         Query1.Sql.Add('   (                                                                 ');
         Query1.Sql.Add(format('       ''%d'',',[Temp_NO]        )                             );
         Query1.Sql.Add('       '''+PEMPNO+''','''+PKORNAME+''',''PTA1070B'',                 ');
         Query1.Sql.Add('       '''+sysdate+''',                                              ');
         Query1.Sql.Add('       ''(사이버연수원)기초자료 현황을 EXCEL 화일로 출력한다.'')                    ');
         Query1.ExecSQL;
         Query1.Close;
     end else
     if  gubun = 4 then
     begin
         Query1.Sql.Clear;
         Query1.Sql.Add('INSERT INTO PYMPHIS                                                  ');
         Query1.Sql.Add('   (    NO, EMPNO, KORNAME, PROGID, EXTDATE, EXTCONTENTS          )  ');
         Query1.Sql.Add('VALUES                                                               ');
         Query1.Sql.Add('   (                                                                 ');
         Query1.Sql.Add(format('       ''%d'',',[Temp_NO]        )                             );
         Query1.Sql.Add('       '''+PEMPNO+''','''+PKORNAME+''',''PTA1070B'',                 ');
         Query1.Sql.Add('       '''+sysdate+''',                                              ');
         Query1.Sql.Add('       ''(사이버연수원)부서 현황을 EXCEL 화일로 출력한다.'')                    ');
         Query1.ExecSQL;
         Query1.Close;
     end;
end;


procedure TFpta1070b1.Excel_conversion;
var
  Fexcel : textfile;
  S : String;
  i : integer;
  totcnt : integer;
begin
  P_help.Caption    := '교육이수 자료를 Excel로 변환하고 있습니다!';
  SendMessage(P_helpinfo.handle,WM_PAINT,0,0);
//  Gauge1.Progress   := 5;

  Query_detail.Close;
  Query_detail.Open;

  if SaveDialog1.Execute then
  begin
      with TStringList.Create do
      try
//        Add(pchar('em_no,korname,paycl,flag,cName,cTerm,pGrade,uTime,gPoint,isValidUp,isComplete,sumPoint,validPoint,sumTime,'));
        Add(pchar('em_no'+#9+'korname'+#9+'flag'+#9+'cName'+#9+'cTerm'+#9+'pGrade'+#9+'uTime'+#9+'gPoint'+#9+'isValidUp'+#9+'isComplete'+#9+'sumPoint'+#9+'validPoint'+#9+'sumTime'));
                                      //+#9+'paycl'
//        showmessage(inttostr(Query_Detail.Recordcount));
        totcnt :=  Query_Detail.Recordcount;

        Query_detail.First;
        for i := 1 to Query_Detail.Recordcount do
        begin
          Add(Format('%s'+#9+'%s'+#9+'%s'+#9+'%s'+#9+'%s'+#9+'%s'+#9+'%s'+#9+'%s'+#9+'%s'+#9+'%s'+#9+'%s'+#9+'%s'+#9+'%s',
                                //+#9+'%s'
                [ Query_Detail.Fields[0].AsString,
                  Query_Detail.Fields[1].AsString,
                 // Query_Detail.Fields[2].AsString,
                  Query_Detail.Fields[3].AsString,
                  Query_Detail.Fields[4].AsString,
                  Query_Detail.Fields[5].AsString,
                  Query_Detail.Fields[6].AsString,
                  Query_Detail.Fields[7].AsString,
                  Query_Detail.Fields[8].AsString,
                  Query_Detail.Fields[9].AsString,
                  Query_Detail.Fields[10].AsString,
                  Query_Detail.Fields[11].AsString,
                  Query_Detail.Fields[12].AsString,
                  Query_Detail.Fields[13].AsString]));

     //             Gauge1.Progress   :=  (i*14000) div totcnt;
                  Gauge1.Progress   :=  i;
          Query_Detail.Next;
        end; // end of for
        SaveToFile(SaveDialog1.FileName);
      finally
      Free;
      end; // end of try
  end; //end of SaveDialog1.Execute

  Gauge1.Progress   :=  0;
  Query_Main.Close;
  Query_Main.Open;
  if SaveDialog2.Execute then
  begin
      with TStringList.Create do
      try
        Add(pchar('em_no'+#9+'isService'+#9+'romotionDa'+#9+'isComplete'+#9+'sPoint'+#9+'sValue1'+#9+'sValue2'+#9+'sValue3'+#9+'sValue4'+#9+'sValue5'+#9+'sValue6'+#9+'sValue7'));

        Query_main.First;
        for i := 1 to Query_Main.Recordcount do
        begin
          Add(Format('%s'+#9+'%s'+#9+'%s'+#9+'%s'+#9+'%s'+#9+'%s'+#9+'%s'+#9+'%s'+#9+'%s'+#9+'%s'+#9+'%s'+#9+'%s',
                [ Query_main.Fields[0].AsString,
                  Query_main.Fields[1].AsString,
                  Query_main.Fields[2].AsString,
                  Query_main.Fields[3].AsString,
                  Query_main.Fields[4].AsString,
                  Query_main.Fields[5].AsString,
                  Query_main.Fields[6].AsString,
                  Query_main.Fields[7].AsString,
                  Query_main.Fields[8].AsString,
                  Query_main.Fields[9].AsString,
                  Query_main.Fields[10].AsString,
                  Query_main.Fields[11].AsString ]));
                  Gauge1.Progress   :=  i;
          Query_Main.Next;
        end; // end of for
        SaveToFile(SaveDialog2.FileName);
      finally
      Free;
      end; // end of try
  end; //end of SaveDialog1.Execute

  P_help.Caption    := '교육이수 Excel 변환이 완료되었습니다!';
  SendMessage(P_helpinfo.handle,WM_PAINT,0,0);
  Gauge1.Progress   := 0;
  Queryv.Close;           {교육이수최종작업일자}
  Queryv.SQL.Clear;
  Queryv.SQL.ADD(' UPDATE PIMVARI SET ');
  Queryv.SQL.ADD('        VALUE1 = '''+Workdate.Text+''',writetime = '''+up_writetime+''',writeemp = '''+pempno+''', ');
  Queryv.SQL.ADD('        VALUE2 = '''+PEMPNO+''', VALUE3 = '''+PKORNAME+''' ');
  Queryv.SQL.ADD(' WHERE GUBUN = ''E0'' AND SGUBUN = ''0001''                ');
  Queryv.ExecSQL;
end;


procedure TFpta1070b1.BBExcel2Click(Sender: TObject);
var
  F : textfile;
  i: Integer;
  app, WorkBooks :Variant;
begin
P_help.Caption    := '외국어 기존자료를 삭제하는 중입니다!';
SendMessage(P_helpinfo.handle,WM_PAINT,0,0);
Gauge1.Progress   := 10;

Query_Del.Close;
Query_Del.Sql.Clear;
Query_Del.Sql.Add('DELETE FROM History_Language_EDU');

Query_Del.ExecSQL;

i := 0;
P_help.Caption    := '외국어 자료를 Excel로 변환하고 있습니다!';
SendMessage(P_helpinfo.handle,WM_PAINT,0,0);

  if saveDialog3.Execute then
  begin
   TRY
     assignfile(F, SaveDialog3.FileName);
     rewrite(F);
     writeln(F, 'em_no'+#9+'korname'+#9+'lang_name'+#9+'apply_date'+#9+'pgrade'+#9+'lc_point'+#9+'rc_point'+#9+'total_point'+#9+'abroad_edu_valid'+#9+'promotion_valid'+#9+'grade'+#9+'total_result'  );
     Query_Fore.Close;
     Query_Fore.Open;
     Query_Fore.First;

     while (not Query_Fore.eof) do
      begin
         i := i + 1;
         writeln(F,Query_Fore.FieldByName('em_no').AsString              + #9 +
                   Query_Fore.FieldByName('korname').AsString            + #9 +
                   Query_Fore.FieldByName('lang_name').AsString          + #9 +
                   Query_Fore.FieldByName('apply_date').AsString         + #9 +
                   Query_Fore.FieldByName('pgrade').AsString             + #9 +
                   Query_Fore.FieldByName('lc_point').AsString           + #9 +
                   Query_Fore.FieldByName('rc_point').AsString           + #9 +
                   Query_Fore.FieldByName('total_point').AsString        + #9 +
                   Query_Fore.FieldByName('abroad_edu_valid').AsString   + #9 +
                   Query_Fore.FieldByName('promotion_valid').AsString    + #9 +
                   Query_Fore.FieldByName('grade').AsString              + #9 +
                   Query_Fore.FieldByName('total_result').AsString);
                   Gauge1.Progress   :=  i;
         Query_Fore.Next;
      end;
     writeln(F,'');
     FINALLY
       closefile(F);
     END;
  end;

  Queryv.Close;           {외국어최종작업자 update}
  Queryv.SQL.Clear;
  Queryv.SQL.ADD(' UPDATE PIMVARI SET ');
  Queryv.SQL.ADD('        VALUE1 = '''+Workdate.Text+''',writetime = '''+up_writetime+''',writeemp = '''+pempno+''', ');
  Queryv.SQL.ADD('        VALUE2 = '''+PEMPNO+''', VALUE3 = '''+PKORNAME+''' ');
  Queryv.SQL.ADD(' WHERE GUBUN = ''E0'' AND SGUBUN = ''0002''                ');
  Queryv.ExecSQL;

  GUBUN := 2;
  Update_History; //log 남기기 위해 2002.06.26 shm 추가

  P_help.Caption    := '외국어 Excel 변환이 완료되었습니다!';
  Gauge1.Progress   := 0;

end;

procedure TFpta1070b1.BBExcel3Click(Sender: TObject);
var
  F : textfile;
  i: Integer;
  app, WorkBooks :Variant;
begin
i := 0;
P_help.Caption    := '개인기초 자료를 Excel로 변환하고 있습니다!';
SendMessage(P_helpinfo.handle,WM_PAINT,0,0);

  if saveDialog4.Execute then
  begin
   TRY
     assignfile(F, SaveDialog4.FileName);
     rewrite(F);
     writeln(F, 'empno'+#9+'korname'+#9+'juminid'+#9+'zipno'+#9+
                'curaddr'+#9+'telno'+#9+'comp_tel'+#9+'email_add'+#9+
                'deptcode'+#9+'payra'+#9+'last_schol'  );//'paycl'+#9+
     Query_Base.Close;
     Query_Base.Open;
     Query_Base.First;

     while (not Query_Base.eof) do
      begin
         i := i + 1;
         writeln(F,Query_Base.FieldByName('empno').AsString           + #9 +
                   Query_Base.FieldByName('korname').AsString         + #9 +
                   Query_Base.FieldByName('juminid').AsString         + #9 +
                   Query_Base.FieldByName('zipno').AsString           + #9 +
                   Query_Base.FieldByName('curaddr').AsString         + #9 +
                   Query_Base.FieldByName('telno').AsString           + #9 +
                   Query_Base.FieldByName('comp_tel').AsString        + #9 +
                   Query_Base.FieldByName('email_add').AsString       + #9 +
                   Query_Base.FieldByName('jobdept').AsString        + #9 +
//직급=>BAND전환(비공개)
//                   Query_Base.FieldByName('paycl').AsString           + #9 +
                   Query_Base.FieldByName('payra').AsString           + #9 +
                   Query_Base.FieldByName('last_schol').AsString);
                   Gauge1.Progress   :=  i;
         Query_Base.Next;
      end;
     writeln(F,'');
     FINALLY
       closefile(F);
     END;
  end;

  Queryv.Close;           {기초자료최종작업자 update}
  Queryv.SQL.Clear;
  Queryv.SQL.ADD(' UPDATE PIMVARI SET ');
  Queryv.SQL.ADD('        VALUE1 = '''+Workdate.Text+''',writetime = '''+up_writetime+''',writeemp = '''+pempno+''', ');
  Queryv.SQL.ADD('        VALUE2 = '''+PEMPNO+''', VALUE3 = '''+PKORNAME+''' ');
  Queryv.SQL.ADD(' WHERE GUBUN = ''E0'' AND SGUBUN = ''0003''                ');
  Queryv.ExecSQL;

  GUBUN := 3;
  Update_History; //log 남기기 위해 2002.06.26 shm 추가

  P_help.Caption    := '기초자료 Excel 변환이 완료되었습니다!';
  Gauge1.Progress   := 0;

end;


procedure TFpta1070b1.BBExcel4Click(Sender: TObject);
var
  F : textfile;
  i: Integer;
  app, WorkBooks :Variant;
begin
i := 0;
P_help.Caption    := '부서코드 자료를 Excel로 변환하고 있습니다!';
SendMessage(P_helpinfo.handle,WM_PAINT,0,0);

  if saveDialog5.Execute then
  begin
   TRY
     assignfile(F, SaveDialog5.FileName);
     rewrite(F);
     writeln(F, 'deptcode'+#9+'deptname'  );
     Query_Dept.Close;
     Query_Dept.ParamByName('P_orgnum').AsString    := Orgnum;
     Query_Dept.Open;
     Query_Dept.First;

     while (not Query_Dept.eof) do
      begin
         i := i + 1;
         writeln(F,Query_Dept.FieldByName('deptcode').AsString           + #9 +
                   Query_Dept.FieldByName('deptname').AsString);
                   Gauge1.Progress   :=  i;
         Query_Dept.Next;
      end;
     writeln(F,'');
     FINALLY
       closefile(F);
     END;
  end;

  Queryv.Close;           {부서자료최종작업자 update}
  Queryv.SQL.Clear;
  Queryv.SQL.ADD(' UPDATE PIMVARI SET ');
  Queryv.SQL.ADD('        VALUE1 = '''+Workdate.Text+''',writetime = '''+up_writetime+''',writeemp = '''+pempno+''', ');
  Queryv.SQL.ADD('        VALUE2 = '''+PEMPNO+''', VALUE3 = '''+PKORNAME+''' ');
  Queryv.SQL.ADD(' WHERE GUBUN = ''E0'' AND SGUBUN = ''0004''                ');
  Queryv.ExecSQL;

  GUBUN := 4;
  Update_History; //log 남기기 위해 2002.06.26 shm 추가

  P_help.Caption    := '부서코드 Excel 변환이 완료되었습니다!';
  Gauge1.Progress   := 0;

end;

end.
