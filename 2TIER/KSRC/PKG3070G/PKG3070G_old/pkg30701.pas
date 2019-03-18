{* ======================= Program Header ======================================
 PROGRAM-NAME   : PKG3070G(�ʰ��ٹ��� ���/��������)
 SYSTEM-NAME    : �޿�
 SUBSYSTEM-NAME : ����
 Programmer     : ���ȸ
 Version        : 30.00
 Date           : 1999.01.05

Update Contents
 Version  date(yy.mm.dd)  programmer  description               relevant doc.no
 1.00     1997.12.01      ���ȸ      ���ʰ��ߺ�                �������
 30.00    1999.01.05      ������      ����������              �ϳ����簳��
============================================================================= *}
unit pkg30701;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Spin, Mask, DB, DBTables,  Pass,
  Tmax_DataSetText, Tmax_session, OnInsaCommon, Func, TmaxFunc, MemDS,
  DBAccess, Ora, KeyEmpno, KeyEmpnoY, OnEditBaseCtrl, OnEditStdCtrl,
  OnEditBtnCtrl, OnEditCombo;

type
  TM_KG3070G = class(TForm)
    Panel1: TPanel;
    L_UserName: TLabel;
    L_Date: TLabel;
    Panel4: TPanel;
    P_Buttons: TPanel;
    BB_Close: TBitBtn;
    BB_Run: TBitBtn;
    P_Help: TPanel;
    Panel6: TPanel;
    SP_FrEmpNO: TSpeedButton;
    SP_ToEmpNO: TSpeedButton;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    E_FrEmpNO: TEdit;
    E_ToEmpNo: TEdit;
    Panel3: TPanel;
    SP_UpDown: TSpinButton;
    GB_Box1: TGroupBox;
    GB_Box2: TGroupBox;
    RB_AllEmp: TRadioButton;
    RB_Partial: TRadioButton;
    P_FixMon: TPanel;
    Panel8: TPanel;
    Panel5: TPanel;
    Bevel1: TBevel;
    Label2: TLabel;
    Label8: TLabel;
    RB_SumKind1: TRadioButton;
    RB_SumKind2: TRadioButton;
    Label1: TLabel;
    Label3: TLabel;
    maintitle: TPanel;
    Memo1: TMemo;
    TMaxSession: TTMaxSession;
    TDS_batch: TTMaxDataSet;
    RB_emp: TRadioButton;
    RB_Yemp: TRadioButton;
    Label4: TLabel;
    E_yearpaynum: TOnComboEdit;
    E_YYMM: TOnMaskEdit;
    procedure BB_CloseClick(Sender: TObject);
    procedure SP_UpDownDownClick(Sender: TObject);
    procedure SP_UpDownUpClick(Sender: TObject);
    procedure RB_AllEmpClick(Sender: TObject);
    procedure RB_PartialClick(Sender: TObject);
    procedure SP_FrEmpNOClick(Sender: TObject);
    procedure SP_ToEmpNOClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BB_RunClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RB_empClick(Sender: TObject);
    procedure RB_YempClick(Sender: TObject);
  private
    { Private declarations }
    ActiveFlag    : Boolean;
  public
    { Public declarations }
    CurDate       : String[20];           {... ������¥                      ...}
    FixMon        : String[06];           {... �����������                  ...}
    Procedure  Display_Msg2(p_str:string);   //Dsa2000
    Function  Check_Valid : Boolean;
    Function  Check_Date( InDate : String ) : Boolean;
    Function  Check_EmpNo : Boolean;

    Procedure Get_FixMon;
    Procedure Read_yearpaynum;
    Procedure SetUp;
  end;

var
  M_KG3070G: TM_KG3070G;

implementation

{$R *.DFM}


{==============================================================================
         ���� Program ȣ�� ���� ȣ�⿡ ���� parameter ������ �����ϴ�
         �Լ�.
 ==============================================================================}
Function TM_KG3070G.Check_Valid : Boolean;
begin
     if Check_Date(E_YYMM.Text) AND Check_EmpNo then
        begin
             if not Check_Date(FixMon) then
                begin
                     Application.MessageBox('��ϵ� ������������� ��ȿ�� ���� �ƴմϴ�. Ȯ���Ͻð� �ٽ� �۾� �Ͻʽÿ�.','�Է¿���',MB_ICONWARNING);
                     Result         := False;
                     System.Exit;
                end;

             if E_YYMM.Text < FixMon then
                begin
                     Application.MessageBox('�۾����س���� ��������������� ���ų� Ŀ�� �մϴ�.','�Է¿���',MB_ICONWARNING);
                     Result         := False;
                end
             else
                Result := True;
        end
     else
         Result := False;
end;

{==============================================================================
         ������س���� Check�ϴ� �Լ�.
 ==============================================================================}
Function TM_KG3070G.Check_Date( InDate : String ) : Boolean;
var
   Temp   : Real;
begin
     if Length(InDate) <> 6 then
        begin
             P_Help.Caption := '   �۾����س���� 6�ڸ��� �Է��Ͻʽÿ�...';
             E_YYMM.SetFocus;
             Result         := False;
             System.Exit;
        end;

     InDate := Copy(InDate,1,4) + DateSeparator + Copy(InDate,5,2) + DateSeparator + '01';
     Try
     Temp   := StrToDate(InDate);
     Except on EConvertError do
            begin
                 P_Help.Caption  := '   �������� �ʴ� ��¥�Դϴ�. Ȯ���Ͻð� �ٽ� �Է��ϼ���...';
                 E_YYMM.SetFocus;
                 Result          := False;
                 System.Exit;
            end;
     end;

     P_Help.Caption := '';
     Result         := True;
end;


{==============================================================================
         ����� Check�ϴ� �Լ�.
 ==============================================================================}
Function TM_KG3070G.Check_EmpNo : Boolean;
begin
     if RB_Partial.Checked then
     begin
          if Length(E_FrEmpNo.Text) <> 4 then
             begin
                  P_Help.Caption := '   ����� 4�ڸ��� �Է��ϼž� �մϴ�...';
                  E_FrEmpNo.SetFocus;
                  Result         := False;
                  System.Exit;
             end;

             if Length(E_ToEmpNo.Text) <> 4 then
                begin
                     P_Help.Caption := '   ����� 4�ڸ��� �Է��ϼž� �մϴ�...';
                     E_FrEmpNo.SetFocus;
                     Result         := False;
                     System.Exit;
                end;

             if E_FrEmpNo.Text > E_ToEmpno.Text then
                begin
                     P_Help.Caption := '   ''���FROM''�� ''���TO''���� �� Ů�ϴ�....';
                     E_FrEmpNo.SetFocus;
                     Result         := False;
                end
             else
                 Result := True;
     end
     else
         begin
              P_Help.Caption := '';
              Result := True;
         end;
end;


Procedure TM_KG3070G.Display_Msg2(p_str:String);
var
   i,j     : LongInt;
   Temp    : Array[0..1000] of Char;
   HostStr : String;
begin
     i        := 0;
     j        := 0;
     HostStr  := '';
     for i := 0 to Length(p_str) - 1 do
     begin
       if p_str[i] = #10 then
         begin
           Memo1.Lines.Add( HostStr );
           HostStr := '';
         end
       else
         HostStr := HostStr + p_str[i];
     end;
     if HostStr <> '' then Memo1.Lines.Add( HostStr );
end;
{===============================================================================
 ======================  < User Define Procedures >  ===========================
 ===============================================================================}


 {==============================================================================
          ������������ ����� Procedure.
 ==============================================================================}
Procedure TM_KG3070G.Get_FixMon;
var
     qq : TOraQuery;
begin
     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     Try
          with qq do
          begin
               Close;
               Sql.Clear;
               Sql.Add('SELECT FIXMON FROM PKCOTBAS  ' );
               Open;
               FixMon := FieldByName('FixMon').AsString;
          end;
     Finally
          qq.Free;
     end;
end;

{==============================================================================
         ���������� �о���� Procedure.
 ==============================================================================}
Procedure TM_KG3070G.Read_yearpaynum;
var
     qq : TOraQuery;
begin
     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     Try
          with qq do
          begin
               Close;
               Sql.Clear;
               Sql.Add('SELECT distinct yearpaynum FROM PKHYPHIS  ');
               Sql.Add(' order by yearpaynum desc                 ');
               Open;

               E_yearpaynum.Items.Clear;
               while not Eof do
               begin
                    E_yearpaynum.Items.Add(FieldByName('yearpaynum').AsString);
                    next;
               end;

               Close;
               Sql.Clear;
               Sql.Add('SELECT yearpaynum FROM PKCPBAS            ');
               Open;

               E_yearpaynum.Text := FieldByName('yearpaynum').AsString;
          end;
     Finally
          qq.Free;
     end;
end;

{==============================================================================
         �ʱ�ȭ�� �����ϴ� Procedure.
 ==============================================================================}
Procedure TM_KG3070G.SetUp;
begin
     P_Help.Caption := '   �޿��ý��ۿ� ���� ���Դϴ�...';

     if (Copy(Pgrade,3,1) > 'C') then
     begin
          MessageBox(handle,'������ ���� �ܿ��� ������ �� �����ϴ�.','�� ��',MB_OK or $0030);
          Close;
     end;

     {//2017.02.17 jissi �İ��� ���α׷� �и��� �б� ���� ����
     if (fn_YmanagerCheck) then
     begin
          maintitle.Caption  := '�ʰ��ٹ����� ��� / ��������[�İ���]';
          maintitle.Color    := Clteal;
          RB_Partial.Checked := False;
          RB_AllEmp.Enabled  := False;
          RB_Yemp.Checked    := True;
          E_FrEmpNO.Text     := 'Y000'; E_ToEmpNO.Text := 'YZZZ';
     end
     else
     begin
          maintitle.Caption  := '�ʰ��ٹ����� ��� / ��������';
          maintitle.Color    := ClNavy;
          RB_emp.Checked     := True;
          E_FrEmpNO.Text     := '0000'; E_ToEmpNO.Text := 'XZZZ';
     end;
     }

     maintitle.Caption  := '�ʰ��ٹ����� ��� / ��������';
     maintitle.Color    := ClNavy;
     RB_emp.Checked     := True;
     E_FrEmpNO.Text     := '0000'; E_ToEmpNO.Text := 'XZZZ';

     Read_yearpaynum;

     CurDate := fn_GetDateTimeStr;

     E_YYMM.Text := Copy(AddMonStr(Copy(CurDate,1,6)+'01',-1),1,6);

     L_Date.Caption      := Copy(CurDate,1,4) + '-' + Copy(CurDate,5,2) + '-' +
                            Copy(CurDate,7,2);
     L_UserName.Caption  := PKorName+ '(' + Pempno + ')';
     Application.ProcessMessages;

     Get_FixMon;
     if FixMon <> '' then
        P_FixMon.Caption := Copy(FixMon,1,4) + '-' + Copy(FixMon,5,2);

     P_Help.Caption      := '';
end;


{==============================================================================
 ===================       Event Handlers      ================================
 ============================================================================== }

//... '����' ��ư�� ������ ��� ...
procedure TM_KG3070G.BB_CloseClick(Sender: TObject);
begin
     Close;
end;

//... '������س�� Down'�� ���� ���� ���...
procedure TM_KG3070G.SP_UpDownDownClick(Sender: TObject);
var
   Tmp : Integer;
begin
     if Check_Date(E_YYMM.Text) then
        E_YYMM.Text := Copy(AddMonStr(E_YYMM.Text+'01', -1),1,6);
end;

//... '������س�� Up'�� ���� ���� ���...
procedure TM_KG3070G.SP_UpDownUpClick(Sender: TObject);
begin
     if Check_Date(E_YYMM.Text) then
        E_YYMM.Text := Copy(AddMonStr(E_YYMM.Text+'01', 1),1,6);
end;

//... ����������� '��ü'�� ���õ� ��� ...
procedure TM_KG3070G.RB_AllEmpClick(Sender: TObject);
begin
     E_FrEmpNO.Enabled  := False;
     E_ToEmpNo.Enabled  := False;
     SP_FrEmpNO.Enabled := False;
     SP_ToEmpNO.Enabled := False;
     //2016.03.10 jissi ������,�İ��� ���� üũ �и��� ��ü�� 0000~ZZZZ
     E_FrEmpNo.Text     := '0000';
     E_ToEmpNo.Text     := 'ZZZZ';
     {
     if (Ymanager) then
     begin
          E_FrEmpNo.Text     := 'Y000';
          E_ToEmpNo.Text     := 'YZZZ';
     end
     else
     begin
          E_FrEmpNo.Text     := '0000';
          E_ToEmpNo.Text     := 'XZZZ';
     end;
     }
end;

//... ����������� '�Ϻ�'�� ���õ� ��� ...
procedure TM_KG3070G.RB_PartialClick(Sender: TObject);
begin
     E_FrEmpNO.Enabled  := True;
     E_ToEmpNo.Enabled  := True;
     SP_FrEmpNO.Enabled := True;
     SP_ToEmpNO.Enabled := True;
end;

//... '�����ȣFrom'�� ���� ���� ���...
procedure TM_KG3070G.SP_FrEmpNOClick(Sender: TObject);
begin
{//2017.02.17 jissi �İ��� ���α׷� �и��� �б� ���� ����
     if (Ymanager) then
     begin
          Try
               FKeyEmpnoY := TFKeyEmpnoY.Create(Self);
               FKeyEmpnoY.EdEmpno.Text := E_FrEmpno.Text;
               FKeyEmpnoY.ShowModal;

               if FKeyEmpnoY.CloseChk <> -1 then E_FrEmpNo.Text := FKeyEmpnoY.v_KeyEmpno;
          Finally
               FKeyEmpnoY.Free;
          end;
     end
     else
     begin
}
          Try
               FKeyEmpno := TFKeyEmpno.Create(Self);
               FKeyEmpno.EdEmpno.Text := E_FrEmpno.Text;
               FKeyEmpno.ShowModal;

               if FKeyEmpno.CloseChk <> -1 then E_FrEmpNo.Text := FKeyEmpno.v_KeyEmpno;
          Finally
               FKeyEmpno.Free;
          end;
//     end;
     {Try
     M_EmpNO           := TM_EmpNo.Create(Self);
     M_EmpNo.InValue   := E_FrEmpNo.Text;
     M_EmpNO.ShowModal;
     if M_EmpNO.OutEmpNo <> '' then
     begin
          E_FrEmpNo.Text      := M_EmpNo.OutEmpNo;
     end;
     Finally
     M_EmpNo.Free;
     End;}
end;

//... '�����ȣTo'�� ���� ���� ���...
procedure TM_KG3070G.SP_ToEmpNOClick(Sender: TObject);
begin
{//2017.02.17 jissi �İ��� ���α׷� �и��� �б� ���� ����
     if (Ymanager) then
     begin
          Try
               FKeyEmpnoY := TFKeyEmpnoY.Create(Self);
               FKeyEmpnoY.EdEmpno.Text := E_ToEmpno.Text;
               FKeyEmpnoY.ShowModal;

               if FKeyEmpnoY.CloseChk <> -1 then E_ToEmpNo.Text := FKeyEmpnoY.v_KeyEmpno;
          Finally
               FKeyEmpnoY.Free;
          end;
     end
     else
     begin
}
          Try
               FKeyEmpno := TFKeyEmpno.Create(Self);
               FKeyEmpno.EdEmpno.Text := E_ToEmpno.Text;
               FKeyEmpno.ShowModal;

               if FKeyEmpno.CloseChk <> -1 then E_ToEmpNo.Text := FKeyEmpno.v_KeyEmpno;
          Finally
               FKeyEmpno.Free;
          end;
//     end;
     {Try
     M_EmpNO           := TM_EmpNo.Create(Self);
     M_EmpNo.InValue   := E_ToEmpNo.Text;
     M_EmpNO.ShowModal;
     if M_EmpNO.OutEmpNo <> '' then
     begin
          E_ToEmpNo.Text      := M_EmpNo.OutEmpNo;
     end;
     Finally
     M_EmpNo.Free;
     End;}
end;

//... ���� ������ ��� ...
procedure TM_KG3070G.FormCreate(Sender: TObject);
begin
     ActiveFlag := True;

     OraConnect;

     //2016.06.09 jissi OS���� ���Ȱ�ȭ ����
     TMaxSession.Connect     := False;
     TMaxSession.EnvFileName := GetHomeDir+'\newhana.env';
     //�������� Test
     //TMaxSession.EnvFileName := 'C:\InsaDev\newhana.env';
     TMaxSession.LabelName   := 'HANAROHPER';

     try
          TMaxSession.Connect := True;
     except
          Application.MessageBox(PChar('�����λ� APP���� ���� ����'),'����',mb_ok);
          Application.Terminate;
          Exit;
     end;
end;

//... '����'�� ���� ���� ���...
procedure TM_KG3070G.BB_RunClick(Sender: TObject);
var
     Pstr, JobStep, FrEmpNo, ToEmpNo, SumKind : String;
     Temp, sSys    : String;
     Rundate,  ProgId, CmdStr   : String;  //���� ����...
     SumYn : String;
begin
     P_Help.Caption := '';
     {//2016.03.10 jissi ������, �İ��� ���� üũ �и� �ּ� ó��
     if (Ymanager) then
     begin
          if (Copy(E_FrEmpno.Text,1,1) <> 'Y') or (Copy(E_ToEmpno.Text,1,1) <> 'Y') then
          begin
               Application.MessageBox('�İ��� ��忡���� ������ ����� ���� �۾���'+#13+
                                      '�� �� �����ϴ�.','�۾��ȳ�',MB_OK+$0030);
               System.Exit;
          end;
     end;
     }
     if Check_Valid then
     begin
          Screen.CurSor := CrHourGlass;
          JobStep := 'Y';

          if RB_SumKind1.Checked then
             SumKind := '0'
          else
             Sumkind := '1';

          FrEmpNo := E_FrEmpNO.Text;
          ToEmpNo := E_ToEmpNO.Text;

          //2016.03.10 jissi ��� �״�� ����ǵ��� �ּ�ó��
          {
          if RB_AllEmp.Checked then
          begin
               FrEmpNo := '0000';
               ToEmpNo := 'XZZZ';
          end
          else
          begin
               FrEmpNo := E_FrEmpNO.Text;
               ToEmpNo := E_ToEmpNO.Text;
          end;
          }
          Memo1.Clear;
          Memo1.Lines.Add('������...');

          FM_Tmax           := TFM_Tmax.Create(Self);
          FM_Tmax.T_Session := TMaxSession;
          Rundate           := Copy(FM_Tmax.GetData('sysdate','',''),1,14);
          Memo1.Lines.Add('StartTime : '+Rundate);
          // pkg3070g pkg3075g �������� ���� - 2018.08.09 Sangmoon Lee
          // SumYn Parameter �߰� - 2018.08.09 Sangmoon Lee
          ProgId  := 'pkg3071g_Y';
          SumYn   := 'Y';
          // CmdStr  := '/hper/insa/HINSA/proc/bin/Kbin/pkg3070g'
          CmdStr  := '/hper/insa/HINSA/proc/bin/Kbin/pkg3071g'+' '+E_YYMM.Text+' '+FrEmpNo+' '
                     +ToEmpNo+' '+JobStep+' '+SumKind+' '+PEmpNo+' '+ProgId+' '+Rundate
                     +' '+E_yearpaynum.Text+' '+SumYn;

          with TDS_batch do
          begin
               Close;
               ServiceName := 'HINSA_batch';
               ClearFieldInfo;
               ClearParamInfo;
               AddParam('cmdstr', 300, CmdStr);
               if Execute then
               begin

               Close;
               ServiceName := 'SHR0SSEL';
               ClearFieldInfo;
               ClearParamInfo;
               AddField('RESULT', ftString, 5000);
               Sql.Text := Format('SELECT RESULT FROM PYBATLOG '+
                                  ' WHERE RUNDATE = ''%s''     '+
                                  '   AND PROGID  = ''%s''     '+
                                  ' ORDER BY to_number(SEQNO)  ',[Rundate, ProgId ]);
               Open;
               Memo1.Lines.Add('EXECUTE TRUE!!');
               end;

               while not Eof do
               begin
                    Memo1.Lines.Add(FieldByName('RESULT').AsString);
                    Next;
               end;
          end;

          FM_Tmax           := TFM_Tmax.Create(Self);
          FM_Tmax.T_Session := TMaxSession;
          Rundate           := Copy(FM_Tmax.GetData('sysdate','',''),1,14);
          Memo1.Lines.Add('EndTime : '+Rundate);

          if Pos('OK',Memo1.Text) > 0 then
             P_Help.Caption := '  �۾��� ���������� �Ϸ�Ǿ����ϴ�. '
          else
             P_Help.Caption := '  �۾��� �����߽��ϴ�. ';

             Screen.CurSor := CrDefault;
     end;
end;

procedure TM_KG3070G.FormActivate(Sender: TObject);
begin
     if ActiveFlag then
        SetUp;
     ActiveFlag := False;
end;

procedure TM_KG3070G.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     if IDYes = Application.MessageBox('�����Ͻðڽ��ϱ�?','Ȯ ��',MB_YesNo) then
        begin
             Action := caFree
        end
     else
         Action := caNone;
end;

procedure TM_KG3070G.RB_empClick(Sender: TObject);
begin
     //2016.03.10 jissi ������,�İ��� ���� üũ �и��� �������� 0000~XZZZ
     E_FrEmpNO.Enabled  := False;
     E_ToEmpNo.Enabled  := False;
     SP_FrEmpNO.Enabled := False;
     SP_ToEmpNO.Enabled := False;

     E_FrEmpNo.Text     := '0000';
     E_ToEmpNo.Text     := 'XZZZ';
end;

procedure TM_KG3070G.RB_YempClick(Sender: TObject);
begin
     //2016.03.10 jissi ������,�İ��� ���� üũ �и��� �İ����� Y000~YZZZ
     E_FrEmpNO.Enabled  := False;
     E_ToEmpNo.Enabled  := False;
     SP_FrEmpNO.Enabled := False;
     SP_ToEmpNO.Enabled := False;

     E_FrEmpNo.Text     := 'Y000';
     E_ToEmpNo.Text     := 'YZZZ';
end;

end.
