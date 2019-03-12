unit PIA1070B_emp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OnDBGrid, ExtCtrls, StdCtrls, OnFocusButton, Db, Tmax_DataSetText, Tmax_session,
  OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl, OnPopupEdit, Grids,
  DBGrids, OnGrDBGrid;

type
  TFM_empno = class(TForm)
    QR_pimpmas: TTMaxDataSet;
    DataSource1: TDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    BT_Confirm: TOnFocusButton;
    BT_Exit: TOnFocusButton;
    Panel3: TPanel;
    BE_Key: TOnButtonEdit;
    QR_Group: TTMaxDataSet;
    GR_pimpmas: TOnGrDbGrid;
    bt_search: TOnFocusButton;
    procedure BT_ExitClick(Sender: TObject);
    procedure BT_ConfirmClick(Sender: TObject);
    procedure BE_KeyButtonClick(Sender: TObject; ButtonIndex: Integer);
    procedure BE_KeyKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Grid1DblClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GR_pimpmasApplyCellAttribute(Sender: TObject; Field: TField;
      Canvas: TCanvas; Rect: TRect; State: TGridDrawState);
    procedure bt_searchClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Edit         : TOnWinPopupEdit;
    Insa_Session : TTMaxSession;
    FL_Start     : Boolean;
    Search_Click : integer;
    procedure Part_search;
    procedure All_search;
  end;

var
  FM_empno: TFM_empno;

implementation
uses PIA1070B_1;
{$R *.DFM}

procedure TFM_empno.FormCreate(Sender: TObject);
begin
  FL_Start := True;
end;

procedure TFM_empno.FormPaint(Sender: TObject);
begin
  if FL_Start then
    begin
      FL_Start := not FL_Start;
      Application.ProcessMessages;
      if not ((copy(FM_Main.FG_Grade,2,1) <= 'C') or (FM_Main.FG_Group <= 'G002'))  then
      begin
           bt_search.Visible := false;
           Search_click      := 0;
      end
      else
      begin
           bt_search.Visible := true;
           Search_click      := 1;
      end;
      
      Part_search;
    end;
end;

procedure TFM_empno.BE_KeyButtonClick(Sender: TObject; ButtonIndex: Integer);
begin
  if Search_click = 1 then
       All_Search
  else part_Search;
end;

procedure TFM_empno.BT_ExitClick(Sender: TObject);
begin
  Edit.PopupForm.ClosePopup(False);
end;

procedure TFM_empno.BT_ConfirmClick(Sender: TObject);
begin
  Edit.PopupForm.ClosePopup(True);
end;

procedure TFM_empno.BE_KeyKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Edit.PopupForm.ClosePopup(False);

  if Key = VK_RETURN then
    if Sender is TOnDBGrid then
      Grid1DblClick(Sender)
    else
      BE_keyButtonClick(Sender,0);
end;

procedure TFM_empno.Grid1DblClick(Sender: TObject);
begin
  BT_ConfirmClick(Sender);
end;

procedure TFM_empno.GR_pimpmasApplyCellAttribute(Sender: TObject;
  Field: TField; Canvas: TCanvas; Rect: TRect; State: TGridDrawState);
begin
  if QR_pimpmas.FieldByName('pstate').AsString < '80' then
    begin
      Canvas.Font.Style := [];
      Canvas.Font.Color := clBlack;
    end
  else
    begin
      Canvas.Font.Style := [fsStrikeOut];
      Canvas.Font.Color := clBlue;
    end;
end;

procedure TFM_empno.bt_searchClick(Sender: TObject);
begin
  Be_key.Text := '';
  All_Search;
end;                    

procedure TFM_empno.Part_search;
begin
  QR_pimpmas.Session := Insa_Session;
  QR_pimpmas.ServiceName := 'HINSA_pimpmas';

  try
    with QR_pimpmas do
      begin
        Close;
        Sql.Clear;
        SQL.ADD('SELECT A.empno, A.korname, A.paycl, A.payra, A.orgnum, A.deptcode, A.pstate,           ');
        SQL.ADD('       D.codename payraname, C.codename payclname, B.deptname, B.deptna3, B.extcode,   ');
      //SQL.ADD('       Decode(Sign(Pstate-79),1,''2퇴직'',''1재직'') empdate,'' '', '''' juminid, A.Jobdept '); dsa2000 2018.03.13 Pstate 문자값때문에 에러 발생으로 주석처리.
        SQL.ADD('       empdate,'' '', '''' juminid, A.Jobdept                                          ');
        SQL.ADD('  FROM pycdept B, pyccode C, pyccode D, pimpmas A                                      ');//, pzdepth15 z
        SQL.ADD(' WHERE D.codeid(+) = ''I113''     ');
        SQL.ADD('   AND A.payra     = D.codeno(+)  ');
        SQL.ADD('   AND C.codeid(+) = ''I112''     ');
        SQL.ADD('   AND A.paycl     = C.codeno(+)  ');
        SQL.ADD('   AND A.orgnum    = B.orgnum(+)  ');
        SQL.ADD('   AND A.deptcode  = B.deptcode(+)');
        SQL.ADD('   AND ((A.empno LIKE '''+BE_key.Text+ '%'+''') OR (A.korname LIKE '''+BE_key.Text+ '%'+''' ))');

        {2015.08.19.hjku.. 하드코딩 제거..
        if (FM_Main.FG_orgnum = 'H20') and (FM_Main.FG_jobdept = 'G00K0') then  //2015.08.17. 이명노M 요청으로 하드코딩. (애니메이션사업담당)
        begin
             SQL.ADD(' AND (A.jobdept  = '''+FM_Main.FG_jobdept + ''' or      ');
             SQL.ADD('      A.deptcode = '''+FM_Main.FG_jobdept + ''' )       ');
             SQL.ADD(' AND A.payra  >= (select payra from pimpmas where empno =''' + FM_Main.FG_pempno +''' )  ');
             SQL.ADD(' AND A.pstate < ''80''        ');
        end
        else}
        if not ((copy(FM_Main.FG_Grade,2,1) <= 'C') or (FM_Main.FG_Group <= 'G002'))  then
        begin
            {//부문별 선임본부장은 해당부문의 팀장,팀원을 다 볼 수 있도록 추가... jissi
             if  ((FM_Main.FG_jobdept = 'CGC00') or (FM_Main.FG_jobdept = 'FGC00')  or (FM_Main.FG_jobdept = 'IGC00'))
                 and (FM_Main.FFG_payranm = '본부장') then
             begin
               SQL.ADD(' AND A.deptcode  like substr('''+FM_Main.FG_jobdept + ''' ,1,1) || ''%''                 ');
               SQL.ADD(' AND ((A.payra  > (select payra from pimpmas where empno =''' + FM_Main.FG_pempno +''' ))  or   ');
               SQL.ADD('      ((A.payra  = (select payra from pimpmas where empno =''' + FM_Main.FG_pempno +''' )) and  ');
               SQL.ADD('       (a.empno = ''' + FM_Main.FG_pempno +''' )                                         )    ) ');
             end                   }
             {1015.08.19.hjku.. 오류 수정
             SQL.ADD(' AND (A.jobdept  like replace('''+FM_Main.FG_jobdept + ''' ,''0'','''') || ''%'' or      ');
             SQL.ADD('      A.deptcode like replace('''+FM_Main.FG_jobdept + ''' ,''0'','''') || ''%'' )       ');
             }
             SQL.ADD(' AND (A.jobdept  like rtrim('''+FM_Main.FG_jobdept + ''' ,''0'') || ''%'' or      ');
             SQL.ADD('      A.deptcode like rtrim('''+FM_Main.FG_jobdept + ''' ,''0'') || ''%'' )       ');
             SQL.ADD(' AND A.payra  >= (select payra from pimpmas where empno =''' + FM_Main.FG_pempno +''' )  ');
             SQL.ADD(' AND A.pstate < ''80''        ');
        end;
//        else SQL.ADD('   AND A.deptcode  = '''+FM_Main.Ed_dept.Text+'''  ');//FM_Main.ED_dept 값을 조정하면 타부서 조회 가능.

        SQL.ADD(' UNION   ');
        SQL.ADD('SELECT A.empno, A.korname, A.paycl, A.payra, A.orgnum, A.deptcode, A.pstate,           ');
        SQL.ADD('       D.codename payraname, C.codename payclname, B.deptname, B.deptna3, B.extcode,   ');
      //SQL.ADD('       Decode(Sign(Pstate-79),1,''2퇴직'',''1재직'') empdate,'' '', '''' juminid, A.Jobdept '); dsa2000 2018.03.13 Pstate 문자값때문에 에러 발생으로 주석처리.
        SQL.ADD('       empdate,'' '', '''' juminid, A.Jobdept                                          ');
        SQL.ADD('  FROM pycdept B, pyccode C, pyccode D, pimpmas A                                      ');
        SQL.ADD(' WHERE D.codeid(+) = ''I113''     ');
        SQL.ADD('   AND A.payra     = D.codeno(+)  ');
        SQL.ADD('   AND C.codeid(+) = ''I112''     ');
        SQL.ADD('   AND A.paycl     = C.codeno(+)  ');
        SQL.ADD('   AND A.orgnum    = B.orgnum(+)  ');
        SQL.ADD('   AND A.deptcode  = B.deptcode(+)');
        SQL.ADD('   AND ((A.empno LIKE '''+BE_key.Text+ '%'+''') OR (A.korname LIKE '''+BE_key.Text+ '%'+''' ))');
        SQL.ADD('   AND A.jobdept in ( select addeptcode                                                ');
        SQL.ADD('                        from ( select orgnum,addeptcode                                ');
        SQL.ADD('                                 from pihanno                                          ');
        SQL.ADD('                             	where empno = '''+ FM_Main.FG_pempno + '''         ');
        SQL.ADD('                                  and ancode in (''233'',''243'')                      ');
        SQL.ADD('                                  and orgnum =  (select value1 from pimvari where gubun = ''00'' and sgubun = ''0001'' )    ');
        SQL.ADD('                            	minus                                              ');
        SQL.ADD('                               select orgnum,addeptcode                                ');
        SQL.ADD('                                 from pihanno                                          ');
        SQL.ADD('                                where empno = '''+ FM_Main.FG_pempno + '''             ');
        SQL.ADD('                                  and ancode in (''238'',''248'')                      ');
        SQL.ADD('                                  and orgnum =  (select value1 from pimvari where gubun = ''00'' and sgubun = ''0001'' )) ) ');

        if not ((copy(FM_Main.FG_Grade,2,1) <= 'C') or (FM_Main.FG_Group <= 'G002')) then
        begin
             SQL.ADD('      AND A.pstate    < ''80''  ');
        end;

        {if (FM_Main.SFrrabasdate <= FM_Main.FG_DATE) and (FM_Main.FG_DATE <= FM_Main.STorabasdate) then
        begin
           SQL.ADD('   UNION   ');
           SQL.ADD('   SELECT A.empno, A.korname, A.paycl, A.payra, A.orgnum, A.deptcode, A.pstate,           ');
           SQL.ADD('          D.codename payraname, C.codename payclname, B.deptname, B.deptna3, B.extcode,   ');
           SQL.ADD('    case when a.pstate < ''80'' then ''재직'' else ''퇴사'' end empdate,'' '','''','' '' ');
           SQL.ADD('     FROM pycdept B, pyccode C, pyccode D, pehremas A                                     ');
           SQL.ADD('    WHERE D.codeid(+) = ''I113''     ');
           SQL.ADD('      AND A.payra     = D.codeno(+)  ');
           SQL.ADD('      AND C.codeid(+) = ''I112''     ');
           SQL.ADD('      AND A.paycl     = C.codeno(+)  ');
           SQL.ADD('      AND A.orgnum    = B.orgnum(+)  ');
           SQL.ADD('      AND A.deptcode  = B.deptcode(+)');
           SQL.ADD('      AND A.pstate    < ''80''       ');
           SQL.ADD('      AND ((A.empno    LIKE '''+BE_key.Text + '%'+''')  OR ( A.korname  LIKE  '''+BE_key.Text + '%'+''' )) ');
           SQL.ADD('      AND A.rabasdate = '''+ FM_Main.Srabasdate +'''     ');
           SQL.ADD('      AND ((A.e1empno = '''+ FM_Main.FG_pempno +''') Or (A.e2empno   = '''+ FM_Main.FG_pempno +'''))       ');
        end;}

        //SQL.ADD(' Order By 13, Jobdept, Payra, Empno   '); //재직자-근무부서-직책-사번.
        SQL.ADD(' Order By pstate, Jobdept, Payra, Empno   '); //재직자-근무부서-직책-사번.
        //memo1.text := Sql.Text;
        Open;

      end;
  except
    QR_pimpmas.Close;
  end;
end;

procedure TFM_empno.All_Search;
begin
  QR_pimpmas.Session := Insa_Session;
  QR_pimpmas.ServiceName := 'HINSA_pimpmas';

  try
    with QR_pimpmas do
      begin
        Close;
        Sql.Clear;
        SQL.ADD('SELECT A.empno, A.korname, A.paycl, A.payra, A.orgnum, A.deptcode, A.pstate,               ');
        SQL.ADD('       D.codename payraname, C.codename payclname, B.deptname, B.deptna3, B.extcode,       ');
      //SQL.ADD('       Decode(Sign(Pstate-79),1,''2퇴직'',''1재직'') empdate,'' '', '''' juminid, Jobdept  '); dsa2000 2018.03.13 Pstate 문자값때문에 에러 발생으로 주석처리.
        SQL.ADD('       empdate, '' '', '''' juminid, Jobdept                                               ');
        SQL.ADD('  FROM pycdept B, pyccode C, pyccode D, pimpmas A                                          ');
        SQL.ADD(' WHERE D.codeid(+) = ''I113''                                                              ');
        SQL.ADD('   AND A.payra     = D.codeno(+)                                                           ');
        SQL.ADD('   AND C.codeid(+) = ''I112''                                                              ');
        SQL.ADD('   AND A.paycl     = C.codeno(+)                                                           ');
        SQL.ADD('   AND A.orgnum    = B.orgnum(+)                                                           ');
        SQL.ADD('   AND A.deptcode  = B.deptcode(+)                                                         ');
        SQL.ADD('   AND ((A.empno LIKE '''+BE_key.Text+ '%'+''') OR (A.korname LIKE '''+BE_key.Text+ '%'+''' ))');

        if not ((copy(FM_Main.FG_Grade,2,1) <= 'C') or (FM_Main.FG_Group <= 'G002'))  then
        begin
             SQL.ADD('   AND A.pstate   < ''80''        ');
             {1015.08.19.hjku.. 오류 수정
             SQL.ADD('   AND (A.jobdept  like replace('''+FM_Main.FG_jobdept + ''' ,''0'','''') || ''%'' or    ');
             SQL.ADD('        A.deptcode like replace('''+FM_Main.FG_jobdept + ''' ,''0'','''') || ''%'' )     ');             }
             SQL.ADD(' AND (A.jobdept  like rtrim('''+FM_Main.FG_jobdept + ''' ,''0'') || ''%'' or      ');
             SQL.ADD('      A.deptcode like rtrim('''+FM_Main.FG_jobdept + ''' ,''0'') || ''%'' )       ');
             SQL.ADD('   AND A.payra    >= (select payra from pimpmas where empno =''' + FM_Main.FG_pempno +''' )');
             SQL.ADD('   AND A.paycl    >= (select paycl from pimpmas where empno =''' + FM_Main.FG_pempno +''' )');
        end;

        SQL.ADD('   UNION   ');
        SQL.ADD('SELECT A.empno, A.korname, A.paycl, A.payra, A.orgnum, A.deptcode, A.pstate,               ');
        SQL.ADD('       D.codename payraname, C.codename payclname, B.deptname, B.deptna3, B.extcode,       ');
      //SQL.ADD('       Decode(Sign(Pstate-79),1,''2퇴직'',''1재직'') empdate,'' '', '''' juminid, Jobdept  '); dsa2000 2018.03.13 Pstate 문자값때문에 에러 발생으로 주석처리.
        SQL.ADD('       empdate, '' '', '''' juminid, Jobdept                                               ');
        SQL.ADD('  FROM pycdept B, pyccode C, pyccode D, pimpmas A                                          ');
        SQL.ADD(' WHERE D.codeid(+) = ''I113''                                                              ');
        SQL.ADD('   AND A.payra     = D.codeno(+)                                                           ');
        SQL.ADD('   AND C.codeid(+) = ''I112''                                                              ');
        SQL.ADD('   AND A.paycl     = C.codeno(+)                                                           ');
        SQL.ADD('   AND A.orgnum    = B.orgnum(+)                                                           ');
        SQL.ADD('   AND A.deptcode  = B.deptcode(+)                                                         ');
        SQL.ADD('   AND ((A.empno LIKE '''+BE_key.Text+ '%'+''') OR (A.korname LIKE '''+BE_key.Text+ '%'+''' ))');
        SQL.ADD('   AND A.jobdept in (select addeptcode                                                     ');
        SQL.ADD('                      from ( select orgnum,addeptcode                                      ');//*
        SQL.ADD('                               from pihanno                                                ');
        SQL.ADD('                              where empno = '''+ FM_Main.FG_pempno + '''                   ');
        SQL.ADD('                                and ancode in (''233'',''243'')                            ');
        SQL.ADD('                                and orgnum =(select value1 from pimvari where gubun = ''00'' and sgubun = ''0001'' )    ');
        SQL.ADD('                              minus                                                        ');
        SQL.ADD('                             select orgnum,addeptcode                                      ');//*
        SQL.ADD('                               from pihanno                                                ');
        SQL.ADD('                              where empno = '''+ FM_Main.FG_pempno  + '''                  ');
        SQL.ADD('                                and ancode in (''238'',''248'')                            ');
        SQL.ADD('                                and orgnum =(select value1 from pimvari where gubun = ''00'' and sgubun = ''0001'' )) ) ');

        if not ((copy(FM_Main.FG_Grade,2,1) <= 'C') or (FM_Main.FG_Group <= 'G002')) then
        begin
             SQL.ADD('      AND A.pstate    < ''80''                                                        ');
        end;
        //SQL.ADD(' Order By 13, Jobdept, Payra, Empno   '); //재직자-근무부서-직책-사번.        
        SQL.ADD(' Order By Pstate, Jobdept, Payra, Empno ');       //  edit1.text := sql.text;
        Open;

      end;
  except
    QR_pimpmas.Close;
  end;
end;

end.


