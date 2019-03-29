unit PIA10102;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, Buttons, Grids,
  comobj, ComCtrls, Db, MemDS, DBAccess, Ora, DBGrids, Func;
  
type
  TPIA10102Form = class(TForm)
    Panel1: TPanel;
    BB_upload: TBitBtn;
    OpenDialog1: TOpenDialog;
    Panel2: TPanel;
    PgBar: TProgressBar;
    sp_StoredProc01: TOraStoredProc;
    BB_export: TBitBtn;
    BB_exit: TBitBtn;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ExcelDataSource: TDataSource;
    OraExcelQuery: TOraQuery;
    DBGridSearch: TDBGrid;
    OraExcelQuerySEQ: TStringField;
    OraExcelQueryEMPNO: TStringField;
    OraExcelQueryKORNAME: TStringField;
    Label1: TLabel;
    MD_empno: TMaskEdit;
    PL_nmempno: TPanel;
    Pl_Help: TPanel;
    BitBtn3: TBitBtn;
    SGrid01: TStringGrid;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    procedure BB_uploadClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure BB_exportClick(Sender: TObject);
    procedure BB_exitClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure MD_empnoChange(Sender: TObject);
    procedure MD_empnoExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure SGrid01DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }

    procedure _PTmpGridTitle(StringGrid: TStringGrid);
    procedure _PTmpGridValue(pi: integer; pStr: String;
      StoredProc: TOraStoredProc; StringGrid: TStringGrid);

    procedure _PSaveToXLS();
  public
    { Public declarations }
    _Ora_DATA : array of array of String;
  end;

var
  PIA10102Form: TPIA10102Form;

implementation

{$R *.DFM}








procedure TPIA10102Form.BB_uploadClick(Sender: TObject);
var
 i, j, iRowCnt,iColCnt : integer;
 ExcelApp : variant;
begin

  try
     ExcelApp := CreateOleObject('Excel.application');
  except
     ShowMessage('Excel이 설치되어 있지 않습니다!!!');
     Exit;
  end;

  if OpenDialog1.Execute then
     ExcelApp.workbooks.open(OpenDialog1.FileName)
  else
     System.Exit;

  iRowCnt := StrToInt(ExcelApp.ActiveSheet.UsedRange.Rows.Count);
  iColCnt := StrToInt(ExcelApp.ActiveSheet.UsedRange.Columns.Count);

  Application.ProcessMessages;
  PgBar.Position := 0;
  PgBar.Max := iRowCnt;

  OraExcelQuery.active := false;
  OraExcelQuery.active := true;
  SendMessage(DBGridSearch.Handle, WM_SETREDRAW, integer(False), 0);
  for i := 1 to iRowCnt-1 do
  begin

     if (OraExcelQuery.FieldByName('EMPNO'  ).AsSTring = '') then
        OraExcelQuery.edit
     else
        OraExcelQuery.Append;

     OraExcelQuery.FieldByName('SEQ'    ).AsSTring := IntToStr(i);
     OraExcelQuery.FieldByName('EMPNO'  ).AsSTring := ExcelApp.cells[i+1, 1];
     OraExcelQuery.FieldByName('KORNAME').AsSTring := ExcelApp.cells[i+1, 2];
     OraExcelQuery.Post;

     PgBar.Position := PgBar.Position + 1;
  end;
  SendMessage(DBGridSearch.Handle, WM_SETREDRAW,integer(True), 0);
  InvalidateRect(DBGridSearch.Handle, Nil, False);


  ExcelApp.WorkBooks.Close;
  ExcelApp.Quit;
  ExcelApp := unassigned;

  ShowMessage('파일 업로드가 완료되었습니다.');
  PgBar.Position := 0;
end;

procedure TPIA10102Form.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin

   if ModalResult = mrCancel then
   begin
     if MessageDlg('인사정보다운 화면을 닫겠습니까?', mtInformation, [mbYes, mbNo], 0) = mrNo then
     begin
        CanClose := false;
     end;
  end;
end;

procedure TPIA10102Form.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
   strLen  : integer;
   strSize : TSize;
begin

  if (ARow = 0) then
  begin
    with TStringGrid(Sender).Canvas do
    begin
      strLen  := TextWidth(TStringGrid(Sender).Cells[ACol,0]);
      strSize := TextExtent(TStringGrid(Sender).Cells[ACol,0]);
      TextRect( Rect, Rect.Left+Round((Rect.Right - Rect.Left - strLen)/2),
                Rect.Top+Round((Rect.bottom - Rect.Top-strSize.cy)/ 2), TStringGrid(Sender).Cells[ACol, ARow]);
    end;
  end;

  if (ARow > 0) AND (ACol in [1,2]) then
  begin
    with TStringGrid(Sender).Canvas do
    begin
      strLen  := TextWidth(TStringGrid(Sender).Cells[ACol,0]);
      strSize := TextExtent(TStringGrid(Sender).Cells[ACol,0]);
      TextRect( Rect, Rect.Left, Rect.Top+Round((Rect.bottom -
                Rect.Top-strSize.cy)/ 2), TStringGrid(Sender).Cells[ACol, ARow]);
    end;
  end;

  if (ARow > 0) AND (ACol =  0) then
  begin
    with TStringGrid(Sender).Canvas do
    begin
      strLen  := TextWidth(TStringGrid(Sender).Cells[ACol,0]);
      strSize := TextExtent(TStringGrid(Sender).Cells[ACol,0]);
      TextRect( Rect, Rect.Left+Round((Rect.Right - Rect.Left - strLen)/2),
                Rect.Top+Round((Rect.bottom - Rect.Top-strSize.cy)/ 2), TStringGrid(Sender).Cells[ACol, ARow]);
    end;
  end;
end;

procedure TPIA10102Form.BB_exportClick(Sender: TObject);
var
  i : integer;
begin

    if OraExcelQuery.eof then
       exit;

    try
       //동적으로 할당(가로,세로 모두)
       setlength(_Ora_DATA, 0);

      //조회
      with sp_StoredProc01 do
      begin
        Active := false;
        Session := Ora_Session;
        StoredProcName:= 'SP_SCH01_PIA1010A';
        Prepare;

        PgBar.Position := 0;
        PgBar.Max := OraExcelQuery.RecordCount;

        //동적으로 할당
        setlength(_Ora_DATA, OraExcelQuery.RecordCount);  //행 161  (0..160) <- 161
        for i := 0 to OraExcelQuery.RecordCount-1 do        //열
        begin
           setlength(_Ora_DATA[i], 287);
        end;

        OraExcelQuery.first;
        SendMessage(DBGridSearch.Handle, WM_SETREDRAW, integer(False), 0);        
        for i := 0 to OraExcelQuery.RecordCount-1 do
        begin
           Active := false;
           ParamByName('pEMPNO').AsString :=  OraExcelQuery.FieldbyName('EMPNO').AsString;
           Active := true;

           if not eof then
           begin
             sp_StoredProc01.FetchAll := true;

             // tab-1
             _Ora_DATA[i][  0] := IntToStr(i+1);
             _Ora_DATA[i][  1] := FieldByName('ORGNUM').AsString;
             _Ora_DATA[i][  2] := FieldByName('EMPNO').AsString;
             _Ora_DATA[i][  3] := FieldByName('KORNAME').AsString;              //성  명
             _Ora_DATA[i][  4] := FieldByName('Country').AsString;              //국가
             _Ora_DATA[i][  5] := FieldByName('NCountry').AsString;             //국가명
             _Ora_DATA[i][  6] := FieldByName('PSTATE').AsString;               //인사상태
             _Ora_DATA[i][  7] := FieldByName('NPSTATE').AsString;              //인사상태명
             _Ora_DATA[i][  8] := FieldByName('PSTATEYN').AsString;             //현원포함여부
             _Ora_DATA[i][  9] := FieldByName('PAYCL').AsString;                //현BAND
             _Ora_DATA[i][ 10] := FieldByName('NPAYCL').AsString;               //현BAND명
             _Ora_DATA[i][ 11] := FieldByName('Nemptypecd').AsString;           //사원유형
             _Ora_DATA[i][ 12] := FieldByName('Nemptypenm').AsString;           //사원유형명
             _Ora_DATA[i][ 13] := FieldByName('ROLELEVEL').AsString;            //ROLE LEVEL
             _Ora_DATA[i][ 14] := FieldByName('NROLELEVEL').AsString;           //ROLE LEVEL명
             _Ora_DATA[i][ 15] := FieldByName('ROLELVDATE').AsString;           //ROLE LEVE DATE
             _Ora_DATA[i][ 16] := FieldByName('BONCODE').AsString;              //본부코드
             _Ora_DATA[i][ 17] := FieldByName('FINCODE').AsString;              //재무부서
             _Ora_DATA[i][ 18] := FieldByName('PAYGR').AsString;                //호봉
             _Ora_DATA[i][ 19] := FieldByName('DEPTCODE').AsString;             //소속부서
             _Ora_DATA[i][ 20] := FieldByName('Ndeptcode').AsString;            //소속부서명
             _Ora_DATA[i][ 21] := FieldByName('Njikgroup').AsString;            //소속그룹명
             _Ora_DATA[i][ 22] := FieldByName('FIELDCODE').AsString;            //소속부문
             _Ora_DATA[i][ 23] := FieldByName('NFIELDCODE').AsString;           //소속부문명
             _Ora_DATA[i][ 24] := FieldByName('JOBDEPT').AsString;              //근무부서
             _Ora_DATA[i][ 25] := FieldByName('NJOBDEPT').AsString;             //근무부서명
             _Ora_DATA[i][ 26] := FieldByName('PAYRA').AsString;                //직책
             _Ora_DATA[i][ 27] := FieldByName('NPAYRA').AsString;               //직책명
             _Ora_DATA[i][ 28] := FieldByName('JOBPAYRA').AsString;             //근무직책
             _Ora_DATA[i][ 29] := FieldByName('NJOBPAYRA').AsString;            //근무직책명
             _Ora_DATA[i][ 30] := FieldByName('REALTRDATE').AsString;           //전보일
             _Ora_DATA[i][ 31] := FieldByName('OFFTRDATE').AsString;            //조직전보일
             _Ora_DATA[i][ 32] := FieldByName('PAYRAYN').AsString;              //보임여부
             _Ora_DATA[i][ 33] := FieldByName('JOBPAYRAYN').AsString;           //근무부서보임여부
             _Ora_DATA[i][ 34] := FieldByName('IMWONDATE').AsString;            //임원선임일
             _Ora_DATA[i][ 35] := FieldByName('CPAYRADATE').AsString;           //보임일
             _Ora_DATA[i][ 36] := FieldByName('JOBPLACE').AsString;             //상세근무지
             _Ora_DATA[i][ 37] := FieldByName('Njobplace').AsString;            //상세근무지명
             _Ora_DATA[i][ 38] := FieldByName('NplaceNation').AsString;         //근무지국가
             _Ora_DATA[i][ 39] := FieldByName('EMPDATE').AsString;              //최초입사일
             _Ora_DATA[i][ 40] := FieldByName('ORGEMPDATE').AsString;           //입사일
             _Ora_DATA[i][ 41] := FieldByName('GROUPEMPDATE').AsString;         //근무지국가
             _Ora_DATA[i][ 42] := FieldByName('GROUPCOMPANY').AsString;         //최초그룹입사일
             _Ora_DATA[i][ 43] := FieldByName('CPAYCLDATE').AsString;           //근무지국가
             _Ora_DATA[i][ 44] := FieldByName('PAYCLDATE').AsString;            //승격일
             _Ora_DATA[i][ 45] := FieldByName('OLD_PAYCLDATE').AsString;        //구BAND조정일
             _Ora_DATA[i][ 46] := FieldByName('REPPAYCL').AsString;             //직무대리BAND
             _Ora_DATA[i][ 47] := FieldByName('Nreppaycl').AsString;            //직무대리BAND명
             _Ora_DATA[i][ 48] := FieldByName('REPPAYFRDATE').AsString;         //직무대리일(FROM)
             _Ora_DATA[i][ 49] := FieldByName('REPPAYTODATE').AsString;         //직무대리일(TO)
             _Ora_DATA[i][ 50] := FieldByName('APDPAYDUNM').AsString;           //겸직직책
             _Ora_DATA[i][ 51] := FieldByName('APDPAYFRDATE').AsString;         //겸직직책(FROM)
             _Ora_DATA[i][ 52] := FieldByName('APDPAYTODATE').AsString;         //겸직직책(TO)
             _Ora_DATA[i][ 53] := FieldByName('ACTPAYDUNM').AsString;           //직무대행직책
             _Ora_DATA[i][ 54] := FieldByName('ACTPAYFRDATE').AsString;         //직무대행일(FROM)
             _Ora_DATA[i][ 55] := FieldByName('ACTPAYTODATE').AsString;         //직무대행일(TO)
             _Ora_DATA[i][ 56] := FieldByName('REMARK').AsString;               //특기사항
             _Ora_DATA[i][ 57] := FieldByName('NREMARK').AsString;              //특기사항명
             _Ora_DATA[i][ 58] := FieldByName('EMPCODE').AsString;              //채용원천
             _Ora_DATA[i][ 59] := FieldByName('Nempcode').AsString;             //채용원천명
             _Ora_DATA[i][ 60] := FieldByName('EMPTERM').AsString;              //입사기수
             _Ora_DATA[i][ 61] := FieldByName('EMPSCHGR').AsString;             //입사학력
             _Ora_DATA[i][ 62] := FieldByName('Nempschgr').AsString;            //입사학력명
             _Ora_DATA[i][ 63] := FieldByName('EMPPAYCL').AsString;             //입사BAND
             _Ora_DATA[i][ 64] := FieldByName('Nemppaycl').AsString;            //입사BAND명
             _Ora_DATA[i][ 65] := FieldByName('EMPPAYGR').AsString;             //입사호봉
             _Ora_DATA[i][ 66] := FieldByName('GRPAYGRSUM').AsString;           //부여호봉
             _Ora_DATA[i][ 67] := FieldByName('ARMYPAYGR').AsString;            //군혜택호봉
             _Ora_DATA[i][ 68] := FieldByName('MASPAYGR').AsString;             //석사호봉
             _Ora_DATA[i][ 69] := FieldByName('CARPAYGR').AsString;             //경력호봉
             _Ora_DATA[i][ 70] := FieldByName('ETCPAYGR').AsString;             //기타호봉
             _Ora_DATA[i][ 71] := FieldByName('ETCPAYCONT').AsString;           //기타호봉내역
             _Ora_DATA[i][ 72] := FieldByName('BCARYY').AsString;               //입사전총경력년
             _Ora_DATA[i][ 73] := FieldByName('BCARMM').AsString;               //입사전총경력월
             _Ora_DATA[i][ 74] := FieldByName('CARDATE').AsString;              //경력일
             // tab-2
             _Ora_DATA[i][ 75] := FieldByName('JOBGUN').AsString;               //직군
             _Ora_DATA[i][ 76] := FieldByName('Njobgun').AsString;              //직군명
             _Ora_DATA[i][ 77] := FieldByName('JOBGUNDATE').AsString;           //직군일
             _Ora_DATA[i][ 78] := FieldByName('JOBLINE').AsString;              //직렬
             _Ora_DATA[i][ 79] := FieldByName('JOBLINEDATE').AsString;          //직렬일
             _Ora_DATA[i][ 80] := FieldByName('JOBKIND').AsString;              //직종
             _Ora_DATA[i][ 81] := FieldByName('Njobkind').AsString;             //직종명
             _Ora_DATA[i][ 82] := FieldByName('JOBKINDDATE').AsString;          //직종일
             _Ora_DATA[i][ 83] := FieldByName('JOBDUTY').AsString;              //직무
             _Ora_DATA[i][ 84] := FieldByName('NJOBDUTY').AsString;              //직무명
             _Ora_DATA[i][ 85] := FieldByName('JOBDUTYDATE').AsString;          //직무일
             _Ora_DATA[i][ 86] := FieldByName('NojoYN').AsString;               //노조원구분
             _Ora_DATA[i][ 87] := FieldByName('NOGUBUN').AsString;              //노조세부 구분
             _Ora_DATA[i][ 88] := FieldByName('Nnogubun').AsString;             //노조세부 구분명
             _Ora_DATA[i][ 89] := FieldByName('NOJEONYN').AsString;             //노조전임여부
             _Ora_DATA[i][ 90] := FieldByName('NOJNFRDATE').AsString;           //노조전임일(FROM)
             _Ora_DATA[i][ 91] := FieldByName('NOJNTODATE').AsString;           //노조전임일(TO)
             _Ora_DATA[i][ 92] := FieldByName('LANCODE').AsString;              //최종발령구분
             _Ora_DATA[i][ 93] := FieldByName('Nlancode').AsString;             //최종발령구분명
             _Ora_DATA[i][ 94] := FieldByName('LANNONO').AsString;              //최종발령번호
             _Ora_DATA[i][ 95] := FieldByName('LANFRDATE').AsString;            //최종발령일(FROM)
             _Ora_DATA[i][ 96] := FieldByName('LANTODATE').AsString;            //최종발령일(TO)
             _Ora_DATA[i][ 97] := FieldByName('EXDUTCNT').AsString;             //총근속제외기간횟수
             _Ora_DATA[i][ 98] := FieldByName('EXDUTYY').AsString;              //총근속제외기간년
             _Ora_DATA[i][ 99] := FieldByName('EXDUTMM').AsString;              //총근속제외기간월
             _Ora_DATA[i][100] := FieldByName('EXDUTDD').AsString;              //총근속제외기간일
             _Ora_DATA[i][101] := FieldByName('LEXFRDATE').AsString;            //최종근속제외기간(FROM)
             _Ora_DATA[i][102] := FieldByName('LEXTODATE').AsString;            //최종근속제외기간(TO)
             _Ora_DATA[i][103] := FieldByName('LEXDUYY').AsString;              //최종근속제외기간년
             _Ora_DATA[i][104] := FieldByName('LEXDUMM').AsString;              //최종근속제외기간월
             _Ora_DATA[i][105] := FieldByName('LEXDUDD').AsString;              //최종근속제외기간일
             _Ora_DATA[i][106] := FieldByName('PAYCLYY').AsString;              //재급기간년
             _Ora_DATA[i][107] := FieldByName('PAYCLMM').AsString;              //재급기간월
             _Ora_DATA[i][108] := FieldByName('PAYCLDD').AsString;              //재급기간일
             _Ora_DATA[i][109] := FieldByName('TOTPAYCLDD').AsString;           //총재급일
             _Ora_DATA[i][110] := FieldByName('COMDUYY').AsString;              //근속기간년
             _Ora_DATA[i][111] := FieldByName('COMDUMM').AsString;              //근속기간월
             _Ora_DATA[i][112] := FieldByName('COMDUDD').AsString;              //근속기간일
             _Ora_DATA[i][113] := FieldByName('TOTCOMDUDD').AsString;           //총재직일
             // tab-3
             _Ora_DATA[i][114] := FieldByName('ARMYKIND').AsString;             //군별
             _Ora_DATA[i][115] := FieldByName('Narmykind').AsString;            //군별명
             _Ora_DATA[i][116] := FieldByName('ARMYCL').AsString;               //계급
             _Ora_DATA[i][117] := FieldByName('Narmycl').AsString;              //계급명
             _Ora_DATA[i][118] := FieldByName('ARMYFIELD').AsString;            //병과
             _Ora_DATA[i][119] := FieldByName('Narmyfield').AsString;           //병과명
             _Ora_DATA[i][120] := FieldByName('ARMYFRDATE').AsString;           //입대일자
             _Ora_DATA[i][121] := FieldByName('ARMYTODATE').AsString;           //제대일자
             _Ora_DATA[i][122] := FieldByName('ARMYDIS').AsString;              //제대구분
             _Ora_DATA[i][123] := FieldByName('Narmydis').AsString;             //제대구분명
             _Ora_DATA[i][124] := FieldByName('ARMYEX').AsString;               //면제사유
             _Ora_DATA[i][125] := FieldByName('Narmyex').AsString;              //면제사유명
             _Ora_DATA[i][126] := FieldByName('LSCHGR').AsString;               //최종학력
             _Ora_DATA[i][127] := FieldByName('Nlschgr').AsString;              //최종학력명
             _Ora_DATA[i][128] := FieldByName('LSCHDEG').AsString;              //최종학위
             _Ora_DATA[i][129] := FieldByName('Nlschdeg').AsString;             //최종학위명
             _Ora_DATA[i][130] := FieldByName('LSCHCODE').AsString;             //최종학력학교
             _Ora_DATA[i][131] := FieldByName('LSCHNM').AsString;               //최종학력학교명
             _Ora_DATA[i][132] := FieldByName('LSCHFRYM').AsString;             //최종학교입학년월
             _Ora_DATA[i][133] := FieldByName('LSCHGRYM').AsString;             //최종학교졸업년월
             _Ora_DATA[i][134] := FieldByName('LMAJORCODE').AsString;           //최종학교전공
             _Ora_DATA[i][135] := FieldByName('Nlmajorcode').AsString;          //최종학교전공명
             _Ora_DATA[i][136] := FieldByName('UNICODE').AsString;              //대학교
             _Ora_DATA[i][137] := FieldByName('Nunicode').AsString;             //대학교명
             _Ora_DATA[i][138] := FieldByName('UNIMAJOR').AsString;             //대학교전공
             _Ora_DATA[i][139] := FieldByName('Nunimajor').AsString;            //대학교전공명
             _Ora_DATA[i][140] := FieldByName('UNIFRYM').AsString;              //대학교입학년월
             _Ora_DATA[i][141] := FieldByName('UNIGRYM').AsString;              //대학교졸업년월
             _Ora_DATA[i][142] := FieldByName('LSCHMAJNM').AsString;            //최종학교세부전공
             _Ora_DATA[i][143] := FieldByName('LSCHTOPIC').AsString;            //최종학교논문
             _Ora_DATA[i][144] := FieldByName('LICKIND').AsString;              //자격/면허
             _Ora_DATA[i][145] := FieldByName('Nlickind').AsString;             //자격/면허명
             _Ora_DATA[i][146] := FieldByName('PUBLISH').AsString;              //발행처
             _Ora_DATA[i][147] := FieldByName('Nliccd').AsString;               //자격/면허유형
             _Ora_DATA[i][148] := FieldByName('Nlicnm').AsString;               //자격/면허유형명
             _Ora_DATA[i][149] := FieldByName('LICGR').AsString;                //자격/면허등급
             _Ora_DATA[i][150] := FieldByName('Nlicgr').AsString;               //자격/면허등급명
             _Ora_DATA[i][151] := FieldByName('LICGETDATE').AsString;           //자격/면허취득일
             _Ora_DATA[i][152] := FieldByName('LICALKIND').AsString;            //선임자격면허종류
             _Ora_DATA[i][153] := FieldByName('Nlicalkind').AsString;           //선임자격면허종류명
             _Ora_DATA[i][154] := FieldByName('LICALGR').AsString;              //선임자격면허등급
             _Ora_DATA[i][155] := FieldByName('Nlicalgr').AsString;             //선임자격면허등급명
             _Ora_DATA[i][156] := FieldByName('LICALGETDATE').AsString;         //선임자격면허취득일
             _Ora_DATA[i][157] := FieldByName('LICALFIELD').AsString;           //선임분야
             _Ora_DATA[i][158] := FieldByName('LICALDATE').AsString;            //선임일
             _Ora_DATA[i][159] := FieldByName('LICBIGO').AsString;              //비고
             _Ora_DATA[i][160] := FieldByName('TOEICSCORE').AsString;           //최종 TOEIC 시험성적
             _Ora_DATA[i][161] := FieldByName('TOEICFULL').AsString;            //최종 TOEIC 만점
             _Ora_DATA[i][162] := FieldByName('TOEICDATE').AsString;            //최종 TOEIC 시험일자
             _Ora_DATA[i][163] := FieldByName('JPTSCORE').AsString;             //최종 JPT 시험성적
             _Ora_DATA[i][164] := FieldByName('JPTFULL').AsString;              //최종 JPT 만점
             _Ora_DATA[i][165] := FieldByName('JPTDATE').AsString;              //최종 JPT 시험일자
             _Ora_DATA[i][166] := FieldByName('LANGTYPE').AsString;             //외국어유형
             _Ora_DATA[i][167] := FieldByName('Nlangtype').AsString;            //외국어유형명
             _Ora_DATA[i][168] := FieldByName('EXAMTYPE').AsString;             //시험유형
             _Ora_DATA[i][169] := FieldByName('Nexamtype').AsString;            //시험유형명
             _Ora_DATA[i][170] := FieldByName('LANGNAME').AsString;             //외국어명
             _Ora_DATA[i][171] := FieldByName('EXAMDATE').AsString;             //시험일자
             // tab-4
             _Ora_DATA[i][172] := FieldByName('EDUGUBUN').AsString;             //교육종류
             _Ora_DATA[i][173] := FieldByName('Nedugubun').AsString;            //교육종류명
             _Ora_DATA[i][174] := FieldByName('EDUPLACE').AsString;             //교육기관
             _Ora_DATA[i][175] := FieldByName('EDUCOURSE').AsString;            //교육과정
             _Ora_DATA[i][176] := FieldByName('EDUFRDATE').AsString;            //교육기간(FROM)
             _Ora_DATA[i][177] := FieldByName('EDUTODATE').AsString;            //교육기간(TO)
             _Ora_DATA[i][178] := FieldByName('EDUAREA').AsString;              //교육지역
             _Ora_DATA[i][179] := FieldByName('EDUCONT').AsString;              //연락처
             _Ora_DATA[i][180] := FieldByName('EDUDUFRDATE').AsString;          //의무복무기간(FROM)
             _Ora_DATA[i][181] := FieldByName('EDUDUTODATE').AsString;          //의무복무기간(TO)
             _Ora_DATA[i][182] := FieldByName('LRKIND').AsString;               //휴직구분
             _Ora_DATA[i][183] := FieldByName('Nlrkind').AsString;              //휴직구분명
             _Ora_DATA[i][184] := FieldByName('LRFRDATE').AsString;             //휴직구분(FROM)
             _Ora_DATA[i][185] := FieldByName('LRTODATE').AsString;             //휴직구분(TO)
             _Ora_DATA[i][186] := FieldByName('LVFRDATE').AsString;             //휴직휴가기간(FROM)
             _Ora_DATA[i][187] := FieldByName('LVTODATE').AsString;             //휴직휴가기간(TO)
             _Ora_DATA[i][188] := FieldByName('LSEKIND').AsString;              //파견구분
             _Ora_DATA[i][189] := FieldByName('Nlsekind').AsString;             //파견구분명
             _Ora_DATA[i][190] := FieldByName('LSEFRDATE').AsString;            //파견구분(FROM)
             _Ora_DATA[i][191] := FieldByName('LSETODATE').AsString;            //파견구분(TO)
             _Ora_DATA[i][192] := FieldByName('LSEPLACE').AsString;             //파견기관
             _Ora_DATA[i][193] := FieldByName('LSESAYU').AsString;              //파견목적
             _Ora_DATA[i][194] := FieldByName('LSECONT').AsString;              //파견연락처
             _Ora_DATA[i][195] := FieldByName('HUGUBUN').AsString;              //휴가구분
             _Ora_DATA[i][196] := FieldByName('Nhugubun').AsString;             //휴가구분명
             _Ora_DATA[i][197] := FieldByName('HUFRDATE').AsString;             //휴가구분(FROM)
             _Ora_DATA[i][198] := FieldByName('HUTODATE').AsString;             //휴가구분(TO)
             _Ora_DATA[i][199] := FieldByName('RETDATE').AsString;              //퇴직일자
             _Ora_DATA[i][200] := FieldByName('RETGUBUN').AsString;             //퇴직구분
             _Ora_DATA[i][201] := FieldByName('Nretgubun').AsString;            //퇴직구분명
             _Ora_DATA[i][202] := FieldByName('RETSAYU1').AsString;             //퇴직실제사유1
             _Ora_DATA[i][203] := FieldByName('Nretsayu1').AsString;            //퇴직실제사유명1
             _Ora_DATA[i][204] := FieldByName('RETSAYU2').AsString;             //퇴직실제사유2
             _Ora_DATA[i][205] := FieldByName('Nretsayu2').AsString;            //퇴직실제사유명2
             _Ora_DATA[i][206] := FieldByName('RETCONT').AsString;              //휴대전화
             // tab-5
             _Ora_DATA[i][207] := FieldByName('BOHUNGUBUN').AsString;           //보훈구분
             _Ora_DATA[i][208] := FieldByName('Nbohungubun').AsString;          //보훈구분명
             _Ora_DATA[i][209] := FieldByName('BOHUNNM').AsString;              //유공자
             _Ora_DATA[i][210] := FieldByName('BOHUNREL').AsString;             //유공자와의관계
             _Ora_DATA[i][211] := FieldByName('Nbohunrel').AsString;            //유공자와의관계명
             _Ora_DATA[i][212] := FieldByName('BOHUNNO').AsString;              //보훈번호
             _Ora_DATA[i][213] := FieldByName('BOHUNBRAN').AsString;            //자력지청
             _Ora_DATA[i][214] := FieldByName('BOHUNYN').AsString;              //보훈대상여부
             _Ora_DATA[i][215] := FieldByName('SCGUBUN').AsString;              //특례구분
             _Ora_DATA[i][216] := FieldByName('Nscgubun').AsString;             //특례구분명
             _Ora_DATA[i][217] := FieldByName('SCENTDATE').AsString;            //특례편입일자
             _Ora_DATA[i][218] := FieldByName('SCPREDATE').AsString;            //특례편입일자
             _Ora_DATA[i][219] := FieldByName('SCENDDATE').AsString;            //특례만료일자
             _Ora_DATA[i][220] := FieldByName('SCTERMYN').AsString;             //특례만료여부
             _Ora_DATA[i][221] := FieldByName('SCEXYY').AsString;               //복무제외년
             _Ora_DATA[i][222] := FieldByName('SCEXMM').AsString;               //복무제외월
             _Ora_DATA[i][223] := FieldByName('SCEXDD').AsString;               //복무제외일
             _Ora_DATA[i][224] := FieldByName('SCEXCAUSE').AsString;            //복무제외사유
             _Ora_DATA[i][225] := FieldByName('OBSKIND').AsString;              //장애인유형
             _Ora_DATA[i][226] := FieldByName('Nobskind').AsString;             //장애인유형명
             _Ora_DATA[i][227] := FieldByName('OBSGR').AsString;                //장애인등급
             _Ora_DATA[i][228] := FieldByName('Nobsgr').AsString;               //장애인등급명
             _Ora_DATA[i][229] := FieldByName('OBSSTATE').AsString;             //장애인상세상태
             _Ora_DATA[i][230] := FieldByName('OTDUFRDATE').AsString;           //계약기간(FROM)
             _Ora_DATA[i][231] := FieldByName('OTDUTODATE').AsString;           //계약기간(TO)
             _Ora_DATA[i][232] := FieldByName('TCONTR').AsString;               //계약방법
             _Ora_DATA[i][233] := FieldByName('Ntcontr').AsString;              //계약방법명
             _Ora_DATA[i][234] := FieldByName('TCONTRAMT').AsString;            //계약금액
             _Ora_DATA[i][235] := FieldByName('TTYPE').AsString;                //근무형태
             _Ora_DATA[i][236] := FieldByName('TJOBDUTY').AsString;             //담당직무
             _Ora_DATA[i][237] := FieldByName('Ptjobduty').AsString;            //담당직무명
             _Ora_DATA[i][238] := FieldByName('TDUTYCLASS').AsString;           //직무등급
             _Ora_DATA[i][239] := FieldByName('Ntdutyclass').AsString;          //직무등급명
             _Ora_DATA[i][240] := FieldByName('TCOND').AsString;                //기타조건
             _Ora_DATA[i][241] := FieldByName('TCOMPANY').AsString;             //파견업체
             _Ora_DATA[i][242] := FieldByName('Ntcompany').AsString;            //파견업체명
             // tab-7
             _Ora_DATA[i][243] := FieldByName('CHNNAME').AsString;              //한자성명
             _Ora_DATA[i][244] := FieldByName('ENGNAME').AsString;              //영문성명
             _Ora_DATA[i][245] := FieldByName('ELDSONYN').AsString;             //장남여부
             _Ora_DATA[i][246] := FieldByName('MARRIGEYN').AsString;            //결혼여부
             _Ora_DATA[i][247] := FieldByName('JUMINID').AsString;              //주민등록번호
             _Ora_DATA[i][248] := FieldByName('BIRTHGUBUN').AsString;           //양력/음력
             _Ora_DATA[i][249] := FieldByName('BIRTHDAY').AsString;             //실제생년월일
             _Ora_DATA[i][250] := FieldByName('KORAGE').AsString;               //한국연령
             _Ora_DATA[i][251] := FieldByName('USAAGE').AsString;               //외국연령
             _Ora_DATA[i][252] := FieldByName('SEX').AsString;                  //성별
             _Ora_DATA[i][253] := FieldByName('Nsex').AsString;                 //성별명
             _Ora_DATA[i][254] := FieldByName('E_MAIL').AsString;               //E_MAIL
             _Ora_DATA[i][255] := FieldByName('SKEMAIL').AsString;              //SK그룹메일
             _Ora_DATA[i][256] := FieldByName('HOLDNAME').AsString;             //호주성명
             _Ora_DATA[i][257] := FieldByName('HOLDREL').AsString;              //호주와의 관계
             _Ora_DATA[i][258] := FieldByName('Nholdrel').AsString;             //호주와의 관계명
             _Ora_DATA[i][259] := FieldByName('HOUSETYPE').AsString;            //주거형태
             _Ora_DATA[i][260] := FieldByName('Nhousetype').AsString;           //주거형태명
             _Ora_DATA[i][261] := FieldByName('HEALTH').AsString;               //건강상태
             _Ora_DATA[i][262] := FieldByName('Nhealth').AsString;              //주거형태명
             _Ora_DATA[i][263] := FieldByName('BORNAREA').AsString;             //출생지
             _Ora_DATA[i][264] := FieldByName('Nbornarea').AsString;            //출생지명
             _Ora_DATA[i][265] := FieldByName('REGADDR').AsString;              //본적주소
             _Ora_DATA[i][266] := FieldByName('CURADDR').AsString;              //현주소
             _Ora_DATA[i][267] := FieldByName('ZIPNO').AsString;                //우편번호
             _Ora_DATA[i][268] := FieldByName('CURNATION').AsString;            //실거주지 국가코드
             _Ora_DATA[i][269] := FieldByName('Ncurnation').AsString;           //실거주지 국가명
             _Ora_DATA[i][270] := FieldByName('CURREGION').AsString;            //실거주지 지역코드
             _Ora_DATA[i][271] := FieldByName('Ncurregion').AsString;           //실거주지 지역명
             _Ora_DATA[i][272] := FieldByName('NATION').AsString;               //국가
             _Ora_DATA[i][273] := FieldByName('Nnation').AsString;              //국가명
             _Ora_DATA[i][274] := FieldByName('REGION').AsString;               //주민등록지/호구소재지 지역코드
             _Ora_DATA[i][275] := FieldByName('Nregion').AsString;              //주민등록지/호구소재지 지역명
             _Ora_DATA[i][276] := FieldByName('POSTNO').AsString;               //주민등록지(우편번호)/호구소재지번
             _Ora_DATA[i][277] := FieldByName('ADDRESS').AsString;              //주민등록지/호구소재지 주소
             _Ora_DATA[i][278] := FieldByName('TELNO').AsString;                //전화번호
             _Ora_DATA[i][279] := FieldByName('OFFITEL').AsString;              //사내전화번호
             _Ora_DATA[i][280] := FieldByName('RELIGION').AsString;             //종교
             _Ora_DATA[i][281] := FieldByName('Nreligion').AsString;            //종교명
             _Ora_DATA[i][282] := FieldByName('HABIT').AsString;                //취미
             _Ora_DATA[i][283] := FieldByName('ABILITY').AsString;              //특기
             _Ora_DATA[i][284] := FieldByName('BLOOD').AsString;                //혈액형
             _Ora_DATA[i][285] := FieldByName('HEIGHT').AsString;               //신장
             _Ora_DATA[i][286] := FieldByName('WEIGHT').AsString;               //체중
           end
           else
           begin
             _Ora_DATA[i][  1] := inttostr(i+1);
             _Ora_DATA[i][  2] := OraExcelQuery.FieldbyName('EMPNO').AsString;
             _Ora_DATA[i][  3] := '자료없음';
           end;

           PgBar.Position := PgBar.Position + 1;
           OraExcelQuery.next;
        end;
      end;
      SendMessage(DBGridSearch.Handle, WM_SETREDRAW,integer(True), 0);
      InvalidateRect(DBGridSearch.Handle, Nil, False);

      PgBar.Position := 0;

      //엑셀저장
      _PSaveToXLS();

    finally

    end;
end;

procedure TPIA10102Form._PSaveToXLS();
var
   XL, XArr: Variant;
   i, j    : Integer;
   RangeStr: String;
   Col, Row  : Integer;
begin

    //EXCEL
    Col := 287;
    Row := OraExcelQuery.RecordCount;


    XArr := VarArrayCreate([0, Col], VarVariant);
    try
      try

        XL := CreateOLEObject('Excel.Application');
      except
        MessageDlg('Excel이 설치되어 있지 않습니다.', MtWarning, [mbok], 0);
        Exit;
      end;

      Screen.Cursor := CrHourGlass;
      XL.WorkBooks.Add;
      XL.Visible := false;

      //범위
      RangeStr := '';
      if (Col) > 26 then
      begin
        if (Col) mod 26 = 0 then
        begin
          RangeStr := RangeStr + Chr(Ord('A') - 2 + ((Col) div 26));
          RangeStr := RangeStr + 'Z';
        end
        else
        begin
          RangeStr := RangeStr + Chr(Ord('A') - 1 + ((Col) div 26));
          RangeStr := RangeStr + Chr(Ord('A') - 1 + ((Col) mod 26));
        end;
      end
      else
      RangeStr := RangeStr + Chr(Ord('A') - 1 + (Col));

      //엑셀
      //TITLE SETTING
      // tab-1
      XArr[  0]  := '일렬번호';
      XArr[  1]  := '조직차수';                     //ORGNUM
      XArr[  2]  := '사원번호';                     //EMPNO
      XArr[  3]  := '성  명';                       //KORNAME,
      XArr[  4]  := '국가';                         //Country
      XArr[  5]  := '국가명';                       //NCountry
      XArr[  6]  := '인사상태';                     //PSTATE
      XArr[  7]  := '인사상태명';                   //NPSTATE
      XArr[  8]  := '현원포함여부';                 //PSTATEYN
      XArr[  9]  := '현BAND';                       //PAYCL
      XArr[ 10]  := '현BAND명';                     //NPAYCL
      XArr[ 11]  := '사원유형';                     //Nemptypecd
      XArr[ 12]  := '사원유형명';                   //Nemptypenm
      XArr[ 13]  := 'ROLE LEVEL';                   //ROLELEVEL
      XArr[ 14]  := 'ROLE LEVEL명';                 //NROLELEVEL
      XArr[ 15]  := 'ROLE LEVE DATE';               //ROLELVDATE
      XArr[ 16]  := '본부코드';                     //BONCODE
      XArr[ 17]  := '재무부서';                     //FINCODE
      XArr[ 18]  := '호봉';                         //PAYGR
      XArr[ 19]  := '소속부서';                     //DEPTCODE
      XArr[ 20]  := '소속부서명';                   //Ndeptcode
      XArr[ 21]  := '소속그룹명';                   //Njikgroup
      XArr[ 22]  := '소속부문';                     //FIELDCODE
      XArr[ 23]  := '소속부문명';                   //NFIELDCODE
      XArr[ 24]  := '근무부서';                     //JOBDEPT
      XArr[ 25]  := '근무부서명';                   //NJOBDEPT
      XArr[ 26]  := '직책';                         //PAYRA
      XArr[ 27]  := '직책명';                       //NPAYRA
      XArr[ 28]  := '근무직책';                     //JOBPAYRA
      XArr[ 29]  := '근무직책명';                   //NJOBPAYRA
      //XArr[  ]  := '현직책명';                    //PAYDUNM
      XArr[ 30]  := '전보일';                       //REALTRDATE
      XArr[ 31]  := '조직전보일';                   //OFFTRDATE
      //XArr[  ]  := '전보제한일(FROM)';            //TRLIMFRDATE
      //XArr[  ]  := '전보제한일(TO)';              //TRLIMTODATE
      XArr[ 32]  := '보임여부';                     //PAYRAYN
      XArr[ 33]  := '근무부서보임여부';             //JOBPAYRAYN
      XArr[ 34]  := '임원선임일';                   //IMWONDATE
      XArr[ 35]  := '보임일';                       //CPAYRADATE
      XArr[ 36]  := '상세근무지';                   //JOBPLACE
      XArr[ 37]  := '상세근무지명';                 //Njobplace
      XArr[ 38]  := '근무지국가';                   //NplaceNation
      XArr[ 39]  := '최초입사일';                   //EMPDATE
      XArr[ 40]  := '입사일';                       //ORGEMPDATE
      XArr[ 41]  := '근무지국가';                   //GROUPEMPDATE
      XArr[ 42]  := '최초그룹입사일';               //GROUPCOMPANY
      XArr[ 43]  := '근무지국가';                   //CPAYCLDATE
      XArr[ 44]  := '승격일';                       //PAYCLDATE
      XArr[ 45]  := '구BAND조정일';                 //OLD_PAYCLDATE
      XArr[ 46]  := '직무대리BAND';                 //REPPAYCL
      XArr[ 47]  := '직무대리BAND명';               //Nreppaycl
      XArr[ 48]  := '직무대리일(FROM)';             //REPPAYFRDATE
      XArr[ 49]  := '직무대리일(TO)';               //REPPAYTODATE
      XArr[ 50]  := '겸직직책';                     //APDPAYDUNM
      XArr[ 51]  := '겸직직책(FROM)';               //APDPAYFRDATE
      XArr[ 52]  := '겸직직책(TO)';                 //APDPAYTODATE
      XArr[ 53]  := '직무대행직책';                 //ACTPAYDUNM
      XArr[ 54]  := '직무대행일(FROM)';             //ACTPAYFRDATE
      XArr[ 55]  := '직무대행일(TO)';               //ACTPAYTODATE
      //XArr[  ]  := '최종장기승호일';              //LRAGRDATE
      XArr[ 56]  := '특기사항';                     //REMARK
      XArr[ 57]  := '특기사항명';                   //NREMARK
      XArr[ 58]  := '채용원천';                     //EMPCODE
      XArr[ 59]  := '채용원천명';                   //Nempcode
      XArr[ 60]  := '입사기수';                     //EMPTERM
      XArr[ 61]  := '입사학력';                     //EMPSCHGR
      XArr[ 62]  := '입사학력명';                   //Nempschgr
      XArr[ 63]  := '입사BAND';                     //EMPPAYCL
      XArr[ 64]  := '입사BAND명';                   //Nemppaycl
      XArr[ 65]  := '입사호봉';                     //EMPPAYGR
      //XArr[  ]  := '입사시직렬';                  //EMPJOBLINE
      //XArr[  ]  := '입사시근무지';                //EMPJOBPLACE
      XArr[ 66]  := '부여호봉';                     //GRPAYGRSUM
      XArr[ 67]  := '군혜택호봉';                   //ARMYPAYGR
      XArr[ 68]  := '석사호봉';                     //MASPAYGR
      XArr[ 69]  := '경력호봉';                     //CARPAYGR
      XArr[ 70]  := '기타호봉';                     //ETCPAYGR
      XArr[ 71]  := '기타호봉내역';                 //ETCPAYCONT
      XArr[ 72]  := '입사전총경력년';               //BCARYY
      XArr[ 73]  := '입사전총경력월';               //BCARMM
      XArr[ 74]  := '경력일';                       //CARDATE
      // tab-2
      XArr[ 75]  := '직군';                         //JOBGUN
      XArr[ 76]  := '직군명';                       //Njobgun
      XArr[ 77]  := '직군일';                       //JOBGUNDATE
      XArr[ 78]  := '직렬';                         //JOBLINE
      XArr[ 79]  := '직렬일';                       //JOBLINEDATE
      XArr[ 80]  := '직종';                         //JOBKIND
      XArr[ 81]  := '직종명';                       //Njobkind
      XArr[ 82]  := '직종일';                       //JOBKINDDATE
      XArr[ 83]  := '직무';                         //JOBDUTY
      XArr[ 84]  := '직무명';                       //NJOBDUTY
      XArr[ 85]  := '직무일';                       //JOBDUTYDATE
      XArr[ 86]  := '노조원구분';                   //NojoYN
      XArr[ 87]  := '노조세부 구분';                //NOGUBUN
      XArr[ 88]  := '노조세부 구분명';              //Nnogubun
      XArr[ 89]  := '노조전임여부';                 //NOJEONYN
      XArr[ 90]  := '노조전임일(FROM)';             //NOJNFRDATE
      XArr[ 91]  := '노조전임일(TO)';               //NOJNTODATE
      XArr[ 92]  := '최종발령구분';                 //LANCODE
      XArr[ 93]  := '최종발령구분명';               //Nlancode
      XArr[ 94]  := '최종발령번호';                 //LANNONO
      XArr[ 95]  := '최종발령일(FROM)';             //LANFRDATE
      XArr[ 96]  := '최종발령일(TO)';               //LANTODATE
      XArr[ 97]  := '총근속제외기간횟수';           //EXDUTCNT
      XArr[ 98]  := '총근속제외기간년';             //EXDUTYY
      XArr[ 99]  := '총근속제외기간월';             //EXDUTMM
      XArr[100]  := '총근속제외기간일';             //EXDUTDD
      XArr[101]  := '최종근속제외기간(FROM)';       //LEXFRDATE
      XArr[102]  := '최종근속제외기간(TO)';         //LEXTODATE
      XArr[103]  := '최종근속제외기간년';           //LEXDUYY
      XArr[104]  := '최종근속제외기간월';           //LEXDUMM
      XArr[105]  := '최종근속제외기간일';           //LEXDUDD
      XArr[106]  := '재급기간년';                   //PAYCLYY
      XArr[107]  := '재급기간월';                   //PAYCLMM
      XArr[108]  := '재급기간일';                   //PAYCLDD
      XArr[109]  := '총재급일';                     //TOTPAYCLDD
      XArr[110]  := '근속기간년';                   //MDUYY
      XArr[111]  := '근속기간월';                   //COMDUMM
      XArr[112]  := '근속기간일';                   //COMDUDD
      XArr[113]  := '총재직일';                     //TOTCOMDUDD
      // tab-3
      XArr[114]  := '군별';                      //ARMYKIND
      XArr[115]  := '군별명';                    //Narmykind
      XArr[116]  := '계급';                      //ARMYCL
      XArr[117]  := '계급명';                    //Narmycl
      XArr[118]  := '병과';                      //ARMYFIELD
      XArr[119]  := '병과명';                    //Narmyfield
      XArr[120]  := '입대일자';                  //ARMYFRDATE
      XArr[121]  := '제대일자';                  //ARMYTODATE
      XArr[122]  := '제대구분';                  //ARMYDIS
      XArr[123]  := '제대구분명';                //Narmydis
      XArr[124]  := '면제사유';                  //ARMYEX
      XArr[125]  := '면제사유명';                //Narmyex
      XArr[126]  := '최종학력';                  //LSCHGR
      XArr[127]  := '최종학력명';                //Nlschgr
      XArr[128]  := '최종학위';                  //LSCHDEG
      XArr[129]  := '최종학위명';                //Nlschdeg
      XArr[130]  := '최종학력학교';              //LSCHCODE
      XArr[131]  := '최종학력학교명';            //LSCHNM
      XArr[132]  := '최종학교입학년월';          //LSCHFRYM
      XArr[133]  := '최종학교졸업년월';          //LSCHGRYM
      XArr[134]  := '최종학교전공';              //LMAJORCODE
      XArr[135]  := '최종학교전공명';            //Nlmajorcode
      XArr[136]  := '대학교';                    //UNICODE
      XArr[137]  := '대학교명';                  //Nunicode
      XArr[138]  := '대학교전공';                //UNIMAJOR
      XArr[139]  := '대학교전공명';              //Nunimajor
      XArr[140]  := '대학교입학년월';            //UNIFRYM
      XArr[141]  := '대학교졸업년월';            //UNIGRYM
      XArr[142]  := '최종학교세부전공';          //LSCHMAJNM
      XArr[143]  := '최종학교논문';              //LSCHTOPIC
      XArr[144]  := '자격/면허';                 //LICKIND
      XArr[145]  := '자격/면허명';               //Nlickind
      XArr[146]  := '발행처';                    //PUBLISH
      XArr[147]  := '자격/면허유형';             //Nliccd
      XArr[148]  := '자격/면허유형명';           //Nlicnm
      XArr[149]  := '자격/면허등급';             //LICGR
      XArr[150]  := '자격/면허등급명';           //Nlicgr
      XArr[151]  := '자격/면허취득일';           //LICGETDATE
      XArr[152]  := '선임자격면허종류';          //LICALKIND
      XArr[153]  := '선임자격면허종류명';        //Nlicalkind
      XArr[154]  := '선임자격면허등급';          //LICALGR
      XArr[155]  := '선임자격면허등급명';        //Nlicalgr
      XArr[156]  := '선임자격면허취득일';        //LICALGETDATE
      XArr[157]  := '선임분야';                  //LICALFIELD
      XArr[158]  := '선임일';                    //LICALDATE
      XArr[159]  := '비고';                      //LICBIGO
      XArr[160]  := '최종 TOEIC 시험성적';       //TOEICSCORE
      XArr[161]  := '최종 TOEIC 만점';           //TOEICFULL
      XArr[162]  := '최종 TOEIC 시험일자';       //TOEICDATE
      XArr[163]  := '최종 JPT 시험성적';         //JPTSCORE
      XArr[164]  := '최종 JPT 만점';             //JPTFULL
      XArr[165]  := '최종 JPT 시험일자';         //JPTDATE
      XArr[166]  := '외국어유형';                //LANGTYPE
      XArr[167]  := '외국어유형명';              //Nlangtype
      XArr[168]  := '시험유형';                  //EXAMTYPE
      XArr[169]  := '시험유형명';                //Nexamtype
      XArr[170]  := '외국어명';                  //LANGNAME
      XArr[171]  := '시험일자';                  //EXAMDATE
      //XArr[  ]  := '검정기관';                 //EXAMPLACE
      // tab-4
      XArr[172]  := '교육종류';                  //EDUGUBUN
      XArr[173]  := '교육종류명';                //Nedugubun
      XArr[174]  := '교육기관';                  //EDUPLACE
      XArr[175]  := '교육과정';                  //EDUCOURSE
      XArr[176]  := '교육기간(FROM)';            //EDUFRDATE
      XArr[177]  := '교육기간(TO)';              //EDUTODATE
      XArr[178]  := '교육지역';                  //EDUAREA
      XArr[179]  := '연락처';                    //EDUCONT
      XArr[180]  := '의무복무기간(FROM)';        //EDUDUFRDATE
      XArr[181]  := '의무복무기간(TO)';          //EDUDUTODATE
      XArr[182]  := '휴직구분';                  //LRKIND
      XArr[183]  := '휴직구분명';                //Nlrkind
      XArr[184]  := '휴직구분(FROM)';            //LRFRDATE
      XArr[185]  := '휴직구분(TO)';              //LRTODATE
      XArr[186]  := '휴직휴가기간(FROM)';        //LVFRDATE
      XArr[187]  := '휴직휴가기간(TO)';          //LVTODATE
      XArr[188]  := '파견구분';                  //LSEKIND
      XArr[189]  := '파견구분명';                //Nlsekind
      XArr[190]  := '파견구분(FROM)';            //LSEFRDATE
      XArr[191]  := '파견구분(TO)';              //LSETODATE
      XArr[192]  := '파견기관';                  //LSEPLACE
      XArr[193]  := '파견목적';                  //LSESAYU
      XArr[194]  := '파견연락처';                //LSECONT
      XArr[195]  := '휴가구분';                  //HUGUBUN
      XArr[196]  := '휴가구분명';                //Nhugubun
      XArr[197]  := '휴가구분(FROM)';            //HUFRDATE
      XArr[198]  := '휴가구분(TO)';              //HUTODATE
      XArr[199]  := '퇴직일자';                  //RETDATE
      XArr[200]  := '퇴직구분';                  //RETGUBUN
      XArr[201]  := '퇴직구분명';                //Nretgubun
      XArr[202]  := '퇴직실제사유1';             //RETSAYU1
      XArr[203]  := '퇴직실제사유명1';           //Nretsayu1
      XArr[204]  := '퇴직실제사유2';             //RETSAYU2
      XArr[205]  := '퇴직실제사유명2';           //Nretsayu2
      XArr[206]  := '휴대전화';                  //RETCONT
      // tab-5
      XArr[207]  := '보훈구분';                  //BOHUNGUBUN
      XArr[208]  := '보훈구분명';                //Nbohungubun
      XArr[209]  := '유공자';                    //BOHUNNM
      XArr[210]  := '유공자와의관계';            //BOHUNREL
      XArr[211]  := '유공자와의관계명';          //Nbohunrel
      XArr[212]  := '보훈번호';                  //BOHUNNO
      XArr[213]  := '자력지청';                  //BOHUNBRAN
      XArr[214]  := '보훈대상여부';              //BOHUNYN
      XArr[215]  := '특례구분';                  //SCGUBUN
      XArr[216]  := '특례구분명';                //Nscgubun
      XArr[217]  := '특례편입일자';              //SCENTDATE
      XArr[218]  := '특례편입일자';              //SCPREDATE
      XArr[219]  := '특례만료일자';              //SCENDDATE
      XArr[220]  := '특례만료여부';              //SCTERMYN
      XArr[221]  := '복무제외년';                //SCEXYY
      XArr[222]  := '복무제외월';                //SCEXMM
      XArr[223]  := '복무제외일';                //SCEXDD
      XArr[224]  := '복무제외사유';              //SCEXCAUSE
      XArr[225]  := '장애인유형';                //OBSKIND
      XArr[226]  := '장애인유형명';              //Nobskind
      XArr[227]  := '장애인등급';                //OBSGR
      XArr[228]  := '장애인등급명';              //Nobsgr
      XArr[229]  := '장애인상세상태';            //OBSSTATE
      XArr[230]  := '계약기간(FROM)';            //OTDUFRDATE
      XArr[231]  := '계약기간(TO)';              //OTDUTODATE
      XArr[232]  := '계약방법';                  //TCONTR
      XArr[233]  := '계약방법명';                //Ntcontr
      XArr[234]  := '계약금액';                  //TCONTRAMT
      XArr[235]  := '근무형태';                  //TTYPE
      XArr[236]  := '담당직무';                  //TJOBDUTY
      XArr[237]  := '담당직무명';                //Ptjobduty
      XArr[238]  := '직무등급';                  //TDUTYCLASS
      XArr[239]  := '직무등급명';                //Ntdutyclass
      XArr[240]  := '기타조건';                  //TCOND
      XArr[241]  := '파견업체';                  //TCOMPANY
      XArr[242]  := '파견업체명';                //Ntcompany
      // tab-7
      XArr[243]  := '한자성명';                     //CHNNAME
      XArr[244]  := '영문성명';                     //ENGNAME
      XArr[245]  := '장남여부';                     //ELDSONYN
      XArr[246]  := '결혼여부';                     //MARRIGEYN
      XArr[247]  := '주민등록번호';                 //JUMINID
      XArr[248]  := '양력/음력';                    //BIRTHGUBUN
      XArr[249]  := '실제생년월일';                 //BIRTHDAY
      XArr[250]  := '한국연령';                     //KORAGE
      XArr[251]  := '외국연령';                     //USAAGE
      XArr[252]  := '성별';                         //SEX
      XArr[253]  := '성별명';                       //Nsex
      XArr[254]  := 'E_MAIL';                       //E_MAIL
      XArr[255]  := 'SK그룹메일';                   //SKEMAIL
      XArr[256]  := '호주성명';                     //HOLDNAME
      XArr[257]  := '호주와의 관계';                //HOLDREL
      XArr[258]  := '호주와의 관계명';              //Nholdrel
      XArr[259]  := '주거형태';                     //HOUSETYPE
      XArr[260]  := '주거형태명';                   //Nhousetype
      XArr[261]  := '건강상태';                     //HEALTH
      XArr[262]  := '주거형태명';                   //Nhealth
      XArr[263]  := '출생지';                       //BORNAREA
      XArr[264]  := '출생지명';                     //Nbornarea
      XArr[265]  := '본적주소';                     //REGADDR
      XArr[266]  := '현주소';                       //CURADDR
      XArr[267]  := '우편번호';                     //ZIPNO
      XArr[268]  := '실거주지 국가코드';            //CURNATION
      XArr[269]  := '실거주지 국가명';              //Ncurnation
      XArr[270]  := '실거주지 지역코드';            //CURREGION
      XArr[271]  := '실거주지 지역명';              //Ncurregion
      XArr[272]  := '국가';                         //NATION
      XArr[273]  := '국가명';                       //Nnation
      XArr[274]  := '주민등록지/호구소재지 지역코드';          //REGION
      XArr[275]  := '주민등록지/호구소재지 지역명';            //Nregion
      XArr[276]  := '주민등록지(우편번호)/호구소재지번호';     //POSTNO
      XArr[277]  := '주민등록지/호구소재지 주소';              //ADDRESS
      XArr[278]  := '전화번호';                  //TELNO
      XArr[279]  := '사내전화번호';              //OFFITEL
      XArr[280]  := '종교';                      //RELIGION
      XArr[281]  := '종교명';                    //Nreligion
      XArr[282]  := '취미';                      //HABIT
      XArr[283]  := '특기';                      //ABILITY
      XArr[284]  := '혈액형';                    //BLOOD
      XArr[285]  := '신장';                      //HEIGHT
      XArr[286]  := '체중';                      //WEIGHT
      XL.Range['A1', RangeStr + IntToStr(1)].Value := XArr;

      //DATA
      for i := 0 to Row-1 do
      begin
        for j := 0 to Col-1 do
        begin
             if (i >= 0) and (j  = 2) then   //사원번호
                XArr[j]  := '''' +  _Ora_DATA[i][ j]
             else
                XArr[j] :=  _Ora_DATA[i][ j];
        end;
        XL.Range['A' + IntToStr(i+2), RangeStr + IntToStr(i+2)].Value := XArr;
      end;

      //셀 크기 조정
      XL.Range['A1', RangeStr + IntToStr(i+1)].Select;
      XL.Selection.Columns.AutoFit;
      XL.Range['B2', 'B2'].Select;
      XL.Visible := true;

      Screen.Cursor := crDefault;

    finally

      Screen.Cursor := crDefault;
    end;
end;

procedure TPIA10102Form._PTmpGridValue(pi: Integer; pStr: String;
    StoredProc: TOraStoredProc; StringGrid: TStringGrid);
begin

   with StringGrid, StoredProc do
   begin
     if not StoredProc.eof then
     begin
         rowcount := rowcount + 1;
         // tab-1
         Cells[  0, rowcount -1]  := IntToStr(pi);
         Cells[  1, rowcount -1]  := FieldByName('ORGNUM').AsString;
         Cells[  2, rowcount -1]  := FieldByName('EMPNO').AsString;
         Cells[  3, rowcount -1]  := FieldByName('KORNAME').AsString;              //성  명
         Cells[  4, rowcount -1]  := FieldByName('Country').AsString;              //국가
         Cells[  5, rowcount -1]  := FieldByName('NCountry').AsString;             //국가명
         Cells[  6, rowcount -1]  := FieldByName('PSTATE').AsString;               //인사상태
         Cells[  7, rowcount -1]  := FieldByName('NPSTATE').AsString;              //인사상태명
         Cells[  8, rowcount -1]  := FieldByName('PSTATEYN').AsString;             //현원포함여부
         Cells[  9, rowcount -1]  := FieldByName('PAYCL').AsString;                //현BAND
         Cells[ 10, rowcount -1]  := FieldByName('NPAYCL').AsString;               //현BAND명
         Cells[ 11, rowcount -1]  := FieldByName('Nemptypecd').AsString;           //사원유형
         Cells[ 12, rowcount -1]  := FieldByName('Nemptypenm').AsString;           //사원유형명
         Cells[ 13, rowcount -1]  := FieldByName('ROLELEVEL').AsString;            //ROLE LEVEL
         Cells[ 14, rowcount -1]  := FieldByName('NROLELEVEL').AsString;           //ROLE LEVEL명
         Cells[ 15, rowcount -1]  := FieldByName('ROLELVDATE').AsString;           //ROLE LEVE DATE
         Cells[ 16, rowcount -1]  := FieldByName('BONCODE').AsString;              //본부코드
         Cells[ 17, rowcount -1]  := FieldByName('FINCODE').AsString;              //재무부서
         Cells[ 18, rowcount -1]  := FieldByName('PAYGR').AsString;                //호봉
         Cells[ 19, rowcount -1]  := FieldByName('DEPTCODE').AsString;             //소속부서
         Cells[ 20, rowcount -1]  := FieldByName('Ndeptcode').AsString;            //소속부서명
         Cells[ 21, rowcount -1]  := FieldByName('Njikgroup').AsString;            //소속그룹명
         Cells[ 22, rowcount -1]  := FieldByName('FIELDCODE').AsString;            //소속부문
         Cells[ 23, rowcount -1]  := FieldByName('NFIELDCODE').AsString;           //소속부문명
         Cells[ 24, rowcount -1]  := FieldByName('JOBDEPT').AsString;              //근무부서
         Cells[ 25, rowcount -1]  := FieldByName('NJOBDEPT').AsString;             //근무부서명
         Cells[ 26, rowcount -1]  := FieldByName('PAYRA').AsString;                //직책
         Cells[ 27, rowcount -1]  := FieldByName('NPAYRA').AsString;               //직책명
         Cells[ 28, rowcount -1]  := FieldByName('JOBPAYRA').AsString;             //근무직책
         Cells[ 29, rowcount -1]  := FieldByName('NJOBPAYRA').AsString;            //근무직책명
         Cells[ 30, rowcount -1]  := FieldByName('REALTRDATE').AsString;           //전보일
         Cells[ 31, rowcount -1]  := FieldByName('OFFTRDATE').AsString;            //조직전보일
         Cells[ 32, rowcount -1]  := FieldByName('PAYRAYN').AsString;              //보임여부
         Cells[ 33, rowcount -1]  := FieldByName('JOBPAYRAYN').AsString;           //근무부서보임여부
         Cells[ 34, rowcount -1]  := FieldByName('IMWONDATE').AsString;            //임원선임일
         Cells[ 35, rowcount -1]  := FieldByName('CPAYRADATE').AsString;           //보임일
         Cells[ 36, rowcount -1]  := FieldByName('JOBPLACE').AsString;             //상세근무지
         Cells[ 37, rowcount -1]  := FieldByName('Njobplace').AsString;            //상세근무지명
         Cells[ 38, rowcount -1]  := FieldByName('NplaceNation').AsString;         //근무지국가
         Cells[ 39, rowcount -1]  := FieldByName('EMPDATE').AsString;              //최초입사일
         Cells[ 40, rowcount -1]  := FieldByName('ORGEMPDATE').AsString;           //입사일
         Cells[ 41, rowcount -1]  := FieldByName('GROUPEMPDATE').AsString;         //근무지국가
         Cells[ 42, rowcount -1]  := FieldByName('GROUPCOMPANY').AsString;         //최초그룹입사일
         Cells[ 43, rowcount -1]  := FieldByName('CPAYCLDATE').AsString;           //근무지국가
         Cells[ 44, rowcount -1]  := FieldByName('PAYCLDATE').AsString;            //승격일
         Cells[ 45, rowcount -1]  := FieldByName('OLD_PAYCLDATE').AsString;        //구BAND조정일
         Cells[ 46, rowcount -1]  := FieldByName('REPPAYCL').AsString;             //직무대리BAND
         Cells[ 47, rowcount -1]  := FieldByName('Nreppaycl').AsString;            //직무대리BAND명
         Cells[ 48, rowcount -1]  := FieldByName('REPPAYFRDATE').AsString;         //직무대리일(FROM)
         Cells[ 49, rowcount -1]  := FieldByName('REPPAYTODATE').AsString;         //직무대리일(TO)
         Cells[ 50, rowcount -1]  := FieldByName('APDPAYDUNM').AsString;           //겸직직책
         Cells[ 51, rowcount -1]  := FieldByName('APDPAYFRDATE').AsString;         //겸직직책(FROM)
         Cells[ 52, rowcount -1]  := FieldByName('APDPAYTODATE').AsString;         //겸직직책(TO)
         Cells[ 53, rowcount -1]  := FieldByName('ACTPAYDUNM').AsString;           //직무대행직책
         Cells[ 54, rowcount -1]  := FieldByName('ACTPAYFRDATE').AsString;         //직무대행일(FROM)
         Cells[ 55, rowcount -1]  := FieldByName('ACTPAYTODATE').AsString;         //직무대행일(TO)
         Cells[ 56, rowcount -1]  := FieldByName('REMARK').AsString;               //특기사항
         Cells[ 57, rowcount -1]  := FieldByName('NREMARK').AsString;              //특기사항명
         Cells[ 58, rowcount -1]  := FieldByName('EMPCODE').AsString;              //채용원천
         Cells[ 59, rowcount -1]  := FieldByName('Nempcode').AsString;             //채용원천명
         Cells[ 60, rowcount -1]  := FieldByName('EMPTERM').AsString;              //입사기수
         Cells[ 61, rowcount -1]  := FieldByName('EMPSCHGR').AsString;             //입사학력
         Cells[ 62, rowcount -1]  := FieldByName('Nempschgr').AsString;            //입사학력명
         Cells[ 63, rowcount -1]  := FieldByName('EMPPAYCL').AsString;             //입사BAND
         Cells[ 64, rowcount -1]  := FieldByName('Nemppaycl').AsString;            //입사BAND명
         Cells[ 65, rowcount -1]  := FieldByName('EMPPAYGR').AsString;             //입사호봉
         Cells[ 66, rowcount -1]  := FieldByName('GRPAYGRSUM').AsString;           //부여호봉
         Cells[ 67, rowcount -1]  := FieldByName('ARMYPAYGR').AsString;            //군혜택호봉
         Cells[ 68, rowcount -1]  := FieldByName('MASPAYGR').AsString;             //석사호봉
         Cells[ 69, rowcount -1]  := FieldByName('CARPAYGR').AsString;             //경력호봉
         Cells[ 70, rowcount -1]  := FieldByName('ETCPAYGR').AsString;             //기타호봉
         Cells[ 71, rowcount -1]  := FieldByName('ETCPAYCONT').AsString;           //기타호봉내역
         Cells[ 72, rowcount -1]  := FieldByName('BCARYY').AsString;               //입사전총경력년
         Cells[ 73, rowcount -1]  := FieldByName('BCARMM').AsString;               //입사전총경력월
         Cells[ 74, rowcount -1]  := FieldByName('CARDATE').AsString;              //경력일
         // tab-2
         Cells[ 75, rowcount -1]  := FieldByName('JOBGUN').AsString;               //직군
         Cells[ 76, rowcount -1]  := FieldByName('Njobgun').AsString;              //직군명
         Cells[ 77, rowcount -1]  := FieldByName('JOBGUNDATE').AsString;           //직군일
         Cells[ 78, rowcount -1]  := FieldByName('JOBLINE').AsString;              //직렬
         Cells[ 79, rowcount -1]  := FieldByName('JOBLINEDATE').AsString;          //직렬일
         Cells[ 80, rowcount -1]  := FieldByName('JOBKIND').AsString;              //직종
         Cells[ 81, rowcount -1]  := FieldByName('Njobkind').AsString;             //직종명
         Cells[ 82, rowcount -1]  := FieldByName('JOBKINDDATE').AsString;          //직종일
         Cells[ 83, rowcount -1]  := FieldByName('JOBDUTY').AsString;              //직무
         Cells[ 84, rowcount -1]  := FieldByName('NJOBDUTY').AsString;              //직무명
         Cells[ 85, rowcount -1]  := FieldByName('JOBDUTYDATE').AsString;          //직무일
         Cells[ 86, rowcount -1]  := FieldByName('NojoYN').AsString;               //노조원구분
         Cells[ 87, rowcount -1]  := FieldByName('NOGUBUN').AsString;              //노조세부 구분
         Cells[ 88, rowcount -1]  := FieldByName('Nnogubun').AsString;             //노조세부 구분명
         Cells[ 89, rowcount -1]  := FieldByName('NOJEONYN').AsString;             //노조전임여부
         Cells[ 90, rowcount -1]  := FieldByName('NOJNFRDATE').AsString;           //노조전임일(FROM)
         Cells[ 91, rowcount -1]  := FieldByName('NOJNTODATE').AsString;           //노조전임일(TO)
         Cells[ 92, rowcount -1]  := FieldByName('LANCODE').AsString;              //최종발령구분
         Cells[ 93, rowcount -1]  := FieldByName('Nlancode').AsString;             //최종발령구분명
         Cells[ 94, rowcount -1]  := FieldByName('LANNONO').AsString;              //최종발령번호
         Cells[ 95, rowcount -1]  := FieldByName('LANFRDATE').AsString;            //최종발령일(FROM)
         Cells[ 96, rowcount -1]  := FieldByName('LANTODATE').AsString;            //최종발령일(TO)
         Cells[ 97, rowcount -1]  := FieldByName('EXDUTCNT').AsString;             //총근속제외기간횟수
         Cells[ 98, rowcount -1]  := FieldByName('EXDUTYY').AsString;              //총근속제외기간년
         Cells[ 99, rowcount -1]  := FieldByName('EXDUTMM').AsString;              //총근속제외기간월
         Cells[100, rowcount -1]  := FieldByName('EXDUTDD').AsString;              //총근속제외기간일
         Cells[101, rowcount -1]  := FieldByName('LEXFRDATE').AsString;            //최종근속제외기간(FROM)
         Cells[102, rowcount -1]  := FieldByName('LEXTODATE').AsString;            //최종근속제외기간(TO)
         Cells[103, rowcount -1]  := FieldByName('LEXDUYY').AsString;              //최종근속제외기간년
         Cells[104, rowcount -1]  := FieldByName('LEXDUMM').AsString;              //최종근속제외기간월
         Cells[105, rowcount -1]  := FieldByName('LEXDUDD').AsString;              //최종근속제외기간일
         Cells[106, rowcount -1]  := FieldByName('PAYCLYY').AsString;              //재급기간년
         Cells[107, rowcount -1]  := FieldByName('PAYCLMM').AsString;              //재급기간월
         Cells[108, rowcount -1]  := FieldByName('PAYCLDD').AsString;              //재급기간일
         Cells[109, rowcount -1]  := FieldByName('TOTPAYCLDD').AsString;           //총재급일
         Cells[110, rowcount -1]  := FieldByName('COMDUYY').AsString;              //근속기간년
         Cells[111, rowcount -1]  := FieldByName('COMDUMM').AsString;              //근속기간월
         Cells[112, rowcount -1]  := FieldByName('COMDUDD').AsString;              //근속기간일
         Cells[113, rowcount -1]  := FieldByName('TOTCOMDUDD').AsString;           //총재직일
         // tab-3
         Cells[114, rowcount -1]  := FieldByName('ARMYKIND').AsString;             //군별
         Cells[115, rowcount -1]  := FieldByName('Narmykind').AsString;            //군별명
         Cells[116, rowcount -1]  := FieldByName('ARMYCL').AsString;               //계급
         Cells[117, rowcount -1]  := FieldByName('Narmycl').AsString;              //계급명
         Cells[118, rowcount -1]  := FieldByName('ARMYFIELD').AsString;            //병과
         Cells[119, rowcount -1]  := FieldByName('Narmyfield').AsString;           //병과명
         Cells[120, rowcount -1]  := FieldByName('ARMYFRDATE').AsString;           //입대일자
         Cells[121, rowcount -1]  := FieldByName('ARMYTODATE').AsString;           //제대일자
         Cells[122, rowcount -1]  := FieldByName('ARMYDIS').AsString;              //제대구분
         Cells[123, rowcount -1]  := FieldByName('Narmydis').AsString;             //제대구분명
         Cells[124, rowcount -1]  := FieldByName('ARMYEX').AsString;               //면제사유
         Cells[125, rowcount -1]  := FieldByName('Narmyex').AsString;              //면제사유명
         Cells[126, rowcount -1]  := FieldByName('LSCHGR').AsString;               //최종학력
         Cells[127, rowcount -1]  := FieldByName('Nlschgr').AsString;              //최종학력명
         Cells[128, rowcount -1]  := FieldByName('LSCHDEG').AsString;              //최종학위
         Cells[129, rowcount -1]  := FieldByName('Nlschdeg').AsString;             //최종학위명
         Cells[130, rowcount -1]  := FieldByName('LSCHCODE').AsString;             //최종학력학교
         Cells[131, rowcount -1]  := FieldByName('LSCHNM').AsString;               //최종학력학교명
         Cells[132, rowcount -1]  := FieldByName('LSCHFRYM').AsString;             //최종학교입학년월
         Cells[133, rowcount -1]  := FieldByName('LSCHGRYM').AsString;             //최종학교졸업년월
         Cells[134, rowcount -1]  := FieldByName('LMAJORCODE').AsString;           //최종학교전공
         Cells[135, rowcount -1]  := FieldByName('Nlmajorcode').AsString;          //최종학교전공명
         Cells[136, rowcount -1]  := FieldByName('UNICODE').AsString;              //대학교
         Cells[137, rowcount -1]  := FieldByName('Nunicode').AsString;             //대학교명
         Cells[138, rowcount -1]  := FieldByName('UNIMAJOR').AsString;             //대학교전공
         Cells[139, rowcount -1]  := FieldByName('Nunimajor').AsString;            //대학교전공명
         Cells[140, rowcount -1]  := FieldByName('UNIFRYM').AsString;              //대학교입학년월
         Cells[141, rowcount -1]  := FieldByName('UNIGRYM').AsString;              //대학교졸업년월
         Cells[142, rowcount -1]  := FieldByName('LSCHMAJNM').AsString;            //최종학교세부전공
         Cells[143, rowcount -1]  := FieldByName('LSCHTOPIC').AsString;            //최종학교논문
         Cells[144, rowcount -1]  := FieldByName('LICKIND').AsString;              //자격/면허
         Cells[145, rowcount -1]  := FieldByName('Nlickind').AsString;             //자격/면허명
         Cells[146, rowcount -1]  := FieldByName('PUBLISH').AsString;              //발행처
         Cells[147, rowcount -1]  := FieldByName('Nliccd').AsString;               //자격/면허유형
         Cells[148, rowcount -1]  := FieldByName('Nlicnm').AsString;               //자격/면허유형명
         Cells[149, rowcount -1]  := FieldByName('LICGR').AsString;                //자격/면허등급
         Cells[150, rowcount -1]  := FieldByName('Nlicgr').AsString;               //자격/면허등급명
         Cells[151, rowcount -1]  := FieldByName('LICGETDATE').AsString;           //자격/면허취득일
         Cells[152, rowcount -1]  := FieldByName('LICALKIND').AsString;            //선임자격면허종류
         Cells[153, rowcount -1]  := FieldByName('Nlicalkind').AsString;           //선임자격면허종류명
         Cells[154, rowcount -1]  := FieldByName('LICALGR').AsString;              //선임자격면허등급
         Cells[155, rowcount -1]  := FieldByName('Nlicalgr').AsString;             //선임자격면허등급명
         Cells[156, rowcount -1]  := FieldByName('LICALGETDATE').AsString;         //선임자격면허취득일
         Cells[157, rowcount -1]  := FieldByName('LICALFIELD').AsString;           //선임분야
         Cells[158, rowcount -1]  := FieldByName('LICALDATE').AsString;            //선임일
         Cells[159, rowcount -1]  := FieldByName('LICBIGO').AsString;              //비고
         Cells[160, rowcount -1]  := FieldByName('TOEICSCORE').AsString;           //최종 TOEIC 시험성적
         Cells[161, rowcount -1]  := FieldByName('TOEICFULL').AsString;            //최종 TOEIC 만점
         Cells[162, rowcount -1]  := FieldByName('TOEICDATE').AsString;            //최종 TOEIC 시험일자
         Cells[163, rowcount -1]  := FieldByName('JPTSCORE').AsString;             //최종 JPT 시험성적
         Cells[164, rowcount -1]  := FieldByName('JPTFULL').AsString;              //최종 JPT 만점
         Cells[165, rowcount -1]  := FieldByName('JPTDATE').AsString;              //최종 JPT 시험일자
         Cells[166, rowcount -1]  := FieldByName('LANGTYPE').AsString;             //외국어유형
         Cells[167, rowcount -1]  := FieldByName('Nlangtype').AsString;            //외국어유형명
         Cells[168, rowcount -1]  := FieldByName('EXAMTYPE').AsString;             //시험유형
         Cells[169, rowcount -1]  := FieldByName('Nexamtype').AsString;            //시험유형명
         Cells[170, rowcount -1]  := FieldByName('LANGNAME').AsString;             //외국어명
         Cells[171, rowcount -1]  := FieldByName('EXAMDATE').AsString;             //시험일자
         // tab-4
         Cells[172, rowcount -1]  := FieldByName('EDUGUBUN').AsString;             //교육종류
         Cells[173, rowcount -1]  := FieldByName('Nedugubun').AsString;            //교육종류명
         Cells[174, rowcount -1]  := FieldByName('EDUPLACE').AsString;             //교육기관
         Cells[175, rowcount -1]  := FieldByName('EDUCOURSE').AsString;            //교육과정
         Cells[176, rowcount -1]  := FieldByName('EDUFRDATE').AsString;            //교육기간(FROM)
         Cells[177, rowcount -1]  := FieldByName('EDUTODATE').AsString;            //교육기간(TO)
         Cells[178, rowcount -1]  := FieldByName('EDUAREA').AsString;              //교육지역
         Cells[179, rowcount -1]  := FieldByName('EDUCONT').AsString;              //연락처
         Cells[180, rowcount -1]  := FieldByName('EDUDUFRDATE').AsString;          //의무복무기간(FROM)
         Cells[181, rowcount -1]  := FieldByName('EDUDUTODATE').AsString;          //의무복무기간(TO)
         Cells[182, rowcount -1]  := FieldByName('LRKIND').AsString;               //휴직구분
         Cells[183, rowcount -1]  := FieldByName('Nlrkind').AsString;              //휴직구분명
         Cells[184, rowcount -1]  := FieldByName('LRFRDATE').AsString;             //휴직구분(FROM)
         Cells[185, rowcount -1]  := FieldByName('LRTODATE').AsString;             //휴직구분(TO)
         Cells[186, rowcount -1]  := FieldByName('LVFRDATE').AsString;             //휴직휴가기간(FROM)
         Cells[187, rowcount -1]  := FieldByName('LVTODATE').AsString;             //휴직휴가기간(TO)
         Cells[188, rowcount -1]  := FieldByName('LSEKIND').AsString;              //파견구분
         Cells[189, rowcount -1]  := FieldByName('Nlsekind').AsString;             //파견구분명
         Cells[190, rowcount -1]  := FieldByName('LSEFRDATE').AsString;            //파견구분(FROM)
         Cells[191, rowcount -1]  := FieldByName('LSETODATE').AsString;            //파견구분(TO)
         Cells[192, rowcount -1]  := FieldByName('LSEPLACE').AsString;             //파견기관
         Cells[193, rowcount -1]  := FieldByName('LSESAYU').AsString;              //파견목적
         Cells[194, rowcount -1]  := FieldByName('LSECONT').AsString;              //파견연락처
         Cells[195, rowcount -1]  := FieldByName('HUGUBUN').AsString;              //휴가구분
         Cells[196, rowcount -1]  := FieldByName('Nhugubun').AsString;             //휴가구분명
         Cells[197, rowcount -1]  := FieldByName('HUFRDATE').AsString;             //휴가구분(FROM)
         Cells[198, rowcount -1]  := FieldByName('HUTODATE').AsString;             //휴가구분(TO)
         Cells[199, rowcount -1]  := FieldByName('RETDATE').AsString;              //퇴직일자
         Cells[200, rowcount -1]  := FieldByName('RETGUBUN').AsString;             //퇴직구분
         Cells[201, rowcount -1]  := FieldByName('Nretgubun').AsString;            //퇴직구분명
         Cells[202, rowcount -1]  := FieldByName('RETSAYU1').AsString;             //퇴직실제사유1
         Cells[203, rowcount -1]  := FieldByName('Nretsayu1').AsString;            //퇴직실제사유명1
         Cells[204, rowcount -1]  := FieldByName('RETSAYU2').AsString;             //퇴직실제사유2
         Cells[205, rowcount -1]  := FieldByName('Nretsayu2').AsString;            //퇴직실제사유명2
         Cells[206, rowcount -1]  := FieldByName('RETCONT').AsString;              //휴대전화
         // tab-5
         Cells[207, rowcount -1]  := FieldByName('BOHUNGUBUN').AsString;           //보훈구분
         Cells[208, rowcount -1]  := FieldByName('Nbohungubun').AsString;          //보훈구분명
         Cells[209, rowcount -1]  := FieldByName('BOHUNNM').AsString;              //유공자
         Cells[210, rowcount -1]  := FieldByName('BOHUNREL').AsString;             //유공자와의관계
         Cells[211, rowcount -1]  := FieldByName('Nbohunrel').AsString;            //유공자와의관계명
         Cells[212, rowcount -1]  := FieldByName('BOHUNNO').AsString;              //보훈번호
         Cells[213, rowcount -1]  := FieldByName('BOHUNBRAN').AsString;            //자력지청
         Cells[214, rowcount -1]  := FieldByName('BOHUNYN').AsString;              //보훈대상여부
         Cells[215, rowcount -1]  := FieldByName('SCGUBUN').AsString;              //특례구분
         Cells[216, rowcount -1]  := FieldByName('Nscgubun').AsString;             //특례구분명
         Cells[217, rowcount -1]  := FieldByName('SCENTDATE').AsString;            //특례편입일자
         Cells[218, rowcount -1]  := FieldByName('SCPREDATE').AsString;            //특례편입일자
         Cells[219, rowcount -1]  := FieldByName('SCENDDATE').AsString;            //특례만료일자
         Cells[220, rowcount -1]  := FieldByName('SCTERMYN').AsString;             //특례만료여부
         Cells[221, rowcount -1]  := FieldByName('SCEXYY').AsString;               //복무제외년
         Cells[222, rowcount -1]  := FieldByName('SCEXMM').AsString;               //복무제외월
         Cells[223, rowcount -1]  := FieldByName('SCEXDD').AsString;               //복무제외일
         Cells[224, rowcount -1]  := FieldByName('SCEXCAUSE').AsString;            //복무제외사유
         Cells[225, rowcount -1]  := FieldByName('OBSKIND').AsString;              //장애인유형
         Cells[226, rowcount -1]  := FieldByName('Nobskind').AsString;             //장애인유형명
         Cells[227, rowcount -1]  := FieldByName('OBSGR').AsString;                //장애인등급
         Cells[228, rowcount -1]  := FieldByName('Nobsgr').AsString;               //장애인등급명
         Cells[229, rowcount -1]  := FieldByName('OBSSTATE').AsString;             //장애인상세상태
         Cells[230, rowcount -1]  := FieldByName('OTDUFRDATE').AsString;           //계약기간(FROM)
         Cells[231, rowcount -1]  := FieldByName('OTDUTODATE').AsString;           //계약기간(TO)
         Cells[232, rowcount -1]  := FieldByName('TCONTR').AsString;               //계약방법
         Cells[233, rowcount -1]  := FieldByName('Ntcontr').AsString;              //계약방법명
         Cells[234, rowcount -1]  := FieldByName('TCONTRAMT').AsString;            //계약금액
         Cells[235, rowcount -1]  := FieldByName('TTYPE').AsString;                //근무형태
         Cells[236, rowcount -1]  := FieldByName('TJOBDUTY').AsString;             //담당직무
         Cells[237, rowcount -1]  := FieldByName('Ptjobduty').AsString;            //담당직무명
         Cells[238, rowcount -1]  := FieldByName('TDUTYCLASS').AsString;           //직무등급
         Cells[239, rowcount -1]  := FieldByName('Ntdutyclass').AsString;          //직무등급명
         Cells[240, rowcount -1]  := FieldByName('TCOND').AsString;                //기타조건
         Cells[241, rowcount -1]  := FieldByName('TCOMPANY').AsString;             //파견업체
         Cells[242, rowcount -1]  := FieldByName('Ntcompany').AsString;            //파견업체명
         // tab-7
         Cells[243, rowcount -1]  := FieldByName('CHNNAME').AsString;              //한자성명
         Cells[244, rowcount -1]  := FieldByName('ENGNAME').AsString;              //영문성명
         Cells[245, rowcount -1]  := FieldByName('ELDSONYN').AsString;             //장남여부
         Cells[246, rowcount -1]  := FieldByName('MARRIGEYN').AsString;            //결혼여부
         Cells[247, rowcount -1]  := FieldByName('JUMINID').AsString;              //주민등록번호
         Cells[248, rowcount -1]  := FieldByName('BIRTHGUBUN').AsString;           //양력/음력
         Cells[249, rowcount -1]  := FieldByName('BIRTHDAY').AsString;             //실제생년월일
         Cells[250, rowcount -1]  := FieldByName('KORAGE').AsString;               //한국연령
         Cells[251, rowcount -1]  := FieldByName('USAAGE').AsString;               //외국연령
         Cells[252, rowcount -1]  := FieldByName('SEX').AsString;                  //성별
         Cells[253, rowcount -1]  := FieldByName('Nsex').AsString;                 //성별명
         Cells[254, rowcount -1]  := FieldByName('E_MAIL').AsString;               //E_MAIL
         Cells[255, rowcount -1]  := FieldByName('SKEMAIL').AsString;              //SK그룹메일
         Cells[256, rowcount -1]  := FieldByName('HOLDNAME').AsString;             //호주성명
         Cells[257, rowcount -1]  := FieldByName('HOLDREL').AsString;              //호주와의 관계
         Cells[258, rowcount -1]  := FieldByName('Nholdrel').AsString;             //호주와의 관계명
         Cells[259, rowcount -1]  := FieldByName('HOUSETYPE').AsString;            //주거형태
         Cells[260, rowcount -1]  := FieldByName('Nhousetype').AsString;           //주거형태명
         Cells[261, rowcount -1]  := FieldByName('HEALTH').AsString;               //건강상태
         Cells[262, rowcount -1]  := FieldByName('Nhealth').AsString;              //주거형태명
         Cells[263, rowcount -1]  := FieldByName('BORNAREA').AsString;             //출생지
         Cells[264, rowcount -1]  := FieldByName('Nbornarea').AsString;            //출생지명
         Cells[265, rowcount -1]  := FieldByName('REGADDR').AsString;              //본적주소
         Cells[266, rowcount -1]  := FieldByName('CURADDR').AsString;              //현주소
         Cells[267, rowcount -1]  := FieldByName('ZIPNO').AsString;                //우편번호
         Cells[268, rowcount -1]  := FieldByName('CURNATION').AsString;            //실거주지 국가코드
         Cells[269, rowcount -1]  := FieldByName('Ncurnation').AsString;           //실거주지 국가명
         Cells[270, rowcount -1]  := FieldByName('CURREGION').AsString;            //실거주지 지역코드
         Cells[271, rowcount -1]  := FieldByName('Ncurregion').AsString;           //실거주지 지역명
         Cells[272, rowcount -1]  := FieldByName('NATION').AsString;               //국가
         Cells[273, rowcount -1]  := FieldByName('Nnation').AsString;              //국가명
         Cells[274, rowcount -1]  := FieldByName('REGION').AsString;               //주민등록지/호구소재지 지역코드
         Cells[275, rowcount -1]  := FieldByName('Nregion').AsString;              //주민등록지/호구소재지 지역명
         Cells[276, rowcount -1]  := FieldByName('POSTNO').AsString;               //주민등록지(우편번호)/호구소재지번호
         Cells[277, rowcount -1]  := FieldByName('ADDRESS').AsString;              //주민등록지/호구소재지 주소
         Cells[278, rowcount -1]  := FieldByName('TELNO').AsString;                //전화번호
         Cells[279, rowcount -1]  := FieldByName('OFFITEL').AsString;              //사내전화번호
         Cells[280, rowcount -1]  := FieldByName('RELIGION').AsString;             //종교
         Cells[281, rowcount -1]  := FieldByName('Nreligion').AsString;            //종교명
         Cells[282, rowcount -1]  := FieldByName('HABIT').AsString;                //취미
         Cells[283, rowcount -1]  := FieldByName('ABILITY').AsString;              //특기
         Cells[284, rowcount -1]  := FieldByName('BLOOD').AsString;                //혈액형
         Cells[285, rowcount -1]  := FieldByName('HEIGHT').AsString;               //신장
         Cells[286, rowcount -1]  := FieldByName('WEIGHT').AsString;               //체중
     end
     else
     begin
         Cells[ 0, rowcount -1] := inttostr(pi);
         Cells[ 1, rowcount -1] := pStr;
         Cells[ 2, rowcount -1] := '자료없음';
     end;
   end;
end;

procedure TPIA10102Form._PTmpGridTitle(StringGrid: TStringGrid);
begin

   with StringGrid do
   begin
      ColCount      := 287;
      RowCount      := 1;
      // tab-1
      Cells[  0, 0]  := '일렬번호';
      Cells[  1, 0]  := '조직차수';                     //ORGNUM
      Cells[  2, 0]  := '사원번호';                     //EMPNO
      Cells[  3, 0]  := '성  명';                       //KORNAME,
      Cells[  4, 0]  := '국가';                         //Country
      Cells[  5, 0]  := '국가명';                       //NCountry
      Cells[  6, 0]  := '인사상태';                     //PSTATE
      Cells[  7, 0]  := '인사상태명';                   //NPSTATE
      Cells[  8, 0]  := '현원포함여부';                 //PSTATEYN
      Cells[  9, 0]  := '현BAND';                       //PAYCL
      Cells[ 10, 0]  := '현BAND명';                     //NPAYCL
      Cells[ 11, 0]  := '사원유형';                     //Nemptypecd
      Cells[ 12, 0]  := '사원유형명';                   //Nemptypenm
      Cells[ 13, 0]  := 'ROLE LEVEL';                   //ROLELEVEL
      Cells[ 14, 0]  := 'ROLE LEVEL명';                 //NROLELEVEL
      Cells[ 15, 0]  := 'ROLE LEVE DATE';               //ROLELVDATE
      Cells[ 16, 0]  := '본부코드';                     //BONCODE
      Cells[ 17, 0]  := '재무부서';                     //FINCODE
      Cells[ 18, 0]  := '호봉';                         //PAYGR
      Cells[ 19, 0]  := '소속부서';                     //DEPTCODE
      Cells[ 20, 0]  := '소속부서명';                   //Ndeptcode
      Cells[ 21, 0]  := '소속그룹명';                   //Njikgroup
      Cells[ 22, 0]  := '소속부문';                     //FIELDCODE
      Cells[ 23, 0]  := '소속부문명';                   //NFIELDCODE
      Cells[ 24, 0]  := '근무부서';                     //JOBDEPT
      Cells[ 25, 0]  := '근무부서명';                   //NJOBDEPT
      Cells[ 26, 0]  := '직책';                         //PAYRA
      Cells[ 27, 0]  := '직책명';                       //NPAYRA
      Cells[ 28, 0]  := '근무직책';                     //JOBPAYRA
      Cells[ 29, 0]  := '근무직책명';                   //NJOBPAYRA
      //Cells[  , 0]  := '현직책명';                    //PAYDUNM
      Cells[ 30, 0]  := '전보일';                       //REALTRDATE
      Cells[ 31, 0]  := '조직전보일';                   //OFFTRDATE
      //Cells[  , 0]  := '전보제한일(FROM)';            //TRLIMFRDATE
      //Cells[  , 0]  := '전보제한일(TO)';              //TRLIMTODATE
      Cells[ 32, 0]  := '보임여부';                     //PAYRAYN
      Cells[ 33, 0]  := '근무부서보임여부';             //JOBPAYRAYN
      Cells[ 34, 0]  := '임원선임일';                   //IMWONDATE
      Cells[ 35, 0]  := '보임일';                       //CPAYRADATE
      Cells[ 36, 0]  := '상세근무지';                   //JOBPLACE
      Cells[ 37, 0]  := '상세근무지명';                 //Njobplace
      Cells[ 38, 0]  := '근무지국가';                   //NplaceNation
      Cells[ 39, 0]  := '최초입사일';                   //EMPDATE
      Cells[ 40, 0]  := '입사일';                       //ORGEMPDATE
      Cells[ 41, 0]  := '근무지국가';                   //GROUPEMPDATE
      Cells[ 42, 0]  := '최초그룹입사일';               //GROUPCOMPANY
      Cells[ 43, 0]  := '근무지국가';                   //CPAYCLDATE
      Cells[ 44, 0]  := '승격일';                       //PAYCLDATE
      Cells[ 45, 0]  := '구BAND조정일';                 //OLD_PAYCLDATE
      Cells[ 46, 0]  := '직무대리BAND';                 //REPPAYCL
      Cells[ 47, 0]  := '직무대리BAND명';               //Nreppaycl
      Cells[ 48, 0]  := '직무대리일(FROM)';             //REPPAYFRDATE
      Cells[ 49, 0]  := '직무대리일(TO)';               //REPPAYTODATE
      Cells[ 50, 0]  := '겸직직책';                     //APDPAYDUNM
      Cells[ 51, 0]  := '겸직직책(FROM)';               //APDPAYFRDATE
      Cells[ 52, 0]  := '겸직직책(TO)';                 //APDPAYTODATE
      Cells[ 53, 0]  := '직무대행직책';                 //ACTPAYDUNM
      Cells[ 54, 0]  := '직무대행일(FROM)';             //ACTPAYFRDATE
      Cells[ 55, 0]  := '직무대행일(TO)';               //ACTPAYTODATE
      //Cells[  , 0]  := '최종장기승호일';              //LRAGRDATE
      Cells[ 56, 0]  := '특기사항';                     //REMARK
      Cells[ 57, 0]  := '특기사항명';                   //NREMARK
      Cells[ 58, 0]  := '채용원천';                     //EMPCODE
      Cells[ 59, 0]  := '채용원천명';                   //Nempcode
      Cells[ 60, 0]  := '입사기수';                     //EMPTERM
      Cells[ 61, 0]  := '입사학력';                     //EMPSCHGR
      Cells[ 62, 0]  := '입사학력명';                   //Nempschgr
      Cells[ 63, 0]  := '입사BAND';                     //EMPPAYCL
      Cells[ 64, 0]  := '입사BAND명';                   //Nemppaycl
      Cells[ 65, 0]  := '입사호봉';                     //EMPPAYGR
      //Cells[  , 0]  := '입사시직렬';                  //EMPJOBLINE
      //Cells[  , 0]  := '입사시근무지';                //EMPJOBPLACE
      Cells[ 66, 0]  := '부여호봉';                     //GRPAYGRSUM
      Cells[ 67, 0]  := '군혜택호봉';                   //ARMYPAYGR
      Cells[ 68, 0]  := '석사호봉';                     //MASPAYGR
      Cells[ 69, 0]  := '경력호봉';                     //CARPAYGR
      Cells[ 70, 0]  := '기타호봉';                     //ETCPAYGR
      Cells[ 71, 0]  := '기타호봉내역';                 //ETCPAYCONT
      Cells[ 72, 0]  := '입사전총경력년';               //BCARYY
      Cells[ 73, 0]  := '입사전총경력월';               //BCARMM
      Cells[ 74, 0]  := '경력일';                       //CARDATE
      // tab-2
      Cells[ 75, 0]  := '직군';                         //JOBGUN
      Cells[ 76, 0]  := '직군명';                       //Njobgun
      Cells[ 77, 0]  := '직군일';                       //JOBGUNDATE
      Cells[ 78, 0]  := '직렬';                         //JOBLINE
      Cells[ 79, 0]  := '직렬일';                       //JOBLINEDATE
      Cells[ 80, 0]  := '직종';                         //JOBKIND
      Cells[ 81, 0]  := '직종명';                       //Njobkind
      Cells[ 82, 0]  := '직종일';                       //JOBKINDDATE
      Cells[ 83, 0]  := '직무';                         //JOBDUTY
      Cells[ 84, 0]  := '직무명';                       //NJOBDUTY
      Cells[ 85, 0]  := '직무일';                       //JOBDUTYDATE
      Cells[ 86, 0]  := '노조원구분';                   //NojoYN
      Cells[ 87, 0]  := '노조세부 구분';                //NOGUBUN
      Cells[ 88, 0]  := '노조세부 구분명';              //Nnogubun
      Cells[ 89, 0]  := '노조전임여부';                 //NOJEONYN
      Cells[ 90, 0]  := '노조전임일(FROM)';             //NOJNFRDATE
      Cells[ 91, 0]  := '노조전임일(TO)';               //NOJNTODATE
      Cells[ 92, 0]  := '최종발령구분';                 //LANCODE
      Cells[ 93, 0]  := '최종발령구분명';               //Nlancode
      Cells[ 94, 0]  := '최종발령번호';                 //LANNONO
      Cells[ 95, 0]  := '최종발령일(FROM)';             //LANFRDATE
      Cells[ 96, 0]  := '최종발령일(TO)';               //LANTODATE
      Cells[ 97, 0]  := '총근속제외기간횟수';           //EXDUTCNT
      Cells[ 98, 0]  := '총근속제외기간년';             //EXDUTYY
      Cells[ 99, 0]  := '총근속제외기간월';             //EXDUTMM
      Cells[100, 0]  := '총근속제외기간일';             //EXDUTDD
      Cells[101, 0]  := '최종근속제외기간(FROM)';       //LEXFRDATE
      Cells[102, 0]  := '최종근속제외기간(TO)';         //LEXTODATE
      Cells[103, 0]  := '최종근속제외기간년';           //LEXDUYY
      Cells[104, 0]  := '최종근속제외기간월';           //LEXDUMM
      Cells[105, 0]  := '최종근속제외기간일';           //LEXDUDD
      Cells[106, 0]  := '재급기간년';                   //PAYCLYY
      Cells[107, 0]  := '재급기간월';                   //PAYCLMM
      Cells[108, 0]  := '재급기간일';                   //PAYCLDD
      Cells[109, 0]  := '총재급일';                     //TOTPAYCLDD
      Cells[110, 0]  := '근속기간년';                   //MDUYY
      Cells[111, 0]  := '근속기간월';                   //COMDUMM
      Cells[112, 0]  := '근속기간일';                   //COMDUDD
      Cells[113, 0]  := '총재직일';                     //TOTCOMDUDD
      // tab-3
      Cells[114, 0]  := '군별';                      //ARMYKIND
      Cells[115, 0]  := '군별명';                    //Narmykind
      Cells[116, 0]  := '계급';                      //ARMYCL
      Cells[117, 0]  := '계급명';                    //Narmycl
      Cells[118, 0]  := '병과';                      //ARMYFIELD
      Cells[119, 0]  := '병과명';                    //Narmyfield
      Cells[120, 0]  := '입대일자';                  //ARMYFRDATE
      Cells[121, 0]  := '제대일자';                  //ARMYTODATE
      Cells[122, 0]  := '제대구분';                  //ARMYDIS
      Cells[123, 0]  := '제대구분명';                //Narmydis
      Cells[124, 0]  := '면제사유';                  //ARMYEX
      Cells[125, 0]  := '면제사유명';                //Narmyex
      Cells[126, 0]  := '최종학력';                  //LSCHGR
      Cells[127, 0]  := '최종학력명';                //Nlschgr
      Cells[128, 0]  := '최종학위';                  //LSCHDEG
      Cells[129, 0]  := '최종학위명';                //Nlschdeg
      Cells[130, 0]  := '최종학력학교';              //LSCHCODE
      Cells[131, 0]  := '최종학력학교명';            //LSCHNM
      Cells[132, 0]  := '최종학교입학년월';          //LSCHFRYM
      Cells[133, 0]  := '최종학교졸업년월';          //LSCHGRYM
      Cells[134, 0]  := '최종학교전공';              //LMAJORCODE
      Cells[135, 0]  := '최종학교전공명';            //Nlmajorcode
      Cells[136, 0]  := '대학교';                    //UNICODE
      Cells[137, 0]  := '대학교명';                  //Nunicode
      Cells[138, 0]  := '대학교전공';                //UNIMAJOR
      Cells[139, 0]  := '대학교전공명';              //Nunimajor
      Cells[140, 0]  := '대학교입학년월';            //UNIFRYM
      Cells[141, 0]  := '대학교졸업년월';            //UNIGRYM
      Cells[142, 0]  := '최종학교세부전공';          //LSCHMAJNM
      Cells[143, 0]  := '최종학교논문';              //LSCHTOPIC
      Cells[144, 0]  := '자격/면허';                 //LICKIND
      Cells[145, 0]  := '자격/면허명';               //Nlickind
      Cells[146, 0]  := '발행처';                    //PUBLISH
      Cells[147, 0]  := '자격/면허유형';             //Nliccd
      Cells[148, 0]  := '자격/면허유형명';           //Nlicnm
      Cells[149, 0]  := '자격/면허등급';             //LICGR
      Cells[150, 0]  := '자격/면허등급명';           //Nlicgr
      Cells[151, 0]  := '자격/면허취득일';           //LICGETDATE
      Cells[152, 0]  := '선임자격면허종류';          //LICALKIND
      Cells[153, 0]  := '선임자격면허종류명';        //Nlicalkind
      Cells[154, 0]  := '선임자격면허등급';          //LICALGR
      Cells[155, 0]  := '선임자격면허등급명';        //Nlicalgr
      Cells[156, 0]  := '선임자격면허취득일';        //LICALGETDATE
      Cells[157, 0]  := '선임분야';                  //LICALFIELD
      Cells[158, 0]  := '선임일';                    //LICALDATE
      Cells[159, 0]  := '비고';                      //LICBIGO
      Cells[160, 0]  := '최종 TOEIC 시험성적';       //TOEICSCORE
      Cells[161, 0]  := '최종 TOEIC 만점';           //TOEICFULL
      Cells[162, 0]  := '최종 TOEIC 시험일자';       //TOEICDATE
      Cells[163, 0]  := '최종 JPT 시험성적';         //JPTSCORE
      Cells[164, 0]  := '최종 JPT 만점';             //JPTFULL
      Cells[165, 0]  := '최종 JPT 시험일자';         //JPTDATE
      Cells[166, 0]  := '외국어유형';                //LANGTYPE
      Cells[167, 0]  := '외국어유형명';              //Nlangtype
      Cells[168, 0]  := '시험유형';                  //EXAMTYPE
      Cells[169, 0]  := '시험유형명';                //Nexamtype
      Cells[170, 0]  := '외국어명';                  //LANGNAME
      Cells[171, 0]  := '시험일자';                  //EXAMDATE
      //Cells[  , 0]  := '검정기관';                 //EXAMPLACE
      // tab-4
      Cells[172, 0]  := '교육종류';                  //EDUGUBUN
      Cells[173, 0]  := '교육종류명';                //Nedugubun
      Cells[174, 0]  := '교육기관';                  //EDUPLACE
      Cells[175, 0]  := '교육과정';                  //EDUCOURSE
      Cells[176, 0]  := '교육기간(FROM)';            //EDUFRDATE
      Cells[177, 0]  := '교육기간(TO)';              //EDUTODATE
      Cells[178, 0]  := '교육지역';                  //EDUAREA
      Cells[179, 0]  := '연락처';                    //EDUCONT
      Cells[180, 0]  := '의무복무기간(FROM)';        //EDUDUFRDATE
      Cells[181, 0]  := '의무복무기간(TO)';          //EDUDUTODATE
      Cells[182, 0]  := '휴직구분';                  //LRKIND
      Cells[183, 0]  := '휴직구분명';                //Nlrkind
      Cells[184, 0]  := '휴직구분(FROM)';            //LRFRDATE
      Cells[185, 0]  := '휴직구분(TO)';              //LRTODATE
      Cells[186, 0]  := '휴직휴가기간(FROM)';        //LVFRDATE
      Cells[187, 0]  := '휴직휴가기간(TO)';          //LVTODATE
      Cells[188, 0]  := '파견구분';                  //LSEKIND
      Cells[189, 0]  := '파견구분명';                //Nlsekind
      Cells[190, 0]  := '파견구분(FROM)';            //LSEFRDATE
      Cells[191, 0]  := '파견구분(TO)';              //LSETODATE
      Cells[192, 0]  := '파견기관';                  //LSEPLACE
      Cells[193, 0]  := '파견목적';                  //LSESAYU
      Cells[194, 0]  := '파견연락처';                //LSECONT
      Cells[195, 0]  := '휴가구분';                  //HUGUBUN
      Cells[196, 0]  := '휴가구분명';                //Nhugubun
      Cells[197, 0]  := '휴가구분(FROM)';            //HUFRDATE
      Cells[198, 0]  := '휴가구분(TO)';              //HUTODATE
      Cells[199, 0]  := '퇴직일자';                  //RETDATE
      Cells[200, 0]  := '퇴직구분';                  //RETGUBUN
      Cells[201, 0]  := '퇴직구분명';                //Nretgubun
      Cells[202, 0]  := '퇴직실제사유1';             //RETSAYU1
      Cells[203, 0]  := '퇴직실제사유명1';           //Nretsayu1
      Cells[204, 0]  := '퇴직실제사유2';             //RETSAYU2
      Cells[205, 0]  := '퇴직실제사유명2';           //Nretsayu2
      Cells[206, 0]  := '휴대전화';                  //RETCONT
      // tab-5
      Cells[207, 0]  := '보훈구분';                  //BOHUNGUBUN
      Cells[208, 0]  := '보훈구분명';                //Nbohungubun
      Cells[209, 0]  := '유공자';                    //BOHUNNM
      Cells[210, 0]  := '유공자와의관계';            //BOHUNREL
      Cells[211, 0]  := '유공자와의관계명';          //Nbohunrel
      Cells[212, 0]  := '보훈번호';                  //BOHUNNO
      Cells[213, 0]  := '자력지청';                  //BOHUNBRAN
      Cells[214, 0]  := '보훈대상여부';              //BOHUNYN
      Cells[215, 0]  := '특례구분';                  //SCGUBUN
      Cells[216, 0]  := '특례구분명';                //Nscgubun
      Cells[217, 0]  := '특례편입일자';              //SCENTDATE
      Cells[218, 0]  := '특례편입일자';              //SCPREDATE
      Cells[219, 0]  := '특례만료일자';              //SCENDDATE
      Cells[220, 0]  := '특례만료여부';              //SCTERMYN
      Cells[221, 0]  := '복무제외년';                //SCEXYY
      Cells[222, 0]  := '복무제외월';                //SCEXMM
      Cells[223, 0]  := '복무제외일';                //SCEXDD
      Cells[224, 0]  := '복무제외사유';              //SCEXCAUSE
      Cells[225, 0]  := '장애인유형';                //OBSKIND
      Cells[226, 0]  := '장애인유형명';              //Nobskind
      Cells[227, 0]  := '장애인등급';                //OBSGR
      Cells[228, 0]  := '장애인등급명';              //Nobsgr
      Cells[229, 0]  := '장애인상세상태';            //OBSSTATE
      Cells[230, 0]  := '계약기간(FROM)';            //OTDUFRDATE
      Cells[231, 0]  := '계약기간(TO)';              //OTDUTODATE
      Cells[232, 0]  := '계약방법';                  //TCONTR
      Cells[233, 0]  := '계약방법명';                //Ntcontr
      Cells[234, 0]  := '계약금액';                  //TCONTRAMT
      Cells[235, 0]  := '근무형태';                  //TTYPE
      Cells[236, 0]  := '담당직무';                  //TJOBDUTY
      Cells[237, 0]  := '담당직무명';                //Ptjobduty
      Cells[238, 0]  := '직무등급';                  //TDUTYCLASS
      Cells[239, 0]  := '직무등급명';                //Ntdutyclass
      Cells[240, 0]  := '기타조건';                  //TCOND
      Cells[241, 0]  := '파견업체';                  //TCOMPANY
      Cells[242, 0]  := '파견업체명';                //Ntcompany
      // tab-7
      Cells[243, 0]  := '한자성명';                     //CHNNAME
      Cells[244, 0]  := '영문성명';                     //ENGNAME
      Cells[245, 0]  := '장남여부';                     //ELDSONYN
      Cells[246, 0]  := '결혼여부';                     //MARRIGEYN
      Cells[247, 0]  := '주민등록번호';                 //JUMINID
      Cells[248, 0]  := '양력/음력';                    //BIRTHGUBUN
      Cells[249, 0]  := '실제생년월일';                 //BIRTHDAY
      Cells[250, 0]  := '한국연령';                     //KORAGE
      Cells[251, 0]  := '외국연령';                     //USAAGE
      Cells[252, 0]  := '성별';                         //SEX
      Cells[253, 0]  := '성별명';                       //Nsex
      Cells[254, 0]  := 'E_MAIL';                       //E_MAIL
      Cells[255, 0]  := 'SK그룹메일';                   //SKEMAIL
      Cells[256, 0]  := '호주성명';                     //HOLDNAME
      Cells[257, 0]  := '호주와의 관계';                //HOLDREL
      Cells[258, 0]  := '호주와의 관계명';              //Nholdrel
      Cells[259, 0]  := '주거형태';                     //HOUSETYPE
      Cells[260, 0]  := '주거형태명';                   //Nhousetype
      Cells[261, 0]  := '건강상태';                     //HEALTH
      Cells[262, 0]  := '주거형태명';                   //Nhealth
      Cells[263, 0]  := '출생지';                       //BORNAREA
      Cells[264, 0]  := '출생지명';                     //Nbornarea
      Cells[265, 0]  := '본적주소';                     //REGADDR
      Cells[266, 0]  := '현주소';                       //CURADDR
      Cells[267, 0]  := '우편번호';                     //ZIPNO
      Cells[268, 0]  := '실거주지 국가코드';            //CURNATION
      Cells[269, 0]  := '실거주지 국가명';              //Ncurnation
      Cells[270, 0]  := '실거주지 지역코드';            //CURREGION
      Cells[271, 0]  := '실거주지 지역명';              //Ncurregion
      Cells[272, 0]  := '국가';                         //NATION
      Cells[273, 0]  := '국가명';                       //Nnation
      Cells[274, 0]  := '주민등록지/호구소재지 지역코드';          //REGION
      Cells[275, 0]  := '주민등록지/호구소재지 지역명';            //Nregion
      Cells[276, 0]  := '주민등록지(우편번호)/호구소재지번호';     //POSTNO
      Cells[277, 0]  := '주민등록지/호구소재지 주소';              //ADDRESS
      Cells[278, 0]  := '전화번호';                  //TELNO
      Cells[279, 0]  := '사내전화번호';              //OFFITEL
      Cells[280, 0]  := '종교';                      //RELIGION
      Cells[281, 0]  := '종교명';                    //Nreligion
      Cells[282, 0]  := '취미';                      //HABIT
      Cells[283, 0]  := '특기';                      //ABILITY
      Cells[284, 0]  := '혈액형';                    //BLOOD
      Cells[285, 0]  := '신장';                      //HEIGHT
      Cells[286, 0]  := '체중';                      //WEIGHT

      // A.NPEOPLE, A.OLD_PAYCL, A.WEDDINGDATE, A.WRITETIME, A.WRITEEMP, A.HANADUYY, A.HANADUMM, A.HANADUDD,
      // C.LICKIND, C.LICGR, C.LICGETDATE, D.LICKIND, D.LICGR, D.LICGETDATE, D.LICALFIELD, D.LICALDATE, D.LICBIGO
   end;
end;



procedure TPIA10102Form.BB_exitClick(Sender: TObject);
begin

  ModalResult := mrCancel;
end;

procedure TPIA10102Form.BitBtn2Click(Sender: TObject);
begin

   if OraExcelQuery.eof then
      exit;
      
   OraExcelQuery.delete;
end;

procedure TPIA10102Form.BitBtn1Click(Sender: TObject);
begin

   if OraExcelQuery.eof then
      OraExcelQuery.active;

   if ((length(trim(MD_empno.text)) <> 0) and (PL_nmempno.caption <> '')) then
   begin

     if (OraExcelQuery.FieldByName('EMPNO'  ).AsSTring = '') then
        OraExcelQuery.edit
     else
        OraExcelQuery.Append;

     OraExcelQuery.FieldByName('SEQ'    ).AsSTring := 'INPUT';
     OraExcelQuery.FieldByName('EMPNO'  ).AsSTring := MD_empno.text;
     OraExcelQuery.FieldByName('KORNAME').AsSTring := PL_nmempno.caption;
     OraExcelQuery.Post;

     MD_empno.text      := '';
     PL_nmempno.caption := '';
   end;
   MD_empno.setfocus;
end;

procedure TPIA10102Form.MD_empnoChange(Sender: TObject);
begin

   PL_nmempno.caption := '';
end;

procedure TPIA10102Form.MD_empnoExit(Sender: TObject);
var
  OraSELQuery : TOraQuery;
begin

   OraSELQuery := TOraQuery.Create(self);

   try
   if (length(trim(MD_empno.text)) <> 0) then
   begin
      OraSELQuery.Session := Ora_Session;
      try
        with OraSELQuery do
        begin
           Active := false;
           SQL.Clear;
           SQL.Add('SELECT A.KORNAME        ');
           SQL.Add('  FROM PIMPMAS A        ');
           SQL.Add(' WHERE A.EMPNO = :pEMPNO');
           Prepare;
           Params.Clear;
           Params.CreateParam(ftString, 'pEMPNO', ptInput);
           ParamByName('pEMPNO').AsString := MD_empno.text;
           Active := true;

          if not OraSELQuery.eof then
          begin
             PL_nmempno.caption := FieldByName('KORNAME').AsString;
          end
          else
          begin
             MessageBox(handle,'해당 사번은 존재하지 않습니다. 확인후 작업하세요!','ERROR',MB_ICONWARNING);
             PL_nmempno.caption := '';
             MD_empno.setfocus;
          end;
      end;

      except
          on e : Exception do
          begin

          end;
      end;
     end;
   finally
      OraSELQuery.Free;
   end;
end;

procedure TPIA10102Form.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  case Key of
    VK_F2  : ;
    VK_F3  : ;
    VK_F4  : ;
    VK_F5  : ;
    VK_F6  : ;
    VK_F7  : ;
    VK_F8  : ;
    VK_F9  : ;
    VK_F10 : ;
    VK_RETURN : SelectNext(ActiveControl as TWincontrol, True, True);
  end;
end;

procedure TPIA10102Form.FormShow(Sender: TObject);
begin

   OraExcelQuery.Session := Ora_Session;
   OraExcelQuery.Active  := true;
end;

procedure TPIA10102Form.BitBtn3Click(Sender: TObject);
begin

  if Pl_Help.Visible = true then
  begin
     Pl_Help.Visible := false;
  end
  else
  begin
     Pl_Help.Visible := true;
  end;
end;

procedure TPIA10102Form.SGrid01DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
   strLen  : integer;
   strSize : TSize;
begin

  //중앙정렬(TITLE)
  if (ARow = 0) then
  begin
    with TStringGrid(Sender).Canvas do
    begin
      FillRect(Rect);
      strLen := TextWidth(TStringGrid(Sender).Cells[ACol, ARow]);
      strSize := TextExtent(TStringGrid(Sender).Cells[ACol,0]);
      TextOut((Rect.Left + Rect.Right - strLen) div 2, Rect.Top+Round(Rect.bottom - Rect.Top - strSize.cy) div 2,
               TStringGrid(Sender).Cells[ACol,ARow]);
    end;
  end;

  //중앙정렬(DATA)
  if (ARow > 0) and (ACol in [0]) then
  begin
    with TStringGrid(Sender).Canvas do
    begin

      FillRect(Rect);
      strLen := TextWidth(TStringGrid(Sender).Cells[ACol, ARow]);
      strSize := TextExtent(TStringGrid(Sender).Cells[ACol,0]);
      TextOut((Rect.Left + Rect.Right - strLen) div 2, (Rect.Top+Round(Rect.bottom - Rect.Top - strSize.cy) div 2) - 4,
               TStringGrid(Sender).Cells[ACol,ARow]);

    end;
  end;
end;

procedure TPIA10102Form.FormCreate(Sender: TObject);
begin

  with SGrid01 do
  begin
     Cells[0,0] := '';
     Cells[1,0] := 'A';
     Cells[2,0] := 'B';
     Cells[1,1] := '사원번호';
     Cells[2,1] := '성명';
     Cells[0,1] := '1';
     Cells[0,2] := '2';
     Cells[0,3] := '3';
     Cells[0,4] := '4';
     Cells[1,2] := '8888';
     Cells[2,2] := '김길순';
     Cells[1,3] := '9999';
     Cells[2,3] := '김길동';
  end;
end;

end.
