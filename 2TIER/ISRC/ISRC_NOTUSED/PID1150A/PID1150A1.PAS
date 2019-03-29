{-------------------------------------------------------------------------------
  PROGRAM-NAME   : PID1150A(수습 인사평가 및 의견 등록)
  SYSTEM-NAME    : 종합인사정보
  SUBSYSTEM-NAME : 수습사원 평가
  Programmer     : 서혜미
  Version        : 30.00
  Date           : 2007.03.23
  Update Contents
    Version  date(yyyy.mm.dd) programmer  description       relevant doc.no

-------------------------------------------------------------------------------}
unit PID1150A1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, pegradpanl, StdCtrls, Pass, DB, Tmax_DataSetText, TimeFtp,
  peoutlookbtn, Buttons, Grids, MemDS, DBAccess, Ora, DBGrids, DBTables,
  OnFocusButton;

type
  TMainForm = class(TForm)
    Pa_Work: TPanel;
    Panel11: TPanel;
    Panel15: TPanel;
    Label19: TLabel;
    Label20: TLabel;
    Panel16: TPanel;
    Label21: TLabel;
    Label22: TLabel;
    Panel17: TPanel;
    Label23: TLabel;
    Label24: TLabel;
    Panel18: TPanel;
    Label25: TLabel;
    Label26: TLabel;
    Panel19: TPanel;
    Label27: TLabel;
    Label28: TLabel;
    PnManner1: TPanel;
    PnManner2: TPanel;
    PnManner3: TPanel;
    PnManner4: TPanel;
    Panel29: TPanel;
    Label29: TLabel;
    Panel30: TPanel;
    Label31: TLabel;
    Panel31: TPanel;
    Label44: TLabel;
    Label45: TLabel;
    Panel32: TPanel;
    Label46: TLabel;
    Label47: TLabel;
    RgManner4: TRadioGroup;
    RgManner3: TRadioGroup;
    RgManner2: TRadioGroup;
    RgManner1: TRadioGroup;
    PnTotal: TPanel;
    mark1: TMemo;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel20: TPanel;
    Panel22: TPanel;
    Panel33: TPanel;
    Panel34: TPanel;
    Panel35: TPanel;
    pan_emp: TPanel;
    pan_name: TPanel;
    pan_dept: TPanel;
    pan_payra: TPanel;
    pan_empdate: TPanel;
    DBGrid_list: TDBGrid;
    Ora_Session: TOraSession;
    DataSource1: TDataSource;
    OraQuery2: TOraQuery;
    BB_exit: TOnFocusButton;
    BB_save: TOnFocusButton;
    OraQry_Grid: TOraQuery;
    Edit1: TEdit;
    OraQuery1: TOraQuery;
    Label1: TLabel;
    Label3: TLabel;
    L_rabasdate: TLabel;
    Label4: TLabel;
    PnAbility_Tot: TPanel;
    Label2: TLabel;
    PnManner_Tot: TPanel;
    Panel23: TPanel;
    Panel38: TPanel;
    Panel39: TPanel;
    Panel40: TPanel;
    Label32: TLabel;
    Label34: TLabel;
    Panel41: TPanel;
    Label35: TLabel;
    Label36: TLabel;
    Panel46: TPanel;
    Label37: TLabel;
    Label38: TLabel;
    Panel47: TPanel;
    Label40: TLabel;
    Label41: TLabel;
    Panel48: TPanel;
    Label42: TLabel;
    Label43: TLabel;
    Panel54: TPanel;
    PnAbility1: TPanel;
    PnAbility2: TPanel;
    PnAbility3: TPanel;
    PnAbility4: TPanel;
    Panel6: TPanel;
    Label5: TLabel;
    Label7: TLabel;
    Panel7: TPanel;
    Label8: TLabel;
    Label9: TLabel;
    Panel8: TPanel;
    Label10: TLabel;
    Panel9: TPanel;
    Label12: TLabel;
    Label13: TLabel;
    RgAbility4: TRadioGroup;
    RgAbility3: TRadioGroup;
    RgAbility2: TRadioGroup;
    RgAbility1: TRadioGroup;
    Panel10: TPanel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Panel1: TPanel;
    Label33: TLabel;
    Label39: TLabel;
    Panel2: TPanel;
    Label48: TLabel;
    Label49: TLabel;
    PnAbility5: TPanel;
    Panel4: TPanel;
    Label50: TLabel;
    Label51: TLabel;
    Panel5: TPanel;
    Label52: TLabel;
    Label53: TLabel;
    PnAbility6: TPanel;
    Panel24: TPanel;
    Label54: TLabel;
    Label55: TLabel;
    Panel21: TPanel;
    Label56: TLabel;
    Label57: TLabel;
    PnManner5: TPanel;
    Panel26: TPanel;
    Label58: TLabel;
    Label59: TLabel;
    RgManner5: TRadioGroup;
    Panel27: TPanel;
    Label60: TLabel;
    Label61: TLabel;
    RgAbility5: TRadioGroup;
    RgAbility6: TRadioGroup;
    Panel3: TPanel;
    Panel12: TPanel;
    BB_confirm: TOnFocusButton;
    Panel25: TPanel;
    pan_econyn: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BB_EXITClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RgAbility1Click(Sender: TObject);
    procedure BB_saveClick(Sender: TObject);
    procedure DBGrid_listCellClick(Column: TColumn);
    procedure BB_confirmClick(Sender: TObject);

  private
    { Private declarations }
    procedure Display;

  public
    { Public declarations }
    Pempno     : string;
    Dempno     : string;
    pkorname   : string;
    PClass     : string;
    vRabasdate : string;
    vOrgnum    : string;
  end;


var
  MainForm: TMainForm;


implementation



{$R *.DFM}


procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := caFree;
end;

procedure TMainForm.BB_EXITClick(Sender: TObject);
begin
     Close;
end;

procedure TMainForm.FormShow(Sender: TObject);
var
     sqltext   : string;
     pdeptcode : string;
begin
     pempno   := PassEmp(cmdline,1);
     pkorname := PassEmp(cmdline,2);
     Dempno   := 'first';

     Ora_Session.Connected := False;
     PClass                := Passemp(cmdline,4);
     Ora_Session.Username  := Passemp(cmdline,5);
     Ora_Session.PassWord  := Passemp(cmdline,6);
     Ora_Session.Server    := Passemp(cmdline,7) +':'+
                              Passemp(cmdline,9) +':'+
                              Passemp(cmdline,8);
     Ora_Session.Connected := True;
     with OraQuery1 do
     begin
         close;
         sql.Clear;
         Sql.Add('select value1, value2 from pimvari          ');
         Sql.Add(' where gubun = ''00'' and sgubun = ''0005'' ');
         open;
         vrabasdate := fieldbyname('Value1').AsString;
         vorgnum    := fieldbyname('Value2').AsString;
     end;

     L_rabasdate.Caption :='평가기준년월 : '+copy(vrabasdate,1,4)+'년 '+copy(vrabasdate,5,2)+'월';
     Display;

     RgAbility1Click(nil);
end;

procedure TMainForm.Display;         //그리드에 디스플레이
begin
     with OraQry_Grid do
     begin
          Close;
          SQL.Clear;
          SQL.Add(' select a.rabasdate,                                                                                   ');
          SQL.Add('        a.empno,                                                                                       ');
          SQL.Add('        a.korname,                                                                                     ');
          SQL.Add('        a.paycl,                                                                                       ');
          SQL.Add('        a.payra,                                                                                       ');
          SQL.Add('        a.deptcode,                                                                                    ');
          SQL.Add('        substr(a.empdate,1,4)||''/''||substr(a.empdate,5,2)||''/''||substr(a.empdate,7,2) empdate,     ');
          SQL.Add('        a.eempno,                                                                                      ');
          SQL.Add('        a.eempname,                                                                                    ');
          SQL.Add('        a.gogwa_fr,                                                                                    ');
          SQL.Add('        a.gogwa_to,                                                                                    ');
          SQL.Add('        a.ability1,                                                                                    ');
          SQL.Add('        a.ability2,                                                                                    ');
          SQL.Add('        a.ability3,                                                                                    ');
          SQL.Add('        a.ability4,                                                                                    ');
          SQL.Add('        a.ability5,                                                                                    ');
          SQL.Add('        a.ability6,                                                                                    ');
          SQL.Add('        a.ability_tot,                                                                                 ');
          SQL.Add('        a.manner1,                                                                                     ');
          SQL.Add('        a.manner2,                                                                                     ');
          SQL.Add('        a.manner3,                                                                                     ');
          SQL.Add('        a.manner4,                                                                                     ');
          SQL.Add('        a.manner5,                                                                                     ');
          SQL.Add('        a.manner_tot,                                                                                  ');
          SQL.Add('        a.score_tot,                                                                                   ');
          SQL.Add('        a.mark1,                                                                                       ');
          SQL.Add('        a.writeemp,                                                                                    ');
          SQL.Add('        a.writetime,                                                                                   ');
          SQL.Add('        a.econyn,  decode(a.econyn,''N'',''미완료'',''완료'') conynname,                               ');
          SQL.Add('        nvl((select codename from pyccode where codeid=''I112'' and codeno  =a.paycl),'''') payclname, ');
          SQL.Add('        nvl((select codename from pyccode where codeid=''I113'' and codeno  =a.payra),'''') payraname, ');
          SQL.Add('        nvl((select deptname from pycdept where orgnum= (select value2 from  pimvari                   ');
          SQL.Add('                                                          where gubun = ''00''                         ');
          SQL.Add('                                                            and sgubun = ''0005'')                     ');
          SQL.Add('                                                            and deptcode = a.deptcode),'''') deptname  ');
          SQL.Add(' from penewmas a                                                                                       ');
          SQL.Add('where rabasdate = '''+ vrabasdate + '''                                                                ');


          if  (copy(PClass,2,1) > 'B') or (copy(PClass,10,1) > 'B') then    //관리자 등급 체크
          begin
               SQL.Add(' and a.eempno =  (select distinct eempno from penewmas where eempno = :pempno )  ');
               ParamByName('pempno').AsString := pempno;
          end;
          SQL.Add('order by deptcode, empno');
          //edit1.text :=  OraQry_Grid.sql.text;
          open;

          if Dempno <> 'first' then
          begin
               while not OraQry_Grid.eof do
               begin
                    if Dempno = FieldByName('empno').AsString then break;
                    Next;
               end;
          end;

          if RecordCount = 0 then
          begin
               MessageDlg('해당 프로그램에 대한 권한이 없습니다' +#13+
                          '프로그램을 종료합니다.' ,mtError,[mbOK],0);
               Screen.Cursor := crDefault;
               MainForm.Close;
          end
          else DBGrid_listCellClick(nil);
     end;
end;

procedure TMainForm.DBGrid_listCellClick(Column: TColumn);
begin
     with OraQry_Grid do
     begin
          pan_emp.Caption     := FieldByName('empno').AsString;
          Dempno              := FieldByName('empno').AsString;
          pan_name.Caption    := FieldByName('korname').AsString;
          pan_dept.Caption    := FieldByName('deptname').AsString;
          pan_payra.Caption   := FieldByName('payraname').AsString;
          pan_empdate.Caption := FieldByName('empdate').AsString;
          pan_econyn.Caption  := FieldByName('conynname').AsString;

          if FieldByName('econyn').AsString = 'N' then
          begin
               BB_save.Visible    := True;
               BB_confirm.Visible := True;
               mark1.ReadOnly     := False;
               RgAbility1.Enabled := True;
               RgAbility2.Enabled := True;
               RgAbility3.Enabled := True;
               RgAbility4.Enabled := True;
               RgAbility5.Enabled := True;
               RgAbility6.Enabled := True;
               RgManner1.Enabled  := True;
               RgManner2.Enabled  := True;
               RgManner3.Enabled  := True;
               RgManner4.Enabled  := True;
               RgManner5.Enabled  := True;
          end
          else
          begin
               BB_save.Visible    := False;
               BB_confirm.Visible := False;
               mark1.ReadOnly     := True;
               RgAbility1.Enabled := False;
               RgAbility2.Enabled := False;
               RgAbility3.Enabled := False;
               RgAbility4.Enabled := False;
               RgAbility5.Enabled := False;
               RgAbility6.Enabled := False;
               RgManner1.Enabled  := False;
               RgManner2.Enabled  := False;
               RgManner3.Enabled  := False;
               RgManner4.Enabled  := False;
               RgManner5.Enabled  := False;
          end;

          if      FieldByName('Ability1').AsInteger = 10 then RgAbility1.ItemIndex := 0
          else if FieldByName('Ability1').AsInteger =  8 then RgAbility1.ItemIndex := 1
          else if FieldByName('Ability1').AsInteger =  6 then RgAbility1.ItemIndex := 2
          else if FieldByName('Ability1').AsInteger =  4 then RgAbility1.ItemIndex := 3
          else if FieldByName('Ability1').AsInteger =  2 then RgAbility1.ItemIndex := 4
          else                                                RgAbility1.ItemIndex := -1;

          if      FieldByName('Ability2').AsInteger = 10 then RgAbility2.ItemIndex := 0
          else if FieldByName('Ability2').AsInteger =  8 then RgAbility2.ItemIndex := 1
          else if FieldByName('Ability2').AsInteger =  6 then RgAbility2.ItemIndex := 2
          else if FieldByName('Ability2').AsInteger =  4 then RgAbility2.ItemIndex := 3
          else if FieldByName('Ability2').AsInteger =  2 then RgAbility2.ItemIndex := 4
          else                                                RgAbility2.ItemIndex := -1;

          if      FieldByName('Ability3').AsInteger = 10 then RgAbility3.ItemIndex := 0
          else if FieldByName('Ability3').AsInteger =  8 then RgAbility3.ItemIndex := 1
          else if FieldByName('Ability3').AsInteger =  6 then RgAbility3.ItemIndex := 2
          else if FieldByName('Ability3').AsInteger =  4 then RgAbility3.ItemIndex := 3
          else if FieldByName('Ability3').AsInteger =  2 then RgAbility3.ItemIndex := 4
          else                                                RgAbility3.ItemIndex := -1;

          if      FieldByName('Ability4').AsInteger = 10 then RgAbility4.ItemIndex := 0
          else if FieldByName('Ability4').AsInteger =  8 then RgAbility4.ItemIndex := 1
          else if FieldByName('Ability4').AsInteger =  6 then RgAbility4.ItemIndex := 2
          else if FieldByName('Ability4').AsInteger =  4 then RgAbility4.ItemIndex := 3
          else if FieldByName('Ability4').AsInteger =  2 then RgAbility4.ItemIndex := 4
          else                                                RgAbility4.ItemIndex := -1;

          if      FieldByName('Ability5').AsInteger = 10 then RgAbility5.ItemIndex := 0
          else if FieldByName('Ability5').AsInteger =  8 then RgAbility5.ItemIndex := 1
          else if FieldByName('Ability5').AsInteger =  6 then RgAbility5.ItemIndex := 2
          else if FieldByName('Ability5').AsInteger =  4 then RgAbility5.ItemIndex := 3
          else if FieldByName('Ability5').AsInteger =  2 then RgAbility5.ItemIndex := 4
          else                                                RgAbility5.ItemIndex := -1;

          if      FieldByName('Ability6').AsInteger = 10 then RgAbility6.ItemIndex := 0
          else if FieldByName('Ability6').AsInteger =  8 then RgAbility6.ItemIndex := 1
          else if FieldByName('Ability6').AsInteger =  6 then RgAbility6.ItemIndex := 2
          else if FieldByName('Ability6').AsInteger =  4 then RgAbility6.ItemIndex := 3
          else if FieldByName('Ability6').AsInteger =  2 then RgAbility6.ItemIndex := 4
          else                                                RgAbility6.ItemIndex := -1;

          if      FieldByName('Manner1').AsInteger = 10 then RgManner1.ItemIndex := 0
          else if FieldByName('Manner1').AsInteger =  8 then RgManner1.ItemIndex := 1
          else if FieldByName('Manner1').AsInteger =  6 then RgManner1.ItemIndex := 2
          else if FieldByName('Manner1').AsInteger =  4 then RgManner1.ItemIndex := 3
          else if FieldByName('Manner1').AsInteger =  2 then RgManner1.ItemIndex := 4
          else                                               RgManner1.ItemIndex := -1;

          if      FieldByName('Manner2').AsInteger = 10 then RgManner2.ItemIndex := 0
          else if FieldByName('Manner2').AsInteger =  8 then RgManner2.ItemIndex := 1
          else if FieldByName('Manner2').AsInteger =  6 then RgManner2.ItemIndex := 2
          else if FieldByName('Manner2').AsInteger =  4 then RgManner2.ItemIndex := 3
          else if FieldByName('Manner2').AsInteger =  2 then RgManner2.ItemIndex := 4
          else                                               RgManner2.ItemIndex := -1;

          if      FieldByName('Manner3').AsInteger =  5 then RgManner3.ItemIndex := 0
          else if FieldByName('Manner3').AsInteger =  4 then RgManner3.ItemIndex := 1
          else if FieldByName('Manner3').AsInteger =  3 then RgManner3.ItemIndex := 2
          else if FieldByName('Manner3').AsInteger =  2 then RgManner3.ItemIndex := 3
          else if FieldByName('Manner3').AsInteger =  1 then RgManner3.ItemIndex := 4
          else                                               RgManner3.ItemIndex := -1;

          if      FieldByName('Manner4').AsInteger = 10 then RgManner4.ItemIndex := 0
          else if FieldByName('Manner4').AsInteger =  8 then RgManner4.ItemIndex := 1
          else if FieldByName('Manner4').AsInteger =  6 then RgManner4.ItemIndex := 2
          else if FieldByName('Manner4').AsInteger =  4 then RgManner4.ItemIndex := 3
          else if FieldByName('Manner4').AsInteger =  2 then RgManner4.ItemIndex := 4
          else                                               RgManner4.ItemIndex := -1;

          if      FieldByName('Manner5').AsInteger =  5 then RgManner5.ItemIndex := 0
          else if FieldByName('Manner5').AsInteger =  4 then RgManner5.ItemIndex := 1
          else if FieldByName('Manner5').AsInteger =  3 then RgManner5.ItemIndex := 2
          else if FieldByName('Manner5').AsInteger =  2 then RgManner5.ItemIndex := 3
          else if FieldByName('Manner5').AsInteger =  1 then RgManner5.ItemIndex := 4
          else                                               RgManner5.ItemIndex := -1;

          PnAbility1.Caption    := InttoStr(FieldByName('Ability1').AsInteger);
          PnAbility2.Caption    := InttoStr(FieldByName('Ability2').AsInteger);
          PnAbility3.Caption    := InttoStr(FieldByName('Ability3').AsInteger);
          PnAbility4.Caption    := InttoStr(FieldByName('Ability4').AsInteger);
          PnAbility5.Caption    := InttoStr(FieldByName('Ability5').AsInteger);
          PnAbility6.Caption    := InttoStr(FieldByName('Ability6').AsInteger);
          PnAbility_Tot.Caption := InttoStr(FieldByName('Ability_Tot').AsInteger);

          PnManner1.caption     := InttoStr(FieldByName('Manner1').AsInteger);
          PnManner2.Caption     := InttoStr(FieldByName('Manner2').AsInteger);
          PnManner3.Caption     := InttoStr(FieldByName('Manner3').AsInteger);
          PnManner4.Caption     := InttoStr(FieldByName('Manner4').AsInteger);
          PnManner5.Caption     := InttoStr(FieldByName('Manner5').AsInteger);
          PnManner_Tot.caption  := InttoStr(FieldByName('Manner_Tot').AsInteger);
          PnTotal.caption       := InttoStr(FieldByName('score_tot').AsInteger);
          mark1.text            := FieldByName('mark1').AsString;
   end;
end;

procedure TMainForm.RgAbility1Click(Sender: TObject);
begin
     if RgAbility1.ItemIndex <> -1 then
     PnAbility1.caption := RgAbility1.Items[RgAbility1.ItemIndex];
     if RgAbility2.ItemIndex <> -1 then
     PnAbility2.caption := RgAbility2.Items[RgAbility2.ItemIndex];
     if RgAbility3.ItemIndex <> -1 then
     PnAbility3.caption := RgAbility3.Items[RgAbility3.ItemIndex];
     if RgAbility4.ItemIndex <> -1 then
     PnAbility4.caption := RgAbility4.Items[RgAbility4.ItemIndex];
     if RgAbility5.ItemIndex <> -1 then
     PnAbility5.caption := RgAbility4.Items[RgAbility5.ItemIndex];
     if RgAbility6.ItemIndex <> -1 then
     PnAbility6.caption := RgAbility6.Items[RgAbility6.ItemIndex];

     if RgManner1.ItemIndex <> -1 then
     PnManner1.caption  := RgManner1.Items[RgManner1.ItemIndex];
     if RgManner2.ItemIndex <> -1 then
     PnManner2.caption  := RgManner2.Items[RgManner2.ItemIndex];
     if RgManner3.ItemIndex <> -1 then
     PnManner3.caption  := RgManner3.Items[RgManner3.ItemIndex];
     if RgManner4.ItemIndex <> -1 then
     PnManner4.caption  := RgManner4.Items[RgManner4.ItemIndex];
     if RgManner5.ItemIndex <> -1 then
     PnManner5.caption  := RgManner5.Items[RgManner5.ItemIndex];


     if (RgAbility1.ItemIndex <> -1) and (RgAbility2.ItemIndex <> -1) and
        (RgAbility3.ItemIndex <> -1) and (RgAbility4.ItemIndex <> -1) and
        (RgAbility5.ItemIndex <> -1) and (RgAbility6.ItemIndex <> -1) then
     PnAbility_Tot.caption := IntToStr(StrtoInt(RgAbility1.Items[RgAbility1.ItemIndex]) +
                                       StrtoInt(RgAbility2.Items[RgAbility2.ItemIndex]) +
                                       StrtoInt(RgAbility3.Items[RgAbility3.ItemIndex]) +
                                       StrtoInt(RgAbility4.Items[RgAbility4.ItemIndex]) +
                                       StrtoInt(RgAbility5.Items[RgAbility5.ItemIndex]) +
                                       StrtoInt(RgAbility6.Items[RgAbility6.ItemIndex]));

     if (RgManner1.ItemIndex <> -1) and (RgManner2.ItemIndex <> -1) and
        (RgManner3.ItemIndex <> -1) and (RgManner4.ItemIndex <> -1) and (RgManner5.ItemIndex <> -1) then
     PnManner_Tot.caption  := IntToStr(StrtoInt(RgManner1.Items[RgManner1.ItemIndex]) +
                                       StrtoInt(RgManner2.Items[RgManner2.ItemIndex]) +
                                       StrtoInt(RgManner3.Items[RgManner3.ItemIndex]) +
                                       StrtoInt(RgManner4.Items[RgManner4.ItemIndex]) +
                                       StrtoInt(RgManner5.Items[RgManner5.ItemIndex]));

     PnTotal.caption       := IntToStr(StrtoInt(PnAbility1.Caption) +
                                       StrtoInt(PnAbility2.Caption) +
                                       StrtoInt(PnAbility3.Caption) +
                                       StrtoInt(PnAbility4.Caption) +
                                       StrtoInt(PnAbility5.Caption) +
                                       StrtoInt(PnAbility6.Caption) +
                                       StrtoInt(PnManner1.Caption ) +
                                       StrtoInt(PnManner2.Caption ) +
                                       StrtoInt(PnManner3.Caption ) +
                                       StrtoInt(PnManner4.Caption ) +
                                       StrtoInt(PnManner5.Caption ) );
end;


procedure TMainForm.BB_saveClick(Sender: TObject);
begin
     with OraQuery2 do
     begin
          Close;
          SQL.Clear;
          SQL.Add(' update penewmas set   ability1    = :ability1,                             ');
          SQL.Add('                       ability2    = :ability2,                             ');
          SQL.Add('                       ability3    = :ability3,                             ');
          SQL.Add('                       ability4    = :ability4,                             ');
          SQL.Add('                       ability5    = :ability5,                             ');
          SQL.Add('                       ability6    = :ability6,                             ');
          SQL.Add('                       ability_tot = :ability_tot,                          ');
          SQL.Add('                       manner1     = :manner1,                              ');
          SQL.Add('                       manner2     = :manner2,                              ');
          SQL.Add('                       manner3     = :manner3,                              ');
          SQL.Add('                       manner4     = :manner4,                              ');
          SQL.Add('                       manner5     = :manner5,                              ');
          SQL.Add('                       manner_tot  = :manner_tot,                           ');
          SQL.Add('                       score_tot   = :score_tot,                            ');
          SQL.Add('                       mark1       = :mark1,                                ');
          SQL.Add('                       writeemp    = :writeemp,                             ');
          SQL.Add('                       writetime   = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISSD'') ');
          SQL.Add('where rabasdate = :rabasdate and empno = :empno                             ');

          ParamByName('ability1'   ).AsFloat  := StrToInt(PnAbility1.caption   );
          ParamByName('ability2'   ).AsFloat  := StrToInt(PnAbility2.caption   );
          ParamByName('ability3'   ).AsFloat  := StrToInt(PnAbility3.caption   );
          ParamByName('ability4'   ).AsFloat  := StrToInt(PnAbility4.caption   );
          ParamByName('ability5'   ).AsFloat  := StrToInt(PnAbility5.caption   );
          ParamByName('ability6'   ).AsFloat  := StrToInt(PnAbility6.caption   );
          ParamByName('ability_tot').AsFloat  := StrToInt(PnAbility_Tot.caption);
          ParamByName('manner1'    ).AsFloat  := StrToInt(PnManner1.caption    );
          ParamByName('manner2'    ).AsFloat  := StrToInt(PnManner2.caption    );
          ParamByName('manner3'    ).AsFloat  := StrToInt(PnManner3.caption    );
          ParamByName('manner4'    ).AsFloat  := StrToInt(PnManner4.caption    );
          ParamByName('manner5'    ).AsFloat  := StrToInt(PnManner5.caption    );
          ParamByName('manner_tot' ).AsFloat  := StrToInt(PnManner_Tot.caption );
          ParamByName('score_tot'  ).AsFloat  := StrToInt(PnTotal.caption      );
          ParamByName('mark1'      ).AsString := mark1.text;
          ParamByName('writeemp'   ).AsString := Pempno;
          ParamByName('rabasdate'  ).AsString := vRabasdate;          //평가기준년월 : 2007년 03월
          ParamByName('empno'      ).AsString := pan_emp.caption;
          EXECSQL;
     end;

     if TOnFocusButton(Sender).Name = 'BB_save' then
        MessageDlg('저장 작업이 성공적으로 완료되었습니다.',mtInformation, [mbOK],0);

     Display;
end;


procedure TMainForm.BB_confirmClick(Sender: TObject);
begin
     if (RgAbility1.ItemIndex <> -1) and (RgAbility2.ItemIndex <> -1) and
        (RgAbility3.ItemIndex <> -1) and (RgAbility4.ItemIndex <> -1) and
        (RgAbility5.ItemIndex <> -1) and (RgAbility6.ItemIndex <> -1) and
        (RgManner1.ItemIndex  <> -1) and (RgManner2.ItemIndex  <> -1) and
        (RgManner3.ItemIndex  <> -1) and (RgManner4.ItemIndex  <> -1) and
        (RgManner5.ItemIndex  <> -1) then
     else
     begin
          MessageDlg('평가하지 않으신 항목이 있습니다.',mtWarning, [mbOK],0);
          system.Exit;
     end;

     if mark1.Lines.Text = '' then
     begin
          MessageDlg('피평가자에 대한 평가자 의견을 작성하지 않으셨습니다.',mtWarning, [mbOK],0);
          system.Exit;
     end;

     if MessageBox(handle,PChar('최종완료를 하시면 등록하신 내역을 수정하실 수 없습니다.'+#13+#13+
                                '등록하신 내역에 대해 모두 확인을 마치셨으면 최종완료를 하시기 바랍니다.'+#13+#13+
                                '최종완료를 하시겠습니까?'), '확 인',  MB_YESNO or MB_DEFBUTTON2) <> IDYES then  system.Exit;
     BB_saveClick(Sender);

     with OraQuery2 do
     begin
          Close;
          SQL.Clear;
          SQL.Add(' update penewmas set   econyn      = ''Y'',                                 ');
          SQL.Add('                       writeemp    = :writeemp,                             ');
          SQL.Add('                       writetime   = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISSD'') ');
          SQL.Add('where rabasdate = :rabasdate and empno = :empno                             ');
          ParamByName('writeemp'   ).AsString := Pempno;
          ParamByName('rabasdate'  ).AsString := vRabasdate;          //평가기준년월 : 2007년 03월
          ParamByName('empno'      ).AsString := pan_emp.caption;
          EXECSQL;
     end;

     MessageDlg('최종완료 작업을 성공적으로 저장하였습니다.',mtInformation, [mbOK],0);

     Display;
end;

end.




