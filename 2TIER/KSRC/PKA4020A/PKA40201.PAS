unit pka40201;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, DB, DBTables, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids,
  Mask, numedit, calen1, MemDS, DBAccess, Ora;

type
  TFpka40201 = class(TForm)
    Phelpmsg: TPanel;
    Panel19: TPanel;
    Lempinfo: TLabel;
    Lsysdate: TLabel;
    Panel1: TPanel;
    Panel3: TPanel;
    BBrun: TBitBtn;
    BBhelp: TBitBtn;
    BBclose: TBitBtn;
    DBGpicducod: TDBGrid;
    DataSource1: TDataSource;
    Panel2: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    BBinsert: TBitBtn;
    BBdelete: TBitBtn;
    BBcancel: TBitBtn;
    MEholidate: TMaskEdit;
    Eholidesc: TEdit;
    SBholidate: TSpeedButton;
    NEexdays: TNumberEdit;
    Panel4: TPanel;
    Pwhere: TPanel;
    BBsearch: TBitBtn;
    Psearch: TPanel;
    MEsearch: TMaskEdit;
    Pyear: TPanel;
    BBsss: TBitBtn;
    BBccc: TBitBtn;
    BBpicdumon: TBitBtn;
    BBccal: TBitBtn;
    Panel6: TPanel;
    Ltcnt: TLabel;
    RGholikind: TRadioGroup;
    Qpicducod: TOraQuery;
    procedure DBGpicducodDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure BBinsertClick(Sender: TObject);
    procedure BBcancelClick(Sender: TObject);
    procedure BBrunClick(Sender: TObject);
    procedure BBdeleteClick(Sender: TObject);
    procedure BBcloseClick(Sender: TObject);
    Procedure PicdumonUI;   {월별근무일수갱신}
    Procedure CalenderCreat;{달력(휴일)일괄생성}
    procedure MEholidateExit(Sender: TObject);
    procedure SBholidateClick(Sender: TObject);
    procedure BBsearchClick(Sender: TObject);
    procedure BBsssClick(Sender: TObject);
    procedure BBcccClick(Sender: TObject);
    procedure MEsearchKeyPress(Sender: TObject; var Key: Char);
    procedure BBpicdumonClick(Sender: TObject);
    procedure BBccalClick(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MEholidateKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    Procedure Retrieve(v_holidate: String);    {조회}
    Function DuplicateCheck : Boolean; {중복검사}
  public
    { Public declarations }
    DBErrMsg : Array[0..255] of char;    // Transaction Error Message
    LIbutnstate : Integer;   {0:Update, 1:Insert}
    LIjs : Integer;          {0:조회, 1:생성}
    LSholidate  : String;
    LSholikind  : String;
    LSholidesc  : String;
    LRexdays    : Real;
  end;

var
  Fpka40201: TFpka40201;

implementation

{$R *.DFM}

uses pka40202, Func;

{-------------------------------- MAIN ----------------------------------------}
procedure TFpka40201.FormShow(Sender: TObject);
var
   i : integer;
begin
     PhelpMsg.Caption := ' 작업자,작업일설정 및 휴일등록내역을 조회하고 있습니다...';

     Application.ProcessMessages;
     //초기값설정
     OraConnect;
     Qpicducod.Session := Ora_Session;

     LSysdate.caption := fn_GetDateStr;

     LIjs := 9; {조회/생성 변수초기화}
     Retrieve(Copy(fn_GetDateTimeStr,1,4));
end;

{조회}
procedure TFpka40201.Retrieve(v_holidate: String);
begin
     Psearch.Hide;

     with Qpicducod do
     begin
          Close;
          SQL.Clear;
          SQL.Add('select *                          ');
          SQL.Add('  from pkcholi                    ');
          SQL.Add(' where holidate like :holidate    ');
          SQL.Add(' order by holidate                ');

          ParamByname('holidate').AsString := v_holidate + '%';
          Open;

          Ltcnt.Caption := '총 ['+IntToStr(RecordCount)+'] 건';

          LIbutnstate := 0;
          MEsearch.Text := v_holidate;
          Pwhere.Caption := MEsearch.Text;
          MEholidate.Enabled := False;
          SBholidate.Enabled := False;
          Phelpmsg.Caption := ' 자료조회가 완료되었습니다.';
          SendMessage(Phelpmsg.handle,WM_PAINT,0,0);
     end;
end;

{중복오류검사}
Function TFpka40201.DuplicateCheck : Boolean;
var
     qq : TOraQuery;
begin
     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     Result := False;

     try
          with qq do
          begin
               Close;
               SQL.Clear;
               SQL.Add('select holidate from pkcholi        ');
               SQL.Add(' where holidate = :holidate         ');

               ParamByName('holidate').AsString := UnMask(MEholidate.Text, '@@@@-@@-@@');
               Open;

               if RecordCount = 0 then Result := True;
          end;
     finally
          qq.Free;
     end;
end;


{월별근무일수갱신}
Procedure TFpka40201.PicdumonUI;
var
     Str_Date_yymm : String;
     qq : TOraQuery;
begin
     If GetDaysInMonth(StrToDate(MEholidate.Text)) < 0 then
     begin
          MessageBox(handle,'월총일수를 계산할 수 없어 월별근무일수화일을 갱신할 수 없습니다.','자료오류',MB_ICONWARNING);
          Exit;
     end;

     If GetFreeDaysOfMonth(StrToDate(MEholidate.Text)) < 0 then
     begin
          MessageBox(handle,'일요일수를 계산할 수 없어 월별근무일수화일을 갱신할 수 없습니다.','자료오류',MB_ICONWARNING);
          Exit;
     end;

     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     try
          with qq do
          begin
               Close;
               SQL.Clear;
               SQL.Add('select yymm           ');
               SQL.Add('  from pkmduday       ');
               SQL.Add(' where yymm = :yymm   ');

               ParamByName('yymm').AsString := Copy(UnMask(MEholidate.Text, '@@@@-@@-@@'),1,6);
               Open;

               Phelpmsg.Caption := ' 월별근무일수 갱신중입니다.';
               SendMessage(Phelpmsg.handle,WM_PAINT,0,0);

               if RecordCount = 0 then
               begin
                    Close;
                    SQL.Clear;
                    SQL.Add('insert into pkmduday ( yymm,       ');
                    SQL.Add('                       totdays,    ');
                    SQL.Add('                       dudays,     ');
                    SQL.Add('                       sundays,    ');
                    SQL.Add('                       rohudays,   ');
                    SQL.Add('                       cohudays,   ');
                    SQL.Add('                       etchudays,  ');
                    SQL.Add('                       hutot,      ');
                    SQL.Add('                       writetime,  ');
                    SQL.Add('                       writeman  ) ');
                    SQL.Add('             values ( :yymm,       ');
                    SQL.Add('                      :totdays,    ');
                    SQL.Add('                      :dudays,     ');
                    SQL.Add('                      :sundays,    ');
                    SQL.Add('                      :rohudays,   ');
                    SQL.Add('                      :cohudays,   ');
                    SQL.Add('                      :etchudays,  ');
                    SQL.Add('                      :hutot,      ');
                    SQL.Add('                      :writetime,  ');
                    SQL.Add('                      :writeman  ) ');

                    Str_Date_yymm := Copy(UnMask(MEholidate.Text, '@@@@-@@-@@'),1,6);

                    ParamByName('yymm'     ).AsString  := Str_Date_yymm;
                    ParamByName('totdays'  ).AsInteger := GetDaysInMonth(StrToDate(MEholidate.Text));        //월의 마지막 일
                    ParamByName('dudays'   ).AsInteger := GetDaysInMonth(StrToDate(MEholidate.Text)) -
                                                          GetFreeDaysOfMonth(StrToDate(MEholidate.Text)) -   //월중총일요일수
                                                          HoliKindCount(Str_Date_yymm, 'TOT');    //해당년월(yymm)의 휴일수
                    ParamByName('sundays'  ).AsInteger := GetFreeDaysOfMonth(StrToDate(MEholidate.Text));
                    ParamByName('rohudays' ).AsInteger := HoliKindCount(Str_Date_yymm, '1');
                    ParamByName('cohudays' ).AsInteger := HoliKindCount(Str_Date_yymm, '2');
                    ParamByName('etchudays').AsInteger := HoliKindCount(Str_Date_yymm, '9');
                    ParamByName('hutot'    ).AsInteger := GetFreeDaysOfMonth(StrToDate(MEholidate.Text)) +
                                                          HoliKindCount(Str_Date_yymm, 'TOT');
                    ParamByName('writetime').AsString  := fn_GetDateTimeStr;
                    ParamByName('writeman' ).AsString  := Pempno;
                    ExecSQL;
                    Phelpmsg.Caption := ' 월별근무일수 갱신이완료되었습니다.';
                    SendMessage(Phelpmsg.handle,WM_PAINT,0,0);
               end
               else
               begin
                    Close;
                    SQL.Clear;
                    SQL.Add('update pkmduday set totdays   = :totdays,   ');
                    SQL.Add('                    dudays    = :dudays,    ');
                    SQL.Add('                    sundays   = :sundays,   ');
                    SQL.Add('                    rohudays  = :rohudays,  ');
                    SQL.Add('                    cohudays  = :cohudays,  ');
                    SQL.Add('                    etchudays = :etchudays, ');
                    SQL.Add('                    hutot     = :hutot,     ');
                    SQL.Add('                    writetime = :writetime, ');
                    SQL.Add('                    writeman  = :writeman   ');
                    SQL.Add(' where yymm = : yymm                        ');

                    Str_Date_yymm := Copy(UnMask(MEholidate.Text, '@@@@-@@-@@'),1,6);

                    ParamByName('totdays'  ).AsInteger := GetDaysInMonth(StrToDate(MEholidate.Text));
                    ParamByName('dudays'   ).AsInteger := GetDaysInMonth(StrToDate(MEholidate.Text)) -
                                                          GetFreeDaysOfMonth(StrToDate(MEholidate.Text)) -
                                                          HoliKindCount(Str_Date_yymm, 'TOT');
                    ParamByName('sundays'  ).AsInteger := GetFreeDaysOfMonth(StrToDate(MEholidate.Text));
                    ParamByName('rohudays' ).AsInteger := HoliKindCount(Str_Date_yymm, '1');
                    ParamByName('cohudays' ).AsInteger := HoliKindCount(Str_Date_yymm, '2');
                    ParamByName('etchudays').AsInteger := HoliKindCount(Str_Date_yymm, '9');
                    ParamByName('hutot'    ).AsInteger := GetFreeDaysOfMonth(StrToDate(MEholidate.Text)) +
                                                          HoliKindCount(Str_Date_yymm, 'TOT');
                    ParamByName('writetime').AsString  := fn_GetDateTimeStr;
                    ParamByName('writeman' ).AsString  := Pempno;
                    ParamByName('yymm'     ).AsString  := Str_Date_yymm;
                    ExecSQL;
                    Phelpmsg.Caption := ' 월별근무일수 갱신이완료되었습니다.';
                    SendMessage(Phelpmsg.handle,WM_PAINT,0,0);
               end;
          end;
     finally
          qq.Free;
     end;
end;

{달력(휴일)일괄생성}
Procedure TFpka40201.CalenderCreat;
var
     i : integer;
     LASholidate : array[0..19] of String[4];
     LASholikind : array[0..19] of String[1];
     LASholidesc : array[0..19] of String[20];
     Str_Date, Str_Date_yy, Str_Date_mm, Str_Date_yymm : String;
     tmp_WeekCnt : integer;
     LASholidateC : array[0..19] of String[8];      { 공휴일생성월 }
     LASnotchkmonth : array[0..5] of String[2];     { 추가생성월 }
     qq : TOraQuery;
     Label 0,1;
begin
     For i := 0 to 19 do
     begin
         LASholidate[i] := '';
         LASholidesc[i] := '';
         LASholidateC[i] := '';
     end;

     {국경일(설날,석가탄신일,추석 제외[음력])}
     LASholidate[0] := '0101';
     LASholidesc[0] := '신정';
     LASholidate[1] := '0301';
     LASholidesc[1] := '삼일절';
     LASholidate[2] := '0405';
     LASholidesc[2] := '식목일';
     LASholidate[3] := '0505';
     LASholidesc[3] := '어린이날';
     LASholidate[4] := '0606';
     LASholidesc[4] := '현충일';
//     LASholidate[5] := '0717';      
//     LASholidesc[5] := '제헌절';
     LASholidate[5] := '0815';
     LASholidesc[5] := '광복절';
     LASholidate[6] := '1003';
     LASholidesc[6] := '개천절';
     LASholidate[7] := '1225';
     LASholidesc[7] := '성탄절';

     {국경일이없는월}
     LASnotChkMonth[0] := '02';
     LASnotChkMonth[1] := '07';
     LASnotChkMonth[2] := '09';
     LASnotChkMonth[3] := '11';

     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     try
          with qq do
          begin // 0 -- begin
               Close;
               SQL.Clear;
               SQL.Add('select holidate                 ');
               SQL.Add('  from pkcholi                  ');
               SQL.Add(' where holidate like :holidate  ');

               ParamByName('holidate').AsString := MEsearch.Text + '%';
               Open;


               if RecordCount <> 0 then //Update
               begin // 1 -- begin
                    If IDNO = Application.MessageBox('이미등록된휴일이있습니다...덮어씌우겠습니까?',
                                                     '작업안내', MB_YesNo) then  System.Exit;

                    Pwhere.Caption := MEsearch.Text;

                    Close;
                    SQL.Clear;
                    SQL.Add('delete from pkcholi            ');
                    SQL.Add(' where holidate like :holidate ');

                    ParamByName('holidate').AsString := MEsearch.Text + '%';
                    ExecSQL;


                    Close;
                    SQL.Clear;
                    SQL.Add('delete from pkmduday    ');
                    SQL.Add(' where yymm like :yymm  ');

                    ParamByName('yymm').AsString := MEsearch.Text + '%';
                    ExecSQL;

                    Phelpmsg.Caption := ' 삭제가 완료되었습니다.';
                    SendMessage(Phelpmsg.handle,WM_PAINT,0,0);
                    goto 0;

               end; // 1 -- end


               if RecordCount = 0 then  //Insert
               begin // 2 -- begin
                    0 :  { goto }
                    For i := 0 to 19 do
                    begin  // 3 -- begin
                         If LASholidate[i] = '' then  goto 1;

                         Close;
                         SQL.Clear;
                         SQL.Add('insert into pkcholi (holidate,          ');
                         SQL.Add('                     holikind,          ');
                         SQL.Add('                     holidesc,          ');
                         SQL.Add('                     exdays,            ');
                         SQL.Add('                     writetime,         ');
                         SQL.Add('                     writeman)          ');
                         SQL.Add('             values (:holidate,         ');
                         SQL.Add('                     :holikind,         ');
                         SQL.Add('                     :holidesc,         ');
                         SQL.Add('                     :exdays,           ');
                         SQL.Add('                     :writetime,        ');
                         SQL.Add('                     :writeman)         ');

                         ParamByName('holidate').AsString := MEsearch.Text + LASholidate[i];
                         ParamByName('holikind').AsString := '1';

                         If DayOfWeek(StrToDate(InMask(MEsearch.Text+LASholidate[i],'@@@@-@@-@@'))) = 1 then
                         begin
                              ParamByName('holikind').AsString := '0';
                         end;

                         ParamByName('holidesc').AsString  := LASholidesc[i];
                         ParamByName('exdays').AsFloat     := 1;
                         ParamByName('writetime').AsString := fn_GetDateTimeStr;
                         ParamByName('writeman').AsString  := Pempno;
                         ExecSQL;
                    end; // 3 -- end

                    1 :   { goto  }
                    Phelpmsg.Caption := ' 달력휴일갱신이완료되었습니다.';
                    SendMessage(Phelpmsg.handle,WM_PAINT,0,0);

                    Phelpmsg.Caption := ' 달력 월별근무일수 갱신중입니다...잠시만 기다려주세요!...';
                    SendMessage(Phelpmsg.handle,WM_PAINT,0,0);

                    Close;
                    SQL.Clear;
                    SQL.Add('select *                        ');
                    SQL.Add('  from pkcholi                  ');
                    SQL.Add(' where holidate like :holidate  ');

                    ParamByName('holidate').AsString := MEsearch.Text + '%';
                    Open;
                    First;

                    i := 0;
                    While not eof do
                    begin // 4 - begin
                          LASholidateC[i] := FieldByName('holidate').AsString;
                          i := i + 1;
                          Next;
                    end; // 4 - end

                    For i := 0 to RecordCount - 1 do
                    begin // 5 - begin
                         Close;
                         SQL.Clear;
                         SQL.Add('insert into pkmduday(yymm,            ');
                         SQL.Add('                     totdays,         ');
                         SQL.Add('                     dudays,          ');
                         SQL.Add('                     sundays,         ');
                         SQL.Add('                     rohudays,        ');
                         SQL.Add('                     cohudays,        ');
                         SQL.Add('                     etchudays,       ');
                         SQL.Add('                     hutot,           ');
                         SQL.Add('                     weekcnt,         ');
                         SQL.Add('                     writetime,       ');
                         SQL.Add('                     writeman)        ');
                         SQL.Add('              values(:yymm,           ');
                         SQL.Add('                     :totdays,        ');
                         SQL.Add('                     :dudays,         ');
                         SQL.Add('                     :sundays,        ');
                         SQL.Add('                     :rohudays,       ');
                         SQL.Add('                     :cohudays,       ');
                         SQL.Add('                     :etchudays,      ');
                         SQL.Add('                     :hutot,          ');
                         SQL.Add('                     :weekcnt,        ');
                         SQL.Add('                     :writetime,      ');
                         SQL.Add('                     :writeman)       ');

                         Str_Date      := InMask(LASholidateC[i], '@@@@-@@-@@');
                         Str_Date_yy   := Copy(LASholidateC[i],1,4);
                         Str_Date_mm   := Copy(LASholidateC[i],5,2);
                         Str_Date_yymm := Str_Date_yy+Str_Date_mm;

                         ParamByName('yymm').AsString := Str_Date_yy + Str_Date_mm;

                         ParamByName('totdays').AsInteger := GetDaysInMonth(StrToDate(Str_Date));

                         ParamByName('dudays').AsFloat    := GetDaysInMonth(StrToDate(Str_Date))
                                                             - GetFreeDaysOfMonth(StrToDate(Str_Date))
                                                             + HoliKindCount(Str_Date_yymm, '1')
                                                             + HoliKindCount(Str_Date_yymm, '2')
                                                             + HoliKindCount(Str_Date_yymm, '9');
                         ParamByName('sundays').AsFloat   := GetFreeDaysOfMonth(StrToDate(Str_date));
                         ParamByName('rohudays').AsFloat  := HoliKindCount(Str_Date_yymm, '1');
                         ParamByName('cohudays').AsFloat  := HoliKindCount(Str_Date_yymm, '2');
                         ParamByName('etchudays').AsFloat := HoliKindCount(Str_Date_yymm, '9');
                         ParamByName('hutot').AsFloat     := GetFreeDaysOfMonth(StrToDate(Str_date))
                                                             + HoliKindCount(Str_Date_yymm, '1')
                                                             + HoliKindCount(Str_Date_yymm, '2')
                                                             + HoliKindCount(Str_Date_yymm, '9');

                         {해당월의 총 주수}
                         tmp_WeekCnt := GetDaysInMonth(StrToDate(Str_Date))
                                        - (8 - DayOfWeek(StrToDate(Str_Date_yy+'-'+Str_Date_mm+'-'+'01')));

                         If tmp_WeekCnt mod 7 = 0 then
                         begin
                              ParamByName('weekcnt').AsFloat := (tmp_WeeKCnt div 7) + 1;
                         end
                         else
                         begin
                              ParamByName('weekcnt').AsFloat := (tmp_WeekCnt div 7) + 2;
                         end;

                         ParamByName('writetime').AsString := fn_GetDateTimeStr;
                         ParamByName('writeman').AsString  := Pempno;

                         ExecSQL;
                    end; // 5 -- end

                    {2,9,11}
                    For i := 0 to 2 do
                    begin // 6 - begin
                         Close;
                         SQL.Clear;
                         SQL.Add('insert into pkmduday(yymm,            ');
                         SQL.Add('                     totdays,         ');
                         SQL.Add('                     dudays,          ');
                         SQL.Add('                     sundays,         ');
                         SQL.Add('                     rohudays,        ');
                         SQL.Add('                     cohudays,        ');
                         SQL.Add('                     etchudays,       ');
                         SQL.Add('                     hutot,           ');
                         SQL.Add('                     weekcnt,         ');
                         SQL.Add('                     writetime,       ');
                         SQL.Add('                     writeman)        ');
                         SQL.Add('              values(:yymm,           ');
                         SQL.Add('                     :totdays,        ');
                         SQL.Add('                     :dudays,         ');
                         SQL.Add('                     :sundays,        ');
                         SQL.Add('                     :rohudays,       ');
                         SQL.Add( '                     :cohudays,      ');
                         SQL.Add('                     :etchudays,      ');
                         SQL.Add('                     :hutot,          ');
                         SQL.Add('                     :weekcnt,        ');
                         SQL.Add('                     :writetime,      ');
                         SQL.Add('                     :writeman)       ');

                         Str_Date_yy := Copy(LASholidateC[i],1,4);
                         Str_Date_mm := LASnotChkMonth[i];

                         ParamByName('yymm').AsString       := Str_Date_yy + Str_Date_mm;
                         ParamByName('totdays').AsInteger   := GetDaysInMonth(StrToDate(Str_Date_yy+'-'+Str_Date_mm+'-01'));
                         ParamByName('dudays').AsInteger    := ParamByName('totdays').AsInteger
                                                               - GetFreeDaysOfMonth(StrToDate(Str_Date_yy+'-'+Str_Date_mm+'-01'));
                         ParamByName('sundays').AsInteger   := GetFreeDaysOfMonth(StrToDate(Str_Date_yy+'-'+Str_Date_mm+'-01'));
                         ParamByName('rohudays').AsInteger  := 0;
                         ParamByName('cohudays').AsInteger  := 0;
                         ParamByName('etchudays').AsInteger := 0;
                         ParamByName('hutot').AsInteger := GetFreeDaysOfMonth(StrToDate(Str_Date_yy+'-'+Str_Date_mm+'-01'));

                         {해당월의 총 주수}
                         tmp_WeekCnt := GetDaysInMonth(StrToDate(Str_Date_yy+'-'+Str_Date_mm+'-01'))
                                        - (8 - DayOfWeek(StrToDate(Str_Date_yy+'-'+Str_Date_mm+'-01')));

                         If tmp_WeekCnt mod 7 = 0 then
                         begin
                              ParamByName('weekcnt').AsFloat := (tmp_WeeKCnt div 7) + 1;
                         end
                         else
                         begin
                              ParamByName('weekcnt').AsFloat := (tmp_WeekCnt div 7) + 2;
                         end;

                         ParamByName('writetime').AsString := fn_GetDateTimeStr;
                         ParamByName('writeman').AsString  := Pempno;

                         ExecSQL;
                    end; // 6 -- end

                    Phelpmsg.Caption := ' 월별근무일수 갱신이완료되었습니다.';
                    SendMessage(Phelpmsg.handle,WM_PAINT,0,0);

                    Retrieve(MEsearch.Text);
               end; // 2 -- End
          end; // 1 -- End
     finally
          qq.Free;
     end; // 0 -- End

end;

{자료이동/선택}
procedure TFpka40201.DataSource1DataChange(Sender: TObject; Field: TField);
begin
     If LIbutnstate = 1 then Exit;{Insert}

     with Qpicducod do
     begin
          LSholidate  := FieldByName('holidate').AsString;
          LSholikind  := FieldByName('holikind').AsString;
          LSholidesc  := FieldByName('holidesc').AsString;
          LRexdays    := FieldByName('exdays').AsFloat;
          MEholidate.Text  := InMask(FieldByName('holidate').AsString, '@@@@-@@-@@');

          If LSholikind = '' then Exit;
          RGholikind.Enabled := True;;
          Case StrToInt(LSholikind) of
               0 : begin
                        RGholikind.ItemIndex := 0;
                        RGholikind.Enabled := False;
                   end;
               1 : RGholikind.ItemIndex := 1;
               2 : RGholikind.ItemIndex := 2;
               9 : RGholikind.ItemIndex := 3;
          end;
          Eholidesc.Text  := FieldByName('holidesc').AsString;
          NEexdays.Value  := FieldByName('exdays').AsFloat;
     end;
end;

procedure TFpka40201.DBGpicducodDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin

end;

{입력}
procedure TFpka40201.BBinsertClick(Sender: TObject);
begin
     If LIjs <> 9 then exit;

     Phelpmsg.Caption := ' 휴일일자를 입력(선택)후 휴일구분,휴일내역,제외구분일수 입력후 저장하세요...';
     LIbutnstate := 1 ;{Insert}
     MEholidate.Enabled := True;
     SBholidate.Enabled := True;

     MEholidate.Text      := '';
     Eholidesc.Text       := '';
     NEexdays.Value       := 0;
     MEholidate.SetFocus;
end;
{저장}
procedure TFpka40201.BBrunClick(Sender: TObject);
var
     LOyymm : string;
     qq : TOraQuery;
begin
     If LIjs <> 9 then exit;

     Phelpmsg.Caption := '';
     LOyymm := UnMask(MEholidate.Text, '@@@@-@@-@@');

     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     Try // 0 -- begin
          with qq do
          begin // 1 -- begin
               If LIbutnstate = 0 then
               begin {Update} // 2 -- begin
                    If IDNO = Application.MessageBox('저장 하시겠습니까?',
                                                     '저장작업안내', MB_YesNo) then Exit;

                    Close;
                    SQL.Clear;
                    SQL.Add('update pkcholi                            ');
                    SQL.Add('   set holidate  = :holidate,             ');
                    SQL.Add('       holikind  = :holikind,             ');
                    SQL.Add('       holidesc  = :holidesc,             ');
                    SQL.Add('       exdays    = :exdays,               ');
                    SQL.Add('       writetime = :writetime,            ');
                    SQL.Add('       writeman  = :writeman              ');
                    SQL.Add(' where holidate  = :holidate              ');

                    ParamByName('holidate').AsString := UnMask(MEholidate.Text, '@@@@-@@-@@');
                    ParamByName('holikind').AsString := Copy(RGholikind.Items[RGholikind.ItemIndex],2,1);
                    ParamByName('holidesc').AsString := Eholidesc.Text;
                    ParamByName('exdays').AsString   := FloatToStr(NEexdays.Value);
                    ParamByName('writetime').AsString := fn_GetDateTimeStr;
                    ParamByName('writeman').AsString  := Pempno;
                    ExecSQL;

                    Application.ProcessMessages;
                    PicdumonUI; {월별근무일수갱신}
                    Retrieve(MEsearch.Text);
                    Phelpmsg.Caption := ' 저장이완료되었습니다.';
                    Qpicducod.Locate('holidate', LOyymm, []);
                    DBGpicducod.SetFocus;
               end;  // 2 -- end

               If LIbutnstate = 1 then
               begin {Insert}  // 3 -- begin
                    If IDNO = Application.MessageBox('신규등록 하시겠습니까?',
                                                     '신규등록작업안내', MB_YesNo) then
                    begin
                         BBcancelClick(Fpka40201);
                         Exit;
                    end;

                    If Length(UnMask(MEholidate.Text, '@@@@-@@-@@')) <> 8 then
                    begin
                         MessageBox(handle,'휴일일자를 정확히(8자리)입력후 작업하세요!','입력오류',MB_ICONWARNING);
                         MEholidate.SetFocus;
                         Exit;
                    end;

                    If DuplicateCheck = False then
                    begin
                         MessageBox(handle,'이미 등록되어 있는 휴일일자 입니다. 확인하고 다시 입력하십시오!','입력오류',MB_ICONWARNING);
                         MEholidate.SetFocus;
                         Exit;
                    end;


                    Close;
                    SQL.Clear;
                    SQL.Add('insert into pkcholi (holidate,                           ');
                    SQL.Add('                     holikind,                           ');
                    SQL.Add('                     holidesc,                           ');
                    SQL.Add('                     exdays,                             ');
                    SQL.Add('                     writetime,                          ');
                    SQL.Add('                     writeman)                           ');
                    SQL.Add('             values (:holidate,                          ');
                    SQL.Add('                     :holikind,                          ');
                    SQL.Add('                     :holidesc,                          ');
                    SQL.Add('                     :exdays,                            ');
                    SQL.Add('                     :writetime,                         ');
                    SQL.Add('                     :writeman)                          ');

                    ParamByName('holidate').AsString := UnMask(MEholidate.Text, '@@@@-@@-@@');
                    ParamByName('holikind').AsString := Copy(RGholikind.Items[RGholikind.ItemIndex],2,1);
                    ParamByName('holidesc').AsString  := Eholidesc.Text;
                    ParamByName('exdays').AsString    := FloatToStr(NEexdays.Value);
                    ParamByName('writetime').AsString := fn_GetDateTimeStr;
                    ParamByName('writeman').AsString  := Pempno;

                    ExecSQL;

                    Application.ProcessMessages;
                    PicdumonUI; {월별근무일수갱신}
                    Retrieve(MEsearch.Text);
                    Phelpmsg.Caption := ' 신규저장이완료되었습니다.';
                    Qpicducod.Locate('holidate', LOyymm, []);
                    DBGpicducod.SetFocus;
               end; // 3 -- end
          end; // 1 -- end
     finally
          qq.Free;
     end; // 0 -- end

end;
{삭제}
procedure TFpka40201.BBdeleteClick(Sender: TObject);
var
     qq : TOraQuery;
     vCurrentRecord : TBookMark;    //삭제 후 레코드 지정을 위한 북마크변수
begin

     If LIjs <> 9 then exit;

     Phelpmsg.Caption := '';

     If LIbutnstate = 0 then
     begin {Update}
          If IDNO = Application.MessageBox('자료를 삭제하시겠습니까?', '작업안내', MB_YesNo) then Exit;

          vCurrentRecord := TDataSet(Qpicducod.GetBookmark);

          Try
               qq := TOraQuery.Create(nil);
               qq.Session := Ora_Session;
               with qq do
               begin
                    Close;
                    SQL.Clear;
                    SQL.Add('delete from pkcholi          ');
                    SQL.Add(' where holidate = :holidate  ');

                    ParamByName('holidate').AsString := UnMask(MEholidate.Text, '@@@@-@@-@@');

                    ExecSQL;

                    Application.ProcessMessages;
                    PicdumonUI; {월별근무일수갱신}
                    Retrieve(MEsearch.Text);
                    Phelpmsg.Caption := ' 삭제가 완료되었습니다.';
               end;
          finally
               qq.Free;
          end;

          Qpicducod.GotoBookmark(vCurrentRecord);

     end;
end;
{취소}
procedure TFpka40201.BBcancelClick(Sender: TObject);
begin
     If LIjs <> 9 then exit;

     If IDNO = Application.MessageBox('작업을 취소하시겠습니까?', '작업안내', MB_YesNo) then Exit;
     Phelpmsg.Caption := '';

     If LIbutnstate = 1 then
     begin {Insert}
          Retrieve(MEsearch.Text);
          Phelpmsg.Caption := ' 작업이 취소되었습니다...';
          Exit;
     end;

     If LIbutnstate = 0 then
     begin {Updated}
          MEholidate.Text   := LSholidate;

          Case StrToInt(LSholikind) of
               0 :
               begin
                    RGholikind.ItemIndex := 0;
                    RGholikind.Enabled := False;
               end;
               1 :  RGholikind.ItemIndex := 1;
               2 :  RGholikind.ItemIndex := 2;
               else   RGholikind.ItemIndex := 3;
          end;
          Eholidesc.Text := LSholidesc;
          NEexdays.Value := LRexdays;
     end;
     Phelpmsg.Caption := '';
     DBGpicducod.SetFocus;
end;


{일요일 검사 휴일구분제어}

procedure TFpka40201.MEholidateExit(Sender: TObject);
begin

     if fn_IsDate(RemoveChar(MEholidate.Text,'-')) = False then
     begin
          MessageBox(handle,'휴일일자를 정확히입력하세요!','입력오류',MB_ICONWARNING);
          MEholidate.SetFocus;
          Exit;
     end;

     If DayOfWeek(StrToDate(MEholidate.Text)) = 1 then
     begin
          RGholikind.ItemIndex := 0;
          Eholidesc.Text := '일요일';
          RGholikind.Enabled := False;
     end
     else
     begin
          RGholikind.Enabled := True;
          Eholidesc.Text := '';
     end;
end;
{달력 라이브러리 호출}
procedure TFpka40201.SBholidateClick(Sender: TObject);
begin
     MEholidate.Setfocus;
     calendar := TCalendar.Create(Self);

     Try
          calendar.ShowModal;
          If Calendar.DayCaption = '' then exit;
          MEholidate.Text :=copy(calendar.DayCaption,1,4)+'-'+copy(calendar.DayCaption,5,2)+'-'+copy(calendar.DayCaption,7,2);
     Finally
          calendar.Free;
     end;

end;

{조회선택}
procedure TFpka40201.BBsearchClick(Sender: TObject);
begin
     If LIjs = 1 then exit;

     If LIbutnstate = 1 then Exit; // Insert

     Phelpmsg.Caption := ' 조회년도을 입력후 실행(or Enter Key) 하세요...';
     LIjs := 0;
     Pyear.Caption := '조회년도';

     If LIbutnstate = 0 then
     begin // Updated
          Psearch.Show;
          Psearch.Left := 237;
          Psearch.Top := 244;
          SendMessage(Psearch.handle,WM_PAINT,0,0);
          MEsearch.SetFocus;
     end;
end;

{조회실행}
procedure TFpka40201.BBsssClick(Sender: TObject);
var
     LSwhereBAK : String;
begin
     If LIjs = 0 then
     begin  {조회}
          If Length(MEsearch.Text) <> 4 then
          begin
               MessageBox(handle,'조회년도를 정확히(4자리) 입력하십시오!','입력오류',MB_ICONWARNING);
               MEsearch.SetFocus;
               Exit;
          end;

          LSwhereBAK := Pwhere.Caption;
          Retrieve(MEsearch.Text);

          If Qpicducod.RecordCount < 1 then
          begin
               MessageBox(handle,'자료가 없습니다.','조회조건입력오류',MB_ICONWARNING);
               MEsearch.Text := LSwhereBAK;
               Retrieve(MEsearch.Text);
               LIjs := 9;
               Exit;
          end;

          LIjs := 9;
     end;

     If LIjs = 1 then
     begin  {생성}
          If Length(MEsearch.Text) <> 4 then
          begin
               MessageBox(handle,'생성년도를 정확히(4자리) 입력하십시오!','입력오류',MB_ICONWARNING);
               MEsearch.SetFocus;
               Exit;
          end;  

          Try
               CalenderCreat;
               Except on E : EDataBaseError do
               begin
                    MessageBox(handle,StrPcopy(DBErrMsg,E.Message),'자료오류(개발부와 상의하세요)',MB_ICONERROR);
                    PhelpMsg.Caption := ' 자료오류로인해 진행중인작업을 복구하는중입니다... ';
                    SendMessage(phelpmsg.handle,WM_PAINT,0,0);
                    Phelpmsg.Caption := ' 입력년도에 해당하는 휴일관리달력생성이 비정상종료되었습니다.';
                    SendMessage(phelpmsg.handle,WM_PAINT,0,0);
                    exit;
               end;
          end;
          Phelpmsg.Caption := ' 입력년도에 해당하는 휴일관리달력생성이 완료되었습니다.';
          LIjs := 9;
     end;
end;
{조회/생성취소}
procedure TFpka40201.BBcccClick(Sender: TObject);
begin
     Psearch.Top := 300;
     LIjs := 9;
     Phelpmsg.Caption := '';
end;
{조회/생성키제어}
procedure TFpka40201.MEsearchKeyPress(Sender: TObject; var Key: Char);
begin
     If key = #13 then
     begin
          key := #0;
          BBsssClick(Fpka40201);
     end;
end;
{월별근무일수}
procedure TFpka40201.BBpicdumonClick(Sender: TObject);
begin
     Phelpmsg.Caption := '';
     Fpka40202.MEyymm.Text := Copy(UnMask(MEholidate.Text, '@@@@-@@-@@'),1,6);
     Fpka40202.ShowModal;
end;

{달력(휴일)생성}
procedure TFpka40201.BBccalClick(Sender: TObject);
var
   i : integer;
begin
     If LIjs = 0 then exit;

     If LIbutnstate = 1 then Exit; // Insert

     Phelpmsg.Caption := ' 생성년도을 입력후 실행(or Enter Key) 하세요...';
     LIjs := 1;
     Pyear.Caption := '♬생성년도';
     MEsearch.Text := '';

     If LIbutnstate = 0 then
     begin // Updated
          Psearch.Show;
          Psearch.Left := 15;
          For i := 300 downto 244 do
          begin
               Psearch.Top := i;
               SendMessage(Psearch.handle,WM_PAINT,0,0);
          end;
          MEsearch.SetFocus;
     end;
end;

{종료}
procedure TFpka40201.BBcloseClick(Sender: TObject);
begin
  close;
end;
procedure TFpka40201.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  If IDNO = Application.MessageBox('작업을 종료하시겠습니까?',  '작업안내', MB_YesNo) then
  begin
       Action := caNone;
       exit;
  end;
end;

procedure TFpka40201.MEholidateKeyPress(Sender: TObject; var Key: Char);
var
     ADate : TDateTime;
begin
     If key = #13 then
     begin
          key := #0;
          If Length(UnMask(MEholidate.Text, '@@@@-@@-@@')) <> 8 then
          begin
               MessageBox(handle,'휴일일자를 정확히(8자리)입력후 작업하세요!','입력오류',MB_ICONWARNING);
               MEholidate.SetFocus;
               Exit;
          end;

          if fn_IsDate(RemoveChar(MEholidate.Text,'-')) = False then
          begin
               MessageBox(handle,'휴일일자를 정확히입력하세요!','입력오류',MB_ICONWARNING);
               MEholidate.SetFocus;
               Exit;
          end;

          If DuplicateCheck = False then
          begin;
               MessageBox(handle,'이미 등록되어 있는 휴일일자 입니다. 확인하고 다시 입력하십시오!','입력오류',MB_ICONWARNING);
               MEholidate.SetFocus;
               Exit;
          end;
     end;
end;

end.
