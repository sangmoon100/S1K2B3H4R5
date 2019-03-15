unit pkg10401;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, Mask, DB, DBTables, Qrprntr,
  TimeFtp, Calen1, Kylib1, Pass, DateLib, Gauges, Func, Ora, MemDS,
  DBAccess;

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
    Label2: TLabel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    MEfr: TMaskEdit;
    MEto: TMaskEdit;
    SBfr: TSpeedButton;
    SBto: TSpeedButton;
    Label5: TLabel;
    Bevel1: TBevel;
    GroupBox1: TGroupBox;
    RBempno: TRadioButton;
    RBappdate: TRadioButton;
    BBrun: TBitBtn;
    BBsetup: TBitBtn;
    BBhelp: TBitBtn;
    BBexit: TBitBtn;
    Bevel2: TBevel;
    GroupBox2: TGroupBox;
    RBmonitor: TRadioButton;
    RBprinter: TRadioButton;
    RBfile: TRadioButton;
    PrinterSetupDialog1: TPrinterSetupDialog;
    RByes: TRadioButton;
    RBno: TRadioButton;
    RBfull: TRadioButton;
    SaveDialog1: TSaveDialog;
    Image1: TImage;
    Panel2: TPanel;
    Gauge1: TGauge;
    QueryF: TOraQuery;
    procedure FormActivate(Sender: TObject);
    procedure BBexitClick(Sender: TObject);
    procedure BBrunClick(Sender: TObject);
    procedure BBsetupClick(Sender: TObject);
    procedure SBfrClick(Sender: TObject);
    //procedure FormPaint(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    Procedure ShowPreView;
    Procedure LoadData;
    Procedure LoadData_csv; //dsa2000
    Function  AddSpace ( data : String; Size : Integer ) : String;
    { Private declarations }
  public
    Start : Integer;
    Curdate : String;
    { Public declarations }

    CodeString: TStringList; {codeno list}
    DataString: TStringList; {codename list}
  end;

Type
    TFam01 = Record { 자료화일의 Record 선언 }
          empno      : Array[0..4]  of Char;   { 사번       }
          korname    : Array[0..12] of Char;   { 성명       }
          firstyn    : Array[0..8]  of Char;   { 장남여부   }
          faminame   : Array[0..12] of Char;   { 가족명     }
          famikind   : Array[0..10] of Char;   { 가족구분   }
          famirel    : Array[0..10] of Char;   { 가족관계   }
          famibdate  : Array[0..10] of Char;   { 생년월일   }
          age        : Array[0..4]  of Char;   { 연령       }
          appdate    : Array[0..10] of Char;   { 신청일     }
          appkind    : Array[0..10] of Char;   { 시청구분   }
          famiyn     : Array[0..4]  of char;   { 처리       }
          famifrdate : Array[0..8]  of Char;   { 지급월     }
          famitodate : Array[0..8]  of Char;   { 해지월     }
          regdate    : Array[0..10] of Char;   { 시청사유일 }
          bigo       : Array[0..20] of Char;   { 비고       }
          lineskip   : Array[0..1]  of char;   { 다음줄로   }
end;

var
  MainForm: TMainForm;
  Fam01  : TFam01;  { Local 자료화일의 Record 명 선언 }
  Running: Boolean;

implementation
{$R *.DFM}

uses
  pkg10402, pkg10403;

procedure TMainForm.FormActivate(Sender: TObject);
begin
  Application.ProcessMessages;
  if Running then System.Exit;
  Running := True;

  OraConnect;

  L_UserName.Caption := Pkorname + '(' +pempno+ ')';

  Curdate := fn_GetDateTimeStr;

  L_Curdate.Caption := fn_GetDateStr;

  {전월을 변수에 입력하고 1월 부터 9월까지면 ... 아니면 ...... }
  if StrToInt(Copy(Curdate,5,2)) = 1 then
       MEfr.Text := IntToStr(StrToInt(Copy(Curdate,1,4))-1)+'1216'
  else if StrToInt(Copy(Curdate,5,2)) <= 10 then
       MEfr.Text := Copy(Curdate,1,4)+'0'+IntToStr(StrToInt(Copy(Curdate,5,2))-1)+'16'
  else
       MEfr.Text := Copy(Curdate,1,4)+IntToStr(StrToInt(Copy(Curdate,5,2))-1)+'16';

  Meto.Text := (Copy(Curdate,1,6)+'15');

  Phelpmsg.Caption := '  초기자료를 읽고 있습니다.';
  Application.ProcessMessages;
  Phelpmsg.Caption := '';
end;

procedure TMainForm.BBexitClick(Sender: TObject);
begin
     Close;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     CodeString.free;
     DataString.free;
     Action := caFree;
end;

Procedure TMainForm.ShowPreView;
begin

end;

{실행 버튼을 눌렀어요..........................................................}
procedure TMainForm.BBrunClick(Sender: TObject);
var
     FilePointer : File of TFam01;
     Inwon: Integer;
     i: Integer;
begin
     Gauge1.Progress := 0;
     if fn_IsDate(MEfr.Text) = False then
     begin
          MessageBox(Handle, '신청일범위 from를 정확히 입력하세요.', '입력오류', MB_ICONWARNING);
          MEfr.SetFocus;
          System.Exit;
     end;
     if fn_IsDate(MEto.Text) = False then
     begin
          MessageBox(Handle, '신청일범위 to를 정확히 입력하세요.', '입력오류', MB_ICONWARNING);
          MEto.SetFocus;
          System.Exit;
     end;
     if MEfr.Text > MEto.Text then
     begin
          MessageBox(Handle, '신청일범위가 맞지 않습니다.', '입력오류', MB_ICONWARNING);
          MEto.SetFocus;
          System.Exit;
     end;

     Phelpmsg.Caption := '  해당하는 자료를 추출중입니다.';
     Application.ProcessMessages;

     LoadData;

     if QueryF.RecordCount = 0 then
     begin
          QueryF.Close;
          MessageBox(Handle, '해당하는 자료가 하나도 없습니다.', '처리오류', MB_ICONWARNING);
          System.Exit;
     end;

     if RBmonitor.Checked = True then
     begin
          printform := TPrintform.create(application);
          printform.QuickReport1.PreView;
     end
     else if RBprinter.Checked = True then
     begin
          printform := TPrintform.create(application);
          printform.user_preview := false;
          printform.QuickReport1.Print;
     end
     else if RBfile.Checked = True then
     begin
          if SaveDialog1.Execute then
          begin
               LoadData_csv;

               if QueryF.Eof then
               begin
                    MessageDlg('해당자료가 없습니다',mtInformation, [mbok],0);
                    Exit;
               end;

               with TStringList.Create do
               begin
                    try
                         Add(pchar('사번, 성명, 장남녀여부, 가족명, 가족구분, 가족관계, 생년월일, 신청일, 신청구분, 처리, 지급월, 해지월, 신청사유발생일'));
                         QueryF.First;

                         for i := 1 to QueryF.Recordcount do
                         begin
                              Add(Format('%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s',
                                  [
                                    QueryF.FieldByName('EMPNO').AsString,
                                    QueryF.FieldByName('KORNAME').AsString,
                                    QueryF.FieldByName('FIRSTYN').AsString,
                                    QueryF.FieldByName('FAMINAME').AsString,
                                    QueryF.FieldByName('FAMIKIND').AsString,
                                    QueryF.FieldByName('FAMIREL').AsString,
                                    QueryF.FieldByName('FAMIBDATE').AsString,
                                    QueryF.FieldByName('APPDATE').AsString,
                                    QueryF.FieldByName('APPKIND').AsString,
                                    QueryF.FieldByName('FAMIYN').AsString,
                                    QueryF.FieldByName('FAMIFRDATE').AsString,
                                    QueryF.FieldByName('FAMITODATE').AsString,
                                    QueryF.FieldByName('REGDATE').AsString
                                  ]));
                              QueryF.Next;
                         end; // end of for
                         SaveToFile(SaveDialog1.FileName);
                         MessageDlg('자료추출이 완료되었습니다',mtInformation, [mbOk ],0) ;
                    finally
                         Free;
                    end; // end of try
               end;
          end; //end of SaveDialog1.Execute
     end;

     QueryF.Close;
     Phelpmsg.Caption := '  출력을 완료하였습니다.';
     Gauge1.Progress := 0;
     Application.ProcessMessages;
end;

Procedure TMainForm.LoadData;
begin
     with QueryF do
     begin
          Close;
          SQL.Clear;
          SQL.ADD('select a.empno,                                ');
          SQL.ADD('       a.korname,                              ');
          SQL.ADD('       b.firstyn,                              ');
          SQL.ADD('       a.faminame,                             ');
          SQL.ADD('       a.famikind,                             ');
          SQL.ADD('       a.famirel,                              ');
          SQL.ADD('       a.famibdate,                            ');
          SQL.ADD('       a.appdate,                              ');
          SQL.ADD('       a.appkind,                              ');
          SQL.ADD('       a.famiyn,                               ');
          SQL.ADD('       a.famifrdate,                           ');
          SQL.ADD('       a.famitodate,                           ');
          SQL.ADD('       a.regdate,                              ');
          SQL.ADD('       b.mateempno,                            ');
          SQL.Add('       (select korname from pkmpmas            ');
          SQL.Add('         where empno = b.mateempno) matenm,    ');
          SQL.ADD('       a.fawithdate                            ');
          SQL.ADD('  from pkmfmmas a, pkmpmas b                   ');
          SQL.Add(' where a.empno = b.empno                       ');
          SQL.ADD('   and (a.appdate between :frdate and :todate) ');
          ParamByName('frdate').AsString := Mefr.Text;
          ParamByName('todate').AsSTring := MeTo.Text;

          if RByes.Checked = True then
            SQL.ADD('     and (a.famiyn = ''Y'') ')
          else if RBno.Checked = True then
            SQL.ADD('     and (a.famiyn = ''N'') ');
          if RBempno.Checked = True then
            SQL.ADD(' order by a.empno, a.famibdate ')
          else
            SQL.ADD(' order by a.appdate, a.empno, a.famibdate ');

          Open;
     end;
end;

Procedure TMainForm.LoadData_csv;
begin
     with QueryF do
     begin
          Close;
          SQL.Clear;
          SQL.Add('select a.empno, a.korname, a.faminame,                             ');
          SQL.Add('       nvl((select firstyn from pkmpmas                            ');
          SQL.Add('            where empno = a.empno),''N'') firstyn,                 ');
          SQL.Add('       nvl((select codename from pyccode                           ');
          SQL.Add('             where codeid = ''K410''                               ');
          SQL.Add('               and codeno = a.famikind),'''') famikind,              ');
          SQL.Add('       nvl((select codename from pyccode                           ');
          SQL.Add('             where codeid = ''I211''                               ');
          SQL.Add('               and codeno = a.famirel),'''') famirel,                ');
          SQL.Add('       a.famibdate, a.appdate,                                     ');
          SQL.Add('       a.appkind, a.famiyn, a.famifrdate, a.famitodate, a.regdate  ');
          SQL.Add('  from pkmfmmas a                                                  ');
          SQL.Add(' where a.appdate between :frdate and :todate                       ');
          ParamByName('frdate').AsString := Mefr.Text;
          ParamByName('Todate').AsString := MeTo.Text;

          if RByes.Checked = True then
               SQL.ADD (' and a.famiyn = ''Y'' ')
          else if RBno.Checked = True then
               SQL.ADD (' and a.famiyn = ''N'' ');
          if RBempno.Checked = True then
               SQL.ADD (' order by a.empno, a.famibdate ')
          else
               SQL.ADD (' order by a.appdate, a.empno, a.famibdate ');

          Open;
     end;
end;

procedure TMainForm.BBsetupClick(Sender: TObject);
begin
     PrinterSetupDialog1.Execute;
end;

procedure TMainForm.SBfrClick(Sender: TObject);
var
     calendar: Tcalendar;
begin
     Calendar := TCalendar.Create(Self);
     Try
          Calendar.ShowModal;
          if Calendar.DayCaption <> '' then
          begin
               if TSpeedButton(Sender).Name = 'SBfr' then
                    TMaskEdit(MEfr).text := Calendar.DayCaption;
               if TSpeedButton(Sender).Name = 'SBto' then
                    TMaskEdit(MEto).text := Calendar.DayCaption;
          end;
     Finally
          Calendar.Free;
     end;
end;

{Record 의 공란을 Space 로....................................................}
Function TMainForm.AddSpace ( data : String; Size : Integer ) : String;
var
     i : Integer;
     s : String;
begin
     s := '';
     if (size - Length(data)) = 0 then
     begin
          AddSpace := ''+data;
     end
     else
     begin
          for i := 1 to size - Length(data) do begin
              s := s+ ' ';
          end;
     end;
     
     AddSpace := s + data;
end;

end.





