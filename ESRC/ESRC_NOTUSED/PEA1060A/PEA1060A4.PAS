unit PEA1060A4;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  peoutlookbtn, StdCtrls, DBCtrls, ExtCtrls, DBCGrids, PeJeonLabel, DB,
  pegradpanl;

type
  TSub_Form2 = class(TForm)
    P_Title: TPeJeonGrdPanel;
    PeJeonLabel2: TPeJeonLabel;
    PeJeonLabel6: TPeJeonLabel;
    PeJeonLabel7: TPeJeonLabel;
    Grid1: TDBCtrlGrid;
    Db_plan1: TDBText;
    Db_plan2: TDBText;
    Db_plan3: TDBText;
    Db_plan5: TDBText;
    Db_plan4: TDBText;
    Db_forweight: TDBText;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    DB_Validx1: TDBText;
    DB_Validx2: TDBText;
    DB_Validx3: TDBText;
    DB_Validx4: TDBText;
    DB_Validx5: TDBText;
    Bevel13: TBevel;
    Bevel15: TBevel;
    Bevel16: TBevel;
    Bevel17: TBevel;
    Bevel18: TBevel;
    Db_deweight1: TDBText;
    Db_deweight2: TDBText;
    Db_deweight3: TDBText;
    Db_deweight4: TDBText;
    Db_deweight5: TDBText;
    Db_propeltask: TDBMemo;
    DB_s1: TDBText;
    DB_s2: TDBText;
    DB_s3: TDBText;
    DB_s4: TDBText;
    DB_s5: TDBText;
    PeJeonLabel15: TPeJeonLabel;
    PeJeonLabel16: TPeJeonLabel;
    PeJeonLabel17: TPeJeonLabel;
    PeJeonLabel18: TPeJeonLabel;
    PeJeonLabel5: TPeJeonLabel;
    Bevel3: TBevel;
    Bevel6: TBevel;
    Bevel7: TBevel;
    Bevel8: TBevel;
    DB_a1: TDBText;
    DB_a2: TDBText;
    DB_a3: TDBText;
    DB_a4: TDBText;
    DB_a5: TDBText;
    DB_b1: TDBText;
    DB_b2: TDBText;
    DB_b3: TDBText;
    DB_b4: TDBText;
    DB_b5: TDBText;
    DB_c1: TDBText;
    DB_c2: TDBText;
    DB_c3: TDBText;
    DB_c4: TDBText;
    DB_c5: TDBText;
    DB_d1: TDBText;
    DB_d2: TDBText;
    DB_d3: TDBText;
    DB_d4: TDBText;
    DB_d5: TDBText;
    PeJeonGrdPanel2: TPeJeonGrdPanel;
    Bt_del: TPeJeonOutLookBtn;
    Bt_Add: TPeJeonOutLookBtn;
    Bt_Exit: TPeJeonOutLookBtn;
    procedure FormPaint(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Bt_AddClick(Sender: TObject);
    procedure Bt_ExitClick(Sender: TObject);
  private
    { Private declarations }

     procedure Read_pehreaim_det;

  public
    { Public declarations }
  end;

var
  Sub_Form2: TSub_Form2;

implementation
 uses
  PeMainForm, Hinsa_TmaxDM, peDm, pea1060a1, pea1060a2, pea1060a3, PEA1060A5;
{$R *.DFM}

procedure TSub_Form2.FormPaint(Sender: TObject);
begin
  //Read_pehreaim_det;
end;

// 관리직 자료 읽기
procedure TSub_Form2.Read_pehreaim_det;
var
  SqlText,sql : string;
begin
//  Try
   with DM.DBSet6 do
   begin
      SqlText := 'SELECT NVL(TO_CHAR(SEQNO),''0''), NVL(PROPELTASK,''''), NVL(TO_CHAR(MAINWEIGHT),''0''),             '+
                 '       NVL(DETAILTASK1,''''), NVL(DETAILTASK2,''''), NVL(DETAILTASK3,''''),                         '+
                 '       NVL(DETAILTASK4,''''), NVL(DETAILTASK5,''''), NVL(TO_CHAR(DETAILWEIGHT1  ),''0''),           '+
                 '       NVL(TO_CHAR(DETAILWEIGHT2  ),''0''), NVL(TO_CHAR(DETAILWEIGHT3  ),''0''),                    '+
                 '       NVL(TO_CHAR(DETAILWEIGHT4  ),''0''), NVL(TO_CHAR(DETAILWEIGHT5  ),''0''),                    '+
                 '       NVL(VALIDX1,''''), NVL(VALIDX2,''''), NVL(VALIDX3,''''), NVL(VALIDX4,''''),                  '+
                 '       NVL(VALIDX5,''''), NVL(VALFUNCTION1,''''), NVL(VALFUNCTION2,''''), NVL(VALFUNCTION3,''''),   '+
                 '       NVL(VALFUNCTION4,''''), NVL(VALFUNCTION5,''''), NVL(SRESULTCLASS1,''''),                     '+
                 '       NVL(ARESULTCLASS1,''''), NVL(BRESULTCLASS1,''''), NVL(CRESULTCLASS1,''''),                   '+
                 '       NVL(DRESULTCLASS1,''''), NVL(SRESULTCLASS2,''''), NVL(ARESULTCLASS2,''''),                   '+
                 '       NVL(BRESULTCLASS2,''''), NVL(CRESULTCLASS2,''''), NVL(DRESULTCLASS2,''''),                   '+
                 '       NVL(SRESULTCLASS3,''''), NVL(ARESULTCLASS3,''''), NVL(BRESULTCLASS3,''''),                   '+
                 '       NVL(CRESULTCLASS3,''''), NVL(DRESULTCLASS3,''''), NVL(SRESULTCLASS4,''''),                   '+
                 '       NVL(ARESULTCLASS4,''''), NVL(BRESULTCLASS4,''''), NVL(CRESULTCLASS4,''''),                   '+
                 '       NVL(DRESULTCLASS4,''''), NVL(SRESULTCLASS5,''''), NVL(ARESULTCLASS5,''''),                   '+
                 '       NVL(BRESULTCLASS5,''''), NVL(CRESULTCLASS5,''''), NVL(DRESULTCLASS5,''''),                   '+
                 '       NVL(E1PRJOPINON  ,''''), NVL(KORNAME,''''), NVL(EMPNO,''''), NVL(RPRJCONYN,''''),            '+
                 '       NVL(RPRJCONDATE,''''), NVL(E1EMPNO,''''), NVL(E1PRJCONYN,''''), NVL(E1PRJCONDATE,''''),      '+
                 '       NVL(E1PRJVIEW,''''), NVL(E1PRJOBJYN,''''), NVL(EBREMPNO,''''), NVL(EBRPRJCONYN,''''),        '+
                 '       NVL(EBRPRJCONDATE,''''), NVL(EBRPRJVIEW,''''), NVL(EBRVALOBJYN,''''), NVL(E2EMPNO,''''),     '+
                 '       NVL(E2PRJCONYN,''''), NVL(E2PRJCONDATE,''''), NVL(E2PRJVIEW,''''), NVL(E2VALOBJYN,'''')      '+
                 '  FROM (                                                                                            '+
                 '        SELECT B.SEQNO,B.PROPELTASK, B.MAINWEIGHT,                                                  '+
                 '               B.DETAILTASK1, B.DETAILTASK2, B.DETAILTASK3, B.DETAILTASK4, B.DETAILTASK5,           '+
                 '               B.DETAILWEIGHT1, B.DETAILWEIGHT2, B.DETAILWEIGHT3, B.DETAILWEIGHT4, B.DETAILWEIGHT5, '+
                 '               B.VALIDX1, B.VALIDX2, B.VALIDX3, B.VALIDX4, B.VALIDX5,                               '+
                 '               B.VALFUNCTION1, B.VALFUNCTION2, B.VALFUNCTION3, B.VALFUNCTION4, B.VALFUNCTION5,      '+
                 '               B.SRESULTCLASS1, B.ARESULTCLASS1, B.BRESULTCLASS1, B.CRESULTCLASS1, B.DRESULTCLASS1, '+
                 '               B.SRESULTCLASS2, B.ARESULTCLASS2, B.BRESULTCLASS2, B.CRESULTCLASS2, B.DRESULTCLASS2, '+
                 '               B.SRESULTCLASS3, B.ARESULTCLASS3, B.BRESULTCLASS3, B.CRESULTCLASS3, B.DRESULTCLASS3, '+
                 '               B.SRESULTCLASS4, B.ARESULTCLASS4, B.BRESULTCLASS4, B.CRESULTCLASS4, B.DRESULTCLASS4, '+
                 '               B.SRESULTCLASS5, B.ARESULTCLASS5, B.BRESULTCLASS5, B.CRESULTCLASS5, B.DRESULTCLASS5, '+
                 '               B.E1PRJOPINON,  A.KORNAME, A.EMPNO, A.RPRJCONYN,A.RPRJCONDATE,                       '+
                 '               A.E1EMPNO,A.E1PRJCONYN,A.E1PRJCONDATE,A.E1PRJVIEW,A.E1PRJOBJYN,                      '+
                 '               A.EBREMPNO,A.EBRPRJCONYN,A.EBRPRJCONDATE,A.EBRPRJVIEW,A.EBRVALOBJYN,                 '+
                 '               A.E2EMPNO,A.E2PRJCONYN,A.E2PRJCONDATE,A.E2PRJVIEW,A.E2VALOBJYN                       '+
                 //'          FROM PEHREMAS A, PEHREAIM_DET B                                                           '+
                 '          FROM PEHREMAS A, PEHREAIM_COM B                                                           '+
                 //'         WHERE A.RABASDATE = ''' + LRABASDATE + '''                                                 '+
                 '         WHERE A.RABASDATE = ''' + MainForm.Lrabasdate + '''                                                 '+
                 //'           AND A.EMPNO     = ''' + ED_EMPNO.LABELHINT + '''                                         '+
                 '           AND A.EMPNO     = ''' + MainForm.ED_EMPNO.LABELHINT + '''                                         '+
                 '           AND A.RABASDATE = B.RABASDATE                                                            '+
                 '           AND A.EMPNO     = B.EMPNO                                                                '+
                 '         )                                                                                          '+
                 ' ORDER BY SEQNO                                                                                     ';
            //MainForm.Lrabasdate
      Db_propeltask.DataField := 'PROPELTASK';     //중점 추진활동
      Db_forweight.DataField  := 'MAINWEIGHT';     //비중
      Db_plan1.DataField      := 'DETAILTASK1';    //세부 추진활동
      Db_plan2.DataField      := 'DETAILTASK2';
      Db_plan3.DataField      := 'DETAILTASK3';
      Db_plan4.DataField      := 'DETAILTASK4';
      Db_plan5.DataField      := 'DETAILTASK5';
      Db_deweight1.DataField  := 'DETAILWEIGHT1';  //상세비중
      Db_deweight2.DataField  := 'DETAILWEIGHT2';
      Db_deweight3.DataField  := 'DETAILWEIGHT3';
      Db_deweight4.DataField  := 'DETAILWEIGHT4';
      Db_deweight5.DataField  := 'DETAILWEIGHT5';
      Db_validx1.DataField    := 'VALIDX1';        //평가 지표
      Db_validx2.DataField    := 'VALIDX2';
      Db_validx3.DataField    := 'VALIDX3';
      Db_validx4.DataField    := 'VALIDX4';
      Db_validx5.DataField    := 'VALIDX5';
{
      DB_s1.DataField         := 'BRESULTCLASS1';           //달성목표
      DB_a1.DataField         := 'BRESULTCLASS2';
      DB_b1.DataField         := 'BRESULTCLASS3';
      DB_c1.DataField         := 'BRESULTCLASS4';
      DB_d1.DataField         := 'BRESULTCLASS5';
}
      Close;

      ServiceName := 'PEA1060A_sel2';
      ClearFieldInfo;
      ClearParamInfo;

      AddField('SEQNO'              , ftString, 2  );
      AddField('PROPELTASK'         , ftString, 100 );
      AddField('MAINWEIGHT'         , ftString, 3 );
      AddField('DETAILTASK1'        , ftString, 100);
      AddField('DETAILTASK2'        , ftString, 100 );
      AddField('DETAILTASK3'        , ftString, 100 );
      AddField('DETAILTASK4'        , ftString, 100 );
      AddField('DETAILTASK5'        , ftString, 100 );
      AddField('DETAILWEIGHT1'      , ftString, 3 );
      AddField('DETAILWEIGHT2'      , ftString, 3 );
      AddField('DETAILWEIGHT3'      , ftString, 3 );
      AddField('DETAILWEIGHT4'      , ftString, 3 );
      AddField('DETAILWEIGHT5'      , ftString, 3 );
      AddField('VALIDX1'            , ftString, 100 );
      AddField('VALIDX2'            , ftString, 100 );
      AddField('VALIDX3'            , ftString, 100 );
      AddField('VALIDX4'            , ftString, 100 );
      AddField('VALIDX5'            , ftString, 100 );
      AddField('VALFUNCTION1'       , ftString, 100 );
      AddField('VALFUNCTION2'       , ftString, 100 );
      AddField('VALFUNCTION3'       , ftString, 100 );
      AddField('VALFUNCTION4'       , ftString, 100 );
      AddField('VALFUNCTION5'       , ftString, 100 );
      AddField('SRESULTCLASS1'      , ftString, 100 );
      AddField('ARESULTCLASS1'      , ftString, 100 );
      AddField('BRESULTCLASS1'      , ftString, 100 );
      AddField('CRESULTCLASS1'      , ftString, 100 );
      AddField('DRESULTCLASS1'      , ftString, 100 );
      AddField('SRESULTCLASS2'      , ftString, 100 );
      AddField('ARESULTCLASS2'      , ftString, 100 );
      AddField('BRESULTCLASS2'      , ftString, 100 );
      AddField('CRESULTCLASS2'      , ftString, 100 );
      AddField('DRESULTCLASS2'      , ftString, 100 );
      AddField('SRESULTCLASS3'      , ftString, 100 );
      AddField('ARESULTCLASS3'      , ftString, 100 );
      AddField('BRESULTCLASS3'      , ftString, 100 );
      AddField('CRESULTCLASS3'      , ftString, 100 );
      AddField('DRESULTCLASS3'      , ftString, 100 );
      AddField('SRESULTCLASS4'      , ftString, 100 );
      AddField('ARESULTCLASS4'      , ftString, 100 );
      AddField('BRESULTCLASS4'      , ftString, 100 );
      AddField('CRESULTCLASS4'      , ftString, 100 );
      AddField('DRESULTCLASS4'      , ftString, 100 );
      AddField('SRESULTCLASS5'      , ftString, 100 );
      AddField('ARESULTCLASS5'      , ftString, 100 );
      AddField('BRESULTCLASS5'      , ftString, 100 );
      AddField('CRESULTCLASS5'      , ftString, 100 );
      AddField('DRESULTCLASS5'      , ftString, 100 );
      AddField('E1PRJOPINON'        , ftString, 200 );
      AddField('KORNAME'            , ftString, 12 );
      AddField('EMPNO'              , ftString, 4  );
      AddField('RPRJCONYN'          , ftString, 1  );
      AddField('RPRJCONDATE'        , ftString, 8  );
      AddField('E1EMPNO'            , ftString, 4  );
      AddField('E1PRJCONYN'         , ftString, 1  );
      AddField('E1PRJCONDATE'       , ftString, 8  );
      AddField('E1PRJVIEW'          , ftString, 200);
      AddField('E1VALOBJYN'         , ftString, 1  );
      AddField('EBREMPNO'           , ftString, 4  );
      AddField('EBRPRJCONYN'        , ftString, 1  );
      AddField('EBRPRJCONDATE'      , ftString, 8  );
      AddField('EBRPRJVIEW'         , ftString, 200);
      AddField('EBRVALOBJYN'        , ftString, 1  );
      AddField('E2EMPNO'            , ftString, 4  );
      AddField('E2PRJCONYN'         , ftString, 1  );
      AddField('E2PRJCONDATE'       , ftString, 8  );
      AddField('E2PRJVIEW'          , ftString, 200);
      AddField('E2VALOBJYN'         , ftString, 1  );
      SQL.Text := Sqltext;
      Open;

   end;
   {
   //전체 비중 합계
   Sql := 'select sum(mainweight) from PEHREAIM_DET'+
   format(' WHERE rabasdate=''%s'' and empno = ''%s'' ',[Lrabasdate,Ed_empno.LabelHint]);

   DataModule_Tmax.Csel_SQL := Sql;
   DataModule_Tmax.Csel_Open4;
   g_mainweight     := DataModule_Tmax.Csel_gfd4(1);
   if g_mainweight = '' then
      g_mainweight := '0';

   Eda_weight.value := StrToInt(g_mainweight);
   }
end;


procedure TSub_Form2.FormShow(Sender: TObject);
begin
  Read_pehreaim_det;
end;

procedure TSub_Form2.Bt_AddClick(Sender: TObject);
begin
   sub_Form3.ShowModal;
end;

procedure TSub_Form2.Bt_ExitClick(Sender: TObject);
begin
   close;
end;

end.
