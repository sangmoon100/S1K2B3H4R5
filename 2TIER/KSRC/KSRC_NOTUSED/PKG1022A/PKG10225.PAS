{-------------------------------------------------------------------------------
 PROGRAM NAME : LIBRARY Kyempno (Kyempno.Pas)
 AUTHOR       : 허  철  행
 DATE         : 1996. 0. 0
 HISTORY      : 1996. 0. 0 / 허철행 /
 COMMENT      : 급여마스터화일의 사번,성명,조직차수,부서코드 조회
 USER LIBRARY :
-------------------------------------------------------------------------------
EXAMPLE :
procedure TFsample.Button1Click(Sender: TObject);
begin
     Fkyempno := TFkyempno.Create(Self);
     Try
       Fkyempno.ShowModal;
       If Fkyempno.GIcloseS = 0 then begin
         Eempno.Text := Fkyempno.GSempnoS;
         Pkorname.Caption := ' '+Fkyempno.GSkornameS;
       end;
     Finally
       Fkyempno.Free;
     end;
end;
-------------------------------------------------------------------------------}
unit pkg10225;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Mask, DB, Grids, DBGrids, DBTables, Buttons,
  ExtCtrls, MemDS, DBAccess, Ora, Func;

type
  TFamiForm = class(TForm)
    DSempno: TDataSource;
    BBrun: TBitBtn;
    BBclose: TBitBtn;
    BBchkout: TBitBtn;
    Eempno: TEdit;
    DBGrid1: TDBGrid;
    RB1: TRadioButton;
    RB2: TRadioButton;
    Query2: TOraQuery;
    procedure Retrieve;
    procedure FormActivate(Sender: TObject);
    procedure BBrunClick(Sender: TObject);
    procedure EempnoKeyPress(Sender: TObject; var Key: Char);
    procedure BBcloseClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure RB1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    //Send
    GIcloseS : Integer;
    GSempnoS : String;
    GSkornameS : String;
    GSorgnumS : String;
    GSdeptcodeS : String;

    FACODE       : String;
    FANAME       : String;
    FABIRTHDATE  : String;
    FASCHGR      : String;
    FAJOBCODE    : String;
    FAPLACE      : String;
    FAWITH       : String;
    FAALLOWYN    : String;
    FAMEDYN      : String;
  end;

var
  FamiForm: TFamiForm;

implementation

{$R *.DFM}
uses pkg10221;

procedure TFamiForm.Retrieve;
begin
     with Query2 do
     begin
          Close;
          SQL.Clear;
          SQL.Add('select                                 ');
          SQL.Add('       facode,                         ');
          SQL.Add('       faname,                         ');
          SQL.Add('       fabirthdate,                    ');
          SQL.Add('       faschgr,                        ');
          SQL.Add('       fajobcode,                      ');
          SQL.Add('       faplace,                        ');
          SQL.Add('       fawith,                         ');
          SQL.Add('       faallowyn,                      ');
          SQL.Add('       famedyn                         ');
          SQL.Add('  from pimfami                         '+
           format(' where empno = ''%s''                  '+
                  ' order by facode, fakind, korname ',[MainForm.E_empno.Text]))  ;

{          SQL.ADD(' SELECT EMPNO, KORNAME, ORGNUM, DEPTCODE ');
          SQL.ADD('   FROM PKMPMAS ');
          SQL.ADD(' WHERE (MATEEMPNO IS NOT NULL) ');

          if Eempno.Text <> '' then
          begin
               SQL.ADD(' and (EMPNO LIKE :empno ');
               SQL.ADD('      OR KORNAME LIKE :empno) ');
               ParamByName('empno').AsString := Eempno.Text + '%';
          end;
          if RB1.Checked then
               SQL.ADD('  ORDER BY EMPNO, KORNAME ')
          else
               SQL.ADD('  ORDER BY KORNAME, EMPNO ');}

          Open;
     end;
end;

procedure TFamiForm.FormActivate(Sender: TObject);
begin
     Retrieve;
end;

procedure TFamiForm.BBcloseClick(Sender: TObject);
begin
     GIcloseS := -1;
     Close;
end;

procedure TFamiForm.BBrunClick(Sender: TObject);
begin
     Retrieve;
end;

procedure TFamiForm.EempnoKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 then begin
        key := #0;
        Retrieve;
     end;

end;

procedure TFamiForm.DBGrid1DblClick(Sender: TObject);
begin
  if not Query2.Eof then
  begin
    FACODE        := Query2.FieldByName('FACODE'     ).AsString;
    FANAME        := Query2.FieldByName('FANAME'     ).AsString;
    FABIRTHDATE   := Query2.FieldByName('FABIRTHDATE').AsString;
    FASCHGR       := Query2.FieldByName('FASCHGR'    ).AsString;
    FAJOBCODE     := Query2.FieldByName('FAJOBCODE'  ).AsString;
    FAPLACE       := Query2.FieldByName('FAPLACE'    ).AsString;
    FAWITH        := Query2.FieldByName('FAWITH'     ).AsString;
    FAALLOWYN     := Query2.FieldByName('FAALLOWYN'  ).AsString;
    FAMEDYN       := Query2.FieldByName('FAMEDYN'    ).AsString;


  end
  else
  begin
    FACODE        := '';
    FANAME        := '';
    FABIRTHDATE   := '';
    FASCHGR       := '';
    FAJOBCODE     := '';
    FAPLACE       := '';
    FAWITH        := '';
    FAALLOWYN     := '';
    FAMEDYN       := '';
  end;


{     GSempnoS := Query1.FieldByName('empno').AsString;
     GSkornameS := Query1.FieldByName('korname').AsString;
     GSorgnumS := Query1.FieldByName('orgnum').AsString;
     GSdeptcodeS := Query1.FieldByName('deptcode').AsString;}
     GIcloseS := 0;
     Close;
end;

procedure TFamiForm.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 then begin
        key := #0;
        DBGrid1DblClick(Sender);
     end;
end;

procedure TFamiForm.RB1Click(Sender: TObject);
begin
     Retrieve;
     Eempno.SetFocus;
end;

end.
