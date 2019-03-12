unit UUPMAIN;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, pegradpanl, peoutlookbtn, PeJeonLabel, StdCtrls, Db, DbTables,
  Mask, pebtnedit, Grids, DBGrids, pedbgrid, DBCGrids, DBCtrls, pedbutil, hanapass,
  pereg, jeonPan, NotesHana_TLB,OnInsaCommon, OnEditBaseCtrl,
  OnEditStdCtrl, OnEditNumCtl, Tmax_DataSetText, Buttons, OnScheme,
  OnGrDBGrid, TmaxFunc, OnShapeLabel, OnFocusButton;//, DBGridEx;

type
  TFUPMain = class(TForm)
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    Bt_Mod: TPeJeonOutLookBtn;
    Panel1: TPanel;
    Label1: TLabel;
    L_Name: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    sGrid1: TStringGrid;
    DataSource1: TDataSource;
    Query1: TTMaxDataSet;
    Query2: TTMaxDataSet;
    L_eempno: TOnShapeLabel;
    GroupBox1: TGroupBox;
    B_Exit: TOnFocusButton;
    P_Pe: TOnFocusButton;
    OnSchemeForm1: TOnSchemeForm;
    SuperUser: TGroupBox;
    OnShapeLabel1: TOnShapeLabel;
    BT_Sel: TOnFocusButton;
    ED_CN: TEdit;
    Edit1: TEdit;
    procedure FormShow(Sender: TObject);
    procedure P_PeClick(Sender: TObject);
    procedure B_ExitClick(Sender: TObject);
    procedure Bt_ModClick(Sender: TObject);
    procedure sGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure BT_SelClick(Sender: TObject);
    procedure Grid_Data;
    procedure sGrid1Click(Sender: TObject);


  private
    { Private declarations }
    function  Csel_gfd(p_loc: Integer): String;
  public
    { Public declarations }
    Running : Boolean;
    Pempno, Pkorname, Password, Ppermission: string;
    CompIp: String;
    Form_Gubun : Integer;
    vRabasdate    : String;
    var_orgnum   : String;
    var_CanYN    : String;
    CDS_Pmax : String;
    CDS_Prfd : String;
    CDS_Psfd : array of String;
    vevcno, vvalconyn, vabconyn, vbeconyn, vduconyn : String;
    vempno, vkname, vppaycl, vppayraname, vLjobkind, vLMerit, vLdeMerit, sCynYN, SqlText, ParamVariant : String;
  end;
type
TstCellObj = packed record
  case Integer of
  0 : ( Num      : Integer);
  1 : ( Sender   : TObject);
end;
var
  FUPMain: TFUPMain;

  workemp1   : String;
  workemp2   : String;
  workemp3   : String;
  workemp4   : String;
  workemp5   : String;

implementation

uses
  Hinsa_TmaxDM, UColForm;

{$R *.DFM}

procedure TFUPMain.FormShow(Sender: TObject);
var
  Arr_Cnt : integer;
var
  msg, ParamVariant : String;
begin
  if Running then  System.Exit;
  Running := True;

  Pempno   := Hinsa_Param(CmdLine, 1);
  Pkorname := Hinsa_Param(CmdLine, 2);
  Password := Hinsa_Param(CmdLine, 3);
  Ppermission := copy(Hinsa_Param(CmdLine,4),1,1);
  CompIp := Hinsa_Param(CmdLine, 5);
  CompIp := Copy(CompIp, 2, Length(CompIp) - 1);

  msg := DataModule_Tmax.Connect_Session;
  if msg <> '' then
  begin
    Application.MessageBox(PChar(msg),'에러',mb_ok);
    Application.Terminate;
    Exit;
  end;

  Application.ProcessMessages;

  // 평가기준일, 차수을 읽어온다
  ParamVariant := 'SELECT Value1||'';''||Value2 FROM pehabas ' +
                  ' WHERE rabasdate = ''00000000'' ' +
                  '   AND gubun     = ''00''   ' +
                  '   AND sgubun    = ''0001'' ';

  DataModule_Tmax.Csel_SQL := ParamVariant;
  DataModule_Tmax.Csel_Open;

  vRabasdate   := DataModule_Tmax.Csel_gfd(1);
  var_orgnum   := DataModule_Tmax.Csel_gfd(2);

  vRabasdate   := '20141130';
  var_orgnum   := 'H19';

  // 평가담당자를 읽어온다
  ParamVariant := 'select Value1|| '';'' ||Value2||'';''|| Value3 ' +
                  '             || '';'' ||Value4||'';''|| Value5 ' +
                  '  FROM pehrebas                                ' +
                  ' WHERE rabasdate = '''+vRabasdate+'''          ' +
                  '   AND gubun     = ''11''                      ' +
                  '   AND sgubun    = ''0005'' ';

  DataModule_Tmax.Csel_SQL := ParamVariant;
  DataModule_Tmax.Csel_Open;

  workemp1 := DataModule_Tmax.Csel_gfd(1);
  workemp2 := DataModule_Tmax.Csel_gfd(2);
  workemp3 := DataModule_Tmax.Csel_gfd(3);
  workemp4 := DataModule_Tmax.Csel_gfd(4);
  workemp5 := DataModule_Tmax.Csel_gfd(5);

  //동료평가대상 여부
  ParamVariant := 'SELECT cyn FROM pehamas                ' +
                  '  WHERE rabasdate = '''+vRabasdate+''' ' +
                  '    AND EMPNO     = '''+Pempno+''' ' ;

  DataModule_Tmax.Csel_SQL := ParamVariant;
  DataModule_Tmax.Csel_Open;
  sCynYN   := DataModule_Tmax.Csel_gfd(1);

  //동료평가 지정 건수
  ParamVariant := 'SELECT COUNT(*) cnt FROM PESMCS        ' +
                  '  WHERE rabasdate = '''+vRabasdate+''' ' +
                  '    AND EEMPNO    = '''+Pempno+''' ' +
                  '    AND APPROVAL  = ''Y'' ' ;

  DataModule_Tmax.Csel_SQL := ParamVariant;
  DataModule_Tmax.Csel_Open;
  Arr_Cnt   := StrToInt(DataModule_Tmax.Csel_gfd(1));

  SuperUser.visible := False;
  
  if Not((Hinsa_Param(CmdLine, 1) =workemp1) or (Hinsa_Param(CmdLine, 1) = workemp2) or
         (Hinsa_Param(CmdLine, 1) =workemp3) or (Hinsa_Param(CmdLine, 1) = workemp4) or
         (Hinsa_Param(CmdLine, 1) =workemp5) or (copy(Hinsa_Param(CmdLine, 1),1,1) = 'D')) then
  begin
    if sCynYN <> 'Y' then
    begin
      Messagedlg('귀하는 작업권한이 없습니다. 프로그램을 종료합니다.!'+#13+#13+
                 '관리자에게 문의 하십시오!'+#13
                 ,mtError,[mbOK],0);
      Application.Terminate;
      Exit;
    end;
    if Arr_Cnt < 0 Then
    begin
      Messagedlg('지정된 동료평가 대상자가 없습니다. 프로그램을 종료합니다.!'+#13+#13+
                 '관리자에게 문의 하십시오!'+#13 ,mtError,[mbOK],0);
      Application.Terminate;
      Exit;
    end;
  End
  Else SuperUser.visible := True;

  L_eempno.ValueCaption  := Pkorname + ' ('+Pempno+')';
  L_Name.Caption := Pkorname;
  ED_CN.Text := Pempno;
  Grid_Data;
  //BT_SelClick(Sender);
end;

procedure TFUPMain.BT_SelClick(Sender: TObject);
begin
  Pempno  := ED_CN.Text;

  ParamVariant := 'SELECT Korname FROM pimpmas ' +
                  ' WHERE empno = ''' + Pempno +''' ';

  DataModule_Tmax.Csel_SQL := ParamVariant;
  DataModule_Tmax.Csel_Open;

  Pkorname := DataModule_Tmax.Csel_gfd(1);

  L_eempno.ValueCaption  := Pkorname + ' ('+Pempno+')';
  L_Name.Caption := Pkorname;
  Grid_Data;
end;

procedure TFUPMain.Grid_Data;
var
  SqlText : String;
  i : integer;
  CelObj: TstCellObj;
begin
  sGrid1.Cells[1,0]  := ' 사번';
  sGrid1.Cells[2,0]  := ' 성명';
  sGrid1.Cells[3,0]  := ' 직책';
  sGrid1.Cells[4,0]  := ' 소   속';
  sGrid1.Cells[5,0]  := ' 완료여부';
  sGrid1.Cells[6,0]  := ' 공통역량';
  sGrid1.Cells[7,0]  := ' 리더십역량';
  sGrid1.Cells[8,0]  := ' 직무역량';

  sGrid1.ColWidths[1] := 144;
  sGrid1.ColWidths[2] := 144;
  sGrid1.ColWidths[3] := 144;
  sGrid1.ColWidths[4] := 144;
  sGrid1.ColWidths[5] := 144;

  sGrid1.ColWidths[6] := -1;
  sGrid1.ColWidths[7] := -1;
  sGrid1.ColWidths[8] := -1;
  sGrid1.ColWidths[9] := -1;

  SqlText :=
            Format('SELECT nvl(        empno      ,'' '')||'';''||                                      '+  #13 +
                   '       nvl(        korname    ,'' '')||'';''||                                      '+  #13 +
                   '       nvl(        paycl      ,'' '')||'';''||                                      '+  #13 +
                   '       nvl(        payclname  ,'' '')||'';''||                                      '+  #13 +
                   '       nvl(        payraname  ,'' '')||'';''||                                      '+  #13 +
                   '       nvl(        deptname   ,'' '')||'';''||                                      '+  #13 +
                   '       nvl(        valconyn   ,'' '')||'';''||                                      '+  #13 +
                   '       nvl(        abconyn    ,'' '')||'';''||                                      '+  #13 +
                   '       nvl(        beconyn    ,'' '')||'';''||                                      '+  #13 +
                   '       nvl(        duconyn    ,'' '')||'';''||                                      '+  #13 +
                   '       nvl(        to_char(evcno)    ,'' '')||'';''||                               '+  #13 +
                   '       nvl(        jobkind    ,'' '')                                               '+  #13 +
                   '  FROM (select a.empno, b.korname, a.paycl, d.codename payclname,                   '+  #13 +
                   '               e.codename payraname,                                                '+  #13 +
                   '               (select deptname||'' ''||deptna3 deptname                            '+  #13 +
                   '                  from pycdept where orgnum = ''%s''                                '+  #13 +
                   '                                 and deptcode=b.deptcode) deptname,                 '+  #13 +
                   '               a.abconyn, a.beconyn,                                                '+  #13 +
                   '               a.duconyn, a.valconyn,                                               '+  #13 +
                   '               a.merit,   a.demerit,  b.evcno, b.jobkind                            '+  #13 +
                   '          from pesmcs a, pehamas b, pimpmas f,                                      '+  #13 +
                   '               (select codename, codeno                                             '+  #13 +
                   '                  from pyccode where codeid = ''I112'') d,                          '+  #13 +
                   '               (select codename, codeno                                             '+  #13 +
                   '                  from pyccode where codeid = ''I113'') e                           '+  #13 +
                   '         where a.rabasdate = ''%s''                                                 '+  #13 +
(* 동료평가 대상자를 팀장이 직접 지정하므로 삭제함. 2014.11.04 By HeeYong
                   '           and b.empno in (select empno                                             '+  #13 +
                   '                             from pehamas                                           '+  #13 +
                   '                            where ( rabasdate, colorgnum, substr(coldept,1,4), colgroup ) in   ' +  #13 +
                   '                                  ( select rabasdate, colorgnum, substr(coldept,1,4), colgroup ' +  #13 +
                   '                                      from pehamas                                  '+  #13 +
                   '                                     where rabasdate = ''%s''                       '+  #13 +
                   '                                       and empno = ''%s'')                          '+  #13 +
                   '                              and empno <> ''%s'')                                  '+  #13 +
*)
                   '           and a.rabasdate = b.rabasdate                                            '+  #13 +
                   '           and a.empno     = b.empno                                                '+  #13 +
                   '           and a.empno     = f.empno                                                '+  #13 +
                   '           and a.eempno    = ''%s''                                                 '+  #13 +
                   '           and f.pstate    < ''80''                                                 '+  #13 +
                   '           and b.cyn       = ''Y''                                                  '+  #13 +
                   '           and b.paycl     = d.codeno (+)                                           '+  #13 +
                   '           and b.payra     = e.codeno (+) )                                         ',
//                   [var_orgnum, vRabasdate, vRabasdate, Pempno, Pempno, Pempno]);
                   [var_orgnum, vRabasdate, Pempno]);

  with Query1 do
  begin
    Close;
    ServiceName := 'PEA1060A_common';
    ClearFieldInfo;
    AddField('SEL_DATA', ftString, 300);
    ClearParamInfo;
    SQL.Text   := SqlText;

    edit1.text :=  SqlText;
    Open;

(*
      1    2      3   4  5    6      7 8 9 10 11 12
      0577;안효상;D31;L1;팀원;HR팀  ;N;N;N;N ;1 ;11170
*)
    if RecordCount > 0 then
    begin
      sGrid1.RowCount := RecordCount +1;
      for i := 1 to sGrid1.RowCount do
      begin
        sGrid1.Cells[1, i] :=  Csel_gfd(1);  //사번
        sGrid1.Cells[2, i] :=  Csel_gfd(2);  //성명
        sGrid1.Cells[3, i] :=  Csel_gfd(5);  //직책
        sGrid1.Cells[4, i] :=  Csel_gfd(6);  //소   속
        sGrid1.Cells[5, i] :=  Csel_gfd(7);  //Values (Values역량)
        sGrid1.Cells[6, i] :=  Csel_gfd(8);  //abconyn(공통역량)
        sGrid1.Cells[7, i] :=  Csel_gfd(9);  //beconyn(리더십역량)
        sGrid1.Cells[8, i] :=  Csel_gfd(10); //duconyn(직무역량)
        sGrid1.Cells[9 ,i] :=  Csel_gfd(3);  //paycl
        sGrid1.Cells[10,i] :=  Csel_gfd(4);  //payclname
        sGrid1.Cells[11,i] :=  Csel_gfd(11); //evcno
        sGrid1.Cells[12,i] :=  Csel_gfd(12); //jobkind

        next;
      end;
      P_Pe.Enabled   := True;
      sGrid1.Enabled := True;
      sGrid1Click(Self);
    end
    Else
    Begin
      P_Pe.Enabled   := False;
      sGrid1.Enabled := False;
    End;
    close;
  end;
end;

procedure DrawCheck(DC:HDC;BBRect:TRect;bCheck:Boolean);
begin
  if bCheck then
  Begin
    DrawFrameControl(DC, BBRect, DFC_BUTTON, DFCS_BUTTONCHECK + DFCS_CHECKED)
  End
  else
    DrawFrameControl(DC, BBRect, DFC_BUTTON, DFCS_BUTTONCHECK);
end;

procedure TFUPMain.P_PeClick(Sender: TObject);
var
  SqlText : String;
begin
  with Query1 do
  begin
    if   ((vevcno = '1') and (vabconyn  = 'Y') and (vbeconyn  = 'Y') and (vduconyn  = 'Y'))
      or ((vevcno = '2') and (vabconyn  = 'Y') and (vduconyn  = 'Y'))
      or ((vevcno = '3') and (vabconyn  = 'Y') and (vbeconyn  = 'Y'))
    then
    begin
      MessageBox(handle,'이미 평가하신 사원입니다.','평가선정오류',MB_ICONWARNING);
      Exit;
    end;

    ColForm := TColForm.Create(nil); // 동료평가
    try
      with ColForm do
      begin
        Pempno        := self.Pempno      ;
        Pkorname      := self.Pkorname    ;
        Password      := self.Password    ;
        Ppermission   := self.Ppermission ;
        CompIp        := self.CompIp;

        vRabasdate    := self.vRabasdate;

        empno         := self.vempno;
        kname         := self.vkname;
        ppaycl        := self.vppaycl;
        ppayraname    := self.vppayraname;
        Ljobkind      := self.vLjobkind;

        if vabconyn = 'Y' then Hint := 'Y'
        else                   Hint := 'N';

        if vbeconyn = 'Y' then Hint := Hint + 'Y'
        else                   Hint := Hint + 'N';

        if vduconyn = 'Y' then Hint := Hint + 'Y'
        else                   Hint := Hint + 'N';
        ShowModal;

        if ON_Confirm then  Grid_Data;
      end;
    finally
      ColForm.Free;
    end;
  end;
end;



procedure TFUPMain.Bt_ModClick(Sender: TObject);
var i : integer;
    sqltext : string;
    ss :  string;
begin
  with sGrid1 do
   begin
   //동료평가 반영여부.
      for i := 1 to RowCount -1 do
      begin
        ss :=  trim(Cells[14,i])+'   '+ trim(Cells[1,i]);
        SqlText := ' UPDATE PESMCS SET ' +
                   '   CHKYN         = '''+trim(Cells[14,i])+''',  ' +
                   '   WRITEEMP      = '''+ Pempno+''',  ' +
                   '   WRITETIME     = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'') ' +
                   ' WHERE rabasdate = '''+vRabasdate+''' ' +
                   '   AND empno     = '''+trim(Cells[1,i])+''' ' +
                   '   AND eempno    = '''+Pempno+''' ' ;

        If      (sGrid1.Cells[12,i] = '1') Then
          Sqltext := Sqltext + ' And abconyn||beconyn||duconyn <> ''YYY'' '
        Else If (sGrid1.Cells[12,i] = '2') Then
          Sqltext := Sqltext + ' And abconyn||duconyn <> ''YY'' '
        Else
          Sqltext := Sqltext + ' And abconyn||beconyn <> ''YY'' ';

        DataModule_Tmax.Cupd_SQL  := Sqltext;
        DataModule_Tmax.Cupd_Exec;
        if not DataModule_Tmax.Cupd_ret then
        begin
           Messagedlg('APP-Server Error',mtError,[mbOK],0);
           Exit;
        End;
      end;
   end;
   showmessage('팀원 평가여부를 등록하였습니다.');
   Grid_Data;

end;

procedure TFUPMain.sGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  Loc : Cardinal;
begin
  with sGrid1.Canvas do
  begin
    if (ARow = 0) then Font.Style := [fsBold]
    else               Font.Style := [];

    FillRect(Rect);
    Rect.Top   := Rect.Top + 4;

    Loc := DT_CENTER;
    DrawText(Handle, PChar(sGrid1.Cells[ACol, ARow]), -1, Rect, Loc);
  end;
end;

function TFUPMain.Csel_gfd(p_loc: Integer): String;
var
  v_cnt, v_tmp: Integer;
  v_data: String;
begin
  Result := '';
  v_data := Query1.FieldByName('SEL_DATA').AsString;
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

procedure TFUPMain.B_ExitClick(Sender: TObject);
begin
  Close;
end;


procedure TFUPMain.sGrid1Click(Sender: TObject);
var
  pt: TPoint;
  ACol,ARow: Integer;
begin
  sGrid1.MouseToCell(pt.x,pt.y,ACol,ARow);

  WITH sGrid1 DO
  BEGIN
    vevcno      := Cells[11,ROW];
    vvalconyn   := Cells[5 ,ROW];
    vabconyn    := Cells[6 ,ROW];
    vbeconyn    := Cells[7, ROW];
    vduconyn    := Cells[8 ,ROW];
    vempno      := Cells[1, ROW];
    vkname      := Cells[2, ROW];
    vppaycl     := Cells[9, ROW];
    vppayraname := Cells[10,ROW];
    vLjobkind   := Cells[12,ROW];
  END;
end;

end.
