unit UDown_Sub1;  //1차 상사평가

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, Buttons, ExtCtrls, Pass, DBGrids, Db, DBClient,
  peoutlookbtn, pepaser, Mask, pebtnedit, peNumedit,
  PeJeonVertLabel, PeJeonLabel, pegradpanl, OnEditBaseCtrl, OnEditStdCtrl,
  OnEditMemo, Tmax_DataSetText;

type
  TFDown_Sub1 = class(TForm)
    CB_ShowClass: TCheckBox;
    M_Mark1: TMemo;
    M_Mark2: TMemo;
    SG_Image: TStringGrid;
    Bt_Sub1: TPeJeonOutLookBtn;
    Bt_Sub2: TPeJeonOutLookBtn;
    M_Mark3: TMemo;
    BB_Save: TPeJeonOutLookBtn;
    BB_Cancel: TPeJeonOutLookBtn;
    SB_Score: TPeJeonOutLookBtn;
    Label13: TLabel;
    Label8: TLabel;
    SG_HiddenData: TStringGrid;
    Panel7: TPanel;
    SG_Score: TStringGrid;
    P_ControlButton: TPanel;
    SB_S: TSpeedButton;
    SB_A: TSpeedButton;
    SB_B: TSpeedButton;
    SB_C: TSpeedButton;
    SB_D: TSpeedButton;
    Label11: TLabel;
    Label12: TLabel;
    Label1: TLabel;
    Label2: TLabel;
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
    LT_Count: TPanel;
    LT_Self: TPanel;
    Label15: TLabel;
    Label17: TLabel;
    Bt_Sub3: TPeJeonOutLookBtn;
    Label16: TLabel;
    L_Total: TLabel;
    L_Yes: TLabel;
    L_eempno: TLabel;
    CB_empno: TLabel;
    Label14: TLabel;
    L_duname: TLabel;
    Label18: TLabel;
    Panel1: TPanel;
    L_obj1: TLabel;
    L_obj2: TLabel;
    OnMemo9: TOnMemo;
    OnMemo8: TOnMemo;
    OM_Merit_C2: TOnMemo;
    OM_Merit_C1: TOnMemo;
    TDml: TTMaxDataSet;
    TDS1: TTMaxDataSet;
    Lb1: TLabel;
    Edit1: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure BB_ExitClick(Sender: TObject);
    procedure SubButtonClick(Sender: TObject);
    procedure BB_CancelClick(Sender: TObject);
    procedure SG_ImageDrawCell(Sender: TObject; Col, Row: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SG_ImageExit(Sender: TObject);
    procedure SG_ScoreDrawCell(Sender: TObject; Col, Row: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SG_ScoreEnter(Sender: TObject);
    procedure CB_ShowClassClick(Sender: TObject);
    procedure SB_YesNoClick(Sender: TObject);
    procedure DataSave(Sender: TObject);
    procedure SG_ImageKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure SB_ScoreClick(Sender: TObject);
    procedure SG_ImageSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
  private
    { Private declarations }
    procedure OnlyVisible;
    procedure Retrieve_Data;
    procedure ShowImage;
    function SearchAndReplace(sSrc, sLookFor, sReplaceWith: string ): string;
    procedure ShowSum;
    procedure Adjust_DropDownRows(CB_name: TComboBox);
  public
    { Public declarations }
    Pempno, Pkorname, Password, Ppermission: string;
    var_paycl   : String; //직급별 평가표번호를 불어오기위해 추가.  dsa2000 2008.09.
    var_Able1, var_Able2, var_Able3 : String; //능력, 태도 평가확인 여부
    gsItemIdx   : Integer;
    gsColYn     : String; //동료평가완료여부
    gsSelfYn    : String; //자기평가완료여부
    gsEkind     : String; //역량구분
    var_evcno   : String; //평가표번호
    var_empno   : String; //피평가자 사번
    var_korname : String; //피평가자 성명
    var_jobkind : String; //피평가자 직종
    GsDeptcode  : String;
    Running: Boolean;

    vImageno    : String;
    vItemno     : String;
    vItemname   : String;
    vOBJYN      : String;
    vOBJSAYU    : String;
    vOBJOpinion1 : String;
    vOBJOpinion2 : String;
    vSelectdRow : Integer;

    iWidth_ItemName :Integer;
    iWidth_ItemDesc :Integer;
    iWidth_SelfScore :Integer;

//==============================================================================//
//  31.32     2002.06.06      손종운    동료평가조회기능 추가
//==============================================================================//
    iWidth_LTitle :Integer;
    iLeft_LTCount :Integer;
    iLeft_LTTot   :Integer;
    iLeft_LTDept  :Integer;
    iLeft_LTCol   :Integer;
    iLeft_LTSelf  :Integer;
    iLeft_LTot    :Integer;
    iLeft_LDept   :Integer;
    iLeft_LCol    :Integer;
    iLeft_LSelf   :Integer;
    iLeft_LTtitle :Integer;
//==============================================================================//
    OpenForm      :Integer;

    function IsDataModified: Boolean;
    procedure InUpMerit(Parameter: String);
  end;

const
  // 평가이미지내용(태도) Width
  WIDTH_SGIMAGE_COL1  = 60;
  WIDTH_SGIMAGE_SCORE = 62;

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
  mITEMNAME_IDX  = 0;
  mITEMDESC_IDX  = 1; // 평가이미지내용
  mCOLSCORE_IDX  = 2; // 평가이미지내용
  mSELFSCORE_IDX = 3; // 평가이미지내용

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
  FDown_Sub1: TFDown_Sub1;

Implementation

{$R *.DFM}

uses
  Hinsa_TmaxDM, kpaylib, HSubForm, UFM_Marks, HMainForm, HMainForm2;

{----------------------------------Form Open-----------------------------------}

procedure TFDown_Sub1.FormCreate(Sender: TObject);
begin
  Running := True;
  iWidth_ItemName := SG_Image.ColWidths[mITEMNAME_IDX];
  iWidth_ItemDesc := SG_Image.ColWidths[mITEMDESC_IDX];
  iWidth_SelfScore:= SG_Image.ColWidths[mSELFSCORE_IDX];
end;

procedure TFDown_Sub1.FormShow(Sender: TObject);
var
  ParamVariant: String;
  CompIp: String;
  iy, ix : Integer;
  TempStr : String;
begin
  if Running = false then System.Exit;

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
  Retrieve_Data;
  ShowImage;
end;

{------------------------------사용자정의 함수---------------------------------}

procedure TFDown_Sub1.Retrieve_Data;
var
  ParamVariant: String;
  i, j        : Integer;
  TempStr    : String;
begin
  //피평가자 사번 구하기..
  Application.ProcessMessages;

  ParamVariant := 'SELECT  nvl(A.abconyn,''N''),  nvl(A.beconyn,''N'') ,                     '+
                  '        nvl(A.duconyn,''N''),  nvl(A.ValConyn,''N''),                     '+ //dsa2000  2008.09. ValConyn Add
                  '        nvl(A.mark1,'' ''),    nvl(A.mark2,'' ''),   nvl(A.mark3,'' ''),  '+
                  '        nvl(C.deptname,'' '') , nvl(D.codename,'' '') ,                   '+
                  '        nvl(DECODE(E.abconyn, ''Y'',                                      '+
                  '        DECODE(E.beconyn, ''Y'', ''Y'', ''N''), ''N''),''N'') conyn       '+
                  '   FROM pesmla A, pehamas B, pycdept C, pyccode D, pesms E                '+
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

    //showmessage(inttostr(DataModule_Tmax.TMaxDataSet_HInsa.recordcount));
    if Eof then
    begin
      MessageDlg('상사평가 피평가자가 아닙니다.', mtError, [mbOK], 0);
      screen.Cursor := crDefault;
      Close;
      Exit;
    end;

    CB_empno.Hint := '소속: '+ FieldByName('deptname').AsString + '   '+
                     'BAND: '+ FieldByName('codename').AsString;

    M_Mark1.Clear;
    M_Mark1.SelStart := 0;
    M_Mark1.Perform(EM_SCROLLCARET, 0, 0);

    M_Mark2.Clear;
    M_Mark2.SelStart := 0;
    M_Mark2.Perform(EM_SCROLLCARET, 0, 0);

    M_Mark3.Clear;
    M_Mark3.SelStart := 0;
    M_Mark3.Perform(EM_SCROLLCARET, 0, 0);

    TempStr := FieldByName('mark1').AsString;
    if TempStr <> '' then
      while Pos(#10#10, TempStr) > 0 do // ORACLE에 저장된 #10#10 을 #13#10 으로 변환
        TempStr := SearchAndReplace(TempStr, #10#10, #13#10);
    M_Mark1.Text := TempStr;

    TempStr := FieldByName('mark2').AsString;
    if TempStr <> '' then
      while Pos(#10#10, TempStr) > 0 do // ORACLE에 저장된 #10#10 을 #13#10 으로 변환
        TempStr := SearchAndReplace(TempStr, #10#10, #13#10);
    M_Mark2.Text := TempStr;

    TempStr := FieldByName('mark3').AsString;
    if TempStr <> '' then
      while Pos(#10#10, TempStr) > 0 do // ORACLE에 저장된 #10#10 을 #13#10 으로 변환
        TempStr := SearchAndReplace(TempStr, #10#10, #13#10);
    M_Mark3.Text := TempStr;

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

    gsSelfYn := FieldByName('conyn').AsString //자기평가완료여부

  end; //with DM.QueryTemp

  //SG_HiddenDate에 항목번호, 이미지번호, 이미지내용, 평가점수, 변경여부를 넣고
  SG_HiddenData.RowCount := 1;
  for i := 0 to SG_HiddenData.ColCount - 1 do
    for j := 0 to SG_HiddenData.RowCount -1 do
      SG_HiddenData.Cells[i, j] := '';

  i := 0; j := 0;

  //항목번호, 이미지번호,이미지내용, 자기평가점수, 상사1차평가점수,
//  ParamVariant := 'SELECT  nvl(TO_CHAR(A.itemno),'' ''), nvl(TO_CHAR(A.imageno),'' '') ,' +

  if var_evcno ='1' then
  begin
    if (gsEkind = '공통역량')  then
    begin
      ParamVariant := 'SELECT  nvl(TO_CHAR(A.itemno),'' ''), nvl(D.itemname,'' ''),     '+
                      '        nvl(TO_CHAR(A.imageno),'' ''),                           '+
                      '        nvl(A.imagedesc,'' '') Imagedesc ,                       '+
                      '        nvl(TO_CHAR(floor(E.cscore)),'' '') cscore,              '+
                      '        nvl(TO_CHAR(floor(E.dscore)),'' '') dscore,              '+
                      '        nvl(TO_CHAR(floor(E.tscore)),'' '') tscore,              '+
                      '        nvl(TO_CHAR(floor(C.score)),'' '') sscore ,              '+
                      '        nvl(TO_CHAR(floor(B.score)),'' '') lascore,              '+
                      '        NVL(C.OBJYN,''N''), C.OBJSAYU,                           '+
                      '        C.OBJOPINION,       C.OBJOPINION2                        '+
                      '   FROM pehacd A, pesdl B, pehac  D,                             '+
                      '        (SELECT itemno, imageno, score,                          '+
                      '                OBJYN, OBJSAYU, OBJOPINION, OBJOPINION2          '+
                      '           FROM pesds                                            '+
                      '          WHERE rabasdate = '''+sRabasdate+'''                   '+
                      '            AND empno    = '''+var_empno+'''                     '+
                      '            AND ekind    = '''+gsEkind+''') C,                   '+
                      '        (SELECT itemno, imageno, avg(score) cscore,              '+
                      '                avg(score) dscore, avg(score) tscore             '+
                      '           FROM pesdc                                            '+
                      '          WHERE rabasdate = '''+sRabasdate+'''                   '+
                      '            AND empno    = '''+var_empno+'''                     '+
                      '            AND length(eempno)  = 16                             '+
                      '            AND ekind    = '''+gsEkind+'''                       '+
                      '         Group By itemno,imageno) E                              '+
                      '  WHERE A.rabasdate = '''+sRabasdate+'''                         '+
                      '    AND A.evcno     = '+var_evcno+'                              '+
                      '    AND A.paycl     = '''+var_paycl +'''                         '+ //dsa2000 2008.09.Add
                      '    AND A.ekind     = '''+gsEkind+'''                            '+
                      '    AND A.rabasdate = D.rabasdate                                '+
                      '    AND A.evcno     = D.evcno                                    '+
                      '    AND A.ekind     = D.ekind                                    '+
                      '    AND A.itemno    = D.itemno                                   '+
                      '    AND A.paycl     = D.paycl                                    '+ //dsa2000 2008.09.Add
                      '    AND B.empno(+)  = '''+var_empno+'''                          '+
                      '    AND B.eempno(+) = '''+Pempno+'''                             '+
                      '    AND A.rabasdate = B.rabasdate(+)                             '+
                      '    AND A.ekind     = B.ekind(+)                                 '+
                      '    AND A.itemno    = B.itemno(+)                                '+
                      '    AND A.imageno   = B.imageno(+)                               '+
                      '    AND A.itemno    = C.itemno(+)                                '+
                      '    AND A.imageno   = C.imageno(+)                               '+
                      '    AND A.itemno    = E.itemno(+)                                '+
                      '    AND A.imageno   = E.imageno(+)                               '+
                      ' ORDER BY A.itemno asc, A.imageno asc                            ';
    end
    else if (gsEkind = '리더십역량') then
    begin
      ParamVariant := 'SELECT  nvl(TO_CHAR(A.itemno),'' ''), nvl(D.itemname,'' ''),     '+
                      '        nvl(TO_CHAR(A.imageno),'' ''),                           '+
                      '        nvl(A.imagedesc,'' '') Imagedesc ,                       '+
                      '        nvl(TO_CHAR(floor(E.cscore)),'' '') cscore,              '+
                      '        nvl(TO_CHAR(floor(E.cscore)),'' '') dscore,              '+
                      '        nvl(TO_CHAR(floor(E.cscore)),'' '') tscore,              '+
                      '        nvl(TO_CHAR(floor(C.score)),'' '') sscore ,              '+
                      '        nvl(TO_CHAR(floor(B.score)),'' '') lascore,              '+
                      '        NVL(C.OBJYN,''N''), C.OBJSAYU, C.OBJOPINION, OBJOPINION2 '+
                      '   FROM pehacd A,pesdl  B,pehac  D,                              '+
                      '        (SELECT itemno, imageno, score,                          '+
                      '                OBJYN, OBJSAYU, OBJOPINION, OBJOPINION2          '+
                      '           FROM pesds                                            '+
                      '          WHERE rabasdate = '''+sRabasdate+'''                   '+
                      '            AND empno    = '''+var_empno+'''                     '+
                      '            AND ekind    = '''+gsEkind+''') C,                   '+
                      '        (SELECT itemno, imageno, avg(score) cscore               '+
                      '           FROM pesdc                                            '+  //하은영
                      '          WHERE rabasdate = '''+sRabasdate+'''                   '+
                      '            AND empno    = '''+var_empno+'''                     '+
                      '            AND length(eempno)  = 16                             '+
                      '            AND ekind    = '''+gsEkind+'''                       '+
                      '          group by itemno,imageno) E                             '+
                      '  WHERE A.rabasdate = '''+sRabasdate+'''                         '+
                      '    AND A.evcno     = '+var_evcno+'                              '+
                      '    AND A.ekind     = '''+gsEkind+'''                            '+
                      '    AND A.paycl     = '''+var_paycl +'''                         '+ //dsa2000 2008.09.Add
                      '    AND A.rabasdate = D.rabasdate                                '+
                      '    AND A.evcno     = D.evcno                                    '+
                      '    AND A.ekind     = D.ekind                                    '+
                      '    AND A.itemno    = D.itemno                                   '+
                      '    AND A.paycl     = D.paycl                                    '+ //dsa2000 2008.09.Add
                      '    AND B.empno(+)  = '''+var_empno+'''                          '+
                      '    AND B.eempno(+) = '''+Pempno+'''                             '+
                      '    AND A.rabasdate = B.rabasdate(+)                             '+
                      '    AND A.ekind     = B.ekind(+)                                 '+
                      '    AND A.itemno    = B.itemno(+)                                '+
                      '    AND A.imageno   = B.imageno(+)                               '+
                      '    AND A.itemno    = C.itemno(+)                                '+
                      '    AND A.imageno   = C.imageno(+)                               '+
                      '    AND A.itemno    = E.itemno(+)                                '+
                      '    AND A.imageno   = E.imageno(+)                               '+
                      ' ORDER BY A.itemno asc, A.imageno asc                            ';
    end
    else if (gsEkind = '직무역량') then
    begin
      ParamVariant := '  SELECT nvl(to_char(ITEMNO  ),''0'') ITEMNO, '+
                      '         NVL(SUBSTR(itemname,1, DECODE(ITEMNO, ''99'', 12, INSTR(itemname,''('')-3)) ,'' '') itemname, '+
                      '         SNUM, nvl(ITEMDESC ,'' '') ITEMDESC,  '+
                      '         ''''                                cscore,  '+
                      '         ''''                                dscore,  '+
                      '         ''''                                tscore,  '+
                      '         NVL(TO_CHAR(FLOOR(sscore)),'' '') sscore , '+
                      '         NVL(TO_CHAR(FLOOR(lascore)) ,'' '') lascore, '+
                      '         NVL(OBJYN,''N''), OBJSAYU, OBJOPINION, OBJOPINION2 from (   '+
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
                      '        nvl(TO_CHAR(floor(B.score)),'' '') lascore,          '+#13+
                      '        NVL(C.OBJYN,''N''), C.OBJSAYU,                       '+#13+
                      '        C.OBJOPINION, C.OBJOPINION2                          '+#13+
                      '   FROM pehacd A,pesdl  B,pehac  D,                          '+#13+
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
                      '    AND A.paycl     = '''+var_paycl +'''                     '+#13+
                      '    AND A.ekind     = '''+gsEkind+'''                        '+#13+
                      '    AND A.rabasdate = D.rabasdate                            '+#13+
                      '    AND A.evcno     = D.evcno                                '+#13+
                      '    AND A.ekind     = D.ekind                                '+#13+
                      '    AND A.itemno    = D.itemno                               '+#13+
                      '    AND A.paycl     = D.paycl                                '+#13+
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
                      ' ORDER BY A.itemno asc, A.imageno asc                        ';
    end
    else if (gsEkind = '직무역량') then
    begin
      ParamVariant := '  SELECT nvl(to_char(ITEMNO  ),''0'') ITEMNO, '+
                      '         NVL(SUBSTR(itemname,1, DECODE(ITEMNO, ''99'', 12, INSTR(itemname,''('')-3)) ,'' '') itemname,'+
                      '         SNUM, nvl(ITEMDESC ,'' '') ITEMDESC,  '+
                      '         ''''                                cscore,  '+
                      '         ''''                                dscore,  '+
                      '         ''''                                tscore,  '+
                      '         NVL(TO_CHAR(FLOOR(sscore)),'' '') sscore , '+
                      '         NVL(TO_CHAR(FLOOR(lascore)) ,'' '') lascore, '+
                      '         NVL(OBJYN,''N''), OBJSAYU, OBJOPINION, OBJOPINION2 from (   '+
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

  end;
  with DataModule_Tmax.TMaxDataSet_HInsa do
  begin
    Close;
    SQL.Clear;
    ServiceName := 'PET1020A_seld';
    ClearFieldInfo;
    ClearParamInfo;
    AddField('ITEMNO'     , ftString  ,    2 );
    AddField('ITEMNAME'   , ftString  ,   50 );
    AddField('IMAGENO'    , ftString  ,    2 );
    AddField('IMAGEDESC'  , ftString  ,  600 );
    AddField('CSCORE'     , ftString  ,    3 );
    AddField('DSCORE'     , ftString  ,    3 );
    AddField('TSCORE'     , ftString  ,    3 );
    AddField('SSCORE'     , ftString  ,    3 );
    AddField('LASCORE'    , ftString  ,    3 );
    AddField('OBJYN'      , ftString  ,    1 );
    AddField('OBJSAYU'    , ftString  ,  200 );
    AddField('OBJOPINION1', ftString  ,  200 );
    AddField('OBJOPINION2', ftString  ,  200 );

    SQL.Text := ParamVariant;
    edit1.text :=  ParamVariant;
    Open;

    while not Eof do
    begin
      inc(i);
      SG_HiddenData.RowCount := i;
      SG_HiddenData.Cells[dITEM_IDX,       i-1] := FieldByName('itemno').AsString;   //항목번호
      SG_HiddenData.Cells[dITEMNAME_IDX,   i-1] := FieldByName('itemname').AsString; //항목명IntToStr(i)+'. '+
      SG_HiddenData.Cells[dIMAGE_IDX,      i-1] := FieldByName('imageno').AsString;  //이미지번호
      SG_HiddenData.Cells[dITEMDESC_IDX,   i-1] := FieldByName('imagedesc').AsString; //이미지내용

      SG_HiddenData.Cells[dCSCORE_IDX,     i-1] := FieldByName('cscore').AsString;     //동료평가점수
      SG_HiddenData.Cells[dSSCORE_IDX,     i-1] := FieldByName('sscore').AsString;     //자기평가점수
      SG_HiddenData.Cells[dSCORE_IDX,      i-1] := FieldByName('lascore').AsString;    //점수
      SG_HiddenData.Cells[dTMPSCORE_IDX,   i-1] := FieldByName('lascore').AsString;    //점수
      SG_HiddenData.Cells[dMODIFIED_IDX,   i-1] := 'N'; //변동여부

      SG_HiddenData.Cells[dOBJYN_IDX,      i-1] := FieldByName('OBJYN').AsString;       // 이의신청여부
      SG_HiddenData.Cells[dOBJSAYU_IDX,    i-1] := FieldByName('OBJSAYU').AsString;     // 피평가자이의신청내용
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

procedure TFDown_Sub1.ShowSum;
var
  i, j, k, l, m, n, o, p: Integer;
begin
  i := 0; j := 0; k := 0; l := 0; m := 0; n := 0; o := 0; p := 0;

  for i := 0 to SG_HiddenData.RowCount -1 do
  begin
    if (SG_HiddenData.Cells[dTMPSCORE_IDX, i] = '0') or
       (SG_HiddenData.Cells[dTMPSCORE_IDX, i] = '') then
      inc(k)                                                      //1차 미실시
    else
    begin
      inc(j);                                                     //1차 평가
      l := l + StrToInt(SG_HiddenData.Cells[dTMPSCORE_IDX, i]);   //1차 점수
    end;
    m := M + StrToIntdef(SG_HiddenData.Cells[dSSCORE_IDX, i], 0 );//자기평가합
    n := N + StrToIntdef(SG_HiddenData.Cells[dCSCORE_IDX, i], 0 );//동료평가합
  end;

  if (SG_HiddenData.RowCount = 1) and (SG_HiddenData.Cells[0,0] = '') then
  begin
    i := 0; j := 0; k := 0; l := 0;
  end;

  L_Total.Caption := IntToStr(j+k);
  L_Yes.Caption   := IntToStr(j);
end;

procedure TFDown_Sub1.ShowImage;
var
  i, j : Integer;
begin
  SG_Image.RowCount := 1;
  for i := 0 to SG_Image.ColCount - 1 do
    for j := 0 to SG_Image.RowCount -1 do
      SG_Image.Cells[i, j] := '';

  SG_Score.RowCount := 1;
  for i := 0 to SG_Score.ColCount - 1 do
    for j := 0 to SG_Score.RowCount -1 do
      SG_Image.Cells[i, j] := '';

  // SG_Image의 이미지 내용을 보여주고
  SG_HiddenData.Tag := -1;

  if SG_HiddenData.Cells[0,0] = '' then
  begin
    MessageBox(handle,'등록된 항목이 하나도 없습니다','확 인', MB_OK or $0030 );
    P_ControlButton.Visible := False;
    screen.Cursor := crDefault;
    Exit;
  end;

  for i := 0 to SG_HiddenData.RowCount -1 do
  begin
   // if SG_HiddenData.Cells[dITEM_IDX, i] = asItemNum then
    begin
      if SG_HiddenData.Tag = -1 then  SG_HiddenData.Tag := i;
      if SG_Image.Cells[0,0] <> '' then
      begin
        SG_Image.RowCount := SG_Image.RowCount + 1;
        SG_Score.RowCount := SG_Score.RowCount + 1;
      end;

      //이미지내용 넣기..
      SG_Image.Cells[mITEMDESC_IDX, SG_Image.RowCount-1] := SG_HiddenData.Cells[dITEMDESC_IDX, i];
      SG_Image.Cells[mITEMNAME_IDX, SG_Image.RowCount-1] := SG_HiddenData.Cells[dITEMNAME_IDX, i];

      SG_Score.Cells[dS_IDX , SG_Score.RowCount-1] := '';
      SG_Score.Cells[dA_IDX , SG_Score.RowCount-1] := '';
      SG_Score.Cells[dB_IDX , SG_Score.RowCount-1] := '';
      SG_Score.Cells[dC_IDX , SG_Score.RowCount-1] := '';
      SG_Score.Cells[dD_IDX , SG_Score.RowCount-1] := '';

      // 자기평가점수 보여주기
       SG_Image.Cells[2, SG_Image.RowCount -1] :='';  ///showmessage(SG_HiddenData.Cells[dSSCORE_IDX, i]);
           if SG_HiddenData.Cells[dSSCORE_IDX, i] = var_ScrS  then SG_Image.Cells[2, SG_Image.RowCount -1] := var_GrdS
      else if SG_HiddenData.Cells[dSSCORE_IDX, i] = var_ScrA  then SG_Image.Cells[2, SG_Image.RowCount -1] := var_GrdA
      else if SG_HiddenData.Cells[dSSCORE_IDX, i] = var_ScrB  then SG_Image.Cells[2, SG_Image.RowCount -1] := var_GrdB
      else if SG_HiddenData.Cells[dSSCORE_IDX, i] = var_ScrC  then SG_Image.Cells[2, SG_Image.RowCount -1] := var_GrdC
      else if SG_HiddenData.Cells[dSSCORE_IDX, i] = var_ScrD  then SG_Image.Cells[2, SG_Image.RowCount -1] := var_GrdD;

      // 이의신청내역
      SG_Image.Cells[3, SG_Image.RowCount-1] := SG_HiddenData.Cells[dOBJYN_IDX, i];

      // 상사1차
           if SG_HiddenData.Cells[dTMPSCORE_IDX, i] = var_ScrS  then SG_Score.Cells[dS_IDX , SG_Score.RowCount-1] := var_GrdS
      else if SG_HiddenData.Cells[dTMPSCORE_IDX, i] = var_ScrA  then SG_Score.Cells[dA_IDX , SG_Score.RowCount-1] := var_GrdA
      else if SG_HiddenData.Cells[dTMPSCORE_IDX, i] = var_ScrB  then SG_Score.Cells[dB_IDX , SG_Score.RowCount-1] := var_GrdB
      else if SG_HiddenData.Cells[dTMPSCORE_IDX, i] = var_ScrC  then SG_Score.Cells[dC_IDX , SG_Score.RowCount-1] := var_GrdC
      else if SG_HiddenData.Cells[dTMPSCORE_IDX, i] = var_ScrD  then SG_Score.Cells[dD_IDX , SG_Score.RowCount-1] := var_GrdD ;

    end;
  end;
  SG_Image.SetFocus;
end;

function TFDown_Sub1.SearchAndReplace(sSrc, sLookFor, sReplaceWith: string ): string;
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

function TFDown_Sub1.IsDataModified: Boolean;
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
end;

procedure TFDown_Sub1.OnlyVisible;
begin
  if ((gsEkind = '공통역량')   and (var_Able1 = 'Y')) or
     ((gsEkind = '리더십역량') and (var_Able2 = 'Y')) or
     ((gsEkind = '직무역량')   and (var_Able3 = 'Y')) then
  begin
    P_Info.Visible     := False;
    BB_save.Visible    := False;
    BB_Cancel.Visible  := False;
//    BB_confirm.Visible := False;
    M_Mark1.ReadOnly   := True;
    M_Mark2.ReadOnly   := True;
    M_Mark3.ReadOnly   := True;
  end else
  begin
    P_Info.Visible     := True;
    BB_save.Visible    := True;
    BB_Cancel.Visible  := True;
//    BB_confirm.Visible := True;
    M_Mark1.ReadOnly   := False;
    M_Mark2.ReadOnly   := False;
    M_Mark3.ReadOnly   := False;
  end;
end;

procedure TFDown_Sub1.Adjust_DropDownRows(CB_name: TComboBox);
begin
  if      CB_name.Items.Count < 5  then CB_name.DropDownCount := 5
  else if CB_name.Items.Count = 5  then CB_name.DropDownCount := 5 + 1
  else if CB_name.Items.Count = 20 then CB_name.DropDownCount := 20 + 1
  else if CB_name.Items.Count > 20 then CB_name.DropDownCount := 20
  else                                  CB_name.DropDownCount := CB_name.Items.Count + 1;
end;

{------------------------------버튼클릭---------------------------------}

procedure TFDown_Sub1.SubButtonClick(Sender: TObject);
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
  L_Total.Caption := '0';
  L_Yes.Caption   := '0';

  BB_CancelClick(Sender);
end;

procedure TFDown_Sub1.SB_YesNoClick(Sender: TObject);
var
  lsScore : String;
begin
  if SG_HiddenData.Tag = -1 then Exit;
  if gsEkind = '' then
  begin
    MessageDlg('공통/리더십/직무평가를 선택해 주십시오!', mtError, [mbOK], 0);
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

  //if TSpeedButton(Sender).Caption = 'YES' then  lsScore := '1'
  //else lsScore := '0';
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

    SG_Score.Cells[dS_IDX , SG_Image.Row] := '';
    SG_Score.Cells[dA_IDX , SG_Image.Row] := '';
    SG_Score.Cells[dB_IDX , SG_Image.Row] := '';
    SG_Score.Cells[dC_IDX , SG_Image.Row] := '';
    SG_Score.Cells[dD_IDX , SG_Image.Row] := '';

         if SB_S.Down  then SG_Score.Cells[dS_IDX , SG_Image.Row] := var_GrdS
    else if SB_A.Down  then SG_Score.Cells[dA_IDX , SG_Image.Row] := var_GrdA
    else if SB_B.Down  then SG_Score.Cells[dB_IDX , SG_Image.Row] := var_GrdB
    else if SB_C.Down  then SG_Score.Cells[dC_IDX , SG_Image.Row] := var_GrdC
    else                    SG_Score.Cells[dD_IDX , SG_Image.Row] := var_GrdD ; //if SB_D.Down

  end else
  begin
    SG_HiddenData.Cells[dTMPSCORE_IDX, SG_HiddenData.Tag+SG_Image.Row] := '';
    SG_HiddenData.Cells[dMODIFIED_IDX, SG_HiddenData.Tag+SG_Image.Row] := 'Y';

    SG_Score.Cells[dS_IDX , SG_Image.Row] := '';
    SG_Score.Cells[dA_IDX , SG_Image.Row] := '';
    SG_Score.Cells[dB_IDX , SG_Image.Row] := '';
    SG_Score.Cells[dC_IDX , SG_Image.Row] := '';
    SG_Score.Cells[dD_IDX , SG_Image.Row] := '';
  end;

  ShowSum;
end;

procedure TFDown_Sub1.BB_CancelClick(Sender: TObject);
begin
  Retrieve_Data;
  ShowImage;
end;

procedure TFDown_Sub1.DataSave(Sender: TObject);
var
  i, j, aiTotSrc, v_tmp : Integer;
  ParamVariant  : String;
  lsUpdateValue : String;
  TempScore     : String;
  lstBody       : TstringList;
  lsEmpName     : String;
begin
  SG_Image.SetFocus;
  if (var_Able1 = 'Y') and (gsEkind = '공통역량') then
  begin
    MessageBox(handle,'이미 평가가 완료된 자료는 수정할 수 없습니다.',
               '작업순서오류',MB_ICONWARNING);
    System.Exit;
  end;

  if (var_Able2 = 'Y') and (gsEkind = '리더십역량') then
  begin
    MessageBox(handle,'이미 평가가 완료된 자료는 수정할 수 없습니다.',
               '작업순서오류',MB_ICONWARNING);
    System.Exit;
  end;

  if (var_Able3 = 'Y') and (gsEkind = '직무역량') then
  begin
    MessageBox(handle,'이미 평가가 완료된 자료는 수정할 수 없습니다.',
               '작업순서오류',MB_ICONWARNING);
    System.Exit;
  end;

(*
  if Sender = BB_Save then
  begin
    if (Not IsDataModified) then
    begin
      MessageBox(handle,'수정한 자료가 없으므로 저장할 수 없습니다.', '작업순서오류',MB_ICONWARNING);
      System.Exit;
    end;
    for i := 0 to SG_HiddenData.RowCount -1 do
    begin
      if (SG_HiddenData.Cells[dTMPSCORE_IDX, i] = '') then
      begin
        MessageBox(handle,'아직 입력되지 않은 평가항목이 있습니다.  확인하세요','작업순서오류',MB_ICONWARNING);

        for j := 0 to SG_Image.RowCount -1 do
        begin
          if SG_HiddenData.Cells[dITEMDESC_IDX, i] = SG_Image.Cells[0,j] then
          begin
            SG_Image.Row := j;
            Break;
          end;
        end;
        System.Exit;
      end;
    end; //End of Loop..
*)
  Screen.Cursor := crHourGlass;

  ParamVariant := 'DELETE FROM pesdl ' +
                  ' WHERE rabasdate = '''+sRabasdate+''' ' +
                  '   AND empno     = '''+var_empno+'''    ' +
                  '   AND ekind     = '''+gsEkind+'''   ' ;

  DataModule_Tmax.Cupd_SQL := ParamVariant;
  DataModule_Tmax.Cupd_Exec;
  if not DataModule_Tmax.Cupd_ret then
  begin
    Exit;
  end;

  for i := 0 to SG_HiddenData.RowCount -1 do
  begin
          ParamVariant := 'INSERT INTO pesdl ' +
                          '    (rabasdate, empno,   eempno, ekind, ' +
                          '     itemno,    imageno, score)         ' +
                          ' VALUES('''+sRabasdate+''', '+
                          '        '''+var_empno+''',    '+
                          '        '''+Pempno+''',    '+
                          '        '''+gsEkind+''',   ' +
                          '        '+SG_HiddenData.Cells[dITEM_IDX,  i]+',    '+
                          '        '+SG_HiddenData.Cells[dIMAGE_IDX, i]+',    '+
                          '        '+SG_HiddenData.Cells[dTMPSCORE_IDX, i]+') ';

          DataModule_Tmax.Cupd_SQL := ParamVariant;
          DataModule_Tmax.Cupd_Exec;
          if not DataModule_Tmax.Cupd_ret then
          begin
               Exit;
          end;
  end; //End of Loop..

  Screen.Cursor :=  crDefault;

  //점수 저장후에 임시점수---> 점수,  변동여부 ---> 'N'
  aiTotSrc := 0;
  for i := 0 to SG_HiddenData.RowCount -1 do
  begin
    if SG_HiddenData.Cells[dTMPSCORE_IDX, i] = '1' then
      Inc(aiTotSrc);

    SG_HiddenData.Cells[dSCORE_IDX, i] := SG_HiddenData.Cells[dTMPSCORE_IDX, i];
    SG_HiddenData.Cells[dMODIFIED_IDX, i] := 'N';
  end;

  lsUpdateValue := '';

  InUpMerit(var_empno);

  if Sender = BB_save then MessageDlg('입력하신 ['+gsEkind+'] 평가자료를 저장하였습니다.',mtInformation,[mbOk],0)
  else                     MessageDlg('입력하신 ['+gsEkind+'] 평가자료를 최종 완료하였습니다.', mtInformation,[mbOk],0);
end;

{------------------------------ㄱㅣ ㅌ ㅏ---------------------------------}
procedure TFDown_Sub1.BB_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TFDown_Sub1.SG_ImageDrawCell(Sender: TObject; Col, Row: Integer;
  Rect: TRect; State: TGridDrawState);
var
  lsBuffer : String;
  liLeft, liTop : Integer;
begin
  if gdSelected in State then
  begin
    SG_Image.Canvas.Brush.Color := $00CFFBFC;//$00FFE8D0;//$00FFF9EC;//$00CFFBFC;
    SG_Image.Canvas.Font.Color  := clBlack;
    SG_Image.Canvas.Font.Size   := 9;
  end;

  lsBuffer := SG_Image.Cells[Col, Row];
  SG_Image.Canvas.FillRect(Rect);

  if SG_Image.VisibleRowCount < SG_Image.RowCount then
    SG_Image.ColWidths[mSELFSCORE_IDX] := iWidth_SelfScore - 16
  else
    SG_Image.ColWidths[mSELFSCORE_IDX] := iWidth_SelfScore;
  if Col = 0 then
  begin
    Rect.Top := (((Rect.Bottom - Rect.Top) - SG_Image.Canvas.TextHeight(lsBuffer)) div 2) + Rect.Top;
    DrawText(SG_Image.Canvas.Handle, PChar(lsBuffer),
             StrLen(PChar(lsBuffer)), Rect, DT_Center or DT_WORDBREAK);
  end
  else if (Col = 2) or(Col = 3)or (Col = 4) then
  begin
    liLeft := (((Rect.Right - Rect.Left)
               - SG_Image.Canvas.TextWidth(lsBuffer)) div 2) + Rect.Left;
    liTop := (((Rect.Bottom - Rect.Top)
               - SG_Image.Canvas.TextHeight(lsBuffer)) div 2) + Rect.Top;
//    if gsSelfYn <> 'Y' then  lsBuffer := '';
//    SG_Image.Canvas.Font.Color := $008D8022;
    SG_Image.Canvas.Font.Style := [fsBold];
    SG_Image.Canvas.Font.Size  := 9;
    SG_Image.Canvas.TextOut(liLeft, liTop, lsBuffer);
  end
  else
  begin
    Rect.Top   := Rect.Top + 2; // 실제 Text가 그려지는 영역의 크기를 약간 줄인다
    Rect.Left  := Rect.Left + 2;
    Rect.Right := Rect.Right - 10;
    DrawText(SG_Image.Canvas.Handle, PChar(lsBuffer),
             StrLen(PChar(lsBuffer)), Rect, DT_LEFT or DT_WORDBREAK);
  end;

  // SG_HiddenData.Tag 에 현재 평가요소의 시작 index가 저장되어 있음
  if SG_HiddenData.Tag = -1 then System.Exit;
  if not SG_Image.Focused then // 포커스가 없을땐 버튼을 보여주지 않는다
    System.Exit;

  // 선택된 row가 화면에 보이게 위치를 바꾼다
  if SG_Image.Row < SG_Image.TopRow then // 현재 row 가 화면위에 있다
    SG_Image.Row := SG_Image.TopRow
  else if SG_Image.Row > (SG_Image.TopRow + SG_Image.VisibleRowCount-1) then // 현재 row 가 화면밑에 있다
    SG_Image.Row := SG_Image.TopRow + SG_Image.VisibleRowCount-1;

  SG_Score.TopRow := SG_Image.TopRow;
  SG_Score.Row    := SG_Image.Row;
  // 버튼의 top 위치를 계산
  P_ControlButton.Top := (SG_Image.Row - SG_Image.TopRow) *
                         (SG_Image.DefaultRowHeight + SG_Image.GridLineWidth) + 2;

  // 점수를 버튼에 반영
  SB_S.Down   := False;
  SB_A.Down   := False;
  SB_B.Down   := False;
  SB_C.Down   := False;
  SB_D.Down   := False;

  //버튼상태반영
       if SG_HiddenData.Cells[dTMPSCORE_IDX, SG_HiddenData.Tag + SG_Image.Row] = var_ScrS  then  SB_S.Down  := True
  else if SG_HiddenData.Cells[dTMPSCORE_IDX, SG_HiddenData.Tag + SG_Image.Row] = var_ScrA  then  SB_A.Down  := True
  else if SG_HiddenData.Cells[dTMPSCORE_IDX, SG_HiddenData.Tag + SG_Image.Row] = var_ScrB  then  SB_B.Down  := True
  else if SG_HiddenData.Cells[dTMPSCORE_IDX, SG_HiddenData.Tag + SG_Image.Row] = var_ScrC  then  SB_C.Down  := True
  else if SG_HiddenData.Cells[dTMPSCORE_IDX, SG_HiddenData.Tag + SG_Image.Row] = var_ScrD  then  SB_D.Down  := True;

  P_ControlButton.Visible := True;
end;

procedure TFDown_Sub1.SG_ImageExit(Sender: TObject);
begin
  P_ControlButton.Visible := False;
end;

procedure TFDown_Sub1.SG_ScoreDrawCell(Sender: TObject; Col, Row: Integer;
  Rect: TRect; State: TGridDrawState);
var
 liLeft   : integer;
 liTop    : integer;
 lsBuffer : String;

 i : Integer;
begin
  SG_Score.Canvas.Brush.Color := SG_Image.Color; ///$00F0FFFF;
  for i := 0 to SG_Score.ColCount -1 do
    if SG_Score.Cells[i, Row] <> '' then
    begin
      SG_Score.Canvas.Brush.Color := $00FFF9EC; //SG_Score.Font.Color;
      break;
    end;

  if CB_ShowClass.Checked then // 등급을 보이게...
    SG_Score.Canvas.Font.Color := SG_Image.Font.Color
  else
    SG_Score.Canvas.Font.Color := SG_Score.Font.Color;

  SG_Score.Canvas.FillRect(Rect); // cell의 영역을 그린다
  lsBuffer := SG_Score.Cells[Col, Row];
  liLeft := (((Rect.Right - Rect.Left)
            - SG_Score.Canvas.TextWidth(lsBuffer)) div 2) + Rect.Left;
  liTop  := (((Rect.Bottom - Rect.Top)
             - SG_Score.Canvas.TextHeight(lsBuffer)) div 2) + Rect.Top;
  SG_Score.Canvas.TextOut(liLeft, liTop, lsBuffer);
end;

procedure TFDown_Sub1.SG_ScoreEnter(Sender: TObject);
begin
  SG_Image.SetFocus;
end;

procedure TFDown_Sub1.CB_ShowClassClick(Sender: TObject);
begin
  SG_Score.Refresh;
end;

procedure TFDown_Sub1.SG_ImageKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_UP) and (SG_Image.Row = 0) then
  begin
    // 맨위 항목에서 위쪽 화살표 키이면 이전 요소의 마지막 항목으호 이동
    ShowImage;
    SG_Image.Row := SG_Image.RowCount-1;
    Key := VK_ESCAPE;
  end else
  if (Key = VK_DOWN) and (SG_Image.Row = SG_Image.RowCount-1)  then
  begin
    // 맨아래 항목에서 아래쪽 화살표 키이면 다음 요소의 첫번째 항목으호 이동
    ShowImage;
    SG_Image.Row := 0;
    Key := VK_ESCAPE;
  end;
end;

procedure TFDown_Sub1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if (BB_Save.Visible) and (IsDataModified) then
  begin
       MessageBox(handle,'변동된 자료가 있으므로 먼저 저장후 작업을 진행하시기 바랍니다.','작업순서오류',MB_ICONWARNING);
       CanClose := False;
       System.Exit;
  end;
  CanClose := True;
end;

procedure TFDown_Sub1.SB_ScoreClick(Sender: TObject);
begin
  FM_Marks := TFM_Marks.Create(Application);
  try
    FM_Marks.Tag := 1;
    FM_Marks.ShowModal;
  finally
    FM_Marks.Free;
  end;
end;

procedure TFDown_Sub1.SG_ImageSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
    if OpenForm = 1 then
    begin
         if SG_Image.Cells[4, ARow] = 'Y' then
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
             FM_Main.Bt_Add.Caption      := '평가소견 열람';
             FM_Main.Bt_OConfirm.Enabled := False;
           end;

         end
         else
         if SG_Image.Cells[4, ARow] = 'N' then
         begin
           FM_Main.Bt_Add.Visible      := False;
           FM_Main.Bt_OConfirm.Visible := False;
         end;
    end
    else
    if OpenForm = 2 then
    begin
         if SG_Image.Cells[4, ARow] = 'Y' then
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
           vSelectdRow  := ARow;

           if ( (Lwork = '1차') and (FM_Main.v_e1opinionyn = 'Y') ) or  ( (Lwork = '2차') and (FM_Main.v_e2opinionyn = 'Y') ) then
           begin
             FM_Main.Bt_Add.Caption      := '평가소견 열람';
             FM_Main.Bt_OConfirm.Visible := False;
           end;
                      
         end
         else if SG_Image.Cells[4, ARow] = 'N' then
         begin
           FM_Main2.Bt_Add.Visible      := False;
           FM_Main2.Bt_OConfirm.Enabled := False;
         end;
    end;
end;

procedure TFDown_Sub1.InUpMerit(Parameter: String);
var SqlText, JobMode : String;
begin
  //평가 장점/단점 서술형 입력 테이블 생성할것.
  with TDS1 do
  begin
    ServiceName := 'HINSA_select';
    Close;
    Sql.Clear;

    SqlText :=  'SELECT empno,''field2'', ''field3'', ''field4'',''field5''  '+
                '  FROM PEHREMER  '+
                ' where rabasdate  = ''' + sRabasdate +''' ' +
                '   AND empno      = ''' + Parameter  +''' ' ;

    ClearFieldInfo;
    AddField('empno'  ,ftString, 100);
    AddField('field2' ,ftString, 100);
    AddField('field3' ,ftString, 100);
    AddField('field4' ,ftString, 100);
    AddField('field5' ,ftString, 100);
    SQL.Text := SqlText;
    Open;

    if  ( TDS1.RecordCount < 1 )  then JobMode :='I'
    else                               JobMode :='U';
  end;

  if JobMode = 'I' then
  begin
    if      (gsEkind = '공통역량')  Then
    Begin
      SQLText:= 'INSERT INTO PEHREMER                  ' +
                '   (RABASDATE, EMPNO,     MERIT_JCY,  ' +
                '    MERIT_JCN, WRITEEMP,  WRITETIME)  ' +
                '  VALUES                              ' +
                '   ('''+ sRabasdate        +''',       ' +
                '    '''+ Parameter        +''',       ' +
                '    '''+ OM_Merit_C1.Text +''',       ' +
                '    '''+ OM_Merit_C2.Text +''',       ' +
                '    '''+ var_empno  +''',       ' +
                '  TO_CHAR(SYSDATE,''YYYYMMDDHH24MI'') ' +
                '   ) ';
    End
    Else if (gsEkind = '리더십역량') Then
    Begin
      SQLText:= 'INSERT INTO PEHREMER                  ' +
                '   (RABASDATE, EMPNO,     MERIT_JRY,  ' +
                '    MERIT_JRN, WRITEEMP,  WRITETIME)  ' +
                '  VALUES                              ' +
                '   ('''+ sRabasdate        +''',       ' +
                '    '''+ Parameter        +''',       ' +
                '    '''+ OM_Merit_C1.Text +''',       ' +
                '    '''+ OM_Merit_C2.Text +''',       ' +
                '    '''+ var_empno  +''',       ' +
                '  TO_CHAR(SYSDATE,''YYYYMMDDHH24MI'') ' +
                '   ) ';
    End
    Else if (gsEkind = '직무역량') Then
    Begin
      SQLText:= 'INSERT INTO PEHREMER                  ' +
                '   (RABASDATE, EMPNO,     MERIT_JAY,  ' +
                '    MERIT_JAN, WRITEEMP,  WRITETIME)  ' +
                '  VALUES                              ' +
                '   ('''+ sRabasdate        +''',       ' +
                '    '''+ Parameter        +''',       ' +
                '    '''+ OM_Merit_C1.Text +''',       ' +
                '    '''+ OM_Merit_C2.Text +''',       ' +
                '    '''+ var_empno  +''',       ' +
                '  TO_CHAR(SYSDATE,''YYYYMMDDHH24MI'') ' +
                '   ) ';
    End;
  end
  Else
  Begin
    if      (gsEkind = '공통역량')  Then
    Begin
      SQLText := Format(
                'UPDATE PEHREMER SET ' +
                '       MERIT_JCY = '''+OM_Merit_C1.Text+''', '+
                '       MERIT_JCN = '''+OM_Merit_C2.Text+''', '+
                '       WRITEEMP  = '''+var_empno +''', '+
                '       WRITETIME = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'') '+
                ' WHERE RABASDATE = ''%s'' '+
                '  AND  EMPNO     = ''%s'' ' ,
                [sRabasdate, Parameter]);
    End
    Else if (gsEkind = '리더십역량') Then
    Begin
      SQLText := Format(
                'UPDATE PEHREMER SET ' +
                '       MERIT_JRY = '''+OM_Merit_C1.Text+''', '+
                '       MERIT_JRN = '''+OM_Merit_C2.Text+''', '+
                '       WRITEEMP  = '''+var_empno +''', '+
                '       WRITETIME = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'') '+
                ' WHERE RABASDATE = ''%s'' '+
                '  AND  EMPNO     = ''%s'' ' ,
                [sRabasdate, Parameter]);
    End
    Else if (gsEkind = '직무역량') Then
    Begin
      SQLText := Format(
                'UPDATE PEHREMER SET ' +
                '       MERIT_JAY = '''+OM_Merit_C1.Text+''', '+
                '       MERIT_JAN = '''+OM_Merit_C2.Text+''', '+
                '       WRITEEMP  = '''+var_empno +''', '+
                '       WRITETIME = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'') '+
                ' WHERE RABASDATE = ''%s'' '+
                '  AND  EMPNO     = ''%s'' ' ,
                [sRabasdate, Parameter]);
    End;
  End;

  TDml.Close;
  TDml.Sql.Clear;
  TDml.Sql.Text := SQLText;
  TDml.ServiceName := 'PIT1030A_DML';

  if NOT TDml.Execute then
  Begin
    MessageDlg('저장 작업 중 에러가 발생하였습니다.'+#13 +
               '관리자에게 문의하십시오..' ,mtError,[mbOK],0);
    System.Exit;
  End;
end;

end.

