unit UDown_Sub2;  //2차 상사평가

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, Buttons, ExtCtrls, Pass, DBGrids, Db, DBClient,
  peoutlookbtn, PeJeonVertLabel, PeJeonLabel, pegradpanl, OnEditBaseCtrl,
  OnEditStdCtrl, OnEditMemo, Tmax_DataSetText;

type
  TFDown_Sub2 = class(TForm)
    SG_HiddenData: TStringGrid;
    SG_Item: TStringGrid;
    CB_ShowClass: TCheckBox;
    SG_Image: TStringGrid;
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
    Label13: TLabel;
    Label5: TLabel;
    LT_Count: TPanel;
    Label16: TLabel;
    L_Total: TLabel;
    L_Yes: TLabel;
    Bt_Sub1: TPeJeonOutLookBtn;
    Bt_Sub2: TPeJeonOutLookBtn;
    Bt_Sub3: TPeJeonOutLookBtn;
    Panel1: TPanel;
    L_duname: TLabel;
    Label1: TLabel;
    Panel3: TPanel;
    OnMemo8: TOnMemo;
    OnMemo9: TOnMemo;
    OM_Merit_C1: TOnMemo;
    OM_Merit_C2: TOnMemo;
    LT_First: TPanel;
    TDS1: TTMaxDataSet;
    Lb1: TLabel;
    Panel2: TPanel;
    Label15: TLabel;
    Label17: TLabel;
    Edit1: TEdit;
    TDml: TTMaxDataSet;
    procedure FormCreate(Sender: TObject);
    procedure SubButtonClick(Sender: TObject);
    procedure SG_ItemClick(Sender: TObject);
    procedure SG_ItemDrawCell(Sender: TObject; Col, Row: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SG_ImageDrawCell(Sender: TObject; Col, Row: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SG_ScoreEnter(Sender: TObject);
    procedure SB_YesNoClick(Sender: TObject);
    procedure SG_ImageKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure CB_empnoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BB_CancelClick(Sender: TObject);
    procedure SB_ScoreClick(Sender: TObject);
    procedure SG_ImageSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
  private
    procedure OnlyVisible;
    procedure Retrieve_Data;
    procedure ShowImage(asItemNum: String);
    function SearchAndReplace(sSrc, sLookFor, sReplaceWith: string ): string;
    procedure ShowSum;
    procedure Adjust_DropDownRows(CB_name: TComboBox);

    procedure Retrieve_Head(Sender: TObject);
    { Private declarations }
  public
    { Public declarations }
    Pempno, Pkorname, Password, Ppermission: string;
    var_Able1, var_Able2, var_Able3 : String; //능력, 태도 평가확인 여부
    var_paycl   : String; //직급별 평가표번호를 불어오기위해 추가.  dsa2000 2008.09.
    gsItemIdx   : Integer;  //CB_empno의 itemindex..
    gsEkind     : String; //평가분류(공통,리더십,역량)
    var_evcno   : String; //평가표번호
    var_empno   : String; //피평가자 사번
    var_korname : String; //피평가자 성명
    var_jobkind : String; //피평가자 직종
    var_FistEmp : String; //1차평가자 사번
    var_FistEbrEmp : String; //1차(지점)평가자 사번

    gsColYn     : String; //동료평가마감여부
    gsSelfYn    : String; //자기평가마감여부
    gsFirstYn   : String; //상사1차평가마감여부
    gsFirstEbrYn: String; //상사1차(지점)평가마감여부
    GsDeptcode  : String;

    Running: Boolean;

    vImageno     : String;
    vItemno      : String;
    vItemname    : String;
    vOBJYN       : String;
    vOBJSAYU     : String;
    vOBJOpinion1 : String;
    vOBJOpinion2 : String;
    vSelectdRow : Integer;

    iWidth_ItemName :Integer;
    iWidth_ItemDesc :Integer;
    iWidth_EbrScore :Integer;
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
    OpenForm         :Integer;

    function IsDataModified: Boolean;
  end;
const
  // SG_HiddenData 의 index
  dITEM_IDX        =  0; // 평가항목번호
  dITEMNAME_IDX    =  1; // 평가항목명
  dIMAGE_IDX       =  2; // 평가이미지번호
  dITEMDESC_IDX    =  3; // 평가이미지내용
  dCSCORE_IDX      =  4; //동료평가점수
  dSSCORE_IDX      =  5; //자기평가점수
  dLASCORE_IDX     =  6; //상사1차평가점수
  dSCORE_IDX       =  7; // 평가점수(처음)
  dTMPSCORE_IDX    =  8; // 변동될 평가점수
  dMODIFIED_IDX    =  9; // 자료변동여부
  dOBJYN_IDX       = 10; // 이의신청여부
  dOBJSAYU_IDX     = 11; // 피평가자이의신청내용
  dOBJOPINION1_IDX = 12; // 1차 평가자평가소견
  dOBJOPINION2_IDX = 13; // 2차 평가자평가소견

  // SG_Image 의 index
  mITEMNAME_IDX = 0;
  mITEMDESC_IDX = 1;
  mITEMCOL_IDX  = 2;
  mITEMSELF_IDX = 3;
  mITEME1_IDX   = 4;
  mITEMEBR_IDX  = 5;

 // SG_Score의 index
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
  FDown_Sub2: TFDown_Sub2;

implementation

{$R *.DFM}

uses
  Hinsa_TmaxDM, UFm_Marks, kpaylib, HSubForm, HMainForm2, HMainForm;

{----------------------------------Form Open-----------------------------------}

procedure TFDown_Sub2.FormCreate(Sender: TObject);
begin
  Running := False;
  iWidth_ItemName := SG_Image.ColWidths[mITEMNAME_IDX];
  iWidth_ItemDesc := SG_Image.ColWidths[mITEMDESC_IDX];
  iWidth_EbrScore := SG_Image.ColWidths[mITEMEBR_IDX];
end;

procedure TFDown_Sub2.FormShow(Sender: TObject);
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
  L_eempno.Caption := Pkorname+' 님이 평가하실 구성원은';
  CB_empno.Caption := var_korname;

  ParamVariant := 'SELECT empno || '';'' || evcno || '';'' || jobkind || '';'' || paycl|| '';'' || deptcode '+
                  '  FROM pehamas ' +
                  ' WHERE rabasdate = '''+sRabasdate+''' ' +
                  '   AND empno     = '''+var_empno+''' ';

  DataModule_Tmax.Csel_SQL := ParamVariant;
  DataModule_Tmax.Csel_Open;
  var_evcno   := DataModule_Tmax.Csel_gfd(2);
  var_jobkind := DataModule_Tmax.Csel_gfd(3);
  var_paycl   := DataModule_Tmax.Csel_gfd(4);
  GsDeptcode  := DataModule_Tmax.Csel_gfd(5);

  if var_evcno = '1' then
  begin
    Bt_Sub1.Visible := True;
    Bt_Sub1.Left := 15;
    Bt_Sub2.Visible := True;
    Bt_Sub2.Left := 124;
    Bt_Sub3.Visible := True;
    Bt_Sub3.Left := 233;
  end
  else if var_evcno ='2' then
  begin
    Bt_Sub1.Visible := True;
    Bt_Sub1.Left := 15;
    Bt_Sub2.Visible := False;
    Bt_Sub3.Visible := True;
    Bt_Sub3.Left := 124;
  end;
    SubButtonClick(Bt_Sub1);
end;

{------------------------------사용자정의 함수---------------------------------}

procedure TFDown_Sub2.Retrieve_Data;
var
  ParamVariant: String;
  i, j        : Integer;
  TempStr    : String;
begin
  //피평가자
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
    AddField('VALCONYN'  , ftString  ,  1   );      //dsa2000  2008.09. ValConyn Add Value 평가완료여부.
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
      MessageDlg('상사평가 피평가자가 아닙니다.', mtError, [mbOK], 0);
      screen.Cursor := crDefault;
      Close;
      Exit;
    end;

    CB_empno.Hint := '소속: '+ FieldByName('deptname').AsString+'   '+
                     '직급: '+ FieldByName('codename').AsString;

    if FieldByName('abconyn').AsString <> 'Y' then
    Begin
      var_Able1 := 'N'; //리더십평가확인여부
      OM_Merit_C1.ReadOnly := False;
      OM_Merit_C2.ReadOnly := False;
    End
    else
    Begin
      var_Able1 := 'Y';
      OM_Merit_C1.ReadOnly := True;
      OM_Merit_C2.ReadOnly := True;
    End;

    if FieldByName('beconyn').AsString <> 'Y' then
    Begin
      var_Able2 := 'N'; //리더십평가확인여부
      OM_Merit_C1.ReadOnly := False;
      OM_Merit_C2.ReadOnly := False;
    End
    else
    Begin
      var_Able2 := 'Y';
      OM_Merit_C1.ReadOnly := True;
      OM_Merit_C2.ReadOnly := True;
    End;
    if FieldByName('duconyn').AsString <> 'Y' then
    Begin
      var_Able3 := 'N'; //직무평가확인여부
      OM_Merit_C1.ReadOnly := False;
      OM_Merit_C2.ReadOnly := False;
    End
    else
    Begin
      var_Able3 := 'Y';
      OM_Merit_C1.ReadOnly := True;
      OM_Merit_C2.ReadOnly := True;
    End;

  end;

  //SG_Item의 값을 지운다..

  SG_Item.RowCount := 1;
  for i := 0 to SG_Item.ColCount - 1 do
    for j := 0 to SG_Item.RowCount -1 do
      SG_Item.Cells[i, j] := '';

  i := 0; j := 0;

  if (gsEkind = '공통역량')  or (gsEkind = '리더십역량') then
    begin
      ParamVariant := 'SELECT  nvl(TO_CHAR(itemno),'' '') , '+
                    '        nvl(itemname,'' '') itemname , '+
                    '        nvl(itemdesc,'' '') itemdesc   '+
                    '  FROM pehac                           '+
                    ' WHERE rabasdate = '''+sRabasdate+'''  '+
                    '   AND evcno     = '+var_evcno+'       '+
                    '   AND ekind     = '''+gsEkind+'''     '+
                    '   AND paycl     = '''+var_paycl +'''  '+ //dsa2000 2008.09.Add
                    ' ORDER BY itemno asc                   ';
    end
  else if (gsEkind = '직무역량') then
    begin
      ParamVariant := '  SELECT nvl(to_char(ITEMNO  ),''0'') ITEMNO, '+
                      '         ITEMNAME, nvl(ITEMDESC ,'' '') ITEMDESC from (   ' +
                      '  SELECT nvl(to_char(A.ITEMNO),''0'') ITEMNO,' +
                      '        CASE  WHEN A.ITEMNO = ''99'' THEN ' +
                      '             (SELECT ITEMNAME5 FROM PEDUCDEPT WHERE RABASDATE = A.RABASDATE AND DEPTCODE = A.DEPTCODE AND ITEMNO = A.ITEMNO) ' +
                      '        ELSE ' +
                      '             (SELECT ITEMNAME FROM PEDUC WHERE RABASDATE = A.RABASDATE AND ITEMNO = A.ITEMNO) ' +
                      '        END ITEMNAME, ' +
                      '        A.SNUM, ' +
                      '        CASE WHEN A.ITEMNO = ''99'' THEN ' +
                      '             (SELECT ITEMDESC5 FROM PEDUCDEPT WHERE RABASDATE = A.RABASDATE AND DEPTCODE = A.DEPTCODE AND ITEMNO = A.ITEMNO) ' +
                      '        ELSE ' +
                      '             (SELECT ITEMDESC FROM PEDUC WHERE RABASDATE = A.RABASDATE AND ITEMNO = A.ITEMNO) ' +
                      '        END ITEMDESC ' +
                      ' FROM PEDUCEMP A ' +
                      ' WHERE A.RABASDATE = '''+sRabasdate+''' ' +
                      '   AND A.DEPTCODE  = '''+GsDeptcode+''' ' +
                      '   AND A.EMPNO     = '''+var_empno +''' ' +
                      ' ORDER BY SNUM) ' ;
    end;

  //항목을 가져와서 SG_Item.에 넣고..
  with DataModule_Tmax.TMaxDataSet_HInsa do
  begin
    Close;
    ServiceName := 'PET1020A_selc';
    ClearFieldInfo;
    ClearParamInfo;
    AddField('ITEMNO'     , ftString  ,  2   );
    AddField('ITEMNAME'   , ftString  ,  50  );
    AddField('ITEMDESC'   , ftString  ,  300 );
    SQL.Text := ParamVariant;
    Open;

    while not Eof do
    begin
      inc(i);
      SG_Item.RowCount   := i;
      SG_Item.Cells[0, i-1] := FieldByName('itemname').AsString;
      SG_Item.Cells[1, i-1] := FieldByName('itemdesc').AsString;
      SG_Item.Cells[2, i-1] := FieldByName('itemno').AsString;
      Next;
    end;
  end;

  //SG_HiddenDate에 항목번호, 이미지번호, 이미지내용, 평가점수, 변경여부를 넣고
  SG_HiddenData.RowCount := 1;
  for i := 0 to SG_HiddenData.ColCount - 1 do
    for j := 0 to SG_HiddenData.RowCount -1 do
      SG_HiddenData.Cells[i, j] := '';
  i := 0; j := 0;

  //항목번호, 이미지번호,이미지내용, 자기평가점수, 상사1차평가점수,
  if var_evcno ='1' then
  begin
    if (gsEkind = '공통역량')  then
    begin
      ParamVariant := 'SELECT  nvl(TO_CHAR(A.itemno),'' ''), nvl(D.itemname,'' ''), '+
                      '        nvl(TO_CHAR(A.imageno),'' ''),                       '+
                      '        nvl(A.imagedesc,'' '') Imagedesc ,                   '+
                      '        nvl(TO_CHAR(floor(E.cscore)),'' '') cscore,          '+
                      '        nvl(TO_CHAR(floor(E.dscore)),'' '') dscore,          '+
                      '        nvl(TO_CHAR(floor(E.tscore)),'' '') tscore,          '+
                      '        nvl(TO_CHAR(floor(C.score)),'' '') sscore ,          '+
                      '        nvl(TO_CHAR(floor(F.score)),'' '') lascore,'' '',    '+
                      '        nvl(TO_CHAR(floor(B.score)),'' '') lbscore,          '+
                      '        NVL(C.OBJYN,''N''), C.OBJSAYU,                       '+
                      '        C.OBJOPINION, C.OBJOPINION2                          '+
                      '   FROM pehacd A,pesdl B,pehac  D,                           '+
                      '         ( SELECT itemno, imageno, score                     '+
                      '             FROM pesdl                                      '+
                      '            WHERE rabasdate = '''+sRabasdate+'''             '+
                      '              AND empno    = '''+var_empno+'''               '+
                      '              AND eempno   = '''+var_FistEmp+'''             '+
                      '              AND ekind    = '''+gsEkind+''') F,             '+
                      '        (SELECT itemno, imageno, score,                      '+
                      '                OBJYN, OBJSAYU, OBJOPINION, OBJOPINION2      '+
                      '           FROM pesds                                        '+
                      '          WHERE rabasdate = '''+sRabasdate+'''               '+
                      '            AND empno    = '''+var_empno+'''                 '+
                      '            AND ekind    = '''+gsEkind+''') C,               '+
                      '        (SELECT itemno, imageno, avg(score) cscore,          '+
                      '                avg(score) dscore, avg(score) tscore         '+
                      '           FROM pesdc                                        '+
                      '          WHERE rabasdate = '''+sRabasdate+'''               '+
                      '            AND empno    = '''+var_empno+'''                 '+
                      '            AND length(eempno)  = 16                         '+
                      '            AND ekind    = '''+gsEkind+'''                   '+
                      '         Group By itemno,imageno) E                          '+
                      '  WHERE A.rabasdate = '''+sRabasdate+'''                     '+
                      '    AND A.evcno     = '+var_evcno+'                          '+
                      '    AND A.ekind     = '''+gsEkind+'''                        '+
                      '    AND A.paycl     = '''+var_paycl +'''                     '+ //dsa2000 2008.09.Add
                      '    AND A.rabasdate = D.rabasdate                            '+
                      '    AND A.evcno     = D.evcno                                '+
                      '    AND A.ekind     = D.ekind                                '+
                      '    AND A.itemno    = D.itemno                               '+
                      '    AND A.paycl     = D.paycl                                '+ //dsa2000 2008.09.Add
                      '    AND B.empno(+)  = '''+var_empno+'''                      '+
                      '    AND B.eempno(+) = '''+Pempno+'''                         '+
                      '    AND A.rabasdate = B.rabasdate(+)                         '+
                      '    AND A.ekind     = B.ekind(+)                             '+
                      '    AND A.itemno    = B.itemno(+)                            '+
                      '    AND A.imageno   = B.imageno(+)                           '+
                      '    AND A.itemno    = C.itemno(+)                            '+
                      '    AND A.imageno   = C.imageno(+)                           '+
                      '    AND A.itemno    = E.itemno(+)                            '+
                      '    AND A.imageno   = E.imageno(+)                           '+
                      '    AND A.itemno    = F.itemno(+)                            '+
                      '    AND A.imageno   = F.imageno(+)                          '+
                      ' ORDER BY A.itemno asc, A.imageno asc                        ';
    end
    else if (gsEkind = '리더십역량') then
    begin
      ParamVariant := 'SELECT  nvl(TO_CHAR(A.itemno),'' ''), nvl(D.itemname,'' ''), '+
                      '        nvl(TO_CHAR(A.imageno),'' ''),                       '+
                      '        nvl(A.imagedesc,'' '') Imagedesc ,                   '+
                      '        nvl(TO_CHAR(floor(E.cscore)),'' '') cscore,          '+
                      '        nvl(TO_CHAR(floor(E.cscore)),'' '') dscore,          '+
                      '        nvl(TO_CHAR(floor(E.cscore)),'' '') tscore,          '+
                      '        nvl(TO_CHAR(floor(C.score)),'' '') sscore ,          '+
                      '        nvl(TO_CHAR(floor(F.score)),'' '') lascore,'' '',    '+
                      '        nvl(TO_CHAR(floor(B.score)),'' '') lbscore,          '+
                      '        NVL(C.OBJYN,''N''), C.OBJSAYU,                       '+
                      '        C.OBJOPINION, C.OBJOPINION2                          '+
                      '   FROM pehacd A,pesdl  B,pehac  D,                          '+
                      '         ( SELECT itemno, imageno, score                     '+
                      '             FROM pesdl                                      '+
                      '            WHERE rabasdate = '''+sRabasdate+'''             '+
                      '              AND empno    = '''+var_empno+'''               '+
                      '              AND eempno   = '''+var_FistEmp+'''             '+
                      '              AND ekind    = '''+gsEkind+''') F,             '+
                      '        (SELECT itemno, imageno, score,                      '+
                      '                OBJYN, OBJSAYU, OBJOPINION, OBJOPINION2      '+
                      '           FROM pesds                                        '+
                      '          WHERE rabasdate = '''+sRabasdate+'''               '+
                      '            AND empno    = '''+var_empno+'''                 '+
                      '            AND ekind    = '''+gsEkind+''') C,               '+
                      '        (SELECT itemno, imageno, avg(score) cscore           '+
                      '           FROM pesdc                                        '+  //하은영
                      '          WHERE rabasdate = '''+sRabasdate+'''               '+
                      '            AND empno    = '''+var_empno+'''                 '+
                      '            AND length(eempno)  = 16                         '+
                      '            AND ekind    = '''+gsEkind+''' group by itemno,imageno) E  '+
                      '  WHERE A.rabasdate = '''+sRabasdate+'''                     '+
                      '    AND A.evcno     = '+var_evcno+'                          '+
                      '    AND A.ekind     = '''+gsEkind+'''                        '+
                      '    AND A.paycl     = '''+var_paycl +'''                     '+ //dsa2000 2008.09.Add
                      '    AND A.rabasdate = D.rabasdate                            '+
                      '    AND A.evcno     = D.evcno                                '+
                      '    AND A.ekind     = D.ekind                                '+
                      '    AND A.itemno    = D.itemno                               '+
                      '    AND A.paycl     = D.paycl                                '+ //dsa2000 2008.09.Add
                      '    AND B.empno(+)  = '''+var_empno+'''                      '+
                      '    AND B.eempno(+) = '''+Pempno+'''                         '+
                      '    AND A.rabasdate = B.rabasdate(+)                         '+
                      '    AND A.ekind     = B.ekind(+)                             '+
                      '    AND A.itemno    = B.itemno(+)                            '+
                      '    AND A.imageno   = B.imageno(+)                           '+
                      '    AND A.itemno    = C.itemno(+)                            '+
                      '    AND A.imageno   = C.imageno(+)                           '+
                      '    AND A.itemno    = E.itemno(+)                            '+
                      '    AND A.imageno   = E.imageno(+)                           '+
                      '    AND A.itemno    = F.itemno(+)                            '+
                      '    AND A.imageno   = F.imageno(+)                          '+
                      ' ORDER BY A.itemno asc, A.imageno asc                        ';
    end
    else if (gsEkind = '직무역량') then
    begin
      ParamVariant := '  SELECT nvl(to_char(ITEMNO  ),''0'') ITEMNO, '+
                      '         NVL(SUBSTR(itemname,1, DECODE(ITEMNO, ''99'', 12, INSTR(itemname,''('')-3)) ,'' '') itemname, '+
                      '         SNUM, nvl(ITEMDESC ,'' '') ITEMDESC,         '+
                      '         ''''                                cscore,  '+
                      '         ''''                                dscore,  '+
                      '         ''''                                tscore,  '+
                      '         NVL(TO_CHAR(FLOOR(sscore)),'' '')   sscore , '+
                      '         NVL(TO_CHAR(FLOOR(lascore)) ,'' '') lascore, '+
                      '         '''' LAEBRSCORE, '''' LBSCORE,               '+
                      '         NVL(OBJYN,''N''), OBJSAYU, OBJOPINION, OBJOPINION2 from ( '+
                      '  SELECT nvl(to_char(A.ITEMNO),''0'') ITEMNO,' +
                      '        CASE  WHEN A.ITEMNO = ''99'' THEN ' +
                      '             (SELECT ITEMNAME5 FROM PEDUCDEPT WHERE RABASDATE = A.RABASDATE AND DEPTCODE = A.DEPTCODE AND ITEMNO = A.ITEMNO) ' +
                      '        ELSE ' +
                      '             (SELECT ITEMNAME FROM PEDUC WHERE RABASDATE = A.RABASDATE AND ITEMNO = A.ITEMNO) ' +
                      '        END ITEMNAME, ' +
                      '        A.SNUM, ' +
                      '        CASE WHEN A.ITEMNO = ''99'' THEN ' +
                      '             (SELECT ITEMDESC5 FROM PEDUCDEPT WHERE RABASDATE = A.RABASDATE AND DEPTCODE = A.DEPTCODE AND ITEMNO = A.ITEMNO) ' +
                      '        ELSE ' +
                      '             (SELECT ITEMDESC FROM PEDUC WHERE RABASDATE = A.RABASDATE AND ITEMNO = A.ITEMNO) ' +
                      '        END ITEMDESC, ' +
                      '        (SELECT score       FROM pesds WHERE rabasdate = A.RABASDATE AND empno = A.EMPNO AND ITEMNO = A.ITEMNO  AND ekind = '''+gsEkind+''') sscore,  ' + //자기평가
                      '        (SELECT score       FROM pesdl WHERE rabasdate = A.RABASDATE AND empno = A.EMPNO AND ITEMNO = A.ITEMNO  AND ekind = '''+gsEkind+''') lascore, ' + //하향평가
                      '        (SELECT OBJYN       FROM pesds WHERE rabasdate = A.RABASDATE AND empno = A.EMPNO AND ITEMNO = A.ITEMNO  AND ekind = '''+gsEkind+''') OBJYN,   ' +
                      '        (SELECT OBJSAYU     FROM pesds WHERE rabasdate = A.RABASDATE AND empno = A.EMPNO AND ITEMNO = A.ITEMNO  AND ekind = '''+gsEkind+''') OBJSAYU, ' +
                      '        (SELECT OBJOPINION  FROM pesds WHERE rabasdate = A.RABASDATE AND empno = A.EMPNO AND ITEMNO = A.ITEMNO  AND ekind = '''+gsEkind+''') OBJOPINION,  ' +
                      '        (SELECT OBJOPINION2 FROM pesds WHERE rabasdate = A.RABASDATE AND empno = A.EMPNO AND ITEMNO = A.ITEMNO  AND ekind = '''+gsEkind+''') OBJOPINION2  ' +
                      ' FROM PEDUCEMP A ' +
                      ' WHERE A.RABASDATE = '''+sRabasdate+''' ' +
                      '   AND A.DEPTCODE  = '''+GsDeptcode+''' ' +
                      '   AND A.EMPNO     = '''+var_empno +''' ' +
                      ' ORDER BY SNUM) ' ;

    end;
  end
  else if var_evcno='2' then
  begin
    if (gsEkind = '공통역량')  or (gsEkind = '리더십역량') then
    begin
      ParamVariant := 'SELECT  nvl(TO_CHAR(A.itemno),'' ''), nvl(D.itemname,'' ''), '+#13+
                      '        nvl(TO_CHAR(A.imageno),'' ''),                       '+#13+
                      '        nvl(A.imagedesc,'' '') Imagedesc ,                   '+#13+
                      '        nvl(TO_CHAR(floor(E.cscore)),'' '') cscore,          '+#13+
                      '        nvl(TO_CHAR(floor(E.dscore)),'' '') dscore,          '+#13+
                      '        nvl(TO_CHAR(floor(E.tscore)),'' '') tscore,          '+#13+
                      '        nvl(TO_CHAR(floor(C.score)),'' '') sscore ,          '+#13+
                      '        nvl(TO_CHAR(floor(F.score)),'' '') lascore,'' '',    '+#13+
                      '        nvl(TO_CHAR(floor(B.score)),'' '') lbscore,          '+#13+
                      '        NVL(C.OBJYN,''N''), C.OBJSAYU,                       '+#13+
                      '        C.OBJOPINION,       C.OBJOPINION2                    '+#13+
                      '   FROM pehacd A,pesdl  B,pehac  D,                          '+#13+
                      '         ( SELECT itemno, imageno, score                     '+#13+
                      '             FROM pesdl                                      '+#13+
                      '            WHERE rabasdate = '''+sRabasdate+'''             '+#13+
                      '              AND empno    = '''+var_empno+'''               '+#13+
                      '              AND eempno   = '''+var_FistEmp+'''             '+#13+
                      '              AND ekind    = '''+gsEkind+''') F,             '+#13+
                      '        (SELECT itemno, imageno, score,                      '+#13+
                      '                OBJYN, OBJSAYU, OBJOPINION, OBJOPINION2      '+#13+
                      '           FROM pesds                                        '+#13+
                      '          WHERE rabasdate = '''+sRabasdate+'''               '+#13+
                      '            AND empno    = '''+var_empno+'''                 '+#13+
                      '            AND ekind    = '''+gsEkind+''') C,               '+#13+
                      '        (SELECT itemno, imageno, avg(score) cscore,          '+#13+
                      '                avg(score) dscore, avg(score) tscore         '+#13+
                      '           FROM pesdc                                        '+#13+
                      '          WHERE rabasdate = '''+sRabasdate+'''               '+#13+
                      '            AND empno    = '''+var_empno+'''                 '+#13+
                      '            AND ekind    = '''+gsEkind+'''                   '+#13+
                      '       Group By itemno,imageno ) E                           '+#13+
                      '  WHERE A.rabasdate = '''+sRabasdate+'''                     '+#13+
                      '    AND A.evcno     = '+var_evcno+'                          '+#13+
                      '    AND A.ekind     = '''+gsEkind+'''                        '+#13+
                      '    AND A.paycl     = '''+var_paycl +'''                     '+#13+ //dsa2000 2008.09.Add
                      '    AND A.rabasdate = D.rabasdate                            '+#13+
                      '    AND A.evcno     = D.evcno                                '+#13+
                      '    AND A.ekind     = D.ekind                                '+#13+
                      '    AND A.itemno    = D.itemno                               '+#13+
                      '    AND A.paycl     = D.paycl                                '+ //dsa2000 2008.09.Add
                      '    AND B.empno(+)  = '''+var_empno+'''                      '+#13+
                      '    AND B.eempno(+) = '''+Pempno+'''                         '+#13+
                      '    AND A.rabasdate = B.rabasdate(+)                         '+#13+
                      '    AND A.ekind     = B.ekind(+)                             '+#13+
                      '    AND A.itemno    = B.itemno(+)                            '+#13+
                      '    AND A.imageno   = B.imageno(+)                           '+#13+
                      '    AND A.itemno    = C.itemno(+)                            '+#13+
                      '    AND A.imageno   = C.imageno(+)                           '+#13+
                      '    AND A.itemno    = E.itemno(+)                            '+#13+
                      '    AND A.imageno   = E.imageno(+)                           '+#13+
                      '    AND A.itemno    = F.itemno(+)                            '+
                      '    AND A.imageno   = F.imageno(+)                           '+
                      ' ORDER BY A.itemno asc, A.imageno asc                        ';
    end
    else if (gsEkind = '직무역량') then
    begin
      ParamVariant := '  SELECT nvl(to_char(ITEMNO  ),''0'') ITEMNO, '+
                      '         NVL(SUBSTR(itemname,1, DECODE(ITEMNO, ''99'', 12, INSTR(itemname,''('')-3)) ,'' '') itemname, '+
                      '         SNUM IMAGENO, nvl(ITEMDESC ,'' '') ITEMDESC, '+
                      '         ''''                                cscore,  '+
                      '         ''''                                dscore,  '+
                      '         ''''                                tscore,  '+
                      '         NVL(TO_CHAR(FLOOR(sscore)),'' '') sscore ,   '+
                      '         NVL(TO_CHAR(FLOOR(lascore)) ,'' '') lascore, '+
                      '         '''' LAEBRSCORE, '''' LBSCORE,               '+
                      '         NVL(OBJYN,''N''), OBJSAYU, OBJOPINION, OBJOPINION2 from ( '+
                      '  SELECT nvl(to_char(A.ITEMNO),''0'') ITEMNO,' +
                      '        CASE  WHEN A.ITEMNO = ''99'' THEN ' +
                      '             (SELECT ITEMNAME5 FROM PEDUCDEPT WHERE RABASDATE = A.RABASDATE AND DEPTCODE = A.DEPTCODE AND ITEMNO = A.ITEMNO) ' +
                      '        ELSE ' +
                      '             (SELECT ITEMNAME FROM PEDUC WHERE RABASDATE = A.RABASDATE AND ITEMNO = A.ITEMNO) ' +
                      '        END ITEMNAME, ' +
                      '        A.SNUM, ' +
                      '        CASE WHEN A.ITEMNO = ''99'' THEN ' +
                      '             (SELECT ITEMDESC5 FROM PEDUCDEPT WHERE RABASDATE = A.RABASDATE AND DEPTCODE = A.DEPTCODE AND ITEMNO = A.ITEMNO) ' +
                      '        ELSE ' +
                      '             (SELECT ITEMDESC FROM PEDUC WHERE RABASDATE = A.RABASDATE AND ITEMNO = A.ITEMNO) ' +
                      '        END ITEMDESC, ' +
                      '        (SELECT score       FROM pesds WHERE rabasdate = A.RABASDATE AND empno = A.EMPNO AND ITEMNO = A.ITEMNO  AND ekind = '''+gsEkind+''') sscore,   ' + //자기평가
                      '        (SELECT score       FROM pesdl WHERE rabasdate = A.RABASDATE AND empno = A.EMPNO AND ITEMNO = A.ITEMNO  AND ekind = '''+gsEkind+''') lascore,  ' + //하향평가
                      '        (SELECT OBJYN       FROM pesds WHERE rabasdate = A.RABASDATE AND empno = A.EMPNO AND ITEMNO = A.ITEMNO  AND ekind = '''+gsEkind+''') OBJYN,   ' +
                      '        (SELECT OBJSAYU     FROM pesds WHERE rabasdate = A.RABASDATE AND empno = A.EMPNO AND ITEMNO = A.ITEMNO  AND ekind = '''+gsEkind+''') OBJSAYU, ' +
                      '        (SELECT OBJOPINION  FROM pesds WHERE rabasdate = A.RABASDATE AND empno = A.EMPNO AND ITEMNO = A.ITEMNO  AND ekind = '''+gsEkind+''') OBJOPINION,  ' +
                      '        (SELECT OBJOPINION2 FROM pesds WHERE rabasdate = A.RABASDATE AND empno = A.EMPNO AND ITEMNO = A.ITEMNO  AND ekind = '''+gsEkind+''') OBJOPINION2  ' +
                      ' FROM PEDUCEMP A ' +
                      ' WHERE A.RABASDATE = '''+sRabasdate+''' ' +
                      '   AND A.DEPTCODE  = '''+GsDeptcode+''' ' +
                      '   AND A.EMPNO     = '''+var_empno +''' ' +
                      ' ORDER BY SNUM) ' ;
    end;
  end;

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
    edit1.Text := ParamVariant;
    Open;

    while Not Eof do
    begin
      inc(i);
      SG_HiddenData.RowCount := i;
      SG_HiddenData.Cells[dITEM_IDX,     i-1]   := FieldByName('itemno').AsString;   //항목번호
      SG_HiddenData.Cells[dITEMNAME_IDX, i-1]   := FieldByName('itemname').AsString;   //항목명IntToStr(i)+'. '+
      SG_HiddenData.Cells[dIMAGE_IDX,    i-1]   := FieldByName('imageno').AsString;  //이미지번호
      SG_HiddenData.Cells[dITEMDESC_IDX, i-1]   := FieldByName('imagedesc').AsString;//이미지내용

      SG_HiddenData.Cells[dCSCORE_IDX,   i-1]   := FieldByName('cscore').AsString;   //동료평가점수
      SG_HiddenData.Cells[dSSCORE_IDX,   i-1]   := FieldByName('sscore').AsString;   //자기평가점수

      SG_HiddenData.Cells[dLASCORE_IDX,  i-1]   := FieldByName('lascore').AsString;  //상사1차평가점수
      SG_HiddenData.Cells[dSCORE_IDX,    i-1]   := FieldByName('lbscore').AsString;  //점수
      SG_HiddenData.Cells[dTMPSCORE_IDX, i-1]   := FieldByName('lbscore').AsString;  //점수
      SG_HiddenData.Cells[dMODIFIED_IDX, i-1]   := 'N'; //변동여부

      SG_HiddenData.Cells[dOBJYN_IDX,     i-1]  := FieldByName('OBJYN').AsString;      // 이의신청여부
      SG_HiddenData.Cells[dOBJSAYU_IDX,   i-1]  := FieldByName('OBJSAYU').AsString;    // 피평가자이의신청내용
      SG_HiddenData.Cells[dOBJOPINION1_IDX,i-1] := FieldByName('OBJOPINION1').AsString; // 평가자평가소견
      SG_HiddenData.Cells[dOBJOPINION2_IDX,i-1] := FieldByName('OBJOPINION2').AsString; // 평가자평가소견

      Next;
    end;
    Close;
  end;

  with TDS1 do
  begin
    ServiceName := 'HINSA_select3';
    Close;
    Sql.Clear;

    if      (gsEkind = '공통역량')  Then
    Begin
      ParamVariant := ' SELECT MERIT_JCY field1, MERIT_JCN field2, ''field3'', ''field4'',''field5''  '+
                      '  FROM PEHREMER  ';
      Lb1.Visible := False;
    End
    Else if (gsEkind = '리더십역량') Then
    Begin
      ParamVariant := ' SELECT MERIT_JRY field1, MERIT_JRN field2, ''field3'', ''field4'',''field5''  '+
                      '  FROM PEHREMER  ';
      Lb1.Visible := False;
    End
    Else if (gsEkind = '직무역량') Then
    Begin
      ParamVariant := ' SELECT MERIT_JAY field1, MERIT_JAN field2, ''field3'', ''field4'',''field5''  '+
                      '  FROM PEHREMER  ';
      Lb1.Visible := True;
    End;

    ParamVariant := ParamVariant + ' where rabasdate  = ''' + sRabasdate +''' ' +
                                   '   AND empno      = ''' + var_empno +''' ' ;

    ClearFieldInfo;
    AddField('field1' ,ftString, 2000);
    AddField('field2' ,ftString, 2000);
    AddField('field3' ,ftString, 2000);
    AddField('field4' ,ftString, 2000);
    AddField('field5' ,ftString, 2000);
    SQL.Text := ParamVariant;
    Open;

    OM_Merit_C1.Text := Fields[0].AsString;
    OM_Merit_C2.Text := Fields[1].AsString;
  end;

  //총 자기평가점수를 넣는다..
  ShowSum;
end;

procedure TFDown_Sub2.ShowSum;
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

  for i := 0 to SG_HiddenData.RowCount -1 do
  begin
    if (SG_HiddenData.Cells[dTMPSCORE_IDX, i] = '0') or
       (SG_HiddenData.Cells[dTMPSCORE_IDX, i] = '') then
      inc(k)                                                      //2차 미실시
    else
    begin
      inc(j);                                                     //2차 평가
      l := l + StrToInt(SG_HiddenData.Cells[dTMPSCORE_IDX, i]);   //2차 점수
    end;
    p   := P   + StrToIntdef(SG_HiddenData.Cells[dCSCORE_IDX, i], 0 );//동료평가합
    m   := M   + StrToIntdef(SG_HiddenData.Cells[dSSCORE_IDX, i], 0 );//자기평가합
    n   := n   + StrToIntdef(SG_HiddenData.Cells[dLASCORE_IDX, i], 0 );//1차 평가합
  end;

  if (SG_HiddenData.RowCount = 1) and (SG_HiddenData.Cells[0,0] = '') then
  begin
    i := 0;
    j := 0; k := 0;
    l := 0; m := 0; n := 0; Ebr := 0; // 2차,
    p := 0;
  end;

  L_Total.Caption := IntToStr(j+k);
  L_Yes.Caption   := IntToStr(j);
end;

procedure TFDown_Sub2.ShowImage(asItemNum: String);
var
  i, j : Integer;
begin
  SG_Image.RowCount := 1;
  for i := 0 to SG_Image.ColCount - 1 do
    for j := 0 to SG_Image.RowCount -1 do
      SG_Image.Cells[i, j] := '';

  // SG_Image의 이미지 내용을 보여주고
  SG_HiddenData.Tag := -1;
  if SG_HiddenData.Cells[0,0] = '' then
  begin
    MessageBox(handle,'등록된 항목이 하나도 없습니다','확 인', MB_OK or $0030 );
    screen.Cursor := crDefault;
    Exit;
  end;

  for i := 0 to SG_HiddenData.RowCount -1 do
  begin
    if SG_HiddenData.Tag = -1 then
      SG_HiddenData.Tag := i;
    if SG_Image.Cells[0,0] <> '' then
    begin
      SG_Image.RowCount := SG_Image.RowCount + 1;
    end;

    //이미지내용 넣기..
    SG_Image.Cells[mITEMDESC_IDX, SG_Image.RowCount-1] := SG_HiddenData.Cells[dITEMDESC_IDX, i];
    SG_Image.Cells[mITEMNAME_IDX, SG_Image.RowCount-1] := SG_HiddenData.Cells[dITEMNAME_IDX, i];

    // 자기평가점수 보여주기
         if SG_HiddenData.Cells[dSSCORE_IDX, i] = var_ScrS   then SG_Image.Cells[2, SG_Image.RowCount -1] := var_GrdS
    else if SG_HiddenData.Cells[dSSCORE_IDX, i] = var_ScrA   then SG_Image.Cells[2, SG_Image.RowCount -1] := var_GrdA
    else if SG_HiddenData.Cells[dSSCORE_IDX, i] = var_ScrB   then SG_Image.Cells[2, SG_Image.RowCount -1] := var_GrdB
    else if SG_HiddenData.Cells[dSSCORE_IDX, i] = var_ScrC   then SG_Image.Cells[2, SG_Image.RowCount -1] := var_GrdC
    else if SG_HiddenData.Cells[dSSCORE_IDX, i] = var_ScrD   then SG_Image.Cells[2, SG_Image.RowCount -1] := var_GrdD;

    // 상사1차
         if SG_HiddenData.Cells[dLASCORE_IDX, i] = var_ScrS  then SG_Image.Cells[3  , SG_Image.RowCount -1] := var_GrdS
    else if SG_HiddenData.Cells[dLASCORE_IDX, i] = var_ScrA  then SG_Image.Cells[3  , SG_Image.RowCount -1] := var_GrdA
    else if SG_HiddenData.Cells[dLASCORE_IDX, i] = var_ScrB  then SG_Image.Cells[3  , SG_Image.RowCount -1] := var_GrdB
    else if SG_HiddenData.Cells[dLASCORE_IDX, i] = var_ScrC  then SG_Image.Cells[3  , SG_Image.RowCount -1] := var_GrdC
    else if SG_HiddenData.Cells[dLASCORE_IDX, i] = var_ScrD  then SG_Image.Cells[3  , SG_Image.RowCount -1] := var_GrdD;

    // 이의신청내역
    SG_Image.Cells[4, SG_Image.RowCount-1] := SG_HiddenData.Cells[dOBJYN_IDX, i];

  end;
  // SG_Image에 포크스를 준다
 SG_Image.SetFocus;

end;

function TFDown_Sub2.SearchAndReplace(sSrc, sLookFor, sReplaceWith: string ): string;
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

function TFDown_Sub2.IsDataModified: Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := 0 to SG_HiddenData.RowCount -1 do
    if SG_HiddenData.Cells[dMODIFIED_IDX, i] = 'Y' then // 자료변동 여부
    begin
      Result := True;
      Break;
    end;
//if M_Mark1.Modified then // 의견
//  Result := True;
end;

procedure TFDown_Sub2.OnlyVisible;
begin
  if ((gsEkind = '공통역량')   and (var_Able1 = 'Y')) or
     ((gsEkind = '리더십역량') and (var_Able2 = 'Y')) or
     ((gsEkind = '직무역량')   and (var_Able3 = 'Y')) then
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

procedure TFDown_Sub2.Adjust_DropDownRows(CB_name: TComboBox);
begin
  if      CB_name.Items.Count < 5 then  CB_name.DropDownCount := 5
  else if CB_name.Items.Count = 5 then  CB_name.DropDownCount := 5 + 1
  else if CB_name.Items.Count = 20 then CB_name.DropDownCount := 20 + 1
  else if CB_name.Items.Count > 20 then CB_name.DropDownCount := 20
  else                                  CB_name.DropDownCount := CB_name.Items.Count + 1;
end;

{------------------------------버튼클릭---------------------------------}

procedure TFDown_Sub2.SubButtonClick(Sender: TObject);
begin
  if gsEkind <> '' then
  begin
       if (BB_Save.Visible) and (IsDataModified) then
       begin
         MessageBox(handle,'변동된 자료가 있으므로 먼저 저장후 작업을 진행하시기 바랍니다.','작업순서오류',MB_ICONWARNING);
         System.Exit;
       end;
  end;

  if Sender = Bt_Sub1 then
  begin
    gsEkind := '공통역량';
    Bt_Sub1.Font.Color := clBlue;
    Bt_Sub2.Font.Color := clBlack;
    Bt_Sub3.Font.Color := clBlack;
  end
  else if Sender = Bt_Sub2 then
  begin
    gsEkind := '리더십역량';
    Bt_Sub2.Font.Color := clBlue;
    Bt_Sub1.Font.Color := clBlack;
    Bt_Sub3.Font.Color := clBlack;
  end
  else if Sender = Bt_Sub3 then
  begin
    gsEkind := '직무역량';
    Bt_Sub3.Font.Color := clBlue;
    Bt_Sub1.Font.Color := clBlack;
    Bt_Sub2.Font.Color := clBlack;
  end
  else
    Exit;
  L_duname.Caption := '['+gsEkind+']';
  L_Total.Caption  := '0';
  L_Yes.Caption    := '0';
  CB_empnoChange(Sender);
end;

procedure TFDown_Sub2.SB_YesNoClick(Sender: TObject);
var
  lsScore : String;
begin
  if SG_HiddenData.Tag = -1 then Exit;

  if gsEkind = '' then
  begin
    MessageDlg('평가를 선택해 주십시오!', mtError, [mbOK], 0);
    Exit;
  end;

  if ((gsEkind = '공통역량')   and (var_Able1 = 'Y')) or
     ((gsEkind = '리더십역량') and (var_Able2 = 'Y')) or
     ((gsEkind = '직무역량')   and (var_Able3 = 'Y'))  then //현제 능력평가이면서 평가완료가 되었을때..
  begin
    MessageBox(handle,'이미 평가가 완료된 자료는 '+
                       '수정할 수 없습니다.','작업순서오류',MB_ICONWARNING);
    Exit;
  end;

  //평가점수 계산

       if trim(TSpeedButton(Sender).Caption) = var_GrdS  then  lsScore :=  var_ScrS
  else if trim(TSpeedButton(Sender).Caption) = var_GrdA  then  lsScore :=  var_ScrA
  else if trim(TSpeedButton(Sender).Caption) = var_GrdB  then  lsScore :=  var_ScrB
  else if trim(TSpeedButton(Sender).Caption) = var_GrdC  then  lsScore :=  var_ScrC
  else if trim(TSpeedButton(Sender).Caption) = var_GrdD  then  lsScore :=  var_ScrD  else lsScore := '0';

  // 버튼이 눌려지면 SG_HiddenData에 변경된 값과 변경여부를 'Y'로 고친다.
  if TSpeedButton(Sender).Down = True then
  begin
    SG_HiddenData.Cells[dTMPSCORE_IDX, SG_HiddenData.Tag+SG_Image.Row] := lsScore;
    SG_HiddenData.Cells[dMODIFIED_IDX, SG_HiddenData.Tag+SG_Image.Row] := 'Y';
  end else
  begin
    SG_HiddenData.Cells[dTMPSCORE_IDX, SG_HiddenData.Tag+SG_Image.Row] := '';
    SG_HiddenData.Cells[dMODIFIED_IDX, SG_HiddenData.Tag+SG_Image.Row] := 'Y';
  end;

  ShowSum;
end;

procedure TFDown_Sub2.BB_CancelClick(Sender: TObject);
begin
  Retrieve_Data;
//  if SG_Item.cells[0,0] = '' then
  OnlyVisible;
  SG_Item.Row := 0;
  SG_ItemClick(Sender)
end;


{------------------------------ㄱㅣ ㅌ ㅏ---------------------------------}
procedure TFDown_Sub2.SG_ItemClick(Sender: TObject);
begin
  //항목이 없을경우에는 Exit;
  //if SG_Item.Cells[0,0] = '' then Exit;
  //항목이 있을경우에는 ShowImage호출...
  ShowImage(SG_Item.Cells[2, SG_Item.Row]);
end;

procedure TFDown_Sub2.SG_ItemDrawCell(Sender: TObject; Col, Row: Integer;
  Rect: TRect; State: TGridDrawState);
var
  lsBuffer : String;
begin
  if gdSelected in State then
  begin
    SG_Item.Canvas.Brush.Color := $00CFFBFC;//$00FFE8D0;//$00FEEDED;
    SG_Item.Canvas.Font.Color  := clBlack;
  end;

  lsBuffer := SG_Item.Cells[Col, Row];
  SG_Item.Canvas.FillRect(Rect);

  Rect.Top   := Rect.Top + 2; // 실제 Text가 그려지는 영역의 크기를 약간 줄인다
  Rect.Left  := Rect.Left + 2;
  Rect.Right := Rect.Right - 12;
  DrawText(SG_Item.Canvas.Handle, PChar(lsBuffer),
           StrLen(PChar(lsBuffer)), Rect, DT_LEFT or DT_WORDBREAK);
end;

procedure TFDown_Sub2.SG_ImageDrawCell(Sender: TObject; Col, Row: Integer;
  Rect: TRect; State: TGridDrawState);
var
  Loc : Cardinal;
  lsBuffer : String;
  liLeft, liTop : Integer;
begin
  if gdSelected in State then
  begin
    SG_Image.Canvas.Brush.Color := $00CFFBFC;//$00FFE8D0;//$00FFF9EC;//$00CFFBFC;
    SG_Image.Canvas.Font.Color  := clBlack;
    SG_Image.Canvas.Font.Size  := 9;
  end;
  SG_Image.Canvas.FillRect(Rect);

  if ((Col = 3) and (gsSelfYn  <> 'Y')) or
     ((Col = 4) and (gsFirstYn <> 'Y'))  then
    lsBuffer := ''
  else
    lsBuffer := SG_Image.Cells[Col, Row];

  if Col = mITEMNAME_IDX then
  begin
    Loc := DT_CENTER or DT_WORDBREAK;
    Rect.Top := (((Rect.Bottom - Rect.Top) - SG_Image.Canvas.TextHeight(lsBuffer)) div 2) + Rect.Top;
  end
  else if (Col in [mITEMCOL_IDX, mITEMSELF_IDX, mITEME1_IDX, mITEMEBR_IDX]) then
  begin
    Loc := DT_CENTER or DT_WORDBREAK;
    Rect.Top := (((Rect.Bottom - Rect.Top) - SG_Image.Canvas.TextHeight(lsBuffer)) div 2) + Rect.Top;
    SG_Image.Canvas.Font.Style := [fsBold];
//    SG_Image.Canvas.Font.Color := $008D8022;
    SG_Image.Canvas.Font.Size  := 9;
  end
  else
  begin
    Loc := DT_LEFT or DT_WORDBREAK;
    Rect.Left := Rect.Left + 4;
    Rect.Top := Rect.Top + 4;
  end;
  DrawText(SG_Image.Canvas.Handle, PChar(lsBuffer), StrLen(PChar(lsBuffer)), Rect, Loc);

  // SG_HiddenData.Tag 에 현재 평가요소의 시작 index가 저장되어 있음
  if SG_HiddenData.Tag = -1 then System.Exit;
  // 포커스가 없을땐 버튼을 보여주지 않는다
  if not SG_Image.Focused then  System.Exit;

  // 선택된 row가 화면에 보이게 위치를 바꾼다
  if SG_Image.Row < SG_Image.TopRow then // 현재 row 가 화면위에 있다
    SG_Image.Row := SG_Image.TopRow
  else if SG_Image.Row > (SG_Image.TopRow + SG_Image.VisibleRowCount-1) then // 현재 row 가 화면밑에 있다
    SG_Image.Row := SG_Image.TopRow + SG_Image.VisibleRowCount-1;
end;

procedure TFDown_Sub2.SG_ScoreEnter(Sender: TObject);
begin
  SG_Image.SetFocus;
end;

procedure TFDown_Sub2.SG_ImageKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_UP) and (SG_Image.Row = 0) and (SG_Item.Row  > 0) then
  begin
    // 맨위 항목에서 위쪽 화살표 키이면 이전 요소의 마지막 항목으호 이동
    SG_Item.Row := SG_Item.Row - 1;
    SG_ItemClick(Sender);
    SG_Image.Row := SG_Image.RowCount-1;
    Key := VK_ESCAPE;
  end
  else if (Key = VK_DOWN) and (SG_Image.Row = SG_Image.RowCount-1) and
         (SG_Item.Row < (SG_Item.RowCount-1)) then
  begin
    // 맨아래 항목에서 아래쪽 화살표 키이면 다음 요소의 첫번째 항목으호 이동
    SG_Item.Row := SG_Item.Row + 1;
    SG_ItemClick(Sender);
    SG_Image.Row := 0;
    Key := VK_ESCAPE;
  end;
end;

procedure TFDown_Sub2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if (BB_Save.Visible) and (IsDataModified) then
  begin
       MessageBox(handle,'변동된 자료가 있으므로 먼저 저장후 작업을 진행하시기 바랍니다.','작업순서오류',MB_ICONWARNING);
       CanClose := False;
       System.Exit;
  end;
  CanClose := True;
end;

procedure TFDown_Sub2.CB_empnoChange(Sender: TObject);
var
  ParamVariant : String;
  i            : Integer;
  sList_Eempno: String;
begin
  if IsDataModified then
  begin
    MessageBox(handle,'변동된 자료가 있으므로 먼저 저장후 작업을 진행하시기 바랍니다.','작업순서오류',MB_ICONWARNING);
    Exit;
  end;
 //1차평가자 구하기..

  ParamVariant := 'SELECT nvl(la.eempno,'' '') eempno, nvl(la.korname, '' '') korname,  ' +                                      #13+
                  '       '' 1차''||nvl(RPAD(la.korname,6,'' '')||''(''||la.eempno||'')'', '' '') cbkorname  ' +                 #13+
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
                  '       ''지점''||nvl(RPAD(la.korname,6,'' '')||''(''||la.eempno||'')'', '' '') cbkorname  ' +                 #13+
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
      // 만약 1차평가자가 2명(1차,지점)초과면 수정요함
      if copy(FieldByName('cbkorname').asString,1,4) = '지점' then
        var_FistEbrEmp := copy(FieldByName('cbkorname').asString,(Length(FieldByName('cbkorname').asString)-4),4)
      else
        var_FistEmp :=    copy(FieldByName('cbkorname').asString,(Length(FieldByName('cbkorname').asString)-4),4);

      sList_Eempno := sList_Eempno +
                      copy(FieldByName('cbkorname').asString,5,(Length(FieldByName('cbkorname').asString)+9))+', ';
      Next;
    end;

    if RecordCount < 1 then
      sList_Eempno := ' 없습니다.!'
    else
    begin
      sList_Eempno := copy(sList_Eempno,1,Length(sList_Eempno)-2);
    end;

    Close;
  end;

  Retrieve_Head(Sender);
end;

procedure TFDown_Sub2.Retrieve_Head(Sender: TObject);
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

procedure TFDown_Sub2.SB_ScoreClick(Sender: TObject);
begin
  FM_Marks := TFM_Marks.Create(Self);
  try
    FM_Marks.Tag := 2;
    FM_Marks.ShowModal;
  finally
    FM_Marks.Free;
  end;
end;

procedure TFDown_Sub2.SG_ImageSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
    if OpenForm = 1 then
    begin
         if SG_Image.Cells[5, ARow] = 'Y' then
         begin
           FM_Main.Bt_Add.Visible      := True;
           FM_Main.Bt_OConfirm.Visible := True;
           vImageno     := SG_HiddenData.Cells[dIMAGE_IDX,       ARow];
           vItemno      := SG_HiddenData.Cells[dITEM_IDX,        ARow];
           vItemname    := SG_HiddenData.Cells[dITEMNAME_IDX,    ARow];
           vOBJYN       := SG_HiddenData.Cells[dOBJYN_IDX,       ARow];
           vOBJsayu     := SG_HiddenData.Cells[dOBJSAYU_IDX,     ARow];
           vOBJopinion1 := SG_HiddenData.Cells[dOBJOPINION1_IDX, ARow];
           vOBJopinion2 := SG_HiddenData.Cells[dOBJOPINION2_IDX, ARow];
           vSelectdRow  := ARow;

           if ( (Lwork = '1차') and (FM_Main.v_e1opinionyn = 'Y') ) or  ( (Lwork = '2차') and (FM_Main.v_e2opinionyn = 'Y') ) then
           begin
             FM_Main2.Bt_Add.Caption      := '평가소견 열람';
             FM_Main2.Bt_OConfirm.Enabled := False;
           end;

         end
         else
         if SG_Image.Cells[5, ARow] = 'N' then
         begin
            FM_Main.Bt_Add.Visible      := False;
            FM_Main.Bt_OConfirm.Visible := False;
         end;
    end
    else
    if OpenForm = 2 then
    begin
         if SG_Image.Cells[5, ARow] = 'Y' then
         begin
           FM_Main2.Bt_Add.Visible      := True;
           FM_Main2.Bt_OConfirm.Visible := True;
           vImageno     := SG_HiddenData.Cells[dIMAGE_IDX,       ARow];
           vItemno      := SG_HiddenData.Cells[dITEM_IDX,        ARow];
           vItemname    := SG_HiddenData.Cells[dITEMNAME_IDX,    ARow];
           vOBJYN       := SG_HiddenData.Cells[dOBJYN_IDX,       ARow];
           vOBJsayu     := SG_HiddenData.Cells[dOBJSAYU_IDX,     ARow];
           vOBJopinion1 := SG_HiddenData.Cells[dOBJOPINION1_IDX, ARow];
           vOBJopinion2 := SG_HiddenData.Cells[dOBJOPINION2_IDX, ARow];
           vSelectdRow := ARow;

           if ( (Lwork = '1차') and (FM_Main2.v_e1opinionyn = 'Y') ) or  ( (Lwork = '2차') and (FM_Main2.v_e2opinionyn = 'Y') ) then
           begin
             FM_Main2.Bt_Add.Caption      := '평가소견 열람';
             FM_Main2.Bt_OConfirm.Visible := False;
           end;

         end
         else if SG_Image.Cells[5, ARow] = 'N' then
         begin
            FM_Main2.Bt_Add.Visible      := False;
            FM_Main2.Bt_OConfirm.Visible := False;
         end;
    end;
end;

end.

