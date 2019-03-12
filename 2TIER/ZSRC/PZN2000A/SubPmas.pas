//Insert Into Pzsubmas (Empno, Kname, Orgnum, Deptcode) Values ('U000','������','H19','A0000')
//delete from poskmail where empno like 'U%'
//delete from pymenuuser where empno like 'U%'
unit SubPmas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OnEditStdCtrl, OnEditBtnCtrl, OnEditMdate, StdCtrls, OnFocusButton, Db,
  MemDS, DBAccess, Ora, Grids, DBGrids, OnEditBaseCtrl, ExtCtrls,
  OnShapeLabel, ComCtrls, OnEditCombo, OnEditNumCtl,
  Func, Buttons, CheckLst, Menus, OnScheme, Mask,
  comobj,   //����..
  ShellApi, OnEditMemo; //ShellExecute

type
  TFM_PMas = class(TForm)
    Qry_pmas: TOraQuery;
    Qry_pmasCOMCODE: TStringField;
    Qry_pmasEMPNO: TStringField;
    Qry_pmasKNAME: TStringField;
    Qry_pmasJUMINID: TStringField;
    Qry_pmasORGNUM: TStringField;
    Qry_pmasDEPTCODE: TStringField;
    Qry_pmasDEPTNAME: TStringField;
    Qry_pmasEMPDATE: TStringField;
    Qry_pmasRETDATE: TStringField;
    Qry_pmasHandP: TStringField;
    Qry_pmasOTEL: TStringField;
    Qry_pmasREGDATE: TStringField;
    Qry_pmasSKEMAIL: TStringField;
    Qry_pmasCJOB1: TStringField;
    DataSource1: TDataSource;
    SaveDialog1: TSaveDialog;
    SF_Main: TOnSchemeForm;
    OnShapeLabel1: TOnShapeLabel;
    OnShapeLabel2: TOnShapeLabel;
    L_CurDate: TLabel;
    OnShapeLabel3: TOnShapeLabel;
    E_kname: TOnEdit;
    P_helpinfo: TStatusBar;
    ED_empno: TOnEdit;
    DBG_user: TDBGrid;
    E_Comcode: TOnComboEdit;
    E_Deptname: TOnButtonEdit;
    ED_Korname: TOnEdit;
    Rbtn_A: TRadioButton;
    Rbtn_N: TRadioButton;
    Rbtn_Y: TRadioButton;
    E_juminid1: TOnEdit;
    E_Juminid2: TOnEdit;
    E_Empno: TOnEdit;
    E_empdate: TOnDateEdit;
    ED_Deptname: TOnButtonEdit;
    E_retdate: TOnDateEdit;
    E_HandP: TOnEdit;
    E_otel: TOnEdit;
    E_cjob1: TOnEdit;
    E_skemail: TOnEdit;
    ED_Comcode: TOnComboEdit;
    BT_Link: TOnFocusButton;
    BT_exit: TOnFocusButton;
    BT_cancel: TOnFocusButton;
    BT_save: TOnFocusButton;
    BT_delete: TOnFocusButton;
    BT_Input: TOnFocusButton;
    BT_batch: TOnFocusButton;
    BB_Excel: TOnFocusButton;
    bt_find: TOnFocusButton;
    E_payra: TOnEdit;
    Qry_pmasCOMNAME: TStringField;
    Qry_pmasWRITETIME: TStringField;
    Qry_pmasWRITEMAN: TStringField;
    E_HrisYN: TOnComboEdit;
    Qry_pmasWRITENAME: TStringField;
    Qry_pmasINTERFACE: TStringField;
    E_Interface: TOnEdit;
    E_WriteInfo: TOnEdit;
    OnShapeLabel4: TOnShapeLabel;
    RG1: TRadioGroup;
    E_SQL: TEdit;
    Qry_pmasHRISYN: TStringField;
    E_Deptcode: TOnButtonEdit;
    E_Orgnum: TOnButtonEdit;
    ED_Deptcode: TOnButtonEdit;
    ED_orgnum: TOnButtonEdit;

    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure BT_InputClick(Sender: TObject);
    procedure BT_deleteClick(Sender: TObject);
    procedure BT_saveClick(Sender: TObject);
    procedure BT_cancelClick(Sender: TObject);
    procedure BT_exitClick(Sender: TObject);
    procedure ED_empnoKeyPress(Sender: TObject; var Key: Char);
    procedure Rbtn_YClick(Sender: TObject);
    procedure E_DeptnameButtonClick(Sender: TObject; ButtonIndex: Integer);
    procedure BT_batchClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ED_ComcodeChange(Sender: TObject);
    procedure E_juminid1Change(Sender: TObject);
    procedure BB_ExcelClick(Sender: TObject);
    procedure E_Juminid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure E_ComcodeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure E_ComcodeChange(Sender: TObject);
    procedure PMessageCheck(MEdit : TOnEdit);
    procedure E_DeptnameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ED_DeptnameButtonClick(Sender: TObject;
      ButtonIndex: Integer);
    procedure ED_DeptnameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bt_findClick(Sender: TObject);
    procedure ED_DeptnameKeyPress(Sender: TObject; var Key: Char);
    procedure E_Juminid2Change(Sender: TObject);
    procedure E_Juminid2Exit(Sender: TObject);
    procedure E_juminid1Exit(Sender: TObject);
    procedure BT_LinkClick(Sender: TObject);
    procedure RG1Click(Sender: TObject);

  private
    { Private declarations }
    FL_OPstate   : Integer; {0:����ִ»���, 1:�Է»���, 2:��������}
    FL_LastEmpno : string;
    Function  CheckJumin(No:String):Boolean;
    Function  JuminIdCheck : Boolean;
  public
    { Public declarations }
    FG_start      : Integer;
    FG_Empno      : String;
    FG_Gubn       : String;
    //2015.10.29.hjku.. e_orgnum, e_deptcode  �߰��� ���� ����.
    //FL_Orgnum     : String;
    //FL_DeptCode   : String;
    FL_DeptFind   : String;
    giJuminStart  : Integer;
    gsBeJuminid1  : String;
    gsBeJuminid2  : String;

    procedure Select_Query;
    function  CheckSpace(text : String) : integer; // �� ĭ üũ
  end;

var
  FM_PMas: TFM_PMas;

implementation

uses DeptForm, SubBatch, PZN2000A1;

{$R *.DFM}

//---------------------------
Function TFM_PMas.JuminIdCheck : Boolean;
var
  sImsiEmpno : String;
begin
  if ( Length(E_Juminid1.Text)+Length(E_Juminid2.Text) = 13 ) then
  begin
       if not CheckJumin( E_Juminid1.Text + E_Juminid2.Text ) then
       begin
          ShowMessage( '�߸� �Էµ� �ֹε�Ϲ�ȣ�Դϴ�.Check' );
          Result := False;
          Exit;
       end;
  end;
end;

Function TFM_PMas.CheckJumin(No:String):Boolean;
Const
  Weight : Packed Array [1..12] of Integer = ( 2, 3, 4, 5, 6, 7, 8, 9, 2, 3, 4, 5 );
Var
  Loop, Sum, Rest : Integer;
Begin
  Result:= True;
  //Exit;  //��û�� ���� ��ƾ ��� ����.

  If Length(No) <> 13 then
       Result:= False
  Else
       Try
            Sum   := 0;
            For  Loop := 1 to  12 do
                 Sum  := Sum + StrToInt(No[Loop])*Weight[Loop];
            Rest  := 11-(Sum Mod 11);
            If Rest = 11 then     Rest:= 1;
            If Rest = 10 then     Rest:= 0;
            Result:= Char(Rest+48) = No[13];
       Except
            Result:= False;
       End;
End;

procedure TFM_PMas.Select_Query;
var
  SearchOptions: TLocateOptions;
begin
  P_helpinfo.SimpleText := '�ش� �ڵ�з��� �ڷḦ ��ȸ�ϰ� �ֽ��ϴ�.';
  Application.ProcessMessages;
  with  Qry_pmas do
  begin
       Close;
       SQL.Clear;
       Sql.Add('Select a.Comcode,                                                          ');
       Sql.Add('       (Select codename From PZSUBCODE Where codeid = ''A001''             ');
       Sql.Add('           And useyn = ''Y'' And codeno = a.Comcode) COMNAME,              ');
       Sql.Add('       a.empno,                                                            ');
       Sql.Add('       a.KNAME,                                                            ');
       Sql.Add('       a.juminid,                                                          ');
       Sql.Add('       a.orgnum,                                                           ');
       Sql.Add('       a.deptcode,                                                         ');
       Sql.Add('       b.deptname,                                                         ');
       Sql.Add('       a.HandP,                                                            ');
       Sql.Add('       a.Otel,                                                             ');
       Sql.Add('       a.Regdate,                                                          ');
       Sql.Add('       decode(a.Empdate,'''','''',substr(a.Empdate,1,4)||''-''||           ');
       Sql.Add('              substr(a.Empdate,5,2)||''-''||substr(a.Empdate,7,2)) Empdate,');
       Sql.Add('       decode(a.Retdate,'''','''',substr(a.Retdate,1,4)||''-''||           ');
       Sql.Add('              substr(a.Retdate,5,2)||''-''||substr(a.Retdate,7,2)) Retdate,');
       Sql.Add('       a.SKemail,                                                          ');
       Sql.Add('       a.Cjob1,                                                            ');
       Sql.Add('       a.HRISYN,                                                           ');       
       Sql.Add('       a.writetime,                                                        ');
       Sql.Add('       a.writeman,                                                         ');
       Sql.Add('      (Select Korname From Pimpmas Where Empno = A.WRITEMAN) WriteName,    ');
       Sql.Add('       Decode(C.Empno,Null,''N'',''Y'') Interface                          ');
       Sql.Add('  From PZSUBMAS A, Pycdept B,                                              ');
       Sql.Add('      (Select Empno From Poskbasic Where Empno Like ''U%'') C              ');
       Sql.Add(' Where a.deptcode = b.deptcode                                             ');
       Sql.Add('   And a.orgnum   = b.orgnum                                               ');
       Sql.Add('   And a.Empno    = c.Empno(+)                                             ');

       if Rbtn_Y.Checked = True then begin
          Sql.Add(' And (Trim(a.Retdate) is null or trim(a.Retdate) = ''--''               ');
          Sql.Add('      or nvl(retdate,''99999999'')>= To_Char(Sysdate,''YYYYMMDD'') )    '); // 2018.11. Add
       end
       else if Rbtn_N.Checked = True then begin
          Sql.Add(' And (Trim(a.Retdate) is not null                                       ');
          Sql.Add('      or nvl(retdate,''99999999'')< To_Char(Sysdate,''YYYYMMDD'') )     '); // 2018.11. Add
       end;

       if ED_Comcode.Text <> '' then
          Sql.Add(' And (a.Comcode like '''+Copy(ED_Comcode.Text,1,4)+'%'+''' )            ');
       if ED_Empno.Text <> '' then
          Sql.Add(' And (a.empno like '''+ED_Empno.Text+'%'+''' )                          ');
       if ED_Korname.Text <> '' then
          Sql.Add(' And (a.KNAME like '''+'%'+ED_Korname.Text+'%'+''' )                    ');
       if ED_Deptname.Text <> '' then
          Sql.Add(' And (upper(b.deptname) like '''+'%'+ ED_Deptname.Text + '%' + ''')     ');

       if RG1.ItemIndex = 0 then
            Sql.Add('  order by 2, A.Empno                                                 ')
       else if RG1.ItemIndex = 1 then
            Sql.Add('  order by A.Empno                                                    ')
       else if RG1.ItemIndex = 2 then
            Sql.Add('  order by 8, A.Empno                                                 ');   E_SQL.Text := Sql.text;

       Open;

       P_helpinfo.SimpleText := inttostr(Qry_pmas.RecordCount) + '���� ��ȸ �Ǿ����ϴ�.';

       if Qry_pmas.RecordCount <= 0 then FL_OPstate := 1
       else                              FL_OPstate := 2; {��������}
       DBG_user.SetFocus;
  end;
end;
/////////////////////////////////////////////////////////////////////////////////

procedure TFM_PMas.FormCreate(Sender: TObject);
 var  i, j : integer;
begin
  giJuminStart := 0;
  with FM_MainMenu.Ora_Qry1 do
  begin
       Close;
       SQL.Clear;
       Sql.Add('Select CODENO, CODENAME  ');
       Sql.Add('  From PZSUBCODE         ');
       Sql.Add(' Where USEYN  = ''Y''    ');
       Sql.Add('   And CODEID = ''A001'' ');
       Sql.Add(' ORDER BY 1              ');
       Open;

       ED_Comcode.Items.Clear;
       E_Comcode.Items.Clear;
       first;
       for i := 1 to RecordCount do
       begin
            ED_Comcode.Items.Add(FieldByName('CODENO').AsString + ' - ' +FieldByName('CODENAME').AsString);
            E_Comcode.Items.Add(FieldByName('CODENO').AsString + ' - ' +FieldByName('CODENAME').AsString);
            next;
       end;
  end;

  if Copy(FG_empno,1,1) <> 'D' then E_SQL.Visible := False;
end;

procedure TFM_PMas.BT_exitClick(Sender: TObject);
begin
  Close;
end;

procedure TFM_PMas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Qry_pmas.Close;
  Action := caFree;
end;

procedure TFM_PMas.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  giJuminStart      := 0;
  E_comcode.Enabled := false;
  E_Comcode.Text   := Qry_pmasComcode.AsString;
  E_empno.Text     := Qry_pmasEMPNO.AsString;
  E_Kname.Text     := Qry_pmasKNAME.AsString;
  E_JuminID1.Text  := Copy(Qry_pmasJuminid.AsString,1,6);
  E_JuminID2.Text  := Copy(Qry_pmasJuminid.AsString,8,7);
  gsBeJuminid1     := E_JuminID1.Text;
  gsBeJuminid2     := E_JuminID2.Text;
  //2015.10.29.hjku.. e_orgnum, e_deptcode  �߰��� ���� ����.
  //FL_orgnum        := Qry_pmasORGNUM.AsString;
  //FL_DeptCode      := Qry_pmasDEPTCODE.AsString;
  E_Orgnum.Text    := Qry_pmasORGNUM.AsString;
  E_Deptcode.Text  := Qry_pmasDEPTCODE.AsString;
  E_Deptname.Text  := Qry_pmasDEPTNAME.AsString;
  E_HandP.Text     := Qry_pmasHandP.AsString;
  E_otel.Text      := Qry_pmasotel.AsString;
  E_Empdate.Text   := Qry_pmasEmpdate.AsString;
  E_Retdate.Text   := Qry_pmasRetdate.AsString;
  E_skemail.Text   := Qry_pmasskemail.AsString;
  E_cjob1.Text     := Qry_pmascjob1.AsString;
  E_HrisYN.Text    := Qry_pmasHrisYN.AsString;
  E_Interface.Text := Qry_pmasInterface.AsString;
  E_WriteInfo.Text := Qry_pmasWriteName.AsString +'  '+
                      Copy(Qry_pmasWritetime.AsString, 1,4) +'-'+
                      Copy(Qry_pmasWritetime.AsString, 5,2) +'-'+
                      Copy(Qry_pmasWritetime.AsString, 7,2) +' '+
                      Copy(Qry_pmasWritetime.AsString, 9,2) +':'+
                      Copy(Qry_pmasWritetime.AsString,11,2) +':'+
                      Copy(Qry_pmasWritetime.AsString,13,2);

  if  Qry_pmas.RecordCount <= 0 then FL_OPstate := 1
  else                               FL_OPstate := 2; {��������}

  if      Qry_pmas.BOF then P_helpinfo.SimpleText := '�ڷ��� ó���Դϴ�.'
  else if Qry_pmas.EOF then P_helpinfo.SimpleText := '�ڷ��� �������Դϴ�.'
  else                      P_helpinfo.SimpleText := '';
end;

procedure TFM_PMas.BT_InputClick(Sender: TObject);
begin
  FL_OPstate           := 1 ;{�Է»���}
  giJuminStart         := 1 ;

  ED_Comcode.ItemIndex := -1;
  ED_empno.Text        := '';
  ED_KorName.Text      := '';
  E_comcode.Enabled    := True;
  E_Comcode.ItemIndex  := -1;
  E_empno.Text         := '';
  E_Kname.Text         := '';
  E_JuminID1.Text      := '';
  E_JuminID2.Text      := '';
  //2015.10.29.hjku.. e_orgnum, e_deptcode  �߰��� ���� ����.
  //FL_orgnum            := '';
  //FL_DeptCode          := '';
  E_Orgnum.Text        := '';
  E_Deptcode.Text      := '';
  E_Deptname.Text      := '';
  E_HandP.Text         := '';
  E_otel.Text          := '';
  E_empdate.Text       := '';
  E_retdate.Text       := '';
  E_skemail.Text       := '@partner.sk.com';
  E_cjob1.Text         := '';
  E_HrisYN.Text        := 'N';
  P_helpinfo.SimpleText:= '���ο� �ڷḦ ����Ͻʽÿ�.';

  E_Comcode.SetFocus;
end;

procedure TFM_PMas.BT_cancelClick(Sender: TObject);
begin
  FL_OPstate           := 0 ; {����ִ»���}
  ED_Comcode.ItemIndex := -1;
  ED_empno.Text        := '';
  ED_KorName.Text      := '';
  E_Comcode.ItemIndex  := -1;
  E_comcode.Enabled    := false;  
  E_empno.Text         := '';
  E_Kname.Text         := '';
  E_JuminID1.Text      := '';
  E_JuminID2.Text      := '';
  //2015.10.29.hjku.. e_orgnum, e_deptcode  �߰��� ���� ����.
  //FL_orgnum            := '';
  //FL_DeptCode          := '';
  E_Orgnum.Text        := '';
  E_Deptcode.Text      := '';
  E_Deptname.Text      := '';
  E_HandP.Text         := '';
  E_otel.Text          := '';
  E_empdate.Text       := '';
  E_retdate.Text       := '';
  E_skemail.Text       := '@partner.sk.com';
  E_cjob1.Text         := '';
  P_helpinfo.SimpleText:= '';
  
  Select_Query;
end;

procedure TFM_PMas.BT_deleteClick(Sender: TObject);
var
  Save_Comcode, Save_empno, Jump_empno: string;
  SearchOptions: TLocateOptions;
begin
  if FL_OPstate <> 2 then {�������°� �ƴϸ�}
  begin
       P_helpinfo.SimpleText := '���õ� �ڷᰡ �����Ƿ� ������ �� �����ϴ�.';
       System.Exit;
  end;

  if MessageDlg('�����Ͻðڽ��ϱ� ?', mtConfirmation, [mbYes,mbNo], 0) <> mrYes then System.Exit;


  //////////////////////////////////////////////////////////////////////////////
  with FM_MainMenu.Ora_Qry1  do
  begin
       Close;
       SQL.Clear;
       Sql.Add('Select empno From poskmail                              ');
       Sql.Add(' Where empno    = ''' + E_empno.Text + '''              ');
       Sql.Add('   And workdate < ''' + copy(Fn_GetDateTimeStr,1,8)+''' ');
       Open;

       if RecordCount > 0 then
       begin
            ShowMessage('[ ���� �Ұ� ] '+#13+#13+
                        '�̹� �������̽��� �Ǿ��� ����Դϴ�.'+#13+#13+
                        '��� ó���Ͻñ� �ٶ��ϴ�.');
            Exit;
       end;
  end;
  //////////////////////////////////////////////////////////////////////////////
  try
       Save_Comcode := E_Comcode.Text;
       Save_empno   := E_empno.Text;

       Qry_pmas.Next;
       if Qry_pmas.eof then
       begin
            Qry_pmas.Prior;
            Jump_empno := Qry_pmasEMPNO.AsString;
       end
       else Jump_empno := Qry_pmasEMPNO.AsString;

       with FM_MainMenu.Ora_Qry1  do
       begin
            Close;  //�����η� ������ ����.
            SQL.Clear;
            Sql.Add('Delete From PZSUBMAS Where EMPNO = '''+ Save_empno +''' ');
            ExecSql;

            Close;  //SK��Ż �������� ���̺� ����.
            SQL.Clear;
            Sql.Add('Select empno From poskmail                              ');
            Sql.Add(' Where empno    = ''' + E_empno.Text + '''              ');
            Sql.Add('   And workdate = ''' + copy(Fn_GetDateTimeStr,1,8)+''' ');
            Open;

            if RecordCount > 0 then
            begin
                 Close;
                 SQL.Clear;
                 Sql.Add('Delete poskmail                                         ');
                 Sql.Add(' Where empno    = ''' + E_empno.Text + '''              ');
                 Sql.Add('   And workdate = ''' + copy(Fn_GetDateTimeStr,1,8)+''' ');
                 ExecSql;
            end;

            ////////////////////////////////////////////////////////////////////
            Close;  //�����λ� �޴� User ���̺� ����
            SQL.Clear;
            Sql.Add('Select empno From pymenuuser            ');
            Sql.Add(' Where empno = ''' + E_empno.Text + ''' ');
            Open;

            if RecordCount > 0 then
            begin
                 Close;
                 SQL.Clear;
                 Sql.Add('Delete pymenuuser                       ');
                 Sql.Add(' Where empno = ''' + E_empno.Text + ''' ');
                 ExecSql;
            end;
       end;

       FL_Lastempno := '';
       bt_findClick(Sender);

       SearchOptions := [loPartialKey];
       if Qry_pmas.Locate('EMPNO', Jump_empno, SearchOptions) then DBG_user.SetFocus;

       P_helpinfo.SimpleText := '�����Ǿ����ϴ�.';
  except on E: Exception do
       begin
            MessageDlg(E.Message, mtError, [mbOk], 0);
            BT_cancelClick(Sender);
       end;
  end;
end;

procedure TFM_PMas.BT_saveClick(Sender: TObject);
var vAllCnt, vChangeCnt : integer;
    vJuminid, vMaxWorkdate, vMaxWorkdate1, vToday : String;
begin
  vJuminid := E_JuminID1.Text+'-'+E_JuminID2.Text;

  if giJuminStart = 0 then
  begin
       giJuminStart := 2;

       if (gsBeJuminid1 = E_juminid1.Text) And (gsBeJuminid2 = E_juminid2.Text) then
       else
       begin
            if not JuminIdCheck then Exit;
       end;
  end;

  if FL_OPstate = 0 then  {����ִ»���}
  begin
       P_helpinfo.SimpleText := '�ڷᰡ ���� ������ �� �����ϴ�.';
       giJuminStart := 0;
       System.Exit;
  end;

  if E_Comcode.Text  = '' then
  begin
       MessageBox(HAndle,'[ȸ��Code] �Էµ��� �ʾҽ��ϴ�.' , '���', MB_ICONWARNING);
       Exit;
  end;

  if Trim(E_Kname.Text) = '' then
  begin
       MessageBox(HAndle, '[�� ��] �Էµ��� �ʾҽ��ϴ�.', '���', MB_ICONWARNING);
       Exit;
  end;

  if (FL_OPstate = 5) or (E_JuminID1.Text = '') or (E_JuminID2.Text = '') then  {����ִ»���}
  begin
       MessageBox(HAndle, '�߸��� �ֹι�ȣ �Է����� ������ �� �����ϴ�.', '���', MB_ICONWARNING);
       Exit;
  end;

  if (Length(E_juminid1.Text) <> 6) or (Length(E_juminid2.Text) <> 7) then
  begin
       MessageBox(HAndle, '[�ֹε�Ϲ�ȣ] �Էµ��� �ʾҽ��ϴ�.', '���', MB_ICONWARNING);
       Exit;
  end;

  if Trim(E_Deptname.Text) = '' then
  begin
       MessageBox(HAndle, '[�μ���] �Էµ��� �ʾҽ��ϴ�.', '���', MB_ICONWARNING);
       Exit;
  end;

  if Length(Trim(E_Empdate.Text)) <> 10 then
  begin
       MessageBox(HAndle, '[�Ի���] ��Ȯ�ϰ� �Էµ��� �ʾҽ��ϴ�.', '���', MB_ICONWARNING);
       Exit;
  end;

  if Length(Trim(E_handp.Text)) <> 13 then
  begin
       MessageBox(HAndle, '[�ڵ���] ��Ȯ�ϰ� �Էµ��� �ʾҽ��ϴ�.', '���', MB_ICONWARNING);
       Exit;
  end;

  //dsa2000  2018.04.05  ������ ���� ��û. 
  if ( Pos('@partner.sk.com', LowerCase(E_skemail.Text)) = 0 ) or                    //@partner.sk.com ������
     (Length(Trim(SearchAndReplace(E_skemail.Text,'@partner.sk.com',' '))) < 3) or   //������ ��Ȯ�ϰ� �Է����� ������ ���� �Ұ�.
     (checkSpace(E_skemail.Text) = 1)                                                //�� ĭ�� ������ ���� �Ұ�
  then
  begin
       MessageBox(HAndle, '[����Ұ�] sk.com���� ������ �� ĭ�� �ְų� ��Ȯ�ϰ� �Էµ��� �ʾҽ��ϴ�.', '���', MB_ICONWARNING);
       E_skemail.SetFocus;
       Exit;
  end;

  try
       if FL_OPstate = 1 then {�Է»���}
       begin
            with FM_MainMenu.Ora_Qry1 do
            begin
                 Close;
                 SQL.Clear;
                 Sql.Add('Select EMPNO From PZSUBMAS          ');
                 Sql.Add(' Where EMPNO = '''+E_empno.Text+''' ');
                 Open;

                 if RecordCount > 0 then
                 begin
                      Close;
                      MessageBox(HAndle, '�̹� ������ �����ȣ�� �����մϴ�.', '�Է¿���', MB_ICONWARNING);
                      System.Exit;
                 end;

                 Close;
                 SQL.Clear;
                 Sql.Add('Select EMPNO From PZSUBMAS ');
                 Sql.Add(' Where (Trim(Retdate) is null  Or  Trim(Retdate) =''--'' )  ');
                 Sql.Add('   And JUMINID = '''+ E_JuminID1.Text +''' ||''-''|| '''+E_JuminID2.Text  +'''   ');
                 Open;

                 if RecordCount > 0 then
                 begin
                      Close;
                      MessageBox(HAndle, '�ߺ��� �ֹι�ȣ �Է� ��������� ���               '+#13#10+
                                         '�������� ���� ����� ���������� �ش��� �˻���    '+#13#10+
                                         '��� ó�� �� ����� �ֽñ� �ٶ��ϴ�. ', '�Է¿���', MB_ICONWARNING);
                      System.Exit;
                 end;

                 FL_Lastempno := E_empno.Text;
                 Close;
                 SQL.Clear;
                 Sql.Add('INSERT INTO PZSUBMAS (Comcode,     ');
                 Sql.Add('                      EMPNO,       ');
                 Sql.Add('                      KNAME,       ');
                 Sql.Add('                      ORGNUM,      ');
                 Sql.Add('                      DEPTCODE,    ');
                 Sql.Add('                      JUMINID,     ');
                 Sql.Add('                      HandP,       ');
                 Sql.Add('                      Otel,        ');
                 Sql.Add('                      Regdate,     ');
                 Sql.Add('                      Empdate,     ');
                 Sql.Add('                      Retdate,     ');
                 Sql.Add('                      SKEmail,     ');
                 Sql.Add('                      Cjob1,       ');
                 Sql.Add('                      Payra,       ');
                 Sql.Add('                      HrisYN,      ');
                 Sql.Add('                      WRITETIME,   ');
                 Sql.Add('                      WRITEMAN   ) ');
                 Sql.Add('             VALUES (:PComcode,    ');
                 Sql.Add('                     :Pempno,      ');
                 Sql.Add('                     :Pkname,      ');
                 Sql.Add('                     :Porgnum,     ');
                 Sql.Add('                     :Pdeptcode,   ');
                 Sql.Add('                     :Pjuminid,    ');
                 Sql.Add('                     :PHandP,      ');
                 Sql.Add('                     :POtel,       ');
                 Sql.Add('                     To_Char(Sysdate,''YYYYMMDD''), ');
                 Sql.Add('                     :PEmpdate,    ');
                 Sql.Add('                     :PRetdate,    ');
                 Sql.Add('                     :PSKemail,    ');
                 Sql.Add('                     :PCjob1,      ');
                 Sql.Add('                     ''K11'',      ');
                 Sql.Add('                     :PhrisYN,      ');
                 Sql.Add('                     To_Char(Sysdate,''yyyymmddhh24miss''),  ');
                 Sql.Add('                     :Pwriteman  ) ');

                 ParamByName('PComcode').AsString  := Copy(E_Comcode.Text,1,4);
                 ParamByName('Pempno').AsString    := E_empno.Text;
                 ParamByName('Pkname').AsString    := E_Kname.Text;
                 ParamByName('Porgnum').AsString   := FM_MainMenu.FG_Orgnum;
                 //2015.10.29.hjku.. e_orgnum, e_deptcode  �߰��� ���� ����.
                 //ParamByName('Pdeptcode').AsString := FL_DeptCode;
                 ParamByName('Pdeptcode').AsString := E_DeptCode.Text;
                 ParamByName('Pjuminid').AsString  := E_JuminID1.Text+'-'+E_JuminID2.Text;
                 ParamByName('PHandP').AsString    := E_HandP.Text;
                 ParamByName('POtel').AsString     := E_Otel.Text;
                 ParamByName('PEmpdate').AsString  := Trim(ReMoveChar(E_Empdate.Text,'-'));
                 ParamByName('PRetdate').AsString  := Trim(ReMoveChar(E_Retdate.Text,'-'));
                 ParamByName('PSKemail').AsString  := E_SKemail.Text;
                 ParamByName('PCjob1').AsString    := E_Cjob1.Text;
                 ParamByName('PhrisYN').AsString   := E_hrisYN.Text;
                 ParamByName('Pwriteman').AsString := FM_MainMenu.FG_Empno;
                 ExecSql;
            end;
       end
       ////////////////////////////////////////////////////////////////////////////
       else
       begin
            if E_empno.Text = Qry_pmasEMPNO.AsString then {���븸 ����}
            begin
                 FL_Lastempno := E_empno.Text;
                 with  FM_MainMenu.Ora_Qry1   do
                 begin
                      Close;
                      SQL.Clear;
                      Sql.Add('Update PZSUBMAS                  ');
                      Sql.Add('   SET Comcode   = :PComcode,    ');
                      Sql.Add('       KNAME     = :Pkname,      ');
                      Sql.Add('       ORGNUM    = :Porgnum,     ');
                      Sql.Add('       DEPTCODE  = :Pdeptcode,   ');
                      Sql.Add('       JUMINID   = :Pjuminid,    ');
                      Sql.Add('       HandP     = :PHandP,      ');
                      Sql.Add('       Otel      = :POtel,       ');
                      Sql.Add('       Empdate   = :PEmpdate,    ');
                      Sql.Add('       Retdate   = :PRetdate,    ');
                      Sql.Add('       SKEmail   = :PSKemail,    ');
                      Sql.Add('       Cjob1     = :PCjob1,      ');
                      Sql.Add('       hrisYN    = :PhrisYN,     ');
                      Sql.Add('       WRITETIME = To_Char(Sysdate,''yyyymmddhh24miss''),  ');
                      Sql.Add('       WRITEMAN  = :Pwriteman    ');
                      Sql.Add(' Where EMPNO     = :Pempno       ');

                      ParamByName('PComcode').AsString   := Copy(E_Comcode.Text,1,4);
                      ParamByName('Pempno').AsString     := E_empno.Text;
                      ParamByName('Pkname').AsString     := E_Kname.Text;
                      //2015.10.29.hjku.. e_orgnum, e_deptcode  �߰��� ���� ����.
                      //if FL_Orgnum = '' then ParamByName('Porgnum').AsString := FM_MainMenu.FG_Orgnum
                      //else                   ParamByName('Porgnum').AsString := FL_Orgnum;
                      //ParamByName('Pdeptcode').AsString  := FL_DeptCode;
                      if trim(E_Orgnum.Text) = '' then ParamByName('Porgnum').AsString := FM_MainMenu.FG_Orgnum
                      else                             ParamByName('Porgnum').AsString := trim(E_Orgnum.Text);
                      ParamByName('Pdeptcode').AsString  := E_DeptCode.Text;
                      ParamByName('Pjuminid').AsString   := vJuminid;
                      ParamByName('PHandP').AsString     := E_HandP.Text;
                      ParamByName('POtel').AsString      := E_Otel.Text;
                      ParamByName('PEmpdate').AsString   := Trim(ReMoveChar(E_Empdate.Text,'-'));
                      ParamByName('PRetdate').AsString   := Trim(ReMoveChar(E_Retdate.Text,'-'));
                      ParamByName('PSKemail').AsString   := E_SKemail.Text;
                      ParamByName('PCjob1').AsString     := E_Cjob1.Text;
                      ParamByName('PhrisYN').AsString    := E_hrisYN.Text;
                      ParamByName('Pwriteman').AsString  := FM_MainMenu.FG_Empno;
                      ExecSql;
                 end;
            end;
       end; //if FL_OPstate = 1 then {�Է»���}


       /////////////////////////////////////////////////////////////////////////
       //  ���� �ܺ� �������̽�
       //select * from poskmail where empno like 'U%'
       //select * from pymenuuser where empno like 'U%'
       //select * from Hint_Empinfo where empno like 'U%'
       /////////////////////////////////////////////////////////////////////////
       //Pymenuuser :  �����λ� �޴� User ���̺� ���
       with FM_MainMenu.Ora_Qry1 do
       begin
            Close;
            SQL.Clear;
            Sql.Add('Select empno From pymenuuser            ');
            Sql.Add(' Where empno = ''' + E_empno.Text + ''' ');
            Open;

            if (RecordCount = 0) and (E_hrisYN.Text = 'Y') then
            begin
                 Close;
                 SQL.Clear;
                 Sql.Add('insert into pymenuuser                  ');
                 Sql.Add(' ( GROUPID, EMPNO, KORNAME, PASSWORD,   ');
                 Sql.Add('   GRADE, LOCKYN, WRITETIME, WRITEMAN ) ');
                 Sql.Add(' values                                 ');
                 Sql.Add(' ( ''G099'',                            ');
                 Sql.Add('   '''+ E_empno.Text        + ''',      ');
                 Sql.Add('   '''+ E_kname.Text        + ''',      ');
                 Sql.Add('   '''+ E_empno.Text        + ''',      ');
                 Sql.Add('   ''EEEEEEEEEE'',                      ');
                 Sql.Add('   ''N'',                               ');
                 Sql.Add('   '''+ Fn_GetDateTimeStr   + ''',      ');
                 Sql.Add('   '''+ FM_MainMenu.FG_Empno+ ''' )     ');
                 ExecSql;
            end
            else if (RecordCount > 0) and (E_hrisYN.Text = 'N') then
            begin
                 Close;
                 SQL.Clear;
                 Sql.Add('Delete pymenuuser                       ');
                 Sql.Add(' Where empno = ''' + E_empno.Text + ''' ');
                 ExecSql;
            end;

       //////////////////////////////////////////////////////////////////////////////
       //�ܺ��������̽� poskmail : SK��Ż �������� ���̺� ���.
            Close;
            SQL.Clear;
            Close;
            SQL.Clear;
            Sql.Add('Select empno From poskmail                              ');
            Sql.Add(' Where empno    = ''' + E_empno.Text + '''              ');
            Sql.Add('   And workdate = ''' + copy(Fn_GetDateTimeStr,1,8)+''' ');
            Open;

            if RecordCount = 0 then
            begin
                 Close;
                 SQL.Clear;
                 Sql.Add(' insert into poskmail                             ');
                 Sql.Add('        (WORKDATE, OPERATION, CMPCD, CMPPW, EMPNO,');
                 Sql.Add('         JUMINID,  SKMAIL, WRITEEMP, WRITETIME,   ');
                 Sql.Add('         EAIYN, EAITIME, SUCCESSYN, SUCCESSTIME ) ');
                 Sql.Add(' values (''' + copy(Fn_GetDateTimeStr,1,8) +''',  ');
                 Sql.Add('         ''C'', ''SKB'',''SKB'',                  ');
                 Sql.Add('         ''' + E_empno.Text         + ''', '''',  ');
                 Sql.Add('         ''' + E_SKemail.Text       + ''',        ');
                 Sql.Add('         ''' + FM_MainMenu.FG_Empno + ''',        ');
                 Sql.Add('         ''' + Fn_GetDateTimeStr    + ''',        ');
                 Sql.Add('         ''Y'','''','''',''''                   ) ');    // E_SQL.Text :=  sql.text;  exit;
                 ExecSql;
            end
            else if RecordCount > 0 then // ���� �����Ͱ� �����ϸ� Update
            begin
                 Close;
                 SQL.Clear;
                 Sql.Add('Update poskmail                                         ');
                 Sql.Add('   set skmail    = ''' + E_SKemail.Text       + ''',    ');
                 Sql.Add('       writetime = ''' + Fn_GetDateTimeStr    + ''',    ');
                 Sql.Add('       writeemp  = ''' + FM_MainMenu.FG_Empno + '''     ');
                 Sql.Add(' Where empno     = ''' + E_empno.Text         + '''     ');
                 Sql.Add('   And workdate  = ''' + copy(Fn_GetDateTimeStr,1,8)+'''');
                 ExecSql;
            end;

(*2014.01.15.HJKU..  insa2hint_eai �� �ű�.. ����Ȯ��..
       //////////////////////////////////////////////////////////////////////////////
       //�ܺ��������̽� Hint_Empinfo : �λ������� BroadNet���� �������� ���̺� ���
            Close;
            SQL.Clear;
            Sql.Add('Select Max(workdate) work From Hint_Empinfo       ');
            Sql.Add(' Where empno    = ''' + E_empno.Text + '''        ');
            Sql.Add(' Group By empno                                   ');
            Open;
            vMaxWorkdate := FieldByName('work').AsString;  //�̷¿��� �� ��������� üũ

            Close;
            SQL.Clear;
            Sql.Add('Select Max(workdate) work From Hint_Empinfo       ');
            Sql.Add(' Where empno    = ''' + E_empno.Text + '''        ');
            Sql.Add('   And workdate < To_Char(Sysdate,''YYYYMMDD'')   ');
            Sql.Add(' Group By empno                                   ');
            Open;
            vMaxWorkdate1 := FieldByName('work').AsString; //��������� üũ(���� ����)
            vToday        := Copy(Fn_GetDateTimeStr,1,8);

            Close;
            SQL.Clear;
            Sql.Add('Select empno From Hint_Empinfo                    ');
            Sql.Add(' Where workdate        = '''+ vMaxWorkdate   +''' ');
            Sql.Add('   and (trim(korname) <> '''+ E_kname.Text   +''' ');
            Sql.Add('        or   payra    <> ''K11''                  ');
            Sql.Add('        or   JUMINNO  <> '''+ vJuminid       +''' ');
            Sql.Add('        or   deptcode <> '''+ FL_DeptCode    +''' ');
            Sql.Add('        or   skemail  <> '''+ E_SKemail.Text +''')');
            Sql.Add('   and empno not in (Select empno from hint_empinfo                 ');
            Sql.Add('                      where workdate = to_char(sysdate,''YYYYMMDD'')');
            Sql.Add('                        and flag in (''A'',''D'') )                 ');
            Open;
            vChangeCnt := RecordCount;  //�̷� ��������� üũ

            if vMaxWorkdate = vToday then // ���� �����Ͱ� �����ϸ� Update
            begin
                 Close;
                 SQL.Clear;
                 Sql.Add('Update Hint_Empinfo                                ');
                 Sql.Add('   Set KORNAME  = '''+ E_kname.Text         + ''', ');
                 Sql.Add('       JUMINNO  = '''+ vJuminid             + ''', ');
                 Sql.Add('       DEPTCODE = '''+ FL_DeptCode          + ''', ');
                 Sql.Add('       SKEMAIL  = '''+ E_SKemail.Text       + ''', ');
                 Sql.Add('       writetime= '''+ Fn_GetDateTimeStr    + ''', ');
                 Sql.Add('       writeemp = '''+ FM_MainMenu.FG_Empno + '''  ');
                 Sql.Add(' Where empno    = '''+ E_empno.Text         + '''  ');
                 Sql.Add('   And workdate = '''+ vToday               + '''  ');    E_SQL.Text :=  sql.text;
                 ExecSql;
            end;

            if  (vMaxWorkdate = '') then  // �ű�
            begin
                 Close;
                 SQL.Clear;
                 Sql.Add(' insert into Hint_Empinfo                        ');
                 Sql.Add('        (WORKDATE, EMPNO,     KORNAME,   JUMINNO,');
                 Sql.Add('         DEPTCODE, PAYRA,     LANFRDATE, FLAG,   ');
                 Sql.Add('         EAI_DATE, EAI_FLAG,                     ');
                 Sql.Add('         SKEMAIL,  WRITETIME, WRITEEMP)          ');
                 Sql.Add(' values (''' + copy(Fn_GetDateTimeStr,1,8) +''', ');
                 Sql.Add('         ''' + E_empno.Text       + ''',         ');
                 Sql.Add('         ''' + E_kname.Text       + ''',         ');
                 Sql.Add('         ''' + vJuminid           + ''',         ');
                 Sql.Add('         ''' + FL_DeptCode        + ''',         ');
                 Sql.Add('         ''' + Copy(E_payra.Text,1,3) + ''',     ');
                 Sql.Add('         ''' + vToday               + ''',       ');
                 Sql.Add('         ''A'',   '''',   ''N'',                 ');
                 Sql.Add('         ''' + E_SKemail.Text       + ''',       ');
                 Sql.Add('         ''' + Fn_GetDateTimeStr    + ''',       ');
                 Sql.Add('         ''' + FM_MainMenu.FG_Empno + '''   )    ');   E_SQL.Text :=  sql.text;
                 ExecSql;
            end
            Else if (vMaxWorkdate <> vToday) and (Trim(ReMoveChar(E_Retdate.Text,'-')) <> '') then  //����
            begin
                 Close;
                 SQL.Clear;
                 Sql.Add(' insert into Hint_Empinfo                        ');
                 Sql.Add('        (WORKDATE, EMPNO,     KORNAME,   JUMINNO,');
                 Sql.Add('         DEPTCODE, PAYRA,     LANFRDATE, FLAG,   ');
                 Sql.Add('         EAI_DATE, EAI_FLAG,                     ');
                 Sql.Add('         SKEMAIL,  WRITETIME, WRITEEMP)          ');
                 Sql.Add(' values (''' + copy(Fn_GetDateTimeStr,1,8) +''', ');
                 Sql.Add('         ''' + E_empno.Text       + ''',         ');
                 Sql.Add('         ''' + E_kname.Text       + ''',         ');
                 Sql.Add('         ''' + vJuminid           + ''',         ');
                 Sql.Add('         ''' + FL_DeptCode        + ''',         ');
                 Sql.Add('         ''' + Copy(E_payra.Text,1,3) + ''',     ');
                 Sql.Add('         ''' + vToday               + ''',       ');
                 Sql.Add('         ''D'',   '''',   ''N'',                 ');
                 Sql.Add('         ''' + E_SKemail.Text       + ''',       ');
                 Sql.Add('         ''' + vToday               + ''',       ');
                 Sql.Add('         ''' + FM_MainMenu.FG_Empno + '''  )     ');   E_SQL.Text :=  sql.text;
                 ExecSql;
            end;

            if (vMaxWorkdate <> '') and (vMaxWorkdate <> vToday) and
               (Trim(ReMoveChar(E_Retdate.Text,'-')) = '') and (vChangeCnt > 0) then //�����
            begin
                 Close;
                 SQL.Clear;
                 Sql.Add(' insert into Hint_Empinfo                        ');
                 Sql.Add('        (WORKDATE, EMPNO, KORNAME,   JUMINNO,    ');
                 Sql.Add('         DEPTCODE, PAYRA, LANFRDATE, FLAG,       ');
                 Sql.Add('         EAI_DATE, EAI_FLAG,         SKEMAIL,    ');
                 Sql.Add('         WRITETIME, WRITEEMP)                    ');
                 Sql.Add(' values (''' + copy(Fn_GetDateTimeStr,1,8) +''', ');
                 Sql.Add('         ''' + E_empno.Text       + ''',         ');
                 Sql.Add('         ''' + E_kname.Text       + ''',         ');
                 Sql.Add('         ''' + vJuminid           + ''',         ');
                 Sql.Add('         ''' + FL_DeptCode        + ''',         ');
                 Sql.Add('         ''' + Copy(E_payra.Text,1,3) + ''',     ');
                 Sql.Add('         To_Char(Sysdate,''YYYYMMDD''),          ');
                 Sql.Add('         ''C'',   '''',   ''N'',                 ');
                 Sql.Add('         ''' + E_SKemail.Text       + ''',       ');
                 Sql.Add('         ''' + Fn_GetDateTimeStr    + ''',       ');
                 Sql.Add('         ''' + FM_MainMenu.FG_Empno + '''   )    ');  E_SQL.Text :=  sql.text;
                 ExecSql;
            end;
*)
       end; //with FM_MainMenu.Ora_Qry1  do
       //////////////////////////////////////////////////////////////////////////////

  except on E: Exception do
       begin
            MessageDlg(E.Message, mtError, [mbOk], 0);
            BT_cancelClick(Sender);
       end;
  end;
  
  bt_findClick(Sender);
  if Qry_pmas.Locate('EMPNO', FL_Lastempno, [loPartialKey]) then DBG_user.SetFocus;

  P_helpinfo.SimpleText := '���� �� �ܺ� �������̽��� �Ϸ��Ͽ����ϴ�.';
end;

procedure TFM_PMas.ED_empnoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key <> #13 then
       System.Exit;
  Key := #0;
  Select_Query;
end;

procedure TFM_PMas.Rbtn_YClick(Sender: TObject);
begin
  Select_Query;
end;

procedure TFM_PMas.E_DeptnameButtonClick(Sender: TObject;
  ButtonIndex: Integer);
begin
  FG_Gubn := '1';
  FDeptForm := TFDeptForm.Create(Self);
  Try
       if FDeptForm.Qry_dept.RecordCount = 1 then
            E_Deptname.Text :=  FDeptForm.E_DeptName.Text;

       FDeptForm.ShowModal;
  Finally
       FDeptForm.Free;
  end;
end;

procedure TFM_PMas.FormShow(Sender: TObject);
begin
  Application.ProcessMessages;

  L_CurDate.Caption := Copy(Fn_GetDateTimeStr,1,4)+'-'+
                       Copy(Fn_GetDateTimeStr,5,2)+'-'+
                       Copy(Fn_GetDateTimeStr,7,2);
  bt_findClick(Sender);
  ED_Korname.SetFocus;
end;

procedure TFM_PMas.ED_ComcodeChange(Sender: TObject);
begin
  Select_Query;
end;

procedure TFM_PMas.E_juminid1Exit(Sender: TObject);
begin
   if Length(E_Juminid1.Text) <> 6 then
   begin
        ShowMessage( '�ֹε�Ϲ�ȣ ���ڸ� �Է� �����Դϴ�.' );
        E_Juminid1.SetFocus;
   end;
end;

procedure TFM_PMas.E_Juminid2Exit(Sender: TObject);
begin
   if Length(E_Juminid2.Text) <> 7 then
   begin
        ShowMessage( '�ֹε�Ϲ�ȣ ���ڸ� �Է� �����Դϴ�.' );
        E_Juminid2.SetFocus;
   end;
end;

procedure TFM_PMas.E_juminid1Change(Sender: TObject);
begin
  if (FL_OPstate = 1) And (Length(E_Juminid1.Text) = 6) then
  begin
       E_JuminId2.SetFocus;
  end;
end;

procedure TFM_PMas.E_Juminid2Change(Sender: TObject);
begin
   if giJuminStart = 0 then Exit;

   if ( Length(E_Juminid1.Text)+Length(E_Juminid2.Text) = 13 ) then
   begin
        if not CheckJumin( E_Juminid1.Text + E_Juminid2.Text ) then
        begin
             if giJuminStart = 2 then
             begin
                  FL_OPstate := 5;
                  Exit;
             end;
             ShowMessage( '�߸� �Էµ� �ֹε�Ϲ�ȣ�Դϴ�.change' );
             FL_OPstate := 5;
             Exit;
        end;

        FL_OPstate := 1;
{       with Ory_juminid do
        begin
             Close;
             Sql.Clear;
             Sql.Add(' Select KNAME ');
             Sql.Add('   From PZSUBMAS ');
             Sql.Add('  Where juminid = ''' + E_Juminid1.Text + '-' + E_Juminid2.Text +  ''' ');
             Sql.Add('    And stateyn = ''Y'' ');//                 Sql.Add(' Where (Trim(Retdate) is null  Or  Trim(Retdate) =''--'' )  ');
             Open;

             if RecordCount >= 1 then
             begin
                  MessageDlg('�Է��Ͻ� �ֹε�� ������ �̹� ��ϵǾ� �ִ� �����Դϴ�.     '+  chr(13) + chr(10) +
                               '�ش� ������ ���� ���� ��ȸ �Ǵ� ���� ������ ���� �ÿ���   '+  chr(13) + chr(10) +
                               '�� ������ ���� ���� ��ȸ ->�� �����۾� -> �� ����' + '�� �����Ͻñ� �ٶ��ϴ�. ',
                               mtConfirmation, [ mbOK], 0) ;
                  FL_OPstate := 0;
             end;
        end; }
   end;
end;

procedure TFM_PMas.E_Juminid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key  of
       VK_RETURN,VK_TAB:
            begin
                 if ( Length(E_Juminid1.Text)+Length(E_Juminid2.Text) = 13 ) And
                    not CheckJumin( E_Juminid1.Text + E_Juminid2.Text )      then
                 begin
                      Beep;
                      ShowMessage( '�߸� �Էµ� �ֹε�Ϲ�ȣ�Դϴ�.KeyDown' );
                      FL_OPstate := 5;
                 end;
            end;
  else
       System.Exit;
  end;
end;

procedure TFM_PMas.E_ComcodeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  Str_Empno : String;
begin
  Case Key of
    VK_RETURN :
    begin
         if (E_Comcode.Text = '') or (FL_OPstate <> 1 ) then System.Exit;

         with FM_MainMenu.Ora_Qry1 do
         begin
              close;
              Sql.Clear;
              Sql.Add('Select decode(substr(max(empno),2,3),''999'',                                     ');
              Sql.Add('              decode(substr(max(empno),1,2),''U9'',''UA00'',                      ');
              Sql.Add('                     CHR(ASCII(substr(max(empno),1,1))+1)||''00''),               ');
              Sql.Add('       substr(max(empno),1,1)||                                                   ');
              Sql.Add('              Lpad(to_char(to_number(substr(max(empno),2,3))+1),3,''0'')) MAXEMPNO');
              Sql.Add('  From PZSUBMAS                                                                   ');
              Open;

              Str_Empno    := FieldByName('MAXEMPNO').AsString;
              E_Empno.Text := FieldByName('MAXEMPNO').AsString;
         end;
         E_Empno.Enabled   := False;
         E_Kname.SetFocus;
    end
  else
       System.Exit;
  end;
end;

procedure TFM_PMas.E_ComcodeChange(Sender: TObject);
var
  Str_Empno : String;
begin               // showmessage(Copy(E_Comcode.Text,1,4)); showmessage(inttostr(FL_OPstate));
    if (((E_Comcode.Text <> '') And (FL_OPstate = 1 ))
    or  ((E_Comcode.Text <> '') And (FL_OPstate = 3 ))) then
    begin
         with FM_MainMenu.Ora_Qry1 do
         begin
              close;
              Sql.Clear;
              Sql.Add('Select decode(substr(max(empno),2,3),''999'',                                     ');
              Sql.Add('              decode(substr(max(empno),1,2),''U9'',''UA00'',                      ');
              Sql.Add('                     CHR(ASCII(substr(max(empno),1,1))+1)||''00''),               ');
              Sql.Add('       substr(max(empno),1,1)||                                                   ');
              Sql.Add('              Lpad(to_char(to_number(substr(max(empno),2,3))+1),3,''0'')) MAXEMPNO');
              Sql.Add('  From PZSUBMAS                                                                   ');
              Open;

              Str_Empno    := FieldByName('MAXEMPNO').AsString;
              E_Empno.Text := FieldByName('MAXEMPNO').AsString;
         end;
         E_Empno.Enabled := False;
         E_Kname.SetFocus;
    end;
end;

procedure TFM_PMas.PMessageCheck(MEdit : TOnEdit);
begin
  showmessage('[' + MEdit.EditLabel.Caption + '] ���������� �Էµ��� �ʾҽ��ϴ�.');
  System.Exit;;
end;

procedure TFM_PMas.E_DeptnameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key = 13 then
  begin
       FDeptForm := TFDeptForm.Create(Self);
       Try
            FG_Gubn := '1';
            if E_Deptname.Text <> '' then
            begin
                 FDeptForm.E_Deptname.Text := FL_DeptFind;
                 FDeptForm.E_deptname.Text := E_Deptname.Text;
            end;

            if FDeptForm.Qry_dept.RecordCount = 0 then
                 Showmessage('�ڷᰡ �������� �ʽ��ϴ�.')
            else if FDeptForm.Qry_dept.RecordCount = 1 then
                 E_Deptname.Text :=  FDeptForm.Qry_dept.FieldByName('DEPTNAME').AsString
            else FDeptForm.ShowModal;
       Finally
            FDeptForm.Free;
       end;
  end;
end;

//--------------------------------------------------------------
procedure TFM_PMas.ED_DeptnameButtonClick(Sender: TObject;
  ButtonIndex: Integer);
begin
  FG_Gubn   := '2';
  FDeptForm := TFDeptForm.Create(Self);
  Try
       if FDeptForm.Qry_dept.RecordCount = 1 then
       begin
            ED_Deptname.Text := FDeptForm.E_DeptName.Text;
            FL_DeptFind      := FDeptForm.E_Deptname.Text;
       end;
       FDeptForm.ShowModal;
  Finally
       FDeptForm.Free;
  end;
end;

procedure TFM_PMas.ED_DeptnameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key = 13 then
  begin
       FG_Gubn := '2';
       FDeptForm := TFDeptForm.Create(Self);
       Try
            if ED_Deptname.Text <> '' then
            begin
                 FDeptForm.E_Deptname.Text := FL_DeptFind;
                 FDeptForm.E_deptname.Text := ED_Deptname.Text;
            end;

            if FDeptForm.Qry_dept.RecordCount = 0 then
                 Showmessage('�ڷᰡ �������� �ʽ��ϴ�.')
            else if FDeptForm.Qry_dept.RecordCount = 1 then
                 ED_Deptname.Text :=  FDeptForm.Qry_dept.FieldByName('DEPTNAME').AsString
            else FDeptForm.ShowModal;
       Finally
            FDeptForm.Free;
       end;
  end;
end;

procedure TFM_PMas.bt_findClick(Sender: TObject);
begin
  giJuminStart := 0;
  Select_Query;
end;

procedure TFM_PMas.ED_DeptnameKeyPress(Sender: TObject; var Key: Char);
begin
  if Key <> #13 then System.Exit;
  Key := #0;
  Select_Query;
end;

procedure TFM_PMas.BT_batchClick(Sender: TObject);
begin
  FM_Batch := TFM_Batch.Create(Self);
  FM_Batch.ShowModal;
  BT_findClick(Sender);
end;
                             
procedure TFM_PMas.BB_ExcelClick(Sender: TObject);
var XL, XArr: Variant;
    i,j,k: integer;
    SavePlace: TBookmark;
begin
  if Qry_pmas.RecordCount < 1 then
  begin
       showmessage('���� ��ȯ�� �ڷᰡ �����ϴ�.');
       exit;
  end;
  P_helpinfo.SimpleText := 'Excel�� ��ġ�Ǿ� �ִ��� �˻��ϰ� �ֽ��ϴ�.';

  XArr := VarArrayCreate([1, Qry_pmas.Fields.Count], VarVariant);
  try
       XL := CreateOLEObject('Excel.Application');
  except
       MessageDlg('Excel�� ��ġ�Ǿ� ���� �ʽ��ϴ�.', MtWarning, [mbok], 0);
       P_helpinfo.SimpleText := '';
       Exit;
  end;

  P_helpinfo.SimpleText := '�ڷḦ ��ȯ�ϰ� �ֽ��ϴ�.';
  XL.WorkBooks.Add;                          //���ο� ������ ����
  XL.Visible            := false;
  XL.WorkSheets[1].Name := '�����η� List';  //��Ʈ�� �ο�
  XL.Range['A1:O2'].Merge;                   //�� ����

  //TITLE NAME ����
  XL.Range['A1'].value  := '�����η� ��ϳ���';
  XL.Range['A1'].font.Size := 12;
  XL.Range['A1'].font.Bold := True;

  //�÷��� ����_����Ÿ�̺� ����
  XArr[ 1] := 'ȸ���ڵ�';
  XArr[ 2] := 'ȸ���';
  XArr[ 3] := '���';
  XArr[ 4] := '����';
  XArr[ 5] := '�ֹι�ȣ';
  XArr[ 6] := '����';
  XArr[ 7] := '�μ��ڵ�';
  XArr[ 8] := '�μ���';
  XArr[ 9] := '�Ի���';
  XArr[10] := '�����';
  XArr[11] := '�ڵ���';
  XArr[12] := '�繫��Tel';
  XArr[13] := 'SK-Email';
  XArr[14] := '�����λ�';
  XArr[15] := '������';

  XL.Range['A3', 'O3'].Value := XArr;
  k := 3;
  for i := 1 to 15 do
  begin
       XL.Range[CHR(64 + i) + '3'].HorizontalAlignment := 3;
       XL.Range[CHR(64 + i) + '3'].Interior.Color:= $00CBF0B3;
       XL.Range[CHR(64 + i) + '3'].font.Size := 10;
       XL.Range[CHR(64 + i) + '3'].font.Bold := True;
  end;

  //�˻��� �ڷḦ excel�� exportó�� ��Ų��.
  SavePlace := Qry_pmas.GetBookmark;
  Qry_pmas.DisableControls;
  Qry_pmas.First;     //Showmessage(inttostr(Qry_pmas.RecordCount));
  
  for i := 1 to  Qry_pmas.RecordCount do
  begin
       XArr[ 1] := Qry_pmas.FieldbyName('Comcode').AsString;
       XArr[ 2] := Qry_pmas.FieldByName('COMNAME').AsString;
       XArr[ 3] := ''''+Qry_pmas.FieldbyName('EMPNO').AsString;
       XArr[ 4] := Qry_pmas.FieldbyName('KNAME').AsString;
       XArr[ 5] := Copy(Qry_pmas.FieldByName('JUMINID').AsString,1,8)+'*****';
       XArr[ 6] := Qry_pmas.FieldByName('ORGNUM').AsString;
       XArr[ 7] := Qry_pmas.FieldByName('DEPTCODE').AsString;
       XArr[ 8] := Qry_pmas.FieldByName('DEPTNAME').AsString;
       XArr[ 9] := Qry_pmas.FieldByName('Empdate').AsString;
       XArr[10] := Qry_pmas.FieldByName('Retdate').AsString;
       XArr[11] := Qry_pmas.FieldByName('HandP').AsString;
       XArr[12] := Qry_pmas.FieldByName('Otel').AsString;
       XArr[13] := Qry_pmas.FieldByName('SKemail').AsString;
       XArr[14] := Qry_pmas.FieldByName('HrisYN').AsString;
       XArr[15] := Qry_pmas.FieldByName('Cjob1').AsString;

       XL.Range['A' + IntToStr(k+1), 'O' + IntToStr(k+1)].Value := XArr;
       inc(k);
       Qry_pmas.Next;
  end;

  //���⼭ ���ʹ� EXPORT�� EXCEL�ڷḦ ���ڰ� �ٹ̴� �κ��Դϴ�.
  XL.Range['A1', 'O' + IntToStr(k)].Borders.LineStyle   := 1;        //�׵θ����� �����.  1�� �Ǽ�
  XL.Range['A1', 'O' + IntToStr(k)].Borders.Weight      := 2;        //�׵θ��� �α� ����  2�� ����α�, 3�� ���� �β���
  XL.Range['A1', 'O' + IntToStr(k)].Borders.ColorIndex  := 1;        //�׵θ��� ������   1�� ������
  XL.Range['A1', 'O' + IntToStr(k)].font.name           := '����ü';
  XL.Range['A1', 'A1'].HorizontalAlignment              := 3;        //��� ����
  XL.Range['A3', 'O' + IntToStr(k)].font.Size           := 9;
  XL.Range['C4', 'O' + IntToStr(k)].HorizontalAlignment := 2;        //��������
  XL.Range['K4', 'O' + IntToStr(k)].HorizontalAlignment := 2;        //��������
  XL.Range['A1', 'O' + IntToStr(k)].Select;                          //�ڷḦ ��� Select�� �� --�ϴ� ����:  AutoFit ó���ϱ� ���ؼ���
  //XL.Range['J4', 'J' + IntToStr(k)].HorizontalAlignment := 1;        //��������
  XL.Selection.Columns.AutoFit;                                      //�ڵ�����
  XL.Range['A4', 'A4'].Select;                                       //A4���� Ŀ�� ��ġ��Ŵ
  XL.Visible := true;                                                //�����ڷ� ������
  Screen.Cursor := crDefault;
  Qry_pmas.GotoBookmark(SavePlace);
  Qry_pmas.FreeBookmark(SavePlace);
  Qry_pmas.EnableControls;
  P_helpinfo.SimpleText := '';
end;

procedure TFM_PMas.BT_LinkClick(Sender: TObject);
begin
  ShellExecute(0,'Open','http://account.toktok.sk.com/mailcertificationcenter/MailCheckLogin.aspx','','',SW_SHOWNORMAL);
end;

procedure TFM_PMas.RG1Click(Sender: TObject);
begin
  Select_Query;
end;

function TFM_PMas.CheckSpace(text: String): integer;
var
  i, flag : integer;
begin
  flag := 0 ;
  for i := 0 to length(text) do
  begin
    if text[i] = ' ' then flag := 1;
  end;

  result := flag;
end;

end.
