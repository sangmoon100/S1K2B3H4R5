unit PEK1040A2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, Buttons, ExtCtrls, DBGrids, Db, DBClient, peoutlookbtn,
  PeJeonVertLabel, PeJeonLabel, ComCtrls, Tmax_DataSetText, OnEditBaseCtrl,
  OnEditStdCtrl, OnEditMemo, OnShapeLabel, OnDBGrid, OnFocusButton, Psock,
  NMFtp, Datelib, Func, pass, OnLineLabel;

type
  TSubForm1 = class(TForm)
    Panel1: TPanel;
    OnShapeLabel1: TOnShapeLabel;
    OnShapeLabel3: TOnShapeLabel;
    OnShapeLabel5: TOnShapeLabel;
    OnShapeLabel2: TOnShapeLabel;
    OnShapeLabel4: TOnShapeLabel;
    OnShapeLabel6: TOnShapeLabel;
    OnShapeLabel7: TOnShapeLabel;
    E_Itemname1: TOnMemo;
    E_KeyFactor1: TOnMemo;
    E_SupexTarget1: TOnMemo;
    E_ActPlan1: TOnMemo;
    E_Bigo1: TOnMemo;
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
    E_itemno: TOnEdit;
    TDS1: TTMaxDataSet;
    DataSource: TDataSource;
    Q_Subject: TTMaxDataSet;
    TMaxDataSet_HInsa: TTMaxDataSet;
    TMaxDataSet: TTMaxDataSet;
    OpenDialog1: TOpenDialog;
    NMFTP1: TNMFTP;
    BT_Save: TOnFocusButton;
    L_AppFile: TOnSectionLabel;
    Bt_FileApp: TOnFocusButton;
    P_ExceptMan: TPanel;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BT_SaveClick(Sender: TObject);
    procedure B_Cancel1Click(Sender: TObject);
    procedure E_Itemname1Enter(Sender: TObject);
    procedure E_Itemname1Exit(Sender: TObject);
    procedure Bt_FileAppClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    F_Effect    : Array [1..5] of String;
//    F_KeyFactor : Array [1..5] of String;
    F_ActPlan   : Array [1..5] of String;
    F_Bigo      : Array [1..5] of String;
    vSqlText    : String;
    vServerFileName, vFullPath, vFilename  : String;
    vFTPsuccess : Boolean;

    procedure TextClear(Itag : Integer);
    function  IsDataModified: Boolean;
    function  Csel_gfd(p_loc: Integer): String;
    procedure Subject_data;
    procedure ServerFileRead;
    procedure Edit_Enabled(Ttag : integer; TFlag : Boolean);
    procedure Edit_ReadOnly(TFlag : Boolean);
    procedure FtpConnect(vWork, vServerFileName : String);
  end;


var
  SubForm1: TSubForm1;

implementation
{$R *.DFM}
uses     HMainForm;

{------------------------------- Main ----------------------------------}
procedure TSubForm1.FormShow(Sender: TObject);
begin
  Application.ProcessMessages;
  if FM_Main.vExceptMan = 'Y' then
  begin
       P_ExceptMan.Visible := True;
       P_ExceptMan.Top     := 8;
       P_ExceptMan.Left    := 7;
       P_ExceptMan.Height  := 517;
       P_ExceptMan.Width   := 960;
  end
  else
  begin
       P_ExceptMan.Visible := False;
  end;

  if FM_Main.vRvalconYN = 'Y' then  Edit_ReadOnly(True)
  else                              Edit_ReadOnly(False);

  if (FM_Main.vRvalconYN = 'Y') then BT_Save.Enabled := False;

  ServerFileRead;
  if vServerFileName = '' then
      Bt_FileApp.Caption := '파일Upload'
  else
      Bt_FileApp.Caption := 'Upload파일삭제';

  // 결재상신 안했을 경우
  if (FM_Main.Ed_empno.Text  = FM_Main.E_ChangeEmp.Text ) then
  begin
       if (FM_Main.vRvalconYN <> 'Y') then
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
     FL_Comp : TOnMemo;
     FL_i    : Integer;
     vReadEmp : String;
begin   
  TextClear(1);
  if trim(E_Itemname1.Text) <> '' then  Edit_Enabled(1,True)
  else                                  Edit_Enabled(1,False);
  TextClear(2);
  if trim(E_Itemname2.Text) <> '' then  Edit_Enabled(2,True)
  else                                  Edit_Enabled(2,False);
  TextClear(3);
  if trim(E_Itemname3.Text) <> '' then  Edit_Enabled(3,True)
  else                                  Edit_Enabled(3,False);
  TextClear(4);
  if trim(E_Itemname4.Text) <> '' then  Edit_Enabled(4,True)
  else                                  Edit_Enabled(4,False);
  TextClear(5);
  if trim(E_Itemname5.Text) <> '' then  Edit_Enabled(5,True)
  else                                  Edit_Enabled(5,False);
  ////////////////////////////////////////

  //본인 데이터 없으면 팀장데이터 읽어오기.(최초)
  ParamVariant := 'SELECT 1                                     ' +
                  '  FROM peAct1mas                             ' +
                  ' WHERE rabasyy = '''+ FM_Main.vRabasYY +'''  ' +
                  '   AND empno   = '''+ FM_Main.Ed_empno.Text  +''' ';

  FM_Main.Csel_SQL := ParamVariant;
  FM_Main.Csel_Open;
  if  (FM_Main.vRabasYY = '2009') And (FM_Main.vDeptname = 'HR팀')  then
  begin
       ParamVariant := 'select ITEMNO, Itemname, Effect, KeyFactor, SupexTarget '+
                       '  from peAct1mas a                                      '+
                       ' WHERE rabasyy = '''+ FM_Main.vRabasYY +'''             '+
                       '   AND empno   = '''+ FM_Main.vE1empno +'''             '+
                       ' order by ITEMNO                                        '
  end
  else
//본인 데이터 없으면 팀장데이터 읽어오기.
//  if   FM_Main.DBcommon.RecordCount = 0 then
//  begin
       ParamVariant := 'select ITEMNO, Itemname, Effect, KeyFactor, SupexTarget '+
                       '  from peAct1mas a                                      '+
                       ' WHERE rabasyy = '''+ FM_Main.vRabasYY +'''             '+
                       '   AND empno   = '''+ FM_Main.vE1empno +'''             '+//팀장 데이터
                       '   and (select E1VALCONYN from peActfile                '+
                       '         where rabasym   = '''+FM_Main.vRabasYM+'''     '+
                       '           and empno     = a.empno)     = ''Y''         '+
                       ' order by ITEMNO                                        ';
{  end
  else
  begin
       ParamVariant := 'select ITEMNO, Itemname, Effect, KeyFactor, SupexTarget '+
                       '  from peAct1mas a                                      '+
                       ' WHERE rabasyy = '''+ FM_Main.vRabasYY +'''             '+
                       '   AND empno   = '''+ FM_Main.Ed_empno.Text +'''        '+//본인 데이터
                       ' order by ITEMNO                                        ';
  end;
}
  //////////////////////////////////////////////////////////////////////////////
  with  Q_Subject  do
  begin

       Close;
       ServiceName := 'HINSA_select3';
       ClearFieldInfo;
       AddField('ITEMNO'     , ftString    ,  2000  );
       AddField('Itemname'   , ftString    ,  2000  );
       AddField('Effect'     , ftString    ,  2000  );
       AddField('KeyFactor'  , ftString    ,  2000  );
       AddField('SupexTarget', ftString    ,  2000  );
       ClearParamInfo;
       SQL.Text := ParamVariant;      // edit1.text := SQL.Text;
       Open;

       if  (FM_Main.Pempno <> FM_Main.E_ChangeEmp.Text ) then
       else
       if  ((FM_Main.vExceptMan = 'N') and (recordcount < 1)) then
       begin
            MessageDlg('팀장님의 Action Contract 등록이 완료되신 후 작업하시기 바랍니다.',mtError, [mbOk],0);
          //  FM_Main.BT_ExitClick(FM_Main.BT_Exit);
       end;

       FL_Comp := nil;
       First;
       while not eof do
       begin
            FL_i := Fields[0].AsInteger;
            begin
                 FL_Comp := TOnMemo(Self.FindComponent('E_Itemname'   +IntToStr(FL_i)));
                 FL_Comp.Text      := Fields[1].AsString;
                 FL_Comp := TOnMemo(Self.FindComponent('E_Effect'     +IntToStr(FL_i)));
                 FL_Comp.Text      := Fields[2].AsString;
                 //FL_Comp := TOnMemo(Self.FindComponent('E_KeyFactor'  +IntToStr(FL_i)));
                 //FL_Comp.Text      := Fields[3].AsString;
                 FL_Comp := TOnMemo(Self.FindComponent('E_SupexTarget'+IntToStr(FL_i)));
                 FL_Comp.Text      := Fields[4].AsString;
                 Edit_Enabled(FL_i,True);
            end;
            Next;
       end;
       /////
       ParamVariant := 'select ITEMNO, ActPlan, Bigo, ''F4'', ''F5''      '+
                       '  from peAct1mas a                                '+
                       ' WHERE rabasyy = '''+ FM_Main.vRabasYY       +''' '+
                       '   AND empno   = '''+ FM_Main.Ed_empno.Text  +''' '+//본인꺼만 읽기.
                       ' order by ITEMNO                                  ';
       Close;
       ServiceName := 'HINSA_select3';
       ClearFieldInfo;
       AddField('ITEMNO' , ftString    ,  2000  );
       AddField('ActPlan', ftString    ,  2000  );
       AddField('Bigo'   , ftString    ,  2000  );
       AddField('F4'     , ftString    ,  2000  );
       AddField('F5'     , ftString    ,  2000  );
       ClearParamInfo;
       SQL.Text := ParamVariant;       //edit1.text := SQL.Text;
       Open;

       if Q_Subject.RecordCount < 1 then Exit;
       
       FL_Comp := nil;
       First;
       while not eof do
       begin
            FL_i := Fields[0].AsInteger;
            begin
                 FL_Comp := TOnMemo(Self.FindComponent('E_ActPlan'+IntToStr(FL_i)));
                 FL_Comp.Text      := Fields[1].AsString;
                 F_ActPlan[FL_i]   := Fields[1].AsString;
                 FL_Comp := TOnMemo(Self.FindComponent('E_Bigo'   +IntToStr(FL_i)));
                 FL_Comp.Text      := Fields[2].AsString;
                 F_Bigo[FL_i]      := Fields[2].AsString;
                 Edit_Enabled(FL_i,True);
            end;
            Next;
       end;
  end;
end;

procedure TSubForm1.ServerFileRead;
var  SqlText : String;
begin
//테이블에서 파일명 Read
  SqlText :=  'SELECT filename SEL_DATA                          '+
              '  FROM peactfile                                  '+
              ' WHERE RabasYM = '''+ FM_Main.vRabasYM       +''' '+
              '   And Empno   = '''+ FM_Main.Ed_empno.Text  +''' ';
  FM_Main.Csel_SQL := SqlText;
  FM_Main.Csel_Open;

  vServerFileName   := FM_Main.DBcommon.FieldByName('SEL_DATA').AsString; //vRabasYY + '년_'+ ED_empno.Text +'_'+ vFilename;
  if  vServerFilename <> '' then
       L_AppFile.Caption := vServerFileName
  else
       L_AppFile.Caption := '첨부파일이 없습니다.';
end;

function TSubForm1.Csel_gfd(p_loc: Integer): String;
var
  v_cnt, v_tmp: Integer;
  v_data: String;
begin
  Result := '';
  v_data := TMaxDataSet_HInsa.FieldByName('SEL_DATA').AsString;
  v_cnt := 1;
  while v_cnt < p_loc do
  begin
    v_tmp := Pos(';',v_data);
    if not(v_tmp > 0) then Exit;
    v_cnt := v_cnt + 1;
    Delete(v_data, 1, v_tmp);
  end;
  v_tmp := Pos(';',v_data) - 1;
  if v_tmp < 0 then v_tmp := Length(v_data);
  Result := Copy(v_data,1,v_tmp);
end;

function TSubForm1.IsDataModified: Boolean;
 var FL_Comp : TOnMemo;
     FL_i    : Integer;
begin
  Result := false;

  FL_Comp := nil;
  for FL_i := 1 to 5 do
  begin
       if (F_ActPlan[FL_i]   <> TOnMemo(Self.FindComponent('E_ActPlan'  +IntToStr(FL_i))).Text) or
          (F_Bigo[FL_i]      <> TOnMemo(Self.FindComponent('E_Bigo'     +IntToStr(FL_i))).Text) then Result := True;
  end;
end;

procedure TSubForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if (BT_Save.Visible) and (IsDataModified) then
  begin
       MessageBox(handle,'변동된 자료가 있으므로 먼저 저장하세요.','작업순서오류',MB_ICONWARNING);
       CanClose := False;
       System.Exit;
  end;
  CanClose := True;
end;

procedure TSubForm1.Edit_ReadOnly(TFlag : Boolean);
 var FL_Comp : TOnMemo;
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

  BT_Save.EnAbled := not TFlag
end;

procedure TSubForm1.Edit_Enabled(Ttag : integer; TFlag : Boolean);
 var FL_Comp : TOnMemo;
     FL_i    : Integer;
begin
  FL_Comp := nil;
  FL_i    := Ttag;

  FL_Comp := TOnMemo(Self.FindComponent('E_ActPlan'  +IntToStr(FL_i)));
  FL_Comp.Enabled := TFlag;
  FL_Comp := TOnMemo(Self.FindComponent('E_Bigo'     +IntToStr(FL_i)));
  FL_Comp.Enabled := TFlag;
end;

procedure TSubForm1.TextClear(Itag : Integer);
 var FL_Comp : TOnMemo;
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

  F_ActPlan[FL_i] := '';
  F_Bigo[FL_i]    := '';
end;

{------------------------------ Event ---------------------------------}
procedure TSubForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := cafree;
end;

procedure TSubForm1.BT_SaveClick(Sender: TObject);
var  i, Flag : integer;
     FL_itemno : String;
     FL_Itemname    :TOnMemo;
     FL_Effect      :TOnMemo;
     //FL_KeyFactor   :TOnMemo;
     FL_SUPEXTARGET :TOnMemo;
     FL_ACTPLAN     :TOnMemo;
     FL_BIGO        :TOnMemo;
begin
  if  (trim(E_ActPlan1.Text) = '') and (trim(E_ActPlan2.Text) = '') and (trim(E_ActPlan3.Text) = '') and
      (trim(E_ActPlan4.Text) = '') and (trim(E_ActPlan5.Text) = '') then
  begin
       MessageDlg('최소 하나 이상의 Action Plan을 입력하십시오.',mtError,[mbOK],0);
       Exit;
  end;

  with TMaxDataSet do
  begin
       SQL.Clear;
       SQL.Text := format('select count(*) SEL_DATA from peAct1mas  '+
                          ' where rabasyy   =''%s''                 '+
                          '   and empno     =''%s''                 ',
                          [Fm_Main.vRabasYY, FM_Main.Ed_empno.Text  ]);
       Close;
       ServiceName := 'PED0000A_common';
       ClearFieldInfo;
       AddField('SEL_DATA', ftInteger, 100);
       Open;
  end;

  if  TMaxDataSet.Fields[0].AsInteger <> 0 then
  begin
       with TMaxDataSet do
       begin
            SQL.Clear;

            SQL.Text := format('delete from peAct1mas                '+
                               ' where rabasyy   = ''%s''            '+
                               '   and empno     = ''%s''            ',
                               [Fm_Main.vRabasYY, FM_Main.Ed_empno.Text ]);
            Close;
            ServiceName := 'PEA1060A_dml';
            Execute;
       end;
  end;

  For i := 1 to 5 do
  begin
       FL_itemno      := IntToStr(i);
       FL_Itemname    := TOnMemo(Self.FindComponent('E_Itemname'   +IntToStr(i)));
       FL_Effect      := TOnMemo(Self.FindComponent('E_Effect'     +IntToStr(i)));
       //FL_KeyFactor   := TOnMemo(Self.FindComponent('E_KeyFactor'  +IntToStr(i)));
       FL_SUPEXTARGET := TOnMemo(Self.FindComponent('E_SUPEXTARGET'+IntToStr(i)));
       FL_ACTPLAN     := TOnMemo(Self.FindComponent('E_ACTPLAN'    +IntToStr(i)));
       FL_BIGO        := TOnMemo(Self.FindComponent('E_BIGO'       +IntToStr(i)));

       if trim(FL_Itemname.Text) = '' then
          Break;

       with TMaxDataSet do
       begin
            ServiceName := 'PEA1060A_dml';
            Close;
            Sql.Clear;
            SQL.Add('insert into peAct1mas                               ');
            SQL.Add('       (rabasyy,     empno,      Itemno,            ');
            SQL.Add('        Itemname,    Effect,                        ');  //KeyFactor,
            SQL.Add('        SupexTarget, ActPlan,    Bigo,              ');
            SQL.Add('        Writeemp,    Writetime                    ) ');
            SQL.Add('Values ('''+ Fm_Main.vRabasYY      +''',            ');
            SQL.Add('        '''+ FM_Main.Ed_empno.Text +''',            ');
            SQL.Add('        '  + FL_itemno             +  ',            ');
            SQL.Add('        '''+ FL_Itemname.Text      +''',            ');
            SQL.Add('        '''+ FL_Effect.Text        +''',            ');
            //SQL.Add('        '''+ FL_KeyFactor.Text     +''',            ');
            SQL.Add('        '''+ FL_SUPEXTARGET.Text   +''',            ');
            SQL.Add('        '''+ FL_ACTPLAN.Text       +''',            ');
            SQL.Add('        '''+ FL_BIGO.Text          +''',            ');
            SQL.Add('        '''+ Fm_Main.GSempno       +''',            ');
            SQL.Add('        to_char(sysdate,''YYYYMMDDHHMISS'')       ) ');

            Execute;
       end;
  end;
  if TOnFocusButton(Sender).name = 'BT_Save' then
  MessageDlg('성공적으로 저장하였습니다.', mtInformation, [mbOK], 0);
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

procedure TSubForm1.E_Itemname1Exit(Sender: TObject);
begin
  if  TOnMemo(Sender).lines.Count > 7  then
  begin
       MessageDlg('내용은 7줄까지만 작성가능합니다.',mtError, [mbOk],0);
       TOnMemo(Sender).SetFocus;
  end;
end;

procedure TSubForm1.FtpConnect(vWork, vServerFileName : String);
begin
  FM_Main.SB_Help.Panels[1].Text := 'FTP 서버 접속중...';
  Application.ProcessMessages;

  vFTPsuccess := False;

  NMFTP1.Host     := passEmp(cmdline,10);
  NMFTP1.UserID   := PassEmp(cmdline,11);
  NMFTP1.Password := PassEmp(cmdline,12);
  Try
      NMFTP1.Connect;
  except
      MessageDlg('FTP 연결 실패 하였습니다...',mtError, [mbOk], 0);
      system.Exit;
  end;

  Try
      NMFTP1.Mode(MODE_image);
      if vWork = 'Upload'   then
         NMFTP1.Upload(vFullPath,'/hper/insa/HINSA/data/ActionData/' + vServerFileName);
      if vWork = 'Download' then
         NMFTP1.Download('/hper/insa/HINSA/data/ActionData/' + vServerFileName, 'C:\'+vServerFileName);
      if vWork = 'Delete'   then
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

            vServerFileName    := Fm_Main.vRabasYY + '년_'+ Fm_Main.Ed_empno.Text  +'_'+ vFilename; //년초에 계획당시의 파일.
            FtpConnect('Upload', vServerFileName);

            if (not vFTPsuccess) then Exit;

            ////////////테이블에 Filename 1월에 저장.
            vSqlText := 'SELECT 1                                          '+
                        '  FROM peactfile                                  '+
                        ' WHERE RabasYM = '''+ Fm_Main.vRabasYM       +''' '+
                        '   And Empno   = '''+ Fm_Main.Ed_empno.Text   +''' ';

            Fm_Main.Csel_SQL := vSqlText;
            Fm_Main.Csel_Open;

            if Fm_Main.DBcommon.RecordCount = 0 then
            begin
                 vSqlText := 'Insert into peactfile (RabasYM, Empno, Filename, '+
                             '                       Writeemp, Writetime )     '+
                             ' Values (                                        '+
                             '          '''+  Fm_Main.vRabasYM         +''' ,  '+
                             '          '''+  Fm_Main.Ed_empno.Text    +''' ,  '+
                             '          '''+  vServerFileName  +''' ,          '+
                             '          '''+  Fm_Main.GSempno          +''' ,  '+
                             '          TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'') )';
            end
            else
            begin
                 vSqlText  := 'update peactfile                                         '+
                              '   set filename = '''+ vServerFileName +''',              '+
                              '       Writeemp = '''+ Fm_Main.GSempno +''' ,             '+
                              '       Writetime= TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'')   '+
                              ' WHERE rabasym  = '''+ Fm_Main.vRabasYM        +'''       '+
                              '   AND empno    = '''+ Fm_Main.Ed_empno.Text   +'''       ';
            end;

            Fm_Main.Cupd_SQL := vSqltext;
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

            vSqlText := 'update peactfile                                          '+
                        '   set filename   = Null,                                 '+
                        '       Writeemp   = '''+ Fm_Main.GSempno         +''' ,   '+
                        '       Writetime  = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'') '+
                        ' WHERE rabasym    = '''+ Fm_Main.vRabasYM        +'''     '+
                        '   AND empno      = '''+ Fm_Main.Ed_empno.Text   +'''     ';
            Fm_Main.Cupd_SQL := vSqltext;
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
