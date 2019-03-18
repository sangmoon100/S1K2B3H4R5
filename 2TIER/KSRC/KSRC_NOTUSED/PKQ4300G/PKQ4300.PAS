{* ======================= Program Header ======================================
 PROGRAM-NAME   : PKQ4300G(전산매체 작성용 근로소득/퇴직소득 Interface 1년에 한번만 사용)
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME :
 Programmer     : 강륜종
 Version        : 10.01
 Date           : 2004.04.01.

Update Contents
 Version  date(yy.mm.dd)  programmer  description               relevant doc.no
 10.00     2004.04.01.     강륜종      PKQ4130G 프로그램을 수정하여 신규개발
                                       nbss에서 디스켓 작성을 할수 있도록 데이터 전송을 위하여...
============================================================================= *}
unit pkq4300;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Sockets, ExtCtrls, Spin, Mask, DB, DBTables,
  Tmax_session, Tmax_DataSetText, OnInsaCommon, Func, TmaxFunc;

type
  TM_KQ4130G = class(TForm)
    Panel1: TPanel;
    L_UserName: TLabel;
    L_Date: TLabel;
    Panel4: TPanel;
    P_Buttons: TPanel;
    BB_Close: TBitBtn;
    BB_Run: TBitBtn;
    P_Help: TPanel;
    Panel6: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Panel3: TPanel;
    ME_YY: TMaskEdit;
    SP_UpDown: TSpinButton;
    GB_Box1: TGroupBox;
    Qry1: TQuery;
    Database1: TDatabase;
    Panel8: TPanel;
    Panel5: TPanel;
    Bevel1: TBevel;
    Label8: TLabel;
    RB_SumKind2: TRadioButton;
    Label1: TLabel;
    Label3: TLabel;
    Panel2: TPanel;
    Label7: TLabel;
    ME_restorg: TMaskEdit;
    ME_restdept: TMaskEdit;
    P_deptname: TPanel;
    Button1: TButton;
    GroupBox1: TGroupBox;
    Bevel2: TBevel;
    Label11: TLabel;
    RB_YS: TRadioButton;
    TDS_batch: TTMaxDataSet;
    TMaxSession: TTMaxSession;
    Memo1: TMemo;
    Label4: TLabel;
    procedure BB_CloseClick(Sender: TObject);
    procedure SP_UpDownDownClick(Sender: TObject);
    procedure SP_UpDownUpClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BB_RunClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RB_Click(Sender: TObject);
    procedure RB_SumKind1Click(Sender: TObject);
    procedure RB_SumKind2Click(Sender: TObject);
    procedure ME_restdeptChange(Sender: TObject);
    procedure ME_restorgChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure RB_YSClick(Sender: TObject);
  private
    { Private declarations }
    ActiveFlag    : Boolean;
  public
    { Public declarations }
    Empno         : String[04];           {... 사번                          ...}
    KorName       : String[12];           {... 성명                          ...}
    PassWord      : String[10];           {... 패스워드                      ...}
    Grade         : String[10];           {... 사용등급                      ...}
    UserID        : String[20];
    DBPasswd      : String[20];
    Choice        : String[01];
    CurDate       : String[20];           {... 서버날짜                      ...}
    FixMon        : String[06];           {... 최종마감년월                  ...}

    Function  Add_Months( Month : String ; N : Integer ) : String;
    Procedure  Display_Msg2(p_str:string);   //Dsa2000
    Function  Check_Valid : Boolean;
    Function  Check_Date( InDate : String ) : Boolean;
    Procedure SetUp;
  end;

var
  M_KQ4130G: TM_KQ4130G;

implementation

{$R *.DFM}

uses
    KEmpNo, Pass, userhelp, DEPT2LIB;

{===============================================================================
 ======================  < User Define Functions >  ============================
 ===============================================================================}

 {===============================================================================
         기준월 + N 개월한 날짜를 구하는 함수.
 ===============================================================================}
Function TM_KQ4130G.Add_Months( Month : String ; N : Integer ) : String;
begin
     Qry1.Close;
     Qry1.Sql.Clear;
     Qry1.Sql.Add( ' SELECT  TO_CHAR( ADD_MONTHS( TO_DATE(:Month,''YYYYMM''),   ' );
     Qry1.Sql.Add( '                  :N ),''YYYYMM'' )                         ' );
     Qry1.Sql.Add( ' FROM DUAL                                                  ' );
     Qry1.ParamByName('Month').AsString := Month;
     Qry1.ParamByName('N').AsInteger    := N;
     Qry1.Open;
     Result := Qry1.Fields[0].AsString;
     Qry1.Close;
end;

{==============================================================================
         서버 Program 호출 전에 호출에 사용된 parameter 값들을 조사하는
         함수.
 ==============================================================================}
Function TM_KQ4130G.Check_Valid : Boolean;
var
    Tem :String;
begin
     if Check_Date(Tem) then
        Result := True
     else
        Result := False;
end;

{==============================================================================
         집계기준년월을 Check하는 함수.
 ==============================================================================}
Function TM_KQ4130G.Check_Date( InDate : String ) : Boolean;
var
   Temp   : Real;
begin
     InDate := ME_YY.Text;

     if Length(trim(ME_YY.Text)) <> 4 then
     begin
         P_Help.Caption := '   집계기준년도를 4자리로 입력하십시요...';
         ME_YY.SetFocus;
         Result         := False;
         System.Exit;
     end;

{     InDate := Copy(InDate,1,4) + DateSeparator + Copy(InDate,5,2) + DateSeparator + '01';
     Try
     Temp   := StrToDate(InDate);
     Except on EConvertError do
            begin
                 P_Help.Caption  := '   존재하지 않는 년도입니다. 확인하시고 다시 입력하세요...';
                 ME_YY.SetFocus;
                 Result          := False;
                 System.Exit;
            end;
     end;

     P_Help.Caption := '';
     Result         := True; }
end;

//2003.09.03. Dsa2000  소켓 컴포넌트 바뀌면서 소스 수정.
Procedure TM_KQ4130G.Display_Msg2(p_str:String);
var
   i,j     : LongInt;
   Temp    : Array[0..1000] of Char;
   HostStr : String;
begin
     i        := 0;
     j        := 0;
     HostStr  := '';
     for i := 0 to Length(p_str) - 1 do
     begin
       if p_str[i] = #10 then
         begin
           Memo1.Lines.Add( HostStr );
           HostStr := '';
         end
       else
         HostStr := HostStr + p_str[i];
     end;
     if HostStr <> '' then Memo1.Lines.Add( HostStr );
end;


{===============================================================================
 ======================  < User Define Procedures >  ===========================
 ===============================================================================}
{==============================================================================
         초기화를 수행하는 Procedure.
 ==============================================================================}
Procedure TM_KQ4130G.SetUp;
var
   i : integer;
   j : Integer;
begin
     P_Help.Caption := '   급여시스템에 접속 중입니다...';
     Empno          := PassEmp(cmdline,1);
     Korname        := PassEmp(cmdline,2);
     Password       := PassEmp(cmdline,3);
     Grade          := UpperCase(Copy(PassEmp(cmdline,4),3,1));
     UserID         := PassEmp(cmdline,5);
     DBPassWD       := PassEmp(cmdline,6);

     Database1.Connected := False;
     Application.ProcessMessages;
     for i := 0 to Database1.Params.Count-1 do
     begin
       if System.Pos('USER NAME', Database1.Params[i]) > 0 then
         Database1.Params[i] := 'USER NAME='+PassEmp(CmdLine,5);
       if System.Pos('PASSWORD', Database1.Params[i]) > 0 then
         Database1.Params[i] := 'PASSWORD='+PassEmp(CmdLine,6);
       if System.Pos('SERVER NAME', Database1.Params[i]) > 0 then
         Database1.Params[i] := 'SERVER NAME='+PassEmp(CmdLine,13);
     end;
     Database1.Connected := True;

     Qry1.Close;
     Qry1.Sql.Clear;
     Qry1.Sql.Add('SELECT TO_CHAR(SYSDATE,''YYYYMMDDHH24MISSD'') D,      ');
     Qry1.Sql.Add('       TO_CHAR(ADD_MONTHS(SYSDATE,-2),''YYYY'') DD ');
     Qry1.Sql.Add('FROM DUAL ');
     Qry1.Open;
     CurDate    := Qry1.FieldByName('D').AsString;
     ME_YY.Text := Qry1.FieldByName('DD').AsString;
     Qry1.Close;

     L_Date.Caption      := Copy(CurDate,1,4) + '-' + Copy(CurDate,5,2) + '-' +
                            Copy(CurDate,7,2);
     L_UserName.Caption  := KorName+ '(' + empno + ')';
     Application.ProcessMessages;
     P_Help.Caption      := '';
end;


{==============================================================================
 ===================       Event Handlers      ================================
 ============================================================================== }

//... '종료' 버튼을 눌렀을 경우 ...
procedure TM_KQ4130G.BB_CloseClick(Sender: TObject);
begin
     Close;
end;

//... '기준년월 Down'이 눌려 졌을 경우...
procedure TM_KQ4130G.SP_UpDownDownClick(Sender: TObject);
var
   Tmp : Integer;
begin
     if Check_Date(ME_YY.Text) then
//        ME_YY.Text := Add_Months(ME_YY.Text, -1);
        ME_YY.Text := IntToStr((StrToInt(ME_YY.Text) - 1));
end;

//... '기준년월 Up'이 눌려 졌을 경우...
procedure TM_KQ4130G.SP_UpDownUpClick(Sender: TObject);
begin
     if Check_Date(ME_YY.Text) then
//        ME_YY.Text := Add_Months(ME_YY.Text, 1);
        ME_YY.Text := IntToStr((StrToInt(ME_YY.Text) + 1));
end;


//... 폼이 생성될 경우 ...
procedure TM_KQ4130G.FormCreate(Sender: TObject);
begin
   ActiveFlag := True;

   //2004.12. dsa2000   Rexec 대체서비스 개발하여 수정작업함.(보안문제로)
     TMaxSession.ServiceTimeOut := 1000;

     TMaxSession.Connect  := False;
     TMaxSession.Host     := Hinsa_Param(cmdline,10);
     TMaxSession.Port     := '9999';

     try
          TMaxSession.Connect := True;
          TMaxSession.TMax_Begin(5000);
     except
          Application.MessageBox(PChar('APP서버 접속 실패'),'에러',mb_ok);
          Application.Terminate;
          Exit;
     end;     
end;

//... '실행'이 눌려 졌을 경우...
procedure TM_KQ4130G.BB_RunClick(Sender: TObject);
var
   Pstr    : String;
   JobStep : String;
   FrEmpNo : String;
   ToEmpNo : String;
   SumKind : String;
   Temp    : String;
   sSys    : String;
   Rundate,  ProgId, CmdStr   : String;  //서비스 개발...
begin
   P_Help.Caption := '';
   Memo1.Clear;
   if Check_Valid then
   begin
     Screen.CurSor := CrHourGlass;
     JobStep       := 'Y';
     //=====================================================================//
     if  RB_YS.Checked then 
       begin
         if length(ME_restdept.text) < 5  then    //휴직자 지정부서 check
           begin
             Application.MessageBox('휴직자 부서코드를 확인하세요','작업안내', mb_OK) ;
             exit;
           end;

         p_Help.Caption   := '  재직자/퇴직자 연말정산 데이터 처리 중 ... ';
         Memo1.Clear;

         FM_Tmax           := TFM_Tmax.Create(Self);
         FM_Tmax.T_Session := TMaxSession;
         Rundate           := Copy(FM_Tmax.GetData('sysdate','',''),1,14);

         ProgId  := 'pkdiskerp1';
//         CmdStr  := '/hper8/HINSA/proc/bin/ERPbin/pkdiskerp1'+' '
         CmdStr  := '/hper/insa/HINSA/proc/bin/ERPbin/pkdiskerp1'+' '
                    +ME_YY.Text+' '+ME_restorg.text+' '+ME_restdept.text+' '
                    +Empno+' '+ProgId+' '+Rundate;
       end
     //=====================================================================//
     else if  RB_SumKind2.Checked then
       begin
         p_Help.Caption   := '  퇴직소득처리 중 ... ';
         Memo1.Clear;

         FM_Tmax           := TFM_Tmax.Create(Self);
         FM_Tmax.T_Session := TMaxSession;
         Rundate           := Copy(FM_Tmax.GetData('sysdate','',''),1,14);
         
         ProgId  := 'pkdiskerp2';
//         CmdStr  := '/hper8/HINSA/proc/bin/ERPbin/pkdiskerp2'+' '
         CmdStr  := '/hper/insa/HINSA/proc/bin/ERPbin/pkdiskerp2'+' '
                    +ME_YY.Text+' '+Empno+' '+ProgId+' '+Rundate;
       end
     else
       begin
             Application.MessageBox('먼저 작업구분을 선택하세요.','작업안내',mb_ok               );
             Exit;
       end;
     //=============================================================================//
     //dsa2000  2004.12. Rexec 대체서비스 개발하여 수정작업함.(보안문제로)
     Memo1.Lines.Add('실행중...');
     with TDS_batch do
       begin
         Close;
         ServiceName := 'HINSA_batch';
         ClearFieldInfo;
         ClearParamInfo;
         AddParam('cmdstr', 300, CmdStr);
         Execute;

         Close;
         ServiceName := 'SHR0SSEL';
         ClearFieldInfo;
         ClearParamInfo;
         AddField('RESULT', ftString, 5000);
         Sql.Text := Format('SELECT RESULT FROM PYBATLOG '+
                            ' WHERE RUNDATE = ''%s''     '+
                            '   AND PROGID  = ''%s''     '+
                            ' ORDER BY SEQNO             ',[Rundate, ProgId ]);
         Open;

         while not Eof do
           begin
             Memo1.Lines.Add(FieldByName('RESULT').AsString);
             Next;
           end;
       end;
     //==========================================================================//

     if Pos('OK',Memo1.Text) > 0 then
       P_Help.Caption := '  작업이 성공적으로 완료되었습니다. '
     else
       P_Help.Caption := '  작업에 실패했습니다. ';
     Screen.CurSor := CrDefault;
   end
end;


procedure TM_KQ4130G.FormActivate(Sender: TObject);
begin
     if ActiveFlag then
        SetUp;
     ActiveFlag := False;

     Qry1.Close;
     Qry1.Sql.Clear;
     Qry1.Sql.Add('SELECT VALUE1 FROM PIMVARI WHERE GUBUN=''00'' AND SGUBUN = ''0001'' ');
     Qry1.Open;
     ME_restorg.Text := Qry1.FieldByName('Value1').AsString;
     Qry1.Close;     
end;

procedure TM_KQ4130G.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     if IDYes = Application.MessageBox('종료하시겠습니까?','확 인',MB_YesNo) then
        begin
             Action := caFree
        end
     else
         Action := caNone;
end;

procedure TM_KQ4130G.RB_Click(Sender: TObject);
begin
   ME_YY.visible     := True;
   SP_UpDown.visible   := True;
   ME_restorg.enabled  := false;
   ME_restdept.enabled := false;

   RB_YS.Checked       := False;
end;

procedure TM_KQ4130G.RB_SumKind1Click(Sender: TObject);
begin
   ME_YY.visible   := True;
   SP_UpDown.visible := True;
   ME_restorg.enabled := True;
   ME_restdept.enabled :=True;
   RB_YS.Checked := False;
end;

procedure TM_KQ4130G.RB_SumKind2Click(Sender: TObject);
begin
   ME_YY.visible   := True;
   SP_UpDown.visible := True;
   ME_restorg.enabled := False;
   ME_restdept.enabled := False;
   RB_YS.Checked := False;
end;

procedure TM_KQ4130G.ME_restdeptChange(Sender: TObject);
var
  Tem : String;
begin
  if length(ME_restdept.Text) < 5 then
    begin
       ME_restdept.setfocus;
       exit;
    end;

    Tem := 'SELECT  DEPTNAME                                    ' +
           'FROM    PYCDEPT                                     ' +
           'WHERE    ORGNUM   = '''+ME_restorg.text+'''        ' +
           ' AND    DEPTCODE  = '''+ME_restdept.text+'''       '   ;

    with qry1 do
    begin
        close;
        sql.clear;
        sql.add(Tem);
        Open;
        p_deptname.caption := '  ' + Fieldbyname('DEPTNAME').AsString;
        p_deptname.Font.Color := clBlue;
//        p_deptname.Font.Style := True;

          if p_deptname.caption = '' then
          begin
           Application.MessageBox('부서코드가 없습니다. 확인하세요','작업안내', mb_OK) ;
           ME_restdept.text := '' ;
          end;
        Close;
     end;
end;


procedure TM_KQ4130G.ME_restorgChange(Sender: TObject);
begin
  if length(ME_restorg.Text) < 3 then
     exit;
  ME_restdeptChange(Sender);
end;

procedure TM_KQ4130G.Button1Click(Sender: TObject);
begin
  Fdept2lib := TFdept2lib.Create(Self);
     Try
        Fdept2lib.Eorgnum.Text := ME_restorg.Text;
        Fdept2lib.Edeptcode.Text := ME_restdept.Text;
        Fdept2lib.ShowModal;
        If Fdept2lib.GIcloseChk = -1 then Exit;
        ME_restdept.text := Fdept2lib.GSdeptcode;
           if Fdept2lib.GSdeptname = '' then begin
              P_deptname.caption := '** 부서 코드 **';
           end else
              P_deptname.caption := Fdept2lib.GSdeptname;
        ME_restorg.Text := Fdept2lib.Eorgnum.Text;
     Finally
        Fdept2lib.Free;
     end;
end;

procedure TM_KQ4130G.RB_YSClick(Sender: TObject);
begin
   ME_YY.visible       := True;
   SP_UpDown.visible   := True;
   ME_restorg.enabled  := false;
   ME_restdept.enabled := false;

   RB_SumKind2.Checked := False;
end;

end.
