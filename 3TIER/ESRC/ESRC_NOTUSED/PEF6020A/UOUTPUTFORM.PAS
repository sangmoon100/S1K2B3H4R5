unit UOutputForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, OnFocusButton, Mask, ExtCtrls, OnEditBaseCtrl, OnEditStdCtrl,
  OnEditBtnCtrl, OnEditMdate,Db, Tmax_DataSetText, TmaxFunc;

type
  TOutputForm = class(TForm)
    Panel1: TPanel;
    Label7: TLabel;
    Panel2: TPanel;
    OutputBtn: TOnFocusButton;
    ExitBtn: TOnFocusButton;
    E_WorkDatefr: TOnDateEdit;
    E_WorkDateto: TOnDateEdit;
    procedure ExitBtnClick(Sender: TObject);
    procedure OutputBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  OutputForm: TOutputForm;

implementation

uses UDiaryForm, UPrintForm;

{$R *.DFM}

procedure TOutputForm.ExitBtnClick(Sender: TObject);
begin
  close;
end;

procedure TOutputForm.OutputBtnClick(Sender: TObject);
var
  sSql : String;
  Workdatefr, workdateto : String;
begin
  Workdatefr := copy(E_Workdatefr.Text,1,4) + copy(E_Workdatefr.Text,6,2) + copy(E_Workdatefr.Text,9,2);
  Workdateto := copy(E_Workdateto.Text,1,4) + copy(E_Workdateto.Text,6,2) + copy(E_Workdateto.Text,9,2);

  sSQL := 'SELECT WORKDATE, EMPNO, KORNAME, E1EMPNO, E1KORNAME          '+
          '  FROM PEINTOJT a                                            '+
          ' WHERE empno      = '''+ DiaryForm.ed_empno.Text +'''        '+
          '   and workdate  >= '''+ Workdatefr              +'''        '+
          '   and workdate  <= '''+ Workdateto              +'''        '+
          '   and E1Conyn    = ''Y''                                    '+
          ' Order by WORKDATE                                           ';
  With DiaryForm.TCDS do
  begin
       Close;
       ClearFieldInfo;
       AddField('WORKDATE'  , ftString,  100 );
       AddField('EMPNO'     , ftString,  100 );
       AddField('KORNAME'   , ftString,  100 );
       AddField('E1EMPNO'   , ftString,  100 );
       AddField('E1KORNAME' , ftString,  100 );
       Sql.Clear;
       Sql.Text := sSQL;
       ServiceName := 'HINSA_select';
       Open;
       if DiaryForm.TCDS.RecordCount > 0 then
       begin
            sSQL :=  'SELECT WORKDATE, OPINION1, OPINION2, OPINION3, E1VALVIEW '+
                     '  FROM PEINTOJT a                                        '+
                     ' WHERE empno      = '''+DiaryForm.ed_empno.Text  +'''    '+
                     '   and workdate  >= '''+ Workdatefr              +'''    '+
                     '   and workdate  <= '''+ Workdateto              +'''    '+
                     '   and E1Conyn    = ''Y''                                '+
                     ' Order by WORKDATE                                       ';
            with DiaryForm.TDS1 do
            begin
                 Close;
                 ServiceName := 'HINSA_select3';
                 ClearFieldInfo;
                 AddField('WORKDATE'   , ftString, 2000);
                 AddField('OPINION1'   , ftString, 2000);
                 AddField('OPINION2'   , ftString, 2000);
                 AddField('OPINION3'   , ftString, 2000);
                 AddField('E1VALVIEW'  , ftString, 2000);
                 ClearParamInfo;
                 SQL.Text := sSQL;
                 Open;
            end;
       end;
  end;

  if DiaryForm.TCDS.recordcount < 1 then
  begin
       MessageDlg('결재 확인된 업무일지가 없습니다.',mtError,[mbOK],0);
       exit;
  end;

  PrintForm.QuickRep1.Preview;
end;

end.
