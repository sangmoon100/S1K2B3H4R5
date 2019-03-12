unit USubForm3;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, OnEditBaseCtrl, OnEditStdCtrl, OnEditMemo, StdCtrls,
  OnShapeLabel, peoutlookbtn, Db, Tmax_DataSetText;

type
  TSubForm3 = class(TForm)
    Panel1: TPanel;
    OnShapeLabel57: TOnShapeLabel;
    Shape7: TShape;
    OnShapeLabel65: TOnShapeLabel;
    OnShapeLabel61: TOnShapeLabel;
    E_Rcomment: TOnMemo;
    E_E1comment: TOnMemo;
    L_PlanTitle: TOnShapeLabel;
    Q_plan1: TTMaxDataSet;
    B_Save1: TPeJeonOutLookBtn;
    procedure FormShow(Sender: TObject);
    procedure B_Save1Click(Sender: TObject);
    procedure E_RcommentClick(Sender: TObject);
    procedure E_RcommentKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure E_RcommentExit(Sender: TObject);
  private
    { Private declarations }
    procedure Plan_data;
  public
    { Public declarations }
  end;

var
  SubForm3: TSubForm3;

implementation

uses HMainForm;

{$R *.DFM}

procedure TSubForm3.FormShow(Sender: TObject);
begin
  L_PlanTitle.ValueCaption :='  '+FM_Main.Rabasname+'별 Action Contract에 대한 의견을 등록합니다.';

  Plan_data;

  E_Rcomment.Enabled  := False;
  E_E1comment.Enabled := False;
  B_save1.Enabled     := False;

  if  (FM_Main.LRvalconyn  <> 'Y') and (FM_Main.E_ChangeEmp.Text <> FM_Main.Le1empno) then //팀장 로긴시.
  begin
       E_Rcomment.Enabled := True;
       B_save1.Enabled    := True;
  end;

  if  (FM_Main.LE1valconyn <> 'Y') and (FM_Main.E_ChangeEmp.Text =  FM_Main.Le1empno) then //상사 로긴시.
  begin
       E_E1comment.Enabled := True;
       B_save1.Enabled     := True;
  end;
end;

{------------------------------- USER FUNCTION ----------------------------------}
procedure TSubForm3.Plan_data;
begin
  with  FM_Main.Q_Subject do
  begin
       Close;
       ServiceName := 'HINSA_select3';
       ClearFieldInfo;
       AddField('Empno'      , ftString,  2000);
       AddField('Rvalconyn'  , ftString,  2000);
       AddField('Rcomment'   , ftString,  2000);
       AddField('E1valconyn' , ftString,  2000);
       AddField('E1comment'  , ftString,  2000);

       SQL.Text := 'Select Empno, Rvalconyn, Rcomment, E1valconyn, E1comment '+
                   '  From peactfile a                                       '+
                   ' WHERE RabasYM  = '''+ FM_Main.LRabasYM     +'''         '+
                   '   And A.EMPNO  = '''+ FM_Main.Ed_empno.Text+'''         ';
       Open;

       if RecordCount < 1 then
       begin
            FM_Main.SB_Help.Panels[1].Text := FM_Main.LRabasYY+'년'+FM_Main.LRabasMM+FM_Main.Rabasname+'의 의견등록내역이 없습니다.';
            Exit;
       end;
       E_Rcomment.Text  := FieldByName('Rcomment').AsString;
       if  ((FM_Main.LGubun = 1) And (FM_Main.Le1valconyn ='Y')) or (FM_Main.LGubun = 2) then
           E_E1comment.Text := FieldByName('E1comment').AsString;
  end;
end;

procedure TSubForm3.B_Save1Click(Sender: TObject);
begin
  if Pos('(Max 1000Byte)',E_Rcomment.Text)  > 0 then E_Rcomment.Text  := '';
  if Pos('(Max 1000Byte)',E_E1comment.Text) > 0 then E_E1comment.Text := '';

  if  (FM_Main.LGubun = 1) and (trim(E_Rcomment.text) = '') then
  begin
       MessageDlg('Self Reflection 내용이 없습니다.' +#13 + '확인 후 다시입력하십시오.',mtError,[mbOK],0);
       Exit;
  end;
  if  (FM_Main.LGubun = 2) and (trim(E_E1comment.text) = '') then
  begin
       MessageDlg('상사 Comment 내용이 없습니다.' +#13 + '확인 후 다시 입력하십시오.',mtError,[mbOK],0);
       Exit;
  end;

  ////////////테이블에 Filename 해당월/분기에 저장.
  FM_Main.Csel_SQL  := 'SELECT 1 FROM peactfile                           '+
                       ' WHERE RabasYM = '''+ FM_Main.LRabasYM       +''' '+
                       '   And Empno   = '''+ Fm_Main.ED_empno.Text  +''' ';
  Fm_Main.Csel_Open;

  if Fm_Main.DBcommon.RecordCount = 0 then
  begin
       Fm_Main.Cupd_SQL  := 'Insert into peactfile (RabasYM, Empno, Rcomment, '+
                            '                       Writeemp, Writetime )     '+
                            ' Values (                                        '+
                            '          '''+  FM_Main.LRabasYM         +''' ,  '+
                            '          '''+  Fm_Main.ED_empno.Text    +''' ,  '+
                            '          '''+  trim(E_Rcomment.text)    +''' ,  '+
                            '          '''+  Fm_Main.pempno           +''' ,  '+
                            '          TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'') )';
  end
  else
  begin
       Fm_Main.Cupd_SQL  := 'update peactfile                                        '+
                            '   set Rcomment  = '''+ trim(E_Rcomment.text)  +''',    '+
                            '       E1comment = '''+ trim(E_E1comment.text) +''',    '+
                            '       Writeemp  = '''+ Fm_Main.pempno  +''',           '+
                            '       Writetime = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'')'+
                            ' WHERE RabasYM   = '''+ FM_Main.LRabasYM        +'''    '+
                            '   AND empno     = '''+ Fm_Main.ED_empno.Text   +'''    ';
  end;

  Fm_Main.Cupd_Exec;            // edit1.text := FM_Main.TMaxDML_HInsa.sql.text;

  if Fm_Main.Cupd_ret then MessageDlg('성공적으로 저장하였습니다.', mtInformation, [mbOK], 0);
  Fm_Main.LE1Comment := trim(E_E1comment.text);
  Plan_data;
end;

procedure TSubForm3.E_RcommentClick(Sender: TObject);
begin
  if Pos('(Max 1000Byte)',TOnMemo(Sender).text) > 0 then TOnMemo(Sender).text := '';
end;

procedure TSubForm3.E_RcommentKeyDown(Sender: TObject; var Key: Word;
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

procedure TSubForm3.E_RcommentExit(Sender: TObject);
begin
  if  TOnMemo(Sender).lines.Count > 16  then
  begin
       MessageDlg('내용은 16줄까지만 작성가능합니다.',mtError, [mbOk],0);
       TOnMemo(Sender).SetFocus;
  end;
end;

end.
