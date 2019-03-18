{* ======================= Program Header ======================================
 PROGRAM-NAME   : PKG3070G(초과근무수 계산/월별집계)
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 수당
 Programmer     : 김승회
 Version        : 30.00
 Date           : 1999.01.05

Update Contents
 Version  date(yy.mm.dd)  programmer  description               relevant doc.no
 1.00     1997.12.01      김승회      최초개발본                설계명세서
 30.00    1999.01.05      민정숙      계산로직변경              하나로재개발
============================================================================= *}
unit pkg30701;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Spin, Mask, DB, DBTables,  Pass,
  Tmax_DataSetText, Tmax_session, OnInsaCommon, Func, TmaxFunc, MemDS,
  DBAccess, Ora, KeyEmpno, KeyEmpnoY, OnEditBaseCtrl, OnEditStdCtrl,
  OnEditBtnCtrl, OnEditCombo, Grids, DBGrids, OnGrDBGrid, Comobj;

type
  TM_KG3070G = class(TForm)
    Panel1: TPanel;
    L_UserName: TLabel;
    L_Date: TLabel;
    Panel4: TPanel;
    P_Buttons: TPanel;
    BB_Close: TBitBtn;
    BB_Run: TBitBtn;
    P_Help: TPanel;
    Panel6: TPanel;
    SP_FrEmpNO: TSpeedButton;
    SP_ToEmpNO: TSpeedButton;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    E_FrEmpNO: TEdit;
    E_ToEmpNo: TEdit;
    Panel3: TPanel;
    SP_UpDown: TSpinButton;
    GB_Box1: TGroupBox;
    GB_Box2: TGroupBox;
    RB_AllEmp: TRadioButton;
    RB_Partial: TRadioButton;
    P_FixMon: TPanel;
    Panel8: TPanel;
    Panel5: TPanel;
    Bevel1: TBevel;
    Label2: TLabel;
    Label8: TLabel;
    RB_SumKind1: TRadioButton;
    RB_SumKind2: TRadioButton;
    Label1: TLabel;
    Label3: TLabel;
    maintitle: TPanel;
    Memo1: TMemo;
    TMaxSession: TTMaxSession;
    TDS_batch: TTMaxDataSet;
    RB_emp: TRadioButton;
    RB_Yemp: TRadioButton;
    Label4: TLabel;
    E_yearpaynum: TOnComboEdit;
    E_YYMM: TOnMaskEdit;
    RB_List: TRadioButton;
    Pn_Insert: TPanel;
    Panel7: TPanel;
    Label9: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    tmp_oraqry: TOraQuery;
    GroupBox1: TGroupBox;
    Panel9: TPanel;
    E_EmpNO: TEdit;
    SP_Insert: TSpeedButton;
    P_KorName: TPanel;
    BB_Insert: TBitBtn;
    GroupBox2: TGroupBox;
    Panel10: TPanel;
    Edatafile: TEdit;
    BitBtn2: TBitBtn;
    BB_ExcelFind: TBitBtn;
    Panel11: TPanel;
    Grid_Data: TOnGrDbGrid;
    ora_Data: TOraQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    ds_Data: TDataSource;
    BB_Delete: TBitBtn;
    OpenDialog1: TOpenDialog;
    Memo2: TMemo;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    procedure BB_CloseClick(Sender: TObject);
    procedure SP_UpDownDownClick(Sender: TObject);
    procedure SP_UpDownUpClick(Sender: TObject);
    procedure RB_AllEmpClick(Sender: TObject);
    procedure RB_PartialClick(Sender: TObject);
    procedure SP_FrEmpNOClick(Sender: TObject);
    procedure SP_ToEmpNOClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BB_RunClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RB_empClick(Sender: TObject);
    procedure RB_YempClick(Sender: TObject);
    procedure SP_InsertClick(Sender: TObject);
    procedure E_EmpNOChange(Sender: TObject);
    procedure E_EmpNOKeyPress(Sender: TObject; var Key: Char);
    procedure RB_ListClick(Sender: TObject);
    procedure BB_InsertClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BB_ExcelFindClick(Sender: TObject);
    procedure BB_DeleteClick(Sender: TObject);
  private
    { Private declarations }
    ActiveFlag    : Boolean;
  public
    { Public declarations }
    CurDate       : String[20];           {... 서버날짜                      ...}
    FixMon        : String[06];           {... 최종마감년월                  ...}
    Procedure  Display_Msg2(p_str:string);   //Dsa2000
    Function  Check_Valid : Boolean;
    Function  Check_Date( InDate : String ) : Boolean;
    Function  Check_EmpNo : Boolean;

    Procedure Get_FixMon;
    Procedure Read_yearpaynum;
    Procedure SetUp;
    procedure Grid_Clear(sGubun : String);
  end;

var
  M_KG3070G: TM_KG3070G;

implementation

{$R *.DFM}


{==============================================================================
         서버 Program 호출 전에 호출에 사용된 parameter 값들을 조사하는
         함수.
 ==============================================================================}
Function TM_KG3070G.Check_Valid : Boolean;
begin
     if Check_Date(E_YYMM.Text) AND Check_EmpNo then
        begin
             if not Check_Date(FixMon) then
                begin
                     Application.MessageBox('등록된 최종마감년월이 유효한 값이 아닙니다. 확인하시고 다시 작업 하십시요.','입력오류',MB_ICONWARNING);
                     Result         := False;
                     System.Exit;
                end;

             if E_YYMM.Text < FixMon then
                begin
                     Application.MessageBox('작업기준년월은 최종마감년월보다 같거나 커야 합니다.','입력오류',MB_ICONWARNING);
                     Result         := False;
                end
             else
                Result := True;
        end
     else
         Result := False;
end;

{==============================================================================
         집계기준년월을 Check하는 함수.
 ==============================================================================}
Function TM_KG3070G.Check_Date( InDate : String ) : Boolean;
var
   Temp   : Real;
begin
     if Length(InDate) <> 6 then
        begin
             P_Help.Caption := '   작업기준년월을 6자리로 입력하십시요...';
             E_YYMM.SetFocus;
             Result         := False;
             System.Exit;
        end;

     InDate := Copy(InDate,1,4) + DateSeparator + Copy(InDate,5,2) + DateSeparator + '01';
     Try
     Temp   := StrToDate(InDate);
     Except on EConvertError do
            begin
                 P_Help.Caption  := '   존재하지 않는 날짜입니다. 확인하시고 다시 입력하세요...';
                 E_YYMM.SetFocus;
                 Result          := False;
                 System.Exit;
            end;
     end;

     P_Help.Caption := '';
     Result         := True;
end;


{==============================================================================
         사번을 Check하는 함수.
 ==============================================================================}
Function TM_KG3070G.Check_EmpNo : Boolean;
begin
     if RB_Partial.Checked then
     begin
          if Length(E_FrEmpNo.Text) <> 4 then
             begin
                  P_Help.Caption := '   사번은 4자리로 입력하셔야 합니다...';
                  E_FrEmpNo.SetFocus;
                  Result         := False;
                  System.Exit;
             end;

             if Length(E_ToEmpNo.Text) <> 4 then
                begin
                     P_Help.Caption := '   사번은 4자리로 입력하셔야 합니다...';
                     E_FrEmpNo.SetFocus;
                     Result         := False;
                     System.Exit;
                end;

             if E_FrEmpNo.Text > E_ToEmpno.Text then
                begin
                     P_Help.Caption := '   ''사번FROM''이 ''사번TO''보다 더 큽니다....';
                     E_FrEmpNo.SetFocus;
                     Result         := False;
                end
             else
                 Result := True;
     end
     else
         begin
              P_Help.Caption := '';
              Result := True;
         end;
end;


Procedure TM_KG3070G.Display_Msg2(p_str:String);
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
          최종마감월을 구허는 Procedure.
 ==============================================================================}
Procedure TM_KG3070G.Get_FixMon;
var
     qq : TOraQuery;
begin
     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     Try
          with qq do
          begin
               Close;
               Sql.Clear;
               Sql.Add('SELECT FIXMON FROM PKCOTBAS  ' );
               Open;
               FixMon := FieldByName('FixMon').AsString;
          end;
     Finally
          qq.Free;
     end;
end;

{==============================================================================
         연봉차수를 읽어오는 Procedure.
 ==============================================================================}
Procedure TM_KG3070G.Read_yearpaynum;
var
     qq : TOraQuery;
begin
     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     Try
          with qq do
          begin
               Close;
               Sql.Clear;
               Sql.Add('SELECT distinct yearpaynum FROM PKHYPHIS  ');
               Sql.Add(' order by yearpaynum desc                 ');
               Open;

               E_yearpaynum.Items.Clear;
               while not Eof do
               begin
                    E_yearpaynum.Items.Add(FieldByName('yearpaynum').AsString);
                    next;
               end;

               Close;
               Sql.Clear;
               Sql.Add('SELECT yearpaynum FROM PKCPBAS            ');
               Open;

               E_yearpaynum.Text := FieldByName('yearpaynum').AsString;
          end;
     Finally
          qq.Free;
     end;
end;

{==============================================================================
         초기화를 수행하는 Procedure.
 ==============================================================================}
Procedure TM_KG3070G.SetUp;
begin
     P_Help.Caption := '   급여시스템에 접속 중입니다...';

     if (Copy(Pgrade,3,1) > 'C') then
     begin
          MessageBox(handle,'관리자 권한 외에는 열람할 수 없습니다.','알 림',MB_OK or $0030);
          Close;
     end;

     {//2017.02.17 jissi 파견직 프로그램 분리로 분기 로직 삭제
     if (fn_YmanagerCheck) then
     begin
          maintitle.Caption  := '초과근무수당 계산 / 월별집계[파견직]';
          maintitle.Color    := Clteal;
          RB_Partial.Checked := False;
          RB_AllEmp.Enabled  := False;
          RB_Yemp.Checked    := True;
          E_FrEmpNO.Text     := 'Y000'; E_ToEmpNO.Text := 'YZZZ';
     end
     else
     begin
          maintitle.Caption  := '초과근무수당 계산 / 월별집계';
          maintitle.Color    := ClNavy;
          RB_emp.Checked     := True;
          E_FrEmpNO.Text     := '0000'; E_ToEmpNO.Text := 'XZZZ';
     end;
     }

     maintitle.Caption  := '초과근무수당 계산 / 월별집계';
     maintitle.Color    := ClNavy;
     RB_emp.Checked     := True;
     E_FrEmpNO.Text     := '0000'; E_ToEmpNO.Text := 'XZZZ';

     Read_yearpaynum;

     CurDate := fn_GetDateTimeStr;

     E_YYMM.Text := Copy(AddMonStr(Copy(CurDate,1,6)+'01',-1),1,6);

     L_Date.Caption      := Copy(CurDate,1,4) + '-' + Copy(CurDate,5,2) + '-' +
                            Copy(CurDate,7,2);
     L_UserName.Caption  := PKorName+ '(' + Pempno + ')';
     Application.ProcessMessages;

     Get_FixMon;
     if FixMon <> '' then
        P_FixMon.Caption := Copy(FixMon,1,4) + '-' + Copy(FixMon,5,2);

     P_Help.Caption      := '';
end;


{==============================================================================
 ===================       Event Handlers      ================================
 ============================================================================== }

//... '종료' 버튼을 눌렀을 경우 ...
procedure TM_KG3070G.BB_CloseClick(Sender: TObject);
begin
     Close;
end;

//... '집계기준년월 Down'이 눌려 졌을 경우...
procedure TM_KG3070G.SP_UpDownDownClick(Sender: TObject);
var
   Tmp : Integer;
begin
     if Check_Date(E_YYMM.Text) then
        E_YYMM.Text := Copy(AddMonStr(E_YYMM.Text+'01', -1),1,6);
end;

//... '집계기준년월 Up'이 눌려 졌을 경우...
procedure TM_KG3070G.SP_UpDownUpClick(Sender: TObject);
begin
     if Check_Date(E_YYMM.Text) then
        E_YYMM.Text := Copy(AddMonStr(E_YYMM.Text+'01', 1),1,6);
end;

//... 사원범위에서 '전체'가 선택된 경우 ...
procedure TM_KG3070G.RB_AllEmpClick(Sender: TObject);
begin
     E_FrEmpNO.Enabled  := False;
     E_ToEmpNo.Enabled  := False;
     SP_FrEmpNO.Enabled := False;
     SP_ToEmpNO.Enabled := False;
     //2016.03.10 jissi 정규직,파견직 구분 체크 분리로 전체는 0000~ZZZZ
     E_FrEmpNo.Text     := '0000';
     E_ToEmpNo.Text     := 'ZZZZ';
     Pn_Insert.Enabled  := False;
     Grid_Clear('D');
     {
     if (Ymanager) then
     begin
          E_FrEmpNo.Text     := 'Y000';
          E_ToEmpNo.Text     := 'YZZZ';
     end
     else
     begin
          E_FrEmpNo.Text     := '0000';
          E_ToEmpNo.Text     := 'XZZZ';
     end;
     }
end;

//... 사원범위에서 '일부'가 선택된 경우 ...
procedure TM_KG3070G.RB_PartialClick(Sender: TObject);
begin
   E_FrEmpNO.Enabled  := True;
   E_ToEmpNo.Enabled  := True;
   SP_FrEmpNO.Enabled := True;
   SP_ToEmpNO.Enabled := True;
   Pn_Insert.Enabled  := False;
   Grid_Clear('D');
end;

//... '사원번호From'이 눌려 졌을 경우...
procedure TM_KG3070G.SP_FrEmpNOClick(Sender: TObject);
begin
{//2017.02.17 jissi 파견직 프로그램 분리로 분기 로직 삭제
     if (Ymanager) then
     begin
          Try
               FKeyEmpnoY := TFKeyEmpnoY.Create(Self);
               FKeyEmpnoY.EdEmpno.Text := E_FrEmpno.Text;
               FKeyEmpnoY.ShowModal;

               if FKeyEmpnoY.CloseChk <> -1 then E_FrEmpNo.Text := FKeyEmpnoY.v_KeyEmpno;
          Finally
               FKeyEmpnoY.Free;
          end;
     end
     else
     begin
}
          Try
               FKeyEmpno := TFKeyEmpno.Create(Self);
               FKeyEmpno.EdEmpno.Text := E_FrEmpno.Text;
               FKeyEmpno.ShowModal;

               if FKeyEmpno.CloseChk <> -1 then E_FrEmpNo.Text := FKeyEmpno.v_KeyEmpno;
          Finally
               FKeyEmpno.Free;
          end;
//     end;
     {Try
     M_EmpNO           := TM_EmpNo.Create(Self);
     M_EmpNo.InValue   := E_FrEmpNo.Text;
     M_EmpNO.ShowModal;
     if M_EmpNO.OutEmpNo <> '' then
     begin
          E_FrEmpNo.Text      := M_EmpNo.OutEmpNo;
     end;
     Finally
     M_EmpNo.Free;
     End;}
end;

//... '사원번호To'가 눌려 졌을 경우...
procedure TM_KG3070G.SP_ToEmpNOClick(Sender: TObject);
begin
{//2017.02.17 jissi 파견직 프로그램 분리로 분기 로직 삭제
     if (Ymanager) then
     begin
          Try
               FKeyEmpnoY := TFKeyEmpnoY.Create(Self);
               FKeyEmpnoY.EdEmpno.Text := E_ToEmpno.Text;
               FKeyEmpnoY.ShowModal;

               if FKeyEmpnoY.CloseChk <> -1 then E_ToEmpNo.Text := FKeyEmpnoY.v_KeyEmpno;
          Finally
               FKeyEmpnoY.Free;
          end;
     end
     else
     begin
}
          Try
               FKeyEmpno := TFKeyEmpno.Create(Self);
               FKeyEmpno.EdEmpno.Text := E_ToEmpno.Text;
               FKeyEmpno.ShowModal;

               if FKeyEmpno.CloseChk <> -1 then E_ToEmpNo.Text := FKeyEmpno.v_KeyEmpno;
          Finally
               FKeyEmpno.Free;
          end;
//     end;
     {Try
     M_EmpNO           := TM_EmpNo.Create(Self);
     M_EmpNo.InValue   := E_ToEmpNo.Text;
     M_EmpNO.ShowModal;
     if M_EmpNO.OutEmpNo <> '' then
     begin
          E_ToEmpNo.Text      := M_EmpNo.OutEmpNo;
     end;
     Finally
     M_EmpNo.Free;
     End;}
end;

//... 폼이 생성될 경우 ...
procedure TM_KG3070G.FormCreate(Sender: TObject);
begin
     ActiveFlag := True;

     OraConnect;

     //2016.06.09 jissi OS계정 보안강화 개선
     TMaxSession.Connect     := False;
     TMaxSession.EnvFileName := GetHomeDir+'\newhana.env';
     //개발접속 Test
     //TMaxSession.EnvFileName := 'C:\InsaDev\newhana.env';
     TMaxSession.LabelName   := 'HANAROHPER';

     try
          TMaxSession.Connect := True;
     except
          Application.MessageBox(PChar('종합인사 APP서버 접속 실패'),'에러',mb_ok);
          Application.Terminate;
          Exit;
     end;
     Grid_Clear('D');
     Memo1.Lines.Text := '';
end;

//... '실행'이 눌려 졌을 경우...
procedure TM_KG3070G.BB_RunClick(Sender: TObject);
var
     Pstr, JobStep, FrEmpNo, ToEmpNo, SumKind : String;
     Temp, sSys    : String;
     Rundate,  ProgId, CmdStr   : String;  //서비스 개발...
     SumYn : String;
begin
     P_Help.Caption := '';
     {//2016.03.10 jissi 정규직, 파견직 구분 체크 분리 주석 처리
     if (Ymanager) then
     begin
          if (Copy(E_FrEmpno.Text,1,1) <> 'Y') or (Copy(E_ToEmpno.Text,1,1) <> 'Y') then
          begin
               Application.MessageBox('파견직 모드에서는 정규직 사번에 대한 작업을'+#13+
                                      '할 수 없습니다.','작업안내',MB_OK+$0030);
               System.Exit;
          end;
     end;
     }
     if Check_Valid then
     begin
          Screen.CurSor := CrHourGlass;
          JobStep := 'Y';

          if RB_SumKind1.Checked then
             SumKind := '0'
          else
             Sumkind := '1';


          if RB_List.Checked then
          begin
             if ora_Data.RecordCount < 1 then
             begin
                Application.MessageBox('계산 및 집계작업을 진행할 대상이 존재하지 않습니다.!','입력오류',MB_ICONWARNING);
                Exit;
             end;
             ora_Data.DisableControls;
             ora_Data.First;
             Memo2.Clear;
             Memo1.Clear;
             Memo1.Lines.Add('실행중...');
             FM_Tmax           := TFM_Tmax.Create(Self);
             FM_Tmax.T_Session := TMaxSession;
             Rundate           := Copy(FM_Tmax.GetData('sysdate','',''),1,14);
             Memo1.Lines.Add('StartTime : '+Rundate);

             while Not ora_Data.EOF do
             begin
                FrEmpNo := ora_Data.FieldByName('EMPNO').AsString;
                ToEmpNo := ora_Data.FieldByName('EMPNO').AsString;

                Rundate := Copy(FM_Tmax.GetData('sysdate','',''),1,14);
                // pkg3070g pkg3075g 통합으로 변경 - 2018.08.09 Sangmoon Lee
                // SumYn Parameter 추가 - 2018.08.09 Sangmoon Lee
                ProgId  := 'pkg3071g_Y';
                SumYn   := 'Y';
                // CmdStr  := '/hper/insa/HINSA/proc/bin/Kbin/pkg3070g'
                CmdStr  := '/hper/insa/HINSA/proc/bin/Kbin/pkg3071g'+' '+E_YYMM.Text+' '+FrEmpNo+' '
                           +ToEmpNo+' '+JobStep+' '+SumKind+' '+PEmpNo+' '+ProgId+' '+Rundate
                           +' '+E_yearpaynum.Text+' '+SumYn;

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
                          Memo2.Lines.Add(FieldByName('RESULT').AsString);
                          Next;
                     end;
                end;

                if Pos('OK',Memo2.Text) > 0 then
                begin
                   P_Help.Caption := '  작업이 성공적으로 완료되었습니다. ';
                   Memo1.Lines.Add('[' + ora_Data.FieldByName('EMPNO').AsString + '-' + ora_Data.FieldByName('KORNAME').AsString + '] 작업이 성공적으로 완료되었습니다.');
                end
                else
                begin
                   P_Help.Caption := ' 작업에 실패했습니다. ';
                   Memo1.Lines.Add('[' + ora_Data.FieldByName('EMPNO').AsString + '-' + ora_Data.FieldByName('KORNAME').AsString + '] 작업에 실패했습니다.');
                end;
                ora_Data.Next;
             end;

             FM_Tmax           := TFM_Tmax.Create(Self);
             FM_Tmax.T_Session := TMaxSession;
             Rundate           := Copy(FM_Tmax.GetData('sysdate','',''),1,14);
             Memo1.Lines.Add('EndTime : '+Rundate);
          end
          else
          begin
             FrEmpNo := E_FrEmpNO.Text;
             ToEmpNo := E_ToEmpNO.Text;

             Memo1.Clear;
             Memo1.Lines.Add('실행중...');

             FM_Tmax           := TFM_Tmax.Create(Self);
             FM_Tmax.T_Session := TMaxSession;
             Rundate           := Copy(FM_Tmax.GetData('sysdate','',''),1,14);
             Memo1.Lines.Add('StartTime : '+Rundate);
             // pkg3070g pkg3075g 통합으로 변경 - 2018.08.09 Sangmoon Lee
             // SumYn Parameter 추가 - 2018.08.09 Sangmoon Lee
             ProgId  := 'pkg3071g_Y';
             SumYn   := 'Y';
             // CmdStr  := '/hper/insa/HINSA/proc/bin/Kbin/pkg3070g'
             CmdStr  := '/hper/insa/HINSA/proc/bin/Kbin/pkg3071g'+' '+E_YYMM.Text+' '+FrEmpNo+' '
                        +ToEmpNo+' '+JobStep+' '+SumKind+' '+PEmpNo+' '+ProgId+' '+Rundate
                        +' '+E_yearpaynum.Text+' '+SumYn;

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
             end;

             FM_Tmax           := TFM_Tmax.Create(Self);
             FM_Tmax.T_Session := TMaxSession;
             Rundate           := Copy(FM_Tmax.GetData('sysdate','',''),1,14);
             Memo1.Lines.Add('EndTime : '+Rundate);

             if Pos('OK',Memo1.Text) > 0 then
                P_Help.Caption := '  작업이 성공적으로 완료되었습니다. '
             else
                P_Help.Caption := '  작업에 실패했습니다. ';

          end;
          Screen.CurSor := CrDefault;
     end;
end;

procedure TM_KG3070G.FormActivate(Sender: TObject);
begin
     if ActiveFlag then
        SetUp;
     ActiveFlag := False;
end;

procedure TM_KG3070G.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     if IDYes = Application.MessageBox('종료하시겠습니까?','확 인',MB_YesNo) then
        begin
             Action := caFree
        end
     else
         Action := caNone;
end;

procedure TM_KG3070G.RB_empClick(Sender: TObject);
begin
     //2016.03.10 jissi 정규직,파견직 구분 체크 분리로 정규직은 0000~XZZZ
     E_FrEmpNO.Enabled  := False;
     E_ToEmpNo.Enabled  := False;
     SP_FrEmpNO.Enabled := False;
     SP_ToEmpNO.Enabled := False;

     E_FrEmpNo.Text     := '0000';
     E_ToEmpNo.Text     := 'XZZZ';

     Pn_Insert.Enabled  := False;
     Grid_Clear('D');
end;

procedure TM_KG3070G.RB_YempClick(Sender: TObject);
begin
     //2016.03.10 jissi 정규직,파견직 구분 체크 분리로 파견직은 Y000~YZZZ
     E_FrEmpNO.Enabled  := False;
     E_ToEmpNo.Enabled  := False;
     SP_FrEmpNO.Enabled := False;
     SP_ToEmpNO.Enabled := False;

     E_FrEmpNo.Text     := 'Y000';
     E_ToEmpNo.Text     := 'YZZZ';
     Pn_Insert.Enabled  := False;
     Grid_Clear('D');
end;

procedure TM_KG3070G.SP_InsertClick(Sender: TObject);
begin
    Try
         FKeyEmpno := TFKeyEmpno.Create(Self);
         FKeyEmpno.EdEmpno.Text := E_EmpNO.Text;
         FKeyEmpno.ShowModal;

         if FKeyEmpno.CloseChk <> -1 then
         begin
            E_EmpNO.Text      := FKeyEmpno.v_KeyEmpno;
            P_KorName.Caption := FKeyEmpno.v_KeyKorname;
         end;
    Finally
         FKeyEmpno.Free;
    end;
end;

procedure TM_KG3070G.E_EmpNOChange(Sender: TObject);
begin
  P_KorName.caption := '';
end;

procedure TM_KG3070G.E_EmpNOKeyPress(Sender: TObject; var Key: Char);
begin
   If Key = #13 then
     begin
       key := #0;
       with tmp_oraqry do
         begin
          Close;
          SQL.Clear;
          SQL.ADD(' SELECT EMPNO, KORNAME ');
          SQL.ADD('   FROM PIMPMAS A');
          SQL.ADD('    WHERE 1=1');
          SQL.ADD('    AND (EMPNO LIKE :empno ');
          SQL.ADD('     OR  KORNAME LIKE :empno) ');
          ParamByName('empno').AsString := E_EmpNO.Text + '%';
          Open;

        If RecordCount < 1 then
        begin
           MessageBox(HANDLE,'해당사원이 존재하지 않습니다..','조회조건입력오류',MB_ICONWARNING) ;
           Close;
           E_EmpNO.text := '' ;
           Exit;
        end
        else If RecordCount = 1 then
        begin
           E_EmpNO.Text := FieldByName('empno').AsString;
           P_KorName.caption := FieldByName('korname').AsString;
        end
        else If RecordCount > 1 then
        begin
           Fkeyempno := TFkeyempno.Create(Self);
           Try
              Fkeyempno.Edempno.Text := E_EmpNO.Text;
              Fkeyempno.ShowModal;
              If Fkeyempno.CloseChk = -1 then Exit;
              E_EmpNO.Text := Fkeyempno.v_KeyEmpno;
              P_KorName.caption := Fkeyempno.v_KeyKorname;
           Finally
              Fkeyempno.Free;
           end;
        end;
      end;
    end;

end;

procedure TM_KG3070G.RB_ListClick(Sender: TObject);
begin
     E_FrEmpNO.Enabled  := False;
     E_ToEmpNo.Enabled  := False;
     SP_FrEmpNO.Enabled := False;
     SP_ToEmpNO.Enabled := False;

     E_FrEmpNo.Text     := '0000';
     E_ToEmpNo.Text     := 'XZZZ';
     Pn_Insert.Enabled := True;
end;

procedure TM_KG3070G.Grid_Clear(sGubun: String);
begin
  if sGubun = 'D' then
  begin
     ora_Data.Close;
     ora_Data.Open;
     ora_Data.Delete;
     Memo1.Lines.Text := '';
  end;
end;

procedure TM_KG3070G.BB_InsertClick(Sender: TObject);
begin
    if Length(Trim(E_EmpNO.Text)) <> 4 then
    begin
       MessageDlg('잘못된 사원정보 입니다. 확인하시기 바랍니다.!', MtWarning, [mbok], 0);
       Exit;
    end;

    with ora_Data do
    begin
        DisableControls;
        First;
        while Not EOF do
        begin
           if ora_Data.FieldByName('EMPNO').AsString = E_EmpNO.Text then
           begin
              MessageDlg('이미 계산 및 집계대상 사원정보 입니다. 확인하시기 바랍니다.!', MtWarning, [mbok], 0);
              EnableControls;
              Exit;
           end;
           Next;
        end;
        Last;
        EnableControls;
    end;
    
    ora_Data.Append;
    ora_Data.FieldByName('EMPNO').AsString   := E_EmpNO.Text;
    ora_Data.FieldByName('KORNAME').AsString := P_KorName.Caption;
    ora_Data.Post;
end;

procedure TM_KG3070G.BitBtn2Click(Sender: TObject);
var
  XL, XArr: Variant;
begin
  P_Help.Caption := 'Excel이 설치되어 있는지 검색하고 있습니다.';

  XArr := VarArrayCreate([1, 2], VarVariant);
  try
       XL := CreateOLEObject('Excel.Application');
  except
       MessageDlg('Excel이 설치되어 있지 않습니다.', MtWarning, [mbok], 0);
       P_Help.Caption := '';
       Exit;
  end;

  XL.WorkBooks.Add; //새로운 페이지 생성
  XL.Visible := false;
  //컬럼명 지정_서브타이블 지정
  XArr[1]  := '사원번호(4자리)';
  XArr[2]  := '사원명';
  XL.Range['A1', 'B1'].Value := XArr;
  XL.Range['A1', 'B1'].Borders.LineStyle := 1;     //테두리선을 만든다.  1은 실선
  XL.Range['A1', 'B1'].Interior.Color:= $00CBF0B3;
  XL.Range['A1', 'B1'].Select;                     //자료를 모두 Select한 후 --하는 이유:  AutoFit 처리하기 위해서임
  XL.Selection.Columns.AutoFit;                    //자동정렬
  XL.Visible := true;                              //엑셀자료 보여줌
  P_Help.Caption := '';
end;

procedure TM_KG3070G.BB_ExcelFindClick(Sender: TObject);
var
  v           : Variant ;
  iRow , iCnt, SCnt, FCnt : integer ;
  s_Empno, s_EmpNm, vMsg1, vMsg2 : String;
begin
   Grid_Clear('D');
   SCnt := 0;
   FCnt := 0;

   if OpenDialog1.Execute then begin
      Edatafile.text := OpenDialog1.FileName ;
   end;

   if (Edatafile.text = '') then
   begin
     ShowMessage('엑셀 화일명이 없습니다. 확인후 다시 작업하세요.');
     Edatafile.SetFocus;
     Exit;
   end ;

   if IDNo = Application.MessageBox(PChar('해당파일을 화면에 Upload 하시겠습니까?'),'작업안내',MB_YesNo+MB_ICONWARNING) then
      Exit;

   try
        v:= CreateOleObject('Excel.application');
   except
        ShowMessage('Excel이 설치되어 있어야 합니다.');
        Exit;
   end;



   v.WorkBooks.open(Edatafile.Text);

   iCnt  := strToint(v.ActiveSheet.UsedRange.Rows.Count);

   For iRow := 2 to iCnt do
   begin
       s_Empno   := '';
       s_EmpNm   := '';
       vMsg1     := '';
       vMsg2     := '';
       with tmp_oraqry do
       begin
         Close;
         SQL.Clear;
         SQL.Add('select a.empno, a.korname    ');
         SQL.Add('  from pimpmas a             ');
         SQL.Add(' where a.empno    = :p_empno ');
         ParamByName('p_empno').AsString := v.cells[iRow, 1];
         Open;

         s_Empno   := FieldByName('empno'   ).AsString;
         s_EmpNm   := FieldByName('korname' ).AsString;
       end;

       if s_EmpNm = '' then
       begin
          vMsg1 := v.cells[iRow, 1];
          vMsg2 := v.cells[iRow, 2];
       end;

       if vMsg1 <> '' then
       begin
          Memo1.Lines.Add('[' + vMsg1 + '-' + vMsg2 + '] 사원번호 오류입니다.');
          vMsg1 := '';
          vMsg2 := '';
          inc(FCnt);
       end
       else
       begin
          ora_Data.Append;
          ora_Data.FieldByName('EMPNO'      ).AsSTring := v.cells[iRow, 1];
          ora_Data.FieldByName('KORNAME'    ).AsSTring := s_EmpNm;
          ora_Data.Post;
          inc(SCnt);
       end;
   end;

   v.WorkBooks.Close;
   v.quit ;
   v:=unassigned;

   P_Help.Caption := '[총 ' + IntTostr(iCnt -1) + ' 건 / 성공 ' + IntTostr(SCnt) + '건 / 실패 ' + IntTostr(FCnt) + '건] 엑셀파일 로드가 완료 되었습니다.';
end;

procedure TM_KG3070G.BB_DeleteClick(Sender: TObject);
begin
   if ora_Data.RecordCount > 0 then
      ora_Data.Delete
   else
   begin
      ShowMessage('삭제할 대상이 존재하지 않습니다.!');
      Exit;
   end;
end;

end.
