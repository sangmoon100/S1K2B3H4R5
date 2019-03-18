{===================== Program Header ==========================================
 PROGRAM-NAME      : PKQ2180C(근로소득 원천징수부 출력)
 SYSTEM-NAME       : 급여
 SUBSYSTEM-NAME    :
 Programmer        : 2차수정자
 Version           : 30.00
 Date              : 1998.12.29

Update Contents
 Version  date(yy.mm.dd)  programmer  description                        relevant doc.no
 10.00     1997.12.31            이인환          최초개발본              설계명세서
 10.01     1998.12.16            민정숙          창업투자,유치원학자금   전98-12-04
 30.00     1998.12.29            송두호          직위/직급수정            하나로인사재개발
 30.01     2013.03.13            hjku             퇴직정산 두개 이상 수용할 수 있게  수정(정문선M요청)
================================================================================}
{직급명을 가져오는 함수(Get_PayClName) 생성.}
unit pkq21801;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls, Quickrpt,
  Forms, Dialogs, DB, DBTables, StdCtrls, Mask, Buttons, ExtCtrls,
  userhelp, Gauges, Ora;//pass,Datelib,Calen2,

type
  TMainForm = class(TForm)
    Phelpmsg: TPanel;
    Panel3: TPanel;
    BBhelp: TBitBtn;
    BB_close: TBitBtn;
    BB_run: TBitBtn;
    BB_prnsetup: TBitBtn;
    PrinterSetupDialog1: TPrinterSetupDialog;
    Panel12: TPanel;
    Panel7: TPanel;
    Bevel1: TBevel;
    Shape1: TShape;
    Image1: TImage;
    Label2: TLabel;
    Lempinfo: TLabel;
    Lsysdate: TLabel;
    Panel1: TPanel;
    Label9: TLabel;
    Bevel2: TBevel;
    Panel2: TPanel;
    E_empnoFROM: TEdit;
    SB_empnoFROM: TSpeedButton;
    P_kornameFROM: TPanel;
    Label1: TLabel;
    E_empnoTO: TEdit;
    SB_empnoTO: TSpeedButton;
    P_kornameTO: TPanel;
    Panel4: TPanel;
    ME_workyy: TMaskEdit;
    Panel9: TPanel;
    Gauge1: TGauge;
    RBmas: TRadioButton;
    RBhis: TRadioButton;
    CBemp: TComboBox;
    Panel5: TPanel;
    GroupBox1: TGroupBox;
    RB_screen: TRadioButton;
    RB_printer: TRadioButton;
    procedure FormActivate(Sender: TObject);
    procedure BB_runClick(Sender: TObject);
    procedure BB_closeClick(Sender: TObject);
    procedure BB_prnsetupClick(Sender: TObject);
    procedure SB_empnoFROMClick(Sender: TObject);
    procedure SB_empnoTOClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BBhelpClick(Sender: TObject);

  private
    { Private declarations }

  public
    { Public declarations }
    Procedure Load_Emp_kornm;
    function GetRecord : Boolean;

  end;

var
  MainForm: TMainForm;
  Running: Boolean;

implementation
{$R *.DFM}

uses pkq21804, pkq21805, Func;//pkq21803,

{-------------------------------- MAIN ---------------------------------}
procedure TMainForm.FormActivate(Sender: TObject);
begin

     Application.ProcessMessages;

     OraConnect;

     Lempinfo.Caption := Pkorname + '(' +pempno+ ')';

     Lsysdate.Caption := fn_GetDateStr;

     ME_workyy.Text := Copy(Lsysdate.Caption,1,4); {작업기준년도}

     NewPrintForm.OraQuery1.Session := Ora_Session;

end;

{-------------------------------- EVENT -----------------------------}
{실행...}
procedure TMainForm.BB_runClick(Sender: TObject);
var
  tem,arg_tblnm : String;
begin

     if GetRecord = True then
     begin

          Gauge1.Progress := 0;
          Phelpmsg.Caption := '  해당범위의 자료를 추출중입니다.';
          Application.ProcessMessages;

          if RB_printer.Checked then NewPrintForm.QReport.Print
          else                       NewPrintForm.QReport.Preview;

          Phelpmsg.Caption := '  출력을 완료했습니다.';
          Gauge1.Progress := 0;
          Application.ProcessMessages;
     end;
end;

{프린터설정}
procedure TMainForm.BB_prnsetupClick(Sender: TObject);
begin
     PrinterSetupDialog1.Execute;
end;

{종료}
procedure TMainForm.BB_closeClick(Sender: TObject);
begin
     Close;
end;
procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     if Application.MessageBox('작업을 종료하시겠습니까?','작업안내', mb_YesNo) = IDYES then
          Action := caFree
     else
          Action := caNone;
end;

procedure TMainForm.SB_empnoFROMClick(Sender: TObject);
begin
     Fkyempno.Eempno.Text := E_empnoFROM.Text;
     Fkyempno.ShowModal;

     if Fkyempno.GIcloseS <> -1 then
     begin
          E_empnoFROM.Text := Fkyempno.GSempnoS;
          P_kornameFROM.Caption := Fkyempno.GSkornameS;
     end;
end;

procedure TMainForm.SB_empnoTOClick(Sender: TObject);
begin
     Fkyempno.Eempno.Text := E_empnoTO.Text;
     Fkyempno.ShowModal;
     if Fkyempno.GIcloseS <> -1 then
     begin
          E_empnoTO.Text := Fkyempno.GSempnoS;
          P_kornameTO.Caption := Fkyempno.GSkornameS;
     end;
end;

procedure TMainForm.BBhelpClick(Sender: TObject);
var
     HelpForm : THelpForm;
begin
     HelpForm := THelpForm.Create(Self);
     Try
          HelpForm.Programid := 'PKQ2180C';
          HelpForm.ShowModal;
     Finally
          HelpForm.Free;
     end;
end;

// 폼 활성화시 퇴직정산테이블의 사번,퇴직일, 성명을 불러온다...............
Procedure TMainForm.Load_Emp_kornm;
var
     qq : TOraQuery;
begin
     qq := TOraQuery.Create(Nil);
     qq.Session := Ora_Session;

     Try
          with qq do
          begin
               Close;
               SQL.Clear;
               SQL.Add('select empno, korname ');
               SQL.Add('  from pkhrthis       ');
               Open;

               First;
               CBemp.Items.Clear;
               while not Eof do
               begin
                   CBemp.Items.ADD(FieldByName('empno').AsString + ':' + FieldByName('korname').AsString);
                   Next;
               end;
          end;
     Finally
          qq.Free;
     end;
end;

function TMainForm.GetRecord: Boolean;
begin
     Result := False;

     with NewPrintForm.OraQuery1 do
     begin
          if RBmas.Checked = True then
          begin
               Close;
               SQL.Clear;
               SQL.Add('select b.empno,                                       ');
               SQL.Add('       b.korname,                                     ');
               SQL.Add('       b.juminid,                                     ');
               SQL.Add('       b.paycl,                                       ');
               SQL.Add('       b.paygr,                                       ');
               SQL.Add('       b.addr,                                        ');
               SQL.Add('       a.*,                                           ');
               SQL.Add('       y.*,                                           ');
               SQL.Add('       y.anuamt yanu                                  ');
               SQL.Add('  from pkmrtmas A, pkmpmas B, pkmrymas y              ');
               SQL.Add(' where a.empno = b.empno                              ');
               SQL.Add('   and a.empno = y.empno(+)                           ');
               //2013.03.13.hjku. 두개이상인자료도 나올수 있게 정문선M 요청
               SQL.Add('   and a.retdate = y.retdate(+)                       ');
               SQL.Add('   and a.empno between :p_empnofrom and :p_empnoto    ');
               SQL.Add('   and a.retdate like :p_workyy                       ');

               SQL.Add(' order by a.empno                                     ');
               ParamByName('p_empnofrom').AsString := E_empnoFROM.Text;
               ParamByName('p_empnoto').AsString := E_empnoTO.Text;
               ParamByName('p_workyy').AsString := ME_workyy.Text+'%';
               Open;

               if RecordCount = 0 then
               begin
                    MessageBox(Handle, '해당범위에 맞는 자료가 없습니다.','작업안내', MB_OK or $0030);
                    Result := False;
               end
               else
                    Result := True;


          end else
          if RBhis.Checked = True then
          begin
               Close;
               SQL.Clear;
               SQL.Add('select b.empno,                                       ');
               SQL.Add('       b.korname,                                     ');
               SQL.Add('       b.juminid,                                     ');
               SQL.Add('       b.paycl,                                       ');
               SQL.Add('       b.paygr,                                       ');
               SQL.Add('       b.addr,                                        ');
               SQL.Add('       a.*,                                           ');
               SQL.Add('       y.*,                                           ');
               SQL.Add('       y.anuamt yanu                                  ');
               SQL.Add('  from pkhrthis a, pkmpmas b,  pkhryhis y             ');
               SQL.Add(' where a.empno = b.empno                              ');
               SQL.Add('   and a.empno = y.empno(+)                           ');
               //2013.03.13.hjku. 두개이상인자료도 나올수 있게 정문선M 요청
               SQL.Add('   and a.retdate = y.retdate(+)                       ');
               SQL.Add('   and a.empno between :p_empnofrom and :p_empnoto    ');
               SQL.Add('   and a.retdate like :p_workyy                       ');
               SQL.Add(' order by  a.empno                                    ');
               ParamByName('p_empnofrom').AsString := E_empnoFROM.Text;
               ParamByName('p_empnoto').AsString := E_empnoTO.Text;
               ParamByName('p_workyy').AsString := ME_workyy.Text+'%';
               Open;

               if RecordCount = 0 then
               begin
                    MessageBox(Handle, '해당범위에 맞는 자료가 없습니다.','작업안내', MB_OK or $0030);
                    Result := False;
               end
               else
                    Result := True;

          end;
     end;

end;

end.
