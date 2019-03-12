unit UColForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, Buttons, ExtCtrls, DBGrids, Db, DBClient, peoutlookbtn,
  PeJeonVertLabel, PeJeonLabel, ComCtrls, pegradpanl, OnEditBaseCtrl,
  OnEditStdCtrl, OnEditMemo, OnSkinBtn, OnLineLabel, OnScheme,
  Tmax_DataSetText, OnFocusButton;

type
  TColForm = class(TForm)
    Panel3: TPanel;
    SB_0: TOnSkinButton;
    SB_2: TOnSkinButton;
    L_eempno: TLabel;
    Label2: TLabel;
    CB_empno2: TLabel;
    L_payraname2: TLabel;
    SB_3: TOnSkinButton;
    SB_1: TOnSkinButton;
    E_Focus: TEdit;
    Notebook1: TNotebook;
    Pn_2: TPanel;
    BB_Save0: TPeJeonOutLookBtn;
    P_Info: TPeJeonLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Bevel1: TBevel;
    Panel2: TPanel;
    SG_Image01: TStringGrid;
    SG_HiddenData01: TStringGrid;
    Panel10: TPanel;
    SG_ItemImage01: TStringGrid;
    Panel12: TPanel;
    OM_Merit_V2: TOnMemo;
    OnMemo3: TOnMemo;
    OM_Merit_V1: TOnMemo;
    OnMemo5: TOnMemo;
    Panel4: TPanel;
    BB_Save: TPeJeonOutLookBtn;
    SG_HiddenData: TStringGrid;
    Panel5: TPanel;
    Lb1: TLabel;
    SG_Image: TStringGrid;
    Panel8: TPanel;
    OnMemo6: TOnMemo;
    OM_Merit_C1: TOnMemo;
    OM_Merit_C2: TOnMemo;
    OnMemo2: TOnMemo;
    PageControl2: TPageControl;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    OM_Merit_O1: TOnMemo;
    OnMemo4: TOnMemo;
    OnMemo7: TOnMemo;
    OM_Merit_O2: TOnMemo;
    Panel1: TPanel;
    Label3: TLabel;
    Label6: TLabel;
    OnFocusButton1: TOnFocusButton;
    TDS1: TTMaxDataSet;
    TDml: TTMaxDataSet;
    SF_Main: TOnSchemeForm;
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    Bt_exit: TOnFocusButton;
    Bt_Confirm: TOnFocusButton;
    procedure SG_ImageDrawCell(Sender: TObject; Col, Row: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SG_ScoreEnter(Sender: TObject);
    procedure CB_ShowClass01Click(Sender: TObject);
    procedure SB_YesNoClick(Sender: TObject);
    procedure DataSave(Sender: TObject);
    procedure SG_ImageKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure CB_empnoChange(Sender: TObject);
    procedure PageControl2Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Bt_exitClick(Sender: TObject);
    procedure Bt_ConfirmClick(Sender: TObject);
    procedure B_HpersonClick(Sender: TObject);
    procedure BB_Cancel1Click(Sender: TObject);
    procedure SB_0Click(Sender: TObject);
    procedure SB_S01Click(Sender: TObject);
    procedure SG_Score01Enter(Sender: TObject);
    procedure SG_Image01DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SG_Image01KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PageControl1Change(Sender: TObject);
    procedure SG_ItemImage01DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
  private
    { Private declarations }
    function  SearchAndReplace(sSrc, sLookFor, sReplaceWith: string): string;
    procedure Adjust_DropDownRows(CB_name: TComboBox);
    procedure Serch;
//    function  FL_CheckNullMERIT:Boolean; // 장단점 미입력 항목이 있는지 여부 체크
    function FL_CheckNullMERIT(chk : Integer):Boolean;

  public
    { Public declarations }
    vSysdate    : String; // system 날자
    vRabasdate  : String; // 현 평가 기준일
    var_Ekind   : String;   // VALUE, 공통역량, 리더십역량, 직무역량
    var_sscore, var_dscore: Real;
    empno     : String;   // 피평가자 사번
    Pevcno    : String;   // 평가표 번호
    Ppaycl    : string;
    Ppayraname : string;
    Pempno,
    Pkorname,
    Password,
    Ppermission,
    gubun,
    kname: string;
    Ljobkind   : string;
    LMerit     : string;
    LdeMerit   : string;
    GsDeptcode : String;
    ON_Confirm : Boolean;
    empno_brchseqno, empno_itemseqno: Integer; // 현재 선택한 피평가자의 첫번째 요소/항목 번호
    SelForm: TForm;

    procedure Retrieve_Data;
    procedure ShowImage;
    procedure ShowImage01;
    procedure Read_item;
    procedure Read_item01;
    procedure OnlyVisible;
    procedure MakeVisible;
  end;

const
  // SG_HiddenData 의 index
  dITEMNO_IDX   = 0; // 평가항목번호
  dITEMNAME_IDX = 1; // 평가항목명
  dITEMDESC_IDX = 2; // 평가세부항목명
  dIMAGENO_IDX  = 3; // 평가이미지번호
  dIMAGEDESC_IDX= 4; // 평가이미지내용
  dSCORE_IDX    = 5; // 평가점수
  dMODIFIED_IDX = 6; // 자료변동여부
  dISNEW_IDX    = 7; // 테이블에 없는 레코드 여부(Y,N)

  // SG_Image 의 index
  mITEMNAME_IDX = 0;
  mITEMDESC_IDX = 1; // 평가이미지내용

  WIDTH_SGIMAGE_COL1  = 115;
  WIDTH_SGIMAGE_COL01 = 90;

  // SG_ItemImage 의 index
  iIMAGENAME_IDX = 0; // 항목명
  iIMAGEDESC_IDX = 1; // 항목내용
  iIMAGEBIGO_IDX = 2; // 항목비고
var
  ColForm: TColForm;

implementation
{$R *.DFM}
uses
  Hinsa_TmaxDM, UHperson, UUPMain;

{------------------------------- Main ----------------------------------}
procedure TColForm.FormShow(Sender: TObject);
var
  ParamVariant: String;
  CompIp: String;
  iy, ix : Integer;
  TempMemo: String;
begin
  Application.ProcessMessages;

  L_eempno.Caption  := Pkorname+' 님이 평가하실 대상은';
  CB_empno2.Caption := kname;
//  L_payraname2.Caption := ' ' + Ppayraname+ ' 입니다.';
  self.empno        := empno;

// 피평가자의 평가표 번호 읽기
  ParamVariant := 'SELECT nvl(a.empno   ,'' '') || '';'' || '+
                  '       nvl(b.korname ,'' '') || '';'' || '+
                  '       nvl(b.paycl   ,'' '') || '';'' || '+
                  '       nvl(to_char(b.evcno ),''0'')      '+
                  '  FROM pesmcs a, pehamas b               '+
                  ' WHERE a.rabasdate = '''+vRabasdate+'''  '+
                  '   AND a.eempno    = '''+Pempno+'''      '+ // 평가자사번(접속사번)
                  '   AND a.empno     = '''+empno+'''       '+ // 피평가자사번
                  '   AND a.rabasdate = b.rabasdate         '+
                  '   AND a.empno     = b.empno             '+
                  '   AND b.cyn       = ''Y''               '+
                  ' ORDER BY a.empno                        ';

  DataModule_Tmax.Csel_SQL := ParamVariant;
  DataModule_Tmax.Csel_Open;

  if not DataModule_Tmax.Csel_ret then
  begin
    MessageBox(handle,'평가 대상자를 선택하세요.','대상자오류',MB_ICONWARNING);
    System.Exit;
//    PostMessage(application.Handle, WM_CLOSE, 0, 0);
  end;
  //평가표 번호...
  Pevcno  := DataModule_Tmax.Csel_gfd(4);
  Ppaycl  := DataModule_Tmax.Csel_gfd(3);

  SB_0Click(SB_1);
  E_Focus.SetFocus;
end;

procedure TColForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
end;

{------------------------------- USER FUNCTION ----------------------------------}
procedure TColForm.Retrieve_Data;
var
  ParamVariant: String;
  i, j : Integer;
begin
  Application.ProcessMessages;

  ParamVariant := 'SELECT nvl( valconyn ,'' '') || '';'' || '+
                  '       nvl( abconyn  ,'' '') || '';'' || '+
                  '       nvl( beconyn  ,'' '') || '';'' || '+
                  '       nvl( duconyn  ,'' '') || '';'' || '+
                  '       nvl( merit    ,'' '') || '';'' || '+
                  '       nvl( demerit  ,'' '') || '';'' || '+
                  '       nvl( deptcode ,'' '')             '+
                  '  FROM pesmcs                            '+
                  ' WHERE rabasdate = '''+vRabasdate+'''    '+
                  '   AND empno     = '''+empno+'''         '+
                  '   AND eempno    = '''+Pempno+'''        ';

  DataModule_Tmax.Csel_SQL := ParamVariant;
  DataModule_Tmax.Csel_Open;

  Lmerit     := trim(DataModule_Tmax.Csel_gfd(5));
  LDemerit   := trim(DataModule_Tmax.Csel_gfd(6));
  GsDeptcode := trim(DataModule_Tmax.Csel_gfd(7));

  if      (var_Ekind = 'Values')     and (DataModule_Tmax.Csel_gfd(1) = 'Y') then // Values평가확인
       OnlyVisible
  else if (var_Ekind = '공통역량')   and (DataModule_Tmax.Csel_gfd(2) = 'Y') then // 공통역량평가확인
       OnlyVisible
  else if (var_Ekind = '리더십역량') and (DataModule_Tmax.Csel_gfd(3) = 'Y') then // 리더십역량평가확인
       OnlyVisible
  else if (var_Ekind = '직무역량')   and (DataModule_Tmax.Csel_gfd(4) = 'Y') then // 직무역량평가확인
       OnlyVisible
  else MakeVisible;

  if Pevcno = '1' then          //비보임차부장
  begin
     TabSheet1.tabvisible := true;
     //TabSheet2.tabvisible := true;
     TabSheet3.tabvisible := true;
     TabSheet4.tabvisible := true;
     TabSheet5.tabvisible := true;

  end else if Pevcno = '2' then //과장/대리/사원
  begin
     TabSheet1.tabvisible := true;
     //TabSheet2.tabvisible := true;
     TabSheet3.tabvisible := true;
     TabSheet4.tabvisible := false;
     TabSheet5.tabvisible := true;
  end else if Pevcno = '3' then //팀장
  begin
     TabSheet1.tabvisible := true;
     //TabSheet2.tabvisible := true;
     TabSheet3.tabvisible := true;
     TabSheet4.tabvisible := true;
     TabSheet5.tabvisible := false;
  end;
end;

procedure TColForm.Read_item;
var
  ParamVariant: String;
  i, j : Integer;
begin
  // SG_HiddenDate에 항목번호, 이미지번호, 이미지내용, 평가점수, 변경여부를 넣고
  for i := 0 to SG_HiddenData.ColCount - 1 do
    for j := SG_HiddenData.FixedRows to SG_HiddenData.RowCount -1 do
      SG_HiddenData.Cells[i, j] := '';
  SG_HiddenData.RowCount := SG_HiddenData.FixedRows+1;

  // 항목번호, 이미지번호,이미지내용, 평가점수
  if (var_Ekind = '공통역량')  or (var_Ekind = '리더십역량') then
  begin
    ParamVariant :=  'SELECT  '+
                     ' nvl(to_char(a.itemno         ),''0'') || '';'' || '+
                     ' nvl(        c.itemname        ,'' '') || '';'' || '+
                     ' nvl(        c.itemdesc        ,'' '') || '';'' || '+
                     ' nvl(to_char(a.imageno        ),''0'') || '';'' || '+
                     ' nvl(        a.imagedesc       ,'' '') || '';'' || '+
                     ' nvl(to_char(b.score          ),''0'') || '';'' || '+
                     ' nvl(        b.empno           ,'''')  '+
                     '  FROM pehacd a, pesdc b, pehac C       '+ // 능력태도평가표이미지, 능력태도평가
                     ' WHERE a.rabasdate = '''+vRabasdate+''' ' +
                     '   AND a.evcno     = '+Pevcno+' ' + // 평가표번호
                     '   AND a.paycl     = '''+Ppaycl+'''     ' +  //BAND
                     '   AND a.ekind     = '''+var_Ekind+''' ' + // 평가구분
                     '   AND a.rabasdate = c.rabasdate ' +
                     '   AND a.evcno     = c.evcno     ' + // 평가표번호
                     '   AND a.paycl     = c.paycl     ' +
                     '   AND a.ekind     = c.ekind     ' +
                     '   AND a.itemno    = c.itemno    ' +
                     '   AND a.rabasdate = b.rabasdate(+) ' +
                     '   AND a.ekind     = b.ekind(+) ' +
                     '   AND b.empno(+)  = '''+empno+''' ' + // 피평가자사번
                     '   AND b.eempno(+) = '''+Pempno+''' '+ // 평가자사번(접속사번)
                     '   AND a.itemno    = b.itemno(+) ' +
                     '   AND a.imageno   = b.imageno(+) ' +
                     '   ORDER BY a.itemno, a.imageno ';
   end
   else if (var_Ekind = '직무역량') then
   begin
      ParamVariant := '  SELECT nvl(to_char(ITEMNO  ),''0'') || '';'' ||  '+
                      '         NVL(SUBSTR(itemname,1, DECODE(ITEMNO, ''99'', 12, INSTR(itemname,''('')-3)),'' '') || '';'' ||  '+
                      '         nvl(       ITEMDESC ,'' '') || '';'' ||  '+
                      '         nvl(to_char(SNUM    ),''0'') || '';'' ||  '+
                      '         nvl(       ITEMDESC ,'' '') || '';'' ||  '+
                      '         nvl(to_char(SCORE   ),''0'') || '';'' ||  '+
                      '         nvl(        empno    ,'' '')  from (  '+
//                      '         nvl(        jobkindname   ,'' '') from (  '+
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
                      '        (SELECT EMPNO FROM PESDS WHERE RABASDATE = A.RABASDATE AND EMPNO = A.EMPNO AND ITEMNO = A.ITEMNO AND ekind = '''+var_Ekind+''') EMPNO, ' +
                      '        (SELECT SCORE FROM PESDS WHERE RABASDATE = A.RABASDATE AND EMPNO = A.EMPNO AND ITEMNO = A.ITEMNO AND ekind = '''+var_Ekind+''') SCORE ' +
                      ' FROM PEDUCEMP A ' +
                      ' WHERE A.RABASDATE = '''+vRabasdate+''' ' +
                      '   AND A.DEPTCODE  = '''+GsDeptcode+''' ' +
                      '   AND A.EMPNO     = '''+empno+''' ' +
                      ' ORDER BY SNUM) ' ;
   end;

  DataModule_Tmax.Csel_SQL := ParamVariant;
  DataModule_Tmax.Csel_Open;

  while not DataModule_Tmax.TMaxDataSet_HInsa.EOF do
  begin
    if SG_HiddenData.Cells[dITEMNO_IDX, SG_HiddenData.RowCount-1] <> '' then
      SG_HiddenData.RowCount := SG_HiddenData.RowCount + 1;

    SG_HiddenData.Cells[dITEMNO_IDX,   SG_HiddenData.RowCount-1] := DataModule_Tmax.Csel_gfd(1); // 평가항목번호
    SG_HiddenData.Cells[dITEMNAME_IDX, SG_HiddenData.RowCount-1] := DataModule_Tmax.Csel_gfd(2); // 평가항목명
    SG_HiddenData.Cells[dITEMDESC_IDX, SG_HiddenData.RowCount-1] := DataModule_Tmax.Csel_gfd(3); // 평가세부항목명
    SG_HiddenData.Cells[dIMAGENO_IDX,  SG_HiddenData.RowCount-1] := DataModule_Tmax.Csel_gfd(4); // 평가이미지번호
    SG_HiddenData.Cells[dIMAGEDESC_IDX,SG_HiddenData.RowCount-1] := DataModule_Tmax.Csel_gfd(5); // 평가이미지내용
    SG_HiddenData.Cells[dSCORE_IDX,    SG_HiddenData.RowCount-1] := DataModule_Tmax.Csel_gfd(6); // 평가점수

    if DataModule_Tmax.Csel_gfd(7) = '' then
      SG_HiddenData.Cells[dISNEW_IDX, SG_HiddenData.RowCount-1] := 'Y' // 테이블에 없는 레코드
    else
      SG_HiddenData.Cells[dISNEW_IDX, SG_HiddenData.RowCount-1] := 'N';

    SG_HiddenData.Cells[dMODIFIED_IDX, SG_HiddenData.RowCount-1] := 'N'; // 자료 변동 여부
    DataModule_Tmax.TMaxDataSet_HInsa.Next;
  end;

  with TDS1 do
  begin
    ServiceName := 'HINSA_select3';
    Close;
    Sql.Clear;

    if      (var_Ekind = '공통역량')  Then
    Begin
      Lb1.Visible      := False;
      ParamVariant := ' SELECT MERIT_ECY field1, MERIT_ECN field2, ''field3'', ''field4'',''field5''  '+
                      '  FROM PESMCS  ';
    End
    Else if (var_Ekind = '리더십역량') Then
    Begin
      Lb1.Visible      := False;
      ParamVariant := ' SELECT MERIT_ERY field1, MERIT_ERN field2, ''field3'', ''field4'',''field5''  '+
                      '  FROM PESMCS  ';
    End
    Else if (var_Ekind = '직무역량') Then
    Begin
      Lb1.Visible      := True;
      ParamVariant := ' SELECT MERIT_EAY field1, MERIT_EAN field2, ''field3'', ''field4'',''field5''  '+
                      '  FROM PESMCS  ';
    End;

    ParamVariant := ParamVariant + ' where rabasdate = '''+vRabasdate +''' ' +
                                   '   AND empno     = '''+empno+'''  '+
                                   '   AND eempno    = '''+Pempno+''' ';

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

End;

procedure TColForm.Read_item01;
var
  ParamVariant: String;
  i, j : Integer;
begin
  // 항목번호, 이미지번호,이미지내용
  ParamVariant := 'SELECT                                               '+
                  '       nvl(to_char(a.itemno     ),''0'') || '';'' || '+
                  '       nvl(        a.imagename   ,'' '') || '';'' || '+
                  '       nvl(        a.imageno,     ''0'') || '';'' || '+
                  '       nvl(        a.imagedesc   ,'' '') || '';'' || '+
                  '       nvl(        a.imagebigo   ,'' '')             '+
                  '  FROM pehacd a                                      '+ // 능력태도평가표이미지, 능력태도자기평가, 능력태도평가표항목
                  ' WHERE a.rabasdate = '''+vRabasdate+'''              '+
                  '   AND a.evcno     = '+Pevcno+'                      '+ // 평가표번호
                  '   AND a.ekind     = ''Values''                      '+ // 평가구분
                  '   AND a.paycl     = '''+Ppaycl  +'''                '+
                  '   ORDER BY a.itemno, a.imageno                      ';

  DataModule_Tmax.Csel_SQL := ParamVariant;
  DataModule_Tmax.Csel_Open;

  i:= 0;
  while not DataModule_Tmax.TMaxDataSet_HInsa.EOF do
  begin
       SG_ItemImage01.Cells[0,   i] := DataModule_Tmax.Csel_gfd(2); // 평가이미지명
       SG_ItemImage01.Cells[1,   i] := DataModule_Tmax.Csel_gfd(4); // 평가이미지내용
       //SG_ItemImage01.Cells[2,   i] := DataModule_Tmax.Csel_gfd(5); // 평가이미지비고

       i := i + 1;
       DataModule_Tmax.TMaxDataSet_HInsa.Next;
  end;

  // SG_HiddenDate에 항목번호, 이미지번호, 이미지내용, 평가점수, 변경여부를 넣고
  for i := 0 to SG_HiddenData01.ColCount - 1 do
    for j := SG_HiddenData01.FixedRows to SG_HiddenData01.RowCount -1 do
      SG_HiddenData01.Cells[i, j] := '';
  SG_HiddenData01.RowCount := SG_HiddenData01.FixedRows+1;

  // 항목번호, 이미지번호,이미지내용, 평가점수
  ParamVariant :=  'SELECT  '+
                   ' nvl(to_char(a.itemno         ),''0'') || '';'' || '+
                   ' nvl(        a.itemname        ,'' '') || '';'' || '+
                   ' nvl(        a.itemdesc        ,'' '') || '';'' || '+
                   ' nvl(        ''0''             ,''0'') || '';'' || '+
                   ' nvl(        a.itemdesc        ,'' '') || '';'' || '+
                   ' nvl(to_char(b.score          ),''0'') || '';'' || '+
                   ' nvl(        b.empno           ,'''')              '+
                   '  FROM pehac a, pesdc b                            '+ // 능력태도평가표이미지, 능력태도평가
                   ' WHERE a.rabasdate = '''+vRabasdate+'''            '+
                   '   AND a.evcno     = '+Pevcno+'                    '+ // 평가표번호
                   '   AND a.paycl     = '''+Ppaycl+'''                '+  //BAND
                   '   AND a.ekind     = ''Values''                    '+ // 평가구분
                   '   AND a.rabasdate = b.rabasdate(+)                '+
                   '   AND a.ekind     = b.ekind(+)                    '+
                   '   AND b.empno(+)  = '''+empno+'''                 '+ // 피평가자사번
                   '   AND b.eempno(+) = '''+Pempno+'''                '+ // 평가자사번(접속사번)
                   '   AND a.itemno    = b.itemno(+)                   '+
                   '   ORDER BY a.itemno                               ';

  DataModule_Tmax.Csel_SQL := ParamVariant;
  DataModule_Tmax.Csel_Open;

  while not DataModule_Tmax.TMaxDataSet_HInsa.EOF do
  begin
    if SG_HiddenData01.Cells[dITEMNO_IDX, SG_HiddenData01.RowCount-1] <> '' then
      SG_HiddenData01.RowCount := SG_HiddenData01.RowCount + 1;

    SG_HiddenData01.Cells[dITEMNO_IDX,    SG_HiddenData01.RowCount-1] :=  DataModule_Tmax.Csel_gfd(1); // 평가항목번호
    SG_HiddenData01.Cells[dITEMNAME_IDX,  SG_HiddenData01.RowCount-1] :=  DataModule_Tmax.Csel_gfd(2); // 평가항목명
    SG_HiddenData01.Cells[dITEMDESC_IDX,  SG_HiddenData01.RowCount-1] :=  DataModule_Tmax.Csel_gfd(3); // 평가세부항목명
    SG_HiddenData01.Cells[dIMAGENO_IDX,   SG_HiddenData01.RowCount-1] :=  DataModule_Tmax.Csel_gfd(4); // 평가이미지번호
    SG_HiddenData01.Cells[dIMAGEDESC_IDX, SG_HiddenData01.RowCount-1] :=  DataModule_Tmax.Csel_gfd(5); // 평가이미지내용
    SG_HiddenData01.Cells[dSCORE_IDX,     SG_HiddenData01.RowCount-1] :=  DataModule_Tmax.Csel_gfd(6); // 평가점수

    if DataModule_Tmax.Csel_gfd(7) = '' then
      SG_HiddenData01.Cells[dISNEW_IDX, SG_HiddenData01.RowCount-1] := 'Y' // 테이블에 없는 레코드
    else
      SG_HiddenData01.Cells[dISNEW_IDX, SG_HiddenData01.RowCount-1] := 'N';

    SG_HiddenData01.Cells[dMODIFIED_IDX, SG_HiddenData01.RowCount-1] := 'N'; // 자료 변동 여부
    DataModule_Tmax.TMaxDataSet_HInsa.Next;
  end;

  ParamVariant := ' SELECT MERIT_EVY|| '';'' ||MERIT_EVN '+
                  '  FROM PESMCS  '+
                  ' WHERE rabasdate = '''+vRabasdate+''' '+
                  '   AND empno     = '''+empno+'''      '+
                  '   AND eempno    = '''+Pempno+'''     ';

  DataModule_Tmax.Csel_SQL := ParamVariant;
  DataModule_Tmax.Csel_Open;

  OM_Merit_O1.Text := DataModule_Tmax.Csel_gfd(1);
  OM_Merit_O2.Text := DataModule_Tmax.Csel_gfd(2);
end;

procedure TColForm.ShowImage;
var
  i, j : Integer;
begin
  for i := 0 to SG_Image.ColCount - 1 do
    for j := 0 to SG_Image.RowCount -1 do
      SG_Image.Cells[i, j] := '';
  SG_Image.RowCount := SG_Image.FixedRows+1;

  // SG_Image의 이미지 내용을 보여주고
  SG_HiddenData.Tag := -1;
  for i := SG_HiddenData.FixedRows to SG_HiddenData.RowCount-1 do
  begin
    begin
      // SG_HiddenData.Tag 에 현재 평가항목의 시작 index 저장
      if SG_HiddenData.Tag = -1 then
        SG_HiddenData.Tag := i;

      if SG_Image.Cells[SG_Image.FixedCols, SG_Image.RowCount-1] <> '' then
      begin
        SG_Image.RowCount := SG_Image.RowCount + 1;
      end;

      // 이미지내용 넣기..
      SG_Image.Cells[mITEMNAME_IDX, SG_Image.RowCount-1] := SG_HiddenData.Cells[dITEMNAME_IDX, i];   //IntToStr(i + 1) + '. ' +
      SG_Image.Cells[mITEMDESC_IDX, SG_Image.RowCount-1] := SG_HiddenData.Cells[dITEMDESC_IDX, i];

    end;
  end;

  // SG_Image에 포크스를 준다
  SG_Image.SetFocus;
end;

procedure TColForm.ShowImage01;
var
  i, j : Integer;
begin
  for i := 0 to SG_Image01.ColCount - 1 do
    for j := 0 to SG_Image01.RowCount -1 do
      SG_Image01.Cells[i, j] := '';
  SG_Image01.RowCount := SG_Image01.FixedRows+1;

  // SG_Image의 이미지 내용을 보여주고
  SG_HiddenData01.Tag := -1;
  for i := SG_HiddenData01.FixedRows to SG_HiddenData01.RowCount-1 do
  begin
    begin
      // SG_HiddenData01.Tag 에 현재 평가항목의 시작 index 저장
      if SG_HiddenData01.Tag = -1 then
        SG_HiddenData01.Tag := i;

      if SG_Image01.Cells[SG_Image01.FixedCols, SG_Image01.RowCount-1] <> '' then
      begin
        SG_Image01.RowCount := SG_Image01.RowCount + 1;
      end;

      // 이미지내용 넣기..
      SG_Image01.Cells[mITEMNAME_IDX, SG_Image01.RowCount-1] := SG_HiddenData01.Cells[dITEMDESC_IDX, i];
    end;
  end;

  // SG_Image01에 포크스를 준다
  SG_Image01.SetFocus;
end;

procedure TColForm.OnlyVisible;
begin
  P_Info.Visible      := False;
  BB_save.Visible    := False;
end;

procedure TColForm.MakeVisible;
begin
  P_Info.Visible      := True;
  BB_save.Visible    := True;
end;

{------------------------------버튼클릭---------------------------------}
procedure TColForm.SB_YesNoClick(Sender: TObject);
var
  lsScore: String;
begin
  if SG_HiddenData.Tag = -1 then
    Exit;

  if var_Ekind = '' then
    System.Exit;

  if not BB_Save.Visible then
  begin
    MessageBox(handle,'평가실시기간이 아니거나 평가가 최종완료된 자료는 수정할 수 없습니다.','작업순서오류',MB_ICONWARNING);
    System.Exit;
  end;

  if TSpeedButton(Sender).Down = True then
  begin
    SG_HiddenData.Cells[dSCORE_IDX, SG_HiddenData.Tag+SG_Image.Row] := lsScore;
    SG_HiddenData.Cells[dMODIFIED_IDX, SG_HiddenData.Tag+SG_Image.Row] := 'Y';
  end else
  begin
    SG_HiddenData.Cells[dSCORE_IDX, SG_HiddenData.Tag+SG_Image.Row] := '0';
    SG_HiddenData.Cells[dMODIFIED_IDX, SG_HiddenData.Tag+SG_Image.Row] := 'Y';
  end;
end;

procedure TColForm.DataSave(Sender: TObject);
var
  SqlText, JobMode: String;
  Cnt    : Integer;
begin
  if Not FL_CheckNullMERIT(1) then Exit;

  SqlText := ' SELECT Count(EMPNO) cnt FROM PESMCS ' +
             ' WHERE rabasdate = '''+vRabasdate+''' ' +
             '   AND empno     = '''+empno +''' '+ // 피평가자
             '   AND eempno    = '''+Pempno+''' '; // 평가자(접속자사번)

  DataModule_Tmax.Csel_SQL := SqlText;
  DataModule_Tmax.Csel_Open;

  Cnt := StrToInt(DataModule_Tmax.Csel_gfd(1));

  if  (Cnt < 1 )  then JobMode :='I'
  else                 JobMode :='U';

  if JobMode = 'I' then
  begin
    MessageDlg('동료평가 기초자료자 존재하지 않습니다.'+#13 +
               '관리자에게 문의하십시오..' ,mtError,[mbOK],0);
    System.Exit;
  End
  Else
  Begin
    if      (var_Ekind = 'Values')     Then
    Begin
      SqlText := 'UPDATE PESMCS SET ' +
                 '       MERIT_EVY = '''+OM_Merit_V1.Text+''', '+
                 '       MERIT_EVN = '''+OM_Merit_V2.Text+''', '+
                 '       WRITEEMP  = '''+Pempno          +''', '+
                 '       WRITETIME = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'') '+
                 'WHERE rabasdate  = '''+vRabasdate+''' ' +
                 '  AND empno      = '''+empno+''' ' +
                 '  AND eempno     = '''+Pempno+''' ';
    End
    else if (var_Ekind = '공통역량')   Then
    Begin
      SqlText := 'UPDATE PESMCS SET ' +
                 '       MERIT_ECY = '''+OM_Merit_C1.Text+''', '+
                 '       MERIT_ECN = '''+OM_Merit_C2.Text+''', '+
                 '       WRITEEMP  = '''+Pempno          +''', '+
                 '       WRITETIME = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'') '+
                 'WHERE rabasdate  = '''+vRabasdate+''' ' +
                 '  AND empno      = '''+empno+''' ' +
                 '  AND eempno     = '''+Pempno+''' ';

    End
    else if (var_Ekind = '리더십역량') Then
    Begin
      SqlText := 'UPDATE PESMCS SET ' +
                 '       MERIT_ERY = '''+OM_Merit_C1.Text+''', '+
                 '       MERIT_ERN = '''+OM_Merit_C2.Text+''', '+
                 '       WRITEEMP  = '''+Pempno          +''', '+
                 '       WRITETIME = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'') '+
                 'WHERE rabasdate  = '''+vRabasdate+''' ' +
                 '  AND empno      = '''+empno+''' ' +
                 '  AND eempno     = '''+Pempno+''' ';

    End
    else if (var_Ekind = '직무역량')   Then
    Begin
      SqlText := 'UPDATE PESMCS SET ' +
                 '       MERIT_EAY = '''+OM_Merit_C1.Text+''', '+
                 '       MERIT_EAN = '''+OM_Merit_C2.Text+''', '+
                 '       WRITEEMP  = '''+Pempno          +''', '+
                 '       WRITETIME = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'') '+
                 'WHERE rabasdate  = '''+vRabasdate+''' ' +
                 '  AND empno      = '''+empno+''' ' +
                 '  AND eempno     = '''+Pempno+''' ';

    End
    else if (var_Ekind = '평가의견등록')   Then
    Begin
      SqlText := 'UPDATE PESMCS SET ' +
                 '       MERIT_EVY = '''+OM_Merit_O1.Text+''', '+
                 '       MERIT_EVN = '''+OM_Merit_O2.Text+''', '+
                 '       WRITEEMP  = '''+Pempno          +''', '+
                 '       WRITETIME = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'') '+
                 'WHERE rabasdate  = '''+vRabasdate+''' ' +
                 '  AND empno      = '''+empno+''' ' +
                 '  AND eempno     = '''+Pempno+''' ';

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
  end Else
  Begin
    MessageDlg('입력하신 평가자료를 저장하였습니다.',mtInformation,[mbOk],0);
  End;
end;

{------------------------------ Event ---------------------------------}
procedure TColForm.SG_ImageDrawCell(Sender: TObject; Col, Row: Integer;
  Rect: TRect; State: TGridDrawState);
var
  A: String;
begin
  if gdSelected in State then
  begin
    SG_Image.Canvas.Brush.Color :=$00FFE8D0;
    SG_Image.Canvas.Font.Color  := clBlack;
  end;

  SG_Image.Canvas.FillRect(Rect);
  SG_Image.ColWidths[mITEMNAME_IDX] := WIDTH_SGIMAGE_COL1;

  if SG_Image.VisibleRowCount < SG_Image.RowCount then
    SG_Image.ColWidths[mITEMDESC_IDX] := SG_Image.Width -  SG_Image.ColWidths[mITEMNAME_IDX] - 16
  else
    SG_Image.ColWidths[mITEMDESC_IDX] := SG_Image.Width -  SG_Image.ColWidths[mITEMNAME_IDX];

  Rect.Top   := Rect.Top + 2; // 실제 Text가 그려지는 영역의 크기를 약간 줄인다
  Rect.Left  := Rect.Left + 2;
  Rect.Right := Rect.Right - 2;
  if SG_Image.RowCount > (SG_Image.VisibleRowCount+SG_Image.FixedRows) then
    Rect.Right := Rect.Right - GetSystemMetrics(SM_CXVSCROLL); // scroll basr 크기만큼 줄인다

  A := SG_Image.Cells[Col, Row];
  DrawText(SG_Image.Canvas.Handle, PChar(A), StrLen(PChar(A)), Rect, DT_LEFT or DT_WORDBREAK);

  // SG_HiddenData.Tag 에 현재 평가요소의 시작 index가 저장되어 있음
  if SG_HiddenData.Tag = -1 then
    System.Exit;
  if not SG_Image.Focused then // 포커스가 없을땐 버튼을 보여주지 않는다
    System.Exit;

  // 선택된 row가 화면에 보이게 위치를 바꾼다
  if SG_Image.Row < SG_Image.TopRow then // 현재 row 가 화면위에 있다
    SG_Image.Row := SG_Image.TopRow
  else if SG_Image.Row > (SG_Image.TopRow + SG_Image.VisibleRowCount-1) then // 현재 row 가 화면밑에 있다
    SG_Image.Row := SG_Image.TopRow + SG_Image.VisibleRowCount-1;
end;

procedure TColForm.SG_ScoreEnter(Sender: TObject);
begin
  SG_Image.SetFocus;
end;

procedure TColForm.CB_ShowClass01Click(Sender: TObject);
begin
  if  Notebook1.ActivePage = 'P1' then
  begin
       if  PageControl1.ActivePage = TabSheet1 then
       begin
            SG_Image01.SetFocus;
       end;
  end
  else
  begin
       SG_Image.SetFocus;
  end;
end;

procedure TColForm.SG_ImageKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_UP) and
     (SG_Image.Row = 0)  then
  begin
    // 맨위 항목에서 위쪽 화살표 키이면 이전 요소의 마지막 항목으호 이동
    ShowImage;
    SG_Image.Row := SG_Image.RowCount-1;
    Key := VK_ESCAPE;
  end
  else if (Key = VK_DOWN) and
          (SG_Image.Row = SG_Image.RowCount-1) then
  begin
    // 맨아래 항목에서 아래쪽 화살표 키이면 다음 요소의 첫번째 항목으호 이동
    ShowImage;
    SG_Image.Row := 0;
    Key := VK_ESCAPE;
  end;
end;

procedure TColForm.CB_empnoChange(Sender: TObject);
begin
  Serch;
  BB_Cancel1Click(Sender);
end;

procedure TColForm.PageControl2Change(Sender: TObject);
begin
  if   PageControl2.ActivePage = TabSheet3 then
  begin
       BB_Save.Caption   := '공통 역량 저장';
  end
  else if  PageControl2.ActivePage = TabSheet4 then
  begin
       BB_Save.Caption   := '리더십역량 저장';
  end
  else if  PageControl2.ActivePage = TabSheet5 then
  begin
       BB_Save.Caption   := '직무 역량 저장';
  end;

  if      PageControl2.ActivePage = TabSheet3 then
  begin
    var_Ekind := '공통역량';
  end
  else if PageControl2.ActivePage = TabSheet4 then
  begin
    var_Ekind := '리더십역량';
  end
  else if PageControl2.ActivePage = TabSheet5 then
  begin
    var_Ekind := '직무역량';
  end;

  CB_empnoChange(nil);

end;
procedure TColForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := cafree;
end;

function TColForm.SearchAndReplace(sSrc, sLookFor, sReplaceWith: string ): string;
var
  nPos,
  nLenLookFor : integer;
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

procedure TColForm.Adjust_DropDownRows(CB_name: TComboBox);
begin
  if CB_name.Items.Count < 5 then
    CB_name.DropDownCount := 5
  else if CB_name.Items.Count = 5 then
    CB_name.DropDownCount := 5 + 1
  else if CB_name.Items.Count = 20 then
    CB_name.DropDownCount := 20 + 1
  else if CB_name.Items.Count > 20 then
    CB_name.DropDownCount := 20
  else
    CB_name.DropDownCount := CB_name.Items.Count + 1;
end;


procedure TColForm.Bt_exitClick(Sender: TObject);
begin
  FUPMain.Grid_Data;
  Bt_Exit.Hint := 'OK';
  if Bt_Exit.Hint = 'OK' then Close;
end;

procedure TColForm.Bt_ConfirmClick(Sender: TObject);
var
  A : Integer;
  Param   : OleVariant;
  ToMail,
  ParamVariant  : string;
  lstBody       : TstringList;
  PE_Down1,
  PE_Down2,
  PE_Down3,
  PE_Down4      : Boolean;
  i , j         : integer;

  function Temp_Update(var_Ekind : String) : Boolean;
  var
     ParamVariant : String;
  begin
    if var_Ekind = 'Values' then
      ParamVariant := 'UPDATE pesmcs SET valconyn = ''Y'' '
    else
    if var_Ekind = '공통역량' then
      ParamVariant := 'UPDATE pesmcs SET abconyn = ''Y'' '
    else
    if var_Ekind = '리더십역량' then
      ParamVariant := 'UPDATE pesmcs SET beconyn = ''Y'' '
    else
      ParamVariant := 'UPDATE pesmcs SET duconyn = ''Y'' ';

    ParamVariant := ParamVariant +
                    'WHERE rabasdate = '''+vRabasdate+''' ' +
                    '  AND empno     = '''+empno+''' ' + // 피평가자
                    '  AND eempno    = '''+Pempno+''' '; // 평가자(접속자사번)
    Result := True;

    DataModule_Tmax.Cupd_SQL := ParamVariant;
    DataModule_Tmax.Cupd_Exec;
    if not DataModule_Tmax.Cupd_ret then
    begin
      Messagedlg('APP-Server Error',mtError,[mbOK],0);
       Result := False;
      Exit;
    end;
  end;
begin
  if Not FL_CheckNullMERIT(2) then Exit;

  if MessageBox(handle,PChar('최종완료를 하시면 등록하신 내역을 수정하실 수 없습니다.'+#13+#13+
                             '등록하신 내역에 대해 모두 확인을 마치셨으면 최종완료를 하시기 바랍니다.'+#13+#13+
                             '최종완료를 하시겠습니까?'), '확 인', MB_YESNO or MB_DEFBUTTON2) <> IDYES then
  begin
    if TComponent(Sender).Name = 'Bt_Exit' then Bt_Exit.Hint := 'OK';
    system.Exit;
  end;

  if Pevcno = '1' then          //비보임차부장
  begin
    if Temp_Update('Values')     = false then Exit;
    if Temp_Update('공통역량')   = false then Exit;
    if Temp_Update('리더십역량') = false then Exit;
    if Temp_Update('직무역량')   = false then Exit;
  end else if Pevcno = '2' then //과장/대리/사원
  begin
    if Temp_Update('Values')     = false then Exit;
    if Temp_Update('공통역량')   = false then Exit;
    if Temp_Update('직무역량')   = false then Exit;
  end else if Pevcno = '3' then //팀장
  begin
    if Temp_Update('Values')     = false then Exit;
    if Temp_Update('공통역량')   = false then Exit;
    if Temp_Update('리더십역량') = false then Exit;
  end;

  MessageBox(handle,'동료평가가 완료되었습니다. 수고하셨습니다','작업완료',MB_ICONWARNING);
  PostMessage(Handle, WM_CLOSE, 0, 0);
  FUPMain.Grid_Data;
  ColForm.close;
end;

procedure TColForm.B_HpersonClick(Sender: TObject);
begin
  FHperson := TFHperson.Create(nil); // 동료평가
  FHperson.Show;
end;

procedure TColForm.BB_Cancel1Click(Sender: TObject);
begin
    Retrieve_Data;
end;

procedure TColForm.SB_0Click(Sender: TObject);
begin
  SB_1.BtnDown  := False;
  SB_2.BtnDown  := False;
  SB_3.BtnDown  := False;

  TOnSkinButton(Sender).BtnDown := True;
  NoteBook1.ActivePage := 'P' + IntToStr(TOnSkinButton(Sender).Tag);

  if      TOnSkinButton(Sender).Tag = 0 then  var_Ekind := '장점과보완'
  else if TOnSkinButton(Sender).Tag = 1 then  var_Ekind := 'Values'
  else if TOnSkinButton(Sender).Tag = 2 then  PageControl2Change(Sender)
  else if TOnSkinButton(Sender).Tag = 3 then  var_Ekind := '평가의견등록';
  Serch;
  BB_Cancel1Click(Sender);
end;

procedure TColForm.SB_S01Click(Sender: TObject);
var
  lsScore: String;
begin
  if SG_HiddenData01.Tag = -1 then
    Exit;

  if var_Ekind = '' then
    System.Exit;

  if not BB_Save0.Visible then
  begin
    MessageBox(handle,'평가실시기간이 아니거나 평가가 최종완료된 자료는 수정할 수 없습니다.','작업순서오류',MB_ICONWARNING);
    System.Exit;
  end;

  if TSpeedButton(Sender).Down = True then
  begin
    SG_HiddenData01.Cells[dSCORE_IDX, SG_HiddenData01.Tag+SG_Image01.Row] := lsScore;
    SG_HiddenData01.Cells[dMODIFIED_IDX, SG_HiddenData01.Tag+SG_Image01.Row] := 'Y';
  End;
end;

procedure TColForm.SG_Score01Enter(Sender: TObject);
begin
  SG_Image01.SetFocus;
end;

procedure TColForm.SG_Image01DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  A: String;
begin
  if gdSelected in State then
  begin
    SG_Image01.Canvas.Brush.Color :=$00FFE8D0;
    SG_Image01.Canvas.Font.Color  := clBlack;
  end;

  SG_Image01.Canvas.FillRect(Rect);

  SG_Image01.ColWidths[mITEMNAME_IDX] := WIDTH_SGIMAGE_COL01;

  Rect.Top   := Rect.Top + 44; // 실제 Text가 그려지는 영역의 크기를 약간 줄인다
  Rect.Left  := Rect.Left + 2;
  Rect.Right := Rect.Right - 2;
  if SG_Image01.RowCount > (SG_Image01.VisibleRowCount+SG_Image01.FixedRows) then
    Rect.Right := Rect.Right - GetSystemMetrics(SM_CXVSCROLL); // scroll basr 크기만큼 줄인다

  A := SG_Image01.Cells[ACol, ARow];
  DrawText(SG_Image01.Canvas.Handle, PChar(A), StrLen(PChar(A)), Rect, DT_CENTER or DT_WORDBREAK);

  // SG_HiddenData01.Tag 에 현재 평가요소의 시작 index가 저장되어 있음
  if SG_HiddenData01.Tag = -1 then
    System.Exit;
  if not SG_Image01.Focused then // 포커스가 없을땐 버튼을 보여주지 않는다
    System.Exit;

  // 선택된 row가 화면에 보이게 위치를 바꾼다
  if SG_Image01.Row < SG_Image01.TopRow then // 현재 row 가 화면위에 있다
    SG_Image01.Row := SG_Image01.TopRow
  else if SG_Image01.Row > (SG_Image01.TopRow + SG_Image01.VisibleRowCount-1) then // 현재 row 가 화면밑에 있다
    SG_Image01.Row := SG_Image01.TopRow + SG_Image01.VisibleRowCount-1;
end;

procedure TColForm.SG_Image01KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_UP) and
     (SG_Image01.Row = 0) then
  begin
    // 맨위 항목에서 위쪽 화살표 키이면 이전 요소의 마지막 항목으호 이동
    ShowImage01;
    SG_Image01.Row := SG_Image01.RowCount-1;
    Key := VK_ESCAPE;
  end
  else if (Key = VK_DOWN) and
          (SG_Image01.Row = SG_Image01.RowCount-1)  then
  begin
    // 맨아래 항목에서 아래쪽 화살표 키이면 다음 요소의 첫번째 항목으호 이동
    ShowImage01;
    SG_Image01.Row := 0;
    Key := VK_ESCAPE;
  end;
end;

procedure TColForm.PageControl1Change(Sender: TObject);
begin
  var_Ekind := 'Values';
  Serch;
  BB_Cancel1Click(Sender);
end;

procedure TColForm.SG_ItemImage01DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  A: String;
begin
  if gdSelected in State then
  begin
       SG_ItemImage01.Canvas.Brush.Color := $00FFE8D0;
       SG_ItemImage01.Canvas.Font.Color  := clBlack;
  end;

  SG_ItemImage01.Canvas.FillRect(Rect);

  SG_ItemImage01.ColWidths[mITEMNAME_IDX] := WIDTH_SGIMAGE_COL01;

  if SG_ItemImage01.VisibleRowCount < SG_ItemImage01.RowCount then
       SG_ItemImage01.ColWidths[mITEMDESC_IDX] := SG_ItemImage01.Width -  SG_ItemImage01.ColWidths[mITEMNAME_IDX] - 16
  else
       SG_ItemImage01.ColWidths[mITEMDESC_IDX] := SG_ItemImage01.Width -  SG_ItemImage01.ColWidths[mITEMNAME_IDX];


  Rect.Top   := Rect.Top   + 22;//2; // 실제 Text가 그려지는 영역의 크기를 약간 줄인다
  Rect.Left  := Rect.Left  + 2;
  Rect.Right := Rect.Right - 2;
  if SG_ItemImage01.RowCount > (SG_ItemImage01.VisibleRowCount+SG_ItemImage01.FixedRows) then
       Rect.Right := Rect.Right - GetSystemMetrics(SM_CXVSCROLL); // scroll basr 크기만큼 줄인다

  A := SG_ItemImage01.Cells[ACol, ARow];
  DrawText(SG_ItemImage01.Canvas.Handle, PChar(A), StrLen(PChar(A)), Rect, DT_LEFT or DT_WORDBREAK);

  // 선택된 row가 화면에 보이게 위치를 바꾼다
  if SG_ItemImage01.Row < SG_ItemImage01.TopRow then // 현재 row 가 화면위에 있다
       SG_ItemImage01.Row := SG_ItemImage01.TopRow
  else if SG_ItemImage01.Row > (SG_ItemImage01.TopRow + SG_ItemImage01.VisibleRowCount-1) then // 현재 row 가 화면밑에 있다
       SG_ItemImage01.Row := SG_ItemImage01.TopRow + SG_ItemImage01.VisibleRowCount-1;
end;

procedure TColForm.Serch;
begin
  if  NoteBook1.ActivePage = 'P1' then
  begin
     if PageControl1.ActivePage = tabSheet1 then
     begin
         Retrieve_Data; // 선택한 피평가자의 자료를 읽는다
         Read_item01;
         ShowImage01;
     end;
  end
  else
  if  NoteBook1.ActivePage = 'P2' then
  begin
       Retrieve_Data; // 선택한 피평가자의 자료를 읽는다
       Read_item;
       ShowImage;
  end;
end;

function TColForm.FL_CheckNullMERIT(chk : Integer):Boolean; // 장단점 미입력 항목이 있는지 여부 체크
var Msg, ParamVariant : String;
    CNT : integer;
begin
  Result := False;
(*
  If (chk = 1) Then
  Begin
    if var_Ekind = 'Values' then
    Begin
      If ((Trim(OM_Merit_V1.Text) = '') or (Trim(OM_Merit_V2.Text) = '')) Then
      Begin
       MessageDlg('Values항목의 장/단점을 입력하시기 바랍니다.'+#13+#10+''+#13+#10+'입력 완료 후 [Values 저장] 하시기 바랍니다.', mtWarning, [mbOK], 0);
       Exit;
      End;
    End
    else
    if var_Ekind = '공통역량' then
    Begin
      If ((Trim(OM_Merit_C1.Text) = '') or (Trim(OM_Merit_C2.Text) = '')) Then
      Begin
       MessageDlg('공통역량항목의 장/단점을 입력하시기 바랍니다.'+#13+#10+''+#13+#10+'입력 완료 후 [공통역량 저장] 하시기 바랍니다.', mtWarning, [mbOK], 0);
       Exit;
      End;
    End
    else
    if var_Ekind = '리더십역량' then
    Begin
      If ((Trim(OM_Merit_C1.Text) = '') or (Trim(OM_Merit_C2.Text) = '')) Then
      Begin
       MessageDlg('리더십역량항목의 장/단점을 입력하시기 바랍니다.'+#13+#10+''+#13+#10+'입력 완료 후 [리더십역량 저장] 하시기 바랍니다.', mtWarning, [mbOK], 0);
       Exit;
      End;
    End
    else
    if var_Ekind = '직무역량' then
    Begin
      If ((Trim(OM_Merit_C1.Text) = '') or (Trim(OM_Merit_C2.Text) = '')) Then
      Begin
       MessageDlg('직무역량항목의 장/단점을 입력하시기 바랍니다.'+#13+#10+''+#13+#10+'입력 완료 후 [직무역량 저장] 하시기 바랍니다.', mtWarning, [mbOK], 0);
       Exit;
      End;
    End;
    if var_Ekind = '평가의견등록' then
    Begin
      If ((Trim(OM_Merit_O1.Text) = '') or (Trim(OM_Merit_O2.Text) = '')) Then
      Begin
       MessageDlg('평가 의견등록을 입력하시기 바랍니다.'+#13+#10+''+#13+#10+'입력 완료 후 [저장] 하시기 바랍니다.', mtWarning, [mbOK], 0);
       Exit;
      End;
    End;
  End
  Else //최종완료
  Begin
    if Pevcno = '1' then //비보임차부장
    Begin
      ParamVariant := ' SELECT  DECODE(REPLACE(MERIT_EVY, '' ''), NULL, ''Values 평가(장점)'',  '+
                      '        (DECODE(REPLACE(MERIT_EVN, '' ''), NULL, ''Values 평가(단점)'',  '+
                      '        (DECODE(REPLACE(MERIT_ECY, '' ''), NULL, ''공통역량(장점)'',     '+
                      '        (DECODE(REPLACE(MERIT_ECN, '' ''), NULL, ''공통역량(단점)'',     '+
                      '        (DECODE(REPLACE(MERIT_ERY, '' ''), NULL, ''리더십역량(장점)'',   '+
                      '        (DECODE(REPLACE(MERIT_ERN, '' ''), NULL, ''리더십역량(단점)'',   '+
                      '        (DECODE(REPLACE(MERIT_EAY, '' ''), NULL, ''직무역량(장점)'',     '+
                      '        (DECODE(REPLACE(MERIT_EAN, '' ''), NULL, ''직무역량(단점)'', ''0''))))))))))))))) SEL_DATA '+
                      ' from PESMCS '+
                      ' WHERE rabasdate = '''+vRabasdate+''' '+
                      '   AND empno     = '''+empno+'''      '+
                      '   AND eempno    = '''+Pempno+'''     ';
    End
    else if Pevcno = '2' then //과장/대리/사원
    Begin
      ParamVariant := ' SELECT  DECODE(REPLACE(MERIT_EVY, '' ''), NULL, ''Values 평가(장점)'',  '+
                      '        (DECODE(REPLACE(MERIT_EVN, '' ''), NULL, ''Values 평가(단점)'',  '+
                      '        (DECODE(REPLACE(MERIT_ECY, '' ''), NULL, ''공통역량(장점)'',     '+
                      '        (DECODE(REPLACE(MERIT_ECN, '' ''), NULL, ''공통역량(단점)'',     '+
                      '        (DECODE(REPLACE(MERIT_EAY, '' ''), NULL, ''직무역량(장점)'',     '+
                      '        (DECODE(REPLACE(MERIT_EAN, '' ''), NULL, ''직무역량(단점)'', ''0''))))))))))) SEL_DATA '+
                      ' from PESMCS '+
                      ' WHERE rabasdate = '''+vRabasdate+''' '+
                      '   AND empno     = '''+empno+'''      '+
                      '   AND eempno    = '''+Pempno+'''     ';
    End
    else if Pevcno = '3' then //팀장
    Begin
      ParamVariant := ' SELECT  DECODE(REPLACE(MERIT_EVY, '' ''), NULL, ''Values 평가(장점)'',  '+
                      '        (DECODE(REPLACE(MERIT_EVN, '' ''), NULL, ''Values 평가(단점)'',  '+
                      '        (DECODE(REPLACE(MERIT_ECY, '' ''), NULL, ''공통역량(장점)'',     '+
                      '        (DECODE(REPLACE(MERIT_ECN, '' ''), NULL, ''공통역량(단점)'',     '+
                      '        (DECODE(REPLACE(MERIT_ERY, '' ''), NULL, ''리더십역량(장점)'',   '+
                      '        (DECODE(REPLACE(MERIT_ERN, '' ''), NULL, ''리더십역량(단점)'', ''0''))))))))))) SEL_DATA '+
                      ' from PESMCS '+
                      ' WHERE rabasdate = '''+vRabasdate+''' '+
                      '   AND empno     = '''+empno+'''      '+
                      '   AND eempno    = '''+Pempno+'''     ';
    End;

    DataModule_Tmax.Csel_SQL := ParamVariant;
    DataModule_Tmax.Csel_Open;

    Msg := DataModule_Tmax.Csel_gfd(1);

    if Msg =  '0' then Result := True
    Else
    Begin
     MessageDlg(Msg + '을 입력하시기 바랍니다.'+#13+#10+''+#13+#10+'입력 완료 후 [최종완료] 하시기 바랍니다.', mtWarning, [mbOK], 0);

     If (Copy(Msg,1,2) = 'Va') Then
     Begin
       SB_0Click(SB_1);
       var_Ekind := 'Values';
       PageControl1.ActivePage := TabSheet1;
       Serch;
       Exit;
     End
     Else if (Copy(Msg,1,2) = '공') Then
     Begin
       SB_0Click(SB_2);
       var_Ekind := '공통역량';
       PageControl2.ActivePage := TabSheet3;
       Serch;
       Exit;
     End
     Else if (Copy(Msg,1,2) = '리') Then
     Begin
       SB_0Click(SB_2);
       var_Ekind := '리더십역량';
       PageControl2.ActivePage := TabSheet4;
       Serch;
       Exit;
     End
     Else if (Copy(Msg,1,2) = '직') Then
     Begin
       SB_0Click(SB_2);
       var_Ekind := '직무역량';
       PageControl2.ActivePage := TabSheet5;
       Serch;
       Exit;
     End;
   End;
  End;
*)

  If (chk = 1) Then
  Begin
    If ((Trim(OM_Merit_O1.Text) = '') or (Trim(OM_Merit_O2.Text) = '')) Then
    Begin
     MessageDlg('평가 의견등록을 입력하시기 바랍니다.'+#13+#10+''+#13+#10+'입력 완료 후 [저장] 하시기 바랍니다.', mtWarning, [mbOK], 0);
     Exit;
    End;
  End
  Else
  Begin
    ParamVariant := ' SELECT DECODE(MERIT_EVY, NULL, 0, 1) +   ' +
                    '        DECODE(MERIT_EVN, NULL, 0, 1) CNT ' +
                    ' FROM PESMCS                              ' +
                    ' WHERE rabasdate = '''+vRabasdate+''' ' +
                    '   AND empno     = '''+empno +''' '+ // 피평가자
                    '   AND eempno    = '''+Pempno+''' '; // 평가자(접속자사번)

    DataModule_Tmax.Csel_SQL := ParamVariant;
    DataModule_Tmax.Csel_Open;

    CNT := StrToInt(DataModule_Tmax.Csel_gfd(1));

    If (CNT <> 2) Then
    Begin
     MessageDlg('[저장] 완료 후 [최종완료] 하시기 바랍니다.', mtWarning, [mbOK], 0);
     Exit;
    End;
  End;

  Result := True;
end;


end.

