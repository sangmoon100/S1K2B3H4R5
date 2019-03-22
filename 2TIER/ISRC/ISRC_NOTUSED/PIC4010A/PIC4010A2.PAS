unit PIC4010A2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  peoutlookbtn, pegradpanl, Grids, DBGrids, StdCtrls, Buttons,
  ExtCtrls, Mask, pebtnedit, Db, DBCGrids, DBCtrls, PeJeonBtnDateEdit,
  peextcombo, DBTables, pevaluebtnedit, PeJeonLabel, pecodebtnedit;

type
  TFm_PIC4010A2 = class(TForm)
    PeJeonGrdPanel1: TPeJeonGrdPanel;
    Bt_Add: TPeJeonOutLookBtn;
    Bt_Del: TPeJeonOutLookBtn;
    Bt_Save: TPeJeonOutLookBtn;
    Bevel1: TBevel;
    DataSource_Grid: TDataSource;
    Query_Grid: TQuery;
    PeJeonOutLookBtn1: TPeJeonOutLookBtn;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    p2_Bt_Query: TPeJeonOutLookBtn;
    Bevel2: TBevel;
    EC_rabasdate: TPeJeonPanelComboBox;
    DBCtrlGrid1: TDBCtrlGrid;
    DBText1: TDBText;
    DBText2: TDBText;
    E_mark1: TPePanelEdit;
    E_mark2: TPePanelEdit;
    E_mark3: TPePanelEdit;
    E_mark4: TPePanelEdit;
    E_value1: TPePanelEdit;
    E_value2: TPePanelEdit;
    E_value3: TPePanelEdit;
    E_gubun: TPePanelEdit;
    E_rabasdate: TPePanelEdit;
    E_sgubun: TPePanelEdit;
    Panel1: TPanel;
    DBText3: TDBText;
    Query_Gridrabasdate: TStringField;
    Query_Gridupkind: TStringField;
    Query_Gridupcodeno: TStringField;
    Query_Gridtext1: TStringField;
    Query_Gridtext2: TStringField;
    Query_Gridtext3: TStringField;
    Query_Gridremark: TStringField;
    Query_Gridvalue1: TFloatField;
    Query_Gridvalue2: TFloatField;
    Query_Gridvalue3: TFloatField;
    Panel2: TPanel;
    ME_rabas: TPeJeonPanelComboBox;
    E_kijun1: TPePanelEdit;
    E_kijun2: TPePanelEdit;
    PeJeonOutLookBtn2: TPeJeonOutLookBtn;
    Label1: TLabel;
    E_PayclTo: TPePanelEdit;
    E_PayclFr: TPePanelEdit;
    Query_GridPAYCLFR: TStringField;
    Query_GridPAYCLTO: TStringField;
    E_kijun3: TPePanelEdit;

    procedure proc_DBGrid_show;
    procedure proc_insert;
    procedure proc_update;

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Bt_AddClick(Sender: TObject);
    procedure p2_Bt_QueryClick(Sender: TObject);
    procedure Bt_SaveClick(Sender: TObject);
    procedure Bt_DelClick(Sender: TObject);
    procedure PeJeonOutLookBtn1Click(Sender: TObject);
    procedure EC_rabasdateChange(Sender: TObject);
    procedure DBCtrlGrid1Click(Sender: TObject);
    procedure DataSource_GridDataChange(Sender: TObject; Field: TField);
    procedure PeJeonOutLookBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fm_PIC4010A2: TFm_PIC4010A2;

implementation

uses PIC4010A1, Fm_DM, PIC4010A2_1, Codelib;


{$R *.DFM}

procedure TFm_PIC4010A2.proc_DBGrid_show;
begin
  with Query_Grid do
  begin
       close;
       sql.clear;
       sql.add('select * from pimupbas             ');
       sql.add(' where rabasdate = :rabasdate      ');
       sql.add(' order by value3, upkind, upcodeno ');
       ParamByName('rabasdate').AsString := EC_rabasdate.Text;
       open;

       E_rabasdate.Enabled   := False;
       E_gubun.Enabled       := False;
       E_sgubun.Enabled      := False;
  end;
end;

procedure TFm_PIC4010A2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFm_PIC4010A2.FormCreate(Sender: TObject);
begin
  with DM.Query_select do
  begin
       close;
       sql.clear;
       sql.add('select distinct rabasdate ');
       sql.add('from   pimupbas           ');
       sql.add('order  by rabasdate desc  ');
       open;

       EC_rabasdate.Items.Clear;
       While Not Eof do
       begin
             EC_rabasdate.Items.Add( FieldByName('rabasdate').AsString );
             Next;
       end;
    end;

    Ec_rabasdate.ItemIndex := 0;
    EC_rabasdate.Text := Ec_rabasdate.Items[Ec_rabasdate.ItemIndex];

    E_PayclFr.Top  := E_value1.Top;
    E_PayclFr.Left := E_value1.Left;
    E_PayclTo.Top  := E_value2.Top;
    E_PayclTo.Left := E_value2.Left;
end;

procedure TFm_PIC4010A2.FormShow(Sender: TObject);
begin
  //현기준일 보여주기/
  with Query_Grid do
  begin
       close;
       sql.clear;
       sql.add('select * from pimupbas             ');
       sql.add(' where  rabasdate  = ''00000000''  ');
       open;

       ME_rabas.Text := '00000000';
       E_kijun1.Text := FieldByName('Value1').AsString;
       E_kijun2.Text := FieldByName('Text2').AsString;
       E_kijun3.Text := FieldByName('Text3').AsString;
  end;

  proc_DBGrid_show;
end;

procedure TFm_PIC4010A2.Bt_AddClick(Sender: TObject);
begin
// 화면을 clear함.

  E_gubun.Text      := '';
  E_sgubun.Text     := '';

  E_mark1.Text      := '';
  E_mark2.Text      := '';
  E_mark3.Text      := '';
  E_mark4.Text      := '';
  E_value1.Text     := '';
  E_value2.Text     := '';
  E_value3.Text     := '';

  E_PayclFr.Text    := '';
  E_PayclTo.Text    := '';

  E_rabasdate.Enabled   := True;
  E_gubun.Enabled       := True;
  E_sgubun.Enabled      := True;

  E_gubun.SetFocus;
end;

procedure TFm_PIC4010A2.p2_Bt_QueryClick(Sender: TObject);
begin
  proc_DBGrid_show;
end;

procedure TFm_PIC4010A2.Bt_SaveClick(Sender: TObject);
begin
  if  Trim(EC_rabasdate.Text) = '' then
  begin
     Application.MessageBox(' 현 BAND-UP 기준란이 공백입니다.' ,'확인',MB_OK+MB_ICONQUESTION);
     exit;
  end;

  with DM.Query_select do
  begin
       close;
       sql.clear;
       sql.add(' select rabasdate                                             ');
       sql.add(' from   pimupbas                                              ');
       sql.add(' where  rabasdate  = :rabasdate                               ');
       sql.add('   and  upkind     = :upkind                                  ');
       sql.add('   and  upcodeno   = :upcodeno                                ');

       ParamByName('rabasdate').AsString := EC_rabasdate.Text;
       ParamByName('rabasdate').AsString := E_rabasdate.Text;
       ParamByName('upkind').AsString    := E_gubun.Text;
       ParamByName('upcodeno').AsString  := E_sgubun.Text;

       open;

       if E_rabasdate.Enabled = True then // 추가버튼 후 저장
       begin
           if Eof and Bof then // 자료없슴
              proc_insert
           else
           begin
              Application.MessageBox(' 자료가 기 존재합니다.','확인',MB_OK+MB_ICONQUESTION);
              System.Exit;
           end;
       end
       else
       begin
           proc_update;
       end;


  end;
  FormCreate(Sender);
  proc_DBGrid_show;
end;

procedure TFm_PIC4010A2.proc_insert;
begin
  with DM.Query_exec do
  begin
       close;
       sql.clear;
       sql.add(' insert into pimupbas                           ');
       sql.add(' ( RABASDATE                                    ');
       sql.add('  ,upkind                                       ');
       sql.add('  ,upcodeno                                     ');
       sql.add('  ,VALUE1                                       ');
       sql.add('  ,VALUE2                                       ');
       sql.add('  ,VALUE3                                       ');
       sql.add('  ,text1                                        ');
       sql.add('  ,text2                                        ');
       sql.add('  ,text3                                        ');
       sql.add('  ,remark                                       ');
       sql.add('  ,PayclFr                                      ');
       sql.add('  ,PayclTo                                      ');
       sql.add('  )                                             ');
       sql.add(' values                                         ');
       sql.add(' ( :RABASDATE                                   ');
       sql.add('  ,:upkind                                      ');
       sql.add('  ,:upcodeno                                    ');
       sql.add('  ,:VALUE1                                      ');
       sql.add('  ,:VALUE2                                      ');
       sql.add('  ,:VALUE3                                      ');
       sql.add('  ,:text1                                       ');
       sql.add('  ,:text2                                       ');
       sql.add('  ,:text3                                       ');
       sql.add('  ,:remark                                      ');
       sql.add('  ,PayclFr                                      ');
       sql.add('  ,PayclTo                                      ');
       sql.add('  )                                             ');

       ParamByname('rabasdate').AsString := E_rabasdate.Text;
       ParamByname('upkind').AsString    := E_gubun.Text;
       ParamByname('upcodeno').AsString  := E_sgubun.Text;
       ParamByname('value1').AsString    := E_value1.Text;
       ParamByname('value2').AsString    := E_value2.Text;
       ParamByname('value3').AsString    := E_value3.Text;
       ParamByname('text1').AsString     := E_mark1.Text;
       ParamByname('text2').AsString     := E_mark2.Text;
       ParamByname('text3').AsString     := E_mark3.Text;
       ParamByname('remark').AsString    := E_mark4.Text;
       ParamByname('PayclFr').AsString   := E_PayclFr.Text;
       ParamByname('PayclTo').AsString   := E_PayclTo.Text;
   end;
  DM.Database1.StartTransaction;
  try
     DM.Query_exec.ExecSQL;
  except
     DM.Database1.Rollback;
     Messagebox(0, ' BAND-UP 기준 항목을 등록하는데 실패하였습니다...', '알림', MB_OK or $0020);
     Exit;
  end;
  DM.Database1.Commit;
  Fm_PIC4010A1.St_Help.Panels[0].Text := ' BAND-UP 기준 항목을 등록하였습니다...';
end;


procedure TFm_PIC4010A2.proc_update;
begin
  with DM.Query_exec do
  begin
       close;
       sql.clear;
       sql.add(' update pimupbas                                      ');
       sql.add('    set text1      = :text1                           ');
       sql.add('       ,VALUE1     = :VALUE1                          ');
       sql.add('       ,text2      = :text2                           ');
       sql.add('       ,VALUE2     = :VALUE2                          ');
       sql.add('       ,text3      = :text3                           ');
       sql.add('       ,VALUE3     = :VALUE3                          ');
       sql.add('       ,reMARK     = :reMARK                          ');
       sql.add('       ,PayclFr    = :PayclFr                         ');
       sql.add('       ,PayclTo    = :PayclTo                         ');
       sql.add(' where RABASDATE   = :RABASDATE                       ');
       sql.add('   and  upkind     = :upkind                          ');
       sql.add('   and  upcodeno   = :upcodeno                        ');

       ParamByname('rabasdate').AsString := E_rabasdate.Text;
       ParamByname('upkind').AsString    := E_gubun.Text;
       ParamByname('upcodeno').AsString  := E_sgubun.Text;
       ParamByname('value1').AsString    := E_value1.Text;
       ParamByname('value2').AsString    := E_value2.Text;
       ParamByname('value3').AsString    := E_value3.Text;
       ParamByname('text1').AsString     := E_mark1.Text;
       ParamByname('text2').AsString     := E_mark2.Text;
       ParamByname('text3').AsString     := E_mark3.Text;
       ParamByname('remark').AsString    := E_mark4.Text;       
       ParamByname('PayclFr').AsString   := E_PayclFr.Text;
       ParamByname('PayclTo').AsString   := E_PayclTo.Text;
  end;
  DM.Database1.StartTransaction;
  try
     DM.Query_exec.ExecSQL;
  except
     DM.Database1.Rollback;
     Messagebox(0, ' BAND-UP 기준 항목을 등록하는데 실패하였습니다...', '알림', MB_OK or $0020);
     Exit;
  end;
  DM.Database1.Commit;
  Fm_PIC4010A1.St_Help.Panels[0].Text := ' BAND-UP 기준 항목을 등록하였습니다...';
end;

procedure TFm_PIC4010A2.Bt_DelClick(Sender: TObject);
begin
  if MessageDlg(' 정말 삭제하시겠습니까?', mtInformation, [mbYes, mbNo], 0) = mrNo then Exit;
  Fm_PIC4010A1.St_Help.Panels[0].Text := '해당 자료를 삭제하고 있습니다.';

  if Trim(EC_rabasdate.Text) = '' then
  begin
     Application.MessageBox(' 현 BAND-UP 기준일 란이 공백입니다.' ,'확인',MB_OK+MB_ICONQUESTION);
     exit;
  end;

  with DM.Query_exec do
  begin
       close;
       sql.clear;
       sql.add(' delete  pimupbas                                             ');
       sql.add(' where   RABASDATE   = :RABASDATE                             ');
       sql.add('   and  upkind     = :upkind                                  ');
       sql.add('   and  upcodeno      = :upcodeno                             ');

       ParamByname('rabasdate').AsString := E_rabasdate.Text;
       ParamByname('upkind').AsString    := E_gubun.Text;
       ParamByname('upcodeno').AsString  := E_sgubun.Text;
  end;
  DM.Database1.StartTransaction;
  try
     DM.Query_exec.ExecSQL;
  except
     DM.Database1.Rollback;
     Messagebox(0, '현 BAND-UP 기준 항목을 삭제하는데 실패하였습니다...', '알림', MB_OK or $0020);
     Exit;
  end;
  DM.Database1.Commit;
  Fm_PIC4010A1.St_Help.Panels[0].Text := '현 BAND-UP 기준 항목을 삭제하였습니다...';
  FormCreate(Sender);
  proc_DBGrid_show;
end;

procedure TFm_PIC4010A2.PeJeonOutLookBtn1Click(Sender: TObject);
begin
  Application.CreateForm(TFm_PIC4010A2_1, Fm_PIC4010A2_1 );
  Fm_PIC4010A2_1.EC_rabasdate.text  := EC_rabasdate.Text;
  try
    Fm_PIC4010A2_1.ShowModal;
  finally
    Fm_PIC4010A2_1.Free;
  end;
  FormCreate(Sender);
  
end;

procedure TFm_PIC4010A2.EC_rabasdateChange(Sender: TObject);
begin
    if length(EC_rabasdate.Text) = 8 then
        p2_Bt_QueryClick(Sender);
end;

procedure TFm_PIC4010A2.DBCtrlGrid1Click(Sender: TObject);
begin
  E_rabasdate.Text  := Query_Grid.FieldByName('rabasdate').AsString;
  E_gubun.Text      := Query_Grid.FieldByName('upkind').AsString;
  E_sgubun.Text     := Query_Grid.FieldByName('upcodeno').AsString;

  E_mark1.Text      := Query_Grid.FieldByName('text1').AsString;
  E_mark2.Text      := Query_Grid.FieldByName('text2').AsString;
  E_mark3.Text      := Query_Grid.FieldByName('text3').AsString;
  E_value1.Text     := Query_Grid.FieldByName('value1').AsString;
  E_value2.Text     := Query_Grid.FieldByName('value2').AsString;
  E_value3.Text     := Query_Grid.FieldByName('value3').AsString;
  E_mark4.Text      := Query_Grid.FieldByName('remark').AsString;

  E_PayclFr.Text    := Query_Grid.FieldByName('PayclFr').AsString;
  E_PayclTo.Text    := Query_Grid.FieldByName('PayclTo').AsString;
end;

procedure TFm_PIC4010A2.DataSource_GridDataChange(Sender: TObject;
  Field: TField);
begin
  E_rabasdate.Text  := Query_Grid.FieldByName('rabasdate').AsString;
  E_gubun.Text      := Query_Grid.FieldByName('upkind').AsString;
  E_sgubun.Text     := Query_Grid.FieldByName('upcodeno').AsString;

  E_mark1.Text      := Query_Grid.FieldByName('text1').AsString;
  E_mark2.Text      := Query_Grid.FieldByName('text2').AsString;
  E_mark3.Text      := Query_Grid.FieldByName('text3').AsString;
  E_value1.Text     := Query_Grid.FieldByName('value1').AsString;
  E_value2.Text     := Query_Grid.FieldByName('value2').AsString;
  E_value3.Text     := Query_Grid.FieldByName('value3').AsString;
  E_mark4.Text      := Query_Grid.FieldByName('remark').AsString;

  E_PayclFr.Text     := Query_Grid.FieldByName('PayclFr').AsString;
  E_PayclTo.Text     := Query_Grid.FieldByName('PayclTo').AsString;

  if Query_Grid.FieldByName('upcodeno').AsString = '100' then
  begin
       E_PayclFr.Visible := True;
       E_PayclTo.Visible := True;
  end
  else
  begin
       E_PayclFr.Visible := False;
       E_PayclTo.Visible := False;
  end;
end;
procedure TFm_PIC4010A2.PeJeonOutLookBtn2Click(Sender: TObject);
begin
  if  Length(E_kijun1.Text) <> 8 then
  begin
       Application.MessageBox(' 현 BAND-UP 기준 기준값 오류 입니다.' ,'확인',MB_OK+MB_ICONQUESTION);
       exit;
  end;

  with DM.Query_exec do
  begin
       close;
       sql.clear;
       sql.add(' update pimupbas                  ');
       sql.add('    set VALUE1     = :Value1,     ');
       sql.add('        Text2      = :Text2,      ');
       sql.add('        Text3      = :Text3       ');
       sql.add(' where RABASDATE   = ''00000000'' ');

       ParamByname('Value1').AsString := E_kijun1.Text;
       ParamByname('Text2').AsString  := E_kijun2.Text;
       ParamByname('Text3').AsString  := E_kijun3.Text;
  end;

  DM.Database1.StartTransaction;
  try
     DM.Query_exec.ExecSQL;
  except
     DM.Database1.Rollback;
     Messagebox(0, '현 BAND-UP 기준 등록을 실패하였습니다...', '알림', MB_OK or $0020);
     Exit;
  end;
  DM.Database1.Commit;
  Fm_PIC4010A1.St_Help.Panels[0].Text := '현 BAND-UP 기준을 등록하였습니다...';
end;

end.
