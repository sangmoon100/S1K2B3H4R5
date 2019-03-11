unit UUPMAIN;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, pegradpanl, peoutlookbtn, PeJeonLabel, StdCtrls, Db, DbTables,
  Mask, pebtnedit, Grids, DBGrids, pedbgrid, DBCGrids, DBCtrls, pedbutil, hanapass,
  pereg, jeonPan, NotesHana_TLB,OnInsaCommon, OnEditBaseCtrl,
  OnEditStdCtrl, OnEditNumCtl, Tmax_DataSetText, Buttons, OnScheme,
  OnGrDBGrid, TmaxFunc;//, DBGridEx;

type
  TFUPMain = class(TForm)
    OnSchemeForm1: TOnSchemeForm;
    P_Pe: TPeJeonOutLookBtn;
    B_Exit: TPeJeonOutLookBtn;
    L_eempno: TPePanelEdit;
    Panel1: TPanel;
    L_Name: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Panel2: TPanel;
    Label3: TLabel;
    DataSource1: TDataSource;
    Query1: TTMaxDataSet;
    sGrid1: TStringGrid;
    Bt_Srh: TPeJeonOutLookBtn;
    Query2: TTMaxDataSet;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure Bt_SrhClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sGrid1Click(Sender: TObject);
    procedure B_ExitClick(Sender: TObject);
    procedure P_PeClick(Sender: TObject);

  private
    { Private declarations }
    function  Csel_gfd(p_loc: Integer): String;
  public
    { Public declarations }
    OnShow_1, OnShow_2, Running : Boolean;
    Pempno, Pkorname, Password, Ppermission: string;
    CompIp: String;
    Form_Gubun : Integer;
    vRabasdate    : String;
    var_orgnum   : String;
    var_CanYN    : String;
    Mdeptname    : String;
    CDS_Pmax : String;
    CDS_Prfd : String;
    CDS_Psfd : array of String;
    vevcno, vvalconyn, vabconyn, vbeconyn, vduconyn : String;
    vempno, vkname, vppaycl, vppayraname, vLjobkind, vLMerit, vLdeMerit, vCHKYN : String;
  end;
type
TstCellObj = packed record
  case Integer of
  0 : ( Num      : Integer);
  1 : ( Sender   : TObject);
end;
var
  FUPMain: TFUPMain;

implementation

uses
  Hinsa_TmaxDM, UColForm;

{$R *.DFM}


procedure DrawCheck(DC:HDC;BBRect:TRect;bCheck:Boolean);
begin
  if bCheck then
  Begin
    DrawFrameControl(DC, BBRect, DFC_BUTTON, DFCS_BUTTONCHECK + DFCS_CHECKED)
  End
  else
    DrawFrameControl(DC, BBRect, DFC_BUTTON, DFCS_BUTTONCHECK);
end;


procedure TFUPMain.FormActivate(Sender: TObject);
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

  //2013.11. Add 파라미터와 비교하여 암호 다르면 접속 막음.
  FM_Tmax := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := DataModule_Tmax.TMaxSession;
  if FM_Tmax.PassWordChk(Hinsa_Param(cmdline,1), Hinsa_Param(cmdline,3)) = 0 then
    Application.Terminate;

  Application.ProcessMessages;
  //현평가 기준일
  ParamVariant := 'SELECT Value1  ' +
                  '  FROM pehabas ' +
                  ' WHERE rabasdate = ''00000000'' ' +
                  '   AND gubun     = ''00'' ' +
                  '   AND sgubun    = ''0001'' ';

  DataModule_Tmax.Csel_SQL := ParamVariant;
  DataModule_Tmax.Csel_Open;
  if not DataModule_Tmax.Csel_ret then
  begin
    Messagedlg('APP-Server Error',mtError,[mbOK],0);
    Exit;
  end;
  vRabasdate := DataModule_Tmax.Csel_gfd(1);

//  vRabasdate := '20131130';
  //인사팀 부서명
  ParamVariant := 'SELECT Value2  ' +
                  '  FROM pimvari ' +
                  ' WHERE gubun     = ''R0'' ' +
                  '   AND sgubun    = ''0001'' ';

  DataModule_Tmax.Csel_SQL := ParamVariant;
  DataModule_Tmax.Csel_Open;
  if not DataModule_Tmax.Csel_ret then
  begin
    Messagedlg('APP-Server Error',mtError,[mbOK],0);
    Exit;
  end;
  Mdeptname := DataModule_Tmax.Csel_gfd(1);

{
  //동료평가 가능여부 확인
  ParamVariant := 'SELECT Value9  ' +
                  '  FROM pehabas ' +
                  ' WHERE rabasdate = '''+vRabasdate+''' ' +
                  '   AND gubun     = ''11'' ' +
                  '   AND sgubun    = ''0001'' ';
  DataModule_Tmax.Csel_SQL := ParamVariant;
  DataModule_Tmax.Csel_Open;
  if not DataModule_Tmax.Csel_ret then
  begin
    Messagedlg('APP-Server Error',mtError,[mbOK],0);
    Exit;
  end;

  var_CanYN := DataModule_Tmax.Csel_gfd(1);
  if var_CanYN <> 'Y' then
  begin
    Messagedlg('동료평가점수 입력기간이 끝났습니다!'+#13+#13+
               Mdeptname+'에 문의 하십시오!'+#13
               ,mtError,[mbOK],0);
    close;
//    Exit;
  end;
}
  ParamVariant := 'SELECT Value2  ' +
                  '  FROM pehabas ' +
                  ' WHERE rabasdate = ''00000000'' ' +
                  '   AND gubun     = ''00'' ' +
                  '   AND sgubun    = ''0001'' ';
  DataModule_Tmax.Csel_SQL := ParamVariant;
  DataModule_Tmax.Csel_Open;

  if not DataModule_Tmax.Csel_ret then
  begin
    Messagedlg('APP-Server Error',mtError,[mbOK],0);
    Exit;
  end;
  var_orgnum := DataModule_Tmax.Csel_gfd(1);


   //평가담당자 불러오기
   ParamVariant := 'SELECT  Value1, Value2, Value3, Value4, Value5  ' +
                   '  FROM pehrebas                                 ' +
                   ' WHERE rabasdate = '''+vRabasdate+'''           ' +
                   '   AND gubun     = ''11''                       ' +
                   '   AND sgubun    = ''0005''                     ';
  DataModule_Tmax.Csel_SQL := ParamVariant;
  DataModule_Tmax.Csel_Open;

  if (copy(Pempno,1,1)='D') then Pempno := DataModule_Tmax.Csel_gfd(1); //개발자 실행시 담당자 사번으로 인식되도록.

  Bt_SrhClick(Sender);
  L_eempno.Text := Pkorname + ' ('+Pempno+')';
  L_Name.Caption := Pkorname;
end;

procedure TFUPMain.Bt_SrhClick(Sender: TObject);
var
  SqlText : String;
  i : integer;
  CelObj: TstCellObj;
begin

  SqlText := Format('SELECT nvl(A.EMPNO                     ,'' '')||'';''||                 ' +#13
                  + '       nvl(A.KORNAME                   ,'' '')||'';''||                 ' +#13
                  + '       nvl(F.CODENAME                  ,'' '')||'';''||                 ' +#13
                  + '       nvl(C.DEPTNAME                  ,'' '')||'';''||                 ' +#13
                  + '       nvl(A.CONYN                     ,'' '')||'';''||                 ' +#13
                  + '       nvl(A.PAYCL                     ,'' '')||'';''||                 ' +#13
                  + '       nvl(E.CODENAME                  ,'' '')||'';''||                 ' +#13
                  + '       nvl(G.CODENAME                  ,'' '')||'';''||                 ' +#13
                  + '       nvl(D.DUTYKINDNAME              ,'' '')||'';''||                 ' +#13
                  + '       nvl(B.PAYCLDATE                 ,'' '')||'';''||                 ' +#13
                  + '       nvl(B.ORGEMPDATE                ,'' '')||'';''||                 ' +#13
                  + '       nvl(A.E1EMPNO                   ,'' '')                          ' +#13
                  + '  FROM PEMRDMAS A                                                       ' +#13
                  + '     , PIMPMAS B                                                        ' +#13
                  + '     , PYCDEPT C                                                        ' +#13
                  + '     , PISHRDUKIND D                                                    ' +#13
                  + '     ,(SELECT CODENAME, CODENO FROM PYCCODE WHERE CODEID = ''I112'') E  ' +#13
                  + '     ,(SELECT CODENAME, CODENO FROM PYCCODE WHERE CODEID = ''I113'') F  ' +#13
                  + '     ,(SELECT CODENAME, CODENO FROM PYCCODE WHERE CODEID = ''I115'') G  ' +#13
                  + ' WHERE A.EMPNO     = B.EMPNO                                            ' +#13
                  + '   AND A.DEPTCODE  = C.DEPTCODE(+)                                      ' +#13
                  + '   AND B.JOBKIND   = D.DUTYKIND(+)                                      ' +#13
                  + '   AND A.PAYCL     = E.CODENO(+)                                        ' +#13
                  + '   AND B.PAYRA     = F.CODENO(+)                                        ' +#13
                  + '   AND B.JOBGUN    = G.CODENO(+)                                        ' +#13
                  + '   AND A.RABASDATE = ''%S''                                             ' +#13
                  + '   AND A.E1EMPNO   = ''%S''                                             ' ,
                    [ vRabasdate, Pempno]                                                    );

  with Query1 do
  begin
    Close;
    ServiceName := 'PEA1060A_common';
    ClearFieldInfo;
    AddField('SEL_DATA', ftString, 300);
    ClearParamInfo;
    SQL.Text   := SqlText;
    Open;

    //showmessage(intTostr(RecordCount));
    if RecordCount > 0 then
    begin
      sGrid1.RowCount := RecordCount +1;
      for i := 1 to sGrid1.RowCount do
      begin
        sGrid1.Cells[1, i] :=  Csel_gfd(1);  //사번
        sGrid1.Cells[2, i] :=  Csel_gfd(2);  //성명
        sGrid1.Cells[3, i] :=  Csel_gfd(3);  //직책
        sGrid1.Cells[4, i] :=  Csel_gfd(4);  //소   속
        sGrid1.Cells[5, i] :=  Csel_gfd(5);  //평가여부
        sGrid1.Cells[6, i] :=  Csel_gfd(6);  //직급코드
        sGrid1.Cells[7, i] :=  Csel_gfd(7);  //직급
        sGrid1.Cells[8, i] :=  Csel_gfd(8);  //직종일
        sGrid1.Cells[9, i] :=  Csel_gfd(9);  //직급일
        sGrid1.Cells[10,i] :=  Csel_gfd(10); //최초입사일
        sGrid1.Cells[11,i] :=  Csel_gfd(11); //평가자사번
        next;
      end;
    end;
    close;
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

procedure TFUPMain.FormShow(Sender: TObject);
var
  SqlText : String;
begin
  sGrid1.Cells[1,0]  := ' 사번';
  sGrid1.Cells[2,0]  := ' 성명';
  sGrid1.Cells[3,0]  := ' 직책';
  sGrid1.Cells[4,0]  := ' 소   속';
  sGrid1.Cells[5,0]  := ' 평가여부';
  //sGrid1.Cells[6,0]  := ' 공통역량';
  //sGrid1.Cells[7,0]  := ' 리더십역량';
  //sGrid1.Cells[8,0]  := ' 직무역량';
  //sGrid1.Cells[9,0]  := ' 평가여부';
end;

procedure TFUPMain.sGrid1Click(Sender: TObject);
begin

  with sGrid1 do
  begin
    //vevcno      := Cells[12,Row];
    vvalconyn   := Cells[5 ,Row];
    //vabconyn    := Cells[6 ,Row];
    //vbeconyn    := Cells[7, Row];
    //vduconyn    := Cells[8, Row];
    vempno      := Cells[1, Row];
    //vkname      := Cells[2, Row];
    //vppaycl     := Cells[10,Row];
    //vppayraname := Cells[11,Row];
    //vLjobkind   := Cells[13,Row];
  end;
end;

procedure TFUPMain.B_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TFUPMain.P_PeClick(Sender: TObject);
var
  SqlText : String;
begin

  with Query1 do
  begin

{    if   ((vevcno = '1') and (vabconyn  = 'Y') and (vbeconyn  = 'Y') and (vduconyn  = 'Y'))
      or ((vevcno = '2') and (vabconyn  = 'Y') and (vduconyn  = 'Y'))
      or ((vevcno = '3') and (vabconyn  = 'Y') and (vbeconyn  = 'Y'))
}
    if vvalconyn = 'Y' then
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

        if ON_Confirm then   Bt_SrhClick(Sender);
      end;
    finally
      ColForm.Free;
    end;
  end;
end;

end.
