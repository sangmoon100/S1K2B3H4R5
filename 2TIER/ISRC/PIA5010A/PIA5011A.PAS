{header.
-----------------------------------------------------
PROGRAM-NAME    :  PIA5010A(가족 등록)
SYSTEM-NAME     : 종합인사정보
SUBSYSTEM-NAME  : 인사
Programmer      : 전철호
Version         : 21.01
Date            : 1998.06.19
Update contents
  버전      수정일      수정자   관련근거     수정내용
  21.00   1996.03.27    전철호  처리명세서   신규프로그램개발
  21.01   1998.06.19    김순례  콜(98.6.19)  가족수당 항목 edit->panel 콤포넌트로 변경
  21.02   2002.05.13    서혜미               사망이나 이혼시 자료를 삭제하지 않고 관리함
                                             (삭제일,사유,삭제여부,삭제자 필드 추가)
  30.00   2007.06.20    서혜미                개선작업
-----------------------------------------------------}

unit Pia5011a;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, Mask, ExtCtrls, DB, DBTables,iniFiles,pass,
  calen1,TimeFtp,datelib,codetext, Func, MemDS, DBAccess,
  Ora, KeyEmpno, keyCode, OnCheckBox, keyCode2, KeyEmpnoB;
type
  Tpia5010aForm = class(TForm)
    Panel19: TPanel;
    Lempno: TLabel;
    Lsysdate: TLabel;
    Panel5: TPanel;
    Panel3: TPanel;
    Panel2: TPanel;
    facode1: TMaskEdit;
    fawith1: TMaskEdit;
    fajobcode1: TMaskEdit;
    faplace1: TMaskEdit;
    fabirth1: TMaskEdit;
    Panel1: TPanel;
    BInsert: TBitBtn;
    BExit: TBitBtn;
    Bdelete: TBitBtn;
    BSave: TBitBtn;
    Panel6: TPanel;
    Label9: TLabel;
    helpDsr: TLabel;
    faname1: TMaskEdit;
    faschgr1: TMaskEdit;
    famedyn1: TMaskEdit;
    facode2: TMaskEdit;
    fawith2: TMaskEdit;
    fajobcode2: TMaskEdit;
    faplace2: TMaskEdit;
    fabirth2: TMaskEdit;
    faname2: TMaskEdit;
    faschgr2: TMaskEdit;
    famedyn2: TMaskEdit;
    facode3: TMaskEdit;
    fawith3: TMaskEdit;
    fajobcode3: TMaskEdit;
    faplace3: TMaskEdit;
    fabirth3: TMaskEdit;
    faname3: TMaskEdit;
    faschgr3: TMaskEdit;
    famedyn3: TMaskEdit;
    facode4: TMaskEdit;
    fawith4: TMaskEdit;
    fajobcode4: TMaskEdit;
    faplace4: TMaskEdit;
    fabirth4: TMaskEdit;
    faname4: TMaskEdit;
    faschgr4: TMaskEdit;
    famedyn4: TMaskEdit;
    facode5: TMaskEdit;
    fawith5: TMaskEdit;
    fajobcode5: TMaskEdit;
    faplace5: TMaskEdit;
    fabirth5: TMaskEdit;
    faname5: TMaskEdit;
    faschgr5: TMaskEdit;
    famedyn5: TMaskEdit;
    rank1: TPanel;
    rank2: TPanel;
    rank3: TPanel;
    rank4: TPanel;
    rank5: TPanel;
    Neldsonyn: TPanel;
    Panel9: TPanel;
    korname: TMaskEdit;
    empno: TMaskEdit;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel11: TPanel;
    Panel13: TPanel;
    Panel4: TPanel;
    Panel10: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel16: TPanel;
    Panel17: TPanel;
    Panel18: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Panel20: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Nfacode5: TPanel;
    Nfacode4: TPanel;
    Nfacode3: TPanel;
    Nfacode2: TPanel;
    Nfacode1: TPanel;
    Nfajobcode5: TPanel;
    Nfajobcode4: TPanel;
    Nfajobcode3: TPanel;
    Nfajobcode2: TPanel;
    Nfajobcode1: TPanel;
    Nfaschgr1: TPanel;
    Nfaschgr2: TPanel;
    Nfaschgr3: TPanel;
    Nfaschgr4: TPanel;
    Nfaschgr5: TPanel;
    Bcode: TBitBtn;
    faallowyn1: TPanel;
    faallowyn3: TPanel;
    faallowyn4: TPanel;
    faallowyn5: TPanel;
    faallowyn2: TPanel;
    Panel12: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    delyn1: TMaskEdit;
    deldate1: TMaskEdit;
    Panel21: TPanel;
    deldate3: TMaskEdit;
    deldate5: TMaskEdit;
    deldate2: TMaskEdit;
    deldate4: TMaskEdit;
    delyn2: TMaskEdit;
    delyn3: TMaskEdit;
    delyn4: TMaskEdit;
    delyn5: TMaskEdit;
    reason1: TComboBox;
    reason2: TComboBox;
    reason3: TComboBox;
    reason4: TComboBox;
    reason5: TComboBox;
    OraQtemp: TOraQuery;
    Qcode: TOraQuery;
    Qemp1: TOraQuery;
    Qfami: TOraQuery;
    OraQtemp1: TOraQuery;
    Panel22: TPanel;
    PGender1: TPanel;
    Gender1: TMaskEdit;
    PSchtypecd1: TPanel;
    Schtypecd1: TMaskEdit;
    PSchtypecd2: TPanel;
    Schtypecd2: TMaskEdit;
    PSchtypecd3: TPanel;
    Schtypecd3: TMaskEdit;
    PSchtypecd4: TPanel;
    Schtypecd4: TMaskEdit;
    PSchtypecd5: TPanel;
    Schtypecd5: TMaskEdit;
    PDegreecd1: TPanel;
    Degreecd1: TMaskEdit;
    Degreecd2: TMaskEdit;
    PDegreecd2: TPanel;
    PDegreecd3: TPanel;
    Degreecd3: TMaskEdit;
    Degreecd4: TMaskEdit;
    PDegreecd4: TPanel;
    PDegreecd5: TPanel;
    Degreecd5: TMaskEdit;
    PGender2: TPanel;
    Gender2: TMaskEdit;
    PGender3: TPanel;
    Gender3: TMaskEdit;
    PGender4: TPanel;
    Gender4: TMaskEdit;
    PGender5: TPanel;
    Gender5: TMaskEdit;
    Panel38: TPanel;
    Panel39: TPanel;
    Panel40: TPanel;
    Cfawith1: TOnCheckBox;
    CFamedyn1: TOnCheckBox;
    Cfawith2: TOnCheckBox;
    CFamedyn2: TOnCheckBox;
    Cfawith3: TOnCheckBox;
    CFamedyn3: TOnCheckBox;
    Cfawith4: TOnCheckBox;
    CFamedyn4: TOnCheckBox;
    Cfawith5: TOnCheckBox;
    CFamedyn5: TOnCheckBox;
    Panel41: TPanel;
    Panel23: TPanel;
    Panel24: TPanel;
    Panel25: TPanel;
    Panel26: TPanel;
    procedure BExitClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure empnoDblClick(Sender: TObject);
    procedure RunKeyPress(Sender: TObject; var Key: Char);
    procedure DataTabControl(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DataKeyControl(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DataCurYClick(Sender: TObject);
    procedure BInsertClick(Sender: TObject);
    procedure BdeleteClick(Sender: TObject);
    procedure BSaveClick(Sender: TObject);
    procedure CodeClick(Sender: TObject);
    procedure CodeClick1(Sender: TObject);
    procedure CalenClick(Sender: TObject);
    procedure KeyFieldMove(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormPaint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BcodeClick(Sender: TObject);
    procedure KeyMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure fabirth1Exit(Sender: TObject);
  private
    { Private declarations }
    EnterKey  : integer;    {엔터키 유,무}
    C_RunSave : integer;
    DelYn     : Boolean;
    FreeCheck : Boolean;
    CurY    : integer;    {현재 Row}
    CurRec  : integer;    {현재 레코드}
    LastRec : integer;    {전체 레코드수 }

    function  KeySpace : integer;
    function  CheckData(i : integer) : Boolean;
    function  MasFind(const Str : string) : integer;
    function  QCodeDisp(s1,s2 : String) : String;
    function  QCodeDisp1(s1,s2 : String) : String;
    function  QCodeDisp2(s1,s2 : String) : String;
    procedure KeyClick(Sender: TObject);
    procedure GotoField(Sender : TObject; y : integer);
    procedure DispDataField(nCol,nRec : integer);
    procedure ClearDataField(starti,endi     : integer);
    procedure EnableEdit(i  : integer);
    procedure DisableEdit(n : integer);
    procedure DataSave;
    procedure RunSaveClick;
    procedure SaveData;
    procedure RevEdit(y : integer);
    procedure NorEdit(y : integer);
    procedure DataClear(y : integer);
    function  Insert_PIHFAMILOG(v_modflag : string) : Boolean;
    function  Check_PNMSCMAS(P_empno, P_faminame : string) : integer;
  public
    { Public declarations }
    password : string;
    HomeDir  : string;
    start    : integer;

  end;

{데이타 배열}
type
  TDataRec = record
  Data1  : array[1..50] of string[2];  {가족관계}
  Data2  : array[1..50] of string[12]; {성명}
  Data3  : array[1..50] of string[1];  {성별}
  Data4  : array[1..50] of string[8];  {생년월일}
  Data5  : array[1..50] of string[1];  {의료보험}
  Data6  : array[1..50] of string[1];  {삭제여부}
  Data7  : array[1..50] of string[2];  {학교구분}
  Data8  : array[1..50] of string[2];  {직업}
  Data9  : array[1..50] of string[30]; {근무처}
  Data10 : array[1..50] of string[15]; {삭제일}     //2002.05.13 shm 추가
  Data11 : array[1..50] of string[10]; {사유}
  Data12 : array[1..50] of string[1];  {동거여부}
  Data13 : array[1..50] of string[1];  {부양여부}

  capt1  : array[1..50] of string[10]; {가족관계명}
  capt2  : array[1..50] of string[10]; {성별}
  capt3  : array[1..50] of string[1];  {가족수당}
  capt4  : array[1..50] of string[20]; {학력구분}
  capt5  : array[1..50] of string[20]; {학교유형}
  capt6  : array[1..50] of string[20]; {학위유형}
  capt7  : array[1..50] of string[20]; {직업명}
  capt8  : array[1..50] of string[1];  {가족수당}
end;

{콤포넌트 배열}
type
  TSEdit = record
  Rank   : array[1..5] of TPanel;
  Data1  : array[1..5] of TMaskEdit;    {가족관계}
  Data2  : array[1..5] of TMaskEdit;    {성명}
  Data3  : array[1..5] of TMaskEdit;    {성별}
  Data4  : array[1..5] of TMaskEdit;    {생년월일}
  Data5  : array[1..5] of TMaskEdit;    {의료보험}
  Data6  : array[1..5] of TMaskEdit;    {삭제여부}
  Data7  : array[1..5] of TMaskEdit;    {학력구분}
  Data8  : array[1..5] of TMaskEdit;    {직업}
  Data9  : array[1..5] of TMaskEdit;     {근무처}
  Data10 : array[1..5] of TMaskEdit;    {삭제일}
  Data11 : array[1..5] of TComboBox;    {사유}
  Data12 : array[1..5] of TOnCheckBox;  {동거여부}
  Data13 : array[1..5] of TOnCheckBox;  {부양여부}
  //Data14 : array[1..5] of TPanel;       {FAMID}

  Capt1  : array[1..5] of TPanel;       {가족관계명}
  Capt2  : array[1..5] of TPanel;       {성별}
  capt3  : array[1..5] of TPanel;       {가족수당}
  Capt4  : array[1..5] of TPanel;       {학력구분}
  Capt5  : array[1..5] of TPanel;       {학교명}
  Capt6  : array[1..5] of TPanel;       {학위명}
  Capt7  : array[1..5] of TPanel;       {직업명}
  Capt8  : array[1..5] of TPanel;       {가족수당}
end;

var
  pia5010aForm: Tpia5010aForm;
  DData : TDataRec;
  DEdit : TSEdit;
  Hwnd  : Word;
  ErrorHelp  : array[0..255] of char;
  WinGu : String;
implementation

{$R *.DFM}

{입력받은 데이타를 코드 화일에서 찾아서 해당 필드에 보여준다..}
function Tpia5010aForm.QCodeDisp(s1,s2 : String) : String;
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
      QcodeDisp := '코드에러'
   else QCodeDisp := Qcode.FieldByName('CodeName').AsString;
end else begin
    str := TextCodeDisp(s1,s2,HomeDir+'\pia5010a.cod');
    if trim(str) = '' then QcodeDisp := '코드에러'
                      else QcodeDisp := str;
end;
end;

{해당 필드로 포커스를 맞춘다..}
procedure Tpia5010aForm.GotoField(Sender : TObject; y : integer);
begin
   case TMaskEdit(Sender).HelpContext of
    1 :  Dedit.Data1[y].Setfocus;
    2 :  Dedit.Data2[y].Setfocus;
    3 :  Dedit.Data3[y].Setfocus;
    4 :  Dedit.Data4[y].Setfocus;
    5 :  Dedit.Data5[y].Setfocus;
    6 :  Dedit.Data6[y].Setfocus;
    7 :  Dedit.Data7[y].Setfocus;
    8 :  Dedit.Data8[y].Setfocus;
    9 :  Dedit.Data9[y].Setfocus;
    10 : Dedit.Data10[y].Setfocus;
    11 : Dedit.Data11[y].Setfocus;
    12 : Dedit.Data12[y].Setfocus;
    13 : Dedit.Data13[y].Setfocus;
   end;
end;

{데이타 체크 }
function Tpia5010aForm.CheckData(i : integer) : Boolean;
var
  CheckSum,j : integer;
  Temp       : String;
begin
  CheckSum := 0;

  Temp := Dedit.Data1[CurY].Text+Dedit.Data2[CurY].Text;
  for j := 1 to LastRec do begin
     if (trim(DData.Data1[j]) = '') or
        (QcodeDisp('I211',DData.Data1[j]) = '코드에러') then begin
         HelpDsr.Caption := '가족관계 필드에러입니다..(순번 : '+Inttostr(j)+' )';
         //2015.01.12.hjku.. 메시지 추가..
         Application.Messagebox('가족관계는 반드시 입력하여야 합니다.','입력안내',mb_ok);
         CheckSum := 1; Break;
     end;

     if trim(DData.Data2[j]) = '' then begin
         HelpDsr.Caption := '성명 필드에러입니다..(순번 : '+Inttostr(j)+' )';
         //2015.01.12.hjku.. 메시지 추가..
         Application.Messagebox('성명은 반드시 입력하여야 합니다.','입력안내',mb_ok);
         CheckSum := 1; Break;
     end;

     //2015.01.12.hjku.. 입력체크 추가
     if trim(DData.Data4[j]) = '' then begin
         HelpDsr.Caption := '생년월일 필드에러입니다..(순번 : '+Inttostr(j)+' )';
         //2015.01.12.hjku.. 메시지 추가..
         Application.Messagebox('생년월일은 반드시 입력하여야 합니다.','입력안내',mb_ok);
         CheckSum := 1; Break;
     end;     
(*
     if (trim(DData.Data3[j]) <> 'Y') and (trim(DData.Data3[j]) <> 'N') then begin
         HelpDsr.Caption := '동거 필드에러입니다..(순번 : '+Inttostr(j)+' )';
         CheckSum := 1; Break;
     end;

{2009.05.19 최슬기 요청으로 학력,직업필드 체크 뺌 jissi
     if (trim(DData.Data4[j]) = '') or
        (QcodeDisp('I221',DData.Data4[j]) = '코드에러') then begin
        HelpDsr.Caption := '학력 필드에러입니다..(순번 : '+Inttostr(j)+' )';
        CheckSum := 1; Break;
     end;
}
     if trim(DData.Data5[j]) = '' then begin
         HelpDsr.Caption := '생년월일 필드에러입니다..(순번 : '+Inttostr(j)+' )';
         CheckSum := 1; Break;
     end;
{     if (trim(DData.Data7[j]) <> 'Y') and (Rtrim(DData.Data7[j]) <> 'N') then begin
         HelpDsr.Caption := '의료보험 필드에러입니다..(순번 : '+Inttostr(j)+' )';
         CheckSum := 1; Break;
     end;  }    //2001.11.12 shm 의료보험 Y/N space 많음. 수정,삭제가 안되므로 일단 막음.
{
     if (trim(DData.Data8[j]) = '') or
        (QcodeDisp('I212',DData.Data8[j]) = '코드에러') then begin
        HelpDsr.Caption := '직업 필드에러입니다..(순번 : '+Inttostr(j)+' )';
        CheckSum := 1; Break;
     end;
}
     if CurRec <> j then
     if  Temp = (DData.Data1[j]+DData.Data2[j]) then  begin
         HelpDsr.Caption := '중복된 자료가 발생했습니다..(확인요망 !.)';
         CheckSum := 1; break;
     end;
*)
  end;
  SendMessage(Panel6.handle,WM_PAINT,0,0);
  if CheckSum = 0 then CheckData := True
  else CheckData := False;
end;

function Tpia5010aForm.MasFind(const Str : string) : integer;
begin
   if trim(str) = '' then system.Exit;
   Qemp1.Close;
   Qemp1.ParamByName('Lempno').AsString := Str;
   Qemp1.Open;
   empno.Text        := Qemp1.FieldByName('empno').AsString;
   korname.Text      := Qemp1.FieldByName('korname').AsString;
   if Qemp1.FieldByName('eldsonyn').AsString = '' then
         Neldsonyn.Caption := '(*) 성별 : ' + QCodeDisp('I039',Qemp1.FieldByName('sex').AsString)
                              + ',  장남여부 : ' + 'N'
   else  Neldsonyn.Caption := '(*) 성별 : ' + QCodeDisp('I039',Qemp1.FieldByName('sex').AsString)
                              + ',  장남여부 : ' + Qemp1.FieldByName('eldsonyn').AsString;
   MasFind := Qemp1.RecordCount;
   Qemp1.Close;
end;

{데이타 배열에 잡혀있는 데이타를 해당되는 데이타만 지운다}
procedure Tpia5010aForm.DataClear(y : integer);
begin
  DData.Data1[y]  := '';
  DData.Data2[y]  := '';
  DData.Data3[y]  := '';
  DData.Data4[y]  := '';
  DData.Data5[y]  := 'N';
  DData.Data6[y]  := 'N';
  DData.Data7[y]  := '';
  DData.Data8[y]  := '';
  DData.Data9[y]  := '';
  DData.Data10[y] := '';
  DData.Data11[y] := '';
  DData.Data12[y] := '';
  DData.Data13[y] := '';
  DData.Capt1[y]  := '';
  DData.Capt2[y]  := '';
  DData.Capt3[y]  := 'N';
  DData.Capt4[y]  := '';
  DData.Capt5[y]  := '';
  DData.Capt6[y]  := '';
  DData.Capt7[y]  := '';
end;

{입력필드부분들을 반전한다..}
procedure Tpia5010aForm.RevEdit(y : integer);
begin
 with  Dedit do
 begin
  Data1[y].Color  := clYellow;
  Data2[y].Color  := clYellow;
  Data3[y].Color  := clYellow;
  Data4[y].Color  := clYellow;
  Data5[y].Color  := clYellow;
  Data6[y].Color  := clYellow;
  Data7[y].Color  := clYellow;
  Data8[y].Color  := clYellow;
  Data9[y].Color  := clYellow;
  Data10[y].Color := clYellow;
  Data11[y].Color := clYellow;
 end;
end;

{입력필드부분을 보통으로 한다.}
procedure Tpia5010aForm.NorEdit(y : integer);
begin
 with  Dedit do
 begin
  Data1[y].Color  := clWhite;
  Data2[y].Color  := clWhite;
  Data3[y].Color  := clWhite;
  Data4[y].Color  := clWhite;
  Data5[y].Color  := clWhite;
  Data6[y].Color  := clWhite;
  Data7[y].Color  := clWhite;
  Data8[y].Color  := clWhite;
  Data9[y].Color  := clWhite;
  Data10[y].Color := clWhite;
  Data11[y].Color := clWhite;
 end;
end;

{데이타의 내용을 지운다..}
procedure Tpia5010aForm.ClearDataField(starti,endi : integer);
var
  i : integer;
begin
  for i := starti to endi do
  begin
    with Dedit do
    begin
      Rank[i].Caption  := '';
      Rank[i].Color    := $00D2D2D2;
      Data1[i].Text    := '';
      Data2[i].Text    := '';
      Data3[i].Text    := '';
      Data4[i].Text    := '';
      Data5[i].Text    := '';
      Data6[i].Text    := '';
      Data7[i].Text    := '';
      Data8[i].Text    := '';
      Data9[i].Text    := '';
      Data10[i].Text   := '';
      Data11[i].Text   := '';

      Data12[i].Checked := False;
      Data13[i].Checked := False;
      //Data14[i].Caption := '';

      Capt1[i].Caption := '';
      Capt2[i].Caption := '';
      Capt3[i].Caption := '';
      Capt4[i].Caption := '';
      Capt5[i].Caption := '';
      Capt6[i].Caption := '';
      Capt7[i].Caption := '';
    end;
  end;
end;

{데이타의 내용을 채운다..}
procedure Tpia5010aForm.DispDataField(nCol,nRec : integer);
begin
  Dedit.Rank[nCol].Caption := IntToStr(nRec)+' ';
  Dedit.Data1[nCol].Text   := DData.Data1[nRec];
  Dedit.Data2[nCol].Text   := DData.Data2[nRec];
  Dedit.Data3[nCol].Text   := DData.Data3[nRec];
  Dedit.Data4[nCol].Text   := DData.Data4[nRec];
  Dedit.Data5[nCol].Text   := DData.Data5[nRec];
  Dedit.Data6[nCol].Text   := DData.Data6[nRec];
  Dedit.Data7[nCol].Text   := DData.Data7[nRec];
  Dedit.Data8[nCol].Text   := DData.Data8[nRec];
  Dedit.Data9[nCol].Text   := DData.Data9[nRec];
  Dedit.Data10[nCol].Text  := DData.Data10[nRec];
  Dedit.Data11[nCol].Text  := DData.Data11[nRec];

  if (DData.Data12[nRec] = 'Y') Then Dedit.Data12[nCol].Checked := True
  Else                               Dedit.Data12[nCol].Checked := False;

  if (DData.Data13[nRec] = 'Y') Then Dedit.Data13[nCol].Checked := True
  Else                               Dedit.Data13[nCol].Checked := False;

  Dedit.Capt1[nCol].Caption := DData.Capt1[nRec];
  Dedit.Capt2[nCol].Caption := DData.Capt2[nRec];
  Dedit.Capt3[nCol].Caption := DData.Capt3[nRec];
  Dedit.Capt4[nCol].Caption := DData.Capt4[nRec];
  Dedit.Capt5[nCol].Caption := DData.Capt5[nRec];
  Dedit.Capt6[nCol].Caption := DData.Capt6[nRec];
  Dedit.Capt7[nCol].Caption := DData.Capt7[nRec];
end;


{에디트 필드를 가능하게 한다..}
procedure Tpia5010aForm.EnableEdit(i : integer);
begin
  with Dedit do  begin
    Data1[i].Enabled  := True;
    Data2[i].Enabled  := True;
    Data3[i].Enabled  := True;
    Data4[i].Enabled  := True;
    Data5[i].Enabled  := True;
    Data6[i].Enabled  := True;
    Data7[i].Enabled  := True;
    Data8[i].Enabled  := True;
    Data9[i].Enabled  := True;
    Data10[i].Enabled := True;
    Data11[i].Enabled := True;
    Data12[i].Enabled := True;
    Data13[i].Enabled := True;
  end;
end;

{데이타 필드를 불가능하게 한다..}
procedure Tpia5010aForm.DisableEdit(n : integer);
var
  i : integer;
begin
 for i := n+1 to 5 do begin
  with Dedit do  begin
    Data1[i].Enabled  := False;
    Data2[i].Enabled  := False;
    Data3[i].Enabled  := False;
    Data4[i].Enabled  := False;
    Data5[i].Enabled  := False;
    Data6[i].Enabled  := False;
    Data7[i].Enabled  := False;
    Data8[i].Enabled  := False;
    Data9[i].Enabled  := False;
    Data10[i].Enabled := False;
    Data11[i].Enabled := False;
    Data12[i].Enabled := False;
    Data13[i].Enabled := False;
  end;
 end;
end;

{데이타를 배열에 저장한다..}
procedure Tpia5010aForm.DataSave;
begin
  DData.Data1[CurRec]  := Dedit.Data1[CurY].Text;
  DData.Data2[CurRec]  := Dedit.Data2[CurY].Text;
  DData.Data3[CurRec]  := Dedit.Data3[CurY].Text;
  DData.Data4[CurRec]  := Dedit.Data4[CurY].Text;
  DData.Data5[CurRec]  := Dedit.Data5[CurY].Text;
  DData.Data6[CurRec]  := Dedit.Data6[CurY].Text;
  DData.Data7[CurRec]  := Dedit.Data7[CurY].Text;
  DData.Data8[CurRec]  := Dedit.Data8[CurY].Text;
  DData.Data9[CurRec]  := Dedit.Data9[CurY].Text;
  DData.Data10[CurRec] := Dedit.Data10[CurY].Text;
  DData.Data11[CurRec] := Dedit.Data11[CurY].Text;

  if (Dedit.Data12[CurY].Checked) Then DData.Data12[CurRec] := 'Y'
  Else                                 DData.Data12[CurRec] := 'N';

  if (Dedit.Data13[CurY].Checked) Then DData.Data13[CurRec] := 'Y'
  Else                                 DData.Data13[CurRec] := 'N';

  DData.Capt1[CurRec]  := Dedit.Capt1[CurY].Caption;
  DData.Capt2[CurRec]  := Dedit.Capt2[CurY].Caption;
  DData.Capt3[CurRec]  := Dedit.Capt3[CurY].Caption;
  DData.Capt4[CurRec]  := Dedit.Capt4[CurY].Caption;
  DData.Capt5[CurRec]  := Dedit.Capt5[CurY].Caption;
  DData.Capt6[CurRec]  := Dedit.Capt6[CurY].Caption;
  DData.Capt7[CurRec]  := Dedit.Capt7[CurY].Caption;
end;

{키값의 공백을 체크한다..}
function Tpia5010aForm.KeySpace : integer;
var
  i : integer;
begin
  if (empno.Text = '') or (korname.Text = '') then  KeySpace := 1
  else KeySpace := 0;
end;

{종료버턴을 누를경우...}
procedure Tpia5010aForm.BExitClick(Sender: TObject);
begin
  Close;
end;

procedure Tpia5010aForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ShowWindow(Hwnd,sw_ShowNormal);
  codeToText(HomeDir+'\pia5010a.cod','',3);
end;

// 폼에 관련된 사항들..---------------------------------------------------------
procedure Tpia5010aForm.FormCreate(Sender: TObject);
begin
  start := 0;
end;

procedure Tpia5010aForm.FormActivate(Sender: TObject);
var
  iniFile : TIniFile;
  CurDate : String;
begin
  HomeDir := HomeDirOpen;
  with Dedit do  begin
     Rank[1] := rank1; Rank[2] := rank2; Rank[3] := rank3; Rank[4] := rank4;
     Rank[5] := rank5;

     Data1[1] := facode1;      Data2[1]  := faname1;    Data3[1] := Gender1;
     Data1[2] := facode2;      Data2[2]  := faname2;    Data3[2] := Gender2;
     Data1[3] := facode3;      Data2[3]  := faname3;    Data3[3] := Gender3;
     Data1[4] := facode4;      Data2[4]  := faname4;    Data3[4] := Gender4;
     Data1[5] := facode5;      Data2[5]  := faname5;    Data3[5] := Gender5;
     Data4[1] := fabirth1;     Data5[1]  := famedyn1;   Data6[1] := delyn1;
     Data4[2] := fabirth2;     Data5[2]  := famedyn2;   Data6[2] := delyn2;
     Data4[3] := fabirth3;     Data5[3]  := famedyn3;   Data6[3] := delyn3;
     Data4[4] := fabirth4;     Data5[4]  := famedyn4;   Data6[4] := delyn4;
     Data4[5] := fabirth5;     Data5[5]  := famedyn5;   Data6[5] := delyn5;
     Data7[1] := faschgr1;     Data8[1]  := fajobcode1; Data9[1] := faplace1;
     Data7[2] := faschgr2;     Data8[2]  := fajobcode2; Data9[2] := faplace2;
     Data7[3] := faschgr3;     Data8[3]  := fajobcode3; Data9[3] := faplace3;
     Data7[4] := faschgr4;     Data8[4]  := fajobcode4; Data9[4] := faplace4;
     Data7[5] := faschgr5;     Data8[5]  := fajobcode5; Data9[5] := faplace5;
     Data10[1] := deldate1;    Data11[1] := reason1;    Data12[1] :=Cfawith1;
     Data10[2] := deldate2;    Data11[2] := reason2;    Data12[2] :=Cfawith2;
     Data10[3] := deldate3;    Data11[3] := reason3;    Data12[3] :=Cfawith3;
     Data10[4] := deldate4;    Data11[4] := reason4;    Data12[4] :=Cfawith4;
     Data10[5] := deldate5;    Data11[5] := reason5;    Data12[5] :=Cfawith5;
     Data13[1] := CFamedyn1;
     Data13[2] := CFamedyn2;
     Data13[3] := CFamedyn3;
     Data13[4] := CFamedyn4;
     Data13[5] := CFamedyn5;

     Capt1[1]  := Nfacode1;    Capt2[1]  := PGender1;   Capt3[1] := faallowyn1;
     Capt1[2]  := Nfacode2;    Capt2[2]  := PGender2;   Capt3[2] := faallowyn2;
     Capt1[3]  := Nfacode3;    Capt2[3]  := PGender3;   Capt3[3] := faallowyn3;
     Capt1[4]  := Nfacode4;    Capt2[4]  := PGender4;   Capt3[4] := faallowyn4;
     Capt1[5]  := Nfacode5;    Capt2[5]  := PGender5;   Capt3[5] := faallowyn5;
     Capt4[1]  := Nfaschgr1;   Capt5[1]  := PSchtypecd1; Capt6[1]  := PDegreecd1;
     Capt4[2]  := Nfaschgr2;   Capt5[2]  := PSchtypecd2; Capt6[2]  := PDegreecd2;
     Capt4[3]  := Nfaschgr3;   Capt5[3]  := PSchtypecd3; Capt6[3]  := PDegreecd3;
     Capt4[4]  := Nfaschgr4;   Capt5[4]  := PSchtypecd4; Capt6[4]  := PDegreecd4;
     Capt4[5]  := Nfaschgr5;   Capt5[5]  := PSchtypecd5; Capt6[5]  := PDegreecd5;
     Capt7[1] := Nfajobcode1;
     Capt7[2] := Nfajobcode2;
     Capt7[3] := Nfajobcode3;
     Capt7[4] := Nfajobcode4;
     Capt7[5] := Nfajobcode5;
  end;

  start := 0;
  password  := PassEmp(cmdline,3);
  iniFile      := TiniFile.Create(HomeDir+'\insa.ini');
  WinGu        := iniFile.ReadString('Insa','구분','');
  if Wingu = 'on' then begin
     empno.Text   := iniFile.ReadString('Insa','사원번호','');
     korname.Text := iniFile.ReadString('Insa','사원성명','');
     iniFile.WriteString('Insa','구분','off');
  end;
  iniFile.Destroy;

  Hwnd := FindWindow('Tpia1031aForm','종합인사정보시스템 (인사시스템)');
  ShowWindow(Hwnd,sw_Hide);
end;

procedure Tpia5010aForm.FormPaint(Sender: TObject);
var
  CurDate : String;
begin
if start = 0 then begin
  start := 1;
  Helpdsr.Caption := ' 종합인사시스템에 접속중입니다, 잠시만기다리세요...';
  Application.ProcessMessages;

  OraConnect;

  //edit1.Text := Ora_Session.Server;

  Lempno.Caption   := Pkorname + '(' + Pempno+')';
  Lsysdate.Caption := fn_GetDateStr;
  if copy(Pgrade,2,1) > 'C' then
  begin
       MessageBox(handle,'프로그램 사용권한이 없습니다 !!.','알 림',MB_OK or $0030);
       close;
  end;
  FreeCheck := False;
  KeyClick(Sender); empno.SetFocus;
  DataCurYClick(Sender);
  Helpdsr.Caption := '해당코드를 다운받고 시작하시면 속도가 향상됩니다..';
end;
end;

{키필드에 클릭했을 경우 }
procedure Tpia5010aForm.KeyMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Bsave.Caption = '저장' then KeyClick(Sender);
end;

procedure Tpia5010aForm.KeyClick(Sender: TObject);
var
  i : integer;
begin
  empno.SetFocus;  NorEdit(CurY);
  CurY    := 1;    CurRec  := 1;  LastRec := 1;

  ClearDataField(1,5);
  for i := 1 to 50 do  DataClear(i);  {50개로 잡힌 배열을 초기화 한다..}
  DisableEdit(0);

  Bsave.Caption := '실행';
  Bsave.Glyph.LoadFromFile(HomeDir+'\pic\pbutt014.bmp');
  Binsert.Enabled  := False;
  Bdelete.Enabled  := False;
end;

{사원번호 ,성명을 더블클릭할 경우 }
procedure Tpia5010aForm.empnoDblClick(Sender: TObject);
begin
  Helpdsr.Caption := '사원을 선택 하십시오..';
{
  FKeyEmpno := TFKeyEmpno.Create(Self);
  try
    if   TMaskEdit(Sender).Tag = 1 then FKeyEmpno.EdEmpno.Text := empno.Text
    else                                FKeyEmpno.EdEmpno.Text := korname.Text;

    FKeyEmpno.v_Table_Name := 'pimpmas';
    FKeyEmpno.ShowModal;

    if FKeyEmpno.CloseChk = -1 then Exit;

    Empno.Text    := FKeyEmpno.v_KeyEmpno;
    Korname.Text  := FKeyEmpno.v_KeyKorname;
  finally
    FKeyEmpno.Free;
    Helpdsr.Caption := '';
  end;
}

  //20180701 최성일 추가
  FKeyEmpnoB := TFKeyEmpnoB.Create(self);

  Try
    FKeyEmpnoB.EdEmpno.Text := empno.Text;
    FKeyEmpnoB.v_EmpGb      := 'A';   // 'M' 임원, 'Y' 파견직, 'Z' 일반직(임원 파견직 제외), 'A' 전체
    FKeyEmpnoB.v_CloseGb    := False; // True 자동닫음, False 닫지않음 - 조회대상건이 1건일때 화면을 자동으로 Close 한다.
    FKeyEmpnoB.BBrun.OnClick(Sender);
    FKeyEmpnoB.ShowModal;

    if FKeyEmpnoB.CloseChk <> -1 then
    begin
      empno.TExt   := FKeyEmpnoB.v_KeyEmpno;
      korname.Text := FKeyEmpnoB.v_KeyKorname;
    end;

  Finally
    FKeyEmpnoB.Free;
    Helpdsr.Caption := '';    
  end;

end;

{------------------------------------------------------------------------------}
{저장,실행키를 누를경우 }
{------------------------------------------------------------------------------}
procedure Tpia5010aForm.RunSaveClick;
var
  i : integer;
begin
{실행키이면 }
if C_RunSave = 1 then
begin
 if KeySpace = 0 then
 begin
     Helpdsr.Caption := '해당 사원의 가족사항을 찾는 중입니다..';
     SendMessage(panel6.Handle,WM_PAINT,0,0);
     Bsave.Caption := '저장';
     Bsave.Glyph.LoadFromFile(HomeDir+'\pic\pbutt010.bmp');
     Binsert.Enabled  := True;
     Bdelete.Enabled  := True;

     Try
     Qfami.Close;
     Qfami.ParamByName('Lempno').AsString := empno.Text;
     Qfami.Open;

     LastRec := Qfami.RecordCount;
     i := 1;
     While not(Qfami.Eof) do
     begin
       empno.Text     := Qfami.FieldByName('empno').AsString;
       korname.Text   := Qfami.FieldByName('korname').AsString;
       DData.Data1[i] := Qfami.FieldByName('facode').AsString;
       DData.Data2[i] := Qfami.FieldByName('faname').AsString;
       DData.Data3[i] := Qfami.FieldByName('Gender').AsString;
       DData.Data4[i] := Qfami.FieldByName('fabirthdate').AsString;
       DData.Data5[i] := Qfami.FieldByName('famedyn').AsString;
       DData.Data6[i] := Qfami.FieldByName('delyn').AsString;
       DData.Data7[i] := Qfami.FieldByName('faschgr').AsString;
       DData.Data8[i] := Qfami.FieldByName('fajobcode').AsString;
       DData.Data9[i] := Qfami.FieldByName('faplace').AsString;
       DData.Data10[i]:= Qfami.FieldByName('deldate').AsString;
       DData.Data11[i]:= Qfami.FieldByName('reason').AsString;
       DData.Data12[i]:= Qfami.FieldByName('fawith').AsString;
       DData.Data13[i]:= Qfami.FieldByName('ProviYn').AsString;
       DData.Capt1[i] := QCodeDisp('I211',DData.Data1[i]);
       DData.Capt2[i] := QCodeDisp('I039',DData.Data3[i]);
       DData.Capt3[i] := Qfami.FieldByName('faallowyn').AsString;
       DData.Capt4[i] := QCodeDisp('I221',DData.Data7[i]);
       DData.Capt5[i] := QCodeDisp1('I221',DData.Data7[i]);
       DData.Capt6[i] := QCodeDisp2('I221',DData.Data7[i]);
       DData.Capt7[i] := QCodeDisp('I212',DData.Data8[i]);
       Qfami.Next;
       inc(i);
     end;
     Qfami.Close;
     EXCEPT ON E : EDataBaseError DO
       MessageBox(handle,StrPcopy(ErrorHelp,E.Message),'에  러',MB_OK or $0010);
     END;

     if LastRec <= 0 then
     begin
       DataClear(1); {추가된 데이타를 클리어한다}
       LastRec := 1;
     end;

     for i := 1 to 5 do EnableEdit(i);
     if LastRec < 5 then  DisableEdit(LastRec);

     if LastRec > 5 then
        for i := 1 to 5 do DispDataField(i,i)
     else for  i := 1 to LastRec do DispDataField(i,i);

     Helpdsr.Caption := '';
     CurY := 1;
     RevEdit(CurY);
     Dedit.Data1[CurY].SetFocus;
 end else empno.SetFocus;
end
else
 {저장이면 }
begin
  if MessageBox(handle,'변경된 내용을 저장하시겠습니까 ?..','확  인',MB_YESNO or $0020)
     = ID_NO then begin
     ClearDataField(1,5);
     KeyClick(BSave);
     empno.SetFocus;
     System.Exit;
  end;
  SaveData; {데이타 저장}
end; {else end}

end;
{----------------------------키제어-----------------------------------}
{키필드부분 키제어}
procedure Tpia5010aForm.KeyFieldMove(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  sawon : string;
begin
  if Key = vk_F1  then empnoDblClick(Sender);
  if (Key = vk_Return) or (Key = vk_Tab) then
   begin
      case TComponent(Sender).Tag of
        1 : begin
            Sawon := 'key';
            if trim(empno.Text) <> '' then begin
               if MasFind(empno.Text) > 0 then Sawon := 'yes' else Sawon := 'non';
            end;
            if Sawon = 'key' then korname.SetFocus;
            if Sawon = 'yes' then begin
               C_RunSave := 1;
               RunSaveClick;
            end;
            end;
        2 : empno.SetFocus;
      end; {case end}
   end; {if end}
end;

{키필드 부분에서 엔터키를 누를경우..}
procedure Tpia5010aForm.RunKeyPress(Sender: TObject; var Key: Char);
begin
  Helpdsr.Caption := '';
  if Key = Chr(13) then
  begin
     Key := Chr(0);   {소리제겅용}
     if TComponent(Sender).Name = 'korname' then
     begin
     {성명에서 엔터키를 치면 실행키와 같은 처리를한다..}
     C_RunSave := 1;
     EnterKey := 0;
     if trim(empno.Text) = '' then begin
        if MasFind(korname.Text) > 1 then empnoDblClick(korname);
     end;
     RunSaveClick;
     end;
  end;
end;

{데이타 필드에서 Tab 키제어..}
procedure Tpia5010aForm.DataTabControl(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_F5  then BinsertClick(Sender);
  if Key = vk_F7  then BdeleteClick(Sender);
  if Key = vk_F9  then KeyClick(Sender);
  if Key = vk_F12 then BsaveClick(Sender);
  if not(ssShift  in Shift) then
  begin
    if (Key = vk_Tab) or (Key = vk_Return) then
    begin
      HelpDsr.Caption := '';
      DataSave;
      case TMaskEdit(Sender).HelpContext of
        1 : begin
            if EnterKey <> 0 then
            begin
              Dedit.Capt1[CurY].Caption := QCodeDisp('I211',Dedit.Data1[CurY].Text);
              Dedit.Data2[CurY].Setfocus;
            end;
            EnterKey := 1;
            end;
        2 : Dedit.Data3[CurY].Setfocus;
        3 : Begin
              Dedit.Capt2[CurY].Caption := QCodeDisp('I039',Dedit.Data3[CurY].Text);
              Dedit.Data4[CurY].Setfocus;
            End;
        4 : Dedit.Data5[CurY].Setfocus;
        5 : Dedit.Data6[CurY].Setfocus;
        6 : Dedit.Data7[CurY].Setfocus;
        7 : begin
              Dedit.Capt4[CurY].Caption := QCodeDisp('I221', Dedit.Data7[CurY].Text);
              Dedit.Capt5[CurY].Caption := QCodeDisp1('I221',Dedit.Data7[CurY].Text);
              Dedit.Capt6[CurY].Caption := QCodeDisp2('I221',Dedit.Data7[CurY].Text);
              Dedit.Data8[CurY].Setfocus;
            end;
        8 : begin
              Dedit.Capt7[CurY].Caption := QCodeDisp('I212',Dedit.Data8[CurY].Text);
              Dedit.Data9[CurY].Setfocus;
            end;
        9 : Dedit.Data1[CurY].Setfocus;
        10: Dedit.Data11[CurY].Setfocus;
      end; {case end}
    end; {inner if end}
  end {if end}
  else
  begin
    if (Key = vk_Tab) or (Key = vk_Return) then
    begin
      HelpDsr.Caption := '';
      DataSave;
      case TMaskEdit(Sender).HelpContext of
        1 : begin
            if EnterKey <> 0 then
            begin
              Dedit.Capt1[CurY].Caption := QCodeDisp('I211',Dedit.Data1[CurY].Text);
              Dedit.Data2[CurY].Setfocus;
            end;
            EnterKey := 1;
            end;
        2 : Dedit.Data3[CurY].Setfocus;
        3 : Begin
              Dedit.Capt2[CurY].Caption := QCodeDisp('I039',Dedit.Data3[CurY].Text);
              Dedit.Data4[CurY].Setfocus;
            End;
        4 : Dedit.Data5[CurY].Setfocus;
        5 : Dedit.Data6[CurY].Setfocus;
        6 : Dedit.Data7[CurY].Setfocus;
        7 : begin
              Dedit.Capt4[CurY].Caption := QCodeDisp('I221' ,Dedit.Data7[CurY].Text);
              Dedit.Capt5[CurY].Caption := QCodeDisp1('I221',Dedit.Data7[CurY].Text);
              Dedit.Capt6[CurY].Caption := QCodeDisp2('I221',Dedit.Data7[CurY].Text);
              Dedit.Data8[CurY].Setfocus;
            end;
        8 : begin
              Dedit.Capt7[CurY].Caption := QCodeDisp('I212',Dedit.Data8[CurY].Text);
              Dedit.Data10[CurY].Setfocus;
            end;
        9 : Dedit.Data1[CurY].Setfocus;
        10: Dedit.Data11[CurY].Setfocus;
      end; {case end}
    end; {inner if end}
  end; {else end}

end;

{데이타 부분 키제어 }
procedure Tpia5010aForm.DataKeyControl(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  i, TempRec : integer;
begin
  if Key = vk_F1  then begin
     if (TMaskEdit(Sender).HelpContext = 5) then CalenClick(Sender);
     if (TMaskEdit(Sender).HelpContext = 1) or
        (TMaskEdit(Sender).HelpContext = 4) or
        (TMaskEdit(Sender).HelpContext = 8) then CodeClick(Sender);
  end;
  {다운키를 누를경우 }
  if Key = vk_Down then
  begin
     HelpDsr.Caption := '';
     DataSave; {데이타를 배열에 저장한다..}
     if CurRec < LastRec then
     begin
       if CurY <> 5 then
       begin
          NorEdit(CurY);
          inc(CurRec); {현재레코드 증가 }
          inc(CurY);
          RevEdit(CurY);
       end
       else
       begin
          NorEdit(CurY);
          inc(CurRec); {현재레코드 증가 }
          for i := 1 to 5 do DispDataField(i,i+(CurRec-5));
          RevEdit(CurY);
       end;
     end;

     GotoField(Sender,CurY);  {마우스로 찍은 x위치에 해당하는 열로 간다..}
  end; {if end}

  {업키를 누를경우 }
  if Key = vk_Up then
  begin
     HelpDsr.Caption := '';
     DataSave; {데이타를 배열에 저장한다..}
     if LastRec > 5 then  for i := 1 to 5 do EnableEdit(i);
     if CurRec <> 1 then  {데이타를 한칸씩 스크롤한다..}
     begin
        if CurY <> 1 then
        begin
           NorEdit(CurY);
           dec(CurRec);
           dec(CurY);
           RevEdit(CurY);
        end
        else
        begin
           NorEdit(CurY);
           dec(CurRec);
           if (LastRec-CurRec) < 5 then DisableEdit((LastRec - CurRec)+1);
           for i := 1 to 5 do DispDataField(i,(i-1)+CurRec);
           RevEdit(CurY);
        end;
     end;

   GotoField(Sender,CurY);  {마우스로 찍은 x위치에 해당하는 열로 간다..}
end; {if end}


  {페이지 다운키를 누를경우 }
  if Key = vk_Next then
  begin
     if LastRec <= 5 then System.Exit;
     HelpDsr.Caption := '';
     DataSave; {데이타를 배열에 저장한다..}
     NorEdit(CurY);

     for i := 1 to 5 do EnableEdit(i);
     CurRec := CurRec + 5;
     if CurRec > LastRec then
     begin
        ClearDataField(1,5);
        CurRec := LastRec-4;
        CurY   := 1;
        for i := 1 to 5 do DispDataField(i,CurRec+(i-1));
     end
     else
     begin
        ClearDataField(1,5);
        CurY := 1;
        if (LastRec-CurRec) < 5 then
        begin
           if (LastRec-CurRec) < 5 then DisableEdit((LastRec - CurRec)+1);
           for i := 1 to (LastRec - CurRec)+1 do DispDataField(i,CurRec+(i-1));
        end
        else
           for i := 1 to 5 do DispDataField(i,CurRec+(i-1));
     end;
     RevEdit(CurY);
     Dedit.Data1[CurY].SetFocus;
  end; {if end}


  {페이지 업키를 누를경우 }
  if Key = vk_Prior then
  begin
     if LastRec <= 5 then System.Exit;
     HelpDsr.Caption := '';
     DataSave; {데이타를 배열에 저장한다..}
     NorEdit(CurY);
     for i := 1 to 5 do EnableEdit(i);
     CurRec := CurRec - 5;
     if CurRec <= 1 then
     begin
        ClearDataField(1,5);
        CurRec := 1;
        CurY   := 1;
        for i := 1 to 5 do DispDataField(i,CurRec+(i-1))
     end
     else
     begin
        CurY := 1;
        for i := 1 to 5 do DispDataField(i,CurRec+(i-1))
     end;

     RevEdit(CurY);
     Dedit.Data1[CurY].SetFocus;
  end; {if end}

end;

{데이타 필드에서 클릭했을경우 CurY 값을 변경한다..}
procedure Tpia5010aForm.DataCurYClick(Sender: TObject);
begin
 HelpDsr.Caption := '';
 DataSave;  {저장한다 (그것도 메모리에만}
 NorEdit(CurY);

 CurRec := CurRec - CurY;
 case TMaskEdit(Sender).Tag of
  1 : CurY := 1;
  2 : CurY := 2;
  3 : CurY := 3;
  4 : CurY := 4;
  5 : CurY := 5;
 end;

 CurRec := CurRec + CurY;
 if BSave.Caption = '저장' then RevEdit(CurY);
end;
{----------------------------키제어  끝..-----------------------------}

{-------------------------추가버턴을 누를경우-------------------------}
procedure Tpia5010aForm.BInsertClick(Sender: TObject);
var
  i : integer;
begin
  if LastRec >= 0 then Bdelete.Enabled := True;

  if LastRec >= 50  then  begin
     Binsert.Enabled := False;
     System.Exit;
  end;

  DataSave;
  if CheckData(CurRec) = False  then begin
     Dedit.Data1[CurY].SetFocus;
     System.Exit;
  end;

  {현재 커서위치가 마지막 데이타에에 왔을 때 추가를 누를겨우의 처리 }
  if CurRec = LastRec then  {현재레코드와 전체레코드가 같으면 ?}
  begin
    NorEdit(CurY);
    Inc(CurRec);
    if CurY = 5 then        {현재커서가 마지막커서위치인 5에 있을때}
    begin
       if LastRec >= 5 then {이때 전채레코드가 5보다 크거나 같으면 }
       begin
          CurY := 5;
          if CurRec <= LastRec then   {현재레코드가 전체레코드보다 크거나 같으면 }
          begin
            for i := 1 to 5 do DispDataField(i,(CurRec-4)+(i-1));
          end
          else
          begin
             if CurRec <= 50 then    {현재레코드가 50보다 작거나 같을경우만 추가한다 }
             begin
                inc(LastRec);
                EnableEdit(CurY);
                DataClear(CurRec);
                for i := 1 to CurY do DispDataField(i,(CurRec-(CurY-1))+(i-1));
             end
             else
             begin
                Binsert.Enabled := False;
                Dec(CurRec);
             end;
          end;
      end;
    end
    else
    begin
        if CurY = (LastRec - (CurRec-1))+CurY then {현재CurY 위치와 마지막 데이타가 같으면}
        begin                                      {하나의 레코드를 추가한다..}
             if CurRec <= 50 then            {현재레코드가 50보다 작거나 같을경우만 추가한다 }
             begin
                inc(CurY);
                inc(LastRec);
                EnableEdit(CurY);
                DataClear(CurRec);
                for i := 1 to CurY do DispDataField(i,(CurRec-(CurY-1))+(i-1));
             end
             else
             begin
                Binsert.Enabled := False;
                Dec(CurRec);
             end;
        end;
    end;

    RevEdit(CurY);
    Dedit.Data1[CurY].SetFocus;
    System.Exit;
  end; {CurRec = LastRec 마지막 레코드와 현재의 레코드가 같을때}

{레코드 중간에 데이타를 삽입할 경우  }
  for i := LastRec DownTo CurRec do  begin
   DData.Data1[i+1] := DData.Data1[i];
   DData.Data2[i+1] := DData.Data2[i];
   DData.Data3[i+1] := DData.Data3[i];
   DData.Data4[i+1] := DData.Data4[i];
   DData.Data5[i+1] := DData.Data5[i];
   DData.Data6[i+1] := DData.Data6[i];
   DData.Data7[i+1] := DData.Data7[i];
   DData.Data8[i+1] := DData.Data8[i];
   DData.Data9[i+1] := DData.Data9[i];
   DData.Data10[i+1] := DData.Data10[i];
   DData.Data11[i+1] := DData.Data11[i];
   DData.Data12[i+1] := DData.Data12[i];
   DData.Data13[i+1] := DData.Data13[i];

   DData.Capt1[i+1] := DData.Capt1[i];
   DData.Capt2[i+1] := DData.Capt2[i];
   DData.Capt3[i+1] := DData.Capt3[i];
   DData.Capt4[i+1] := DData.Capt4[i];
   DData.Capt5[i+1] := DData.Capt5[i];
   DData.Capt6[i+1] := DData.Capt6[i];
   DData.Capt7[i+1] := DData.Capt7[i];
  end;
  inc(LastRec);
  DataClear(CurRec);  {추가된 열의 데이타를 클리어 한다..}

  for i := 1 to 5 do EnableEdit(i);
  if LastRec < 5 then  DisableEdit(LastRec);

  if LastRec < 5 then begin
     for i := CurY to LastRec do  DispDataField(i,CurRec+(i-CurY));
  end else begin
     for i := 1 to 5 do DispDataField(i,CurRec+(i-CurY));
  end;
  Dedit.Data1[CurY].SetFocus;
end;

{----------------------------삭제 버턴을 누를경우--------------------------}
procedure Tpia5010aForm.BdeleteClick(Sender: TObject);
var
  i : integer;
begin
  if (Check_PNMSCMAS(empno.Text,DData.Data2[curRec]{이름}) > 0) then
  begin
    Application.Messagebox('자녀학자금대출을 이용하는 가족이라 삭제가 불가능합니다.','삭제 제한',mb_ok);
    //showmessage(DData.Data1[curRec]+'/'+DData.Data2[curRec]);
    exit;
  end;

  for i := CurRec To LastRec do  begin
    DData.Data1[i] := DData.Data1[i+1];
    DData.Data2[i] := DData.Data2[i+1];
    DData.Data3[i] := DData.Data3[i+1];
    DData.Data4[i] := DData.Data4[i+1];
    DData.Data5[i] := DData.Data5[i+1];
    DData.Data6[i] := DData.Data6[i+1];
    DData.Data7[i] := DData.Data7[i+1];
    DData.Data8[i] := DData.Data8[i+1];
    DData.Data9[i] := DData.Data9[i+1];
    DData.Data10[i] := DData.Data10[i+1];
    DData.Data11[i] := DData.Data11[i+1];
    DData.Data12[i] := DData.Data12[i+1];
    DData.Data13[i] := DData.Data13[i+1];
    
    DData.Capt1[i] := DData.Capt1[i+1];
    DData.Capt2[i] := DData.Capt2[i+1];
    DData.Capt3[i] := DData.Capt3[i+1];
    DData.Capt4[i] := DData.Capt4[i+1];
    DData.Capt5[i] := DData.Capt5[i+1];
    DData.Capt6[i] := DData.Capt6[i+1];
    DData.Capt7[i] := DData.Capt7[i+1];
  end;
  if LastRec = 1 then DelYn := True else DelYn := False;
  if LastRec > 0 then dec(LastRec);       {전체 레코드 카운트를 하나 감소한다..}

  { 현재레코드가 전체레코드보다 작으면 현재의 위치에 있는 데이타를 지우고
    현재의 커서에서 한칸위로 올라간다..}
  if CurRec <= LastRec then
  begin
     for i := 1 to 5 do EnableEdit(i);
     if LastRec < 5 then DisableEdit(LastRec);

     if LastRec < 5 then
     begin
        for i := 1 to LastRec do  DispDataField(i,(CurRec-(CurY-1))+(i-1));
        ClearDataField(LastRec+1,5);
     end
     else for i := 1 to 5 do  DispDataField(i,(CurRec-(CurY-1))+(i-1));
  end
  else
  begin
     for i := 1 to 5 do EnableEdit(i);
     if LastRec < 5 then DisableEdit(LastRec);

     if LastRec < 5 then
     begin
        if CurY <> LastRec then
        begin
           for i := 1 to LastRec do DispDataField(i,i);
           ClearDataField(LastRec+1,5);
           if CurRec > 1 then
           begin
              NorEdit(CurY);
              Dec(CurRec);
           end;
           if CurY > 1 then Dec(CurY);
           RevEdit(CurY);
        end
        else
        begin
           for i := 1 to LastRec do DispDataField(i,i);
           ClearDataField(LastRec+1,5);
           Dec(CurRec);
        end;
     end;

     if LastRec >= 5 then
     begin
       for i := 1 to 5 do DispDataField(i,((CurRec-(CurY-1))+(i-1))-1);
       Dec(CurRec);
     end;
  end;
  if LastRec >= 1 then
    Dedit.Data1[CurY].SetFocus
  else
  begin
    DataClear(1); {추가된 데이타를 클리어한다}
    LastRec := 1;
    CurY := 1;
    EnableEdit(CurY);
    DispDataField(1,1);
    Dedit.Data1[CurY].SetFocus;
  end;
end;

{실행, 저장버턴을 누를경우 }
procedure Tpia5010aForm.BSaveClick(Sender: TObject);
begin
  if Bsave.Caption = '실행' then
  begin
     C_RunSave := 1;
     MasFind(empno.Text);
  end
  else
     C_RunSave := 0;
  RunSaveClick;
end;

{코드부분을 클릭했을 경우 }
procedure Tpia5010aForm.CodeClick(Sender: TObject);
begin
  Fkeycode := TFkeycode.Create(self);
  Try
    Fkeycode.DataVal2 := TMaskEdit(Sender).Text;
    case TMaskEdit(Sender).HelpContext of
      1 : begin
            Fkeycode.FormData := '가족관계코드 열람';
            Fkeycode.DataVal1  := 'I211';
          end;
      3 : begin
            Fkeycode.FormData := '성별 열람';
            Fkeycode.DataVal1  := 'I039';
          end;
(*
      7 : begin
            Fkeycode.FormData := '학교유형코드 열람';
            Fkeycode.DataVal1  := 'I221';
          end;
      8 : begin
            Fkeycode.FormData := '학위코드 열람';
            Fkeycode.DataVal1  := 'I221';
          end;
*)
      8 : begin
            Fkeycode.FormData := '직업코드 열람';
            Fkeycode.DataVal1  := 'I212';
          end;
    end;
    Fkeycode.ShowModal;
    if Fkeycode.Code = '' then System.Exit;
    case TMaskEdit(Sender).HelpContext of
      1 : begin
            Dedit.Data1[CurY].Text    := Fkeycode.Code;
            Dedit.Capt1[CurY].Caption := Fkeycode.CodeName;
          end;
      3 : begin
            Dedit.Data3[CurY].Text    := Fkeycode.Code;
            Dedit.Capt2[CurY].Caption := Fkeycode.CodeName;
          end;
(*
      7 : begin
            Dedit.Data7[CurY].Text    := Fkeycode.Code;
            Dedit.Capt4[CurY].Caption := Fkeycode.CodeName;
          end;

      8 : begin
            Dedit.Data8[CurY].Text    := Fkeycode.Code;
            Dedit.Capt5[CurY].Caption := Fkeycode.CodeName;
          end;
*)
      8 : begin
            Dedit.Data8[CurY].Text    := Fkeycode.Code;
            Dedit.Capt7[CurY].Caption := Fkeycode.CodeName;
          end;
    end;

  Finally
    Fkeycode.Free;
  END;
end;

procedure Tpia5010aForm.CodeClick1(Sender: TObject);
begin
  Fkeycode2 := TFkeycode2.Create(self);
  Try
    Fkeycode2.DataVal2 := TMaskEdit(Sender).Text;
    case TMaskEdit(Sender).HelpContext of
      7 : begin
            Fkeycode2.FormData := '학교유형코드 열람';
            Fkeycode2.DataVal1  := 'I221';
          end;
    end;
    Fkeycode2.ShowModal;
    if Fkeycode2.Code = '' then System.Exit;
    case TMaskEdit(Sender).HelpContext of
      7 : begin
            Dedit.Data7[CurY].Text    := Fkeycode2.Code;
            Dedit.Capt4[CurY].Caption := Fkeycode2.CodeName;

            Dedit.Capt5[CurY].Caption := QCodeDisp1('I221',Dedit.Data7[CurY].Text);
            Dedit.Capt6[CurY].Caption := QCodeDisp2('I221',Dedit.Data7[CurY].Text);
          end;
    end;

  Finally
    Fkeycode2.Free;
  END;
end;


{캐린더를 부르고 값을 리턴한다..}
procedure Tpia5010aForm.CalenClick(Sender: TObject);
begin
 Calendar := TCalendar.Create(Self);
 Try
   Calendar.ShowModal;
   if Calendar.DayCaption <> '' then
      TMaskEdit(Sender).Text := Calendar.DayCaption;
 Finally
   Calendar.Free;
 End;
end;

{-----------------데이타를  저장한다...--------------------------------------}
procedure Tpia5010aForm.SaveData;
var
  i         : integer;
  SaveCount : integer;
begin
  DataSave;
  if DelYn = False then
  if (CheckData(CurRec) = False)  then begin
     Dedit.Data1[CurY].SetFocus;
     System.Exit
  end;
  DelYn := False;

  Helpdsr.Caption := '데이타 베이스와 연결중입니다..';
  SendMessage(Panel6.Handle,WM_PAINT,0,0);
  Try
  {데이타가 있는지 확인한다..}
  Qfami.Close;
  Qfami.ParamByName('Lempno').AsString := empno.Text;
  Qfami.Open;

  if Qfami.RecordCount > 0 then begin

     //2015.01.12.hjku.. 삭제하기 전에 전체 로그 남김 추가..
     if not(Insert_PIHFAMILOG('A')) then System.exit;

  {데이타를 지운다..}
     OraQtemp.Close;
     OraQtemp.Sql.Clear;
     with OraQtemp do
     begin
       Sql.Add('delete from pimfami ');
       Sql.Add('where empno = :lempno' );
       ParambyName('Lempno').AsString := empno.Text;
       EXECSQL;
     end;
  end; {if end}
  Qfami.Close;

  if LastRec = 1 then begin
     if trim(Ddata.Data1[1]+Ddata.Data2[1]+Ddata.Data3[1]+Ddata.Data4[1]+
             Ddata.Data5[1]+Ddata.Data6[1]+Ddata.Data7[1]+Ddata.Data8[1]+
             Ddata.Data9[1]+Ddata.Data12[1]+Ddata.Data13[1]) = '' then begin
         Helpdsr.Caption := '';
         ClearDataField(1,5); KeyClick(BSave); empno.SetFocus;
         System.Exit;
     end;
  end;

  {데이타를 저장한다..}
  SaveCount := 1;
  for i := 1 to LastRec do
  begin
     Helpdsr.Caption := '데이타를 저장하고 있습니다..('
                         +IntToStr(SaveCount)+'/'+IntTostr(LastRec)+')';
     SendMessage(Panel6.Handle,WM_PAINT,0,0);
     OraQtemp.Close;
     OraQtemp.Sql.Clear;
     with OraQtemp do begin
       Sql.Add('insert into pimfami ');
       Sql.Add('(empno,    korname, ');
       Sql.Add(' facode,   faname,  GENDER,   fabirthdate, faallowyn,');
       Sql.Add(' famedyn,  delyn,   faschgr,  fajobcode,   faplace,  ');
       Sql.Add(' deldate,  reason,  delempno, fawith,      ProviYn,  ');
       Sql.Add(' writetime,writeemp, FAMID, Useyn     ) ');
       Sql.Add(' values(:l1,  :l2, ');
       Sql.Add('        :l3,  :l4,  :l5,  :l6,  :l7,  ');
       Sql.Add('        :l8,  :l9,  :l10, :l11, :l12, ');
       Sql.Add('        :l13, :l14, :l15, :l16, :l17, ');
       Sql.Add('        :l18, :l19, (Select GET_EHR_RANDOM_KEY(:l1) from Dual), ''Y'' )');

       ParambyName('l1').AsString  := empno.Text;
       ParambyName('l2').AsString  := korname.Text;

       ParambyName('l3').AsString  := DData.Data1[i];
       ParambyName('l4').AsString  := DData.Data2[i];
       ParambyName('l5').AsString  := DData.Data3[i];
       ParambyName('l6').AsString  := DData.Data4[i];
       ParambyName('l7').AsString  := DData.Capt3[i];

       ParambyName('l8').AsString  := DData.Data5[i];
       ParambyName('l9').AsString  := DData.Data6[i];
       ParambyName('l10').AsString := DData.Data7[i];
       ParambyName('l11').AsString := DData.Data8[i];
       ParambyName('l12').AsString := DData.Data9[i];

       if  DData.Data6[i] <> '' then
       begin
           ParambyName('l13').AsString  := DData.Data10[i]; //삭제일
           ParambyName('l14').AsString  := DData.Data11[i]; //사유
           ParambyName('l15').AsString  := Pempno           //삭제자
       end else
       begin
           ParambyName('l13').AsString  := '';
           ParambyName('l14').AsString  := '';
           ParambyName('l15').AsString  := '';
       end;


       ParambyName('l16').AsString := DData.Data12[i];
       ParambyName('l17').AsString := DData.Data13[i];


(*

       IF DData.Data12[i] = 'Y' Then ParambyName('l16').AsString := 'Y'
       Else                          ParambyName('l16').AsString := 'N';

       IF DData.Data13[i] = 'Y' Then ParambyName('l17').AsString := 'Y'
       Else                          ParambyName('l17').AsString := 'N';

       if TOnCheckBox(Self.FindComponent('Cfawith'+IntToStr(i))).Checked Then
            ParambyName('l16').AsString := 'Y'
       Else ParambyName('l16').AsString := 'N';

       if TOnCheckBox(Self.FindComponent('CFamedyn'+IntToStr(i))).Checked Then
            ParambyName('l17').AsString := 'Y'
       Else ParambyName('l17').AsString := 'N';
*)
       ParambyName('l18').AsString := copy(Fn_GetDateTimeStr,1,15);
       ParambyName('l19').AsString := Pempno;

       {입학학력, 순위가 없으면 저장 안함 }
       if CheckData(i) = True then
       begin
        EXECSQL;
          if copy(DData.Data1[i],1,1) = '3' then
          begin
               with OraQtemp1 do
               begin
                   Close;
                   sql.Clear;
                   Sql.Add('update  pimpmas                                           ');
                   Sql.Add('   set  MARRIGEYN = ''Y'',                                ');
                   Sql.Add('        writetime = '''+copy(Fn_GetDateTimeStr,1,15)+''', ');
                   Sql.Add('        writeemp  = '''+Pempno+'''                        ');
                   Sql.Add(' where  empno     = '''+empno.Text+'''                    ');
                   EXECSQL;
               end;
          end;
        inc(SaveCount);
       end;
     end;
  end; {for end}
  EXCEPT ON E : EDataBaseError DO
     MessageBox(handle,StrPcopy(ErrorHelp,E.Message),'에  러',MB_OK or $0010);
  END;
  Helpdsr.Caption := '';  ClearDataField(1,5);
  KeyClick(BSave);        empno.SetFocus;
end;

procedure Tpia5010aForm.BcodeClick(Sender: TObject);
var
  str : string;
begin
 if FreeCheck = False then begin
    Bcode.Caption := '해당코드 해제';
 end else begin
    Bcode.Caption := '해당코드 다운';
    FreeCheck := False; system.exit;
 end;
 FreeCheck := DiskSpaceCheck;
 if FreeCheck = False then system.exit;
 HelpDsr.Caption := '해당코드를 다운받고 있습니다 !!.(속도증가를 위함)';
 SendMessage(panel6.handle,WM_PAINT,0,0);

 codeToText(HomeDir+'\pia5010a.cod','',0);
 with OraQtemp do begin
    close; sql.clear;
    sql.add('select codeid,codeno,codename from pyccode ');
    sql.add('where (codeid = ''I221'' or codeid = ''I211'') or ');
    sql.add('      (codeid = ''I212'' or codeid = ''I039'') ');
    sql.add('order by codeid,codeno ');
    open;
    while not eof do begin
      str := '';
      str := FieldByName('codeid').AsString+','+
             FieldByName('codeno').AsString+','+
             FieldByName('codename').AsString;
      codeToText('',str,1);
      next;
    end;
   OraQtemp.close;
 end;
 codeToText('','',2); HelpDsr.Caption := '';
end;

//날자형식 검사(2012.12.26) HeeYong.
procedure Tpia5010aForm.fabirth1Exit(Sender: TObject);
begin
  If ((DateCheck(TMaskEdit(Sender).Text) = False) and (TMaskEdit(Sender).Text <> '' )) then
  begin
    MessageBox(handle,'날짜를 정확히 입력하세요.','입력오류',MB_ICONEXCLAMATION);
    TMaskEdit(Sender).SetFocus;
    System.exit;
  end;
end;

function Tpia5010aForm.QCodeDisp1(s1,s2 : String) : String;
{학교유형코드를 찾아서 해당 필드에 보여준다..}
var
     qq  : TOraQuery;
begin
     QcodeDisp1 := '';
     if trim(s2) = '' then System.Exit;
     qq  := TOraQuery.Create(nil);
     qq.Session := Ora_Session;
     try
        with qq do
        begin
             Close;
             SQL.Clear;
             SQL.Add('select GROUPCODENAME from pyccode                 ');
             SQL.Add(' where codeid = :lcodeid and codeno = :lcodesub   ');
             Parambyname('lcodeid' ).AsString   := s1;
             Parambyname('lcodesub').AsString   := s2;

             Open;

             if   trim(FieldByName('GROUPCODENAME').AsString) = ''  then
                  QcodeDisp1 := '코드에러'
             else QCodeDisp1 := FieldByName('GROUPCODENAME').AsString;
        end;
     finally
        qq.free;
     end;
end;

function Tpia5010aForm.QCodeDisp2(s1,s2 : String) : String;
{학위코드 찾아서 해당 필드에 보여준다..}
var
     qq  : TOraQuery;
begin
     QcodeDisp2 := '';
     if trim(s2) = '' then System.Exit;
     qq  := TOraQuery.Create(nil);
     qq.Session := Ora_Session;
     try
        with qq do
        begin
             Close;
             SQL.Clear;
             SQL.Add('select GROUPCODENAME2 from pyccode                ');
             SQL.Add(' where codeid = :lcodeid and codeno = :lcodesub   ');
             Parambyname('lcodeid' ).AsString   := s1;
             Parambyname('lcodesub').AsString   := s2;

             Open;

             if   trim(FieldByName('GROUPCODENAME2').AsString) = ''  then
                  QcodeDisp2 := '코드에러'
             else QCodeDisp2 := FieldByName('GROUPCODENAME2').AsString;
        end;
     finally
        qq.free;
     end;
end;


//2015.01.12.hjku.. 로그 추가
function  Tpia5010aForm.Insert_PIHFAMILOG(v_modflag : string) : Boolean;
var
    Tem : string;
begin
    Insert_PIHFAMILOG := false;

    with OraQtemp1 do
    begin
        Close;
        sql.Clear;
        sql.add('INSERT INTO PIHFAMILOG                                      ');
        sql.add('SELECT TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'') MODTIME,       ');
        sql.add('       ''' + v_modflag + ''' MODFLAG,                       ');
        sql.add('       ''' + Pempno + ''' MODEMP,                           ');
        sql.add('       ''PIA5010A'' PIPROGID,                               ');
        sql.add('       A.* FROM PIMFAMI A                                   ');
        sql.add('WHERE EMPNO  = ''' + empno.Text + '''                       ');
        EXECSQL;
     end;

    Insert_PIHFAMILOG := true;
end;

function Tpia5010aForm.Check_PNMSCMAS(P_empno, P_faminame : string): integer;
var
  Flag : integer;
begin
  Flag := 1;
  with OraQtemp1 do
  begin
    Close;
    sql.Clear;
    sql.add('SELECT COUNT(*) FLAG                         ');
    sql.add('  FROM PNMSCMAS a                            ');
    sql.add(' WHERE a.EMPNO    = :empno                   ');
    sql.add('   AND a.FAMINAME = :faminame                ');
    sql.add('   AND a.SCYYMM = (SELECT MAX(c.SCYYMM)      ');
    sql.add('                     FROM PNMSCMAS c         ');
    sql.add('                    WHERE c.EMPNO = a.EMPNO) ');

    ParamByName('empno'   ).AsString   := P_empno;
    ParamByName('faminame').AsString   := P_faminame;
    EXECSQL;

    Flag := FieldByName('FLAG').AsInteger;
  end;

  result := Flag;
end;

end.

