{* ======================= Program Header ======================================
 PROGRAM-NAME   : PKG3080B(초과근무 내역조회)
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 수당
 Programmer     : 민정숙
 Version        : 30.00
 Date           : 1998.12.31

Update Contents
 Version  date(yy.mm.dd)  programmer   description              relevant doc.no
  1.00     1997.12.01      김승회      최초개발본               설계명세서
  30.00    1998.12.31      민정숙      직위/직급변경            하나로재개발
============================================================================= *}
unit pkg30801;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls, DB, kyempno, DBTables, Grids, DBGrids,
  UserHelp, Func, Ora, MemDS, DBAccess, DeptCode, KeyEmpno, KeyCode;

type
  {.....석식장소를 표현하기 위한 Record Type .....}

  TDinner_Place = Record
      ID  : String[01];
    Place : String[20];
  end;


  TM_KG3080B = class(TForm)
    Panel1: TPanel;
    L_UserName: TLabel;
    L_Date: TLabel;
    Panel2: TPanel;
    P_Key: TPanel;
    SP_FrDate: TSpeedButton;
    Panel4: TPanel;
    ME_FrDate: TMaskEdit;
    P_DayName1: TPanel;
    P_Buttons: TPanel;
    BB_Close: TBitBtn;
    BB_LookUp: TBitBtn;
    P_Help: TPanel;
    SP_ToDate: TSpeedButton;
    ME_ToDate: TMaskEdit;
    P_DayName2: TPanel;
    Panel7: TPanel;
    E_EmpNo: TEdit;
    SP_EmpNo: TSpeedButton;
    Panel8: TPanel;
    P_KorName: TPanel;
    P_OtKindName: TPanel;
    Panel12: TPanel;
    CB_Dinner: TComboBox;
    P_PlaceName: TPanel;
    Panel14: TPanel;
    CB_ConYN: TComboBox;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    BB_Detail: TBitBtn;
    BB_Total: TBitBtn;
    Label1: TLabel;
    E_OTKind: TEdit;
    SB_OTKind: TSpeedButton;
    Panel3: TPanel;
    E_PayCl: TEdit;
    SB_PayCl: TSpeedButton;
    P_PayCl: TPanel;
    Pwait: TPanel;
    Image1: TImage;
    Label4: TLabel;
    Qry2: TOraQuery;
    Qry2DEPTNAME: TStringField;
    Qry2EMPNO: TStringField;
    Qry2KORNAME: TStringField;
    Qry2PAYCL: TStringField;
    Qry2OVTMDATE: TStringField;
    Qry2FRAPPTIME: TStringField;
    Qry2TOAPPTIME: TStringField;
    Qry2OVTMDESC: TStringField;
    Qry2RFRTIME: TStringField;
    Qry2TOREALTIME: TStringField;
    Qry2CONYN: TStringField;
    Qry2OTKIND: TStringField;
    Qry2DINNER: TStringField;
    Qry2FRREALTIME: TStringField;
    QueryJ: TOraQuery;
    Qry1: TOraQuery;
    procedure FormActivate(Sender: TObject);
    procedure BB_CloseClick(Sender: TObject);
    procedure SP_EmpNoClick(Sender: TObject);
    procedure SP_FrDateClick(Sender: TObject);
    procedure SP_ToDateClick(Sender: TObject);
    procedure E_EmpNoChange(Sender: TObject);
    procedure E_EmpNoExit(Sender: TObject);
    procedure E_EmpNoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ME_FrDateChange(Sender: TObject);
    procedure ME_FrDateExit(Sender: TObject);
    procedure ME_FrDateKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ME_ToDateChange(Sender: TObject);
    procedure ME_ToDateExit(Sender: TObject);
    procedure ME_ToDateKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure E_OtKindChange(Sender: TObject);
    procedure E_OtKindExit(Sender: TObject);
    procedure E_OtKindKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CB_DinnerChange(Sender: TObject);
    procedure CB_DinnerExit(Sender: TObject);
    procedure CB_DinnerKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BB_LookUpClick(Sender: TObject);
    procedure BB_DetailClick(Sender: TObject);
    procedure BB_TotalClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SB_OTKindClick(Sender: TObject);
    procedure CB_ConYNDblClick(Sender: TObject);
    procedure SB_PayClClick(Sender: TObject);
    procedure E_PayClChange(Sender: TObject);
    procedure E_EmpNoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    CurOrgNum       : String[03]; { 현 조직차수                                    }
    DeptCode        : String[06]; { 부서코드                                       }
    ExtCode         : String[06]; {... 상위부서코드                             ...}
    EFlag           : Boolean;    { Query 결과에 따른 해당 레코드 존재 여부        }
    ActiveFlag      : Boolean;
  public
    { Public declarations }
    CurDate       : String[20];           {... 서버날짜                      ...}
    Privilege     : Integer;

    Function  Get_ExtCode( InDeptCode : String ) : String;
    Function  Get_Privilege( InEmpNo : String ) : Integer;
    Function  Get_KorName( InEmpno : String ) : String;
    Function  Get_DeptName(InOrgNum,InDeptCode : String ) : String;
    Function  Get_DayName( InDay : String ) : String;
    Function  Get_DeptCode( InEmpNo : String ) : String;
    Function  Get_CodeName( InCodeID, InCodeNo : String ) : String;
    Function  Get_DinnerPlace( InCode : String ) : String;
    Function  Check_EmpNO( InEmpNo : String ) : Boolean;
    Function  Check_DeptCode( InDeptCode : String ) : Boolean;
    Function  Check_Date( InDate : String ) : Boolean;
    Function  Check_OtKind( InCode : String ) : Boolean;
    Function  Check_Dinner( InCode : String ) : Boolean;
    Function  Check_ConYN( InCode : String ) : Boolean;
    Function  Check_All : Boolean;

    Procedure Get_CurOrgNum;
    Procedure Initialize_Array;
    Procedure Get_Records;
    Procedure Get_InitDeptCode;
    Procedure SetUp;
  end;

var
  M_KG3080B : TM_KG3080B;
  Places    : Array[1..6] of TDinner_Place;
  CheckEmp  : Integer;

implementation

{$R *.DFM}

uses Calen1, pkg30802, pkg30803;// Pass, KEmpNo,TimeFtp,KDept1,CodeLib,

{===============================================================================
 ======================  < User Define Functions >  ============================
 ===============================================================================}

{===============================================================================
     작업자의 작업권한을 구하는 Function.
     'SA', 임원                     ===>  0,
     1급                            ===>  1,
     2급                            ===>  2,
     3급, 4급이고 대리가 아니면     ===>  3,
     그 밖의 직급은                 ===>  4,
     자료가 존재하지 않으면         ===> -1
================================================================================}
Function TM_KG3080B.Get_Privilege( InEmpNo : String ) : Integer;
var
   PayCl : String[03];
   PayRa : String[03];
   Index : String[01];
begin
     {..... 등급이 'A' OR 'B'면 OK ..............}

     if ((PGrade[2] = 'A') or (PGrade[2] = 'B') or (PGrade[2] = 'C')) OR
        ((PGrade[3] = 'A') or (PGrade[3] = 'B') or (PGrade[3] = 'C')) then
        begin
             Privilege := 0;
             System.Exit;
        end
     else
             Privilege := 4;     
{* =============================================================================
 Version  date(yy.mm.dd)  programmer  description               relevant doc.no
 30.00    1998.12.31      민정숙      직위/직급변경권한부분삭제 하나로재개발
============================================================================= *}
{mjs begin
     Qry1.Close;
     Qry1.Sql.Clear;
     Qry1.Sql.Add( ' SELECT PAYCL, PAYRA                                         ' );
     Qry1.Sql.Add( ' FROM   PKMPMAS                                              ' );
     Qry1.Sql.Add( ' WHERE  EMPNO = :empno                                       ' );
     Qry1.ParamByName('empno').AsString := InEmpNo;
     Qry1.Open;
     if Qry1.Eof then
        begin
             Qry1.Close;
             Result := -1;
             System.Exit;
        end
     else
        begin
             PayCl := Qry1.FieldByName('PayCl').AsString;
             PayRa := Qry1.FieldByName('PayRa').AsString;
             Qry1.Close;
        end;

      Index := Copy(PayCl,1,1);
      if Index = '0' then
         Result := 0
      else
         if Index = '1' then
            Result := 1
         else
            if Index = '2' then
               Result := 2
            else
               if Index = '3' then
                  Result := 3
               else
                  if Index = '4' then
                     begin
                          if Copy(PayRa,3,1) = '0' then    '대리'인 경우
                             Result := 4
                          else                             '대리'가 아닌 경우                              Result := 3;
                     end
                  else
                      Result  := 4;
 mjs end}
end;

{===============================================================================
     급여마스터에 등록된 조직차수와 부서코드값을 이용해 해당 사번의
     소속부서코드를 구하는 Function.
================================================================================}
Function TM_KG3080B.Get_DeptCode( InEmpNo : String ) : String;
begin
  Qry1.Close;
  Qry1.Sql.Clear;
  Qry1.Sql.Add( ' SELECT DEPTCODE                                                  ' );
  Qry1.Sql.Add( ' FROM   PYCDEPT                                                   ' );
  Qry1.Sql.Add( ' WHERE  DEPTCODE = (                                              ' );
  Qry1.Sql.Add( '                     SELECT DEPTCODE                              ' );
  Qry1.Sql.Add( '                     FROM   PKMPMAS                               ' );
  Qry1.Sql.Add( '                     WHERE  EMPNO = :empno                        ' );
  Qry1.Sql.Add( '                    )                                             ' );
  Qry1.Sql.Add( ' AND    ORGNUM =   (                                              ' );
  Qry1.Sql.Add( '                     SELECT ORGNUM                                ' );
  Qry1.Sql.Add( '                     FROM   PKMPMAS                               ' );
  Qry1.Sql.Add( '                     WHERE  EMPNO = :empno                        ' );
  Qry1.Sql.Add( '                    )                                             ' );
  Qry1.ParamByName('EmpNo').AsString := InEmpNo;
  Qry1.Open;
  if not Qry1.Eof then
     Result := Qry1.FieldByName('DeptCode').AsString
  else
     Result := '';
  Qry1.Close;
end;

{===============================================================================
     사번이 결정되면 이 사람의 성명을 구하는 함수.
================================================================================}
Function TM_KG3080B.Get_KorName( InEmpno : String ) : String;
begin
     Qry1.Close;
     Qry1.Sql.Clear;
     Qry1.Sql.Add( ' SELECT KORNAME                                                ' );
     Qry1.Sql.Add( ' FROM   PKMPMAS                                                ' );
     Qry1.Sql.Add( ' WHERE  EMPNO = :empno                                         ' );
     Qry1.ParamByName('empno').AsString := InEmpNo;
     Qry1.Open;

     if not Qry1.Eof then
         Result := Qry1.FieldByName('KorName').AsString
     else
         Result := '';
     Qry1.Close;
end;

{===============================================================================
      부서코드에 해당하는 부서명을 구하는 함수.
================================================================================}
Function TM_KG3080B.Get_DeptName(InOrgNum,InDeptCode : String ) : String;
begin
     Qry1.Close;
     Qry1.Sql.Clear;
     Qry1.Sql.Add( ' SELECT DEPTNAME                                               ' );
     Qry1.Sql.Add( ' FROM   PYCDEPT                                                ' );
     Qry1.Sql.Add( ' WHERE  DEPTCODE = :deptcode AND ORGNUM = :orgnum              ' );
     Qry1.ParamByName('deptcode').AsString := InDeptCode;
     Qry1.ParamByName('orgnum').AsString   := InOrgNum;
     Qry1.Open;

     if not Qry1.Eof then
         Result := Qry1.FieldByName('DeptName').AsString
     else
         Result := '';
     Qry1.Close;
end;

{===============================================================================
    날짜가 결정되면 해당 요일명을 구하는 Function.
================================================================================}
Function TM_KG3080B.Get_DayName( InDay : String ) : String;
begin
     Qry1.Close;
     Qry1.Sql.Clear;
     Qry1.Sql.Add( ' SELECT TO_CHAR( TO_DATE(:day,''YYYYMMDD''),''DAY'' )       ' );
     Qry1.Sql.Add( ' FROM   DUAL                                                ' );
     Qry1.ParamByName('day').AsString := InDay;
     Qry1.Open;
     Result := Qry1.Fields[0].AsString;
     Qry1.Close;
end;

{===============================================================================
         입력한 사번이 유효한 지를 점검하는 Function.
================================================================================}
Function TM_KG3080B.Check_EmpNO( InEmpNo : String ) : Boolean;
begin
     if ((PGrade[2] = 'A') or (PGrade[2] = 'B') or (PGrade[2] = 'C')) OR
        ((PGrade[3] = 'A') or (PGrade[3] = 'B') or (PGrade[3] = 'C')) then
        begin
             P_KorName.Caption := Get_KorName(InEmpNo);
             P_Help.Caption    := '';
             Result            := True;
             System.Exit;
        end;

     if Length(E_EmpNo.Text) <> 4 then
        begin
             P_Help.Caption := '   ''사번''은 4 자리로 입력하셔야 합니다...';
             Result         := False;
             System.Exit;
        end;

     P_KorName.Caption := Get_KorName(InEmpNo);
     if P_KorName.Caption = '' then
        begin
             P_Help.Caption := '   해당 사번이 급여마스터에 등록되어 있지 않습니다...';
             Result         := False;
             System.Exit;
        end;

     if (Get_Privilege(PEmpNo) = 0) then
        begin
             P_Help.Caption := '';
             Result := True;
             System.Exit;
        end;

     if InEmpNo <> PEmpno then
        begin
             P_Help.Caption := '   다른 부서의 사원에 대한 조회 권한이 당신에게는 없습니다...';
             Result         := False;
             System.Exit;
        end;

     Result := True;
end;

{===============================================================================
     부서코드값을 이용해 해당 사번의 상위부서코드를 구하는 함수.
================================================================================}
Function TM_KG3080B.Get_ExtCode( InDeptCode : String ) : String;
begin
     Qry1.Close;
     Qry1.Sql.Clear;
     Qry1.Sql.Add( ' SELECT EXTCODE                                                ' );
     Qry1.Sql.Add( ' FROM   PYCDEPT                                                ' );
     Qry1.Sql.Add( ' WHERE  DEPTCODE = :deptcode AND ORGNUM = :orgnum              ' );
     Qry1.ParamByName('orgnum').AsString    := CurOrgNum;
     Qry1.ParamByName('deptcode').AsString  := InDeptCode;
     Qry1.Open;
     if not Qry1.Eof then
        Result := Qry1.FieldByName('ExtCode').AsString
     else
        Result := '';
     Qry1.Close;
end;

{===============================================================================
         입력한 부서코드가 유효한 지를 점검하는 Function.
================================================================================}
Function TM_KG3080B.Check_DeptCode(InDeptCode : String) : Boolean;
begin
     {..... 등급이 'A' OR 'B'면 OK ..............}

     if ((PGrade[2] = 'A') or (PGrade[2] = 'B') or (PGrade[2] = 'C')) OR
        ((PGrade[3] = 'A') or (PGrade[3] = 'B') or (PGrade[3] = 'C')) then
     begin
          P_Help.Caption     := '';
          Result             := True;
          System.Exit;
     end
     else
     begin
          P_Help.Caption := '   다른 부서의 사원에 대한 조회 권한이 당신에게는 없습니다...';
          Result := False
     end;
end;

{===============================================================================
         입력한 날짜가 유효한 지를 점검하는 Function.
================================================================================}
Function TM_KG3080B.Check_Date( InDate : String ) : Boolean;
var
   Temp   : Real;
begin
     if Length(InDate) <> 8 then
        begin
             P_Help.Caption := '   초과근무일을 8자리로 입력하십시요...';
             Result         := False;
             System.Exit;
        end;

     InDate := Copy(InDate,1,4) + DateSeparator + Copy(InDate,5,2) + DateSeparator + Copy(InDate,7,2);
     Try
     Temp   := StrToDate(InDate);
     Except on EConvertError do
            begin
                 P_Help.Caption  := '   존재하지 않는 날짜입니다. 확인하시고 다시 입력하세요...';
                 Result          := False;
                 System.Exit;
            end;
     end;

     P_Help.Caption := '';
     Result         := True;
end;

{===============================================================================
         초과근무구분Code가 유효한 지를 점검하는 함수.
 ===============================================================================}
 Function TM_KG3080B.Check_OtKind( InCode : String ) : Boolean;
 begin
      if E_OtKind.Text = '' then
         begin
              P_Help.Caption       := '';
              Result               := True;
              System.Exit;
         end;

      if Length(E_OtKind.Text) <> 2 then
         begin
              P_Help.Caption        := '   ''근무구분''을 2 자리로 입력하셔야 합니다...';
              Result                := False;
              System.Exit;
         end;

      if Get_CodeName('K430',E_OtKind.Text) = '' then
         begin
              P_Help.Caption        := '   등록되어 있지 않은 코드입니다...';
              Result                := False;
              System.Exit;
         end;

      P_Help.Caption := '';
      Result         := True;
 end;

 {===============================================================================
         석식장소Code가 유효한 지를 점검하는 함수.
 ===============================================================================}
 Function TM_KG3080B.Check_Dinner( InCode : String ) : Boolean;
 begin
      if CB_Dinner.Text = '' then
         begin
              P_Help.Caption       := '';
              Result               := True;
              System.Exit;
         end;

      if Get_DinnerPlace(CB_Dinner.Text) = '' then
         begin
              P_Help.Caption        := '   등록되어 있지 않은 코드입니다...';
              Result                := False;
              System.Exit;
         end;

      P_Help.Caption := '';
      Result         := True;
 end;

{===============================================================================
         결재여부가 유효한 지를 점검하는 함수.
 ===============================================================================}
 Function TM_KG3080B.Check_ConYN( InCode : String ) : Boolean;
 begin
      if CB_ConYN.Text = '' then
         begin
              P_Help.Caption       := '';
              Result               := True;
              System.Exit;
         end;

      if (UpperCase(CB_ConYN.Text) <> 'Y') AND (UpperCase(CB_ConYN.Text) <> 'N') then
         begin
              P_Help.Caption        := '   결재여부는 ''Y'' OR ''N'' OR '' ''가 유효한 값입니다...';
              Result                := False;
              System.Exit;
         end;

      P_Help.Caption := '';
      Result         := True;
 end;

 {==============================================================================
        조회를 수행하기 전에 전체적으로 조회 조건을 점검하는 Function.
 ===============================================================================}
 Function TM_KG3080B.Check_All : Boolean;
 begin
     if not Check_EmpNo(E_EmpNo.Text) then
         begin
              E_EmpNo.SetFocus;
              Result             := False;
              System.Exit;
         end;

     if not Check_Date(ME_FrDate.Text) then
        begin
             ME_FrDate.SetFocus;
             Result             := False;
             System.Exit;
        end;

     if not Check_Date(ME_ToDate.Text) then
        begin
             ME_ToDate.SetFocus;
             Result             := False;
             System.Exit;
        end;

     {if not Check_OtKind(CB_OtKind.Text) then
        begin
             CB_OtKind.SetFocus;
             Result             := False;
             System.Exit;
        end;

     if not Check_Dinner(CB_Dinner.Text) then
        begin
             CB_Dinner.SetFocus;
             Result             := False;
             System.Exit;
        end;

     if not Check_ConYN(CB_ConYN.Text) then
        begin
             CB_ConYN.SetFocus;
             Result             := False;
             System.Exit;
        end;
     }
     
     P_Help.Caption := '';
     Result := True;
 end;

{===============================================================================
         코드에 대한 코드명칭을 얻는 Function.
================================================================================}
Function TM_KG3080B.Get_CodeName( InCodeID, InCodeNo : String ) : String;
begin
     Qry1.Close;
     Qry1.Sql.Clear;
     Qry1.Sql.Add( ' SELECT CODENAME                                             ' );
     Qry1.Sql.Add( ' FROM   PYCCODE                                              ' );
     Qry1.Sql.Add( ' WHERE  CODEID = :codeid AND CODENO = :codeno                ' );
     Qry1.ParamByName('codeid').AsString := InCodeID;
     Qry1.ParamByName('codeno').AsString := InCodeNo;
     Qry1.Open;

     if not Qry1.Eof then
        Result := Qry1.FieldByName('CodeName').AsString
     else
        Result := '';
     Qry1.Close;
end;

{===============================================================================
       석식장소를 구하는 Function.
================================================================================}
Function TM_KG3080B.Get_DinnerPlace( InCode : String ) : String;
var
   i    : Integer;
begin
     for i := 1 to 6 do
         begin
              if Places[i].ID = InCode then
                 begin
                      Result := Places[i].Place;
                      System.Exit;
                 end;
         end;

     Result := '';
end;


{==============================================================================
 ===================    < 사용자 정의 프로시져 >    ===========================
 ============================================================================== }

{===============================================================================
         석식 장소를 나타내는 배열 Places를 초기화하는 Procedure.
================================================================================}
Procedure TM_KG3080B.Initialize_Array;
var
   i : integer;
begin
     Places[1].ID    := '1';
     Places[1].Place := '본사';
     Places[2].ID    := '2';
     Places[2].Place := '성지';
     Places[3].ID    := '3';
     Places[3].Place := '연구소';
     Places[4].ID    := '4';
     Places[4].Place := '지구국';
     Places[5].ID    := '5';
     places[5].Place := '기타';
     Places[6].ID    := '9';
     Places[6].Place := '없음';

     CB_Dinner.Items.Clear;
     for i := 1 to 6 do
         CB_Dinner.Items.Add(Places[i].ID + ' : ' + Places[i].Place);
end;

{===============================================================================
     현 조직 차수를 구하는 Procedure.
================================================================================}
Procedure TM_KG3080B.Get_CurOrgNum;
begin
     Qry1.Close;
     Qry1.Sql.Clear;
     Qry1.Sql.Add( ' SELECT MAX(ORGNUM)                                     ' );
     Qry1.Sql.Add( ' FROM   PYCDEPT                                         ' );
     Qry1.Open;
     CurOrgNum := Qry1.Fields[0].AsString;
     Qry1.Close;
end;

{===============================================================================
     급여마스터에 등록된 조직차수와 부서코드값을 이용해 해당 사번의
     소속부서코드를 구하는 Procedure.
================================================================================}
Procedure TM_KG3080B.Get_InitDeptCode;
begin
  Qry1.Close;
  Qry1.Sql.Clear;
  Qry1.Sql.Add( ' SELECT DEPTCODE, EXTCODE                                      ' );
  Qry1.Sql.Add( ' FROM   PYCDEPT                                                ' );
  Qry1.Sql.Add( ' WHERE  DEPTCODE = (                                           ' );
  Qry1.Sql.Add( '                     SELECT DEPTCODE                           ' );
  Qry1.Sql.Add( '                     FROM   PKMPMAS                            ' );
  Qry1.Sql.Add( '                     WHERE  EMPNO = :empno                     ' );
  Qry1.Sql.Add( '                    )                                          ' );
  Qry1.Sql.Add( ' AND    ORGNUM =   (                                           ' );
  Qry1.Sql.Add( '                     SELECT ORGNUM                             ' );
  Qry1.Sql.Add( '                     FROM   PKMPMAS                            ' );
  Qry1.Sql.Add( '                     WHERE  EMPNO = :empno                     ' );
  Qry1.Sql.Add( '                    )                                          ' );
  Qry1.ParamByName('EmpNo').AsString := PEmpNo;
  Qry1.Open;
  if not Qry1.Eof then
     begin
          DeptCode           := Qry1.Fields[0].AsString;
          ExtCode            := Qry1.Fields[1].AsString;
     end
  else
     begin
          DeptCode           := '';
          ExtCode            := '';
     end;
  Qry1.Close;
end;

{===============================================================================
     조회 조건에 맞는 자료를 구하는 Procedure.
================================================================================}
Procedure TM_KG3080B.Get_Records;
begin
     Qry2.Close;
     Qry2.Sql.Clear;
     Qry2.Sql.Add( ' SELECT DEPTNAME, EMPNO, KORNAME, PAYCL,OVTMDATE, FRAPPTIME, TOAPPTIME, ' );
     Qry2.Sql.Add( '        OVTMDESC, SUBSTR(FRREALTIME,9,4) RFRTIME, TOREALTIME, CONYN,    ' );
     Qry2.Sql.Add( '        OTKIND, DINNER, FRREALTIME                                      ' );
     Qry2.Sql.Add( ' FROM   PKHOTHIS A, PYCDEPT B                                           ' );
     Qry2.Sql.Add( ' WHERE  EMPNO    LIKE            ''' + E_EmpNo.Text    + '%' + ''' AND  ' );
//     Qry2.Sql.Add( '        A.DEPTCODE LIKE          ''' + E_DeptCode.Text + '%' + ''' AND  ' );
     Qry2.Sql.Add( '        NVL(PAYCL,'' '')    LIKE ''' + E_PayCl.Text    + '%' + ''' AND  ' );
     Qry2.Sql.Add( '        NVL(OTKIND,''  '')  LIKE ''' + E_OtKind.Text   + '%' + ''' AND  ' );
     Qry2.Sql.Add( '        NVL(CONYN,'' '')    LIKE ''' + CB_ConYN.Text   + '%' + ''' AND  ' );
     Qry2.Sql.Add( '        NVL(DINNER,'' '')   LIKE ''' + CB_Dinner.Text  + '%' + ''' AND  ' );
     Qry2.Sql.Add( '        ( OVTMDATE >= :frDate AND OVTMDATE <= :toDate )            AND  ' );
     Qry2.Sql.Add( '        ( A.ORGNUM = B.ORGNUM AND A.DEPTCODE = B.DEPTCODE )             ' );
     Qry2.Sql.Add( ' ORDER  BY A.ORGNUM, A.DEPTCODE, EMPNO, OVTMDATE                        ' );
     Qry2.ParamByName('frdate').AsString := ME_FrDate.Text;
     Qry2.ParamByName('todate').AsString := ME_ToDate.Text;
     Qry2.Open;

     if Qry2.Eof then
        begin
             P_Help.Caption := '   조건에 만족하는 자료가 없습니다...';
             EFlag         := False;
             Qry2.Close;
        end
     else
         begin
             P_Help.Caption  := '   조회가 완료되었습니다...';
             EFlag           := True;
         end;
end;

{==============================================================================
         초기화를 수행하는 Procedure.
 ==============================================================================}
Procedure TM_KG3080B.SetUp;
begin
     P_Help.Caption := '   급여시스템에 접속 중입니다...';
     OraConnect;
     Application.ProcessMessages;

     CurDate             := fn_GetDateTimeStr;
     L_Date.Caption      := Copy(CurDate,1,4) + '-' + Copy(CurDate,5,2) + '-' +
                            Copy(CurDate,7,2);
     L_UserName.Caption  := PKorName+ '(' + Pempno + ')';
     Application.ProcessMessages;

     Initialize_Array;
     Get_CurOrgNum;
     Get_InitDeptCode;
     E_EmpNO.Text    := PEmpNo;
     Check_EmpNO(E_EmpNo.Text);

     ME_FrDate.Text  := Copy(CurDate,1,6)+'01';
     ME_ToDate.Text  := Copy(CurDate,1,8);
     EFlag           := False;
     P_Help.Caption  := '';
end;

{==============================================================================
 ===================       Event Handlers      ================================
 ============================================================================== }

// '폼'이 활성화 될때...
procedure TM_KG3080B.FormActivate(Sender: TObject);
begin
     if ActiveFlag then
        SetUp;
     Pwait.visible := False;
     ActiveFlag := False;
end;

//... '종료' 버튼을 누른 경우 ...
procedure TM_KG3080B.BB_CloseClick(Sender: TObject);
begin
     Close;
end;

//... '사번조회' 버튼을 누른 경우 ...
procedure TM_KG3080B.SP_EmpNoClick(Sender: TObject);
begin
  Fkeyempno := TFkeyempno.Create(Self);
  try
    Fkeyempno.Edempno.Text := E_empno.Text;
    Fkeyempno.ShowModal;
    if Fkeyempno.CloseChk <> -1 then
    begin
      E_empno.Text      := Fkeyempno.v_KeyEmpno;
      P_Korname.Caption := Fkeyempno.v_KeyKorname;
    end;
  finally
    Fkeyempno.Free;
  end;
{     Try
     M_EmpNO           := TM_EmpNo.Create(Self);
     M_EmpNo.InEmpNo   := E_EmpNo.Text;
     M_EmpNO.ShowModal;
     if M_EmpNO.OutEmpNo <> '' then
        E_EmpNo.Text      := M_EmpNo.OutEmpNo;
     Finally
     M_EmpNo.Free;
     End;}
end;

//... '초과근무일' 버튼을 누른 경우 ...
procedure TM_KG3080B.SP_FrDateClick(Sender: TObject);
begin
     Try
     Calendar := TCalendar.Create(Self);
     Calendar.ShowModal;
     ME_FrDate.Text := Calendar.DayCaption;
     Finally
     Calendar.Free;
     End;
end;

//... '초과근무일' 버튼을 누른 경우 ...
procedure TM_KG3080B.SP_ToDateClick(Sender: TObject);
begin
     Try
     Calendar := TCalendar.Create(Self);
     Calendar.ShowModal;
     ME_ToDate.Text := Calendar.DayCaption;
     Finally
     Calendar.Free;
     End;
end;

// 'E_EmpNo'에서 ChangeEvent의 경우 //
procedure TM_KG3080B.E_EmpNoChange(Sender: TObject);
begin
//   if Length(E_EmpNo.Text) = 4 then
//      Check_EmpNO(E_EmpNo.Text);
end;

// 'E_EmpNo'에서 ExitEvent의 경우 //
procedure TM_KG3080B.E_EmpNoExit(Sender: TObject);
begin
//   Check_EmpNO(E_EmpNo.Text);
end;

// 'E_EmpNo'에서 KeyDownEvent의 경우 //
procedure TM_KG3080B.E_EmpNoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//   if Key = VK_RETURN then
//      Check_EmpNO(E_EmpNo.Text);
end;


// 'ME_FrDate'에서 ChangeEvent의 경우 //
procedure TM_KG3080B.ME_FrDateChange(Sender: TObject);
begin
     if Length(ME_FrDate.Text) = 8 then
        begin
             if Check_Date(ME_FrDate.Text) then
                P_DayName1.Caption := Get_DayName(ME_FRDate.Text)
             else
                P_DayName1.Caption := '';
        end;
end;

// 'ME_FrDate'에서 ExitEvent의 경우 //
procedure TM_KG3080B.ME_FrDateExit(Sender: TObject);
begin
     if Check_Date(ME_FrDate.Text) then
        P_DayName1.Caption := Get_DayName(ME_FRDate.Text)
     else
        P_DayName1.Caption := '';
end;

// 'ME_FrDate'에서 KeyDownEvent의 경우 //
procedure TM_KG3080B.ME_FrDateKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = VK_RETURN then
        begin
             if Check_Date(ME_FrDate.Text) then
                P_DayName1.Caption := Get_DayName(ME_FRDate.Text)
             else
                P_DayName1.Caption := '';
        end;
end;

// 'ME_ToDate'에서 ChangeEvent의 경우 //
procedure TM_KG3080B.ME_ToDateChange(Sender: TObject);
begin
     if Length(ME_ToDate.Text) = 8 then
        begin
             if Check_Date(ME_ToDate.Text) then
                P_DayName2.Caption := Get_DayName(ME_ToDate.Text)
             else
                P_DayName2.Caption := '';
        end;
end;

// 'ME_ToDate'에서 ExitEvent의 경우 //
procedure TM_KG3080B.ME_ToDateExit(Sender: TObject);
begin
     if Check_Date(ME_ToDate.Text) then
        P_DayName2.Caption := Get_DayName(ME_ToDate.Text)
     else
        P_DayName2.Caption := '';
end;

// 'ME_ToDate'에서 KeyDownEvent의 경우 //
procedure TM_KG3080B.ME_ToDateKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = VK_RETURN then
        begin
             if Check_Date(ME_ToDate.Text) then
                P_DayName2.Caption := Get_DayName(ME_ToDate.Text)
             else
                P_DayName2.Caption := '';
        end;
end;

// 'CB_OtKind'에서 ChangeEvent의 경우 //
procedure TM_KG3080B.E_OtKindChange(Sender: TObject);
begin
     P_OtKindName.Caption := Get_CodeName('K430',E_OtKind.Text);
end;

// 'CB_OtKind'에서 ExitEvent의 경우 //
procedure TM_KG3080B.E_OtKindExit(Sender: TObject);
begin
     P_OtKindName.Caption := Get_CodeName('K430',E_OtKind.Text);
end;

// 'CB_OtKind'에서 KeyDownEvent의 경우 //
procedure TM_KG3080B.E_OtKindKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = VK_RETURN then
        begin
             P_OtKindName.Caption := Get_CodeName('K430',E_OtKind.Text);
        end;
end;

// 'CB_Dinner'에서 ChangeEvent의 경우 //
procedure TM_KG3080B.CB_DinnerChange(Sender: TObject);
begin
     P_PlaceName.Caption := Get_DinnerPlace(Copy(CB_Dinner.Text,1,1));
end;

// 'CB_Dinner'에서 ExitEvent의 경우 //
procedure TM_KG3080B.CB_DinnerExit(Sender: TObject);
begin
     P_PlaceName.Caption := Get_DinnerPlace(Copy(CB_Dinner.Text,1,1));
end;

// 'CB_Dinner'에서 KeyDownEvent의 경우 //
procedure TM_KG3080B.CB_DinnerKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = VK_RETURN then
        begin
             P_PlaceName.Caption := Get_DinnerPlace(Copy(CB_Dinner.Text,1,1));
        end;
end;

//... '조회' 버튼을 누른 경우 ...
procedure TM_KG3080B.BB_LookUpClick(Sender: TObject);
begin
     if Check_All then
        Get_Records;
end;

//... '상세내역' 버튼을 누른 경우 ...
procedure TM_KG3080B.BB_DetailClick(Sender: TObject);
var
   OvtmDate   : String;
   EmpNo      : String;
   FrAppTime  : String;
   FrRealTime : String;
begin
     if EFlag then
        begin
             OvtmDate   := Qry2.FieldByName('OvtmDate').AsString;
             EmpNo      := Qry2.FieldByName('EmpNo').AsString;
             FrAppTime  := Qry2.FieldByName('FrAppTime').AsString;
             FrRealTime := Qry2.FieldByName('FrRealTime').AsString;
             Try
             S1_KG3080B := TS1_KG3080B.Create(Self);
             S1_KG3080B.Get_Record(OvtmDate,EmpNo,FrAppTime,FrRealTime);
             S1_KG3080B.ShowModal;
             Finally
             S1_KG3080B.Free;
             End;
             Screen.Cursor := CrDefault;
        end
     else
        P_Help.Caption := '   먼저 조회를 수행하십시요...';
end;

//... '종합통계' 버튼을 누른 경우 ...
procedure TM_KG3080B.BB_TotalClick(Sender: TObject);
begin
     if EFlag then
        begin
             Try
             S2_KG3080B := TS2_KG3080B.Create(Self);
             S2_KG3080B.Get_Statistics;
             S2_KG3080B.ShowModal;
             Finally
             S2_KG3080B.Free;
             End;
             Screen.Cursor := CrDefault;
        end
     else
        P_Help.Caption := '   먼저 조회를 수행하십시요...';
end;

procedure TM_KG3080B.FormCreate(Sender: TObject);
begin
     ActiveFlag := True;
end;

procedure TM_KG3080B.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := caFree;
{     if IDYes = Application.MessageBox('종료하시겠습니까?','확 인',MB_YesNo) then
        begin
             Action := caFree
        end
     else
         Action := caNone;}
end;

procedure TM_KG3080B.SB_OTKindClick(Sender: TObject);
begin
     Try
         FKeyCode          := TFKeyCode.Create(Self);
         FKeyCode.FormData := '초과근무구분조회(K430) 조회';
         FKeyCode.DataVal1 := 'K430';
         FKeyCode.DataVal2 := E_OtKind.Text;
         FKeyCode.ShowModal;
         E_OtKind.Text         := FKeyCode.Code;
         P_OtKindName.Caption  := FKeyCode.CodeName;
     Finally
         FKeyCode.Free;
     End;
end;

procedure TM_KG3080B.CB_ConYNDblClick(Sender: TObject);
begin
     if UpperCase(CB_ConYN.Text) = 'Y' then
        CB_ConYN.Text := 'N'
     else
        begin
             if UpperCase(CB_ConYN.Text) = 'N' then
                CB_ConYN.Text := ''
             else
                CB_ConYN.Text := 'Y';
        end;
end;

procedure TM_KG3080B.SB_PayClClick(Sender: TObject);
begin
     Try
          FKeyCode          := TFKeyCode.Create(Self);
          FKeyCode.FormData := 'BAND조회(I112)';
          FKeyCode.DataVal1 := 'I112';
          FKeyCode.DataVal2 := E_PayCl.Text;
          FKeyCode.ShowModal;
          E_PayCl.Text     := FKeyCode.Code;
          P_PayCl.Caption  := FKeyCode.CodeName;
     Finally
          FKeyCode.Free;
     End;
end;

procedure TM_KG3080B.E_PayClChange(Sender: TObject);
begin
     P_PayCl.Caption := Get_CodeName('I112',E_PayCl.Text);
end;

procedure TM_KG3080B.E_EmpNoKeyPress(Sender: TObject; var Key: Char);
begin
     if Key <> #13 then System.Exit;
     Key := #0;

     QueryJ.Close;
     QueryJ.SQL.Clear;
     QueryJ.SQL.ADD(' SELECT EMPNO,KORNAME,ORGNUM,DEPTCODE,BONCODE ');
     QueryJ.SQL.ADD('   FROM PKMPMAS                               ');
     QueryJ.SQL.ADD('  WHERE (EMPNO LIKE '''+E_empno.text+'%''     ');
     QueryJ.SQL.ADD('     OR KORNAME LIKE '''+E_empno.text+'%'' )  ');
     QueryJ.Open;
     CheckEmp := QueryJ.RecordCount;
     if CheckEmp < 1 then
     begin
          P_help.caption := ' 없는 사원입니다..';
          system.exit;
     end
     else if CheckEmp = 1 then
     begin
          E_EmpNo.text      := QueryJ.Fields[0].AsString;
          P_Korname.caption := QueryJ.Fields[1].AsString;
     end
     else if CheckEmp > 1 then
     begin
          SP_EmpNoClick(SP_EmpNo);
     end;
end;

end.
 