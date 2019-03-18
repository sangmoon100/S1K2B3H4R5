unit PKG5010A1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, MemDS, DBAccess, Ora, ComCtrls, StdCtrls, OnFocusButton,
  ExtCtrls, OnScheme, OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl,
  OnEditCombo, OnEditMdate, FormMon1, OnShapeLabel, OnPopupEdit, Pass;  //Calen2 ==> FormMon1

type
  TMainForm = class(TForm)
    SF_Main: TOnSchemeForm;
    PA_BackWindow: TPanel;
    SB_Help: TStatusBar;
    Panel2: TPanel;
    BT_Save: TOnFocusButton;
    BT_Exit: TOnFocusButton;
    Ora_Qry1: TOraQuery;
    Ora_CodeName: TOraQuery;    
    Shape7: TShape;
    BE_Date1: TOnButtonEdit;
    BE_Date2: TOnButtonEdit;
    OnShapeLabel1: TOnShapeLabel;
    OnShapeLabel2: TOnShapeLabel;
    BE_Payra1: TOnButtonEdit;
    BE_Payra3: TOnButtonEdit;
    BE_Paycl1: TOnButtonEdit;
    BE_Payra2: TOnButtonEdit;
    BE_Payra4: TOnButtonEdit;
    BE_Paycl2: TOnButtonEdit;
    Panel1: TPanel;
    Panel3: TPanel;
    DateEd1: TOnDateEdit;
    DateEd2: TOnDateEdit;
    BE_empno: TOnButtonEdit;
    Panel4: TPanel;
    Panel5: TPanel;
    OnShapeLabel3: TOnShapeLabel;
    ED_EX_AMTHH1: TOnEdit;
    Panel6: TPanel;
    ED_EX_AMTHH2: TOnEdit;
    Panel7: TPanel;
    ED_EX_AMTHH3: TOnEdit;
    Panel8: TPanel;
    ED_EX_OVMCAMT: TOnEdit;
    Panel9: TPanel;
    ED_LIMITDAY: TOnEdit;
    Panel10: TPanel;
    ED_KIJUN11: TOnEdit;
    Panel11: TPanel;
    ED_KIJUN21: TOnEdit;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    ED_KIJUN12: TOnEdit;
    ED_KIJUN22: TOnEdit;
    OnEdit10: TOnEdit;
    ED_MONTHMM: TOnEdit;
    ED_MONTHHH: TOnEdit;
    L_CurDate: TLabel;
    Lempno: TLabel;
    BT_Search: TOnFocusButton;
    Panel15: TPanel;
    Ora_Save: TOraQuery;
    Ora_Session: TOraSession;

    procedure FormPaint(Sender: TObject);
    procedure BT_ExitClick(Sender: TObject);
    procedure BE_Date1ButtonClick(Sender: TObject;
      ButtonIndex: Integer);
    procedure BE_PayraFindClick(Sender: TObject; ButtonIndex: Integer);
    procedure BE_PayraFindPress(Sender: TObject; var Key: Char);
    procedure BE_PayclFindClick(Sender: TObject; ButtonIndex: Integer);
    procedure BE_PayclFindPress(Sender: TObject; var Key: Char);
    procedure BE_empnoButtonClick(Sender: TObject;
      ButtonIndex: Integer);
    procedure BT_SaveClick(Sender: TObject);
    procedure BT_SearchClick(Sender: TObject);
    procedure BE_Date1KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
    procedure BT_FindPayraClick(Sender: TObject);
    procedure BT_FindPayclClick(Sender: TObject);
    procedure PKCEXBAS_Load;
    function  GetTime : String;
    function  CodeNameFind(codeid : String; codeno : String) : String;
  public
    { Public declarations }
    GSpayra,   GSpaycl : String;
    GSsysdate, GSempno, GSkorname, GSgrade : String;
  end;

var
  MainForm: TMainForm;

implementation

uses Codelib, FMempno;

{$R *.DFM}

procedure TMainForm.FormCreate(Sender: TObject);
begin
  Application.ProcessMessages;
  SB_Help.Panels[1].Text := ' 데이타베이스에 접속중입니다...';

  Ora_Session.Options.Net   := True;
  Ora_Session.ConnectPrompt := False;
  Ora_Session.Username      := Passemp(cmdline,5);
  Ora_Session.Password      := Passemp(cmdline,6);
  Ora_Session.Server        := Passemp(cmdline,7)+':'+Passemp(cmdline,9)+':'+Passemp(cmdline,8);
  try
    Ora_Session.Connected  := True;
  except on E : Exception do
    Application.MessageBox(PChar('서버에 접속할 수 없습니다...'#13#13+
                                 E.Message),'알 림',MB_OK);
  end;
end;

procedure TMainForm.FormPaint(Sender: TObject);
begin
  SB_Help.Panels[1].Text := '';

  GetTime;
  L_CurDate.Caption  := copy(GSsysdate,1,4)+'/'+copy(GSsysdate,5,2)+'/'+copy(GSsysdate,7,2);
  GSempno   := Passemp(cmdline,1);
  GSkorname := Passemp(cmdline,2);
  GSgrade   := copy(Passemp(cmdline,4),3,1);
  Lempno.Caption := GSkorname+'('+GSempno+')';
end;

procedure TMainForm.BT_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.BE_Date1ButtonClick(Sender: TObject;
  ButtonIndex: Integer);
var
  FL_Date : String;
begin

    
    Try 
        MonthForm := TMonthForm.Create(Self); 
        MonthForm.ShowModal;    
        if MonthForm.DayCaption <> '' then              
           BE_Date1.Text := Copy(MonthForm.DayCaption,1,4)+' - '+Copy(MonthForm.DayCaption,5,2);

        with Ora_Qry1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add ( 'SELECT TO_CHAR(ADD_MONTHS(TO_DATE(:YYYYMM,''YYYYMM''),1),''YYYYMM'') D ');
          SQL.Add ( '  FROM DUAL');
          ParamByName('YYYYMM').AsString := MonthForm.DayCaption;
          Open;
          FL_Date := FieldByName('D').AsString;
          BE_Date2.Text := Copy(FL_Date,1,4)+' - '+Copy(FL_Date,5,2);
          Close;
        end;
                   
    Finally 
        MonthForm.Free; 
    End; 


{    Try      ci 변경 작업 kth
        Calendar2 := TCalendar2.Create(Self);
        Calendar2.ShowModal;
        BE_Date1.Text := Copy(Calendar2.Gsym,1,4)+' - '+Copy(Calendar2.Gsym,5,2);

        with Ora_Qry1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add ( 'SELECT TO_CHAR(ADD_MONTHS(TO_DATE(:YYYYMM,''YYYYMM''),1),''YYYYMM'') D ');
          SQL.Add ( '  FROM DUAL');
          ParamByName('YYYYMM').AsString := Calendar2.Gsym;
          Open;
          FL_Date := FieldByName('D').AsString;
          BE_Date2.Text := Copy(FL_Date,1,4)+' - '+Copy(FL_Date,5,2);
          Close;
        end;
    Finally
        Calendar2.Free;
    End;  }
end;

procedure TMainForm.BT_FindPayraClick;
begin
  codeForm := TCodeForm.Create(self);
  Try
    codeForm.FormData := '직책코드 열람';
    codeForm.DataVal1  := 'I113';
    codeForm.ShowModal;
    GSpayra := CodeForm.Code +' - '+ CodeForm.CodeName;
  Finally
    codeForm.Free;
  END;
end;

procedure TMainForm.BT_FindPayclClick;
begin
  codeForm := TCodeForm.Create(self);
  Try
    codeForm.FormData := 'BAND코드 열람';
    codeForm.DataVal1  := 'I112';
    codeForm.ShowModal;
    GSpaycl := CodeForm.Code +' - '+ CodeForm.CodeName;
  Finally
    codeForm.Free;
  END;
end;


procedure TMainForm.BE_empnoButtonClick(Sender: TObject;
  ButtonIndex: Integer);
begin
  empForm := TempForm.Create(self);
  Try
    empForm.ShowModal;
  if empForm.Empno <> '' then
    begin
      BE_empno.Text := empForm.Empno +' - '+ empForm.korname;
    end
  else
    begin
      BE_empno.Text   := '';
      BE_empno.setfocus;
    end;     
  Finally
    empForm.Free;
  End;
end;
                                  
procedure TMainForm.BE_PayraFindClick(Sender: TObject; ButtonIndex: Integer);
begin
  BT_FindPayraClick(Sender);
  TOnButtonEdit(Sender).Text := GSpayra;
end;

procedure TMainForm.BE_PayclFindClick(Sender: TObject; ButtonIndex: Integer);
begin
  BT_FindPayclClick(Sender);
  TOnButtonEdit(Sender).Text := GSpaycl;
end;

procedure TMainForm.BE_PayraFindPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    begin
      Key := #0;
      BT_FindPayraClick(Sender);
    end;
  TOnButtonEdit(Sender).Text := GSpayra;
end;

procedure TMainForm.BE_PayclFindPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    begin
      Key := #0;
      BT_FindPayclClick(Sender);
    end;
  TOnButtonEdit(Sender).Text := GSpaycl;
end;

procedure TMainForm.BT_SaveClick(Sender: TObject);
var
  cnt : Integer;
  SqlText_Int, SqlText_Up : String;
begin
  with Ora_Save do
  begin
    //현재 근무년월 기준데이터 존재여부 체크/.
    Close;
    SQL.Clear;
    SQL.Add ( 'SELECT COUNT(*) cnt FROM PKCEXBAS WHERE DUYYMM =:YYYYMM ');
    ParamByName('YYYYMM').AsString := Copy(BE_Date1.Text,1,4)+Copy(BE_Date1.Text,8,2);
    Open;
    cnt := FieldByName('cnt').AsInteger;
    Close;
  end;

  GetTime;
  with Ora_Save do
  begin
    Close;
    SQL.Clear;
    SqlText_Int := Format(' Insert into  PKCEXBAS  Values (         '+
                          ' ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', '+
                          ' ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', '+
                          ' ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', '+
                          ' ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', '+
                          ' ''%s'', ''%s'', ''%s'', ''%s'' )        ',
                          [Copy(BE_Date1.Text,1,4)+Copy(BE_Date1.Text,8,2),
                           Copy(BE_Date2.Text,1,4)+Copy(BE_Date2.Text,8,2),
//infra                           Copy(BE_Payra1.text,1,2),
//infra                           Copy(BE_Payra2.text,1,2),
//infra                           Copy(BE_Payra3.text,1,2),
//infra                           Copy(BE_Payra4.text,1,2),
//infra                           Copy(BE_Paycl1.text,1,2),
//infra                           Copy(BE_Paycl2.text,1,2),

                           Copy(BE_Payra1.text,1,3),
                           Copy(BE_Payra2.text,1,3),
                           Copy(BE_Payra3.text,1,3),
                           Copy(BE_Payra4.text,1,3),
                           Copy(BE_Paycl1.text,1,3),
                           Copy(BE_Paycl2.text,1,3),
                                                      
{                           Copy(BE_Payra1.text,1,2),
                           Copy(BE_Payra2.text,1,2),
                           Copy(BE_Payra3.text,1,2),
                           Copy(BE_Payra4.text,1,2),
                           Copy(BE_Paycl1.text,1,2),
                           Copy(BE_Paycl2.text,1,2),}
                           Copy(DateEd1.Text,1,4)+Copy(DateEd1.Text,6,2)+Copy(DateEd1.Text,9,2),
                           Copy(DateEd2.Text,1,4)+Copy(DateEd2.Text,6,2)+Copy(DateEd2.Text,9,2) ,
                           Copy(BE_empno.Text,1,4),
                           ED_LIMITDAY.Text,
                           ED_KIJUN11.Text,   ED_KIJUN12.Text,
                           ED_KIJUN21.Text,   ED_KIJUN22.Text,
                           ED_MONTHMM.Text,   ED_MONTHHH.Text,
                           ED_EX_AMTHH1.Text, ED_EX_AMTHH2.Text,
                           ED_EX_AMTHH3.Text, ED_EX_OVMCAMT.Text,
                           GSsysdate,         GSempno]);

    SqlText_Up  := Format(' Update PKCEXBAS SET     '+
                          '   PAYDATE    = ''%s'',  '+
                          '   PAYRA1     = ''%s'',  PAYRA2     = ''%s'',  '+
                          '   PAYRA3     = ''%s'',  PAYRA4     = ''%s'',  '+
                          '   PAYCL1     = ''%s'',  PAYCL2     = ''%s'',  '+
                          '   CONYMD1    = ''%s'',  CONYMD2    = ''%s'',  '+
                          '   MASTEREMP  = ''%s'',  LIMITDAY   = ''%s'',  '+
                          '   KIJUN11    = ''%s'',  KIJUN12    = ''%s'',  '+
                          '   KIJUN21    = ''%s'',  KIJUN22    = ''%s'',  '+
                          '   MONTHMM    = ''%s'',  MONTHHH    = ''%s'',  '+
                          '   EX_AMTHH1  = ''%s'',  EX_AMTHH2  = ''%s'',  '+
                          '   EX_AMTHH3  = ''%s'',  EX_OVMCAMT = ''%s'',  '+
                          '   WRITETIME  = ''%s'',  WRITEMAN   = ''%s''   '+
                          ' Where DUYYMM = ''%s''                         ',
                          [Copy(BE_Date2.Text,1,4)+Copy(BE_Date2.Text,8,2),
//infra                           Copy(BE_Payra1.text,1,2),
//infra                           Copy(BE_Payra2.text,1,2),
//infra                           Copy(BE_Payra3.text,1,2),
//infra                           Copy(BE_Payra4.text,1,2),
//infra                           Copy(BE_Paycl1.text,1,2),
//infra                           Copy(BE_Paycl2.text,1,2),

                           Copy(BE_Payra1.text,1,3),
                           Copy(BE_Payra2.text,1,3),
                           Copy(BE_Payra3.text,1,3),
                           Copy(BE_Payra4.text,1,3),
                           Copy(BE_Paycl1.text,1,3),
                           Copy(BE_Paycl2.text,1,3),
{                           Copy(BE_Payra1.text,1,2),
                           Copy(BE_Payra2.text,1,2),
                           Copy(BE_Payra3.text,1,2),
                           Copy(BE_Payra4.text,1,2),
                           Copy(BE_Paycl1.text,1,2),
                           Copy(BE_Paycl2.text,1,2),}
                           Copy(DateEd1.Text,1,4)+Copy(DateEd1.Text,6,2)+Copy(DateEd1.Text,9,2),
                           Copy(DateEd2.Text,1,4)+Copy(DateEd2.Text,6,2)+Copy(DateEd2.Text,9,2) ,
                           Copy(BE_empno.Text,1,4),
                           ED_LIMITDAY.Text,
                           ED_KIJUN11.Text,   ED_KIJUN12.Text,
                           ED_KIJUN21.Text,   ED_KIJUN22.Text,
                           ED_MONTHMM.Text,   ED_MONTHHH.Text,
                           ED_EX_AMTHH1.Text, ED_EX_AMTHH2.Text,
                           ED_EX_AMTHH3.Text, ED_EX_OVMCAMT.Text,
                           GSsysdate,         GSempno,
                           Copy(BE_Date1.Text,1,4)+Copy(BE_Date1.Text,8,2)  ]);

    if cnt = 0 then
      Sql.Add(SqlText_Int)
    else
      Sql.Add(SqlText_Up);

    ExecSQL;
    MessageDlg('저장 완료', mtInformation, [mbOk], 0);
  end;
end;

////////////////////////////////////////////////////////////////////////////////
procedure TMainForm.PKCEXBAS_Load;
begin
  with Ora_Qry1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add ( 'SELECT * FROM PKCEXBAS WHERE DUYYMM =:YYYYMM ');
      ParamByName('YYYYMM').AsString := Copy(BE_Date1.Text,1,4)+Copy(BE_Date1.Text,8,2);
      Open;

      if Ora_Qry1.RecordCount > 0 then
      begin
        BE_Date1.Text     := Copy(FieldByName('DUYYMM').AsString,1,4) +' - '+Copy(FieldByName('DUYYMM').AsString,5,2);
        BE_Date2.Text     := Copy(FieldByName('PAYDATE').AsString,1,4)+' - '+Copy(FieldByName('PAYDATE').AsString,5,2);
        BE_Payra1.text    := CodeNameFind('I113', FieldByName('PAYRA1').AsString);
        BE_Payra2.text    := CodeNameFind('I113', FieldByName('PAYRA2').AsString);
        BE_Payra3.text    := CodeNameFind('I113', FieldByName('PAYRA3').AsString);
        BE_Payra4.text    := CodeNameFind('I113', FieldByName('PAYRA4').AsString);
        BE_Paycl1.text    := CodeNameFind('I112', FieldByName('PAYCL1').AsString);
        BE_Paycl2.text    := CodeNameFind('I112', FieldByName('PAYCL2').AsString);
        DateEd1.Text      := Copy(FieldByName('CONYMD1').AsString,1,4) +'-'+
                             Copy(FieldByName('CONYMD1').AsString,5,2) +'-'+
                             Copy(FieldByName('CONYMD1').AsString,7,2);
        DateEd2.Text      := Copy(FieldByName('CONYMD2').AsString,1,4) +'-'+
                             Copy(FieldByName('CONYMD2').AsString,5,2) +'-'+
                             Copy(FieldByName('CONYMD2').AsString,7,2);
        BE_empno.text     := CodeNameFind('EMPNO', FieldByName('MASTEREMP').AsString);
        ED_LIMITDAY.Text  := FieldByName('LIMITDAY').AsString;
        ED_KIJUN11.Text   := FieldByName('KIJUN11').AsString;
        ED_KIJUN12.Text   := FieldByName('KIJUN12').AsString;
        ED_KIJUN21.Text   := FieldByName('KIJUN21').AsString;
        ED_KIJUN22.Text   := FieldByName('KIJUN22').AsString;
        ED_MONTHMM.Text   := FieldByName('MONTHMM').AsString;
        ED_MONTHHH.Text   := FieldByName('MONTHHH').AsString;
        ED_EX_AMTHH1.Text := FieldByName('EX_AMTHH1').AsString;
        ED_EX_AMTHH2.Text := FieldByName('EX_AMTHH2').AsString;
        ED_EX_AMTHH3.Text := FieldByName('EX_AMTHH3').AsString;
        ED_EX_OVMCAMT.Text:= FieldByName('EX_OVMCAMT').AsString;
      end;
    end;
end;

function TMainForm.CodeNameFind(codeid : String; codeno : String) : String;
begin
  if codeid <> 'EMPNO' then
  begin
    with Ora_CodeName do
      begin
        Close;
        Sql.Clear;
        Sql.Add( ' select codeno,codename    '+
                 ' from pyccode              '+
                 ' where codeid = :p_codeid  '+
                 '   and codeno = :p_codeno  '+
                 '   and useyn  = ''Y''      '+
                 ' order by codeno, codename ');
        ParamByName('p_codeid').AsString  := codeid;
        ParamByName('p_codeno').AsString  := codeno;
        Open;

        Result := FieldByName('codeno').AsString +' - '+FieldByName('codename').AsString;
        Close;
      end;
  end;

  if codeid = 'EMPNO' then
  begin
    with Ora_CodeName do
    begin
      Close;
      SQL.Clear;
      SQL.Add ( 'select empno, korname    ');
      SQL.Add ( '  from pimpmas           ');
      SQL.Add ( ' where pstate < ''80''   ');
      SQL.Add ( '   and empno =:str       ');
      ParamByName('str').AsString := codeno;
      Open;
      
      Result := FieldByName('empno').AsString +' - '+FieldByName('korname').AsString;
      Close;      
    end;
  end;
end;

function  TMainForm.GetTime;
begin
  with Ora_Qry1 do
    begin
      Close;
      SQL.Clear;
      SQL.ADD(' SELECT TO_CHAR(SYSDATE,''YYYYMMDDHH24MISSD'') GSsysdate ');
      SQL.ADD('   FROM DUAL ');
      Open;
      GSsysdate := FieldByName('GSsysdate').AsString;
      Close;
    end;
end;
////////////////////////////////////////////////////////////////////////////////

procedure TMainForm.BT_SearchClick(Sender: TObject);
begin
  if Length(Trim(BE_Date1.Text)) = 9 then
    PKCEXBAS_Load
  else
    MessageDlg('실제 근무년월을 입력하세요',mtInformation,[mbOK],0);
end;

procedure TMainForm.BE_Date1KeyPress(Sender: TObject; var Key: Char);
var
  FL_Date : String;
begin
  if key = #13 then
    with Ora_Qry1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add ( 'SELECT TO_CHAR(ADD_MONTHS(TO_DATE(:YYYYMM,''YYYYMM''),1),''YYYYMM'') D ');
      SQL.Add ( '  FROM DUAL');
      ParamByName('YYYYMM').AsString := Copy(BE_Date1.Text,1,4)+Copy(BE_Date1.Text,8,2);
      Open;
      FL_Date := FieldByName('D').AsString;
      BE_Date2.Text := Copy(FL_Date,1,4)+' - '+Copy(FL_Date,5,2);
      Close;
    end;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  PKCEXBAS_Load;
  BE_Date1.SetFocus;
end;

procedure TMainForm.Panel2Click(Sender: TObject);
begin
  SB_Help.Panels[1].Text := Passemp(cmdline,7);
end;


end.


  BE_Payra1.Text := '';
  BE_Payra2.Text := '';
  BE_Payra3.Text := '';
  BE_Payra4.Text := '';
  BE_Paycl1.Text := '';
  BE_Paycl2.Text := '';
  ED_LIMITDAY.Text := '';
  ED_KIJUN11.Text := '';
  ED_KIJUN12.Text := '';
  ED_KIJUN21.Text := '';
  ED_KIJUN22.Text := '';
  ED_MONTHMM.Text := '';
  ED_MONTHHH.Text := '';
  ED_EX_AMTHH1.Text := '';
  ED_EX_AMTHH2.Text := '';
  ED_EX_AMTHH3.Text := '';
  ED_EX_OVMCAMT.Text := '';
