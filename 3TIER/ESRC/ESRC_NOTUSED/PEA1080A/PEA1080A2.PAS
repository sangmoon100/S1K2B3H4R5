unit PEA1080A2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl, OnTmaxPersonEdit,
  OnShapeLabel, ComCtrls, OnRadioBtn, OnEditMemo, StdCtrls, OnLineLabel,
  OnFocusButton, Db, Tmax_DataSetText, Tmax_session, TmaxFunc, Pass, printers,
  OnPopupEdit, OnScheme;

type
  TFM_Result = class(TForm)
    SF_Main: TOnSchemeForm;
    L_Deptname: TOnShapeLabel;
    L_Payclname: TOnShapeLabel;
    L_empdate: TOnShapeLabel;
    L_Paycldate: TOnShapeLabel;
    L_GRADE1: TOnShapeLabel;
    L_Band1: TOnShapeLabel;
    L_Band2: TOnShapeLabel;
    L_GRADE2: TOnShapeLabel;
    L_GRADE3: TOnShapeLabel;
    L_Band3: TOnShapeLabel;
    L_rabasyear1: TOnShapeLabel;
    L_rabasyear2: TOnShapeLabel;
    L_rabasyear3: TOnShapeLabel;
    OnSectionLabel1: TOnSectionLabel;
    BT_Exit: TOnFocusButton;
    E_Empno: TOnWinPopupEdit;
    Memo_E1_1: TOnMemo;
    E_Opinion2_1: TOnMemo;
    E_Opinion4_1: TOnMemo;
    E_Opinion3_1: TOnMemo;
    Memo_E2_1: TOnMemo;
    E_Opinion1_1: TOnMemo;
    Memo_E1_2: TOnMemo;
    E_Opinion2_2: TOnMemo;
    E_Opinion4_2: TOnMemo;
    E_Opinion3_2: TOnMemo;
    Memo_E2_2: TOnMemo;
    E_Opinion1_2: TOnMemo;
    Memo_E1_3: TOnMemo;
    E_Opinion2_3: TOnMemo;
    E_Opinion4_3: TOnMemo;
    E_Opinion3_3: TOnMemo;
    Memo_E2_3: TOnMemo;
    E_Opinion1_3: TOnMemo;
    procedure BT_ExitClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    vParamSQL  : String;
    procedure OpinionView(vEmp : String);
    procedure EmpnoFind(vEmp : String);
  public
    { Public declarations }
    Lgubun     : Integer;
    Rgubun     : Integer;
  end;

var
  FM_Result: TFM_Result;

implementation

uses PEA1080A1;


{$R *.DFM}

procedure TFM_Result.BT_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TFM_Result.FormShow(Sender: TObject);
begin
  EmpnoFind(FM_Main.QR_Grid.FieldByName('empno').AsString);

  OpinionView(FM_Main.QR_Grid.FieldByName('empno').AsString);

E_Opinion1_1.SetFocus;
end;

procedure TFM_Result.EmpnoFind(vEmp : String);
begin
  with FM_Main.QR_Common do
  begin
       ServiceName := 'HINSA_select';
       ClearFieldInfo;
       AddField('empno'     , ftString, 100);
       AddField('korname'   , ftString, 100);
       AddField('PAYCLDATE' , ftString, 100);
       AddField('PAYCLYY'   , ftString, 100);
       AddField('GRADE'     , ftString, 100);

       Close;
       SQL.Clear;
       SQL.Text := 'SELECT empno, korname, paycldate, '''', '''' '+
                   '  FROM pimpmas A                             '+
                   ' WHERE empno = '''+ vEmp +'''                ';
       Open;

       L_paycldate.ValueCaption := copy(Fields[2].AsString,1,4)+'-'+
                                   copy(Fields[2].AsString,5,2)+'-'+
                                   copy(Fields[2].AsString,7,2);

       E_Empno.Text             := FM_Main.QR_Grid.Fields[0].AsString +' - '+
                                   FM_Main.QR_Grid.Fields[1].AsString;
       L_Deptname.ValueCaption  := FM_Main.QR_Grid.Fields[2].AsString;
       L_Payclname.ValueCaption := FM_Main.QR_Grid.Fields[3].AsString;
       L_empdate.ValueCaption   := FM_Main.QR_Grid.Fields[5].AsString;
  end;
end;

procedure TFM_Result.OpinionView(vEmp : String);
 var vY1BossYN, vY2BossYN, vY3BossYN : String;
begin
  L_rabasyear1.ValueCaption := copy(FM_Main.vRabasdate1,1,4) +'년';
  L_rabasyear2.ValueCaption := copy(FM_Main.vRabasdate2,1,4) +'년';
  L_rabasyear3.ValueCaption := copy(FM_Main.vRabasdate3,1,4) +'년';

  //평가의견 Read...
  with FM_Main.QR_Common do
  begin
       ServiceName := 'HINSA_select';
       ClearFieldInfo;
       AddField('BAND'      , ftString, 100);
       AddField('PAYCLDATE' , ftString, 100);
       AddField('Empno'     , ftString, 100);
       AddField('PAYCLYY'   , ftString, 100);
       AddField('GRADE'     , ftString, 100);

       //2007년 ================================================================
       vParamSQL := 'SELECT (Select codename from pyccode                         '+
                    '         Where codeid = ''I112'' and codeno = a.paycl) BAND, '+
                    '       a.PAYCLDATE, C.Empno,                                 '+
                    '       a.PAYCLYY+decode(sign(a.PAYCLMM-1),-1,0,1) PAYCLYY,   '+
                    '       b.RESULTSCRGRADE ||'' / ''|| b.FINALGRADE  GRADE      '+
//                    '       Substr(b.RESULTSCRGRADE,1,1)||'' / ''||                '+ //G+ G-를 G등급으로 통일.
//                    '       Substr(b.FINALGRADE,1,1) GRADE                         '+
                    '  from PIHPMAS a, PEHEVHIS b, PETREMAS C                     '+
                    ' where a.EMPNO     = b.EMPNO                                 '+
                    '   and a.EMPNO     = C.EMPNO(+)                              '+
                    '   and a.WORKYYMM  = '''+ copy(FM_Main.vRabasdate1,1,6) +''' '+
                    '   and b.RABASYEAR = '''+ copy(FM_Main.vRabasdate1,1,4) +''' '+
                    '   and c.RABASDate(+) = '''+ FM_Main.vRabasdate1        +''' '+
                    '   AND a.empno     = '''+ vEmp                          +''' ';
       Close;
       SQl.Clear;
       SQL.Text := vParamSQL;  //edit1.Text := SQL.Text;
       Open;

       //일반적인
       L_Band1.ValueCaption    := '  '+FieldByName('BAND').AsString + ' / ' + FieldByName('PAYCLYY').AsString + ' 년차' ;
       L_GRADE1.ValueCaption   := FieldByName('GRADE').AsString;

       if (vEmp >= '2358') and (vEmp <= '2499') then //SK네트웍스 전임자
       begin
            L_Band1.ValueCaption    := '(SKN)';
            L_GRADE1.ValueCaption   := FM_Main.QR_Grid.FieldByName('GRADE1').AsString +' (SKN)';
       end;

       vY1BossYN := 'N';
       if FieldByName('Empno').AsString <> '' then vY1BossYN := 'Y';

       //2008년 ================================================================
       vParamSQL := 'SELECT  (Select codename from pyccode                      '+
                    '          where codeid = ''I112''                          '+
                    '            and codeno = a.paycl)  BAND,                   '+
                    '       a.PAYCLDATE, C.Empno,                               '+
                    '       a.PAYCLYY+decode(sign(a.PAYCLMM-1),-1,0,1) PAYCLYY, '+
                    '       b.RESULTSCRGRADE ||'' / ''|| b.FINALGRADE  GRADE    '+
                    '  from PIHPMAS a, PEHEVHIS b, PETREMAS C                     '+
                    ' where a.EMPNO     = b.EMPNO                                 '+
                    '   and a.EMPNO     = C.EMPNO(+)                              '+
                    '   and a.WORKYYMM  = '''+ copy(FM_Main.vRabasdate2,1,6) +''' '+
                    '   and b.RABASYEAR = '''+ copy(FM_Main.vRabasdate2,1,4) +''' '+
                    '   and c.RABASDate(+) = '''+ FM_Main.vRabasdate2        +''' '+
                    '   AND a.empno     = '''+ vEmp                          +''' ';
       Close;
       SQl.Clear;
       SQL.Text := vParamSQL;
       Open;

       L_Band2.ValueCaption    := '  '+FieldByName('BAND').AsString + ' / ' + FieldByName('PAYCLYY').AsString + ' 년차' ;
       L_GRADE2.ValueCaption   := FieldByName('GRADE').AsString;  //일반적인 등급

       if (vEmp >= '2358') and (vEmp <= '2499') then //SK네트웍스 전임자
       begin
            L_Band2.ValueCaption    := '(SKN)';
            L_GRADE2.ValueCaption   := FM_Main.QR_Grid.FieldByName('GRADE2').AsString +' (SKN)';
       end;

       vY2BossYN := 'N';
       if FieldByName('Empno').AsString <> '' then vY2BossYN := 'Y';

       //2009년 ================================================================
       vParamSQL := 'SELECT  (Select codename from pyccode                      '+
                    '          where codeid = ''I112''                          '+
                    '            and codeno = a.paycl)  BAND,                   '+
                    '       a.PAYCLDATE, C.Empno,                               '+
                    '       a.PAYCLYY+decode(sign(a.PAYCLMM-1),-1,0,1) PAYCLYY, '+
                    '       b.RESULTSCRGRADE ||'' / ''|| b.FINALGRADE  GRADE    '+
                    '  from PIHPMAS a, PEHEVHIS b, PETREMAS C                     '+
                    ' where a.EMPNO     = b.EMPNO                                 '+
                    '   and a.EMPNO     = C.EMPNO(+)                              '+
                    '   and a.WORKYYMM  = '''+ copy(FM_Main.vRabasdate3,1,6) +''' '+
                    '   and b.RABASYEAR = '''+ copy(FM_Main.vRabasdate3,1,4) +''' '+
                    '   and c.RABASDate(+) = '''+ FM_Main.vRabasdate3        +''' '+
                    '   AND a.empno     = '''+ vEmp                          +''' ';
       Close;
       SQl.Clear;
       SQL.Text := vParamSQL;
       Open;

       L_Band3.ValueCaption    := '  '+FieldByName('BAND').AsString + ' / ' + FieldByName('PAYCLYY').AsString + ' 년차' ;
       L_GRADE3.ValueCaption   := FieldByName('GRADE').AsString;  //일반적인 등급

       vY3BossYN := 'N';
       if FieldByName('Empno').AsString <> '' then vY3BossYN := 'Y';
       /////////////////////////////////////////////////////////////////////////

       /////////////////////////////////////////////////////////////////////////
       if vY1BossYN = 'N' then
          vParamSQL := 'SELECT Opinion1, Opinion2, Opinion3, Opinion4, ''5''  '+
                       '  FROM PEHREMAS                                       '+
                       ' WHERE rabasdate = '''+ FM_Main.vRabasdate1    +'''   '+
                       '   AND empno     = '''+ vEmp                   +'''   '
       else
          vParamSQL := 'SELECT e1opinion1, e1opinion3, e1opinion2, '''',''5'' '+
                       '  FROM PETREMAS                                       '+
                       ' WHERE rabasdate = '''+ FM_Main.vRabasdate1    +'''   '+
                       '   AND empno     = '''+ vEmp                   +'''   ';

       ServiceName := 'HINSA_select2';
       ClearFieldInfo;
       AddField('Field1' , ftString, 400);
       AddField('Field2' , ftString, 400);
       AddField('Field3' , ftString, 400);
       AddField('Field4' , ftString, 400);
       AddField('Field5' , ftString, 400);

       Close;
       SQl.Clear;
       SQL.Text := vParamSQL;
       Open;
       E_Opinion1_1.Text := Fields[0].AsString;
       E_Opinion2_1.Text := Fields[1].AsString;
       E_Opinion3_1.Text := Fields[2].AsString;
       E_Opinion4_1.Text := Fields[3].AsString;


       if vY2BossYN = 'N' then
          vParamSQL := 'SELECT Opinion1, Opinion2, Opinion3, Opinion4, ''5''  '+
                       '  FROM PEHREMAS                                       '+
                       ' WHERE rabasdate = '''+ FM_Main.vRabasdate2    +'''   '+
                       '   AND empno     = '''+ vEmp                   +'''   '
       else
          vParamSQL := 'SELECT e1opinion1, e1opinion3, e1opinion2, '''',''5'' '+
                       '  FROM PETREMAS                                       '+
                       ' WHERE rabasdate = '''+ FM_Main.vRabasdate2    +'''   '+
                       '   AND empno     = '''+ vEmp                   +'''   ';
       Close;
       SQl.Clear;
       SQL.Text := vParamSQL;             
       Open;
       E_Opinion1_2.Text := Fields[0].AsString;
       E_Opinion2_2.Text := Fields[1].AsString;
       E_Opinion3_2.Text := Fields[2].AsString;
       E_Opinion4_2.Text := Fields[3].AsString;


       if vY3BossYN = 'N' then
          vParamSQL := 'SELECT Opinion1, Opinion2, Opinion3, Opinion4, ''5''  '+
                       '  FROM PEHREMAS                                       '+
                       ' WHERE rabasdate = '''+ FM_Main.vRabasdate3    +'''   '+
                       '   AND empno     = '''+ vEmp                   +'''   '
       else
          vParamSQL := 'SELECT e1opinion1, e1opinion3, e1opinion2, '''',''5'' '+
                       '  FROM PETREMAS                                       '+
                       ' WHERE rabasdate = '''+ FM_Main.vRabasdate3    +'''   '+
                       '   AND empno     = '''+ vEmp                   +'''   ';
       Close;
       SQl.Clear;
       SQL.Text := vParamSQL;             
       Open;
       E_Opinion1_3.Text := Fields[0].AsString;
       E_Opinion2_3.Text := Fields[1].AsString;
       E_Opinion3_3.Text := Fields[2].AsString;
       E_Opinion4_3.Text := Fields[3].AsString;
       /////////////////////////////////////////////////////////////////////////

       /////////////////////////////////////////////////////////////////////////
       if vY1BossYN = 'N' then
            vParamSQL := 'SELECT E1VALVIEW, E2VALVIEW,                      '+
                         '       '' '' Field1, '' '' Field2, '' ''  Field3  '+
                         '  FROM pehremas                                   '+
                         ' WHERE rabasdate = '''+ FM_Main.vRabasdate1 +'''          '+
                         '   AND empno     = '''+ vEmp                +'''          '
       else
            vParamSQL := 'SELECT E1VALVIEW, E2VALVIEW,                      '+
                         '       '' '' Field1, '' '' Field2, '' ''  Field3  '+
                         '  FROM peTremas                                   '+
                         ' WHERE rabasdate = '''+ FM_Main.vRabasdate1 +'''          '+
                         '   AND empno     = '''+ vEmp                +'''          ';
       Close;
       ServiceName := 'HINSA_select3';
       ClearFieldInfo;
       AddField('E1VALVIEW', ftString, 2000);
       AddField('E2VALVIEW', ftString, 2000);
       AddField('Field1'   , ftString, 2000);
       AddField('Field2'   , ftString, 2000);
       AddField('Field3'   , ftString, 2000);
       ClearParamInfo;
       SQL.Text := vParamSQL;
       Open;
       Memo_E1_1.text := FieldByName('E1VALVIEW').AsString;
       Memo_E2_1.text := FieldByName('E2VALVIEW').AsString;


       if vY2BossYN = 'N' then
            vParamSQL := 'SELECT E1VALVIEW, E2VALVIEW,                      '+
                         '       '' '' Field1, '' '' Field2, '' ''  Field3  '+
                         '  FROM pehremas                                   '+
                         ' WHERE rabasdate = '''+ FM_Main.vRabasdate2 +'''          '+
                         '   AND empno     = '''+ vEmp                +'''          '
       else
            vParamSQL := 'SELECT E1VALVIEW, E2VALVIEW,                      '+
                         '       '' '' Field1, '' '' Field2, '' ''  Field3  '+
                         '  FROM peTremas                                   '+
                         ' WHERE rabasdate = '''+ FM_Main.vRabasdate2 +'''          '+
                         '   AND empno     = '''+ vEmp                +'''          ';

       Close;
       SQL.Text := vParamSQL;
       Open;
       Memo_E1_2.text := FieldByName('E1VALVIEW').AsString;
       Memo_E2_2.text := FieldByName('E2VALVIEW').AsString;


       if vY3BossYN = 'N' then
            vParamSQL := 'SELECT E1VALVIEW, E2VALVIEW,                      '+
                         '       '' '' Field1, '' '' Field2, '' ''  Field3  '+
                         '  FROM pehremas                                   '+
                         ' WHERE rabasdate = '''+ FM_Main.vRabasdate3 +'''          '+
                         '   AND empno     = '''+ vEmp                +'''          '
       else
            vParamSQL := 'SELECT E1VALVIEW, E2VALVIEW,                      '+
                         '       '' '' Field1, '' '' Field2, '' ''  Field3  '+
                         '  FROM peTremas                                   '+
                         ' WHERE rabasdate = '''+ FM_Main.vRabasdate3 +'''          '+
                         '   AND empno     = '''+ vEmp                +'''          ';
       Close;
       SQL.Text := vParamSQL;
       Open;
       Memo_E1_3.text := FieldByName('E1VALVIEW').AsString;
       Memo_E2_3.text := FieldByName('E2VALVIEW').AsString;
  end;
end;


end.
