unit PKW20901;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, DB, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons, DBCtrls, Pass,
  DBCGrids, Mask, DBAccess, Ora, MemDS, OraSmart,  KeyEmpnoY, Func;

type
  TFPKW2090A = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    BBexit: TBitBtn;
    BB_delete: TBitBtn;
    BBinsert: TBitBtn;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    DBEempno: TDBEdit;
    DBEkorname: TDBEdit;
    DBEanuselfamt: TDBEdit;
    BBsave: TBitBtn;
    BBcancel: TBitBtn;
    Lempno: TLabel;
    Lsysdate: TLabel;
    OraTable1: TOraTable;
    OraTable1EMPNO: TStringField;
    OraTable1KORNAME: TStringField;
    OraTable1ANUSELFAMT: TIntegerField;
    SB_EmpNo: TSpeedButton;
    procedure BBexitClick(Sender: TObject);
    procedure BB_deleteClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BBinsertClick(Sender: TObject);
    procedure BBsaveClick(Sender: TObject);
    procedure BBcancelClick(Sender: TObject);
    procedure SB_EmpNoClick(Sender: TObject);
  private
    { Private declarations }
    function SetEmpTime : Integer;
  public
    { Public declarations }
  end;

var
  FPKW2090A: TFPKW2090A;
  Psysdate : String;

implementation

{$R *.DFM}

function  TFPKW2090A.SetEmpTime;
begin
     Application.ProcessMessages;

     OraConnect; //DB_Connect : Func.pas 사용

     Lempno.Caption := Pkorname + '(' + Pempno+')';

     Psysdate := fn_GetDateTimeStr;
     Lsysdate.caption := fn_GetDateStr;

     OraTable1.Session := Ora_Session;
     OraTable1.Active := True;
end;


procedure TFPKW2090A.FormActivate(Sender: TObject);
var
     qq : TOraQuery;
begin
     SetEmpTime;
     SB_EmpNo.Enabled := False;
     DBEempno.Enabled := False;
     DBEkorname.Enabled := False;




{     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     try
          with qq do
          begin
               Close;
               SQL.Clear;
               SQL.Add('select distinct taxnum, substr(writetime,1,4) ');
               SQL.Add('  from pkcptax                                ');
               SQL.Add(' order by substr(writetime,1,4)  desc         ');
               Open;
               CBtaxnum.Text := FieldByName('taxnum').AsString;

               First;
               while not eof do
               begin
                    CBtaxnum.items.add(FieldByName('taxnum').AsString);
                    Next;
               end;
               OraTable1.Filter := 'taxnum = ' + '''' + CBtaxnum.Text + '''';
               OraTable1.Filtered := True;
          end;
     finally
          qq.Free;
     end;}
end;

procedure TFPKW2090A.BBexitClick(Sender: TObject);
begin
     if OraTable1.Modified = True then
     begin
          if Application.MessageBox('내용이 변경되었습니다. 종료하시겠습니까?','작업안내', mb_YesNo) = IdYes then
          begin
               OraTable1.Cancel;
               Ora_Session.Free;
               Close;
          end;
     end
     else
     begin
          Ora_Session.Free;
          Close;
     end;
end;

procedure TFPKW2090A.BB_deleteClick(Sender: TObject);
var
     qq : TOraQuery;
begin
     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

//     ''+OraTable1EMPNO.value +''+ '사번 '+ ''''+OraTable1KORNAME.value +''''+
     try
          with qq do
          begin
               if MessageBox(handle,pChar( ''+ OraTable1EMPNO.value+ '' + ' '+''+ OraTable1KORNAME.value+ '' +  ' 자료를 삭제하겠읍니까?'),
                                           '작업확인',MB_YESNO) = IDYES then
               begin
                    OraTable1.Delete;
//                    OraTable1.Filter := 'EMPNO = ' + '''' + OraTable1EMPNO.value+ '''';
//                    OraTable1.Filtered := True;
                    DBGrid1.SetFocus;
               end;
          end;
     finally
          qq.Free;
     end;

     SB_EmpNo.Enabled := False;
     DBEempno.Enabled := False;
     DBEkorname.Enabled := False;     
end;

procedure TFPKW2090A.BBinsertClick(Sender: TObject);
var
     qq : TOraQuery;
begin
     SB_EmpNo.Enabled := True;
     DBEempno.Enabled := True;
     DBEkorname.Enabled := True;
     OraTable1.Insert;
{     OraTable1empno.value := '';
     OraTable1korname.value := '';
     OraTable1ANUSELFAMT.value := 0;}

end;

procedure TFPKW2090A.BBsaveClick(Sender: TObject);
var
     qq : TOraQuery;
begin
     DBgrid1.enabled := True;
     if OraTable1.Modified = True then
     begin
          qq := TOraQuery.Create(nil);
          qq.Session := Ora_Session;

          try
               with qq do
               begin
                    OraTable1.Edit;
                    OraTable1.Post;
                    
                    Close;
                    SQL.Clear;
                    SQL.Add('update PKMNPYMAS set writetime = to_char(sysdate,''yyyymmddhh24mi''),   ');
                    SQL.Add('                     writeman  = :writeman                              ');
                    SQL.Add(' where EMPNO = :empno                                               ');


                    ParamByName('writeman').AsString := Pempno;
                    ParamByName('empno'  ).AsString :=  OraTable1EMPNO.value;

                    ExecSQL ;

                    DBGrid1.SetFocus;
               end;
          finally
               qq.Free;
          end;
     end;
     SB_EmpNo.Enabled := False;
     DBEempno.Enabled := False;
     DBEkorname.Enabled := False;     

end;

procedure TFPKW2090A.BBcancelClick(Sender: TObject);
begin
     if OraTable1.Modified = True then OraTable1.cancel;
     SB_EmpNo.Enabled := False;
     DBEempno.Enabled := False;
     DBEkorname.Enabled := False;     
end;

procedure TFPKW2090A.SB_EmpNoClick(Sender: TObject);
begin
     Try
          FKeyEmpNoY := TFKeyEmpNoY.Create(Self);
          FKeyEmpNoY.EdEmpno.Text := DBEempno.Text;
          FKeyEmpNoY.ShowModal;

          if FKeyEmpNoY.CloseChk = 0 then
          begin
               DBEempno.Text := FKeyEmpNoY.v_KeyEmpno;
               DBEkorname.Text := FKeyEmpNoY.v_KeyKorname;
//               Get_Record(DBEkorname.Text);
          end;
     Finally
          FKeyEmpNoY.Free;
     end;
end;

end.
