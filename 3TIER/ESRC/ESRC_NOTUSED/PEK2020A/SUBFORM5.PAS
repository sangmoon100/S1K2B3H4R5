unit SubForm5;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  peoutlookbtn, pegradpanl, Grids, DBGrids, StdCtrls, Buttons,
  ExtCtrls, Mask, pebtnedit, Db, DBCGrids, DBCtrls, PeJeonBtnDateEdit,
  peextcombo, peNumedit, ComCtrls, Tabnotbk, DBGrid3D, peempnoform,
  PeJeonLabel, pedbgrid, OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl,
  OnEditCombo;

type
  TFm_SubForm5 = class(TForm)
    DS_mas1: TDataSource;
    PeJeonGrdPanel1: TPeJeonGrdPanel;
    Bt_Save: TPeJeonOutLookBtn;
    Bt_cancel: TPeJeonOutLookBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBG_mas1: TPeJeonDbGrid;
    Ed_empno: TPePanelEdit;
    Ed_korname: TPePanelEdit;
    L_tcnt: TPeJeonLabel;
    L_rcnt: TPeJeonLabel;
    L_e1cnt: TPeJeonLabel;
    Panel1: TPanel;
    E_base_yy: TPeJeonPanelComboBox;
    E_jmtrack: TOnComboEdit;
    E_jmlevel: TOnComboEdit;
    E_paycldate: TOnMaskEdit;
    E_Rvalcondate: TOnMaskEdit;
    E_E1valcondate: TOnMaskEdit;
    E_rvalconyn: TOnComboEdit;
    E_E1valconyn: TOnComboEdit;
    E_empno: TOnEdit;
    E_korname: TOnEdit;
    E_paycl: TOnEdit;
    E_dept: TOnEdit;
    E_e1empno: TOnEdit;
    E_e1korname: TOnEdit;
    E_E1payra: TOnEdit;
    E_E1dept: TOnEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Ed_empnoKeyPress(Sender: TObject; var Key: Char);
    procedure Ed_kornameKeyPress(Sender: TObject; var Key: Char);
    procedure DS_mas1DataChange(Sender: TObject; Field: TField);
    procedure PageControl1Change(Sender: TObject);
    procedure Bt_cancelClick(Sender: TObject);
    procedure Bt_SaveClick(Sender: TObject);
    procedure Ed_empnoClick(Sender: TObject);
    procedure E_rvalconynChange(Sender: TObject);
    procedure E_E1valconynChange(Sender: TObject);
    procedure DBG_mas1TitleClick(Column: TColumn);
  private
    { Private declarations }
    bAddMode : Boolean;
    procedure DataChage;
    procedure IDPbas_DataRead;
    procedure IDPmas_DataRead;
    procedure MasDataCount;

  public
    sRabasyy, sgubun, sekind, sablecode, simageno : String;
    isUp : Boolean;
    iFlag : Integer;

    Lbase_yy  : String;
    Ppaycl    : String;
    Porgnum   : String;
    Pdeptcode : String;
    TClick    : Integer;

    payrafr   : String;
    payrato   : String;
    pstate    : String;
    objdept1, objdept2, objdept3, objdept4, objdept5   : String;
    objdept6, objdept7, objdept8, objdept9, objdept10  : String;
    objemp1,  objemp2,  objemp3,  objemp4,  objemp5    : String;
    objemp6,  objemp7,  objemp8,  objemp9,  objemp10   : String;
    { Public declarations }
  end;

var
  Fm_SubForm5: TFm_SubForm5;

implementation

uses PMainForm, DmForm;


{$R *.DFM}

procedure TFm_SubForm5.FormCreate(Sender: TObject);
begin
  MainForm.St_Help.Panels[0].Text := '';
  IDPbas_DataRead;
  Lbase_yy :=  E_base_yy.Text;
  IDPmas_DataRead;
  DM.SetJmTrack(E_JmTrack, Lbase_yy, '',false,0);
  DM.SetJmLevel(E_JmLevel, Lbase_yy,false,0);
end;

procedure TFm_SubForm5.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFm_SubForm5.Ed_empnoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
       if DM.Qry_mas1.Locate('empno', Ed_empno.Text, [loPartialKey]) then
             DBG_mas1.SetFocus;
end;

procedure TFm_SubForm5.Ed_kornameKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
       if DM.Qry_mas1.Locate('korname', Ed_korname.Text, [loPartialKey]) then
             DBG_mas1.SetFocus;
end;

procedure TFm_SubForm5.IDPbas_DataRead;
begin
  with Dm.Qry_work do
  begin
       close;
       Sql.Clear;
       Sql.Add('select Value1                                        ');
       Sql.Add('  from peidpbas a                                    ');
       Sql.Add(' WHERE a.base_yy = ''0000''                          ');
       Sql.Add('   AND a.gubun   = ''00''                            ');
       Sql.Add('   AND a.sgubun  = ''0000''                          ');
       Open;

       E_base_yy.Text := fields[0].AsString;
  end;

  with Dm.Qry_work do
  begin
       close;
       Sql.Clear;
       Sql.Add('select Value1,  Value2,  Value3                      ');
       Sql.Add('  from peidpbas a                                    ');
       Sql.Add(' WHERE a.base_yy like '''+E_base_yy.Text+'''||''%''  ');
       Sql.Add('   AND a.gubun  = ''02''                             ');
       Sql.Add('   AND a.sgubun = ''0001''                           ');
       Open;

       payrafr   := fields[0].AsString;
       payrato   := fields[1].AsString;
       pstate    := fields[2].AsString;
  end;

  with Dm.Qry_work do
  begin
       close;
       Sql.Clear;
       Sql.Add('select NVL(Value1,''ZZZZZ''), NVL(Value2,''ZZZZZ''), ');
       Sql.Add('       NVL(Value3,''ZZZZZ''), NVL(Value4,''ZZZZZ''), ');
       Sql.Add('       NVL(Value5,''ZZZZZ''), NVL(Value6,''ZZZZZ''), ');
       Sql.Add('       NVL(Value7,''ZZZZZ''), NVL(Value8,''ZZZZZ''), ');
       Sql.Add('       NVL(Value9,''ZZZZZ''), NVL(Value10,''ZZZZZ'') ');
       Sql.Add('  from peidpbas a                                    ');
       Sql.Add(' WHERE a.base_yy like '''+E_base_yy.Text+'''||''%''  ');
       Sql.Add('   AND a.gubun  = ''02''                             ');
       Sql.Add('   AND a.sgubun = ''0002''                           ');
       Open;

       objdept1  := fields[0].AsString;
       objdept2  := fields[1].AsString;
       objdept3  := fields[2].AsString;
       objdept4  := fields[3].AsString;
       objdept5  := fields[4].AsString;
       objdept6  := fields[5].AsString;
       objdept7  := fields[6].AsString;
       objdept8  := fields[7].AsString;
       objdept9  := fields[8].AsString;
       objdept10 := fields[9].AsString;
  end;

  with Dm.Qry_work do
  begin
       close;
       Sql.Clear;
       Sql.Add('select NVL(Value1,''ZZZZ''), NVL(Value2,''ZZZZ''),   ');
       Sql.Add('       NVL(Value3,''ZZZZ''), NVL(Value4,''ZZZZ''),   ');
       Sql.Add('       NVL(Value5,''ZZZZ''), NVL(Value6,''ZZZZ''),   ');
       Sql.Add('       NVL(Value7,''ZZZZ''), NVL(Value8,''ZZZZ''),   ');
       Sql.Add('       NVL(Value9,''ZZZZ''), NVL(Value10,''ZZZZ'')   ');
       Sql.Add('  from peidpbas a                                    ');
       Sql.Add(' WHERE a.base_yy like '''+E_base_yy.Text+'''||''%''  ');
       Sql.Add('   AND a.gubun  = ''02''                             ');
       Sql.Add('   AND a.sgubun = ''0003''                           ');
       Open;

       objemp1   := fields[0].AsString;
       objemp2   := fields[1].AsString;
       objemp3   := fields[2].AsString;
       objemp4   := fields[3].AsString;
       objemp5   := fields[4].AsString;
       objemp6   := fields[5].AsString;
       objemp7   := fields[6].AsString;
       objemp8   := fields[7].AsString;
       objemp9   := fields[8].AsString;
       objemp10  := fields[9].AsString;
  end;
end;

procedure TFm_SubForm5.MasDataCount;
begin
  with Dm.Qry_work do
  begin
       close;
       Sql.Clear;
       Sql.Add('select Count(a.empno) TCount,                                      ');
       Sql.Add('       sum(decode(nvl(b.RVALCONYN,''N''),''Y'',1,0))  RCount,      ');
       Sql.Add('       sum(decode(nvl(b.E1VALCONYN,''N''),''Y'',1,0))  E1Count     ');
       Sql.Add('  FROM pimpmas a, peidpmas b                                       ');
       Sql.Add(' WHERE a.pstate     < '''+pstate +'''                              ');
       Sql.Add('   AND a.payra     >= '''+payrafr+'''                              ');
       Sql.Add('   AND a.payra     <= '''+payrato+'''                              ');
       Sql.Add('   AND a.empno    not in ('''+objemp1+''',  '''+objemp2+''',       ');
       Sql.Add('                          '''+objemp3+''',  '''+objemp4+''',       ');
       Sql.Add('                          '''+objemp5+''',  '''+objemp6+''',       ');
       Sql.Add('                          '''+objemp7+''',  '''+objemp8+''',       ');
       Sql.Add('                          '''+objemp9+''',  '''+objemp10+''')      ');
       Sql.Add('   AND a.deptcode not in ('''+objdept1+''', '''+objdept2+''',      ');
       Sql.Add('                          '''+objdept3+''', '''+objdept4+''',      ');
       Sql.Add('                          '''+objdept5+''', '''+objdept6+''',      ');
       Sql.Add('                          '''+objdept7+''', '''+objdept8+''',      ');
       Sql.Add('                          '''+objdept9+''', '''+objdept10+''')     ');
       Sql.Add('   AND a.empno      = b.empno                                      ');
       Sql.Add('   AND b.base_yy    = :p_base_yy                                   ');
       ParamByName('p_base_yy').AsString := Lbase_yy;
       open;

       L_tcnt.textCaption  :=  fields[0].AsString;
       L_rcnt.textCaption  :=  fields[1].AsString;
       L_e1cnt.textCaption :=  fields[2].AsString;
  end;
end;

procedure TFm_SubForm5.IDPmas_DataRead;
begin
  if Length(E_base_yy.Text) = 4 then
  begin
       with Dm.Qry_mas1 do
       begin
            close;
            Sql.Clear;
            Sql.Add('SELECT a.empno, a.korname,                                                             ');
            Sql.Add('       decode(b.paycldate, null,a.paycldate, b.paycldate) paycldate,                   ');
            Sql.Add('       (select codename from pyccode                                                   ');
            Sql.Add('         where codeid  =''I112''                                                       ');
            Sql.Add('           and codeno  =a.paycl) payclname, a.paycl,                                   ');
            Sql.Add('       (select deptName from pycdept                                                   ');
            Sql.Add('         where orgnum  =a.orgnum                                                       ');
            Sql.Add('           and deptcode=a.deptcode) deptname, a.orgnum, a.deptcode,                    ');
            Sql.Add('       b.bumoon,                                                                       ');
            Sql.Add('       (select hname from peidpcode                                                    ');
            Sql.Add('         where base_yy =:p_base_yy and classno = ''2''                                 ');
            Sql.Add('           and codeno  =b.bumoon) bumoonname,                                          ');
            Sql.Add('       b.jmtrack,                                                                      ');
            Sql.Add('       (select hname from peidpcode                                                    ');
            Sql.Add('         where base_yy =:p_base_yy and classno = ''3''                                 ');
            Sql.Add('           and joinno  =b.bumoon   and codeno = b.jmtrack) jmtrackname,                ');
            Sql.Add('       b.jmlevel,                                                                      ');
            Sql.Add('       (select hname from peidpcode                                                    ');
            Sql.Add('         where base_yy =:p_base_yy and classno = ''4''                                 ');
            Sql.Add('           and codeno  =b.jmlevel) jmlevelname,                                        ');
            Sql.Add('       b.E1empno,                                                                      ');
            Sql.Add('       (select korname from pimpmas                                                    ');
            Sql.Add('         where empno  = b.e1empno)  E1korname,                                         ');
            Sql.Add('       (select codename from pyccode                                                   ');
            Sql.Add('         where codeid  =''I113''                                                       ');
            Sql.Add('           and codeno  =(select jobpayra from pimpmas                                  ');
            Sql.Add('                          where empno  = b.e1empno    )) E1payraname,                  ');
            Sql.Add('       (select codename from pyccode                                                   ');
            Sql.Add('         where codeid  =''I112''                                                       ');
            Sql.Add('           and codeno  =(select paycl from pimpmas                                     ');
            Sql.Add('                          where empno  = b.e1empno    )) E1payclname,                  ');
            Sql.Add('       (select deptName from pycdept                                                   ');
            Sql.Add('         where (orgnum,deptcode)=(select orgnum,deptcode from pimpmas                  ');
            Sql.Add('                                   where empno  = b.e1empno           )) E1deptname,   ');
            Sql.Add('       b.RVALCONDATE,      b.E1VALCONDATE,                                             ');
            Sql.Add('       nvl(b.RVALCONYN,''N'')  RVALCONYN,                                              ');
            Sql.Add('       nvl(b.E1VALCONYN,''N'') E1VALCONYN                                              ');
            Sql.Add('  FROM pimpmas a, peidpmas b                                                           ');
            Sql.Add(' WHERE a.pstate     < '''+pstate +'''                                                  ');
            Sql.Add('   AND a.payra     >= '''+payrafr+'''   AND a.payra     <= '''+payrato+'''             ');
            Sql.Add('   AND a.empno    not in ('''+objemp1+''',  '''+objemp2+''',  '''+objemp3+''',         ');
            Sql.Add('                          '''+objemp4+''',  '''+objemp5+''',  '''+objemp6+''',         ');
            Sql.Add('                          '''+objemp7+''',  '''+objemp8+''',  '''+objemp9+''',         ');
            Sql.Add('                          '''+objemp10+'''                                     )       ');
            Sql.Add('   AND a.deptcode not in ('''+objdept1+''', '''+objdept2+''', '''+objdept3+''',        ');
            Sql.Add('                          '''+objdept4+''', '''+objdept5+''', '''+objdept6+''',        ');
            Sql.Add('                          '''+objdept7+''', '''+objdept8+''', '''+objdept9+''',        ');
            Sql.Add('                          '''+objdept10+'''                                    )       ');
            Sql.Add('   AND a.empno      = b.empno                                                          ');
            Sql.Add('   AND b.base_yy    = :p_base_yy                                                       ');
            Sql.Add(' order by  a.deptcode, a.paycl, a.empno                                                ');
            ParamByName('p_base_yy').AsString := Lbase_yy;
            open;
            if DM.Qry_mas1.Locate('empno', Ed_empno.Text, [loCaseInsensitive]) or
               DM.Qry_mas1.Locate('korname', Ed_korname.Text, [loCaseInsensitive]) then
                DBG_mas1.SetFocus
            else
                first;
            MasDataCount;
       end;
  end;
end;

procedure TFm_SubForm5.DataChage;
begin
  with Dm.Qry_mas1 do
  begin
       E_empno.Text       := fieldbyname('empno').AsString;
       E_korname.Text     := fieldbyname('korname').AsString;
       E_paycldate.Text   := fieldbyname('paycldate').AsString;
       E_paycl.Text       := fieldbyname('payclname').AsString;
       ppaycl             := fieldbyname('paycl').AsString;
       E_dept.Text        := fieldbyname('deptname').AsString;
       porgnum            := fieldbyname('orgnum').AsString;
       pdeptcode          := fieldbyname('deptcode').AsString;
       E_jmtrack.Text     := fieldbyname('jmtrackname').AsString;
       E_jmlevel.Text     := fieldbyname('jmlevelname').AsString;
       E_e1empno.Text     := fieldbyname('E1empno').AsString;
       E_e1korname.Text   := fieldbyname('E1korname').AsString;
       E_E1payra.Text     := fieldbyname('E1payraname').AsString;
       E_E1dept.Text      := fieldbyname('E1deptname').AsString;
       E_rvalconyn.Text   := fieldbyname('Rvalconyn').AsString;
       E_Rvalcondate.Text := fieldbyname('Rvalcondate').AsString;
       E_E1valconyn.Text  := fieldbyname('E1valconyn').AsString;
       E_E1valcondate.Text:= fieldbyname('E1valcondate').AsString;

       FieldByName('empno'     ).DisplayLabel := '사번';
       FieldByName('korname'   ).DisplayLabel := '성명';
       FieldByName('deptname'  ).DisplayLabel := '부서';
       FieldByName('payclname' ).DisplayLabel := 'BAND';
       FieldByName('rvalconyn' ).DisplayLabel := '팀원';
       FieldByName('e1valconyn').DisplayLabel := '팀장';
  end;
end;

procedure TFm_SubForm5.DS_mas1DataChange(Sender: TObject; Field: TField);
begin
  DataChage;
end;

procedure TFm_SubForm5.PageControl1Change(Sender: TObject);
begin
  Lbase_yy := E_base_yy.Text;
  IDPmas_DataRead;
  DataChage;
end;

procedure TFm_SubForm5.Bt_cancelClick(Sender: TObject);
begin
  DataChage;
end;

procedure TFm_SubForm5.Bt_SaveClick(Sender: TObject);
begin
  if MessageDlg('저장작업을 진행하시겠습니까?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then exit;
  with Dm.Qry_work do
  begin
       close;
       Sql.Clear;
       Sql.Add('select Count(*)  cnt                                ');
       Sql.Add('  from peidpmas a                                   ');
       Sql.Add(' WHERE base_yy = :p_base_yy                         ');
       Sql.Add('   AND empno   = :p_empno                           ');
       ParamByName('p_base_yy').AsString := Lbase_yy;
       ParamByName('p_empno'  ).AsString := Dm.Qry_mas1.fieldbyname('empno').AsString;
       open;
       if Dm.Qry_work.fields[0].Asinteger< 1 then     iFlag   := 1
       else                                           iFlag   := 2;
  end;
  if iFlag = 1 then //insert
  begin
       with Dm.Query_Gen do
       begin
            close;
            Sql.Clear;
            Sql.Add('insert into peidpmas                                                      ');
            Sql.Add('      (BASE_YY,   EMPNO,       PAYCLDATE,                                 ');
            Sql.Add('       PAYCL,     ORGNUM,      DEPTCODE,                                  ');
            Sql.Add('       BUMOON,    JMTRACK,     JMLEVEL,                                   ');
            Sql.Add('       RVALCONYN, RVALCONDATE,                                            ');
            Sql.Add('       E1EMPNO,   E1VALCONYN,  E1VALCONDATE,                              ');
            Sql.Add('       WRITEEMP,  WRITETIME                    )                          ');
            Sql.Add('values(:p_base_yy,:p_empno,    '''+E_paycldate.Text+''',                  ');
            Sql.Add('       '''+Ppaycl+''', '''+Porgnum+''', '''+Pdeptcode+''',                ');
            Sql.Add('       '''+copy(E_jmtrack.KeyItems.Strings[E_jmtrack.itemindex],1,1)+''', ');
            Sql.Add('       '''+copy(E_jmtrack.KeyItems.Strings[E_jmtrack.itemindex],2,2)+''', ');
            Sql.Add('       '''+E_jmlevel.KeyItems.Strings[E_jmlevel.itemindex]+''',           ');
            Sql.Add('       '''+E_rvalconyn.Text +''',   '''+E_Rvalcondate.Text+''',           ');
            Sql.Add('       '''+E_E1empno.Text+''',      '''+E_E1valconyn.Text +''',           ');
            Sql.Add('       '''+E_E1valcondate.Text+''', '''+MainForm.pEmpno_ad+''',           ');
            Sql.Add('       to_char(sysdate,''YYYYMMDDHH24miss'')   )                          ');
            ParamByName('p_base_yy').AsString := Lbase_yy;
            ParamByName('p_empno'  ).AsString := Dm.Qry_mas1.fieldbyname('empno').AsString;
            ExecSQL;
       end;
  end
  else
  if iFlag = 2 then //update
  begin
       with Dm.Query_Gen do
       begin
            close;
            Sql.Clear;
            Sql.Add('update peidpmas a                                                                        ');
            Sql.Add('   Set PAYCL        = '''+Ppaycl+''',                                                    ');
            Sql.Add('       PAYCLDATE    = '''+E_paycldate.Text+''',                                          ');
            Sql.Add('       ORGNUM       = '''+Porgnum+''',                                                   ');
            Sql.Add('       DEPTCODE     = '''+Pdeptcode+''',                                                 ');
            Sql.Add('       BUMOON       = '''+copy(E_jmtrack.KeyItems.Strings[E_jmtrack.itemindex],1,1)+''', ');
            Sql.Add('       JMTRACK      = '''+copy(E_jmtrack.KeyItems.Strings[E_jmtrack.itemindex],2,2)+''', ');
            Sql.Add('       JMLEVEL      = '''+E_jmlevel.KeyItems.Strings[E_jmlevel.itemindex]+''',           ');
            Sql.Add('       RVALCONYN    = '''+E_rvalconyn.Text+''',                                          ');
            Sql.Add('       RVALCONDATE  = '''+E_Rvalcondate.Text+''',                                        ');
            Sql.Add('       E1EMPNO      = '''+E_E1empno.Text+''',                                            ');
            Sql.Add('       E1VALCONYN   = '''+E_E1valconyn.Text+''',                                         ');
            Sql.Add('       E1VALCONDATE = '''+E_E1valcondate.Text+''',                                       ');
            Sql.Add('       writeemp     = '''+MainForm.pEmpno_ad+''',                                        ');
            Sql.Add('       writetime    = to_char(sysdate,''YYYYMMDDHH24miss'')                              ');
            Sql.Add(' WHERE base_yy      = :p_base_yy                                                         ');
            Sql.Add('   AND empno        = :p_empno                                                           ');
            ParamByName('p_base_yy').AsString := Lbase_yy;
            ParamByName('p_empno'  ).AsString := Dm.Qry_mas1.fieldbyname('empno').AsString;
            ExecSQL;
       end;
  end;
  IDPmas_DataRead;
end;

procedure TFm_SubForm5.Ed_empnoClick(Sender: TObject);
begin
  Ed_empno.Text   := '';
  Ed_korname.Text := '';
end;

procedure TFm_SubForm5.E_rvalconynChange(Sender: TObject);
begin
  if E_rvalconyn.Text = 'N' then
  begin
       E_Rvalcondate.Text  := '';
       E_E1valconyn.Text   := 'N';
       E_E1valcondate.Text := '';
  end
  else
  begin
       E_Rvalcondate.Text := Dm.GetSysDate;
  end;
end;

procedure TFm_SubForm5.E_E1valconynChange(Sender: TObject);
begin
  E_E1valcondate.EditLabel.Caption :='완료일자';
  if E_E1valconyn.Text = 'N' then
  begin
       E_E1valcondate.Text := '';
  end
  else
  if E_E1valconyn.Text = 'R' then
  begin
       E_E1valcondate.EditLabel.Caption :='반려일자';
       E_E1valcondate.Text := Dm.GetSysDate;
  end
  else
  begin
       E_E1valcondate.Text := Dm.GetSysDate;
  end;
end;

procedure TFm_SubForm5.DBG_mas1TitleClick(Column: TColumn);
begin
  with Dm.Qry_mas1 do
  begin
       close;
       Sql.Clear;
       Sql.Add('SELECT a.empno, a.korname,                                                             ');
       Sql.Add('       decode(b.paycldate, null,a.paycldate, b.paycldate) paycldate,                   ');
       Sql.Add('       (select codename from pyccode                                                   ');
       Sql.Add('         where codeid  =''I112''                                                       ');
       Sql.Add('           and codeno  =a.paycl) payclname, a.paycl,                                   ');
       Sql.Add('       (select deptName from pycdept                                                   ');
       Sql.Add('         where orgnum  =a.orgnum                                                       ');
       Sql.Add('           and deptcode=a.deptcode) deptname, a.orgnum, a.deptcode,                    ');
       Sql.Add('       b.bumoon,                                                                       ');
       Sql.Add('       (select hname from peidpcode                                                    ');
       Sql.Add('         where base_yy =:p_base_yy and classno = ''2''                                 ');
       Sql.Add('           and codeno  =b.bumoon) bumoonname,                                          ');
       Sql.Add('       b.jmtrack,                                                                      ');
       Sql.Add('       (select hname from peidpcode                                                    ');
       Sql.Add('         where base_yy =:p_base_yy and classno = ''3''                                 ');
       Sql.Add('           and joinno  =b.bumoon   and codeno = b.jmtrack) jmtrackname,                ');
       Sql.Add('       b.jmlevel,                                                                      ');
       Sql.Add('       (select hname from peidpcode                                                    ');
       Sql.Add('         where base_yy =:p_base_yy and classno = ''4''                                 ');
       Sql.Add('           and codeno  =b.jmlevel) jmlevelname,                                        ');
       Sql.Add('       b.E1empno,                                                                      ');
       Sql.Add('       (select korname from pimpmas                                                    ');
       Sql.Add('         where empno  = b.e1empno)  E1korname,                                         ');
       Sql.Add('       (select codename from pyccode                                                   ');
       Sql.Add('         where codeid  =''I113''                                                       ');
       Sql.Add('           and codeno  =(select jobpayra from pimpmas                                  ');
       Sql.Add('                          where empno  = b.e1empno    )) E1payraname,                  ');
       Sql.Add('       (select codename from pyccode                                                   ');
       Sql.Add('         where codeid  =''I112''                                                       ');
       Sql.Add('           and codeno  =(select paycl from pimpmas                                     ');
       Sql.Add('                          where empno  = b.e1empno    )) E1payclname,                  ');
       Sql.Add('       (select deptName from pycdept                                                   ');
       Sql.Add('         where (orgnum,deptcode)=(select orgnum,deptcode from pimpmas                  ');
       Sql.Add('                                   where empno  = b.e1empno           )) E1deptname,   ');
       Sql.Add('       b.RVALCONDATE,      b.E1VALCONDATE,                                             ');
       Sql.Add('       nvl(b.RVALCONYN,''N'')  RVALCONYN,                                              ');
       Sql.Add('       nvl(b.E1VALCONYN,''N'') E1VALCONYN                                              ');
       Sql.Add('  FROM pimpmas a, peidpmas b                                                           ');
       Sql.Add(' WHERE a.pstate     < '''+pstate +'''                                                  ');
       Sql.Add('   AND a.payra     >= '''+payrafr+'''   AND a.payra     <= '''+payrato+'''             ');
       Sql.Add('   AND a.empno    not in ('''+objemp1+''',  '''+objemp2+''',  '''+objemp3+''',         ');
       Sql.Add('                          '''+objemp4+''',  '''+objemp5+''',  '''+objemp6+''',         ');
       Sql.Add('                          '''+objemp7+''',  '''+objemp8+''',  '''+objemp9+''',         ');
       Sql.Add('                          '''+objemp10+'''                                     )       ');
       Sql.Add('   AND a.deptcode not in ('''+objdept1+''', '''+objdept2+''', '''+objdept3+''',        ');
       Sql.Add('                          '''+objdept4+''', '''+objdept5+''', '''+objdept6+''',        ');
       Sql.Add('                          '''+objdept7+''', '''+objdept8+''', '''+objdept9+''',        ');
       Sql.Add('                          '''+objdept10+'''                                    )       ');
       Sql.Add('   AND a.empno      = b.empno                                                          ');
       Sql.Add('   AND b.base_yy    = :p_base_yy                                                       ');
       if TClick = 0 then
       begin
            Sql.Add(' order by  '+Column.Fieldname+' desc                       ');
            TClick := 1;
       end
       else
       begin
            Sql.Add(' order by  '+Column.Fieldname+'                            ');
            TClick := 0;
       end;
       ParamByName('p_base_yy').AsString := Lbase_yy;
       open;
       MasDataCount;
  end;
end;

end.
