{header.
-----------------------------------------------------
PROGRAM-NAME    :  PIB2015A(조직도정정)
SYSTEM-NAME     : 종합인사정보
SUBSYSTEM-NAME  : 인사
Programmer      : 전철호
Version         : 1.00
Date            : 1996.08.03
Update contents
  1.00   1996.08.03    전철호  신규프로그램개발 처리명세서
-----------------------------------------------------}

unit pib20151;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, ExtCtrls,pass,timeftp,calen1,datelib, KeyEmpno, DeptCode,
  DB,DBTables, Func, MemDS, DBAccess, Ora;

type
  Tpib2015aForm = class(TForm)
    Panel19: TPanel;
    Lempno: TLabel;
    Lsysdate: TLabel;
    Panel46: TPanel;
    classsel: TPanel;
    Panel1: TPanel;
    BCancel: TBitBtn;
    BExit: TBitBtn;
    BSave: TBitBtn;
    Panel6: TPanel;
    Label9: TLabel;
    helpDsr: TLabel;
    Panel5: TPanel;
    Panel11: TPanel;
    Ndeptname: TPanel;
    Panel12: TPanel;
    Panel16: TPanel;
    Npaycl: TPanel;
    Npayra: TPanel;
    Panel7: TPanel;
    Npstate: TPanel;
    Panel4: TPanel;
    empno: TMaskEdit;
    Panel8: TPanel;
    korname: TMaskEdit;
    Panel2: TPanel;
    Panel3: TPanel;
    orgym: TMaskEdit;
    deptcode: TMaskEdit;
    OraQuery1: TOraQuery;
    Qdept: TOraQuery;
    QCode: TOraQuery;
    Qemp: TOraQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure BExitClick(Sender: TObject);
    procedure KeyFieldDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure KeyTabControl(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DataTabControl(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CalenClick(Sender: TObject);
    procedure DeptClick(Sender: TObject);
    procedure empnoClick(Sender: TObject);
    procedure KeyPress(Sender: TObject; var Key: Char);
    procedure BSaveClick(Sender: TObject);
    procedure DataExit(Sender: TObject);
    procedure DataChange(Sender: TObject);
    procedure DataCurClick(Sender: TObject);
  private
    { Private declarations }
    EnterKey  : Boolean;
    ChangeMod : Boolean;
    DeptMod   : Boolean;
    procedure KeyClick(Sender: TObject);
    procedure SaveData;
    function  QCodeDisp(s1,s2 : String) : String;
    function  QDeptDisp(s1,s2 : String) : String;
    function  empFind(const str : string) : integer;
    function  DataCheck: Boolean;
    function  orgFind : integer;
  public
    { Public declarations }
    HomeDir  : string;
    start    : integer;
  end;

type
  updata = record
     orgnum    : string;
     payrayn   : string;
     paycl     : string;
     payra     : string;
     pstate    : string;
end;

var
  pib2015aForm: Tpib2015aForm;
  ErrorHelp : array[0..255] of char;
  data : Updata;

implementation

{$R *.DFM}

// this procedure display the name of code to the panel component...............
function Tpib2015aForm.QCodeDisp(s1,s2 : String) : String;
begin
  if trim(s2) = '' then begin
     QCodeDisp := '';  System.Exit;
  end;
  QCode.Close;
  QCode.ParamByName('lcodeid').AsString  := s1;
  QCode.ParamByName('lcodesub').AsString := s2;
  QCode.Open;
  if QCode.Recordcount > 0 then  QCodeDisp := QCode.FieldByName('codename').AsString
                           else  QCodeDisp := '코드에러';
  QCode.Close;
end;

function Tpib2015aForm.QDeptDisp(s1,s2 : String) : String;
begin
  if trim(s1) = '' then begin
     QDeptDisp := ''; System.Exit;
  end;
  QDept.Close;
  QDept.ParamByName('ldept').AsString     := s1;
  QDept.ParamByName('lorgnum').AsString   := s2;
  QDept.Open;
  if Qdept.Recordcount > 0 then  QDeptDisp := QDept.FieldByName('deptname').AsString
                           else  QDeptDisp := '코드에러';
  QDept.Close;
end;

// this procedure display all data in pimpmas table to the corresponding component.
function Tpib2015aForm.empFind(const str : string) : integer;
begin
  Qemp.close;
  Qemp.ParamByName('lempno').AsString := str;
  Qemp.Open;
  Data.paycl        := Qemp.FieldByName('paycl').AsString;
  Data.payra        := Qemp.FieldByName('payra').AsString;
  Data.pstate       := Qemp.FieldByName('pstate').AsString;
  Data.payrayn      := Qemp.FieldByName('payrayn').AsString;
  empno.Text        := Qemp.FieldByName('empno').AsString;
  korname.Text      := Qemp.FieldByName('korname').AsString;
  Npaycl.Caption    := QcodeDisp('I112',Data.paycl);
  Npayra.Caption    := QcodeDisp('I113',Data.payra);
  Npstate.Caption   := QcodeDisp('I114',Data.pstate);
  Result := Qemp.recordCount;
  if (Qemp.recordCount = 0) or
     (Qemp.FieldByName('pstate').AsString >= '80') then begin
      Qemp.close; system.exit;
  end;
  Qemp.close;
end;

// this procedure display all data in pihorga table to the corresponding component.
function Tpib2015aForm.orgFind : integer;
begin
  Result := 0;
  OraQuery1.close; OraQuery1.sql.clear;
  OraQuery1.sql.add('select * from pihorga where ');
  OraQuery1.sql.add(Format('(orgym = ''%s'' and deptcode = ''%s'' and gubun = ''0'')',
                [orgym.Text,deptcode.Text]));
  OraQuery1.Open;
  Result            := OraQuery1.recordCount;
  Data.orgnum       := OraQuery1.FieldByName('orgnum').AsString;
  Data.payrayn      := OraQuery1.FieldByName('payrayn').AsString;
  Data.paycl        := OraQuery1.FieldByName('paycl').AsString;
  Data.payra        := OraQuery1.FieldByName('payra').AsString;
  Data.pstate       := OraQuery1.FieldByName('pstate').AsString;
  deptcode.Text     := OraQuery1.FieldByName('deptcode').AsString;
  Ndeptname.Caption := OraQuery1.FieldByName('deptname').AsString;
  orgym.Text        := OraQuery1.FieldByName('orgym').AsString;
  empno.Text        := OraQuery1.FieldByName('empno').AsString;
  korname.Text      := OraQuery1.FieldByName('korname').AsString;
  Npaycl.Caption    := OraQuery1.FieldByName('payclnm').AsString;
  Npayra.Caption    := OraQuery1.FieldByName('payranm').AsString;
  Npstate.Caption   := Qcodedisp('I114',OraQuery1.FieldByName('pstate').AsString);
  OraQuery1.close;
end;

// this procedure return the result that check to right data or irright data.
function Tpib2015aForm.DataCheck : Boolean;
begin
  Result := True;
  if Npaycl.Caption = '코드에러'  then Result := False;
  if Npayra.Caption = '코드에러'  then Result := False;
  if Npstate.Caption = '코드에러' then Result := False;
  if Result = False then begin
     MessageBox(handle,'입력 데이타 에러입니다 !!.','확 인',MB_OK or $0030);
     empno.Setfocus;
  end;
end;

// this procedure is the content about pia2015aForm.............................
procedure Tpib2015aForm.FormCreate(Sender: TObject);
begin
  start := 0;
end;

procedure Tpib2015aForm.FormPaint(Sender: TObject);
var
  CurDate : String;
begin
  if start = 0 then
  begin
     HomeDir := HomeDirOpen;

     HelpDsr.Caption := ' 종합인사시스템에 접속중입니다, 잠시만기다리세요...';
     Application.ProcessMessages;

     OraConnect;

     Lempno.Caption   := Pkorname + '(' + Pempno+')';
     Lsysdate.Caption := fn_GetDateStr;
     if copy(Pgrade,2,1) > 'C' then
     begin
          MessageBox(handle,'프로그램 사용권한이 없습니다 !!.','알 림',MB_OK or $0030);
          close;
     end;

     OraQuery1.close;
     OraQuery1.sql.clear;
     OraQuery1.sql.add('select value1 from pimvari where gubun = ''B2'' and sgubun = ''0000'' ');
     OraQuery1.Open;
     orgym.Text := OraQuery1.FieldByName('value1').AsString;

     OraQuery1.close; OraQuery1.sql.clear;
     OraQuery1.sql.add('select value1 from pimvari where gubun = ''00'' and sgubun = ''0001'' ');
     OraQuery1.Open;
     Data.orgnum := OraQuery1.FieldByName('value1').AsString;
     OraQuery1.close;
     KeyClick(Sender);
     orgym.SetFocus;
  end;
end;

procedure Tpib2015aForm.BExitClick(Sender: TObject);
begin
  if MessageBox(handle,'종료 하시겠습니까 ?.','확 인',MB_YESNO or $0030) = ID_YES then
     close;
end;

// this procedure is acted on downing mouse.....................................
procedure Tpib2015aForm.KeyClick(Sender: TObject);
var
  i : integer;
begin
  Helpdsr.Caption := '';  orgym.SetFocus;
  Bsave.Glyph.LoadFromFile(HomeDir+'\pic\pbutt014.bmp');
  Bsave.Caption    := '실행';
  BCancel.Enabled  := False;
  for i := 0 to ComponentCount - 1 do begin
      if (TObject(components[i]) is TComboBox) then begin
          TComboBox(components[i]).ItemIndex := 4;
      end;
      if (TObject(components[i]) is TMaskEdit) then begin
         if (components[i].Name = 'orgym') or
            (components[i].Name = 'deptcode') then continue;
          TmaskEdit(components[i]).Text    := '';
      end;
      if (TObject(components[i]) is TPanel) then
          if copy(TPanel(components[i]).Name,1,1) = 'N' then
             TPanel(components[i]).Caption := '';
  end;
end;

procedure Tpib2015aForm.KeyFieldDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   if Bsave.Caption = '저장' then KeyClick(Sender);
end;

// this procedures are the function that the key is controled by user...............
procedure Tpib2015aForm.KeyPress(Sender: TObject; var Key: Char);
begin
  Helpdsr.Caption := '';
  if Key = Chr(13) then begin
     Key := Chr(0);   //  forbid Beep voice..
     EnterKey := False;
     if TComponent(Sender).Name = 'deptcode' then  begin
        EnterKey  := True;    DeptMod  := False;
        BsaveClick(sender);
     end;
  end;
end;

procedure Tpib2015aForm.KeyTabControl(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = vk_F1  then begin
      if TComponent(Sender).Tag = 1 then CalenClick(Sender);
      if TComponent(Sender).Tag = 2 then DeptClick(Sender);
   end;
   if (Key = vk_Return) or (Key = vk_Tab) then begin
      case TComponent(Sender).Tag of
        1 : deptcode.SetFocus;
        2 : orgym.SetFocus;
      end; {case end}
   end; {if end}
end;

procedure Tpib2015aForm.DataTabControl(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = vk_F1  then begin
      if TComponent(Sender).Tag = 1 then empnoClick(Sender);
   end;
   if (Key = vk_Return) or (Key = vk_Tab) then begin
      case TComponent(Sender).Tag of
        1 : if EnterKey = False then korname.SetFocus;
        2 : empno.SetFocus;
      end; {case end}
   end; {if end}
   EnterKey := False;
end;

procedure Tpib2015aForm.DataChange(Sender: TObject);
begin
  ChangeMod := True;
end;

procedure Tpib2015aForm.DataExit(Sender: TObject);
begin
  if ChangeMod = False then system.exit;
  if (Tcomponent(Sender).Name = 'deptcode') and (DeptMod = False) then begin
     DeptMod := True;
     Ndeptname.Caption := QdeptDisp(deptcode.Text,Data.orgnum);
     system.exit;
  end;
  if Tcomponent(Sender).Name = 'empno'   then empFind(empno.Text);
  if Tcomponent(Sender).Name = 'korname' then begin
     if trim(empno.Text) = '' then
        if empFind(korname.Text) > 1 then empnoClick(Sender);
  end;
  ChangeMod := False;
end;

// this procedure display the screen of calender when the mouse click double....
procedure Tpib2015aForm.CalenClick(Sender: TObject);
begin
 Calendar := TCalendar.Create(Self);
 Try
   Calendar.ShowModal;
   if Calendar.DayCaption <> '' then
      TMaskEdit(Sender).Text := copy(Calendar.DayCaption,1,6);
 Finally
   Calendar.Free;
 End;
end;

// this procedure display the deptcode Form screen when the mouse click double..
// For more infomation, see the deptlib.pas file.
procedure Tpib2015aForm.DeptClick(Sender: TObject);
begin
     FDeptCode := TFDeptCode.Create(Self);
     Try
          FDeptCode.ShowModal;
          if FDeptCode.GSdeptcode <> '' then
          begin
              deptcode.Text     := FDeptCode.GSdeptcode;
              Ndeptname.Caption := FDeptCode.GSdeptName;
          end;
     Finally
          FDeptCode.Free;
     End;
end;

// this procedure display the empno Form screen when the mouse click double..
// For more infomation, see the fempno.pas file.
procedure Tpib2015aForm.empnoClick(Sender: TObject);
begin
  FKeyEmpno := TFKeyEmpno.Create(Self);
  try
       if TMaskEdit(Sender).Name = 'empno' then
            FKeyEmpno.EdEmpno.Text := empno.Text
       else
            FKeyEmpno.EdEmpno.Text := korname.Text;
       FKeyEmpno.v_Table_Name := 'pimpmas';
       FKeyEmpno.ShowModal;

       if FKeyEmpno.CloseChk = -1 then Exit;

       if FKeyEmpno.v_KeyEmpno <> '' then
       begin
            empno.Text      := FKeyempno.v_KeyEmpno;
            korname.Text    := FKeyEmpno.v_KeyKorname;
       end;
  finally
       FKeyEmpno.Free;
  end;
end;

// this procedure is the function that runs the bsaveClick event.
// when the button click. this procedure runs.
procedure Tpib2015aForm.DataCurClick(Sender: TObject);
begin
   if Bsave.Caption = '실행' then BSaveClick(Sender);
end;

procedure Tpib2015aForm.BSaveClick(Sender: TObject);
begin
  if Bsave.Caption = '실행' then begin
     if orgFind = 0 then begin
        MessageBox(handle,'해당 데이타가 없습니다 !!.','확 인',MB_OK or $0030);
        KeyClick(Sender); orgym.SetFocus; System.Exit;
     end;
     HelpDsr.Caption := '해당내용을 읽고 있습니다 !!.';
     SendMessage(panel6.handle,WM_PAINT,0,0);
     HelpDsr.Caption := '';   empno.Setfocus;
     Bsave.Glyph.LoadFromFile(HomeDir+'\pic\pbutt010.bmp');
     Bsave.Caption := '저장'; BCancel.Enabled := True;
     system.Exit;
  end;

  if MessageBox(handle,'해당내용을 저장하시겠습니까 ?.','확 인',MB_YESNO or $0020) = ID_YES then
  begin
    if DataCheck = False then system.exit;
    HelpDsr.Caption := '해당내용을 저장하고 있습니다 !!.';
    SendMessage(panel6.handle,WM_PAINT,0,0);
    SaveData;
    KeyClick(Sender); orgym.SetFocus;
 end;
end;

procedure Tpib2015aForm.SaveData;
begin
  empFind(empno.Text);
  if trim(empno.Text) = '' then Data.payrayn := 'N'
                           else Data.payrayn := 'Y';
  OraQuery1.close; OraQuery1.sql.clear;
  OraQuery1.sql.add('update pihorga set ');
  OraQuery1.sql.add(Format('empno = ''%s'',korname = ''%s'',paycl = ''%s'',payclnm=''%s'', ',
                [empno.text,korname.Text,Data.paycl,Npaycl.Caption] ));
  OraQuery1.sql.add(Format('payra = ''%s'',payranm = ''%s'',pstate = ''%s'',payrayn=''%s'',',
                [Data.payra,Npayra.Caption,Data.pstate,Data.payrayn] ));
  OraQuery1.sql.add(Format('writetime = ''%s'', writeemp = ''%s'',adpayrayn = ''N'' ',
                [Fn_GetDateTimeStr, Pempno] ));
  OraQuery1.sql.add(Format('where (orgym = ''%s'' and deptcode = ''%s'' and gubun = ''0'') ',
                [orgym.Text,deptcode.Text]));
  OraQuery1.EXECSQL;
  OraQuery1.close;                
end;

end.
