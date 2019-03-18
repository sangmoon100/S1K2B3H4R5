unit pki30202;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, ExtCtrls, Buttons, DB, DBTables, MemDS,
  DBAccess, Ora, Func;

type
  TFpki30202 = class(TForm)
    Panel1: TPanel;
    Panel30: TPanel;
    Panel31: TPanel;
    CBlicence: TCheckBox;
    CBcitydrv: TCheckBox;
    CBowndrv: TCheckBox;
    Panel32: TPanel;
    Panel33: TPanel;
    Panel34: TPanel;
    Panel35: TPanel;
    Panel36: TPanel;
    Panel37: TPanel;
    Panel38: TPanel;
    P_Empno: TPanel;
    Eempno: TEdit;
    P_Korname: TPanel;
    Ekorname: TEdit;
    Panel2: TPanel;
    BBsave: TBitBtn;
    BBcancel: TBitBtn;
    Eliceno: TEdit;
    Ecarkind: TEdit;
    Ecarno: TEdit;
    MElicedate: TMaskEdit;
    MEcardate: TMaskEdit;
    Panel3: TPanel;
    Eappemp: TEdit;
    SBanfrdate: TSpeedButton;
    SpeedButton1: TSpeedButton;
    Elicegr: TComboBox;
    Image1: TImage;
    Panel4: TPanel;
    CBcarowner: TComboBox;
    Query1: TOraQuery;
    procedure CBlicenceClick(Sender: TObject);
    procedure BBcancelClick(Sender: TObject);
    procedure CBcitydrvClick(Sender: TObject);
    procedure CBowndrvClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BBsaveClick(Sender: TObject);
    procedure SBanfrdateClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  Fpki30202: TFpki30202;

implementation

uses pki30201, Calen1, Kylib1;

{$R *.DFM}

procedure TFpki30202.CBlicenceClick(Sender: TObject);
var
   appmaxcnt : integer;
begin
     if CBlicence.Checked = True then
     begin
          Query1.SQL.Clear;
          Query1.close;
          Query1.SQL.Add('select drvmaxcnt from pkcdrbas                            ');
          Query1.SQL.Add('where drvkind = ''1'' and payclfr <=:L1 and payclto >=:L1 ');
          Query1.ParamByName('L1').AsString := Fpki30201.Epaycl.Text;
          Query1.Open;
          if  Query1.RecordCount = 0 then
          begin
               Application.MessageBox('���������� ���ޱ��ؿ� �ش����� �ʱ� ������ ��û�Ҽ� �����ϴ�',
                                 '�۾��ȳ�',MB_OK);
               CBlicence.Checked := False;
               exit;
          end;
          appmaxcnt := Query1.FieldByName('drvmaxcnt').AsInteger;
          Query1.SQL.Clear;
          Query1.close;
          Query1.SQL.Add('select liappno from pkmdrmas where empno='''+Eempno.Text+'''');
          Query1.Open;
          if (Query1.RecordCount > 0 ) and (appmaxcnt <= Query1.FieldByName('liappno').AsInteger) then
          begin
               Application.MessageBox('��������ûȽ���� �ʰ��ϱ� ������ ��û�Ҽ� �����ϴ�',
                                 '�۾��ȳ�',MB_OK);
               CBlicence.Checked := False;
          end;
     end;
end;

procedure TFpki30202.BBcancelClick(Sender: TObject);
begin
     close;
end;

procedure TFpki30202.CBcitydrvClick(Sender: TObject);
var
   appmaxcnt : integer;
begin
     if CBcitydrv.Checked = True then
     begin
          Query1.close;
          Query1.SQL.Clear;
          Query1.SQL.Add('select drvmaxcnt from pkcdrbas ');
          Query1.SQL.Add('where drvkind = ''2'' and payclfr <=:L1 and payclto >=:L1 ');
          Query1.ParamByName('L1').AsString := Fpki30201.Epaycl.Text;
          Query1.Open;
          if  Query1.RecordCount = 0 then
          begin
               Application.MessageBox('���������� ���ޱ��ؿ� �ش����� �ʱ� ������ ��û�Ҽ� �����ϴ�',
                                 '�۾��ȳ�',MB_OK);
               CBcitydrv.Checked := False;
               exit;
          end;
          appmaxcnt := Query1.FieldByName('drvmaxcnt').AsInteger;
          Query1.SQL.Clear;
          Query1.close;
          Query1.SQL.Add('select trappno from pkmdrmas where empno='''+Eempno.Text+'''');
          Query1.Open;
          if (Query1.RecordCount > 0 ) and (appmaxcnt <= Query1.FieldByName('trappno').AsInteger) then
          begin
               Application.MessageBox('�ó�������ûȽ���� �ʰ��ϱ� ������ ��û�Ҽ� �����ϴ�',
                                 '�۾��ȳ�',MB_OK);
               CBcitydrv.Checked := False;
          end;

     end;
end;

procedure TFpki30202.CBowndrvClick(Sender: TObject);
var
  appmaxcnt : integer;
begin
     if CBowndrv.Checked = True then
     begin
{===============================================================================
   Version    date(yy.mm.dd)     programmer     description           relevant doc.no
   30.00      1998.12.30         ������         ����/���޼���         �ϳ����λ��簳��
================================================================================
// ȣ��ǥ(pkcptbl)�� ������. --> ���� ���� ���
          Query1.close;
          Query1.SQL.Clear;
          Query1.SQL.Add('select odamt from pkcptbl                        ');
{===============================================================================
   Version    date(yy.mm.dd)     programmer     description           relevant doc.no
   30.00      1998.12.30         ������         ����/���޼���         �ϳ����λ��簳��
================================================================================
//          Query1.SQL.Add('where paycl = :L1 and paygr =:L2 and paynum = :L3');
          Query1.SQL.Add('where paycl = :L1                and paynum = :L3');
          Query1.ParamByName('L1').AsString := Fpki30201.Epaycl.Text;
{===============================================================================
   Version    date(yy.mm.dd)     programmer     description           relevant doc.no
   30.00      1998.12.30         ������         ����/���޼���         �ϳ����λ��簳��
================================================================================
// ����
//          Query1.ParamByName('L2').AsString := Fpki30201.paygr;
          Query1.ParamByName('L3').AsString := paynum;
          Query1.Open;
          if  Query1.FieldByName('odamt').AsFloat = 0 then
          begin
               Application.MessageBox('���������� ��û�ڰ��� ����/ȣ�������� �ش����� �ʽ��ϴ�. ',
                                 '�۾��ȳ�',MB_OK);
               CBowndrv.Checked := False;
               exit;
          end;
================================================================================
================================================================================
 ������� ����ڰ� �־ 1999.12.16 leerk 
          Query1.close;
          Query1.SQL.Clear;
          Query1.SQL.Add('select count(*) cnt  from pkcdrbas                        ');
          Query1.SQL.Add('where :paycl between payclfr and payclto           ');
          Query1.SQL.Add('and   drvkind =''3''  ');
          Query1.ParamByName('paycl').AsString := Fpki30201.Epaycl.Text;

          Query1.Open;
          if  Query1.FieldByName('cnt').AsFloat = 0 then
          begin
               Application.MessageBox(
               '���������� ��û�ڰ��� ���޹����� �ش����� �ʽ��ϴ�. ',
                                 '�۾��ȳ�',MB_OK);
               CBowndrv.Checked := False;
               exit;
          end;
================================================================================}
          Query1.close;
          Query1.SQL.Clear;
          Query1.SQL.Add('select drvmaxcnt from pkcdrbas ');
          Query1.SQL.Add('where drvkind = ''3'' ');
          Query1.Open;

          appmaxcnt := Query1.FieldByName('drvmaxcnt').AsInteger;

          Query1.close;
          Query1.SQL.Clear;
          Query1.SQL.Add('select odappno from pkmdrmas where empno='''+Eempno.Text+'''');
          Query1.Open;
          if (Query1.RecordCount > 0 ) and (appmaxcnt <= Query1.FieldByName('odappno').AsInteger) then
          begin
               Application.MessageBox('�ڰ����� ��ûȽ���� �ʰ��ϱ� ������ ��û�Ҽ� �����ϴ�',
                                 '�۾��ȳ�',MB_OK);
               CBowndrv.Checked := False;
          end;
     end;
end;

procedure TFpki30202.FormActivate(Sender: TObject);
begin
     CBowndrv.Checked  := False;
     CBlicence.Checked := False;
     CBcitydrv.Checked := False;
end;

procedure TFpki30202.BBsaveClick(Sender: TObject);
begin
     if (CBlicence.Checked = False) and (CBcitydrv.Checked = False) and (CBowndrv.Checked = False) then
     begin
          Application.MessageBox('��û������ ���� �����ϼ���','�۾��ȳ�',MB_OK);
          exit;
     end;

     if (CBlicence.Checked = True) or (CBcitydrv.Checked = True) or (CBowndrv.Checked = True) then
     begin
          if Eappemp.Text = '' then
          begin
               Application.MessageBox('��û�λ���� �Է��ϼ���','�۾��ȳ�',MB_OK);
               Eappemp.SetFocus;
               exit;
          end;
          if length(MElicedate.Text) <> 8 then
           begin
               Application.MessageBox('����������� �Է��ϼ���','�۾��ȳ�',MB_OK);
               MElicedate.SetFocus;
               exit;
          end;

          if DateCheck(copy(MElicedate.Text,1,4),copy(MElicedate.Text,5,2),copy(MElicedate.Text,7,2)) = -1 then
          begin
               Application.MessageBox('����������� ��Ȯ�� �Է��ϼ���','�۾��ȳ�',MB_OK);
               MElicedate.SetFocus;
               exit;
          end;
          if Elicegr.Text = '' then
          begin
               Application.MessageBox('���������� �Է��ϼ���','�۾��ȳ�',MB_OK);
               Elicegr.SetFocus;
               exit;
          end;
          if Eliceno.Text = '' then
          begin
               Application.MessageBox('�����ȣ�� �Է��ϼ���','�۾��ȳ�',MB_OK);
               Eliceno.SetFocus;
               exit;
          end;
     end;

     if (CBowndrv.Checked = True) then
     begin
          if length(MEcardate.Text) <> 8 then
          begin
               Application.MessageBox('������������ ��Ȯ�� �Է��ϼ���','�۾��ȳ�',MB_OK);
               MEcardate.SetFocus;
               exit;
          end;

          if DateCheck(copy(MEcardate.Text,1,4),copy(MEcardate.Text,5,2),copy(MEcardate.Text,7,2)) = -1 then
          begin
               Application.MessageBox('������������ ��Ȯ�� �Է��ϼ���','�۾��ȳ�',MB_OK);
               MEcardate.SetFocus;
               exit;
          end;

          if trim(CBcarowner.Text) = '' then
          begin
               Application.MessageBox('���������ڸ� �Է��ϼ���','�۾��ȳ�',MB_OK);
               CBcarowner.SetFocus;
               exit;
          end;

          if trim(Ecarkind.Text) = '' then
          begin
               Application.MessageBox('���������� �Է��ϼ���','�۾��ȳ�',MB_OK);
               Ecarkind.SetFocus;
               exit;
          end;
          if trim(Ecarno.Text) = '' then
          begin
               Application.MessageBox('������ȣ�� �Է��ϼ���','�۾��ȳ�',MB_OK);
               Ecarno.SetFocus;
               exit;
          end;
     end;

     if CBlicence.Checked = True then
     begin
          Query1.SQL.Clear;
          Query1.Close;
          Query1.SQL.Add('select nvl(max(appno),0) a from pkmdrapp where drvkind = ''1'' and empno = :L1');
          Query1.ParamByName('L1').AsString := Eempno.Text;
          Query1.Open;
          Fpki30201.Table1.Insert;
          Fpki30201.Table1APPNO.value    := Query1.FieldByName('a').AsInteger+1;
          Fpki30201.Table1DRVKIND.value  := '1';
          Fpki30201.Table1APPEMP.value   := Eappemp.Text;
          Fpki30201.Table1EMPNO.value    := Eappemp.Text;
          Fpki30201.Table1KORNAME.value  := Ekorname.Text;
          Fpki30201.Table1Paycl.value    := Fpki30201.Epaycl.Text;
          Fpki30201.Table1APPDATE.value  := copy(GSsysdate,1,8);
          Fpki30201.Table1LICEDATE.value := MElicedate.Text;
          Fpki30201.Table1LICEGR.value   := Elicegr.Text;
          Fpki30201.Table1LICENO.value   := Eliceno.Text;
          Fpki30201.Table1CARDATE.value  := MEcardate.Text;
          Fpki30201.Table1CAROWNER.value := CBcarowner.Text;
          Fpki30201.Table1CARKIND.value  := Ecarkind.Text;
          Fpki30201.Table1CARNO.value    := Ecarno.Text;
          Fpki30201.Table1WRITETIME.value    := copy(GSsysdate,1,12) ;
          Fpki30201.Table1WRITEMAN.value    := Pempno ;
          Fpki30201.Table1.Post;
     end;

     if CBcitydrv.Checked = True then
     begin
          Query1.SQL.Clear;
          Query1.Close;
          Query1.SQL.Add('select nvl(max(appno),0) a from pkmdrapp where drvkind = ''2'' and empno = :L1');
          Query1.ParamByName('L1').AsString := Eempno.Text;
          Query1.Open;
          Fpki30201.Table1.Insert;
          Fpki30201.Table1APPNO.value    := Query1.FieldByName('a').AsInteger+1;
          Fpki30201.Table1DRVKIND.value  := '2';
          Fpki30201.Table1APPEMP.value   := Eappemp.Text;
          Fpki30201.Table1EMPNO.value    := Eappemp.Text;
          Fpki30201.Table1Paycl.value    := Fpki30201.Epaycl.Text;
          Fpki30201.Table1KORNAME.value  := Ekorname.Text;
          Fpki30201.Table1APPDATE.value  := copy(GSsysdate,1,8);
          Fpki30201.Table1LICEDATE.value := MElicedate.Text;
          Fpki30201.Table1LICEGR.value   := Elicegr.Text;
          Fpki30201.Table1LICENO.value   := Eliceno.Text;
          Fpki30201.Table1CARDATE.value  := MEcardate.Text;
          Fpki30201.Table1CAROWNER.value := CBcarowner.Text;
          Fpki30201.Table1CARKIND.value  := Ecarkind.Text;
          Fpki30201.Table1CARNO.value    := Ecarno.Text;
          Fpki30201.Table1WRITETIME.value    := copy(GSsysdate,1,12) ;
          Fpki30201.Table1WRITEMAN.value    := Pempno ;
          Fpki30201.Table1.Post;
     end;

     if CBowndrv.Checked = True then
     begin
          Query1.SQL.Clear;
          Query1.Close;
          Query1.SQL.Add('select nvl(max(appno),0) a from pkmdrapp where drvkind = ''3'' and empno = :L1');
          Query1.ParamByName('L1').AsString := Eempno.Text;
          Query1.Open;
          Fpki30201.Table1.Insert;
          Fpki30201.Table1APPNO.value    := Query1.FieldByName('a').AsInteger+1;
          Fpki30201.Table1DRVKIND.value  := '3';
          Fpki30201.Table1APPEMP.value   := Eappemp.Text;
          Fpki30201.Table1EMPNO.value    := Eappemp.Text;
          Fpki30201.Table1KORNAME.value  := Ekorname.Text;
          Fpki30201.Table1Paycl.value    := Fpki30201.Epaycl.Text;
          Fpki30201.Table1APPDATE.value  := copy(GSsysdate,1,8);
          Fpki30201.Table1LICEDATE.value := MElicedate.Text;
          Fpki30201.Table1LICEGR.value   := Elicegr.Text;
          Fpki30201.Table1LICENO.value   := Eliceno.Text;
          Fpki30201.Table1CARDATE.value  := MEcardate.Text;
          Fpki30201.Table1CAROWNER.value := CBcarowner.Text;
          Fpki30201.Table1CARKIND.value  := Ecarkind.Text;
          Fpki30201.Table1CARNO.value    := Ecarno.Text;
          Fpki30201.Table1WRITETIME.value    := copy(GSsysdate,1,12) ;
          Fpki30201.Table1WRITEMAN.value    := Pempno ;
          Fpki30201.Table1.Post;
     end;
     Close;
end;

procedure TFpki30202.SBanfrdateClick(Sender: TObject);
begin
     Calendar := TCalendar.Create(Self);
     Try
        Calendar.ShowModal;
        MElicedate.Text := Calendar.DayCaption;
     Finally
        Calendar.Free;
     end;
end;

procedure TFpki30202.SpeedButton1Click(Sender: TObject);
begin
     Calendar := TCalendar.Create(Self);
     Try
        Calendar.ShowModal;
        MEcardate.Text := Calendar.DayCaption;
     Finally
        Calendar.Free;
     end;
end;

end.

