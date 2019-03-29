{header.
--------------------------------------------------------------------------------
PROGRAM-NAME    :  PIA1030A(인사전산등록표 등록)
SYSTEM-NAME     : 종합인사정보
SUBSYSTEM-NAME  : 인사
Programmer      : 전철호
Version         : 1.00
Date            : 1996.04.09
Update contents
  1.00   1996.04.09    전철호  신규프로그램개발   처리명세서
 30.01   2003.09.10    정규용  신메뉴로 인한 디렉토리변경(pass.pas) HomeDir변경
 30.02   2005.06.08    변춘미  임현수  우편번호Table 이용하여 주소입력하게 수정(본적,현주소)
--------------------------------------------------------------------------------
}
unit Pia1031a;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, ExtCtrls, StdCtrls, Mask, Buttons, DB, DBTables,iniFiles,timeftp,
  NumCtrl,datelib,Calen1,pass, numedit,codeText,JPEG,
  OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl, OnPopupEdit, MemDS,
  DBAccess, Ora, Func, KeyEmpno, KeyCode, //fempno,codelib,
  PDownLoad, Kylib1, Gauges, userhelp,registry, csReg, ComCtrls,OraSmart,
  OnScheme,KeyEmpnoB;

type
  Tpia1031aForm = class(TForm)
    Panel5: TPanel;
    Bsave: TBitBtn;
    Bcancel: TBitBtn;
    Bexit: TBitBtn;
    panel4: TPanel;
    chnname: TMaskEdit;
    engname: TMaskEdit;
    eldsonyn: TComboBox;
    marrigeyn: TComboBox;
    juminid: TMaskEdit;
    sex: TMaskEdit;
    holdname: TMaskEdit;
    holdrel: TMaskEdit;
    housetype: TMaskEdit;
    health: TMaskEdit;
    bohunyn: TComboBox;
    bornarea: TMaskEdit;
    regaddr: TMaskEdit;
    curaddr: TMaskEdit;
    offitel: TMaskEdit;
    religion: TMaskEdit;
    habit: TMaskEdit;
    ability: TMaskEdit;
    blood: TMaskEdit;
    armykind: TMaskEdit;
    armycl: TMaskEdit;
    armyfield: TMaskEdit;
    armyfrdate: TMaskEdit;
    armytodate: TMaskEdit;
    armydis: TMaskEdit;
    armyex: TMaskEdit;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel16: TPanel;
    Panel17: TPanel;
    Panel18: TPanel;
    Panel20: TPanel;
    Panel22: TPanel;
    Panel23: TPanel;
    Panel24: TPanel;
    Panel25: TPanel;
    Panel26: TPanel;
    Panel27: TPanel;
    Nhousetype: TPanel;
    Narmykind: TPanel;
    Narmyfield: TPanel;
    Narmydis: TPanel;
    Narmyex: TPanel;
    Narmycl: TPanel;
    Nsex: TPanel;
    Nholdrel: TPanel;
    Nhealth: TPanel;
    Nbornarea: TPanel;
    usaage: TPanel;
    Nreligion: TPanel;
    Panel40: TPanel;
    Panel41: TPanel;
    Panel42: TPanel;
    Panel43: TPanel;
    Panel44: TPanel;
    Panel45: TPanel;
    Panel46: TPanel;
    Panel49: TPanel;
    Panel50: TPanel;
    Panel51: TPanel;
    Panel52: TPanel;
    Panel53: TPanel;
    Panel54: TPanel;
    zipno: TMaskEdit;
    height: TNumberEdit;
    weight: TNumberEdit;
    Bcode: TBitBtn;
    Bn_zipno: TOnWinPopupEdit;
    bn_regzipno: TOnWinPopupEdit;
    Panel6: TPanel;
    retcont: TMaskEdit;
    Qemp1: TOraQuery;
    QCode: TOraQuery;
    Qphoto: TOraQuery;
    Qemp2: TOraQuery;
    OraQuery1: TOraQuery;
    Panel7: TPanel;
    birthday: TMaskEdit;
    birthgubun: TComboBox;
    BCardApp: TBitBtn;
    QCard: TOraQuery;
    weddingdate: TMaskEdit;
    Panel8: TPanel;
    E_mail: TMaskEdit;
    Panel9: TPanel;
    Panel10: TPanel;
    SKemail: TMaskEdit;
    Bn_curno: TOnWinPopupEdit;
    postno: TMaskEdit;
    Panel28: TPanel;
    hoguaddr: TMaskEdit;
    Panel29: TPanel;
    Nnation: TPanel;
    nation: TMaskEdit;
    Panel31: TPanel;
    Nregion: TPanel;
    region: TMaskEdit;
    Panel33: TPanel;
    Nnpeople: TPanel;
    npeople: TMaskEdit;
    Panel35: TPanel;
    telno: TMaskEdit;
    Panel36: TPanel;
    Panel37: TPanel;
    Ncurregion: TPanel;
    curregion: TMaskEdit;
    Panel30: TPanel;
    Ncurnation: TPanel;
    curnation: TMaskEdit;
    Panel34: TPanel;
    address: TMaskEdit;
    SF_Main: TOnSchemeForm;
    Panel3: TPanel;
    PersonPic: TImage;
    empno: TMaskEdit;
    korname: TMaskEdit;
    Bsel1: TPanel;
    Bsel2: TPanel;
    Bsel3: TPanel;
    Bsel4: TPanel;
    Bsel5: TPanel;
    Bsel6: TPanel;
    Bsel7: TPanel;
    Panel47: TPanel;
    Panel48: TPanel;
    Ncountry: TPanel;
    country: TMaskEdit;
    Panel21: TPanel;
    BB_export: TBitBtn;
    procedure BexitClick(Sender: TObject);
    procedure DataCurClick(Sender: TObject);
    procedure KeyFieldMove(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DataKeyMove(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RunKeyPress(Sender: TObject; var Key: Char);
    procedure empnoDblClick(Sender: TObject);
    procedure BsaveClick(Sender: TObject);
    procedure CalenClick(Sender: TObject);
    procedure CodeClick(Sender: TObject);
    procedure BselClick(Sender: TObject);
    procedure BcancelClick(Sender: TObject);
    procedure CodeHelp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure CalHelp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BcodeClick(Sender: TObject);
    procedure KeyMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Bn_zipnoCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure Bn_zipnoInitPopup(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bn_regzipnoCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure bn_regzipnoInitPopup(Sender: TObject);
    procedure curaddrExit(Sender: TObject);
    procedure regaddrExit(Sender: TObject);
    procedure BCardAppClick(Sender: TObject);
    procedure countryExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure zipnoKeyPress(Sender: TObject; var Key: Char);
    procedure postnoKeyPress(Sender: TObject; var Key: Char);
    procedure juminidExit(Sender: TObject);
    procedure BB_exportClick(Sender: TObject);
    procedure empnoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    Tmpregaddr, Tmpaddr, Tmpfullregaddr, Tmpfulladdr  : string;
    Tmpregaddrlen, Tmpaddrlen : integer;
    EnterKey  : Boolean;
    MsgKey    : Boolean;
    C_RunSave : integer;
    FreeCheck : Boolean;
    CodeError : string;
    HomeDir,bit1,bit2 : string;
    function  KeySpace : integer;
    function  QCodeDisp(s1,s2 : String) : String;
    function  DataCheck : Boolean;
    procedure RunSaveClick;
    procedure ClsEdits;
    procedure SaveData;
    procedure Qemp2Display;
    procedure sFocus(Sender : TObject);
    procedure KeyClick(Sender: TObject);
    procedure ageCal;
    procedure BloodCal;
    procedure empPicture;
    procedure QCard_NewfaceCheck;
    function  QCodeDisp1(s1,s2 : String) : String;

  public
    { Public declarations }
    Korage     : String;
    Tage       : String;
    pempno     : string;
    pkorname   : string;
    password   : string;
  end;

{콤포넌트 배열}
type
  TSEdit =  record
  Data : array[1..41] of TCustomEdit;  {입력필드 콤포넌트 배열}
  Comb : array[1..4]  of TComboBox;    {입력필드 콤포넌트 배열}
  Capt : array[1..18] of TPanel;       {코드 출력부분 배열}
end;

var
  pia1031aForm : Tpia1031aForm;
  FM_DownLoad  : TFM_DownLoad;
  DEdit : TSEdit;
  PBsel : Array[1..7] of TPanel;
  ErrorHelp: array[0..255] of char;
  JPEGImage : TJPEGImage;

implementation

uses pia1031a_2, PIA1031A_3;

{$R *.DFM}

{입력받은 데이타를 코드 화일에서 찾아서 해당 필드에 보여준다..}
function Tpia1031aForm.QCodeDisp(s1,s2 : String) : String;
var
  str : string;
begin
  if trim(s2) = '' then
  begin
    QcodeDisp := '';
    system.exit;
  end;
  if FreeCheck = False then
  begin
     QCode.Close;
     QCode.Parambyname('lcodeid').AsString := s1;
     QCode.Parambyname('lcodesub').AsString   := s2;
     QCode.Open;
     if trim(QCode.FieldByName('CodeName').AsString) = ''  then
        QcodeDisp := '코드에러'
     else QCodeDisp := Qcode.FieldByName('CodeName').AsString;
  end
  else
  begin
    str := TextCodeDisp(s1,s2,HomeDir+'\pia1030a.cod');
    if trim(str) = '' then QcodeDisp := '코드에러'
    else QcodeDisp := str;
  end;
end;


{키값의 공백을 체크한다..}
function Tpia1031aForm.KeySpace : integer;
var
  Check : integer;
begin
  Check := 0;
  if Length(empno.Text)   = 0 then inc(Check);
  if Length(korname.Text) = 0 then inc(Check);

  if Check <> 0 then KeySpace := Check
  else KeySpace := 0;
end;

{입력필드를 클리어한다..}
procedure Tpia1031aForm.ClsEdits;
var
  i : integer;
begin
 korname.Text := '';
 for i := 1  to 17 do TmaskEdit(Dedit.Data[i]).Text := '';
 for i := 20 to 41 do TmaskEdit(Dedit.Data[i]).Text := '';
 for i := 18 to 19 do TnumberEdit(Dedit.Data[i]).Value := 0;

 for i := 1 to 4  do Dedit.Comb[i].itemindex := -1;
 for i := 1 to 18 do Dedit.Capt[i].Caption := '';
 Korage := '00'; Tage := '00';
end;

//폼에 관한사항들...............................................................
procedure Tpia1031aForm.BexitClick(Sender: TObject);
begin
if MessageBox(handle,'종료하시겠습니까 ?','확 인',MB_YESNO or $0030) = ID_YES then begin
   Qemp2.Close;  close;
end;
end;

procedure Tpia1031aForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  iniFile : TiniFile;
begin
  codeToText(HomeDir+'\pia1030a.cod','',3);
  iniFile := TiniFile.Create(HomeDir+'\insa.ini');
  iniFile.WriteString('Insa','구분','off');
  iniFile.Destroy;
end;

// 키부분을 클릭했을 경우.......................................................
procedure Tpia1031aForm.KeyMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Bsave.Caption = '저장' then KeyClick(Sender);
end;

procedure Tpia1031aForm.KeyClick(Sender: TObject);
begin
  EnterKey          := False;
  PersonPic.picture := nil;
  BCardApp.Enabled  := False;
  ClsEdits;
  empno.SetFocus;
  Bsave.Caption     := '실행';
  Bsave.Glyph.LoadFromFile(HomeDir+'\pic\bt_run.bmp');
  Bcancel.Enabled   := False;
end;

// 데이타부분을 클릭했을 경우................................................... 
procedure Tpia1031aForm.DataCurClick(Sender: TObject);
begin
  if Bsave.Caption = '실행' then
  begin
     C_RunSave := 1;
     RunSaveClick;
  end;
end;

{---------------------키 필드부분을 이동할때-----------------------------}
procedure Tpia1031aForm.KeyFieldMove(Sender: TObject; var Key: Word;
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
	      if empno.Text <> '' then begin
		 Qemp1.Close;
		 Qemp1.ParamByName('Lempno').AsString := empno.Text;
		 Qemp1.Open;
                 if Qemp1.RecordCount > 0 then Sawon := 'yes' else Sawon := 'non';
		 korname.Text := Qemp1.FieldByName('KORNAME').AsString;
                 Qemp1.Close;
	      end;
              if Sawon = 'key' then korname.SetFocus;
              if Sawon = 'yes' then begin
                 C_RunSave := 1;
                 RunSaveClick;
              end;
	    end;
	2 : begin
	      empno.SetFocus;
	    end;
      end; {case end}
   end; {if end}
end;

//나이,혈액형ㄹ루틴.............................................................
procedure Tpia1031aForm.bloodCal;
var
  str     : string;
  i,check : integer;
begin
 check := 0;
 str   := blood.Text;
 if trim(str) = '' then system.exit;
 for i := 1 to length(str) do
     if (str[i] = '+') or (str[i] = '-') then inc(check);
 if check > 0 then blood.Text := str else blood.Text := str+'+';
end;

procedure Tpia1031aForm.ageCal;
var
  nGubun:integer;
begin
    Korage := '00';          Tage   := '00';
    if Length(trim(juminid.Text)) > 7 then begin
     {/ ===============================================================================
        Version  date(yy.mm.dd)  programmer  description        relevant doc.no
   	30.00     1999.02.25     유미나     Y2K(주민번호관련)   하나로인사재개발
	=============================================================================== /}
      nGubun := StrToInt(Copy(juminid.Text,8,1));
      case nGubun of
        1,2 : begin
            Tage := DateCal('19'+Copy(juminid.Text,1,6),
                             copy(fn_GetDateStr,1,4)+copy(fn_GetDateStr,6,2)+copy(fn_GetDateStr,9,2) );
            Korage := IntToStr((StrToInt(copy(fn_GetDateStr,1,4))+1)-
                               StrToint('19'+Copy(juminid.Text,1,2)));
          end;
        else  begin
            Tage := DateCal(Copy(fn_GetDateStr,1,2)+Copy(juminid.Text,1,6),
                             copy(fn_GetDateStr,1,4)+copy(fn_GetDateStr,6,2)+copy(fn_GetDateStr,9,2) );
            Korage := IntToStr((StrToInt(copy(fn_GetDateStr,1,4))+1)-
                               StrToint(Copy(fn_GetDateStr,1,2)+Copy(juminid.Text,1,2)));
          end;
      end;  // end case
    end;  // end if
    if copy(Tage,1,2) = '00' then Dedit.Capt[1].Caption := '00 세'
    else  Dedit.Capt[1].Caption := copy(Tage,1,2)+' 세';
end;

// F1키에 해당하는 폼 도움말을 띄운다..-----------------------------------------
procedure Tpia1031aForm.CodeHelp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_F1  then codeClick(Sender);
end;

procedure Tpia1031aForm.CalHelp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_F1  then calenClick(Sender);
end;

//데이타 부분 케크..............................................................
function Tpia1031aForm.DataCheck : Boolean;
begin
  DataCheck := True;
  Bloodcal;
  ageCal;
  if (QCodeDisp('I039',Dedit.Data[4].Text)) = '코드에러' then begin
      MessageBox(Handle,'성별 필드에러입니다 !!.','경  고',$0010);
      sex.SetFocus; DataCheck := False; System.Exit;
  end;
  if (QCodeDisp('I211',Dedit.Data[6].Text)) = '코드에러' then begin
      MessageBox(Handle,'호주관계 필드에러입니다 !!.','경  고',$0010);
      holdrel.SetFocus; DataCheck := False; System.Exit;
  end;
  if (QCodeDisp('I021',Dedit.Data[7].Text)) = '코드에러' then begin
      MessageBox(Handle,'주거형태 필드에러입니다 !!.','경  고',$0010);
      holdrel.SetFocus; DataCheck := False; System.Exit;
  end;
  if (QCodeDisp('I502',Dedit.Data[8].Text)) = '코드에러' then begin
      MessageBox(Handle,'건상상태 필드에러입니다 !!.','경  고',$0010);
      health.SetFocus; DataCheck := False; System.Exit;
  end;
  if (QCodeDisp('I001',Dedit.Data[9].Text)) = '코드에러' then begin
      MessageBox(Handle,'출생지 필드에러입니다 !!.','경  고',$0010);
      bornarea.SetFocus; DataCheck := False; System.Exit;
  end;
  if (QCodeDisp('I002',Dedit.Data[14].Text)) = '코드에러' then begin
      MessageBox(Handle,'종교 필드에러입니다 !!.','경  고',$0010);
      religion.SetFocus; DataCheck := False; System.Exit;
  end;
  if (QCodeDisp('I031',Dedit.Data[20].Text)) = '코드에러' then begin
      MessageBox(Handle,'군별 필드에러입니다 !!.','경  고',$0010);
      armykind.SetFocus; DataCheck := False; System.Exit;
  end;
  if (QCodeDisp('I034',Dedit.Data[21].Text)) = '코드에러' then begin
      MessageBox(Handle,'계급 필드에러입니다 !!.','경  고',$0010);
      armycl.SetFocus; DataCheck := False; System.Exit;
  end;
  if (QCodeDisp('I035',Dedit.Data[22].Text)) = '코드에러' then begin
      MessageBox(Handle,'병과 필드에러입니다 !!.','경  고',$0010);
      armyfield.SetFocus; DataCheck := False; System.Exit;
  end;
  if (QCodeDisp('I036',Dedit.Data[25].Text)) = '코드에러' then begin
      MessageBox(Handle,'제대구분 필드에러입니다 !!.','경  고',$0010);
      armydis.SetFocus; DataCheck := False; System.Exit;
  end;
  if (QCodeDisp('I037',Dedit.Data[26].Text)) = '코드에러' then begin
      MessageBox(Handle,'면제사유 필드에러입니다 !!.','경  고',$0010);
      armyex.SetFocus; DataCheck := False; System.Exit;
  end;
  if DateMaxMin(armyfrdate.Text,armytodate.Text) = False then begin
     MessageBox(Handle,'복무기간은 From <= To 조건에 맞아야 합니다...','경  고',$0010);
     armytodate.SetFocus;
     DataCheck := False; System.Exit;
  end;

  if (((QCodeDisp('SK03',Dedit.Data[32].Text)) = '코드에러')  or (Dedit.Data[32].Text = '' )) then begin
      MessageBox(Handle,'국적코드 필드에러입니다 !!.','경  고',$0010);
      armyex.SetFocus; DataCheck := False; System.Exit;
  end;

  If ((country.Text = 'CN') or (country.Text = 'US')) Then
  Begin
    if (((QCodeDisp('SK05',Dedit.Data[33].Text)) = '코드에러') or (Dedit.Data[33].Text = '')) then begin
        MessageBox(Handle,'민족/인종코드 필드에러입니다 !!.','경  고',$0010);
        armyex.SetFocus; DataCheck := False; System.Exit;
    end;
  End;

  If (country.Text = 'CN') Then
  Begin
    if hoguaddr.Text = '' Then
    Begin
      MessageBox(Handle,'호구소재지를 입력하시기 바랍니다.','경  고',$0010);
      armyex.SetFocus; DataCheck := False; System.Exit;
    End;
  End
  Else
  Begin
    if address.Text = '' Then
    Begin
      MessageBox(Handle,'주민등록지를 입력하시기 바랍니다.','경  고',$0010);
      armyex.SetFocus; DataCheck := False; System.Exit;
    End;
  End;

  if curaddr.Text = '' Then
  Begin
    MessageBox(Handle,'실거주지를 입력하시기 바랍니다.','경  고',$0010);
    armyex.SetFocus; DataCheck := False; System.Exit;
  End;

  if (((QCodeDisp('SK03',Dedit.Data[34].Text)) = '코드에러') or (Dedit.Data[34].Text = '')) then begin
      MessageBox(Handle,'주민등록지/호구소재지 국가코드 필드에러입니다 !!.','경  고',$0010);
      armyex.SetFocus; DataCheck := False; System.Exit;
  end;
  if (((QCodeDisp('SK04',Dedit.Data[35].Text)) = '코드에러') or (Dedit.Data[35].Text = '')) then begin
      MessageBox(Handle,'주민등록지/호구소재지 지역코드 필드에러입니다 !!.','경  고',$0010);
      armyex.SetFocus; DataCheck := False; System.Exit;
  end;
  if (((QCodeDisp('SK03',Dedit.Data[38].Text)) = '코드에러') or (Dedit.Data[38].Text = '')) then begin
      MessageBox(Handle,'실거주지 국가코드 필드에러입니다 !!.','경  고',$0010);
      armyex.SetFocus; DataCheck := False; System.Exit;
  end;
  if (((QCodeDisp('SK04',Dedit.Data[39].Text)) = '코드에러') or (Dedit.Data[39].Text = '')) then begin
      MessageBox(Handle,'실거주지 지역코드 필드에러입니다 !!.','경  고',$0010);
      armyex.SetFocus; DataCheck := False; System.Exit;
  end;

end;

procedure Tpia1031aForm.sFocus(Sender : TObject);
begin
  MsgKey := False;
  if CodeError = '코드에러' then begin
    MessageBox(handle,'코드입력 오류발생 !!.','에  러',MB_OK or $0010);
    MsgKey := True;
    system.exit;
  end;
  TcustomEdit(Sender).SetFocus;
end;

procedure Tpia1031aForm.DataKeyMove(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
codeError := '';
if (MsgKey = True) and (Key = vk_Return) then begin
    MsgKey := False; system.Exit;
end;
if Key = vk_F9  then DataCurClick(Sender);
if Key = vk_F12 then BsaveClick(Sender);
if not(ssShift  in Shift) then begin
  if (Key = vk_Tab) or (Key = vk_Return) then begin
    case TMaskEdit(Sender).Tag of
      1 : begin                   //한자성명
          if EnterKey = False then begin
             sFocus(Dedit.Data[2]);
          end;
          EnterKey := False;
          end;
      2 : sFocus(Dedit.Comb[1]);  //영문성명
      3 : sFocus(Dedit.Comb[2]);  //장남여부
      4 : sFocus(Dedit.Data[3]);
      5 : begin
            ageCal;
            sFocus(Dedit.Data[4]);
          end;
      6 : begin
            Dedit.Capt[2].Caption := QCodeDisp('I039',Dedit.Data[4].Text);
            sFocus(Dedit.Data[5]);
          end;
      7 : sFocus(Dedit.Data[6]);
      8 : begin
            Dedit.Capt[3].Caption := QCodeDisp('I211',Dedit.Data[6].Text);
            sFocus(Dedit.Data[7]);
          end;
      9 : begin
            Dedit.Capt[4].Caption := QCodeDisp('I021',Dedit.Data[7].Text);
            sFocus(Dedit.Data[8]);
          end;
      10: begin
            Dedit.Capt[5].Caption := QCodeDisp('I502',Dedit.Data[8].Text);
            sFocus(Dedit.Comb[3]);
          end;
      11: sFocus(Dedit.Data[9]);
      12: begin
            Dedit.Capt[6].Caption := QCodeDisp('I001',Dedit.Data[9].Text);
            sFocus(Dedit.Data[10]);
          end;
      13: sFocus(Dedit.Data[12]);
      14: begin
            Dedit.Capt[17].Caption := QCodeDisp('SK03',Dedit.Data[38].Text);
            sFocus(Dedit.Data[39]);
          end;
      15: begin
            Dedit.Capt[18].Caption := QCodeDisp1(Dedit.Data[38].Text,Dedit.Data[39].Text);
            If (country.Text = 'CN') Then sFocus(Dedit.Data[41])
            Else                          sFocus(Dedit.Data[36]);
          end;
      16: sFocus(Dedit.Data[11]);
      17: sFocus(Dedit.Data[38]);
      18: begin
            Dedit.Capt[15].Caption := QCodeDisp('SK03',Dedit.Data[34].Text);
            sFocus(Dedit.Data[35]);
          end;
      19: begin
            Dedit.Capt[16].Caption := QCodeDisp1(Dedit.Data[34].Text,Dedit.Data[35].Text);
            If (country.Text = 'CN') Then sFocus(Dedit.Data[41])
            Else                          sFocus(Dedit.Data[40]);
          End;
      20: sFocus(Dedit.Data[37]);
      21: sFocus(Dedit.Data[34]);
      22: sFocus(Dedit.Data[40]);
      23: Begin
            If ((country.Text = 'CN') or (country.Text = 'US'))Then sFocus(Dedit.Data[33])
            Else                                                    sFocus(Dedit.Data[13]);
          End;
      24: begin
            Dedit.Capt[14].Caption := QCodeDisp('SK05',Dedit.Data[33].Text);
            sFocus(Dedit.Data[13]);
          end;
      25: sFocus(Dedit.Data[27]);
      26: sFocus(Dedit.Data[30]);
      27: sFocus(Dedit.Data[31]);
      28: sFocus(Dedit.Data[14]);
      29: begin
            Dedit.Capt[7].Caption := QCodeDisp('I002',Dedit.Data[14].Text);
            sFocus(Dedit.Data[15]);
          end;
      30: sFocus(Dedit.Data[16]);
      31: sFocus(Dedit.Data[17]);
      32: sFocus(Dedit.Data[18]);
      33: sFocus(Dedit.Data[19]);
      34: sFocus(Dedit.Data[28]);
      35: sFocus(Dedit.Comb[4]);
      36: sFocus(Dedit.Data[29]);
      37: sFocus(Dedit.Data[20]);

      38: begin
            Dedit.Capt[8].Caption := QCodeDisp('I031',Dedit.Data[20].Text);
            sFocus(Dedit.Data[21]);
          end;
      39: begin
            Dedit.Capt[9].Caption := QCodeDisp('I034',Dedit.Data[21].Text);
            sFocus(Dedit.Data[22]);
          end;
      40: begin
            Dedit.Capt[10].Caption := QCodeDisp('I035',Dedit.Data[22].Text);
            sFocus(Dedit.Data[23]);
          end;
      41: sFocus(Dedit.Data[25]);
      42: begin
            Dedit.Capt[11].Caption := QCodeDisp('I036',Dedit.Data[25].Text);
            sFocus(Dedit.Data[24]);
          end;
      43: sFocus(Dedit.Data[26]);
      44: begin
            Dedit.Capt[12].Caption := QCodeDisp('I037',Dedit.Data[26].Text);
            sFocus(Dedit.Data[1]);
          end;
      45: begin
            Dedit.Capt[13].Caption := QCodeDisp('SK03',Dedit.Data[32].Text);
            sFocus(Dedit.Data[1]);
          end;
    end; {case end}
  end; {inner if end}
end else begin {if end}
  if (Key = vk_Tab) or (Key = vk_Return) then begin
    case TMaskEdit(Sender).Tag of
      1 : sFocus(Dedit.Data[26]);
      2 : sFocus(Dedit.Data[1]);
      3 : sFocus(Dedit.Data[2]);
      4 : sFocus(Dedit.Comb[1]);
      5 : begin
          ageCal;
          sFocus(Dedit.Data[4]);
          end;
      6 : begin
            Dedit.Capt[2].Caption := QCodeDisp('I039',Dedit.Data[4].Text);
            sFocus(Dedit.Data[5]);
          end;
      7 : sFocus(Dedit.Data[6]);
      8 : begin
            Dedit.Capt[3].Caption := QCodeDisp('I211',Dedit.Data[6].Text);
            sFocus(Dedit.Data[7]);
          end;
      9 : begin
            Dedit.Capt[4].Caption := QCodeDisp('I021',Dedit.Data[7].Text);
            sFocus(Dedit.Data[8]);
          end;
      10: begin
            Dedit.Capt[5].Caption := QCodeDisp('I502',Dedit.Data[8].Text);
            sFocus(Dedit.Comb[3]);
          end;
      11: sFocus(Dedit.Data[9]);
      12: begin
            Dedit.Capt[6].Caption := QCodeDisp('I001',Dedit.Data[9].Text);
            sFocus(Dedit.Data[10]);
          end;
      13: sFocus(Dedit.Data[12]);
      14: begin
            Dedit.Capt[17].Caption := QCodeDisp('SK03',Dedit.Data[38].Text);
            sFocus(Dedit.Data[39]);
          end;
      15: begin
            Dedit.Capt[18].Caption := QCodeDisp1(Dedit.Data[38].Text,Dedit.Data[39].Text);
            sFocus(Dedit.Data[36]);
          end;
      16: sFocus(Dedit.Data[11]);
      17: sFocus(Dedit.Data[38]);
      18: begin
            Dedit.Capt[15].Caption := QCodeDisp('SK03',Dedit.Data[34].Text);
            sFocus(Dedit.Data[35]);
          end;
      19: begin
            Dedit.Capt[16].Caption := QCodeDisp1(Dedit.Data[34].Text,Dedit.Data[35].Text);
            If (country.Text = 'CN') Then sFocus(Dedit.Data[41])
            Else                          sFocus(Dedit.Data[40]);
          End;
      20: sFocus(Dedit.Data[37]);
      21: sFocus(Dedit.Data[34]);
      22: sFocus(Dedit.Data[40]);
      23: Begin
            If ((country.Text = 'CN') or (country.Text = 'US'))Then sFocus(Dedit.Data[33])
            Else                                                    sFocus(Dedit.Data[13]);
          End;
      24: begin
            Dedit.Capt[14].Caption := QCodeDisp('SK05',Dedit.Data[33].Text);
            sFocus(Dedit.Data[13]);
          end;
      25: sFocus(Dedit.Data[27]);
      26: sFocus(Dedit.Data[30]);
      27: sFocus(Dedit.Data[31]);
      28: sFocus(Dedit.Data[14]);
      29: begin
            Dedit.Capt[7].Caption := QCodeDisp('I002',Dedit.Data[14].Text);
            sFocus(Dedit.Data[15]);
          end;
      30: sFocus(Dedit.Data[16]);
      31: sFocus(Dedit.Data[17]);
      32: sFocus(Dedit.Data[18]);
      33: sFocus(Dedit.Data[19]);
      34: sFocus(Dedit.Data[28]);
      35: sFocus(Dedit.Comb[4]);
      36: sFocus(Dedit.Data[29]);
      37: sFocus(Dedit.Data[20]);

      38: begin
            Dedit.Capt[8].Caption := QCodeDisp('I031',Dedit.Data[20].Text);
            sFocus(Dedit.Data[21]);
          end;
      39: begin
            Dedit.Capt[9].Caption := QCodeDisp('I034',Dedit.Data[21].Text);
            sFocus(Dedit.Data[22]);
          end;
      40: begin
            Dedit.Capt[10].Caption := QCodeDisp('I035',Dedit.Data[22].Text);
            sFocus(Dedit.Data[23]);
          end;
      41: sFocus(Dedit.Data[25]);
      42: begin
            Dedit.Capt[11].Caption := QCodeDisp('I036',Dedit.Data[25].Text);
            sFocus(Dedit.Data[24]);
          end;
      43: sFocus(Dedit.Data[26]);
      44: begin
            Dedit.Capt[12].Caption := QCodeDisp('I037',Dedit.Data[26].Text);
            sFocus(Dedit.Data[1]);
          end;
      45: begin
            Dedit.Capt[13].Caption := QCodeDisp('SK03',Dedit.Data[32].Text);
            sFocus(Dedit.Data[1]);
          end;
    end; {case end}
  end; {inner if end}
end; {else end}

end;

{키필드 부분에서 엔터키를 누를경우..}
procedure Tpia1031aForm.RunKeyPress(Sender: TObject; var Key: Char);
begin

 if Key = Chr(13) then
  begin
     Key := Chr(0);   {소리제겅용}
     if TComponent(Sender).Name = 'korname' then
     begin
     {성명에서 엔터키를 치면 실행키와 같은 처리를한다..}
       C_RunSave := 1;
       if trim(empno.Text) = '' then begin
          Qemp1.Close;
          Qemp1.ParamByName('Lempno').AsString := Korname.Text;
          Qemp1.Open;
          empno.Text := Qemp1.FieldByName('EMPNO').AsString;
          if Qemp1.RecordCount > 1 then  empnoDblClick(korname);
          Qemp1.Close;
        end;
       EnterKey := True;
       RunSaveClick;
     end;
 end;
end;

{사원번호를 더블클릭할 경우}
procedure Tpia1031aForm.empnoDblClick(Sender: TObject);
begin
{  empForm := TempForm.Create(self);
  Try
  if TMaskEdit(Sender).Tag = 1 then
  begin
    empForm.DataVal1 := empno.Text;
  end  else
  begin
    empForm.DataVal2 := korname.Text;
  end;
  empForm.ShowModal;
  if empForm.code <> '' then begin
     empno.Text   := empForm.Code;
     korname.Text := empForm.CodeName;
  end;
  Finally
  empForm.Free;
  End; }

//20180703 신범주 주석처리
{
  FKeyEmpno := TFKeyEmpno.Create(Self);
  try
    //if   TMaskEdit(Sender).Tag = 1 then FKeyEmpno.EdEmpno.Text := empno.Text
    //else                                FKeyEmpno.EdEmpno.Text := korname.Text;
    FKeyEmpno.EdEmpno.Text := empno.Text;
    if korname.Text <> '' then
      FKeyEmpno.EdEmpno.Text := korname.Text;
    FKeyEmpno.v_Table_Name := 'pimpmas';
    FKeyEmpno.ShowModal;

    if FKeyEmpno.CloseChk = -1 then Exit;

    empno.Text   := FKeyEmpno.v_KeyEmpno;
    korname.Text := FKeyEmpno.v_KeyKorname;
  finally
       FKeyEmpno.Free;
  end;
 }

    //20180703 신범주 추가
    FKeyEmpnoB := TFKeyEmpnoB.Create(self);

    Try

         FKeyEmpnoB.EdEmpno.Text := empno.Text;

         FKeyEmpnoB.v_EmpGb    := 'A';   // 'M' 임원, 'Y' 파견직, 'Z' 일반직(임원 파견직 제외), 'A' 전체

         FKeyEmpnoB.v_CloseGb := False; // True 자동닫음, False 닫지않음 - 조회대상건이 1건일때 화면을 자동으로 Close 한다.

         FKeyEmpnoB.BBrun.OnClick(Sender);

         FKeyEmpnoB.ShowModal;

         if FKeyEmpnoB.CloseChk <> -1 then

         begin

              empno.TExt := FKeyEmpnoB.v_KeyEmpno;

              korname.Text := FKeyEmpnoB.v_KeyKorname;

         end;

    Finally

         FKeyEmpnoB.Free;

    end;
end;





{저장,실행 버턴을 누를경우 }
procedure Tpia1031aForm.BsaveClick(Sender: TObject);
begin
  if Bsave.Caption = '실행' then  C_RunSave := 1
  else C_RunSave := 0;
  RunSaveClick;
end;

{일자부분을 더블클릭 했을 경우 }
procedure Tpia1031aForm.CalenClick(Sender: TObject);
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

{코드부분을 클릭했을 경우 }
procedure Tpia1031aForm.CodeClick(Sender: TObject);
var
     qq : TOraQuery;
begin
  FKeyCode := TFKeyCode.Create(Self);
  Try
    case TComponent(Sender).Tag of
      6 : begin
	  FKeyCode.FormData := '성별코드 열람';
	  FKeyCode.DataVal1  := 'I039';
	  end;
      8 : begin
	  FKeyCode.FormData := '호주와의 관계코드 열람';
	  FKeyCode.DataVal1  := 'I211';
	  end;
      9 : begin
	  FKeyCode.FormData := '주거형태 코드 열람';
	  FKeyCode.DataVal1  := 'I021';
	  end;
     10 : begin
	  FKeyCode.FormData := '건강상태코드 열람';
	  FKeyCode.DataVal1  := 'I502';
	  end;
     12 : begin
	  FKeyCode.FormData := '출생지코드 열람';
	  FKeyCode.DataVal1  := 'I001';
	  end;
     14 : begin
	  FKeyCode.FormData := '실거주지국가 열람';
	  FKeyCode.DataVal1  := 'SK03';
	  end;
     15 : begin
	  FKeyCode.FormData := '실거주지지역 열람';
	  FKeyCode.DataVal1  := 'SK04';
	  end;
     18 : begin
	  FKeyCode.FormData := '주민등록지/호구소재지 국가 열람';
	  FKeyCode.DataVal1  := 'SK03';
	  end;
     19 : begin
	  FKeyCode.FormData := '주민등록지/호구소재지 지역 열람';
	  FKeyCode.DataVal1  := 'SK04';
	  end;
     24 : begin
	  FKeyCode.FormData := '민족/인종 열람';
	  FKeyCode.DataVal1  := 'SK05';
	  end;
     29 : begin
	  FKeyCode.FormData := '종교코드 열람';
	  FKeyCode.DataVal1  := 'I002';
	  end;
     38 : begin
	  FKeyCode.FormData := '군별코드 열람';
	  FKeyCode.DataVal1  := 'I031';
	  end;
     39 : begin
	  FKeyCode.FormData := '계급코드 열람';
	  FKeyCode.DataVal1  := 'I034';
	  end;
     40 : begin
	  FKeyCode.FormData := '병과/주특기 열람';
	  FKeyCode.DataVal1  := 'I035';
	  end;
     42 : begin
	  FKeyCode.FormData := '제대구분코드 열람';
	  FKeyCode.DataVal1  := 'I036';
	  end;
     44 : begin
	  FKeyCode.FormData := '미필사유코드 열람';
	  FKeyCode.DataVal1  := 'I037';
	  end;
     45 : begin
	  FKeyCode.FormData := '국적 열람';
	  FKeyCode.DataVal1  := 'SK03';
	  end;
    end;

    FKeyCode.ShowModal;

    if FKeyCode.code = '' then begin System.Exit; end;
    TMaskEdit(Sender).Text := FKeyCode.Code;
    case TComponent(Sender).Tag of
      6 : Dedit.Capt[2].Caption  := FKeyCode.CodeName;
      8 : Dedit.Capt[3].Caption  := FKeyCode.CodeName;
      9 : Dedit.Capt[4].Caption  := FKeyCode.CodeName;
     10 : Dedit.Capt[5].Caption  := FKeyCode.CodeName;
     12 : Dedit.Capt[6].Caption  := FKeyCode.CodeName;
     14 : Dedit.Capt[17].Caption := FKeyCode.CodeName;
     15 : Dedit.Capt[18].Caption := FKeyCode.CodeName;
     18 : Dedit.Capt[15].Caption := FKeyCode.CodeName;
     19 : Dedit.Capt[16].Caption := FKeyCode.CodeName;
     24 : Dedit.Capt[14].Caption := FKeyCode.CodeName;
     29 : Dedit.Capt[7].Caption  := FKeyCode.CodeName;
     38 : Dedit.Capt[8].Caption  := FKeyCode.CodeName;
     39 : Dedit.Capt[9].Caption  := FKeyCode.CodeName;
     40 : Dedit.Capt[10].Caption := FKeyCode.CodeName;
     42 : Dedit.Capt[11].Caption := FKeyCode.CodeName;
     44 : Dedit.Capt[12].Caption := FKeyCode.CodeName;
     45 : Dedit.Capt[13].Caption := FKeyCode.CodeName;
    end;

  Finally
    FKeyCode.Free;
  END;
end;

{------------------------------------------------------------------------------}
{저장,실행키를 누를경우 }
procedure Tpia1031aForm.RunSaveClick;
begin
  if C_RunSave = 1 then  {실행키를 누를경우 }
  begin
    empPicture;
    if KeySpace = 0 then
    begin
      Try
        Qemp2.Close;
        Qemp2.ParamByName('Lempno').AsString := empno.Text;
        Qemp2.Open;

        if Qemp2.recordCount <= 0 then
        begin
          empno.SetFocus;
          system.exit;
        end;
        Qemp2Display;
      EXCEPT ON E : EDataBaseError DO
        MessageBox(handle,StrPcopy(ErrorHelp,E.Message),'에  러',MB_OK or $0040);
      END;

      Bsave.Caption := '저장';
      Bsave.Glyph.LoadFromFile(HomeDir+'\pic\bt_save.bmp');
      Bcancel.Enabled  := True;
      Dedit.Data[1].SetFocus;
    end
    else
      empno.SetFocus;
  end
  else  {c_RunSave = 0}
  begin
    //dsa2000  2018.04.06       요청번호 SR-1804-0217
    if (Length(Trim(juminid.Text)) > 2 ) and (Length(Trim(juminid.Text)) < 14) then
    begin
         MessageDlg('주민번호 13자리를 채워주시기 바랍니다.'+#13+#13+
                    '부득이한 경우 성별에 따라 뒷자리를 "1111111" 또는 "2222222" 입력하고'+#13#13+
                    '추후 반드시 정상적인 주민번호로 변경 바랍니다',mtError,[mbOK],0);
         System.Exit;
    end;

    if MessageBox(handle,'변경된 내용을 저장하시겠습니까 ?..','확  인',MB_YESNO or $0020) = ID_NO then
    begin
      ClsEdits;
      KeyClick(Bsave);
      empno.SetFocus;
      System.Exit;
    end;

    if DataCheck = True then
    begin
      SaveData;
      ClsEdits;
      KeyClick(Bsave);
      empno.SetFocus;
    end;
  end; {else end}
end;

// 찾은 데이타를 보여준다..-----------------------------------------------------
procedure Tpia1031aForm.empPicture;
var
  stream    : TMemoryStream;
  JPEGImage : TJPEGImage;
begin
   Qphoto.close;
   Qphoto.ParamByName('lempno').AsString := empno.Text;
   Qphoto.Open;

   try
     stream    := TMemoryStream.Create;
     JPEGImage := TJPEGImage.Create;

     personPic.picture.Graphic := nil;

     TblobField(Qphoto.FieldByName('photo')).SaveToStream(stream);
     stream.Position := 0;

     JPEGImage.LoadFromStream(stream);
     if stream.Size <> 0 then
       personPic.picture.Assign(JPEGImage)
     else begin
      if FileExists(HomeDir+'\pic\사람1.bmp') = True then
         personPic.picture.LoadFromFile(HomeDir+'\pic\사람1.bmp');
     end;
     Qphoto.Close;
   finally
     stream.free;
     JPEGImage.Free;
   end;

{
   if trim(Qphoto.FieldByName('empno').AsString) <> '' then begin
      personPic.picture.Assign(Qphoto.FieldByName('photo'));
   end else begin
      if FileExists(HomeDir+'\pic\사람1.bmp') = True then
         personPic.picture.LoadFromFile(HomeDir+'\pic\사람1.bmp');
   end;
   }
end;

procedure Tpia1031aForm.QCard_NewfaceCheck;
begin
  with  QCard  do
  begin
    Close;
    Sql.Clear;
    Sql.Add('Select a.empno from pimpmas a, cimphot b                     ');
    Sql.Add(' where a.empno = b.empno                                     ');
    Sql.Add('   and a.lancode in (''111'',''131'')                        ');
    Sql.Add('   and a.pstate < ''80''                                     ');
    Sql.Add('   and a.writetime >=To_char(sysdate-14,''YYYYMMDD'')        ');
    Sql.Add('   and a.empno not in ( select empno from pzcardapp )        ');
    Sql.Add('   and a.empno = '''+Qemp2.FieldByName('EMPNO').AsString+''' ');
    Open;
    if  QCard.RecordCount < 1 then
        BCardApp.Enabled := False
    else
        BCardApp.Enabled := True;
  end;
end;

procedure Tpia1031aForm.Qemp2Display;
begin
  Tmpaddr            := '';       //30.02
  Tmpaddrlen         := 0 ;
  Tmpregaddr         := '';
  Tmpregaddrlen      := 0 ;

  QCard_NewfaceCheck;

  Korname.Text        := Qemp2.FieldByName('KORNAME').AsString;
  Dedit.Data[1].Text  := Qemp2.FieldByName('CHNNAME').AsString;
  Dedit.Data[2].Text  := Qemp2.FieldByName('ENGNAME').AsString;
  if Qemp2.FieldByName('ELDSONYN').AsString  = 'Y' then Dedit.Comb[1].ItemIndex := 0;
  if Qemp2.FieldByName('ELDSONYN').AsString  = 'N' then Dedit.Comb[1].ItemIndex := 1;
  if Qemp2.FieldByName('ELDSONYN').AsString  = ''  then Dedit.Comb[1].ItemIndex := 2;
  if Qemp2.FieldByName('MARRIGEYN').AsString = 'Y' then Dedit.Comb[2].ItemIndex := 0;
  if Qemp2.FieldByName('MARRIGEYN').AsString = 'N' then Dedit.Comb[2].ItemIndex := 1;
  if Qemp2.FieldByName('MARRIGEYN').AsString = ''  then Dedit.Comb[2].ItemIndex := 2;

  TmaskEdit(Dedit.Data[3]).Text  := Qemp2.FieldByName('JUMINID').AsString;
  Dedit.Data[4].Text  := Qemp2.FieldByName('SEX').AsString;
  Dedit.Data[5].Text  := Qemp2.FieldByName('HOLDNAME').AsString;
  Dedit.Data[6].Text  := Qemp2.FieldByName('HOLDREL').AsString;
  Dedit.Data[7].Text  := Qemp2.FieldByName('HOUSETYPE').AsString;
  Dedit.Data[8].Text  := Qemp2.FieldByName('HEALTH').AsString;

  if Qemp2.FieldByName('BOHUNYN').AsString = 'Y' then Dedit.Comb[3].ItemIndex := 0;
  if Qemp2.FieldByName('BOHUNYN').AsString = 'N' then Dedit.Comb[3].ItemIndex := 1;
  if Qemp2.FieldByName('BOHUNYN').AsString = ''  then Dedit.Comb[3].ItemIndex := 2;

  Dedit.Data[9].Text  := Qemp2.FieldByName('BORNAREA').AsString;
  Dedit.Data[10].Text := Qemp2.FieldByName('REGADDR').AsString;
  Dedit.Data[11].Text := Qemp2.FieldByName('CURADDR').AsString;

  Tmpfullregaddr := Qemp2.FieldByName('REGADDR').AsString;
  Tmpfulladdr    := Qemp2.FieldByName('CURADDR').AsString;

  TMaskEdit(Dedit.Data[12]).Text := Qemp2.FieldByName('ZIPNO').AsString;
  Dedit.Data[13].Text := Qemp2.FieldByName('TELNO').AsString;
  Dedit.Data[14].Text := Qemp2.FieldByName('RELIGION').AsString;
  Dedit.Data[15].Text := Qemp2.FieldByName('HABIT').AsString;
  Dedit.Data[16].Text := Qemp2.FieldByName('ABILITY').AsString;
  Dedit.Data[17].Text := Qemp2.FieldByName('BLOOD').AsString;
  TnumberEdit(Dedit.Data[18]).Value := Qemp2.FieldByName('HEIGHT').AsFloat;
  TnumberEdit(Dedit.Data[19]).Value := Qemp2.FieldByName('WEIGHT').AsFloat;
  Dedit.Data[20].Text := Qemp2.FieldByName('ARMYKIND').AsString;
  Dedit.Data[21].Text := Qemp2.FieldByName('ARMYCL').AsString;
  Dedit.Data[22].Text := Qemp2.FieldByName('ARMYFIELD').AsString;
  TMaskEdit(Dedit.Data[23]).Text := Qemp2.FieldByName('ARMYFRDATE').AsString;
  TmaskEdit(Dedit.Data[24]).Text := Qemp2.FieldByName('ARMYTODATE').AsString;
  Dedit.Data[25].Text := Qemp2.FieldByName('ARMYDIS').AsString;
  Dedit.Data[26].Text := Qemp2.FieldByName('ARMYEX').AsString;
  Korage              := FloatToStr(Qemp2.FieldByName('KORAGE').AsFloat);
  Dedit.Capt[1].Caption  := FormatFloat('#00',Qemp2.FieldByName('USAAGE').AsFloat)+' 세';
  Dedit.Capt[2].Caption  := QCodeDisp('I039',Qemp2.FieldByName('SEX').AsString);
  Dedit.Capt[3].Caption  := QCodeDisp('I211',Qemp2.FieldByName('HOLDREL').AsString);
  Dedit.Capt[4].Caption  := QCodeDisp('I021',Qemp2.FieldByName('HOUSETYPE').AsString);
  Dedit.Capt[5].Caption  := QCodeDisp('I502',Qemp2.FieldByName('HEALTH').AsString);
  Dedit.Capt[6].Caption  := QCodeDisp('I001',Qemp2.FieldByName('BORNAREA').AsString);
  Dedit.Capt[7].Caption  := QCodeDisp('I002',Qemp2.FieldByName('RELIGION').AsString);
  Dedit.Capt[8].Caption  := QCodeDisp('I031',Qemp2.FieldByName('ARMYKIND').AsString);
  Dedit.Capt[9].Caption  := QCodeDisp('I034',Qemp2.FieldByName('ARMYCL').AsString);
  Dedit.Capt[10].Caption := QCodeDisp('I035',Qemp2.FieldByName('ARMYFIELD').AsString);
  Dedit.Capt[11].Caption := QCodeDisp('I036',Qemp2.FieldByName('ARMYDIS').AsString);
  Dedit.Capt[12].Caption := QCodeDisp('I037',Qemp2.FieldByName('ARMYEX').AsString);
  Dedit.Capt[13].Caption := QCodeDisp('SK03',Qemp2.FieldByName('COUNTRY').AsString);
  Dedit.Capt[14].Caption := QCodeDisp('SK05',Qemp2.FieldByName('NPEOPLE').AsString);
  Dedit.Capt[15].Caption := QCodeDisp('SK03',Qemp2.FieldByName('NATION').AsString);
  Dedit.Capt[16].Caption := QCodeDisp1(Qemp2.FieldByName('NATION').AsString,Qemp2.FieldByName('REGION').AsString);
  Dedit.Capt[17].Caption := QCodeDisp('SK03',Qemp2.FieldByName('CURNATION').AsString);
  Dedit.Capt[18].Caption := QCodeDisp1(Qemp2.FieldByName('CURNATION').AsString,Qemp2.FieldByName('CURREGION').AsString);
  Dedit.Data[27].Text    := Qemp2.FieldByName('RETCONT').AsString;

  TMaskEdit(Dedit.Data[28]).Text    := Qemp2.FieldByName('BIRTHDAY').AsString;               //jissi
  if Qemp2.FieldByName('BIRTHGUBUN').AsString = '양력' then Dedit.Comb[4].ItemIndex := 0;
  if Qemp2.FieldByName('BIRTHGUBUN').AsString = '음력' then Dedit.Comb[4].ItemIndex := 1;
   TMaskEdit(Dedit.Data[29]).Text    := Qemp2.FieldByName('WEDDINGDATE').AsString;
  Dedit.Data[30].Text := Qemp2.FieldByName('E_MAIL').AsString;
  Dedit.Data[31].Text := Qemp2.FieldByName('SKEMAIL').AsString;
  Dedit.Data[32].Text := Qemp2.FieldByName('COUNTRY').AsString;
  Dedit.Data[33].Text := Qemp2.FieldByName('NPEOPLE').AsString;
  Dedit.Data[34].Text := Qemp2.FieldByName('NATION').AsString;
  Dedit.Data[35].Text := Qemp2.FieldByName('REGION').AsString;

  If (Dedit.Data[32].Text = 'CN') Then
  Begin
    Dedit.Data[36].Text := '';
    Dedit.Data[37].Text := '';
    Dedit.Data[41].Text := Qemp2.FieldByName('ADDRESS').AsString;
  End
  Else
  Begin
    Dedit.Data[36].Text := Qemp2.FieldByName('POSTNO').AsString;
    Dedit.Data[37].Text := Qemp2.FieldByName('ADDRESS').AsString;
    Dedit.Data[41].Text := '';
  End;
  Dedit.Data[38].Text := Qemp2.FieldByName('CURNATION').AsString;
  Dedit.Data[39].Text := Qemp2.FieldByName('CURREGION').AsString;
  
  Dedit.Data[40].Text := Qemp2.FieldByName('OFFITEL').AsString;

  countryExit(Self);
end;

{-----------------데이타를  저장한다...--------------------------------------}
procedure Tpia1031aForm.SaveData;
var
  SaveHelp : TImage;
begin
  {인사마스터에 데이타를 업데이트 한다..}
  SaveHelp := TImage.Create(TPanel(Panel4));
  SaveHelp.parent  := TPanel(Panel4);
  SaveHelp.Left    := 255;
  SaveHelp.Top     := 120;
  SaveHelp.Height  := 50;
  SaveHelp.Width   := 50;
  SaveHelp.Stretch := True;
  SaveHelp.Picture.LoadFromFile(bit1);
  SaveHelp.Show;
  SendMessage(Tpanel(Panel4).Handle,WM_PAINT,0,0);

  TRY
  With OraQuery1 do
  begin
    close;  Sql.Clear;
    Sql.Add('UPDATE PIMPMAS                                            ');
    Sql.Add('   SET CHNNAME   = :L1,                                   ');
    Sql.Add('       ENGNAME   = :L2,                                   ');
    Sql.Add('       ELDSONYN  = :L3,                                   ');
    Sql.Add('       MARRIGEYN = :L4,                                   ');
    Sql.Add('       JUMINID   = :L5,                                   ');
    Sql.Add('       KORAGE    = :L6,                                   ');
    Sql.Add('       USAAGE    = :L7,                                   ');
    Sql.Add('       SEX       = :L8,                                   ');
    Sql.Add('       E_MAIL    = :L9,                                   ');
  //  Sql.Add('       SKEMAIL   = :L10,                                  '); 2011.09.19 저장 안함.
    Sql.Add('       WRITEEMP  = '''+pempno+''',                        ');
    Sql.Add('       WRITETIME = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'')  ');
    Sql.Add(' WHERE (EMPNO = :Lempno)  ');
    ParamByName('L1').AsString      := TMaskEdit(Dedit.Data[1]).Text;
    ParamByName('L2').AsString      := TMaskEdit(Dedit.Data[2]).Text;
    ParamByName('L3').AsString      := Dedit.Comb[1].Text;
    ParamByName('L4').AsString      := Dedit.Comb[2].Text;
    if  (trim(TMaskEdit(Dedit.Data[3]).Text) = '-') or (trim(TMaskEdit(Dedit.Data[3]).Text) = '') then
         ParamByName('L5').AsString := ''
    else
         ParamByName('L5').AsString := TMaskEdit(Dedit.Data[3]).Text;
    ParamByName('L7').AsFloat       := StrToFloat(copy(Tage,1,2));
    ParamByName('L6').AsFloat       := StrToFloat(copy(Korage,1,2));
    ParamByName('L8').AsString      := TMaskEdit(Dedit.Data[4]).Text;
    ParamByName('L9').AsString      := TMaskEdit(Dedit.Data[30]).Text;
  //  ParamByName('L10').AsString     := TMaskEdit(Dedit.Data[31]).Text;
    ParamByName('Lempno').AsString  := empno.Text;
    EXECSQL;
    close;  Sql.Clear;
    Sql.Add('UPDATE PIMPMAS                                            ');
    Sql.Add('   SET HOLDNAME   = :L9,                                  ');
    Sql.Add('       HOLDREL    = :L10,                                 ');
    Sql.Add('       HOUSETYPE  = :L11,                                 ');
    Sql.Add('       HEALTH     = :L12,                                 ');
    Sql.Add('       BOHUNYN    = :L13,                                 ');
    Sql.Add('       BORNAREA   = :L14,                                 ');
    Sql.Add('       REGADDR    = :L15,                                 ');
    Sql.Add('       CURADDR    = :L16,                                 ');
    Sql.Add('       ZIPNO      = :L17,                                 ');
    Sql.Add('       TELNO      = :L18,                                 ');
    Sql.Add('       RELIGION   = :L19,                                 ');
    Sql.Add('       HABIT      = :L20,                                 ');
    Sql.Add('       RETCONT    = :L21,                                 ');
    Sql.Add('       BIRTHDAY   = :L22,                                 ');
    Sql.Add('       BIRTHGUBUN = :L23,                                 ');
    Sql.Add('       WEDDINGDATE= :L24,                                 ');
    Sql.Add('       WRITEEMP   = '''+pempno+''',                       ');
    Sql.Add('       WRITETIME  = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'') ');
    Sql.Add(' WHERE (EMPNO = :Lempno)   ');
    ParamByName('L9').AsString   := TMaskEdit(Dedit.Data[ 5]).Text;
    ParamByName('L10').AsString  := TMaskEdit(Dedit.Data[ 6]).Text;
    ParamByName('L11').AsString  := TMaskEdit(Dedit.Data[ 7]).Text;
    ParamByName('L12').AsString  := TMaskEdit(Dedit.Data[ 8]).Text;
    ParamByName('L13').AsString  := Dedit.Comb[3].Text;
    ParamByName('L14').AsString  := TMaskEdit(Dedit.Data[ 9]).Text;
    ParamByName('L15').AsString  := TMaskEdit(Dedit.Data[10]).Text;
    ParamByName('L16').AsString  := TMaskEdit(Dedit.Data[11]).Text;
    ParamByName('L17').AsString  := TMaskEdit(Dedit.Data[12]).Text;
    ParamByName('L18').AsString  := TMaskEdit(Dedit.Data[13]).Text;
    ParamByName('L19').AsString  := TMaskEdit(Dedit.Data[14]).Text;
    ParamByName('L20').AsString  := TMaskEdit(Dedit.Data[15]).Text;
    ParamByName('L21').AsString  := TMaskEdit(Dedit.Data[27]).Text;
    ParamByName('L22').AsString  := TMaskEdit(Dedit.Data[28]).Text; //jissi
    ParamByName('L23').AsString  := Dedit.Comb[4].Text;;
    ParamByName('L24').AsString  := TMaskEdit(Dedit.Data[29]).Text; //jissi
    ParamByName('Lempno').AsString := empno.Text;
    EXECSQL;
    close;  Sql.Clear;
    Sql.Add('UPDATE PIMPMAS                                            ');
    Sql.Add('   SET ABILITY    = :L21,                                 ');
    Sql.Add('       BLOOD      = :L22,                                 ');
    Sql.Add('       HEIGHT     = :L23,                                 ');
    Sql.Add('       WEIGHT     = :L24,                                 ');
    Sql.Add('       ARMYKIND   = :L25,                                 ');
    Sql.Add('       ARMYCL     = :L26,                                 ');
    Sql.Add('       ARMYFIELD  = :L27,                                 ');
    Sql.Add('       ARMYFRDATE = :L28,                                 ');
    Sql.Add('       ARMYTODATE = :L29,                                 ');
    Sql.Add('       ARMYDIS    = :L30,                                 ');
    Sql.Add('       ARMYEX     = :L31,                                 ');
    Sql.Add('       WRITEEMP   = '''+pempno+''',                       ');
    Sql.Add('       WRITETIME  = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'') ');
    Sql.Add(' WHERE (EMPNO = :Lempno)  ');
    ParamByName('L21').AsString  := TMaskEdit(Dedit.Data[16]).Text;
    ParamByName('L22').AsString  := TMaskEdit(Dedit.Data[17]).Text;
    ParamByName('L23').AsFloat   := TnumberEdit(Dedit.Data[18]).Value;
    ParamByName('L24').AsFloat   := TnumberEdit(Dedit.Data[19]).Value;
    ParamByName('L25').AsString  := TMaskEdit(Dedit.Data[20]).Text;
    ParamByName('L26').AsString  := TMaskEdit(Dedit.Data[21]).Text;
    ParamByName('L27').AsString  := TMaskEdit(Dedit.Data[22]).Text;
    ParamByName('L28').AsString  := TMaskEdit(Dedit.Data[23]).Text;
    ParamByName('L29').AsString  := TMaskEdit(Dedit.Data[24]).Text;
    ParamByName('L30').AsString  := TMaskEdit(Dedit.Data[25]).Text;
    ParamByName('L31').AsString  := TMaskEdit(Dedit.Data[26]).Text;
    ParamByName('Lempno').AsString := empno.Text;
    EXECSQL;

    close;  Sql.Clear;
    Sql.Add('UPDATE PIMPMAS                                           ');
    Sql.Add('   SET COUNTRY   = :L32,                                 ');
    Sql.Add('       NPEOPLE   = :L33,                                 ');
    Sql.Add('       NATION    = :L34,                                 ');
    Sql.Add('       REGION    = :L35,                                 ');
    Sql.Add('       POSTNO    = :L36,                                 ');
    Sql.Add('       ADDRESS   = :L37,                                 ');
    Sql.Add('       CURNATION = :L38,                                 ');
    Sql.Add('       CURREGION = :L39,                                 ');
    Sql.Add('       OFFITEL   = :L40,                                 ');
    Sql.Add('       WRITEEMP   = '''+pempno+''',                      ');
    Sql.Add('       WRITETIME  = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'')');
    Sql.Add(' WHERE (EMPNO = :Lempno)  ');
    ParamByName('L32').AsString  := TMaskEdit(Dedit.Data[32]).Text;
    ParamByName('L33').AsString  := TMaskEdit(Dedit.Data[33]).Text;
    ParamByName('L34').AsString  := TMaskEdit(Dedit.Data[34]).Text;
    ParamByName('L35').AsString  := TMaskEdit(Dedit.Data[35]).Text;
    If (country.Text = 'CN') Then
    Begin
      ParamByName('L36').AsString:= '';
      ParamByName('L37').AsString:= hoguaddr.Text;
    End
    Else
    Begin
      ParamByName('L36').AsString:= TMaskEdit(Dedit.Data[36]).Text;
      ParamByName('L37').AsString:= address.Text;
    End;
    ParamByName('L38').AsString  := TMaskEdit(Dedit.Data[38]).Text;
    ParamByName('L39').AsString  := TMaskEdit(Dedit.Data[39]).Text;
    ParamByName('L40').AsString  := TMaskEdit(Dedit.Data[40]).Text;
    ParamByName('Lempno').AsString := empno.Text;
    EXECSQL;
  end;
  EXCEPT ON E : EDataBaseError DO
    MessageBox(handle,StrPcopy(ErrorHelp,E.Message),'에  러',MB_OK or $0040);
  END;

  SaveHelp.Picture.LoadFromFile(bit2);
  SendMessage(Tpanel(Panel4).Handle,WM_PAINT,0,0);
  SaveHelp.Free;
end;

{메뉴를 선택한다..}
procedure Tpia1031aForm.BselClick(Sender: TObject);
var
  i       : integer;
  Hins    : Word;
  iniFile : TIniFile;
  exefile : array[0..256] of char;
  ObjName : String;
begin
  iniFile := TiniFile.Create(HomeDir+'\insa.ini');
  iniFile.WriteString('Insa','사원번호',empno.Text);
  iniFile.WriteString('Insa','사원성명',korname.Text);
  iniFile.WriteString('Insa','구분','on');
  iniFile.Destroy;
  for i := 1 to 7 do
  begin
    PBsel[i].Color := $00EBEBEB;
    SendMessage(TPanel(PBsel[i]).Handle,WM_PAINT,0,0);
  end;
  TPanel(Sender).Color := $00E9BCC1;
  SendMessage(TPanel(Sender).Handle,WM_PAINT,0,0);

  Case TPanel(Sender).Tag of
  2 :begin
        ObjName     := UpperCase('pia2010a.exe');
        FM_DownLoad := TFM_DownLoad.Create(Application);
        FM_DownLoad.Show;
        FM_DownLoad.PL_ReadEnv;                     //환경변수값(파라미터) 읽어온다.
        FM_DownLoad.PL_VersionCHK3(2, Copy(ObjName,1,8));  //Call하는 단위 프로그램의 버젼을 체크..

        if (not FM_DownLoad.FL_VersionCHK ) or (not FileExists(HomeDir+'\Bin\2tier\'+ObjName)) then
        begin
          FM_DownLoad.PL_DownLoad(2,'/hper/insa/hperson/conbin/Ibin',ObjName,Copy(ObjName,1,8),FM_DownLoad.FL_ProgVer, FL_UnixIP, FL_FtpUser, FL_FtpPass); //단위 프로그램 다운받기.
          SetKeyValue(HKEY_LOCAL_MACHINE, VERSUBKEY, Copy(ObjName,1,8), FM_DownLoad.FL_ProgVer);   //Down후 레지스트리에 버젼 저장.
        end
        else
        begin
          FM_DownLoad.PL_ProgramCall(HomeDir+'\Bin\2Tier\'+ObjName);
          if FM_DownLoad.FL_Ret < 32 then
            MessageBox(handle,'화일이 없거나 메모리가 부족합니다..','에 러',MB_OK or $0010);

          FM_DownLoad.Close;      // 다운로드 폼 닫기.
        end;

        {         strpcopy(exefile,HomeDir+'\Bin\2tier\pia2010a.exe ,'+pempno+','+pkorname+','+password+
                  ', ,'+ Passemp(cmdline,5)+','+Passemp(cmdline,6)+','+' ,'+' ,'+' ,'+
                         passemp(cmdline,10)+','+passemp(cmdline,11)+','+
                         passemp(cmdline,12)+','+passemp(cmdline,13));   }
     end;
  3 :begin
        ObjName     := UpperCase('pia2020a.exe');
        FM_DownLoad := TFM_DownLoad.Create(Application);
        FM_DownLoad.Show;
        FM_DownLoad.PL_ReadEnv;                     //환경변수값(파라미터) 읽어온다.
        FM_DownLoad.PL_VersionCHK3(2, Copy(ObjName,1,8));  //Call하는 단위 프로그램의 버젼을 체크..

        if (not FM_DownLoad.FL_VersionCHK ) or (not FileExists(HomeDirOpen+'\Bin\2tier\'+ObjName)) then
        begin
           FM_DownLoad.PL_DownLoad(2,'/hper/insa/hperson/conbin/Ibin',ObjName,Copy(ObjName,1,8),FM_DownLoad.FL_ProgVer, FL_UnixIP, FL_FtpUser, FL_FtpPass); //단위 프로그램 다운받기.
           SetKeyValue(HKEY_LOCAL_MACHINE, VERSUBKEY, Copy(ObjName,1,8), FM_DownLoad.FL_ProgVer);   //Down후 레지스트리에 버젼 저장.
        end
        else
        begin
           FM_DownLoad.PL_ProgramCall(HomeDirOpen+'\Bin\2Tier\'+ObjName);
           if FM_DownLoad.FL_Ret < 32 then
              MessageBox(handle,'화일이 없거나 메모리가 부족합니다..','에 러',MB_OK or $0010);

           FM_DownLoad.Close;      // 다운로드 폼 닫기.
        end;

        {         strpcopy(exefile,HomeDir+'\Bin\2tier\pia2020a.exe ,'+pempno+','+pkorname+','+password+
                    ', ,'+ Passemp(cmdline,5)+','+Passemp(cmdline,6)+','+' ,'+' ,'+' ,'+
                           passemp(cmdline,10)+','+passemp(cmdline,11)+','+
                           passemp(cmdline,12)+','+passemp(cmdline,13));   }
     end;
  4 :begin
        ObjName     := UpperCase('pia3010a.exe');
        FM_DownLoad := TFM_DownLoad.Create(Application);
        FM_DownLoad.Show;
        FM_DownLoad.PL_ReadEnv;                     //환경변수값(파라미터) 읽어온다.
        FM_DownLoad.PL_VersionCHK3(2, Copy(ObjName,1,8));  //Call하는 단위 프로그램의 버젼을 체크..

        if (not FM_DownLoad.FL_VersionCHK ) or (not FileExists(HomeDirOpen+'\Bin\2tier\'+ObjName)) then
        begin
           FM_DownLoad.PL_DownLoad(2,'/hper/insa/hperson/conbin/Ibin',ObjName,Copy(ObjName,1,8),FM_DownLoad.FL_ProgVer, FL_UnixIP, FL_FtpUser, FL_FtpPass); //단위 프로그램 다운받기.
           SetKeyValue(HKEY_LOCAL_MACHINE, VERSUBKEY, Copy(ObjName,1,8), FM_DownLoad.FL_ProgVer);   //Down후 레지스트리에 버젼 저장.
        end
        else
        begin
           FM_DownLoad.PL_ProgramCall(HomeDirOpen+'\Bin\2Tier\'+ObjName);
           if FM_DownLoad.FL_Ret < 32 then
              MessageBox(handle,'화일이 없거나 메모리가 부족합니다..','에 러',MB_OK or $0010);

           FM_DownLoad.Close;      // 다운로드 폼 닫기.
        end;

        {         strpcopy(exefile,HomeDir+'\Bin\2tier\pia3010a.exe ,'+pempno+','+pkorname+','+password+
                    ', ,'+ Passemp(cmdline,5)+','+Passemp(cmdline,6)+','+' ,'+' ,'+' ,'+
                           Passemp(cmdline,10)+','+passemp(cmdline,11)+','+
                           passemp(cmdline,12)+','+passemp(cmdline,13));   }
     end;
  5 :begin
        ObjName     := UpperCase('pia4010a.exe');
        FM_DownLoad := TFM_DownLoad.Create(Application);
        FM_DownLoad.Show;
        FM_DownLoad.PL_ReadEnv;                     //환경변수값(파라미터) 읽어온다.
        FM_DownLoad.PL_VersionCHK3(2, Copy(ObjName,1,8));  //Call하는 단위 프로그램의 버젼을 체크..

        if (not FM_DownLoad.FL_VersionCHK ) or (not FileExists(HomeDirOpen+'\Bin\2tier\'+ObjName)) then
        begin
           FM_DownLoad.PL_DownLoad(2,'/hper/insa/hperson/conbin/Ibin',ObjName,Copy(ObjName,1,8),FM_DownLoad.FL_ProgVer, FL_UnixIP, FL_FtpUser, FL_FtpPass); //단위 프로그램 다운받기.
           SetKeyValue(HKEY_LOCAL_MACHINE, VERSUBKEY, Copy(ObjName,1,8), FM_DownLoad.FL_ProgVer);   //Down후 레지스트리에 버젼 저장.
        end
        else
        begin
           FM_DownLoad.PL_ProgramCall(HomeDirOpen+'\Bin\2Tier\'+ObjName);
           if FM_DownLoad.FL_Ret < 32 then
              MessageBox(handle,'화일이 없거나 메모리가 부족합니다..','에 러',MB_OK or $0010);

           FM_DownLoad.Close;      // 다운로드 폼 닫기.
        end;
        {         strpcopy(exefile,HomeDir+'\Bin\2tier\pia4010a.exe ,'+pempno+','+pkorname+','+password+
                    ', ,'+ Passemp(cmdline,5)+','+Passemp(cmdline,6)+','+' ,'+' ,'+' ,'+
                           passemp(cmdline,10)+','+passemp(cmdline,11)+','+
                           passemp(cmdline,12)+','+passemp(cmdline,13));   }
     end;
  6 :begin
        ObjName     := UpperCase('pia5010a.exe');
        FM_DownLoad := TFM_DownLoad.Create(Application);
        FM_DownLoad.Show;
        FM_DownLoad.PL_ReadEnv;                     //환경변수값(파라미터) 읽어온다.
        FM_DownLoad.PL_VersionCHK3(2, Copy(ObjName,1,8));  //Call하는 단위 프로그램의 버젼을 체크..

        if (not FM_DownLoad.FL_VersionCHK ) or (not FileExists(HomeDirOpen+'\Bin\2tier\'+ObjName)) then
        begin
           FM_DownLoad.PL_DownLoad(2,'/hper/insa/hperson/conbin/Ibin',ObjName,Copy(ObjName,1,8),FM_DownLoad.FL_ProgVer, FL_UnixIP, FL_FtpUser, FL_FtpPass); //단위 프로그램 다운받기.
           SetKeyValue(HKEY_LOCAL_MACHINE, VERSUBKEY, Copy(ObjName,1,8), FM_DownLoad.FL_ProgVer);   //Down후 레지스트리에 버젼 저장.
        end
        else
        begin
           FM_DownLoad.PL_ProgramCall(HomeDirOpen+'\Bin\2Tier\'+ObjName);
           if FM_DownLoad.FL_Ret < 32 then
              MessageBox(handle,'화일이 없거나 메모리가 부족합니다..','에 러',MB_OK or $0010);

           FM_DownLoad.Close;      // 다운로드 폼 닫기.
        end;
        {         strpcopy(exefile,HomeDir+'\Bin\2tier\pia5010a.exe ,'+pempno+','+pkorname+','+password+
                    ', ,'+ Passemp(cmdline,5)+','+Passemp(cmdline,6)+','+' ,'+' ,'+' ,'+
                           passemp(cmdline,10)+','+passemp(cmdline,11)+','+
                           passemp(cmdline,12)+','+passemp(cmdline,13));   }
     end;
  7 :begin
        ObjName     := UpperCase('pia6010a.exe');
        FM_DownLoad := TFM_DownLoad.Create(Application);
        FM_DownLoad.Show;
        FM_DownLoad.PL_ReadEnv;                     //환경변수값(파라미터) 읽어온다.
        FM_DownLoad.PL_VersionCHK3(2, Copy(ObjName,1,8));  //Call하는 단위 프로그램의 버젼을 체크..

        if (not FM_DownLoad.FL_VersionCHK ) or (not FileExists(HomeDirOpen+'\Bin\2tier\'+ObjName)) then
        begin
           FM_DownLoad.PL_DownLoad(2,'/hper/insa/hperson/conbin/Ibin',ObjName,Copy(ObjName,1,8),FM_DownLoad.FL_ProgVer, FL_UnixIP, FL_FtpUser, FL_FtpPass); //단위 프로그램 다운받기.
           SetKeyValue(HKEY_LOCAL_MACHINE, VERSUBKEY, Copy(ObjName,1,8), FM_DownLoad.FL_ProgVer);   //Down후 레지스트리에 버젼 저장.
        end
        else
        begin
           FM_DownLoad.PL_ProgramCall(HomeDirOpen+'\Bin\2Tier\'+ObjName);
           if FM_DownLoad.FL_Ret < 32 then
              MessageBox(handle,'화일이 없거나 메모리가 부족합니다..','에 러',MB_OK or $0010);

           FM_DownLoad.Close;      // 다운로드 폼 닫기.
        end;
     end;
  end;
end;

procedure Tpia1031aForm.BcancelClick(Sender: TObject);
begin
  Qemp2Display;
end;

procedure Tpia1031aForm.BcodeClick(Sender: TObject);
var
  str : string;
begin
  if FreeCheck = False then begin
    Bcode.Caption := '코드 다운중 !!';
  end else begin
    Bcode.Caption := '해당코드 다운';
    FreeCheck := False; system.exit;
  end;
  FreeCheck := DiskSpaceCheck;
  if FreeCheck = False then system.exit;

  codeToText(HomeDir+'\pia1030a.cod','',0);
  with OraQuery1 do
  begin
    close; sql.clear;
    sql.add('select codeid,codeno,codename from pyccode ');
    sql.add('where (codeid = ''I039'' or codeid = ''I211'') or ');
    sql.add('      (codeid = ''I021'' or codeid = ''I502'') or ');
    sql.add('      (codeid = ''I001'' or codeid = ''I002'') or ');
    sql.add('      (codeid = ''I031'' or codeid = ''I034'') or ');
    sql.add('      (codeid = ''I035'' or codeid = ''I036'') or ');
    sql.add('      (codeid = ''I037'' or codeid = ''SK03'') or ');
    sql.add('      (codeid = ''SK04'' or codeid = ''SK05'') ');
    sql.add('order by codeid,codeno ');
    open;
    while not eof do
    begin
      str := '';
      str := FieldByName('codeid').AsString+','+
             FieldByName('codeno').AsString+','+
             FieldByName('codename').AsString;
      codeToText('',str,1);
      next;
    end;
    OraQuery1.close;
  end;
  codeToText('','',2);
  Bcode.Caption := '해당코드 해제';
end;

procedure Tpia1031aForm.Bn_zipnoCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
(*//2015.02.03.hjku.. 새주소 도입에 따른 프로그램 변경 건(요청서).. 김현순M 요청
  Tmpaddr            := '';
  Tmpaddrlen         := 0;

  case TComponent(Sender).Tag of
  1 : begin
        if ZipForm.Zipno <> '' then
        begin
          zipno.Text    := Copy(ZipForm.ZipNo,1,3)+'-'+Copy(ZipForm.ZipNo,4,3);
          curaddr.Text  := ZipForm.Addr;
          Tmpaddr       := ZipForm.Addr;
          Tmpaddrlen    := Length(ZipForm.Addr);
          Dedit.Data[38].Text := ZipForm.Nation;
          Dedit.Data[39].Text := ZipForm.Region;

          Dedit.Capt[17].Caption := QCodeDisp('SK03',Dedit.Data[38].Text);
          Dedit.Capt[18].Caption := QCodeDisp1(Dedit.Data[38].Text,Dedit.Data[39].Text);

          curaddr.SetFocus;
        End;
      End;
  2 : begin
        if ZipForm.Zipno <> '' then
        begin
          postno.Text   := Copy(ZipForm.ZipNo,1,3)+'-'+Copy(ZipForm.ZipNo,4,3);
          address.Text  := ZipForm.Addr;
          Tmpaddr       := ZipForm.Addr;
          Tmpaddrlen    := Length(ZipForm.Addr);
          Dedit.Data[34].Text := ZipForm.Nation;
          Dedit.Data[35].Text := ZipForm.Region;
          Dedit.Capt[15].Caption := QCodeDisp('SK03',Dedit.Data[34].Text);
          Dedit.Capt[16].Caption := QCodeDisp1(Dedit.Data[34].Text,Dedit.Data[35].Text);
          address.SetFocus;
        End;
      End;
  3 : begin
        regaddr.Text  := ZipForm.Addr;
        Tmpaddr       := ZipForm.Addr;
        Tmpaddrlen    := Length(ZipForm.Addr);
        regaddr.SetFocus;
      End;
  End;
*)  
end;

procedure Tpia1031aForm.FormCreate(Sender: TObject);
var
  CurDate : String;
begin
  OraConnect;

  pempno   := PassEmp(cmdline,1);
  pkorname := PassEmp(cmdline,2);
  password := PassEmp(cmdline,3);

  if copy(Pgrade,2,1) > 'C' then
  begin
       MessageBox(handle,'프로그램 사용권한이 없습니다 !!.','알 림',MB_OK or $0030);
       Application.Terminate;
  end;

  //20180702 신범주 추가
  //BB_export.caption := '인사정보 다운'+#13+'(Profile)';

end;

procedure Tpia1031aForm.Bn_zipnoInitPopup(Sender: TObject);
begin
(* //2015.02.03.hjku.. 새주소 도입에 따른 프로그램 변경 건(요청서).. 김현순M 요청
  ZipForm.Edit         := TOnWinPopupEdit(Sender);

  case TComponent(Sender).Tag of
  1 : begin
        ZipForm.E_Cond.Text  := Copy(zipno.Text,1,3)+Copy(zipno.Text,5,3);
      End;
  2 : begin
        ZipForm.E_Cond.Text  := Copy(postno.Text,1,3)+Copy(postno.Text,5,3);
      End;
  3 : begin
        ZipForm.E_Cond.Text  := '';
      End;
  End;

  TOnWinPopupEdit(Sender).PopupControl := ZipForm ;
*)
end;

procedure Tpia1031aForm.bn_regzipnoInitPopup(Sender: TObject);
begin
  ZipForm.Edit         := TOnWinPopupEdit(Sender);
  ZipForm.E_Cond.Text  := '';
  TOnWinPopupEdit(Sender).PopupControl := ZipForm ;
end;

procedure Tpia1031aForm.bn_regzipnoCloseUp(Sender: TObject;
  var Text: String; var Accept: Boolean);
begin
(*//2015.02.03.hjku.. 새주소 도입에 따른 프로그램 변경 건(요청서).. 김현순M 요청
  Tmpregaddr         := '';
  Tmpregaddrlen      := 0;

  case TComponent(Sender).Tag of
    1 : begin
          if ZipForm.Zipno <> '' then
          begin
            curaddr.Text  := ZipForm.Addr;
            Tmpregaddr    := ZipForm.Addr;
            Tmpregaddrlen := Length(ZipForm.Addr);
          end;
        End;
    2 : begin
          if ZipForm.Zipno <> '' then
          begin
            address.Text  := ZipForm.Addr;
            Tmpregaddr    := ZipForm.Addr;
            Tmpregaddrlen := Length(ZipForm.Addr);
          end;
        End;
    3 : begin
          if ZipForm.Zipno <> '' then
          begin
            regaddr.Text  := ZipForm.Addr;
            Tmpregaddr    := ZipForm.Addr;
            Tmpregaddrlen := Length(ZipForm.Addr);
          end;
        End;
  End;
  *)
end;

procedure Tpia1031aForm.curaddrExit(Sender: TObject);
begin
(*
   if (Tmpaddr<>'') and (Copy(curaddr.Text,1,Tmpaddrlen) <> Tmpaddr) then
      begin
         Application.Messagebox('우편번호에 따른 기본주소는 수정할 수 없습니다','작업안내',mb_ok+ mb_IconStop);
         curaddr.Text := Tmpaddr;
         curaddr.SetFocus;
      end
   else if (Tmpaddr='') and (Tmpfulladdr <> curaddr.Text ) then
      begin
         Application.Messagebox('주소 직접수정 불가능합니다. 우편번호 버튼을 이용해 주세요.','작업안내',mb_ok+ mb_IconStop);
         curaddr.Text := Tmpfulladdr;
         curaddr.SetFocus;
      end;
*)
end;

procedure Tpia1031aForm.regaddrExit(Sender: TObject);
begin
(*
   if (Tmpregaddr<>'') and  (Copy(regaddr.Text,1,Tmpregaddrlen) <> Tmpregaddr) then
      begin
         Application.Messagebox('우편번호에 따른 기본주소는 수정할 수 없습니다','작업안내',mb_ok+ mb_IconStop);
         regaddr.Text := Tmpregaddr;
         regaddr.SetFocus;
      end
   else if (Tmpregaddr='') and (Tmpfullregaddr <> regaddr.Text ) then
      begin
         Application.Messagebox('주소 직접수정 불가능합니다. 우편번호 버튼을 이용해 주세요.','작업안내',mb_ok+ mb_IconStop);
         regaddr.Text := Tmpfullregaddr;
         regaddr.SetFocus;
      end;
*)
end;

procedure Tpia1031aForm.BCardAppClick(Sender: TObject);
begin
  if MessageBox(handle,'위사원의 사원증 발급을 신청하시겠습니까 ?..','확  인',MB_YESNO or $0020) = ID_YES then
  begin
    try
      with  QCard  do
      begin
         Close;
         Sql.Clear;
         Sql.Text :='INSERT INTO PZCardApp                                      '+#13+
                    '          ( APPDATE, EMPNO, KORNAME,                       '+#13+
                    '            PAYCL,PAYRA,                                   '+#13+
                    '            APPSAYU, TEL, APPEMP, PRINTYN,                 '+#13+
                    '            WRITEMAN, WRITETIME )                          '+#13+
             format('   VALUES ( TO_CHAR(SYSDATE,''YYYYMMDD''),                 '+#13+
                    '            ''%s'', ''%s'',                                '+#13+
                    '            ''%s'', ''%s'',                                '+#13+
                    '            ''신규'',                                      '+#13+
                    '            ''02-6266-4489'', ''%s'',''N'',                '+#13+
                    '            ''%s'',TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'') ) ',
                    [            empno.Text,
                                 korname.text,
                                 Qemp2.FieldByName('PAYCL').AsString,
                                 Qemp2.FieldByName('PAYRA').AsString,
                                 Pempno,   Pempno                               ]);
         EXECSQL;
      end;
    except on E : Exception do
      begin
           Application.Messagebox('신청작업이 실패했습니다.','작업안내',mb_ok+ mb_IconStop);
           system.Exit;
      end;
    end;
    MessageBox(handle,'신청되었습니다..','작업안내',MB_ICONINFORMATION);
    BCardApp.Enabled := False;
  end;
end;

procedure Tpia1031aForm.countryExit(Sender: TObject);
begin
  //국적이 중국이면 호구 소재지 사용
  If (country.Text = 'CN') Then
  Begin
    postno.Enabled   := False;
    address.Enabled  := False;
    Bn_curno.Enabled := False;
    nation.Enabled   := False;
    region.Enabled   := False;
    hoguaddr.Enabled := True;
  End Else
  Begin
    postno.Enabled   := True;
    address.Enabled  := True;
    Bn_curno.Enabled := True;
    nation.Enabled   := True;
    region.Enabled   := True;
    hoguaddr.Enabled := False;
  End;
  //국적이 중국, 미국이면 민족/인종 입력
  If ((country.Text = 'CN') or (country.Text = 'US')) Then npeople.Enabled  := True
  Else                                                     npeople.Enabled  := False;
end;

function Tpia1031aForm.QCodeDisp1(s1,s2 : String) : String;
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
             SQL.Add('select Codename from pyccode                 ');
             SQL.Add(' where codeid = ''SK04'' and nationcd = :nationcd and codeno = :lcodeno   ');
             Parambyname('nationcd' ).AsString   := s1;
             Parambyname('lcodeno').AsString   := s2;

             Open;

             if   trim(FieldByName('Codename').AsString) = ''  then
                  QcodeDisp1 := '코드에러'
             else QCodeDisp1 := FieldByName('Codename').AsString;
        end;
     finally
        qq.free;
     end;
end;

procedure Tpia1031aForm.FormShow(Sender: TObject);
begin
  HomeDir := HomeDirOpen;
  bit1    := HomeDir+'\pic\s1.bmp';
  bit2    := HomeDir+'\pic\s2.bmp';
  With Dedit do  begin
 // MaskEdit
    Data[1] := chnname;     //한자성명
    Data[2] := engname;     //영문성명
    Comb[1] := eldsonyn;    //장남여부
    Comb[2] := marrigeyn;   //결혼여부
    Data[3] := juminid;     //주민번호
    Data[4] := sex;         //성별
    Data[5] := holdname;    //호주성명
    Data[6] := holdrel;     //호주관계
    Data[7] := housetype;   //주거형태
    Data[8] := health;      //건강상태
    Comb[3] := bohunyn;     //보훈여부
    Data[9] := bornarea;    //출생지
    Data[10]:= regaddr;     //본적
    Data[11]:= curaddr;     //현주소지(실거주지)
    Data[12]:= zipno;       //현주소지(우편번호)
    Data[13]:= telno;       //전화번호
    Data[14]:= religion;    //종교
    Data[15]:= habit;       //취미
    Data[16]:= ability;     //특기
    Data[17]:= blood;       //혈액형
    Data[18]:= height;      //신장
    Data[19]:= weight;      //체중
    Data[20]:= armykind;    //군별
    Data[21]:= armycl;      //제대계급
    Data[22]:= armyfield;   //병과/주특기
    Data[23]:= armyfrdate;  //입대일자
    Data[24]:= armytodate;  //제대일자
    Data[25]:= armydis;     //제대구분
    Data[26]:= armyex;      //미필사유
 // Caption
    Capt[1] := usaage;      //주민번호
    Capt[2] := Nsex;        //성별
    Capt[3] := Nholdrel;    //호주관계
    Capt[4] := Nhousetype;  //주거형태
    Capt[5] := Nhealth;     //건강상태
    Capt[6] := Nbornarea;   //출생지
    Capt[7] := Nreligion;   //종교
    Capt[8] := Narmykind;   //군별
    Capt[9] := Narmycl;     //제대계급
    Capt[10]:= Narmyfield;  //병과/주특기
    Capt[11]:= Narmydis;    //제대구분
    Capt[12]:= Narmyex;     //미필사유
//  추가1.
    Data[27]:= retcont;     //휴대전화
    Data[28]:= birthday;    //생년월일
    Comb[4] := birthgubun;  //생년월일구분
    Data[29]:= weddingdate; //결혼기념일
    Data[30]:= E_mail;      //E_Mail
    Data[31]:= SKemail;     //SKmail
//  추가2.(2013.01.07)
 // MaskEdit
    Data[32]:= country;    //국적
    Data[33]:= Npeople;    //민족/인종
    Data[34]:= nation;     //주민등록지/호구소재지 국가 코드 (sk03)
    Data[35]:= region;     //주민등록지/호구소재지 지역 코드 (sk04)
    Data[36]:= postno;     //주민등록지(우편번호)
    Data[37]:= address;    //주민등록지/호구소재지 주소
    Data[38]:= curnation;  //실거주지 국가 코드 (sk03
    Data[39]:= curregion;  //실거주지 지역 코드 (sk04)
    Data[40]:= offitel;    //전화번호(사무실)
    Data[41]:= hoguaddr;   //호구주소지

 // Caption
    Capt[13]:= Ncountry;   //국적
    Capt[14]:= NNpeople;   //민족/인종
    Capt[15]:= Nnation;    //주민등록지/호구소재지 국가 코드
    Capt[16]:= Nregion;    //주민등록지/호구소재지 지역
    Capt[17]:= Ncurnation; //실거주지 국가 코드 (sk03)
    Capt[18]:= Ncurregion; //실거주지 지역 코드 (sk04)
  end;

  PBsel[1] := BSel1; PBsel[2] := BSel2; PBsel[3] := BSel3;
  PBsel[4] := BSel4; PBsel[5] := BSel5; PBsel[6] := BSel6; PBsel[7] := BSel7;

  KeyClick(Sender);  
end;

procedure Tpia1031aForm.FormPaint(Sender: TObject);
begin
//  BselClick(BSel1);
end;

procedure Tpia1031aForm.zipnoKeyPress(Sender: TObject; var Key: Char);
begin
    //2015.02.03.hjku.. 새주소 도입에 따른 프로그램 변경 건(요청서).. 김현순M 요청
    //우편번호 입력은 숫자 최대 5~6자리만 가능하도록 수정
    if not (Key in ['0'..'9', Char(VK_DELETE), Char(VK_BACK)]) then    Key := #0;
end;

procedure Tpia1031aForm.postnoKeyPress(Sender: TObject; var Key: Char);
begin
    //2015.02.03.hjku.. 새주소 도입에 따른 프로그램 변경 건(요청서).. 김현순M 요청
    //우편번호 입력은 숫자 최대 5~6자리만 가능하도록 수정
    if not (Key in ['0'..'9', Char(VK_DELETE), Char(VK_BACK)]) then    Key := #0;
end;

procedure Tpia1031aForm.juminidExit(Sender: TObject);
begin
  //dsa2000  2018.04.06       요청번호 SR-1804-0217
  if (Length(Trim(juminid.Text)) > 2 ) and (Length(Trim(juminid.Text)) < 14) then
  begin
       MessageDlg('주민번호 13자리를 채워주시기 바랍니다.'+#13+#13+
                  '부득이한 경우 성별에 따라 뒷자리를 "1111111" 또는 "2222222" 입력하고'+#13#13+
                  '추후 반드시 정상적인 주민번호로 변경 바랍니다',mtError,[mbOK],0);
  end;
end;

procedure Tpia1031aForm.BB_exportClick(Sender: TObject);
begin

     //20180702 신범주 추가
     PIA1031a_3Form := TPIA1031a_3Form.Create(self);

     try
        PIA1031a_3Form.ShowModal;
        
     finally
        PIA1031a_3Form.Free;
     end;
end;

procedure Tpia1031aForm.empnoKeyPress(Sender: TObject; var Key: Char);
begin

  // 2018-07-03 신범주 추가
  if Key = chr(13) then

     begin

          FKeyEmpnoB := TFKeyEmpnoB.Create(self);

          Try

               FKeyEmpnoB.EdEmpno.Text := empno.Text;

               FKeyEmpnoB.v_EmpGb    := 'A';

               FKeyEmpnoB.v_CloseGb := True;

               FKeyEmpnoB.BBrun.OnClick(Sender);

               if FKeyEmpnoB.CloseChk <> -1 then

               begin

                    empno.TExt := FKeyEmpnoB.v_KeyEmpno;

                    korname.Text := FKeyEmpnoB.v_KeyKorname;

               end

               else

               begin

                    FKeyEmpnoB.ShowModal;

                    empno.TExt := FKeyEmpnoB.v_KeyEmpno;

                    korname.Text := FKeyEmpnoB.v_KeyKorname;

               end;

          Finally

               FKeyEmpnoB.Free;

          end;

     end;
end;

end.

