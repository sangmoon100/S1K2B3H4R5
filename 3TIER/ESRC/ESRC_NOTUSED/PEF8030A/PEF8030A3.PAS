unit PEF8030A3;

interface

uses
  Windows,  Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons,  ExtCtrls, ComCtrls,Mask, numedit, Grids, DBGrids, Db, DBClient,
  DBTables, Imm, MemDS, DBAccess, Ora, Func, Tmax_session, Tmax_DataSetText,
  OnInsaCommon, TmaxFunc, OnFocusButton, OnGrDBGrid, OnLineLabel,
  OnEditStdCtrl, OnEditBaseCtrl, OnEditBtnCtrl, OnTmaxPersonEdit, OnScheme,
  OnPopupEdit, PeJeonLabel, OnEditMemo, kpaylib, Comobj, PDownLoad, OnRegistry,
  ShellApi, OnInternetFTP, OnEditCombo, OnEditNumCtl, peoutlookbtn,
  PeJeonMemo, pebtnedit, pegradpanl ;

type
  TFM_Sub = class(TForm)
    OnSchemeForm1: TOnSchemeForm;
    Panel5: TPanel;
    Eda_plan5: TOnEdit;
    Eda_plan4: TOnEdit;
    GroupBox1: TPanel;
    Panel2: TPanel;
    Eda_Sresult1: TOnEdit;
    Eda_Aresult1: TOnEdit;
    Eda_B_result1: TOnEdit;
    Eda_Cresult1: TOnEdit;
    Eda_Dresult1: TOnEdit;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    Label2: TLabel;
    Eda_propeltask: TOnEdit;
    Eda_plan1: TOnEdit;
    Eda_validx: TOnEdit;
    Eda_Bresult1: TOnEdit;
    Eda_foraim1: TOnEdit;
    GroupBox2: TPanel;
    Panel4: TPanel;
    Eda_Sresult2: TOnEdit;
    Eda_Aresult2: TOnEdit;
    Eda_B_result2: TOnEdit;
    Eda_Cresult2: TOnEdit;
    Eda_Dresult2: TOnEdit;
    Eda_plan2: TOnEdit;
    Eda_validx2: TOnEdit;
    Eda_Bresult2: TOnEdit;
    Eda_foraim2: TOnEdit;
    GroupBox3: TPanel;
    Eda_Sresult3: TOnEdit;
    Panel6: TPanel;
    Eda_Aresult3: TOnEdit;
    Eda_B_result3: TOnEdit;
    Eda_Cresult3: TOnEdit;
    Eda_Dresult3: TOnEdit;
    Eda_plan3: TOnEdit;
    Eda_validx3: TOnEdit;
    Eda_Bresult3: TOnEdit;
    Eda_foraim3: TOnEdit;
    GroupBox4: TPanel;
    Eda_Sresult4: TOnEdit;
    Panel8: TPanel;
    Eda_B_result4: TOnEdit;
    Eda_Cresult4: TOnEdit;
    Eda_Dresult4: TOnEdit;
    Eda_Aresult4: TOnEdit;
    Eda_validx4: TOnEdit;
    Eda_Bresult4: TOnEdit;
    Eda_foraim4: TOnEdit;
    GroupBox5: TPanel;
    Panel16: TPanel;
    Eda_Sresult5: TOnEdit;
    Eda_Aresult5: TOnEdit;
    Eda_B_result5: TOnEdit;
    Eda_Cresult5: TOnEdit;
    Eda_Dresult5: TOnEdit;
    Eda_validx5: TOnEdit;
    Eda_Bresult5: TOnEdit;
    Eda_foraim5: TOnEdit;
    Eda_detweight1: TOnNumberEdit;
    Eda_detweight2: TOnNumberEdit;
    Eda_detweight3: TOnNumberEdit;
    Eda_forweight: TOnNumberEdit;
    Eda_detweight4: TOnNumberEdit;
    Eda_detweight5: TOnNumberEdit;
    ms1: TLabel;
    THintMail: TTMaxDataSet;
    SUBSet1: TTMaxDataSet;
    Bt_Exit: TOnFocusButton;
    procedure Bt_ExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    Start       : Boolean;
    detailweight: real;
    procedure Data_Display;
    procedure Read_PEJNOEMP_det;

  public
    { Public declarations }
    DbSet1     : TDataSet;
    Pwork      : string;
    LSeqno     : real;
    Chk : String;
  end;

var
  FM_Sub: TFM_Sub;

implementation

uses PEF8030A1, pef8030a2;


{$R *.DFM}

procedure TFM_Sub.FormCreate(Sender: TObject);
begin
  Chk := '0';
  Data_Display;

  if Eda_Bresult1.Text <> '' then
    GroupBox1.Visible := true
  else
    GroupBox1.Visible := false;

  if Eda_Bresult2.Text <> '' then
    GroupBox2.Visible := true
  else
    GroupBox2.Visible := false;

  if Eda_Bresult3.Text <> '' then
    GroupBox3.Visible := true
  else
    GroupBox3.Visible := false;

  if Eda_Bresult4.Text <> '' then
    GroupBox4.Visible := true
  else
    GroupBox4.Visible := false;

  if Eda_Bresult5.Text <> '' then
    GroupBox5.Visible := true
  else
    GroupBox5.Visible := false;

  Eda_B_result1.Enabled:=false;
  Eda_B_result2.Enabled:=false;
  Eda_B_result3.Enabled:=false;
  Eda_B_result4.Enabled:=false;
  Eda_B_result5.Enabled:=false;

  //비중
  Eda_forweight.value:=Eda_detweight1.Value + Eda_detweight2.Value + Eda_detweight3.Value + Eda_detweight4.Value + Eda_detweight5.Value;

  If Chk = '1' Then
  Begin
    Application.MessageBox(PChar(' 등록된 자료가 없습니다. '),'에러',mb_ok);
  End;
end;

procedure TFM_Sub.Data_Display;
begin
  Read_PEJNOEMP_det;
  DbSet1 := SUBSet1;

  If (SUBSet1.RecordCount > 0) Then
  Begin
    Eda_propeltask.Text := DbSet1.FieldByName('propeltask').AsString;
    Eda_plan1.Text      := DbSet1.FieldByName('detailtask1').AsString;
    Eda_plan2.Text      := DbSet1.FieldByName('detailtask2').AsString;
    Eda_plan3.Text      := DbSet1.FieldByName('detailtask3').AsString;
    Eda_plan4.Text      := DbSet1.FieldByName('detailtask4').AsString;
    Eda_plan5.Text      := DbSet1.FieldByName('detailtask5').AsString;
    Eda_detweight1.Text := DbSet1.FieldByName('detailweight1').AsString;
    Eda_detweight2.Text := DbSet1.FieldByName('detailweight2').AsString;
    Eda_detweight3.Text := DbSet1.FieldByName('detailweight3').AsString;
    Eda_detweight4.Text := DbSet1.FieldByName('detailweight4').AsString;
    Eda_detweight5.Text := DbSet1.FieldByName('detailweight5').AsString;
    Eda_validx.Text     := DbSet1.FieldByName('validx1').AsString;
    Eda_validx2.Text    := DbSet1.FieldByName('validx2').AsString;
    Eda_validx3.Text    := DbSet1.FieldByName('validx3').AsString;
    Eda_validx4.Text    := DbSet1.FieldByName('validx4').AsString;
    Eda_validx5.Text    := DbSet1.FieldByName('validx5').AsString;
    Eda_foraim1.Text    := DbSet1.FieldByName('valfunction1').AsString;
    Eda_foraim2.Text    := DbSet1.FieldByName('valfunction2').AsString;
    Eda_foraim3.Text    := DbSet1.FieldByName('valfunction3').AsString;
    Eda_foraim4.Text    := DbSet1.FieldByName('valfunction4').AsString;
    Eda_foraim5.Text    := DbSet1.FieldByName('valfunction5').AsString;
    Eda_Sresult1.Text   := DbSet1.FieldByName('sresultclass1').AsString;
    Eda_Aresult1.Text   := DbSet1.FieldByName('aresultclass1').AsString;
    Eda_Bresult1.Text   := DbSet1.FieldByName('bresultclass1').AsString;
    Eda_Cresult1.Text   := DbSet1.FieldByName('cresultclass1').AsString;
    Eda_Dresult1.Text   := DbSet1.FieldByName('dresultclass1').AsString;
    Eda_Sresult2.Text   := DbSet1.FieldByName('sresultclass2').AsString;
    Eda_Aresult2.Text   := DbSet1.FieldByName('aresultclass2').AsString;
    Eda_Bresult2.Text   := DbSet1.FieldByName('bresultclass2').AsString;
    Eda_Cresult2.Text   := DbSet1.FieldByName('cresultclass2').AsString;
    Eda_Dresult2.Text   := DbSet1.FieldByName('dresultclass2').AsString;
    Eda_Sresult3.Text   := DbSet1.FieldByName('sresultclass3').AsString;
    Eda_Aresult3.Text   := DbSet1.FieldByName('aresultclass3').AsString;
    Eda_Bresult3.Text   := DbSet1.FieldByName('bresultclass3').AsString;
    Eda_Cresult3.Text   := DbSet1.FieldByName('cresultclass3').AsString;
    Eda_Dresult3.Text   := DbSet1.FieldByName('dresultclass3').AsString;
    Eda_Sresult4.Text   := DbSet1.FieldByName('sresultclass4').AsString;
    Eda_Aresult4.Text   := DbSet1.FieldByName('aresultclass4').AsString;
    Eda_Bresult4.Text   := DbSet1.FieldByName('bresultclass4').AsString;
    Eda_Cresult4.Text   := DbSet1.FieldByName('cresultclass4').AsString;
    Eda_Dresult4.Text   := DbSet1.FieldByName('dresultclass4').AsString;
    Eda_Sresult5.Text   := DbSet1.FieldByName('sresultclass5').AsString;
    Eda_Aresult5.Text   := DbSet1.FieldByName('aresultclass5').AsString;
    Eda_Bresult5.Text   := DbSet1.FieldByName('bresultclass5').AsString;
    Eda_Cresult5.Text   := DbSet1.FieldByName('cresultclass5').AsString;
    Eda_Dresult5.Text   := DbSet1.FieldByName('dresultclass5').AsString;
    LSeqno              := StrToFloat(DbSet1.FieldByName('seqno').AsString);
    Chk := '0'
  End
  Else Chk := '1';

  Eda_forweight.value:=Eda_detweight1.Value + Eda_detweight2.Value + Eda_detweight3.Value + Eda_detweight4.Value + Eda_detweight5.Value;
end;

procedure TFM_Sub.Read_PEJNOEMP_det;
var
  SqlText,sql : string;
begin
   with SUBSet1 do
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
                 '               B.E1PRJOPINON,  A.KORNAME, A.EMPNO,  '''' RPRJCONYN, '''' RPRJCONDATE,               '+
                 '               A.E1EMPNO,     '''' E1PRJCONYN, '''' E1PRJCONDATE, '''' E1PRJVIEW, '''' E1PRJOBJYN,  '+
                 '               '''' EBREMPNO, '''' EBRPRJCONYN,'''' EBRPRJCONDATE,'''' EBRPRJVIEW,'''' EBRVALOBJYN, '+
                 '               '''' E2EMPNO,  '''' E2PRJCONYN, '''' E2PRJCONDATE, '''' E2PRJVIEW, '''' E2VALOBJYN   '+
                 '          FROM PEJNOMAS A, PEJNOEMP_DET B                                                           '+
                 '         WHERE A.RABASDATE = ''' + FM_Main.BRABASDATE + '''                                         '+
                 '           AND A.EMPNO     = ''' + Copy(FM_Main.Ed_empno.Text,1,4) + '''                            '+
                 '           AND A.RABASDATE = B.RABASDATE                                                            '+
                 '           AND A.EMPNO     = B.EMPNO                                                                '+
                 '         )                                                                                          '+
                 ' ORDER BY SEQNO                                                                                     ';

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
      SQL.Text := SqlText;

      Open;
   end;
end;

procedure TFM_Sub.Bt_ExitClick(Sender: TObject);
begin
  Close;
end;


end.


