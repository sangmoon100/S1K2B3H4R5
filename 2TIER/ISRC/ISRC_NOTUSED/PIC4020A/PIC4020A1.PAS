//미사용
unit pic4020a1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DBTables, peoutlookbtn, pegradpanl, ComCtrls, StdCtrls, Mask,
  pebtnedit, ExtCtrls,  PeJeonLabel ,pass, Gauges;

type
  errFile = record
    log   : string[200];
  end;

type
  TFm_SubForm1 = class(TForm)
    PeJeonGrdPanel1: TPeJeonGrdPanel;
    POB_run: TPeJeonOutLookBtn;
    Label2: TLabel;
    PPE_rapayclfr: TPePanelEdit;
    PPE_rapayclto: TPePanelEdit;
    PPE_radumonth: TPePanelEdit;
    PPE_cardumonth: TPePanelEdit;
    Panel3: TPeJeonLabel;
    Gr: TProgressBar;
    PPE_rabasdate: TPePanelEdit;
    PPE_basforscore: TPePanelEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure POB_runClick(Sender: TObject);
  private
    { Private declarations }
    Cstart    :Boolean;

    Function  fnCheckDataExist:Boolean;
    function  fnDeleteOldData : Boolean;
    function  fnCreateBackup: Boolean;
  public
    { Public declarations }
  end;

var
  Fm_SubForm1: TFm_SubForm1;
  ErrorHelp : array [0..255] of char;
  ED         : errFile;
  Ef         : file of errFile;
  HomeDir            :string;

implementation

uses
  peMainForm, peDm;

{$R *.DFM}

procedure TFm_SubForm1.FormCreate(Sender: TObject);
begin
    Cstart := True;
end;

procedure TFm_SubForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := caFree;
end;

procedure TFm_SubForm1.FormShow(Sender: TObject);
begin
    if CStart then
    begin
        CStart  := not CStart;
        HomeDir := HomeDirOpen;
        MainForm.St_Help.Panels[0].Text := '대상자 추출을 위한 기준을 읽고 있습니다...';
        Application.ProcessMessages;

        MainForm.fzSetBaseDates;
        PPE_rabasdate.Text    := MainForm.sg_rabasdate;
        PPE_rapayclfr.Text    := MainForm.sg_payclfr;
        PPE_rapayclto.Text    := MainForm.sg_payclto;

        PPE_radumonth.Text    := MainForm.sg_radumonth;
        PPE_cardumonth.Text   := MainForm.sg_cardumonth;
        PPE_basforscore.Text  := MainForm.sg_basforscore;


    end; // end of if Cstart
    MainForm.St_Help.Panels[0].Text := '';
end;

procedure TFm_SubForm1.POB_runClick(Sender: TObject);
begin
  workgubun := '승격대상자추출';

  if (trim(PPE_rabasdate.Text) = '') or (Length(PPE_rabasdate.Text) <> 8) then
  begin
      messagebox(handle,'승격기준일을 확인하십시요','에러',MB_OK or $0020);
      system.exit;
  end;
 {
  if trim(PPE_radumonth.Text) = '' then
  begin
      messagebox(handle,'승격대상자 재급월수를 확인하십시요','에러',MB_OK or $0020);
      system.exit;
  end;
  if trim(PPE_cardumonth.Text) = '' then
  begin
      messagebox(handle,' 경력입사자 근무월수를 확인하십시요','에러',MB_OK or $0020);
      system.exit;
  end;
  if trim(PPE_basforscore.Text) = '' then
  begin
      messagebox(handle,' 부장 외국어기준점수를 확인하십시요','에러',MB_OK or $0020);
      system.exit;
  end;
 }

  if (trim(PPE_rapayclfr.Text) = '') or (trim(PPE_rapayclto.Text) = '')then
  begin
      messagebox(handle,' 승격대상자 직급을 확인하십시요','에러',MB_OK or $0020);
      system.exit;
  end;

  if fnCheckDataExist then
  begin
      if messagebox(handle,pChar('현 승격기준일은 ['+
                                   Copy(PPE_rabasdate.Text,1,4)+'/'+
                                   Copy(PPE_rabasdate.Text,5,2)+'/'+
                                   Copy(PPE_rabasdate.Text,7,2)+']입니다.'+#13+#13+
                                 '기준일에 해당하는 승격자료가 삭제됩니다.'+#13+#13+
                                 '계속하시겠습니까?'),'알림',MB_YESNO + MB_DEFBUTTON2) <> IDYES then

          system.exit;
  end;
         
  MainForm.St_Help.Panels[0].Text := '작업중입니다..';

  {
  if not fnCreateBackup then
      system.exit;
  if not fnDeleteOlddata then
      system.exit;
  }


  // 승격 대상자 추출.
  MainForm.Gr := Gr;

  if not MainForm.fnBatchPimupmas then
      system.exit;


  messagebox(handle,'작업완료 !!!','작업성공',MB_OK or $0020);
  MainForm.St_Help.Panels[0].Text := '작업이 완료되었습니다.';

  Gr.Position := 0;


  Application.ProcessMessages;

end;

function TFm_SubForm1.fnDeleteOldData: Boolean;
begin
    Result := False;

  Try
    with Dm.Q_Exec do
    begin
        close;
        sql.clear;
        sql.Text := 'DELETE FROM pimramas WHERE rabasdate = :p_rabasdate ';
        ParamByName('p_rabasdate').AsString := PPE_rabasdate.Text;
        ExecSql;
    end;
    result := True;

  EXCEPT ON E : EDataBaseError DO
    begin
        MessageBox(handle,StrPcopy(ErrorHelp,E.Message),'에  러',MB_OK or $0010);
        MainForm.St_Help.Panels[0].Text := '';
        System.exit;
    end;
  End;
end;

function TFm_SubForm1.fnCreateBackup: Boolean;
begin
    Result := False;

    with Dm.Q_Exec do
    begin
      TRY
        close;
        sql.clear;
        sql.Text := 'SELECT COUNT(*) cnt FROM user_tables     '+
                    '  WHERE table_name = ''BACKUP_PIMRAMAS'' ';
        Open;

        if FieldByName('cnt').Asinteger > 0 then
        begin
            close;
            sql.clear;
            sql.Text := 'DROP TABLE BACKUP_PIMRAMAS';
            ExecSql;
        end;
  
        Close;
        sql.clear;
        sql.Text := 'CREATE TABLE BACKUP_PIMRAMAS                                            '+
                    ' TABLESPACE  insa_data3                                                 '+
                    ' STORAGE(INITIAL 1M NEXT 1M MINEXTENTS 1 MAXEXTENTS 121 PCTINCREASE 1)  '+
                    ' AS SELECT * FROM pimramas                                              ';
        ExecSql;

      EXCEPT ON E : EDataBaseError DO
        begin
            MessageBox(0,StrPcopy(ErrorHelp,E.Message),'에  러',MB_OK or $0010);
            MainForm.St_Help.Panels[0].Text := '';
            System.exit;
        end;
      END;
    end;

    Result := True;
end;

function TFm_SubForm1.fnCheckDataExist:Boolean;
begin
    result := False;
    with Dm.Q_Exec do begin
        close;
        sql.clear;
        sql.Text := 'SELECT COUNT(*) cnt FROM pimupmas   '+
                    '  WHERE rabasdate = :p_rabasdate    ';
        ParamByName('p_rabasdate').AsString := PPE_rabasdate.Text;
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
