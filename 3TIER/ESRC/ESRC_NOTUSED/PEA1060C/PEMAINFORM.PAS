unit PeMainForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, pegradpanl, peoutlookbtn, PeJeonLabel, StdCtrls, Db, DbTables,
  Mask, pebtnedit, Grids, DBGrids, pedbgrid, DBCGrids, DBCtrls, pedbutil, hanapass,
  pereg, jeonPan, NotesHana_TLB,OnInsaCommon, OnEditBaseCtrl,
  OnEditStdCtrl, OnEditNumCtl, Tmax_DataSetText, Buttons, TmaxFunc;

type
  TMainForm = class(TForm)
    DBSet1: TTMaxDataSet;
    P_Title: TPeJeonGrdPanel;
    sGrid1: TStringGrid;
    Bt_Srh: TPeJeonOutLookBtn;
    Bt_Mod: TPeJeonOutLookBtn;
    Bt_Exit: TPeJeonOutLookBtn;
    Label5: TLabel;
    St_Help: TStatusBar;
    DBSet2: TTMaxDataSet;
    Label1: TLabel;
    Label2: TLabel;
    ed_name: TOnEdit;
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
    pEmpno   : string;  // 로그인 사번
    pKorname : string;  // 로그인 성명
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

    function GetBaseYear(gubun : integer) : string;
    function  Csel_gfd(p_loc: Integer): String;
  public
    gsLastConEv  : String;  //업무목표최종결재자 (1차 or 2차)
    Lrabasdate   : string;  // 평가기준일.
   // Le1empno     : string;  // 1차 평가자
   // g_mainweight : string;  // 전체 비중
   // EvalYN       : Boolean;
    { Public declarations }
  end;

var
  MainForm: TMainForm;
  FSvr    : OleVariant;
  vOrgnum, vDeptcode : string;

  ACol,ARow: Integer;

const
  Msg = '목표 면담등록 서버가 다운된 것 같습니다.'+#13#13+'담당자에게 문의 하십시오'#13;

implementation

uses
  Hinsa_TmaxDM, peDm, pea1060c1;//, pea1060a2, pea1060a3, pea1060b1;

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

//작업상 필요한 날짜 얻기
function TMainForm.GetBaseYear(gubun : integer) : string;
var
  Sql     : string;
begin
  Result := '';

  if gubun = 1 then                                            //업적평가 기준일(Lrabasdate)
    Sql := 'SELECT VALUE1 FROM PEHREBAS WHERE RABASDATE = ''00000000'' AND GUBUN = ''00'' AND SGUBUN = ''0001'' ';

  if gubun = 2 then                                            //하반기 업적평가 시작일(LFordate)
    Sql := 'SELECT VALUE2 FROM PEHREBAS WHERE RABASDATE = ''00000000'' AND GUBUN = ''00'' AND SGUBUN = ''0003'' ';

  if gubun = 3 then                                            //시스템 시각(Lsysdate)
    Sql := 'SELECT TO_CHAR(SYSDATE,''YYYYMMDDHH24MISSD'') FROM DUAL ';

  if gubun = 4 then                                            //
    Sql := 'SELECT NVL(VALUE5,'' '') FROM PEHREBAS  '+
           ' WHERE RABASDATE = ''' + Lrabasdate + ''' AND GUBUN = ''11'' AND SGUBUN = ''0003'' ';

  if gubun = 5 then                                            //
    Sql := 'SELECT NVL(VALUE3,'' '') FROM PIMVARI       '+
           ' WHERE GUBUN = ''00'' AND SGUBUN = ''0001'' ';

  DataModule_Tmax.Csel_SQL := Sql;
  DataModule_Tmax.Csel_Open4;
  Result := DataModule_Tmax.Csel_gfd4(1);
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Inter := nil;
  Action := caFree;
end;

procedure TMainForm.FormCreate(Sender: TObject);
var
  sMsg : string;
begin
   sMsg := DataModule_Tmax.Connect_Session;

   if sMsg <> '' then
   begin
      Application.MessageBox(PChar(msg),'TMAX에러',mb_ok);
      Application.Terminate;
      Exit;
   end;

  Start := True;

  //2013.11. Add 파라미터와 비교하여 암호 다르면 접속 막음.
  FM_Tmax           := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := DataModule_Tmax.TMaxSession;
  if FM_Tmax.PassWordChk(Hinsa_Param(cmdline,1), Hinsa_Param(cmdline,3)) = 0 then
    Application.Terminate;

  Inter := nil;
end;

procedure TMainForm.Bt_ExitClick(Sender: TObject);
begin
  Close;
end;

function TMainForm.Csel_gfd(p_loc: Integer): String;
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

procedure TMainForm.FormShow(Sender: TObject);
var  SqlText : string;
begin

  with sGrid1 do
  begin
     Cells[1,0] := '사번';
     Cells[2,0] := '이름';
     Cells[3,0] := '직책';
     Cells[4,0] := '공동대상';
     Cells[5,0] := '등록자';
  end;

  pEmpno   := peParam(CmdLine,1);
  pKorname := peParam(CmdLine,2);
  pPass    := peParam(CmdLine,3);
  pClass   := peParam(CmdLine,4);
  ComIp    := peParam(Cmdline,5);
  ComIP    := Copy(ComIP,2,Length(ComIP)-1);

  Lrabasdate := GetBaseYear(1);            //업적평가 기준일
  ed_name.SetFocus;

  {
  //사번, 부터코드를 체크해야 한다.
  SqlText := 'SELECT EMPNO ||'';''|| KORNAME ||'';''|| DEPTCODE ' +
         '  FROM PEHREMAS '+
         ' WHERE RABASDATE = ''' + Lrabasdate + '''  '+  // 평가기준일
         '   AND EMPNO     = ''' + pEmpno + ''' '+       // 선택된사번
         '   AND RECONYN   = ''Y''               ';      // 목표등록대상여부

  with DBSet1 do
  begin
    Close;
    ServiceName := 'PEA1060A_common';
    ClearFieldInfo;
    AddField('SEL_DATA', ftString, 300);
    ClearParamInfo;
    SQL.Text := SqlText;
    Open;

    if RecordCount > 0 then
    begin
       vDeptcode := Csel_gfd(3);  //TASKCODE
    end;
  end;
  memo1.text := sqltext;
  }
   //팀장여부를 체크한다.
   //만일 팀장이 아니면 조회버튼 비활성화 , 반영버튼 비활성화 시킨다.
   SqlText := ' select payra from PEHREAIM_COMBAS          '+
              ' where rabasdate =  ''' + Lrabasdate + '''  '+
              ' and empno = ''' + pEmpno + '''             '+
              ' and senioryn = ''Y''                       ';     //선임여부를 체크한다.
//              ' and payra in (''2C'',''58'',''1B'',''16'') ';   //팀장여부를 체크한다.
   with DBSet2 do
   begin
      Close;
      ServiceName := 'PEA1060A_common';
      ClearFieldInfo;
      AddField('SEL_DATA', ftString, 300);
      ClearParamInfo;
      SQL.Text := SqlText;
      Open;

      if RecordCount < 1 then
      begin
          Bt_Srh.Enabled := false;
          Bt_Mod.Enabled := false;
          showmessage('망운용/망통제/지사 팀장만이 공동목표대상자를 선정할 수 있습니다.');
          Bt_ExitClick(sender);
      end;
      close;
   end;
   Bt_SrhClick(sender);
end;

procedure TMainForm.sGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  if (ACol = 4) and (ARow > 0) then
  begin
    if sGrid1.Cells[ACol,ARow] <> '' then  //Check Box
       with sGrid1 do DrawCheck(Canvas,Rect, Color,1, Cells[ACol, ARow]);
  end;
  if (ACol = 5) and (ARow > 0) then        //Radio Button
    with sGrid1 do DrawCheck(Canvas,Rect, Color,2, Cells[ACol, ARow]);
end;

procedure TMainForm.sGrid1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  //showmessage('mousedown');
  if Button = mbLeft Then
  begin
    //showmessage(sGrid1.Cells[ACol,ARow]);
    sGrid1.MouseToCell(X, Y, ACol, ARow);
  end;
end;

procedure TMainForm.sGrid1MouseUp(Sender: TObject; Button: TMouseButton;
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

      SqlText := 'SELECT unionyn||'';''||payra FROM pehreaim_combas '+
                 'WHERE rabasdate = ''' + Lrabasdate + '''          '+
                 'AND empno = ''' + sGrid1.Cells[1,iRow] + '''      ';
      with DBSet1 do
      begin
         Close;
         ServiceName := 'PEA1060A_common';
         ClearFieldInfo;
         AddField('SEL_DATA', ftString, 300);
         ClearParamInfo;
         SQL.Text := SqlText;
         Open;

         if RecordCount <= 0 then
         begin
            showmessage('등록된 사원이 아닙니다.');
            Exit;
         end;
         {
         if (Csel_gfd(1) = 'N') and (iCol = 4) then
         begin
            showmessage('일반목표 대상자를 공동목표 대상자로 변경할 수 없습니다!');
            exit;
         end;
         }
      end;

     {2010.11.05 jissi 내가 귀찮아서.....
      if (iCol = 4) and ((sGrid1.Cells[iCol,ARow]) = '1') and ((sGrid1.Cells[16,ARow]) = '1') then
      begin
         showmessage('일반목표 등록자를 공동목표 등록대상자로 변경할 수 없습니다.');
         exit;
      end;
     }
      if (ACol = 4) and (ARow > 0) and (ACol = iCol) and (ARow = iRow) and (sGrid1.Cells[ACol,ARow] <> '') then
        Cells[ACol, ARow]:= IntToStr(StrToIntDef(Cells[ACol, ARow],0) mod 2 + 1);
      if (ACol = 5) then
      begin
        if  (ARow > 0) and (ACol = iCol) and (ARow = iRow) then
        begin
          for i := 1 to RowCount -1 do
           Cells[5, i] := '1';
        end;
        Cells[ACol, ARow]:= IntToStr(StrToIntDef(Cells[ACol, ARow],0) mod 2 + 1);
      end;
    end;
  end;
end;

procedure TMainForm.Bt_SrhClick(Sender: TObject);
var
  SqlText       : string;
  i : integer;
  sJOBDUTY : string;
begin
   {
   SqlText := ' SELECT  NVL(A.RABASDATE,'''') ||'';''||NVL(A.EMPNO,'''')||'';''||NVL(A.KORNAME,'''')||'';''||B.CODENAME||'';''|| NVL(A.DEPTCODE,'''') ||'';''||'+
              ' DECODE(NVL(A.UNIONYN,''N''),''Y'',''2'',''1'')||'';''|| DECODE(NVL(A.SENIORYN,''N''),''Y'',''2'',''1'') ||'';''||'+
	      ' A.JOBDUTY||'';''||A.PAYRA '+
              ' FROM PEHREAIM_COMBAS A, PYCCODE B '+
              ' WHERE A.RABASDATE = ''' + Lrabasdate + ''' AND A.KORNAME LIKE '''+trim(ed_name.text)+'%'''+
              ' AND SUBSTR(A.DEPTCODE,1,3) IN (SELECT SUBSTR(DEPTCODE,1,3) FROM PEHREAIM_COMBAS '+
	      ' WHERE RABASDATE = ''' + Lrabasdate + ''' AND EMPNO = ''' + pEmpno + ''') AND A.PAYCL = B.CODENO '+
              ' AND B.CODEID = ''I112'' AND B.USEYN = ''Y'' ORDER BY A.PAYCL, A.PAYRA, A.EMPNO ';
   }

   //H10차에 의한 부서코드 변환  deptcode,1,3->deptcode,1,4  20051025JSH
   SqlText := ' SELECT  NVL(A.RABASDATE,'''') ||'';''||NVL(A.EMPNO,'''')||'';''||NVL(A.KORNAME,'''')||'';''||B.CODENAME||'';''|| NVL(A.DEPTCODE,'''') ||'';''||'+
              ' DECODE(NVL(A.UNIONYN,''N''),''Y'',''2'',''1'')||'';''|| DECODE(NVL(A.SENIORYN,''N''),''Y'',''2'',''1'') ||'';''||'+
	      ' A.JOBDUTY||'';''||A.PAYRA ||'';''||nvl(C.FLAG,'''')||'';''||nvl(A.PAYCL,'''') '+
              ' ||'';''||DECODE(NVL(A.BFUNIONYN,''N''),''Y'',''2'',''1'') '+ #13 +
              ' FROM PEHREAIM_COMBAS A, PYCCODE B, '+ #13 +
                   '(select distinct empno, ''Y'' FLAG from PEHREAIM_COMDET '+ #13 +
                   ' where RABASDATE = ''' + Lrabasdate + ''' '+ #13 +
                   ' and substr(deptcode,1,4) in (SELECT SUBSTR(DEPTCODE,1,4) FROM PEHREAIM_COMBAS '+ #13 +
	                                        ' WHERE RABASDATE = ''' + Lrabasdate + ''' AND EMPNO = ''' + pEmpno + ''') ) C '+ #13 +
              ' WHERE A.RABASDATE = ''' + Lrabasdate + ''' AND A.KORNAME LIKE '''+trim(ed_name.text)+'%'''+ #13 +
              ' AND SUBSTR(A.DEPTCODE,1,4) IN (SELECT SUBSTR(DEPTCODE,1,4) FROM PEHREAIM_COMBAS '+ #13 +
  	                                     ' WHERE RABASDATE = ''' + Lrabasdate + ''' AND EMPNO = ''' + pEmpno + ''') '+ #13 +
              ' AND A.PAYRA = B.CODENO AND B.CODEID = ''I113'' AND B.USEYN = ''Y'' AND A.EMPNO  = C.EMPNO(+) '+ #13 +
              ' ORDER BY A.PAYCL, A.PAYRA, A.EMPNO ';

//Edit1.Text := SqlText;

   with DBSet1 do
   begin
      Close;
      ServiceName := 'PEA1060A_common';
      ClearFieldInfo;
      AddField('SEL_DATA', ftString, 300);
      ClearParamInfo;
      SQL.Text := SqlText;
      Open;

      //showmessage(inttostr(RecordCount));
      if RecordCount > 0 then
      begin
         iChkSenioryn := -1;

         sGrid1.RowCount := RecordCount +1;
         for i := 1 to RecordCount do
         begin
            sGrid1.Cells[1,i] :=  Csel_gfd(2);        //EMPNO
            sGrid1.Cells[2,i] :=  Csel_gfd(3);        //KORNAME
            sGrid1.Cells[3,i] :=  Csel_gfd(4);        //CODENAME

            if GetBaseYear(5) <= GetBaseYear(3) then
            begin
               if ((Csel_gfd(9) <> 'C11') and (Csel_gfd(9) <> 'C15')) then
                  sGrid1.Cells[4,i] := Csel_gfd(6);     //UNIONYN
            end
            else
            begin
               if ((Csel_gfd(9) <> '2C') and (Csel_gfd(9) <> '58')) then
                  sGrid1.Cells[4,i] := Csel_gfd(6);     //UNIONYN
            end;
            sGrid1.Cells[5,i] :=  Csel_gfd(7);        //SENIORYN

            sGrid1.Cells[10,i]:=  Csel_gfd(1);       //RABASDATE
            sGrid1.Cells[11,i]:=  Csel_gfd(5);       //DEPTCODE
            sGrid1.Cells[12,i]:=  sGrid1.Cells[4,i];  //UNIONYN
            sGrid1.Cells[13,i]:=  Csel_gfd(10);      //flag
            //직위,직종코드를 임시 저장함.
            sGrid1.Cells[14,i]:=  Csel_gfd(11);  //PAYCL
            sGrid1.Cells[15,i]:=  Csel_gfd(9);  //PAYRA
            sGrid1.Cells[16,i]:=  Csel_gfd(12);  //BFUNIONYN

            //선임이면...
            if sGrid1.Cells[5,i] = '2' then
                 iChkSenioryn := i;

            next;
         end;
      end;
      close;
   end;

end;

procedure TMainForm.Bt_ModClick(Sender: TObject);
var i : integer;
    sqltext : string;
    sChkYN : string;
begin
   with sGrid1 do
   begin
      //선임자 변경여부 체크
      for i := 1 to RowCount -1 do
      begin
         if Cells[5,i] = '2' then  //선임자이면
         begin
            //선임자가 바뀌지 않았음
            if i = iChkSenioryn then
               break
            //선임자가 바뀌었을 경우
            else
            begin
               //선임자 변경처리를 한다.
               //먼저 변경전 선임자를 선임자여부 N으로 변경처리한다.
               if iChkSenioryn > 0 then
               begin
                 SqlText := Format('UPDATE pehreaim_combas SET '+
                                    ' SENIORYN   = ''N'' '+
                                    ' WHERE rabasdate = ''%s'' AND empno = ''%s'' AND deptcode = ''%s'' ',
                                   [trim(Cells[10,iChkSenioryn]), trim(Cells[1,iChkSenioryn]), trim(Cells[11,iChkSenioryn])]);

                  DataModule_Tmax.Cupd_SQL := Sqltext;
                  DataModule_Tmax.Cupd_Exec;
                  if not DataModule_Tmax.Cupd_ret then
                  begin
                     Messagedlg('APP-Server Error',mtError,[mbOK],0);
                     Exit;
                  end;
               end;

               //선임자 설정한다.
               SqlText := Format('UPDATE pehreaim_combas SET '+
                                       '  SENIORYN   = ''Y'' '+
                                 ' WHERE rabasdate = ''%s'' AND empno = ''%s'' AND deptcode = ''%s'' ',
                                  [trim(Cells[10,i]), trim(Cells[1,i]), trim(Cells[11,i])]);

               DataModule_Tmax.Cupd_SQL := Sqltext;
               DataModule_Tmax.Cupd_Exec;
               if not DataModule_Tmax.Cupd_ret then
               begin
                  Messagedlg('APP-Server Error',mtError,[mbOK],0);
                  Exit;
               end;
            end;

            break;
         end;
      end;

      //공동/일반여부를 수정한다.
      for i := 1 to RowCount -1 do
      begin
         // Cells[7,i](변경전공동/일반구분)과 cells[3,i](변경후공동/일반구분)을 비교하여
         // 서로다르면 cells[3,i](변경후공동/일반구분)으로 update처리 시킨다.
         if trim(Cells[4,i]) <> trim(Cells[12,i]) then
         begin
            if trim(Cells[4,i]) = '2' then sChkYN := 'Y'
            else sChkYN := 'N';

            SqlText := Format(' UPDATE pehreaim_combas SET '+
                                      ' UNIONYN   = '''+sChkYN+''' '+
                               ' WHERE rabasdate = ''%s'' AND empno = ''%s'' AND deptcode = ''%s'' ',
                              [trim(Cells[10,i]), trim(Cells[1,i]), trim(Cells[11,i])]);
            DataModule_Tmax.Cupd_SQL := Sqltext;
            DataModule_Tmax.Cupd_Exec;
            if not DataModule_Tmax.Cupd_ret then
            begin
               Messagedlg('APP-Server Error',mtError,[mbOK],0);
               Exit;
            end;

            {
            if sGrid1.Cells[13,i] <> '' then
            begin
               showmessage('공동목표 대상자이면서 개인목표등록을 한 대상자는 '+#13+
                           '변경할 수 없습니다. ');
            end
            else
            begin
               if trim(Cells[4,i]) = '2' then sChkYN := 'Y'
               else sChkYN := 'N';

               SqlText := Format(' UPDATE pehreaim_combas SET '+
                                         ' UNIONYN   = '''+sChkYN+''' '+
                                  ' WHERE rabasdate = ''%s'' AND empno = ''%s'' AND deptcode = ''%s'' ',
                                 [trim(Cells[10,i]), trim(Cells[1,i]), trim(Cells[11,i])]);
               DataModule_Tmax.Cupd_SQL := Sqltext;
               DataModule_Tmax.Cupd_Exec;
               if not DataModule_Tmax.Cupd_ret then
               begin
                  Messagedlg('APP-Server Error',mtError,[mbOK],0);
                  Exit;
               end;
            end;
            }
            {
            if trim(Cells[4,i]) = '2' then sChkYN := 'Y'
            else sChkYN := 'N';

            SqlText := Format('UPDATE pehreaim_combas SET '+
                                   '  UNIONYN   = '''+sChkYN+''' '+
                              ' WHERE rabasdate = ''%s'' AND empno = ''%s'' AND deptcode = ''%s'' ',
                              [trim(Cells[10,i]), trim(Cells[1,i]), trim(Cells[11,i])]);

            DataModule_Tmax.Cupd_SQL := Sqltext;
            DataModule_Tmax.Cupd_Exec;
            if not DataModule_Tmax.Cupd_ret then
            begin
               Messagedlg('APP-Server Error',mtError,[mbOK],0);
               Exit;
            end;
            }
         end;
      end;
   end;
   showmessage('처리되었습니다.');
   Bt_SrhClick(self);
end;

procedure TMainForm.ed_nameKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
     Bt_SrhClick(self);
end;

procedure TMainForm.sGrid1DblClick(Sender: TObject);
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

