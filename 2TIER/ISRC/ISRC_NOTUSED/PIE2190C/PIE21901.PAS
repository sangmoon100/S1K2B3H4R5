{
---------------------Program  Header -------------------------------------------
PROGRAM-NAME    : PIE2190C(공석조직현황)
SYSTEM-NAME     : 종합인사정보
SUBSYSTEM-NAME  : 인사
Programmer      : 전철호
Version         : 1.00
Date            : 1997.8.30
Update contents
  1.00     97.8.30   전철호 신규프로그램 개발   처리명세서
 30.01   2004.09.08  이민용 퀵리포트 버전업, 리포트 새로 그림
--------------------------------------------------------------------------------
}

unit pie21901;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Gauges, Buttons, ExtCtrls, DB, DBTables, QuickRpt, pass,
  timeftp, codetext;

type PrnText = record
     gubun : string[1];
     pagename : string[12];
     dept1 : string[60];
     deptcode : string[8];
     bigo : string[6];
end;

type
  TMainForm = class(TForm)
    hp: TPanel;
    helpDsr: TLabel;
    helpLabel: TLabel;
    Panel5: TPanel;
    Bexit: TBitBtn;
    Bscreen: TBitBtn;
    Bprint: TBitBtn;
    Panel3: TPanel;
    Gr: TGauge;
    Panel10: TPanel;
    Panel1: TPanel;
    Panel9: TPanel;
    panel7: TPanel;
    NLastDate: TPanel;
    Panel2: TPanel;
    Label11: TLabel;
    Panel8: TPanel;
    Panel19: TPanel;
    L_UserName: TLabel;
    L_CurDate: TLabel;
    Panel11: TPanel;
    Panel4: TPanel;
    Panel6: TPanel;
    WorkDate: TMaskEdit;
    WSel1: TRadioButton;
    WSel2: TRadioButton;
    Qcode: TQuery;
    Database1: TDatabase;
    Qwork: TQuery;
    Query1: TQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure WSelClick(Sender: TObject);
    procedure BscreenClick(Sender: TObject);
    procedure BexitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    p_empno,pkorname,password : string;
    Lastdate: string;  // 최종작업년월
    Start   : Boolean;
    WSel    : integer;  // 작성구분 변수.
    //procedure ShowPreView;
    function  Data_Wselected1 : Boolean;
    function  Data_Wselected2 : Boolean;
  public
    { Public declarations }
    PageName: string;
    PrnRpt  : TQuickRep;
    prnData : array[1..4,1..4] of real; // 출력용 메모리
  end;

var
  MainForm: TMainForm;
  HomeDir : string;
  TempFile: string;

implementation

uses pie21902, pie21903;

{$R *.DFM}

// 폼에 관련된 사항들...........................................................
{procedure TMainForm.ShowPreView;
begin
  ViewForm := TViewForm.Create(Self);
  Try
    ViewForm.ShowModal;
  Finally
    ViewForm.Free;
  End;
end;}

procedure TMainForm.FormCreate(Sender: TObject);
begin
  Start := True;
end;

procedure TMainForm.FormActivate(Sender: TObject);
begin
  HomeDir  := HomeDirOpen;
  p_empno  := PassEmp(cmdline,1);
  pkorname := PassEmp(cmdline,2);
  password := PassEmp(cmdline,3);
end;

procedure TMainForm.FormPaint(Sender: TObject);
var
CurDate:string;
begin
  if start = True then begin
     start := False;

     DataBase1.Params[0]  := 'SERVER NAME='+PassEmp(cmdline,13);
     DataBase1.Params[1]  := 'USER NAME='+PassEmp(cmdline,5);
     DataBase1.Params[16] := 'PASSWORD=' +PassEmp(cmdline,6);
     Application.Processmessages;


     Try
       Database1.Connected := True;

     EXCEPT ON E : EDataBaseError DO begin
         MessageBox(handle,pChar(E.Message),'에  러',MB_OK or $0010);
         halt(0);
       end;
     END;


     // 패스워드 체크부분.
     //if PassDialog(MainForm,p_empno,pkorname,password) = False then halt(0);

     CurDate  := TimeDate(Query1);
     L_CurDate.Caption  := copy(CurDate,1,4)+'/'+
                        copy(CurDate,5,2)+'/'+
                        copy(CurDate,7,2);

     L_UserName.Caption := pkorname+'('+p_empno+')';

     HelpDsr.Caption := '';
     with QCode do begin
       close; sql.clear;
       sql.add('select value1 from pimvari '+
               'where (gubun = ''B2'' and sgubun = ''0000'')');
       open;
       if trim(FieldByName('value1').AsString) = '' then begin
          MessageBox(0,'조직도 최종작업년월이 존재하지 않습니다!!.','확 인',MB_OK or $0030);
       end else begin
          Lastdate := FieldByName('value1').AsString;
          NLastdate.caption := copy(LastDate,1,4)+'/'+
                               copy(LastDate,5,2);
         workdate.Text :=lastdate;
       end;
       close;
     end;
     WSelClick(WSel1);
     TempFile := HomeDir+'\list\'+'T'+inttostr(Application.handle)+'.tmp';
  end;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   CodeToText(tempFile,'',3);
end;

procedure TMainForm.BexitClick(Sender: TObject);
begin
  if MessageBox(handle,'종료 하시겠습니까 ?.','확 인',MB_YESNO or $0030) = ID_YES then begin
     close;
  end;
end;

// 작성구분을 클릭을 할 경우....................................................
procedure TMainForm.WSelClick(Sender: TObject);
begin
   Wsel := TComponent(Sender).Tag;
   TRadioButton(Sender).Checked := True;
   case WSel of
    1 : PrnRpt := PrnForm1.Rpt;
    2 : PrnRpt := PrnForm2.Rpt;
   end;
end;

// 화면,출력버턴을 누를경우.....................................................
procedure TMainForm.BscreenClick(Sender: TObject);
begin
  if WorkDate.Text > LastDate then begin
     MessageBox(0,'작업년월 입력필드 에러입니다 !!.','확 인',MB_OK or $0030);
     system.exit;
  end;
  HelpDsr.Caption := '해당자료를 추출중입니다 !!.';
  SendMessage(hp.handle,WM_PAINT,0,0);
  case Wsel of
   1 : begin
         if Data_Wselected1 = False then begin
            MessageBox(0,'데이타가 없습니다 !!.','확 인',MB_OK or $0030);
            system.exit;
         end;
       end;
   2 : begin
         if Data_Wselected2 = False then begin
            MessageBox(0,'데이타가 없습니다 !!.','확 인',MB_OK or $0030);
            system.exit;
         end;
       end;
  end;
  // 출력을 한다.
  if TComponent(Sender).Name = 'Bscreen' then begin
     //QRPrinter.OnPreView := ShowPreView;
     PrnRpt.PreView;
  end else begin
     PrnRpt.Print;
  end;
  HelpDsr.Caption := '작업이 완료되었습니다.';
  Gr.Progress := 0;
end;

// 공석조직현황 데이타를 추출한다...............................................
function TMainForm.Data_Wselected1 : Boolean;
var
  i,j,cnt : integer;
begin
   Result := True;
   for i := 1 to 4 do
      for j := 1 to 4 do PrnData[i,j] := 0;
   with QWork do begin
      close; sql.clear;
      sql.add(Format('select substr(deptlevel,1,1) tdeptlevel, '+
                     '       payrayn,adpayrayn,count(adpayrayn) cnt '+
                     'from pihorga '+
                     'where (orgym = ''%s'' and gubun = ''0'') and '+
                     '      (substr(deptlevel,1,2) >= ''C0'' and '+
                     '       substr(deptlevel,1,2) <= ''EZ'') '+
                     'group by substr(deptlevel,1,1),payrayn,adpayrayn ',
               [WorkDate.Text] ));
       Open;
       if RecordCount = 0 then Result := False;
       cnt := 1;
       while not Eof do begin
          if RecordCount <> cnt then Gr.Progress := (cnt * 100) div RecordCount
                                else Gr.Progress := 100;
          SendMessage(panel3.handle,WM_PAINT,0,0);
          // 부서등급 1자리로 구분을 결정�
          if FieldByName('tdeptlevel').AsString ='C' then begin
             j := 1;
          end else
          if FieldByName('tdeptlevel').AsString ='D' then begin
             j := 2;
          end else j := 3;
          // 전체조직수를 누계한다.
          PrnData[1,j] := PrnData[1,j]+FieldByName('cnt').AsFloat;
          prnData[1,4] := prnData[1,4]+FieldByName('cnt').AsFloat;
          // 겸직,보임,공석을 구분한다.
          if FieldByName('adpayrayn').AsString ='Y' then begin
             i := 3;
             PrnData[i,j] := PrnData[i,j]+FieldByName('cnt').AsFloat;
             PrnData[i,4] := PrnData[i,4]+FieldByName('cnt').AsFloat;
          end else
          if FieldByName('payrayn').AsString ='Y' then begin
             i := 2;
             PrnData[i,j] := PrnData[i,j]+FieldByName('cnt').AsFloat;
             PrnData[i,4] := PrnData[i,4]+FieldByName('cnt').AsFloat;
          end else begin
             i := 4;
             PrnData[i,j] := PrnData[i,j]+FieldByName('cnt').AsFloat;
             PrnData[i,4] := PrnData[i,4]+FieldByName('cnt').AsFloat;
          end;
          Next; inc(cnt);
       end;
       close;
   end;
end;

// 내역출력  RTN................................................................
function TMainForm.Data_Wselected2 : Boolean;
var
   F : file of PrnText;
   D : PrnText;
   TempDept,dept1,dept2,dept3,dept4,tcode : string;
   pcnt,cnt : integer;
begin
   Result := True;
   AssignFile(F,TempFile); ReWrite(F);
   with QWork do begin
      close; sql.clear;
      sql.add(Format('select substr(deptlevel,1,1) tdeptlevel, '+
                     '       deptcode,orgnum,payrayn,adpayrayn '+
                     'from pihorga '+
                     'where (orgym = ''%s'' and gubun = ''0'') and '+
                     '      (substr(deptlevel,1,2) >= ''C0'' and '+
                     '       substr(deptlevel,1,2) <= ''EZ'') and '+
                     '      (payrayn <> ''Y'' or adpayrayn = ''Y'') '+
                     'order by substr(deptlevel,1,1),orgnum,deptcode ',
               [WorkDate.Text] ));
       Open;
       if RecordCount = 0 then begin
          Result := False;
          system.close(F);
          system.exit;
       end;
       cnt := 1;  pcnt := 1;
       TempDept := FieldByName('tdeptlevel').AsString;
       while not Eof do begin
          if RecordCount <> cnt then Gr.Progress := (cnt * 100) div RecordCount
                                else Gr.Progress := 100;
          SendMessage(panel3.handle,WM_PAINT,0,0);
          // 부서등급 1자리로 구분을 결정�
          if FieldByName('tdeptlevel').AsString ='C' then begin
             D.PageName := '본부급 조직';
          end else
          if FieldByName('tdeptlevel').AsString ='D' then begin
             D.PageName := '부급 조직';
          end else begin
             D.PageName := '과급 조직';
          end;
          if cnt = 1 then PageName := D.PageName;
          Qcode.close; Qcode.sql.clear;
          Qcode.sql.add(Format('select deptcode,orgnum,deptname,deptna1,deptna2,deptna3,'+
                               '       fieldcode from pycdept '+
                               'where (orgnum = ''%s'' and deptcode = ''%s'') ',
                        [FieldByName('orgnum').AsString,FieldByName('deptcode').AsString]));
          Qcode.open;
          //97.10.15 부서명을 본부,부,과로 구분출력하지 않기로 함.
{          D.dept2 := Qcode.FieldByName('deptna1').AsString;
          D.dept3 := Qcode.FieldByName('deptna2').AsString;
          D.dept4 := Qcode.FieldByName('deptna3').AsString;
          Tcode   := Qcode.FieldByName('fieldcode').AsString;
          Qcode.close; Qcode.sql.clear;
          Qcode.sql.add(Format('select deptname from pycdept '+
                               'where (orgnum = ''%s'' and deptcode = ''%s'') ',
                        [FieldByName('orgnum').AsString,Tcode]));
          Qcode.open;
          D.dept1 := Qcode.FieldByName('deptname').AsString;}
          D.dept1 := Qcode.FieldByname('deptname').Asstring;
          D.deptcode := FieldByname('deptcode').Asstring;
          if FieldByname('adpayrayn').Asstring ='Y' then
              D.bigo := '겸직'
          else D.bigo := '';
//          if FieldByname('payrayn').Asstring ='Y' then
          if TempDept <> FieldByName('tdeptlevel').AsString then begin
             TempDept := FieldByName('tdeptlevel').AsString;
             D.gubun := 'P'; system.write(F,D); pcnt := 0;
          end;
          if pcnt >= 23 then begin
             D.gubun := 'P'; system.write(F,D);
             pcnt := 0;
          end;
          D.gubun := 'D'; system.write(F,D);
          Next; inc(cnt); inc(pcnt);
       end;
       close; Qcode.close; system.close(F);
   end;
end;

end.
