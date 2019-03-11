{* ======================= Program Header ======================================
 PROGRAM-NAME   : 인턴사원 OJT 일일업무일지(pef6030a.exe)
 SYSTEM-NAME    : 평가
 SUBSYSTEM-NAME : 인턴 평가
 Programmer     : 이희용
 Version        : 1.0
 Date           : 2013.02.15

 USER LIBRARY : OutputForm : 출력조건 Form.
                PrintForm  : 출력인쇄 Form.

Update Contents
   Version    date(yy.mm.dd)     programmer    relevant doc.no  description
    1.00      2013.02.15         이희용        설계명세서       최초개발본
============================================================================= *}
unit UDiaryForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, OnFocusButton, OnEditMemo, OnEditMdate, ExtCtrls, OnShapeLabel,
  OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl, OnPopupEdit, Tmax_session,
  OnScheme, Db, Tmax_DataSetText, TmaxFunc, Oninsacommon, OnDBEditCtrl,
  Mask, pebtnedit, PeJeonBtnDateEdit, MemDS, DBAccess, Func, Grids,
  OnPimcalendar, ImgList, Buttons, OnDBGrid, DBGrids, OnGrDBGrid,
  OnEditCombo, OnTmaxPersonEdit, peextcombo;

type
  TDiaryForm = class(TForm)
    SF_Main: TOnSchemeForm;
    Panel1: TPanel;
    Bt_Srh: TOnFocusButton;
    T_Memo: TTMaxDataSet;
    L_korname: TOnShapeLabel;
    L_E1empno: TOnShapeLabel;
    L_deptcode: TOnShapeLabel;
    L_DeptName: TOnShapeLabel;
    Bt_insert: TOnFocusButton;
    ExitBtn: TOnFocusButton;
    Loginemp: TEdit;
    TDml: TTMaxDataSet;
    T_Score: TTMaxDataSet;
    TCSel: TTMaxDataSet;
    E_E1OPINION1: TOnMemo;
    E_E1OPINION2: TOnMemo;
    OnMemo1: TOnMemo;
    Label1: TLabel;
    E_E1VALVIEW: TOnMemo;
    L_E1korname: TOnShapeLabel;
    OnShapeLabel2: TOnShapeLabel;
    Bt_Confirm: TOnFocusButton;
    OutputBtn: TOnFocusButton;
    OnMemo2: TOnMemo;
    E_E1APP01: TOnComboEdit;
    E_E1APP02: TOnComboEdit;
    E_E1APP03: TOnComboEdit;
    E_E1APP04: TOnComboEdit;
    E_E1APP05: TOnComboEdit;
    E_E1APP06: TOnComboEdit;
    E_E1APP07: TOnComboEdit;
    E_E1APP08: TOnComboEdit;
    E_E1APP09: TOnComboEdit;
    E_E1APP10: TOnComboEdit;
    L_E2empno: TOnShapeLabel;
    L_E2korname: TOnShapeLabel;
    T_Ojt: TTMaxDataSet;
    Button1: TButton;
    CB_Srh: TOnFocusButton;
    TMaxDataSet1: TTMaxDataSet;
    cb_empno: TOnComboEdit;
    TMaxSession: TTMaxSession;
    CB_RDate: TOnComboEdit;
    Ed_Empno: TOnWinPopupEdit;
    procedure Bt_SrhClick(Sender: TObject);
    procedure Bt_insertClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MemoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure E_E1OPINION1Click(Sender: TObject);
    procedure Bt_ConfirmClick(Sender: TObject);
    procedure OutputBtnClick(Sender: TObject);
    procedure Ed_empnoCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure Ed_empnoInitPopup(Sender: TObject);
    procedure Ed_empnoKeyPress(Sender: TObject; var Key: Char);
    procedure E_E1OPINION1Exit(Sender: TObject);
    procedure ExitBtnClick(Sender: TObject);
    procedure CB_SrhClick(Sender: TObject);
    procedure cb_empnoKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure CB_RDateChange(Sender: TObject);
    procedure CB_RDateKeyPress(Sender: TObject; var Key: Char);
    procedure cb_empnoChange(Sender: TObject);
  private
    { Private declarations }
    SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String;

    procedure Csel_Open;
    Function  Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String) : Boolean;

  public
    { Public declarations }
    START: Boolean;
    gbChanged: Boolean;

    Wempno, vEMPNO, vE1Empno, vE2Empno, vConyn, vE1Conyn : String;
    Pempno, Pkorname, Password, Ppermission : String;
    vE1OPINION1, vE1OPINION2, vE1VALVIEW    : String;
    vE1Apptot   : integer;
    PSysdate    : string;
    Prabasdate  : String;
    pMStDate,  pMEdDate  :String;
    pTStDate,  pTEdDate  :String;
    Lgubun      : Integer;
    gubun       : Integer;
    check       : Integer;
    EempFind    : Boolean;
    pOrgDeptList: String;
    FL_Start    : Boolean;
    FL_Ins      : Boolean;
    FL_SchItem  : TOnSchItem;
    function  TCsel_gfd(p_loc: Integer): String;
    function  fnSetVariable(mGubun: Integer): Boolean;
    procedure ComponentReadOnly(BValue:Boolean);
    procedure ComponentClear;
    procedure Select_BaseData;
    procedure Read_Data;
    procedure Show_Data;
    procedure AppTOT_Sum;
    function OverLap_Data : boolean;
  end;

var
  DiaryForm: TDiaryForm;
  WorkEmp1 : String;
  WorkEmp2 : String;
  WorkEmp3 : String;
  WorkEmp4 : String;
  WorkEmp5 : String;
  Csel_SQL : String;
  Csel_ret : Boolean;
implementation

uses UEmpForm, UPrintForm;

{$R *.DFM}

function TDiaryForm.TCsel_gfd(p_loc: Integer): String;
var
  v_cnt, v_tmp: Integer;
  v_data: String;
begin
  Result := '';
  v_data := TCsel.FieldByName('SEL_DATA').AsString;
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

procedure TDiaryForm.Csel_Open;
begin
  Csel_ret := False;
  with TCsel do
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

function TDiaryForm.fnSetVariable(mGubun: Integer): Boolean;
begin
  Result := False;

  case mGubun of
    1:
       Csel_SQL := Format(
          'SELECT  ' +
          '       nvl(  value1   ,'' '')       '+
          '  FROM peintbas                     '+
          ' WHERE rabasdate = ''%s''           '+
          '   AND gubun     = ''%s''           '+
          '   AND sgubun    = ''%s''           ',['00000000','00','0000']); // 기준일
    2:
       Csel_SQL :=
          'SELECT nvl(  to_char(sysdate,''YYYYMMDDHH24MISSD''),'' '') FROM dual';
    3:
       Csel_SQL := Format(
          'SELECT  ' +
          '       nvl(  value1   ,'' '') || '';'' || '+
          '       nvl(  value2   ,'' '') || '';'' || '+
          '       nvl(  value3   ,'' '') || '';'' || '+
          '       nvl(  value4   ,'' '') || '';'' || '+
          '       nvl(  value5   ,'' '')             '+
          '  FROM peintbas                           '+
          ' WHERE rabasdate = ''%s''                 '+
          '   AND gubun     = ''%s''                 '+
          '   AND sgubun    = ''%s''                 ',[Prabasdate,'01','0002']); // 업무담당자
    4:
       Csel_SQL := Format(
          'SELECT  ' +
          '       nvl(  value1   ,'' '') || '';'' || '+
          '       nvl(  value2   ,'' '') || '';'' || '+
          '       nvl(  value3   ,'' '') || '';'' || '+
          '       nvl(  value4   ,'' '')             '+
          '  FROM peintbas                           '+
          ' WHERE rabasdate = ''%s''                 '+
          '   AND gubun     = ''%s''                 '+
          '   AND sgubun    = ''%s''                 ',[Prabasdate,'01','0003']); // 평가서등록시작일,종료일

    5:
       Csel_SQL := Format(
          'SELECT Distinct rabasdate                 '+
          '  FROM peintbas                           '+
          ' WHERE gubun     = ''%s''                 '+
          '   AND sgubun    = ''%s''                 '+
          '   AND rabasdate > ''%s''                 '+
          '   ORDER BY 1 DESC ',['01','0002', '20130601']); // 기준일 선택용
    6:
       Csel_SQL := Format(
          'SELECT Empno                      '+
          '  FROM PEINTMAS                   '+
          ' WHERE rabasdate = ''%s''         '+
          '   and (    (E1empno = ''%s'' )   '+
          '         OR (E2empno = ''%s'' ) ) '+
          '   ORDER BY 1 ',[CB_RDate.Text, Loginemp.Text, Loginemp.Text]); // 인턴 선택용
    7:
       Csel_SQL := Format(
          'SELECT ' +
          '       nvl(korname, '' '') || '';'' || '+
          '       nvl(E1Conyn, '' '') '+
          '  FROM PEINTMAS            '+
          ' WHERE rabasdate = ''%s''  '+
          '   and empno     = ''%s''  ',[CB_RDate.Text, cb_empno.Text]); // 인턴 선택용
//==============================================================================//
    else
     System.Exit;
  end;

  Csel_Open;

  case mGubun of
    1 : begin
             Prabasdate:= TCsel_gfd(1);
        end;
    2 : begin
             pSysdate  := TCsel_gfd(1);
        end;
    3 : begin
             workemp1  := TCsel_gfd(1);
             workemp2  := TCsel_gfd(2);
             workemp3  := TCsel_gfd(3);
             workemp4  := TCsel_gfd(4);
             workemp5  := TCsel_gfd(5);
        end;
    4 : begin
             pMStDate  := TCsel_gfd(1);
             pMEdDate  := TCsel_gfd(2);
             pTStDate  := TCsel_gfd(3);
             pTEdDate  := TCsel_gfd(4);
        end;
    5 : begin
          CB_RDate.Items.CLEAR;
          WITH TCsel DO
          BEGIN
            WHILE NOT Eof DO
            BEGIN
              CB_RDate.Items.ADD(TCsel_gfd(1));
              NEXT;
            END;
          END;
          CB_RDate.ItemIndex := 0;
        end;
    6 : begin
          CB_empno.Clear;
          CB_empno.Items.CLEAR;
          WITH TCsel DO
          BEGIN
            WHILE NOT Eof DO
            BEGIN
              CB_empno.Items.ADD(TCsel_gfd(1));
              NEXT;
            END;
          END;
          CB_empno.ItemIndex := 0;
        end;
    7 : begin
          L_korname.ValueCaption := TCsel_gfd(1);
          vE1Conyn  := TCsel_gfd(2);
        end;
  end;

  TCsel.Close;
  Result := True;
end;

procedure TDiaryForm.Select_BaseData;
begin
  wEmpno     := Loginemp.Text;
  prabasdate := CB_RDate.Text;

  Csel_SQL      := 'SELECT A.empno||'';''||A.korname||'';''||A.orgnum||'';''||A.deptcode||'';''||                '+#13+
                   '       (select deptname from pycdept where orgnum=A.orgnum and deptcode=A.deptcode)||'';''|| '+#13+
                   '       A.E1empno||'';''||A.E1korname||'';''||A.E1ConYN||'';''||A.E2empno||'';''||A.E2korname '+#13+
                   '  FROM PEINTMAS A                                                                            '+#13+
                   ' WHERE RABASDATE like '''+Copy(prabasdate,1,4)+'%'+''' '+#13+
//                   ' WHERE rabasdate = '''+prabasdate+'''                         '+#13+
                   '   and       A.empno   like '''+ vEmpno +'''||''%''    '+#13+
                   '   and (    (A.E1empno like '''+ Loginemp.Text +'''||''%'')   '+#13+
                   '         OR (A.E2empno like '''+ Loginemp.Text +'''||''%'') ) '+#13+
                   ' order by e1conyn desc                                        ';

  Csel_Open;

  vEmpno                   := TCsel_gfd(1);
  Ed_Empno.Text            := TCsel_gfd(1);
//  L_korname.ValueCaption   := TCsel_gfd(2);
  L_Deptcode.Hint          := TCsel_gfd(3);
  L_Deptcode.ValueCaption  := TCsel_gfd(4);
  L_Deptname.ValueCaption  := TCsel_gfd(5);
  vE1Empno                 := TCsel_gfd(6);
  L_E1empno.ValueCaption   := TCsel_gfd(6);
  L_E1korname.ValueCaption := TCsel_gfd(7);
  vE1Conyn                 := TCsel_gfd(8);
  vE2Empno                 := TCsel_gfd(9);
  L_E2empno.ValueCaption   := TCsel_gfd(9);
  L_E2korname.ValueCaption := TCsel_gfd(10);

  if (TCsel.RecordCount < 1) then
  begin
       if (Workemp1 = Pempno) or (Workemp2 = Pempno) or
          (Workemp3 = Pempno) or (Workemp4 = Pempno) or
          (Workemp5 = Pempno) or (Copy(Pempno,1,1) = 'D' ) then
       begin

       End
       Else
       Begin
       MessageDlg('인턴사원을 평가하시는 멘토가 아닙니다.'+#13+
                  '프로그램을 종료합니다.',mtInformation,[mbOk],0);
         ExitBtnClick(ExitBtn);
         System.exit;
       End;
  end;

  if Wempno = vE1Empno   then
  begin
       Lgubun := 2;
       Bt_Insert.Caption  := '저장';
       Bt_Confirm.Caption := '최종완료';

       if   vE1Conyn ='N' then
       begin
            Bt_insert.visible  := true;
            Bt_confirm.visible := true;
            ComponentReadOnly(True);
       end
       else
       begin
            Bt_insert.visible  := false;
            Bt_confirm.visible := false;
            ComponentReadOnly(False);
       end;
  end
  else if Wempno = vE2Empno  then
  begin
(*
       if   vE1Conyn ='N' then
       begin
            MessageDlg('멘토께서 인턴사원 OJT 개인 과제 평가서 작성을 아직 완료하지 않았습니다.'+#13+
                       '프로그램을 종료합니다.',mtInformation,[mbOk],0);
            ExitBtnClick(ExitBtn);
            System.exit;
       end;
*)
       Lgubun := 3;
       Ed_empno.ButtonWidth  := 24;
       Ed_empno.Enabled      := true;
       Bt_Insert.Visible     := False;
       Bt_Confirm.Visible    := False;
       ComponentReadOnly(False);
  end;
end;

procedure TDiaryForm.Read_Data;
var
  SQLTEXT : String;
begin
  SQLTEXT := 'SELECT EMPNO, E1EMPNO, E1OPINION1, E1OPINION2, E1VALVIEW '+
             '  FROM PEINTMAS a                                        '+
             ' WHERE rabasdate = '''+ prabasdate +'''                  '+
             '   and empno     = '''+ ed_empno.Text +'''               ';
  With T_Memo do
  begin
       Close;
       ServiceName := 'HINSA_select3';
       ClearFieldInfo;
       AddField('EMPNO'        , ftString,  2000 );
       AddField('E1EMPNO'      , ftString,  2000 );
       AddField('E1OPINION1'   , ftString,  2000 );
       AddField('E1OPINION2'   , ftString,  2000 );
       AddField('E1VALVIEW'    , ftString,  2000 );
       ClearParamInfo;
       Sql.Clear;
       Sql.Text := SQLTEXT;
       Open;
  end;

  SQLTEXT :=  'SELECT E1APP01, E1APP02, E1APP03, E1APP04, E1APP05,      '+
              '       E1APP06, E1APP07, E1APP08, E1APP09, E1APP10       '+
              '  FROM PEINTMAS a                                        '+
              ' WHERE rabasdate = '''+ prabasdate +'''                  '+
              '   and empno     = '''+ ed_empno.Text +'''               ';
  with T_Score do
  begin
       Close;
       ServiceName := 'HINSA_select10';
       ClearFieldInfo;
       AddField('E1APP01'   , ftString, 100);
       AddField('E1APP02'   , ftString, 100);
       AddField('E1APP03'   , ftString, 100);
       AddField('E1APP04'   , ftString, 100);
       AddField('E1APP05'   , ftString, 100);
       AddField('E1APP06'   , ftString, 100);
       AddField('E1APP07'   , ftString, 100);
       AddField('E1APP08'   , ftString, 100);
       AddField('E1APP09'   , ftString, 100);
       AddField('E1APP10'   , ftString, 100);
       ClearParamInfo;
       Sql.Clear;
       SQL.Text := SQLTEXT;
       Open;
  end;
end;

procedure TDiaryForm.Show_Data;
var
  SQLTEXT : String;
begin

  SQLTEXT := 'SELECT EMPNO, E1EMPNO, E1OPINION1, E1OPINION2, E1VALVIEW '+
             '  FROM PEINTMAS a                                        '+
             ' WHERE rabasdate = '''+ prabasdate +'''                  '+
             '   and empno     = '''+ ed_empno.Text +'''               ';
  With T_Memo do
  begin
       Close;
       ServiceName := 'HINSA_select3';
       ClearFieldInfo;
       AddField('EMPNO'        , ftString,  2000 );
       AddField('E1EMPNO'      , ftString,  2000 );
       AddField('E1OPINION1'   , ftString,  2000 );
       AddField('E1OPINION2'   , ftString,  2000 );
       AddField('E1VALVIEW'    , ftString,  2000 );
       ClearParamInfo;
       Sql.Clear;
       Sql.Text := SQLTEXT;
       Open;

       if T_Ojt.RecordCount > 0 then
       begin
            vE1OPINION1 :=  T_Ojt.FieldByName('E1OPINION1').AsString;
            vE1OPINION2 :=  T_Ojt.FieldByName('E1OPINION2').AsString;
       end
       else
       begin
            vE1OPINION1 := '부서 업무중에서 선정하되, 인턴사원으로서의 참신한 관점을 이용할 수 있는'+#13#10+
                           '창의적이고 생산적인 업무와 연관된 과제를 선정(Max 1000Byte)';

            vE1OPINION2 := '개인과제에 대해 사전에 설정된 목표, Output Image 등을 작성하되,'+#13#10+
                           '목표관리[MBO(Management By Objective)]가 가능하도록 되도록이면 '+#13#10+
                           '정량적인 과제목표로 설정(Max 1000Byte)';

       end;
  end;


  vE1VALVIEW  := '과제 수행과정에서의 노력도, 과제 성과에 대한 Quality 등 전반적인 평가 의견을 '+#13#10+
                 '작성하시기 바랍니다.(Max 1000Byte)';

  if T_Memo.FieldByName('E1OPINION1').AsString = '' then
        E_E1OPINION1.Text := vE1OPINION1
  else
        E_E1OPINION1.Text := T_Memo.FieldByName('E1OPINION1').AsString;

  if T_Memo.FieldByName('E1OPINION2').AsString = '' then
        E_E1OPINION2.Text := vE1OPINION2
  else
        E_E1OPINION2.Text := T_Memo.FieldByName('E1OPINION2').AsString;

  if T_Memo.FieldByName('E1VALVIEW').AsString = '' then
        E_E1VALVIEW.Text  := vE1VALVIEW
  else
        E_E1VALVIEW.Text  := T_Memo.FieldByName('E1VALVIEW').AsString;

  E_E1APP01.Text    := T_Score.FieldByName('E1APP01').AsString;
  E_E1APP02.Text    := T_Score.FieldByName('E1APP02').AsString;
  E_E1APP03.Text    := T_Score.FieldByName('E1APP03').AsString;
  E_E1APP04.Text    := T_Score.FieldByName('E1APP04').AsString;
  E_E1APP05.Text    := T_Score.FieldByName('E1APP05').AsString;
  E_E1APP06.Text    := T_Score.FieldByName('E1APP06').AsString;
  E_E1APP07.Text    := T_Score.FieldByName('E1APP07').AsString;
  E_E1APP08.Text    := T_Score.FieldByName('E1APP08').AsString;
  E_E1APP09.Text    := T_Score.FieldByName('E1APP09').AsString;
  E_E1APP10.Text    := T_Score.FieldByName('E1APP10').AsString;
end;

procedure TDiaryForm.Bt_SrhClick(Sender: TObject);
begin
  vEmpno        := '';
  Ed_empno.Text := Loginemp.Text;
  fnSetVariable(6);
  Select_BaseData;
  Read_Data;
  Show_Data;

  check := 0;
end;

procedure TDiaryForm.AppTOT_Sum;
begin
  vE1APPTOT := 0;
  if E_E1APP01.Text <> '' then
     vE1APPTOT := vE1APPTOT + StrtoInt(E_E1APP01.Text);
  if E_E1APP02.Text <> '' then
     vE1APPTOT := vE1APPTOT + StrtoInt(E_E1APP02.Text);
  if E_E1APP03.Text <> '' then
     vE1APPTOT := vE1APPTOT + StrtoInt(E_E1APP03.Text);
  if E_E1APP04.Text <> '' then
     vE1APPTOT := vE1APPTOT + StrtoInt(E_E1APP04.Text);
  if E_E1APP05.Text <> '' then
     vE1APPTOT := vE1APPTOT + StrtoInt(E_E1APP05.Text);
  if E_E1APP06.Text <> '' then
     vE1APPTOT := vE1APPTOT + StrtoInt(E_E1APP06.Text);
  if E_E1APP07.Text <> '' then
     vE1APPTOT := vE1APPTOT + StrtoInt(E_E1APP07.Text);
  if E_E1APP08.Text <> '' then
     vE1APPTOT := vE1APPTOT + StrtoInt(E_E1APP08.Text);
  if E_E1APP09.Text <> '' then
     vE1APPTOT := vE1APPTOT + StrtoInt(E_E1APP09.Text);
  if E_E1APP10.Text <> '' then
     vE1APPTOT := vE1APPTOT + StrtoInt(E_E1APP10.Text);
end;


function TDiaryForm.OverLap_Data;
var
  SQLTEXT, nE1APPTOT1, nE1APPTOT2 : String;
begin
  Result := True;
  SQLTEXT := 'SELECT E1APPTOT, '''' F2, '''' F3, '''' F4, '''' F5  FROM ( '+
             'SELECT EMPNO,    '+
             '   NVL(SUM(NVL(E1APP01,0)+NVL(E1APP02,0)+NVL(E1APP03,0)+NVL(E1APP04,0)+NVL(E1APP05,0)+ '+
             '   NVL(E1APP06,0)+NVL(E1APP07,0)+NVL(E1APP08,0)+NVL(E1APP09,0)+NVL(E1APP10,0)), 0) E1APPTOT '+
             '  FROM PEINTMAS  '+
             ' WHERE RABASDATE = '''+ prabasdate +'''              '+
             '   and DEPTCODE  = '''+ L_Deptcode.ValueCaption +''' '+
             '   and EMPNO     NOT IN ('''+ ed_empno.Text +''')    '+
             ' GROUP BY rabasdate, DEPTCODE, EMPNO                 '+
             ' ORDER BY E1APPTOT DESC                              '+
             ' )  '+
             ' WHERE ROWNUM = 1 ';

  With T_Memo do
  begin
    Close;
    ServiceName := 'HINSA_select';
    ClearFieldInfo;
    AddField('E1APPTOT', ftString, 100);
    AddField('F2' , ftString, 100);
    AddField('F3' , ftString, 100);
    AddField('F4' , ftString, 100);
    AddField('F5' , ftString, 100);
    ClearParamInfo;
    Sql.Clear;
    Sql.Text := SQLTEXT;
    Open;

    nE1APPTOT1 := FieldByName('E1APPTOT').AsString;
    nE1APPTOT2 := IntToStr(vE1APPTOT);

    If (nE1APPTOT1 = nE1APPTOT2) Then
    Begin
      Exit;
    End;
  end;
  Result := False;
end;

procedure TDiaryForm.Bt_insertClick(Sender: TObject);
var
   SQLTEXT  : String;
begin
  if MessageBox(handle,PChar('내용을 '+Bt_Insert.Caption+'하시겠습니까?'), '확 인',  MB_YESNO or MB_DEFBUTTON2) <> IDYES then
       system.exit;

  if (Pos('(Max 1000Byte)',E_E1Opinion1.Text)  > 0) then E_E1Opinion1.Text  := '';
  if (Pos('(Max 1000Byte)',E_E1Opinion2.Text)  > 0) then E_E1Opinion2.Text  := '';
  if (Pos('(Max 1000Byte)',E_E1VALVIEW.Text)   > 0) then E_E1VALVIEW.Text   := '';

  AppTOT_Sum;

  If (OverLap_Data = True) Then
  Begin
    MessageDlg(' 복수 피평가자의 평가항목 총점은 상대서열화가 필수'+#13 +
               ' 동점 입력 불가, 재입력 요청드립니다..' ,mtError,[mbOK],0);
    Bt_SrhClick(sender);
    Exit;
  End;

  SQLText := Format(
             'UPDATE PEINTMAS  SET                                        ' +#13+
             '       E1OPINION1  = '''+E_E1OPINION1.Text+''' ,            ' +#13+
             '       E1OPINION2  = '''+E_E1OPINION2.Text+''' ,            ' +#13+
             '       E1VALVIEW   = '''+E_E1VALVIEW.Text +''' ,            ' +#13+
             '       E1APP01     = '''+E_E1APP01.Text   +''' ,            ' +#13+
             '       E1APP02     = '''+E_E1APP02.Text   +''' ,            ' +#13+
             '       E1APP03     = '''+E_E1APP03.Text   +''' ,            ' +#13+
             '       E1APP04     = '''+E_E1APP04.Text   +''' ,            ' +#13+
             '       E1APP05     = '''+E_E1APP05.Text   +''' ,            ' +#13+
             '       E1APP06     = '''+E_E1APP06.Text   +''' ,            ' +#13+
             '       E1APP07     = '''+E_E1APP07.Text   +''' ,            ' +#13+
             '       E1APP08     = '''+E_E1APP08.Text   +''' ,            ' +#13+
             '       E1APP09     = '''+E_E1APP09.Text   +''' ,            ' +#13+
             '       E1APP10     = '''+E_E1APP10.Text   +''' ,            ' +#13+
             '       E1APPTOT    = '  +inttoStr(vE1APPTOT)+' ,            ' +#13+
             '       WRITEEMP    = '''+wEmpno           +''' ,            ' +#13+
             '       WRITETIME   = TO_CHAR(SYSDATE, ''YYYYMMDDHH24MISS'') ' +#13+
             ' WHERE RABASDATE   = ''%s''                                 ' +#13+
             '   and empno       = ''%s''                                 ' ,
                   [CB_RDate.text,
                    cb_empno.text]);

  TDml.Close;
  TDml.Sql.Clear;
  TDml.Sql.Text := SqlText;
  TDml.ServiceName := 'PIT1030A_DML';

  if NOT TDml.Execute then
       MessageDlg(Bt_Insert.Caption+' 작업 중 에러가 발생하였습니다.'+#13 +
                  '관리자에게 문의하십시오..' ,mtError,[mbOK],0)
  else
  begin
    Bt_SrhClick(sender);
    MessageDlg(Bt_Insert.Caption+' 작업이 완료되었습니다.', mtInformation,[mbOK],0);
  end;
end;

procedure TDiaryForm.FormCreate(Sender: TObject);
begin
  FL_Start := True;
  START := True;
  EempFind := True;
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

procedure TDiaryForm.ComponentReadOnly(BValue:Boolean);
begin
  E_E1OPINION1.ReadOnly  := not BValue;
  E_E1OPINION2.ReadOnly  := not BValue;
  E_E1APP01.Enabled      := BValue;
  E_E1APP02.Enabled      := BValue;
  E_E1APP03.Enabled      := BValue;
  E_E1APP04.Enabled      := BValue;
  E_E1APP05.Enabled      := BValue;
  E_E1APP06.Enabled      := BValue;
  E_E1APP07.Enabled      := BValue;
  E_E1APP08.Enabled      := BValue;
  E_E1APP09.Enabled      := BValue;
  E_E1APP10.Enabled      := BValue;
  E_E1VALVIEW.ReadOnly   := not BValue;
end;

procedure TDiaryForm.ComponentClear;
begin
  E_E1OPINION1.Font.Color  := clGray;
  E_E1OPINION2.Font.Color  := clGray;
  E_E1VALVIEW.Font.Color   := clGray;
  E_E1OPINION1.Lines.Clear;
  E_E1OPINION2.Lines.Clear;
  E_E1APP01.ItemIndex      := -1;
  E_E1APP02.ItemIndex      := -1;
  E_E1APP03.ItemIndex      := -1;
  E_E1APP04.ItemIndex      := -1;
  E_E1APP05.ItemIndex      := -1;
  E_E1APP06.ItemIndex      := -1;
  E_E1APP07.ItemIndex      := -1;
  E_E1APP08.ItemIndex      := -1;
  E_E1APP09.ItemIndex      := -1;
  E_E1APP10.ItemIndex      := -1;
  E_E1VALVIEW.Lines.Clear;

  E_E1OPINION1.Text := vE1OPINION1;
  E_E1OPINION2.Text := vE1OPINION2;
  E_E1VALVIEW.Lines.Add('과제 수행과정에서의 노력도, 과제 성과에 대한 Quality 등 전반적인 평가 의견을 ');
  E_E1VALVIEW.Lines.Add('작성하시기 바랍니다.(Max 1000Byte)');
  Bt_Insert.Caption  := '저장';
  Bt_Confirm.Caption := '결재상신';
  Bt_Insert.Visible  := True;
  Bt_Confirm.Visible  := True;
end;

procedure TDiaryForm.MemoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  i : word;
  MemoText : string;
begin
  i := 222;
  if  key = i then
  begin
       Messagedlg('작은따옴표는 입력하실 수 없습니다.',mtError,[mbOK],0);
       MemoText := copy(TOnMemo(Sender).text, 1, Length(TOnMemo(Sender).text)-1);
       TOnMemo(Sender).Clear;
       TOnMemo(Sender).Lines.Append(MemoText);
  end;
end;

procedure TDiaryForm.E_E1OPINION1Click(Sender: TObject);
begin
  if (Pos('(Max 1000Byte)',E_E1Opinion1.Text)  > 0)  then E_E1Opinion1.Text  := '';
  if (Pos('(Max 1000Byte)',E_E1Opinion2.Text)  > 0)  then E_E1Opinion2.Text  := '';
  if (Pos('(Max 1000Byte)',E_E1Valview.Text)   > 0)  then E_E1Valview.Text   := '';
  E_E1Opinion1.Font.Color  := clBlack;
  E_E1Opinion2.Font.Color  := clBlack;
  E_E1Valview.Font.Color   := clBlack;
end;

procedure TDiaryForm.Bt_ConfirmClick(Sender: TObject);
var
  SQLTEXT  : String;
begin


  if (Pos('(Max 1000Byte)',E_E1Opinion1.Text)  > 0) then E_E1Opinion1.Text  := '';
  if (Pos('(Max 1000Byte)',E_E1Opinion2.Text)  > 0) then E_E1Opinion2.Text  := '';
  if (Pos('(Max 1000Byte)',E_E1VALVIEW.Text)   > 0) then E_E1VALVIEW.Text   := '';

  if (E_E1Opinion1.Text = '') or (E_E1Opinion2.Text = '') or (E_E1VALVIEW.Text = '') then
  begin
       MessageDlg('과제명, 과제목표, 종합의견을 모두 등록하시기 바랍니다.',mtInformation, [mbOk], 0);
       system.exit;
  end;

  if (E_E1APP01.Text = '') or (E_E1APP02.Text = '') or
     (E_E1APP03.Text = '') or (E_E1APP04.Text = '') or
     (E_E1APP05.Text = '') or (E_E1APP06.Text = '') or
     (E_E1APP07.Text = '') or (E_E1APP08.Text = '') or
     (E_E1APP09.Text = '') or (E_E1APP10.Text = '') then
  begin
       MessageDlg('점수를 모두 등록하시기 바랍니다.',mtInformation, [mbOk], 0);
       system.exit;
  end;

  if MessageBox(handle,PChar(Bt_Confirm.Caption+' 작업을 하시면 등록하신 내역을 수정하실 수 없습니다.'+#13+#13+
                             '등록하신 내역에 대해 모두 확인을 마치셨으면 '+Bt_Confirm.Caption+' 작업을 하시기 바랍니다.'+#13+#13+
                             Bt_Confirm.Caption+' 작업을 하시겠습니까?'), '확 인',  MB_YESNO or MB_DEFBUTTON2) <> IDYES then
  begin
       system.Exit;
  end;

  APPTOT_Sum;

  If (OverLap_Data = True) Then
  Begin
    MessageDlg(' 복수 피평가자의 평가항목 총점은 상대서열화가 필수'+#13 +
               ' 동점 입력 불가, 재입력 요청드립니다..' ,mtError,[mbOK],0);
    Bt_SrhClick(sender);
    Exit;
  End;

  SQLText := Format('UPDATE PEINTMAS  SET                                        ' +#13+
                    '       E1OPINION1  = '''+E_E1OPINION1.Text+''' ,            ' +#13+
                    '       E1OPINION2  = '''+E_E1OPINION2.Text+''' ,            ' +#13+
                    '       E1VALVIEW   = '''+E_E1VALVIEW.Text +''' ,            ' +#13+
                    '       E1APP01     = '''+E_E1APP01.Text   +''' ,            ' +#13+
                    '       E1APP02     = '''+E_E1APP02.Text   +''' ,            ' +#13+
                    '       E1APP03     = '''+E_E1APP03.Text   +''' ,            ' +#13+
                    '       E1APP04     = '''+E_E1APP04.Text   +''' ,            ' +#13+
                    '       E1APP05     = '''+E_E1APP05.Text   +''' ,            ' +#13+
                    '       E1APP06     = '''+E_E1APP06.Text   +''' ,            ' +#13+
                    '       E1APP07     = '''+E_E1APP07.Text   +''' ,            ' +#13+
                    '       E1APP08     = '''+E_E1APP08.Text   +''' ,            ' +#13+
                    '       E1APP09     = '''+E_E1APP09.Text   +''' ,            ' +#13+
                    '       E1APP10     = '''+E_E1APP10.Text   +''' ,            ' +#13+
                    '       E1APPTOT    = '  +inttoStr(vE1APPTOT)+' ,            ' +#13+
                    '       WRITEEMP    = '''+wEmpno           +''' ,            ' +#13+
                    '       WRITETIME   = TO_CHAR(SYSDATE, ''YYYYMMDDHH24MISS''),' +#13+
                    '       E1CONYN     = ''Y''                     ,            ' +#13+
                    '       E1CONDATE   = TO_CHAR(SYSDATE, ''YYYYMMDD'')         ' +#13+
                    ' WHERE RABASDATE   = ''%s''                                 ' +#13+
                    '   and empno       = ''%s''                                 ' ,
                         [CB_RDate.text,
                          cb_empno.text]);

  TDml.Close;
  TDml.Sql.Clear;
  TDml.Sql.Text := SqlText;
  TDml.ServiceName := 'PIT1030A_DML';

  if NOT TDml.Execute then
       MessageDlg('최종완료 중 에러가 발생하였습니다.'+#13 +
                  '관리자에게 문의하십시오..' ,mtError,[mbOK],0)
  else
  begin
       // 멘토에게 메일 보내기 시작
       //==============================================================================//
       // 메일을 보낸다.
       MessageDlg('팀장님께 과제평가서 확인 요청 메일이 발송됩니다.',mtInformation,[mbOK],0);
       SendProgID  := 'PEF5030A';  //프로그램 ID
       SendEmpno   := ve1empno;    //발송자(로그인 사번)
       RcveEmpno   := '2334';
       MailSubject := '인턴사원 OJT 개인 과제 평가서 확인 요청';
       MailBody    := '인턴사원['+ L_korname.ValueCaption +']의 OJT 개인 과제 평가서를 멘토사원['+L_E1korname.ValueCaption +']이 작성 완료하였습니다. '+#13#13+
                      '인턴사원['+ L_korname.ValueCaption +']의 OJT 개인 과제 평가서를 확인하시기 바랍니다. '+#13#13#13+
                      '[종합인사정보시스템] ▶ [평가] ▶ [인턴 평가] ▶ 인턴사원 OJT 개인 과제 평가서';
       ReceiveYN   := 'N';
       //if ChkReceive.Checked then ReceiveYN := 'Y';

       Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN);

       SendProgID  := 'PEF5030A';  //프로그램 ID
       SendEmpno   := ve1empno;    //발송자(로그인 사번)
       RcveEmpno   := ve2empno;
       MailSubject := '인턴사원 OJT 개인 과제 평가서 확인 요청';
       MailBody    := '인턴사원['+ L_korname.ValueCaption +']의 OJT 개인 과제 평가서를 멘토사원['+L_E1korname.ValueCaption +']이 작성 완료하였습니다. '+#13#13+
                      '인턴사원['+ L_korname.ValueCaption +']의 OJT 개인 과제 평가서를 확인하시기 바랍니다. '+#13#13#13+
                      '[종합인사정보시스템] ▶ [평가] ▶ [인턴 평가] ▶ 인턴사원 OJT 개인 과제 평가서';
       ReceiveYN   := 'N';
       //if ChkReceive.Checked then ReceiveYN := 'Y';

       if Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN) then
            MessageDlg('작업이 성공적으로 완료되었습니다.',mtInformation, [mbOk], 0)
       else
       begin
            MessageDlg('메일전송중 에러가 발생하였습니다.',mtError,[mbOK],0);
            System.Exit;
       end;
       //==============================================================================//
       Bt_SrhClick(Sender);
  end;

end;

//EAI 연동을 통한 Web Hint로 메일 발송을 위하여 PZHMAIL 테이블에 Insert...2007.08.01   dsa2000
Function TDiaryForm.Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String) : Boolean;
begin
  with TDml do
  begin
       ServiceName := 'PET1010A_dml';
       Close;
       SQL.Clear;
       SQL.Add('insert into PZHMAIL                           ');
       SQL.Add('values (to_char(sysdate,''YYYYMMDDHH24MISS''),');  //SENDTIME   메일발송 작업시간
       SQL.Add('        '''+ SendProgID   +''',               ');  //SENDPROG   발송프로그램 ID
       SQL.Add('        '''+ SendEmpno    +''',               ');  //SEND_PER   발신자 사번
       SQL.Add('        '''+ RcveEmpno    +''',               ');  //RCVR_PER,  수신자 사번
       SQL.Add('        ''''                  ,               ');  //REFR_PER   불필요(종합인사)
       SQL.Add('        '''+ MailSubject  +''',               ');  //SUBJECT    메일제목
       SQL.Add('        ''''                  ,               ');  //HEADER1    불필요(종합인사)
       SQL.Add('        '''+ MailBody     +''',               ');  //BODY1      메일내용
       SQL.Add('        ''''                  ,               ');  //TAIL1      불필요(종합인사)
       SQL.Add('        '''+ ReceiveYN    +''',               ');  //RECEIVEYN  'Y' 일경우 메일 읽었을경우 송신자에게 수신확인 메일 보내주기
       SQL.Add('        ''N''                 ,               ');  //EAI_FLAG
       SQL.Add('        ''''                  )               ');  //EAI_DATE

       try
            Execute;
       except
            Result := false;
            exit;
       end;
       Result := True;
  end;
end;

procedure TDiaryForm.OutputBtnClick(Sender: TObject);
begin
  if vE1ConYN = 'N' then
  begin
       MessageDlg('멘토께서 인턴사원 OJT 개인 과제 평가서를 아직 최종완료하시지 않았습니다.'+#13+#13+
                  '최종완료하셔야만 출력이 가능합니다.',mtError,[mbOK],0);
       exit;
  end
  else
  begin
       PrintForm.QuickRep1.Preview;
  end;
end;

procedure TDiaryForm.Ed_empnoCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
  if Fm_Emp.empno <> '' then
  begin
       Ed_empno.Text           := Fm_Emp.empno;
       L_korname.ValueCaption  := Fm_Emp.Korname;
       L_deptcode.Hint         := Fm_Emp.orgnum;
       L_deptcode.ValueCaption := Fm_Emp.Deptcode;
       L_deptname.ValueCaption := Fm_Emp.Deptname;
       L_e1empno.ValueCaption  := Fm_Emp.e1empno;
       L_e1korname.ValueCaption:= Fm_Emp.e1Korname;

       vEmpno                  := Fm_Emp.empno;
       Select_BaseData;
       Read_Data;
       Show_Data;

       check := 0;
  end;
end;

procedure TDiaryForm.Ed_empnoInitPopup(Sender: TObject);
begin
  Fm_Emp.Edit        := TOnWinPopupEdit(Sender);
  Fm_Emp.SqlOpen;
  TOnWinPopupEdit(Sender).PopupControl := Fm_Emp ;
end;

procedure TDiaryForm.Ed_empnoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Chr(13) then
  begin
       Bt_SrhClick(Sender);
       inherited;
       Key := #0;
  end;
end;

procedure TDiaryForm.E_E1OPINION1Exit(Sender: TObject);
begin
  if  TOnMemo(Sender).lines.Count > TOnMemo(Sender).Tag  then
  begin
       MessageDlg('내용은 '+inttoStr(TOnMemo(Sender).Tag)+'줄까지만 작성가능합니다.',mtError, [mbOk],0);
       TOnMemo(Sender).SetFocus;
  end;
end;

procedure TDiaryForm.ExitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TDiaryForm.CB_SrhClick(Sender: TObject);
begin
  vEmpno        := '';
  Ed_empno.Text := CB_empno.Text;

  Read_Data;
  Show_Data;

  check := 0;
end;

procedure TDiaryForm.cb_empnoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Chr(13) then
  begin
       CB_SrhClick(Sender);
       inherited;
       Key := #0;
  end;
end;

procedure TDiaryForm.FormShow(Sender: TObject);
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

       fnSetVariable(1);
       fnSetVariable(2);
       fnSetVariable(3);
       fnSetVariable(4);
       fnSetVariable(5);
       fnSetVariable(6);

{
       if (pStDate  > Copy(pSysdate,1,8)) or (pStDate  < Copy(pSysdate,1,8))  then
       begin
            MessageDlg('수습사원 OJT 개인 과제 평가서를 평가하는 기간이 아닙니다.'+#13+
                       '프로그램을 종료합니다.',mtInformation,[mbOk],0);
            ExitBtnClick(ExitBtn);
            System.exit;
       end;
}

       if (Workemp1 = Pempno) or (Workemp2 = Pempno) or
          (Workemp3 = Pempno) or (Workemp4 = Pempno) or
          (Workemp5 = Pempno) or (Copy(Pempno,1,1) = 'D' ) then
       begin
            Loginemp.Visible := True;
            Bt_Srh.Visible   := True;
       end
       else
       begin
            Loginemp.Text    := Pempno;   //사번기억
            Loginemp.Visible := False;
            Bt_Srh.Visible   := False;
       end;

       Bt_SrhClick(sender);
       cb_empnoChange(Self);
  end;
end;
procedure TDiaryForm.CB_RDateChange(Sender: TObject);
begin
  prabasdate := CB_RDate.Text;
  fnSetVariable(6);

//  Select_BaseData;
end;


procedure TDiaryForm.CB_RDateKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Chr(13) then
  begin
       Select_BaseData;
       inherited;
       Key := #0;
  end;
end;

procedure TDiaryForm.cb_empnoChange(Sender: TObject);
var
  SQLTEXT : String;
begin
  Ed_empno.Text := CB_empno.Text;

  SQLTEXT := 'SELECT ' +
             '       nvl(korname, '' '') KOENAME, '+
             '       nvl(E1Conyn, '' '') E1CONYN, '+
             '       (select deptname from pycdept where orgnum=A.orgnum and deptcode=A.deptcode) deptname, '+
             '       '' '' F4, '' '' F5 '+
             '  FROM PEINTMAS a '+
             ' WHERE rabasdate = ''' + CB_RDate.Text + ''' '+
             '   and empno     = ''' + cb_empno.Text + ''' ';

  With T_Memo do
  begin
    Close;
    ServiceName := 'HINSA_select';
    ClearFieldInfo;
    AddField('KORNAME',  ftString, 100);
    AddField('E1CONYN',  ftString, 100);
    AddField('deptname', ftString, 100);
    AddField('F4' , ftString, 100);
    AddField('F5' , ftString, 100);
    ClearParamInfo;
    Sql.Clear;
    Sql.Text := SQLTEXT;
    Open;

    L_korname.ValueCaption := '';
    L_korname.ValueCaption := FieldByName('KORNAME').AsString;
    vE1Conyn := FieldByName('E1CONYN').AsString;
    L_Deptname.ValueCaption  := FieldByName('deptname').AsString;
  End;

  if Wempno = vE1Empno   then
  begin
       Lgubun := 2;
       Bt_Insert.Caption  := '저장';
       Bt_Confirm.Caption := '최종완료';

       if   vE1Conyn ='N' then
       begin
            Bt_insert.visible  := true;
            Bt_confirm.visible := true;
            ComponentReadOnly(True);
       end
       else
       begin
            Bt_insert.visible  := false;
            Bt_confirm.visible := false;
            ComponentReadOnly(False);
       end;
  end
  else if Wempno = vE2Empno  then
  begin
       if   vE1Conyn ='N' then
       begin
            MessageDlg('멘토께서 인턴사원 OJT 개인 과제 평가서 작성을 아직 완료하지 않았습니다.'+#13+
                       '프로그램을 종료합니다.',mtInformation,[mbOk],0);
            ExitBtnClick(ExitBtn);
            System.exit;
       end;
       Lgubun := 3;
       Ed_empno.ButtonWidth  := 24;
       Ed_empno.Enabled      := true;
       Bt_Insert.Visible     := False;
       Bt_Confirm.Visible    := False;
       ComponentReadOnly(False);
  end;

  CB_SrhClick(Sender);
end;

end.
