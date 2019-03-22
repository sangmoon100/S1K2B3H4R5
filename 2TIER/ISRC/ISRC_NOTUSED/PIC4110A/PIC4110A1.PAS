{-------------------------------------------------------------------------------
  o 프로그램명 : ☆ Leader Pool 대상자 관리 ☆
  o 시스템명   : 종합인사정보시스템
  o 부시스템명 : 승격
  o 작성자     : 강륜종
  o 버전       : 1.00
  o 작성일자   : 2008.04.
  o 변경 이력사항
        버전 일자       작성자   변경내용                   처리명세서 반영여부

-------------------------------------------------------------------------------}
unit PIC4110A1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, OnScheme, StdCtrls, OnFocusButton, OnOneInstance,
  Tmax_session, OnLineLabel, OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl,
  OnEditCombo, OnTmaxPersonEdit, ImgList, OnShapeLabel,
  OnSkinBtn, OnPopupEdit, OnInsaCommon, OnCalendarUtil,
  OnStringUtils, OnTmaxCodeEdit, Db, Tmax_DataSetText, OnListbox,
  OnTmaxDeptEdit, OnEditMemo, Tmax_DmlSet, OnRegistry, MemDS,
  DBAccess, Ora, OnEditNumCtl, OnEditMdate, OnDBGrid, OnPersonEdit,
  Grids, DBGrids, OnGrDBGrid, Func, Pass, codetext, math;

type
  TAData = Array[1..80] of String;

  TMainForm = class(TForm)
    SF_Main: TOnSchemeForm;
    L_empdate: TOnShapeLabel;
    SB_Help: TStatusBar;
    L_Paycl: TOnShapeLabel;
    L_dept: TOnShapeLabel;
    L_Payra: TOnShapeLabel;
    BT_Exit: TOnFocusButton;
    OnShapeLabel1: TOnShapeLabel;
    BT_Save: TOnFocusButton;
    E_empno: TOnPersonPopupEdit;
    Panel2: TPanel;
    OraQuery1: TOraQuery;
    E_RabasYear: TOnMaskEdit;
    FileOpenDlg: TOpenDialog;
    E_Reference: TOnMemo;
    L_Gubun: TOnShapeLabel;
    OnShapeLabel3: TOnShapeLabel;
    OnShapeLabel2: TOnShapeLabel;
    Panel1: TPanel;
    BT_Leader1: TOnFocusButton;
    Label1: TLabel;
    BT_Print: TOnFocusButton;
    BT_Screen: TOnFocusButton;
    OnShapeLabel6: TOnShapeLabel;
    E_Rabasdate: TOnMaskEdit;
    Panel4: TPanel;
    OnShapeLabel4: TOnShapeLabel;
    OnShapeLabel5: TOnShapeLabel;
    Panel3: TPanel;
    RB_Leader1: TRadioButton;
    RB_Leader2: TRadioButton;
    Gubun1: TRadioButton;
    Gubun2: TRadioButton;
    Q_Master: TOraQuery;
    Q_MasterCHOICE: TStringField;
    Q_MasterSNO: TFloatField;
    Q_MasterRANK: TFloatField;
    Q_MasterCNT: TFloatField;
    Q_MasterRRATE: TStringField;
    Q_MasterCRATE: TFloatField;
    Q_MasterEMPNO: TStringField;
    Q_MasterJOBGUN: TStringField;
    Q_MasterSHIFTYN: TStringField;
    Q_MasterJOBGUNNAME: TStringField;
    Q_MasterPAYCL: TStringField;
    Q_MasterPAYCLNAME: TStringField;
    Q_MasterKORNAME: TStringField;
    Q_MasterAGE: TStringField;
    Q_MasterBUNDEPTNAME: TStringField;
    Q_MasterDEPTNAME: TStringField;
    Q_MasterDEPTNA3: TStringField;
    Q_MasterPAYRANAME: TStringField;
    Q_MasterLSCHGRNAME: TStringField;
    Q_MasterLSCHNM: TStringField;
    Q_MasterLMAJORCODE: TStringField;
    Q_MasterUNICODENAME: TStringField;
    Q_MasterUNIMAJORNAME: TStringField;
    Q_MasterUNIGRYM: TStringField;
    Q_MasterEMPDATE: TStringField;
    Q_MasterEMPCODE: TStringField;
    Q_MasterPAYCLDATE: TStringField;
    Q_MasterCPAYCLDATE: TStringField;
    Q_MasterPAYCLYYMM: TStringField;
    Q_MasterTOTSCR: TFloatField;
    Q_MasterPAYCLSCR: TFloatField;
    Q_MasterTOTPAYSCR: TFloatField;
    Q_MasterQPAYCLSCR: TFloatField;
    Q_MasterUPPOINT: TFloatField;
    Q_MasterSUMPRIZ: TFloatField;
    Q_MasterUPPOINT_2YEAR: TFloatField;
    Q_MasterPUNISH: TStringField;
    Q_MasterEDUCATE: TStringField;
    Q_Mastergrade00: TStringField;
    Q_Mastergrade01: TStringField;
    Q_Mastergrade02: TStringField;
    Q_Mastergrade03: TStringField;
    Q_Mastergrade04: TStringField;
    Q_MasterREFERENCE: TStringField;
    Panel5: TPanel;
    Label2: TLabel;
    Q_MasterRESULTSCRGRADE: TStringField;
    Q_MasterABILITYSCRGRADE: TStringField;
    Q_MasterFINALGRADE: TStringField;
    L_Orgnum: TOnShapeLabel;
    Edit1: TEdit;
    Q_MasterValuesGrade: TStringField;
    BT_Leader2: TOnFocusButton;
    Label3: TLabel;
    Label4: TLabel;
    BT_Before: TOnFocusButton;
    BT_Next: TOnFocusButton;
    procedure FormCreate(Sender: TObject);
    procedure BT_ExitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure E_empnoChange(Sender: TObject);
    procedure E_empnoKeyPress(Sender: TObject; var Key: Char);
    procedure BT_SaveClick(Sender: TObject);
    procedure E_empnoClick(Sender: TObject);
    procedure BT_Leader1Click(Sender: TObject);
    procedure BT_ScreenClick(Sender: TObject);
    procedure Q_MasterCalcFields(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure BT_Leader2Click(Sender: TObject);
    procedure BT_NextClick(Sender: TObject);
    procedure BT_BeforeClick(Sender: TObject);


  private
    { Private declarations }
    NewEmpCnt, RetEmpCnt : Integer;
    vEmpno   : String;
    vPaydate : String;
    vJuminid : String;
    vRabasdate  : String;

    procedure PrintSelect;
    procedure Convet(var Data: TAData; Value: String);
    procedure MakeCodeFile(Code : TOraQuery; Filenm : string; codeid : array of string);
    
  public
    { Public declarations }
    vRabasyear : String;
    
  end;

var
  MainForm: TMainForm;
  HomeDir : string;
  HFile   : string;
  vOpinion : String;

  sJobgun : String;

const
  CodeFile: string = 'PIC4110A.code';
  CodeId  : array[1..10] of string = ('I039','I112','I113','I001','I101','I221','I225','I223','I115','I330');

implementation

uses PIC4110A2, PIC4110A3;

{$R *.DFM}

procedure TMainForm.MakeCodeFile(Code : TOraQuery; Filenm : string; codeid : array of string);
var
  str : string;
   i  : integer;
begin
 codeToText(HomeDirOpen+'\list\'+trim(Filenm),'',0);
 with Code do begin
      close; sql.clear;
      sql.add('select codeid,codeno,codename from pyccode ');
      sql.add('where ');
      for i := 0 to High(codeid) do begin
        if i <> High(codeid) then sql.add(Format('(codeid = ''%s'') or',[codeid[i]]) );
        if i =  High(codeid) then sql.add(Format('(codeid = ''%s'')   ',[codeid[i]]) );
      end;
      sql.add('order by codeid,codeno ');
      open;
      while not eof do begin
         str := '';
         str := FieldByName('codeid').AsString+','+
                FieldByName('codeno').AsString+','+
                FieldByName('codename').AsString;
        codeToText('',str,1);
         next;
      end;
     close;
 end;
 codeToText('','',2);
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  SB_Help.Panels[1].Text := ' 종합인사시스템에 접속중입니다...';
  Application.ProcessMessages;

  OraConnect;

  OraQuery1.Session := Ora_Session;
  Q_Master.Session  := Ora_Session;

  SB_Help.Panels[1].Text := ' 종합인사시스템에 접속 완료.';
end;

procedure TMainForm.FormShow(Sender: TObject);
var CurDate, vUpManager1, vUpManager2 : String;
begin
  //출력폼 생성...
  SB_Help.Panels[1].Text := '코드화일을 받는중입니다 !!.(잠시만 기다리세요.)';

  MakeCodeFile(OraQuery1,codeFile,codeid);   //학교code와 과 code가져오기.

  SB_Help.Panels[1].Text := '';
  HFile := 'T'+inttostr(Application.handle)+'.tmp';

  
  //현승격일 셋팅.
  with OraQuery1 do
  begin
       Close;
       SQL.Clear;
       SQL.Add('select to_char(sysdate,''YYYYMMDDHH24MISSD'') s_date,');
       SQL.Add('       value1, Text2, Text3                          ');
       SQL.Add('  from pimupbas                                      ');
       SQL.Add(' where rabasdate = ''00000000''                      ');
       Open;
       E_rabasdate.Text := FieldByName('Value1').AsString;
       vRabasdate       := FieldByName('Value1').AsString;
       vUpManager1      := FieldByName('Text2').AsString;
       vUpManager2      := FieldByName('Text3').AsString;
       CurDate          := FieldByName('s_date').AsString;
       SB_Help.Panels[1].Text := copy(CurDate,1,4) +'/'+ copy(CurDate,5,2) +'/'+ copy(CurDate,7,2);

       if not ( (Pempno = vUpManager1) or (Pempno = vUpManager2) or (Copy(Pempno,1,1) = 'D') ) then
       begin
            Application.MessageBox(PChar('사용권한이 부족합니다. 자동종료 됩니다.'),'에러',mb_ok);
            Application.Terminate;
            Exit;
       end;
  end;


  //승격종합점수 기준년
  with OraQuery1 do
  begin
       Close;
       SQL.Clear;
       SQL.Add('SELECT value1                      ');
       SQL.Add('  FROM pimupbas                    ');
       SQL.Add(' WHERE rabasdate = :p_rabasdate    ');
       SQL.Add('   AND upcodeno = ''200''          ');
       ParamByName('p_rabasdate').AsString := E_rabasdate.Text;
       Open;

       vRabasyear := FieldBYName('Value1').Asstring;
       //vRabasyear := '2008';
       E_RabasYear.Text := vRabasyear;
  end;
         
  //대상자만 나타나도록 수정.
  E_empno.Sql := 'SELECT empno, korname, paycl, payra, orgnum, deptcode, pstate, payraname, payclname, deptname, deptna3 '+
                 '  From (                                                                                               '+
                 '        SELECT A.empno, b.korname, b.paycl, b.payra, b.orgnum, b.deptcode, B.pstate,                   '+
                 '              (select codename from pyccode where codeid=''I113'' and b.payra =codeno    ) payraname,  '+
                 '              (select codename from pyccode where codeid=''I112'' and b.paycl =codeno    ) payclname,  '+
                 '              (select deptname from pycdept where orgnum=b.orgnum and deptcode=b.deptcode) deptname,   '+
                 '              (select deptna3  from pycdept where orgnum=b.orgnum and deptcode=b.deptcode) deptna3     '+
                 '          FROM pimupmas A, pimpmas b                                                                   '+
                 '         WHERE A.Empno   = B.Empno                                                                     '+
                 '           AND Rabasdate = '''+ vRabasdate +'''                                                        '+
                 '           AND Leader in (''A'',''Z'')       )                                                         '+
                 ' WHERE Empno LIKE ''%s'' or Korname LIKE ''%s''                                                        '+
                 ' Order By 1                                                                                            ';
end;

procedure TMainForm.BT_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FileExists(HomeDir+'\list\'+HFile)       = True then DeleteFile(PChar(HomeDir+'\list\'+HFile));
  if FileExists(HomeDir+'\list\pic4110a.cod') = True then DeleteFile(PChar(HomeDir+'\list\pic4110a.cod'));

  Ora_Session.Connected := False;
  Action := caFree;
end;

procedure TMainForm.E_empnoChange(Sender: TObject);
begin
  if E_empno.empno <> '' then
  begin
       vEmpno := E_empno.empno;
       with OraQuery1 do
       begin
            Close;
            Sql.Clear;
            Sql.Add ('Select * from pimupmas                   ');
            Sql.Add (' Where Rabasdate = '''+ vRabasdate + ''' ');
            Sql.Add ('   AND Empno     = '''+ vEmpno     + ''' ');
            Sql.Add (' Order by empno                          ');
            Open;
            
            if      FieldByName('Leader').AsString = 'A' then L_Gubun.ValueCaption := 'Leader Pool 대상자'
            else if FieldByName('Leader').AsString = 'Z' then L_Gubun.ValueCaption := 'Leader Pool 후보자'
            else                                              L_Gubun.ValueCaption := '미 대상자.';

            //E_Reference.Text := FieldByName('Reference').AsString;
            vOpinion := FieldByName('Reference').AsString;
            if vOpinion <> '' then
            begin
                 while Pos(#10#10, vOpinion) > 0 do
                   vOpinion := SearchAndReplace(vOpinion, #10#10, #13#10);
            end;
            E_Reference.Text := vOpinion;
       end;

       L_Paycl.ValueCaption  := GetCodeName('I112',E_empno.paycl);
       L_Payra.ValueCaption  := GetCodeName('I113',E_empno.payra);
       L_empdate.ValueCaption:= Hinsa_DisplayDate(GetEmpdate(E_empno.empno),'-');;
       L_Orgnum.ValueCaption := E_empno.Orgnum;
       L_dept.ValueCaption   := GetDeptName(E_empno.Orgnum, E_empno.deptcode);

       E_Reference.SetFocus;
       SB_Help.Panels[1].Text := ' 조회 완료.';
  end;
end;

procedure TMainForm.E_empnoKeyPress(Sender: TObject; var Key: Char);
begin
  if ( Key = Chr(13) ) then
  begin
       Key := #0;
       E_empnoChange(Sender);
       E_Reference.SetFocus;
  end;
end;

procedure TMainForm.BT_SaveClick(Sender: TObject);
begin 
  with OraQuery1 do
  begin
       Close;
       Sql.Clear;
       Sql.Add ('Select 1 from pimupmas                         ');
       Sql.Add (' Where Rabasdate = '''+ vRabasdate      + '''  ');
       Sql.Add ('   AND Empno     = '''+ vEmpno          + '''  ');
       Sql.Add ('   AND Leader in (''A'',''Z'')                 ');
       Open;

       if RecordCount = 0 then
       begin
            ShowMessage(' 해당 사원은 대상자가 아닙니다.');
            Exit;
       end;

       vOpinion := E_Reference.Text;
       if E_Reference.Text <> '' then
       begin
            while Pos(#10#10, vOpinion) > 0 do // ORACLE에 저장된  #13#10 을  #10#10 으로 변환
                  vOpinion := SearchAndReplace(vOpinion, #10#10, #13#10);
       end;

       Close;
       Sql.Clear;
       Sql.Add ('Update pimupmas                           ');
       Sql.Add ('   Set Reference = '''+ vOpinion    + ''' ');
       Sql.Add (' Where Rabasdate = '''+ vRabasdate  + ''' ');
       Sql.Add ('   AND Empno     = '''+ vEmpno      + ''' ');//  Edit1.Text := sql.text;
       ExecSql;
  end;

  SB_Help.Panels[1].Text := '저장 완료.';
end;

procedure TMainForm.E_empnoClick(Sender: TObject);
begin
  E_empno.empno          := '';
  E_empno.Text           := '';
  L_Paycl.ValueCaption   := '';
  L_Payra.ValueCaption   := '';
  L_empdate.ValueCaption := '';
  L_dept.ValueCaption    := '';
  E_Reference.Text       := '';
end;

procedure TMainForm.BT_Leader1Click(Sender: TObject);
var
  Dest: TStringList;
  I   : Integer;
  Data: TAData;
  Excel_name: String;
begin
  if MessageDlg('Leader Pool 대상자를 지정하시겠습니까 ?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then  System.Exit;

  if FileOpenDlg.Execute then Excel_name := FileOpenDlg.FileName ;

  Dest := TStringList.Create;
  Dest.LoadFromFile(Excel_name);

  if Excel_name <> '' then  //Leader ='A' Leader Pool 대상자.
  begin                     //Leader ='Z' Leader Pool 후보자.
       with OraQuery1 do       //초기화....
       begin
            Close;
            SQL.Clear;
            SQL.Add('update pimupmas                          ');
            SQL.Add('   set leader    = ''''                  ');
            SQL.Add(' where rabasdate = '''+ vRabasdate + ''' ');
            ExecSQL;
       end;

       for I := 0 to Dest.Count - 1 do
       begin
            Data[3] := '';  //초기화.
            Convet(Data, Dest.Strings[I]);

            if (Data[1] <> '사번') and (Data[1] <> '') then
            begin
                 with OraQuery1 do //선택사원 업데이트..
                 begin
                      Close;
                      SQL.Clear;
                      SQL.Add('update pimupmas                ');
                      SQL.Add('   set leader    = :leader     ');
                      SQL.Add(' where rabasdate = :rabasdate  ');
                      SQL.Add('   and empno     = :empno      ');

                      ParamByName('rabasdate').AsString := vRabasdate;
                      ParamByName('empno').AsString     := Data[1];
                      ParamByName('leader').AsString    := Data[2];
                      ExecSQL;
                 end;
            end;
       end;
       Dest.Free;

       MessageDlg('◈완료◈ 하였습니다.',mtInformation,[mbOk],0);
  end;
end;


procedure TMainForm.BT_Leader2Click(Sender: TObject);
var
  Dest: TStringList;
  I   : Integer;
  Data: TAData;
  Excel_name: String;
begin
  //참고사항에는 콤마 작은따옴표 없이 한줄로 작성하여 업로드 후 프로그램에서 편집.
  if MessageDlg('Leader Pool 대상자를 지정하시겠습니까 ?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then  System.Exit;

  if FileOpenDlg.Execute then Excel_name := FileOpenDlg.FileName ;

  Dest := TStringList.Create;
  Dest.LoadFromFile(Excel_name);

  if Excel_name <> '' then  //Leader ='A' Leader Pool 대상자.
  begin                     //Leader ='Z' Leader Pool 후보자.
       with OraQuery1 do       //초기화....
       begin
            Close;
            SQL.Clear;
            SQL.Add('update pimupmas                          ');
            SQL.Add('   set leader    = '''',                 ');
            SQL.Add('       reference = ''''                  ');
            SQL.Add(' where rabasdate = '''+ vRabasdate + ''' ');
            ExecSQL;
       end;

       for I := 0 to Dest.Count - 1 do
       begin
            //Data[3] := '';  //초기화.
            Convet(Data, Dest.Strings[I]);

            if (Data[1] <> '사번') and (Data[1] <> '') then
            begin
                 vOpinion := Data[3];
                 if vOpinion <> '' then
                 begin
                      while Pos(#10#10, vOpinion) > 0 do // ORACLE에 저장된 #10#10 을 #13#10 으로 변환
                            vOpinion := SearchAndReplace(vOpinion, #10#10, #13#10);
                 end;

                 with OraQuery1 do //선택사원 업데이트..
                 begin
                      Close;
                      SQL.Clear;
                      SQL.Add('update pimupmas                ');
                      SQL.Add('   set leader    = :leader ,   ');
                      SQL.Add('       reference = :reference  ');
                      SQL.Add(' where rabasdate = :rabasdate  ');
                      SQL.Add('   and empno     = :empno      ');

                      ParamByName('rabasdate').AsString := vRabasdate;
                      ParamByName('empno').AsString     := Data[1];
                      ParamByName('leader').AsString    := Data[2];
                      ParamByName('reference').AsString := vOpinion;
                      ExecSQL;
                 end;
            end;
       end;
       Dest.Free;

       MessageDlg('◈완료◈ 하였습니다.',mtInformation,[mbOk],0);
  end;
end;

procedure TMainForm.Convet(var Data: TAData; Value: String);
var
  I, J, K: Integer;
  Temp: String;
begin
  J := 1;
  K := 1;
  Temp := '';

  for I := 1 to Length(Value) do
  begin
    if K = 79 then J := J;
    if Value[I] <> ',' then
    begin
         if Value[I] <> ' ' then
         begin
              Temp := Temp + Value[I];
              Inc(J);
         end;
    end
    else
    begin
         Data[K] := Temp;
         Temp := '';
         J := 1;
         Inc(K);
    end;
  end;
  Data[K] := Temp;
end;


procedure TMainForm.BT_ScreenClick(Sender: TObject);
begin
  if Gubun1.Checked = True then FM_Print1 := TFM_Print1.Create(self); //평가부서로
  if Gubun2.Checked = True then FM_Print2 := TFM_Print2.Create(self); //현부서로...

  Screen.Cursor:=crDefault;

  PrintSelect;

  if Gubun1.Checked = True then
  begin
       if      (Q_Master.RecordCount > 0) and (TComponent(Sender).Tag = 1) then FM_Print1.QuickRep1.Preview//화면 출력
       else if (Q_Master.RecordCount > 0) and (TComponent(Sender).Tag = 2) then FM_Print1.QuickRep1.Print  //프린터 출력
       else    Application.MessageBox('자료가 없습니다.','알림',mb_ok+mb_IconStop);
  end
  else
  begin
       if      (Q_Master.RecordCount > 0) and (TComponent(Sender).Tag = 1) then FM_Print2.QuickRep1.Preview//화면 출력
       else if (Q_Master.RecordCount > 0) and (TComponent(Sender).Tag = 2) then FM_Print2.QuickRep1.Print  //프린터 출력
       else    Application.MessageBox('자료가 없습니다.','알림',mb_ok+mb_IconStop);
  end;

  if Gubun1.Checked = True then FM_Print1.Free;
  if Gubun2.Checked = True then FM_Print2.Free;
end;

procedure TMainForm.PrintSelect;
var vLeader : String;
begin
  if      RB_Leader1.Checked then vLeader := 'A'
  else if RB_Leader2.Checked then vLeader := 'Z';

  with Q_Master do
  begin
      Close;
      SQL.Clear;      //인사 현마스터 기준으로 부문별 인쇄
      SQL.Add('select a.empno, a.korname, a.paycl, a.jobgun, FinalGrade, ValuesGrade, AbilityscrGrade, ResultscrGrade, Reference, rank, cnt, CHOICE, ');
//      SQL.Add('       rank() over (partition by a.extcode, c.paycl order by a.deptcode, c.rank, a.empno) sno,                                        ');
      SQL.Add('       rank() over (partition by substr(a.deptcode,1,1)||''0000'' order by a.deptcode, c.rank, a.empno) sno,                          ');
      SQL.Add('       decode(Substr(c.rank/c.cnt*100,1,1),''.'', ''0''||round(c.rank/c.cnt*100,1)||''%'', round(c.rank/c.cnt*100,1)||''%'') RRATE,   ');
      SQL.Add('       round(c.cnt * 0.45,0) CRATE, a.shiftyn,  ''(''||TO_Char(KORAGE)||'')'' age,                                                    ');
      SQL.Add('       nvl((select codefname from pyccode where codeid=''I115'' and codeno = c.jobgun),'''') jobgunname,                              ');
      SQL.Add('       nvl((select codename from pyccode where codeid=''I112'' and codeno = b.paycl),'''') payclname,                                 ');
    //SQL.Add('       nvl((select deptname from pycdept where orgnum=a.orgnum and deptcode = a.extcode),'''')  bundeptname,                          ');
      SQL.Add('       (select rtrim(deptname) from pycdept where orgnum=a.orgnum and deptcode = substr(a.deptcode,1,1)||''0000'') bundeptname,        ');
      SQL.Add('       nvl((select deptname from pycdept where orgnum=a.orgnum and deptcode = a.deptcode),'''') deptname,                             ');
      SQL.Add('       nvl((select deptna3  from pycdept where orgnum=a.orgnum and deptcode = a.deptcode),'''') deptna3,                              ');
      SQL.Add('       nvl((select codename from pyccode where codeid=''I113'' and codeno = b.payra),'''')     payraname,                             ');
      SQL.Add('       nvl((select codename from pyccode where codeid=''I221'' and codeno = b.lschgr),'''')    lschgrname,                            ');
      SQL.Add('       b.lschnm,  substr(b.lschgrym,1,4) lschgrym,                                                                                    ');
      SQL.Add('       nvl((select codename from pyccode where codeid=''I225'' and codeno = b.lmajorcode),'''') lmajorcode,                           ');
      SQL.Add('       nvl((decode(b.unicode,'''',(select codename from pyccode where codeid=''I223'' and codeno = b.LSCHCODE),                       ');
      SQL.Add('                                   ''9000'',''학사(학점은행)'',     ''9990'',''학사(학점은행)'',                                      ');
      SQL.Add('                                  (select codename from pyccode where codeid=''I223'' and codeno = b.unicode))),''고졸'') unicodename,');
      SQL.Add('       decode(b.lschgr,''69'',nvl((select codename from pyccode where codeid=''I225'' and codeno=b.unimajor),''''),'''') unimajorname,');
      SQL.Add('       decode(b.lschgr,''69'',substr(b.unigrym,1,4),'''') unigrym,                                                         ');
      SQL.Add('       substr(b.empdate,1,4) || ''/'' || substr(b.empdate,5,2) || ''/'' || substr(b.empdate,7,2) empdate,                  ');
      SQL.Add('       nvl((select codename from pyccode where codeid=''I101'' and codeno = b.empcode),'''') empcode,                      ');
      SQL.Add('       substr(a.paycldate,1,4) || ''/'' || substr(a.paycldate,5,2) || ''/'' || substr(a.paycldate,7,2) paycldate,          ');
      SQL.Add('       ''(''||substr(b.cpaycldate,1,4)||''/''||substr(b.cpaycldate,5,2)||''/''||substr(b.cpaycldate,7,2)||'')'' cpaycldate,');
      SQL.Add('       a.payclyy || ''년'' || a.payclmm || ''월'' payclyymm,                                                               ');
      SQL.Add('       a.totscr,  a.payclscr,  nvl(a.totscr,0) + nvl(a.payclscr,0) totpayscr,                                              ');
      SQL.Add('       a.qpayclscr, a.uppoint,  nvl(a.prizescr,0) + nvl(a.suggscr,0) sumpriz,  a.uppoint_2year,                            ');
      SQL.Add('       (SELECT punish  FROM pimupex WHERE rabasdate = '''+vRabasdate+''' and empno=a.empno) punish,                        ');
      SQL.Add('       (SELECT educate FROM pimupex WHERE rabasdate = '''+vRabasdate+''' and empno=a.empno) educate                        ');
      SQL.Add('  from pimupmas a, pimpmas b,                                                                                              ');
      SQL.Add('     (Select empno, FinalGrade, ValuesGrade, AbilityscrGrade, ResultscrGrade from pehevhis                                 ');
      SQL.Add('       where rabasyear='''+vRabasyear+''') X,                                                                              ');
      SQL.Add('     (select a.empno, a.jobgun, a.paycl, b.cnt,                                                                            ');
      SQL.Add('             rank() over (partition by a.jobgun, a.paycl  order by a.tot desc, a.gijun1 desc, a.gijun2 desc,               ');
      SQL.Add('                                                                   a.gijun3 desc,a.gijun4 desc) rank                       ');
      SQL.Add('       from (select a.empno,  a.paycl,                                                                                     ');
      SQL.Add('                    nvl(a.totscr,0) + nvl(a.payclscr,0)  tot,                                                              ');
      SQL.Add('                    nvl(a.qpayclscr,0)                   gijun1,                                                           ');
      SQL.Add('                    nvl(a.uppoint,0)                     gijun2,                                                           ');
      SQL.Add('                    nvl(a.prizescr,0) + nvl(a.suggscr,0) gijun3,                                                           ');
      SQL.Add('                    nvl(uppoint_2year,0)                 gijun4,                                                           ');
      SQL.Add('                    b.evjobgun                           jobgun                                                            ');
      SQL.Add('               from pimupmas a, pimragroup b                                                                               ');
      SQL.Add('              where a.rabasdate = '''+vRabasdate+'''                                                                       ');
      SQL.Add('                and b.rabasdate = '''+vRabasdate+'''                                                                       ');
      SQL.Add('                and b.ragroup   = ''01''                                                                                   ');
      SQL.Add('                and a.paycl     = b.rapaycl                                                                                ');
      SQL.Add('                and a.jobgun    = b.rajobgun                                                                               ');
      SQL.Add('                ) a,                                                                                                       ');
      SQL.Add('            (select count(*) cnt,          b.evjobgun jobgun,        a.paycl                                               ');
      SQL.Add('               from pimupmas a, pimragroup b                                                                               ');
      SQL.Add('              where a.rabasdate = '''+vRabasdate+'''                                                                       ');
      SQL.Add('                and b.rabasdate = '''+vRabasdate+'''                                                                       ');
      SQL.Add('                and b.ragroup   = ''01''                                                                                   ');
      SQL.Add('                and a.paycl     = b.rapaycl                                                                                ');
      SQL.Add('                and a.jobgun    = b.rajobgun                                                                               ');
      SQL.Add('              group by b.evjobgun, a.paycl) b                                                                              ');
      SQL.Add('        where a.paycl  = b.paycl                                                                                           ');
      SQL.Add('          and a.jobgun = b.jobgun) c                                                                                       ');
      SQL.Add('where a.rabasdate = '''+vRabasdate+'''                                                                                     ');
      SQL.Add('  and a.empno     = b.empno                                                                                                ');
      SQL.Add('  and a.empno     = c.empno(+)                                                                                             ');
      SQL.Add('  and a.empno     = X.empno                                                                                                ');
      SQL.Add('  and Leader      = '''+ vLeader +'''                                                                                      ');
    //SQL.Add('order by a.extcode, a.deptcode, c.rank, sno                                                                                ');
      SQL.Add('order by substr(a.deptcode,1,1)||''0000'', a.deptcode, c.rank, sno                                                         ');
      Edit1.Text := Sql.Text;
      Open;
  end;
end;

procedure TMainForm.Q_MasterCalcFields(DataSet: TDataSet);
var
  gradeyear1, gradeyear2, gradeyear3, gradeyear4, gradeyear5 : String;
begin
  gradeyear1 := inttostr(strtoint(vRabasyear) - 4);
  gradeyear2 := inttostr(strtoint(vRabasyear) - 3);
  gradeyear3 := inttostr(strtoint(vRabasyear) - 2);
  gradeyear4 := inttostr(strtoint(vRabasyear) - 1);
  gradeyear5 := inttostr(strtoint(vRabasyear));

  with OraQuery1 do
  begin
      Close;
      SQL.Clear;
      SQL.Add('select finalgrade from pehevhis ');
      SQL.Add(' where empno     = :empno       ');
      SQL.Add('   and rabasyear = :rabasyear   ');
      SQL.Add('   and (trim(upscore) is not null or upscore <> 0) ');

      //if (Copy(Q_Master.FieldByName('paycldate').AsString,1,4) <= gradeyear1) then  //리더풀은 재급기간 무시
      begin
           Close;
           ParamByName('empno').AsString     := Q_Master.FieldByName('empno').AsString;
           ParamByName('rabasyear').AsString := gradeyear1;
           Open;
           if   RecordCount = 0 then Q_Mastergrade00.Value := ''
           else                      Q_Mastergrade00.Value := OraQuery1.FieldByName('finalgrade').AsString;
      end;

      //if (Copy(Q_Master.FieldByName('paycldate').AsString,1,4) <= gradeyear2) then
      begin
           Close;
           ParamByName('empno').AsString     := Q_Master.FieldByName('empno').AsString;
           ParamByName('rabasyear').AsString := gradeyear2;
           Open;
           if   RecordCount = 0 then Q_Mastergrade01.Value := ''
           else                      Q_Mastergrade01.Value := OraQuery1.FieldByName('finalgrade').AsString;
      end;

      //if (Copy(Q_Master.FieldByName('paycldate').AsString,1,4) <= gradeyear3) then
      begin
           Close;
           ParamByName('empno').AsString     := Q_Master.FieldByName('empno').AsString;
           ParamByName('rabasyear').AsString := gradeyear3;
           Open;
           if   RecordCount = 0 then Q_Mastergrade02.Value := ''
           else                      Q_Mastergrade02.Value := OraQuery1.FieldByName('finalgrade').AsString;
      end;

      //if (Copy(Q_Master.FieldByName('paycldate').AsString,1,4) <= gradeyear4) then
      begin
           Close;
           ParamByName('empno').AsString     := Q_Master.FieldByName('empno').AsString;
           ParamByName('rabasyear').AsString := gradeyear4;
           Open;
           if   RecordCount = 0 then Q_Mastergrade03.Value := ''
           else                      Q_Mastergrade03.Value := OraQuery1.FieldByName('finalgrade').AsString;
      end;

      //if (Copy(Q_Master.FieldByName('paycldate').AsString,1,4) <= gradeyear5) then
      begin
           Close;
           ParamByName('empno').AsString     := Q_Master.FieldByName('empno').AsString;
           ParamByName('rabasyear').AsString := gradeyear5;
           Open;
           if    RecordCount = 0 then Q_Mastergrade04.Value := ''
           else                       Q_Mastergrade04.Value := OraQuery1.FieldByName('finalgrade').AsString;
      end;

      {//2008년말 하드코딩.
      if Q_Master.FieldByName('empno').AsString ='0161' then  Q_Mastergrade02.Value := 'S';  //김진기
      if Q_Master.FieldByName('empno').AsString ='1700' then  Q_Mastergrade02.Value := 'B0'; //홍도희
      if Q_Master.FieldByName('empno').AsString ='0521' then  Q_Mastergrade02.Value := 'S';  //남택석
      if Q_Master.FieldByName('empno').AsString ='1106' then  Q_Mastergrade02.Value := 'S';  //최병기
      if Q_Master.FieldByName('empno').AsString ='0213' then  Q_Mastergrade02.Value := 'S';  //오정윤
      if Q_Master.FieldByName('empno').AsString ='0153' then  Q_Mastergrade02.Value := 'B+'; //류호철
      if Q_Master.FieldByName('empno').AsString ='0802' then  Q_Mastergrade02.Value := 'S';
      
      if Q_Master.FieldByName('empno').AsString ='0842' then  Q_Mastergrade02.Value := 'S';  //최진태
      if Q_Master.FieldByName('empno').AsString ='1647' then  Q_Mastergrade02.Value := 'A';  //이민수
      if Q_Master.FieldByName('empno').AsString ='1152' then  Q_Mastergrade02.Value := 'S';  //최길민
      if Q_Master.FieldByName('empno').AsString ='2056' then  Q_Mastergrade02.Value := 'S';  //정양기

      if Q_Master.FieldByName('empno').AsString ='1407' then  Q_Mastergrade02.Value := 'S';  //이왕수
      if Q_Master.FieldByName('empno').AsString ='1190' then  Q_Mastergrade02.Value := 'S';  //장지수
      if Q_Master.FieldByName('empno').AsString ='1395' then  Q_Mastergrade02.Value := 'S';  //김충석
      if Q_Master.FieldByName('empno').AsString ='0193' then  Q_Mastergrade02.Value := 'A';  //윤상철
      if Q_Master.FieldByName('empno').AsString ='1404' then  Q_Mastergrade02.Value := 'B0'; //도진남
      if Q_Master.FieldByName('empno').AsString ='2055' then  Q_Mastergrade02.Value := 'S';  //이재준  }
  end;
end;

procedure TMainForm.BT_NextClick(Sender: TObject);
begin
  vEmpno := E_empno.empno;
  with OraQuery1 do
  begin
       Close;
       Sql.Clear;
       Sql.Add ('Select empno, korname from pimupmas      ');
       Sql.Add (' Where Rabasdate = '''+ vRabasdate + ''' ');
       Sql.Add ('   AND Leader in (''A'',''Z'')           ');
       Sql.Add ('   AND Empno     > '''+ vEmpno     + ''' ');
       Sql.Add (' Order by empno                          ');
       Open;

       E_empno.empno   := Fields[0].AsString;
       E_empno.korname := Fields[1].AsString;
  end;
  E_empnoChange(Sender);

  E_empno.Text := E_empno.empno + ' - ' + E_empno.korname;
end;

procedure TMainForm.BT_BeforeClick(Sender: TObject);
begin
  vEmpno := E_empno.empno;
  with OraQuery1 do
  begin
       Close;
       Sql.Clear;
       Sql.Add ('Select empno, korname from pimupmas      ');
       Sql.Add (' Where Rabasdate = '''+ vRabasdate + ''' ');
       Sql.Add ('   AND Leader in (''A'',''Z'')           ');
       Sql.Add ('   AND Empno     < '''+ vEmpno     + ''' ');
       Sql.Add (' Order by empno desc                     ');
       Open;

       E_empno.empno   := Fields[0].AsString;
       E_empno.korname := Fields[1].AsString;
  end;
  E_empnoChange(Sender);

  E_empno.Text := E_empno.empno + ' - ' + E_empno.korname;
end;

end.
