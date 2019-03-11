unit RenewForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, pegradpanl, peoutlookbtn, PeJeonLabel, StdCtrls, Db, DbTables,
  Mask, pebtnedit, Grids, DBGrids, pedbgrid, DBCGrids, DBCtrls, pedbutil, hanapass,
  pereg, jeonPan, NotesHana_TLB,OnInsaCommon, OnEditBaseCtrl,
  OnEditStdCtrl, OnEditNumCtl, Tmax_DataSetText, Buttons;//, DBGridEx;

type
  TFM_RenewForm = class(TForm)
    DBSet1: TTMaxDataSet;
    P_Title: TPeJeonGrdPanel;
    sGrid1: TStringGrid;
    ed_name: TEdit;
    Bt_Srh: TPeJeonOutLookBtn;
    Bt_Mod: TPeJeonOutLookBtn;
    Bt_Exit: TPeJeonOutLookBtn;
    Label5: TLabel;
    St_Help: TStatusBar;
    DBSet2: TTMaxDataSet;
    Label2: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Bt_ExitClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sGrid1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Bt_SrhClick(Sender: TObject);
    procedure Bt_ModClick(Sender: TObject);
    procedure ed_nameKeyPress(Sender: TObject; var Key: Char);
    procedure sGrid1DblClick(Sender: TObject);

  private
    { Private declarations }
    Start    : Boolean;
    Inter    : ILotusNotes_Hana;
    //pEmpno   : string;  // 로그인 사번
    //pKorname : string;  // 로그인 성명
    pPass    : String;
    pClass   : string;  // 로그인 등급
    ComIp    : string;
    {
    Lsysdate   : string;
    Lfordate   : string;
    Lwork      : string;  // 작업자 구분.
    Le2empno   : string;  // 2차 평가자
    Le1korname : string;  // 1차 평가자 성명.
    Le2korname : string;  // 2차 평가자 성명.
    Lebrempno   : string;  // 지점장
    Lebrkorname : string;  // 지점장 성명

    grvalconyn  ,
    ge1valconyn ,
    ge2valconyn ,
    ge1valobjyn ,
    ge2valobjyn : string;
    }
    gebrvalconyn ,
    gebrvalobjyn : string;
    iChkSenioryn : integer;

    function  Csel_gfd(p_loc: Integer): String;
  public
    gsLastConEv      : String;  //업무목표최종결재자 (1차 or 2차)
    Lrabasdate       : string;  // 평가기준일.
    Pempno, Pkorname : string;  // 1차 평가자

   // g_mainweight : string;  // 전체 비중
   // EvalYN       : Boolean;
    { Public declarations }
  end;

var
  FM_RenewForm: TFM_RenewForm;
  FSvr    : OleVariant;
  vOrgnum, vDeptcode : string;

  ACol,ARow: Integer;

implementation

uses
  Hinsa_TmaxDM, HSubForm;

{$R *.DFM}


procedure DrawCheck(ACanvas: TCanvas; ARect: TRect; AColor: TColor; EditStyle: word; Flag: string);
var iDR:integer;
begin
  if Trim(Flag) = '' then Exit;
  with ACanvas do
  begin
    case EditStyle of
      1: begin //esCheckBox
        case Flag[1] of
          '1': iDR:= DFCS_BUTTONCHECK or DFCS_BUTTON3STATE;
          '2': iDR:= DFCS_BUTTONCHECK or DFCS_CHECKED;
          '3': iDR:= DFCS_BUTTONCHECK or DFCS_BUTTON3STATE or DFCS_INACTIVE;
          '4': iDR:= DFCS_BUTTONCHECK or DFCS_BUTTON3STATE or DFCS_INACTIVE or DFCS_CHECKED;
          else iDR:= DFCS_BUTTONCHECK or DFCS_BUTTON3STATE;
        end;
      end;
      2: begin //esRadioButton
        case Flag[1] of
          '1': iDR:= DFCS_BUTTONRADIO;
          '2': iDR:= DFCS_BUTTONRADIO or DFCS_CHECKED;
          '3': iDR:= DFCS_BUTTONRADIO or DFCS_INACTIVE;
          '4': iDR:= DFCS_BUTTONRADIO or DFCS_CHECKED or DFCS_INACTIVE;
          else iDR:= DFCS_BUTTONRADIO;
        end;
      end;
      else Exit;
    end;
    ACanvas.Brush.Color:= AColor;
    ACanvas.FillRect(ARect);
    InflateRect(ARect,-((ARect.Right  - ARect.Left -14) shr 1),-((ARect.Bottom - ARect.Top  -14) shr 1)); //DFCS_MONO
    DrawFrameControl(Handle, ARect, DFC_BUTTON, iDR);
  end;
end;

procedure TFM_RenewForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Inter := nil;
  Action := caFree;
end;

procedure TFM_RenewForm.FormCreate(Sender: TObject);
begin
  Start := True;
  Inter := nil;
end;

procedure TFM_RenewForm.Bt_ExitClick(Sender: TObject);
begin
  FM_Sub.BT_SelClick(nil);
  Close;
end;

function TFM_RenewForm.Csel_gfd(p_loc: Integer): String;
var
  v_cnt, v_tmp: Integer;
  v_data: String;
begin
  Result := '';
  v_data := DBSet1.FieldByName('SEL_DATA').AsString;
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

procedure TFM_RenewForm.FormShow(Sender: TObject);
var  SqlText, msg : string;
begin
  with sGrid1 do
  begin
     Cells[1,0] := '구분';
     Cells[2,0] := '사번';
     Cells[3,0] := '이름';
     Cells[4,0] := 'BAND';
     Cells[5,0] := '1차업적';
     Cells[6,0] := '1차역량';
     Cells[7,0] := '2차역량';
     Cells[8,0] := '최종완료';
  end;

  ed_name.SetFocus;
end;

procedure TFM_RenewForm.sGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  if (ACol = 8) and (ARow > 0) then
  begin
    if sGrid1.Cells[ACol,ARow] <> '' then  //Check Box
       with sGrid1 do DrawCheck(Canvas,Rect, Color,1, Cells[ACol, ARow]);
  end;
//  if (ACol = 5) and (ARow > 0) then        //Radio Button
//    with sGrid1 do DrawCheck(Canvas,Rect, Color,2, Cells[ACol, ARow]);
end;

procedure TFM_RenewForm.sGrid1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  //showmessage('mousedown');
  if Button = mbLeft Then
  begin
    //showmessage(sGrid1.Cells[ACol,ARow]);
    sGrid1.MouseToCell(X, Y, ACol, ARow);
  end;
end;

procedure TFM_RenewForm.sGrid1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var iCol,iRow, i: Integer;
    SqlText       : string;
begin
  //showmessage('mouseup');
  if Button = mbLeft then
  begin
    with sGrid1 do
    begin
      MouseToCell(X, Y, iCol, iRow);
      if iRow = 0 then
        exit;

      if (ACol = 8) and (ARow > 0) and (ACol = iCol) and (ARow = iRow) and (sGrid1.Cells[ACol,ARow] <> '') then
        Cells[ACol, ARow]:= IntToStr(StrToIntDef(Cells[ACol, ARow],0) mod 2 + 1);
    end;
  end;
end;

procedure TFM_RenewForm.Bt_SrhClick(Sender: TObject);
var
  SqlText       : string;
  i : integer;
  sJOBDUTY : string;
begin
   //Edit1.Text := SqlText;

  FM_Sub.DBSet_Sub.First;

  if FM_Sub.DBSet_Sub.RecordCount > 0 then
  begin
    iChkSenioryn := -1;

    sGrid1.RowCount := FM_Sub.DBSet_Sub.RecordCount +1;
    for i := 1 to FM_Sub.DBSet_Sub.RecordCount do
    begin
      sGrid1.Cells[1,i] :=  FM_Sub.DBSet_Sub.FieldByName('gubun').AsString;
      sGrid1.Cells[2,i] :=  FM_Sub.DBSet_Sub.FieldByName('EMPNO').AsString;
      sGrid1.Cells[3,i] :=  FM_Sub.DBSet_Sub.FieldByName('KORNAME').AsString;
      sGrid1.Cells[4,i] :=  FM_Sub.DBSet_Sub.FieldByName('PAYCL').AsString;
      sGrid1.Cells[5,i] :=  FM_Sub.DBSet_Sub.FieldByName('ESCORE').AsString;
      sGrid1.Cells[6,i] :=  FM_Sub.DBSet_Sub.FieldByName('ABILSCR1').AsString;

      if FM_Sub.DBSet_Sub.FieldByName('GUBUN').AsString = '2차' then
        sGrid1.Cells[7,i] :=  FM_Sub.DBSet_Sub.FieldByName('ABILSCR2').AsString;

      if FM_Sub.DBSet_Sub.FieldByName('GUBUN').AsString = '1차' then
      begin
        if (TrimRight(FM_Sub.DBSet_Sub.FieldByName('PAYRA').AsString) = '팀장') or (TrimRight(FM_Sub.DBSet_Sub.FieldByName('PAYRA').AsString) = '실장') then
        begin
          if (TrimRight(FM_Sub.DBSet_Sub.FieldByName('DOWN1').AsString) = '미완료')  then  //업적
             sGrid1.Cells[8,i] :=  '1'
          else
             sGrid1.Cells[8,i] :=  '2';
        end
        else
        begin
          if (TrimRight(FM_Sub.DBSet_Sub.FieldByName('DOWN1').AsString) = '미완료') or (TrimRight(FM_Sub.DBSet_Sub.FieldByName('ADOWN1').AsString) = '미완료') then
             sGrid1.Cells[8,i] :=  '1'
          else
             sGrid1.Cells[8,i] :=  '2';
        end;
      end
      else
      begin
        if (TrimRight(FM_Sub.DBSet_Sub.FieldByName('ADOWN2').AsString) = '미완료') and (TrimRight(FM_Sub.DBSet_Sub.FieldByName('PAYRA').AsString) <> '팀장') and
           (TrimRight(FM_Sub.DBSet_Sub.FieldByName('PAYRA').AsString) <> '실장') then
           sGrid1.Cells[8,i] :=  '1'
        else
           sGrid1.Cells[8,i] :=  '2'
      end;

      sGrid1.Cells[9,i] :=  sGrid1.Cells[8,i];  //백업


      FM_Sub.DBSet_Sub.next;
    end;
  end;
end;

procedure TFM_RenewForm.Bt_ModClick(Sender: TObject);
var i : integer;
    sqltext : string;
    sChkYN : string;
begin
   with sGrid1 do
   begin
      //최종작업된 사람을 취소작업한다.
      for i := 1 to RowCount -1 do
      begin
         // 서로다르면 update처리 시킨다.
         if trim(Cells[8,i]) <> trim(Cells[9,i]) then
         begin
           if sGrid1.Cells[1,i] = '1차' then
           begin
             //1차 업적 찾기
             SqlText := Format(' UPDATE pehremas SET '+
                               ' e1valconyn  = ''N'', '+
                               ' e1valcondate  = '''' '+
                               ' WHERE rabasdate = ''%s'' AND empno = ''%s'' AND e1empno = ''%s'' ',
                               [Lrabasdate, trim(Cells[2,i]), GSempno]);

             DataModule_Tmax.Cupd_SQL := Sqltext;
             DataModule_Tmax.Cupd_Exec;
             if not DataModule_Tmax.Cupd_ret then
             begin
                Messagedlg('APP-Server Error',mtError,[mbOK],0);
                Exit;
             end;

             //1차 역량 찾기
             SqlText := Format(' UPDATE pesmla SET '+
                               ' abconyn  = ''N'', '+
                               ' beconyn  = ''N'', '+
                               ' duconyn  = ''N'', '+
                               ' writeemp = '''+Gsempno+''', '+
                               ' writetime = TO_CHAR(SYSDATE, ''YYYYMMDDHH24MISS'') '+
                               ' WHERE rabasdate = ''%s'' AND empno = ''%s'' AND eempno = ''%s'' ',
                               [Lrabasdate, trim(Cells[2,i]), GSempno]);


             DataModule_Tmax.Cupd_SQL := Sqltext;
             DataModule_Tmax.Cupd_Exec;
             if not DataModule_Tmax.Cupd_ret then
             begin
                Messagedlg('APP-Server Error',mtError,[mbOK],0);
                Exit;
             end;
           end;

           //Bt_SrhClick(self);
         end;
      end;

      //팀별 최종완료 취소
      SqlText  := Format('UPDATE PEHREClOSE                                                       '+
                         '   SET VALCONYN = ''N'',                                                '+
                         '       VALCONDATE = ''''  '+
                         ' WHERE rabasdate = ''%s'' AND empno = ''%s'' ',
                          [sRabasdate,GSempno]);


      DataModule_Tmax.Cupd_SQL := Sqltext;
      DataModule_Tmax.Cupd_Exec;
      if not DataModule_Tmax.Cupd_ret then
      begin
         Messagedlg('APP-Server Error',mtError,[mbOK],0);
         Exit;
      end;

      MessageDlg('팀별 반영 되었습니다.', mtInformation, [mbOK], 0);
   end;
end;

procedure TFM_RenewForm.ed_nameKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
     Bt_SrhClick(self);
end;

procedure TFM_RenewForm.sGrid1DblClick(Sender: TObject);
begin
  //직무코드와 직무내용을 보여줄수 있도록 한다.
  //지금 등록중인 직무내용과 맞지 않아서 혼돈될 우려가 있어서 막음.
{   Fm_sub_Form1.Lempno := sGrid1.Cells[1,sGrid1.Row];
   Fm_sub_Form1.Lpaycl := sGrid1.Cells[14,sGrid1.Row];
   Fm_sub_Form1.Lpayra := sGrid1.Cells[15,sGrid1.Row];
   Fm_sub_Form1.Pa_Title.Caption := trim(sGrid1.Cells[2,sGrid1.Row]) +' 직무내용';
   Fm_sub_Form1.ShowModal;
}   
end;

end.

