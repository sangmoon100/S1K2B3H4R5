unit PTA40101;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl, OnTmaxPersonEdit, Grids,
  DBGridEh, OnPopupEdit, OnEditCombo, OnScheme, ExtCtrls, StdCtrls,
  OnTmaxCodeEdit, OnFocusButton, Tmax_session, OnInsaCommon, Db,
  Tmax_DataSetText, TmaxFunc;

type
  TfrmMain = class(TForm)
    SF_Sub: TOnSchemeForm;
    ED_empno: TTMaxPersonPopupEdit;
    DBGrd_E2: TDBGridEh;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    DBGridEh1: TDBGridEh;
    Label1: TLabel;
    Label2: TLabel;
    ED_payra: TTMaxCodePopupEdit;
    BBmodify: TOnFocusButton;
    OnFocusButton1: TOnFocusButton;
    OnFocusButton2: TOnFocusButton;
    OnFocusButton3: TOnFocusButton;
    OnFocusButton4: TOnFocusButton;
    ED_grade: TOnComboEdit;
    ED_gubun: TOnComboEdit;
    TMaxSession: TTMaxSession;
    DS_Grid1: TDataSource;
    TDS_Grid1: TTMaxDataSet;
    ED_All: TOnComboEdit;
    ED_All2: TOnComboEdit;
    TDS_Grid2: TTMaxDataSet;
    DS_Grid2: TDataSource;
    SaveDialog1: TSaveDialog;
    TDS1: TTMaxDataSet;
    procedure OnFocusButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BBmodifyClick(Sender: TObject);
    procedure ED_AllChange(Sender: TObject);
    procedure OnFocusButton4Click(Sender: TObject);
    procedure OnFocusButton2Click(Sender: TObject);
    procedure OnFocusButton3Click(Sender: TObject);
  private
    { Private declarations }
    FL_start     : Boolean;
  public
    { Public declarations }
    FG_empno   : string;
    FG_korname : string;
    FG_pass    : string;
    FG_grade   : string;
    FG_sysdate : string;
    FG_sysyy   : string;
    FG_deptname: string;
    FG_Dept    : TStringList;    
  end;

var
  frmMain: TfrmMain;

implementation

uses PTA40102;
{$R *.DFM}

procedure TfrmMain.OnFocusButton1Click(Sender: TObject);
begin
     if ((Copy(FG_grade,5,1) = 'A') or (FG_empno = '1564') or (FG_empno = '1873')) and (FG_grade <> '')   then
     begin
          frmReg := TfrmReg.Create(Self);
          frmReg.ShowModal;
     end else
     begin
         MessageBox(handle,'권한이 없습니다.','에러',mb_ok);
     end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  ///////////////////////////////////////////////////////////////////////
  TMaxSession.EnvFileName := GetHomeDir+'\newhana.env';
  TMaxSession.LabelName   := 'HANAROHPER';
  TMaxSession.Connect  := False;
  TMaxSession.Host     := Hinsa_Param(cmdline,10);
  TMaxSession.Port     := '9999';

  try
    TMaxSession.Connect := True;
  except
    Application.MessageBox(PChar('APP서버 접속 실패'),'에러',mb_ok);
    Application.Terminate;
    Exit;
  end;

  //2013.11. Add 파라미터와 비교하여 암호 다르면 접속 막음.
  FM_Tmax := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := TMaxSession;
  if FM_Tmax.PassWordChk(Hinsa_Param(cmdline,1), Hinsa_Param(cmdline,3)) = 0 then
    Application.Terminate;
  ///////////////////////////////////////////////////////////////////////

  DBGrd_E2.RowsHeight := 22;
  DBGridEh1.RowsHeight := 22;

  with TDS1 do
  begin
       ServiceName := 'HINSA_select';
       Close;
       Sql.Clear;
       //현재날짜
       Sql.Add('select To_Char(sysdate,''yyyymmdd'') FGSYSDATE,        ');
       Sql.Add('       ''field2'', ''field3'', ''field4'',''field5''   ');
       Sql.Add('  from dual                                            ');

       ClearFieldInfo;
       AddField('FGSYSDATE' , ftString,  100);
       AddField('field2'    , ftString,  100);
       AddField('field3'    , ftString,  100);
       AddField('field4'    , ftString,  100);
       AddField('field5'    , ftString,  100);
       Open;

       if not TDS1.eof then
       begin
          FG_sysdate := copy(FieldbyName('FGSYSDATE').AsString,1,8);
          FG_sysYY   := copy(FG_sysdate,1,4);
          DBGrd_E2.Columns[ 6].Title.Caption  := FG_sysYY+'년|강의시간';
          DBGrd_E2.Columns[ 7].Title.Caption  := FG_sysYY+'년|만족도';
          DBGrd_E2.Columns[ 8].Title.Caption  := FG_sysYY+'년|강의료';
          DBGridEh1.Columns[ 8].Title.Caption := FG_sysYY+'년|강의시간';
          DBGridEh1.Columns[ 9].Title.Caption := FG_sysYY+'년|만족도';
          DBGridEh1.Columns[10].Title.Caption := FG_sysYY+'년|강의료';
       end;
  end;

  FG_empno := HInsa_param(cmdline,1);
  FG_grade := HInsa_param(cmdline,4);
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
     with TDS_Grid1 do
     begin
          ServiceName := 'PTA4010B_sel2';
          Close;
          SQL.Clear;
          Sql.Add('select ''0'',nvl(sum(lectime),0) incount,                                               ');
          Sql.Add('           nvl(sum(decode(gubun,''경영일반'', lectime,0)),0) bn,                        ');
	  Sql.Add('	      nvl(sum(decode(gubun,''영업/마케팅'',lectime,0)),0) bm,                      ');
          Sql.Add('           nvl(sum(decode(gubun,''기술'',lectime,0)),0) tec,                            ');
          Sql.Add('           nvl(sum(decode(gubun,''기타'',lectime,0)),0) etc,                            ');
       	  Sql.Add('           nvl(sum(decode(substr(rabasym,1,4),'''+FG_sysYY+''',lectime,0)),0) lectime,  ');
       	  Sql.Add('           nvl(avg(decode(substr(rabasym,1,4),'''+FG_sysYY+''',satper)),0) satper,      ');
       	  Sql.Add('           nvl(sum(decode(substr(rabasym,1,4),'''+FG_sysYY+''',cost,0)),0) leccost,     ');
       if ED_All.Text = '(전체)년' then
       begin
          Sql.Add('           nvl(sum(decode(substr(rabasym,1,4),'''',0,lectime)),0) alectime,             ');
 	  Sql.Add('           nvl(avg(decode(substr(rabasym,1,4),'''',0,satper)),0) asatper,               ');
 	  Sql.Add('           nvl(sum(decode(substr(rabasym,1,4),'''',0,cost)),0) aleccost                 ');
       end
       else begin
          Sql.Add('   nvl(sum(decode(substr(rabasym,1,4),''' + Copy(Ed_All.Text,1,4) + ''',lectime,0)),0) alectime,');
          Sql.Add('   nvl(avg(decode(substr(rabasym,1,4),''' + Copy(Ed_All.Text,1,4) + ''',satper)),0) asatper,    ');
          Sql.Add('   nvl(sum(decode(substr(rabasym,1,4),''' + Copy(Ed_All.Text,1,4) + ''',Cost,0)),0) aleccost    ');
       end;
          Sql.Add('  from  pedulhis                                                                        ');
          Sql.Add(' where  giveyn = ''Y''                                                                  ');
          Sql.Add('union                                                                                   ');
          Sql.Add('select ''1'',nvl(sum(lectime),0) incount,                                               ');
          Sql.Add('           nvl(sum(decode(gubun,''경영일반'', lectime,0)),0) bn,                        ');
	  Sql.Add('	      nvl(sum(decode(gubun,''영업/마케팅'',lectime,0)),0) bm,                      ');
          Sql.Add('           nvl(sum(decode(gubun,''기술'',lectime,0)),0) tec,                            ');
          Sql.Add('           nvl(sum(decode(gubun,''기타'',lectime,0)),0) etc,                            ');
          Sql.Add('           nvl(sum(decode(substr(rabasym,1,4),'''+FG_sysYY+''',lectime,0)),0) lectime,  ');
          Sql.Add('           nvl(avg(decode(substr(rabasym,1,4),'''+FG_sysYY+''',satper)),0) satper,      ');
          Sql.Add('           nvl(sum(decode(substr(rabasym,1,4),'''+FG_sysYY+''',cost,0)),0) leccost,     ');
       if ED_All.Text = '(전체)년' then
       begin
          Sql.Add('           nvl(sum(decode(substr(rabasym,1,4),'''',0,lectime)),0) alectime,             ');
 	  Sql.Add('           nvl(avg(decode(substr(rabasym,1,4),'''',0,satper)),0) asatper,               ');
 	  Sql.Add('           nvl(sum(decode(substr(rabasym,1,4),'''',0,cost)),0) aleccost                 ');
       end
       else begin
          Sql.Add('   nvl(sum(decode(substr(rabasym,1,4),''' + Copy(Ed_All.Text,1,4) + ''',lectime,0)),0) alectime,');
          Sql.Add('   nvl(avg(decode(substr(rabasym,1,4),''' + Copy(Ed_All.Text,1,4) + ''',satper)),0) asatper,    ');
          Sql.Add('   nvl(sum(decode(substr(rabasym,1,4),''' + Copy(Ed_All.Text,1,4) + ''',Cost,0)),0) aleccost    ');
       end;
          Sql.Add('  from  pedulhis                                                                        ');
          Sql.Add(' where grade     = ''사내강사''                                                         ');
          Sql.Add('   and edugubun <> ''9001''                                                             ');
          Sql.Add('   and giveyn = ''Y''                                                                   ');
          Sql.Add('union                                                                                   ');
          Sql.Add('select ''2'',nvl(sum(lectime),0) incount,                                               ');
          Sql.Add('           nvl(sum(decode(gubun,''경영일반'', lectime,0)),0) bn,                        ');
	  Sql.Add('	      nvl(sum(decode(gubun,''영업/마케팅'',lectime,0)),0) bm,                      ');
          Sql.Add('           nvl(sum(decode(gubun,''기술'',lectime,0)),0) tec,                            ');
          Sql.Add('           nvl(sum(decode(gubun,''기타'',lectime,0)),0) etc,                            ');
          Sql.Add('           nvl(sum(decode(substr(rabasym,1,4),'''+FG_sysYY+''',lectime,0)),0) lectime,  ');
          Sql.Add('           nvl(avg(decode(substr(rabasym,1,4),'''+FG_sysYY+''',satper)),0) satper,      ');
          Sql.Add('           nvl(sum(decode(substr(rabasym,1,4),'''+FG_sysYY+''',cost,0)),0) leccost,     ');
       if ED_All.Text = '(전체)년' then
       begin
          Sql.Add('           nvl(sum(decode(substr(rabasym,1,4),'''',0,lectime)),0) alectime,             ');
 	  Sql.Add('           nvl(avg(decode(substr(rabasym,1,4),'''',0,satper)),0) asatper,               ');
 	  Sql.Add('           nvl(sum(decode(substr(rabasym,1,4),'''',0,cost)),0) aleccost                 ');
       end
       else begin
          Sql.Add('   nvl(sum(decode(substr(rabasym,1,4),''' + Copy(Ed_All.Text,1,4) + ''',lectime,0)),0) alectime,');
          Sql.Add('   nvl(avg(decode(substr(rabasym,1,4),''' + Copy(Ed_All.Text,1,4) + ''',satper)),0) asatper,    ');
          Sql.Add('   nvl(sum(decode(substr(rabasym,1,4),''' + Copy(Ed_All.Text,1,4) + ''',Cost,0)),0) aleccost    ');
       end;
          Sql.Add('  from  pedulhis                                                                        ');
          Sql.Add(' where grade    = ''사내강사''                                                          ');
          Sql.Add('   and edugubun = ''9001''                                                              ');
          Sql.Add('   and giveyn = ''Y''                                                                   ');
          Sql.Add('union                                                                                   ');
          Sql.Add('select ''3'',nvl(sum(lectime),0) incount,                                               ');
          Sql.Add('           nvl(sum(decode(gubun,''경영일반'', lectime,0)),0) bn,                        ');
	  Sql.Add('	      nvl(sum(decode(gubun,''영업/마케팅'',lectime,0)),0) bm,                      ');
          Sql.Add('           nvl(sum(decode(gubun,''기술'',lectime,0)),0) tec,                            ');
          Sql.Add('           nvl(sum(decode(gubun,''기타'',lectime,0)),0) etc,                            ');
          Sql.Add('           nvl(sum(decode(substr(rabasym,1,4),'''+FG_sysYY+''',lectime,0)),0) lectime,  ');
          Sql.Add('           nvl(avg(decode(substr(rabasym,1,4),'''+FG_sysYY+''',satper)),0) satper,      ');
          Sql.Add('           nvl(sum(decode(substr(rabasym,1,4),'''+FG_sysYY+''',cost,0)),0) leccost,     ');
       if ED_All.Text = '(전체)년' then
       begin
          Sql.Add('           nvl(sum(decode(substr(rabasym,1,4),'''',0,lectime)),0) alectime,             ');
 	  Sql.Add('           nvl(avg(decode(substr(rabasym,1,4),'''',0,satper)),0) asatper,               ');
 	  Sql.Add('           nvl(sum(decode(substr(rabasym,1,4),'''',0,cost)),0) aleccost                 ');
       end
       else begin
          Sql.Add('   nvl(sum(decode(substr(rabasym,1,4),''' + Copy(Ed_All.Text,1,4) + ''',lectime,0)),0) alectime,');
          Sql.Add('   nvl(avg(decode(substr(rabasym,1,4),''' + Copy(Ed_All.Text,1,4) + ''',satper)),0) asatper,    ');
          Sql.Add('   nvl(sum(decode(substr(rabasym,1,4),''' + Copy(Ed_All.Text,1,4) + ''',Cost,0)),0) aleccost    ');
       end;
          Sql.Add('  from  pedulhis                                                                        ');
          Sql.Add(' where grade     = ''강사''                                                             ');
          Sql.Add('   and edugubun <> ''9001''                                                             ');
          Sql.Add('   and giveyn = ''Y''                                                                   ');
          Sql.Add('union                                                                                   ');
          Sql.Add('select ''4'',nvl(sum(lectime),0) incount,                                               ');
          Sql.Add('           nvl(sum(decode(gubun,''경영일반'', lectime,0)),0) bn,                        ');
	  Sql.Add('	      nvl(sum(decode(gubun,''영업/마케팅'',lectime,0)),0) bm,                      ');
          Sql.Add('           nvl(sum(decode(gubun,''기술'',lectime,0)),0) tec,                            ');
          Sql.Add('           nvl(sum(decode(gubun,''기타'',lectime,0)),0) etc,                            ');
          Sql.Add('           nvl(sum(decode(substr(rabasym,1,4),'''+FG_sysYY+''',lectime,0)),0) lectime,  ');
          Sql.Add('           nvl(avg(decode(substr(rabasym,1,4),'''+FG_sysYY+''',satper)),0) satper,      ');
          Sql.Add('           nvl(sum(decode(substr(rabasym,1,4),'''+FG_sysYY+''',cost,0)),0) leccost,     ');
       if ED_All.Text = '(전체)년' then
       begin
          Sql.Add('           nvl(sum(decode(substr(rabasym,1,4),'''',0,lectime)),0) alectime,             ');
 	  Sql.Add('           nvl(avg(decode(substr(rabasym,1,4),'''',0,satper)),0) asatper,               ');
 	  Sql.Add('           nvl(sum(decode(substr(rabasym,1,4),'''',0,cost)),0) aleccost                 ');
       end
       else begin
          Sql.Add('   nvl(sum(decode(substr(rabasym,1,4),''' + Copy(Ed_All.Text,1,4) + ''',lectime,0)),0) alectime,');
          Sql.Add('   nvl(avg(decode(substr(rabasym,1,4),''' + Copy(Ed_All.Text,1,4) + ''',satper)),0) asatper,    ');
          Sql.Add('   nvl(sum(decode(substr(rabasym,1,4),''' + Copy(Ed_All.Text,1,4) + ''',Cost,0)),0) aleccost    ');
       end;
          Sql.Add('  from  pedulhis                                                                        ');
          Sql.Add(' where grade    = ''강사''                                                              ');
          Sql.Add('   and edugubun = ''9001''                                                              ');
          Sql.Add('   and giveyn = ''Y''                                                                   ');

          ClearFieldInfo;
          AddField('RNO'     , ftString,  1);       //  '구분'
          AddField('INCOUNT' , ftFloat,   5);       //  '합계(인원)'
          AddField('BN'      , ftFloat,   5);       //  '경영일반(인원)'
          AddField('BM'      , ftFloat,   5);       //  '영업/마케팅(인원)'
          AddField('TEC'     , ftFloat,   5);       //  '기술(인원)'
          AddField('ETC'     , ftFloat,   5);       //  '기타(인원)'
          AddField('LECTIME' , ftFloat,   5);       //  '강의시간('
          AddField('SATPER'  , ftFloat,   5);       //  '만족도('
          AddField('LECCOST' , ftFloat,  11);       //  '강의료('
          AddField('ALECTIME', ftFloat,   5);       //  '강의시간('
          AddField('ASATPER' , ftFloat,   5);       //  '만족도('
          AddField('ALECCOST', ftFloat,  11);       //  '강의료('
          Open;

          TFloatField(FieldByName('INCOUNT' )).DisplayFormat := '##0.0';
          TFloatField(FieldByName('BN'      )).DisplayFormat := '##0.0';
          TFloatField(FieldByName('BM'      )).DisplayFormat := '##0.0';
          TFloatField(FieldByName('TEC'     )).DisplayFormat := '##0.0';
          TFloatField(FieldByName('ETC'     )).DisplayFormat := '##0.0';

          TFloatField(FieldByName('LECTIME' )).DisplayFormat := '##0.0';
          TFloatField(FieldByName('SATPER'  )).DisplayFormat := '0.0'  ;
          TFloatField(FieldByName('LECCOST' )).DisplayFormat := '#,##0';

          TFloatField(FieldByName('ALECTIME')).DisplayFormat := '##0.0';
          TFloatField(FieldByName('ASATPER' )).DisplayFormat := '0.0'  ;
          TFloatField(FieldByName('ALECCOST')).DisplayFormat := '#,##0';

     end;
end;

procedure TfrmMain.FormPaint(Sender: TObject);
begin
  Self.OnPaint := Nil;
  Application.ProcessMessages;

  if (Copy(FG_grade,5,1) <= 'C')  and (FG_grade <> '')  then
     begin
         frmMain.Refresh ;
     end else
     begin
         MessageBox(handle,'권한이 없습니다.','에러',mb_ok);
         frmMain.Close;
         exit;
     end;


  if FL_start then
  begin
      FL_start := False;
      Application.ProcessMessages;
      FG_empno   := HInsa_param(cmdline,1);
      FG_korname := HInsa_param(cmdline,2);
      FG_pass    := HInsa_param(cmdline,3);
      FG_grade   := HInsa_param(cmdline,4);

      FG_Dept := nil;
      FG_Dept := TStringList.Create;
  end;

  FormShow(Self);
end;

procedure TfrmMain.BBmodifyClick(Sender: TObject);
begin
     with TDS_Grid2 do
     begin
          ServiceName := 'PTA4010B_sel3';
          Close;
          SQL.Clear;
          Sql.Add(' select  Rownum,                                                                                             ');
          Sql.Add('         i.empno,                                                                                            ');
          Sql.Add('         i.korname,                                                                                          ');
          Sql.Add(' 	   (select deptname from pycdept                                                                        ');
          Sql.Add('          where orgnum  =(select orgnum   from pimpmas  where empno=i.empno)                                 ');
          Sql.Add('            and deptcode=(select deptcode from pimpmas  where empno=i.empno)) deptname,                      ');
          Sql.Add('        (select codename from pyccode where codeid=''I113''                                                  ');
          Sql.Add('            and codeno=(select payra from pimpmas where empno=i.empno)) codefname,                           ');
          Sql.Add('         i.grade,    i.cpdate,  i.gubun,                                                                     ');
          Sql.Add(' 	    j.lectime,  j.satper,  j.leccost,                                                                   ');
          Sql.Add(' 	    k.alectime, k.asatper, k.aleccost                                                                   ');
          Sql.Add('   from (select a.empno, a.korname, a.grade,                                                                 ');
          Sql.Add('                (select cpdate from pedulect where empno=a.empno) cpdate, a.gubun                            ');
          Sql.Add('           from pedulhis a  group by a.empno, a.korname, a.grade, a.gubun ) i,                               ');
          Sql.Add('        (select empno,  gubun,                                                                               ');
          Sql.Add(' 	           nvl(sum(decode(substr(rabasym,1,4),'''+FG_sysYY+''',lectime,0)),0) lectime,                  ');
          Sql.Add('                nvl(avg(decode(substr(rabasym,1,4),'''+FG_sysYY+''',satper)),0) satper,                      ');
          Sql.Add('         	   nvl(sum(decode(substr(rabasym,1,4),'''+FG_sysYY+''',cost,0)),0) leccost                      ');
          Sql.Add(' 	      from pedulhis  where giveyn=''Y''   group by empno,  gubun) j,                                    ');
       if ED_All2.Text = '(전체)년' then
       begin
          Sql.Add('        (select empno,  gubun,                                                                               ');
          Sql.Add(' 	           nvl(sum(decode(substr(rabasym,1,4),'''',0,lectime)),0) alectime,                             ');
          Sql.Add('  	           nvl(avg(decode(substr(rabasym,1,4),'''',0,satper)),0) asatper,                               ');
          Sql.Add('  	           nvl(sum(decode(substr(rabasym,1,4),'''',0,cost)),0) aleccost                                 ');
          Sql.Add(' 	      from pedulhis  where giveyn=''Y''  group by empno,  gubun) k                                      ');
       end
       else begin
          Sql.Add('     (select empno,  gubun,                                                                                  ');
          Sql.Add(' 	        nvl(sum(decode(substr(rabasym,1,4),''' + Copy(ED_All2.Text,1,4) + ''',lectime,0)),0) alectime,  ');
          Sql.Add('  	        nvl(avg(decode(substr(rabasym,1,4),''' + Copy(ED_All2.Text,1,4) + ''',satper,0)),0) asatper,    ');
          Sql.Add('  	        nvl(sum(decode(substr(rabasym,1,4),''' + Copy(ED_All2.Text,1,4) + ''',cost,0)),0) aleccost      ');
          Sql.Add(' 	   from pedulhis  where giveyn=''Y''  group by empno,  gubun) k                                         ');
       end;
          Sql.Add('  where i.empno=j.empno and i.empno=k.empno and j.empno=k.empno                                              ');
          Sql.Add('    and i.gubun=j.gubun and i.gubun=k.gubun and j.gubun=k.gubun                                              ');
       if ED_empno.empno <> '' then
          Sql.Add('    and i.empno=''' + ED_empno.empno + '''                                                                   ');

       if ED_payra.codename <> '' then
       begin
          Sql.Add('    and (select codefname from pyccode                                                                       ');
          Sql.Add('          where codeid=''I113''                                                                              ');
          Sql.Add('            and codeno=(select payra from pimpmas                                                            ');
          Sql.Add('                         where empno=i.empno))=''' + ED_payra.codename + '''                                 ');
       end;

       if ED_grade.Text <> '전체' then
          Sql.Add('    and i.grade=''' + ED_grade.Text + '''                                                                    ');

       if ED_gubun.Text <> '전체' then
          Sql.Add('    and i.gubun=''' + ED_gubun.Text + '''                                                                    ');

          ClearFieldInfo;
          AddField('ROWID'    , ftString,  5);
          AddField('EMPNO'    , ftString,  4);
          AddField('KORNAME'  , ftString, 12);
          AddField('DEPTNAME' , ftString, 60);
          AddField('CODEFNAME', ftString, 30);
          AddField('GRADE'    , ftString,  8);
          AddField('CPDATE'   , ftString,  8);
          AddField('GUBUN'    , ftString, 15);
          AddField('LECTIME'  , ftFloat,   5);
          AddField('SATPER'   , ftFloat,   5);
          AddField('LECCOST'  , ftFloat,  11);
          AddField('ALECTIME' , ftFloat,   5);
          AddField('ASATPER'  , ftFloat,   5);
          AddField('ALECCOST' , ftFloat,  11);
          Open;
//          TStringField(FieldByName('CPDATE'     )).EditMask := '!9999-99-99;0;_';
          TFloatField(FieldByName('LECTIME' )).DisplayFormat := '##0.0';
          TFloatField(FieldByName('SATPER'  )).DisplayFormat := '0.0'  ;
          TFloatField(FieldByName('LECCOST' )).DisplayFormat := '#,##0';
          TFloatField(FieldByName('ALECTIME')).DisplayFormat := '##0.0';
          TFloatField(FieldByName('ASATPER' )).DisplayFormat := '0.0'  ;
          TFloatField(FieldByName('ALECCOST')).DisplayFormat := '#,##0';

     end;
end;

procedure TfrmMain.ED_AllChange(Sender: TObject);
begin
     FormShow(Self);
end;

procedure TfrmMain.OnFocusButton4Click(Sender: TObject);
begin
     Close;
end;

procedure TfrmMain.OnFocusButton2Click(Sender: TObject);
var
   SepArray : array[0..4] of String;
   i : integer;
begin
     if TDS_Grid1.RecordCount<=0 then exit;

     SaveDialog1.FileName :='강의이력(종합).xls';     
     if SaveDialog1.Execute then
     begin
         with TStringList.Create do
         try
           i:=0;
           SepArray[0] := '합계';
           SepArray[1] := '사내강사(HR)';
           SepArray[2] := '사내강사(PI)';
           SepArray[3] := '강사(HR)';
           SepArray[4] := '강사(PI)';

           Add(pchar('구분'             +#9+
                     '합계(인원)'       +#9+
                     '경영일반(인원)'   +#9+
                     '영업/마케팅(인원)'+#9+
                     '기술(인원)'       +#9+
                     '기타(인원)'       +#9+
                     '강의시간('        +FG_sysYY+'년)'+#9+
                     '만족도('          +FG_sysYY+'년)'+#9+
                     '강의료('          +FG_sysYY+'년)'+#9+
                     '강의시간('        +ED_All.Text+')'+#9+
                     '만족도('          +ED_All.Text+')'+#9+
                     '강의료('          +ED_All.Text+')'));

           while not TDS_Grid1.Eof do
           begin
             Add(Format('%s'+#9+                             //  '구분'
                        '%s'+#9+                             //  '합계(인원)'
                        '%s'+#9+                             //  '경영일반(인원)'
                        '%s'+#9+                             //  '영업/마케팅(인원)'
                        '%s'+#9+                             //  '기술(인원)'
                        '%s'+#9+                             //  '기타(인원)'
                        '%s'+#9+                             //  '강의시간('
                        '%s'+#9+                             //  '만족도('
                        '%s'+#9+                             //  '강의료('
                        '%s'+#9+                             //  '강의시간('
                        '%s'+#9+                             //  '만족도('
                        '%s',                                //  '강의료('

                   [ SepArray[i],                            //  '구분'
                     TDS_Grid1.Fields[ 1].AsString,          //  '합계(인원)'
                     TDS_Grid1.Fields[ 2].AsString,          //  '경영일반(인원)'
                     TDS_Grid1.Fields[ 3].AsString,          //  '영업/마케팅(인원)'
                     TDS_Grid1.Fields[ 4].AsString,          //  '기술(인원)'
                     TDS_Grid1.Fields[ 5].AsString,          //  '기타(인원)'
                     TDS_Grid1.Fields[ 6].AsString,          //  '강의시간('
                     TDS_Grid1.Fields[ 7].AsString,          //  '만족도('
                     TDS_Grid1.Fields[ 8].AsString,          //  '강의료('
                     TDS_Grid1.Fields[ 9].AsString,          //  '강의시간('
                     TDS_Grid1.Fields[10].AsString,          //  '만족도('
                     TDS_Grid1.Fields[11].AsString ]));      //  '강의료('
             TDS_Grid1.Next;
             i:=i+1;
           end; // end of for
           SaveToFile(SaveDialog1.FileName);
         finally
         Free;
         end; // end of try
     end; //end of SaveDialog1.Execute
end;

procedure TfrmMain.OnFocusButton3Click(Sender: TObject);
begin
     if TDS_Grid2.RecordCount<=0 then exit;

     SaveDialog1.FileName :='강의이력(개인).xls';
     if SaveDialog1.Execute then
     begin
         with TStringList.Create do
         try
           Add(pchar('연번'       +#9+
                     '사번'       +#9+
                     '이름'       +#9+
                     '소속'       +#9+
                     '직위'       +#9+
                     '등급'       +#9+
                     '수료시기'   +#9+
                     '강의분야'   +#9+
                     '강의시간('  +FG_sysYY+'년)'+#9+
                     '만족도('    +FG_sysYY+'년)'+#9+
                     '강의료('    +FG_sysYY+'년)'+#9+
                     '강의시간('  +Ed_All.Text+')'+#9+
                     '만족도('    +Ed_All.Text+')'+#9+
                     '강의료('    +Ed_All.Text+')'));

           while not TDS_Grid2.Eof do
           begin
             Add(Format('%s'+#9+         //'연번'
                        '%s'+#9+         //'사번'
                        '%s'+#9+         //'이름'
                        '%s'+#9+         //'소속'
                        '%s'+#9+         //'직위'
                        '%s'+#9+         //'등급'
                        '%s'+#9+         //'수료시기'
                        '%s'+#9+         //'강의분야'
                        '%s'+#9+         //'강의시간('
                        '%s'+#9+         //'만족도('
                        '%s'+#9+         //'강의료('
                        '%s'+#9+         //'강의시간('
                        '%s'+#9+         //'만족도('
                        '%s',            //'강의료('
                   [ TDS_Grid2.Fields[0].AsString,        //'연번'
                     TDS_Grid2.Fields[1].AsString,        //'사번'
                     TDS_Grid2.Fields[2].AsString,        //'이름'
                     TDS_Grid2.Fields[3].AsString,        //'소속'
                     TDS_Grid2.Fields[4].AsString,        //'직위'
                     TDS_Grid2.Fields[5].AsString,        //'등급'
                     TDS_Grid2.Fields[6].AsString,        //'수료시기'
                     TDS_Grid2.Fields[7].AsString,        //'강의분야'
                     TDS_Grid2.Fields[8].AsString,        //'강의시간('
                     TDS_Grid2.Fields[9].AsString,        //'만족도('
                     TDS_Grid2.Fields[10].AsString,       //'강의료('
                     TDS_Grid2.Fields[11].AsString,       //'강의시간('
                     TDS_Grid2.Fields[12].AsString,       //'만족도('
                     TDS_Grid2.Fields[13].AsString]));    //'강의료('
             TDS_Grid2.Next;
           end; // end of for
           SaveToFile(SaveDialog1.FileName);
         finally
         Free;
         end; // end of try
     end; //end of SaveDialog1.Execute
end;

end.
