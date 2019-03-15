
unit pkg10501;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Gauges, StdCtrls, Mask, ExtCtrls, Buttons, DB, DBTables, FileCtrl,
  TimeFtp, Pass, DateLib, KyLib1, Calen1,FormMon1, Func, Ora, MemDS,
  DBAccess;  // Calen2,-> FormMon1

type
  TMainForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Phelpmsg: TPanel;
    Panel4: TPanel;
    L_UserName: TLabel;
    L_Curdate: TLabel;
    BBrun: TBitBtn;
    BBhelp: TBitBtn;
    BBexit: TBitBtn;
    Panel5: TPanel;
    Panel6: TPanel;
    Label1: TLabel;
    Panel8: TPanel;
    Panel9: TPanel;
    Bevel1: TBevel;
    ME_fr: TMaskEdit;
    ME_to: TMaskEdit;
    Label2: TLabel;
    Panel10: TPanel;
    Panel7: TPanel;
    Gauge1: TGauge;
    SB_fr: TSpeedButton;
    SB_to: TSpeedButton;
    SB_day: TSpeedButton;
    Panel3: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    L_provide: TLabel;
    L_cancellation: TLabel;
    ME_day: TMaskEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    BB_pimfami: TBitBtn;
    Label8: TLabel;
    L_over: TLabel;
    Panel11: TPanel;
    Panel12: TPanel;
    CB_Step1: TCheckBox;
    CB_Step2: TCheckBox;
    CB_Step3: TCheckBox;
    CB_Step4: TCheckBox;
    CB_Step5: TCheckBox;
    CB_Step6: TCheckBox;
    procedure FormActivate(Sender: TObject);
    procedure BBexitClick(Sender: TObject);
    procedure BBrunClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SB_frClick(Sender: TObject);
    procedure SB_dayClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BB_pimfamiClick(Sender: TObject);
  private
    procedure Seq_Work001;
    procedure Seq_Work002;
    procedure Seq_Work003;
    procedure Seq_Work004;
    procedure Seq_Work005;
    procedure Seq_Work006;
    { Private declarations }
  public
    Start : Integer;
    { Public declarations }
  end;

var
  MainForm: TMainForm;
  Curdate : String;
  Running: Boolean;
  provide, cancellation: Integer;
  HomeDir: String;
  TRFlag : Boolean; //___ Transaction Flag ...
  RCount : Integer;

  F_matecnt, F_childcnt, F_parentcnt: Integer;
  F_parentminage, F_childmaxage, F_togethermm: Integer;

implementation
{$R *.DFM}

procedure TMainForm.FormActivate(Sender: TObject);
var
     qq : TOraQuery;
begin
     if Running then System.Exit;

     Running := True;
     Phelpmsg.Caption := '  초기자료를 읽고 있습니다.';
     Application.ProcessMessages;

     OraConnect;

     L_UserName.Caption := Pkorname + '(' +Pempno+ ')';

     Curdate := fn_GetDateTimeStr;

     L_Curdate.Caption  := fn_GetDateStr;

     HomeDir  := HomeDirOpen;

     ME_fr.Text   := CalcMonth(Copy(Curdate,1,6),-1)+'16'; // 전월16일
     ME_to.Text   := Copy(Curdate,1,6)+'15'; // 금월15일
     ME_day.Text  := Copy(Curdate,1,6); // 당월
     provide      := 0;
     cancellation := 0;

     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     Try
          with qq do
          begin
               Close;
               SQL.Clear;
               SQL.Add('select matecnt, childcnt, parentcnt,          ');
               SQL.Add('       parentminage, childmaxage, togethermm  ');
               SQL.Add('  from pkcfmbas                               ');
               Open;

               if RecordCount > 0 then
               begin
                    F_matecnt      := FieldByName('MATECNT').AsInteger;
                    F_childcnt     := FieldByName('CHILDCNT').AsInteger;
                    F_parentcnt    := FieldByName('PARENTCNT').AsInteger;

                    F_parentminage := FieldByName('PARENTMINAGE').AsInteger;
                    F_childmaxage  := FieldByName('CHILDMAXAGE').AsInteger;
                    F_togethermm   := FieldByName('TOGETHERMM').AsInteger;
               end
               else
               begin
                    F_matecnt      := 0;
                    F_childcnt     := 0;
                    F_parentcnt    := 0;
                    F_parentminage := 0;
                    F_childmaxage  := 0;
                    F_togethermm   := 0;
               end;

               Close;
               SQL.Clear;
               SQL.Add('select count(empno) cnt_fakind                                  ');
               SQL.Add('  from pimfami                                                  ');
               SQL.Add(' where nvl(fakind,'' '') not in (''A'',''B'',''C'',''D'',''Z'') ');
               Open;

               if FieldByName('cnt_fakind').AsInteger > 0 then
               begin
                    Application.ProcessMessages;
                    MessageBox(Handle, '인사 가족화일에 가족구분이 정확하지 않은 자료가 존재합니다. 가족구분 일괄갱신 작업을 먼저 수행하십시오',
                                       '자료오류', MB_ICONWARNING);
               end;
          end;
     Finally
          qq.Free;
     end;

     Phelpmsg.Caption := '';
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
     Start := 0;
     Running := False;
end;

procedure TMainForm.SB_frClick(Sender: TObject);
var
     calendar: Tcalendar;
begin
     Calendar := TCalendar.Create(Self);
     Try
          Calendar.ShowModal;
          if Calendar.DayCaption <> '' then
          begin
               if TSpeedButton(Sender).Name = 'SB_fr' then
                    TMaskEdit(ME_fr).text := Calendar.DayCaption;
               if TSpeedButton(Sender).Name = 'SB_to' then
                    TMaskEdit(ME_to).text := Calendar.DayCaption;
          end;
     Finally
          Calendar.Free;
     end;
end;

procedure TMainForm.SB_dayClick(Sender: TObject);

begin
    Try
        MonthForm := TMonthForm.Create(Self); 
        MonthForm.ShowModal;    
        if MonthForm.DayCaption <> '' then              
           ME_day.Text := Copy(MonthForm.DayCaption,1,6); 
    Finally 
        MonthForm.Free; 
    End;

end;

procedure TMainForm.BBexitClick(Sender: TObject);
begin
     Close;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     if Application.MessageBox('작업을 종료하시겠습니까?',
                               '작업안내', mb_YesNo) = IDYES
     then
          Action := caFree
     else
          Action := caNone;
end;

procedure TMainForm.BBrunClick(Sender: TObject);
var
     mm, sex, i: Integer;
begin
     Gauge1.Progress        := 0;
     L_provide.Caption      := '[0 명]';
     L_cancellation.Caption := '[0 명]';
     L_over.Caption         := '[0 명]';


     provide      := 0;
     cancellation := 0;

     if not (CB_Step1.Checked OR CB_Step2.Checked OR CB_Step3.Checked OR
             CB_Step4.Checked OR CB_Step5.Checked OR CB_Step6.Checked ) then
     begin
          Application.MessageBox('적어도 하나 이상의 작업은 선택하시고 작업하시기 바랍니다.','[작업안내]',MB_OK+MB_ICONWARNING);
          System.Exit;
     end;


     if CB_Step1.Checked then
     begin
          Seq_Work001;
          if not TRFlag then
          begin
               Phelpmsg.Caption := '  신규지급 대상자를 추출에 실패했습니다...';
               System.Exit;
          end;
     end;

     if CB_Step2.Checked then
     begin
          Seq_Work002;
          if not TRFlag then
          begin
               Phelpmsg.Caption := '  퇴직자 추출에 실패했습니다...';
               System.Exit;
          end;
     end;

     if CB_Step3.Checked then
     begin
          Seq_Work003;
          if not TRFlag then
          begin
               Phelpmsg.Caption := '  직계비속 연령제한자 추출에 실패하였습니다...';
               System.Exit;
          end;
     end;

     if CB_Step4.Checked then
     begin
          Seq_Work004;
          if not TRFlag then
          begin
               Phelpmsg.Caption := '  가족화일 자료에 등록되어 있지 않은 자료를 추출에 실패하였습니다...';
               System.Exit;
          end;
     end;

     if CB_Step5.Checked then
     begin
          Seq_Work005;
          if not TRFlag then
          begin
               Phelpmsg.Caption := '  존속 비동거 자료를 추출에 실패하였습니다...';
               System.Exit;
          end;
     end;

     if CB_Step6.Checked then Seq_Work006;

end;

procedure TMainForm.Seq_Work001;
var
     sex, mm: Integer;
     Pro_empno: string;
     Pro_matecnt, Pro_childcnt, Pro_parentcnt: Integer;
     qq, qq2 : TOraQuery;
begin
     TRFlag := False;


     Phelpmsg.Caption := '  신규지급 대상자를 추출합니다. ';
     Application.ProcessMessages;

     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     Try
          with qq do
          begin
               Close;
               SQL.Clear;
               SQL.ADD(' select a.empno, a.korname, a.empdate, a.firstyn , a.mateempno, ');
               SQL.ADD('        b.facode, b.faname, b.fabirthdate, b.fakind             ');
               SQL.ADD('   from pkmpmas a, pimfami b                                    ');
               SQL.ADD('  where a.empno = b.empno                                       ');
               SQL.ADD('    and a.empno not like ''Y%''                                 ');
               SQL.ADD('    and a.pstate < ''80''                                       ');
               SQL.ADD('    and a.empdate between :frretdate and :toretdate             ');
               SQL.ADD('    and upper(b.fakind) in (''A'',''B'',''C'')                  ');
               SQL.ADD('    and b.fabirthdate is not null                               ');
               SQL.ADD('    and b.facode is not null                                    ');
               SQL.ADD('  order by a.empno, b.fakind, b.fabirthdate                     ');
               ParamByName('frretdate').AsString := ME_fr.Text;
               ParamByName('toretdate').AsString := ME_to.Text;
               Open;

               Gauge1.Progress := 0;
               RCount          := 0;
               Gauge1.MaxValue := RecordCount;
               Application.ProcessMessages;

               qq2 := TOraQuery.Create(nil);
               qq2.Session := Ora_Session;

               Try
                    {이미 자동지급신청이 있으면 다시 생성하기 위해 지운다}
                    while not Eof do
                    begin
                         qq2.Close;
                         qq2.SQL.Clear;
                         qq2.SQL.Add('delete from pkmfmmas          ');
                         qq2.SQL.Add(' where empno = :p_empno       ');
                         qq2.SQL.Add('   and appkind = ''A2''       ');
                         qq2.SQL.Add('   and faminame = :p_faminame ');
                         qq2.ParamByName('p_empno').AsString    := qq.FieldByName('EMPNO').AsString;
                         qq2.ParamByName('p_faminame').AsSTring := qq.FieldByName('FANAME').AsString;
                         qq2.ExecSQL;
                         qq.Next;
                    end;
               Finally
                    qq2.Free;
               end;

               First;
               Pro_empno     := FieldByName('EMPNO').AsString; {현재처리중인 사원}
               Pro_matecnt   := 0;
               Pro_childcnt  := 0;
               Pro_parentcnt := 0;

               qq2 := TOraQuery.Create(nil);
               qq2.Session := Ora_Session;

               while not Eof do
               begin
                    RCount          := Rcount + 1;
                    Gauge1.Progress := RCount;
                    Application.ProcessMessages;

                    if Pro_empno <> FieldByName('EMPNO').AsString then
                    begin
                         Pro_empno     := FieldByName('EMPNO').AsString; {사원이 바뀜}
                         Pro_matecnt   := 0;
                         Pro_childcnt  := 0;
                         Pro_parentcnt := 0;
                    end;

                    //___ 현재 가족수당수혜자에 대한 지급신청이 있으면 Skip

                    qq2.Close;
                    qq2.SQL.Clear;
                    qq2.SQL.Add( ' select count(*)                                ');
                    qq2.SQL.Add( '   from pkmfmmas                                ');
                    qq2.SQL.Add( '  where empno = :empno                          ');
                    qq2.SQL.Add( '    and faminame = :faminame                    ');
                    qq2.SQL.Add( '    and appkind = ''A1''                        ');
                    qq2.SQL.Add( '    and upper(famiyn) = ''Y''                   ');
                    qq2.SQL.Add( '    and famitodate is null                      ');
                    qq2.ParamByName('empno').AsString    := qq.FieldByName('EMPNO').AsString;
                    qq2.ParamByName('faminame').AsString := qq.FieldByName('FaName').AsString;
                    qq2.Open;

                    if qq2.Fields[0].AsInteger > 0 then
                    begin
                         qq.Next;
                         Continue;
                    end;

                    if UpperCase(qq.FieldByName('FAKIND').AsString) = 'B' then {존속}
                    begin
                         if Pro_parentcnt >= F_parentcnt then {제한인원을 넘으면 신청안함}
                         begin
                              qq.Next;
                              Continue;
                         end;
                         if Uppercase(qq.FieldByName('FIRSTYN').AsString) <> 'Y' then {장남녀가 아니면 신청안함, 동거개시일이 없기 때문}
                         begin
                              qq.Next;
                              Continue;
                         end;

                         mm  := StrToIntDef(Copy(DateCal(qq.FieldByName('FABIRTHDATE').AsString,
                                                         qq.FieldByName('EMPDATE').AsString),1,4),0);  {가족연령 산정}
                         sex := StrToIntDef(Copy(qq.FieldByName('FACODE').AsString,2,1),0) mod 2;   {가족성별}

                         if (sex = 1) and (mm < F_parentminage) then {남자 and 연령미달, 신청안함}
                         begin
                              qq.Next;
                              Continue;
                         end
                         else if (sex = 0) and (mm < F_parentminage - 5) then {여자 and 열령미달, 신청안함}
                         begin
                              qq.Next;
                              Continue;
                         end;
                         Inc(Pro_parentcnt);
                    end
                    else if UpperCase(FieldByName('FAKIND').AsString) = 'A' then {배우자}
                    begin
                         if Pro_matecnt >= F_matecnt then {제한인원을 넘으면 신청안함}
                         begin
                              qq.Next;
                              Continue;
                         end;

                         if UpperCase(qq.FieldByName('MATEEMPNO').AsString) <> '' then {사내부부이면}
                         begin
                              qq2.Close;
                              qq2.SQL.Clear;
                              qq2.SQL.Add('select faminame from pkmfmmas             ');
                              qq2.SQL.Add(' where empno = :p_empno                   ');
                              qq2.SQL.Add('   and famikind = ''A''                   ');
                              qq2.SQL.Add('   and substr(appkind,1,1) = ''A''        ');
                              qq2.SQL.Add('   and famiyn = ''Y''                     ');
                              qq2.SQL.Add('   and famitodate is null                 ');
                              qq2.ParamByName('p_empno').AsString := qq.FieldByName('MATEEMPNO').AsString;
                              qq2.Open;

                              if qq2.RecordCount > 0 then {사내부부의 경우에는 가족수당(배우자)을 한쪽 사원만 지급받을 수 있다.}
                              begin
                                   qq2.Close;
                                   qq.Next;
                                   Continue;
                              end;
                         end;
                         Inc(Pro_matecnt);
                    end
                    else if UpperCase(qq.FieldByName('FAKIND').AsString) = 'C' then {비속}
                    begin
                         if Pro_childcnt >= F_childcnt then {제한인원을 넘으면 신청안함}
                         begin
                              qq.Next;
                              Continue;
                         end;

                         mm  := StrToIntDef(Copy(DateCal(qq.FieldByName('FABIRTHDATE').AsString,
                                                         qq.FieldByName('EMPDATE').AsString),1,4),0);  {가족연령 산정}
                         if mm > F_childmaxage then {직계비속의 수당지급 연령제한을 초과, 신청안함}
                         begin
                              qq.Next;
                              Continue;
                         end;
                         Inc(Pro_childcnt);
                    end;

                    Inc(provide);
                    L_provide.Caption := '['+IntToStr(provide)+' 명]';
                    Application.ProcessMessages;

                    qq2.Close;
                    qq2.SQL.Clear;
                    qq2.SQL.Add('insert into pkmfmmas ( empno,             ');
                    qq2.SQL.Add('                       korname,           ');
                    qq2.SQL.Add('                       appkind,           ');
                    qq2.SQL.Add('                       famikind,          ');
                    qq2.SQL.Add('                       famirel,           ');
                    qq2.SQL.Add('                       faminame,          ');
                    qq2.SQL.Add('                       famibdate,         ');
                    qq2.SQL.Add('                       appdate,           ');
                    qq2.SQL.Add('                       regdate,           ');
                    qq2.SQL.Add('                       appdesc,           ');
                    qq2.SQL.Add('                       fawithdate,        ');
                    qq2.SQL.Add('                       famiyn,            ');
                    qq2.SQL.Add('                       famifrdate,        ');
                    qq2.SQL.Add('                       famitodate,        ');
                    qq2.SQL.Add('                       famidesc,          ');
                    qq2.SQL.Add('                       mailyn,            ');
                    qq2.SQL.Add('                       writetime,         ');
                    qq2.SQL.Add('                       writeman )         ');
                    qq2.SQL.Add('              values ( :p_empno,          ');
                    qq2.SQL.Add('                       :p_korname,        ');
                    qq2.SQL.Add('                       ''A2'',            ');
                    qq2.SQL.Add('                       :p_famikind,       ');
                    qq2.SQL.Add('                       :p_facode,         ');
                    qq2.SQL.Add('                       :p_faname,         ');
                    qq2.SQL.Add('                       :p_fabirthdate,    ');
                    qq2.SQL.Add('                       :p_appdate,        ');
                    qq2.SQL.Add('                       :p_empdate,        ');
                    qq2.SQL.Add('                       ''신규입사'',      ');
                    qq2.SQL.Add('                       '''',              ');
                    qq2.SQL.Add('                       ''N'',             ');
                    qq2.SQL.Add('                       '''',              ');
                    qq2.SQL.Add('                       '''',              ');
                    qq2.SQL.Add('                       '''',              ');
                    qq2.SQL.Add('                       ''N'',             ');
                    qq2.SQL.Add('                       :p_writetime,      ');
                    qq2.SQL.Add('                       :p_writeman )      ');
                    qq2.ParamByName('p_empno').AsString       := qq.FieldByName('EMPNO').AsString;
                    qq2.ParamByName('p_korname').AsString     := qq.FieldByName('KORNAME').AsString;
                    qq2.ParamByName('p_famikind').AsString    := qq.FieldByName('FAKIND').AsString;
                    qq2.ParamByName('p_facode').AsString      := qq.FieldByName('FACODE').AsString;
                    qq2.ParamByName('p_faname').AsString      := qq.FieldByName('FANAME').AsString;
                    qq2.ParamByName('p_fabirthdate').AsString := qq.FieldByName('FABIRTHDATE').AsString;
                    qq2.ParamByName('p_appdate').AsString     := Copy(Curdate,1,8);
                    qq2.ParamByName('p_empdate').AsString     := qq.FieldByName('EMPDATE').AsString;
                    qq2.ParamByName('p_writetime').AsString   := Copy(Curdate,1,14);
                    qq2.ParamByName('p_writeman').AsString    := pempno;
                    qq2.ExecSQL;

                    qq.Next;

               end;{while}
               qq2.Free;
          end;
     Finally
          qq.Free;
     end;

     TRFlag := True;

     Phelpmsg.Caption := '  신규지급대상자 추출이 완료되었습니다...';
end;

procedure TMainForm.Seq_Work002;
var
     i: Integer;
     qq, qq2 : TOraQuery;
begin
     TRFlag := False;
     Phelpmsg.Caption := '  퇴직자를 추출합니다...';
     Application.ProcessMessages;

     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     Try
          with qq do
          begin
               Close;
               SQL.Clear;
               SQL.ADD(' select a.*, b.retdate                              ');
               SQL.ADD('   from pkmfmmas a, pkmpmas b                       ');
               SQL.ADD('  where a.empno = b.empno                           ');
               SQL.ADD('    and b.empno not like ''Y%''                     ');
               SQL.ADD('    and substr(a.appkind,1,1) = ''A''               '); {수당을 지급받고 있는자}
               SQL.ADD('    and upper(a.famiyn) = ''Y''                     ');
               SQL.ADD('    and a.famitodate is null                        ');
               SQL.ADD('    and b.retdate between :frRetdate and :toretdate ');
               ParamByName('frretdate').AsString := ME_fr.Text;
               ParamByName('toretdate').AsString := ME_to.Text;
               Open;

               Gauge1.Progress := 0;
               RCount          := 0;
               Gauge1.MaxValue := RecordCount;
               Application.ProcessMessages;

               qq2 := TOraQuery.Create(nil);
               qq2.Session := Ora_Session;

               while not Eof do
               begin
                    RCount          := Rcount + 1;
                    Gauge1.Progress := RCount;
                    Application.ProcessMessages;

                    qq2.Close;
                    qq2.SQL.Clear;
                    qq2.SQL.ADD(' select empno                        ');
                    qq2.SQL.ADD('  from pkmfmmas                      ');
                    qq2.SQL.ADD(' where empno = :p_empno              ');
                    qq2.SQL.ADD('   and substr(appkind,1,1) = ''B''   ');
                    qq2.SQL.ADD('   and faminame = :p_faminame        ');
                    qq2.ParamByName('p_empno').AsString    := qq.FieldByName('EMPNO').AsString;
                    qq2.ParamByName('p_faminame').AsString := qq.FieldByName('FAMINAME').AsString;
                    qq2.Open;

                    if qq2.RecordCount > 0 then // 이미 신청되어 있으면 건너뜀
                    begin
                         qq2.Close;
                         qq.Next;
                         Continue;
                    end;

                    Inc(cancellation);
                    L_cancellation.Caption := '['+IntToStr(cancellation)+' 명]';
                    Application.ProcessMessages;

                    qq2.Close;
                    qq2.SQL.Clear;
                    qq2.SQL.Add('insert into pkmfmmas ( empno,           ');
                    qq2.SQL.Add('                       korname,         ');
                    qq2.SQL.Add('                       appkind,         ');
                    qq2.SQL.Add('                       famikind,        ');
                    qq2.SQL.Add('                       famirel,         ');
                    qq2.SQL.Add('                       faminame,        ');
                    qq2.SQL.Add('                       famibdate,       ');
                    qq2.SQL.Add('                       appdate,         ');
                    qq2.SQL.Add('                       regdate,         ');
                    qq2.SQL.Add('                       appdesc,         ');
                    qq2.SQL.Add('                       fawithdate,      ');
                    qq2.SQL.Add('                       famiyn,          ');
                    qq2.SQL.Add('                       famifrdate,      ');
                    qq2.SQL.Add('                       famitodate,      ');
                    qq2.SQL.Add('                       famidesc,        ');
                    qq2.SQL.Add('                       mailyn,          ');
                    qq2.SQL.Add('                       writetime,       ');
                    qq2.SQL.Add('                       writeman )       ');
                    qq2.SQL.Add('              values ( :p_empno,        ');
                    qq2.SQL.Add('                       :p_korname,      ');
                    qq2.SQL.Add('                       ''B2'',          ');
                    qq2.SQL.Add('                       :p_famikind,     ');
                    qq2.SQL.Add('                       :p_famirel,      ');
                    qq2.SQL.Add('                       :p_faminame,     ');
                    qq2.SQL.Add('                       :p_famibdate,    ');
                    qq2.SQL.Add('                       :p_appdate,      ');
                    qq2.SQL.Add('                       :p_regdate,      ');
                    qq2.SQL.Add('                       ''퇴직'',        ');
                    qq2.SQL.Add('                       :p_fawithdate,   ');
                    qq2.SQL.Add('                       ''N'',           ');
                    qq2.SQL.Add('                       :p_famifrdate,   ');
                    qq2.SQL.Add('                       '''',            ');
                    qq2.SQL.Add('                       '''',            ');
                    qq2.SQL.Add('                       ''N'',           ');
                    qq2.SQL.Add('                       :p_writetime,    ');
                    qq2.SQL.Add('                       :p_writeman    ) ');
                    qq2.ParamByName('p_empno').AsString      := qq.FieldByName('EMPNO').AsString;
                    qq2.ParamByName('p_korname').AsString    := qq.FieldByName('KORNAME').AsString;
                    qq2.ParamByName('p_famikind').AsString   := qq.FieldByName('FAMIKIND').AsString;
                    qq2.ParamByName('p_famirel').AsString    := qq.FieldByName('FAMIREL').AsString;
                    qq2.ParamByName('p_faminame').AsString   := qq.FieldByName('FAMINAME').AsString;
                    qq2.ParamByName('p_famibdate').AsString  := qq.FieldByName('FAMIBDATE').AsString;
                    qq2.ParamByName('p_appdate').AsString    := Copy(Curdate,1,8);
                    qq2.ParamByName('p_regdate').AsString    := qq.FieldByName('RETDATE').AsString;
                    qq2.ParamByName('p_fawithdate').AsString := qq.FieldByName('FAWITHDATE').AsString;
                    qq2.ParamByName('p_famifrdate').AsString := qq.FieldByName('FAMIFRDATE').AsString;
                    qq2.ParamByName('p_writetime').AsString  := Copy(Curdate,1,14);
                    qq2.ParamByName('p_writeman').AsString   := pempno;
                    qq2.ExecSQL;

                    qq.Next;
               end;
               qq2.Free;
          end;
     Finally
          qq.Free;
     end;

     TRFlag := True;

     Phelpmsg.Caption := '  퇴직자 가족수당 자동해지가 완료되었습니다...';
end;

procedure TMainForm.Seq_Work003;
var
     mm, i   : Integer;
     baseday : String;
     qq, qq2 : TOraQuery;
begin
     TRFlag := False;

     Phelpmsg.Caption := '  직계비속 연령제한자를 추출합니다....';
     Application.ProcessMessages;

     baseday := ME_Day.Text + '01';

     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     Try
          with qq do
          begin
               Close;
               SQL.Clear;
               SQL.ADD(' select a.*                                                                      ');
               SQL.ADD('   from pkmfmmas a, pkmpmas b                                                    ');
               SQL.ADD('  where a.empno = b.empno                                                        ');  {가족구분 비속(C) }
               SQL.ADD('    and b.pstate < ''80''                                                        ');
               SQL.ADD('    and famikind = ''C''                                                         ');  {가족구분 비속(C) }
               SQL.ADD('    and substr(appkind,1,1) = ''A''                                              ');  {수당을 지급받고 있는자}
               SQL.ADD('    and upper(famiyn) = ''Y''                                                    ');
               SQL.ADD('    and famitodate is null                                                       ');
               SQL.ADD('    and (months_between(to_date(:baseday,''yyyymmdd''),                          ');
               SQL.ADD('                        to_date(famibdate,''yyyymmdd'')) / 12) > :p_childmaxage  ');
               ParamByName('baseday').AsString        := Baseday;
               ParamByName('P_childmaxage').AsInteger := F_childmaxage;
               Open;

               Gauge1.Progress := 0;
               RCount          := 0;
               Gauge1.MaxValue := RecordCount;
               Application.ProcessMessages;

               qq2 := TOraQuery.Create(nil);
               qq2.Session := Ora_session;

               while not Eof do
               begin
                    RCount          := Rcount + 1;
                    Gauge1.Progress := RCount;
                    Application.ProcessMessages;

                    qq2.SQL.Clear;
                    qq2.SQL.ADD(' select empno                        ');
                    qq2.SQL.ADD('   from pkmfmmas                     ');
                    qq2.SQL.ADD('  where empno    = :p_empno          ');
                    qq2.SQL.ADD('    and appkind  = ''B2''            ');
                    qq2.SQL.ADD('    and faminame = :p_faminame       ');
                    qq2.ParamByName('p_empno').AsString    := qq.FieldByName('EMPNO').AsString;
                    qq2.ParamByName('p_faminame').AsString := qq.FieldByName('FAMINAME').AsString;
                    qq2.Open;

                    if qq2.RecordCount > 0 then // 이미 신청되어 있으면 건너뜀
                    begin
                         qq.Next;
                         Continue;
                    end;

                    Inc(cancellation);
                    L_cancellation.Caption := '['+IntToStr(cancellation)+' 명]';
                    Application.ProcessMessages;

                    i := StrToIntDef(Copy(FieldByName('FAMIBDATE').AsString,1,4),0) + 20;  {+20년}

                    qq2.Close;
                    qq2.SQL.Clear;
                    qq2.SQL.Add('insert into pkmfmmas ( empno,             ');
                    qq2.SQL.Add('                       korname,           ');
                    qq2.SQL.Add('                       appkind,           ');
                    qq2.SQL.Add('                       famikind,          ');
                    qq2.SQL.Add('                       famirel,           ');
                    qq2.SQL.Add('                       faminame,          ');
                    qq2.SQL.Add('                       famibdate,         ');
                    qq2.SQL.Add('                       appdate,           ');
                    qq2.SQL.Add('                       regdate,           ');
                    qq2.SQL.Add('                       appdesc,           ');
                    qq2.SQL.Add('                       fawithdate,        ');
                    qq2.SQL.Add('                       famiyn,            ');
                    qq2.SQL.Add('                       famifrdate,        ');
                    qq2.SQL.Add('                       famitodate,        ');
                    qq2.SQL.Add('                       famidesc,          ');
                    qq2.SQL.Add('                       mailyn,            ');
                    qq2.SQL.Add('                       writetime,         ');
                    qq2.SQL.Add('                       writeman    )      ');
                    qq2.SQL.Add('              values ( :p_empno,          ');
                    qq2.SQL.Add('                       :p_korname,        ');
                    qq2.SQL.Add('                       ''B2'',            ');
                    qq2.SQL.Add('                       :p_famikind,       ');
                    qq2.SQL.Add('                       :p_famirel,        ');
                    qq2.SQL.Add('                       :p_faminame,       ');
                    qq2.SQL.Add('                       :p_famibdate,      ');
                    qq2.SQL.Add('                       :p_appdate,        ');
                    qq2.SQL.Add('                       :p_regdate,        ');
                    qq2.SQL.Add('                       ''연령초과'',      ');
                    qq2.SQL.Add('                       :p_fawithdate,     ');
                    qq2.SQL.Add('                       ''N'',             ');
                    qq2.SQL.Add('                       :p_famifrdate,     ');
                    qq2.SQL.Add('                       '''',              ');
                    qq2.SQL.Add('                       '''',              ');
                    qq2.SQL.Add('                       ''N'',             ');
                    qq2.SQL.Add('                       :p_writetime,      ');
                    qq2.SQL.Add('                       :p_writeman   )    ');
                    qq2.ParamByName('p_empno').AsString       := qq.FieldByName('EMPNO').AsString;
                    qq2.ParamByName('p_korname').AsString     := qq.FieldByName('KORNAME').AsString;
                    qq2.ParamByName('p_famikind').AsString    := qq.FieldByName('FAMIKIND').AsString;
                    qq2.ParamByName('p_famirel').AsString     := qq.FieldByName('FAMIREL').AsString;
                    qq2.ParamByName('p_faminame').AsString    := qq.FieldByName('FAMINAME').AsString;
                    qq2.ParamByName('p_famibdate').AsString   := qq.FieldByName('FAMIBDATE').AsString;
                    qq2.ParamByName('p_appdate').AsString     := Copy(Curdate,1,8);
                    qq2.ParamByName('p_regdate').AsString     := IntToStr(i)+Copy(FieldByName('FAMIBDATE').AsString,5,4);
                    qq2.ParamByName('p_fawithdate').AsString  := qq.FieldByName('FAWITHDATE').AsString;
                    qq2.ParamByName('p_famifrdate').AsString  := qq.FieldByName('FAMIFRDATE').AsString;
                    qq2.ParamByName('p_writetime').AsString   := Copy(Curdate,1,14);
                    qq2.ParamByName('p_writeman').AsString    := pempno;

                    qq2.ExecSQL;

                    qq.Next;
               end;
               qq2.Free;
          end;
     Finally
          qq.Free;
     end;

     TRFlag := True;

     Phelpmsg.Caption := '  직계비속 연령제한자 추출이 완료되었습니다...';
end;

procedure TMainForm.Seq_Work004;
var
     qq, qq2 : TOraQuery;
begin
     TRFlag := False;

     Phelpmsg.Caption := '  가족화일 자료에 등록되어 있지 않은 자료를 추출합니다...';
     Application.ProcessMessages;

     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     Try
          with qq do
          begin
               Close;
               SQL.Clear;
{
               SQL.ADD('select *                                     ');
               SQL.ADD('  from pkmfmmas                              ');
               SQL.ADD(' where substr(appkind,1,1) = ''A''           ');  //수당을 지급받고 있는자
               SQL.ADD('   and famiyn = ''Y''                        ');
               SQL.ADD('   and famitodate is null                    ');
               SQL.ADD(' minus                                       ');
               SQL.ADD('select a.*                                   '); //가족화일과 일치하는 자료
               SQL.ADD('  from pkmfmmas a, pimfami b                 ');
               SQL.ADD(' where substr(a.appkind,1,1) = ''A''         ');
               SQL.ADD('   and a.famiyn = ''Y''                      ');
               SQL.ADD('   and a.famitodate is null                  ');
               SQL.ADD('   and a.empno     = b.empno                 ');
               SQL.ADD('   and a.faminame  = b.faname                ');
 }
               SQL.ADD(' select a.*                                  ');
               SQL.ADD('  from pkmfmmas a, pimfami b, pkmpmas c      ');
               SQL.ADD(' where a.empno     = b.empno(+)              ');
               SQL.ADD('   and a.empno     = c.empno                 ');
               SQL.ADD('   and a.faminame  = b.faname(+)             ');
               SQL.ADD('   and b.empno is null                       ');
               SQL.ADD('   and c.pstate < ''80''                     ');
               SQL.ADD('   and substr(a.appkind,1,1) = ''A''         ');
               SQL.ADD('   and a.famiyn = ''Y''                      ');
               SQL.ADD('   and a.famitodate is null                  ');
               Open;

               Gauge1.Progress := 0;
               RCount          := 0;
               Gauge1.MaxValue := RecordCount;
               Application.ProcessMessages;

               qq2 := TOraQuery.Create(nil);
               qq2.Session := Ora_Session;

               while not Eof do
               begin
                    RCount          := Rcount + 1;
                    Gauge1.Progress := RCount;
                    Application.ProcessMessages;

                    qq2.SQL.Clear;
                    qq2.SQL.ADD(' select empno                          ');
                    qq2.SQL.ADD(' from pkmfmmas                         ');
                    qq2.SQL.ADD(' where empno      = :p_empno           ');
                    qq2.SQL.ADD('   and appkind    = ''B2''             ');
                    qq2.SQL.ADD('   and faminame   = :p_faminame        ');
                    qq2.SQL.ADD('   and famibdate  = :p_famibdate       ');
                    qq2.ParamByName('p_empno').AsString     := qq.FieldByName('EMPNO').AsString;
                    qq2.ParamByName('p_faminame').AsString  := qq.FieldByName('FAMINAME').AsString;
                    qq2.ParamByName('p_famibdate').AsString := qq.FieldByName('FAMIBDATE').AsString;
                    qq2.Open;

                    if qq2.RecordCount > 0 then // 이미 신청되어 있으면 건너뜀
                    begin
                         qq.Next;
                         Continue;
                    end;

                    Inc(cancellation);
                    L_cancellation.Caption := '['+IntToStr(cancellation)+' 명]';
                    Application.ProcessMessages;

                    qq2.Close;
                    qq2.SQL.Clear;
                    qq2.SQL.Add('insert into pkmfmmas ( empno,              ');
                    qq2.SQL.Add('                       korname,            ');
                    qq2.SQL.Add('                       appkind,            ');
                    qq2.SQL.Add('                       famikind,           ');
                    qq2.SQL.Add('                       famirel,            ');
                    qq2.SQL.Add('                       faminame,           ');
                    qq2.SQL.Add('                       famibdate,          ');
                    qq2.SQL.Add('                       appdate,            ');
                    qq2.SQL.Add('                       regdate,            ');
                    qq2.SQL.Add('                       appdesc,            ');
                    qq2.SQL.Add('                       fawithdate,         ');
                    qq2.SQL.Add('                       famiyn,             ');
                    qq2.SQL.Add('                       famifrdate,         ');
                    qq2.SQL.Add('                       famitodate,         ');
                    qq2.SQL.Add('                       famidesc,           ');
                    qq2.SQL.Add('                       mailyn,             ');
                    qq2.SQL.Add('                       writetime,          ');
                    qq2.SQL.Add('                       writeman    )       ');
                    qq2.SQL.Add('              values ( :p_empno,           ');
                    qq2.SQL.Add('                       :p_korname,         ');
                    qq2.SQL.Add('                       ''B2'',             ');
                    qq2.SQL.Add('                       :p_famikind,        ');
                    qq2.SQL.Add('                       :p_famirel,         ');
                    qq2.SQL.Add('                       :p_faminame,        ');
                    qq2.SQL.Add('                       :p_famibdate,       ');
                    qq2.SQL.Add('                       :p_appdate,         ');
                    qq2.SQL.Add('                       :p_regdate,         ');
                    qq2.SQL.Add('                       ''가족자료 삭제'',  ');
                    qq2.SQL.Add('                       :p_fawithdate,      ');
                    qq2.SQL.Add('                       ''N'',              ');
                    qq2.SQL.Add('                       :p_famifrdate,      ');
                    qq2.SQL.Add('                       '''',               ');
                    qq2.SQL.Add('                       '''',               ');
                    qq2.SQL.Add('                       ''N'',              ');
                    qq2.SQL.Add('                       :p_writetime,       ');
                    qq2.SQL.Add('                       :p_writeman    )    ');
                    qq2.ParamByName('p_EMPNO').AsString      := qq.FieldByName('EMPNO').AsString;
                    qq2.ParamByName('p_KORNAME').AsString    := qq.FieldByName('KORNAME').AsString;
                    qq2.ParamByName('p_FAMIKIND').AsString   := qq.FieldByName('FAMIKIND').AsString;
                    qq2.ParamByName('p_FAMIREL').AsString    := qq.FieldByName('FAMIREL').AsString;
                    qq2.ParamByName('p_FAMINAME').AsString   := qq.FieldByName('FAMINAME').AsString;
                    qq2.ParamByName('p_FAMIBDATE').AsString  := qq.FieldByName('FAMIBDATE').AsString;
                    qq2.ParamByName('p_APPDATE').AsString    := Copy(Curdate,1,8);
                    qq2.ParamByName('p_REGDATE').AsString    := Copy(Curdate,1,8);
                    qq2.ParamByName('p_FAWITHDATE').AsString := qq.FieldByName('FAWITHDATE').AsString;
                    qq2.ParamByName('p_FAMIFRDATE').AsString := qq.FieldByName('FAMIFRDATE').AsString;
                    qq2.ParamByName('p_WRITETIME').AsString  := Copy(Curdate,1,14);
                    qq2.ParamByName('p_WRITEMAN').AsString   := Pempno;
                    qq2.ExecSQL;

                    qq.Next;
               end;
               qq2.Free;
          end;
     Finally
          qq.Free;
     end;

     TRFlag := True;

     Phelpmsg.Caption := '  가족화일 자료에 등록되어 있지 않은 자료추출이 완료되었습니다...';
end;

procedure TMainForm.Seq_Work005;
var
     qq, qq2 : TOraQuery;
begin
     TRFlag := False;

     Phelpmsg.Caption := '  존속 비동거 자료를 추출합니다...';
     Application.ProcessMessages;

     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     Try
          with qq do
          begin
               Close;
               SQL.Clear;
{
               SQL.ADD(' select a.*                                  ');
               SQL.ADD('   from pkmfmmas a, pkmpmas b                ');
               SQL.ADD('  where a.empno = b.empno                    ');
               SQL.ADD('    and substr(a.appkind,1,1) = ''A''        '); //수당을 지급받고 있는자
               SQL.ADD('    and upper(a.famiyn) = ''Y''              ');
               SQL.ADD('    and a.famitodate is null                 ');
               SQL.ADD('    and a.famikind = ''B''                   ');  //가족구분 존속(B)
               SQL.ADD('    and upper(b.firstyn) = ''N''             ');   //장남여부 'N'
}
               SQL.ADD(' select a.*                                  ');
               SQL.ADD('   from pkmfmmas a, pkmpmas b, pimfami c     ');
               SQL.ADD('  where a.empno = b.empno                    ');
               SQL.ADD('    and a.empno = c.empno                    ');
               SQL.ADD('    and b.empno not like ''Y%''              ');
               SQL.ADD('    and b.pstate < ''80''                    ');                              
               SQL.ADD('    and a.faminame = c.faname                ');
               SQL.ADD('    and substr(a.appkind,1,1) = ''A''        ');  //수당을 지급받고 있는자
               SQL.ADD('    and upper(a.famiyn) = ''Y''              ');
               SQL.ADD('    and a.famitodate is null                 ');
               SQL.ADD('    and a.famikind = ''B''                   ');  //가족구분 존속(B)
               SQL.ADD('    and upper(b.firstyn) = ''N''             ');  //장남여부 'N'
               SQL.ADD('    and NVL(c.fawith,''N'') = ''N''          ');  //가족테이블상의 비동거
               Open;

               Gauge1.Progress := 0;
               RCount          := 0;
               Gauge1.MaxValue := RecordCount;
               Application.ProcessMessages;

               qq2 := TOraQuery.Create(nil);
               qq2.Session := Ora_Session;

               while not Eof do
               begin
                    RCount          := Rcount + 1;
                    Gauge1.Progress := RCount;
                    Application.ProcessMessages;

                    qq2.SQL.Clear;
                    qq2.SQL.ADD(' select empno                           ');
                    qq2.SQL.ADD('   from pkmfmmas                        ');
                    qq2.SQL.ADD('  where empno      = :p_empno           ');
                    qq2.SQL.ADD('    and appkind    = ''B2''             ');
                    qq2.SQL.ADD('    and faminame   = :p_faminame        ');
                    qq2.SQL.ADD('    and famibdate  = :p_famibdate       ');
                    qq2.ParamByName('p_empno').AsString     := qq.FieldByName('EMPNO').AsString;
                    qq2.ParamByName('p_faminame').AsString  := qq.FieldByName('FAMINAME').AsString;
                    qq2.ParamByName('p_famibdate').AsString := qq.FieldByName('FAMIBDATE').AsString;
                    qq2.Open;

                    if qq2.RecordCount > 0 then // 이미 신청되어 있으면 건너뜀
                    begin
                         qq.Next;
                         Continue;
                    end;

                    Inc(cancellation);
                    L_cancellation.Caption := '['+IntToStr(cancellation)+' 명]';
                    Application.ProcessMessages;

                    qq2.Close;
                    qq2.SQL.Clear;
                    qq2.SQL.Add('insert into pkmfmmas ( empno,                ');
                    qq2.SQL.Add('                       korname,              ');
                    qq2.SQL.Add('                       appkind,              ');
                    qq2.SQL.Add('                       famikind,             ');
                    qq2.SQL.Add('                       famirel,              ');
                    qq2.SQL.Add('                       faminame,             ');
                    qq2.SQL.Add('                       famibdate,            ');
                    qq2.SQL.Add('                       appdate,              ');
                    qq2.SQL.Add('                       regdate,              ');
                    qq2.SQL.Add('                       appdesc,              ');
                    qq2.SQL.Add('                       fawithdate,           ');
                    qq2.SQL.Add('                       famiyn,               ');
                    qq2.SQL.Add('                       famifrdate,           ');
                    qq2.SQL.Add('                       famitodate,           ');
                    qq2.SQL.Add('                       famidesc,             ');
                    qq2.SQL.Add('                       mailyn,               ');
                    qq2.SQL.Add('                       writetime,            ');
                    qq2.SQL.Add('                       writeman     )        ');
                    qq2.SQL.Add('              values ( :p_empno,             ');
                    qq2.SQL.Add('                       :p_korname,           ');
                    qq2.SQL.Add('                       ''B2'',               ');
                    qq2.SQL.Add('                       :p_famikind,          ');
                    qq2.SQL.Add('                       :p_famirel,           ');
                    qq2.SQL.Add('                       :p_faminame,          ');
                    qq2.SQL.Add('                       :p_famibdate,         ');
                    qq2.SQL.Add('                       :p_appdate,           ');
                    qq2.SQL.Add('                       :p_regdate,           ');
                    qq2.SQL.Add('                       ''존속 비동거'',      ');
                    qq2.SQL.Add('                       :p_fawithdate,        ');
                    qq2.SQL.Add('                       ''N'',                ');
                    qq2.SQL.Add('                       :p_famifrdate,        ');
                    qq2.SQL.Add('                       '''',                 ');
                    qq2.SQL.Add('                       '''',                 ');
                    qq2.SQL.Add('                       ''N'',                ');
                    qq2.SQL.Add('                       :p_writetime,         ');
                    qq2.SQL.Add('                       :p_writeman     )     ');                       
                    qq2.ParamByName('p_EMPNO').AsString      := qq.FieldByName('EMPNO').AsString;
                    qq2.ParamByName('p_KORNAME').AsString    := qq.FieldByName('KORNAME').AsString;
                    qq2.ParamByName('p_FAMIKIND').AsString   := qq.FieldByName('FAMIKIND').AsString;
                    qq2.ParamByName('p_FAMIREL').AsString    := qq.FieldByName('FAMIREL').AsString;
                    qq2.ParamByName('p_FAMINAME').AsString   := qq.FieldByName('FAMINAME').AsString;
                    qq2.ParamByName('p_FAMIBDATE').AsString  := qq.FieldByName('FAMIBDATE').AsString;
                    qq2.ParamByName('p_APPDATE').AsString    := Copy(Curdate,1,8);
                    qq2.ParamByName('p_REGDATE').AsString    := Copy(Curdate,1,8);
                    qq2.ParamByName('p_FAWITHDATE').AsString := qq.FieldByName('FAWITHDATE').AsString;
                    qq2.ParamByName('p_FAMIFRDATE').AsString := qq.FieldByName('FAMIFRDATE').AsString;
                    qq2.ParamByName('p_WRITETIME').AsString  := Copy(Curdate,1,14);
                    qq2.ParamByName('p_WRITEMAN').AsString   := Pempno;
                    qq2.ExecSQL;

                    qq.Next;
               end;
               qq2.Free;
          end;
     Finally
          qq.Free;
     end;

     TRFlag := True;

     Phelpmsg.Caption := '  존속 비동거 자료추출이 완료되었습니다...';
end;

procedure TMainForm.Seq_Work006;
var
     Inwon, over: Integer;
     LogoF: TextFile;
     AppkindName: string;
     CmdLine: array[0..255] of Char;
     qq : TOraQuery;
begin
     {$I-}

     if not FileCtrl.DirectoryExists(HomeDir+'\LIST') then
          MkDir(HomeDir+'\LIST');

     AssignFile(LogoF, HomeDir+'\LIST\pkg1050g.err');

     ReWrite(LogoF);
     if IOResult <> 0 then
     begin
          MessageDlg('에러출력화일(Logo file) 생성에러', mtWarning, [mbOk], 0);
          System.Exit;
     end;

     WriteLn(LogoF, '**************************************************************************');
     WriteLn(LogoF, '          프로그램 : 가족수당 지급/해지자 자동추출');
     WriteLn(LogoF, ' 오류LIST 작업화일 : '+HomeDir+'\LIST\pkg1050g.err');
     WriteLn(LogoF, '          작업일자 : '+ Copy(CurDate, 1, 4)+'.'+Copy(CurDate, 5, 2)+'.'+Copy(CurDate, 7, 2)+' '+
                                             Copy(CurDate, 9, 2)+':'+Copy(CurDate, 11, 2)+':'+Copy(CurDate, 13, 2));
     WriteLn(LogoF, '          작 업 자 : '+L_UserName.Caption);
     WriteLn(LogoF, '**************************************************************************');

     Phelpmsg.Caption := '  가족구분별 수당지급 제한수 초과자를 추출합니다. ';
     Application.ProcessMessages;

     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     Try
          with qq do
          begin
               Close;
               SQL.Clear;
{
               SQL.ADD(' select empno, korname, famikind, count(empno) kind_cnt ');
               SQL.ADD('   from pkmfmmas                                        ');
               SQL.ADD('  where substr(appkind,1,1) = ''A''                     ');  //수당을 지급받고 있는자
               SQL.ADD('    and famiyn = ''Y''                                  ');
               SQL.ADD('    and famitodate is null                              ');
               SQL.ADD('  group by empno, korname, famikind                     ');
               SQL.ADD('  order by empno, famikind                              ');
 }
               SQL.ADD(' select b.empno, b.korname, a.famikind, count(b.empno) kind_cnt  ');
               SQL.ADD('  from pkmfmmas a, pkmpmas b                                     ');
               SQL.ADD(' where a.empno = b.empno                                         ');
               SQL.ADD('   and b.pstate < ''80''                                         ');
               SQL.ADD('   and substr(appkind,1,1) = ''A''                               ');
               SQL.ADD('   and famiyn = ''Y''                                            ');
               SQL.ADD('   and famitodate is null                                        ');
               SQL.ADD(' group by b.empno, b.korname, a.famikind                         ');
               SQL.ADD(' order by b.empno, a.famikind                                    ');
               Open;
               Application.ProcessMessages;

               over := 0;
               Gauge1.Progress := 0;
               RCount          := 0;
               Gauge1.MaxValue := RecordCount;
               Application.ProcessMessages;

               while not Eof do
               begin
                    RCount          := Rcount + 1;
                    Gauge1.Progress := RCount;
                    Application.ProcessMessages;

                    if FieldByName('FAMIKIND').AsString = 'A' then {제한인원}
                    begin
                         Inwon := F_matecnt;
                         AppkindName := '배우자';
                    end
                    else if FieldByName('FAMIKIND').AsString = 'B' then
                    begin
                         Inwon := F_parentcnt;
                         AppkindName := '존  속';
                    end
                    else if FieldByName('FAMIKIND').AsString = 'C' then
                    begin
                         Inwon := F_childcnt;
                         AppkindName := '비  속';
                    end;

                    if FieldByName('kind_cnt').AsInteger > Inwon then
                    begin
                         Inc(over);
                         L_over.Caption := '['+IntToStr(over)+' 명]';
                         WriteLn(LogoF, '['+Format('%.4d',[over])+'] : '+
                                                   FieldByName('EMPNO').AsString+'('+
                                                   FieldByName('KORNAME').AsString+'),  '+
                                                   AppkindName+',  '+
                                                   IntToStr(FieldByName('kind_cnt').AsInteger)+'(+'+
                                                   IntToStr(FieldByName('kind_cnt').AsInteger - Inwon)+')');
                         {error}
                    end;
                    Next;
               end;

               WriteLn(LogoF, '');
               WriteLn(LogoF, '**************************************************************************');
               WriteLn(LogoF, ' 읽은건수 : '+IntToStr(RecordCount));
               WriteLn(LogoF, ' 오류건수 : '+IntToStr(Over));
               CloseFile(LogoF);
               {$I+}
          end;
     Finally
          qq.Free;
     end;

     if over > 0 then
     begin
          StrPcopy(CmdLine, 'notepad '+HomeDir+'\LIST\pkg1050g.err');
          Winexec(CmdLine, SW_MAXIMIZE);
     end;

     Phelpmsg.Caption := '  가족구분별 수당지급 제한수 초과자 추출이 완료되었습니다...';
     Application.ProcessMessages;
end;

procedure TMainForm.BB_pimfamiClick(Sender: TObject);
var
     qq : TOraQuery;
begin
     Phelpmsg.Caption := '  가족구분이 정확하지 않은 자료를 검사하고 있습니다.';
     Application.ProcessMessages;

     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     Try
          with qq do
          begin
               Close;
               SQL.Clear;
               SQL.ADD(' select empno, facode, faname                                     ');
               SQL.ADD('   from pimfami                                                   ');
               SQL.ADD('  where nvl(fakind,'' '') not in (''A'',''B'',''C'',''D'',''Z'')  ');
               Open;

               if RecordCount = 0 then
               begin
                    Phelpmsg.Caption := '';
                    MessageDlg('가족구분코드가 전부 정상적으로 등록되어 있습니다.',
                               mtInformation, [mbYes], 0);
                    System.Exit;
               end;

               if MessageDlg('가족구분에 오류가 있는 자료가 '+IntToStr(RecordCount)+' 건 있습니다'+#13#10+
                             '일괄갱신 하겠습니까 ?',
                  mtInformation, [mbYes, mbNo], 0) <> mrYes then
               begin
                    Phelpmsg.Caption := '';
                    System.Exit;
               end;


               Phelpmsg.Caption := '  자료를 갱신하고 있습니다.';
               Application.ProcessMessages;
               Close;
               SQL.Clear;
               SQL.ADD('update pimfami                                                   ');
               SQL.ADD('   set fakind = decode(facode,                                   ');
               SQL.ADD('                       ''00'',''D'',                             '); {본인}
               SQL.ADD('                       ''01'',''D'',                             ');
               SQL.ADD('                       ''02'',''D'',                             ');
               SQL.ADD('                       ''30'',''A'',                             '); {배우자}
               SQL.ADD('                       ''31'',''A'',                             ');
               SQL.ADD('                       ''32'',''A'',                             ');
               SQL.ADD('                       ''10'',''B'',                             '); {존속}
               SQL.ADD('                       ''11'',''B'',                             ');
               SQL.ADD('                       ''12'',''B'',                             ');
               SQL.ADD('                       ''13'',''B'',                             ');
               SQL.ADD('                       ''14'',''B'',                             ');
               SQL.ADD('                       ''20'',''B'',                             ');
               SQL.ADD('                       ''21'',''B'',                             ');
               SQL.ADD('                       ''22'',''B'',                             ');
               SQL.ADD('                       ''91'',''B'',                             ');
               SQL.ADD('                       ''92'',''B'',                             ');
               SQL.ADD('                       ''95'',''B'',                             ');
               SQL.ADD('                       ''96'',''B'',                             ');
               SQL.ADD('                       ''40'',''C'',                             '); {비속}
               SQL.ADD('                       ''41'',''C'',                             ');
               SQL.ADD('                       ''42'',''C'',                             ');
               SQL.ADD('                       ''50'',''C'',                             ');
               SQL.ADD('                       ''51'',''C'',                             ');
               SQL.ADD('                       ''52'',''C'',                             ');
               SQL.ADD('                       ''55'',''C'',                             ');
               SQL.ADD('                       ''56'',''C'',                             ');
               SQL.ADD('                       ''Z'')                                    '); {기타}
               SQL.ADD(' where nvl(fakind,'' '') not in (''A'',''B'',''C'',''D'',''Z'')  ');
               ExecSQL;
               Phelpmsg.Caption := '  갱신작업을 완료했습니다.';
          end;
     Finally
          qq.Free;
     end;
end;

end.
