{* ======================= Program Header ======================================
 PROGRAM-NAME   : PKC4130A(급여계좌변경신청 결재)
 SYSTEM-NAME    : 급여
 SUBSYSTEM-NAME :
 Programmer     : 구해자
 Version        : 1.0
 Date           : 2012.08

Update Contents
   Version    date(yy.mm.dd)     programmer      description
    1.0       2012.08.23        구해자          
============================================================================= *}
unit PKC41301;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, pedbgrid, Buttons, Db, DBTables, pass, Mask,
  DBClient, ExtCtrls,FormMon1, Kylib1, Func, Ora, MemDS, DBAccess, OnDBGrid, KeyEmpno;

type
  TfpkC4130A = class(TForm)
    GroupBox1: TGroupBox;
    DataSource1: TDataSource;
    Panel1: TPanel;
    maintitle: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    ME_findmon: TMaskEdit;
    Lsysdate: TLabel;
    Lempno: TLabel;
    Panel16: TPanel;
    total_work: TLabel;
    SBfr: TSpeedButton;
    btn_save: TBitBtn;
    Query1: TOraQuery;
    btn_find_a: TBitBtn;
    OnDBGrid1: TOnDBGrid;
    Btn_exit: TBitBtn;
    Query2: TOraQuery;
    Eempno: TEdit;
    SBempno: TSpeedButton;
    P_korname: TPanel;

    procedure btn_find_aClick(Sender: TObject);
    procedure SBfrClick(Sender: TObject);
    procedure Btn_exitClick(Sender: TObject);
    procedure ME_findmonChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_saveClick(Sender: TObject);
    procedure Retrieve;
    procedure EempnoKeyPress(Sender: TObject; var Key: Char);
    procedure EempnoEnter(Sender: TObject);
    procedure SBempnoClick(Sender: TObject);



private
    { Private declarations }
    Curdate  : String;
public
    { Public declarations }
     chk_color   : array[1..5000] of char; //근태미등록선택
     chk_color_s : array[1..5000] of char; //근태미결재선택
  end;

var
    fpkC4130A: TfpkC4130A;

implementation

uses ComObj;
{$R *.DFM}


//-------------------------------main--------------------
procedure TfpkC4130A.Retrieve;
begin
     with Query1 do
     begin
          Close ;
          Sql.Clear ;
          Sql.Add('SELECT                                                                                ' +
                  '	to_char(to_date(B.APPDATE,''YYYYMMDD''),''YYYY-MM-DD'') APPDATE,                     ' +
                  '	A.EMPNO,                                                                             ' +
                  '	A.KORNAME,                                                                           ' +
                  '	B.PAYBANK,                                                                           ' +
                  '	(SELECT CODENAME FROM PYCCODE WHERE CODEID=''K910'' AND CODENO=B.PAYBANK)   PAYBANKM,' +
                  '	B.PAYACNT,                                                                           ' +
                  '	B.PAYBANK1,                                                                          ' +
                  '	(SELECT CODENAME FROM PYCCODE WHERE CODEID=''K910'' AND CODENO=B.PAYBANK1)  PAYBANKM1,' +
                  '	B.PAYACNT1,                                                                          ' +
                  '	B.PAYBANKC,                                                                          ' +
                  '	(SELECT CODENAME FROM PYCCODE WHERE CODEID=''K910'' AND CODENO=B.PAYBANKC)  PAYBANKCM,' +
                  '	B.PAYACNTC,                                                                          ' +
                  '	B.PAYBANKC1,                                                                         ' +
                  '	(SELECT CODENAME FROM PYCCODE WHERE CODEID=''K910'' AND CODENO=B.PAYBANKC1) PAYBANKCM1,' +
                  '	B.PAYACNTC1,                                                                         ' +
                  '	B.CONYN                                                                              ' +
                  'FROM PKMPMAS A, PKHACNTCHG B                                                          ' +
                  'WHERE A.EMPNO = B.EMPNO                                                               ' +
                  '  AND B.APPDATE LIKE '''+ME_findmon.text +'%''                                        ' +
                  '  AND A.EMPNO   LIKE '''+Eempno.Text     +'%''                                        ' +
                  ' ORDER BY 1,2,3' );
          //memo1.text := sql.text;
          Open;

          if query1.RecordCount <= 0 then
          begin
             total_work.Caption := '계좌변경 신청된 자료가 없습니다.' ;
             btn_save.Enabled := false;
             close;
             exit;
          end;
     end;  // End of(with Query1 do)
     btn_save.enabled   := true;
     total_work.Caption := '총 ' + inttostr(query1.recordcount)+'건이 조회되었습니다' ;

end;


//-------------------------------main--------------------
procedure TfpkC4130A.btn_find_aClick(Sender: TObject);
begin 
     Retrieve;
end;


procedure TfpkC4130A.SBfrClick(Sender: TObject);
var
     MonthForm : TMonthForm;
begin

    Try
        MonthForm := TMonthForm.Create(Self);
        MonthForm.ShowModal;
        if MonthForm.DayCaption <> '' then
        ME_findmon.Text := Copy(MonthForm.DayCaption,1,4)+Copy(MonthForm.DayCaption,5,2);
    Finally
        MonthForm.Free;
    End;
end;

procedure TfpkC4130A.Btn_exitClick(Sender: TObject);
begin
     close;
end;

procedure TfpkC4130A.ME_findmonChange(Sender: TObject);
begin
     query1.Close;
     total_work.Caption  := '';

end;

procedure TfpkC4130A.FormActivate(Sender: TObject);
begin
     Pempno   := PassEmp(cmdline,1);
     Pkorname := PassEmp(cmdline,2);
     Pgrade   := Passemp(cmdline,4);

     Application.ProcessMessages;

     if (Copy(Pgrade,3,1) > 'C') then
     begin
          MessageBox(handle,'관리자 권한 외에는 열람할 수 없습니다.','알 림',MB_OK or $0030);
          Close;
     end;

     btn_save.Enabled       := false;

     curdate := fn_GetDateTimeStr;

     //현재시간표시
     Lsysdate.caption := Fn_GetDateStr;
     Lempno.Caption := Pkorname + '(' + Pempno+')';

     ME_findmon.Text := copy(curdate,1,6) ;
     total_work.Caption := '';
end;

procedure TfpkC4130A.FormCreate(Sender: TObject);
begin
     OraConnect;
end;

procedure TfpkC4130A.btn_saveClick(Sender: TObject);
var
     qq,qq1 : TOraQuery;
begin
  if Trim(Query1.FieldByName('CONYN').AsString) = 'Y' then
  begin
    Application.MessageBox('결재완료된 자료입니다.',
                           '작업안내',MB_OK+mb_iconstop);
    exit;
  end;

  if MessageDlg('선택한 사원의 계좌변경을 결재 하시겠습니까?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
  begin
       total_work.Caption := '결재를 취소 하였습니다.';
       Exit;
  end;

     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     try
          with qq do
          begin
               Close;
               SQL.Clear;
               SQL.add('UPDATE PKMPMAS SET paybank   = '''+Query1.FieldByName('PAYBANKC').AsString+''', '+
                       '       payacnt  = '''+Query1.FieldByName('PAYACNTC').AsString+''', '+
                       '       paybank1  = '''+Query1.FieldByName('PAYBANKC1').AsString+''', '+
                       '       payacnt1 = '''+Query1.FieldByName('PAYACNTC1').AsString+''', '+
                       '       bankchtime= TO_CHAR(SYSDATE,''YYYYMMDDHH24mmss''), '+
                       '       bankchman= '''+Pempno+''' '+
                       ' WHERE empno = '''+Query1.FieldByName('EMPNO').AsString+''' ' );

               //memo1.text := sql.text;
               ExecSql;
          end;
     finally
          qq.Free;
     end;

     qq1 := TOraQuery.Create(nil);
     qq1.Session := Ora_Session;

     try
          with qq1 do
          begin
               Close;
               SQL.Clear;
               SQL.Add('UPDATE PKHACNTCHG                                ' +
                       'SET                                              ' +
                       '   CONYN      = ''Y'',                           ' +
                       '   CONYNDAY   = TO_CHAR(SYSDATE,''YYYYMMDD''),   ' +
                       '   CONYNEMPNO = '''+Pempno+'''                     ' +
                       'WHERE APPDATE = replace('''+Query1.FieldByName('APPDATE').AsString+''',''-'','''')                        ' +
                       '  AND EMPNO   = '''+Query1.FieldByName('EMPNO').AsString+'''                           ');

               //memo1.text := sql.text;
               ExecSql;

               total_work.Caption := ' 결재처리 되었습니다';
          end;
     finally
          qq1.Free;
     end;

     Retrieve;
end;

procedure TfpkC4130A.EempnoKeyPress(Sender: TObject; var Key: Char);
var
     qq : TOraQuery;
begin
     if Key = #13 then
     begin
          key := #0;

          qq := TOraQuery.Create(Nil);
          qq.Session := Ora_Session;

          Try
               with qq do
               begin
                    Close;
                    SQL.Clear;
                    SQL.Add('select empno                    ');
                    SQL.Add('  from pkmpmas                  ');
                    SQL.Add(' where (empno   like :empno or  ');
                    SQL.Add('        korname like :empno)    ');
                    ParamByName('empno').AsString := Eempno.Text + '%';

                    Open;

                    if RecordCount = 0 then
                    begin
                         MessageBox(handle,'해당사원이 존재하지 않습니다..','조회조건입력오류',MB_ICONWARNING);
                         Exit;
                    end
                    else if RecordCount = 1 then
                    begin
                         Eempno.Text := FieldByName('empno').AsString;
                         Retrieve;
                    end
                    else if RecordCount > 1 then
                    begin
                         FKeyEmpno := TFKeyEmpno.Create(Self);
                         Try
                              FKeyEmpno.EdEmpno.Text := Eempno.Text;
                              FKeyEmpno.ShowModal;

                              if FKeyEmpno.Closechk = -1 then Exit;

                              Eempno.Text := FKeyEmpno.v_KeyEmpno;
                              P_korname.caption := FKeyEmpno.v_KeyKorname;
                         Finally
                              FKeyEmpno.Free;
                         end;

                         Retrieve;
                    end;
               end;
          Finally
               qq.Free;
          end;
     end;
end;

procedure TfpkC4130A.EempnoEnter(Sender: TObject);
begin
     P_korname.caption     := '';

     Eempno.readonly := false;

     total_work.Caption := ' 사번, 성명 또는 주민번호를 선택 / 입력 후 Enter Key(조회)를 누르십시오.';
end;

procedure TfpkC4130A.SBempnoClick(Sender: TObject);
begin

     P_korname.caption     := '';

     Eempno.readonly := False;
     total_work.Caption := ' 사번이나,성명을 선택하세요.';


     FKeyEmpno := TFKeyEmpno.Create(Self);

     Try
         FKeyEmpno.ShowModal;
         If FKeyEmpno.Closechk = -1 then Exit;

         Eempno.Text := FKeyEmpno.v_KeyEmpno;
         P_korname.caption := FKeyEmpno.v_KeyKorname;
     Finally
         FKeyEmpno.Free;
     end;

     Retrieve;  //지정사번으로 조회


end;

end.
