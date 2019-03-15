
unit pkg10301;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ComCtrls, Tabnotbk, DB, DBTables, StdCtrls, Buttons, Grids,
  DBGrids, Mask, FileCtrl, 
  TimeFtp, Pass, DateLib, Calen1, FormMon1, Kylib1, MemDS, DBAccess, Ora, Func; //Calen2,->FormMon1

type
  TMainForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Phelpmsg: TPanel;
    DataSource1: TDataSource;
    Panel4: TPanel;
    DBGrid1: TDBGrid;
    L_UserName: TLabel;
    L_Curdate: TLabel;
    BBexit: TBitBtn;
    P_contentdate: TPanel;
    ME_contentdate: TMaskEdit;
    SB_contentdate: TSpeedButton;
    BB_BatchProvide: TBitBtn;
    BB_IndividualProvide: TBitBtn;
    Panel11: TPanel;
    ME_appdateFROM: TMaskEdit;
    SB_appdateFROM: TSpeedButton;
    ME_appdateTO: TMaskEdit;
    SB_appdateTO: TSpeedButton;
    Label1: TLabel;
    Panel3: TPanel;
    P_sort: TPanel;
    RB_provide: TRadioButton;
    RB_cancellation: TRadioButton;
    Panel9: TPanel;
    P_process: TPanel;
    RB_proY: TRadioButton;
    RB_proN: TRadioButton;
    BB_BatchCancellation: TBitBtn;
    BB_IndividualCancellation: TBitBtn;
    BB_delete: TBitBtn;
    BB_LookUp: TBitBtn;
    GroupBox1: TGroupBox;
    E_Con1: TEdit;
    E_Con2: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    BB_ToMaster: TBitBtn;
    RB_proAll: TRadioButton;
    BB_Print: TBitBtn;
    Query_fmmas: TOraQuery;
    Query_fmmasEMPNO: TStringField;
    Query_fmmasKORNAME: TStringField;
    Query_fmmasAPPKIND: TStringField;
    Query_fmmasFIRSTYN: TStringField;
    Query_fmmasMATEEMPNO: TStringField;
    Query_fmmasFAMIKIND: TStringField;
    Query_fmmasFAMIREL: TStringField;
    Query_fmmasFAMINAME: TStringField;
    Query_fmmasFAMIBDATE: TStringField;
    Query_fmmasAPPDATE: TStringField;
    Query_fmmasREGDATE: TStringField;
    Query_fmmasAPPDESC: TStringField;
    Query_fmmasFAWITHDATE: TStringField;
    Query_fmmasFAMIYN: TStringField;
    Query_fmmasFAMIFRDATE: TStringField;
    Query_fmmasFAMITODATE: TStringField;
    Query_fmmasFAMIDESC: TStringField;
    Query_fmmasMAILYN: TStringField;
    Query_fmmasROWNUM: TFloatField;
    Query_fmmasAGE: TFloatField;
    Query_fmmasMCPAMT: TFloatField;
    Query_fmmasAPPKINDNAME: TStringField;
    Query_fmmasFAMIKINDNAME: TStringField;
    Query_fmmasFAMIRELNAME: TStringField;
    Panel5: TPanel;
    Panel6: TPanel;
    RB_stateY: TRadioButton;
    RB_stateN: TRadioButton;
    RB_stateAll: TRadioButton;

    procedure FormActivate(Sender: TObject);
    procedure BBexitClick(Sender: TObject);
    procedure Query_fmmasCalcFields(DataSet: TDataSet);
    procedure SB_contentdateClick(Sender: TObject);
    procedure ME_contentdateChange(Sender: TObject);
    procedure BB_BatchProvideClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure E_Con1KeyPress(Sender: TObject; var Key: Char);
    procedure SB_appdateFROMClick(Sender: TObject);
    procedure SB_appdateTOClick(Sender: TObject);
    procedure ME_appdateFROMKeyPress(Sender: TObject; var Key: Char);
    procedure BB_IndividualProvideClick(Sender: TObject);
    procedure BB_IndividualCancellationClick(Sender: TObject);
    procedure BB_BatchCancellationClick(Sender: TObject);
    procedure BB_deleteClick(Sender: TObject);
    procedure BB_LookUpClick(Sender: TObject);
    procedure E_Con1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BB_ToMasterClick(Sender: TObject);
    procedure BB_PrintClick(Sender: TObject);
    procedure DBGrid1ColEnter(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
  private
    procedure Update_Query;
    procedure Cancellation_proc(Individual: Boolean);
    Procedure FindEmp(value1, value2 : String);
    function  Provide_proc: String;
    { Private declarations }
  public
    Start   : Integer;
    Curdate : String;
    HomeDir: String;
    { Public declarations }
  end;

var
  MainForm: TMainForm;
  Running: Boolean;
  F_mateamt, F_childamt, F_parentamt: Real;
  F_matecnt, F_childcnt, F_parentcnt: Integer;
  F_parentminage, F_childmaxage, F_togethermm: Integer;
  mm, sex: Integer;

  CodeString: TStringList; {codeno list}
  DataString: TStringList; {codename list}

implementation
{$R *.DFM}

uses pkg10304;

procedure TMainForm.FormActivate(Sender: TObject);
var
     qq : TOraQuery;
begin
     if Running then System.Exit;
     Running := True;
     Phelpmsg.Caption := '  초기자료를 읽고 있습니다.';
     Application.ProcessMessages;

     OraConnect;

     L_UserName.Caption := Pkorname + '(' +pempno+ ')';

     Curdate := fn_GetDateTimeStr;
     L_Curdate.Caption  := fn_GetDateStr;

     HomeDir  := HomeDirOpen;

     ME_appdateFROM.Text := Copy(Curdate,1,6)+'01';
     ME_appdateTO.Text   := Copy(Curdate,1,8);

     Query_fmmas.Session := Ora_Session;

     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     Try
          with qq do
          begin
               Close;
               SQL.Clear;
               SQL.Add('select * from pkcfmbas ');
               Open;
               if RecordCount > 0 then
               begin
                    F_mateamt      := FieldByName('MATEAMT').AsInteger;
                    F_childamt     := FieldByName('CHILDAMT').AsInteger;
                    F_parentamt    := FieldByName('PARENTAMT').AsInteger;

                    F_matecnt      := FieldByName('MATECNT').AsInteger;
                    F_childcnt     := FieldByName('CHILDCNT').AsInteger;
                    F_parentcnt    := FieldByName('PARENTCNT').AsInteger;

                    F_parentminage := FieldByName('PARENTMINAGE').AsInteger;
                    F_childmaxage  := FieldByName('CHILDMAXAGE').AsInteger;
                    F_togethermm   := FieldByName('TOGETHERMM').AsInteger;
               end
               else
               begin
                    F_mateamt      := 0;
                    F_childamt     := 0;
                    F_parentamt    := 0;
                    F_matecnt      := 0;
                    F_childcnt     := 0;
                    F_parentcnt    := 0;
                    F_parentminage := 0;
                    F_childmaxage  := 0;
                    F_togethermm   := 0;
               end;
          end;
     Finally
          qq.Free;
     end;

     Phelpmsg.Caption := '';

     Update_Query;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
     Start := 0;
     Running := False;
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
     begin
          CodeString.free;
          DataString.free;
          Action := caFree;
     end
     else
     begin
          Action := caNone;
     end;
end;

Procedure TMainForm.Update_Query;
begin
     if RB_provide.Checked then {신청구분 = '지급신청'}
          P_contentdate.Caption := '지급개시월'
     else
          P_contentdate.Caption := '해지월';

     if RB_proY.Checked then {처리구분 = '처리'}
     begin
          BB_BatchProvide.Enabled           := False;
          BB_IndividualProvide.Enabled      := False;
          BB_delete.Enabled                 := False;
          BB_BatchCancellation.Enabled      := True;
          BB_IndividualCancellation.Enabled := True;
     end
     else
     begin
          BB_BatchProvide.Enabled           := True;
          BB_IndividualProvide.Enabled      := True;
          BB_delete.Enabled                 := True;
          BB_BatchCancellation.Enabled      := False;
          BB_IndividualCancellation.Enabled := False;
     end;

     Phelpmsg.Caption := '  자료를 조회중입니다.';
     Application.ProcessMessages;

     with Query_fmmas do
     begin
          Close;
          SQL.Clear;
          SQL.Add('select a.empno,                                        ');
          SQL.Add('       a.korname,                                      ');
          SQL.Add('       (select codename from pyccode                   ');
          SQL.Add('         where codeid = ''K411''                       ');
          SQL.Add('           and codeno = a.appkind) appkindname,        ');
          SQL.Add('       b.firstyn,                                      ');
          SQL.Add('       (select codename from pyccode                   ');
          SQL.Add('         where codeid = ''K410''                       ');
          SQL.Add('           and codeno = a.famikind) famikindname,      ');
          SQL.Add('       (select codename from pyccode                   ');
          SQL.Add('         where codeid = ''I211''                       ');
          SQL.Add('           and codeno = a.famirel) famirelname,        ');
          SQL.Add('       a.famikind,                                     ');
          SQL.Add('       a.appkind,                                      ');
          SQL.Add('       a.famirel,                                      ');
          SQL.Add('       a.faminame,                                     ');
          SQL.Add('       a.famibdate,                                    ');
          SQL.Add('       a.appdate,                                      ');
          SQL.Add('       a.regdate,                                      ');
          SQL.Add('       a.appdesc,                                      ');
          SQL.Add('       a.fawithdate,                                   ');
          SQL.Add('       a.famiyn,                                       ');
          SQL.Add('       a.famifrdate,                                   ');
          SQL.Add('       a.famitodate,                                   ');
          SQL.Add('       a.famidesc,                                     ');
          SQL.Add('       a.mailyn,                                       ');
          SQL.Add('       rownum,                                         ');
          SQL.Add('       b.mateempno                                     ');
          SQL.Add('  from pkmfmmas a, pkmpmas b                           ');
          SQL.Add(' where a.empno = b.empno                               ');
          SQL.Add('   and a.empno not like ''Y%''                         ');          
          SQL.Add('   and a.appdate between :p_appdatefr and :p_appdateto ');

          // 재직,퇴직,전체 구분하여 조회가능하도록 수정 2008.06.10
          if(RB_stateY.Checked) then
             SQL.Add('   and (b.pstate < ''80'')                          ')
          else if (RB_stateN.Checked) then
             SQL.Add('   and b.retdate is not null                        ');

          ParamByName('p_appdateFr').AsString := ME_appdateFROM.Text;
          ParamByName('p_appdateTo').AsString := ME_appdateTO.Text;

          if RB_provide.Checked then
               SQL.ADD(' and (substr(a.appkind,1,1) = ''A'') ')
          else
               SQL.ADD(' and (substr(a.appkind,1,1) = ''B'') ');

          if not RB_proAll.Checked then  //dsa2000  2004.12. 추가 (전체출력 가능토록)
          begin
               if RB_proY.Checked then
                    SQL.ADD(' and  (a.famiyn = ''Y'') ')
               else
                    SQL.ADD(' and  (a.famiyn = ''N'') ');
          end;

          SQL.Add('order by a.empno, faminame ');
          Open;

          if RecordCount = 0 then
          begin
               Phelpmsg.Caption := '  해당 내역이 존재하지 않습니다.';
               BB_BatchProvide.Enabled           := False;
               BB_IndividualProvide.Enabled      := False;
               BB_BatchCancellation.Enabled      := False;
               BB_IndividualCancellation.Enabled := False;
          end
          else
          begin
               Phelpmsg.Caption := '  해당 자료가 조회되었습니다.';
          end;
     end;

end;

procedure TMainForm.Query_fmmasCalcFields(DataSet: TDataSet);
begin
     {Query_fmmasfamirelNAME.AsString  := GetCodeName('I211', Query_fmmasFAMIREL.AsString);  //가족관계
     Query_fmmasappkindNAME.AsString  := GetCodeName('K411', Query_fmmasAPPKIND.AsString);  //신청구분
     Query_fmmasfamikindNAME.AsString := GetCodeName('K410', Query_fmmasFAMIKIND.AsString); //가족구분}

     Query_fmmasage.AsFloat := StrToIntDef(Copy(DateCal(Query_fmmasFAMIBDATE.AsString,      //연령
                                                         Copy(CurDate,1,6)+'15'),1,2),0);

     if (copy(Query_fmmasAPPKIND.AsString,1,1) = 'A') and
        (Query_fmmasFAMIYN.AsString = 'Y') and           //지급중일때만 금액출력
        (Query_fmmasFAMITODATE.AsString = '')
     then
     begin
          if Query_fmmasFAMIKIND.AsString = 'A' then        //배우자
               Query_fmmasmcpamt.AsFloat := F_mateamt //가족수당 지급기준의 자료
          else if Query_fmmasFAMIKIND.AsString = 'B' then   //존속
               Query_fmmasmcpamt.AsFloat := F_parentamt
          else if Query_fmmasFAMIKIND.AsString = 'C' then   //비속
               Query_fmmasmcpamt.AsFloat := F_childamt
          else
               Query_fmmasmcpamt.AsFloat := 0;
     end
     else
     begin
          Query_fmmasmcpamt.AsFloat := 0;
     end
end;

procedure TMainForm.SB_appdateFROMClick(Sender: TObject);
var
     calendar: Tcalendar;
begin
     Try
          calendar := Tcalendar.Create(Self);
          calendar.ShowModal;
          if calendar.DayCaption <> '' then ME_appdateFROM.Text := calendar.DayCaption;
     Finally
          calendar.free;
     end;
end;

procedure TMainForm.SB_appdateTOClick(Sender: TObject);
var
     calendar: Tcalendar;
begin
     Try
          calendar := Tcalendar.Create(Self);
          calendar.ShowModal;
          if calendar.DayCaption <> '' then ME_appdateTO.Text := calendar.DayCaption;
     Finally
          calendar.free;
     end;
end;

procedure TMainForm.ME_appdateFROMKeyPress(Sender: TObject; var Key: Char);
begin
     if Key <> #13 then System.Exit;
     Key := #0;

     if (Length(ME_appdateFROM.Text) <> 8) or (Length(ME_appdateTO.Text) <> 8) then
     begin
          Phelpmsg.Caption := '  먼저 신청일자를 입력하세요.';
          System.Exit;
     end;
     Update_Query;
end;

procedure TMainForm.SB_contentdateClick(Sender: TObject);
begin
    
    Try 
        MonthForm := TMonthForm.Create(Self); 
        MonthForm.ShowModal;    
        if MonthForm.DayCaption <> '' then              
           ME_contentdate.Text := Copy(MonthForm.DayCaption,1,6); 
    Finally 
        MonthForm.Free; 
    End; 

end;

procedure TMainForm.ME_contentdateChange(Sender: TObject);
begin
     if Length(ME_contentdate.Text) = 6 then
     begin
          if fn_IsDate(ME_contentdate.Text+'01') = False then
          begin
               MessageBox(Handle, '지급개시/해지월을 정확히 입력하세요.', '입력오류', MB_ICONWARNING);
               ME_contentdate.SetFocus;
               System.exit;
          end;
     end;
end;

procedure TMainForm.E_Con1KeyPress(Sender: TObject; var Key: Char);
begin
     if Key = #13 then FindEmp(E_Con1.Text,E_Con2.Text);
end;

procedure TMainForm.FindEmp(value1, value2 : String);
var
     OffSet : Integer;
     Flag   : Boolean;
     Index  : Integer;
     TmpStr : String;
     qq : TOraQuery;
begin
     if (Value1+Value2) = '' then
     begin
          Application.MessageBox('조회조건 중 적어도 하나는 입력하셔야 합니다.',
                                 '작업안내',MB_OK+MB_ICONWARNING);
          System.Exit;
     end;

     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     Try
          with qq do
          begin
               Close;
               SQL.Clear;
               SQL.Add('select a.empno,                                         ');
               SQL.Add('       a.faminame,                                      ');
               SQL.Add('       b.retdate                                        ');
               SQL.Add('  from pkmfmmas a, pkmpmas b                            ');
               SQL.Add(' where a.empno = b.empno                                ');
               SQL.Add('   and a.appdate between :p_appdateFr and :p_appdateTo  ');

               if RB_provide.Checked then
                    SQL.ADD('   and (substr(a.appkind,1,1) = ''A'')  ')
               else
                    SQL.ADD('   and (substr(a.appkind,1,1) = ''B'')  ');
               if RB_proY.Checked then
                    SQL.ADD('   and (a.famiyn = ''Y'') ')
               else
                    SQL.ADD('   and (a.famiyn = ''N'') ');

               SQL.Add('order by a.empno, a.faminame ');

               ParamByName('p_appdateFr').AsString := ME_appdateFROM.Text;
               ParamByName('p_appdateTo').AsString := ME_appdateTO.Text;
               Open;

               Offset := 0;
               Flag   := False;
               if not Eof then
               begin
                    if (Value1 <> '') AND (Value2 = '') then Index := 1
                    else
                    begin
                         if (Value1 = '') AND (Value2 <> '') then Index := 2
                         else                                     Index := 3;
                    end;

                    while not Eof do
                    begin
                         Case Index of
                              1 : TmpStr := FieldByName('EmpNO').AsString;
                              2 : TmpStr := FieldByName('FamiName').AsString;
                              3 : TmpStr := FieldByName('EmpNO').AsString + FieldByName('FamiName').AsString;
                         end;
                         if TmpStr = (Value1+Value2) then
                         begin
                              Flag := True;
                              System.Break;
                         end;
                         Next;
                         OffSet := Offset + 1;
                    end;
               end;
          end;
     Finally
          qq.Free;
     end;

     if Flag then
     begin
          Query_FmMas.First;
          Query_FmMas.MoveBy(OffSet);
     end
     else
          Application.MessageBox('조건을 만족하는 자료를 찾지 못했습니다.',
                                 '작업안내',MB_OK+MB_ICONWARNING);

end;

{개별취소}
procedure TMainForm.BB_IndividualCancellationClick(Sender: TObject);
var
     V: Variant;
     SearchOptions: TLocateOptions;
begin
     V := VarArrayCreate([0,3], varVariant);

     Query_fmmas.Next;
     if Query_fmmas.eof then
     begin
          Query_fmmas.Prior;
          V[0] := Query_fmmasEMPNO.AsString;
          V[1] := Query_fmmasFAMIREL.AsString;
          V[2] := Query_fmmasFAMIBDATE.AsString;
          V[3] := Query_fmmasAPPKIND.AsString;
          Query_fmmas.Next;
     end
     else
     begin
          V[0] := Query_fmmasEMPNO.AsString;
          V[1] := Query_fmmasFAMIREL.AsString;
          V[2] := Query_fmmasFAMIBDATE.AsString;
          V[3] := Query_fmmasAPPKIND.AsString;
          Query_fmmas.Prior;
     end;

     Phelpmsg.Caption := '  개별취소 중입니다';
     Application.ProcessMessages;
     Cancellation_proc(True);

     Update_Query;

     SearchOptions := [loPartialKey];
     if Query_fmmas.Locate('EMPNO;FAMIREL;FAMIBDATE;APPKIND', V, SearchOptions) then
          DBGrid1.SetFocus;

     Phelpmsg.Caption := '  개별취소 되었습니다';
end;

{일괄취소}
procedure TMainForm.BB_BatchCancellationClick(Sender: TObject);
var
     i: Integer;
     Inwon, over: Integer;
     LogoF: TextFile;
     AppkindName: string;
begin
     if MessageBox(handle, '처리여부를 "N" 로 일괄취소합니다.  실행하시겠습니까 ?', '작업 안내',
                           MB_OKCANCEL or $0030) <> IDOK
     then
          System.Exit;

     Phelpmsg.Caption := '  일괄취소 중입니다';
     Application.ProcessMessages;
     i := 0;
     Query_fmmas.first;
     while not Query_fmmas.eof do
     begin
          Inc(i);
          Phelpmsg.Caption := '  일괄처리 중입니다. ['+IntToStr(i)+' / '+IntToStr(Query_fmmas.RecordCount)+']';
          Application.ProcessMessages;
          Cancellation_proc(False);
          Query_fmmas.Next;
     end;

     Update_Query;

     Phelpmsg.Caption := '  일괄취소 되었습니다';
end;

procedure TMainForm.Cancellation_proc(Individual: Boolean);
var
     qq : TOraQuery;
begin
     // 처리여부는 'Y'로 되어있음
     {지급이 이미 일어나면 취소안함}
     if Query_fmmasFAMIFRDATE.AsString < Copy(CurDate,1,6) then {지급개시월 < 작업일}
     begin
          if Individual then {개별일때만 메시지 확인}
          begin
            if MessageBox(handle, '이미 지급이 일어난 자료입니다.  확실히 취소하시겠습니까 ?', '작업 안내',
                                  MB_OKCANCEL or $0030) <> IDOK
            then
                 System.Exit;
          end;
     end;

     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     Try
          with qq do
          begin
               Close;
               SQL.Clear;
               SQL.Add('select empno from pimfami    ');
               SQL.Add(' where empno  = :p_empno     ');
               SQL.Add('   and faname = :p_faname    ');
               SQL.Add('   and facode = :p_facode    ');
               ParamByName('p_empno').AsString  := Query_fmmasEMPNO.AsString;
               ParamByName('p_faname').AsString := Query_fmmasFAMINAME.AsString;
               ParamByName('p_facode').AsString := Query_fmmasFAMIREL.AsString;
               Open;

               if RecordCount = 0 then
               begin
                    if Individual then {개별일때만 메시지 확인}
                    begin
                         MessageBox(handle,'가족테이블에 가족사항이 등록되어있지 않습니다', '작업안내', MB_ICONWARNING);
                         System.exit;
                    end;
               end;

               if Copy(Query_fmmasAPPKIND.AsString,1,1) = 'A' then {지급신청}
               begin
                    Close;
                    SQL.Clear;
                    SQL.Add('update pkmfmmas                                              ');
                    SQL.Add('   set famifrdate = '''',                                    ');
                    SQL.Add('       famitodate = '''',                                    ');
                    SQL.Add('       famiyn     = ''N'',                                   ');
                    SQL.Add('       writetime  = to_char(sysdate, ''YYYYMMDDHH24MISS''),  ');
                    SQL.Add('       writeman   = :p_writeman                              ');
                    SQL.Add(' where empno     =  :p_empno                                 ');
                    SQL.Add('   and faminame  =  :p_faminame                              ');
                    SQL.Add('   and famibdate =  :p_famibdate                             ');
                    SQL.Add('   and appkind   =  :p_appkind                               ');
                    SQL.Add('   and famiyn    = ''Y''                                     ');
                    ParamByName('p_writeman').AsString  := Pempno;
                    ParamByName('p_empno').AsString     := Query_fmmasEMPNO.AsString;
                    ParamByName('p_faminame').AsString  := Query_fmmasFAMINAME.AsString;
                    ParamByName('p_famibdate').AsString := Query_fmmasFAMIBDATE.AsString;
                    ParamByName('p_appkind').AsString   := Query_fmmasAPPKIND.AsString;
                    ExecSQL;

                    Close;
                    SQL.Clear;
                    SQL.Add('update pimfami                                             ');
                    SQL.Add('   set faallowyn = ''N'',                                  ');
                    SQL.Add('       writetime = to_char(sysdate,''YYYYMMDDHH24MISS''),  ');
                    SQL.Add('       writeemp  = :p_writeemp                             ');
                    SQL.Add(' where empno = :p_empno                                    ');
                    SQL.Add('   and faname = :p_faname                                  ');
                    SQL.Add('   and facode = :p_facode                                  ');
                    ParamByName('p_writeemp').AsString := Pempno;
                    ParamByName('p_empno').AsString  := Query_fmmasEMPNO.AsString;
                    ParamByName('p_faname').AsString := Query_fmmasFAMINAME.AsString;
                    ParamByName('p_facode').AsString := Query_fmmasFAMIREL.AsString;
                    ExecSQL;
               end
               else {해지신청}
               begin
                    Close;
                    SQL.Clear;
                    SQL.Add('select empno from pkmfmmas         ');
                    SQL.Add(' where empno  = :p_empno           ');
                    SQL.Add('   and faminame = :p_faminame      ');
                    SQL.Add('   and famibdate = :p_famibdate    ');
//                    SQL.Add('   and famifrdate = :p_famifrdate  ');
                    SQL.Add('   and substr(appkind,1,1) = ''A'' ');
                    ParamByName('p_empno').AsString      := Query_fmmasEMPNO.AsString;
                    ParamByName('p_faminame').AsString   := Query_fmmasFAMINAME.AsString;
                    ParamByName('p_famibdate').AsString  := Query_fmmasFAMIBDATE.AsString;
//                    ParamByName('p_famifrdate').AsString := Query_fmmasFAMIFRDATE.AsString;
                    Open;

                    if RecordCount = 0 then
                    begin
                         if Individual then {개별일때만 메시지 확인}
                         begin
                              MessageBox(handle,'가족수당신청테이블에 해지취소할 자료의 신청내역이 없습니다', '작업안내', MB_ICONWARNING);
                              System.exit;
                         end;
                    end;

                    Close;
                    SQL.Clear;
                    SQL.Add('update pkmfmmas                                              ');
                    SQL.Add('   set famitodate = '''',                                    ');
                    SQL.Add('       famiyn     = ''N'',                                   ');
                    SQL.Add('       writetime  = to_char(sysdate, ''YYYYMMDDHH24MISS''),  ');
                    SQL.Add('       writeman   = :p_writeman                              ');
                    SQL.Add(' where empno     =  :p_empno                                 ');
                    SQL.Add('   and faminame  =  :p_faminame                              ');
                    SQL.Add('   and famibdate =  :p_famibdate                             ');
                    SQL.Add('   and appkind   =  :p_appkind                               ');
                    SQL.Add('   and famiyn    = ''Y''                                     ');
                    ParamByName('p_writeman').AsString  := Pempno;
                    ParamByName('p_empno').AsString     := Query_fmmasEMPNO.AsString;
                    ParamByName('p_faminame').AsString  := Query_fmmasFAMINAME.AsString;
                    ParamByName('p_famibdate').AsString := Query_fmmasFAMIBDATE.AsString;
                    ParamByName('p_appkind').AsString   := Query_fmmasAPPKIND.AsString;
                    ExecSQL;

                    Close;
                    SQL.Clear;
                    SQL.Add('update pkmfmmas                                              ');
                    SQL.Add('   set famitodate = '''',                                    ');
                    SQL.Add('       writetime  = to_char(sysdate, ''YYYYMMDDHH24MISS''),  ');
                    SQL.Add('       writeman   = :p_writeman                              ');
                    SQL.Add(' where empno     =  :p_empno                                 ');
                    SQL.Add('   and faminame  =  :p_faminame                              ');
                    SQL.Add('   and famibdate =  :p_famibdate                             ');
                    SQL.Add('   and substr(appkind,1,1) = ''A''                           ');
                    SQL.Add('   and famiyn    = ''Y''                                     ');
                    ParamByName('p_writeman').AsString  := Pempno;
                    ParamByName('p_empno').AsString     := Query_fmmasEMPNO.AsString;
                    ParamByName('p_faminame').AsString  := Query_fmmasFAMINAME.AsString;
                    ParamByName('p_famibdate').AsString := Query_fmmasFAMIBDATE.AsString;
                    ExecSQL;

                    Close;
                    SQL.Clear;
                    SQL.Add('update pimfami                                             ');
                    SQL.Add('   set faallowyn = ''Y'',                                  ');
                    SQL.Add('       writetime = to_char(sysdate,''YYYYMMDDHH24MISS''),  ');
                    SQL.Add('       writeemp  = :p_writeemp                             ');
                    SQL.Add(' where empno = :p_empno                                    ');
                    SQL.Add('   and faname = :p_faname                                  ');
                    SQL.Add('   and facode = :p_facode                                  ');
                    ParamByName('p_writeemp').AsString := Pempno;
                    ParamByName('p_empno').AsString  := Query_fmmasEMPNO.AsString;
                    ParamByName('p_faname').AsString := Query_fmmasFAMINAME.AsString;
                    ParamByName('p_facode').AsString := Query_fmmasFAMIREL.AsString;
                    ExecSQL;

                    {Close;
                    SQL.Clear;
                    SQL.Add('update pkmfmmas                                              ');
                    SQL.Add('   set famitodate = '''',                                    ');
                    SQL.Add('       writetime  = to_char(sysdate, ''yyyymmddhh24miss''),  ');
                    SQL.Add('       writeman   = :p_writeman                              ');
                    SQL.Add(' where empno     = :p_empno                                  ');
                    SQL.Add('   and faminame  = :p_faminame                               ');
                    SQL.Add('   and famibdate = :p_famibdate                              ');
                    SQL.Add('   and appkind   = :p_appkind                                ');
                    SQL.Add('   and famiyn    = ''Y''                                     ');
                    ParamByName('p_writeman').AsString  := Pempno;
                    ParamByName('p_empno').AsString     := Query_fmmasEMPNO.AsString;
                    ParamByName('p_faminame').AsString  := Query_fmmasFAMINAME.AsString;
                    ParamByName('p_famibdate').AsString := Query_fmmasFAMIBDATE.AsString;
                    ParamByName('p_appkind').AsString   := Query_fmmasAPPKIND.AsString;
                    ExecSQL;

                    Close;
                    SQL.Clear;
                    SQL.Add('update pkmfmmas                                               ');
                    SQL.Add('   set famitodate = '''',                                     ');
                    SQL.Add('       famidesc   = '''',                                     ');
                    SQL.Add('       writetime  = to_char(sysdate, ''yyyymmddhh24miss''),   ');
                    SQL.Add('       writeman   = :p_writeman                               ');
                    SQL.Add(' where empno      = :p_empno                                  ');
                    SQL.Add('   and faminame   = :p_faminame                               ');
                    SQL.Add('   and famibdate  = :p_famibdate                              ');
                    SQL.Add('   and famifrdate = :p_famifrdate                             ');
                    SQL.Add('   and substr(appkind,1,1) = ''A''                            ');
                    SQL.Add('   and famiyn     = ''Y''                                     ');
                    ParamByName('p_writeman').AsString   := Pempno;
                    ParamByName('p_empno').AsString      := Query_fmmasEMPNO.AsString;
                    ParamByName('p_faminame').AsString   := Query_fmmasFAMINAME.AsString;
                    ParamByName('p_famibdate').AsString  := Query_fmmasFAMIBDATE.AsString;
                    ParamByName('p_famifrdate').AsString := Query_fmmasFAMIFRDATE.AsString;
                    ExecSQL;

                    Close;
                    SQL.Clear;
                    SQL.Add('update pimfami                                             ');
                    SQL.Add('   set faallowyn = ''Y'',                                  ');
                    SQL.Add('       writetime = to_char(sysdate,''YYYYMMDDHH24MISS''),  ');
                    SQL.Add('       writeemp  = :p_writeemp                             ');
                    SQL.Add(' where empno = :p_empno                                    ');
                    SQL.Add('   and faname = :p_faname                                  ');
                    SQL.Add('   and facode = :p_facode                                  ');
                    ParamByName('p_writeemp').AsString := Pempno;
                    ParamByName('p_empno').AsString  := Query_fmmasEMPNO.AsString;
                    ParamByName('p_faname').AsString := Query_fmmasFAMINAME.AsString;
                    ParamByName('p_facode').AsString := Query_fmmasFAMIREL.AsString;
                    ExecSQL;     }
               end;
          end;
     Finally
          qq.Free;
     end;
end;


{개별처리}
procedure TMainForm.BB_IndividualProvideClick(Sender: TObject);
var
     V: Variant;
     SearchOptions: TLocateOptions;
     rMsg: String;
begin
     if fn_IsDate(ME_contentdate.Text+'01') = False then
     begin
          MessageBox(Handle, '지급개시/해지월을 정확히 입력하세요.', '입력오류', MB_ICONWARNING);
          ME_contentdate.SetFocus;
          System.exit;
     end;

     V := VarArrayCreate([0,3], varVariant);

     Query_fmmas.Next;
     if Query_fmmas.eof then
     begin
          Query_fmmas.Prior;
          V[0] := Query_fmmasEMPNO.AsString;
          V[1] := Query_fmmasFAMIREL.AsString;
          V[2] := Query_fmmasFAMIBDATE.AsString;
          V[3] := Query_fmmasAPPKIND.AsString;
          Query_fmmas.Next;
     end
     else
     begin
          V[0] := Query_fmmasEMPNO.AsString;
          V[1] := Query_fmmasFAMIREL.AsString;
          V[2] := Query_fmmasFAMIBDATE.AsString;
          V[3] := Query_fmmasAPPKIND.AsString;
          Query_fmmas.Prior;
     end;

     Phelpmsg.Caption := '  개별처리 중입니다';
     Application.ProcessMessages;

     rMsg := Provide_proc;  {처리함수 호출}
     if rMsg <> '' then
          MessageDlg(rMsg, mtInformation, [mbOk], 0);

     Update_Query;

     SearchOptions := [loPartialKey];
     if Query_fmmas.Locate('EMPNO;FAMIREL;FAMIBDATE;APPKIND', V, SearchOptions) then
          DBGrid1.SetFocus;

     Phelpmsg.Caption := '  개별처리 되었습니다';
end;

{일괄처리}
procedure TMainForm.BB_BatchProvideClick(Sender: TObject);
var
     i, errcnt: Integer;
     LogoF: TextFile;
     rMsg: String;
     LogFile: array[0..255] of char;
begin
     if fn_IsDate(ME_contentdate.Text+'01') = False then
     begin
          MessageBox(Handle, '지급개시/해지월을 정확히 입력하세요.', '입력오류', MB_ICONWARNING);
          ME_contentdate.SetFocus;
          System.exit;
     end;

     if MessageBox(handle, '처리여부를 "Y" 로 일괄처리합니다.  실행하시겠습니까 ?',
                           '작업 안내', MB_OKCANCEL or $0030) <> IDOK
     then
          System.Exit;

     {$I-}
     if not FileCtrl.DirectoryExists(HomeDir+'\LIST') then
          MkDir(HomeDir+'\LIST');

     AssignFile(LogoF, HomeDir+'\LIST\pkg1030a.err');

     ReWrite(LogoF);
     if IOResult <> 0 then
     begin
          MessageDlg('에러출력화일(Logo file) 생성에러', mtWarning, [mbOk], 0);
          System.Exit;
     end;

     WriteLn(LogoF, '****************************************************************************************************');
     WriteLn(LogoF, '          프로그램 : 가족수당 지급(pkg1030a)');
     WriteLn(LogoF, ' 오류LIST 작업화일 : '+HomeDir+'\LIST\pkg1030a.err');
     WriteLn(LogoF, '          작업일자 : '+ Copy(CurDate, 1, 4)+'.'+Copy(CurDate, 5, 2)+'.'+Copy(CurDate, 7, 2)+' '+
                                             Copy(CurDate, 9, 2)+':'+Copy(CurDate, 11, 2)+':'+Copy(CurDate, 13, 2));
     WriteLn(LogoF, '          작 업 자 : '+L_UserName.Caption);
     WriteLn(LogoF, '****************************************************************************************************');

     i := 0;
     errcnt := 0;
     Query_fmmas.first;
     while not Query_fmmas.eof do
     begin
          Inc(i);
          Phelpmsg.Caption := '  일괄처리 중입니다. ['+IntToStr(i)+' / '+IntToStr(Query_fmmas.RecordCount)+']';
          Application.ProcessMessages;

          rMsg := Provide_proc;  {처리함수 호출}
          if rMsg <> '' then
          begin
            Inc(errcnt);
            WriteLn(LogoF, '['+Format('%.4d',[errcnt])+'] : '+
                                      Query_fmmasEMPNO.AsString+'('+
                                      Query_fmmasKORNAME.AsString+') = '+
                                      Query_fmmasFAMINAME.AsString+'('+
                                      Query_fmmasfamikindNAME.AsString+','+
                                      Query_fmmasfamirelNAME.AsString+'),  '+ rMsg);
          end;
          Query_fmmas.Next;
          if i > 30 then break;
     end;

     WriteLn(LogoF, '');
     WriteLn(LogoF, '****************************************************************************************************');
     WriteLn(LogoF, ' 읽은건수 : '+IntToStr(Query_fmmas.RecordCount));
     WriteLn(LogoF, ' 오류건수 : '+IntToStr(errcnt));
     WriteLn(LogoF, '****************************************************************************************************');
     CloseFile(LogoF);
     {$I+}

     if errcnt > 0 then
     begin
          StrPCopy(LogFile, 'notepad '+HomeDir+'\LIST\pkg1030a.err');
          WinExec(LogFile, SW_MAXIMIZE);
     end;

     Update_Query;

     Phelpmsg.Caption := '  일괄처리 되었습니다.  '+
                         ' 읽은건수 : '+IntToStr(Query_fmmas.RecordCount)+
                         ' 오류건수 : '+IntToStr(errcnt);
end;

function TMainForm.Provide_proc: String;
var
     qq : TOraQuery;
begin
     // 처리여부는 'N'로 되어있음
     Provide_proc := '';  {''이 아니면 error가 있는자료임}

     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     Try
          with qq do
          begin
               if Copy(Query_fmmasAPPKIND.AsString,1,1) = 'A' then {지급신청}
               begin
                    if Query_fmmasFAMIKIND.AsString = 'B' then {존속}
                    begin
                         if (Query_fmmasFIRSTYN.AsString <> 'Y') and (Query_fmmasFAWITHDATE.AsString = '') then
                         begin
                              Provide_proc := '장남/녀가 아니면서 동거개시일이 없음';
                              System.Exit;
                         end;

                         mm := StrToIntDef(Copy(DateCal(Query_fmmasFAWITHDATE.AsString, Copy(Query_fmmasREGDATE.AsString,1,6)+'15'),1,2),0) * 12 +
                               StrToIntDef(Copy(DateCal(Query_fmmasFAWITHDATE.AsString, Copy(Query_fmmasREGDATE.AsString,1,6)+'15'),3,2),0);  {동거기간 산정}
                         if (Query_fmmasFIRSTYN.AsString <> 'Y') and (mm < F_togethermm) then
                         begin
                              Provide_proc := '동거기간이 동거기준월에 미달';
                              System.Exit;
                         end;

                         sex := StrToIntDef(Copy(Query_fmmasFAMIREL.AsString,2,1),0) mod 2;   {가족성별}

                         if (sex = 1) and (Query_fmmasage.AsFloat < F_parentminage) then {남자 and 연령미달}
                         begin
                              Provide_proc := '가족수당 지급연령(남)에 미달';
                              System.Exit;
                         end
                         else if (sex = 0) and (Query_fmmasage.AsFloat < (F_parentminage-5)) then {여자 and 열령미달}
                         begin
                              Provide_proc := '가족수당 지급연령(녀)에 미달';
                              System.Exit;
                         end;
                    end
                    else if Query_fmmasFAMIKIND.AsString = 'A' then {배우자}
                    begin
                         if Query_fmmasMATEEMPNO.AsString <> '' then
                         begin
                              if Length(GetKorName(Query_fmmasMATEEMPNO.AsString)) = 0  then {미등록 사내 부부사번}
                              begin
                                   Provide_proc := '급여마스터에 없는 사내부부사번('+Query_fmmasMATEEMPNO.AsString+')입니다';
                                   System.Exit;
                              end;
                              Close;
                              SQL.Clear;
                              SQL.Add(' select faminame                             ');
                              SQL.Add('   from pkmfmmas                             ');
                              SQL.Add('  where (empno  = :p_empno)                  ');
                              SQL.Add('    and (famikind = ''A'' )                  ');
                              SQL.Add('    and (substr(appkind,1,1) = ''A'')        ');
                              SQL.Add('    and (famiyn = ''Y'' )                    ');
                              SQL.Add('    and (famitodate is null)                 ');
                              {해지월이 있는 자료는 지급중지된 것이므로 null이면 신청가능}
                              ParamByName('p_empno').AsString := Query_fmmasMATEEMPNO.AsString;
                              Open;
                              if RecordCount > 0 then
                              begin
                                   Provide_proc := '사내부부이며 배우자('+Query_fmmasMATEEMPNO.AsString+')가 이미 가족수당(배우자)을 받고 있습니다';
                                   System.Exit;
                              end;
                         end;
                    end
                    else if Query_fmmasFAMIKIND.AsString = 'C' then {비속}
                    begin
                         if Query_fmmasage.AsFloat > F_childmaxage then
                         begin
                              Provide_proc := '직계비속의 수당지급 연령제한을 초과했습니다';
                              System.Exit;
                         end;
                    end
                    else {가족구분이 A,B,C가 아님}
                    begin
                         Provide_proc := '가족구분 오류';
                         System.exit;
                    end;

                    Close;
                    SQL.Clear;
                    SQL.Add('select empno from pimfami            ');
                    SQL.Add(' where empno  = :p_empno             ');
                    SQL.Add('   and faname = :p_faname            ');
                    SQL.Add('   and facode = :p_facode            ');
                    ParamByName('p_empno').AsString  := Query_fmmasEMPNO.AsString;
                    ParamByName('p_faname').AsString := Query_fmmasFAMINAME.AsString;
                    ParamByName('p_facode').AsString := Query_fmmasFAMIREL.AsString;
                    Open;

                    if RecordCount = 0 then
                    begin
                         Provide_proc := '가족테이블에 가족사항이 등록되어있지 않습니다';
                         System.exit;
                    end;

                    Close;
                    SQL.Clear;
                    SQL.Add('select count(empno) kind_cnt              ');
                    SQL.Add('  from pkmfmmas                           ');
                    SQL.Add(' where empno = :p_empno                   ');
                    SQL.Add('   and famikind = :p_famikind             ');
                    SQL.Add('   and substr(appkind,1,1) = ''A''        ');
                    SQL.Add('   and famiyn = ''Y''                     ');
                    SQL.Add('   and famitodate is null                 ');
                    ParamByName('p_empno').AsString    := Query_fmmasEMPNO.AsString;
                    ParamByName('p_famikind').AsString := Query_fmmasFAMIKIND.AsString;
                    Open;

                    if Query_fmmasFAMIKIND.AsString = 'A' then {제한인원 초과 검사}
                    begin
                         if FieldByName('kind_cnt').AsInteger > F_matecnt then
                         begin
                              Provide_proc := '배우자 제한인원 초과';
                              System.exit;
                         end;
                    end
                    else if Query_fmmasFAMIKIND.AsString = 'B' then
                    begin
                         if FieldByName('kind_cnt').AsInteger > F_parentcnt then
                         begin
                              Provide_proc := '존속 제한인원 초과';
                              System.exit;
                         end;
                    end
                    else if Query_fmmasFAMIKIND.AsString = 'C' then
                    begin
                         if FieldByName('kind_cnt').AsInteger > F_childcnt then
                         begin
                              Provide_proc := '비속 제한인원 초과';
                              System.exit;
                         end;
                    end;

                    Close;
                    SQL.Clear;
                    SQL.Add(' update pkmfmmas                                              ');{지급처리함}
                    SQL.Add('    set famifrdate = :p_famifrdate,                           ');
                    SQL.Add('        famiyn     = ''Y'',                                   ');
                    SQL.Add('        writetime  = TO_CHAR(SYSDATE, ''YYYYMMDDHH24MISS''),  ');
                    SQL.Add('        writeman   = :p_writeman                              ');
                    SQL.Add('  where (empno     = :p_empno     )                           ');
                    SQL.Add('    and (faminame  = :p_faminame  )                           ');
                    SQL.Add('    and (famibdate = :p_famibdate )                           ');
                    SQL.Add('    and (appkind   = :p_appkind   )                           ');
                    SQL.Add('    and (famiyn    = ''N'')                                   ');
                    ParamByName('p_famifrdate').AsString := ME_contentdate.Text;
                    ParamByName('p_writeman').AsString   := Pempno;
                    ParamByName('p_empno').AsString      := Query_fmmasEMPNO.AsString ;
                    ParamByName('p_faminame').AsString   := Query_fmmasFAMINAME.AsString ;
                    ParamByName('p_famibdate').AsString  := Query_fmmasFAMIBDATE.AsString;
                    ParamByName('p_appkind').AsString    := Query_fmmasAPPKIND.AsString;
                    ExecSql;

                    Close;
                    SQL.Clear;
                    SQL.Add(' update pimfami                                                '); {가족테이블도 지급처리함}
                    SQL.Add('    set faallowyn = ''Y'',                                     ');
                    SQL.Add('        writetime  = TO_CHAR(SYSDATE, ''YYYYMMDDHH24MISS''),   ');
                    SQL.Add('        writeemp   = :p_writeman                               ');
                    SQL.Add('  where (empno  = :p_empno   )                                 ');
                    SQL.Add('    and (faname = :p_faname  )                                 ');
                    SQL.Add('    and (facode = :p_facode  )                                 ');
                    ParamByName('p_writeman').AsString := Pempno;
                    ParamByName('p_empno').AsString    := Query_fmmasEMPNO.AsString;
                    ParamByName('p_faname').AsString   := Query_fmmasFAMINAME.AsString;
                    ParamByName('p_facode').AsString   := Query_fmmasFAMIREL.AsString;
                    ExecSql;
                    Close;
               end
               else {해지신청}
               begin
                    Close;
                    SQL.Clear;
                    SQL.Add('select empno from pimfami     ');
                    SQL.Add(' where empno  = :p_empno      ');
                    SQL.Add('   and faname = :p_faname     ');
                    SQL.Add('   and facode = :p_facode     ');
                    ParamByName('p_empno').AsString  := Query_fmmasEMPNO.AsString;
                    ParamByName('p_faname').AsString := Query_fmmasFAMINAME.AsString;
                    ParamByName('p_facode').AsString := Query_fmmasFAMIREL.AsString;
                    Open;

                    if RecordCount = 0 then
                    begin
                         Provide_proc := '가족테이블에 가족사항이 등록되어있지 않습니다';
                         System.exit;
                    end;

                    Close;
                    SQL.Clear;
                    SQL.Add('select empno from pkmfmmas             ');
                    SQL.Add(' where empno      = :p_empno           ');
                    SQL.Add('   and faminame   = :p_faminame        ');
                    SQL.Add('   and famibdate  = :p_famibdate       ');
//                    SQl.Add('   and famifrdate = :p_famifrdate      ');
                    SQL.Add('   and substr(appkind,1,1) = ''A''     ');
                    ParamByName('p_empno').AsString      := Query_fmmasEMPNO.AsString;
                    ParamByName('p_faminame').AsString   := Query_fmmasFAMINAME.AsString;
                    ParamByName('p_famibdate').AsString  := Query_fmmasFAMIBDATE.AsString;
//                    ParamByName('p_famifrdate').AsString := Query_fmmasFAMIFRDATE.AsString;
                    Open;

                    if RecordCount = 0 then
                    begin
                         Provide_proc := '가족수당신청테이블에 해지처리할 자료의 지급내역이 없습니다';
                         System.exit;
                    end;

                    Close;{지급해지함}
                    SQL.Clear;
                    SQL.Add('update pkmfmmas                                              ');
                    SQL.Add('   set famitodate = :p_famitodate,                           ');
                    SQL.Add('       famiyn     = ''Y'',                                   ');
                    SQL.Add('       writetime  = to_char(sysdate,''YYYYMMDDHH24MISS''),   ');
                    SQL.Add('       writeman   = :p_writeman                              ');
                    SQL.Add(' where empno     = :p_empno                                  ');
                    SQL.Add('   and faminame  = :p_faminame                               ');
                    SQL.Add('   and famibdate = :p_famibdate                              ');
                    SQL.Add('   and appkind   = :p_appkind                                ');
                    SQL.Add('   and famiyn    = ''N''                                     ');
                    ParamByName('p_famitodate').AsString := ME_contentdate.Text;
                    ParamByName('p_writeman').AsString   := Pempno;
                    ParamByName('p_empno').AsString      := Query_fmmasEMPNO.AsString;
                    ParamByName('p_faminame').AsString   := Query_fmmasFAMINAME.AsString;
                    ParamByName('p_famibdate').AsString  := Query_fmmasFAMIBDATE.AsString;
                    ParamByName('p_appkind').AsString    := Query_fmmasAPPKIND.AsString;
                    ExecSQL;

                    Close;{해지신청의 지급신청자료 갱신}
                    SQL.Clear;
                    SQL.Add('update pkmfmmas                                              ');
                    SQL.Add('   set famitodate = :p_famitodate,                           ');
                    SQL.Add('       famidesc   = :p_famidesc,                             ');
                    SQL.Add('       writetime  = to_char(sysdate,''YYYYMMDDHH24MISS''),   ');
                    SQL.Add('       writeman   = :p_writeman                              ');
                    SQL.Add(' where empno     = :p_empno                                  ');
                    SQL.Add('   and faminame  = :p_faminame                               ');
                    SQL.Add('   and famibdate = :p_famibdate                              ');
//                    SQL.Add('   and famifrdate = :p_famifrdate                            ');
                    SQL.Add('   and substr(appkind,1,1) = ''A''                           ');
                    SQL.Add('   and famiyn    = ''Y''                                     ');
                    ParamByName('p_famitodate').AsString  := ME_contentdate.Text;
                    ParamByName('p_famidesc').AsString    := Query_fmmasAPPDESC.AsString;
                    ParamByName('p_writeman').AsString    := Pempno;
                    ParamByName('p_empno').AsString       := Query_fmmasEMPNO.AsString;
                    ParamByName('p_faminame').AsString    := Query_fmmasFAMINAME.AsString;
                    ParamByName('p_famibdate').AsString   := Query_fmmasFAMIBDATE.AsString;
//                    ParamByName('p_famifrdate').AsString  := Query_fmmasFAMIFRDATE.AsString;
                    ExecSQL;

                    Close;
                    SQL.Clear;
                    SQL.Add('update pimfami                                             ');
                    SQL.Add('   set faallowyn = ''N'',                                  ');
                    SQL.Add('       writetime = to_char(sysdate, ''YYYYMMDDHH24MISS''), ');
                    SQL.Add('       writeemp  = :p_writeemp                             ');
                    SQL.Add(' where empno  = :p_empno                                   ');
                    SQL.Add('   and faname = :p_faname                                  ');
                    SQL.Add('   and facode = :p_facode                                  ');
                    ParamByName('p_writeemp').AsString := Pempno;
                    ParamByName('p_empno').AsString    := Query_fmmasEMPNO.AsString;
                    ParamByName('p_faname').AsString   := Query_fmmasFAMINAME.AsString;
                    ParamByName('p_facode').AsString   := Query_fmmasFAMIREL.AsString;
                    ExecSQL;
               end;
          end;
     Finally
          qq.Free;
     end;

end;

procedure TMainForm.BB_deleteClick(Sender: TObject);
var
     qq : TOraQuery;
begin
     if Query_fmmas.RecordCount = 0 then System.Exit;

     if MessageBox(handle, '확실히 삭제하시겠습니까 ?', '작업 안내', MB_OKCANCEL or $0030) <> IDOK
     then
          System.Exit;

     qq := TOraQuery.create(nil);
     qq.Session := Ora_Session;

     Try
          with qq do
          begin
               Close;
               SQL.Clear;
               SQL.Add('delete from pkmfmmas                ');
               SQL.Add(' where empno     = :p_empno         ');
               SQL.Add('   and faminame  = :p_faminame      ');
               SQL.Add('   and famibdate = :p_famibdate     ');
               SQL.Add('   and appkind   = :p_appkind       ');
               ParamByName('p_empno').AsString      := Query_fmmasEMPNO.AsString;
               ParamByName('p_faminame').AsString   := Query_fmmasFAMINAME.AsString;
               ParamByName('p_famibdate').AsString  := Query_fmmasFAMIBDATE.AsString;
               ParamByName('p_appkind').AsString    := Query_fmmasAPPKIND.AsString;
               ExecSQL;

               Update_Query;
               Phelpmsg.Caption := '  삭제되었습니다.  ';
          end;
     Finally
          qq.Free;
     end;
end;

procedure TMainForm.BB_LookUpClick(Sender: TObject);
begin
     Update_Query;
end;

procedure TMainForm.E_Con1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = VK_RETURN then
          FindEmp(E_Con1.Text,E_Con2.Text);


end;


procedure TMainForm.BB_ToMasterClick(Sender: TObject);
var
     LImateamt   : Real;
     LIchildamt  : Real;
     LIparentamt : Real;
     cpaydate    : String;
     qq : TOraQuery;
begin
     //dsa2000 2005.10.26 지급해지월까지는 수당지급이 되도록 수정. : 급여기준월이 맞는지 체크.
     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     Try
          with qq do
          begin
               Close;
               SQL.Clear;
               SQL.Add(' select cpaydate from pkcpbas ');
               Open;
               cpaydate := FieldByName('cpaydate').AsString;

               // 현급여지급월 확인 메시지 추가 2008.06.23
               if messagebox(handle,pChar('현급여지급월이 '+copy(cpaydate,1,4) + '년 ' +copy(cpaydate,5,2) +'일이 맞습니까?'),'알림',MB_YESNO) <> IDYES then
               begin
                    MessageDlg(' "급여지급 기준관리" 프로그램의 "현급여지급월"이 정확한지 확인하시기 바랍니다.', mtInformation, [mbOk], 0);               
                    system.exit;
               end; 

               {if Copy(fn_GetDateTimeStr,1,6) <> cpaydate then
               begin
                    MessageDlg(' "급여지급 기준관리" 프로그램의 "현급여지급월"이 정확한지 확인하시기 바랍니다.', mtInformation, [mbOk], 0);
                    System.Exit;
               end;}


               PhelpMsg.Caption := '   가족수당지급내역을 급여마스터로 Move 중...';

               PhelpMsg.Caption := '   가족수당지급대상자 중 존속수 Setting 중...';
               Application.ProcessMessages;

               Close;
               SQL.Clear;
               SQL.ADD('update pkmpmas  a                                                                                 ');
               SQL.ADD('   set parentcnt = ( select count(*)                                                              ');
               SQL.ADD('                       from pkmfmmas b                                                            ');
               SQL.ADD('                      where a.empno = b.empno                                                     ');
               SQL.ADD('                        and upper(substr(appkind,1,1)) = ''A''                                    ');
               SQL.ADD('                        and upper(famiyn) = ''Y''                                                 ');
               SQL.ADD('                        and (famitodate is null or famitodate >= (select cpaydate from pkcpbas) ) ');
               SQL.ADD('                        and upper(famikind) = ''B'')                                              ');
               //일반직 제외, 급여대상자만 추출 2008.06.11
               SQL.ADD('   where empno not like ''Y%'' and payyn = ''Y''                                                  ');
               ExecSQL;

               PhelpMsg.Caption := '   가족수당지급대상자 중 배우자수 Setting 중...';
               Application.ProcessMessages;

               Close;
               SQL.Clear;
               SQL.ADD('update pkmpmas  a                                                                                ');
               SQL.ADD('   set matecnt = ( select count(*)                                                               ');
               SQL.ADD('                     from pkmfmmas b                                                             ');
               SQL.ADD('                    where a.empno = b.empno                                                      ');
               SQL.ADD('                      and upper(substr(appkind,1,1)) = ''A''                                     ');
               SQL.ADD('                      and upper(famiyn) = ''Y''                                                  ');
//               SQL.ADD('                      and (famitodate is null or famitodate = (select cpaydate from pkcpbas) ) ');
               SQL.ADD('                        and (famitodate is null or famitodate >= (select cpaydate from pkcpbas) ) ');
               SQL.ADD('                      and upper(famikind) = ''A'')                                               ');
               //일반직 제외, 급여대상자만 추출 2008.06.11
               SQL.ADD('   where empno not like ''Y%'' and payyn = ''Y''                                                  ');
               ExecSQL;

               PhelpMsg.Caption := '   가족수당지급대상자 중 비속수 Setting 중...';
               Application.ProcessMessages;

               Close;
               SQL.Clear;
               SQL.ADD('update pkmpmas  a                                                                                 ');
               SQL.ADD('   set childcnt = ( select count(*)                                                               ');
               SQL.ADD('                      from pkmfmmas b                                                             ');
               SQL.ADD('                     where a.empno = b.empno                                                      ');
               SQL.ADD('                       and upper(substr(appkind,1,1)) = ''A''                                     ');
               SQL.ADD('                       and upper(famiyn) = ''Y''                                                  ');
//               SQL.ADD('                       and (famitodate is null or famitodate = (select cpaydate from pkcpbas) ) ');
               SQL.ADD('                        and (famitodate is null or famitodate >= (select cpaydate from pkcpbas) ) ');
               SQL.ADD('                       and upper(famikind) = ''C'')                                               ');
               //일반직 제외, 급여대상자만 추출 2008.06.11
               SQL.ADD('   where empno not like ''Y%'' and payyn = ''Y''                                                  ');
               ExecSQL;

               Close;
               SQL.Clear;
               SQL.ADD('select mateamt,childamt,parentamt ');
               SQL.ADD('  from pkcfmbas                   ');
               Open;
               if Recordcount > 0 then
               begin
                    LImateamt   := FieldByName('mateamt').Asfloat;
                    LIchildamt  := FieldByName('childamt').Asfloat;
                    LIparentamt := FieldByName('parentamt').Asfloat;
               end
               else
               begin
                    LImateamt   := 0;
                    LIchildamt  := 0;
                    LIparentamt := 0;
               end;

               Close;
               SQL.Clear;
               //수정근거 : 요청서 2007-9820
               //수정내용 : 가족수당 항목(배우자,존속,비속) 따로 저장에 따른 수정.
               //수 정 자 : 유재승(Z083)
               SQL.ADD('UPDATE PKMPMAS                                                                              ');
               SQL.ADD('   SET FAMIAMT  = (MATECNT * :mateamt) + (PARENTCNT * :parentamt) + (CHILDCNT * :childamt), ');
               SQL.ADD('       mateamt  = (MATECNT * :mateamt),                                                     ');
               SQL.ADD('       partamt  = (PARENTCNT * :parentamt),                                                 ');
               SQL.ADD('       childamt = (CHILDCNT * :childamt)                                                    ');
               //일반직 제외, 급여대상자만 추출 2008.06.11
               SQL.ADD('   where empno not like ''Y%'' and payyn = ''Y''                                            ');               
               ParamByName('mateamt').AsFloat    := LImateamt;      //가족수당기준금액
               ParamByName('parentamt').AsFloat  := LIparentamt;
               ParamByName('childamt').AsFloat   := LIchildamt;
               Execsql;
          end;
     Finally
          qq.Free;
     end;

     PhelpMsg.Caption := '   가족수당지급내역을 급여마스터로 Move하는 작업이 완료되었습니다...';
end;

//dsa2000  2004.12.13.  출력버튼 추가.
procedure TMainForm.BB_PrintClick(Sender: TObject);
begin
     Update_Query;
    
     FPrint := TFPrint.Create(Application);
     FPrint.QReport.Preview;
end;

// 2008.02.19 추가 (전체조회시 처리완료한 항목 삭제하지 못하도록 수정) 
procedure TMainForm.DBGrid1ColEnter(Sender: TObject);
begin
   if(not RB_proAll.Checked) then exit ;

   with Query_fmmas do
   begin
      if(FieldByName('FAMIYN').AsString='Y') then
         BB_delete.Enabled := false
      else BB_delete.Enabled := true;
   end;
end;

procedure TMainForm.DataSource1DataChange(Sender: TObject; Field: TField);
begin
   dbgrid1colenter(self);
end;

end.
