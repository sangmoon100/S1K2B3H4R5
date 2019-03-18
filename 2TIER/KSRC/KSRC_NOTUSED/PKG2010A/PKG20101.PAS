unit Pkg20101;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, DB, DBTables, StdCtrls, Buttons, Mask, numedit, ExtCtrls,
  pass, Kylib1, Grids, DBGrids, Func, Ora, KeyEmpno, DeptCode, KeyCode,
  MemDS, DBAccess;//Kyempno, kycode1,Timeftp,Datelib, dept2lib,

type
  TMainForm = class(TForm)
    Phelpmsg: TPanel;
    Panel19: TPanel;
    Lempinfo: TLabel;
    Lsysdate: TLabel;
    Panel2: TPanel;
    SB_FROMempno: TSpeedButton;
    Panel7: TPanel;
    E_FROMempno: TEdit;
    P_FROMkorname: TPanel;
    Panel6: TPanel;
    Panel3: TPanel;
    BB_close: TBitBtn;
    BB_SrchSupply: TBitBtn;
    E_FROMlickind: TEdit;
    SB_FROMlickind: TSpeedButton;
    Panel8: TPanel;
    P_FROMlickind: TPanel;
    Label1: TLabel;
    P_DEPTorg: TPanel;
    E_FROMdeptcode: TEdit;
    SB_FROMcodecode: TSpeedButton;
    P_FROMdeptname: TPanel;
    SB_TOempno: TSpeedButton;
    E_TOempno: TEdit;
    P_TOkorname: TPanel;
    Label2: TLabel;
    E_TOdeptcode: TEdit;
    SB_TOcodecode: TSpeedButton;
    P_TOdeptname: TPanel;
    Label3: TLabel;
    SB_TOlickind: TSpeedButton;
    E_TOlickind: TEdit;
    P_TOlickind: TPanel;
    DBGrid1: TDBGrid;
    DataSource: TDataSource;
    E_orgnum: TEdit;
    BB_help: TBitBtn;
    Panel1: TPanel;
    L_abstraction: TLabel;
    Panel5: TPanel;
    E_empno: TEdit;
    BB_SrchNotSupply: TBitBtn;
    BB_UpdateMaster: TBitBtn;
    Query_Search: TOraQuery;
    Query_SearchLICALYN: TStringField;
    Query_SearchEMPNO: TStringField;
    Query_SearchKORNAME: TStringField;
    Query_SearchLICKIND: TStringField;
    Query_SearchLICGR: TStringField;
    Query_SearchLICKINDNAME: TStringField;
    Query_SearchLICGRNAME: TStringField;
    Query_SearchLICNO: TStringField;
    Query_SearchLICGETDATE: TStringField;
    Query_SearchLICUPDDATE: TStringField;
    Query_SearchLICALDATE: TStringField;
    Query_SearchLICALFIELD: TStringField;
    Query_SearchROWNUM: TFloatField;
    procedure FormActivate(Sender: TObject);
    procedure E_FROMlickindKeyPress(Sender: TObject; var Key: Char);
    procedure E_FROMempnoKeyPress(Sender: TObject; var Key: Char);
    procedure SB_FROMempnoClick(Sender: TObject);
    procedure BB_closeClick(Sender: TObject);
    procedure SB_FROMlickindClick(Sender: TObject);
    procedure E_TOempnoKeyPress(Sender: TObject; var Key: Char);
    procedure SB_TOempnoClick(Sender: TObject);
    procedure E_TOlickindKeyPress(Sender: TObject; var Key: Char);
    procedure SB_TOlickindClick(Sender: TObject);
    procedure E_FROMdeptcodeKeyPress(Sender: TObject; var Key: Char);
    procedure SB_FROMcodecodeClick(Sender: TObject);
    procedure E_TOdeptcodeKeyPress(Sender: TObject; var Key: Char);
    procedure SB_TOcodecodeClick(Sender: TObject);
    procedure BB_SrchSupplyClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure DataSourceDataChange(Sender: TObject; Field: TField);
    procedure E_empnoKeyPress(Sender: TObject; var Key: Char);
    procedure BB_SrchNotSupplyClick(Sender: TObject);
    procedure BB_UpdateMasterClick(Sender: TObject);

  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;
  Running: Boolean;

  Old_Empno: String[4];

implementation
{$R *.DFM}

{-------------------------------- MAIN ----------------------------------------}
procedure TMainForm.FormCreate(Sender: TObject);
begin
     Running := False;
end;

procedure TMainForm.FormActivate(Sender: TObject);
begin
     if Running then System.Exit;
     Running := True;
     Application.ProcessMessages;

     OraConnect;

     Lempinfo.Caption := Pkorname + '(' +pempno+ ')';
     Lsysdate.Caption := fn_GetDateStr;

     E_orgnum.Text := GetOrgNum;

     Old_Empno := '';
  
     BB_SrchSupplyClick(Sender);
end;

procedure TMainForm.BB_closeClick(Sender: TObject);
begin
     Close;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     if Application.MessageBox('작업을 종료하시겠습니까?',
                               '작업안내', mb_YesNo) = IDYES
     then
     begin
          Action := caFree;
     end
     else
          Action := caNone;
end;


{-------------------------------- EVENT -----------------------------}
procedure TMainForm.E_FROMempnoKeyPress(Sender: TObject; var Key: Char);
begin
     if Key = #13 then
     begin
          Key := #0;
          if GetKorname(E_FROMempno.Text) = '' then
          begin
               PhelpMsg.Caption := '  해당 사번의 자료가 급여마스터 테이블에 없습니다.'
          end
          else
          begin
               P_FROMkorname.Caption := GetKorName(E_FROMempno.Text);
          end;
     end;
end;

procedure TMainForm.SB_FROMempnoClick(Sender: TObject);
begin
     FKeyEmpno := TFKeyEmpno.Create(Self);
     Try
          FKeyEmpno.EdEmpno.Text := E_FROMempno.Text;
          FKeyEmpno.ShowModal;
          if FKeyEmpno.Closechk <> -1 then
          begin
               E_FROMempno.Text      := FKeyEmpno.v_KeyEmpno;
               P_FROMkorname.Caption := FKeyEmpno.v_KeyKorname;
          end;
     Finally
          FKeyEmpno.Free;
     end;
end;

procedure TMainForm.E_TOempnoKeyPress(Sender: TObject; var Key: Char);
begin
     if Key = #13 then
     begin
          Key := #0;
          if GetKorName(E_TOempno.Text) = '' then
          begin
               PhelpMsg.Caption := '  해당 사번의 자료가 급여마스터 테이블에 없습니다.'
          end
          else
          begin
               P_TOkorname.Caption := GetKorName(E_TOempno.Text);
          end;
     end;
end;

procedure TMainForm.SB_TOempnoClick(Sender: TObject);
begin
     Fkeyempno := TFkeyempno.Create(Self);
     Try
          FKeyEmpno.EdEmpno.Text := E_TOempno.Text;
          FKeyEmpno.ShowModal;
          if FKeyEmpno.CloseChk <> -1 then
          begin
               E_TOempno.Text      := FKeyEmpno.v_KeyEmpno;
               P_TOkorname.Caption := FKeyEmpno.v_KeyKorname;
          end;
     finally
          FKeyEmpno.Free;
     end;
end;

procedure TMainForm.E_FROMdeptcodeKeyPress(Sender: TObject; var Key: Char);
begin
     if Key = #13 then
     begin
          Key := #0;
          P_FROMdeptname.Caption := GetDeptName(E_orgnum.Text, E_FROMdeptcode.Text);
     end;
end;
procedure TMainForm.SB_FROMcodecodeClick(Sender: TObject);
begin
     FDeptCode := TFDeptCode.Create(Self);
     Try
          FDeptCode.EdOrgnum.Text := E_orgnum.Text;
          FDeptCode.ShowModal;
          if FDeptCode.CloseChk = -1 then Exit;

          E_FROMdeptcode.text    := FDeptCode.GSdeptcode;
          P_FROMdeptname.Caption := ' '+FDeptCode.GSdeptname;
          E_orgnum.Text          := FDeptCode.EdOrgnum.Text;
     finally
          FDeptCode.Free;
     end;
end;

procedure TMainForm.E_TOdeptcodeKeyPress(Sender: TObject; var Key: Char);
begin
     if Key = #13 then
     begin
          Key := #0;
          P_TOdeptname.Caption := GetDeptName(E_orgnum.Text, E_TOdeptcode.Text);
     end;
end;

procedure TMainForm.SB_TOcodecodeClick(Sender: TObject);
begin
     FDeptCode := TFDeptCode.Create(Self);
     Try
          FDeptCode.EdOrgnum.Text := E_orgnum.Text;
          FDeptCode.ShowModal;
          if FDeptCode.CloseChk = -1 then Exit;

          E_FROMdeptcode.text    := FDeptCode.GSdeptcode;
          P_FROMdeptname.Caption := ' '+FDeptCode.GSdeptname;
          E_orgnum.Text          := FDeptCode.EdOrgnum.Text;
     finally
          FDeptCode.Free;
     end;
end;

procedure TMainForm.E_FROMlickindKeyPress(Sender: TObject; var Key: Char);
begin
     if Key = #13 then
     begin
          Key := #0;
          P_FROMlickind.Caption := GetDeptName('I231', E_FROMlickind.Text);
     end;
end;

procedure TMainForm.SB_FROMlickindClick(Sender: TObject);
begin
     FKeyCode := TFKeyCode.Create(Self);
     Try
          FKeyCode.FormData := '자격면허종류조회';
          FKeyCode.Dataval1 := 'I231';
          FKeyCode.ShowModal;
          if FKeyCode.CloseChk <> -1 then
          begin
               E_FROMlickind.Text    := FKeyCode.Code;
               P_FROMlickind.Caption := FKeyCode.Codename;
          end;
     Finally
          FKeyCode.Free;
     end;
end;

procedure TMainForm.E_TOlickindKeyPress(Sender: TObject; var Key: Char);
begin
     if Key = #13 then
     begin
          Key := #0;
          P_TOlickind.Caption := GetCodeName('I231', E_TOlickind.Text);
     end;
end;
procedure TMainForm.SB_TOlickindClick(Sender: TObject);
begin
     FKeyCode := TFKeyCode.Create(Self);
     Try
          FKeyCode.FormData := '자격면허종류조회';
          FKeyCode.Dataval1 := 'I231';
          FKeyCode.ShowModal;
          if FKeyCode.CloseChk <> -1 then
          begin
               E_TOlickind.Text    := FKeyCode.Code;
               P_TOlickind.Caption := FKeyCode.Codename;
          end;
     Finally
          FKeyCode.Free;
     end;
end;

{------------------------------ COMMAND BUTTON -----------------------------}
procedure TMainForm.BB_SrchSupplyClick(Sender: TObject);
var
  SearchOptions: TLocateOptions;
begin
     with Query_Search do
     begin
          if FieldByName('EMPNO').AsString <> '' then
               Old_Empno := FieldByName('EMPNO').AsString;

          PhelpMsg.Caption := '  해당조건의 지급대상자를 추출중입니다.';
          Application.ProcessMessages;

          Close;
          SQL.Clear;          
          SQL.ADD('select a.licalyn,                               ');
          SQL.ADD('       a.empno,                                 ');
          SQL.ADD('       a.korname,                               ');
          SQL.ADD('       a.lickind,                               ');
          SQL.ADD('       a.licgr,                                 ');
          SQL.ADD('       (select codename from pyccode            ');
          SQL.ADD('         where codeid = ''I231''                ');
          SQL.ADD('           and codeno = a.lickind) lickindname, ');
          SQL.ADD('       (select codename from pyccode            ');
          SQL.ADD('         where codeid = ''I232''                ');
          SQL.ADD('           and codeno = a.licgr) licgrname,     ');
          SQL.ADD('       a.licno,                                 ');
          SQL.ADD('       a.licgetdate,                            ');
          SQL.ADD('       a.licupddate,                            ');
          SQL.ADD('       a.licaldate,                             ');
          SQL.ADD('       a.licalfield,                            ');
          SQL.ADD('       rownum                                   ');
          SQL.ADD('  from pimlice a, pkmpmas b                     ');  
          SQL.ADD(' where (a.empno = b.empno)                      ');
          SQL.ADD('   and (a.licalyn = ''Y'')                      '); {지급}

          if (E_FROMempno.Text <> '') and (E_FROMempno.Text <> '') then
          begin
               SQL.ADD(' and a.empno between :p_frempno and :p_toempno  ');
               ParamByName('p_frempno').AsString := E_FROMempno.Text;
               ParamByName('p_toempno').AsString := E_TOempno.Text;
          end;
          if (E_FROMdeptcode.Text <> '') and (E_TOdeptcode.Text <> '') then
          begin
               SQL.ADD(' and b.orgnum = :p_orgnum                    ');
               SQL.ADD(' and b.deptcode between :p_fr and :p_to      ');
               ParamByName('p_orgnum').AsString := E_orgnum.Text;
               ParamByName('p_fr').AsString     := E_FROMdeptcode.Text;
               ParamByName('p_to').AsString     := E_TOdeptcode.Text;
          end;
          if (E_FROMlickind.Text <> '') and (E_TOlickind.Text <> '') then
          begin
               SQL.ADD(' and a.lickind between :p_fr and :p_to      ');
               ParamByName('p_fr').AsString := E_FROMlickind.Text;
               ParamByName('p_to').AsString := E_TOlickind.Text;
          end;

          Open;

          if RecordCount = 0 then
          begin
               PhelpMsg.Caption := '  해당조건에 맞는 자료가 하나도 없습니다';
          end
          else
          begin
               PhelpMsg.Caption := '  해당조건에 맞는 자료가 추출되었습니다.';
               SearchOptions := [loPartialKey];
               if Locate('EMPNO', Old_empno, SearchOptions) then
                 DBGrid1.SetFocus;
          end;
     end;

     Application.ProcessMessages;
end;

procedure TMainForm.BB_SrchNotSupplyClick(Sender: TObject);
var
     SearchOptions: TLocateOptions;
begin
     with Query_Search do
     begin
          if FieldByName('EMPNO').AsString <> '' then
            Old_Empno := FieldByName('EMPNO').AsString;

          PhelpMsg.Caption := '  해당조건의 비지급대상자를 추출중입니다.';
          Application.ProcessMessages;

          Close;
          SQL.Clear;          
          SQL.ADD('select a.licalyn,                               ');
          SQL.ADD('       a.empno,                                 ');
          SQL.ADD('       a.korname,                               ');
          SQL.ADD('       a.lickind,                               ');
          SQL.ADD('       a.licgr,                                 ');
          SQL.ADD('       (select codename from pyccode            ');
          SQL.ADD('         where codeid = ''I231''                ');
          SQL.ADD('           and codeno = a.lickind) lickindname, ');
          SQL.ADD('       (select codename from pyccode            ');
          SQL.ADD('         where codeid = ''I232''                ');
          SQL.ADD('           and codeno = a.licgr) licgrname,     ');
          SQL.ADD('       a.licno,                                 ');
          SQL.ADD('       a.licgetdate,                            ');
          SQL.ADD('       a.licupddate,                            ');
          SQL.ADD('       a.licaldate,                             ');
          SQL.ADD('       a.licalfield,                            ');
          SQL.ADD('       rownum                                   ');
          SQL.ADD('  from pimlice a, pkmpmas b                     ');
          SQL.ADD(' where a.empno = b.empno                        ');
          SQL.ADD('   and a.licalyn <> ''Y''                       ');

          if E_orgnum.Text <> '' then
          begin
               SQL.ADD(' and b.orgnum = :p_orgnum                  ');
               ParamByName('p_orgnum').AsString := E_orgnum.Text;
          end;

          Open;

          if RecordCount = 0 then
          begin
               PhelpMsg.Caption := '  해당조건에 맞는 자료가 하나도 없습니다';
          end
          else
          begin
               PhelpMsg.Caption := '  해당조건에 맞는 자료가 추출되었습니다.';
               SearchOptions := [loPartialKey];
               if Locate('EMPNO', Old_empno, SearchOptions) then
                    DBGrid1.SetFocus;
          end;
     end;
end;

procedure TMainForm.E_empnoKeyPress(Sender: TObject; var Key: Char);
begin
     if Key <> #13 then System.Exit;

     Key := #0;

     if Query_Search.Locate('EMPNO', Old_empno, [loPartialKey]) then
          DBGrid1.SetFocus;
end;

procedure TMainForm.DataSourceDataChange(Sender: TObject; Field: TField);
begin
     L_abstraction.Caption := '['+FloatToStr(Query_Search.FieldByName('ROWNUM').AsFloat)+' / '+
                                   IntToStr(Query_Search.RecordCount)+']';
     E_empno.Text := Query_Search.FieldByName('EMPNO').AsString;
end;

procedure TMainForm.BB_UpdateMasterClick(Sender: TObject);
var
     liceamt: real;
     qq : TOraQUery;
begin
     if Application.MessageBox('급여마스터의 자격면허수와 자격면허수당계를 갱신합니다.  확실히 작업하시겠습니까 ?',
                               '작업안내', mb_YesNo) <> IDYES
     then
          System.Exit;

     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     Try
          with qq do
          begin
               PhelpMsg.Caption := '  자격수당기준액을 읽습니다.';                             
               Application.ProcessMessages;                                                    
               Close;                                                                
               SQL.Clear;                                                            
               SQL.ADD(' select liceamt from pkcpbas ');
               Open;
               liceamt := FieldByName('liceamt').AsFloat; {자격수당기준액}
               Close;
                                                                                            
               PhelpMsg.Caption := '  급여마스터의 자격면허수와 자격면허수당계를 초기화합니다';
               Application.ProcessMessages;
               SQL.Clear;                                                            
               SQL.ADD(' update pkmpmas       ');                                          
               SQL.ADD('    set licecnt = 0,  ');                                     
               SQL.ADD('        liceamt = 0   ');                                     
               ExecSql;                                                              
               Close;                                                                
                                                                                            
               PhelpMsg.Caption := '  급여마스터의 자격면허수를 산정합니다';                   
               Application.ProcessMessages;                                                    
               SQL.Clear;                                                            
               SQL.ADD('update pkmpmas a                                      ');                                        
               SQL.ADD('   set a.licecnt = (select count(b.empno)             ');          
               SQL.ADD('                      from pimlice b                  ');               
               SQL.ADD('                     where (b.empno = a.empno)        ');      
               SQL.ADD('                       and (b.licalyn = ''Y''))       ');         
               SQL.ADD(' where (a.payyn = ''Y'')                              ');          
               SQL.ADD('   and (a.empno in (select c.empno                    ');          
               SQL.ADD('                      from pimlice c                  ');               
               SQL.ADD('                     where c.licalyn = ''Y''          ');          
               SQL.ADD('                     group by c.empno))               ');          
               ExecSql;                                                              
               Close;                                                                
                                                                                            
               PhelpMsg.Caption := '  급여마스터의 자격면허수당계를 산정합니다';               
               Application.ProcessMessages;                                                    
               SQL.Clear;                                                            
               SQL.ADD('update pkmpmas                             ');     
               SQL.ADD('   set liceamt = licecnt * :p_liceamt      ');
               SQL.ADD(' where payyn = ''Y''                       ');
               ParamByName('P_liceamt').AsFloat := liceamt;                          
               ExecSql;                                                              
               Close;                                                                
          end;
     Finally
          qq.Free;
     end;
  
     PhelpMsg.Caption := '  급여마스터의 자격면허수, 자격면허수당계을 갱신하였습니다.';
end;

end.
