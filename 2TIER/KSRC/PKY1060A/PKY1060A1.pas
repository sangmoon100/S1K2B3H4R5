{* ======================= Program Header ======================================
 PROGRAM-NAME   : PKY1060A(�ʰ��ٹ����� ���/��������)
 SYSTEM-NAME    : �޿�
 SUBSYSTEM-NAME : ����
 Programmer     : ������
 Version        : 1.0
 Date           : 2017.01.20

Update Contents
 Version  date(yy.mm.dd)  programmer  description               relevant doc.no
 1.00     2017.01.20      ������      PKG3070G ������ �ҽ����� �İ��� �и�
============================================================================= *}
unit PKY1060A1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Spin, Mask, DB, DBTables,  Pass,
  Tmax_DataSetText, Tmax_session, OnInsaCommon, Func, TmaxFunc, MemDS,
  DBAccess, Ora, KeyEmpno, KeyEmpnoY, OnEditBaseCtrl, OnEditStdCtrl,
  OnEditBtnCtrl, OnEditCombo, Grids, DBGrids, OnGrDBGrid, Comobj;

type
  TFM_Main = class(TForm)
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
    Pn_Insert: TPanel;
    Panel7: TPanel;
    Label9: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    GroupBox1: TGroupBox;
    SP_Insert: TSpeedButton;
    Panel9: TPanel;
    E_EmpNO: TEdit;
    P_KorName: TPanel;
    BB_Insert: TBitBtn;
    BB_Delete: TBitBtn;
    GroupBox2: TGroupBox;
    Panel10: TPanel;
    Edatafile: TEdit;
    BitBtn2: TBitBtn;
    BB_ExcelFind: TBitBtn;
    Panel11: TPanel;
    Grid_Data: TOnGrDbGrid;
    RB_List: TRadioButton;
    ora_Data: TOraQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    ds_Data: TDataSource;
    OpenDialog1: TOpenDialog;
    tmp_oraqry: TOraQuery;
    Memo2: TMemo;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
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
    procedure E_FrEmpNOExit(Sender: TObject);
    procedure E_ToEmpNoExit(Sender: TObject);
    procedure SP_InsertClick(Sender: TObject);
    procedure E_EmpNOChange(Sender: TObject);
    procedure E_EmpNOKeyPress(Sender: TObject; var Key: Char);
    procedure BB_InsertClick(Sender: TObject);
    procedure BB_DeleteClick(Sender: TObject);
    procedure RB_ListClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BB_ExcelFindClick(Sender: TObject);
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
    procedure Grid_Clear(sGubun : String);
  end;

var
  FM_Main: TFM_Main;

implementation

{$R *.DFM}


{==============================================================================
         ���� Program ȣ�� ���� ȣ�⿡ ���� parameter ������ �����ϴ�
         �Լ�.
 ==============================================================================}
Function TFM_Main.Check_Valid : Boolean;
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
Function TFM_Main.Check_Date( InDate : String ) : Boolean;
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
Function TFM_Main.Check_EmpNo : Boolean;
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


Procedure TFM_Main.Display_Msg2(p_str:String);
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
Procedure TFM_Main.Get_FixMon;
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
Procedure TFM_Main.Read_yearpaynum;
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
               Sql.Add('SELECT distinct yearpaynum as disyearpaynum FROM PKHDYPHIS  ');
               Sql.Add(' order by yearpaynum desc                 ');
               Open;

               E_yearpaynum.Items.Clear;
               while not Eof do
               begin
                    E_yearpaynum.Items.Add(FieldByName('disyearpaynum').AsString);
                    next;
               end;

               Close;
               Sql.Clear;
               Sql.Add('SELECT disyearpaynum FROM PKCPBAS            ');
               Open;

               E_yearpaynum.Text := FieldByName('disyearpaynum').AsString;

          end;

     Finally
          qq.Free;
     end;
end;

{==============================================================================
         �ʱ�ȭ�� �����ϴ� Procedure.
 ==============================================================================}
Procedure TFM_Main.SetUp;
begin
     P_Help.Caption := '   �޿��ý��ۿ� ���� ���Դϴ�...';
     
     if (Copy(Pempno,1,1) = 'D') or ((Copy(Pgrade,3,1) <= 'C') and (fn_YmanagerCheck)) then
     begin
          maintitle.Caption  := '�ʰ��ٹ����� ��� / ��������[�İ���]';
          maintitle.Color    := Clteal;
          RB_Partial.Checked := False;
          RB_AllEmp.Enabled  := False;
          RB_List.Checked    := True;
          RB_Yemp.Checked    := True;
          E_FrEmpNO.Text     := 'Y000';
          E_ToEmpNO.Text     := 'YZZZ';
     end
     else
     begin
          MessageBox(handle,'�İ����޿������� �ܿ��� ������ �� �����ϴ�.','�� ��',MB_OK or $0030);
          Close;
     end;

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
procedure TFM_Main.BB_CloseClick(Sender: TObject);
begin
     Close;
end;

//... '������س�� Down'�� ���� ���� ���...
procedure TFM_Main.SP_UpDownDownClick(Sender: TObject);
var
   Tmp : Integer;
begin
     if Check_Date(E_YYMM.Text) then
        E_YYMM.Text := Copy(AddMonStr(E_YYMM.Text+'01', -1),1,6);
end;

//... '������س�� Up'�� ���� ���� ���...
procedure TFM_Main.SP_UpDownUpClick(Sender: TObject);
begin
     if Check_Date(E_YYMM.Text) then
        E_YYMM.Text := Copy(AddMonStr(E_YYMM.Text+'01', 1),1,6);
end;

//... ����������� '��ü'�� ���õ� ��� ...
procedure TFM_Main.RB_AllEmpClick(Sender: TObject);
begin
     E_FrEmpNO.Enabled  := False;
     E_ToEmpNo.Enabled  := False;
     SP_FrEmpNO.Enabled := False;
     SP_ToEmpNO.Enabled := False;
     //2016.03.10 jissi ������,�İ��� ���� üũ �и��� ��ü�� 0000~ZZZZ
     E_FrEmpNo.Text     := '0000';
     E_ToEmpNo.Text     := 'ZZZZ';

     Pn_Insert.Enabled  := False;
     Grid_Clear('D');
end;

//... ����������� '�Ϻ�'�� ���õ� ��� ...
procedure TFM_Main.RB_PartialClick(Sender: TObject);
begin
     E_FrEmpNO.Enabled  := True;
     E_ToEmpNo.Enabled  := True;
     SP_FrEmpNO.Enabled := True;
     SP_ToEmpNO.Enabled := True;

     Pn_Insert.Enabled  := False;
     Grid_Clear('D');
end;

//... '�����ȣFrom'�� ���� ���� ���...
procedure TFM_Main.SP_FrEmpNOClick(Sender: TObject);
begin
     Try
          FKeyEmpnoY := TFKeyEmpnoY.Create(Self);
          if (E_FrEmpno.Text='Y000') or (E_FrEmpno.Text='YZZZ') then
          FKeyEmpnoY.EdEmpno.Text := ''
          else
          FKeyEmpnoY.EdEmpno.Text := E_FrEmpno.Text;
          FKeyEmpnoY.ShowModal;

          if FKeyEmpnoY.CloseChk <> -1 then E_FrEmpNo.Text := FKeyEmpnoY.v_KeyEmpno;
     Finally
          FKeyEmpnoY.Free;
     end;
end;

//... '�����ȣTo'�� ���� ���� ���...
procedure TFM_Main.SP_ToEmpNOClick(Sender: TObject);
begin
     Try
          FKeyEmpnoY := TFKeyEmpnoY.Create(Self);
          if (E_ToEmpNo.Text='Y000') or (E_ToEmpNo.Text='YZZZ') then
          FKeyEmpnoY.EdEmpno.Text := ''
          else
          FKeyEmpnoY.EdEmpno.Text := E_ToEmpNo.Text;
          FKeyEmpnoY.ShowModal;

          if FKeyEmpnoY.CloseChk <> -1 then E_ToEmpNo.Text := FKeyEmpnoY.v_KeyEmpno;
     Finally
          FKeyEmpnoY.Free;
     end;
end;

//... ���� ������ ��� ...
procedure TFM_Main.FormCreate(Sender: TObject);
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
procedure TFM_Main.BB_RunClick(Sender: TObject);
var
     Pstr, JobStep, FrEmpNo, ToEmpNo, SumKind : String;
     Temp, sSys    : String;
     Rundate,  ProgId, CmdStr   : String;  //���� ����... 
     SumYn : String;
begin
     P_Help.Caption := '';

     if (Copy(E_FrEmpno.Text,1,1) <> 'Y') or (Copy(E_ToEmpno.Text,1,1) <> 'Y') then
     begin
          Application.MessageBox('������ ����� ���� �۾���'+#13+
                                 '�� �� �����ϴ�.','�۾��ȳ�',MB_OK+$0030);
          System.Exit;
     end;

     if Check_Valid then
     begin
          Screen.CurSor := CrHourGlass;
          JobStep := 'Y';

          if RB_SumKind1.Checked then
             SumKind := '0'
          else
             Sumkind := '1';


          if RB_List.Checked then
          begin
             if ora_Data.RecordCount < 1 then
             begin
                Application.MessageBox('��� �� �����۾��� ������ ����� �������� �ʽ��ϴ�.!','�Է¿���',MB_ICONWARNING);
                Exit;
             end;
             ora_Data.DisableControls;
             ora_Data.First;
             Memo2.Clear;
             Memo1.Clear;
             Memo1.Lines.Add('������...');
             FM_Tmax           := TFM_Tmax.Create(Self);
             FM_Tmax.T_Session := TMaxSession;
             Rundate           := Copy(FM_Tmax.GetData('sysdate','',''),1,14);
             Memo1.Lines.Add('StartTime : '+Rundate);

             while Not ora_Data.EOF do
             begin
                FrEmpNo := ora_Data.FieldByName('EMPNO').AsString;
                ToEmpNo := ora_Data.FieldByName('EMPNO').AsString;

                Rundate := Copy(FM_Tmax.GetData('sysdate','',''),1,14);
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
                     Execute;

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

                     while not Eof do
                     begin
                          Memo2.Lines.Add(FieldByName('RESULT').AsString);
                          Next;
                     end;
                end;

                if Pos('OK',Memo2.Text) > 0 then
                begin
                   P_Help.Caption := '  �۾��� ���������� �Ϸ�Ǿ����ϴ�. ';
                   Memo1.Lines.Add('[' + ora_Data.FieldByName('EMPNO').AsString + '-' + ora_Data.FieldByName('KORNAME').AsString + '] �۾��� ���������� �Ϸ�Ǿ����ϴ�.');
                end
                else
                begin
                   P_Help.Caption := ' �۾��� �����߽��ϴ�. ';
                   Memo1.Lines.Add('[' + ora_Data.FieldByName('EMPNO').AsString + '-' + ora_Data.FieldByName('KORNAME').AsString + '] �۾��� �����߽��ϴ�.');
                end;
                ora_Data.Next;
             end;

             FM_Tmax           := TFM_Tmax.Create(Self);
             FM_Tmax.T_Session := TMaxSession;
             Rundate           := Copy(FM_Tmax.GetData('sysdate','',''),1,14);
             Memo1.Lines.Add('EndTime : '+Rundate);
          end
          else
          begin
             FrEmpNo := E_FrEmpNO.Text;
             ToEmpNo := E_ToEmpNO.Text;

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
                  Execute;

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
          end;

          Screen.CurSor := CrDefault;
     end;
end;

procedure TFM_Main.FormActivate(Sender: TObject);
begin
     if ActiveFlag then
        SetUp;
     ActiveFlag := False;
end;

procedure TFM_Main.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     if IDYes = Application.MessageBox('�����Ͻðڽ��ϱ�?','Ȯ ��',MB_YesNo) then
        begin
             Action := caFree
        end
     else
         Action := caNone;
end;

procedure TFM_Main.RB_empClick(Sender: TObject);
begin
     //2016.03.10 jissi ������,�İ��� ���� üũ �и��� �������� 0000~XZZZ
     E_FrEmpNO.Enabled  := False;
     E_ToEmpNo.Enabled  := False;
     SP_FrEmpNO.Enabled := False;
     SP_ToEmpNO.Enabled := False;

     E_FrEmpNo.Text     := '0000';
     E_ToEmpNo.Text     := 'XZZZ';

     Pn_Insert.Enabled  := False;
     Grid_Clear('D');
end;

procedure TFM_Main.RB_YempClick(Sender: TObject);
begin
     //2016.03.10 jissi ������,�İ��� ���� üũ �и��� �İ����� Y000~YZZZ
     E_FrEmpNO.Enabled  := False;
     E_ToEmpNo.Enabled  := False;
     SP_FrEmpNO.Enabled := False;
     SP_ToEmpNO.Enabled := False;

     E_FrEmpNo.Text     := 'Y000';
     E_ToEmpNo.Text     := 'YZZZ';

     Pn_Insert.Enabled  := False;
     Grid_Clear('D');
end;

procedure TFM_Main.E_FrEmpNOExit(Sender: TObject);
begin
     if (Copy(E_FrEmpno.Text,1,1) <> 'Y') then
     begin
          Application.MessageBox('������ ����� ���� �۾���'+#13+
                                 '�� �� �����ϴ�.','�۾��ȳ�',MB_OK+$0030);
          E_FrEmpno.Text := 'Y000';
     end;
end;

procedure TFM_Main.E_ToEmpNoExit(Sender: TObject);
begin
     if (Copy(E_ToEmpno.Text,1,1) <> 'Y') then
     begin
          Application.MessageBox('������ ����� ���� �۾���'+#13+
                                 '�� �� �����ϴ�.','�۾��ȳ�',MB_OK+$0030);
          E_ToEmpno.Text := 'YZZZ';
     end;
end;

procedure TFM_Main.Grid_Clear(sGubun: String);
begin
  if sGubun = 'D' then
  begin
     ora_Data.Close;
     ora_Data.Open;
     ora_Data.Delete;
     Memo1.Lines.Text := '';
  end;
end;

procedure TFM_Main.SP_InsertClick(Sender: TObject);
begin
     Try
          FKeyEmpnoY := TFKeyEmpnoY.Create(Self);
          FKeyEmpnoY.EdEmpno.Text := E_EmpNO.Text;
          FKeyEmpnoY.ShowModal;

          if FKeyEmpnoY.CloseChk <> -1 then
          begin
             E_EmpNO.Text      := FKeyEmpnoY.v_KeyEmpno;
             P_KorName.Caption := FKeyEmpnoY.v_KeyKorname;
          end;
     Finally
          FKeyEmpnoY.Free;
     end;
end;

procedure TFM_Main.E_EmpNOChange(Sender: TObject);
begin
  P_KorName.caption := '';
end;

procedure TFM_Main.E_EmpNOKeyPress(Sender: TObject; var Key: Char);
begin
   If Key = #13 then
     begin
       key := #0;
       with tmp_oraqry do
         begin
          Close;
          SQL.Clear;
          SQL.ADD(' SELECT EMPNO, KORNAME ');
          SQL.ADD('   FROM PIMPMAS A');
          SQL.ADD('    WHERE 1=1');
          SQL.ADD('    AND (EMPNO LIKE :empno ');
          SQL.ADD('     OR  KORNAME LIKE :empno) ');
          ParamByName('empno').AsString := E_EmpNO.Text + '%';
          Open;

        If RecordCount < 1 then
        begin
           MessageBox(HANDLE,'�ش����� �������� �ʽ��ϴ�..','��ȸ�����Է¿���',MB_ICONWARNING) ;
           Close;
           E_EmpNO.text := '' ;
           Exit;
        end
        else If RecordCount = 1 then
        begin
           E_EmpNO.Text := FieldByName('empno').AsString;
           P_KorName.caption := FieldByName('korname').AsString;
        end
        else If RecordCount > 1 then
        begin
           FKeyEmpnoY := TFKeyEmpnoY.Create(Self);
           Try
              FKeyEmpnoY.Edempno.Text := E_EmpNO.Text;
              FKeyEmpnoY.ShowModal;
              If FKeyEmpnoY.CloseChk = -1 then Exit;
              E_EmpNO.Text      := FKeyEmpnoY.v_KeyEmpno;
              P_KorName.caption := FKeyEmpnoY.v_KeyKorname;
           Finally
              FKeyEmpnoY.Free;
           end;
        end;
      end;
    end;
end;

procedure TFM_Main.BB_InsertClick(Sender: TObject);
begin
    if Length(Trim(E_EmpNO.Text)) <> 4 then
    begin
       MessageDlg('�߸��� ������� �Դϴ�. Ȯ���Ͻñ� �ٶ��ϴ�.!', MtWarning, [mbok], 0);
       Exit;
    end;

    with ora_Data do
    begin
        DisableControls;
        First;
        while Not EOF do
        begin
           if ora_Data.FieldByName('EMPNO').AsString = E_EmpNO.Text then
           begin
              MessageDlg('�̹� ��� �� ������ ������� �Դϴ�. Ȯ���Ͻñ� �ٶ��ϴ�.!', MtWarning, [mbok], 0);
              EnableControls;
              Exit;
           end;
           Next;
        end;
        Last;
        EnableControls;
    end;
    
    ora_Data.Append;
    ora_Data.FieldByName('EMPNO').AsString   := E_EmpNO.Text;
    ora_Data.FieldByName('KORNAME').AsString := P_KorName.Caption;
    ora_Data.Post;
end;

procedure TFM_Main.BB_DeleteClick(Sender: TObject);
begin
   if ora_Data.RecordCount > 0 then
      ora_Data.Delete
   else
   begin
      ShowMessage('������ ����� �������� �ʽ��ϴ�.!');
      Exit;
   end;
end;

procedure TFM_Main.RB_ListClick(Sender: TObject);
begin
     E_FrEmpNO.Enabled  := False;
     E_ToEmpNo.Enabled  := False;
     SP_FrEmpNO.Enabled := False;
     SP_ToEmpNO.Enabled := False;

     E_FrEmpNo.Text     := 'Y000';
     E_ToEmpNo.Text     := 'YZZZ';
     Pn_Insert.Enabled  := True;
end;

procedure TFM_Main.BitBtn2Click(Sender: TObject);
var
  XL, XArr: Variant;
begin
  P_Help.Caption := 'Excel�� ��ġ�Ǿ� �ִ��� �˻��ϰ� �ֽ��ϴ�.';

  XArr := VarArrayCreate([1, 2], VarVariant);
  try
       XL := CreateOLEObject('Excel.Application');
  except
       MessageDlg('Excel�� ��ġ�Ǿ� ���� �ʽ��ϴ�.', MtWarning, [mbok], 0);
       P_Help.Caption := '';
       Exit;
  end;

  XL.WorkBooks.Add; //���ο� ������ ����
  XL.Visible := false;
  //�÷��� ����_����Ÿ�̺� ����
  XArr[1]  := '�����ȣ(4�ڸ�)';
  XArr[2]  := '�����';
  XL.Range['A1', 'B1'].Value := XArr;
  XL.Range['A1', 'B1'].Borders.LineStyle := 1;     //�׵θ����� �����.  1�� �Ǽ�
  XL.Range['A1', 'B1'].Interior.Color:= $00CBF0B3;
  XL.Range['A1', 'B1'].Select;                     //�ڷḦ ��� Select�� �� --�ϴ� ����:  AutoFit ó���ϱ� ���ؼ���
  XL.Selection.Columns.AutoFit;                    //�ڵ�����
  XL.Visible := true;                              //�����ڷ� ������
  P_Help.Caption := '';
end;

procedure TFM_Main.BB_ExcelFindClick(Sender: TObject);
var
  v           : Variant ;
  iRow , iCnt, SCnt, FCnt : integer ;
  s_Empno, s_EmpNm, vMsg1, vMsg2 : String;
begin
   Grid_Clear('D');
   SCnt := 0;
   FCnt := 0;

   if OpenDialog1.Execute then begin
      Edatafile.text := OpenDialog1.FileName ;
   end;

   if (Edatafile.text = '') then
   begin
     ShowMessage('���� ȭ�ϸ��� �����ϴ�. Ȯ���� �ٽ� �۾��ϼ���.');
     Edatafile.SetFocus;
     Exit;
   end ;

   if IDNo = Application.MessageBox(PChar('�ش������� ȭ�鿡 Upload �Ͻðڽ��ϱ�?'),'�۾��ȳ�',MB_YesNo+MB_ICONWARNING) then
      Exit;

   try
        v:= CreateOleObject('Excel.application');
   except
        ShowMessage('Excel�� ��ġ�Ǿ� �־�� �մϴ�.');
        Exit;
   end;



   v.WorkBooks.open(Edatafile.Text);

   iCnt  := strToint(v.ActiveSheet.UsedRange.Rows.Count);

   For iRow := 2 to iCnt do
   begin
       s_Empno   := '';
       s_EmpNm   := '';
       vMsg1     := '';
       vMsg2     := '';
       with tmp_oraqry do
       begin
         Close;
         SQL.Clear;
         SQL.Add('select a.empno, a.korname    ');
         SQL.Add('  from pimpmas a             ');
         SQL.Add(' where a.empno    = :p_empno ');
         ParamByName('p_empno').AsString := v.cells[iRow, 1];
         Open;

         s_Empno   := FieldByName('empno'   ).AsString;
         s_EmpNm   := FieldByName('korname' ).AsString;
       end;

       if s_EmpNm = '' then
       begin
          vMsg1 := v.cells[iRow, 1];
          vMsg2 := v.cells[iRow, 2];
       end;

       if vMsg1 <> '' then
       begin
          Memo1.Lines.Add('[' + vMsg1 + '-' + vMsg2 + '] �����ȣ �����Դϴ�.');
          vMsg1 := '';
          vMsg2 := '';
          inc(FCnt);
       end
       else
       begin
          ora_Data.Append;
          ora_Data.FieldByName('EMPNO'      ).AsSTring := v.cells[iRow, 1];
          ora_Data.FieldByName('KORNAME'    ).AsSTring := s_EmpNm;
          ora_Data.Post;
          inc(SCnt);
       end;
   end;

   v.WorkBooks.Close;
   v.quit ;
   v:=unassigned;

   P_Help.Caption := '[�� ' + IntTostr(iCnt -1) + ' �� / ���� ' + IntTostr(SCnt) + '�� / ���� ' + IntTostr(FCnt) + '��] �������� �ε尡 �Ϸ� �Ǿ����ϴ�.';
end;

end.
