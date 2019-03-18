{===================== Program Header ==========================================
 PROGRAM-NAME   : PKA4060G(근태 마감 및 집계)
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 근태
 Programmer     : 이인환
 Version        : 10.00
 Date           : 1997.12.01
                                                    
Update Contents
   Version    date(yy.mm.dd)     programmer      description     relevant doc.no
   10.00       1997.12.01         이인환          최초개발본      설계명세서
   20.00       2004.11.01         강륜종(dsa2000)              Rexec 대체서비스 개발하여 수정작업함.(보안문제로)
================================================================================}
unit pka40601;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, DB, DBTables, StdCtrls, Buttons, Mask, ExtCtrls,
  Kylib1, Calen1, Gauges, Tmax_session, Tmax_DataSetText, OnInsaCommon, Ora,
  TmaxFunc, Func, KeyEmpno, KeyEmpnoY, Pass;

type
  TFpka40601 = class(TForm)
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
    procedure BitBtn2Click(Sender: TObject);
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
  Fpka40601: TFpka40601;

implementation

uses pka40602;

{$R *.DFM}


{-------------------------------- User Define----------------------------------}

procedure TFpka40601.Work_Setup;
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
               if YmanagerYN then //일반직 관리자일경우.
                    SQL.Add('select to_char(add_months(to_date(y_knteyymm, ''YYYYMM''), 1), ''YYYYMM'') knteyymm ')
               else SQL.Add('select to_char(add_months(to_date(knteyymm,   ''YYYYMM''), 1), ''YYYYMM'') knteyymm ');
               SQL.Add('  from pkcpbas ');
               Open;

               MEworkdate.Text := FieldByName('knteyymm').AsString; // 마감 다음달
               BBcancel.Enabled := False;
          end
     Finally
          qq.Free;
     end;

     //2016.03.18 eyha 아래에서 처리됨에 따라서 삭제
     {P_kornameFROM.Caption := '';
     P_kornameTO.Caption   := '';
     if not(YmanagerYN) then   
     begin
          E_empnoFROM.Text := '0000';
          E_empnoTO.Text   := 'XXXX';
     end
     else
     begin
          E_empnoFROM.Text := 'Y000';
          E_empnoTO.Text   := 'YZZZ';
     end;      }

end;

{-------------------------------- MAIN ----------------------------------------}

procedure TFpka40601.FormCreate(Sender: TObject);
begin
     OraConnect;

     //2016.06.10 eyha TMax 접속 프로그램 변경
     TMaxSession.ServiceTimeOut := 1000;
     TMaxSession.Connect        := False;
     TMaxSession.EnvFileName    := GetHomeDir+'\newhana.env';
     TMaxSession.LabelName      := 'HANAROHPER';
//     TMaxSession.EnvFileName    := 'D:\SK_WORK\1. src\newhana.env'; //for test by 하은영


     try
          TMaxSession.Connect := True;
          TMaxSession.TMax_Begin(5000);
     except
          Application.MessageBox(PChar('APP서버 접속 실패'),'에러',mb_ok);
          Application.Terminate;
          Exit;
     end;
end;

procedure TFpka40601.BBrunClick(Sender: TObject);
var
     totno : integer;
     Tem_end ,Tem_year ,TmpStr : String;
     Rundate,  ProgId,  CmdStr : String;  //서비스 개발...
     qq : TOraQuery;
begin
     //2016.03.18 eyha 정규직을 선택시에는 정규직만, 파견직을 선택시에는 파견직만 처리가능하도록 체크기능 추가
     if C_Gubun.ItemIndex = 0  then
     begin
        if ((Copy(E_empnoFROM.Text,1,1) = 'Y') or (Copy(E_empnoTO.Text,1,1) = 'Y')) then
        begin
          Application.MessageBox('정규직 모드에서는 파견직 사번을 선택할 수 없습니다....','작업안내', mb_OK);
          E_empnoFROM.SetFocus;
          exit;
        end;
     end
     else
     begin
        if ((Copy(E_empnoFROM.Text,1,1) <> 'Y') or (Copy(E_empnoTO.Text,1,1) <> 'Y')) then
        begin
          Application.MessageBox('파견직 모드에서는 정규직 사번을 선택할 수 없습니다....','작업안내', mb_OK);
          E_empnoFROM.SetFocus;
          exit;
        end;
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

               ProgId   := 'pka4060g';
               CmdStr   := '/hper/insa/HINSA/proc/bin/Kbin/pka4060g ' + MEworkdate.Text + ' ' + CBendyn.Text + ' ' +
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


     //2016.10.10 eyha 근태마감시 정규직/파견직 동시에 마감자일경우  pka4060g.pc에서 월마감여부를 갱신할 수 없음에  추가처리(YManager 때문에 무조건 파견직으로 Y_KNTEYYMM 갱신됨
     if  (CBendyn.Text ='Y') and (Pos('OK', MMlog.Text) > 0) then
     begin
       qq := TOraQuery.Create(nil);
       qq.Session := Ora_Session;

       Try
          with qq do
          begin
               Close;
               SQL.Clear;
               SQL.Add('UPDATE  PKCPBAS                            ');
               if  C_Gubun.ItemIndex = 0 then
                 SQL.Add('   SET  knteyymm = :workyymm             ')
               else
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
procedure TFpka40601.BBcloseClick(Sender: TObject);
begin
     Close;
end;


procedure TFpka40601.BitBtn2Click(Sender: TObject);
begin
     Fpkq40602.ShowModal;
end;


procedure TFpka40601.CBendynChange(Sender: TObject);
begin
     CBendyn.Text := UpperCase(CBendyn.Text);
     if (CBendyn.Text <> 'Y') and (CBendyn.Text <> 'N') then CBendyn.Text := 'Y';
end;

procedure TFpka40601.CBendynDblClick(Sender: TObject);
begin
     if CBendyn.Text = 'Y' then CBendyn.Text := 'N'
     else                       CBendyn.Text := 'Y';
end;

procedure TFpka40601.CByearynChange(Sender: TObject);
begin
     CByearyn.Text := UpperCase(CByearyn.Text);
     if (CByearyn.Text <> 'Y') and (CByearyn.Text <> 'N') then CByearyn.Text := 'Y';
end;

procedure TFpka40601.CByearynDblClick(Sender: TObject);
begin
     if CByearyn.Text = 'Y' then CByearyn.Text := 'N'
     else                        CByearyn.Text := 'Y';
end;


procedure TFpka40601.SB_empnoFROMClick(Sender: TObject);
begin
     if YmanagerYN = False then
     begin
          FKeyEmpno := TFKeyEmpno.Create(self);
          Try
               FKeyEmpno.EdEmpno.Text := E_empnoFROM.Text;
               FKeyEmpno.ShowModal;

               if FKeyEmpno.CloseChk <> -1 then
               begin
                    E_empnoFROM.TExt   := FKeyEmpno.v_KeyEmpno;
                    P_kornameFROM.Caption := FKeyEmpno.v_KeyKorname;
               end;
          Finally
               FKeyEmpno.Free;
          end;
     end
     else
     begin
          FKeyEmpnoY := TFKeyEmpnoY.Create(self);
          Try
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
end;

procedure TFpka40601.SB_empnoTOClick(Sender: TObject);
begin
     if YmanagerYN = False then
     begin
          FKeyEmpno := TFKeyEmpno.Create(self);
          Try
               FKeyEmpno.EdEmpno.Text := E_empnoTO.Text;
               FKeyEmpno.ShowModal;

               if FKeyEmpno.CloseChk <> -1 then
               begin
                    E_empnoTO.TExt   := FKeyEmpno.v_KeyEmpno;
                    P_kornameTO.Caption := FKeyEmpno.v_KeyKorname;
               end;
          Finally
               FKeyEmpno.Free;
          end;
     end
     else
     begin
          FKeyEmpnoY := TFKeyEmpnoY.Create(self);
          Try
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
end;

procedure TFpka40601.E_empnoExit(Sender: TObject);
begin
     if (YmanagerYN) and
        ((Copy(E_empnoFROM.Text,1,1) <> 'Y') or (Copy(E_empnoTO.Text,1,1) <> 'Y')) then
     begin
          Application.MessageBox('파견직 모드에서는 정규직 사번에 대한 작업을'+#13+'할 수 없습니다!','작업안내', mb_OK+$0030);
          E_empnoFROM.Text := 'Y000';
          E_empnoTO.Text   := 'YZZZ';
          E_empnoFROM.SelectAll;
          System.Exit;
     end;
end;

procedure TFpka40601.C_GubunChange(Sender: TObject);
begin
  if C_Gubun.ItemIndex = 0 then
  begin
    YmanagerYN := False;
    E_empnoFROM.Text := '0000';
    E_empnoTO.Text   := 'XXXX';
  end
  else
  begin
    YmanagerYN := True;
    E_empnoFROM.Text := 'Y000';
    E_empnoTO.Text   := 'YZZZ';
  end;

end;

procedure TFpka40601.FormActivate(Sender: TObject);
var
     qq : TOraQuery;
     CUseYN : string;
begin
     Application.ProcessMessages;

     Pempno   := PassEmp(cmdline,1);
     Pkorname := PassEmp(cmdline,2);
     Pgrade   := Passemp(cmdline,4);

     Lempno.Caption   := Pkorname+'('+Pempno+')';
     Lsysdate.caption := fn_GetDateStr;

     //2017.02.07 eyha 구성원 권한 시스템 관리 - 근거:SR-1701-1022
     {if (Copy(Pgrade,3,1) > 'C') then
     begin
             MessageBox(handle,'관리자 권한 외에는 열람할 수 없습니다.','알 림',MB_OK or $0030);
             Close;
     end;}
     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;
     Try
       with qq do
       begin
         Close;
         SQL.clear;
         SQL.ADD('Select payutil.GET_PRGUSER_YN(''2'',''PKA4060G'','''+Pempno+''') USEYN From Dual');
         Open;
         CUseYN := FieldByName('USEYN').AsString;
       end;
     Finally
         qq.Free;
     end;

     if (Copy(Pempno,1,1) <> 'D') and (CUseYN <> 'Y') then
     begin
       MessageBox(handle,'관리자 권한 외에는 열람할 수 없습니다.','알 림',MB_OK or $0030);
       Close;
     end;



     //2017.02.07 eyha 정규직/파견직 분리  근거:SR-1701-1022

     {//2016.03.18 eyha 정규직과 파견직 동시에 작업가능하도록 처리 홍원영M 요청
     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;
     Try
       with qq do
       begin
            Close;
            SQL.Clear;
            SQL.ADD('SELECT Nvl(VALUE1,''ZZZZ'') VALUE1, ');
            SQL.ADD('       Nvl(VALUE2,''ZZZZ'') VALUE2, ');
            SQL.ADD('       Nvl(VALUE3,''ZZZZ'') VALUE3, ');
            SQL.ADD('       Nvl(VALUE4,''ZZZZ'') VALUE4, ');
            SQL.ADD('       Nvl(VALUE5,''ZZZZ'') VALUE5  ');
            SQL.ADD('  FROM PKCVARI                      ');
            SQL.ADD(' WHERE gubun = ''PY''               ');
            Open;

            if (Pempno = FieldByName('VALUE1').AsString) OR
               (Pempno = FieldByName('VALUE2').AsString) OR
               (Pempno = FieldByName('VALUE3').AsString) OR
               (Pempno = FieldByName('VALUE4').AsString) OR
               (Pempno = FieldByName('VALUE5').AsString) then
            begin
              C_Gubun.Enabled   := True;

              C_Gubun.ItemIndex := 0;

              C_GubunChange(nil);

              maintitle.Color   := clPurple;
              maintitle.Caption := '근태 마감 및 집계 [정규직/파견직]';
            end else begin
              YmanagerYN := fn_YmanagerCheck;

              if YmanagerYN  then
                 C_Gubun.ItemIndex := 1
               else
                 C_Gubun.ItemIndex := 0;

              C_Gubun.Enabled   := False;

              C_GubunChange(nil);

              //일반직 급여관리자와의 구분사용 적용.
              if YmanagerYN then
              begin
                  maintitle.Color := clTeal;
                  maintitle.Caption := '근태 마감 및 집계[파견직]';
              end
              else
              begin
                  maintitle.Color := clNavy;
                  maintitle.Caption := '근태 마감 및 집계';
              end;
            end;
       end;
     Finally
          qq.Free;
     end;    }
     C_Gubun.Enabled   := False;
     C_Gubun.ItemIndex := 0;       //2017.02.07 eyha 무조건 정규직
     C_GubunChange(nil);     


     Work_Setup;//일반직 관리자 여부에 따른 작업환경 세팅.
end;

end.

