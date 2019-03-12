
unit PTA30401;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OnScheme, ExtCtrls, OnEditStdCtrl, OnEditBtnCtrl, OnPopupEdit, StdCtrls,
  OnEditBaseCtrl, Grids, DBGrids, OnGrDBGrid, OnShapeLabel, OnEditCombo,
  OnCodeEdit, OnEditNumCtl, OnFocusButton, ComCtrls, OnSkinBtn,
  Db, MemDS, DBAccess, Ora, OnInsaCommon, OnPersonEdit, Gauges, OnDBGrid,
  OnMemDataset, OnDeptEdit, DBTables,  Pass, Func; //OnTmaxPersonEdit,

type
  TMainForm = class(TForm)
    Panel1: TPanel;
    SF_Main: TOnSchemeForm;
    Notebook1: TNotebook;
    OnShapeLabel3: TOnShapeLabel;
    Grid1: TOnGrDbGrid;
    Panel16: TPanel;
    Shape1: TShape;
    Label10: TLabel;
    Panel53: TPanel;
    Panel50: TPanel;
    Panel52: TPanel;
    Panel51: TPanel;
    CB_base_yyF: TOnComboEdit;
    CB_base_yy: TOnComboEdit;
    NE_req_score: TOnNumberEdit;
    NE_opt_score: TOnNumberEdit;
    NE_tot_score: TOnNumberEdit;
    SB_1: TOnSkinButton;
    SB_2: TOnSkinButton;
    SB_Help: TStatusBar;
    OnShapeLabel1: TOnShapeLabel;
    Grid2: TOnGrDbGrid;
    Shape2: TShape;
    Label1: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Shape3: TShape;
    BT_find: TOnFocusButton;
    BT_add: TOnFocusButton;
    BT_mod: TOnFocusButton;
    BT_save: TOnFocusButton;
    BT_cancel: TOnFocusButton;
    BT_del: TOnFocusButton;
    BT_close: TOnFocusButton;
    ED_edu_type: TOnEdit;
    ED_edu_name: TOnEdit;
    ED_edu_group_cd: TOnEdit;
    ED_edu_pass_type: TOnEdit;
    ED_remark: TOnEdit;
    Ora_Qry1: TOraQuery;
    Ora_Grid1: TOraQuery;
    DS_Grid1: TDataSource;
    Ora_Save: TOraQuery;
    Ora_Grid2: TOraQuery;
    DS_Grid2: TDataSource;
    CB_req_yn: TOnComboEdit;
    ED_paycl: TOnWinPopupEdit;
    ED_paycl_name: TOnEdit;
    SB_3: TOnSkinButton;
    ED_empno_h: TOnPersonPopupEdit;
    CB_base_yy_h: TOnComboEdit;
    ED_payra_h: TOnCodePopupEdit;
    ED_paycl_h: TOnWinPopupEdit;
    OnShapeLabel2: TOnShapeLabel;
    Shape4: TShape;
    OnShapeLabel5: TOnShapeLabel;
    CB_base_yy_b: TOnComboEdit;
    BT_run: TOnFocusButton;
    OnShapeLabel4: TOnShapeLabel;
    SB_4: TOnSkinButton;
    Shape6: TShape;
    ED_emp_fr: TOnPersonPopupEdit;
    Label3: TLabel;
    Shape7: TShape;
    ED_emp_to: TOnPersonPopupEdit;
    Shape8: TShape;
    Gauge1: TGauge;
    OnShapeLabel6: TOnShapeLabel;
    CB_base_yy_e: TOnComboEdit;
    Shape9: TShape;
    Grid3: TOnGrDbGrid;
    BT_FindDiff: TOnFocusButton;
    BT_AllSave: TOnFocusButton;
    SB_5: TOnSkinButton;
    Ora_Grid3: TOraQuery;
    DS_Grid3: TDataSource;
    CB_kpi: TOnComboEdit;
    ED_exmark: TOnEdit;
    M_team: TMemo;
    CB_base_yy_f: TOnComboEdit;
    SB_6: TOnSkinButton;
    ED_team: TOnWinPopupEdit;
    L_teamnm: TOnShapeLabel;
    OnShapeLabel8: TOnShapeLabel;
    OnGrDbGrid1: TOnGrDbGrid;
    OnShapeLabel9: TOnShapeLabel;
    OnDBGrid1: TOnDBGrid;
    Ora_Grid6: TOraQuery;
    DS_Grid6: TDataSource;
    MD_Data: TOnMemData;
    DS_Grid61: TDataSource;
    MD_Datakpiyn: TStringField;
    MD_Dataexmark: TStringField;
    MD_Datadeptname: TStringField;
    MD_Datapayclname: TStringField;
    MD_Dataempno: TStringField;
    MD_Datakorname: TStringField;
    MD_Datatot: TStringField;
    MD_Datareq: TStringField;
    MD_Dataopt: TStringField;
    MD_Database_yy: TStringField;
    MD_Datachanyn: TStringField;
    Ora_Date: TOraQuery;
    Memo1: TMemo;
    Ora_Session: TOraSession;
    ED_deptcode_h: TOnWinPopupEdit;
    ED_teamcode_h: TOnWinPopupEdit;
    procedure BT_closeClick(Sender: TObject);
    procedure SB_1Click(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure BT_findClick(Sender: TObject);
    procedure DS_Grid1DataChange(Sender: TObject; Field: TField);
    procedure CB_base_yyFChange(Sender: TObject);
    procedure BT_addClick(Sender: TObject);
    procedure BT_modClick(Sender: TObject);
    procedure BT_saveClick(Sender: TObject);
    procedure BT_cancelClick(Sender: TObject);
    procedure BT_delClick(Sender: TObject);
    procedure DS_Grid2DataChange(Sender: TObject; Field: TField);
    procedure ED_payclCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure ED_payclInitPopup(Sender: TObject);
    procedure ED_paycl_hCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure ED_empno_hKeyPress(Sender: TObject; var Key: Char);
    procedure ED_empno_hCloseUp(Sender: TObject; var Value: String;
      var CloseAccept: Boolean);
    procedure BT_runClick(Sender: TObject);
    procedure ED_emp_frKeyPress(Sender: TObject; var Key: Char);
    procedure ED_emp_toKeyPress(Sender: TObject; var Key: Char);
    procedure BT_FindDiffClick(Sender: TObject);
    procedure Grid3ApplyCellAttribute(Sender: TObject; Field: TField;
      Canvas: TCanvas; Rect: TRect; State: TGridDrawState);
    procedure BT_AllSaveClick(Sender: TObject);
    procedure CB_base_yy_eChange(Sender: TObject);
    procedure CB_kpiChange(Sender: TObject);
    procedure DS_Grid6DataChange(Sender: TObject; Field: TField);
    procedure OnDBGrid1EditChange(Sender: TOnJCustomDBGrid;
      AEditor: TOnCustomMaskEdit; const AText: String);
    procedure ED_teamChange(Sender: TObject);
    procedure ED_teamInitPopup(Sender: TObject);
    procedure ED_teamCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure OnDBGrid1DrawCell(Sender: TObject; const ACell: TOnJCell;
      var BgColor, FontColor: TColor; var FStyle: TFontStyles);
    procedure ED_deptcode_hCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure ED_teamcode_hCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure ED_deptcode_hInitPopup(Sender: TObject);
    procedure ED_teamcode_hInitPopup(Sender: TObject);
  private
    { Private declarations }
    JobMode : String;

    procedure Set_InputField(arg1, arg2 : Boolean );
    procedure Set_BtnEnable(gubun : Char);
    function  DataChk : Boolean;
  public
    { Public declarations }
    GSempno   : String[4];     //Login사번
    GSkorname : String[12];    //Login성명
    GSgrade   : String[10];    //등급
    GSsysdate : String[15];
    GSorgnum  : String[3];
    payrachdate : String;
  end;

var
  MainForm: TMainForm;


implementation

uses PTA30402, PTA30403;

{$R *.DFM}

procedure TMainForm.BT_closeClick(Sender: TObject);
begin
     Close;
end;

procedure TMainForm.SB_1Click(Sender: TObject);
begin
     SB_1.BtnDown  := False;
     SB_2.BtnDown  := False;
     SB_3.BtnDown  := False;
     SB_4.BtnDown  := False;
     SB_5.BtnDown  := False;
     SB_6.BtnDown  := False;

     TOnSkinButton(Sender).BtnDown := True;
     NoteBook1.ActivePage := 'P_' + IntToStr(TOnSkinButton(Sender).Tag);
     BT_cancelClick(Sender);
end;

procedure TMainForm.FormPaint(Sender: TObject);
begin
     Self.OnPaint := Nil;
     Application.ProcessMessages;
     SF_Main.Refresh;
     
     SB_help.Panels[1].Text := '인사 시스템에 접속 중입니다...';

     Ora_Session.Options.Net   := True;
     Ora_Session.ConnectPrompt := False;
     Ora_Session.Username      := Passemp(cmdline,5);
     Ora_Session.Password      := Passemp(cmdline,6);
     Ora_Session.Server        := Passemp(cmdline,7)+':'+Passemp(cmdline,9)+':'+Passemp(cmdline,8);
     try
       Ora_Session.Connected := True;
     except on E : Exception do
       Application.MessageBox(PChar('서버에 접속할 수 없습니다...'#13#13+E.Message),'알 림',MB_OK);
     end;

     SB_help.Panels[1].Text := '';

     GSempno   := Passemp(cmdline,1);
     GSkorname := Passemp(cmdline,2);
     GSgrade   := Passemp(cmdLine,4);

     if (GSgrade[5] > 'C') or (GSgrade[9] > 'C') then
     begin
       MessageDlg('귀하는 작업권한이 없습니다. 프로그램을 종료합니다.', mtInformation, [mbOk], 0);
       BT_CloseClick(Self);
       Exit;
     end;

     GSsysdate := Fn_GetDateTimeStr;

     with Ora_Date do
     begin
          Close;
          SQL.Clear;
          SQL.Add('select distinct base_yy from pedu2base order by 1');
          Open;

          if recordcount  > 0 then
          begin
            CB_base_yyF.items.Clear;
            CB_base_yyF.KeyItems.Clear;
            CB_base_yy.items.Clear;
            CB_base_yy.KeyItems.Clear;
            CB_base_yy_h.items.Clear;
            CB_base_yy_h.KeyItems.Clear;
            CB_base_yy_b.items.Clear;
            CB_base_yy_b.KeyItems.Clear;
            CB_base_yy_e.items.Clear;
            CB_base_yy_e.KeyItems.Clear;
            CB_base_yy_f.items.Clear;
            CB_base_yy_f.KeyItems.Clear;
            while not eof do
            begin
               CB_base_yyF.Items.Add(fields[0].AsString +'년');
               CB_base_yyF.KeyItems.Add(fields[0].AsString);
               CB_base_yy.Items.Add(fields[0].AsString +'년');
               CB_base_yy.KeyItems.Add(fields[0].AsString);
               CB_base_yy_h.Items.Add(fields[0].AsString +'년');
               CB_base_yy_h.KeyItems.Add(fields[0].AsString);
               CB_base_yy_b.Items.Add(fields[0].AsString +'년');
               CB_base_yy_b.KeyItems.Add(fields[0].AsString);
               CB_base_yy_e.Items.Add(fields[0].AsString +'년');
               CB_base_yy_e.KeyItems.Add(fields[0].AsString);
               CB_base_yy_f.Items.Add(fields[0].AsString +'년');
               CB_base_yy_f.KeyItems.Add(fields[0].AsString);
               next;
            end;
            last;
            if Copy(GSsysdate,1,4) <> fields[0].AsString then
            begin
               CB_base_yyF.Items.Add(Copy(GSsysdate,1,4) +'년');
               CB_base_yyF.KeyItems.Add(Copy(GSsysdate,1,4));
               CB_base_yy.Items.Add(Copy(GSsysdate,1,4) +'년');
               CB_base_yy.KeyItems.Add(Copy(GSsysdate,1,4));
               CB_base_yy_h.Items.Add(Copy(GSsysdate,1,4) +'년');
               CB_base_yy_h.KeyItems.Add(Copy(GSsysdate,1,4));
               CB_base_yy_b.Items.Add(Copy(GSsysdate,1,4) +'년');
               CB_base_yy_b.KeyItems.Add(Copy(GSsysdate,1,4));
               CB_base_yy_e.Items.Add(Copy(GSsysdate,1,4) +'년');
               CB_base_yy_e.KeyItems.Add(Copy(GSsysdate,1,4));
               CB_base_yy_f.Items.Add(Copy(GSsysdate,1,4) +'년');
               CB_base_yy_f.KeyItems.Add(Copy(GSsysdate,1,4));
            end;
          end;
     end;

     CB_base_yyF.Text         := Copy(GSsysdate,1,4) +'년';
     CB_base_yy_h.Text        := Copy(GSsysdate,1,4) +'년';
     CB_base_yy_b.Text        := Copy(GSsysdate,1,4) +'년';
     CB_base_yy_e.Text        := Copy(GSsysdate,1,4) +'년';
     CB_base_yy_f.Text        := Copy(GSsysdate,1,4) +'년';
     ED_emp_fr.Text           := '0000';
     ED_emp_to.Text           := 'ZZZZ';

     with Ora_Date do
     begin
        Close;
        SQL.Clear;
        SQL.Add('select Value1, Value3, Value4 from pimvari where gubun = ''00'' and sgubun = ''0001'' ');
        Open;
        GSorgnum    := fields[0].AsString;
        payrachdate := fields[1].AsString;
     end;

     SB_1Click(SB_1);
end;

procedure TMainForm.BT_findClick(Sender: TObject);
begin
     if NoteBook1.ActivePage = 'P_1' then
     begin
          with Ora_Grid1 do
          begin
               Close;
               SQL.Clear;
               SQL.Add('select a.base_yy,            ');
               SQL.Add('       a.paycl,              ');
               SQL.Add('       a.paycl_name ,        ');
               SQL.Add('       a.req_score,          ');
               SQL.Add('       a.opt_score,          ');
               SQL.Add('       a.tot_score           ');
               SQL.Add('from pedu2base a             ');
               SQL.Add('where a.base_yy = :base_yy   ');
               SQL.Add('order by a.paycl             ');

               ParamByName('base_yy').AsString := CB_base_yyF.KeyItems[CB_base_yyF.ItemIndex];

               Open;

               DS_Grid1.OnDataChange := Nil;
               FieldByName('base_yy').Alignment := taCenter;
               DS_Grid1.OnDataChange := DS_Grid1DataChange;
          end;
     end
     else if NoteBook1.ActivePage = 'P_2' then
     begin
          with Ora_Grid2 do
          begin
               Close;
               SQL.Clear;
               SQL.Add('select edu_type,       ');
               SQL.Add('       edu_name,       ');
               SQL.Add('       req_yn,         ');
               SQL.Add('       edu_group_cd,   ');
               SQL.Add('       edu_pass_type,  ');
               SQL.Add('       remark          ');
               SQL.Add('from pedu2type         ');
               SQL.Add('order by edu_type      ');

               Open;

               FieldByName('edu_type').Alignment := taCenter;
               FieldByName('req_yn').Alignment   := taCenter;
          end;
     end
     else if NoteBook1.ActivePage = 'P_3' then
     begin
          with Ora_Qry1 do
          begin
               Close;
               SQL.Clear;
               SQL.Add('select a.orgnum,                                                  ');
               SQL.Add('       a.deptcode,                                                ');
               SQL.Add('       a.teamcode,                                                ');
               SQL.Add('       a.payra,                                                   ');
               SQL.Add('       a.paycl,                                                   ');
            if copy(GSsysdate,1,8) < payrachdate then
               SQL.Add('       decode(a.paycl, ''0C'', ''팀장'', c.codename) paycl_name , ')
            else
               SQL.Add('       decode(a.paycl, ''C00'', ''팀장'', c.codename) paycl_name ,');
               SQL.Add('       nvl(kpiyn,''Y'') kpiyn,                                    ');
               SQL.Add('       exmark                                                     ');
               SQL.Add('from pedu2his a, pyccode c                                        ');
               SQL.Add('where c.codeid(+)   = ''I112''                                    ');
               SQL.Add('  and a.paycl       = c.codeno(+)                                 ');
               SQL.Add('  and a.base_yy     = :base_yy                                    ');
               SQL.Add('  and a.empno       = :empno                                      ');

               ParamByName('base_yy').AsString := CB_base_yy_h.KeyItems[CB_base_yy_h.ItemIndex];
               ParamByName('empno').AsString   := Copy(ED_empno_h.Text,1,4);

               Open;

               ED_deptcode_h.Text := FieldByName('deptcode').AsString ;
//               ED_deptcode_h.PL_get_singledata;
               ED_teamcode_h.Text := FieldByName('teamcode').AsString ;
//               ED_teamcode_h.PL_get_singledata;
               ED_payra_h.Text    := FieldByName('payra').AsString ;
               ED_payra_h.PL_get_singledata;
               ED_paycl_h.Text    := FieldByName('paycl').AsString +' - '+FieldByName('paycl_name').AsString;
               CB_kpi.Text        := FieldByName('kpiyn').AsString;
               ED_exmark.Text     := FieldByName('exmark').AsString;
               JobMode := 'U';
          end;
     end
     else if NoteBook1.ActivePage = 'P_6' then
     begin
          with Ora_Grid6 do
          begin
               Close;
               SQL.Clear;
               SQL.Add('select a.base_yy,                                             ');
               SQL.Add('       a.orgnum,                                              ');
               SQL.Add('       a.teamcode,                                            ');
               SQL.Add('       b.deptname teamname,                                   ');
               SQL.Add('       a.team_empno||'' - ''||m.korname team_empno,           ');
               SQL.Add('       nvl(a.team_count, 0) team_count,                       ');
               SQL.Add('       nvl(a.tot_score,0)||'' (''||nvl(a.tot_sc,0)||'')'' tot,');
               SQL.Add('       nvl(a.avg_score,0)||'' (''||nvl(a.avg_sc,0)||'')'' avg,');
               SQL.Add('       a.kpi_grade                                            ');
               SQL.Add('from pedu2team a, pimpmas m, pycdept b                        ');
               SQL.Add('where a.orgnum   = b.orgnum                                   ');
               SQL.Add('  and a.teamcode = b.deptcode                                 ');
               SQL.Add('  and a.team_empno = m.empno(+)                               ');
               SQL.Add('  and a.base_yy  = :base_yy                                   ');

               if Trim(ED_team.Text) <> '' then
               begin
                    SQL.Add('   and a.teamcode  = :teamcode             ');
                    ParamByName('teamcode').AsString := ED_team.Text;
               end;

               ParamByName('base_yy').AsString := CB_base_yy_f.KeyItems[CB_base_yy_f.ItemIndex];

               Open;

               DS_Grid6.OnDataChange              := nil;
               FieldByName('tot').Alignment       := taCenter;
               FieldByName('avg').Alignment       := taCenter;
               FieldByName('kpi_grade').Alignment := taCenter;
               DS_Grid6.OnDataChange              := DS_Grid6DataChange;
          end;
     end;
end;

procedure TMainForm.DS_Grid1DataChange(Sender: TObject; Field: TField);
begin
     with Ora_Grid1 do
     begin
          CB_base_yy.Text := FieldByName('base_yy').AsString +'년';
          ED_paycl.Text   := FieldByName('paycl').AsString;
          ED_paycl_name.Text := FieldByName('paycl_name').AsString;
          NE_req_score.Value := FieldByName('req_score').AsFloat;
          NE_opt_score.Value := FieldByName('opt_score').AsFloat;
          NE_tot_score.Value := FieldByName('tot_score').AsFloat;
     end;

     if Trim(ED_paycl.Text) = ''then Set_BtnEnable('N')
     else                            Set_BtnEnable('F');
end;

procedure TMainForm.CB_base_yyFChange(Sender: TObject);
begin
     Ora_Grid1.Close;
     Set_InputField(False, True);
end;

procedure TMainForm.BT_addClick(Sender: TObject);
begin
     JobMode            := 'I';
     Set_InputField(True, True);
     Set_BtnEnable('I');

          if NoteBook1.ActivePage ='P_1' then CB_base_yy.Setfocus
     else if NoteBook1.ActivePage ='P_2' then ED_edu_type.Setfocus;
end;

procedure TMainForm.Set_InputField(arg1, arg2 : Boolean );
begin
     if NoteBook1.ActivePage ='P_1' then
     begin
          Grid1.Enabled         := not arg1;
          CB_base_yy.Enabled    := arg1;
          ED_paycl.Enabled      := arg1;
          ED_paycl_name.Enabled := arg1;
          NE_req_score.Enabled  := arg1;
          NE_opt_score.Enabled  := arg1;
          NE_tot_score.Enabled  := arg1;

          if arg2 then
          begin
               CB_base_yy.Text    := '';
               ED_paycl.Text      := '';
               ED_paycl_name.Text := '';
               NE_req_score.Value := 0;
               NE_opt_score.Value := 0;
               NE_tot_score.Value := 0;
          end
          else
          begin
               CB_base_yy.Enabled    := False;
               ED_paycl.Enabled      := False;
               ED_paycl_name.Enabled := False;
          end;
     end
     else if NoteBook1.ActivePage ='P_2' then
     begin
          Grid2.Enabled            := not arg1;
          ED_edu_type.Enabled      := arg1;
          ED_edu_name.Enabled      := arg1;
          CB_req_yn.Enabled        := arg1;
          ED_edu_group_cd.Enabled  := arg1;
          ED_edu_pass_type.Enabled := arg1;
          ED_remark.Enabled        := arg1;

          if arg2 then
          begin
               ED_edu_type.Text      := '';
               ED_edu_name.Text      := '';
               CB_req_yn.Text        := '';
               ED_edu_group_cd.Text  := '';
               ED_edu_pass_type.Text := '';
               ED_remark.Text        := '';
          end
          else ED_edu_type.Enabled      := False;
     end
     else if NoteBook1.ActivePage ='P_3' then
     begin
          //ED_empno_h.Text            := '';
          ED_deptcode_h.Text := '';
          ED_teamcode_h.Text := '';
          ED_payra_h.Text    := '';
          ED_paycl_h.Text    := '';
          CB_kpi.ItemIndex   := 0 ;
          ED_exmark.Text     := '';
          JobMode            := 'F';
     end;
end;

procedure TMainForm.Set_BtnEnable(gubun : Char);
begin
     if NoteBook1.ActivePage ='P_3' then
     begin
          BT_find.Enabled   := True;
          BT_add.Enabled    := False;
          BT_mod.Enabled    := False;
          BT_save.Enabled   := True;
          BT_cancel.Enabled := True;
          BT_del.Enabled    := False;
          System.Exit;
     end;

     if (NoteBook1.ActivePage ='P_4') or (NoteBook1.ActivePage ='P_5') then
     begin
          BT_find.Enabled   := False;
          BT_add.Enabled    := False;
          BT_mod.Enabled    := False;
          BT_save.Enabled   := False;
          BT_cancel.Enabled := False;
          BT_del.Enabled    := False;
          System.Exit;
     end;

     if NoteBook1.ActivePage ='P_6' then
     begin
          BT_find.Enabled   := True;
          BT_add.Enabled    := False;
          BT_mod.Enabled    := False;
          BT_save.Enabled   := True;
          BT_cancel.Enabled := True;
          BT_del.Enabled    := False;
          System.Exit;
     end;

     if gubun ='F' then  //default
     begin
          BT_find.Enabled   := True;
          BT_add.Enabled    := True;
          BT_mod.Enabled    := True;
          BT_save.Enabled   := False;
          BT_cancel.Enabled := False;
          BT_del.Enabled    := True;
     end
     else if gubun ='I' then //수정상태
     begin
          BT_find.Enabled   := True;
          BT_add.Enabled    := False;
          BT_mod.Enabled    := False;
          BT_save.Enabled   := True;
          BT_cancel.Enabled := True;
          BT_del.Enabled    := False;
     end
     else if gubun ='N' then //no data
     begin
          BT_find.Enabled   := True;
          BT_add.Enabled    := True;
          BT_mod.Enabled    := False;
          BT_save.Enabled   := False;
          BT_cancel.Enabled := False;
          BT_del.Enabled    := False;
     end;
end;

procedure TMainForm.BT_modClick(Sender: TObject);
begin
     JobMode            := 'U';
     Set_InputField(True, False );
     Set_BtnEnable('I');
end;

function TMainForm.DataChk : Boolean;
begin
     Result := False;

     if NoteBook1.ActivePage ='P_1' then
     begin
          if Trim(CB_base_yy.Text) = '' then
          begin
               MessageDlg('기준년도를 정확히 입력해 주세요..', mtError, [mbok], 0) ;
               CB_base_yy.SetFocus;
               System.Exit;
          end;

          if (Trim(ED_paycl.Text) = '') or (Trim(ED_paycl_name.Text) ='') then
          begin
               MessageDlg('BAND을 정확히 입력해 주세요..', mtError, [mbok], 0) ;
               ED_paycl.SetFocus;
               System.Exit;
          end;
     end
     else if NoteBook1.Activepage = 'P_2' then
     begin
          if Trim(ED_edu_type.Text) = '' then
          begin
               MessageDlg('교육유형코드를 정확히 입력해 주세요..', mtError, [mbok], 0) ;
               ED_edu_type.SetFocus;
               System.Exit;
          end;

          if Trim(ED_edu_name.Text) = '' then
          begin
               MessageDlg('교육유형명을 정확히 입력해 주세요..', mtError, [mbok], 0) ;
               ED_edu_name.SetFocus;
               System.Exit;
          end;

          if Trim(CB_req_yn.Text) = '' then
          begin
               MessageDlg('필수교육여부를 정확히 입력해 주세요..', mtError, [mbok], 0) ;
               CB_req_yn.SetFocus;
               System.Exit;
          end;

          if Trim(ED_edu_group_cd.Text) = '' then
          begin
               MessageDlg('교육 그룹코드를 정확히 입력해 주세요..', mtError, [mbok], 0) ;
               ED_edu_group_cd.SetFocus;
               System.Exit;
          end;
     end
     else if NoteBook1.Activepage = 'P_3' then
     begin

          if Trim(ED_deptcode_h.Text) = ''then
          begin
               MessageDlg('소속부서를 정확히 입력해 주세요..', mtError, [mbok], 0) ;
               ED_deptcode_h.SetFocus;
               System.Exit;
          end;

          if Trim(ED_teamcode_h.Text) = ''then
          begin
               MessageDlg('팀을 정확히 입력해 주세요..', mtError, [mbok], 0) ;
               ED_teamcode_h.SetFocus;
               System.Exit;
          end;

          if Trim(ED_payra_h.Text) = ''then
          begin
               MessageDlg('직책를 정확히 입력해 주세요..', mtError, [mbok], 0) ;
               ED_payra_h.SetFocus;
               System.Exit;
          end;

          if Trim(ED_paycl_h.Text) = '' then
          begin
               MessageDlg('BAND를 정확히 입력해 주세요..', mtError, [mbok], 0) ;
               ED_paycl_h.SetFocus;
               System.Exit;
          end;

          if (CB_kpi.Text ='N') and (Trim(ED_exmark.Text) = '') then
          begin
               MessageDlg('KPI 제외사유를 입력해 주세요..', mtError, [mbok], 0) ;
               ED_exmark.SetFocus;
               System.Exit;
          end;
     end;

     Result := True;
end;

procedure TMainForm.BT_saveClick(Sender: TObject);
begin
     ////팀별 KPI 관리인 경우 아래 저장 작업하고 Exit
     if NoteBook1.ActivePage ='P_6' then
     begin
          //데이터 검증
          MD_Data.First;
          while not MD_Data.Eof do
          begin
               if (MD_Data.FieldByName('kpiyn').AsString ='N') and (Trim(MD_Data.FieldByName('exmark').AsString) ='') then
               begin
                    MessageDlg('KPI여부가 ''N''인데 제외사유가 없습니다. 확인하고 다시 입력하세요.', mtError, [mbOk], 0);
                    System.Exit;
               end;

               if (MD_Data.FieldByName('kpiyn').AsString ='Y') and (Trim(MD_Data.FieldByName('exmark').AsString) <> '') then
               begin
                    MessageDlg('KPI여부가 ''Y''인데 제외사유가 있습니다. 확인하고 다시 입력하세요.', mtError, [mbOk], 0);
                    System.Exit;
               end;

               MD_Data.Next;
          end;

          //실제 저장작업
          MD_Data.First;
          while not MD_Data.Eof do
          begin
               if MD_Data.FieldByName('chanyn').AsString ='Y' then
               begin
                    with Ora_Save do
                    begin
                         Close;
                         SQL.Clear;
                         SQL.Add('update pedu2his set kpiyn     = :kpiyn,                                  ');
                         SQL.Add('                    exmark    = :exmark,                                 ');
                         SQL.Add('                    writetime = to_char(sysdate, ''yyyymmddhh24miss''),  ');
                         SQL.Add('                    writeman  = :writeman                                ');
                         SQL.Add('where base_yy = :base_yy                                                 ');
                         SQL.Add('  and empno   = :empno                                                   ');

                         ParamByName('kpiyn'   ).AsString := MD_Data.FieldByName('kpiyn').AsString;
                         ParamByName('exmark'  ).AsString := Trim(MD_Data.FieldByName('exmark').AsString);
                         ParamByName('writeman').AsString := GSempno;
                         ParamByName('base_yy' ).AsString := MD_Data.FieldByName('base_yy').AsString;
                         ParamByName('empno'   ).AsString := MD_Data.FieldByName('empno').AsString;
                         ExecSQL;
                    end;
               end;
               MD_Data.Next;
          end;
          MessageDlg('KPI여부가 저장되었습니다..', mtInformation, [mbOk], 0);
          BT_findClick(Sender);
          System.Exit;
     end;
     ////팀별 KPI 관리인 경우 끝

     if not ((JobMode = 'I') or (JobMode = 'U')) then System.Exit;
     if not DataChk then System.Exit;

     with Ora_Save do
     begin
          if JobMode = 'I' then
          begin
               if NoteBook1.ActivePage = 'P_1' then
               begin
                    Close;
                    SQL.Clear;
                    SQL.Add('select base_yy from pedu2base ');
                    SQL.Add(' where base_yy = :base_yy     ');
                    SQL.Add('   and paycl   = :paycl       ');
                    ParamByName('base_yy').AsString  := CB_base_yy.KeyItems[CB_base_yy.ItemIndex];
                    ParamByName('paycl').AsString    := ED_paycl.Text;
                    Open;

                    if not Ora_Save.Eof then
                    begin
                         MessageDlg('중복되는 자료가 존재합니다.', mtError, [mbOk], 0);
                         System.Exit;
                     end;

                     Close;
                     SQL.Clear;
                     SQL.Add('insert into pedu2base ( base_yy,                               ');
                     SQL.Add('                        paycl,                                 ');
                     SQL.Add('                        paycl_name,                            ');
                     SQL.Add('                        req_score,                             ');
                     SQL.Add('                        opt_score,                             ');
                     SQL.Add('                        tot_score,                             ');
                     SQL.Add('                        writetime,                             ');
                     SQL.Add('                        writeman )                             ');
                     SQL.Add('              values  (:base_yy,                               ');
                     SQL.Add('                       :paycl,                                 ');
                     SQL.Add('                       :paycl_name,                            ');
                     SQL.Add('                       :req_score,                             ');
                     SQL.Add('                       :opt_score,                             ');
                     SQL.Add('                       :tot_score,                             ');
                     SQL.Add('                       to_char(sysdate, ''yyyymmddhh24miss''), ');
                     SQL.Add('                       :writeman )                             ');

                     ParamByName('base_yy'   ).AsString := CB_base_yy.KeyItems[CB_base_yy.ItemIndex];
                     ParamByName('paycl'     ).AsString := ED_paycl.Text;
                     ParamByName('paycl_name').AsString := ED_paycl_name.Text;
                     ParamByName('req_score' ).AsFloat  := NE_req_score.Value;
                     ParamByName('opt_score' ).AsFloat  := NE_opt_score.Value;
                     ParamByName('tot_score' ).AsFloat  := NE_tot_score.Value;
                     ParamByName('writeman'  ).AsString := GSEmpno;
                     ExecSQL;
                     MessageDlg('교육이수 기준이 추가되었습니다',mtInformation, [mbOk ],0) ;
               end
               else if NoteBook1.ActivePage = 'P_2' then
               begin
                    Close;
                    SQL.Clear;
                    SQL.Add('insert into pedu2type ( edu_type,                              ');
                    SQL.Add('                        edu_name,                              ');
                    SQL.Add('                        req_yn,                                ');
                    SQL.Add('                        edu_group_cd,                          ');
                    SQL.Add('                        edu_pass_type,                         ');
                    SQL.Add('                        remark,                                ');
                    SQL.Add('                        writetime,                             ');
                    SQL.Add('                        writeman )                             ');
                    SQL.Add('               values (:edu_type,                              ');
                    SQL.Add('                       :edu_name,                              ');
                    SQL.Add('                       :req_yn,                                ');
                    SQL.Add('                       :edu_group_cd,                          ');
                    SQL.Add('                       :edu_pass_type,                         ');
                    SQL.Add('                       :remark,                                ');
                    SQL.Add('                       to_char(sysdate, ''yyyymmddhh24miss''), ');
                    SQL.Add('                       :writeman)                              ');

                    ParamByName('edu_type'     ).AsString := ED_edu_type.Text;
                    ParamByName('edu_name'     ).AsString := ED_edu_name.Text;
                    ParamByName('req_yn'       ).AsString := CB_req_yn.Text;
                    ParamByName('edu_group_cd' ).AsString := ED_edu_group_cd.Text;
                    ParamByName('edu_pass_type').AsString := ED_edu_pass_type.Text;
                    ParamByName('remark'       ).AsString := ED_remark.Text;
                    ParamByName('writeman'     ).AsString := GSEmpno;

                    ExecSQL;
                    MessageDlg('교육유형 코드가 추가되었습니다',mtInformation, [mbOk ],0) ;
               end;
          end
          else if JobMode ='U' then
          begin
               if NoteBook1.ActivePage = 'P_1' then
               begin
                    Close;
                    SQL.Clear;
                    SQL.Add('update pedu2base set req_score  = :req_score ,                            ');
                    SQL.Add('                     opt_score  = :opt_score ,                            ');
                    SQL.Add('                     tot_score  = :tot_score ,                            ');
                    SQL.Add('                     writetime  = to_char(sysdate, ''yyyymmddhh24miss''), ');
                    SQL.Add('                     writeman   = :writeman                               ');
                    SQL.Add('where base_yy = :base_yy                                                  ');
                    SQL.Add('  and paycl   = :paycl                                                    ');

                    ParamByName('base_yy'  ).AsString := CB_base_yy.KeyItems[CB_base_yy.ItemIndex];
                    ParamByName('paycl'    ).AsString := ED_paycl.Text;
                    ParamByName('req_score').AsFloat  := NE_req_score.Value;
                    ParamByName('opt_score').AsFloat  := NE_opt_score.Value;
                    ParamByName('tot_score').AsFloat  := NE_tot_score.Value;
                    ParamByName('writeman' ).AsString := GSEmpno;

                    ExecSQL;
                    MessageDlg('교육이수 기준이 수정되었습니다',mtInformation, [mbOk ],0) ;
               end
               else if NoteBook1.ActivePage = 'P_2' then
               begin
                    Close;
                    SQL.Clear;
                    SQL.Add('update pedu2type set edu_name      = :edu_name ,                             ');
                    SQL.Add('                     req_yn        = :req_yn ,                               ');
                    SQL.Add('                     edu_group_cd  = :edu_group_cd ,                         ');
                    SQL.Add('                     edu_pass_type = :edu_pass_type ,                        ');
                    SQL.Add('                     remark        = :remark ,                               ');
                    SQL.Add('                     writetime     = to_char(sysdate, ''yyyymmddhh24miss''), ');
                    SQL.Add('                     writeman      = :writeman                               ');
                    SQL.Add('where edu_type = :edu_type                                                   ');

                    ParamByName('edu_type'     ).AsString := ED_edu_type.Text;
                    ParamByName('edu_name'     ).AsString := ED_edu_name.Text;
                    ParamByName('req_yn'       ).AsString := CB_req_yn.Text;
                    ParamByName('edu_group_cd' ).AsString := ED_edu_group_cd.Text;
                    ParamByName('edu_pass_type').AsString := ED_edu_pass_type.Text;
                    ParamByName('remark'       ).AsString := ED_remark.Text;
                    ParamByName('writeman'     ).AsString := GSEmpno;

                    ExecSQL;
                    MessageDlg('교육유형 코드가 수정되었습니다',mtInformation, [mbOk ],0) ;
               end
               else if NoteBook1.ActivePage = 'P_3' then
               begin
                    Close;
                    SQL.Clear;
                    SQL.Add('update pedu2his set orgnum        = :orgnum ,                               ');
                    SQL.Add('                    deptcode      = :deptcode ,                             ');
                    SQL.Add('                    teamcode      = :teamcode ,                             ');
                    SQL.Add('                    payra         = :payra ,                                ');
                    SQL.Add('                    paycl         = :paycl ,                                ');
                    SQL.Add('                    kpiyn         = :kpiyn ,                                ');
                    SQL.Add('                    exmark        = :exmark ,                               ');
                    SQL.Add('                    writetime     = to_char(sysdate, ''yyyymmddhh24miss''), ');
                    SQL.Add('                    writeman      = :writeman                               ');
                    SQL.Add('where base_yy       = :base_yy                                              ');
                    SQL.Add('  and empno         = :empno                                                ');

                    ParamByName('orgnum'  ).AsString := GSorgnum;
                    ParamByName('deptcode').AsString := Copy(ED_deptcode_h.Text,1,5);
                    ParamByName('teamcode').AsString := Copy(ED_teamcode_h.Text,1,5);
                    ParamByName('payra'   ).AsString := ED_payra_h.Codeno;
                    ParamByName('paycl'   ).AsString := Copy(ED_paycl_h.Text,1,3);
                    ParamByName('kpiyn'   ).AsString := CB_kpi.Text;
                    ParamByName('exmark'  ).AsString := ED_exmark.Text;
                    ParamByName('writeman').AsString := GSEmpno;
                    ParamByName('base_yy' ).AsString := CB_base_yy_h.KeyItems[CB_base_yy_h.ItemIndex];
                    ParamByName('empno'   ).AsString := ED_empno_h.empno;

                    ExecSQL;
                    MessageDlg('사원별 기초정보가 수정되었습니다',mtInformation, [mbOk ],0) ;
               end;
          end;
     end;

     BT_findClick(Sender);
     JobMode               := 'F';
     Set_InputField(False, False );
end;

procedure TMainForm.BT_cancelClick(Sender: TObject);
begin
     JobMode            := 'F';
     Set_InputField(False, True);
     Set_BtnEnable('N');
  
     if NoteBook1.ActivePage ='P_6' then BT_findClick(Sender);
end;

procedure TMainForm.BT_delClick(Sender: TObject);
begin
     if MessageDlg('삭제하시겠습니까?',mtConfirmation, [mbYes, mbNo ],0) <> mrYes then System.Exit;

     with Ora_Save do
     begin
          Close;
          SQL.Clear;

          if NoteBook1.ActivePage ='P_1' then
          begin
               SQL.Add('delete from pedu2base      ');
               SQL.Add(' where base_yy = :base_yy  ');
               SQL.Add('   and paycl   = :paycl    ');
               ParamByName('base_yy').AsString := CB_base_yy.KeyItems[CB_base_yy.ItemIndex];
               ParamByName('paycl').AsString   := ED_paycl.Text;
          end
          else if NoteBook1.ActivePage ='P_2' then
          begin
               SQL.Add('delete from pedu2type        ');
               SQL.Add(' where edu_type = :edu_type  ');
               ParamByName('edu_type').AsString := ED_edu_type.Text;
          end;

          ExecSQL;
     end;

     MessageDlg('삭제 되었습니다',mtInformation, [mbOk ],0) ;
     BT_findClick(Sender);
end;

procedure TMainForm.DS_Grid2DataChange(Sender: TObject; Field: TField);
begin
     with Ora_Grid2 do
     begin
          ED_edu_type.Text      := FieldByName('edu_type'     ).AsString;
          ED_edu_name.Text      := FieldByName('edu_name'     ).AsString;
          CB_req_yn.Text        := FieldByName('req_yn'       ).AsString;
          ED_edu_group_cd.Text  := FieldByName('edu_group_cd' ).AsString;
          ED_edu_pass_type.Text := FieldByName('edu_pass_type').AsString;
          ED_remark.Text        := FieldByName('remark'       ).AsString;
     end;

     if Trim(ED_edu_type.Text) = ''then Set_BtnEnable('N')
     else                               Set_BtnEnable('F');

end;

procedure TMainForm.ED_payclCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
     if CForm.Code <> '' then
     begin
          ED_paycl.Text      := CForm.Code;
          ED_paycl_name.Text := CForm.CodeName;
     end;

end;

procedure TMainForm.ED_payclInitPopup(Sender: TObject);
begin
     CForm.Edit          := TOnWinPopupEdit(Sender);
     TOnWinPopupEdit(Sender).PopupControl := CForm ;
end;

procedure TMainForm.ED_paycl_hCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
  if CForm.Code <> '' then ED_paycl_h.Text := CForm.Code + ' - ' + CForm.CodeName;
end;

procedure TMainForm.ED_empno_hKeyPress(Sender: TObject; var Key: Char);
begin
     if Key =#13 then
     begin
          ED_empno_h.PL_get_singledata;
          Set_InputField(False, True);
     end;
end;

procedure TMainForm.ED_empno_hCloseUp(Sender: TObject; var Value: String;
  var CloseAccept: Boolean);
begin
     Set_InputField(False, True);
end;

procedure TMainForm.BT_runClick(Sender: TObject);
var
     SQLStr, empno, baseyy : String;
     tot_count, tot_sc, req_sc, opt_sc, req_score, opt_score, tot_score : Double;
     TotalCount, ReadCount : Integer;
begin
     if (Trim(ED_emp_fr.Text) ='') or (Trim(ED_emp_to.Text) ='') then
     begin
          MessageDlg('계산 대상 사번 From/To를 정확히 입력하세요.', mtError, [mbOk], 0);
          System.Exit;
     end;

     if MessageDlg('인정Point 계산을 실행하시겠습니까?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then System.Exit;

     Gauge1.Visible  := True;
     Gauge1.Progress := 0;
     M_team.Visible  := False;

     baseyy := CB_base_yy_b.KeyItems[CB_base_yy_b.ItemIndex];
{
  SQLStr := Format('select  T.empno, T.tot_count, T.tot_sc, T.req_sc, T.opt_sc,                                            '+
                   '        decode( T.req_check, ''Y'',0,                                                                  '+
	           '        decode(greatest(T.req_score,B.tot_score), B.tot_score,T.req_score, B.tot_score) ) req_score,   '+
                   '        decode( T.req_check, ''Y'',0,                                                                  '+
                   '        decode(greatest(T.opt_score,B.opt_score), B.opt_score,T.opt_score, B.opt_score) ) opt_score,   '+
                   '        decode( T.req_check, ''Y'',0,                                                                  '+
                   '                decode( T.req_check, ''Y'',0,                                                          '+
	           '                decode(greatest(T.req_score,B.tot_score), B.tot_score,T.req_score, B.tot_score) ) +    '+
                   '                decode( T.req_check, ''Y'',0,                                                          '+
                   '                decode(greatest(T.opt_score,B.opt_score), B.opt_score,T.opt_score, B.opt_score) )      '+
                   '               ) tot_score                                                                             '+
                   '  from  pedu2his A,  pedu2base B,                                                                      '+
                   '        ( select  T.empno, max(T.req_check) req_check, sum(T.tot_count) tot_count,                     '+
                   '                  nvl(sum(T.score),0) tot_sc,                                                          '+
                   '                  nvl(sum(decode(T.req_yn, ''Y'',T.score)),0) req_sc,                                  '+
         	   '                  nvl(sum(decode(T.req_yn, ''N'',T.score)),0) opt_sc,                                  '+
         	   '	              nvl(sum(decode(T.req_yn, ''Y'',decode(A.max_score, NULL,T.score,                     '+
            	   '   	              decode(greatest(T.score,A.max_score), A.max_score,T.score, A.max_score))             '+
           	   '    	       )),0) req_score,                                                                    '+
         	   '                  nvl(sum(decode(T.req_yn, ''N'',decode(A.max_score, NULL,T.score,                     '+
            	   ' 	              decode(greatest(T.score,A.max_score), A.max_score,T.score, A.max_score))             '+
           	   '     	       )),0) opt_score                                                                     '+
                   '            from  pedu2limit A,                                                                        '+
                   '                 ( select  A.empno, count(1) tot_count, B.req_yn, nvl(B.limit_type,''한도없음'') limit_type, '+
                   '                           max(decode(B.req_yn||A.edu_pass_yn, ''YN'',''Y'')) req_check,               '+
                   '                           sum(A.edu_score) score                                                      '+
                   '                     from  pedu2item A,  pedu2type B                                                   '+
                   '                    where  A.base_yy = ''%s''                                                          '+
                   '                      and  A.empno between ''%s'' and ''%s''                                           '+
                   '                      and  B.edu_type = A.edu_type                                                     '+
                   '                   group by  A.empno, B.req_yn, nvl(B.limit_type,''한도없음'')                         '+
                   '                  ) T                                                                                  '+
                   '           where  A.limit_type(+) = T.limit_type                                                       '+
                   '           group by  T.empno                                                                           '+
                   '         ) T                                                                                           '+
                   'where A.base_yy = ''%s''                                                                               '+
                   '  and A.empno between ''%s'' and ''%s''                                                                '+
                   '  and A.empno   = T.empno                                                                              '+
                   '  and B.base_yy = A.base_yy                                                                            '+
                   '  and B.paycl   = A.paycl            ',
                   [baseyy, Copy(ED_emp_fr.Text,1,4), Copy(ED_emp_to.Text,1,4),
                    baseyy, Copy(ED_emp_fr.Text,1,4), Copy(ED_emp_to.Text,1,4)]);
}
//2005.1. 유효성 수정
// 기준: 필수:20 선택:10 총:30
// 이수: 필수:25 선택:10 총 35
// 인정Point: 필수:25 선택:5 총 30으로 계산한다...  위쿼리를 아래와 같이 수정
{     SQLStr := Format('select empno,                                                                                                        '+
                      '       tot_count,                                                                                                    '+
                      '       tot_sc,                                                                                                       '+
                      '       req_sc,                                                                                                       '+
                      '       opt_sc,                                                                                                       '+
	              '       req_score + decode(greatest(req_score+opt_score, base_tot),                                                   '+
                      '       req_score+opt_score, base_tot-req_score, opt_score) tot_score,                                                '+
	              '	      req_score,                                                                                                    '+
	              '	      decode(greatest(req_score+opt_score, base_tot),                                                               '+
                      '       req_score+opt_score, base_tot-req_score, opt_score) opt_score                                                 '+
	              'from ( select T.empno,                                                                                               '+
                      '              T.tot_count,                                                                                           '+
                      '              T.tot_sc,                                                                                              '+
                      '              T.req_sc,                                                                                              '+
                      '              T.opt_sc,                                                                                              '+
                      '              decode( T.req_check,''Y'',0,                                                                           '+
	              '                      decode(greatest(T.req_score,B.tot_score), B.tot_score,T.req_score,                             '+
                      '                                                                            B.tot_score)) req_score,                 '+
                      '              decode( T.req_check,''Y'',0,                                                                           '+
                      '                      decode(greatest(T.opt_score,B.opt_score), B.opt_score,T.opt_score,                             '+
                      '                                                                            B.opt_score)) opt_score,                 '+
                      '              decode( T.req_check,''Y'',0,                                                                           '+
                      '                      decode( T.req_check,''Y'',0,                                                                   '+
	              '                              decode(greatest(T.req_score,B.tot_score), B.tot_score,T.req_score,                     '+
                      '                                                                                    B.tot_score)) +                  '+
                      '                      decode( T.req_check,''Y'',0,                                                                   '+
                      '                              decode(greatest(T.opt_score,B.opt_score), B.opt_score,T.opt_score,                     '+
                      '                                                                                    B.opt_score))) tot_score,        '+
                      '              B.tot_score base_tot,                                                                                  '+
                      '              B.req_score base_req,                                                                                  '+
                      '              B.opt_score base_opt                                                                                   '+
                      '       from pedu2his A, pedu2base B,                                                                                 '+
                      '            ( select T.empno,                                                                                        '+
                      '                     max(T.req_check) req_check,                                                                     '+
                      '                     sum(T.tot_count) tot_count,                                                                     '+
                      '                     nvl(sum(T.score),0) tot_sc,                                                                     '+
                      '                     nvl(sum(decode(T.req_yn, ''Y'',T.score)),0) req_sc,                                             '+
                      '                     nvl(sum(decode(T.req_yn, ''N'',T.score)),0) opt_sc,                                             '+
                      '	                    nvl(sum(decode(T.req_yn, ''Y'',decode(A.max_score, NULL,T.score,                                '+
                      '                                                           decode(greatest(T.score,A.max_score),                     '+
                      '                                                                           A.max_score,T.score,                      '+
                      '                                                                                       A.max_score)))),0) req_score, '+
                      '                     nvl(sum(decode(T.req_yn, ''N'',decode(A.max_score, NULL,T.score,                                '+
                      ' 	                                                  decode(greatest(T.score,A.max_score),                     '+
                      '                                                                           A.max_score,T.score,                      '+
                      '                                                                                       A.max_score)))),0) opt_score  '+
                      '              from  pedu2limit A,                                                                                    '+
                      '                   ( select A.empno,                                                                                 '+
                      '                            count(1) tot_count,                                                                      '+
                      '                            B.req_yn,                                                                                '+
                      '                            nvl(B.limit_type,''한도없음'') limit_type,                                               '+
                      //2009.11.06 윤종준 매니저 요청 필수교육을 이수하지 않았어도 점수 계산되도록 수정  (''Y'' => '''')
                      //'                            max(decode(B.req_yn||A.edu_pass_yn, ''YN'',''Y'')) req_check,                            '+
                      '                            max(decode(B.req_yn||A.edu_pass_yn, ''YN'','''')) req_check,                             '+
                      '                            sum(A.edu_score) score                                                                   '+
                      '                     from pedu2item A,  pedu2type B                                                                  '+
                      '                     where A.base_yy = ''%s''                                                                        '+
                      '                       and A.empno between ''%s'' and ''%s''                                                         '+
                      '                       and B.edu_type = A.edu_type                                                                   '+
                      '                     group by  A.empno, B.req_yn, nvl(B.limit_type,''한도없음'')                                     '+
                      '                   ) T                                                                                               '+
                      '              where  A.limit_type(+) = T.limit_type                                                                  '+
                      '              group by  T.empno                                                                                      '+
                      '            ) T                                                                                                      '+
                      'where A.base_yy = ''%s''                                                                                             '+
                      '  and A.empno between ''%s'' and ''%s''                                                                              '+
                      '  and A.empno   = T.empno                                                                                            '+
                      '  and B.base_yy = A.base_yy                                                                                          '+
                      '  and B.paycl   = A.paycl )                                                                                          ',
                      [baseyy, Copy(ED_emp_fr.Text,1,4), Copy(ED_emp_to.Text,1,4),
                       baseyy, Copy(ED_emp_fr.Text,1,4), Copy(ED_emp_to.Text,1,4)]);
}
//2010.5. 유효성 수정
// 인정Point: 5001과정 이수했을 경우 제한포인트보다 큰 포인트가 들어가도록
     SQLStr := Format('select empno, tot_count+NCount tot_count, tot_sc+Nscore tot_sc, req_sc, opt_sc+Nscore opt_sc, '+
	              '       req_score + decode(greatest(req_score+opt_score, base_tot), '+
                      '       req_score+opt_score, base_tot-req_score, opt_score) + Nscore tot_score, req_score, '+
	              '	      decode(greatest(req_score+opt_score, base_tot), '+
                      '       req_score+opt_score, base_tot-req_score, opt_score) + Nscore opt_score '+
	              'from ( select T.empno, T.tot_count, T.tot_sc, T.req_sc, T.opt_sc, '+
                      '              decode( T.req_check,''Y'',0, '+
	              '                      decode(greatest(T.req_score,B.tot_score), B.tot_score,T.req_score, B.tot_score)) req_score, '+
                      '              decode( T.req_check,''Y'',0, '+
                      '                      decode(greatest(T.opt_score,B.opt_score), B.opt_score,T.opt_score, B.opt_score)) opt_score, '+
                      '              decode( T.req_check,''Y'',0, decode( T.req_check,''Y'',0, '+
	              '                      decode(greatest(T.req_score,B.tot_score), B.tot_score,T.req_score, B.tot_score)) + '+
                      '              decode( T.req_check,''Y'',0, '+
                      '                      decode(greatest(T.opt_score,B.opt_score), B.opt_score,T.opt_score, B.opt_score))) tot_score, '+
                      '              B.tot_score base_tot, B.req_score base_req, B.opt_score base_opt '+
                      '           , (select Nvl(sum(Edu_score),0) from pedu2item where base_yy= a.base_yy and EDU_TYPE IN (''5004'',''8004'') '+
                      '                                                            and EDU_PASS_YN = ''Y'' and empno =a.empno) NScore '+
		      '	          , (select Nvl(Count(1),0) from pedu2item where base_yy= a.base_yy and EDU_TYPE IN (''5004'', ''8004'') '+
                      '                                                      and EDU_PASS_YN = ''Y'' and empno =a.empno) NCount '+
                      '       from pedu2his A, pedu2base B, '+
                      '            ( select T.empno, max(T.req_check) req_check, sum(T.tot_count) tot_count, nvl(sum(T.score),0) tot_sc,    '+
                      '                     nvl(sum(decode(T.req_yn, ''Y'',T.score)),0) req_sc, '+
                      '                     nvl(sum(decode(T.req_yn, ''N'',T.score)),0) opt_sc, '+
                      '	                    nvl(sum(decode(T.req_yn, ''Y'',decode(A.max_score, NULL,T.score, '+
                      '                             decode(greatest(T.score,A.max_score), A.max_score,T.score,A.max_score)))),0) req_score, '+
                      '                     nvl(sum(decode(T.req_yn, ''N'',decode(A.max_score, NULL,T.score, '+
                      ' 	                    decode(greatest(T.score,A.max_score), A.max_score,T.score,A.max_score)))),0) opt_score  '+
                      '              from  pedu2limit A, '+
                      '                   ( select A.empno, count(1) tot_count, B.req_yn, nvl(B.limit_type,''한도없음'') limit_type, '+
                      //2009.11.06 윤종준 매니저 요청 필수교육을 이수하지 않았어도 점수 계산되도록 수정  (''Y'' => '''')
                      //'                            max(decode(B.req_yn||A.edu_pass_yn, ''YN'',''Y'')) req_check,
                      '                            max(decode(B.req_yn||A.edu_pass_yn, ''YN'','''')) req_check, sum(A.edu_score) score '+
                      '                     from pedu2item A,  pedu2type B '+
                      '                     where A.base_yy = ''%s'' and A.empno between ''%s'' and ''%s'' and B.edu_type = A.edu_type '+
                      '                       and (A.edu_type <> ''5004'' OR A.edu_type <> ''8004'') '+
                      '                       AND A.edu_type NOT IN (''3001'', ''5001'', ''5002'', ''5003'') '+
                      '                     group by  A.empno, B.req_yn, nvl(B.limit_type,''한도없음'') '+
                      '                   UNION ALL '+
                      //2012. 윤종준 매니저 요청 교육코드 5001, 5002, 5003의 합의 30 이 넘으면 30으로
                      //2014.08.07 윤종준 매니저 요청 3001 추가
                      '                     select empno, TOT_COUNT, REQ_YN, LIMIT_TYPE, REQ_CHECK, '+
                      '                            CASE WHEN score > 30 THEN 30 ELSE score END SCORE FROM ( '+
                      '                     select A.empno, count(1) tot_count, B.req_yn, nvl(B.limit_type,''한도없음'') limit_type, '+
                      '                            max(decode(B.req_yn||A.edu_pass_yn, ''YN'','''')) req_check, sum(A.edu_score) score '+
                      '                     from pedu2item A,  pedu2type B '+
                      '                     where A.base_yy = ''%s'' and A.empno between ''%s'' and ''%s'' and B.edu_type = A.edu_type '+
                      '                       and (A.edu_type <> ''5004'' OR A.edu_type <> ''8004'') '+
                      '                       AND A.edu_type IN (''3001'', ''5001'', ''5002'', ''5003'') '+
                      '                     group by  A.empno, B.req_yn, nvl(B.limit_type,''한도없음''))) T '+
                      '              where  A.limit_type(+) = T.limit_type '+
                      '              group by  T.empno '+
                      '            ) T '+
                      'where A.base_yy = ''%s'' '+
                      '  and A.empno between ''%s'' and ''%s'' '+
                      '  and A.empno   = T.empno  '+
                      '  and B.base_yy = A.base_yy  '+
                      '  and B.paycl   = A.paycl ) ',
                      [baseyy, Copy(ED_emp_fr.Text,1,4), Copy(ED_emp_to.Text,1,4),
                       baseyy, Copy(ED_emp_fr.Text,1,4), Copy(ED_emp_to.Text,1,4),
                       baseyy, Copy(ED_emp_fr.Text,1,4), Copy(ED_emp_to.Text,1,4)]);
     Try
          Ora_Session.StartTransaction;

          with Ora_Qry1 do
          begin
               Close;
               SQL.Text := SQLStr;
               Open;
          end;

          TotalCount  := Ora_Qry1.RecordCount;
          ReadCount   := 0;
          Ora_Qry1.First;

          while not Ora_Qry1.eof do
          begin
               empno      := Ora_Qry1.FieldByName('empno').AsString;
               tot_count  := Ora_Qry1.FieldByName('tot_count').AsFloat;
               tot_sc     := Ora_Qry1.FieldByName('tot_sc').AsFloat;
               req_sc     := Ora_Qry1.FieldByName('req_sc').AsFloat;
               opt_sc     := Ora_Qry1.FieldByName('opt_sc').AsFloat;
               tot_score  := Ora_Qry1.FieldByName('tot_score').AsFloat;
               req_score  := Ora_Qry1.FieldByName('req_score').AsFloat;
               opt_score  := Ora_Qry1.FieldByName('opt_score').AsFloat;

               Ora_Save.Close;
               Ora_Save.SQL.Text := Format('update pedu2his M        '+
                                           '   set tot_count = %f,   '+
                                           '       tot_sc    = %f,   '+
                                           '       req_sc    = %f,   '+
                                           '       opt_sc    = %f,   '+
                                           '       tot_score = %f,   '+
                                           '       req_score = %f,   '+
                                           '       opt_score = %f,   '+
                                           '       writetime = to_char(sysdate, ''yyyymmddhh24miss''), '+
                                           '       writeman  = ''%s'' '+
                                           ' where M.base_yy = ''%s'''+
                                           '   and M.empno   = ''%s''',
                                           [tot_count, tot_sc, req_sc, opt_sc, tot_score, req_score, opt_score,
                                            GSempno, baseyy, empno]);
               Ora_Save.ExecSQL;
               inc(ReadCount);
               Application.ProcessMessages;

               Gauge1.Progress := Round((ReadCount / TotalCount) * 90) ;
               Ora_Qry1.Next;
          end;

          //2005.1.12. 유효성 수정--> 팀KPI를 계산하는 방법 변경 : PEDU2HIS의 사원정보를 기준으로 PEDU2TEAM을 생성한다.
          //교육이수 팀 이력 update 배치
          SQLStr := 'delete from pedu2team '+
                    ' where base_yy = '''+baseyy+'''' ;

          with Ora_Save do
          begin
               Close;
               SQL.Text := SQLStr;
               ExecSQL;
         end;

{    SQLStr := Format('insert into pedu2team                                     '+
                     '(base_yy,   orgnum,    teamcode,  team_empno, team_count, '+
                     ' tot_sc,    avg_sc,    tot_score, avg_score,  kpi_grade, writetime,  writeman)   '+
                     '(select a.base_yy,  a.orgnum, a.teamcode, null team_empno, count(*),             '+
                     '        sum(a.tot_sc) tot_sc, ceil(avg(a.tot_sc) * 10)/10 avg_sc,                '+
                     '        sum(a.tot_score) tot_score, ceil(avg(a.tot_score) * 10)/10 avg_score,    '+
                     '        null kpi_grade, to_char(sysdate, ''yyyymmddhh24miss''), ''%s''           '+
                     '   from pedu2his a, pimpmas b        '+
                     '  where a.base_yy   = ''%s''         '+
                     '    and a.empno     = b.empno        '+
//                     '    and a.paycl    <= ''99''         '+    //팀 kpi는 특정직까지만 계산한다.
//                     '    and b.pstate   < ''80''          '+    //2004.11.23. 퇴사자 제외
                     '    and nvl(a.kpiyn,''Y'')  = ''Y''  '+
                     '  group by a.base_yy, a.orgnum, a.teamcode ) ',[GSempno, baseyy]);
}

          SQLStr := Format('insert into pedu2team                                     '+
                           '(base_yy,   orgnum,    teamcode,  team_empno, team_count, '+
                           ' tot_sc,    avg_sc,    tot_score, avg_score,  kpi_grade, writetime,  writeman)   '+
                           '(select a.base_yy,  a.orgnum, a.teamcode, null team_empno, count(*),             '+
                           '        sum(a.tot_sc) tot_sc, ceil(avg(a.tot_sc) * 10)/10 avg_sc,                '+
                           '        sum(a.tot_score) tot_score, ceil(avg(a.tot_score) * 10)/10 avg_score,    '+
                           '        null kpi_grade, to_char(sysdate, ''yyyymmddhh24miss''), ''%s''           '+
                           '   from pedu2his a                   '+
                           '  where a.base_yy   = ''%s''         '+
                           '    and nvl(a.kpiyn,''Y'')  = ''Y''  '+
                           '  group by a.base_yy, a.orgnum, a.teamcode ) ',[GSempno, baseyy]);

          with Ora_Save do
          begin
               Close;
               SQL.Text := SQLStr;
               ExecSQL;
          end;

          Gauge1.Progress := 95 ;
          Application.ProcessMessages;
      {
          SQLStr := 'update pedu2team a                                         '+
                    '   set (team_empno) =                                      '+
                    '       (select b.empno                                     '+
                    '          from pihorga b                                   '+
                    '         where a.orgnum   = b.orgnum                       '+
                    '           and a.teamcode = b.deptcode                     '+
                    '           and b.orgym = (select value1 from pimvari       '+
                    '                           where gubun = ''B2''            '+
                    '                             and sgubun =''0000'')         '+
                    '           and b.gubun =''0''                              '+
                    '           and b.payrayn = ''Y'')                          '+
                    '  where base_yy = '''+ baseyy +''' ';
      }
        if copy(GSsysdate,1,8) < payrachdate then
          SQLStr := 'select a.teamcode, b.deptname           '+
                    '  from pedu2his a, pycdept b, pimpmas c '+
                    ' where a.orgnum   = b.orgnum            '+
                    '   and a.teamcode = b.deptcode          '+
                    '   and a.empno    = c.empno             '+
                    '   and a.orgnum   = c.orgnum            '+
                    '   and c.pstate   < ''80''              '+
                    '   and a.paycl    = ''0C''              '+
                    '   and a.base_yy  = '''+ baseyy +'''    '+
                    ' group by a.teamcode, b.deptname        '+
                    ' having count(*) > 1                    '
        else
          SQLStr := 'select a.teamcode, b.deptname           '+
                    '  from pedu2his a, pycdept b, pimpmas c '+
                    ' where a.orgnum   = b.orgnum            '+
                    '   and a.teamcode = b.deptcode          '+
                    '   and a.orgnum   = c.orgnum            '+
                    '   and a.empno    = c.empno             '+
                    '   and c.pstate   < ''80''              '+
                    '   and a.paycl    = ''C00''             '+
                    '   and a.base_yy  = '''+ baseyy +'''    '+
                    ' group by a.teamcode, b.deptname        '+
                    ' having count(*) > 1                    ';

          with Ora_Qry1 do
          begin
               Close;
               SQL.Text := SQLStr;
               Open;
          end;

          if Ora_Qry1.RecordCount > 0 then
          begin
               MessageDlg('동일팀에 팀장이 2명 이상입니다.확인하고 작업하세요..', mtError, [mbOk], 0);

               M_team.Visible := True;
               M_team.Lines.Clear;
               while not Ora_Qry1.Eof do
               begin
                    M_team.Lines.Add(Ora_Qry1.FieldByName('teamcode').AsString +':'+Ora_Qry1.FieldByName('deptname').AsString);
                    Ora_Qry1.Next;
               end;

               Ora_Session.Rollback;
               System.Exit;
          end;

        if copy(GSsysdate,1,8) < payrachdate then
          SQLStr := 'update pedu2team a                      '+
                    '   set (team_empno) =                   '+
                    '       (select b.empno                  '+
                    '          from pedu2his b, pimpmas c    '+
                    '         where a.base_yy = b.base_yy    '+
                    '           and a.orgnum = b.orgnum      '+
                    '           and b.empno = c.empno        '+
                    '           and a.teamcode = b.teamcode  '+
                    '           and c.pstate < ''80''        '+
                    '           and b.paycl =''0C'')         '+
                    ' where base_yy = '''+ baseyy +'''       '
        else
          SQLStr := 'update pedu2team a                      '+
                    '   set (team_empno) =                   '+
                    '       (select b.empno                  '+
                    '          from pedu2his b, pimpmas c    '+
                    '         where a.base_yy = b.base_yy    '+
                    '           and a.orgnum = b.orgnum      '+
                    '           and b.empno = c.empno        '+
                    '           and a.teamcode = b.teamcode  '+
                    '           and c.pstate < ''80''        '+
                    '           and b.paycl =''C00'')        '+
                    ' where base_yy = '''+ baseyy +'''       ';

          with Ora_Save do
          begin
               Close;
               SQL.Text := SQLStr;
               ExecSQL;
          end;


          Gauge1.Progress := 97 ;
          Application.ProcessMessages;

          SQLStr := 'update pedu2team                                                   '+
                    '   set kpi_grade = decode(sign(avg_score - 109.9), +1, ''S'',      '+
                    '                   decode(sign(avg_score - 99.9),  +1, ''A'',      '+
                    '                   decode(sign(avg_score - 89.9),  +1, ''B'',      '+
                    '                   decode(sign(avg_score - 79.9),  +1, ''C'',      '+
                    '                   decode(sign(avg_score - 69.9),  +1, ''D'')))))  '+
                    '  where base_yy = '''+ baseyy +''' ';

          with Ora_Save do
          begin
               Close;
               SQL.Text := SQLStr;
               ExecSQL;
          end;

          Ora_Session.Commit;
          Gauge1.Progress := 100;
          MessageDlg('인정Point 계산이 완료되었습니다', mtInformation, [mbOk], 0) ;
          Gauge1.Visible  := False;

     Except
          on E: EDatabaseError do
          begin
               MessageBox(handle,PChar(E.Message),'에  러',MB_OK or $0010);
               Ora_Session.Rollback;
               Abort;
          end;
     end;
end;

procedure TMainForm.ED_emp_frKeyPress(Sender: TObject; var Key: Char);
begin
     if Key =#13 then ED_emp_fr.PL_get_singledata;
end;

procedure TMainForm.ED_emp_toKeyPress(Sender: TObject; var Key: Char);
begin
     if Key =#13 then ED_emp_to.PL_get_singledata;
end;

procedure TMainForm.BT_FindDiffClick(Sender: TObject);
var
     baseyy, SQLStr : String;
begin
     baseyy := CB_base_yy_e.KeyItems[CB_base_yy_e.ItemIndex];
  if copy(GSsysdate,1,8) < payrachdate then
     SQLStr := 'select a.empno,          a.korname,                           '+
               '       a.deptcode        insa_dept,                           '+
               '       d1.deptname       insa_deptnm,                         '+
               '       a.payra           insa_payra,                          '+
               '       ra1.codename      insa_payranm,                        '+
               '       decode(a.payra, ''2C'', ''0C'', a.paycl) insa_paycl,   '+
               '       cl1.paycl_name    insa_payclnm,                        '+
               '       b.deptcode        edu_dept,                            '+
               '       d2.deptname       edu_deptnm,                          '+
               '       b.payra           edu_payra,                           '+
               '       ra2.codename      edu_payranm,                         '+
               '       b.paycl           edu_paycl,                           '+
               '       cl2.paycl_name    edu_payclnm,                         '+
               '       decode(FINDHIRE(a.empno),''P'',''N:비정규직'',''Q'',''N:비정규직'', ''J'',''N:비정규직'',''Y'',''N:비정규직'',  '+
               '       decode(greatest(nvl(a.cardate, a.empdate),'''+baseyy+'||1002''), nvl(a.cardate, a.empdate), ''N:신규입사자 '',    '+
               '       decode(a.pstate,''10'',''Y'',''21'',''Y'',decode(substr(a.pstate,1,1),''2'',''N:파견'',''3'',''N:파견'',''7'',''N:휴직'',''4'',''N:징계'',''6'',''N:징계'',''N:퇴사'')))) insa_kpi, '+
               '       decode(b.kpiyn,''N'', b.kpiyn||'':''||b.exmark ,''Y'') edu_kpi '+
               '  from pimpmas a, pedu2his b, pedu2base cl1, pedu2base cl2,         '+
               '       pyccode ra1,                                                 '+
               '       pyccode ra2,                                                 '+
               '       (select orgnum , deptcode, deptname                          '+
               '          from pycdept) d1,                                         '+
               '       (select orgnum , deptcode, deptname                          '+
               '          from pycdept) d2                                          '+
               ' where a.empno     = b.empno                                        '+
               '   and b.base_yy   = '''+ baseyy +'''                               '+
               '   and cl1.base_yy = '''+ baseyy +'''                               '+
               '   and cl1.paycl   = decode(a.payra, ''2C'', ''0C'',  a.paycl)      '+
               '   and cl2.base_yy = '''+ baseyy +'''                               '+
               '   and cl2.paycl   = b.paycl                                        '+
               '   and ra1.codeid(+)  = ''I113''                                    '+
               '   and a.payra     = ra1.codeno(+)                                  '+
               '   and ra2.codeid(+)  = ''I113''                                    '+
               '   and b.payra     = ra2.codeno(+)                                  '+
               '   and a.orgnum    = d1.orgnum                                      '+
               '   and a.deptcode  = d1.deptcode                                    '+
               '   and b.orgnum    = d2.orgnum                                      '+
               '   and b.deptcode  = d2.deptcode                                    '+
               '   and ( a.orgnum <> b.orgnum                                       '+
               '    or   a.deptcode <> b.deptcode                                   '+
               '    or   a.payra <> b.payra                                         '+
               '    or   decode(a.payra, ''2C'',''0C'', a.paycl) <> b.paycl         '+
   //////
               '    or   decode(FINDHIRE(a.empno),''P'',''N'',''Q'',''N'', ''J'',''N'',''Y'',''N'',   '+
               '         decode(greatest(nvl(a.cardate, a.empdate),'''+baseyy+'||1002''),nvl(a.cardate, a.empdate),''N'',  '+
               '                                                                         decode(a.pstate,''10'',''Y'',''21'',''Y'',''N''))) <>  nvl(b.kpiyn, ''Y'') '+
    //////
               '       )    '
  else
     SQLStr := 'select a.empno,          a.korname,                           '+
               '       a.deptcode        insa_dept,                           '+
               '       d1.deptname       insa_deptnm,                         '+
               '       a.payra           insa_payra,                          '+
               '       ra1.codename      insa_payranm,                        '+
               '       decode(a.payra, ''C11'', ''C00'', a.paycl) insa_paycl, '+
               '       cl1.paycl_name    insa_payclnm,                        '+
               '       b.deptcode        edu_dept,                            '+
               '       d2.deptname       edu_deptnm,                          '+
               '       b.payra           edu_payra,                           '+
               '       ra2.codename      edu_payranm,                         '+
               '       b.paycl           edu_paycl,                           '+
               '       cl2.paycl_name    edu_payclnm,                         '+
               '       decode(FINDHIRE(a.empno),''P'',''N:비정규직'',''Q'',''N:비정규직'', ''J'',''N:비정규직'',''Y'',''N:비정규직'',  '+
               '       decode(greatest(nvl(a.cardate, a.empdate),'''+baseyy+'||1002''), nvl(a.cardate, a.empdate), ''N:신규입사자 '',    '+
               '       decode(a.pstate,''10'',''Y'',''21'',''Y'',decode(substr(a.pstate,1,1),''2'',''N:파견'',''3'',''N:파견'',''7'',''N:휴직'',''4'',''N:징계'',''6'',''N:징계'',''N:퇴사'')))) insa_kpi, '+
               '       decode(b.kpiyn,''N'', b.kpiyn||'':''||b.exmark ,''Y'') edu_kpi '+
               '  from pimpmas a, pedu2his b, pedu2base cl1, pedu2base cl2,         '+
               '       pyccode ra1,                                                 '+
               '       pyccode ra2,                                                 '+
               '       (select orgnum , deptcode, deptname                          '+
               '          from pycdept) d1,                                         '+
               '       (select orgnum , deptcode, deptname                          '+
               '          from pycdept) d2                                          '+
               ' where a.empno     = b.empno                                        '+
               '   and b.base_yy   = '''+ baseyy +'''                               '+
               '   and cl1.base_yy = '''+ baseyy +'''                               '+
               '   and cl1.paycl   = decode(a.payra, ''C11'', ''C00'',  a.paycl)      '+
               '   and cl2.base_yy = '''+ baseyy +'''                               '+
               '   and cl2.paycl   = b.paycl                                        '+
               '   and ra1.codeid(+)  = ''I113''                                    '+
               '   and a.payra     = ra1.codeno(+)                                  '+
               '   and ra2.codeid(+)  = ''I113''                                    '+
               '   and b.payra     = ra2.codeno(+)                                  '+
               '   and a.orgnum    = d1.orgnum                                      '+
               '   and a.deptcode  = d1.deptcode                                    '+
               '   and b.orgnum    = d2.orgnum                                      '+
               '   and b.deptcode  = d2.deptcode                                    '+
               '   and ( a.orgnum <> b.orgnum                                       '+
               '    or   a.deptcode <> b.deptcode                                   '+
               '    or   a.payra <> b.payra                                         '+
               '    or   decode(a.payra, ''C11'',''C00'', a.paycl) <> b.paycl         '+
   //////
               '    or   decode(FINDHIRE(a.empno),''P'',''N'',''Q'',''N'', ''J'',''N'',''Y'',''N'',   '+
               '         decode(greatest(nvl(a.cardate, a.empdate),'''+baseyy+'||1002''),nvl(a.cardate, a.empdate),''N'',  '+
               '                                                                         decode(a.pstate,''10'',''Y'',''21'',''Y'',''N''))) <>  nvl(b.kpiyn, ''Y'') '+
    //////
               '       )    ';

      with Ora_Grid3 do
        begin
          Close;
          SQL.Text := SQLStr;
          Open;
        end;

end;

procedure TMainForm.Grid3ApplyCellAttribute(Sender: TObject; Field: TField;
  Canvas: TCanvas; Rect: TRect; State: TGridDrawState);
begin
     if (Field.FieldName = 'INSA_DEPTNM' ) or (Field.FieldName = 'EDU_DEPTNM' ) then Canvas.Brush.Color := $00FEB4E8;
     if (Field.FieldName = 'INSA_PAYRANM') or (Field.FieldName = 'EDU_PAYRANM') then Canvas.Brush.Color := $008EC7FF;
     if (Field.FieldName = 'INSA_PAYCLNM') or (Field.FieldName = 'EDU_PAYCLNM') then Canvas.Brush.Color := $00CAD3C0;
     if (Field.FieldName = 'INSA_KPI'    ) or (Field.FieldName = 'EDU_KPI'    ) then Canvas.Brush.Color := $00B3FFFF;
end;

procedure TMainForm.BT_AllSaveClick(Sender: TObject);
var
     baseyy : String;
begin
     if MessageDlg('인사자료로 일괄갱신 하시겠습니까? ',mtConfirmation, [mbYes,mbNo] ,0) <> mrYes then System.Exit;

     baseyy := CB_base_yy_e.KeyItems[CB_base_yy_e.ItemIndex];
     with Ora_Save do
     begin
          Close;
          SQL.Clear;
          //      SQL.Add('update pedu2his a                                    ');
          //      SQL.Add('  set (orgnum, deptcode, teamcode, payra, paycl)     ');
          //      SQL.Add('   =  (select b.orgnum, b.deptcode,                   ');
          //      SQL.Add('              decode(c.deptlevel, ''E0'', c.extcode, c.deptcode ) teamcode, ');
          //      SQL.Add('              b.payra,  decode(b.payra, ''2C'', ''0C'', b.paycl) paycl      ');
          //      SQL.Add('         from pimpmas b, pycdept c         ');
          //      SQL.Add('        where a.base_yy  = '''+baseyy+''' ');
          //      SQL.Add('          and a.empno    = b.empno         ');
          //      SQL.Add('          and b.orgnum   = c.orgnum        ');
          //      SQL.Add('          and b.deptcode = c.deptcode )    ');
          //      SQL.Add(' where a.base_yy = '''+baseyy+'''           ');
          //2005.1.11.
          //      SQL.Add('update pedu2his a                                    ');
          //      SQL.Add('  set (orgnum, deptcode, teamcode)                   ');
          //      SQL.Add('   =  (select b.orgnum, b.deptcode,                  ');
          //      SQL.Add('              decode(c.deptlevel, ''E0'', c.extcode, c.deptcode ) teamcode  ');
          SQL.Add('update pedu2his a                                                                          ');
          SQL.Add('  set (orgnum, deptcode, teamcode, payra, paycl, kpiyn, exmark)                            ');
          SQL.Add('   =  (select b.orgnum, b.deptcode,                                                        ');
          SQL.Add('              decode(c.deptlevel, ''E0'', c.extcode, c.deptcode ) teamcode,                ');
       if copy(GSsysdate,1,8) < payrachdate then
          SQL.Add('              b.payra, decode(b.payra, ''2C'',  ''0C'',  b.paycl) paycl,                   ')
       else
          SQL.Add('              b.payra, decode(b.payra, ''C11'', ''C00'', b.paycl) paycl,                   ');
          SQL.Add('              decode(FINDHIRE(a.empno),''P'',''N'',''Q'',''N'', ''J'',''N'',''Y'',''N'', ');
          SQL.Add('              decode(greatest(nvl(b.cardate, b.empdate),'''+baseyy+'||1002''), nvl(b.cardate, b.empdate), ''N'',   ');
          SQL.Add('              decode(b.pstate,''10'',''Y'',''21'',''Y'',decode(substr(b.pstate,1,1),''2'',''N'',''3'',''N'',''7'',''N'',''4'',''N'',''6'',''N'',''N'')))) kpiyn, ');
          SQL.Add('              decode(FINDHIRE(a.empno),''P'',''비정규직'',''Q'',''비정규직'', ''J'',''비정규직'',''Y'',''비정규직'',  ');
          SQL.Add('              decode(greatest(nvl(b.cardate, b.empdate),'''+baseyy+'||1002''), nvl(b.cardate, b.empdate), ''신규입사자 '',   ');
          SQL.Add('              decode(b.pstate,''10'',null,''21'',null,decode(substr(b.pstate,1,1),''2'',''파견'',''3'',''파견'',''7'',''휴직'',''4'',''징계'',''6'',''징계'',''퇴사'')))) exmark ');
          SQL.Add('         from pimpmas b, pycdept c                                                         ');
          SQL.Add('        where a.base_yy  = '''+baseyy+'''                                                  ');
          SQL.Add('          and a.empno    = b.empno                                                         ');
          SQL.Add('          and b.orgnum   = c.orgnum                                                        ');
          SQL.Add('          and b.deptcode = c.deptcode )                                                    ');
          SQL.Add(' where a.base_yy = '''+baseyy+'''                                                          ');
          ExecSQL;
          MessageDlg('일괄갱신 되었습니다',mtInformation, [mbOk ],0) ;
     end;
end;

procedure TMainForm.CB_base_yy_eChange(Sender: TObject);
begin
     Ora_Grid3.Close;
end;

procedure TMainForm.CB_kpiChange(Sender: TObject);
begin
     if CB_kpi.Text ='N' then ED_exmark.Enabled := True
     else
     begin
          ED_exmark.Text := '';
          ED_exmark.Enabled := False
     end;
end;

procedure TMainForm.DS_Grid6DataChange(Sender: TObject; Field: TField);
var
     base_yy , orgnum, teamcode : String;
begin
     base_yy  := Ora_Grid6.FieldByName('base_yy').AsString;
     orgnum   := Ora_Grid6.FieldByName('orgnum').AsString;
     teamcode := Ora_Grid6.FieldByName('teamcode').AsString;

     with Ora_Qry1 do
     begin
          Close;
          SQL.Clear;
          SQL.Add('select a.base_yy, a.empno, b.korname,                         ');
          SQL.Add('       a.orgnum,  a.deptcode, c.deptname||'' ''||c.deptna3 deptname, a.teamcode, ');
          SQL.Add('       nvl(a.kpiyn,''Y'') kpiyn,  a.exmark,  d.codename payclname,               ');
          SQL.Add('       to_char(nvl(a.tot_score,0),''990.9'')||'' (''||to_char(nvl(a.tot_sc,0),''990.9'')||'')'' tot,      ');
          SQL.Add('       to_char(nvl(a.req_score,0),''990.9'')||'' (''||to_char(nvl(a.req_sc,0),''990.9'')||'')'' req,      ');
          SQL.Add('       to_char(nvl(a.opt_score,0),''990.9'')||'' (''||to_char(nvl(a.opt_sc,0),''990.9'')||'')'' opt       ');
          SQL.Add('  from pedu2his a, pimpmas b, pycdept c,             ');
       if copy(GSsysdate,1,8) < payrachdate then
          SQL.Add('      (select ''0C''  codeno, ''팀장'' codename      ')
       else
          SQL.Add('      (select ''C00'' codeno, ''팀장'' codename      ');
          SQL.Add('         from dual                                   ');
          SQL.Add('        union                                        ');
          SQL.Add('       select codeno, codename                       ');
          SQL.Add('         from pyccode d                              ');
          SQL.Add('        where codeid =''I112'') d                    ');
          SQL.Add(' where a.empno    = b.empno                          ');
          SQL.Add('   and a.orgnum   = c.orgnum                         ');
          SQL.Add('   and a.deptcode = c.deptcode                       ');
          SQL.Add('   and a.paycl    = d.codeno                         ');
          SQL.Add('   and a.base_yy  = :base_yy                         ');
          SQL.Add('   and a.orgnum   = :orgnum                          ');
          SQL.Add('   and a.teamcode = :teamcode                        ');
          SQL.Add(' order by a.deptcode, a.paycl                        ');
          ParamByName('base_yy').AsString  := base_yy;
          ParamByName('orgnum').AsString   := orgnum;
          ParamByName('teamcode').AsString := teamcode;
          Open;

          MD_Data.Close;
          MD_Data.Open;
          MD_Data.DisableControls;

          while not Ora_Qry1.Eof do
          begin
               MD_Data.Append;
               MD_Data.FieldByName('kpiyn').AsString     := FieldByName('kpiyn').AsString;
               MD_Data.FieldByName('exmark').AsString    := FieldByName('exmark').AsString;
               MD_Data.FieldByName('deptname').AsString  := FieldByName('deptname').AsString;
               MD_Data.FieldByName('payclname').AsString := FieldByName('payclname').AsString;
               MD_Data.FieldByName('empno').AsString     := FieldByName('empno').AsString;
               MD_Data.FieldByName('korname').AsString   := FieldByName('korname').AsString;
               MD_Data.FieldByName('tot').AsString       := FieldByName('tot').AsString;
               MD_Data.FieldByName('req').AsString       := FieldByName('req').AsString;
               MD_Data.FieldByName('opt').AsString       := FieldByName('opt').AsString;
               MD_Data.FieldByName('base_yy').AsString   := FieldByName('base_yy').AsString;
               MD_Data.FieldByName('chanyn').AsString    := '';

               MD_Data.Post;
               Ora_Qry1.Next;
          end;
     end;
     MD_Data.First;
     MD_Data.EnableControls;
end;

procedure TMainForm.OnDBGrid1EditChange(Sender: TOnJCustomDBGrid;
  AEditor: TOnCustomMaskEdit; const AText: String);
begin
     AEditor.MaxLength := 30;
     MD_Data.Edit;
     MD_Data.FieldByName('chanyn').AsString := 'Y';
end;

procedure TMainForm.ED_teamChange(Sender: TObject);
begin
     Ora_Grid6.Close;
     MD_Data.Close;
     L_teamnm.ValueCaption := '';
end;

procedure TMainForm.ED_teamInitPopup(Sender: TObject);
begin
     TeamForm.Edit         := TOnWinPopupEdit(Sender);
     TeamForm.E_condButtonClick(Sender,0);

     TOnWinPopupEdit(Sender).PopupControl := TeamForm ;
end;

procedure TMainForm.ED_teamCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
     if TeamForm.GSdeptcode <> '' then
     begin
          ED_team.Text            := TeamForm.GSdeptcode;
          L_teamnm.ValueCaption   := TeamForm.GSdeptname;
     end;
end;

procedure TMainForm.OnDBGrid1DrawCell(Sender: TObject;
  const ACell: TOnJCell; var BgColor, FontColor: TColor;
  var FStyle: TFontStyles);
begin
     if MD_Data.FieldByName('kpiyn').AsString = 'N' then BgColor := $00FEB4E8;
end;

procedure TMainForm.ED_deptcode_hCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
  if TeamForm.GSdeptcode <> '' then ED_deptcode_h.Text := TeamForm.GSdeptcode + ' - ' + TeamForm.GSdeptname;
end;

procedure TMainForm.ED_teamcode_hCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
  if TeamForm.GSdeptcode <> '' then ED_teamcode_h.Text := TeamForm.GSdeptcode + ' - ' + TeamForm.GSdeptname;
end;

procedure TMainForm.ED_deptcode_hInitPopup(Sender: TObject);
begin
  TeamForm.Edit := TOnWinPopupEdit(Sender);
  TOnWinPopupEdit(Sender).PopupControl := TeamForm ;
end;

procedure TMainForm.ED_teamcode_hInitPopup(Sender: TObject);
begin
  TeamForm.Edit := TOnWinPopupEdit(Sender);
  TOnWinPopupEdit(Sender).PopupControl := TeamForm ;
end;

end.
