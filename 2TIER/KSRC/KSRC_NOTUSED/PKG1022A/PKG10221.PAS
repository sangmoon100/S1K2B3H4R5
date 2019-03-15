unit pkg10221;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, Buttons, Mask, ExtCtrls, DB, DBTables,
  Calen1, TimeFtp, Pass, DateLib, Kylib1, KeyEmpNo, DBAccess, Ora, Func,KeyCode, MemDS;//, UserHelp;

type
  TMainForm = class(TForm)
    Panel1: TPanel;
    P_buttons: TPanel;
    Phelpmsg: TPanel;
    Panel5: TPanel;
    L_UserName: TLabel;
    L_Curdate: TLabel;
    BBdel: TBitBtn;
    BBConyn: TBitBtn;
    BBexit: TBitBtn;
    DBGrid1: TDBGrid;
    GB_family: TGroupBox;
    ME_regdate: TMaskEdit;
    DataSource1: TDataSource;
    BBsave: TBitBtn;
    BBcriteria: TBitBtn;
    BBins_a1: TBitBtn;
    BBupdate: TBitBtn;
    P_family: TPanel;
    Label3: TLabel;
    BBfamily: TBitBtn;
    BBins_B1: TBitBtn;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel7: TPanel;
    Panel9: TPanel;
    SB_regdate: TSpeedButton;
    Label1: TLabel;
    Panel11: TPanel;
    CB_firstyn: TComboBox;
    Panel12: TPanel;
    ME_fawithdate: TMaskEdit;
    Panel13: TPanel;
    SB_fawithdate: TSpeedButton;
    E_mateempno: TEdit;
    P_mateempno: TPanel;
    Label11: TLabel;
    Panel14: TPanel;
    SB_mateempno: TSpeedButton;
    aa: TLabel;
    Panel15: TPanel;
    CB_appdesc: TComboBox;
    Image1: TImage;
    P_Initial: TPanel;
    Image2: TImage;
    Label2: TLabel;
    BB_Delete: TBitBtn;
    Label4: TLabel;
    Label5: TLabel;
    Query_fmmas: TOraQuery;
    Panel6: TPanel;
    P_Korname: TPanel;
    ME_appstdate: TMaskEdit;
    SB_appstdate: TSpeedButton;
    ME_appeddate: TMaskEdit;
    SB_appeddate: TSpeedButton;
    Label6: TLabel;
    CB_appYN: TComboBox;
    Panel16: TPanel;
    Panel17: TPanel;
    Panel18: TPanel;
    Panel8: TPanel;
    ME_appdate: TMaskEdit;
    SpeedButton3: TSpeedButton;
    Panel10: TPanel;
    BBsearch: TBitBtn;
    Query_fmmasEMPNO: TStringField;
    Query_fmmasKORNAME: TStringField;
    Query_fmmasAPPKIND: TStringField;
    Query_fmmasAPPKINDNAME: TStringField;
    Query_fmmasFAMIKIND: TStringField;
    Query_fmmasFAMIKINDNAME: TStringField;
    Query_fmmasFAMIREL: TStringField;
    Query_fmmasFAMIRELNAME: TStringField;
    Query_fmmasFAMINAME: TStringField;
    Query_fmmasFAMIBDATE: TStringField;
    Query_fmmasFAMIWITH: TStringField;
    Query_fmmasFAWITHDATE: TStringField;
    Query_fmmasAPPDATE: TStringField;
    Query_fmmasREGDATE: TStringField;
    Query_fmmasAPPDESC: TStringField;
    Query_fmmasFAMIYN: TStringField;
    Query_fmmasFAMIFRDATE: TStringField;
    Query_fmmasFAMITODATE: TStringField;
    Query_fmmasFAMIDESC: TStringField;
    Query_fmmasMAILYN: TStringField;
    Query_fmmasEEMPNO: TStringField;
    Query_fmmasFASCHGR: TStringField;
    Query_fmmasFASCHGRNAME: TStringField;
    Query_fmmasFAJOBCODE: TStringField;
    Query_fmmasFAJOBNAME: TStringField;
    Query_fmmasFAPLACE: TStringField;
    Query_fmmasFIRSTYN: TStringField;
    Query_fmmasCONYN: TStringField;
    SB_empno: TSpeedButton;
    P_appkind: TComboBox;
    E_empno: TEdit;
    ME_famibdate: TMaskEdit;
    SpeedButton1: TSpeedButton;
    E_fajobcode: TEdit;
    SBfajobcode: TSpeedButton;
    E_faschgr: TEdit;
    SB_faschgr: TSpeedButton;
    E_faplace: TEdit;
    Panel20: TPanel;
    Panel19: TPanel;
    Panel21: TPanel;
    L_faschgrname: TPanel;
    L_fajobcodename: TPanel;
    SBfamirel: TSpeedButton;
    L_famirelname: TPanel;
    E_famikind: TEdit;
    L_famikindname: TPanel;
    SBfamikind: TSpeedButton;
    E_famirel: TEdit;
    E_faminame: TEdit;
    SB_faminame: TSpeedButton;
    Panel22: TPanel;
    CB_fawith: TComboBox;
    procedure FormActivate(Sender: TObject);
    procedure Query_fmmasCalcFields(DataSet: TDataSet);
    procedure BBexitClick(Sender: TObject);
    procedure BBcriteriaClick(Sender: TObject);
    procedure BBfamilyClick(Sender: TObject);
    procedure BBsaveClick(Sender: TObject);
    procedure BBdelClick(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure BBins_a1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BBupdateClick(Sender: TObject);
    procedure SB_empnoClick(Sender: TObject);
    procedure BBins_B1Click(Sender: TObject);
    procedure ME_regdateChange(Sender: TObject);
    procedure ME_fawithdateChange(Sender: TObject);
    procedure CB_firstynDblClick(Sender: TObject);
    procedure CB_firstynChange(Sender: TObject);
    procedure SB_mateempnoClick(Sender: TObject);
    procedure SB_regdateClick(Sender: TObject);
    procedure SB_fawithdateClick(Sender: TObject);
//    procedure E_empnoKeyPress(Sender: TObject; var Key: Char);
    procedure CB_appdescChange(Sender: TObject);
    procedure E_mateempnoKeyPress(Sender: TObject; var Key: Char);
    procedure BB_DeleteClick(Sender: TObject);
    procedure E_empnoChange(Sender: TObject);
    procedure SB_appstdateClick(Sender: TObject);
    procedure SB_appeddateClick(Sender: TObject);
    procedure BBsearchClick(Sender: TObject);
    procedure SBfajobcodeClick(Sender: TObject);
    procedure SB_faschgrClick(Sender: TObject);
    procedure SBfamirelClick(Sender: TObject);
    procedure SB_faminameClick(Sender: TObject);
    procedure BBConynClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Curdate : String;
    Start : Integer;
    Job_mode : Integer;     {0.열람/무효, 1.직급신청, 2.해지신청, 3.신청변경}
    F_mateamt, F_childamt, F_parentamt : Real;
    F_matecnt, F_childcnt, F_parentcnt : Integer;
    F_parentminage, F_childmaxage, F_togethermm : Integer;
    procedure LoadData;
    function  Empno_Check: Boolean;
    procedure DataAllClear;
    procedure Create_appdesc;
  end;

var
  MainForm: TMainForm;
  Running: Boolean;
  Save_EMPNO, Save_FAMIREL, Save_FAMIBDATE, Save_APPKIND: String;
  CheckEmp : Integer;

implementation
{$R *.DFM}

uses pkg10222,  pkg10224,  pkg10225;

procedure TMainForm.FormActivate(Sender: TObject);
var
     qq : TOraQuery;
begin

     if Running then System.Exit;

     Running := True;

     Application.ProcessMessages;
     OraConnect;
     L_UserName.Caption := Pkorname + '(' +pempno+ ')';

     Curdate := fn_GetDateTimeStr;

     L_Curdate.Caption  := fn_GetDateStr;

     ME_appstdate.Text  := CalcMonth(Copy(fn_GetDateTimeStr,1,6),-1)+'01';
     ME_appeddate.Text  := Copy(fn_GetDateTimeStr,1,8);



     E_empno.Text      := Pempno;            {login한 사원}
     P_Korname.Caption := Pkorname;          {login한 사원의 성명}

     Save_EMPNO     := '';
     Save_FAMIREL   := '';
     Save_FAMIBDATE := '';
     Save_APPKIND   := '';

     if not ((Copy(PGrade,3,1) = 'A') or (Copy(PGrade,3,1) = 'B')) then
          E_empno.Enabled := False; {권한이 A나B가 아니면 사번변경 못함}

     GB_family.Enabled := False;

     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     Try
          with qq do
          begin
               Close;
               SQL.Clear;
               SQL.Add('select mateamt, childamt, parentamt,          ');
               SQL.Add('       matecnt, childcnt, parentcnt,          ');
               SQL.Add('       parentminage, childmaxage, togethermm  ');
               SQL.Add('  from pkcfmbas                               ');
               Open;

               if RecordCount > 0 then
               begin
                    F_mateamt      := FieldByName('mateamt').AsFloat;
                    F_childamt     := FieldByName('childamt').AsFloat;
                    F_parentamt    := FieldByName('parentamt').AsFloat;

                    F_matecnt      := FieldByName('matecnt').AsInteger;
                    F_childcnt     := FieldByName('childcnt').AsInteger;
                    F_parentcnt    := FieldByName('parentcnt').AsInteger;

                    F_parentminage := FieldByName('parentminage').AsInteger;
                    F_childmaxage  := FieldByName('childmaxage').AsInteger;
                    F_togethermm   := FieldByName('togethermm').AsInteger;
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

     Query_fmmas.Session := Ora_Session;

     BBsearch.Click;
     P_Initial.Visible := False;

{     if not Empno_Check then
     begin
          P_Initial.Visible := False;
          MessageBox(handle, '급여마스터에 등록되지 않은 사원입니다.  작업할 수 없습니다.',
                             '작업안내', MB_ICONWARNING)
     end
     else
     begin
          LoadData;
          P_Initial.Visible := False;
     end;}
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
     start := 0;
     Running := False;
end;

procedure TMainForm.BBexitClick(Sender: TObject);
begin
     Close;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := caFree;
end;

// 그리드에 신청내역을 보여준다
procedure TMainForm.LoadData;
begin

end;


procedure TMainForm.DataAllClear;
begin
     E_empno.Text        := '';
     P_Korname.Caption   := '';
     ME_appdate.Text     := '';
     P_appkind.Text      := ''; {신청구분}
     E_faminame.text  := '';
     E_famirel.Text   := '';    L_famirelname.Caption  := '';
     ME_famibdate.Text := '';   // L_famibdate.Caption    := ''; {화면에 보이지않음}
     E_famikind.Text  := '';    L_famikindname.Caption := '';
     ME_regdate.Text     := '';
     CB_appdesc.Text     := '';
     ME_fawithdate.Text  := '';
end;

function TMainForm.Empno_Check: Boolean;
var
     qq : TOraQuery;
begin
//     DataAllClear;
//     Job_mode := 0;

     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     Try
          with qq do
          begin
               Close;
               SQL.Clear;
               SQL.Add('select korname, firstyn, mateempno  ');
               SQL.Add('  from pkmpmas                      ');
               SQL.Add(' where empno = :p_empno             ');
               ParamByName('p_empno').AsString := E_empno.Text;
               Open;

               if RecordCount = 0 then
               begin
                    BBins_a1.Enabled   := False;
                    BBins_B1.Enabled   := False;
                    BBupdate.Enabled   := False;
                    BBdel.Enabled      := False;
                    BBsave.Enabled     := False;
                    BB_Delete.Enabled  := False;
                    Empno_Check := False;
               end
               else
               begin
                    P_Korname.Caption := FieldByName('KORNAME').AsString;
                    CB_firstyn.Text   := FieldByName('FIRSTYN').AsString;   {장남녀여부}

                    if CB_firstyn.Text = '' then CB_firstyn.Text := 'N';

                    E_mateempno.Text := FieldByName('MATEEMPNO').AsString; {배우자 사번}
                    P_mateempno.Caption := '';

                    if E_mateempno.Text <> '' then
                    begin
                         P_mateempno.Caption := GetKorName(E_mateempno.Text);
                    end;

                    BBins_a1.Enabled   := True;
                    BBins_B1.Enabled   := True;
                    BBupdate.Enabled   := True;
                    BBdel.Enabled      := True;
                    BBsave.Enabled     := True;
                    BB_Delete.Enabled  := True;
                    Empno_Check := True;
               end;
          end;
     Finally
          qq.Free;
     end;

end;

procedure TMainForm.Create_appdesc;
var
     Old_Item: string;
begin
     Old_Item := CB_appdesc.Text;
     CB_appdesc.Clear;

     if P_appkind.Text = '지급신청' then
     begin
          CB_appdesc.Items.Add('결 혼');
          CB_appdesc.Items.Add('(조)부모의 기준연령도달');
          CB_appdesc.Items.Add('자녀출생');
          CB_appdesc.Items.Add('(조)부모와 6개월 이상 동거');
          CB_appdesc.Items.Add('(기타) 직접 입력하세요!');
     end
     else if P_appkind.Text = '해지신청' then
     begin
          CB_appdesc.Items.Add('(조)부모 사망');
          CB_appdesc.Items.Add('자녀 사망');
          CB_appdesc.Items.Add('자녀 해지기준연령 도달');
          CB_appdesc.Items.Add('(조)부모와 비동거');
          CB_appdesc.Items.Add('수당수혜자 변경');
          CB_appdesc.Items.Add('이혼');
          CB_appdesc.Items.Add('(기타) 직접 입력하세요!');
     end;
     CB_appdesc.Text := Old_Item;
end;

procedure TMainForm.CB_appdescChange(Sender: TObject);
begin
     if CB_appdesc.Items.Count = 0 then System.Exit;

     if CB_appdesc.Items.Count = CB_appdesc.ItemIndex+1 then {기타}
     begin
          CB_appdesc.Text := '';
          CB_appdesc.ItemIndex := -1;
     end;
end;

// 새로운 필드를 디비그리드에 만들고 내용을 보여주는 부분
procedure TMainForm.Query_fmmasCalcFields(DataSet: TDataSet);
begin
     Query_fmmasfamikindname.AsString := GetCodeName('K410', Query_fmmasFAMIKIND.AsString); {가족구분}
     Query_fmmasfamirelname.AsString  := GetCodeName('I211', Query_fmmasFAMIREL.AsString);  {가족관계}
     Query_fmmasappkindname.AsString  := GetCodeName('K411', Query_fmmasAPPKIND.AsString);  {신청구분}

     if (copy(Query_fmmasAPPKIND.AsString,1,1) = 'A') and  {지급신청이고 }
        (Query_fmmasFAMIYN.AsString = 'Y') and             {지급중일때만 금액출력}
        (Query_fmmasFAMITODATE.AsString = '')
     then
     begin
//          if Query_fmmasFAMIKIND.AsString = 'A' then        {배우자}
//               Query_fmmasmcpamt.AsFloat := F_mateamt {가족수당 지급기준의 자료}
//          else if Query_fmmasFAMIKIND.AsString = 'B' then   {직계 존속}
//               Query_fmmasmcpamt.AsFloat := F_parentamt
//          else if Query_fmmasFAMIKIND.AsString = 'C' then   {직계 비속}
//               Query_fmmasmcpamt.AsFloat := F_childamt
//          else if Query_fmmasFAMIKIND.AsString = 'Z' then   {기타}
//               Query_fmmasmcpamt.AsFloat := 0
//          else
//               Query_fmmasmcpamt.AsFloat := 0;
     end
     else
     begin
//          Query_fmmasmcpamt.AsFloat := 0;
     end
end;

{지급기준화일의 내역을 보여주는 프로시져........................................}
procedure TMainForm.BBcriteriaClick(Sender: TObject);
begin
     StandardForm.ShowModal;
end;

procedure TMainForm.BBfamilyClick(Sender: TObject);
begin
//     FamilyForm.ShowModal;
end;

{지급신청}
procedure TMainForm.BBins_a1Click(Sender: TObject);
begin
     DataAllClear;
     GB_family.Enabled := True;
     Job_mode := 1;

//     BBfamilyClick(Sender);

{     if Job_mode <> 1 then
     begin
          LoadData;
          System.Exit;
     end;}

     Phelpmsg.Caption  := '  지급신청할 자료를 입력하신후 <저장>버튼을 누르세요.';
     P_appkind.Text := '지급신청';
//     ME_appdate.Text := InMask(Copy(CurDate,1,8),'@@@@.@@.@@');{신청일자}
     ME_appdate.Text := Copy(CurDate,1,8);

     Create_appdesc; {신청사유 Combo자료 생성}
     CB_appdesc.SetFocus;

     ME_regdate.Hint := '  출생일, 결혼일, 입사일,   '+#13+
                        '  존속의 기준연령도달일,    '+#13+
                        '  차남녀의 동거기간 경과일  ';
end;

{해지신청}
procedure TMainForm.BBins_B1Click(Sender: TObject);
var
     qq : TOraQuery;
begin
     DataSource1DataChange(Sender, TField(nil));  {refresh}

     DataAllClear;
     GB_family.Enabled := True;
     Job_mode := 1;


     if Query_fmmas.RecordCount = 0 then
     begin
          DataAllClear;
          MessageBox(handle, '지급중인 자료가 한건도 없습니다',
                             '작업안내', MB_ICONWARNING);
          System.Exit;
     end;

     if copy(Query_fmmasAPPKIND.AsString,1,1) = 'B' then
     begin
          MessageBox(handle, '해지신청자료에 대해서는 해지신청할 수 없습니다.',
                             '작업안내', MB_ICONWARNING);
          System.Exit;
     end;

     if Query_fmmasFAMITODATE.AsString <> '' then
     begin
          MessageBox(handle, '이미 해지된 자료입니다.  해지신청할 수 없습니다.',
                             '작업안내', MB_ICONWARNING);
          System.Exit;
     end;

{     if Query_fmmasFAMIYN.AsString <> 'Y' then
     begin
          MessageBox(handle, '지급처리되지 않은 자료입니다.  삭제하시려면 <신청취소>버튼을 누르세요',
                             '작업안내', MB_ICONWARNING);
          System.Exit;
     end;}

{     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     Try
          with qq do
          begin
               Close;
               SQL.Clear;
               SQL.Add('select empno from pkmfmmas                            ');
               SQL.Add(' where empno = :p_empno                                ');
               SQL.Add('   and substr(appkind,1,1) = ''A''                       ');
               SQL.Add('   and famiyn = ''Y''                ');
               SQL.Add('   and famitodate is null            ');
               ParamByName('p_empno').AsString := E_empno.Text;
               Open;

               if RecordCount = 0 then
               begin
                    MessageBox(handle, '지급중인 자료가 한건도 없습니다',
                                       '작업안내', MB_ICONWARNING);
                    System.Exit;
               end;
          end;
     Finally
          qq.Free;
     end;

     Phelpmsg.Caption  := '  해지신청 내역을 입력하신 후 <저장>버튼을 누르세요.';
     P_appkind.Text := '해지신청';
     ME_appdate.Text := InMask(Copy(CurDate,1,8),'@@@@.@@.@@');신청일자}

//     Job_mode := 2;
//     GB_family.Enabled := True;
     ME_regdate.Text   := '';
     CB_appdesc.Text   := '';
     Create_appdesc; {신청사유 Combo자료 생성}
     CB_appdesc.SetFocus;

     ME_regdate.Hint := '  사망일, 이혼일,         '+#13+
                        '  비속의 기준연령도달일,  '+#13+
                        '  차남녀의 동거종료일     ';
end;

{신청변경}
procedure TMainForm.BBupdateClick(Sender: TObject);
begin
     DataSource1DataChange(Sender, TField(nil));  {refresh}

     if Query_fmmas.RecordCount = 0 then
     begin
          DataAllClear;
          MessageBox(handle, '신청내역 자료가 한건도 없습니다',
                             '작업안내', MB_ICONWARNING);
          System.Exit;
     end;

     if Query_fmmasFAMITODATE.AsString <> '' then
     begin
          MessageBox(handle, '이미 지급해지된 자료는 변경할 수 없습니다.  신규신청하십시오.',
                             '작업안내', MB_ICONWARNING);
          System.Exit;
     end;
     Phelpmsg.Caption := '  신청된 자료를 수정하신 후 <저장>버튼을 누르세요.';
     Job_mode := 3;
     GB_family.Enabled := True;
     Create_appdesc; {신청사유 Combo자료 생성}
     CB_appdesc.SetFocus;
end;

{취소작업}
procedure TMainForm.BBdelClick(Sender: TObject);
var
     qq : TOraQuery;
begin
     DataSource1DataChange(Sender, TField(nil));  {refresh}

     if Query_fmmas.RecordCount = 0 then
     begin
          DataAllClear;
          MessageBox(handle, '신청내역 자료가 한건도 없습니다',
                             '작업안내', MB_ICONWARNING);
          System.Exit;
     end;

     if Query_fmmasFAMINAME.AsString = '' then
     begin
          MessageBox(handle, '먼저 취소하려는 신청내역을 선택하세요.',
                             '작업안내', MB_ICONWARNING);
          System.Exit;
     end;
     if Query_fmmasFAMIYN.AsString = 'Y' then
     begin
          MessageBox(handle, '지급처리여부가 ''Y''인 자료는 취소할 수 없습니다.',
                             '작업안내', MB_ICONWARNING);
          System.Exit;
     end;

     if Query_fmmasConyn.AsString = 'Y' then
     begin
          MessageBox(handle, '지급처리여부가 ''Y''인 자료는 취소할 수 없습니다.',
                             '작업안내', MB_ICONWARNING);
          System.Exit;
     end;

     if Application.MessageBox('선택한 신청자료를 확실히 취소하시겠습니까?', '작업안내',
                               MB_OKCANCEL + MB_DefButton1) = IDOK
     then
     begin
          qq := TOraQuery.Create(nil);
          qq.Session := Ora_Session;

          Try
               with qq do
               begin
                    Close;
                    SQL.Clear;
                    SQL.Add('delete from PKMFMAPP              ');
                    SQL.Add(' where empno     = :p_empno       ');
                    SQL.Add('   and faminame  = :p_faminame    ');
                    SQL.Add('   and famibdate = :p_famibdate   ');
                    SQL.Add('   and appkind   = :p_appkind     ');
                    SQL.Add('   and appdate   = :p_appdate     ');
                    ParamByName('p_empno').AsString     := Query_fmmasEMPNO.AsString;
                    ParamByName('p_faminame').AsString  := Query_fmmasFAMINAME.AsString;
                    ParamByName('p_famibdate').AsString := Query_fmmasFAMIBDATE.AsString;
                    ParamByName('p_appkind').AsString   := Query_fmmasAPPKIND.AsString;
                    ParamByName('p_appdate').AsString   := Query_fmmasAPPDATE.AsString;
                    ExecSQL;
               end;
          Finally
               qq.Free;
          end;

          BBsearch.Click;
          Phelpmsg.Caption := '  선택한 신청자료를 취소(삭제)하였습니다.';
     end;
end;

procedure TMainForm.BBsaveClick(Sender: TObject);
var
     mm, sex: Integer;
     qq : TOraQuery;
     Appkindcode : String;
begin

     Phelpmsg.Caption := '  해당작업에 필요한 정확한 값인지 검사하고 있습니다.';
     Application.ProcessMessages;

     if GB_family.Enabled = False then
     begin
          MessageBox(Handle, '<지급신청>, <해지신청> 또는 <신청변경> 버튼을 눌러 작업을 하신후 저장하세요.', '입력오류', MB_ICONWARNING);
          Job_mode := 0;
          Phelpmsg.Caption := '';
          System.Exit;
     end;

     if P_appkind.Text = '' then
     begin
          GB_family.Enabled := False;
          MessageBox(Handle, '<지급신청>, <해지신청> 또는 <신청변경> 버튼을 눌러 작업을 하신후 저장하세요.', '입력오류', MB_ICONWARNING);
          Job_mode := 0;
          Phelpmsg.Caption := '';
          System.Exit;
     end;

     if E_faminame.Text = '' then
     begin
          MessageBox(Handle, '가족사항내역이 정확하지 않습니다.', '입력오류', MB_ICONWARNING);
          Job_mode := 0;
          Phelpmsg.Caption := '';
          System.Exit;
     end;

     if ME_regdate.Text = '' then
     begin
          MessageBox(handle,'신청사유발생일을 정확히 입력하세요', '입력오류', MB_ICONWARNING);
          ME_regdate.SetFocus;
          System.exit;
     end;

     if P_appkind.Text = '' then
     begin
          MessageBox(handle,'신청구분을 입력하세요', '입력오류', MB_ICONWARNING);
          P_appkind.SetFocus;
          System.exit;
     end;

     if ME_famibdate.Text = '' then
     begin
          MessageBox(handle,'가족생일을 입력하세요', '입력오류', MB_ICONWARNING);
          ME_famibdate.SetFocus;
          System.exit;
     end;

     if Job_mode <> 2 then  {해지신청버튼을 눌러 신청할경우는 조건검사 안함}
     begin
          if (E_famikind.Text = 'B') then {존속}
          begin
               if CB_firstyn.Text = '' then
               begin
                    MessageBox(Handle, '사원 본인이 장남 또는 장녀이면 ''Y''를 아니면 ''N''를 입력하세요.',
                                       '입력오류', MB_ICONWARNING);
                    CB_firstyn.SetFocus;
                    Phelpmsg.Caption := '';
                    System.Exit;
               end;

               if (CB_firstyn.Text <> 'Y') and (ME_fawithdate.Text = '') then
               begin
                    MessageBox(Handle, '장남/녀가 아니면 가족과의 주민등록상의 동거개시일을 반드시 입력하세요.',
                                       '입력오류', MB_ICONWARNING);
                    ME_fawithdate.SetFocus;
                    Phelpmsg.Caption := '';
                    System.Exit;
               end;

               mm := StrToIntDef(Copy(DateCal(ME_fawithdate.Text, Copy(ME_regdate.Text,1,6)+'15'),1,2),0) * 12 +
                     StrToIntDef(Copy(DateCal(ME_fawithdate.Text, Copy(ME_regdate.Text,1,6)+'15'),3,2),0);  {동거기간 산정}
               if (CB_firstyn.Text <> 'Y') and (mm < F_togethermm) then
               begin
                    MessageBox(Handle, '동거기간이 동거기준월에 미달됩니다. 지급신청할 수 없습니다',
                                       '입력오류', MB_ICONWARNING);
                    ME_regdate.SetFocus;
                    Phelpmsg.Caption := '';
                    System.Exit;
               end;

               mm  := StrToIntDef(Copy(DateCal(ME_famibdate.Text, Copy(ME_regdate.Text,1,6)+'15'),1,2),0);  {가족연령 산정}
               sex := StrToIntDef(Copy(E_famirel.Text,2,1),0) mod 2;   {가족성별}

               if (sex = 1) and (mm < F_parentminage) then {남자 and 연령미달}
               begin
                    MessageBox(Handle, '가족수당 지급연령(남)에 미달됩니다. 지급신청할 수 없습니다',
                                       '입력오류', MB_ICONWARNING);
                    ME_regdate.SetFocus;
                    Phelpmsg.Caption := '';
                    System.Exit;
               end
               else if (sex = 0) and (mm < F_parentminage - 5) then {여자 and 열령미달}
               begin
                    MessageBox(Handle, '가족수당 지급연령(녀)에 미달됩니다. 지급신청할 수 없습니다',
                                       '입력오류', MB_ICONWARNING);
                    ME_regdate.SetFocus;
                    Phelpmsg.Caption := '';
                    System.Exit;
               end;
          end;

          if (E_famikind.Text = 'A') then {배우자}
          begin
               if E_mateempno.Text <> '' then
               begin
                    if P_mateempno.Caption <> E_faminame.Text then
                    begin
                         MessageBox(Handle, '배우자의 가족명과 선택한 사내부부의 성명이 다릅니다.  확인하시고 다시 신청하세요.', '입력오류', MB_ICONWARNING);
                         E_mateempno.SetFocus;
                         Phelpmsg.Caption := '';
                         System.Exit;
                    end;

                    qq := TOraQuery.Create(nil);
                    qq.session := Ora_Session;

                    Try
                         with qq do
                         begin
                              Close;
                              SQL.Clear;
                              SQL.Add('select korname from pkmpmas   ');
                              SQL.Add(' where empno = :p_empno       ');
                              ParamByName('p_empno').AsString := E_mateempno.Text;
                              Open;
                              P_mateempno.Caption := FieldByName('KORNAME').AsString;

                              if P_mateempno.Caption = '' then {미등록 부부사번}
                              begin
                                   MessageBox(Handle, '등록되지 않은 사내부부사번입니다. 확인하시고 다시 신청하세요.', '입력오류', MB_ICONWARNING);
                                   E_mateempno.SetFocus;
                                   Phelpmsg.Caption := '';
                                   System.Exit;
                              end;

                              Close;
                              SQL.Clear;
                              SQL.Add('select faminame from pkmfmmas             ');
                              SQL.Add(' where empno = :p_empno                   ');
                              SQL.Add('   and famikind = ''A''                   ');
                              SQL.Add('   and substr(appkind,1,1) = ''A''        ');
                              SQL.Add('   and famiyn = ''Y''                     ');
                              SQL.Add('   and famitodate is null                 ');
                              ParamByName('p_empno').AsString := E_mateempno.Text;
                              Open;

                              if RecordCount > 0 then
                              begin
                                   MessageBox(Handle, '사내부부의 경우에는 가족수당(배우자)을 한쪽 사원만 지급받을 수 있습니다.', '입력오류', MB_ICONWARNING);
                                   Phelpmsg.Caption := '';
                                   System.Exit;
                              end;
                         end;
                    Finally
                         qq.Free;
                    end;
               end;
          end;

          if (E_famikind.Text = 'C') then {비속}
          begin
               mm := StrToIntDef(Copy(DateCal(ME_famibdate.Text, Copy(ME_regdate.Text,1,6)+'15'),1,2),0);  {가족연령 산정}
               if mm > F_childmaxage then
               begin
                    MessageBox(Handle, '직계비속의 수당지급 연령제한을 초과했습니다.  지급신청할 수 없습니다', '입력오류', MB_ICONWARNING);
                    ME_regdate.SetFocus;
                    Phelpmsg.Caption := '';
                    System.Exit;
               end;
          end;
     end;

     if P_appkind.Text = '지급신청' then
        Appkindcode := 'A1'
    else if  P_appkind.Text = '해지신청' then
        Appkindcode := 'B1';

     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     Try
          with qq do
          begin
               Close;
               SQL.Clear;
               SQL.Add('update pkmpmas                  ');
               SQL.Add('   set mateempno = :p_mateempno,');
               SQL.Add('       firstyn   = :p_firstyn   ');
               SQL.Add(' where empno     = :p_empno         ');
               ParamByName('p_mateempno').AsString := E_mateempno.Text;
               ParamByName('p_firstyn').AsString   := CB_firstyn.Text;
               ParamByName('p_empno').AsString     := E_empno.Text;
               ExecSQL;

               if Job_mode = 1 then  {지급신청}
               begin
                    if IDNO = Application.MessageBox('지급신청 자료를 저장하시겠습니까 ?',
                                                     '작업 안내', MB_YesNo)
                    then
                    begin
                         Phelpmsg.Caption := '';
                         System.Exit;
                    end;
                    Close;
                    SQL.Clear;
                    SQL.Add('INSERT INTO PKMFMAPP                                                       ');
                    SQL.Add('       (EMPNO,      KORNAME,   APPKIND,    FAMIKIND,    FAMIREL,           ');
                    SQL.Add('       FAMINAME,    FAMIBDATE, FAMIWITH,   FAWITHDATE,  APPDATE,           ');
                    SQL.Add('       REGDATE,     APPDESC,   EEMPNO,     FASCHGR,                        ');
                    SQL.Add('       FAJOBCODE,   FAPLACE,   WRITETIME , WRITEMAN, FIRSTYN,CONYN )       ');
                    SQL.Add('VALUES (                                                                   ');
                    SQL.Add('       :vempno,     :vkorname,      :vappkind,  :vfamikind,  :vfamirel,    ');
                    SQL.Add('       :vfaminame,  :vfamibdate,    :vfawith,   :vfawithdate,:vappdate,    ');
                    SQL.Add('       :vregdate,   :vappdesc,      :vmateempno,:vfaschgr,                 ');
                    SQL.Add('       :vfajobcode, :vfaplace,      to_char(sysdate,''yyyymmddhh24miss''),:vwriteman, :vfirstyn,''N'')  ');

                    ParamByName('vempno').AsString      := E_empno.Text;
                    ParamByName('vkorname').AsString    := P_Korname.Caption;
                    ParamByName('vappkind').AsString    := Appkindcode;
                    ParamByName('vfamikind').AsString   := E_famikind.Text;
                    ParamByName('vfamirel').AsString    := E_famirel.Text;
                    ParamByName('vfaminame').AsString   := E_faminame.Text;
                    ParamByName('vfamibdate').AsString  := ME_famibdate.Text;
                    ParamByName('vfawith').AsString     := CB_fawith.Text;
                    ParamByName('vfawithdate').AsString := ME_fawithdate.Text;
                    ParamByName('vappdate').AsString    := Copy(ME_appdate.Text,1,8);
                    ParamByName('vregdate').AsString    := ME_regdate.Text;
                    ParamByName('vappdesc').AsString    := CB_appdesc.Text;
                    ParamByName('vmateempno').AsString  := E_mateempno.Text;
                    ParamByName('vfaschgr').AsString    := E_faschgr.Text;
                    ParamByName('vfajobcode').AsString  := E_fajobcode.Text;
                    ParamByName('vfaplace').AsString    := E_faplace.Text;
                    ParamByName('vwriteman').AsString      := Pempno;
                    ParamByName('vfirstyn').AsString    := CB_firstyn.Text;
                    ExecSQL;
                    Phelpmsg.Caption := '  신규 지급신청자료가 등록되었습니다.';

                    Save_EMPNO     := E_empno.Text;
                    Save_FAMIREL   := E_famirel.Text;
                    Save_FAMIBDATE := ME_famibdate.Text;
                    Save_APPKIND   := Appkindcode;
                    LoadData;
               end
               else
               begin {신청변경}
                    if IDNO = Application.MessageBox('변경된 항목을 저장하시겠습니까 ?',
                                                     '작업안내', MB_YesNo)
                    then
                    begin
                         Phelpmsg.Caption := '';
                         System.Exit;
                    end;

                    Close;
                    SQL.Clear;
{                    SQL.Add('update pkmfmmas                                             ');
                    SQL.Add('   set regdate    = :p_regdate,                             ');
                    SQL.Add('       appdesc    = :p_appdesc,                             ');
                    SQL.Add('       fawithdate = :p_fawithdate,                          ');
                    SQL.Add('       writetime  = TO_CHAR(SYSDATE, ''YYYYMMDDHH24MISS''), ');
                    SQL.Add('       writeman   = :p_writeman                             ');
                    SQL.Add(' where empno      = :p_empno                                ');
                    SQL.Add('   and faminame   = :p_faminame                             ');
                    SQL.Add('   and famibdate  = :p_famibdate                            ');
                    SQL.Add('   and appkind    = :p_appkind                              ');}

                    SQL.Add(' UPDATE PKMFMAPP                     ');
                    SQL.Add('     SET                             ');
                    SQL.Add('        APPKIND    =  :vappkind,     ');
                    SQL.Add('        FAMIREL    =  :vfamirel,     ');
                    SQL.Add('        FAMIBDATE  =  :vfamibdate,   ');
                    SQL.Add('        APPDESC    =  :vappdesc,     ');
                    SQL.Add('        FAWITHDATE =  :vfawithdate,  ');
                    SQL.Add('        REGDATE    =  :vregdate,     ');
                    SQL.Add('        EEMPNO     =  :vmateempno,   ');
                    SQL.Add('        FASCHGR    =  :vfaschgr,     ');
                    SQL.Add('        FAJOBCODE  =  :vfajobcode,   ');
                    SQL.Add('        FAMIKIND   =  :vfamikind,    ');
                    SQL.Add('        FAPLACE    =  :vfaplace,     ');
                    SQL.Add('        FIRSTYN    =  :vfirstyn      ');
                    SQL.Add('  WHERE EMPNO      =  :vempno        ');
//                    SQL.Add('    AND APPKIND    =  :vappkind      ');
                    SQL.Add('    AND FAMIBDATE  =  :vfamibdate    ');
                    SQL.Add('    AND APPDATE    =  :vappdate      ');

                    ParamByName('vappkind').AsString    := Appkindcode;
                    ParamByName('vfamirel').AsString    := E_famirel.Text;
                    ParamByName('vfamibdate').AsString  := ME_famibdate.Text;
                    ParamByName('vappdesc').AsString    := CB_appdesc.Text;
                    ParamByName('vfawithdate').AsString := ME_fawithdate.Text;
                    ParamByName('vregdate').AsString    := ME_regdate.Text;
                    ParamByName('vmateempno').AsString  := E_mateempno.Text;
                    ParamByName('vfaschgr').AsString    := E_faschgr.Text;
                    ParamByName('vfajobcode').AsString  := E_fajobcode.Text;
                    ParamByName('vfamikind').AsString   := E_famikind.Text;
                    ParamByName('vfaplace').AsString    := E_faplace.Text;
                    ParamByName('vfirstyn').AsString    := CB_firstyn.Text;
                    ParamByName('vempno').AsString      := E_empno.Text;
                    ParamByName('vappdate').AsString    := Copy(ME_appdate.Text,1,8);
                    ExecSQL;

                    Save_EMPNO     := E_empno.Text;
                    Save_FAMIREL   := E_famirel.Text;
                    Save_FAMIBDATE := ME_famibdate.Text;
                    Save_APPKIND   := Query_fmmasAPPKIND.AsString;
                    LoadData;
                    Phelpmsg.Caption := '  다음항목을 수정하였습니다.(신청사유발생일,신청사유,동거개시일)';
               end;
          end;
     Finally
          qq.Free;
     end;
     BBsearch.Click;
     ME_regdate.Hint := '';
end;

{디비그리드의 내역을 화면의 해당 항목에 뿌려준다.................................}
procedure TMainForm.DataSource1DataChange(Sender: TObject; Field: TField);
begin
     ME_regdate.Hint := '';

     P_Korname.Caption       :=  Query_fmmasKorname.AsString;
     E_empno.Text            :=  Query_fmmasEMPNO.AsString;

     P_appkind.Text          :=  Query_fmmasappkindname.AsString;
//     P_appkind.Text        :=  Query_fmmasappkindname.AsString;
     E_faminame.Text         :=  Query_fmmasFAMINAME.AsString;

     E_famirel.Text          :=  Query_fmmasFAMIREL.AsString;
     L_famirelname.Caption   :=  Query_fmmasfamirelname.AsString;

     ME_famibdate.Text       :=  Copy(Query_fmmasFAMIBDATE.AsString,1,8);
     ME_famibdate.Text     :=  Query_fmmasFAMIBDATE.AsString; {화면에보이지 않음, yyyymmdd형태}

     E_famikind.Text         :=  Query_fmmasFAMIKIND.AsString;
     L_famikindname.Caption  :=  Query_fmmasfamikindname.AsString;

     ME_regdate.Text         :=  Query_fmmasREGDATE.AsString;
     CB_appdesc.Text         :=  Query_fmmasAPPDESC.AsString;

     ME_appdate.text         :=  Copy(Query_fmmasAPPDATE.AsString,1,8);
     ME_fawithdate.Text      :=  Query_fmmasFAWITHDATE.AsString;
     E_faschgr.Text          :=  Query_fmmasFASCHGR.AsString;
     L_faschgrname.Caption   :=  Query_fmmasFASCHGRNAME.AsString;

     E_fajobcode.Text          :=  Query_fmmasFAJOBCODE.AsString;
     L_fajobcodename.Caption :=  Query_fmmasFAJOBNAME.AsString;

end;

procedure TMainForm.SB_empnoClick(Sender: TObject);
var
     Fkeyempno: TFkeyempno;
begin
     Fkeyempno := TFkeyempno.Create(Self);
     try
          Fkeyempno.Edempno.Text := E_empno.Text;
          Fkeyempno.ShowModal;
          if Fkeyempno.CloseChk <> -1 then
          begin
               E_empno.Text      := Fkeyempno.v_KeyEmpno;
               P_Korname.Caption := Fkeyempno.v_KeyKorname;
               Empno_Check;
               LoadData;
          end;
     finally
          Fkeyempno.Free;
     end;
end;
{
procedure TMainForm.E_empnoKeyPress(Sender: TObject; var Key: Char);
var
     qq : TOraQuery;
begin
     if (Key = #13) then
     begin
          qq := TOraQuery.Create(nil);
          qq.Session := Ora_session;

          Try
               with qq do
               begin
                    Close;
                    SQL.Clear;
                    SQL.Add('select empno, korname, orgnum, deptcode, boncode      ');
                    SQL.Add('  from pkmpmas                                        ');
                    SQL.Add(' where (empno like :p_empno or korname like :p_empno) ');
                    ParamByName('p_empno').AsString := E_empno.Text+'%';
                    Open;

                    if RecordCount < 1 then
                    begin
                         Phelpmsg.caption := ' 없는 사원입니다..';
                         system.exit;
                    end
                    else if RecordCount = 1 then
                    begin
                         E_empno.text      := Fields[0].AsString;
                         P_Korname.caption := Fields[1].AsString;
                         Empno_Check;
                         LoadData;
                    end
                    else if RecordCount > 1 then
                    begin
                         SB_empnoClick(SB_empno);
                    end;
               end;
          Finally
               qq.Free;
               empcount := 0;
          end;
     end;
end;
}
procedure TMainForm.ME_regdateChange(Sender: TObject);
begin
     if Length(ME_regdate.Text) = 8 then
     begin
          if fn_IsDate(ME_regdate.Text) = False then
          begin
               MessageBox(Handle, '신청사유발생일을 정확히 입력하세요.', '입력오류', MB_ICONWARNING);
//               ME_regdate.SetFocus;
               exit;
          end;
     end;
end;

procedure TMainForm.ME_fawithdateChange(Sender: TObject);
begin
     if Length(ME_fawithdate.Text) = 8 then
     begin
          if fn_IsDate(ME_fawithdate.Text) = False then
          begin
               MessageBox(Handle, '동거개시일을 정확히 입력하세요.', '입력오류', MB_ICONWARNING);
//               ME_fawithdate.SetFocus;
               exit;
          end;
     end;
end;

procedure TMainForm.CB_firstynDblClick(Sender: TObject);
begin
     CB_firstyn.Text := YesNoComboDC(CB_firstyn.Text);
end;

procedure TMainForm.CB_firstynChange(Sender: TObject);
begin
     CB_firstyn.Text := YesNoCombo(CB_firstyn.Text);
end;

procedure TMainForm.E_mateempnoKeyPress(Sender: TObject; var Key: Char);
begin
     if Key = #13 then P_mateempno.Caption := GetKorname(E_mateempno.Text);
end;

procedure TMainForm.SB_mateempnoClick(Sender: TObject);
begin
     MateForm.Eempno.Text := E_mateempno.Text;
     MateForm.ShowModal;

     if MateForm.GIcloseS <> -1 then
     begin
          E_mateempno.Text    := MateForm.GSempnoS;
          P_mateempno.Caption := MateForm.GSkornameS;
     end
     else
     begin
          E_mateempno.Text    := '';
          P_mateempno.Caption := '';
     end;
end;

procedure TMainForm.SB_regdateClick(Sender: TObject);
var
     calendar: Tcalendar;
begin
     try
          calendar := Tcalendar.Create(Self);
          calendar.ShowModal;
          if calendar.DayCaption <> '' then
               ME_regdate.Text := calendar.DayCaption;
     finally
          calendar.free;
     end;
end;

procedure TMainForm.SB_fawithdateClick(Sender: TObject);
var
     calendar: Tcalendar;
begin
     try
          calendar := Tcalendar.Create(Self);
          calendar.ShowModal;
          if calendar.DayCaption <> '' then
               ME_fawithdate.Text := calendar.DayCaption;
     finally
          calendar.free;
     end;
end;

// 2004.07.05.  dsa2000  실수로 등록한 내역을 삭제할수 있도록 삭제버튼 생성.
procedure TMainForm.BB_DeleteClick(Sender: TObject);
var
     qq : TOraQuery;
begin
     if Query_fmmasConyn.AsString = 'Y' then
     begin
          MessageBox(handle, '지급처리여부가 ''Y''인 자료는 삭제할 수 없습니다.',
                             '작업안내', MB_ICONWARNING);
          System.Exit;
     end;

     if Application.MessageBox('선택한 신청자료는 영원히 삭제됩니다. 확실히 삭제하시겠습니까? ',
                               '작업안내 : 잘못 등록한 자료의 경우에만 사용하시기 바랍니다. ',
                               MB_OKCANCEL + MB_DefButton1) = IDOK
     then
     begin
          qq := TOraQuery.Create(nil);
          qq.Session := Ora_Session;

          Try
               with qq do
               begin
                    Close;
                    SQL.Clear;
                    SQL.Add('delete from PKMFMAPP                ');
                    SQL.Add(' where empno     = :p_empno         ');
                    SQL.Add('   and faminame  = :p_faminame      ');
                    SQL.Add('   and famibdate = :p_famibdate     ');
                    SQL.Add('   and appkind   = :p_appkind       ');
                    SQL.Add('   and appdate   = :p_appdate       ');
                    ParamByName('p_empno').AsString     := Query_fmmasEMPNO.AsString;
                    ParamByName('p_faminame').AsString  := Query_fmmasFAMINAME.AsString;
                    ParamByName('p_famibdate').AsString := Query_fmmasFAMIBDATE.AsString;
                    ParamByName('p_appkind').AsString   := Query_fmmasAPPKIND.AsString;
                    ParamByName('p_appdate').AsString   := Query_fmmasAPPDATE.AsString;
                    ExecSQL;
                    LoadData;
                    Phelpmsg.Caption := '  선택한 신청자료를 삭제 하였습니다.';
               end;
          Finally
               qq.Free;
          end;
     end;
     BBsearch.Click;
end;

procedure TMainForm.E_empnoChange(Sender: TObject);
var
     qq : TOraQuery;
begin
     if length(e_empno.text)=4 then
     begin
          qq := TOraQuery.Create(nil);
          qq.Session := Ora_session;

          Try
               with qq do
               begin
                    Close;
                    SQL.Clear;
                    SQL.Add('select empno, korname, orgnum, deptcode, boncode      ');
                    SQL.Add('  from pkmpmas                                        ');
                    SQL.Add(' where (empno like :p_empno or korname like :p_empno) ');
                    ParamByName('p_empno').AsString := E_empno.Text+'%';
                    Open;

                    if RecordCount < 1 then
                    begin
                         Phelpmsg.caption := ' 없는 사원입니다..';
                         system.exit;
                    end
                    else if RecordCount = 1 then
                    begin
                         E_empno.text      := Fields[0].AsString;
                         P_Korname.caption := Fields[1].AsString;
                         Empno_Check;
                         LoadData;
                    end
                    else if RecordCount > 1 then
                    begin
                         SB_empnoClick(SB_empno);
                    end;
               end;
          Finally
               qq.Free;
          end;
     end;
end;

procedure TMainForm.SB_appstdateClick(Sender: TObject);
var
     calendar: Tcalendar;
begin
     try
          calendar := Tcalendar.Create(Self);
          calendar.ShowModal;
          if calendar.DayCaption <> '' then
               ME_appstdate.Text := calendar.DayCaption;
     finally
          calendar.free;
     end;
end;

procedure TMainForm.SB_appeddateClick(Sender: TObject);
var
     calendar: Tcalendar;
begin
     try
          calendar := Tcalendar.Create(Self);
          calendar.ShowModal;
          if calendar.DayCaption <> '' then
               ME_appstdate.Text := calendar.DayCaption;
     finally
          calendar.free;
     end;
end;

procedure TMainForm.BBsearchClick(Sender: TObject);
var
     V: Variant;
     SearchOptions: TLocateOptions;
begin
     Phelpmsg.Caption := '';
     Job_mode := 0;

     with Query_fmmas do
     begin
          Close;
          SQL.Clear;
          SQL.Add(' SELECT EMPNO,     KORNAME,    APPKIND ,                                              ');
          SQL.Add('        (SELECT CODENAME FROM PYCCODE WHERE CODEID = ''K411'' AND CODENO =APPKIND)    ');
          SQL.Add('        APPKINDNAME,FAMIKIND,                                                         ');
          SQL.Add('	   (SELECT CODENAME FROM PYCCODE WHERE CODEID = ''K410'' AND CODENO =FAMIKIND)   ');
          SQL.Add('	    FAMIKINDNAME,FAMIREL,                                                        ');
          SQL.Add('	   (SELECT CODENAME FROM PYCCODE WHERE CODEID = ''I211'' AND CODENO =FAMIREL)    ');
          SQL.Add('	   FAMIRELNAME,FAMINAME,                                                         ');
          SQL.Add('	   FAMIBDATE, FAMIWITH,   FAWITHDATE,                                            ');
          SQL.Add('	   APPDATE,   REGDATE,    APPDESC,                                               ');
          SQL.Add('	   FAMIYN,    FAMIFRDATE, FAMITODATE,                                            ');
          SQL.Add('	   FAMIDESC,  MAILYN,     EEMPNO,                                                ');
          SQL.Add('	   FASCHGR,                                                                      ');
          SQL.Add('	   (SELECT CODENAME FROM PYCCODE WHERE CODEID = ''I221'' AND CODENO =FASCHGR)    ');
          SQL.Add('	   FASCHGRNAME,FAJOBCODE,                                                        ');
          SQL.Add('	   (SELECT CODENAME FROM PYCCODE WHERE CODEID = ''I212'' AND CODENO =FAJOBCODE)  ');
          SQL.Add('	   FAJOBNAME,FAPLACE,                                                            ');
          SQL.Add('        FIRSTYN,                                                                      ');
          SQL.Add('	   CONYN                                                                         ');
          SQL.Add('  FROM PKMFMAPP A                                                                     ');
          SQL.Add(' WHERE APPDATE BETWEEN :p_appstdate AND  :p_appeddate                                 ');
          if Trim(CB_appYN.text) <> '' then
             SQL.Add('   AND CONYN   LIKE  ''' + CB_appYN.Text +'%''                                        ');
          SQL.Add(' ORDER BY APPDATE DESC,FAMIREL, FAMIKIND, KORNAME                                     ');
          ParamByName('p_appstdate').AsString := ME_appstdate.text;
          ParamByName('p_appeddate').AsString := ME_appeddate.text;
          Open;

          if RecordCount = 0 then
          begin
               Phelpmsg.Caption := '  사번('+E_empno.Text+')의 신청된 자료가 한건도 없습니다.';
               DataAllClear;
          end
          else
          begin
               V := VarArrayCreate([0,3], varVariant);
               V[0] := Save_EMPNO;
               V[1] := Save_FAMIREL;
               V[2] := Save_FAMIBDATE;
               V[3] := Save_APPKIND;
               SearchOptions := [loPartialKey];
               if Locate('EMPNO;FAMIREL;FAMIBDATE;APPKIND', V, SearchOptions) then
                    DBGrid1.SetFocus;
          end;
     end;
end;

procedure TMainForm.SBfajobcodeClick(Sender: TObject);
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

procedure TMainForm.SB_faschgrClick(Sender: TObject);
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

procedure TMainForm.SBfamirelClick(Sender: TObject);
var
     famikind: string[1];
begin
     FKeyCode := TFKeyCode.Create(Self);
     Try
          FKeyCode.FormData := '가족관계 코드조회';
          FKeyCode.DataVal1 := 'I211';
          FKeyCode.ShowModal;
          if FKeyCode.CloseChk = -1 then Exit;
          E_famirel.Text        := FKeyCode.Code;
          L_famirelname.Caption := FKeyCode.Codename;

          {가족구분}
          case StrToIntDef(E_famirel.Text, -1) of
               00,01,02 :
                    E_famikind.Text := 'D'; {본인}
               30,31,32 :
                    E_famikind.Text := 'A';
               10..14,20..22,91,92,95,96 :
                    E_famikind.Text := 'B';
               40..42,50..52,55..56 :
                    E_famikind.Text := 'C';
               else
                    E_famikind.Text := 'Z';
          end;
          L_famikindname.Caption := GetCodeName('K410', E_famikind.Text);
     Finally
          FKeyCode.Free;
     end;
end;

procedure TMainForm.SB_faminameClick(Sender: TObject);
var
     FamiForm : TFamiForm;
//     Fkeyempno: TFkeyempno;
begin
     FamiForm := TFamiForm.Create(Self);
     try
          FamiForm.ShowModal;

          if FamiForm.FACODE <> '' then
          begin
              E_faminame.Text              := FamiForm.FANAME;
              E_famirel.Text               := FamiForm.FACODE;
              ME_famibdate.Text            := FamiForm.FABIRTHDATE;
              E_faschgr.Text               := FamiForm.FASCHGR;
              E_fajobcode.Text             := FamiForm.FAJOBCODE;
              E_faplace.Text               := FamiForm.FAPLACE;
              CB_fawith.Text               := FamiForm.FAWITH;

              L_famirelname.Caption   := GetCodeName('I211', FamiForm.FACODE);
              L_fajobcodename.Caption := GetCodeName('I212', FamiForm.FAJOBCODE);
              L_faschgrname.Caption   := GetCodeName('I221', FamiForm.FASCHGR);




//              CB_firstyn.text             := FamiForm.FIRSTYN;
{              FM_Tmax           := TFM_Tmax.Create(Self);
              FM_Tmax.T_Session := TMaxSession;
              E_facodename.Text := FM_Tmax.GetData('codename' ,'I211',FamiForm.FACODE);

              FM_Tmax           := TFM_Tmax.Create(Self);
              FM_Tmax.T_Session := TMaxSession;
              E_fajobname.Text := FM_Tmax.GetData('codename' ,'I212',FamiForm.FAJOBCODE);

              FM_Tmax           := TFM_Tmax.Create(Self);
              FM_Tmax.T_Session := TMaxSession;
              E_Schlname.Text   := FM_Tmax.GetData('codename' ,'I221',FamiForm.FASCHGR);  }
     end;
     case StrToIntDef(E_famirel.Text, -1) of
          00,01,02:
               E_famikind.Text := 'D';
          30,31,32:
               E_famikind.Text := 'A';
          10..14,20..22,91,92,95,96:
               E_famikind.Text := 'B';
          40..42,50..52,55..56:
               E_famikind.Text := 'C';
          else
               E_famikind.Text := 'Z';

     end;
     L_famikindname.Caption := GetCodeName('K410', E_famikind.Text);
     finally
          FamiForm.Free;
     end;




    { Fkeyempno := TFkeyempno.Create(Self);
     try
          Fkeyempno.Edempno.Text := E_empno.Text;
          Fkeyempno.ShowModal;
          if Fkeyempno.CloseChk <> -1 then
          begin
               E_empno.Text      := Fkeyempno.v_KeyEmpno;
               P_Korname.Caption := Fkeyempno.v_KeyKorname;
               Empno_Check;
               LoadData;
          end;
     finally
          Fkeyempno.Free;
     end;


       if FamiForm.FACODE <> '' then
  begin
      E_famname.Text              := FamiForm.FANAME;
      E_facode.Text               := FamiForm.FACODE;
      ED_famibdate.NoFormatDate   := FamiForm.FABIRTHDATE;
      E_SchlCode.Text             := FamiForm.FASCHGR;
      E_fajobcode.Text            := FamiForm.FAJOBCODE;
      E_faplace.Text              := FamiForm.FAPLACE;
      CB_fawith.Text              := FamiForm.FAWITH;
//      CB_firstyn.text             := FamiForm.FIRSTYN;
      FM_Tmax           := TFM_Tmax.Create(Self);
      FM_Tmax.T_Session := TMaxSession;
      E_facodename.Text := FM_Tmax.GetData('codename' ,'I211',FamiForm.FACODE);

      FM_Tmax           := TFM_Tmax.Create(Self);
      FM_Tmax.T_Session := TMaxSession;
      E_fajobname.Text := FM_Tmax.GetData('codename' ,'I212',FamiForm.FAJOBCODE);

      FM_Tmax           := TFM_Tmax.Create(Self);
      FM_Tmax.T_Session := TMaxSession;
      E_Schlname.Text   := FM_Tmax.GetData('codename' ,'I221',FamiForm.FASCHGR);

     case StrToIntDef(E_facode.Text, -1) of
          00,01,02:
               CB_famikind.Text := 'D';
          30,31,32:
               CB_famikind.Text := 'A';
          10..14,20..22,91,92,95,96:
               CB_famikind.Text := 'B';
          40..42,50..52,55..56:
               CB_famikind.Text := 'C';
          else
               CB_famikind.Text := 'Z';
     end;


     FM_Tmax           := TFM_Tmax.Create(Self);
     FM_Tmax.T_Session := TMaxSession;
     CB_famikindname.Text   := FM_Tmax.GetData('codename' ,'K410',CB_famikind.Text);
  end;

      }
end;

procedure TMainForm.BBConynClick(Sender: TObject);
var
    qq : TOraQuery;
    Appkindcode: String;
begin
     if IDNO = Application.MessageBox('가족 수당 지급 확정 하시겠습니까 ?',
                                        '작업안내', MB_YesNo)
     then
     begin
          Phelpmsg.Caption := '';
          System.Exit;
     end;
     if  Query_fmmasConyn.AsString = 'Y' then
     begin
          MessageBox(Handle, '신청 확정된 내역 입니다.  ', '입력오류', MB_ICONWARNING);
          Phelpmsg.Caption := '';
//          System.Exit;
     end;
         
     if P_appkind.Text = '지급신청' then
        Appkindcode := 'A1'
     else if  P_appkind.Text = '해지신청' then
        Appkindcode := 'B1';

     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     Try
          with qq do
          begin
               Close;
               SQL.Clear;
               SQL.Add('update pkmpmas                  ');
               SQL.Add('   set mateempno = :p_mateempno,');
               SQL.Add('       firstyn   = :p_firstyn   ');
               SQL.Add(' where empno     = :p_empno         ');
               ParamByName('p_mateempno').AsString := E_mateempno.Text;
               ParamByName('p_firstyn').AsString   := CB_firstyn.Text;
               ParamByName('p_empno').AsString     := E_empno.Text;
               ExecSQL;
         end;

         with qq do
         begin
              Close;
              SQL.Clear;
              SQL.Add('UPDATE PKMFMAPP SET CONYN =''Y''  ');
              SQL.Add(' WHERE EMPNO = :vempno            ');
              SQL.Add('   AND FAMIBDATE = :vfamibdate    ');
              SQL.Add('   AND APPDATE   = :vappdate      ');
//              SQL.Add('   AND APPDATE   = :vappdate      ');
              SQL.Add('   AND FAMINAME  = :vfaminame      ');

              ParamByName('vempno').AsString      := E_empno.Text;
              ParamByName('vfamibdate').AsString  := ME_famibdate.Text;
              ParamByName('vappdate').AsString    := Copy(ME_appdate.Text,1,8);
              ParamByName('vfaminame').AsString   := E_faminame.Text;

              ExecSQL;
         end;

         with qq do
         begin

              Close;
              SQL.Clear;
              SQL.Add('select faminame from pkmfmmas    ');
              SQL.Add(' where empno      = :p_empno       ');
              SQL.Add('   and faminame   = :p_faminame    ');
              SQL.Add('   and famibdate  = :p_famibdate    ');
              SQL.Add('   and famifrdate = :p_famifrdate');
              SQL.Add('   and appkind    = :p_appkind');

              ParamByName('p_empno').AsString      := E_empno.Text;
              ParamByName('p_faminame').AsString   := E_faminame.Text;
              ParamByName('p_famifrdate').AsString := Query_fmmasFAMIFRDATE.AsString;
              ParamByName('p_appkind').AsString    := Appkindcode;
              ParamByName('p_famibdate').AsString  := ME_famibdate.Text;

              Open;
              if RecordCount > 0 then
              begin
                   MessageBox(handle,'현재 가족명으로 가족수당 신청내역이 있습니다.  등록할 수 없습니다', '작업안내', MB_ICONWARNING);
                   E_faschgr.SetFocus;
                   System.exit;
              end;
         end;



//   가족 등록 pimfami
         with qq do
         begin

               Close;
               SQL.Clear;
               SQL.Add('select faname, faallowyn from pimfami  ');
               SQL.Add(' where empno  = :p_empno               ');
               SQL.Add('   and faname = :p_faname              ');
               SQL.Add('   and facode = :p_facode              ');
               SQL.Add('   and fabirthdate = :p_famibdate              ');
               ParamByName('p_empno').AsString  := E_empno.Text;
               ParamByName('p_faname').AsString := E_faminame.Text;
               ParamByName('p_facode').AsString := E_famirel.Text;
               ParamByName('p_famibdate').AsString := ME_famibdate.Text;
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
                              SQL.Add('       fawith    = :p_fawith,                            ');
                              SQL.Add('       writetime = to_char(sysdate, ''YYYYMMDDHH24MISS''),');
                              SQL.Add('       writeemp  = :p_writeemp                            ');
                              SQL.Add(' where empno  = :p_empno                                  ');
                              SQL.Add('   and faname = :p_faname                                 ');
                              SQL.Add('   and facode = :p_facode                                 ');
                              ParamByName('p_faschgr').AsString   := E_faschgr.Text;
                              ParamByName('p_fajobcode').AsString := E_fajobcode.Text;
                              ParamByName('p_faplace').AsString   := E_faplace.Text;
                              ParamByName('p_fawith').AsString    := CB_fawith.Text;
                              ParamByName('p_writeemp').AsString  := Pempno;
                              ParamByName('p_empno').AsString     := E_empno.Text;
                              ParamByName('p_faname').AsString    := E_faminame.Text;
                              ParamByName('p_facode').AsString    := E_famirel.Text;


                              ExecSQL;
                              Phelpmsg.Caption := '  학력,직업,근무지만 수정되었습니다.';

                         end;
                    end
                    else if FieldByName('FAALLOWYN').AsString = 'N' then    //
                    begin
{                         Close;
                         SQL.Clear;
                         SQL.Add('select faminame from pkmfmmas    ');
                         SQL.Add(' where empno    = :p_empno       ');
                         SQL.Add('   and faminame = :p_faminame    ');
                         ParamByName('p_empno').AsString    := E_empno.Text;
                         ParamByName('p_faminame').AsString := E_faminame.Text;
                         Open;
                         if RecordCount > 0 then
                         begin
                              MessageBox(handle,'현재 가족명으로 가족수당 신청내역이 있습니다.  수정할 수 없습니다', '작업안내', MB_ICONWARNING);
                              E_faschgr.SetFocus;
                              System.exit;
                         end
                         else
                         begin}
                              Close;
                              SQL.Clear;
                              SQL.Add('update pimfami                                                ');    //동거 여부만 저장 할 수 있게 수정함.
                              SQL.Add('   set fawith      = :p_fawith,                               ');
                              SQL.Add('       writetime   = to_char(sysdate, ''YYYYMMDDHH24MISS''),  ');
                              SQL.Add('       writeemp    = :p_writeemp                              ');
                              SQL.Add(' where empno  = :p_empno                                      ');
                              SQL.Add('   and faname = :p_faname                                     ');
                              SQL.Add('   and facode = :p_facode                                     ');
//                              ParamByName('p_fabirthdate').AsString := ME_famibdate.Text;
//                              ParamByName('p_faschgr').AsString     := E_faschgr.Text;
//                              ParamByName('p_fajobcode').AsString   := E_fajobcode.Text;
//                              ParamByName('p_faplace').AsString     := E_faplace.Text;
                              ParamByName('p_fawith').AsString      := CB_fawith.Text;
                              ParamByName('p_writeemp').AsString    := Pempno;
                              ParamByName('p_empno').AsString       := E_empno.Text;
                              ParamByName('p_faname').AsString      := E_faminame.Text;
                              ParamByName('p_facode').AsString      := E_famirel.Text;
                              ExecSQL;
                              Phelpmsg.Caption := '  변경된 항목이 수정되었습니다.';
//                         end;                                                             }
                    end;
               end
               else
               begin
                    if Application.MessageBox('확실히 저장하시겠습니까 ?', '작업안내',
                                              MB_OKCANCEL + MB_DefButton1) = IDOK then
                    begin
                         Close;
                         SQL.Clear;
                         SQL.Add('insert into pimfami                                                ');
                         SQL.Add('       ( empno,         korname,   facode,       faname,           ');
                         SQL.Add('         fabirthdate,   faschgr,   fajobcode,    faplace,          ');
                         SQL.Add('         fawith,        faallowyn, writetime,    writeemp )        ');
                         SQL.Add('values ( :p_empno,      :p_korname,:p_facode,    :p_faname,        ');
                         SQL.Add('         :p_fabirthdate,:p_faschgr,:p_fajobcode, :p_faplace,       ');
                         SQL.Add('         :p_fawith,     ''N'',     to_char(sysdate,''yyyymmddhh24miss''), :p_writeemp )     ');
                         ParamByName('p_EMPNO').AsString       := E_empno.Text;
                         ParamByName('p_KORNAME').AsString     := P_Korname.Caption;
                         ParamByName('p_FACODE').AsString      := E_famirel.Text;
                         ParamByName('p_FANAME').AsString      := E_faminame.Text;
                         ParamByName('p_FABIRTHDATE').AsString := ME_famibdate.Text;
                         ParamByName('p_FASCHGR').AsString     := E_faschgr.Text;
                         ParamByName('p_FAJOBCODE').AsString   := E_fajobcode.Text;
                         ParamByName('p_FAPLACE').AsString     := E_faplace.Text;
                         ParamByName('p_FAWITH').AsString      := CB_fawith.Text;
                         ParamByName('p_WRITEEMP').AsString    := Pempno; {login한 사번으로}
//                         ExecSQL;
                         Phelpmsg.Caption := '  새로운 자료가 저장되었습니다.';

                    end;
               end;
//가족 수당 마스터 저장
                with qq do
                begin

                     Close;
                     SQL.Clear;
                     SQL.Add('insert into pkmfmmas                                                   ');
                     SQL.Add('       ( empno,    korname,     appkind,       famikind,                 ');
                     SQL.Add('         famirel,  faminame,    famibdate,     appdate,                  ');
                     SQL.Add('         regdate,  appdesc,     fawithdate,    famiyn,                   ');
                     SQL.Add('         mailyn,   writetime,   writeman               )               ');
                     SQL.Add('values ( :vempno,  :vkorname,   :vappkindcode,:vfamikind,               ');
                     SQL.Add('         :vfamirel,:vfaminame,  :vfamibdate,  :vappdate,                ');
                     SQL.Add('         :vregdate,:vappdesc,   :vfawithdate, ''N'',                    ');
                     SQL.Add('         ''N'',    to_char(sysdate,''yyyymmddhh24miss''), :empno )     ');
                     ParamByName('vempno').AsString      := E_empno.Text;
                     ParamByName('vkorname').AsString    := P_Korname.Caption;
                     ParamByName('vappkindcode').AsString:= Appkindcode;
                     ParamByName('vfamikind').AsString   := E_famikind.Text;
                     ParamByName('vfamirel').AsString    := E_famirel.Text;
                     ParamByName('vfaminame').AsString   := E_faminame.Text;
                     ParamByName('vfamibdate').AsString  := ME_famibdate.Text;
                     ParamByName('vappdate').AsString    := Copy(ME_appdate.Text,1,8);
                     ParamByName('vregdate').AsString    := ME_regdate.Text;
                     ParamByName('vappdesc').AsString    := CB_appdesc.Text;
                     ParamByName('vfawithdate').AsString := ME_fawithdate.Text;
                     ParamByName('empno').AsString    := Pempno;
                     ExecSQL;
                end;
          end;
     Finally
          qq.Free;
     end;
     BBsearch.Click;
     Phelpmsg.Caption := '  지급신청자료가 등록되었습니다.';
end;

procedure TMainForm.SpeedButton1Click(Sender: TObject);
var
     calendar: Tcalendar;
begin
     try
          calendar := Tcalendar.Create(Self);
          calendar.ShowModal;
          if calendar.DayCaption <> '' then
               ME_famibdate.Text := calendar.DayCaption;
     finally
          calendar.free;
     end;

end;

end.
