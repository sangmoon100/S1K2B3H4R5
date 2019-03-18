unit pkg10601;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Mask, DB, DBTables,
  Kylib1, FormMon1, Datelib, Gauges, Ora, Func, MemDS, DBAccess; //Pass,TimeFtp, Calen2 ==> FormMon1   ��ü..

type
  TMainForm = class(TForm)
    Panel1: TPanel;
    Phelpmsg: TPanel;
    Shape1: TShape;
    Label1: TLabel;
    L_UserName: TLabel;
    L_Curdate: TLabel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Label2: TLabel;
    BBrun: TBitBtn;
    BBsetup: TBitBtn;
    BBexit: TBitBtn;
    Bevel1: TBevel;
    Bevel2: TBevel;
    RB_cancellation: TRadioButton;
    RB_provide: TRadioButton;
    MEyear: TMaskEdit;
    GB_PrintCondition: TGroupBox;
    RBmonitor: TRadioButton;
    RBprinter: TRadioButton;
    RBfile: TRadioButton;
    PrinterSetupDialog1: TPrinterSetupDialog;
    Label3: TLabel;
    SpeedButton1: TSpeedButton;
    SaveDialog1: TSaveDialog;
    Image1: TImage;
    Panel2: TPanel;
    Gauge1: TGauge;
    RB_all: TRadioButton;
    P_PrintOrder: TPanel;
    RB_OrderAppkind: TRadioButton;
    RB_OrderEmpno: TRadioButton;
    QueryF: TOraQuery;
    procedure FormActivate(Sender: TObject);
    procedure BBexitClick(Sender: TObject);
    procedure BBsetupClick(Sender: TObject);
    procedure BBrunClick(Sender: TObject);
    procedure MEyearChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RB_allClick(Sender: TObject);

  private
    { Private declarations }
    Procedure ShowPreView;
    Function  AddSpace ( data : String; Size : Integer ) : String;

  public
    { Public declarations }
    Start : Integer;
  end;

Type
    TFam01 = Record                    {  Local �ڷ�ȭ���� Record ���� }
          empno      : Array[0..4] of Char;             { ���        }
          korname    : Array[0..10] of Char;            { ����        }
          firstyn    : Array[0..8] of Char;             { �峲����    }
          faminame   : Array[0..8] of Char;             { ������      }
          famikind   : Array[0..9] of Char;             { ��������    }
          famirel    : Array[0..9] of Char;             { ��������    }
          famibdate  : Array[0..10] of Char;            { �������    }
          regdate    : Array[0..10] of Char;            { �����߻���  }
          famifrdate : Array[0..10] of Char;            { ���ް��ÿ�  }
          famitodate : Array[0..10] of Char;            { ������      }
          appdesc    : Array[0..39] of Char;            { ��û����    }
          lineskip   : Array[0..1] of char;             { �����ٷ�    }
end;

var
  MainForm: TMainForm;
  Fam01  : TFam01;  { Local �ڷ�ȭ���� Record �� ���� }
  Running: Boolean;

implementation

{$R *.DFM}

uses  pkg10602, pkg10603;

{�� Ȱ��ȭ.....................................................................}
procedure TMainForm.FormActivate(Sender: TObject);
begin
     if Running then System.Exit;
     Running := True;

     Application.ProcessMessages;

     OraConnect;

     L_UserName.Caption := Pkorname + '(' +Pempno+ ')';

     L_Curdate.Caption := fn_GetDateStr;

     MEyear.Text := Copy(RemoveChar(L_Curdate.Caption,'/'),1,6);

     Phelpmsg.Caption := '  �ʱ��ڷḦ �а��ֽ��ϴ�.';
     Application.ProcessMessages;

     Phelpmsg.Caption := '';
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
     Start := 0;
     Running := False;
end;

Procedure TMainForm.ShowPreView;
begin
     PreviewForm.ShowModal;
end;

procedure TMainForm.BBexitClick(Sender: TObject);
begin
     Close;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     if Application.MessageBox('�۾��� �����Ͻðڽ��ϱ�?',
                               '�۾��ȳ�', mb_YesNo) = IDYES
     then
     begin
          Action := caFree;
     end
     else
          Action := caNone;
end;

procedure TMainForm.BBsetupClick(Sender: TObject);
begin
     PrinterSetupDialog1.Execute;
end;

{���� ����.....................................................................}
procedure TMainForm.BBrunClick(Sender: TObject);
var
     FilePointer : File of TFam01;
     Inwon: Integer;
begin
     Phelpmsg.Caption := '';
     if fn_IsDate(MEyear.Text+'01') = False then
     begin
          MessageBox(Handle, '���س���� ��Ȯ�� �Է��ϼ���.', '�Է¿���', MB_ICONWARNING);
          MEyear.SetFocus;
          exit;
     end;

     Phelpmsg.Caption := '  �ش��ϴ� �ڷḦ �������Դϴ�.';
     Application.ProcessMessages;


     with QueryF do
     begin
          Close;
          SQL.Clear;
          SQL.ADD (' select a.empno, a.korname, a.appkind,         ');
          SQL.ADD ('        b.firstyn, a.faminame,                 ');
          SQL.ADD ('        (Select codename from pyccode          ');
          SQL.ADD ('          where codeid = ''K410''              ');
          SQL.ADD ('            and codeno = a.famikind) famikind, ');
          SQL.ADD ('        (Select codename from pyccode          ');
          SQL.ADD ('          where codeid = ''I211''              ');
          SQL.ADD ('            and codeno = a.famirel) famirel,   ');          
          SQL.ADD ('        a.famibdate, a.regdate,                ');
          SQL.ADD ('        a.famifrdate, a.famitodate,            ');
          SQL.ADD ('        a.appdesc                              ');
          SQL.ADD ('   from pkmfmmas a, pkmpmas b                  ');
          SQL.ADD ('  where (a.empno = b.empno)                    ');
          SQL.ADD ('    and (a.appdate like :p_appdate)            ');
          ParamByName('p_appdate').AsString := MEyear.Text+'%';

          if RB_all.Checked then           {��ü}
            SQL.ADD('    and (a.appkind like ''%2'') ')
          else if RB_provide.Checked then  {���޴����}
            SQL.ADD('    and (a.appkind = ''A2'')    ')
          else                             {���������}
            SQL.ADD('    and (a.appkind = ''B2'')    ');

          if RB_OrderAppkind.Checked then
               SQL.Add('order by a.appkind, a.empno, a.famibdate ')
          else
               SQL.Add('order by a.empno, a.appkind, a.famibdate ');

          Open;

          if RecordCount = 0 then
          begin
               Close;
               MessageBox(Handle, '�ش��ϴ� �ڷᰡ �ϳ��� �����ϴ�.', 'ó������', MB_ICONWARNING);
               System.Exit;
          end;

          if RBmonitor.Checked = True then
          begin
               printform := TPrintform.create(application);
               PrintForm.QuickReport1.PreView;
          end
          else if RBprinter.Checked = True then
          begin
               printform := TPrintform.create(application);
               printform.user_preview := false;
               PrintForm.QuickReport1.Print;
               printform.free;
          end
          else
          begin   {�ڷ�ȭ��}
               if SaveDialog1.Execute then
               begin
                    Assignfile(FilePointer, SaveDialog1.FileName);
                    System.Rewrite(FilePointer);
               end
               else
               begin
                    Close;
                    System.Exit;
               end;

               Inwon := 0;
               FillChar(Fam01, SizeOf(Fam01), ' ');
               StrPcopy(Fam01.korname,copy(MEyear.text,1,4)+'.'+copy(MEyear.text,5,2));
               StrPcopy(Fam01.famibdate,'�ڵ���������');
               StrPcopy(Fam01.lineskip,#13#10);
               System.Write(FilePointer, Fam01);   {Title Record Write}
               FillChar(Fam01, SizeOf(Fam01), ' ');

               StrPcopy(Fam01.empno,AddSpace('���',5));
               StrPcopy(Fam01.korname,AddSpace('����',11));
               StrPcopy(Fam01.firstyn,AddSpace('�峲����',9));
               StrPcopy(Fam01.faminame,AddSpace('��������',9));
               StrPcopy(Fam01.famikind,AddSpace('��������',10));
               StrPcopy(Fam01.famirel,AddSpace('��������',10));
               StrPcopy(Fam01.famibdate,AddSpace('�������',11));
               StrPcopy(Fam01.regdate,AddSpace('�����߻���',11));
               StrPcopy(Fam01.famifrdate,AddSpace('���ް��ÿ�',11));
               StrPcopy(Fam01.famitodate,AddSpace('������',11));
               StrPcopy(Fam01.appdesc,'��û����');
               StrPcopy(Fam01.lineskip,#13#10);
               System.Write(FilePointer, Fam01);   {Header Record Write}
               FillChar(Fam01, SizeOf(Fam01), ' ');

               while not Eof do
               begin
                    Inc(Inwon);
                    Gauge1.Progress := (Inwon * 100) div RecordCount;
                    Application.ProcessMessages;

                    StrPcopy(Fam01.empno,AddSpace(FieldByName('empno').AsString,5));
                    StrPcopy(Fam01.korname,AddSpace(FieldByName('korname').AsString,11));
                    StrPcopy(Fam01.firstyn,AddSpace(FieldByName('firstyn').AsString,9));
                    StrPcopy(Fam01.faminame,AddSpace(FieldByName('faminame').AsString,9));
                    StrPcopy(Fam01.famikind,AddSpace(FieldByName('famikind').AsString,10));
                    StrPcopy(Fam01.famirel,AddSpace(FieldByName('famirel').AsString,10));
                    StrPcopy(Fam01.famibdate,AddSpace(FieldByName('famibdate').AsString,11));
                    StrPcopy(Fam01.regdate,AddSpace(FieldByName('regdate').AsString,11));
                    StrPcopy(Fam01.famifrdate,AddSpace(FieldByName('famifrdate').AsString,11));
                    StrPcopy(Fam01.famifrdate,AddSpace(FieldByName('famitodate').AsString,11));
                    StrPcopy(Fam01.famifrdate,AddSpace(FieldByName('appdesc').AsString,40));
                    StrPcopy(Fam01.lineskip,#13#10);

                    Next;

                    System.Write(FilePointer,Fam01);    {Detail Record Write}
                    FillChar(Fam01, SizeOf(Fam01), ' ');
               end;
               System.Close(FilePointer);
          end;
     end;

     QueryF.Close;
     Phelpmsg.Caption := '  ����� �Ϸ��Ͽ����ϴ�.';
     Gauge1.Progress := 0;
     Application.ProcessMessages;
end;

procedure TMainForm.MEyearChange(Sender: TObject);
begin
     if Length(MEyear.Text) = 6 then
     begin
          if fn_IsDate(MEyear.Text+'01') = False then
          begin
               MessageBox(Handle, '���س���� ��Ȯ�� �Է��ϼ���.', '�Է¿���', MB_ICONWARNING);
               MEyear.SetFocus;
               exit;
          end;
     end;
end;

{�޷��� ȣ���Ѵ�...............................................................}
procedure TMainForm.SpeedButton1Click(Sender: TObject);
begin
    Try 
        MonthForm := TMonthForm.Create(Self); 
        MonthForm.ShowModal;    
        if MonthForm.DayCaption <> '' then              
           MEyear.Text := Copy(MonthForm.DayCaption,1,6);
    Finally 
        MonthForm.Free; 
    End;
end;

{Record �� ������ Space ��....................................................}
Function TMainForm.AddSpace ( data : String; Size : Integer ) : String;
var
     i : Integer;
     s : String;
begin
     s := '';
     if (size - Length(data)) = 0 then begin
        AddSpace := ''+data;
     end else begin
        for i := 1 to size - Length(data) do begin
            s := s+ ' ';
        end;
     end;
     AddSpace := s + data;
end;

procedure TMainForm.RB_allClick(Sender: TObject);
begin
     RB_OrderAppkind.Enabled := True;
     RB_OrderEmpno.Enabled   := True;
     if TRadioButton(Sender).Name = 'RB_all' then {�ۼ������� ��ü�̸�}
     begin
          RB_OrderEmpno.Enabled   := False;
          RB_OrderAppkind.Checked := True;
     end;
end;

end.