{
---------------------Program  Header -------------------------------------------
PROGRAM-NAME    : PIA8020C(�μ�/��å�� ���տ���Ȳ)
SYSTEM-NAME     : �����λ�����
SUBSYSTEM-NAME  : �λ�
Programmer      : ȫ����
Version         : 1.00
Date            : 2007.01.29
Update contents
  ����     ������     ������   ���ñٰ�        ��������
  1.00   2007.01.29   ȫ����  ����ó�� ��û��  �ű����α׷� ����
--------------------------------------------------------------------------------
}

unit PIA80201;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, Gauges, ExtCtrls, Tabs, TabNotBk,
  Mask, DBTables, Quickrpt,  DBGrids, pass, Datelib, Timeftp,
  Db , ComObj, OleCtrls, Grids, kpaylib, Func, MemDS, DBAccess, Ora;

type
  TMainForm = class(TForm)
    Panel1: TPanel;
    Lempno: TLabel;
    Lsysdate: TLabel;
    Panel3: TPanel;
    Panel2: TPanel;
    Panel14: TPanel;
    Panel4: TPanel;
    BB_Close: TBitBtn;
    BB_Screen: TBitBtn;
    BB_Print: TBitBtn;
    P_helpinfo: TPanel;
    P_Help: TLabel;
    Label1: TLabel;
    BB_SetUp: TBitBtn;
    PrinterSetup: TPrinterSetupDialog;
    SaveDialog1: TSaveDialog;
    Panel5: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Panel6: TPanel;
    Label7: TLabel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel11: TPanel;
    Btext: TBitBtn;
    Edit1: TEdit;
    OraQuery1: TOraQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BB_CloseClick(Sender: TObject);
    procedure BB_ScreenClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure BB_SetUpClick(Sender: TObject);

  private       
    { Private declarations }
    start: Integer;
    procedure Data_Display;
    Procedure Data_Display_csv(Sender: TObject);
    procedure Data_Display2;
    Procedure Data_Display2_csv(Sender: TObject);

  public
    { Public declarations }
    AReport: TQuickRep;
  end;

var
  MainForm: TMainForm;
  ErrorHelp       : array[0..255] of char;
implementation

uses pia80202, PIA80203;

{$R *.DFM}

procedure TMainForm.FormCreate(Sender: TObject);
begin
  start := 0;
end;

procedure TMainForm.FormPaint(Sender: TObject);
begin
  if start = 0 then
  begin
       start := 1;
       Application.ProcessMessages;

       P_Help.Caption := ' �����λ�ý��ۿ� �������Դϴ�, ��ø���ٸ�����...';
       Application.ProcessMessages;

       OraConnect;

       Lempno.Caption   := Pkorname + '(' + Pempno+')';
       Lsysdate.Caption := fn_GetDateStr;
       if copy(Pgrade,5,1) > 'C' then
       begin
            MessageBox(handle,'���α׷� �������� �����ϴ� !!.','�� ��',MB_OK or $0030);
            close;
       end;
  end;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TMainForm.BB_CloseClick(Sender: TObject);
begin
    Close;
end;

procedure TMainForm.BB_ScreenClick(Sender: TObject);
begin
  Application.ProcessMessages;
  P_Help.Caption := '�μ�/BAND�� [���տ� ��Ȳ]�� �����մϴ� !!.';
  SendMessage(P_helpinfo.handle,WM_PAINT,0,0);

  if Copy(Fn_GetDateTimeStr,1,8) < '20190101' then
  begin
     PrintForm.Qry_DetailSum.Active := True;
     AReport := PrintForm.QuickRep1;
  end
  else
  begin
     PrintForm2.Qry_DetailSum.Active := True;
     AReport := PrintForm2.QuickRep1;
  end;

  {�μ�}
  if TBitBtn(Sender).Name = 'BB_Print' then
  begin
    AReport.Print;
  end
  {ȭ�����}
  else if TBitBtn(Sender).Name = 'BB_Screen' then   //ȭ�����
  begin
    AReport.Preview;
  end
  {excel ��ȯ}
  else if TBitBtn(Sender).Name = 'Btext' then     //excel ��ȯ
  begin
    SaveDialog1.FileName := '�μ� BAND�� ���տ� ��Ȳ_'+Copy(Fn_GetDateTimeStr,1,8)+'.csv';
    if saveDialog1.Execute then
    begin
        if Copy(Fn_GetDateTimeStr,1,8) < '20190101' then
        begin
            Data_Display_csv(Sender)
        end
        else
        begin
            Data_Display2_csv(Sender)
        end
    end
  end;

  P_Help.Caption := '�۾��� �Ϸ�Ǿ����ϴ�.';

  Screen.Cursor := crDefault;
end;

procedure TMainForm.BB_SetUpClick(Sender: TObject);
begin
  PrinterSetup.Execute;
end;

procedure TMainForm.Data_Display_csv(Sender: TObject);
var
  Fexcel : textfile;
begin
  Application.ProcessMessages;
  assignfile(Fexcel, SaveDialog1.FileName);
  rewrite(Fexcel);
  writeln(Fexcel, ',,,,,,��,��,/,BAND,��,,,��,��,��,,��,Ȳ');
  writeln(Fexcel, '');
  writeln(Fexcel, ',[���س��] ,:, '+copy(Lsysdate.Caption,1,4)+' ��, '+copy(Lsysdate.Caption,6,2)+' ��');
  writeln(Fexcel, '');
  writeln(Fexcel, ',�ӿ�,L2��,L2��,L2��,L2��,L1��,L1��,L1��,L1��,G4��,G4��,G4��,G4��,G3��,G3��,G3��,G3��,G2��,G2��,G2��,G2��,Ư��,Ư��,Ư��,Ư��,����,�Ұ�,����,����,����,���,�Ϲ�,�Ұ�,�Ѱ�');
  Data_Display;
  with OraQuery1 do
  begin
    First;
    while not Eof do
    begin
      P_Help.Caption := '['+FieldByName('deptname').AsString+'] �ٹ��μ��� �ο��� �����մϴ� !!.';
      SendMessage(P_helpinfo.handle,WM_PAINT,0,0);
      writeln(Fexcel,
                     FieldByName('DEPTNAME').AsString       +','+
                     FieldByName('�ӿ�').AsString           +','+
                     FieldByName('L2_����').AsString      +','+
                     FieldByName('L2_���Դ��').AsString  +','+
                     FieldByName('L2_���տ�').AsString    +','+
                     FieldByName('BUPER').AsString          +','+
                     FieldByName('L1_����').AsString      +','+
                     FieldByName('L1_���Դ��').AsString  +','+
                     FieldByName('L1_���տ�').AsString    +','+
                     FieldByName('CHPER').AsString          +','+
                     FieldByName('G4_����').AsString      +','+
                     FieldByName('G4_���Դ��').AsString  +','+
                     FieldByName('G4_���տ�').AsString    +','+
                     FieldByName('GAPER').AsString          +','+
                     FieldByName('G3_����').AsString      +','+
                     FieldByName('G3_���Դ��').AsString  +','+
                     FieldByName('G3_���տ�').AsString    +','+
                     FieldByName('DEPER').AsString          +','+
                     FieldByName('G2_����').AsString      +','+
                     FieldByName('G2_���Դ��').AsString  +','+
                     FieldByName('G2_���տ�').AsString    +','+
                     FieldByName('SAPER').AsString          +','+
                     FieldByName('Ư��_����').AsString      +','+
                     FieldByName('Ư��_���Դ��').AsString  +','+
                     FieldByName('Ư��_���տ�').AsString    +','+
                     FieldByName('SPPER').AsString          +','+
                     FieldByName('�Ұ�_����').AsString      +','+
                     FieldByName('�Ұ�_���Դ��').AsString  +','+
                     FieldByName('�Ұ�_���տ�').AsString    +','+
                     FieldByName('SOPER').AsString          +','+
                     FieldByName('����').AsString           +','+
                     FieldByName('���').AsString           +','+
                     FieldByName('�Ϲ�').AsString           +','+
                     FieldByName('��������_�Ұ�').AsString  +','+
                     FieldByName('�Ѱ�').AsString           );
      Next;
    end;
  end;
  closefile(Fexcel);
end;

procedure TMainForm.Data_Display;
begin
  with OraQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select  DEPTNAME, DIRECTOR �ӿ�,                                                                 ');
    SQL.Add('        HWON_BU L2_����, NON_BU L2_���Դ��, BU L2_���տ�, BUPER,                          ');
    SQL.Add('        HWON_CHA L1_����, NON_CHA L1_���Դ��, CHA L1_���տ�, CHPER,                       ');
    SQL.Add('        HWON_GOA G4_����, NON_GOA G4_���Դ��, GOA G4_���տ�, GAPER,                       ');
    SQL.Add('        HWON_DAE G3_����, NON_DAE G3_���Դ��, DAE G3_���տ�, DEPER,                       ');
    SQL.Add('        HWON_SA G2_����, NON_SA G2_���Դ��, SA G2_���տ�, SAPER,                          ');
    SQL.Add('        HWON_Ư�� Ư��_����, NON_Ư�� Ư��_���Դ��, Ư�� Ư��_���տ�, SPPER,                    ');
    SQL.Add('        HWON_SO �Ұ�_����, NON_SO �Ұ�_���Դ��, SO �Ұ�_���տ�, SOPER,                          ');
    SQL.Add('        HWON_J ����, HWON_PQ ���, HWON_Y �Ϲ�, HWON_BEALL ��������_�Ұ�, ');
    SQL.Add('        HWON_ALL �Ѱ�');
    SQL.Add('   from (                                                                                  ');
    SQL.Add('       select ''A'' DEPTLEVEL, ''0'' DEPTCODE, ''      ��           ��  '' DEPTNAME,     ');
    SQL.Add('                count(decode(substr(b.empno,1,1),''M'',''1'')) DIRECTOR,                   ');
    SQL.Add('                count(decode(b.paycl, ''C11'',''1'')) "HWON_BU",                                                                                                                    ');
    SQL.Add('                count(decode(b.paycl, ''C11'',decode(substr(b.nogubun,1,1),''9'','''',''1''))) "NON_BU",                                                                            ');
    SQL.Add('                round((count(decode(b.paycl, ''C11'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) ) /                                                   ');
    SQL.Add('                (count(decode(b.paycl, ''C11'',''1''))  ) * 100,1) "BUPER",                                                                                                         ');
    SQL.Add('                count(decode(b.paycl, ''C11'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) "BU",                                                        ');
    SQL.Add('                count(decode(b.paycl, ''C21'',''1'')) "HWON_CHA",                                                                                                                   ');
    SQL.Add('                count(decode(b.paycl, ''C21'',decode(substr(b.nogubun,1,1),''9'','''',''1''))) "NON_CHA",                                                                           ');
    SQL.Add('                count(decode(b.paycl, ''C21'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) "CHA",                                                       ');
    SQL.Add('                round((count(decode(b.paycl, ''C21'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) ) /                                                   ');
    SQL.Add('                (count(decode(b.paycl, ''C21'',''1'')) ) * 100,1) "CHPER",                                                                                                          ');
    SQL.Add('                count(decode(b.paycl, ''D11'',''1'')) "HWON_GOA",                                                                                                                   ');
    SQL.Add('                count(decode(b.paycl, ''D11'',decode(substr(b.nogubun,1,1),''9'','''',''1''))) "NON_GOA",                                                                           ');
    SQL.Add('                count(decode(b.paycl, ''D11'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) "GOA",                                                       ');
    SQL.Add('                round((count(decode(b.paycl, ''D11'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) ) /                                                   ');
    SQL.Add('                (count(decode(b.paycl, ''D11'',''1'')) )  * 100,1) "GAPER",                                                                                                         ');
    SQL.Add('                count(decode(b.paycl, ''D21'',''1'')) "HWON_DAE",                                                                                                                   ');
    SQL.Add('                count(decode(b.paycl, ''D21'',decode(substr(b.nogubun,1,1),''9'','''',''1''))) "NON_DAE",                                                                           ');
    SQL.Add('                count(decode(b.paycl, ''D21'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) "DAE",                                                       ');
    SQL.Add('                round((count(decode(b.paycl, ''D21'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) ) /                                                   ');
    SQL.Add('                (count(decode(b.paycl, ''D21'',''1'')) ) * 100,1) "DEPER",                                                                                                          ');
    SQL.Add('                count(decode(substr(b.paycl,1,2), ''D3'',''1'')) "HWON_SA",                                                                                                         ');
    SQL.Add('                count(decode(substr(b.paycl,1,2),''D3'',decode(substr(b.nogubun,1,1),''9'','''',''1''))) "NON_SA",                                                                  ');
    SQL.Add('                count(decode(substr(b.paycl,1,2),''D3'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) "SA",                                              ');
    SQL.Add('                round((count(decode(substr(b.paycl,1,2),''D3'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) ) /                                         ');
    SQL.Add('                (count(decode(substr(b.paycl,1,2), ''D3'',''1'')) ) * 100,1) "SAPER",                                                                                               ');
    SQL.Add('                count(decode(b.paycl, ''D41'',''1'')) "HWON_Ư��",                                                                                                                  ');
    SQL.Add('                count(decode(b.paycl, ''D41'',decode(substr(b.nogubun,1,1),''9'','''',''1''))) "NON_Ư��",                                                                          ');
    SQL.Add('                count(decode(b.paycl, ''D41'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) "Ư��",                                                      ');
    SQL.Add('                round((count(decode(b.paycl, ''D41'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) ) /                                                   ');
    SQL.Add('                (count(decode(b.paycl, ''D41'',''1'')) ) * 100,1) "SPPER",                                                                                                          ');
(*2017.01.10.hjku.. J��� ������ ��� ��ȯ ���� ����.. ��ȿ��M
    SQL.Add('                count(decode(substr(b.empno,1,1), ''M'','''',''J'','''',''P'','''',''Q'','''',''Y'','''',''1'')) "HWON_SO",                                                                   ');
    SQL.Add('                count(decode(substr(b.empno,1,1), ''M'','''',''J'','''',''P'','''',''Q'','''',''Y'','''',decode(substr(b.nogubun,1,1),''9'','''',''1''))) "NON_SO",                           ');
    SQL.Add('                count(decode(substr(b.empno,1,1), ''M'','''',''J'','''',''P'','''',''Q'','''',''Y'','''',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) "SO",       ');
    SQL.Add('                round((count(decode(substr(b.empno,1,1), ''M'','''',''J'','''',''P'','''',''Q'','''',''Y'','''',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) ) /  ');
    SQL.Add('                (count(decode(substr(b.empno,1,1), ''M'','''',''J'','''',''P'','''',''Q'','''',''Y'','''',''1'')) ) * 100,1) "SOPER",                                                         ');
    SQL.Add('                count(decode(substr(b.empno,1,1), ''J'',''1'','''')) "HWON_J",                                                                                                     ');
    SQL.Add('                count(decode(substr(b.empno,1,1), ''P'',''1'',''Q'',''1'','''')) "HWON_PQ",                                                                                        ');
    SQL.Add('                count(decode(substr(b.empno,1,1), ''Y'',''1'','''')) "HWON_Y",                                                                                                     ');
    SQL.Add('                count(decode(substr(b.empno,1,1), ''J'',''1'',''P'',''1'',''Q'',''1'',''Y'',''1'','''')) "HWON_BEALL",                                                             ');

*)
    SQL.Add('                count(decode(FINDHIRE(B.EMPNO), ''M'','''',''J'','''',''P'','''',''Q'','''',''Y'','''',''1'')) "HWON_SO",                                                                   ');
    SQL.Add('                count(decode(FINDHIRE(B.EMPNO), ''M'','''',''J'','''',''P'','''',''Q'','''',''Y'','''',decode(substr(b.nogubun,1,1),''9'','''',''1''))) "NON_SO",                           ');
    SQL.Add('                count(decode(FINDHIRE(B.EMPNO), ''M'','''',''J'','''',''P'','''',''Q'','''',''Y'','''',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) "SO",       ');
    SQL.Add('                round((count(decode(FINDHIRE(B.EMPNO), ''M'','''',''J'','''',''P'','''',''Q'','''',''Y'','''',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) ) /  ');
    SQL.Add('                (count(decode(FINDHIRE(B.EMPNO), ''M'','''',''J'','''',''P'','''',''Q'','''',''Y'','''',''1'')) ) * 100,1) "SOPER",                                                         ');
    SQL.Add('                count(decode(FINDHIRE(B.EMPNO), ''J'',''1'','''')) "HWON_J",                                                                                                     ');
    SQL.Add('                count(decode(FINDHIRE(B.EMPNO), ''P'',''1'',''Q'',''1'','''')) "HWON_PQ",                                                                                        ');
    SQL.Add('                count(decode(FINDHIRE(B.EMPNO), ''Y'',''1'','''')) "HWON_Y",                                                                                                     ');
    SQL.Add('                count(decode(FINDHIRE(B.EMPNO), ''J'',''1'',''P'',''1'',''Q'',''1'',''Y'',''1'','''')) "HWON_BEALL",                                                             ');
    SQL.Add('                count(b.empno) "HWON_ALL"                                                                                                                                          ');
    SQL.Add('         from pimpmas b                                                                                               ');
    SQL.Add('        where b.PSTATE < ''80''                                                '); 
    SQL.Add('         UNION ALL');
    SQL.Add('        SELECT A.DEPTLEVEL,A.DEPTCODE,');
    SQL.Add('               DECODE(A.DEPTLEVEL,''20'','' ''||A.DEPTABBR, ''40'','' ''||A.DEPTABBR, ''A0'','' ''||A.DEPTABBR,');
    SQL.Add('             		       ''B0'',''  ''||A.DEPTABBR,');
    SQL.Add('        			       ''C0'',''    ''||A.DEPTABBR, ''D0'',''      ''||A.DEPTABBR, A.DEPTABBR) DEPTNAME,');
    SQL.Add('               DIRECTOR, HWON_BU, NON_BU, BU, BUPER, HWON_CHA, NON_CHA, CHA, CHPER, HWON_GOA, NON_GOA, GOA, GAPER, ');
    SQL.Add('        	    HWON_DAE, NON_DAE, DAE, DEPER, HWON_SA, NON_SA, SA, SAPER, HWON_Ư��, NON_Ư��, Ư��,  SPPER, ');
    SQL.Add('        	    HWON_SO, NON_SO, SO, SOPER, HWON_J, HWON_PQ, HWON_Y, HWON_BEALL, HWON_ALL');
    SQL.Add('          FROM (select  a.deptlevel, A.DEPTCODE, a.DEPTABBR,');
    SQL.Add('                        count(decode(substr(b.empno,1,1),''M'',''1'')) "DIRECTOR",');
    SQL.Add('                        count(decode(b.paycl, ''C11'',''1'')) "HWON_BU",');
    SQL.Add('                        count(decode(b.paycl, ''C11'',decode(substr(b.nogubun,1,1),''9'','''',''1''))) "NON_BU",');
    SQL.Add('                        count(decode(b.paycl, ''C11'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) "BU",');
    SQL.Add('                        trunc(count(decode(b.paycl, ''C11'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) /');
    SQL.Add('                        (decode( (count(decode(b.paycl, ''C11'',''1''))) , 0,1,(count(decode(b.paycl, ''C11'',''1''))) )) * 100 ,1) "BUPER",');
    SQL.Add('                        count(decode(b.paycl, ''C21'',''1'')) "HWON_CHA",');
    SQL.Add('        	             count(decode(b.paycl, ''C21'',decode(substr(b.nogubun,1,1),''9'','''',''1''))) "NON_CHA",');
    SQL.Add('        	             count(decode(b.paycl, ''C21'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) "CHA",');
    SQL.Add('                        trunc(count(decode(b.paycl, ''C21'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) /');
    SQL.Add('                        (decode( (count(decode(b.paycl, ''C21'',''1''))) , 0,1,(count(decode(b.paycl, ''C21'',''1''))) )) * 100 ,1) "CHPER",');
    SQL.Add('                        count(decode(b.paycl, ''D11'',''1'')) "HWON_GOA",');
    SQL.Add('        	             count(decode(b.paycl, ''D11'',decode(substr(b.nogubun,1,1),''9'','''',''1''))) "NON_GOA",');
    SQL.Add('        	             count(decode(b.paycl, ''D11'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) "GOA",');
    SQL.Add('                        trunc(count(decode(b.paycl, ''D11'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) /');
    SQL.Add('                        (decode( (count(decode(b.paycl, ''D11'',''1''))) , 0,1,(count(decode(b.paycl, ''D11'',''1''))) )) * 100,1) "GAPER",');
    SQL.Add('        	             count(decode(b.paycl, ''D21'',''1'')) "HWON_DAE",');
    SQL.Add('        	             count(decode(b.paycl, ''D21'',decode(substr(b.nogubun,1,1),''9'','''',''1''))) "NON_DAE",');
    SQL.Add('        	             count(decode(b.paycl, ''D21'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) "DAE",');
    SQL.Add('                        trunc(count(decode(b.paycl, ''D21'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) /');
    SQL.Add('                        (decode( (count(decode(b.paycl, ''D21'',''1''))) , 0,1,(count(decode(b.paycl, ''D21'',''1''))) )) * 100,1) "DEPER",');
    SQL.Add('        	             count(decode(substr(b.paycl,1,2), ''D3'',''1'')) "HWON_SA",');
    SQL.Add('        	             count(decode(substr(b.paycl,1,2),''D3'',decode(substr(b.nogubun,1,1),''9'','''',''1''))) "NON_SA",');
    SQL.Add('        	             count(decode(substr(b.paycl,1,2),''D3'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) "SA",');
    SQL.Add('                        trunc(count(decode(substr(b.paycl,1,2), ''D3'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) / ');
    SQL.Add('                        (decode( (count(decode(substr(b.paycl,1,2), ''D3'',''1''))) , 0,1,(count(decode(substr(b.paycl,1,2), ''D3'',''1''))) )) * 100,1)  "SAPER",');
    SQL.Add('                        count(decode(b.paycl, ''D41'',''1'')) "HWON_Ư��",');
    SQL.Add('        	             count(decode(b.paycl, ''D41'',decode(substr(b.nogubun,1,1),''9'','''',''1''))) "NON_Ư��",');
    SQL.Add('        	             count(decode(b.paycl, ''D41'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) "Ư��",');
    SQL.Add('                        trunc(count(decode(b.paycl, ''D41'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) /');
    SQL.Add('                        (decode( (count(decode(b.paycl, ''D41'',''1''))) , 0,1,(count(decode(b.paycl, ''D41'',''1''))) )) * 100,1)  "SPPER",');
(*2017.01.10.hjku.. J��� ������ ��� ��ȯ ���� ����.. ��ȿ��M
    SQL.Add('        	             count(decode(substr(b.empno,1,1), ''M'','''',''J'','''',''P'','''',''Q'','''',''Y'','''',''1'')) "HWON_SO",');
    SQL.Add('        	             count(decode(substr(b.empno,1,1), ''M'','''',''J'','''',''P'','''',''Q'','''',''Y'','''',decode(substr(b.nogubun,1,1),''9'','''',''1''))) "NON_SO",');
    SQL.Add('        	             count(decode(substr(b.empno,1,1), ''M'','''',''J'','''',''P'','''',''Q'','''',''Y'','''',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) "SO",');
    SQL.Add('                        trunc(count(decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'','''')) / --���տ� all ');
    SQL.Add('                        decode(count(b.empno) - count(decode(substr(b.empno,1,1), ''J'',''1'',''P'',''1'',''Q'',''1'',''Y'',''1'','''')),0,1, ');
    SQL.Add('                               count(b.empno) - count(decode(substr(b.empno,1,1), ''J'',''1'',''P'',''1'',''Q'',''1'',''Y'',''1'',''''))) * 100,1)  "SOPER",');
    SQL.Add('                        count(decode(substr(b.empno,1,1), ''J'',''1'','''')) "HWON_J",');
    SQL.Add('        	             count(decode(substr(b.empno,1,1), ''P'',''1'',''Q'',''1'','''')) "HWON_PQ",');
    SQL.Add('        	             count(decode(substr(b.empno,1,1), ''Y'',''1'','''')) "HWON_Y",');
    SQL.Add('        	             count(decode(substr(b.empno,1,1), ''J'',''1'',''P'',''1'',''Q'',''1'',''Y'',''1'','''')) "HWON_BEALL",');
*)
    SQL.Add('        	             count(decode(FINDHIRE(B.EMPNO), ''M'','''',''J'','''',''P'','''',''Q'','''',''Y'','''',''1'')) "HWON_SO",');
    SQL.Add('        	             count(decode(FINDHIRE(B.EMPNO), ''M'','''',''J'','''',''P'','''',''Q'','''',''Y'','''',decode(substr(b.nogubun,1,1),''9'','''',''1''))) "NON_SO",');
    SQL.Add('        	             count(decode(FINDHIRE(B.EMPNO), ''M'','''',''J'','''',''P'','''',''Q'','''',''Y'','''',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) "SO",');
    SQL.Add('                        trunc(count(decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'','''')) / --���տ� all ');
    SQL.Add('                        decode(count(b.empno) - count(decode(FINDHIRE(B.EMPNO), ''J'',''1'',''P'',''1'',''Q'',''1'',''Y'',''1'','''')),0,1, ');
    SQL.Add('                               count(b.empno) - count(decode(FINDHIRE(B.EMPNO), ''J'',''1'',''P'',''1'',''Q'',''1'',''Y'',''1'',''''))) * 100,1)  "SOPER",');
    SQL.Add('                        count(decode(FINDHIRE(B.EMPNO), ''J'',''1'','''')) "HWON_J",');
    SQL.Add('        	             count(decode(FINDHIRE(B.EMPNO), ''P'',''1'',''Q'',''1'','''')) "HWON_PQ",');
    SQL.Add('        	             count(decode(FINDHIRE(B.EMPNO), ''Y'',''1'','''')) "HWON_Y",');
    SQL.Add('        	             count(decode(FINDHIRE(B.EMPNO), ''J'',''1'',''P'',''1'',''Q'',''1'',''Y'',''1'','''')) "HWON_BEALL",');
    SQL.Add('        	             count(b.empno) "HWON_ALL"');
    SQL.Add('                  from pycdept a, pimpmas b                                                                                                   ');
    SQL.Add('                 where a.orgnum =(select value1 from pimvari where gubun=''00'' and sgubun=''0001'')                                          ');
    SQL.Add('                   and a.orgnum    = b.orgnum                                                                                                 ');
    SQL.Add('                   and ((a.deptlevel in (''20'', ''40'', ''A0'', ''B0'') and a.existon =''0'') or a.existon = ''1'')                                                                                             ');
    SQL.Add('                   and a.chanmode <>''3''                                                                                                     ');
    SQL.Add('                   and b.pstate <''80''                                                                                                       ');
    //2017.01.10.hjku.. J��� ������ ��� ��ȯ ���� ����(�μ��ڵ峻 ����'0'�� �ִ� �μ� ������ ����).. ��ȿ��M
    //SQL.Add('                   and substr(a.deptcode,1,(instr(a.deptcode,''0'')-1)) = substr(b.deptcode,1,(instr(a.deptcode,''0'')-1))              ');
    SQL.Add('                   and RTRIM(A.DEPTCODE,''0'') = substr(b.deptcode,1,LENGTH(RTRIM(A.DEPTCODE,''0'')))              ');
    SQL.Add('                 group by a.deptlevel, A.DEPTCODE, a.DEPTABBR 				                                                                                             ');
    SQL.Add('                ) A                                           ');
    SQL.Add('	    )');
    SQL.Add(' order by deptcode    ');
    Open;

    edit1.text := sql.text;

    if Eof then
    begin
      MessageDlg('�����  �����Ͱ� �����ϴ�.'+#13+#10+'', mtError, [mbOK], 0);
      System.Exit;
    end;
  end;
end;

procedure TMainForm.Data_Display2_csv(Sender: TObject);
var
  Fexcel : textfile;
begin
  Application.ProcessMessages;
  assignfile(Fexcel, SaveDialog1.FileName);
  rewrite(Fexcel);
  writeln(Fexcel, ',,,,,,��,��,/,BAND,��,,,��,��,��,,��,Ȳ');
  writeln(Fexcel, '');
  writeln(Fexcel, ',[���س��] ,:, '+copy(Lsysdate.Caption,1,4)+' ��, '+copy(Lsysdate.Caption,6,2)+' ��');
  writeln(Fexcel, '');
  writeln(Fexcel, ',�ӿ�,M2(��å)��,M2(��å)��,M2(��å)��,M2(��å)��,M2(�Ϲ�)��,M2(�Ϲ�)��,M2(�Ϲ�)��,M2(�Ϲ�)��,M1��,M1��,M1��,M1��,Ư��,Ư��,Ư��,Ư��,����,�Ұ�,����,����,����,���,�Ϲ�,�Ұ�,�Ѱ�');
  Data_Display2;
  with OraQuery1 do
  begin
    First;
    while not Eof do
    begin
      P_Help.Caption := '['+FieldByName('deptname').AsString+'] �ٹ��μ��� �ο��� �����մϴ� !!.';
      SendMessage(P_helpinfo.handle,WM_PAINT,0,0);
      writeln(Fexcel,
                     FieldByName('DEPTNAME').AsString       +','+
                     FieldByName('�ӿ�').AsString           +','+
                     FieldByName('M2(��å)_����').AsString      +','+
                     FieldByName('M2(��å)_���Դ��').AsString  +','+
                     FieldByName('M2(��å)_���տ�').AsString    +','+
                     FieldByName('BUPER').AsString          +','+
                     FieldByName('M2(�Ϲ�)_����').AsString      +','+
                     FieldByName('M2(�Ϲ�)_���Դ��').AsString  +','+
                     FieldByName('M2(�Ϲ�)_���տ�').AsString    +','+
                     FieldByName('CHPER').AsString          +','+
                     FieldByName('M1_����').AsString      +','+
                     FieldByName('M1_���Դ��').AsString  +','+
                     FieldByName('M1_���տ�').AsString    +','+
                     FieldByName('GAPER').AsString          +','+
                     {FieldByName('G3_����').AsString      +','+
                     FieldByName('G3_���Դ��').AsString  +','+
                     FieldByName('G3_���տ�').AsString    +','+
                     FieldByName('DEPER').AsString          +','+
                     FieldByName('G2_����').AsString      +','+
                     FieldByName('G2_���Դ��').AsString  +','+
                     FieldByName('G2_���տ�').AsString    +','+
                     FieldByName('SAPER').AsString          +','+}
                     FieldByName('Ư��_����').AsString      +','+
                     FieldByName('Ư��_���Դ��').AsString  +','+
                     FieldByName('Ư��_���տ�').AsString    +','+
                     FieldByName('SPPER').AsString          +','+
                     FieldByName('�Ұ�_����').AsString      +','+
                     FieldByName('�Ұ�_���Դ��').AsString  +','+
                     FieldByName('�Ұ�_���տ�').AsString    +','+
                     FieldByName('SOPER').AsString          +','+
                     FieldByName('����').AsString           +','+
                     FieldByName('���').AsString           +','+
                     FieldByName('�Ϲ�').AsString           +','+
                     FieldByName('��������_�Ұ�').AsString  +','+
                     FieldByName('�Ѱ�').AsString           );
      Next;
    end;
  end;
  closefile(Fexcel);
end;

procedure TMainForm.Data_Display2;
begin
  with OraQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select  DEPTNAME, DIRECTOR �ӿ�,                                                                 ');
    SQL.Add('        HWON_BU "M2(��å)_����", NON_BU "M2(��å)_���Դ��", BU "M2(��å)_���տ�", BUPER,                          ');
    SQL.Add('        HWON_CHA "M2(�Ϲ�)_����", NON_CHA "M2(�Ϲ�)_���Դ��", CHA "M2(�Ϲ�)_���տ�", CHPER,                       ');
    SQL.Add('        HWON_GOA "M1_����", NON_GOA "M1_���Դ��", GOA "M1_���տ�", GAPER,                       ');
    SQL.Add('        HWON_Ư�� Ư��_����, NON_Ư�� Ư��_���Դ��, Ư�� Ư��_���տ�, SPPER,                    ');
    SQL.Add('        HWON_SO �Ұ�_����, NON_SO �Ұ�_���Դ��, SO �Ұ�_���տ�, SOPER,                          ');
    SQL.Add('        HWON_J ����, HWON_PQ ���, HWON_Y �Ϲ�, HWON_BEALL ��������_�Ұ�, ');
    SQL.Add('        HWON_ALL �Ѱ�');
    SQL.Add('   from (                                                                                  ');
    SQL.Add('       select ''A'' DEPTLEVEL, ''0'' DEPTCODE, ''      ��           ��  '' DEPTNAME,     ');
    SQL.Add('                count(decode(substr(b.empno,1,1),''M'',''1'')) DIRECTOR,                   ');
    SQL.Add('                count(decode(b.paycl, ''C31'',''1'')) "HWON_BU",                                                                                                                    ');
    SQL.Add('                count(decode(b.paycl, ''C31'',decode(substr(b.nogubun,1,1),''9'','''',''1''))) "NON_BU",                                                                            ');
    SQL.Add('                round((count(decode(b.paycl, ''C31'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) ) /                                                   ');
    SQL.Add('                (count(decode(b.paycl, ''C31'',''1''))  ) * 100,1) "BUPER",                                                                                                         ');
    SQL.Add('                count(decode(b.paycl, ''C31'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) "BU",                                                        ');
    SQL.Add('                count(decode(b.paycl, ''C33'',''1'')) "HWON_CHA",                                                                                                                   ');
    SQL.Add('                count(decode(b.paycl, ''C33'',decode(substr(b.nogubun,1,1),''9'','''',''1''))) "NON_CHA",                                                                           ');
    SQL.Add('                count(decode(b.paycl, ''C33'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) "CHA",                                                       ');
    SQL.Add('                round((count(decode(b.paycl, ''C33'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) ) /                                                   ');
    SQL.Add('                (count(decode(b.paycl, ''C33'',''1'')) ) * 100,1) "CHPER",                                                                                                          ');
    SQL.Add('                count(decode(b.paycl, ''D10'',''1'')) "HWON_GOA",                                                                                                                   ');
    SQL.Add('                count(decode(b.paycl, ''D10'',decode(substr(b.nogubun,1,1),''9'','''',''1''))) "NON_GOA",                                                                           ');
    SQL.Add('                count(decode(b.paycl, ''D10'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) "GOA",                                                       ');
    SQL.Add('                round((count(decode(b.paycl, ''D10'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) ) /                                                   ');
    SQL.Add('                (count(decode(b.paycl, ''D10'',''1'')) )  * 100,1) "GAPER",                                                                                                         ');
    SQL.Add('                count(decode(b.paycl, ''D41'',''1'')) "HWON_Ư��",                                                                                                                  ');
    SQL.Add('                count(decode(b.paycl, ''D41'',decode(substr(b.nogubun,1,1),''9'','''',''1''))) "NON_Ư��",                                                                          ');
    SQL.Add('                count(decode(b.paycl, ''D41'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) "Ư��",                                                      ');
    SQL.Add('                round((count(decode(b.paycl, ''D41'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) ) /                                                   ');
    SQL.Add('                (count(decode(b.paycl, ''D41'',''1'')) ) * 100,1) "SPPER",                                                                                                          ');
    (*2017.01.10.hjku.. J��� ������ ��� ��ȯ ���� ����.. ��ȿ��M *)
    SQL.Add('                count(decode(FINDHIRE(B.EMPNO), ''M'','''',''J'','''',''P'','''',''Q'','''',''Y'','''',''1'')) "HWON_SO",                                                                   ');
    SQL.Add('                count(decode(FINDHIRE(B.EMPNO), ''M'','''',''J'','''',''P'','''',''Q'','''',''Y'','''',decode(substr(b.nogubun,1,1),''9'','''',''1''))) "NON_SO",                           ');
    SQL.Add('                count(decode(FINDHIRE(B.EMPNO), ''M'','''',''J'','''',''P'','''',''Q'','''',''Y'','''',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) "SO",       ');
    SQL.Add('                round((count(decode(FINDHIRE(B.EMPNO), ''M'','''',''J'','''',''P'','''',''Q'','''',''Y'','''',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) ) /  ');
    SQL.Add('                (count(decode(FINDHIRE(B.EMPNO), ''M'','''',''J'','''',''P'','''',''Q'','''',''Y'','''',''1'')) ) * 100,1) "SOPER",                                                         ');
    SQL.Add('                count(decode(FINDHIRE(B.EMPNO), ''J'',''1'','''')) "HWON_J",                                                                                                     ');
    SQL.Add('                count(decode(FINDHIRE(B.EMPNO), ''P'',''1'',''Q'',''1'','''')) "HWON_PQ",                                                                                        ');
    SQL.Add('                count(decode(FINDHIRE(B.EMPNO), ''Y'',''1'','''')) "HWON_Y",                                                                                                     ');
    SQL.Add('                count(decode(FINDHIRE(B.EMPNO), ''J'',''1'',''P'',''1'',''Q'',''1'',''Y'',''1'','''')) "HWON_BEALL",                                                             ');
    SQL.Add('                count(b.empno) "HWON_ALL"                                                                                                                                          ');
    SQL.Add('         from pimpmas b                                                                                               ');
    SQL.Add('        where b.PSTATE < ''80''                                                '); 
    SQL.Add('         UNION ALL');
    SQL.Add('        SELECT A.DEPTLEVEL,A.DEPTCODE,');
    SQL.Add('               DECODE(A.DEPTLEVEL,''20'','' ''||A.DEPTABBR, ''40'','' ''||A.DEPTABBR, ''A0'','' ''||A.DEPTABBR,');
    SQL.Add('             		       ''B0'',''  ''||A.DEPTABBR,');
    SQL.Add('        			       ''C0'',''    ''||A.DEPTABBR, ''D0'',''      ''||A.DEPTABBR, A.DEPTABBR) DEPTNAME,');
    SQL.Add('               DIRECTOR, HWON_BU, NON_BU, BU, BUPER, HWON_CHA, NON_CHA, CHA, CHPER, HWON_GOA, NON_GOA, GOA, GAPER, ');
    SQL.Add('        	    HWON_Ư��, NON_Ư��, Ư��,  SPPER, ');
    SQL.Add('        	    HWON_SO, NON_SO, SO, SOPER, HWON_J, HWON_PQ, HWON_Y, HWON_BEALL, HWON_ALL');
    SQL.Add('          FROM (select  a.deptlevel, A.DEPTCODE, a.DEPTABBR,');
    SQL.Add('                        count(decode(substr(b.empno,1,1),''M'',''1'')) "DIRECTOR",');
    SQL.Add('                        count(decode(b.paycl, ''C31'',''1'')) "HWON_BU",');
    SQL.Add('                        count(decode(b.paycl, ''C31'',decode(substr(b.nogubun,1,1),''9'','''',''1''))) "NON_BU",');
    SQL.Add('                        count(decode(b.paycl, ''C31'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) "BU",');
    SQL.Add('                        trunc(count(decode(b.paycl, ''C31'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) /');
    SQL.Add('                        (decode( (count(decode(b.paycl, ''C31'',''1''))) , 0,1,(count(decode(b.paycl, ''C11'',''1''))) )) * 100 ,1) "BUPER",');
    SQL.Add('                        count(decode(b.paycl, ''C33'',''1'')) "HWON_CHA",');
    SQL.Add('        	             count(decode(b.paycl, ''C33'',decode(substr(b.nogubun,1,1),''9'','''',''1''))) "NON_CHA",');
    SQL.Add('        	             count(decode(b.paycl, ''C33'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) "CHA",');
    SQL.Add('                        trunc(count(decode(b.paycl, ''C33'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) /');
    SQL.Add('                        (decode( (count(decode(b.paycl, ''C33'',''1''))) , 0,1,(count(decode(b.paycl, ''C21'',''1''))) )) * 100 ,1) "CHPER",');
    SQL.Add('                        count(decode(b.paycl, ''D10'',''1'')) "HWON_GOA",');
    SQL.Add('        	             count(decode(b.paycl, ''D10'',decode(substr(b.nogubun,1,1),''9'','''',''1''))) "NON_GOA",');
    SQL.Add('        	             count(decode(b.paycl, ''D10'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) "GOA",');
    SQL.Add('                        trunc(count(decode(b.paycl, ''D10'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) /');
    SQL.Add('                        (decode( (count(decode(b.paycl, ''D10'',''1''))) , 0,1,(count(decode(b.paycl, ''D11'',''1''))) )) * 100,1) "GAPER",');
    SQL.Add('                        count(decode(b.paycl, ''D41'',''1'')) "HWON_Ư��",');
    SQL.Add('        	             count(decode(b.paycl, ''D41'',decode(substr(b.nogubun,1,1),''9'','''',''1''))) "NON_Ư��",');
    SQL.Add('        	             count(decode(b.paycl, ''D41'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) "Ư��",');
    SQL.Add('                        trunc(count(decode(b.paycl, ''D41'',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) /');
    SQL.Add('                        (decode( (count(decode(b.paycl, ''D41'',''1''))) , 0,1,(count(decode(b.paycl, ''D41'',''1''))) )) * 100,1)  "SPPER",');
    SQL.Add('        	             count(decode(FINDHIRE(B.EMPNO), ''M'','''',''J'','''',''P'','''',''Q'','''',''Y'','''',''1'')) "HWON_SO",');
    SQL.Add('        	             count(decode(FINDHIRE(B.EMPNO), ''M'','''',''J'','''',''P'','''',''Q'','''',''Y'','''',decode(substr(b.nogubun,1,1),''9'','''',''1''))) "NON_SO",');
    SQL.Add('        	             count(decode(FINDHIRE(B.EMPNO), ''M'','''',''J'','''',''P'','''',''Q'','''',''Y'','''',decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'',''''))) "SO",');
    SQL.Add('                        trunc(count(decode(substr(b.nogubun,1,1),''3'',''1'',''4'',''1'',''5'',''1'','''')) / --���տ� all ');
    SQL.Add('                        decode(count(b.empno) - count(decode(FINDHIRE(B.EMPNO), ''J'',''1'',''P'',''1'',''Q'',''1'',''Y'',''1'','''')),0,1, ');
    SQL.Add('                               count(b.empno) - count(decode(FINDHIRE(B.EMPNO), ''J'',''1'',''P'',''1'',''Q'',''1'',''Y'',''1'',''''))) * 100,1)  "SOPER",');
    SQL.Add('                        count(decode(FINDHIRE(B.EMPNO), ''J'',''1'','''')) "HWON_J",');
    SQL.Add('        	             count(decode(FINDHIRE(B.EMPNO), ''P'',''1'',''Q'',''1'','''')) "HWON_PQ",');
    SQL.Add('        	             count(decode(FINDHIRE(B.EMPNO), ''Y'',''1'','''')) "HWON_Y",');
    SQL.Add('        	             count(decode(FINDHIRE(B.EMPNO), ''J'',''1'',''P'',''1'',''Q'',''1'',''Y'',''1'','''')) "HWON_BEALL",');
    SQL.Add('        	             count(b.empno) "HWON_ALL"');
    SQL.Add('                  from pycdept a, pimpmas b                                                                                                   ');
    SQL.Add('                 where a.orgnum =(select value1 from pimvari where gubun=''00'' and sgubun=''0001'')                                          ');
    SQL.Add('                   and a.orgnum    = b.orgnum                                                                                                 ');
    SQL.Add('                   and ((a.deptlevel in (''20'', ''40'', ''A0'', ''B0'') and a.existon =''0'') or a.existon = ''1'')                                                                                             ');
    SQL.Add('                   and a.chanmode <>''3''                                                                                                     ');
    SQL.Add('                   and b.pstate <''80''                                                                                                       ');
    //2017.01.10.hjku.. J��� ������ ��� ��ȯ ���� ����(�μ��ڵ峻 ����'0'�� �ִ� �μ� ������ ����).. ��ȿ��M
    SQL.Add('                   and RTRIM(A.DEPTCODE,''0'') = substr(b.deptcode,1,LENGTH(RTRIM(A.DEPTCODE,''0'')))              ');
    SQL.Add('                 group by a.deptlevel, A.DEPTCODE, a.DEPTABBR 				                                                                                             ');
    SQL.Add('                ) A                                           ');
    SQL.Add('	    )');
    SQL.Add(' order by deptcode    ');
    Open;

    edit1.text := sql.text;

    if Eof then
    begin
      MessageDlg('�����  �����Ͱ� �����ϴ�.'+#13+#10+'', mtError, [mbOK], 0);
      System.Exit;
    end;
  end;
end;

end.

