unit UDown_Value2;  //2�� �����

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, Buttons, ExtCtrls, Pass, DBGrids, Db, DBClient,
  peoutlookbtn, PeJeonVertLabel, PeJeonLabel, pegradpanl, ComCtrls,
  OnEditBaseCtrl, OnEditStdCtrl, OnEditMemo, Tmax_DataSetText;

type
  TFDown_Value2 = class(TForm)
    SB_Score: TPeJeonOutLookBtn;
    BB_Save: TPeJeonOutLookBtn;
    BB_Cancel: TPeJeonOutLookBtn;
    P_Info: TPeJeonLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    L_eempno: TLabel;
    Label14: TLabel;
    CB_empno: TLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    SG_Image01: TStringGrid;
    SG_HiddenData01: TStringGrid;
    LT_Count: TPanel;
    Label16: TLabel;
    L_Total01: TLabel;
    L_Yes01: TLabel;
    L_duname: TLabel;
    LT_First: TPanel;
    Panel1: TPanel;
    LT_Self: TPanel;
    Panel3: TPanel;
    SG_ItemImage01: TStringGrid;
    OM_Merit_V2: TOnMemo;
    OnMemo1: TOnMemo;
    M_Opnion1: TOnMemo;
    OM_Merit_V1: TOnMemo;
    CB_ShowClass01: TCheckBox;
    TDS1: TTMaxDataSet;
    procedure FormCreate(Sender: TObject);
    procedure SG_ItemImage01DrawCell(Sender: TObject; Col, Row: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SG_Image01DrawCell(Sender: TObject; Col, Row: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SG_Score01Enter(Sender: TObject);
    procedure SB_YesNo01Click(Sender: TObject);
    procedure SG_Image01KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure CB_empnoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BB_CancelClick(Sender: TObject);
    procedure SB_ScoreClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
  private
    procedure OnlyVisible;
    procedure Retrieve_Data01;
    procedure ShowImage01;
    function SearchAndReplace(sSrc, sLookFor, sReplaceWith: string ): string;
    procedure Adjust_DropDownRows(CB_name: TComboBox);
    procedure ShowSum01;

    procedure Retrieve_Head(Sender: TObject);
    { Private declarations }
  public
    Pempno, Pkorname, Password, Ppermission: string;
    var_Able1, var_Able2, var_Able3, var_Able4 : String; //�ɷ�, �µ� ��Ȯ�� ����
    var_paycl   : String; //���޺� ��ǥ��ȣ�� �Ҿ�������� �߰�.  dsa2000 2008.09.
    gsItemIdx   : Integer;  //CB_empno�� itemindex..
    gsEkind     : String; //�򰡺з�
    var_evcno   : String; //��ǥ��ȣ
    var_itemno  : String;
    var_empno   : String; //������ ���
    var_korname : String; //������ ����
    var_jobkind : String; //������ ����
    var_FistEmp : String; //1������ ���
    var_FistEbrEmp : String; //1��(����)���� ���

    gsColYn     : String; //�����򰡸�������
    gsSelfYn    : String; //�ڱ��򰡸�������
    gsFirstYn   : String; //���1���򰡸�������
    gsFirstEbrYn: String; //���1��(����)�򰡸�������

    Running: Boolean;
    iWidth_ItemName :Integer;
    iWidth_ItemDesc :Integer;
    iWidth_EbrScore :Integer;
//==============================================================================//
//  31.32     2002.06.06      ������    ��������ȸ��� �߰�
//==============================================================================//
    iWidth_LTCount    :Integer;
    iLeft_LTTot      :Integer;
    iLeft_LTDept     :Integer;
    iLeft_LTCol      :Integer;
    iLeft_LTSelf     :Integer;
    iLeft_LTFirst    :Integer;
    iLeft_LTFirstEbr :Integer;

    iWidth_LTitle    :Integer;
    iLeft_LTot       :Integer;
    iLeft_LDept      :Integer;
    iLeft_LCol       :Integer;
    iLeft_LSelf      :Integer;
    iLeft_LFirst     :Integer;
    iLeft_LFirstEbr  :Integer;
//==============================================================================//

    function IsDataModified01: Boolean;
    { Public declarations }
  end;

const
  // SG_HiddenData �� index
  dITEM_IDX        =  0; // ���׸��ȣ
  dITEMNAME_IDX    =  1; // ���׸��
  dIMAGE_IDX       =  2; // ���̹�����ȣ
  dITEMDESC_IDX    =  3; // ���̹�������
  dCSCORE_IDX      =  4; //����������
  dSSCORE_IDX      =  5; //�ڱ�������
  dLASCORE_IDX     =  6; //���1��������
  dSCORE_IDX       =  7; // ������(ó��)
  dTMPSCORE_IDX    =  8; // ������ ������
  dMODIFIED_IDX    =  9; // �ڷắ������
  dOBJYN_IDX       = 10; // ���ǽ�û����
  dOBJSAYU_IDX     = 11; // ���������ǽ�û����
  dOBJOPINION1_IDX = 12; // 1�� �����򰡼Ұ�
  dOBJOPINION2_IDX = 13; // 2�� �����򰡼Ұ�

  // SG_Image �� index
  mITEMNAME_IDX = 0;
  mITEMDESC_IDX = 1;
  mITEMCOL_IDX  = 2;
  mITEMSELF_IDX = 3;
  mITEME1_IDX   = 4;
  mITEMEBR_IDX  = 5;

 // SG_Score�� index
  dS_IDX  = 0;
  dA_IDX  = 1;
  dB_IDX  = 2;
  dC_IDX  = 3;
  dD_IDX  = 4;

  var_ScrS = '100';
  var_ScrA = '90';
  var_ScrB = '80';
  var_ScrC = '70';
  var_ScrD = '60';

  var_GrdS = 'S';
  var_GrdA = 'A';
  var_GrdB = 'B';
  var_GrdC = 'C';
  var_GrdD = 'D';
var
  FDown_Value2: TFDown_Value2;

implementation

{$R *.DFM}

uses
  Hinsa_TmaxDM, UFm_Marks, kpaylib, HSubForm;

{----------------------------------Form Open-----------------------------------}
procedure TFDown_Value2.FormCreate(Sender: TObject);
begin
  Running := False;
end;

procedure TFDown_Value2.FormShow(Sender: TObject);
var
  ParamVariant: String;
  CompIp: String;
  iy, ix : Integer;
  TempStr : String;
begin
  if Running  then    System.Exit;
  Running := True;
  iy := 0;
  Application.ProcessMessages;
  L_eempno.Caption := Pkorname+' ���� ���Ͻ� ��������';
  CB_empno.Caption := var_korname;

  ParamVariant := 'SELECT  empno || '';'' || evcno || '';'' || jobkind || '';'' || paycl '+   //dsa2000 paycl add
                  '   FROM pehamas ' +
                  '  WHERE rabasdate = '''+sRabasdate+''' ' +
                  '    AND empno     = '''+var_empno+''' ';

  DataModule_Tmax.Csel_SQL := ParamVariant;
  DataModule_Tmax.Csel_Open;
  var_evcno := DataModule_Tmax.Csel_gfd(2);
  var_jobkind := DataModule_Tmax.Csel_gfd(3);
  var_paycl   := DataModule_Tmax.Csel_gfd(4);

  gsEkind     := 'Values';
  PageControl1.ActivePage := TabSheet1;
  PageControl1Change(nil);
  Retrieve_Data01;
//  ShowImage01;
end;

{------------------------------��������� �Լ�---------------------------------}

procedure TFDown_Value2.Retrieve_Data01;
var
  ParamVariant: String;
  i, j        : Integer;
  TempStr    : String;
begin
  //������
  Application.ProcessMessages;
  ParamVariant := 'SELECT  nvl(A.abconyn,''N''),  nvl(A.beconyn,''N'') ,                     '+
                  '        nvl(A.duconyn,''N''),  nvl(A.ValConyn,''N''),                     '+ //dsa2000  2008.09. ValConyn Add
                  '        '' '',    '' '',   '' '',                                         '+
                  '        nvl(C.deptname,'' '') , nvl(D.codename,'' '') ,                   '+
                  '        nvl(DECODE(E.abconyn, ''Y'',                                      '+
                  '        DECODE(E.beconyn, ''Y'', ''Y'', ''N''), ''N''),''N'') conyn       '+
                  '   FROM pesmlb A, pehamas B, pycdept C, pyccode D, pesms E                '+
                  '  WHERE A.rabasdate = '''+sRabasdate+'''                                  '+
                  '    AND A.empno     = '''+var_empno+'''                                   '+
                  '    AND A.eempno    = '''+Pempno+'''                                      '+
                  '    AND A.rabasdate = B.rabasdate                                         '+
                  '    AND A.empno     = B.empno                                             '+
                  '    AND (B.deptcode = C.deptcode(+) AND B.orgnum = C.orgnum(+) )          '+
                  '    AND (B.paycl    = D.codeno(+)   AND ''I112'' = D.codeid(+) )          '+
                  '    AND A.rabasdate = E.rabasdate(+)                                      '+
                  '    AND A.empno     = E.empno(+)                                          ';

  with DataModule_Tmax.TMaxDataSet_HInsa do
  begin
    Close;
    ServiceName := 'PET1020A_selb';           //Server : htmax_pe13
    ClearFieldInfo;
    ClearParamInfo;
    AddField('ABCONYN'   , ftString  ,  1   );
    AddField('BECONYN'   , ftString  ,  1   );
    AddField('DUCONYN'   , ftString  ,  1   );
    AddField('VALCONYN'  , ftString  ,  1   );      //dsa2000  2008.09. ValConyn Add Value �򰡿ϷῩ��.
    AddField('MARK1'     , ftString  ,  300 );
    AddField('MARK2'     , ftString  ,  300 );
    AddField('MARK3'     , ftString  ,  300 );
    AddField('DEPTNAME'  , ftString  ,  60  );
    AddField('CODENAME'  , ftString  ,  20  );
    AddField('CONYN'     , ftString  ,  1   );
    SQL.Text := ParamVariant;
    Open;

    if Eof then
    begin
      MessageDlg('����� �����ڰ� �ƴմϴ�.', mtError, [mbOK], 0);
      screen.Cursor := crDefault;
      Close;
      Exit;
    end;

    CB_empno.Hint := '�Ҽ�: '+ FieldByName('deptname').AsString+'   '+
                     'BAND: '+ FieldByName('codename').AsString;

    if FieldByName('abconyn').AsString <> 'Y' then var_Able1 := 'N' //������Ȯ�ο���
    else                                           var_Able1 := 'Y';

    if FieldByName('beconyn').AsString <> 'Y' then var_Able2 := 'N' //��������Ȯ�ο���
    else                                           var_Able2 := 'Y';

    if FieldByName('duconyn').AsString <> 'Y' then var_Able3 := 'N' //������Ȯ�ο���
    else                                           var_Able3 := 'Y';

    if FieldByName('valconyn').AsString <> 'Y' then
    Begin
      var_Able4 := 'N'; //Values ��Ȯ�ο���
      OM_Merit_V1.ReadOnly := False;
      OM_Merit_V2.ReadOnly := False;
    End
    else
    Begin
      var_Able4 := 'Y';
      OM_Merit_V1.ReadOnly := True;
      OM_Merit_V2.ReadOnly := True;
    End;
  end;

  //SG_ItemImage01�� ���� �����..
  for i := 0 to SG_ItemImage01.ColCount - 1 do
    for j := 0 to SG_ItemImage01.RowCount -1 do
      SG_ItemImage01.Cells[i, j] := '';

  i := 0; j := 0;

  ParamVariant := 'SELECT                                               '+
                  '       nvl(to_char(a.itemno     ),''0'') || '';'' || '+
                  '       nvl(        a.imagename   ,'' '') || '';'' || '+
                  '       nvl(        a.imageno,     ''0'') || '';'' || '+
                  '       nvl(        a.imagedesc   ,'' '') || '';'' || '+
                  '       nvl(        a.imagebigo   ,'' '')             '+
                  '  FROM pehacd a                                      '+ // �ɷ��µ���ǥ�̹���, �ɷ��µ��ڱ���, �ɷ��µ���ǥ�׸�
                  ' WHERE a.rabasdate = '''+sRabasdate+'''              '+
                  '   AND a.evcno     = '+var_evcno+'                   '+ // ��ǥ��ȣ
                  '   AND a.ekind     = ''Values''                      '+ // �򰡱���
                  '   AND a.paycl     = '''+var_paycl  +'''             '+
                  '   ORDER BY a.itemno, a.imageno                      ';

  //�׸��� �����ͼ� SG_ItemImage01.�� �ְ�..
  DataModule_Tmax.Csel_SQL :=  ParamVariant;
  DataModule_Tmax.Csel_Open;

  while not DataModule_Tmax.TMaxDataSet_HInsa.Eof do
  begin
      inc(i);
      SG_ItemImage01.Cells[0, i-1] := DataModule_Tmax.Csel_gfd(2);
      SG_ItemImage01.Cells[1, i-1] := DataModule_Tmax.Csel_gfd(4);
//      SG_ItemImage01.Cells[2, i-1] := DataModule_Tmax.Csel_gfd(5);

      DataModule_Tmax.TMaxDataSet_HInsa.Next;
  end;

  //SG_HiddenDate�� �׸��ȣ, �̹�����ȣ, �̹�������, ������, ���濩�θ� �ְ�
  SG_HiddenData01.RowCount := 1;
  for i := 0 to SG_HiddenData01.ColCount - 1 do
    for j := 0 to SG_HiddenData01.RowCount -1 do
      SG_HiddenData01.Cells[i, j] := '';

  i := 0; j := 0;

  //�׸��ȣ, �̹�����ȣ,�̹�������, �ڱ�������, ���1��������,
  ParamVariant := 'SELECT  nvl(TO_CHAR(A.itemno),'' ''), nvl(a.itemname,'' ''), '+#13+  //D.itemname
                  '        nvl('''',''0''),                       '+#13+ //TO_CHAR(A.imageno)
                  '        nvl(A.itemdesc,'' '') Imagedesc ,                    '+#13+  //A.imagedesc
                  '        nvl(TO_CHAR(floor(E.cscore)),'' '') cscore,          '+#13+
                  '        nvl(TO_CHAR(floor(E.dscore)),'' '') dscore,          '+#13+
                  '        nvl(TO_CHAR(floor(E.tscore)),'' '') tscore,          '+#13+
                  '        nvl(TO_CHAR(floor(C.score)),'' '') sscore ,          '+#13+
                  '        nvl(TO_CHAR(floor(F.score)),'' '') lascore,'' '',    '+#13+
                  '        nvl(TO_CHAR(floor(B.score)),'' '') lbscore,          '+#13+
                  '        '''' OBJYN, '''' OBJSAYU, '''' OBJOPINION, ''''      '+#13+
                  '   FROM pehac A,pesdl B, '+ //pehacd  D,                           '+#13+
                  '        (SELECT itemno,  score                       '+#13+  //imageno,
                  '           FROM pesdl                                        '+#13+
                  '          WHERE rabasdate = '''+sRabasdate+'''               '+#13+
                  '            AND empno    = '''+var_empno+'''                 '+#13+
                  '            AND eempno   = '''+var_FistEmp+'''               '+#13+
                  '            AND ekind    = '''+gsEkind+''') F,               '+#13+
                  '        (SELECT itemno, score,                      '+#13+   //imageno,
                  '                OBJYN, OBJSAYU, OBJOPINION                   '+#13+
                  '           FROM pesds                                        '+#13+
                  '          WHERE rabasdate = '''+sRabasdate+'''               '+#13+
                  '            AND empno    = '''+var_empno+'''                 '+#13+
                  '            AND ekind    = '''+gsEkind+''') C,               '+#13+
                  '        (SELECT itemno,  avg(score) cscore,          '+#13+  //imageno,
                  '                avg(score) dscore, avg(score) tscore         '+#13+
                  '           FROM pesdc                                        '+#13+
                  '          WHERE rabasdate = '''+sRabasdate+'''               '+#13+
                  '            AND empno    = '''+var_empno+'''                 '+#13+
                  '            AND length(eempno)  = 16                         '+#13+
                  '            AND ekind    = '''+gsEkind+'''                   '+#13+
                  '         Group By itemno) E                          '+#13+  //,imageno
                  '  WHERE A.rabasdate = '''+sRabasdate+'''                     '+#13+
                  '    AND A.evcno     = '+var_evcno+'                          '+#13+
                  '    AND A.ekind     = '''+gsEkind+'''                        '+#13+
                  //'    AND A.itemno    = '+var_itemno+'                         '+#13+
                  '    AND A.paycl     = '''+var_paycl +'''                     '+#13+ //dsa2000 2008.09.Add
                  //'    AND A.rabasdate = D.rabasdate                            '+#13+
                  //'    AND A.evcno     = D.evcno                                '+#13+
                  //'    AND A.ekind     = D.ekind                                '+#13+
                  //'    AND A.itemno    = D.itemno                               '+#13+
                  //'    AND A.paycl     = D.paycl                                '+#13+ //dsa2000 2008.09.Add
                  '    AND B.empno(+)  = '''+var_empno+'''                      '+#13+
                  '    AND B.eempno(+) = '''+Pempno+'''                         '+#13+
                  '    AND A.rabasdate = B.rabasdate(+)                         '+#13+
                  '    AND A.ekind     = B.ekind(+)                             '+#13+
                  '    AND A.itemno    = B.itemno(+)                            '+#13+
                  //'    AND A.imageno   = B.imageno(+)                           '+#13+
                  '    AND A.itemno    = C.itemno(+)                            '+#13+
                  //'    AND A.imageno   = C.imageno(+)                           '+#13+
                  '    AND A.itemno    = E.itemno(+)                            '+#13+
                  //'    AND A.imageno   = E.imageno(+)                           '+#13+
                  '    AND A.itemno    = F.itemno(+)                            '+#13+
                  //'    AND A.imageno   = F.imageno(+)                           '+#13+
                  ' ORDER BY A.itemno asc';//, A.imageno asc                        ';

  with DataModule_Tmax.TMaxDataSet_HInsa do
  begin
    Close;
    SQL.Clear;
    ServiceName := 'PET1020A_self';   //Server : htmax_pe13
    ClearFieldInfo;
    ClearParamInfo;
    AddField('ITEMNO'     , ftString  ,    2 );
    AddField('ITEMNAME'   , ftString  ,   50 );
    AddField('IMAGENO'    , ftString  ,    2 );
    AddField('IMAGEDESC'  , ftString  ,  600 );
    AddField('TSCORE'     , ftString  ,    3 );
    AddField('DSCORE'     , ftString  ,    3 );
    AddField('CSCORE'     , ftString  ,    3 );
    AddField('SSCORE'     , ftString  ,    3 );
    AddField('LASCORE'    , ftString  ,    3 );
    AddField('LAEBRSCORE' , ftString  ,    3 );
    AddField('LBSCORE'    , ftString  ,    3 );
    AddField('OBJYN'      , ftString  ,    1 );
    AddField('OBJSAYU'    , ftString  ,  200 );
    AddField('OBJOPINION1', ftString  ,  200 );
    AddField('OBJOPINION2', ftString  ,  200 );
    SQL.Text := ParamVariant;
    Open;

    while Not Eof do
    begin
      inc(i);
      SG_HiddenData01.RowCount := i;
      SG_HiddenData01.Cells[dITEM_IDX,     i-1] := FieldByName('itemno').AsString;   //�׸��ȣ
      SG_HiddenData01.Cells[dITEMNAME_IDX, i-1] := FieldByName('itemname').AsString;   //�׸��
      SG_HiddenData01.Cells[dIMAGE_IDX,    i-1] := FieldByName('imageno').AsString;  //�̹�����ȣ
      SG_HiddenData01.Cells[dITEMDESC_IDX, i-1] := FieldByName('imagedesc').AsString;//�̹������� //IntToStr(i)+') '+

      SG_HiddenData01.Cells[dCSCORE_IDX,   i-1] := FieldByName('cscore').AsString;   //����������
      SG_HiddenData01.Cells[dSSCORE_IDX,   i-1] := FieldByName('sscore').AsString;   //�ڱ�������

      SG_HiddenData01.Cells[dLASCORE_IDX,  i-1] := FieldByName('lascore').AsString;  //���1��������
      SG_HiddenData01.Cells[dSCORE_IDX,    i-1] := FieldByName('lbscore').AsString;  //����
      SG_HiddenData01.Cells[dTMPSCORE_IDX, i-1] := FieldByName('lbscore').AsString;  //����
      SG_HiddenData01.Cells[dMODIFIED_IDX, i-1] := 'N'; //��������
      Next;
    end;
    Close;
  end;

  ShowSum01;
  with TDS1 do
  begin
    ServiceName := 'HINSA_select3';
    Close;
    Sql.Clear;

    ParamVariant := ' SELECT MERIT_JVY, MERIT_JVN, ''field3'', ''field4'',''field5''  '+
                    '  FROM PEHREMER  '+
                    ' where rabasdate  = ''' + sRabasdate +''' ' +
                    '   AND empno      = ''' + var_empno  +''' ' ;

    ClearFieldInfo;
    AddField('MERIT_JVY' ,ftString, 2000);
    AddField('MERIT_JVN' ,ftString, 2000);
    AddField('field3'    ,ftString, 2000);
    AddField('field4'    ,ftString, 2000);
    AddField('field5'    ,ftString, 2000);
    SQL.Text := ParamVariant;
    Open;

    OM_Merit_V1.Text := Fields[0].AsString;
    OM_Merit_V2.Text := Fields[1].AsString;

  End;  
  //�� �ڱ��������� �ִ´�..
  ShowSum01;
end;

procedure TFDown_Value2.ShowSum01;
var
  i   : Integer;
  j, k: Integer;
  l, m, n, Ebr : Integer;
  p, q, r   : Integer;
begin
  i := 0;
  j := 0; k := 0;
  l := 0; m := 0; n := 0; Ebr := 0;
  p := 0; q := 0; r := 0;

  for i := 0 to SG_HiddenData01.RowCount -1 do
  begin
    if (SG_HiddenData01.Cells[dTMPSCORE_IDX, i] = '0') or
       (SG_HiddenData01.Cells[dTMPSCORE_IDX, i] = '') then
      inc(k)                                                      //2�� �̽ǽ�
    else
    begin
      inc(j);                                                     //2�� ��
      l := l + StrToInt(SG_HiddenData01.Cells[dTMPSCORE_IDX, i]);   //2�� ����
    end;
    p   := P   + StrToIntdef(SG_HiddenData01.Cells[dCSCORE_IDX, i], 0 );//��������
    m   := M   + StrToIntdef(SG_HiddenData01.Cells[dSSCORE_IDX, i], 0 );//�ڱ�����
    n   := n   + StrToIntdef(SG_HiddenData01.Cells[dLASCORE_IDX, i], 0 );//1�� ����
  end;

  if (SG_HiddenData01.RowCount = 1) and (SG_HiddenData01.Cells[0,0] = '') then
  begin
    i := 0;
    j := 0; k := 0;
    l := 0; m := 0; n := 0; Ebr := 0; // 2��,
    p := 0;
  end;

  L_Total01.Caption := IntToStr(j+k);
  L_Yes01.Caption   := IntToStr(j);
end;

procedure TFDown_Value2.ShowImage01;
var
  i, j : Integer;
begin
  SG_Image01.RowCount := 1;
  for i := 0 to SG_Image01.ColCount - 1 do
    for j := 0 to SG_Image01.RowCount -1 do
      SG_Image01.Cells[i, j] := '';

  // SG_Image�� �̹��� ������ �����ְ�
  SG_HiddenData01.Tag := -1;
  if SG_HiddenData01.Cells[0,0] = '' then
  begin
    MessageBox(handle,'��ϵ� �׸��� �ϳ��� �����ϴ�','Ȯ ��', MB_OK or $0030 );
    screen.Cursor := crDefault;
    Exit;
  end;
  for i := 0 to SG_HiddenData01.RowCount -1 do
  begin
    if SG_HiddenData01.Tag = -1 then
      SG_HiddenData01.Tag := i;
    if SG_Image01.Cells[0,0] <> '' then
    begin
      SG_Image01.RowCount := SG_Image01.RowCount + 1;
    end;

    //�̹������� �ֱ�..
    SG_Image01.Cells[mITEMNAME_IDX, SG_Image01.RowCount-1] := SG_HiddenData01.Cells[dITEMDESC_IDX, i];
    SG_Image01.Cells[mITEMDESC_IDX, SG_Image01.RowCount-1] := SG_HiddenData01.Cells[dITEMNAME_IDX, i];
(*
    // ���������� �����ֱ�
      SG_Image01.Cells[2, SG_Image01.RowCount -1] := '';
      if      StrToIntDef(SG_HiddenData01.Cells[dCSCORE_IDX, i],0) >= StrToIntDef(var_ScrS,0) then  SG_Image01.Cells[2, SG_Image01.RowCount -1] := var_GrdS
      else if StrToIntDef(SG_HiddenData01.Cells[dCSCORE_IDX, i],0) >= StrToIntDef(var_ScrA,0) then  SG_Image01.Cells[2, SG_Image01.RowCount -1] := var_GrdA
      else if StrToIntDef(SG_HiddenData01.Cells[dCSCORE_IDX, i],0) >= StrToIntDef(var_ScrB,0) then  SG_Image01.Cells[2, SG_Image01.RowCount -1] := var_GrdB
      else if StrToIntDef(SG_HiddenData01.Cells[dCSCORE_IDX, i],0) >= StrToIntDef(var_ScrC,0) then  SG_Image01.Cells[2, SG_Image01.RowCount -1] := var_GrdC
      else if StrToIntDef(SG_HiddenData01.Cells[dCSCORE_IDX, i],0) >= StrToIntDef(var_ScrD,0) then  SG_Image01.Cells[2, SG_Image01.RowCount -1] := var_GrdD;
*)
    // �ڱ������� �����ֱ�
         if SG_HiddenData01.Cells[dSSCORE_IDX, i] = var_ScrS   then SG_Image01.Cells[2, SG_Image01.RowCount -1] := var_GrdS
    else if SG_HiddenData01.Cells[dSSCORE_IDX, i] = var_ScrA   then SG_Image01.Cells[2, SG_Image01.RowCount -1] := var_GrdA
    else if SG_HiddenData01.Cells[dSSCORE_IDX, i] = var_ScrB   then SG_Image01.Cells[2, SG_Image01.RowCount -1] := var_GrdB
    else if SG_HiddenData01.Cells[dSSCORE_IDX, i] = var_ScrC   then SG_Image01.Cells[2, SG_Image01.RowCount -1] := var_GrdC
    else if SG_HiddenData01.Cells[dSSCORE_IDX, i] = var_ScrD   then SG_Image01.Cells[2, SG_Image01.RowCount -1] := var_GrdD;

    // ���1��
         if SG_HiddenData01.Cells[dLASCORE_IDX, i] = var_ScrS  then SG_Image01.Cells[3, SG_Image01.RowCount -1] := var_GrdS
    else if SG_HiddenData01.Cells[dLASCORE_IDX, i] = var_ScrA  then SG_Image01.Cells[3, SG_Image01.RowCount -1] := var_GrdA
    else if SG_HiddenData01.Cells[dLASCORE_IDX, i] = var_ScrB  then SG_Image01.Cells[3, SG_Image01.RowCount -1] := var_GrdB
    else if SG_HiddenData01.Cells[dLASCORE_IDX, i] = var_ScrC  then SG_Image01.Cells[3, SG_Image01.RowCount -1] := var_GrdC
    else if SG_HiddenData01.Cells[dLASCORE_IDX, i] = var_ScrD  then SG_Image01.Cells[3, SG_Image01.RowCount -1] := var_GrdD;

  end;
  // SG_Image01�� ��ũ���� �ش�
 SG_Image01.SetFocus;
end;

function TFDown_Value2.SearchAndReplace(sSrc, sLookFor, sReplaceWith: string ): string;
var
  nPos,nLenLookFor : integer;
begin
  nPos        := Pos(sLookFor, sSrc);
  nLenLookFor := Length(sLookFor);
  while(nPos > 0)do
  begin
    Delete( sSrc, nPos, nLenLookFor );
    Insert( sReplaceWith, sSrc, nPos );
    nPos := Pos( sLookFor, sSrc );
  end;
  Result := sSrc;
end;

function TFDown_Value2.IsDataModified01: Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := 0 to SG_HiddenData01.RowCount -1 do
    if SG_HiddenData01.Cells[dMODIFIED_IDX, i] = 'Y' then // �ڷắ�� ����
    begin
      Result := True;
      Break;
    end;
//if M_Mark1.Modified then // �ǰ�
//  Result := True;
end;

procedure TFDown_Value2.OnlyVisible;
begin
  if ((gsEkind = 'Values')   and (var_Able4 = 'Y'))  then
  begin
    P_info.Visible     := False;
    BB_save.Visible    := False;
    BB_Cancel.Visible  := False;
  end else
  begin
    P_info.Visible     := True;
    BB_save.Visible    := True;
    BB_Cancel.Visible  := True;
  end;
end;

procedure TFDown_Value2.Adjust_DropDownRows(CB_name: TComboBox);
begin
  if      CB_name.Items.Count < 5 then  CB_name.DropDownCount := 5
  else if CB_name.Items.Count = 5 then  CB_name.DropDownCount := 5 + 1
  else if CB_name.Items.Count = 20 then CB_name.DropDownCount := 20 + 1
  else if CB_name.Items.Count > 20 then CB_name.DropDownCount := 20
  else                                  CB_name.DropDownCount := CB_name.Items.Count + 1;
end;

{------------------------------��ưŬ��---------------------------------}

procedure TFDown_Value2.SB_YesNo01Click(Sender: TObject);
var
  lsScore : String;
begin
  if SG_HiddenData01.Tag = -1 then Exit;

  if gsEkind = '' then
  begin
    MessageDlg('�򰡸� ������ �ֽʽÿ�!', mtError, [mbOK], 0);
    Exit;
  end;

  if ((gsEkind = 'Values')   and (var_Able4 = 'Y'))  then //���� �ɷ����̸鼭 �򰡿Ϸᰡ �Ǿ�����..
  begin
    MessageBox(handle,'�̹� �򰡰� �Ϸ�� �ڷ�� '+
                       '������ �� �����ϴ�.','�۾���������',MB_ICONWARNING);
    Exit;
  end;

  //������ ���

       if trim(TSpeedButton(Sender).Caption) = var_GrdS  then  lsScore :=  var_ScrS
  else if trim(TSpeedButton(Sender).Caption) = var_GrdA  then  lsScore :=  var_ScrA
  else if trim(TSpeedButton(Sender).Caption) = var_GrdB  then  lsScore :=  var_ScrB
  else if trim(TSpeedButton(Sender).Caption) = var_GrdC  then  lsScore :=  var_ScrC
  else if trim(TSpeedButton(Sender).Caption) = var_GrdD  then  lsScore :=  var_ScrD  else lsScore := '0';

  // ��ư�� �������� SG_HiddenData�� ����� ���� ���濩�θ� 'Y'�� ��ģ��.
  if TSpeedButton(Sender).Down = True then
  begin
    SG_HiddenData01.Cells[dTMPSCORE_IDX, SG_HiddenData01.Tag+SG_Image01.Row] := lsScore;
    SG_HiddenData01.Cells[dMODIFIED_IDX, SG_HiddenData01.Tag+SG_Image01.Row] := 'Y';
  end else
  begin
    SG_HiddenData01.Cells[dTMPSCORE_IDX, SG_HiddenData01.Tag+SG_Image01.Row] := '';
    SG_HiddenData01.Cells[dMODIFIED_IDX, SG_HiddenData01.Tag+SG_Image01.Row] := 'Y';
  end;

  ShowSum01;
end;

procedure TFDown_Value2.BB_CancelClick(Sender: TObject);
begin
  if PageControl1.ActivePage = TabSheet1 then
  begin
      Retrieve_Data01;
      ShowImage01;
  end;
  OnlyVisible;
end;

{------------------------------���� �� ��---------------------------------}
procedure TFDown_Value2.SG_ItemImage01DrawCell(Sender: TObject; Col, Row: Integer;
  Rect: TRect; State: TGridDrawState);
var
  lsBuffer : String;
  i        : Integer;
begin
  if (gdSelected in State) then
  begin
    SG_ItemImage01.Canvas.Brush.Color := clWhite;//$00CFFBFC;//$00FFE8D0;//$00FEEDED;
    SG_ItemImage01.Canvas.Font.Color  := clBlack;
  end;
  lsBuffer := SG_ItemImage01.Cells[Col, Row];
  SG_ItemImage01.Canvas.FillRect(Rect);
  if SG_ItemImage01.VisibleRowCount < SG_ItemImage01.RowCount then
    SG_ItemImage01.ColWidths[1] := SG_ItemImage01.Width -  SG_ItemImage01.ColWidths[0] - 16
  else
    SG_ItemImage01.ColWidths[1] := SG_ItemImage01.Width -  SG_ItemImage01.ColWidths[0];
(*
  Rect.Top   := Rect.Top   + 20; // ���� Text�� �׷����� ������ ũ�⸦ �ణ ���δ�
  Rect.Left  := Rect.Left  +  2;
  Rect.Right := Rect.Right -  2;
*)
  Rect.Top   := Rect.Top   + 2; // ���� Text�� �׷����� ������ ũ�⸦ �ణ ���δ�
  Rect.Left  := Rect.Left  + 2;
  Rect.Right := Rect.Right - 10;
  DrawText(SG_ItemImage01.Canvas.Handle, PChar(lsBuffer), StrLen(PChar(lsBuffer)), Rect, DT_LEFT or DT_WORDBREAK);
end;

procedure TFDown_Value2.SG_Image01DrawCell(Sender: TObject; Col, Row: Integer;
  Rect: TRect; State: TGridDrawState);
var
  Loc : Cardinal;
  lsBuffer : String;
  liLeft, liTop : Integer;
begin
  if gdSelected in State then
  begin
    SG_Image01.Canvas.Brush.Color := $00CFFBFC;//$00FFE8D0;//$00FFF9EC;//$00CFFBFC;
    SG_Image01.Canvas.Font.Color  := clBlack;
    SG_Image01.Canvas.Font.Size  := 9;
  end;
  SG_Image01.Canvas.FillRect(Rect);

  if ((Col = 3) and (gsSelfYn  <> 'Y')) or
     ((Col = 4) and (gsFirstYn <> 'Y')) or
     ((Col = 5) and (gsFirstEbrYn <> 'Y')) then
    lsBuffer := ''
  else
    lsBuffer := SG_Image01.Cells[Col, Row];

  if Col = mITEMNAME_IDX then
  begin
    Loc := DT_CENTER or DT_WORDBREAK;
    Rect.Top := (((Rect.Bottom - Rect.Top) - SG_Image01.Canvas.TextHeight(lsBuffer)) div 2) + Rect.Top;
  end
  else if (Col in [mITEMCOL_IDX, mITEMSELF_IDX, mITEME1_IDX, mITEMEBR_IDX]) then
  begin
    Loc := DT_CENTER or DT_WORDBREAK;
    Rect.Top := (((Rect.Bottom - Rect.Top) - SG_Image01.Canvas.TextHeight(lsBuffer)) div 2) + Rect.Top;
    SG_Image01.Canvas.Font.Style := [fsBold];
//    SG_Image01.Canvas.Font.Color := $008D8022;
    SG_Image01.Canvas.Font.Size  := 9;
  end
  else
  begin
    Loc := DT_LEFT or DT_WORDBREAK;
    Rect.Left := Rect.Left + 4;
    Rect.Top := Rect.Top + 4;
  end;
  DrawText(SG_Image01.Canvas.Handle, PChar(lsBuffer), StrLen(PChar(lsBuffer)), Rect, Loc);

  // SG_HiddenData01.Tag �� ���� �򰡿���� ���� index�� ����Ǿ� ����
  if SG_HiddenData01.Tag = -1 then System.Exit;
  // ��Ŀ���� ������ ��ư�� �������� �ʴ´�
  if not SG_Image01.Focused then  System.Exit;

  // ���õ� row�� ȭ�鿡 ���̰� ��ġ�� �ٲ۴�
  if SG_Image01.Row < SG_Image01.TopRow then // ���� row �� ȭ������ �ִ�
    SG_Image01.Row := SG_Image01.TopRow
  else if SG_Image01.Row > (SG_Image01.TopRow + SG_Image01.VisibleRowCount-1) then // ���� row �� ȭ��ؿ� �ִ�
    SG_Image01.Row := SG_Image01.TopRow + SG_Image01.VisibleRowCount-1;
end;

procedure TFDown_Value2.SG_Score01Enter(Sender: TObject);
begin
  SG_Image01.SetFocus;
end;

procedure TFDown_Value2.SG_Image01KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_UP) and (SG_Image01.Row = 0) then
  begin
    // ���� �׸񿡼� ���� ȭ��ǥ Ű�̸� ���� ����� ������ �׸���ȣ �̵�
    ShowImage01;
    SG_Image01.Row := SG_Image01.RowCount-1;
    Key := VK_ESCAPE;
  end
  else if (Key = VK_DOWN) and (SG_Image01.Row = SG_Image01.RowCount-1) then
  begin
    // �ǾƷ� �׸񿡼� �Ʒ��� ȭ��ǥ Ű�̸� ���� ����� ù��° �׸���ȣ �̵�
    ShowImage01;
    SG_Image01.Row := 0;
    Key := VK_ESCAPE;
  end;
end;

procedure TFDown_Value2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if (BB_Save.Visible) and (IsDataModified01) then
  begin
       MessageBox(handle,'������ �ڷᰡ �����Ƿ� ���� ������ �۾��� �����Ͻñ� �ٶ��ϴ�.','�۾���������',MB_ICONWARNING);
       CanClose := False;
       System.Exit;
  end;
  CanClose := True;
end;

procedure TFDown_Value2.CB_empnoChange(Sender: TObject);
var
  ParamVariant : String;
  i            : Integer;
  sList_Eempno: String;
begin
  if IsDataModified01 then
  begin
    MessageBox(handle,'������ �ڷᰡ �����Ƿ� ���� ������ �۾��� �����Ͻñ� �ٶ��ϴ�.','�۾���������',MB_ICONWARNING);
    Exit;
  end;
 //1������ ���ϱ�..

  ParamVariant := 'SELECT nvl(la.eempno,'' '') eempno, nvl(la.korname, '' '') korname,  ' +                                      #13+
                  '       '' 1��''||nvl(RPAD(la.korname,6,'' '')||''(''||la.eempno||'')'', '' '') cbkorname  ' +                 #13+
                  '  FROM pesmla la, pehremas a ' +                                                                              #13+
                  ' WHERE la.rabasdate = '''+sRabasdate+''' ' +                                                             #13+
                  '   AND la.empno     = '''+var_empno+''' ' +                                                                   #13+
//                  '   AND la.specialyn = ''N'' '+                                                                                #13+
                  '   AND la.rabasdate = a.rabasdate (+) and la.empno = a.empno (+) '+                                           #13+
//                  '   AND la.eempno  not in (select nvl(ebrempno,'' '') from pehremas '+                                                    #13+
                  '   AND la.eempno      in (select nvl(e1empno,'' '') from pehremas '+                                                    #13+
                  '       where rabasdate = '''+sRabasdate+''' AND empno = '''+var_empno+''' ) '+                           #13+
                  'UNION '+                                                                                                      #13+
                  'SELECT nvl(la.eempno,'' '') eempno, nvl(la.korname, '' '') korname,  ' +                                      #13+
                  '       ''����''||nvl(RPAD(la.korname,6,'' '')||''(''||la.eempno||'')'', '' '') cbkorname  ' +                 #13+
                  '  FROM pesmla la, pehremas a ' +                                                                              #13+
                  ' WHERE la.rabasdate = '''+sRabasdate+''' ' +                                                             #13+
                  '   AND la.empno     = '''+var_empno+''' ' +                                                                   #13+
//                  '   AND la.specialyn = ''N'' '+                                                                                #13+
                  '   AND la.rabasdate = a.rabasdate (+) and la.empno = a.empno (+) '+                                           #13+
                  '   AND la.eempno      in (select nvl(ebrempno,'' '') from pehremas '+                                                    #13+
                  '       where rabasdate = '''+sRabasdate+''' AND empno = '''+var_empno+''' ) '+
                  'ORDER BY cbkorname, eempno';

  with DataModule_Tmax.TMaxDataSet_HInsa do
  begin
    Close;
    ServiceName := 'PET1020A_selg';
    ClearFieldInfo;
    ClearParamInfo;
    AddField('EEMPNO'    , ftString  ,  4   );
    AddField('KORNAME'   , ftString  ,  12  );
    AddField('CBKORNAME' , ftString  ,  19  );
    SQL.Text := ParamVariant;
    Open;

    var_FistEmp    := '';
    var_FistEbrEmp := '';
    sList_Eempno   := '';
    while Not Eof do
    begin
      // ���� 1�����ڰ� 2��(1��,����)�ʰ��� ��������
      if copy(FieldByName('cbkorname').asString,1,4) = '����' then
        var_FistEbrEmp := copy(FieldByName('cbkorname').asString,(Length(FieldByName('cbkorname').asString)-4),4)
      else
        var_FistEmp :=    copy(FieldByName('cbkorname').asString,(Length(FieldByName('cbkorname').asString)-4),4);

      sList_Eempno := sList_Eempno +
                      copy(FieldByName('cbkorname').asString,5,(Length(FieldByName('cbkorname').asString)+9))+', ';
      Next;
    end;

    if RecordCount < 1 then
      sList_Eempno := ' �����ϴ�.!'
    else
    begin
      sList_Eempno := copy(sList_Eempno,1,Length(sList_Eempno)-2);
    end;

    Close;
  end;

  Retrieve_Head(Sender);
end;

procedure TFDown_Value2.Retrieve_Head(Sender: TObject);
var
  i : Integer;
  ParamVariant : String;
begin
  gsSelfYn    := 'Y';
  gsFirstYn   := 'Y';
  gsFirstEbrYn:= 'Y';

  screen.Cursor := crHourGlass;
  BB_CancelClick(Sender);
  screen.Cursor := crDefault;
end;

procedure TFDown_Value2.SB_ScoreClick(Sender: TObject);
begin
  FM_Marks := TFM_Marks.Create(Self);
  try
    FM_Marks.Tag := 2;
    FM_Marks.ShowModal;
  finally
    FM_Marks.Free;
  end;
end;

procedure TFDown_Value2.PageControl1Change(Sender: TObject);
begin
  if gsEkind <> '' then
  begin
       if (BB_Save.Visible) and (IsDataModified01) then
       begin
         MessageBox(handle,'������ �ڷᰡ �����Ƿ� ���� ������ �۾��� �����Ͻñ� �ٶ��ϴ�.','�۾���������',MB_ICONWARNING);
         System.Exit;
       end;
  end;

  if PageControl1.ActivePage = TabSheet1 then
  begin
       var_itemno        := '1';
       L_Total01.Caption := '0';
       L_Yes01.Caption   := '0';
  end;;

  gsEkind := 'Values';
  CB_empnoChange(Sender);
end;

end.
