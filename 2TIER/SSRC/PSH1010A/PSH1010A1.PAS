unit PSH1010A1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, MemDS, DBAccess, Ora, OnScheme, ComCtrls, Pass, ExtCtrls,
  OnShapeLabel, StdCtrls, OnFocusButton, Grids, DBGrids, OnGrDBGrid,
  OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl, OnPersonEdit, OnEditMdate,
  OnMemDataset, OraError, OnEditNumCtl, Func, PeJeonLabel, pedbgrid, Mask,
  pebtnedit, peoutlookbtn, pegradpanl, OnPopupEdit, OnEditCombo;

type
  TFM_Mainform = class(TForm)
    Panel1: TPanel;
    SB_Help: TStatusBar;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label5: TLabel;
    TabSheet2: TTabSheet;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    NE_ZGIVEMAX1: TOnNumberEdit;
    NE_ZGIVEMAX2: TOnNumberEdit;
    NE_ZGIVEMAX3: TOnNumberEdit;
    ZGrid1: TOnGrDbGrid;
    PageControl3: TPageControl;
    TabSheet6: TTabSheet;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    E_ZMinAmt: TOnNumberEdit;
    E_Famirel: TOnWinPopupEdit;
    P_FamirelN: TPanel;
    Panel117: TPanel;
    E_zmaxamt: TOnNumberEdit;
    TabSheet3: TTabSheet;
    E_empno: TPePanelEdit;
    E_korname: TPePanelEdit;
    DBG_pkzspmas: TPeJeonDbGrid;
    L_tcnt: TPeJeonLabel;
    PageControl2: TPageControl;
    TabSheet5: TTabSheet;
    Ed_empno: TOnPersonPopupEdit;
    Ed_Bempno: TOnPersonPopupEdit;
    TabSheet4: TTabSheet;
    OnShapeLabel20: TOnShapeLabel;
    OnShapeLabel18: TOnShapeLabel;
    Label4: TLabel;
    GGrid1: TOnGrDbGrid;
    EDS_empno: TOnPersonPopupEdit;
    GGrid2: TOnGrDbGrid;
    BT_Add_P: TOnFocusButton;
    BT_Del_P: TOnFocusButton;
    BT_Exit: TOnFocusButton;
    BT_Save: TOnFocusButton;
    BT_Find: TOnFocusButton;
    Bt_Add: TOnFocusButton;
    Bt_Del: TOnFocusButton;
    DataSource2: TDataSource;
    DataSource1: TDataSource;
    MD_Data1: TOnMemData;
    MD_Data1jobplace: TStringField;
    MD_Data1placename: TStringField;
    MD_Data2: TOnMemData;
    MD_Data2jobplace: TStringField;
    MD_Data2placename: TStringField;
    Ora_Grid: TOraQuery;
    Ora_pkzspmas: TOraQuery;
    DataSource3: TDataSource;
    Ora_pkzspbas: TOraQuery;
    DataSource4: TDataSource;
    SF_Main: TOnSchemeForm;
    GroupBox1: TGroupBox;
    NE_GIVEMAX2: TOnNumberEdit;
    NE_GIVEMAX1: TOnNumberEdit;
    DE_Appto: TOnDateEdit;
    DE_Appfr: TOnDateEdit;
    GroupBox2: TGroupBox;
    NE_GIVEMAX3: TOnNumberEdit;
    PE_appemp: TOnPersonPopupEdit;
    DE_Appto_SP: TOnDateEdit;
    DE_Appfr_SP: TOnDateEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    GroupBox3: TGroupBox;
    DE_Conto: TOnDateEdit;
    DE_Confr: TOnDateEdit;
    NE_GIVEMAX4: TOnNumberEdit;
    Label12: TLabel;
    TabSheet7: TTabSheet;
    Panel8: TPanel;
    Ora_PSCASPEC: TOraQuery;
    DataSource5: TDataSource;
    Grid2: TOnGrDbGrid;
    Panel6: TPanel;
    OP_EmpKor: TOnPersonPopupEdit;
    OnShapeLabel5: TOnShapeLabel;
    OnShapeLabel1: TOnShapeLabel;
    OC_BUNGI: TOnComboEdit;
    OE_GIVEMAX: TOnNumberEdit;
    OE_IntDate: TOnDateEdit;
    procedure BT_ExitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EDS_empnoKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure BT_SaveClick(Sender: TObject);
    procedure BT_FindClick(Sender: TObject);
    procedure BT_Add_PClick(Sender: TObject);
    procedure BT_Del_PClick(Sender: TObject);
    procedure EDS_empnoChange(Sender: TObject);
    procedure Bt_AddClick(Sender: TObject);
    procedure DataSource3DataChange(Sender: TObject; Field: TField);
    procedure Bt_DelClick(Sender: TObject);
    procedure Ed_empnoKeyPress(Sender: TObject; var Key: Char);
    procedure Ed_BempnoKeyPress(Sender: TObject; var Key: Char);
    procedure E_empnoKeyPress(Sender: TObject; var Key: Char);
    procedure E_kornameKeyPress(Sender: TObject; var Key: Char);
    procedure E_empnoEnter(Sender: TObject);
    procedure E_FamirelInitPopup(Sender: TObject);
    procedure E_FamirelCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure DataSource4DataChange(Sender: TObject; Field: TField);
    procedure OC_BUNGIChange(Sender: TObject);
    procedure DataSource5DataChange(Sender: TObject; Field: TField);

  private
    { Private declarations }
    procedure BT_FindSql;
    procedure GridData_Move(FromGrid, ToGrid : TDBGrid; FromDataSet, ToDataSet : TDataSet);
    procedure MD_DataAppend(DataSet : TDataSet);
    
  public
    { Public declarations }

    FG_Appdate : String;
  end;

var
  FM_Mainform: TFM_Mainform;

implementation

uses PSH1010A2;

{$R *.DFM}


procedure TFM_Mainform.FormCreate(Sender: TObject);
begin
  SB_Help.Panels[1].Text := ' 데이타베이스에 접속중입니다...';
  Application.ProcessMessages;

  OraConnect;

  BT_FindSql;            //승인자 사원 리스트 추출.

  PageControl1.ActivePage := TabSheet1;  //기본 페이지 지정.
  BT_FindClick(Sender);  //조회
  SB_Help.Panels[1].Text := ' ';
end;

procedure TFM_Mainform.GridData_Move(FromGrid, ToGrid : TDBGrid; FromDataSet, ToDataSet : TDataSet);
var
  i : Integer;
begin
  if not FromDataSet.Active then System.Exit;

  if FromGrid.SelectedRows.Count < 1 then System.Exit;

  ToGrid.SelectedRows.Clear;

  for i := 0 to FromGrid.SelectedRows.Count -1 do
  begin
      FromDataSet.GotoBookmark(pointer(FromGrid.SelectedRows.Items[i]));
      ToDataSet.Open;
      ToDataSet.Append;
      ToDataSet.FieldByName('JOBPLACE').AsString  := FromDataSet.FieldByName('JOBPLACE').AsString ;
      ToDataSet.FieldByName('PLACENAME').AsString := FromDataSet.FieldByName('PLACENAME').AsString ;
      ToDataSet.Post;
      ToGrid.SelectedRows.CurrentRowSelected := True;
      FromDataSet.Delete;
  end;

  FromDataSet.Open;
  FromGrid.SelectedRows.Clear;
end;

procedure TFM_Mainform.BT_FindSql;
begin
  //Biz HR 그룹인 G042 그룹의 사원만 나타나도록 SQL 대체...
  EDS_empno.Sql := 'SELECT A.empno, A.korname, A.paycl, A.payra, A.orgnum, A.deptcode, A.pstate, '+
                   '       D.codename payraname, C.codename payclname, B.deptname, B.deptna3     '+
                   '  FROM pycdept B, pyccode C, pyccode D, pimpmas A, PYMENUUSER M              '+
                   ' WHERE D.codeid(+) = ''I113''                                                '+
                   '   AND A.payra     = D.codeno(+)                                             '+
                   '   AND C.codeid(+) = ''I112''                                                '+
                   '   AND A.paycl     = C.codeno(+)                                             '+
                   '   AND A.orgnum    = B.orgnum(+)                                             '+
                   '   AND A.deptcode  = B.deptcode(+)                                           '+
                   '   AND A.Empno     = M.Empno                                                 '+
                   '   AND M.GROUPID   = ''G042''                                                '+
                   '   AND M.LOCKYN    = ''N''                                                   '+
                   '   AND (A.empno like ''%s'' OR A.korname like ''%s'')                        '+
                   ' Order by 3,1                                                                ';
end;              

procedure TFM_Mainform.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := CaFree;
end;                            

procedure TFM_Mainform.BT_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TFM_Mainform.EDS_empnoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
      Key := #0;
      BT_FindSql;
  end;
end;

procedure TFM_Mainform.PageControl1Change(Sender: TObject);
begin
  BT_FindClick(Sender);
end;

procedure TFM_Mainform.BT_FindClick(Sender: TObject);
var
  qq : TOraQuery;
  d1, d2, d3, d4  : String;
  s1, s2, s3, s4, s5  : String;
  i  : integer;
begin
  BT_Add.Visible := False;
  BT_Del.Visible := False;
  //기준관리 화면
  if PageControl1.ActivePage.PageIndex = 0 then
  begin
    qq := TOraQuery.Create(nil);
    qq.Session := Ora_Session;
    try
      with qq do
      begin
        Close;
        SQL.Clear;
        Sql.Add('select appfrdate, apptodate, confrdate, contodate, ');
        Sql.Add('       APPFRDTSP, APPTODTSP,                       ');
        Sql.Add('       givemax1,  givemax2,  givemax3,  givemax4, empno ');
        Sql.Add('  from pscapbas                                    ');
        Open;

        d1 := FieldByName('appfrdate').AsString;
        d2 := FieldByName('apptodate').AsString;
        d3 := FieldByName('confrdate').AsString;
        d4 := FieldByName('contodate').AsString;
        DE_Appfr.Text := Copy(d1,1,4)+'-'+Copy(d1,5,2)+'-'+Copy(d1,7,2);
        DE_Appto.Text := Copy(d2,1,4)+'-'+Copy(d2,5,2)+'-'+Copy(d2,7,2);
        DE_Confr.Text := Copy(d3,1,4)+'-'+Copy(d3,5,2)+'-'+Copy(d3,7,2);
        DE_Conto.Text := Copy(d4,1,4)+'-'+Copy(d4,5,2)+'-'+Copy(d4,7,2);

        s1 := FieldByName('APPFRDTSP').AsString;
        s2 := FieldByName('APPTODTSP').AsString;
        DE_Appfr_SP.Text := Copy(s1,1,4)+'-'+Copy(s1,5,2)+'-'+Copy(s1,7,2);
        DE_Appto_SP.Text := Copy(s2,1,4)+'-'+Copy(s2,5,2)+'-'+Copy(s2,7,2);

        NE_GIVEMAX1.Value := FieldByName('givemax1').AsFloat;
        NE_GIVEMAX2.Value := FieldByName('givemax2').AsFloat;
        NE_GIVEMAX3.Value := FieldByName('givemax3').AsFloat;
        NE_GIVEMAX4.Value := FieldByName('givemax4').AsFloat;
        PE_appemp.Text    := FieldByName('empno').AsString;
      end;
    finally
    qq.Free;
  end;
  end
  else
  if PageControl1.ActivePage.PageIndex = 1 then
  begin
    BT_Add.Visible := True;
    BT_Del.Visible := True;
    qq := TOraQuery.Create(nil);
    qq.Session := Ora_Session;
    try
      with qq do
      begin
        Close;
        SQL.Clear;
        Sql.Add('select appfrdate, apptodate, confrdate, contodate, ');
        Sql.Add('       zgivemax1,  zgivemax2,  zgivemax3,empno     ');
        Sql.Add('  from pscapbas                                    ');
        Open;

        d1 := FieldByName('appfrdate').AsString;
        d2 := FieldByName('apptodate').AsString;
        d3 := FieldByName('confrdate').AsString;
        d4 := FieldByName('contodate').AsString;
        NE_ZGIVEMAX1.Value := FieldByName('zgivemax1').AsFloat;
        NE_ZGIVEMAX2.Value := FieldByName('zgivemax2').AsFloat;
        NE_ZGIVEMAX3.Value := FieldByName('zgivemax3').AsFloat;
      end;

      Ora_pkzspbas.Session := Ora_Session;
      with Ora_pkzspbas do
      begin
        close;
        Sql.Clear;
        Sql.Add('SELECT famirel,                               ');
        Sql.Add('       (SELECT CODENAME FROM PKMYSCOD         ');
        Sql.Add('         where CODENO = famirel) famirelname, ');
        Sql.Add('       zminamt, zmaxamt                       ');
        Sql.Add('  FROM pkzspbas                               ');
        Sql.Add(' ORDER BY 1                                   ');
        Open;

        TFloatField(FieldByname('zminamt')).DisplayFormat    := '#,##0';
        TFloatField(FieldByname('zmaxamt')).DisplayFormat    := '#,##0';
        E_famirel.Text     := FieldByName('famirel').AsString;
        P_FamirelN.Caption := FieldByName('famirelname').AsString;
        E_ZMinAmt.value    := FieldByName('zminamt').AsFloat;
        E_ZMaxAmt.value    := FieldByName('zmaxamt').AsFloat;
        E_famirel.Enabled  := False;
      end;
    finally
    qq.Free;
    end;
  end
  else if PageControl1.ActivePage.PageIndex = 2 then
  begin
    BT_Add.Visible := True;
    BT_Del.Visible := True;
    Ora_pkzspmas.Session := Ora_Session;
    with Ora_pkzspmas do
    begin
      close;
      Sql.Clear;
      Sql.Add('SELECT EMPNO, KORNAME, BEMPNO, BKORNAME  ');
      Sql.Add('  FROM pkzspmas                          ');
      Sql.Add(' ORDER BY 1                              ');
      Open;
      Ed_empno.empno    := FieldByName('EMPNO').AsString;
      Ed_empno.korname  := FieldByName('KORNAME').AsString;
      Ed_Bempno.empno   := FieldByName('BEMPNO').AsString;
      Ed_Bempno.korname := FieldByName('BKORNAME').AsString;
      Ed_empno.Enabled  := False;

      FieldByName('empno'   ).DisplayLabel := '임원사번';
      FieldByName('korname' ).DisplayLabel := '임원성명';
      FieldByName('Bempno'  ).DisplayLabel := '비서사번';
      FieldByName('Bkorname').DisplayLabel := '비서성명';

      FieldByName('empno'   ).DisplayWidth := 10;
      FieldByName('korname' ).DisplayWidth := 16;
      FieldByName('Bempno'  ).DisplayWidth := 10;
      FieldByName('Bkorname').DisplayWidth := 16;

      FieldByName('empno'   ).Index := 0;
      FieldByName('korname' ).Index := 1;
      FieldByName('Bempno'  ).Index := 2;
      FieldByName('Bkorname').Index := 3;

      DBG_pkzspmas.Columns.Clear;

      for I := 0 to 3 do
      begin
        DBG_pkzspmas.Columns.Add;
        DBG_pkzspmas.Columns[I].FieldName := Fields[I].FieldName;
        DBG_pkzspmas.Columns[I].Alignment := taCenter
      end;

      if not EOF then
      begin
        L_tcnt.TextCaption := '복리후생 신청 대상 임원 : ' + inttostr(RecordCount) + ' 명';
        Ed_empno.empno    := FieldByName('empno'    ).AsString;
        Ed_empno.korname  := FieldByName('korname'  ).AsString;
        Ed_empno.Text     := FieldByName('empno'    ).AsString+' - '+
                             FieldByName('korname'  ).AsString;
        Ed_Bempno.empno   := FieldByName('Bempno'   ).AsString;
        Ed_Bempno.korname := FieldByName('Bkorname' ).AsString;
        Ed_Bempno.Text    := FieldByName('Bempno'    ).AsString+' - '+
                             FieldByName('Bkorname'  ).AsString;
      end;
    end;
  end
  // 승인자 지정 화면
  else if PageControl1.ActivePage.PageIndex = 3 then
  begin
    Ora_Grid.Session := Ora_Session;
    with Ora_Grid do
    begin
      close;
      Sql.Clear; //미지정 List
      Sql.Add('SELECT CODENO JOBPLACE, CODENAME PLACENAME  ');
      Sql.Add('  FROM PYCCODE           ');
      Sql.Add(' WHERE CODEID = ''I160'' ');
      Sql.Add('   AND USEYN  = ''Y''    ');
      Sql.Add('   AND CODENO NOT IN (SELECT JOBPLACE FROM PSCAPJOB)');
      Sql.Add(' ORDER BY 1              ');
      Open;
      Ora_Grid.First;
      MD_DataAppend(MD_Data1);

      close;
      Sql.Clear; //개인별 지정 List
      Sql.Add('SELECT JOBPLACE, PLACENAME ');
      Sql.Add('  FROM PSCAPJOB            ');
      Sql.Add(' WHERE Empno = :iEmpno     ');
      Sql.Add(' ORDER BY 1                ');
      ParamByName('iEmpno').AsString  := EDS_empno.Empno;
      Open;

      Ora_Grid.First;
      MD_DataAppend(MD_Data2);
    end;
  end
  // 체육활동비 특이자
  else if PageControl1.ActivePage.PageIndex = 4 then
  begin
    BT_Add.Visible := True;
    BT_Del.Visible := True;

    OE_IntDate.Text := Copy(Fn_GetDate,1,4)+'-'+Copy(Fn_GetDate,5,2)+'-'+Copy(Fn_GetDate,7,2);
    OC_BUNGI.Items.Clear;
    OC_BUNGI.Items.Add('1분기 입사자');
    OC_BUNGI.Items.Add('2분기 입사자');
    OC_BUNGI.Items.Add('3분기 입사자');
    OC_BUNGI.Items.Add('4분기 입사자');
    OC_BUNGI.Items.Add('미지원자');
//  OC_BUNGI.ItemIndex := 1

    s5 := Copy(Fn_GetDate,1,4);
    //  s5 := '201801';
    Ora_Grid.Session := Ora_Session;
    with Ora_PSCASPEC do
    begin
      close;
      Sql.Clear;
      Sql.Add(' SELECT A.EMPNO, A.KORNAME, B.DEPTCODE, A.GIVEMAX, A.APPDATE, NVL(A.BUNGI, 0) BUNGI, ');
      Sql.Add('       (SELECT DEPTNAME FROM PYCDEPT WHERE ORGNUM = B.ORGNUM AND DEPTCODE = B.DEPTCODE) DEPTNAME ');
      Sql.Add(' FROM PSCASPEC A, PIMPMAS B ');
      Sql.Add(' WHERE A.EMPNO = B.EMPNO    ');
      Sql.Add('   AND SUBSTR(A.APPDATE,1,6) = ''' + s5 + ''' ');
      Sql.Add(' ORDER BY APPDATE DESC      ');

      Open;

      FieldByName('APPDATE').EditMask := '!9999-99-99;0;_';
      TFloatField(FieldByname('GIVEMAX')).DisplayFormat := '#,##0';
    end;
  end;

  if PE_appemp.Text <> '' then
  begin
    PE_appemp.PL_get_singledata;
  end;
end;

procedure TFM_Mainform.MD_DataAppend(DataSet : TDataSet);
begin
  DataSet.Close;
  DataSet.Open;
  while not Ora_Grid.Eof do
  begin
    DataSet.Append;
    DataSet.FieldByName('JOBPLACE').AsString  := Ora_Grid.FieldByName('JOBPLACE').AsString ;
    DataSet.FieldByName('PLACENAME').AsString := Ora_Grid.FieldByName('PLACENAME').AsString ;
    DataSet.Post;
    Ora_Grid.Next;
  end;
  DataSet.First;
end;

procedure TFM_Mainform.BT_SaveClick(Sender: TObject);
var
     FG_Sql : String;
     qq : TOraQuery;
begin
  {  1) 신청기간 from : 승인기간 from 보다는 같거나 작고 승인기간 to보다는 작음
     2) 신청기간 to     : 승인기간 to보다는 작음
     3) 승인기간 from : 신청기간 from 보다는 같거나 크고 승인기간 to보다는 작음
     4) 승인기간 to     : 1),2),3) 기간보다는 큼 }
  if PageControl1.ActivePage.PageIndex = 0 then
  begin
    if (Length(Trim(DE_Appfr.Text)) <> 10) or
    (Length(Trim(DE_Appto.Text)) <> 10) or
    (Length(Trim(DE_Appfr_SP.Text)) <> 10) or
    (Length(Trim(DE_Appto_SP.Text)) <> 10) or
    (Length(Trim(DE_Confr.Text)) <> 10) or
    (Length(Trim(DE_Conto.Text)) <> 10) then
    begin
      ShowMessage('일정관리의 신청/승인 기간 입력이 잘못 되었습니다.');
      System.Exit;
    end;
(*
       if (Trim(DE_Appfr.Text) > Trim(DE_Confr.Text)) or (Trim(DE_Appfr.Text) > Trim(DE_Conto.Text)) then
       begin
            ShowMessage('의료비 신청기간From은 승인기간From 보다는 같거나 작고 승인기간To 보다는 작아야 합니다.');
            System.Exit;
       end;
       if (Trim(DE_Appfr_SP.Text) > Trim(DE_Confr.Text)) or (Trim(DE_Appfr_SP.Text) > Trim(DE_Conto.Text)) then
       begin
            ShowMessage('체육활동비 신청기간From은 승인기간From 보다는 같거나 작고 승인기간To 보다는 작아야 합니다.');
            System.Exit;
       end;
       if Trim(DE_Appto.Text) > Trim(DE_Conto.Text) then
       begin
            ShowMessage('의료비 신청기간To 일자는 승인기간To 보다 작아야 합니다.');
            System.Exit;
       end;
       if Trim(DE_Appto_SP.Text) > Trim(DE_Conto.Text) then
       begin
            ShowMessage('체육활동비 신청기간To 일자는 승인기간To 보다 작아야 합니다.');
            System.Exit;
       end;
       if (Trim(DE_Confr.Text) < Trim(DE_Appfr.Text)) or (Trim(DE_Confr.Text) > Trim(DE_Conto.Text)) then
       begin
            ShowMessage('승인기간From은 의료비 신청기간From 보다는 같거나 크고 승인기간To 보다는 작아야 합니다.');
            System.Exit;
       end;
       if (Trim(DE_Appfr_SP.Text) < Trim(DE_Appfr.Text)) or (Trim(DE_Appfr_SP.Text) > Trim(DE_Conto.Text)) then
       begin
            ShowMessage('승인기간From은 체육활동비 신청기간From 보다는 같거나 크고 승인기간To 보다는 작아야 합니다.');
            System.Exit;
       end;
*)
  end;
  //////////////////////////////////////////////////////////////////////////////

  qq := TOraQuery.Create(nil);
  qq.Session := Ora_Session;
  if PageControl1.ActivePage.PageIndex = 0 then
  begin
    try
      with qq do
      begin
        close;
        Sql.Clear;
        Sql.Add('update pscapbas                        ');
        Sql.Add('   set appfrdate =:d1, apptodate =:d2, ');
        Sql.Add('       confrdate =:d3, contodate =:d4, ');
        Sql.Add('       givemax1  =:d5, givemax2  =:d6, ');
        Sql.Add('       givemax3  =:d7, givemax4  =:d8, ');
        Sql.Add('       writetime =:d9, writeman  =:d10,');
        Sql.Add('       empno     =:d11,                ');
        Sql.Add('       APPFRDTSP =:s1, APPTODTSP =:s2  ');
        ParamByName('d1').AsString := Copy(DE_Appfr.Text,1,4)+Copy(DE_Appfr.Text,6,2)+Copy(DE_Appfr.Text,9,2);
        ParamByName('d2').AsString := Copy(DE_Appto.Text,1,4)+Copy(DE_Appto.Text,6,2)+Copy(DE_Appto.Text,9,2);
        ParamByName('d3').AsString := Copy(DE_Confr.Text,1,4)+Copy(DE_Confr.Text,6,2)+Copy(DE_Confr.Text,9,2);
        ParamByName('d4').AsString := Copy(DE_Conto.Text,1,4)+Copy(DE_Conto.Text,6,2)+Copy(DE_Conto.Text,9,2);
        ParamByName('d5').AsFloat  := NE_GIVEMAX1.Value;
        ParamByName('d6').AsFloat  := NE_GIVEMAX2.Value;
        ParamByName('d7').AsFloat  := NE_GIVEMAX3.Value;
        ParamByName('d8').AsFloat  := NE_GIVEMAX4.Value;
        ParamByName('d9').AsString := Fn_GetDateTimeStr;
        ParamByName('d10').AsString:= Pempno;
        ParamByName('d11').AsString:= PE_appemp.empno;
        ParamByName('s1').AsString := Copy(DE_Appfr_SP.Text,1,4)+Copy(DE_Appfr_SP.Text,6,2)+Copy(DE_Appfr_SP.Text,9,2);
        ParamByName('s2').AsString := Copy(DE_Appto_SP.Text,1,4)+Copy(DE_Appto_SP.Text,6,2)+Copy(DE_Appto_SP.Text,9,2);
        ExecSql;
      end;
    finally
      qq.Free;
    end;
  end
  else
  if PageControl1.ActivePage.PageIndex = 1 then
  begin
    try
      with qq do
      begin
        close;
        Sql.Clear;
        Sql.Add('select * from pkzspbas where famirel = :famirel ');
        ParamByName('famirel').AsString := E_famirel.Text;
        Open;

        if RecordCount > 0 then
        begin
          if MessageBox(handle,PChar('기존의 등록된 내역이 있습니다.'+#13+#13+
                                     '변경 저장하시겠습니까?.'), '확 인',  MB_YESNO or MB_DEFBUTTON2) <> IDYES then
          begin
            BT_FindClick(Sender);
            system.Exit;
          end;
          close;
          Sql.Clear;
          Sql.Add('update pkzspbas                           ');
          Sql.Add('   set ZMinAmt    =:d1,                   ');
          Sql.Add('       ZMaxAmt    =:d2,                   ');
          Sql.Add('       writetime  =:d3, writeemp  =:d4    ');
          Sql.Add(' where famirel    =:famirel               ');
          ParamByName('d1').AsFloat       := E_ZMinAmt.value;
          ParamByName('d2').AsFloat       := E_ZmaxAmt.value;
          ParamByName('d3').AsString      := Fn_GetDateTimeStr;
          ParamByName('d4').AsString      := Pempno;
          ParamByName('famirel').AsString := E_famirel.Text;
          ExecSql;
        end
        else
        begin
          close;
          Sql.Clear;
          Sql.Add('insert into  pkzspbas                           ');
          Sql.Add('      (famirel, zminamt, zmaxamt,               ');
          Sql.Add('       writetime, writeemp)                     ');
          Sql.Add(' values                                         ');
          Sql.Add('       (:d1, :d2, :d3,                          ');
          Sql.Add('        TO_CHAR(SYSDATE, ''YYYYMMDDHH24MISS''), ');
          Sql.Add('        :d4 )                                   ');
          ParamByName('d1').AsString     := E_famirel.Text;
          ParamByName('d2').AsFloat      := E_ZMinAmt.value;
          ParamByName('d3').AsFloat      := E_ZMaxAmt.value;
          ParamByName('d4').AsString     := Pempno;
          ExecSql;
        end;

        close;
        Sql.Clear;
        Sql.Add('update pscapbas                          ');
        Sql.Add('   set zgivemax1  =:d5, zgivemax2  =:d6, ');
        Sql.Add('       zgivemax3  =:d7,                  ');
        Sql.Add('       writetime  =:d8, writeman  =:d9    ');
        ParamByName('d5').AsFloat  := NE_ZGIVEMAX1.Value;
        ParamByName('d6').AsFloat  := NE_ZGIVEMAX2.Value;
        ParamByName('d7').AsFloat  := NE_ZGIVEMAX3.Value;
        ParamByName('d8').AsString := Fn_GetDateTimeStr;
        ParamByName('d9').AsString := Pempno;
        ExecSql;
        end;
      finally
      qq.Free;
    end;
  end
  else
  if PageControl1.ActivePage.PageIndex = 2 then
  begin
    try
      with qq do
      begin
        close;
        Sql.Clear;
        Sql.Add('select * from pkzspmas where empno = :empno ');
        ParamByName('empno').AsString := ED_empno.Empno;
        Open;

        if RecordCount > 0 then
        begin
          if MessageBox(handle,PChar('기존의 등록된 임원이 있습니다.'+#13+#13+
                                     '변경 저장하시겠습니까?.'), '확 인',  MB_YESNO or MB_DEFBUTTON2) <> IDYES then
          begin
               BT_FindClick(Sender);
               system.Exit;
          end;
          close;
          Sql.Clear;
          Sql.Add('update pkzspmas                           ');
          Sql.Add('   set Bempno     =:d1, Bkorname  =:d2,   ');
          Sql.Add('       writetime  =:d3, writeemp  =:d4    ');
          Sql.Add(' where empno = :empno                     ');
          ParamByName('d1').AsString    := ED_Bempno.empno;
          ParamByName('d2').AsString    := ED_Bempno.korname;
          ParamByName('d3').AsString    := Fn_GetDateTimeStr;
          ParamByName('d4').AsString    := Pempno;
          ParamByName('empno').AsString := ED_empno.Empno;
          ExecSql;
        end
        else
        begin
          close;
          Sql.Clear;
          Sql.Add('insert into  pkzspmas                           ');
          Sql.Add('      (empno, korname, Bempno, Bkorname,        ');
          Sql.Add('       writetime, writeemp)                     ');
          Sql.Add(' values                                         ');
          Sql.Add('       (:d1, :d2, :d3, :d4,                     ');
          Sql.Add('        TO_CHAR(SYSDATE, ''YYYYMMDDHH24MISS''), ');
          Sql.Add('        :d5 )                                   ');
          ParamByName('d1').AsString     := ED_empno.empno;
          ParamByName('d2').AsString     := ED_empno.korname;
          ParamByName('d3').AsString     := ED_Bempno.empno;
          ParamByName('d4').AsString     := ED_Bempno.korname;
          ParamByName('d5').AsString     := Pempno;
          ExecSql;
        end;
      end;
    finally
    qq.Free;
    end;
  end
  //////////////////////////////////////////////////////////////////////////////
  else if PageControl1.ActivePage.PageIndex = 3 then
  begin
    if EDS_empno.Empno = '' then
    begin
      MessageDlg('Biz-HR 담당자 지정후 작업하세요',mtInformation , [mbOK], 0);
      exit;
    end;

    try
      with qq do
      begin
        close;
        Sql.Clear;
        Sql.Add('delete pscapjob where empno = :empno ');
        ParamByName('empno').AsString := EDS_empno.Empno;
        ExecSql;

        ////////////////////////////////////////////////////////////////////
        MD_Data2.First;
        while not MD_Data2.Eof do
        begin
        Close;
        Sql.Clear;
        FG_Sql := Format('insert into pscapjob                            '+
                        '       (jobplace, placename, empno, korname,    '+
                        '        paycl, writetime, writeman)             '+
                        ' values                                         '+
                        '       (''%s'', ''%s'', ''%s'', ''%s'', ''%s'', '+
                        '        TO_CHAR(SYSDATE, ''YYYYMMDDHH24MISS''), '+
                        '        ''%s'' )                                ',
                       [MD_Data2.FieldByName('JOBPLACE').AsString,
                        MD_Data2.FieldByName('PLACENAME').AsString,
                        EDS_empno.Empno,
                        EDS_empno.Korname,
                        EDS_empno.PAYCL,
                        Pempno ]);
        Sql.Text := FG_Sql;
        ExecSql;
        MD_Data2.Next;
      end;
    end;
    finally
    qq.Free;
    end;
  end;
  if PageControl1.ActivePage.PageIndex = 4 then
  begin
    if OP_EmpKor.Text = '' then
    begin
      MessageDlg('사원을 등록하세요.', mtInformation, [mbOK], 0);
      Exit;
    end;

    if OE_IntDate.Text = '' then
    begin
      MessageDlg('등록일자를 입력하세요.', mtInformation, [mbOK], 0);
      Exit;
    end;
(* 지원금액 0원 등록 시 지원불가 : 2017.6.8 HeeYong
    if OE_GIVEMAX.Value = 0 then
    begin
      MessageDlg('지원금액을 입력하세요.', mtInformation, [mbOK], 0);
      Exit;
    end;
*)
    try
      with qq do
      begin
        close;
        Sql.Clear;
        Sql.Add(' select * from PSCASPEC ');
        Sql.Add(' where empno   = :empno ');
        ParamByName('empno').AsString   := Copy(OP_EmpKor.Text, 1,4);
        Open;

        if RecordCount > 0 then
        begin
          if MessageDlg('변경  하시겠습니까?',mtConfirmation,[mbYes,mbNo],0) <> IDYES then System.Exit;

          close;
          Sql.Clear;
          Sql.Add('update PSCASPEC                           ');
          Sql.Add('   set GIVEMAX   =:d1, BUNGI     =:d2,    ');
          Sql.Add('       WRITETIME = TO_CHAR(SYSDATE, ''YYYYMMDDHH24MISS''), ');
          Sql.Add('       WRITEMAN  =:d3                     ');
          Sql.Add(' where empno = :empno                     ');

          ParamByName('d1').AsFloat     := OE_GIVEMAX.Value;
          if   OC_BUNGI.itemindex = 4 Then  ParamByName('d2').AsFloat := 0
          Else ParamByName('d2').AsFloat:= OC_BUNGI.itemindex +1;
          ParamByName('d3').AsString    := Pempno;
          ParamByName('empno').AsString := Copy(OP_EmpKor.Text, 1,4);
          ExecSql;
        end
        else
        begin
          if MessageDlg('신규등록  하시겠습니까?',mtConfirmation,[mbYes,mbNo],0) <> IDYES then System.Exit;

          close;
          Sql.Clear;
          Sql.Add('insert into  PSCASPEC                           ');
          Sql.Add('      (APPDATE, empno, korname, GIVEMAX, BUNGI, ');
          Sql.Add('       WRITETIME, WRITEMAN)                     ');
          Sql.Add(' values                                         ');
          Sql.Add('       (:d1, :d2, :d3, :d4, :d5,                ');
          Sql.Add('        TO_CHAR(SYSDATE, ''YYYYMMDDHH24MISS''), ');
          Sql.Add('        :d6 )                                   ');
          ParamByName('d1').AsString := RemoveChar(OE_IntDate.Text, '-');
          ParamByName('d2').AsString := OP_EmpKor.empno;
          ParamByName('d3').AsString := OP_EmpKor.korname;
          ParamByName('d4').AsFloat  := OE_GIVEMAX.Value;
          if   OC_BUNGI.itemindex = 4 Then  ParamByName('d5').AsFloat := 0
          Else ParamByName('d5').AsFloat:= OC_BUNGI.itemindex +1;
          ParamByName('d6').AsString := Pempno;

          ExecSql;
        end;
      end;
    finally
    qq.Free;
    end;
  end;

  SB_Help.Panels[1].Text := '저장 완료!';

  BT_FindClick(Sender);
end;

procedure TFM_Mainform.BT_Add_PClick(Sender: TObject);
begin
  GridData_Move(GGrid1, GGrid2 , MD_Data1, MD_Data2);
end;

procedure TFM_Mainform.BT_Del_PClick(Sender: TObject);
begin
  GridData_Move(GGrid2, GGrid1 , MD_Data2, MD_Data1);
end;

procedure TFM_Mainform.EDS_empnoChange(Sender: TObject);
begin
  BT_FindClick(Sender);
end;

procedure TFM_Mainform.Bt_AddClick(Sender: TObject);
begin
  if PageControl1.ActivePage.PageIndex = 1 then
  begin
       E_Famirel.Enabled  := True;
       E_Famirel.Text     := '';
       P_FamirelN.Caption := '';
       E_ZMinAmt.Value    := 0;
       E_ZMaxAmt.Value    := 0;
  end
  else
  if PageControl1.ActivePage.PageIndex = 2 then
  begin
       Ed_empno.Enabled   := True;
       Ed_empno.empno     := '';
       Ed_empno.korname   := '';
       Ed_Bempno.empno    := '';
       Ed_Bempno.korname  := '';
       Ed_empno.Text      := '';
       Ed_Bempno.Text     := '';
  end
  else
  if PageControl1.ActivePage.PageIndex = 4 then
  begin
       OP_EmpKor.Enabled  := True;
       OE_IntDate.Enabled := True;
       OP_EmpKor.empno    := '';
       OP_EmpKor.Text     := '';
       OC_BUNGI.ItemIndex := 0;
  end;
end;

procedure TFM_Mainform.DataSource3DataChange(Sender: TObject;
  Field: TField);
begin
  Ed_empno.empno    := Ora_pkzspmas.FieldByName('empno'    ).AsString;
  Ed_empno.korname  := Ora_pkzspmas.FieldByName('korname'  ).AsString;
  Ed_empno.Text     := Ora_pkzspmas.FieldByName('empno'    ).AsString+' - '+
                       Ora_pkzspmas.FieldByName('korname'  ).AsString;
  Ed_Bempno.empno   := Ora_pkzspmas.FieldByName('Bempno'   ).AsString;
  Ed_Bempno.korname := Ora_pkzspmas.FieldByName('Bkorname' ).AsString;
  Ed_Bempno.Text    := Ora_pkzspmas.FieldByName('Bempno'    ).AsString+' - '+
                       Ora_pkzspmas.FieldByName('Bkorname'  ).AsString;
end;

procedure TFM_Mainform.Bt_DelClick(Sender: TObject);
var
     qq : TOraQuery;
begin
  if PageControl1.ActivePage.PageIndex = 1 then
  begin
    if MessageBox(handle,PChar('임원 가족코드별 지원기준에서 제외하시겠습니까?.'), '확 인',  MB_YESNO or MB_DEFBUTTON2) <> IDYES then
    begin
      BT_FindClick(Sender);
      system.Exit;
    end;

    qq := TOraQuery.Create(nil);
    qq.Session := Ora_Session;
    try
      with qq do
      begin
        close;
        Sql.Clear;
        Sql.Add('delete pkzspbas where Famirel = :Famirel ');
        ParamByName('Famirel').AsString := E_Famirel.Text;
        ExecSql;
      end;
    finally
      qq.Free;
    end;
  end
  else
  if PageControl1.ActivePage.PageIndex = 2 then
  begin
    if MessageBox(handle,PChar('복리후생 신청 대상 임원 목록에서 제외하시겠습니까?.'), '확 인',  MB_YESNO or MB_DEFBUTTON2) <> IDYES then
    begin
      BT_FindClick(Sender);
      system.Exit;
    end;

    qq := TOraQuery.Create(nil);
    qq.Session := Ora_Session;
    try
      with qq do
      begin
        close;
        Sql.Clear;
        Sql.Add('delete pkzspmas where empno = :empno ');
        ParamByName('empno').AsString := ED_empno.Empno;
        ExecSql;
      end;
    finally
      qq.Free;
    end;
  end
  else
  if PageControl1.ActivePage.PageIndex = 4 then
  begin
    if MessageDlg('삭제 하시겠습니까?',mtConfirmation,[mbYes,mbNo],0) <> IDYES then System.Exit;

    qq := TOraQuery.Create(nil);
    qq.Session := Ora_Session;
    try
      with qq do
      begin
        close;
        Sql.Clear;
        Sql.Add('delete from PSCASPEC      ');
        Sql.Add(' where empno   = :empno   ');
        Sql.Add('   and appdate = :appdate ');
        ParamByName('empno').AsString   := Copy(OP_EmpKor.Text, 1,4);
        ParamByName('appdate').AsString := RemoveChar(OE_IntDate.Text, '-');
        ExecSql;
      end;
    finally
      qq.Free;
    end;
  end;

  SB_Help.Panels[1].Text := '삭제 완료!';

  BT_FindClick(Sender);
end;

procedure TFM_Mainform.Ed_empnoKeyPress(Sender: TObject; var Key: Char);
var
     qq : TOraQuery;
begin
  if (Key = Chr(13) ) then
  begin
       Ed_empno.Sql := 'Select M.*,                                        '+
                       '       (select deptname from pycdept               '+
                       '         Where orgnum  = M.orgnum                  '+
                       '           and deptcode= M.deptcode) deptname      '+
                       '  From Pkzmpmas M                                  '+
                       ' Where payyn =''Y''                                '+
                       '   And (empno   = '''+ Copy(Ed_Empno.Text,1,4) +''''+
                       '    Or  Korname = '''+ Ed_Empno.Text +''')         ';
       Ed_empno.PL_get_singledata;
       Key := #0;
       Ed_Bempno.Setfocus;
  end;
end;

procedure TFM_Mainform.Ed_BempnoKeyPress(Sender: TObject; var Key: Char);
var
     qq : TOraQuery;
begin
  if (Key = Chr(13) ) then
  begin
       Ed_Bempno.Sql := 'Select M.*,                                        '+
                        '       (select deptname from pycdept               '+
                        '         Where orgnum  = M.orgnum                  '+
                        '           and deptcode= M.deptcode) deptname      '+
                        '  From Pimpmas M                                   '+
                        ' Where pstate   < ''80''                           '+
                        '   And (empno   = '''+ Copy(Ed_BEmpno.Text,1,4) +''''+
                        '    Or  Korname = '''+ Ed_BEmpno.Text +''')         ';
       Ed_Bempno.PL_get_singledata;
       Key := #0;
       Bt_Save.Setfocus;
  end;
end;

procedure TFM_Mainform.E_empnoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    if Ora_pkzspmas.Locate('empno', E_empno.Text, [loPartialKey]) then
      DBG_pkzspmas.SetFocus
    else
      Showmessage('복리후생 신청대상 목록에 사번(' + E_empno.Text + ') 임원이 없습니다. 추가하시기 바랍니다.');
end;

procedure TFM_Mainform.E_kornameKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    if Ora_pkzspmas.Locate('korname', E_korname.Text, [loPartialKey]) then
      DBG_pkzspmas.SetFocus
    else
      Showmessage('복리후생 신청대상 목록에 ' + E_korname.Text + ' 임원이 없습니다. 추가하시기 바랍니다.');
end;

procedure TFM_Mainform.E_empnoEnter(Sender: TObject);
begin
  E_empno.Text   := '';
  E_korname.Text := '';
end;

procedure TFM_Mainform.E_FamirelInitPopup(Sender: TObject);
begin
  CodeForm := TCodeForm.Create(Self);
  CodeForm.Edit         := TOnWinPopupEdit(Sender);
  TOnWinPopupEdit(Sender).PopupControl := CodeForm ;
end;

procedure TFM_Mainform.E_FamirelCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
  if CodeForm.FamCode <> '' then
  begin
       E_FamiRel.Text      := CodeForm.FamCode;
       P_FamirelN.Caption  := CodeForm.FamCodeN;
  end;
end;

procedure TFM_Mainform.DataSource4DataChange(Sender: TObject;
  Field: TField);
begin
  with Ora_pkzspbas do
  begin
    E_famirel.Text     := FieldByName('famirel').AsString;
    P_FamirelN.Caption := FieldByName('famirelname').AsString;
    E_ZMinAmt.value    := FieldByName('zminamt').AsFloat;
    E_ZMaxAmt.value    := FieldByName('zmaxamt').AsFloat;
    E_famirel.Enabled  := False;
  end;
end;

procedure TFM_Mainform.OC_BUNGIChange(Sender: TObject);
begin
  If      OC_BUNGI.ItemIndex = 0 Then OE_GIVEMAX.Text := '1000000'
  Else If OC_BUNGI.ItemIndex = 1 Then OE_GIVEMAX.Text := '750000'
  Else If OC_BUNGI.ItemIndex = 2 Then OE_GIVEMAX.Text := '500000'
  Else If OC_BUNGI.ItemIndex = 3 Then OE_GIVEMAX.Text := '250000'
  Else If OC_BUNGI.ItemIndex = 4 Then OE_GIVEMAX.Text := '0';
end;

procedure TFM_Mainform.DataSource5DataChange(Sender: TObject;  Field: TField);
var pDATE : String;
begin
  OP_EmpKor.Enabled  := False;
  OE_IntDate.Enabled := False;
  OE_GIVEMAX.Value  := 0;
  with Ora_PSCASPEC do
  begin
    If Ora_PSCASPEC.RecordCount > 0 Then
    Begin
      pDATE := FieldByName('APPDATE').AsString;
      OP_EmpKor.Text     := FieldByName('EMPNO').AsString +'  '+FieldByName('KORNAME').AsString;
      OE_IntDate.Text    := Copy(pDATE,1,4)+'-'+Copy(pDATE,5,2)+'-'+Copy(pDATE,7,2);
      OE_GIVEMAX.Text    := FieldByName('GIVEMAX').AsString;

      If   StrToInt(FieldByName('BUNGI').AsString) = 0 Then OC_BUNGI.ItemIndex := 4
      Else OC_BUNGI.ItemIndex := StrToInt(FieldByName('BUNGI').AsString) - 1;
    End;
  end;
end;

end.

