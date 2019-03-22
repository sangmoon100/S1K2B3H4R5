//미사용
unit pic4020a3;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DBTables, peoutlookbtn, pegradpanl, ComCtrls, StdCtrls, Mask,
  pebtnedit, ExtCtrls,  PeJeonLabel ,pass, Gauges;

type
  TFm_SubForm3 = class(TForm)
    PPE_rabasdate: TPePanelEdit;
    Panel3: TPeJeonLabel;
    Gr: TProgressBar;
    PeJeonGrdPanel1: TPeJeonGrdPanel;
    POB_run: TPeJeonOutLookBtn;
    PPE_rapayclfr: TPePanelEdit;
    Label2: TLabel;
    PPE_rapayclto: TPePanelEdit;
    PPE_rabasyear: TPePanelEdit;
    PPE_pehrdate: TPePanelEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure POB_runClick(Sender: TObject);
  private
    { Private declarations }
    Function  fnCheckDataExist:Boolean;

  public
    { Public declarations }
    Start : Boolean;
  end;

var
  Fm_SubForm3: TFm_SubForm3;

implementation

uses
  peMainForm, peDm;

{$R *.DFM}

procedure TFm_SubForm3.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action := caFree;
end;

procedure TFm_SubForm3.FormCreate(Sender: TObject);
begin
    Start := True;
end;

procedure TFm_SubForm3.FormShow(Sender: TObject);
begin
   if Start then
    begin
        Start  := not Start;
        MainForm.St_Help.Panels[0].Text := '승격점수계산을 위한 기준을 읽고 있습니다...';
        Application.ProcessMessages;

        MainForm.fzSetBaseDates;
        PPE_rabasdate.Text    := MainForm.sg_rabasdate;
        PPE_rapayclfr.Text    := MainForm.sg_payclfr;
        PPE_rapayclto.Text    := MainForm.sg_payclto;
        PPE_rabasyear.Text    := MainForm.sg_rabasyear;
        PPE_pehrdate.Text     := MainForm.sg_pehrdate;  

    end; // end of if Cstart
    MainForm.St_Help.Panels[0].Text := '';
end;

procedure TFm_SubForm3.POB_runClick(Sender: TObject);
begin
  if (trim(PPE_rabasdate.Text) = '') or (Length(PPE_rabasdate.Text) <> 8) then
  begin
      messagebox(handle,'승격기준일을 확인하십시요','에러',MB_OK or $0020);
      system.exit;
  end;

  if (trim(PPE_rabasyear.Text) = '') then
  begin
      messagebox(handle,'승격종합점수 기준년을 확인하십시요','에러',MB_OK or $0020);
      system.exit;
  end;

  if (trim(PPE_rapayclfr.Text) = '') or (trim(PPE_rapayclto.Text) = '')then
  begin
      messagebox(handle,' 승격대상자 직급을 확인하십시요','에러',MB_OK or $0020);
      system.exit;
  end;

  if fnCheckDataExist then
  begin
      if messagebox(handle,pChar('현 승격종합기준년 ['+
                                    Copy(PPE_rabasyear.Text,1,4) + '년] 입니다.'+#13+#13+
                                 '기준년에 해당하는 종합점수자료가 삭제됩니다.'+#13+#13+
                                 '계속하시겠습니까?'),'알림',MB_YESNO + MB_DEFBUTTON2) <> IDYES then

          system.exit;
  end;

  MainForm.St_Help.Panels[0].Text := '작업중입니다..';

  // 승격 대상자 추출.
  MainForm.Gr := Gr;

  if not MainForm.fnBatchCalc then
      system.exit;

  if not MainForm.fnBatchCalc_2 then
      system.exit;    


  messagebox(handle,'작업완료 !!!','작업성공',MB_OK or $0020);
  MainForm.St_Help.Panels[0].Text := '작업이 완료되었습니다.';

  Gr.Position := 0;

  Application.ProcessMessages;


end;

function TFm_SubForm3.fnCheckDataExist;
begin
    result := False;
    with Dm.Q_Exec do begin
        close;
        sql.clear;
        sql.Text := 'SELECT COUNT(*) cnt FROM pehevhis   '+
                    '  WHERE rabasyear = :p_rabasyear    ';
        ParamByName('p_rabasyear').AsString := PPE_rabasyear.Text;
        Open;
        if FieldByName('cnt').AsInteger > 0 then
        begin
            result := True;
        end
        else
            result := False;

        close;
    end;
end;



end.
