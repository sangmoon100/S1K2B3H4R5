unit pez2040a2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OnScheme, ExtCtrls, StdCtrls, OnFocusButton, OnShapeLabel,
  OnEditBaseCtrl, OnEditStdCtrl, OnEditMemo, Printers, OnCheckBox,
  OnEditNumCtl, OnRadioBtn, Db, TmaxFunc, Math;

type
  TFM_Result1 = class(TForm)
    SF_Main: TOnSchemeForm;
    L_Korname: TOnShapeLabel;
    L_Payra: TOnShapeLabel;
    L_Paycl: TOnShapeLabel;
    L_E2Korname: TOnShapeLabel;
    L_E1Korname: TOnShapeLabel;
    OnCheckBox1: TOnCheckBox;
    OnShapeLabel12: TOnShapeLabel;
    OnShapeLabel13: TOnShapeLabel;
    OnShapeLabel16: TOnShapeLabel;
    OnShapeLabel17: TOnShapeLabel;
    OnShapeLabel18: TOnShapeLabel;
    OnMemo1: TOnMemo;
    OnMemo2: TOnMemo;
    OnMemo3: TOnMemo;
    OnMemo4: TOnMemo;
    OnShapeLabel14: TOnShapeLabel;
    OnShapeLabel15: TOnShapeLabel;
    L_Capacity1: TOnShapeLabel;
    L_Capacity2: TOnShapeLabel;
    L_Capacity4: TOnShapeLabel;
    L_Capacity3: TOnShapeLabel;
    L_Capacity6: TOnShapeLabel;
    L_Capacity5: TOnShapeLabel;
    L_Capacity7: TOnShapeLabel;
    L_Capacity8: TOnShapeLabel;
    L_Capacity9: TOnShapeLabel;
    L_Capacity0: TOnShapeLabel;
    E_Opinion1: TOnMemo;
    E_Opinion2: TOnMemo;
    OnShapeLabel30: TOnShapeLabel;
    OnShapeLabel31: TOnShapeLabel;
    OnShapeLabel32: TOnShapeLabel;
    OnShapeLabel33: TOnShapeLabel;
    OnShapeLabel34: TOnShapeLabel;
    OnShapeLabel35: TOnShapeLabel;
    OnShapeLabel36: TOnShapeLabel;
    OnShapeLabel37: TOnShapeLabel;
    OnShapeLabel38: TOnShapeLabel;
    E_Opinion8: TOnShapeLabel;
    E_Opinion9: TOnMemo;
    RB_Opinion35: TOnRadioButton;
    RB_Opinion34: TOnRadioButton;
    RB_Opinion33: TOnRadioButton;
    RB_Opinion32: TOnRadioButton;
    RB_Opinion31: TOnRadioButton;
    RB_Opinion45: TOnRadioButton;
    RB_Opinion44: TOnRadioButton;
    RB_Opinion43: TOnRadioButton;
    RB_Opinion42: TOnRadioButton;
    RB_Opinion41: TOnRadioButton;
    RB_Opinion55: TOnRadioButton;
    RB_Opinion54: TOnRadioButton;
    RB_Opinion53: TOnRadioButton;
    RB_Opinion52: TOnRadioButton;
    RB_Opinion51: TOnRadioButton;
    Label16: TLabel;
    RB_Opinion61: TOnRadioButton;
    RB_Opinion62: TOnRadioButton;
    RB_Opinion63: TOnRadioButton;
    RB_Opinion75: TOnRadioButton;
    RB_Opinion74: TOnRadioButton;
    RB_Opinion73: TOnRadioButton;
    RB_Opinion72: TOnRadioButton;
    RB_Opinion71: TOnRadioButton;
    OnCheckBox2: TOnCheckBox;
    OnShapeLabel11: TOnShapeLabel;
    OnShapeLabel39: TOnShapeLabel;
    OnShapeLabel41: TOnShapeLabel;
    OnShapeLabel42: TOnShapeLabel;
    E_upOpinion1: TOnMemo;
    OnShapeLabel43: TOnShapeLabel;
    E_upOpinion2: TOnMemo;
    E_upOpinion3: TOnMemo;
    E_upOpinion4: TOnMemo;
    OnMemo12: TOnMemo;
    OnCheckBox3: TOnCheckBox;
    OnShapeLabel49: TOnShapeLabel;
    E_grOpinion2: TOnMemo;
    E_grOpinion3: TOnMemo;
    OnMemo17: TOnMemo;
    BT_ScrPrint: TOnFocusButton;
    BT_Exit: TOnFocusButton;
    L_upscore1: TOnNumberEdit;
    L_upscore2: TOnNumberEdit;
    L_upscore3: TOnNumberEdit;
    L_upscore4: TOnNumberEdit;
    L_upscore5: TOnNumberEdit;
    Panel225: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    L_grpscore1: TOnNumberEdit;
    L_grpscore2: TOnNumberEdit;
    L_grpscore3: TOnNumberEdit;
    L_grpscore4: TOnNumberEdit;
    Panel5: TPanel;
    Panel6: TPanel;
    E_grOpinion1: TOnMemo;
    OnMemo5: TOnMemo;
    E_Capacity0: TOnNumberEdit;
    procedure BT_ScrPrintClick(Sender: TObject);
    procedure BT_ExitClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FM_Result1: TFM_Result1;

implementation

uses pez2040a1;

{$R *.DFM}

procedure TFM_Result1.BT_ScrPrintClick(Sender: TObject);
begin
  BT_Exit.Visible       := False;
  BT_ScrPrint.Visible   := False;

  Printer.Orientation   := poLandscape;
  FM_Result1.PrintScale := poPrintToFit;
  FM_Result1.Print;

  BT_Exit.Visible       := True;
  BT_ScrPrint.Visible   := True;
end;

procedure TFM_Result1.BT_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TFM_Result1.FormShow(Sender: TObject);
var i       : Integer;
    FL_Comp : TOnRadioButton;
    vdate, vEmp : String;
begin
  vDate := FM_Main.vRabasdate;
  vEmp  := FM_Main.TMaxEmp.Fields[1].AsString;
  
  //임원평가 마스터 Read..
  with FM_Main.TMaxDataSet do
  begin
       ServiceName := 'PEZ2000A_mas2';
       Close;
       Sql.Clear;
       Sql.Text := 'select empno, korname, juminid, empdate, paydunm, orgnum,                                     '+
                   '      (select deptname from pycdept where orgnum=a.orgnum  and deptcode=a.deptcode) deptname, '+
                   '      (select deptname from pycdept where orgnum=a.orgnum  and deptcode=a.jobdept ) jobdeptnm,'+
                   '      (select codename from pyccode where codeid= ''I112'' and codeno  =a.paycl   ) payclnm,  '+
                   '      (select codename from pyccode where codeid= ''I113'' and codeno  =a.payra   ) payranm,  '+
                   '       cpaycldate,   cpayradate,   selfyn,    selfconyn,    selfcondate,                      '+
                   '      (select codename from pyccode where codeid= ''I113'' and codeno  =a.dwe1payra) e1payra, '+
                   '      (select codename from pyccode where codeid= ''I113'' and codeno  =a.dwe2payra) e2payra, '+
                   '      (select codename from pyccode where codeid= ''I113'' and codeno  =a.dwe3payra) e3payra, '+
                   '       dwe1empno, dwe1korname, dwe1conyn, dwe1condate, dwe1objyn, dwe1objdate,                '+
                   '       dwe2empno, dwe2korname, dwe2conyn, dwe2condate, dwe2objyn, dwe2objdate,                '+
                   '       dwe3empno, dwe3korname, dwe3conyn, dwe3condate                                         '+
                   '  from PEZCAMAS A                                                                             '+
                   ' where rabasdate = '''+ vDate +'''                                                            '+#13+
                   '   and empno     = '''+ vEmp  +'''                                                            ';
       ClearFieldInfo;
       AddField('EMPNO'       , ftString, 4);
       AddField('KORNAME'     , ftString, 20);
       AddField('JUMINID'     , ftString, 14);
       AddField('EMPDATE'     , ftString, 8);
       AddField('PAYDUNM'     , ftString, 30);
       AddField('ORGNUM'      , ftString, 3);
       AddField('DEPTNAME'    , ftString, 60);
       AddField('JOBDEPTNM'   , ftString, 60);
       AddField('PAYCLNM'     , ftString, 20);
       AddField('PAYRANM'     , ftString, 20);
       AddField('CPAYCLDATE'  , ftString, 18);
       AddField('CPAYRADATE'  , ftString, 18);
       AddField('SELFYN'      , ftString, 1);
       AddField('SELFCONYN'   , ftString, 1);
       AddField('SELFCONDATE' , ftString, 14);
       AddField('E1PAYRA'     , ftString, 20);
       AddField('E2PAYRA'     , ftString, 20);
       AddField('E3PAYRA'     , ftString, 20);
       AddField('E1EMPNO'     , ftString, 4);
       AddField('E1KORNAME'   , ftString, 20);
       AddField('E1CONYN'     , ftString, 1);
       AddField('E1CONDATE'   , ftString, 8);
       AddField('E1OBJYN'     , ftString, 1);
       AddField('E1OBJDATE'   , ftString, 8);
       AddField('E2EMPNO'     , ftString, 4);
       AddField('E2KORNAME'   , ftString, 20);
       AddField('E2CONYN'     , ftString, 1);
       AddField('E2CONDATE'   , ftString, 8);
       AddField('E2OBJYN'     , ftString, 1);
       AddField('E2OBJDATE'   , ftString, 8);
       AddField('E3EMPNO'     , ftString, 4);
       AddField('E3KORNAME'   , ftString, 20);
       AddField('E3CONYN'     , ftString, 1);
       AddField('E3CONDATE'   , ftString, 8);       //E_Sql.Text := sql.text;
       Open;

       L_Korname.ValueCaption   :=  FieldByName('KORNAME').AsString;
       L_Payra.ValueCaption     :=  FieldByName('PAYRANM').AsString;
       L_Paycl.ValueCaption     :=  FieldByName('PAYDUNM').AsString;
       L_E1Korname.ValueCaption :=  FieldByName('E1KORNAME').AsString;
       L_E2Korname.ValueCaption :=  FieldByName('E2KORNAME').AsString;
       /////////////////////////////////////////////////////////////////////////


       /////////////////////////////////////////////////////////////////////////
       ServiceName := 'PEZ2010A_sel1';
       Close;
       Sql.Clear;
       Sql.Text := 'select empno,                                                    '+#13+
                   '       nvl(Capacity1,0),   nvl(Capacity2,0),   nvl(Capacity3,0), '+#13+
                   '       nvl(Capacity4,0),   nvl(Capacity5,0),   nvl(Capacity6,0), '+#13+
                   '	   nvl(Capacity7,0),   nvl(Capacity8,0),   nvl(Capacity9,0), '+#13+
                   '       nvl(Opinion1,''''), nvl(Opinion2,''''), nvl(Opinion3,0) , '+#13+
                   '       nvl(Opinion4,0),    nvl(Opinion5,0),    nvl(Opinion6,0),  '+#13+
                   '	   nvl(Opinion7,''''), nvl(Opinion8,''''), nvl(Opinion9,'''')'+#13+
                   '  from pezsemas                                                  '+#13+
                   ' where rabasdate = '''+ vDate +'''                               '+#13+
                   '   and empno     = '''+ vEmp  +'''                               ';
       ClearFieldInfo;
       AddField('EMPNO'      , ftString , 4);
       AddField('Capacity1'  , ftInteger, 1);
       AddField('Capacity2'  , ftInteger, 1);
       AddField('Capacity3'  , ftInteger, 1);
       AddField('Capacity4'  , ftInteger, 1);
       AddField('Capacity5'  , ftInteger, 1);
       AddField('Capacity6'  , ftInteger, 1);
       AddField('Capacity7'  , ftInteger, 1);
       AddField('Capacity8'  , ftInteger, 1);
       AddField('Capacity9'  , ftInteger, 1);
       AddField('Opinion1'   , ftString , 1000);
       AddField('Opinion2'   , ftString , 1000);
       AddField('Opinion3'   , ftInteger, 1);
       AddField('Opinion4'   , ftInteger, 1);
       AddField('Opinion5'   , ftInteger, 1);
       AddField('Opinion6'   , ftInteger, 1);
       AddField('Opinion7'   , ftString , 100);
       AddField('Opinion8'   , ftString , 8);
       AddField('Opinion9'   , ftString , 1000);
       Open;

       L_Capacity1.LabelCaption := IntToStr(FieldByName('Capacity1').AsInteger);
       L_Capacity2.LabelCaption := IntToStr(FieldByName('Capacity2').AsInteger);
       L_Capacity3.LabelCaption := IntToStr(FieldByName('Capacity3').AsInteger);
       L_Capacity4.LabelCaption := IntToStr(FieldByName('Capacity4').AsInteger);
       L_Capacity5.LabelCaption := IntToStr(FieldByName('Capacity5').AsInteger);
       L_Capacity6.LabelCaption := IntToStr(FieldByName('Capacity6').AsInteger);
       L_Capacity7.LabelCaption := IntToStr(FieldByName('Capacity7').AsInteger);
       L_Capacity8.LabelCaption := IntToStr(FieldByName('Capacity8').AsInteger);
       L_Capacity9.LabelCaption := IntToStr(FieldByName('Capacity9').AsInteger);
       E_Capacity0.Value        := (FieldByName('Capacity1').AsInteger +
                                    FieldByName('Capacity2').AsInteger +
                                    FieldByName('Capacity3').AsInteger +
                                    FieldByName('Capacity4').AsInteger +
                                    FieldByName('Capacity5').AsInteger +
                                    FieldByName('Capacity6').AsInteger +
                                    FieldByName('Capacity7').AsInteger +
                                    FieldByName('Capacity8').AsInteger +
                                    FieldByName('Capacity9').AsInteger) / 9;

       E_Opinion1.Text := FieldByName('Opinion1').AsString;
       E_Opinion2.Text := FieldByName('Opinion2').AsString;
                                                   
       for i := 1 to 5 do
       begin
            if FieldByName('Opinion3').AsInteger  = i then TOnRadioButton(Self.FindComponent('RB_Opinion3'+IntToStr(i))).Checked := True;
            if FieldByName('Opinion4').AsInteger  = i then TOnRadioButton(Self.FindComponent('RB_Opinion4'+IntToStr(i))).Checked := True;
            if FieldByName('Opinion5').AsInteger  = i then TOnRadioButton(Self.FindComponent('RB_Opinion5'+IntToStr(i))).Checked := True;
       end;    //ShowMessage(inttostr(FieldByName('Opinion3').AsInteger));

       if      FieldByName('Opinion6').AsInteger = 3 then RB_Opinion63.Checked := True
       else if FieldByName('Opinion6').AsInteger = 2 then RB_Opinion62.Checked := True
       else                                               RB_Opinion61.Checked := True;

       if      FieldByName('Opinion7').AsString = '다양한 직무를 경험하고 싶다.'                           then RB_Opinion75.Checked := True
       else if FieldByName('Opinion7').AsString = '다른 직무에서 보다 능력을 발휘할 수 있으리라 생각한다.' then RB_Opinion74.Checked := True
       else if FieldByName('Opinion7').AsString = '부서의 인간관계 / 분위기의 변화를 찾고 싶다.'           then RB_Opinion73.Checked := True
       else if FieldByName('Opinion7').AsString = '가족관계 / 연고지를 고려하여 근무지를 옮기고 싶다.'     then RB_Opinion72.Checked := True
       else if FieldByName('Opinion7').AsString <> ''                                                      then RB_Opinion71.Checked := True;

       E_Opinion8.ValueCaption := '';
       if   Trim(FieldByName('Opinion8').AsString) <> '' then
       begin
            FM_Tmax           := TFM_Tmax.Create(Self);
            FM_Tmax.T_Session := FM_Main.TMaxSession;
            E_Opinion8.ValueCaption := FM_Tmax.GetData('deptname', FM_Main.vOrgnum, Trim(FieldByName('Opinion8').AsString));
       end;

       E_Opinion9.Text := FieldByName('Opinion9').AsString;
       /////////////////////////////////////////////////////////////////////////


       ///부하의견조사 점수/////////////////////////////////////////////////////
       ServiceName := 'HINSA_select';
       Close;
       Sql.Clear;
       Sql.Text := 'select round((score11+score21+score31) / 3, 2) a,  '+#13+
                   '	   round((score12+score22+score32) / 3, 2) b,  '+#13+
                   '       round((score13+score23+score33) / 3, 2) c,  '+#13+
                   '	   round((score14+score24+score34) / 3, 2) d,  '+#13+
                   '	  (round((score11+score21+score31) / 3, 2) +   '+#13+
                   '	   round((score12+score22+score32) / 3, 2) +   '+#13+
                   '	   round((score13+score23+score33) / 3, 2) +   '+#13+
                   '	   round((score14+score24+score34) / 3, 2))/ 4 '+#13+
                   '  from PEZUPMAS                                    '+#13+
                   ' where rabasdate = '''+ vDate +'''                 '+#13+
                   '   and empno     = '''+ vEmp  +'''                 ';

       ClearFieldInfo;
       AddField('field1', ftString,  100);
       AddField('field2', ftString,  100);
       AddField('field3', ftString,  100);
       AddField('field4', ftString,  100);
       AddField('field5', ftString,  100);
       Open;

       if FM_Main.TMaxDataSet.RecordCount > 0 then
       begin
            L_upscore1.Value := Fields[0].AsFloat;
            L_upscore2.Value := Fields[1].AsFloat;
            L_upscore3.Value := Fields[2].AsFloat;
            L_upscore4.Value := Fields[3].AsFloat;
            L_upscore5.Value := Fields[4].AsFloat;
       end;

       ///관련부서 의견조사 점수////////////////////////////////////////////////
       ServiceName := 'HINSA_select';
       Close;
       Sql.Clear;
       Sql.Text := 'select round((score11+score21+score31) / 3, 2) a,   '+#13+
                   '	   round((score12+score22+score32) / 3, 2) b,   '+#13+
                   '       round((score13+score23+score33) / 3, 2) c,   '+#13+
                   '	  (round((score11+score21+score31) / 3, 2) +    '+#13+
                   '	   round((score12+score22+score32) / 3, 2) +    '+#13+
                   '	   round((score13+score23+score33) / 3, 2)) / 3,'+#13+
                   '       ''field5''                                   '+#13+
                   '  from PEZGRMAS                                     '+#13+
                   ' where rabasdate = '''+ vDate +'''                  '+#13+
                   '   and empno     = '''+ vEmp  +'''                  ';

      {if vEmp = 'M123' then //임시..
       begin
            Sql.Clear;
            Sql.Text := 'select round((score11+score21+score31) / 2, 2) a,   '+#13+
                        '       round((score12+score22+score32) / 2, 2) b,   '+#13+
                        '       round((score13+score23+score33) / 2, 2) c,   '+#13+
                        '      (round((score11+score21+score31) / 2, 2) +    '+#13+
                        '       round((score12+score22+score32) / 2, 2) +    '+#13+
                        '       round((score13+score23+score33) / 2, 2)) / 3,'+#13+
                        '       ''field5''                                   '+#13+
                        '  from PEZGRMAS                                     '+#13+
                        ' where rabasdate = '''+ vDate +'''                  '+#13+
                        '   and empno     = '''+ vEmp  +'''                  ';//     FM_Main.E_SQL.Text := sql.text;
       end;}
       Open;

       if FM_Main.TMaxDataSet.RecordCount > 0 then
       begin
            L_grpscore1.Value := Fields[0].AsFloat;
            L_grpscore2.Value := Fields[1].AsFloat;
            L_grpscore3.Value := Fields[2].AsFloat;
            L_grpscore4.Value := Fields[3].AsFloat;
       end;

       /////////////////////////////////////////////////////////////////////////
       ServiceName := 'HINSA_select2';
       Close;
       Sql.Clear;
       Sql.Text := 'select OPINION11, OPINION12, OPINION13, OPINION14, ''1''  '+#13+
                   '  from PEZUPMAS                                           '+#13+
                   ' where rabasdate = '''+ vDate +'''                        '+#13+
                   '   and empno     = '''+ vEmp  +'''                        '+#13+
                   ' Union                                                    '+#13+
                   'select OPINION21, OPINION22, OPINION23, OPINION24, ''2''  '+#13+
                   '  from PEZUPMAS                                           '+#13+
                   ' where rabasdate = '''+ vDate +'''                        '+#13+
                   '   and empno     = '''+ vEmp  +'''                        '+#13+
                   ' Union                                                    '+#13+
                   'select OPINION31, OPINION32, OPINION33, OPINION34, ''3''  '+#13+
                   '  from PEZUPMAS                                           '+#13+
                   ' where rabasdate = '''+ vDate +'''                        '+#13+
                   '   and empno     = '''+ vEmp  +'''                        '+#13+
                   ' Order by 5                                               ';
       ClearFieldInfo;
       AddField('field1', ftString,  400);
       AddField('field2', ftString,  400);
       AddField('field3', ftString,  400);
       AddField('field4', ftString,  400);
       AddField('field5', ftString,  400);
       Open;

       First;
       E_upOpinion1.Clear;
       E_upOpinion2.Clear;
       E_upOpinion3.Clear;
       E_upOpinion4.Clear;
       while not FM_Main.TMaxDataSet.eof do
       begin
            E_upOpinion1.Lines.Add(Fields[0].AsString);
            E_upOpinion2.Lines.Add(Fields[1].AsString);
            E_upOpinion3.Lines.Add(Fields[2].AsString);
            E_upOpinion4.Lines.Add(Fields[3].AsString);
            Next;
       end;
       /////////////////////////////////////////////////////////////////////////

       ServiceName := 'HINSA_select2';
       Close;
       Sql.Clear;
       Sql.Text := 'select OPINION11, OPINION12, OPINION13, ''1'',  ''1'' '+#13+
                   '  from PEZGRMAS                                       '+#13+
                   ' where rabasdate = '''+ vDate +'''                    '+#13+
                   '   and empno     = '''+ vEmp  +'''                    '+#13+
                   ' Union                                                '+#13+
                   'select OPINION21, OPINION22, OPINION23, ''2'',  ''2'' '+#13+
                   '  from PEZGRMAS                                       '+#13+
                   ' where rabasdate = '''+ vDate +'''                    '+#13+
                   '   and empno     = '''+ vEmp  +'''                    '+#13+
                   ' Union                                                '+#13+
                   'select OPINION31, OPINION32, OPINION33, ''3'',  ''3'' '+#13+
                   '  from PEZGRMAS                                       '+#13+
                   ' where rabasdate = '''+ vDate +'''                    '+#13+
                   '   and empno     = '''+ vEmp  +'''                    '+#13+
                   ' Order by 5                                           ';
       Open;

       First;
       E_grOpinion1.Clear;
       E_grOpinion2.Clear;
       E_grOpinion3.Clear;
       while not FM_Main.TMaxDataSet.eof do
       begin
            E_grOpinion1.Lines.Add(Fields[0].AsString);
            E_grOpinion2.Lines.Add(Fields[1].AsString);
            E_grOpinion3.Lines.Add(Fields[2].AsString);
            Next;
       end;
       Close;
       /////////////////////////////////////////////////////////////////////////
  end;
end;

end.
