unit PSC10501;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ComCtrls, Db, Tmax_DataSetText, TmaxFunc,
  OnEditBaseCtrl, OnEditStdCtrl, OnEditNumCtl, Grids, DBGrids, OnGrDBGrid,
  OnLineLabel, OnInsaCommon, OnEditBtnCtrl, OnTmaxPersonEdit, OnDBGrid, OnEditMemo,
  OnScheme, OnShapeLabel, OnFocusButton, Tmax_session,  OnPopupEdit, Func;

type
    TFM_Main = class(TForm)
    Panel_Body: TPanel;
    SF_Main: TOnSchemeForm;
    OnShapeLabel2: TOnShapeLabel;
    StatusBar1: TStatusBar;
    Panel_Button: TPanel;
    BB_Close: TOnFocusButton;
    Edit1: TEdit;
    TMaxDataSet1: TTMaxDataSet;
    TMaxSession: TTMaxSession;
    BB_Save: TOnFocusButton;
    TDS_dml1: TTMaxDataSet;
    DbGrid1: TOnGrDbGrid;
    OnShapeLabel1: TOnShapeLabel;
    TMaxGrid1: TTMaxDataSet;
    DataSource1: TDataSource;
    OnShapeLabel3: TOnShapeLabel;
    TMaxGrid2: TTMaxDataSet;
    DataSource2: TDataSource;
    DbGrid2: TOnGrDbGrid;
    BB_NumShow: TOnFocusButton;
    ED_EmpNo: TTMaxPersonPopupEdit;
    P_telno: TOnEdit;
    P_email: TOnEdit;
    E_zipno_old: TOnWinPopupEdit;
    P_Retcont: TOnEdit;
    P_addr: TOnEdit;
    P_empdate: TOnMaskEdit;
    P_retdate: TOnMaskEdit;
    P_pstate: TOnEdit;
    P_payra: TOnEdit;
    Label1: TLabel;
    E_zipno: TOnEdit;
    procedure BB_CloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ED_EmpNoReadEnded(Sender: TObject);
    procedure BB_SaveClick(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure ED_EmpNoKeyPress(Sender: TObject; var Key: Char);
    procedure E_zipno_oldCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure E_zipno_oldInitPopup(Sender: TObject);
    procedure BB_NumShowClick(Sender: TObject);
    procedure P_addrClick(Sender: TObject);
    procedure P_addrExit(Sender: TObject);
    procedure E_zipnoExit(Sender: TObject);

  private
    { Private declarations }
    SqlStr    : String;

  public
    { Public declarations }
    Tmpaddr, Tmpfulladdr      : string;
    Tmpaddrlen   : integer;
    Empno        : String[04];   { ���     }
    vGrade       : String[10];   { ����� }

    procedure PL_Select_Data;
    procedure RetrieveData;

  end;

var
  FM_Main: TFM_Main;

implementation

uses PSC10502, PSC10503;

{$R *.DFM}


procedure TFM_Main.BB_CloseClick(Sender: TObject);
begin
     Close;
end;

procedure TFM_Main.FormCreate(Sender: TObject);
begin
  Self.OnPaint := Nil;
  Application.ProcessMessages;
  SF_Main.Refresh;
  StatusBar1.Panels[1].Text := '�����λ� �ý��ۿ� ���� ���Դϴ�...';

  TMaxSession.EnvFileName := GetHomeDir+'\newhana.env'; //FL_File+'\newhana.env';
  TMaxSession.LabelName   := 'HANAROHPER';
  TMaxSession.Connect     := False;
  TMaxSession.Host        := Hinsa_Param(cmdline,10);
  TMaxSession.Port        := '9999';

  try
    TMaxSession.Connect := True;
  except
    //Application.MessageBox(PChar('APP���� ���� ����'),'����',mb_ok);
    ShowMessage(TMaxSession.HeaderPacket.ErrorCode + #13 + #13 +
                TMaxSession.HeaderPacket.ErrorMsg  + #13 + #13 +
                '�����ڿ��� �����Ͻʽÿ�.');
    Application.Terminate;
    Exit;
  end;

  //2013.11. Add �Ķ���Ϳ� ���Ͽ� ��ȣ �ٸ��� ���� ����.
  FM_Tmax := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := TMaxSession;
  if FM_Tmax.PassWordChk(Hinsa_Param(cmdline,1), Hinsa_Param(cmdline,3)) = 0 then
    Application.Terminate;
end;

procedure TFM_Main.FormShow(Sender: TObject);
begin
  Empno    := HInsa_Param(cmdline,1);
  vGrade   := Hinsa_Param(cmdLine,4);

  StatusBar1.Panels[1].Text := '�ʱ��ڷḦ �����ϰ� �ֽ��ϴ�. ��ø� ��ٷ� �ֽʽÿ�..';

  ED_empno.Text  := Empno;
  ED_EmpNo.PL_get_singledata;

  ED_EmpNo.Enabled  := False;
  BB_Save.Visible   := False;
  if vGrade[4] <= 'C' then
  begin
       ED_EmpNo.Enabled  := True;
       P_telno.Enabled   := True;
       P_Retcont.Enabled := True;
       P_email.Enabled   := True;
       E_zipno.Enabled   := True;
       P_addr.Enabled    := True;
       BB_Save.Visible   := True;
  end;

  PL_Select_Data;

  ED_empno.Text  := Empno + ' - ' + ED_empno.korname;

  RetrieveData;
end;

procedure TFM_Main.PL_Select_Data;
begin
  with TMaxDataSet1 do
  begin
       Close;
       Sql.Clear;
       Sql.Text := Format( 'select empno,      '+
                           '       korname,    '+
                           '       payra,      '+
                           '       pstate,     '+
                           '       telno,      '+
                           '       retcont,    '+
                           '       e_mail,     '+
                           '       empdate,    '+
                           '       retdate,    '+
                           '       curaddr,    '+
                           '       zipno,      '+
                           '       deptname,   '+
                           '       juminid     '+
                           '  from v_pstockinsa'+
                           ' where empno = ''%s'' ',[ED_EmpNo.empno]);

       //���񽺻�� ���α׷� : PSC1040C PSC1060A PSC1070A
       ServiceName := 'PSC1040C_sel1';    //server Name : htmax_ps11.
       ClearFieldInfo;
       AddField('EMPNO'  , ftString, 4);
       AddField('KORNAME', ftString, 12);
       AddField('PAYRA'  , ftString, 20);
       AddField('PSTATE' , ftString, 20);
       AddField('TELNO'  , ftString, 15);
       AddField('RETCONT', ftString, 40);
       AddField('E_MAIL' , ftString, 60);
       AddField('EMPDATE', ftString, 8);
       AddField('RETDATE', ftString, 8);
       AddField('CURADDR', ftString, 80);
       AddField('ZIPNO'  , ftString, 7);
       AddField('DEPTNAME',ftString, 60);
       AddField('JUMINID', ftString, 14);   edit1.text := sql.text;
       open;

       Hinsa_FieldDisplay(Self,TMaxDataSet1,4,11);
       P_payra.Text   := FieldByName('PAYRA').AsString;
       P_pstate.Text  := FieldByName('PSTATE').AsString;
       P_telno.Text   := FieldByName('telno').AsString;
       P_RETCONT.Text := FieldByName('RETCONT').AsString;
       P_email.Text   := FieldByName('e_mail').AsString;
       P_addr.Text    := FieldByName('curaddr').AsString;
       E_zipno.Text   := FieldByName('zipno').AsString;
       P_empdate.Text := Hinsa_DisplayDate(FieldByName('empdate').AsString,'-');
       P_retdate.Text := Hinsa_DisplayDate(FieldByName('retdate').AsString,'-');
       Close;

       Tmpfulladdr    := P_addr.Text;

       StatusBar1.Panels[1].Text := ED_empno.korname + '���� �ڷᰡ ��µǾ����ϴ�.';
  end;
end;


procedure TFM_Main.ED_EmpNoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
       ED_empno.PL_get_singledata;
  end;
end;           

procedure TFM_Main.ED_EmpNoReadEnded(Sender: TObject);
begin
  PL_Select_Data;

  RetrieveData;
end;

procedure TFM_Main.BB_SaveClick(Sender: TObject);
begin
  StatusBar1.Panels[1].Text := '';
  if Application.MessageBox('�����ڷḦ �����Ͻðڽ��ϱ�?','�۾��ȳ�',mb_yesno) = id_no then System.exit;

  sqlstr := 'update pimpmas            '                   + #13 +
     format('   set telno    = ''%s'', ',[P_telno.text])   + #13 +
     format('       RETCONT  = ''%s'', ',[P_RETCONT.text]) + #13 +
     format('       e_mail   = ''%s'', ',[P_email.text])   + #13 +
     format('       zipno    = ''%s'', ',[E_zipno.text])   + #13 +
     format('       curaddr  = ''%s''  ',[P_addr.text])    + #13 +
     Format(' where empno    = ''%s''  ',[ED_empno.empno]) ;

  with TMaxDataSet1 do
  begin
       ServiceName := 'PSC1040C_dml';
       Close;
       Sql.Clear;
       Sql.Add(sqlstr);  edit1.Text := sql.Text;

       if not TMaxDataSet1.Execute then
       begin
            ShowMessage('������ ������ �߻��߽��ϴ�.');
            System.Exit;
       end
       else ShowMessage('���������� �Ϸ�Ǿ����ϴ�.');
  end;

  Application.ProcessMessages;
end;

procedure TFM_Main.RetrieveData;
var
  ParamSQL : String;
  i : integer;
begin
  Application.ProcessMessages;
  TMaxGrid1.Close;

  //2007.03.29 ������ pstockmas ���� �ҷ����� ��Ÿ��������� PSTOCKDET�� �ʵ带 �߰��Ͽ�  PSTOCKDET���� �ҷ������� ����
  //������� ��Ÿ������� ������ �޶�  PSTOCKDET�� �ʵ� �߰�(8��)
     ParamSQL := Format( 'select distinct a.stocknum      ,'+
                         '       a.subnum                 ,'+
                         '       a.givedate               ,'+
                         '       sum(b.stcnt) stcnt       ,'+
                         '       a.saveamt                ,'+
                         '       a.savedate               ,'+
                         '       a.savemark               ,'+
                         '       a.saveterm                '+
                         '  from pstockmas a, pstockdet b  '+
                         ' where a.stocknum = b.stocknum   '+
                         '   and a.subnum   = b.subnum     '+
                         '   and b.empno    = ''%s''       '+
                         ' group by a.stocknum, a.subnum,  '+
                         '          a.givedate,            '+
                         '          a.saveamt,  a.savedate,'+
                         '          a.savemark, a.saveterm '+
                         ' order by a.stocknum             ',[ED_EmpNo.empno]);

  with TMaxGrid1 do
  begin
       ServiceName :='PSC1040C_sel2';  //server Name : htmax_ps11.
       Close;
       Sql.Clear;
       Sql.Add(ParamSQL);

       ClearFieldInfo;
       AddField('STOCKNUM', ftString, 2);
       AddField('SUBNUM'  , ftString, 2);
       AddField('GIVEDATE', ftString, 10);
       AddField('STCNT'   , ftFloat,  15);
       AddField('SAVEAMT' , ftFloat,  15);
       AddField('SAVEDATE', ftString, 25);
       AddField('SAVEMARK', ftString, 50);
       AddField('SAVETERM', ftString, 100);      edit1.Text := sql.Text;
       Open;

       FieldByName('STOCKNUM').Alignment := taCenter;
       FieldByName('SUBNUM').Alignment   := taCenter;       
       FieldByName('GIVEDATE').Alignment := taCenter;
       FieldByName('SAVEDATE').Alignment := taCenter;
       TFloatField(FieldByName('STCNT')).DisplayFormat   := '#,##0';
       TFloatField(FieldByName('SAVEAMT')).DisplayFormat := '#,##0';

       {E_Stocknum.Text := '';
       i := 1;
       while not EOF do
       begin
            if   i = 1 then E_Stocknum.Text := FieldByName('STOCKNUM').Asstring
            else            E_Stocknum.Text := E_Stocknum.Text +  ', ' + FieldByName('STOCKNUM').Asstring ;

            inc(i);
            Next;
       end;
       TMaxGrid1.First;}
  end;

  StatusBar1.Panels[1].Text := ED_empno.korname + '���� �ڷᰡ ��µǾ����ϴ�.';
end;

procedure TFM_Main.DataSource1DataChange(Sender: TObject; Field: TField);
var
  ParamVariant2 : String;
begin
  Application.ProcessMessages;
  TMaxGrid2.Close;

  ParamVariant2 := format(
                   'SELECT  b.stocknum, b.DETDATE, b.GUBUN, b.STCNT, b.SAVEAMT, b.OWSTCNT, b.BASIS, b.REMARK   '+
                   '  FROM  pstockmas A, PSTOCKDET b                                                           '+
                   ' WHERE  a.STOCKNUM = b.STOCKNUM                                                            '+
                   '   and  b.empno = ''%s''                                                                   '+
                   '   and  a.subnum = b.subnum                                                                '+
                   '   and  a.stocknum in ''%s''                                                               '+
                   ' ORDER BY a.STOCKNUM, b.seqno ',[ED_empno.empno, TMaxGrid1.FieldByName('STOCKNUM').AsString]);

  with TMaxGrid2 do
  begin
       ServiceName :='PSC1040C_sel3';
       Close;
       Sql.Clear;
       Sql.Add(ParamVariant2);                  // edit3.Text := sql.Text;

       ClearFieldInfo;
       AddField('STOCKNUM', ftString, 2);
       AddField('DETDATE' , ftString, 10);
       AddField('GUBUN'   , ftString, 4);
       AddField('STCNT'   , ftFloat, 15);
       AddField('SAVEAMT' , ftFloat, 15);
       AddField('OWSTCNT' , ftFloat, 15);
       AddField('BASIS'   , ftString, 20);
       AddField('REMARK'  , ftString, 50);
       Open;

       FieldByName('STOCKNUM').Alignment := taCenter;
       FieldByName('DETDATE').Alignment  := taCenter;
       FieldByName('GUBUN').Alignment    := taCenter;
       TFloatField(FieldByName('STCNT')).DisplayFormat := '#,##0';
       TFloatField(FieldByName('SAVEAMT')).DisplayFormat := '#,##0';
       TFloatField(FieldByName('OWSTCNT')).DisplayFormat := '#,##0';
  end;
end;

procedure TFM_Main.E_zipno_oldCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
{ 2015.02.03 ������ȣ ���� ��� ����. dsa2000  CSR��û��  ���ּ� ���Կ� ���� ���α׷� ���� ��
  Tmpaddr            := '';
  Tmpaddrlen         := 0;

  if ZipForm.Zipno <> '' then
  begin
       E_zipno.Text  := Copy(ZipForm.ZipNo,1,3)+'-'+Copy(ZipForm.ZipNo,4,3);
       P_addr.Text   := ZipForm.Addr;
       Tmpaddr       := ZipForm.Addr;
       Tmpaddrlen    := Length(ZipForm.Addr);
       P_addr.SetFocus;
  end;}
end;

procedure TFM_Main.E_zipno_oldInitPopup(Sender: TObject);
begin
{ 2015.02.03 ������ȣ ���� ��� ����. dsa2000     CSR��û��  ���ּ� ���Կ� ���� ���α׷� ���� ��
  ZipForm.Edit         := TOnWinPopupEdit(Sender);
  ZipForm.E_Cond.Text  := Trim(Copy(E_zipno.Text,1,3) + Copy(E_zipno.Text,5,3));
  TOnWinPopupEdit(Sender).PopupControl := ZipForm ;}
end;

// 2006.07.28 �ŵ��� ����� ��û���� �����ڸ�� �ּ��Է� ����
procedure TFM_Main.P_addrClick(Sender: TObject);
begin
{   if (Tmpaddr<>'') and (Copy(P_addr.Text,1,Tmpaddrlen) <> Tmpaddr) then
      begin
         Application.Messagebox('������ȣ�� ���� �⺻�ּҴ� ������ �� �����ϴ�','�۾��ȳ�',mb_ok+ mb_IconStop);
         P_addr.Text := Tmpaddr;
         P_addr.SetFocus;
      end
   else if (Tmpaddr='') and (Tmpfulladdr <> P_addr.Text ) then
      begin
         Application.Messagebox('�ּ� �������� �Ұ����մϴ�. ������ȣ ��ư�� �̿��� �ּ���.','�۾��ȳ�',mb_ok+ mb_IconStop);
         P_addr.Text := Tmpfulladdr;
         ED_zipno.SetFocus;
      end;   }
end;

procedure TFM_Main.P_addrExit(Sender: TObject);
begin
{   if (Tmpaddr<>'') and (Copy(P_addr.Text,1,Tmpaddrlen) <> Tmpaddr) then
      begin
         Application.Messagebox('������ȣ�� ���� �⺻�ּҴ� ������ �� �����ϴ�','�۾��ȳ�',mb_ok+ mb_IconStop);
         P_addr.Text := Tmpaddr;
         P_addr.SetFocus;
      end
   else if (Tmpaddr='') and (Tmpfulladdr <> P_addr.Text ) then
      begin
         Application.Messagebox('�ּ� �������� �Ұ����մϴ�. ������ȣ ��ư�� �̿��� �ּ���.','�۾��ȳ�',mb_ok+ mb_IconStop);
         P_addr.Text := Tmpfulladdr;
         ED_zipno.SetFocus;
      end;      }
end;

procedure TFM_Main.BB_NumShowClick(Sender: TObject);
begin
  SepForm := TSepForm.Create(nil);
  SepForm.ShowModal;
  SepForm.Free;
end;

procedure TFM_Main.E_zipnoExit(Sender: TObject);
begin
  //2015.02.03  ���ڸ� �Է���� �ݿ�. dsa2000     CSR��û��  ���ּ� ���Կ� ���� ���α׷� ���� ��
  if not IsNumber(E_zipno.Text) then
  begin
       ShowMessage('������ȣ�� ���ڸ� �Է��ϼ���');
       E_zipno.Text := ReMoveChar(E_zipno.Text,'-'); 
  end;
end;

end.