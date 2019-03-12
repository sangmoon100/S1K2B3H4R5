//Insert Into Pzsubmas (Empno, Kname, Orgnum, Deptcode) Values ('U000','강륜종','H19','A0000')
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
  comobj,   //엑셀..
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
    FL_OPstate   : Integer; {0:비어있는상태, 1:입력상태, 2:열람상태}
    FL_LastEmpno : string;
    Function  CheckJumin(No:String):Boolean;
    Function  JuminIdCheck : Boolean;
  public
    { Public declarations }
    FG_start      : Integer;
    FG_Empno      : String;
    FG_Gubn       : String;
    //2015.10.29.hjku.. e_orgnum, e_deptcode  추가로 인해 삭제.
    //FL_Orgnum     : String;
    //FL_DeptCode   : String;
    FL_DeptFind   : String;
    giJuminStart  : Integer;
    gsBeJuminid1  : String;
    gsBeJuminid2  : String;

    procedure Select_Query;
    function  CheckSpace(text : String) : integer; // 빈 칸 체크
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
          ShowMessage( '잘못 입력된 주민등록번호입니다.Check' );
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
  //Exit;  //요청에 의해 루틴 사용 안함.

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
  P_helpinfo.SimpleText := '해당 코드분류의 자료를 조회하고 있습니다.';
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

       P_helpinfo.SimpleText := inttostr(Qry_pmas.RecordCount) + '건이 조회 되었습니다.';

       if Qry_pmas.RecordCount <= 0 then FL_OPstate := 1
       else                              FL_OPstate := 2; {열람상태}
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
  //2015.10.29.hjku.. e_orgnum, e_deptcode  추가로 인해 삭제.
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
  else                               FL_OPstate := 2; {열람상태}

  if      Qry_pmas.BOF then P_helpinfo.SimpleText := '자료의 처음입니다.'
  else if Qry_pmas.EOF then P_helpinfo.SimpleText := '자료의 마지막입니다.'
  else                      P_helpinfo.SimpleText := '';
end;

procedure TFM_PMas.BT_InputClick(Sender: TObject);
begin
  FL_OPstate           := 1 ;{입력상태}
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
  //2015.10.29.hjku.. e_orgnum, e_deptcode  추가로 인해 삭제.
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
  P_helpinfo.SimpleText:= '새로운 자료를 등록하십시요.';

  E_Comcode.SetFocus;
end;

procedure TFM_PMas.BT_cancelClick(Sender: TObject);
begin
  FL_OPstate           := 0 ; {비어있는상태}
  ED_Comcode.ItemIndex := -1;
  ED_empno.Text        := '';
  ED_KorName.Text      := '';
  E_Comcode.ItemIndex  := -1;
  E_comcode.Enabled    := false;  
  E_empno.Text         := '';
  E_Kname.Text         := '';
  E_JuminID1.Text      := '';
  E_JuminID2.Text      := '';
  //2015.10.29.hjku.. e_orgnum, e_deptcode  추가로 인해 삭제.
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
  if FL_OPstate <> 2 then {열람상태가 아니면}
  begin
       P_helpinfo.SimpleText := '선택된 자료가 없으므로 삭제할 수 없습니다.';
       System.Exit;
  end;

  if MessageDlg('삭제하시겠습니까 ?', mtConfirmation, [mbYes,mbNo], 0) <> mrYes then System.Exit;


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
            ShowMessage('[ 삭제 불가 ] '+#13+#13+
                        '이미 인터페이스가 되어진 사번입니다.'+#13+#13+
                        '퇴사 처리하시기 바랍니다.');
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
            Close;  //도급인력 마스터 삭제.
            SQL.Clear;
            Sql.Add('Delete From PZSUBMAS Where EMPNO = '''+ Save_empno +''' ');
            ExecSql;

            Close;  //SK포탈 계정관리 테이블 삭제.
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
            Close;  //종합인사 메뉴 User 테이블 삭제
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

       P_helpinfo.SimpleText := '삭제되었습니다.';
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

  if FL_OPstate = 0 then  {비어있는상태}
  begin
       P_helpinfo.SimpleText := '자료가 없어 저장할 수 없습니다.';
       giJuminStart := 0;
       System.Exit;
  end;

  if E_Comcode.Text  = '' then
  begin
       MessageBox(HAndle,'[회사Code] 입력되지 않았습니다.' , '경고', MB_ICONWARNING);
       Exit;
  end;

  if Trim(E_Kname.Text) = '' then
  begin
       MessageBox(HAndle, '[성 명] 입력되지 않았습니다.', '경고', MB_ICONWARNING);
       Exit;
  end;

  if (FL_OPstate = 5) or (E_JuminID1.Text = '') or (E_JuminID2.Text = '') then  {비어있는상태}
  begin
       MessageBox(HAndle, '잘못된 주민번호 입력으로 저장할 수 없습니다.', '경고', MB_ICONWARNING);
       Exit;
  end;

  if (Length(E_juminid1.Text) <> 6) or (Length(E_juminid2.Text) <> 7) then
  begin
       MessageBox(HAndle, '[주민등록번호] 입력되지 않았습니다.', '경고', MB_ICONWARNING);
       Exit;
  end;

  if Trim(E_Deptname.Text) = '' then
  begin
       MessageBox(HAndle, '[부서명] 입력되지 않았습니다.', '경고', MB_ICONWARNING);
       Exit;
  end;

  if Length(Trim(E_Empdate.Text)) <> 10 then
  begin
       MessageBox(HAndle, '[입사일] 정확하게 입력되지 않았습니다.', '경고', MB_ICONWARNING);
       Exit;
  end;

  if Length(Trim(E_handp.Text)) <> 13 then
  begin
       MessageBox(HAndle, '[핸드폰] 정확하게 입력되지 않았습니다.', '경고', MB_ICONWARNING);
       Exit;
  end;

  //dsa2000  2018.04.05  서정배 수석 요청. 
  if ( Pos('@partner.sk.com', LowerCase(E_skemail.Text)) = 0 ) or                    //@partner.sk.com 없으면
     (Length(Trim(SearchAndReplace(E_skemail.Text,'@partner.sk.com',' '))) < 3) or   //계정을 정확하게 입력하지 않으면 저장 불가.
     (checkSpace(E_skemail.Text) = 1)                                                //빈 칸이 있으면 저장 불가
  then
  begin
       MessageBox(HAndle, '[저장불가] sk.com메일 계정이 빈 칸이 있거나 정확하게 입력되지 않았습니다.', '경고', MB_ICONWARNING);
       E_skemail.SetFocus;
       Exit;
  end;

  try
       if FL_OPstate = 1 then {입력상태}
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
                      MessageBox(HAndle, '이미 동일한 사원번호가 존재합니다.', '입력오류', MB_ICONWARNING);
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
                      MessageBox(HAndle, '중복된 주민번호 입력 오류사원에 경우               '+#13#10+
                                         '재직중인 동일 사원이 존재함으로 해당사원 검색후    '+#13#10+
                                         '퇴사 처리 후 등록해 주시기 바랍니다. ', '입력오류', MB_ICONWARNING);
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
                 //2015.10.29.hjku.. e_orgnum, e_deptcode  추가로 인해 삭제.
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
            if E_empno.Text = Qry_pmasEMPNO.AsString then {내용만 변경}
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
                      //2015.10.29.hjku.. e_orgnum, e_deptcode  추가로 인해 삭제.
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
       end; //if FL_OPstate = 1 then {입력상태}


       /////////////////////////////////////////////////////////////////////////
       //  이하 외부 인터페이스
       //select * from poskmail where empno like 'U%'
       //select * from pymenuuser where empno like 'U%'
       //select * from Hint_Empinfo where empno like 'U%'
       /////////////////////////////////////////////////////////////////////////
       //Pymenuuser :  종합인사 메뉴 User 테이블 등록
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
       //외부인터페이스 poskmail : SK포탈 계정관리 테이블 등록.
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
            else if RecordCount > 0 then // 당일 데이터가 존재하면 Update
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

(*2014.01.15.HJKU..  insa2hint_eai 로 옮김.. 팀장확인..
       //////////////////////////////////////////////////////////////////////////////
       //외부인터페이스 Hint_Empinfo : 인사정보를 BroadNet으로 전송위해 테이블 등록
            Close;
            SQL.Clear;
            Sql.Add('Select Max(workdate) work From Hint_Empinfo       ');
            Sql.Add(' Where empno    = ''' + E_empno.Text + '''        ');
            Sql.Add(' Group By empno                                   ');
            Open;
            vMaxWorkdate := FieldByName('work').AsString;  //이력여부 및 최종등록일 체크

            Close;
            SQL.Clear;
            Sql.Add('Select Max(workdate) work From Hint_Empinfo       ');
            Sql.Add(' Where empno    = ''' + E_empno.Text + '''        ');
            Sql.Add('   And workdate < To_Char(Sysdate,''YYYYMMDD'')   ');
            Sql.Add(' Group By empno                                   ');
            Open;
            vMaxWorkdate1 := FieldByName('work').AsString; //최종등록일 체크(오늘 제외)
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
            vChangeCnt := RecordCount;  //이력 변경분인지 체크

            if vMaxWorkdate = vToday then // 당일 데이터가 존재하면 Update
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

            if  (vMaxWorkdate = '') then  // 신규
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
            Else if (vMaxWorkdate <> vToday) and (Trim(ReMoveChar(E_Retdate.Text,'-')) <> '') then  //퇴직
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
               (Trim(ReMoveChar(E_Retdate.Text,'-')) = '') and (vChangeCnt > 0) then //변경분
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

  P_helpinfo.SimpleText := '저장 및 외부 인터페이스를 완료하였습니다.';
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
        ShowMessage( '주민등록번호 앞자리 입력 오류입니다.' );
        E_Juminid1.SetFocus;
   end;
end;

procedure TFM_PMas.E_Juminid2Exit(Sender: TObject);
begin
   if Length(E_Juminid2.Text) <> 7 then
   begin
        ShowMessage( '주민등록번호 뒷자리 입력 오류입니다.' );
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
             ShowMessage( '잘못 입력된 주민등록번호입니다.change' );
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
                  MessageDlg('입력하신 주민등록 정보는 이미 등록되어 있는 정보입니다.     '+  chr(13) + chr(10) +
                               '해당 직원에 대한 정보 조회 또는 정보 수정을 원할 시에는   '+  chr(13) + chr(10) +
                               '① 성명을 통한 정보 조회 ->② 변경작업 -> ③ 저장' + '을 수행하시기 바랍니다. ',
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
                      ShowMessage( '잘못 입력된 주민등록번호입니다.KeyDown' );
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
  showmessage('[' + MEdit.EditLabel.Caption + '] 정상적으로 입력되지 않았습니다.');
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
                 Showmessage('자료가 존재하지 않습니다.')
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
                 Showmessage('자료가 존재하지 않습니다.')
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
       showmessage('엑셀 변환할 자료가 없습니다.');
       exit;
  end;
  P_helpinfo.SimpleText := 'Excel이 설치되어 있는지 검색하고 있습니다.';

  XArr := VarArrayCreate([1, Qry_pmas.Fields.Count], VarVariant);
  try
       XL := CreateOLEObject('Excel.Application');
  except
       MessageDlg('Excel이 설치되어 있지 않습니다.', MtWarning, [mbok], 0);
       P_helpinfo.SimpleText := '';
       Exit;
  end;

  P_helpinfo.SimpleText := '자료를 변환하고 있습니다.';
  XL.WorkBooks.Add;                          //새로운 페이지 생성
  XL.Visible            := false;
  XL.WorkSheets[1].Name := '도급인력 List';  //시트명 부여
  XL.Range['A1:O2'].Merge;                   //셀 병합

  //TITLE NAME 설정
  XL.Range['A1'].value  := '도급인력 등록내역';
  XL.Range['A1'].font.Size := 12;
  XL.Range['A1'].font.Bold := True;

  //컬럼명 지정_서브타이블 지정
  XArr[ 1] := '회사코드';
  XArr[ 2] := '회사명';
  XArr[ 3] := '사번';
  XArr[ 4] := '성명';
  XArr[ 5] := '주민번호';
  XArr[ 6] := '차수';
  XArr[ 7] := '부서코드';
  XArr[ 8] := '부서명';
  XArr[ 9] := '입사일';
  XArr[10] := '퇴사일';
  XArr[11] := '핸드폰';
  XArr[12] := '사무실Tel';
  XArr[13] := 'SK-Email';
  XArr[14] := '종합인사';
  XArr[15] := '담당업무';

  XL.Range['A3', 'O3'].Value := XArr;
  k := 3;
  for i := 1 to 15 do
  begin
       XL.Range[CHR(64 + i) + '3'].HorizontalAlignment := 3;
       XL.Range[CHR(64 + i) + '3'].Interior.Color:= $00CBF0B3;
       XL.Range[CHR(64 + i) + '3'].font.Size := 10;
       XL.Range[CHR(64 + i) + '3'].font.Bold := True;
  end;

  //검색된 자료를 excel에 export처리 시킨다.
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

  //여기서 부터는 EXPORT된 EXCEL자료를 예쁘게 꾸미는 부분입니다.
  XL.Range['A1', 'O' + IntToStr(k)].Borders.LineStyle   := 1;        //테두리선을 만든다.  1은 실선
  XL.Range['A1', 'O' + IntToStr(k)].Borders.Weight      := 2;        //테두리선 두깨 설정  2는 보통두깨, 3은 무지 두꺼움
  XL.Range['A1', 'O' + IntToStr(k)].Borders.ColorIndex  := 1;        //테두리선 색상설정   1은 검은색
  XL.Range['A1', 'O' + IntToStr(k)].font.name           := '굴림체';
  XL.Range['A1', 'A1'].HorizontalAlignment              := 3;        //가운데 정렬
  XL.Range['A3', 'O' + IntToStr(k)].font.Size           := 9;
  XL.Range['C4', 'O' + IntToStr(k)].HorizontalAlignment := 2;        //좌측정렬
  XL.Range['K4', 'O' + IntToStr(k)].HorizontalAlignment := 2;        //좌측정렬
  XL.Range['A1', 'O' + IntToStr(k)].Select;                          //자료를 모두 Select한 후 --하는 이유:  AutoFit 처리하기 위해서임
  //XL.Range['J4', 'J' + IntToStr(k)].HorizontalAlignment := 1;        //우측정렬
  XL.Selection.Columns.AutoFit;                                      //자동정렬
  XL.Range['A4', 'A4'].Select;                                       //A4열에 커서 위치시킴
  XL.Visible := true;                                                //엑셀자료 보여줌
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
