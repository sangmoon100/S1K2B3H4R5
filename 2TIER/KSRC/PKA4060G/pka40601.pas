{===================== Program Header ==========================================
 PROGRAM-NAME   : PKA4060G(���� ���� �� ����)
 SYSTEM-NAME    : �޿�
 SUBSYSTEM-NAME : ����
 Programmer     : ����ȯ
 Version        : 10.00
 Date           : 1997.12.01
                                                    
Update Contents
   Version    date(yy.mm.dd)     programmer      description     relevant doc.no
   10.00       1997.12.01         ����ȯ          ���ʰ��ߺ�      �������
   20.00       2004.11.01         ������(dsa2000)              Rexec ��ü���� �����Ͽ� �����۾���.(���ȹ�����)
================================================================================}
unit pka40601;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, DB, DBTables, StdCtrls, Buttons, Mask, ExtCtrls,
  Kylib1, Calen1, Gauges, Tmax_session, Tmax_DataSetText, OnInsaCommon, Ora,
  TmaxFunc, Func, KeyEmpno, KeyEmpnoY, Pass;

type
  TFpka40601 = class(TForm)
    Phelpmsg: TPanel;
    Panel19: TPanel;
    Lempno: TLabel;
    Lsysdate: TLabel;
    Panel3: TPanel;
    BBclose: TBitBtn;
    BBrun: TBitBtn;
    Panel2: TPanel;
    Panel4: TPanel;
    MEworkdate: TMaskEdit;
    Panel1: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Label1: TLabel;
    Panel7: TPanel;
    maintitle: TPanel;
    Panel8: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Panel10: TPanel;
    Panel11: TPanel;
    CBendyn: TComboBox;
    CByearyn: TComboBox;
    BBcancel: TBitBtn;
    TDS_batch: TTMaxDataSet;
    TMaxSession: TTMaxSession;
    MMLog: TMemo;
    Label5: TLabel;
    Panel12: TPanel;
    E_empnoFROM: TEdit;
    SB_empnoFROM: TSpeedButton;
    P_kornameFROM: TPanel;
    Label6: TLabel;
    E_empnoTO: TEdit;
    SB_empnoTO: TSpeedButton;
    P_kornameTO: TPanel;
    C_Gubun: TComboBox;
    Panel9: TPanel;
    procedure BBrunClick(Sender: TObject);
    procedure BBcloseClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure CBendynChange(Sender: TObject);
    procedure CBendynDblClick(Sender: TObject);
    procedure CByearynChange(Sender: TObject);
    procedure CByearynDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SB_empnoFROMClick(Sender: TObject);
    procedure SB_empnoTOClick(Sender: TObject);
    procedure E_empnoExit(Sender: TObject);
    procedure C_GubunChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    YmanagerYN : boolean;
  public
    { Public declarations }
    procedure Work_Setup;    //�Ϲ��������� ���п����� ȯ�漳��
  end;

var
  Fpka40601: TFpka40601;

implementation

uses pka40602;

{$R *.DFM}


{-------------------------------- User Define----------------------------------}

procedure TFpka40601.Work_Setup;
var
     qq : TOraQuery;
begin
     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     Try
          with qq do
          begin
               SQL.Clear;
               Close;
               if YmanagerYN then //�Ϲ��� �������ϰ��.
                    SQL.Add('select to_char(add_months(to_date(y_knteyymm, ''YYYYMM''), 1), ''YYYYMM'') knteyymm ')
               else SQL.Add('select to_char(add_months(to_date(knteyymm,   ''YYYYMM''), 1), ''YYYYMM'') knteyymm ');
               SQL.Add('  from pkcpbas ');
               Open;

               MEworkdate.Text := FieldByName('knteyymm').AsString; // ���� ������
               BBcancel.Enabled := False;
          end
     Finally
          qq.Free;
     end;

     //2016.03.18 eyha �Ʒ����� ó���ʿ� ���� ����
     {P_kornameFROM.Caption := '';
     P_kornameTO.Caption   := '';
     if not(YmanagerYN) then   
     begin
          E_empnoFROM.Text := '0000';
          E_empnoTO.Text   := 'XXXX';
     end
     else
     begin
          E_empnoFROM.Text := 'Y000';
          E_empnoTO.Text   := 'YZZZ';
     end;      }

end;

{-------------------------------- MAIN ----------------------------------------}

procedure TFpka40601.FormCreate(Sender: TObject);
begin
     OraConnect;

     //2016.06.10 eyha TMax ���� ���α׷� ����
     TMaxSession.ServiceTimeOut := 1000;
     TMaxSession.Connect        := False;
     TMaxSession.EnvFileName    := GetHomeDir+'\newhana.env';
     TMaxSession.LabelName      := 'HANAROHPER';
//     TMaxSession.EnvFileName    := 'D:\SK_WORK\1. src\newhana.env'; //for test by ������


     try
          TMaxSession.Connect := True;
          TMaxSession.TMax_Begin(5000);
     except
          Application.MessageBox(PChar('APP���� ���� ����'),'����',mb_ok);
          Application.Terminate;
          Exit;
     end;
end;

procedure TFpka40601.BBrunClick(Sender: TObject);
var
     totno : integer;
     Tem_end ,Tem_year ,TmpStr : String;
     Rundate,  ProgId,  CmdStr : String;  //���� ����...
     qq : TOraQuery;
begin
     //2016.03.18 eyha �������� ���ýÿ��� ��������, �İ����� ���ýÿ��� �İ����� ó�������ϵ��� üũ��� �߰�
     if C_Gubun.ItemIndex = 0  then
     begin
        if ((Copy(E_empnoFROM.Text,1,1) = 'Y') or (Copy(E_empnoTO.Text,1,1) = 'Y')) then
        begin
          Application.MessageBox('������ ��忡���� �İ��� ����� ������ �� �����ϴ�....','�۾��ȳ�', mb_OK);
          E_empnoFROM.SetFocus;
          exit;
        end;
     end
     else
     begin
        if ((Copy(E_empnoFROM.Text,1,1) <> 'Y') or (Copy(E_empnoTO.Text,1,1) <> 'Y')) then
        begin
          Application.MessageBox('�İ��� ��忡���� ������ ����� ������ �� �����ϴ�....','�۾��ȳ�', mb_OK);
          E_empnoFROM.SetFocus;
          exit;
        end;
     end;


     if fn_IsDate(MEworkdate.Text+'01') = False then
     begin
          Application.MessageBox('�۾����س���� ��Ȯ�� �Է��ϼ���....','�۾��ȳ�', mb_OK);
          MEworkdate.SetFocus;
          exit;
     end;

     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     Try
          with qq do
          begin
               Close;
               SQL.Clear;
               SQL.Add('select 1                                   ');
               SQL.Add('  from pkhduty                             '); // ���³���
               Sql.Add(' Where duyymm = :duyymm                    ');
               SQL.Add('   and empno between :frEmpno and :toEmpno ');
               ParamByName('duyymm').AsString  := MEworkdate.Text;
               ParamByName('frEmpno').AsString := E_empnoFROM.Text;
               ParamByName('toEmpno').AsString := E_empnoTO.Text;
               Open;

               if RecordCount = 0 then
               begin
                    Application.MessageBox('�۾������ �۾�����ڰ� �����ϴ�....','�۾��ȳ�', mb_OK);
                    MEworkdate.SetFocus;
                    exit;
               end;

               if CBendyn.Text  = 'Y' then Tem_end  :=' ���� ����,'
               else                        Tem_end  :=' ����' ;

               if CByearyn.Text = 'Y' then Tem_year :=' �Ⱓ ����,'
               else                        Tem_year :='' ;

               Phelpmsg.caption := Tem_end +Tem_year + ' ���� ���� �۾��� .. ';

               BBrun.Enabled    := False;
               BBclose.Enabled  := False;
               BBcancel.Enabled := True;


               //2004.11. Rexec ��ü���� �����Ͽ� �����۾���.(���ȹ�����)
               MMLog.Clear;
               MMLog.Lines.Add('������...');

               ///////////////////////////////////////////////////////////////////////
               FM_Tmax           := TFM_Tmax.Create(Self);
               FM_Tmax.T_Session := TMaxSession;
               Rundate           := Copy(FM_Tmax.GetData('sysdate','',''),1,14);

               ProgId   := 'pka4060g';
               CmdStr   := '/hper/insa/HINSA/proc/bin/Kbin/pka4060g ' + MEworkdate.Text + ' ' + CBendyn.Text + ' ' +
                            CByearyn.Text + ' ' + Pempno + ' ' + ProgId + ' ' + Rundate + ' ' +
                            Trim(E_empnoFROM.Text) + ' ' + Trim(E_empnoTO.Text);

               Application.ProcessMessages;
          end;
     Finally
          qq.Free;
     end;

     //dsa2000  End  Rexec ��ü���񽺷� ���� ........................................
     with TDS_batch do
     begin
          Close;
          ServiceName := 'HINSA_batch';
          ClearFieldInfo;
          ClearParamInfo;
          AddParam('cmdstr', 300, CmdStr);
          Execute;

          Close;
          ServiceName := 'SHR0SSEL';
          ClearFieldInfo;
          ClearParamInfo;
          AddField('RESULT', ftString, 5000);
          Sql.Text := Format('select result from pybatlog  '+
                             ' where rundate = ''%s''      '+
                             '   and progid  = ''%s''      '+
                             ' order by to_number(seqno)   ',[Rundate, ProgId]);
          Open;

          MMlog.Clear;

          while not eof do
          begin
               MMlog.Lines.Add(FieldByName('result').AsString);
               Next;
          end;
     end;


     //2016.10.10 eyha ���¸����� ������/�İ��� ���ÿ� �������ϰ��  pka4060g.pc���� ���������θ� ������ �� ������  �߰�ó��(YManager ������ ������ �İ������� Y_KNTEYYMM ���ŵ�
     if  (CBendyn.Text ='Y') and (Pos('OK', MMlog.Text) > 0) then
     begin
       qq := TOraQuery.Create(nil);
       qq.Session := Ora_Session;

       Try
          with qq do
          begin
               Close;
               SQL.Clear;
               SQL.Add('UPDATE  PKCPBAS                            ');
               if  C_Gubun.ItemIndex = 0 then
                 SQL.Add('   SET  knteyymm = :workyymm             ')
               else
                 SQL.Add('   SET  Y_KNTEYYMM = :workyymm           ');

               ParamByName('workyymm').AsString  := MEworkdate.Text;
               Execsql;
          end;
       Finally
          qq.Free;
       end;
     end;



     if Pos('OK', MMlog.Text) > 0 then Phelpmsg.caption := ' ���� ������ �����۾� �Ϸ�'
     else                              Phelpmsg.caption := ' ���� ������ �����۾� ����';

     BBrun.Enabled    := True;
     BBclose.Enabled  := True;
     BBcancel.Enabled := False;
end;


{����}
procedure TFpka40601.BBcloseClick(Sender: TObject);
begin
     Close;
end;


procedure TFpka40601.BitBtn2Click(Sender: TObject);
begin
     Fpkq40602.ShowModal;
end;


procedure TFpka40601.CBendynChange(Sender: TObject);
begin
     CBendyn.Text := UpperCase(CBendyn.Text);
     if (CBendyn.Text <> 'Y') and (CBendyn.Text <> 'N') then CBendyn.Text := 'Y';
end;

procedure TFpka40601.CBendynDblClick(Sender: TObject);
begin
     if CBendyn.Text = 'Y' then CBendyn.Text := 'N'
     else                       CBendyn.Text := 'Y';
end;

procedure TFpka40601.CByearynChange(Sender: TObject);
begin
     CByearyn.Text := UpperCase(CByearyn.Text);
     if (CByearyn.Text <> 'Y') and (CByearyn.Text <> 'N') then CByearyn.Text := 'Y';
end;

procedure TFpka40601.CByearynDblClick(Sender: TObject);
begin
     if CByearyn.Text = 'Y' then CByearyn.Text := 'N'
     else                        CByearyn.Text := 'Y';
end;


procedure TFpka40601.SB_empnoFROMClick(Sender: TObject);
begin
     if YmanagerYN = False then
     begin
          FKeyEmpno := TFKeyEmpno.Create(self);
          Try
               FKeyEmpno.EdEmpno.Text := E_empnoFROM.Text;
               FKeyEmpno.ShowModal;

               if FKeyEmpno.CloseChk <> -1 then
               begin
                    E_empnoFROM.TExt   := FKeyEmpno.v_KeyEmpno;
                    P_kornameFROM.Caption := FKeyEmpno.v_KeyKorname;
               end;
          Finally
               FKeyEmpno.Free;
          end;
     end
     else
     begin
          FKeyEmpnoY := TFKeyEmpnoY.Create(self);
          Try
               FKeyEmpnoY.EdEmpno.Text := E_empnoFROM.Text;
               FKeyEmpnoY.ShowModal;

               if FKeyEmpnoY.CloseChk <> -1 then
               begin
                    E_empnoFROM.TExt := FKeyEmpnoY.v_KeyEmpno;
                    P_kornameFROM.Caption := FKeyEmpnoY.v_KeyKorname;
               end;
          Finally
               FKeyEmpnoY.Free;
          end;
     end;
end;

procedure TFpka40601.SB_empnoTOClick(Sender: TObject);
begin
     if YmanagerYN = False then
     begin
          FKeyEmpno := TFKeyEmpno.Create(self);
          Try
               FKeyEmpno.EdEmpno.Text := E_empnoTO.Text;
               FKeyEmpno.ShowModal;

               if FKeyEmpno.CloseChk <> -1 then
               begin
                    E_empnoTO.TExt   := FKeyEmpno.v_KeyEmpno;
                    P_kornameTO.Caption := FKeyEmpno.v_KeyKorname;
               end;
          Finally
               FKeyEmpno.Free;
          end;
     end
     else
     begin
          FKeyEmpnoY := TFKeyEmpnoY.Create(self);
          Try
               FKeyEmpnoY.EdEmpno.Text := E_empnoTO.Text;
               FKeyEmpnoY.ShowModal;

               if FKeyEmpnoY.CloseChk <> -1 then
               begin
                    E_empnoTO.TExt   := FKeyEmpnoY.v_KeyEmpno;
                    P_kornameTO.Caption := FKeyEmpnoY.v_KeyKorname;
               end;
          Finally
               FKeyEmpnoY.Free;
          end;
     end;
end;

procedure TFpka40601.E_empnoExit(Sender: TObject);
begin
     if (YmanagerYN) and
        ((Copy(E_empnoFROM.Text,1,1) <> 'Y') or (Copy(E_empnoTO.Text,1,1) <> 'Y')) then
     begin
          Application.MessageBox('�İ��� ��忡���� ������ ����� ���� �۾���'+#13+'�� �� �����ϴ�!','�۾��ȳ�', mb_OK+$0030);
          E_empnoFROM.Text := 'Y000';
          E_empnoTO.Text   := 'YZZZ';
          E_empnoFROM.SelectAll;
          System.Exit;
     end;
end;

procedure TFpka40601.C_GubunChange(Sender: TObject);
begin
  if C_Gubun.ItemIndex = 0 then
  begin
    YmanagerYN := False;
    E_empnoFROM.Text := '0000';
    E_empnoTO.Text   := 'XXXX';
  end
  else
  begin
    YmanagerYN := True;
    E_empnoFROM.Text := 'Y000';
    E_empnoTO.Text   := 'YZZZ';
  end;

end;

procedure TFpka40601.FormActivate(Sender: TObject);
var
     qq : TOraQuery;
     CUseYN : string;
begin
     Application.ProcessMessages;

     Pempno   := PassEmp(cmdline,1);
     Pkorname := PassEmp(cmdline,2);
     Pgrade   := Passemp(cmdline,4);

     Lempno.Caption   := Pkorname+'('+Pempno+')';
     Lsysdate.caption := fn_GetDateStr;

     //2017.02.07 eyha ������ ���� �ý��� ���� - �ٰ�:SR-1701-1022
     {if (Copy(Pgrade,3,1) > 'C') then
     begin
             MessageBox(handle,'������ ���� �ܿ��� ������ �� �����ϴ�.','�� ��',MB_OK or $0030);
             Close;
     end;}
     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;
     Try
       with qq do
       begin
         Close;
         SQL.clear;
         SQL.ADD('Select payutil.GET_PRGUSER_YN(''2'',''PKA4060G'','''+Pempno+''') USEYN From Dual');
         Open;
         CUseYN := FieldByName('USEYN').AsString;
       end;
     Finally
         qq.Free;
     end;

     if (Copy(Pempno,1,1) <> 'D') and (CUseYN <> 'Y') then
     begin
       MessageBox(handle,'������ ���� �ܿ��� ������ �� �����ϴ�.','�� ��',MB_OK or $0030);
       Close;
     end;



     //2017.02.07 eyha ������/�İ��� �и�  �ٰ�:SR-1701-1022

     {//2016.03.18 eyha �������� �İ��� ���ÿ� �۾������ϵ��� ó�� ȫ����M ��û
     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;
     Try
       with qq do
       begin
            Close;
            SQL.Clear;
            SQL.ADD('SELECT Nvl(VALUE1,''ZZZZ'') VALUE1, ');
            SQL.ADD('       Nvl(VALUE2,''ZZZZ'') VALUE2, ');
            SQL.ADD('       Nvl(VALUE3,''ZZZZ'') VALUE3, ');
            SQL.ADD('       Nvl(VALUE4,''ZZZZ'') VALUE4, ');
            SQL.ADD('       Nvl(VALUE5,''ZZZZ'') VALUE5  ');
            SQL.ADD('  FROM PKCVARI                      ');
            SQL.ADD(' WHERE gubun = ''PY''               ');
            Open;

            if (Pempno = FieldByName('VALUE1').AsString) OR
               (Pempno = FieldByName('VALUE2').AsString) OR
               (Pempno = FieldByName('VALUE3').AsString) OR
               (Pempno = FieldByName('VALUE4').AsString) OR
               (Pempno = FieldByName('VALUE5').AsString) then
            begin
              C_Gubun.Enabled   := True;

              C_Gubun.ItemIndex := 0;

              C_GubunChange(nil);

              maintitle.Color   := clPurple;
              maintitle.Caption := '���� ���� �� ���� [������/�İ���]';
            end else begin
              YmanagerYN := fn_YmanagerCheck;

              if YmanagerYN  then
                 C_Gubun.ItemIndex := 1
               else
                 C_Gubun.ItemIndex := 0;

              C_Gubun.Enabled   := False;

              C_GubunChange(nil);

              //�Ϲ��� �޿������ڿ��� ���л�� ����.
              if YmanagerYN then
              begin
                  maintitle.Color := clTeal;
                  maintitle.Caption := '���� ���� �� ����[�İ���]';
              end
              else
              begin
                  maintitle.Color := clNavy;
                  maintitle.Caption := '���� ���� �� ����';
              end;
            end;
       end;
     Finally
          qq.Free;
     end;    }
     C_Gubun.Enabled   := False;
     C_Gubun.ItemIndex := 0;       //2017.02.07 eyha ������ ������
     C_GubunChange(nil);     


     Work_Setup;//�Ϲ��� ������ ���ο� ���� �۾�ȯ�� ����.
end;

end.

