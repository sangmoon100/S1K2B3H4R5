unit pez2040a3;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OnScheme, ExtCtrls, StdCtrls, OnFocusButton, OnShapeLabel,
  OnEditBaseCtrl, OnEditStdCtrl, OnEditMemo, QuickRpt, OnCheckBox,
  OnRadioBtn, printers, OnEditNumCtl, Db, Tmax_DataSetText, OnInsaCommon;

type
  TFM_Result2 = class(TForm)
    SF_Main: TOnSchemeForm;
    L_Payra: TOnShapeLabel;
    L_Birth: TOnShapeLabel;
    L_Paycl: TOnShapeLabel;
    L_Startdate: TOnShapeLabel;
    L_PayraDate: TOnShapeLabel;
    L_Paycldate: TOnShapeLabel;
    L_E2Korname: TOnShapeLabel;
    L_Empdate: TOnShapeLabel;
    L_E1Korname: TOnShapeLabel;
    Label1: TLabel;
    Panel4: TPanel;
    Panel1: TPanel;
    Panel3: TPanel;
    Panel5: TPanel;
    Panel12: TPanel;
    RB_KPI12_5: TOnRadioButton;
    RB_KPI12_4: TOnRadioButton;
    RB_KPI12_3: TOnRadioButton;
    RB_KPI12_2: TOnRadioButton;
    RB_KPI12_1: TOnRadioButton;
    E_KPI11: TOnShapeLabel;
    E_KPI13: TOnMemo;
    Panel6: TPanel;
    Panel7: TPanel;
    Label2: TLabel;
    Panel9: TPanel;
    Label3: TLabel;
    Panel10: TPanel;
    Label4: TLabel;
    Panel8: TPanel;
    Label5: TLabel;
    Panel11: TPanel;
    Label6: TLabel;
    Panel15: TPanel;
    Label7: TLabel;
    Panel16: TPanel;
    Label8: TLabel;
    Panel17: TPanel;
    Label9: TLabel;
    Panel18: TPanel;
    Label10: TLabel;
    Panel19: TPanel;
    Panel20: TPanel;
    Panel2: TPanel;
    Label11: TLabel;
    E_Opinion110: TOnMemo;
    P_Capacity11: TPanel;
    P_Capacity12: TPanel;
    P_Capacity13: TPanel;
    P_Capacity14: TPanel;
    P_Capacity15: TPanel;
    P_Capacity16: TPanel;
    P_Capacity17: TPanel;
    P_Capacity18: TPanel;
    P_Capacity19: TPanel;
    Label12: TLabel;
    Panel51: TPanel;
    Panel52: TPanel;
    Panel53: TPanel;
    Panel54: TPanel;
    Panel55: TPanel;
    Panel56: TPanel;
    Panel57: TPanel;
    Panel58: TPanel;
    Label13: TLabel;
    Label14: TLabel;
    E_EMD11: TOnMemo;
    Panel59: TPanel;
    Label16: TLabel;
    Panel60: TPanel;
    Label17: TLabel;
    Panel61: TPanel;
    Label18: TLabel;
    E_EMD12: TOnMemo;
    E_EMD13: TOnMemo;
    E_Emd14: TPanel;
    RB_Emd14_4: TOnRadioButton;
    RB_Emd14_3: TOnRadioButton;
    RB_Emd14_2: TOnRadioButton;
    RB_Emd14_1: TOnRadioButton;
    E_Emd15: TOnMemo;
    E_Emd17: TOnMemo;
    RB_Emd16: TPanel;
    RB_Emd16_5: TOnRadioButton;
    RB_Emd16_4: TOnRadioButton;
    RB_Emd16_3: TOnRadioButton;
    RB_Emd16_2: TOnRadioButton;
    RB_Emd16_1: TOnRadioButton;
    Label19: TLabel;
    Label20: TLabel;
    E_EMD21: TOnMemo;
    E_EMD22: TOnMemo;
    E_EMD23: TOnMemo;
    E_Emd24: TPanel;
    RB_Emd24_4: TOnRadioButton;
    RB_Emd24_3: TOnRadioButton;
    RB_Emd24_2: TOnRadioButton;
    RB_Emd24_1: TOnRadioButton;
    E_Emd25: TOnMemo;
    E_Emd27: TOnMemo;
    E_EMD31: TOnMemo;
    E_EMD32: TOnMemo;
    E_EMD33: TOnMemo;
    E_Emd34: TPanel;
    RB_Emd34_4: TOnRadioButton;
    RB_Emd34_3: TOnRadioButton;
    RB_Emd34_2: TOnRadioButton;
    RB_Emd34_1: TOnRadioButton;
    E_Emd35: TOnMemo;
    E_Emd37: TOnMemo;
    Label21: TLabel;
    Panel68: TPanel;
    Panel70: TPanel;
    Panel69: TPanel;
    Panel71: TPanel;
    Panel72: TPanel;
    Panel73: TPanel;
    Panel74: TPanel;
    Panel75: TPanel;
    Panel76: TPanel;
    Panel77: TPanel;
    Panel78: TPanel;
    Panel79: TPanel;
    Panel80: TPanel;
    Panel81: TPanel;
    Panel82: TPanel;
    Panel83: TPanel;
    OnMemo21: TOnMemo;
    OnMemo22: TOnMemo;
    Panel84: TPanel;
    OnMemo23: TOnMemo;
    Panel85: TPanel;
    Panel86: TPanel;
    Panel87: TPanel;
    E_CEO31: TPanel;
    RB_CEO31_4: TOnRadioButton;
    RB_CEO31_3: TOnRadioButton;
    RB_CEO31_2: TOnRadioButton;
    RB_CEO31_1: TOnRadioButton;
    Panel88: TPanel;
    E_CEO32: TOnMemo;
    Panel91: TPanel;
    E_CEO37: TOnMemo;
    Panel92: TPanel;
    E_CEO36: TPanel;
    RB_CEO36_4: TOnRadioButton;
    RB_CEO36_3: TOnRadioButton;
    RB_CEO36_2: TOnRadioButton;
    RB_CEO36_1: TOnRadioButton;
    Label22: TLabel;
    E_CEO33: TPanel;
    RB_CEO33_4: TOnRadioButton;
    RB_CEO33_3: TOnRadioButton;
    RB_CEO33_2: TOnRadioButton;
    RB_CEO33_1: TOnRadioButton;
    Panel13: TPanel;
    RB110_5: TOnRadioButton;
    RB110_4: TOnRadioButton;
    RB110_3: TOnRadioButton;
    RB110_2: TOnRadioButton;
    RB110_1: TOnRadioButton;
    E_KPI21: TOnShapeLabel;
    Panel14: TPanel;
    RB_KPI22_5: TOnRadioButton;
    RB_KPI22_4: TOnRadioButton;
    RB_KPI22_3: TOnRadioButton;
    RB_KPI22_2: TOnRadioButton;
    RB_KPI22_1: TOnRadioButton;
    E_KPI23: TOnMemo;
    P_Capacity21: TPanel;
    P_Capacity23: TPanel;
    P_Capacity22: TPanel;
    P_Capacity24: TPanel;
    P_Capacity26: TPanel;
    P_Capacity25: TPanel;
    P_Capacity27: TPanel;
    P_Capacity28: TPanel;
    P_Capacity29: TPanel;
    Panel39: TPanel;
    RB210_5: TOnRadioButton;
    RB210_4: TOnRadioButton;
    RB210_3: TOnRadioButton;
    RB210_2: TOnRadioButton;
    RB210_1: TOnRadioButton;
    E_Opinion210: TOnMemo;
    E_KPI31: TOnShapeLabel;
    Panel40: TPanel;
    RB_KPI32_5: TOnRadioButton;
    RB_KPI32_4: TOnRadioButton;
    RB_KPI32_3: TOnRadioButton;
    RB_KPI32_2: TOnRadioButton;
    RB_KPI32_1: TOnRadioButton;
    E_KPI33: TOnMemo;
    P_Capacity31: TPanel;
    P_Capacity32: TPanel;
    P_Capacity33: TPanel;
    P_Capacity34: TPanel;
    P_Capacity35: TPanel;
    P_Capacity36: TPanel;
    P_Capacity37: TPanel;
    P_Capacity38: TPanel;
    P_Capacity39: TPanel;
    Panel50: TPanel;
    RB310_5: TOnRadioButton;
    RB310_4: TOnRadioButton;
    RB310_3: TOnRadioButton;
    RB310_2: TOnRadioButton;
    RB310_1: TOnRadioButton;
    E_Opinion310: TOnMemo;
    Label15: TLabel;
    RB_Emd26: TPanel;
    RB_Emd26_5: TOnRadioButton;
    RB_Emd26_4: TOnRadioButton;
    RB_Emd26_3: TOnRadioButton;
    RB_Emd26_2: TOnRadioButton;
    RB_Emd26_1: TOnRadioButton;
    RB_Emd36: TPanel;
    RB_Emd36_5: TOnRadioButton;
    RB_Emd36_4: TOnRadioButton;
    RB_Emd36_3: TOnRadioButton;
    RB_Emd36_2: TOnRadioButton;
    RB_Emd36_1: TOnRadioButton;
    BT_ScrPrint: TOnFocusButton;
    BT_Exit: TOnFocusButton;
    L_Korname: TOnShapeLabel;
    P_CEO35: TOnCheckBox;
    procedure BT_ScrPrintClick(Sender: TObject);
    procedure BT_ExitClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FM_Result2: TFM_Result2;

implementation

uses pez2040a1;

{$R *.DFM}

procedure TFM_Result2.BT_ScrPrintClick(Sender: TObject);
begin
  BT_Exit.Visible       := False;
  BT_ScrPrint.Visible   := False;

  Printer.Orientation   := poLandscape;
  FM_Result2.PrintScale := poPrintToFit;
  FM_Result2.Print;

  BT_Exit.Visible       := True;
  BT_ScrPrint.Visible   := True;
end;

procedure TFM_Result2.BT_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TFM_Result2.FormShow(Sender: TObject);
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
                   '       cpaycldate,   cpayradate,   selfyn,    selfconyn,   mstartdate,                        '+
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

       L_Korname.ValueCaption   := FieldByName('KORNAME').AsString;
       L_Payra.ValueCaption     := FieldByName('PAYRANM').AsString;
       L_Paycl.ValueCaption     := FieldByName('PAYDUNM').AsString;
       L_E1Korname.ValueCaption := FieldByName('E1KORNAME').AsString;
       L_E2Korname.ValueCaption := FieldByName('E2KORNAME').AsString;

       L_Birth.ValueCaption     := Hinsa_DisplayDate('19'+FieldByName('JUMINID').AsString,'-');
       L_Startdate.ValueCaption := FieldByName('SELFCONDATE').AsString;
       L_PayraDate.ValueCaption := FieldByName('CPAYRADATE').AsString;
       L_Empdate.ValueCaption   := Hinsa_DisplayDate(FieldByName('EMPDATE').AsString,'-');
       L_Paycldate.ValueCaption := Hinsa_DisplayDate(FieldByName('CPAYCLDATE').AsString,'-');
       /////////////////////////////////////////////////////////////////////////


       /////////////////////////////////////////////////////////////////////////
       ServiceName := 'PEZ2040A_sel1';
       Close;
       Sql.Clear;
       Sql.Text := 'select empno,    Kpi11, Kpi12, Kpi13,                                                                  '+#13+
                   '       nvl(Capacity11,0), nvl(Capacity12,0), nvl(Capacity13,0), nvl(Capacity14,0), nvl(Capacity15,0),  '+#13+
                   '       nvl(Capacity16,0), nvl(Capacity17,0), nvl(Capacity18,0), nvl(Capacity19,0), nvl(Capacity110,0), '+#13+
                   '       Opinion11,         Opinion12,         Opinion13,         Opinion14,         Opinion15,          '+#13+
                   '       Opinion16,         Opinion17,         Opinion18,         Opinion19,         Opinion110,         '+#13+
                   '       Emd11, Emd12, Emd13, nvl(Emd14,0), Emd15, nvl(Emd16,0), Emd17,                                  '+#13+
                   '       Kpi21, Kpi22, Kpi23,                                                                            '+#13+
                   '       nvl(Capacity21,0), nvl(Capacity22,0), nvl(Capacity23,0), nvl(Capacity24,0), nvl(Capacity25,0),  '+#13+
                   '       nvl(Capacity26,0), nvl(Capacity27,0), nvl(Capacity28,0), nvl(Capacity29,0), nvl(Capacity210,0), '+#13+
                   '       Opinion21,         Opinion22,         Opinion23,         Opinion24,         Opinion25,          '+#13+
                   '       Opinion26,         Opinion27,         Opinion28,         Opinion29,         Opinion210,         '+#13+
                   '       Emd21, Emd22, Emd23, nvl(Emd24,0), Emd25, nvl(Emd26,0), Emd27,                                  '+#13+
                   '       Kpi31, Kpi32, Kpi33,                                                                            '+#13+
                   '       nvl(Capacity31,0), nvl(Capacity32,0), nvl(Capacity33,0), nvl(Capacity34,0), nvl(Capacity35,0),  '+#13+
                   '       nvl(Capacity36,0), nvl(Capacity37,0), nvl(Capacity38,0), nvl(Capacity39,0), nvl(Capacity310,0), '+#13+
                   '       Opinion31,         Opinion32,         Opinion33,         Opinion34,         Opinion35,          '+#13+
                   '       Opinion36,         Opinion37,         Opinion38,         Opinion39,         Opinion310,         '+#13+
                   '       Emd31, Emd32, Emd33, nvl(Emd34,0), Emd35, nvl(Emd36,0), Emd37,                                  '+#13+
                   '       nvl(Ceo31,0), Ceo32, nvl(Ceo33,0), Ceo34, Ceo35, nvl(Ceo36,0), Ceo37                            '+#13+
                   '  from pezdwmas                                                                                        '+#13+
                   ' where rabasdate = '''+ vDate +'''                                                                     '+#13+
                   '   and empno     = '''+ vEmp  +'''                                                                     ';

       ClearFieldInfo;
       AddField('EMPNO'      , ftString , 4);
       AddField('KPI11'      , ftInteger, 3);
       AddField('KPI12'      , ftInteger, 3);
       AddField('KPI13'      , ftString , 400);
       AddField('CAPACITY11' , ftInteger, 3);
       AddField('CAPACITY12' , ftInteger, 3);
       AddField('CAPACITY13' , ftInteger, 3);
       AddField('CAPACITY14' , ftInteger, 3);
       AddField('CAPACITY15' , ftInteger, 3);
       AddField('CAPACITY16' , ftInteger, 3);
       AddField('CAPACITY17' , ftInteger, 3);
       AddField('CAPACITY18' , ftInteger, 3);
       AddField('CAPACITY19' , ftInteger, 3);
       AddField('CAPACITY110', ftInteger, 3);
       AddField('OPINION11'  , ftString , 400);
       AddField('OPINION12'  , ftString , 400);
       AddField('OPINION13'  , ftString , 400);
       AddField('OPINION14'  , ftString , 400);
       AddField('OPINION15'  , ftString , 400);
       AddField('OPINION16'  , ftString , 400);
       AddField('OPINION17'  , ftString , 400);
       AddField('OPINION18'  , ftString , 400);
       AddField('OPINION19'  , ftString , 400);
       AddField('OPINION110' , ftString , 400);
       AddField('EMD11'      , ftString , 400);
       AddField('EMD12'      , ftString , 400);
       AddField('EMD13'      , ftString , 400);
       AddField('EMD14'      , ftInteger, 3);
       AddField('EMD15'      , ftString , 400);
       AddField('EMD16'      , ftInteger, 3);
       AddField('EMD17'      , ftString , 400);
       AddField('KPI21'      , ftInteger, 3);
       AddField('KPI22'      , ftInteger, 3);
       AddField('KPI23'      , ftString , 400);
       AddField('CAPACITY21' , ftInteger, 3);
       AddField('CAPACITY22' , ftInteger, 3);
       AddField('CAPACITY23' , ftInteger, 3);
       AddField('CAPACITY24' , ftInteger, 3);
       AddField('CAPACITY25' , ftInteger, 3);
       AddField('CAPACITY26' , ftInteger, 3);
       AddField('CAPACITY27' , ftInteger, 3);
       AddField('CAPACITY28' , ftInteger, 3);
       AddField('CAPACITY29' , ftInteger, 3);
       AddField('CAPACITY210', ftInteger, 3);
       AddField('OPINION21'  , ftString , 400);
       AddField('OPINION22'  , ftString , 400);
       AddField('OPINION23'  , ftString , 400);
       AddField('OPINION24'  , ftString , 400);
       AddField('OPINION25'  , ftString , 400);
       AddField('OPINION26'  , ftString , 400);
       AddField('OPINION27'  , ftString , 400);
       AddField('OPINION28'  , ftString , 400);
       AddField('OPINION29'  , ftString , 400);
       AddField('OPINION210' , ftString , 400);
       AddField('EMD21'      , ftString , 400);
       AddField('EMD22'      , ftString , 400);
       AddField('EMD23'      , ftString , 400);
       AddField('EMD24'      , ftInteger, 3);
       AddField('EMD25'      , ftString , 400);
       AddField('EMD26'      , ftInteger, 3);
       AddField('EMD27'      , ftString , 400);
       AddField('KPI31'      , ftInteger, 3);
       AddField('KPI32'      , ftInteger, 3);
       AddField('KPI33'      , ftString , 400);
       AddField('CAPACITY31' , ftInteger, 3);
       AddField('CAPACITY32' , ftInteger, 3);
       AddField('CAPACITY33' , ftInteger, 3);
       AddField('CAPACITY34' , ftInteger, 3);
       AddField('CAPACITY35' , ftInteger, 3);
       AddField('CAPACITY36' , ftInteger, 3);
       AddField('CAPACITY37' , ftInteger, 3);
       AddField('CAPACITY38' , ftInteger, 3);
       AddField('CAPACITY39' , ftInteger, 3);
       AddField('CAPACITY310', ftInteger, 3);
       AddField('OPINION31'  , ftString , 400);
       AddField('OPINION32'  , ftString , 400);
       AddField('OPINION33'  , ftString , 400);
       AddField('OPINION34'  , ftString , 400);
       AddField('OPINION35'  , ftString , 400);
       AddField('OPINION36'  , ftString , 400);
       AddField('OPINION37'  , ftString , 400);
       AddField('OPINION38'  , ftString , 400);
       AddField('OPINION39'  , ftString , 400);
       AddField('OPINION310' , ftString , 400);
       AddField('EMD31'      , ftString , 400);
       AddField('EMD32'      , ftString , 400);
       AddField('EMD33'      , ftString , 400);
       AddField('EMD34'      , ftInteger, 3);
       AddField('EMD35'      , ftString , 400);
       AddField('EMD36'      , ftInteger, 3);
       AddField('EMD37'      , ftString , 400);
       AddField('CEO31'      , ftInteger, 1);
       AddField('CEO32'      , ftString , 400);
       AddField('CEO33'      , ftInteger, 1);
       AddField('CEO34'      , ftString , 400);
       AddField('CEO35'      , ftString , 1);
       AddField('CEO36'      , ftInteger, 3);
       AddField('CEO37'      , ftString , 400);    //E_Sql.Text := Sql.Text;
       Open;
       
       FL_Comp := nil;
       for i := 1 to 5 do
       begin
            if FM_Main.vEvalNum = '2차' then
            begin
                 if FieldByName('KPI12').AsInteger       = i then TOnRadioButton(Self.FindComponent('RB_KPI12_'+IntToStr(i))).Checked := True;
                 if FieldByName('KPI22').AsInteger       = i then TOnRadioButton(Self.FindComponent('RB_KPI22_'+IntToStr(i))).Checked := True;

                 if FieldByName('Capacity110').AsInteger = i then TOnRadioButton(Self.FindComponent('RB110_'+IntToStr(i))).Checked := True;
                 if FieldByName('Capacity210').AsInteger = i then TOnRadioButton(Self.FindComponent('RB210_'+IntToStr(i))).Checked := True;

                 if i <> 5 then
                 begin
                      if FieldByName('EMD14').AsInteger  = i then TOnRadioButton(Self.FindComponent('RB_EMD14_'+IntToStr(i))).Checked := True;
                      if FieldByName('EMD24').AsInteger  = i then TOnRadioButton(Self.FindComponent('RB_EMD24_'+IntToStr(i))).Checked := True;
                 end;

                 if FieldByName('EMD16').AsInteger       = i then TOnRadioButton(Self.FindComponent('RB_EMD16_'+IntToStr(i))).Checked := True;
                 if FieldByName('EMD26').AsInteger       = i then TOnRadioButton(Self.FindComponent('RB_EMD26_'+IntToStr(i))).Checked := True;
            end
            
            else if FM_Main.vEvalNum = '3차' then
            begin
                 if FieldByName('KPI12').AsInteger       = i then TOnRadioButton(Self.FindComponent('RB_KPI12_'+IntToStr(i))).Checked := True;
                 if FieldByName('KPI22').AsInteger       = i then TOnRadioButton(Self.FindComponent('RB_KPI22_'+IntToStr(i))).Checked := True;
                 if FieldByName('KPI32').AsInteger       = i then TOnRadioButton(Self.FindComponent('RB_KPI32_'+IntToStr(i))).Checked := True;

                 if FieldByName('Capacity110').AsInteger = i then TOnRadioButton(Self.FindComponent('RB110_'+IntToStr(i))).Checked := True;
                 if FieldByName('Capacity210').AsInteger = i then TOnRadioButton(Self.FindComponent('RB210_'+IntToStr(i))).Checked := True;
                 if FieldByName('Capacity310').AsInteger = i then TOnRadioButton(Self.FindComponent('RB310_'+IntToStr(i))).Checked := True;

                 if i <> 5 then
                 begin
                      if FieldByName('EMD14').AsInteger  = i then TOnRadioButton(Self.FindComponent('RB_EMD14_'+IntToStr(i))).Checked := True;
                      if FieldByName('EMD24').AsInteger  = i then TOnRadioButton(Self.FindComponent('RB_EMD24_'+IntToStr(i))).Checked := True;
                      if FieldByName('EMD34').AsInteger  = i then TOnRadioButton(Self.FindComponent('RB_EMD34_'+IntToStr(i))).Checked := True;
                 end;

                 if FieldByName('EMD16').AsInteger       = i then TOnRadioButton(Self.FindComponent('RB_EMD16_'+IntToStr(i))).Checked := True;
                 if FieldByName('EMD26').AsInteger       = i then TOnRadioButton(Self.FindComponent('RB_EMD26_'+IntToStr(i))).Checked := True;
                 if FieldByName('EMD36').AsInteger       = i then TOnRadioButton(Self.FindComponent('RB_EMD36_'+IntToStr(i))).Checked := True;

                 if FieldByName('CEO31').AsInteger       = i then TOnRadioButton(Self.FindComponent('RB_CEO31_'+IntToStr(i))).Checked := True;
                 if FieldByName('CEO33').AsInteger       = i then TOnRadioButton(Self.FindComponent('RB_CEO33_'+IntToStr(i))).Checked := True;
                 if FieldByName('CEO36').AsInteger       = i then TOnRadioButton(Self.FindComponent('RB_CEO36_'+IntToStr(i))).Checked := True;
            end;
       end; //  showmessage(inttostr(vCapacity1));


       if FM_Main.vEvalNum = '2차' then
       begin
            E_KPI11.ValueCaption := FieldByName('KPI11').AsString;
            E_KPI13.Text         := FieldByName('KPI13').AsString;
            E_KPI21.ValueCaption := FieldByName('KPI21').AsString;
            E_KPI23.Text         := FieldByName('KPI23').AsString;
            E_KPI31.ValueCaption := '';
            E_KPI33.Text         := '';

            P_Capacity11.Caption := IntToStr(FieldByName('Capacity11').AsInteger);
            P_Capacity12.Caption := IntToStr(FieldByName('Capacity12').AsInteger);
            P_Capacity13.Caption := IntToStr(FieldByName('Capacity13').AsInteger);
            P_Capacity14.Caption := IntToStr(FieldByName('Capacity14').AsInteger);
            P_Capacity15.Caption := IntToStr(FieldByName('Capacity15').AsInteger);
            P_Capacity16.Caption := IntToStr(FieldByName('Capacity16').AsInteger);
            P_Capacity17.Caption := IntToStr(FieldByName('Capacity17').AsInteger);
            P_Capacity18.Caption := IntToStr(FieldByName('Capacity18').AsInteger);
            P_Capacity19.Caption := IntToStr(FieldByName('Capacity19').AsInteger);
            E_Opinion110.Text    := FieldByName('Opinion110').AsString;

            P_Capacity21.Caption := IntToStr(FieldByName('Capacity21').AsInteger);
            P_Capacity22.Caption := IntToStr(FieldByName('Capacity22').AsInteger);
            P_Capacity23.Caption := IntToStr(FieldByName('Capacity23').AsInteger);
            P_Capacity24.Caption := IntToStr(FieldByName('Capacity24').AsInteger);
            P_Capacity25.Caption := IntToStr(FieldByName('Capacity25').AsInteger);
            P_Capacity26.Caption := IntToStr(FieldByName('Capacity26').AsInteger);
            P_Capacity27.Caption := IntToStr(FieldByName('Capacity27').AsInteger);
            P_Capacity28.Caption := IntToStr(FieldByName('Capacity28').AsInteger);
            P_Capacity29.Caption := IntToStr(FieldByName('Capacity29').AsInteger);
            E_Opinion210.Text    := FieldByName('Opinion210').AsString;
            E_Opinion310.Text    := '';

            E_EMD11.Text         := FieldByName('EMD11').AsString;
            E_EMD12.Text         := FieldByName('EMD12').AsString;
            E_EMD13.Text         := FieldByName('EMD13').AsString;
            E_EMD15.Text         := FieldByName('EMD15').AsString;
            E_EMD17.Text         := FieldByName('EMD17').AsString;
            E_EMD21.Text         := FieldByName('EMD21').AsString;
            E_EMD22.Text         := FieldByName('EMD22').AsString;
            E_EMD23.Text         := FieldByName('EMD23').AsString;
            E_EMD25.Text         := FieldByName('EMD25').AsString;
            E_EMD27.Text         := FieldByName('EMD27').AsString;
            E_EMD31.Text         := '';
            E_EMD32.Text         := '';
            E_EMD33.Text         := '';
            E_EMD35.Text         := '';
            E_EMD37.Text         := '';
       end
       else if FM_Main.vEvalNum = '3차' then
       begin
            E_KPI11.ValueCaption := FieldByName('KPI11').AsString;
            E_KPI13.Text         := FieldByName('KPI13').AsString;
            E_KPI21.ValueCaption := FieldByName('KPI21').AsString;
            E_KPI23.Text         := FieldByName('KPI23').AsString;
            E_KPI31.ValueCaption := FieldByName('KPI31').AsString;
            E_KPI33.Text         := FieldByName('KPI33').AsString;

            P_Capacity11.Caption := IntToStr(FieldByName('Capacity11').AsInteger);
            P_Capacity12.Caption := IntToStr(FieldByName('Capacity12').AsInteger);
            P_Capacity13.Caption := IntToStr(FieldByName('Capacity13').AsInteger);
            P_Capacity14.Caption := IntToStr(FieldByName('Capacity14').AsInteger);
            P_Capacity15.Caption := IntToStr(FieldByName('Capacity15').AsInteger);
            P_Capacity16.Caption := IntToStr(FieldByName('Capacity16').AsInteger);
            P_Capacity17.Caption := IntToStr(FieldByName('Capacity17').AsInteger);
            P_Capacity18.Caption := IntToStr(FieldByName('Capacity18').AsInteger);
            P_Capacity19.Caption := IntToStr(FieldByName('Capacity19').AsInteger);
            E_Opinion110.Text    := FieldByName('Opinion110').AsString;
            P_Capacity21.Caption := IntToStr(FieldByName('Capacity21').AsInteger);
            P_Capacity22.Caption := IntToStr(FieldByName('Capacity22').AsInteger);
            P_Capacity23.Caption := IntToStr(FieldByName('Capacity23').AsInteger);
            P_Capacity24.Caption := IntToStr(FieldByName('Capacity24').AsInteger);
            P_Capacity25.Caption := IntToStr(FieldByName('Capacity25').AsInteger);
            P_Capacity26.Caption := IntToStr(FieldByName('Capacity26').AsInteger);
            P_Capacity27.Caption := IntToStr(FieldByName('Capacity27').AsInteger);
            P_Capacity28.Caption := IntToStr(FieldByName('Capacity28').AsInteger);
            P_Capacity29.Caption := IntToStr(FieldByName('Capacity29').AsInteger);
            E_Opinion210.Text    := FieldByName('Opinion210').AsString;
            P_Capacity31.Caption := IntToStr(FieldByName('Capacity31').AsInteger);
            P_Capacity32.Caption := IntToStr(FieldByName('Capacity32').AsInteger);
            P_Capacity33.Caption := IntToStr(FieldByName('Capacity33').AsInteger);
            P_Capacity34.Caption := IntToStr(FieldByName('Capacity34').AsInteger);
            P_Capacity35.Caption := IntToStr(FieldByName('Capacity35').AsInteger);
            P_Capacity36.Caption := IntToStr(FieldByName('Capacity36').AsInteger);
            P_Capacity37.Caption := IntToStr(FieldByName('Capacity37').AsInteger);
            P_Capacity38.Caption := IntToStr(FieldByName('Capacity38').AsInteger);
            P_Capacity39.Caption := IntToStr(FieldByName('Capacity39').AsInteger);
            E_Opinion310.Text    := FieldByName('Opinion310').AsString;

            E_EMD11.Text         := FieldByName('EMD11').AsString;
            E_EMD12.Text         := FieldByName('EMD12').AsString;
            E_EMD13.Text         := FieldByName('EMD13').AsString;
            E_EMD15.Text         := FieldByName('EMD15').AsString;
            E_EMD17.Text         := FieldByName('EMD17').AsString;
            E_EMD21.Text         := FieldByName('EMD21').AsString;
            E_EMD22.Text         := FieldByName('EMD22').AsString;
            E_EMD23.Text         := FieldByName('EMD23').AsString;
            E_EMD25.Text         := FieldByName('EMD25').AsString;
            E_EMD27.Text         := FieldByName('EMD27').AsString;
            E_EMD31.Text         := FieldByName('EMD31').AsString;
            E_EMD32.Text         := FieldByName('EMD32').AsString;
            E_EMD33.Text         := FieldByName('EMD33').AsString;
            E_EMD35.Text         := FieldByName('EMD35').AsString;
            E_EMD37.Text         := FieldByName('EMD37').AsString;
            
            E_CEO32.Text         := FieldByName('CEO32').AsString +#13+
                                    FieldByName('CEO34').AsString;
            
            P_CEO35.Checked := False;
            if FieldByName('CEO35').AsString = 'Y' then P_CEO35.Checked := True;
            E_CEO37.Text  := FieldByName('CEO37').AsString;
       end;
  end;
end;

end.
