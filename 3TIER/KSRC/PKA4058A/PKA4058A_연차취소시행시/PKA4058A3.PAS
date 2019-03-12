unit pka4058a3;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl,
  OnEditCombo, ComCtrls, StdCtrls, OnFocusButton, OnLineLabel, ExtCtrls,
  OnScheme, OnShapeLabel, OnGrDBGrid, CheckLst, OnListbox, DBCtrls, Db,
  OnMemDataset, Tmax_DataSetText, OnInsaCommon, Tmax_DmlSet, TmaxFunc,
  OnEditMemo;

type
  TFM_ConForm = class(TForm)
    Panel1: TPanel;
    PA_Buttons: TPanel;
    BT_Comfirm: TOnFocusButton;
    BT_Exit: TOnFocusButton;
    Label_YYMM: TOnSectionLabel;
    GGrid2: TOnGrDbGrid;
    Label3: TLabel;
    DataSource2: TDataSource;
    TDS_GRID2: TTMaxDataSet;
    BT_Return: TOnFocusButton;
    Panel2: TPanel;
    L_korname: TOnShapeLabel;
    L_empno: TOnShapeLabel;
    l_CancelSayu: TOnMemo;
    l_ReturnSayu: TOnMemo;
    SB_Help: TStatusBar;
    L_Regfrdate: TOnShapeLabel;
    L_Regtodate: TOnShapeLabel;
    L_REGYEARLY_CNT: TOnShapeLabel;
    L_APPDATE: TOnShapeLabel;
    TDS_DML: TTMaxDataSet;
    Label1: TLabel;
    OnGrDbGrid1: TOnGrDbGrid;
    DataSource1: TDataSource;
    TDS_GRID1: TTMaxDataSet;
    procedure BT_ExitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BT_ComfirmClick(Sender: TObject);
    procedure GGrid1ApplyCellAttribute(Sender: TObject; Field: TField;
      Canvas: TCanvas; Rect: TRect; State: TGridDrawState);
    procedure GGrid1CellClick(Column: TColumn);

    procedure PL_Com_Contructor;
    procedure ConRetrieve;
    procedure GGrid1DblClick(Sender: TObject);
    procedure GGrid2ApplyCellAttribute(Sender: TObject; Field: TField;
      Canvas: TCanvas; Rect: TRect; State: TGridDrawState);
    procedure DataSource2DataChange(Sender: TObject; Field: TField);
    procedure BT_ReturnClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    FG_duyymm : String;
    FG_deptcode : String;
    FG_LastDay : String;
    Day_Qry1   : String;
    Day_Qry2   : String;

    function PL_ConProcess_Yearly : Boolean;
  end;

var
  FM_ConForm: TFM_ConForm;

implementation

uses pka4058a0;

{$R *.DFM}

procedure TFM_ConForm.BT_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TFM_ConForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := CaFree;
end;

procedure TFM_ConForm.FormCreate(Sender: TObject);
var
   i,j : integer;
begin
  Label_YYMM.Caption := '결재기준년월 : '+copy(FM_Main.GSdate,1,4)+'년 '+copy(FM_Main.GSdate,5,2)+'월';

  ConRetrieve;

end;

procedure TFM_ConForm.PL_Com_Contructor;
begin
  with TDS_GRID2 do
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


//미등록자 리스트.
procedure TFM_ConForm.ConRetrieve;
var
  FL_Sql : String;
  i,j : Integer;
  Field : TField;
begin
     with TDS_GRID1 do
     begin
          ServiceName := 'PKA4058A_sel1';
          Close;
          Sql.Clear;
          SQL.Add('SELECT APPDATE,                                                                                             ');
          SQL.Add('       EMPNO,                                                                                               ');
          SQL.Add('       KORNAME,                                                                                             ');
          SQL.Add('       (SELECT PAYRA FROM PIMPMAS WHERE A.EMPNO =EMPNO) PAYRA,                                              ');
          SQL.Add('       MOD_FLAG,                                                                                            ');
          SQL.Add('       DECODE(UPPER(MOD_FLAG),''I'',''추가'',''M'',''수정'',''D'',''취소'','''') MOD_NAME,                  ');
          SQL.Add('       REGFRDATE,                                                                                           ');
          SQL.Add('       REGTODATE,                                                                                           ');
          SQL.Add('       nvl(REGYEARLY_CNT,0),                                                                                ');
          SQL.Add('       REGFRDATE2,                                                                                          ');
          SQL.Add('       REGTODATE2,                                                                                          ');
          SQL.Add('       nvl(REGYEARLY_CNT2,0),                                                                               ');
          SQL.Add('       MODFRDATE,                                                                                           ');
          SQL.Add('       MODTODATE,                                                                                           ');
          SQL.Add('       nvl(MODYEARLY_CNT,0),                                                                                ');
          SQL.Add('       MODFRDATE2,                                                                                          ');
          SQL.Add('       MODTODATE2,                                                                                          ');
          SQL.Add('       nvl(MODYEARLY_CNT2,0),                                                                               ');
          SQL.Add('       DUTYCODE,                                                                                            ');
          //2014.11.03.hjku. 삭제 추가로 화면 표기 일부 변경...
          //SQL.Add('       (SELECT CODENAME FROM PYCCODE WHERE CODEID =''Y112'' AND A.DUTYCODE=CODENO) DUTYNAME,                ');

          SQL.Add('       CASE WHEN MOD_FLAG<>''D'' THEN (SELECT CODENAME FROM PYCCODE WHERE CODEID =''Y112'' AND A.DUTYCODE=CODENO) ELSE '''' END DUTYNAME,                ');
          SQL.Add('       NVL(CON_YN,''N''),                                                                                     ');
          SQL.Add('       CASE WHEN MOD_FLAG=''D'' THEN decode(NVL(CON_YN,''N''),''Y'',''결재'',''R'',''반려'',''미결재'') ELSE '''' END,                                        ');
          SQL.Add('       CANCELSAYU,                                                                                          ');
          SQL.Add('       RETURNSAYU                                                                                           ');
          SQL.Add('  FROM PKYEARLYMODIFY A                                                                                     ');
          Sql.Add( 'WHERE REGFRDATE LIKE '''+ FM_Main.GSYear + '%''                                                      ');
          Sql.Add( '  AND NVL(CON_YN,''N'')<>''N''                                                                              ');
          Sql.Add( '  AND MOD_FLAG         =''D''                                                                              ');

          if(FM_Main.All_Flag) then
               Sql.Add( '  AND EXISTS(SELECT 1 FROM PIMEEMP WHERE a.empno = empno and EEMPNO ='''+FM_Main.GSConEmpno+''')      ')
          else Sql.Add( '  AND EXISTS(SELECT 1 FROM PIMEEMP WHERE a.empno = empno and EEMPNO ='''+FM_Main.GSempno+''')         ');

          Sql.Add( '  ORDER BY EMPNO,APPDATE, WRITETIME, MOD_FLAG, REGFRDATE                                                   ');

          ClearFieldInfo;
          AddField('APPDATE'        , ftString, 8);
          AddField('EMPNO'          , ftString, 4);
          AddField('KORNAME'        , ftString, 12);
          AddField('PAYRA'          , ftString, 3);
          AddField('MOD_FLAG'       , ftString, 1);
          AddField('MOD_NAME'       , ftString, 4);
          AddField('REGFRDATE'      , ftString, 8);
          AddField('REGTODATE'      , ftString, 8);
          AddField('REGYEARLY_CNT'  , ftString, 10);
          AddField('REGFRDATE2'     , ftString, 8);
          AddField('REGTODATE2'     , ftString, 8);
          AddField('REGYEARLY_CNT2' , ftString, 10);
          AddField('MODFRDATE'      , ftString, 8);
          AddField('MODTODATE'      , ftString, 8);
          AddField('MODYEARLY_CNT'  , ftString, 10);
          AddField('MODFRDATE2'     , ftString, 8);
          AddField('MODTODATE2'     , ftString, 8);
          AddField('MODYEARLY_CNT2' , ftString, 10);
          AddField('DUTYCODE'       , ftString, 2);
          AddField('DUTYNAME'       , ftString, 20);
          AddField('CON_YN'         , ftString, 1);
          AddField('CONYNNAME'      , ftString, 10);
          AddField('CANCELSAYU'     , ftString, 200);
          AddField('RETURNSAYU'     , ftString, 200);

          //memo1.text := sql.text;
          Open;

          {if TDS_GRID1.RecordCount < 1 then
          begin
               //MessageDlg('조회 조건에 맞는 연차휴가 변경내역이 존재하지 않습니다.',mtInformation,[mbOK],0);
               SB_help.Panels[1].Text := '조회 조건에 맞는 연차휴가 변경내역이 존재하지 않습니다.';
               System.Exit;
          end;
          }
     end;

     with TDS_GRID2 do
     begin
          ServiceName := 'PKA4058A_sel1';
          Close;
          Sql.Clear;
          SQL.Add('SELECT APPDATE,                                                                                             ');
          SQL.Add('       EMPNO,                                                                                               ');
          SQL.Add('       KORNAME,                                                                                             ');
          SQL.Add('       (SELECT PAYRA FROM PIMPMAS WHERE A.EMPNO =EMPNO) PAYRA,                                              ');
          SQL.Add('       MOD_FLAG,                                                                                            ');
          SQL.Add('       DECODE(UPPER(MOD_FLAG),''I'',''추가'',''M'',''수정'',''D'',''취소'','''') MOD_NAME,                  ');
          SQL.Add('       REGFRDATE,                                                                                           ');
          SQL.Add('       REGTODATE,                                                                                           ');
          SQL.Add('       nvl(REGYEARLY_CNT,0),                                                                                ');
          SQL.Add('       REGFRDATE2,                                                                                          ');
          SQL.Add('       REGTODATE2,                                                                                          ');
          SQL.Add('       nvl(REGYEARLY_CNT2,0),                                                                               ');
          SQL.Add('       MODFRDATE,                                                                                           ');
          SQL.Add('       MODTODATE,                                                                                           ');
          SQL.Add('       nvl(MODYEARLY_CNT,0),                                                                                ');
          SQL.Add('       MODFRDATE2,                                                                                          ');
          SQL.Add('       MODTODATE2,                                                                                          ');
          SQL.Add('       nvl(MODYEARLY_CNT2,0),                                                                               ');
          SQL.Add('       DUTYCODE,                                                                                            ');
          //2014.11.03.hjku. 삭제 추가로 화면 표기 일부 변경...
          //SQL.Add('       (SELECT CODENAME FROM PYCCODE WHERE CODEID =''Y112'' AND A.DUTYCODE=CODENO) DUTYNAME,                ');

          SQL.Add('       CASE WHEN MOD_FLAG<>''D'' THEN (SELECT CODENAME FROM PYCCODE WHERE CODEID =''Y112'' AND A.DUTYCODE=CODENO) ELSE '''' END DUTYNAME,                ');
          SQL.Add('       NVL(CON_YN,''N''),                                                                                     ');
          SQL.Add('       CASE WHEN MOD_FLAG=''D'' THEN decode(NVL(CON_YN,''N''),''Y'',''결재'',''R'',''반려'',''미결재'') ELSE '''' END,                                        ');
          SQL.Add('       CANCELSAYU,                                                                                          ');
          SQL.Add('       RETURNSAYU                                                                                           ');
          SQL.Add('  FROM PKYEARLYMODIFY A                                                                                     ');
          Sql.Add( 'WHERE REGFRDATE LIKE '''+ FM_Main.GSYear + '%''                                                      ');
          Sql.Add( '  AND NVL(CON_YN,''N'')=''N''                                                                              ');
          Sql.Add( '  AND MOD_FLAG         =''D''                                                                              ');
          //Sql.Add( '  AND EXISTS(SELECT 1 FROM PIMEEMP WHERE a.empno = empno and EEMPNO ='''+FM_Main.GSConEmpno+''')                               ');
          if(FM_Main.All_Flag) then
               Sql.Add( '  AND EXISTS(SELECT 1 FROM PIMEEMP WHERE a.empno = empno and EEMPNO ='''+FM_Main.GSConEmpno+''')      ')
          else Sql.Add( '  AND EXISTS(SELECT 1 FROM PIMEEMP WHERE a.empno = empno and EEMPNO ='''+FM_Main.GSempno+''')         ');

          Sql.Add( 'ORDER BY EMPNO,APPDATE, WRITETIME, MOD_FLAG, REGFRDATE                                                     ');

          ClearFieldInfo;
          AddField('APPDATE'        , ftString, 8);
          AddField('EMPNO'          , ftString, 4);
          AddField('KORNAME'        , ftString, 12);
          AddField('PAYRA'          , ftString, 3);
          AddField('MOD_FLAG'       , ftString, 1);
          AddField('MOD_NAME'       , ftString, 4);
          AddField('REGFRDATE'      , ftString, 8);
          AddField('REGTODATE'      , ftString, 8);
          AddField('REGYEARLY_CNT'  , ftString, 10);
          AddField('REGFRDATE2'     , ftString, 8);
          AddField('REGTODATE2'     , ftString, 8);
          AddField('REGYEARLY_CNT2' , ftString, 10);
          AddField('MODFRDATE'      , ftString, 8);
          AddField('MODTODATE'      , ftString, 8);
          AddField('MODYEARLY_CNT'  , ftString, 10);
          AddField('MODFRDATE2'     , ftString, 8);
          AddField('MODTODATE2'     , ftString, 8);
          AddField('MODYEARLY_CNT2' , ftString, 10);
          AddField('DUTYCODE'       , ftString, 2);
          AddField('DUTYNAME'       , ftString, 20);
          AddField('CON_YN'         , ftString, 1);
          AddField('CONYNNAME'      , ftString, 10);
          AddField('CANCELSAYU'     , ftString, 200);
          AddField('RETURNSAYU'     , ftString, 200);

          //memo2.text := sql.text;
          Open;

          if TDS_GRID2.RecordCount < 1 then
          begin
               //MessageDlg('조회 조건에 맞는 연차휴가 변경내역이 존재하지 않습니다.',mtInformation,[mbOK],0);
               SB_help.Panels[1].Text := '조회 조건에 맞는 연차휴가 변경내역이 존재하지 않습니다.';
               System.Exit;
          end;
     end;
end;

procedure TFM_ConForm.BT_ComfirmClick(Sender: TObject);
var
   FL_Date: String;
   FL_Date2: String;
   FL_Date3: Real;
   CmdStr,vProgId, vRundate,vMessage : String;
   update_list, insert_list, column_list :string;
   yearly_cnt, yearlyplan_cnt, used_yearly_cnt, notice_yn, assign_yn :String;
begin

     if TDS_Grid2.FieldbyName('APPDATE').AsString = '' then
     begin
           MessageDlg('선택 된 자료가 없습니다.', mtInformation, [mbok], 0) ;
           System.exit;
     end;

     if TDS_Grid2.FieldbyName('Con_Yn').AsString <> 'N' then
     begin
           MessageDlg('결재처리된 자료입니다.', mtInformation, [mbok], 0) ;
           System.exit;
     end;  

     if MessageBox(FM_ConForm.HANDLE,'승인 하시겠습니까?','승인확인',MB_YESNO) = IDYES then
     begin

          if not PL_ConProcess_Yearly then
          begin
                //MessageDlg('연차기간 변경 값이 신청시와 달라졌습니다. HR팀에 문의하시기 바랍니다.', mtInformation, [mbok], 0) ;
                System.exit;
          end;

          with TDS_DML do
          begin
               ServiceName := 'PKA4040A_dml';
               Close;
               Sql.Clear ;
               Sql.Add ('UPDATE PKYEARLYMODIFY                                                  ');
               Sql.Add ('   SET CON_YN    =''Y'',                                               ');
               Sql.Add ('       CONEMPNO  = '''+ FM_Main.GSempno + ''',                         ');
               Sql.Add ('       CONTIME   = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'')               ');
               Sql.Add ('WHERE  APPDATE   = ''' + TDS_Grid2.FieldbyName('APPDATE').AsString   + '''   ');
               Sql.Add ('  AND  EMPNO     = ''' + TDS_Grid2.FieldbyName('EMPNO').AsString     + '''   ');
               Sql.Add ('  AND  REGFRDATE = ''' + TDS_Grid2.FieldbyName('REGFRDATE').AsString + '''   ');
               Sql.Add ('  AND  REGTODATE = ''' + TDS_Grid2.FieldbyName('REGTODATE').AsString + '''   ');

               //memo1.text := sql.text;
               if Execute then
               begin
                   FM_Main.SendProgID  := 'PKA4058A';
                   FM_Main.SendEmpno   := FM_Main.GsEmpno;
                   FM_Main.RcveEmpno   := L_empno.ValueCaption;
                   FM_Main.ReceiveYN   := 'N';
                   FM_Main.MailSubject := '[연차휴가 사용 취소 승인] 요청 문서가 결재되었습니다.';
                   FM_Main.MailBody    := L_korname.ValueCaption
                                          + FM_Main.Get_JobName(TDS_Grid2.FieldbyName('PAYRA').AsString)
                                          + '의 연차휴가 사용계획 취소 요청이 결재되었습니다. '; //메일내용

                   if FM_Main.Send_WebHint(FM_Main.SendProgID, FM_Main.SendEmpno, FM_Main.RcveEmpno, FM_Main.MailSubject, FM_Main.MailBody, FM_Main.ReceiveYN) then
                        MessageDlg('연차휴가 사용계획 취소 결재 메일 전송이 성공 하였습니다...',mtInformation, [mbOk], 0)
                   else
                   begin
                        MessageDlg('연차휴가 사용계획 취소 결재 메일 전송이 실패 하였습니다...',mtError, [mbOk], 0);
                        exit;
                   end;
               end
               else
               begin
                    Application.MessageBox('결재처리에 실패했습니다.','작업실패',MB_OK);
                    Exit;
               end;
          end;
     end;

     ConRetrieve;

//     SB_Help.Panels[1].Text := '결제 되었습니다... ';   
end;

procedure TFM_ConForm.GGrid1ApplyCellAttribute(Sender: TObject;
  Field: TField; Canvas: TCanvas; Rect: TRect; State: TGridDrawState);
begin
  if (TOnGrDbGrid(Sender).SelectedRows.CurrentRowSelected) then
    Canvas.Brush.Color := $00FF9B9B;
end;

procedure TFM_ConForm.GGrid1CellClick(Column: TColumn);
begin
{  if not MD_Data1.Active then
    begin
      MD_Data1.Open;
    end;

   if Length(GGrid1.SelectedField.DisplayText) = 4 then
   begin
     MD_Data1.Append;
     MD_Data1.FieldByName('empno').AsString := GGrid1.SelectedField.DisplayText;
     MD_Data1.Post;
   end;
}   
end;

procedure TFM_ConForm.GGrid1DblClick(Sender: TObject);
begin
{
  with FM_Main do
  begin
    ED_empno.OnReadEnded := nil;
    ED_empno.text  := GGrid1.SelectedField.DisplayText;

    FG_empdate   := ED_empno.empdate;
    if ED_dept.Enabled then
      begin
        ED_dept.Text := ED_empno.deptname;
        ED_dept.Hint := ED_empno.jobdept;
      end;

    PL_Month_Contructor;
//    ED_empno.PL_get_singledata;
  end;

  Close;
  }
end;

procedure TFM_ConForm.GGrid2ApplyCellAttribute(Sender: TObject;
  Field: TField; Canvas: TCanvas; Rect: TRect; State: TGridDrawState);
begin
  if (TOnGrDbGrid(Sender).SelectedRows.CurrentRowSelected) then
    Canvas.Brush.Color := $00FF9B9B;
end;

procedure TFM_ConForm.DataSource2DataChange(Sender: TObject;
  Field: TField);
begin
    with TDS_GRID2 do
    begin
        L_APPDATE.ValueCaption         := Copy(FieldByName('APPDATE').AsString,1,4) + '-' +
                                          Copy(FieldByName('APPDATE').AsString,5,2) + '-' +
                                          Copy(FieldByName('APPDATE').AsString,7,2);
        L_empno.ValueCaption           := FieldByName('empno').AsString;
        L_korname.ValueCaption         := FieldByName('korname').AsString;
        L_Regfrdate.ValueCaption       := Copy(FieldByName('Regfrdate').AsString,1,4) + '-' +
                                          Copy(FieldByName('Regfrdate').AsString,5,2) + '-' +
                                          Copy(FieldByName('Regfrdate').AsString,7,2);
        L_Regtodate.ValueCaption       := Copy(FieldByName('Regtodate').AsString,1,4) + '-' +
                                          Copy(FieldByName('Regtodate').AsString,5,2) + '-' +
                                          Copy(FieldByName('Regtodate').AsString,7,2);
        L_REGYEARLY_CNT.ValueCaption   := FieldByName('REGYEARLY_CNT').AsString;

        l_CancelSayu.text              := FieldByName('CANCELSAYU').AsString;
        l_ReturnSayu.text              := FieldByName('RETURNSAYU').AsString;
    end;
end;

procedure TFM_ConForm.BT_ReturnClick(Sender: TObject);
begin
    if(TDS_GRID2.FieldByName('empno').AsString='') then
    begin
        MessageDlg('결재할 자료가 없습니다.',mtInformation, [mbOk], 0);
        exit;
    end;

    l_ReturnSayu.text := FM_Main.RemoveSpecialChar(l_ReturnSayu.text);

    if(l_ReturnSayu.text='') then
    begin
        MessageDlg('반려사유를 입력해 주세요!!',mtInformation, [mbOk], 0);
        l_ReturnSayu.SetFocus();
        exit;
    end;

     if TDS_GRID2.FieldbyName('Con_Yn').AsString <> 'N' then
     begin
           MessageDlg('결재처리된 자료입니다.', mtInformation, [mbok], 0) ;
           System.exit;
     end;

     if MessageBox(FM_ConForm.HANDLE,'반려 하시겠습니까?','반려확인',MB_YESNO) = IDYES then
     begin
          with TDS_DML do
          begin
              ServiceName := 'PKA4040A_dml';
              Close;
              Sql.Clear ;
              Sql.Add ('UPDATE PKYEARLYMODIFY                                     ');
              Sql.Add ('   SET CON_YN =''R'',                                     ');
              Sql.Add ('       CONEMPNO  = '''+ FM_Main.GSempno + ''',            ');
              Sql.Add ('       RETURNSAYU  = '''+ l_ReturnSayu.text + ''',        ');
              Sql.Add ('       CONTIME   = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'')  ');
              Sql.Add ('WHERE  APPDATE   = ''' + TDS_Grid2.FieldbyName('APPDATE').AsString   + '''   ');
              Sql.Add ('  AND  EMPNO     = ''' + TDS_Grid2.FieldbyName('EMPNO').AsString     + '''   ');
              Sql.Add ('  AND  REGFRDATE = ''' + TDS_Grid2.FieldbyName('REGFRDATE').AsString + '''   ');
              Sql.Add ('  AND  REGTODATE = ''' + TDS_Grid2.FieldbyName('REGTODATE').AsString + '''   ');

              if Execute then
              begin
                  FM_Main.SendProgID  := 'PKA4058A';
                  FM_Main.SendEmpno   := FM_Main.GsEmpno;
                  FM_Main.RcveEmpno   := L_empno.ValueCaption;
                  FM_Main.ReceiveYN   := 'N';
                  FM_Main.MailSubject := '[연차휴가 사용 승인] 요청 문서가 반려되었습니다.';
                  FM_Main.MailBody    := L_korname.ValueCaption
                                         + FM_Main.Get_JobName(TDS_Grid2.FieldbyName('PAYRA').AsString)
                                         + '의 연차휴가 사용계획 취소 요청에 대한 승인이 반려되었습니다. '; //메일내용

                  if FM_Main.Send_WebHint(FM_Main.SendProgID, FM_Main.SendEmpno, FM_Main.RcveEmpno, FM_Main.MailSubject, FM_Main.MailBody, FM_Main.ReceiveYN) then
                       MessageDlg('연차휴가 사용계획 반려 메일 전송이 성공 하였습니다...',mtInformation, [mbOk], 0)
                  else
                  begin
                       MessageDlg('연차휴가 사용계획 반려 메일 전송이 실패 하였습니다...',mtError, [mbOk], 0);
                       exit;
                  end;
              end
              else
              begin
                   Application.MessageBox('반려처리에 실패했습니다.','작업실패',MB_OK);
                   Exit;
              end;
          end;
     end;

     ConRetrieve;
     SB_Help.Panels[1].Text := '결제 되었습니다... ';
end;

function TFM_ConForm.PL_ConProcess_Yearly : Boolean;
var
     old_yearly_cnt, new_yearly_cnt : real;
     tmp_Regcnt, tmp_Modcnt :real;
     tmp_appdate,tmp_Mod_Flag, tmp_Regfrdate, tmp_Regtodate, tmp_Modfrdate,tmp_Modtodate, tmp_modcode : String;
     update_list, insert_list, column_list :string;
begin
     result := false;

     with(TDS_Grid2) do
     begin
         tmp_Appdate   := FieldbyName('APPDATE').AsString;
         tmp_Mod_Flag  := FieldbyName('MOD_FLAG').AsString;
         tmp_Regfrdate := FieldbyName('REGFRDATE').AsString;
         tmp_Regtodate := FieldbyName('REGTODATE').AsString;
         tmp_Regcnt    := FieldbyName('REGYEARLY_CNT').ASFloat;
         tmp_Modfrdate := FieldbyName('MODFRDATE').AsString;
         tmp_Modtodate := FieldbyName('MODTODATE').AsString;
         tmp_Modcnt    := FieldbyName('MODYEARLY_CNT').ASFloat;
         tmp_Modcode   := FieldbyName('DUTYCODE').AsString;
     end;

     old_yearly_cnt := FM_Main.PL_Get_Duty_Cnt(L_empno.valuecaption,tmp_Regfrdate,tmp_Regtodate,'1') ;

     if(old_yearly_cnt<> tmp_Regcnt) then
     begin
          MessageDlg('연차기간 변경 값이 신청시와 달라졌습니다. 반려처리하신후 다시 작성하셔야 합니다.', mtWarning, [mbok], 0) ;
          result := false;
          exit;
     end;

{     if not FM_Main.PL_Yearly_Check(0,old_yearly_cnt) then
     begin
          MessageDlg('사용가능한 연차일을 초과하였습니다. HR팀에 문의하시기 바랍니다.', mtInformation, [mbok], 0) ;
          result := false;
          exit;
     end;
}
     if not FM_Main.Make_Query(L_empno.valuecaption,tmp_Regfrdate,tmp_Regtodate,tmp_Modcode, '1', update_list, insert_list, column_list) then
     begin
         MessageDlg('변경 쿼리 작성시 오류가 발생하였습니다.', mtWarning, [mbok], 0) ;
         exit;
     end;

     if not FM_Main.Update_Query(L_empno.valuecaption,tmp_Regfrdate,tmp_Regtodate, '1', update_list, insert_list, column_list) then
     begin
         MessageDlg('취소 연차를 근태 반영시 오류가 발생하였습니다.', mtWarning, [mbok], 0) ;
         exit;
     end;

     result := true;
end;


end.

