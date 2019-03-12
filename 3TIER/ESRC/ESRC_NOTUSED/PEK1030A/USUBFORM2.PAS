unit USubForm2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, Buttons, ExtCtrls, DBGrids, Db, DBClient, peoutlookbtn,
  PeJeonVertLabel, PeJeonLabel, ComCtrls, Tmax_DataSetText, OnShapeLabel,
  OnDBGrid, OnEditBaseCtrl, OnEditStdCtrl, OnEditMemo, OnGrDBGrid;

type
  TSubForm2 = class(TForm)
    Panel1: TPanel;
    B_Add1: TPeJeonOutLookBtn;
    B_del1: TPeJeonOutLookBtn;
    E_ActPlan1: TOnMemo;
    E_Detplan1: TOnMemo;
    E_TgPoint1: TOnMemo;
    B_Save1: TPeJeonOutLookBtn;
    B_Cancel1: TPeJeonOutLookBtn;
    OnDBGrid1: TOnDBGrid;
    OnShapeLabel1: TOnShapeLabel;
    OnShapeLabel2: TOnShapeLabel;
    E_ActPlan2: TOnMemo;
    E_Detplan2: TOnMemo;
    E_TgPoint2: TOnMemo;
    OnDBGrid2: TOnDBGrid;
    B_Add2: TPeJeonOutLookBtn;
    B_Save2: TPeJeonOutLookBtn;
    B_del2: TPeJeonOutLookBtn;
    B_Cancel2: TPeJeonOutLookBtn;
    E_Actno: TOnEdit;
    Q_plan1: TTMaxDataSet;
    DataSource1: TDataSource;
    Q_plan2: TTMaxDataSet;
    DataSource2: TDataSource;
    L_Label: TOnShapeLabel;
    procedure B_Cancel1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure B_Add1Click(Sender: TObject);
    procedure B_Save1Click(Sender: TObject);
    procedure B_del1Click(Sender: TObject);
    procedure OnDBGrid1DblClick(Sender: TObject);
    procedure OnDBGrid2DblClick(Sender: TObject);
    procedure E_ActPlan1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure E_ActPlan1Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    empno    : String;   // 자기평가자 사번
    procedure Plan_data;
    procedure MemoClear1;
    procedure MemoClear2;
    procedure Edit_Enabled(Ttag : integer; TFlag : Boolean);
  end;


var
  SubForm2: TSubForm2;

implementation
{$R *.DFM}
uses  HMainForm;

{------------------------------- Main ----------------------------------}
procedure TSubForm2.FormShow(Sender: TObject);
var
  ParamVariant: String;
begin
  Application.ProcessMessages;
  L_Label.LabelCaption := '';
  Plan_data;
  Edit_Enabled(1,False);
  Edit_Enabled(2,False);
end;

procedure TSubForm2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin

end;

{------------------------------- USER FUNCTION ----------------------------------}

procedure TSubForm2.Plan_data;
var
     ParamVariant: String;
begin
     with  Q_Plan1  do
     begin
          ParamVariant := 'select Gubun, ACTNO, ActPlan, Detplan, TgPoint  ' +
                          '  from peAct2mas a                              ' +
                   Format(' WHERE rabasyy = ''%s'' and A.EMPNO   = ''%s''  ',[FM_Main.LRabasyy,FM_Main.Ed_empno.Text]) +
                          '   and gubun   = 1                              ' +
                          ' order by Gubun, ACTNO                          ';
          Close;
          ServiceName := 'HINSA_select3';
          ClearFieldInfo;
          AddField('GUBUN'      , ftString    ,  2000  );
          AddField('ACTNO'      , ftString    ,  2000  );
          AddField('ACTPLAN'    , ftString    ,  2000  );
          AddField('DETPLAN'    , ftString    ,  2000  );
          AddField('TGPOINT'    , ftString    ,  2000  );
          ClearParamInfo;
          SQL.Text := ParamVariant;
          Open;
     end;

     with  Q_Plan2  do
     begin
          ParamVariant := 'select Gubun, ACTNO, ActPlan, Detplan, TgPoint  ' +
                          '  from peAct2mas a                              ' +
                   Format(' WHERE rabasyy = ''%s'' and A.EMPNO   = ''%s''  ',[FM_Main.LRabasyy,FM_Main.Ed_empno.Text]) +
                          '   and gubun   = 2                              ' +
                          ' order by Gubun, ACTNO                          ';
          Close;
          ServiceName := 'HINSA_select3';
          ClearFieldInfo;
          AddField('GUBUN'      , ftString    ,  2000  );
          AddField('ACTNO'      , ftString    ,  2000  );
          AddField('ACTPLAN'    , ftString    ,  2000  );
          AddField('DETPLAN'    , ftString    ,  2000  );
          AddField('TGPOINT'    , ftString    ,  2000  );
          ClearParamInfo;
          SQL.Text := ParamVariant;
          Open;
     end;
end;

{------------------------------버튼클릭---------------------------------}
procedure TSubForm2.B_Cancel1Click(Sender: TObject);
begin
     E_Actno.Text      := '';
     MemoClear1;
     Edit_Enabled(1,False);

     MemoClear2;
     Edit_Enabled(2,False);

     Plan_data;
end;

procedure TSubForm2.MemoClear1;
begin
     E_ActPlan1.Lines.Clear;
     E_Detplan1.Lines.Clear;
     E_TgPoint1.Lines.Clear;
end;

procedure TSubForm2.MemoClear2;
begin
     E_ActPlan2.Lines.Clear;
     E_Detplan2.Lines.Clear;
     E_TgPoint2.Lines.Clear;
end;

{------------------------------ Event ---------------------------------}
procedure TSubForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//    Action := cafree;
end;

procedure TSubForm2.Edit_Enabled(Ttag : integer; TFlag : Boolean);
begin
     case Ttag of
          1 : begin
                   E_Actno.Enabled      := TFlag;
                   E_ActPlan1.Enabled   := TFlag;
                   E_Detplan1.Enabled   := TFlag;
                   E_TgPoint1.Enabled   := TFlag;
                   B_save1.Enabled      := TFlag;
                   B_del1.Enabled       := TFlag;
                   if (FM_Main.LRvalConyn = 'Y') then
                   begin
                        E_ActPlan1.ReadOnly  := True;
                        E_Detplan1.ReadOnly  := True;
                        E_TgPoint1.ReadOnly  := True;
                        B_Add1.Enabled       := False;
                        B_save1.Enabled      := False;
                        B_del1.Enabled       := False;
                   end
                   else
                   begin
                        E_ActPlan1.ReadOnly  := False;
                        E_Detplan1.ReadOnly  := False;
                        E_TgPoint1.ReadOnly  := False;
                        B_Add1.Enabled       := not TFlag;
                   end;
              end;
          2 : begin
                   E_Actno.Enabled      := TFlag;
                   E_ActPlan2.Enabled   := TFlag;
                   E_Detplan2.Enabled   := TFlag;
                   E_TgPoint2.Enabled   := TFlag;
                   B_save2.Enabled      := TFlag;
                   B_del2.Enabled       := TFlag;
                   if (FM_Main.LRvalConyn = 'Y') then
                   begin
                        E_ActPlan2.ReadOnly  := True;
                        E_Detplan2.ReadOnly  := True;
                        E_TgPoint2.ReadOnly  := True;
                        B_Add2.Enabled       := False;
                        B_save2.Enabled      := False;
                        B_del2.Enabled       := False;
                   end
                   else
                   begin
                        E_ActPlan2.ReadOnly  := False;
                        E_Detplan2.ReadOnly  := False;
                        E_TgPoint2.ReadOnly  := False;
                        B_Add2.Enabled       := not TFlag;
                   end;
              end;
     end;
end;

procedure TSubForm2.B_Add1Click(Sender: TObject);
begin
     B_cancel1Click(Sender);
     case TComponent(Sender).Tag of
          1,2 :
              begin
                   with FM_Main.TMaxDataSet_HInsa do
                   begin
                        SQL.Clear;
                        SQL.Text := format('select Count(ACTNO) SEL_DATA from peAct2mas '+
                                           ' where rabasyy   =''%s''                    '+
                                           '   and empno     =''%s''                    '+
                                           '   and gubun     =''%d''                    ',
                                           [FM_Main.LRabasyy, Fm_Main.ED_empno.text,TComponent(Sender).Tag]);
                        Close;
                        ServiceName := 'PED0000A_common';
                        ClearFieldInfo;
                        AddField('SEL_DATA', ftString, 100);
                        Open;
                        if  FM_Main.TMaxDataSet_HInsa.FieldByName('SEL_DATA').AsString = '7' then
                        begin
                             case TComponent(Sender).Tag of
                                  1: MessageDlg('솔선수범의 실천계획은 7개까지만 등록이 가능합니다.', mtWarning, [mbOK], 0);
                                  2: MessageDlg('구성원L/H/C의 실천 계획은 7개까지만 등록이 가능합니다.', mtWarning, [mbOK], 0);
                             end;
                             System.Exit;
                        end;
                   end;

                   with FM_Main.TMaxDataSet_HInsa do
                   begin
                        SQL.Clear;
                        SQL.Text := format('select nvl(max(ACTNO),0)+1 SEL_DATA from peAct2mas '+
                                           ' where rabasyy   =''%s''                           '+
                                           '   and empno     =''%s''                           '+
                                           '   and gubun     =''%d''                           ',
                                            [FM_Main.LRabasyy, Fm_Main.ED_empno.text,TComponent(Sender).Tag]);
                        Close;
                        ServiceName := 'PED0000A_common';
                        ClearFieldInfo;
                        AddField('SEL_DATA', ftString, 100);
                        Open;
                        E_Actno.text := FM_Main.TMaxDataSet_HInsa.Fields[0].AsString;
                   end;
                   Edit_Enabled(TComponent(Sender).Tag,True);
                   case TComponent(Sender).Tag of
                        1: E_ActPlan1.SetFocus;
                        2: E_ActPlan2.SetFocus;
                   end;
              end;
     end;
end;

procedure TSubForm2.B_Save1Click(Sender: TObject);
var  Flag : integer;
begin

     case TComponent(Sender).Tag of
          1,2 :
              begin
                   if  trim(E_Actno.text) = '' then
                   begin
                        MessageDlg('순번이 없습니다.' +#13 + '확인 후 다시입력하십시오.',mtError,[mbOK],0);
                        Exit;
                   end;

                   if  ((TComponent(Sender).Tag = 1) And (trim(E_ActPlan1.text) = '')) or
                       ((TComponent(Sender).Tag = 2) And (trim(E_ActPlan2.text) = '')) then
                   begin
                        MessageDlg('실천 계획이 없습니다.' +#13 + '확인 후 다시 입력하십시오.',mtError,[mbOK],0);
                        Exit;
                   end;

                   if  ((TComponent(Sender).Tag = 1) And (trim(E_Detplan1.text) = '')) or
                       ((TComponent(Sender).Tag = 2) And (trim(E_Detplan2.text) = ''))then
                   begin
                        MessageDlg('세부 실행 방법이 없습니다.' +#13 + '확인 후 다시 입력하십시오.',mtError,[mbOK],0);
                        Exit;
                   end;

                   with FM_Main.TMaxDataSet_HInsa do
                   begin
                        SQL.Clear;
                        SQL.Text := format('select count(*) SEL_DATA from peAct2mas                        '+
                                           ' where rabasyy   =''%s''                                       '+
                                           '   and empno     =''%s''                                       '+
                                           '   and gubun     =''%d''                                       '+
                                           '   and ACTNO     ='+ E_Actno.text +'                           ',
                                           [Fm_Main.LRabasyy, Fm_Main.ED_empno.text, TComponent(Sender).Tag]);
                        Close;
                        ServiceName := 'PED0000A_common';
                        ClearFieldInfo;
                        AddField('SEL_DATA', ftInteger, 100);
                        Open;
                        Flag        := FM_Main.TMaxDataSet_HInsa.FieldByName('SEL_DATA').AsInteger;
                   end;

                   if  Flag = 0 then
                   begin
                        with FM_Main.TMaxDML_HInsa do
                        begin
                             ServiceName := 'PEA1060A_dml';
                             Close;
                             Sql.Clear;
                             SQL.Add('insert into peAct2mas                               ');
                             SQL.Add('       (rabasyy,  empno,     gubun,    ACTNO,       ');
                             SQL.Add('        ActPlan,  Detplan,   TgPoint,               ');
                             SQL.Add('        Writeemp, Writetime                       ) ');
                             SQL.Add('Values ('''+ Fm_Main.Lrabasyy                +''',  ');
                             SQL.Add('        '''+ Fm_Main.Ed_empno.Text           +''',  ');
                             SQL.Add('        '''+ inttoStr(TComponent(Sender).Tag)+''',  ');
                             SQL.Add('        '  + E_Actno.Text                    +  ',  ');
                             if TComponent(Sender).Tag = 1 then
                             begin
                                  SQL.Add('   '''+ E_ActPlan1.Text  +''',                 ');
                                  SQL.Add('   '''+ E_Detplan1.Text  +''',                 ');
                                  SQL.Add('   '''+ E_TgPoint1.Text  +''',                 ');
                             end
                             else
                             if TComponent(Sender).Tag = 2 then
                             begin
                                  SQL.Add('   '''+ E_ActPlan2.Text  +''',                 ');
                                  SQL.Add('   '''+ E_Detplan2.Text  +''',                 ');
                                  SQL.Add('   '''+ E_TgPoint2.Text  +''',                 ');
                             end;
                             SQL.Add('        '''+ Fm_Main.Pempno   +''',                 ');
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
                             SQL.Add('    Update peAct2mas                                              ');
                             if TComponent(Sender).Tag = 1 then
                             begin
                                  SQL.Add('  Set ActPlan   = '''+ E_ActPlan1.Text                 +''', ');
                                  SQL.Add('      Detplan   = '''+ E_Detplan1.Text                 +''', ');
                                  SQL.Add('      TgPoint   = '''+ E_TgPoint1.Text                 +''', ');
                             end
                             else
                             if TComponent(Sender).Tag = 2 then
                             begin
                                  SQL.Add('  Set ActPlan   = '''+ E_ActPlan2.Text                 +''', ');
                                  SQL.Add('      Detplan   = '''+ E_Detplan2.Text                 +''', ');
                                  SQL.Add('      TgPoint   = '''+ E_TgPoint2.Text                 +''', ');
                             end;
                             SQL.Add('           Writeemp  = '''+ Fm_Main.Pempno                  +''', ');
                             SQL.Add('           Writetime = to_char(sysdate,''YYYYMMDDHHMISS'')        ');
                             SQL.Add('     WHERE rabasyy   = '''+ Fm_Main.LRabasyy                +'''  ');
                             SQL.Add('       AND empno     = '''+ Fm_Main.Ed_empno.Text           +'''  ');
                             SQL.Add('       AND gubun     = '''+ inttoStr(TComponent(Sender).Tag)+'''  ');
                             SQL.Add('       AND ACTNO     = '  + E_Actno.Text                    +  '  ');
                             Execute;
                        end;
                   end;
                   MessageDlg('성공적으로 저장하였습니다.', mtInformation, [mbOK], 0);
                   Plan_data;
                   B_cancel1Click(Sender);
              end;
     end;
end;

procedure TSubForm2.B_del1Click(Sender: TObject);
begin
     case TComponent(Sender).Tag of
         1,2 :
             begin
                   if  trim(E_Actno.text) = '' then
                   begin
                        MessageDlg('삭제할 자료가 없습니다.' +#13 + '확인 후 다시입력하십시오.',mtError,[mbOK],0);
                        Exit;
                   end;

                   if MessageBox(handle,PChar('해당 실천과제를 삭제하시겠습니까?'), '확 인',  MB_YESNO or MB_DEFBUTTON2) <> IDYES then
                   begin
                        system.Exit;
                   end;

                   with FM_Main.TMaxDML_HInsa do
                   begin
                        SQL.Clear;

                        SQL.Text := format('delete from peAct2mas                       '+
                                           ' where rabasyy   = ''%s''                   '+
                                           '   and empno     =''%s''                    '+
                                           '   and gubun     =''%d''                    '+
                                           '   and ACTNO     = '+E_Actno.text+'         ',
                                           [Fm_Main.LRabasyy, Fm_Main.ED_empno.text, TComponent(Sender).Tag]);
                        Close;
                        ServiceName := 'PEA1060A_dml';
                        Execute;
                   end;
                   MessageDlg('해당 실천과제를 삭제하였습니다.', mtInformation, [mbOK], 0);
             end;
     end;
     B_cancel1Click(Sender);
end;

procedure TSubForm2.OnDBGrid1DblClick(Sender: TObject);
begin
     MemoClear2;
     Edit_Enabled(2,False);

     if  (not Q_PLAN1.Eof) And  (Fm_Main.Le1valconyn <> 'Y') then //And (Fm_Main.Pempno = Fm_Main.Ed_empno.Text) then
     begin
          E_Actno.Text          := Q_PLAN1.fieldbyname('ACTNO'  ).AsString;
          E_ActPlan1.Text       := Q_PLAN1.fieldbyname('ActPlan').AsString;
          E_Detplan1.Text       := Q_PLAN1.fieldbyname('Detplan').AsString;
          E_TgPoint1.Text       := Q_PLAN1.fieldbyname('TgPoint').AsString;
          Edit_Enabled(1,True);
     end;
end;

procedure TSubForm2.OnDBGrid2DblClick(Sender: TObject);
begin
     MemoClear1;
     Edit_Enabled(1,False);

     if  (not Q_PLAN2.Eof) And  (Fm_Main.Le1valconyn <> 'Y') then //And (Fm_Main.Pempno = Fm_Main.Ed_empno.Text) then
     begin
          E_Actno.Text          := Q_PLAN2.fieldbyname('ACTNO'  ).AsString;
          E_ActPlan2.Text       := Q_PLAN2.fieldbyname('ActPlan').AsString;
          E_Detplan2.Text       := Q_PLAN2.fieldbyname('Detplan').AsString;
          E_TgPoint2.Text       := Q_PLAN2.fieldbyname('TgPoint').AsString;
          Edit_Enabled(2,True);
     end;
end;

procedure TSubForm2.E_ActPlan1KeyDown(Sender: TObject; var Key: Word;
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

procedure TSubForm2.E_ActPlan1Exit(Sender: TObject);
begin
  if  TOnMemo(Sender).lines.Count > 7  then
  begin
       MessageDlg('내용은 7줄까지만 작성가능합니다.',mtError, [mbOk],0);
       TOnMemo(Sender).SetFocus;
  end;
end;

end.
