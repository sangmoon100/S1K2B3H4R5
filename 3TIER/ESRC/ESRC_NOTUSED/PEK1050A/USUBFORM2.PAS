unit USubForm2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, Buttons, ExtCtrls, DBGrids, Db, DBClient, peoutlookbtn,
  PeJeonVertLabel, PeJeonLabel, ComCtrls, Tmax_DataSetText, OnShapeLabel,
  OnDBGrid, OnEditBaseCtrl, OnEditStdCtrl, OnEditMemo, OnGrDBGrid,
  OnRadioBtn, OnEditBtnCtrl, OnEditCombo;

type
  TSubForm2 = class(TForm)
    Panel1: TPanel;
    E_ActPlan: TOnMemo;
    E_Detcomment: TOnMemo;
    E_Complement: TOnMemo;
    OnDBGrid1: TOnDBGrid;
    L_PlanTitle: TOnShapeLabel;
    E_Actno: TOnEdit;
    Q_plan1: TTMaxDataSet;
    DataSource1: TDataSource;
    L_Label: TOnShapeLabel;
    E_Obstacle: TOnMemo;
    E_Self11: TOnRadioButton;
    E_Self12: TOnRadioButton;
    E_Self13: TOnRadioButton;
    E_Self14: TOnRadioButton;
    E_Self15: TOnRadioButton;
    OnShapeLabel3: TOnShapeLabel;
    OnShapeLabel4: TOnShapeLabel;
    E_E1C11: TOnRadioButton;
    E_E1C12: TOnRadioButton;
    E_E1C13: TOnRadioButton;
    E_E1C14: TOnRadioButton;
    E_E1C15: TOnRadioButton;
    B_Save1: TPeJeonOutLookBtn;
    B_del1: TPeJeonOutLookBtn;
    B_Cancel1: TPeJeonOutLookBtn;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    procedure B_Cancel1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure B_Save1Click(Sender: TObject);
    procedure B_del1Click(Sender: TObject);
    procedure E_ActPlanKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure OnDBGrid1CellClick(Sender: TObject; const ACell: TOnJCell);
    procedure E_ActPlanExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    vGubun : String;
    vSelfcheck, vE1check : String;
    procedure Plan_data;
    procedure MemoClear1;
    procedure Edit_Enabled(TFlag : Boolean);
  end;

var
  SubForm2: TSubForm2;

implementation
{$R *.DFM}

uses  HMainForm;

{------------------------------- Main ----------------------------------}
procedure TSubForm2.FormShow(Sender: TObject);
begin
  Application.ProcessMessages;
  L_Label.LabelCaption := '';

  if FM_Main.SB_4.BtnDown then
  begin
       L_PlanTitle.LabelCaption := '솔선 수범';
       L_PlanTitle.ValueCaption := ' KPI 달성 및 생산성 향상을 위한 솔선 수범 및 실천 계획';
       vGubun := '1';
  end
  else if FM_Main.SB_5.BtnDown then
  begin
       L_PlanTitle.LabelCaption := '구성원 L/H/C';
       L_PlanTitle.ValueCaption := ' 구성원 KPI달성을 위한 육성 및 L/H/C 실천계획';
       vGubun := '2';
  end;

  Plan_data;

  Edit_Enabled(False);
end;

{------------------------------- USER FUNCTION ----------------------------------}
procedure TSubForm2.Plan_data;
var  i : integer;
     SavePlace: TBookmark;
begin
  with  Q_Plan1  do
  begin
       Close;
       ServiceName := 'PEK1050A_sel1';
       ClearFieldInfo;
       AddField('Rabasym'    , ftString,  6);
       AddField('Empno'      , ftString,  4);
       AddField('Gubun'      , ftString,  1);
       AddField('Actno'      , ftString,  1);
       AddField('Actplan'    , ftString,  100);
       AddField('Detcomment' , ftString,  200);
       AddField('Obstacle'   , ftString,  200);
       AddField('Complement' , ftString,  200);
       AddField('Selfcheck'  , ftString,  1);
       AddField('E1check'    , ftString,  1);
       if  ((FM_Main.LGubun = 1) And (FM_Main.Le1valconyn ='Y')) or (FM_Main.LGubun = 2) then
       SQL.Text := 'Select H.Rabasym, M.Empno, M.Gubun, M.Actno, M.Actplan,     '+
                   '       Detcomment, Obstacle, Complement, Selfcheck, E1check '+
                   '  from peAct2his H, peAct2mas M                             '+
                   ' WHERE M.rabasyy    = '''+ FM_Main.LRabasYY      +'''       '+
                   '   and H.Rabasym(+) = '''+ FM_Main.LRabasYM      +'''       '+
                   '   and M.EMPNO      = H.EMPNO(+)                            '+
                   '   and M.EMPNO      = '''+ FM_Main.Ed_empno.Text +'''       '+
                   '   and M.gubun      = H.gubun(+)                            '+
                   '   and M.gubun      = '''+ vGubun                +'''       '+
                   '   and M.Actno      = H.Actno(+)                            '+
                   ' order by Gubun, ACTNO                                      '
       else
       SQL.Text := 'Select H.Rabasym, M.Empno, M.Gubun, M.Actno, M.Actplan,        '+
                   '       Detcomment, Obstacle, Complement, Selfcheck,Null E1check'+
                   '  from peAct2his H, peAct2mas M                                '+
                   ' WHERE M.rabasyy    = '''+ FM_Main.LRabasYY      +'''          '+
                   '   and H.Rabasym(+) = '''+ FM_Main.LRabasYM      +'''          '+
                   '   and M.EMPNO      = H.EMPNO(+)                               '+
                   '   and M.EMPNO      = '''+ FM_Main.Ed_empno.Text +'''          '+
                   '   and M.gubun      = H.gubun(+)                               '+
                   '   and M.gubun      = '''+ vGubun                +'''          '+
                   '   and M.Actno      = H.Actno(+)                               '+
                   ' order by Gubun, ACTNO                                         ';
       Open;
       SavePlace := GetBookmark;

       for i := 1 to Recordcount do
       begin
            if fieldbyname('RABASYM').AsString = '' then
            begin
                 if vGubun = '1' then
                     FM_Main.SB_Help.Panels[1].Text := FM_Main.LRabasYY+'년'+FM_Main.LRabasMM+FM_Main.Rabasname+'의 솔선수범 내역중에 등록되지 않은 자료가 있습니다.'
                 else
                     FM_Main.SB_Help.Panels[1].Text := FM_Main.LRabasYY+'년'+FM_Main.LRabasMM+FM_Main.Rabasname+'의 구성원L/H/C 내역중에 등록되지 않은 자료가 있습니다.';
            end;
            next;
       end;
       GotoBookmark(SavePlace);
       FreeBookmark(SavePlace);
       first;
  end;
end;

{------------------------------버튼클릭---------------------------------}
procedure TSubForm2.B_Cancel1Click(Sender: TObject);
begin
  E_Actno.Text      := '';
  MemoClear1;
  Edit_Enabled(False);

  Plan_data;
end;

procedure TSubForm2.MemoClear1;
var  FL_No: Integer;
     FL_CompRB : TOnRadioButton;
begin
  E_ActPlan.Lines.Clear;
  E_Detcomment.Lines.Clear;
  E_Obstacle.Lines.Clear;
  E_Complement.Lines.Clear;

  E_Detcomment.EditLabel.Width := 244;
  E_Obstacle.EditLabel.Width   := 179;
  E_Complement.EditLabel.Width := 279;

  for FL_No := 1 to 5 do
  begin
       FL_CompRB := TOnRadioButton(Self.FindComponent('E_Self1' + IntToStr(FL_No)) );
       FL_CompRB.Checked := False;
       FL_CompRB := TOnRadioButton(Self.FindComponent('E_E1C1'  + IntToStr(FL_No)) );
       FL_CompRB.Checked := False;
  end;
end;

{------------------------------ Event ---------------------------------}
procedure TSubForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := cafree;
end;

procedure TSubForm2.Edit_Enabled(TFlag : Boolean);
var  FL_No: Integer;
     FL_CompRB : TOnRadioButton;
begin
  E_Detcomment.Enabled := TFlag;
  E_Obstacle.Enabled   := TFlag;
  E_Complement.Enabled := TFlag;
  B_save1.Enabled      := TFlag;
  B_del1.Enabled       := TFlag;

  for FL_No := 1 to 5 do
  begin
       if FM_Main.LGubun = 1 then //팀장자기
       begin
            FL_CompRB := TOnRadioButton(Self.FindComponent('E_Self1' + IntToStr(FL_No)) );
            FL_CompRB.Enabled := TFlag;
       end;
       if FM_Main.LGubun = 2 then //상사.
       begin
            FL_CompRB := TOnRadioButton(Self.FindComponent('E_E1C1'  + IntToStr(FL_No)) );
            FL_CompRB.Enabled := TFlag;
       end;
  end;

  if (FM_Main.LRvalConyn = 'Y') then
  begin
       E_Detcomment.ReadOnly := True;
       E_Obstacle.ReadOnly   := True;
       E_Complement.ReadOnly := True;
       B_save1.Enabled       := False;
       B_del1.Enabled        := False;
       for FL_No := 1 to 5 do
       begin
            if FM_Main.LGubun = 1 then //팀장자기
            begin
                 FL_CompRB := TOnRadioButton(Self.FindComponent('E_Self1' + IntToStr(FL_No)) );
                 FL_CompRB.Enabled := False;
            end;
            if FM_Main.LGubun = 2 then //상사.
            begin
                 if FM_Main.LE1valconyn = 'Y' then
                 begin
                      FL_CompRB := TOnRadioButton(Self.FindComponent('E_E1C1'  + IntToStr(FL_No)) );
                      FL_CompRB.Enabled := False;
                 end
                 else
                 begin
                      FL_CompRB := TOnRadioButton(Self.FindComponent('E_E1C1'  + IntToStr(FL_No)) );
                      FL_CompRB.Enabled := True;
                 end;
            end;
       end;
  end
  else
  begin
       E_Detcomment.ReadOnly := False;
       E_Obstacle.ReadOnly   := False;
       E_Complement.ReadOnly := False;
       for FL_No := 1 to 5 do
       begin
            if FM_Main.LGubun = 1 then //팀장자기
            begin
                 FL_CompRB := TOnRadioButton(Self.FindComponent('E_Self1' + IntToStr(FL_No)) );
                 FL_CompRB.Enabled := True;
            end;
            if FM_Main.LGubun = 2 then //상사.
            begin
                 FL_CompRB := TOnRadioButton(Self.FindComponent('E_E1C1'  + IntToStr(FL_No)) );
                 FL_CompRB.Enabled := True;
            end;
       end;
  end;
end;

procedure TSubForm2.B_Save1Click(Sender: TObject);
var  FL_No: integer;
     FL_CompRB : TOnRadioButton;
begin
  if  trim(E_Actno.text) = '' then
  begin
       MessageDlg('순번이 없습니다.' +#13 + '확인 후 다시입력하십시오.',mtError,[mbOK],0);
       Exit;
  end;
  if   (trim(E_Detcomment.text) = '') then
  begin
       MessageDlg('세부 실천 내용이 없습니다.' +#13 + '확인 후 다시 입력하십시오.',mtError,[mbOK],0);
       Exit;
  end;
  if   (trim(E_Obstacle.text) = '') then
  begin
       MessageDlg('장애요인의 내용이 없습니다.' +#13 + '확인 후 다시 입력하십시오.',mtError,[mbOK],0);
       Exit;
  end;
  if   (trim(E_Complement.text) = '') then
  begin
       MessageDlg('보완계획의 내용이 없습니다.' +#13 + '확인 후 다시 입력하십시오.',mtError,[mbOK],0);
       Exit;
  end;

  for FL_No := 1 to 5 do
  begin
       FL_CompRB := TOnRadioButton(Self.FindComponent('E_Self1' + IntToStr(FL_No)) );
       if FL_CompRB.Checked then  vSelfcheck := Copy(FL_CompRB.Name,8,1);
       FL_CompRB := TOnRadioButton(Self.FindComponent('E_E1C1'  + IntToStr(FL_No)) );
       if FL_CompRB.Checked then  vE1check   := Copy(FL_CompRB.Name,7,1);
  end;

  with FM_Main.TMaxDataSet_HInsa do
  begin
       ClearFieldInfo;
       ServiceName := 'PED0000A_common';
       AddField('SEL_DATA', ftString, 100);
       Close;
       SQL.Clear;
       Sql.Text := 'Select count(*) SEL_DATA from peAct2his '+
                   ' WHERE rabasym = '''+ FM_Main.LRabasYM      +''' '+
                   '   and EMPNO   = '''+ FM_Main.Ed_empno.Text +''' '+
                   '   and gubun   = '''+ vGubun                +''' '+
                   '   and ACTNO   = '''+ E_Actno.text          +''' ';
       Open;
  end;

  if  FM_Main.TMaxDataSet_HInsa.FieldByName('SEL_DATA').AsInteger = 0 then
  begin
       with FM_Main.TMaxDML_HInsa do
       begin
            ServiceName := 'PEA1060A_dml';
            Close;
            Sql.Clear;
            SQL.Add('insert into peAct2his                                        ');
            SQL.Add('       (rabasym,    empno,    gubun,      ACTNO,     ActPlan,');
            SQL.Add('        Detcomment, Obstacle, Complement, Selfcheck, E1check,');
            SQL.Add('        Writeemp, Writetime                       )          ');
            SQL.Add('Values ('''+ Fm_Main.LRabasYM                         +''',  ');
            SQL.Add('        '''+ Fm_Main.Ed_empno.Text                    +''',  ');
            SQL.Add('        '''+ vGubun                                   +''',  ');
            SQL.Add('        '  + E_Actno.Text                             +  ',  ');
            SQL.Add('        '''+ E_ActPlan.Text                           +''',  ');
            SQL.Add('        '''+ E_Detcomment.Text                        +''',  ');
            SQL.Add('        '''+ E_Obstacle.Text                          +''',  ');
            SQL.Add('        '''+ E_Complement.Text                        +''',  ');
            SQL.Add('        '''+ vSelfcheck                               +''',  ');
            SQL.Add('        '''+ vE1check                                 +''',  ');
            SQL.Add('        '''+ Fm_Main.Pempno                           +''',  ');
            SQL.Add('        to_char(sysdate,''YYYYMMDDHHMISS'')       ) ');
            Execute;
       end;
  end
  else
  begin
       with FM_Main.TMaxDML_HInsa do
       begin
            ServiceName := 'PEA1060A_dml';
            Close;
            Sql.Clear;
            SQL.Add('Update peAct2his                                              ');
            SQL.Add('   Set ActPlan   = '''+ E_ActPlan.Text                  +''', ');
            SQL.Add('       Detcomment= '''+ E_Detcomment.Text               +''', ');
            SQL.Add('       Obstacle  = '''+ E_Obstacle.Text                 +''', ');
            SQL.Add('       Complement= '''+ E_Complement.Text               +''', ');
            SQL.Add('       Selfcheck = '''+ vSelfcheck                      +''', ');
            SQL.Add('       E1check   = '''+ vE1check                        +''', ');
            SQL.Add('       Writeemp  = '''+ Fm_Main.Pempno                  +''', ');
            SQL.Add('       Writetime = to_char(sysdate,''YYYYMMDDHHMISS'')        ');
            SQL.Add(' WHERE rabasym   = '''+ Fm_Main.LRabasYM                +'''  ');
            SQL.Add('   AND empno     = '''+ Fm_Main.Ed_empno.Text           +'''  ');
            SQL.Add('   AND gubun     = '''+ vGubun                          +'''  ');
            SQL.Add('   AND ACTNO     = '  + E_Actno.Text                    +  '  ');
            Execute;
       end;
  end;           FM_Main.edit1.text := FM_Main.TMaxDML_HInsa.sql.text;
  MessageDlg('성공적으로 저장하였습니다.', mtInformation, [mbOK], 0);

  Plan_data;

  B_cancel1Click(Sender);
end;

procedure TSubForm2.B_del1Click(Sender: TObject);
begin
  if  trim(E_Actno.text) = '' then
  begin
       MessageDlg('삭제할 자료가 없습니다.' +#13 + '확인 후 다시입력하십시오.',mtError,[mbOK],0);
       Exit;
  end;

  with Fm_Main.TMaxDataSet_HInsa do
  begin
       SQL.Clear;
       SQL.Text := format('select count(*) SEL_DATA from peAct2his  '+
                          ' where RabasYM   =''%s''                 '+
                          '   and empno     =''%s''                 '+
                          '   and ACTNO     =''%s''                 ',
                          [FM_Main.LRabasYM, Fm_Main.ED_empno.text, E_Actno.text]);
       Close;
       ServiceName := 'PED0000A_common';
       ClearFieldInfo;
       AddField('SEL_DATA', ftInteger, 100);
       Open;
  end;

  if  Fm_Main.TMaxDataSet_HInsa.FieldByName('SEL_DATA').AsInteger = 0 then
  begin
       MessageDlg('삭제할 자료가 없습니다.' +#13 + '확인 후 다시입력하십시오.',mtError,[mbOK],0);
       Exit;
  end;

  if MessageBox(handle,PChar(Fm_Main.LRabasYY+'년 '+Fm_Main.LRabasMM+FM_Main.Rabasname+' 해당 실천과제 세부내용을 삭제하시겠습니까?'), '확 인',  MB_YESNO or MB_DEFBUTTON2) <> IDYES then
  begin
       system.Exit;
  end;

  with FM_Main.TMaxDML_HInsa do
  begin
       ServiceName := 'PEA1060A_dml';
       Close;
       SQL.Clear;
       SQL.Text := 'delete from peAct2his                              '+
                   ' where rabasym   = '''+ Fm_Main.LRabasYM      +''' '+
                   '   and empno     = '''+ Fm_Main.ED_empno.text +''' '+
                   '   and gubun     = '''+ vGubun                +''' '+
                   '   and ACTNO     = '''+ E_Actno.text          +''' ';
       Execute;
  end;
  MessageDlg('해당 실천과제 세부내용을 삭제하였습니다.', mtInformation, [mbOK], 0);

  B_cancel1Click(Sender);
end;

procedure TSubForm2.E_ActPlanKeyDown(Sender: TObject; var Key: Word;
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

procedure TSubForm2.OnDBGrid1CellClick(Sender: TObject;
  const ACell: TOnJCell);
var
     FL_CompRB : TOnRadioButton;
     FL_No     : Integer;
begin
  if  (not Q_PLAN1.Eof) And  (Fm_Main.Le1valconyn <> 'Y') then //And (Fm_Main.Pempno = Fm_Main.Ed_empno.Text) then
  begin
       E_Detcomment.EditLabel.Width := 0;
       E_Obstacle.EditLabel.Width   := 0;
       E_Complement.EditLabel.Width := 0;
       vSelfcheck        := '';
       vE1check          := '';

       E_Actno.Text      := Q_PLAN1.fieldbyname('ACTNO'  ).AsString;
       E_ActPlan.Text    := Q_PLAN1.fieldbyname('ActPlan').AsString;
       E_Detcomment.Text := Q_PLAN1.fieldbyname('Detcomment').AsString;
       E_Obstacle.Text   := Q_PLAN1.fieldbyname('Obstacle').AsString;
       E_Complement.Text := Q_PLAN1.fieldbyname('Complement').AsString;
       vSelfcheck        := Q_PLAN1.FieldByName('Selfcheck').AsString;
       vE1check          := Q_PLAN1.FieldByName('E1Check').AsString;

       FL_CompRB := nil;

       for FL_No := 1 to 5 do
       begin
            FL_CompRB := TOnRadioButton(Self.FindComponent('E_Self1' + IntToStr(FL_No)) );
            FL_CompRB.Checked := False;
            FL_CompRB := TOnRadioButton(Self.FindComponent('E_E1C1'  + IntToStr(FL_No)) );
            FL_CompRB.Checked := False;
       end;

       if vSelfcheck <> '' then
       begin
            FL_CompRB := TOnRadioButton(Self.FindComponent('E_Self1' + vSelfcheck) );
            FL_CompRB.Checked := True;
       end;
       if vE1check   <> '' then
       begin
            FL_CompRB := TOnRadioButton(Self.FindComponent('E_E1C1'  + vE1check) );
            FL_CompRB.Checked := True;
       end;
       Edit_Enabled(True);
  end;
end;

procedure TSubForm2.E_ActPlanExit(Sender: TObject);
begin
  if  TOnMemo(Sender).lines.Count > 7  then
  begin
       MessageDlg('내용은 16줄까지만 작성가능합니다.',mtError, [mbOk],0);
       TOnMemo(Sender).SetFocus;
  end;
end;

end.
