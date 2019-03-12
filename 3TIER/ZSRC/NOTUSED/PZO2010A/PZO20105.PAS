unit PZO20105;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  jshape, jeonPan, ExtCtrls, Shdowpnl, Grids, DBGrids, jgrid, StdCtrls,
  Mask, HanEdit, Db, Tmax_DataSetText,OnPopupEdit,
  OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl, OnFocusButton, OnGrDBGrid,
  OnDBGrid, OnTmaxPersonEdit, OnScheme, ComCtrls, OnSkinBtn, OnEditCombo,
  OnEditMdate;

type
  TComMgrForm = class(TForm)
    DataSource1: TDataSource;
    TDS1: TTMaxDataSet;
    TDS2: TTMaxDataSet;
    SF_Main: TOnSchemeForm;
    Panel5: TPanel;
    i_comname: TOnEdit;
    i_comcode: TOnEdit;
    i_useyn: TOnComboEdit;
    i_writeman: TOnEdit;
    i_writetime: TOnEdit;
    Panel6: TPanel;
    fb_close: TOnFocusButton;
    fb_insert: TOnFocusButton;
    fb_save: TOnFocusButton;
    fb_delete: TOnFocusButton;
    Panel4: TPanel;
    OnEdit3: TOnEdit;
    use_Yes: TRadioButton;
    use_No: TRadioButton;
    use_All: TRadioButton;
    s_comcode: TOnEdit;
    s_comname: TOnEdit;
    fb_search: TOnFocusButton;
    i_coderegday: TOnDateEdit;
    RunGrid: TOnDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure fb_closeClick(Sender: TObject);
    procedure s_comcodeKeyPress(Sender: TObject; var Key: Char);
    procedure fb_searchClick(Sender: TObject);
    procedure use_YesClick(Sender: TObject);
    procedure use_NoClick(Sender: TObject);
    procedure use_AllClick(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure fb_insertClick(Sender: TObject);
    procedure fb_deleteClick(Sender: TObject);
    procedure fb_saveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Edit        : TOnWinPopupEdit;
    GIcloseS    : Integer;
    GScomcodeS  : String;
    GScomcode   : String;
    GScomname   : String;
    input_mode  : boolean;
  end;

var
   ComMgrForm : TComMgrForm;

implementation

uses PZO20101;

{$R *.DFM}

procedure TComMgrForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TDS1.Close;
end;

procedure TComMgrForm.fb_closeClick(Sender: TObject);
begin
    close;
end;

procedure TComMgrForm.s_comcodeKeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #13 then
       fb_searchClick(nil);
end;

procedure TComMgrForm.fb_searchClick(Sender: TObject);
begin
    with TDS1 do
    begin
        ServiceName := 'HINSA_select10';
        Close;
        Sql.Clear;
        SQL.Add('select codeno,                                                                            ');
        SQL.Add('       codename,                                                                          ');
        SQL.Add('       useyn,                                                                             ');
        SQL.Add('       coderegday,                                                                        ');
        SQL.Add('       writeman||''-''||(select korname from pimpmas where a.writeman = empno) writeman,  ');
        SQL.Add('       writetime,                                                                         ');
        SQL.Add('       ''field7'',                                                                        ');
        SQL.Add('       ''field8'',                                                                        ');
        SQL.Add('       ''field9'',                                                                        ');
        SQL.Add('       ''field10''                                                                        ');                
        SQL.Add('  from drmcode a                                                                          ');
        SQL.Add(' where codeid =''C001''                                                                   ');

        if(trim(s_comcode.Text)<>'') then
           SQL.Add('  and codeno like ''%' + trim(s_comcode.Text) + '%''                                   ');

        if(trim(s_comname.Text)<>'') then
           SQL.Add('  and codename like ''%' + trim(s_comname.Text) + '%''                                 ');

       if use_Yes.Checked = True then
            SQL.Add(' and useyn = ''Y''                                                                    ');
       if use_No.Checked = True then
            SQL.Add(' and useyn = ''N''                                                                    ');

        ClearFieldInfo;
        AddField('COMCODE'  ,  ftString, 100);
        AddField('COMNAME'  ,  ftString, 100);
        AddField('USEYN'    ,  ftString, 100);
        AddField('CODEREGDAY', ftString, 100);
        AddField('WRITEMAN' ,  ftString, 100);
        AddField('WRITETIME',  ftString, 100);
        AddField('FIELD7'   ,  ftString, 100);
        AddField('FIELD8'   ,  ftString, 100);
        AddField('FIELD9'   ,  ftString, 100);
        AddField('FIELD10'  ,  ftString, 100);

        Open;
    end;

    fb_delete.Enabled := true;
    input_mode        := false;
end;

procedure TComMgrForm.use_YesClick(Sender: TObject);
begin
    fb_searchClick(nil);
end;

procedure TComMgrForm.use_NoClick(Sender: TObject);
begin
    fb_searchClick(nil);
end;

procedure TComMgrForm.use_AllClick(Sender: TObject);
begin
    fb_searchClick(nil);
end;

procedure TComMgrForm.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
    with TDS1 do
    begin
        i_comcode.Text    := FieldByName('COMCODE').AsString;
        i_comname.Text    := FieldByName('COMNAME').AsString;
        i_useyn.Text      := FieldByName('USEYN').AsString;
        i_coderegday.Text := FM_Main.DisplayDate(FieldByName('CODEREGDAY').AsString);
        i_writeman.Text   := FieldByName('WRITEMAN').AsString;
        i_writetime.Text  := FieldByName('WRITETIME').AsString;
    end;

    fb_delete.Enabled := true;
end;

procedure TComMgrForm.fb_insertClick(Sender: TObject);
begin
    input_mode        := true;
    fb_delete.Enabled := false;

    i_comcode.Text    := '';
    i_comname.Text    := '';
    i_useyn.ItemIndex := 0;
    i_coderegday.Text := '';
    i_writeman.Text   := '';
    i_writetime.Text  := '';
end;

procedure TComMgrForm.fb_deleteClick(Sender: TObject);
begin
    if(input_mode) then
    begin
        MessageBox(Handle,'입력상태에서는 삭제할 수 없습니다.' , '경고', MB_ICONWARNING);
        system.exit;
    end;

    if(i_comcode.Text='') then
    begin
        MessageBox(Handle,'선택한 자료가 없습니다.' , '경고', MB_ICONWARNING);
        system.exit;
    end;

    with TDS2 do
    begin
        ServiceName := 'HINSA_select';
        Close;
        Sql.Clear;
        SQL.Add(' select count(*),                            ');
        SQL.Add('        ''field2'',                          ');
        SQL.Add('        ''field3'',                          ');
        SQL.Add('        ''field4'',                          ');
        SQL.Add('        ''field5''                           ');
        SQL.Add('   from PZMOUTMAS                            ');
        SQL.Add('  where COMCODE = ''' + i_comcode.Text + ''' ');

        ClearFieldInfo;
        AddField('field1' ,  ftString, 100);
        AddField('field2' ,  ftString, 100);
        AddField('field3' ,  ftString, 100);
        AddField('field4' ,  ftString, 100);
        AddField('field5' ,  ftString, 100);
        Open;

        if(FieldByName('field1').AsInteger > 0) then
        begin
            Messagebox(Handle,'해당 소속코드로 등록된 외주인력이 존재하여 삭제할 수 없습니다.','작업오류', MB_ICONWARNING);
            exit;
        end;
    end;

    if MessageDlg('해당 자료를 삭제하시겠습니까?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then exit;

    with TDS1 do
    begin
      ServiceName := 'PZO2010A_dml';
      Close;
      Sql.Clear;
      SQL.Add('DELETE FROM DRMCODE A                                                 ');
      SQL.Add(' WHERE CODEID = ''C001''                                              ');
      SQL.Add('   AND CODENO = ''' + i_comcode.Text + '''                            ');
      SQL.Add('   AND NOT EXISTS(SELECT 1 FROM PZMOUTMAS WHERE A.CODENO = COMCODE)   ');

      Execute;
    end;
    fb_searchClick(nil);
end;

procedure TComMgrForm.fb_saveClick(Sender: TObject);
begin
    if(input_mode) then
    begin
        if(trim(i_comcode.Text) ='') then
        begin
            MessageDlg('소속회사코드를 입력해 주시기 바랍니다.' , mtError, [mbOk], 0);
            i_comcode.SetFocus;
            system.exit;
        end;

        {기존 자료로 인하여 체크할 수 없음
        if(length(trim(i_comcode.Text)) <> 4) then
        begin
            MessageDlg('소속회사코드는 영숫자로 4자리로 입력해 주시기 바랍니다.' , mtError, [mbOk], 0);
            i_comcode.SetFocus;
            system.exit;
        end;
        }
    end
    else
    begin
        if(trim(i_comcode.Text) ='') then
        begin
            MessageDlg('선택된 소속회사가 없습니다.' , mtError, [mbOk], 0);
            i_comcode.SetFocus;
            system.exit;
        end;
    end;

    if(trim(i_comname.Text) ='') then
    begin
        MessageDlg('소속회사명을 입력해 주시기 바랍니다.' , mtError, [mbOk], 0);
        i_comname.SetFocus;
        system.exit;
    end;

    if(i_useyn.Text ='') then
    begin
        MessageDlg('사용여부를 선택해 주시기 바랍니다.' , mtError, [mbOk], 0);
        i_useyn.SetFocus;
        system.exit;
    end;

    if(input_mode) then
    begin
        with TDS2 do
        begin
            ServiceName := 'HINSA_select';
            Close;
            Sql.Clear;
            SQL.Add('SELECT count(CODENO),                  ');
            SQL.ADD('        ''field2'',                    ');
            SQL.ADD('        ''field3'',                    ');
            SQL.ADD('        ''field4'',                    ');
            SQL.ADD('        ''field5''                     ');
            SQL.Add('  FROM DRMCODE                         ');
            SQL.Add(' WHERE CODEID = ''C001''               ');
            SQL.Add('   and CODENO = '''+trim(i_comcode.Text)+''' ');

            ClearFieldInfo;
            AddField('field1' ,  ftString, 100);
            AddField('field2' ,  ftString, 100);
            AddField('field3' ,  ftString, 100);
            AddField('field4' ,  ftString, 100);
            AddField('field5' ,  ftString, 100);

            Open;

            if FieldByName('field1').AsInteger > 0 then
            begin
                 Close;
                 MessageBox(Handle, '이미 코드가 존재합니다.', '입력오류', MB_ICONWARNING);
                 System.Exit;
            end;

            close;
            Sql.Clear;
            SQL.Add('SELECT count(CODENO),                  ');
            SQL.ADD('        ''field2'',                    ');
            SQL.ADD('        ''field3'',                    ');
            SQL.ADD('        ''field4'',                    ');
            SQL.ADD('        ''field5''                     ');
            SQL.Add('  FROM DRMCODE                         ');
            SQL.Add(' WHERE CODEID = ''C001''               ');
            SQL.Add('   and CODENAME LIKE ''%'+trim(i_comname.Text)+'%'' ');

            ClearFieldInfo;
            AddField('field1' ,  ftString, 100);
            AddField('field2' ,  ftString, 100);
            AddField('field3' ,  ftString, 100);
            AddField('field4' ,  ftString, 100);
            AddField('field5' ,  ftString, 100);

            Open;
            if FieldByName('field1').AsInteger > 0 then
            begin
                 Close;
                 if MessageDlg('입력한 회사명과 유사한 회사가 존재합니다.'+#13#10+
                               '확인후 다시 등록하시겠습니까?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
                 begin
                     s_comcode.text := '';
                     s_comname.text := i_comname.text;
                     fb_searchClick(nil);
                     exit;
                 end;
            end;
        end;
    end;

    if MessageDlg('입력하신 내역을 저장하시겠습니까?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then exit;

    with TDS2 do
    begin
        ServiceName := 'PZO2010A_dml';
        Close;
        Sql.Clear;
        SQL.Add('MERGE INTO DRMCODE P                                                                             ');
        SQL.Add('     USING (SELECT ''C001'' CODEID, ''' + i_comcode.Text + ''' CODENO,                           ');
        SQL.Add('                   ''' + i_comname.Text + ''' CODENAME , ''' + i_useyn.Text + ''' USEYN,         ');
        SQL.Add('                   TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'') WRITETIME,                              ');
        SQL.Add('                   ''' + FM_Main.GSempno + ''' WRITEMAN FROM DUAL ) V1                           ');
        SQL.Add('        ON  (P.CODEID = V1.CODEID AND P.CODENO = V1.CODENO)                                      ');
        SQL.Add('      WHEN MATCHED THEN                                                                          ');
        SQL.Add('           UPDATE SET                                                                            ');
        SQL.Add('                  CODENAME  = V1.CODENAME,                                                       ');
        SQL.Add('                  USEYN     = V1.USEYN,                                                          ');
        SQL.Add('                  WRITETIME = V1.WRITETIME,                                                      ');
        SQL.Add('                  WRITEMAN  = V1.WRITEMAN                                                        ');
        SQL.Add('      WHEN NOT MATCHED THEN                                                                      ');
        SQL.Add('           INSERT(   CODEID,    CODENO,    CODENAME ,   USEYN,    CODEREGDAY,               WRITETIME,    WRITEMAN)        ');
        SQL.Add('           VALUES(V1.CODEID, V1.CODENO, V1.CODENAME ,V1.USEYN, substr(V1.WRITETIME,1,8), V1.WRITETIME, V1.WRITEMAN)        ');

        Execute;
    end;
    fb_searchClick(nil);
end;

procedure TComMgrForm.FormShow(Sender: TObject);
begin
    input_mode:= false;
end;

end.
