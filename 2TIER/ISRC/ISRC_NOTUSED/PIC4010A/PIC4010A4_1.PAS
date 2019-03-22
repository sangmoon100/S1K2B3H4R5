unit PIC4010A4_1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  peoutlookbtn, StdCtrls, Mask, pebtnedit, PeJeonBtnDateEdit, peextcombo,
  ComCtrls, ExtCtrls, pegradpanl, Buttons;

type
  TFm_PIC4010A4_1 = class(TForm)
    E_newdate: TPePanelBtnDateEdit;
    EC_rabasdate: TPeJeonPanelComboBox;
    PeJeonGrdPanel1: TPeJeonGrdPanel;
    Bt_Gadd: TPeJeonOutLookBtn;
    Bt_Cancel: TPeJeonOutLookBtn;
    Label1: TLabel;
    E_new_ragroup: TPePanelEdit;
    E_ragroup: TPePanelEdit;
    Edit1: TEdit;
    procedure Bt_GaddClick(Sender: TObject);
    procedure Bt_CancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fm_PIC4010A4_1: TFm_PIC4010A4_1;

implementation

uses Fm_DM, PIC4010A1, Codelib;



{$R *.DFM}


procedure TFm_PIC4010A4_1.Bt_GaddClick(Sender: TObject);
begin
  if (EC_rabasdate.Text = '') or (E_newdate.Text = '') then
  begin
    MessageDlg('키필드는 필수입력입니다.', mtError, [mbOK], 0);
    EC_rabasdate.SetFocus;
    Exit;
  end;

  if Length(E_newdate.Text) <> 8 then
  begin
    MessageDlg('[신규 기준일] 항목은 인사평가 수행년도 8자리입니다.', mtError, [mbOK], 0);
    E_newdate.SetFocus;
    Exit;
  end;

  if Length(E_newdate.Text) <> 8 then Exit;

  with DM.Query_exec do
  begin
    Close;
    sql.clear;
    sql.add(' select distinct rabasdate                                       ');
    sql.add(' from   pimragroup                                               ');
    sql.add(' where  rabasdate = :rabasdate                                   ');
    sql.add('   and  ragroup   = :ragroup                                     ');
    ParamByName('rabasdate').AsString := EC_rabasdate.Text;
    ParamByName('ragroup').AsString   := E_ragroup.Text;
    Open;
    if EOF and Bof then
    begin
      EC_rabasdate.Text := '';
      MessageDlg(' 대상 기준일 자료가 없습니다.', mtError, [mbOK], 0);
      exit;
    end;
  end;

  with DM.Query_exec do
  begin
    Close;
    sql.clear;
    sql.add(' select distinct rabasdate                                       ');
    sql.add(' from   pimragroup                                               ');
    sql.add(' where  rabasdate = :rabasdate                                   ');
    sql.add('   and  ragroup   = :ragroup                                     ');
    ParamByName('rabasdate').AsString := E_newdate.Text;
    ParamByName('ragroup').AsString   := E_new_ragroup.Text;
    Open;
    if not EOF then
    begin
      E_newdate.Text := '';
      MessageDlg(' 승격심사직군 화일에 이미 등록된 일자입니다.', mtError, [mbOK], 0);
      exit;
    end;
  end;

  with DM.Query_exec do
  begin
    Close;
    SQL.Clear;
    sql.add(' insert into pimragroup                                          ');
    sql.add('   (    rabasdate                                                ');
    sql.add('       ,ragroup                                             ');
    sql.add('       ,RAPAYCL                                                  ');
    sql.add('       ,RAJOBGUN                                                 ');
    sql.add('       ,EVJOBGUN                                                 ');
    sql.add('       ,EVJOBGUNNM                                               ');
    sql.add('       ,EVRATEYN                                                 ');
    sql.add('       ,RARATE1                                                  ');
    sql.add('       ,RARATE2                                                  ');
    sql.add('       ,RARATE3                                                  ');
    sql.add('       ,RARATE4                                                  ');
    sql.add('       ,RARATE5                                                  ');
    sql.add('       ,MYRARATE1                                                ');
    sql.add('       ,MYRARATE2                                                ');
    sql.add('       ,MYRARATE3                                                ');
    sql.add('       ,MYRARATE4                                                ');
    sql.add('       ,MYRARATE5                                                ');
    sql.add('       ,writeemp                                                 ');
    sql.add('       ,writetime )                                              ');
    sql.add(' select :new_date                                                ');
    sql.add('       ,:new_ragroup                                             ');
    sql.add('       ,RAPAYCL                                                  ');
    sql.add('       ,RAJOBGUN                                                 ');
    sql.add('       ,EVJOBGUN                                                 ');
    sql.add('       ,EVJOBGUNNM                                               ');
    sql.add('       ,EVRATEYN                                                 ');
    sql.add('       ,RARATE1                                                  ');
    sql.add('       ,RARATE2                                                  ');
    sql.add('       ,RARATE3                                                  ');
    sql.add('       ,RARATE4                                                  ');
    sql.add('       ,RARATE5                                                  ');
    sql.add('       ,MYRARATE1                                                ');
    sql.add('       ,MYRARATE2                                                ');
    sql.add('       ,MYRARATE3                                                ');
    sql.add('       ,MYRARATE4                                                ');
    sql.add('       ,MYRARATE5                                                ');
    sql.add('       ,:writeemp                                                ');
    sql.add('       ,:writetime                                               ');
    sql.add(' from  pimragroup                                                ');
    sql.add(' where rabasdate  = :rabasdate                                   ');
    sql.add('   and ragroup    = :ragroup                                     ');
//
    ParamByName('new_date').AsString    := E_newdate.Text;
    ParamByName('new_ragroup').AsString := E_new_ragroup.Text;
    ParamByName('rabasdate').AsString   := EC_rabasdate.Text;
    ParamByName('ragroup').AsString     := E_ragroup.Text;
    ParamByname('writeemp').AsString    := Fm_PIC4010A1.pEmpno;
    ParamByname('writetime').AsString   := Fm_PIC4010A1.pe_Date.SaveDate;
  end;
    edit1.text := DM.Query_exec.sql.text;
  DM.Database1.StartTransaction;
  try
     DM.Query_exec.ExecSQL;
  except
     DM.Database1.Rollback;
     Messagebox(0, '승격심사 그룹 항목을 등록하는데 실패하였습니다...', '알림', MB_OK or $0020);
     Exit;
  end;
  DM.Database1.Commit;

  Messagebox(0, '승격심사 그룹 일괄등록 완료!!!', '알림', MB_OK or $0020);
  Fm_PIC4010A1.St_Help.Panels[0].Text := '승격심사 그룹을 일괄 항목을 등록하였습니다...';
//
end;

procedure TFm_PIC4010A4_1.Bt_CancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFm_PIC4010A4_1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFm_PIC4010A4_1.FormShow(Sender: TObject);
begin
  with DM.Query_select do
  begin
       close;
       sql.clear;
       sql.add(' select distinct rabasdate                                    ');
       sql.add(' from   pimragroup                                            ');
       sql.add(' where  rabasdate != ''00000000''                             ');
       sql.add(' order  by                                                    ');
       sql.add('        rabasdate                                             ');
       open;
       EC_rabasdate.Items.Clear;
       While Not Eof do
       begin
             EC_rabasdate.Items.Add( FieldByName('rabasdate').AsString );
             Next;
       end;
    end;
// 단 처음 표시하는 일자및 그에 대한 Grid 자료는 value1 = '000000' , 구분, 직급, 직군 모두가 '00'인것.
  with DM.Query_select do
  begin
       close;
       sql.clear;
       sql.add(' select distinct RABASDATE                                    ');
       sql.add(' from  pimragroup                                             ');
       sql.add(' where rabasdate = ( select value1                            ');
       sql.add('                     from   pimrabas                          ');
       sql.add('                     where  rabasdate = ''00000000''          ');
       sql.add('                       and  paycl     = ''00''                ');
       sql.add('                       and  jobgun    = ''00''                ');
       sql.add('                       and  gubun     = ''00'' )              ');
       open;
       EC_rabasdate.Text := FieldByName('rabasdate').AsString;
    end;
//
end;



end.
