{===================== Program Header ==========================================
 PROGRAM-NAME   : PKC3040C(급여 이력내역서 출력) -- 2Tier
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 월급여이력
 Programmer     :
 Version        : 1.00
 Date           : 1999.01.21

Update Contents
   Version    date(yy.mm.dd)     programmer      description     relevant doc.no
   31.01      2001.05.25.        유효성          2001.05월급여는 기금조성공제를 기타공제5로 수정
   32.00      2005.01.12         강륜종(das2000) 정보통신수당 신설에 따른 추가.
================================================================================}

unit pkc30401;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, DB, Mask, DBTables, Ora, Func, KeyEmpNo;

type
  TM_KC3040C = class(TForm)
    Panel1: TPanel;
    P_Help: TPanel;
    L_UserName: TLabel;
    L_Date: TLabel;
    BB_Run: TBitBtn;
    BB_SetUp: TBitBtn;
    BB_Close: TBitBtn;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Label2: TLabel;
    PrinterSetupDialog1: TPrinterSetupDialog;
    Panel7: TPanel;
    Panel2: TPanel;
    ME_FrPayMM: TMaskEdit;
    SB_FrPayMM: TSpeedButton;
    Bevel1: TBevel;
    Shape2: TShape;
    Label3: TLabel;
    Image2: TImage;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Panel6: TPanel;
    RBprinter: TRadioButton;
    RB_Screen: TRadioButton;
    SB_ToPayMM: TSpeedButton;
    ME_ToPayMM: TMaskEdit;
    Label4: TLabel;
    E_FrEmpNO: TEdit;
    SB_FrEmpNo: TSpeedButton;
    P_FrKorName: TPanel;
    Label13: TLabel;
    E_ToEmpNo: TEdit;
    SB_ToEmpNo: TSpeedButton;
    P_ToKorName: TPanel;
    procedure BB_CloseClick(Sender: TObject);
    procedure BB_SetUpClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BB_RunClick(Sender: TObject);
    procedure SB_FrPayMMClick(Sender: TObject);
    procedure SB_ToPayMMClick(Sender: TObject);
    procedure SB_FrEmpNoClick(Sender: TObject);
    procedure SB_ToEmpNoClick(Sender: TObject);
    procedure E_FrEmpNOKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure E_ToEmpNoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure E_FrEmpNOExit(Sender: TObject);
    procedure E_ToEmpNoExit(Sender: TObject);

  private
    { Private declarations }
    ActiveFlag   : Boolean;
    Index        : Integer;

  public
    { Public declarations }
    PayMM         : String[06];           {... 현급여지급월                  ...}
    gsStartYear : String;
    gsStartPayCl: String;
    gsChangeDatePaycl : string;
    Function Check_EmpNO : Boolean;
    Function Check_All : Boolean;
    Function Check_Existence : Boolean;
    Procedure Read_PayDate;
    Procedure Set_Empno;
    Procedure SetUp;
  end;

var
  M_KC3040C  : TM_KC3040C;

implementation

{$R *.DFM}

uses FormMon1, pkc30402, pkc30405;  //Calen2 ==> FormMon1   교체..

{===============================================================================
 ======================  < User Define Functions >  ============================
 ===============================================================================}


{==============================================================================
         작업자의 사번이 급여마스터에 등록되어 있는 지를 체크하는 함수.
 ==============================================================================}
Function TM_KC3040C.Check_EmpNO : Boolean;
var
     qq : TOraQuery;
begin
     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     Try
          with qq do
          begin
               Close;
               SQL.Add('select Count(*) from pkmpmas    ');
               SQL.Add(' where empno = :empno           ');
               ParamByName('empno').AsString := PEmpNO;
               Open;

               if Fields[0].AsInteger > 0 then
                    Result  := True
               else
                    Result := False;
          end;
     Finally
          qq.Free;
     end;

     if Copy(PEmpno,1,1) = 'D' then Result := True;
end;

{===============================================================================
         조회하기 전에 조회 조건을 검사하는 함수.
 ===============================================================================}
Function TM_KC3040C.Check_All : Boolean;
begin
     if fn_IsDate(ME_FrPayMM.Text+'01') = False then
     begin
          Application.MessageBox('From 날짜가 올바르지 않습니다.','작업안내',MB_OK+MB_ICONWARNING);
          ME_FrPayMM.SetFocus;
          Result := False;
          System.Exit;
     end;

     if fn_IsDate(ME_ToPayMM.Text+'01') = False then
     begin
          Application.MessageBox('To 날짜가 올바르지 않습니다.','작업안내',MB_OK+MB_ICONWARNING);
          ME_ToPayMM.SetFocus;
          Result := False;
          System.Exit;
     end;

     Result := True;

     if Length(E_FrEmpNo.Text) <> 4 then
     begin
          P_Help.Caption := '   사번을 4자리로 입력하십시요...';
          E_FrEmpNo.SetFocus;
          Result         := False;
          System.Exit;
     end;

     if Length(E_ToEmpNo.Text) <> 4 then
     begin
          P_Help.Caption := '   사번을 4자리로 입력하십시요...';
          E_ToEmpNo.SetFocus;
          Result         := False;
          System.Exit;
     end;

     if E_FrEmpNo.Text > E_ToEmpNo.Text then
     begin
          P_Help.Caption := '   사번From이 사번To보다 더 큽니다...';
          E_FrEmpNo.SetFocus;
          Result         := False;
          System.Exit;
     end;

end;

{===============================================================================
           조회전에 조회조건을 만족하는 자료가 있는 지를
           Check하는 함수.
 ===============================================================================}
Function TM_KC3040C.Check_Existence : Boolean;
var
     qq : TOraQuery;
begin
     P_Help.Caption := '   조건을 만족하는 자료검색 중...';
     Application.ProcessMessages;

     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     Try
          with qq do
          begin
               Close;
               SQL.Clear;
               SQL.Add('select count(*) from pkhphis                     ');
               SQL.Add(' where empno between :frempno and :toempno       ');
               SQL.Add('   and paydate between :paydate1 and :paydate2   ');
               ParamByName('frempno').AsString  := E_FrEmpNo.Text;
               ParamByName('toempno').AsString  := E_ToEmpNo.Text;
               ParamByName('paydate1').AsString := ME_FrPayMM.Text;
               ParamByName('paydate2').AsString := ME_ToPayMM.Text;
               Open;

               if Fields[0].AsInteger > 0 then
               begin
                    Result := True;
                    P_Help.Caption := '';
               end
               else
               begin
                    Result := False;
                    P_Help.Caption := '   조건을 만족하는 자료가 없습니다...';
               end;
          end;
     Finally
          qq.Free;
     end;
end;


{===============================================================================
 ======================  < User Define Procedures >  ===========================
 ===============================================================================}

{===============================================================================
          현급여지급월을 읽는 Procedure.
 ===============================================================================}
Procedure TM_KC3040C.Read_PayDate;
var
     qq : TOraQuery;
begin
     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     Try
          with qq do
          begin
               Close;
               SQL.Clear;
               SQL.Add('select max(paydate) from pkmpcalc ');
               Open;

               if qq.Eof then PayMM := ''
               else           PayMM := Fields[0].AsString;

          end;
     Finally
          qq.Free;
     end;
end;


{===============================================================================
          작업자의 권한에 따른 사번입력범위의 값을 설정하는 Procedure.
 ===============================================================================}
Procedure TM_KC3040C.Set_Empno;
begin
     if Check_EmpNO then
     begin
          if (UpperCase(Copy(PGrade,3,1)) = 'A') or (UpperCase(Copy(PGrade,3,1)) = 'B') then
               Index := 2
          else
               Index := 1;
     end
     else
          Index := 0;

     Case Index of
          0 :
          begin
               P_Help.Caption := '   귀하께서는 급여마스터에 등록되지 않은 사번입니다.' +
                                 ' 작업이 불가능합니다...';

               E_FrEmpNO.Text     := '';
               E_ToEmpNo.Text     := '';
               P_FrKorName.Caption := '';
               P_ToKorName.Caption := '';
               E_FrEmpNo.Enabled  := False;
               E_ToEmpNO.Enabled  := False;
               SB_FrEmpNo.Enabled := False;
               SB_ToEmpNo.Enabled := False;
               BB_Run.Enabled     := False;
          end;
          1 :
          begin
               E_FrEmpNO.Text     := PEmpNo;
               E_ToEmpNo.Text     := PEmpNo;
               P_FrKorName.Caption := GetKorName(E_FrEmpNO.Text);
               P_ToKorName.Caption := GetKorName(E_ToEmpNO.Text);
               E_FrEmpNo.Enabled  := False;
               E_ToEmpNO.Enabled  := False;
               SB_FrEmpNo.Enabled := False;
               SB_ToEmpNo.Enabled := False;
          end;
          2 :
          begin
               E_FrEmpNO.Text     := PEmpNo;
               E_ToEmpNo.Text     := PEmpNo;
               P_FrKorName.Caption := GetKorName(E_FrEmpNO.Text);
               P_ToKorName.Caption := GetKorName(E_ToEmpNO.Text);
               E_FrEmpNo.Enabled  := True;
               E_ToEmpNO.Enabled  := True;
               SB_FrEmpNo.Enabled := True;
               SB_ToEmpNo.Enabled := True;
          end;
     end;
end;


{==============================================================================
         초기화를 수행하는 Procedure.
 ==============================================================================}
Procedure TM_KC3040C.SetUp;
begin
     ActiveFlag := False;
     P_Help.Caption := '   급여시스템에 접속 중입니다...';

     OraConnect;

     L_Date.Caption      := fn_GetDateStr;
     L_UserName.Caption  := PKorName+ '(' + Pempno + ')';
     Application.ProcessMessages;

     P_Help.Caption := '   현급여지급월을 읽고 있습니다...';
     Application.ProcessMessages;
     Read_PayDate;

     ME_FrPayMM.Text := PayMM;
     ME_ToPayMM.Text := PayMM;

     Set_EmpNo;
     P_Help.Caption := '';

     gsStartYear := '199901';
     gsStartPayCl:= '09';
end;

{ ==============================================================================
  ===================       Event Handlers      ================================
  ============================================================================== }

procedure TM_KC3040C.BB_CloseClick(Sender: TObject);
begin
     P_Help.Caption := '';
     Close;
end;

procedure TM_KC3040C.BB_SetUpClick(Sender: TObject);
begin
     P_Help.Caption := '';
     PrinterSetupDialog1.Execute;
end;

procedure TM_KC3040C.FormActivate(Sender: TObject);
begin
     if ActiveFlag then SetUp;
end;

procedure TM_KC3040C.FormCreate(Sender: TObject);
begin
     ActiveFlag := True;
end;

procedure TM_KC3040C.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     if IDYes = Application.MessageBox('종료하시겠습니까?','확 인',MB_YesNo) then
     begin
          Action := caFree;
     end
     else
          Action := caNone;
end;

procedure TM_KC3040C.BB_RunClick(Sender: TObject);
var
   qq : Toraquery;
begin
     P_Help.Caption := '';

     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     Try
          with qq do
          begin
               Close;
               Sql.Clear;
               Sql.add('SELECT VALUE4 FROM PIMVARI WHERE GUBUN = ''00'' AND SGUBUN = ''0001''    ');
               Open;

               gsChangeDatePaycl   := FieldByName('VALUE4').AsString;
          end;
     Finally
          qq.Free;
     end;     

     SReportF2.Get_Records;

     if Check_All AND Check_Existence then
     begin
          // Del2.0-->3.0
          if RB_Screen.Checked then
          begin
              SReportF2.QReport.Preview;
          end
          else
          begin
              SReportF2.QReport.Print;
          end;
     end;
end;

procedure TM_KC3040C.SB_FrPayMMClick(Sender: TObject);
begin
     Try
         MonthForm := TMonthForm.Create(Self);
         MonthForm.ShowModal;
         if MonthForm.DayCaption <> '' then
            ME_FrPayMM.Text := Copy(MonthForm.DayCaption,1,6);
     Finally
         MonthForm.Free;
     End;
end;

procedure TM_KC3040C.SB_ToPayMMClick(Sender: TObject);
begin
     Try
         MonthForm := TMonthForm.Create(Self);
         MonthForm.ShowModal;
         if MonthForm.DayCaption <> '' then
            ME_ToPayMM.Text := Copy(MonthForm.DayCaption,1,6);
     Finally
         MonthForm.Free;
     End;

end;

procedure TM_KC3040C.SB_FrEmpNoClick(Sender: TObject);
begin
     Try
          FKeyEmpno := TFKeyEmpno.Create(Self);
          FKeyEmpno.v_Table_Name := 'pkmpmas';
          FKeyEmpno.EdEmpno.Text := E_FrEmpNo.Text;
          FKeyEmpno.ShowModal;
          if FKeyEmpno.CloseChk <> -1 then
          begin
               E_FrEmpNo.Text      := FKeyEmpno.v_KeyEmpno;
               P_FrKorname.Caption := FKeyEmpno.v_KeyKorname;
          end;
     Finally
          FKeyEmpno.Free;
     end;
end;

procedure TM_KC3040C.SB_ToEmpNoClick(Sender: TObject);
begin
     Try
          FKeyEmpno := TFKeyEmpno.Create(Self);
          FKeyEmpno.v_Table_Name := 'pkmpmas';
          FKeyEmpno.EdEmpno.Text := E_ToEmpNo.Text;
          FKeyEmpno.ShowModal;
          if FKeyEmpno.CloseChk <> -1 then
          begin
               E_ToEmpNo.Text      := FKeyEmpno.v_KeyEmpno;
               P_ToKorname.Caption := FKeyEmpno.v_KeyKorname;
          end;
     Finally
          FKeyEmpno.Free;
     end;
end;

procedure TM_KC3040C.E_FrEmpNOKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = VK_RETURN then
          P_FrKorName.Caption := GetKorName(E_FrEmpNO.Text);
end;

procedure TM_KC3040C.E_ToEmpNoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = VK_RETURN then
          P_ToKorName.Caption := GetKorName(E_ToEmpNO.Text);
end;

procedure TM_KC3040C.E_FrEmpNOExit(Sender: TObject);
begin
     P_FrKorName.Caption := GetKorName(E_FrEmpNO.Text);
end;

procedure TM_KC3040C.E_ToEmpNoExit(Sender: TObject);
begin
     P_ToKorName.Caption := GetKorName(E_ToEmpNO.Text);
end;

end.

