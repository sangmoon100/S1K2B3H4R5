{/* ======================= Program Header ======================================
 PROGRAM-NAME   : PKY1110A(월급여 생성/계산[파견직])
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 파견용역비
 Programmer     : 지순미
 Version        : 1.00
 Date           : 2017.02.22

Update Contents
   Version    date(yy.mm.dd)     programmer      description     relevant doc.no
   1.00       2017.02.22         지순미          PKC1081G(급여생성) 프로그램을 ID 변경
============================================================================= *}
unit PKY1110A1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Mask, Sockets, DB, DBTables, Grids,
  DBGrids, Tmax_DataSetText, Tmax_session, OnTmaxInsaData, FormMon1 ,OnInsaCommon, Ora,
  KeyEmpnoY, Func, Pass ;

type
  TFM_Main = class(TForm)
    Panel1: TPanel;
    L_UserName: TLabel;
    L_Date: TLabel;
    maintitle: TPanel;
    Panel4: TPanel;
    Label1: TLabel;
    P_Buttons: TPanel;
    BB_Close: TBitBtn;
    P_Help: TPanel;
    Label3: TLabel;
    Panel6: TPanel;
    BB_PayGen: TBitBtn;
    SP_SearchFrEmpNO: TSpeedButton;
    SP_SearchToEmpNO: TSpeedButton;
    SpeedButton1: TSpeedButton;
    Label8: TLabel;
    Label9: TLabel;
    Panel5: TPanel;
    E_FrEmpNO: TEdit;
    Panel8: TPanel;
    E_ToEmpNo: TEdit;
    Panel7: TPanel;
    ME_PayDate: TMaskEdit;
    Panel3: TPanel;
    P_CpayDate: TPanel;
    P_Count1: TPanel;
    P_HpayDate: TPanel;
    P_Count2: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    DBGrid1: TDBGrid;
    Memo1: TMemo;
    TMaxSession: TTMaxSession;
    TDS_batch: TTMaxDataSet;
    Label2: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure BB_CloseClick(Sender: TObject);
    procedure SP_SearchFrEmpNOClick(Sender: TObject);
    procedure SP_SearchToEmpNOClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BB_PayGenClick(Sender: TObject);
    procedure E_FrEmpNOEnter(Sender: TObject);
    procedure E_ToEmpNoEnter(Sender: TObject);
    procedure ME_PayDateEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }

    CPayDate      : String[06];           {... 월급여마스터의 지급년월       ...}
    CPayCount     : Integer;              {... 월급여마스터의 레코드건수     ...}
    HPayDate      : String[06];           {... 월급여이력의 지급년월         ...}
    HPayCount     : Integer;              {... 월급여이력의 레코드건수       ...}
    ExistAll      : Boolean;
    ActiveFlag    : Boolean;
    Rundate,  ProgId, CmdStr   : String;  //서비스 개발...

  public
    { Public declarations }
    Procedure Get_CurPayDate;
    Procedure Read_CurState;
    Procedure SetUp;
    Function  Check_Valid : Boolean;
    Function  Check_PayDate : Boolean;
    Function  Check_PayBank : Boolean;
    Function  Check_Ymanager : Boolean;
    procedure Callpkc1082c;
    function  CheckYManagerFirst:boolean;   //일반직 급여 최초 생성시 
  end;

var
  FM_Main: TFM_Main;

implementation

{$R *.DFM}

uses userhelp, Formmon2;  //Calen2,KEmpNo,Pass,

{===============================================================================
 ======================  < User Define Functions >  ============================
 ===============================================================================}

{==============================================================================
         서버 Program 호출 전에 호출에 사용된 parameter 값들을 조사하는
         함수.
 ==============================================================================}

Function TFM_Main.Check_Valid : Boolean;
var
     temp   : Real;
begin
     if (Check_Ymanager = False) then
     begin
          Application.MessageBox('파견직 모드에서는 정규직 사번에 대한 작업을'+#13+
                                 '할 수 없습니다.','작업안내',MB_OK+$0030);
          Result := False;
          System.Exit;
     end;

     if Length(E_FrEmpNo.Text) <> 4 then
     begin
          P_Help.Caption := '   ''사번From''이 유효하지 않습니다.';
          Result := False;
          System.Exit;
     end;

     if Length(E_ToEmpNo.Text) <> 4 then
     begin
          P_Help.Caption := '   ''사번To''가 유효하지 않습니다...';
          Result := False;
          System.Exit;
     end;

     Try
          temp := StrToDate(Copy(ME_PayDate.Text,1,4 ) + DateSeparator + Copy(ME_PayDate.Text,5,2) + DateSeparator + '01');
     Except
          on EConvertError do
          begin
               P_Help.Caption := '   ''급여지급월''이 유효하지 않습니다...';
               Result := False;
               System.Exit;
          end;
     end;

     Result := True;
     P_Help.Caption := '';
end;

{===============================================================================
          추출전에 급여지급월에 대한 점검을 하는 함수.
 ===============================================================================}
Function TFM_Main.Check_PayDate : Boolean;
begin
     //... 작업지급년월 > 현재화일 지급년월 ...
     if ME_PayDate.Text > CPayDate then
     begin
          if HPayDate < CPayDate then
          begin

                if(CheckYManagerFirst) then result := true
                else begin
                   Application.MessageBox('  전월 자료가 보관되지 않았습니다. 이력보관작업을 먼저 하십시요.','[작업안내]',MB_OK+MB_ICONWARNING);
                   Result         := False;
                end;
          end
          else
          begin
               if (HPayDate = CPayDate) then
               begin
                    if not ExistAll then
                    begin
                         Application.MessageBox('  이력보관된 자료의 수가 상이합니다. 개발자와 상의하시기 바랍니다.','[작업안내]',MB_OK+MB_ICONWARNING);
                         Result := False;
                    end
                    else
                         Result := True;
               end
               else
                    Result := True;
          end;
     end
     else
     begin
          if ME_PayDate.Text = CPayDate then
          begin
               if IDYes = Application.MessageBox('현 작업자료를 삭제하고 다시 추출합니다. 확실히 작업하시겠습니까?','[확인]',MB_YesNO+MB_ICONQUESTION ) then
                  Result := True
               else
                  Result := False;
          end
          else
               Result := True;
     end;

     P_Help.Caption := '';
end;

{==============================================================================
             최초 작업시
 ==============================================================================}
function TFM_Main.CheckYManagerFirst:boolean;
var
     qq : TOraQuery;
     hiscnt : integer;
begin
     Screen.Cursor  := CrHourGlass;
     P_Help.Caption := '   현재 최초 급여작업 여부를 확인하고 있습니다.';
     Application.ProcessMessages;
     

     qq := TOraQuery.Create(Nil);
     qq.Session := Ora_Session;

     Try
       with qq do
       begin

            Close;
            SQL.Clear;
            SQL.Add('select count(*) cnt from pkhpyhis ');
            SQL.Add(' where empno like ''Y%''          ');
            Open;

            hiscnt := fieldbyname('CNT').asinteger;

            if(hiscnt>0) then result := false
            else result := true;

       end;
     Finally
       qq.Free;
     end;

     Screen.Cursor  := CrDefault;
     P_Help.Caption := '';
end;

{==============================================================================
             현재의 작업현황을 읽는 Procedure.
 ==============================================================================}
Procedure TFM_Main.Read_CurState;
var
     qq : TOraQuery;
begin
     Screen.Cursor  := CrHourGlass;
     P_Help.Caption := '   현재 DB에 저장된 내역을 읽고 있습니다.';
     Application.ProcessMessages;

     qq := TOraQuery.Create(Nil);
     qq.Session := Ora_Session;

     {... 현 월급여의 작업기준년도 ...}
     Try
          with qq do
          begin
               P_Help.Caption := '   월급여내역을 읽고 있습니다.';
               Application.ProcessMessages;

               Close;
               SQL.Clear;
               SQL.Add('select nvl(max(paydate), ''#'') from pkmpycalc  ');
               SQL.Add(' where empno like ''Y%''                        ');
               Open;

               CPayDate := Fields[0].AsString;

               if Fields[0].AsString <>  '#' then
               begin
                    Close;
                    SQL.Clear;
                    SQL.Add('select Count(*) from pkmpycalc      ');
                    SQL.Add(' where paydate = :paydate           ');
                    SQL.Add('  and empno like ''Y%''             ');

                    ParamByName('paydate').AsString := cPayDate;
                    Open;

                    CPayCount  := Fields[0].AsInteger;
               end
               else
                    CPayCount :=  0;

               if CPayDate <> '#' then P_CpayDate.Caption := Copy(CpayDate,1,4) + '-' + Copy(CpayDate,5,2)
               else                    P_CpayDate.Caption := '이력없음';

               if CpayCount > 0 then P_Count1.Caption := FormatFloat('#,##0',CpayCount)
               else                  P_Count1.Caption := '이력없음';

               {... 최종 월급여의 이력보관 기준년도, 건수 출력 ...}
               P_Help.Caption := '   월급여이력내역을 읽고 있습니다...';

               Close;
               SQL.Clear;
               SQL.Add('select nvl(max(paydate), ''#'') from pkhpyhis ');
               SQL.Add(' where empno like ''Y%''                      ');
               Open;

               HPayDate := Fields[0].AsString;

               if HPayDate <> '#' then
               begin
                    Close;
                    SQL.Clear;
                    SQL.Add('select Count(*) from pkhpyhis        ');
                    SQL.Add(' where paydate = :paydate            ');
                    SQL.Add('  and empno like ''Y%''              ');

                    ParamByName('paydate').AsString := HPayDate;
                    Open;
                    HPayCount := Fields[0].AsInteger;
               end
               else
                    HPayCount := 0;

               if HpayDate <> '#' then P_HpayDate.Caption := Copy(HpayDate,1,4) + '-' + Copy(HpayDate,5,2)
               else                    P_HpayDate.Caption := '이력없음';

               if HpayCount > 0 then P_Count2.Caption := FormatFloat('#,##0',HpayCount)
               else                  P_Count2.Caption := '이력없음';

               Close;
               SQL.Clear;
               SQL.Add('select paydate, empno                   ');
               SQL.Add('  from pkmpycalc                        ');
               SQL.Add(' where empno like ''Y%''                ');

               SQL.Add(' minus                                  ');

               SQL.Add('select paydate, empno                   ');
               SQL.Add('  from pkhpyhis                         ');
               SQL.Add(' where paydate like :paydate            ');
               SQL.Add('   and empno like ''Y%''                ');

               ParamByName('paydate').AsString := Copy(P_HpayDate.Caption,1,4)+'%' ;  //dsa2000 추가
               Open;

               if RecordCount <> 0 then ExistAll := False
               else                     ExistAll := True;

          end;
     Finally
          qq.Free;
     end;

     Screen.Cursor  := CrDefault;
     P_Help.Caption := '';
end;

{==============================================================================
         현급여지급월을 읽는 Procedure.
 ==============================================================================}
Procedure TFM_Main.Get_CurPayDate;
var
     qq : TOraQuery;
begin
     qq := TOraQuery.Create(Nil);
     qq.Session := Ora_Session;

     Try
          with qq do
          begin
               Close;
               SQL.Clear;
               SQL.Add('select cpaydate from pkcpbas  ');
               Open;
               ME_PayDate.Text := FieldByName('cpaydate').AsString;
          end;
     Finally
          qq.Free;
     end;
end;

{==============================================================================
         초기화를 수행하는 Procedure.
 ==============================================================================}
Procedure TFM_Main.SetUp;
begin
     P_Help.Caption := '   급여시스템에 접속 중입니다.';

     Application.ProcessMessages;

     Pempno   := PassEmp(cmdline,1);
     Pkorname := PassEmp(cmdline,2);
     Pgrade   := Passemp(cmdline,4);

     if (Copy(Pempno,1,1) = 'D') or ((Copy(Pgrade,3,1) <= 'C') and (fn_YmanagerCheck))  then
     begin
          maintitle.Color    := clTeal;
          maintitle.Caption  := '월급여 생성/계산[파견직]';
          E_FrEmpNO.Text     := 'Y000';
          E_ToEmpNO.Text     := 'YZZZ';
     end
     else
     begin
          MessageBox(handle,'파견직 관리자 외에는 열람할 수 없습니다.','알 림',MB_OK or $0030);
          Close;
     end;

     L_Date.Caption     := Fn_GetDateStr;
     L_UserName.Caption := Pkorname+ '(' + Pempno + ')';

     Get_CurPayDate;

     Read_CurState;
     P_Help.Caption := '  ''사번''을 입력하십시요.';
end;

{==============================================================================
 ===================       Event Handlers      ================================
 ============================================================================== }

procedure TFM_Main.FormActivate(Sender: TObject);
begin
     if ActiveFlag then SetUp;

     ActiveFlag := False;
end;

//... '종료' 버튼을 눌렀을 경우 ...
procedure TFM_Main.BB_CloseClick(Sender: TObject);
begin
     Close;
end;

procedure TFM_Main.SP_SearchFrEmpNOClick(Sender: TObject);
begin
     FKeyEmpnoY := TFKeyEmpnoY.Create(Self);

     try
          if E_FrEmpNO.Text = 'Y000' then
               FKeyEmpnoY.EdEmpno.Text := ''
          else
               FKeyEmpnoY.EdEmpno.Text := Trim(E_FrEmpNO.Text);
          FKeyEmpnoY.ShowModal;

          if FKeyEmpnoY.CloseChk = -1 then Exit;

          E_FrEmpNO.Text     := FKeyEmpnoY.v_KeyEmpno;

     finally
          FKeyEmpnoY.Free;
     end;
end;

procedure TFM_Main.SP_SearchToEmpNOClick(Sender: TObject);
begin
     FKeyEmpnoY := TFKeyEmpnoY.Create(Self);

     try
          if E_ToEmpNO.Text = 'YZZZ' then
               FKeyEmpnoY.EdEmpno.Text := ''
          else
               FKeyEmpnoY.EdEmpno.Text := Trim(E_ToEmpNO.Text);
          FKeyEmpnoY.ShowModal;

          if FKeyEmpnoY.CloseChk = -1 then Exit;

          E_ToEmpNO.Text     := FKeyEmpnoY.v_KeyEmpno;

     finally
          FKeyEmpnoY.Free;
     end;
end;

procedure TFM_Main.SpeedButton1Click(Sender: TObject);
var
     Month2Form : TMonth2Form;
begin
    Try
        MonthForm := TMonthForm.Create(Self); 
        MonthForm.ShowModal;    
        if MonthForm.DayCaption <> '' then              
           ME_PayDate.Text := Copy(MonthForm.DayCaption,1,6); 
    Finally 
        MonthForm.Free; 
    End;      
end;



procedure TFM_Main.BB_PayGenClick(Sender: TObject);
begin
{     if (Check_PayBank = false) then
     begin
          Application.MessageBox('월급여 생성을 할 수 없습니다. '+#13+
                                 '급여은행[계좌] 또는 식교은행[계좌]를 입력하지 않은 사원이 있습니다.'+#13+
                                 '급여마스터에서 급여은행[계좌] 또는 식교은행[계좌]를 먼저 입력 후 '+#13+
                                 '다시 작업을 실행하시기 바랍니다.',
                                 '[작업안내]',MB_OK+MB_ICONWARNING);
          Exit;
     end;}

     if Check_Valid AND Check_PayDate then
     begin
          P_Help.Caption   := '  월급여 생성 중. ';
          BB_PayGen.CurSor := CrHourGlass;

          Memo1.Clear;
          Memo1.Lines.Add('실행중...');

          Rundate := Copy(fn_GetDateTimeStr,1,14);

          ProgId  := 'pky1110g';
          CmdStr  := '/hper/insa/HINSA/proc/bin/Kbin/pky1110g'+' '+ME_PayDate.Text+' '
                     +E_FrEmpNo.Text+' '+E_ToEmpNo.Text+' '+PEmpno+' '+ProgId+' '+Rundate ;

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
                                  ' ORDER BY to_number(SEQNO)  ',[Rundate, ProgId ]);
               Open;

               while not Eof do
               begin
                    Memo1.Lines.Add(FieldByName('RESULT').AsString);
                    Next;
               end;
          end;    //with TDS_batch do

          if Pos('OK',Memo1.Text) > 0 then
                P_Help.Caption := '  월급여 생성이 성공적으로 완료되었습니다. '
          else
          begin
               Memo1.Clear;
               P_Help.Caption := '  월급여생성에 실패했습니다. ';
          end;

          BB_PayGen.CurSor := CrDefault;
          Read_CurState;
     end;
end;


procedure TFM_Main.E_FrEmpNOEnter(Sender: TObject);
begin
     P_Help.Caption := '   ''사번From''을 입력하세요...';
end;

procedure TFM_Main.E_ToEmpNoEnter(Sender: TObject);
begin
     P_Help.Caption := '   ''사번To''을 입력하세요...';
end;

procedure TFM_Main.ME_PayDateEnter(Sender: TObject);
begin
     P_Help.Caption := '   ''급여지급월''을 입력하세요...';
end;

procedure TFM_Main.FormCreate(Sender: TObject);
begin
     OraConnect;

     Pempno   := PassEmp(cmdline,1);
     Pkorname := PassEmp(cmdline,2);
     Pgrade   := Passemp(cmdline,4);

     ActiveFlag := True;

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

procedure TFM_Main.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     if IDYes = Application.MessageBox('종료하시겠습니까?','[확인]',MB_YesNO+MB_ICONQUESTION) then
        Action := caFree
     else
        Action := caNone;
end;

function TFM_Main.Check_Ymanager: Boolean;
begin
     Result := True;
     if ( (Copy(E_FrEmpNO.Text,1,1) <> 'Y') or (Copy(E_ToEmpNO.Text,1,1) <> 'Y') ) then Result := False;
end;


{*=============================================================================
   30.05      1999.07.27         이랑교          급여,식교이체은행체크 루틴 추가
============================================================================= *}
function TFM_Main.Check_PayBank:boolean;
var
     qq : TOraQuery;
begin
     qq := TOraQuery.Create(Nil);
     qq.Session := Ora_Session;

     Try
          with qq do
          begin
               Close;
               SQL.Add('select a.empno 사번,                                  ');
               SQL.Add('       a.korname 성명,                                ');
               SQL.Add('       nvl(b.codename,''급여은행없슴'') 급여은행,     ');
               SQL.Add('       nvl(a.payacnt ,''급여계좌없슴'') 급여계좌,     ');
               SQL.Add('       nvl(c.codename,''식교은행없슴'') 식교은행,     ');
               SQL.Add('       nvl(payacnt1,''식교계좌없슴'') 식교계좌        ');
               SQL.Add('  from pkmpmas a, pyccode b, pyccode c                ');
               SQL.Add(' where (replace(a.paybank ,'' '','''') is null or     ');
               SQL.Add('        replace(a.payacnt ,'' '','''') is null or     ');
               SQL.Add('        replace(a.paybank1,'' '','''') is null or     ');
               SQL.Add('        replace(a.payacnt1,'' '','''') is null )      ');
               SQL.Add('   and b.codeid(+) =''K910''                          ');
               SQL.Add('   and b.codeno(+) = a.paybank                        ');
               SQL.Add('   and c.codeid(+) =''K910''                          ');
               SQL.Add('   and c.codeno(+) = a.paybank1                       ');
               SQL.Add('   and a.payyn  =''Y''                                ');
               SQL.Add('   and a.empno  not like ''M%''                       ');
               SQL.Add('   and a.empno like ''Y%''                            ');
               SQL.Add(' order by a.empno                                     ');
               Open;

               if recordcount > 0 then
               begin
                    DBGrid1.height := 107;
                    DBGrid1.visible := True;
                    result :=False;
               end
               else
               begin
                    DBGrid1.height  := 2;
                    DBGrid1.visible := False;
                    result :=True;
               end
          end;
     Finally
          qq.Free;
     end;

     DBGrid1.height  := 2;
     DBGrid1.visible := False;
     result :=True;
     
end;



//------------------------------ User Procedure --------------------------------
// Call  실직기금공제자 LIST 프로그램
procedure TFM_Main.Callpkc1082c;
begin

end;

end.

