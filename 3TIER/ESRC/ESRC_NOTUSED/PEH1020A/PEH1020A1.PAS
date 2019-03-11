unit PEH1020A1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl, OnTmaxPersonEdit,
  OnShapeLabel, ComCtrls, OnRadioBtn, OnEditMemo, StdCtrls, OnLineLabel,
  OnFocusButton, Db, Tmax_DataSetText, Tmax_session, TmaxFunc, Pass, printers,
  OnEditCombo, Grids, DBGrids, OnGrDBGrid, OnPopupEdit, PDownLoad, OnScheme,
  OnInsaCommon, Func;

type
  TFM_Main = class(TForm)
    TMaxSession: TTMaxSession;
    TMaxDataSet: TTMaxDataSet;
    TMaxDataSet_HInsa: TTMaxDataSet;
    TDS_Works: TTMaxDataSet;
    DS_Works: TDataSource;
    TDS_Works1: TTMaxDataSet;
    DS_Works1: TDataSource;
    TDS: TTMaxDataSet;
    SF_Main: TOnSchemeForm;
    L_payraname: TOnShapeLabel;
    OnSectionLabel3: TOnSectionLabel;
    OnSectionLabel1: TOnSectionLabel;
    L_Deptname: TOnShapeLabel;
    L_Rabasdate: TOnShapeLabel;
    L_Korname: TOnShapeLabel;
    Shape5: TShape;
    OnSectionLabel4: TOnSectionLabel;
    OnSectionLabel8: TOnSectionLabel;
    Shape6: TShape;
    Shape7: TShape;
    Label3: TLabel;
    Label4: TLabel;
    OnSectionLabel5: TOnSectionLabel;
    Shape10: TShape;
    Label9: TLabel;
    P_Taskcode: TLabel;
    Label1: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    Label2: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    BT_Exit: TOnFocusButton;
    BT_Save: TOnFocusButton;
    Bt_Search: TOnFocusButton;
    BT_Help: TOnFocusButton;
    Ed_empno: TOnWinPopupEdit;
    BT_Print: TOnFocusButton;
    BT_Confirm: TOnFocusButton;
    Bt_OK: TOnFocusButton;
    E_Empno: TTMaxPersonPopupEdit;
    Bt_Eempno: TOnFocusButton;
    Bt_Search1: TOnFocusButton;
    DBG_works1: TOnGrDbGrid;
    E_MIDTOTVIEW: TOnMemo;
    E_MIDCOMVIEW: TOnMemo;
    DBG_works: TOnGrDbGrid;
    On_Comp: TOnMemo;
    E_MIDVALVIEW: TOnMemo;
    P_gubun: TPanel;
    On_Value: TOnMemo;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel14: TPanel;
    Panel13: TPanel;
    Panel15: TPanel;
    Panel17: TPanel;
    Panel18: TPanel;
    Panel19: TPanel;
    Panel16: TPanel;
    Panel2: TPanel;
    Panel20: TPanel;
    Panel23: TPanel;
    Panel22: TPanel;
    Panel24: TPanel;
    Panel21: TPanel;
    E_MIDPERVIEW: TOnMemo;
    BT_Insert: TOnFocusButton;
    P_mainweight: TPanel;
    P_propeltask: TPanel;
    Memo1: TMemo;
    procedure BT_ExitClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure E_EmpnoKeyPress(Sender: TObject; var Key: Char);
    procedure BT_SaveClick(Sender: TObject);
    procedure Bt_SearchClick(Sender: TObject);
    procedure BT_HelpClick(Sender: TObject);
    procedure Ed_empnoCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure Ed_empnoInitPopup(Sender: TObject);
    procedure Ed_empnoKeyPress(Sender: TObject; var Key: Char);
    procedure Bt_EempnoClick(Sender: TObject);
    procedure E_EmpnoEnter(Sender: TObject);
    procedure DBG_worksCellClick(Column: TColumn);
    procedure BT_InsertClick(Sender: TObject);
    procedure DBG_works1CellClick(Column: TColumn);
    procedure BT_PrintClick(Sender: TObject);
    procedure BT_ConfirmClick(Sender: TObject);
    procedure E_MIDVALVIEWKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Bt_OKClick(Sender: TObject);
    procedure E_MIDVALVIEWExit(Sender: TObject);
    procedure Bt_Search1Click(Sender: TObject);
  private
    { Private declarations }
    vParamSQL  : String;
    SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String;
    Function  Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String) : Boolean;
    procedure ConFirm_BtnVisible;
    procedure MidperView_Clear;
    procedure OpinionView;
    procedure Csel_Open;
    function  Csel_gfd(p_loc: Integer): String;
    procedure Select_BaseData;
    procedure Works_data;
    function  FL_CheckNullEvalview:Boolean;     //등록하지 않은 항목이 있는지 여부 체크
    function  FL_CheckNullEcomview:Boolean;
    function  FL_CheckNullEperview:Boolean;
    function  FL_CheckNullEtotview:Boolean;
  public
    { Public declarations }
     vEmpno     : String;
     PEmpno     : String;
     Pevcno     : String;   // 평가표 번호
     Ppaycl     : string;
     Ppayra     : String;
     Pjobkind   : String;
     Porgnum    : String;
     Pdeptcode  : String;
     PFinyn     : String;
     PConyn     : String;
     EGubun     : String;
     sRabasdate : String;
     Csel_SQL   : String;
     Csel_ret   : Boolean;
     Check      : Integer;
     LE1empno   : String;
     LE2empno   : String;

     Workemp1   : String;
     Workemp2   : String;
     Workemp3   : String;
     Workemp4   : String;
     Workemp5   : String;
  end;

var
     FM_Main: TFM_Main;

implementation

uses UHelp, UEmpForm, UPrint;

{$R *.DFM}

procedure TFM_Main.BT_ExitClick(Sender: TObject);
begin
     Close;
end;

procedure TFM_Main.FormCreate(Sender: TObject);
var
  ParamVariant: String;
begin
  VarLoading;
  Self.OnPaint := Nil;
  Application.ProcessMessages;

  TMaxSession.ServiceTimeOut := 1000;
  TMaxSession.Connect     := False;
  TMaxSession.EnvFileName := GetHomeDir+'\newhana.env';
  TMaxSession.LabelName   := 'HANAROHPER';

  Try
    TMaxSession.Connect := True;
    TMaxSession.TMax_Begin(5000);
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

  // 평가기준일을 읽어온다
  ParamVariant := 'select Value1|| '';'' ||Value2     '+
                  '  FROM pehrebas                    '+
                  ' where rabasdate = ''00000000''    '+
                  '   and gubun     = ''00''          '+
                  '   and sgubun    = ''0001''        ';
  Csel_SQL     := ParamVariant;
  Csel_Open;
  sRabasdate   := Csel_gfd(1);
  //sRabasdate   := '20091130';
  L_Rabasdate.ValueCaption  := copy(sRabasdate,1,4)+'-'+copy(sRabasdate,5,2)+'-'+copy(sRabasdate,7,2);

  // 평가담당자를 읽어온다
  ParamVariant := 'select Value1|| '';'' ||Value2||'';''||  '+
                  '       Value3|| '';'' ||Value4||'';''||  '+
                  '       Value5                            '+
                  '  FROM pehrebas                          '+
                  ' where rabasdate = '''+sRabasdate+'''    '+
                  '   and gubun     = ''11''                '+
                  '   and sgubun    = ''0005''              ';
  Csel_SQL     := ParamVariant;
  Csel_Open;
  Workemp1     := Csel_gfd(1);
  Workemp2     := Csel_gfd(2);
  Workemp3     := Csel_gfd(3);
  Workemp4     := Csel_gfd(4);
  Workemp5     := Csel_gfd(5);

  Check        := 0;
  Pempno       :=  Passemp(cmdline,1);
  E_empno.Text :=  Passemp(cmdline,1);
end;

procedure TFM_Main.MidperView_Clear;
begin
     P_Gubun.Caption           := '';
     P_Taskcode.Caption        := '';
     P_propeltask.Caption      := '아래의 중점추진업무를 선택하세요';
     P_mainweight.Caption      := '';
     E_MIDPERVIEW.Lines.Clear;
     E_MIDPERVIEW.Lines.add('팀장 의견을 입력하세요.');
end;

procedure TFM_Main.Select_BaseData;
var
     ParamVariant: String;
     i : integer;
     vEkind : String;
begin
     ParamVariant := 'SELECT empno||'';''||korname||'';''||paycl||'';''||payra||'';''||jobkind||'';''||       '+#13+
                     '       orgnum||'';''||deptcode||'';''||                                                 '+#13+
                     '       (select codename from pyccode where codeid=''I112'' and codeno=A.paycl)||'';''|| '+#13+
                     '       (select codename from pyccode where codeid=''I113'' and codeno=A.payra)||'';''|| '+#13+
                     '       (select deptname from pycdept where orgnum=A.orgnum and deptcode=A.deptcode)     '+#13+
                     '       ||'';''||e1empno||'';''||e2empno                                                 '+#13+
                     '  FROM pehremas A                                                                       '+#13+
                     ' WHERE rabasdate = '''+ sRabasDate +'''                                                 '+#13+
                     '   AND (empno like '''+ Ed_empno.Text +'''||''%''   OR  korname like '''+ Ed_empno.Text +'''||''%'')      ';

     Csel_SQL := ParamVariant; // edit1.Text :=  ParamVariant;
     Csel_Open;

     vEmpno                   := Csel_gfd(1);
     Ed_Empno.Text            := Csel_gfd(1);
     L_korname.ValueCaption   := Csel_gfd(2);
     Ppaycl                   := Csel_gfd(3);
     Ppayra                   := Csel_gfd(4);
     Pjobkind                 := Csel_gfd(5);
     Porgnum                  := Csel_gfd(6);
     Pdeptcode                := Csel_gfd(7);
     L_payraname.ValueCaption := Csel_gfd(9);
     L_Deptname.ValueCaption  := Csel_gfd(10);
     LE1empno                 := Csel_gfd(11);
     LE2empno                 := Csel_gfd(12);

     if ((Ppaycl >= '10') and (Ppaycl <= '20')) or ((Ppaycl >= 'C11') and (Ppaycl <= 'C21')) then
         Pevcno := '1'
     else
     if ((Ppaycl >= '22') and (Ppaycl <= '44')) or ((Ppaycl >= 'D11') and (Ppaycl <= 'D35'))then
         Pevcno := '2';

     Works_data;
end;

procedure TFM_Main.Works_data;
var
     SqlText : string;
begin
     MidperView_Clear;
     with TDS_Works1 do
     begin
          SqlText := Format('SELECT TASKNAME, MAINWEIGHT, E1MIDPERVIEW1, EMPNO, TASKCODE  '+
                            '  FROM PEHREAIM_BASDET A                                    '+
                            ' WHERE A.RABASDATE = ''%s''                                 '+
                            '   AND A.EMPNO     = ''%s''                                 ',[sRabasdate,Ed_empno.Text]);
          Close;
          ServiceName := 'HINSA_select2';
          ClearFieldInfo;
          AddField('TASKNAME'       , ftString, 400);
          AddField('MAINWEIGHT'     , ftString, 400);
          AddField('E1MIDPERVIEW1'  , ftString, 400);
          AddField('EMPNO'          , ftString, 400);
          AddField('TASKCODE'       , ftString, 400);
          ClearParamInfo;
          SQL.Text := SqlText;
          Open;
     end;

     with TDS_Works do
     begin
          SqlText := Format('SELECT PROPELTASK, MAINWEIGHT, E1MIDPERVIEW1, EMPNO, SEQNO  '+
                            '  FROM PEHREAIM_DET A                                      '+
                            ' WHERE A.RABASDATE = ''%s''                                '+
                            '   AND A.EMPNO     = ''%s''                                ',[sRabasdate,Ed_empno.Text]);
          Close;
          ServiceName := 'HINSA_select2';
          ClearFieldInfo;
          AddField('PROPELTASK'   , ftString, 400);
          AddField('MAINWEIGHT'   , ftString, 400);
          AddField('E1MIDPERVIEW1', ftString, 400);
          AddField('EMPNO'        , ftString, 400);
          AddField('SEQNO'        , ftString, 400);
          ClearParamInfo;
          SQL.Text := SqlText;
          Open;

          if  (TDS_Works1.recordCount > 0) And (TDS_Works.recordCount > 0) then  //공동+개별  
          begin
            DBG_works1.Visible := True;
            DBG_works.Visible  := True;
            DBG_works.Top      := P_propeltask.Top+138;
            DBG_works.Height   := 105;
          end
          else
          if  (TDS_Works1.recordCount > 0) And (TDS_Works.recordCount <= 0) then  //공동만
          begin
            DBG_works1.Top     := P_propeltask.Top + 34;
            DBG_works1.Height  := 205;

            DBG_works.Visible  := False;
            //DBG_works.Top    := 514;
            //DBG_works.Height := 0;
          end
          else
          if  (TDS_Works1.recordCount <= 0) then    //개별만
          begin
            DBG_works.Visible  := True;
            DBG_works.Top      := P_propeltask.Top + 34;
            DBG_works.Height   := 205;
            DBG_works1.Visible := False;
          end;
     end;

     if  (TDS_Works1.recordCount > 0) or (TDS_Works.recordCount > 0) then
     begin
          if  PFinyn = 'Y' then     BT_Insert.Enabled := False
          else                      BT_Insert.Enabled := true;
     end
     else
          BT_Insert.Enabled := False;
end;

procedure TFM_Main.Csel_Open;
begin
     Csel_ret := False;
     with TMaxDataSet_HInsa do
     begin
          Close;
          ServiceName := 'SHR0SSEL';
          ClearFieldInfo;
          AddField('SEL_DATA', ftString, 5000);
          ClearParamInfo;
          SQL.Text := Csel_SQL;
          Open;
          if  RecordCount > 0 then     Csel_ret := True;
     end;
end;

function TFM_Main.Csel_gfd(p_loc: Integer): String;
var
     v_cnt, v_tmp: Integer;
     v_data: String;
begin
     Result := '';
     v_data := TMaxDataSet_HInsa.FieldByName('SEL_DATA').AsString;
     v_cnt := 1;
     while v_cnt < p_loc do
     begin
          v_tmp := Pos(';',v_data);
          if  not(v_tmp > 0) then     Exit;
          v_cnt := v_cnt + 1;
          Delete(v_data, 1, v_tmp);
     end;
     v_tmp := Pos(';',v_data) - 1;
     if  v_tmp < 0 then     v_tmp := Length(v_data);
     Result := Copy(v_data,1,v_tmp);
end;

procedure TFM_Main.FormShow(Sender: TObject);
var
     FL_IDate: Integer;
begin
     FM_Tmax                 := TFM_Tmax.Create(Self);
     FM_Tmax.T_Session       := TMaxSession;
//   DBG_works.Top           := 242;
//   DBG_works.Height        := 270;

     MidperView_Clear;

     E_MIDVALVIEW.Clear;
     E_MIDCOMVIEW.Clear;
     E_MIDTOTVIEW.Clear;
     Ed_empnoInitPopup(Self);
     Ed_empno.Perform(WM_KEYDOWN, VK_F2, 0);
     if  (Pempno = Workemp1) or (Pempno = Workemp2) or (Pempno = Workemp3)      or
         (Pempno = Workemp4) or (Pempno = Workemp5) or (copy(Pempno,1,1) = 'D') then
     begin
          E_empno.Visible   := True;
          BT_eempno.Visible := True;
     end
     else
     if  Fm_EmpForm.Query1.RecordCount < 1 then
     begin
          MessageDlg('프로그램 사용 권한이 없습니다.'+#13 ,mtError,[mbOK],0);
          Close;
     end;
end;

procedure TFM_Main.E_EmpnoKeyPress(Sender: TObject;
     var Key: Char);
begin
     if  Key = Chr(13) then
     begin
          Ed_empnoInitPopup(Sender);
          Ed_empno.Perform(WM_KEYDOWN, VK_F2, 0);
          Key := #0;
     end;
end;

procedure TFM_Main.BT_SaveClick(Sender: TObject);
begin
     with TMaxDataSet do
     begin
          ServiceName := 'PEA1060A_dml';
          Close;
          Sql.Clear;
          SQL.Text  := 'Update pehremas                                          '+
                       '   Set E1MIDVALVIEW  = '''+ E_MIDVALVIEW.Text +''',      '+
                       '       E1MIDCOMVIEW  = '''+ E_MIDCOMVIEW.Text +''',      '+
                       '       E1MIDTOTVIEW  = '''+ E_MIDTOTVIEW.Text +''',      '+
                       '       Writeemp      = '''+ Pempno            +''',      '+
                       '       Writetime = to_char(sysdate,''YYYYMMDDHHMISS'')   '+
                       ' WHERE rabasdate = '''+ sRabasdate +'''                  '+
                       '   AND empno     = '''+ Ed_empno.Text +'''               ';

          Execute;
     end;
     if TOnFocusButton(Sender).Name = 'BT_Save' then
     MessageDlg('성공적으로 저장하였습니다.', mtInformation, [mbOK], 0);
end;

procedure TFM_Main.OpinionView;
var
     i, j   : integer;
     vEkind : String;
begin
     Works_data;

     with TMaxDataSet do
     begin
          vParamSQL := 'SELECT E1MIDVALVIEW, E1MIDCOMVIEW, E1MIDTOTVIEW, null, null   '+
                       '  FROM PEHREMAS                                               '+
                       ' WHERE rabasdate = '''+ sRabasdate    +'''                    '+
                       '   AND empno     = '''+ vEmpno        +'''                    ';
          ServiceName := 'HINSA_select2';
          ClearFieldInfo;
          AddField('Field1' , ftString, 400);
          AddField('Field2' , ftString, 400);
          AddField('Field3' , ftString, 400);
          AddField('Field4' , ftString, 400);
          AddField('Field5' , ftString, 400);

          Close;
          SQl.Clear;
          SQL.Text := vParamSQL;             //Memo1.Text := Sql.Text;
          Open;
          E_MIDVALVIEW.Text := Fields[0].AsString;
          E_MIDCOMVIEW.Text := Fields[1].AsString;
          E_MIDTOTVIEW.text := Fields[2].AsString;
     end;
end;

procedure TFM_Main.Bt_SearchClick(Sender: TObject);
var
     sSQL : String;
     i    : integer;
begin
     if  ed_empno.Text = '' then
     begin
          MessageDlg('사원을 먼저 선택해 주시기 바랍니다.', mtWarning, [mbOK], 0);
          System.Exit;
     end;

     memo1.Lines.Clear;
     memo1.Height     := 600;
     if  Check = 0 then
     begin
          sSQL := 'SELECT MEMODATE, WRITEEMP||'' - ''||                                      '+
                  '       (select korname from pimpmas where empno = a.writeemp) WRITENAME,  '+
                  '       VALTEXT, COMTEXT, PERTEXT                                          '+
                  '  FROM PEHDIARY a                                                         '+
                  ' WHERE empno    = '''+ed_empno.Text   +'''                                '+
                  '   and orgnum   = '''+Porgnum         +'''                                '+
                  '   and jobdept  = '''+Pdeptcode       +'''                                '+
                  ' Order by memodate                                                        ';
          With TDS do
          begin
              Close;
              ClearFieldInfo;
              AddField('MEMODATE'     , ftString,  2000 );
              AddField('WRITENAME'    , ftString,  2000 );
              AddField('VALTEXT'      , ftString,  2000 );
              AddField('COMTEXT'      , ftString,  2000 );
              AddField('PERTEXT'      , ftString,  2000 );
              Sql.Clear;
              Sql.Text := sSQL;
              ServiceName := 'HINSA_select3';
              Open;
              if  RecordCount > 0 then
              begin
                   for i := 0 to  RecordCount-1 do
                   begin
                        Memo1.Lines.Add('[ '+copy(TDS.FieldByName('MEMODATE').AsString,1,4)+'-'
                                            +copy(TDS.FieldByName('MEMODATE').AsString,5,2)+'-'
                                            +copy(TDS.FieldByName('MEMODATE').AsString,7,2)+'   '
                                            +TDS.FieldByName('WRITENAME').AsString+' ]');
                        if trim(TDS.FieldByName('VALTEXT').AsString) <> '' then
                        Memo1.Lines.Add('⊙ Values : '+TDS.FieldByName('VALTEXT').AsString);
                        if trim(TDS.FieldByName('COMTEXT').AsString) <> '' then
                        Memo1.Lines.Add('⊙ 역  량 : '+TDS.FieldByName('COMTEXT').AsString);
                        if trim(TDS.FieldByName('PERTEXT').AsString) <> '' then
                        Memo1.Lines.Add('⊙ 업  적 : '+TDS.FieldByName('PERTEXT').AsString);
                        Memo1.Lines.Add(' ');
                        next;
                   end;
              end;
          end;
          Ed_empno.Enabled     :=False;
          Bt_Save.Visible      :=False;
          BT_Confirm.Visible   :=False;
          Memo1.Visible        :=True;
          Bt_Search.Caption    := '육성일지 열람취소';
          check := 1;
     end
     else
     begin
          Ed_empno.Enabled     :=True;
          Memo1.Visible        :=false;
          Bt_Search.Caption    := '육성일지 열람';
          check := 0;
          ConFirm_BtnVisible;
     end;
end;

procedure TFM_Main.BT_HelpClick(Sender: TObject);
begin
     FHelp := TFHelp.Create(nil); // 도움말
     FHelp.Show;
end;

procedure TFM_Main.Ed_empnoCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
     if  Fm_EmpForm.Korname <> '' then
     begin
          Ed_empno.Text           := Fm_EmpForm.empno;
          L_korname.ValueCaption  := Fm_EmpForm.Korname;
          PFinyn                  := Fm_EmpForm.Finyn;
          PConyn                  := Fm_EmpForm.Conyn;
          EGubun                  := Fm_EmpForm.EGubun;
          Select_BaseData;
          OpinionView;
          ConFirm_BtnVisible;
     end;
end;

procedure TFM_Main.Ed_empnoInitPopup(Sender: TObject);
begin
     Fm_EmpForm.Edit        := TOnWinPopupEdit(Sender);
     Fm_EmpForm.empno       := E_empno.Text;
     Fm_EmpForm.SqlOpen;
     TOnWinPopupEdit(Sender).PopupControl := Fm_EmpForm ;
end;

procedure TFM_Main.Ed_empnoKeyPress(Sender: TObject; var Key: Char);
begin
     if Key = Chr(13) then
     begin
          Select_BaseData;
          OpinionView;
          Key := #0;
     end;
end;

procedure TFM_Main.Bt_EempnoClick(Sender: TObject);
begin
     Ed_empnoInitPopup(Sender);
     Ed_empno.Perform(WM_KEYDOWN, VK_F2, 0);
end;

procedure TFM_Main.ConFirm_BtnVisible;
begin
     if  (Pempno = Workemp1) or (Pempno = Workemp2) or (Pempno = Workemp3)      or
         (Pempno = Workemp4) or (Pempno = Workemp5) or (copy(Pempno,1,1) = 'D') then
     begin
          E_empno.Visible    := True;
          BT_eempno.Visible  := True;
     end
     else
     begin
          E_empno.Visible    := False;
          BT_eempno.Visible  := False;
     end;

     if (Egubun = '1차') and (PFinyn = 'Y') then
     begin
          Bt_OK.Visible         := False;
          E_MIDVALVIEW.ReadOnly := True;
          E_MIDCOMVIEW.ReadOnly := True;
          E_MIDPERVIEW.ReadOnly := True;
          E_MIDTOTVIEW.ReadOnly := True;
          Label1.Visible        := False;
          Bt_Search.Visible     := True;
          Bt_Search1.Visible    := True;
          BT_Help.Visible       := False;
          BT_Save.Visible       := False;
          BT_Confirm.Visible    := False;
          BT_Print.Visible      := True;
          BT_Exit.Visible       := True;
     end
     else
     if (Egubun = '1차') and (PFinyn = 'N') then
     begin
          Bt_OK.Visible         := False;
          E_MIDVALVIEW.ReadOnly := False;
          E_MIDCOMVIEW.ReadOnly := False;
          E_MIDPERVIEW.ReadOnly := False;
          E_MIDTOTVIEW.ReadOnly := False;
          Label1.Visible        := True;
          Bt_Search.Visible     := True;
          Bt_Search1.Visible    := True;
//          BT_Help.Visible       := True;
          BT_Save.Visible       := True;
          BT_Confirm.Visible    := True;
          BT_Print.Visible      := True;
          BT_Exit.Visible       := True;
     end
     else
     if (Egubun = '2차') then
     begin
          E_MIDVALVIEW.ReadOnly := True;
          E_MIDCOMVIEW.ReadOnly := True;
          E_MIDPERVIEW.ReadOnly := True;
          E_MIDTOTVIEW.ReadOnly := True;
          Label1.Visible        := False;
          Bt_Search.Visible     := False;
          Bt_Search1.Visible    := False;
          BT_Help.Visible       := False;
          BT_Save.Visible       := False;
          BT_Confirm.Visible    := False;
          BT_Print.Visible      := True;
          BT_Exit.Visible       := True;
          if (PFinyn = 'Y') and (Pconyn = 'N') then
             Bt_OK.Visible         := True
          else
             Bt_OK.Visible         := False;
     end;
end;

procedure TFM_Main.E_EmpnoEnter(Sender: TObject);
begin
     Ed_Empno.Text             := '';
     L_korname.ValueCaption    := '';
     L_Payraname.ValueCaption  := '';
     L_deptname.ValueCaption   := '';

     On_Value.Clear;
     On_Comp.Clear;
     TDS_Works.Close;
     TDS_Works1.Close;
     E_MIDVALVIEW.Clear;
     E_MIDCOMVIEW.Clear;
     E_MIDTOTVIEW.Clear;

     MidperView_Clear;

     Bt_Search.Visible  := False;
     Bt_Search1.Visible := False;
     BT_Help.Visible    := False;
     BT_Save.Visible    := False;
     BT_Confirm.Visible := False;
     BT_Print.Visible   := False;
end;

procedure TFM_Main.DBG_worksCellClick(Column: TColumn);
begin
     P_Gubun.Caption      := '개별';
     P_Taskcode.Caption   := TDS_Works.Fieldbyname('SEQNO').AsString;
     P_propeltask.Caption := TDS_Works.Fieldbyname('PROPELTASK').AsString;
     P_mainweight.Caption := TDS_Works.Fieldbyname('MAINWEIGHT').AsString;
     E_MIDPERVIEW.Lines.Clear;
     E_MIDPERVIEW.Lines.Add(TDS_Works.Fieldbyname('E1MIDPERVIEW1').AsString);
end;

procedure TFM_Main.BT_InsertClick(Sender: TObject);
begin
     if  P_Gubun.Caption = '' then
     begin
         MessageDlg('먼저 중점추진업무를 선택하세요.',mtInformation,[mbOK],0);
         exit;
     end;

     if  P_Gubun.Caption = '개별' then
     begin
          with TMaxDataSet do
          begin
               ServiceName := 'PEA1060A_dml';
               Close;
               Sql.Clear;
               SQL.Text  := 'Update PEHREAIM_DET                                                           '+
                            '   Set E1MIDPERVIEW1 = '''+ E_MIDPERVIEW.text +'''                             '+
                            ' Where RABASDATE    = '''+ sRabasdate      +'''                               '+
                            '   And EMPNO        = '''+ Ed_empno.Text   +'''                               '+
                            '   And SEQNO        = '  + TDS_Works.Fieldbyname('SEQNO').AsString+'          '+
                            '   And MAINWEIGHT   = '''+ TDS_Works.Fieldbyname('MAINWEIGHT').AsString+'''   ';
               Execute;
          end;
     end
     else
     if  P_Gubun.Caption = '공동' then
     begin
          with TMaxDataSet do
          begin
               ServiceName := 'PEA1060A_dml';
               Close;
               Sql.Clear;
               SQL.Text  := 'Update PEHREAIM_BASDET                                                        '+
                            '   Set E1MIDPERVIEW1 = '''+ E_MIDPERVIEW.text +'''                             '+
                            ' Where RABASDATE    = '''+ sRabasdate      +'''                               '+
                            '   And EMPNO        = '''+ Ed_empno.Text   +'''                               '+
                            '   And TASKCODE     = '  + TDS_Works1.Fieldbyname('TASKCODE').AsString  +'    '+
                            '   And MAINWEIGHT   = '''+ TDS_Works1.Fieldbyname('MAINWEIGHT').AsString+'''  ';
               Execute;
          end;
     end;
     Works_data;
end;

procedure TFM_Main.DBG_works1CellClick(Column: TColumn);
begin
     P_Gubun.Caption      := '공동';
     P_Taskcode.Caption   := TDS_Works1.Fieldbyname('TASKCODE').AsString;
     P_propeltask.Caption := TDS_Works1.Fieldbyname('TASKNAME').AsString;
     P_mainweight.Caption := TDS_Works1.Fieldbyname('MAINWEIGHT').AsString;
     E_MIDPERVIEW.Lines.Clear;
     E_MIDPERVIEW.Lines.Add(TDS_Works1.Fieldbyname('E1MIDPERVIEW1').AsString);
end;

procedure TFM_Main.BT_PrintClick(Sender: TObject);
begin
     if  ed_empno.Text = '' then
     begin
          MessageDlg('사원을 먼저 선택해 주시기 바랍니다.', mtWarning, [mbOK], 0);
          System.Exit;
     end;
     Label1.Visible       := False;
     E_Empno.Visible      := False;
     Bt_Eempno.Visible    := False;
     Bt_Search.Visible    := False;
     Bt_Search1.Visible   := False;
     BT_Help.Visible      := False;
     BT_Save.Visible      := False;
     BT_Confirm.Visible   := False;
     BT_Print.Visible     := False;
     BT_Exit.Visible      := False;
     MidperView_Clear;
     P_propeltask.Caption := '';
     E_MIDPERVIEW.Text    := '';


     if  check = 1 then
     begin
          Printer.Orientation := poLandscape;
          FM_Main.PrintScale  := poPrintToFit;
          FM_Main.Print;
          ConFirm_BtnVisible;
          MidperView_Clear;
          BT_Save.Visible      := False;
          BT_Confirm.Visible   := False;
     end
     else
     begin
          QuickReport1.Preview;
          ConFirm_BtnVisible;
          MidperView_Clear;
     end;
end;

function TFM_Main.FL_CheckNullEvalview:Boolean; // 하나라도 등록 안한 항목이 있는지를 체크
begin
     with TMaxDataSet do
     begin
          SQL.Clear;
          SQL.Text := format('select count(*) SEL_DATA from pehremas                         '+
                             ' where ((E1MIDVALVIEW is null) or (LENGTH(E1MIDVALVIEW) <15))  '+
                             '   and empno     =''%s''                                       '+
                             '   and rabasdate =''%s''                                       ',
                             [ED_empno.text, sRabasdate]);
          Close;
          ServiceName := 'PED0000A_common';
          ClearFieldInfo;
          AddField('SEL_DATA', ftInteger, 100);
          Open;
          if  TMaxDataSet.FieldByName('SEL_DATA').AsInteger >  0 then
               Result := False
          else
               Result := True;
     end;
end;

function TFM_Main.FL_CheckNullEcomview:Boolean; // 하나라도 등록 안한 항목이 있는지를 체크
begin
     with TMaxDataSet do
     begin
          SQL.Clear;
          SQL.Text := format('select count(*) SEL_DATA from pehremas                         '+
                             ' where ((E1MIDCOMVIEW is null) or (LENGTH(E1MIDCOMVIEW) <15))  '+
                             '   and empno     =''%s''                                       '+
                             '   and rabasdate =''%s''                                       ',
                             [ED_empno.text, sRabasdate]);
          Close;
          ServiceName := 'PED0000A_common';
          ClearFieldInfo;
          AddField('SEL_DATA', ftInteger, 100);
          Open;
          if  TMaxDataSet.FieldByName('SEL_DATA').AsInteger >  0 then
               Result := False
          else
               Result := True;
     end;
end;

function TFM_Main.FL_CheckNullEperview:Boolean; // 하나라도 등록 안한 항목이 있는지를 체크
begin
     if  TDS_WORKS.RecordCount > 0 then
     begin
          with TMaxDataSet do
          begin
               SQL.Clear;
               SQL.Text := format('select count(*) SEL_DATA from pehreaim_Det                 '+
                                  ' where (Propeltask is not null and E1MIDPERVIEW1 is null)   '+
                                  '   and empno     =''%s''                                   '+
                                  '   and rabasdate =''%s''                                   ',
                                  [ED_empno.text, sRabasdate]);
               Close;
               ServiceName := 'PED0000A_common';
               ClearFieldInfo;
               AddField('SEL_DATA', ftInteger, 100);
               Open;
               if  TMaxDataSet.FieldByName('SEL_DATA').AsInteger >  0 then
               begin
                    Result := False;
                    exit;
               end
               else
                    Result := True;
          end;
     end;
     if  TDS_WORKS1.RecordCount > 0 then
     begin
          with TMaxDataSet do
          begin
               SQL.Clear;
               SQL.Text := format('select count(*) SEL_DATA from pehreaim_BasDet              '+
                                  ' where (taskNAME is not null and E1MIDPERVIEW1 is null)     '+
                                  '   and empno     =''%s''                                   '+
                                  '   and rabasdate =''%s''                                   ',
                                  [ED_empno.text, sRabasdate]);
               Close;
               ServiceName := 'PED0000A_common';
               ClearFieldInfo;
               AddField('SEL_DATA', ftInteger, 100);
               Open;
               if  FieldByName('SEL_DATA').AsInteger >  0 then
               begin
                    Result := False;
                    exit;
               end
               else
                    Result := True;
          end;
     end;
     Result := True;
end;

function TFM_Main.FL_CheckNullEtotview:Boolean; // 하나라도 등록 안한 항목이 있는지를 체크
begin
     with TMaxDataSet do
     begin
          SQL.Clear;
          SQL.Text := format('select count(*) SEL_DATA from pehremas                         '+
                             ' where ((E1MIDTOTVIEW is null) or (LENGTH(E1MIDTOTVIEW) <15))  '+
                             '   and empno     =''%s''                                       '+
                             '   and rabasdate =''%s''                                       ',
                             [ED_empno.text, sRabasdate]);
          Close;
          ServiceName := 'PED0000A_common';
          ClearFieldInfo;
          AddField('SEL_DATA', ftInteger, 100);
          Open;
          if  TMaxDataSet.FieldByName('SEL_DATA').AsInteger >  0 then
               Result := False
          else
               Result := True;
     end;
end;

procedure TFM_Main.BT_ConfirmClick(Sender: TObject);
begin
     BT_SaveClick(BT_Confirm);
(*
     if  not FL_CheckNullEvalview then
     begin
          MessageDlg('"◎ Values"에 의견을 최소 15자 이상 기술하시고 [저장]하신 후 [최종완료]하여 주시기 바랍니다.', mtWarning, [mbOK], 0);
          System.Exit;
     end;

     if  not FL_CheckNullEcomview then
     begin
          MessageDlg('"◎ Competency  : 역량"에 의견을 최소 15자 이상 기술하시고 [저장]하신 후 [최종완료]하여 주시기 바랍니다.', mtWarning, [mbOK], 0);
          System.Exit;
     end;

     if  not FL_CheckNullEperview then
     begin
          MessageDlg('"◎ Performance : 업적"에 의견 등록하지 않은 항목이 있습니다.'+#13+#13+
                     '의견 등록 완료 후 [최종완료] 하시기 바랍니다.', mtWarning, [mbOK], 0);
          System.Exit;
     end;

     if  not FL_CheckNullEtotview then
     begin
          MessageDlg('"◎ 종합의견"에 의견을 최소 15자 이상 기술하시고 [저장]하신 후 [최종완료]하여 주시기 바랍니다.', mtWarning, [mbOK], 0);
          System.Exit;
     end;
*)
     if MessageBox(handle,PChar('최종완료를 하시면 등록하신 내역을 수정하실 수 없습니다.'+#13+#13+

                                '등록하신 내역에 대해 모두 확인을 마치셨으면 최종완료를 하시기 바랍니다.'+#13+#13+

                                '최종완료를 하시겠습니까?'), '확 인',  MB_YESNO or MB_DEFBUTTON2) <> IDYES then
     begin
          system.Exit;
     end;

     with TMaxDataSet do
     begin
          ServiceName := 'PEA1060A_dml';
          Close;
          Sql.Clear;
          SQL.Text  := 'Update pehremas                                        '+
                       '   Set E1MIDCONYN    = ''Y'',                          '+
                       '       E1MIDCONDATE  = to_char(sysdate,''YYYYMMDD''),  '+
                       '       Writeemp      = '''+ Pempno          +''',      '+
                       '       Writetime = to_char(sysdate,''YYYYMMDDHHMISS'') '+
                       ' WHERE rabasdate = '''+ sRabasdate +'''                '+
                       '   AND empno     = '''+ Ed_empno.Text +'''             ';

          Execute;
     end;

     if  TDS_works.RecordCount > 0 then
     begin
          with TMaxDataSet do
          begin
               ServiceName := 'PEA1060A_dml';
               Close;
               Sql.Clear;
               SQL.Text  := 'insert into  pehcoach                                         '+
                            'Select RABASDATE, EMPNO,  ''개별'',  SEQNO,                   '+
                            '       PROPELTASK, MAINWEIGHT, E1MIDPERVIEW1,                  '+
                            '       '''+ Pempno +''', to_char(sysdate,''YYYYMMDDHHMISS'')  '+
                            '  from pehreaim_det                                           '+
                            ' WHERE rabasdate = '''+ sRabasdate +'''                       '+
                            '   AND empno     = '''+ Ed_empno.Text +'''                    ';

               Execute;
          end;
     end;

     if  TDS_works1.RecordCount > 0 then
     begin
          with TMaxDataSet do
          begin
               ServiceName := 'PEA1060A_dml';
               Close;
               Sql.Clear;
               SQL.Text  := 'insert into  pehcoach                                         '+
                            'Select RABASDATE, EMPNO, ''공동'',  TASKCODE,                  '+
                            '       TASKNAME, MAINWEIGHT, E1MIDPERVIEW1,                    '+
                            '       '''+ Pempno +''', to_char(sysdate,''YYYYMMDDHHMISS'')  '+
                            '  from pehreaim_basdet                                        '+
                            ' WHERE rabasdate = '''+ sRabasdate +'''                       '+
                            '   AND empno     = '''+ Ed_empno.Text +'''                    ';

               Execute;
          end;
     end;

     MessageDlg('최종완료 작업을 성공적으로 저장하였습니다.', mtInformation, [mbOK], 0);
     PFinyn := 'Y';
     ConFirm_BtnVisible;
(*
     if trim(LE2empno) <> '' then
     begin
          if MessageBox(handle,PChar('위 구성원의 2차평가자께 성과 Review 확인요청 메일을 전송하시겠습니까?'+#13+#13), '확 인',  MB_YESNO or MB_DEFBUTTON2) <> IDYES then
               system.Exit;
          //////////////////////////////////////////////////////////////////////////////
          //EAI 연동을 통한 Web BroadNet으로 메일 발송을 위하여 PZHMAIL 테이블에 Insert...
          SendProgID  := 'PEH1020A';
          SendEmpno   := LE1empno;
          RcveEmpno   := LE2empno;
          MailSubject := '[확인요청] 성과 Review';
          MailBody    := '[사번]'+Ed_empno.text+'  [성명]'+L_Korname.ValueCaption+'  [부서]'+L_Deptname.ValueCaption+#13+#13+
                         '위 구성원의 성과 Review를 완료하였습니다.'+#13+#13+
                         '확인해 주시기 바랍니다.'+#13+#13+
                         '[확인화면위치 안내] : 종합인사시스템 - 평가 - 육성일지/성과 Review - 성과 Review';
          ReceiveYN   := 'N';

          if not Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN) then
          begin
               MessageDlg(' 2차평가자 확인요청 메일전송이 실패 하였습니다...',mtError, [mbOk], 0);
               exit;
          end
          else MessageDlg(' 2차평가자 확인요청 메일전송을 성공 하였습니다...',mtError, [mbOk], 0);
          //////////////////////////////////////////////////////////////////////////////
     end;
*)
end;

procedure TFM_Main.E_MIDVALVIEWKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var  i : word;
     ViewText : string;
begin
     i := 222;
     if  key = i then
     begin
          Messagedlg('작은따옴표는 입력하실 수 없습니다.',mtError,[mbOK],0);
          ViewText := copy(E_MIDVALVIEW.text, 1, Length(TOnMemo(Sender).text)-1);
          TOnMemo(Sender).Clear;
          TOnMemo(Sender).Lines.Append(ViewText);
     end;
end;

procedure TFM_Main.E_MIDVALVIEWExit(Sender: TObject);
begin
     if TOnMemo(Sender).Lines.Count > 6 then
     begin
          Messagedlg('내용을 6줄이하로 작성해 주시기 바랍니다.',mtWarning,[mbOK],0);
          TOnMemo(Sender).SetFocus;
     end;
end;

procedure TFM_Main.Bt_OKClick(Sender: TObject);
begin
     if MessageBox(handle,PChar('해당 사원의 성과 Review를 승인하시겠습니까?'), '확 인',  MB_YESNO or MB_DEFBUTTON2) <> IDYES then
     begin
          system.Exit;
     end;

     with TMaxDataSet do
     begin
          ServiceName := 'PEA1060A_dml';
          Close;
          Sql.Clear;
          SQL.Text  := 'Update pehremas                                        '+
                       '   Set E2MIDCONYN    = ''Y'',                          '+
                       '       E2MIDCONDATE  = to_char(sysdate,''YYYYMMDD''),  '+
                       '       Writeemp      = '''+ Pempno          +''',      '+
                       '       Writetime = to_char(sysdate,''YYYYMMDDHHMISS'') '+
                       ' WHERE rabasdate = '''+ sRabasdate +'''                '+
                       '   AND empno     = '''+ Ed_empno.Text +'''             ';

          if Execute then
          begin
               Bt_OK.Visible := False;
               Pconyn := 'Y';
          end;
     end;

end;

Function TFM_Main.Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String) : Boolean;
begin
     with TMaxDataSet do
     begin
          ServiceName := 'PIT1030A_DML';
          Close;
          SQL.Clear;
          SQL.Add('insert into PZHMAIL                         ');
          SQL.Add('values (to_char(sysdate,''YYYYMMDDHHMISS''),');  //SENDTIME   메일발송 작업시간
          SQL.Add('        '''+ SendProgID   +''',             ');  //SENDPROG   발송프로그램 ID
          SQL.Add('        '''+ SendEmpno    +''',             ');  //SEND_PER   발신자 사번
          SQL.Add('        '''+ RcveEmpno    +''',             ');  //RCVR_PER,  수신자 사번
          SQL.Add('        ''''                  ,             ');  //REFR_PER   불필요(종합인사)
          SQL.Add('        '''+ MailSubject  +''',             ');  //SUBJECT    메일제목
          SQL.Add('        ''''                  ,             ');  //HEADER1    불필요(종합인사)
          SQL.Add('        '''+ MailBody     +''',             ');  //BODY1      메일내용
          SQL.Add('        ''''                  ,             ');  //TAIL1      불필요(종합인사)
          SQL.Add('        '''+ ReceiveYN    +''',             ');  //RECEIVEYN  'Y' 일경우 메일 읽었을경우 송신자에게 수신확인 메일 보내주기
          SQL.Add('        ''N''                 ,             ');  //EAI_FLAG
          SQL.Add('        ''''                  )             ');  //EAI_DATE

          try
               Execute;
          except
               Result := false;
               exit;
          end;
          Result := True;
     end;
end;

procedure TFM_Main.Bt_Search1Click(Sender: TObject);
var LSfilename, GSHomeDir : string;
    LAarg : array[0..200] of char;
begin
  if  length(Ed_empno.Text) < 4  then
  begin
    MessageDlg('조회할 사번을 정확히 입력해 주세요.' ,mtError,[mbOK],0);
    System.Exit;
  end;

  //자기진단서 및 경력계획서 조회
  FM_DownLoad := TFM_DownLoad.Create(Application);
  FM_DownLoad.Show;
  FM_DownLoad.PL_ReadEnv;                     //환경변수값(파라미터) 읽어온다.
  FM_DownLoad.PL_VersionCHK3(3, 'PEA1180F');  //Call하는 단위 프로그램의 버젼을 체크..
  if  (not FM_DownLoad.FL_VersionCHK ) or
   (not FileExists(GSHomeDir+'\Bin\3tier\PEA1180F.EXE')) then
  begin
    FM_DownLoad.PL_DownLoad(3,'/hper/insa/hperson/usrbin/Ebin','PEA1180F.EXE','PEA1180F',FM_DownLoad.FL_ProgVer, FL_UnixIP, FL_FtpUser, FL_FtpPass);
  end
  else
  begin
    FM_DownLoad.SB_Help.Panels[1].Text := '로컬PC의 프로그램을 실행합니다.';
    LSfilename := GSHomeDir          +'\Bin\3Tier\PEA1180F.EXE ,'
                + Ed_empno.Text      +','+Passemp(cmdline,2) +','+'@@@@@' +','
                + Passemp(cmdline,4) +','+Passemp(cmdline,5) +','+Passemp(cmdline,6) +','
                + Passemp(cmdline,7) +','+Passemp(cmdline,8) +','+Passemp(cmdline,9) +','
                + Passemp(cmdline,10)+','+Passemp(cmdline,11)+','+Passemp(cmdline,12)+','
                + Passemp(cmdline,13)+','+Passemp(cmdline,14)+','+Passemp(cmdline,15);

    strpcopy( LAarg, LSfilename );
    winexec(LAarg, SW_SHOWNORMAL);

    FM_DownLoad.Close;      // 다운로드 폼 닫기.
  end;
end;

end.
