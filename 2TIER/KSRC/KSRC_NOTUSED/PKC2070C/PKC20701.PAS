{===================== Program Header ==========================================
 PROGRAM-NAME   : PKC2070C(개인별 급여명세서 출력)
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 급여List
 Programmer     : 김승회
 Version        : 30.00
 Date           : 1998.12.29

Update Contents
   Version    date(yy.mm.dd)     programmer      description     relevant doc.no
   10.00       1997.12.01         김승회          최초개발본      설계명세서
   30.00       1998.12.29        김승회          출력물양식변경   하나로인사재개발
   =>
   - 추가항목 : 월정급여,분기급여,명절급여,직책수당
   - 삭제항목 : 기존 지급항목 중 사용하지 않게 될 항목(변경된 급여항목표 참조)
   30.01       1999.01.25        송두호          출력물버젼업    하나로인사재개발
   35.00       2001.02.20        유효성          임원 연봉제 실시에 따른 출력물 변경
   36.00       2005.01.11        강륜종          정보통신수당 신설. 
================================================================================}

unit pkc20701;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, DB, Quickrpt, Mask, DBTables ,
  Animate;

type
  TCodePtr = ^TCode;
  TCode = Record
     CodeNo   : String[05];
     CodeName : String[30];
     Ptr      : TCodePtr;
  end;

  TDeptPtr = ^TDept;
  TDept    = Record
     OrgNum   : String[03];
     DeptCode : String[06];
     DeptName : String[60];
     Ptr      : TDeptPtr;
  end;

  TM_KC2070C = class(TForm)
    Panel1: TPanel;
    P_Help: TPanel;
    BB_Run: TBitBtn;
    BB_SetUp: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Database1: TDatabase;
    PrinterSetupDialog1: TPrinterSetupDialog;
    Qry1: TQuery;
    GroupBox1: TGroupBox;
    Shape1: TShape;
    Label1: TLabel;
    L_UserName: TLabel;
    L_Date: TLabel;
    Image1: TImage;
    Label2: TLabel;
    SB_FrEmpNo: TSpeedButton;
    Label13: TLabel;
    SB_ToEmpNo: TSpeedButton;
    Label6: TLabel;
    Label7: TLabel;
    SB_FrDeptCode: TSpeedButton;
    SB_ToDeptCode: TSpeedButton;
    Label3: TLabel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    GroupBox2: TGroupBox;
    RB_Screen: TRadioButton;
    RBprinter: TRadioButton;
    E_FrEmpNO: TEdit;
    E_ToEmpNo: TEdit;
    P_PayMM: TPanel;
    Panel2: TPanel;
    RB_Order1: TRadioButton;
    RB_Order2: TRadioButton;
    Panel8: TPanel;
    ME_FrOrgNum: TMaskEdit;
    ME_FrDeptCode: TMaskEdit;
    ME_ToOrgNum: TMaskEdit;
    ME_ToDeptCode: TMaskEdit;
    P_FrKorName: TPanel;
    P_ToKorName: TPanel;
    P_FrDeptName: TPanel;
    P_ToDeptName: TPanel;
    Query1: TQuery;
    procedure SB_FrEmpNoClick(Sender: TObject);
    procedure SB_ToEmpNoClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BB_SetUpClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BB_RunClick(Sender: TObject);
    procedure SB_FrDeptCodeClick(Sender: TObject);
    procedure SB_ToDeptCodeClick(Sender: TObject);
    procedure E_FrEmpNOKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure E_ToEmpNoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn3Click(Sender: TObject);
    procedure E_FrEmpNOExit(Sender: TObject);
    procedure E_ToEmpNoExit(Sender: TObject);
  private
    { Private declarations }
    ActiveFlag   : Boolean;
    Index        : Integer;
  public
    { Public declarations }
    Empno         : String[04];           {... 사번                          ...}
    KorName       : String[12];           {... 성명                          ...}
    PassWord      : String[10];           {... 패스워드                      ...}
    Grade         : String[01];           {... 사용등급                      ...}
    UserID        : String[20];
    DBPasswd      : String[20];
//    Choice        : String[01];

    CurDate       : String[20];           {... 서버날짜                      ...}
    CurOrgNum     : String[03];           {... 현조직차수                    ...}

    CI112        : TCodePtr;
    CI113        : TCodePtr;
    CK910        : TCodePtr;
    DeptFirst    : TDeptPtr;
    PayMM        : String[06];           {... 현급여지급월                  ...}
    BonCode      : String;

    Function Get_KorName( Empno : String ) : String;
    Function Get_DeptName( OrgNum, DeptCode : String ) : String;
//    Function Get_CodeName(var Start : TCodePtr; CodeNo  : String ) : String;
    Function Get_CodeName(CodeId, CodeNo  : String ) : String;
    Function Check_EmpNO : Boolean;
    Function Check_All : Boolean;
    Function Check_Existence : Boolean;
    Function Display_Msg : String;

    Procedure View;
    Procedure Read_PayDate;
    Procedure Read_CurOrgNum;
    Procedure Read_DeptTable;
    Procedure Set_InitEnv;
    Procedure Set_DeptTable;
    Procedure Free_DeptTable;
    Procedure Set_CodeTable(var First : TCodePtr; CodeID : String );
    Procedure Free_CodeTable(var First : TCodePtr );
    Procedure SetUp;
  end;

var
  M_KC2070C: TM_KC2070C;
  GSusrid  : Integer;
  function Get_Path(arg_q:Tquery;arg_Userid:String):String;

implementation

{$R *.DFM}

uses
    KEmpNo, KDept, Pass, userhelp, Pkc20703, pkc20707;

{===============================================================================
 ======================  < User Define Functions >  ============================
 ===============================================================================}
{===============================================================================
         출력 디렉토리 설정
 ===============================================================================}
  function Get_Path(arg_q:Tquery;arg_Userid:String):String;
  begin
      with arg_q do
      begin
          close;
          Sql.clear;
          Sql.Add('SELECT DIR,USRID FROM PYMSYS WHERE UName = '''+Arg_Userid+'''');
          Open;
          Get_Path := Fieldbyname('DIR').AsString;
          GSusrid  := Fieldbyname('USRID').AsInteger;
          Close;
      end;
  end;

{==============================================================================
         작업자의 사번이 급여마스터에 등록되어 있는 지를 체크하는 함수.
 ==============================================================================}
Function TM_KC2070C.Check_EmpNO : Boolean;
begin
     Qry1.Close;
     Qry1.Sql.Clear;
     Qry1.Sql.Add( ' SELECT COUNT(*)                                            ' );
     Qry1.Sql.Add( ' FROM   PKMPMAS                                             ' );
     Qry1.Sql.Add( ' WHERE  EMPNO = :empno                                      ' );
     Qry1.ParamByName('empno').AsString := EmpNO;
     Qry1.Open;

     if Qry1.Fields[0].AsInteger > 0 then
        begin
             Qry1.Close;
             Qry1.Sql.Clear;
             Qry1.Sql.Add( ' SELECT BONCODE FROM PKMPCALC WHERE EMPNO = :empno ' );
             Qry1.ParamByName('empno').AsString := EmpNo;
             Qry1.Open;
             BONCODE := Qry1.FieldByName('BONCODE').AsString;
             Result  := True;
        end
     else
        begin
             BonCode := '';
             Result  := False;
        end;

     if Copy(Empno,1,1) = 'D' then
       Result  := True;
       
     Qry1.Close;
end;

{===============================================================================
         조회하기 전에 조회 조건을 검사하는 함수.
 ===============================================================================}
Function TM_KC2070C.Check_All : Boolean;
begin
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

     Result := True;
     P_Help.Caption := '';
end;

{===============================================================================
           조회전에 조회조건을 만족하는 자료가 있는 지를
           Check하는 함수.
 ===============================================================================}
Function TM_KC2070C.Check_Existence : Boolean;
begin
     Qry1.Close;
     Qry1.Sql.Clear;
     Qry1.Sql.Add( ' SELECT COUNT(*)                                              ' );
     Qry1.Sql.Add( ' FROM   PKMPCALC                                              ' );
     Qry1.Sql.Add( ' WHERE (EMPNO  >= :frempno AND EMPNO <= :toempno AND          ' );
     Qry1.Sql.Add( '        PAYDATE = :paydate) AND                               ' );
     Qry1.Sql.Add( '       (ORGNUM >= :frorgnum AND ORGNUM <= :toorgnum ) AND     ' );
     Qry1.Sql.Add( '       (DEPTCODE >= :frdeptcode AND                           ' );
     Qry1.Sql.Add( '        DEPTCODE <= :todeptcode )                             ' );
     Qry1.ParamByName('frempno').AsString    := E_FrEmpNo.Text;
     Qry1.ParamByName('toempno').AsString    := E_ToEmpNo.Text;
     Qry1.ParamByName('paydate').AsString    := PayMM;
     Qry1.ParamByName('frorgnum').AsString   := ME_FrOrgNum.Text;
     Qry1.ParamByName('toorgnum').AsString   := ME_ToOrgNum.Text;
     Qry1.ParamByName('frdeptcode').AsString := ME_FrDeptCode.Text;
     Qry1.ParamByName('todeptcode').AsString := ME_ToDeptCode.Text;
     Qry1.Open;

     if Qry1.Fields[0].AsInteger > 0 then
        Result := True
     else
        begin
             Application.MessageBox('조건에 맞는 자료가 한 건도 없습니다!!!','작업안내',MB_OK);
             Result := False;
        end;
     Qry1.Close;
end;

{===============================================================================
          사번이 결정되면 급여마스터에서 그 사람의 성명을 가져오는 Procedure.
 ===============================================================================}
Function TM_KC2070C.Get_KorName( Empno : String ) : String;
begin
  Qry1.Close;
  Qry1.Sql.Clear;
  Qry1.Sql.Add( ' SELECT KORNAME                                 ' );
  Qry1.Sql.Add( ' FROM   PKMPMAS                                 ' );
  Qry1.Sql.Add( ' WHERE  EMPNO = :pvar                           ' );
  Qry1.ParamByName('pvar').AsString := EmpNO;
  Qry1.Open;

  if not Qry1.Eof then
     Result := Qry1.FieldbyName('KorName').AsString
  else
     Result := '';
  Qry1.Close;
end;

{==============================================================================
         부서 테이블에서 해당 코드값에 대한 코드명을 가져오는 함수.
 ==============================================================================}
{==============================================================================
         부서명을 가져오는 함수.
 ==============================================================================}
Function TM_KC2070C.Get_DeptName(OrgNum, DeptCode : String ) : String;
begin
     Qry1.Close;
     Qry1.Sql.Clear;
     Qry1.Sql.Add( ' SELECT DEPTNAME                                               ' );
     Qry1.Sql.Add( ' FROM   PYCDEPT                                                ' );
     Qry1.Sql.Add( ' WHERE  DEPTCODE = :deptcode AND ORGNUM = :orgnum              ' );
     Qry1.ParamByName('deptcode').AsString := DeptCode;
     Qry1.ParamByName('orgnum').AsString   := OrgNum;
     Qry1.Open;

     if not Qry1.Eof then
         Result := Qry1.FieldByName('DeptName').AsString
     else
         Result := '';
     Qry1.Close;
end;

{==============================================================================
         Code 테이블에서 해당 코드값에 대한 코드명을 가져오는 함수.
 ==============================================================================}
//Function TM_KC2070C.Get_CodeName(var Start : TCodePtr; CodeNo  : String ) : String;
Function TM_KC2070C.Get_CodeName(CodeId ,CodeNo  : String ) : String;
begin
     with Query1 do
     begin
          Close;
          Sql.Clear;
          Sql.Add( ' SELECT CODENO, CODENAME                                  ' );
          Sql.Add( ' FROM   PYCCODE                                           ' );
          Sql.Add( ' WHERE  CODEID = :CodeID                                  ' );
          Sql.Add( ' AND    CODENO = :CodeNO                                  ' );
          ParamByName('codeid').AsString := CodeID;
          ParamByName('codeNO').AsString := CodeNO;
          Open;
          result :=      FieldByName('codeNAME').AsString ;
          close;
     end;


{     Cur := Start;
     if Cur = NIL then
        begin
             Result := '';
             System.Exit;
        end;

     Flag := False;
     While (Cur^.Ptr <> Nil) do
           begin
                if Cur^.CodeNO = CodeNo then
                   begin
                        Flag := True;
                        System.Break;
                   end
                else
                   Cur := Cur^.Ptr;
           end;

     if Flag then
        Result := Cur^.CodeName
     else
        begin
             if Cur^.CodeNo = CodeNo then
                Result := Cur^.CodeName
             else
                Result := '';
        end;
 }
end;

{===============================================================================
          서버Progragm 의 실행 결과를 메모에 집어 넣는 함수.
 ===============================================================================}
Function TM_KC2070C.Display_Msg : String;
var
   i,j     : LongInt;
   Temp    : Array[0..200] of Char;
   str     : String;
begin
     {/ ===============================================================================
        Version  date(yy.mm.dd)  programmer  description      relevant doc.no
   	30.00    1998.12.29      김승회      출력물양식변경    하나로인사재개발
      => Pro*C 호출부분 comment 처리
	=============================================================================== /}
     {
     i     := 0;
     j     := 0;

     Socket.LastMsg[Socket.Len] :=  #0;

     While Socket.LastMsg[i] <> #0 do
     begin
          if Socket.LastMsg[i] <> #10 then
             begin
                  Temp[j] := Socket.LastMsg[i];
                  i := i + 1;
                  j := j + 1;
             end
          else
              begin
                 i := i + 1;
                 Temp[j] := #0;
                 j := 0;
                 Str   := StrPas( Temp );
                 Application.ProcessMessages;
              end;
     end;

     Result := Str;
     }
end;

{===============================================================================
 ======================  < User Define Procedures >  ===========================
 ===============================================================================}

{===============================================================================
         사용자 정의 미리보기 Form을 생성하는 Procedure.
 ===============================================================================}
Procedure TM_KC2070C.View;
begin
     Try
     PreviewForm := TPreviewForm.Create(Self);
     PreviewForm.ShowModal;
     Finally
     PreviewForm.Free;
     end;
end;

{===============================================================================
          현급여지급월을 읽는 Procedure.
 ===============================================================================}
Procedure TM_KC2070C.Read_PayDate;
begin
     Qry1.Close;
     Qry1.Sql.Clear;
     Qry1.Sql.Add( ' SELECT MAX(PAYDATE) FROM PKMPCALC ' );
     Qry1.Open;

     if Qry1.Eof then
        begin
             P_PayMM.Caption := '';
             PayMM           := '';
        end
     else
        begin
             P_PayMM.Caption := Copy(Qry1.Fields[0].AsString,1,4) + '-' +
                                Copy(Qry1.Fields[0].AsString,5,2);
             PayMM           := Qry1.Fields[0].AsString;
        end;
     Qry1.Close;
end;

{===============================================================================
          현조직차수를 구하는 Procedure.
 ===============================================================================}
Procedure TM_KC2070C.Read_CurOrgNum;
begin
     Qry1.Close;
     Qry1.Sql.Clear;
//     Qry1.Sql.Add( ' SELECT MAX(ORGNUM) FROM PYCDEPT ' );
     Qry1.Sql.Add( ' SELECT value1 from pimvari where gubun=''00'' and sgubun=''0001'' ' );
     Qry1.Open;
     ME_FrOrgNum.Text := Qry1.Fields[0].AsString;
     ME_ToOrgNum.Text := Qry1.Fields[0].AsString;
     CurOrgNum        := Qry1.Fields[0].AsString;
     Qry1.Close;
end;

{===============================================================================
          각 조직차수에 대한 최소,최대 부서코드값을 읽는 Procedure.
 ===============================================================================}
Procedure TM_KC2070C.Read_DeptTable;
begin
     Qry1.Close;
     Qry1.Sql.Clear;
     Qry1.Sql.Add( ' SELECT MIN(DEPTCODE), MAX(DEPTCODE)                        ' );
     Qry1.Sql.Add( ' FROM   PYCDEPT                                             ' );
     Qry1.Sql.Add( ' WHERE  ORGNUM = :orgnum                                    ' );
     Qry1.ParamByName('orgnum').AsString := CurOrgNum;
     Qry1.Open;
     ME_FrDeptCode.Text := Qry1.Fields[0].AsString;
     ME_ToDeptCode.Text := Qry1.Fields[1].AsString;
     Qry1.Close;
end;


{===============================================================================
          작업자의 권한에 따른 사번입력범위의 값을 설정하는 Procedure.
 ===============================================================================}
Procedure TM_KC2070C.Set_InitEnv;
begin
     if Check_EmpNO then
        begin
             if (UpperCase(Grade) = 'A') OR (UpperCase(Grade) = 'B') OR (UpperCase(Grade) = 'C') then
                Index := 3
             else
                begin
                     if (UpperCase(Grade) = 'E') then
                        Index := 2
                     else
                        Index := 1;
                end;
        end
     else
        Index := 0;

     Case Index of
          0 :
              begin
                   P_Help.Caption := '   귀하께서는 급여마스터에 등록되지 않은 사번입니다.' +
                                     ' 작업이 불가능합니다...';

                   E_FrEmpNO.Text        := '';
                   E_ToEmpNo.Text        := '';
                   E_FrEmpNo.Enabled     := False;
                   E_ToEmpNO.Enabled     := False;
                   SB_FrEmpNo.Enabled    := False;
                   SB_ToEmpNo.Enabled    := False;
                   ME_FrOrgNum.Enabled   := False;
                   ME_ToOrgNum.Enabled   := False;
                   ME_FrDeptCode.Enabled := False;
                   ME_ToDeptCode.Enabled := False;
                   SB_FrDeptCode.Enabled := False;
                   SB_ToDeptCode.Enabled := False;
                   BB_Run.Enabled        := False;
              end;
          1 :
              begin
                   E_FrEmpNO.Text        := EmpNo;
                   E_ToEmpNo.Text        := EmpNo;
                   E_FrEmpNo.Enabled     := False;
                   E_ToEmpNO.Enabled     := False;
                   SB_FrEmpNo.Enabled    := False;
                   SB_ToEmpNo.Enabled    := False;
                   ME_FrOrgNum.Enabled   := False;
                   ME_ToOrgNum.Enabled   := False;
                   ME_FrDeptCode.Enabled := False;
                   ME_ToDeptCode.Enabled := False;
                   SB_FrDeptCode.Enabled := False;
                   SB_ToDeptCode.Enabled := False;

                   RB_Order1.Enabled     := False;
                   RB_Order2.Checked     := True;

     {/ ===============================================================================
        Version  date(yy.mm.dd)  programmer  description      relevant doc.no
   	30.00    1998.12.29      김승회      출력물양식변경    하나로인사재개발
      => L/P 출력옵션 comment 처리
	=============================================================================== /}

                   //RB_LP.Enabled         := False;
              end;
          2 :
              begin
                   E_FrEmpNO.Text        := '0000';
                   E_ToEmpNo.Text        := 'zzzz';
                   E_FrEmpNo.Enabled     := False;
                   E_ToEmpNO.Enabled     := False;
                   SB_FrEmpNo.Enabled    := False;
                   SB_ToEmpNo.Enabled    := False;
                   ME_FrOrgNum.Enabled   := True;
                   ME_ToOrgNum.Enabled   := True;
                   ME_FrDeptCode.Enabled := True;
                   ME_ToDeptCode.Enabled := True;
                   SB_FrDeptCode.Enabled := True;
                   SB_ToDeptCode.Enabled := True;
              end;
     end;
end;

{===============================================================================
         부서명에 대한 Single Linked List를 만드는 Porcedure.
 ===============================================================================}
Procedure TM_KC2070C.Set_DeptTable;
var
   Cur, Prev : TDeptPtr;
   i         : Integer;
begin
     Qry1.Close;
     Qry1.Sql.Clear;
     Qry1.Sql.Add( ' SELECT ORGNUM, DEPTCODE, DEPTNAME                        ' );
     Qry1.Sql.Add( ' FROM   PYCDEPT                                           ' );
     Qry1.Open;

     if Qry1.Eof then
        begin
             DeptFirst := Nil;
             Qry1.Close;
             System.Exit;
        end;

     For i := 1 to Qry1.RecordCount do
         begin
              Prev := Cur;
              New(Cur);
              if i = 1 then
                 DeptFirst := Cur;

              Cur^.Orgnum     := Qry1.FieldByName('OrgNum').AsString;
              Cur^.DeptCode   := Qry1.FieldByName('DeptCode').AsString;
              Cur^.DeptName   := Qry1.FieldByName('DeptName').AsString;

              if i > 1 then
                 Prev^.ptr  := Cur;
              Qry1.Next;
         end;

     Cur^.Ptr := Nil;
     Qry1.Close;
end;

{===============================================================================
         부서에 대한 Single Linked List를 해제시키는 Porcedure.
 ===============================================================================}
Procedure TM_KC2070C.Free_DeptTable;
var
     Temp1,Temp2 : TDeptPtr;
begin
     Temp1 := DeptFirst;
     While Temp1^.Ptr <> NIL do
           begin
                Temp2 := Temp1^.ptr;
                Dispose( Temp1 );
                Temp1 := Temp2;
           end;
     Dispose( Temp1 );
end;

{===============================================================================
         Code에 대한 Single Linked List를 만드는 Porcedure.
 ===============================================================================}
Procedure TM_KC2070C.Set_CodeTable(var First : TCodePtr; CodeID : String );
var
   Cur, Prev : TCodePtr;
   i         : Integer;
begin
     Qry1.Close;
     Qry1.Sql.Clear;
     Qry1.Sql.Add( ' SELECT CODENO, CODENAME                                  ' );
     Qry1.Sql.Add( ' FROM   PYCCODE                                           ' );
     Qry1.Sql.Add( ' WHERE  CODEID = :CodeID                                  ' );
     Qry1.ParamByName('codeid').AsString := CodeID;
     Qry1.Open;

     if Qry1.Eof then
        begin
             First := Nil;
             Qry1.Close;
             System.Exit;
        end;

     For i := 1 to Qry1.RecordCount do
         begin
              Prev := Cur;
              New(Cur);
              if i = 1 then
                 First := Cur;

              Cur^.CodeNo     := Qry1.FieldByName('CodeNo').AsString;
              Cur^.CodeName   := Qry1.FieldByName('CodeName').AsString;

              if i > 1 then
                 Prev^.ptr  := Cur;
              Qry1.Next;
         end;

     Cur^.Ptr := Nil;
     Qry1.Close;
end;

{===============================================================================
         Code에 대한 Single Linked List를 해제시키는 Porcedure.
 ===============================================================================}
Procedure TM_KC2070C.Free_CodeTable(var First : TCodePtr );
var
     Temp1,Temp2 : TCodePtr;
begin
     Temp1 := First;
     While Temp1^.Ptr <> NIL do
           begin
                Temp2 := Temp1^.ptr;
                Dispose( Temp1 );
                Temp1 := Temp2;
           end;
     Dispose( Temp1 );
end;

{==============================================================================
         초기화를 수행하는 Procedure.
 ==============================================================================}
Procedure TM_KC2070C.SetUp;
var
   i : integer;
   j : Integer;
begin
     ActiveFlag := False;
     P_Help.Caption := '   급여시스템에 접속 중입니다...';
     Empno          := PassEmp(cmdline,1);
     Korname        := PassEmp(cmdline,2);
     Password       := PassEmp(cmdline,3);
     Grade          := UpperCase(Copy(PassEmp(cmdline,4),3,1));
     UserID         := PassEmp(cmdline,5);
     DBPassWD       := PassEmp(cmdline,6);

     Application.ProcessMessages;
     for i := 0 to Database1.Params.Count-1 do
     begin
       if System.Pos('SERVER NAME', Database1.Params[i]) > 0 then
         Database1.Params[i] := 'SERVER NAME='+PassEmp(CmdLine,13);
       if System.Pos('USER NAME', Database1.Params[i]) > 0 then
         Database1.Params[i] := 'USER NAME='+PassEmp(CmdLine,5);
       if System.Pos('PASSWORD', Database1.Params[i]) > 0 then
         Database1.Params[i] := 'PASSWORD='+PassEmp(CmdLine,6);
     end;
     Database1.Connected := True;
{* ***************************************************************************************
     Using Tsocket
     setting ip,userid,password
***************************************************************************************** *}

   {/ ===============================================================================
        Version  date(yy.mm.dd)  programmer  description      relevant doc.no
   	30.00    1998.12.29      김승회      출력물양식변경    하나로인사재개발
      => Pro*C 호출부분 comment 처리
      =============================================================================== /}

   //프로그램 수정 DB Server부분을 Parameter로 받게끔 함 .98.2.02 By leerk //
   {
     Socket.IPAddr := passemp(cmdline,10);
     Socket.UserId := passemp(cmdline,11);
     Socket.Password := passemp(cmdline,12);
   }

     Qry1.Close;
     Qry1.Sql.Clear;
     Qry1.Sql.Add('SELECT TO_CHAR(SYSDATE,''YYYYMMDDHH24MISSD'') D ');
     Qry1.Sql.Add('FROM DUAL ');
     Qry1.Open;
     CurDate := Qry1.FieldByName('D').AsString;
     Qry1.Close;
     L_Date.Caption      := Copy(CurDate,1,4) + '-' + Copy(CurDate,5,2) + '-' +
                            Copy(CurDate,7,2);
     L_UserName.Caption  := KorName+ '(' + empno + ')';
     Application.ProcessMessages;

     P_Help.Caption := '   현급여지급월을 읽고 있습니다...';
     Application.ProcessMessages;
     Read_PayDate;

     {/ ===============================================================================
        Version  date(yy.mm.dd)  programmer  description      relevant doc.no
   	30.00    1998.12.29      김승회      출력물양식변경    하나로인사재개발
      => L/P 출력옵션 comment 처리
	=============================================================================== /}

     //L_Path.Caption := Format('[HighServer] %s/list/Klist/paylist_%s',[Get_Path(qry1,Userid),PayMM]);

     Read_CurOrgNum;
     Read_DeptTable;
     Set_InitEnv;

     if Index <> 0 then
        begin
             P_Help.Caption := '   BAND코드에 대한 테이블 작성 중...';
             Application.ProcessMessages;
             Set_CodeTable(CI112,'I112');

             P_Help.Caption := '   직책코드에 대한 테이블 작성 중...';
             Application.ProcessMessages;
             Set_CodeTable(CI113,'I113');

             P_Help.Caption := '   급여지급은행에 대한 테이블 작성 중...';
             Application.ProcessMessages;
             Set_CodeTable(CK910,'K910');

             //P_Help.Caption := '   부서에 대한 테이블 작성 중...';
             //Application.ProcessMessages;
             //Set_DeptTable;

             P_Help.Caption := '';
        end
     else
        begin
            CI112     := Nil;
            CI113     := Nil;
            CK910     := Nil;
            //DeptFirst := Nil;
        end;
end;

{ ==============================================================================
  ===================       Event Handlers      ================================
  ============================================================================== }

procedure TM_KC2070C.SB_FrEmpNoClick(Sender: TObject);
begin
     Try
     M_EmpNO             := TM_EmpNo.Create(Self);
     M_EmpNo.InValue     := E_FrEmpNo.Text;
     M_EmpNO.ShowModal;
     if M_EmpNo.OutEmpNo <> '' then
        E_FrEmpNo.Text      := M_EmpNo.OutEmpNo;
     Finally
     M_EmpNo.Free;
     End;
end;

procedure TM_KC2070C.SB_ToEmpNoClick(Sender: TObject);
begin
     Try
     M_EmpNO             := TM_EmpNo.Create(Self);
     M_EmpNo.InValue     := E_ToEmpNo.Text;
     M_EmpNO.ShowModal;
     if M_EmpNo.OutEmpNo <> '' then
        E_ToEmpNo.Text      := M_EmpNo.OutEmpNo;
     Finally
     M_EmpNo.Free;
     End;
end;

procedure TM_KC2070C.BitBtn4Click(Sender: TObject);
begin
     Close;
end;

procedure TM_KC2070C.BB_SetUpClick(Sender: TObject);
begin
     PrinterSetupDialog1.Execute;
end;

procedure TM_KC2070C.FormActivate(Sender: TObject);
begin
     if ActiveFlag then
        SetUp;         
end;

procedure TM_KC2070C.FormCreate(Sender: TObject);
begin
     ActiveFlag := True;
end;

procedure TM_KC2070C.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//     if IDYes = Application.MessageBox('종료하시겠습니까?','확 인',MB_YesNo) then
        begin
             if CI112 <> NIL then
                Free_CodeTable(CI112);

             if CI113 <> NIL then
                Free_CodeTable(CI113);

             if CK910 <> NIL then
                Free_CodeTable(CK910);
             Action := caFree;
        end
//     else
//         Action := caNone;
end;

procedure TM_KC2070C.BB_RunClick(Sender: TObject);
var
   Par_Buf : String[200];
   Temp    : String[255];
begin
     if Check_All then
        begin
             if Check_Existence then
                begin

        {/ ===============================================================================
           Version  date(yy.mm.dd)  programmer  description      relevant doc.no
   	   30.00    1998.12.29      김승회      출력물양식변경    하나로인사재개발
        => L/P 출력부분 comment 처리
	=============================================================================== /}
                {
                     if RB_LP.Checked then    begin
                        P_Help.Caption   := '   개인별 급여명세서 출력 중... ';
                        Screen.Cursor    := CrHourGlass;

                        Animated.Play    := True;
                        Par_Buf          := PayMM + ' '    + E_FrEmpNo.Text + ' ' +
                                            E_ToEmpNo.Text + ' ' + userid;
                        Socket.Command   := '~/bin/Kbin/pkc2070c ' + Par_Buf;

                        Socket.Execute;
                        Temp             := Display_Msg;
                        Animated.Play    := False;

                        if Copy(Temp,1,2) = 'OK' then
                           P_Help.Caption := '  개인별 급여명세서 출력이 성공적으로 완료되었습니다. '
                        else
                           P_Help.Caption := '  개인별 급여명세서 출력에 실패했습니다. ';
                        Screen.Cursor    := CrDefault;
                        System.Exit;
                     end;
                 }
                     if RB_Screen.Checked then
                        begin
                             SReportF2.QReport.Preview;
                             {
                             case GSusrid of
                             0 : S1_KC2070C.QReport.Preview;
                             1 : S3_KC2070C.QReport.Preview;
                             2 : S4_KC2070C.QReport.Preview;
                             end;}
                        end
                     else
                         SReportF2.QReport.Print;
                    {     case GSusrid of
                         0 : S1_KC2070C.QReport.Print;
                         1 : S3_KC2070C.QReport.Print;
                         2 : S4_KC2070C.QReport.Print;
                         end;}
                     Screen.Cursor  := CrDeFault;
                     P_Help.Caption := ''
                end;
        end;
end;

procedure TM_KC2070C.SB_FrDeptCodeClick(Sender: TObject);
begin
     Try
     DeptCode := TDeptCode.Create(Self);
     DeptCode.Get_Records(ME_FrOrgNum.Text, ME_FrDeptCode.Text );
     DeptCode.ShowModal;
     if DeptCode.OrgNum <> '' then
        begin
             ME_FrOrgNum.Text     := DeptCode.OrgNum;
             ME_FrDeptCode.Text   := DeptCode.DeptCode;
        end;
     Finally
     DeptCode.Free;
     end;
end;

procedure TM_KC2070C.SB_ToDeptCodeClick(Sender: TObject);
begin
     Try
     DeptCode := TDeptCode.Create(Self);
     DeptCode.Get_Records(ME_ToOrgNum.Text, ME_ToDeptCode.Text );
     DeptCode.ShowModal;
     if DeptCode.OrgNum <> '' then
        begin
             ME_ToOrgNum.Text     := DeptCode.OrgNum;
             ME_ToDeptCode.Text   := DeptCode.DeptCode;
        end;
     Finally
     DeptCode.Free;
     end;
end;


procedure TM_KC2070C.E_FrEmpNOKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = VK_RETURN then
        P_FrKorName.Caption := Get_KorName(E_FrEmpNO.Text);
end;

procedure TM_KC2070C.E_ToEmpNoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = VK_RETURN then
        P_ToKorName.Caption := Get_KorName(E_ToEmpNO.Text);
end;

procedure TM_KC2070C.BitBtn3Click(Sender: TObject);
var
  HelpForm : THelpForm;
begin
  HelpForm := THelpForm.Create(Self);
  try
    HelpForm.Programid := 'PKC2070C';
    HelpForm.ShowModal;
  finally
    HelpForm.Free;
  end;
end;

procedure TM_KC2070C.E_FrEmpNOExit(Sender: TObject);
begin
   P_FrKorName.Caption := Get_KorName(E_FrEmpNO.Text);
end;

procedure TM_KC2070C.E_ToEmpNoExit(Sender: TObject);
begin
    P_ToKorName.Caption := Get_KorName(E_ToEmpNO.Text);
end;

end.

