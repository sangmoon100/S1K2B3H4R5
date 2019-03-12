{ ----------------------------------------------------------------------------
  PROGRAM-NAME    : PZC1021A(부서 코드 관리)
  SYSTEM-NAME     : 종합인사정보
  SUBSYSTEM-NAME  : 인사
  Programmer      : 서혜미
  Version         : 1.00
  Date            : 2001.01. 19
  Update Contents
    버전     수정일       수정자      관련근거        수정내용
    1.00     2001.01.30.  서혜미                      저장후 Locate
   40.00     2003.12.12.  유효성      종합인사 개선작업
---------------------------------------------------------------------------}

unit PZC10211;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ComCtrls, Db, Tmax_DataSetText, OnLineLabel,
  OnEditBaseCtrl, OnEditStdCtrl, Grids, DBGrids, OnGrDBGrid, OnShapeLabel,
  Mask, OnInsaCommon, OnFocusButton, Comobj, OnScheme, Tmax_session, TmaxFunc;

type
  TDeptForm = class(TForm)
    Panel1: TPanel;
    E_SERdeptname: TOnEdit;
    E_SERdeptcode: TOnEdit;
    E_SERorgnum: TOnEdit;
    OnShapeLabel1: TOnShapeLabel;
    OnShapeLabel2: TOnShapeLabel;
    OnShapeLabel3: TOnShapeLabel;
    DBG_user: TOnGrDbGrid;
    DBGrid1: TOnGrDbGrid;
    E_orgnum: TOnEdit;
    E_deptcode: TOnEdit;
    E_deptna1: TOnEdit;
    E_deptna2: TOnEdit;
    E_deptna3: TOnEdit;
    E_DeptFunc: TOnEdit;
    E_Chanmode: TOnEdit;
    E_fincode: TOnEdit;
    E_deptcodeFROM: TOnEdit;
    E_deptcodeTO: TOnEdit;
    ME_reorgdate : TOnMaskEdit;
    ME_chandate  : TOnMaskEdit;
    ME_closedate : TOnMaskEdit;
    Label2: TLabel;
    OnShapeLabel6: TOnShapeLabel;
    Dept: TTMaxDataSet;
    TDS_sel1: TTMaxDataSet;
    Dept_noFin: TTMaxDataSet;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    TDS_dml: TTMaxDataSet;
    BB_save: TOnFocusButton;
    BB_cancel: TOnFocusButton;
    BB_print: TOnFocusButton;
    BB_excel: TOnFocusButton;
    E_Porgnum: TOnEdit;
    SF_Main: TOnSchemeForm;
    StatusBar1: TStatusBar;
    BB_close: TOnFocusButton;
    Shape2: TShape;
    TMaxSession: TTMaxSession;
    OnShapeLabel4: TOnShapeLabel;
    E_Empty_fincode: TOnEdit;
    E_Retire_fincode: TOnEdit;
    sap_fincode: TTMaxDataSet;
    procedure E_SERorgnumKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure BB_saveClick(Sender: TObject);
    procedure BB_cancelClick(Sender: TObject);
    procedure BB_printClick(Sender: TObject);
    procedure BB_excelClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure BB_closeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
    pempno, pkorname, pClass : string;
    LastOrgnum, LastDeptcode: string; {조직차수+부서코드}
    OPstate      : Integer;           {0:비어있는상태, 1:입력상태, 2:열람상태}
    EMPTY_FINCODE, RETIRE_FINCODE : String;
    procedure Retrieve;
    function  RemoveSpecialChar(sSrc: string): string;    
  end;

var
  DeptForm: TDeptForm;

implementation

uses PZC10212;

{$R *.DFM}

procedure TDeptForm.FormCreate(Sender: TObject);
var
  sTemp : String;
begin
  Self.OnPaint := Nil;
  SF_Main.Refresh;
  Application.ProcessMessages;
  StatusBar1.Panels[1].Text := '인사시스템에 접속 중입니다...';

  ///////////////////////////////////////////////////////////////////////
  TMaxSession.EnvFileName := GetHomeDir+'\newhana.env';
  TMaxSession.LabelName   := 'HANAROHPER';
  TMaxSession.Connect  := False;
  TMaxSession.Host     := Hinsa_Param(cmdline,10);
  TMaxSession.Port     := '9999';

  try
    TMaxSession.Connect := True;
  except
    Application.MessageBox(PChar('APP서버 접속 실패'),'에러',mb_ok);
    Application.Terminate;
    Exit;
  end;

  //2013.11. Add 파라미터와 비교하여 암호 다르면 접속 막음.
  FM_Tmax := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := TMaxSession;
  if FM_Tmax.PassWordChk(Hinsa_Param(cmdline,1), Hinsa_Param(cmdline,3)) = 0 then
    Application.Terminate;

  pempno   := Hinsa_Param(cmdline, 1);
  pkorname := Hinsa_Param(cmdline, 2);
  pClass   := copy(Hinsa_Param(CmdLine,4),9,1);

  if (pClass = 'A') or (pClass = 'B') or (pClass = 'C') then
  begin
    sTemp := 'select value1 from pimvari where gubun = ''00'' and sgubun = ''0001'' ';
    with TDS_sel1 do
    begin
      ServiceName := 'PZC1021A_common';
      Close;
      Sql.Clear;
      Sql.Add(sTemp);

      ClearFieldInfo;
      AddField('value1',  ftString, 2000 );
      Open;
    end;

    E_SERorgnum.Text    := TDS_sel1.FieldByName('value1').AsString;
    E_Porgnum.Text      := TDS_sel1.FieldByName('value1').AsString;
    LastOrgnum          := '';
    LastDeptcode        := '';
    Retrieve;
  end
  else
  begin
    showmessage('작업 권한이 없습니다!!');
    Close;
  end;

  StatusBar1.Panels[1].Text := '';
end;

procedure TDeptForm.FormPaint(Sender: TObject);
begin
  E_SERorgnum.Setfocus;
end;

procedure TDeptForm.Retrieve;
var
  SearchOptions: TLocateOptions;
  V: Variant;
  sTemp, sTemp1: String;
begin
  OPstate := 2; {열람상태}
  StatusBar1.Panels[1].Text := '해당 코드분류의 자료를 조회하고 있습니다.';
  Application.ProcessMessages;

  sTemp := 'SELECT  nvl(orgnum, '' ''),                  '+#13+
           '        nvl(deptcode, '' ''),                '+#13+
           '        nvl(deptname, '' ''),                '+#13+
           '        nvl(deptna1, '' ''),                 '+#13+
           '        nvl(deptna2, '' ''),                 '+#13+
           '        nvl(deptna3, '' ''),                 '+#13+
           '        nvl(deptabbr, '' ''),                '+#13+
           '        nvl(existon, '' ''),                 '+#13+
           '        nvl(placecode, '' ''),               '+#13+
           '        nvl(deptlevel, '' ''),               '+#13+
           '        nvl(sectcode, '' ''),                '+#13+
           '        nvl(fieldcode, '' ''),               '+#13+
           '        nvl(extcode, '' ''),                 '+#13+
           '        nvl(boncode, '' ''),                 '+#13+
           '        nvl(fincode, '' ''),                 '+#13+
           '        nvl(overmode, '' ''),                '+#13+
           '        nvl(deptfunc, '' ''),                '+#13+
           '        nvl(chanmode, '' ''),                '+#13+
           '        nvl(reorgdate, '' ''),               '+#13+
           '        nvl(chandate, '' ''),                '+#13+
           '        nvl(closedate, '' ''),               '+#13+
           '        nvl(borgnum, '' ''),                 '+#13+
           '        nvl(bdeptcode1, '' ''),              '+#13+
           '        nvl(bdeptcode2, '' ''),              '+#13+
           '        nvl(bdeptcode3, '' ''),              '+#13+
           '        nvl(b.codename, '' '') deptfuncnm,   '+#13+
           '        nvl(c.codename, '' '') chanmodenm    '+#13+
           ' FROM   PYCDEPT A, PYCCODE B, PYCCODE C      '+#13+
           'WHERE   B.CODEID(+) = ''I330''               '+#13+
           '  AND   B.CODENO(+) = A.DEPTFUNC             '+#13+
           '  AND   C.CODEID(+) = ''I170''               '+#13+
           '  AND   C.CODENO(+) = A.CHANMODE             ';


  if E_SERorgnum.Text <> '' then
     sTemp  :=  sTemp +  ' AND  (ORGNUM LIKE '''+E_SERorgnum.Text+'%'+''' ) ';

  if E_SERdeptcode.Text <> '' then
     sTemp :=  sTemp + ' AND  (DEPTCODE LIKE '''+E_SERdeptcode.Text+'%'+''' ) ';

  if trim(E_SERdeptname.Text) <> '' then
     sTemp :=  sTemp + ' AND  (DEPTNAME LIKE '''+'%'+E_SERdeptname.Text+'%'+''' ) ';

  sTemp :=  sTemp + 'AND existon = ''1''   ORDER BY DEPTCODE ';

  With Dept do
  begin
       ServiceName := 'PZC1021A_sel1';
       Close;
       Sql.Clear;
       Sql.Add(sTemp);

       ClearFieldInfo;
       AddField('ORGNUM'       , ftString  ,  3   );
       AddField('DEPTCODE'     , ftString  ,  6   );
       AddField('DEPTNAME'     , ftString  ,  60  );
       AddField('DEPTNA1'      , ftString  ,  30  );
       AddField('DEPTNA2'      , ftString  ,  30  );
       AddField('DEPTNA3'      , ftString  ,  30  );
       AddField('DEPTABBR'     , ftString  ,  30  );
       AddField('EXISTON'      , ftString  ,  1   );
       AddField('PLACECODE'    , ftString  ,  2   );
       AddField('DEPTLEVEL'    , ftString  ,  2   );
       AddField('SECTCODE'     , ftString  ,  3   );
       AddField('FIELDCODE'    , ftString  ,  3   );
       AddField('EXTCODE'      , ftString  ,  6   );
       AddField('BONCODE'      , ftString  ,  6   );
       AddField('FINCODE'      , ftString  ,  6   );
       AddField('OVERMODE'     , ftString  ,  1   );
       AddField('DEPTFUNC'     , ftString  ,  2   );
       AddField('CHANMODE'     , ftString  ,  1   );
       AddField('REORGDATE'    , ftString  ,  8   );
       AddField('CHANDATE'     , ftString  ,  8   );
       AddField('CLOSEDATE'    , ftString  ,  8   );
       AddField('BORGNUM'      , ftString  ,  3   );
       AddField('BDEPTCODE1'   , ftString  ,  6   );
       AddField('BDEPTCODE2'   , ftString  ,  6   );
       AddField('BDEPTCODE3'   , ftString  ,  6   );
       AddField('DEPTFUNCNM'   , ftString  ,  20  );
       AddField('CHANMODENM'   , ftString  ,  20  );
       Open;

       DataSource1.OnDataChange := Nil;
       Dept.FieldByName('ORGNUM').Alignment   := taCenter;
       Dept.FieldByName('DEPTCODE').Alignment := taCenter;
       Dept.FieldByName('DEPTNAME').Alignment := taLeftJustify;
       DataSource1.OnDataChange := DataSource1DataChange;
  end;

  if Dept.RecordCount  < 1 then
  begin
       ShowMessage('해당 코드분류의 자료가 없습니다.');
       StatusBar1.Panels[1].Text := '해당 코드분류의 자료가 없습니다.';
  end
  else
  begin
       if (LastOrgnum <> '') and (LastDeptcode <> '') then
       begin
            V := VarArrayCreate([0,1], varVariant);
            V[0] := LastOrgnum;   //조직차수
            V[1] := LastDeptcode; //부서코드
            SearchOptions := [loPartialKey];
 //             if tuxDM.Dept.Locate('orgnum;deptcode',V, SearchOptions) then
            if Dept.Locate('DEPTCODE',VarArrayOf([LastDeptcode]), SearchOptions) then
              DBG_user.SetFocus;
       end;
       StatusBar1.Panels[1].Text := '해당 코드분류의 자료가 조회되었습니다.';
  end;

////////////////////////////////////////////////////////////////////////////////
   sTemp1:= 'SELECT nvl(orgnum, '' ''),      '+
            '       nvl(deptcode, '' ''),    '+
            '       nvl(deptname, '' ''),    '+
            '       nvl(deptna1, '' ''),     '+
            '       nvl(deptna2, '' ''),     '+
            '       nvl(deptna3, '' ''),     '+
            '       nvl(deptabbr, '' ''),    '+
            '       '' '',                   '+
            '       nvl(placecode, '' ''),   '+
            '       nvl(deptlevel, '' ''),   '+
            '       nvl(sectcode, '' ''),    '+
            '       nvl(fieldcode, '' ''),   '+
            '       nvl(extcode, '' ''),     '+
            '       nvl(boncode, '' ''),     '+
            '       nvl(fincode, '' ''),     '+
            '       nvl(overmode, '' ''),    '+
            '       nvl(deptfunc, '' ''),    '+
            '       nvl(chanmode, '' ''),    '+
            '       nvl(reorgdate, '' ''),   '+
            '       nvl(chandate, '' ''),    '+
            '       nvl(closedate, '' ''),   '+
            '       nvl(borgnum, '' ''),     '+
            '       nvl(bdeptcode1, '' ''),  '+
            '       nvl(bdeptcode2, '' ''),  '+
            '       nvl(bdeptcode3, '' ''),  '+
            '       nvl(b.codename, '' '') deptfuncnm,   '+
            '       nvl(c.codename, '' '') chanmodenm    '+
            '  FROM PYCDEPT A, PYCCODE B, PYCCODE C      '+
            ' WHERE B.CODEID(+) = ''I330''               '+
            '   AND B.CODENO(+) = A.DEPTFUNC             '+
            '   AND C.CODEID(+) = ''I170''               '+
            '   AND C.CODENO(+) = A.CHANMODE             ';

  if E_SERorgnum.Text <> '' then
     sTemp1 :=  sTemp1 + ' AND ORGNUM LIKE '''+E_SERorgnum.Text+'%'+''' ';

  sTemp1 :=  sTemp1 + ' AND existon = ''1'' '+
                      ' AND FINCODE IS NULL '+   //  ' AND CLOSEDATE IS NULL '+
                      //2014.08.13.hjku. 폐쇄조직인 경우 제외함.
                      ' AND nvl(CHANMODE,''0'') <> ''3'' '+  
                      ' ORDER BY DEPTCODE    ';

  With Dept_noFin do
  begin
       ServiceName := 'PZC1021A_sel2';
       Close;
       Sql.Clear;
       Sql.Add( sTemp1 );

       ClearFieldInfo;
       AddField('ORGNUM'       , ftString  ,  3   );
       AddField('DEPTCODE'     , ftString  ,  6   );
       AddField('DEPTNAME'     , ftString  ,  60  );
       AddField('DEPTNA1'      , ftString  ,  30  );
       AddField('DEPTNA2'      , ftString  ,  30  );
       AddField('DEPTNA3'      , ftString  ,  30  );
       AddField('DEPTABBR'     , ftString  ,  30  );
       AddField('EXISTON'      , ftString  ,  1   );
       AddField('PLACECODE'    , ftString  ,  2   );
       AddField('DEPTLEVEL'    , ftString  ,  2   );
       AddField('SECTCODE'     , ftString  ,  3   );
       AddField('FIELDCODE'    , ftString  ,  3   );
       AddField('EXTCODE'      , ftString  ,  6   );
       AddField('BONCODE'      , ftString  ,  6   );
       AddField('FINCODE'      , ftString  ,  6   );
       AddField('OVERMODE'     , ftString  ,  1   );
       AddField('DEPTFUNC'     , ftString  ,  2   );
       AddField('CHANMODE'     , ftString  ,  1   );
       AddField('REORGDATE'    , ftString  ,  8   );
       AddField('CHANDATE'     , ftString  ,  8   );
       AddField('CLOSEDATE'    , ftString  ,  8   );
       AddField('BORGNUM'      , ftString  ,  3   );
       AddField('BDEPTCODE1'   , ftString  ,  6   );
       AddField('BDEPTCODE2'   , ftString  ,  6   );
       AddField('BDEPTCODE3'   , ftString  ,  6   );
       AddField('DEPTFUNCNM'   , ftString  ,  20  );
       AddField('CHANMODENM'   , ftString  ,  20  );
       Open;

       FieldByName('ORGNUM').Alignment   := taCenter;
       FieldByName('DEPTCODE').Alignment := taCenter;
       FieldByName('DEPTNAME').Alignment := taLeftJustify;
  end;

end;

procedure TDeptForm.E_SERorgnumKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
//    key := #0;
    Retrieve;
  end;
end;

procedure TDeptForm.DBGrid1CellClick(Column: TColumn);
begin
  Dept.Locate('DEPTCODE',VarArrayOf([Dept_noFin.FieldByName('DEPTCODE').AsString ]), [loCaseInsensitive])
end;

procedure TDeptForm.BB_saveClick(Sender: TObject);
var
  ParamVariant   : string;
begin
  if OPstate = 0 then
  begin
       System.Exit;
       StatusBar1.Panels[1].Text := '자료가 없어 저장할 수 없습니다.';
  end;

  if(trim(E_fincode.text)='') then
  begin
    MessageDlg('재무부서코드를 입력해 주시기 바랍니다. ', mtInformation,[mbOk], 0);
    E_fincode.SetFocus;
    Exit;
  end;

  E_Empty_fincode.text := RemoveSpecialChar(E_Empty_fincode.text);

  if(trim(E_Empty_fincode.text)='') then
  begin
    MessageDlg('미입력자 재무부서코드를 입력해 주시기 바랍니다. ', mtInformation,[mbOk], 0);
    E_Empty_fincode.SetFocus;
    Exit;
  end;

  if(length(trim(E_Empty_fincode.text))<>5) then
  begin
    MessageDlg('정확한 미입력자 재무부서코드(5자리)를 입력해 주시기 바랍니다. ', mtInformation,[mbOk], 0);
    E_Empty_fincode.SetFocus;
    Exit;
  end;

  E_Retire_fincode.text := RemoveSpecialChar(E_Retire_fincode.text);

  if(trim(E_Retire_fincode.text)='') then
  begin
    MessageDlg('퇴직자 재무부서코드를 입력해 주시기 바랍니다. ', mtInformation,[mbOk], 0);
    E_Retire_fincode.SetFocus;
    Exit;
  end;

  if(length(trim(E_Retire_fincode.text))<>5) then
  begin
    MessageDlg('정확한 퇴직자 재무부서코드(5자리)를 입력해 주시기 바랍니다. ', mtInformation,[mbOk], 0);
    E_Retire_fincode.SetFocus;
    Exit;
  end;

  try
       with TDS_dml do
       begin
            ParamVariant := Format('UPDATE PYCDEPT                                            '+
                                   '   SET FINCODE   = ''%s'',                                '+
                                   '       WRITETIME = TO_CHAR(sysdate, ''YYYYMMDDHH24MISS''),'+
                                   '       WRITEEMP  = ''%s''                                 '+
                                   ' WHERE ORGNUM    = ''%s'' AND DEPTCODE = ''%s''           ',
                                   [E_fincode.Text, pempno, E_orgnum.Text, E_deptcode.Text]   );

            ServiceName := 'PZC1021A_dml';
            Close;
            Sql.Clear;
            Sql.Add(ParamVariant);

            if not TDS_dml.Execute then
            begin
                ShowMessage('저장중 에러가 발생했습니다1');
                Exit;
            end;


            ParamVariant := Format('UPDATE pimpmas                                           '+
                                   '   SET FINCODE   = ''%s'',                               '+
                                   '       WRITETIME = TO_CHAR(sysdate, ''YYYYMMDDHH24MISS'')'+
                                   ' WHERE ORGNUM    = ''%s'' AND JOBDEPT = ''%s''           '+
                                   '   AND PSTATE < 80                                       ',
                                   [E_fincode.Text, E_orgnum.Text, E_deptcode.Text]          );
            Close;
            Sql.Clear;
            Sql.Add(ParamVariant);
            if not TDS_dml.Execute then
            begin
                ShowMessage('저장중 에러가 발생했습니다2');
                Exit;
            end;

            if not((trim(E_Empty_fincode.text) =Empty_fincode) and
                   (trim(E_Retire_fincode.text)=Retire_fincode))
            then
            begin
              ServiceName := 'PZC1021A_dml';
              Close;
              Sql.Clear;
              Sql.Add('merge into PSAPFINCODE P                                                                               ');
              Sql.Add('  using (select ''' + E_orgnum.text         + ''' ORGNUM,                                              ');
              Sql.Add('                ''' + E_Empty_fincode.text  + ''' EMPTY_FINCODE,                                       ');
              Sql.Add('                ''' + E_Retire_fincode.text + ''' RETIRE_FINCODE,                                      ');
              Sql.Add('                ''' + pempno                + ''' WRITEMAN,                                            ');
              Sql.Add('                to_char(sysdate,''YYYYMMDDHH24miss'') WRITETIME                                        ');
              Sql.Add('           from dual ) v1                                                                              ');
              Sql.Add('    ON (P.ORGNUM = v1.ORGNUM)                                                                          ');
              Sql.Add('when matched then update set                                                                           ');
              Sql.Add('                        P.EMPTY_FINCODE  = V1.EMPTY_FINCODE,                                           ');
              Sql.Add('                        P.RETIRE_FINCODE = V1.RETIRE_FINCODE,                                          ');
              Sql.Add('                        P.WRITEMAN       = V1.WRITEMAN,                                                ');
              Sql.Add('                        P.WRITETIME      = v1.WRITETIME                                                ');
              Sql.Add('when not matched then insert(P.ORGNUM, P.EMPTY_FINCODE, P.RETIRE_FINCODE, P.WRITEMAN, P.WRITETIME)     ');
              Sql.Add('                      VALUES(v1.ORGNUM,v1.EMPTY_FINCODE,v1.RETIRE_FINCODE,v1.WRITEMAN,v1.WRITETIME)    ');

              if not TDS_dml.Execute then
              begin
                  ShowMessage('저장중 에러가 발생했습니다1');
                  Exit;
              end;
            end;

            MessageDlg('저장되었습니다.', MtInformation, [mbok], 0);
            StatusBar1.Panels[1].Text := '저장되었습니다.';
       end;

       LastOrgnum   :=  E_orgnum.Text;
       Lastdeptcode :=  E_deptcode.Text;
       Retrieve;
  except
    on E: Exception do
    begin
        MessageDlg(E.Message, mtError, [mbOk], 0);
        BB_cancelClick(Sender);
    end;
  end;

end;

procedure TDeptForm.BB_cancelClick(Sender: TObject);
begin
  E_fincode.Text  := Dept.FieldByName('fincode').AsString;
  StatusBar1.Panels[1].Text  := ''; 
end;

procedure TDeptForm.BB_printClick(Sender: TObject);
begin
  if (E_Porgnum.Text = '') or (E_deptcodeFROM.Text = '') or (E_deptcodeTO.Text = '') then
  begin
       showmessage('먼저 인쇄부서코드범위를 입력하세요!');
       System.Exit;
  end;
  StatusBar1.Panels[1].Text := '인쇄중입니다.';

  Application.ProcessMessages;

  QReport1.QRL_orgnum.Caption        := E_SERorgnum.Text;
  QReport1.QRL_deptcodeRANGE.Caption := E_deptcodeFROM.Text+' ~ '+E_deptcodeTO.Text;

  QReport1.preview;
  StatusBar1.Panels[1].Text := '인쇄가 완료되었습니다.';

end;

procedure TDeptForm.BB_excelClick(Sender: TObject);
var
 XL, Sheet : Variant;
 i : Integer;
begin

  try
     XL := CreateOLEObject('Excel.Application');
  except
     messageDlg('Excel이 설치되어 있지 않습니다.', MtWarning, [mbok], 0);
     exit;
  end;

  XL.WorkBooks.Add;
  XL.Workbooks[1].WorkSheets[1].Name := '부서코드 LIST';
  Sheet   := XL.WorkBooks[1].WorkSheets['부서코드 LIST'];
  StatusBar1.Panels[1].text :='부서코드를 EXCEL 화일로 저장중입니다. 잠시만 기다려 주세요..';
  QReport1.ReadPrintData;

  Sheet.cells[1, 1]  := '부서명';
  Sheet.cells[1, 2]  := '부서코드';
  Sheet.cells[1, 3]  := '재무코드';
  Sheet.cells[1, 4]  := '근무지명';
  Sheet.cells[1, 5]  := '변동구분';

  QReport1.TDS_print.First;
  for i := 1 to QReport1.TDS_print.RecordCount do
  begin
       Sheet.cells[i+1, 1]  := QReport1.TDS_print.FieldByName('DEPTNAME').AsString;
       Sheet.cells[i+1, 2]  := QReport1.TDS_print.FieldByName('DEPTCODE').AsString;
       Sheet.cells[i+1, 3]  := ''''+QReport1.TDS_print.FieldByName('FINCODE').AsString;
       Sheet.cells[i+1, 4]  := QReport1.TDS_print.FieldByName('PLACECODENM').AsString;
       Sheet.cells[i+1, 5]  := QReport1.TDS_print.FieldByName('CHANMODENM').AsString;
       QReport1.TDS_print.Next;
  end;

  XL.Range['A..E'].Select;
  XL.Selection.Columns.AutoFit;
  XL.Range['A1','A1'].Select;

  XL.Visible := true;
  XL := UnAssigned;
  StatusBar1.Panels[1].text :='부서코드를 EXCEL 화일로 저장이 완료되었습니다..';
end;

procedure TDeptForm.BB_closeClick(Sender: TObject);
begin
  Close;
end;


procedure TDeptForm.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  E_orgnum.Text   := Dept.FieldByName('ORGNUM').AsString;
  E_deptcode.Text := Dept.FieldByName('DEPTCODE').AsString;
  E_deptna1.Text  := Dept.FieldByName('deptna1').AsString;
  E_deptna2.Text  := Dept.FieldByName('deptna2').AsString;
  E_deptna3.Text  := Dept.FieldByName('deptna3').AsString;
  E_fincode.Text  := Dept.FieldByName('fincode').AsString;

  //부서기능
  E_DeptFunc.Text := Dept.FieldByName('DEPTFUNC').AsString +' - '+ Dept.FieldByName('DEPTFUNCNM').AsString;
  //부서변동
  E_Chanmode.Text := Dept.FieldByName('CHANMODE').AsString +' - '+ Dept.FieldByName('CHANMODENM').AsString;

  if Copy(E_Chanmode.Text,1,1) = '3' then
  begin
       E_Chanmode.Font.Color   := clRed;
       ME_closedate.Font.Color := clRed;
  end
  else
  begin
       E_Chanmode.Font.Color   := clBlack;
       ME_closedate.Font.Color := clBlack;
  end;

  ME_reorgdate.Text := Dept.FieldByName('REORGDATE').AsString;
  ME_chandate.Text  := Dept.FieldByName('CHANDATE').AsString;
  ME_closedate.Text := Dept.FieldByName('CLOSEDATE').AsString;

  //2017.02.23.hjku.. SAP 전송 default fincode 관리 추가(하드코딩을 관리로 변경).. 자체 개선
  With sap_fincode do
  begin
    ServiceName := 'HINSA_select';
    ClearFieldInfo;
    AddField('EMPTY_FINCODE'   , ftString, 100);
    AddField('RETIRE_FINCODE'  , ftString, 100);
    AddField('field3'          , ftString, 100);
    AddField('field4'          , ftString, 100);
    AddField('field5'          , ftString, 100);
    Close;
    Sql.Clear;
    Sql.Add('SELECT EMPTY_FINCODE  ,                   ');
    Sql.Add('       RETIRE_FINCODE,                    ');
    Sql.Add('       ''field3'' , ''field4'', ''field4''');
    Sql.Add('  FROM PSAPFINCODE                        ');
    Sql.Add(' WHERE ORGNUM ='''+ E_orgnum.Text +'''    ');
    
    Open;

    if sap_fincode.RecordCount <= 0 then
    begin
      Empty_fincode         := '';
      Retire_fincode        := '';
    end
    else
    begin   
      Empty_fincode         := FieldByName('EMPTY_FINCODE').AsString;
      Retire_fincode        := FieldByName('RETIRE_FINCODE').AsString;
    end;

    E_Empty_fincode.Text   := Empty_fincode;
    E_Retire_fincode.Text  := Retire_fincode;
  end;

  OPstate := 2; {열람상태}

  if      (Dept.Bof) then StatusBar1.Panels[1].Text := '자료의 처음입니다.'
  else if (Dept.eof) then StatusBar1.Panels[1].Text := '자료의 마지막입니다.'
  else                    StatusBar1.Panels[1].Text := '';
end;

function TDeptForm.RemoveSpecialChar(sSrc: string): string;
var
  I: integer;
begin
  result := '';
  
  for I:=1 to Length(sSrc) do
    if (sSrc[I] in ['A'..'Z', 'a'..'z', '0'..'9']) or (ByteType(sSrc, I)<>mbSingleByte) then
      result := result + sSrc[I];
end;
end.
