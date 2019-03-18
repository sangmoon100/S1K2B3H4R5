unit pkw20301;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, numedit, Grids, DBGrids, ExtCtrls, Db, DBTables, pass, KyLib1,
  MemDS, DBAccess, Ora, Func;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Lcurrow: TLabel;
    Bevel1: TBevel;
    DBGpicducod: TDBGrid;
    Panel2: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Edukind: TEdit;
    Eduname: TEdit;
    Edufldnm: TEdit;
    CBmaxkind: TComboBox;
    NEmaxcnt1: TNumberEdit;
    NEmaxcnt2: TNumberEdit;
    Panel10: TPanel;
    CByemonyn: TComboBox;
    Panel13: TPanel;
    CBetcyn1: TComboBox;
    Panel14: TPanel;
    CBpayyn: TComboBox;
    Panel15: TPanel;
    Edukindf: TEdit;
    Edukindnf: TEdit;
    Panel3: TPanel;
    BBrun: TBitBtn;
    BBhelp: TBitBtn;
    BBclose: TBitBtn;
    BBinsert: TBitBtn;
    BBdelete: TBitBtn;
    BBcancel: TBitBtn;
    Phelpmsg: TPanel;
    Panel19: TPanel;
    Lempinfo: TLabel;
    Lsysdate: TLabel;
    Panel9: TPanel;
    DataSource1: TDataSource;
    Panel11: TPanel;
    CBmcaryn: TComboBox;
    Panel12: TPanel;
    CBnightmealyn: TComboBox;
    Qpicducod: TOraQuery;
    QpicducodDUKIND: TStringField;
    QpicducodDUNAME: TStringField;
    QpicducodDUFLDNM: TStringField;
    QpicducodMAXKIND: TStringField;
    QpicducodMAXCNT1: TIntegerField;
    QpicducodMAXCNT2: TIntegerField;
    QpicducodYEMONYN: TStringField;
    QpicducodMCARYN: TStringField;
    QpicducodPAYYN: TStringField;
    QpicducodNIGHTMEALYN: TStringField;
    QpicducodETCYN1: TStringField;
    QpicducodETCYN2: TStringField;
    QpicducodWRITETIME: TStringField;
    QpicducodA: TFloatField;
    Qwork: TOraQuery;
    Qcomm: TOraQuery;
    procedure EdukindfEnter(Sender: TObject);
    procedure EdukindfKeyPress(Sender: TObject; var Key: Char);
    procedure EdukindnfEnter(Sender: TObject);
    procedure EdukindnfKeyPress(Sender: TObject; var Key: Char);
    procedure EdukindKeyPress(Sender: TObject; var Key: Char);
    procedure CBmaxkindChange(Sender: TObject);
    procedure CBmaxkindDblClick(Sender: TObject);
    procedure BBinsertClick(Sender: TObject);
    procedure BBdeleteClick(Sender: TObject);
    procedure BBrunClick(Sender: TObject);
    procedure BBcancelClick(Sender: TObject);
    procedure BBcloseClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    Procedure DataAllClear;   // 화면클리어
    Procedure Retrieve;
    procedure DataSource1DataChange(Sender: TObject; Field: TField);       // 조회

  private
    { Private declarations }
    SDFM : string;                                      // System Date Format Mask
    LSsysdate : String[15];   // system date

    LIbutnstate : Integer;    // 0:Update, 1:Insert
    LSdukind  : String[2];
    LSduname  : String[12];
    LSdufldnm : String[12];
    LSmaxkind : String[1];
    LRmaxcnt1 : Real;
    LRmaxcnt2 : Real;
    LSyemonyn : String[1];
    LSmcaryn  : String[1];
    LSnightmealyn : String[1];
    LSpayyn  : String[1];
    LSetcyn1 : String[1];

    Function DuplicateCheck : integer;                      // 중복검사
    Function FieldCheck( table,column : string ) : integer; // Field Name 입력오류검사
    procedure SetNow;                                   // 현재시간설정 GSsysdate
    Function Check_Valid : Boolean;

  public
    { Public declarations }
    GSsysdate : String[15];    //Host Date
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}
//------------------------------ User Function ---------------------------------
// 중복오류검사
Function TForm1.DuplicateCheck : integer;
begin
     Qcomm.Close;
     Qcomm.SQL.Clear;
     Qcomm.SQL.ADD('SELECT DUKIND ');
     Qcomm.SQL.ADD('  FROM PKCIGDUCOD ');
     Qcomm.SQL.ADD(' WHERE (DUKIND = :dukind) ');
     Qcomm.ParamByName('dukind').AsString := Edukind.Text;
     Qcomm.Open;
     If Qcomm.RecordCount > 0 then DuplicateCheck := -1 else DuplicateCheck := 0;
end;
// Field Name 입력오류검사
Function TForm1.FieldCheck( table,column : string ) : integer;
begin
     Qcomm.Close;
     Qcomm.SQL.Clear;
     Qcomm.SQL.ADD('SELECT COLUMN_NAME ');
     Qcomm.SQL.ADD('  FROM ALL_TAB_COLUMNS ');
     Qcomm.SQL.ADD(' WHERE TABLE_NAME = '''+UpperCase(Trim(table))+''' ');
     Qcomm.SQL.ADD('   AND COLUMN_NAME = '''+UpperCase(Trim(column))+''' ');
     Qcomm.Open;
     If Qcomm.RecordCount < 1 then FieldCheck := -1 else FieldCheck := 0;
end;

Function TForm1.Check_Valid : Boolean;
begin
     if CBmaxkind.text = '' then
     begin
       Application.MessageBox('제한기준을 정확히 입력하세요','작업안내', MB_OK);
       result := False ;
       exit;
     end;

      if NEmaxcnt1.text = '' then
     begin
       Application.MessageBox('제한횟수를 정확히 입력하세요','작업안내', MB_OK);
       result := False ;
       exit;
     end;

    if CBmcaryn.text = '' then
     begin
       Application.MessageBox('중식비 공제 여부를 정확히 입력하세요','작업안내', MB_OK);
       result := False ;
       exit;
     end;

     if CBpayyn.text = '' then
     begin
       Application.MessageBox('급여 공제 여부를 정확히 입력하세요','작업안내', MB_OK);
       result := False ;
       exit;
     end;

     if CBnightmealyn.text = '' then
     begin
       Application.MessageBox('야근식대 여부를 정확히 입력하세요','작업안내', MB_OK);
       result := False ;
       exit;
     end;

      if CByemonyn.text = '' then
     begin
       Application.MessageBox('월차공제 여부를 정확히 입력하세요','작업안내', MB_OK);
       result := False ;
       exit;
     end;

   result := True;
end;


//------------------------------ User Procedure --------------------------------
// 현재시간설정 GSsysdate
procedure TForm1.SetNow;
begin
     Qcomm.Close;
     Qcomm.SQL.Clear;
     Qcomm.SQL.ADD(' SELECT TO_CHAR(SYSDATE,''YYYYMMDDHH24MISSD'') D ');
     Qcomm.SQL.ADD('   FROM DUAL ');
     Qcomm.Open;
     GSsysdate := Qcomm.FieldByName('D').AsString;
end;
// 화면클리어
procedure TForm1.DataAllClear;
begin
     Edukind.Text    := '';
     Eduname.Text    := '';
     Edufldnm.Text   := '';
     NEmaxcnt1.Value := 0;
     NEmaxcnt2.Value := 0;
     CBmaxkind.Text  := '';
     CByemonyn.Text  := '';
     CBpayyn.Text    := '';
     CBetcyn1.Text   := '';
     end;
// 조회
procedure TForm1.Retrieve;
begin
     Qpicducod.Close;
     Qpicducod.SQL.Clear;
     Qpicducod.SQL.ADD(' SELECT dukind, duname, dufldnm,maxkind,maxcnt1,maxcnt2, ');
     Qpicducod.SQL.ADD('        yemonyn, mcaryn, payyn,nightmealyn,etcyn1, etcyn2, writetime, rownum a ');
     Qpicducod.SQL.ADD('   FROM PKCIGDUCOD ');
     Qpicducod.SQL.ADD('  ORDER BY DUKIND ');

     Qpicducod.Open;
     Edukind.Enabled := False;
     LIbutnstate := 0;
     Phelpmsg.Caption := ' 자료조회가 완료되었습니다.';
     SendMessage(Phelpmsg.handle,WM_PAINT,0,0);

end;


procedure TForm1.EdukindfEnter(Sender: TObject);
begin
    PhelpMsg.Caption := ' 찾을코드의 코드를 모두 입력한후 Enter Key 를 누르세요.....';
end;

procedure TForm1.EdukindfKeyPress(Sender: TObject; var Key: Char);
begin
    If key = #13 then begin
        key := #0;
        If Qpicducod.Locate('DUKIND',Edukindf.Text,[loPartialKey]) then begin
           DBGpicducod.SetFocus;
           Edukindf.Text := '';
           Edukindnf.Text := '';
           PhelpMsg.Caption := ' 해당코드가 조회되었습니다..';
        end else begin
           PhelpMsg.Caption := ' 해당코드가 존재하지 않습니다..';
        end;
     end;
end;

procedure TForm1.EdukindnfEnter(Sender: TObject);
begin
  If LIbutnstate = 1 then begin
      PhelpMsg.Caption := ' 입력상태에서는 코드[명]찾기를 할 수 없습니다....';
      exit;
    end;
    PhelpMsg.Caption := ' 찾을코드의 명을 입력한후 Enter Key 를 누르세요.....';

end;

procedure TForm1.EdukindnfKeyPress(Sender: TObject; var Key: Char);
begin
    If key = #13 then begin
        key := #0;
        if Edukindnf.Text = '' then exit;
        If LIbutnstate = 1 then begin
          PhelpMsg.Caption := ' 입력상태에서는 코드[명]찾기를 할 수 없습니다....';
          exit;
        end;
        Qpicducod.First;
        While not Qpicducod.Eof do begin
          If Copy(Edukindnf.Text,1,Length(Edukindnf.Text))
             = Copy(QpicducodDUNAME.AsString,1,Length(Edukindnf.Text)) then begin
           PhelpMsg.Caption := ' 찾는코드 '+QpicducodDUNAME.AsString+'['+QpicducodDUKIND.AsString+'] 이(가) 조회되었습니다.';
           DBGpicducod.SetFocus;
           If IDNO = Application.MessageBox('다음코드를 계속 검색하시습니까?',
                                            '작업안내', MB_YesNo) then begin
              Edukindf.Text := '';
              Edukindnf.Text := '';
              Exit;
           end;
          end;
          Qpicducod.Next;
        end;
        PhelpMsg.Caption := ' 찾는코드가 존재하지 않습니다..';
     end;
end;

procedure TForm1.EdukindKeyPress(Sender: TObject; var Key: Char);
begin
  If key = #13 then begin
        key := #0;
        If Length(Edukind.Text) < 1 then begin
           MessageBox(handle,'근태구분코드를 정확히 입력하세요....','근태구분코드입력오류',MB_ICONWARNING);
           Edukind.SetFocus;
           Exit;
        end;
        If DuplicateCheck = -1 then begin;
           MessageBox(handle,'이미 등록되어 있는 근태코드 입니다. 확인하고 다시 입력하십시오!',
                             '근태구분코드입력오류',MB_ICONWARNING);
           Edukind.SetFocus;
           Exit;
        end;
        Eduname.SetFocus;
     end;

end;

procedure TForm1.CBmaxkindChange(Sender: TObject);
begin
     If (CBmaxkind.Text = 'M') or (CBmaxkind.Text = 'Y') or
        (CBmaxkind.Text = 'm') or (CBmaxkind.Text = 'y') then begin
         CBmaxkind.Text := UpperCase(CBmaxkind.Text);
     end else begin
         CBmaxkind.Text := '';
         CBmaxkind.Setfocus;
     end;

end;

procedure TForm1.CBmaxkindDblClick(Sender: TObject);
begin
     If CBmaxkind.Text = 'M' then CBmaxkind.Text :=  'Y'
     else if CBmaxkind.Text = 'Y' then CBmaxkind.Text :=  'M'
     else CBmaxkind.Text :=  'M';

end;

procedure TForm1.BBinsertClick(Sender: TObject);
begin
    LIbutnstate := 1 ; // Insert
     Edukind.Enabled := True;
     Edukind.SetFocus;
     DataAllClear;

     Phelpmsg.Caption := ' 근태구분코드(필수),구분명,통계필드명,제한기준,제한횟수(1,2),공제여부 를 입력후 저장하세요!.';

end;

procedure TForm1.BBdeleteClick(Sender: TObject);
begin
   If LIbutnstate = 0 then begin // Update
        If IDNO = Application.MessageBox('자료를 삭제하시겠습니까?',
                                         '작업안내', MB_YesNo) then Exit;
           Qwork.Close;
           Qwork.SQL.Clear;
           Qwork.SQL.ADD('DELETE FROM PKCIGDUCOD ');
           Qwork.SQL.ADD(' WHERE (DUKIND = :dukind) ');
           Qwork.ParamByName('dukind').AsString := Edukind.Text;
           Qwork.ExecSQL;
           Retrieve;
           Phelpmsg.Caption := ' 자료삭제가 완료되었습니다....';
     end;

end;

procedure TForm1.BBrunClick(Sender: TObject);
var LOdukind : string;
begin

     If LIbutnstate = 0 then begin // Update
        If IDNO = Application.MessageBox('저장 하시겠습니까?',
                                         '저장작업안내', MB_YesNo) then Exit;

        if Length(eduname.text) < 2 then begin
           MessageBox(handle,'근태구분명을 정확히 입력하세요....','근태구분명입력오류',MB_ICONWARNING) ;
           exit;
        end;

//        If FieldCheck('pkhigdusum',Edufldnm.Text) = -1 then begin
//           MessageBox(handle,'근태통계필드명이 근태집계화일에 없습니다....','근태통계필드명입력오류',MB_ICONWARNING);
//           Edufldnm.SetFocus;
//           Exit;
//        end;

  if Check_valid then
  begin
        LOdukind := Edukind.Text;
        Qwork.Close;
        Qwork.SQL.Clear;
        Qwork.SQL.ADD('UPDATE PKCIGDUCOD ');
        Qwork.SQL.ADD('   SET DUKIND = '''+Edukind.Text+''', DUNAME = '''+Eduname.Text+''', ');
        Qwork.SQL.ADD('       DUFLDNM = '''+Edufldnm.Text+''',MAXKIND = '''+CBmaxkind.Text+''', ');
        Qwork.SQL.ADD('       MAXCNT1 = '''+FloatToStr(NEmaxcnt1.Value)+''', ');
        Qwork.SQL.ADD('       MAXCNT2 = '''+FloatToStr(NEmaxcnt2.Value)+''', ');
        Qwork.SQL.ADD('       YEMONYN = '''+CByemonyn.Text+''', ');
        Qwork.SQL.ADD('       MCARYN = '''+CBmcaryn.Text+''', ');
        Qwork.SQL.ADD('       NIGHTMEALYN = '''+CBnightmealyn.Text+''', ');
        Qwork.SQL.ADD('       PAYYN = '''+CBpayyn.Text+''',ETCYN1 = '''+CBetcyn1.Text+''', ');
        Qwork.SQL.ADD('       WRITETIME = '''+LSsysdate+''', WRITEMAN = '''+Pempno+''' ');
        Qwork.SQL.ADD(' WHERE (DUKIND = '''+Edukind.Text+''') ');
        Qwork.ExecSQL;

        Retrieve;
        Phelpmsg.Caption := ' 저장이완료되었습니다.';
        SendMessage(Phelpmsg.handle,WM_PAINT,0,0);
        Qpicducod.Locate('DUKIND',LOdukind,[loPartialKey]);
        DBGpicducod.SetFocus;
     end;

  end;

     If LIbutnstate = 1 then begin // Insert
        If IDNO = Application.MessageBox('신규등록 하시겠습니까?',
                                         '신규등록작업안내', MB_YesNo) then begin
                                         BBcancelClick(Form1);
                                         Exit;
        end;
        If Length(Edukind.Text) < 1 then begin
           MessageBox(handle,'근태구분코드를 정확히 입력하세요....','근태구분코드입력오류',MB_ICONWARNING);
           Edukind.SetFocus;
           Exit;
        end;

        If DuplicateCheck = -1 then begin;
           MessageBox(handle,'이미 등록되어 있는 근태코드 입니다. 확인하고 다시 입력하십시오!',
                             '근태구분코드입력오류',MB_ICONWARNING);
           Edukind.SetFocus;
           Exit;
        end;

        if Length(eduname.text) < 2 then begin
           MessageBox(handle,'근태구분명을 정확히 입력하세요....','근태구분명입력오류',MB_ICONWARNING) ;
           exit;
        end;

    //parksh 20030303 막음     If FieldCheck('pkhigdusum',Edufldnm.Text) = -1 then begin
    //       MessageBox(handle,'근태통계필드명이 근태집계화일에 없습니다....','근태통계필드명입력오류',MB_ICONWARNING);
    //       Edufldnm.SetFocus;
     //      Exit;
     //   end;

  if check_valid then
  begin
        Qwork.Close;
        Qwork.SQL.Clear;
        Qwork.SQL.ADD('INSERT INTO PKCIGDUCOD ');
        Qwork.SQL.ADD('       ( DUKIND, DUNAME, DUFLDNM, ');
        Qwork.SQL.ADD('         MAXKIND, MAXCNT1, MAXCNT2, ');
        Qwork.SQL.ADD('         YEMONYN, MCARYN, PAYYN, ');
        Qwork.SQL.ADD('         ETCYN1, NIGHTMEALYN ,   ');
        Qwork.SQL.ADD('         WRITETIME, WRITEMAN ) ');
        Qwork.SQL.ADD('VALUES ( '''+Edukind.Text+''', '''+Eduname.Text+''', ');
        Qwork.SQL.ADD('         '''+Edufldnm.Text+''', '''+CBmaxkind.Text+''', ');
        Qwork.SQL.ADD('         '''+FloatToStr(NEmaxcnt1.Value)+''', ');
        Qwork.SQL.ADD('         '''+FloatToStr(NEmaxcnt2.Value)+''', ');
        Qwork.SQL.ADD('         '''+CByemonyn.Text+''','''+CBmcaryn.Text+''', ');
        Qwork.SQL.ADD('         '''+CBpayyn.Text+''', '''+CBetcyn1.Text+''', '''+CBnightmealyn.Text+''',');
        Qwork.SQL.ADD('         '''+LSsysdate+''', '''+Pempno+'''  ) ');
        Qwork.ExecSQL;

        Retrieve;
        Phelpmsg.Caption := ' 신규저장이완료되었습니다.';
        SendMessage(Phelpmsg.handle,WM_PAINT,0,0);
        Qpicducod.Locate('DUKIND',LOdukind,[loPartialKey]);
        DBGpicducod.SetFocus;
  end;
  end;

end;

procedure TForm1.BBcancelClick(Sender: TObject);
begin
  If IDNO = Application.MessageBox('작업을 취소하시겠습니까?',
                                      '작업안내', MB_YesNo) then  Exit;
     If LIbutnstate = 1 then begin // Insert
        LIbutnstate := 0;
        DataAllClear;
        Retrieve;
        Phelpmsg.Caption := ' 입력작업이 취소되었습니다...';
        Exit;
     end;
     If LIbutnstate = 0 then begin // Updated
        Edukind.Text   := LSdukind;
        Eduname.Text   := LSduname;
        Edufldnm.Text  := LSdufldnm;
        CBmaxkind.Text := LSmaxkind;
        NEmaxcnt1.Value := LRmaxcnt1;
        NEmaxcnt2.Value := LRmaxcnt2;
        CByemonyn.Text  := LSyemonyn;
        CBmcaryn.Text  := LSmcaryn;
        CBnightmealyn.Text  := LSnightmealyn;
        CBpayyn.Text := LSpayyn;
        CBetcyn1.Text := LSetcyn1;
//        CBetcyn2.Text := LSetcyn2;
        Phelpmsg.Caption := ' 조회(수정)작업이 취소되었습니다...';
     end;
     DBGpicducod.SetFocus;

end;

procedure TForm1.BBcloseClick(Sender: TObject);
begin
 close;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
     PhelpMsg.Caption := ' 작업자,작업일설정 및 기초자료를 조회하고 있습니다...';
     OraConnect;
     Application.ProcessMessages;

     LSsysdate := GSsysdate;
     Lsysdate.Caption := fn_GetDateStr;
     Lempinfo.Caption := Pkorname + '(' + Pempno + ')';
     Retrieve;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  If IDNO = Application.MessageBox('작업을 종료하시겠습니까?',
                                   '작업안내', MB_YesNo) then begin
     Action := caNone;
     exit;
  end;

end;

procedure TForm1.DataSource1DataChange(Sender: TObject; Field: TField);
begin
 If LIbutnstate = 1 then Exit; // Insert
     LSdukind  := Qpicducod.FieldByname('dukind').AsString;
     LSduname  := Qpicducod.FieldByname('duname').AsString;
     LSdufldnm := Qpicducod.FieldByname('dufldnm').AsString;
     LSmaxkind := Qpicducod.FieldByname('maxkind').AsString;
     LRmaxcnt1 := Qpicducod.FieldByname('maxcnt1').AsFloat;
     LRmaxcnt2 := Qpicducod.FieldByname('maxcnt2').AsFloat;
     LSyemonyn := Qpicducod.FieldByname('yemonyn').AsString;
     LSmcaryn := Qpicducod.FieldByname('mcaryn').AsString;
     LSnightmealyn := Qpicducod.FieldByname('nightmealyn').AsString;
     LSpayyn  := Qpicducod.FieldByname('payyn').AsString;
     LSetcyn1 := Qpicducod.FieldByname('etcyn1').AsString;

     Edukind.Text    := Qpicducod.FieldByname('dukind').AsString;
     Eduname.Text    := Qpicducod.FieldByname('duname').AsString;
     Edufldnm.Text   := Qpicducod.FieldByname('dufldnm').AsString;
     CBmaxkind.Text  := Qpicducod.FieldByname('maxkind').AsString;
     NEmaxcnt1.Value := Qpicducod.FieldByname('maxcnt1').AsFloat;
     NEmaxcnt2.Value := Qpicducod.FieldByname('maxcnt2').AsFloat;
     CByemonyn.Text  := Qpicducod.FieldByname('yemonyn').AsString;
     CBmcaryn.Text    := Qpicducod.FieldByname('mcaryn').AsString;
     CBnightmealyn.Text    := Qpicducod.FieldByname('nightmealyn').AsString;
     CBpayyn.Text    := Qpicducod.FieldByname('payyn').AsString;
     CBetcyn1.Text   := Qpicducod.FieldByname('etcyn1').AsString;

     Lcurrow.Caption := '['+FloatToStr(QpicducodA.AsFloat)+' / '+
                            FloatToStr(Qpicducod.RecordCount)+']';
end;

end.
