unit PZO1020A1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, OnFocusButton, Grids, DBGrids, Db, OnGrDBGrid, ComCtrls, OnScheme,
  MemDS, DBAccess, Ora, ExtCtrls, OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl,
  OnPersonEdit, Mask, Buttons, Pass, Func, comobj, Dept1lib, Keycode;

type
  TFM_Mainform = class(TForm)
    SF_Main: TOnSchemeForm;
    pageControl1: TPageControl;
    Ora_dept: TOraQuery;
    ds_dept: TDataSource;
    btn_add: TOnFocusButton;
    btn_save: TOnFocusButton;
    btn_del: TOnFocusButton;
    btn_cancel: TOnFocusButton;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    DbGrid2: TOnGrDbGrid;
    ora_tok: TOraQuery;
    ds_tok: TDataSource;
    btn_search: TOnFocusButton;
    btn_exit: TOnFocusButton;
    OraQuery1: TOraQuery;
    grid_etc: TOnGrDbGrid;
    ora_etc: TOraQuery;
    ds_etc: TDataSource;
    Panel4: TPanel;
    Panel74: TPanel;
    etc_cname: TMaskEdit;
    Panel83: TPanel;
    etc_ename: TMaskEdit;
    Panel84: TPanel;
    etc_jmno: TMaskEdit;
    Panel2: TPanel;
    etc_empno: TMaskEdit;
    Panel3: TPanel;
    Panel158: TPanel;
    etc_handp: TMaskEdit;
    Panel196: TPanel;
    etc_otel: TMaskEdit;
    etc_kname: TMaskEdit;
    Panel10: TPanel;
    etc_title: TMaskEdit;
    etc_titname: TPanel;
    Panel9: TPanel;
    etc_intype: TMaskEdit;
    etc_intypename: TMaskEdit;
    Panel14: TPanel;
    etc_loccode: TMaskEdit;
    etc_locname: TPanel;
    Panel15: TPanel;
    etc_cjob1: TMaskEdit;
    Panel16: TPanel;
    etc_cjob2: TMaskEdit;
    Panel17: TPanel;
    etc_cjob3: TMaskEdit;
    Panel190: TPanel;
    etc_email: TMaskEdit;
    Panel189: TPanel;
    etc_mailalias: TMaskEdit;
    Panel20: TPanel;
    etc_oldcmpcd: TMaskEdit;
    Panel88: TPanel;
    etc_displayyn: TComboBox;
    Panel21: TPanel;
    etc_retdate: TMaskEdit;
    Panel19: TPanel;
    etc_cdeptcd: TMaskEdit;
    etc_cdept: TPanel;
    Panel22: TPanel;
    etc_cmpcd: TMaskEdit;
    Panel23: TPanel;
    etc_oldempno: TMaskEdit;
    Panel5: TPanel;
    etc_duty: TMaskEdit;
    etc_dutyname: TPanel;
    Panel6: TPanel;
    etc_rank: TMaskEdit;
    etc_rankname: TPanel;
    Panel7: TPanel;
    etc_jobcode: TMaskEdit;
    etc_jobname: TPanel;
    Panel8: TPanel;
    setc_gubun: TRadioGroup;
    grid_title: TOnGrDbGrid;
    Panel13: TPanel;
    Panel27: TPanel;
    tit_empno: TMaskEdit;
    Panel28: TPanel;
    tit_korname: TMaskEdit;
    Panel31: TPanel;
    tit_codeno: TMaskEdit;
    tit_codename: TPanel;
    Panel43: TPanel;
    tit_useyn: TComboBox;
    ora_title: TOraQuery;
    ds_title: TDataSource;
    Panel24: TPanel;
    tit_bigo: TMemo;
    grid_dept: TOnGrDbGrid;
    Panel25: TPanel;
    Panel1: TPanel;
    rg_gubun: TRadioGroup;
    Panel44: TPanel;
    Panel18: TPanel;
    s_empno: TMaskEdit;
    s_korname: TMaskEdit;
    Panel35: TPanel;
    Panel36: TPanel;
    Panel12: TPanel;
    Panel37: TPanel;
    Panel38: TPanel;
    setc_empno: TMaskEdit;
    Panel39: TPanel;
    setc_korname: TMaskEdit;
    Panel26: TPanel;
    dept_empno: TMaskEdit;
    Panel29: TPanel;
    dept_kname: TMaskEdit;
    Panel30: TPanel;
    dept_deptcode: TMaskEdit;
    dept_deptname: TPanel;
    Panel33: TPanel;
    dept_useyn: TComboBox;
    Panel34: TPanel;
    dept_bigo: TMemo;
    retrieve_empno: TBitBtn;
    Panel32: TPanel;
    dept_orgnum: TMaskEdit;
    btn_excel: TOnFocusButton;
    etc_orgnum: TMaskEdit;
    Label1: TLabel;
    Panel11: TPanel;
    etc_SPdate1: TMaskEdit;
    etc_SPdate2: TMaskEdit;
    Label2: TLabel;
    Panel40: TPanel;
    etc_SPbigo: TMemo;
    Label3: TLabel;
    procedure btn_exitClick(Sender: TObject);
    procedure btn_searchClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ds_etcDataChange(Sender: TObject; Field: TField);
    procedure rg_gubunClick(Sender: TObject);
    procedure setc_gubunClick(Sender: TObject);
    procedure s_empnoDblClick(Sender: TObject);
    procedure setc_empnoDblClick(Sender: TObject);
    procedure ds_titleDataChange(Sender: TObject; Field: TField);
    procedure ds_deptDataChange(Sender: TObject; Field: TField);
    procedure tit_empnoDblClick(Sender: TObject);
    procedure dept_empnoDblClick(Sender: TObject);
    procedure s_empnoKeyPress(Sender: TObject; var Key: Char);
    procedure pageControl1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure retrieve_empnoClick(Sender: TObject);
    procedure btn_addClick(Sender: TObject);
    procedure dept_deptcodeDblClick(Sender: TObject);
    procedure btn_saveClick(Sender: TObject);
    procedure btn_delClick(Sender: TObject);
    procedure btn_cancelClick(Sender: TObject);
    procedure grid_etcColEnter(Sender: TObject);
    procedure grid_titleColEnter(Sender: TObject);
    procedure grid_deptColEnter(Sender: TObject);
    procedure CodeDblClick(Sender: TObject);
    procedure etc_cdeptcdDblClick(Sender: TObject);
    procedure btn_excelClick(Sender: TObject);
    procedure s_empnoClick(Sender: TObject);
    procedure setc_empnoClick(Sender: TObject);
    procedure setc_empnoKeyPress(Sender: TObject; var Key: Char);
    procedure tit_empnoKeyPress(Sender: TObject; var Key: Char);
    procedure dept_empnoKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
    EnterKey  : Boolean;        {엔터키를 누른가를  체크}
    procedure KeyClick(Sender : TObject);
  public
    { Public declarations }
    FGempno	  : string;         {임시저장 사원번호 }
    FGkorname	  : string;         {임시저장 사원명}
    HyunOrgNum    : String;
    InsertMode    : boolean;
    procedure search_totlist;
    procedure search_etclist;
    procedure search_titlist;
    procedure search_deptlist;
    procedure save_etclist;
    procedure save_titlist;
    procedure save_deptlist;
    procedure delete_etclist;
    procedure delete_titlist;
    procedure delete_deptlist;
    procedure save_excel_totlist;
    procedure save_excel_etclist;
    procedure save_excel_titlist;
    procedure save_excel_deptlist;
    procedure clear_fields;
    function QDeptDisp(s1,s2 : String; deptGu : integer) : String;
    function QCodeDisp(s1,s2,s3 : String; gubun : integer) : String;

  end;

var
  FM_Mainform: TFM_Mainform;

implementation

uses FEMPNO;

{$R *.DFM}

procedure TFM_Mainform.btn_exitClick(Sender: TObject);
begin
  close;
end;

//------------------------------------------------------------------------------
procedure TFM_Mainform.KeyClick(Sender : TObject);
begin
  EnterKey       := False;
  //hjku
  //ClearDataField;
  //save.Caption   := '실행';
  //Save.Glyph     := nil;
  //ImageList1.GetBitmap(0, Save.Glyph);
  //Cancel.Enabled := False;
end;

procedure TFM_Mainform.FormCreate(Sender: TObject);
begin
  OraConnect;

  Pempno   := PassEmp(cmdline,1);
  Pkorname := PassEmp(cmdline,2);
  Pgrade   := Passemp(cmdline,4);

  OraQuery1.Close;
  OraQuery1.SQL.Clear;
  OraQuery1.SQL.Add(' select value1  from pimvari      ' +
                    '  where gubun  = ''00''           ' +
                    '    and sgubun = ''0001''         ');
  OraQuery1.Open;
  HyunOrgNum := OraQuery1.FieldByName('value1').AsString;
end;

procedure TFM_Mainform.btn_searchClick(Sender: TObject);
begin
  clear_fields;

  InsertMode := false;

  btn_search.enabled := true;
  btn_add.enabled    := true;
  btn_save.enabled   := true;
  btn_del.enabled    := true;
  btn_cancel.enabled := true;
  btn_excel.Enabled  := true;

  if pageControl1.ActivePage = Tabsheet1 then
  begin
      btn_add.enabled    := false;
      btn_save.enabled   := false;
      btn_del.enabled    := false;
      btn_cancel.enabled := false;
  end
  else if pageControl1.ActivePage = Tabsheet2 then
  begin
      retrieve_empno.Enabled := false;
      etc_empno.Enabled      := false;
      etc_cmpcd.Enabled      := false;
  end
  else if pageControl1.ActivePage = Tabsheet3 then
  begin
      tit_empno.Enabled      := false;
  end
  else if pageControl1.ActivePage = Tabsheet4 then
  begin
      dept_empno.Enabled      := false;
  end;

  if       pageControl1.ActivePage = Tabsheet1 then search_totlist
  else  if pageControl1.ActivePage = Tabsheet2 then search_etclist
  else  if pageControl1.ActivePage = Tabsheet3 then search_titlist
  else  if pageControl1.ActivePage = Tabsheet4 then search_deptlist
  ;
end;

procedure TFM_Mainform.search_totlist;
begin
  with ora_tok do
  begin
       Close;
       Sql.Clear;
       Sql.Add('SELECT decode(gubun,''1'',''인사기록'',''2'',''톡톡특이자'',''3'',''브로드넷'',''4'',''도급인력'','''') gubunname, ');
       Sql.Add('       a.*                                               ');
       Sql.Add('  FROM poskbasic_sub a                                   ');
       Sql.Add(' where 1=1                                               ');

       if(s_empno.text <> '') then
         SQL.Add(' and empno like ''' + s_empno.text + '%''              ');

       if(s_korname.text <> '') then
         SQL.Add(' and kname like ''' + s_korname.text + '%''            ');

       if(rg_gubun.ItemIndex <> 0) then
         SQL.Add(' and gubun = ''' + inttostr(rg_gubun.ItemIndex) + '''  ');

       Sql.Add('  ORDER BY EMPNO                                         ');

       Open;
  end;
end;

procedure TFM_Mainform.search_etclist;
begin
  with ora_etc do
  begin
       Close;
       Sql.Clear;
       Sql.Add(' SELECT Cmpcd, Empno, Kname, Cname, Ename, Jmno, Handp, Otel, Title, Titname,                  ');
       Sql.Add('        Duty, Dutyname, Rank, Rankname, Intype, Intypename, Jobcode, Jobname, Loccode, Locname,');
       Sql.Add('        Cjob1, Cjob2, Cjob3, orgnum, Cdeptcd, Cdept, Email, Mailalias, Oldcmpcd, Oldempno,     ');
       Sql.Add('        Displayyn, ''2'' Sortorder, Trim(Retdate) Retdate, SPdate1, SPdate2, SPbigo            ');
       Sql.Add('   FROM Poskmemas     a                                                                        ');
       SQL.Add('where 1=1                                                                                      ');

       if setc_empno.text    <> '' then SQL.Add(' and empno like ''' + setc_empno.text + '%''    ');
       if setc_korname.text  <> '' then SQL.Add(' and kname like ''' + setc_korname.text + '%''  ');

       if      setc_gubun.ItemIndex = 1 then SQL.Add(' and trim(retdate) is null     ')
       else if setc_gubun.ItemIndex = 2 then SQL.Add(' and trim(retdate) is not null ');
       Sql.Add('  ORDER BY EMPNO                                  ');
       Open;
  end;
end;


procedure TFM_Mainform.ds_etcDataChange(Sender: TObject; Field: TField);
begin
  grid_etcColEnter(grid_etc);
end;

procedure TFM_Mainform.rg_gubunClick(Sender: TObject);
begin
  btn_searchClick(self);
  //search_totlist;
end;

procedure TFM_Mainform.setc_gubunClick(Sender: TObject);
begin
  btn_searchClick(self);
  //search_etclist;
end;

procedure TFM_Mainform.s_empnoDblClick(Sender: TObject);
begin
  empForm := TEmpForm.Create(self);
  Try
  if TMaskEdit(Sender).Tag = 1 then empForm.DataVal1 := s_empno.Text
  else if TMaskEdit(Sender).Tag = 2 then empForm.DataVal2 := s_korname.Text;

  empForm.g_gubun := '1';
  empForm.ShowModal;

  if empForm.code <> '' then
  begin
       s_empno.Text   := empForm.Code;
       s_korname.Text := empForm.CodeName;
       FGempno   := s_empno.Text;
       FGkorname := s_korname.Text;
  end else
  begin
       s_empno.Text   := '';
       s_korname.Text := '';
  end;

  Finally
       empForm.Free;
  end;
end;

procedure TFM_Mainform.setc_empnoDblClick(Sender: TObject);
begin
  empForm := TEmpForm.Create(self);
  Try
  if TMaskEdit(Sender).Tag = 1 then empForm.DataVal1 := setc_empno.Text
  else if TMaskEdit(Sender).Tag = 2 then empForm.DataVal2 := setc_korname.Text;

  empForm.g_gubun := '2';
  empForm.ShowModal;

  if empForm.code <> '' then
  begin
       setc_empno.Text   := empForm.Code;
       setc_korname.Text := empForm.CodeName;
       FGempno   := setc_empno.Text;
       FGkorname := setc_korname.Text;
  end else
  begin
       setc_empno.Text   := '';
       setc_korname.Text := '';
  end;

  Finally
       empForm.Free;
  end;
end;

procedure TFM_Mainform.search_titlist;
begin
  //clear_fields;
  with ora_title do
  begin
       Close;
       Sql.Clear;
       Sql.Add('select  a.EMPNO                            ');
       Sql.Add('       ,c.korname                          ');
       Sql.Add('       ,a.CODEID                           ');
       Sql.Add('       ,a.CODENO                           ');
       Sql.Add('       ,b.codename                         ');
       Sql.Add('       ,a.USEYN                            ');
       Sql.Add('       ,a.BIGO                             ');
       Sql.Add('  from pisktitle a,  pyccode b,            ');
       Sql.Add('      (select empno,korname from pimpmas   ');
       Sql.Add('        union                              ');
       Sql.Add('       select empno,kname  from pzsubmas) c');
       Sql.Add(' where a.codeid = b.codeid(+)              ');
       Sql.Add('   and a.codeno = b.codeno(+)              ');
       Sql.Add('   and a.empno  = c.empno(+)               ');
       Sql.Add('  ORDER BY useyn desc, EMPNO               ');
       Open;
  end;
end;


procedure TFM_Mainform.ds_titleDataChange(Sender: TObject; Field: TField);
begin
    grid_titleColEnter(grid_title);
end;

procedure TFM_Mainform.ds_deptDataChange(Sender: TObject; Field: TField);
begin
    grid_deptColEnter(grid_dept);
end;

procedure TFM_Mainform.search_deptlist;
begin
  with Ora_dept do
  begin
       Close;
       Sql.Clear;
       Sql.Add('select  a.EMPNO                  ');
       Sql.Add('       ,c.kname                  ');
       Sql.Add('       ,a.orgnum                 ');
       Sql.Add('       ,a.deptcode               ');
       Sql.Add('       ,b.deptname               ');
       Sql.Add('       ,a.USEYN                  ');
       Sql.Add('       ,a.BIGO                   ');
       Sql.Add('  from piskdept a,               ');
       Sql.Add('       pycdept  b,               ');
       Sql.Add('       pzsubmas c                ');
       Sql.Add(' where a.orgnum   = b.orgnum(+)  ');
       Sql.Add('   and a.deptcode = b.deptcode(+)');
       Sql.Add('   and a.empno    = c.empno(+)   ');
       Sql.Add('  ORDER BY useyn desc, EMPNO     ');
       Open;
  end;
end;

procedure TFM_Mainform.tit_empnoDblClick(Sender: TObject);
begin
  empForm := TEmpForm.Create(self);
  Try
  if TMaskEdit(Sender).Tag = 1 then empForm.DataVal1 := tit_empno.Text
  else if TMaskEdit(Sender).Tag = 2 then empForm.DataVal2 := tit_korname.Text;

  empForm.g_gubun := '3';
  empForm.ShowModal;

  if empForm.code <> '' then
  begin
       tit_empno.Text   := empForm.Code;
       tit_korname.Text := empForm.CodeName;
       FGempno   := tit_empno.Text;
       FGkorname := tit_korname.Text;
  end else
  begin
      tit_empno.Text   := '';
      tit_korname.Text := '';
  end;

  Finally
    empForm.Free;
  end;
end;

procedure TFM_Mainform.dept_empnoDblClick(Sender: TObject);
begin
  empForm := TEmpForm.Create(self);
  Try
  if TMaskEdit(Sender).Tag = 1 then empForm.DataVal1 := dept_empno.Text
  else if TMaskEdit(Sender).Tag = 2 then empForm.DataVal2 := dept_kname.Text;

  empForm.g_gubun := '4';
  empForm.ShowModal;

  if empForm.code <> '' then
  begin
       dept_empno.Text   := empForm.Code;
       dept_kname.Text   := empForm.CodeName;
       FGempno   := dept_empno.Text;
       FGkorname := dept_kname.Text;
  end else
  begin
      dept_empno.Text   := '';
      dept_kname.Text := '';
  end;

  Finally
    empForm.Free;
  end;
end;

procedure TFM_Mainform.s_empnoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Chr(13) then
  begin
       Key := Chr(0);   {소리제겅용}

       FGempno   := s_empno.Text;
       FGkorname := s_korname.Text;

       with OraQuery1 do
       begin
            Close;
            Sql.Clear;
            SQL.Add(' SELECT empno,korname                 ');
            SQL.Add('   FROM pimpmas                       ');
            SQL.Add('  WHERE empno   like :Lempno||''%''   ');
            SQL.Add('     or korname like :Lkorname||''%'' ');
            ParamByName('lempno').AsString   := s_empno.Text;
            ParamByName('Lkorname').AsString := s_korname.Text;
            Open;
            if Recordcount = 1 then
            begin
                s_empno.text   := FieldByName('empno').AsString;
                s_korname.text := FieldByName('korname').AsString;
            end;

            if RecordCount > 1 then
               if trim(s_empno.text)='' then s_empnoDblClick(s_korname)
               else s_empnoDblClick(s_empno);

            Close;
       end;

       EnterKey  := True;
  end;
end;

procedure TFM_Mainform.clear_fields;
begin
  if pageControl1.ActivePage = Tabsheet1 then
  begin
      //s_empno.text          := '';
      //s_korname.text        := '';
      //rg_gubun.itemindex    := 0;
  end
  else if pageControl1.ActivePage = Tabsheet2 then
  begin
       //setc_empno.text       := '';
       //setc_korname.text     := '';
       //setc_gubun.itemindex  := 0;
       etc_empno.text        := '';
       etc_cmpcd.text        := 'SKB';
       etc_kname.text        := '';
       etc_cname.text        := '';
       etc_ename.text        := '';

       etc_cdeptcd.text      := '';
       etc_cdept.caption     := '';
       etc_jmno.text         := '';
       etc_handp.text        := '';
       etc_otel.text         := '';

       etc_title.text        := '';
       etc_titname.caption   := '';
       etc_duty.text         := '';
       etc_dutyname.caption  := '';
       etc_rank.text         := '';
       etc_rankname.caption  := '';

       etc_intype.text       := '';
       etc_intypename.text   := '';
       etc_loccode.text      := '';
       etc_locname.caption   := '';

       etc_email.text        := '';
       etc_mailalias.text    := '';
       etc_displayyn.ItemIndex := 0;
       etc_retdate.text      := '';

       etc_cjob1.text        := '';
       etc_cjob2.text        := '';
       etc_cjob3.text        := '';
       etc_oldcmpcd.text     := '';
       etc_oldempno.text     := '';
  end
  else if pageControl1.ActivePage = Tabsheet3 then
  begin
       tit_empno.text        := '';
       tit_korname.text      := '';
       tit_codeno.text       := '';
       tit_codename.caption  := '';
       tit_useyn.ItemIndex   := 0;
       tit_bigo.text         := '';
  end
  else if pageControl1.ActivePage = Tabsheet4 then
  begin
       dept_empno.text       := '';
       dept_kname.text       := '';
       dept_orgnum.text      := '';
       dept_deptcode.text    := '';
       dept_deptname.caption := '';
       dept_useyn.ItemIndex  := 0;
       dept_bigo.text        := '';
  end;
end;

procedure TFM_Mainform.pageControl1Change(Sender: TObject);
begin
  btn_searchClick(self);
end;

procedure TFM_Mainform.FormShow(Sender: TObject);
begin
  InsertMode := false;
  pageControl1.ActivePage := Tabsheet1;
  pageControl1Change(nil);
end;

procedure TFM_Mainform.retrieve_empnoClick(Sender: TObject);
begin
  empForm := TEmpForm.Create(self);
  Try
  empForm.DataVal1 := etc_empno.Text;
  empForm.DataVal2 := '';

  empForm.g_gubun := '3'; //기존대상자(인사&도급) 조회하기 위해..
  empForm.ShowModal;

  if empForm.code <> '' then
  begin
     etc_empno.Text   := empForm.Code;
     etc_kname.Text   := empForm.CodeName;
     FGempno   := etc_empno.Text;
     FGkorname := etc_kname.Text;

     with OraQuery1 do
     begin
         Close;
         SQL.Clear;

         if(copy(etc_empno.Text,1,1)='U') then
         begin
           Sql.add('Select ''SKB'' Cmpcd, Empno, Kname,                                                                                                                                                  ');
           Sql.add('       Kname   Cname,                                                                                                                                                                ');
           Sql.add('       Kname   Ename,                                                                                                                                                                ');
           Sql.add('       Juminid Jmno,                                                                                                                                                                 ');
           Sql.add('       Handp,                                                                                                                                                                        ');
           Sql.add('       Otel,                                                                                                                                                                         ');
           Sql.add('       nvl((select codeno   from pisktitle              where m.empno= empno and codeid =''I118'' and useyn =''Y''), Payra) Title,                                                   ');
           Sql.add('       nvl((select Codename from pisktitle a, pyccode b where a.codeid = b.codeid and a.codeno = b.codeno and m.empno= a.empno and a.codeid =''I118'' and a.useyn =''Y''),           ');
           Sql.add('           (Select Codename From Pyccode                Where Codeid=''I118'' And Codeno=Payra)) Titname,                                                                            ');
           Sql.add('       nvl((select codeno   from pisktitle              where m.empno= empno and codeid =''I118'' and useyn =''Y''), Payra) Duty,                                                    ');
           Sql.add('       nvl((select Codename from pisktitle a, pyccode b where a.codeid = b.codeid and a.codeno = b.codeno and m.empno= a.empno and a.codeid =''I118'' and a.useyn =''Y''),           ');
           Sql.add('           (Select Codename From Pyccode                Where Codeid=''I118'' And Codeno=Payra)) Dutyname,                                                                           ');
           Sql.add('       ''''          Rank,                                                                                                                                                           ');
           Sql.add('       ''''          Rankname,                                                                                                                                                       ');
           Sql.add('       ''U''         Intype,                                                                                                                                                         ');
           Sql.add('       ''외주인력''  Intypename,                                                                                                                                                     ');
           Sql.add('       ''''          Jobcode,                                                                                                                                                        ');
           Sql.add('       ''''          Jobname,                                                                                                                                                        ');
           Sql.add('       C.Placecode Loccode,                                                                                                                                                          ');
           Sql.add('      (Select Codename From Pyccode Where Codeid=''I160'' And Codeno=C.Placecode) Locname,                                                                                           ');
           Sql.add('       Cjob1, ''''   Cjob2, '''' Cjob3,                                                                                                                                              ');
           Sql.add('       nvl((select deptcode from piskdept where m.empno= empno and m.orgnum = orgnum and useyn =''Y''),                                                                              ');
           Sql.add('           ''YNNN0'') Cdeptcd,                                                                                                                                                       ');
           Sql.add('       nvl((select deptname from piskdept a, pycdept b where m.empno= empno and m.orgnum = a.orgnum and a.orgnum = b.orgnum and a.deptcode = b.deptcode and useyn =''Y''),           ');
           Sql.add('           ''SKB임시'') Cdept,                                                                                                                                                       ');
           Sql.add('       ''''          Email,                                                                                                                                                          ');
           Sql.add('       Skemail     Mailalias,                                                                                                                                                        ');
           Sql.add('       ''''          Oldcmpcd,                                                                                                                                                       ');
           Sql.add('       ''''          Oldempno,                                                                                                                                                       ');
           Sql.add('       ''Y''         Displayyn,                                                                                                                                                      ');
           Sql.add('       ''1''         Sortorder,                                                                                                                                                      ');
           Sql.add('       Trim(Retdate) Retdate                                                                                                                                                         ');
           Sql.add('  From pzsubmas M, Pycdept C                                                                                                                                                         ');
           Sql.add(' Where M.Orgnum   = C.Orgnum                                                                                                                                                         ');
           Sql.add('   And M.Deptcode = C.Deptcode                                                                                                                                                       ');
           Sql.add('   And M.Empno =''' +  etc_empno.Text + '''                                                                                                                                          ');
         end
         else
         begin
           Sql.add('Select ''SKB'' Cmpcd, Empno, Korname Kname, Chnname Cname, Upper(Engname) Ename, Juminid Jmno, Retcont Handp,                                                                        ');
           Sql.add('       Offitel Otel,                                                                                                                                                                 ');
           Sql.add('       nvl((select codeno   from pisktitle              where m.empno= empno and codeid =''I118'' and useyn =''Y''), Payra) Title,                                                   ');
           Sql.add('       nvl((select Codename from pisktitle a, pyccode b where a.codeid = b.codeid and a.codeno = b.codeno and m.empno= a.empno and a.codeid =''I118'' and a.useyn =''Y''),           ');
           Sql.add('           (Select Codename From Pyccode                Where Codeid=''I118'' And Codeno=Payra)) Titname,                                                                            ');
           Sql.add('       Payra Duty,                                                                                                                                                                   ');
           Sql.add('       (Select Codename From Pyccode Where Codeid=''I113'' And Codeno=Payra) Dutyname,                                                                                               ');
           Sql.add('       '''' Rank,                                                                                                                                                                    ');
           Sql.add('       '''' Rankname,                                                                                                                                                                ');
           //2016.12.28.hjku... J사번 정규직 사번 전환으로 인한 수정(임단협).. 유훈일M
           //Sql.add('       Decode(Substr(Empno,1,1),''1'',''0'',''2'',''0'',''3'',''0'', ''J'',''P'',''Q'',''P'', Substr(Empno,1,1)) Intype,                                                             ');
           //Sql.add('       Decode(Substr(Empno,1,1),''0'',''정규직'',''1'',''정규직'',''2'',''정규직'',''3'',''정규직'',                                                                                 ');
           //Sql.add('                                ''M'',''임원'',  ''J'',''계약직'',''P'',''계약직'',''Q'',''계약직'',''Y'',''파견직'', Empno) Intypename,                                             ');
           Sql.add('       DECODE(SUBSTR(EMPNO,1,1),''M'',''M'',''Y'',''Y'',''J'',''P'',''P'',''P'',''Q'',''P'', DECODE(PAYCL,''H10'',''P'',''0'')) INTYPE,                                              ');
           Sql.add('       DECODE(SUBSTR(EMPNO,1,1),''M'',''임원'',''Y'',''파견직'',''J'',''계약직'',''P'',''계약직'',''Q'',''계약직'',                                                                  ');
           Sql.add('                               decode(paycl,''H10'',''계약직'',''정규직'')) Intypename,                                                                                              ');
           Sql.add('       '''' Jobcode,                                                                                                                                                                 ');
           Sql.add('       '''' Jobname,                                                                                                                                                                 ');
           Sql.add('       Jobplace  Loccode,                                                                                                                                                            ');
           Sql.add('      (Select Codename From Pyccode Where Codeid=''I160'' And Codeno=Jobplace) Locname,                                                                                              ');
           Sql.add('       '''' Cjob1, '''' Cjob2, '''' Cjob3,                                                                                                                                           ');
           Sql.add('       Deptcode Cdeptcd,                                                                                                                                                             ');
           Sql.add('       (Select Deptname From Pycdept Where Orgnum=M.Orgnum And Deptcode=M.Deptcode) Cdept,                                                                                           ');
           Sql.add('       E_Mail  Email,                                                                                                                                                                ');
           Sql.add('       Skemail Mailalias,                                                                                                                                                            ');
           Sql.add('       '''' Oldcmpcd,  '''' Oldempno,                                                                                                                                                ');
           Sql.add('       ''Y'' Displayyn,                                                                                                                                                              ');
           Sql.add('       ''1'' Sortorder,                                                                                                                                                              ');
           Sql.add('       Trim(Retdate) Retdate                                                                                                                                                         ');
           Sql.add('  From Pimpmas M                                                                                                                                                                     ');
           Sql.add(' where empno =''' +  etc_empno.Text + '''                                                                                                                                            ');
         end;

         Open;

         etc_empno.text        := FieldByName('Empno').AsString;
         etc_cmpcd.text        := FieldByName('Cmpcd').AsString;
         etc_kname.text        := FieldByName('Kname').AsString;
         etc_cname.text        := FieldByName('Cname').AsString;
         etc_ename.text        := FieldByName('Ename').AsString;

         etc_cdeptcd.text      := FieldByName('Cdeptcd').AsString;
         etc_cdept.caption     := FieldByName('Cdept').AsString;
         etc_jmno.text         := FieldByName('Jmno').AsString;
         etc_handp.text        := FieldByName('Handp').AsString;
         etc_otel.text         := FieldByName('Otel').AsString;

         etc_title.text        := FieldByName('Title').AsString;
         etc_titname.caption   := FieldByName('Titname').AsString;
         etc_duty.text         := FieldByName('Duty').AsString;
         etc_dutyname.caption  := FieldByName('Dutyname').AsString;


         etc_intype.text       := FieldByName('Intype').AsString;
         etc_intypename.text   := FieldByName('Intypename').AsString;
         etc_loccode.text      := FieldByName('Loccode').AsString;
         etc_locname.caption   := FieldByName('Locname').AsString;

         etc_email.text        := FieldByName('Email').AsString;
         etc_mailalias.text    := FieldByName('Mailalias').AsString;


         //초기화
         etc_rank.text         := '';
         etc_rankname.caption  := '';

         etc_jobcode.text      := '';
         etc_jobname.caption   := '';

         etc_cjob1.text        := '';
         etc_cjob2.text        := '';
         etc_cjob3.text        := '';

         etc_oldcmpcd.text     := '';
         etc_oldempno.text     := '';

         etc_displayyn.ItemIndex := 0;

         etc_retdate.text      := '';
     end;
  end else
  begin
     etc_empno.Text   := '';
     etc_kname.Text   := '';
  end;

  Finally
     empForm.Free;
  end;
end;

procedure TFM_Mainform.btn_addClick(Sender: TObject);
begin
    clear_fields;

    InsertMode      := true;
    btn_del.Enabled := false;

    if pageControl1.ActivePage = Tabsheet2 then
    begin
        retrieve_empno.Enabled := true;
        etc_empno.Enabled      := true;
        etc_cmpcd.Enabled      := true;
    end
    else if pageControl1.ActivePage = Tabsheet3 then
    begin
        tit_empno.Enabled      := true;
    end
    else if pageControl1.ActivePage = Tabsheet4 then
    begin
        dept_empno.Enabled      := true;
    end;

end;

procedure TFM_Mainform.dept_deptcodeDblClick(Sender: TObject);
begin
   DeptForm := TDeptForm.Create(Self);
   Try
     DeptForm.ShowModal;
     if DeptForm.Code1 <> '' then
     begin
        dept_orgnum.Text       := DeptForm.Code3;
        dept_deptcode.Text     := DeptForm.Code1;
        dept_deptname.Caption  := DeptForm.CodeName;
     end;
   Finally
      DeptForm.Free;
   End;
end;

procedure TFM_Mainform.btn_saveClick(Sender: TObject);
begin
    if pageControl1.ActivePage = Tabsheet2 then save_etclist
    else if pageControl1.ActivePage = Tabsheet3 then save_titlist
    else if pageControl1.ActivePage = Tabsheet4 then save_deptlist;
end;

procedure TFM_Mainform.save_deptlist;
begin
    if(trim(dept_empno.Text)='') then
    begin
        MessageBox(handle,'사번번호 입력은 필수입니다.','알 림',MB_OK or $0030);
        dept_empno.Setfocus;
        system.Exit;
    end;

    if(trim(dept_deptcode.Text)='') then
    begin
        MessageBox(handle,'부서 입력은 필수입니다.','알 림',MB_OK or $0030);
        dept_deptcode.Setfocus;
        system.Exit;
    end;

    if(trim(dept_orgnum.text)='') then dept_orgnum.Text := HyunOrgNum;

    dept_deptname.caption    := QDeptDisp(dept_deptcode.Text,dept_orgnum.Text,1);

    if(trim(dept_deptname.caption)='부서에러') then
    begin
        MessageBox(handle,'부서코드 오류입니다.','알 림',MB_OK or $0030);
        dept_deptcode.Setfocus;
        system.Exit;
    end;

    if MessageDlg('입력하신 자료로 저장하시겠습니까 ?', mtConfirmation, [mbYes,mbNo], 0) <> mrYes then System.Exit;

    with OraQuery1 do
    begin
        Close;
        Sql.Clear;

        if(InsertMode) then
        begin
            Sql.Add('SELECT * FROM PISKDEPT WHERE EMPNO =''' + dept_empno.text + ''' ');
            Open;

            if (OraQuery1.RecordCount > 0) then
               if MessageDlg('기존에 등록된 자료가 존재합니다. 기존 자료 수정으로 저장하시겠습니까 ?', mtConfirmation, [mbYes,mbNo], 0) <> mrYes then System.Exit;

            Close;
            Sql.Clear;
        end;
        
        Sql.Add('MERGE INTO PISKDEPT P                                                                                 ');
        Sql.Add('  USING (SELECT ''' + dept_empno.text     + ''' EMPNO,                                                ');
        Sql.Add('                ''' + dept_orgnum.text    + ''' ORGNUM,                                               ');
        Sql.Add('                ''' + dept_deptcode.text  + ''' DEPTCODE,                                             ');
        Sql.Add('                NVL(''' + dept_useyn.text + ''',''N'') USEYN,                                         ');
        Sql.Add('                ''' + dept_bigo.text      + ''' BIGO,                                                 ');
        Sql.Add('                ''' + Pempno              + ''' WRITEEMP,                                             ');
        Sql.Add('                TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'') WRITETIME                                       ');
        Sql.Add('           FROM DUAL) V1                                                                              ');
        Sql.Add('     ON (P.EMPNO = V1.EMPNO)                                                                          ');
        Sql.Add('WHEN MATCHED THEN UPDATE SET                                                                          ');
        Sql.Add('                        P.ORGNUM    = V1.ORGNUM,                                                      ');
        Sql.Add('                        P.DEPTCODE  = V1.DEPTCODE,                                                    ');
        Sql.Add('                        P.USEYN     = V1.USEYN,                                                       ');
        Sql.Add('                        P.BIGO      = V1.BIGO,                                                        ');
        Sql.Add('                        P.WRITEEMP  = V1.WRITEEMP,                                                    ');
        Sql.Add('                        P.WRITETIME = V1.WRITETIME                                                    ');
        Sql.Add('WHEN NOT MATCHED THEN INSERT(P.EMPNO, P.ORGNUM, P.DEPTCODE, P.USEYN, P.BIGO, P.WRITEEMP, P.WRITETIME) ');
        Sql.Add('             VALUES(V1.EMPNO,V1.ORGNUM,V1.DEPTCODE,V1.USEYN,V1.BIGO,V1.WRITEEMP,V1.WRITETIME)         ');

        ExecSQL;
    end;
    
    btn_searchClick(self);
end;

procedure TFM_Mainform.delete_deptlist;
begin
    if(trim(dept_empno.Text)='') then
    begin
        MessageBox(handle,'선택된 사번이 없습니다.','알 림',MB_OK or $0030);
        dept_empno.Setfocus;
        system.Exit;
    end;

    if MessageDlg(' 선택하신 자료를 삭제하시겠습니까 ?', mtConfirmation, [mbYes,mbNo], 0) <> mrYes then System.Exit;

    with OraQuery1 do
    begin
        Close;
        Sql.Clear;
        Sql.Add('DELETE FROM PISKDEPT                           ');
        Sql.Add(' WHERE EMPNO = ''' + dept_empno.text     + ''' ');

        ExecSQL;
    end;
    
    btn_searchClick(self);
end;

procedure TFM_Mainform.btn_delClick(Sender: TObject);
begin
    InsertMode := false;
    
    if pageControl1.ActivePage = Tabsheet2 then delete_etclist
    else if pageControl1.ActivePage = Tabsheet3 then delete_titlist
    else if pageControl1.ActivePage = Tabsheet4 then delete_deptlist
    ;
end;

procedure TFM_Mainform.btn_cancelClick(Sender: TObject);
begin
    if  Application.MessageBox('취소하시겠습니까 ?',  'Message Box',mb_OKCancel + mb_DefButton1) = IDOK  then
    begin
        clear_fields;

        InsertMode := false;

        btn_search.enabled := true;
        btn_add.enabled    := true;
        btn_save.enabled   := true;
        btn_del.enabled    := true;
        btn_cancel.enabled := true;
        btn_excel.Enabled  := true;

        if pageControl1.ActivePage = Tabsheet1 then
        begin
            btn_add.enabled    := false;
            btn_save.enabled   := false;
            btn_del.enabled    := false;
            btn_cancel.enabled := false;
        end
        else if pageControl1.ActivePage = Tabsheet2 then
        begin
            retrieve_empno.Enabled := false;
            etc_empno.Enabled      := false;
            etc_cmpcd.Enabled      := false;
        end
        else if pageControl1.ActivePage = Tabsheet3 then
        begin
            tit_empno.Enabled      := false;
        end
        else if pageControl1.ActivePage = Tabsheet4 then
        begin
            dept_empno.Enabled      := false;
        end;
        
              if pageControl1.ActivePage = Tabsheet2 then grid_etcColEnter(grid_etc)
        else  if pageControl1.ActivePage = Tabsheet3 then grid_titleColEnter(grid_title)
        else  if pageControl1.ActivePage = Tabsheet4 then grid_deptColEnter(grid_dept)
        ;
    end;
end;

procedure TFM_Mainform.grid_etcColEnter(Sender: TObject);
begin
    with ora_etc do
    begin
        etc_empno.text       := FieldByName('EMPNO').AsString;
        etc_cmpcd.text       := FieldByName('CMPCD').AsString;
        etc_kname.text       := FieldByName('KNAME').AsString;
        etc_cname.text       := FieldByName('CNAME').AsString;
        etc_ename.text       := FieldByName('ENAME').AsString;

        etc_orgnum.text      := FieldByName('ORGNUM').AsString;
        etc_cdeptcd.text     := FieldByName('CDEPTCD').AsString;
        etc_cdept.caption    := FieldByName('CDEPT').AsString;
        etc_jmno.text        := FieldByName('JMNO').AsString;
        etc_handp.text       := FieldByName('HANDP').AsString;
        etc_otel.text        := FieldByName('OTEL').AsString;

        etc_title.text       := FieldByName('TITLE').AsString;
        etc_titname.caption  := FieldByName('TITNAME').AsString;
        etc_duty.text        := FieldByName('DUTY').AsString;
        etc_dutyname.caption := FieldByName('DUTYNAME').AsString;
        etc_rank.text        := FieldByName('RANK').AsString;
        etc_rankname.caption := FieldByName('RANKNAME').AsString;

        etc_intype.text      := FieldByName('INTYPE').AsString;
        etc_intypename.text  := FieldByName('INTYPENAME').AsString;
        etc_loccode.text     := FieldByName('LOCCODE').AsString;
        etc_locname.caption  := FieldByName('LOCNAME').AsString;
        //etc_jobcode.text       := FieldByName('JOBCODE').AsString;
        //etc_jobname.caption    := FieldByName('JOBNAME').AsString;

        etc_email.text       := FieldByName('EMAIL').AsString;
        etc_mailalias.text   := FieldByName('MAILALIAS').AsString;

        if(FieldByName('DISPLAYYN').AsString='Y') then etc_displayyn.ItemIndex := 0
                                                  else etc_displayyn.ItemIndex := 1;

        etc_retdate.text     := FieldByName('RETDATE').AsString;

        etc_cjob1.text       := FieldByName('CJOB1').AsString;
        etc_cjob2.text       := FieldByName('CJOB2').AsString;
        etc_cjob3.text       := FieldByName('CJOB3').AsString;
        etc_oldcmpcd.text    := FieldByName('OLDCMPCD').AsString;
        etc_oldempno.text    := FieldByName('OLDEMPNO').AsString;

        etc_Spdate1.text     := FieldByName('SPDATE1').AsString;
        etc_Spdate2.text     := FieldByName('SPDATE2').AsString;
        etc_Spbigo.text      := FieldByName('SPBIGO').AsString;
    end;
end;

procedure TFM_Mainform.grid_titleColEnter(Sender: TObject);
begin
    with ora_title do
    begin
        tit_empno.text       := FieldByName('EMPNO').AsString;
        tit_korname.text     := FieldByName('KORNAME').AsString;
        tit_codeno.text      := FieldByName('CODENO').AsString;
        tit_codename.caption := FieldByName('CODENAME').AsString;

        if(FieldByName('USEYN').AsString='Y') then tit_useyn.ItemIndex := 0
                                              else tit_useyn.ItemIndex := 1;

        tit_bigo.text        := FieldByName('BIGO').AsString;
    end;
end;

procedure TFM_Mainform.grid_deptColEnter(Sender: TObject);
begin
    with ora_dept do
    begin
        dept_empno.text       := FieldByName('EMPNO').AsString;
        dept_kname.text       := FieldByName('KNAME').AsString;
        dept_orgnum.text      := FieldByName('ORGNUM').AsString;
        dept_deptcode.text    := FieldByName('DEPTCODE').AsString;
        dept_deptname.caption := FieldByName('DEPTNAME').AsString;

        if(FieldByName('USEYN').AsString='Y') then dept_useyn.ItemIndex := 0
                                              else dept_useyn.ItemIndex := 1;

        dept_bigo.text        := FieldByName('BIGO').AsString;
    end;
end;

procedure TFM_Mainform.CodeDblClick(Sender: TObject);
begin
   FKeyCode := TFKeyCode.Create(self);
   Try
       if PageControl1.ActivePage = Tabsheet2 then
       begin
          case TComponent(Sender).Tag of
             1 : begin
                 FKeyCode.FormData := '직위코드 열람';
                 FKeyCode.DataVal1 := 'I118';
                 end;
             2 : begin
                 FKeyCode.FormData := '직책코드 열람';
                 FKeyCode.DataVal1 := 'I113';
                 end;
             4 : begin
                   FKeyCode.FormData := '근무지코드 열람';
                   FKeyCode.DataVal1  := 'I160';
                 end;
           end; {case end}

           FKeyCode.ShowModal;
           if FKeyCode.Code = '' then System.Exit;
           TmaskEdit(Sender).Text := FKeyCode.Code;
           case TComponent(Sender).Tag of
              1 : etc_titname.Caption  := FKeyCode.CodeName;
              2 : etc_dutyname.Caption := FKeyCode.CodeName;
              4 : etc_locname.Caption  := FKeyCode.CodeName;
           end; {case end}
       end;

       if pageControl1.ActivePage = TabSheet3 then
       begin
         case TComponent(Sender).Tag of
           1 : begin
               FKeyCode.FormData := '직위 코드열람';
               FKeyCode.DataVal1 := 'I118';
               end;
         end; {case end}

         FKeyCode.ShowModal;
         if FKeyCode.Code = '' then System.Exit;
         TMaskEdit(Sender).Text := FKeyCode.Code;
         case TComponent(Sender).Tag of
           1 : tit_codename.Caption := FKeyCode.CodeName;
         end; {case end}
      end;
   Finally
      FKeyCode.Free;
   end;
end;

procedure TFM_Mainform.save_titlist;
begin
    if(trim(tit_empno.Text)='') then
    begin
        MessageBox(handle,'사번번호 입력은 필수입니다.','알 림',MB_OK or $0030);
        tit_empno.Setfocus;
        system.Exit;
    end;

    if(trim(tit_codeno.Text)='') then
    begin
        MessageBox(handle,'직위 입력은 필수입니다.','알 림',MB_OK or $0030);
        tit_codeno.Setfocus;
        system.Exit;
    end;

    tit_codename.caption  := QCodeDisp('I118',tit_codeno.Text,'',0);

    if(trim(tit_codename.caption)='코드에러') then
    begin
        MessageBox(handle,'직위코드 오류입니다.','알 림',MB_OK or $0030);
        tit_codeno.Setfocus;
        system.Exit;
    end;

    if MessageDlg('입력하신 자료로 저장하시겠습니까 ?', mtConfirmation, [mbYes,mbNo], 0) <> mrYes then System.Exit;

    with OraQuery1 do
    begin
        Close;
        Sql.Clear;

        if(InsertMode) then
        begin
            Sql.Add('SELECT * FROM pisktitle WHERE EMPNO =''' + tit_empno.text + ''' ');
            Open;

            if(OraQuery1.RecordCount > 0) then
               if MessageDlg('기존에 등록된 자료가 존재합니다. 기존 자료 수정으로 저장하시겠습니까 ?', mtConfirmation, [mbYes,mbNo], 0) <> mrYes then System.Exit;

            Close;
            Sql.Clear;
        end;

        Sql.Add('MERGE INTO pisktitle P                                                                              ');
        Sql.Add('  USING (SELECT ''' + tit_empno.text     + ''' EMPNO,                                               ');
        Sql.Add('                ''I118'' CODEID,                                                                    ');
        Sql.Add('                ''' + tit_codeno.text    + ''' CODENO,                                              ');
        Sql.Add('                NVL(''' + tit_useyn.text + ''',''N'') USEYN,                                        ');
        Sql.Add('                ''' + tit_bigo.text      + ''' BIGO,                                                ');
        Sql.Add('                ''' + Pempno             + ''' WRITEEMP,                                            ');
        Sql.Add('                TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'') WRITETIME                                     ');
        Sql.Add('           FROM DUAL) V1                                                                            ');
        Sql.Add('     ON (P.EMPNO = V1.EMPNO)                                                                        ');
        Sql.Add('WHEN MATCHED THEN UPDATE SET                                                                        ');
        Sql.Add('                        P.CODEID  = V1.CODEID,                                                      ');
        Sql.Add('                        P.CODENO  = V1.CODENO,                                                      ');
        Sql.Add('                        P.USEYN     = V1.USEYN,                                                     ');
        Sql.Add('                        P.BIGO      = V1.BIGO,                                                      ');
        Sql.Add('                        P.WRITEEMP  = V1.WRITEEMP,                                                  ');
        Sql.Add('                        P.WRITETIME = V1.WRITETIME                                                  ');
        Sql.Add('WHEN NOT MATCHED THEN INSERT(P.EMPNO, P.CODEID, P.CODENO, P.USEYN, P.BIGO, P.WRITEEMP, P.WRITETIME) ');
        Sql.Add('             VALUES(V1.EMPNO,V1.CODEID,V1.CODENO,V1.USEYN,V1.BIGO,V1.WRITEEMP,V1.WRITETIME)         ');

        ExecSQL;
    end;
    
    btn_searchClick(self);
end;

procedure TFM_Mainform.delete_titlist;
begin
    if(trim(tit_empno.Text)='') then
    begin
        MessageBox(handle,'선택된 사번이 없습니다.','알 림',MB_OK or $0030);
        tit_empno.Setfocus;
        system.Exit;
    end;

    if MessageDlg(' 선택하신 자료를 삭제하시겠습니까 ?', mtConfirmation, [mbYes,mbNo], 0) <> mrYes then System.Exit;

    with OraQuery1 do
    begin
        Close;
        Sql.Clear;
        Sql.Add('DELETE FROM PISKTITLE                          ');
        Sql.Add(' WHERE EMPNO = ''' + tit_empno.text     + '''  ');

        ExecSQL;
    end;
    
    btn_searchClick(self);
end;

procedure TFM_Mainform.etc_cdeptcdDblClick(Sender: TObject);
begin
   DeptForm := TDeptForm.Create(Self);
   Try
     DeptForm.ShowModal;
     if DeptForm.Code1 <> '' then
     begin
        etc_orgnum.Text    := DeptForm.Code3;
        etc_cdeptcd.Text   := DeptForm.Code1;
        etc_cdept.Caption  := DeptForm.CodeName;
     end;
   Finally
      DeptForm.Free;
   End;
end;

procedure TFM_Mainform.save_etclist;
begin
    if(trim(etc_empno.Text)='') then
    begin
        MessageBox(handle,'사번번호 입력은 필수입니다.','알 림',MB_OK or $0030);
        etc_empno.Setfocus;
        system.Exit;
    end;

    if(trim(etc_cmpcd.Text)='') then
    begin
        MessageBox(handle,'관계사코드 입력은 필수입니다.','알 림',MB_OK or $0030);
        etc_cmpcd.Setfocus;
        system.Exit;
    end;

    if(trim(etc_orgnum.text)='') then etc_orgnum.Text := HyunOrgNum;

    etc_cdept.caption    := QDeptDisp(etc_cdeptcd.Text,etc_orgnum.Text,1);
    etc_titname.caption  := QCodeDisp('I118',etc_title.Text,'',0);
    etc_dutyname.caption := QCodeDisp('I113',etc_duty.Text,'',0);
    etc_locname.caption  := QCodeDisp('I160',etc_loccode.Text,'',0);

    if(trim(etc_cdept.caption)='부서에러') then
    begin
        MessageBox(handle,'부서코드 오류입니다.','알 림',MB_OK or $0030);
        etc_cdeptcd.Setfocus;
        system.Exit;
    end;

    if(trim(etc_titname.caption)='코드에러') then
    begin
        MessageBox(handle,'직위코드 오류입니다.','알 림',MB_OK or $0030);
        etc_title.Setfocus;
        system.Exit;
    end;

    if(trim(etc_dutyname.caption)='코드에러') then
    begin
        MessageBox(handle,'직책코드 오류입니다.','알 림',MB_OK or $0030);
        etc_duty.Setfocus;
        system.Exit;
    end;

    if(trim(etc_locname.caption)='코드에러') then
    begin
        MessageBox(handle,'근무지코드 오류입니다.','알 림',MB_OK or $0030);
        etc_loccode.Setfocus;
        system.Exit;
    end;

    if(trim(etc_mailalias.Text)='') then
    begin
        MessageBox(handle,'SKEmail 입력은 필수입니다.','알 림',MB_OK or $0030);
        etc_mailalias.Setfocus;
        system.Exit;
    end;

    if MessageDlg('입력하신 자료로 저장하시습니까 ?', mtConfirmation, [mbYes,mbNo], 0) <> mrYes then System.Exit;

    with OraQuery1 do
    begin
        Close;
        Sql.Clear;

        if(InsertMode) then
        begin
            Sql.Add('SELECT * FROM POSKMEMAS WHERE CMPCD = ''' + etc_cmpcd.text + '''  and EMPNO = ''' + etc_empno.text + ''' ');
            Open;

            if(OraQuery1.RecordCount > 0) then
               if MessageDlg('기존에 등록된 자료가 존재합니다. 기존 자료 수정으로 저장하시겠습니까 ?', mtConfirmation, [mbYes,mbNo], 0) <> mrYes then System.Exit;

            Close;
            Sql.Clear;
        end;

        //cubeone이 merge 지원하지 않아 암호화 함수 사용하여 처리함.
        Sql.Add('MERGE INTO POSKMEMAS# P                                                                                ');
        Sql.Add('  USING (SELECT ''' + etc_cmpcd.text       + ''' CMPCD      ,                                          ');
        Sql.Add('                ''' + etc_empno.text       + ''' EMPNO      ,                                          ');
        Sql.Add('                ''' + etc_kname.text       + ''' KNAME      ,                                          ');
        Sql.Add('                ''' + etc_cname.text       + ''' CNAME      ,                                          ');
        Sql.Add('                ''' + etc_ename.text       + ''' ENAME      ,                                          ');
        Sql.Add('                XX1.ENC_VARCHAR2_INS(''' + etc_jmno.text + ''',11,''SSN'',''POSKMEMAS'',''JMNO'') JMNO,');
        Sql.Add('                ''' + etc_handp.text       + ''' HANDP      ,                                          ');
        Sql.Add('                ''' + etc_otel.text        + ''' OTEL       ,                                          ');
        Sql.Add('                ''' + etc_title.text       + ''' TITLE      ,                                          ');
        Sql.Add('                ''' + etc_titname.caption  + ''' TITNAME    ,                                          ');
        Sql.Add('                ''' + etc_duty.text        + ''' DUTY       ,                                          ');
        Sql.Add('                ''' + etc_dutyname.caption + ''' DUTYNAME   ,                                          ');
        Sql.Add('                ''' + etc_rank.text        + ''' RANK       ,                                          ');
        Sql.Add('                ''' + etc_rankname.caption + ''' RANKNAME   ,                                          ');
        Sql.Add('                ''' + etc_intype.text      + ''' INTYPE     ,                                          ');
        Sql.Add('                ''' + etc_intypename.text  + ''' INTYPENAME ,                                          ');
        Sql.Add('                ''' + etc_jobcode.text     + ''' JOBCODE    ,                                          ');
        Sql.Add('                ''' + etc_jobname.caption  + ''' JOBNAME    ,                                          ');
        Sql.Add('                ''' + etc_loccode.text     + ''' LOCCODE    ,                                          ');
        Sql.Add('                ''' + etc_locname.caption  + ''' LOCNAME    ,                                          ');
        Sql.Add('                ''' + etc_cjob1.text       + ''' CJOB1      ,                                          ');
        Sql.Add('                ''' + etc_cjob2.text       + ''' CJOB2      ,                                          ');
        Sql.Add('                ''' + etc_cjob3.text       + ''' CJOB3      ,                                          ');
        Sql.Add('                ''' + etc_orgnum.text      + ''' ORGNUM     ,                                          ');
        Sql.Add('                ''' + etc_cdeptcd.text     + ''' CDEPTCD    ,                                          ');
        Sql.Add('                ''' + etc_cdept.caption    + ''' CDEPT      ,                                          ');
        Sql.Add('                ''' + etc_email.text       + ''' EMAIL      ,                                          ');
        Sql.Add('                ''' + etc_mailalias.text   + ''' MAILALIAS  ,                                          ');
        Sql.Add('                ''' + etc_oldcmpcd.text    + ''' OLDCMPCD   ,                                          ');
        Sql.Add('                ''' + etc_oldempno.text    + ''' OLDEMPNO   ,                                          ');
        Sql.Add('                ''' + etc_displayyn.text   + ''' DISPLAYYN  ,                                          ');
        Sql.Add('                ''1'' SORTORDER                             ,                                          ');
        Sql.Add('                ''' + etc_retdate.text     + ''' RETDATE    ,                                          ');
        Sql.Add('                ''' + Pempno               + '''  WRITEEMP  ,                                          ');
        Sql.Add('                TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'') WRITETIME,                                       ');
        Sql.Add('                ''' + etc_SPdate1.text     + ''' SPdate1    ,                                          '); //dsa2000  2018.08. Add 특이자의 꼬리표 생성
        Sql.Add('                ''' + etc_SPdate2.text     + ''' SPdate2    ,                                          '); //dsa2000  2018.08. Add 특이자의 꼬리표 생성
        Sql.Add('                ''' + etc_SPbigo.text      + ''' SPbigo                                                '); //dsa2000  2018.08. Add 특이자의 꼬리표 생성
        Sql.Add('           FROM DUAL) V1                                                                               ');
        Sql.Add('     ON (P.EMPNO = V1.EMPNO)                                                                           ');
        Sql.Add('WHEN MATCHED THEN UPDATE SET                                                                           ');
        Sql.Add('                        P.CMPCD      = V1.CMPCD     ,                                                  ');
        Sql.Add('                        P.KNAME      = V1.KNAME     ,                                                  ');
        Sql.Add('                        P.CNAME      = V1.CNAME     ,                                                  ');
        Sql.Add('                        P.ENAME      = V1.ENAME     ,                                                  ');
        Sql.Add('                        P.JMNO       = V1.JMNO      ,                                                  ');
        Sql.Add('                        P.HANDP      = V1.HANDP     ,                                                  ');
        Sql.Add('                        P.OTEL       = V1.OTEL      ,                                                  ');
        Sql.Add('                        P.TITLE      = V1.TITLE     ,                                                  ');
        Sql.Add('                        P.TITNAME    = V1.TITNAME   ,                                                  ');
        Sql.Add('                        P.DUTY       = V1.DUTY      ,                                                  ');
        Sql.Add('                        P.DUTYNAME   = V1.DUTYNAME  ,                                                  ');
        Sql.Add('                        P.RANK       = V1.RANK      ,                                                  ');
        Sql.Add('                        P.RANKNAME   = V1.RANKNAME  ,                                                  ');
        Sql.Add('                        P.INTYPE     = V1.INTYPE    ,                                                  ');
        Sql.Add('                        P.INTYPENAME = V1.INTYPENAME,                                                  ');
        Sql.Add('                        P.JOBCODE    = V1.JOBCODE   ,                                                  ');
        Sql.Add('                        P.JOBNAME    = V1.JOBNAME   ,                                                  ');
        Sql.Add('                        P.LOCCODE    = V1.LOCCODE   ,                                                  ');
        Sql.Add('                        P.LOCNAME    = V1.LOCNAME   ,                                                  ');
        Sql.Add('                        P.CJOB1      = V1.CJOB1     ,                                                  ');
        Sql.Add('                        P.CJOB2      = V1.CJOB2     ,                                                  ');
        Sql.Add('                        P.CJOB3      = V1.CJOB3     ,                                                  ');
        Sql.Add('                        P.ORGNUM     = V1.ORGNUM    ,                                                  ');
        Sql.Add('                        P.CDEPTCD    = V1.CDEPTCD   ,                                                  ');
        Sql.Add('                        P.CDEPT      = V1.CDEPT     ,                                                  ');
        Sql.Add('                        P.EMAIL      = V1.EMAIL     ,                                                  ');
        Sql.Add('                        P.MAILALIAS  = V1.MAILALIAS ,                                                  ');
        Sql.Add('                        P.OLDCMPCD   = V1.OLDCMPCD  ,                                                  ');
        Sql.Add('                        P.OLDEMPNO   = V1.OLDEMPNO  ,                                                  ');
        Sql.Add('                        P.DISPLAYYN  = V1.DISPLAYYN ,                                                  ');
        Sql.Add('                        P.SORTORDER  = V1.SORTORDER ,                                                  ');
        Sql.Add('                        P.RETDATE    = V1.RETDATE   ,                                                  ');
        Sql.Add('                        P.WRITEEMP   = V1.WRITEEMP  ,                                                  ');
        Sql.Add('                        P.WRITETIME  = V1.WRITETIME ,                                                  ');
        Sql.Add('                        P.SPdate1    = V1.SPdate1   ,                                                  '); //dsa2000  2018.08. Add 특이자의 꼬리표 생성
        Sql.Add('                        P.SPdate2    = V1.SPdate2   ,                                                  '); //dsa2000  2018.08. Add 특이자의 꼬리표 생성
        Sql.Add('                        P.SPbigo     = V1.SPbigo                                                       '); //dsa2000  2018.08. Add 특이자의 꼬리표 생성
        Sql.Add('WHEN NOT MATCHED THEN INSERT (                                                                         ');
        Sql.Add('                    P.CMPCD      ,P.EMPNO      ,P.KNAME      ,P.CNAME      ,P.ENAME      ,P.JMNO      ,');
        Sql.Add('                    P.HANDP      ,P.OTEL       ,P.TITLE      ,P.TITNAME    ,P.DUTY       ,P.DUTYNAME  ,');
        Sql.Add('                    P.RANK       ,P.RANKNAME   ,P.INTYPE     ,P.INTYPENAME ,P.JOBCODE    ,P.JOBNAME   ,');
        Sql.Add('                    P.LOCCODE    ,P.LOCNAME    ,P.CJOB1      ,P.CJOB2      ,P.CJOB3      ,P.CDEPTCD   ,');
        Sql.Add('                    P.CDEPT      ,P.EMAIL      ,P.MAILALIAS  ,P.ORGNUM     ,P.OLDCMPCD   ,P.OLDEMPNO  ,');
        Sql.Add('                    P.DISPLAYYN  ,P.SORTORDER  ,P.RETDATE    ,P.WRITEEMP   ,P.WRITETIME               ,');
        Sql.Add('                    P.SPdate1    ,P.SPdate2    ,P.SPbigo)                                              '); //dsa2000  2018.08. Add 특이자의 꼬리표 생성
        Sql.Add('             VALUES(                                                                                   ');
        Sql.Add('                    V1.CMPCD     ,V1.EMPNO     ,V1.KNAME     ,V1.CNAME     ,V1.ENAME     ,V1.JMNO     ,');
        Sql.Add('                    V1.HANDP     ,V1.OTEL      ,V1.TITLE     ,V1.TITNAME   ,V1.DUTY      ,V1.DUTYNAME ,');
        Sql.Add('                    V1.RANK      ,V1.RANKNAME  ,V1.INTYPE    ,V1.INTYPENAME,V1.JOBCODE   ,V1.JOBNAME  ,');
        Sql.Add('                    V1.LOCCODE   ,V1.LOCNAME   ,V1.CJOB1     ,V1.CJOB2     ,V1.CJOB3     ,V1.CDEPTCD  ,');
        Sql.Add('                    V1.CDEPT     ,V1.EMAIL     ,V1.MAILALIAS ,V1.ORGNUM    ,V1.OLDCMPCD  ,V1.OLDEMPNO ,');
        Sql.Add('                    V1.DISPLAYYN ,V1.SORTORDER ,V1.RETDATE   ,V1.WRITEEMP  ,V1.WRITETIME              ,');
        Sql.Add('                    V1.SPdate1   ,V1.SPdate2   ,V1.SPbigo )                                            '); //dsa2000  2018.08. Add 특이자의 꼬리표 생성
        ExecSQL;
    end;
    btn_searchClick(self);
end;

procedure TFM_Mainform.delete_etclist;
begin
    if(trim(etc_empno.Text)='') then
    begin
        MessageBox(handle,'선택된 사번이 없습니다.','알 림',MB_OK or $0030);
        etc_empno.Setfocus;                       
        system.Exit;
    end;

    if MessageDlg(' 선택하신 자료를 삭제하시겠습니까 ?', mtConfirmation, [mbYes,mbNo], 0) <> mrYes then System.Exit;

    with OraQuery1 do
    begin
        Close;
        Sql.Clear;
        Sql.Add('DELETE FROM Poskmemas                         ');
        Sql.Add(' WHERE EMPNO = ''' + etc_empno.text     + ''' ');

        ExecSQL;
    end;
    
    btn_searchClick(self);
end;


procedure TFM_Mainform.btn_excelClick(Sender: TObject);
begin
    InsertMode := false;

    //2016.08.05.hjku.. 엑셀 저장 추가. 김진호M 요청
    if       pageControl1.ActivePage = Tabsheet1 then save_excel_totlist
    else  if pageControl1.ActivePage = Tabsheet2 then save_excel_etclist
    else  if pageControl1.ActivePage = Tabsheet3 then save_excel_titlist
    else  if pageControl1.ActivePage = Tabsheet4 then save_excel_deptlist
    ;
end;

procedure TFM_Mainform.save_excel_deptlist;
var XL, XArr: Variant;
    i,j,k: integer;
    SavePlace: TBookmark;
begin
{ //전체자료 추출할때..}
  if   Ora_dept.RecordCount < 1 then
  begin
       showmessage('엑셀 변환할 자료가 없습니다.');
       exit;
  end;

  XArr := VarArrayCreate([1, 7], VarVariant);
  try
       XL := CreateOLEObject('Excel.Application');
  except
       MessageDlg('Excel이 설치되어 있지 않습니다.', MtWarning, [mbok], 0);
       Exit;
  end;

  XL.WorkBooks.Add; //새로운 페이지 생성
  XL.Visible            := false;
  XL.WorkSheets[1].Name := '톡톡 특이부서 대상자 명단';  //시트명 부여
  XL.Range['A1:G2'].Merge;               //셀 병합

  //TITLE NAME 설정
  XL.Range['A1'].value  := '톡톡 특이부서 대상자 명단';
  XL.Range['A1'].font.Size := 16;
  XL.Range['A1'].font.Bold := True;

  //컬럼명 지정_서브타이블 지정

  XArr[ 1]  := '사번'    ;
  XArr[ 2]  := '성명'    ;
  XArr[ 3]  := '조직차수';
  XArr[ 4]  := '부서코드';
  XArr[ 5]  := '부서명'  ;
  XArr[ 6]  := '사용여부';
  XArr[ 7]  := '비고'    ;

  XL.Range['A3' , 'G3'].Value := XArr;
  k := 3;

  XL.Range['A3' , 'G3'].HorizontalAlignment := 3;
  XL.Range['A3' , 'G3'].Interior.Color:= $00CBF0B3;
  XL.Range['A3' , 'G3'].font.Size := 10;
  XL.Range['A3' , 'G3'].font.Bold := True;


  //검색된 자료를 excel에 export처리 시킨다.
  SavePlace :=   Ora_dept.GetBookmark;
    Ora_dept.DisableControls;
    Ora_dept.First;     //Showmessage(inttostr(  Ora_dept.RecordCount));

  for i := 1 to    Ora_dept.RecordCount do
  begin
     XArr[ 1]  :=  Ora_dept.FieldbyName('EMPNO').AsString;
     XArr[ 2]  :=  Ora_dept.FieldByName('KNAME').AsString;
     XArr[ 3]  :=  Ora_dept.FieldbyName('ORGNUM').AsString;
     XArr[ 4]  :=  Ora_dept.FieldbyName('DEPTCODE').AsString;
     XArr[ 5]  :=  Ora_dept.FieldbyName('deptname').AsString;
     XArr[ 6]  :=  Ora_dept.FieldByName('USEYN').AsString;
     XArr[ 7]  :=  Ora_dept.FieldByName('BIGO').AsString;

     XL.Range['A' + IntToStr(k+1), 'G' + IntToStr(k+1)].NumberFormat := '@';
     XL.Range['A' + IntToStr(k+1), 'G' + IntToStr(k+1)].Value := XArr;
     inc(k);
       Ora_dept.Next;
  end;
  //여기서 부터는 EXPORT된 EXCEL자료를 예쁘게 꾸미는 부분입니다.
   XL.Range['A1', 'G' + IntToStr(k)].Borders.LineStyle   := 1;  //테두리선을 만든다.  1은 실선
   XL.Range['A1', 'G' + IntToStr(k)].Borders.Weight      := 2;  //테두리선 두깨 설정  2는 보통두깨, 3은 무지 두꺼움
   XL.Range['A1', 'G' + IntToStr(k)].Borders.ColorIndex  := 1;  //테두리선 색상설정  1은 검은색
   XL.Range['A1', 'G' + IntToStr(k)].font.name := '맑은 고딕';//'굴림체';
   XL.Range['A1', 'A1'].HorizontalAlignment              := 3;  //가운데 정렬
   XL.Range['A3', 'G' + IntToStr(k)].font.Size           := 9;
   XL.Range['A4', 'G' + IntToStr(k)].HorizontalAlignment := 1;  //좌측정렬
   XL.Range['A1', 'G' + IntToStr(k)].Select;                    //자료를 모두 SELECT한 후 --하는 이유:  AutoFit 처리하기 위해서임
   XL.Selection.Columns.AutoFit;                                //자동정렬
   XL.Range['A4', 'A4'].Select;                                 //A4열에 커서 위치시킴
   XL.Visible := true;                                          //엑셀자료 보여줌
   Screen.Cursor := crDefault;
   Ora_dept.GotoBookmark(SavePlace);
   Ora_dept.FreeBookmark(SavePlace);
   Ora_dept.EnableControls;
end;


procedure TFM_Mainform.save_excel_titlist;
var XL, XArr: Variant;
    i,j,k: integer;
    SavePlace: TBookmark;
begin
{ //전체자료 추출할때..}
  if   ora_title.RecordCount < 1 then
  begin
       showmessage('엑셀 변환할 자료가 없습니다.');
       exit;
  end;

  XArr := VarArrayCreate([1, 6], VarVariant);
  try
       XL := CreateOLEObject('Excel.Application');
  except
       MessageDlg('Excel이 설치되어 있지 않습니다.', MtWarning, [mbok], 0);
       Exit;
  end;

  XL.WorkBooks.Add; //새로운 페이지 생성
  XL.Visible            := false;
  XL.WorkSheets[1].Name := '톡톡 특이 직위자 명단';  //시트명 부여
  XL.Range['A1:F2'].Merge;               //셀 병합

  //TITLE NAME 설정
  XL.Range['A1'].value  := '톡톡 특이 직위자 명단 ';
  XL.Range['A1'].font.Size := 16;
  XL.Range['A1'].font.Bold := True;

  //컬럼명 지정_서브타이블 지정

  XArr[ 1]  := '사번'      ;
  XArr[ 2]  := '성명'      ;
  XArr[ 3]  := '직위코드'  ;
  XArr[ 4]  := '직위명'    ;
  XArr[ 5]  := '사용여부'  ;
  XArr[ 6]  := '비고'      ;

  XL.Range['A3' , 'F3'].Value := XArr;
  k := 3;

  XL.Range['A3' , 'F3'].HorizontalAlignment := 3;
  XL.Range['A3' , 'F3'].Interior.Color:= $00CBF0B3;
  XL.Range['A3' , 'F3'].font.Size := 10;
  XL.Range['A3' , 'F3'].font.Bold := True;


  //검색된 자료를 excel에 export처리 시킨다.
  SavePlace :=   ora_title.GetBookmark;
    ora_title.DisableControls;
    ora_title.First;     //Showmessage(inttostr(  ora_title.RecordCount));

  for i := 1 to    ora_title.RecordCount do
  begin
     XArr[ 1]  :=  ora_title.FieldbyName('EMPNO').AsString;
     XArr[ 2]  :=  '''' + ora_title.FieldByName('korname').AsString;
     XArr[ 3]  :=  ora_title.FieldbyName('CODENO').AsString;
     XArr[ 4]  :=  ora_title.FieldbyName('codename').AsString;
     XArr[ 5]  :=  ora_title.FieldbyName('USEYN').AsString;
     XArr[ 6]  :=  ora_title.FieldByName('BIGO').AsString;

     XL.Range['A' + IntToStr(k+1), 'F' + IntToStr(k+1)].NumberFormat := '@';
     XL.Range['A' + IntToStr(k+1), 'F' + IntToStr(k+1)].Value := XArr;
     inc(k);
       ora_title.Next;
  end;
  //여기서 부터는 EXPORT된 EXCEL자료를 예쁘게 꾸미는 부분입니다.
   XL.Range['A1', 'F' + IntToStr(k)].Borders.LineStyle   := 1;  //테두리선을 만든다.  1은 실선
   XL.Range['A1', 'F' + IntToStr(k)].Borders.Weight      := 2;  //테두리선 두깨 설정  2는 보통두깨, 3은 무지 두꺼움
   XL.Range['A1', 'F' + IntToStr(k)].Borders.ColorIndex  := 1;  //테두리선 색상설정  1은 검은색
   XL.Range['A1', 'F' + IntToStr(k)].font.name := '맑은 고딕';//'굴림체';
   XL.Range['A1', 'A1'].HorizontalAlignment              := 3;  //가운데 정렬
   XL.Range['A3', 'F' + IntToStr(k)].font.Size           := 9;
   XL.Range['A4', 'F' + IntToStr(k)].HorizontalAlignment := 1;  //좌측정렬
   XL.Range['A1', 'F' + IntToStr(k)].Select;                    //자료를 모두 SELECT한 후 --하는 이유:  AutoFit 처리하기 위해서임
   XL.Selection.Columns.AutoFit;                                //자동정렬
   XL.Range['A4', 'A4'].Select;                                 //A4열에 커서 위치시킴
   XL.Visible := true;                                          //엑셀자료 보여줌

   Screen.Cursor := crDefault;
   ora_title.GotoBookmark(SavePlace);
   ora_title.FreeBookmark(SavePlace);
   ora_title.EnableControls;
end;


procedure TFM_Mainform.save_excel_etclist;
var XL, XArr: Variant;
    i,j,k: integer;
    SavePlace: TBookmark;
begin
{ //전체자료 추출할때..}
  if   ora_etc.RecordCount < 1 then
  begin
       showmessage('엑셀 변환할 자료가 없습니다.');
       exit;
  end;

  XArr := VarArrayCreate([1, 35], VarVariant);
  try
       XL := CreateOLEObject('Excel.Application');
  except
       MessageDlg('Excel이 설치되어 있지 않습니다.', MtWarning, [mbok], 0);
       Exit;
  end;

  XL.WorkBooks.Add; //새로운 페이지 생성
  XL.Visible            := false;
  XL.WorkSheets[1].Name := '톡톡 연계 특이자 명단';  //시트명 부여
  XL.Range['A1:AI2'].Merge;               //셀 병합

  //TITLE NAME 설정
  XL.Range['A1'].value  := '톡톡 연계 특이자 명단';
  XL.Range['A1'].font.Size := 16;
  XL.Range['A1'].font.Bold := True;

  //컬럼명 지정_서브타이블 지정
  XArr[ 1]  := '관계사CODE'    ;
  XArr[ 2]  := '사원번호'      ;
  XArr[ 3]  := '성명-한글'     ;
  XArr[ 4]  := '성명-한자'     ;
  XArr[ 5]  := '성명-영문'     ;
  XArr[ 6]  := '주민번호'      ;
  XArr[ 7]  := '핸드폰'        ;
  XArr[ 8]  := '회사번호'      ;
  XArr[ 9]  := '직위코드'      ;
  XArr[10]  := '직위이름'      ;
  XArr[11]  := '직책코드'      ;
  XArr[12]  := '직책이름'      ;
  XArr[13]  := '직급코드'      ;
  XArr[14]  := '직급이름'      ;
  XArr[15]  := '사원유형코드'  ;
  XArr[16]  := '사원유형이름'  ;
  XArr[17]  := '직무코드'      ;
  XArr[18]  := '직무이름'      ;
  XArr[19]  := '근무지역코드'  ;
  XArr[20]  := '근무지역명'    ;
  XArr[21]  := '담당업무1'     ;
  XArr[22]  := '담당업무2'     ;
  XArr[23]  := '담당업무3'     ;
  XArr[24]  := '현소속부서코드';
  XArr[25]  := '현조직차수'    ;
  XArr[26]  := '현소속부서명'  ;
  XArr[27]  := '메일주소'      ;
  XArr[28]  := 'SK그룹메일'    ;
  XArr[29]  := '이전관계사Code';
  XArr[30]  := '이전사번'      ;
  XArr[31]  := '표시여부'      ;
  XArr[32]  := '표시순서'      ;
  XArr[33]  := '퇴직일자'      ;
  XArr[34]  := '특별관리기간'  ;  //dsa2000  2018.08. Add
  XArr[35]  := '특별관리내용'  ;  //dsa2000  2018.08. Add

  XL.Range['A3' , 'AI3'].Value := XArr;

  k := 3;
  XL.Range['A3' , 'AI3'].HorizontalAlignment := 3;
  XL.Range['A3' , 'AI3'].Interior.Color:= $00CBF0B3;
  XL.Range['A3' , 'AI3'].font.Size := 10;
  XL.Range['A3' , 'AI3'].font.Bold := True;


  //검색된 자료를 excel에 export처리 시킨다.
  SavePlace :=   ora_etc.GetBookmark;
  ora_etc.DisableControls;
  ora_etc.First;     //Showmessage(inttostr(  ora_etc.RecordCount));

  for i := 1 to    ora_etc.RecordCount do
  begin
     XArr[ 1]  :=  ora_etc.FieldbyName('CMPCD').AsString;
     XArr[ 2]  :=  '''' + ora_etc.FieldByName('EMPNO').AsString;
     XArr[ 3]  :=  ora_etc.FieldbyName('KNAME').AsString;
     XArr[ 4]  :=  ora_etc.FieldbyName('CNAME').AsString;
     XArr[ 5]  :=  ora_etc.FieldbyName('ENAME').AsString;
     XArr[ 6]  :=  ora_etc.FieldByName('JMNO').AsString;
     XArr[ 7]  :=  ora_etc.FieldByName('HANDP').AsString;
     XArr[ 8]  :=  ora_etc.FieldByName('OTEL').AsString;
     XArr[ 9]  :=  ora_etc.FieldByName('TITLE').AsString;
     XArr[10]  :=  ora_etc.FieldByName('TITNAME').AsString;
     XArr[11]  :=  ora_etc.FieldByName('DUTY').AsString;
     XArr[12]  :=  ora_etc.FieldByName('DUTYNAME').AsString;
     XArr[13]  :=  ora_etc.FieldByName('RANK').AsString;
     XArr[14]  :=  ora_etc.FieldbyName('RANKNAME').AsString;
     XArr[15]  :=  '''' + ora_etc.FieldbyName('INTYPE').AsString;
     XArr[16]  :=  ora_etc.FieldByName('INTYPENAME').AsString;
     XArr[17]  :=  ora_etc.FieldByName('JOBCODE').AsString;
     XArr[18]  :=  ora_etc.FieldByName('JOBNAME').AsString;
     XArr[19]  :=  ora_etc.FieldByName('LOCCODE').AsString;
     XArr[20]  :=  ora_etc.FieldByName('LOCNAME').AsString;
     XArr[21]  :=  ora_etc.FieldByName('CJOB1').AsString;
     XArr[22]  :=  ora_etc.FieldByName('CJOB2').AsString;
     XArr[23]  :=  ora_etc.FieldByName('CJOB3').AsString;
     XArr[24]  :=  ora_etc.FieldByName('ORGNUM').AsString;
     XArr[25]  :=  ora_etc.FieldbyName('CDEPTCD').AsString;
     XArr[26]  :=  ora_etc.FieldByName('CDEPT').AsString;
     XArr[27]  :=  ora_etc.FieldByName('EMAIL').AsString;
     XArr[28]  :=  ora_etc.FieldByName('MAILALIAS').AsString;
     XArr[29]  :=  ora_etc.FieldByName('OLDCMPCD').AsString;
     XArr[30]  :=  ora_etc.FieldByName('OLDEMPNO').AsString;
     XArr[31]  :=  ora_etc.FieldByName('DISPLAYYN').AsString;
     XArr[32]  :=  ora_etc.FieldByName('SORTORDER').AsString;
     XArr[33]  :=  ora_etc.FieldByName('RETDATE').AsString;

     if Trim(ora_etc.FieldByName('SPdate1').AsString) = '' then XArr[34]  := ''
     else XArr[34] := ora_etc.FieldByName('SPdate1').AsString+'~'+ora_etc.FieldByName('SPdate2').AsString; //dsa2000  2018.08. Add
     XArr[35]  :=  ora_etc.FieldByName('SPbigo').AsString;                                                 //dsa2000  2018.08. Add

     XL.Range['A' + IntToStr(k+1), 'AI' + IntToStr(k+1)].NumberFormat := '@';
     XL.Range['A' + IntToStr(k+1), 'AI' + IntToStr(k+1)].Value := XArr;
     inc(k);
     ora_etc.Next;
  end;

  //여기서 부터는 EXPORT된 EXCEL자료를 예쁘게 꾸미는 부분입니다.
   XL.Range['A1', 'AI' + IntToStr(k)].Borders.LineStyle   := 1;  //테두리선을 만든다.  1은 실선
   XL.Range['A1', 'AI' + IntToStr(k)].Borders.Weight      := 2;  //테두리선 두깨 설정  2는 보통두깨, 3은 무지 두꺼움
   XL.Range['A1', 'AI' + IntToStr(k)].Borders.ColorIndex  := 1;  //테두리선 색상설정  1은 검은색
   XL.Range['A1', 'AI' + IntToStr(k)].font.name := '맑은 고딕';//'굴림체';
   XL.Range['A1', 'A1'].HorizontalAlignment              := 3;  //가운데 정렬
   XL.Range['A3', 'AI' + IntToStr(k)].font.Size           := 9;
   XL.Range['A4', 'AI' + IntToStr(k)].HorizontalAlignment := 1;  //좌측정렬
   XL.Range['A1', 'AI' + IntToStr(k)].Select;                    //자료를 모두 SELECT한 후 --하는 이유:  AutoFit 처리하기 위해서임
   XL.Selection.Columns.AutoFit;                                //자동정렬
   XL.Range['A4', 'A4'].Select;                                 //A4열에 커서 위치시킴
   XL.Visible := true;                                          //엑셀자료 보여줌
   Screen.Cursor := crDefault;
   ora_etc.GotoBookmark(SavePlace);
   ora_etc.FreeBookmark(SavePlace);
   ora_etc.EnableControls;
end;

procedure TFM_Mainform.save_excel_totlist;
var XL, XArr: Variant;
    i,j,k: integer;
    SavePlace: TBookmark;
begin
{ //전체자료 추출할때..}
  if  ora_tok.RecordCount < 1 then
  begin
       showmessage('엑셀 변환할 자료가 없습니다.');
       exit;
  end;

  XArr := VarArrayCreate([1, 35], VarVariant);
  try
       XL := CreateOLEObject('Excel.Application');
  except
       MessageDlg('Excel이 설치되어 있지 않습니다.', MtWarning, [mbok], 0);
       Exit;
  end;

  XL.WorkBooks.Add; //새로운 페이지 생성
  XL.Visible            := false;
  XL.WorkSheets[1].Name := '톡톡 연계 대상자 명단';  //시트명 부여
  XL.Range['A1:AG2'].Merge;               //셀 병합

  //TITLE NAME 설정
  XL.Range['A1'].value  := '톡톡 연계 대상자 명단';
  XL.Range['A1'].font.Size := 16;
  XL.Range['A1'].font.Bold := True;

  //컬럼명 지정_서브타이블 지정

  XArr[ 1]  := '구분'        ;
  XArr[ 2]  := '관계사'      ;
  XArr[ 3]  := '사번'        ;
  XArr[ 4]  := '성명'        ;
  XArr[ 5]  := '한자명'      ;
  XArr[ 6]  := '영문명'      ;
  XArr[ 7]  := '주민번호'    ;
  XArr[ 8]  := '핸드폰'      ;
  XArr[ 9]  := '사무실'      ;
  XArr[10]  := '직위코드'    ;
  XArr[11]  := '직위명'      ;
  XArr[12]  := '직책코드'    ;
  XArr[13]  := '직책명'      ;
  XArr[14]  := '직급코드'    ;
  XArr[15]  := '직급명'      ;
  XArr[16]  := '사원유형코드';
  XArr[17]  := '사원유형명'  ;
  XArr[18]  := '직무코드'    ;
  XArr[19]  := '직무명'      ;
  XArr[20]  := '근무지코드'  ;
  XArr[21]  := '근무지명'    ;
  XArr[22]  := '담당업무1'   ;
  XArr[23]  := '담당업무2'   ;
  XArr[24]  := '담당업무3'   ;
  XArr[25]  := '현부서코드'  ;
  XArr[26]  := '현부서명'    ;
  XArr[27]  := 'EMAIL'       ;
  XArr[28]  := 'SK그룹메일'  ;
  XArr[29]  := '전관계사'    ;
  XArr[30]  := '전사번'      ;
  XArr[31]  := '표시여부'    ;
  XArr[32]  := '표시순서'    ;
  XArr[33]  := '퇴직일자'    ;

  XL.Range['A3' , 'AG3'].Value := XArr;
  k := 3;
  XL.Range['A3' , 'AG3'].HorizontalAlignment := 3;
  XL.Range['A3' , 'AG3'].Interior.Color:= $00CBF0B3;
  XL.Range['A3' , 'AG3'].font.Size := 10;
  XL.Range['A3' , 'AG3'].font.Bold := True;

  //검색된 자료를 excel에 export처리 시킨다.
  SavePlace :=  ora_tok.GetBookmark;
  ora_tok.DisableControls;
  ora_tok.First;     //Showmessage(inttostr( ora_tok.RecordCount));

  for i := 1 to   ora_tok.RecordCount do
  begin
     XArr[ 1]  := ora_tok.FieldbyName('GUBUNNAME').AsString;
     XArr[ 2]  := ora_tok.FieldByName('CMPCD').AsString;
     XArr[ 3]  := ora_tok.FieldbyName('EMPNO').AsString;
     XArr[ 4]  := ora_tok.FieldbyName('KNAME').AsString;
     XArr[ 5]  := ora_tok.FieldbyName('CNAME').AsString;
     XArr[ 6]  := ora_tok.FieldByName('ENAME').AsString;
     XArr[ 7]  := ora_tok.FieldByName('JMNO').AsString;
     XArr[ 8]  := ora_tok.FieldByName('HANDP').AsString;
     XArr[ 9]  := ora_tok.FieldByName('OTEL').AsString;
     XArr[10]  := ora_tok.FieldByName('TITLE').AsString;
     XArr[11]  := ora_tok.FieldByName('TITNAME').AsString;
     XArr[12]  := ora_tok.FieldByName('DUTY').AsString;
     XArr[13]  := ora_tok.FieldByName('DUTYNAME').AsString;
     XArr[14]  := ora_tok.FieldbyName('RANK').AsString;
     XArr[15]  := ora_tok.FieldbyName('RANKNAME').AsString;
     XArr[16]  := ora_tok.FieldByName('INTYPE').AsString;
     XArr[17]  := ora_tok.FieldByName('INTYPENAME').AsString;
     XArr[18]  := ora_tok.FieldByName('JOBCODE').AsString;
     XArr[19]  := ora_tok.FieldByName('JOBNAME').AsString;
     XArr[20]  := ora_tok.FieldByName('LOCCODE').AsString;
     XArr[21]  := ora_tok.FieldByName('LOCNAME').AsString;
     XArr[22]  := ora_tok.FieldByName('CJOB1').AsString;
     XArr[23]  := ora_tok.FieldByName('CJOB2').AsString;
     XArr[24]  := ora_tok.FieldByName('CJOB3').AsString;
     XArr[25]  := ora_tok.FieldbyName('CDEPTCD').AsString;
     XArr[26]  := ora_tok.FieldByName('CDEPT').AsString;
     XArr[27]  := ora_tok.FieldByName('EMAIL').AsString;
     XArr[28]  := ora_tok.FieldByName('MAILALIAS').AsString;
     XArr[29]  := ora_tok.FieldByName('OLDCMPCD').AsString;
     XArr[30]  := ora_tok.FieldByName('OLDEMPNO').AsString;
     XArr[31]  := ora_tok.FieldByName('DISPLAYYN').AsString;
     XArr[32]  := ora_tok.FieldByName('SORTORDER').AsString;
     XArr[33]  := ora_tok.FieldByName('RETDATE').AsString;

     XL.Range['A' + IntToStr(k+1), 'AG' + IntToStr(k+1)].NumberFormat := '@';
     XL.Range['A' + IntToStr(k+1), 'AG' + IntToStr(k+1)].Value := XArr;
     inc(k);
     ora_tok.Next;
  end;
  //여기서 부터는 EXPORT된 EXCEL자료를 예쁘게 꾸미는 부분입니다.
   XL.Range['A1', 'AG' + IntToStr(k)].Borders.LineStyle   := 1;  //테두리선을 만든다.  1은 실선
   XL.Range['A1', 'AG' + IntToStr(k)].Borders.Weight      := 2;  //테두리선 두깨 설정  2는 보통두깨, 3은 무지 두꺼움
   XL.Range['A1', 'AG' + IntToStr(k)].Borders.ColorIndex  := 1;  //테두리선 색상설정  1은 검은색
   XL.Range['A1', 'AG' + IntToStr(k)].font.name := '맑은 고딕';//'굴림체';
   XL.Range['A1', 'A1'].HorizontalAlignment              := 3;  //가운데 정렬
   XL.Range['A3', 'AG' + IntToStr(k)].font.Size           := 9;
   XL.Range['A4', 'AG' + IntToStr(k)].HorizontalAlignment := 1;  //좌측정렬
   XL.Range['A1', 'AG' + IntToStr(k)].Select;                    //자료를 모두 SELECT한 후 --하는 이유:  AutoFit 처리하기 위해서임
   XL.Selection.Columns.AutoFit;                                //자동정렬
   XL.Range['A4', 'A4'].Select;                                 //A4열에 커서 위치시킴
   XL.Visible := true;                                          //엑셀자료 보여줌
   Screen.Cursor := crDefault;
   ora_tok.GotoBookmark(SavePlace);
   ora_tok.FreeBookmark(SavePlace);
   ora_tok.EnableControls;
end;

//------------------------------------------------------------------------------
// 입력받은 데이타를 코드 화일에서 찾아서 해당 필드에 보여준다..
//------------------------------------------------------------------------------
function TFM_Mainform.QCodeDisp(s1,s2,s3 : String; gubun : integer) : String;
var
  str : string;
begin
   if trim(s2) = '' then
   begin
      QcodeDisp := '';
      system.exit;
   end;

   with OraQuery1 do
   begin
        Close;
        Sql.Clear;
        Sql.Add('SELECT CODEID, CODENO, CODENAME                    ');
        Sql.Add('      ,GROUPCODE, GROUPCODENAME                    ');
        Sql.Add('      ,GROUPCODE2, GROUPCODENAME2                  ');
        Sql.Add('      ,NATIONCD                                    ');
        Sql.Add('      ,(select codename from pyccode               ');
        Sql.Add('          where codeid =''SK03''                   ');
        Sql.Add('            and codeno = a.nationcd) NATIONCDNAME  ');
        Sql.Add('  FROM PYCCODE a                                   ');
        Sql.Add(' WHERE CODEID = :Lcodeid                           ');
        Sql.Add('   AND CODENO = :Lcodesub                          ');
        Sql.Add('   AND NVL(NATIONCD, '' '') like :lnationcd||''%'' ');
        Parambyname('lcodeid').AsString   := s1;
        Parambyname('lcodesub').AsString  := s2;
        Parambyname('lnationcd').AsString := s3;
        Open;
        Case gubun of
            0 : if trim(FieldByName('CodeName').AsString) = ''  then QcodeDisp := '코드에러'
                else QCodeDisp := FieldByName('CodeName').AsString;
           10 : QCodeDisp := FieldByName('GroupCode').AsString;
           11 : QCodeDisp := FieldByName('GroupCodeName').AsString;
           20 : QCodeDisp := FieldByName('GroupCode2').AsString;
           21 : QCodeDisp := FieldByName('GroupCodeName2').AsString;
           30 : QCodeDisp := FieldByName('NATIONCD').AsString;
           31 : QCodeDisp := FieldByName('NATIONCDNAME').AsString;
        end;
        close;
   end;
end;

{입력받은 데이타를 부서 화일에서 찾아서 해당 필드에 보여준다..}
function TFM_Mainform.QDeptDisp(s1,s2 : String; deptGu : integer) : String;
begin
Try
  with OraQuery1 do
  begin
      Close;
      Sql.Clear;
      Sql.Add('select orgnum,deptcode,(deptname||'' ''||deptna3) deptnm,');
      Sql.Add('       fieldcode,deptna1,deptna2,deptna3,chanmode ');
      Sql.Add('  from pycdept ');
      Sql.Add(' where (deptcode =:ldeptcode and orgnum = :lorg) ');
      Sql.Add('   and (existon = ''1'') ');
      ParamByName('Ldeptcode').AsString  := s1;
      ParamByName('lorg').AsString       := s2;
      Open;
      case deptGu of
       1 :    if trim(FieldByName('deptnm').AsString) = ''  then QdeptDisp := '부서에러'
            else QdeptDisp := FieldByName('deptnm').AsString;
       2 :  QdeptDisp := FieldByName('DEPTNA1').AsString;  {본부명}
       3 :  QdeptDisp := FieldByName('DEPTNA2').AsString;  {부명}
      end;
  end;
EXCEPT ON E : EDataBaseError DO
  MessageBox(DeptForm.handle,StrPcopy(ErrorHelp,E.Message),'에  러',MB_OK or $0010);
END;

end;

procedure TFM_Mainform.s_empnoClick(Sender: TObject);
begin
  s_empno.Text   := '';
  s_korname.Text := '';
end;

procedure TFM_Mainform.setc_empnoClick(Sender: TObject);
begin
  setc_empno.Text   := '';
  setc_korname.Text := '';
end;

procedure TFM_Mainform.setc_empnoKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = Chr(13) then
   begin
      Key := Chr(0);   {소리제겅용}

      FGempno   := setc_empno.Text;
      FGkorname := setc_korname.Text;

      if trim(setc_empno.text)='' then setc_empnoDblClick(setc_korname)
      else setc_empnoDblClick(setc_empno);

      EnterKey  := True;
  end;
end;

procedure TFM_Mainform.tit_empnoKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = Chr(13) then
   begin
      Key := Chr(0);   {소리제겅용}

      FGempno   := tit_empno.Text;
      FGkorname := tit_korname.Text;

      if trim(tit_empno.text)='' then tit_empnoDblClick(tit_korname)
      else tit_empnoDblClick(tit_empno);

      EnterKey  := True;
  end;
end;

procedure TFM_Mainform.dept_empnoKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = Chr(13) then
   begin
      Key := Chr(0);   {소리제겅용}

      FGempno   := dept_empno.Text;
      FGkorname := dept_kname.Text;

      if trim(dept_empno.text)='' then dept_empnoDblClick(dept_kname)
      else dept_empnoDblClick(dept_empno);

      EnterKey  := True;
  end;
end;

end.

