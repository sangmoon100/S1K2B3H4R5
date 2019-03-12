{header.
--------------------------------------------------------------------------------
PROGRAM-NAME    :  PZD1020A(사원증 발급신청)
SYSTEM-NAME     : 종합인사정보
SUBSYSTEM-NAME  : 인사
Programmer      : jissi
Version         : 1.00
Date            : 2008.06.27
Update contents
}

unit PZD10201;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ComCtrls, Db, Tmax_DataSetText, numedit,
  Mask, Grids, DBGrids, OnFocusButton, OnScheme, OnEditNumCtl,
  OnEditStdCtrl, OnEditBaseCtrl, OnEditBtnCtrl, OnEditCombo, OnGrDBGrid,
  OnShapeLabel, OnInsaCommon, Tmax_session, TmaxFunc, OnPopupEdit;

const CodeErr='에러';
type
  TMainForm = class(TForm)
    SF_Main: TOnSchemeForm;
    PA_MainPanel: TPanel;
    Panel1: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    BBexit: TOnFocusButton;
    Shape6: TShape;
    BBdel: TOnFocusButton;
    BBsave: TOnFocusButton;
    BBcancel: TOnFocusButton;
    TDBSet1: TTMaxDataSet;
    TDml: TTMaxDataSet;
    T_Grid: TTMaxDataSet;
    DataSource1: TDataSource;
    T_sysdate: TTMaxDataSet;
    DbGrid1: TOnGrDbGrid;
    Epayraname: TOnShapeLabel;
    Shape8: TShape;
    Shape9: TShape;
    Label4: TLabel;
    Shape2: TShape;
    Label2: TLabel;
    SB_Help: TStatusBar;
    TMaxSession: TTMaxSession;
    Shape11: TShape;
    Etel: TOnEdit;
    ED_empno: TOnWinPopupEdit;
    EPayclname: TOnShapeLabel;
    EDeptname: TOnShapeLabel;
    Edit1: TEdit;
    Panel2: TPanel;
    B_PanelClose: TOnFocusButton;
    Shape1: TShape;
    Label3: TLabel;
    Label1: TLabel;
    EAppSayu: TOnComboEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure BBexitClick(Sender: TObject);
    procedure BBdelClick(Sender: TObject);
    procedure BBsaveClick(Sender: TObject);
    procedure BBcancelClick(Sender: TObject);
    procedure RBcertdateClick(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure ED_empnoCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure ED_empnoInitPopup(Sender: TObject);
    procedure ED_empnoKeyPress(Sender: TObject; var Key: Char);
    procedure EAppSayuggKeyPress(Sender: TObject; var Key: Char);
    procedure B_PanelCloseClick(Sender: TObject);

  private
    { Private declarations }
    procedure DataClear1;
    Procedure DataIns;
    Procedure DataUpdate;
    procedure DataDel;
    procedure LoadData1;
    procedure EmpnoFind;

  public
    { Public declarations }
    GSsysdate : String[15];    //Host Date
    GSempno   : String[4];     //Login 사번
    GSkorname : String[12];    //Login 성명
    GSpass    : String;        //비밀번호
    GSgrade   : String;        //등급
    GSgroup   : String;        //유저그룹
    Act_flag  : Boolean;
    SqlText   : String;
    chk       : Boolean;
    ZMANAGER  : String;        //임원관리자

    Function  Get_CodeName(Acodeid, Acodeno  : String ) : String;

  end;

var
  MainForm  : TMainForm;
  SAPPdate  : String;
  SaveBy    : Integer;

implementation

uses PZD1020A_emp;

{$R *.DFM}

procedure TMainForm.FormCreate(Sender: TObject);
begin
  Act_flag  := True;
//  Pan_Alram.Visible := True;  //년초에 연말정산 결과전에만 보여줌
end;

{작업후 등 프로그램 관리 화면을 지운다.........................................}
procedure TMainForm.DataClear1;
begin
  chk             := True;
  EAppSayu.Text   := '';
  ETel.Text       := '';
end;

procedure TMainForm.LoadData1;
var
  Tem : String;
begin

    Tem := 'Select APPDATE, APPSAYU,   TEL,      APPEMP,                        '+#13+
           '       (Select Korname from pimpmas where empno = a.APPEMP) APPNAME,'+#13+
           '       PRINTYN, PRINTDATE                                           '+#13+
           '       from PZCardApp a                                             '+#13+
           format('WHERE (EMPNO = ''%s'') ',[Ed_empno.hint])                     +#13+
           ' Order by APPDATE  Desc                                             ';

    with T_Grid do
    begin
      Close;
      ClearFieldInfo;
      AddField('APPDATE'     , ftString,   8);
      AddField('APPSAYU'     , ftString,  30);
      AddField('TEL'         , ftString,  15);
      AddField('APPEMP'      , ftString,   4);
      AddField('APPNAME'     , ftString,  12);
      AddField('PRINTYN'     , ftString ,  1);
      AddField('PRINTDATE'   , ftString,   8);
      Sql.Clear;
      ServiceName := 'PZD1020A_sel1';
      Sql.Text := Tem;
      Open;
      FieldByName('APPDATE'  ).EditMask := '!9999-99-99;0;_';
      FieldByName('PRINTDATE').EditMask := '!9999-99-99;0;_';
    end;
    if T_Grid.RecordCount < 1 then SaveBy := 1;

end;

{종료 버튼을 눌렀을때..........................................................}
procedure TMainForm.BBexitClick(Sender: TObject);
begin
  Close;
end;

{취소 버튼을 눌렀다............................................................}
procedure TMainForm.BBcancelClick(Sender: TObject);
begin
  SB_Help.Panels[1].text := '';
  DataClear1;
end;

{ 해당 자료를 Insert 하는 내용.................................................. }
Procedure TMainForm.DataIns;
var
  Tem : String;
begin
     if EAppSayu.text = '' then
     begin
        MessageBox(handle,'발급사유를 입력하세요 ..','작업안내',MB_ICONWARNING);
        EAppsayu.SetFocus;
        exit;
     end;


     Tem := 'Select APPDATE, APPSAYU,   TEL,      APPEMP,                        '+#13+
            '       (Select Korname from pimpmas where empno = a.APPEMP) APPNAME,'+#13+
            '       PRINTYN, PRINTDATE                                           '+#13+
            '       from PZCardApp a                                             '+#13+
            format('WHERE (EMPNO   = ''%s'') ',[Ed_empno.hint])                   +#13+
            format('  AND (APPDATE = ''%s'') ',[Copy(GSsysdate,1,8)])             ;

     with TDBSet1 do
     begin
       Close;
       ClearFieldInfo;
       AddField('APPDATE'     , ftString,   8);
       AddField('APPSAYU'     , ftString,  30);
       AddField('TEL'         , ftString,  15);
       AddField('APPEMP'      , ftString,   4);
       AddField('APPNAME'     , ftString,  12);
       AddField('PRINTYN'     , ftString ,  1);
       AddField('PRINTDATE'   , ftString,   8);
       Sql.Clear;
       Sql.Text := tem;
       ServiceName := 'PZD1020A_sel1';
       open;

       if TDBSet1.RecordCount > 0 then
       begin
           MessageBox(handle,'기존 자료가 이미 있습니다..','작업안내',MB_ICONWARNING);
           TDBSet1.Close;
           System.Exit;
       end;

       Close;
  end;

  Tem := format('INSERT INTO PZCardApp                                      '+#13+
                '          ( APPDATE, EMPNO, KORNAME,                       '+#13+
                '            PAYCL,PAYRA,                                   '+#13+
	        '            APPSAYU, TEL, APPEMP, PRINTYN,                 '+#13+
	        '            WRITEMAN, WRITETIME )                          '+#13+
                '   VALUES ( ''%s'', ''%s'', ''%s'',                        '+#13+
                '            ''%s'', ''%s'',                                '+#13+
                '            ''%s'', ''%s'', ''%s'',''N'',                  '+#13+
                '            ''%s'', ''%s'')                                ',
                [            SAppdate,
                             Copy(ED_empno.Hint,1,4),
                             Copy(ED_empno.text,8,Length(ED_empno.Text)),
                             EPayclname.Hint, EPayraname.Hint,
                             copy(EAppSayu.text,4,length(EAppSayu.text)),
                             ETel.Text, GSempno,
                             GSempno, GSsysdate                             ]);
  with TDml do
  begin
       Close;
       Sql.clear;
       edit1.text := tem;
       Sql.text := Tem;

       ServiceName := 'PZD1020A_dml';
       if not Execute then
       begin
            Application.Messagebox('신청작업이 실패했습니다.','작업안내',mb_ok+ mb_IconStop);
       end
       else
            MessageBox(handle,'신청되었습니다..','작업안내',MB_ICONINFORMATION);
  end;

end;

{ 해당 자료를 Update 하는 내용.................................................}
Procedure TMainForm.DataUpdate;
var
  Tem : String;
begin
  if  (T_Grid.FieldByName('PrintYN').AsString = 'Y') then
  begin
       Application.Messagebox('이미 발급된 자료를 수정할 수 없습니다.','작업안내',mb_ok+ mb_IconStop);
       exit;
  end;

  if (T_Grid.FieldByName('AppEmp').AsString <> GSempno) then
  begin
       Application.Messagebox('신청자와 작업자가 달라서 자료를 수정할 수 없습니다.','작업안내',mb_ok+ mb_IconStop);
       exit;
  end;

  Tem := 'UPDATE PZCardApp SET                                                  '+#13+
         '       APPSAYU   ='''+copy(EAppSayu.text,4,length(EAppSayu.text))+''','+#13+
         '       TEL       ='''+ETel.text+''',                                  '+#13+
         '       APPEMP    ='''+GSempno+''',                                    '+#13+
         '       WRITETIME ='''+GSsysdate+''',                                  '+#13+
         '       WRITEMAN  ='''+GSempno+'''                                     '+#13+
         ' WHERE (EMPNO    ='''+Ed_empno.Hint+''')                              '+#13+
         '   AND (APPDATE  ='''+SAppdate+'''     )                              '+#13+
         '   AND (PrintYN  =''N''                )                              ';
  with TDml do
    begin
      Close;
      Sql.Clear;
      Sql.text := Tem;
      edit1.Text := tem;
      ServiceName := 'PZD1020A_dml';
      if not Execute then
      begin
          Application.Messagebox('신청작업이 실패했습니다.','작업안내',mb_ok+ mb_IconStop);
      end
      else
            MessageBox(handle,'신청되었습니다..','작업안내',MB_ICONINFORMATION);
    end;
end;

{ 해당 자료를 Update 하는 내용.................................................}
procedure TMainForm.DataDel;
var
  Tem : String;
begin

  if  (T_Grid.FieldByName('PrintYN').AsString = 'Y') then
  begin
       Application.Messagebox('이미 발급된 자료를 삭제할 수 없습니다.','작업안내',mb_ok+ mb_IconStop);
       exit;
  end;

  if not ((GSgroup = 'G001') or (GSgroup = 'G011'))     and
     (T_Grid.FieldByName('AppEmp').AsString <> GSempno) then
  begin
       Application.Messagebox('신청자와 작업자가 달라서 자료를 삭제할 수 없습니다.','작업안내',mb_ok+ mb_IconStop);
       exit;
  end;

  SAppdate := DbGrid1.Fields[0].AsString;

  Tem := 'DELETE FROM PZCardApp                                   '+
         ' WHERE (EMPNO   ='''+ED_empno.Hint+''')                 '+
         '   AND (APPDATE ='''+SAppdate+'''     )                 '+
         '   AND (PrintYN =''N''                )                 ';

  with TDml do
    begin
      Close;
      Sql.Clear;
      Sql.text := Tem;
      ServiceName := 'PZD1020A_dml';
      if not Execute then
        begin
          Application.Messagebox('삭제에 실패했습니다.','작업안내',mb_ok+ mb_IconStop);
        end;
    end;
end;

procedure TMainForm.BBsaveClick(Sender: TObject);
begin

  if Trim(EAppSayu.Text) = '' then
  begin
     MessageBox(handle,'신청사유를 선택하세요 ..','작업안내',MB_ICONWARNING);
     Etel.SetFocus;
     exit;
  end;

  if Trim(Etel.Text) = '' then
  begin
     MessageBox(handle,'전화번호를 입력하세요 ..','작업안내',MB_ICONWARNING);
     Etel.SetFocus;
     exit;
  end;

  if Application.MessageBox('※   본인의 귀책사유로 인해 사원증을 재발급 하시는 경우에는'+#13+#13+
                            '재발급을 위한 실비 일만원(10,000원)을 카드수령시 납부하셔야 합니다.'+#13+#13+
                            '그래도 신청하시겠습니까 ?', '작업안내', MB_OKCANCEL + MB_DefButton1) = IDOK then
  begin
      if SaveBy = 0 then
      begin
           DataUpdate;
      end
      else
      begin
           DataIns;
           SaveBy := 0;
      end;
  end
  else
      system.exit;

  Loaddata1;
  DataClear1;
end;

procedure TMainForm.BBdelClick(Sender: TObject);
begin
  SB_Help.panels[1].text := '';

  if Application.MessageBox('삭제하시겠습니까 ?', '작업안내', MB_OKCANCEL + MB_DefButton1) = IDOK then
    begin
      DataDel;
      Loaddata1;
    end;
end;

procedure TMainForm.RBcertdateClick(Sender: TObject);
begin
  LoadData1;
end;

Function  TMainForm.Get_CodeName( Acodeid,Acodeno  : String ) : String;
begin
  Result := '';
  if Trim(Acodeno) = '' then  System.Exit;
  FM_Tmax           := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := TMaxSession;
  Result            := FM_Tmax.GetData('codename' ,Acodeid,Acodeno);
end;

procedure TMainForm.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  IF DbGrid1.Fields[0].AsString = SAppdate then
       SaveBy := 0
  else
       SaveBy := 1;
end;

//FormActivate 있던 내용 옮김. 2000.12.27 yhs
procedure TMainForm.FormPaint(Sender: TObject);
begin
  Self.OnPaint := Nil;
  SF_Main.Refresh;
  Application.ProcessMessages;
  SB_Help.Panels[1].Text := '인사시스템에 접속 중입니다...';

  ///////////////////////////////////////////////////////////////////////
  TMaxSession.EnvFileName := GetHomeDir+'\newhana.env';
  TMaxSession.LabelName   := 'HANAROHPER';
  TMaxSession.Connect  := False;
  TMaxSession.Host     := Hinsa_Param(cmdline,10);
  TMaxSession.Port     := '9999';

  try
    TMaxSession.Connect := True;
  except
    Application.MessageBox(PChar('APP서버 접속 실패'),'에러',mb_ok);
    Application.Terminate;
    Exit;
  end;

  //2013.11. Add 파라미터와 비교하여 암호 다르면 접속 막음.
  FM_Tmax := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := TMaxSession;
  if FM_Tmax.PassWordChk(Hinsa_Param(cmdline,1), Hinsa_Param(cmdline,3)) = 0 then
    Application.Terminate;
  ///////////////////////////////////////////////////////////////////////

  SB_Help.Panels[1].Text := '';

  if Act_flag = False then
    exit;
  Act_flag  := False;
  Application.ProcessMessages;

  GSempno   := Hinsa_Param(CmdLine, 1);
  GSkorname := Hinsa_Param(CmdLine, 2);
  GSpass    := Hinsa_Param(CmdLine, 3);
  GSgrade   := Hinsa_Param(CmdLine, 4);

  T_sysdate.Open;
  GSsysdate := T_sysdate.FieldByName('sysdate').AsString;
  T_sysdate.Close;

  ZMANAGER := '';
  with  TDBSet1  do
  begin
    Close;
    ClearFieldInfo;
    AddField('payra'    , ftString, 3 );
    AddField('offitel'  , ftString, 15);
    Sql.Clear;
    Sql.Add(' select '''',ZMANAGER  from pkzcpbas ');

    ServiceName := 'PIB3012A_sel3';
    Open;

    ZMANAGER  := Fields[1].AsString;
    Close;
  end;

  with  TDBSet1  do
  begin
    Close;
    ClearFieldInfo;
    AddField('payra'    , ftString, 3 );
    AddField('offitel'  , ftString, 15);
    Sql.Clear;
    Sql.Add(' select '''',GroupID  from PYmenuuser ');
    Sql.Add('  where empno = '''+ GSempno + '''     ');

    ServiceName := 'PIB3012A_sel3';
    Open;

    GSgroup  := Fields[1].AsString;
    Close;
  end;

  ED_Empno.Hint := GSempno;
  ED_EmpNo.Text := GSempno+' - '+GSkorname;

  if (GSgroup = 'G001') or (GSgroup = 'G011')  then
  begin
    ED_Empno.ButtonWidth := 24;
    ED_Empno.Enabled     := True;
  end
  else
  begin
    ED_Empno.ButtonWidth := 0;
    ED_Empno.Enabled     := False;
  end;
  SAppdate := Copy(GSsysdate,1,8);
  EmpnoFind;
  B_PanelClose.SetFocus;
end;

procedure TMainForm.EmpnoFind;
begin
     FM_empno.BE_Key.text  := ED_empno.Hint;

     if ZMANAGER = GSempno then
        FM_empno.All_search
     else
        FM_empno.Part_search;
     FM_empno.DataMove;

     if ED_empno.Hint = '' then
     begin
         BBdel.Enabled    := False;
         BBsave.Enabled   := False;
         BBcancel.Enabled := False;
     end
     else
     begin
         BBdel.Enabled    := True;
         BBsave.Enabled   := True;
         BBcancel.Enabled := True;
     end;
     DataClear1;
     Loaddata1;
end;

procedure TMainForm.ED_empnoCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
var
  FL_Text : String;
  tmp_key : char;
begin
  tmp_key := #13;
  FL_Text := TOnWinPopupEdit(Sender).Text;
  if Accept then
    begin
      TOnWinPopupEdit(Sender).Text := FM_empno.QR_pimpmas.FieldByName('empno').AsString;
      ED_empnoKeyPress(Sender, tmp_key);
      Accept := False;
    end;
  TOnWinPopupEdit(Sender).PopupControl := nil;
  EmpnoFind;
end;

procedure TMainForm.ED_empnoInitPopup(Sender: TObject);
begin
  FM_empno.Edit         := TOnWinPopupEdit(Sender);
  TOnWinPopupEdit(Sender).PopupControl := FM_empno;
  FM_empno.BE_Key.text  := '';
  if ZMANAGER = GSempno then
     FM_empno.All_search
  else
     FM_empno.Part_search;
end;

procedure TMainForm.ED_empnoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
      Key := #0;
      ED_empno.Hint := ED_empno.Text;
      EmpnoFind;
  end;
end;

procedure TMainForm.EAppSayuggKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
       case TOnEdit(Sender).Tag of
       1 : ETel.SetFocus;
       2 : BBsave.SetFocus;
       end;
  end;
end;

procedure TMainForm.B_PanelCloseClick(Sender: TObject);
begin
  Panel2.Visible := False;
  SB_Help.Panels[1].text := '';
  SaveBy := 1;
  DataClear1;
  EAppSayu.SetFocus;
end;

end.
