unit USubForm1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, Buttons, ExtCtrls, DBGrids, Db, DBClient, peoutlookbtn,
  PeJeonVertLabel, PeJeonLabel, ComCtrls, Tmax_DataSetText, OnEditBaseCtrl,
  OnEditStdCtrl, OnEditMemo, OnShapeLabel, OnDBGrid, Psock, NMFtp, Func,
  OnFocusButton, OnLineLabel;

type
  TSubForm1 = class(TForm)
    Panel1: TPanel;
    OnShapeLabel1: TOnShapeLabel;
    E_Itemname1: TOnMemo;
    E_KeyFactor1: TOnMemo;
    E_SupexTarget1: TOnMemo;
    E_ActPlan1: TOnMemo;
    E_Bigo1: TOnMemo;
    OnShapeLabel3: TOnShapeLabel;
    OnShapeLabel5: TOnShapeLabel;
    OnShapeLabel2: TOnShapeLabel;
    OnShapeLabel4: TOnShapeLabel;
    OnShapeLabel6: TOnShapeLabel;
    OnShapeLabel7: TOnShapeLabel;
    E_Effect1: TOnMemo;
    E_Itemname2: TOnMemo;
    E_KeyFactor2: TOnMemo;
    E_SupexTarget2: TOnMemo;
    E_ActPlan2: TOnMemo;
    E_Bigo2: TOnMemo;
    E_Effect2: TOnMemo;
    E_Itemname3: TOnMemo;
    E_KeyFactor3: TOnMemo;
    E_SupexTarget3: TOnMemo;
    E_ActPlan3: TOnMemo;
    E_Bigo3: TOnMemo;
    E_Effect3: TOnMemo;
    E_Itemname4: TOnMemo;
    E_KeyFactor4: TOnMemo;
    E_SupexTarget4: TOnMemo;
    E_ActPlan4: TOnMemo;
    E_Bigo4: TOnMemo;
    E_Effect4: TOnMemo;
    E_Itemname5: TOnMemo;
    E_KeyFactor5: TOnMemo;
    E_SupexTarget5: TOnMemo;
    E_ActPlan5: TOnMemo;
    E_Bigo5: TOnMemo;
    E_Effect5: TOnMemo;
    Label1: TLabel;
    Label2: TLabel;
    E_itemno: TOnEdit;
    L_AppFile: TOnSectionLabel;
    Bt_FileApp: TOnFocusButton;
    NMFTP1: TNMFTP;
    OpenDialog1: TOpenDialog;
    B_Save1: TOnFocusButton;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure E_Itemname1Exit(Sender: TObject);
    procedure B_Save1Click(Sender: TObject);
    procedure B_del1Click(Sender: TObject);
    procedure B_Cancel1Click(Sender: TObject);
    procedure E_Itemname1Enter(Sender: TObject);
    procedure E_Effect1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Bt_FileAppClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    var_stday   : String;   // 평가기준일
    F_Effect    : Array [1..5] of String;
//    F_KeyFactor : Array [1..5] of String;
    F_ActPlan   : Array [1..5] of String;
    F_Bigo      : Array [1..5] of String;

    vServerFileName, vFullPath, vFilename  : String;
    vFTPsuccess : Boolean;

    procedure TextClear(Itag : Integer);
    function  IsDataModified: Boolean;
    procedure ServerFileRead;
    procedure Subject_data;
    procedure Edit_Enabled(Ttag : integer; TFlag : Boolean);
    procedure Edit_ReadOnly(TFlag : Boolean);
    procedure FtpConnect(vspt, vServerFileName : String);
  end;


var
  SubForm1: TSubForm1;

implementation
{$R *.DFM}
uses  HMainForm;

{------------------------------- Main ----------------------------------}
procedure TSubForm1.FormShow(Sender: TObject);
begin
     Application.ProcessMessages;

     var_stday := FM_Main.Lrabasyy;
     if FM_Main.LRvalConyn = 'Y' then   Edit_ReadOnly(True)
     else                               Edit_ReadOnly(False);

     ServerFileRead;
     if vServerFileName = '' then
         Bt_FileApp.Caption := '파일Upload'
     else
         Bt_FileApp.Caption := 'Upload파일삭제';

     // 결재상신 안했을 경우
     if (FM_Main.ed_empno.Text = FM_Main.E_ChangeEmp.Text ) then
     begin
          if (FM_Main.Lrvalconyn <> 'Y') then
          begin
               Bt_FileApp.Enabled := true;
          end
          else
          begin
               Bt_FileApp.Caption := '파일Download';
               Bt_FileApp.Enabled := true;
          end;
     end
     else
     begin
          Bt_FileApp.Caption := '파일Download';
          if vServerFileName = '' then
             Bt_FileApp.Enabled := false
          else
             Bt_FileApp.Enabled := true;
     end;
  Subject_data;
end;

{------------------------------- USER FUNCTION ----------------------------------}

procedure TSubForm1.Subject_data;
var
     ParamVariant: String;
     FL_Comp     : TOnMemo;
     FL_i        : Integer;
begin
     TextClear(1);
     TextClear(2);
     TextClear(3);
     TextClear(4);
     TextClear(5);
     with  FM_Main.TMaxDataSet_HInsa  do
     begin
          ParamVariant := 'select DETAILTASK1, DETAILTASK2, DETAILTASK3,                           '+
                          '       DETAILTASK4, DETAILTASK5                                         '+
                          '  from pehreaim_det a                                                   '+
                          ' WHERE rabasdate like '''+FM_Main.LRabasyy+'''||''%''                   '+
                          '   and EMPNO   = '''+FM_Main.Ed_empno.Text+'''                          '+
                          '   and seqno   = 99                                                     '+
                          '   and ((empno in ('''+FM_Main.sptemp1+''','''+FM_Main.sptemp2+''',     '+
                          '                   '''+FM_Main.sptemp3+''','''+FM_Main.sptemp4+''',     '+
                          '                   '''+FM_Main.sptemp5+''','''+FM_Main.sptemp6+''',     '+
                          '                   '''+FM_Main.sptemp7+''','''+FM_Main.sptemp8+''',     '+
                          '                   '''+FM_Main.sptemp9+''','''+FM_Main.sptemp0+''')) or '+
                          '        ((select E1PRJCONYN from pehremas                               '+
                          '           where rabasdate = a.rabasdate                                '+
                          '             and empno     = a.empno)     = ''Y'')                      '+
                          '       )                                                                ';
          Close;
          ServiceName := 'HINSA_select';
          ClearFieldInfo;
          AddField('DETAILTASK1'    , ftString    ,  100  );
          AddField('DETAILTASK2'    , ftString    ,  100  );
          AddField('DETAILTASK3'    , ftString    ,  100  );
          AddField('DETAILTASK4'    , ftString    ,  100  );
          AddField('DETAILTASK5'    , ftString    ,  100  );
          ClearParamInfo;
          SQL.Text := ParamVariant;   
          Open;
          if recordcount < 1 then
          begin
               MessageDlg('생산성 향상 과제 등록이 완료되신 후 작업하시기 바랍니다.',mtError, [mbOk],0);
               FM_Main.BT_ExitClick(FM_Main.BT_Exit);
          end;
          E_Itemname1.Text := Fields[0].AsString;
          E_Itemname2.Text := Fields[1].AsString;
          E_Itemname3.Text := Fields[2].AsString;
          E_Itemname4.Text := Fields[3].AsString;
          E_Itemname5.Text := Fields[4].AsString;

          ParamVariant := 'select SRESULTCLASS1, SRESULTCLASS2, SRESULTCLASS3,                     '+
                          '       SRESULTCLASS4, SRESULTCLASS5                                     '+
                          '  from pehreaim_det a                                                   '+
                          ' WHERE rabasdate like '''+FM_Main.LRabasyy+'''||''%''                   '+
                          '   and EMPNO   = '''+FM_Main.Ed_empno.Text+'''                          '+
                          '   and seqno   = 99                                                     '+
                          '   and ((empno in ('''+FM_Main.sptemp1+''','''+FM_Main.sptemp2+''',     '+
                          '                   '''+FM_Main.sptemp3+''','''+FM_Main.sptemp4+''',     '+
                          '                   '''+FM_Main.sptemp5+''','''+FM_Main.sptemp6+''',     '+
                          '                   '''+FM_Main.sptemp7+''','''+FM_Main.sptemp8+''',     '+
                          '                   '''+FM_Main.sptemp9+''','''+FM_Main.sptemp0+''')) or '+
                          '        ((select E1PRJCONYN from pehremas                               '+
                          '           where rabasdate = a.rabasdate                                '+
                          '             and empno     = a.empno)     = ''Y'')                      '+
                          '       )                                                                ';

          Close;
          ServiceName := 'HINSA_select';
          ClearFieldInfo;
          AddField('SRESULTCLASS1'    , ftString    ,  100  );
          AddField('SRESULTCLASS2'    , ftString    ,  100  );
          AddField('SRESULTCLASS3'    , ftString    ,  100  );
          AddField('SRESULTCLASS4'    , ftString    ,  100  );
          AddField('SRESULTCLASS5'    , ftString    ,  100  );
          ClearParamInfo;
          SQL.Text := ParamVariant;
          Open;
          E_SupexTarget1.Text := Fields[0].AsString;
          E_SupexTarget2.Text := Fields[1].AsString;
          E_SupexTarget3.Text := Fields[2].AsString;
          E_SupexTarget4.Text := Fields[3].AsString;
          E_SupexTarget5.Text := Fields[4].AsString;
     end;

     with  FM_Main.Q_Subject  do
     begin
          ParamVariant := 'select ITEMNO, EFFECT, KEYFACTOR, ACTPLAN, BIGO  '+
                          '  from peAct1mas a                               '+
                   Format(' WHERE rabasyy = ''%s'' and A.EMPNO   = ''%s''   ',[FM_Main.LRabasyy,FM_Main.Ed_empno.Text]) +
                          ' order by ITEMNO                                 ';
          Close;
          ServiceName := 'HINSA_select3';
          ClearFieldInfo;
          AddField('ITEMNO'    , ftString    ,  2000  );
          AddField('EFFECT'    , ftString    ,  2000  );
          AddField('KEYFACTOR' , ftString    ,  2000  );
          AddField('ACTPLAN'   , ftString    ,  2000  );
          AddField('BIGO'      , ftString    ,  2000  );
          ClearParamInfo;
          SQL.Text := ParamVariant;
          Open;

          if trim(E_Itemname1.Text) <> '' then     Edit_Enabled(1,True)
          else                                     Edit_Enabled(1,False);
          if trim(E_Itemname2.Text) <> '' then     Edit_Enabled(2,True)
          else                                     Edit_Enabled(2,False);
          if trim(E_Itemname3.Text) <> '' then     Edit_Enabled(3,True)
          else                                     Edit_Enabled(3,False);
          if trim(E_Itemname4.Text) <> '' then     Edit_Enabled(4,True)
          else                                     Edit_Enabled(4,False);
          if trim(E_Itemname5.Text) <> '' then     Edit_Enabled(5,True)
          else                                     Edit_Enabled(5,False);

          if FM_Main.Q_Subject.RecordCount > 0 then
          begin
               FL_Comp := nil;
               First;
               while not eof do
               begin
                    FL_i := Fields[0].AsInteger;
                    begin
                         FL_Comp := TOnMemo(Self.FindComponent('E_Effect'   +IntToStr(FL_i)));
                         FL_Comp.Text      := Fields[1].AsString;
                         F_Effect[FL_i]    := Fields[1].AsString;
                         //FL_Comp := TOnMemo(Self.FindComponent('E_KeyFactor'+IntToStr(FL_i)));
                         //FL_Comp.Text      := Fields[2].AsString;
                         //F_KeyFactor[FL_i] := Fields[2].AsString;
                         FL_Comp := TOnMemo(Self.FindComponent('E_ActPlan'  +IntToStr(FL_i)));
                         FL_Comp.Text      := Fields[3].AsString;
                         F_ActPlan[FL_i]   := Fields[3].AsString;
                         FL_Comp := TOnMemo(Self.FindComponent('E_Bigo'     +IntToStr(FL_i)));
                         FL_Comp.Text      := Fields[4].AsString;
                         F_Bigo[FL_i]      := Fields[4].AsString;
                         Edit_Enabled(FL_i,True);
                    end;
                    Next;
               end;
          end;
     end;
end;

procedure TSubForm1.TextClear(Itag : Integer);
var  FL_Comp : TOnMemo;
     FL_i    : Integer;
begin
     FL_Comp := nil;
     FL_i    := Itag;

     FL_Comp := TOnMemo(Self.FindComponent('E_Itemname'   +IntToStr(FL_i)));
     FL_Comp.Text := '';
     FL_Comp := TOnMemo(Self.FindComponent('E_Effect'     +IntToStr(FL_i)));
     FL_Comp.Text := '';
     //FL_Comp := TOnMemo(Self.FindComponent('E_KeyFactor'  +IntToStr(FL_i)));
     //FL_Comp.Text := '';
     FL_Comp := TOnMemo(Self.FindComponent('E_SupexTarget'+IntToStr(FL_i)));
     FL_Comp.Text := '';
     FL_Comp := TOnMemo(Self.FindComponent('E_ActPlan'    +IntToStr(FL_i)));
     FL_Comp.Text := '';
     FL_Comp := TOnMemo(Self.FindComponent('E_Bigo'       +IntToStr(FL_i)));
     FL_Comp.Text := '';

     F_Effect[FL_i]    := '';
     //F_KeyFactor[FL_i] := '';
     F_ActPlan[FL_i]   := '';
     F_Bigo[FL_i]      := '';
end;

function TSubForm1.IsDataModified: Boolean;
var  FL_Comp : TOnMemo;
     FL_i    : Integer;
begin
  Result := false;

  FL_Comp := nil;
  for FL_i := 1 to 5 do
  begin
       if (F_Effect[FL_i]    <> TOnMemo(Self.FindComponent('E_Effect'   +IntToStr(FL_i))).Text) or
          //(F_KeyFactor[FL_i] <> TOnMemo(Self.FindComponent('E_KeyFactor'+IntToStr(FL_i))).Text) or
          (F_ActPlan[FL_i]   <> TOnMemo(Self.FindComponent('E_ActPlan'  +IntToStr(FL_i))).Text) or
          (F_Bigo[FL_i]      <> TOnMemo(Self.FindComponent('E_Bigo'     +IntToStr(FL_i))).Text) then Result := True;
  end;
end;

procedure TSubForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
     if (B_Save1.Visible) and (IsDataModified) then
     begin
          MessageBox(handle,'생산성 향상과제에 변동된 자료가 있으므로 먼저 저장하세요.','작업순서오류',MB_ICONWARNING);
          CanClose := False;
          System.Exit;
     end;
     CanClose := True;
end;

procedure TSubForm1.Edit_ReadOnly(TFlag : Boolean);
var  FL_Comp : TOnMemo;
     FL_i    : Integer;
begin
     FL_Comp := nil;
     for FL_i := 1 to 5 do
     begin
          FL_Comp := TOnMemo(Self.FindComponent('E_Effect'   +IntToStr(FL_i)));
          FL_Comp.ReadOnly := TFlag;
          //FL_Comp := TOnMemo(Self.FindComponent('E_KeyFactor'+IntToStr(FL_i)));
          //FL_Comp.ReadOnly := TFlag;
          FL_Comp := TOnMemo(Self.FindComponent('E_ActPlan'  +IntToStr(FL_i)));
          FL_Comp.ReadOnly := TFlag;
          FL_Comp := TOnMemo(Self.FindComponent('E_Bigo'     +IntToStr(FL_i)));
          FL_Comp.ReadOnly := TFlag;
     end;

     B_Save1.EnAbled       := not TFlag
end;

procedure TSubForm1.Edit_Enabled(Ttag : integer; TFlag : Boolean);
var  FL_Comp : TOnMemo;
     FL_i    : Integer;
begin
     FL_Comp := nil;
     FL_i    := Ttag;

     FL_Comp := TOnMemo(Self.FindComponent('E_Effect'   +IntToStr(FL_i)));
     FL_Comp.Enabled := TFlag;
     //FL_Comp := TOnMemo(Self.FindComponent('E_KeyFactor'+IntToStr(FL_i)));
     //FL_Comp.Enabled := TFlag;
     FL_Comp := TOnMemo(Self.FindComponent('E_ActPlan'  +IntToStr(FL_i)));
     FL_Comp.Enabled := TFlag;
     FL_Comp := TOnMemo(Self.FindComponent('E_Bigo'     +IntToStr(FL_i)));
     FL_Comp.Enabled := TFlag;
end;

{------------------------------ Event ---------------------------------}
procedure TSubForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := cafree;
end;

procedure TSubForm1.E_Itemname1Exit(Sender: TObject);
begin
     if  TOnMemo(Sender).lines.Count > 7  then
     begin
          MessageDlg('내용은 7줄까지만 작성가능합니다.',mtError, [mbOk],0);
          TOnMemo(Sender).SetFocus;
     end;
end;

procedure TSubForm1.B_Save1Click(Sender: TObject);
var  i, Flag : integer;
     FL_itemno : String;
     FL_ITEMNAME    :TOnMemo;
     FL_EFFECT      :TOnMemo;
     //FL_KEYFACTOR   :TOnMemo;
     FL_SUPEXTARGET :TOnMemo;
     FL_ACTPLAN     :TOnMemo;
     FL_BIGO        :TOnMemo;
begin
     if  (trim(E_itemname1.text) <> '') and ((trim(E_Effect1.Text) = '') or (trim(E_ActPlan1.Text) = '')) then     //(trim(E_KeyFactor1.Text) = '') or
     begin
          MessageDlg('ITEM 1에 내용이 입력되지 않은 항목이 있습니다.' +#13+#13  + '확인 후 다시 입력하십시오.',mtError,[mbOK],0);
          Exit;
     end;

     if  (trim(E_itemname2.text) <> '') and ((trim(E_Effect2.Text) = '') or (trim(E_ActPlan2.Text) = '')) then     //(trim(E_KeyFactor2.Text) = '') or
     begin
          MessageDlg('ITEM 2에 내용이 입력되지 않은 항목이 있습니다.' +#13+#13  + '확인 후 다시 입력하십시오.',mtError,[mbOK],0);
          Exit;
     end;

     if  (trim(E_itemname3.text) <> '') and ((trim(E_Effect3.Text) = '') or (trim(E_ActPlan3.Text) = '')) then    //(trim(E_KeyFactor3.Text) = '') or
     begin
          MessageDlg('ITEM 3에 내용이 입력되지 않은 항목이 있습니다.' +#13+#13  + '확인 후 다시 입력하십시오.',mtError,[mbOK],0);
          Exit;
     end;

     if  (trim(E_itemname4.text) <> '') and ((trim(E_Effect4.Text) = '') or (trim(E_ActPlan4.Text) = '')) then     //(trim(E_KeyFactor4.Text) = '') or
     begin
          MessageDlg('ITEM 4에 내용이 입력되지 않은 항목이 있습니다' +#13+#13  + '확인 후 다시 입력하십시오.',mtError,[mbOK],0);
          Exit;
     end;

     if  (trim(E_itemname5.text) <> '') and ((trim(E_Effect5.Text) = '') or (trim(E_ActPlan5.Text) = '')) then     //(trim(E_KeyFactor5.Text) = '') or 
     begin
          MessageDlg('ITEM 5에 내용이 입력되지 않은 항목이 있습니다' +#13+#13  + '확인 후 다시 입력하십시오.',mtError,[mbOK],0);
          Exit;
     end;

     with Fm_Main.TMaxDataSet_HInsa do
     begin
          SQL.Clear;
          SQL.Text := format('select count(*) SEL_DATA from peAct1mas  '+
                             ' where rabasyy   =''%s''                 '+
                             '   and empno     =''%s''                 ',
                             [Fm_Main.LRabasyy, Fm_Main.ED_empno.text ]);
          Close;
          ServiceName := 'PED0000A_common';
          ClearFieldInfo;
          AddField('SEL_DATA', ftInteger, 100);
          Open;
          Flag        := Fm_Main.TMaxDataSet_HInsa.FieldByName('SEL_DATA').AsInteger;
     end;

     if  Flag <> 0 then
     begin
          with Fm_Main.TMaxDML_HInsa do
          begin
               SQL.Clear;

               SQL.Text := format('delete from peAct1mas                '+
                                  ' where rabasyy   = ''%s''            '+
                                  '   and empno     = ''%s''            ',
                                  [Fm_Main.LRabasyy, Fm_Main.ED_empno.text]);
               Close;
               ServiceName := 'PEA1060A_dml';
               Execute;
          end;
     end;
     For i := 1 to 5 do
     begin
          FL_itemno      := IntToStr(i);
          FL_ITEMNAME    := TOnMemo(Self.FindComponent('E_ITEMNAME'   +IntToStr(i)));
          FL_EFFECT      := TOnMemo(Self.FindComponent('E_EFFECT'     +IntToStr(i)));
          //FL_KEYFACTOR   := TOnMemo(Self.FindComponent('E_KEYFACTOR'  +IntToStr(i)));
          FL_SUPEXTARGET := TOnMemo(Self.FindComponent('E_SUPEXTARGET'+IntToStr(i)));
          FL_ACTPLAN     := TOnMemo(Self.FindComponent('E_ACTPLAN'    +IntToStr(i)));
          FL_BIGO        := TOnMemo(Self.FindComponent('E_BIGO'       +IntToStr(i)));

          if trim(FL_ITEMNAME.Text) = '' then
             Break;

          with Fm_Main.TMaxDML_HInsa do
          begin
               ServiceName := 'PEA1060A_dml';
               Close;
               Sql.Clear;
               SQL.Add('insert into peAct1mas                               ');
               SQL.Add('       (rabasyy,     empno,      Itemno,            ');
               SQL.Add('        itemname,    Effect,                        ');    // KeyFactor,
               SQL.Add('        SupexTarget, ActPlan,    Bigo,              ');
               SQL.Add('        Writeemp,    Writetime                    ) ');
               SQL.Add('Values ('''+ Fm_Main.Lrabasyy      +''',            ');
               SQL.Add('        '''+ Fm_Main.Ed_empno.Text +''',            ');
               SQL.Add('        '  + FL_itemno             +  ',            ');
               SQL.Add('        '''+ FL_ITEMNAME.Text      +''',            ');
               SQL.Add('        '''+ FL_EFFECT.Text        +''',            ');
               //SQL.Add('        '''+ FL_KEYFACTOR.Text     +''',            ');
               SQL.Add('        '''+ FL_SUPEXTARGET.Text   +''',            ');
               SQL.Add('        '''+ FL_ACTPLAN.Text       +''',            ');
               SQL.Add('        '''+ FL_BIGO.Text          +''',            ');
               SQL.Add('        '''+ Fm_Main.Pempno        +''',            ');
               SQL.Add('        to_char(sysdate,''YYYYMMDDHHMISS'')       ) ');

               Execute;
          end;
     end;
     MessageDlg('성공적으로 저장하였습니다.', mtInformation, [mbOK], 0);
     B_cancel1Click(Sender);
end;

procedure TSubForm1.B_del1Click(Sender: TObject);
begin
     if  trim(E_itemno.text) = '' then
     begin
          MessageDlg('삭제할 자료가 없습니다.' +#13 + '확인 후 다시입력하십시오.',mtError,[mbOK],0);
          Exit;
     end;
     if MessageBox(handle,PChar('해당 세부과제를 삭제하시겠습니까?'), '확 인',  MB_YESNO or MB_DEFBUTTON2) <> IDYES then
     begin
          system.Exit;
     end;

     with Fm_Main.TMaxDML_HInsa do
     begin
          SQL.Clear;

          SQL.Text := format('delete from peAct1mas                       '+
                             ' where rabasyy   =''%s''                    '+
                             '   and empno     =''%s''                    '+
                             '   and itemno    =''%s''                    ',
                             [Fm_Main.LRabasyy, Fm_Main.ED_empno.text,E_Itemno.Text]);
          Close;
          ServiceName := 'PEA1060A_dml';
          Execute;
     end;
     MessageDlg('해당 세부과제를 삭제하였습니다.', mtInformation, [mbOK], 0);
     B_cancel1Click(Sender);
end;

procedure TSubForm1.B_Cancel1Click(Sender: TObject);
begin
     TextClear(1);
     TextClear(2);
     TextClear(3);
     TextClear(4);
     TextClear(5);
     Subject_data;
end;

procedure TSubForm1.E_Itemname1Enter(Sender: TObject);
begin
     E_itemno.Text := IntToStr(TOnMemo(Sender).Tag);
end;

procedure TSubForm1.E_Effect1KeyDown(Sender: TObject; var Key: Word;
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

procedure TSubForm1.ServerFileRead;
var  SqlText : String;
begin
//테이블에서 파일명 Read
  SqlText :=  'SELECT filename SEL_DATA                         '+
              '  FROM peactfile                                 '+
              ' WHERE RabasYM = '''+ FM_Main.LRabasYM      +''' '+
              '   And Empno   = '''+ FM_Main.Ed_empno.Text +''' ';
  FM_Main.Csel_SQL := SqlText;
  FM_Main.Csel_Open;

  vServerFileName   := FM_Main.DBcommon.FieldByName('SEL_DATA').AsString; //vRabasYY + '년_'+ ED_empno.Text +'_'+ vFilename;
  if  vServerFilename <> '' then
       L_AppFile.Caption := vServerFileName
  else
       L_AppFile.Caption := '첨부파일이 없습니다.';
end;

procedure TSubForm1.FtpConnect(vspt, vServerFileName : String);
begin
  FM_Main.SB_Help.Panels[1].Text := 'FTP 서버 접속중...';
  Application.ProcessMessages;

  vFTPsuccess := False;

  NMFTP1.Host     := FM_Main.PHost;
  NMFTP1.UserID   := FM_Main.PUserID;
  NMFTP1.Password := FM_Main.PPassword;
  Try
      NMFTP1.Connect;
  except
      MessageDlg('FTP 연결 실패 하였습니다...',mtError, [mbOk], 0);
      system.Exit;
  end;

  Try
      NMFTP1.Mode(MODE_image);
      if vspt = 'Upload'   then
         NMFTP1.Upload(vFullPath,'/hper/insa/HINSA/data/ActionData/' + vServerFileName);
      if vspt = 'Download' then
         NMFTP1.Download('/hper/insa/HINSA/data/ActionData/' + vServerFileName, 'C:\'+vServerFileName);
      if vspt = 'Delete'   then
         NMFTP1.Delete('/hper/insa/HINSA/data/ActionData/' + vServerFileName);
  except
      MessageDlg('FTP 작업 실패하였습니다...',mtError, [mbOk], 0);
      NMFTP1.Disconnect;
      system.Exit;
  end;
  NMFTP1.Disconnect;

  vFTPsuccess := True;

  FM_Main.SB_Help.Panels[1].Text := '작업 완료';
  Application.ProcessMessages;
end;

procedure TSubForm1.Bt_FileAppClick(Sender: TObject);
var  SqlText:String;
begin
  if TOnFocusButton(Sender).Caption = '파일Upload' then
  begin
       if MessageDlg('하나의 파일을 업로드 할수 있습니다.'+#13+#13+'진행 하시겠습니까?',
          mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit;
       if   OpenDialog1.Execute then vFullPath := OpenDialog1.FileName
       else Exit;

       vFilename := Copy(vFullPath, instr(vFullPath,'\')+1, Length(vFullPath)-instr(vFullPath,'\'));

       if FileExists(vFullPath) = True then
       begin
            FM_Main.SB_Help.Panels[1].Text := 'PC File을 서버에 전송하고 있습니다...';
            Application.ProcessMessages;

            vServerFileName    := Fm_Main.LRabasYY + '년_'+ Fm_Main.ED_empno.Text +'_'+ vFilename; //년초에 계획당시의 파일.
            FtpConnect('Upload', vServerFileName);

            if (not vFTPsuccess) then Exit;

            ////////////테이블에 Filename 1월에 저장.
            SqlText  := 'SELECT 1                                          '+
                        '  FROM peactfile                                  '+
                        ' WHERE RabasYM = '''+ Fm_Main.LRabasYM       +''' '+
                        '   And Empno   = '''+ Fm_Main.ED_empno.Text  +''' ';

            Fm_Main.Csel_SQL := SqlText;
            Fm_Main.Csel_Open;

            if Fm_Main.DBcommon.RecordCount = 0 then
            begin
                 SqlText  := 'Insert into peactfile (RabasYM, Empno, Filename, '+
                             '                       Writeemp, Writetime )     '+
                             ' Values (                                        '+
                             '          '''+  Fm_Main.LRabasYM         +''' ,  '+
                             '          '''+  Fm_Main.ED_empno.Text    +''' ,  '+
                             '          '''+  vServerFileName  +''' ,          '+
                             '          '''+  Fm_Main.pempno           +''' ,  '+
                             '          TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'') )';
            end
            else
            begin
                 SqlText  := 'update peactfile                                          '+
                             '   set filename = '''+ vServerFileName +''',              '+
                             '       Writeemp = '''+  Fm_Main.pempno +''' ,             '+
                             '       Writetime= TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'')   '+
                             ' WHERE rabasym  = '''+ Fm_Main.LRabasYM        +'''       '+
                             '   AND empno    = '''+ Fm_Main.ED_empno.Text   +'''       ';
            end;

            Fm_Main.Cupd_SQL := Sqltext;
            Fm_Main.Cupd_Exec;

            ShowMessage(vFilename + ' 파일을 서버에 Upload 하였습니다.');
            L_AppFile.Caption              := vServerFileName;
            TOnFocusButton(Sender).Caption := 'Upload파일삭제';
       end
       else FM_Main.SB_Help.Panels[1].Text := ' 파일이 존재하지 않습니다.';
  end
  else
  if TOnFocusButton(Sender).Caption = '파일Download' then
  begin
       if Trim(vServerFileName) <> '' then
       begin
            FtpConnect('Download', vServerFileName);

            if (not vFTPsuccess) then Exit;

            ShowMessage(vServerFileName + ' 파일을  C:\에 Download 하였습니다.');
       end
       else FM_Main.SB_Help.Panels[1].Text := ' 파일이 존재하지 않습니다.';
  end
  else
  if TOnFocusButton(Sender).Caption = 'Upload파일삭제' then
  begin
       if Trim(vServerFileName) <> '' then
       begin
            FtpConnect('Delete', vServerFileName);

            if (not vFTPsuccess) then Exit;

            SqlText  := 'update peactfile                                          '+
                        '   set filename   = Null,                                 '+
                        '       Writeemp   = '''+ Fm_Main.pempno          +''' ,   '+
                        '       Writetime  = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'') '+
                        ' WHERE rabasym    = '''+ Fm_Main.LRabasYM        +'''     '+
                        '   AND empno      = '''+ Fm_Main.ED_empno.Text   +'''     ';
            Fm_Main.Cupd_SQL := Sqltext;
            Fm_Main.Cupd_Exec;
            ShowMessage(vServerFileName + ' 파일을 서버에서 Delete 하였습니다.');
            vServerFileName                := '';
            L_AppFile.Caption              := '첨부파일이 없습니다.';
            TOnFocusButton(Sender).Caption := '파일Upload';
       end
       else FM_Main.SB_Help.Panels[1].Text := ' 파일이 존재하지 않습니다.';
  end;
end;

end.
