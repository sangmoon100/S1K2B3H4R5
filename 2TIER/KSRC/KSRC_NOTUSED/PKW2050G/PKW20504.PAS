unit pkw20504;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Mask, FormMon2;

type
  TFpkhigduty = class(TForm)
    Phelpmsg: TPanel;
    Panel1: TPanel;
    BBrun: TBitBtn;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    BBfile: TBitBtn;
    SaveDialog1: TSaveDialog;
    Label1: TLabel;
    Label2: TLabel;
    Panel3: TPanel;
    Panel13: TPanel;
    MEfr: TMaskEdit;
    SBfr: TSpeedButton;
    Panel4: TPanel;
    Panel5: TPanel;
    BBprint: TBitBtn;
    procedure BBrunClick(Sender: TObject);
    procedure BBfileClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SBfrClick(Sender: TObject);
    procedure BBprintClick(Sender: TObject);
  private
    { Private declarations }
    procedure CallSaveFile ;
  public
    { Public declarations }
  end;

var
  Fpkhigduty: TFpkhigduty;

implementation

uses pkw20503, pkw20502, pkw20505, pkw20506;

{$R *.DFM}

procedure TFpkhigduty.BBrunClick(Sender: TObject);
begin
  with DM.Query1 do
  begin
       close;
       Sql.Clear;
       Sql.Add('select i.empno 사번, i.korname 성명, i.empdate 입사일, i.retdate 퇴사일,                                ');
       Sql.Add('       d.deptname 부서, cl.codename 직급, jd.codename 담당직무, ps.codename 인사상태,                   ');
       Sql.Add('       decode(h.empno, null, ''★ 미등록'', decode(tot_cnt, conyn_cnt, null, ''☞ 미결재'')) 미결재     ');
       Sql.Add('  from pycdept d, pyccode cl, pyccode jd, pyccode ps, pimpmas i,                                        ');
       Sql.Add('      (select empno, korname, count(*) tot_cnt, count(decode(conyn,''Y'',1,null)) conyn_cnt             ');
       Sql.Add('         from pkhigduty                                                                                 ');
       Sql.Add('        where dufrdate between '''+MEfr.text+'''||''01''                                                ');
       Sql.Add('          and to_char(last_day(to_date('''+MEfr.text+''', ''YYYYMM'')), ''YYYYMMDD'')                   ');
       Sql.Add('        group by empno, korname ) h                                                                     ');
       Sql.Add(' where i.empno = h.empno (+)                                                                            ');
       Sql.Add('   and i.empno like ''Y%''                                                                              ');
       Sql.Add('   and i.pstate <> ''80''                                                                               ');
       Sql.Add('   and nvl(i.empdate,to_char(last_day(to_date('''+MEfr.text+''', ''YYYYMM'')), ''YYYYMMDD'')) <= to_char(last_day(to_date('''+MEfr.text+''', ''YYYYMM'')), ''YYYYMMDD'') ');
       Sql.Add('   and nvl(i.retdate,'''+MEfr.text+'''||''01'') >= '''+MEfr.text+'''||''01''                            ');
       Sql.Add('   and i.orgnum   = d.orgnum (+) and i.deptcode = d.deptcode (+)                                        ');
       Sql.Add('   and i.paycl    = cl.codeno(+) and cl.codeid = ''I112''                                               ');
       Sql.Add('   and i.tjobduty = jd.codeno(+) and jd.codeid = ''I702''                                               ');
       Sql.Add('   and i.pstate   = ps.codeno(+) and ps.codeid = ''I114''                                               ');
       Sql.Add('   and decode(h.empno, null, ''★ 미등록'',decode(tot_cnt, conyn_cnt, null, ''☞ 미결재'')) is not null ');
       Open;
       
       label1.caption := '총 '+ inttostr(recordcount)+ '건' ;
  end;
end;

procedure TFpkhigduty.BBfileClick(Sender: TObject);
begin
 if DM.Query1.Active = False then
    begin
         Application.MessageBox('화일로 생성할 자료를 먼저 조회하세요.','작업안내',mb_ok);
         Exit;
    end;

    if DM.Query1.recordcount = 0 then
    begin
         Application.MessageBox('화일로 생성할 자료가 없습니다..','작업안내',mb_ok);
         Exit;
    end;

    CallSaveFile ;

    phelpmsg.caption  :=  ' 화일 생성을 완료하였습니다.';
end;

procedure TFpkhigduty.CallSaveFile ;
var
   i :integer;
begin
//  SaveDialog1.Title :=Format('Save info for %s', [gSaveTitle]);

  if SaveDialog1.Execute then
  begin
      with TStringList.Create do
      try
        Add(pchar('사번,성명,입사일,퇴사일,부서,'+
          'BAND,담당직무,인사상태,미결재,'
                    )
          );
        DM.Query1.First;
        for i := 1 to DM.Query1.Recordcount do
        begin
          Add(Format('%s,%s,%s,%s,%s,%s,%s,%s,%s,',
                  [
                  DM.Query1.Fields[0].AsString,
                  DM.Query1.Fields[1].AsString,
                  DM.Query1.Fields[2].AsString,
                  DM.Query1.Fields[3].AsString,
                  DM.Query1.Fields[4].AsString,
                  DM.Query1.Fields[5].AsString,
                  DM.Query1.Fields[6].AsString,
                  DM.Query1.Fields[7].AsString,
                  DM.Query1.Fields[8].AsString
                        ]));

          DM.Query1.Next;
        end; // end of for
        SaveToFile(SaveDialog1.FileName);
      finally
      Free;
      end; // end of try
  end; //end of SaveDialog1.Execute
end;


procedure TFpkhigduty.FormShow(Sender: TObject);
begin
    DM.Query2.Close;
    DM.Query2.Sql.Clear;
    DM.Query2.Sql.Add (' Select cpaydate from pkcigbas ') ;
    DM.Query2.Open;
    MEfr.Text := DM.Query2.FieldbyName('cpaydate').Asstring ;
    
    BBrunClick(nil);
end;

procedure TFpkhigduty.SBfrClick(Sender: TObject);
var
  Month2Form : TMonth2Form;
begin
Try
    Month2Form := TMonth2Form.Create(nil);
    Month2Form.rdaycaption := MEfr.Text;
    Month2Form.ShowModal;
    MEfr.text :=month2form.daycaption;
  Finally
    Month2Form.Free;
  End;

end;

procedure TFpkhigduty.BBprintClick(Sender: TObject);
begin
    if DM.Query1.recordcount = 0 then
        begin
            Application.MessageBox('출력 하실 자료가 없습니다.','작업안내',mb_ok);
            Exit;
        end;

    try

       QuickReport1.Qrdate.Caption := MainForm.Lsysdate.caption ;
       QuickReport1.QRL_title.Caption := copy(MEfr.Text,1,4) + '년'+
                                    copy(MEfr.Text,5,2) + '월'+
                                    ' 근태 미등록/미결재자 List ';
      
       QuickReport1.cntnum.Caption := IntToStr(DM.Query1.recordcount) ;
       QuickReport1.Print;
//QuickReport1.Preview;

     finally
//       QuickReport1.Free;
     end;

end;


end.
