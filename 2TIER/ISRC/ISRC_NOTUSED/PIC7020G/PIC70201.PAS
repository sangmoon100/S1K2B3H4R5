{ header
 ----------------------------------------------------------------------------
  PROGRAM-NAME    : PIC7020G(조직개편 대상자 선정)
  SYSTEM-NAME     : 종합인사정보
  SUBSYSTEM-NAME  : 인사
  Programmer      : 김혜진
  Version         : 1.00
  Date            : 1997.10.8
  Update Contents
    1.00    1997.10.8   김혜진  신규프로그램 개발  처리명세서
 ---------------------------------------------------------------------------}
unit pic70201;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Gauges, StdCtrls, Mask, ExtCtrls, jeonPan, Buttons, DBTables, Db,datelib,
  pass,timeftp, Sockets,quickrpt, Animate,codelib,codeText, ANIMATE1;

type
  Tpic7020gForm = class(TForm)
    Panel1: TPanel;
    L_userName: TLabel;
    L_CurDate: TLabel;
    Panel7: TPanel;
    Panel2: TPanel;
    Label7: TLabel;
    Panel8: TPanel;
    Panel3: TPanel;
    Panel9: TPanel;
    Panel6: TPanel;
    organdate: TMaskEdit;
    Panel4: TPanel;
    BB_Close: TBitBtn;
    BB_Run: TBitBtn;
    Helppanel: TPanel;
    P_Help: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Qvari: TQuery;
    Database1: TDatabase;
    Qorg: TQuery;
    Sockets1: TSockets;
    Animated1: TAnimated;
    PrintDialog1: TPrintDialog;
    Query1: TQuery;
    Panel5: TPanel;
    paycl1: TMaskEdit;
    Label3: TLabel;
    paycl2: TMaskEdit;
    QCode: TQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure BB_RunClick(Sender: TObject);
    procedure BB_CloseClick(Sender: TObject);
    procedure paycl1DblClick(Sender: TObject);
  private
    { Private declarations }
    start : boolean;
    AReport : TQuickRep;
    FreeCheck,FreeDept : Boolean;
    function  QcodeDisp(s1,s2 : String) : String;

  public
    { Public declarations }
    p_empno : string;
    pkorname : string;
    password : string;
    homedir    : string;
    org_date   : string;
    org_orgnum : string;
    retodate   : string;
    read_cnt : integer;
    reg_cnt  : integer;
    Error_help : array [0..255] of char;
    procedure proc_work;
  end;

var
  pic7020gForm: Tpic7020gForm;
  empno,korname,orgnum,deptcode,payra,paycl,jobgun,jobline,payrayn,pstate :string;
  empdate,cpaycldate,realtrdate,nojeonyn,lschdeg, deptlevel,extcode,boncode,tmp_date: string;
  dispcause, dispyn,trgubun, confyn, dporgnum, dpdeptcode, dpdeptlevel,dpextcode : string;
  dpboncode,dppayra,dppayrayn : string;
  paygr,comduyy,comdumm,comdudd,payclyy,payclmm,paycldd, deptcoyy,deptcomm :integer;

implementation

uses pic70202;

{$R *.DFM}

//------입력받은 데이타를 코드 화일에서 찾아서 해당 필드에 보여준다..-----------}
function Tpic7020gForm.QCodeDisp(s1,s2 : String) : String;
var
  str : string;
begin
  if trim(s2) = '' then begin QcodeDisp := ''; system.exit; end;
  if FreeCheck = False then begin
     QCode.Close;
     QCode.Parambyname('lcodeid').AsString := s1;
     QCode.Parambyname('lcodesub').AsString   := s2;
     QCode.Open;
     if trim(QCode.FieldByName('CodeName').AsString) = ''  then
        QcodeDisp := '('+s2+')'
     else QCodeDisp := Qcode.FieldByName('CodeName').AsString;
  end else begin
      str := TextCodeDisp(s1,s2,HomeDir+'\pic7020g.cod');
      if trim(str) = '' then QcodeDisp := '('+trim(s2)+')'
                        else QcodeDisp := str;
  end;
end;

procedure Tpic7020gForm.FormCreate(Sender: TObject);
begin
     start := True;
end;

procedure Tpic7020gForm.FormActivate(Sender: TObject);
begin
     HomeDir  := HomeDirOpen;
     p_empno  := PassEmp(cmdline,1);
     pkorname := PassEmp(cmdline,2);
     password := PassEmp(cmdline,3);
     read_cnt := 0; reg_cnt := 0;
end;

procedure Tpic7020gForm.FormPaint(Sender: TObject);
var
  CurDate : String;
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

     CurDate  := TimeDate(Query1);
     L_CurDate.Caption  := copy(CurDate,1,4)+'/'+
                           copy(CurDate,5,2)+'/'+
                           copy(CurDate,7,2);

//     if PassDialog(self,p_empno,pkorname,password) = False then halt(0);
     L_UserName.Caption := pkorname+'('+p_empno+')';
     // 평가대상기간을 읽어온다.
     P_Help.Caption := '조직개편기준일을 읽어오고 있습니다 !!.';
     SendMessage(HelpPanel.handle,WM_PAINT,0,0);
     with Qvari do
     begin
        close;
        sql.clear;
        sql.add('select value1,value2 from pimvari where gubun=''C7'' and sgubun= ''0001''  ');
        Open;
        if trim(FieldByName('value1').AsString) = '' then begin
           MessageBox(0,'조직개편기준일이 존재하지 않습니다 !!.','확 인',MB_OK or $0030);
           system.exit;
        end
        else begin
           org_date := FieldByName('value1').AsString;
           org_orgnum := fieldbyname('value2').Asstring;   //조직개편차수
//           organdate.Text := Copy(org_date,1,4) + Copy(org_date,5,2) + Copy(org_date,7,2);
           organdate.text := org_date;
        end;

        close;   sql.clear;
        sql.add('select value1,value2 from pimvari where gubun= ''D3'' and sgubun=''0001'' ');
        open;
        if FieldByName('value2').AsString = '' then begin
           MessageBox(0,'자기신고대상기간이 존재하지 않습니다 !!.','확 인',MB_OK or $0030);
           system.exit;
        end
        else
           retodate := Fieldbyname('value2').Asstring;
        AReport := printform.Qremd;
    end;
    P_Help.Caption := '';
    organdate.SetFocus;
  end;
end;

procedure Tpic7020gForm.BB_RunClick(Sender: TObject);
begin
    if organdate.text < org_date then begin
       showmessage('조직개편기준일은 인사변수의 조직개편기준일보다 크거나 같아야 합니다!!.');
       system.exit;
    end;
    proc_work;   //작업.
    organdate.SetFocus;
    printform.Query1.Close;
end;

procedure TPic7020gForm.proc_work;
var
   LJobmsg : string;
begin
     LJobmsg := '';
     with Qorg do
     begin
        close;
        sql.clear;
        sql.add(Format('select count(*) cnt from pitremd where remddate = ''%s''',[org_date]));    //조직개편일.
        open;
        if fieldbyname('cnt').Asinteger > 0 then begin
           if messagebox(0,'조직개편화일의 기존 자료가 삭제됩니다.작업을 계속하시겠습니까?',
                         '알 림',MB_YESNO or $0030)= ID_NO then begin
               system.exit;
           end;
        end;
     end;
     p_help.caption := '작업중입니다.';
     Animated1.Play := True;

     Sockets1.IPAddr := passemp(cmdline,10);
     Sockets1.UserID := passemp(cmdline,11);
     Sockets1.Password := passemp(cmdline,12);

     Sockets1.command := '~/bin/Ibin/pic7020g  ' + P_empno + ' '
                      +  organdate.text + ' ' + paycl1.text + ' ' + paycl2.text ;
     Sockets1.Execute;
     LJobMsg := Copy(Sockets1.LastMsg, 1, 2);

     Animated1.Play := False;
     if LJobMsg = 'OK' then
        begin
             AReport.Preview;
        end
     else begin
        P_help.Caption := Sockets1.LastMsg;
        system.exit;
     end;

    P_Help.Caption := '작업이 완료되었습니다 !!. ';
    SendMessage(HelpPanel.handle,WM_PAINT,0,0);
end;


procedure Tpic7020gForm.BB_CloseClick(Sender: TObject);
begin
   if messagebox(0,'작업을 종료하시겠습니까?','확 인',MB_YESNO or $0030)= ID_YES then
      close
   else system.exit;
end;

procedure Tpic7020gForm.paycl1DblClick(Sender: TObject);
begin
  codeForm := TcodeForm.Create(Self);
  Try
    codeForm.FormData := 'BAND코드 열람';
    codeForm.DataVal1 := 'I112';

    codeForm.ShowModal;
    if   codeForm.CodeName = ''  then System.Exit;
    if   TmaskEdit(Sender).Tag = 1 then
         paycl1.Text     := codeForm.Code
    else paycl2.Text     := codeForm.Code;
  Finally
    codeForm.Free;
  End;

end;

end.
