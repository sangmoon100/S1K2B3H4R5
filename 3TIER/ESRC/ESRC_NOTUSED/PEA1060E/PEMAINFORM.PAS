unit PeMainForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, pegradpanl, peoutlookbtn, PeJeonLabel, StdCtrls, Db, DbTables,
  Mask, pebtnedit, Grids, DBGrids, pedbgrid, pedbutil, pegraphic, TmaxFunc ,
  pereg, jeonPan, NotesHana_TLB,OnInsaCommon, OnEditBaseCtrl, registry, PDownLoad,
  inifiles,pass, OnEditStdCtrl, OnEditNumCtl, Tmax_DataSetText, Buttons, Func;//, DBGridEx;
type
  TMainForm = class(TForm)
    DBSet1: TTMaxDataSet;
    P_Title: TPeJeonGrdPanel;
    Bt_Mod: TPeJeonOutLookBtn;
    Bt_serch2: TPeJeonOutLookBtn;
    PeJeonGrdPanel2: TPeJeonGrdPanel;
    DataSource1: TDataSource;
    Query1: TTMaxDataSet;
    sGrid1: TStringGrid;
    Panel1: TPanel;
    Bt_Srh1: TPeJeonOutLookBtn;
    rg_Check: TRadioGroup;
    Label1: TLabel;
    Sb_Ok: TPeJeonOutLookBtn;
    Bt_Exit: TPeJeonOutLookBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Bt_ExitClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Bt_ModClick(Sender: TObject);
    procedure Bt_serch2Click(Sender: TObject);
    procedure Sb_OkClick(Sender: TObject);
    procedure Grid1KeyPress(Sender: TObject; var Key: Char);
    procedure Bt_Srh1Click(Sender: TObject);
    procedure sGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);

  private
    { Private declarations }
    Start    : Boolean;
    Inter    : ILotusNotes_Hana;
    pEmpno   : string;  // �α��� ���
    pKorname : string;  // �α��� ����
    pPass    : String;
    pClass   : string;  // �α��� ���
    ComIp    : string;

    Lsysdate   : string;
    Lfordate   : string;
    Lwork      : string;  // �۾��� ����.
    Le2empno   : string;  // 2�� ����
    Le1korname : string;  // 1�� ���� ����.
    Le2korname : string;  // 2�� ���� ����.
    Lebrempno   : string;  // ������
    Lebrkorname : string;  // ������ ����

    grvalconyn  ,
    ge1valconyn ,
    ge2valconyn ,
    ge1valobjyn ,
    ge2valobjyn : string;

    gebrvalconyn ,
    gebrvalobjyn : string;
    iChkSenioryn : integer;
    LSfilename : string;
    LAarg : array[0..200] of char;
    LWerrrtn : word;

    function GetBaseYear(gubun : integer) : string;
    function  Csel_gfd(p_loc: Integer): String;
    procedure SqlOpen;

  public
    gsLastConEv  : String;  //������ǥ���������� (1�� or 2��)
    Lrabasdate   : string;  // �򰡱�����.
    Le1empno     : string;  // 1�� ����
    g_mainweight : string;  // ��ü ����
    EvalYN       : Boolean;
    { Public declarations }
  end;

var
  MainForm: TMainForm;
  FSvr    : OleVariant;
  vOrgnum, vDeptcode : string;
  ACol,ARow: Integer;

const
  Msg = '��ǥ ����� ������ �ٿ�� �� �����ϴ�.'+#13#13+'����ڿ��� ���� �Ͻʽÿ�'#13;

implementation

uses
  Hinsa_TmaxDM, peDm;//, pea1060a1, pea1060a2, pea1060a3, pea1060b1;

{$R *.DFM}

//�۾��� �ʿ��� ��¥ ���
function TMainForm.GetBaseYear(gubun : integer) : string;
var
  Sql     : string;
begin
  Result := '';

  if gubun = 1 then                                            //������ ������(Lrabasdate)
    Sql := 'SELECT VALUE1 FROM PEHREBAS WHERE RABASDATE = ''00000000'' AND GUBUN = ''00'' AND SGUBUN = ''0001'' ';

  if gubun = 2 then                                            //�Ϲݱ� ������ ������(LFordate)
    Sql := 'SELECT VALUE2 FROM PEHREBAS WHERE RABASDATE = ''00000000'' AND GUBUN = ''00'' AND SGUBUN = ''0003'' ';

  if gubun = 3 then                                            //�ý��� �ð�(Lsysdate)
    Sql := 'SELECT TO_CHAR(SYSDATE,''YYYYMMDDHH24MISSD'') FROM DUAL ';

  if gubun = 4 then                                            //
    Sql := 'SELECT NVL(VALUE5,'' '') FROM PEHREBAS  '+
           ' WHERE RABASDATE = ''' + Lrabasdate + ''' AND GUBUN = ''11'' AND SGUBUN = ''0003'' ';

  if gubun = 5 then                                            //����ü�躯����
    Sql := 'SELECT NVL(VALUE3,'' '') FROM PIMVARI    '+
           ' WHERE GUBUN = ''00 AND SGUBUN = ''0001'' ';

  DataModule_Tmax.Csel_SQL := Sql;
  DataModule_Tmax.Csel_Open4;
  Result := DataModule_Tmax.Csel_gfd4(1);
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Query1.Close;
  Inter := nil;
  Action := caFree;
end;

procedure TMainForm.FormCreate(Sender: TObject);
var
  sMsg : string;
begin
  sMsg := DataModule_Tmax.Connect_Session;

  if sMsg <> '' then
  begin
    Application.MessageBox(PChar(msg),'TMAX����',mb_ok);
    Application.Terminate;
    Exit;
  end;

  //2013.11. Add �Ķ���Ϳ� ���Ͽ� ��ȣ �ٸ��� ���� ����.
  {FM_Tmax := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := DataModule_Tmax.TMaxSession;
  if FM_Tmax.PassWordChk(Hinsa_Param(cmdline,1), Hinsa_Param(cmdline,3)) = 0 then
    Application.Terminate;}

  Start := True;
  Inter := nil;
  VarLoading;
end;

procedure TMainForm.Bt_ExitClick(Sender: TObject);
begin
  Close;
end;

function TMainForm.Csel_gfd(p_loc: Integer): String;
var
  v_cnt, v_tmp: Integer;
  v_data: String;
begin
  Result := '';
  v_data := DBSet1.FieldByName('SEL_DATA').AsString;
  v_cnt := 1;
  while v_cnt < p_loc do
  begin
    v_tmp := Pos(';',v_data);
    if not(v_tmp > 0) then Exit;
    v_cnt := v_cnt + 1;
    Delete(v_data, 1, v_tmp);
  end;
  v_tmp := Pos(';',v_data) - 1;
  if v_tmp < 0 then v_tmp := Length(v_data);
  Result := Copy(v_data,1,v_tmp);
end;

procedure TMainForm.FormShow(Sender: TObject);
const
 ObjName = 'SOFTWARE\(��) �ϳ���\NEW�����λ������ý���';
var SqlText : string;
    reg_exe: TRegistry;
    //reg_path,str: String;
    FM_DownLoad: TFM_DownLoad;  //Form�� �߰�..
begin
  sGrid1.Cells[1,0] := '�� ��';
  sGrid1.Cells[2,0] := '�� ��';
  sGrid1.Cells[3,0] := '�� å';
  sGrid1.Cells[4,0] := '�� �� ��';
  sGrid1.Cells[5,0] := '��ǥ���';
  sGrid1.Cells[6,0] := '�����Ȳ';
  sGrid1.Cells[7,0] := '�� ��';


   pEmpno   := peParam(CmdLine,1);
   pKorname := peParam(CmdLine,2);
   pPass    := peParam(CmdLine,3);
   pClass   := peParam(CmdLine,4);
   ComIp    := peParam(Cmdline,5);

   Lrabasdate := GetBaseYear(1);            //������ ������
  { SqlText := ' select payra from PEHREAIM_COMBAS '+
              ' where rabasdate =  ''' + Lrabasdate + ''' '+
              ' and empno = ''' + pEmpno + ''' ' +
              ' and payra in (''2C'',''58'',''16'',''38'') ';
   }
   //����� ('M~ ����� ����.)
   SqlText := ' select payra from PEHREAIM_COMBAS '+
              ' where rabasdate =  ''' + Lrabasdate + ''' '+
              ' and empno = ''' + pEmpno + ''' ';

   with DBSet1 do
   begin
      Close;
      ServiceName := 'PEA1060A_common';
      ClearFieldInfo;
      AddField('SEL_DATA', ftString, 300);
      ClearParamInfo;
      SQL.Text := SqlText;
      Open;


      if RecordCount < 1 then
      begin
         //�������ϰ��
         //���� �����ڰ�
        SqlText := ' select payra from PEHREAIM_COMBAS '+
                     ' where rabasdate =  ''' + Lrabasdate + ''' '+
                       ' and empno = ''' + pEmpno + ''' ' +
                       ' and unionyn = ''Y'' ';
         with DBSet1 do
         begin
            Close;
            ServiceName := 'PEA1060A_common';
            ClearFieldInfo;
            AddField('SEL_DATA', ftString, 300);
            ClearParamInfo;
            SQL.Text := SqlText;
            Open;
            if RecordCount > 0 then
            begin
               //������ǥ������Դϴ�.
               reg_exe.Writestring( 'KillProcess', 'ok');
               Bt_serch2Click(self);

//               Bt_ExitClick(self);
            end
            else
            begin
               //�Ϲݸ�ǥ�����
               reg_exe.Writestring( 'KillProcess', 'ok');
               Bt_ModClick(self);
 //              Bt_ExitClick(self);
            end;
         end;
      end
      //�����ڰ� ������ ��� ��ǥ��ϰ��缱��ȭ���� ������ �� ������ displayó�� ��Ų��.
      else
      begin
        //������ display�Ҽ� �ִ�  sql�� �����ؾ� �Ѵ�.
        SqlOpen;
      end;

   end;
{showmessage( passemp(cmdline,1) +' '+ passemp(cmdline,2) +' '+ passemp(cmdline,3) +' '+
              passemp(cmdline,4) +' '+ passemp(cmdline,5) +' '+ passemp(cmdline,6) +' '+
              passemp(cmdline,7) +' '+ passemp(cmdline,8) +' '+ passemp(cmdline,9) +' '+
              passemp(cmdline,10) +' '+ passemp(cmdline,11) +' '+
              passemp(cmdline,12) +' '+ passemp(cmdline,13) );
}
end;

procedure TMainForm.Bt_ModClick(Sender: TObject);
begin
   //�Ϲݸ�ǥ���
   // dsa2000  Program Down �Ǵ� Call �Ͽ� �����ϱ�.
   FM_DownLoad := TFM_DownLoad.Create(Application);
   FM_DownLoad.Show;
   FM_DownLoad.PL_ReadEnv;                     //ȯ�溯����(�Ķ����) �о�´�.
   FM_DownLoad.PL_VersionCHK3(3, 'PEA1060A');  //Call�ϴ� ���� ���α׷��� ������ üũ..
   if (not FM_DownLoad.FL_VersionCHK ) or
      (not FileExists(GetHomeDir+'\Bin\3tier\PEA1060A.EXE')) then
   begin
      FM_DownLoad.PL_DownLoad(3,'/hper/insa/hperson/usrbin/Ebin','PEA1060A.EXE','PEA1060A',FM_DownLoad.FL_ProgVer, FL_UnixIP,FL_FtpUser,FL_FtpPass);
   end
   else
   begin
      FM_DownLoad.SB_Help.Panels[1].Text := '����PC�� ���α׷��� �����մϴ�.';

      LSfilename := GetHomeDir+'\Bin\3Tier\PEA1060A.EXE ,'
                  +Passemp(cmdline,1) +','+Passemp(cmdline,2)+','+'@@@@@'+','
                  +Passemp(cmdline,4) +','+Passemp(cmdline,5)+','+Passemp(cmdline,6)+','
                  +Passemp(cmdline,7) +','+Passemp(cmdline,8)+','+Passemp(cmdline,9)+','//+' '+','+' '+','+' '+','
                  +Passemp(cmdline,10)+','+Passemp(cmdline,11)+','+Passemp(cmdline,12)+','
                  +Passemp(cmdline,13)+','+Passemp(cmdline,14)+','+Passemp(cmdline,15);

      strpcopy( LAarg, LSfilename );
      winexec(LAarg, SW_SHOWNORMAL);

      FM_DownLoad.Close;      // �ٿ�ε� �� �ݱ�.
   end;
end;

procedure TMainForm.Bt_serch2Click(Sender: TObject);
begin
   //������ǥ���
   FM_DownLoad := TFM_DownLoad.Create(Application);
   FM_DownLoad.Show;
   FM_DownLoad.PL_ReadEnv;                     //ȯ�溯����(�Ķ����) �о�´�.
   FM_DownLoad.PL_VersionCHK3(3, 'PEA1060D');  //Call�ϴ� ���� ���α׷��� ������ üũ..
   if (not FM_DownLoad.FL_VersionCHK ) or
      (not FileExists(GetHomeDir+'\Bin\3tier\PEA1060D.EXE')) then
   begin
      FM_DownLoad.PL_DownLoad(3,'/hper/insa/hperson/usrbin/Ebin','PEA1060D.EXE','PEA1060D',FM_DownLoad.FL_ProgVer, FL_UnixIP,FL_FtpUser,FL_FtpPass);
   end
   else
   begin
      FM_DownLoad.SB_Help.Panels[1].Text := '����PC�� ���α׷��� �����մϴ�.';
      LSfilename := GetHomeDir+'\Bin\3Tier\PEA1060D.EXE ,'
                 +Passemp(cmdline,1) +','+Passemp(cmdline,2)+','+'@@@@@'+','
                 +Passemp(cmdline,4) +','+Passemp(cmdline,5)+','+Passemp(cmdline,6)+','
                 +Passemp(cmdline,7) +','+Passemp(cmdline,8)+','+Passemp(cmdline,9)+','//+' '+','+' '+','+' '+','
                 +Passemp(cmdline,10)+','+Passemp(cmdline,11)+','+Passemp(cmdline,12)+','
                 +Passemp(cmdline,13)+','+Passemp(cmdline,14)+','+Passemp(cmdline,15);

      strpcopy( LAarg, LSfilename );
      winexec(LAarg, SW_SHOWNORMAL);

      FM_DownLoad.Close;      // �ٿ�ε� �� �ݱ�.
   end;
end;

procedure TMainForm.Sb_OkClick(Sender: TObject);
const
 ObjName = 'SOFTWARE\(��) �ϳ���\NEW�����λ������ý���';
var fName: TextFile;
    regtry: TRegistry;
begin

{showmessage( passemp(cmdline,1) +' '+ passemp(cmdline,2) +' '+ passemp(cmdline,3) +' '+
              passemp(cmdline,4) +' '+ passemp(cmdline,5) +' '+ passemp(cmdline,6) +' '+
              passemp(cmdline,7) +' '+ passemp(cmdline,8) +' '+ passemp(cmdline,9) +' '+
              passemp(cmdline,10) +' '+ passemp(cmdline,11) +' '+
              passemp(cmdline,12) +' '+ passemp(cmdline,13) );
}
  if sGrid1.Cells[5,sGrid1.Row] = '����' then
  begin
     AssignFile(fName, GetHomeDir+'\IDCheck2.txt');
     Rewrite(fName);
     //Writeln(fName, '1');                                  //���а�

     Writeln(fName, sGrid1.Cells[1,sGrid1.Row]); //empno
     CloseFile(fName);

     regtry := TRegistry.Create;
     regtry.RootKey := HKEY_LOCAL_MACHINE;
     //HKEY_LOCAL_MACHINE\SOFTWARE\(��) �ϳ���\NEW�����λ������ý��� //NewHomeDir
     if regtry.OpenKey(ObjName,False) then
        regtry.Writestring( 'KillProcess', '');
     regtry.CloseKey();
     regtry.Free;                               //showmessage(GSHomeDir);

     //���� ������ǥ����ڸ� ������ ����̸�
     Bt_serch2Click(self);
  end
  else
  begin
     AssignFile(fName, GetHomeDir+'\IDCheck1.txt');
     Rewrite(fName);
     //Writeln(fName, '1');                                  //���а�
     Writeln(fName, sGrid1.Cells[1,sGrid1.Row]); //empno
     CloseFile(fName);

     regtry := TRegistry.Create;
     regtry.RootKey := HKEY_LOCAL_MACHINE;
     //HKEY_LOCAL_MACHINE\SOFTWARE\(��) �ϳ���\NEW�����λ������ý��� //NewHomeDir
     if regtry.OpenKey(ObjName,False) then
        regtry.Writestring( 'KillProcess', '');
     regtry.CloseKey();
     regtry.Free;
                                                //showmessage(GSHomeDir);
     Bt_ModClick(self);
  end;
  //Bt_ExitClick(self);
end;

procedure TMainForm.Grid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Chr(13) then
    begin
       Key := #0;
       Sb_OkClick(Sender);
    end;
end;

procedure TMainForm.SqlOpen;
var
  i       : integer;
  Field   : TField;
  Str     : string;
  OleData : OleVariant;
  SqlText : string;
  stmp    : string;
begin
//  if Fe12 then    // �����ڰ� 1, 2�� �����ΰ��
  //if MainForm.EvalYN then
  {
   from pehremas a, pehreaim_combas h
                         where a.empno     = h.empno  (+)
                           AND a.rabasdate = h.rabasdate (+)
                           AND substr(a.deptcode,1,4) = substr(h.deptcode,1,4)
                           AND nvl(h.unionyn,'N') = 'Y'
  }
  if rg_Check.ItemIndex = 0 then
     stmp:= '''Y'''+',''N'''
  else if rg_Check.ItemIndex = 1 then
     stmp:= '''Y'''
  else if rg_Check.ItemIndex = 2 then
     stmp:= '''N''';


  //2006.11.25 ������ ���� ���� �λ縶���͸� ���� �ʿ䰡 �����Ƿ� ������
  SqlText :=
        'SELECT  '+
        ' nvl(        empno      ,'' ''), '+ #13 +
        ' nvl(        korname    ,'' ''), '+ #13 +
        ' nvl(        UNIONYN    ,'' ''), '+ #13 +
        ' nvl(        paycl      ,'' ''), '+ #13 +
        ' nvl(        deptcode   ,'' ''), '+ #13 +
        ' nvl(        codename   ,'' ''), '+ #13 +
        ' nvl(        deptname   ,'' ''), '+ #13 +
        ' nvl(        prog       ,'' ''), '+ #13 +
        ' nvl(        ebryn      ,'' '')  '+ #13 +
        ' FROM ( '+ #13 +
        '   SELECT a.empno,a.korname,a.jobgun,a.payra paycl,a.deptcode,       '+ #13 +
        '          d.codename,e.deptname,                               '+ #13 +
        '          decode(f.value5,''2��'',                             '+ #13 +
        '            decode(c.e2prjobjyn, ''Y'', ''2������ �ݷ�'',    '+ #13 +
        '              decode(c.e2prjconyn, ''Y'', ''��ǥ�����Ϸ�'',    '+ #13 +
        '                decode(b.e1prjobjyn, ''Y'', ''1������ �ݷ�'','+ #13 +
        '                  decode(b.e1prjconyn, ''Y'', decode(c.e2empno,'''',''��ǥ�����Ϸ�'',''2������ Ȯ����''),'+ #13 +
        '                    decode(a.rprjconyn,  ''Y'', ''1������ Ȯ����'',''��ǥ������''))))), '+ #13 +
        '            decode(b.e1prjobjyn, ''Y'', ''1������ �ݷ�'',         '+ #13 +
        '              decode(b.e1prjconyn, ''Y'', ''��ǥ�����Ϸ�'',         '+ #13 +
        '                decode(a.rprjconyn,  ''Y'', ''1������ Ȯ����'',''��ǥ������''))) ) prog, '+ #13 +
        '          decode(g.ebryn,      ''Y'', ''������'', '''' ) ebryn ,'+ #13 +
        '          nvl(h.UNIONYN,''N'') UNIONYN '+ #13 +
 Format('   FROM  '+ #13 +
        '     pehremas a, pehreaim_combas h, '+ #13 +
        '     (SELECT empno,e1empno,e1prjconyn,e1prjobjyn,e1valconyn,e1valobjyn    '+ #13 +
        '        FROM pehremas                                                     '+ #13 +
        '       WHERE rabasdate = ''%s'' AND reconyn = ''Y'' AND e1existyn = ''Y'' '+ #13 +
        '       GROUP BY empno,e1empno,e1prjconyn,e1prjobjyn,e1valconyn,e1valobjyn '+ #13 +
        '     ) b,                                                                 '+ #13 +
        '     (SELECT empno,e2empno,e2prjconyn,e2prjobjyn,e2valconyn,e2valobjyn    '+ #13 +
        '        FROM pehremas                                                     '+ #13 +
        '       WHERE rabasdate = ''%s'' AND reconyn = ''Y'' AND e2existyn = ''Y'' '+ #13 +
        '       GROUP BY empno,e2empno,e2prjconyn,e2prjobjyn,e2valconyn,e2valobjyn '+ #13 +
        '     ) c,                                                                 '+ #13 +
        '     pyccode d, pycdept e,       '+  #13 +
        '     (select empno, ebrempno, decode(ebrempno, '''', ''N'', ''Y'') ebryn  '+ #13 +
        '      from   pehremas                                                     '+ #13 +
        '      where  rabasdate = ''%s''                                           '+ #13 +
        '        AND reconyn    = ''Y''                                            '+ #13 +
        '        AND ebrexistyn = ''Y''                                            '+ #13 +
        '        AND ebrempno = ''%s''                                             '+ #13 +
        '      GROUP BY empno, ebrempno ) g,                                       '+ #13 +
        '     (select decode(value5,'''',''2��'',value5) value5 from pehrebas where rabasdate = ''%s'' and gubun = ''11'' and sgubun = ''0003'') f '+ #13 +
        '   WHERE a.empno     = b.empno    '+ #13 +
        '     AND a.empno     = h.empno(+) '+ #13 +
        '     AND a.rabasdate = h.rabasdate(+) '+ #13 +
        '     AND substr(a.deptcode,1,4) = substr(h.deptcode(+),1,4) '+ #13 +  //������
        '     AND nvl(h.unionyn,''N'') in ( %s )'+ #13 +
        '     AND a.empno     = c.empno(+) '+ #13 +
        '     AND a.empno     = g.empno(+) '+ #13 +
        '     AND a.rabasdate = ''%s''     '+ #13 +
        '     AND a.reconyn= ''Y''         '+ #13 +
        '     AND a.payra  = d.codeno(+) AND d.codeid(+) = ''I113''              '+ #13 +
        '     AND a.orgnum = e.orgnum(+) AND a.deptcode  = e.deptcode(+)         '+ #13 +
        '     AND (a.empno = ''%s'' OR b.e1empno = ''%s''                        '+ #13 +
        '          OR g.ebrempno = ''%s''                                        '+ #13 +
        '          OR (f.value5 = ''2��'' AND c.e2empno = ''%s''))               '+ #13 +
        ' ) '+ #13 +
        ' ORDER BY ebryn desc, deptcode, paycl, empno ',
        [ Lrabasdate,Lrabasdate,Lrabasdate,pEmpno,Lrabasdate,stmp,Lrabasdate,pEmpno,pEmpno,pEmpno,pEmpno ])  ;

   //���� ��� �强ȣ
   {     'SELECT  '+
        ' nvl(        empno      ,'' ''), '+ #13 +
        ' nvl(        korname    ,'' ''), '+ #13 +
        ' nvl(        UNIONYN    ,'' ''), '+ #13 +
        ' nvl(        paycl      ,'' ''), '+ #13 +
        ' nvl(        deptcode   ,'' ''), '+ #13 +
        ' nvl(        codename   ,'' ''), '+ #13 +
        ' nvl(        deptname   ,'' ''), '+ #13 +
        ' nvl(        prog       ,'' ''), '+ #13 +
        ' nvl(        ebryn      ,'' '')  '+ #13 +
        ' FROM ( '+ #13 +
        '   SELECT a.empno,a.korname,a.jobgun,a.paycl,a.deptcode,       '+ #13 +
        '          d.codename,e.deptname,                               '+ #13 +
        '          decode(f.value5,''2��'',                             '+ #13 +
        '            decode(c.e2prjobjyn, ''Y'', ''2������ �ݷ�'',    '+ #13 +
        '              decode(c.e2prjconyn, ''Y'', ''��ǥ�����Ϸ�'',    '+ #13 +
        '                decode(b.e1prjobjyn, ''Y'', ''1������ �ݷ�'','+ #13 +
        '                  decode(b.e1prjconyn, ''Y'', decode(c.e2empno,'''',''��ǥ�����Ϸ�'',''2������ Ȯ����''),'+ #13 +
        '                    decode(a.rprjconyn,  ''Y'', ''1������ Ȯ����'',''��ǥ������''))))), '+ #13 +
        '            decode(b.e1prjobjyn, ''Y'', ''1������ �ݷ�'',         '+ #13 +
        '              decode(b.e1prjconyn, ''Y'', ''��ǥ�����Ϸ�'',         '+ #13 +
        '                decode(a.rprjconyn,  ''Y'', ''1������ Ȯ����'',''��ǥ������''))) ) prog, '+ #13 +
        '          decode(g.ebryn,      ''Y'', ''������'', '''' ) ebryn ,'+ #13 +
        '          nvl(h.UNIONYN,''N'') UNIONYN '+ #13 +
 Format('   FROM  '+ #13 +
        '     pehremas a, pehreaim_combas h, pimpmas i, '+ #13 +
        '     (SELECT empno,e1empno,e1prjconyn,e1prjobjyn,e1valconyn,e1valobjyn    '+ #13 +
        '        FROM pehremas                                                     '+ #13 +
        '       WHERE rabasdate = ''%s'' AND reconyn = ''Y'' AND e1existyn = ''Y'' '+ #13 +
        '       GROUP BY empno,e1empno,e1prjconyn,e1prjobjyn,e1valconyn,e1valobjyn '+ #13 +
        '     ) b,                                                                 '+ #13 +
        '     (SELECT empno,e2empno,e2prjconyn,e2prjobjyn,e2valconyn,e2valobjyn    '+ #13 +
        '        FROM pehremas                                                     '+ #13 +
        '       WHERE rabasdate = ''%s'' AND reconyn = ''Y'' AND e2existyn = ''Y'' '+ #13 +
        '       GROUP BY empno,e2empno,e2prjconyn,e2prjobjyn,e2valconyn,e2valobjyn '+ #13 +
        '     ) c,                                                                 '+ #13 +
        '     pyccode d, pycdept e,       '+  #13 +
        '     (select empno, ebrempno, decode(ebrempno, '''', ''N'', ''Y'') ebryn  '+ #13 +
        '      from   pehremas                                                     '+ #13 +
        '      where  rabasdate = ''%s''                                           '+ #13 +
        '        AND reconyn    = ''Y''                                            '+ #13 +
        '        AND ebrexistyn = ''Y''                                            '+ #13 +
        '        AND ebrempno = ''%s''                                             '+ #13 +
        '      GROUP BY empno, ebrempno ) g,                                       '+ #13 +
        '     (select decode(value5,'''',''2��'',value5) value5 from pehrebas where rabasdate = ''%s'' and gubun = ''11'' and sgubun = ''0003'') f '+ #13 +
        '   WHERE a.empno     = b.empno    '+ #13 +
        '     AND a.empno     = h.empno(+) '+ #13 +
        '     AND a.rabasdate = h.rabasdate(+) '+ #13 +
        '     AND decode(h.payra,''2C'',substr(a.deptcode,1,4),substr(i.jobdept,1,4)) = decode(h.payra,''2C'',substr(h.deptcode,1,4),substr(h.jobdept,1,4)) '+ #13 +
        '     AND nvl(h.unionyn,''N'') in ( %s )'+ #13 +
        '     AND a.empno     = c.empno(+) '+ #13 +
        '     AND a.empno     = g.empno(+) '+ #13 +
        '     AND a.empno     = i.empno    '+ #13 +
        '     AND a.rabasdate = ''%s''     '+ #13 +
        '     AND a.reconyn= ''Y''         '+ #13 +
        '     AND a.paycl  = d.codeno(+) AND d.codeid(+) = ''I112''              '+ #13 +
        '     AND a.orgnum = e.orgnum(+) AND a.deptcode  = e.deptcode(+)         '+ #13 +
        '     AND (a.empno = ''%s'' OR b.e1empno = ''%s''                        '+ #13 +
        '          OR g.ebrempno = ''%s''                                        '+ #13 +
        '          OR (f.value5 = ''2��'' AND c.e2empno = ''%s''))               '+ #13 +
        ' ) '+ #13 +
        ' ORDER BY ebryn desc, deptcode, paycl, empno ',
        [ Lrabasdate,Lrabasdate,Lrabasdate,pEmpno,Lrabasdate,stmp,Lrabasdate,pEmpno,pEmpno,pEmpno,pEmpno ])  ;}

  with Query1 do
  begin
    Close;
    ServiceName := 'PEA1060A_sel1';
    ClearFieldInfo;
    ClearParamInfo;
    AddField('empno'   , ftString, 4 );
    AddField('korname' , ftString, 12);
    AddField('UNIONYN' , ftString, 2 );
    AddField('paycl'   , ftString, 3 );
    AddField('deptcode', ftString, 6 );
    AddField('codename', ftString, 20);   //���� => ����->�� å'
    AddField('deptname', ftString, 60);   //�� �� ��'
    AddField('prog'    , ftString, 16);   //�����Ȳ
    AddField('ebryn'   , ftString,  6);   //��  ��'
    SQL.Text := Sqltext;

    Open;
  end;


  if Query1.Eof then
  begin

    MessageDlg('��ǥ���/���� ����ڰ� �ƴմϴ�3.'+#13+#10+''+#13+#10+'���α׷��� �ڵ�����˴ϴ�.', mtWarning, [mbOK], 0);
    Application.Terminate;
  end;

  with Query1 do
  begin
     first;
     sGrid1.RowCount := RecordCount +1;
     for i := 1 to RecordCount do
     begin
        sGrid1.Cells[1,i] := FieldByName('empno').AsString;   //���
        sGrid1.Cells[2,i] := FieldByName('korname').AsString; //����
        sGrid1.Cells[3,i] := FieldByName('codename').AsString;//����
        sGrid1.Cells[4,i] := FieldByName('deptname').AsString;//�� �� ��
        if FieldByName('UNIONYN').AsString = 'Y' then
           sGrid1.Cells[5,i] := '����' //��ǥ���
        else
           sGrid1.Cells[5,i] := '�Ϲ�'; //��ǥ���
        //sGrid1.Cells[5,i] := FieldByName('UNIONYN').AsString; //��ǥ���
        sGrid1.Cells[6,i] := FieldByName('prog').AsString;    //�����Ȳ
        sGrid1.Cells[7,i] := FieldByName('ebryn').AsString;   //���
        next;
     end;
  end;
  
  {
  for i := 0 to Query1.FieldCount - 1 do
  begin
      Field := Query1.Fields[i];
      Field.Visible := False;
      case Field.Index of
        0 : begin
              Field.Visible      := True;
              Field.DisplayWidth := 8;
              Field.DisplayLabel := '�� ��';
            end;
        1 : begin
              Field.Visible      := True;
              Field.DisplayWidth := 12;
              Field.DisplayLabel := '�� ��';
            end;

        5 : begin
              Field.Visible      := True;
              Field.DisplayWidth := 8;
              Field.DisplayLabel := '�� ��';
            end;

        6 : begin
              Field.Visible      := True;
              Field.DisplayWidth := 40;
              Field.DisplayLabel := '�� �� ��';
            end;
        2 : begin
              Field.Visible      := True;
              Field.DisplayWidth := 8;
              Field.DisplayLabel := '����';
            end;

        7 : begin
              Field.Visible      := True;
              Field.DisplayWidth := 30;
              Field.DisplayLabel := '�����Ȳ';
            end;
        8 : begin
              Field.Visible      := True;
              Field.DisplayWidth := 10;
              Field.DisplayLabel := '��  ��';
            end;
      end;
  end;
  }
  //Width := GetDisplayWidth(Grid1.Canvas,Grid1.Font,108) + 40;
 // Grid1.SetFocus;
end;

procedure TMainForm.Bt_Srh1Click(Sender: TObject);
begin
   SqlOpen;
end;

procedure TMainForm.sGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var Left : integer;
begin
   Left := Rect.Left + 3;
   if (ARow > 0) and (ACol = 5) then
   begin
      if (trim(sGrid1.Cells[ACol,ARow]) = '����')  then
      begin
         sGrid1.Canvas.Font.Color := clblue;
         sGrid1.Canvas.Font.size  := 10;
         sGrid1.Canvas.Font.Style := [fsBold];
      end
      else
      begin
         sGrid1.Canvas.Font.Color := clgreen;
         sGrid1.Canvas.Font.size  := 10;
         sGrid1.Canvas.Font.Style := [fsBold];
      end;
   end;
   if (ARow > 0) and (ACol = 6) then
   begin
      if (trim(sGrid1.Cells[ACol,ARow]) = '1������ Ȯ����') or 
         (trim(sGrid1.Cells[ACol,ARow]) = '2������ Ȯ����') then
      begin
         //sGrid1.Canvas.Font.Color := cllime;
      end
      else
         sGrid1.Canvas.Font.Color := clOlive;

   end;

   sGrid1.Canvas.FillRect(Rect);
   sGrid1.Canvas.TextRect(Rect, Left, Rect.Top+3, sGrid1.Cells[ACol,ARow]);

end;

end.
