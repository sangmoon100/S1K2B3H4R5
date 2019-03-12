unit URegForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ComCtrls, Db, Tmax_DataSetText, OnLineLabel,
  OnEditBaseCtrl, OnEditStdCtrl, Grids, DBGrids, OnGrDBGrid, OnShapeLabel,
  Mask, OnInsaCommon, OnFocusButton, Comobj, OnScheme, OnEditBtnCtrl,
  OnTmaxPersonEdit, CheckLst, OnListbox, OnEditMdate, OnEditCombo,
  OnTmaxDeptEdit, OnEditMemo, OnDBEditCtrl, OnSkinBtn, OnEditNumCtl,
  pebtnedit, peNumedit, kpaylib;

type
  TRegForm = class(TForm)
    Panel1: TPanel;
    SF_Reg: TOnSchemeForm;
    StatusBar1: TStatusBar;
    ExitBtn: TOnFocusButton;
    ds1: TDataSource;
    NewBtn: TOnFocusButton;
    BT_Batchjob: TOnFocusButton;
    Notebook1: TNotebook;
    Shape10: TShape;
    Shape1: TShape;
    P_YY: TOnShapeLabel;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Label14: TLabel;
    Label17: TLabel;
    L_Jobfield: TLabel;
    L_DutyKind: TLabel;
    L_Duty: TLabel;
    L_DutyText: TLabel;
    Label20: TLabel;
    L_DutyLevel: TLabel;
    L_Paycl: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    P_DutyMM: TOnShapeLabel;
    Label26: TLabel;
    P_MM: TOnShapeLabel;
    P_DutyYY: TOnShapeLabel;
    Label16: TLabel;
    Panel3: TPanel;
    P_job: TPanel;
    P_Du: TPanel;
    P_duki: TPanel;
    P_DuRa: TPanel;
    Label12: TLabel;
    Label13: TLabel;
    P_DuTe: TPanel;
    P_DuLe: TPanel;
    P_Pa: TPanel;
    SG_Mas: TStringGrid;
    OB_DutyLevel: TOnFocusButton;
    OB_Paycl: TOnFocusButton;
    OB_Duty: TOnFocusButton;
    OB_Dutytext: TOnFocusButton;
    T_Memo: TMemo;
    Memo_SubDutyText: TMemo;
    E_frDutyDate: TOnMaskEdit;
    E_toDutyDate: TOnMaskEdit;
    E_DutyTermRate: TOnNumberEdit;
    SaveBtn: TOnFocusButton;
    DeleteBtn: TOnFocusButton;
    Shape6: TShape;
    Label21: TLabel;
    SG_Eqip: TStringGrid;
    P_ESk: TPanel;
    Label18: TLabel;
    Label19: TLabel;
    P_EDe: TPanel;
    P_ESu: TPanel;
    P_EUs: TPanel;
    P_EMa: TPanel;
    Panel13: TPanel;
    Shape8: TShape;
    Shape7: TShape;
    Label22: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    L_EMain: TLabel;
    L_ESub: TLabel;
    L_EDet: TLabel;
    OB_Eqip: TOnFocusButton;
    E_EUseYY: TOnNumberEdit;
    E_EUseMM: TOnNumberEdit;
    E_ESkillrate: TOnNumberEdit;
    B_EqipSave: TOnFocusButton;
    EqipDelBtn: TOnFocusButton;
    Shape9: TShape;
    Label23: TLabel;
    Panel9: TPanel;
    Panel10: TPanel;
    Shape5: TShape;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    L_PMain: TLabel;
    L_PSub: TLabel;
    L_PDet: TLabel;
    Shape12: TShape;
    Label27: TLabel;
    OB_Prog: TOnFocusButton;
    E_PUseYY: TOnNumberEdit;
    E_PUseMM: TOnNumberEdit;
    E_PSkillRate: TOnNumberEdit;
    SG_Prog: TStringGrid;
    P_PMa: TPanel;
    P_PSu: TPanel;
    P_PDe: TPanel;
    P_PSk: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    P_PUs: TPanel;
    B_ProgSave: TOnFocusButton;
    ProgDelBtn: TOnFocusButton;
    Page_Duty: TOnSkinButton;
    Page_Eqip: TOnSkinButton;
    Page_Prog: TOnSkinButton;
    procedure ExitBtnClick(Sender: TObject);
    procedure SG_EqPrDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
//    procedure Cal1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure E_toDutyDateExit(Sender: TObject);
    procedure E_DutyTermRateExit(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure SaveBtnClick(Sender: TObject);
    procedure SG_EqipClick(Sender: TObject);
    procedure SG_ProgClick(Sender: TObject);
//    procedure E_frDutyDateKeyDown(Sender: TObject; var Key: Word;
//      Shift: TShiftState);
//    procedure E_toDutyDateKeyDown(Sender: TObject; var Key: Word;
//      Shift: TShiftState);
    procedure EqipDelBtnClick(Sender: TObject);
    procedure ProgDelBtnClick(Sender: TObject);
    procedure E_PayclExit(Sender: TObject);
    procedure SG_MasDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SG_MasClick(Sender: TObject);
    procedure DeleteBtnClick(Sender: TObject);
    procedure NewBtnClick(Sender: TObject);
    procedure B_EqipSaveClick(Sender: TObject);
    procedure B_ProgSaveClick(Sender: TObject);
    procedure OB_DutyClick(Sender: TObject);
    procedure OB_DutytextClick(Sender: TObject);
    procedure OB_DutyLevelClick(Sender: TObject);
//    procedure OB_PayclClick(Sender: TObject);
    procedure OB_EqPrClick(Sender: TObject);
    procedure Pages_Click(Sender: TObject);
    procedure E_frDutyDateExit(Sender: TObject);
    procedure BT_BatchjobClick(Sender: TObject);
    procedure E_PSkillRateKeyPress(Sender: TObject; var Key: Char);
    procedure E_PUseYYKeyPress(Sender: TObject; var Key: Char);
    procedure E_DutyTermRateKeyPress(Sender: TObject; var Key: Char);
    procedure E_ESkillrateKeyPress(Sender: TObject; var Key: Char);
    procedure E_EUseYYKeyPress(Sender: TObject; var Key: Char);
    procedure OB_PayclClick(Sender: TObject);
    procedure Page_DutyClick(Sender: TObject);
//    procedure OB_EqipClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
        gbSTATE,
        START,
        RESET_ON,
        SUBDUTY_ON,
        ON_ERROR,
        Check : Boolean;
//==============================================================================//
// 03.13    2002.04.02      손종운  직무경력 Update 대상기간  제한   전산처리요청서: 2002-2456호
//==============================================================================//
        gsEnable : Boolean;
//==============================================================================//

        gsEmpno, gsFrDutydate, gsToDutydate : String; // MainForm Input;

        procedure fzInitialForm;
        procedure fzSetKeyBts(bEnableYN: Boolean);
//        function  EXEC_SQL(SQLText:String):Boolean;
        procedure SET_GRID_Mas(mEmpno, mFrDutydate, mToDutydate: String);
        procedure SET_Grid_EqPr(SG: TStringGrid; Kind: String);
        function  Set_Grid_Sub(Kind: Integer; mEmpno, mDutyno: String; mMemo: TMemo): String;
        procedure Get_MasCont(TarMemo: TMemo; SrcSG: TStringGrid);
        procedure Get_EqipCont(SrcSG: TStringGrid);
        procedure Get_ProgCont(SrcSG: TStringGrid);
        procedure NewMas(mAllYN: Boolean);
        procedure NewEqip(mAllYN: Boolean);
        procedure NewProg(mAllYN: Boolean);
//==============================================================================//
// 03.09    2002.04.02      손종운  직무경력 Update 대상기간  제한   전산처리요청서: 2002-2456호
//==============================================================================//
        procedure fzSetBtn(bEnableYN: Boolean);
//==============================================================================//
        function check_pre_duty : Boolean;

  end;

var
  RegForm: TRegForm;

implementation

uses
  UCodeForm, UDutyForm, ULevelForm, UPayClForm, UMainForm, USubForm,
  UPitLib, UbatchForm;


{$R *.DFM}


//=============================================================================//
// Form 관련 Event...
//=============================================================================//
{procedure TRegForm.FormPaint(Sender: TObject);
begin
  Self.OnPaint := Nil;

  if Close_Flag then
    Close
  else
    OnMaskEdit1.Setfocus;
end;
}
//=============================================================================//
// procedure & function
//=============================================================================//


//=============================================================================//

////////////////////////////////////////////////////////////////////////////////
// User Defined
////////////////////////////////////////////////////////////////////////////////
{
function TRegForm.EXEC_SQL(SQLText:String):Boolean;
begin
     Result := True;
     Cupd_SQL := SQLText;
     Cupd_Exec;
     if not Cupd_ret then
     begin
        Messagedlg('APP-Server Error : ' + Cupd.ServiceName + #13 +
                   '[' + Cupd.HeaderInfo.ErrCode + '] ' + Cupd.HeaderInfo.ErrMsg
                   ,mtError,[mbOK],0);
        Result := False;
        ON_ERROR := True;
        Exit;
     end
end;
}
procedure TRegForm.SET_GRID_Mas(mEmpno, mFrDutydate, mToDutydate: String);
var
  sSQL{, sTemp, GetSubText}: String;
  //i,
  iInd, jInd, iTempYYMM: Integer;
begin
    sSQL := Format(
        'SELECT  '+
        ' nvl(        a.empno         ,'' ''), '+
        ' nvl(        a.korname       ,'' ''), '+
        ' nvl(to_char(a.dutyno       ),''0''), '+
        ' nvl(        a.JobField      ,'' ''), '+
        ' nvl(        c.jobfieldname  ,'' ''), '+
        ' nvl(        a.dutykind      ,'' ''), '+
        ' nvl(        d.dutykindname  ,'' ''), '+
        ' nvl(        a.duty          ,'' ''), '+
        ' nvl(DECODE(E.USEYN,''N'',''(舊)''||e.dutyname ,e.dutyname), '' '') , '+
//        ' nvl(        e.dutyname      ,'' ''), '+
        ' nvl(        a.paycl         ,'' ''), '+
        ' nvl(        b.payclname     ,'' ''), '+
        ' nvl(        a.dutytext      ,'' ''), '+
        ' nvl(        a.frdutydate    ,'' ''), '+
        ' nvl(        a.todutydate    ,'' ''), '+
        ' nvl(to_char(a.dutyyy       ),''0''), '+
        ' nvl(to_char(a.dutymm       ),''0''), '+
        ' nvl(to_char(a.dutytermrate ),''0''), '+
        ' nvl(        a.dutylevel     ,'' ''), '+
        ' nvl(        f.dutylevelname ,'' '')  '+
        'FROM  pishrmas a,                     '+
        '      (select codeno, codename payclname    from pyccode where codeid = ''I112'') b,  '+ // 직급
        '      (select codeno, codename jobfieldname from pyccode where codeid = ''I116'') c,  '+ // 업무분야
        '      pishrdukind d,                  '+
        '      pishrduty e,                    '+
        '      pishrlevel f                    '+
        'WHERE  a.empno = ''%s''               '+
        '  and  a.frdutydate = ''%s'' and  NVL(a.todutydate,''0'') = NVL(''%s'',''0'') '+
        '  and  a.paycl = b.codeno             '+
        '  and  a.JobField = c.codeno          '+
        '  and  a.JobField = d.JobField        '+
        '  and  a.dutykind = d.dutykind        '+
        '  and  a.JobField = e.JobField        '+
        '  and  a.dutykind = e.dutykind        '+
        '  and  a.duty = e.duty                '+
        '  and  a.dutylevel = f.dutylevel(+)   '+
        'order by a.frdutydate, a.dutytermrate desc, a.JobField, a.dutykind, a.dutyno ',[mEmpno, mFrDutydate, mToDutydate]);

    With MainForm.TCDS do begin
        Close;
        ClearFieldInfo;
        AddField('EMPNO'        , ftString,  4 );
        AddField('KORNAME'      , ftString,  12);
        AddField('DUTYNO'       , ftString,  6 );
        AddField('JOBFIELD'     , ftString,  2 );
        AddField('JOBFIELDNAME' , ftString,  20);
        AddField('DUTYKIND'     , ftString,  10);
        AddField('DUTYKINDNAME' , ftString,  20);
        AddField('DUTY'         , ftString,  10);
        AddField('DUTYNAME'     , ftString,  20);
        AddField('PAYCL'        , ftString,  3 );
        AddField('PAYCLNAME'    , ftString,  20);
        AddField('DUTYTEXT'     , ftString,  80);
        AddField('FRDUTYDATE'   , ftString,  8 );
        AddField('TODUTYDATE'   , ftString,  8 );
        AddField('DUTYYY'       , ftString,  40);
        AddField('DUTYMM'       , ftString,  40);
        AddField('DUTYTERMRATE' , ftString,  40);
        AddField('DUTYLEVEL'    , ftString,  2 );
        AddField('DUTYLEVELNAME', ftString,  20);

        Sql.Clear;
        Sql.Text := sSQL;
        ServiceName := 'PIT1030A_SEL6';
        open;

        SendMessage(SG_Mas.Handle, WM_SETREDRAW, 0, 0);

        SG_Mas.RowCount := 1;
        for iInd := 0 to SG_Mas.RowCount -1 do
            for jInd := 0 to SG_Mas.ColCount -1 do
                SG_Mas.Cells[jInd, iInd] := '';

        iInd := 0;
        While Not Eof do
        begin
            if iInd > 0 then
                SG_Mas.RowCount := SG_Mas.RowCount + 1;

            SG_Mas.Cells[m_SEQNO       ,iInd] := IntToStr(iInd);
            SG_Mas.Cells[m_EMPNO       ,iInd] := FieldByName('EMPNO').AsString;
            SG_Mas.Cells[m_KORNAME     ,iInd] := FieldByName('KORNAME').AsString;
            SG_Mas.Cells[m_FRDUTYDATE  ,iInd] := FieldByName('FRDUTYDATE').AsString;
            SG_Mas.Cells[m_TODUTYDATE  ,iInd] := FieldByName('TODUTYDATE').AsString;

            if Trim(FieldByName('TODUTYDATE').AsString) = '' then
                SG_Mas.Cells[m_DUTYDATE    ,iInd] := Copy(FieldByName('FRDUTYDATE').AsString,1,4) + '/' +
                                                     Copy(FieldByName('FRDUTYDATE').AsString,5,2) +' ~ '+
                                                      '현재'
            else
                SG_Mas.Cells[m_DUTYDATE    ,iInd] := Copy(FieldByName('FRDUTYDATE').AsString,1,4) + '/' +
                                                     Copy(FieldByName('FRDUTYDATE').AsString,5,2) +' ~ '+
                                                     Copy(FieldByName('TODUTYDATE').AsString,1,4) + '/' +
                                                     Copy(FieldByName('TODUTYDATE').AsString,5,2) ;
            SG_Mas.Cells[m_DUTYYY      ,iInd] := FieldByName('DUTYYY').AsString;
            SG_Mas.Cells[m_DUTYMM      ,iInd] := FieldByName('DUTYMM').AsString;

            MainForm.fnSetVariable(2);
            if FieldByName('TODUTYDATE').AsString = '' then
                iTempYYMM := Months_Between(FieldByName('FRDUTYDATE').AsString, Copy(MainForm.pSysDate,1,6))+1
            else
                iTempYYMM := Months_Between(FieldByName('FRDUTYDATE').AsString, FieldByName('TODUTYDATE').AsString)+1;
             SG_Mas.Cells[m_DUTYYYMM    ,iInd] := IntToStr(iTempYYMM div 12)+'년 '+
                                                  IntToStr(iTempYYMM mod 12)+'개월';

            SG_Mas.Cells[m_DUTYNO      ,iInd] := FieldByName('DUTYNO').AsString;
            SG_Mas.Cells[m_JOBFIELD    ,iInd] := FieldByName('JobField').AsString;
            SG_Mas.Cells[m_JOBFIELDNM  ,iInd] := FieldByName('JobFieldNAME').AsString;
            SG_Mas.Cells[m_DUTYKIND    ,iInd] := FieldByName('DUTYKIND').AsString;
            SG_Mas.Cells[m_DUTYKINDNM  ,iInd] := FieldByName('DUTYKINDNAME').AsString;
            SG_Mas.Cells[m_DUTY        ,iInd] := FieldByName('DUTY').AsString;
            SG_Mas.Cells[m_DUTYNM      ,iInd] := FieldByName('DUTYNAME').AsString;
            SG_Mas.Cells[m_DUTYTERMRATE,iInd] := FieldByName('DUTYTERMRATE').AsString;
            SG_Mas.Cells[m_DUTYLEVEL   ,iInd] := FieldByName('DUTYLEVEL').AsString;
            SG_Mas.Cells[m_DUTYLEVELNM ,iInd] := FieldByName('DUTYLEVELNAME').AsString;
            SG_Mas.Cells[m_PAYCL       ,iInd] := FieldByName('PAYCL').AsString;
            SG_Mas.Cells[m_PAYCLNM     ,iInd] := FieldByName('PAYCLNAME').AsString;
            SG_Mas.Cells[m_MODE        ,iInd] := 'U';

            T_Memo.Lines.Clear;
            T_Memo.Width := SG_Mas.ColWidths[m_DUTYTEXT];
            T_Memo.Lines.Add('⊙ '+FieldByName('DUTYTEXT').AsString);
            Set_Grid_Sub(1, SG_Mas.Cells[m_EMPNO,iInd], SG_Mas.Cells[m_DUTYNO, iInd], T_Memo);
            SG_Mas.Cells[m_DUTYTEXT    ,iInd] := T_Memo.Lines.Text;

            SG_Mas.RowHeights[iInd] := 20 + (T_Memo.Lines.Count * 12);

            Inc(iInd);
            Next;
        end;

        Close;

        SendMessage(SG_Mas.Handle, WM_SETREDRAW, 1, 0);
        SG_Mas.Refresh;
    end;
end;

procedure TRegForm.SET_Grid_EqPr(SG: TStringGrid; Kind: String);
var
  SQLText : String;
  i, j, Cnt : integer;
begin
    if Kind = 'I711' then
        SQLText:= Format(
               'SELECT                                           '+
               '  nvl(          b.codeno    , '' '') mainid   ,  '+
               '  nvl(          b.codename  , '' '') mainname ,  '+
               '  nvl(          c.codeno    , '' '') subid    ,  '+
               '  nvl(          c.codename  , '' '') subname  ,  '+
               '  nvl(          d.codeno    , '' '') detid    ,  '+
               '  nvl(          d.codename  , '' '') detname  ,  '+
               '  nvl(  to_char(a.skillrate), ''0'') skillrate,  '+
               '  nvl(  to_char(a.useyy    ), ''0'') useyy    ,  '+
               '  nvl(  to_char(a.usemm    ), ''0'') usemm       '+
               'FROM (select codeno, codename from pishrcode where codeid = ''I711'') b, '+
               '     (select codeno, codename from pishrcode where codeid = ''I711'') c, '+
               '     (select codeno, codename from pishrcode where codeid = ''I711'') d, '+
               '     pishreqip a                         '+
               'WHERE a.empno = ''%s''                   '+
               '  AND substr(a.eqipcode,1,3) =  b.codeno '+
               '  AND substr(a.eqipcode,1,6) =  c.codeno '+
               '  AND a.eqipcode             =  d.codeno ',[gsEmpno])
    else
        SQLText:= Format(
               'SELECT                                           '+
               '  nvl(          b.codeno    , '' '') mainid   ,  '+
               '  nvl(          b.codename  , '' '') mainname ,  '+
               '  nvl(          c.codeno    , '' '') subid    ,  '+
               '  nvl(          c.codename  , '' '') subname  ,  '+
               '  nvl(          d.codeno    , '' '') detid    ,  '+
               '  nvl(          d.codename  , '' '') detname  ,  '+
               '  nvl(  to_char(a.skillrate), ''0'') skillrate,  '+
               '  nvl(  to_char(a.useyy    ), ''0'') useyy    ,  '+
               '  nvl(  to_char(a.usemm    ), ''0'') usemm       '+
               'FROM (select codeno, codename from pishrcode where codeid = ''I713'') b, '+
               '     (select codeno, codename from pishrcode where codeid = ''I713'') c, '+
               '     (select codeno, codename from pishrcode where codeid = ''I713'') d, '+
               '     pishrprog a                         '+
               'WHERE a.empno = ''%s''                   '+
               '  AND substr(a.progcode,1,2) =  b.codeno '+
               '  AND substr(a.progcode,1,5) =  c.codeno '+
               '  AND a.progcode             =  d.codeno ',[gsEmpno]);

    With MainForm.TCODE do
    begin
        Close;
        ClearFieldInfo;
        AddField('MAINID'       , ftString,  10);
        AddField('MAINNAME'     , ftString,  30);
        AddField('SUBID'        , ftString,  10);
        AddField('SUBNAME'      , ftString,  30);
        AddField('DETID'        , ftString,  10);
        AddField('DETNAME'      , ftString,  30);
        AddField('SKILLRATE'    , ftString,  6 );
        AddField('USEYY'        , ftString,  2 );
        AddField('USEMM'        , ftString,  2 );

        Sql.Clear;
        Sql.Text := SQLText;
        ServiceName :='PIT1030A_SEL5';
        Open;
//        TFunc_TQueryAuto('SPIT1030S4', SQL, ttxCODE);

        SendMessage(SG.Handle, WM_SETREDRAW, 0, 0);

        SG.RowCount := 1;
        for i:= 0 to SG.RowCount-1 do
            for j:= 0 to SG.ColCount-1 do
                SG.Cells[j,i] := '';

        Cnt := 0;
        while not Eof do
        begin
            if Cnt > 0 then
                SG.RowCount := SG.RowCount + 1;
            if Kind = 'I711' then
            begin
                SG.Cells[e_MAINID   ,Cnt] := FieldByName('MAINID').AsString;
                SG.Cells[e_MAINNM   ,Cnt] := FieldByName('MAINNAME').AsString;
                SG.Cells[e_SUBID    ,Cnt] := FieldByName('SUBID').AsString;
                SG.Cells[e_SUBNM    ,Cnt] := FieldByName('SUBNAME').AsString;
                SG.Cells[e_DETID    ,Cnt] := FieldByName('DETID').AsString;
                SG.Cells[e_DETNM    ,Cnt] := FieldByName('DETNAME').AsString;
                SG.Cells[e_SKILLRATE,Cnt] := FieldByName('SKILLRATE').AsString;
                SG.Cells[e_USEYY    ,Cnt] := FieldByName('USEYY').AsString;
                SG.Cells[e_USEMM    ,Cnt] := FieldByName('USEMM').AsString;
                SG.Cells[e_USE      ,Cnt] := FieldByName('USEYY').AsString+'년 '+FieldByName('USEMM').AsString+'개월';
                SG.Cells[e_MODE     ,Cnt] := 'D';
            end
            else
            begin
                SG.Cells[p_MAINID   ,Cnt] := FieldByName('MAINID').AsString;
                SG.Cells[p_MAINNM   ,Cnt] := FieldByName('MAINNAME').AsString;
                SG.Cells[p_SUBID    ,Cnt] := FieldByName('SUBID').AsString;
                SG.Cells[p_SUBNM    ,Cnt] := FieldByName('SUBNAME').AsString;
                SG.Cells[p_DETID    ,Cnt] := FieldByName('DETID').AsString;
                SG.Cells[p_DETNM    ,Cnt] := FieldByName('DETNAME').AsString;
                SG.Cells[p_SKILLRATE,Cnt] := FieldByName('SKILLRATE').AsString;
                SG.Cells[p_USEYY    ,Cnt] := FieldByName('USEYY').AsString;
                SG.Cells[p_USEMM    ,Cnt] := FieldByName('USEMM').AsString;
                SG.Cells[p_USE      ,Cnt] := FieldByName('USEYY').AsString+'년 '+FieldByName('USEMM').AsString+'개월';
                SG.Cells[p_MODE     ,Cnt] := 'D';
            end;

            //SG.RowHeights[Cnt] := ((SG.Canvas.TextWidth(SG.cells[0,Cnt]) div SG.ColWidths[0])) * 12 + 20;

            Inc(Cnt);
            Next;
        end;
        Close;

        SendMessage(SG.Handle, WM_SETREDRAW, 1, 0);
        SG.Refresh;
    end;
end;

function TRegForm.SET_Grid_Sub(Kind: Integer; mEmpno, mDutyno: String; mMemo: TMemo): String;
var
  SQLText : String;
begin
    Result := '';

    if Kind = 1 then
      SQLText := Format(
             'SELECT  ' +
             'nvl(  to_char(subdutyno), ''0'') CODE, ' +
             'nvl(  subdutytext ,'' '') CODENAME ' +
             'FROM pishrsub             ' +
             'WHERE empno = ''%s''      ' +
             '  AND dutyno =  %s        ' +
             'ORDER BY subdutyno        ' ,    [mEmpno, mDutyno]);

    With MainForm.TCODE do begin
        Close;
        ClearFieldInfo;
        AddField('CODE'         , ftString,  40);
        AddField('CODENAME'     , ftString,  80);

        Sql.Clear;
        Sql.Text := SQLText;
        ServiceName := 'PIT1030A_SEL7';
        Open;
//        TFunc_TQueryAuto('SPIT1030S3', SQL, ttxCODE);

        while not Eof do
        begin
            mMemo.Lines.Add(' - '+FieldByName('CODENAME').AsString);
            Next;
        end;
        Close;
    end;
    Result := ''
end;

procedure TRegForm.Get_MasCont(TarMemo: TMemo; SrcSG: TStringGrid);
var
 // SQL: String;
  i{, j, Cnt} : integer;
begin
    with SrcSG do
    begin
        // 자료 입력
        E_frDutyDate.Text := Cells[m_FRDUTYDATE  , Row];
        E_toDutyDate.Text := Cells[m_TODUTYDATE  , Row];
        P_DutyYY.ValueCaption    := Cells[m_DUTYYY      , Row];
        P_DutyMM.ValueCaption    := Cells[m_DUTYMM      , Row];
        P_YY.ValueCaption        := Cells[m_DUTYYY      , Row];
        P_MM.ValueCaption        := Cells[m_DUTYMM      , Row];
        E_toDutyDateExit(E_toDutyDate);

        // E_Duty.Text         := Cells[m_DUTYNM      , Row];
        L_JobField.Hint     := Cells[m_JOBFIELD    , Row];
        L_JobField.Caption  := Cells[m_JOBFIELDNM  , Row];
        L_DutyKind.Hint     := Cells[m_DUTYKIND    , Row];
        L_DutyKind.Caption  := Cells[m_DUTYKINDNM  , Row];
        L_Duty.Hint         := Cells[m_DUTY        , Row];
        L_Duty.Caption      := Cells[m_DUTYNM      , Row];

        //L_DutyText.Caption  := Cells[m_DUTYTEXT    , Row];
        E_DutyTermRate.Text := Cells[m_DUTYTERMRATE, Row];
        // E_DutyLevel.Text    := Cells[m_DUTYLEVELNM , Row];
        L_DutyLevel.Caption := Cells[m_DUTYLEVELNM , Row];
        L_DutyLevel.Hint    := Cells[m_DUTYLEVEL   , Row];
        // E_PayCl.Text        := Cells[m_PAYCLNM     , Row];
        L_PayCl.Caption     := Cells[m_PAYCLNM     , Row];
        L_PayCl.Hint        := Cells[m_PAYCL       , Row];
    end;

    TarMemo.Lines.Clear;
    TarMemo.Lines.Text := SrcSG.Cells[m_DUTYTEXT, SrcSG.Row];
    L_DutyText.Caption := Copy(TarMemo.Lines[0],4,Length(TarMemo.Lines[0])-3); // 광의에서 '⊙ ' 제거
    TarMemo.Lines.Delete(0);
    for i:= 0 to TarMemo.Lines.Count - 1 do   // 협의에서 ' - ' 제거
        TarMemo.Lines[i] := Copy(TarMemo.Lines[i],4,Length(TarMemo.Lines[i])-3);
    TarMemo.Refresh;

    if (NoteBook1.ActivePage = 'P_1') and (OB_Duty.Enabled) then
        OB_Duty.SetFocus;
end;

procedure TRegForm.Get_EqipCont(SrcSG: TStringGrid);
begin
    with SrcSG do
    begin
        // 자료 입력
        // E_Eqip.Text         := Cells[e_DetNM       , Row];
        L_EMain.Caption     := Cells[e_MainNM      , Row];
        L_EMain.Hint        := Cells[e_MainID      , Row];
        L_ESub.Caption      := Cells[e_SubNM       , Row];
        L_ESub.Hint         := Cells[e_SubID       , Row];
        L_EDet.Caption      := Cells[e_DetNM       , Row];
        L_EDet.Hint         := Cells[e_DetID       , Row];
        E_ESkillRate.Text   := Cells[e_SkillRate   , Row];
        E_EUseYY.Text       := Cells[e_UseYY       , Row];
        E_EUseMM.Text       := Cells[e_UseMM       , Row];
    end;

    if (NoteBook1.ActivePage = 'P_2') and (OB_Eqip.Enabled) then
        OB_Eqip.SetFocus;
end;

procedure TRegForm.Get_ProgCont(SrcSG: TStringGrid);
begin
    with SrcSG do
    begin
        // 자료 입력
        // E_Prog.Text         := Cells[p_DetNM       , Row];
        L_PMain.Caption     := Cells[p_MainNM      , Row];
        L_PMain.Hint        := Cells[p_MainID      , Row];
        L_PSub.Caption      := Cells[p_SubNM       , Row];
        L_PSub.Hint         := Cells[p_SubID       , Row];
        L_PDet.Caption      := Cells[p_DetNM       , Row];
        L_PDet.Hint         := Cells[p_DetID       , Row];
        E_PSkillRate.Text   := Cells[p_SkillRate   , Row];
        E_PUseYY.Text       := Cells[p_UseYY       , Row];
        E_PUseMM.Text       := Cells[p_UseMM       , Row];
    end;

    if (NoteBook1.ActivePage = 'P_3') and (OB_Prog.Enabled) then
        OB_Prog.SetFocus;
end;

////////////////////////////////////////////////////////////////////////////////
// Events
////////////////////////////////////////////////////////////////////////////////

procedure TRegForm.FormCreate(Sender: TObject);
begin
    START := True;
end;

procedure TRegForm.FormPaint(Sender: TObject);
begin
    if START = false then Exit;
    Application.ProcessMessages;
    START := False;
    SF_Reg.Refresh;

    fzInitialForm;

    if gbSTATE  then
    begin
        NewBtn.Click;
    end
    else
    begin
        fzSetKeyBts(False);

        SET_GRID_Mas(gsEmpno, gsFrDutydate, gsToDutydate);
        Get_MasCont(Memo_SubDutyText, SG_Mas);
//==============================================================================//
// 03.13    2002.04.04      손종운  =>
//==============================================================================//
        fzSetBtn(gsEnable);
//==============================================================================//
    end;
    SET_Grid_EqPr(SG_Eqip, 'I711');
    Get_EqipCont(SG_Eqip);
    SET_Grid_EqPr(SG_Prog, 'I713');
    Get_ProgCont(SG_Prog);

    MainForm.fnSetVariable(0); //dsa2000 관리자를 위해서 추가.   2014.03.21.
end;

procedure TRegForm.fzInitialForm;
begin
    Memo_SubDutyText.BorderStyle := bsNone;

    Pages_Click(Page_Duty);
    Page_DutyClick(Page_Duty);

    SUBDUTY_ON := FALSE;
    RESET_ON   := FALSE;

    with SG_Mas do
    begin
        ColWidths[m_SEQNO       ] := -1;               // Cols[m_SEQNO       ].Text := '연번';
        ColWidths[m_EMPNO       ] := -1;               // Cols[m_EMPNO       ].Text := '사번';
        ColWidths[m_KORNAME     ] := -1;               // Cols[m_KORNAME     ].Text := '성명';
        ColWidths[m_DUTYNO      ] := -1;               // Cols[m_DUTYNO      ].Text := '직무번호';
        ColWidths[m_JOBFIELD    ] := -1;               // Cols[m_JOBFIELD    ].Text := '업무분야';
        ColWidths[m_JOBFIELDNM  ] := P_Job.Width-2;    // Cols[m_JOBFIELDNM  ].Text := '업무분야명';
        ColWidths[m_DUTYKIND    ] := -1;               // Cols[m_DUTYKIND    ].Text := '직종';
        ColWidths[m_DUTYKINDNM  ] := P_Duki.Width-2;   // Cols[m_DUTYKINDNM  ].Text := '직종명';
        ColWidths[m_DUTY        ] := -1;               // Cols[m_DUTY        ].Text := '직무';
        ColWidths[m_DUTYNM      ] := P_Du.Width-2;     // Cols[m_DUTYNM      ].Text := '직무명';
        ColWidths[m_FRDUTYDATE  ] := -1;               // Cols[m_FRDUTYDATE  ].Text := 'FR근무기간';
        ColWidths[m_TODUTYDATE  ] := -1;               // Cols[m_TODUTYDATE  ].Text := 'TO근무기간';
        ColWidths[m_DUTYDATE    ] := -1;               // Cols[m_DUTYDATE    ].Text := '근무기간';
        ColWidths[m_DUTYYY      ] := -1;               // Cols[m_DUTYYY      ].Text := '근무종사년수';
        ColWidths[m_DUTYMM      ] := -1;               // Cols[m_DUTYMM      ].Text := '근무종사월수';
        ColWidths[m_DUTYYYMM    ] := -1;               // Cols[m_DUTYYYMM    ].Text := '근무종사년월';
        ColWidths[m_DUTYTERMRATE] := P_DuRa.Width-2;   // Cols[m_DUTYTERMRATE].Text := '종사기간비중';
        ColWidths[m_DUTYTEXT    ] := P_DuTe.Width-2;   // Cols[m_DUTYTEXT    ].Text := '직무내역';
        ColWidths[m_DUTYLEVEL   ] := -1;               // Cols[m_DUTYLEVEL   ].Text := '직무수준';
        ColWidths[m_DUTYLEVELNM ] := P_DuLe.Width-2;   // Cols[m_DUTYLEVELNM ].Text := '직무수준명';
        ColWidths[m_PAYCL       ] := -1;               // Cols[m_PAYCL       ].Text := '최종직급';
        ColWidths[m_PAYCLNM     ] := P_Pa.Width-2;     // Cols[m_PAYCLNM     ].Text := '최종직급명';
        ColWidths[m_MODE        ] := -1;               // Cols[m_MODE        ].Text := '작업모드';
    end;

    with SG_Eqip do
    begin
        ColWidths[e_MAINID      ] := -1;               // Cols[e_MAINID      ].Text := '대분류';
        ColWidths[e_MAINNM      ] := P_EMa.Width-2;    // Cols[e_MAINNM      ].Text := '대분류명';
        ColWidths[e_SUBID       ] := -1;               // Cols[e_SUBID       ].Text := '중분류';
        ColWidths[e_SUBNM       ] := P_ESu.Width-2;    // Cols[e_SUBNM       ].Text := '중분류명';
        ColWidths[e_DETID       ] := -1;               // Cols[e_DETID       ].Text := '소분류';
        ColWidths[e_DETNM       ] := P_EDe.Width-2;    // Cols[e_DETNM       ].Text := '소분류명';
        ColWidths[e_SKILLRATE   ] := P_ESk.Width-2;    // Cols[e_SKILLRATE   ].Text := '숙련비중';
        ColWidths[e_USEYY       ] := -1;               // Cols[e_USEYY       ].Text := '활용기간년';
        ColWidths[e_USEMM       ] := -1;               // Cols[e_USEMM       ].Text := '활용기간월';
        ColWidths[e_USE         ] := P_EUs.Width-2;    // Cols[e_USE         ].Text := '활용기간';
        ColWidths[e_MODE        ] := -1;               // Cols[e_MODE        ].Text := '작업모드';
    end;

    with SG_Prog do
    begin
        ColWidths[p_MAINID      ] := -1;               // Cols[p_MAINID      ].Text := '대분류';
        ColWidths[p_MAINNM      ] := P_PMa.Width-2;    // Cols[p_MAINNM      ].Text := '대분류명';
        ColWidths[p_SUBID       ] := -1;               // Cols[p_SUBID       ].Text := '중분류';
        ColWidths[p_SUBNM       ] := P_PSu.Width-2;    // Cols[p_SUBNM       ].Text := '중분류명';
        ColWidths[p_DETID       ] := -1;               // Cols[p_DETID       ].Text := '소분류';
        ColWidths[p_DETNM       ] := P_PDe.Width-2;    // Cols[p_DETNM       ].Text := '소분류명';
        ColWidths[p_SKILLRATE   ] := P_PSk.Width-2;    // Cols[p_SKILLRATE   ].Text := '숙련비중';
        ColWidths[p_USEYY       ] := -1;               // Cols[p_USEYY       ].Text := '활용기간년';
        ColWidths[p_USEMM       ] := -1;               // Cols[p_USEMM       ].Text := '활용기간월';
        ColWidths[p_USE         ] := P_PUs.Width-2;    // Cols[p_USE         ].Text := '활용기간';
        ColWidths[p_MODE        ] := -1;               // Cols[p_MODE        ].Text := '작업모드';
    end;
end;

procedure TRegForm.SG_MasDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  Loc: Cardinal;
begin
    with (Sender as TStringGrid).Canvas do
    begin
        if gdSelected in State then
        begin
           Brush.Color := $00D9CAD6;
           Font.Color  := clBlack;
        end;

        if (ACol in [m_DUTYTERMRATE]) then
            Loc := DT_CENTER or DT_WORDBREAK
        else
//            Loc := DT_LEFT or DT_WORDBREAK;
            Loc := DT_LEFT or DT_WORDBREAK or DT_NOPREFIX; //2004.12.22 유효성 --> DT_NOPREFIX:R&D가 R_D로 표시되지 않게..

        FillRect(Rect);
        Rect.Top   := Rect.Top + 2;
        Rect.Left  := Rect.Left + 2;

        DrawText(Handle, PChar((Sender as TStringGrid).Cells[ACol, ARow]), -1, Rect, Loc);
    end;
end;

procedure TRegForm.SG_EqPrDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  Loc: Cardinal;
begin
    with (Sender as TStringGrid).Canvas do
    begin
        if gdSelected in State then
        begin
           Brush.Color := $00D9CAD6;
           Font.Color  := clBlack;
        end;

        FillRect(Rect);
        Rect.Top   := Rect.Top + 2;
        Rect.Left  := Rect.Left + 2;

        if TStringGrid(Sender).Tag = 1 then
        begin
            if (ACol in [e_SKILLRATE, e_USE]) then
                Loc := DT_CENTER or DT_WORDBREAK
            else
                Loc := DT_LEFT or DT_WORDBREAK;
        end
        else
        begin
            if (ACol in [p_SKILLRATE, p_USE]) then
                Loc := DT_CENTER or DT_WORDBREAK
            else
                Loc := DT_LEFT or DT_WORDBREAK;
        end;
        DrawText(Handle, PChar((Sender as TStringGrid).Cells[ACol, ARow]), -1, Rect, Loc);
    end;
end;

{
procedure TRegForm.E_frDutyDateKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key = VK_F1 then
         Cal1.Click;
end;
}{
procedure TRegForm.Cal1Click(Sender: TObject);
var
  MonthForm : TMonthForm;
  TempDate : TPePanelEdit;
begin
    if TComponent(Sender).Tag = 1 then
        TempDate := E_frDutyDate
    else
        TempDate := E_toDutyDate;
  Try
    MonthForm := TMonthForm.Create(Self);
    if Length(TempDate.Text) = 6 then
        MonthForm.rDayCaption := TempDate.Text
    else
        MonthForm.rDayCaption := FormatDateTime('YYYYMM',date);
    MonthForm.ShowModal;

    TempDate.Text := MonthForm.DayCaption;
//==============================================================================//
// 03.09    2002.04.02      손종운  직무경력 Update 대상기간  제한   전산처리요청서: 2002-2456호
//==============================================================================//
////==============================================================================//
//// 03.09    2002.04.02      손종운  직무경력 Update 대상기간  제한   전산처리요청서: 2002-2456호
////==============================================================================//
////    if copy(MainForm.PSysdate,1,4) = copy(TempDate.Text, 1, 4) then
//    if (copy(MainForm.PSysdate,1,4) = copy(TempDate.Text, 1, 4)) or
//       (E_toDutyDate.text = '') then    //2002.04.02 shm   null 일경우 추가
//      fzSetBtn(True)
//    else
//      fzSetBtn(False);
////==============================================================================//
  Finally
    MonthForm.Free;
  End;
end;
}{
procedure TRegForm.E_toDutyDateKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key = VK_F1 then
         Cal2.Click;
end;
}
procedure TRegForm.OB_DutyClick(Sender: TObject);
var
  sTemp: String;
  bTemp: Boolean;
begin
  if OB_Duty.Enabled then
    OB_Duty.SetFocus;

  TRY
    DutyForm := TDutyForm.Create(Self);
    DutyForm.Caption := '[직무선택]';
    DutyForm.pJobField := L_JobField.Hint;
    DutyForm.pDUTYKIND := L_DutyKind.Hint;
    sTemp := L_Jobfield.Hint+L_Dutykind.Hint+L_Duty.Hint;
    DutyForm.ShowModal;

    bTemp := DutyForm.SELECT_YN;

    if DutyForm.SELECT_YN then
    begin
        // E_Duty.Text         := DutyForm.pJobFieldNAME+'/'+DutyForm.pDUTYKINDNAME+'/'+DutyForm.pDUTYNAME;
        L_JobField.Caption  := DutyForm.pJobFieldNAME;
        L_JobField.Hint     := DutyForm.pJobField;
        L_DutyKind.Caption  := DutyForm.pDUTYKINDNAME;
        L_DutyKind.Hint     := DutyForm.pDUTYKIND;
        L_Duty.Caption      := DutyForm.pDUTYNAME;
        L_Duty.Hint         := DutyForm.pDUTY;

    end;

  FINALLY
    DutyForm.Free;
  END;

    if sTemp <> L_Jobfield.Hint+L_Dutykind.Hint+L_Duty.Hint then
        NewMas(False);

    if (bTemp = True) and (E_DutyTermRate.Enabled) then
        E_DutyTermRate.SetFocus
    else if (OB_Duty.Enabled) then
        OB_Duty.SetFocus;
end;

procedure TRegForm.E_DutyTermRateKeyPress(Sender: TObject; var Key: Char);
begin
    if (Key = #13) and (OB_DutyText.Enabled) then
      OB_DutyText.SetFocus;
end;

procedure TRegForm.E_DutyTermRateExit(Sender: TObject);
begin
  TRY
    if (E_DutyTermRate.Value > 100) or
       (E_DutyTermRate.Value < 0)   then
    begin
       MessageDlg('"비중"은 0 ~ 100 사이 값만 넣을 수 있습니다.' ,mtError,[mbOK],0);
       E_DutyTermRate.SetFocus;
       Exit;
    end;
  EXCEPT
    MessageDlg('"비중"은 0 ~ 100 사이 값만 넣을 수 있습니다.' ,mtError,[mbOK],0);
    E_DutyTermRate.SetFocus;
    System.Exit;
  END;
end;

procedure TRegForm.OB_DutytextClick(Sender: TObject);
var
  bTemp: Boolean;
begin
    OB_DutyText.SetFocus;
  Try
    SubForm := TSubForm.Create(Self);
    SubForm.RTN_Text := L_DutyText;
    SubForm.RTN_Memo := Memo_SubDutyText;
    SubForm.ShowModal;

    bTemp := SubForm.SELECT_YN;
    if SubForm.SELECT_YN then
        SUBDUTY_ON := True;

  Finally
    SubForm.Free;
  End;

    if bTemp = True then
        OB_DutyLevel.SetFocus;
end;

procedure TRegForm.OB_DutyLevelClick(Sender: TObject);
var
  bTemp: Boolean;
begin
    OB_DutyLevel.SetFocus;

  TRY
    LevelForm := TLevelForm.Create(self);
    LevelForm.ShowModal;

    bTemp := LevelForm.SELECT_YN;
    if LevelForm.SELECT_YN then
    begin
        // E_DutyLevel.Text    := LevelForm.DutyLevel.Text;
        L_DutyLevel.Caption := LevelForm.DutyLevel.Text;
        L_DutyLevel.Hint    := LevelForm.DutyLevel.Hint;
    end;

  FINALLY
    LevelForm.Free;
  END;

    if bTemp = True then
        OB_Paycl.SetFocus;
end;

procedure TRegForm.OB_PayclClick(Sender: TObject);
begin
    OB_Paycl.SetFocus;

  TRY
    PayClForm := TPayClForm.Create(self);
    PayClForm.Caption := '[BAND열람]';
    PayClForm.JOB_KIND := 1;
    PayClForm.ShowModal;

    if PayClForm.Check then
    begin
        // E_Paycl.Text    := PayClForm.CodeName;
        L_Paycl.Caption := PayClForm.CodeName;
        L_Paycl.Hint    := PayClForm.Code;
    end;

  FINALLY
    PayClForm.Free;
  END;
end;

procedure TRegForm.SaveBtnClick(Sender: TObject);
var
   i{, iTempChk}, iDutyno, iTemp: Integer;
   sInsUpd, SQLText: String;
begin
    sInsUpd := '';
    ON_ERROR := False;
    { 입력 데이터 오류 Check }
    E_frDutyDateExit(Sender);
    if Check = False then
    begin
        ON_ERROR := True;
        System.Exit;
    end;
    E_toDutyDateExit(Sender);
    if Check = False then
    begin
        ON_ERROR := True;
        System.Exit;
    end;

    if Trim(L_JobField.Caption) = '' then
    begin
        MessageDlg('업무분야를 입력하십시오.',mtError,[mbOK],0);
        OB_Duty.SetFocus;
        ON_ERROR := True;
        System.Exit;
    end;

    if Trim(L_DutyKind.Caption) = '' then
    begin
        MessageDlg('직종을 입력하십시오.',mtError,[mbOK],0);
        OB_Duty.SetFocus;
        ON_ERROR := True;
        System.Exit;
    end;

    if Trim(L_Duty.Caption) = '' then
    begin
        MessageDlg('직무를 입력하십시오.',mtError,[mbOK],0);
        OB_Duty.SetFocus;
        ON_ERROR := True;
        System.Exit;
    end;

    if (E_DutyTermRate.Value < 1) or (E_DutyTermRate.Value > 100) then
    begin
        MessageDlg('비중을 입력하십시오.',mtError,[mbOK],0);
        E_DutyTermRate.SetFocus;
        ON_ERROR := True;
        System.Exit;
    end;

    if Trim(L_DutyText.Caption) = '' then
    begin
        MessageDlg('직무내용(광의)을 입력하십시오.',mtError,[mbOK],0);
        OB_DutyText.SetFocus;
        ON_ERROR := True;
        Exit;
    end;

    if Trim(L_DutyLevel.Caption) = '' then
    begin
        MessageDlg('직무수준을 입력하십시오.',mtError,[mbOK],0);
        OB_DutyLevel.SetFocus;
        ON_ERROR := True;
        Exit;
    end;

    if Trim(L_Paycl.Caption) = '' then
    begin
        MessageDlg('BAND를 입력하십시오.',mtError,[mbOK],0);
        OB_Paycl.SetFocus;
        ON_ERROR := True;
        System.Exit;
    end;

    if StrToIntDef(Trim(P_DutyYY.ValueCaption),0) > 99 then
    begin
        MessageDlg('근무기간 이상',mtError,[mbOK],0);
        E_frDutyDate.SetFocus;
        ON_ERROR := True;
        System.Exit;
    end;

    //유효성 추가--> 손필영대리 요청  하은영
    //if E_toDutyDate.Text = '200412' then   //2004년 12월로 입력하믄 현재로..
    //  E_toDutyDate.Text := '';

    //2015.03.09.hjku.. 이전 최종 자료 종료를 입력 추가... 이명노M 요청
    if not(check_pre_duty()) then
    begin
       //하단에서 체크하기 때문에 여기에선 일단 체크안함..
    end;

    SQLText:= Format(
          'SELECT count(empno) cnt FROM pishrmas         '+
          'WHERE empno = ''%s''                          '+
          '  AND frdutydate = ''%s''                       '+
          '  AND NVL(todutydate,''0'') = NVL(''%s'',''0'') '+
          '  AND jobfield = ''%s''                       '+
          '  AND dutykind = ''%s''                       '+
//==============================================================================//
// 03.26    2003.03.07      손종운      버그수정    -- 추가
//==============================================================================//
//유효성 수정
//          '  AND dutytext = ''%s''                       '+
          '  AND dutyno = ''%s''                       '+
//==============================================================================//
          '  AND duty = ''%s''                           ',
          [gsEmpno, E_frDutyDate.Text, E_toDutyDate.Text,
           L_Jobfield.Hint, L_Dutykind.Hint,
//==============================================================================//
// 03.26    2003.03.07      손종운      버그수정    -- 추가
//==============================================================================//
//유효성 수정
//           L_Dutytext.caption,
           SG_Mas.Cells[m_DUTYNO , SG_Mas.Row],
//==============================================================================//
           L_Duty.Hint]);

    MainForm.TCsel.Close;
    MainForm.TCsel.ClearFieldInfo;
    MainForm.TCsel.AddField('CNT', ftInteger, 300);
    MainForm.TCsel.SQL.Text := SQLText;
    MainForm.TCsel.ServiceName := 'PIT1030A_SEL1';
    MainForm.TCsel.Open;

    if MainForm.TCsel.FieldByName('CNT').AsInteger > 0 then
        sInsUpd := 'U'
    else
        sInsUpd := 'I';

    SQLText:= Format(
          'SELECT nvl(SUM(dutytermrate),''0'') sum_rate FROM pishrmas '+
          'WHERE empno = ''%s''                            '+
          '  AND frdutydate = ''%s''                       '+
          '  AND NVL(todutydate,''0'') = NVL(''%s'',''0'') ',
          [gsEmpno, E_frDutyDate.Text, E_toDutyDate.Text]);

    MainForm.TCsel.Close;
    MainForm.TCsel.ClearFieldInfo;
    MainForm.TCsel.AddField('SUM_RATE', ftInteger, 300);
    MainForm.TCsel.SQL.Text := SQLText;
    MainForm.TCsel.ServiceName := 'PIT1030A_SEL1';
    MainForm.TCsel.Open;

    iTemp := MainForm.TCsel.FieldByName('SUM_RATE').AsInteger;

    // 100% 초과여부
    if sInsUpd = 'I' then // 엡력인경우
        iTemp := iTemp + StrToIntDef(E_DutyTermRate.Text, 0)
    else
        iTemp := iTemp + StrToIntDef(E_DutyTermRate.Text, 0) - StrToIntDef(SG_Mas.Cells[m_DUTYTERMRATE,SG_Mas.Row],0);

    if iTemp > 100 then
    begin
        MessageDlg('동일기간내에서 비중 합계는 100%를 초과할 수 없습니다.',mtError,[mbOK],0);
        E_DutyTermRate.SetFocus;
        ON_ERROR := True;
        Exit;
    end;

    // 기간중복여부
    if (sInsUpd = 'I') and (E_frDutyDate.Enabled = True) then // 신규기간에 대하여 입력인 경우만
    begin
        SQLText:= Format(
              'SELECT count(empno) cnt FROM pishrmas                              '+
              'WHERE empno = ''%s''                                               '+
              '  AND TO_DATE(LEAST(NVL(TODUTYDATE,''999912''),NVL(''%s'',''999912''))||''02'',''YYYYMMDD'')     '+
              '    - TO_DATE(GREATEST(FRDUTYDATE,''%s'')||''01'',''YYYYMMDD'') > 0 '+
              '  AND NOT (frdutydate = ''%s''                                     '+ // 자신제외
              '           AND NVL(''%s'',''999912'') = NVL(todutydate,''999912''))',
              [gsEmpno,
               E_toDutyDate.Text, E_frDutyDate.Text,
               E_frDutyDate.Text, E_toDutyDate.Text]);

        MainForm.TCsel.Close;
        MainForm.TCsel.ClearFieldInfo;
        MainForm.TCsel.AddField('CNT', ftInteger, 300);
        MainForm.TCsel.SQL.Text := SQLText;
        MainForm.TCsel.ServiceName := 'PIT1030A_SEL1';
        MainForm.TCsel.Open;

        if MainForm.TCsel.FieldByName('CNT').AsInteger > 0 then
        begin
            MessageDlg('기간중복되는 자료가 있습니다.',mtError,[mbOK],0);
            E_frDutyDate.SetFocus;
            ON_ERROR := True;
            Exit;
        end;
    end;

    //유효성 추가 start
    if iTemp < 100 then
    begin
      MessageDlg('동일기간내 직무비중의 합은 100%이어야 합니다. '+#13+
                 '비중을 수정하거나, 직무를 추가하여 주시기 바랍니다. ', mtInformation, [mbOK], 0);
    end;
    //유효성 추가 end

    // 저장작업
    if sInsUpd = 'I' then // 직무 입력
    begin
        { 인적자원 마스터 저장}
        SQLText:= Format(
              'SELECT nvl(MAX(dutyno),0) + 1 DUTYNO  FROM pishrmas  ' +
              'WHERE empno = ''%s''      ' ,
              [gsEmpno]);

        MainForm.TCsel.Close;
        MainForm.TCsel.ClearFieldInfo;
        MainForm.TCsel.AddField('DUTYNO', ftInteger, 300);
        MainForm.TCsel.SQL.Text := SQLText;
        MainForm.TCsel.ServiceName := 'PIT1030A_SEL1';
        MainForm.TCsel.Open;
        MainForm.TCsel.Open;

        iDutyno := MainForm.TCsel.FieldByName('DUTYNO').AsInteger;
        MainForm.TCsel.Close;

        SQLText := Format(
                   'INSERT INTO PISHRMAS ' +
                   ' (empno, dutyno, korname, '+
                   '  JobField, dutykind, duty, '+
                   '  orgnum, deptcode, payra, paycl, '+
                   '  dutytext, '+
                   '  frdutydate, todutydate, dutyyy, dutymm, '+
                   '  dutytermrate, dutylevel, '+
                   '  writeemp, writetime) '+
                   ' VALUES (''%s'',%d,''%s'', '+
                   '         ''%s'',''%s'',''%s'', '+
                   '         ''%s'',''%s'',''%s'',''%s'', '+
                   '         ''%s'', '+
                   '         ''%s'',''%s'',%s , %s, '+
                   '         %s,''%s'',  '+
                   '         ''%s'',TO_CHAR(SYSDATE, ''YYYYMMDDHH24MISS'')) ',
                   [gsEmpno,      iDutyno,             MainForm.pKorname,
                    L_JobField.Hint,      L_DutyKind.Hint,     L_Duty.Hint,
                    MainForm.pOrgnum,     MainForm.pDeptCode,  MainForm.pPayra,     L_Paycl.Hint,
                    replace(L_DutyText.Caption,'''','`'), // kpaylib.replace
                    E_frDutyDate.Text,    E_toDutyDate.Text,   P_DutyYY.ValueCaption,    P_DutyMM.ValueCaption,
                    E_DutyTermRate.Text,  L_DutyLevel.Hint,
                    MainForm.wEmpno]);

        MainForm.TDml.Close;
        MainForm.TDml.Sql.Clear;
        MainForm.TDml.Sql.Text := SQLText;
        MainForm.TDml.ServiceName := 'PIT1030A_DML';
        if NOT MainForm.TDml.Execute then System.Exit;
    end
    else //직무 저장
    begin
        iDutyno := StrToInt(SG_Mas.Cells[m_DUTYNO , SG_Mas.Row]);

        SQLText := Format(
                   'UPDATE  PISHRMAS  SET    ' +
                   ' korname = ''%s'' ,      ' +
                   ' JobField = ''%s'' ,     ' +
                   ' dutykind = ''%s'' ,     ' +
                   ' duty = ''%s'' ,         ' +
                   ' orgnum = ''%s'' ,       ' +
                   ' deptcode = ''%s'' ,     ' +
                   ' payra = ''%s'' ,        ' +
                   ' paycl = ''%s'' ,        ' +
                   ' dutytext = ''%s'' ,     ' +
                   ' frdutydate = ''%s'' ,   ' +
                   ' todutydate = ''%s'' ,   ' +
                   ' dutyyy = %s ,           ' +
                   ' dutymm = %s ,           ' +
                   ' dutytermrate = ''%s'' , ' +
                   ' dutylevel = ''%s'' ,    ' +
                   ' writeemp = ''%s'' ,     ' +
                   ' writetime = TO_CHAR(SYSDATE, ''YYYYMMDDHH24MISS''), ' +
                   ' conyn     = null , '+
                   //2015.03.12.hjku.. 결재일자, 결재자, 상신일자도 초기화 추가..
                   '  condate  = NULL,                                   '+
                   '  conempno = NULL,                                   '+
                   '  FINDATE  = NULL,                                   '+
                   ' finyn     = null   '+
                   'WHERE empno = ''%s''     ' +
                   '  AND dutyno = %d        ' ,
                   [MainForm.pKorname,                 L_JobField.Hint,
                    L_DutyKind.Hint,                   L_Duty.Hint,
                    MainForm.pOrgnum,                  MainForm.pDeptCode,
                    MainForm.pPayra,                   L_Paycl.Hint,
                    replace(L_DutyText.Caption,'''','`'), E_frDutyDate.Text, //kpaylib.replace
                    E_toDutyDate.Text,                 P_DutyYY.ValueCaption,
                    P_DutyMM.ValueCaption,                  E_DutyTermRate.Text,
                    L_DutyLevel.Hint,                  MainForm.wEmpno,
                    gsEmpno,                   iDutyno]);

        MainForm.TDml.Close;
        MainForm.TDml.Sql.Clear;
        MainForm.TDml.Sql.Text := SQLText;
        MainForm.TDml.ServiceName := 'PIT1030A_DML';
        if NOT MainForm.TDml.Execute then Exit;
    end;

    //Title.Caption := '개인별 직무 수정';

    if SUBDUTY_ON then
    begin
        SQLText := Format('DELETE FROM pishrsub   '+
                          'WHERE empno   = ''%s'' '+
                          '  AND dutyno  = %d     ', [gsEmpno, iDutyno]);

        MainForm.TDml.Close;
        MainForm.TDml.Sql.Clear;
        MainForm.TDml.Sql.Text := SQLText;
        MainForm.TDml.ServiceName := 'PIT1030A_DML';
        if NOT MainForm.TDml.Execute then
        begin
           MessageDlg('"상세직무" 삭제 작업 중 에러가 발생하였습니다.'+#13 +
                      '관리자에게 문의하십시오' ,mtError,[mbOK],0);
           System.Exit;
        end;

        { 직무 내용 (협의) 저장}
        for i := 0 to Memo_SubDutyText.Lines.Count -1 do
        begin
            if trim(Memo_SubDutyText.Lines[i]) <> '' then
            begin
                SQLText := Format(
                    'INSERT INTO PISHRSUB ' +
                    ' (empno, dutyno, subdutyno, subdutytext, writeemp, writetime) '+
                    ' VALUES (''%s'',%d, %d,''%s'',''%s'',TO_CHAR(SYSDATE, ''YYYYMMDDHH24MISS'')) ',
                    [gsEmpno, iDutyno, i, replace(Memo_SubDutyText.Lines[i],'''','`'), MainForm.wEmpno]); // kpaylib.replace

                MainForm.TDml.Close;
                MainForm.TDml.Sql.Clear;
                MainForm.TDml.Sql.Text := SQLText;
                MainForm.TDml.ServiceName := 'PIT1030A_DML';
                if NOT MainForm.TDml.Execute then Exit;
            end;
        end;
    end;

    MessageDlg('저장 작업이 성공적으로 완료되었습니다.', mtInformation,[mbOK],0);
    SUBDUTY_ON := FALSE;
    RESET_ON  := TRUE;

    fzSetKeyBts(False);

    SET_GRID_Mas(gsEmpno, E_frDutyDate.Text, E_toDutyDate.Text);
    Get_MasCont(Memo_SubDutyText, SG_Mas);

    OB_Duty.SetFocus;
end;

procedure TRegForm.DeleteBtnClick(Sender: TObject);
var
  SQL: String;
  iDutyno: Integer;
begin
    if SG_Mas.Cells[0,SG_Mas.Row] = '' then Exit;

    iDutyno := StrToInt(SG_Mas.Cells[m_DUTYNO, SG_Mas.Row]);
    if MessageDlg(' "'+SG_Mas.Cells[m_DutyNM, SG_Mas.Row] + '"인 직무를 삭제하시겠습니까? ',
                  mtInformation,[mbYes, mbNo],0) = mrNo then Exit;

    SQL := Format( 'DELETE FROM pishrsub   '+
                   'WHERE empno   = ''%s'' '+
                   '  AND dutyno  = %d     ', [gsEmpno, iDutyno]);

    MainForm.TDml.Close;
    MainForm.TDml.Sql.Clear;
    MainForm.TDml.Sql.Text := SQL;
    MainForm.TDml.ServiceName := 'PIT1030A_DML';
    if NOT MainForm.TDml.Execute then
    begin
       MessageDlg('"상세직무" 삭제 작업 중 에러가 발생하였습니다.'+#13 +
                  '관리자에게 문의하십시오..' ,mtError,[mbOK],0);
       System.Exit;
    end;

    SQL := Format('DELETE FROM pishrmas    '+
                   'WHERE empno   = ''%s'' '+
                   '  AND dutyno  = %d     ', [gsEmpno, iDutyno]);
    MainForm.TDml.Close;
    MainForm.TDml.Sql.Clear;
    MainForm.TDml.Sql.Text := SQL;
    MainForm.TDml.ServiceName := 'PIT1030A_DML';
    if NOT MainForm.TDml.Execute then
    begin
       MessageDlg('"직무" 삭제 작업 중 에러가 발생하였습니다.'+#13 +
                  '관리자에게 문의하십시오..' ,mtError,[mbOK],0);
       System.Exit;
    end;

    // 마스터에 자료가 없으면 전체 테이블 자료 제거
    // SQL := Format('SELECT Count(*) cnt FROM PISHRMAS  WHERE empno = ''%s'' ' , [MainForm.Pempno]);
    //
    // Csel_SQL := SQL;
    // Csel_Open;
    // if not Csel_ret then
    // begin
    //   Messagedlg('APP-Server Error : ' + Csel.ServiceName + #13 +
    //              '[' + Csel.HeaderInfo.ErrCode + '] ' + Csel.HeaderInfo.ErrMSG
    //              ,mtError,[mbOK],0);
    //   Exit;
    // end;
    //
    // if strtoint(TuxCDM.Csel_gfd(1)) < 1 then
    // begin
    //     SQL := Format('DELETE FROM pishrspec   '+
    //                    'WHERE empno   = ''%s'' ', [MainForm.pEmpno]);
    //     if EXEC_SQL(SQL) = false then
    //     begin
    //        MessageDlg('"프로그램" 삭제 작업 중 에러가 발생하였습니다.'+#13 +
    //                   '관리자에게 문의하십시요..' ,mtError,[mbOK],0);
    //        Exit;
    //     end;
    //
    //     SQL := Format('DELETE FROM pishreqip   '+
    //                    'WHERE empno   = ''%s'' ', [MainForm.pEmpno]);
    //     if EXEC_SQL(SQL) = false then
    //     begin
    //        MessageDlg('"장비" 삭제 작업 중 에러가 발생하였습니다.'+#13 +
    //                   '관리자에게 문의하십시요..' ,mtError,[mbOK],0);
    //        Exit;
    //     end;
    //
    //     SQL := Format('DELETE FROM pishrprog   '+
    //                    'WHERE empno   = ''%s'' ', [MainForm.pEmpno]);
    //     if EXEC_SQL(SQL) = false then
    //     begin
    //        MessageDlg('"프로그램" 삭제 작업 중 에러가 발생하였습니다.'+#13 +
    //                   '관리자에게 문의하십시요..' ,mtError,[mbOK],0);
    //        Exit;
    //     end;
    // end;

    fzSGDeleteRow(SG_Mas,SG_Mas.Row); // UpitLib
    MessageDlg('삭제 작업이 성공적으로 완료되었습니다.', mtInformation,[mbOK],0);
    Get_MasCont(Memo_SubDutyText, SG_Mas);

    RESET_ON  := TRUE;
end;


// tabsheet2
procedure TRegForm.B_EqipSaveClick(Sender: TObject);
var
  iCheckExist{, iTemp}: Integer;
  SQLText: String;
begin
    // Check
    if Trim(L_EDet.Hint) = '' then
    begin
        MessageDlg('취급장비를 입력하십시오.',mtError,[mbOK],0);
        OB_Eqip.SetFocus;
        System.Exit;
    end;

    if (StrToIntDef(E_ESkillRate.Text,0) < 1) or (StrToIntDef(E_ESkillRate.Text,0) > 100) then
    begin
        MessageDlg('숙련비중을 입력하십시오.',mtError,[mbOK],0);
        E_ESkillRate.SetFocus;
        System.Exit;
    end;

    if (StrToIntDef(E_EUseYY.Text,0)+StrToIntDef(E_EUseMM.Text,0) < 1) or  (StrToIntDef(E_EUseMM.Text,0) > 11)  then
    begin
        MessageDlg('활용기간 년월을 입력하십시오.',mtError,[mbOK],0);
        E_EUseYY.SetFocus;
        System.Exit;
    end;

    // 입력, 수정 여부 결정
    SQLText:= Format(
          'SELECT Count(Eqipcode) cnt FROM pishrEqip  ' +
          'WHERE empno = ''%s'' AND eqipcode = ''%s'' ' , [gsEmpno, L_EDet.Hint]);

    MainForm.TCsel.Close;
    MainForm.TCsel.ClearFieldInfo;
    MainForm.TCsel.AddField('CNT', ftString, 300);
    MainForm.TCsel.SQL.Clear;
    MainForm.TCsel.SQL.Text := SQLText;
    MainForm.TCsel.ServiceName := 'PIT1030A_SEL1';
    MainForm.TCsel.Open;

    iCheckExist := StrToInt(MainForm.TCsel.FieldByName('CNT').AsString);
    MainForm.TCsel.Close;

    if iCheckExist <= 0 then  // 입력
    begin
        SQLText := Format(
                   'INSERT INTO PISHREQIP                                 '+
                   '  (empno, eqipcode, skillrate, useyy, usemm,          '+
                   '   writeemp, writetime)                               '+
                   'VALUES (''%s'', ''%s'', %s, %s, %s,                   '+
                   '     ''%s'', TO_CHAR(SYSDATE, ''YYYYMMDDHH24MISS''))  ',
                   [gsEmpno, L_EDet.Hint, E_ESkillrate.Text, E_EUseYY.Text, E_EUseMM.Text,
                    MainForm.wEmpno]);

        MainForm.TDml.Close;
        MainForm.TDml.Sql.Clear;
        MainForm.TDml.Sql.Text := SQLText;
        MainForm.TDml.ServiceName := 'PIT1030A_DML';
        if NOT MainForm.TDml.Execute then Exit;
    end
    else  // 저장
    begin
        SQLText := Format(
                   'UPDATE PISHREQIP SET    '+
                   '  skillrate  = %s    ,  '+
                   '  useyy      = %s    ,  '+
                   '  usemm      = %s    ,  '+
                   '  writeemp   = ''%s'',  '+
                   '  writetime  = TO_CHAR(SYSDATE, ''YYYYMMDDHH24MISS'') '+
                   'WHERE empno = ''%s''      '+
                   '  AND eqipcode   = ''%s'' ',
                   [E_ESkillrate.Text, E_EUseYY.Text, E_EUseMM.Text, MainForm.wEmpno,
                    gsEmpno, L_EDet.Hint]);
        MainForm.TDml.Close;
        MainForm.TDml.Sql.Clear;
        MainForm.TDml.Sql.Text := SQLText;
        MainForm.TDml.ServiceName := 'PIT1030A_DML';
        if NOT MainForm.TDml.Execute then Exit;
    end;

    SET_GRID_EqPr(SG_Eqip, 'I711');
    MessageDlg('저장 작업이 성공적으로 완료되었습니다.', mtInformation,[mbOK],0);
    Get_EqipCont(SG_Eqip);

    OB_Eqip.SetFocus;
end;

procedure TRegForm.EqipDelBtnClick(Sender: TObject);
var
  sEqipCode, SQL: String;
begin
    sEqipCode := Trim(SG_Eqip.Cells[e_DETID, SG_Eqip.Row]);

    if sEqipCode <> '' then
    begin

        if MessageDlg('"' + Trim(SG_Eqip.Cells[e_DETNM, SG_Eqip.Row]) + '" 취급장비를 삭제하시겠습니까? '
                      , mtInformation,[mbYes, mbNo],0) = mrNo then Exit;

        SQL := Format( 'DELETE FROM pishreqip  '+
                       'WHERE empno   = ''%s'' '+
                       '  AND eqipcode= %s     ', [gsEmpno, sEqipCode]);

        MainForm.TDml.Close;
        MainForm.TDml.Sql.Clear;
        MainForm.TDml.Sql.Text := SQL;
        MainForm.TDml.ServiceName := 'PIT1030A_DML';
        if NOT MainForm.TDml.Execute then
        begin
           MessageDlg('"취급장비" 삭제 작업 중 에러가 발생하였습니다.'+#13 +
                      '관리자에게 문의하십시오..' ,mtError,[mbOK],0);
           Exit;
        end;

        fzSGDeleteRow(SG_Eqip,SG_Eqip.Row); // UpitLib
        MessageDlg('삭제 작업이 성공적으로 완료되었습니다.', mtInformation,[mbOK],0);
        Get_EqipCont(SG_Eqip);
     end;
end;

// tabsheet 3
procedure TRegForm.OB_EqPrClick(Sender: TObject);
var
  sTemp: String;
  bTemp: Boolean;
begin
  TRY
    CodeForm := TCodeForm.Create(Self);
    if TComponent(Sender).Tag = 1 then
    begin
       CodeForm.CODE_ID := 'I711';
       sTemp := L_EDet.Hint;
       OB_Eqip.SetFocus;
    end
    else
    begin
       CodeForm.CODE_ID := 'I713';
       sTemp := L_PDet.Hint;
       OB_Prog.SetFocus;
    end;
    CodeForm.ShowModal;

    bTemp := CodeForm.SELECT_YN;

    if CodeForm.SELECT_YN = True then
    begin
        if TComponent(Sender).Tag = 1 then
        begin
            // E_Eqip.Text     := CodeForm.pDetNm;
            L_EMain.Caption := CodeForm.pMainNm;
            L_EMain.Hint    := CodeForm.pMainId;
            L_ESub.Caption  := CodeForm.pSubNm;
            L_ESub.Hint     := CodeForm.pSubId;
            L_EDet.Caption  := CodeForm.pDetNm;
            L_EDet.Hint     := CodeForm.pDetId;
        end
        else
        begin
            // E_Prog.Text     := CodeForm.pDetNm ;
            L_PMain.Caption := CodeForm.pMainNm;
            L_PMain.Hint    := CodeForm.pMainId;
            L_PSub.Caption  := CodeForm.pSubNm;
            L_PSub.Hint     := CodeForm.pSubId;
            L_PDet.Caption  := CodeForm.pDetNm;
            L_PDet.Hint     := CodeForm.pDetId;
        end;
    end;

  FINALLY
    CodeForm.Free;
  END;

    if TComponent(Sender).Tag = 1 then
    begin
        if sTemp <> L_EDet.Hint then
            NewEqip(False);
    end
    else
    begin
        if sTemp <> L_PDet.Hint then
            NewProg(False);
    end;

    if bTemp = True then
    begin
        if TComponent(Sender).Tag = 1 then
            E_ESkillrate.SetFocus
        else
            E_PSkillrate.SetFocus;
    end
    else
        if TComponent(Sender).Tag = 1 then
            OB_Eqip.SetFocus
        else
            OB_Prog.SetFocus;
end;

procedure TRegForm.B_ProgSaveClick(Sender: TObject);
var
  iCheckExist{, iTemp}: Integer;
  SQLText: String;
begin
    // Check
    if Trim(L_PDet.Hint) = '' then
    begin
        MessageDlg('취급프로그램를 입력하십시오.',mtError,[mbOK],0);
        OB_Prog.SetFocus;
        System.Exit;
    end;

    if (StrToIntDef(E_PSkillRate.Text,0) < 1) or (StrToIntDef(E_PSkillRate.Text,0) > 100)  then
    begin
        MessageDlg('숙련비중을 입력하십시오.',mtError,[mbOK],0);
        E_PSkillRate.SetFocus;
        System.Exit;
    end;

    if (StrToIntDef(E_PUseYY.Text,0)+StrToIntDef(E_PUseMM.Text,0) < 1) or (StrToIntDef(E_PUseMM.Text,0) > 11) then
    begin
        MessageDlg('활용기간 년월을 입력하십시오.',mtError,[mbOK],0);
        E_PUseYY.SetFocus;
        System.Exit;
    end;

    // 입력, 수정 여부 결정
    SQLText:= Format(
          'SELECT to_char(Count(progcode),''0'') cnt FROM pishrProg  ' +
          'WHERE empno = ''%s'' AND Progcode = ''%s'' ' , [gsEmpno, L_PDet.Hint]);

    MainForm.TCsel.Close;
    MainForm.TCsel.ClearFieldInfo;
    MainForm.TCsel.AddField('CNT', ftString, 300);
    MainForm.TCsel.SQL.Clear;
    MainForm.TCsel.SQL.Text := SQLText;
    MainForm.TCsel.ServiceName := 'PIT1030A_SEL1';
    MainForm.TCsel.Open;

    iCheckExist := StrToInt(MainForm.TCsel.FieldByName('CNT').AsString);
    MainForm.TCsel.Close;

    if iCheckExist <= 0 then  // 입력
    begin
        SQLText := Format(
                   'INSERT INTO PISHRPROG                                 '+
                   '  (empno, progcode, skillrate, useyy, usemm,          '+
                   '   writeemp, writetime)                               '+
                   'VALUES (''%s'', ''%s'', %s, %s, %s,                   '+
                   '     ''%s'', TO_CHAR(SYSDATE, ''YYYYMMDDHH24MISS''))  ',
                   [gsEmpno, L_PDet.Hint, E_PSkillrate.Text, E_PUseYY.Text, E_PUseMM.Text,
                    MainForm.wEmpno]);

        MainForm.TDml.Close;
        MainForm.TDml.Sql.Clear;
        MainForm.TDml.Sql.Text := SQLText;
        MainForm.TDml.ServiceName := 'PIT1030A_DML';
        if NOT MainForm.TDml.Execute then Exit;
    end
    else  // 저장
    begin
        SQLText := Format(
                   'UPDATE PISHRPROG SET    '+
                   '  skillrate  = %s    ,  '+
                   '  useyy      = %s    ,  '+
                   '  usemm      = %s    ,  '+
                   '  writeemp   = ''%s'',  '+
                   '  writetime  = TO_CHAR(SYSDATE, ''YYYYMMDDHH24MISS'') '+
                   'WHERE empno = ''%s''      '+
                   '  AND progcode   = ''%s'' ',
                   [E_PSkillrate.Text, E_PUseYY.Text, E_PUseMM.Text, MainForm.wEmpno,
                    gsEmpno, L_PDet.Hint]);

        MainForm.TDml.Close;
        MainForm.TDml.Sql.Clear;
        MainForm.TDml.Sql.Text := SQLText;
        MainForm.TDml.ServiceName := 'PIT1030A_DML';
        if NOT MainForm.TDml.Execute then Exit;
    end;

    SET_GRID_EqPr(SG_Prog, 'I713');
    MessageDlg('저장 작업이 성공적으로 완료되었습니다.', mtInformation,[mbOK],0);
    Get_ProgCont(SG_Prog);

    OB_Prog.SetFocus;
end;

procedure TRegForm.ProgDelBtnClick(Sender: TObject);
var
  sProgCode, SQL: String;
begin
    sProgCode := Trim(SG_Prog.Cells[p_DETID, SG_Prog.Row]);

    if sProgCode <> '' then
    begin

        if MessageDlg('"' + Trim(SG_Prog.Cells[p_DETNM, SG_Prog.Row]) + '" 취급프로그램을 삭제하시겠습니까? '
                      , mtInformation,[mbYes, mbNo],0) = mrNo then Exit;

        SQL := Format( 'DELETE FROM pishrprog  '+
                       'WHERE empno   = ''%s'' '+
                       '  AND progcode= %s     ', [gsEmpno, sProgCode]);

        MainForm.TDml.Close;
        MainForm.TDml.Sql.Clear;
        MainForm.TDml.Sql.Text := SQL;
        MainForm.TDml.ServiceName := 'PIT1030A_DML';
        if NOT MainForm.TDml.Execute then
        begin
           MessageDlg('"취급프로그램" 삭제 작업 중 에러가 발생하였습니다.'+#13 +
                      '관리자에게 문의하십시오..' ,mtError,[mbOK],0);
           Exit;
        end;

        fzSGDeleteRow(SG_Prog,SG_Prog.Row); // UpitLib
        MessageDlg('삭제 작업이 성공적으로 완료되었습니다.', mtInformation,[mbOK],0);
        Get_ProgCont(SG_Prog);
     end;
end;

procedure TRegForm.NewMas(mAllYN: Boolean);
begin
    if mAllYN = True then
    begin
        // E_Duty.Text           := '';
        L_JobField.Hint       := '';
        L_JobField.Caption    := '';
        L_DutyKind.Hint       := '';
        L_DutyKind.Caption    := '';
        L_Duty.Hint           := '';
        L_Duty.Caption        := '';
    end;
    // E_DutyText.Text       := '';
    E_DutyTermRate.Value   := 0;
    // E_DutyLevel.Text      := '';
    L_DutyLevel.Caption   := '';
    L_DutyLevel.Hint      := '';
    // E_PayCl.Text          := '';
    L_PayCl.Caption       := '';
    L_PayCl.Hint          := '';
    L_DutyText.Caption    := '';
    Memo_SubDutyText.Lines.Clear;

    OB_Duty.SetFocus;
end;

procedure TRegForm.fzSetKeyBts(bEnableYN: Boolean);
begin
    E_frDutyDate.Enabled := bEnableYN;
    E_toDutyDate.Enabled := bEnableYN;
//    Cal1.Enabled := bEnableYN;
//    Cal2.Enabled := bEnableYN;
end;

//==============================================================================//
// 03.09    2002.04.02      손종운  직무경력 Update 대상기간  제한   전산처리요청서: 2002-2456호
//==============================================================================//
procedure TRegForm.fzSetBtn(bEnableYN: Boolean);
begin
//  fzSetKeyBts(bEnableYN);
  OB_Duty.Enabled        := bEnableYN;
  E_DutyTermRate.Enabled := bEnableYN;
  OB_dutytext.Enabled    := bEnableYN;
  OB_DutyLevel.Enabled   := bEnableYN;
  OB_Paycl.Enabled       := bEnableYN;
  SaveBtn.Enabled        := bEnableYN;
  DeleteBtn.Enabled      := bEnableYN;
  NewBtn.Enabled         := bEnableYN;
  BT_BatchJob.Enabled    := bEnableYN;

end;
//==============================================================================//

procedure TRegForm.NewBtnClick(Sender: TObject);
//var
//  i, j: Integer;
begin
    fzSetKeyBts(True);

    E_frDutyDate.Text := '';
    E_toDutyDate.Text := '';
    P_DutyYY.ValueCaption  := '';
    P_DutyMM.ValueCaption  := '';
    P_YY.ValueCaption  := '';
    P_MM.ValueCaption  := '';

    NewMas(True);

    fzSGInitialRow(SG_Mas);
    //유효성 추가
    with MainForm.TDS1 do
      begin
        Close;
        ServiceName := 'HINSA_select';
        //2015.03.09.hjku.. 현재월 넘지 않게 수정..
        //Sql.Text := 'SELECT TO_CHAR(ADD_MONTHS(TO_DATE(MAX(NVL(TODUTYDATE, TO_CHAR(SYSDATE, ''YYYYMM''))),''YYYYMM''),1) , ''YYYYMM'') FRMON, '+
        Sql.Text := 'SELECT LEAST(TO_CHAR(ADD_MONTHS(TO_DATE(MAX(NVL(TODUTYDATE, TO_CHAR(SYSDATE, ''YYYYMM''))),''YYYYMM''),1) , ''YYYYMM''),TO_CHAR(SYSDATE, ''YYYYMM'')) FRMON, '+
                    '       ''FIELD2'', ''FIELD3'', ''FIELD4'', ''FIELD5'' '+
                    '  FROM PISHRMAS                                       '+
                    ' WHERE EMPNO = '''+gsEmpno+'''';
        ClearFieldInfo;
        AddField('FRMON'        , ftString,  100  );
        AddField('FIELD2'       , ftString,  100  );
        AddField('FIELD3'       , ftString,  100  );
        AddField('FIELD4'       , ftString,  100  );
        AddField('FIELD5'       , ftString,  100  );
        Open;

        if Eof and Bof then
          E_frDutyDate.Text := ''
        else
          E_frDutyDate.Text := FieldByName('FRMON').AsString;
      end;
    //유효성
    E_frDutyDate.SetFocus;
end;

procedure TRegForm.NewEqip(mAllYN: Boolean);
begin
    if mAllYN = True then
    begin
        L_EMain.Caption  := '';
        L_EMain.Hint     := '';
        L_ESub.Caption   := '';
        L_ESub.Hint      := '';
        L_EDet.Caption   := '';
        L_EDet.Hint      := '';
    end;
    E_ESkillrate.Text := '0';
    E_EUseYY.Text     := '0';
    E_EUseMM.Text     := '0';

    OB_Eqip.SetFocus;
end;

procedure TRegForm.NewProg(mAllYN: Boolean);
begin
    if mAllYN = True then
    begin
        L_PMain.Caption  := '';
        L_PMain.Hint     := '';
        L_PSub.Caption   := '';
        L_PSub.Hint      := '';
        L_PDet.Caption   := '';
        L_PDet.Hint      := '';
    end;
    E_PSkillrate.Text := '0';
    E_PUseYY.Text     := '0';
    E_PUseMM.Text     := '0';

    OB_Prog.SetFocus;
end;

procedure TRegForm.SG_EqipClick(Sender: TObject);
begin
    SG_Eqip.SetFocus;
    Get_EqipCont(SG_Eqip);
end;

procedure TRegForm.SG_ProgClick(Sender: TObject);
begin
    SG_Prog.SetFocus;
    Get_ProgCont(SG_Prog);
end;

procedure TRegForm.E_PayclExit(Sender: TObject);
begin
    OB_Duty.SetFocus;
end;

procedure TRegForm.SG_MasClick(Sender: TObject);
begin
    Get_MasCont(Memo_SubDutyText, SG_Mas);
end;

procedure TRegForm.E_ESkillrateKeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #13 then E_EUseYY.SetFocus;
end;

procedure TRegForm.E_EUseYYKeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #13 then E_EUseMM.SetFocus;
end;

procedure TRegForm.E_PSkillRateKeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #13 then E_PUseYY.SetFocus;
end;

procedure TRegForm.E_PUseYYKeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #13 then E_PUseMM.SetFocus;
end;

procedure TRegForm.ExitBtnClick(Sender: TObject);
//var
//  sTemp: String;
begin
    //if PageControl1.ActivePage = TS_Duty then
    //     sTemp := ' 직무 등록작업을 종료하시겠습니까? '
    //else if PageControl1.ActivePage = TS_Eqip then
    //     sTemp := ' 취급장비 등록작업을 종료하시겠습니까? '
    //else
    //     sTemp := ' 취급프로그램 등록작업을 종료하시겠습니까? ';

//    if MessageDlg(' 저장하지 않은 데이타는 손실될 수 있습니다.'+#13+
//                  ' 그래도 종료하시겠습니까? ', mtInformation,[mbYes, mbNo],0) = mrNo then
//        System.Exit;

  MainForm.TDS1.Close;
  MainForm.TDS1.ServiceName := 'HINSA_select';

  MainForm.TDS1.Sql.Text := ' SELECT sum(DUTYTERMRATE) rate, '''' F2,  '''' F3, '''' F4, '''' F5'+
                            '  from pishrmas a, pimpmas b         '+
                            ' WHERE a.empno    = '''+gsEmpno+''' '+
                            '   and a.empno    = b.empno          '+
                            '   and a.orgnum   = b.orgnum         '+
                            '   and a.deptcode = b.deptcode       ';


  MainForm.TDS1.ClearFieldInfo;
  MainForm.TDS1.AddField('rate' , ftString, 100);
  MainForm.TDS1.AddField('F2' , ftString, 100);
  MainForm.TDS1.AddField('F3' , ftString, 100);
  MainForm.TDS1.AddField('F4' , ftString, 100);
  MainForm.TDS1.AddField('F5' , ftString, 100);
  MainForm.TDS1.Open;

  if MainForm.TDS1.FieldByName('rate').AsString < '100' Then
  begin
    MessageDlg('모든 직무경력을 저장 하시기 바랍니다.' ,mtInformation,[mbOK],0);
    System.Exit;
  end
  Else Close;
end;

procedure TRegForm.Pages_Click(Sender: TObject);
begin
{    (Sender as TPanel).SetFocus;
    Page_Duty.BevelInner := bvRaised;
    Page_Duty.BevelOuter := bvRaised;
    Page_Eqip.BevelInner := bvRaised;
    Page_Eqip.BevelOuter := bvRaised;
    Page_Prog.BevelInner := bvRaised;
    Page_Prog.BevelOuter := bvRaised;

    (Sender as TPanel).BevelInner := bvLowered;
    (Sender as TPanel).BevelOuter := bvLowered;
}
end;

procedure TRegForm.E_frDutyDateExit(Sender: TObject);
var
  frDate: Double;
begin
    Check := False;

    if Trim(E_frDutyDate.Text) <> '' then
    begin
        MainForm.fnSetVariable(2);
        if Length(Trim(E_frDutyDate.Text)) < 6 then
        begin
            MessageDlg('잘못된 날짜 입력입니다.' +#13 + '확인 후 다시입력하십시오.',mtError,[mbOK],0);
            E_frDutyDate.SetFocus;
            Exit;
        end;

        if copy(MainForm.pSysdate,1,6) <  Trim(E_frDutyDate.Text) then
        begin
            MessageDlg('시작월이 현재월보다 큽니다. 다시 입력하십시오',mtError,[mbOK],0);
            E_frDutyDate.SetFocus;
            Exit;
        end;

        TRY
          frDate := kpaylib.to_date(E_frDutyDate.Text,'YYYYMM');
        EXCEPT
          MessageDlg('잘못된 날짜 입력입니다.' +#13 + '확인 후 다시입력하십시오.',mtError,[mbOK],0);
          E_frDutyDate.SetFocus;
          Exit;
        END;
//==============================================================================//
// 03.09    2002.04.02      손종운  직무경력 Update 대상기간  제한   전산처리요청서: 2002-2456호
//==============================================================================//
////==============================================================================//
//// 03.09    2002.04.02      손종운  직무경력 Update 대상기간  제한   전산처리요청서: 2002-2456호
////==============================================================================//
//        if (copy(MainForm.PSysdate,1,4) = copy(E_frDutyDate.Text, 1, 4)) or
//           (E_toDutyDate.text = '') then    //2002.04.02 shm   null 일경우 추가
//          fzSetBtn(True)
//        else
//          fzSetBtn(False);
////==============================================================================//
        Check := True;
    end;
end;

procedure TRegForm.E_toDutyDateExit(Sender: TObject);
var
  frDate, toDate: Double;
  iTempYYMM: Integer;
begin
    Check := False;

    MainForm.fnSetVariable(2);
    if copy(MainForm.PSysdate,1,6) <  Trim(E_toDutyDate.Text) then
    begin
        MessageDlg('종료월이 현재월보다 큽니다. 다시 입력하십시오',mtError,[mbOK],0);
        E_toDutyDate.SetFocus;
        Exit;
    end;

    if Trim(E_toDutyDate.Text) = '' then
    begin
        iTempYYMM := Months_Between(E_frDutyDate.Text, Copy(MainForm.pSysDate,1,6))+1;  // datelib

        P_YY.ValueCaption     := IntToStr(iTempYYMM div 12);
        P_MM.ValueCaption     := IntToStr(iTempYYMM mod 12);
        P_DutyYY.ValueCaption := '0';
        P_DutyMM.ValueCaption := '0';
    end
    else
    begin
        if Length(Trim(E_toDutyDate.Text)) < 6 then
        begin
            MessageDlg('잘못된 날짜 입력입니다.' +#13 + '확인 후 다시입력하십시오.',mtError,[mbOK],0);
            E_toDutyDate.SetFocus;
            Exit;
        end;

        if (E_frDutyDate.Text > E_toDutyDate.Text) then
        begin
            MessageDlg('시작월이 종료월보다 큽니다. 다시 입력하십시오',mtError,[mbOK],0);
            E_frDutyDate.SetFocus;
            Exit;
        end;

      TRY
        frDate := kpaylib.to_date(E_frDutyDate.Text,'YYYYMM');
        toDate := kpaylib.to_date(E_toDutyDate.Text,'YYYYMM');
      EXCEPT
        MessageDlg('잘못된 날짜 입력입니다.' +#13 + '확인 후 다시입력하십시오.',mtError,[mbOK],0);
        E_toDutyDate.SetFocus;
        Exit;
      END;

        iTempYYMM := Months_Between(E_frDutyDate.Text, Copy(E_toDutyDate.Text,1,6))+1;  // datelib

        P_YY.ValueCaption     := IntToStr(iTempYYMM div 12);
        P_MM.ValueCaption     := IntToStr(iTempYYMM mod 12);
        P_DutyMM.ValueCaption := P_MM.ValueCaption;
        P_DutyYY.ValueCaption := P_YY.ValueCaption;

    end;

//==============================================================================//
// 03.09    2002.04.02      손종운  직무경력 Update 대상기간  제한   전산처리요청서: 2002-2456호
//==============================================================================//
//    if (copy(MainForm.PSysdate,1,4) = copy(E_toDutyDate.Text, 1, 4)) or
//       (E_toDutyDate.text = '') then    //2002.04.02 shm   null 일경우 추가
//      fzSetBtn(True)
//    else
//    begin
//      fzSetBtn(False);
////      E_frDutyDate.SetFocus; 2002.04.03 shm cannot focus error...
//    end;
//
////==============================================================================//

    Check := True;
end;

procedure TRegForm.BT_BatchjobClick(Sender: TObject);
var
   SQLText: String;
   sChageFrDate, sChageToDate: String;
begin
  if E_frDutyDate.Enabled then
    begin
        MessageDlg('신규 직무기간 입력중에는 일괄갱신 할 수 없습니다.',mtError,[mbOK],0);
        Exit;
    end;

  TRY
    BatchForm := TBatchForm.Create(Self);
    BatchForm.gsEmpno    := gsEmpno;
    BatchForm.gsInFrDate := E_frDutyDate.Text;
    BatchForm.gsInToDate := E_toDutyDate.Text;
    BatchForm.ShowModal;

    if BatchForm.gbOk = False then
        System.Exit
    else
    begin
        sChageFrDate  := BatchForm.gsOutFrDate;
        sChageToDate  := BatchForm.gsOutToDate;
    end;

  FINALLY
    BatchForm.Free;
  END;

  //if E_toDutyDate.Text = '200412' then
  //  E_toDutyDate.Text := '';  하은영

    SQLText := Format(
               'UPDATE  PISHRMAS  SET     '+
               '  frdutydate = ''%s'' ,   '+
               '  todutydate = ''%s'' ,   '+
               '  writeemp   = ''%s'' ,   '+
               '  writetime  = TO_CHAR(SYSDATE, ''YYYYMMDDHH24MISS''), ' +
               '  conyn      = null ,     '+
               //2015.03.12.hjku.. 결재일자, 결재자, 상신일자도 초기화 추가..
               '  condate    = NULL,      '+
               '  conempno   = NULL,      '+
               '  FINDATE    = NULL,      '+
               '  finyn      = null       '+
               'WHERE empno  = ''%s''     '+
               '  AND frdutydate = ''%s'' '+
               '  AND NVL(todutydate,''0'') = NVL(''%s'',''0'') ',
               [sChageFrDate, sChageToDate, MainForm.wEmpno,
                gsEmpno, E_frDutyDate.Text, E_toDutyDate.Text]);

    MainForm.TDml.Close;
    MainForm.TDml.Sql.Clear;
    MainForm.TDml.Sql.Text := SQLText;
    MainForm.TDml.ServiceName := 'PIT1030A_DML';
    if NOT MainForm.TDml.Execute then Exit;

    MessageDlg('저장 작업이 성공적으로 완료되었습니다.', mtInformation,[mbOK],0);
    SUBDUTY_ON := FALSE;
    RESET_ON  := TRUE;

    fzSetKeyBts(False);

    SET_GRID_Mas(gsEmpno, sChageFrDate, sChageToDate);
    Get_MasCont(Memo_SubDutyText, SG_Mas);

    OB_Duty.SetFocus;
end;

procedure TRegForm.Page_DutyClick(Sender: TObject);
begin
  Page_Duty.BtnDown  := False;
  Page_Eqip.BtnDown  := False;
  Page_Prog.BtnDown  := False;

  TOnSkinButton(Sender).BtnDown := True;

  NoteBook1.ActivePage := 'P_' + IntToStr(TOnSkinButton(Sender).Tag);

  if NoteBook1.ActivePage = 'P_1' then
    begin
        if OB_Duty.Enabled then
          OB_Duty.SetFocus;
        NewBtn.Visible := True;
        BT_Batchjob.Visible := True;
    end
  else if NoteBook1.ActivePage = 'P_2' then
    begin
        if OB_Eqip.Enabled then
          OB_Eqip.SetFocus;
        NewBtn.Visible := False;
        BT_Batchjob.Visible := False;
    end
  else
    begin
        if OB_Prog.Enabled then
          OB_Prog.SetFocus;
        NewBtn.Visible := False;
        BT_Batchjob.Visible := False;
    end;

end;

function TRegForm.check_pre_duty:boolean;
var
   frdate, todate, dutydate : string;
begin
    check_pre_duty := false;

    with MainForm.TDS1 do
    begin
        Close;
        ServiceName := 'HINSA_select';
        Sql.Text := 'SELECT FRDUTYDATE, TODUTYDATE, to_char(ADD_MONTHS(to_date(''' + E_frDutyDate.Text + ''',''YYYYMM''),-1),''YYYYMM'') DUTYDATE,   ' +#13#10 +
                    '       ''FIELD2'', ''FIELD3'', ''FIELD4'', ''FIELD5''                                               ' +#13#10 +
                    '  FROM PISHRMAS                                                                                     ' +#13#10 +
                    ' WHERE EMPNO = '''+gsEmpno+'''                                                                      ' +#13#10 +
                    '   and FRDUTYDATE < ''' + E_frDutyDate.Text + '''                                                   ' +#13#10 +
                    '   and TODUTYDATE is null                                                                           ';
        ClearFieldInfo;
        AddField('FRDUTYDATE'   , ftString,  100  );
        AddField('TODUTYDATE'   , ftString,  100  );
        AddField('DUTYDATE'     , ftString,  100  );
        AddField('FIELD4'       , ftString,  100  );
        AddField('FIELD5'       , ftString,  100  );

        Open;

        if Eof and Bof then
        begin
          check_pre_duty := true;
          system.exit;
        end
        else
        begin
          frdate   := FieldByName('FRDUTYDATE').AsString;
          todate   := FieldByName('TODUTYDATE').AsString;
          dutydate := FieldByName('DUTYDATE').AsString;
        end;
    end;

    if(MainForm.TDS1.RecordCount > 1) then
    begin
        check_pre_duty := false;
        system.exit;
    end;

    if MessageDlg('최종 등록한 직무경력의의 종료일이 등록되지 않았습니다. '+#13#10 +
                  '종료일을 ''' + dutydate + '''로 반영하고 계속 진행하시겠습니까? ',mtConfirmation,[mbYes,mbNo],0) = IDNO then
    begin
        check_pre_duty := false;
        System.Exit;
    end
    else
    begin
        with MainForm.TDml do
        begin
            Close;
            Sql.Clear;
            ServiceName := 'PIT1030A_DML';

            sql.text := 'UPDATE  pishrmas SET                                 '+ #13#10 +
                        '  todutydate = ''' + dutydate + ''' ,                '+ #13#10 +
                        '  writeemp = '''+MainForm.wEmpno+''',                '+ #13#10 +
                        '  writetime = TO_CHAR(SYSDATE, ''YYYYMMDDHH24MISS'') '+ #13#10 +
                        ' WHERE EMPNO = '''+gsEmpno+'''                       '+ #13#10 +
                        '   and FRDUTYDATE =''' + frdate + '''                '+ #13#10 +
                        '   and TODUTYDATE is null                            ';

            if NOT Execute then
            begin
                check_pre_duty := false;
                System.Exit;
            end;
        end;
    end;
end;    

end.
