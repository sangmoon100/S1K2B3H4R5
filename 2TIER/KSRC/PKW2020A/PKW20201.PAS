{------------------------------------------------------------------------------- PROGRAM NAME : 근태결재자겸직부서등록(PKW2020A.EXE) AUTHOR       : 유효성 DATE         : 2002. 04. 01 COMMENT      : 결재권자가 정규직과 달라짐에 따라 기존 정규직에서 분리                ONLY 일반직,단기계약직용
 // 부서구분   1. 겸직부서
               2. 실근무인사부서
 겸직부서등록을 한후 등록프로그램을 마칠때 모든 사원의 실근무인사부서을 지운후 다시 입력한다.-------------------------------------------------------------------------------}
unit pkw20201;
interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,  StdCtrls, ExtCtrls, DB, DBTables, Buttons, Mask, Grids, DBGrids,ComCtrls, Tabnotbk,  calen1, kdept1, KeyEmpno, userhelp, MemDS, DBAccess, Ora, Func, DeptCode;//pass,
type
  TF_pkw20201 = class(TForm)    Panel2: TPanel;    L_name: TLabel;    L_curdate: TLabel;    Panel1: TPanel;    P_help: TPanel;    Panel40: TPanel;    BB_new: TBitBtn;    BB_del: TBitBtn;    BBclose: TBitBtn;    BB_save: TBitBtn;    BBcncl: TBitBtn;    DataSource2: TDataSource;    Panel10: TPanel;    Bevel2: TBevel;    Label1: TLabel;    DBGrid: TDBGrid;    Panel16: TPanel;    p_DeptName: TPanel;    Panel35: TPanel;    ME_empno: TMaskEdit;    B_empno: TButton;    Panel15: TPanel;    RG_sort: TRadioGroup;    Panel4: TPanel;    me_jobfrdate: TMaskEdit;    Button1: TButton;    me_jobtodate: TMaskEdit;    Button2: TButton;    me_deptcode: TMaskEdit;    b_deptcode: TButton;    me_orgnum: TMaskEdit;    p_korname: TPanel;    Panel3: TPanel;    Q_GRID2: TOraQuery;    Q_GRID2EMPNO: TStringField;    Q_GRID2KORNAME: TStringField;    Q_GRID2JOBFRDATE: TStringField;    Q_GRID2JOBTODATE: TStringField;    Q_GRID2DEPTCODE: TStringField;    Q_GRID2ORGNUM: TStringField;    Q_GRID2DEPTNAME: TStringField;    Qry1: TOraQuery;    procedure BB_newClick(Sender: TObject);    procedure BB_delClick(Sender: TObject);    procedure BBcloseClick(Sender: TObject);    procedure FormClose(Sender: TObject; var Action: TCloseAction);    procedure FormActivate(Sender: TObject);    procedure FormCreate(Sender: TObject);    procedure FormHide(Sender: TObject);    procedure BB_saveClick(Sender: TObject);    procedure BBcnclClick(Sender: TObject);    procedure DataSource2DataChange(Sender: TObject; Field: TField);    procedure B_empnoClick(Sender: TObject);    procedure TabbedNotebook1Change(Sender: TObject; NewTab: Integer;      var AllowChange: Boolean);    procedure RG_sortClick(Sender: TObject);    procedure ME_empnoKeyDown(Sender: TObject; var Key: Word;      Shift: TShiftState);    procedure ME_empnoExit(Sender: TObject);    procedure b_deptcodeClick(Sender: TObject);    procedure Button1Click(Sender: TObject);    procedure Button2Click(Sender: TObject);    procedure DBGridDblClick(Sender: TObject);    procedure me_deptcodeKeyDown(Sender: TObject; var Key: Word;      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  GSsysdate : String[15];    //Host Date
  sql_flag  : char;  act_flag  : boolean;  offset    : integer;  procedure DisplayInit;  procedure tbl_insert;  procedure tbl_update;  procedure setup;  procedure GetSysTime;  procedure Getcode(arg_data,dataval:string;me :Tmaskedit;lpan:Tobject);  procedure GetGridFocus2(arg_empno:string);
  procedure GetGridData2;
  procedure Get_korname(arg_txt :string);        {사번  화면}
  procedure Get_empnodata(clss :integer);
  procedure Get_deptname;
  function  Indata(arg_empno,arg_orgnum,arg_deptcode:string):boolean;
  procedure tbl_ins_jobAll;

  end;


var  F_pkw20201: TF_pkw20201;

const separator = '-';
implementation
{$R *.DFM}
procedure TF_pkw20201.BB_newClick(Sender: TObject);begin    ME_empNO.Text     := '' ;
    DisplayInit;
    ME_orgnum.enabled   := True;
    Me_deptcode.enabled := True;

    ME_orgnum.color     := clWhite;    Me_deptcode.color   := clWhite;

    b_deptcode.enabled  := True;
    sql_flag          := 'I';    p_help.caption    := '';
    ME_empNO.Setfocus;
end;

procedure TF_pkw20201.DisplayInit;begin
    p_korname.caption    := '';
    ME_orgnum.text       := '';
    Me_deptcode.text     := '';
    p_DeptName.caption   := '';
    //ME_jobfrdate.text    := '';
    ME_jobtodate.text    := '';

    me_jobfrdate.Text := Copy(GSsysdate,1,8);    //me_jobTodate.Text := Copy(GSsysdate,1,8);  ??
end;
{****************************************}procedure TF_pkw20201.tbl_insert;
var Tem :String;
begin
   if (me_empno.text = '')  then
   begin
        Application.MessageBox('사번,성명은 필수입력항목입니다. 필수입력항목을 입력하세요',
                               '작업안내', mb_ok+MB_ICONWARNING);
        exit;    end;
   if (me_orgnum.text = '') or (Me_deptcode.text ='')  then   begin
        Application.MessageBox('조직차수,부서코드은 필수입력항목입니다. 필수입력항목을 입력하세요',
                               '작업안내', mb_ok+MB_ICONWARNING);
        exit;   end;
   if Indata(me_empno.text,me_orgnum.Text,Me_deptcode.Text) = False then        exit;

   Tem := FORMAT(
           ' INSERT INTO  PKCOTMANIL          ' +
           ' ( EMPNO,     KORNAME,          ' +
           '   ORGNUM,    DEPTCODE,         ' +
           '   JOBFRDATE, JOBTODATE,        ' +
           '   WRITETIME,                   ' +
           '   WRITEMAN , JOBKIND           ) ' +
           ' VALUES (''%s'', ''%s'', '+
           '         ''%s'', ''%s'', '+
           '         ''%s'', ''%s'', '+
           '         To_char(SYSDATE,''YYYYMMDDHH24MISS''),''%s'' ,''1'')  ',
           [ me_empno.Text,     p_korname.caption,
             me_orgnum.Text,    me_deptcode.Text,
             me_jobfrdate.Text ,me_jobtodate.Text,
             Pempno ]);

    with qry1 do    begin
        close;
        sql.clear;
        sql.add(Tem);
        TRY
        Execsql;
        EXCEPT ON E:EDATABASEERROR DO
            begin
              Application.Messagebox('입력시 오류가 발생했습니다.','입력오류',mb_ok+MB_ICONERROR );
              Sql_flag := 'N';
              exit;
            end;
        end;
    end;
    qry1.close;
    GetGridFocus2(me_empno.text);
    GetGridData2;
    Q_GRID2.moveby(offset);

    Sql_flag          := 'U';
    p_help.caption    := ' 입력작업이 성공적으로 종료되었습니다.';
end;

//겸직자의 실근무부서를  일괄 등록procedure TF_pkw20201.tbl_ins_jobAll;
var Tem :String;
begin
    //등록된 사람의 실인사부서를 지웁니다. 랄라라
    Tem := ' DELETE PKCOTMANIL WHERE JOBKIND =''2''           ';
    with qry1 do
    begin
        close;
        sql.clear;
        sql.add(Tem);
        Execsql;
    end;

    //등록된 사람의 실인사부서를 왕창 입력합니다. 왜??? 피곤하니까 랄라라    Tem := Format(
           ' INSERT INTO  PKCOTMANIL                          '+
           ' ( EMPNO,     KORNAME,  ORGNUM,    DEPTCODE,    '+
           '   JOBFRDATE, JOBTODATE,                        '+
           '   WRITETIME, WRITEMAN , JOBKIND )              '+
           ' SELECT EMPNO,KORNAME, ORGNUM, JOBDEPT,         '+
           '        ''19980301'',NULL,                      '+
           '        To_char(SYSDATE,''YYYYMMDDHH24MISS''),  '+
           '        ''%s'',''2''                            '+
           ' FROM   PIMPMAS                                 '+
           ' WHERE  EMPNO IN (SELECT EMPNO FROM PKCOTMANIL    '+
           '                   GROUP BY EMPNO     )         ',
           [ Pempno ]);

    with qry1 do    begin
        close;
        sql.clear;
        sql.add(Tem);
        Execsql;
    end;
end;

procedure TF_pkw20201.tbl_UPDATE;var Tem :String;
begin
    Tem := FORMAT(
           ' UPDATE     PKCOTMANIL            ' +
           ' SET        JOBFRDATE =''%s'',  ' +
           '            JOBTODATE =''%s'',  ' +
           '            WRITETIME =TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS''), '+
           '            WRITEMAN  =''%s''    ' +
           '  where empno     = ''%s''   '+
           '  and   orgnum    = ''%s''   '+
           '  and   deptcode  = ''%s''   ',
           [ me_jobfrdate.Text ,me_jobtodate.Text,
             Pempno,           Me_empNO.Text,
             Me_orgnum.Text,    Me_deptcode.Text     ]);

    if (me_empno.text ='')  OR (Me_orgnum.Text='') OR  (Me_deptcode.Text='')  then    begin
        Application.MessageBox('수정자료를 선택하세요.',
                       '작업안내', mb_ok+MB_ICONWARNING);
        exit;
    end;

    with qry1 do    begin
        close;
        sql.clear;
        sql.add(Tem);
        TRY
        Execsql;
        EXCEPT ON E:EDATABASEERROR DO
            begin
              Application.Messagebox('수정시 오류가 발생했습니다.','작업안내',mb_ok+MB_ICONERROR );
              Sql_flag := 'N';
              exit;
            end;
        end;
    end;
    qry1.close;
    GetGridFocus2(me_empno.text);
    GetGridData2;
    Q_GRID2.moveby(offset);

    Sql_flag          := 'U';    p_help.caption    := ' 수정작업이 성공적으로 종료되었습니다.';
end;

{*******************************  기타코드 화면     ***************************}procedure TF_pkw20201.Getcode(arg_data,dataval:string;me :Tmaskedit;lpan:Tobject);
begin

end;
{=========================================================================                            프로그램 초기화 작업
==========================================================================}
procedure TF_pkw20201.SetUp;
begin     P_Help.Caption := '   급여시스템에 접속 중입니다...';
     OraConnect;

     {사용권한 확인   ***************}     if (copy(PGrade,2,1) >= 'D') AND (copy(PGrade,3,1) >= 'D') then
     begin         Application.MessageBox('귀하는 이 작업에 대한 수행권한이 없습니다.',                                '작업안내',mb_ok+mb_iconstop);         application.terminate;         exit;     end;
     act_flag        := False;     sql_flag        := 'N';     RG_sort.Itemindex := 0;     GetGridData2;     GetSysTime;     L_name.Caption := Pkorname + '(' + Pempno + ')';
     L_Curdate.Caption := fn_GetDateStr;
     P_Help.Caption := '';end;
procedure TF_pkw20201.BB_delClick(Sender: TObject);var
    tem_str :string;
begin
    if (me_empno.text ='')  OR (Me_orgnum.Text='') OR ( Me_deptcode.Text='')  then
    begin
        Application.MessageBox('삭제할 자료를 선택하세요.',
                       '작업안내', mb_ok+MB_ICONWARNING);
        exit;
    end;

    if Application.MessageBox('현재 자료를 삭제하겠습니까 ?',                       '작업안내', mb_YesNo+MB_ICONWARNING) = IDNo then exit;

    Tem_str :=
        format(' delete pkcotmanIL             '+
               '  where empno     = ''%s''   '+
               '  and   orgnum    = ''%s''   '+
               '  and   deptcode  = ''%s''   ',
              [Me_empNO.Text,
               Me_orgnum.Text,
               Me_deptcode.Text]);

    with qry1 do    begin
        close;
        sql.clear;
        sql.add(TEM_STR);
        TRY
        Execsql;
        EXCEPT ON E:EDATABASEERROR DO
            begin
              Application.Messagebox('삭제시 오류가 발생했습니다.','삭제오류',mb_ok+MB_ICONERROR );
              Sql_flag := 'N';
              exit;
            end;
        end;
    end;
    qry1.close;

    GetGridData2;//    DBGridDblClick(DBGrid);

    p_help.caption := ' 삭제작업이 성공적으로 종료되었습니다.';end;

procedure TF_pkw20201.BBcloseClick(Sender: TObject);begin
    tbl_ins_jobAll;
    close;
end;

procedure TF_pkw20201.FormClose(Sender: TObject; var Action: TCloseAction);begin
  if Application.MessageBox('작업을 종료하시겠습니까?',
                            '작업안내', mb_YesNo+MB_ICONWARNING) = IDYES  then
  begin
        Action := caFree;
  end
  else  Action := caNone;
end;

procedure TF_pkw20201.GetGridData2;var
     tem : string;
begin
     Tem := ' SELECT A.*,DEPTNAME FROM PKCOTMANIL A,PYCDEPT B  '  +
            ' WHERE  A.ORGNUM   = B.ORGNUM    '+
            ' AND    A.DEPTCODE = B.DEPTCODE  '+
            ' AND    A.JOBKIND =''1'' ';

     case RG_sort.Itemindex of         0 :   tem := tem + ' ORDER BY  EMPNO ';
         1 :   tem := tem + ' ORDER BY  A.DEPTCODE ';
     end;

     with Q_GRID2 do
     begin
          Close;
          SQL.Clear;
          SQL.ADD(tem);
          Open;
          if Q_GRID2.recordcount > 0 then
          begin
             sql_flag := 'U';
             ME_orgnum.enabled   := False;
             Me_deptcode.enabled := False;
             b_deptcode.enabled  := False;
             ME_orgnum.color     := $00D5EFFD;
             Me_deptcode.color   := $00D5EFFD;
          end;
     end;
end;

procedure TF_pkw20201.GetSysTime;begin
     with Qry1 do
     begin
          Close;
          SQL.Clear;
          SQL.ADD(' SELECT TO_CHAR(SYSDATE,''YYYYMMDDHH24MISSD'') D ');
          SQL.ADD('   FROM DUAL ');
          Open;
          GSsysdate := FieldByName('D').AsString;
          close;
     end;
end;

procedure TF_pkw20201.FormActivate(Sender: TObject);begin
    if Act_flag then
    begin
        setup;
    end;
end;

procedure TF_pkw20201.FormCreate(Sender: TObject);begin
    act_flag := True;
end;

procedure TF_pkw20201.FormHide(Sender: TObject);begin
   q_grid2.close;
end;

procedure TF_pkw20201.BB_saveClick(Sender: TObject);begin
    case sql_flag of
    'I':  tbl_insert;
    'U':  tbl_update;
    end;
end;

procedure TF_pkw20201.BBcnclClick(Sender: TObject);begin
    GetGridData2;
end;

procedure TF_pkw20201.DataSource2DataChange(Sender: TObject;  Field: TField);
var tem :string;
begin
    with q_grid2 do
    begin
        if Recordcount > 0 then
        begin
            sql_flag := 'U';
            ME_empno.text      := q_grid2.Fieldbyname('empno').AsString;
            p_korname.caption  := q_grid2.Fieldbyname('korname').AsString;
            Me_jobfrdate.text  := q_grid2.Fieldbyname('jobfrdate').AsString;
            Me_jobtodate.text  := q_grid2.Fieldbyname('jobtodate').AsString;
            me_orgnum.Text     := q_grid2.Fieldbyname('orgnum').AsString;
            me_deptcode.Text   := q_grid2.Fieldbyname('deptcode').AsString;
            P_deptname.Caption := ' '+q_grid2.Fieldbyname('deptNAME').AsString;
        end
        else sql_flag := 'N';
    end;

{        me_empno.text      := Fieldbyname('empno').AsString;        e_korname.text     := Fieldbyname('korname').AsString;
        Me_orgnum.text     := Fieldbyname('orgnum').AsString;
        Me_deptcode.text   := Fieldbyname('deptcode').AsString;
        Me_jobfrdate.text  := Fieldbyname('jobfrdate').AsString;
        Me_jobtodate.text  := Fieldbyname('jobtodate').AsString;
        p_DeptName.caption := Fieldbyname('deptname').AsString;
        if Recordcount > 0 then sql_flag := 'U'
        else sql_flag := 'N';
    end;}
end;

procedure TF_pkw20201.B_empnoClick(Sender: TObject);begin
    Get_korname(ME_empno.Text);
end;

procedure TF_pkw20201.Get_Deptname;var
    Tem :String;
begin
    Tem := Format(
           ' SELECT DEPTNAME FROM PYCDEPT  '+
           ' WHERE  ORGNUM   = ''%s''      '+
           ' AND    DEPTCODE = ''%s''      ',
           [ME_orgnum.Text ,Me_Deptcode.Text]);

    with qry1 do    begin
        close;
        sql.clear;
        sql.add(Tem);
        open;
        p_deptname.caption := ' '+fieldbyname('DEPTNAME').AsString;
        close;
    end;
end;

procedure TF_pkw20201.Get_korname(arg_txt :string);begin
    arg_txt := '';
    FKeyEmpno := TFKeyEmpno.Create(Self);

    Try
        FKeyEmpno.v_Table_Name     := 'pimPmas';
        FKeyEmpno.Edempno.Text :=  arg_txt;
        FKeyEmpno.ShowModal;
        If FKeyEmpno.CloseChk = 0 then
        begin
            ME_empno.Text    := FKeyEmpno.v_KeyEmpno;
            p_korname.caption:= FKeyEmpno.v_KeyKorname;
            ME_ORGNUM.Text   := FKeyEmpno.v_KeyOrgnum;
            ME_DEPTCODE.Text := FKeyEmpno.v_KeyDeptcode;
            Get_Deptname;
        end;
    Finally
        FKeyEmpno.Free;
    end;
end;

procedure TF_pkw20201.Get_empnodata(clss :integer);var
     tem_str,tem :string;
begin
     case clss of
     0 :   //사번으로
          tem_str := format(' WHERE  A.EMPNO    =''%s''  ',[me_empno.text]);
     1 :   //성명으로
          tem_str := format(' WHERE  A.KORNAME  =''%s''  ',[p_KORNAME.caption]);
     end;

     if sql_flag <> 'I' then
     begin
         with qry1 do
         begin
          Close;
          SQL.Clear;
          SQL.ADD(' SELECT A.EMPNO,     A.KORNAME,                     ');
          SQL.ADD('        A.DEPTCODE,  A.ORGNUM,  B.DEPTNAME           ');
          SQL.ADD(' FROM   PKCOTMANIL A,  PYCDEPT B                      ');
          SQL.ADD(tem_str);
          SQL.ADD(' AND    A.DEPTCODE = B.DEPTCODE                     ');
          SQL.ADD(' AND    A.ORGNUM   = B.ORGNUM                       ');
          Open;

          if Recordcount = 1 then          begin
              qry1.close;
              sql_flag :='N';
              Exit;
          end;
         end;
     end;

    with qry1 do    begin
        close;
        sql.clear;
        sql.add(' SELECT A.EMPNO, A.KORNAME, A.ORGNUM,A.DEPTCODE, B.DEPTNAME  ');
        sql.add(' FROM   PKMPMAS A,   PYCDEPT B                          ');
        SQL.ADD(tem_str);
        sql.add(' AND    A.ORGNUM   = B.ORGNUM                           ');
        sql.add(' AND    A.DEPTCODE = B.DEPTCODE                         ');
        open;

        if Recordcount = 0 then  Exit;
        ME_empno.text      := Fieldbyname('empno').AsString;
        p_korname.caption  := Fieldbyname('korname').AsString;
        me_orgnum.Text     := Fieldbyname('orgnum').AsString;
        me_deptcode.Text   := Fieldbyname('deptcode').AsString;
        P_deptname.Caption := ' '+Fieldbyname('deptNAME').AsString;

        close;    end;
end;

procedure TF_pkw20201.TabbedNotebook1Change(Sender: TObject;  NewTab: Integer; var AllowChange: Boolean);
begin
    p_help.caption := '';
end;

procedure TF_pkw20201.RG_sortClick(Sender: TObject);begin
    GetGridData2;
end;

procedure TF_pkw20201.ME_empnoKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
begin
    if (key = vk_Return) then
    begin
        if (length(ME_empno.text) = 4) and (sql_flag = 'I')  then
        begin
         Get_empnodata(0);
         Exit;
        end;

        //if  (sql_flag ='I')  then Exit;        GetGridFocus2(me_empno.text);
        GetGridData2;
        Q_GRID2.moveby(offset);
//        DBGridDblClick(Q_GRID2);
    END;
end;

procedure TF_pkw20201.ME_empnoExit(Sender: TObject);begin
{    if (length(ME_empno.text) = 4) and (sql_flag ='I')  then
    begin
     Get_empnodata(0);
     Exit;
    end;}
    if  (sql_flag ='I')  then Exit;

    GetGridFocus2(me_empno.text);    GetGridData2;
    Q_GRID2.moveby(offset);
end;

procedure TF_pkw20201.GetGridfocus2(arg_empno :string);var
    tem:string;
begin
     case RG_sort.Itemindex of
         0 :   tem := ' ORDER BY  A.EMPNO ';
         1 :   tem := ' ORDER BY  A.DEPTCODE ';
     end;

     with Qry1 do     begin
          Close;
          SQL.Clear;
          SQL.ADD(' SELECT A.EMPNO,    A.KORNAME, A.JOBFRDATE, A.JOBTODATE, ');
          SQL.ADD('        A.DEPTCODE, A.ORGNUM,  C.DEPTNAME                ');
          SQL.ADD(' FROM   PKCOTMANIL A, PYCDEPT C                            ');
          SQL.ADD(' WHERE  A.DEPTCODE = C.DEPTCODE                          ');
          SQL.ADD(' AND    A.ORGNUM   = C.ORGNUM                            ');
          SQL.ADD(tem);
          Open;

          offset := 0;          while  NOT Qry1.EOF do
          begin
             if ( arg_empno = fieldbyname('empno').AsString) then
                 exit;
             next;
             inc(offset);
          end;
     end;
     Qry1.Close;
end;

function  TF_pkw20201.Indata(arg_empno,arg_orgnum,arg_deptcode:string):boolean;var
    tem_str :string;
begin
    tem_str := format(' SELECT EMPNO  FROM PKCOTMANIL   '+
                      '  WHERE EMPNO    =''%s''       '+
                      '  AND   ORGNUM   =''%s''       '+
                      '  AND   DEPTCODE =''%s''       ',
                      [arg_empno,arg_orgnum,arg_deptcode]);

    with qry1 do    begin
        close;
        sql.clear;
        sql.add(tem_str);
        open;
        if Recordcount = 0 then result := true
        else
        begin
            Application.MessageBox('이미 저장된 자료입니다.',
                       '작업안내', mb_ok+mb_ICONWARNING);
            result := false;
        end;

        close;    end;
end;

procedure TF_pkw20201.b_deptcodeClick(Sender: TObject);begin
     Try
          FDeptCode := TFDeptCode.Create(Self);
          FDeptCode.edOrgNum.Text := ME_OrgNum.Text;
          FDeptCode.EdDeptcode.Text := ME_DeptCode.Text;
          FDeptCode.ShowModal;
          if FDeptCode.CloseChk <> -1 then          begin               ME_orgnum.Text      := FDeptCode.GSorgnum;
               ME_DeptCode.Text    := FDeptCode.GSdeptcode;
               p_DeptName.caption  := ' '+FDeptCode.GSdeptname;
          end;
     Finally         FDeptCode.Free;
     end;
end;

procedure TF_pkw20201.Button1Click(Sender: TObject);begin
     Try
     Calendar := TCalendar.Create(Self);
     Calendar.ShowModal;
     ME_JobFrDate.Text := Calendar.DayCaption;
     Finally
     Calendar.Free;
     End;
end;

procedure TF_pkw20201.Button2Click(Sender: TObject);begin
     Try
     Calendar := TCalendar.Create(Self);
     Calendar.ShowModal;
     ME_JobToDate.Text := Calendar.DayCaption;
     Finally
     Calendar.Free;
     End;
end;

procedure TF_pkw20201.DBGridDblClick(Sender: TObject);begin
{    if sql_flag ='U' then
    begin
       ME_empno.text      := q_grid2.Fieldbyname('empno').AsString;
       p_korname.caption  := q_grid2.Fieldbyname('korname').AsString;
       Me_jobfrdate.text  := q_grid2.Fieldbyname('jobfrdate').AsString;
       Me_jobtodate.text  := q_grid2.Fieldbyname('jobtodate').AsString;
       me_orgnum.Text     := q_grid2.Fieldbyname('orgnum').AsString;
       me_deptcode.Text   := q_grid2.Fieldbyname('deptcode').AsString;
       P_deptname.Caption := ' '+q_grid2.Fieldbyname('deptNAME').AsString;
    end;}
end;

procedure TF_pkw20201.me_deptcodeKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
begin
    if key = vk_return then
        Get_Deptname;
end;

end.


