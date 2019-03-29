unit PIU20201;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OnScheme, ExtCtrls, OnShapeLabel, OnEditBaseCtrl, OnEditStdCtrl,
  OnEditNumCtl, StdCtrls, Grids, DBGrids, OnGrDBGrid, ComCtrls,
  Db, MemDS, DBAccess, Ora, OnFocusButton, Comobj, QuickRpt, Pass, Func,
  OnEditBtnCtrl, OnEditCombo;

const
 xlCenter = -4108;

type
  TMainForm = class(TForm)
    Panel1: TPanel;
    SF_Main: TOnSchemeForm;
    Shape2: TShape;
    Label1: TLabel;
    NE_ConY_5: TOnNumberEdit;
    L_paycl: TOnShapeLabel;
    OnShapeLabel1: TOnShapeLabel;
    OnShapeLabel2: TOnShapeLabel;
    NE_ConN_5: TOnNumberEdit;
    NE_ConF_5: TOnNumberEdit;
    NE_5: TOnNumberEdit;
    NE_ConY_3: TOnNumberEdit;
    NE_ConN_3: TOnNumberEdit;
    NE_ConF_3: TOnNumberEdit;
    NE_3: TOnNumberEdit;
    Shape1: TShape;
    Label2: TLabel;
    OnGrDbGrid1: TOnGrDbGrid;
    SB_help: TStatusBar;
    Ora_Qry1: TOraQuery;
    DataSource1: TDataSource;
    Ora_Grid: TOraQuery;
    Bt_Find: TOnFocusButton;
    Bt_Detail: TOnFocusButton;
    Bt_Print: TOnFocusButton;
    Bt_Excel: TOnFocusButton;
    Bt_Close: TOnFocusButton;
    OnShapeLabel3: TOnShapeLabel;
    NE_ConY_2: TOnNumberEdit;
    NE_ConN_2: TOnNumberEdit;
    NE_ConF_2: TOnNumberEdit;
    NE_2: TOnNumberEdit;
    OnShapeLabel4: TOnShapeLabel;
    NE_ConY_A: TOnNumberEdit;
    NE_ConN_A: TOnNumberEdit;
    NE_ConF_A: TOnNumberEdit;
    NE_A: TOnNumberEdit;
    NE_ConY_E: TOnNumberEdit;
    NE_ConN_E: TOnNumberEdit;
    NE_ConF_E: TOnNumberEdit;
    NE_E: TOnNumberEdit;
    NE_ConY_T: TOnNumberEdit;
    NE_ConN_T: TOnNumberEdit;
    NE_ConF_T: TOnNumberEdit;
    NE_T: TOnNumberEdit;
    NE_ConY_Total: TOnNumberEdit;
    NE_ConN_Total: TOnNumberEdit;
    NE_ConF_Total: TOnNumberEdit;
    NE_Total: TOnNumberEdit;
    CB_status: TCheckBox;
    CB_Year: TOnComboEdit;
    procedure FormPaint(Sender: TObject);
    procedure Bt_CloseClick(Sender: TObject);
    procedure Bt_FindClick(Sender: TObject);
    procedure Bt_DetailClick(Sender: TObject);
    procedure OnGrDbGrid1DblClick(Sender: TObject);
    procedure Bt_ExcelClick(Sender: TObject);
    procedure Bt_PrintClick(Sender: TObject);
    procedure CB_statusClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    GSEmpno     : String;
    GSKorname   : String;
    GSGrade     : String;

  end;

var
  MainForm: TMainForm;

implementation

uses PIU20202, PIU20204, PIU20205;

{$R *.DFM}

procedure TMainForm.FormPaint(Sender: TObject);
begin
     GSempno    := PassEmp(cmdline,1);
     GSkorname  := PassEmp(cmdline,2);
     GSGrade    := PassEmp(cmdline,4);

     Bt_findClick(Sender);
     SB_help.Panels[1].Text := '';
end;

procedure TMainForm.Bt_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.Bt_FindClick(Sender: TObject);
begin
  Ora_Qry1.Session := Ora_Session;
  with Ora_Qry1 do
    begin
      Close;
      Sql.Clear;
      Sql.Add('SELECT COUNT(DECODE(GUBUN,''5년 이상 장기근무'',           DECODE(CONYN,''Y'',''1''))) CONY_5,               ');
      Sql.Add('       COUNT(DECODE(GUBUN,''3년∼5년 근무자'',             DECODE(CONYN,''Y'',''1''))) CONY_3,               ');
      Sql.Add('       COUNT(DECODE(GUBUN,''3년 미만(승격자격 취득희망)'', DECODE(CONYN,''Y'',''1''))) CONY_2,               ');
      Sql.Add('       COUNT(DECODE(GUBUN,''무연고 지역 2년 이상 근무'',   DECODE(CONYN,''Y'',''1''))) CONY_A,               ');
      Sql.Add('       COUNT(DECODE(GUBUN,''기타 사유자'',                 DECODE(CONYN,''Y'',''1''))) CONY_E,               ');
      Sql.Add('       COUNT(DECODE(GUBUN,''본사/수도권 ↔ 지방'',         DECODE(CONYN,''Y'',''1''))) CONY_T,               ');
      Sql.Add('       COUNT(DECODE(CONYN,''Y'',''1'')) CONY_TOTAL,                                                          ');

      Sql.Add('       COUNT(DECODE(GUBUN,''5년 이상 장기근무'',           DECODE(CONYN,''N'',''1''))) CONN_5,               ');
      Sql.Add('       COUNT(DECODE(GUBUN,''3년∼5년 근무자'',             DECODE(CONYN,''N'',''1''))) CONN_3,               ');
      Sql.Add('       COUNT(DECODE(GUBUN,''3년 미만(승격자격 취득희망)'', DECODE(CONYN,''N'',''1''))) CONN_2,               ');
      Sql.Add('       COUNT(DECODE(GUBUN,''무연고 지역 2년 이상 근무'',   DECODE(CONYN,''N'',''1''))) CONN_A,               ');
      Sql.Add('       COUNT(DECODE(GUBUN,''기타 사유자'',                 DECODE(CONYN,''N'',''1''))) CONN_E,               ');
      Sql.Add('       COUNT(DECODE(GUBUN,''본사/수도권 ↔ 지방'',         DECODE(CONYN,''N'',''1''))) CONN_T,               ');
      Sql.Add('       COUNT(DECODE(CONYN,''N'',''1'')) CONN_TOTAL,                                                          ');

      Sql.Add('       COUNT(DECODE(GUBUN,''5년 이상 장기근무'',           DECODE(NVL(CONYN,''F''),''F'',''1''))) CONF_5,    ');
      Sql.Add('       COUNT(DECODE(GUBUN,''3년∼5년 근무자'',             DECODE(NVL(CONYN,''F''),''F'',''1''))) CONF_3,    ');
      Sql.Add('       COUNT(DECODE(GUBUN,''3년 미만(승격자격 취득희망)'', DECODE(NVL(CONYN,''F''),''F'',''1''))) CONF_2,    ');
      Sql.Add('       COUNT(DECODE(GUBUN,''무연고 지역 2년 이상 근무'',   DECODE(NVL(CONYN,''F''),''F'',''1''))) CONF_A,    ');
      Sql.Add('       COUNT(DECODE(GUBUN,''기타 사유자'',                 DECODE(NVL(CONYN,''F''),''F'',''1''))) CONF_E,    ');
      Sql.Add('       COUNT(DECODE(GUBUN,''본사/수도권 ↔ 지방'',         DECODE(NVL(CONYN,''F''),''F'',''1''))) CONF_T,    ');
      Sql.Add('       COUNT(DECODE(NVL(CONYN,''F''),''F'',''1'')) CONF_TOTAL,                                               ');

      Sql.Add('       COUNT(DECODE(GUBUN,''5년 이상 장기근무'',''1''))           TOT_5,                                     ');
      Sql.Add('       COUNT(DECODE(GUBUN,''3년∼5년 근무자'',''1''))             TOT_3,                                     ');
      Sql.Add('       COUNT(DECODE(GUBUN,''3년 미만(승격자격 취득희망)'',''1'')) TOT_2,                                     ');
      Sql.Add('       COUNT(DECODE(GUBUN,''무연고 지역 2년 이상 근무'',''1''))   TOT_A,                                     ');
      Sql.Add('       COUNT(DECODE(GUBUN,''기타 사유자'',''1''))                 TOT_E,                                     ');
      Sql.Add('       COUNT(DECODE(GUBUN,''본사/수도권 ↔ 지방'',''1''))         TOT_T,                                     ');
      Sql.Add('       COUNT(*) TOT                                                                                          ');
      Sql.Add('  FROM PIDCHAPP                                                                                              ');
//      Sql.Add(' WHERE ORGNUM = (SELECT value1 FROM pimvari WHERE gubun = ''00'' AND sgubun = ''0001'')                      ');
      Sql.Add(' WHERE Appdate like :sYear||''%''                                                                            '); //dsa2000  2008.01. Add

      if not CB_status.Checked then Sql.Add(' AND STATUS =''2'' ');
      ParamByName('sYear').AsString := CB_Year.Text;    //dsa2000  2008.01. Add
      Open;

      NE_ConY_5.Value     := FieldByName('CONY_5').AsFloat;
      NE_ConY_3.Value     := FieldByName('CONY_3').AsFloat;
      NE_ConY_2.Value     := FieldByName('CONY_2').AsFloat;
      NE_ConY_A.Value     := FieldByName('CONY_A').AsFloat;
      NE_ConY_E.Value     := FieldByName('CONY_E').AsFloat;
      NE_ConY_T.Value     := FieldByName('CONY_T').AsFloat;
      NE_ConY_Total.Value := FieldByName('CONY_TOTAL').AsFloat;

      NE_ConN_5.Value     := FieldByName('CONN_5').AsFloat;
      NE_ConN_3.Value     := FieldByName('CONN_3').AsFloat;
      NE_ConN_2.Value     := FieldByName('CONN_2').AsFloat;
      NE_ConN_A.Value     := FieldByName('CONN_A').AsFloat;
      NE_ConN_E.Value     := FieldByName('CONN_E').AsFloat;
      NE_ConN_T.Value     := FieldByName('CONN_T').AsFloat;
      NE_ConN_Total.Value := FieldByName('CONN_TOTAL').AsFloat;

      //showmessage(floattostr(FieldByName('CONF_5').AsFloat));
      NE_ConF_5.Value     := FieldByName('CONF_5').AsFloat;
      NE_ConF_3.Value     := FieldByName('CONF_3').AsFloat;
      NE_ConF_2.Value     := FieldByName('CONF_2').AsFloat;
      NE_ConF_A.Value     := FieldByName('CONF_A').AsFloat;
      NE_ConF_E.Value     := FieldByName('CONF_E').AsFloat;
      NE_ConF_T.Value     := FieldByName('CONF_T').AsFloat;
      NE_ConF_Total.Value := FieldByName('CONF_TOTAL').AsFloat;

      NE_5.Value          := FieldByName('TOT_5').AsFloat;
      NE_3.Value          := FieldByName('TOT_3').AsFloat;
      NE_2.Value          := FieldByName('TOT_2').AsFloat;
      NE_A.Value          := FieldByName('TOT_A').AsFloat;
      NE_E.Value          := FieldByName('TOT_E').AsFloat;
      NE_T.Value          := FieldByName('TOT_T').AsFloat;
      NE_Total.Value      := FieldByName('TOT').AsFloat;
    end;

  Ora_Grid.Session := Ora_Session;
  with Ora_Grid do
    begin
      Close;
      Sql.Clear;
      Sql.Add('SELECT A.GUBUN, CONYN, SUBSTR(APPDATE,1,8) APPDATE, EMPNO, KORNAME,     ');
      Sql.Add('       A.PAYCL, C.CODENAME PAYCLNM,           ');
      Sql.Add('       A.PAYRA, D.CODENAME PAYRANM, SUBSTR(A.DEPTCODE,1,3)||''00'' DEPTCODE,  B.DEPTNAME, ');
      Sql.Add('       DECODE(A.STATUS,''1'',''임시저장'',''2'',''신청'') STATUS,    ');
      Sql.Add('       A.LONGDESC,                                           ');
      Sql.Add('       APPDEPT1, A1.DEPTNAME DEPT1, APPDEPT2, A2.DEPTNAME DEPT2,     ');
      Sql.Add('       APPDEPT3, A3.DEPTNAME DEPT3,                                  ');
      Sql.Add('       A.MOVEYYMM1, A.MOVEYYMM2, A.MOVEYYMM3,                        ');
      Sql.Add('       A.APPSAYU1, A.APPSAYU2, A.APPSAYU3,                           ');
      Sql.Add('       A.SPEDESC1, A.SPEDESC2, A.SPEDESC3                            ');
      Sql.Add('  FROM PIDCHAPP A, PYCDEPT B, PYCDEPT A1, PYCDEPT A2, PYCDEPT A3,    ');
      Sql.Add('       PYCCODE C, PYCCODE D                                          ');
      Sql.Add(' WHERE A.ORGNUM   = B.ORGNUM                                         ');
      Sql.Add('   AND A.DEPTCODE = B.DEPTCODE                                       ');
      Sql.Add('   AND C.CODEID   = ''I112''                                         ');
      Sql.Add('   AND C.CODENO   = A.PAYCL                                          ');
      Sql.Add('   AND D.CODEID   = ''I113''                                         ');
      Sql.Add('   AND D.CODENO   = A.PAYRA                                          ');
      Sql.Add('   AND A.ORGNUM   = A1.ORGNUM                                        ');
      Sql.Add('   AND A.APPDEPT1 = A1.DEPTCODE                                      ');
      Sql.Add('   AND A.ORGNUM   = A2.ORGNUM(+)                                     ');
      Sql.Add('   AND A.APPDEPT2 = A2.DEPTCODE(+)                                   ');
      Sql.Add('   AND A.ORGNUM   = A3.ORGNUM(+)                                     ');
      Sql.Add('   AND A.APPDEPT3 = A3.DEPTCODE(+)                                   ');
//      Sql.Add('   AND A.ORGNUM = (SELECT value1 FROM pimvari WHERE gubun = ''00'' AND sgubun = ''0001'') ');
      Sql.Add('   AND A.Appdate like :sYear||''%''                                  '); //dsa2000  2008.01. Add

      if not CB_status.Checked then Sql.Add(' AND A.STATUS =''2''   ');

      Sql.Add(' ORDER BY DECODE(A.GUBUN,''5년 이상 장기근무'',1,''3년∼5년 근무자'',2,''3년 미만(승격자격 취득희망)'',3, ');
      Sql.Add('          ''무연고 지역 2년 이상 근무'',4,''기타 사유자'',5,''본사/수도권 ↔ 지방'',6), A.APPDATE DESC    ');

      ParamByName('sYear').AsString := CB_Year.Text;    //dsa2000  2008.01. Add
      Open;

      FieldByName('CONYN').Alignment   := taCenter;
      FieldByName('APPDATE').EditMask  := '!9999/99/00;0;_';
    end;
end;

procedure TMainForm.Bt_DetailClick(Sender: TObject);
begin
  Try
    SubForm := TSubForm.Create(Self);

    with Ora_Grid do
      begin
        SubForm.L_emp.ValueCaption    := FieldByName('EMPNO').AsString+' - '+FieldByName('KORNAME').AsString;
        SubForm.L_paycl.ValueCaption  := FieldByName('PAYCLNM').AsString;
        SubForm.L_payra.ValueCaption  := FieldByName('PAYRANM').AsString;
        SubForm.L_dept.ValueCaption   := FieldByName('DEPTNAME').AsString;
        SubForm.L_status.ValueCaption := FieldByName('STATUS').AsString;
        SubForm.L_conyn.ValueCaption  := FieldByName('CONYN').AsString;
        SubForm.M_long.Text           := FieldByName('LONGDESC').AsString;

        if FieldByName('GUBUN').AsString ='5년 이상 장기근무' then
          SubForm.RB_5.Checked := True
        else if FieldByName('GUBUN').AsString ='3년∼5년 근무자' then
          SubForm.RB_3.Checked := True
        else if FieldByName('GUBUN').AsString ='3년 미만(승격자격 취득희망)' then
          SubForm.RB_2.Checked := True
        else if FieldByName('GUBUN').AsString ='무연고 지역 2년 이상 근무' then
          SubForm.RB_A.Checked := True
        else if FieldByName('GUBUN').AsString ='기타 사유자' then
          SubForm.RB_E.Checked := True
        else if FieldByName('GUBUN').AsString ='본사/수도권 ↔ 지방' then
          SubForm.RB_T.Checked := True;


        SubForm.L_dept1.ValueCaption  := FieldByName('DEPT1').AsString;
        SubForm.L_move1.ValueCaption  := FieldByName('MOVEYYMM1').AsString;
        SubForm.L_dept2.ValueCaption  := FieldByName('DEPT2').AsString;
        SubForm.L_move2.ValueCaption  := FieldByName('MOVEYYMM2').AsString;
        SubForm.L_dept3.ValueCaption  := FieldByName('DEPT3').AsString;
        SubForm.L_move3.ValueCaption  := FieldByName('MOVEYYMM3').AsString;


        SubForm.GSsayu1     := FieldByName('APPSAYU1').AsString;
        SubForm.GSsayu2     := FieldByName('APPSAYU2').AsString;
        SubForm.GSsayu3     := FieldByName('APPSAYU3').AsString;
        SubForm.GSspedesc1  := FieldByName('SPEDESC1').AsString;
        SubForm.GSspedesc2  := FieldByName('SPEDESC2').AsString;
        SubForm.GSspedesc3  := FieldByName('SPEDESC3').AsString;
        SubForm.ShowModal;
      end;
  Finally
    SubForm.Free;
  end;

  Bt_findClick(Sender);
end;

procedure TMainForm.OnGrDbGrid1DblClick(Sender: TObject);
begin
  Bt_detailClick(Sender);  
end;

procedure TMainForm.Bt_ExcelClick(Sender: TObject);
var
  XL, Sheet : Variant;
  i : Integer;
  function Get_TO (deptcode:String) : String;
    begin
      Ora_Qry1.First;
      Result := '';
      while not Ora_Qry1.eof do
        begin
          if deptcode = Ora_Qry1.FieldByName('deptcode').AsString then
            begin
              Result := Ora_Qry1.FieldByName('tpossum').AsString;
              Break;
            end;
          Ora_Qry1.Next;
        end;
    end;
begin
  if not Ora_Grid.Active then
    begin
      MessageDlg('조회된 자료가 없습니다.', MtWarning, [mbok], 0);
      Exit;
    end;

  try
    XL := CreateOLEObject('Excel.Application');
  except
    MessageDlg('Excel이 설치되어 있지 않습니다.', MtWarning, [mbok], 0);
    Exit;
  end;

  XL.WorkBooks.Add;
  XL.Workbooks[1].WorkSheets[1].Name := '배치전환 신청내역';
  Sheet := XL.WorkBooks[1].WorkSheets['배치전환 신청내역'];

  Sheet.Cells[1,1]  := '배치전환종류';
  Sheet.Cells[1,2]  := '자격여부';
  Sheet.Cells[1,3]  := '신청일';
  Sheet.Cells[1,4]  := '사번';
  Sheet.Cells[1,5]  := '신청자명';

  Sheet.Cells[1,6]  := 'BAND코드';
  Sheet.Cells[1,7]  := 'BAND';
  Sheet.Cells[1,8]  := '직책코드';
  Sheet.Cells[1,9]  := '직책';

  Sheet.Cells[1,10]  := '소속부서코드';
  Sheet.Cells[1,11]  := '소속부서';
  Sheet.Cells[1,12]  := '소속부서 T/O';

  Sheet.Cells[1,13]  := '1지망부서코드';
  Sheet.Cells[1,14]  := '1지망부서명';
  Sheet.Cells[1,15]  := '1지망근무가능일자';
  Sheet.Cells[1,16]  := '1지망 T/O';
  Sheet.Cells[1,17]  := '2지망부서코드';
  Sheet.Cells[1,18]  := '2지망부서명';
  Sheet.Cells[1,19]  := '2지망근무가능일자';
  Sheet.Cells[1,20]  := '2지망 T/O';

  Sheet.Cells[1,21]  := '3지망부서코드';
  Sheet.Cells[1,22]  := '3지망부서명';
  Sheet.Cells[1,23]  := '3지망근무가능일자';
  Sheet.Cells[1,24]  := '3지망 T/O';

  Sheet.Cells[1,25]  := '상태';

  with Ora_Qry1 do
    begin
      Close;
      Sql.Clear;
      Sql.Add('select deptcode, tpossum         ');
      Sql.Add('  from pihtopo                   ');
      Sql.Add(' where topoym = ''999999''       ');
      Sql.Add('   and orgnum = (select value1 FROM pimvari WHERE gubun = ''00'' AND sgubun = ''0001''  )  ');
      Open;
    end;

  Ora_Grid.First;
  i := 2;
  while not Ora_Grid.Eof do
    begin
      Sheet.cells[i,1]   := Ora_Grid.FieldByName('GUBUN').AsString ;
      Sheet.cells[i,2]   := Ora_Grid.FieldByName('CONYN').AsString ;
      Sheet.cells[i,3]   := Ora_Grid.FieldByName('APPDATE').AsString ;
      Sheet.cells[i,4]   := ''''+Ora_Grid.FieldByName('EMPNO').AsString ;
      Sheet.cells[i,5]   := Ora_Grid.FieldByName('KORNAME').AsString ;

      Sheet.cells[i,6]   := '';// ''''+Ora_Grid.FieldByName('PAYCL').AsString ;
      Sheet.cells[i,7]   := '';//Ora_Grid.FieldByName('PAYCLNM').AsString ;
      Sheet.cells[i,8]   := ''''+Ora_Grid.FieldByName('PAYRA').AsString ;
      Sheet.cells[i,9]   := Ora_Grid.FieldByName('PAYRANM').AsString ;

      Sheet.cells[i,10]   := Ora_Grid.FieldByName('DEPTCODE').AsString ;
      Sheet.cells[i,11]   := Ora_Grid.FieldByName('DEPTNAME').AsString ;
      Sheet.cells[i,12]   := Get_TO(Ora_Grid.FieldByName('DEPTCODE').AsString);

      Sheet.cells[i,13]   := Ora_Grid.FieldByName('APPDEPT1').AsString ;
      Sheet.cells[i,14]   := Ora_Grid.FieldByName('DEPT1').AsString ;
      Sheet.cells[i,15]   := Ora_Grid.FieldByName('MOVEYYMM1').AsString ;
      Sheet.cells[i,16]  := Get_TO(Ora_Grid.FieldByName('APPDEPT1').AsString);

      Sheet.cells[i,17]  := Ora_Grid.FieldByName('APPDEPT2').AsString ;
      Sheet.cells[i,18]  := Ora_Grid.FieldByName('DEPT2').AsString ;
      Sheet.cells[i,19]  := Ora_Grid.FieldByName('MOVEYYMM2').AsString ;
      Sheet.cells[i,20]  := Get_TO(Ora_Grid.FieldByName('APPDEPT2').AsString);

      Sheet.cells[i,21]  := Ora_Grid.FieldByName('APPDEPT3').AsString ;
      Sheet.cells[i,22]  := Ora_Grid.FieldByName('DEPT3').AsString ;
      Sheet.cells[i,23]  := Ora_Grid.FieldByName('MOVEYYMM3').AsString ;
      Sheet.cells[i,24]  := Get_TO(Ora_Grid.FieldByName('APPDEPT3').AsString);

      Sheet.cells[i,25]  := Ora_Grid.FieldByName('STATUS').AsString ;

      Ora_Grid.Next;
      inc(i);
    end;

  XL.Range['A:Y'].Select;
  XL.Selection.Columns.AutoFit;
  XL.Range['A1','Y1'].Select;
  XL.Selection.HorizontalAlignment := xlCenter;
  XL.Selection.Font.Bold := True;

  XL.Range['A1','A1'].Select;

  XL.Visible := True;
  XL := UnAssigned;      
end;

procedure TMainForm.Bt_PrintClick(Sender: TObject);
begin
  //QuickRep11.Preview;
  PrintForm.QuickRep1.Preview;
end;

procedure TMainForm.CB_statusClick(Sender: TObject);
begin
  Bt_FindClick(Sender);
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
     Self.OnPaint := Nil;
     Application.ProcessMessages;
     SF_Main.Refresh;
     SB_help.Panels[1].Text := '인사 시스템에 접속 중입니다...';

     if Trim(Passemp(cmdLine,1)) = '' then
     begin
          MessageDlg('종합인사 메뉴 프로그램을 실행하세요.', mtError , [mbOk],0);
          Bt_closeClick(Self);
          Exit;
     end;

     Application.ProcessMessages;
     SB_Help.Panels[1].Text := ' 데이타베이스에 접속중입니다...';

     OraConnect;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  Ora_Qry1.Session := Ora_Session;
  with Ora_Qry1 do
  begin
       Close;
       Sql.Clear;
       Sql.Add('select distinct substr(appdate,1,4) appdate,');
       Sql.Add('       to_char(sysdate,''YYYY'')    sYear   ');
       Sql.Add('  from pidchapp                             ');
       Sql.Add(' order by 1  desc                           ');       
       Open;

       First;
       CB_Year.Clear;
       while not Ora_Qry1.Eof do
       begin
            CB_Year.Items.Add (FieldByName('appdate').AsString);
            Next;
       end;
       CB_Year.Text := FieldByName('sYear').AsString;
  end;
end;

end.
