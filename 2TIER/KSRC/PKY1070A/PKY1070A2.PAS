unit PKY1070A2;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, DB, DBTables, StdCtrls, Buttons, Mask, Grids, DBGrids,
  MemDS, DBAccess, Ora, Func;

type
  TFinsertemp = class(TForm)
    DBGempno: TDBGrid;
    BBchkout: TBitBtn;
    BBclose: TBitBtn;
    DSempno: TDataSource;
    Label1: TLabel;
    OraQuery1: TOraQuery;
    procedure Retrieve;
    procedure FormActivate(Sender: TObject);
    procedure BBcloseClick(Sender: TObject);
    procedure DBGempnoDblClick(Sender: TObject);
    procedure DBGempnoKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }

  public
    { Public declarations }
    GIcloseS : Integer;
  end;

var
  Finsertemp: TFinsertemp;

implementation

{$R *.DFM}

Uses PKY1070A1;

Procedure TFinsertemp.Retrieve;
begin
     with OraQuery1 do
     begin
          Close;
          SQL.Clear;
          SQL.Add('select a.empno,                            ');
          SQL.Add('       a.korname,                          ');
          SQL.Add('       a.sex,                              ');
          SQL.Add('       a.juminid,                          ');
          SQL.Add('       a.zipno,                            ');
          SQL.Add('       a.curaddr,                          ');
          SQL.Add('       a.telno,                            ');
          SQL.Add('       a.paycl,                            ');
          SQL.Add('       a.payra,                            ');
          SQL.Add('       a.pstate,                           ');
          SQL.Add('       a.orgnum,                           ');
          SQL.Add('       a.deptcode,                         ');
          SQL.Add('       a.empdate,                          ');
          SQL.Add('       a.paycldate,                        ');
          SQL.Add('       a.retdate,                          ');
          SQL.Add('       a.jobplace,                         ');
          SQL.Add('       a.nogubun,                          ');
          SQL.Add('       a.eldsonyn                          ');
          SQL.Add('  from pimpmas a, pkmpmas b                ');
          SQL.Add(' where a.empno = b.empno(+)                ');
          SQL.Add('   and b.empno is null                     ');
          SQL.Add(' order by a.empno                          ');
          Open;

          Fields[0].DisplayLabel := '사번';
          Fields[1].DisplayLabel := '성명';
          Fields[2].DisplayLabel := '성별';
          Fields[3].DisplayLabel := '주민번호';
          Fields[4].DisplayLabel := '우편번호';
          Fields[5].DisplayLabel := '주소';
          Fields[6].DisplayLabel := '전화번호';
          Fields[7].DisplayLabel := 'BAND';
          Fields[8].DisplayLabel := '직책';
          Fields[9].DisplayLabel := '인사상태';
          Fields[10].DisplayLabel := '조직차수';
          Fields[11].DisplayLabel := '부서코드';
          Fields[12].DisplayLabel := '입사일';
          Fields[13].DisplayLabel := 'BAND일';
          Fields[14].DisplayLabel := '퇴사일';
          Fields[15].DisplayLabel := '근무지';
          Fields[16].DisplayLabel := '노조구분';
          Fields[17].DisplayLabel := '장남여부';
     end;
end;

procedure TFinsertemp.FormActivate(Sender: TObject);
begin
     OraQuery1.Session := Ora_Session;
     Retrieve;
end;

procedure TFinsertemp.BBcloseClick(Sender: TObject);
begin
     GIcloseS := -1;
     Close;
end;

procedure TFinsertemp.DBGempnoDblClick(Sender: TObject);
begin

     with OraQuery1 do
     begin
          FM_Main.Eempno.Text        := Fields[0].AsString;
          FM_Main.P_korname.caption   := Fields[1].AsString;
          FM_Main.CBsex.Text         := Fields[2].AsString;
          FM_Main.Ejuminid.Text      := Fields[3].AsString;
          FM_Main.Ezipno.Text        := Fields[4].AsString;
          FM_Main.Eaddr.Text         := Fields[5].AsString;
          FM_Main.GSpaycl            := Fields[7].AsString;
          FM_Main.Lpaycl.Caption     := GetCodeName('I112', Fields[7].AsString);
          FM_Main.GSpayra            := Fields[8].AsString;
          FM_Main.Lpayra.Caption     := GetCodeName('I113', Fields[9].AsString);
          FM_Main.GSpstate           := Fields[9].AsString;
          FM_Main.Lpstate.Caption    := GetCodeName('I114', Fields[10].AsString);
          FM_Main.Lorgnum.Caption    := Fields[10].AsString;
          FM_Main.Ldeptcode.Caption  := Fields[11].AsString;
          FM_Main.Ldeptname.Caption  := GetDeptName(Fields[10].AsString, Fields[11].AsString);
          FM_Main.Ldeptname.Hint     := GetDeptName(Fields[10].AsString, Fields[11].AsString);
          FM_Main.Lempdate.Caption   := InMask(Fields[12].AsString, '@@@@/@@/@@');
          FM_Main.Lpaycldate.Caption := InMask(Fields[13].AsString, '@@@@/@@/@@');
          FM_Main.Lretdate.Caption   := InMask(Fields[14].AsString, '@@@@/@@/@@');
          FM_Main.Ebldcode.Text      := Fields[15].AsString;
          FM_Main.Lbldcode.Caption   := GetCodeName('I160', Fields[16].AsString);

          If Copy(Fields[16].AsString,1,1) = '1' then FM_Main.CBnojoyn.Text := 'Y'
          else
          If Copy(Fields[16].AsString,1,1) = '2' then FM_Main.CBnojoyn.Text := 'N';
          
          FM_Main.CBfirstyn.Text     := Fields[17].AsString;
     end;

     GIcloseS := 0;
     Close;
end;

procedure TFinsertemp.DBGempnoKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 then
     begin
          key := #0;
          DBGempnoDblClick(Finsertemp);
     end;
end;

end.
