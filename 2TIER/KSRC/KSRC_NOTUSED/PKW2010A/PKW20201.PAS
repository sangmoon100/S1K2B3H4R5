unit pkw20201;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, ExtCtrls, Buttons, Mask, DBCtrls, DBTables, Db, pass;

type
  TFpkcigtbl = class(TForm)
    Phelpmsg: TPanel;
    Panel5: TPanel;
    BBinsert: TBitBtn;
    BBdelete: TBitBtn;
    BBsave: TBitBtn;
    BBcancel: TBitBtn;
    Panel10: TPanel;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    DBpaynum: TDBEdit;
    DBpaycl: TDBEdit;
    DBpaygr: TDBEdit;
    DBbasicamt: TDBEdit;
    DBextamt: TDBEdit;
    DBnightamt: TDBEdit;
    Label1: TLabel;
    Panel9: TPanel;
    CBpaynum: TComboBox;
    Panel18: TPanel;
    BBrun: TBitBtn;
    Panel11: TPanel;
    CBpaycl: TComboBox;
    procedure BBsaveClick(Sender: TObject);
    procedure BBcancelClick(Sender: TObject);
    procedure BBinsertClick(Sender: TObject);
    procedure BBdeleteClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBbasicamtKeyPress(Sender: TObject; var Key: Char);
    procedure CBpaynumChange(Sender: TObject);
    procedure BBrunClick(Sender: TObject);


  private
    { Private declarations }
   start : boolean ;
   SelForm   : TForm;
  public
    { Public declarations }
   Function DuplicateCheck : integer;
  end;

var
  Fpkcigtbl: TFpkcigtbl;

implementation

uses pkw20104, pkw20105;

{$R *.DFM}
Function TFpkcigtbl.DuplicateCheck : integer;
begin
     with DM do
       begin
        Query2.Close;
        Query2.SQL.Clear;
        Query2.SQL.ADD('SELECT PAYGR ');
        Query2.SQL.ADD('  FROM PKCIGTBL ');
        Query2.SQL.ADD(' WHERE (PAYNUM = :paynum) ');
        Query2.SQL.ADD('   AND (PAYCL  = :paycl) ');
        Query2.SQL.ADD('   AND (PAYGR  = :paygr) ');
        Query2.ParamByName('paynum').AsString := DBpaynum.Text;
        Query2.ParamByName('paycl').AsString := DBpaycl.Text;
        Query2.ParamByName('paygr').AsString := DBpaygr.Text;
        Query2.Open;
        If Query2.RecordCount > 0 then DuplicateCheck := -1 else DuplicateCheck := 0;
      end;
end;


procedure TFpkcigtbl.BBsaveClick(Sender: TObject);
begin

If DM.Table1.Modified = True then
begin

     If IDNO = Application.MessageBox('저장 하시겠습니까?',
                                  '저장작업안내', MB_YesNo) then Exit;

     If DBpaynum.text = '' then
        begin
         Application.MessageBox('호봉차수가 없습니다. 다시 입력하세요','작업안내',mb_ok) ;
         exit;
        end;

     If DBpaycl.text ='' then
        begin
         Application.MessageBox('BAND이 없습니다. 다시 입력하세요','작업안내',mb_ok) ;
         exit;
        end;

     If DBpaygr.text ='' then
        begin
         Application.MessageBox('호봉이 없습니다. 다시 입력하세요','작업안내',mb_ok) ;
         exit;
        end;


     If ((DBbasicamt.text ='') or (DBextamt.text ='') or (DBnightamt.text =''))  then
        begin
         Application.MessageBox('금액이 없습니다. 금액을 정확히 입력하세요','작업안내',mb_ok);
         exit;
        end;

     If DM.Table1.State = dsInsert then
       begin
       If DuplicateCheck = -1 then
          begin
           Application.MessageBox(pchar('호봉 '+DBpaygr.Text+'은 이미존재하는 호봉입니다. 확인하고 다시 입력하세요'),'작업안내',mb_ok);
           exit;
          end;
       end;

     DM.Table1.post;
     DBGrid1.Enabled := True;
     DBGrid1.SetFocus;
     DBpaynum.Enabled := False;
     DBpaycl.Enabled := False;
     DBpaygr.Enabled := False;
     DBpaynum.Color := clSilver;
     DBpaycl.Color := clSilver;
     DBpaygr.Color := clSilver;

     BBrun.Enabled := True;
     BBdelete.Enabled := True;

     phelpmsg.caption := ' 저장되었습니다. ';
 end
 else
  phelpmsg.caption := ' 변경된 자료가 없습니다. ';

end;


procedure TFpkcigtbl.BBcancelClick(Sender: TObject);
begin
    DM.Table1.cancel ;
    DBGrid1.Enabled := True;
    DBGrid1.SetFocus;
    BBdelete.Enabled := True;
    Label1.Visible := False;
    DBpaynum.Enabled := False;
    DBpaycl.Enabled := False;
    DBpaygr.Enabled := False;
    DBpaynum.Color := clSilver;
    DBpaycl.Color := clSilver;
    DBpaygr.Color := clSilver;

    BBrun.Enabled := True;
end;

procedure TFpkcigtbl.BBinsertClick(Sender: TObject);
var
paygr : Integer;
begin
     if DM.Table1.State <> dsInsert then
     begin
        Label1.visible := True;
        phelpmsg.caption := '입력 작업중... ';
        DM.Table1.Last ;

        paygr :=  DM.Table1.Fields[2].value ;

        DM.Table1.Append;
        DBGrid1.Enabled := False;
        DBpaynum.Enabled := True;
        DBpaycl.Enabled := True;
        DBpaygr.Enabled := True;

        DBpaynum.Color := clWindow;
        DBpaycl.Color := clWindow;
        DBpaygr.Color := clWindow;

        DBpaynum.SetFocus;
        DBpaynum.Text := CBpaynum.Text ;
        DBpaycl.Text := CBpaycl.Text;
        DBpaygr.Text := InttoStr(paygr + 1) ;

        BBdelete.Enabled := False;
        BBrun.Enabled := False;
     end;

end;


procedure TFpkcigtbl.BBdeleteClick(Sender: TObject);
begin
   if (Application.MessageBox('삭제 하시겠습니까','작업확인',MB_YesNo)=IDYES) then
     begin
     DM.Table1.delete;
     phelpmsg.caption := ' 삭제되었습니다. ';
     DBGrid1.Enabled := True;
     DBGrid1.SetFocus;
     end;
end;

procedure TFpkcigtbl.FormShow(Sender: TObject);
begin
  Start   := True;
  SelForm := nil;

  if Start then Start := not Start;
  with DM do
     begin
     Query1.SQL.Clear;
     Query1.Close;
     Query1.SQL.Add('SELECT DISTINCT  PAYNUM FROM PKCIGTBL ORDER BY PAYNUM DESC ');
     Query1.open;
     CBpaynum.Text := Query1.FieldByName('PAYNUM').AsString;
     while not Query1.EOF do
     begin
          CBpaynum.Items.Add(Query1.FieldByName('PAYNUM').AsString);
          Query1.next;
     end;
  end;

  with DM do
     begin
     Query3.SQL.Clear;
     Query3.Close;
     Query3.SQL.Add('SELECT DISTINCT  PAYCL FROM PKCIGTBL ORDER BY PAYCL DESC ');
     Query3.open;
     CBpaycl.Text := Query3.FieldByName('PAYCL').AsString;
     while not Query1.EOF do
     begin
          CBpaycl.Items.Add(Query3.FieldByName('PAYCL').AsString);
          Query3.next;
     end;
  end;

  DM.Table1.Active := True;
  DM.Table1.Filter := 'paynum = ''' +CBpaynum.Text+ '''';
  DM.Table1.Filtered := True;

  //DM.Table1.SetRange([CBpaynum.Text],[CBpaynum.Text]);

end;

procedure TFpkcigtbl.DBbasicamtKeyPress(Sender: TObject; var Key: Char);
begin
  DBGrid1.Enabled := False;
end;

procedure TFpkcigtbl.CBpaynumChange(Sender: TObject);
begin
     //DM.Table1.SetRange([CBpaynum.Text],[CBpaynum.Text]);
     DM.Table1.Filter := 'paynum = ''' +CBpaynum.Text+ '''';
     DM.Table1.Filtered := True;
end;

procedure TFpkcigtbl.BBrunClick(Sender: TObject);
begin
  Fpaynum.ShowModal;
end;

end.
