{===================== Program Header ==========================================
 PROGRAM-NAME   : PKY1040A(파견직 근태 마감 및 집계)
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 근태
 Programmer     : 지순미
 Version        : 1.0
 Date           : 2017.01.20
                                                    
Update Contents
   Version    date(yy.mm.dd)     programmer      description     relevant doc.no
   1.0        2017.01.20         지순미          PKA4060G에서 정규직소스와 분리
================================================================================}
unit PKY1040A1;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, DB, DBTables, StdCtrls, Buttons, Mask, ExtCtrls,
  Kylib1, Calen1, Gauges, Tmax_session, Tmax_DataSetText, OnInsaCommon, Ora,
  TmaxFunc, Func, KeyEmpnoY, Pass;

type
  TFM_Main = class(TForm)
    Phelpmsg: TPanel;
    Panel19: TPanel;
    Lempno: TLabel;
    Lsysdate: TLabel;
    Panel3: TPanel;
    BBclose: TBitBtn;
    BBrun: TBitBtn;
    Panel2: TPanel;
    Panel4: TPanel;
    MEworkdate: TMaskEdit;
    Panel1: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Label1: TLabel;
    Panel7: TPanel;
    maintitle: TPanel;
    Panel8: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Panel10: TPanel;
    Panel11: TPanel;
    CBendyn: TComboBox;
    CByearyn: TComboBox;
    BBcancel: TBitBtn;
    TDS_batch: TTMaxDataSet;
    TMaxSession: TTMaxSession;
    MMLog: TMemo;
    Label5: TLabel;
    Panel12: TPanel;
    E_empnoFROM: TEdit;
    SB_empnoFROM: TSpeedButton;
    P_kornameFROM: TPanel;
    Label6: TLabel;
    E_empnoTO: TEdit;
    SB_empnoTO: TSpeedButton;
    P_kornameTO: TPanel;
    C_Gubun: TComboBox;
    Panel9: TPanel;
    procedure BBrunClick(Sender: TObject);
    procedure BBcloseClick(Sender: TObject);
    procedure CBendynChange(Sender: TObject);
    procedure CBendynDblClick(Sender: TObject);
    procedure CByearynChange(Sender: TObject);
    procedure CByearynDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SB_empnoFROMClick(Sender: TObject);
    procedure SB_empnoTOClick(Sender: TObject);
    procedure E_empnoExit(Sender: TObject);
    procedure C_GubunChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    YmanagerYN : boolean;
  public
    { Public declarations }
    procedure Work_Setup;    //일반직관리자 구분에따른 환경설정
  end;

var
  FM_Main: TFM_Main;

implementation

{$R *.DFM}


{-------------------------------- User Define----------------------------------}

procedure TFM_Main.Work_Setup;
var
     qq : TOraQuery;
begin
     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     Try
          with qq do
          begin
               SQL.Clear;
               Close;
               SQL.Add('select to_char(add_months(to_date(y_knteyymm, ''YYYYMM''), 1), ''YYYYMM'') knteyymm ');
               SQL.Add('  from pkcpbas ');
               Open;

               MEworkdate.Text := FieldByName('knteyymm').AsString; // 마감 다음달
               BBcancel.Enabled := False;
          end
     Finally
          qq.Free;
     end;
end;

{-------------------------------- MAIN ----------------------------------------}

procedure TFM_Main.FormCreate(Sender: TObject);
begin
     OraConnect;

     //2016.06.10 eyha TMax 접속 프로그램 변경
     TMaxSession.ServiceTimeOut := 1000;
     TMaxSession.Connect        := False;
     TMaxSession.EnvFileName    := GetHomeDir+'\newhana.env';
     TMaxSession.LabelName      := 'HANAROHPER';

     try
          TMaxSession.Connect := True;
          TMaxSession.TMax_Begin(5000);
     except
          Application.MessageBox(PChar('APP서버 접속 실패'),'에러',mb_ok);
          Application.Terminate;
          Exit;
     end;
end;

procedure TFM_Main.BBrunClick(Sender: TObject);
var
     totno : integer;
     Tem_end ,Tem_year ,TmpStr : String;
     Rundate,  ProgId,  CmdStr : String;  //서비스 개발...
     qq : TOraQuery;
begin
     if ((Copy(E_empnoFROM.Text,1,1) <> 'Y') or (Copy(E_empnoTO.Text,1,1) <> 'Y')) then
     begin
          Application.MessageBox('정규직 사번을 선택할 수 없습니다....','작업안내', mb_OK);
          E_empnoFROM.SetFocus;
          exit;
     end;

     if fn_IsDate(MEworkdate.Text+'01') = False then
     begin
          Application.MessageBox('작업기준년월을 정확히 입력하세요....','작업안내', mb_OK);
          MEworkdate.SetFocus;
          exit;
     end;

     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     Try
          with qq do
          begin
               Close;
               SQL.Clear;
               SQL.Add('select 1                                   ');
               SQL.Add('  from pkhduty                             '); // 근태내역
               Sql.Add(' Where duyymm = :duyymm                    ');
               SQL.Add('   and empno between :frEmpno and :toEmpno ');
               ParamByName('duyymm').AsString  := MEworkdate.Text;
               ParamByName('frEmpno').AsString := E_empnoFROM.Text;
               ParamByName('toEmpno').AsString := E_empnoTO.Text;
               Open;

               if RecordCount = 0 then
               begin
                    Application.MessageBox('작업년월의 작업대상자가 없습니다....','작업안내', mb_OK);
                    MEworkdate.SetFocus;
                    exit;
               end;

               if CBendyn.Text  = 'Y' then Tem_end  :=' 근태 마감,'
               else                        Tem_end  :=' 근태' ;

               if CByearyn.Text = 'Y' then Tem_year :=' 년간 집계,'
               else                        Tem_year :='' ;

               Phelpmsg.caption := Tem_end +Tem_year + ' 월별 집계 작업중 .. ';

               BBrun.Enabled    := False;
               BBclose.Enabled  := False;
               BBcancel.Enabled := True;


               //2004.11. Rexec 대체서비스 개발하여 수정작업함.(보안문제로)
               MMLog.Clear;
               MMLog.Lines.Add('실행중...');

               ///////////////////////////////////////////////////////////////////////
               FM_Tmax           := TFM_Tmax.Create(Self);
               FM_Tmax.T_Session := TMaxSession;
               Rundate           := Copy(FM_Tmax.GetData('sysdate','',''),1,14);

               {파견직 근태집계마감으로 변경
               ProgId   := 'pka4060g';
               CmdStr   := '/hper/insa/HINSA/proc/bin/Kbin/pka4060g ' + MEworkdate.Text + ' ' + CBendyn.Text + ' ' +
                            CByearyn.Text + ' ' + Pempno + ' ' + ProgId + ' ' + Rundate + ' ' +
                            Trim(E_empnoFROM.Text) + ' ' + Trim(E_empnoTO.Text);
               }
               ProgId   := 'pky1040g';
               CmdStr   := '/hper/insa/HINSA/proc/bin/Kbin/pky1040g ' + MEworkdate.Text + ' ' + CBendyn.Text + ' ' +
                            CByearyn.Text + ' ' + Pempno + ' ' + ProgId + ' ' + Rundate + ' ' +
                            Trim(E_empnoFROM.Text) + ' ' + Trim(E_empnoTO.Text);
               Application.ProcessMessages;
          end;
     Finally
          qq.Free;
     end;

     //dsa2000  End  Rexec 대체서비스로 수정 ........................................
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
          Sql.Text := Format('select result from pybatlog  '+
                             ' where rundate = ''%s''      '+
                             '   and progid  = ''%s''      '+
                             ' order by to_number(seqno)   ',[Rundate, ProgId]);
          Open;

          MMlog.Clear;

          while not eof do
          begin
               MMlog.Lines.Add(FieldByName('result').AsString);
               Next;
          end;
     end;


     if  (CBendyn.Text ='Y') and (Pos('OK', MMlog.Text) > 0) then
     begin
       qq := TOraQuery.Create(nil);
       qq.Session := Ora_Session;

       Try
          with qq do
          begin
               Close;
               SQL.Clear;
               SQL.Add('UPDATE  PKCPBAS                          ');
               SQL.Add('   SET  Y_KNTEYYMM = :workyymm           ');

               ParamByName('workyymm').AsString  := MEworkdate.Text;
               Execsql;
          end;
       Finally
          qq.Free;
       end;
     end;



     if Pos('OK', MMlog.Text) > 0 then Phelpmsg.caption := ' 근태 마감및 집계작업 완료'
     else                              Phelpmsg.caption := ' 근태 마감및 집계작업 실패';

     BBrun.Enabled    := True;
     BBclose.Enabled  := True;
     BBcancel.Enabled := False;
end;


{종료}
procedure TFM_Main.BBcloseClick(Sender: TObject);
begin
     Close;
end;

procedure TFM_Main.CBendynChange(Sender: TObject);
begin
     CBendyn.Text := UpperCase(CBendyn.Text);
     if (CBendyn.Text <> 'Y') and (CBendyn.Text <> 'N') then CBendyn.Text := 'Y';
end;

procedure TFM_Main.CBendynDblClick(Sender: TObject);
begin
     if CBendyn.Text = 'Y' then CBendyn.Text := 'N'
     else                       CBendyn.Text := 'Y';
end;

procedure TFM_Main.CByearynChange(Sender: TObject);
begin
     CByearyn.Text := UpperCase(CByearyn.Text);
     if (CByearyn.Text <> 'Y') and (CByearyn.Text <> 'N') then CByearyn.Text := 'Y';
end;

procedure TFM_Main.CByearynDblClick(Sender: TObject);
begin
     if CByearyn.Text = 'Y' then CByearyn.Text := 'N'
     else                        CByearyn.Text := 'Y';
end;


procedure TFM_Main.SB_empnoFROMClick(Sender: TObject);
begin
     FKeyEmpnoY := TFKeyEmpnoY.Create(self);
     Try
          if (E_empnoFROM.Text ='Y000') or (E_empnoFROM.Text ='YZZZ') then
          FKeyEmpnoY.EdEmpno.Text := ''
          else
          FKeyEmpnoY.EdEmpno.Text := E_empnoFROM.Text;
          FKeyEmpnoY.ShowModal;

          if FKeyEmpnoY.CloseChk <> -1 then
          begin
               E_empnoFROM.TExt := FKeyEmpnoY.v_KeyEmpno;
               P_kornameFROM.Caption := FKeyEmpnoY.v_KeyKorname;
          end;
     Finally
          FKeyEmpnoY.Free;
     end;
end;

procedure TFM_Main.SB_empnoTOClick(Sender: TObject);
begin
     FKeyEmpnoY := TFKeyEmpnoY.Create(self);
     Try
          if (E_empnoTO.Text ='Y000') or (E_empnoTO.Text ='YZZZ') then
          FKeyEmpnoY.EdEmpno.Text := ''
          else
          FKeyEmpnoY.EdEmpno.Text := E_empnoTO.Text;
          FKeyEmpnoY.ShowModal;

          if FKeyEmpnoY.CloseChk <> -1 then
          begin
               E_empnoTO.TExt   := FKeyEmpnoY.v_KeyEmpno;
               P_kornameTO.Caption := FKeyEmpnoY.v_KeyKorname;
          end;
     Finally
          FKeyEmpnoY.Free;
     end;
end;

procedure TFM_Main.E_empnoExit(Sender: TObject);
begin
     if ((Copy(E_empnoFROM.Text,1,1) <> 'Y') or (Copy(E_empnoTO.Text,1,1) <> 'Y')) then
     begin
          Application.MessageBox('정규직 사번에 대한 작업을'+#13+'할 수 없습니다!','작업안내', mb_OK+$0030);
          E_empnoFROM.Text := 'Y000';
          E_empnoTO.Text   := 'YZZZ';
          E_empnoFROM.SelectAll;
          System.Exit;
     end;
end;

procedure TFM_Main.C_GubunChange(Sender: TObject);
begin
     E_empnoFROM.Text := 'Y000';
     E_empnoTO.Text   := 'YZZZ';
end;

procedure TFM_Main.FormActivate(Sender: TObject);
var
     qq : TOraQuery;
begin
     Application.ProcessMessages;

     Pempno   := PassEmp(cmdline,1);
     Pkorname := PassEmp(cmdline,2);
     Pgrade   := Passemp(cmdline,4);

     Lempno.Caption   := Pkorname+'('+Pempno+')';
     Lsysdate.caption := fn_GetDateStr;

     if (Copy(Pempno,1,1) = 'D') or ((Copy(Pgrade,3,1) <= 'C') and fn_YmanagerCheck) then
     begin
          YmanagerYN        := True;
          C_Gubun.ItemIndex := 1;
          C_Gubun.Enabled   := False;
          C_GubunChange(nil);
          maintitle.Color   := clTeal;
          maintitle.Caption := '근태 마감 및 집계[파견직]';
     end
     else
     begin
          MessageBox(handle,'파견직 관리자 외에는 열람할 수 없습니다.','알 림',MB_OK or $0030);
          Close;
     end;

     Work_Setup;//일반직 관리자 여부에 따른 작업환경 세팅.
end;

end.

