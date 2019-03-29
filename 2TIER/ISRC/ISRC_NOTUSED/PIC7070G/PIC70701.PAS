{ header
 -----------------------------------------------------------------------
  PROGRAM-NAME    : PIC7070G(조직개편 인사발령안 등록)
  SYSTEM-NAME     : 종합인사
  SUBSYSTEM-NAME  : 인사
  Programmer      : 박규석
  Version         : 30.00
  Date            : 1998.12.29
  Update Contents
   버전    수정일     수정자       수정내용        관련근거
   1.00   1997.10.15  김혜진    신규프로그램 개발  처리명세서
  30.00   1998.12.29  박규석    직위,직급수정      하나로인사재개발
  30.01   1999.12.31  윤형식         Y2k           인사발령 6자리 --> 8자리 크기변경
  30.02   2000.10.17  강기우   전체적인 Logic변경  하병수 대리요청.
 ----------------------------------------------------------------------}

{ *********    1. 조직개편시(차수변경없이 일부 조직만 변경)   ************
  1. 선택한 차수변경일에대한 사원을 추출.
  2. 특정부서만 배치후 부서이동.
     a) 특정 인물 배치는  실제전보.     ------| '배치'버튼누를시.
     b) 나머지 같은 부서이원은 조직전보.------|
  3. 배치하지 않은 부서는 인사발령안 등록시 발령을 내지 않는다.

  *********    2. 차수변경시              ********************************
  1. 선택한 차수변경일에대한 사원을 추출.
  2. 특정인을 부서지정시에 실제전보발령.
     a) 나머지 부서인원  차수변경                 --------|
     b) 안부른 다른부서  차수변경                 --------| '배치'버튼시
     c) 전차수의 전부서가 존재시는 부서는 조직전보   -----|
  11 -- 실제 전보.
  12 -- 조직 전보.

  * andepcode----> 세부구분
}

unit pic70701;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Gauges, Mask, ExtCtrls, DBTables, Db,pass,timeftp,datelib,
  codelib, ComObj, kpaylib;

type
  Tpic7070gForm = class(TForm)
    Panel1: TPanel;
    L_userName: TLabel;
    L_CurDate: TLabel;
    Panel7: TPanel;
    Panel2: TPanel;
    Label7: TLabel;
    Panel8: TPanel;
    Panel3: TPanel;
    E_annono: TMaskEdit;
    Panel9: TPanel;
    Panel11: TPanel;
    Panel6: TPanel;
    E_anfrdate: TMaskEdit;
    Panel5: TPanel;
    Gr: TGauge;
    Panel10: TPanel;
    Panel4: TPanel;
    BB_Close: TBitBtn;
    BB_Run: TBitBtn;
    Helppanel: TPanel;
    P_Help: TLabel;
    Label1: TLabel;
    Qvari: TQuery;
    Database1: TDatabase;
    Qan: TQuery;
    Qrais: TQuery;
    Qmas: TQuery;
    Panel13: TPanel;
    Panel14: TPanel;
    regist: TLabel;
    Label3: TLabel;
    error: TLabel;
    Label5: TLabel;
    Panel12: TPanel;
    read: TLabel;
    Label4: TLabel;
    Qdept: TQuery;
    Qremd: TQuery;
    Panel15: TPanel;
    payclfr: TMaskEdit;
    payclto: TMaskEdit;
    Label2: TLabel;
    excel: TBitBtn;
    SaveDialog1: TSaveDialog;
    Qry_pihan: TQuery;
    Label6: TLabel;
    Qry_imsi: TQuery;
    procedure FormActivate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BB_RunClick(Sender: TObject);
    procedure BB_CloseClick(Sender: TObject);
    procedure payclfrDblClick(Sender: TObject);
    procedure paycltoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure E_annonoChange(Sender: TObject);
    procedure an_gubun1Click(Sender: TObject);
    procedure excelClick(Sender: TObject);

  private
    { Private declarations }
     start : boolean;
     cnt : integer;
     err_cnt : integer;
     reg_cnt : integer;
     read_cnt : integer;
     err : system.text;
     procedure clear;
     procedure delete_pihanno;
     procedure insert_pihanno;
     procedure update_pihanba;
     procedure reg_work;
     procedure org_bal;
     procedure update_trgubun;
     procedure update_annoyn;
     function read_pycdept2(s1,s2 : string):Boolean;
     procedure read_pycdept1(s1,s2 : string);
     procedure E_Write(str : string);
     function  QDeptDisp(s1,s2 : String) : String;
  public
    { Public declarations }
     p_empno : string;
     pkorname : string;
     password : string;
     Homedir  : string;
     organdate : string;
     lastno : string;
     andate : string;
     time : string;
     gubun : integer;
     tmp_annono : string;
     tmp_anfrdate : string;
     Error_help : array [0..255] of char;
     function annono_check(s1 : string):string;
  end;

var
  pic7070gForm: Tpic7070gForm;
  annono, anseqno, anfrdate, ancode, andetcode,empno, korname, orgnum, deptcode : string;
  payra, paycl, trgubun ,dpdeptname,bdeptname,gu_paycl: string;
  borgnum, bdeptcode, bpaycl, bpayra, bextcode,bboncode,r_deptcode,anupdyn : string;
  textcode,tboncode : string;
  app : Variant;
implementation

{$R *.DFM}


procedure Tpic7070gForm.FormActivate(Sender: TObject);
begin
  HomeDir  := HomeDirOpen;
  p_empno  := PassEmp(cmdline,1);
  pkorname := PassEmp(cmdline,2);
  password := PassEmp(cmdline,3);

  reg_cnt := 0;
  err_cnt := 0;

  E_annono.SetFocus;
  P_Help.Caption := '조직개편기준일을 읽어오고 있습니다 !!.';
  SendMessage(HelpPanel.handle,WM_PAINT,0,0);
end;

procedure Tpic7070gForm.FormPaint(Sender: TObject);
var
  CurDate, Currandate : String;
begin
 if start = True then begin
     start  := False;
     DataBase1.Params[0]  := 'SERVER NAME='+PassEmp(cmdline,13);
     DataBase1.Params[1]  := 'USER NAME='+PassEmp(cmdline,5);
     DataBase1.Params[19] := 'PASSWORD=' +PassEmp(cmdline,6);
     Application.Processmessages;
     Try
        Database1.Connected := True;
     EXCEPT ON E : EDataBaseError DO begin
         MessageBox(handle,Pchar(E.Message),'에  러',MB_OK or $0010);
         halt(0);
       end;
     END;

     CurDate  := TimeDate(Qmas);
     L_CurDate.Caption  := copy(CurDate,1,4)+'/'+
                           copy(CurDate,5,2)+'/'+
                           copy(CurDate,7,2);

     time := copy(Curdate,1,15);

//     if PassDialog(self,p_empno,pkorname,password) = False then halt(0);
     L_UserName.Caption := pkorname+'('+p_empno+')';

     with Qvari do
     begin
        close;
        sql.clear;                                // 현재차수조
        sql.add('select value1 from pimvari where  gubun = ''00'' and sgubun= ''0001''  ');
        Open;
        Currandate := FieldByName('value1').AsString; // 조직개편일자= organdate

        close;
        sql.clear;                                // 조직개편기준일을 읽어온다.
        sql.add('select value1 from pimvari where  gubun = ''C7'' and sgubun= ''0001''  ');
        Open;
        if trim(FieldByName('value1').AsString) = '' then
           MessageBox(0,'조직개편기준일이 존재하지 않습니다 !!.','확 인',MB_OK or $0030)
        else begin
           organdate := FieldByName('value1').AsString; // 조직개편일자= organdate
           E_anfrdate.Text := Copy(andate,1,4) + Copy(andate,5,2) + Copy(andate,7,2);
        end;
        close;
     end;
     P_Help.Caption := '';
  end;
  if Currandate = organdate then
    gubun := 1  //조직변동.
  else
    gubun := 2; //차수변경
end;

procedure Tpic7070gForm.FormCreate(Sender: TObject);
begin
     start := True;
end;

procedure Tpic7070gForm.clear;
begin
          annono := '';   anseqno := ''; anfrdate := ''; ancode := ''; empno := '';
          korname := '';  orgnum := ''; deptcode := ''; payra := ''; paycl := '';
          bextcode := '';   bboncode := ''; trgubun := ''; gu_paycl := '';
          borgnum := ''; bdeptcode := ''; bpaycl := ''; bpayra := ''; anupdyn := '';
          r_deptcode := '';   dpdeptname := '';    bdeptname := '';
end;

procedure Tpic7070gForm.BB_RunClick(Sender: TObject);
begin
     //발령번호가 존재하는지 확인..
     if annono_check(E_annono.text) <> 'OK' then
     begin
            showmessage('발령번호가 존재하지 않습니다.');
            system.exit;
     end;
     if E_anfrdate.text = '' then begin
         P_Help.Caption := '발령일자는 필수입력사항입니다!!.';
         system.exit;
     end;
     if (E_anfrdate.text <> tmp_anfrdate) or (E_annono.text <> tmp_annono) then
     begin
         read_cnt := 0;       reg_cnt := 0;
     end;
     P_Help.Caption := '인사발령화일의 전보발령 기존재자료를 삭제중입니다!!.';
     delete_pihanno;  // 인사발령화일의 전보발령 기존재자료를 삭제한다.
     P_Help.Caption := '인사발령화일에 조직개편발령을 등록중입니다. ';

     System.AssignFile(err,HomeDir+'\list\pic7070g.err');
     System.Rewrite(err);

     System.Writeln(err,' ******* 조직개편 인사발령안등록 에러 리스트 ******');
     System.Writeln(err,'');  System.Writeln(err,'');
     P_Help.Caption := '인사발령화일에 발령사항을 등록중입니다!!.';
     SendMessage(helppanel.handle,WM_PAINT,0,0);

     if gubun = 1 then    //조직변동
        reg_work                // 등록작업
     else
     if gubun = 2 then  
     begin
        clear;
        org_bal;        // 차수변경발령등록. (발령후부서,차수,직급,직위,호봉,발령전 사항.
     end;

     System.Writeln(err,'');
     System.Writeln(err,'  읽은건수 : '+inttostr(read_cnt)+
                        '  등록건수 : '+inttostr(reg_cnt)+
                        '  오류건수 : '+inttostr(Err_cnt));
     system.Close(err);
     P_Help.Caption := '';

     update_pihanba;   // 인사발령근거화일수정

     gr.Progress    := 0;
     read.caption := inttostr(read_cnt);
     regist.caption := inttostr(reg_cnt);
     error.caption := inttostr(err_cnt);

     P_Help.Caption := '작업이 완료되었습니다 !!. (에러화일 : '+HomeDir+'\list\pic7070g.err)';
end;

procedure Tpic7070gForm.org_bal;
var
  cnt :integer;
  deptname, dpdeptname : string;
begin
  with Qrais do
  begin
    close;
    sql.clear;
    sql.add(Format('SELECT empno,dporgnum,dpdeptcode,dppayra,trgubun '+
                   ' From pitremd '+
                   ' WHERE (remddate = ''%s'') and (annoyn = ''Y'') '+
                   '  AND RTrim(dpdeptcode,'' '' ) is not null '+
                   '  AND orgnum != dporgnum '+
                   ' ORDER BY empno ',[organdate]));
    open;
    if Qrais.Recordcount < 0 then
    begin
        P_Help.caption := ' 조직개편화일에 자료가 존재하지 않습니다!!.';
        system.exit;
    end;
    cnt := 0;
    First;
    While not Eof do
    begin
       clear;
       if Qrais.RecordCount <> cnt then
           Gr.Progress := (cnt * 100) div RecordCount else Gr.Progress := 100;

       SendMessage(panel3.handle,WM_PAINT,0,0);
       annono    := E_annono.text;                        // 발령번호
       anfrdate  := E_anfrdate.text;                      // 발령일FROM
       andetcode := FieldByName('trgubun').asstring;      // 세부구분.
       empno     := FieldByName('empno').asstring;        // 사  번
       orgnum    := FieldByName('dporgnum').asstring;     // 발령후 차수
       deptcode  := FieldByName('dpdeptcode').asstring;   // 발령후 부서
       Payra     := Fieldbyname('dppayra').Asstring;      // 발령후 직책
       if  Qdeptdisp(orgnum,deptcode) = '에러' then
       begin
         inc(err_cnt);
         e_write('부서코드가 존재하지 않습니다!!');
         inc(cnt);
         inc(read_cnt);
         Qrais.next;
         continue;
       end;
       with Qmas do
       begin
         Close;
         Sql.clear;
         Sql.add('SELECT korname, paycl ,payra ,orgnum ,deptcode ');
         Sql.add('FROM pimpmas WHERE empno = :lempno ');
         ParamByname('lempno').Asstring := empno;
         Open;
         Korname   := fieldBYname('korname').Asstring;     // 성   명
         Borgnum   := fieldbyname('orgnum').Asstring;      // 발령전 차수
         Bdeptcode := fieldbyname('deptcode').Asstring;    // 발령전 부서
         Bpaycl    := fieldbyname('paycl').Asstring;       // 발령전 BAND
         Bpayra    := fieldbyname('payra').Asstring;       // 발령전 직책
         paycl     := fieldbyname('paycl').Asstring;       // 발령후 BAND
         Qmas.close;
       end;    // Qmas
       anupdyn   := 'N';                                // 경신여부
       
       if (Bpaycl = 'E1') or (Bpaycl = 'H1') then                     // 발령구분(차수변경) 1차.
       begin
         ancode    := '712';
         andetcode := '';
       end
       else
         ancode    := '211';
       With Qry_imsi do            //속도문제로 컴퍼넌트에 Query문 삽입.
       begin
         Close;
         ParamByName('p_orgnum').AsString := orgnum;
         ParamByName('p_deptcode').AsString := deptcode;
         Open;
         Deptname := FieldByName('deptname').AsString;
         Close;
         ParamByName('p_orgnum').AsString := Borgnum;
         ParamByName('p_deptcode').AsString := Bdeptcode;
         Open;
         DpDeptname := FieldByName('deptname').AsString;
       end;

       if Deptname = Dpdeptname then
       begin
         ancode    := '935';
         andetcode := '';
       end;
       inc(read_cnt);
       insert_pihanno;
       inc(cnt);
       Qrais.next;
    end;  // while
  end;  // Qrais
  Qrais.close;
end;

procedure Tpic7070gForm.reg_work;
begin
  With Qrais do
  begin
    close;
    sql.clear;
    sql.add(Format('select empno,dporgnum,paycl,dpdeptcode,dppayra,trgubun  from pitremd '+
                   'where (remddate = ''%s'' and pstate < ''60'') and (orgnum = dporgnum) '+
                   '  and (nvl(dporgnum,''  '') != ''  '')  and (annoyn = ''N'') and (confyn=''M'') '+  //조직개편시 표시 MOVE약자.
                   '  and (paycl >= ''%s'' and paycl <= ''%s'') order by empno ',[organdate,payclfr.text,payclto.text]));
    open;
    if Recordcount < 0 then
    begin
      P_Help.caption := ' 조직개편화일에 자료가 존재하지 않습니다!!.';
      system.exit;
    end;
    cnt := 0;
    First;
    while not Eof do
    begin
       Clear;
       if Qrais.RecordCount <> cnt then
           Gr.Progress := (cnt * 100) div RecordCount else Gr.Progress := 100;
       SendMessage(panel5.handle,WM_PAINT,0,0);

       annono    := E_annono.text;                        // 발령번호
       anfrdate  := E_anfrdate.text;                      // 발령일FROM
       gu_paycl  := fieldbyname('paycl').Asstring;        // 직급.
       if (gu_paycl >= '11') and (gu_paycl <='45') then
         ancode   := '211'                                // 발령구분(전보)-정규직
       else
         ancode   := '712';                               // 발령구분(부서변동)

       empno     := FieldByName('empno').AsString;        // 사  번
       orgnum    := FieldByName('dporgnum').AsString;     // 발령후 차수
       deptcode  := FieldByName('dpdeptcode').AsString;   // 발령후 부서
       payra     := FieldByName('dppayra').AsString;      // 발령후 직책
       anupdyn   := 'N';                                  // 경신여부
       with Qmas do
       begin
          close;
          sql.clear;
          sql.add(Format('select korname,orgnum,deptcode,paycl,payra, '+
                         'lancode,lannono,lanfrdate,lantodate from pimpmas '+
                         'where empno = ''%s'' and pstate < ''60''  ',[empno]));
          open;
          if Qmas.Recordcount <= 0 then begin
              inc(err_cnt);
              e_write('인사마스터에  해당 자료가 존재하지 않습니다!!');
          end;
          korname   := fieldBYname('korname').Asstring;     // 성   명
          paycl     := fieldByName('paycl').asstring;       // 발령후 BAND
          borgnum   := fieldbyname('orgnum').Asstring;      // 발령전 차수
          bdeptcode := fieldbyname('deptcode').Asstring;    // 발령전 부서
          bpaycl    := fieldbyname('paycl').Asstring;       // 발령전 BAND
          bpayra    := fieldbyname('payra').Asstring;       // 발령전 직책
          close;
       end;  //Qmas

{       if bpayra <> payra then
       begin                                                //현직책 != 배치직책
         if (gu_paycl >= '11') and (gu_paycl <= '45') then
             andetcode := '11' ;                            // 실제전보
       end
       else
       begin
          bdeptname  := Qdeptdisp(borgnum,bdeptcode);
          dpdeptname := Qdeptdisp(orgnum,deptcode);
          if bdeptname = dpdeptname then           //(현직위 == 배치직위) AND (현소속명 = 배치소속명)
          begin
              with Qremd do
              begin
                 close;
                 sql.clear;
                 sql.add(Format('update pitremd set annoyn = ''R'' '+  //차수변경가능.
                    'where remddate = ''%s'' and empno = ''%s'' ',[organdate,empno]));
                 execsql;
                 close;
                 inc(cnt);
                 inc(read_cnt);
                 Qrais.next;
                 continue;
              end;
          end;

          if (gu_paycl >= '11') and (gu_paycl <= '45') then
          begin
             read_pycdept1(borgnum,bdeptcode);     // 상위부서,본부코드를 읽어온다.
             bextcode := textcode;
             bboncode := tboncode;
             read_pycdept1(borgnum,bextcode);      // 상위부서의 본부를 읽음.
             if bboncode <> tboncode then
                  bextcode := '';
             if bboncode = bdeptcode then
                  bboncode := '';
             if not(read_pycdept2(borgnum,bdeptcode)) then
             begin                                                 // 현차수,현부서로
                 if bextcode <> '' then
                 begin
                    if not read_pycdept2(borgnum,bextcode) then
                    begin                                          // 현차수,현상위부서코드로
                       if bboncode <> '' then  begin
                           read_pycdept2(borgnum,bboncode);        // 현차수,본부코드로
                       end;
                    end;
                  end;
             end;
             if (deptcode <> r_deptcode) then
                    andetcode := '11'      // 실제전보
             else   andetcode := '12';     // 조직전보
          end;  // 전보발령 (정규직)
       end;    // 현직위와 배치직위가 다를때
}
       // 전보구분을 수정
       update_trgubun;   //trgubun 에 세부구분코드 저장.
       inc(read_cnt);
       insert_pihanno;
       inc(cnt);
       Qrais.next;
    end;   //while
  end;  //Qrais

end;



// 조직차수,부서코드로 상위부서,본부코드

procedure Tpic7070gForm.read_pycdept1(s1,s2:string);
begin
   with Qdept do begin
      close;        sql.clear;
      sql.add(Format('select nvl(extcode,''ZZZZZZ'') extcode, nvl(boncode,''ZZZZZZ'') boncode from pycdept '+
                     'where orgnum = ''%s'' and deptcode = ''%s'' ',[s1,s2]));
      open;

      if Recordcount <= 0 then begin
          inc(err_cnt);
          e_write('현부서의 상위부서나 본부코드가 존재하지 않습니다!!.');
          system.exit;
      end;
      textcode := Fieldbyname('extcode').Asstring;
      tboncode := Fieldbyname('boncode').Asstring;
      close;
   end;
end;


function Tpic7070gForm.read_pycdept2(s1,s2 : string):Boolean;
begin
   read_pycdept2 := True;
   with Qdept do begin
       close;        sql.clear;
       sql.add('select orgnum,nvl(deptcode,''ZZZZZZ'')deptcode from pycdept ');
       sql.add('where  (borgnum = :lorgnum) and ');
       sql.add('       ((bdeptcode1 = :ldeptcode) or  (bdeptcode2 = :ldeptcode) or (bdeptcode3 = :ldeptcode)) ');
       Parambyname('Lorgnum').Asstring := s1;
       Parambyname('Ldeptcode').asstring := s2;
       open;
       if( Recordcount = 0 ) then begin
          inc(err_cnt);
          read_pycdept2 := False;
          e_write('현부서의 변동전 부서가 존재하지 않습니다!!.');
          system.exit;
       end;
       r_deptcode := fieldbyname('deptcode').Asstring;
       if (r_deptcode = 'ZZZZZZ') then read_pycdept2 := False;
       close;
   end;
end;

procedure Tpic7070gForm.update_trgubun;
begin
  with Qremd do
  begin
    close;
    sql.clear;
    sql.add(Format('update pitremd set trgubun = ''%s'' where empno = ''%s'' '+
                   'and remddate =''%s'' ',[andetcode,empno,organdate]));
    execsql;
    close;
  end;
end;

function Tpic7070gForm.annono_check(s1 : string):string;
begin
     annono_check := 'OK';
     with Qan do begin
       close; sql.clear;
       sql.add(Format('select annono ,anlastno from pihanba '
               + 'where annono = ''%s'' ' ,[s1]));
       open;
       if recordcount > 0 then begin
          lastno := FieldByname('anlastno').ASstring;
       end
       else  begin
          P_Help.Caption := '발령번호가 존재하지 않습니다.';
          annono_check := '';;
       end;
       close;
    end;
end;

procedure Tpic7070gForm.delete_pihanno;
begin
     read_cnt := 0;
     reg_cnt := 0;
     with Qan do begin
          close;  sql.clear;
          sql.add(Format('Delete from pihanno  ' +
                         'where annono = ''%s'' and anfrdate = ''%s'' ' ,[E_annono.text,E_anfrdate.text]));
          EXECSQL;
     end;
     Qan.close;
     p_help.caption := '';
end;

procedure Tpic7070gForm.Insert_pihanno;
begin
     lastno    := inttostr(strtoint(lastno) + 1);       // 일련번호
     anseqno   := kpaylib.lpad(lastno,4,'0');
     with Qan do
     begin
        close;
        sql.clear;
        sql.add('INSERT into pihanno (annono,anseqno,anfrdate,ancode,andetcode,empno,korname, ');
        sql.add('     orgnum,deptcode,payra,paycl, ');
        sql.add('     borgnum,bdeptcode,bpaycl,bpayra,anupdyn,writeemp,writetime )');
        sql.add('values( :tannono,:tanseqno,:tanfrdate,:tancode,:tandetcode,:tempno,:tkorname, ');
        sql.add('  :torgnum,:tdeptcode,:tpayra,:tpaycl, ');
        sql.add('  :tborgnum,:tbdeptcode,:tbpaycl,:tbpayra,:tanupdyn,:jobempno,:ttime)');
        parambyname('tannono').Asstring    := annono;
        parambyname('tanseqno').Asstring   := anseqno;
        parambyname('tanfrdate').Asstring  := anfrdate;
        parambyname('tancode').Asstring    := ancode;
        parambyname('tandetcode').Asstring := andetcode;
        parambyname('tempno').Asstring     := empno;
        parambyname('tkorname').Asstring   := korname;
        parambyname('torgnum').Asstring    := orgnum;
        parambyname('tdeptcode').Asstring  := deptcode;
        parambyname('tpayra').Asstring     := payra;
        parambyname('tpaycl').Asstring     := paycl;
        parambyname('tborgnum').Asstring   := borgnum;
        parambyname('tbdeptcode').Asstring := bdeptcode;
        parambyname('tbpaycl').Asstring    := bpaycl;
        parambyname('tbpayra').Asstring    := bpayra;
        parambyname('tanupdyn').Asstring   := anupdyn;
        parambyname('jobempno').Asstring   := p_empno;
        parambyname('ttime').Asstring      := time;
        EXECSQL;
        inc(reg_cnt);
        close;
     end;     //Qan
end;

procedure Tpic7070gForm.update_annoyn;     //차수없는 조직개편시.
begin
  try
    with Qrais do
    begin
      close;
      sql.Clear;
      sql.add(Format( 'update pitremd set annoyn = ''Y''  '+
              'where (remddate = ''%s'' and pstate < ''60'') '+
              '  and (nvl(dporgnum,''  '') != ''  '' ) and (annoyn = ''N'') '+
              '  and (paycl >= ''%s'' and paycl <= ''%s'') ',[organdate,payclfr.text,payclto.text]));
      execsql;
      close;
    end;
  Except
    MessageBox(0,' 경신할 자료가 없습니다.','확 인',MB_OK or $0030);
    exit;
  end;
end;

procedure Tpic7070gForm.update_pihanba;
begin
  with Qvari do
  begin
    Close;
    sql.clear;
    sql.add(Format('UPDATE pihanba Set anlastno = ''%s'' '+
                   'where annono = ''%s'' ',[lastno,FormatMaskText('0000',E_annono.text)]));
    EXECSQL;
    Close;
  end;
  P_Help.Caption := '';
end;

procedure Tpic7070gForm.E_Write(str : string);
begin
  System.Writeln(err,'    '+'사원번호('+empno+')         =>'+str);
end;

procedure Tpic7070gForm.BB_CloseClick(Sender: TObject);
begin
    close;
end;


function Tpic7070gForm.QDeptDisp(s1,s2 : String) : String;
var
  str : string;
begin
  if trim(s1) = '' then
  begin
    QDeptDisp := '에러';
    system.exit;
  end;
  Qdept.Close;
  Qdept.sql.clear;
  Qdept.sql.add('select DeptName from pycdept where orgnum=:lorgnum and deptcode = :ldept ');
  Qdept.Parambyname('lorgnum').AsString := Trim(s1);
  Qdept.Parambyname('ldept').AsString   := Trim(s2);
  Qdept.Open;
  if trim(Qdept.FieldByName('DeptName').AsString) = ''  then
    QdeptDisp := '에러'
  else
    QdeptDisp := Qdept.FieldByName('DeptName').AsString;
  Qdept.close;
end;

procedure Tpic7070gForm.payclfrDblClick(Sender: TObject);
begin
  codeForm := TCodeForm.Create(self);
  Try
    case TComponent(Sender).Tag of
      1,2 : begin
	  codeForm.FormData  := 'BAND코드 열람';
	  codeForm.DataVal1  := 'I112';
	  end;
    end;
    codeForm.ShowModal;
    if CodeForm.Code = '' then System.Exit;
    TmaskEdit(Sender).Text := CodeForm.Code;
    Finally
       codeForm.Free;
    END;

end;

procedure Tpic7070gForm.paycltoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_F1  then
     if (TMaskEdit(Sender).Tag = 1) or
        (TMaskEdit(Sender).Tag = 2)  then payclfrDblClick(Sender);
end;

procedure Tpic7070gForm.E_annonoChange(Sender: TObject);
begin
    tmp_annono := E_annono.text;
    tmp_anfrdate := E_anfrdate.text;
end;

procedure Tpic7070gForm.an_gubun1Click(Sender: TObject);
begin
  Tradiobutton(sender).checked := True;
  gubun := TRadiobutton(sender).tag;
  if gubun = 1 then
  begin
     payclfr.Enabled  := True;
     payclto.Enabled  := True;
  end
  else
  if gubun = 2 then
  begin
     payclfr.Enabled  := False;
     payclto.Enabled  := False;
  end;
end;


procedure Tpic7070gForm.excelClick(Sender: TObject);
var
  Fexcel : textfile;
  Count  : String;
  ancode, andetcode, empno, korname, orgnum, deptcode, dpname, paycl, payra, borgnum, bdeptcode, bdpname, bpaycl, bpayra, anupdyn : string;
begin

  if Trim(E_annono.Text) = '' then
  begin
    MessageBox(0,' 발령번호가 없습니다.','확 인',MB_OK or $0030);
    Exit;
  end;

  if Trim(E_anfrdate.Text) = '' then
  begin
    MessageBox(0,' 발령일자가 없습니다.','확 인',MB_OK or $0030);
    Exit;
  end;

  With Qry_pihan do
  begin
    Close;
    Sql.Clear;
    Sql.Add('SELECT count(*) cnt FROM Pihanno '+
            ' WHERE annono = '''+E_annono.text+''' '+
            ' AND anfrdate = '''+E_anfrdate.text+''''+
            ' ORDER BY empno ');
    Open;
    Count :=  FieldByName('cnt').AsString;
  end;

  if Count <= '0' then
  begin
    MessageBox(0,' 해당 발령번호의 발령날짜가 없습니다.','확 인',MB_OK or $0030);
    exit;
  end;

  if saveDialog1.Execute then
  begin
    assignfile(Fexcel, SaveDialog1.FileName);
    rewrite(Fexcel);
    writeln(Fexcel, ',조,직,개,편,,인,사,발,령,안,등,록,현,황 ');
    writeln(Fexcel, '');
    writeln(Fexcel, '[발령번호] ,:, '+Copy(E_annono.text,1,4)+'-'+Copy(E_annono.text,5,4)+
                   ',,[발령일자],:, '+Copy(E_anfrdate.text,1,4)+'-'+Copy(E_anfrdate.text,5,2)+'-'+Copy(E_anfrdate.text,7,2)+', ');
    writeln(Fexcel, '');
    writeln(Fexcel, '발령코드,세부구분,사번,성 명,배치차수,배치부서,배치부서명,배치BAND,배치직책,발령전차수,'+
                   '발령전부서,발령전부서명,발령전BAND,발령전직책,갱신여부 ');
    with Qry_pihan do
    begin
      Close;
      Sql.Clear;
      Sql.Add('SELECT a.ancode, a.andetcode, a.empno, a.korname, a.orgnum, a.deptcode, b.deptname dpname, '+
              '       a.paycl, a.payra, a.borgnum, a.bdeptcode, c.deptname bdpname, a.bpaycl, a.bpayra, a.anupdyn '+
              ' FROM Pihanno a, pycdept b, pycdept c   '+
              ' WHERE a.orgnum = b.orgnum and a.deptcode=b.deptcode '+
              ' AND  a.borgnum= c.orgnum and a.bdeptcode=c.deptcode '+
              ' AND annono = '''+E_annono.text+''' '+
              ' AND anfrdate = '''+E_anfrdate.text+''''+
              ' ORDER BY empno ');
      Open;
      while not EOF do
      begin
        ancode    := FieldByName('ancode').AsString;
        andetcode := FieldByName('andetcode').AsString;
        empno     := FieldByName('empno').AsString;
        korname   := FieldByName('korname').AsString;
        orgnum    := FieldByName('orgnum').AsString;
        deptcode  := FieldByName('deptcode').AsString;
        dpname    := FieldByName('dpname').AsString;
        paycl     := FieldByName('paycl').AsString;
        payra     := FieldByName('payra').AsString;
        borgnum   := FieldByName('borgnum').AsString;
        bdeptcode := FieldByName('bdeptcode').AsString;
        bdpname   := FieldByName('bdpname').AsString;
        bpaycl    := FieldByName('bpaycl').AsString;
        bpayra    := FieldByName('bpayra').AsString;
        anupdyn   := FieldByName('anupdyn').AsString;
        writeln(Fexcel,ancode+','+andetcode+','+empno+','+korname+','+orgnum+','+deptcode+','+dpname+','+
                       paycl+','+payra+','+borgnum+','+bdeptcode+','+bdpname+','+bpaycl+','+bpayra+','+anupdyn );
        Next;
      end;
    end;
    closefile(Fexcel);
    app := CreateOleObject('Excel.Application');
    app.visible := true;
    app.workbooks.open(SaveDialog1.FileName);
  end
  else
  begin
    GR.progress := 00;
    P_Help.Caption := '작업을 취소 했습니다.';
    Application.ProcessMessages;
    exit;
  end;
end;

end.
