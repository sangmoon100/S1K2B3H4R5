unit PEK1040A3;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, Buttons, ExtCtrls, DBGrids, Db, DBClient, peoutlookbtn,
  PeJeonVertLabel, PeJeonLabel, ComCtrls, Tmax_DataSetText, OnEditBaseCtrl,
  OnEditStdCtrl, OnEditMemo, OnShapeLabel, OnFocusButton, OnDBGrid,
  OnEditBtnCtrl, OnEditCombo, OnCheckBox, OnEditNumCtl;

type
  TSubForm2 = class(TForm)
    TDS1: TTMaxDataSet;
    Panel1: TPanel;
    E_TaskName: TOnMemo;
    E_AbleSum: TOnMemo;
    Q_IDP: TTMaxDataSet;
    DS_Able: TDataSource;
    OnDBGrid1: TOnDBGrid;
    E_DevPlan: TOnMemo;
    E_bigo: TOnMemo;
    E_AbleName: TOnComboEdit;
    OnDBGrid2: TOnDBGrid;
    E_AbleNo: TOnNumberEdit;
    L_MidPlan: TOnShapeLabel;
    E_Help: TOnMemo;
    DS_IDP: TDataSource;
    Q_Able: TTMaxDataSet;
    E_DevMethod: TOnComboEdit;
    B_Add1: TPeJeonOutLookBtn;
    B_Save1: TPeJeonOutLookBtn;
    B_del1: TPeJeonOutLookBtn;
    B_Cancel1: TPeJeonOutLookBtn;
    E_Previous: TOnCheckBox;
    E_RComment: TOnMemo;
    E_RBigo: TOnMemo;
    OnShapeLabel1: TOnShapeLabel;
    E_E1Comment: TOnMemo;
    BT_Save: TOnFocusButton;
    Q_Text: TTMaxDataSet;
    P_Previous: TOnEdit;

    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure E_AbleSumExit(Sender: TObject);
    procedure DS_IDPDataChange(Sender: TObject; Field: TField);
    procedure Edit_Enabled(Ttag : integer; TFlag : Boolean);
    procedure B_Add1Click(Sender: TObject);
    procedure B_Save1Click(Sender: TObject);
    procedure B_del1Click(Sender: TObject);
    procedure B_Cancel1Click(Sender: TObject);
    procedure OnDBGrid1DblClick(Sender: TObject);
    procedure OnDBGrid1Enter(Sender: TObject);
    procedure BT_SaveClick(Sender: TObject);
    procedure E_RCommentExit(Sender: TObject);
    procedure E_AbleSumKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure P_PreviousKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure OnDBGrid1TitleClick(Sender: TObject; const ACell: TOnJCell);
    procedure P_PreviousClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    var_paycl   : String; //직급별 평가표번호를 불어오기위해 추가.  dsa2000 2008.09.
    empno    : String;   // 자기평가자 사번
    Pjobkind : String;
    vDeptcode : String;
    var_sscore, var_dscore: Real;
    procedure IDP_ReadData;
    function  Csel_gfd(p_loc: Integer): String;
  end;

var
  SubForm2: TSubForm2;

implementation
{$R *.DFM}
uses
  HMainForm;
{------------------------------- USER FUNCTION ----------------------------------}

function TSubForm2.Csel_gfd(p_loc: Integer): String;
var
  v_cnt, v_tmp: Integer;
  v_data: String;
begin
  Result := '';
  v_data := TDS1.FieldByName('SEL_DATA').AsString;
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

procedure TSubForm2.Edit_Enabled(Ttag : integer; TFlag : Boolean);
begin
     //E_seqno.Enabled    := TFlag;
     E_AbleName.Enabled   := TFlag;
     E_AbleSum.Enabled    := TFlag;
     E_Previous.Enabled   := TFlag;
     P_Previous.Enabled   := TFlag;
     E_DevMethod.Enabled  := TFlag;
     E_DevPlan.Enabled    := TFlag;
     E_Bigo.Enabled       := TFlag;
     B_save1.Enabled      := TFlag;
     B_del1.Enabled       := TFlag;
     if (FM_Main.vRvalConyn = 'Y') then
     begin
          E_DevPlan.ReadOnly   := True;
          E_Bigo.ReadOnly      := True;
          B_Add1.Enabled       := False;
          B_save1.Enabled      := False;
          B_del1.Enabled       := False;

          E_RComment.ReadOnly  := True;
          E_RBigo.ReadOnly     := True;
          E_E1Comment.Enabled  := True;

          if (FM_Main.LGubun = 1) or (FM_Main.vE1valConyn = 'Y') then
              E_E1Comment.ReadOnly := True
          else
              E_E1Comment.ReadOnly := False;
     end
     else
     begin
          E_DevPlan.ReadOnly   := False;
          E_Bigo.ReadOnly      := False;
          B_Add1.Enabled       := not TFlag;
          E_E1Comment.Enabled  := False;
     end;
end;

{------------------------------- Main ----------------------------------}
procedure TSubForm2.FormShow(Sender: TObject);
begin
  E_RComment.Text  := '';
  E_RBigo.Text     := '';
  E_E1Comment.Text := '';

  IDP_ReadData;
  if Q_IDP.RecordCount <= 0 then showmessage('업무목표 등록 자료가 없습니다.');

  Edit_Enabled(1,False);
end;

procedure TSubForm2.IDP_ReadData;
begin
  with Q_IDP do   //팀장이 등록한 목표 Read
  begin
       ServiceName := 'HINSA_select';
       Close;
       ClearFieldInfo;
       AddField('GUBUN'     , ftString, 100);
       AddField('Taskcode'  , ftString, 100);
       AddField('Taskname'  , ftString, 100);
       AddField('Field4'    , ftString, 100);
       AddField('Field5'    , ftString, 100);

       Sql.Clear;

       Sql.Add('Select ''공동'' GUBUN, Taskcode, Taskname, ''F4'', ''F5'' ');
       Sql.Add('  From pehreaim_basdet b                                  ');
       Sql.Add(' Where rabasdate = '''+FM_Main.vRabasdate   +'''          ');
       Sql.Add('   And empno     = '''+FM_Main.Ed_empno.Text+'''          ');
       //jissi 실제 올리기전에 풀어야 함
       Sql.Add('   and (select E1PRJCONYN from pehremas                   ');
       Sql.Add('         where rabasdate = b.rabasdate                    ');
       Sql.Add('           and empno     = b.empno)     = ''Y''           ');
       //
       Sql.Add(' Union                                                    ');
       Sql.Add('Select ''개별'' GUBUN, SEQNO, PROPELTASK, ''F4'', ''F5''  ');
       Sql.Add('  From pehreaim_det a                                     ');
       Sql.Add(' Where rabasdate = '''+FM_Main.vRabasdate +'''            ');
       Sql.Add('   And empno     = '''+FM_Main.Ed_empno.Text+'''          ');
       Sql.Add('   And seqno    <> ''99''                                 ');
       //jissi 실제 올리기전에 풀어야 함
       Sql.Add('   and (select E1PRJCONYN from pehremas                   ');
       Sql.Add('         where rabasdate = a.rabasdate                    ');
       Sql.Add('           and empno     = a.empno)     = ''Y''           ');
       //
       Sql.Add(' Order by 1 desc, Taskcode                                ');
       Open;    //   Edit1.Text := sql.text;
  end;

  with Q_Text do   //중장기 경력계획
  begin
       ServiceName := 'HINSA_select3';
       Close;
       ClearFieldInfo;
       AddField('empno'     , ftString, 2000);
       AddField('RComment'  , ftString, 2000);
       AddField('RBIGO'     , ftString, 2000);
       AddField('E1Comment' , ftString, 2000);
       AddField('Field5'    , ftString, 2000);

       Sql.Clear;
       Sql.Add('Select empno, RComment, RBIGO, E1Comment, ''F5''          ');
       Sql.Add('  From peActfile a                                        ');
       Sql.Add(' Where rabasym  = '''+FM_Main.vRabasYM +'''               ');
       Sql.Add('   And empno     = '''+FM_Main.Ed_empno.Text+'''          ');
       Open;

       if Q_Text.RecordCount > 0 then
       begin
            E_RComment.Text    :=  Q_Text.Fieldbyname('RComment').AsString;
            E_RBigo.Text       :=  Q_Text.Fieldbyname('RBigo').AsString;
            If ((FM_Main.LGubun = 1) and (FM_Main.vE1valconYN = 'Y')) or (FM_Main.LGubun = 2) then
            E_E1Comment.Text   :=  Q_Text.Fieldbyname('E1Comment').AsString;
            FM_Main.vE1Comment :=  Q_Text.Fieldbyname('E1Comment').AsString;
       end;
  end;
end;

procedure TSubForm2.DS_IDPDataChange(Sender: TObject; Field: TField);
begin
  B_Cancel1Click(Sender);
  FM_Main.vGubun    := Q_IDP.Fields[0].AsString;
  FM_Main.vTaskcode := Q_IDP.Fields[1].AsString;
  FM_Main.vTaskname := Q_IDP.Fields[2].AsString;
  E_TaskName.Text   := Q_IDP.Fields[2].AsString;
  with Q_Able do
  begin
       ServiceName := 'PEK1040A_sel1';
       Close;
       ClearFieldInfo;
       AddField('RABASYY'  , ftString, 4);
       AddField('EMPNO'    , ftString, 4);
       AddField('GUBUN'    , ftString, 4);
       AddField('TASKCODE' , ftInteger,10);
       AddField('TASKNAME' , ftString, 100);
       AddField('ABLENO'   , ftInteger,10);
       AddField('ABLENAME' , ftString, 20);
       AddField('ABLESUM'  , ftString, 100);
       AddField('PREVIOUS' , ftString, 2);
       AddField('DEVMETHOD', ftString, 20);
       AddField('DEVPLAN'  , ftString, 200);
       AddField('BIGO'     , ftString, 100);

       Sql.Clear;
       Sql.Add('Select rabasyy, empno, gubun, taskcode, taskname,                    ');
       Sql.Add('       ableno, ablename, ablesum, previous, devmethod, devplan, bigo ');
       Sql.Add('  From peact1idp                                                      ');
       Sql.Add(' Where rabasyy = '''+ FM_Main.vRabasYY      +'''                     ');
       Sql.Add('   And empno   = '''+ FM_Main.Ed_empno.Text +'''                     ');
       Sql.Add('   And gubun   = '''+ FM_Main.vGubun        +'''                     ');
       Sql.Add('   And taskcode= '''+ FM_Main.vTaskcode     +'''                     ');
       Open;
  end;
end;

procedure TSubForm2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := True;
end;

procedure TSubForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := cafree;
end;

{------------------------------ Event ---------------------------------}
procedure TSubForm2.E_AbleSumExit(Sender: TObject);
begin
  if  TOnMemo(Sender).lines.Count > 5  then
  begin
       MessageDlg(intTostr(TOnMemo(Sender).Tag)+'의 내용은 5줄까지만 작성가능합니다.',mtError, [mbOk],0);
       TOnMemo(Sender).SetFocus;
  end;
end;

procedure TSubForm2.B_Add1Click(Sender: TObject);
begin
  B_cancel1Click(Sender);
  with TDS1 do
  begin
       Close;
       SQL.Clear;
       Sql.Add('Select Nvl(max(ableno),0)+1 From peact1idp         ');
       Sql.Add(' Where rabasyy = '''+ FM_Main.vRabasYY      +'''  ');
       Sql.Add('   And empno   = '''+ FM_Main.Ed_empno.Text +'''  ');
       Sql.Add('   And gubun   = '''+ FM_Main.vGubun        +'''  ');
       Sql.Add('   And taskcode= '''+ FM_Main.vTaskcode     +'''  ');

       ServiceName := 'PED0000A_common';
       ClearFieldInfo;
       AddField('SEL_DATA', ftString, 100);
       Open;

       if TDS1.RecordCount <> 0 then  E_AbleNo.Value     := TDS1.Fields[0].AsInteger;
       if E_AbleNo.Value    = 1 then  E_Previous.Checked := True;
  end;
  Edit_Enabled(TComponent(Sender).Tag,True);
  E_AbleName.SetFocus;
end;

procedure TSubForm2.B_Save1Click(Sender: TObject);
var vPrevious : String;
begin
  if  (trim(E_AbleName.text) = '') then
  begin
       MessageDlg('역량 유형 내역을 등록하지 않았습니다.' +#13 + '확인하십시오.',mtError,[mbOK],0);
       Exit;
  end;

  if  (trim(E_AbleSum.text) = '') then
  begin
       MessageDlg('역량 개요 내역을 등록하지 않았습니다.' +#13 + '확인하십시오.',mtError,[mbOK],0);
       Exit;
  end;

  if  (trim(E_DevMethod.text) = '') then
  begin
       MessageDlg('개발 방법 내역을 등록하지 않았습니다.' +#13 + '확인하십시오.',mtError,[mbOK],0);
       Exit;
  end;

  if  (trim(E_DevPlan.text) = '') then
  begin
       MessageDlg('개발(실천)계획 내역을 등록하지 않았습니다.' +#13 + '확인하십시오.',mtError,[mbOK],0);
       Exit;
  end;

  with TDS1 do
  begin
       Close;
       SQL.Clear;
       SQL.Add('Select Count(*) SEL_DATA From peact1idp                   ');
       Sql.Add(' WHERE rabasyy   = '''+ Fm_Main.vRabasYY           +'''  ');
       Sql.Add('   AND empno     = '''+ Fm_Main.Ed_empno.Text      +'''  ');
       Sql.Add('   AND gubun     = '''+ FM_Main.vGubun             +'''  ');
       Sql.Add('   AND taskcode  = '  + FM_Main.vTaskcode          +  '  ');
       Sql.Add('   AND ableno    = '  + FloatToStr(E_AbleNo.Value) +  '  ');

       ServiceName := 'PED0000A_common';
       ClearFieldInfo;
       AddField('SEL_DATA', ftInteger, 100);
       Open;
  end;

  vPrevious := '';
  if E_Previous.Checked then vPrevious := '●' else vPrevious := '';
  if  TDS1.Fields[0].AsInteger = 0 then
  begin
       with TDS1 do
       begin
            ServiceName := 'PEA1060A_dml';
            Close;
            Sql.Clear;
            Sql.Add('insert into peact1idp                                             ');
            Sql.Add('       (rabasyy, empno,    gubun,   taskcode, taskname,          ');
            Sql.Add('        ableno,  ablename, ablesum, previous, devmethod, devplan,');
            Sql.Add('        bigo,    Writeemp, Writetime )                           ');
            Sql.Add('Values ('''+ Fm_Main.vRabasYY            +''',                   ');
            Sql.Add('        '''+ Fm_Main.Ed_empno.Text       +''',                   ');
            Sql.Add('        '''+ FM_Main.vGubun              +''',                   ');
            Sql.Add('        '''+ FM_Main.vTaskcode           +''',                   ');
            Sql.Add('        '''+ FM_Main.vTaskname           +''',                   ');
            Sql.Add('        '''+ FloatToStr(E_AbleNo.Value)  +''',                   ');
            Sql.Add('        '''+ E_AbleName.Text             +''',                   ');
            Sql.Add('        '''+ E_AbleSum.Text              +''',                   ');
            Sql.Add('        '''+ vPrevious                   +''',                   ');
            Sql.Add('        '''+ E_DevMethod.Text            +''',                   ');
            Sql.Add('        '''+ E_DevPlan.Text              +''',                   ');
            Sql.Add('        '''+ E_Bigo.Text                 +''',                   ');
            Sql.Add('        '''+ Fm_Main.GSempno              +''',                  ');
            Sql.Add('        to_char(sysdate,''YYYYMMDDHHMISS'')       )              ');
            
            Execute;
       end;
  end
  else
  begin
       with TDS1 do
       begin
            ServiceName := 'PEA1060A_dml';
            Close;
            Sql.Clear;
            Sql.Add('Update peact1idp                                              ');
            Sql.Add('   Set TaskName  = '''+ FM_Main.vTaskname              +''', ');
            Sql.Add('       AbleName  = '''+ E_AbleName.Text                +''', ');
            Sql.Add('       AbleSum   = '''+ E_AbleSum.Text                 +''', ');
            Sql.Add('       Previous  = '''+ vPrevious                      +''', ');
            Sql.Add('       DevMethod = '''+ E_DevMethod.Text               +''', ');
            Sql.Add('       DevPlan   = '''+ E_DevPlan.Text                 +''', ');
            Sql.Add('       Bigo      = '''+ E_Bigo.Text                    +''', ');
            Sql.Add('       Writeemp  = '''+ Fm_Main.GSempno                +''', ');
            Sql.Add('       Writetime = to_char(sysdate,''YYYYMMDDHHMISS'')       ');
            Sql.Add(' WHERE rabasyy   = '''+ Fm_Main.vRabasYY               +'''  ');
            Sql.Add('   AND empno     = '''+ Fm_Main.Ed_empno.Text          +'''  ');
            Sql.Add('   AND gubun     = '''+ FM_Main.vGubun                 +'''  ');
            Sql.Add('   AND taskcode  = '  + FM_Main.vTaskcode              +  '  ');
            Sql.Add('   AND ableno    = '  + FloatToStr(E_AbleNo.Value)     +  '  ');
            Execute;
       end;
  end;
  if   E_Previous.Checked then
  begin
       with TDS1 do
       begin
            ServiceName := 'PEA1060A_dml';
            Close;
            Sql.Clear;
            Sql.Add('Update peact1idp                                              ');
            Sql.Add('   Set TaskName  = '''+ FM_Main.vTaskname              +''', ');
            Sql.Add('       Previous  = Null,                                     ');
            Sql.Add('       Writeemp  = '''+ Fm_Main.GSempno                +''', ');
            Sql.Add('       Writetime = to_char(sysdate,''YYYYMMDDHHMISS'')       ');
            Sql.Add(' WHERE rabasyy   = '''+ Fm_Main.vRabasYY               +'''  ');
            Sql.Add('   AND empno     = '''+ Fm_Main.Ed_empno.Text          +'''  ');
            Sql.Add('   AND gubun     = '''+ FM_Main.vGubun                 +'''  ');
            Sql.Add('   AND taskcode  = '  + FM_Main.vTaskcode              +  '  ');
            Sql.Add('   AND ableno   <> '  + FloatToStr(E_AbleNo.Value)     +  '  '); 
            Execute;
       end;
  end;
  MessageDlg('성공적으로 저장하였습니다.', mtInformation, [mbOK], 0);
  Q_IDP.Close;
  Q_IDP.Open;  
  B_cancel1Click(Sender);
end;

procedure TSubForm2.B_del1Click(Sender: TObject);
begin
  if  E_AbleNo.Value = 0 then
  begin
       MessageDlg('삭제할 자료가 없습니다.' +#13 + '확인 후 다시입력하십시오.',mtError,[mbOK],0);
       Exit;
  end;

  if MessageBox(handle,PChar('해당 역량유형을 삭제하시겠습니까?'), '확 인',  MB_YESNO or MB_DEFBUTTON2) <> IDYES then system.Exit;

  with TDS1 do
  begin
       Close;
       SQL.Clear;
       Sql.Add('Delete peact1idp                                         ');
       Sql.Add(' WHERE rabasyy   = '''+ Fm_Main.vRabasYY           +''' ');
       Sql.Add('   AND empno     = '''+ Fm_Main.Ed_empno.Text      +''' ');
       Sql.Add('   AND gubun     = '''+ Q_IDP.Fields[0].AsString   +''' ');
       Sql.Add('   AND taskcode  = '  + Q_IDP.Fields[1].AsString   +  ' ');
       Sql.Add('   AND ableno    = '  + FloatToStr(E_AbleNo.Value) +  ' ');
       Close;
       ServiceName := 'PEA1060A_dml';
       Execute;
  end;
  MessageDlg('해당 역량유형을 삭제하였습니다.', mtInformation, [mbOK], 0);
  Q_IDP.Close;
  Q_IDP.Open;
  B_cancel1Click(Sender);
end;

procedure TSubForm2.B_Cancel1Click(Sender: TObject);
begin
  E_AbleNo.Value     := 0;
  E_AbleName.Text    := '';
  E_AbleSum.Text     := '';
  E_Previous.Checked := False;
  E_DevMethod.Text   := '';
  E_DevPlan.Text     := '';
  E_Bigo.Text        := '';
  Edit_Enabled(1,False);
end;

procedure TSubForm2.OnDBGrid1DblClick(Sender: TObject);
begin
     if  (not Q_Able.Eof) And  (Fm_Main.ve1valconyn <> 'Y') then //And (Fm_Main.Pempno = Fm_Main.Ed_empno.Text) then
     begin
          E_Ableno.Text         := Q_Able.fieldbyname('ABLENO' ).AsString;
          E_AbleName.Text       := Q_Able.fieldbyname('AbleName' ).AsString;
          E_AbleSum.Text        := Q_Able.fieldbyname('AbleSum' ).AsString;
          if Q_Able.fieldbyname('Previous' ).AsString = '' then
               E_Previous.Checked := False
          else
               E_Previous.Checked := true;
          E_DevMethod.Text        := Q_Able.fieldbyname('DevMethod' ).AsString;
          E_DevPlan.Text        := Q_Able.fieldbyname('DEVPlan').AsString;
          E_Bigo.Text           := Q_Able.fieldbyname('Bigo'   ).AsString;
          Edit_Enabled(1,True);
     end;
end;

procedure TSubForm2.OnDBGrid1Enter(Sender: TObject);
begin
     if (TOnDbGrid(Sender).Name ='OnDBGrid1') then
     begin
          B_Cancel1Click(Sender);
          E_Help.Text :=  #13#13+'『'+E_TaskName.Text+'』'+#13#13+
                         '- 해당 중점업무를 달성하는데 있어서 요구되는 역량을'+#13#13+
                         '  더블클릭으로 선택하여 입력하거나 삭제.';
     end
     else
     if (TOnDbGrid(Sender).Name ='OnDBGrid2') then
     begin
          E_Help.Text := #13#13+'- 중점추진업무 선택후 역량유형 및 실천계획등을 입력저장.';
     end
     else
     if (TOnComboEdit(Sender).Name ='E_AbleName') or (TOnMemo(Sender).Name ='E_AbleSum') then
     begin
          E_Help.Text := '해당 중점추진업무를 달성하는데 있어서 요구되는 핵심역량'+#13#13+
                         '①지식(Knowledge)'+#13+
                         '  - 관련지식/기술/이론/기준,지침/법/Trend 등으로'+#13+
                         '    비교적 단기간에 학습이 가능한 역량'+#13#13+
                         '②스킬(Skill)/경험'+#13+
                         '  - 관계형성/Communication 관련 스킬'+#13#13+
                         '③SK Values(Attitude)'+#13+
                         '  - SK Values 기반의 바람직한 태도/행동양식' ;
     end
     else
     if (TOnEdit(Sender).Name ='P_Previous') or (TOnCheckBox(Sender).Name = 'E_Previous') then
     begin
          E_Help.Text := '해당 역량(실천)이 업무성과 달성에 미치는 영향정도'+#13#13+
                         '○ 최우선순위 하나만 선택' ;
     end
     else
     if (TOnComboEdit(Sender).Name ='E_DevMethod') or (TOnMemo(Sender).Name ='E_DevPlan') then
     begin
          E_Help.Text := '해당 역량 보완 및 향상을 위한 구체적인 실행계획'+#13#13+
                         '①일을 통한 실천'+#13+
                         '  - 관찰&측정가능한 구체적 행동양식으로 표현'+#13#13+
                         '②교육P/G 수강'+#13+
                         '  - `10년 전사/부문별 교육체계 및 교육P/G 참고'+#13+
                         '  - 현업부서교육/사외교육/세미나 등'+#13#13+
                         '③Self-Study'+#13+
                         '  - 기타 자기개발(도서,자격증 등)' ;
     end
     else
     if (TOnMemo(Sender).Name ='E_bigo') then
     begin
          E_Help.Text := '개발(실천)계획을 실행하는 실천일정/빈도/수준 등으로 '+#13+
                         '정기적으로 진단/점검이 가능한 지표'+#13#13+
                         '①일정'+#13+
                         '  - "0월~0월","~0분기","0월"'+#13#13+
                         '②빈도'+#13+
                         '  - "주0회","매월","매일00시" 등'+#13+
                         '  - "월00회","월00시간" 등' ;
     end;
end;

procedure TSubForm2.BT_SaveClick(Sender: TObject);
begin
  if  (trim(E_RComment.text) = '') then
  begin
       MessageDlg('중기 경력개발 계획 내용을 등록하지 않았습니다.' +#13 + '확인하십시오.',mtError,[mbOK],0);
       Exit;
  end;

  with TDS1 do
  begin
       Close;
       SQL.Clear;
       SQL.Add('Select Count(*) SEL_DATA From PeActfile                  ');
       Sql.Add(' WHERE rabasym   = '''+ Fm_Main.vRabasYM           +'''  ');
       Sql.Add('   AND empno     = '''+ Fm_Main.Ed_empno.Text      +'''  ');

       ServiceName := 'PED0000A_common';
       ClearFieldInfo;
       AddField('SEL_DATA', ftInteger, 100);
       Open;
  end;

  if  TDS1.Fields[0].AsInteger = 0 then
  begin
       with TDS1 do
       begin
            ServiceName := 'PEA1060A_dml';
            Close;
            Sql.Clear;
            Sql.Add('insert into PeActfile                                        ');
            Sql.Add('       (rabasym, empno,                                      ');
            Sql.Add('        RComment,  RBigo,  Writeemp, Writetime )             ');
            Sql.Add('Values ('''+ Fm_Main.vRabasYM             +''',              ');
            Sql.Add('        '''+ Fm_Main.Ed_empno.Text        +''',              ');
            Sql.Add('        '''+ Trim(E_RComment.Text)        +''',              ');
            Sql.Add('        '''+ Trim(E_RBigo.Text)           +''',              ');
            Sql.Add('        '''+ Fm_Main.GSempno              +''',              ');
            Sql.Add('        to_char(sysdate,''YYYYMMDDHHMISS'')       )          ');
            Execute;
       end;
  end
  else
  begin
       with TDS1 do
       begin
            ServiceName := 'PEA1060A_dml';
            Close;
            Sql.Clear;
            Sql.Add('Update PeActfile                                             ');
            Sql.Add('   Set RComment  = '''+ Trim(E_RComment.Text)          +''', ');
            Sql.Add('       RBigo     = '''+ Trim(E_RBigo.Text)             +''', ');
            Sql.Add('       Writeemp  = '''+ Fm_Main.GSempno                +''', ');
            Sql.Add('       Writetime = to_char(sysdate,''YYYYMMDDHHMISS'')       ');
            Sql.Add(' WHERE rabasym   = '''+ Fm_Main.vRabasYM               +'''  ');
            Sql.Add('   AND empno     = '''+ Fm_Main.Ed_empno.Text          +'''  ');
            Execute;
       end;
  end;
  FM_Main.vRComment   :=  trim(E_RComment.Text);
  FM_Main.vRbigo      :=  trim(E_RBigo.Text);
  FM_Main.vE1Comment  :=  trim(E_E1Comment.Text);
  MessageDlg('성공적으로 저장하였습니다.', mtInformation, [mbOK], 0);
end;

procedure TSubForm2.E_RCommentExit(Sender: TObject);
begin
  if  TOnMemo(Sender).lines.Count > 7  then
  begin
       MessageDlg(intTostr(TOnMemo(Sender).Tag)+'의 내용은 7줄까지만 작성가능합니다.',mtError, [mbOk],0);
       TOnMemo(Sender).SetFocus;
  end;
{
  if  TOnMemo(Sender).Name = 'E_RComment' then
      FM_Main.vRComment   :=  trim(TOnMemo(Sender).Text);

  if  TOnMemo(Sender).Name = 'E_RBigo' then
      FM_Main.vRbigo      :=  trim(TOnMemo(Sender).Text);
}
  if  TOnMemo(Sender).Name = 'E_E1Comment' then
      FM_Main.vE1Comment  :=  trim(TOnMemo(Sender).Text);
end;

procedure TSubForm2.E_AbleSumKeyDown(Sender: TObject; var Key: Word;
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

procedure TSubForm2.P_PreviousKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if E_Previous.Checked then
        E_Previous.Checked := False
     else
        E_Previous.Checked := true;
end;

procedure TSubForm2.OnDBGrid1TitleClick(Sender: TObject;
  const ACell: TOnJCell);
begin
     Case ACell.LevelIndex of
          0: begin
                  E_Help.Text :=  #13#13+'『'+E_TaskName.Text+'』'+#13#13+
                                 '- 해당 중점업무를 달성하는데 있어서 요구되는 역량을'+#13#13+
                                 '  더블클릭으로 선택하여 입력하거나 삭제.';
             end;
        1,2: begin
                  E_Help.Text := '해당 중점추진업무를 달성하는데 있어서 요구되는 핵심역량'+#13#13+
                                 '①지식(Knowledge)'+#13+
                                 '  - 관련지식/기술/이론/기준,지침/법/Trend 등으로'+#13+
                                 '    비교적 단기간에 학습이 가능한 역량'+#13#13+
                                 '②스킬(Skill)/경험'+#13+
                                 '  - 관계형성/Communication 관련 스킬'+#13#13+
                                 '③SK Values(Attitude)'+#13+
                                 '  - SK Values 기반의 바람직한 태도/행동양식' ;
             end;
          3: begin
                  E_Help.Text := '해당 역량(실천)이 업무성과 달성에 미치는 영향정도'+#13#13+
                                 '○ 최우선순위 하나만 선택' ;
             end;
        4,5: begin
                  E_Help.Text := '해당 역량 보완 및 향상을 위한 구체적인 실행계획'+#13#13+
                                 '①일을 통한 실천'+#13+
                                 '  - 관찰&측정가능한 구체적 행동양식으로 표현'+#13#13+
                                 '②교육P/G 수강'+#13+
                                 '  - `10년 전사/부문별 교육체계 및 교육P/G 참고'+#13+
                                 '  - 현업부서교육/사외교육/세미나 등'+#13#13+
                                 '③Self-Study'+#13+
                                 '  - 기타 자기개발(도서,자격증 등)' ;
             end;
          6: begin
                  E_Help.Text := '개발(실천)계획을 실행하는 실천일정/빈도/수준 등으로 '+#13+
                                 '정기적으로 진단/점검이 가능한 지표'+#13#13+
                                 '①일정'+#13+
                                 '  - "0월~0월","~0분기","0월"'+#13#13+
                                 '②빈도'+#13+
                                 '  - "주0회","매월","매일00시" 등'+#13+
                                 '  - "월00회","월00시간" 등' ;
             end;
     end
end;

procedure TSubForm2.P_PreviousClick(Sender: TObject);
begin
     if E_Previous.Checked then
        E_Previous.Checked := False
     else
        E_Previous.Checked := true;
end;

end.

