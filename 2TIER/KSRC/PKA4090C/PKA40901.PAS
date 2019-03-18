{-------------------------------------------------------------------------------
 PROGRAM-NAME   : PKA4090C(개인별근태내역서출력)
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 근태
 Programmer     : 허철행
 Version        : 1.00
 Date           : 1997.12.01

Update Contents
 버전    수정일        수정자   관련근거          수정내용
 10.00   1997.12.01    허철행   설계명세서        최초개발본
 10.01   1998.05.19    이랑교   전1998.05.13      반연차항목추가
         2007.03.15    유재승   요청서2007-6160   근태코드 추가(정직,임시,불입)
--------------------------------------------------------------------------------}
unit pka40901;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, DB, DBTables, StdCtrls, Mask, Buttons, ExtCtrls,
  Keycode, Kylib1, pka40902, pka40903, pka40904, Qrprntr,
  pass, UserHelp,formmon1, Ora;

type
  TFpka40901 = class(TForm)
    SBduyymmfr: TSpeedButton;
    SBempnofr: TSpeedButton;
    Bevel1: TBevel;
    Shape1: TShape;
    Label2: TLabel;
    Lempinfo: TLabel;
    Lsysdate: TLabel;
    Label9: TLabel;
    Bevel2: TBevel;
    Phelpmsg: TPanel;
    Panel3: TPanel;
    BBclose: TBitBtn;
    BBrun: TBitBtn;
    BBprnsetup: TBitBtn;
    Panel5: TPanel;
    MEduyymmfr: TMaskEdit;
    Panel6: TPanel;
    Panel12: TPanel;
    Eempnofr: TEdit;
    Pkornamefr: TPanel;
    Panel7: TPanel;
    Panel1: TPanel;
    PrinterSetupDialog1: TPrinterSetupDialog;
    SBdeptcode: TSpeedButton;
    Label3: TLabel;
    Panel2: TPanel;
    Edeptcode: TEdit;
    Pdeptcode: TPanel;
    Panel4: TPanel;
    Panel10: TPanel;
    RBdutydesc: TRadioButton;
    RBdutycnt: TRadioButton;
    Porgnum: TPanel;
    Label4: TLabel;
    SaveFileDialog: TSaveDialog;
    MEduyymmto: TMaskEdit;
    SBduyymmto: TSpeedButton;
    Label6: TLabel;
    SBempnoto: TSpeedButton;
    Eempnoto: TEdit;
    Pkornameto: TPanel;
    Panel8: TPanel;
    Image1: TImage;
    RBtot: TRadioButton;
    RBpart: TRadioButton;
    Ppart: TPanel;
    RBprinter: TRadioButton;
    RBmoniter: TRadioButton;
    Chkdept: TCheckBox;
    procedure SBduyymmfrClick(Sender: TObject);
    procedure SBempnofrClick(Sender: TObject);
    procedure MEduyymmfrChange(Sender: TObject);
    procedure SBdeptcodeClick(Sender: TObject);
    procedure EdeptcodeExit(Sender: TObject);
    procedure MEduyymmfrKeyPress(Sender: TObject; var Key: Char);
    procedure EdeptcodeKeyPress(Sender: TObject; var Key: Char);
    procedure BBrunClick(Sender: TObject);
    procedure BBcloseClick(Sender: TObject);
    procedure SBduyymmtoClick(Sender: TObject);
    procedure MEduyymmtoChange(Sender: TObject);
    procedure MEduyymmtoKeyPress(Sender: TObject; var Key: Char);
    procedure EempnotoKeyPress(Sender: TObject; var Key: Char);
    procedure SBempnotoClick(Sender: TObject);
    procedure RBpartClick(Sender: TObject);
    procedure RBtotClick(Sender: TObject);
    procedure RBdutydescClick(Sender: TObject);
    procedure RBdutycntClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BBhelpClick(Sender: TObject);
    procedure EempnofrKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
    LSsysdate : String;        // system date

  public
    { Public declarations }

    GSpart : String;           //근태구분 일부조회시 근태코드저장 변수
    function Empno_Chk(v_empno: String) : Boolean;
    function GetRecord1 : Boolean;
    function GetRecord2 : Boolean;
  end;

var
  Fpka40901: TFpka40901;

implementation

uses Func, KeyEmpno, DeptCode;

{$R *.DFM}

{------------------------------ User Function ---------------------------------}

//사원조회
function TFpka40901.Empno_Chk(v_empno: String): Boolean;
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
               SQL.Add('select empno                   ');
               SQL.Add('  from pimpmas                 ');
               SQL.Add(' where empno = :P_empno        ');
               ParamByName('P_empno').AsString    := v_empno;
               Open;

               if RecordCount <> 0 then Result := True
               else                     Result := False;

          end
     Finally
          qq.Free;
     end;     
end;

{-------------------------------- MAIN ----------------------------------------}
procedure TFpka40901.FormActivate(Sender: TObject);
var
     i : integer;
     qq : TOraQuery;
begin

     PhelpMsg.Caption := ' 작업자, 작업일, 조직차수, 부서코드, 본부코드를 설정하고 있습니다.';
     Application.ProcessMessages;
     OraConnect;

     //초기값설정

     LSsysdate := Fn_GetDateTimeStr;

     Lsysdate.Caption := Fn_GetDateStr;
     Lempinfo.Caption := Pkorname + '(' + Pempno + ')';

     // Login 조직차수,부서코드 Set
     PhelpMsg.Caption := ' 조직차수,부서코드 설정중.';
     SendMessage(Phelpmsg.handle,WM_PAINT,0,0);

     Porgnum.Caption := GetOrgnum;

     qq := TOraQuery.Create(Nil);
     qq.Session := Ora_Session;

     Try
          with qq do
          begin
               Close;
               SQL.Clear;
               SQL.Add('select orgnum,                      ');
               SQL.Add('       deptcode                     ');
               SQL.Add('  from pimpmas                      ');
               SQL.Add(' where empno = :Pempno              ');
               ParamByName('Pempno').AsString := Pempno;
               Open;

               // Login 본부코드,부서명 Set
               PhelpMsg.Caption := ' 본부코드,부서명 설정중.';
               SendMessage(Phelpmsg.handle,WM_PAINT,0,0);

               Edeptcode.Text := FieldByName('deptcode').AsString;
               Pdeptcode.Caption := ' '+GetDeptName(FieldByName('orgnum').AsString, FieldByName('deptcode').AsString);
          end;
     Finally
          qq.Free;
     end;

     MEduyymmfr.Text := Copy(LSsysdate,1,6);
     MEduyymmto.Text := Copy(LSsysdate,1,6);
     Eempnofr.text := Pempno;
     Eempnoto.text := Pempno;
     Pkornamefr.Caption := Pkorname;
     Pkornameto.Caption := Pkorname;

     PhelpMsg.Caption := ' 작업자,작업일,조직차수,부서코드,본부코드를 설정했습니다, 작업을 진행하세요.';
     SendMessage(Phelpmsg.handle,WM_PAINT,0,0);

end;

// CALEN2.달력(년월)Call/자료조회 from
procedure TFpka40901.SBduyymmfrClick(Sender: TObject);
var
     MonthForm : TMonthForm;
begin
     Try
          MonthForm := TMonthForm.Create(nil);
          MonthForm.rDayCaption  := MEduyymmfr.Text;
          MonthForm.ShowModal;
          MEduyymmfr.Text := MonthForm.Daycaption;
     Finally
          MonthForm.Free;
     end;
end;


// KYLIB1.날짜Check
procedure TFpka40901.MEduyymmfrChange(Sender: TObject);
begin
     If Length(MEduyymmfr.Text) = 6 then
     begin
          If Fn_IsDate(MEduyymmfr.Text + '01') = False then
          begin
               MessageBox(handle,'지급기준년월을 정확히 입력하세요!', '날짜입력오류', MB_ICONWARNING);
               MEduyymmfr.SetFocus;
               Exit;
          end;
     end;
end;
procedure TFpka40901.MEduyymmfrKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 then
     begin
          key := #0;
          If Fn_IsDate(MEduyymmfr.Text + '01') = False then
          begin
               MessageBox(handle,'지급기준년월을 정확히 입력하세요!', '날짜입력오류', MB_ICONWARNING);
               MEduyymmfr.SetFocus;
               Exit;
          end
          else MEduyymmto.SetFocus;
     end;
end;

// CALEN2.달력(년월)Call/자료조회 to
procedure TFpka40901.SBduyymmtoClick(Sender: TObject);
var
     MonthForm : TMonthForm;
begin
     Try
          MonthForm := TMonthForm.Create(nil);
          MonthForm.rDayCaption  := MEduyymmto.Text;
          MonthForm.ShowModal;
          MEduyymmto.Text := MonthForm.Daycaption;
     Finally
          MonthForm.Free;
     end;
end;

// KYLIB1.날짜Check
procedure TFpka40901.MEduyymmtoChange(Sender: TObject);
begin
     If Length(MEduyymmto.Text) = 6 then
     begin
          If Fn_IsDate(MEduyymmto.Text + '01') = False then
          begin
               MessageBox(handle,'지급기준년월을 정확히 입력하세요!', '날짜입력오류', MB_ICONWARNING);
               MEduyymmto.SetFocus;
               Exit;
          end;
     end;
end;

procedure TFpka40901.MEduyymmtoKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 then
     begin
          key := #0;
          If Fn_IsDate(MEduyymmto.Text + '01') = False then
          begin
               MessageBox(handle,'지급기준년월을 정확히 입력하세요.', '날짜입력오류', MB_ICONWARNING);
               MEduyymmto.SetFocus;
               Exit;
          end
          else Edeptcode.SetFocus;
     end;
end;

// DEPT2LIB.부서조회
procedure TFpka40901.SBdeptcodeClick(Sender: TObject);
begin

     FDeptCode := TFDeptCode.Create(Self);
     FDeptCode.EdOrgnum.Text := Porgnum.Caption;
     FDeptCode.EdDeptcode.Text := Edeptcode.Text;

     Try
          FDeptCode.ShowModal;
          If FDeptCode.CloseChk = 0 then
          begin
               Edeptcode.text := FDeptCode.GSdeptcode;
               Pdeptcode.Caption := ' '+FDeptCode.GSdeptname;
          end;
     Finally
          FDeptCode.Free;
     end;

end;

procedure TFpka40901.EdeptcodeKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 then
     begin
          key := #0;
          Eempnofr.SetFocus;
     end;
end;

procedure TFpka40901.EdeptcodeExit(Sender: TObject);
begin

end;

// 사원조회 from
procedure TFpka40901.SBempnofrClick(Sender: TObject);
begin
     FKeyEmpno := TFKeyEmpno.Create(Self);

     try
          FKeyEmpno.EdEmpno.Text := Trim(Eempnofr.Text);
          FKeyEmpno.ShowModal;

          if FKeyEmpno.CloseChk = -1 then Exit;

          Eempnofr.Text     := FKeyEmpno.v_KeyEmpno;
          Pkornamefr.Caption := FKeyEmpno.v_KeyKorname;

     finally
          FKeyEmpno.Free;
     end;
end;

// 사원조회 to
procedure TFpka40901.SBempnotoClick(Sender: TObject);
begin
     FKeyEmpno := TFKeyEmpno.Create(Self);

     try
          FKeyEmpno.EdEmpno.Text := Trim(Eempnoto.Text);
          FKeyEmpno.ShowModal;

          if FKeyEmpno.CloseChk = -1 then Exit;

          Eempnoto.Text     := FKeyEmpno.v_KeyEmpno;
          Pkornameto.Caption := FKeyEmpno.v_KeyKorname;

     finally
          FKeyEmpno.Free;
     end;
end;


procedure TFpka40901.EempnofrKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 then
     begin
          key := #0;
          If Length(Eempnofr.Text) = 4 then
          begin
               if Empno_Chk(Eempnofr.Text) = False then
               begin
                 MessageBox(handle,'사번이 잘못 입력되었습니다', '사번입력오류', MB_ICONWARNING);
                 Eempnofr.Text := '';
                 Pkornamefr.Caption := '';
                 Eempnofr.SetFocus;
                 exit;
               end;
          end;

          FKeyEmpno := TFKeyEmpno.Create(Self);
          try
               FKeyEmpno.EdEmpno.Text := Trim(Eempnofr.Text);
               FKeyEmpno.Retrieve;
               FKeyEmpno.DBGrid1DblClick(Self);
               if FKeyEmpno.CloseChk = -1 then Exit;

               Eempnofr.Text     := FKeyEmpno.v_KeyEmpno;
               Pkornamefr.Caption := FKeyEmpno.v_KeyKorname;

          finally
               FKeyEmpno.Free;
          end;

     end;
end;


procedure TFpka40901.EempnotoKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 then
     begin
          key := #0;

          If Length(Eempnoto.Text) = 4 then
          begin
               if Empno_Chk(Eempnoto.Text) = False then
               begin
                 MessageBox(handle,'사번이 잘못 입력되었습니다', '사번입력오류', MB_ICONWARNING);
                 Eempnoto.Text := '';
                 Pkornameto.Caption := '';
                 Eempnoto.SetFocus;
                 exit;
               end;
          end;

          FKeyEmpno := TFKeyEmpno.Create(Self);
          try
               FKeyEmpno.EdEmpno.Text := Trim(Eempnoto.Text);
               FKeyEmpno.Retrieve;
               FKeyEmpno.DBGrid1DblClick(Self);
               if FKeyEmpno.CloseChk = -1 then Exit;

               Eempnoto.Text     := FKeyEmpno.v_KeyEmpno;
               Pkornameto.Caption := FKeyEmpno.v_KeyKorname;

          finally
               FKeyEmpno.Free;
          end;

     end;
end;

// 상세내역 선택시
procedure TFpka40901.RBdutydescClick(Sender: TObject);
begin
     RBtot.Enabled := True;
     RBpart.Enabled := True;
end;
// 통계내역 선택시
procedure TFpka40901.RBdutycntClick(Sender: TObject);
begin
     RBtot.Checked := False;
     RBpart.Checked := False;


     RBtot.Enabled := False;
     RBpart.Enabled := False;

     Ppart.Caption := '';
end;

// 일부 선택시
procedure TFpka40901.RBpartClick(Sender: TObject);
begin

     FKeyCode := TFKeyCode.Create(Self);
     FKeyCode.OraQuery1.Session := Ora_Session;

     Try
          FKeyCode.FormData := '근태코드조회';
          FKeyCode.Dataval1 := 'Y110';
          FKeyCode.ShowModal;
          If FKeyCode.CloseChk <> -1 then
          begin
               Ppart.Caption := FKeyCode.Codename;
               GSpart := FKeyCode.Code;
          end
          else
          begin
               GSpart := '';
               Ppart.Caption := '';
               RBpart.Checked := False;
          end;
     Finally
          FKeyCode.Free;
     end;
end;

// 전체,미입력 선택시 구분명,Code Clear
procedure TFpka40901.RBtotClick(Sender: TObject);
begin
     GSpart := '';
     Ppart.Caption := '';
end;

// 실행
procedure TFpka40901.BBrunClick(Sender: TObject);
begin
     If fn_IsDate(MEduyymmfr.Text + '01') = False then
     begin
          MessageBox(handle,'기간범위 From 을 정확히 입력하세요.', '출력조건입력오류', MB_ICONWARNING);
          MEduyymmfr.SetFocus;
          Exit;
     end;

     If fn_IsDate(MEduyymmto.Text + '01') = False then
     begin
          MessageBox(handle,'기간범위 To 를 정확히 입력하세요.', '출력조건입력오류', MB_ICONWARNING);
          MEduyymmto.SetFocus;
          Exit;
     end;

     If MEduyymmfr.Text > MEduyymmto.Text  then
     begin
          MessageBox(handle,'기간FROM이 기간TO보다 큽니다.', '출력조건입력오류', MB_ICONWARNING);
          MEduyymmto.SetFocus;
          Exit;
     end;

     if Empno_chk(Eempnofr.Text) = False then
     begin
          MessageBox(handle,'사번이 잘못 입력되었습니다', '사번입력오류', MB_ICONWARNING);
          MEduyymmto.SetFocus;
          Exit;
     end;

     if Empno_chk(Eempnoto.Text) = False then
     begin
          MessageBox(handle,'사번이 잘못 입력되었습니다', '사번입력오류', MB_ICONWARNING);
          MEduyymmto.SetFocus;
          Exit;
     end;

     If (Eempnofr.Text <> '') and (Eempnoto.Text <> '') then
     begin
          If Eempnofr.Text > Eempnoto.Text then
          begin
               MessageBox(handle,'FROM사번이 TO사번 보다 큽니다.', '출력조건입력오류', MB_ICONWARNING);
               Eempnoto.SetFocus;
               Exit;
          end;
     end;

     If (RBdutydesc.Checked = False) and (RBdutycnt.Checked = False) then
     begin
          MessageBox(handle,'작성구분을 정확히 선택하세요....','출력조건입력오류',MB_ICONWARNING);
          RBdutydesc.SetFocus;
          exit;
     end;

     // 근태 상세내역 선택시 만 Check
     If RBdutydesc.Checked then
     begin
          If (RBtot.Checked = False) and (RBpart.Checked = False) then
          begin
               MessageBox(handle,'근태구분을 정확히 선택하세요....','출력조건입력오류',MB_ICONWARNING);
               RBtot.SetFocus;
               exit;
          end;
     end;

     If (RBprinter.Checked = False) and (RBmoniter.Checked = False) then
     begin
          MessageBox(handle,'출력장치를 정확히 선택하세요....','출력조건입력오류',MB_ICONWARNING);
          RBprinter.SetFocus;
          exit;
     end;

     Phelpmsg.Caption := '☞ 작업준비중.';
     Application.ProcessMessages;  


     //프린터 출력.
     If RBprinter.Checked then
     begin
          If RBdutydesc.Checked then
          begin

               Fpka40902 := TFpka40902.Create(Application);

               if GetRecord1 = True then
               begin

                    with Fpka40902 do
                    begin
                         QRLduyymmfr.Caption := MEduyymmfr.Text;
                         QRLduyymmto.Caption := MEduyymmto.Text;

                         If RBtot.Checked then
                         begin
                              QRLpart.Caption := '전체';
                         end
                         else If RBpart.Checked then
                         begin
                              QRLpart.Caption := Ppart.Caption;
                         end;

                         QRLsysdate.Caption := Lsysdate.Caption;

                         QuickReport1.Preview;
                         QuickReport1.Print;
                    end;
               end;
          end
          else If RBdutycnt.Checked then
          begin
               Fpka40903 := TFpka40903.Create(Application);

               If GetRecord1 = True then
               begin
                    with Fpka40903 do
                    begin
                         QRLduyymmfr.Caption := MEduyymmfr.Text;
                         QRLduyymmto.Caption := MEduyymmto.Text;

                         QRLsysdate.Caption := Lsysdate.Caption;

                         QuickReport1.Preview;
                    end;
               end;

          end;
     end;

     // 화면 출력.
     If RBmoniter.Checked then
     begin
          If RBdutydesc.Checked then
          begin
               Fpka40902 := TFpka40902.Create(Application);

               if GetRecord1 = True then
               begin

                    with Fpka40902 do
                    begin
                         QRLduyymmfr.Caption := MEduyymmfr.Text;
                         QRLduyymmto.Caption := MEduyymmto.Text;

                         if RBtot.Checked then
                         begin
                              QRLpart.Caption := '전체';
                         end
                         else If RBpart.Checked then
                         begin
                              QRLpart.Caption := Ppart.Caption;
                         end;

                         QRLsysdate.Caption := Lsysdate.Caption;

                         QuickReport1.Preview;

                    end;
               end;
          end
          else If RBdutycnt.Checked then
          begin
               Fpka40903 := TFpka40903.Create(Application);

               If GetRecord2 = True then
               begin
                    with Fpka40903 do
                    begin
                         QRLduyymmfr.Caption := MEduyymmfr.Text;
                         QRLduyymmto.Caption := MEduyymmto.Text;

                         QRLsysdate.Caption := Lsysdate.Caption;

                         QuickReport1.Preview;
                    end;
               end;

          end;
     end;

     if Fpka40901.Phelpmsg.Caption <> '☞ 조회된 정보가 없습니다.' then Fpka40901.Phelpmsg.Caption := '☞ 작업종료';
     Application.ProcessMessages;
end;

// 종료
procedure TFpka40901.BBcloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFpka40901.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  If IDCANCEL = Application.MessageBox('작업을 종료하시겠습니까?', '작업안내', mb_OKCancel) then
  begin
       Action := caNone;
       exit;
  end;
end;

procedure TFpka40901.BBhelpClick(Sender: TObject);
var
     HelpForm: THelpForm;
begin
  Try
       HelpForm := THelpForm.Create(Self);
       HelpForm.ProgramId := 'PKA4090C';
       HelpForm.ShowModal;
  Finally
       HelpForm.Free;
  end;
end;

function TFpka40901.GetRecord1: Boolean;
var
     qq : TOraQuery;
     tmp_Str : String;
begin
     Application.ProcessMessages;

     Fpka40902.OraQuery1.Session := Ora_Session;

     Result := True;

     with Fpka40902.OraQuery1 do
     begin
          Close;
          SQL.Clear;
          SQL.Add('select a.duyymm,                                      ');
          SQL.Add('       a.empno,                                       ');
          SQL.Add('       a.korname,                                     ');
          SQL.Add('       nvl(a.dd1 , ''**'') dd1,                       ');
          SQL.Add('       nvl(a.dd2 , ''**'') dd2,                       ');
          SQL.Add('       nvl(a.dd3 , ''**'') dd3,                       ');
          SQL.Add('       nvl(a.dd4 , ''**'') dd4,                       ');
          SQL.Add('       nvl(a.dd5 , ''**'') dd5,                       ');
          SQL.Add('       nvl(a.dd6 , ''**'') dd6,                       ');
          SQL.Add('       nvl(a.dd7 , ''**'') dd7,                       ');
          SQL.Add('       nvl(a.dd8 , ''**'') dd8,                       ');
          SQL.Add('       nvl(a.dd9 , ''**'') dd9,                       ');
          SQL.Add('       nvl(a.dd10, ''**'') dd10,                      ');
          SQL.Add('       nvl(a.dd11, ''**'') dd11,                      ');
          SQL.Add('       nvl(a.dd12, ''**'') dd12,                      ');
          SQL.Add('       nvl(a.dd13, ''**'') dd13,                      ');
          SQL.Add('       nvl(a.dd14, ''**'') dd14,                      ');
          SQL.Add('       nvl(a.dd15, ''**'') dd15,                      ');
          SQL.Add('       nvl(a.dd16, ''**'') dd16,                      ');
          SQL.Add('       nvl(a.dd17, ''**'') dd17,                      ');
          SQL.Add('       nvl(a.dd18, ''**'') dd18,                      ');
          SQL.Add('       nvl(a.dd19, ''**'') dd19,                      ');
          SQL.Add('       nvl(a.dd20, ''**'') dd20,                      ');
          SQL.Add('       nvl(a.dd21, ''**'') dd21,                      ');
          SQL.Add('       nvl(a.dd22, ''**'') dd22,                      ');
          SQL.Add('       nvl(a.dd23, ''**'') dd23,                      ');
          SQL.Add('       nvl(a.dd24, ''**'') dd24,                      ');
          SQL.Add('       nvl(a.dd25, ''**'') dd25,                      ');
          SQL.Add('       nvl(a.dd26, ''**'') dd26,                      ');
          SQL.Add('       nvl(a.dd27, ''**'') dd27,                      ');
          SQL.Add('       nvl(a.dd28, ''**'') dd28,                      ');
          SQL.Add('       nvl(a.dd29, ''**'') dd29,                      ');
          SQL.Add('       nvl(a.dd30, ''**'') dd30,                      ');
          SQL.Add('       nvl(a.dd31, ''**'') dd31,                      ');
          SQL.Add('       b.paycl,                                       ');
          SQL.Add('       Substr(b.empdate,1,4)||''.''||                 '+#13
                 +'       Substr(b.empdate,5,2)||''.''||                 '+#13
                 +'       Substr(b.empdate,7,2) empdate,                 ');
          SQL.Add('       nvl(b.retdate, ''----.--.--'') retdate         ');
          SQL.Add('  from pkhduty a, pkmpmas b                           ');
          SQL.Add(' where a.duyymm between :P_duyymmFr and :P_duyymmTo   ');
          SQL.Add('   and a.empno between :P_empnoFr and :P_empnoTo      ');
          SQL.Add('   and a.orgnum = :P_orgnum                           ');

          if Chkdept.Checked = True then
          begin
               SQL.Add('   and a.deptcode = :P_deptcode   ');
               ParamByName('P_deptcode').AsString := Edeptcode.Text;
          end;

          SQL.Add('   and a.empno = b.empno                              ');
          SQL.Add('   and b.orgnum = a.orgnum                            ');
          SQL.Add(' order by a.empno, a.duyymm                           ');

          ParamByName('P_duyymmFr').AsString := MEduyymmfr.Text;
          ParamByName('P_duyymmTo').AsString := MEduyymmto.Text;
          ParamByName('P_empnoFr').AsString  := Eempnofr.Text;
          ParamByName('P_empnoTo').AsString  := Eempnoto.Text;
          ParamByName('P_orgnum').AsString   := Porgnum.Caption;

          Open;

          if RecordCount = 0 then
          begin
               Application.Messagebox('출력할 자료가 없습니다.', '작업안내', MB_OK);
               PhelpMsg.Caption :='';
               Result := False;
          end
          else
          begin

               qq := TOraQuery.Create(Nil);
               qq.Session := Ora_Session;

               Try
                    with qq do
                    begin
                         Close;
                         SQL.Clear;
                         SQL.Add('select rownum, dukind, duname   ');
                         SQL.Add('  from pkcducod                 ');
                         SQL.Add(' order by 1                     ');
                         Open;

                         while not eof do
                         begin
                              if (FieldByName('rownum').AsInteger mod 10) = 0 then tmp_Str := tmp_Str + #13;

                              if (FieldByName('rownum').AsInteger <> RecordCount) then
                              begin
                                   tmp_Str := tmp_Str + FieldByName('dukind').AsString + ' : ' + FieldByName('duname').AsString+', ';
                              end
                              else
                              begin
                                   tmp_Str := tmp_Str + FieldByName('dukind').AsString + ' : ' + FieldByName('duname').AsString;
                              end;

                              Next;
                         end;

                         Fpka40902.QRM_ducode.Lines.Add(tmp_Str);

                    end
               Finally
                    qq.Free;
               end;
          end;
     end;

end;

function TFpka40901.GetRecord2: Boolean;
begin
     Application.ProcessMessages;

     Fpka40903.OraQuery1.Session := Ora_Session;

     Result := True;

     with Fpka40903.OraQuery1 do
     begin
          Close;
          SQL.Clear;
          SQL.Add('select decode(grouping(a.duyymm),0,a.duyymm,1,''총합계'') duyymm,                           ');
          SQL.Add('       a.empno empno,                                                                       ');
          SQL.Add('       a.korname korname,                                                                   ');
          SQL.Add('       nvl(sum(a.normal   ), 0) normal ,                                                    ');
          SQL.Add('       nvl(sum(a.late     ), 0) late,                                                       ');
          SQL.Add('       nvl(sum(a.earleave ), 0) earleave,                                                   ');
          SQL.Add('       nvl(sum(a.repoff   ), 0) repoff,                                                     ');
          SQL.Add('       nvl(sum(a.speoff   ), 0) speoff,                                                     ');
          SQL.Add('       nvl(sum(a.satoff   ), 0) satoff,                                                     ');
          SQL.Add('       nvl(sum(a.domtour  ), 0) domtour,                                                    ');
          SQL.Add('       nvl(sum(a.seatour  ), 0) seatour,                                                    ');
          SQL.Add('       nvl(sum(a.corpdisp ), 0) corpdisp,                                                   ');
          SQL.Add('       nvl(sum(a.domdisp  ), 0) domdisp,                                                    ');
          SQL.Add('       nvl(sum(a.seadisp  ), 0) seadisp,                                                    ');
          SQL.Add('       nvl(sum(a.edu      ), 0) edu,                                                        ');
          SQL.Add('       nvl(sum(a.lodge    ), 0) lodge,                                                      ');
          SQL.Add('       nvl(sum(a.special  ), 0) special,                                                    ');
          SQL.Add('       nvl(sum(a.longwork ), 0) longwork,                                                   ');
          SQL.Add('       nvl(sum(a.pubvac   ), 0) pubvac,                                                     ');
          SQL.Add('       nvl(sum(a.pubsick  ), 0) pubsick,                                                    ');
          SQL.Add('       nvl(sum(a.bear     ), 0) bear,                                                       ');
          SQL.Add('       nvl(sum(a.celeb    ), 0) celeb,                                                      ');
          SQL.Add('       nvl(sum(a.birth    ), 0) birth,                                                      ');
          SQL.Add('       nvl(sum(a.health   ), 0) health,                                                     ');
          SQL.Add('       nvl(sum(a.half     ), 0) half,                                                       ');
          SQL.Add('       nvl(sum(a.month    ), 0) month,                                                      ');
          SQL.Add('       nvl(sum(a.year     ), 0) year,                                                       ');
          SQL.Add('       nvl(sum(a.sick     ), 0) sick,                                                       ');
          SQL.Add('       nvl(sum(a.absence  ), 0) absence,                                                    ');
          SQL.Add('       nvl(sum(a.pubrest  ), 0) pubrest,                                                    ');
          SQL.Add('       nvl(sum(a.sickrest ), 0) sickrest,                                                   ');
          SQL.Add('       nvl(sum(a.babyrest ), 0) babyrest,                                                   ');
          SQL.Add('       nvl(sum(a.milrest  ), 0) milrest,                                                    ');
          SQL.Add('       nvl(sum(a.stayrest ), 0) stayrest,                                                   ');
          SQL.Add('       nvl(sum(a.studyrest), 0) studyrest,                                                  ');
          SQL.Add('       nvl(sum(a.genrest  ), 0) genrest,                                                    ');
          SQL.Add('       nvl(sum(a.etcrest  ), 0) etcrest,                                                    ');
          SQL.Add('       nvl(sum(a.etc1     ), 0) etc1,                                                       ');
          SQL.Add('       nvl(sum(a.etc2     ), 0) etc2,                                                       ');
          SQL.Add('       nvl(sum(a.etc3     ), 0) etc3,                                                       ');
          SQL.Add('       nvl(sum(a.etc4     ), 0) etc4,                                                       ');
          SQL.Add('       nvl(sum(a.etc5     ), 0) etc5,                                                       ');
          SQL.Add('       nvl(sum(a.holiday  ), 0) holiday,                                                    ');
          SQL.Add('       nvl(sum(a.noinput  ), 0) noinput,                                                    ');
          SQL.Add('       nvl(sum(a.realdd   ), 0) realdd,                                                     ');
          SQL.Add('       nvl(sum(a.yearhalf ), 0) yearhalf,                                                   ');
          SQL.Add('       nvl(sum(a.workstop ), 0) workstop,                                                   ');
          SQL.Add('       nvl(sum(a.before   ), 0) before,                                                     ');
          SQL.Add('       nvl(sum(a.temporary), 0) temporary,                                                  ');
          SQL.Add('       nvl(sum(a.realdd   ), 0) realdd,                                                     ');
          SQL.Add('       nvl(decode(grouping(a.duyymm),0,min(a.fullyn),1,''--''),''--'') fullyn,              ');
          SQL.Add('       sum(to_number(substr(to_char(last_day(to_date(a.duyymm,''YYYYMM''))),7,2))) monthdd, ');
          SQL.Add('       max(b.paycl) paycl,                                                                  ');
          SQL.Add('       Substr(max(b.empdate),1,4)||''.''||                                                  '+#13
                 +'       Substr(max(b.empdate),5,2)||''.''||                                                  '+#13
                 +'       Substr(max(b.empdate),7,2) empdate,                                                  ');
          SQL.Add('       nvl(max(b.retdate), ''----.--.--'') retdate                                          ');
          SQL.Add('  from pkhduty a, pkmpmas b                                                                 ');
          SQL.Add(' where a.duyymm between :P_duyymmfr and :P_duyymmto                                         ');
          SQL.Add('   and a.empno between :P_empnofr and :P_empnoto                                            ');
          SQL.Add('   and a.orgnum = :P_orgnum                                                                 ');
          SQL.Add('   and a.deptcode = :P_deptcode                                                             ');
          SQL.Add('   and a.empno = b.empno                                                                    ');
          SQL.Add('   and a.orgnum = b.orgnum                                                                  ');
          SQL.Add(' group by rollup(a.duyymm), a.empno, a.korname                                              ');
          SQL.Add(' order by a.empno, a.duyymm                                                                 ');

          ParamByName('P_duyymmFr').AsString := MEduyymmfr.Text;
          ParamByName('P_duyymmTo').AsString := MEduyymmto.Text;
          ParamByName('P_empnoFr').AsString  := Eempnofr.Text;
          ParamByName('P_empnoTo').AsString  := Eempnoto.Text;
          ParamByName('P_orgnum').AsString   := Porgnum.Caption;
          ParamByName('P_deptcode').AsString := Edeptcode.Text;;
          Open;


          if RecordCount = 0 then
          begin
               Application.Messagebox('출력할 자료가 없습니다.', '작업안내', MB_OK);
               PhelpMsg.Caption :='';
               Result := False;
          end;
     end;


end;

end.
