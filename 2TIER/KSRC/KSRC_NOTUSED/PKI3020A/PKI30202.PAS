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
               Application.MessageBox('운전지원금 지급기준에 해당하지 않기 때문에 신청할수 없습니다',
                                 '작업안내',MB_OK);
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
               Application.MessageBox('면허취득신청횟수를 초과하기 때문에 신청할수 없습니다',
                                 '작업안내',MB_OK);
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
               Application.MessageBox('운전지원금 지급기준에 해당하지 않기 때문에 신청할수 없습니다',
                                 '작업안내',MB_OK);
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
               Application.MessageBox('시내연수신청횟수를 초과하기 때문에 신청할수 없습니다',
                                 '작업안내',MB_OK);
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
   30.00      1998.12.30         윤형식         직위/직급수정         하나로인사재개발
================================================================================
// 호봉표(pkcptbl)는 없어짐. --> 차후 고려 요망
          Query1.close;
          Query1.SQL.Clear;
          Query1.SQL.Add('select odamt from pkcptbl                        ');
{===============================================================================
   Version    date(yy.mm.dd)     programmer     description           relevant doc.no
   30.00      1998.12.30         윤형식         직위/직급수정         하나로인사재개발
================================================================================
//          Query1.SQL.Add('where paycl = :L1 and paygr =:L2 and paynum = :L3');
          Query1.SQL.Add('where paycl = :L1                and paynum = :L3');
          Query1.ParamByName('L1').AsString := Fpki30201.Epaycl.Text;
{===============================================================================
   Version    date(yy.mm.dd)     programmer     description           relevant doc.no
   30.00      1998.12.30         윤형식         직위/직급수정         하나로인사재개발
================================================================================
// 삭제
//          Query1.ParamByName('L2').AsString := Fpki30201.paygr;
          Query1.ParamByName('L3').AsString := paynum;
          Query1.Open;
          if  Query1.FieldByName('odamt').AsFloat = 0 then
          begin
               Application.MessageBox('운전지원금 신청자격의 직급/호봉범위에 해당하지 않습니다. ',
                                 '작업안내',MB_OK);
               CBowndrv.Checked := False;
               exit;
          end;
================================================================================
================================================================================
 계약직중 대상자가 있어서 1999.12.16 leerk 
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
               '운전지원금 신청자격의 직급범위에 해당하지 않습니다. ',
                                 '작업안내',MB_OK);
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
               Application.MessageBox('자가운전 신청횟수를 초과하기 때문에 신청할수 없습니다',
                                 '작업안내',MB_OK);
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
          Application.MessageBox('신청구분을 먼저 선택하세요','작업안내',MB_OK);
          exit;
     end;

     if (CBlicence.Checked = True) or (CBcitydrv.Checked = True) or (CBowndrv.Checked = True) then
     begin
          if Eappemp.Text = '' then
          begin
               Application.MessageBox('신청인사번을 입력하세요','작업안내',MB_OK);
               Eappemp.SetFocus;
               exit;
          end;
          if length(MElicedate.Text) <> 8 then
           begin
               Application.MessageBox('면허취득일을 입력하세요','작업안내',MB_OK);
               MElicedate.SetFocus;
               exit;
          end;

          if DateCheck(copy(MElicedate.Text,1,4),copy(MElicedate.Text,5,2),copy(MElicedate.Text,7,2)) = -1 then
          begin
               Application.MessageBox('면허취득일을 정확히 입력하세요','작업안내',MB_OK);
               MElicedate.SetFocus;
               exit;
          end;
          if Elicegr.Text = '' then
          begin
               Application.MessageBox('면허종별을 입력하세요','작업안내',MB_OK);
               Elicegr.SetFocus;
               exit;
          end;
          if Eliceno.Text = '' then
          begin
               Application.MessageBox('면허번호를 입력하세요','작업안내',MB_OK);
               Eliceno.SetFocus;
               exit;
          end;
     end;

     if (CBowndrv.Checked = True) then
     begin
          if length(MEcardate.Text) <> 8 then
          begin
               Application.MessageBox('차량구입일을 정확히 입력하세요','작업안내',MB_OK);
               MEcardate.SetFocus;
               exit;
          end;

          if DateCheck(copy(MEcardate.Text,1,4),copy(MEcardate.Text,5,2),copy(MEcardate.Text,7,2)) = -1 then
          begin
               Application.MessageBox('차량구입일을 정확히 입력하세요','작업안내',MB_OK);
               MEcardate.SetFocus;
               exit;
          end;

          if trim(CBcarowner.Text) = '' then
          begin
               Application.MessageBox('차량소유자를 입력하세요','작업안내',MB_OK);
               CBcarowner.SetFocus;
               exit;
          end;

          if trim(Ecarkind.Text) = '' then
          begin
               Application.MessageBox('차량종류를 입력하세요','작업안내',MB_OK);
               Ecarkind.SetFocus;
               exit;
          end;
          if trim(Ecarno.Text) = '' then
          begin
               Application.MessageBox('차량번호를 입력하세요','작업안내',MB_OK);
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


