{header.
--------------------------------------------------------------------------------
PROGRAM-NAME    :  PTA2010A (외국어 등록)
SYSTEM-NAME     : 종합인사정보
SUBSYSTEM-NAME  : 인사
Programmer      : 전철호
Version         : 21.01
Date            : 1998.06.11
Update contents
  버전     수정일     수정자   관련근거         수정내역
  21.00  1996.07.27   전철호   처리명세서       신규프로그램개발
  21.01  1998.06.11   김순례   전(98.06.09)     유효일,점수항목추가 ,시험명삭제
  31.01  2007.05.08   서혜미   자체개선         프로그램 개선작업
-------------------------------------------------------------------------------}

unit PTA2010A1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, numedit, Buttons, Mask, ExtCtrls, DBTables,datelib,
  pass,calen1,codeText, func, Ora, Db, MemDS, DBAccess;

type
  TMainForm = class(TForm)
    Panel5: TPanel;
    empno: TMaskEdit;
    korname: TMaskEdit;
    Panel4: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    deptcode: TPanel;
    Ndeptcode: TPanel;
    orgnum: TPanel;
    Npayra: TPanel;
    Panel19: TPanel;
    L_Name: TLabel;
    L_Date: TLabel;
    Panel18: TPanel;
    Panel3: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel16: TPanel;
    Panel17: TPanel;
    Panel20: TPanel;
    Panel2: TPanel;
    examdate1: TMaskEdit;
    examplace1: TMaskEdit;
    examdate2: TMaskEdit;
    examplace2: TMaskEdit;
    examdate3: TMaskEdit;
    examplace3: TMaskEdit;
    examdate4: TMaskEdit;
    examplace4: TMaskEdit;
    examdate5: TMaskEdit;
    examplace5: TMaskEdit;
    rank1: TPanel;
    rank2: TPanel;
    rank3: TPanel;
    rank4: TPanel;
    rank5: TPanel;
    Panel1: TPanel;
    BInsert: TBitBtn;
    BExit: TBitBtn;
    Bdelete: TBitBtn;
    BSave: TBitBtn;
    Panel6: TPanel;
    Label9: TLabel;
    helpDsr: TLabel;
    examscore11: TNumberEdit;
    examscore12: TNumberEdit;
    examscore13: TNumberEdit;
    examscore14: TNumberEdit;
    examscore15: TNumberEdit;
    Nexamtodate2: TPanel;
    Nexamtodate5: TPanel;
    Nexamtodate4: TPanel;
    Nexamtodate1: TPanel;
    Nexamtodate3: TPanel;
    Bcode: TBitBtn;
    examscore21: TNumberEdit;
    examscore22: TNumberEdit;
    examscore23: TNumberEdit;
    examscore24: TNumberEdit;
    examscore25: TNumberEdit;
    Nexamscore1: TPanel;
    Nexamscore2: TPanel;
    Nexamscore3: TPanel;
    Nexamscore4: TPanel;
    Nexamscore5: TPanel;
    Panel21: TPanel;
    examname1: TMaskEdit;
    examname2: TMaskEdit;
    examname3: TMaskEdit;
    examname4: TMaskEdit;
    examname5: TMaskEdit;
    Nexamname1: TPanel;
    Nexamname2: TPanel;
    Nexamname3: TPanel;
    Nexamname4: TPanel;
    Nexamname5: TPanel;
    Panel22: TPanel;
    Panel23: TPanel;
    Panel24: TPanel;
    Panel25: TPanel;
    Panel26: TPanel;
    NLangNm1: TPanel;
    NLangNm2: TPanel;
    NLangNm3: TPanel;
    NLangNm4: TPanel;
    NLangNm5: TPanel;
    LangCd1: TMaskEdit;
    LangCd2: TMaskEdit;
    LangCd3: TMaskEdit;
    LangCd4: TMaskEdit;
    LangCd5: TMaskEdit;
    Panel42: TPanel;
    LangName1: TMaskEdit;
    LangName2: TMaskEdit;
    LangName3: TMaskEdit;
    LangName4: TMaskEdit;
    LangName5: TMaskEdit;
    Panel27: TPanel;
    Panel28: TPanel;
    Panel29: TPanel;
    Panel30: TPanel;
    procedure FormActivate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure BExitClick(Sender: TObject);
    procedure empnoDblClick(Sender: TObject);
    procedure KeyTabControl(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DataTabControl(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RunKeyPress(Sender: TObject; var Key: Char);
    procedure DataCurYClick(Sender: TObject);
    procedure BInsertClick(Sender: TObject);
    procedure BdeleteClick(Sender: TObject);
    procedure BSaveClick(Sender: TObject);
    procedure CalenClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BcodeClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure KeyMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure examname1DblClick(Sender: TObject);
    procedure examscore21Exit(Sender: TObject);
    procedure examdate1Exit(Sender: TObject);
  private
    { Private declarations }
    EnterKey  : integer;    //엔터키 유,무
    C_RunSave : integer;
    DelYn     : Boolean;
    FreeCheck : Boolean;
    CurY      : integer;      //현재 Row
    CurRec    : integer;      //현재 레코드
    LastRec   : integer;      //전체 레코드수
    function  KeySpace : integer;
    function  CheckData(i : integer) : Boolean;
    function  QCodeDisp(s1,s2 : String) : String;
    function  MasFind(const str : string) : integer;
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
  public
    { Public declarations }
    start    : integer;
    Rpaycl   : string;
    HomeDir  : string;
  end;

//...........................데이타 배열.......................................
type TDataRec = record
     Data1 : array[1..50] of string[4];   {외국어유형}  //NEW
     Data2 : array[1..50] of string[20];  {외국어명}    //NEW
     Data3 : array[1..50] of string[2];   {시험유형}
     Data4 : array[1..50] of string[8];   {시험일자}
     Data5 : array[1..50] of real;        {청취점수}
     Data6 : array[1..50] of real;        {독해점수}
     Data7 : array[1..50] of string[20];  {평가기관}
     capt1 : array[1..50] of string[20];  {외국어유형}
     capt2 : array[1..50] of string[20];  {시헝유형}
     capt3 : array[1..50] of string[4];   {청취+독해 =점수계}
     capt4 : array[1..50] of string[10];  {유효일}
end;

//...........................데이타 콤포넌트 배열...............................
type TSEdit = record
     Rank  : array[1..5] of TPanel;
     Data1 : array[1..5] of TMaskEdit;
     Data2 : array[1..5] of TMaskEdit;
     Data3 : array[1..5] of TMaskEdit;
     Data4 : array[1..5] of TMaskEdit;
     Data5 : array[1..5] of TNumberEdit;
     Data6 : array[1..5] of TNumberEdit;
     Data7 : array[1..5] of TMaskEdit;

     Capt1 : array[1..5] of TPanel;
     Capt2 : array[1..5] of TPanel;
     Capt3 : array[1..5] of TPanel;
     Capt4 : array[1..5] of TPanel;
end;

var
  MainForm : TMainForm;
  DData        : TDataRec;
  DEdit        : TSEdit;

implementation

uses keyempno, keycode;
{$R *.DFM}

//.............................폼이활성화될때 이부분호출........................
procedure TMainForm.FormCreate(Sender: TObject);
begin
     start := 0;
end;

procedure TMainForm.FormPaint(Sender: TObject);
begin
     if  start = 0  then
     begin
          Start := 1;
          OraConnect;
          Application.ProcessMessages;
          L_Date.Caption   :=  fn_GetDateStr;
          L_Name.Caption   :=  Pkorname +  '(' + Pempno + ')';
          if copy(Pgrade,2,1) > 'C' then
          begin
               MessageBox(handle,'프로그램 사용권한이 없습니다 !!.','알 림',MB_OK or $0030);
               close;
          end;
          FreeCheck        :=  False;
          EnterKey         :=  0;     //누르지 않았다..
          C_RunSave        :=  1;     //실행
          KeyClick(Sender);
          empno.SetFocus;
          DataCurYClick(Sender);
          Helpdsr.Caption := '해당코드를 다운받고 시작하시면 속도가 향상됩니다..';
     end;
end;


procedure TMainForm.FormActivate(Sender: TObject);
begin
     HomeDir := HomeDirOpen;
     with DEdit do
     begin
          Rank[1]  := rank1;          Rank[2]  := rank2;
          Rank[3]  := rank3;          Rank[4]  := rank4;       Rank[5] := rank5;

          Data1[1] := LangCd1;        Data2[1] := LangName1;
          Data1[2] := LangCd2;        Data2[2] := LangName2;
          Data1[3] := LangCd3;        Data2[3] := LangName3;
          Data1[4] := LangCd4;        Data2[4] := LangName4;
          Data1[5] := LangCd5;        Data2[5] := LangName5;

          Data3[1] := examname1;      Data4[1] := examdate1;
          Data3[2] := examname2;      Data4[2] := examdate2;
          Data3[3] := examname3;      Data4[3] := examdate3;
          Data3[4] := examname4;      Data4[4] := examdate4;
          Data3[5] := examname5;      Data4[5] := examdate5;

          Data5[1] := examscore11;    Data6[1] := examscore21;
          Data5[2] := examscore12;    Data6[2] := examscore22;
          Data5[3] := examscore13;    Data6[3] := examscore23;
          Data5[4] := examscore14;    Data6[4] := examscore24;
          Data5[5] := examscore15;    Data6[5] := examscore25;

          Data7[1] := examplace1;     
          Data7[2] := examplace2;     
          Data7[3] := examplace3;     
          Data7[4] := examplace4;     
          Data7[5] := examplace5;     

          Capt1[1] := NLangNm1;       Capt2[1] := Nexamname1;
          Capt1[2] := NLangNm2;       Capt2[2] := Nexamname2;
          Capt1[3] := NLangNm3;       Capt2[3] := Nexamname3;
          Capt1[4] := NLangNm4;       Capt2[4] := Nexamname4;
          Capt1[5] := NLangNm5;       Capt2[5] := Nexamname5;

          Capt3[1] := Nexamscore1;    Capt4[1] := Nexamtodate1;
          Capt3[2] := Nexamscore2;    Capt4[2] := Nexamtodate2;
          Capt3[3] := Nexamscore3;    Capt4[3] := Nexamtodate3;
          Capt3[4] := Nexamscore4;    Capt4[4] := Nexamtodate4;
          Capt3[5] := Nexamscore5;    Capt4[5] := Nexamtodate5;
  end;
  EnterKey := 1;
end;


//............................코드화일을 찾는다.................................
function TMainForm.QCodeDisp(s1,s2 : String) : String;
var
     str : string;
     qq  : TOraQuery;
begin
     qq  := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     Application.ProcessMessages;

     try
         with qq do
         begin
              if    trim(s2)   = ''    then
              begin
                    QcodeDisp := '';
                    system.exit;
              end;

              if FreeCheck = False then
              begin
                    Close;
                    SQL.Clear;
                    SQL.Add('select codename from pyccode                          ');
                    SQL.Add(' where codeid = :lcodeid and codeno = :lcodesub       ');

                    ParamByName('lcodeid').AsString  := s1;
                    ParamByName('lcodesub').AsString := s2;

                    Open;

                    if   trim(FieldByName('CodeName').AsString) = ''  then
                         QcodeDisp := '코드에러'
                    else QCodeDisp := FieldByName('CodeName').AsString;
              end
              else
              begin
                    str := TextCodeDisp(s1,s2,HomeDir+'\pia2010a.cod');
                    if    trim(str) = '' then QcodeDisp := '코드에러'
                    else  QcodeDisp := str;
              end;
         end;
     finally
          qq.Free;
     end;
end;

function TMainForm.MasFind(const str : string) : integer;
var
     qq : TOraQuery;
begin
     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     Application.ProcessMessages;

     try
         with qq do
         begin
              if trim(str) = '' then system.Exit;

              Close;
              SQL.Clear;
              SQL.Add('select a.empno,                                                     ');
              SQL.Add('       a.korname,                                                   ');
              SQL.Add('       a.orgnum,                                                    ');
              SQL.Add('       a.deptcode,                                                  ');
              SQL.Add('      (select deptname from pycdept where a.deptcode = deptcode     ');
              SQL.Add('                        and orgnum = a.orgnum) deptname,            ');
              SQL.Add('       a.paycl,                                                     ');
              SQL.Add('      (select codename from pyccode where codeid = ''I112''         ');
              SQL.Add('                        and a.paycl = codeno) payclnm,              ');
              SQL.Add('       a.payra,                                                     ');
              SQL.Add('      (select codename from pyccode where codeid = ''I113''         ');
              SQL.Add('                        and a.payra = codeno) payranm               ');
              SQL.Add(' from  pimpmas  a                                                   ');
              SQL.Add(' where (empno = :lempno or korname = :lempno)                       ');

              ParamByName('lempno').AsString   := empno.text;
              Open;

              empno.Text          := FieldByName('empno').AsString;
              korname.Text        := FieldByName('korname').AsString;
              orgnum.Caption      := FieldByName('orgnum').AsString;
              deptcode.Caption    := FieldByName('deptcode').AsString;
              Npayra.Caption      := FieldByName('payranm').AsString;
            //Npaycl.Caption      := FieldByName('payclnm').AsString;
              Ndeptcode.Caption   := FieldByName('deptname').AsString;
              rpaycl              := FieldByName('paycl').AsString;
              MasFind := RecordCount;
         end;
     finally
          qq.Free;
     end;
end;

//.........................해당 필드로 포커스를 맞춘다...........................
procedure TMainForm.GotoField(Sender : TObject; y : integer);
begin
     case TCustomEdit(Sender).HelpContext of
          1 :  DEdit.Data1[y].Setfocus;
          2 :  DEdit.Data2[y].Setfocus;
          3 :  DEdit.Data3[y].Setfocus;
          4 :  DEdit.Data4[y].Setfocus;
          5 :  DEdit.Data5[y].Setfocus;
          6 :  DEdit.Data6[y].Setfocus;
          7 :  DEdit.Data7[y].Setfocus;
     end;
end;

//........................입력필드 데이타 체크.................................
function TMainForm.CheckData(i : integer) : Boolean;
var
     CheckSum,j : integer;
     Temp       : String;
begin
     CheckSum := 0;

     Temp := DEdit.Data1[CurY].Text;

     for j := 1 to LastRec do
     begin
          if (QcodeDisp('SK10',DData.Data1[j]) = '코드에러') then
          begin
               HelpDsr.Caption := '외국어유형 필드에러입니다..(순번 : '+Inttostr(j)+' )';
               CheckSum := 1;
               Break;
          end;

          if (QcodeDisp('I611',DData.Data3[j]) = '코드에러') then
          begin
               HelpDsr.Caption := '시험유형 필드에러입니다..(순번 : '+Inttostr(j)+' )';
               CheckSum := 1;
               Break;
          end;

          if  (length(Dedit.Data4[CurY].Text) <> 8)    or
              (copy(DEdit.Data4[CurY].Text,1,4) = '')  or
              (copy(DEdit.Data4[CurY].Text,5,2) = '')  or
              (copy(DEdit.Data4[CurY].Text,7,2) = '')  then
          begin
               HelpDsr.Caption := '시험일자 필드에러입니다..(순번 : '+Inttostr(j)+' )';
               CheckSum := 1;
               Break;
          end;

          if (DData.Data5[j] <= 0)  or (DData.Data6[j] <= 0)   then
          begin
              HelpDsr.Caption := '점수 필드에러입니다..(순번 : '+Inttostr(j)+' )';
              CheckSum := 1;
              Break;
          end;

          if  trim(DData.Data7[j]) ='' then  begin
              HelpDsr.Caption := '검정기관 필드에러입니다..(순번 : '+Inttostr(j)+' )';
              CheckSum := 1;
              Break;
          end;

          if CurRec <> j then
             if  Temp = (DData.Data2[j]) then
             begin
                  HelpDsr.Caption := '중복된 자료가 발생했습니다..(확인요망 !.)';
                  CheckSum := 1;
                  Break;
             end;
     end;
     SendMessage(Panel6.handle,WM_PAINT,0,0);
     if  CheckSum = 0  then  CheckData := True
     else                    CheckData := False;
end;

//................배열에 잡혀있는 데이타를 지운다...............................
procedure TMainForm.DataClear(y : integer);
begin
  DData.Data1[y] := '';
  DData.Data2[y] := '';
  DData.Data3[y] := '';
  DData.Data4[y] := '';
  DData.Data5[y] := 0;
  DData.Data6[y] := 0;
  DData.Data7[y] := '';
  DData.Capt1[y] := '';
  DData.Capt2[y] := '';
  DData.Capt3[y] := '';
  DData.Capt4[y] := '';
end;

//....................입력필드부분들을 반전한다.................................
procedure TMainForm.RevEdit(y : integer);
begin
  with  DEdit do
  begin
     Data1[y].Color := clYellow;
//     Data2[y].Color := clYellow;
     Data3[y].Color := clYellow;
     Data4[y].Color := clYellow;
     Data5[y].Color := clYellow;
     Data6[y].Color := clYellow;
     Data7[y].Color := clYellow;
  end;
end;

//....................입력필드부분을 보통으로 한다..............................
procedure TMainForm.NorEdit(y : integer);
begin
  with  DEdit do
  begin
    Data1[y].Color := clWhite;
//    Data2[y].Color := clWhite;
    Data3[y].Color := clWhite;
    Data4[y].Color := clWhite;
    Data5[y].Color := clWhite;
    Data6[y].Color := clWhite;
    Data7[y].Color := clWhite;
  end;
end;

//............................데이타의 내용을 지운다............................
procedure TMainForm.ClearDataField(starti,endi : integer);
var
  i : integer;
begin
  for i := starti to endi do
  begin
    with DEdit do
    begin
      Rank[i].Caption  := '';
      Rank[i].Color    := $00D2D2D2;
      Data1[i].Text    := '';
      Data2[i].Text    := '';
      Data3[i].Text    := '';
      Data4[i].Text    := '';
      Data5[i].value   := 0;
      Data6[i].Value   := 0;
      Data7[i].Text    := '';
      Capt1[i].Caption := '';
      Capt2[i].Caption := '';
      Capt3[i].Caption := '';
      Capt4[i].Caption := '';
    end;
  end;
end;

//.............................데이타의 내용을 채운다..........................
procedure TMainForm.DispDataField(nCol,nRec : integer);
begin
  DEdit.Rank[nCol].Caption  := IntToStr(nRec)+' ';
  DEdit.Data1[nCol].Text    := DData.Data1[nRec];
  DEdit.Data2[nCol].Text    := DData.Data2[nRec];
  DEdit.Data3[nCol].Text    := DData.Data3[nRec];
  DEdit.Data4[nCol].Text    := DData.Data4[nRec];
  DEdit.Data5[nCol].value   := DData.Data5[nRec];
  DEdit.Data6[nCol].value   := DData.Data6[nRec];
  DEdit.Data7[nCol].text    := DData.Data7[nRec];
  DEdit.Capt1[nCol].Caption := DData.Capt1[nRec];
  DEdit.Capt2[nCol].Caption := DData.Capt2[nRec];
  DEdit.Capt3[nCol].Caption := DData.Capt3[nRec];
  DEdit.Capt4[nCol].Caption := DData.Capt4[nRec];
  if (DEdit.Data1[nCol].Text = 'G011') Then
  Begin
    DEdit.Data2[nCol].Enabled := True;
    DEdit.Data2[nCol].Color   := clYellow;
  End
  Else
  Begin
    DEdit.Data2[nCol].Enabled := False;
    DEdit.Data2[nCol].Color   := clWhite;
  End;
end;


//.................에디트 필드를 가능하게 한다..................................
procedure TMainForm.EnableEdit(i : integer);
begin
  with DEdit do
  begin
    Data1[i].Enabled := True;
    Data2[i].Enabled := True;
    Data3[i].Enabled := True;
    Data4[i].Enabled := True;
    Data5[i].Enabled := True;
    Data6[i].Enabled := True;
    Data7[i].Enabled := True;
  end;
end;

//...................데이타 필드를 불가능하게 한다..............................
procedure TMainForm.DisableEdit(n : integer);
var
     i : integer;
begin
  for i := n+1 to 5 do
  begin
    with DEdit do
    begin
      Data1[i].Enabled  := False;
      Data2[i].Enabled  := False;
      Data3[i].Enabled  := False;
      Data4[i].Enabled  := False;
      Data5[i].Enabled  := False;
      Data6[i].Enabled  := False;
      Data7[i].Enabled  := False;
    end;
  end;
end;

//.............................데이타를 배열에 저장한다.........................
procedure TMainForm.DataSave;
begin
  DData.Data1[CurRec] := DEdit.Data1[CurY].Text;
  DData.Data2[CurRec] := DEdit.Data2[CurY].Text;
  DData.Data3[CurRec] := DEdit.Data3[CurY].Text;
  DData.Data4[CurRec] := DEdit.Data4[CurY].Text;
  DData.Data5[CurRec] := DEdit.Data5[CurY].value;
  DData.Data6[CurRec] := DEdit.Data6[CurY].value;
  DData.Data7[CurRec] := DEdit.Data7[CurY].Text;
  DData.Capt1[CurRec] := DEdit.Capt1[CurY].Caption;
  DData.Capt2[CurRec] := DEdit.Capt2[CurY].Caption;
  DData.Capt3[CurRec] := DEdit.Capt3[CurY].Caption;
  DData.Capt4[CurRec] := DEdit.Capt4[CurY].Caption;
end;

//.............................키값의 공백을 체크한다............................
function TMainForm.KeySpace : integer;
var
  i : integer;
begin
  if (trim(empno.Text) = '') or (trim(korname.Text) = '') then  KeySpace := 1
  else                                                          KeySpace := 0;
end;

//.............................키부분을 클릭했을 경우.........................
procedure TMainForm.KeyMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
     if Bsave.Caption = '저장' then KeyClick(Sender);
end;

procedure TMainForm.KeyClick(Sender: TObject);
var
     i : integer;
begin
     empno.SetFocus;
     NorEdit(CurY);
     CurY    := 1;
     CurRec  := 1;
     LastRec := 1;
     ClearDataField(1,5);
     for i := 1 to 50 do  DataClear(i);  //50개로 잡힌 배열을 초기화 한다..
     DisableEdit(0);
     Bsave.Glyph.LoadFromFile(HomeDir+'\pic\pbutt014.bmp');
     Bsave.Caption    := '실행';
     Binsert.Enabled  := False;
     Bdelete.Enabled  := False;
end;

//.............................사원번호를 더블클릭할 경우.......................
procedure TMainForm.empnoDblClick(Sender: TObject);
begin
     Helpdsr.Caption := '사원을 선택 하십시오..';
     FKeyEmpno := TFKeyEmpno.Create(Self);
     FKeyEmpno.Edempno.text := empno.Text;
     FKeyEmpno.ShowModal;
     empno.Text             := FKeyempno.v_KeyEmpno;
     korname.Text           := FKeyempno.v_KeyKorname;
end;

//......................키부분,데이타부분 키콘트롤..............................
procedure TMainForm.KeyTabControl(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
     sawon : string;
begin
     if  Key = vk_F1  then empnoDblClick(Sender);
     if (Key = vk_Return) or (Key = vk_Tab) then
     begin
          case TComponent(Sender).Tag of
               1 : begin
                   Sawon := 'key';
                   if trim(empno.Text) <> '' then
                   begin
                        if MasFind(empno.Text) > 0 then Sawon := 'yes' else Sawon := 'non';
                   end;
                   if Sawon = 'key' then korname.SetFocus;
                   if Sawon = 'yes' then
                   begin
                        C_RunSave := 1;
                        RunSaveClick;
                   end;
                   end;
               2 : empno.SetFocus;
          end; //case end
     end; //if end
end;

procedure TMainForm.DataTabControl(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
     i, TempRec : integer;
begin
     if Key = vk_F1 then
     begin
          if (TMaskEdit(Sender).HelpContext = 1) then examname1DblClick(Sender);
          if (TMaskEdit(Sender).HelpContext = 2) then CalenClick(Sender);
     end;
     if Key = vk_F5  then BinsertClick(Sender);
     if Key = vk_F7  then BdeleteClick(Sender);
     if Key = vk_F9  then KeyClick(Sender);
     if Key = vk_F12 then BsaveClick(Sender);

     if not(ssShift  in Shift) then
     begin
          if (Key = vk_Tab) or (Key = vk_Return) then
          begin
               DataSave;
               HelpDsr.Caption := '';
               case TCustomEdit(Sender).HelpContext of
                    1 : begin
                        if EnterKey <> 0 then
                        begin
                          DEdit.Capt1[CurY].Caption := QCodeDisp('SK10',DEdit.Data1[CurY].Text);
                          If (DEdit.Data1[CurY].Text = 'G011') Then
                          Begin
                            DEdit.Data2[CurY].Enabled := True;
                            DEdit.Data2[CurY].Setfocus;
                          End
                          Else
                          Begin
                            DEdit.Data2[CurY].Enabled := False;
                            DEdit.Data3[CurY].Setfocus;
                          End;
                        end;
                        EnterKey := 1;
                        end;
                    2 : begin
                        DEdit.Data3[CurY].Setfocus;
                        end;
                    3 : begin
                        if EnterKey <> 0 then
                        begin
                          DEdit.Capt2[CurY].Caption := QCodeDisp('I611',DEdit.Data3[CurY].Text);
                          DEdit.Data4[CurY].Setfocus;
                        end;
                        EnterKey := 1;
                        end;
                    4 : begin
                        DEdit.Data5[CurY].Setfocus;
                        end;
                    5 : begin
                        DEdit.Capt3[CurY].Caption := FormatFloat('##,##0',(DEdit.Data5[CurY].Value+
                                                                           DEdit.Data6[CurY].Value));
                        DEdit.Data6[CurY].Setfocus;
                        end;
                    6 : begin
                        DEdit.Capt3[CurY].Caption := FormatFloat('##,##0',(DEdit.Data5[CurY].Value+
                                                                           DEdit.Data6[CurY].Value));
                        DEdit.Data7[CurY].SetFocus;
                        end;
                    7 : DEdit.Data1[CurY].SetFocus;
               end; //case end
         end; //inner if end
     end //if end
     else
     begin
          if (Key = vk_Tab) or (Key = vk_Return) then
          begin
               DataSave;
               HelpDsr.Caption := '';
               case TCustomEdit(Sender).HelpContext of
                    1 : begin
                        if EnterKey <> 0 then
                        begin
                             DEdit.Capt1[CurY].Caption := QCodeDisp('SK10',DEdit.Data1[CurY].Text);
                          If (DEdit.Data1[CurY].Text = 'G011') Then
                          Begin
                            DEdit.Data2[CurY].Enabled := True;
                            DEdit.Data2[CurY].Setfocus;
                          End
                          Else
                          Begin
                            DEdit.Data2[CurY].Enabled := False;
                            DEdit.Data3[CurY].Setfocus;
                          End;
                        end;
                        EnterKey := 1;
                        end;
                    2 : begin
                        DEdit.Data1[CurY].Setfocus;
                        end;
                    3 : begin
                        if EnterKey <> 0 then
                        begin
                             DEdit.Capt2[CurY].Caption := QCodeDisp('I611',DEdit.Data3[CurY].Text);
                             DEdit.Data7[CurY].Setfocus;
                        end;
                        EnterKey := 1;
                        end;
                    4 : begin
                        DEdit.Data3[CurY].Setfocus;
                        end;
                    5 : begin
                        DEdit.Capt3[CurY].Caption := FormatFloat('##,##0',(DEdit.Data5[CurY].Value+
                                                                           DEdit.Data6[CurY].Value));
                        DEdit.Data3[CurY].Setfocus;
                        end;
                    6 : begin
                        DEdit.Capt3[CurY].Caption := FormatFloat('##,##0',(DEdit.Data5[CurY].Value+
                                                                           DEdit.Data6[CurY].Value));

                        DEdit.Data7[CurY].SetFocus;
                        end;
                    7 : DEdit.Data6[CurY].Setfocus;
               end; //case end
          end; //inner if end
     end; //else end

//......................다운키를 누를경우.....................................
     if Key = vk_Down then
     begin
          HelpDsr.Caption := '';
          DataSave;

          if CurRec < LastRec then
          begin
               if CurY <> 5 then
               begin
                    NorEdit(CurY);
                    inc(CurRec); //현재레코드 증가
                    inc(CurY);
                    RevEdit(CurY);
               end
               else
               begin
                    NorEdit(CurY);
                    inc(CurRec); //현재레코드 증가
                    for i := 1 to 5 do DispDataField(i,i+(CurRec-5));
                    RevEdit(CurY);
               end;
          end;
     GotoField(Sender,CurY);  //마우스로 찍은 x위치에 해당하는 열로 간다..
     end; //if end


     //업키를 누를경우
     if Key = vk_Up then
     begin
          HelpDsr.Caption := '';
          DataSave;

          if LastRec > 5 then  for i := 1 to 5 do EnableEdit(i);
          if CurRec <> 1 then  //데이타를 한칸씩 스크롤한다..
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
     GotoField(Sender,CurY);  //마우스로 찍은 x위치에 해당하는 열로 간다..
     end; //if end


      //페이지 다운키를 누를경우
     if Key = vk_Next then
     begin
          HelpDsr.Caption := '';
          if LastRec <= 5 then System.Exit;
          DataSave;

          NorEdit(CurY);

          for  i := 1 to 5 do EnableEdit(i);
          CurRec := CurRec + 5;
          if CurRec > LastRec then
          begin
               ClearDataField(1,5);
               CurRec := LastRec-4;
               CurY   := 1;
               for  i := 1 to 5 do DispDataField(i,CurRec+(i-1));
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
     DEdit.Data1[CurY].SetFocus;
     end; //if end


     //페이지 업키를 누를경우
     if Key = vk_Prior then
     begin
           HelpDsr.Caption := '';
           if LastRec <= 5 then System.Exit;
           DataSave;

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
           DEdit.Data1[CurY].SetFocus;
     end; //if end
end;

procedure TMainForm.RunKeyPress(Sender: TObject; var Key: Char);
begin
     Helpdsr.Caption := '';
     if Key = Chr(13) then
     begin
        Key := Chr(0);   //소리제거용
        if TComponent(Sender).Name = 'korname' then
        begin
             C_RunSave := 1; //성명에서 엔터키를 치면 실행키와 같은 처리를한다..
             if trim(empno.Text) = '' then
                if Masfind(korname.Text) > 1 then empnoDblClick(korname);
             EnterKey := 0;
             RunSaveClick;
        end;
     end;
end;

//......................마우스로 데이타부분을 클릭할경우........................
procedure TMainForm.DataCurYClick(Sender: TObject);
begin
     HelpDsr.Caption := '';
     DataSave;

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

//...........................추가버턴을 누를경우..............................
procedure TMainForm.BInsertClick(Sender: TObject);
var
     i : integer;
begin
     if LastRec >= 0 then Bdelete.Enabled := True;

     if LastRec >= 50  then
     begin
          Binsert.Enabled := False;
          System.Exit;
     end;

     DataSave;
     if CheckData(CurRec) = False  then
     begin
          DEdit.Data1[CurY].SetFocus;
          System.Exit;
     end;

      //현재 커서위치가 마지막 데이타에에 왔을 때 추가를 누를겨우의 처리
     if CurRec = LastRec then  //현재레코드와 전체레코드가 같으면 ?
     begin
          NorEdit(CurY);
          Inc(CurRec);
          if CurY = 5 then        //현재커서가 마지막커서위치인 5에 있을때
          begin
               if LastRec >= 5 then //이때 전채레코드가 5보다 크거나 같으면
               begin
                    CurY := 5;
                    if CurRec <= LastRec then   //현재레코드가 전체레코드보다 크거나 같으면
                    begin
                         for i := 1 to 5 do DispDataField(i,(CurRec-4)+(i-1));
                    end
                    else
                    begin
                         if CurRec <= 50 then    //현재레코드가 50보다 작거나 같을경우만 추가한다
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
               if CurY = (LastRec - (CurRec-1))+CurY then //현재CurY 위치와 마지막 데이타가 같으면
               begin                                      //하나의 레코드를 추가한다..
                    if CurRec <= 50 then                  //현재레코드가 50보다 작거나 같을경우만 추가한다
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
     DEdit.Data1[CurY].SetFocus;
     System.Exit;
     end; //CurRec = LastRec 마지막 레코드와 현재의 레코드가 같을때

    //레코드 중간에 데이타를 삽입할 경우
     for i := LastRec DownTo CurRec do
     begin
          DData.Data1[i+1] := DData.Data1[i];
          DData.Data2[i+1] := DData.Data2[i];
          DData.Data3[i+1] := DData.Data3[i];
          DData.Data4[i+1] := DData.Data4[i];
          DData.Data5[i+1] := DData.Data5[i];
          DData.Data6[i+1] := DData.Data6[i];
          DData.Data7[i+1] := DData.Data7[i];
          DData.Capt1[i+1] := DData.Capt1[i];
          DData.Capt2[i+1] := DData.Capt2[i];
          DData.Capt3[i+1] := DData.Capt3[i];
          DData.Capt4[i+1] := DData.Capt4[i];
     end;
     inc(LastRec);
     DataClear(CurRec);  //추가된 열의 데이타를 클리어 한다..

     for i := 1 to 5 do EnableEdit(i);
     if LastRec < 5 then  DisableEdit(LastRec);

     if LastRec < 5 then
     begin
          for i := CurY to LastRec do  DispDataField(i,CurRec+(i-CurY));
     end
     else
     begin
          for i := 1 to 5 do DispDataField(i,CurRec+(i-CurY));
     end;
     DEdit.Data1[CurY].SetFocus;
end;

//...........................삭제 버턴을 누를경우..............................
procedure TMainForm.BdeleteClick(Sender: TObject);
var
     i : integer;
begin
     if MessageBox(handle,'삭제하시겠습니까 ?..','확  인',MB_YESNO or $0020) = ID_NO then
     begin
               empno.SetFocus;
               System.Exit;
     end;

     for i := CurRec To LastRec do
     begin
          DData.Data1[i] := DData.Data1[i+1];
          DData.Data2[i] := DData.Data2[i+1];
          DData.Data3[i] := DData.Data3[i+1];
          DData.Data4[i] := DData.Data4[i+1];
          DData.Data5[i] := DData.Data5[i+1];
          DData.Data6[i] := DData.Data6[i+1];
          DData.Data7[i] := DData.Data7[i+1];
          DData.Capt1[i] := DData.Capt1[i+1];
          DData.Capt2[i] := DData.Capt2[i+1];
          DData.Capt3[i] := DData.Capt3[i+1];
          DData.Capt4[i] := DData.Capt4[i+1];
     end;

     if LastRec = 1 then DelYn := True else DelYn := False;
     if LastRec > 0 then dec(LastRec);       //전체 레코드 카운트를 하나 감소한다..

  // 현재레코드가 전체레코드보다 작으면 현재의 위치에 있는 데이타를 지우고
  // 현재의 커서에서 한칸위로 올라간다..
      if CurRec <= LastRec then
      begin
           for i := 1 to 5 do   EnableEdit(i);
           if  LastRec < 5 then DisableEdit(LastRec);

           if  LastRec < 5 then
           begin
                for i := 1 to LastRec do  DispDataField(i,(CurRec-(CurY-1))+(i-1));
                ClearDataField(LastRec+1,5);
           end
           else for i := 1 to 5 do  DispDataField(i,(CurRec-(CurY-1))+(i-1));
      end
      else
      begin
           for i := 1 to 5 do   EnableEdit(i);
           if  LastRec < 5 then DisableEdit(LastRec);

           if  LastRec < 5 then
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
      if LastRec >= 1 then DEdit.Data1[CurY].SetFocus
      else
      begin
           DataClear(1);  //추가된 데이타를 클리어한다
           LastRec := 1;
           CurY := 1;
           EnableEdit(CurY);
           DispDataField(1,1);
           DEdit.Data1[CurY].SetFocus;
      end;
      SaveData;
end;

//...........................실행,저장 버턴을 누를경우..........................
procedure TMainForm.BSaveClick(Sender: TObject);
begin
     if Bsave.Caption = '실행' then
     begin
          C_RunSave := 1;
          MasFind(empno.Text);
     end
     else C_RunSave := 0;

     RunSaveClick;
end;

//...........................검정일를 더블클릭할 경우............................
procedure TMainForm.CalenClick(Sender: TObject);
begin
      Calendar := TCalendar.Create(Self);
      try
         Calendar.ShowModal;
         if Calendar.DayCaption <> '' then
            TMaskEdit(Sender).Text := Calendar.DayCaption;
      finally
         Calendar.Free;
      end;
end;

//...............데이타 필드부분이 실행,저장이냐에 따라 해당부분 실행.............
procedure TMainForm.RunSaveClick;
var
     i  : integer;
     qq : TOraQuery;
begin
//실행키이면
     if C_RunSave = 1 then
     begin
          if KeySpace = 0 then
          begin
               Helpdsr.Caption  := '해당 사원의 외국어 사항을 찾는중입니다..';
               SendMessage(panel6.Handle,WM_PAINT,0,0);
               Bsave.Caption    := '저장';
               Bsave.Glyph.LoadFromFile(HomeDir+'\pic\pbutt010.bmp');
               Binsert.Enabled  := True;
               Bdelete.Enabled  := True;
               MasFind(empno.Text);

               qq := TOraQuery.Create(nil);
               qq.Session := Ora_Session;

               Application.ProcessMessages;

               try
                  with qq do
                  begin
                       Close;
                       SQL.Clear;
                       SQL.Add(' select * from pihfore                      ');
                       SQL.Add('  where empno = :lempno                     ');
                       SQL.Add('  order by examdate                         ');
                       ParamByName('Lempno').AsString := empno.Text;
                       Open;
                       LastRec := RecordCount;
                       i := 1;

                       While not(Eof) do
                       begin
                            DData.Data1[i] := FieldByName('LangCd').AsString;
                            DData.Data2[i] := FieldByName('langName').AsString;
                            DData.Data3[i] := FieldByName('examname').AsString;
                            DData.Data4[i] := FieldByName('examdate').AsString;
                            DData.Data5[i] := FieldByName('examscore1').AsFloat;
                            DData.Data6[i] := FieldByName('examscore2').AsFloat;
                            DData.Data7[i] := FieldByName('examplace').AsString;

                            DData.Capt1[i] := QCodeDisp('SK10',DData.Data1[i]);
                            DData.Capt2[i] := QCodeDisp('I611',DData.Data3[i]);
                            DData.Capt3[i] := FormatFloat('##,##0',FieldByName('examscore12').AsFloat);
                            DData.Capt4[i] := copy(FieldByName('examtodate').AsString,1,4)+'-'+
                                              copy(FieldByName('examtodate').AsString,5,2)+'-'+
                                              copy(FieldByName('examtodate').AsString,7,2);
                            Next;
                            inc(i);
                       end;
                  end;
               finally
                  qq.Free;
               end;

               if LastRec <= 0 then
               begin
                    DataClear(1); //추가된 데이타를 클리어한다
                    LastRec := 1;
               end;

               for  i := 1 to 5 do    EnableEdit(i);
               if   LastRec < 5 then  DisableEdit(LastRec);

               if   LastRec > 5 then
                    for  i := 1 to 5 do DispDataField(i,i)
               else for  i := 1 to LastRec do DispDataField(i,i);

               Helpdsr.Caption := '';
               CurY := 1;
               RevEdit(CurY);
               DEdit.Data1[CurY].SetFocus;
          end else empno.SetFocus;
     end
     else //저장이면
     begin
          if MessageBox(handle,'변경된 내용을 저장하시겠습니까 ?..','확  인',MB_YESNO or $0020) = ID_NO then
          begin
               ClearDataField(1,5);
               KeyClick(BSave);
               empno.SetFocus;
               System.Exit;
          end;
          SaveData;  //데이타 저장
     end; //else end

end;

//-----------------데이타를  저장한다...----------------------------------------
procedure TMainForm.SaveData;
var
     i         : integer;
     SaveCount : integer;
     tj_date   : array [1..2] of string[8];
     tj_score1 : array [1..2] of real;
     tj_score2 : array [1..2] of real;
     qq : TOraQuery;
begin
     DataSave;
     if DelYn = False then
        if CheckData(CurRec) = False then
        begin
           DEdit.Data1[CurY].SetFocus;
           system.Exit;
        end;

     DelYn := False;
     Helpdsr.Caption := '데이타 베이스와 연결중입니다..';
     SendMessage(Panel6.Handle,WM_PAINT,0,0);

     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     Application.ProcessMessages;

     try
        with qq do
        begin
              Close;
              SQL.Clear;
              SQL.Add(' select * from pihfore                      ');
              SQL.Add('  where empno = :lempno                     ');
              ParamByName('Lempno').AsString := empno.Text;
              Open;

              if RecordCount > 0 then
              begin
                   with qq do
                   begin   //데이타를 지운다..
                        Close;
                        SQL.Clear;
                        SQL.Add('delete from pihfore ');
                        SQL.Add('where (empno = :lempno)' );
                        ParambyName('lempno').AsString := empno.Text;
                        EXECSQL;
                   end;
              end; //if end

              SaveCount := 1;
              for i := 1 to LastRec do
              begin
                   Helpdsr.Caption := '데이타를 저장하고 있습니다..('+IntToStr(SaveCount)+'/'+IntTostr(LastRec)+')';
                   SendMessage(Panel6.Handle,WM_PAINT,0,0);

                   if LastRec = 1 then
                      if (trim(Ddata.Data1[1]+Ddata.Data2[1]+Ddata.Data3[1]+Ddata.Data4[1]+Ddata.Data7[1]) = '') and
                         ((DData.Data5[1]+DData.Data6[1]) = 0) then break;

                   with qq do
                   begin
                        Close;
                        SQL.Clear;
                        SQL.Add('insert into pihfore                          ');
                        SQL.Add('         (empno,                             ');
                        SQL.Add('          korname,                           ');
                        SQL.Add('          paycl,                             ');
                        SQL.Add('          LangCd,                            ');
                        SQL.Add('          LangName,                          ');
                        SQL.Add('          examname,                          ');
                        SQL.Add('          examdate,                          ');
                        SQL.Add('          examtodate,                        ');
                        SQL.Add('          examscore1,                        ');
                        SQL.Add('          examscore2,                        ');
                        SQL.Add('          examscore12,                       ');
                        SQL.Add('          examplace,                         ');
                        SQL.Add('          writeemp,                          ');
                        SQL.Add('          writetime)                         ');
                        SQL.Add('     values                                  ');
                        SQL.Add('          (:lempno,                          ');
                        SQL.Add('           :lkorname,                        ');
                        SQL.Add('           :lpaycl,                          ');
                        SQL.Add('           :lLangCd,                       ');
                        SQL.Add('           :lLangName,                       ');
                        SQL.Add('           :lexamname,                       ');
                        SQL.Add('           :lexamdate,                       ');
                        SQL.Add('           :lexamtodate,                     ');
                        SQL.Add('           :lexamscore1,                     ');
                        SQL.Add('           :lexamscore2,                     ');
                        SQL.Add('           :lexamscore12,                    ');
                        SQL.Add('           :lexamplace,                      ');
                        SQL.Add('           :lwriteemp,                       ');
                        SQL.Add('           :lwritetime)                      ');

                        ParambyName('lempno').AsString       := empno.Text;
                        ParambyName('lkorname').AsString     := korname.Text;
                        ParambyName('lpaycl').AsString       := Rpaycl;
                        ParambyName('lLangCd').AsString      := DData.Data1[i];
                        if (DData.Data1[i] = 'G011') Then
                          ParambyName('lLangName').AsString  := DData.Data2[i]
                        Else
                          ParambyName('lLangName').AsString  := '';
                        ParambyName('lexamname').AsString    := DData.Data3[i];
                        ParambyName('lexamdate').AsString    := DData.Data4[i];
                        ParambyName('lexamtodate').AsString  := removechar(DData.capt4[i],'-');
                        ParambyName('lexamscore1').AsFloat   := DData.Data5[i];
                        ParambyName('lexamscore2').AsFloat   := DData.Data6[i];
                        ParambyName('lexamscore12').AsFloat  := strtoint(DData.capt3[i]);
                        ParambyName('lexamplace').AsString   := DData.Data7[i];
                        ParambyName('lwritetime').AsString   := Fn_GetDateTimeStr;
                        ParambyName('lwriteemp').AsString    := Pempno;
                        EXECSQL;
                        inc(SaveCount);
                   end;
              end; //for end

             Helpdsr.Caption := '인사마스터를 수정하고 있습니다 !!..';
             SendMessage(Panel6.Handle,WM_PAINT,0,0);
             with qq do
             begin
                  Close;
                  SQL.Clear;
                  SQL.Add(' select  examdate,                              ');
                  SQL.Add('         examscore12                            ');
                  SQL.Add('   from  pihfore                                ');
                  SQL.Add('  where (empno = :lempno and examname = ''11'') ');   //TOEIC
                  SQL.Add('  order  by examdate desc                       ');
                  ParamByname('lempno').AsString := empno.Text;
                  Open;
                  tj_date[1]   := FieldByName('examdate').AsString;
                  tj_score1[1] := FieldByName('examscore12').AsFloat;
                  tj_score2[1] := 0;

                  Close;
                  SQL.Clear;
                  SQL.Add(' select  examdate,                              ');
                  SQL.Add('         examscore12                            ');
                  SQL.Add('   from  pihfore                                ');
                  SQL.Add('  where (empno = :lempno and examname = ''21'') ');   //JPT
                  SQL.Add('  order  by examdate desc                       ');
                  Open;
                  tj_date[2]   := FieldByName('examdate').AsString;
                  tj_score1[2] := FieldByName('examscore12').AsFloat;
                  tj_score2[2] := 0;

                  Close;
                  SQL.Clear;
                  SQL.Add(' update pimpmas set  toeicdate  = :t1,          ');
                  SQL.Add('                     toeicscore = :t2,          ');
                  SQL.Add('                     toeicfull  = :t3,          ');
                  Sql.Add('                     jptdate    = :j1,          ');
                  SQL.Add('                     jptscore   = :j2,          ');
                  SQL.Add('                     jptfull    = :j3           ');
                  SQL.Add('  where empno = :lempno                         ');
                  ParamByname('t1').AsString     := tj_date[1];
                  ParamByname('t2').AsFloat      := tj_score1[1];
                  ParamByname('t3').AsFloat      := tj_score2[1];
                  ParamByname('j1').AsString     := tj_date[2];
                  ParamByname('j2').AsFloat      := tj_score1[2];
                  ParamByname('j3').AsFloat      := tj_score2[2];
                  ParamByname('lempno').AsString := empno.Text;
                  EXECSQL;
             end;
        end;
     finally
        qq.Free;
     end;

     ClearDataField(1,5);
     KeyClick(BSave);
     empno.SetFocus;
     HelpDsr.Caption := '';
end;

procedure TMainForm.BcodeClick(Sender: TObject);
var
     str : string;
     qq  : TOraQuery;
begin
     qq  := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     if FreeCheck = False then
     begin
          Bcode.Caption := '해당코드 해제';
     end
     else
     begin
          Bcode.Caption := '해당코드 다운';
          FreeCheck     := False;
          system.exit;
     end;

     FreeCheck := DiskSpaceCheck;
     if FreeCheck = False then system.exit;

     HelpDsr.Caption := '해당코드를 다운받고 있습니다 !!.(속도증가를 위함)';
     SendMessage(panel6.handle,WM_PAINT,0,0);

     codeToText(HomeDir+'\pia9030a.cod','',0);
     try
        with qq do
        begin
             Close;
             SQL.Clear;
             SQL.add(' select  codeid,                        ');
             SQL.add('         codeno,                        ');
             SQL.add('         codename, chnname              ');
             SQL.add('   from  pyccode                        ');
             SQL.add('  where  codeid in (''I611'', ''SK10'') ');
             SQL.add('  order by codeid, codeno               ');
             Open;
             while not eof do
             begin
                  str := '';
                  str := FieldByName('codeid').AsString+','+
                         FieldByName('codeno').AsString+','+
                         FieldByName('codename').AsString;
                  codeToText('',str,1);
                  Next;
             end;
        end;
     finally
          qq.Free;
     end;
     codeToText('','',2);
     HelpDsr.Caption := '';
end;

procedure TMainForm.examname1DblClick(Sender: TObject);
var     qq  : TOraQuery;
begin
     FKeyCode := TFKeyCode.Create(Self);
     try
        case TMaskEdit(Sender).HelpContext of
             1 : begin
                 FKeyCode.FormData  := '외국어유형코드 열람';
                 FKeyCode.DataVal1  := 'SK10';
                 end;
             3 : begin
                 FKeyCode.FormData  := '시험유형코드 열람';
                 FKeyCode.DataVal1  := 'I611';
                 end;
        end;

        FKeyCode.ShowModal;
        case TMaskEdit(Sender).HelpContext of
             1 : begin
                   Dedit.Data1[CurY].Text    := FKeyCode.Code;
                   Dedit.Capt1[CurY].Caption := FKeyCode.CodeName;
                   If (DEdit.Data1[CurY].Text = 'G011') Then
                   Begin
                     DEdit.Data2[CurY].Color   := clYellow;
                     DEdit.Data2[CurY].Enabled := True;
                     DEdit.Data2[CurY].Setfocus;
                   End
                   Else
                   Begin
                     DEdit.Data2[CurY].Color   := clWhite;
                     DEdit.Data2[CurY].Enabled := False;
                     DEdit.Data3[CurY].Setfocus;
                   End;
                 end;
             3 : begin
                   Dedit.Data3[CurY].Text    := FKeyCode.Code;
                   Dedit.Capt2[CurY].Caption := FKeyCode.CodeName;

                   qq := TOraQuery.Create(nil);
                   qq.Session := Ora_Session;
                   Application.ProcessMessages;
                   try
                     with qq do
                     begin
                       Close;
                       SQL.Clear;
                       SQL.add(' select chnname from  pyccode ');
                       SQL.add('  where codeid = ''I611''     ');
                       SQL.add('    and codeno = :codeno      ');

                       ParamByname('codeno').AsString := Dedit.Data3[CurY].Text;
                       Open;
                       Dedit.Data7[CurY].Text := FieldByName('chnname').AsString;
                     end;
                   finally
                     qq.Free;
                   end;
                 end;
        end;
     finally
        FKeyCode.Free;
     end;
end;

procedure TMainForm.examscore21Exit(Sender: TObject);
begin
     DEdit.Capt3[CurY].Caption := FormatFloat('##,##0',(DEdit.Data5[CurY].Value+DEdit.Data6[CurY].Value));
end;

procedure TMainForm.examdate1Exit(Sender: TObject);
begin
    if length(DEdit.Data4[CurY].Text)  = 8  then
       begin
            DEdit.Capt4[CurY].Caption :=  DateCal1(inttostr(strtoint(copy(DEdit.Data4[CurY].text,1,4))+2) +
                                          copy(DEdit.Data4[CurY].text,5,2)+copy(DEdit.Data4[CurY].text,7,2));
            DEdit.Capt4[CurY].Caption :=  copy(DEdit.Capt4[CurY].Caption,1,4)+'-'+
                                          copy(DEdit.Capt4[CurY].Caption,5,2)+'-'+
                                          copy(DEdit.Capt4[CurY].Caption,7,2);
        end;
end;

procedure TMainForm.BExitClick(Sender: TObject);
begin
     Close;
end;

procedure TMainForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     codeToText(HomeDir+'\pia9030a.cod','',3);
end;

end.
