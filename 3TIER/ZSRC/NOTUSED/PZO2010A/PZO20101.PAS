{-------------------------------------------------------------------------------
 PROGRAM-NAME   : 외주인력관리(PZO2010A.exe)
 SYSTEM-NAME    : 기타 - 외주인력관리
 SUBSYSTEM-NAME : 외주인력관리
 Programmer     : hjku
 Version        : 1.00
 Date           : 2015.06.30

Update Contents
  버전    수정일       수정자   수정내용                             관련근거
1.0    2015.06.30    hjku   최초개발본
--------------------------------------------------------------------------------}

unit PZO20101;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, OnScheme, ComCtrls, OnEditBaseCtrl, OnEditStdCtrl,
  OnEditBtnCtrl, OnEditMdate, OnShapeLabel, OnPopupEdit, StdCtrls,
  OnFocusButton, Grids, DBGrids, OnGrDBGrid, OnInsaCommon, Db, OnTmaxPersonEdit,
  Tmax_DataSetText, OnDBGrid, Tmax_session, Mask, OnRegistry,Masks,
  TmaxFunc, OnStringUtils, OnEditCombo, comobj, OnEditNumCtl,func;

type
  TFM_Main = class(TForm)
    SF_Main: TOnSchemeForm;
    Panel1: TPanel;
    SB_Help: TStatusBar;
    PA_Buttons: TPanel;
    DataSource1: TDataSource;
    TDS1: TTMaxDataSet;
    Panel4: TPanel;
    BT_exit: TOnFocusButton;
    BT_cancel: TOnFocusButton;
    BT_save: TOnFocusButton;
    BT_delete: TOnFocusButton;
    BT_input: TOnFocusButton;
    BT_batch: TOnFocusButton;
    BB_Excel: TOnFocusButton;
    bt_search: TOnFocusButton;
    Panel5: TPanel;
    s_korname: TOnEdit;
    Rbtn_Y: TRadioButton;
    s_empno: TOnEdit;
    OnShapeLabel6: TOnShapeLabel;
    e_korname: TOnEdit;
    e_empno: TOnEdit;
    Panel6: TPanel;
    RB_Y: TRadioButton;
    RB_N: TRadioButton;
    e_startdate: TOnDateEdit;
    e_enddate: TOnDateEdit;
    s_deptname: TOnWinPopupEdit;
    OnShapeLabel7: TOnShapeLabel;
    OnShapeLabel2: TOnShapeLabel;
    OnEdit3: TOnEdit;
    e_comname: TOnEdit;
    e_deptcode: TOnWinPopupEdit;
    e_deptname: TOnEdit;
    e_regdate: TOnDateEdit;
    e_writeman: TOnEdit;
    e_writetime: TOnEdit;
    TDS_Grid: TTMaxDataSet;
    TMaxSession: TTMaxSession;
    e_telno: TOnMaskEdit;
    e_cellno: TOnMaskEdit;
    e_jobplacenm: TOnEdit;
    e_birthdate: TOnMaskEdit;
    e_comcode: TOnWinPopupEdit;
    e_email: TOnMaskEdit;
    e_regman: TOnEdit;
    e_fieldrepyn: TOnComboEdit;
    DBG_grid: TOnDBGrid;
    e_sex: TOnComboEdit;
    s_comname: TOnWinPopupEdit;
    OnFocusButton1: TOnFocusButton;
    e_orgnum: TOnEdit;
    s_managerid: TOnWinPopupEdit;
    e_managerid: TOnWinPopupEdit;
    Rbtn_N: TRadioButton;
    Rbtn_A: TRadioButton;
    procedure s_deptnameInitPopup(Sender: TObject);
    procedure s_deptnameCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure BT_exitClick(Sender: TObject);
    procedure BT_inputClick(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure bt_searchClick(Sender: TObject);
    procedure s_empnoKeyPress(Sender: TObject; var Key: Char);
    procedure e_comcodeCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure e_comcodeInitPopup(Sender: TObject);
    procedure BT_cancelClick(Sender: TObject);
    procedure BT_deleteClick(Sender: TObject);
    procedure BT_saveClick(Sender: TObject);
    procedure Rbtn_YClick(Sender: TObject);
    procedure Rbtn_NClick(Sender: TObject);
    procedure Rbtn_AClick(Sender: TObject);
    procedure e_deptcodeInitPopup(Sender: TObject);
    procedure e_deptcodeCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure OnFocusButton1Click(Sender: TObject);
    procedure s_comnameCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure s_comnameInitPopup(Sender: TObject);
    procedure DBG_gridCellClick(Sender: TObject; const ACell: TOnJCell);
    procedure BB_ExcelClick(Sender: TObject);
    procedure BT_batchClick(Sender: TObject);
    procedure s_manageridCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure s_manageridInitPopup(Sender: TObject);
    procedure s_manageridKeyPress(Sender: TObject; var Key: Char);
    procedure e_manageridCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure e_manageridInitPopup(Sender: TObject);
    procedure s_comnameKeyPress(Sender: TObject; var Key: Char);
    procedure s_deptnameKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
      TempRow      : Integer;

      procedure PL_InitJob;      
  public
    { Public declarations }
    FL_OPstate   : Integer; {0:비어있는상태, 1:입력상태, 2:열람상태}

    FG_Date   : String[8];     //Host Date
    GSempno   : String[4];     //Login사번
    GSkorname : String[12];    //Login성명
    GSpass    : String;        //비밀번호
    GSgrade   : String;        //등급

    GSorgnum   : String;        // Login조직차수
    GSdeptcode : String;       // Login부서코드
    GSDeptname : String;       // Login부서코드

    //저장변수
    p_empno       : String;
    p_korname     : String;
    p_comcode     : String;
    p_birthdate   : String;
    p_sex         : String;
    p_orgnum      : String;
    p_deptcode    : String;
    p_managerid   : String;
    p_telno       : String;
    p_cellno      : String;
    p_email       : String;
    p_jobplacenm  : String;
    p_regman      : String;
    p_regdate     : String;
    p_startdate   : String;
    p_enddate     : String;
    p_old_startdate   : String;
    p_old_enddate     : String;
    p_fieldrepyn  : String;
    p_stateyn     : String;
    p_writeman    : String;

    procedure Retrieve;
    function StringOfDept(StringOfdeptcode : string): String;
    Function DisplayDate(InputDate : String) : String ;
    procedure initialize_InputFields;  //화면상 입력항목 초기화
    procedure initialize_variables;    //DB저장 변수 초기화
    function UpdatePzmoutmas : Boolean;
    function InsertPzmoutmas : Boolean;
    function IsValidInputValue : Boolean;
    Function IsValidComCode(const ComCd   : String): Boolean;
    Function IsValidDeptCode(const deptcode : String):Boolean;
    Function IsValidEmpno(const empno : String):Boolean;
    Function IsValidSex(const Sex : String):Boolean;
    Function IsValidJobplace(const jobplacenm : String):Boolean;
    Function IsValidPhoneNo(const PhoneNo : String): Boolean;
    function IsValidEmail  (const Value   : string): Boolean;
    Function IsValidStartDate(const startdate : String):Boolean;
    Function IsValidEndDate(const startdate, enddate : String):Boolean;
    Function CheckEmpnoDup(const korname, birthdate, sex : String):Boolean;
    Function AutoEmpno:String;
    function RemoveSpecialChar(sSrc: string): string;

  end;

var
  FM_Main: TFM_Main;

implementation

uses   PZO20102, PZO20103, PZO20104, PZO20105, PZO20106;

{$R *.DFM}

Function TFM_Main.DisplayDate(InputDate : String) : String ;
begin
     if(length(InputDate)<>8) then result := ''
     else                         result := copy(InputDate,1,4) + '-' + copy(InputDate,5,2) + '-' + copy(InputDate,7,2);
end;

Function TFM_Main.IsValidComCode(const ComCd : String):Boolean;
Begin
  Result:= False;

  with TDS1 do
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
      SQL.Add('   and CODENO = '''+trim(ComCd)+'''    ');

      ClearFieldInfo;
      AddField('field1' ,  ftString, 100);
      AddField('field2' ,  ftString, 100);
      AddField('field3' ,  ftString, 100);
      AddField('field4' ,  ftString, 100);
      AddField('field5' ,  ftString, 100);

      Open;

      if FieldByName('field1').AsInteger > 0 then Result:= True;
  end;

End;

Function TFM_Main.IsValidDeptCode(const deptcode : String):Boolean;
Begin
  Result:= False;

  with TDS1 do
  begin
      ServiceName := 'HINSA_select';
      Close;
      Sql.Clear;
      SQL.Add('SELECT count(deptcode),                      ');
      SQL.ADD('        ''field2'',                          ');
      SQL.ADD('        ''field3'',                          ');
      SQL.ADD('        ''field4'',                          ');
      SQL.ADD('        ''field5''                           ');
      SQL.Add('  FROM pycdept                               ');
      SQL.Add(' WHERE ORGNUM   = ''' + GSorgnum       + ''' ');
      SQL.Add('   and DEPTCODE = ''' + trim(deptcode) + ''' ');

      ClearFieldInfo;
      AddField('field1' ,  ftString, 100);
      AddField('field2' ,  ftString, 100);
      AddField('field3' ,  ftString, 100);
      AddField('field4' ,  ftString, 100);
      AddField('field5' ,  ftString, 100);

      Open;

      if FieldByName('field1').AsInteger > 0 then Result:= True;
  end;

End;

Function TFM_Main.IsValidEmpno(const empno : String):Boolean;
Begin
  Result:= False;

  with TDS1 do
  begin
      ServiceName := 'HINSA_select';
      Close;
      Sql.Clear;
      SQL.Add('SELECT count(empno),                    ');
      SQL.ADD('        ''field2'',                     ');
      SQL.ADD('        ''field3'',                     ');
      SQL.ADD('        ''field4'',                     ');
      SQL.ADD('        ''field5''                      ');
      SQL.Add('  FROM pimpmas                          ');
      SQL.Add(' WHERE EMPNO = ''' + trim(empno) + '''  ');
      SQL.Add('   AND PSTATE <''80''                   ');      

      ClearFieldInfo;
      AddField('field1' ,  ftString, 100);
      AddField('field2' ,  ftString, 100);
      AddField('field3' ,  ftString, 100);
      AddField('field4' ,  ftString, 100);
      AddField('field5' ,  ftString, 100);

      Open;

      if FieldByName('field1').AsInteger > 0 then Result:= True;
  end;

End;

Function TFM_Main.IsValidPhoneNo(const PhoneNo : String):Boolean;
var
    value, phone1, phone2, phone3 : String;
    MinusPos, i : Integer;
begin
    result := false;
    Value := removechar(PhoneNo,' ');
    if MatchesMask( Value, '[0-9]*-[0-9]*-[0-9]*' ) = False then
    begin
        Exit;
    end;

    if (length(Value)>13) then system.exit;

    MinusPos := AnsiPos( '-', Value );
    phone1   := trim(copy( Value, 1, MinusPos - 1 ));
    Value    := trim(copy( Value, MinusPos+1, Length( Value ) - MinusPos ));

    MinusPos := AnsiPos( '-', Value );
    phone2   := trim(copy( Value, 1, MinusPos - 1 ));
    Value    := trim(copy( Value, MinusPos+1, Length( Value ) - MinusPos ));

    phone3   := Value;

    if not((length(phone1)>=2)and(length(phone1)<=3)) then system.exit;    

    if not((length(phone2)>=3)and(length(phone1)<=4)) then system.exit;

    if (length(phone3)<>4) then system.exit;    

    i := 2;
    while (length(phone2)>=i) do
    begin
        if(phone2[1]<> phone2[i]) then break;
        i := i + 1;
    end;

    if(i> length(phone2)) then system.exit;

    i := 2;
    while (length(phone3)>=i) do
    begin
        if(phone3[1]<> phone3[i]) then break;
        i := i + 1;
    end;

    if(i> length(phone3)) then system.exit;
        
    result := true;    
end;

Function TFM_Main.IsValidSex(const Sex : String):Boolean;
begin
    result := false;

    if trim(Sex)='' then system.exit;

    if not ((trim(Sex)='남') or (trim(Sex)='여')) then system.exit;

    result := true;
end;

Function TFM_Main.IsValidJobplace(const jobplacenm : String):Boolean;
var
    job_len : integer;
    job_temp : string;
begin
    result := false;

    job_temp := jobplacenm;

    if trim(job_temp)='' then system.exit;

    job_len := length(trim(job_temp));

    if ((job_len < 2) or (job_len >20)) then system.exit;

    result := true;
end;

function TFM_Main.IsValidEmail(const Value: string): Boolean;
  function CheckAllowed(const s: string): Boolean;
  var i: Integer;
  begin
      Result:= false;
      for i:= 1 to Length(s) do
      begin
       if not (s[i] in ['a'..'z',
                        'A'..'Z',
                        '0'..'9',
                        '_',
                        '-',
                        '.'])
                        then
                           Exit;
      end;
      Result:= true;
  end;

var
  i: Integer;
  NamePart, ServerPart: string;
begin
    Result:= False;
    i:=Pos('@', Value);
    if i=0 then Exit;

    NamePart  := trim(Copy(Value, 1, i-1));
    ServerPart:= trim(Copy(Value, i+1, Length(Value)));
    if (Length(NamePart)=0) or ((Length(ServerPart)<3)) then Exit;
    i:=Pos('.', ServerPart);
    if (i=0) or (i>(Length(serverPart)-2)) then Exit;
    Result:= CheckAllowed(NamePart) and CheckAllowed(ServerPart);
end;

Function TFM_Main.IsValidStartDate(const startdate : String):Boolean;
var
   pre_mon, next_mon : string;
begin
    result := false;

    if trim(startdate)='' then system.exit;

    if not DateCheck(startdate) then system.exit;

    pre_mon  := removechar(AddMonthStr(copy(FG_Date,1,4)+'-'+copy(FG_Date,5,2)+'-'+copy(FG_Date,7,2),-1),'-');
    next_mon := removechar(AddMonthStr(copy(FG_Date,1,4)+'-'+copy(FG_Date,5,2)+'-'+copy(FG_Date,7,2),1),'-');

    if not((pre_mon<=startdate) and (startdate<=next_mon)) then system.exit;

    result := true;
end;

Function TFM_Main.IsValidEndDate(const startdate, enddate : String):Boolean;
var
   pre_mon, next_mon, cur_mon : string;
begin
    result := false;

    if trim(enddate)='' then system.exit;

    if not DateCheck(enddate) then system.exit;

    if not DateCheck(startdate) then
    begin
        result := true;
        system.exit;
    end;

    cur_mon  := copy(FG_Date,1,8);
    pre_mon  := startdate;
    next_mon := removechar(AddMonthStr(copy(startdate,1,4)+'-'+copy(startdate,5,2)+'-'+copy(startdate,7,2),12),'-');

    if not((pre_mon<enddate) and (enddate<next_mon)) then system.exit;

    //if (enddate<=cur_mon) then system.exit;

    result := true;
end;

function TFM_Main.StringOfDept(StringOfdeptcode : string): String;
var
  LengthOfDept : Integer;
begin
  for LengthOfDept := Length(StringOfdeptcode) downto 1  do begin
    if Copy(StringOfdeptcode,LengthOfDept,1) <> '0' then begin
      StringOfDept := Copy(StringOfdeptcode,1,LengthOfDept);
      Exit;
    end;
  end;
end;


procedure TFM_Main.s_deptnameInitPopup(Sender: TObject);
begin
    DeptForm.GSorgnum     := '';
    DeptForm.GSdeptcode   := '';
    DeptForm.GSdeptname   := '';
    DeptForm.E_cond.Text  := '';

  DeptForm.Edit         := TOnWinPopupEdit(Sender);
  DeptForm.E_condButtonClick(Sender,0);

  TOnWinPopupEdit(Sender).PopupControl := DeptForm ;
end;

procedure TFM_Main.s_deptnameCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
    if DeptForm.GSdeptcode <> '' then
    begin
        s_deptname.Text    := DeptForm.GSdeptname;

        Retrieve;
    end;
end;



procedure TFM_Main.PL_InitJob;
begin
  FM_Tmax           := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := TMaxSession;
  FG_Date           := FM_Tmax.GetData('sysdate','','');

  GSorgnum          := FM_Tmax.GetData('orgnum','','');
  GSDeptCode        := '';
  GSDeptname        := '';

  with TDS1 do
  begin
    ServiceName := 'HINSA_select';
    Close;
    Sql.Clear;
    SQL.ADD(' select a.orgnum,                        ');
    SQL.ADD('        a.deptcode,                      ');
    SQL.ADD('        b.deptname,                      ');
    SQL.ADD('        ''field4'',                      ');
    SQL.ADD('        ''field5''                       ');
    SQL.ADD('   from pimpmas a, pycdept b             ');
    SQL.ADD('  where a.empno    = ''' + GSempno + ''' ');
    SQL.ADD('    and a.deptcode = b.deptcode          ');
    SQL.ADD('    and a.orgnum   = b.orgnum            ');

    ClearFieldInfo;
    AddField('field1' ,  ftString, 100);
    AddField('field2' ,  ftString, 100);
    AddField('field3' ,  ftString, 100);
    AddField('field4' ,  ftString, 100);
    AddField('field5' ,  ftString, 100);
    Open;

    if(TDS1.RecordCount >= 1) then
    begin
       //GSorgnum       := FieldByName('field1').AsString;
       GSDeptCode     := FieldByName('field2').AsString;
       GSDeptname     := FieldByName('field3').AsString;
    end;
  end;

  //초기화
  s_empno.text     := '';
  s_korname.text   := '';
  //Rbtn_YClick(nil);
  Rbtn_Y.checked   := true;
  Rbtn_N.checked   := false;
  Rbtn_A.checked   := false;
  s_comname.text   := '';
  s_deptname.text  := '';
  s_managerid.text := '';

  SB_help.Panels[1].Text := '조회할 사번을 입력후 Enter Key를 치세요..';
  SendMessage(SB_help.handle,WM_PAINT,0,0);    
end;

procedure TFM_Main.BT_exitClick(Sender: TObject);
begin
  Close;
end;

procedure TFM_Main.initialize_InputFields;
begin
  e_empno.Text             := '';
  e_empno.Enabled          := false;
  e_korname.Text           := '';
  e_comcode.Text           := '';
  e_comname.Text           := '';
  e_birthdate.text         := '';
  e_sex.ItemIndex          := -1;
  e_orgnum.Text            := gsOrgnum;
  e_deptcode.Text          := gsDeptcode;
  e_deptname.Text          := gsDeptname;

  e_telno.Text             := '';
  e_cellno.Text            := '';
  e_email.Text             := '';
  e_jobplacenm.Text        := '';

  //e_managerid.empno        := GsEmpno;
  //e_managerid.korname      := GSkorname;
  //e_managerid.Text         := e_managerid.empno + '-' + e_managerid.korname;
  e_managerid.Text         := GsEmpno + '-' + GSkorname;

  e_regman.Text            := e_managerid.Text;
  e_regdate.Text           := displaydate(Copy(FG_Date,1,8));
  e_startdate.text         := '';
  e_enddate.Text           := '';

  e_fieldrepyn.ItemIndex   := -1;
  RB_Y.Checked             := True;

  e_writeman.Text          := '';
  e_writetime.Text         := '';
end;

procedure TFM_Main.BT_inputClick(Sender: TObject);
begin
    FL_OPstate               := 1 ;{입력상태}

    BT_delete.Enabled := false;

    initialize_InputFields;

    e_korname.SetFocus;
    SB_Help.SimpleText       := '새로운 자료를 등록하십시요.';
end;

procedure TFM_Main.Retrieve;
var
  SqlText : String;
begin
  with TDS_Grid do
  begin
       ServiceName := 'PZO2010A_sel1';
       Close;
       Sql.Clear;
       sql.Add('SELECT                                                                                        ');
       sql.Add('       A.EMPNO                                                                                ');
       sql.Add('      ,A.KORNAME                                                                              ');
       sql.Add('      ,A.COMCODE                                                                              ');
       sql.Add('      ,(select codename from drmcode where codeid =''C001'' and a.comcode = codeno) COMNAME   ');
       sql.Add('      ,A.BIRTHDATE                                                                            ');
       //sql.Add('      ,(SELECT CODENO||'':''||CODENAME FROM PYCCODE WHERE CODEID = ''I039'' AND A.SEX = CODENO) SEX  ');
       sql.Add('      ,A.SEX                                                                                  ');
       sql.Add('      ,A.ORGNUM                                                                               ');
       sql.Add('      ,A.DEPTCODE                                                                             ');
       sql.Add('      ,C.DEPTNAME                                                                             ');
       sql.Add('      ,A.TELNO                                                                                ');
       sql.Add('      ,A.CELLNO                                                                               ');
       sql.Add('      ,A.EMAIL                                                                                ');
       sql.Add('      ,A.JOBPLACENM                                                                           ');
       sql.Add('      ,A.MANAGERID                                                                            ');
       sql.Add('      ,B.KORNAME MANAGERNAME                                                                  ');
       sql.Add('      ,B.ORGNUM   MANAGER_ORGNUM                                                              ');
       sql.Add('      ,B.DEPTCODE MANAGER_DEPTCODE                                                            ');
       sql.Add('      ,D.DEPTNAME MANAGER_DEPTNAME                                                            ');
       sql.Add('      ,A.REGMAN                                                                               ');
       sql.Add('      ,(SELECT KORNAME FROM PIMPMAS WHERE A.REGMAN = EMPNO) REGMANNAME                        ');
       sql.Add('      ,A.REGDATE                                                                              ');
       sql.Add('      ,A.STARTDATE                                                                            ');
       sql.Add('      ,A.ENDDATE                                                                              ');
       sql.Add('      ,A.FIELDREPYN                                                                           ');
       sql.Add('      ,A.STATEYN                                                                              ');
       sql.Add('      ,A.WRITEMAN                                                                             ');
       sql.Add('      ,(SELECT KORNAME FROM PIMPMAS WHERE A.WRITEMAN = EMPNO) WRITEMANNAME                    ');
       sql.Add('      ,A.WRITETIME                                                                            ');
       sql.Add(' FROM PZMOUTMAS A, PIMPMAS B, PYCDEPT C, PYCDEPT D                                            ');
       sql.Add('WHERE A.MANAGERID = B.EMPNO                                                                   ');
       sql.Add('  AND A.ORGNUM    = C.ORGNUM(+)                                                               ');
       sql.Add('  AND A.DEPTCODE  = C.DEPTCODE(+)                                                             ');
       sql.Add('  AND B.ORGNUM    = D.ORGNUM(+)                                                               ');
       sql.Add('  AND B.DEPTCODE  = D.DEPTCODE(+)                                                             ');

       if Rbtn_Y.Checked = True then
            SQL.Add(' and a.stateyn = ''Y''                                                       ')
       else if Rbtn_N.Checked = True then
            SQL.Add(' and a.stateyn = ''N''                                                       ');

       if s_Empno.Text <> '' then
            SQL.Add(' and a.empno like '''+s_Empno.Text+'%'+'''                                   ');

       if s_Korname.Text <> '' then
            SQL.Add(' and a.korname like '''+'%'+s_Korname.Text+'%'+'''                           ');
            
       if s_comname.Text <> '' then
            SQL.Add(' and a.COMCODE in (select codeno from drmcode where codeid =''C001'' and codename like  ''%' + s_comname.Text + '%'')         ');

       if Trim(ParseString(s_managerid.text,'-',1)) <> '' then
       begin
            SQL.Add(' and (a.managerid like ''' + Trim(ParseString(s_managerid.text,'-',1)) + '%''  or   ');
            SQL.Add('      b.korname like ''' + Trim(ParseString(s_managerid.text,'-',1)) + '%''  )      ');            
       end;

       if s_deptname.text <> '' then
            SQL.Add(' and c.deptname like ''%'+s_deptname.text+'%''                               ');

       SQL.Add('  order by a.empno                                                                ');

       ClearFieldInfo;
       AddField('EMPNO'           , ftString, 4);
       AddField('KORNAME'         , ftString, 12);
       AddField('COMCODE'         , ftString, 4);
       AddField('COMNAME'         , ftString, 20);
       AddField('BIRTHDATE'       , ftString, 8);
       AddField('SEX'             , ftString, 31);
       AddField('ORGNUM'          , ftString, 3);
       AddField('DEPTCODE'        , ftString, 6);
       AddField('DEPTNAME'        , ftString, 60);
       AddField('TELNO'           , ftString, 14);
       AddField('CELLNO'          , ftString, 14);
       AddField('EMAIL'           , ftString, 60);
       AddField('JOBPLACENM'      , ftString, 20);
       AddField('MANAGERID'       , ftString, 4);
       AddField('MANAGERNAME'     , ftString, 12);
       AddField('MANAGER_ORGNUM'  , ftString, 3);
       AddField('MANAGER_DEPTCODE', ftString, 6);
       AddField('MANAGER_DEPTNAME', ftString, 60);
       AddField('REGMAN'          , ftString, 4);
       AddField('REGMANNAME'      , ftString, 12);
       AddField('REGDATE'         , ftString, 8);
       AddField('STARTDATE'       , ftString, 8);
       AddField('ENDDATE'         , ftString, 8);
       AddField('FIELDREPYN'      , ftString, 1);
       AddField('STATEYN'         , ftString, 1);
       AddField('WRITEMAN'        , ftString, 4);
       AddField('WRITEMANNAME'    , ftString, 12);
       AddField('WRITETIME'       , ftString, 15);

       Open;
  end;

  FL_OPstate := 0;
  BT_delete.Enabled := true;

  SB_help.Panels[1].Text := inttostr(TDS_Grid.RecordCount) + '건이 조회 되었습니다.';

end;


procedure TFM_Main.DataSource1DataChange(Sender: TObject; Field: TField);
begin
    with TDS_Grid do
    begin
        e_empno.Text         := FieldByName('EMPNO').AsString;
        e_korname.Text       := FieldByName('KORNAME').AsString;
        e_comcode.Text       := FieldByName('COMCODE').AsString;
        e_comname.Text       := FieldByName('COMNAME').AsString;
        e_birthdate.Text     := DisplayDate(FieldByName('BIRTHDATE').AsString);
        e_sex.Text           := FieldByName('SEX').AsString;
        e_orgnum.Text        := FieldByName('ORGNUM').AsString;
        e_deptcode.Text      := FieldByName('DEPTCODE').AsString;
        e_deptname.Text      := FieldByName('DEPTNAME').AsString;
        e_telno.Text         := FieldByName('TELNO').AsString;
        e_cellno.Text        := FieldByName('CELLNO').AsString;
        e_email.Text         := FieldByName('EMAIL').AsString;

        e_jobplacenm.Text    := FieldByName('JOBPLACENM').AsString;
        //e_managerid.empno    := FieldByName('MANAGERID').AsString;
        //e_managerid.korname  := FieldByName('MANAGERNAME').AsString;
        //e_managerid.Text     := e_managerid.empno +' - '+ e_managerid.korname;
        e_managerid.Text     := FieldByName('MANAGERID').AsString +' - '+ FieldByName('MANAGERNAME').AsString;

        e_regman.Text        := FieldByName('REGMAN').AsString + ' - ' +
                                FieldByName('REGMANNAME').AsString;

        e_regdate.Text       := DisplayDate(FieldByName('REGDATE').AsString);
        e_startdate.Text     := DisplayDate(FieldByName('STARTDATE').AsString);
        e_enddate.Text       := DisplayDate(FieldByName('ENDDATE').AsString);
        e_fieldrepyn.Text    := FieldByName('FIELDREPYN').AsString;

        if(FieldByName('STATEYN').AsString='Y') then
        begin
           RB_Y.checked := true;
           RB_N.checked := false;

        end
        else
        begin
           RB_Y.checked := false;
           RB_N.checked := true;

        end
        ;

        e_writeman.Text     := FieldByName('WRITEMAN').AsString + ' - ' +
                               FieldByName('WRITEMANNAME').AsString;

        e_writetime.Text    := FieldByName('WRITETIME').AsString;
    end;

    BT_delete.Enabled := true;
end;


procedure TFM_Main.bt_searchClick(Sender: TObject);
begin
    Retrieve;
end;

procedure TFM_Main.s_empnoKeyPress(Sender: TObject; var Key: Char);
begin
    if Key <> #13 then
         System.Exit;
    Key := #0;
    Retrieve;
end;

procedure TFM_Main.e_comcodeCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
    if ComForm.GScomcode <> '' then
    begin
        e_comcode.Text    := ComForm.GScomcode;
        e_comname.Text    := ComForm.GScomname;
    end;
end;

procedure TFM_Main.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := caFree;    
end;   


procedure TFM_Main.e_comcodeInitPopup(Sender: TObject);
begin
    ComForm.GScomcode     := '';
    ComForm.GScomname     := '';
    ComForm.e_cond.text   := '';

    ComForm.Edit         := TOnWinPopupEdit(Sender);
    
    ComForm.E_condButtonClick(Sender,0);

    TOnWinPopupEdit(Sender).PopupControl := ComForm ;

end;

procedure TFM_Main.BT_cancelClick(Sender: TObject);
begin
    FL_OPstate := 0;
    if  Application.MessageBox('취소하시겠습니까 ?',  'Message Box',mb_OKCancel + mb_DefButton1) = IDOK  then
    begin
        //TDS_Grid.close;
        //        TDS_Grid.open;
    end;
end;

procedure TFM_Main.BT_deleteClick(Sender: TObject);
begin
    FL_OPstate := 0;

    if(e_empno.Text='') then
    begin
        MessageBox(Handle,'선택한 자료가 없습니다.' , '경고', MB_ICONWARNING);
        system.exit;
    end;

    if MessageDlg('해당 자료를 삭제하시겠습니까?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then exit;

    Try
        with TDS1 do
        begin
          ServiceName := 'PZO2010A_dml';
          Close;
          Sql.Clear;
          SQL.Text  := 'DELETE FROM PZMOUTMAS                                                   ' + #13#10 +
                       ' WHERE empno       = '''  + e_empno.Text                  + '''         ';
          Execute;
        end;
     EXCEPT ON E : EDataBaseError DO
          Application.Messagebox('외주인력 삭제에 실패했습니다.','작업안내',mb_ok+ mb_IconStop);

     END;
     Retrieve;
end;

procedure TFM_Main.Rbtn_YClick(Sender: TObject);
begin
  Rbtn_Y.checked   := true;
  Rbtn_N.checked   := false;
  Rbtn_A.checked   := false;

  Retrieve;
end;

procedure TFM_Main.Rbtn_NClick(Sender: TObject);
begin
  Rbtn_Y.checked   := false;
  Rbtn_N.checked   := true;
  Rbtn_A.checked   := false;

  Retrieve;
end;

procedure TFM_Main.Rbtn_AClick(Sender: TObject);
begin
  Rbtn_Y.checked   := false;
  Rbtn_N.checked   := false;
  Rbtn_A.checked   := true;

  Retrieve;
end;

procedure TFM_Main.initialize_variables;
begin
    p_empno       := '';
    p_korname     := '';
    p_comcode     := '';
    p_birthdate   := '';
    p_sex         := '';    
    p_orgnum      := '';
    p_deptcode    := '';
    p_managerid   := '';
    p_telno       := '';
    p_cellno      := '';
    p_email       := '';
    p_jobplacenm  := '';
    p_regman      := '';
    p_regdate     := '';
    p_startdate   := '';
    p_enddate     := '';
    p_fieldrepyn  := '';
    p_stateyn     := '';
    p_writeman    := '';

    p_old_startdate   := '';
    p_old_enddate     := '';

    if(FL_OPstate<>1) then
    begin
        p_empno            := trim(e_empno.text);

        if(p_empno<>'') then
        begin
            p_old_startdate    := TDS_Grid.FieldByName('STARTDATE').AsString;
            p_old_enddate      := TDS_Grid.FieldByName('ENDDATE').AsString;
        end;
    end;

    p_korname     := trim(e_korname.Text);
    p_comcode     := e_comcode.text;
    p_birthdate   := trim(removechar(e_birthdate.text,'-'));
    p_sex         := trim(e_sex.text);
    p_orgnum      := e_orgnum.text;
    p_deptcode    := e_deptcode.text;
    p_managerid   := Trim(ParseString(e_managerid.text,'-',1));

    if(trim(removechar(e_telno.text,'-'))<>'')  then p_telno   :=  removechar(e_telno.text,' ');

    if(trim(removechar(e_cellno.text,'-'))<>'') then p_cellno  :=  removechar(e_cellno.text,' ');

    p_email       := trim(e_email.text);
    p_jobplacenm  := RemoveSpecialChar(e_jobplacenm.text);
    p_regman      := copy(e_regman.Text,1,4);
    p_regdate     := trim(removechar(e_regdate.text,'-'));
    p_startdate   := trim(removechar(e_startdate.text,'-'));
    p_enddate     := trim(removechar(e_enddate.text,'-'));
    p_fieldrepyn  := e_fieldrepyn.text;

    if(RB_Y.Checked) then p_stateyn     :=  'Y'
                     else p_stateyn     :=  'N';

    p_writeman    :=  GSempno;
end;


Function TFM_Main.CheckEmpnoDup(const korname, birthdate, sex : String):Boolean;
Begin
    result := false;

    with TDS1 do
    begin
        ServiceName := 'HINSA_select';
        Close;
        Sql.Clear;
        SQL.Add(' select count(*),                         ');
        SQL.Add('        ''field2'',                       ');
        SQL.Add('        ''field3'',                       ');
        SQL.Add('        ''field4'',                       ');
        SQL.Add('        ''field5''                        ');
        SQL.Add('   from PZMOUTMAS                         ');
        SQL.Add('  where korname   = ''' + korname   + ''' ');
        SQL.Add('    and birthdate = ''' + birthdate + ''' ');
        SQL.Add('    and sex       = ''' + sex       + ''' ');
        SQL.Add('    and nvl(stateyn,''N'') = ''Y''        ');        

        ClearFieldInfo;
        AddField('field1' ,  ftString, 100);
        AddField('field2' ,  ftString, 100);
        AddField('field3' ,  ftString, 100);
        AddField('field4' ,  ftString, 100);
        AddField('field5' ,  ftString, 100);
        
        Open;

        if(FieldByName('field1').AsInteger >= 1) then
        begin
            result := true;
            exit;
        end;
    end;
End;

Function TFM_Main.AutoEmpno:String;
var
  i, ck , ick: integer;
  tmp_Empno : String;
begin
    tmp_Empno := '';

    with TDS1 do
    begin
        ServiceName := 'HINSA_select';
        Close;
        Sql.Clear;
        //2015.06.25.hjku.. 기존 사번코드 생성 쿼리 가져옴...(PDRMHOUT)
        SQL.Add('select decode(substr(max(empno),2,3),''999'',                                ');
        SQL.Add('              decode(substr(max(empno),1,1),''9'',''A000'',                  ');
        SQL.Add('                     CHR(ASCII(substr(max(empno),1,1))+1)||''000''),         ');
        SQL.Add('       substr(max(empno),1,1)||                                              ');
        SQL.Add('       Lpad(to_char(to_number(substr(max(empno),2,3))+1),3,''0''))  MAXEMPNO,');
        SQL.Add('        ''field2'',                                                          ');
        SQL.Add('        ''field3'',                                                          ');
        SQL.Add('        ''field4'',                                                          ');
        SQL.Add('        ''field5''                                                           ');
        SQL.Add('   from PZMOUTMAS                                                            ');

        ClearFieldInfo;
        AddField('field1' ,  ftString, 100);
        AddField('field2' ,  ftString, 100);
        AddField('field3' ,  ftString, 100);
        AddField('field4' ,  ftString, 100);
        AddField('field5' ,  ftString, 100);
        Open;

        if(TDS1.RecordCount >= 1) then
        begin
            tmp_Empno := FieldByName('field1').AsString;
        end;

        if(tmp_Empno > 'Z999')or(trim(tmp_Empno)='')then
        begin
            //MessageDlg('사번생성에 실패하였습니다.', mtError, [mbOk], 0);
            tmp_Empno := '';
        end;
    end;

    result := tmp_Empno;
end;

function TFM_Main.IsValidInputValue : Boolean;
var
   msg_str : String;
   pre_mon,next_mon : String;
begin
    result := false;
    initialize_variables;

    if(FL_OPstate<>1) and (p_empno='') then
    begin
        MessageDlg('선택한 자료가 없습니다.' , mtWarning, [mbOk], 0);
        system.exit;
    end;

    if(p_korname='') then
    begin
        MessageDlg('성명을 입력해 주시기 바랍니다.' , mtError, [mbOk], 0);
        e_korname.SetFocus;
        system.exit;
    end;

    if(p_birthdate='') then
    begin
        MessageDlg('생년월일을 입력해 주시기 바랍니다.', mtError, [mbOk], 0);
        e_birthdate.SetFocus;
        system.exit;
    end;

    if(not DateCheck(p_birthdate)) then
    begin
        MessageDlg('입력한 생년월일이 날짜형식에 맞지 않습니다.', mtError, [mbOk], 0);
        e_birthdate.SetFocus;
        system.exit;
    end;

    if(p_sex='') then
    begin
        MessageDlg('성별을 선택해 주시기 바랍니다.', mtError, [mbOk], 0);
        e_sex.SetFocus;
        system.exit;
    end;

    if(p_stateyn='N') then
    begin
        if(p_enddate > copy(FG_Date,1,8)) then p_enddate := copy(FG_Date,1,8);

        if(p_startdate> p_enddate ) then
        begin
            MessageDlg('퇴직처리시 투입시작일은 현재일 또는 퇴직종료일보다 이전이어야 합니다.', mtError, [mbOk], 0);
            e_startdate.SetFocus;
            system.exit;
        end;
    end;

    //퇴직처리시에는 데이타 검증하지 않음
    if(FL_OPstate<>1)and(p_stateyn='N') then
    begin
        result := true;
        system.exit;
    end;


    if(FL_OPstate=1) then
    begin
        if CheckEmpnoDup(p_korname, p_birthdate, p_sex ) then
        begin
(*
        if CheckEmpnoDup(p_korname, p_birthdate, p_sex ) then
        begin
            msg_str := '성명, 생년월일, 성별로 중복된 자료가 존재합니다.'+#13#10+
                       '기등록 자료를 확인후 재등록해 하시겠습니까?';
            if MessageDlg(msg_str,mtConfirmation, [mbYes, mbNo], 0) = mrYes then
            begin
                s_korname.Text      := p_korname;
                s_empno.Text        := '';
                Rbtn_Y.Checked      := true;
                s_managerid.text    := '';
                retrieve;
                system.exit;
            end;

            p_empno := AutoEmpno;

            if(trim(p_empno)='') then
            begin
                MessageDlg('사번생성에 실패하였습니다.', mtError, [mbOk], 0);
                system.exit;
            end;

        end;
*)
            msg_str := '성명, 생년월일, 성별로 중복된 자료가 존재하여 등록이 불가능합니다.'+#13#10+
                       '중복 등록이 불가피 할 경우 IT기획보안팀 윤진석M로 문의바랍니다.';
            MessageDlg(msg_str,mtConfirmation, [mbOK	], 0);

            s_korname.Text      := p_korname;
            s_empno.Text        := '';
            Rbtn_Y.Checked      := true;
            s_managerid.text    := '';
            retrieve;
            system.exit;

        end;

         p_empno := AutoEmpno;

         if(trim(p_empno)='') then
         begin
             MessageDlg('사번생성에 실패하였습니다.', mtError, [mbOk], 0);
             system.exit;
         end;
    end;

    if(p_comcode='') then
    begin
        MessageDlg('소속회사를 선택해 주시기 바랍니다.', mtError, [mbOk], 0);
        e_comcode.SetFocus;
        system.exit;
    end;

    if(p_orgnum<>Trim(GSorgnum)) then
    begin
        MessageDlg('현 조직 차수의 관리부서를 선택해 주시기 바랍니다.' , mtError, [mbOk], 0);
        e_deptcode.SetFocus;
        system.exit;
    end;

    if(p_deptcode='') then
    begin
        MessageDlg('관리부서를 선택해 주시기 바랍니다.', mtError, [mbOk], 0);
        e_deptcode.SetFocus;
        system.exit;
    end;

    if(p_telno='') then
    begin
        MessageDlg('일반전화를 입력해 주시기 바랍니다.', mtError, [mbOk], 0);
        e_telno.SetFocus;
        system.exit;
    end;

    if(not IsValidPhoneNo(p_telno)) then 
    begin
        MessageDlg('정확한 전화번호를 입력해 주시기 바랍니다.' + #13#10 +
                   '임의의 연속된 숫자는 입력불가 합니다.', mtError, [mbOk], 0);
        e_telno.SetFocus;
        system.exit;
    end;

    if(p_cellno='') then
    begin
        MessageDlg('핸드폰번호를 입력해 주시기 바랍니다.', mtError, [mbOk], 0);
        e_cellno.SetFocus;
        system.exit;
    end;

    if(not IsValidPhoneNo(p_cellno)) then
    begin
        MessageDlg('정확한 핸드폰번호를 입력해 주시기 바랍니다.' + #13#10 +
                   '임의의 연속된 숫자는 입력불가 합니다.', mtError, [mbOk], 0);
        e_cellno.SetFocus;
        system.exit;
    end;

    if(p_email='') then
    begin
        MessageDlg('이메일주소를 입력해 주시기 바랍니다.', mtError, [mbOk], 0);
        e_email.SetFocus;
        system.exit;
    end;

    if(not IsValidEmail(p_email)) then
    begin
        MessageDlg('정확한 이메일주소를 입력해 주시기 바랍니다.', mtError, [mbOk], 0);
        e_email.SetFocus;
        system.exit;
    end;

    if(p_jobplacenm='') then
    begin
        MessageDlg('근무지명을 입력해 주시기 바랍니다.', mtError, [mbOk], 0);
        e_jobplacenm.SetFocus;
        system.exit;
    end;

    if(not IsValidJobplace(p_jobplacenm)) then
    begin
        MessageDlg('근무지명을 특수문자 제외한 한글 10자이내로 입력하시기 바랍니다.', mtError, [mbOk], 0);
        e_jobplacenm.SetFocus;
        system.exit;
    end;

    if(p_managerid='') then
    begin
        MessageDlg('담당매니저를 선택해 주시기 바랍니다.', mtError, [mbOk], 0);
        e_managerid.SetFocus;
        system.exit;
    end;

    if(not IsValidEmpno(p_managerid)) then
    begin
        MessageDlg('재직중인 담당매니저를 선택해 주시기 바랍니다.', mtError, [mbOk], 0);
        e_managerid.SetFocus;
        system.exit;
    end;


    if(p_startdate='') then
    begin
        MessageDlg('투입시작일을 입력해 주시기 바랍니다.', mtError, [mbOk], 0);
        e_startdate.SetFocus;
        system.exit;
    end;

    if(FL_OPstate=1) or
      ((FL_OPstate<>1)and ((p_old_startdate<>p_startdate)or (p_old_enddate<>p_enddate))) then //추가할 경우 또는 투입시작일,투입종료일 변경시만 체크
    begin
        if(not IsValidStartDate(p_startdate)) then
        begin
            MessageDlg('투입시작일은 현재날짜 한달 전후로만 입력가능합니다.', mtError, [mbOk], 0);
            e_startdate.SetFocus;
            system.exit;
        end;
    end;

    if(p_enddate='') then
    begin
        MessageDlg('투입종료일을 입력해 주시기 바랍니다.', mtError, [mbOk], 0);
        e_enddate.SetFocus;
        system.exit;
    end;

    if(not IsValidEndDate(p_startdate,p_enddate)) then
    begin
        MessageDlg('투입종료일은 투입시작일로부터 1년이내로 입력해 주시기 바랍니다.', mtError, [mbOk], 0);
        //MessageDlg('투입종료일을 현재일보다 크거나' + #13#10 +
        //           '투입시작일로부터 1년이내로 입력해 주시기 바랍니다.', mtError, [mbOk], 0);
        e_enddate.SetFocus;
        system.exit;
    end;

    if(p_fieldrepyn='') then
    begin
        MessageDlg('현장대리인 여부를 선택해 주시기 바랍니다.', mtError, [mbOk], 0);
        e_fieldrepyn.SetFocus;
        system.exit;
    end;

    if(p_stateyn='') then
    begin
        MessageDlg('재직/퇴직 여부를 선택해 주시기 바랍니다.', mtError, [mbOk], 0);
        RB_Y.SetFocus;
        system.exit;
    end;
    
    result := true;
end;

function TFM_Main.UpdatePzmoutmas  : Boolean;
begin
    result := true;

    with TDS1 do
    begin
        ServiceName := 'PZO2010A_dml';
        Close;
        Sql.Clear;
        SQL.Text  := 'Update PZMOUTMAS                                                        ' + #13#10 +
                     '   Set KORNAME     =''' + p_korname                       + ''',        ' + #13#10 +
                     '       COMCODE     =''' + p_comcode                       + ''',        ' + #13#10 +
                     '       BIRTHDATE   =''' + p_birthdate                     + ''',        ' + #13#10 +
                     '       SEX         =''' + p_sex                           + ''',        ' + #13#10 +
                     '       ORGNUM      =''' + p_orgnum                        + ''',        ' + #13#10 +
                     '       DEPTCODE    =''' + p_deptcode                      + ''',        ' + #13#10 +
                     '       MANAGERID   =''' + p_managerid                     + ''',        ' + #13#10 +
                     '       TELNO       =''' + p_telno                         + ''',        ' + #13#10 +
                     '       CELLNO      =''' + p_cellno                        + ''',        ' + #13#10 +
                     '       EMAIL       =''' + p_email                         + ''',        ' + #13#10 +
                     '       JOBPLACENM  =''' + p_jobplacenm                    + ''',        ' + #13#10 +
                     '       STARTDATE   =''' + p_startdate                     + ''',        ' + #13#10 +
                     '       ENDDATE     =''' + p_enddate                       + ''',        ' + #13#10 +
                     '       FIELDREPYN  =''' + p_fieldrepyn                    + ''',        ' + #13#10 +
                     '       STATEYN     =''' + p_stateyn                       + ''',        ' + #13#10 +
                     '       WRITEMAN    =''' + p_writeman                      + ''',        ' + #13#10 +
                     '       WRITETIME   =to_char(sysdate,''YYYYMMDDHH24miss'')               ' + #13#10 +
                     ' WHERE empno       = '''  + p_empno                       + '''         ';

        Execute;

        if(TMaxSession.HeaderPacket.ErrorCode<>'1403') then result := false;
    end;                                                                     
end;

function TFM_Main.InsertPzmoutmas : Boolean;
begin
    result := true;

    with TDS1 do
    begin
        ServiceName := 'PZO2010A_dml';
        Close;
        Sql.Clear;
        SQL.Text  := 'INSERT INTO PZMOUTMAS( EMPNO                        ' +#13#10 +
                     '                      ,KORNAME                      ' +#13#10 +
                     '                      ,COMCODE                      ' +#13#10 +
                     '                      ,BIRTHDATE                    ' +#13#10 +
                     '                      ,SEX                          ' +#13#10 +
                     '                      ,ORGNUM                       ' +#13#10 +
                     '                      ,DEPTCODE                     ' +#13#10 +
                     '                      ,MANAGERID                    ' +#13#10 +
                     '                      ,TELNO                        ' +#13#10 +
                     '                      ,CELLNO                       ' +#13#10 +
                     '                      ,EMAIL                        ' +#13#10 +
                     '                      ,JOBPLACENM                   ' +#13#10 +
                     '                      ,REGMAN                       ' +#13#10 +
                     '                      ,REGDATE                      ' +#13#10 +
                     '                      ,STARTDATE                    ' +#13#10 +
                     '                      ,ENDDATE                      ' +#13#10 +
                     '                      ,FIELDREPYN                   ' +#13#10 +
                     '                      ,STATEYN                      ' +#13#10 +
                     '                      ,WRITEMAN                     ' +#13#10 +
                     '                      ,WRITETIME)                   ' +#13#10 +
                     '              VALUES( ''' + p_empno           + ''' ' +#13#10 +
                     '                     ,''' + p_korname         + ''' ' +#13#10 +
                     '                     ,''' + p_comcode         + ''' ' +#13#10 +
                     '                     ,''' + p_birthdate       + ''' ' +#13#10 +
                     '                     ,''' + p_sex             + ''' ' +#13#10 +
                     '                     ,''' + p_orgnum          + ''' ' +#13#10 +
                     '                     ,''' + p_deptcode        + ''' ' +#13#10 +
                     '                     ,''' + p_managerid       + ''' ' +#13#10 +
                     '                     ,''' + p_telno           + ''' ' +#13#10 +
                     '                     ,''' + p_cellno          + ''' ' +#13#10 +
                     '                     ,''' + p_email           + ''' ' +#13#10 +
                     '                     ,''' + p_jobplacenm      + ''' ' +#13#10 +
                     '                     ,''' + p_regman          + ''' ' +#13#10 +
                     '                     ,''' + p_regdate         + ''' ' +#13#10 +
                     '                     ,''' + p_startdate       + ''' ' +#13#10 +
                     '                     ,''' + p_enddate         + ''' ' +#13#10 +
                     '                     ,''' + p_fieldrepyn      + ''' ' +#13#10 +
                     '                     ,''' + p_stateyn         + ''' ' +#13#10 +
                     '                     ,''' + p_writeman        + ''' ' +#13#10 +
                     '                     ,to_char(sysdate,''YYYYMMDDHH24miss'')) ' ;

        Execute;

        if(TMaxSession.HeaderPacket.ErrorCode<>'1403') then result := false;
    end;
end;

procedure TFM_Main.BT_saveClick(Sender: TObject);
var
   ret_val : boolean;
begin
    if not IsValidInputValue then system.exit;

    if MessageDlg('입력하신 내역을 저장하시겠습니까?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then exit;
    
    if(FL_OPstate<>1) then
         ret_val := UpdatePzmoutmas
    else ret_val := InsertPzmoutmas;

    if not (ret_val) then
    begin
        MessageDlg('저장에 실패했습니다. '+#13#10+
                   '오류메시지 : '+ TMaxSession.HeaderPacket.ErrorMsg, mtError, [mbOk], 0);
    end
    else Retrieve;
end;


procedure TFM_Main.e_deptcodeInitPopup(Sender: TObject);
begin
    DeptForm.GSorgnum     := '';
    DeptForm.GSdeptcode   := '';
    DeptForm.GSdeptname   := '';
    DeptForm.E_cond.Text  := '';

  DeptForm.Edit         := TOnWinPopupEdit(Sender);
  DeptForm.E_condButtonClick(Sender,0);

  TOnWinPopupEdit(Sender).PopupControl := DeptForm ;
end;


procedure TFM_Main.e_deptcodeCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
  if DeptForm.GSdeptcode <> '' then
    begin
      e_orgnum.Text      := DeptForm.GSorgnum;
      e_deptcode.Text    := DeptForm.GSdeptcode;
      e_deptname.Text    := DeptForm.GSdeptname;
    end;
end;


procedure TFM_Main.OnFocusButton1Click(Sender: TObject);
begin
  ComMgrForm := TComMgrForm.Create(Self);
  try
       ComMgrForm.ShowModal;
  finally
       ComMgrForm.Free;
  end;

end;


procedure TFM_Main.s_comnameCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
    if ComForm.GScomcode <> '' then
    begin
        s_comname.Text    := ComForm.GScomname;
        Retrieve;        
    end;
end;


procedure TFM_Main.s_comnameInitPopup(Sender: TObject);
begin
    ComForm.GScomcode     := '';
    ComForm.GScomname     := '';
    ComForm.e_cond.text   := '';

    ComForm.Edit         := TOnWinPopupEdit(Sender);

    ComForm.E_condButtonClick(Sender,0);

    TOnWinPopupEdit(Sender).PopupControl := ComForm ;
end;


procedure TFM_Main.DBG_gridCellClick(Sender: TObject;
  const ACell: TOnJCell);
begin
    //데이타 1개일때 오류 막기 위해 다시 조회함.
    if(TDS_Grid.RecordCount = 1 ) then Retrieve;
end;


procedure TFM_Main.BB_ExcelClick(Sender: TObject);
var XL, XArr: Variant;
    i,j,k: integer;
    SavePlace: TBookmark;
begin
{ //전체자료 추출할때..}
  if TDS_Grid.RecordCount < 1 then
  begin
       showmessage('엑셀 변환할 자료가 없습니다.');
       exit;
  end;
  SB_help.Panels[1].Text := 'Excel이 설치되어 있는지 검색하고 있습니다.';

  XArr := VarArrayCreate([1, 25], VarVariant);
  try
       XL := CreateOLEObject('Excel.Application');
  except
       MessageDlg('Excel이 설치되어 있지 않습니다.', MtWarning, [mbok], 0);
       SB_help.Panels[1].Text := '';
       Exit;
  end;

  SB_help.Panels[1].Text := '자료를 변환하고 있습니다.';
  XL.WorkBooks.Add; //새로운 페이지 생성
  XL.Visible            := false;
  XL.WorkSheets[1].Name := '외주인력 명단';  //시트명 부여
  XL.Range['A1:Y2'].Merge;               //셀 병합

  //TITLE NAME 설정
  XL.Range['A1'].value  := '외주인력등록내역';
  XL.Range['A1'].font.Size := 16;
  XL.Range['A1'].font.Bold := True;

  //컬럼명 지정_서브타이블 지정

  XArr[ 1]  := '사원번호'      ;
  XArr[ 2]  := '사원성명'      ;
  XArr[ 3]  := '소속회사코드'  ;
  XArr[ 4]  := '소속회사명'    ;
  XArr[ 5]  := '생년월일'      ;
  XArr[ 6]  := '성별'          ;
  XArr[ 7]  := '조직차수'      ;
  XArr[ 8]  := '관리부서코드'  ;
  XArr[ 9]  := '관리부서명'    ;
  XArr[10]  := '일반전화'      ;
  XArr[11]  := '핸드폰'        ;
  XArr[12]  := '이메일'        ;
  XArr[13]  := '근무지명'      ;
  XArr[14]  := '담당매니저사번';
  XArr[15]  := '담당매니저성명';
  XArr[16]  := '최초등록자사번';
  XArr[17]  := '최초등록자성명';
  XArr[18]  := '최초등록일'    ;
  XArr[19]  := '투입시작일'    ;
  XArr[20]  := '투입종료일'    ;
  XArr[21]  := '현장대리인여부';
  XArr[22]  := '재/퇴직여부'   ;
  XArr[23]  := '최종변경자사번';
  XArr[24]  := '최종변경자성명';
  XArr[25]  := '최종변경일'    ;

  XL.Range['A3' , 'Y3'].Value := XArr;
  k := 3;
  for i := 1 to 25 do
  begin
     XL.Range[CHR(64 + i) + '3'].HorizontalAlignment := 3;
     XL.Range[CHR(64 + i) + '3'].Interior.Color:= $00CBF0B3;
     XL.Range[CHR(64 + i) + '3'].font.Size := 10;
     XL.Range[CHR(64 + i) + '3'].font.Bold := True;
  end;

  //검색된 자료를 excel에 export처리 시킨다.
  SavePlace := TDS_Grid.GetBookmark;
  TDS_Grid.DisableControls;
  TDS_Grid.First;     //Showmessage(inttostr(TDS_Grid.RecordCount));

  for i := 1 to  TDS_Grid.RecordCount do
  begin
     XArr[ 1]  := ''''+TDS_Grid.FieldbyName('EMPNO').AsString;
     XArr[ 2]  := TDS_Grid.FieldByName('KORNAME').AsString;
     XArr[ 3]  := ''''+TDS_Grid.FieldbyName('COMCODE').AsString;
     XArr[ 4]  := TDS_Grid.FieldbyName('COMNAME').AsString;
     XArr[ 5]  := DisplayDate(TDS_Grid.FieldByName('BIRTHDATE').AsString);
     XArr[ 6]  := TDS_Grid.FieldByName('SEX').AsString;
     XArr[ 7]  := TDS_Grid.FieldByName('ORGNUM').AsString;
     XArr[ 8]  := TDS_Grid.FieldByName('DEPTCODE').AsString;
     XArr[ 9]  := TDS_Grid.FieldByName('DEPTNAME').AsString;
     XArr[10]  := TDS_Grid.FieldByName('TELNO').AsString;
     XArr[11]  := TDS_Grid.FieldByName('CELLNO').AsString;
     XArr[12]  := TDS_Grid.FieldByName('EMAIL').AsString;
     XArr[13]  := TDS_Grid.FieldByName('JOBPLACENM').AsString;
     XArr[14]  := ''''+TDS_Grid.FieldbyName('MANAGERID').AsString;
     XArr[15]  := TDS_Grid.FieldbyName('MANAGERNAME').AsString;
     XArr[16]  := ''''+TDS_Grid.FieldByName('REGMAN').AsString;
     XArr[17]  := TDS_Grid.FieldByName('REGMANNAME').AsString;
     XArr[18]  := DisplayDate(TDS_Grid.FieldByName('REGDATE').AsString);
     XArr[19]  := DisplayDate(TDS_Grid.FieldByName('STARTDATE').AsString);
     XArr[20]  := DisplayDate(TDS_Grid.FieldByName('ENDDATE').AsString);
     XArr[21]  := TDS_Grid.FieldByName('FIELDREPYN').AsString;
     XArr[22]  := TDS_Grid.FieldByName('STATEYN').AsString;
     XArr[23]  := ''''+TDS_Grid.FieldByName('WRITEMAN').AsString;
     XArr[24]  := TDS_Grid.FieldByName('WRITEMANNAME').AsString;
     XArr[25]  := ''''+TDS_Grid.FieldByName('WRITETIME').AsString;

     XL.Range['A' + IntToStr(k+1), 'Y' + IntToStr(k+1)].Value := XArr;
     inc(k);
     TDS_Grid.Next;
  end;
  //여기서 부터는 EXPORT된 EXCEL자료를 예쁘게 꾸미는 부분입니다.
   XL.Range['A1', 'Y' + IntToStr(k)].Borders.LineStyle   := 1;  //테두리선을 만든다.  1은 실선
   XL.Range['A1', 'Y' + IntToStr(k)].Borders.Weight      := 2;  //테두리선 두깨 설정  2는 보통두깨, 3은 무지 두꺼움
   XL.Range['A1', 'Y' + IntToStr(k)].Borders.ColorIndex  := 1;  //테두리선 색상설정  1은 검은색
   XL.Range['A1', 'Y' + IntToStr(k)].font.name := '맑은 고딕';//'굴림체';
   XL.Range['A1', 'A1'].HorizontalAlignment              := 3;  //가운데 정렬
   XL.Range['A3', 'Y' + IntToStr(k)].font.Size           := 9;
   XL.Range['A4', 'Y' + IntToStr(k)].HorizontalAlignment := 1;  //좌측정렬
   //XL.Range['J4', 'J' + IntToStr(k)].HorizontalAlignment := 1;  //우측정렬
   //XL.Range['K4', 'V' + IntToStr(k)].HorizontalAlignment := 2;  //좌측정렬
   XL.Range['A1', 'Y' + IntToStr(k)].Select;                    //자료를 모두 SELECT한 후 --하는 이유:  AutoFit 처리하기 위해서임
   XL.Selection.Columns.AutoFit;                                //자동정렬
   XL.Range['A4', 'A4'].Select;                                 //A4열에 커서 위치시킴
   XL.Visible := true;                                          //엑셀자료 보여줌
   Screen.Cursor := crDefault;
   TDS_Grid.GotoBookmark(SavePlace);
   TDS_Grid.FreeBookmark(SavePlace);
   TDS_Grid.EnableControls;
   SB_help.Panels[1].Text := '';
end;

procedure TFM_Main.BT_batchClick(Sender: TObject);
begin  
  FM_Batch := TFM_Batch.Create(Self);
  try
       FM_Batch.ShowModal;
  finally
       FM_Batch.Free;
  end;
end;  

procedure TFM_Main.s_manageridCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
  if EmpForm.GSempnoS <> '' then
  begin
       s_managerid.Text    := EmpForm.GSempnoS +' - ' + EmpForm.GSkornameS;

       Retrieve;
  end;
end;

procedure TFM_Main.s_manageridInitPopup(Sender: TObject);
begin
    EmpForm.GSempnoS    := '' ;
    EmpForm.GSkornameS  := '' ;
    EmpForm.GSpstateS   := '' ;
    EmpForm.GSdeptcodeS := '' ;
    EmpForm.GSdeptnameS := '' ;
    EmpForm.E_Cond.Text := '' ;
    
    EmpForm.Edit        := TOnWinPopupEdit(Sender);
    EmpForm.E_condButtonClick(Sender,0);

    TOnWinPopupEdit(Sender).PopupControl := EmpForm ;
end;

procedure TFM_Main.s_manageridKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
       Retrieve;
  end;
end;

procedure TFM_Main.e_manageridCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
  if EmpForm.GSempnoS <> '' then
  begin
       e_managerid.Text    := EmpForm.GSempnoS +' - ' + EmpForm.GSkornameS;
  end;
end;

procedure TFM_Main.e_manageridInitPopup(Sender: TObject);
begin
    EmpForm.GSempnoS    := '' ;
    EmpForm.GSkornameS  := '' ;
    EmpForm.GSpstateS   := '' ;
    EmpForm.GSdeptcodeS := '' ;
    EmpForm.GSdeptnameS := '' ;
    EmpForm.E_Cond.Text := '' ;

    EmpForm.Edit        := TOnWinPopupEdit(Sender);
    EmpForm.E_condButtonClick(Sender,0);

    TOnWinPopupEdit(Sender).PopupControl := EmpForm ;
end;

function TFM_Main.RemoveSpecialChar(sSrc: string): string;
var
  I: integer;
begin
  result := '';
  
  for I:=1 to Length(sSrc) do
    if (sSrc[I] in ['(',')','[',']',' ','A'..'Z', 'a'..'z', '0'..'9','(',')']) or (ByteType(sSrc, I)<>mbSingleByte) then
    //if not(sSrc[I] in ['''','$','#','.']) then
      result := result + sSrc[I];
end;

procedure TFM_Main.s_comnameKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
       Retrieve;
  end;
end;

procedure TFM_Main.s_deptnameKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
       Retrieve;
  end;
end;

procedure TFM_Main.FormShow(Sender: TObject);
var
  emptype : string;
begin
  Self.OnPaint := Nil;
  Application.ProcessMessages;
  SF_Main.Refresh;
  SB_help.Panels[1].Text := '인사시스템에 접속 중입니다...';

  ///////////////////////////////////////////////////////////////////////
  //for test by hjku
  //TMaxSession.EnvFileName := 'd:\src\newhana.env';
  TMaxSession.EnvFileName := GetHomeDir+'\newhana.env';
  TMaxSession.LabelName   := 'HANAROHPER';
  TMaxSession.Connect  := False;
  TMaxSession.Host     := Hinsa_Param(cmdline,10);
  TMaxSession.Port     := '9999';

    try
      TMaxSession.Connect := True;
    except
      //Application.MessageBox(PChar(TMaxSession.HeaderPacket),'에러',mb_ok);
      showmessage('Error Code : ' + TMaxSession.HeaderPacket.ErrorCode + #13 + #13 +
                  'Error Msg  : ' + TMaxSession.HeaderPacket.ErrorMsg  + #13 + #13 +
                  '관리자에게 문의하십시오.');
      Application.Terminate;
      Exit;
    end;

  //2013.11. Add 파라미터와 비교하여 암호 다르면 접속 막음.
  FM_Tmax := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := TMaxSession;
  if FM_Tmax.PassWordChk(Hinsa_Param(cmdline,1), Hinsa_Param(cmdline,3)) = 0 then
    Application.Terminate;
  ///////////////////////////////////////////////////////////////////////

  SB_help.Panels[1].Text := '';

  Application.ProcessMessages;
  GSempno   := Hinsa_Param(cmdLine,1);
  GSkorname := Hinsa_Param(cmdLine,2);
  GSpass    := Hinsa_Param(cmdLine,3);
  GSgrade   := Hinsa_Param(cmdLine,4);

  (*2017.03.16.hjku.. 접속권한 체크 해제 요청.. 전지영M
  if (Copy(GSgrade,3,1) > 'C') then
  begin
  {2017.01.10.hjku.. J사번 정규직 사번 전환 관련 추가.. 안효상M
      if (GSempno[1] in ['P','Q','Y','J']) then
      begin
          ShowMessage('접속할 권한이 없습니다. 프로그램을 종료합니다.');
          Application.Terminate;
          Exit;
      end;
  *}
    emptype := '';
    TDS1.Close;
    TDS1.ServiceName := 'HINSA_select';
    TDS1.Sql.Text    := 'SELECT decode(substr('''+GSempno+''',1,1),''D'',''D'',FINDHIRE('''+GSempno+''')), ''Value2'', ''value3'','+
                        '       ''Value4'', ''Field5''                           '+
                        '  from dual                                             ';
    TDS1.ClearFieldInfo;
    TDS1.AddField('Value1' , ftString, 100);
    TDS1.AddField('Value2' , ftString, 100);
    TDS1.AddField('Value3' , ftString, 100);
    TDS1.AddField('Value4' , ftString, 100);
    TDS1.AddField('field5' , ftString, 100);
    TDS1.Open;
    emptype := TDS1.FieldByName('Value1').AsString;


    if (emptype[1] in ['P','Q','Y','J']) then
    begin
      //2017.03.13.hjku.. 인상규(2927)M 권한 추가.. 전지영M 요청
      if(GSempno<>'2927') then
      begin
        ShowMessage('접속할 권한이 없습니다. 프로그램을 종료합니다.');
        Application.Terminate;
        Exit;
      end;
    end;
  end;
  *)

  PL_InitJob;
    //Retrieve;

end;

end.

