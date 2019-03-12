{-------------------------------- header. --------------------------------------
PROGRAM-NAME    : (사원증 발급 프로그램)
SYSTEM-NAME     : 종합인사정보
SUBSYSTEM-NAME  : 인사
Programmer      : 이민용
Version         : 1.00
Date            : 2004.06.16
-------------------------------------------------------------------------------
사용되는 Table & View : HPER.IC_PIMPMAS
                        card.tprtcard
                        card.tprtcardmst
Update contents                         
-------------------------------------------------------------------------------
  1.00   2004.06.16   이민용     처리명세서              신규프로그램개발
  2.00   2007.07.09   강륜종     재개발 및 종합인사 메뉴에 추가...
-------------------------------------------------------------------------------}
unit UMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, jpeg, ExtCtrls, OnEditBaseCtrl, OnEditStdCtrl, Grids,
  DBGrids, Db, MemDS, DBAccess, Ora, ComCtrls, OnStringUtils, Func,
  OnScheme, OnFocusButton, OnInsaCommon, Pass, Menus, Comobj;

type
  TFrmMain = class(TForm)
    StatusBar1: TStatusBar;
    SF_Main: TOnSchemeForm;
    GroupBox1: TGroupBox;
    Image1: TImage;
    Image3: TImage;
    La_Name: TLabel;
    La_payra: TLabel;
    La_ImsiNo: TLabel;
    La_EngName: TLabel;
    GroupBox2: TGroupBox;
    Image2: TImage;
    La_Sabun: TLabel;
    La_Name1: TLabel;
    La_Jumin: TLabel;
    La_OrgEmpDate: TLabel;
    GroupBox3: TGroupBox;
    CB_IOLEVEL: TComboBox;
    BT_EmpSearch: TOnFocusButton;
    BT_Direct: TOnFocusButton;
    BT_Visit: TOnFocusButton;
    BT_Imsi: TOnFocusButton;
    BT_HisSearch: TOnFocusButton;
    BT_CardModify: TOnFocusButton;
    BT_Close: TOnFocusButton;
    E_Search: TOnEdit;
    BT_FrontP: TOnFocusButton;
    BT_BackP: TOnFocusButton;
    BT_Save: TOnFocusButton;
    OnEdit1: TOnEdit;
    OnEdit2: TOnEdit;
    OnEdit3: TOnEdit;
    OnEdit4: TOnEdit;
    Panel1: TPanel;
    Ed_Cardno: TOnEdit;
    Ed_Chipno: TOnEdit;
    Ed_Dept: TOnEdit;
    Ed_Place: TOnEdit;
    Ed_TcomLabel: TOnEdit;
    Ed_Tcompany: TOnEdit;
    BT_Excel1: TOnFocusButton;
    OraQuery1: TOraQuery;
    procedure E_SearchClick(Sender: TObject);
    procedure E_SearchKeyPress(Sender: TObject; var Key: Char);
    procedure BT_FrontPClick(Sender: TObject);
    procedure BT_EmpSearchClick(Sender: TObject);
    procedure BT_BackPClick(Sender: TObject);
    procedure BT_DirectClick(Sender: TObject);
    procedure BT_ImsiClick(Sender: TObject);
    procedure BT_VisitClick(Sender: TObject);
    procedure BT_CardModifyClick(Sender: TObject);
    procedure BT_HisSearchClick(Sender: TObject);
    procedure BT_SaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure LableClear;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BT_CloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Ed_ChipnoChange(Sender: TObject);
    procedure Ed_CardnoChange(Sender: TObject);
    procedure BT_Excel1Click(Sender: TObject);
  private
    { Private declarations }
    picMem : TMemoryStream;

  public
    { Public declarations }
    Flag      : string;
    FG_Gubun  : string;
    v_Appdate : String;
    function  Proper(str: string): string;
    procedure FindEmp(pOpt : string);
  end;

var
  FrmMain: TFrmMain;

implementation

uses UHis, UImsi, UInfo, UInput, UPrintF, UPrintT, USawon, UMainForm,
  UPrintFr;

{$R *.DFM}

function TFrmMain.Proper(str: string): String;
var
  strTemp : String;
begin
  strTemp := UpperCase(Copy(Str,1,1));
  strTemp := strTemp+(LowerCase(Copy(str,2,Length(str)-1)));
  Result  := strTemp;
end;

procedure TFrmMain.LableClear;
begin
  La_Name.Caption       := '';
  La_EngName.Caption    := '';
  La_payra.Caption      := '';
  La_ImsiNo.Caption     := '';
  La_Sabun.Caption      := '';
  La_Name1.Caption      := '';
  La_Jumin.Caption      := '';
  La_OrgEmpDate.Caption := '';

  CB_IOLEVEL.Text       := '02 사원 (전층)';
  Ed_Chipno.Text        := '';
  Ed_Cardno.Text        := '';
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
{
  Application.ProcessMessages;

  OraConnect;
}
end;

procedure TFrmMain.FormShow(Sender: TObject);
begin
{
//  1   2    3    4    5    6    7    8    9    10
//충원 인사 급여 복리 인력 경영 사원 종합 공통 기타
  if  not (Pgrade[9] in ['A','B']) then
  begin
       ShowMessage('사용권한이 부족합니다.  프로그램을 종료합니다.');
       Close;
  end;

//  LableClear;

//  E_Search.SetFocus;
}
{//권한 변경.........(2010.05.25)
  if Mainform.PGroupId = 'G042' then
  begin
       BT_EmpSearch.Visible  := false;
       BT_Direct.Visible     := false;
       BT_Imsi.Visible       := false;
       BT_Visit.Visible      := false;
       BT_CardModify.Visible := false;
       BT_Save.Enabled       := false;
  end
  else
  if (Mainform.PGroupId = 'G011') or (Mainform.PGroupId = 'G001') then
  begin
       E_Search.Enabled := true;
  end;
}
  E_Search.Enabled := true;
  CB_IOLEVEL.Text := '02 사원 (전층)';
end;

procedure TFrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := caFree;
end;

// 바로 찾기
procedure TFrmMain.E_SearchClick(Sender: TObject);
begin
//     E_Search.Text:='';
end;

procedure TFrmMain.E_SearchKeyPress(Sender: TObject; var Key: Char);
begin
     if   ((Key = #13) and (Length(E_Search.Text)=4))  then  FindEmp('조회')
     else                                                    E_Search.SetFocus;
end;

//사원검색.............................
procedure TFrmMain.FindEmp(pOpt:string);
var
  imgJPEG    : TJPEGImage;
  Rect       : TRect;
  v_iolevel  : integer;
  sName      : string;
  V_OrgEmpDate :string;
  FistName, MiddleName, MiddleName1, LastName :string;
  qq         : TOraQuery;
begin
//  Image1.Picture.LoadFromFile(GetHomeDir+'\Pic\Sawon_F.jpg');

  Flag := 'S';

  qq := TOraQuery.Create(nil);
  qq.Session := Ora_Session;
  try
       with qq do
       begin
            Close;
            SQL.Clear;
            SQL.Add('select empno,                                                ');
            SQL.Add('       korname,                                              ');
            SQL.Add('       engname,                                              ');
            SQL.Add('       juminid,                                              ');
            SQL.Add('       orgempdate,                                           ');
            SQL.Add('       deptcode,                                             ');
            SQL.Add('       deptname,                                             ');
            //SQL.Add('       payra_ic orders,                                      ');
            SQL.Add('       (select codename from pyccode where codeid = ''I902'' ');
            SQL.Add('           and codeno = (select tcompany from pimpmas        ');
            SQL.Add('                          where empno = a.empno)) orders,    ');
            SQL.Add('       (select codename from pyccode where codeid =''I160''  ');
            SQL.Add('           and codeno = (select jobplace from pimpmas        ');
            SQL.Add('                          where empno = a.empno)) placename, ');
         {  SQL.Add('       decode(payclnm,''특정''    ,''사원'',                 ');
            SQL.Add('                      ''전문계약'',''사원'',                 ');
            SQL.Add('                      ''계약''    ,''사원'',                 ');
            SQL.Add('                      ''일반''    ,''사원'',                 ');
            SQL.Add('                      payclnm ) orders     ,                 '); }
            SQL.Add('       photo                                                 ');
            SQL.Add('  from HPER.IC_PIMPMAS  a                                    ');
            SQL.Add(' where empno =:empno                                         ');
            ParamByName('empno').AsString := E_Search.Text;
            Open;

            //한글이름
            sName       := FieldByName('korname').AsString;
            La_Name.Caption := FieldByName('korname').AsString;
            //La_Name.Caption := Copy(sName,1,2) +' '+ Copy(sName,3,2) +' '+ Copy(sName,5,2) +' '+ Copy(sName,7,2)
            ED_dept.Text  := FieldByName('deptname').AsString;
            ED_place.Text := FieldByName('placename').AsString;

            // 영문 이름 넣기 시작
            sName       := FieldByName('engname').AsString;
            FistName    := Proper(ParseString(sName,' ',1));
            MiddleName  := Proper(ParseString(sName,' ',2));
            MiddleName1 := Proper(ParseString(sName,' ',3));
            LastName    := Proper(ParseString(sName,' ',4));

            //정상적인 영문명 출력....
            La_EngName.Font.Style := [fsBold];
            La_EngName.Font.Name  := 'Gill Sans Display MT Pro Bold';
            La_EngName.Font.Size  := 9;
            if      E_Search.Text = '1623' then La_EngName.Caption := copy(MiddleName,1,1) +'.'+ copy(MiddleName1,1,1) +'.'+ copy(LastName,1,1) +'.'+ FistName //이름4자 하드코딩.
            else if MiddleName1   = ''     then La_EngName.Caption := copy(MiddleName,1,1) +'.'+ FistName
            else                                La_EngName.Caption := copy(MiddleName,1,1) +'.'+ copy(MiddleName1,1,1) +'.'+ copy(LastName,1,1) + FistName;

            {2015.06.26.hjku.. 인턴사원도 동일하게 나오도록 변경.. 이명노M
            //인턴 사원 출력....
            if Copy(E_Search.Text,1,1) = 'I' then
            begin
                 La_EngName.Font.Style:= [fsBold];
                 La_EngName.Font.Name := '-윤고딕140';
                 La_EngName.Font.Size := 10;
                 La_EngName.Caption   := sName //인턴사원은 인사전산등록표에서 등록한 영문명 그대로 찍히도록
            end;
            }
            La_EngName.Caption := upperCase(La_EngName.Caption);     //ShowMessage(La_EngName.Caption);

           { //직책
            if      pOpt = '출력' then La_payra.Caption := FrmSawon.OnEd_PrtPayra.Text
            else if pOpt = '조회' then La_payra.Caption := FieldByName('orders').AsString;
           }
            //파견사원의 파견업체 출력
            if copy(E_Search.Text,1,1) = 'Y' then
            begin
                 Ed_Tcompany.Text     := FieldByName('orders').AsString;
                 Ed_TcomLabel.Visible := true;
                 Ed_Tcompany.Visible  := true;
            end
            else
            begin
                 Ed_TcomLabel.Visible := false;
                 Ed_Tcompany.Visible  := false;
            end;

            //사원증 뒷면에 사번,이름,주민번호,직책,입사일을 넣어준다.
            La_Sabun.Caption      := FieldByName('empno').AsString;
            La_Name1.Caption      := FieldByName('korname').AsString;
            La_Jumin.Caption      := copy(FieldByName('juminid').AsString,1,8)+'******';
            V_OrgEmpDate          := FieldByName('orgempdate').AsString;
            V_OrgEmpDate          := Copy(V_OrgEmpDate,1,4)+'.'+Copy(V_OrgEmpDate,5,2)+'.'+Copy(V_OrgEmpDate,7,2);
            La_OrgEmpDate.Caption := V_OrgEmpDate;

            // 상태바에 상태 표시하기
            StatusBar1.Panels[0].Text := FieldByName('placename').AsString;
            StatusBar1.Panels[1].Text := '사원카드';
            StatusBar1.Panels[2].Text := FieldByName('deptcode').AsString;
            StatusBar1.Panels[3].Text := FieldByName('deptname').AsString;
            ////////////////////////////////////////////////////////////////////

            image3.Picture := nil; //사진 초기화
            picMem  := TMemoryStream.Create;
            imgJPEG := TJPEGImage.Create;
            Rect    := Image3.Canvas.ClipRect;

            if FieldByName('empno').AsString = '' then
            begin
                 MessageDlg('존재하지 않는 사원입니다.', mtInformation, [mbOK], 0);
                 CB_IOLEVEL.Text := '02 사원 (전층)';
                 Ed_Chipno.Text  := '';
                 Ed_Cardno.Text  := '';
                 //E_Search.Text   := '';
                 image3.Picture  := nil;
                 System.Exit;
            end
            else if copy(FieldByName('empno').AsString,1,1) = 'U' then    //U사번 이미지로드하는 부분 차단 2014.04.18 jissi 양혜림요청
            begin
                 CB_IOLEVEL.Text := '02 사원 (전층)';
                 Ed_Chipno.Text  := '';
                 Ed_Cardno.Text  := '';
                 //E_Search.Text   := '';
                 image3.Picture  := nil;
                 System.Exit;
            end
            else if TBlobField(FieldByName('photo')) <> nil then
            begin
                 TBlobField(FieldByName('photo')).SaveToStream(picMem);
                 PicMem.Position :=0;
                 imgJPEG.LoadFromStream(picMem);
                 image3.Canvas.StretchDraw(Rect,imgJPEG);
            end;
            imgJPEG.Free;
            ////////////////////////////////////////////////////////////////////

            //출입권한, 프로그램번호, 카드번호를 준다.
            Close;
            SQL.Clear;
            SQL.Add('select empno, cardno, chipno, iolevel ');
            SQL.Add('  from card.tprtcardmst                    ');
            SQL.Add(' where empno = :empno                 ');
            ParamByName('empno').AsString := E_Search.Text;
            Open;

            if   Trim(FieldByName('iolevel').AsString) = '' then
            begin
                 CB_IOLEVEL.Text := '02 사원 (전층)';
                 Ed_Chipno.Text  := FieldByName('chipno').AsString;
                 Ed_Cardno.Text  := FieldByName('cardno').AsString;
            end
            else
            begin
                 v_iolevel := StrToInt(FieldByName('iolevel').AsString);

                 case v_iolevel of
                     01 : CB_IOLEVEL.Text := '01 사원 (일반)';
                     02 : CB_IOLEVEL.Text := '02 사원 (전층)';
                     03 : CB_IOLEVEL.Text := '03 출입 (일반)';
                     04 : CB_IOLEVEL.Text := '04 출입 (전층)';
                     05 : CB_IOLEVEL.Text := '05 출입 (단층)';
                     06 : CB_IOLEVEL.Text := '06 방문';
                 end;
                 Ed_Chipno.Text  := FieldByName('chipno').AsString;
                 Ed_Cardno.Text  := FieldByName('cardno').AsString;
            end;

       end;  //with qq do
  finally
       qq.Free;
  end;

//  Ed_Chipno.SetFocus;
end;

//앞면 인쇄
procedure TFrmMain.BT_FrontPClick(Sender: TObject);
var
  V_date,V_Datetime  : string;
  V_cardno, V_chipno : string;
  V_RecordCount      : integer;
  V_IOLEVEL          : string;
  V_La_Name          : string;
  V_La_Name1         : string;
  qq : TOraQuery;
begin
  qq := TOraQuery.Create(nil);
  qq.Session := Ora_Session;
  try
       with qq do
       begin
            Close;
            SQL.Clear;
            SQL.Add('select cardno, chipno, printyn ');
            SQL.Add('  from card.tprtcardmst        ');
            SQL.Add(' where empno = :empno          ');
            ParamByName('empno').AsString := E_Search.Text;
            Open;

            V_RecordCount := qq.RecordCount;
            V_cardno      := FieldByName('cardno').AsString;
            V_chipno      := FieldByName('chipno').AsString;

            {
            if Length(Ed_Chipno.Text) <> 8 then
            begin
                 MessageDlg('프로그램번호 8자를 입력하세요.', mtInformation, [mbOK], 0);
                 Ed_Chipno.SetFocus;
                 System.Exit;
            end;
            }
            if Length(Ed_Cardno.Text) <> 8 then
            begin
                 MessageDlg('카드번호 8자를 입력하세요.', mtInformation, [mbOK], 0);
                 Ed_Cardno.SetFocus;
                 System.Exit;
            end;

            //카드번호 중복체크
            Close;
            SQL.Clear;
            SQL.Add('select ''Y''  Check_flag ');
            SQL.Add('  from card.tprtcard     ');
            SQL.Add(' where cardno = :cardno  ');
            //ParamByName('cardno').AsString := Ed_CardFirst.Text + trim(Ed_Cardno.Text);
            ParamByName('cardno').AsString := trim(Ed_Cardno.Text);
            Open;

            if (Fields[0].AsString = 'Y') or (Ed_Cardno.Text = V_chipno) then
            begin
                 MessageDlg('같은 카드번호나 프로그램번호가 존재합니다. 카드번호를 확인하십시오.', mtInformation, [mbOK], 0);
                 Ed_Cardno.SetFocus;
                 System.Exit;
            end;
            {
            if Ed_Cardno.Text = V_chipno then   //Ed_ChipFirst.Text + Ed_Chipno.Text
            begin
                 MessageDlg('같은 프로그램번호가 존재합니다. 프로그램번호를 확인하십시오.', mtInformation, [mbOK], 0);
                 Ed_Chipno.SetFocus;
                 System.Exit;
            end;
            }
            /////////////////////////////////////////////////////////////////////
            Flag := 'S';
            FrmPrintF.QuickRep1.print;
            //FM_PrintF.QuickRep1.print;

            if MessageDlg('카드가 정상적으로 인쇄 되었습니까? 정상발급일 경우 발급이력'+#13+#10+'에 추가됩니다.', mtInformation, [mbOK, mbCancel], 0)= mrOK then
            begin
                 Close;
                 SQL.Clear;
                 SQL.Add(' select to_Char(sysdate,''yyyymmddhh24miss'') curdate from dual');
                 Open;

                 V_date     := copy(FieldByName('curdate').AsString,1,8);
                 V_datetime := FieldByName('curdate').AsString;//ShowMessage(V_date);
                 V_La_Name  := La_Name.Caption;
                 V_La_Name1 := Copy(V_La_Name,1,2) + Copy(V_La_Name,5,2) + Copy(V_La_Name,9,2);

                 //발급이력테이블에 데이터를 저장한다.
                 Close;
                 SQL.Clear;
                 SQL.Add(' INSERT INTO card.tprtcard ');
                 SQL.Add(' (EMPNO, KORNAME, CARDNO, ORDERS, PRTDATE) Values');
                 SQL.Add(' ('''+E_Search.Text+''', '''+V_La_Name1+''',     ');
                 SQL.Add('  '''+Ed_Cardno.Text+''',                        '); //Ed_CardFirst.Text + Ed_Cardno.Text
                 SQL.Add('  '''+La_payra.Caption+''', '''+V_date+''')      ');
                 //ShowMessage(sql.Text);
                 ExecSQL;

                 //발급신청테이블에 데이터를 update한다.
                 Close;
                 SQL.Clear;
                 SQL.Add(' Update PZCARDAPP                                ');
                 SQL.Add('    set PRINTYN   = ''Y'',                       ');
                 SQL.Add('        PRINTDATE = '''+V_date+''',              ');
                 SQL.Add('        WRITEMAN  = '''+pempno+''',              ');
                 SQL.Add('        WRITETIME = '''+V_datetime+'''           ');
                 SQL.Add('  where APPDATE   = '''+V_appdate +'''           ');
                 SQL.Add('    and EMPNO     = '''+E_Search.Text+'''        ');
                 //ShowMessage(sql.Text);
                 ExecSQL;
            end
            else MessageDlg('취소하였습니다.', mtInformation, [mbOK], 0);

            if ((Ed_Cardno.Text <> V_cardno) and (Ed_Chipno.Text <> V_chipno)) then
            begin
                 if MessageDlg('변경된 정보를 출입시스템에 전송 하시겠습니까?', mtInformation, [mbYes, mbNo], 0) <> mrYes then Exit;

                 if V_RecordCount = 1 then
                 begin
                      Close;
                      SQL.Clear;
                      SQL.Add(' UPDATE card.tprtcardmst ');
                      SQL.Add('    SET cardno = '''+ Ed_Cardno.Text+'''');  //Ed_CardFirst.Text + Ed_Cardno.Text
                      SQL.Add('       ,chipno = '''+ Ed_Cardno.Text+'''');  //Ed_ChipFirst.Text + Ed_Chipno.Text
                      SQL.Add('       ,printyn =''Y''');
                      SQL.Add('  WHERE empno  = '''+E_Search.Text+'''');
                      ExecSQL;
                 end
                 else if V_RecordCount = 0 then
                 begin
                      V_IOLEVEL := Copy(CB_IOLEVEL.Text,1,2);
                      Close;
                      SQL.Clear;
                      SQL.Add(' INSERT INTO card.tprtcardmst ');
                      SQL.Add(' (EMPNO, CARDNO, CHIPNO, IOLEVEL, PRINTYN) Values ');
                      SQL.Add(' ('''+E_Search.Text+''',                          ');
                      SQL.Add('  '''+Ed_Cardno.Text+''',                         '); //Ed_CardFirst.Text + Ed_Cardno.Text
                      SQL.Add('  '''+Ed_Cardno.Text+''',                         '); //Ed_ChipFirst.Text + Ed_Chipno.Text
                      SQL.Add('  '''+V_IOLEVEL+''', ''Y''               )        ');
                      //ShowMessage(sql.Text);
                      ExecSQL;
                 end;

                 MessageDlg('전송 하였습니다.', mtInformation, [mbOK], 0);
            end;
       end;
  finally
       qq.Free;
  end;
end;

//출력없이 저장
procedure TFrmMain.BT_SaveClick(Sender: TObject);
var
  V_cardno, V_chipno : string;
  qq : TOraQuery;
begin
  qq := TOraQuery.Create(nil);
  qq.Session := Ora_Session;
  try
       with qq do
       begin
            Close;
            SQL.Clear;
            SQL.Add('select cardno, chipno   ');
            SQL.Add('  from card.tprtcardmst ');
            SQL.Add(' where empno =:empno    ');
            ParamByName('empno').AsString := E_Search.Text;
            Open;

            V_cardno := FieldByName('cardno').AsString;
            V_chipno := FieldByName('chipno').AsString;

            if (Ed_Cardno.Text = V_cardno) or (Ed_Cardno.Text = V_chipno) then   //Ed_CardFirst.Text + Ed_Cardno.Text
            begin
                 MessageDlg('같은 카드번호나 프로그램번호가 존재합니다. 카드번호를 확인하십시오.', mtInformation, [mbOK], 0);
                 Ed_Cardno.SetFocus;
                 System.Exit;
            end;
            {
            if Ed_Cardno.Text = V_chipno then  //Ed_ChipFirst.Text + Ed_Chipno.Text
            begin
                 MessageDlg('같은 프로그램번호가 존재합니다. 프로그램번호를 확인하십시오.', mtInformation, [mbOK], 0);
                 Ed_Chipno.SetFocus;
                 System.Exit;
            end;
            }

            //if ((Ed_CardFirst.Text + Ed_Cardno.Text <> V_cardno) and (Ed_ChipFirst.Text + Ed_Chipno.Text <> V_chipno)) then
            if ((Ed_Cardno.Text <> V_cardno) and (Ed_Cardno.Text <> V_chipno)) then
            begin
                 if MessageDlg('변경된 정보를 출입시스템에 전송 하시겠습니까?', mtInformation, [mbYes, mbNo], 0) <> mrYes then Exit;

                 Close;
                 SQL.Clear;
                 SQL.Add(' UPDATE card.tprtcardmst                 ');
                 SQL.Add('    SET cardno = '''+Ed_Cardno.Text+'''  ');  //Ed_CardFirst.Text + Ed_Cardno.Text
                 SQL.Add('       ,chipno = '''+Ed_Cardno.Text+'''  ');  //Ed_ChipFirst.Text + Ed_Chipno.Text
                 SQL.Add('  WHERE empno  = '''+E_Search.Text+'''   ');
                 ExecSQL;
            end;

            MessageDlg('전송 하였습니다.', mtInformation, [mbOK], 0);
       end;
  finally
       qq.Free;
  end;
end;

//사원증 뒷면 인쇄
procedure TFrmMain.BT_BackPClick(Sender: TObject);
begin
  FrmPrintT := TFrmPrintT.Create(Self);
  FrmPrintT.QuickRep1.print;
end;

//사원 조회
procedure TFrmMain.BT_EmpSearchClick(Sender: TObject);
begin
  FrmSawon := TFrmSawon.Create(Self);
  FrmSawon.ShowModal;
end;

//직접입력
procedure TFrmMain.BT_DirectClick(Sender: TObject);
begin
  FrmInput := TFrmInput.Create(Self);
  FrmInput.ShowModal;
end;

//임시출입증
procedure TFrmMain.BT_ImsiClick(Sender: TObject);
begin
  FG_Gubun := 'imsi';
  FrmImsi  := TFrmImsi.Create(Self);
  FrmImsi.ShowModal;
end;

//방문증(임시출입증 폼으로 통합)..
procedure TFrmMain.BT_VisitClick(Sender: TObject);
begin
  FG_Gubun := 'visit';
  FrmImsi  := TFrmImsi.Create(Self);
  FrmImsi.ShowModal;
end;

//카드정보변경 버튼
procedure TFrmMain.BT_CardModifyClick(Sender: TObject);
begin
  FrmInfo := TFrmInfo.Create(Self);
  FrmInfo.ShowModal;
end;

//발급이력조회
procedure TFrmMain.BT_HisSearchClick(Sender: TObject);
begin
  FrmHis := TFrmHis.Create(Self);
  FrmHis.OnEdit_Sabun.Text  :=   E_Search.text;
(* 2011.11.15 노사협력팀요청 >> 김현순M 통화승인 : HeeYong
  if (Mainform.PGroupId = 'G042') then
     begin
       FrmHis.BT_DEL.Enabled := False;
     end;
*)
  FrmHis.ShowModal;
end;

procedure TFrmMain.BT_CloseClick(Sender: TObject);
begin
  Close;
end;


procedure TFrmMain.Ed_ChipnoChange(Sender: TObject);
begin
     Ed_Cardno.Text := Ed_Chipno.Text;
end;

procedure TFrmMain.Ed_CardnoChange(Sender: TObject);
begin
     Ed_Chipno.Text := Ed_Cardno.Text;
end;

procedure TFrmMain.BT_Excel1Click(Sender: TObject);
var XL, XArr: Variant;
    i,j,k,Cap_empno: integer;
    SavePlace: TBookmark;
begin
  with OraQuery1 do
  begin
    close;
    Sql.Clear;
    Sql.Text := ' Select B.Empno   사번, B.Korname 성명,       ' + #13
              + ' ltrim(to_char(Cardno, ''00000000'')) Cardno, ' + #13
              + ' ltrim(to_char(Chipno, ''00000000'')) Chipno  ' + #13
              + ' From Card.Tprtcardmst A, Pimpmas B           ' + #13
              + ' Where A.Empno = B.Empno                      ' + #13
              + ' And B.Pstate < ''80''                        ' + #13
              + ' Order By B.Empno                             ' ;
    open;
  end;
  if OraQuery1.RecordCount < 1 then
  begin
       showmessage('엑셀 변환할 자료가 없습니다.');
       exit;
  end;

  XArr := VarArrayCreate([1, OraQuery1.Fields.Count], VarVariant); //Gird 출력시
  try
      XL := CreateOLEObject('Excel.Application');
  except
      MessageDlg('Excel이 설치되어 있지 않습니다.', MtWarning, [mbok], 0);
      Exit;
  end;

  XL.WorkBooks.Add; //새로운 페이지 생성
  XL.Visible := false;
  XL.WorkSheets[1].Name := '카드번호';

  //컬럼명 지정_서브타이블 지정
  for i := 1 to OraQuery1.Fields.Count do
  begin
    if OraQuery1.Fields[i-1].FullName = '사번' then Cap_empno := i;
      XArr[i]  := OraQuery1.Fields[i-1].FullName;
  end;

  XL.Range['A1' , CHR(64 + OraQuery1.Fields.Count)+'1'].Value := XArr;  //Gird 출력시
  k := 1;
  for i := 1 to OraQuery1.Fields.Count do     //Gird 출력시
  begin
       XL.Range[CHR(64 + i) + '1'].HorizontalAlignment := 3;
       XL.Range[CHR(64 + i) + '1'].Interior.Color:= $00CBF0B3;
       XL.Range[CHR(64 + i) + '1'].font.Size := 9;
       XL.Range[CHR(64 + i) + '1'].font.Bold := True;
  end;

  //검색된 자료를 excel에 export처리 시킨다.
  SavePlace := OraQuery1.GetBookmark;
  OraQuery1.DisableControls;
  OraQuery1.First;

  for i := 1 to  OraQuery1.RecordCount do
  begin
    for j := 1 to OraQuery1.Fields.Count do
    begin
      if  (j  = Cap_empno) or (j = 15) or (j = 16) then   //사원번호 칼럼에 ' 문자 넣어주기 위해.
        XArr[j]  := ''''+OraQuery1.Fields[j-1].AsString
      else XArr[j]  := ''''+OraQuery1.Fields[j-1].AsString;
      end;
      XL.Range['A' + IntToStr(k+1), CHR(64 + OraQuery1.Fields.Count) + IntToStr(k+1)].Value := XArr;
      inc(k);
      OraQuery1.Next;
  end;

  //여기서 부터는 EXPORT된 EXCEL자료를 예쁘게 꾸미는 부분입니다.
   XL.Range['A1', CHR(64 + OraQuery1.Fields.Count) + IntToStr(k)].Borders.LineStyle := 1;    //테두리선을 만든다.  1은 실선
   XL.Range['A1', CHR(64 + OraQuery1.Fields.Count) + IntToStr(k)].Borders.Weight := 2;       //테두리선 두깨 설정  2는 보통두깨, 3은 무지 두꺼움
   XL.Range['A1', CHR(64 + OraQuery1.Fields.Count) + IntToStr(k)].Borders.ColorIndex := 1;   //테두리선 색상설정  1은 검은색
   XL.Range['A1', CHR(64 + OraQuery1.Fields.Count) + IntToStr(k)].font.name := '굴림체';
   XL.Range['A1', 'A1'].HorizontalAlignment := 3;               //가운데 정렬
   XL.Range['A2', CHR(64 + OraQuery1.Fields.Count) + IntToStr(k)].font.Size := 9;
   XL.Range['A2', CHR(64 + OraQuery1.Fields.Count) + IntToStr(k)].HorizontalAlignment := 2;  //좌측정렬
   XL.Range['A1', CHR(64 + OraQuery1.Fields.Count) + IntToStr(k)].Select;                    //자료를 모두 SELECT한 후 --하는 이유:  AutoFit 처리하기 위해서임
   XL.Selection.Columns.AutoFit;                                //자동정렬
   XL.Range['A2', 'A2'].Select;                                 //A2열에 커서 위치시킴
   XL.Visible := true;                                          //엑셀자료 보여줌
   Screen.Cursor := crDefault;
   OraQuery1.GotoBookmark(SavePlace);
   OraQuery1.FreeBookmark(SavePlace);
   OraQuery1.EnableControls;
end;

end.
