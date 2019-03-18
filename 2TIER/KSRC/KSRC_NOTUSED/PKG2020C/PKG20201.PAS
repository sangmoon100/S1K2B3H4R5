unit Pkg20201;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, DB, DBTables, StdCtrls, Buttons, Mask, numedit, ExtCtrls,
  Grids, DBGrids, Gauges, Qrprntr, Ora, Func, KeyEmpno, KeyCode, DeptCode,
  MemDS, DBAccess;
  //pass, Datelib, Timeftp, dept2lib, kycode1, kyempno,

type
  TMainForm = class(TForm)
    Bevel1: TBevel;
    Shape1: TShape;
    Image1: TImage;
    Label4: TLabel;
    Lempinfo: TLabel;
    Lsysdate: TLabel;
    Label9: TLabel;
    Bevel2: TBevel;
    Phelpmsg: TPanel;
    Panel3: TPanel;
    BBhelp: TBitBtn;
    BB_close: TBitBtn;
    BB_run: TBitBtn;
    BB_prnsetup: TBitBtn;
    Panel12: TPanel;
    Panel4: TPanel;
    Panel8: TPanel;
    P_PrintDevice: TPanel;
    RB_printer: TRadioButton;
    RB_screen: TRadioButton;
    PrinterSetupDialog1: TPrinterSetupDialog;
    Label5: TLabel;
    Panel1: TPanel;
    Gauge1: TGauge;
    SB_FROMempno: TSpeedButton;
    Label1: TLabel;
    SB_TOempno: TSpeedButton;
    E_FROMempno: TEdit;
    P_FROMkorname: TPanel;
    E_TOempno: TEdit;
    P_TOkorname: TPanel;
    SB_FROMcodecode: TSpeedButton;
    Label2: TLabel;
    SB_TOcodecode: TSpeedButton;
    E_FROMdeptcode: TEdit;
    P_FROMdeptname: TPanel;
    E_TOdeptcode: TEdit;
    P_TOdeptname: TPanel;
    E_orgnum: TEdit;
    SB_FROMlickind: TSpeedButton;
    Label3: TLabel;
    SB_TOlickind: TSpeedButton;
    E_FROMlickind: TEdit;
    P_FROMlickind: TPanel;
    E_TOlickind: TEdit;
    P_TOlickind: TPanel;
    P_PrintOrder: TPanel;
    RB_empno: TRadioButton;
    RB_deptcode: TRadioButton;
    RB_lickind: TRadioButton;
    Panel2: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Query_Search: TOraQuery;
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
    procedure BB_prnsetupClick(Sender: TObject);
    procedure BB_runClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }

  public
    { Public declarations }

  end;

var
  MainForm: TMainForm;
  Running: Boolean;

implementation
{$R *.DFM}

uses
  pkg20202, pkg20203;

{-------------------------------- MAIN ----------------------------------------}
procedure TMainForm.FormCreate(Sender: TObject);
begin
     Running := False;
end;

procedure TMainForm.FormActivate(Sender: TObject);
var
     qq : TOraQuery;
begin
     if Running then System.Exit;
     Running := True;
     Application.ProcessMessages;

     OraConnect;

     Lempinfo.Caption := Pkorname + '(' +pempno+ ')';

     PhelpMsg.Caption := '  초기자료를 읽고있습니다.';
     Application.ProcessMessages;

     Lsysdate.Caption := fn_GetDateStr;

     printform := Tprintform.Create(Application);

     E_orgnum.Text := GetOrgNum;

     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     Try
          with qq do
          begin
               Close;
               SQL.Clear;
               SQL.Add(' select liceamt from pkcpbas  ');
               Open;
               PrintForm.liceamt := FieldByName('LICEAMT').AsFloat; {자격수당기준액}
          end;
     Finally
          qq.Free;
     end;

     PhelpMsg.Caption := '';
end;

{-------------------------------- EVENT -----------------------------}
procedure TMainForm.E_FROMempnoKeyPress(Sender: TObject; var Key: Char);
begin
     if Key <> #13 then System.Exit;
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

procedure TMainForm.SB_FROMempnoClick(Sender: TObject);
begin
     FKeyEmpno := TFKeyEmpno.Create(Self);
     Try
          FKeyEmpno.EdEmpno.Text := E_FROMempno.Text;
          FKeyEmpno.ShowModal;
          if FKeyEmpno.CloseChk <> -1 then
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
     if Key <> #13 then System.Exit;
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

procedure TMainForm.SB_TOempnoClick(Sender: TObject);
begin
     FKeyEmpno := TFKeyEmpno.Create(Self);
     Try
          FKeyEmpno.EdEmpno.Text := E_FROMempno.Text;
          FKeyEmpno.ShowModal;
          if FKeyEmpno.CloseChk <> -1 then
          begin
            E_TOempno.Text      := FKeyEmpno.v_KeyEmpno;
            P_TOkorname.Caption := FKeyEmpno.v_KeyKorname;
          end;
     Finally
          FKeyEmpno.Free;
     end;
end;

procedure TMainForm.E_FROMdeptcodeKeyPress(Sender: TObject; var Key: Char);
begin
     if Key <> #13 then System.Exit;
     Key := #0;
     P_FROMdeptname.Caption := GetDeptName(E_orgnum.Text, E_FROMdeptcode.Text);
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
     Finally
          FDeptCode.Free;
     end;
end;

procedure TMainForm.E_TOdeptcodeKeyPress(Sender: TObject; var Key: Char);
begin
     if Key <> #13 then System.Exit;
     Key := #0;
     P_TOdeptname.Caption := GetDeptName(E_orgnum.Text, E_TOdeptcode.Text);
end;

procedure TMainForm.SB_TOcodecodeClick(Sender: TObject);
begin
     FDeptCode := TFDeptCode.Create(Self);
     Try
          FDeptCode.EdOrgnum.Text := E_orgnum.Text;
          FDeptCode.ShowModal;
          if FDeptCode.CloseChk = -1 then Exit;

          E_TOdeptcode.text    := FDeptCode.GSdeptcode;
          P_TOdeptname.Caption := ' '+FDeptCode.GSdeptname;
          E_orgnum.Text          := FDeptCode.EdOrgnum.Text;
     Finally
          FDeptCode.Free;
     end;
end;

procedure TMainForm.E_FROMlickindKeyPress(Sender: TObject; var Key: Char);
begin
     if Key <> #13 then System.Exit;
     Key := #0;
     P_FROMlickind.Caption := GetCodeName('I231', E_FROMlickind.Text);
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
               E_FROMlickind.Text := FKeyCode.Code;
               P_FROMlickind.Caption := FKeyCode.Codename;
          end;
     Finally
          FKeyCode.Free;
     end;
end;

procedure TMainForm.E_TOlickindKeyPress(Sender: TObject; var Key: Char);
begin
     if Key <> #13 then System.Exit;
     Key := #0;
     P_TOlickind.Caption := GetCodeName('I231', E_TOlickind.Text);
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
               E_TOlickind.Text := FKeyCode.Code;
               P_TOlickind.Caption := FKeyCode.Codename;
          end;
     Finally
          FKeyCode.Free;
     end;
end;

{------------------------------ COMMAND BUTTON -----------------------------}
{실행}
procedure TMainForm.BB_runClick(Sender: TObject);
begin
     Phelpmsg.Caption := '  작업조건에 맞는 자료를 추출중입니다.';
     Application.ProcessMessages;

     Query_Search.Close;
     Query_Search.SQL.Clear;
     Query_Search.SQL.Add('SELECT a.EMPNO ,             ');
     Query_Search.SQL.Add('       a.KORNAME ,           ');
     Query_Search.SQL.Add('       b.DEPTCODE ,          ');
     Query_Search.SQL.Add('       b.LICEAMT ,           ');
     Query_Search.SQL.Add('       a.LICKIND ,           ');
     Query_Search.SQL.Add('       a.LICGR ,             ');
     Query_Search.SQL.Add('       a.LICNO ,             ');
     Query_Search.SQL.Add('       a.LICGETDATE ,        ');
     Query_Search.SQL.Add('       a.LICUPDDATE ,        ');
     Query_Search.SQL.Add('       a.LICRANK ,           ');
     Query_Search.SQL.Add('       a.LICALYN ,           ');
     Query_Search.SQL.Add('       a.LICALDATE ,         ');
     Query_Search.SQL.Add('       a.LICALFIELD ,        ');
     Query_Search.SQL.Add('       a.LICBIGO             ');
     Query_Search.SQL.Add('  FROM PIMLICE a, PKMPMAS b  ');
     Query_Search.SQL.Add(' WHERE (a.LICALYN = ''Y'' )  ');
     Query_Search.SQL.Add('   and (a.EMPNO = b.EMPNO)   ');

     if (E_FROMempno.Text <> '') and (E_TOempno.Text <> '') then
     begin
          Query_Search.SQL.Add(' and a.empno between :p_fr and :p_to  ');
          Query_Search.ParamByName('p_fr').AsString := E_FROMempno.Text;
          Query_Search.ParamByName('p_to').AsString := E_TOempno.Text;
     end
     else if (E_FROMdeptcode.Text <> '') and (E_TOdeptcode.Text <> '')
     then
     begin
          Query_Search.SQL.Add(' and b.orgnum = :p_orgnum                ');
          Query_Search.SQL.Add(' and b.deptcode between :p_fr and :p_to  '); 
          Query_Search.ParamByName('p_orgnum').AsString := E_orgnum.Text;
          Query_Search.ParamByName('p_fr').AsString     := E_FROMdeptcode.Text;
          Query_Search.ParamByName('p_to').AsString     := E_TOdeptcode.Text;
     end
     else if (E_FROMlickind.Text <> '') and (E_TOlickind.Text <> '') then
     begin
          Query_Search.SQL.Add(' and a.lickind between :p_fr and :p_to   ');
          Query_Search.ParamByName('p_fr').AsString := E_FROMlickind.Text;
          Query_Search.ParamByName('p_to').AsString := E_TOlickind.Text; 
     end
     else
     begin
          MessageBox(Handle, '작업조건에 맞는 해당값을 정확히 입력하세요', '입력오류', MB_ICONWARNING);
          System.Exit;
     end;

     if RB_empno.Checked then
     begin
          PrintForm.QRL_KindOfOrder.Caption := '사번순';
          Query_Search.SQL.Add(' order by a.empno ');
     end
     else if RB_deptcode.Checked then
     begin
          PrintForm.QRL_KindOfOrder.Caption := '부서('+E_orgnum.Text+'차)/사번순';
          Query_Search.SQL.Add(' order by b.orgnum, b.deptcode, a.empno ');
     end
     else
     begin
          PrintForm.QRL_KindOfOrder.Caption := '자격면허종류순';
          Query_Search.SQL.Add(' order by a.lickind, a.empno ');
     end;

     Query_Search.Open;

     if Query_Search.RecordCount = 0 then
     begin
          Application.MessageBox('작업조건에 맞는 자료가 한건도 없습니다.',
                                  '작업안내', mb_Ok);
          Phelpmsg.Caption := '';
          System.Exit;
     end;

     if (E_FROMempno.Text <> '') and (E_TOempno.Text <> '') then
       PrintForm.QRL_MSGempno.Caption := E_FROMempno.Text+'('+P_FROMkorname.Caption+') ~ '+
                                         E_TOempno.Text+'('+P_TOkorname.Caption+')'
     else
       PrintForm.QRL_MSGempno.Caption := '없음';

     if (E_FROMdeptcode.Text <> '') and (E_TOdeptcode.Text <> '') then
       PrintForm.QRL_MSGdept.Caption := E_orgnum.Text+'차  '+E_FROMdeptcode.Text+'('+P_FROMdeptname.Caption+') ~ '+
                                        E_TOdeptcode.Text+'('+P_TOdeptname.Caption+')'
     else
       PrintForm.QRL_MSGdept.Caption := '없음';

     if (E_FROMlickind.Text <> '') and (E_TOlickind.Text <> '') then
       PrintForm.QRL_MSGlickind.Caption := E_FROMlickind.Text+'('+P_FROMlickind.Caption+') ~ '+
                                           E_TOlickind.Text+'('+P_TOlickind.Caption+')'
     else
       PrintForm.QRL_MSGlickind.Caption := '없음';


     if RB_printer.Checked then
     begin
          printform.user_preview := false;
          PrintForm.QReport.Print;
          QRPrinter.Cleanup;
          printform.free;
     end
     else
     begin
          PrintForm.QReport.Preview;
          QRPrinter.Cleanup;
     end;

     Query_Search.Close;

     Phelpmsg.Caption := '  출력을 완료하였습니다.';
     Gauge1.Progress := 0;
     
     printform := Tprintform.create(application);
end;

{종료}
procedure TMainForm.BB_closeClick(Sender: TObject);
begin
     Close;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     if Application.MessageBox('작업을 종료하시겠습니까?','작업안내', mb_YesNo) = IDYES then
     begin
          printform.free;
          Action := caFree;
     end
     else
          Action := caNone;
end;

procedure TMainForm.BB_prnsetupClick(Sender: TObject);
begin
     PrinterSetupDialog1.Execute;
end;

end.
