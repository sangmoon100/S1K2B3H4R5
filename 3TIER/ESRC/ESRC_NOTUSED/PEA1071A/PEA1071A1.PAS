unit PEA1071A1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl, OnTmaxPersonEdit,
  OnShapeLabel, ComCtrls, OnRadioBtn, OnEditMemo, StdCtrls, OnLineLabel,
  OnFocusButton, Db, Tmax_DataSetText, Tmax_session, printers, OnPopupEdit, 
  TmaxFunc, Pass, OnInsaCommon;

type
  TFM_Main = class(TForm)
    Panel1: TPanel;
    L_Deptname: TOnShapeLabel;
    L_payraname: TOnShapeLabel;
    P_Opinion: TPanel;
    Memo_E1: TOnMemo;
    E_Opinion2: TOnMemo;
    E_Opinion4: TOnMemo;
    E_Opinion3: TOnMemo;
    Memo_E2: TOnMemo;
    SB_Help: TStatusBar;
    OnSectionLabel3: TOnSectionLabel;
    OnSectionLabel1: TOnSectionLabel;
    BT_Exit: TOnFocusButton;
    BT_ScrPrint: TOnFocusButton;
    TMaxSession: TTMaxSession;
    TMaxDataSet: TTMaxDataSet;
    RESULTSCRGRADE: TOnShapeLabel;
    FINALGRADE: TOnShapeLabel;
    OnMemo8: TOnMemo;
    E_Opinion1: TOnMemo;
    L_NowBand: TOnShapeLabel;
    L_NextBand: TOnShapeLabel;
    E_Empno: TOnWinPopupEdit;
    L_korname: TOnShapeLabel;
    E_LoginEmp: TOnEdit;
    Label1: TLabel;
    procedure BT_ExitClick(Sender: TObject);
    procedure BT_ScrPrintClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure E_EmpnoCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure E_EmpnoInitPopup(Sender: TObject);
    procedure E_EmpnoKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure E_LoginEmpKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    vParamSQL  : String;
    procedure OpinionView;
    procedure EmpnoFind(vEmp : String);
  public
    { Public declarations }
    vRabasdate : String;
    vRabasNew  : String;
    vEmpno     : String;
    AEmpno     : String;
    Workemp1   : String;
    Workemp2   : String;
    Workemp3   : String;
    Workemp4   : String;
    Workemp5   : String;
    Lgubun     : Integer;
    Rgubun     : Integer;
  end;

var
  FM_Main: TFM_Main;

implementation

uses UEmpForm;

{$R *.DFM}

procedure TFM_Main.BT_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TFM_Main.FormCreate(Sender: TObject);
begin
  Self.OnPaint := Nil;
  Application.ProcessMessages;
  SB_Help.Panels[1].Text := '종합인사 시스템에 접속 중입니다...';

  TMaxSession.EnvFileName := FM_Tmax.GetHomeDir+'\newhana.env';   //ShowMessage(GetHomeDir);
  TMaxSession.LabelName   := 'HANAROHPER';
  TMaxSession.Connect     := False;
  TMaxSession.Host        := Passemp(cmdline,10);
  TMaxSession.Port        := '9999';

  try
       TMaxSession.Connect := True;
  except
       Application.MessageBox(PChar('APP서버 접속 실패'),'에러',mb_ok);
       Application.Terminate;
       Exit;
  end;

  //2013.11. Add
  FM_Tmax           := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := TMaxSession;
  if FM_Tmax.PassWordChk(Hinsa_Param(cmdline,1), Hinsa_Param(cmdline,3)) = 0 then Application.Terminate; //암호틀리면 종료}
    
  //////////////////////////////////////////////////////////////////////////////
  vEmpno :=  Passemp(cmdline,1);
  AEmpno :=  Passemp(cmdline,1);
  E_LoginEmp.Visible := False;

  SB_Help.Panels[1].Text := ' ';
end;

procedure TFM_Main.FormShow(Sender: TObject);
var vSysdate : String;
begin
  with TMaxDataSet do
  begin //평가기준일 불러오기 
       {vParamSQL := 'SELECT Value1, TO_CHAR(SYSDATE,''YYYYMMDDHH24MI''), ''3'', ''4'', ''5'' '+
                    '  FROM pehrebas                           '+
                    ' WHERE rabasdate = ''00000000''           '+
                    '   AND gubun     = ''00''                 '+
                    '   AND sgubun    = ''0001''               ';
       ServiceName := 'HINSA_select';
       ClearFieldInfo;
       AddField('Field1' , ftString, 100);
       AddField('Field2' , ftString, 100);
       AddField('Field3' , ftString, 100);
       AddField('Field4' , ftString, 100);
       AddField('Field5' , ftString, 100);

       Close;
       SQl.Clear;
       SQL.Text := vParamSQL;             
       Open;
       vRabasdate := Fields[0].AsString; // 현평가기준일   }
       
       vRabasdate := '20121130';         // 전년도 평가기준일 --> 계속 열어놓음...
       vRabasNew  := '20131130';         // 새로운 평가기준일 : 다음년도 팀장님이 전년도 평가결과 보여 달라고 할때 변경.

       //개발자에게 하드코딩 사실을 각인 시키기 위해.^^
       if Copy(Passemp(cmdline,1),1,1) = 'D' then
          ShowMessage('개발자만 보임 :'+#13+
                      '★OLD기준일:'+vRabasdate+' ★New기준일:'+vRabasNew);

       //평가담당자
       vParamSQL := 'SELECT Value1, Value2, Value3, Value4,     '+
                    '       TO_CHAR(SYSDATE,''YYYYMMDDHH24MI'') '+
                    '  FROM pehrebas                            '+
                    ' WHERE rabasdate = '''+ vRabasdate +'''    '+
                    '   AND gubun     = ''11''                  '+
                    '   AND sgubun    = ''0005''                ';

       ServiceName := 'HINSA_select';
       ClearFieldInfo;
       AddField('Field1' , ftString, 100);
       AddField('Field2' , ftString, 100);
       AddField('Field3' , ftString, 100);
       AddField('Field4' , ftString, 100);
       AddField('Field5' , ftString, 100);
       
       Close;
       SQl.Clear;
       SQL.Text := vParamSQL;
       Open;

       Workemp1 := Fields[0].AsString;
       Workemp2 := Fields[1].AsString;
       Workemp3 := Fields[2].AsString;
       Workemp4 := Fields[3].AsString;
       vSysdate := Fields[4].AsString; // 현 시간.

       E_Empno.Enabled := False;

       //1차, 2차평가자
       vParamSQL := 'SELECT Count(empno),''0'', null, null, null, null             '+
                    '  FROM pehremas                                               '+
                    ' WHERE rabasdate = '''+ vRabasdate +'''                       '+
                    '   AND RESTIYN   = ''Y''                                      '+
                    '   AND empno not in (select empno from petremas               '+
                    '                      where rabasdate = '''+ vRabasdate +''' )'+
                    '   AND (  (E1empno = '''+ vEmpno +''')                        '+
                    '       or (E2empno = '''+ vEmpno +''')  )                     ';
       Close;
       SQl.Clear;
       SQL.Text := vParamSQL;
       Open;

       if  Fields[0].AsString = '0' then LGubun := 0
                                    else LGubun := 1;


       if LGubun = 0 then //2010.06. dsa2000  추가...
       begin  //1차, 2차평가자 : 평가 이후에 팀장 변경시 새로운 팀장이 이전 평가 내역 볼수 있도록.
            vParamSQL := 'SELECT Count(empno),''0'', null, null, null, null             '+
                         '  FROM pehremas                                               '+
                         ' WHERE rabasdate = '''+ vRabasNew  +'''                       '+
                         '   AND empno not in (select empno from petremas               '+
                         '                      where rabasdate = '''+ vRabasNew  +''' )'+
                         '   AND (  (E1empno = '''+ vEmpno +''')                        '+
                         '       or (E2empno = '''+ vEmpno +''')  )                     ';
            Close;
            SQl.Clear;
            SQL.Text := vParamSQL;
            Open;

            if  Fields[0].AsString = '0' then LGubun := 0
                                         else LGubun := 1;
       end;
       /////////////////////////////////////////////////////////////////////////
                            
       //평가대상자와 1차, 2차평가자에 속하는지 여부
       vParamSQL := 'SELECT Count(empno),''0'', null, null, null, null             '+
                    '  FROM pehremas                                               '+
                    ' WHERE rabasdate = '''+ vRabasdate +'''                       '+
//                    '   AND RESTIYN   = ''Y''                                      '+ //평가대상자가 아닌 사람도 볼수 있도록2009.12.31
                    '   AND empno not in (select empno from petremas               '+
                    '                      where rabasdate = '''+ vRabasdate +''' )'+
                    '   AND (   (empno   = '''+ vEmpno +''')                       '+
                    '        or (E2empno = '''+ vEmpno +''')                       '+
                    '        or (E1empno = '''+ vEmpno +''')   )                   ';
       Close;
       SQl.Clear;
       SQL.Text := vParamSQL;
       Open;
       if  Fields[0].AsString = '0' then RGubun := 0
                                    else RGubun := 1;

       if (AEmpno = Workemp1) or (AEmpno = Workemp2) or (AEmpno = Workemp3) or
          (AEmpno = Workemp4) or (AEmpno = Workemp5) or (Copy(AEmpno,1,1) = 'D') then
       begin
            E_Empno.Enabled     := True;
            E_Empno.ReadOnly    := False;
            Rgubun              := 1;
            E_LoginEmp.Visible  := True;
       end;
  end;
(*
  if   (E_LoginEmp.Visible = False) and (vSysdate < '201112290000') then //오픈전 프로그램 막음.
  begin
       ShowMessage('평가결과 준비중입니다.'+#13#13+'프로그램을 종료합니다');
       Application.Terminate;
  end
  else if Rgubun = 0 then
*)
  if Rgubun = 0 then
  begin
       ShowMessage('프로그램 사용권한이 없거나 평가 대상자가 아닙니다'+#13#13+'프로그램을 종료합니다');
       Application.Terminate;
  end
  else
  begin
       if   Lgubun = 1 then
       begin
            E_empno.Enabled    := True;
            E_Empno.ReadOnly   := True;
            E_empno.Perform(WM_KEYDOWN, VK_F2, 0);
       end;

       EmpnoFind(vEmpno);
       OpinionView;
  end;
end;

procedure TFM_Main.BT_ScrPrintClick(Sender: TObject);
begin
  if MessageDlg('현재 화면 그대로 프린터로 출력이 됩니다. '+#13+#13 +
                '진행하시겠습니까? ', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
       BT_ScrPrint.SetFocus;
       Printer.Orientation := poLandscape;
       FM_Main.PrintScale  := poPrintToFit;
       FM_Main.Print;
  end;
end;

procedure TFM_Main.OpinionView;
begin
  //평가의견 Read...
  with TMaxDataSet do
  begin
       vParamSQL := 'SELECT Opinion1, Opinion2, Opinion3, Opinion4,          '+
                    '       E1VALVIEW, E2VALVIEW, ''5'', ''5'', ''5'', ''5'' '+
                    '  FROM PEHREMAS                                         '+
                    ' WHERE rabasdate = '''+ vRabasdate    +'''              '+
                    '   AND empno     = '''+ vEmpno        +'''              ';

       ServiceName := 'HINSA_select12';
       ClearFieldInfo;
       AddField('Field1' , ftString, 2000);
       AddField('Field2' , ftString, 2000);
       AddField('Field3' , ftString, 2000);
       AddField('Field4' , ftString, 2000);
       AddField('Field5' , ftString, 2000);
       AddField('Field6' , ftString, 2000);
       AddField('Field7' , ftString, 2000);
       AddField('Field8' , ftString, 2000);
       AddField('Field9' , ftString, 2000);
       AddField('Field10', ftString, 2000);

       Close;
       SQl.Clear;
       SQL.Text := vParamSQL;             //Memo1.Text := Sql.Text;
       Open;

       E_Opinion1.Text := Fields[0].AsString;
       E_Opinion2.Text := Fields[1].AsString;
       E_Opinion3.Text := Fields[2].AsString;
       E_Opinion4.Text := Fields[3].AsString;
       Memo_E1.text    := Fields[4].AsString;
       Memo_E2.text    := Fields[5].AsString;
       /////////////////////////////////////////////////////////////////////////

       vParamSQL := 'SELECT Substr(RESULTSCRGRADE,1,1), Substr(FINALGRADE,1,1),        '+  //G+ G-를 G등급으로 통일.
                    '       (Select codename from pyccode                              '+
                    '         where codeid = ''I112'' and codeno = a.paycl)  NOWBAND,  '+
                    '       (Select codename from pyccode                              '+
                    '         where codeid = ''I112'' and codeno = a.npaycl) NEXTBAND, '+
                    '       To_Char(To_Number(rabasyear)+1)                  NEXTYEAR  '+
                    '  FROM pehevhis a                                                 '+
                    ' WHERE rabasyear ='''+ copy(vRabasdate,1,4) +'''                  '+
                    '   AND empno not in (select empno from petremas                   '+
                    '                      where rabasdate='''+ vRabasdate +''')       '+
                    '   AND empno     ='''+ vEmpno     +'''                            ';

       ServiceName := 'HINSA_select2';
       ClearFieldInfo;
       AddField('RESULTSCRGRADE' , ftString, 400);
       AddField('FINALGRADE'     , ftString, 400);
       AddField('NOWBAND'        , ftString, 400);
       AddField('NEXTBAND'       , ftString, 400);
       AddField('NEXTYEAR'       , ftString, 400);

       Close;
       SQL.Text := vParamSQL;
       Open;

       if (Lgubun = 0) and (FieldByName('FINALGRADE').AsString = 'Y') then       //평가제외자
       begin
            ShowMessage('2012 평가 대상자가 아닙니다.'+#13+#13+'프로그램을 종료합니다');
            BT_ExitClick(nil);
            Exit;
       end
       else if (Lgubun = 0) and (FieldByName('FINALGRADE').AsString = 'Z') then  //평가보류자(교육파견자)
       begin
            ShowMessage('2012 평가가 진행중입니다.'+#13+#13+'프로그램을 종료합니다');
            BT_ExitClick(nil);
            Exit;
       end;

       RESULTSCRGRADE.ValueCaption := FieldByName('RESULTSCRGRADE').AsString;
       FINALGRADE.ValueCaption     := FieldByName('FINALGRADE').AsString;

       if FieldByName('FINALGRADE').AsString = 'Y' then RESULTSCRGRADE.ValueCaption := '평가제외자';
       if FieldByName('FINALGRADE').AsString = 'Y' then FINALGRADE.ValueCaption     := '평가제외자';
       if FieldByName('FINALGRADE').AsString = 'Z' then RESULTSCRGRADE.ValueCaption := '평가보류자';
       if FieldByName('FINALGRADE').AsString = 'Z' then FINALGRADE.ValueCaption     := '평가보류자';
       
       L_NowBand.ValueCaption      := FieldByName('NOWBAND').AsString;
       L_NowBand.LabelCaption      := copy(vRabasdate,1,4)            +'년 BAND';
       L_NextBand.LabelCaption     := FieldByName('NEXTYEAR').AsString+'년 BAND';

       if   FieldByName('NEXTBAND').AsString = '' then
            L_NextBand.ValueCaption := FieldByName('NOWBAND').AsString
       else L_NextBand.ValueCaption := FieldByName('NEXTBAND').AsString;
  end;
end;

procedure TFM_Main.EmpnoFind(vEmp : String);
begin
  with TMaxDataSet do
  begin
       vParamSQL := 'SELECT empno, korname,                                                               '+
                    '       (select codename from pyccode where codeid=''I112'' and codeno=A.paycl)     , '+
                    '       (select codename from pyccode where codeid=''I113'' and codeno=A.payra)     , '+
                    '       (select deptname from pycdept where orgnum=A.orgnum and deptcode=A.deptcode)  '+
                    '  FROM pehremas A                                                                    '+
                    ' WHERE rabasdate = '''+ vRabasdate +'''                                              '+
                    '   AND (empno like '''+ vEmp +'''||''%''   OR  korname like '''+ vEmp +'''||''%'')   '+
                    '   And empno not in (select empno from petremas where rabasdate='''+ vRabasdate +''')';
       ServiceName := 'HINSA_select';
       ClearFieldInfo;
       AddField('Field1' , ftString, 100);
       AddField('Field2' , ftString, 100);
       AddField('Field3' , ftString, 100);
       AddField('Field4' , ftString, 100);
       AddField('Field5' , ftString, 100);

       Close;
       SQL.Clear;
       SQL.Text := vParamSQL;            //Edit1.Text := Sql.Text;
       Open;
       if RecordCount > 0 then
       begin
            vEmpno                   := Fields[0].AsString;
            E_Empno.Text             := Fields[0].AsString;//+' - '+ Fields[1].AsString;
            L_Korname.ValueCaption   := Fields[1].AsString;
          //L_Payclname.ValueCaption := Fields[2].AsString;
            L_payraname.ValueCaption := Fields[3].AsString;
            L_Deptname.ValueCaption  := Fields[4].AsString;
{       end
       else
       begin
           if not((AEmpno = Workemp1) or (AEmpno = Workemp2) or (AEmpno = Workemp3) or
                  (AEmpno = Workemp4) or (AEmpno = Workemp5) or (Copy(AEmpno,1,1) = 'D')) then
            begin
                 MessageDlg('팀원평가대상자가 아닙니다.'+#13#13+
                            'HR팀에 문의하십시오.',mtInformation,[mbOK],0);
                 FM_Main.Close;
            end;
}
       end;
  end;
end;

procedure TFM_Main.E_EmpnoCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
     if  Fm_EmpForm.Korname <> '' then
     begin
          E_empno.Text            := Fm_EmpForm.empno;
          L_korname.ValueCaption  := Fm_EmpForm.Korname;
          EmpnoFind(E_Empno.Text);

          OpinionView;
     end;
end;

procedure TFM_Main.E_EmpnoInitPopup(Sender: TObject);
begin
     Fm_EmpForm.Edit        := TOnWinPopupEdit(Sender);
     Fm_EmpForm.empno       := E_empno.Text;
     Fm_EmpForm.SqlOpen;
     TOnWinPopupEdit(Sender).PopupControl := Fm_EmpForm ;
end;

procedure TFM_Main.E_EmpnoKeyPress(Sender: TObject; var Key: Char);
begin
  if  (Length(E_Empno.Text) = 4) and (key = #13) then
  begin
       EmpnoFind(E_Empno.Text);
       OpinionView;
  end;
end;

procedure TFM_Main.E_LoginEmpKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
       vEmpno := E_LoginEmp.Text;
       AEmpno := E_LoginEmp.Text;
       FormShow(Sender);
  end;
end;

end.
