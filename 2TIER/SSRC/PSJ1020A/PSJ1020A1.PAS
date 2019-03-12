{-------------------------------------------------------------------------------
  o 프로그램명 : 건강검진관리
  o 시스템명   : 종합인사정보시스템
  o 부시스템명 : 급여
  o 작성자     : 강륜종
  o 버전       : 1.00
  o 작성일자   : 2009.08
  o 변경 이력사항
    버전 일자       작성자   변경내용                   처리명세서 반영여부

-------------------------------------------------------------------------------}
unit PSJ1020A1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OnScheme, ExtCtrls, OnShapeLabel, OnEditBaseCtrl, OnEditStdCtrl,
  OnEditBtnCtrl, OnPersonEdit, ComCtrls, StdCtrls, OnFocusButton, Db,
  MemDS, DBAccess, Ora, jpeg, Func, OnInsaCommon, Grids, DBGrids,
  OnEditNumCtl, OnEditMemo, OnEditCombo, comobj;

type
  TFM_Main = class(TForm)
    SF_Main: TOnSchemeForm;
    OraQuery1: TOraQuery;
    SB_Help: TStatusBar;
    BT_Exit: TOnFocusButton;
    DataSource1: TDataSource;
    E_mediyear: TOnComboEdit;
    DBGrid1: TDBGrid;
    BT_SearchMulti: TOnFocusButton;
    OnShapeLabel2: TOnShapeLabel;
    BT_Initail: TOnFocusButton;
    Chk_all: TCheckBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    E_Search02: TOnEdit;
    E_Search03: TOnEdit;
    E_Search04: TOnEdit;
    E_Search05: TOnEdit;
    E_Search08: TOnEdit;
    E_Search09: TOnEdit;
    E_Search10: TOnEdit;
    E_Search11: TOnEdit;
    E_Search12: TOnEdit;
    E_Search07: TOnEdit;
    E_Search06: TOnEdit;
    E_Search14: TOnEdit;
    E_Search13: TOnEdit;
    E_Search15: TOnEdit;
    BT_Search1: TOnFocusButton;
    BT_Search2: TOnFocusButton;
    E_Search01: TOnEdit;
    BT_Search3: TOnFocusButton;
    BT_Search4: TOnFocusButton;
    BT_Search5: TOnFocusButton;
    BT_Search6: TOnFocusButton;
    BT_Search7: TOnFocusButton;
    BT_Search9: TOnFocusButton;
    Check1: TCheckBox;
    Check2: TCheckBox;
    Check3: TCheckBox;
    Check4: TCheckBox;
    Check5: TCheckBox;
    Check6: TCheckBox;
    Check7: TCheckBox;
    Check8: TCheckBox;
    BT_Search10: TOnFocusButton;
    Check9: TCheckBox;
    BT_Search8: TOnFocusButton;
    Check10: TCheckBox;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Edit1: TEdit;
    QryGrid: TOraQuery;
    OraSession1: TOraSession;
    QryGridROWNUM: TFloatField;
    QryGridEMPNO: TStringField;
    QryGridKORNAME: TStringField;
    QryGridJUMINID: TStringField;
    QryGridVALUE006: TIntegerField;
    QryGridVALUE007: TIntegerField;
    QryGridVALUE019: TIntegerField;
    QryGridVALUE014: TIntegerField;
    QryGridVALUE017: TIntegerField;
    QryGridVALUE054: TStringField;
    QryGridVALUE013: TStringField;
    QryGridVALUE021: TIntegerField;
    QryGridVALUE022: TIntegerField;
    QryGridVALUE023: TIntegerField;
    QryGridVALUE038: TStringField;
    QryGridVALUE039: TStringField;
    QryGridVALUE032: TFloatField;
    QryGridVALUE056: TStringField;
    QryGridVALUE009: TStringField;
    QryGridMEDIDATE: TStringField;
    QryGridMEDIYEAR: TStringField;
    E_Result: TOnNumberEdit;
    BT_Help: TOnFocusButton;
    E_HelpMemo: TOnMemo;
    BT_Excel: TOnFocusButton;
    Panel12: TPanel;
    OnShapeLabel1: TOnShapeLabel;
    E_Title: TOnEdit;
    E_Body: TOnMemo;
    BT_Send: TOnFocusButton;
    BT_ExcelMail: TOnFocusButton;
    OraQuery2: TOraQuery;
    FloatField1: TFloatField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    StringField5: TStringField;
    StringField6: TStringField;
    IntegerField6: TIntegerField;
    IntegerField7: TIntegerField;
    IntegerField8: TIntegerField;
    StringField7: TStringField;
    StringField8: TStringField;
    FloatField2: TFloatField;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    E_SendTime: TOnEdit;
    QryGridDEPTNAME: TStringField;
    QryGridPLACENAME: TStringField;
    QryGridPAYRANAME: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BT_ExitClick(Sender: TObject);
    procedure BT_InitailClick(Sender: TObject);
    procedure BT_SendClick(Sender: TObject);
    procedure Chk_allClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure PageControl1Change(Sender: TObject);
    procedure BT_Search1Click(Sender: TObject);
    procedure BT_Search2Click(Sender: TObject);
    procedure BT_Search3Click(Sender: TObject);
    procedure BT_Search4Click(Sender: TObject);
    procedure BT_Search5Click(Sender: TObject);
    procedure BT_Search6Click(Sender: TObject);
    procedure BT_Search7Click(Sender: TObject);
    procedure BT_Search9Click(Sender: TObject);
    procedure BT_Search10Click(Sender: TObject);
    procedure BT_Search8Click(Sender: TObject);
    procedure BT_SearchMultiClick(Sender: TObject);
    procedure BT_HelpClick(Sender: TObject);
    procedure E_BodyClick(Sender: TObject);
    procedure E_TitleClick(Sender: TObject);
    procedure BT_ExcelClick(Sender: TObject);
    procedure BT_ExcelMailClick(Sender: TObject);

  private
    { Private declarations }
     v01A, v01B, v02A, v02B, v03A, v03B, v04A, v04B, v05A, v05B, v08A, v08B, v09A, v09B, v10A, v10B : Integer;
     v06, v07A, v07B, v11, v12, v14A, v14B, v15A, v15B : String;
     v13A, v13B : Double;

     Chk_Color : array[1..5000] of char; //선택
     cFlag     : boolean; // 전체선택해제
     chk_temp  : String;
     vSendTime : String;


     SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String;
//     procedure F_Search;
     function  Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String) : Boolean; //2007.08.01.dsa2000
  public
    { Public declarations }
  end;

var
  FM_Main: TFM_Main;

implementation

{$R *.DFM}

procedure TFM_Main.BT_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TFM_Main.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Ora_Session.Connected := False;
  Action := caFree;
end;

procedure TFM_Main.FormCreate(Sender: TObject);
begin
  SB_Help.Panels[1].Text := ' 종합인사시스템에 접속중입니다...';
  Application.ProcessMessages;

  OraConnect;

  OraQuery1.Session := Ora_Session;
  QryGrid.Session   := Ora_Session;
  vSendTime := '';
end;

procedure TFM_Main.FormShow(Sender: TObject);
begin
  with OraQuery1 do
  begin
       Close;
       Sql.Clear;
       Sql.Add ('Select 1 from pymenuuser          ');
       Sql.Add (' Where groupid = ''G053''         ');  //건강검진관리자(간호사)
       Sql.Add ('   And lockyn  = ''N''            ');
       Sql.Add ('   And empno   = '''+ Pempno +''' ');
       Open
  end;

  if (OraQuery1.RecordCount <> 1) and (Copy(Pempno,1,1) <> 'D') then
  begin
       ShowMessage('귀하는 접근 권한이 부족합니다. 프로그램을 종료합니다.');
       OraQuery1.Close;
       FM_Main.Close;
  end;

  E_mediyear.Clear;
  with OraQuery1 do
  begin
       Close;
       Sql.Clear;
       Sql.Add ('Select distinct mediyear mediyear From psmedhis ');
       Sql.Add (' Order By 1 desc                                ');
       Open;

       while not OraQuery1.Eof do
       begin
            E_mediyear.Items.Add( FieldByName('mediyear').AsString );
            Next;
       end;
       Close;
       E_mediyear.ItemIndex := 0;
  end;

  PageControl1Change(nil);
  E_HelpMemo.Visible := False;
end;

procedure TFM_Main.BT_InitailClick(Sender: TObject);
begin
{  E_Search01.Text := '';
  E_Search02.Text := '';
  E_Search03.Text := '';
  E_Search04.Text := '';
  E_Search05.Text := '';
  E_Search06.Text := '';
  E_Search07.Text := '';
  E_Search08.Text := '';
  E_Search09.Text := '';
  E_Search10.Text := '';}
  Check1.Checked := False;
  Check2.Checked := False;
  Check3.Checked := False;
  Check4.Checked := False;
  Check5.Checked := False;
  Check6.Checked := False;
  Check7.Checked := False;
  Check8.Checked := False;
  Check9.Checked := False;
  Check10.Checked:= False;
end;

procedure TFM_Main.BT_SendClick(Sender: TObject);
var
     i, Chk_Cnt : integer;
     Selemp  : TStringList;
     TmpTitle, TmpBody, sTemp : string;
begin
  //if not QryGrid.Active then system.Exit;
  if (Trim(E_Title.Text) = '') or (Trim(E_Body.Text) = '') or
     (E_Title.Text = '한글 기준 50자까지 등록 가능합니다. (Max 100Byte)') or
     (E_Body.Text  = '한글 기준 500자까지 등록 가능합니다. (Max 1000Byte)') then
  begin
       ShowMessage(' 제목 또는 본문을 입력후 전송하시기 바랍니다.');
       Exit;
  end;

  // 사원선택 체크
  Chk_Cnt := 0;
  for i := 1 to QryGrid.RecordCount do
  begin
       if Chk_Color[i] ='Y' then Chk_Cnt := Chk_Cnt + 1;
  end;

  if (Chk_Cnt <= 0) or (not QryGrid.Active) then
  begin
       SB_Help.Panels[1].Text := '먼저 메일을 보낼 사원을 클릭으로 선택하세요!';
       exit;
  end;

  if MessageDlg('선택한 사원들에게 메일을 전송 하시겠습니까?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
  begin
       SB_Help.Panels[1].Text := '메일 전송을 취소 하였습니다.';
       Exit;
  end;

  //////////////////////////////////////////////////////////////////////////////
  with OraQuery1 do
  begin
       Close;
       SQL.Clear;
       SQL.Add('Select to_char(sysdate,''yyyymmddhh24miss'') From Dual');
       Open;
       vSendTime := Fields[0].AsString;
       E_SendTime.Text := InMask(vSendTime,'@@@@-@@-@@ @@:@@:@@');
       
       if vSendTime = '' then
       begin
            ShowMessage('전송시간 설정 오류 !!! ');
            Exit;
       end;
  end;
  //////////////////////////////////////////////////////////////////////////////

  //EAI 연동을 통한 메일 발송을 위하여 PZHMAIL 테이블에 Insert...
  SendProgID  := 'PSJ1020A';
  SendEmpno   := Pempno;
  MailSubject := E_Title.Text;
  MailBody    := E_Body.Text;
  ReceiveYN   := 'N';          //if ChkReceive.Checked then ReceiveYN := 'Y';

  QryGrid.First;
  for i := 1 to QryGrid.RecordCount do
  begin
       if Chk_Color[i] = 'Y' then
       begin
            RcveEmpno := QryGrid.FieldByName('empno').AsString; //'Z113';

            if not Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN) then
            begin
                 MessageDlg('사번'+RcveEmpno+'의 메일 전송이 실패 하였습니다...',mtError, [mbOk], 0);
                 exit;
            end;
       end;
       QryGrid.next;
  end; //end of for

  {// 전송자에게도 동일한 메일내역이 전송되도록 추가...
  RcveEmpno   := Pempno;
  if not Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN) then
  begin
       MessageDlg('사번'+RcveEmpno+'의 메일 전송이 실패 하였습니다...',mtError, [mbOk], 0);
       exit;
  end; }
  SB_Help.Panels[1].Text := '메일이 성공적으로 발송되었습니다';
end;

procedure TFM_Main.Chk_allClick(Sender: TObject);
var
     i : integer;
begin
  //전체선택 또는 해제에 따라 그리드 더블클릭 call
  if chk_all.Checked then
  begin
       cFlag := false;
       DBGrid1DblClick(sender);//DBGrid1CellClick(sender);
  end
  else if not chk_all.Checked then
  begin
       cFlag := true;
       DBGrid1DblClick(sender);//DBGrid1CellClick;
  end;
  chk_temp :='N';
end;

procedure TFM_Main.DBGrid1CellClick(Column: TColumn);
var
     i: integer;
begin
  if not QryGrid.active then exit;

  //더블클릭했을때 체크박스가 전체 선택인지 해지인지 또는 한줄 선택인지 에따라 Chk_Color[]의 값을 넣어줌
  if   Chk_Color[QryGridRownum.Asinteger] = 'Y'  then Chk_Color[QryGridRownum.Asinteger] := 'N'
  else                                                Chk_Color[QryGridRownum.Asinteger] := 'Y';

  QryGrid.DisableControls;
  QryGrid.Next;

  if not QryGrid.Eof then QryGrid.Prior;

  QryGrid.EnableControls ;
  cFlag := false;
end;

procedure TFM_Main.DBGrid1DblClick(Sender: TObject);
var
     i: integer;
begin
  if not QryGrid.active then exit;

  for i := 1 TO QryGrid.RecordCount do
  begin
       if   Chk_all.Checked then Chk_Color[i] := 'Y'
       else                      Chk_Color[i] := 'N';
  end;

  QryGrid.DisableControls;
  QryGrid.Next;

  if not QryGrid.Eof then QryGrid.Prior;
  QryGrid.EnableControls ;
  cFlag := false;
end;

procedure TFM_Main.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  with(Sender as TDBGrid).Canvas do   //Chk_Color[]에 따라 선택된 row에 색깔 넣기
  begin
       if Chk_Color[QryGridRownum.Asinteger] = 'Y' then
       begin
            Brush.Color := $00FFFF80 ;
            Font.color  := clBlack ;
            FillRect(Rect);
            TextOut(Rect.Left,Rect.Top,column.Field.AsString  );
       end
       else
       begin
            Brush.Color := clwindow;
            Font.color  := clBlack ;
            FillRect(Rect);
            TextOut(Rect.Left,Rect.Top,column.Field.AsString);
       end;
  end;
end;

procedure TFM_Main.PageControl1Change(Sender: TObject);
begin
 
  if PageControl1.ActivePage = TabSheet1 then
  begin
       v01A := 135;                //고혈압       수축기압 : 135~144
       v01B := 144;
       v02A := 86;                 //             이완기압 :  86~ 95
       v02B := 95;
       v03A := 110;                //당뇨                  : 110~125
       v03B := 125;
       v04A := 220;                //고지혈증  총콜레스테롤: 220~249
       v04B := 249;
       v05A := 130;                //     저밀도 콜레스테롤: 130~159
       v05B := 159;
       v06  := '양성';
       v07A := '낭종';
       v07B := '결절';
       v08A := 40;                 //간질환           SGOT :  40~ 79
       v08B := 79;
       v09A := 40;                 //                 SGPT :  40~ 79
       v09B := 79;
       v10A := 78;                 //알콜성간질환    r-GTP : 78~100
       v10B := 100;
       v11  := '양성';
       v12  := '음성';
       v13A := 0.34;
       v13B := 5.6;
       v14A := '낭종';
       v14B := '결절';
       v15A := '비대';
       v15B := '차단';
  end
  else if PageControl1.ActivePage = TabSheet2 then
  begin
       v01A := 145;                //고혈압       수축기압 : 145 이상
       v01B := 999; //임의의 값
       v02A :=  96;                //             이완기압 :  96 이상
       v02B := 999;
       v03A := 126;                //당뇨                  : 126 이상
       v03B := 999;  //임의의 값
       v04A := 250;                //고지혈증  총콜레스테롤: 250이상
       v04B := 999;  //임의의 값
       v05A := 160;                //     저밀도 콜레스테롤: 160이상
       v05B := 999;  //임의의 값
       v06  := '양성';
       v07A := '종양';
       v07B := '';
       v08A :=  80;                //간질환           SGOT :  80이상
       v08B := 999;  //임의의 값
       v09A :=  80;                //                 SGPT :  80이상
       v09B := 999;  //임의의 값
       v10A := 101;                //알콜성간질환    r-GTP : 101이상
       v10B := 999;  //임의의 값
       v11  := '검색안함';
       v12  := '검색안함';
       v13A := 0.34;
       v13B := 5.8;
       v14A := '낭종';
       v14B := '결절';
       v15A := '비대';
       v15B := '차단';
  end;

  E_Search01.Text := IntToStr(v01A) + '~' + IntToStr(v01B);
  E_Search02.Text := IntToStr(v02A) + '~' + IntToStr(v02B);
  E_Search03.Text := IntToStr(v03A) + '~' + IntToStr(v03B);
  E_Search04.Text := IntToStr(v04A) + '~' + IntToStr(v04B);
  E_Search05.Text := IntToStr(v05A) + '~' + IntToStr(v05B);
  E_Search06.Text := v06;
  E_Search07.Text := v07A + ' ' + v07B;
  E_Search08.Text := IntToStr(v08A) + '~' + IntToStr(v08B);
  E_Search09.Text := IntToStr(v09A) + '~' + IntToStr(v09B);
  E_Search10.Text := IntToStr(v10A) + '~' + IntToStr(v10B);
  E_Search11.Text := v11;
  E_Search12.Text := v12;
  E_Search13.Text := '<=' + FloatToStr(v13A) + ' or >=' + FloatToStr(v13B);
  E_Search14.Text := v14A + ' ' + v14B;
  E_Search15.Text := v15A + ' ' + v15B;
end;


procedure TFM_Main.BT_Search1Click(Sender: TObject);
begin
  BT_InitailClick(Sender);
  Check1.Checked := True;
  BT_SearchMultiClick(Sender);
end;

procedure TFM_Main.BT_Search2Click(Sender: TObject);
begin
  BT_InitailClick(Sender);
  Check2.Checked := True;
  BT_SearchMultiClick(Sender);
end;

procedure TFM_Main.BT_Search3Click(Sender: TObject);
begin
  BT_InitailClick(Sender);
  Check3.Checked := True;
  BT_SearchMultiClick(Sender);
end;

procedure TFM_Main.BT_Search4Click(Sender: TObject);
begin
  BT_InitailClick(Sender);
  Check4.Checked := True;
  BT_SearchMultiClick(Sender);
end;

procedure TFM_Main.BT_Search5Click(Sender: TObject);
begin
  BT_InitailClick(Sender);
  Check5.Checked := True;
  BT_SearchMultiClick(Sender);
end;

procedure TFM_Main.BT_Search6Click(Sender: TObject);
begin
  BT_InitailClick(Sender);
  Check6.Checked := True;
  BT_SearchMultiClick(Sender);
end;

procedure TFM_Main.BT_Search7Click(Sender: TObject);
begin
  BT_InitailClick(Sender);
  Check7.Checked := True;
  BT_SearchMultiClick(Sender);
end;

procedure TFM_Main.BT_Search8Click(Sender: TObject);
begin
  BT_InitailClick(Sender);
  Check8.Checked := True;
  BT_SearchMultiClick(Sender);
end;

procedure TFM_Main.BT_Search9Click(Sender: TObject);
begin
  BT_InitailClick(Sender);
  Check9.Checked := True;
  BT_SearchMultiClick(Sender);
end;

procedure TFM_Main.BT_Search10Click(Sender: TObject);
begin
  BT_InitailClick(Sender);
  Check10.Checked := True;
  BT_SearchMultiClick(Sender);
end;

procedure TFM_Main.BT_SearchMultiClick(Sender: TObject);
begin
  with QryGrid do
  begin
       Close;
       Sql.Clear;
       Sql.Add ('Select Rownum,   A.empno,    A.Korname,  B.Juminid,  medidate, mediyear,                      ');
       Sql.Add ('      (select deptname from pycdept where orgnum=B.orgnum and deptcode= B.deptcode) deptname, ');
       Sql.Add ('      (select codename from pyccode where codeid=''I160'' and codeno  = B.jobplace) placename,');
       Sql.Add ('      (select codename from pyccode where codeid=''I113'' and codeno  = B.payra)    payraname,');
       Sql.Add ('       Value006, Value007, Value019, Value014, Value017, Value054, Value013, Value021,        ');
       Sql.Add ('       Value022, Value023, Value038, Value039, Value032, Value056, Value009                   ');
       Sql.Add ('  From Psmedhis A, pimpmas B                                                                  ');
       Sql.Add (' Where Mediyear = :Medyear                                                                    ');
       Sql.Add ('   And A.empno  = B.empno                                                                     ');
       ParamByName('Medyear').AsString := E_mediyear.Text;

       if Check1.Checked then
       begin
            Sql.Add ('   and Value006 between :v01A And :v01B ');
            Sql.Add ('   and Value007 between :v02A And :v02B ');
            ParamByName('v01A').AsInteger := v01A;
            ParamByName('v01B').AsInteger := v01B;
            ParamByName('v02A').AsInteger := v02A;
            ParamByName('v02B').AsInteger := v02B;
       end;

       if Check2.Checked then
       begin
            Sql.Add ('   and Value019 between :v03A And :v03B ');
            ParamByName('v03A').AsInteger := v03A;
            ParamByName('v03B').AsInteger := v03B;
       end;

       if Check3.Checked then
       begin
            Sql.Add ('   and Value014 between :v04A And :v04B ');
            Sql.Add ('   and Value017 between :v05A And :v05B ');
            ParamByName('v04A').AsInteger := v04A;
            ParamByName('v04B').AsInteger := v04B;
            ParamByName('v05A').AsInteger := v05A;
            ParamByName('v05B').AsInteger := v05B;
       end;

       if Check4.Checked then
       begin
            if PageControl1.ActivePage = TabSheet1 then
            begin
                 Sql.Add ('   and  Value054 like :v06                            ');
                 Sql.Add ('   and (Value013 like :v07A  or  Value013 like :v07B) ');
                 ParamByName('v06').AsString  := '%'+ v06  +'%';
                 ParamByName('v07A').AsString := '%'+ v07A +'%';
                 ParamByName('v07B').AsString := '%'+ v07B +'%';
            end
            else
            begin
                 Sql.Add ('   and Value054 like :v06   ');
                 Sql.Add ('   and Value013 like :v07A  ');
                 ParamByName('v06').AsString  := '%'+ v06  +'%';
                 ParamByName('v07A').AsString := '%'+ v07A +'%';
            end;
       end;

       if Check5.Checked then
       begin
            Sql.Add ('   and Value021 between :v08A And :v08B ');
            Sql.Add ('   and Value022 between :v09A And :v09B ');
            ParamByName('v08A').AsInteger := v08A;
            ParamByName('v08B').AsInteger := v08B;
            ParamByName('v09A').AsInteger := v09A;
            ParamByName('v09B').AsInteger := v09B;
       end;

       if Check6.Checked then
       begin
            Sql.Add ('   and Value023 between :v10A And :v10B ');
            ParamByName('v10A').AsInteger := v10A;
            ParamByName('v10B').AsInteger := v10B;
       end;

       if (Check7.Checked) and (PageControl1.ActivePage = TabSheet1) then
       begin
            Sql.Add ('   and  Value038 like :v11      ');
            ParamByName('v11').AsString := '%'+ v11 +'%';
       end;

       if (Check8.Checked) and (PageControl1.ActivePage = TabSheet1) then
       begin
            Sql.Add ('   and  Value039 like :v12      ');
            ParamByName('v12').AsString := '%'+ v12 +'%';
       end;

       if Check9.Checked then
       begin
            Sql.Add ('   and (Value032   <= :v13A  or  Value032   >= :v13B) ');
            Sql.Add ('   and (Value056 like :v14A  or  Value056 like :v14B) ');
            ParamByName('v13A').AsFloat  := v13A;
            ParamByName('v13B').AsFloat  := v13B;
            ParamByName('v14A').AsString := v14A;
            ParamByName('v14B').AsString := v14B;
       end;

       if Check10.Checked then
       begin
            Sql.Add ('   and (Value009 like :v15A  or  Value009 like :v15B) ');
            ParamByName('v15A').AsString := v15A;
            ParamByName('v15B').AsString := v15B;
       end;
            Edit1.Text := QryGrid.SQl.text;
       Open;
  end;

  E_Result.Value :=  QryGrid.RecordCount;
  SB_Help.Panels[1].Text := ' 검색 완료.';
end;

procedure TFM_Main.BT_HelpClick(Sender: TObject);
begin
  if      E_HelpMemo.Visible = False then E_HelpMemo.Visible := True
  else if E_HelpMemo.Visible = True  then E_HelpMemo.Visible := False;
end;

procedure TFM_Main.E_TitleClick(Sender: TObject);
begin
  if Pos('(Max 100Byte)',E_Title.Text) > 0 then E_Title.Text := '';
end;

procedure TFM_Main.E_BodyClick(Sender: TObject);
begin
  if Pos('(Max 1000Byte)',E_Body.Text) > 0 then E_Body.Text := '';
end;

//EAI 연동을 통한 Web Hint로 메일 발송을 위하여 PZHMAIL 테이블에 Insert..
Function TFM_Main.Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String) : Boolean;
begin
  with OraQuery1 do
  begin
       Close;
       SQL.Clear;
       SQL.Add('insert into PZHMAIL            ');
       SQL.Add('Values ('''+ vSendTime   +''', ');  //SENDTIME   메일발송 작업시간
       SQL.Add('        '''+ SendProgID  +''', ');  //SENDPROG   발송프로그램 ID
       SQL.Add('        '''+ SendEmpno   +''', ');  //SEND_PER   발신자 사번
       SQL.Add('        '''+ RcveEmpno   +''', ');  //RCVR_PER,  수신자 사번
       SQL.Add('        ''''                 , ');  //REFR_PER   불필요(종합인사)
       SQL.Add('        '''+ MailSubject +''', ');  //SUBJECT    메일제목
       SQL.Add('        ''''                 , ');  //HEADER1    불필요(종합인사)
       SQL.Add('        '''+ MailBody    +''', ');  //BODY1      메일내용
       SQL.Add('        ''''                 , ');  //TAIL1      불필요(종합인사)
       SQL.Add('        '''+ ReceiveYN   +''', ');  //RECEIVEYN  'Y' 일경우 메일 읽었을경우 송신자에게 수신확인 메일 보내주기
       SQL.Add('        ''N''                , ');  //EAI_FLAG
       SQL.Add('        ''''                 ) ');  //EAI_DATE
//       SQL.Add('Values (to_char(sysdate,''yyyymmddhh24miss'' ), ');  //SENDTIME   메일발송 작업시간
       try
            ExecSql;
       except
            Result := false;
            exit;
       end; 
       Result := True;
  end;
end;


procedure TFM_Main.BT_ExcelClick(Sender: TObject);
var
    XL, XArr  : Variant;
    SavePlace : TBookmark;
    XLi, XLk  : integer;
begin
  if QryGrid.RecordCount < 1 then
  begin
       showmessage('엑셀 변환할 자료가 없습니다.');
       exit;
  end;

  SB_Help.Panels[1].Text := 'Excel이 설치되어 있는지 검색하고 있습니다.';

  XArr := VarArrayCreate([1, 23], VarVariant);
  try
       XL := CreateOLEObject('Excel.Application');
  except
       MessageDlg('Excel이 설치되어 있지 않습니다.', MtWarning, [mbok], 0);
       SB_Help.Panels[1].Text := '';
       Exit;
  end;

  SB_Help.Panels[1].Text := '자료를 변환하고 있습니다.';
  XL.WorkBooks.Add; //새로운 페이지 생성
  XL.Visible := false;
  if   PageControl1.ActivePage = TabSheet1 then XL.WorkSheets[1].Name := '관찰대상자List'
  else                                          XL.WorkSheets[1].Name := '치료대상자List';  //시트명 부여

  //컬럼명 지정_서브타이블 지정
  XArr[1]  := 'ROWNUM';
  XArr[2]  := '검진년도';
  XArr[3]  := '사번';
  XArr[4]  := '성명';
  XArr[5]  := '주민번호';
  XArr[6]  := '직책';
  XArr[7]  := '부서명';
  XArr[8]  := '근무지명';
  XArr[9]  := '수축기압';
  XArr[10] := '이완기압';
  XArr[11] := 'FBS';
  XArr[12] := 'T.C';
  XArr[13] := 'LDL';
  XArr[14] := '요잠혈';
  XArr[15] := '복부초음파';
  XArr[16] := 'SGOT';
  XArr[17] := 'SGPT';
  XArr[18] := 'G-GPT';
  XArr[19] := 'HBsAg';
  XArr[20] := 'HBsAb';
  XArr[21] := 'TSH';
  XArr[22] := '초음파';
  XArr[23] := '심전도';
//XArr[24] := '진료일';

  XL.Range['A1' , 'W1'].Value := XArr;
  XLk := 1;
  for XLi := 1 to 23 do
  begin
       XL.Range[CHR(64 + XLi) + '1'].HorizontalAlignment := 3;
       XL.Range[CHR(64 + XLi) + '1'].Interior.Color      := $00CBF0B3;
       XL.Range[CHR(64 + XLi) + '1'].font.Size           := 10;
       XL.Range[CHR(64 + XLi) + '1'].font.Bold           := True;
  end;

  //검색된 자료를 excel에 export처리 시킨다.
  SavePlace := QryGrid.GetBookmark;
  QryGrid.DisableControls;
  QryGrid.First;

  with QryGrid do
  begin
       for XLi := 1 to  RecordCount do
       begin
            XArr[1]  := FieldbyName('ROWNUM').AsString;
            XArr[2]  := FieldbyName('MEDIYEAR').AsString;
            XArr[3]  := ''''+FieldbyName('EMPNO').AsString;
            XArr[4]  := FieldByName('KORNAME').AsString;
            XArr[5]  := FieldByName('JUMINID').AsString;
            XArr[6]  := FieldByName('PayraName').AsString;
            XArr[7]  := FieldByName('Deptname').AsString;
            XArr[8]  := FieldByName('PlaceName').AsString;
            XArr[9]  := FieldByName('VALUE006').AsString;
            XArr[10] := FieldByName('VALUE007').AsString;
            XArr[11] := FieldByName('VALUE019').AsString;
            XArr[12] := FieldByName('VALUE014').AsString;
            XArr[13] := FieldByName('VALUE017').AsString;
            XArr[14] := FieldByName('VALUE054').AsString;
            XArr[15] := FieldByName('VALUE013').AsString;
            XArr[16] := FieldByName('VALUE021').AsString;
            XArr[17] := FieldByName('VALUE022').AsString;
            XArr[18] := FieldByName('VALUE023').AsString;
            XArr[19] := FieldByName('VALUE038').AsString;
            XArr[20] := FieldByName('VALUE039').AsString;
            XArr[21] := FieldByName('VALUE032').AsString;
            XArr[22] := FieldByName('VALUE056').AsString;
            XArr[23] := FieldByName('VALUE009').AsString;
            //XArr[21] := FieldByName('MEDIDATE').AsString;

            XL.Range['A' + IntToStr(XLk+1), 'W' + IntToStr(XLk+1)].Value := XArr;
            inc(XLk);
            Next;
       end;
  end;

  //여기서 부터는 EXPORT된 EXCEL자료를 예쁘게 꾸미는 부분입니다.
  XL.Range['A1', 'W' + IntToStr(XLk)].Borders.LineStyle   := 1;        //테두리선을 만든다.  1은 실선
  XL.Range['A1', 'W' + IntToStr(XLk)].Borders.Weight      := 2;        //테두리선 두깨 설정  2는 보통두깨, 3은 무지 두꺼움
  XL.Range['A1', 'W' + IntToStr(XLk)].Borders.ColorIndex  := 1;        //테두리선 색상설정  1은 검은색
  XL.Range['A1', 'W' + IntToStr(XLk)].font.name           := '굴림체';
  XL.Range['A1', 'W' + IntToStr(XLk)].font.Size           := 9;
  XL.Range['A1', 'A1'].HorizontalAlignment                := 3;        //가운데 정렬
  XL.Range['A2', 'W' + IntToStr(XLk)].HorizontalAlignment := 3;        //가운데 정렬
  XL.Range['D2', 'W' + IntToStr(XLk)].HorizontalAlignment := 1;        //우측정렬
  XL.Range['A1', 'W' + IntToStr(XLk)].Select;                          //자료를 모두 SELECT한 후 --하는 이유:  AutoFit 처리하기 위해서임
  XL.Selection.Columns.AutoFit;                                       //자동정렬
  XL.Range['A2', 'A2'].Select;                                        //A4열에 커서 위치시킴
  //////////////////////////////////////////////////////////////////////////////
  XL.Visible := true;                                                 //엑셀자료 보여줌
  Screen.Cursor := crDefault;
  QryGrid.GotoBookmark(SavePlace);
  QryGrid.FreeBookmark(SavePlace);
  QryGrid.EnableControls;
  SB_Help.Panels[1].Text := ' 추출 완료.';
end;

//메일전송내역 추출
procedure TFM_Main.BT_ExcelMailClick(Sender: TObject);
var
    XL, XArr  : Variant;
    SavePlace : TBookmark;
    XLi, XLk  : integer;
begin
  with OraQuery1 do
  begin
       Close;
       Sql.Clear;
       Sql.Add ('Select SendTime, send_per, rcvr_per, subject, body1,                 ');
       Sql.Add ('      (select korname from pimpmas where empno = m.rcvr_per) korname ');
       Sql.Add ('  From pzhmail m                                                     ');
       Sql.Add (' Where Sendprog = ''PSJ1020A''                                       ');
       Sql.Add ('   And send_per = '''+ Pempno    +'''                                ');
       Sql.Add ('   And SendTime = '''+ vSendTime +'''                                ');
       Open;
  end;        

  if OraQuery1.RecordCount < 1 then
  begin
       showmessage('엑셀 변환할 자료가 없습니다.');
       exit;
  end;

  SB_Help.Panels[1].Text := 'Excel이 설치되어 있는지 검색하고 있습니다.';

  XArr := VarArrayCreate([1, 6], VarVariant);
  try
       XL := CreateOLEObject('Excel.Application');
  except
       MessageDlg('Excel이 설치되어 있지 않습니다.', MtWarning, [mbok], 0);
       SB_Help.Panels[1].Text := '';
       Exit;
  end;

  SB_Help.Panels[1].Text := '자료를 변환하고 있습니다.';
  XL.WorkBooks.Add; //새로운 페이지 생성
  XL.Visible := false;
  if   PageControl1.ActivePage = TabSheet1 then XL.WorkSheets[1].Name := '관찰대상자 메일전송 List'
  else                                          XL.WorkSheets[1].Name := '치료대상자 메일전송 List';  //시트명 부여

  //컬럼명 지정_서브타이블 지정
  XArr[1]  := '전송시간';
  XArr[2]  := '전송자 사번';
  XArr[3]  := '수신자 사번';
  XArr[4]  := '수신자 성명';
  XArr[5]  := '메일제목';
  XArr[6]  := '메일내용';

  XL.Range['A1' , 'F1'].Value := XArr;
  XLk := 1;
  for XLi := 1 to 6 do
  begin
       XL.Range[CHR(64 + XLi) + '1'].HorizontalAlignment := 3;
       XL.Range[CHR(64 + XLi) + '1'].Interior.Color      := $00CBF0B3;
       XL.Range[CHR(64 + XLi) + '1'].font.Size           := 10;
       XL.Range[CHR(64 + XLi) + '1'].font.Bold           := True;
  end;

  //검색된 자료를 excel에 export처리 시킨다.
  SavePlace := OraQuery1.GetBookmark;
  OraQuery1.DisableControls;
  OraQuery1.First;

  with OraQuery1 do
  begin
       for XLi := 1 to  RecordCount do
       begin
            XArr[1]  := InMask(FieldbyName('sendtime').AsString,'@@@@-@@-@@ @@:@@:@@');
            XArr[2]  := ''''+ FieldbyName('send_per').AsString;
            XArr[3]  := ''''+ FieldbyName('rcvr_per').AsString;
            XArr[4]  := FieldByName('korname').AsString;
            XArr[5]  := FieldByName('subject').AsString;
            XArr[6]  := FieldByName('body1').AsString;

            XL.Range['A' + IntToStr(XLk+1), 'F' + IntToStr(XLk+1)].Value := XArr;
            inc(XLk);
            Next;
       end;
  end;

  //여기서 부터는 EXPORT된 EXCEL자료를 예쁘게 꾸미는 부분입니다.
  XL.Range['A1', 'F' + IntToStr(XLk)].Borders.LineStyle   := 1;        //테두리선을 만든다.  1은 실선
  XL.Range['A1', 'F' + IntToStr(XLk)].Borders.Weight      := 2;        //테두리선 두깨 설정  2는 보통두깨, 3은 무지 두꺼움
  XL.Range['A1', 'F' + IntToStr(XLk)].Borders.ColorIndex  := 1;        //테두리선 색상설정  1은 검은색
  XL.Range['A1', 'F' + IntToStr(XLk)].font.name           := '굴림체';
  XL.Range['A1', 'F' + IntToStr(XLk)].font.Size           := 9;
  XL.Range['A1', 'A1'].HorizontalAlignment                := 3;        //가운데 정렬
  XL.Range['A2', 'F' + IntToStr(XLk)].HorizontalAlignment := 3;        //가운데 정렬
  XL.Range['D2', 'F' + IntToStr(XLk)].HorizontalAlignment := 1;        //우측정렬
  XL.Range['A1', 'F' + IntToStr(XLk)].Select;                          //자료를 모두 SELECT한 후 --하는 이유:  AutoFit 처리하기 위해서임
  XL.Selection.Columns.AutoFit;                                       //자동정렬
  XL.Range['A2', 'A2'].Select;                                        //A4열에 커서 위치시킴
  //////////////////////////////////////////////////////////////////////////////
  XL.Visible := true;                                                 //엑셀자료 보여줌
  Screen.Cursor := crDefault;
  OraQuery1.GotoBookmark(SavePlace);
  OraQuery1.FreeBookmark(SavePlace);
  OraQuery1.EnableControls;
  SB_Help.Panels[1].Text := ' 추출 완료.';
end;

end.

//   v01A, v01B, v02A, v02B, v03A, v03B, v04A, v04B, v05A, v05B, v08A, v08B, v09A, v09B, v10A, v10B : Integer;
//   v06, v07A, v07B, v11, v12, v14A, v14B, v15A, v15B : String;
//   v13A, v13B : Double;

