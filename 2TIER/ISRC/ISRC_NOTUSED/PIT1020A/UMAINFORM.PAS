{===================== Program Header ==========================================
 PROGRAM-NAME      : 종합인사정보시스템
 SYSTEM-NAME       : 경영평가
 SUBSYSTEM-NAME    : 평가진행관리
 Programmer        : 배준상
 Version           : 1.0
 Date              : 1999.06.18

Update Contents
 Version  date(yy.mm.dd)  programmer  description                       relevant doc.n
 1.00
 02.10    2002.04.06      손종운      직무경력 Update 대상기간  제한   전산처리요청서: 2002-2456호
 02.12    2002.04.08      손종운      상태표시 수정
 05.01    2005.06.14      변춘미      결재자성명 혼돈 => 최종결재자성명으로 수정,최종결재자가 null이면 ''표시 
================================================================================}
unit UMainForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, peoutlookbtn, StdCtrls, Mask, pebtnedit, ExtCtrls, pegradpanl,
  DB, Pass, Buttons, Datelib, ComCtrls, kpaylib, peempnobtnedit;

type
  TMainForm = class(TForm)
    Pa_Title: TPeJeonGrdPanel;
    PeJeonGrdPanel2: TPeJeonGrdPanel;
    PeJeonGrdPanel1: TPeJeonGrdPanel;
    ExitBtn: TPeJeonOutLookBtn;
    PeJeonGrdPanel3: TPeJeonGrdPanel;
    Panel2: TPanel;
    SpecText: TMemo;
    SpecBtn: TPeJeonOutLookBtn;
    SG_Main: TStringGrid;
    Bt_Confirm: TPeJeonOutLookBtn;
    Bt_return: TPeJeonOutLookBtn;
    EditBtn: TPeJeonOutLookBtn;
    AddBtn: TPeJeonOutLookBtn;
    DeleteBtn: TPeJeonOutLookBtn;
    Bt_Print: TPeJeonOutLookBtn;
    Bt_PreView: TPeJeonOutLookBtn;
    St_Help: TStatusBar;
    Bt_Con: TPeJeonOutLookBtn;
    Ed_ConEmpno: TPeEmpnoEdit;
    Ed_Empno: TPeEmpnoEdit;
    bt_Cancel: TPeJeonOutLookBtn;
    ConBtn: TPeJeonOutLookBtn;
    L_State: TLabel;
    Bt_Srh: TPeJeonOutLookBtn;
    Label1: TLabel;
    JobBtn: TPeJeonOutLookBtn;
    Edit1: TEdit;
    procedure ExitBtnClick(Sender: TObject);
    procedure AddBtnClick(Sender: TObject);
    procedure SG_MainDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
      State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure SpecBtnClick(Sender: TObject);
    procedure SG_MainDblClick(Sender: TObject);
    procedure Bt_ConfirmClick(Sender: TObject);
    procedure DeleteBtnClick(Sender: TObject);
    procedure Bt_PreViewClick(Sender: TObject);
    procedure SpecTextKeyPress(Sender: TObject; var Key: Char);
    procedure Bt_returnClick(Sender: TObject);
    procedure Bt_SrhClick(Sender: TObject);
    procedure Ed_empnoKeyPress(Sender: TObject; var Key: Char);
    procedure Bt_ConClick(Sender: TObject);
    procedure Ed_empnoEnter(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure ConBtnClick(Sender: TObject);
    procedure bt_CancelClick(Sender: TObject);
    procedure Ed_EmpnoExit(Sender: TObject);
    procedure JobBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    START: Boolean;
    gbChanged: Boolean;

    Wempno, WKorname : String;
    Pempno, Pkorname, Password, Ppermission, Pjobgun, Ppayra, Ppayrayn: String;
    Porgnum, Pdeptcode, PSysdate: string;
    // pConyn, pFinyn : String;

    PfrBasedate, PtoBasedate: String;

//==============================================================================//
// 02.10    2002.04.06      손종운      직무경력 Update 대상기간  제한   전산처리요청서: 2002-2456호
//==============================================================================//
    pFrdate, pTodate : string;
    pSeqno : Integer;
//==============================================================================//

    procedure fzInitialMainFrom;
    procedure SET_GRID;
    function  fnGetMainDataSet(mEmpno: String): Boolean;
    function  fnGetPrintData: Boolean;
    function  fnSetVariable(mGubun: Integer): Boolean;
    procedure fzSaveFinConData(var mSaved: Boolean; mGubun: Integer; mEmpno, mSayu: String);
    procedure fzGetEmpData(mEmpno: String);
    procedure fzSetSaveButtons(mEabled: Boolean);
    procedure fzSetConButtons(mEabled: Boolean);
    function  fzSettingButtons(mConYN, mFinYN: String): String;
    { Public declarations }
  end;

var
  MainForm: TMainForm;
  giHeightRow : Integer;

const
  iWidthOfDutyText : Integer = 300;
  iWidthOfPaycl    : Integer = 60;

implementation

uses
  UpitLib,commonDM,
  URegForm, UDutyForm, UPreView;

{$R *.DFM}

////////////////////////////////////////////////////////////////////////////////
// User Defined
////////////////////////////////////////////////////////////////////////////////

function TMainForm.fnGetMainDataSet(mEmpno: String): Boolean;
var
  sSql: String;
begin
    Result := False;

    sSQL := Format(
        'SELECT  '+
        ' a.empno         empno        , '+
        ' a.korname       korname      , '+
        ' a.dutyno        dutyno       , '+
        ' a.JobField      JobField     , '+
        ' c.jobfieldname  jobfieldname , '+
        ' a.dutykind      dutykind     , '+
        ' d.dutykindname  dutykindname , '+
        ' a.duty          duty         , '+
        ' e.dutyname      dutyname     , '+
        ' a.paycl         paycl        , '+
        ' b.payclname     payclname    , '+
        ' g.dutytext      dutytext     , '+
        ' a.frdutydate    frdutydate   , '+
        ' a.todutydate    todutydate   , '+
        ' a.dutyyy        dutyyy       , '+
        ' a.dutymm        dutymm       , '+
        ' a.dutytermrate  dutytermrate , '+
        ' a.dutylevel     dutylevel    , '+
        ' f.dutylevelname dutylevelname  '+
        'FROM  pishrmas a,                     '+
        '      (select codeno, codename payclname    from pyccode where codeid = ''I112'') b,  '+ // 직급
        '      (select codeno, codename jobfieldname from pyccode where codeid = ''I116'') c,  '+ // 업무분야
        '      pishrdukind d,                  '+
        '      pishrduty e,                    '+
        '      pishrlevel f,                   '+
        '      (select 1 gubun, empno, dutyno, dutytext    dutytext from pishrmas     '+
        '       union all                                                                '+
        '       select 2 gubun, empno, dutyno, subdutytext dutytext from pishrsub) g  '+
        'WHERE  a.empno = ''%s''               '+
        '  and  a.empno = g.empno and a.dutyno = g.dutyno '+
        '  and  a.paycl = b.codeno             '+
        '  and  a.JobField = c.codeno          '+
        '  and  a.JobField = d.JobField        '+
        '  and  a.dutykind = d.dutykind        '+
        '  and  a.JobField = e.JobField        '+
        '  and  a.dutykind = e.dutykind        '+
        '  and  a.duty = e.duty                '+
        '  and  a.dutylevel = f.dutylevel(+)   '+
        'order by a.frdutydate, a.dutytermrate desc, a.JobField, a.dutykind, a.duty ',[mEmpno]);

    With DM.QCDS do
    begin
        Close;
        Sql.Clear;
        Sql.Text := sSQL;

      try
        Open;
      except
        Close;
        Messagedlg(' DataBase Engine Error ' + #13+ #13+ ' --> 시스템 관리자에게 연락하세요!',mtError,[mbOK],0);
        System.Exit;
      end;
    end;

    Result := True;
end;

procedure TMainForm.SET_GRID;
var
  sSQL, sTemp, GetSubText: String;
  iInd, jInd, iTempYYMM : Integer;
  sTempDate, sTempDutyno: String;
begin
    With DM.QCDS do
    begin
        if fnGetMainDataSet(pEmpno) = False then
            System.Exit;

        SendMessage(SG_Main.Handle, WM_SETREDRAW, 0, 0);

        fzSGInitialRow(SG_Main); // UpitLib

        sTempDate   := '';
        sTempDutyno := '';
        iInd := 0;
        SG_Main.ColWidths[m_DUTYTEXT] := iWidthOfDutyText;
        SG_Main.ColWidths[m_PAYCLNM ] := iWidthOfPaycl ;
        While Not Eof do
        begin
            // 동일 일자면 동일 행 다른면 다른행
            if sTempDate <> FieldByName('FRDUTYDATE').AsString+FieldByName('TODUTYDATE').AsString then
            begin
                Inc(iInd);
                if iInd > 1 then
                    SG_Main.RowCount := SG_Main.RowCount + 1;

                SG_Main.Cells[m_SEQNO       ,iInd] := IntToStr(iInd);
                SG_Main.Cells[m_EMPNO       ,iInd] := FieldByName('EMPNO').AsString;
                SG_Main.Cells[m_KORNAME     ,iInd] := FieldByName('KORNAME').AsString;
                SG_Main.Cells[m_FRDUTYDATE  ,iInd] := FieldByName('FRDUTYDATE').AsString;
                SG_Main.Cells[m_TODUTYDATE  ,iInd] := FieldByName('TODUTYDATE').AsString;

                if Trim(FieldByName('TODUTYDATE').AsString) = '' then
                    SG_Main.Cells[m_DUTYDATE    ,iInd] := Copy(FieldByName('FRDUTYDATE').AsString,1,4) + '/' +
                                                          Copy(FieldByName('FRDUTYDATE').AsString,5,2) +' ~ '+
                                                          '현재'
                else
                    SG_Main.Cells[m_DUTYDATE    ,iInd] := Copy(FieldByName('FRDUTYDATE').AsString,1,4) + '/' +
                                                          Copy(FieldByName('FRDUTYDATE').AsString,5,2) +' ~ '+
                                                          Copy(FieldByName('TODUTYDATE').AsString,1,4) + '/' +
                                                          Copy(FieldByName('TODUTYDATE').AsString,5,2) ;

                SG_Main.Cells[m_DUTYYY      ,iInd] := FieldByName('DUTYYY').AsString;
                SG_Main.Cells[m_DUTYMM      ,iInd] := FieldByName('DUTYMM').AsString;

                fnSetVariable(2);
                if FieldByName('TODUTYDATE').AsString = '' then
                    iTempYYMM := Months_Between(FieldByName('FRDUTYDATE').AsString, Copy(pSysDate,1,6))+1
                else
                    iTempYYMM := Months_Between(FieldByName('FRDUTYDATE').AsString, FieldByName('TODUTYDATE').AsString)+1;
                SG_Main.Cells[m_DUTYYYMM    ,iInd] := IntToStr(iTempYYMM div 12)+'년'+
                                                      IntToStr(iTempYYMM mod 12)+'개월';

                SG_Main.Cells[m_DUTYNO      ,iInd] := FieldByName('DUTYNO').AsString;
                SG_Main.Cells[m_JOBFIELD    ,iInd] := FieldByName('JobField').AsString;
                SG_Main.Cells[m_JOBFIELDNM  ,iInd] := FieldByName('JobFieldNAME').AsString;
                SG_Main.Cells[m_DUTYKIND    ,iInd] := FieldByName('DUTYKIND').AsString;
                SG_Main.Cells[m_DUTYKINDNM  ,iInd] := FieldByName('DUTYKINDNAME').AsString;
                SG_Main.Cells[m_DUTY        ,iInd] := FieldByName('DUTY').AsString;
                SG_Main.Cells[m_DUTYNM      ,iInd] := FieldByName('DUTYNAME').AsString;
                SG_Main.Cells[m_DUTYTERMRATE,iInd] := FieldByName('DUTYTERMRATE').AsString;
                SG_Main.Cells[m_DUTYLEVEL   ,iInd] := FieldByName('DUTYLEVEL').AsString;
                SG_Main.Cells[m_DUTYLEVELNM ,iInd] := FieldByName('DUTYLEVELNAME').AsString;
                SG_Main.Cells[m_PAYCL       ,iInd] := FieldByName('PAYCL').AsString;
                SG_Main.Cells[m_PAYCLNM     ,iInd] := FieldByName('PAYCLNAME').AsString;
                SG_Main.Cells[m_DUTYTEXT    ,iInd] := '⊙ ' + FieldByName('DUTYTEXT').AsString;
                giHeightRow := 1;
            end
            // sTempDate = FieldByName('FRDUTYDATE').AsString+FieldByName('TODUTYDATE').AsString then
            else if sTempDutyno <> FieldByName('DUTYNO').AsString then
            begin
                //SG_Main.Cells[p_SEQNO       ,iInd] := IntToStr(iInd);
                SG_Main.Cells[m_EMPNO       ,iInd] := SG_Main.Cells[m_EMPNO       ,iInd] + #13;
                SG_Main.Cells[m_KORNAME     ,iInd] := SG_Main.Cells[m_KORNAME     ,iInd] + #13;
                SG_Main.Cells[m_FRDUTYDATE  ,iInd] := SG_Main.Cells[m_FRDUTYDATE  ,iInd] + #13;
                SG_Main.Cells[m_TODUTYDATE  ,iInd] := SG_Main.Cells[m_TODUTYDATE  ,iInd] + #13;
                SG_Main.Cells[m_DUTYDATE    ,iInd] := SG_Main.Cells[m_DUTYDATE    ,iInd] + #13;
                SG_Main.Cells[m_DUTYYY      ,iInd] := SG_Main.Cells[m_DUTYYY      ,iInd] + #13;
                SG_Main.Cells[m_DUTYMM      ,iInd] := SG_Main.Cells[m_DUTYMM      ,iInd] + #13;
                SG_Main.Cells[m_DUTYYYMM    ,iInd] := SG_Main.Cells[m_DUTYYYMM    ,iInd] + #13;
                SG_Main.Cells[m_DUTYNO      ,iInd] := SG_Main.Cells[m_DUTYNO      ,iInd] + #13 + FieldByName('DUTYNO').AsString;
                SG_Main.Cells[m_JOBFIELD    ,iInd] := SG_Main.Cells[m_JOBFIELD    ,iInd] + #13 + FieldByName('JobField').AsString;
                SG_Main.Cells[m_JOBFIELDNM  ,iInd] := SG_Main.Cells[m_JOBFIELDNM  ,iInd] + #13 + FieldByName('JobFieldNAME').AsString;
                SG_Main.Cells[m_DUTYKIND    ,iInd] := SG_Main.Cells[m_DUTYKIND    ,iInd] + #13 + FieldByName('DUTYKIND').AsString;
                SG_Main.Cells[m_DUTYKINDNM  ,iInd] := SG_Main.Cells[m_DUTYKINDNM  ,iInd] + #13 + FieldByName('DUTYKINDNAME').AsString;
                SG_Main.Cells[m_DUTY        ,iInd] := SG_Main.Cells[m_DUTY        ,iInd] + #13 + FieldByName('DUTY').AsString;
                SG_Main.Cells[m_DUTYNM      ,iInd] := SG_Main.Cells[m_DUTYNM      ,iInd] + #13 + FieldByName('DUTYNAME').AsString;
                SG_Main.Cells[m_DUTYTERMRATE,iInd] := SG_Main.Cells[m_DUTYTERMRATE,iInd] + #13 + FieldByName('DUTYTERMRATE').AsString;
                SG_Main.Cells[m_DUTYLEVEL   ,iInd] := SG_Main.Cells[m_DUTYLEVEL   ,iInd] + #13 + FieldByName('DUTYLEVEL').AsString;
                SG_Main.Cells[m_DUTYLEVELNM ,iInd] := SG_Main.Cells[m_DUTYLEVELNM ,iInd] + #13 + FieldByName('DUTYLEVELNAME').AsString;
                SG_Main.Cells[m_PAYCL       ,iInd] := SG_Main.Cells[m_PAYCL       ,iInd] + #13 + FieldByName('PAYCL').AsString;
                SG_Main.Cells[m_PAYCLNM     ,iInd] := SG_Main.Cells[m_PAYCLNM     ,iInd] + #13 + FieldByName('PAYCLNAME').AsString;
                SG_Main.Cells[m_DUTYTEXT    ,iInd] := SG_Main.Cells[m_DUTYTEXT    ,iInd] + #13 + '⊙ '+FieldByName('DUTYTEXT').AsString ;
                Inc(giHeightRow);
            end
            // sTempDate = FieldByName('FRDUTYDATE').AsString+FieldByName('TODUTYDATE').AsString then
            // sTempDutyno = FieldByName('DUTYNO').AsString then
            else
            begin
                //SG_Main.Cells[p_SEQNO       ,iInd] := IntToStr(iInd);
                SG_Main.Cells[m_EMPNO       ,iInd] := SG_Main.Cells[m_EMPNO       ,iInd] + #13;
                SG_Main.Cells[m_KORNAME     ,iInd] := SG_Main.Cells[m_KORNAME     ,iInd] + #13;
                SG_Main.Cells[m_FRDUTYDATE  ,iInd] := SG_Main.Cells[m_FRDUTYDATE  ,iInd] + #13;
                SG_Main.Cells[m_TODUTYDATE  ,iInd] := SG_Main.Cells[m_TODUTYDATE  ,iInd] + #13;
                SG_Main.Cells[m_DUTYDATE    ,iInd] := SG_Main.Cells[m_DUTYDATE    ,iInd] + #13;
                SG_Main.Cells[m_DUTYYY      ,iInd] := SG_Main.Cells[m_DUTYYY      ,iInd] + #13;
                SG_Main.Cells[m_DUTYMM      ,iInd] := SG_Main.Cells[m_DUTYMM      ,iInd] + #13;
                SG_Main.Cells[m_DUTYYYMM    ,iInd] := SG_Main.Cells[m_DUTYYYMM    ,iInd] + #13;
                SG_Main.Cells[m_DUTYNO      ,iInd] := SG_Main.Cells[m_DUTYNO      ,iInd] + #13;
                SG_Main.Cells[m_JOBFIELD    ,iInd] := SG_Main.Cells[m_JOBFIELD    ,iInd] + #13;
                SG_Main.Cells[m_JOBFIELDNM  ,iInd] := SG_Main.Cells[m_JOBFIELDNM  ,iInd] + #13;
                SG_Main.Cells[m_DUTYKIND    ,iInd] := SG_Main.Cells[m_DUTYKIND    ,iInd] + #13;
                SG_Main.Cells[m_DUTYKINDNM  ,iInd] := SG_Main.Cells[m_DUTYKINDNM  ,iInd] + #13;
                SG_Main.Cells[m_DUTY        ,iInd] := SG_Main.Cells[m_DUTY        ,iInd] + #13;
                SG_Main.Cells[m_DUTYNM      ,iInd] := SG_Main.Cells[m_DUTYNM      ,iInd] + #13;
                SG_Main.Cells[m_DUTYTERMRATE,iInd] := SG_Main.Cells[m_DUTYTERMRATE,iInd] + #13;
                SG_Main.Cells[m_DUTYLEVEL   ,iInd] := SG_Main.Cells[m_DUTYLEVEL   ,iInd] + #13;
                SG_Main.Cells[m_DUTYLEVELNM ,iInd] := SG_Main.Cells[m_DUTYLEVELNM ,iInd] + #13;
                SG_Main.Cells[m_PAYCL       ,iInd] := SG_Main.Cells[m_PAYCL       ,iInd] + #13;
                SG_Main.Cells[m_PAYCLNM     ,iInd] := SG_Main.Cells[m_PAYCLNM     ,iInd] + #13;
                SG_Main.Cells[m_DUTYTEXT    ,iInd] := SG_Main.Cells[m_DUTYTEXT    ,iInd] + #13 + ' - '+FieldByName('DUTYTEXT').AsString ;
                Inc(giHeightRow);
            end;

            if SG_Main.Canvas.TextWidth(FieldByName('DUTYTEXT').AsString) > iWidthOfDutyText then
                SG_Main.ColWidths[m_DUTYTEXT    ] := 500; // iWidthOfDutyText := 300 약 58 Byte
            SG_Main.Cells[p_MODE        ,iInd] := 'U';
            SG_Main.RowHeights[iInd] := 20 + (giHeightRow * 12);
            sTempDate   := FieldByName('FRDUTYDATE').AsString+FieldByName('TODUTYDATE').AsString;
            sTempDutyno := FieldByName('DUTYNO').AsString;

            Next;
        end;
//==============================================================================//
// 02.10    2002.04.06      손종운      직무경력 Update 대상기간  제한   전산처리요청서: 2002-2456호
//==============================================================================//
        pSeqno := iInd;
        if DM.QCDS.RecordCount > 0 then
          sg_main.Row := iInd;  //최근자료로 focus 가기 2002.04.03 shm
//==============================================================================//
        Close;

        SendMessage(SG_Main.Handle, WM_SETREDRAW, 1, 0);
        SG_Main.Refresh;

    end; // -- End of With

    sSQL := Format(
          'SELECT spectext FROM pishrspec  ' +
          'WHERE empno = ''%s''      ' ,
          [MainForm.Pempno]);

    with DM.Csel do
    begin
        Close;
        Sql.Clear;
        Sql.Text := sSQL;
        Open;

        //SpecText.Text := Trim(Fields[0].AsString);
        SpecText.Text := kpaylib.replace(Fields[0].AsString, #10#10, #13#10);
        //SpecText.Modified := False;
        Close;
    end;
end;

////////////////////////////////////////////////////////////////////////////////
// Events
////////////////////////////////////////////////////////////////////////////////

procedure TMainForm.SG_MainDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  Loc : Cardinal;
begin
    with SG_Main.Canvas do
    begin
        if ARow = 0 then
            Font.Style := [fsBold]
        else
            Font.Style := [];

        FillRect(Rect);
        Rect.Top   := Rect.Top + 4;

        if (ACol in [m_SEQNO, m_DUTYYYMM, m_DUTYTERMRATE, m_DUTYLEVELNM, m_PAYCLNM]) or (ARow = 0) then
            Loc := DT_CENTER or DT_WORDBREAK
        else
            Loc := DT_LEFT or DT_WORDBREAK;

        DrawText(Handle, PChar(SG_Main.Cells[ACol, ARow]), -1, Rect, Loc);
    end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
    START := True;
end;

procedure TMainForm.FormPaint(Sender: TObject);
var
  sTemp : String;
begin
    if START = false then Exit;
    START := False;

    fzInitialMainFrom;

    Pempno   := PassEmp(CmdLine, 1);
    Pkorname := PassEmp(CmdLine, 2);
    Password := PassEmp(CmdLine, 3);
    Ppermission := copy(PassEmp(CmdLine,4),1,1);
    Ed_ConEmpno.DatabaseName := 'dper';

    Wempno   := Pempno;
    Wkorname := Pkorname;

    DM.DataBase1.Connected := False;
    DM.DataBase1.Params[DM.DataBase1.Params.IndexOfName('SERVER NAME')] := 'SERVER NAME=' + PassEmp(cmdline,13);
    DM.DataBase1.Params[DM.DataBase1.Params.IndexOfName('USER NAME')]   := 'USER NAME='   + PassEmp(cmdline,5);
    DM.DataBase1.Params[DM.DataBase1.Params.IndexOfName('PASSWORD')]    := 'PASSWORD='    + PassEmp(cmdline,6);
    DM.DataBase1.Connected := True;

    if fnSetVariable(0) = False then
        System.Exit;
    if fnSetVariable(1) = False then // 등록가능 fr~to
        System.Exit;
    if fnSetVariable(2) = False then // 현재일
        System.Exit;

    Application.ProcessMessages;

    // 부서및 겸직부서조회
    Ed_empno.SetFocus;
end;

function TMainForm.fnSetVariable(mGubun: Integer): Boolean;
var
  sTemp: String;
begin
    Result := False;

    case mGubun of
      0 :
          sTemp:= Format(
             'SELECT  ' +
             ' korname   , ' +
             ' payra     , ' +
             ' jobgun    , ' +
             ' orgnum    , ' +
             ' deptcode  , ' +
             ' payrayn   ' +
             ' FROM pimpmas           ' +
             ' WHERE empno = ''%s''   ' , [Pempno]);
      1:
          sTemp:= Format(
             'SELECT  ' +
             ' value1   , '+
             ' value2               '+
             ' FROM pishrvari         ' +
             ' WHERE gubun = ''%s'' AND sgubun = ''%s'' ',['00','0004']); // 등록일
      2:
          sTemp:=
             'SELECT to_char(sysdate,''YYYYMMDDHH24MISSD'') FROM dual';
      // 3:
      //     sTemp:= Format(
      //         'select i.korname     , '+
      //         '       max(r.conyn)  , '+
      //         '       max(r.finyn)              '+
      //         ' from pimpmas i, pishrmas r   '+
      //         ' where i.empno = ''%s''       '+
      //         '   and i.empno = r.empno (+)  '+
      //         ' group by i.korname           ', [Pempno]);
      else
       System.Exit;
    end;

    with DM.Csel do
    begin
        Close;
        Sql.Clear;
        Sql.Text := sTemp;
        Open;

        case mGubun of
          0 : begin
                Pkorname  := Fields[0].AsString;
                Ppayra    := Fields[1].AsString;
                Pjobgun   := Fields[2].AsString;
                Porgnum   := Fields[3].AsString;
                PDeptcode := Fields[4].AsString;
                Ppayrayn  := Fields[5].AsString;
              end;
          1 : begin
                PfrBasedate:= Fields[0].AsString;
                PtoBasedate:= Fields[1].AsString;
              end;
          2:    pSysdate   := Fields[0].AsString;
          // 3:  begin
          //       pKorName  := Fields[0].AsString;
          //       pConYn    := Fields[1].AsString;
          //       pFinYN    := Fields[2].AsString;
          //     end;
          else
          ;
        end;

        Close;
    end;
    Result := True;
end;

procedure TMainForm.fzInitialMainFrom;
begin
    with SG_Main do
    begin
        Cols[m_SEQNO       ].Text := '연번';             ColWidths[m_SEQNO       ] := 30;
        Cols[m_FRDUTYDATE  ].Text := 'FR근무기간';       ColWidths[m_FRDUTYDATE  ] := -1;
        Cols[m_TODUTYDATE  ].Text := 'TO근무기간';       ColWidths[m_TODUTYDATE  ] := -1;
        Cols[m_DUTYDATE    ].Text := '근무기간';         ColWidths[m_DUTYDATE    ] := 60;
        Cols[m_DUTYYY      ].Text := '근무종사년수';     ColWidths[m_DUTYYY      ] := -1;
        Cols[m_DUTYMM      ].Text := '근무종사월수';     ColWidths[m_DUTYMM      ] := -1;
        Cols[m_DUTYYYMM    ].Text := '근무종사년월';     ColWidths[m_DUTYYYMM    ] := 60;
        Cols[m_EMPNO       ].Text := '사번';             ColWidths[m_EMPNO       ] := -1;
        Cols[m_KORNAME     ].Text := '성명';             ColWidths[m_KORNAME     ] := -1;
        Cols[m_DUTYNO      ].Text := '직무번호';         ColWidths[m_DUTYNO      ] := -1;
        Cols[m_JOBFIELD    ].Text := '업무분야';         ColWidths[m_JOBFIELD    ] := -1;
        Cols[m_JOBFIELDNM  ].Text := '업무분야명';       ColWidths[m_JOBFIELDNM  ] := -1;
        Cols[m_DUTYKIND    ].Text := '직종';             ColWidths[m_DUTYKIND    ] := -1;
        Cols[m_DUTYKINDNM  ].Text := '직종명';           ColWidths[m_DUTYKINDNM  ] := -1;
        Cols[m_DUTY        ].Text := '직무';             ColWidths[m_DUTY        ] := -1;
        Cols[m_DUTYNM      ].Text := '직무명';           ColWidths[m_DUTYNM      ] := 140;
        Cols[m_DUTYTERMRATE].Text := '종사기간비중(%)';  ColWidths[m_DUTYTERMRATE] := 50;
        Cols[m_DUTYTEXT    ].Text := '직무내역';         ColWidths[m_DUTYTEXT    ] := iWidthOfDutyText; // iWithOfDutyText := 350 약 58 Byte
        Cols[m_DUTYLEVEL   ].Text := '직무수준';         ColWidths[m_DUTYLEVEL   ] := -1;
        Cols[m_DUTYLEVELNM ].Text := '직무수준명';       ColWidths[m_DUTYLEVELNM ] := 80;
        Cols[m_PAYCL       ].Text := '최종BAND';         ColWidths[m_PAYCL       ] := -1;
        Cols[m_PAYCLNM     ].Text := '최종BAND명';       ColWidths[m_PAYCLNM     ] := iWidthOfPaycl; // 40
        Cols[m_MODE        ].Text := '작업모드';         ColWidths[m_MODE        ] := -1;
        RowHeights[0] := 20 + (12*2);
    end;
end;

procedure TMainForm.SpecBtnClick(Sender: TObject);
var
  iCheckExist: Integer;
  SQLText: String;
begin
    if SpecText.Lines.Count > 4 then
    begin
        MessageDlg(' 4줄 이하로 줄여 주세요', mtInformation,[mbOK],0);
        System.Exit;
    end;

    // 입력, 수정 여부 결정
    SQLText:= Format(
          'SELECT Count(EMPNO) cnt FROM pishrspec  '+
          'WHERE empno = ''%s''                       ', [MainForm.Pempno]);

    with DM.Csel do
    begin
        Close;
        Sql.Clear;
        Sql.Text := SQLText;
        Open;

        iCheckExist := StrToInt(Fields[0].AsString);
        Close;
    end;


    if iCheckExist < 1  then
    begin
        SQLText := Format(
                   'INSERT INTO PISHRSPEC ' +
                   ' (empno, spectext, writeemp, writetime) '+
                   ' VALUES (''%s'',''%s'',''%s'',TO_CHAR(SYSDATE, ''YYYYMMDDHH24MISS'')) ',
                   [MainForm.pEmpno, replace(SpecText.Text,'''','`'), MainForm.wEmpno]);
    end
    else
    begin
        if trim(SpecText.Text) <> '' then
            SQLText := Format(
                       'UPDATE  PISHRSPEC  SET   ' +
                       ' spectext = ''%s'' ,     ' +
                       ' writeemp = ''%s'' ,     ' +
                       ' writetime = TO_CHAR(SYSDATE, ''YYYYMMDDHH24MISS'') ' +
                       'WHERE empno = ''%s''     ' ,
                       [replace(SpecText.Text,'''','`'), MainForm.wEmpno, MainForm.pEmpno])
        else
            SQLText := Format(
                       'DELETE FROM PISHRSPEC    ' +
                       'WHERE empno = ''%s''     ' ,
                       [MainForm.pEmpno])
    end;

    if DM.EXEC_SQL(SQLText) = false then
       MessageDlg('저장 작업 중 에러가 발생하였습니다.'+#13 +
                  '관리자에게 문의하십시오..' ,mtError,[mbOK],0)
    else
    begin
       gbChanged := False;
       MessageDlg('특기사항 저장 작업이 성공적으로 완료되었습니다.', mtInformation,[mbOK],0);
    end;

    //SpecText.Modified := False;
    SG_Main.SetFocus;
end;

procedure TMainForm.SG_MainDblClick(Sender: TObject);
begin
    if SG_Main.Cells[1,SG_Main.Row] <> '' then
        EditBtn.Click;
end;

procedure TMainForm.AddBtnClick(Sender: TObject);
var
  i, j, iSeqno: Integer;
  sTempDate: String;
begin
  Try
    RegForm := TRegForm.Create(Self);
    if TComponent(Sender).Tag = 1 then
    begin
        iSeqno  := StrToIntDef(Trim(SG_Main.Cells[m_SEQNO,SG_Main.Row]),0) + 1;

        RegForm.gsEmpno := MainForm.pEmpno;
        RegForm.gbSTATE := True;
//==============================================================================//
// 02.10    2002.04.06      손종운      직무경력 Update 대상기간  제한   전산처리요청서: 2002-2456호
//==============================================================================//
        RegForm.gsEnable := True;
//==============================================================================//

    end
    else
    begin
        if SG_Main.Cells[0,SG_Main.Row] = '' then Exit;

        with RegForm do
        begin
            // 초기화
            iSeqno       := StrToIntDef(Trim(SG_Main.Cells[m_SEQNO,SG_Main.Row]),0);

            gsEmpno      := trim(SG_Main.Cells[m_EMPNO, SG_Main.Row]);
            gsFrDutydate := trim(SG_Main.Cells[m_FRDUTYDATE, SG_Main.Row]);
            gsToDutydate := trim(SG_Main.Cells[m_TODUTYDATE, SG_Main.Row]);
            gbSTATE      := False;
//==============================================================================//
// 02.10    2002.04.06      손종운      직무경력 Update 대상기간  제한   전산처리요청서: 2002-2456호
//==============================================================================//
            if pSeqno = SG_Main.Row then
              gsEnable := True
            else
              gsEnable := False;
//==============================================================================//
        end;
    end;
    RegForm.ShowModal;

  Finally
    RegForm.Free;
  End;

    Application.ProcessMessages;

  //  if RegForm.RESET_ON then
  //  begin
        SET_GRID;

        fnSGLocate(SG_Main,'0',IntToStr(iSeqno)); // UPitLib
  //   end;
end;

procedure TMainForm.ExitBtnClick(Sender: TObject);
begin
//    if MessageDlg(' 저장하지 않은 데이타는 손실될 수 있습니다.'+#13 +
//                  ' 그래도 종료하시겠습니까? ', mtInformation,[mbYes, mbNo],0) = mrNo then
//        System.Exit;
    Close;
end;

procedure TMainForm.DeleteBtnClick(Sender: TObject);
var
  SQL, sFrDate, sToDate: String;
  iSeqno: Integer;
begin
    if SG_Main.Cells[0,SG_Main.Row] = '' then Exit;
                                       // UPitLib

    iSeqno  := StrToInt(Trim(SG_Main.Cells[m_SEQNO, SG_Main.Row]));
    sFrDate := Trim(SG_Main.Cells[m_FRDUTYDATE, SG_Main.Row]);
    sToDate := Trim(SG_Main.Cells[m_TODUTYDATE, SG_Main.Row]);

    if MessageDlg(' "'+Trim(SG_Main.Cells[m_DUTYDATE, SG_Main.Row]) + '" 기간자료에 대하여 일괄 삭제하시겠습니까? ',
                  mtInformation,[mbYes, mbNo],0) = mrNo then Exit;

    SQL := Format( 'DELETE FROM pishrsub s  '+
                   'WHERE empno   = ''%s''  '+
                   '  AND dutyno in         '+
                   '      (SELECT dutyno FROM pishrmas m                    '+
                   '       WHERE m.empno = s.empno                          '+
                   '         AND frdutydate = ''%s''                        '+
                   '         AND NVL(todutydate,''0'') = NVL(''%s'',''0'')) ',
                   [MainForm.pEmpno, sFrDate, sToDate]);

    if DM.EXEC_SQL(SQL) = false then
    begin
       MessageDlg('"상세직무" 삭제 작업 중 에러가 발생하였습니다.'+#13 +
                  '관리자에게 문의하십시오..' ,mtError,[mbOK],0);
       System.Exit;
    end;

    SQL := Format('DELETE FROM pishrmas    '+
                   'WHERE empno   = ''%s'' '+
                   '  AND frdutydate = ''%s'' '+
                   '  AND NVL(todutydate,''0'') = NVL(''%s'',''0'') ',
                   [MainForm.pEmpno, sFrDate, sToDate]);
    if DM.EXEC_SQL(SQL) = false then
    begin
       MessageDlg('"직무" 삭제 작업 중 에러가 발생하였습니다.'+#13 +
                  '관리자에게 문의하십시오..' ,mtError,[mbOK],0);
       System.Exit;
    end;

    // 마스터에 자료가 없으면 전체 테이블 자료 제거
    // SQL := Format('SELECT Count(*) cnt FROM PISHRMAS  WHERE empno = ''%s'' ' , [MainForm.Pempno]);
    //
    // tuxCDM.Csel_SQL := SQL;
    // tuxCDM.Csel_Open;
    // if not tuxCDM.Csel_ret then
    // begin
    //   Messagedlg('APP-Server Error : ' + tuxCDM.Csel.ServiceName + #13 +
    //              '[' + tuxCDM.Csel.HeaderInfo.ErrCode + '] ' + tuxCDM.Csel.HeaderInfo.ErrMSG
    //              ,mtError,[mbOK],0);
    //   Exit;
    // end;
    //
    // if strtoint(TuxCDM.Csel_gfd(1)) < 1 then
    // begin
    //     SQL := Format('DELETE FROM pishrspec   '+
    //                    'WHERE empno   = ''%s'' ', [MainForm.pEmpno]);
    //     if tuxCDM.EXEC_SQL(SQL) = false then
    //     begin
    //        MessageDlg('"프로그램" 삭제 작업 중 에러가 발생하였습니다.'+#13 +
    //                   '관리자에게 문의하십시요..' ,mtError,[mbOK],0);
    //        Exit;
    //     end;
    //
    //     SQL := Format('DELETE FROM pishreqip   '+
    //                    'WHERE empno   = ''%s'' ', [MainForm.pEmpno]);
    //     if tuxCDM.EXEC_SQL(SQL) = false then
    //     begin
    //        MessageDlg('"장비" 삭제 작업 중 에러가 발생하였습니다.'+#13 +
    //                   '관리자에게 문의하십시요..' ,mtError,[mbOK],0);
    //        Exit;
    //     end;
    //
    //     SQL := Format('DELETE FROM pishrprog   '+
    //                    'WHERE empno   = ''%s'' ', [MainForm.pEmpno]);
    //     if tuxCDM.EXEC_SQL(SQL) = false then
    //     begin
    //        MessageDlg('"프로그램" 삭제 작업 중 에러가 발생하였습니다.'+#13 +
    //                   '관리자에게 문의하십시요..' ,mtError,[mbOK],0);
    //        Exit;
    //     end;
    // end;

    MessageDlg('삭제 작업이 성공적으로 완료되었습니다.', mtInformation,[mbOK],0);
    Set_Grid;

    fnSGLocate(SG_Main,'0',IntToStr(iSeqno)); // UPitLib
end;

procedure TMainForm.Bt_PreViewClick(Sender: TObject);
begin
//    helpDsr.Caption := '';
//    helpDsr.Caption := '자료를 추출중입니다. 잠시만 기다려 주십시오..';
    if SG_Main.Cells[0,SG_Main.Row] = '' then Exit;
                                       // UPitLib
    Application.Processmessages;

    if fnGetPrintData then
    begin
        if TPeJeonOutLookBtn(Sender).Tag = 1 then
            PreviewForm.pequickRepPrn1.preview
        else
            PreviewForm.pequickRepPrn1.Print;
    end;
//        helpDsr.Caption := '작업이 완료되었습니다 !!';
end;

function TMainForm.fnGetPrintData: Boolean;
var
  Sql : string;
begin
    Result := False;

    if fnGetMainDataSet(pEmpno) = False then
        System.Exit;

    if DM.QCDS.Eof then
    begin
        Messagedlg('등록된 자료가 없습니다.', mtError,[mbOK],0);
        exit;
    end;
//    PBar.Position := PBar.Max;
    Result := True;
end;

procedure TMainForm.SpecTextKeyPress(Sender: TObject; var Key: Char);
begin
    gbChanged := True;
end;

procedure TMainForm.Bt_ConfirmClick(Sender: TObject);
var
  bSaved: Boolean;
begin
    SG_Main.SetFocus;
    if SG_Main.Cells[0,SG_Main.Row] = '' then Exit;

    if MessageDlg('['+Bt_Confirm.Caption+'] 작업을 하시겠습니까 ?',mtConfirmation,[mbYes,mbNo],0) = IDNO then
        System.Exit;

    St_Help.Panels[0].Text := ' ['+Bt_Confirm.Caption+'] 작업 처리중입니다..';
    St_Help.Perform(WM_PAINT,0,0);

    fzSaveFinConData(bSaved, 1, pEmpno, ''); // 저장작업
    if bSaved = False then
    begin
        MessageDlg('['+Bt_Confirm.Caption+'] 작업중 에러가 발생하였습니다.'+#13 +
                   '관리자에게 문의하십시오..' ,mtError,[mbOK],0);
        System.Exit;
    end;

    fzSettingButtons('','Y');
end;

procedure TMainForm.Bt_ConClick(Sender: TObject);
var
  bSaved: Boolean;
begin
    SG_Main.SetFocus;
    if SG_Main.Cells[0,SG_Main.Row] = '' then Exit;
                                       // UPitLib

    if MessageDlg('['+Bt_Con.Caption+'] 작업을 하시겠습니까 ?',mtConfirmation,[mbYes,mbNo],0) = IDNO then
        System.Exit;

    St_Help.Panels[0].Text := ' ['+Bt_Con.Caption+'] 작업 처리중입니다..';
    St_Help.Perform(WM_PAINT,0,0);

    fzSaveFinConData(bSaved, 2, pEmpno, ''); // 저장작업
    if bSaved = False then
    begin
        MessageDlg('['+Bt_Con.Caption+'] 작업중 에러가 발생하였습니다.'+#13 +
                   '관리자에게 문의하십시오..' ,mtError,[mbOK],0);
        System.Exit;
    end;

    fzSettingButtons('Y','Y');
end;

procedure TMainForm.Bt_returnClick(Sender: TObject);
var
  Msg    : string;
  bSaved: Boolean;
  sendtime: String;
begin
    SG_Main.SetFocus;
    if SG_Main.Cells[0,SG_Main.Row] = '' then Exit;
                                       // UPitLib

    Msg := '[반려] 작업을 하시겠습니까 ?.';
    if MessageDlg(Msg,mtConfirmation,[mbYes,mbNo],0) = IDNO then
        System.Exit;

    St_Help.Panels[0].Text := ' 반려 작업 처리중입니다..';
    St_Help.Perform(WM_PAINT,0,0);

    fzSaveFinConData(bSaved, 3, pEmpno, ''); // 저장작업
    if bSaved = False then
    begin
        MessageDlg('[반려] 작업중 에러가 발생하였습니다.'+#13 +
                   '관리자에게 문의하십시오..' ,mtError,[mbOK],0);
        System.Exit;
    end;

    fzSettingButtons('N','N');
end;

procedure TMainForm.bt_CancelClick(Sender: TObject);
var
  bSaved: Boolean;
begin
    SG_Main.SetFocus;
    if SG_Main.Cells[0,SG_Main.Row] = '' then Exit;

    if MessageDlg('['+bt_Cancel.Caption+'] 작업을 하시겠습니까 ?',mtConfirmation,[mbYes,mbNo],0) = IDNO then
        System.Exit;

    St_Help.Panels[0].Text := ' ['+bt_Cancel.Caption+'] 작업 처리중입니다..';
    St_Help.Perform(WM_PAINT,0,0);

    fzSaveFinConData(bSaved, 4, pEmpno, ''); // 저장작업
    if bSaved = False then
    begin
        MessageDlg('['+bt_Cancel.Caption+'] 작업중 에러가 발생하였습니다.'+#13 +
                   '관리자에게 문의하십시오..' ,mtError,[mbOK],0);
        System.Exit;
    end;

    fzSettingButtons('','Y');
end;

procedure TMainForm.fzSaveFinConData(var mSaved: Boolean; mGubun: Integer; mEmpno, mSayu: String);
var
  SQLText: String;
begin
    mSaved := False;

    case mGubun of
      1:  // 결재상신
        SQLText := Format(
                   'UPDATE  pishrmas SET                                 '+
                   '  finyn = ''Y'',                                     '+
                   '  conyn = NULL,                                      '+
                   '  findate = to_char(sysdate,''YYYYMMDD''),           '+
                   '  rejsayu  = NULL,                                   '+
                   '  writeemp = ''%s'',                                 '+
                   '  writetime = TO_CHAR(SYSDATE, ''YYYYMMDDHH24MISS'') '+
                   'WHERE empno = ''%s''                                 ',
                   [MainForm.wEmpno,
                    MainForm.pEmpno]);
      2: // 결재
        SQLText := Format(
                   'UPDATE  pishrmas SET                                 '+
                   '  conyn = ''Y'',                                     '+
                   '  condate = to_char(sysdate,''YYYYMMDD''),           '+
                   //'  conempno   = ''%s'',                               '+
                   //'  conkorname = ''%s'',                               '+
                   '  rejsayu    = NULL,                                 '+
                   '  writeemp   = ''%s'',                               '+
                   '  writetime = TO_CHAR(SYSDATE, ''YYYYMMDDHH24MISS'') '+
                   'WHERE empno = ''%s''                                 ',
                   [// MainForm.wEmpno, MainForm.wKorname,
                    MainForm.wEmpno,
                    MainForm.pEmpno]);
      3: // 반려
        SQLText := Format(
                   'UPDATE  pishrmas SET                                 '+
                   '  finyn = ''N'',                                     '+
                   '  conyn = ''N'',                                     '+
                   '  condate = to_char(sysdate,''YYYYMMDD''),           '+
                   //'  conempno = ''%s'',                                 '+
                   //'  conkorname = ''%s'',                               '+
                   '  rejsayu    = ''%s'',                               '+
                   '  writeemp   = ''%s'',                               '+
                   '  writetime = TO_CHAR(SYSDATE, ''YYYYMMDDHH24MISS'') '+
                   'WHERE empno = ''%s''                                 ',
                   [// MainForm.wEmpno, MainForm.wKorname,
                    mSayu,
                    MainForm.wEmpno,
                    MainForm.pEmpno]);
      4: // 결재취소
        SQLText := Format(
                   'UPDATE  pishrmas SET                                 '+
                   '  conyn = NULL,                                      '+
                   '  condate = to_char(sysdate,''YYYYMMDD''),           '+
                   //'  conempno   = ''%s'',                               '+
                   //'  conkorname = ''%s'',                               '+
                   '  rejsayu    = NULL,                                 '+
                   '  writeemp   = ''%s'',                               '+
                   '  writetime = TO_CHAR(SYSDATE, ''YYYYMMDDHH24MISS'') '+
                   'WHERE empno = ''%s''                                 ',
                   [//MainForm.wEmpno, MainForm.wKorname,
                    MainForm.wEmpno,
                    MainForm.pEmpno]);
      else
      ;
    end;

    if DM.EXEC_SQL(SQLText) = false then
    begin
        MessageDlg('저장 작업 중 에러가 발생하였습니다.'+#13 +
                   '관리자에게 문의하십시오..' ,mtError,[mbOK],0);
    end;

    mSaved := True;
end;

procedure TMainForm.fzSetSaveButtons(mEabled: Boolean);
begin
    AddBtn.Enabled     := mEabled;
    EditBtn.Enabled    := mEabled;
    DeleteBtn.Enabled  := mEabled;
    SpecBtn.Enabled    := mEabled;
end;

procedure TMainForm.fzSetConButtons(mEabled: Boolean);
begin
    Bt_Confirm.Enabled := mEabled; // 결재 or 결재상신
    Bt_Con.Enabled     := mEabled;
    Bt_return.Enabled  := mEabled;
    Bt_Cancel.Enabled  := mEabled;
end;


procedure TMainForm.Bt_SrhClick(Sender: TObject);
var
  sMsg: String;
begin
    SG_Main.SetFocus;
    if Ed_empno.Valuer.empno = '' then
    begin
        Ed_empno.SetFocus;
        System.Exit;
    end;

    pEmpno   := Ed_empno.Valuer.empno;
    pKorname := Ed_empno.Valuer.Korname;
    fzGetEmpData(pEmpno);

//    fzSettingButtons(DM.QImsi.FieldByName('CONYN').AsString, DM.QImsi.FieldByName('FINYN').AsString); SHM

//버튼값이 맞아 변경 2007.03.22 SHM
    if DM.QImsi.FieldByName('prog').AsString = '등록중' then
       fzSettingButtons('N','N')
    else
    if DM.QImsi.FieldByName('prog').AsString = '결재상신중' then
       fzSettingButtons('N','Y')
    else
    if DM.QImsi.FieldByName('prog').AsString = '결재완료' then
       fzSettingButtons('Y','Y');

  TRY

  FINALLY
    Set_Grid;
    if (SG_Main.Cells[0,SG_Main.FixedRows] <> '') and  (sMsg <> '') then
        MessageDlg(sMsg,mtInformation,[mbOK],0);
  END;
end;

function TMainForm.fzSettingButtons(mConYN, mFinYN: String): String;
begin
    Result := '';

    fzSetSaveButtons(False);
    fzSetConButtons(False);
    // all buttons disabled
    //if (copy(pSysdate,1,8) < PfrBasedate) or (copy(pSysdate,1,8) > PtoBasedate) then // 등록 불가능
    //    System.Exit;

    if mConYN = 'Y' then // 결재완료
    begin
      //  L_State.Caption := '결재완료'; SHM 2007.03.22   fzGetEmpData에서 뿌려주기 때문에 
        //fzSetSaveButtons(False);
        //fzSetConButtons(False);
        Bt_Cancel.Enabled := True;

        Result := '결재상신한 직무경력내역에 대하여 결재된 자료입니다. [입력][수정][삭제] 하실 수 없습니다.';
        System.Exit;
    end
    else if mConYN = 'N' then
    begin
      //  L_State.Caption := '반려';  SHM 2007.03.22
        fzSetSaveButtons(True);
        //fzSetConButtons(False);
        Bt_Confirm.Enabled := True;

        Result := '';
        System.Exit;
    end
    else
    begin
        if mFinYN = 'Y' then // ☞ 확인중
        begin
         //   L_State.Caption := '결재상신중'; SHM 2007.03.22
            //fzSetSaveButtons(False);
            fzSetConButtons(True);
            bt_Cancel.Enabled := False;

            Result := '결재상신한 직무경력내역에 대하여 확인중입니다.';
            System.Exit;
        end
        else
        begin
        //    L_State.Caption := '등록중'; SHM 2007.03.22
            fzSetSaveButtons(True);
            //fzSetConButtons(False);

            Result := '';
            System.Exit;
        end;
    end;
end;

procedure TMainForm.Ed_empnoEnter(Sender: TObject);
begin
    fzSGInitialRow(SG_Main); // UpitLib


    L_State.Caption := '';
    fzSetSaveButtons(False);
    fzSetConButtons(False);

    Ed_ConEmpno.Text := '';
    Ed_ConEmpno.Valuer.Empno := '';
    Ed_ConEmpno.Valuer.Korname := '';

    SG_Main.Refresh;
end;

procedure TMainForm.Ed_empnoKeyPress(Sender: TObject; var Key: Char);
begin
    if Key = Chr(13) then
    begin
        Bt_SrhClick(Sender);
        inherited;
        Key := #0;
    end;
end;

procedure TMainForm.fzGetEmpData(mEmpno: String);
var
  SqlText : string;
begin
{    SqlText := Format(
      'SELECT        '+ chr(13) + chr(10) +
      ' empno      , '+ chr(13) + chr(10) +
      ' korname    , '+ chr(13) + chr(10) +
      ' orgnum     , '+ chr(13) + chr(10) +
      ' deptcode   , '+ chr(13) + chr(10) +
      ' deptname   , '+ chr(13) + chr(10) +
      ' paycl      , '+ chr(13) + chr(10) +
      ' payclname  , '+ chr(13) + chr(10) +
      ' payra      , '+ chr(13) + chr(10) +
      ' payraname  , '+ chr(13) + chr(10) +
      ' jobgun     , '+ chr(13) + chr(10) +
      ' jobgunname , '+ chr(13) + chr(10) +
      ' conempno   , '+ chr(13) + chr(10) +
      ' conkorname , '+ chr(13) + chr(10) +
      ' conyn      , '+ chr(13) + chr(10) +
      ' finyn      , '+ chr(13) + chr(10) +
      ' prog         '+ chr(13) + chr(10) +
      ' FROM (       '+ chr(13) + chr(10) +
           ' SELECT a.empno, a.korname, a.orgnum, a.deptcode, d.deptname, '+ chr(13) + chr(10) +
           '        a.paycl, cl.codename payclname,    '+                    chr(13) + chr(10) +
           '        a.payra, ra.codename payraname,    '+                    chr(13) + chr(10) +
           '        a.jobgun,jg.codename jobgunname,   '+                    chr(13) + chr(10) +
           '        r.conempno, r.conkorname, '+                             chr(13) + chr(10) +
//==============================================================================//
// 02.12    2002.04.08      손종운      상태표시 수정
//==============================================================================//
//           '        r.conyn, finyn, '+
//           '        decode(r.conyn,''N'',''반려'',                        '+
//           '                       ''Y'',''결재완료'',                    '+
//           '                       decode(r.finyn,''Y'',''결재상신중'',   '+
//           '                                            ''등록중'')) prog '+
           '        decode(r.lastYear, substr(TO_CHAR(SYSDATE,''YYYY''), 1, 4), r.conyn, '' '') conyn, '+ chr(13) + chr(10) +
           '        decode(r.lastYear, substr(TO_CHAR(SYSDATE,''YYYY''), 1, 4), r.finyn, '' '') finyn, '+ chr(13) + chr(10) +
           '        decode(r.lastYear, substr(TO_CHAR(SYSDATE,''YYYY''), 1, 4), '+                        chr(13) + chr(10) +
           '        decode(r.conyn,''N'',''반려'',                        '+                              chr(13) + chr(10) +
           '                       ''Y'',''결재완료'',                    '+                              chr(13) + chr(10) +
           '                       decode(r.finyn,''Y'',''결재상신중'',   '+                              chr(13) + chr(10) +
           '                                            ''등록중'')), ''등록중'') prog '+chr(13) + chr(10) +
//==============================================================================//
           ' FROM  (select codeno, codename from pyccode where codeid = ''I112'') cl, '+ chr(13) + chr(10) +// 직급
           '       (select codeno, codename from pyccode where codeid = ''I113'') ra, '+ chr(13) + chr(10) +// 직위
           '       (select codeno, codename from pyccode where codeid = ''I115'') jg, '+ chr(13) + chr(10) +// 직군
//==============================================================================//
// 02.12    2002.04.08      손종운      상태표시 수정
//==============================================================================//
// 05.01          '       (select empno, max(conempno) conempno, max(conkorname) conkorname, '+
           '       (select empno, min(nvl(conempno,'' '')) conempno, min(nvl(conkorname,'' '')) conkorname, '+ chr(13) + chr(10) +
           '                      max(conyn) conyn, max(finyn) finyn,                                       '+ chr(13) + chr(10) +
           '                      max(SubStr(writetime, 1, 4)) LastYear                                     '+ chr(13) + chr(10) +
           '        from pishrmas                                                                           '+ chr(13) + chr(10) +
           '        group by empno) r,                                                                      '+ chr(13) + chr(10) +
//==============================================================================//
           '       pycdept d,                                        '+ chr(13) + chr(10) +
           '       pimpmas  a,                                       '+ chr(13) + chr(10) +
           '       pishrvari v                                       '+ chr(13) + chr(10) +
           '  WHERE a.empno  = r.empno (+)                           '+ chr(13) + chr(10) +
           '    AND a.empno = ''%s''                                 '+ chr(13) + chr(10) +
           '    AND a.paycl  = cl.codeno                             '+ chr(13) + chr(10) +
           '    AND a.payra  = ra.codeno                             '+ chr(13) + chr(10) +
           '    AND a.jobgun = jg.codeno                             '+ chr(13) + chr(10) +
           '    AND a.orgnum = d.orgnum AND a.deptcode  = d.deptcode '+ chr(13) + chr(10) +
           '    AND v.gubun = ''00'' and v.sgubun = ''0003''         '+ chr(13) + chr(10) +
           '    AND a.paycl between v.value1 and v.value2            '+ chr(13) + chr(10) +
           '    AND a.pstate < ''80'' )                              '+ chr(13) + chr(10) +
      ' ORDER BY  deptcode, paycl, empno                             ',[mEmpno]); } //SHM 2007.03.22

    SqlText := Format(
      'SELECT  A.EMPNO, A.KORNAME, A.ORGNUM, B.DEPTCODE,B.DEPTNAME,A.PAYCL,C.CODENAME,A.PAYRA,F.CODENAME,                           '+
      '        A.EEMPNO CONEMPNO,A.EKORNAME CONKORNAME,D.CONYN,D.FINYN,                                                             '+
      '        decode(D.LastYear, substr(TO_CHAR(SYSDATE,''YYYY''), 1, 4),                                                          '+
      '        decode(D.conyn,''N'',''반려'',''Y'',''결재완료'',decode(D.finyn,''Y'',''결재상신중'', ''등록중'')), ''등록중'') prog '+
      '  FROM  PIMEEMP A, PYCDEPT B, PYCCODE C, PYCCODE F,                                                                          '+
      '       (select empno, max(nvl(conyn,''Z'')) conyn, max(nvl(finyn,''Z'')) finyn,                                              '+
      '               decode(max(substr(writetime, 1, 4)),''2004'',''2005'', max(substr(writetime, 1, 4))) LastYear                 '+
      '                  from pishrmas                                                                                              '+
      '        group by empno) D                                                                                                    '+
      ' WHERE  A.PSTATE   < ''80''                                                                                                  '+
      '   AND  A.DEPTCODE =  B.DEPTCODE                                                                                             '+
      '   AND  B.ORGNUM   =  (SELECT VALUE1 FROM PIMVARI WHERE GUBUN = ''00'' AND SGUBUN = ''0001'')                                '+
      '   AND  A.PAYCL    =  C.CODENO  AND  C.CODEID = ''I112''                                                                     '+
      '   AND  A.PAYRA    =  F.CODENO  AND  F.CODEID = ''I113''                                                                     '+
      '   AND  A.EMPNO    =  D.EMPNO                                                                                                '+
      '   AND  A.EMPNO    =  ''%s''   ',[mEmpno]);

    with DM.QImsi do
    begin
      Close;
      Sql.Clear;
      Sql.Text := Sqltext;
      edit1.Text := Sql.Text;
      try
         Open;

         Ed_ConEmpno.Text           := Trim(FieldByName('CONKORNAME').AsString);
         Ed_ConEmpno.Valuer.empno   := Trim(FieldByName('CONEMPNO').AsString);
         Ed_ConEmpno.Valuer.korname := Trim(FieldByName('CONKORNAME').AsString);
         L_State.Caption            := Trim(FieldByName('PROG').AsString);   //SHM 2007.03.22

      except
        begin
          Close;
          Messagedlg(' DataBase Engine Error ' + #13+ #13+ ' --> 시스템 관리자에게 연락하세요!',mtError,[mbOK],0);
          System.Exit;
        end;
      end;
    end;
end;

procedure TMainForm.ConBtnClick(Sender: TObject);
var
  iCheckExist: Integer;
  SQLText: String;
begin
    if SG_Main.Cells[0,SG_Main.Row] = '' then Exit;

    if MessageDlg('['+ConBtn.Caption+'] 작업을 하시겠습니까 ?',mtConfirmation,[mbYes,mbNo],0) = IDNO then
        System.Exit;

    St_Help.Panels[0].Text := ' ['+ConBtn.Caption+'] 작업 처리중입니다..';
    St_Help.Perform(WM_PAINT,0,0);

    SQLText := Format(
               'UPDATE  PISHRMAS  SET   '+
               '  conempno   = ''%s'' , '+
               '  conkorname = ''%s'' , '+
               '  writeemp   = ''%s'' , '+
               '  writetime  = TO_CHAR(SYSDATE, ''YYYYMMDDHH24MISS'') ' +
               'WHERE empno = ''%s''     ' ,
               [Ed_ConEmpno.Valuer.empno, Ed_ConEmpno.Valuer.korname, MainForm.wEmpno, MainForm.pEmpno]);

    if DM.EXEC_SQL(SQLText) = false then
       MessageDlg('저장 작업 중 에러가 발생하였습니다.'+#13 +
                  '관리자에게 문의하십시오..' ,mtError,[mbOK],0)
    else
    begin
       gbChanged := False;
       MessageDlg('결재자정보 저장 작업이 성공적으로 완료되었습니다.', mtInformation,[mbOK],0);
    end;

    //SpecText.Modified := False;
    SG_Main.SetFocus;
end;

procedure TMainForm.Ed_EmpnoExit(Sender: TObject);
begin
    if Ed_empno.Valuer.Empno = '' then
        Ed_empno.Setfocus;
end;

//2005.07.04 직무경력 update 작업 추가
procedure TMainForm.JobBtnClick(Sender: TObject);
var
  iCheckExist: Integer;
  SQLText1, SQLText2, SQLText3: String;
begin
    if SG_Main.Cells[0,SG_Main.Row] = '' then Exit;

    if MessageDlg('['+JobBtn.Caption+'] 작업을 하시겠습니까 ?',mtConfirmation,[mbYes,mbNo],0) = IDNO then
        System.Exit;

    St_Help.Panels[0].Text := ' ['+JobBtn.Caption+'] 작업 처리중입니다..';
    St_Help.Perform(WM_PAINT,0,0);
    //ShowMessage('wEmpno(작업사번):'+MainForm.wEmpno+' |pEmpno'+MainForm.pEmpno+'| Pjobgun:'+MainForm.Pjobgun);

    //{1.현직무 update 2.인사마스터에 직군,직종 update
    SQLText1 := Format('DELETE FROM PISHRCURR WHERE EMPNO  = ''%s''',[MainForm.pEmpno]);

    SQLText2 := Format(
               'INSERT INTO PISHRCURR                                                                                       '+#13+
               'SELECT EMPNO, KORNAME, JOBFIELD, DUTYKIND, DUTY,''%s'',TO_CHAR(SYSDATE, ''YYYYMMDDHH24MISS'') FROM PISHRMAS '+#13+
               'WHERE (EMPNO, FRDUTYDATE , DUTYTERMRATE, JOBFIELD, DUTYKIND, DUTYNO) IN                                     '+#13+
               '   (SELECT A.EMPNO, A.FRDUTYDATE, MAX(A.DUTYTERMRATE) XDUTYRATE,                                            '+#13+
               '   		   MIN(JOBFIELD) JOBFIELD,MIN(DUTYKIND) DUTYKIND, MIN(DUTYNO) DUTYNO                        '+#13+
               '    FROM  PISHRMAS A,(SELECT EMPNO, MAX(NVL(TODUTYDATE,''9'')) TODUTYDATE FROM PISHRMAS GROUP BY EMPNO ) B  '+#13+
               '    WHERE A.EMPNO = B.EMPNO                                                                                 '+#13+
               '	  AND NVL(A.TODUTYDATE,''9'') = B.TODUTYDATE							    '+#13+
               '    GROUP BY A.EMPNO, A.FRDUTYDATE )                                                                        '+#13+
               'AND EMPNO = ''%s''      	',
               [MainForm.wEmpno,MainForm.pEmpno]);

    SQLText3 := Format(          //shm 
              'UPDATE  PIMPMAS SET                                                '+#13+
              '  jobgun   = (SELECT JOBFIELD FROM PISHRCURR WHERE EMPNO = ''%s''),'+#13+
              '  jobkind  = (SELECT DUTYKIND FROM PISHRCURR WHERE EMPNO = ''%s'') '+#13+
              'WHERE empno = ''%s''                                               ',
              [MainForm.pEmpno,MainForm.pEmpno,MainForm.pEmpno]  );

    TRY
       with DM.Cupd do
       begin
          Close;
          SQL.Clear;
          SQL.Text := SQLText1;
          ExecSql;
          Close;
          SQL.Clear;
          SQL.Text := SQLText2;
          ExecSql;
          Close;
          SQL.Clear;
          SQL.Text := SQLText3;
          ExecSql;
          Close;
       end;
       //Memo1.Lines.Add(SQLText1);Memo1.Lines.Add(SQLText2); Memo1.Lines.Add(SQLText3);
       MessageDlg('['+JobBtn.Caption+'] 작업이 성공적으로 완료되었습니다.', mtInformation,[mbOK],0);
    EXCEPT
       Close;
       System.Exit;
       MessageDlg('저장 작업 중 에러가 발생하였습니다.'+#13 +
                 '관리자에게 문의하십시오..' ,mtError,[mbOK],0)
    END;
    //}
    SG_Main.SetFocus;

end;

end.

