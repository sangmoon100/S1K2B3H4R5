{============================= Program Header ========================================
PROGRAM-NAME    :  PKW2080A(일반직 급여내역 관리)
SYSTEM-NAME     : 종합인사정보
SUBSYSTEM-NAME  : 급여
Programmer      : 강기우
Version         : 30.00
Date            : 2000.05.31
Update contents
  30.00   2000.05.31   강기우   신규프로그램개발                        처리명세서
  30.10   2000.08.08   유효성   개인별 상여항목(bonusamt)자동계산 주석처리(전화요청)
  30.20   2001.01.08   유효성   초과근무 제외시간 추가(restamt, sprestamt)
  30.30   2001.08.30   유효성   제외식사수당/제외9이상수당 추가(mealamt, excepamt)
======================================================================================}
unit pkw20801;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, numedit, Mask, ExtCtrls, Math, DBTables, Db,
  peoutlookbtn, ComCtrls, pegradpanl, Tmax_DataSetText, Tmax_session,
  OnInsaCommon, TmaxFunc, MemDS, DBAccess, Ora, Func;

type
  TFpkw2080a = class(TForm)
    Pdata: TPanel;
    Pkey: TPanel;
    Panel13: TPanel;
    MEpaydate: TMaskEdit;
    Panel14: TPanel;
    Eempno: TEdit;
    SBempno: TSpeedButton;
    P_korname: TPanel;
    Panel10: TPanel;
    NEmonpayamt: TNumberEdit;
    Panel11: TPanel;
    NEextamt: TNumberEdit;
    NEexthh: TNumberEdit;
    NEnighthh: TNumberEdit;
    Panel17: TPanel;
    NEnightamt: TNumberEdit;
    Panel18: TPanel;
    NEholiamt: TNumberEdit;
    Panel19: TPanel;
    NEmcardd: TNumberEdit;
    Panel20: TPanel;
    NEnightmealdd: TNumberEdit;
    NEnightmealamt: TNumberEdit;
    Panel27: TPanel;
    NEselfdevamt: TNumberEdit;
    Panel28: TPanel;
    NEattrfeeamt: TNumberEdit;
    Panel29: TPanel;
    Panel30: TPanel;
    NEcompaysum: TNumberEdit;
    NEmcaramt: TNumberEdit;
    Pdeptname: TPanel;
    Panel4: TPanel;
    Epaygr: TEdit;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel5: TPanel;
    NEmonbonamt: TNumberEdit;
    Panel12: TPanel;
    NEmonretamt: TNumberEdit;
    Panel21: TPanel;
    NEmonindamt: TNumberEdit;
    NEholihh: TNumberEdit;
    Panel25: TPanel;
    NEcompanypay: TNumberEdit;
    Panel33: TPanel;
    NEbonusamt: TNumberEdit;
    Pa_Title: TPeJeonGrdPanel;
    L_Date: TStatusBar;
    PeJeonGrdPanel2: TPeJeonGrdPanel;
    BBcancel: TPeJeonOutLookBtn;
    BBclose: TPeJeonOutLookBtn;
    BBsave: TPeJeonOutLookBtn;
    Panel1: TPanel;
    Panel2: TPanel;
    Ptjobduty: TPanel;
    Panel35: TPanel;
    Panel36: TPanel;
    NEpersonpay: TNumberEdit;
    Panel39: TPanel;
    NEnopaycnt: TNumberEdit;
    Panel40: TPanel;
    Panel41: TPanel;
    NEperpaysum: TNumberEdit;
    NEcomdedsum: TNumberEdit;
    PeJeonOutLookBtn1: TPeJeonOutLookBtn;
    Panel3: TPanel;
    NEperdedsum: TNumberEdit;
    Panel42: TPanel;
    NEcomrealpay: TNumberEdit;
    Panel43: TPanel;
    NEperrealpay: TNumberEdit;
    Ppaycl: TPanel;
    Porgnum: TPanel;
    Ppaynum: TPanel;
    Pfincode: TPanel;
    SpeedButton3: TSpeedButton;
    Etrainyn: TComboBox;
    Panel9: TPanel;
    Panel15: TPanel;
    Panel16: TPanel;
    Panel22: TPanel;
    Panel23: TPanel;
    Panel24: TPanel;
    Bevel2: TBevel;
    SpeedButton1: TSpeedButton;
    NEbasicamt: TNumberEdit;
    Pjobduty: TPanel;
    NEetctaxamt: TNumberEdit;
    Panel26: TPanel;
    NErestamt: TNumberEdit;
    Panel31: TPanel;
    NEsprestamt: TNumberEdit;
    Panel32: TPanel;
    NEmealamt: TNumberEdit;
    Panel34: TPanel;
    NEexcepamt: TNumberEdit;
    Bevel1: TBevel;
    NEexcephh: TNumberEdit;
    NEmealhh: TNumberEdit;
    TMaxSession: TTMaxSession;
    TDS_batch: TTMaxDataSet;
    Memo1: TMemo;
    Qry1: TOraQuery;
    Qry2: TOraQuery;
    Qry_paygr: TOraQuery;
    procedure BBcloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EnterEvent(Sender: TObject);
    procedure ExitEvent(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SBempnoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BBsaveClick(Sender: TObject);
    procedure KeyClick(Sender: TObject);
    procedure KeyDownEvent(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BBcancelClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure EtjobdutyChange(Sender: TObject);
    procedure PeJeonOutLookBtn1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure PeJeonOutLookBtn1MouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure PeJeonGrdPanel2MouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure amtExit(Sender: TObject);
    procedure hhExit(Sender: TObject);
  private
    { Private declarations }
    ActiveFlag   : Boolean;
    BeforeValue1 : Real;
    BeforeValue2 : string;
    IsChange     : Boolean;
    WorkMode     : Integer; // 0 : 조회, 1 : 수정

  public
    { Public declarations }
    curdate       : string;

    function GetPaybank(paybank : string) : string;
    procedure SearchEmp(paydate, empno : string);
    procedure DisplayFields;
    procedure ClearFields;
    procedure ReCalc(gubun : integer);
    Procedure SetUp;
    function Gettjobduty(duty : string) : string;
    procedure searchpaygr(gubun, param1, param2: string);
    Procedure  Display_Msg2(p_str:string);   //Dsa2000
  end;

var
  Fpkw2080a : TFpkw2080a;
  sqlstr    : widestring;
  workmsg   : string;
  bbaseamt  : Double;
  gfBonusrate    :Double; // 상여지급율
  gfIndirectrate :Double; // 간접비 지급율
  gfBonusterm    :Double; // 상여지급개월수
  gfMcaramt      :Double; // 1일 중식대
  gfNightmealamt :Double; // 1일 야간식대

implementation

{$R *.DFM}

uses  calen1, kycode1, Pass, Kempno;

{===============================================================================
 ======================  < User Define Functions >  ============================
 ===============================================================================}
//2003.09.17. 강륜종(Dsa2000)  소켓 컴포넌트 바뀌면서 소스 수정.
Procedure TFpkw2080a.Display_Msg2(p_str:String);
var
   i,j     : LongInt;
   Temp    : Array[0..1000] of Char;
   HostStr : String;
begin
     i        := 0;
     j        := 0;
     HostStr  := '';
     for i := 0 to Length(p_str) - 1 do
     begin
       if p_str[i] = #10 then
         begin
//           ListBox.Items.Add( HostStr );
           HostStr := '';
         end
       else
         HostStr := HostStr + p_str[i];
     end;
//     if HostStr <> '' then ListBox.Items.Add( HostStr );
end;

// 은행명을 읽어오는 Function
function TFpkw2080a.GetPaybank(paybank : string) : string;
begin
     sqlstr := 'select codename' + #13 +
               'from   pyccode' + #13 +
               'where  codeid = ''K910''' + #13 +
        format('and    codeno = ''%s''',[paybank]);
     Qry2.Close;
     Qry2.Sql.Clear;
     Qry2.Sql.Add(sqlstr);
     Qry2.Open;
     result := Qry2.fieldbyname('codename').AsString;
     Qry2.Close;
end;

// 직무담당을 읽어오는 Function
function TFpkw2080a.Gettjobduty(duty : string) : string;
begin
     sqlstr := 'select codename' + #13 +
               'from   pyccode' + #13 +
               'where  codeid = ''I702''' + #13 +
        format('and    codeno = ''%s''',[duty]);
     Qry2.Close;
     Qry2.Sql.Clear;
     Qry2.Sql.Add(sqlstr);
     Qry2.Open;
     result := Qry2.fieldbyname('codename').AsString;
     Qry2.Close;
end;

{===============================================================================
 ======================  < User Define Procedures >  ===========================
 ===============================================================================}

// 사원조회를 수행
procedure TFpkw2080a.SearchEmp(paydate, empno : string);
var
   tempno : string;
begin
     sqlstr := 'select a.*, b.codename, c.deptname ' + #13 +
               'from   pkmigpay a, pyccode b, pycdept c ' + #13 +
        format('where  paydate = ''%s''',[paydate]) + #13 +
        format('and   (a.empno like ''%s'' or a.korname like ''%s'')',[empno+'%',empno+'%']) + #13 +
               'and (b.codeid = ''I702'' and b.codeno = a.jobduty)' + #13 +
               'and   (a.orgnum = c.orgnum(+) and a.deptcode = c.deptcode(+))';

    Qry1.Close;
    Qry1.Sql.Clear;
    Qry1.Sql.Add(sqlstr);
    Qry1.Open;

    if Qry1.eof then
    begin
       workmsg := '조회조건에 맞는 자료가 존재하지 않습니다.';
       Application.MessageBox(pchar(workmsg),'[작업안내]',MB_OK+MB_ICONWARNING);
    end
    else if Qry1.recordcount = 1 then
    begin
       Eempno.text      := Qry1.FieldByName('empno').AsString;
       P_korname.caption := Qry1.FieldByName('korname').AsString;
       if copy(Eempno.text,1,1) <> 'Y' Then
       begin
         L_Date.Panels[0].Text := '   파견직 사원만 사용가능합니다.';
         ClearFields;
         system.exit;
       end;

       DisplayFields;
       L_Date.Panels[0].Text := '   조회조건에 맞는 자료가 조회되었습니다...';
    end
    else
       begin

       try
       Fempno := TFempno.create(self);
       Fempno.paydate := paydate;
       Fempno.empno   := empno;
       Fempno.ShowModal;
       tempno := '';
       if Fempno.pempno <> '' then
          begin
          tempno      := Fempno.pempno;
          Eempno.text := Fempno.pempno;
          P_korname.caption := Fempno.pkorname;
          end;
       finally
       Fempno.Free;
       end;

       if tempno <> '' then
          SearchEmp(paydate,tempno);
       end;
end;

// Data를 표시
procedure TFpkw2080a.DisplayFields;
begin
     WorkMode := 1;
     Pdata.enabled := True;

// 기본 필드.
     Porgnum.Caption   := Qry1.FieldByName('orgnum').AsString;
     Pdeptname.caption := Qry1.FieldByName('deptname').AsString;
     Pfincode.Caption  := Qry1.FieldByName('fincode').AsString;
     Ppaynum.Caption   := Qry1.FieldByName('paynum').AsString;
     Ppaycl.Caption    := Qry1.FieldByName('paycl').AsString;
     Epaygr.text       := Qry1.FieldByName('paygr').AsString;
     Pjobduty.Caption  := Qry1.FieldByName('jobduty').AsString;
     Ptjobduty.Caption := Qry1.FieldByName('codename').AsString;
     if Qry1.FieldByName('trainyn').AsString = 'Y' then
       Etrainyn.ItemIndex := 0
     else
       Etrainyn.ItemIndex := 1;


// 각종 급여 필드.
     NEbasicamt.Value  := Qry1.FieldByName('basicamt').AsFloat;
     NEmonpayamt.value := Qry1.FieldByName('monpayamt').AsFloat;
     NEmonbonamt.value := Qry1.FieldByName('monbonamt').AsFloat;
     NEmonretamt.value := Qry1.FieldByName('monretamt').AsFloat;
     NEmonindamt.value := Qry1.FieldByName('monindamt').AsFloat;
     NEcompanypay.value := Qry1.FieldByName('companypay').AsFloat;
     NEbonusamt.value  := Qry1.FieldByName('bonusamt').AsFloat;
     if Pjobduty.Caption = '31' Then  //직무담당이 'TSR'은상여금이 0이다.
     begin
       if (NEmonbonamt.Value <> 0) or (NEbonusamt.Value <> 0) Then
       begin
         L_Date.Panels[0].Text := '   월상여금 또는 상여값이 틀림니다 확인 바람니다.';
         NEbonusamt.SetFocus;
       end;
     end;
     NEpersonpay.value := Qry1.FieldByName('personpay').AsFloat;
//     NEtotmm.value     := Qry1.FieldByName('totmm').AsFloat;
//     NErestmm.value    := Qry1.FieldByName('restmm').AsFloat;
     NEexthh.value     := Qry1.FieldByName('exthh').AsFloat;
     NEnighthh.value   := Qry1.FieldByName('nighthh').AsFloat;
     NEholihh.value    := Qry1.FieldByName('holihh').AsFloat;
//     NEbaseamt.value   := Qry1.FieldByName('baseamt').AsFloat;
     NEextamt.value    := Qry1.FieldByName('extamt').AsFloat;
     NEnightamt.value  := Qry1.FieldByName('nightamt').AsFloat;
     NEholiamt.value   := Qry1.FieldByName('holiamt').AsFloat;
{===============================================================================
  30.20   2001.01.08   유효성   초과근무 제외시간 추가(restamt, sprestamt)
================================================================================}
     NErestamt.value   := Qry1.FieldByName('restamt').AsFloat;
     NEsprestamt.value   := Qry1.FieldByName('sprestamt').AsFloat;
{===============================================================================
  30.30   2001.08.30   유효성   제외식사수당/제외9이상수당 추가(mealamt, excepamt)
================================================================================}
     NEmealhh.value   := Qry1.FieldByName('mealhh').AsFloat;
     NEexcephh.value   := Qry1.FieldByName('excephh').AsFloat;
     NEmealamt.value   := Qry1.FieldByName('mealamt').AsFloat;
     NEexcepamt.value   := Qry1.FieldByName('excepamt').AsFloat;

     NEnopaycnt.value  := Qry1.FieldByName('nopaycnt').AsFloat;
     NEmcardd.value    := Qry1.FieldByName('mcardd').AsFloat;
     NEnightmealdd.value := Qry1.FieldByName('nightmealdd').AsFloat;
     NEmcaramt.value   := Qry1.FieldByName('mcaramt').AsFloat;
     NEnightmealamt.value := Qry1.FieldByName('nightmealamt').AsFloat;
     NEselfdevamt.value   := Qry1.FieldByName('selfdevamt').AsFloat;
     NEattrfeeamt.value   := Qry1.FieldByName('attrfeeamt').AsFloat;
     NEetctaxamt.value    := Qry1.FieldByName('etctaxamt').AsFloat;
     NEcompaysum.value    := Qry1.FieldByName('compaysum').AsFloat;
     NEperpaysum.value    := Qry1.FieldByName('perpaysum').AsFloat;
     NEcomdedsum.value    := Qry1.FieldByName('comdedsum').AsFloat;
     NEperdedsum.value    := Qry1.FieldByName('perdedsum').AsFloat;
     NEcomrealpay.value   := Qry1.FieldByName('comrealpay').AsFloat;
     NEperrealpay.value   := Qry1.FieldByName('perrealpay').AsFloat;

end;

// Data를 Clear
procedure TFpkw2080a.ClearFields;
begin
     IsChange := False;
     WorkMode := 0;
     Pdata.enabled := false;

     Pdeptname.caption := '';

     NEbasicamt.Value  := 0;
     NEmonpayamt.value := 0;
     NEmonbonamt.value := 0;
     NEmonretamt.value := 0;
     NEmonindamt.value := 0;
     NEcompanypay.value := 0;
     NEbonusamt.value  := 0;
     NEpersonpay.value := 0;
//     NEtotmm.value     := 0;
//     NErestmm.value    := 0;
     NEexthh.value     := 0;
     NEnighthh.value   := 0;
     NEholihh.value    := 0;
//     NEbaseamt.value   := 0;
     NEextamt.value    := 0;
     NEnightamt.value  := 0;
     NEholiamt.value   := 0;
     NErestamt.value   := 0;
     NEsprestamt.value := 0;
     NEmealhh.value  := 0 ;
     NEexcephh.value := 0 ;
     NEmealamt.value   := 0;
     NEexcepamt.value := 0;
//     NEholiextamt.value := 0;
     NEnopaycnt.value  := 0;
     NEmcardd.value    := 0;
     NEnightmealamt.value := 0;
     NEselfdevamt.value   := 0;
     NEattrfeeamt.value   := 0;
     NEetctaxamt.value    := 0;
     NEcompaysum.value    := 0;
     NEperpaysum.value    := 0;
     NEcomdedsum.value    := 0;
     NEperdedsum.value    := 0;
     NEcomrealpay.value   := 0;
     NEperrealpay.value   := 0;

     Epaygr.text       := '';
     Pfincode.Caption  := '';
     Ppaynum.Caption   := '';
     Ppaycl.Caption    := '';
     Porgnum.Caption   := '';
     Pjobduty.Caption  := '';
     Ptjobduty.Caption := '';
     Etrainyn.text     := '';
end;

// 재계산 Procedure           빠져나갈때.걸림.  gubun : Tag번호.
procedure TFpkw2080a.ReCalc(gubun : integer);
begin
// 일용직은 일단위 계산을 하므로 .....
  //공통.
  NEmonpayamt.value := Ceil(NEbasicamt.Value * ((30 - NEnopaycnt.Value) /30));

  if Pjobduty.Caption = '31' Then  //직무담당이 'TSR'은상여금이 0이다.
  begin
    NEmonbonamt.value := 0;
    NEbonusamt.value  := 0;
    NEmonretamt.value := Ceil((NEmonpayamt.value + NEmonbonamt.value) / 12);
    NEmonindamt.value := Round((NEmonpayamt.value + NEmonbonamt.value + NEmonretamt.value) * (gfIndirectrate/100) /100 ) * 100 ;

  end
  else
  begin
    NEmonbonamt.value := Ceil(NEmonpayamt.value * (gfBonusrate/100) / gfBonusterm);
    searchpaygr('2', MEpaydate.Text, Eempno.Text);
{===========================================================================================
  30.10   2000.08.08   유효성   상여항목 bonusamt 자동계산 주석처리(전화요청) --사용하지 않음
=============================================================================================}
    // NEbonusamt.value := NEmonbonamt.value + Qry_paygr.FieldByName('sum_bon2').AsFloat;
    NEmonretamt.value := Ceil((NEmonpayamt.value + NEmonbonamt.value) / 12);
    NEmonindamt.value := Ceil((NEmonpayamt.value + NEmonbonamt.value + NEmonretamt.value) * (gfIndirectrate/100));
  end;

  // 시간금액계산
  hhExit(self);

  // 총계계산
  amtExit(self);
end;

procedure TFpkw2080a.searchpaygr(gubun, param1, param2: string);
begin
  with Qry_paygr do
  begin
    Close;
    Sql.Clear;

    if gubun = '1' then
    begin
      SQL.Add('SELECT paygr,basicamt,extamt,nightamt '+
              'FROM pkcigtbl where paynum =    '+
              ' (SELECT cpaynum from pkcigbas) '+
              'AND paycl = '''+param1+''' AND paygr = '''+param2+'''');
    end
    else
    begin
      SQL.Add('SELECT SUM(nvl(MONBONAMT,0)) sum_bon2  '+
              'FROM PKHIGPAY                          '+
              'WHERE PAYDATE                          '+
              '       BETWEEN (to_char(to_date(:paydate, ''YYYYMM'') - (:BonusTerm -1), ''YYYYMM'')) '+
              '          AND  (to_char(to_date(:paydate, ''YYYYMM'') - (:BonusTerm -2), ''YYYYMM'')) '+
              '  AND EMPNO = :empno               ');
      ParamByName('paydate').AsString := param1;
      ParamByName('empno').AsString   := param2;
      ParamByName('BonusTerm').AsFloat:= gfBonusTerm;
    end;

    Open;
  end;
end;

// 초기화를 수행
Procedure TFpkw2080a.SetUp;
begin
     L_Date.Panels[0].Text := '   급여시스템에 접속 중입니다...';
     OraConnect;
     Application.ProcessMessages;

     Qry1.Close;
     Qry1.Sql.Clear;
     Qry1.Sql.Add('SELECT TO_CHAR(SYSDATE,''YYYYMMDDHH24MISSD'') D ');
     Qry1.Sql.Add('FROM DUAL ');
     Qry1.Open;
     CurDate := Qry1.FieldByName('D').AsString;
     Qry1.Close;
     L_Date.Panels[1].Text := Copy(CurDate,1,4) + '-' + Copy(CurDate,5,2) + '-' +
                              Copy(CurDate,7,2) + '   ';
     L_Date.Panels[0].Text := PKorName+ '(' + Pempno + ')';

     sqlstr :='select max(paydate)  paydate from pkmigpay ' ;

     Qry1.Close;
     Qry1.Sql.Clear;
     Qry1.Sql.Add(sqlstr);
     Qry1.open;
     MEpaydate.text := Qry1.FieldByName('paydate').AsString;

     Qry1.Close;

     with Qry1 do
     begin
       Close;
       Sql.Clear;
       SQL.Text := 'SELECT * FROM pkcigbas';
       Open;

       gfBonusrate    := FieldByName('Bonusrate').AsFloat;
       gfIndirectrate := FieldByName('Indirectrate').AsFloat;
       gfBonusterm    := FieldByName('Bonusterm').AsFloat;
       gfMcaramt      := FieldByName('Mcaramt').AsFloat;
       gfNightmealamt := FieldByName('Nightmealamt').AsFloat;

       Close;
     end;

     ClearFields;
     L_Date.Panels[0].Text := '   기초설정이 완료되었습니다...';
end;

{==============================================================================
 ===================       Event Handlers      ================================
 ============================================================================== }

procedure TFpkw2080a.BBcloseClick(Sender: TObject);
begin
   Application.Terminate;
end;

procedure TFpkw2080a.FormCreate(Sender: TObject);
begin
     ActiveFlag := True;

//2004.12. dsa2000   Rexec 대체서비스 개발하여 수정작업함.(보안문제로)
     TMaxSession.ServiceTimeOut := 1000;
          
     TMaxSession.Host     := Hinsa_Param(cmdline,10);
     TMaxSession.Connect  := False;     
     TMaxSession.Port     := '9999';

     try
          TMaxSession.Connect := True;
          TMaxSession.TMax_Begin(5000);
     except
          Application.MessageBox(PChar('APP서버 접속 실패'),'에러',mb_ok);
          Application.Terminate;
          Exit;
     end;
end;

procedure TFpkw2080a.EnterEvent(Sender: TObject);
begin
     if sender is TNumberEdit then
        BeforeValue1 := TNumberEdit(sender).value;
     if sender is TEdit then
        BeforeValue2 := TEdit(sender).text;
end;

procedure TFpkw2080a.ExitEvent(Sender: TObject);
begin
     if sender is TNumberEdit then
        IsChange := BeforeValue1 <> TNumberEdit(sender).value
     else if sender is TEdit then
        IsChange := BeforeValue2 <> TEdit(sender).text;

     if IsChange and (sender is TNumberEdit) then
        ReCalc(Tcomponent(sender).tag);
end;

procedure TFpkw2080a.SpeedButton1Click(Sender: TObject);
begin
     calendar := TCalendar.Create(Self);
     Try
        calendar.ShowModal;
        If calendar.DayCaption = '' then exit;
        MEpaydate.Text := calendar.DayCaption;
     Finally
        calendar.Free;
     end;
end;

procedure TFpkw2080a.SBempnoClick(Sender: TObject);
var
   tempno : string;
begin
   try
     Fempno := TFempno.create(self);
     Fempno.paydate := MEpaydate.text;
     Fempno.empno   := Eempno.text;
     Fempno.ShowModal;
     tempno := '';
     if Fempno.pempno <> '' then
        begin
        tempno      := Fempno.pempno;
        Eempno.text := Fempno.pempno;
        P_korname.caption := Fempno.pkorname;
        end;
   finally
     Fempno.Free;
     end;

   if tempno <> '' then
      SearchEmp(MEpaydate.text,tempno);
end;

procedure TFpkw2080a.FormActivate(Sender: TObject);
begin
     if ActiveFlag then
        setup;
     ActiveFlag := False;
     Eempno.SetFocus;
end;

procedure TFpkw2080a.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     if IsChange then
        begin
             workmsg := '작업하신 내용이 저장 되어 있지 않습니다.' + #13 + #13 +
                        '그래도 종료 하시겠습니까?';
             if IDYes = Application.MessageBox(pchar(workmsg),'작업안내',MB_YesNo+MB_ICONWARNING) then
                Action := caFree
             else
                Action := caNone;
        end
     else
        begin
          if IDYes = Application.MessageBox('종료 하시겠습니까?','작업안내',MB_YesNo+MB_ICONWARNING) then
             Action := caFree
          else
             Action := caNone;
        end;
end;

procedure TFpkw2080a.BBsaveClick(Sender: TObject);
begin
     Perform(WM_NEXTDLGCTL,0,0);

     if WorkMode = 0 then
     begin
        workmsg := '저장할 대상자료가 존재하지 않습니다.';
        Application.MessageBox(pchar(workmsg),'[작업안내]',MB_OK+MB_ICONWARNING);
        exit;
     end;

     if IDNo = Application.MessageBox('현재 자료를 저장 하시겠습니까?','작업안내',MB_YesNO+MB_ICONWARNING) then
        exit;

     sqlstr :=  'UPDATE pkmigpay ' + #13 +
        format('SET    orgnum = ''%s'',',[Porgnum.Caption]) + #13 +
        format('      fincode = ''%s'',',[Pfincode.Caption]) + #13 +
        format('       paynum = ''%s'',',[Ppaynum.Caption]) + #13 +
        format('        paycl = ''%s'',',[Ppaycl.Caption]) + #13 +
        format('        paygr = %f,',[strtofloat(Epaygr.text)]) + #13 +
        format('      jobduty = ''%s'',',[Pjobduty.Caption]) + #13 +
        format('      trainyn = ''%s'',',[Etrainyn.text]) + #13 +
        format('     basicamt = %f,',[NEbasicamt.value]) + #13 +
        format('    monpayamt = %f,',[NEmonpayamt.value]) + #13 +
        format('    monbonamt = %f,',[NEmonbonamt.value]) + #13 +
        format('    monretamt = %f,',[NEmonretamt.value]) + #13 +
        format('    monindamt = %f,',[NEmonindamt.value]) + #13 +
        format('   companypay = %f,',[NEcompanypay.value]) + #13 +
        format('     bonusamt = %f,',[NEbonusamt.value]) + #13 +
        format('    personpay = %f,',[NEpersonpay.value]) + #13 +
//        format('        totmm = %f,',[NEtotmm.value]) + #13 +
//        format('       restmm = %f,',[NErestmm.value]) + #13 +
        format('        exthh = %f,',[NEexthh.value]) + #13 +
        format('      nighthh = %f,',[NEnighthh.value]) + #13 +
        format('       holihh = %f,',[NEholihh.value]) + #13 +
//        format('      baseamt = %f,',[NEbaseamt.value]) + #13 +  기본 근로 시간
        format('       extamt = %f,',[NEextamt.value]) + #13 +
        format('     nightamt = %f,',[NEnightamt.value]) + #13 +
        format('      holiamt = %f,',[NEholiamt.value]) + #13 +
{===============================================================================
  30.20   2001.01.08   유효성   초과근무 제외시간 추가(restamt, sprestamt)
================================================================================}
        format('      restamt = %f,',[NErestamt.value]) + #13 +
        format('      sprestamt = %f,',[NEsprestamt.value]) + #13 +
{===============================================================================
  30.30   2001.08.30   유효성   제외식사수당/제외9이상수당 추가(mealamt, excepamt)
================================================================================}
        format('      mealhh = %f,',[NEmealhh.value]) + #13 +
        format('      excephh = %f,',[NEexcephh.value]) + #13 +
        format('      mealamt = %f,',[NEmealamt.value]) + #13 +
        format('      excepamt = %f,',[NEexcepamt.value]) + #13 +
//        format('   holiextamt = %f,',[NEholiextamt.value]) + #13 +
        format('     nopaycnt = %f,',[NEnopaycnt.value]) + #13 +
        format('       mcardd = %f,',[NEmcardd.value]) + #13 +
        format('  nightmealdd = %f,',[NEnightmealdd.value]) + #13 +
        format('     mcaramt  = %f,',[NEmcaramt.value]) + #13 +
        format(' nightmealamt = %f,',[NEnightmealamt.value]) + #13 +
        format('   selfdevamt = %f,',[NEselfdevamt.value]) + #13 +
        format('   attrfeeamt = %f,',[NEattrfeeamt.value]) + #13 +
        format('    etctaxamt = %f,',[NEetctaxamt.value]) + #13 +
        format('    compaysum = %f,',[NEcompaysum.value]) + #13 +
        format('    perpaysum = %f,',[NEperpaysum.value]) + #13 +
        format('    comdedsum = %f,',[NEcomdedsum.value]) + #13 +
        format('    perdedsum = %f,',[NEperdedsum.value]) + #13 +
        format('   comrealpay = %f,',[NEcomrealpay.value]) + #13 +
        format('   perrealpay = %f,',[NEperrealpay.value]) + #13 +

        format('       writeman = ''%s'',',[Pempno]) + #13 +
               '       writetime = to_char(sysdate,''yyyymmddhh24miss'')' + #13 +
        format('where  paydate = ''%s'' and empno = ''%s''',[MEpaydate.text,Eempno.text]);

        Qry1.Close;
        Qry1.Sql.Clear;
        Qry1.Sql.Add(sqlstr);
        Qry1.ExecSql;
        Qry1.Close;

        L_Date.Panels[0].Text := '   작업하신 내용이 저장되었습니다...';
        IsChange := False;
end;

procedure TFpkw2080a.KeyClick(Sender: TObject);
begin
     L_Date.Panels[0].Text   := '   조회할 사람의 사번이나 성명을 입력하세요...';
     Eempno.text      := '';
     P_korname.caption := '';
     ClearFields;
end;

procedure TFpkw2080a.KeyDownEvent(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if key = VK_RETURN then
         SearchEmp(MEpaydate.text,Eempno.text)
end;

procedure TFpkw2080a.BBcancelClick(Sender: TObject);
begin
  SearchEmp(MEpaydate.Text,Eempno.Text);
end;

procedure TFpkw2080a.SpeedButton2Click(Sender: TObject);
begin
{     Fkycode1 := TFkycode1.Create(Self);
     Try
        Fkycode1.FormData := '[일반직 담당직무 조회]';
        Fkycode1.Dataval1 := 'I702';
        EnterEvent(Pjobduty);
        Fkycode1.ShowModal;
        If Fkycode1.CloseChk <> -1 then
           Pjobduty.Caption := Fkycode1.Code;
        ExitEvent(Pjobduty);
     Finally
        Fkycode1.Free;
     end;
}     
end;

procedure TFpkw2080a.EtjobdutyChange(Sender: TObject);
begin
//   Ptjobduty.caption := Gettjobduty(Pjobduty.Caption);
end;

procedure TFpkw2080a.PeJeonOutLookBtn1Click(Sender: TObject);
var
   LJobMsg : string;
   Rundate,  ProgId, CmdStr   : String;  //서비스 개발...
begin
     //pkw2070g 급여지급월,사번from,사번to,작업자사번,호봉갱신여부(Y),DBuserID
     L_Date.Panels[0].Text := '작업중입니다.';
     Application.Processmessages;
   try
//2003.09.17. 강륜종(Dsa2000)  소켓 컴포넌트 바뀌면서 소스 수정.
{     Rexec.Host      := passemp(cmdline,10);
     Rexec.Username  := passemp(cmdline,11);
     Rexec.Password  := passemp(cmdline,12);  }
{     LJobMsg := Rexec.Execute( '~/bin/Kbin/pkw2070g ' + MEpaydate.Text + ' ' + Eempno.Text + ' '
                             +  Eempno.Text + ' ' + Empno + ' ' + 'N' + ' '  +  UserID );
     Display_Msg2(LJobMsg);  }

   //dsa2000  2004.12. Rexec 대체서비스 개발하여 수정작업함.(보안문제로)
   Memo1.Clear;
   Memo1.Lines.Add('실행중...');

   FM_Tmax           := TFM_Tmax.Create(Self);
   FM_Tmax.T_Session := TMaxSession;
   Rundate           := Copy(FM_Tmax.GetData('sysdate','',''),1,14);

   ProgId  := 'pkw2070g';
   CmdStr  := '/hper/insa/HINSA/proc/bin/Kbin/pkw2070g'+' '+MEPayDate.Text+' '
             +Eempno.text+' '+Eempno.text+' '+'N'+' '+PEmpno+' '+ProgId+' '+Rundate;

   with TDS_batch do
     begin
       Close;
       ServiceName := 'HINSA_batch';
       ClearFieldInfo;
       ClearParamInfo;
       AddParam('cmdstr', 300, CmdStr);
       Execute;

       Close;
       ServiceName := 'SHR0SSEL';
       ClearFieldInfo;
       ClearParamInfo;
       AddField('RESULT', ftString, 5000);
       Sql.Text := Format('SELECT RESULT FROM PYBATLOG '+
                          ' WHERE RUNDATE = ''%s''     '+
                          '   AND PROGID  = ''%s''     '+
                          ' ORDER BY SEQNO             ',[Rundate, ProgId ]);
       Open;

       Memo1.Clear;
       while not Eof do
         begin
           Memo1.Lines.Add(FieldByName('RESULT').AsString);
           Next;
         end;
     end;
//============================================================================//
     if Pos('OK',Memo1.Text) > 0 then
        L_Date.Panels[0].Text := LJobMsg
     else
        L_Date.Panels[0].Text := LJobMsg;

     SearchEmp(MEpaydate.Text,Eempno.Text);  //계산된 금액 다시 view;
     L_Date.Panels[0].Text := '   계산을 완료 했습니다.';
     System.Exit;
   except
     L_Date.Panels[0].Text := '   계산에 실패하였습니다. 다시한번 확인을 해주십시요.';
   end;
end;

procedure TFpkw2080a.SpeedButton3Click(Sender: TObject);
begin
     Fkycode1 := TFkycode1.Create(Self);
     Try
        Fkycode1.FormData := '[호봉 조회]';
        Fkycode1.Dataval1 := 'IPAY';
        EnterEvent(Epaygr);
        Fkycode1.ShowModal;
        If Fkycode1.CloseChk <> -1 then
        begin
           Epaygr.Text := Trim(Fkycode1.Code);
           if Etrainyn.ItemIndex = 0 then  //수습..
             NEbasicamt.Value := (StrToFloat(Trim(Fkycode1.CodeName))) * 0.8
           else
             NEbasicamt.Text := Trim(Fkycode1.CodeName);
        end;
        ExitEvent(Epaygr);
     Finally
        Fkycode1.Free;
     end;
end;

procedure TFpkw2080a.PeJeonOutLookBtn1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  L_Date.Panels[0].Text := '계산 버튼을 누르시면 현 호봉에따라 모든값이 재계산됩니다.';
end;

procedure TFpkw2080a.PeJeonGrdPanel2MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  L_Date.Panels[0].Text := '';
end;

procedure TFpkw2080a.amtExit(Sender: TObject);
begin
  NEcompanypay.value   := NEmonpayamt.value + NEmonbonamt.value + NEmonretamt.value + NEmonindamt.value;
  //월용역비   = 월급여 + 월상여 + 월퇴충 + 간접비 ;
  NEpersonpay.value      := NEmonpayamt.value + NEbonusamt.value;
  //직접급여 = 월급여 + 상여 ;

  NEcompaysum.value    := NEcompanypay.value + NEmcaramt.value + NEnightmealamt.value + NEselfdevamt.value + NEattrfeeamt.value + NEetctaxamt.value + NEextamt.Value + NEnightamt.Value + NEholiamt.Value
                          - NErestamt.value - NEsprestamt.value
                          - NEmealamt.value - NEexcepamt.value ;
   //용역비 총계 = 월용역비 + 중식비 + 야근식대 + 자기계발비 + 유치수수료 + 기타과세(특이지급) + (연장+야간+휴일);
  NEperpaysum.value    := NEpersonpay.value + NEmcaramt.value + NEnightmealamt.value + NEselfdevamt.value + NEattrfeeamt.value + NEetctaxamt.value + NEextamt.Value + NEnightamt.Value + NEholiamt.Value
                          - NErestamt.value - NEsprestamt.value
                          - NEmealamt.value - NEexcepamt.value  ;
   //직접급여총계 = 직접급여 + 중식비 + 야근식대 + 자기계발비 + 유치수수료 + 기타과세(특이지급) + (연장+야간+휴일);
  NEcomrealpay.value   := NEcompaysum.value - NEcomdedsum.value;
   //실지급 용역비 = 용역비 총계 - 용역공제계
  NEperrealpay.Value   := NEperpaysum.value - NEperdedsum.value;
   //실지급 직접비 = 직접급여총계 - 직접공제계
end;

procedure TFpkw2080a.hhExit(Sender: TObject);
begin
  searchpaygr('1', Ppaycl.Caption, Epaygr.Text);

  NEextamt.Value       := NEexthh.Value * Qry_paygr.FieldByName('extamt').Value;
  NEnightamt.Value     := NEnighthh.Value * Qry_paygr.FieldByName('nightamt').Value;
  NEholiamt.Value      := NEholihh.Value * Qry_paygr.FieldByName('extamt').Value;
  NEmealamt.Value      := NEmealhh.Value * Qry_paygr.FieldByName('extamt').Value;
  NEexcepamt.Value     := NEexcephh.Value * Qry_paygr.FieldByName('extamt').Value;
   //연장,심야,휴일.

  NEmcaramt.Value      := NEmcardd.Value * gfMcaramt;
  NEnightmealamt.Value := NEnightmealdd.Value * gfNightmealamt;
   //중식비, 야근식대.

  amtExit(SELF);
end;

end.
