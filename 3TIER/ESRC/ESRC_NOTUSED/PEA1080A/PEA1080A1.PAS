unit PEA1080A1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OnScheme, ExtCtrls, OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl,
  OnPopupEdit, ComCtrls, OnDBGrid, OnEditCombo, StdCtrls, OnFocusButton,
  Db, Tmax_DataSetText, Tmax_session, MemDS, DBAccess, Ora, OnInsaCommon,
  OnGrDBGrid, OnDeptEdit, Grids, DBGrids, TMaxFunc, Func, OnShapeLabel;

type
  TFM_Main = class(TForm)
    SF_Main: TOnSchemeForm;
    Panel1: TPanel;
    SB_Help: TStatusBar;
    BT_Find: TOnFocusButton;
    BT_Close: TOnFocusButton;
    E_Paycl: TOnComboEdit;
    DataSource1: TDataSource;
    TMaxSession: TTMaxSession;
    QR_Grid: TTMaxDataSet;
    OnGrDbGrid1: TOnGrDbGrid;
    OnFocusButton1: TOnFocusButton;
    E_empno: TOnWinPopupEdit;
    E_Deptcode: TOnWinPopupEdit;
    QR_Common: TTMaxDataSet;
    QR_pimpmas: TTMaxDataSet;
    OnFocusButton2: TOnFocusButton;
    E_LoginEmp: TOnEdit;
    RB1: TRadioButton;
    RB2: TRadioButton;
    OnShapeLabel1: TOnShapeLabel;
    procedure FormCreate(Sender: TObject);
    procedure BT_FindClick(Sender: TObject);
    procedure BT_CloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure PL_Com_Contructor;
    procedure E_empnoCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure E_empnoInitPopup(Sender: TObject);
    procedure E_DeptcodeCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure E_DeptcodeInitPopup(Sender: TObject);
    procedure E_empnoKeyPress(Sender: TObject; var Key: Char);
    procedure OnFocusButton1Click(Sender: TObject);
    procedure E_PayclChange(Sender: TObject);
    procedure E_LoginEmpKeyPress(Sender: TObject; var Key: Char);
    procedure OnFocusButton2Click(Sender: TObject);
    procedure OnGrDbGrid1DblClick(Sender: TObject);
    procedure RB1Click(Sender: TObject);
  private
    { Private declarations }
    vFindDept : String;
    vFindEmp  : Boolean;

  public
    { Public declarations }
    vLoginEmp : String; //최초 로그인 사번.
    FG_Empno : String; //Login
    FG_Payra : String; //Login
    FG_Grade : String; //Login
    FG_Dept  : String; //Login
    vRabasdate, vRabasdate1, vRabasdate2, vRabasdate3 : String;
  end;

var
  FM_Main: TFM_Main;

implementation

uses PEA1080A_Dept, PEA1080A_Emp, PEA1080A2;

{$R *.DFM}


procedure TFM_Main.PL_Com_Contructor;
begin
  with QR_Common do
  begin
       Close;
       ServiceName := 'HINSA_select';
       ClearFieldInfo;
       AddField('field1'  , ftString, 100);
       AddField('field2'  , ftString, 100);
       AddField('field3'  , ftString, 100);
       AddField('field4'  , ftString, 100);
       AddField('field5'  , ftString, 100);
       Sql.Clear;
  end;
end;

procedure TFM_Main.BT_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFM_Main.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFM_Main.FormCreate(Sender: TObject);
begin
  SB_Help.Panels[1].Text := '기초 데이타 설정중입니다... 잠시만 기다리세요...';
  SB_Help.Perform(WM_PAINT,0,0);

  ///////////////////////////////////////////////////////////////////////
  TMaxSession.EnvFileName := GetHomeDir+'\newhana.env';
  TMaxSession.LabelName   := 'HANAROHPER';
  TMaxSession.Connect  := False;
  TMaxSession.Host     := Hinsa_Param(cmdline,10);
  TMaxSession.Port     := '9999';

  try
    TMaxSession.Connect := True;
  except
    //Application.MessageBox(PChar(TMaxSession.HeaderPacket),'에러',mb_ok);
    Showmessage('Error Code : ' + TMaxSession.HeaderPacket.ErrorCode + #13 + #13 +
                'Error Msg  : ' + TMaxSession.HeaderPacket.ErrorMsg  + #13 + #13 +
                '관리자에게 문의하십시오.');
    Application.Terminate;
    Exit;
  end;

  //2013.11. Add 파라미터와 비교하여 암호 다르면 접속 막음.
  FM_Tmax := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := TMaxSession;
  if FM_Tmax.PassWordChk(Hinsa_Param(cmdline,1), Hinsa_Param(cmdline,3)) = 0 then
    Application.Terminate;
  ///////////////////////////////////////////////////////////////////////
  vLoginEmp := Hinsa_Param(CmdLine,1);
  FG_Empno  := Hinsa_Param(CmdLine,1);

  E_LoginEmp.Visible := False;
  vFindEmp := False;

  SB_Help.Panels[1].Text := '';
end;

procedure TFM_Main.FormShow(Sender: TObject);
begin
  E_paycl.Items.Clear;

  with QR_Common do
  begin
       PL_Com_Contructor;
       Sql.Add('Select Codeno ||'' - ''|| CodeName F1,'''','''','''','''' ');
       Sql.Add('  From Pyccode                                            ');
       Sql.Add(' Where Useyn = ''Y''                                      ');
       Sql.Add('   And Codeid = ''I112''                                  ');
       Sql.Add('   And Codeno Between ''C11'' and ''D31''                 ');
       Sql.Add(' Order by codeno                                          ');
       Open;

       QR_Common.First;
       while not QR_Common.Eof do
       begin
            E_Paycl.Items.Add(FieldByName('field1').AsString);
            Next;
       end;

       PL_Com_Contructor;
       Sql.Add('Select Deptcode, Jobdept, Payra, '''', '''' ');
       Sql.Add('  From Pimpmas                              ');
       Sql.Add(' Where empno = '''+ FG_Empno +'''           ');
       Open;

       vFindDept := Fields[0].AsString;
       FG_Dept   := Fields[0].AsString;
       FG_Payra  := Fields[2].AsString;

       if FG_Empno = 'M141' then FG_dept   := ''; //사장님은 전체 조회권한.
       if FG_Empno = 'M141' then vFindDept := '';

       PL_Com_Contructor;
       Sql.Add('Select grade, groupid, empno, '''', ''''    ');
       Sql.Add('  From Pymenuuser                           ');
       Sql.Add(' Where empno = '''+ FG_Empno +'''           ');
       Open;
       FG_Grade := Fields[0].AsString;

       //평가기준일 불러오기
       PL_Com_Contructor;
       SQL.Text := 'SELECT Value1,Value2,Value3,Value4,Value5 '+
                   '  FROM pehrebas                           '+
                   ' WHERE rabasdate = ''00000000''           '+
                   '   AND gubun     = ''00''                 '+
                   '   AND sgubun    = ''0001''               ';
       Open;
       vRabasdate  := Fields[0].AsString;   /// 현평가기준일
       vRabasdate3 := Fields[3].AsString;   /// 전년도평가기준일 --> 계속 열어놓음...
       vRabasdate1 := IntToStr(Strtoint(Copy(vRabasdate3,1,4))-2)+Copy(vRabasdate3,5,4);
       vRabasdate2 := IntToStr(Strtoint(Copy(vRabasdate3,1,4))-1)+Copy(vRabasdate3,5,4);
  end;

  SB_Help.Panels[1].Text := '원하는 검색조건을 입력하시면 본부내 구성원을 조회 가능합니다.';
    
  if  (Copy(vLoginEmp,1,1) = 'D') or (vLoginEmp = '2292') or (vLoginEmp = '0970') or (vLoginEmp = '2507') then  //최초 로그인 사번(관리자)
  begin
       E_LoginEmp.Visible  := True;
       Exit;
  end;

  if  ( (FG_Payra > 'A87') or (FG_Empno = '0694')) then //오두영 원장 제외.
  begin
       ShowMessage('사용권한이 부족합니다.  프로그램을 종료합니다.');
       if vLoginEmp = FG_Empno then Close;
  end;
end;

procedure TFM_Main.BT_FindClick(Sender: TObject);
begin
  with QR_Grid do
  begin
       Close;
       ServiceName := 'HINSA_select10';
       ClearFieldInfo;
       AddField('empno'   , ftString, 100);
       AddField('korname' , ftString, 100);
       AddField('deptname', ftString, 100);
       AddField('band'    , ftString, 100);
       AddField('payclyy' , ftString, 100);
       AddField('empdate' , ftString, 100);
       AddField('hanaduyy', ftString, 100);
       AddField('Grade1'  , ftString, 100);
       AddField('Grade2'  , ftString, 100);
       AddField('Grade3'  , ftString, 100);
       Sql.Clear;
       Sql.Add('select M.empno, M.korname,                                                                          ');
       Sql.Add('       Decode(Z.deptname, '''',(select deptname from pycdept where orgnum=M.orgnum and deptcode= m.deptcode), Z.deptname),');
       Sql.Add('       (select codename from pyccode where codeid=''I112'' and codeno  = m.paycl   ) BAND,          ');
       Sql.Add('       payclyy+decode(sign(payclmm-1),-1,0,1) payclyy,                                              ');
       Sql.Add('       Substr(orgempdate,1,4)||''-''||Substr(orgempdate,5,2)||''-''||Substr(orgempdate,7,2) empdate,');
       Sql.Add('       hanaduyy+decode(sign(hanadumm-1),-1,0,1) hanaduyy,                                           ');
       Sql.Add('       (select FINALGRADE from pehevhis where empno = M.empno and rabasyear = ''2008'') Grade1,     ');
       Sql.Add('       (select FINALGRADE from pehevhis where empno = M.empno and rabasyear = ''2009'') Grade2,     ');
       Sql.Add('       (select FINALGRADE from pehevhis where empno = M.empno and rabasyear = ''2010'') Grade3,     ');
       Sql.Add('       Paycl,  Decode(Z.deptcode,'''',M.deptcode,Z.deptcode)                                        ');
       Sql.Add('  from pimpmas M, PZDEPTH15 Z                                                                       '); //PZDEPTH15 대외파견자 원소속 상위자에게 보이도록
       Sql.Add(' where pstate < ''80''                                                                              ');
       Sql.Add('   and paycl between ''C11'' and ''D31''                                                            ');
       Sql.Add('   and M.empno = Z.empno(+)                                                                         ');
       Sql.Add('   and M.empno not in (Select empno from PESKNMAS)                                                  ');

       if   IsNumber(Copy(Trim(E_Empno.Text),1,4)) then
            Sql.Add('   and M.empno   = '''+ Copy(E_Empno.Text,1,4)     +'''                                        ')
       else if Trim(E_Empno.Text) <> '' then
            Sql.Add('   and M.Korname Like '''+ E_Empno.Text  +'''  || ''%''                                        ');

       if  vFindDept <> '' then
       begin
            Sql.Add('   AND (Decode(Z.deptcode,'''',M.deptcode,Z.deptcode) like replace('''+vFindDept + ''' ,''0'','''') || ''%''                        ');
            Sql.Add('      Or JobDept like replace('''+vFindDept + ''' ,''0'','''') || ''%'' )                      ');
       end;

       if  E_Paycl.Text <> '' then
       Sql.Add('   and Paycl = '''+ Copy(E_Paycl.Text,1,3)       +'''                                               ');

       Sql.Add(' Union   ');  //SK Networks 전임자.
       Sql.Add('select M.empno, M.korname,                                                                          ');
       Sql.Add('      (select deptname from pycdept where orgnum=M.orgnum and deptcode= m.deptcode) deptname,       ');
       Sql.Add('      (select codename from pyccode where codeid=''I112'' and codeno  = m.paycl   ) BAND,           ');
       Sql.Add('       payclyy+decode(sign(payclmm-1),-1,0,1) payclyy,                                              ');
       Sql.Add('       Substr(GroupEmpdate,1,4)||''-''||Substr(GroupEmpdate,5,2)||''-''||Substr(GroupEmpdate,7,2) , ');
       Sql.Add('       Ceil( months_between(Sysdate, to_date(GroupEmpdate,''YYYYMMDD'')) / 12 ) hanaduyy,           ');
       Sql.Add('       Grade2 Grade1, Grade3  Grade2,                                                               ');
       Sql.Add('       (select FINALGRADE from pehevhis where empno = M.empno and rabasyear = ''2010'') Grade3,     ');
       Sql.Add('       Paycl,deptcode                                                                               ');
//       Sql.Add('       Grade1, Grade2, Grade3 ,Paycl,deptcode   ');//SK 네트웍스 전적자 평가등급 2012평가시에도 수정할것
       Sql.Add('  from pimpmas M, PESKNMAS B                                                                        ');
       Sql.Add(' where pstate < ''80''                                                                              ');
       Sql.Add('   and M.empno = B.empno                                                                            ');

       if   IsNumber(Copy(Trim(E_Empno.Text),1,4)) then
            Sql.Add('   and M.empno   = '''+ Copy(E_Empno.Text,1,4)     +'''                                        ')
       else if Trim(E_Empno.Text) <> '' then
            Sql.Add('   and M.Korname Like '''+ E_Empno.Text  +'''  || ''%''                                        ');

       if  vFindDept <> '' then
       begin
            Sql.Add('   AND (Deptcode like replace('''+vFindDept + ''' ,''0'','''') || ''%''                        ');
            Sql.Add('      Or JobDept like replace('''+vFindDept + ''' ,''0'','''') || ''%'' )                      ');
       end;

       if  E_Paycl.Text <> '' then
       Sql.Add('   and Paycl = '''+ Copy(E_Paycl.Text,1,3)       +'''                                               ');

       if   RB1.Checked = True then  Sql.Add(' Order by 12, 11, 5 Desc ')
       else                          Sql.Add(' Order by 11, 5 Desc     ');     // edit1.text := sql.text;
       Open;

       if vFindEmp then
       begin
            E_empno.Text := QR_Grid.FieldByName('empno').AsString +' - '+
                            QR_Grid.FieldByName('korname').AsString;
       end;

       QR_Grid.Fields[0].Alignment := taCenter;
       QR_Grid.Fields[1].Alignment := taCenter;
       QR_Grid.Fields[3].Alignment := taCenter;
       QR_Grid.Fields[4].Alignment := taCenter;
       QR_Grid.Fields[5].Alignment := taCenter;
       QR_Grid.Fields[6].Alignment := taCenter;
       QR_Grid.Fields[7].Alignment := taCenter;
       QR_Grid.Fields[8].Alignment := taCenter;
       QR_Grid.Fields[9].Alignment := taCenter;
  end;

  SB_Help.Panels[1].Text := '상세내역조회 버튼 클릭 또는 구성원 더블클릭시 상세한 평가결과를 열람 가능합니다.';
end;

procedure TFM_Main.E_DeptcodeInitPopup(Sender: TObject);
begin
  FM_Dept.QR_Deptcode.Session := TMaxSession;
  FM_Dept.FG_deptcode         := E_Deptcode.Text;

  TOnWinPopupEdit(Sender).PopupControl := FM_Dept;
  FM_Dept.Edit        := TOnWinPopupEdit(Sender);
  FM_Dept.BE_Key.text := '';
  FM_Dept.PG_Get_Dept;
  E_empno.Text        := '';
end;

procedure TFM_Main.E_DeptcodeCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
var
  FL_Text : String;
begin
  FL_Text := TOnWinPopupEdit(Sender).Text;
  if Accept then
  begin
       TOnWinPopupEdit(Sender).Hint := FM_Dept.QR_Deptcode.FieldByName('deptname').AsString + ' ' +
                                       FM_Dept.QR_Deptcode.FieldByName('deptna3').AsString;
       TOnWinPopupEdit(Sender).Text := FM_Dept.QR_Deptcode.FieldByName('deptname').AsString;
       vFindDept                    := FM_Dept.QR_Deptcode.FieldByName('deptcode').AsString;
       Accept := False;
  end;
  TOnWinPopupEdit(Sender).PopupControl := nil;

  vFindEmp := False;
  BT_FindClick(Self);
end;

procedure TFM_Main.E_empnoCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
var
  FL_Text : String;
  tmp_key : char;
begin
  tmp_key := #13;
  FL_Text := TOnWinPopupEdit(Sender).Text;
  if Accept then
  begin
       TOnWinPopupEdit(Sender).Text := FM_empno.QR_pimpmas.FieldByName('empno').AsString +' - '+
                                       FM_empno.QR_pimpmas.FieldByName('korname').AsString;
       E_empnoKeyPress(Sender, tmp_key);
       Accept := False;
  end;
  TOnWinPopupEdit(Sender).PopupControl := nil;

  BT_FindClick(Self);
end;

procedure TFM_Main.E_empnoInitPopup(Sender: TObject);
begin
  FM_empno.Insa_Session := TMaxSession;
  FM_empno.Edit         := TOnWinPopupEdit(Sender);
  TOnWinPopupEdit(Sender).PopupControl := FM_empno;
  FM_empno.Part_search;
end;

procedure TFM_Main.E_empnoKeyPress(Sender: TObject; var Key: Char);
begin
  if  (Key = #13) then
  begin
       Key := #0;
       BT_FindClick(Self);
   end;
end;

procedure TFM_Main.OnFocusButton1Click(Sender: TObject);
begin
  E_empno.Text      := '';
  E_Deptcode.Text   := '';
  E_Paycl.ItemIndex := -1;
end;

procedure TFM_Main.E_PayclChange(Sender: TObject);
begin
  BT_FindClick(Self);
end;

procedure TFM_Main.E_LoginEmpKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
       Key := #0;
       FG_Empno := E_LoginEmp.Text;
       FormShow(Sender);
  end;
end;

procedure TFM_Main.OnFocusButton2Click(Sender: TObject);
begin
  FM_Result.ShowModal;
end;

procedure TFM_Main.OnGrDbGrid1DblClick(Sender: TObject);
begin
  FM_Result.ShowModal;
end;

procedure TFM_Main.RB1Click(Sender: TObject);
begin
  BT_FindClick(Sender);
end;

end.
