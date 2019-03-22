unit PIC4010A3_1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  peoutlookbtn, StdCtrls, Mask, pebtnedit, PeJeonBtnDateEdit, peextcombo,
  ComCtrls, ExtCtrls, pegradpanl;

type
  TFm_PIC4010A3_1 = class(TForm)
    E_newdate: TPePanelBtnDateEdit;
    EC_rabasdate: TPeJeonPanelComboBox;
    PeJeonGrdPanel1: TPeJeonGrdPanel;
    Bt_Gadd: TPeJeonOutLookBtn;
    Bt_Cancel: TPeJeonOutLookBtn;
    Label1: TLabel;
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
  Fm_PIC4010A3_1: TFm_PIC4010A3_1;

implementation

uses Fm_DM, PIC4010A1;

 

{$R *.DFM}


procedure TFm_PIC4010A3_1.Bt_GaddClick(Sender: TObject);
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
    sql.add(' from   pimraduscr                                               ');
    sql.add(' where  rabasdate = :rabasdate                                   ');
    ParamByName('rabasdate').AsString := EC_rabasdate.Text;
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
    sql.add(' from   pimraduscr                                               ');
    sql.add(' where  rabasdate = :rabasdate                                   ');
    ParamByName('rabasdate').AsString := E_newdate.Text;
    Open;
    if not EOF then
    begin
      E_newdate.Text := '';
      MessageDlg('기간별 배점 기준화일에 이미 등록된 일자입니다.', mtError, [mbOK], 0);
      exit;
    end;
  end;
//
  with DM.Query_exec do
  begin
    Close;
    sql.Clear;
    sql.add(' insert into pimraduscr                                             ');
    sql.add(' ( RABASDATE, PAYCL, DUMMFR, DUMMTO, DUSCORE, WRITEEMP, WRITETIME ) ');
    sql.Add(' select :newdate                                                    ');
    sql.Add('        ,paycl                                                      ');
    sql.Add('        ,dummfr                                                     ');
    sql.Add('        ,dummto                                                     ');
    sql.Add('        ,duscore                                                    ');
    sql.Add('        ,:writeemp                                                  ');
    sql.Add('        ,:writetime                                                 ');
    sql.add(' from   pimraduscr                                                  ');
    sql.add(' where  rabasdate  = :rabasdate                                     ');
//
    ParamByName('rabasdate').AsString := EC_rabasdate.Text;
    ParamByName('newdate').AsString  := E_newdate.Text;
    ParamByname('writeemp').AsString  := Fm_PIC4010A1.pEmpno;
    ParamByname('writetime').AsString := Fm_PIC4010A1.pe_Date.SaveDate;
  end;
//
  DM.Database1.StartTransaction;
  try
     DM.Query_exec.ExecSQL;
  except
     DM.Database1.Rollback;
     Messagebox(0, '재급기간별 배점 항목을 일괄등록하는데 실패하였습니다...', '알림', MB_OK or $0020);
     Exit;
  end;
  DM.Database1.Commit;

  Messagebox(0, '재급기간별 배점 일괄등록 완료!!!', '알림', MB_OK or $0020);
  Fm_PIC4010A1.St_Help.Panels[0].Text := '재급기간별 배점 항목을 일괄등록하였습니다...';
//
end;

procedure TFm_PIC4010A3_1.Bt_CancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFm_PIC4010A3_1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFm_PIC4010A3_1.FormShow(Sender: TObject);
begin
  with DM.Query_select do
  begin
       close;
       sql.clear;
       sql.add(' select distinct rabasdate                                    ');
       sql.add(' from   pimrabas                                              ');
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
       sql.add(' from  pimrabas                                               ');
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
