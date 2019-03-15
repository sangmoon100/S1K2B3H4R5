unit pkg10223;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DB, DBTables, Grids, DBGrids, Mask, ExtCtrls,
  KeyEmpNo, KeyCode, kylib1, Calen1, Datelib, MemDS, DBAccess, Ora, Func;

type
  TFamilyForm = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Phelpmsg: TPanel;
    Panel2: TPanel;
    SB_facode: TSpeedButton;
    L_facodename: TLabel;
    BB_save: TBitBtn;
    ME_birthdate: TMaskEdit;
    BB_close: TBitBtn;
    L_famikindname: TLabel;
    SB_birthdate: TSpeedButton;
    CB_fawith: TComboBox;
    SB_faschgr: TSpeedButton;
    L_faschgrname: TLabel;
    SBfajobcode: TSpeedButton;
    L_fajobcodename: TLabel;
    E_faname: TEdit;
    E_facode: TEdit;
    E_faschgr: TEdit;
    E_fajobcode: TEdit;
    E_faplace: TEdit;
    SB_mateempno: TSpeedButton;
    E_mateempno: TEdit;
    P_mateempno: TPanel;
    Label11: TLabel;
    Panel1: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    BB_insert: TBitBtn;
    BB_cancel: TBitBtn;
    P_empno: TPanel;
    P_famikind: TPanel;
    Label1: TLabel;
    BB_Ok: TBitBtn;
    BB_delete: TBitBtn;
    Panel11: TPanel;
    Query_fami: TOraQuery;
    Query_famiEMPNO: TStringField;
    Query_famiKORNAME: TStringField;
    Query_famiFACODE: TStringField;
    Query_famiFANAME: TStringField;
    Query_famiFABIRTHDATE: TStringField;
    Query_famiFASCHGR: TStringField;
    Query_famiFAJOBCODE: TStringField;
    Query_famiFAPLACE: TStringField;
    Query_famiFAWITH: TStringField;
    Query_famiFAALLOWYN: TStringField;
    Query_famiFAMEDYN: TStringField;
    Query_famiFAMIKINDNAME: TStringField;
    Query_famiFACODENAME: TStringField;
    Query_famiFAMIKIND: TStringField;
    procedure Query_famiCalcFields(DataSet: TDataSet);
    procedure BB_CloseClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SB_facodeClick(Sender: TObject);
    procedure BB_saveClick(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure E_facodeKeyPress(Sender: TObject; var Key: Char);
    procedure SB_birthdateClick(Sender: TObject);
    procedure CB_fawithChange(Sender: TObject);
    procedure CB_fawithDblClick(Sender: TObject);
    procedure SB_faschgrClick(Sender: TObject);
    procedure E_faschgrKeyPress(Sender: TObject; var Key: Char);
    procedure SBfajobcodeClick(Sender: TObject);
    procedure E_fajobcodeKeyPress(Sender: TObject; var Key: Char);
    procedure SB_mateempnoClick(Sender: TObject);
    procedure ME_birthdateChange(Sender: TObject);
    procedure BB_insertClick(Sender: TObject);
    procedure BB_cancelClick(Sender: TObject);
    procedure BB_OkClick(Sender: TObject);
    procedure BB_deleteClick(Sender: TObject);
  private
    procedure LoadFamily;
    procedure DataAllClear;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FamilyForm: TFamilyForm;
  Save_EMPNO, Save_FACODE, Save_FABIRTHDATE: String;

implementation

{$R *.DFM}

uses pkg10221;

procedure TFamilyForm.FormActivate(Sender: TObject);
begin
     Phelpmsg.Caption := '  가족사항을 조회하고 있습니다.';
     Application.ProcessMessages;

     P_empno.Caption     := MainForm.E_empno.Text;         {사번}
     E_mateempno.Text    := MainForm.E_mateempno.Text;     {사내부부 사번}
     P_mateempno.Caption := MainForm.P_mateempno.Caption;  {사내부부 성명}

     LoadFamily;

     if MainForm.Job_mode <> 1 then
          BB_Ok.Enabled := False
     else
          BB_Ok.Enabled := True;

     Phelpmsg.Caption := '';
     Save_EMPNO := '';
     Save_FACODE := '';
     Save_FABIRTHDATE := '';
end;

procedure TFamilyForm.BB_CloseClick(Sender: TObject);
begin
     MainForm.Job_mode := 0;
     Query_fami.Close;
     Close;
end;

Procedure TFamilyForm.LoadFamily;
var
     V: Variant;
     SearchOptions: TLocateOptions;
begin
     DataAllClear;

     with Query_fami do
     begin
          Close;
          SQL.Clear;
          SQL.Add('select empno,                          ');
          SQL.Add('       korname,                        ');
          SQL.Add('       facode,                         ');
          SQL.Add('       faname,                         ');
          SQL.Add('       fabirthdate,                    ');
          SQL.Add('       faschgr,                        ');
          SQL.Add('       fajobcode,                      ');
          SQL.Add('       faplace,                        ');
          SQL.Add('       fawith,                         ');
          SQL.Add('       faallowyn,                      ');
          SQL.Add('       famedyn                         ');
          SQL.Add('  from pimfami                         ');
          SQL.Add(' where empno = :p_empno                ');
          SQL.Add(' order by facode, fakind, korname      ');
          ParamByName('p_empno').AsString := P_empno.Caption;
          Open;

          if RecordCount = 0 then
          begin
               MessageBox(handle, '사번에 대한 가족내역이 없습니다.'+#13+
                                  '입력버튼을 눌러 신규등록을 하십시오.',
                                  '작업안내', MB_ICONWARNING);
               System.Exit;
          end
          else
          begin
               V    := VarArrayCreate([0,2], varVariant);
               V[0] := Save_EMPNO;
               V[1] := Save_FACODE;
               V[2] := Save_FABIRTHDATE;
               SearchOptions := [loPartialKey];
               if Locate('EMPNO;FACODE;FABIRTHDATE', V, SearchOptions) then DBGrid1.SetFocus;
          end;
     end;
end;

procedure TFamilyForm.DataAllClear;
begin
     E_faname.Text      := '';
     E_facode.Text      := '';   L_facodename.Caption    := '';
     P_famikind.Caption := '';   L_famikindname.Caption  := '';
     ME_birthdate.Text  := '';
     CB_fawith.Text     := 'Y';
     E_faschgr.Text     := '';   L_faschgrname.Caption   := '';
     E_fajobcode.Text   := '';   L_fajobcodename.Caption := '';
     E_faplace.Text     := '';
     Phelpmsg.Caption := '';
end;

procedure TFamilyForm.DataSource1DataChange(Sender: TObject; Field: TField);
begin
     E_faname.Text           := Query_famiFANAME.AsString;
     E_facode.Text           := Query_famiFACODE.AsString;
     L_facodename.Caption    := Query_famifacodename.AsString;
     P_famikind.Caption      := Query_famifamikind.AsString;
     L_famikindname.Caption  := Query_famifamikindname.AsString;
     ME_birthdate.Text       := Query_famiFABIRTHDATE.AsString;
     CB_fawith.Text          := Query_famiFAWITH.AsString;
     E_faschgr.Text          := Query_famiFASCHGR.AsString;
     L_faschgrname.Caption   := GetCodeName('I221', Query_famiFASCHGR.AsString); {학력}
     E_fajobcode.Text        := Query_famiFAJOBCODE.AsString;
     L_fajobcodename.Caption := GetCodeName('I212', Query_famiFAJOBCODE.AsString); {직업}
     E_faplace.Text          := Query_famiFAPLACE.AsString;
end;

procedure TFamilyForm.Query_famiCalcFields(DataSet: TDataSet);
var
     famikind: string[1];
begin
     case StrToIntDef(Query_famiFACODE.AsString, -1) of
          00,01,02 :
               famikind := 'D';         {본인}
          30,31,32 :
               famikind := 'A';         {배우자}
          10..14,20..22,91,92,95,96 :
               famikind := 'B';         {존속}
          40..42,50..52,55..56 :
               famikind := 'C';         {비속}
          else
               famikind := 'Z';         {기타}
     end;
     Query_famifamikind.AsString     := famikind;
     Query_famifamikindname.AsString := GetCodeName('K410', famikind); {가족구분}
     Query_famifacodename.AsString   := GetCodeName('I211', Query_famiFACODE.AsString); {가족관계}
end;

procedure TFamilyForm.SB_facodeClick(Sender: TObject);
var
     famikind: string[1];
begin
     FKeyCode := TFKeyCode.Create(Self);
     Try
          FKeyCode.FormData := '가족관계 코드조회';
          FKeyCode.DataVal1 := 'I211';
          FKeyCode.ShowModal;
          if FKeyCode.CloseChk = -1 then Exit;
          E_facode.Text        := FKeyCode.Code;
          L_facodename.Caption := FKeyCode.Codename;

          {가족구분}
          case StrToIntDef(E_facode.Text, -1) of
               00,01,02 :
                    P_famikind.Caption := 'D'; {본인}
               30,31,32 :
                    P_famikind.Caption := 'A';
               10..14,20..22,91,92,95,96 :
                    P_famikind.Caption := 'B';
               40..42,50..52,55..56 :
                    P_famikind.Caption := 'C';
               else
                    P_famikind.Caption := 'Z';
          end;
          L_famikindname.Caption := GetCodeName('K410', P_famikind.Caption);
     Finally
          FKeyCode.Free;
     end;
end;

procedure TFamilyForm.E_facodeKeyPress(Sender: TObject; var Key: Char);
var
     famikind: string[1];
begin
     if Key <> #13 then System.Exit;
     Key := #0;
     L_facodename.Caption := GetCodeName('I211', E_facode.Text);

     {가족구분}
     case StrToIntDef(E_facode.Text, -1) of
          00,01,02:
               P_famikind.Caption := 'D'; {본인}
          30,31,32:
               P_famikind.Caption := 'A';
          10..14,20..22,91,92,95,96:
               P_famikind.Caption := 'B';
          40..42,50..52,55..56:
               P_famikind.Caption := 'C';
          else
               P_famikind.Caption := 'Z';
     end;
     L_famikindname.Caption := GetCodeName('K410', P_famikind.Caption);
end;

procedure TFamilyForm.SB_faschgrClick(Sender: TObject);
begin
  Fkeycode := TFKeyCode.Create(Self);
  Try
       FKeyCode.FormData := '학력 코드조회';
       FKeyCode.DataVal1 := 'I221';
       FKeyCode.ShowModal;

       if FKeyCode.CloseChk = -1 then Exit;

       E_faschgr.Text        := FKeyCode.Code;
       L_faschgrname.Caption := FKeyCode.Codename;
  Finally
       FKeyCode.Free;
  end;
end;

procedure TFamilyForm.E_faschgrKeyPress(Sender: TObject; var Key: Char);
begin
     if Key <> #13 then System.Exit;
     Key := #0;
     L_faschgrname.Caption := GetCodeName('I221', E_faschgr.Text);
end;

procedure TFamilyForm.SBfajobcodeClick(Sender: TObject);
begin
     Fkeycode := TFkeycode.Create(Self);
     Try
          Fkeycode.FormData := '직업 코드조회';
          Fkeycode.DataVal1 := 'I212';
          Fkeycode.ShowModal;

          if Fkeycode.CloseChk = -1 then Exit;

          E_fajobcode.Text        := Fkeycode.Code;
          L_fajobcodename.Caption := Fkeycode.Codename;
     Finally
          Fkeycode.Free;
     end;
end;

procedure TFamilyForm.E_fajobcodeKeyPress(Sender: TObject; var Key: Char);
begin
     if Key <> #13 then System.Exit;
     Key := #0;
     L_fajobcodename.Caption := GetCodeName('I212', E_fajobcode.Text);
end;

procedure TFamilyForm.SB_birthdateClick(Sender: TObject);
var
     calendar: Tcalendar;
begin
     Try
          calendar := Tcalendar.Create(Self);
          calendar.ShowModal;
          if calendar.DayCaption <> '' then
               ME_birthdate.Text := calendar.DayCaption;
     Finally
          calendar.free;
     end;
end;

procedure TFamilyForm.ME_birthdateChange(Sender: TObject);
begin
     if Length(ME_birthdate.Text) = 8 then
     begin
          if fn_IsDate(ME_birthdate.Text) = False then
          begin
               MessageBox(handle,'생년월을 정확히 입력하세요!', '입력오류', MB_ICONWARNING);
               ME_birthdate.SetFocus;
          end;
     end;
end;

procedure TFamilyForm.CB_fawithChange(Sender: TObject);
begin
     CB_fawith.Text := YesNoCombo(CB_fawith.Text);
end;

procedure TFamilyForm.CB_fawithDblClick(Sender: TObject);
begin
     CB_fawith.Text := YesNoComboDC(CB_fawith.Text);
end;

procedure TFamilyForm.SB_mateempnoClick(Sender: TObject);
begin
     FKeyEmpno := TFKeyEmpno.Create(Self);
     Try
          FKeyEmpno.Edempno.Text := E_mateempno.Text;
          FKeyEmpno.ShowModal;
          if FKeyEmpno.CloseChk <> -1 then
          begin
               E_mateempno.Text    := FKeyEmpno.v_keyempno;
               P_mateempno.Caption := FKeyEmpno.v_keykorname;
          end
          else
          begin
               E_mateempno.Text    := '';
               P_mateempno.Caption := '';
          end;
     Finally
          FKeyEmpno.Free;
     end;
end;

procedure TFamilyForm.BB_saveClick(Sender: TObject);
var
     qq : TOraQuery;
begin
     if E_faname.Text = '' then
     begin
          MessageBox(handle,'가족성명을 정확히 입력하세요', '입력오류', MB_ICONWARNING);
          E_faname.SetFocus;
          System.exit;
     end;

     if (E_facode.Text = '') or (L_facodename.Caption = '') then
     begin
          MessageBox(handle,'가족관계를 정확히 입력하세요', '입력오류', MB_ICONWARNING);
          E_facode.SetFocus;
          System.exit;
     end;

     if fn_IsDate(ME_birthdate.Text) = False then
     begin
          MessageBox(handle,'생년월을 정확히 입력하세요!', '입력오류', MB_ICONWARNING);
          ME_birthdate.SetFocus;
     end;

     if CB_fawith.Text = '' then
     begin
          MessageBox(handle,'동거여부를 정확히 선택하세요', '입력오류', MB_ICONWARNING);
          CB_fawith.SetFocus;
          System.exit;
     end;

{     if (E_faschgr.Text = '') or (L_faschgrname.Caption = '') then
     begin
          MessageBox(handle,'학력을 정확히 입력하세요', '입력오류', MB_ICONWARNING);
          E_faschgr.SetFocus;
          System.exit;
     end;

     if (E_fajobcode.Text = '') or (L_fajobcodename.Caption = '') then
     begin
          MessageBox(handle,'직업을 정확히 입력하세요', '입력오류', MB_ICONWARNING);
          E_fajobcode.SetFocus;
          System.exit;
     end;}

     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     Try
          with qq do
          begin
               Close;
               SQL.Clear;
               SQL.Add('select faname, faallowyn from pimfami  ');
               SQL.Add(' where empno  = :p_empno               ');
               SQL.Add('   and faname = :p_faname              ');
               SQL.Add('   and facode = :p_facode              ');
               ParamByName('p_empno').AsString  := P_empno.Caption;
               ParamByName('p_faname').AsString := E_faname.Text;
               ParamByName('p_facode').AsString := E_facode.Text;
               Open;

               if ReCordCount > 0 then {이미 등록된 가족}
               begin
                    if FieldByName('FAALLOWYN').AsString = 'Y' then
                    begin
                         if Application.MessageBox('가족수당 지급중인 가족으로 학력,직업,근무지만 수정됩니다. 저장하시겠습니까 ?',
                                                   '작업안내',MB_OKCANCEL + MB_DefButton1) = IDOK then
                         begin
                              Close;
                              SQL.Clear;
                              SQL.Add('update pimfami                                            ');
                              SQL.Add('   set faschgr   = :p_faschgr,                            ');
                              SQL.Add('       fajobcode = :p_fajobcode,                          ');
                              SQL.Add('       faplace   = :p_faplace,                            ');
                              SQL.Add('       writetime = to_char(sysdate, ''YYYYMMDDHH24MISS''),');
                              SQL.Add('       writeemp  = :p_writeemp                            ');
                              SQL.Add(' where empno  = :p_empno                                  ');
                              SQL.Add('   and faname = :p_faname                                 ');
                              SQL.Add('   and facode = :p_facode                                 ');
                              ParamByName('p_faschgr').AsString   := E_faschgr.Text;
                              ParamByName('p_fajobcode').AsString := E_fajobcode.Text;
                              ParamByName('p_faplace').AsString   := E_faplace.Text;
                              ParamByName('p_writeemp').AsString  := Pempno;
                              ParamByName('p_empno').AsString     := P_empno.Caption;
                              ParamByName('p_faname').AsString    := E_faname.Text;
                              ParamByName('p_facode').AsString    := E_facode.Text;
                              ExecSQL;
                              Phelpmsg.Caption := '  학력,직업,근무지만 수정되었습니다.';
                      end;
                    end
                    else if FieldByName('FAALLOWYN').AsString = 'N' then
                    begin
                         Close;
                         SQL.Clear;
                         SQL.Add('select faminame from pkmfmmas    ');
                         SQL.Add(' where empno    = :p_empno       ');
                         SQL.Add('   and faminame = :p_faminame    ');
                         ParamByName('p_empno').AsString    := P_empno.Caption;
                         ParamByName('p_faminame').AsString := E_faname.Text;
                         Open;
                         if RecordCount > 0 then
                         begin
                              MessageBox(handle,'현재 가족명으로 가족수당 신청내역이 있습니다.  수정할 수 없습니다', '작업안내', MB_ICONWARNING);
                              E_faschgr.SetFocus;
                              System.exit;
                         end
                         else
                         begin
                              Close;
                              SQL.Clear;
                              SQL.Add('update pimfami                                                ');
                              SQL.Add('   set fabirthdate = :p_fabirthdate,                          ');
                              SQL.Add('       faschgr     = :p_faschgr,                              ');
                              SQL.Add('       fajobcode   = :p_fajobcode,                            ');
                              SQL.Add('       faplace     = :p_faplace,                              ');
                              SQL.Add('       fawith      = :p_fawith,                               ');
                              SQL.Add('       writetime   = to_char(sysdate, ''YYYYMMDDHH24MISS''),  ');
                              SQL.Add('       writeemp    = :p_writeemp                              ');
                              SQL.Add(' where empno  = :p_empno                                      ');
                              SQL.Add('   and faname = :p_faname                                     ');
                              SQL.Add('   and facode = :p_facode                                     ');
                              ParamByName('p_fabirthdate').AsString := ME_birthdate.Text;
                              ParamByName('p_faschgr').AsString     := E_faschgr.Text;
                              ParamByName('p_fajobcode').AsString   := E_fajobcode.Text;
                              ParamByName('p_faplace').AsString     := E_faplace.Text;
                              ParamByName('p_fawith').AsString      := CB_fawith.Text;
                              ParamByName('p_writeemp').AsString    := Pempno;
                              ParamByName('p_empno').AsString       := P_empno.Caption;
                              ParamByName('p_faname').AsString      := E_faname.Text;
                              ParamByName('p_facode').AsString      := E_facode.Text;
                              ExecSQL;
                              Phelpmsg.Caption := '  변경된 항목이 수정되었습니다.';
                         end;
                    end;
               end
               else
               begin
                    if Application.MessageBox('확실히 저장하시겠습니까 ?', '작업안내',
                                              MB_OKCANCEL + MB_DefButton1) = IDOK then
                    begin
                         Close;
                         SQL.Clear;
                         SQL.Add('insert into pimfami ( empno,            ');
                         SQL.Add('                      korname,          ');
                         SQL.Add('                      facode,           ');
                         SQL.Add('                      faname,           ');
                         SQL.Add('                      fabirthdate,      ');
                         SQL.Add('                      faschgr,          ');
                         SQL.Add('                      fajobcode,        ');
                         SQL.Add('                      faplace,          ');
                         SQL.Add('                      fawith,           ');
                         SQL.Add('                      faallowyn,        ');
                         SQL.Add('                      writetime,        ');
                         SQL.Add('                      writeemp )        ');
                         SQL.Add('             values ( :p_empno,         ');
                         SQL.Add('                      :p_korname,       ');
                         SQL.Add('                      :p_facode,        ');
                         SQL.Add('                      :p_faname,        ');
                         SQL.Add('                      :p_fabirthdate,   ');
                         SQL.Add('                      :p_faschgr,       ');
                         SQL.Add('                      :p_fajobcode,     ');
                         SQL.Add('                      :p_faplace,       ');
                         SQL.Add('                      :p_fawith,        ');
                         SQL.Add('                      ''N'',            ');
                         SQL.Add('                      :p_writetime,     ');
                         SQL.Add('                      :p_writeemp )     ');
                         ParamByName('p_EMPNO').AsString       := MainForm.E_empno.Text;
                         ParamByName('p_KORNAME').AsString     := MainForm.P_korname.Caption;
                         ParamByName('p_FACODE').AsString      := E_facode.Text;
                         ParamByName('p_FANAME').AsString      := E_faname.Text;
                         ParamByName('p_FABIRTHDATE').AsString := ME_birthdate.Text;
                         ParamByName('p_FASCHGR').AsString     := E_faschgr.Text;
                         ParamByName('p_FAJOBCODE').AsString   := E_fajobcode.Text;
                         ParamByName('p_FAPLACE').AsString     := E_faplace.Text;
                         ParamByName('p_FAWITH').AsString      := CB_fawith.Text;
                         ParamByName('p_WRITETIME').AsString   := Copy(MainForm.Curdate,1,14);
                         ParamByName('p_WRITEEMP').AsString    := Pempno; {login한 사번으로}
                         ExecSQL;
                         Phelpmsg.Caption := '  새로운 자료가 저장되었습니다.';
                    end;
               end;

{               if MainForm.E_mateempno.Text <> E_mateempno.Text then //사내부부가 변동하면
               begin
                    Close;
                    SQL.Clear;
                    SQL.Add('update pkmpmas                      ');
                    SQL.Add('   set mateempno = :p_mateempno     ');
                    SQL.Add(' where empno = :p_empno             ');
                    ParamByName('p_mateempno').AsString := E_mateempno.Text;
                    ParamByName('p_empno').AsString     := P_empno.Caption;
                    ExecSQL;
                    MainForm.E_mateempno.Text    := E_mateempno.Text;     //사내부부 사번
                    MainForm.P_mateempno.Caption := P_mateempno.Caption;  //사내부부 성명
               end;}
          end;
     Finally
          qq.Free;
     end;

     Save_EMPNO       := P_empno.Caption;
     Save_FACODE      := E_facode.Text;
     Save_FABIRTHDATE := ME_birthdate.Text;
     LoadFamily;
end;

procedure TFamilyForm.DBGrid1DblClick(Sender: TObject);
var
     qq : TOraQuery;
     Inwon : integer;
begin
     if MainForm.Job_mode <> 1 then {지급신청만 사용가능}
          System.Exit;

     if Query_fami.RecordCount = 0 then
     begin
          MessageBox(handle,'등록되어있는 가족이 없습니다', '입력오류', MB_ICONWARNING);
          E_faname.SetFocus;
          System.exit;
     end;

     if Query_famiFAALLOWYN.AsString = 'Y' then
     begin
          MessageBox(handle, '기 지급중인 가족입니다. 이상이 있으시면 가족수당 관리부서에 연락해주십시오',
                             '작업안내', MB_ICONWARNING);
          System.exit;
     end;

     if not ((Query_famifamikind.AsString = 'A') or
             (Query_famifamikind.AsString = 'B') or
             (Query_famifamikind.AsString = 'C'))
     then
     begin
          MessageBox(handle, '가족수당 지급신청은 배우자,존속,비속만 가능합니다.  지급신청할 수 없습니다.',
                             '작업안내', MB_ICONWARNING);
          System.exit;
     end;

     if Copy(Query_famiFACODE.AsString,2,1) = '0' then
     begin
          MessageBox(handle, '시청할 수 없는 가족관계입니다.', '작업안내', MB_ICONWARNING);
          System.exit;
     end;

     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     Try
          with qq do
          begin
               Close;
               SQL.Clear;
               SQL.Add('select faminame, famiyn                   ');
               SQL.Add('  from pkmfmmas                           ');
               SQL.Add(' where empno     = :p_empno               ');
               SQL.Add('   and faminame  = :p_faminame            ');
               SQL.Add('   and famibdate = :p_famibdate           ');
               SQL.Add('   and substr(appkind,1,1) = ''A''        ');
               SQL.Add('   and famitodate is null                 ');
               ParamByName('p_empno').AsString     := Query_famiEMPNO.AsString;
               ParamByName('p_faminame').AsString  := Query_famiFANAME.AsString;
               ParamByName('p_famibdate').AsString := Query_famiFABIRTHDATE.AsString;
               Open;

               if RecordCount > 0 then
               begin
                    if FieldByName('FAMIYN').AsString = 'Y' then
                         MessageBox(handle, '기 지급중인 가족입니다. 이상이 있으시면 가족수당 관리부서에 연락해주십시오',
                                            '작업안내', MB_ICONWARNING)
                    else
                         MessageBox(handle, '이미 지급신청되어 있는 가족입니다. 이상이 있으시면 가족수당 관리부서에 연락해주십시오',
                                            '작업안내', MB_ICONWARNING);

                    System.exit;
               end;

               if Query_famifamikind.AsString = 'A' then {제한인원}
                    Inwon := MainForm.F_matecnt
               else if Query_famifamikind.AsString = 'B' then
                    Inwon := MainForm.F_parentcnt
               else if Query_famifamikind.AsString = 'C' then
                    Inwon := MainForm.F_childcnt;

               Close;
               SQL.Clear;
               SQL.Add('select faminame from pkmfmmas          ');
               SQL.Add(' where empno = :p_empno                ');
               SQL.Add('   and substr(appkind,1,1) = ''A''     ');
               SQL.Add('   and famitodate is null              ');
               SQL.Add('   and famiyn = ''Y''                  ');
               SQL.Add('   and famikind = :p_famikind          ');
               ParamByName('p_empno').AsString    := Query_famiEMPNO.AsString;
               ParamByName('p_famikind').AsString := Query_famifamikind.AsString;
               Open;

               if RecordCount > 0 then  {기신청 동일가족구분수}
               begin
                    if RecordCount >= Inwon then
                    begin
                         MessageBox(handle, '가족구분별 신청제한 인원을 초과했습니다.  더이상 지급신청할 수 없습니다.',
                                            '작업안내', MB_ICONWARNING);
                         System.Exit;
                    end;
               end;
          end;
     Finally
          qq.Free;
     end;

     MainForm.P_faminame.Caption     := Query_famiFANAME.AsString;
     MainForm.P_famirel.Text      := Query_famiFACODE.AsString;
     MainForm.L_famirelname.Caption  := Query_famifacodename.AsString;
     MainForm.ME_famibdate.TEXT       := Copy(Query_famiFABIRTHDATE.AsString,1,4)+'.'+
                                        Copy(Query_famiFABIRTHDATE.AsString,5,2)+'.'+
                                        Copy(Query_famiFABIRTHDATE.AsString,7,2);
     MainForm.L_famibdate.Caption    := Query_famiFABIRTHDATE.AsString;
     MainForm.P_famikind.text     := Query_famifamikind.AsString;
     MainForm.L_famikindname.Caption := Query_famifamikindname.AsString;

     Query_fami.Close;
     Close;
end;

procedure TFamilyForm.BB_insertClick(Sender: TObject);
begin
     DataAllClear;
     Phelpmsg.Caption := '  미 등록된 가족을 입력하신후 저장버튼을 누루세요.';
     E_faname.SetFocus;
end;

procedure TFamilyForm.BB_cancelClick(Sender: TObject);
begin
     DataAllClear;
     DBGrid1.SetFocus;
end;

procedure TFamilyForm.BB_OkClick(Sender: TObject);
begin
     DBGrid1DblClick(Sender);
end;

procedure TFamilyForm.BB_deleteClick(Sender: TObject);
var
     qq : TOraQuery;
begin
     DataSource1DataChange(Sender, TField(nil));  {refresh}

     if Query_fami.RecordCount = 0 then
     begin
          MessageBox(handle,'등록되어있는 가족이 없습니다.', '입력오류', MB_ICONWARNING);
          E_faname.SetFocus;
          System.exit;
     end;

     if Query_famiFAALLOWYN.AsString = 'Y' then
     begin
          if Application.MessageBox('수당 지급중인 가족으로 삭제하면 수당지급이 취소됩니다.  삭제하시겠습니가 ?', '작업안내',
                                    MB_OKCANCEL + MB_DefButton1) <> IDOK
          then
               System.exit;
     end
     else
     begin
          if Application.MessageBox('확실히 삭제하시겠습니가 ?', '작업안내',
                                    MB_OKCANCEL + MB_DefButton1) <> IDOK
          then
               System.exit;
     end;

{     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     Try
          with qq do
          begin
               Close;
               SQL.Clear;
               SQL.Add('delete pimfami                 ');
               SQL.Add(' where empno  = :p_empno       ');
               SQL.Add('   and faname = :p_faname      ');
               SQL.Add('   and facode = :p_facode      ');
               ParamByName('p_empno').AsString  := P_empno.Caption;
               ParamByName('p_faname').AsString := E_faname.Text;
               ParamByName('p_facode').AsString := E_facode.Text;
               ExecSQL;

               Phelpmsg.Caption := '  자료가 삭제되었습니다.';
               LoadFamily;
          end;
     Finally
          qq.Free;
     end;       }
end;

end.


