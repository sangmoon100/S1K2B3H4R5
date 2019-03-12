unit UDiaryForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, OnFocusButton, OnEditMemo, OnEditMdate, ExtCtrls, OnShapeLabel,
  OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl, OnPopupEdit, Tmax_session,
  OnScheme, Db, Tmax_DataSetText, TmaxFunc, Oninsacommon, OnDBEditCtrl,
  Mask, pebtnedit, PeJeonBtnDateEdit, MemDS, DBAccess, Func, Grids,
  OnPimcalendar, ImgList, Buttons, DBGrids, OnGrDBGrid, peoutlookbtn,
  OnDBGrid;
  
type
  TDiaryForm = class(TForm)
    SF_Main: TOnSchemeForm;
    Panel1: TPanel;
    E_MemoDate: TOnDateEdit;
    TCDS: TTMaxDataSet;
    E_EMPNO: TOnWinPopupEdit;
    L_korname: TOnShapeLabel;
    L_Payraname: TOnShapeLabel;
    L_jobdept: TOnShapeLabel;
    L_DeptName: TOnShapeLabel;
    ExitBtn: TOnFocusButton;
    Edit1: TEdit;
    TDml: TTMaxDataSet;
    Panel2: TPanel;
    TMaxSession: TTMaxSession;
    Button1: TButton;
    TCSel: TTMaxDataSet;
    E_RATEITEM: TOnMemo;
    E_WELLPOINT: TOnMemo;
    E_NEEDSITEM: TOnMemo;
    Bt_print: TOnFocusButton;
    E_BIGOTEXT: TOnMemo;
    P_Seqno: TPanel;
    B_Add1: TPeJeonOutLookBtn;
    B_Save1: TPeJeonOutLookBtn;
    B_del1: TPeJeonOutLookBtn;
    B_Cancel1: TPeJeonOutLookBtn;
    OnShapeLabel1: TOnShapeLabel;
    Q_Diary: TTMaxDataSet;
    DataSource1: TDataSource;
    Grid_Diary: TOnDBGrid;
    procedure E_EMPNOCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure E_EMPNOInitPopup(Sender: TObject);
    procedure E_EMPNOKeyPress(Sender: TObject; var Key: Char);
    procedure ExitBtnClick(Sender: TObject);
    procedure Bt_insertClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Bt_printClick(Sender: TObject);
    procedure E_RATEITEMKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure B_Add1Click(Sender: TObject);
    procedure B_Cancel1Click(Sender: TObject);
    procedure B_del1Click(Sender: TObject);
    procedure Grid_DiaryDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    START: Boolean;
    gbChanged: Boolean;

    Writeemp, Wempno, WKorname,AEMPNO : String;
    Pempno, Pkorname, Password, Ppermission, Pjobgun, Ppayra, Ppayrayn: String;
    Ppaycl : String;
    Porgnum, Pdeptcode, PSysdate: string;
    PfrBasedate, PtoBasedate: String;
    Lgubun     : Integer;
    gubun      : Integer;
    check      : Integer;
    EempFind   : Boolean;
    FL_Start   : Boolean;
    FL_Ins     : Boolean;
    FL_SchItem : TOnSchItem;
    function TCsel_gfd(p_loc: Integer): String;
    function fnSetVariable(mGubun: Integer): Boolean;
    procedure ComponentClear;
    procedure MemoClear;
    procedure Diary_data;
    procedure Edit_Enabled(TFlag : Boolean);
  end;

var
  DiaryForm: TDiaryForm;
  WorkEmp1 : String;
  WorkEmp2 : String;
  WorkEmp3 : String;
  WorkEmp4 : String;
  WorkEmp5 : String;

implementation

uses UEmpForm, UHelp, UPrintForm;

{$R *.DFM}

function TDiaryForm.TCsel_gfd(p_loc: Integer): String;
var  v_cnt, v_tmp: Integer;
     v_data: String;
begin
     Result := '';
     v_data := TCsel.FieldByName('CNT').AsString;
     v_cnt := 1;
     while v_cnt < p_loc do
     begin
       v_tmp := Pos(';',v_data);
       if not(v_tmp > 0) then Exit;
       v_cnt := v_cnt + 1;
       Delete(v_data, 1, v_tmp);
     end;
     v_tmp := Pos(';',v_data) - 1;
     if v_tmp < 0 then v_tmp := Length(v_data);
     Result := Copy(v_data,1,v_tmp);
end;

function TDiaryForm.fnSetVariable(mGubun: Integer): Boolean;
var  sTemp: String;
begin
     Result := False;

     case mGubun of
          0 : begin
                sTemp:= 'SELECT nvl(  korname  ,'' '') || '';'' ||     '+
                        '       nvl(  jobpayra ,'' '') || '';'' ||     '+
                        '       nvl(  jobgun   ,'' '') || '';'' ||     '+
                        '       nvl(  orgnum   ,'' '') || '';'' ||     '+
                        '       nvl(  deptcode ,'' '') || '';'' ||     '+
                        '       nvl(  jobpayrayn  ,'' '') || '';'' ||  '+
                        '       nvl(  paycl    ,'' '')                 '+
                        '  FROM pimpmas                                '+
                        ' WHERE empno = '''+Aempno+'''                 ';
              end;
          1 : begin
                sTemp:= Format('SELECT nvl(  value1   ,'' '') || '';'' ||   '+
                               '       nvl(  value2   ,'' '')               '+
                               '  FROM pishrvari                            '+
                               ' WHERE gubun = ''%s'' AND sgubun = ''%s''   ',['00','0004']); // 등록일
              end;
          2 : begin
                sTemp:= 'SELECT nvl(to_char(sysdate,''YYYYMMDDHH24MISSD''),'' '') FROM dual';
              end;
          else  System.Exit;
     end;

     with TCsel do
     begin
          Close;
          ClearFieldInfo;
          AddField('CNT', ftString, 300);
          Sql.Clear;
          Sql.Text := sTemp;
          ServiceName := 'PIT1030A_SEL1';
          Open;
     end;
     case mGubun of
       0 : begin
             Pkorname    := TCsel_gfd(1);
             Ppayra      := TCsel_gfd(2);
             Pjobgun     := TCsel_gfd(3);
             Porgnum     := TCsel_gfd(4);
             PDeptcode   := TCsel_gfd(5);
             Ppayrayn    := TCsel_gfd(6);
             Ppaycl      := TCsel_gfd(7);
           end;
       1 : begin
             PfrBasedate := TCsel_gfd(1);
             PtoBasedate := TCsel_gfd(2);
           end;
       2 :   pSysdate    := TCsel_gfd(1);
       3 :   pKorName    := TCsel_gfd(1);
     end;

     TCsel.Close;
     Result := True;
end;

procedure TDiaryForm.E_EMPNOCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
     if Fm_Emp.empno <> '' then
     begin
          E_empno.Text            := Fm_Emp.empno;
          L_korname.ValueCaption  := Fm_Emp.Korname;
          L_Jobdept.Hint          := Fm_Emp.orgnum;
          L_Jobdept.ValueCaption  := Fm_Emp.Deptcode;
          L_deptname.ValueCaption := Fm_Emp.Deptname;
          L_payraname.ValueCaption:= Fm_Emp.Payraname;
          B_Cancel1Click(Sender);
     end;
end;

procedure TDiaryForm.E_EMPNOInitPopup(Sender: TObject);
begin
     Fm_Emp.Edit        := TOnWinPopupEdit(Sender);
     Fm_Emp.empno       := Aempno;
     Fm_Emp.SqlOpen;
     TOnWinPopupEdit(Sender).PopupControl := Fm_Emp ;
end;

procedure TDiaryForm.E_EMPNOKeyPress(Sender: TObject; var Key: Char);
begin
     if Key = Chr(13) then
     begin
          //Bt_SrhClick(Sender);
          inherited;
          Key := #0;
     end;
end;

procedure TDiaryForm.ExitBtnClick(Sender: TObject);
begin
     Close;
end;

procedure TDiaryForm.Diary_data;
var  sSQL,memodate: String;
begin
     MemoClear;

     memodate := copy(E_Memodate.text,1,4)+copy(E_Memodate.text,6,2)+copy(E_Memodate.text,9,2);

     sSQL := 'SELECT MEMODATE,WRITEEMP,                                                 '+
             '       (select korname from pimpmas where empno = a.writeemp) WRITENAME,  '+
             '       EMPNO, (select korname from pimpmas where empno = a.empno) KORNAME '+
             '  FROM PEPDIARY a                                                         '+
             ' WHERE empno    = '''+e_empno.Text  +'''                                  '+
             '   and orgnum   = '''+L_jobdept.Hint +'''                                 '+
             '   and jobdept  = '''+L_jobdept.ValueCaption +'''                         ';

     With TCDS do
     begin
          Close;
          ClearFieldInfo;
          AddField('MEMODATE'     , ftString,  100 );
          AddField('WRITEEMP'     , ftString,  100 );
          AddField('WRITENAME'    , ftString,  100 );
          AddField('EMPNO'        , ftString,  100 );
          AddField('KORNAME'      , ftString,  100 );
          Sql.Clear;
          Sql.Text := sSQL;
          ServiceName := 'HINSA_select';
          Open;
          if not eof then
             Writeemp := TCDS.FieldByName('Writeemp').AsString;
     end;

     sSQL :=  'SELECT MEMODATE, SEQNO, RATEITEM, WELLPOINT, NEEDSITEM '+
              '      , BIGOTEXT                                       '+
              '  FROM PEPDIARY a                                      '+
              ' WHERE empno    = '''+e_empno.Text  +'''               '+
              '   and orgnum   = '''+L_jobdept.Hint +'''              '+
              '   and jobdept  = '''+L_jobdept.ValueCaption +'''      '+
              ' Order by MEMODATE DESC, SEQNO DESC                    ';

     with Q_Diary do
     begin
          Close;
          ServiceName := 'PEH2020A_sel1';
          ClearFieldInfo;
          AddField('MEMODATE'   , ftString,   8);
          AddField('SEQNO'      , ftString,  10);
          AddField('RATEITEM'   , ftString, 300);
          AddField('WELLPOINT'  , ftString, 500);
          AddField('NEEDSITEM'  , ftString, 500);
          AddField('BIGOTEXT'   , ftString, 100);
          ClearParamInfo;
          SQL.Text := sSQL;
          Open;
          TStringField(FieldByName('MEMODATE' )).EditMask := '9999-99-99;0;';
     end;
end;

procedure TDiaryForm.Bt_insertClick(Sender: TObject);
var  SQLTEXT  : String;
     memodate : String;
begin
     if L_korname.ValueCaption = '' then
     begin
          MessageDlg('팀원을 먼저 선택하세요.',mtError,[mbOK],0);
          System.Exit;
     end;

     if Lgubun = 0 then
     begin
         MessageDlg('프로그램 담당자는 저장할 수 없습니다.',mtError,[mbOK],0);
         System.Exit;
     end;

     if Application.MessageBox('내용을 저장하시겠습니까?','작업안내',mb_yesno) = id_no then
        system.exit;

     memodate := copy(E_Memodate.text,1,4)+copy(E_Memodate.text,6,2)+copy(E_Memodate.text,9,2);
     if gubun = 0 then
     begin
         if (trim(E_RATEITEM.Text) <> '') then
         begin
             SQLText := Format(
                       ' INSERT INTO   PEPDIARY                                                      '+#13+
                       '        (EMPNO,    MEMODATE,   SEQNO,     ORGNUM,   JOBDEPT,                 '+#13+
                       '         RATEITEM, WELLPOINT,  NEEDSITEM, BIGOTEXT, WRITEEMP, WRITETIME)     '+#13+
                       ' VALUES (''%s'',   ''%s'','+P_Seqno.Hint+',''%s'',  ''%s'',                  '+#13+
                       '         ''%s'',   ''%s'',     ''%s'',     ''%s'',  ''%s'',                  '+#13+
                       '         TO_CHAR(SYSDATE, ''YYYYMMDDHH24MISS'')                        )     ',
                       [E_empno.text,
                        memodate,
                        L_jobdept.Hint,
                        L_jobdept.ValueCaption,
                        E_RATEITEM.Text,
                        E_WELLPOINT.Text,
                        E_NEEDSITEM.Text,
                        E_BIGOTEXT.Text,
                        wEmpno]);
         end
         else
         begin
             MessageDlg('저장할 내용이 없습니다.',mtError,[mbOK],0);
             System.Exit;
         end;
     end
     else
     if gubun = 1 then
     begin
         if Writeemp = pEmpno then
         begin
             if  (trim(E_RATEITEM.Text) <> '') then
                SQLText := Format(
                           'UPDATE PEPDIARY  SET                                      ' +#13+
                           '       RATEITEM  = '''+E_RATEITEM.Text+''' ,              ' +#13+
                           '       WELLPOINT = '''+E_WELLPOINT.Text+''' ,             ' +#13+
                           '       NEEDSITEM = '''+E_NEEDSITEM.Text+''' ,             ' +#13+
                           '       BIGOTEXT  = '''+E_BIGOTEXT.Text+''' ,              ' +#13+
                           '       writeemp  = ''%s'' ,                               ' +#13+
                           '       writetime = TO_CHAR(SYSDATE, ''YYYYMMDDHH24MISS'') ' +#13+
                           ' WHERE memodate  = ''%s''                                 ' +#13+
                           '   and seqno     = '+P_Seqno.Hint+'                       ' +#13+
                           '   and empno     = ''%s''                                 ' ,
                           [wEmpno,
                            memodate,
                            E_empno.text]);
         end
         else
         begin
              MessageDlg('의견을 등록하신 분이 아니므로 수정할 수 없습니다.',mtError,[mbOK],0);
              B_cancel1Click(Sender);
              System.Exit;
         end;
     end;

     TDml.Close;
     TDml.Sql.Clear;
     TDml.Sql.Text := SqlText;
     TDml.ServiceName := 'PIT1030A_DML';
     if NOT TDml.Execute then
        MessageDlg('저장 작업 중 에러가 발생하였습니다.'+#13 +
                   '관리자에게 문의하십시오..' ,mtError,[mbOK],0)
     else
     begin
       gbChanged := False;
       MessageDlg('저장 작업이 성공적으로 완료되었습니다.', mtInformation,[mbOK],0);
       B_cancel1Click(Sender);
     end;

end;


procedure TDiaryForm.FormCreate(Sender: TObject);
begin
  FL_Start := True;
  START := True;
  EempFind := True;
  panel2.Height := 425;
  panel2.Top    := 106;
  TMaxSession.EnvFileName := GetHomeDir+'\newhana.env';
  TMaxSession.LabelName   := 'HANAROHPER';
  TMaxSession.Connect     := False;
  TMaxSession.Host        := Hinsa_Param(cmdline,10);
  TMaxSession.Port        := '9999';

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
end;

procedure TDiaryForm.FormPaint(Sender: TObject);
var
  FL_Rect : TRect;
  sTemp : String;
begin
     if FL_Start then
     begin
          FL_Start := False;
          SF_Main.Refresh;

          Pempno   := Hinsa_Param(CmdLine, 1);
          Pkorname := Hinsa_Param(CmdLine, 2);
          Password := Hinsa_Param(CmdLine, 3);
          Ppermission := copy(Hinsa_Param(CmdLine,7),1,1);

          Wempno   := Pempno;
          Wkorname := Pkorname;
          Aempno   := Pempno;   //사번기억 SHM

          B_cancel1Click(Sender);
          Button1Click(sender);
     end;
end;

procedure TDiaryForm.Button1Click(Sender: TObject);
begin
     ComponentClear;

     with TCDS do
     begin
          Close;
          ServiceName := 'HINSA_select';
          Sql.Text    := 'SELECT Value1 workemp1, Value2 Workemp2,             '+
                         '       Value3 Workemp3, Value4 Workemp4,             '+
                         '       Value5 Workemp5                               '+
                         '  from pishrvari                                     '+
                         ' where gubun  = ''00''                               '+
                         '   and sgubun = ''0001''                             ';
          ClearFieldInfo;
          AddField('Workemp1' , ftString, 100);
          AddField('Workemp2' , ftString, 100);
          AddField('Workemp3' , ftString, 100);
          AddField('Workemp4' , ftString, 100);
          AddField('Workemp5' , ftString, 100);
          Open;
          WorkEmp1 := FieldByName('workemp1').AsString;
          WorkEmp2 := FieldByName('workemp2').AsString;
          WorkEmp3 := FieldByName('workemp3').AsString;
          WorkEmp4 := FieldByName('workemp4').AsString;
          WorkEmp5 := FieldByName('workemp5').AsString;
     end;
     if   (Pempno = WorkEmp1)  or (Pempno = WorkEmp2) or
          (Pempno = WorkEmp3)  or (Pempno = WorkEmp4) or
          (Pempno = WorkEmp5)  or (copy(Pempno,1,1) = 'D')   then
     begin
          Aempno   := Edit1.Text;
          edit1.Visible := true;
          Button1.Visible := true;
          Lgubun := 0;
     end;


     if fnSetVariable(0) = False then System.Exit;
     if fnSetVariable(1) = False then System.Exit;  // 등록가능 fr~to
     if fnSetVariable(2) = False then System.Exit;  // 현재일

     if   trim(Ppayrayn) = 'Y' then Lgubun := 2 // 부서장
     else                           Lgubun := 1;

     Application.ProcessMessages;


     Fm_Emp.empno := Aempno;

     Fm_Emp.SqlOpen;
     E_empno.Perform(WM_KEYDOWN, VK_F2, 0);

     if Fm_emp.EmpCount < 1 then
     begin
           MessageDlg('육성일지를 작성하실 팀원이 없습니다.'+#13 ,mtError,[mbOK],0);
           Close;
     end;

//     E_MemoDate.Text        := copy(pSysdate,1,4)+'-'+copy(pSysdate,5,2)+'-'+copy(pSysdate,7,2);
//     SB_monthClick(Sender);
     FL_Ins := True;
     check := 0;
     //  Bt_SrhClick(Sender);
//   E_empnoInitPopup(Sender);
end;

procedure TDiaryForm.ComponentClear;
begin
     E_EMPNO.Text             := '';
     L_korname.ValueCaption   := '';
     L_payraname.ValueCaption := '';
     L_jobdept.ValueCaption   := '';
     L_deptname.ValueCaption  := '';
     E_RATEITEM.Text          := '';
     E_WELLPOINT.Text         := '';
     E_NEEDSITEM.Text         := '';
     E_BIGOTEXT.Text          := '';
end;

procedure TDiaryForm.Bt_printClick(Sender: TObject);
var  sSql : String;
begin
     if L_korname.ValueCaption = '' then
     begin
          MessageDlg('인쇄할 팀원을 먼저 선택하세요.',mtError,[mbOK],0);
          exit;
     end;

     if Q_Diary.recordcount < 1 then
     begin
          MessageDlg('작성하신 내용이 없습니다.',mtError,[mbOK],0);
          exit;
     end;
     PrintForm.QuickRep1.Preview;
end;

procedure TDiaryForm.E_RATEITEMKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var  i : word;
     ViewText : string;
begin
     i := 222;
     if  key = i then
     begin
          Messagedlg('작은따옴표는 입력하실 수 없습니다.',mtError,[mbOK],0);
          ViewText := copy(TOnMemo(Sender).text, 1, Length(TOnMemo(Sender).text)-1);
          TOnMemo(Sender).Clear;
          TOnMemo(Sender).Lines.Append(ViewText);
     end;
end;

procedure TDiaryForm.B_Add1Click(Sender: TObject);
begin
     if L_korname.ValueCaption = '' then
     begin
          MessageDlg('팀원을 먼저 선택하세요.',mtError,[mbOK],0);
          System.Exit;
     end;
     
     B_cancel1Click(Sender);
     gubun := 0;
     with TCDS do
     begin
          SQL.Clear;
          SQL.Text := format('select nvl(max(SEQNO),0)+1 SEL_DATA from PEPDIARY '+
                             ' where EMPNO        =''%s''                       '+
                             '   and MEMODATE     =''%s''                       ',
                              [E_empno.text,copy(pSysdate,1,8)]);
          Close;
          ServiceName := 'PED0000A_common';
          ClearFieldInfo;
          AddField('SEL_DATA', ftString, 100);
          Open;                                      
          P_Seqno.Hint := TCDS.Fields[0].AsString;
     end;
     E_MemoDate.Text  :=  copy(pSysdate,1,4)+'-'+copy(pSysdate,5,2)+'-'+copy(pSysdate,7,2);
     Edit_Enabled(True);
     E_RATEITEM.SetFocus;
end;

procedure TDiaryForm.B_Cancel1Click(Sender: TObject);
begin
     P_Seqno.Hint      := '';
     MemoClear;
     Edit_Enabled(False);

     Diary_data;
end;

procedure TDiaryForm.MemoClear;
begin
     E_MemoDate.Text := '';
     E_RATEITEM.Lines.Clear;
     E_WELLPOINT.Lines.Clear;
     E_NEEDSITEM.Lines.Clear;
     E_BIGOTEXT.Lines.Clear;
end;

procedure TDiaryForm.Edit_Enabled(TFlag : Boolean);
begin
     E_RATEITEM.Enabled   := TFlag;
     E_WELLPOINT.Enabled  := TFlag;
     E_NEEDSITEM.Enabled  := TFlag;
     E_BIGOTEXT.Enabled   := TFlag;
end;

procedure TDiaryForm.B_del1Click(Sender: TObject);
var  memodate : String;
begin
     if  trim(P_Seqno.Hint) = '' then
     begin
          MessageDlg('삭제할 자료가 없습니다.' +#13 + '확인 후 다시입력하십시오.',mtError,[mbOK],0);
          Exit;
     end;

     if MessageBox(handle,PChar('해당 항목을 삭제하시겠습니까?'), '확 인',  MB_YESNO or MB_DEFBUTTON2) <> IDYES then
     begin
          system.Exit;
     end;

     memodate := copy(E_Memodate.text,1,4)+copy(E_Memodate.text,6,2)+copy(E_Memodate.text,9,2);
     if   Writeemp = pEmpno then
     begin
          with TDml do
          begin
               SQL.Clear;

               SQL.Text := format('delete from PEPDIARY                        '+
                                  ' where EMPNO     = ''%s''                   '+
                                  '   and MEMODATE  = ''%s''                   '+
                                  '   and SEQNO     = '+P_Seqno.Hint+'         ',
                                  [E_empno.text, Memodate]);
               Close;
               ServiceName := 'PEA1060A_dml';
               Execute;
          end;
          MessageDlg('해당 항목을 삭제하였습니다.', mtInformation, [mbOK], 0);
     end;
     B_cancel1Click(Sender);
end;

procedure TDiaryForm.Grid_DiaryDblClick(Sender: TObject);
begin
     if  (not Q_Diary.Eof)  then
     begin
          gubun             := 1;
          P_SEQNO.Hint      := Q_Diary.fieldbyname('SEQNO'  ).AsString;
          E_MemoDate.Text   := copy(Q_Diary.fieldbyname('MemoDate').AsString,1,4) +'-'
                             + copy(Q_Diary.fieldbyname('MemoDate').AsString,5,2) +'-'
                             + copy(Q_Diary.fieldbyname('MemoDate').AsString,7,2);
          E_RATEITEM.Text   := Q_Diary.fieldbyname('RATEITEM').AsString;
          E_WELLPOINT.Text  := Q_Diary.fieldbyname('WELLPOINT').AsString;
          E_NEEDSITEM.Text  := Q_Diary.fieldbyname('NEEDSITEM').AsString;
          E_BIGOTEXT.Text   := Q_Diary.fieldbyname('BIGOTEXT').AsString;
          Edit_Enabled(True);
     end;
end;

end.
