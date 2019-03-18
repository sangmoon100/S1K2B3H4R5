unit pkw20101;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, DBTables, Db, pebtnedit, Func;
  //pass,
type
  TFpkcigbas = class(TForm)
    Phelpmsg: TPanel;
    Panel3: TPanel;
    BBsave: TBitBtn;
    BBcancel: TBitBtn;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Panel5: TPanel;
    DBbonusrate: TPeJeonEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBbonusyn: TComboBox;
    Panel1: TPanel;
    Panel9: TPanel;
    Panel20: TPanel;
    Panel21: TPanel;
    Panel22: TPanel;
    Panel23: TPanel;
    Panel24: TPanel;
    Panel25: TPanel;
    Panel26: TPanel;
    Panel27: TPanel;
    Panel28: TPanel;
    Panel29: TPanel;
    Panel30: TPanel;
    Panel31: TPanel;
    DBcpaynum: TPeJeonEdit;
    DBctaxnum: TPeJeonEdit;
    DBcpaydate: TPeJeonEdit;
    DBbonusterm: TPeJeonEdit;
    DBtrainrate: TPeJeonEdit;
    DBigknteyymm: TPeJeonEdit;
    DBindirectrate: TPeJeonEdit;
    DBmcaramt: TPeJeonEdit;
    DBnightmealamt: TPeJeonEdit;
    DBsumstart: TPeJeonEdit;
    DBsumend: TPeJeonEdit;
    DBwinstart: TPeJeonEdit;
    DBwinend: TPeJeonEdit;
    procedure BBsaveClick(Sender: TObject);
    procedure BBcancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
    start : Boolean ;
    SelForm   : TForm;
  public
    { Public declarations }
    procedure Retrieve;
    Function  Check_Valid : Boolean;
  end;

var
  Fpkcigbas: TFpkcigbas;

implementation

uses pkw20104, pkw20103,pkw20201;

{$R *.DFM}

Function TFpkcigbas.Check_Valid : Boolean;
var
   temp   : Real;
   Buffer : String;
begin
  if  Length(DBcpaynum.text) < 2  then
  begin
     Application.MessageBox('현급호차수를 정확히 입력하세요','작업안내',MB_OK);
     Result := False;
     exit;
  end;

  if Length(DBctaxnum.text) < 2 then
  begin
     Application.MessageBox('현세율차수를 정확히 입력하세요','작업안내',MB_OK);
     Result := False;
     exit;
  end;

  if Length(DBcpaydate.text) < 6  then
  begin
     Application.MessageBox('현급여지급월을 정확히 입력하세요','작업안내',MB_OK);
     Result := False;
     exit;
  end;

  if DBbonusyn.text = '' then
  begin
     Application.MessageBox('상여지급여부를 입력하세요','작업안내',MB_OK);
     Result := False;
     exit;
  end;

  if (DBbonusterm.text = '') or (strtoint(DBbonusterm.text) <= 0) then
  begin
     Application.MessageBox('상여분할개월수를 입력하세요','작업안내',MB_OK);
     Result := False;
     exit;
  end;

  if  Length(DBbonusrate.text) < 2  then
  begin
     Application.MessageBox('상여 지급율을 정확히 입력하세요','작업안내',MB_OK);
     Result := False;
     exit;
  end;

  if ((Length(DBtrainrate.text) < 2) or (strtoint(DBtrainrate.text) <= 0)) then
  begin
     Application.MessageBox('수습사원지급율을 정확히 입력하세요','작업안내',MB_OK);
     Result := False;
     exit;
  end;

  if Length(DBindirectrate.text) < 2 then
  begin
     Application.MessageBox('간접비 지급율을 정확히 입력하세요','작업안내',MB_OK);
     Result := False;
     exit;
  end;

  if Length(DBmcaramt.text) < 4 then
  begin
     Application.MessageBox('1일 중식비를 정확히 입력하세요','작업안내',MB_OK);
     Result := False;
     exit;
  end;

  if Length(DBnightmealamt.text) < 4 then
  begin
     Application.MessageBox('1일 야근식대를 정확히 입력하세요','작업안내',MB_OK);
     Result := False;
     exit;
  end;

 with DM.Query1 do
 begin
    close;
    SQL.Clear;
    SQL.Add('select paynum from pkcigtbl where paynum = '''+ DBcpaynum.text +'''  ');
    Open;
  if RecordCount = 0 then
    begin
      Application.MessageBox('급여표에 해당급호차수가 없습니다.','작업안내',MB_OK);
      DBcpaynum.SetFocus;
      Result := False;
      exit;
    end;
 end;

     Buffer := DBCpaydate.Text;
     Buffer := Copy( Buffer,1,4 ) + DateSeparator + Copy( Buffer,5,2 ) + DateSeparator + '01';
     Try
     temp   := StrToDate( Buffer );
     Except on EConvertError do
         begin
              Application.MessageBox('급여지급월이 유효하지 않습니다...','작업안내',MB_OK);
              DBCpaydate.Text := '';
              DBCpaydate.SetFocus  ;
              Result := False;
              Exit;
         end;
     end;

     Buffer := DBigknteyymm.Text;
     Buffer := Copy( Buffer,1,4 ) + DateSeparator + Copy( Buffer,5,2 ) + DateSeparator + '01';
     Try
     temp   := StrToDate( Buffer );
     Except on EConvertError do
         begin
              Application.MessageBox('근태마감월이 유효하지 않습니다...','작업안내',MB_OK);
              DBigknteyymm.Text := '';
              DBigknteyymm.SetFocus  ;
              Result := False;
              Exit;
         end;
     end;

   Result := True ;
end;


procedure TFpkcigbas.retrieve;
begin
  with DM do
  begin
    Query1.Close;
    Query1.SQL.Clear;
    Query1.SQL.ADD(' SELECT * FROM PKCIGBAS ') ;
    Query1.Open ;
    DBcpaynum.text      :=  Query1.FieldByName('cpaynum').AsString;
    DBctaxnum.text      :=  Query1.FieldByName('ctaxnum').AsString;
    DBcpaydate.text     :=  Query1.FieldByName('cpaydate').AsString;
    DBbonusyn.text      :=  Query1.FieldByName('bonusyn').AsString;
    DBbonusrate.text    :=  Query1.FieldByName('bonusrate').AsString;
    DBbonusterm.text    :=  Query1.FieldByName('bonusterm').AsString;
    DBindirectrate.text :=  Query1.FieldByName('indirectrate').AsString;
    DBmcaramt.text      :=  Query1.FieldByName('mcaramt').AsString;
    DBnightmealamt.text :=  Query1.FieldByName('nightmealamt').AsString;
    DBtrainrate.text    :=  Query1.FieldByName('trainrate').AsString;
    DBigknteyymm.text   :=  Query1.FieldByName('igknteyymm').AsString;
    DBsumstart.text     :=  Query1.FieldByName('sumstarttime').AsString;
    DBsumend.text       :=  Query1.FieldByName('sumendtime').AsString;
    DBwinstart.text     :=  Query1.FieldByName('winstarttime').AsString;
    DBwinend.text       :=  Query1.FieldByName('winendtime').AsString;

    Query1.Close;
  end;
end;

procedure TFpkcigbas.BBsaveClick(Sender: TObject);
begin

  if Application.MessageBox('저장하시겠습니까?','작업안내',MB_YesNo)= IDNO then
    exit;

  if Check_Valid then
  begin
    Try
      with DM do
      begin
       Query1.Close;
       Query1.SQL.Clear;
       Query1.SQL.ADD(' UPDATE PKCIGBAS ') ;
       Query1.SQL.ADD(' SET CPAYNUM = '''+DBcpaynum.text+''', CTAXNUM = '''+DBctaxnum.text+''',                  ') ;
       Query1.SQL.ADD('     CPAYDATE = '''+DBcpaydate.text+''', BONUSYN = '''+DBbonusyn.text+''',                ') ;
       Query1.SQL.ADD('     bonusrate = '''+DBbonusrate.text+''', bonusterm = '''+DBbonusterm.text+''',          ') ;
       Query1.SQL.ADD('     indirectrate = '''+DBindirectrate.text+''', mcaramt = '''+DBmcaramt.text+''',        ') ;
       Query1.SQL.ADD('     nightmealamt = '''+DBnightmealamt.text+''', trainrate = '''+DBtrainrate.text+''',    ') ;
       Query1.SQL.ADD('     igknteyymm = '''+DBigknteyymm.text+''', sumstarttime = '''+DBsumstart.text+''',      ') ;
       Query1.SQL.ADD('     sumendtime = '''+DBsumend.text+''', winstarttime = '''+DBwinstart.text+''',          ') ;
       Query1.SQL.ADD('     winendtime = '''+DBwinend.text+''', writetime = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS''), writeman = '''+Pempno+''' ') ;
       Query1.EXECSQL ;
      end;
   except
       phelpmsg.caption := ' 저장작업에 실패했습니다. ' ;
       exit;
    end;
       phelpmsg.caption := ' 저장작업을 성공했습니다. ' ;
  end;
end;

procedure TFpkcigbas.BBcancelClick(Sender: TObject);
begin
    Retrieve;
end;

procedure TFpkcigbas.FormShow(Sender: TObject);
begin
  Start   := True;
  SelForm := nil;

  if Start then Start := not Start;

     Retrieve ;
end;

end.
