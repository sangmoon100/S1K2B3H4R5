unit Pka40101;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, DB, DBTables, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids,
  Mask, numedit, Func, DBAccess, Ora, MemDS;

type
  TFpka40101 = class(TForm)
    Phelpmsg: TPanel;
    Panel19: TPanel;
    Lempinfo: TLabel;
    Lsysdate: TLabel;
    Panel1: TPanel;
    Panel3: TPanel;
    BBrun: TBitBtn;
    BBclose: TBitBtn;
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
    BBinsert: TBitBtn;
    BBdelete: TBitBtn;
    BBcancel: TBitBtn;
    NEmaxcnt1: TNumberEdit;
    NEmaxcnt2: TNumberEdit;
    Panel9: TPanel;
    Panel10: TPanel;
    CByemonyn: TComboBox;
    Panel11: TPanel;
    CBmcaryn: TComboBox;
    Panel12: TPanel;
    CBpayyn: TComboBox;
    Panel13: TPanel;
    CBetcyn1: TComboBox;
    Panel14: TPanel;
    CBetcyn2: TComboBox;
    Lcurrow: TLabel;
    Panel15: TPanel;
    Edukindf: TEdit;
    Edukindnf: TEdit;
    Bevel1: TBevel;
    OraQuery1: TOraQuery;
    OraQuery1DUKIND: TStringField;
    OraQuery1DUNAME: TStringField;
    OraQuery1DUFLDNM: TStringField;
    OraQuery1MAXKIND: TStringField;
    OraQuery1MAXCNT1: TIntegerField;
    OraQuery1MAXCNT2: TIntegerField;
    OraQuery1WRITETIME: TStringField;
    OraQuery1WRITEMAN: TStringField;
    OraQuery1YEMONYN: TStringField;
    OraQuery1MCARYN: TStringField;
    OraQuery1PAYYN: TStringField;
    OraQuery1ETCYN1: TStringField;
    OraQuery1ETCYN2: TStringField;
    OraQuery1CONMCARYN: TStringField;
    OraQuery1CNT: TFloatField;
    DataSource1: TDataSource;
    CBadminyn: TComboBox;
    CBcustyn: TComboBox;
    Panel16: TPanel;
    Panel17: TPanel;
    OraQuery1CUSTYN: TStringField;
    OraQuery1ADMINYN: TStringField;
    procedure FormActivate(Sender: TObject);
    procedure BBinsertClick(Sender: TObject);
    procedure BBcancelClick(Sender: TObject);
    procedure BBrunClick(Sender: TObject);
    procedure EdukindKeyPress(Sender: TObject; var Key: Char);
    procedure BBdeleteClick(Sender: TObject);
    procedure BBcloseClick(Sender: TObject);
    Procedure DataAllClear;   // 화면클리어
    Procedure Retrieve;       // 조회
    Procedure CodeTableUI;
    procedure CBmaxkindChange(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure CBmaxkindDblClick(Sender: TObject);
    procedure CByemonynChange(Sender: TObject);
    procedure CByemonynDblClick(Sender: TObject);
    procedure EdukindfKeyPress(Sender: TObject; var Key: Char);
    procedure EdukindnfKeyPress(Sender: TObject; var Key: Char);
    procedure EdukindnfEnter(Sender: TObject);
    procedure EdukindfEnter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
    LIbutnstate : Integer;    // 0:Update, 1:Insert
    function DuplicateCheck : Boolean;                    // 중복검사

  public
    { Public declarations }
  end;

var
  Fpka40101: TFpka40101;

implementation

{$R *.DFM}

procedure TFpka40101.FormActivate(Sender: TObject);
begin
     PhelpMsg.Caption := ' 작업자, 작업일 설정 및 기초자료를 조회하고 있습니다.';

     Application.ProcessMessages;
     OraConnect;
     Lempinfo.Caption := Pkorname + '(' + Pempno + ')' ;
     Lsysdate.caption := fn_GetDateStr;

     Retrieve;
end;


Function TFpka40101.DuplicateCheck : Boolean;
var
     qq : TOraQuery;
begin
     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     Try
          with qq do
          begin
               Close;
               SQL.Clear;
               SQL.Add('select dukind            ');
               SQL.Add('  from pkcducod          ');
               SQL.Add(' where dukind = :dukind  ');
               ParamByName('dukind').AsString := Edukind.Text;
               Open;

               if RecordCount > 0 then Result := False
               else                    Result := True;
          end;
     Finally
          qq.Free;
     end;
end;

// 화면클리어
procedure TFpka40101.DataAllClear;
begin
     Edukind.Text    := '';
     Eduname.Text    := '';
     Edufldnm.Text   := '';
     NEmaxcnt1.Value := 0;
     NEmaxcnt2.Value := 0;
     CBmaxkind.Text  := '';
     CByemonyn.Text  := '';
     CBmcaryn.Text   := '';
     CBpayyn.Text    := '';
     CBetcyn1.Text   := '';
     CBetcyn2.Text   := '';
     CBcustyn.Text   := '';
     CBadminyn.Text  := '';
end;

procedure TFpka40101.Retrieve;
begin
     with OraQuery1 do
     begin
          Close;
          SQL.Clear;
          SQL.Add('select rownum cnt, a.*     ');
          SQL.Add('  from pkcducod a          ');
          SQL.Add(' order by a.dukind         ');

          Open;

          First;
          while not eof do
          begin
               if FieldByName('dukind').AsString = Edukind.Text then break;
               Next;
          end;

          Edukind.Enabled := False;
          LIbutnstate := 0;
          Phelpmsg.Caption := ' 자료조회가 완료되었습니다.';
          SendMessage(Phelpmsg.handle,WM_PAINT,0,0);
     end;
end;

procedure TFpka40101.CodeTableUI;
var
     qq : TOraQuery;
begin
     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     try
          with qq do
          begin //사용자 코드 등록(USEYN 항목 등록 : 2016.09.27 By HeeYong)
               if GetCodeName('Y110', Edukind.Text) = '' then
               begin
                    Close;
                    SQL.Clear;
                    SQL.Add('insert into pyccode (  codeid,      ');
                    SQL.Add('                       codeno,      ');
                    SQL.Add('                       codename,    ');
                    SQL.Add('                       codefname,   ');
                    SQL.Add('                       useyn,       ');
                    SQL.Add('                       writetime,   ');
                    SQL.Add('                       writeemp )   ');
                    SQL.Add('             values ( ''Y110'',     ');
                    SQL.Add('                      :codeno,      ');
                    SQL.Add('                      :codename,    ');
                    SQL.Add('                      :codename,    ');
                    SQL.Add('                      :custyn,      ');
                    SQL.Add('                      :writetime,   ');
                    SQL.Add('                      :writeman  )  ');

                    ParamByName('codeno'   ).AsString := Edukind.Text;
                    ParamByName('codename' ).AsString := Eduname.Text;
                    ParamByName('custyn'   ).AsString := CBcustyn.Text;
                    ParamByName('writetime').AsString := fn_GetDateTimeStr;
                    ParamByName('writeman' ).AsString := Pempno;
                    ExecSql;

                    Phelpmsg.Caption := ' 코드화일 저장이 완료되었습니다.';
                    SendMessage(Phelpmsg.handle,WM_PAINT,0,0);
               end
               else
               begin
                    Close;
                    SQL.Clear;
                    SQL.Add('update pyccode set codeno    = :codeno,    ');
                    SQL.Add('                   codename  = :codename,  ');
                    SQL.Add('                   codefname = :codename,  ');
                    SQL.Add('                   useyn     = :custyn,    ');
                    SQL.Add('                   writetime = :writetime, ');
                    SQL.Add('                   writeemp  = :writeman   ');
                    SQL.Add(' where codeid  = ''Y110''                  ');
                    SQL.Add('   and codeno = :codeno                    ');

                    ParamByName('codeno'   ).AsString := Edukind.Text;
                    ParamByName('codename' ).AsString := Eduname.Text;
                    ParamByName('custyn'   ).AsString := CBcustyn.Text;
                    ParamByName('writetime').AsString := fn_GetDateTimeStr;
                    ParamByName('writeman' ).AsString := Pempno;
                    ExecSql;

                    Phelpmsg.Caption := ' 코드화일 갱신이 완료되었습니다.';
                    SendMessage(Phelpmsg.handle,WM_PAINT,0,0);
               end;
          end;
          with qq do
          begin  //관리자 코드 등록(USEYN 항목 등록 : 2016.09.27 By HeeYong)
               if GetCodeName('Y210', Edukind.Text) = '' then
               begin
                    Close;
                    SQL.Clear;
                    SQL.Add('insert into pyccode (  codeid,      ');
                    SQL.Add('                       codeno,      ');
                    SQL.Add('                       codename,    ');
                    SQL.Add('                       codefname,   ');
                    SQL.Add('                       useyn,       ');
                    SQL.Add('                       writetime,   ');
                    SQL.Add('                       writeemp )   ');
                    SQL.Add('             values ( ''Y210'',     ');
                    SQL.Add('                      :codeno,      ');
                    SQL.Add('                      :codename,    ');
                    SQL.Add('                      :codename,    ');
                    SQL.Add('                      :adminyn,     ');
                    SQL.Add('                      :writetime,   ');
                    SQL.Add('                      :writeman  )  ');

                    ParamByName('codeno'   ).AsString := Edukind.Text;
                    ParamByName('codename' ).AsString := Eduname.Text;
                    ParamByName('adminyn'  ).AsString := CBadminyn.Text;
                    ParamByName('writetime').AsString := fn_GetDateTimeStr;
                    ParamByName('writeman' ).AsString := Pempno;
                    ExecSql;

                    Phelpmsg.Caption := ' 코드화일 저장이 완료되었습니다.';
                    SendMessage(Phelpmsg.handle,WM_PAINT,0,0);
               end
               else
               begin
                    Close;
                    SQL.Clear;
                    SQL.Add('update pyccode set codeno    = :codeno,    ');
                    SQL.Add('                   codename  = :codename,  ');
                    SQL.Add('                   codefname = :codename,  ');
                    SQL.Add('                   useyn     = :adminyn,   ');
                    SQL.Add('                   writetime = :writetime, ');
                    SQL.Add('                   writeemp  = :writeman   ');
                    SQL.Add(' where codeid  = ''Y210''                  ');
                    SQL.Add('   and codeno = :codeno                    ');

                    ParamByName('codeno'   ).AsString := Edukind.Text;
                    ParamByName('codename' ).AsString := Eduname.Text;
                    ParamByName('adminyn'  ).AsString := CBadminyn.Text;
                    ParamByName('writetime').AsString := fn_GetDateTimeStr;
                    ParamByName('writeman' ).AsString := Pempno;
                    ExecSql;

                    Phelpmsg.Caption := ' 코드화일 갱신이 완료되었습니다.';
                    SendMessage(Phelpmsg.handle,WM_PAINT,0,0);
               end;
          end;
     finally
          qq.Free;
     end;
end;

procedure TFpka40101.DataSource1DataChange(Sender: TObject; Field: TField);
begin
     If LIbutnstate = 1 then Exit; // Insert

     with OraQuery1 do
     begin
          Edukind.Text    := FieldByname('dukind'  ).AsString;
          Eduname.Text    := FieldByname('duname'  ).AsString;
          Edufldnm.Text   := FieldByname('dufldnm' ).AsString;
          CBmaxkind.Text  := FieldByname('maxkind' ).AsString;
          NEmaxcnt1.Value := FieldByname('maxcnt1' ).AsInteger;
          NEmaxcnt2.Value := FieldByname('maxcnt2' ).AsInteger;
          CByemonyn.Text  := FieldByname('yemonyn' ).AsString;
          CBmcaryn.Text   := FieldByname('mcaryn'  ).AsString;
          CBpayyn.Text    := FieldByname('payyn'   ).AsString;
          CBetcyn1.Text   := FieldByname('etcyn1'  ).AsString;
          CBetcyn2.Text   := FieldByname('etcyn2'  ).AsString;
          CBcustyn.Text   := FieldByname('custyn'  ).AsString;
          CBadminyn.Text  := FieldByname('adminyn' ).AsString;
          Lcurrow.Caption := '[' + IntToStr(FieldByname('cnt').AsInteger) + ' / ' + IntToStr(RecordCount) + ']';
     end;
end;

procedure TFpka40101.BBinsertClick(Sender: TObject);
begin
     LIbutnstate := 1 ; // Insert
     Edukind.Enabled := True;
     Edukind.SetFocus;
     DataAllClear;
     Phelpmsg.Caption := ' 근태구분코드(필수),구분명,통계필드명,제한기준,제한횟수(1,2),공제여부 를 입력후 저장하세요!.';
end;

procedure TFpka40101.BBrunClick(Sender: TObject);
var
     qq : TOraQuery;
begin
     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     try
          with qq do
          begin
               if LIbutnstate = 0 then
               begin
                    if IDNO = Application.MessageBox('저장 하시겠습니까?','저장작업안내', MB_YesNo) then Exit;

                    if OraFieldCheck('pkhduty',Edufldnm.Text) = False then
                    begin
                         MessageBox(handle,'근태통계필드명이 근태이력화일에 없습니다....','근태통계필드명입력오류',MB_ICONWARNING);
                         Edufldnm.SetFocus;
                         Exit;
                    end;

                    Close;
                    SQL.Clear;
                    SQL.Add('update pkcducod set duname    = :duname,     ');
                    SQL.Add('                    dufldnm   = :dufldnm,    ');
                    SQL.Add('                    maxkind   = :maxkind,    ');
                    SQL.Add('                    maxcnt1   = :maxcnt1,    ');
                    SQL.Add('                    maxcnt2   = :maxcnt2,    ');
                    SQL.Add('                    yemonyn   = :yemonyn,    ');
                    SQL.Add('                    mcaryn    = :mcaryn,     ');
                    SQL.Add('                    payyn     = :payyn,      ');
                    SQL.Add('                    etcyn1    = :etcyn1,     ');
                    SQL.Add('                    etcyn2    = :etcyn2,     ');
                    SQL.Add('                    custyn    = :custyn,     ');
                    SQL.Add('                    adminyn   = :adminyn,    ');
                    SQL.Add('                    writetime = :writetime,  ');
                    SQL.Add('                    writeman  = :writeman    ');
                    SQL.Add(' where dukind = :dukind                      ');

                    ParamByName('duname'   ).AsString := Eduname.Text;
                    ParamByName('dufldnm'  ).AsString := Edufldnm.Text;
                    ParamByName('maxkind'  ).AsString := CBmaxkind.Text;
                    ParamByName('maxcnt1'  ).AsFloat  := NEmaxcnt1.Value;
                    ParamByName('maxcnt2'  ).AsFloat  := NEmaxcnt2.Value;
                    ParamByName('yemonyn'  ).AsString := CByemonyn.Text;
                    ParamByName('mcaryn'   ).AsString := CBmcaryn.Text;
                    ParamByName('payyn'    ).AsString := CBpayyn.Text;
                    ParamByName('etcyn1'   ).AsString := CBetcyn1.Text;
                    ParamByName('etcyn2'   ).AsString := CBetcyn2.Text;
                    ParamByName('custyn'   ).AsString := CBcustyn.Text;
                    ParamByName('adminyn'  ).AsString := CBadminyn.Text;
                    ParamByName('writetime').AsString := fn_GetDateTimeStr;
                    ParamByName('writeman' ).AsString := Pempno;
                    ParamByName('dukind'   ).AsString := Edukind.Text;
                    ExecSQL;

                    CodeTableUI;
                    Retrieve;
                    Phelpmsg.Caption := ' 수정이완료되었습니다.';
                    SendMessage(Phelpmsg.handle,WM_PAINT,0,0);
                    OraQuery1.Locate('DUKIND',Edukind.Text,[loPartialKey]);
                    DBGpicducod.SetFocus;
               end
               else
               begin
                    if IDNO = Application.MessageBox('신규등록 하시겠습니까?','신규등록작업안내', MB_YesNo) then
                    begin
                         BBcancelClick(nil);
                         Exit;
                    end;

                    if Length(Edukind.Text) < 1 then
                    begin
                         MessageBox(handle,'근태구분코드를 정확히 입력하세요.','근태구분코드입력오류',MB_ICONWARNING);
                         Edukind.SetFocus;
                         Exit;
                    end;

                    if DuplicateCheck = False then
                    begin;
                         MessageBox(handle,'이미 등록되어 있는 근태코드 입니다. 확인하고 다시 입력하십시오!','근태구분코드입력오류',MB_ICONWARNING);
                         Edukind.SetFocus;
                         Exit;
                    end;

                    if OraFieldCheck('pkhduty',Edufldnm.Text) = False then
                    begin
                         MessageBox(handle,'근태통계필드명이 근태이력화일에 없습니다.','근태통계필드명입력오류',MB_ICONWARNING);
                         Edufldnm.SetFocus;
                         Exit;
                    end;


                    SQL.Add('                    custyn    = :custyn,     ');
                    SQL.Add('                    adminyn   = :adminyn,    ');

                    Close;
                    SQL.Clear;
                    SQL.Add('insert into pkcducod ( dukind,    ');
                    SQL.Add('                       duname,    ');
                    SQL.Add('                       dufldnm,   ');
                    SQL.Add('                       maxkind,   ');
                    SQL.Add('                       maxcnt1,   ');
                    SQL.Add('                       maxcnt2,   ');
                    SQL.Add('                       yemonyn,   ');
                    SQL.Add('                       mcaryn,    ');
                    SQL.Add('                       payyn,     ');
                    SQL.Add('                       etcyn1,    ');
                    SQL.Add('                       etcyn2,    ');
                    SQL.Add('                       custyn,    ');
                    SQL.Add('                       adminyn,   ');
                    SQL.Add('                       writetime, ');
                    SQL.Add('                       writeman ) ');
                    SQL.Add('             values ( :dukind,    ');
                    SQL.Add('                      :duname,    ');
                    SQL.Add('                      :dufldnm,   ');
                    SQL.Add('                      :maxkind,   ');
                    SQL.Add('                      :maxcnt1,   ');
                    SQL.Add('                      :maxcnt2,   ');
                    SQL.Add('                      :yemonyn,   ');
                    SQL.Add('                      :mcaryn,    ');
                    SQL.Add('                      :payyn,     ');
                    SQL.Add('                      :etcyn1,    ');
                    SQL.Add('                      :etcyn2,    ');
                    SQL.Add('                      :custyn,    ');
                    SQL.Add('                      :adminyn,   ');
                    SQL.Add('                      :writetime, ');
                    SQL.Add('                      :writeman ) ');

                    ParamByName('dukind'   ).AsString := Edukind.Text;
                    ParamByName('duname'   ).AsString := Eduname.Text;
                    ParamByName('dufldnm'  ).AsString := Edufldnm.Text;
                    ParamByName('maxkind'  ).AsString := CBmaxkind.Text;
                    ParamByName('maxcnt1'  ).AsFloat  := NEmaxcnt1.Value;
                    ParamByName('maxcnt2'  ).AsFloat  := NEmaxcnt2.Value;
                    ParamByName('yemonyn'  ).AsString := CByemonyn.Text;
                    ParamByName('mcaryn'   ).AsString := CBmcaryn.Text;
                    ParamByName('payyn'    ).AsString := CBpayyn.Text;
                    ParamByName('etcyn1'   ).AsString := CBetcyn1.Text;
                    ParamByName('etcyn2'   ).AsString := CBetcyn2.Text;
                    ParamByName('custyn'   ).AsString := CBcustyn.Text;
                    ParamByName('adminyn'  ).AsString := CBadminyn.Text;
                    ParamByName('writetime').AsString := fn_GetDateTimeStr;
                    ParamByName('writeman' ).AsString := Pempno;
                    ExecSQL;

                    CodeTableUI;
                    Retrieve;
                    Phelpmsg.Caption := ' 신규저장이완료되었습니다.';
                    SendMessage(Phelpmsg.handle,WM_PAINT,0,0);
                    OraQuery1.Locate('DUKIND',Edukind.Text,[loPartialKey]);
                    DBGpicducod.SetFocus;
              end;
          end;
     finally
          qq.Free;
     end;
end;

procedure TFpka40101.BBdeleteClick(Sender: TObject);
var
     qq : TOraQuery;
begin
     if LIbutnstate = 0 then
     begin
          if IDNO = Application.MessageBox('자료를 삭제하시겠습니까?','작업안내', MB_YesNo) then Exit;

          qq := TOraQuery.Create(nil);
          qq.Session := Ora_Session;

          try
               with qq do
               begin
                    Close;
                    SQL.Clear;
                    SQL.Add('delete                  ');
                    SQL.Add('  from pkcducod         ');
                    SQL.Add(' where dukind = :dukind ');
                    ParamByName('dukind').AsString := Edukind.Text;
                    ExecSQL;

                    if GetCodeName('Y110', Edukind.Text) <> '' then
                    begin
                         Close;
                         SQL.Clear;
                         SQL.Add('delete from pyccode       ');
                         SQL.Add(' where codeid = ''Y110''  ');
                         SQL.Add('   and codeno = :dukind   ');

                         ParamByName('dukind').AsString := Edukind.Text;
                         ExecSQL;
                    end;

                    Retrieve;
                    Phelpmsg.Caption := ' 자료삭제가 완료되었습니다.';
               end;
          finally
               qq.Free;
          end;
     end;
end;

procedure TFpka40101.BBcancelClick(Sender: TObject);
begin
     if IDNO = Application.MessageBox('작업을 취소하시겠습니까?','작업안내', MB_YesNo) then  Exit;

     if LIbutnstate = 1 then
     begin // Insert
          LIbutnstate := 0;
          DataAllClear;
          Retrieve;
          Phelpmsg.Caption := ' 입력작업이 취소되었습니다.';
          Exit;
     end
     else
     begin
          Edukind.Text     := OraQuery1.FieldByname('dukind' ).AsString;
          Eduname.Text     := OraQuery1.FieldByname('duname' ).AsString;
          Edufldnm.Text    := OraQuery1.FieldByname('dufldnm').AsString;
          CBmaxkind.Text   := OraQuery1.FieldByname('maxkind').AsString;
          NEmaxcnt1.Value  := OraQuery1.FieldByname('maxcnt1').AsInteger;
          NEmaxcnt2.Value  := OraQuery1.FieldByname('maxcnt2').AsInteger;
          CByemonyn.Text   := OraQuery1.FieldByname('yemonyn').AsString;
          CBmcaryn.Text    := OraQuery1.FieldByname('mcaryn' ).AsString;
          CBpayyn.Text     := OraQuery1.FieldByname('payyn'  ).AsString;
          CBetcyn1.Text    := OraQuery1.FieldByname('etcyn1' ).AsString;
          CBetcyn2.Text    := OraQuery1.FieldByname('etcyn2' ).AsString;
          CBcustyn.Text    := OraQuery1.FieldByname('custyn' ).AsString;
          CBadminyn.Text   := OraQuery1.FieldByname('adminyn' ).AsString;
          Phelpmsg.Caption := ' 조회(수정)작업이 취소되었습니다.';
     end;
     DBGpicducod.SetFocus;
end;

// 근태구분코드 키제어
procedure TFpka40101.EdukindKeyPress(Sender: TObject; var Key: Char);
begin
     if key = #13 then
     begin
          key := #0;

          if Length(Edukind.Text) < 1 then
          begin
               MessageBox(handle,'근태구분코드를 정확히 입력하세요.','근태구분코드입력오류',MB_ICONWARNING);
               Edukind.SetFocus;
               Exit;
          end;

          if DuplicateCheck = False then
          begin
               MessageBox(handle,'이미 등록되어 있는 근태코드 입니다. 확인하고 다시 입력하십시오!','근태구분코드입력오류',MB_ICONWARNING);
               Edukind.SetFocus;
               Exit;
          end;
          Eduname.SetFocus;
     end;
end;

// 제한기준입력검사
procedure TFpka40101.CBmaxkindChange(Sender: TObject);
begin
     if (UpperCase(CBmaxkind.Text) = 'M') or (UpperCase(CBmaxkind.Text) = 'Y') then CBmaxkind.Text := UpperCase(CBmaxkind.Text)
     else
     begin
          CBmaxkind.Text := '';
          CBmaxkind.Setfocus;
     end;
end;

procedure TFpka40101.CBmaxkindDblClick(Sender: TObject);
begin
          If CBmaxkind.Text = 'M' then CBmaxkind.Text :=  'Y'
     else if CBmaxkind.Text = 'Y' then CBmaxkind.Text :=  'M'
     else                              CBmaxkind.Text :=  'M';
end;

// 연월차공제여부,식교비공제여부,급여공제여부,기타공제여부1,기타공제여부2
procedure TFpka40101.CByemonynChange(Sender: TObject);
begin
     //TComboBox(Sender).Text := YesNoCombo(TComboBox(Sender).Text);
end;

procedure TFpka40101.CByemonynDblClick(Sender: TObject);
begin
     //TComboBox(Sender).Text := YesNoComboDC(TComboBox(Sender).Text);
end;

// 코드조회
procedure TFpka40101.EdukindfEnter(Sender: TObject);
begin
     PhelpMsg.Caption := ' 찾을코드의 코드를 모두 입력한후 Enter Key 를 누르세요.';
end;

procedure TFpka40101.EdukindfKeyPress(Sender: TObject; var Key: Char);
begin
     if key = #13 then
     begin
          key := #0;

          if OraQuery1.Locate('DUKIND',Edukindf.Text,[loPartialKey]) then
          begin
               DBGpicducod.SetFocus;
               Edukindf.Text := '';
               Edukindnf.Text := '';
               PhelpMsg.Caption := ' 해당코드가 조회되었습니다.';
          end
          else PhelpMsg.Caption := ' 해당코드가 존재하지 않습니다.';
     end;
end;

// 코드명조회
procedure TFpka40101.EdukindnfEnter(Sender: TObject);
begin
     if LIbutnstate = 1 then
     begin
          PhelpMsg.Caption := ' 입력상태에서는 코드[명]찾기를 할 수 없습니다.';
          Exit;
     end;
     PhelpMsg.Caption := ' 찾을코드의 명을 입력한후 Enter Key 를 누르세요.';
end;

procedure TFpka40101.EdukindnfKeyPress(Sender: TObject; var Key: Char);
begin
     if key = #13 then
     begin
          key := #0;
          if Edukindnf.Text = '' then Exit;

          if LIbutnstate = 1 then
          begin
               PhelpMsg.Caption := ' 입력상태에서는 코드[명]찾기를 할 수 없습니다.';
               Exit;
          end;

          with OraQuery1 do
          begin
               First;
               while not eof do
               begin
                    if Copy(Edukindnf.Text,1,Length(Edukindnf.Text)) = Copy(OraQuery1DUNAME.AsString,1,Length(Edukindnf.Text)) then
                    begin
                         PhelpMsg.Caption := ' 찾는코드 '+OraQuery1DUNAME.AsString+'['+OraQuery1DUKIND.AsString+'] 이(가) 조회되었습니다.';
                         DBGpicducod.SetFocus;
                         if IDNO = Application.MessageBox('다음코드를 계속 검색하시습니까?','작업안내', MB_YesNo) then
                         begin
                              Edukindf.Text := '';
                              Edukindnf.Text := '';
                              Exit;
                         end;
                    end;
                    Next;
               end;
          end;
          PhelpMsg.Caption := ' 찾는코드가 존재하지 않습니다.';
     end;
end;

// 종료
procedure TFpka40101.BBcloseClick(Sender: TObject);
begin
     Close;
end;

procedure TFpka40101.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     if IDNO = Application.MessageBox('작업을 종료하시겠습니까?','작업안내', MB_YesNo) then
     begin
          Action := caNone;
          Exit;
     end;
end;

end.
