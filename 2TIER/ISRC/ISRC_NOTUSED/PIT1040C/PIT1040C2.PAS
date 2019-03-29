unit PIT1040C2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Grids, Aligrid, DB, stdctrls, peoutlookbtn, pegradpanl,
  ComCtrls, DBTables, Menus, ComObj, ShellAPI; //OleCtrls,

type
//  tmpGrid = class(TCustomGrid);
  tmpGrid = class(TStringList);

  TSubForm = class(TForm)
    PeJeonGrdPanel2: TPeJeonGrdPanel;
    BExit: TPeJeonOutLookBtn;
    BB_PreView: TPeJeonOutLookBtn;
    BB_Print: TPeJeonOutLookBtn;
    PeJeonOutLookBtn1: TPeJeonOutLookBtn;
    PeJeonOutLookBtn2: TPeJeonOutLookBtn;
    SG_Main: TStringGrid;
    St_Help: TStatusBar;
    Pa_Title: TPeJeonGrdPanel;
    P_OrderBy: TPanel;
    Panel1: TPanel;
    B_AllN: TPeJeonOutLookBtn;
    B_AllY: TPeJeonOutLookBtn;
    CB_Deptname: TCheckBox;
    CB_Empno: TCheckBox;
    CB_Korname: TCheckBox;
    CB_Imaspaycl: TCheckBox;
    CB_Schgrcode: TCheckBox;
    CB_Majorcode: TCheckBox;
    CB_ToeicScore: TCheckBox;
    Label1: TLabel;
    L_OrderByDesc: TLabel;
    Bt_Deptname: TPeJeonOutLookBtn;
    PeJeonOutLookBtn3: TPeJeonOutLookBtn;
    SaveDialog1: TSaveDialog;
    Edit1: TEdit;
    procedure BB_PreViewClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BExitClick(Sender: TObject);
    procedure SG_MainDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormPaint(Sender: TObject);
    procedure B_AllClick(Sender: TObject);
    procedure SG_MainKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Bt_SortingClick(Sender: TObject);
    procedure SG_MainMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CB_Cllick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    gbStart: Boolean;
    giRecordCount: Integer;
    giWhereFrom  : Integer;
    procedure fzInitialForm;
    function  fnGetData(mDS_Main, mDS_Duty, mDS_Eqip, mDS_Prog, mDS_Lice: TQuery): Integer;
    procedure NullEvent(Sender: TObject);
    function  fnGetCntCheckBox: Integer;
    function  fnGetMaxCheckBox: Integer;
    procedure fzSetOrderCheckBox(mCurrent: Integer);
    function  fnGetFindCheckBox(iOrder: Integer): String;
    procedure fzSortingStringGrid(mStringGrid: TStringGrid; L, R: Integer; mArray: Array of TCheckBox);
    function  fnGetSGCells(mStringGrid: TStringGrid; mIndex: Integer; mArray: Array of TCheckBox): String;
    procedure fzOutputExcel(mStringGrid: TStringGrid);
  end;

var
  SubForm: TSubForm;

implementation

{$R *.DFM}

uses
  uMain, PIT1040C0, PIT1040C1, PIT1040C6, PIT1040C7, pit1040c9, UpitLib, kpaylib;

// event
procedure TSubForm.BB_PreViewClick(Sender: TObject);
begin
    // 체크
    //if fnCheckCondition = False then
    //    System.Exit;
    St_Help.Panels[0].Text := '';

    if TPejeonOutLookBtn(Sender).tag < 4 then
    begin
        if SG_Main.Cells[g_SEQNO, SG_Main.FixedRows] = '' then
        begin
            Messagedlg('출력할 자료가 없습니다.',mtInformation,[mbOK],0);
            System.Exit;
        end;
    end
    else
    begin
        if giWhereFrom = 1 then
            gsEmpnoList := MainForm.fnGetRowSG(SG_Main, 7)
        else
            gsEmpnoList := MainForm2.fnGetRowSG(SG_Main, 7);

        if StrToInt(gsEmpnoList) > 254 then
        begin
            MessageDlg(' 출력을 위해 선택한 사원이 너무 많습니다. 다시 선택하여 주십시요.',mtInformation,[mbOk],0);
            System.Exit;
        end;

        if giWhereFrom = 1 then
            gsEmpnoList := MainForm.fnGetRowSG(SG_Main, 5)
        else
            gsEmpnoList := MainForm2.fnGetRowSG(SG_Main, 5);

        if gsEmpnoList = '' then
        begin
            Messagedlg('출력할 대상자가 없습니다. 사번선택란에서 상세출력 대상자를 선택하여 주십시오.',mtInformation,[mbOK],0);
            System.Exit;
        end;

        St_Help.Panels[0].Text := '자료 추출중입니다... 잠시만 기다려 주십시오.';
        Application.ProcessMessages;
        if giWhereFrom = 1 then
        begin
            MainForm.fzOpenDataSets_Det(1, gsEmpnoList);
            MainForm.fzOpenDataSets_Det(2, gsEmpnoList);
            MainForm.fzOpenDataSets_Det(3, gsEmpnoList);
            MainForm.fzOpenDataSets_Det(4, gsEmpnoList);
            MainForm.fzOpenDataSets_Det(5, gsEmpnoList);
            MainForm.fzOpenDataSets_Det(6, gsEmpnoList);
            MainForm.fzOpenDataSets_Det(7, gsEmpnoList);
            MainForm.fzOpenDataSets_Det(8, gsEmpnoList);
            MainForm.fzOpenDataSets_Det(9, gsEmpnoList);
        end
        else
        begin
            MainForm2.fzOpenDataSets_Det(1, gsEmpnoList);
            MainForm2.fzOpenDataSets_Det(2, gsEmpnoList);
            MainForm2.fzOpenDataSets_Det(3, gsEmpnoList);
            MainForm2.fzOpenDataSets_Det(4, gsEmpnoList);
            MainForm2.fzOpenDataSets_Det(5, gsEmpnoList);
            MainForm2.fzOpenDataSets_Det(6, gsEmpnoList);
            MainForm2.fzOpenDataSets_Det(7, gsEmpnoList);
            MainForm2.fzOpenDataSets_Det(8, gsEmpnoList);
            MainForm2.fzOpenDataSets_Det(9, gsEmpnoList);
        end;

        St_Help.Panels[0].Text := '';
        Application.ProcessMessages;
    end;

    if TPejeonOutLookBtn(Sender).tag < 3 then
    begin
        Application.CreateForm(TRptTotal, RptTotal);
      TRY

        RptTotal.gsOrder := L_OrderByDesc.Caption;
        if TPejeonOutLookBtn(Sender).tag = 1 then
            RptTotal.Preview
        else if TPejeonOutLookBtn(Sender).tag = 2 then
            RptTotal.Print;
      FINALLY
        if RptTotal.QRPrinter <> nil then
           RptTotal.QRPrinter.Cleanup;
        RptTotal.free;
      END;
    end
    else if TPejeonOutLookBtn(Sender).tag = 3 then // Excel
    begin
      St_Help.Panels[0].Text := '자료 추출중입니다... 잠시만 기다려 주십시오.';
      fzOutputExcel(SG_Main);
      St_Help.Panels[0].Text := '작업이 완료되었습니다 !!';
    end
    else if TPejeonOutLookBtn(Sender).tag >= 4 then
    begin
        Application.CreateForm(TRptPerDetail, RptPerDetail);
      TRY
        if TPejeonOutLookBtn(Sender).tag = 4 then
            PIT1040C7.RptPerDetail.Preview
        else if TPejeonOutLookBtn(Sender).tag = 5 then
            PIT1040C7.RptPerDetail.Print;

      FINALLY
        if RptPerDetail.QRPrinter <> nil then
           RptPerDetail.QRPrinter.Cleanup;
        RptPerDetail.free;
      END;
    end;

    DM.qryMain.Close;
    DM.qryDuty.Close;
    DM.qryEqip.Close;
    DM.qryLice.Close;
    DM.qryEDU.Close;
    DM.qrySCH.Close;
    DM.qryCARR.Close;
    DM.qryETC.Close;

    St_Help.Panels[0].Text := '작업이 완료되었습니다 !!';
end;

procedure TSubForm.FormCreate(Sender: TObject);
begin
    gbStart := True;
end;

procedure TSubForm.fzInitialForm;
begin
    with SG_Main do
    begin
        RowCount := 2;
        //ColCount := 38;

        Cols[g_CHECK        ].Text := '선택';             ColWidths[g_CHECK        ] := 30;
        Cols[g_SEQNO        ].Text := '연번';             ColWidths[g_SEQNO        ] := 30;
        Cols[g_KORNAME      ].Text := '성명';             ColWidths[g_KORNAME      ] := 50;
        Cols[g_EMPNO        ].Text := '사번';             ColWidths[g_EMPNO        ] := 30;
        Cols[g_ORGNUM       ].Text := '조직차수';         ColWidths[g_ORGNUM       ] := -1;
        Cols[g_DEPTCODE     ].Text := '부서코드';         ColWidths[g_DEPTCODE     ] := -1;
        Cols[g_DEPTNAME     ].Text := '부서명';           ColWidths[g_DEPTNAME     ] := 80;
        Cols[g_IMASPAYCL    ].Text := 'BAND코드';         ColWidths[g_IMASPAYCL    ] := -1;
        Cols[g_IMASPAYCLNM  ].Text := '현BAND';           ColWidths[g_IMASPAYCLNM  ] := 60;
        Cols[g_DUTYNO       ].Text := '직무번호';         ColWidths[g_DUTYNO       ] := -1;
        Cols[g_JOBFIELD     ].Text := '담당업무코드';     ColWidths[g_JOBFIELD     ] := -1;
        Cols[g_JOBFIELDNM   ].Text := '담당업무';         ColWidths[g_JOBFIELDNM   ] := -1;
        Cols[g_DUTYKIND     ].Text := '직종코드';         ColWidths[g_DUTYKIND     ] := -1;
        Cols[g_DUTYKINDNM   ].Text := '직종';             ColWidths[g_DUTYKINDNM   ] := 70;
        Cols[g_DUTY         ].Text := '직무코드';         ColWidths[g_DUTY         ] := -1;
        Cols[g_DUTYNM       ].Text := '직무';             ColWidths[g_DUTYNM       ] := 100;
        Cols[g_DUTYTEXT     ].Text := '(광의) 직무내용';  ColWidths[g_DUTYTEXT     ] := 220;
        Cols[g_FRDUTYDATE   ].Text := '직무시작일';       ColWidths[g_FRDUTYDATE   ] := 70;
        Cols[g_TODUTYDATE   ].Text := '직무종료일';       ColWidths[g_TODUTYDATE   ] := 70;
        Cols[g_DUTYTERM     ].Text := '종사기간(월)';     ColWidths[g_DUTYTERM     ] := -1;
        Cols[g_DUTYTERMRATE ].Text := '종사비중';         ColWidths[g_DUTYTERMRATE ] := -1;
        Cols[g_DUTYYYMM     ].Text := '종사년월';         ColWidths[g_DUTYYYMM     ] := 70;
        Cols[g_DUTYLEVEL    ].Text := '직무수준코드';     ColWidths[g_DUTYLEVEL    ] := -1;
        Cols[g_DUTYLEVELNM  ].Text := '직무수준';         ColWidths[g_DUTYLEVELNM  ] := 100;
        Cols[g_PAYCL        ].Text := '당시BAND코드';     ColWidths[g_PAYCL        ] := -1;
        Cols[g_PAYCLNM      ].Text := '당시BAND';         ColWidths[g_PAYCLNM      ] := 60;
        Cols[g_EQIPCODE     ].Text := '취급장비코드';     ColWidths[g_EQIPCODE     ] := -1;
        Cols[g_EQIP         ].Text := '취급장비';         ColWidths[g_EQIP         ] := 200;
        Cols[g_PROGCODE     ].Text := '취급프로그램코드'; ColWidths[g_PROGCODE     ] := -1;
        Cols[g_PROG         ].Text := '취급프로그램';     ColWidths[g_PROG         ] := 200;
        Cols[g_LICKIND      ].Text := '자격증코드';       ColWidths[g_LICKIND      ] := -1;
        Cols[g_LICE         ].Text := '자격증';           ColWidths[g_LICE         ] := 200;
//------------------------------------------------------------------------------
// Version date(yy.mm.dd) programmer  relevant doc.no    description
// 30.01   2001.05.10     윤형식      by 정세영(인사팀)  Non-Visible부분(시작일, 종료일, 종사기간, 비중)에 대한 표시제한 삭제
//                                                       화면,출력에서 학력->학교로 대치(최종학교추가)
//------------------------------------------------------------------------------
//        Cols[g_SCHGR        ].Text := '최종학력';         ColWidths[g_SCHGR        ] := 100;
//------------------------------------------------------------------------------
        Cols[g_SCHGRCODE    ].Text := '최종학력코드';     ColWidths[g_SCHGRCODE    ] := -1;
        Cols[g_SCHGR        ].Text := '최종학력';         ColWidths[g_SCHGR        ] := -1;
        Cols[g_SCHCODE      ].Text := '최종학교코드';     ColWidths[g_SCHCODE      ] := -1;
        Cols[g_SCHNM        ].Text := '최종학교';         ColWidths[g_SCHNM        ] := 100;
        Cols[g_MAJORCODE    ].Text := '전공코드';         ColWidths[g_MAJORCODE    ] := -1;
        Cols[g_MAJOR        ].Text := '전공';             ColWidths[g_MAJOR        ] := 100;
        Cols[g_TOEICSCORE   ].Text := 'TOEIC';            ColWidths[g_TOEICSCORE   ] := 60;
        Cols[g_SEX          ].Text := '성별';             ColWidths[g_SEX          ] := 40;
    end;
end;

function TSubForm.fnGetData(mDS_Main, mDS_Duty, mDS_Eqip, mDS_Prog, mDS_Lice:TQuery): Integer;
var
  iInd, iMax: Integer;
  vTemp: OleVariant;
  sTempEmpno: String;
  sWhere, sWhereDuty, sWhereProg, sWhereEqip, sWhereLice: String;
begin
  Result := 0;

  if giWhereFrom = 1 then
    MainForm.fzOpenDataSets
  else
    MainForm2.fzOpenDataSets;
  
    Edit1.Text :=MainForm2.sss;

  fzSGInitialRow(SG_Main);
  with mDS_Main, SG_Main do
  begin
//      Perform( WM_SETREDRAW, 0, 0 );
//    TRY
    RowCount := 2;
    While Not Eof do
    begin
      if Cells[g_SEQNO, RowCount-1] <> '' then
        RowCount := RowCount + 1;

      iMax := 1;

      Cells[g_SEQNO       , RowCount-1] := IntToStr(RowCount-1);
      Cells[g_KORNAME     , RowCount-1] := FieldByName('KORNAME').AsString;
      Cells[g_EMPNO       , RowCount-1] := FieldByName('EMPNO').AsString;
      Cells[g_ORGNUM      , RowCount-1] := FieldByName('ORGNUM').AsString;   //
      Cells[g_DEPTCODE    , RowCount-1] := FieldByName('DEPTCODE').AsString; //
      Cells[g_DEPTNAME    , RowCount-1] := FieldByName('DEPTNAME').AsString;
      Cells[g_IMASPAYCL   , RowCount-1] := FieldByName('IMASPAYCL').AsString;
      Cells[g_IMASPAYCLNM , RowCount-1] := FieldByName('IMASPAYCLNAME').AsString;
      Cells[g_SCHGRCODE   , RowCount-1] := FieldByName('LSCHGR').AsString;
      Cells[g_SCHGR       , RowCount-1] := FieldByName('SCHOOLNAME').AsString;
      Cells[g_SCHCODE     , RowCount-1] := FieldByName('LSCHCODE').AsString;
      Cells[g_SCHNM       , RowCount-1] := FieldByName('LSCHNM').AsString;
      Cells[g_MAJORCODE   , RowCount-1] := FieldByName('LMAJORCODE').AsString;
      Cells[g_MAJOR       , RowCount-1] := FieldByName('MAJORNAME').AsString;
      Cells[g_TOEICSCORE  , RowCount-1] := FieldByName('TOEICSCORE').AsString;
      Cells[g_SEX         , RowCount-1] := FieldByName('SEX').AsString;

      vTemp := Cells[g_EMPNO, RowCount-1];

      if mDS_Duty.Active then
      begin
        mDS_Duty.First;
        if mDS_Duty.Locate('EMPNO', vTemp, [loPartialKey]) then
        begin
          iInd := 1;
          while (not mDS_Duty.EOF)
                 and (Cells[g_EMPNO, RowCount-1] = mDS_Duty.FieldByName('EMPNO').AsString) do
          begin
            // 직무
            if iInd = 1 then
            begin
              Cells[g_DUTYNO      , RowCount-1] := mDS_Duty.FieldByName('DUTYNO').AsString           ;
              Cells[g_JOBFIELD    , RowCount-1] := mDS_Duty.FieldByName('JOBFIELD').AsString         ;
              Cells[g_JOBFIELDNM  , RowCount-1] := mDS_Duty.FieldByName('JOBFIELDNAME').AsString     ;
              Cells[g_DUTYKIND    , RowCount-1] := mDS_Duty.FieldByName('DUTYKIND').AsString         ;
              Cells[g_DUTYKINDNM  , RowCount-1] := mDS_Duty.FieldByName('DUTYKINDNAME').AsString     ;
              Cells[g_DUTY        , RowCount-1] := mDS_Duty.FieldByName('DUTY').AsString             ;
              Cells[g_DUTYNM      , RowCount-1] := mDS_Duty.FieldByName('DUTYNAME').AsString         ;
              Cells[g_FRDUTYDATE  , RowCount-1] := mDS_Duty.FieldByName('FRDUTYDATE').AsString       ; //
              Cells[g_TODUTYDATE  , RowCount-1] := mDS_Duty.FieldByName('TODUTYDATE').AsString       ; //
              Cells[g_DUTYTERM    , RowCount-1] := mDS_Duty.FieldByName('DUTYYYMM').AsString        ; //
              Cells[g_DUTYTERMRATE, RowCount-1] := mDS_Duty.FieldByName('DUTYTERMRATE').AsString     ; //
              Cells[g_DUTYTEXT    , RowCount-1] := '⊙ ' + mDS_Duty.FieldByName('DUTYTEXT').AsString ;
              Cells[g_DUTYYYMM    , RowCount-1] := Format('%2d년%2d개월',[mDS_Duty.FieldByName('DUTYYYMM').AsInteger div 12,
                                                                          mDS_Duty.FieldByName('DUTYYYMM').AsInteger mod 12]);
              Cells[g_DUTYLEVEL   , RowCount-1] := mDS_Duty.FieldByName('DUTYLEVEL').AsString        ;
              Cells[g_DUTYLEVELNM , RowCount-1] := mDS_Duty.FieldByName('DUTYLEVELNAME').AsString    ;
              Cells[g_PAYCL       , RowCount-1] := mDS_Duty.FieldByName('PAYCL').AsString            ;
              Cells[g_PAYCLNM     , RowCount-1] := mDS_Duty.FieldByName('PAYCLNAME').AsString        ;
            end
            else
            begin
              Cells[g_DUTYNO      , RowCount-1] := Cells[g_DUTYNO      , RowCount-1] +#13+ mDS_Duty.FieldByName('DUTYNO').AsString           ;
              Cells[g_JOBFIELD    , RowCount-1] := Cells[g_JOBFIELD    , RowCount-1] +#13+ mDS_Duty.FieldByName('JOBFIELD').AsString         ;
              Cells[g_JOBFIELDNM  , RowCount-1] := Cells[g_JOBFIELDNM  , RowCount-1] +#13+ mDS_Duty.FieldByName('JOBFIELDNAME').AsString     ;
              Cells[g_DUTYKIND    , RowCount-1] := Cells[g_DUTYKIND    , RowCount-1] +#13+ mDS_Duty.FieldByName('DUTYKIND').AsString         ;
              Cells[g_DUTYKINDNM  , RowCount-1] := Cells[g_DUTYKINDNM  , RowCount-1] +#13+ mDS_Duty.FieldByName('DUTYKINDNAME').AsString     ;
              Cells[g_DUTY        , RowCount-1] := Cells[g_DUTY        , RowCount-1] +#13+ mDS_Duty.FieldByName('DUTY').AsString             ;
              Cells[g_DUTYNM      , RowCount-1] := Cells[g_DUTYNM      , RowCount-1] +#13+ mDS_Duty.FieldByName('DUTYNAME').AsString         ;
//------------------------------------------------------------------------------
// Version date(yy.mm.dd) programmer  relevant doc.no    description
// 30.01   2001.05.10     윤형식      by 정세영(인사팀)  Non-Visible부분(시작일, 종료일, 종사기간, 비중)에 대한 표시제한 삭제
//                                                       화면,출력에서 학력->학교로 대치(최종학교추가)
//------------------------------------------------------------------------------
              Cells[g_FRDUTYDATE  , RowCount-1] := Cells[g_FRDUTYDATE  , RowCount-1] +#13+ mDS_Duty.FieldByName('FRDUTYDATE').AsString       ; //
              Cells[g_TODUTYDATE  , RowCount-1] := Cells[g_TODUTYDATE  , RowCount-1] +#13+ mDS_Duty.FieldByName('TODUTYDATE').AsString       ; //
              Cells[g_DUTYTERM    , RowCount-1] := Cells[g_DUTYTERM    , RowCount-1] +#13+ mDS_Duty.FieldByName('DUTYYYMM').AsString         ; //
              Cells[g_DUTYTERMRATE, RowCount-1] := Cells[g_DUTYTERMRATE, RowCount-1] +#13+ mDS_Duty.FieldByName('DUTYTERMRATE').AsString     ; //

              Cells[g_DUTYTEXT    , RowCount-1] := Cells[g_DUTYTEXT    , RowCount-1] +#13+ '⊙ ' + mDS_Duty.FieldByName('DUTYTEXT').AsString ;
              Cells[g_DUTYYYMM    , RowCount-1] := Cells[g_DUTYYYMM    , RowCount-1] +#13+ Format('%2d년%2d개월',[mDS_Duty.FieldByName('DUTYYYMM').AsInteger div 12,
                                                                                                                  mDS_Duty.FieldByName('DUTYYYMM').AsInteger mod 12]);
              Cells[g_DUTYLEVEL   , RowCount-1] := Cells[g_DUTYLEVEL   , RowCount-1] +#13+ mDS_Duty.FieldByName('DUTYLEVEL').AsString        ;
              Cells[g_DUTYLEVELNM , RowCount-1] := Cells[g_DUTYLEVELNM , RowCount-1] +#13+ mDS_Duty.FieldByName('DUTYLEVELNAME').AsString    ;
              Cells[g_PAYCL       , RowCount-1] := Cells[g_PAYCL       , RowCount-1] +#13+ mDS_Duty.FieldByName('PAYCL').AsString            ;
              Cells[g_PAYCLNM     , RowCount-1] := Cells[g_PAYCLNM     , RowCount-1] +#13+ mDS_Duty.FieldByName('PAYCLNAME').AsString        ;
            end;

            if iInd > iMax then Inc(iMax);
            Inc(iInd);
            mDS_Duty.Next;
          end;
        end;
      end;

      if mDS_Eqip.Active then
      begin
        mDS_Eqip.First;
        if mDS_Eqip.Locate('EMPNO', vTemp, [loPartialKey]) then
        begin
          iInd := 1;
          while (not mDS_Eqip.EOF)
                 and (Cells[g_EMPNO, RowCount-1] = mDS_Eqip.FieldByName('EMPNO').AsString) do
          begin
            // 취급장비
            if iInd = 1 then
            begin
              Cells[g_EQIPCODE    , RowCount-1] := mDS_Eqip.FieldByName('EQIPCODE').AsString;
              Cells[g_EQIP        , RowCount-1] := mDS_Eqip.FieldByName('EQIPNAME').AsString    ;
            end
            else
            begin
              Cells[g_EQIPCODE    , RowCount-1] := Cells[g_EQIPCODE    , RowCount-1] +#13+ mDS_Eqip.FieldByName('EQIPCODE').AsString;
              Cells[g_EQIP        , RowCount-1] := Cells[g_EQIP        , RowCount-1] +#13+ mDS_Eqip.FieldByName('EQIPNAME').AsString    ;
            end;

            if iInd > iMax then Inc(iMax);
            Inc(iInd);
            mDS_Eqip.Next;
          end;
        end;
      end;

      if mDS_Prog.Active then
      begin
        mDS_Prog.First;
        if mDS_Prog.Locate('EMPNO', vTemp, [loPartialKey]) then
        begin
          iInd := 1;
          while (not mDS_Prog.EOF)
                 and (Cells[g_EMPNO, RowCount-1] = mDS_Prog.FieldByName('EMPNO').AsString) do
          begin
            // 취급프로그램
            if iInd = 1 then
            begin
              Cells[g_PROGCODE    , RowCount-1] := mDS_Prog.FieldByName('PROGCODE').AsString;
              Cells[g_PROG        , RowCount-1] := mDS_Prog.FieldByName('PROGNAME').AsString    ;
            end
            else
            begin
              Cells[g_PROGCODE    , RowCount-1] := Cells[g_PROGCODE    , RowCount-1] +#13+ mDS_Prog.FieldByName('PROGCODE').AsString;
              Cells[g_PROG        , RowCount-1] := Cells[g_PROG        , RowCount-1] +#13+ mDS_Prog.FieldByName('PROGNAME').AsString    ;
            end;

            if iInd > iMax then Inc(iMax);
            Inc(iInd);
            mDS_Prog.Next;
          end;
        end;
      end;

      if mDS_Lice.Active then
      begin
        mDS_Lice.First;
        if mDS_Lice.Locate('EMPNO', vTemp, [loPartialKey]) then
        begin
          iInd := 1;
          while (not mDS_Lice.EOF)
                 and (Cells[g_EMPNO, RowCount-1] = mDS_Lice.FieldByName('EMPNO').AsString) do
          begin
            // 자격증
            if iInd = 1 then
            begin
              Cells[g_LICKIND     , RowCount-1] := mDS_Lice.FieldByName('LICKIND').AsString;
              Cells[g_LICE        , RowCount-1] := mDS_Lice.FieldByName('LICENAME').AsString    ;
            end
            else
            begin
              Cells[g_LICKIND     , RowCount-1] := Cells[g_LICKIND     , RowCount-1] +#13+ mDS_Lice.FieldByName('LICKIND').AsString;
              Cells[g_LICE        , RowCount-1] := Cells[g_LICE        , RowCount-1] +#13+ mDS_Lice.FieldByName('LICENAME').AsString    ;
            end;

            if iInd > iMax then Inc(iMax);
            Inc(iInd);
            mDS_Lice.Next;
          end;
        end;
      end;

      RowHeights[RowCount-1] := 20 + (iMax-1)*12;

      Cells[g_CHECK, RowCount-1] := '□';
      Next;
    end;

//    FINALLY
//      Perform( WM_SETREDRAW, 1, 0 );
//      Invalidate;
//    END;
  end; // -- End of With

  mDS_Main.Close;
  mDS_Duty.Close;
  mDS_Eqip.Close;
  mDS_Prog.Close;
  mDS_Lice.Close;

  SendMessage(SG_Main.Handle, WM_SETREDRAW, 1, 0);
  SG_Main.Refresh;
end;

procedure TSubForm.BExitClick(Sender: TObject);
begin
    fzSGAllClear(SG_Main);
    Close;
end;

procedure TSubForm.SG_MainDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  Loc : Cardinal;
begin
    with (Sender as TStringGrid).Canvas do
    begin
       if (ARow = 0) or (ACol = g_CHECK) then
       begin
           Loc := DT_CENTER or DT_WORDBREAK;
           Font.Style := [fsBold];
       end
       else
       begin
           if ACol in [g_SEQNO,g_KORNAME,g_EMPNO,g_DUTYYYMM,g_SEX] then
               Loc := DT_CENTER or DT_WORDBREAK
           else if ACol in [g_TOEICSCORE,g_DUTYYYMM] then
               Loc := DT_RIGHT or DT_WORDBREAK
           else
               Loc := DT_LEFT;// or DT_WORDBREAK;
           Font.Style := [];
       end;

       FillRect(Rect);
       Rect.Top   := Rect.Top + 2;
       Rect.Left  := Rect.Left + 2;

       DrawText(Handle, PChar((Sender as TStringGrid).Cells[ACol, ARow]), -1, Rect, Loc);
    end;
end;

procedure TSubForm.FormPaint(Sender: TObject);
begin
    if gbStart = False then
        System.Exit;
    gbStart := False;

    St_Help.Panels[0].Text := IntToStr(giRecordCount)+'건의 자료를 추출중입니다.... 잠시만 기다려 주십시오.';
    fzInitialForm;

    CB_Deptname.Tag   := g_DEPTNAME;
    CB_Empno.Tag      := g_EMPNO;
    CB_Korname.Tag    := g_KORNAME;
    CB_IMasPaycl.Tag  := g_IMASPAYCL;
    CB_Schgrcode.Tag  := g_SCHGRCODE;
    CB_Majorcode.Tag  := g_MAJORCODE;
    CB_ToeicScore.Tag := g_TOEICSCORE;
    //gsOrderBy     := 'Deptcode, Imaspaycl, Empno';
    //L_OrderByDesc.Caption := '부서, 직급, 사번';
    CB_Deptname.Checked := True;
    CB_IMasPaycl.Checked := True;
    CB_Empno.Checked := True;

    Application.ProcessMessages;

    fnGetData(DM.qryMain, DM.qryDuty, DM.qryEqip, DM.qryProg, DM.qryLice);

    St_Help.Panels[0].Text := '';
end;

// Checkbox에서 Checked인 component 갯수
function TSubForm.fnGetCntCheckBox: Integer;
var
  i, iCnt: Integer;
begin
  iCnt := 0;
  for i := 0 to ComponentCount -1 do
  begin
    if (Components[i] is TCheckBox) and (TControl(Components[i]).Parent = P_OrderBy) then
      if TCheckBox(Components[i]).Checked then
        Inc(iCnt);
  end;
  fnGetCntCheckBox := iCnt;
end;

// Checkbox에서 Hint(order by 순서)가 Max인 값
function TSubForm.fnGetMaxCheckBox: Integer;
var
  i, iMax: Integer;
begin
  iMax := 0;
  for i := 0 to ComponentCount -1 do
  begin
    if (Components[i] is TCheckBox) and (TControl(Components[i]).Parent = P_OrderBy) then
      if StrToIntDef(TCheckBox(Components[i]).Hint,0) > iMax then
        iMax := StrToInt(TControl(Components[i]).Hint);
  end;
  fnGetMaxCheckBox := iMax;
end;

// Checkbox에서 Hint(order by 순서)값 갱신
procedure TSubForm.fzSetOrderCheckBox(mCurrent: Integer);
var
  i, iCnt: Integer;
begin
  for i := 0 to ComponentCount -1 do
  begin
    if (Components[i] is TCheckBox) and (TControl(Components[i]).Parent = P_OrderBy) then
      if TCheckBox(Components[i]).Checked then
      begin
        if StrToIntDef(TCheckBox(Components[i]).Hint,0) > mCurrent then
          TCheckBox(Components[i]).Hint := IntToStr(StrToIntDef(TCheckBox(Components[i]).Hint,0) - 1);
      end
      else
        TCheckBox(Components[i]).Hint := '0';
  end;
end;

// Checkbox에서 특정 Hint(order by 순서)값을 가지고 있는 Checkbox 이름 찾기
function TSubForm.fnGetFindCheckBox(iOrder: Integer): String;
var
  i: Integer;
  sFined: String;
begin
  sFined := '';
  for i := 0 to ComponentCount -1 do
  begin
    if (Components[i] is TCheckBox) and (TControl(Components[i]).Parent = P_OrderBy) then
      if StrToIntDef(TControl(Components[i]).Hint,0) = iOrder then
      begin
        sFined := TControl(Components[i]).Name;
        Break;
      end;
  end;
  fnGetFindCheckBox := sFined;
end;

// StringGrid에서 Multi column 정렬을 위하여 column값을 합친 String 얻기
function TSubForm.fnGetSGCells(mStringGrid: TStringGrid; mIndex: Integer; mArray: Array of TCheckBox): String;
var
  I: Integer;
  sRet, sReturn: String;

  // InverseStr
  // Ascii code 55 --> 201(:= 256 - 55)
  function InverseStr(mSrc: String): String;
  var
    i: Integer;  sTar: String;
  begin
    SetLength(sTar, Length(mSrc));
    for i := 1 to Length(mSrc) do sTar[i] := Chr(256-Ord(mSrc[i]));
    InverseStr := sTar;
  end;
begin
  with mStringGrid do
  begin
    sReturn := '';
    for I := 0 to High(mArray) do
    begin
      sRet := Cells[TCheckBox(mArray[I]).Tag, mIndex];

      // Number자료 형태를 위하여 LPAD시킴 9 --> 009
      if TCheckBox(mArray[I]).Tag = g_TOEICSCORE then
        sRet := lpad(sRet,3,'0');
      if Pos('▼', TCheckBox(mArray[I]).Caption) > 0 then //역순
        sRet := InverseStr(sRet);
      sReturn := sReturn + sRet;
    end;
  end;
  fnGetSGCells := sReturn;
end;

// StringGrid QuickSort Routin
procedure TSubForm.fzSortingStringGrid(mStringGrid: TStringGrid; L, R: Integer; mArray: Array of TCheckBox);
var
  I, J: Integer;
  P: String;
begin
  with mStringGrid do
  begin
    repeat
      I := L;
      J := R;
      P := fnGetSGCells(mStringGrid, (L + R) shr 1, mArray);

      repeat
        while CompareText(fnGetSGCells(mStringGrid, I, mArray), P) < 0 do Inc(I);
        while CompareText(fnGetSGCells(mStringGrid, J, mArray), P) > 0 do Dec(J);
        if I <= J then
        begin
          fzSGExchanges(mStringGrid, I, J);
          Inc(I);
          Dec(J);
        end;
      until I > J;

      if L < J then fzSortingStringGrid(mStringGrid, L, J, mArray);
      L := I;

    until I >= R;

    for I := FixedRows to RowCount - 1 do
      Cells[g_SEQNO,I] := IntToStr(I);
  end; // end of [with mStrinGrid do]
  mStringGrid.Repaint;
end;

procedure TSubForm.NullEvent(Sender: TObject);
begin
//
end;

procedure TSubForm.CB_Cllick(Sender: TObject);
var
  sFieldName,  sFieldDesc  : String;
  sOrderByName,sOrderByDesc: String;
  sComp : String;
  tComp : TComponent;
  iFlag, iInd, iCheckBoxMax, iCheckBoxCur: Integer;
begin
  // Checkbox상태 변경
  // checked+▲ --> checked+▼ --> no checked -->
  TRY
    TCheckBox(Sender).OnClick := NullEvent;

    sOrderByDesc := TCheckBox(Sender).Caption;
    sOrderByName := TCheckBox(Sender).Name;
    if Pos('▲',sOrderByDesc) > 0 then
    begin
      TCheckBox(Sender).Caption := replace(sOrderByDesc,'▲','▼') ;
      TCheckBox(Sender).Checked := True;

      // Asc --> Desc만 변경하고 exit
      gsOrderBy             := replace(gsOrderBy,             sOrderByName, sOrderByName+' DESC');
      L_OrderByDesc.Caption := replace(L_OrderByDesc.Caption, sOrderByDesc, TCheckBox(Sender).Caption);
      System.Exit;
    end
    else if Pos('▼',sOrderByDesc) > 0 then
    begin
      TCheckBox(Sender).Caption := replace(sOrderByDesc,'▼','') ;
      TCheckBox(Sender).Checked := False;
    end
    else
    begin
      TCheckBox(Sender).Caption := sOrderByDesc+'▲';
      TCheckBox(Sender).Checked := True;
    end;

    // Sorting을 위하여 CheckBox에 Sorting 순서, Sorting할 대상 Field정보등 Setting
    // Checkbox.Name   = Order By의 Field명
    // Checkbox.Hint   = Sorting 순서 (1,2,....) ; 0은 Sorting할 대상 아님
    // Checkbox.Tag    = StringGrid의 Column 값
    // Checkbox.Caption= Asc(▲), DESC(▼)
    if TCheckBox(Sender).Checked then
    begin
      iCheckBoxMax := fnGetMaxCheckBox;
      TCheckBox(Sender).Hint := IntToStr(iCheckBoxMax + 1);
    end
    else
    begin
      iCheckBoxCur := StrToInt(TCheckBox(Sender).Hint);
      fzSetOrderCheckBox(iCheckBoxCur); // 현재값보다 큰 Hint값을 하나씩 낮춤 and 현재Hint는 0으로 조정
    end;

    // CheckBox의 Hint순서대로 정렬순서 재갱신
    iCheckBoxMax := fnGetMaxCheckBox;

    sOrderByName := '';
    sOrderByDesc := '';
    for iInd := 1 to iCheckBoxMax do
    begin
      sComp := fnGetFindCheckBox(iInd);
      tComp := FindComponent(sComp);
      if tComp <> Nil then
      begin
        sFieldName := Copy(TCheckBox(tComp).Name, 4, length(TCheckBox(tComp).Name)-3); // CB_제외
        sFieldDesc := TCheckBox(tComp).Caption;
        if Pos('▼',sFieldDesc) > 0 then
          sOrderByName := sOrderByName + sFieldName+' DESC, '
        else
          sOrderByName := sOrderByName + sFieldName+', ';
        sOrderByDesc := sOrderByDesc + sFieldDesc+', ';
      end;
    end;

    // 맨뒤의 ', ' 제거
    if Copy(sOrderByName, Length(sOrderByName)-1, 2) = ', ' then
      Delete(sOrderByName, Length(sOrderByName)-1, 2);
    if Copy(sOrderByDesc, Length(sOrderByDesc)-1, 2) = ', ' then
      Delete(sOrderByDesc, Length(sOrderByDesc)-1, 2);

    gsOrderBy             := sOrderByName;
    L_OrderByDesc.Caption := sOrderByDesc;

  FINALLY
    TCheckBox(Sender).OnClick := CB_Cllick;
  END;
end;

procedure TSubForm.Bt_SortingClick(Sender: TObject);
var
  iInd, iCheckBoxCnt: Integer;
  tArrayOrder: Array of TCheckbox;
  sField, sOrderBy: String;
  SComp: String;
  tComp: TComponent;
begin
  if SG_Main.RowCount <= 2 then // comparestr SysUtils classes tstringlist ExchangeItems
    System.Exit;

  St_Help.Panels[0].Text := '자료 정렬중입니다... 잠시만 기다려 주십시오.';
  Application.ProcessMessages;

  iCheckBoxCnt := fnGetCntCheckBox;

  if iCheckBoxCnt > 0 then
  begin
    TRY
      SetLength(tArrayOrder, iCheckBoxCnt);

      for iInd := 1 to iCheckBoxCnt do
      begin
        sComp := fnGetFindCheckBox(iInd);
        tComp := FindComponent(sComp);
        if tComp <> Nil then
          tArrayOrder[iInd-1] := TCheckBox(tComp);
      end;

      fzSortingStringGrid(SG_Main, SG_Main.FixedRows, SG_Main.RowCount-1, tArrayOrder);
    FINALLY
      tArrayOrder := nil;
    END;
  end;

  St_Help.Panels[0].Text := '';
  Application.ProcessMessages;
end;

procedure TSubForm.B_AllClick(Sender: TObject);
var
  sTemp: String;
  i: Integer;
begin
    if TPeJeonOutLookBtn(Sender).Tag = 1 then
        sTemp := '▣'
    else
        sTemp := '□';

    for i := SG_Main.FixedRows to SG_Main.RowCount -1 do
        SG_Main.Cells[g_CHECK, i] := sTemp;
end;

procedure TSubForm.SG_MainKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (Key = VK_SPACE) or (Key = VK_RETURN) then
    begin
        if SG_Main.Cells[g_CHECK, SG_Main.Row] = '▣' then
            SG_Main.Cells[g_CHECK, SG_Main.Row] := '□'
        else
            SG_Main.Cells[g_CHECK, SG_Main.Row] := '▣';
    end;
end;

procedure TSubForm.SG_MainMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  iCol,iRow: Integer;
  //ARect: TGridCoord;
  //cRect : Trect;
begin
    with SG_Main do
    begin
        //ARect := MouseCoord(x, y);
        MouseToCell(x, y, iCol, iRow);

        if iCol  = g_CHECK then
        begin
            if Cells[g_CHECK, iRow] = '▣' then
                Cells[g_CHECK, iRow] := '□'
            else
                Cells[g_CHECK, iRow] := '▣';
        end;
    end;
end;

procedure TSubForm.fzOutputExcel(mStringGrid: TStringGrid);
const
  xlLeft       = -4131;
  xlRight      = -4152;
  xlTop        = -4160;
  xlBottom     = -4107;
  xlNone       = 0;
  xlCenter     = -4108;
  xlContinuous = 1;
  xlThin       = 2;
  xlAutomatic  = -4105;
  xlLandscape  = 2;
  xlColorGray  = 15;
  xlColorBlue  = 5;
var
  FExcel, FWorkBook, FWorkSheet: Variant;
  i, j, iMaxRow : integer;
  sLeading, sColumn: String;
  szFileName: array[0..255] of char;
begin
  TRY
 //   FExcel := GetActiveOLEObject('Excel.Application');
        FExcel := CreateOLEObject('Excel.Application');          //엑셀을 실행
  EXCEPT
    on E: EOleSysError do
    begin
      TRY
        FExcel := CreateOLEObject('Excel.Application');          //엑셀을 실행
      EXCEPT
        MessageDlg('Excel이 설치되어 있지 않습니다.', MtWarning, [mbok], 0);
        Exit;
      END;
    end;
  END;

  TRY
    FWorkBook  := FExcel.WorkBooks.Add;
    FWorkSheet := FWorkBook.WorkSheets.Add;

    FExcel.Columns.AutoFit;

    with mStringGrid do
    begin
      for J := 0 to RowCount - 1 do
        for I := 0 to ColCount - 1 do
        begin
          FWorkSheet.Cells[J+1, I+1] := replace(mStringGrid.Cells[I,J],#13,#10);
          FWorkSheet.Cells[J+1, I+1] := Trim(FWorkSheet.Cells[J+1, I+1]);
        end;

      iMaxRow := J;
      sLeading := '';

      for I := 0 to ColCount - 1 do
      begin
        if (I div 26 > 0) then
          sLeading := Chr(65 +  I div 26 -1); // first A..Z, AA..AZ, BA..BZ, ..... here 64(A)
        sColumn := sLeading + Chr(65 + I mod 26);

        if ColWidths[I] <= 0 then // 비활설화 부분은 폰트색깔을 다르게 지정함다.
          FWorkSheet.Range[sColumn+'1',sColumn+IntToStr(iMaxRow)].Font.ColorIndex := xlColorBlue; // 5

        //FWorkSheet.Range[sColumn+'1',sColumn+IntToStr(iMaxRow)].Borders[xlLeft].Weight := xlThin;
        //FWorkSheet.Range[sColumn+'1',sColumn+IntToStr(iMaxRow)].Borders[xlRight].Weight := xlThin;
        //FWorkSheet.Range[sColumn+'1',sColumn+IntToStr(iMaxRow)].Borders[xlTop].Weight := xlThin;
        //FWorkSheet.Range[sColumn+'1',sColumn+IntToStr(iMaxRow)].Borders[xlBottom].Weight := xlThin;
        //FWorkSheet.Range[sColumn+'1',sColumn+IntToStr(iMaxRow)].HorizontalAlignment := xlCenter;
        FWorkSheet.Range[sColumn+'1',sColumn+IntToStr(iMaxRow)].VerticalAlignment   := xlTop;
      end;
    end;

    FExcel.Visible := True;
    FExcel.DisplayAlerts := True;

    //if SaveDialog1.Execute then
    //  FExcel.ActiveWorkBook.SaveAs(SaveDialog1.Filename);

    FExcel.Quit;

  EXCEPT
    //FExcel.DisplayAlerts := False;
    if not VarIsEmpty(FExcel) then
    begin
      FExcel.DisplayAlerts := False;
      FExcel.Quit;
      FExcel := UnAssigned;
    end;
  END;
end;

end.

