unit pea1060a1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  pegradpanl, ExtCtrls, StdCtrls, Mask, pebtnedit, PeJeonLabel, DbTables, Db,
  peoutlookbtn, peNumedit, pedbutil, PeJeonMemo, Inifiles, kpaylib, Buttons,
  OnSkinBtn, OnEditBaseCtrl, OnEditStdCtrl, OnEditNumCtl;

type
  TFm_SubForm = class(TForm)
    Panel1: TPanel;
    Pa_Title: TPeJeonGrdPanel;
    PeJeonGrdPanel2: TPeJeonGrdPanel;
    Bt_Mod: TPeJeonOutLookBtn;
    Bt_Exit: TPeJeonOutLookBtn;
    Save_Dlg: TSaveDialog;
    Open_Dlg: TOpenDialog;
    Nt_Book: TNotebook;
    Label4: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Edb_foraim: TPePanelEdit;
    Edb_forweight: TPePanelNumEdit;
    Edb_validx: TPePanelEdit;
    Edb_propeltask: TPePanelEdit;
    Edb_valfunction: TPePanelEdit;
    Label1: TLabel;
    PeJeonLabel4: TPeJeonLabel;
    Eda_eprjview: TPeJeonMemo;
    Label3: TLabel;
    Label6: TLabel;
    eda_seqno: TPePanelEdit;
    eda_devitem: TPePanelEdit;
    eda_devmethod: TPePanelEdit;
    eda_devaim: TPePanelEdit;
    eda_demand: TPePanelEdit;
    GroupBox1: TPanel;
    Panel2: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    Label2: TLabel;
    Eda_propeltask: TOnEdit;
    Eda_Sresult1: TOnEdit;
    Eda_Aresult1: TOnEdit;
    Eda_B_result1: TOnEdit;
    Eda_Cresult1: TOnEdit;
    Eda_Dresult1: TOnEdit;
    Eda_plan1: TOnEdit;
    Eda_validx: TOnEdit;
    Eda_Bresult1: TOnEdit;
    Eda_foraim1: TOnEdit;
    GroupBox2: TPanel;
    Panel4: TPanel;
    Eda_Sresult2: TOnEdit;
    Eda_Aresult2: TOnEdit;
    Eda_B_result2: TOnEdit;
    Eda_Cresult2: TOnEdit;
    Eda_Dresult2: TOnEdit;
    Eda_plan2: TOnEdit;
    Eda_validx2: TOnEdit;
    Eda_Bresult2: TOnEdit;
    Eda_foraim2: TOnEdit;
    GroupBox3: TPanel;
    Panel6: TPanel;
    Eda_Sresult3: TOnEdit;
    Eda_Aresult3: TOnEdit;
    Eda_B_result3: TOnEdit;
    Eda_Cresult3: TOnEdit;
    Eda_Dresult3: TOnEdit;
    Eda_plan3: TOnEdit;
    Eda_validx3: TOnEdit;
    Eda_Bresult3: TOnEdit;
    Eda_foraim3: TOnEdit;
    GroupBox4: TPanel;
    Panel8: TPanel;
    Eda_Sresult4: TOnEdit;
    Eda_Aresult4: TOnEdit;
    Eda_B_result4: TOnEdit;
    Eda_Cresult4: TOnEdit;
    Eda_Dresult4: TOnEdit;
    Eda_plan4: TOnEdit;
    Eda_validx4: TOnEdit;
    Eda_Bresult4: TOnEdit;
    Eda_foraim4: TOnEdit;
    GroupBox5: TPanel;
    Panel16: TPanel;
    Eda_Sresult5: TOnEdit;
    Eda_Aresult5: TOnEdit;
    Eda_B_result5: TOnEdit;
    Eda_Cresult5: TOnEdit;
    Eda_Dresult5: TOnEdit;
    Eda_plan5: TOnEdit;
    Eda_validx5: TOnEdit;
    Eda_Bresult5: TOnEdit;
    Eda_foraim5: TOnEdit;
    Eda_detweight1: TOnNumberEdit;
    Eda_detweight2: TOnNumberEdit;
    Eda_detweight3: TOnNumberEdit;
    Eda_detweight4: TOnNumberEdit;
    Eda_detweight5: TOnNumberEdit;
    Eda_forweight: TOnNumberEdit;
    OnNum_weight: TOnNumberEdit;
    Panel3: TPanel;
    Label5: TLabel;
    Memo_Prjview: TMemo;
    PeJeonOutLookBtn1: TPeJeonOutLookBtn;
    OnSumWeight: TOnNumberEdit;
    Label11: TLabel;
    PeJeonLabel18: TPeJeonLabel;
    PeJeonLabel19: TPeJeonLabel;
    PeJeonLabel20: TPeJeonLabel;
    PeJeonLabel21: TPeJeonLabel;
    PeJeonLabel22: TPeJeonLabel;
    PeJeonLabel28: TPeJeonLabel;
    PeJeonLabel24: TPeJeonLabel;
    PeJeonLabel26: TPeJeonLabel;
    Label16: TLabel;
    PeJeonLabel23: TPeJeonLabel;
    Label18: TLabel;
    PeJeonLabel30: TPeJeonLabel;
    Label20: TLabel;
    PeJeonLabel31: TPeJeonLabel;
    Label23: TLabel;
    PeJeonLabel32: TPeJeonLabel;
    Label24: TLabel;
    PeJeonLabel35: TPeJeonLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    PeJeonLabel34: TPeJeonLabel;
    Label29: TLabel;
    Label30: TLabel;
    PeJeonLabel33: TPeJeonLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    PeJeonLabel29: TPeJeonLabel;
    Label19: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    PeJeonLabel27: TPeJeonLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    PeJeonLabel25: TPeJeonLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Pa_TitleMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Bt_ExitClick(Sender: TObject);
    procedure Bt_ModClick(Sender: TObject);
    procedure Eda_eprjviewKeyPress(Sender: TObject; var Key: Char);
    procedure Eda_eprjviewChange(Sender: TObject);
    procedure Edb_propeltaskExit(Sender: TObject);
    procedure Eda_eprjviewExit(Sender: TObject);
    procedure EditChangedKEditChangedKeyPresseyPress(Sender: TObject; var Key: Char);
    procedure Eda_Bresult1Click(Sender: TObject);
    procedure Eda_Bresult1Change(Sender: TObject);
    procedure Eda_Bresult2Click(Sender: TObject);
    procedure Eda_Bresult2Change(Sender: TObject);
    procedure Eda_Bresult3Click(Sender: TObject);
    procedure Eda_Bresult3Change(Sender: TObject);
    procedure Eda_Bresult4Click(Sender: TObject);
    procedure Eda_Bresult4Change(Sender: TObject);
    procedure Eda_Bresult5Click(Sender: TObject);
    procedure Eda_Bresult5Change(Sender: TObject);
    procedure Eda_detweight1Exit(Sender: TObject);
    procedure PeJeonOutLookBtn1Click(Sender: TObject);
  private
    { Private declarations }
    Start       : Boolean;
    detailweight: real;


    //function Check_Edit1 : Boolean;                 //관리직 입력 값 체크
    //function Check_Edit2 : Boolean;                 //영업직 입력 값 체크
    //function Check_Edit3 : Boolean;                 //자기계발 입력 값 체크
    procedure Data_Display;

  public
    { Public declarations }
    DbSet      : TDataSet;
    Pwork      : string;
    Pgubun     : integer;     // 1: 수정 , 2: 추가
    Pework     : string;
    Lrabasdate : string;
    Lfordate   : string;
    Lempno     : string;
    Lwriteemp  : string;
    LSeqno     : real;
    UpDateOk   : Boolean;
    prjview_UpDate : Boolean;
    gsLastConEv: String; //업무목표최종결재자 (1차 or 2차)

    gbChanged  : Boolean; // 데이터변경유무

    iSumWeight, iSSumWeight :integer;

  end;

implementation

uses Hinsa_TmaxDM, peDm, PeMainForm;

{$R *.DFM}


procedure TFm_SubForm.FormCreate(Sender: TObject);
begin
     Start := True;
end;

procedure TFm_SubForm.FormShow(Sender: TObject);
var
     Hgubun : string;
begin
     if  Start then
     begin
          Application.ProcessMessages;
          Data_Display;
          Start := not Start;

          PeJeonOutLookBtn1.Enabled := false;
          Memo_Prjview.Enabled      := false;
          Memo_Prjview.color        := $00D2D2D2;

          //평가자 이면 의견을 넣을수 있다.
          if  MainForm.EvalYN then
          begin
               PeJeonOutLookBtn1.Enabled := true;
               Memo_Prjview.Enabled      := true;
               Memo_Prjview.color        := clWhite;
          end;

          if  Eda_Bresult1.Text <> '' then     GroupBox1.Visible := true
          else                                 GroupBox1.Visible := false;

          if  Eda_Bresult2.Text <> '' then     GroupBox2.Visible := true
          else                                 GroupBox2.Visible := false;

          if  Eda_Bresult3.Text <> '' then     GroupBox3.Visible := true
          else                                 GroupBox3.Visible := false;

          if  Eda_Bresult4.Text <> '' then     GroupBox4.Visible := true
          else                                 GroupBox4.Visible := false;

          if  Eda_Bresult5.Text <> '' then     GroupBox5.Visible := true
          else                                 GroupBox5.Visible := false;

          Eda_B_result1.Enabled := false;
          Eda_B_result2.Enabled := false;
          Eda_B_result3.Enabled := false;
          Eda_B_result4.Enabled := false;
          Eda_B_result5.Enabled := false;

          //비중
          Eda_forweight.value   := Eda_detweight1.Value +
                                   Eda_detweight2.Value +
                                   Eda_detweight3.Value +
                                   Eda_detweight4.Value +
                                   Eda_detweight5.Value ;
          //전체 비중
          OnNum_weight.value    := StrToInt(MainForm.g_mainweight);

          //전체비중
          OnSumWeight.Value     := iSumWeight;

          prjview_UpDate        := False;
     end;
end;

procedure TFm_SubForm.Pa_TitleMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
     if  ssleft in shift then
     begin
          Releasecapture;
          Self.Perform(WM_SYSCOMMAND, $F012, 0);
     end;
end;

procedure TFm_SubForm.Bt_ExitClick(Sender: TObject);
var
     iRet: Integer;
begin
     UpDateOk := False;

     if  Bt_Mod.Enabled = False then     Close
     else
     begin
          if  gbChanged then
          begin
               iRet := MessageDlg('저장하지 않은 자료가 있습니다. '#13#13+
                                  '저장하고 종료하시겠습니까?     ',
                                  mtConfirmation,[mbYes,mbNo,mbCancel],0);

               if      iRet = IDYES then     Bt_ModClick(Sender)
               else if iRet = IDNO  then     Close;
          end
          else
               Close;
     end;
end;

//저장
procedure TFm_SubForm.Bt_ModClick(Sender: TObject);
var
     Param      : OleVariant;
     Msg        : string;
     OleData    : OleVariant;
     i          : integer;
     AAA        : string;
     FL_i       : Integer;
     FL_Plan    : TOnEdit;
     FL_Validx  : TOnEdit;
     FL_Bresult : TOnEdit;
     FL_Foraim  : TOnEdit;
     FL_Sresult : TOnEdit;
     FL_Aresult : TOnEdit;
     FL_B_result: TOnEdit;
     FL_Cresult : TOnEdit;
     FL_Dresult : TOnEdit;
     FL_Number  : TOnNumberEdit;
begin
     if  trim(Eda_propeltask.Text) = '' then
     begin
          MessageDlg('중점추진업무는 필수 입력항목입니다.' + #13#13#10 +
                     '저장할 수 없습니다.',mtinformation,[mbOK],0);
          Exit;
     end;

     if  Eda_forweight.Value = 0 then
     begin
          MessageDlg('중점추진업무 '+Eda_propeltask.Text+' 비중이 0입니다.' + #13#13#10 +
                     '저장할 수 없습니다.',mtinformation,[mbOK],0);
          Exit;
     end;


     for  FL_i := 1 to 5 do
     begin
          FL_Number   := nil;
          FL_Number   := TOnNumberEdit(Self.FindComponent('Eda_detweight'+IntToStr(FL_i)));
          FL_plan     := TOnEdit(Self.FindComponent('Eda_plan'+IntToStr(FL_i)));
          FL_validx   := TOnEdit(Self.FindComponent('Eda_validx'+IntToStr(FL_i)));
          FL_Bresult  := TOnEdit(Self.FindComponent('Eda_Bresult'+IntToStr(FL_i)));
          FL_foraim   := TOnEdit(Self.FindComponent('Eda_foraim'+IntToStr(FL_i)));
          FL_Sresult  := TOnEdit(Self.FindComponent('Eda_Sresult'+IntToStr(FL_i)));
          FL_Aresult  := TOnEdit(Self.FindComponent('Eda_Aresult'+IntToStr(FL_i)));
          FL_B_result := TOnEdit(Self.FindComponent('Eda_B_result'+IntToStr(FL_i)));
          FL_Cresult  := TOnEdit(Self.FindComponent('Eda_Cresult'+IntToStr(FL_i)));
          FL_Dresult  := TOnEdit(Self.FindComponent('Eda_Dresult'+IntToStr(FL_i)));

          if  (trim(FL_plan.Text) = '') and (FL_Number.Value  <> 0) then
          begin
               MessageDlg('상세비중이 0이 아닌 입력되지 않은 세부항목이 있습니다.' + #13#13#10 +
                          '상세비중을 재조정하거나 항목을 수정 하십시요.',mtinformation,[mbOK],0);
               Exit;
          end;

          if  (FL_Number <> nil) and (FL_Number.Value = 0) then
          begin
               if  (FL_plan.Text <> '') or (FL_validx.Text <> '') or (FL_Bresult.Text <> '') or
                   (FL_foraim.Text <> '') or (FL_Sresult.Text <> '') or (FL_Aresult.Text <> '') or
                   (FL_B_result.Text <> '') or (FL_Cresult.Text <> '') or (FL_Dresult.Text <> '') then
               begin
                    MessageDlg('상세비중이 0일때 항목이 입력되어있습니다.' + #13#13#10 +
                               '상세비중을 재조정하거나 항목을 수정 하십시요.',mtinformation,[mbOK],0);
                    Exit;
               end;
          end;
     end;

   //====================================================================================//
   //   30.39      2004.10.14         이민용      입력값 체크 막음
   //====================================================================================//
     if  (Pwork = '관리직') then
     begin
          Perform(WM_NEXTDLGCTL, 0,0);
     end;

     MainForm.St_Help.Panels[0].Text := ' 저장 작업 처리중입니다..';
     MainForm.St_Help.Perform(WM_PAINT,0,0);

     if  (Pwork = '관리직') then
     begin
          if  Pgubun = 1 then     // 수정
          begin
               Param := VarArrayOf([replace(Eda_propeltask.Text,'''','`'),
                                    replace(Eda_plan1.Text,'''','`'),
                                    replace(Eda_plan2.Text,'''','`'),
                                    replace(Eda_plan3.Text,'''','`'),
                                    replace(Eda_plan4.Text,'''','`'),
                                    replace(Eda_plan5.Text,'''','`'),
                                    Eda_detweight1.value,
                                    Eda_detweight2.value,
                                    Eda_detweight3.value,
                                    Eda_detweight4.value,
                                    Eda_detweight5.value,
                                    replace(Eda_validx.Text,'''','`'),
                                    replace(Eda_validx2.Text,'''','`'),
                                    replace(Eda_validx3.Text,'''','`'),
                                    replace(Eda_validx4.Text,'''','`'),
                                    replace(Eda_validx5.Text,'''','`'),
                                    replace(Eda_foraim1.Text,'''','`'),
                                    replace(Eda_foraim2.Text,'''','`'),
                                    replace(Eda_foraim3.Text,'''','`'),
                                    replace(Eda_foraim4.Text,'''','`'),
                                    replace(Eda_foraim5.Text,'''','`'),
                                    replace(Eda_Sresult1.Text,'''','`'),
                                    replace(Eda_Aresult1.Text,'''','`'),
                                    replace(Eda_Bresult1.Text,'''','`'),
                                    replace(Eda_Cresult1.Text,'''','`'),
                                    replace(Eda_dresult1.Text,'''','`'),
                                    replace(Eda_Sresult2.Text,'''','`'),
                                    replace(Eda_Aresult2.Text,'''','`'),
                                    replace(Eda_Bresult2.Text,'''','`'),
                                    replace(Eda_Cresult2.Text,'''','`'),
                                    replace(Eda_dresult2.Text,'''','`'),
                                    replace(Eda_Sresult3.Text,'''','`'),
                                    replace(Eda_Aresult3.Text,'''','`'),
                                    replace(Eda_Bresult3.Text,'''','`'),
                                    replace(Eda_Cresult3.Text,'''','`'),
                                    replace(Eda_dresult3.Text,'''','`'),
                                    replace(Eda_Sresult4.Text,'''','`'),
                                    replace(Eda_Aresult4.Text,'''','`'),
                                    replace(Eda_Bresult4.Text,'''','`'),
                                    replace(Eda_Cresult4.Text,'''','`'),
                                    replace(Eda_dresult4.Text,'''','`'),
                                    replace(Eda_Sresult5.Text,'''','`'),
                                    replace(Eda_Aresult5.Text,'''','`'),
                                    replace(Eda_Bresult5.Text,'''','`'),
                                    replace(Eda_Cresult5.Text,'''','`'),
                                    replace(Eda_dresult5.Text,'''','`'),
                                    replace(Memo_Prjview.Lines.Text,'''','`'),
                                    Lwriteemp,
                                    Lrabasdate,
                                    Lempno,
                                    FloatToStr(LSeqno)
                                   ]);
          end
          else
          begin
          //추가
               Param := VarArrayOf([Lrabasdate,
                                    Lempno,
                                    replace(Eda_propeltask.Text,'''','`'),
                                    replace(Eda_plan1.Text,'''','`'),
                                    replace(Eda_plan2.Text,'''','`'),
                                    replace(Eda_plan3.Text,'''','`'),
                                    replace(Eda_plan4.Text,'''','`'),
                                    replace(Eda_plan5.Text,'''','`'),
                                    Eda_detweight1.value,
                                    Eda_detweight2.value,
                                    Eda_detweight3.value,
                                    Eda_detweight4.value,
                                    Eda_detweight5.value,
                                    replace(Eda_validx.Text,'''','`'),
                                    replace(Eda_validx2.Text,'''','`'),
                                    replace(Eda_validx3.Text,'''','`'),
                                    replace(Eda_validx4.Text,'''','`'),
                                    replace(Eda_validx5.Text,'''','`'),
                                    replace(Eda_foraim1.Text,'''','`'),
                                    replace(Eda_foraim2.Text,'''','`'),
                                    replace(Eda_foraim3.Text,'''','`'),
                                    replace(Eda_foraim4.Text,'''','`'),
                                    replace(Eda_foraim5.Text,'''','`'),
                                    replace(Eda_Sresult1.Text,'''','`'),
                                    replace(Eda_Aresult1.Text,'''','`'),
                                    replace(Eda_Bresult1.Text,'''','`'),
                                    replace(Eda_Cresult1.Text,'''','`'),
                                    replace(Eda_dresult1.Text,'''','`'),
                                    replace(Eda_Sresult2.Text,'''','`'),
                                    replace(Eda_Aresult2.Text,'''','`'),
                                    replace(Eda_Bresult2.Text,'''','`'),
                                    replace(Eda_Cresult2.Text,'''','`'),
                                    replace(Eda_dresult2.Text,'''','`'),
                                    replace(Eda_Sresult3.Text,'''','`'),
                                    replace(Eda_Aresult3.Text,'''','`'),
                                    replace(Eda_Bresult3.Text,'''','`'),
                                    replace(Eda_Cresult3.Text,'''','`'),
                                    replace(Eda_dresult3.Text,'''','`'),
                                    replace(Eda_Sresult4.Text,'''','`'),
                                    replace(Eda_Aresult4.Text,'''','`'),
                                    replace(Eda_Bresult4.Text,'''','`'),
                                    replace(Eda_Cresult4.Text,'''','`'),
                                    replace(Eda_dresult4.Text,'''','`'),
                                    replace(Eda_Sresult5.Text,'''','`'),
                                    replace(Eda_Aresult5.Text,'''','`'),
                                    replace(Eda_Bresult5.Text,'''','`'),
                                    replace(Eda_Cresult5.Text,'''','`'),
                                    replace(Eda_dresult5.Text,'''','`'),
                                    replace(Memo_Prjview.Text,'''','`'),
                                    Lwriteemp
                                   ]);
          end;
          DM.FSvr_UpdateSql(1,Pgubun,Param);
     end;

     if  (Pwork = '의견등록') then
     begin
          if  Pework = '1차' then
          begin
               Param := VarArrayOf([trim(replace(Eda_eprjview.Lines.Text,'''','`')),
                                    Lrabasdate,
                                    Lempno
                                   ]);
               DM.FSvr_UpdateSql(3,1,Param);
          end;

   {===============================================================================
      Version    date(yy.mm.dd)     programmer      relevant doc.no  description
      30.10      2000.06.30         윤형식          전2000-06-       1차평가자 최종결재 및 결재시 이력보관
   ===============================================================================}
          if  (gsLastConEv = '2차') and (Pework = '2차') then
          begin
               Param := VarArrayOf([trim(replace(Eda_eprjview.Lines.Text,'''','`')),
                                    Lrabasdate,
                                    Lempno
                                   ]);
               DM.FSvr_UpdateSql(3,2,Param);
          end;
     end;
     MainForm.St_Help.Panels[0].Text := '';

     UpDateOk                        := True;
     MainForm.St_Help.Panels[0].Text := ' 저장 작업을 완료했습니다.';

     showmessage('공동목표+개인목표 비중의 합이 100이 아니면 [결재] 또는 [결재상신]되지 않습니다.'+ #13 +
                 '개인목표 비중을 등록하여 비중의 총합을 100으로 맞추고' + #13 +
                 '반드시 [결재상신] 처리하세요!');

     Close;
end;

procedure TFm_SubForm.Eda_eprjviewKeyPress(Sender: TObject; var Key: Char);
var
     LinePos : DWord;
begin
     if  Key = #13 then
     begin
          LinePos := TMemo(Sender).Perform(EM_LINEFROMCHAR,TMemo(Sender).SelStart,0);
          if  (LinePos >= 3 ) or (TMemo(Sender).Lines.Count >= 4) then     Key := #0;
     end;
end;

procedure TFm_SubForm.Eda_eprjviewChange(Sender: TObject);
var
     i : integer;
begin
     if  TMemo(sender).Lines.Count > 4 then
     begin
          for  i := TMemo(Sender).Lines.Count - 1 downto 4 do
               TMemo(Sender).Lines.Delete(i);
          TMemo(Sender).SelStart := TMemo(Sender).Perform(EM_LINEINDEX,1,0);
     end;
end;

procedure TFm_SubForm.Edb_propeltaskExit(Sender: TObject);
var
     i : integer;
     s : string;
begin
     s := TPePanelEdit(Sender).Text;
     for  i := 1 to Length(s) do
     begin
          if  Ord(s[i]) = 39 then
          begin
               s[i] := Chr(96);  // `문자
          end;
     end;
     TPePanelEdit(Sender).Text := s;
end;

procedure TFm_SubForm.Eda_eprjviewExit(Sender: TObject);
var
     i : integer;
     s : string;
begin
     s := TpejeonMemo(Sender).Text;
     for  i := 1 to Length(s) do
     begin
          if  Ord(s[i]) = 39 then
          begin
               s[i] := Chr(96);  // `문자
          end;
     end;
     TpejeonMemo(Sender).Text := s;
end;

//====================================================================================//
//   30.39      2001.07.24         손종운 추가 -- FormShow에서 가져옴
//====================================================================================//
procedure TFm_SubForm.Data_Display;
var
     Hgubun : string;
begin
     Hgubun := DM.Gethalf(Lrabasdate);

     if  not start and DbSet.Bof and DbSet.Eof then
     begin
          close;
          system.exit;
     end;

     //화면크기
     if  Pwork = '관리직' then
     begin
          Nt_Book.ActivePage := '관리직';
          Height             := 620;
          if  Pgubun = 1 then
          begin
               Eda_propeltask.Text     := DbSet.FieldByName('propeltask').AsString;
               Eda_plan1.Text          := DbSet.FieldByName('detailtask1').AsString;
               Eda_plan2.Text          := DbSet.FieldByName('detailtask2').AsString;
               Eda_plan3.Text          := DbSet.FieldByName('detailtask3').AsString;
               Eda_plan4.Text          := DbSet.FieldByName('detailtask4').AsString;
               Eda_plan5.Text          := DbSet.FieldByName('detailtask5').AsString;
               Eda_detweight1.Text     := DbSet.FieldByName('detailweight1').AsString;
               Eda_detweight2.Text     := DbSet.FieldByName('detailweight2').AsString;
               Eda_detweight3.Text     := DbSet.FieldByName('detailweight3').AsString;
               Eda_detweight4.Text     := DbSet.FieldByName('detailweight4').AsString;
               Eda_detweight5.Text     := DbSet.FieldByName('detailweight5').AsString;
               Eda_validx.Text         := DbSet.FieldByName('validx1').AsString;
               Eda_validx2.Text        := DbSet.FieldByName('validx2').AsString;
               Eda_validx3.Text        := DbSet.FieldByName('validx3').AsString;
               Eda_validx4.Text        := DbSet.FieldByName('validx4').AsString;
               Eda_validx5.Text        := DbSet.FieldByName('validx5').AsString;
               Eda_foraim1.Text        := DbSet.FieldByName('valfunction1').AsString;
               Eda_foraim2.Text        := DbSet.FieldByName('valfunction2').AsString;
               Eda_foraim3.Text        := DbSet.FieldByName('valfunction3').AsString;
               Eda_foraim4.Text        := DbSet.FieldByName('valfunction4').AsString;
               Eda_foraim5.Text        := DbSet.FieldByName('valfunction5').AsString;
               Eda_Sresult1.Text       := DbSet.FieldByName('sresultclass1').AsString;
               Eda_Aresult1.Text       := DbSet.FieldByName('aresultclass1').AsString;
               Eda_Bresult1.Text       := DbSet.FieldByName('bresultclass1').AsString;
               Eda_Cresult1.Text       := DbSet.FieldByName('cresultclass1').AsString;
               Eda_Dresult1.Text       := DbSet.FieldByName('dresultclass1').AsString;
               Eda_Sresult2.Text       := DbSet.FieldByName('sresultclass2').AsString;
               Eda_Aresult2.Text       := DbSet.FieldByName('aresultclass2').AsString;
               Eda_Bresult2.Text       := DbSet.FieldByName('bresultclass2').AsString;
               Eda_Cresult2.Text       := DbSet.FieldByName('cresultclass2').AsString;
               Eda_Dresult2.Text       := DbSet.FieldByName('dresultclass2').AsString;
               Eda_Sresult3.Text       := DbSet.FieldByName('sresultclass3').AsString;
               Eda_Aresult3.Text       := DbSet.FieldByName('aresultclass3').AsString;
               Eda_Bresult3.Text       := DbSet.FieldByName('bresultclass3').AsString;
               Eda_Cresult3.Text       := DbSet.FieldByName('cresultclass3').AsString;
               Eda_Dresult3.Text       := DbSet.FieldByName('dresultclass3').AsString;
               Eda_Sresult4.Text       := DbSet.FieldByName('sresultclass4').AsString;
               Eda_Aresult4.Text       := DbSet.FieldByName('aresultclass4').AsString;
               Eda_Bresult4.Text       := DbSet.FieldByName('bresultclass4').AsString;
               Eda_Cresult4.Text       := DbSet.FieldByName('cresultclass4').AsString;
               Eda_Dresult4.Text       := DbSet.FieldByName('dresultclass4').AsString;
               Eda_Sresult5.Text       := DbSet.FieldByName('sresultclass5').AsString;
               Eda_Aresult5.Text       := DbSet.FieldByName('aresultclass5').AsString;
               Eda_Bresult5.Text       := DbSet.FieldByName('bresultclass5').AsString;
               Eda_Cresult5.Text       := DbSet.FieldByName('cresultclass5').AsString;
               Eda_Dresult5.Text       := DbSet.FieldByName('dresultclass5').AsString;
               Memo_Prjview.Lines.Text :=DbSet.FieldByName('e1prjopinon').AsString;
          end;

          if  (Lrabasdate >= Lfordate) and (pework <> '자세히보기') then
          begin
               //Eda_forweight.Enabled := True;//False;
               Eda_foraim1.Enabled   := True;//False;
               Eda_foraim2.Enabled   := True;//False;
               Eda_foraim3.Enabled   := True;//False;
               Eda_foraim4.Enabled   := True;//False;
               Eda_foraim5.Enabled   := True;//False;
          end;
     end;
end;
//====================================================================================//

procedure TFm_SubForm.EditChangedKEditChangedKeyPresseyPress(Sender: TObject;
  var Key: Char);
begin
     if  Key <> #13 then     gbChanged := True;
end;


procedure TFm_SubForm.Eda_Bresult1Click(Sender: TObject);
begin
     GroupBox1.Visible := true;
end;

procedure TFm_SubForm.Eda_Bresult1Change(Sender: TObject);
begin
     Eda_B_result1.text := Eda_Bresult1.text;
     GroupBox1.Visible  := true;
end;

procedure TFm_SubForm.Eda_Bresult2Click(Sender: TObject);
begin
     GroupBox2.Visible:=true;
end;

procedure TFm_SubForm.Eda_Bresult2Change(Sender: TObject);
begin
     Eda_B_result2.text:=Eda_Bresult2.text;
     GroupBox2.Visible:=true;
end;

procedure TFm_SubForm.Eda_Bresult3Click(Sender: TObject);
begin
     GroupBox3.Visible:=true;
end;

procedure TFm_SubForm.Eda_Bresult3Change(Sender: TObject);
begin
     Eda_B_result3.text:=Eda_Bresult3.text;
     GroupBox3.Visible:=true;
end;

procedure TFm_SubForm.Eda_Bresult4Click(Sender: TObject);
begin
     GroupBox4.Visible:=true;
end;

procedure TFm_SubForm.Eda_Bresult4Change(Sender: TObject);
begin
     Eda_B_result4.text:=Eda_Bresult4.text;
     GroupBox4.Visible:=true;
end;

procedure TFm_SubForm.Eda_Bresult5Click(Sender: TObject);
begin
     GroupBox5.Visible:=true;
end;

procedure TFm_SubForm.Eda_Bresult5Change(Sender: TObject);
begin
     Eda_B_result5.text:=Eda_Bresult5.text;
     GroupBox5.Visible:=true;
end;

procedure TFm_SubForm.Eda_detweight1Exit(Sender: TObject);
var
     v_mainweight,sql   : string;
begin
     if  Pgubun = 1 then    // 수정
     begin
          Sql :=        'select sum(mainweight) from PEHREAIM_DET '+
                 format(' WHERE rabasdate = ''%s''                '+
                        '   and empno     = ''%s''                '+
                        '   and seqno    <> ''%s''                ',
                        [MainForm.Lrabasdate,MainForm.Ed_empno.LabelHint,FloatToStr(LSeqno)]);

          DataModule_Tmax.Csel_SQL := Sql;
          DataModule_Tmax.Csel_Open4;
          v_mainweight             := DataModule_Tmax.Csel_gfd4(1);

          if  v_mainweight <> '' then     v_mainweight := DataModule_Tmax.Csel_gfd4(1)
          else                            v_mainweight := '0';

          Eda_forweight.value := Eda_detweight1.Value +
                                 Eda_detweight2.Value +
                                 Eda_detweight3.Value +
                                 Eda_detweight4.Value +
                                 Eda_detweight5.Value ;
          OnNum_weight.value  := StrToint(v_mainweight) +
                                 Eda_detweight1.Value +
                                 Eda_detweight2.Value +
                                 Eda_detweight3.Value +
                                 Eda_detweight4.Value +
                                 Eda_detweight5.Value ;

          OnSumWeight.Value   := Eda_forweight.value  + iSSumWeight;

          if  OnNum_weight.value > 100 then
          begin
               MessageDlg('개인별 목표비중이 100을 초과하였습니다.',mtError, [mbOk], 0);
               case (sender As TOnNumberEdit).tag of
                    0: begin
                            Eda_detweight1.Clear;
                            Eda_detweight1.SetFocus;
                       end;
                    1: begin
                            Eda_detweight2.Clear;
                            Eda_detweight2.SetFocus;
                       end;
                    2: begin
                            Eda_detweight3.Clear;
                            Eda_detweight3.SetFocus;
                       end;
                    3: begin
                            Eda_detweight4.Clear;
                            Eda_detweight4.SetFocus;
                       end;
                    4: begin
                            Eda_detweight5.Clear;
                            Eda_detweight5.SetFocus;
                       end;
               end;
          end;
     end
     else
     if  Pgubun = 2 then  //추가
     begin
          Eda_forweight.value := Eda_detweight1.Value +
                                 Eda_detweight2.Value +
                                 Eda_detweight3.Value +
                                 Eda_detweight4.Value +
                                 Eda_detweight5.Value ;
          OnNum_weight.value  := StrToInt(MainForm.g_mainweight) +
                                 Eda_detweight1.Value +
                                 Eda_detweight2.Value +
                                 Eda_detweight3.Value +
                                 Eda_detweight4.Value +
                                 Eda_detweight5.Value ;
          if  OnNum_weight.value > 100 then
          begin
               MessageDlg('비중이 100을 초과하였습니다.',mtError, [mbOk], 0);
               case (sender As TOnNumberEdit).tag of
                    0: begin
                            Eda_detweight1.Clear;
                            Eda_detweight1.SetFocus;
                       end;
                    1: begin
                            Eda_detweight2.Clear;
                            Eda_detweight2.SetFocus;
                       end;
                    2: begin
                            Eda_detweight3.Clear;
                            Eda_detweight3.SetFocus;
                       end;
                    3: begin
                            Eda_detweight4.Clear;
                            Eda_detweight4.SetFocus;
                       end;
                    4: begin
                            Eda_detweight5.Clear;
                            Eda_detweight5.SetFocus;
                       end;
               end;
          end;
     end;

     if  (sender As TOnNumberEdit).Value > 60 then
     begin
          MessageDlg('상세비중이 60을 초과하였습니다.',mtError, [mbOk], 0);
          case (sender As TOnNumberEdit).tag of
               0: begin
                       Eda_detweight1.Clear;
                       Eda_detweight1.SetFocus;
                  end;
               1: begin
                       Eda_detweight2.Clear;
                       Eda_detweight2.SetFocus;
                  end;
               2: begin
                       Eda_detweight3.Clear;
                       Eda_detweight3.SetFocus;
                  end;
               3: begin
                       Eda_detweight4.Clear;
                       Eda_detweight4.SetFocus;
                  end;
               4: begin
                       Eda_detweight5.Clear;
                       Eda_detweight5.SetFocus;
                  end;
          end;
     end;
end;

//목표 의견 저장
procedure TFm_SubForm.PeJeonOutLookBtn1Click(Sender: TObject);
var
     Param        : OleVariant;
     sql,SqlText  : string;
     Ltime        : string;
     fv_e1prjview : string;
begin
     Ltime   := DM.GetOracleTime;
     if  Memo_Prjview.Lines.Text <> '' then
     begin
          Param   := VarArrayOf([replace(Memo_Prjview.Lines.Text,'''','`'),
                                 Lrabasdate,
                                 Lempno,
                                 FloatToStr(LSeqno)
                                ]);

          SqlText := Format('UPDATE PEHREAIM_DET          '+
                            '   SET e1prjopinon = ''%s''  '+
                            ' WHERE rabasdate   = ''%s''  '+
                            '   AND empno       = ''%s''  '+
                            '   AND seqno       = ''%s''  ',
                            [Param[0],
                             Param[1],Param[2],Param[3]]);   // 키부분

          DataModule_Tmax.Cupd_SQL := Sqltext;
          DataModule_Tmax.Cupd_Exec;
          if  not DataModule_Tmax.Cupd_ret then
          begin
               Messagedlg('APP-Server Error',mtError,[mbOK],0);
               Exit;
          end;
          MessageDlg('목표면담의견을 저장하였습니다.',mtinformation,[mbOK],0);
          prjview_UpDate := True;
     end;
end;

end.
