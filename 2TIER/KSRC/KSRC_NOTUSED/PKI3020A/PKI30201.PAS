{* ======================= Program Header ======================================

 PROGRAM-NAME   : PKI3020A(운전 지원금 신청)
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME : 지원금
 Programmer     : 윤형식
 Version        : 30.00
 Date           : 1998.12.30

Update Contents
   Version    date(yy.mm.dd)     programmer      description     relevant doc.no
   1.00       1997.12.01         이인환          최초개발본      설계명세서
   10.04      1998.08.18         이랑교          paygr(호봉)을 setting안함
   30.00      1998.12.30         윤형식          직위/직급수정   하나로인사재개발
============================================================================= *}
unit pki30201;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, ExtCtrls, Buttons, DB, DBTables, MemDS,
  DBAccess, Ora, Func, KeyEmpNo, Kylib1, Calen1, OraSmart, Grids, DBGrids, userhelp;

  {SysUtils, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Grids, DBGrids, DB, StdCtrls, Buttons, ExtCtrls,
  Mask, DBCtrls, ComCtrls, userhelp, Calen1, Kylib1,
  Ora, Func, KeyEmpNo, MemDS, DBAccess, OraSmart, DBTables;//kyempno,DBTables,TabNotBk,Pass,WinTypes, WinProcs,}

type
  TFpki30201 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Eempno: TEdit;
    BBempno: TBitBtn;
    Epaycl: TEdit;
    DataSource1: TDataSource;
    BBhelp: TBitBtn;
    BBclose: TBitBtn;
    BBsearch: TBitBtn;
    Ekorname: TEdit;
    Panel3: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    DBElicedate: TDBEdit;
    DBEliceno: TDBEdit;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    DBEcardate: TDBEdit;
    DBEcarkind: TDBEdit;
    DBEcarno: TDBEdit;
    BBapply: TBitBtn;
    BBsave: TBitBtn;
    DataSource4: TDataSource;
    Panel29: TPanel;
    BBcancel: TBitBtn;
    BBdelete: TBitBtn;
    DBGrid1: TDBGrid;
    BBmodify: TBitBtn;
    SBanfrdate: TSpeedButton;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    Lempno: TLabel;
    Lsysdate: TLabel;
    Panel6: TPanel;
    DBCcarowner: TDBComboBox;
    DBElicegr: TDBComboBox;
    Table1: TOraTable;
    Table3: TOraTable;
    Table4: TOraTable;
    Table1EMPNO: TStringField;
    Table1KORNAME: TStringField;
    Table1PAYCL: TStringField;
    Table1PAYGR: TIntegerField;
    Table1DRVKIND: TStringField;
    Table1APPNO: TIntegerField;
    Table1APPDATE: TStringField;
    Table1APPEMP: TStringField;
    Table1LICEDATE: TStringField;
    Table1LICEGR: TStringField;
    Table1LICENO: TStringField;
    Table1CARDATE: TStringField;
    Table1CARKIND: TStringField;
    Table1CARNO: TStringField;
    Table1CHKYN: TStringField;
    Table1GIVEYN: TStringField;
    Table1GIVEAMT: TIntegerField;
    Table1GIVEDATE: TStringField;
    Table1WRITETIME: TStringField;
    Table1WRITEMAN: TStringField;
    Table1CAROWNER: TStringField;
    Table4EMPNO: TStringField;
    Table4KORNAME: TStringField;
    Table4PAYCL: TStringField;
    Table4LICEDATE: TStringField;
    Table4LICEGR: TStringField;
    Table4LICENO: TStringField;
    Table4CARDATE: TStringField;
    Table4CARKIND: TStringField;
    Table4CARNO: TStringField;
    Query1: TOraQuery;
    Table1appkind: TStringField;
    procedure BBcloseClick(Sender: TObject);
    procedure BBapplyClick(Sender: TObject);
    procedure Table1NewRecord(DataSet: TDataset);
    procedure BBsaveClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BBcancelClick(Sender: TObject);
    procedure BBdeleteClick(Sender: TObject);
    procedure BBempnoClick(Sender: TObject);
    procedure BBmodifyClick(Sender: TObject);
    procedure EempnoEnter(Sender: TObject);
    procedure SBanfrdateClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BBsearchClick(Sender: TObject);
    function  GetDeptcode(empno : String) : integer;
    procedure EempnoKeyPress(Sender: TObject; var Key: Char);
    procedure BBhelpClick(Sender: TObject);
  private
    function GetTime : Integer;
    function SetEmpTime : Integer;
    procedure ChangeEmp;
  public
{===============================================================================
   Version    date(yy.mm.dd)     programmer     description           relevant doc.no
   30.00      1998.12.30         윤형식         직위/직급수정         하나로인사재개발
================================================================================}
// 삭제
//        paygr : String;
  end;

var
  Fpki30201: TFpki30201;
  GSsysdate : String;
  GSdeptcode : String;
  paynum : String;

implementation

uses pki30202,  pki30203;

{$R *.DFM}

function  TFpki30201.GetTime;
begin
     Query1.Close;
     Query1.SQL.Clear;
     Query1.SQL.ADD(' SELECT TO_CHAR(SYSDATE,''YYYYMMDDHH24MISSD'') a ');
     Query1.SQL.ADD('   FROM DUAL ');
     Query1.Open;
end;

// 급여마스터 (PKMPMAS )  =>  인사마스터(PIMPMAS)로 변경
function  TFpki30201.GetDeptcode(empno : String) : integer;
begin
     Query1.Close;
     Query1.SQL.Clear;
//     Query1.SQL.Add('select deptcode from pkmpmas where empno = :L1');   LEERK  98.05.04
     Query1.SQL.Add('select deptcode from PIMPMAS where empno = :L1');
     Query1.ParamByName('L1').AsString := empno;
     Query1.Open;

     if Query1.RecordCount = 0 then
     begin
          Application.MessageBox('인사마스터에 존재하지 않습니다. 인사과에 확인 후 작업하십시요','작업안내',MB_OK);
          GetDeptcode := -1;
     end
     else
         GSdeptcode := Query1.FieldByName('deptcode').AsString;
end;

function  TFpki30201.SetEmpTime;
begin
     OraConnect;
     Application.ProcessMessages;
     Lempno.Caption := Pkorname+'('+Pempno+')';

     Table1.Active := True;
     Table3.Active := True;
     Table4.Active := True;

     GetTime;
     GSsysdate := Query1.FieldByName('a').AsString;
     Lsysdate.caption := copy(GSsysdate,1,4)+'/'+copy(GSsysdate,5,2)+'/'+copy(GSsysdate,7,2);
end;

procedure TFpki30201.BBcloseClick(Sender: TObject);
begin
     close;
end;

procedure TFpki30201.BBapplyClick(Sender: TObject);
begin
     Fpki30202.Eempno.Text    := Eempno.Text;
     Fpki30202.Ekorname.Text  := Ekorname.Text;
     //Fpki30202.paygr        := paygr;
//     Fpki30202.GSpaycl        := paycl;     
     Fpki30202.Eappemp.Text   := Eempno.Text;
     Fpki30202.MElicedate.Text:= Table4LICEDATE.value;
     Fpki30202.Elicegr.Text   := Table4LICEGR.value;
     Fpki30202.Eliceno.Text   :=Table4LICENO.value;
     Fpki30202.MEcardate.Text :=Table4CARDATE.value;
     Fpki30202.Ecarkind.Text  := Table4CARKIND.value;
     Fpki30202.Ecarno.Text    :=Table4CARNO.value;
     Fpki30202.ShowModal;
     Table1.Refresh;
end;

procedure TFpki30201.Table1NewRecord(DataSet: TDataset);
begin
     Table1.FieldByName('EMPNO').AsString   := Eempno.Text;
     Table1.FieldByName('KORNAME').AsString := Ekorname.Text;
     Table1.FieldByName('PAYCL').AsString   := Epaycl.Text;
{===============================================================================
   Version    date(yy.mm.dd)     programmer     description           relevant doc.no
   30.00      1998.12.30         윤형식         직위/직급수정         하나로인사재개발
================================================================================}
// 삭제
//     Table1.FieldByName('PAYGR').AsString   := Epaygr.Text;

     Table1.FieldByName('GIVEYN').AsString  := 'N';
end;

procedure TFpki30201.BBsaveClick(Sender: TObject);
begin
     if Table1.Modified = True then
     begin
          if fn_IsDate(copy(DBElicedate.Text,1,8)) = False then
          begin
               Application.MessageBox('면허취득일을 정확히 입력하세요','작업안내',MB_OK);
               DBElicedate.SetFocus;
               exit;
          end;
          Table1.FieldByName('writetime').AsString := copy(GSsysdate,1,12) ;
          Table1.FieldByName('writeman').AsString  := Pempno ;
          Table1.Post;
     end;

     Eempno.Enabled := True;
     BBapply.Enabled  := True;
     BBdelete.Enabled := True;
     BBsearch.Enabled := True;
     BBhelp.Enabled   := True;
     BBclose.Enabled  := True;
     BBempno.Enabled  := True;

     DBElicedate.Enabled := False;
     DBElicegr.Enabled   := False;
     DBEliceno.Enabled   := False;
     DBEcardate.Enabled  := False;
     DBCcarowner.Enabled := False;
     DBEcarkind.Enabled  := False;
     DBEcarno.Enabled    := False;
     DBGrid1.Enabled     := True;

end;

procedure TFpki30201.FormActivate(Sender: TObject);
begin
     SetEmpTime;
     GetDeptcode(Pempno);
     Query1.Close;
     Query1.SQL.Clear;
{===============================================================================
   Version    date(yy.mm.dd)     programmer     description           relevant doc.no
   30.00      1998.12.30         윤형식         직위/직급수정         하나로인사재개발
================================================================================}
//     Query1.SQL.Add('select korname,paycl,deptcode,paygr,paynum from pkmpmas where empno='''+GSempno+'''');
     Query1.SQL.Add('select korname,paycl,deptcode,      paynum from pkmpmas where empno='''+Pempno+'''');

     Query1.Open;
     Eempno.Text := Pempno;
     Ekorname.Text := Query1.FieldByName('KORNAME').AsString;
     Epaycl.Text := Query1.FieldByName('PAYCL').AsString;
{===============================================================================
   Version    date(yy.mm.dd)     programmer     description           relevant doc.no
   30.00      1998.12.30         윤형식         직위/직급수정         하나로인사재개발
================================================================================}
// 삭제
//   Epaygr.Text := Query1.FieldByName('PAYgr').AsString;
//   paygr := Epaygr.Text;

//     paynum := Query1.FieldByName('PAYNUM').AsString;

     Query1.Close;
     Query1.SQL.Clear;
     Query1.SQL.Add('select cpaynum from pkcpbas ');
     Query1.Open;
     paynum := Query1.FieldByName('CPAYNUM').AsString;

     Table1.cancel;
     Table1.Filter := 'empno = ''' + Eempno.Text + '''';
     Table1.Filtered := True;

     //Table1.SetRange([Eempno.Text,'0'],[Eempno.Text,'3']);
     DBGrid1.SetFocus;

end;

procedure TFpki30201.BBcancelClick(Sender: TObject);
begin
     if Table1.Modified = True then
          Table1.Cancel;
     Eempno.Enabled := True;
     BBapply.Enabled  := True;
     BBdelete.Enabled := True;
     BBsearch.Enabled := True;
     BBhelp.Enabled   := True;
     BBclose.Enabled  := True;
     BBempno.Enabled := True;

     DBElicedate.Enabled := False;
     DBElicegr.Enabled := False;
     DBEliceno.Enabled := False;
     DBEcardate.Enabled := False;
     DBCcarowner.Enabled := False;
     DBEcarkind.Enabled := False;
     DBEcarno.Enabled := False;
     DBGrid1.Enabled := True;
     DBGrid1.SetFocus;
end;

procedure TFpki30201.BBdeleteClick(Sender: TObject);
begin
     Query1.Close;
     Query1.SQL.Clear;
     Query1.SQL.Add('select empno from pkmdrapp where empno='''+Eempno.Text+'''');
     Query1.Open;

     if Query1.RecordCount = 0 then
     begin
          Application.MessageBox('삭제할 자료가 없습니다','작업안내',MB_OK);
          exit;
     end;

     if Table1GIVEYN.value = 'Y' then
     begin
          Application.MessageBox('이미 품의가 끝난 자료에 대해서는 작업할 수 없습니다','작업안내',MB_OK);
          exit;
     end;

     if Application.MessageBox('삭제하시겠습니까?','작업안내',MB_YesNo) = ID_Yes then
               Table1.delete;

end;

procedure TFpki30201.BBempnoClick(Sender: TObject);
begin
     Fkeyempno := TFkeyempno.Create(Self);

     Try
        Fkeyempno.Edempno.Text := Eempno.Text;
        Fkeyempno.ShowModal;
        if Fkeyempno.CloseChk = -1 then
           Exit;

        Eempno.Text := Fkeyempno.v_KeyEmpno;
        ChangeEmp;

        {******************
         if (GSgrade > 'B') and (copy(GSdeptcode,1,3) <> copy(Fkyempno.GSdeptcodeS,1,3)) then
          begin
               Application.MessageBox('귀하는 권한이 없습니다','작업안내',MB_OK);
               Eempno.Text := Table1.FieldByName('empno').AsString;
               exit;
          end;
        {******************}
          Eempno.Text := Fkeyempno.v_KeyEmpno;
          Ekorname.Text := Fkeyempno.v_KeyKorname;
     Finally
        Fkeyempno.Free;
     end;
     BBempno.Enabled := True;
     BBempno.SetFocus;

end;

procedure TFpki30201.BBmodifyClick(Sender: TObject);
begin
    if Table1.RecordCount = 0 then
     begin
          Application.MessageBox('수정할 자료가 없습니다','작업안내',MB_OK);
          exit;
     end;

     if Table1GIVEYN.value = 'Y' then
     begin
          Application.MessageBox('이미 품의가 끝난 자료에 대해서는 작업할 수 없습니다','작업안내',MB_OK);
          exit;
     end;

     DBElicedate.Enabled := True;
     DBElicegr.Enabled := True;
     DBEliceno.Enabled := True;
     DBEcardate.Enabled := True;
     DBCcarowner.Enabled := True;
     DBEcarkind.Enabled := True;
     DBEcarno.Enabled := True;
     DBGrid1.Enabled := False;
     DBElicedate.SetFocus;

     Eempno.Enabled := False;
     BBempno.Enabled := False;
     BBapply.Enabled := False;
     BBdelete.Enabled := False;
     BBsearch.Enabled := False;
     BBhelp.Enabled := False;
     BBclose.Enabled := False;
end;

procedure TFpki30201.EempnoEnter(Sender: TObject);
begin
     BBmodify.Enabled := False;
     BBsave.Enabled   := False;
     BBcancel.Enabled := False;
     BBapply.Enabled  := False;
     BBdelete.Enabled := False;
     BBsearch.Enabled := False;
end;

procedure TFpki30201.SBanfrdateClick(Sender: TObject);
begin
     if DBElicedate.Enabled = False then
        exit;

     Table1.Edit;
     Calendar := TCalendar.Create(Self);
     Try
        Calendar.ShowModal;
        Table1LICEDATE.value := Calendar.DayCaption;
     Finally
        Calendar.Free;
     end;
end;

procedure TFpki30201.SpeedButton1Click(Sender: TObject);
begin
     if DBEcardate.Enabled = False then
        exit;

     Table1.Edit;
     Calendar := TCalendar.Create(Self);
     Try
        Calendar.ShowModal;
        Table1CARDATE.value := Calendar.DayCaption;
     Finally
        Calendar.Free;
     end;
end;

procedure TFpki30201.BBsearchClick(Sender: TObject);
begin
     Try
     Fpki30203 := TFpki30203.Create(Self);
     Fpki30203.ShowModal;
     Finally
     Fpki30203.Free;
     end;
end;

procedure TFpki30201.EempnoKeyPress(Sender: TObject; var Key: Char);
begin
     if (key = #13) then
     begin
          ChangeEmp;
          Table1.cancel;
          Table1.Filter := 'empno = ''' + Eempno.Text + '''';
          Table1.Filtered := True;
     end;
end;

procedure TFpki30201.ChangeEmp;
begin
     Query1.Close;
     Query1.SQL.Clear;
{===============================================================================
   Version    date(yy.mm.dd)     programmer     description           relevant doc.no
   30.00      1998.12.30         윤형식         직위/직급수정         하나로인사재개발
================================================================================}
//     Query1.SQL.Add('select empno,korname,paycl,paygr,deptcode ');
     Query1.SQL.Add('select empno,korname,paycl,      deptcode ');

     Query1.SQL.Add('from pkmpmas ');
     Query1.SQL.Add('where empno like :L1 or korname like :L1');
     Query1.ParamByName('L1').AsString := Eempno.Text+'%';

     Query1.Open;

     if Query1.RecordCount = 0 then
     begin
          Application.MessageBox('존재하지 않는 사번입니다','작업안내',MB_OK);
          Eempno.Text := Table1.FieldByName('empno').AsString;            ;
          exit;
     end
     else if Query1.RecordCount = 1 then
     begin
          {*************  leerk 98.05 임시직 사원이 주로 입력하는데 입력이 불가하여 주석처리
          if (GSgrade > 'B') and (copy(GSdeptcode,1,3) <> copy(Query1.FieldByName('deptcode').AsString,1,3)) then
          begin
               Application.MessageBox('귀하는 권한이 없습니다','작업안내',MB_OK);
               Eempno.Text := Table1.FieldByName('empno').AsString;
               exit;
          end;
          *********}
          Eempno.Text   := Query1.FieldByName('EMPNO').AsString;
          Ekorname.Text := Query1.FieldByName('KORNAME').AsString;
          Epaycl.Text   := Query1.FieldByName('PAYCL').AsString;
{===============================================================================
   Version    date(yy.mm.dd)     programmer     description           relevant doc.no
   30.00      1998.12.30         윤형식         직위/직급수정         하나로인사재개발
================================================================================}
// 삭제
//          Epaygr.Text   := Query1.FieldByName('PAYGR').AsString;
//          paygr := Epaygr.Text;

          //Table1.SetRange([Eempno.Text,'0'],[Eempno.Text,'3']);

          if(Table4.Active = False) then
              Table4.Active := True;


//          Table4.SetKey;
//          Table4.FieldByName('EMPNO').AsString := Eempno.Text;
          {if(Table4.GotoKey = False) then
              Table4.Active := False;}
          if Table4.Locate('EMPNO',Eempno.Text,[]) = False then
              Table4.Active := False;

          BBmodify.Enabled := True;
          BBsave.Enabled   := True;
          BBcancel.Enabled := True;
          BBapply.Enabled  := True;
          BBdelete.Enabled := True;
          BBsearch.Enabled := True;
     end
     else
     begin
          BBempnoClick(Eempno);
     end;
end;

procedure TFpki30201.BBhelpClick(Sender: TObject);
var
  HelpForm: THelpForm;
begin
  try
    HelpForm := THelpForm.Create(Self);
    HelpForm.ProgramId := 'PKI3020A';
    HelpForm.ShowModal;
  finally
    HelpForm.Free;
  end;
end;

end.
