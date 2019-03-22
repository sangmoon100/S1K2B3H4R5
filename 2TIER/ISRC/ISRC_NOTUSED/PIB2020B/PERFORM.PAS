unit perForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Grids, DBGrids, DB, DBTables, Buttons, StdCtrls,iniFiles,codetext,
  jgrid, MemDS, DBAccess, Ora;

type
  TPersonForm = class(TForm)
    DataSource1: TDataSource;
    Jdbgrid1: Jdbgrid;
    Panel1: TPanel;
    BcloseSel: TBitBtn;
    Bper: TBitBtn;
    deptname: TPanel;
    Qper: TOraQuery;
    QperEMPNO: TStringField;
    QperKORNAME: TStringField;
    QperPAYCLNM: TStringField;
    QperPAYRANM: TStringField;
    QperPstatenm: TStringField;
    QperORGYM: TStringField;
    QperDEPTCODE: TStringField;
    QperEXTCODE: TStringField;
    QperBONCODE: TStringField;
    QperPAYCL: TStringField;
    QperPSTATE: TStringField;
    QperDEPTLEVEL: TStringField;
    QperORGNUM: TStringField;
    QCode: TOraQuery;
    QperPAYRA: TStringField;
    procedure BcloseSelClick(Sender: TObject);
    procedure Jdbgrid1DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure FormPaint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BperClick(Sender: TObject);
    procedure QperCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    start : Boolean;
    function QcodeDisp(s1,s2 : string) : string;
  public
    { Public declarations }
  end;

var
  PersonForm: TPersonForm;

implementation
uses orgmain;
{$R *.DFM}

{코드명을 불러온다..}
function TpersonForm.QcodeDisp(s1,s2 : string) : string;
var
  str : string;
begin
 if trim(s2) <> '' then begin
    if FileExists('c:\insacode.dat') = False then begin
       QCode.Close;
       QCode.Parambyname('lcodeid').AsString  := s1;
       QCode.Parambyname('lcodesub').AsString := s2;
       QCode.Open;
       QCodeDisp := Qcode.FieldByName('CodeName').AsString;
       if trim(Qcode.FieldByName('CodeName').AsString) = '' then QcodeDisp := '('+s2+')';
       Qcode.Close;
    end else begin
       str := TextCodeDisp(s1,s2,'c:\insacode.dat');
       QCodeDisp := str;
       if trim(str) = '' then QcodeDisp := '('+s2+')';
    end;
 end else QCodeDisp := '';
end;

procedure TPersonForm.FormPaint(Sender: TObject);
begin
if start = True then begin
  Application.ProcessMessages;
  start := False;
  Jdbgrid1.visible := True;
  Qper.close;
  Qper.ParamByName('ldeptcode').AsString := MainForm.SelDept;
  Qper.ParamByName('lorgym').AsString    := MainForm.Selym;
  Qper.Open;
  Jdbgrid1.SetFocus;
end;
end;

procedure TPersonForm.FormCreate(Sender: TObject);
begin
  start := True;
end;

procedure TPersonForm.BcloseSelClick(Sender: TObject);
begin
  Qper.close;
  Close;
end;

procedure TPersonForm.Jdbgrid1DrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
if gdSelected in state then
   with (Sender as TDBGrid).Canvas do begin
     Font.Color  := clBlue;               Brush.Color := clYellow;
     Pen.Color   := clBlack;
     FillRect(Rect);
     Rectangle(Rect.Left+1,Rect.Top+1,Rect.Right,Rect.Bottom-1);
     case Field.Index of
       0 : begin
           TextOut(Rect.Left+2,Rect.Top+8,' ☞ '+Field.AsString);
           end;
       1 : TextOut(Rect.Left+2,Rect.Top+8,' '+Field.AsString);
       2 : TextOut(Rect.Left+2,Rect.Top+8,' '+Field.AsString);
       3 : TextOut(Rect.Left+2,Rect.Top+8,' '+Field.AsString);
//       4 : TextOut(Rect.Left+2,Rect.Top+8,' '+Field.AsString);
     end;
   end
else
   with (Sender as TDBGrid).Canvas do begin
     Font.Color  := clBlack;
     Brush.Color := $00E7E7E7;
     Pen.Color   := clBlack;
     FillRect(Rect);
     Rectangle(Rect.Left+1,Rect.Top+1,Rect.Right-1,Rect.Bottom-1);
     case Field.Index of
       0 : begin
           TextOut(Rect.Left+2,Rect.Top+8,'    '+Field.AsString);
           end;
       1 : TextOut(Rect.Left+2,Rect.Top+8,' '+Field.AsString);
       2 : TextOut(Rect.Left+2,Rect.Top+8,' '+Field.AsString);
       3 : TextOut(Rect.Left+2,Rect.Top+8,' '+Field.AsString);
//       4 : TextOut(Rect.Left+2,Rect.Top+8,' '+Field.AsString);
     end;
   end;
end;

procedure TPersonForm.BperClick(Sender: TObject);
var
  str     : string;
  iniFile : TiniFile;
begin
  str := Qper.FieldByName('empno').AsString+','+
         Qper.FieldByName('paycl').AsString+','+
         Qper.FieldByName('boncode').AsString+','+
         Qper.FieldByName('extcode').AsString+','+
         Qper.FieldByName('deptcode').AsString+','+
         copy(Qper.FieldByName('deptlevel').AsString,1,1)+','+
         Qper.FieldByName('orgnum').AsString;
  iniFile := TiniFile.Create('c:\insa.ini');
  iniFile.WriteString('insa','사원번호',Qper.FieldByName('empno').AsString);
  iniFile.Destroy;
  if MainForm.empnoCheck(str) = False then
     MessageBox(handle,'당신은 개인열람을 볼권한이 없습니다 !!.','확 인',MB_OK or $0030);
end;

procedure TPersonForm.QperCalcFields(DataSet: TDataSet);
begin
  Qper.FieldByName('pstatenm').AsString :=
                   QcodeDisp('I114',Qper.FieldByName('pstate').AsString);
end;

end.
