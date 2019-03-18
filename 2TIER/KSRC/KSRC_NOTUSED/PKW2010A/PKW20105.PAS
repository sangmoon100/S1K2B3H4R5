unit pkw20105;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, numedit, Buttons, ExtCtrls, Db, DBTables;

type
  TFpaynum = class(TForm)
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Panel4: TPanel;
    CBpaynum: TComboBox;
    Panel5: TPanel;
    Panel1: TPanel;
    CBpaycl1: TComboBox;
    CBpaycl2: TComboBox;
    CBpaygr2: TComboBox;
    CBpaygr1: TComboBox;
    Panel2: TPanel;
    Epaynum: TEdit;
    Phelpmsg: TPanel;
    Panel7: TPanel;
    BBrun: TBitBtn;
    BBclose: TBitBtn;
    Panel3: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Pextamt: TPanel;
    Label10: TLabel;
    Label14: TLabel;
    NEsextamt: TNumberEdit;
    RBrextamt: TRadioButton;
    RBsextamt: TRadioButton;
    NErextamt: TNumberEdit;
    Pnightamt: TPanel;
    Label17: TLabel;
    Label18: TLabel;
    NEsnightamt: TNumberEdit;
    RBrnightamt: TRadioButton;
    RBsnightamt: TRadioButton;
    NErnightamt: TNumberEdit;
    CBbasicamt: TCheckBox;
    CBextamt: TCheckBox;
    CBnightamt: TCheckBox;
    Pbasic: TPanel;
    Label12: TLabel;
    Label13: TLabel;
    NEsbasic: TNumberEdit;
    RBrbasic: TRadioButton;
    RBsbasic: TRadioButton;
    NErbasic: TNumberEdit;
    Query1: TQuery;
    procedure CBpaynumEnter(Sender: TObject);
    procedure CBbasicamtClick(Sender: TObject);
    procedure CBextamtClick(Sender: TObject);
    procedure CBnightamtClick(Sender: TObject);
    procedure BBrunClick(Sender: TObject);
    procedure BBcloseClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fpaynum: TFpaynum;

implementation

{$R *.DFM}

procedure TFpaynum.CBpaynumEnter(Sender: TObject);
begin
     Query1.SQL.Clear;
     Query1.Close;
     Query1.SQL.Add('SELECT DISTINCT  PAYNUM FROM PKCIGTBL ORDER BY PAYNUM DESC');
     Query1.open;
     CBpaynum.Items.Clear;
     CBpaynum.Text := Query1.FieldByName('PAYNUM').AsString;
     while not Query1.EOF do
     begin
          CBpaynum.Items.Add(Query1.FieldByName('PAYNUM').AsString);
          Query1.next;
     end;

end;

procedure TFpaynum.CBbasicamtClick(Sender: TObject);
begin
     if CBbasicamt.checked = True then
        Pbasic.enabled := True
     else
        Pbasic.enabled := False;

end;

procedure TFpaynum.CBextamtClick(Sender: TObject);
begin
     if CBextamt.checked = True then
        Pextamt.enabled := True
     else
        Pextamt.enabled := False;
end;

procedure TFpaynum.CBnightamtClick(Sender: TObject);
begin
 if CBnightamt.checked = True then
        Pnightamt.enabled := True
     else
        Pnightamt.enabled := False;
end;

procedure TFpaynum.BBrunClick(Sender: TObject);
var
   SamePaynum : Boolean;
begin
     if CBpaynum.Text > Epaynum.Text then
     begin
           Application.MessageBox('새급호차수가 기준급호차수보다 커야합니다', '자료오류', mb_OK);
           Epaynum.SetFocus;
           exit;
     end
     else if CBpaynum.Text = Epaynum.Text then
          SamePaynum := True
     else
         SamePaynum := False;

     if CBpaycl1.Text > CBpaycl2.Text then
     begin
           Application.MessageBox('BAND to 가 from보다 커야합니다', '자료오류', mb_OK);
           CBpaycl2.SetFocus;
           exit;
     end;

     if CBpaygr1.Text >= CBpaygr2.Text then
     begin
           Application.MessageBox('호봉 to가 from보다 커야합니다', '자료오류', mb_OK);
           CBpaygr2.SetFocus;
           exit;
     end;

     if  SamePaynum = False then
     begin
          Query1.SQL.Clear;
          Query1.Close;
          Query1.SQL.Add('select paynum from pkcigtbl where ');
          Query1.SQL.Add('paynum ='''+Epaynum.Text+'''     ');
          Query1.Open;
          if Query1.RecordCount > 0 then
          begin
               Application.MessageBox('이미 급호차수가 존재합니다', '자료오류', mb_OK);
               Epaynum.SetFocus;
               exit;
          end;

     if Application.MessageBox('새 급호차수를 생성하려고 합니다. 계속하시겠습니까?','작업안내',MB_YesNo)=IDNO then
        exit;

          Phelpmsg.Caption := ' 새 급호차수를 생성중...';
          Application.ProcessMessages;
          Query1.SQL.Clear;
          Query1.Close;
          Query1.SQL.Add('insert into pkcigtbl (paynum,paycl,paygr) ');
          Query1.SQL.Add('select '''+Epaynum.Text +''',paycl,paygr from pkcigtbl ');
          Query1.SQL.Add('where paynum = '''+CBpaynum.Text+''' and ');
          Query1.SQL.Add('paycl between '''+CBpaycl1.Text+''' and '''+CBpaycl2.Text+''' and ');
          Query1.SQL.Add('paygr between '+CBpaygr1.Text+' and '+CBpaygr2.Text+'');
          Query1.ExecSQL;
     end
     else
     begin
          if Application.MessageBox('기준 급호차수를갱신하려고 합니다. 계속하시겠습니까?','작업안내',MB_YesNo)=IDNO then
             exit;
     end;

     if CBbasicamt.Checked = True then
     begin
          Phelpmsg.Caption := '기본급을 setting 중...';
          Application.ProcessMessages;
          if RBsbasic.Checked = True then
          begin
               Query1.SQL.Clear;
               Query1.Close;
               Query1.SQL.Add('Update pkcigtbl ');
               Query1.SQL.Add('SET basicamt = '+FloatToStr(NEsbasic.value)+' ');
               Query1.SQL.Add(' WHERE paynum = '''+ Epaynum.Text + '''');
               Query1.SQL.Add(' AND paycl between '''+CBpaycl1.Text + ''' AND ''' + CBpaycl2.Text + '''');
               Query1.SQL.Add(' AND paygr between '+CBpaygr1.Text + ' AND ' + CBpaygr2.Text+' ');
               Query1.ExecSQL;
          end
          else
          begin
               Query1.SQL.Clear;
               Query1.Close;
               Query1.SQL.Add('Update pkcigtbl p ');
               if SamePaynum = True then
                  Query1.SQL.Add('set basicamt = round((basicamt * :L1 /100 + basicamt),-1) ')
               else
               begin
                    Query1.SQL.Add('SET basicamt = (select round((basicamt * :L1 /100 + basicamt),-1) ');
                    Query1.SQL.Add('                from pkcigtbl r' );
                    Query1.SQL.Add('                where paynum = :L2 AND ');
                    Query1.SQL.Add('                      p.paycl=r.paycl and p.paygr=r.paygr)');
                    Query1.ParamByName('L2').AsString := CBpaynum.Text;
               end;
               Query1.SQL.Add(' WHERE paynum = :L3 ');
               Query1.SQL.Add(' AND paycl between :L4 AND :L5');
               Query1.SQL.Add(' AND paygr between :L6 AND :L7' );
               Query1.ParamByName('L1').AsFloat  := NErbasic.value;
               Query1.ParamByName('L3').AsString := Epaynum.Text;
               Query1.ParamByName('L4').AsString := CBpaycl1.Text;
               Query1.ParamByName('L5').AsString := CBpaycl2.Text;
               Query1.ParamByName('L6').AsString := CBpaygr1.Text;
               Query1.ParamByName('L7').AsString := CBpaygr2.Text;
               Query1.ExecSQL;
          end;
     end;

     if CBextamt.Checked = True then
     begin
          Phelpmsg.Caption := '시간당 연장급을 setting 중...';
          Application.ProcessMessages;
          if RBsextamt.Checked = True then
          begin
               Query1.SQL.Clear;
               Query1.Close;
               Query1.SQL.Add('Update pkcigtbl ');
               Query1.SQL.Add('SET extamt = '''+FloatToStr(NEsextamt.value)+''' ');
               Query1.SQL.Add(' WHERE paynum = '''+ Epaynum.Text + '''');
               Query1.SQL.Add(' AND paycl between '''+CBpaycl1.Text + ''' AND ''' + CBpaycl2.Text + ''' ');
               Query1.SQL.Add(' AND paygr between '''+CBpaygr1.Text + ''' AND ''' + CBpaygr2.Text +''' ');
               Query1.ExecSQL;
          end
          else
          begin
               Query1.SQL.Clear;
               Query1.Close;
               Query1.SQL.Add('Update pkcigtbl p ');
               if SamePaynum = True then
                  Query1.SQL.Add('set extamt = round((extamt * :L1 /100 + extamt),-1) ')
               else
               begin
                    Query1.SQL.Add('SET extamt = (select round((extamt * :L1 /100 + extamt),-1) ');
                    Query1.SQL.Add('                from pkcigtbl r' );
                    Query1.SQL.Add('                where paynum = :L2 AND ');
                    Query1.SQL.Add('                      p.paycl=r.paycl and p.paygr=r.paygr)');
                    Query1.ParamByName('L2').AsString := CBpaynum.Text;
               end;
               Query1.SQL.Add(' WHERE paynum = :L3 ');
               Query1.SQL.Add(' AND paycl between :L4 AND :L5');
               Query1.SQL.Add(' AND paygr between :L6 AND :L7' );
               Query1.ParamByName('L1').AsFloat  := NErextamt.value;
               Query1.ParamByName('L3').AsString := Epaynum.Text;
               Query1.ParamByName('L4').AsString := CBpaycl1.Text;
               Query1.ParamByName('L5').AsString := CBpaycl2.Text;
               Query1.ParamByName('L6').AsString := CBpaygr1.Text;
               Query1.ParamByName('L7').AsString := CBpaygr2.Text;
               Query1.ExecSQL;
          end;

     end;

      if CBnightamt.Checked = True then
     begin
          Phelpmsg.Caption := '시간당 야간급을 setting 중...';
          Application.ProcessMessages;
          if RBsnightamt.Checked = True then
          begin
               Query1.SQL.Clear;
               Query1.Close;
               Query1.SQL.Add('Update pkcigtbl ');
               Query1.SQL.Add('SET nightamt = '+FloatToStr(NEsnightamt.value) );
               Query1.SQL.Add(' WHERE paynum = '''+ Epaynum.Text + '''');
               Query1.SQL.Add(' AND paycl between '''+CBpaycl1.Text + ''' AND ''' + CBpaycl2.Text + '''');
               Query1.SQL.Add(' AND paygr between '+CBpaygr1.Text + ' AND ' + CBpaygr2.Text+'');
               Query1.ExecSQL;
          end
          else
          begin
               Query1.SQL.Clear;
               Query1.Close;
               Query1.SQL.Add('Update pkcigtbl p ');
               if SamePaynum = True then
                  Query1.SQL.Add('set nightamt = round((nightamt * :L1 /100 + nightamt),-1) ')
               else
               begin
                    Query1.SQL.Add('SET nightamt = (select round((nightamt * :L1 /100 + nightamt),-1) ');
                    Query1.SQL.Add('                from pkcigtbl r' );
                    Query1.SQL.Add('                where paynum = :L2 AND ');
                    Query1.SQL.Add('                      p.paycl=r.paycl and p.paygr=r.paygr)');
                    Query1.ParamByName('L2').AsString := CBpaynum.Text;
               end;
               Query1.SQL.Add(' WHERE paynum = :L3 ');
               Query1.SQL.Add(' AND paycl between :L4 AND :L5');
               Query1.SQL.Add(' AND paygr between :L6 AND :L7' );
               Query1.ParamByName('L1').AsFloat  := NErnightamt.value;
               Query1.ParamByName('L3').AsString := Epaynum.Text;
               Query1.ParamByName('L4').AsString := CBpaycl1.Text;
               Query1.ParamByName('L5').AsString := CBpaycl2.Text;
               Query1.ParamByName('L6').AsString := CBpaygr1.Text;
               Query1.ParamByName('L7').AsString := CBpaygr2.Text;
               Query1.ExecSQL;
          end;
     end;

     Phelpmsg.Caption := '작업을 완료하였습니다.';
     Application.ProcessMessages;
end;
procedure TFpaynum.BBcloseClick(Sender: TObject);
begin
  close;
end;

procedure TFpaynum.FormActivate(Sender: TObject);
begin
     Query1.SQL.Clear;
     Query1.Close;
     Query1.SQL.Add('SELECT DISTINCT  PAYNUM FROM PKCIGTBL ORDER BY PAYNUM DESC');
     Query1.open;
     CBpaynum.Items.Clear;
     CBpaynum.Text := Query1.FieldByName('PAYNUM').AsString;
     while not Query1.EOF do
     begin
          CBpaynum.Items.Add(Query1.FieldByName('PAYNUM').AsString);
          Query1.next;
     end;

     Query1.Close;
     Query1.SQL.Clear;
     Query1.SQL.Add('SELECT DISTINCT  PAYCL FROM PKCIGTBL ');
     Query1.SQL.Add('WHERE PAYNUM = '''+CBpaynum.Text+'''    ');
     CBpaycl1.Items.Clear;
     CBpaycl2.Items.Clear;
     Query1.Open;
     CBpaycl1.Text := Query1.FieldByName('PAYCL').AsString;
     while not Query1.EOF do
     begin
          CBpaycl1.Items.Add(Query1.FieldByName('PAYCL').AsString);
          CBpaycl2.Items.Add(Query1.FieldByName('PAYCL').AsString);
          CBpaycl2.Text := Query1.FieldByName('PAYCL').AsString;
          Query1.Next;
     end;

     Query1.Close;
     Query1.SQL.Clear;
     Query1.SQL.Add('SELECT DISTINCT  PAYGR FROM PKCIGTBL ');
     Query1.SQL.Add('WHERE PAYNUM = '''+CBpaynum.Text+'''    ');
     CBpaygr1.Items.Clear;
     CBpaygr2.Items.Clear;
     Query1.Open;
     CBpaygr1.Text := Query1.FieldByName('PAYGR').AsString;
     while not Query1.EOF do
     begin
          CBpaygr1.Items.Add(Query1.FieldByName('PAYGR').AsString);
          CBpaygr2.Items.Add(Query1.FieldByName('PAYGR').AsString);
          CBpaygr2.Text := Query1.FieldByName('PAYGR').AsString;
          Query1.Next;
     end;
end;

end.
