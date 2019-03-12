unit PIA1070B_4;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Tmax_DataSetText, OnDBGrid, OnLineLabel, ExtCtrls, Tmax_session, OnInsaCommon,
  StdCtrls, OnFocusButton;

type
  TFM_SubForm3 = class(TForm)
    PA_Work1: TPanel;
    Shape6: TShape;
    LA_Title: TOnSectionLabel;
    Grid1: TOnDBGrid;
    QR_qry: TTMaxDataSet;
    DataSource1: TDataSource;
    Shape3: TShape;
    Shape2: TShape;
    Shape1: TShape;
    Label1: TLabel;
    Grid2: TOnDBGrid;
    Grid3: TOnDBGrid;
    Grid4: TOnDBGrid;
    Grid5: TOnDBGrid;
    Grid6: TOnDBGrid;
    BT_Input: TOnFocusButton;
    procedure BT_InputClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Insa_Session : TTMaxSession;
    FG_Gubun     : String;
    procedure PL_InitForm;
    procedure PL_Select_Data;
  end;

var
  FM_SubForm3: TFM_SubForm3;

implementation

uses PIA1070B_1, PIA1070B_4_1, PIA1070B_4_4;

{$R *.DFM}

procedure TFM_SubForm3.PL_InitForm;
begin
  QR_qry.Session   := Insa_Session;

  Grid1.Left       := 2;
  Grid2.Left       := 2;
  Grid3.Left       := 2;
  Grid4.Left       := 2;
  Grid5.Left       := 2;
  Grid6.Left       := 2;
  Grid1.Top        := 23;
  Grid2.Top        := 23;
  Grid3.Top        := 23;
  Grid4.Top        := 23;
  Grid5.Top        := 23;
  Grid6.Top        := 23;
  LA_Title.Caption := '= '+FG_Gubun+' =';

  Grid1.Visible    := False;
  Grid2.Visible    := False;
  Grid3.Visible    := False;
  Grid4.Visible    := False;
  Grid5.Visible    := False;
  Grid6.Visible    := False;
  if FG_Gubun = '학력사항' then
    begin
      QR_qry.ServiceName := 'PIA1070B_sel3';
      Grid1.Visible := True;
    end;
  if FG_Gubun = '비정규 학력사항' then
    begin
      QR_qry.ServiceName := 'PIA1070B_sel4';
      Grid2.Visible := True;
    end;
  if FG_Gubun = '자격사항' then
    begin
      QR_qry.ServiceName := 'PIA1070B_sel5';
      Grid3.Visible := True;
    end;
  if FG_Gubun = '경력사항' then
    begin
      QR_qry.ServiceName := 'PIA1070B_sel6';
      Grid4.Visible := True;
    end;
  if FG_Gubun = '산휴병가사항' then
    begin
      QR_qry.ServiceName := 'PIA1070B_sel7';
      Grid5.Visible := True;
    end;
  if FG_Gubun = '인사평가사항' then
    begin
      QR_qry.ServiceName := 'PIA1070B_sel8';
      Grid6.Visible := True;
    end;
end;

procedure TFM_SubForm3.PL_Select_Data;
begin
  BT_Input.Visible := False;
  if FG_Gubun = '학력사항' then
    begin
      with QR_qry do
        begin
          Close;
          ClearFieldInfo;
          AddField('schrank'    , ftString, 2);
          AddField('schgr'      , ftString, 2);
          AddField('schcode'    , ftString, 4);
          AddField('schnm'      , ftString, 30);
          AddField('majorcode'  , ftString, 4);
          AddField('schym'      , ftString, 15);
          AddField('schkind'    , ftString, 2);
          AddField('schgrtime'  , ftString, 1);
          AddField('smajnm'     , ftString, 30);
          AddField('stopic'     , ftString, 50);
          AddField('schgrnm'    , ftString, 30);
          AddField('majorcodenm', ftString, 30);
          AddField('schgrtimenm', ftString, 30);

          Sql.Clear;
          Sql.Text := Format(
                        'SELECT             '+
                        '    A.schrank    , '+
                        '    A.schgr      , '+
                        '    A.schcode    , '+
                        '    A.schnm      , '+
                        '    A.majorcode  , '+
                        '    SUBSTR(A.schfrym,1,4)||''/''||SUBSTR(A.schfrym,5,2)||''~''|| '+
                        '    SUBSTR(A.schtoym,1,4)||''/''||SUBSTR(A.schtoym,5,2) schym  , '+
                        '    A.schkind    , '+
                        '    A.schgrtime  , '+
                        '    A.smajnm     , '+
                        '    A.stopic     , '+
                        '    B.codename schgrnm    , '+
                        '    C.codename majorcodenm, '+
                        '    D.codename schgrtimenm  '+
                        '  FROM pyccode B, pyccode C, pyccode D, pimscho A '+
                        ' WHERE A.empno  = ''%s''      '+
                        '   AND B.codeid(+) = ''I221''    '+
                        '   AND B.codeno(+) = A.schgr     '+
                        '   AND C.codeid(+) = ''I225''    '+
                        '   AND C.codeno(+) = A.majorcode '+
                        '   AND D.codeid(+) = ''I226''    '+
                        '   AND D.codeno(+) = A.schgrtime '+
                        ' ORDER BY A.schgr, A.schrank  ',
                     [FM_Main.FG_CurEmpno]);
          Open;
          if RecordCount <= 0 then
            Grid1.Visible := False
          else
            Grid1.Visible := True;

          if copy(FM_Main.FG_CurEmpno,1,1) = 'Y' then
             BT_Input.Visible := true;
        end;
    end;
    
  if FG_Gubun = '비정규 학력사항' then
    begin
      with QR_qry do
        begin
          Close;
          ClearFieldInfo;
          AddField('edudate'   , ftString, 21);
          AddField('eduorgnm'  , ftString, 30);
          AddField('educontent', ftString, 30);
          AddField('edubigo'   , ftString, 40);
          AddField('edutimenm' , ftString, 30);
          AddField('eduackyn'  , ftString, 1);

          Sql.Clear;
          Sql.Text := Format(
                        'SELECT             '+
                        '    SUBSTR(A.edufrdate,1,4)||''/''||SUBSTR(A.edufrdate,5,2)||''/''||SUBSTR(A.edufrdate,7,2)||''~''|| '+
                        '    SUBSTR(A.edutodate,1,4)||''/''||SUBSTR(A.edutodate,5,2)||''/''||SUBSTR(A.edutodate,7,2) edudate, '+
                        '    A.eduorgnm    , '+
                        '    A.educontent  , '+
                        '    A.edubigo     , '+
                        '    B.codename edutimenm , '+
                        '    A.eduackyn      '+
                        '  FROM pyccode B, pimeduc A '+
                        ' WHERE A.empno     = ''%s''   '+
                        '   AND B.codeid(+) = ''I226'' '+
                        '   AND B.codeno(+) = A.edutime'+
                        ' ORDER BY A.edufrdate DESC    ',
                     [FM_Main.FG_CurEmpno]);
          Open;
          if RecordCount <= 0 then
            Grid2.Visible := False
          else
            Grid2.Visible := True;
        end;
    end;

  if FG_Gubun = '자격사항' then
    begin
      with QR_qry do
        begin
          Close;
          ClearFieldInfo;
          AddField('licno'     , ftString, 15);
          AddField('licrank'   , ftString, 2);
          AddField('licgetdate', ftString, 10);
          AddField('licalyn'   , ftString, 1);
          AddField('licalfield', ftString, 30);
          AddField('licaldate' , ftString, 10);
          AddField('lickindnm' , ftString, 60);
          AddField('licupdate' , ftString, 10);
          AddField('licbigo'   , ftString, 40);
          AddField('licdidate' , ftString, 10);
          Sql.Clear;
          Sql.Text := Format(
                        'SELECT              '+
                        '    A.licno       , '+
                        '    A.licrank     , '+
                        '    DECODE(A.licgetdate,'''','' '', '+
                        '      SUBSTR(A.licgetdate,1,4)||''/''||SUBSTR(A.licgetdate,5,2)||''/''||SUBSTR(A.licgetdate,7,2)) licgetdate, '+
                        '    A.licalyn     , '+
                        '    A.licalfield  , '+
                        '    DECODE(A.licaldate,'''','' '',  '+
                        '      SUBSTR(A.licaldate,1,4)||''/''||SUBSTR(A.licaldate,5,2)||''/''||SUBSTR(A.licaldate,7,2)) licaldate, '+
                        '    B.codename||'' ''||C.codename lickindnm , '+
                        '    DECODE(A.licupddate,'''','' '', '+
                        '      SUBSTR(A.licupddate,1,4)||''/''||SUBSTR(A.licupddate,5,2)||''/''||SUBSTR(A.licupddate,7,2)) licupdate, '+
                        '    A.licbigo,      '+
                        '    DECODE(A.licdidate,'''','' '',  '+
                        '      SUBSTR(A.licdidate,1,4)||''/''||SUBSTR(A.licdidate,5,2)||''/''||SUBSTR(A.licdidate,7,2)) licdidate  '+
                        '  FROM pyccode B, pyccode C, pimlice A '+
                        ' WHERE A.empno     = ''%s''   '+
                        '   AND B.codeid(+) = ''I231'' '+
                        '   AND B.codeno(+) = A.lickind'+
                        '   AND C.codeid(+) = ''I232'' '+
                        '   AND C.codeno(+) = A.licgr  '+
                        ' ORDER BY A.licgetdate, A.licrank  ',
                     [FM_Main.FG_CurEmpno]);
          Open;
          if RecordCount <= 0 then
            Grid3.Visible := False
          else
            Grid3.Visible := True;
        end;
    end;

  if FG_Gubun = '경력사항' then
    begin
      with QR_qry do
        begin
          Close;
          ClearFieldInfo;
          AddField('carplace' , ftString, 30);
          AddField('cardeptnm', ftString, 30);
          AddField('cardate'  , ftString, 21);
          AddField('carjobnm' , ftString, 30);
          AddField('carymd'   , ftString, 12);

          Sql.Clear;
          Sql.Text := Format(
                        'SELECT              '+
                        '    A.carplace    , '+
                        '    A.cardeptnm   , '+
                        '    SUBSTR(A.carfrdate,1,4)||''/''||SUBSTR(A.carfrdate,5,2)||''/''||SUBSTR(A.carfrdate,7,2)||''~''|| '+
                        '    SUBSTR(A.cartodate,1,4)||''/''||SUBSTR(A.cartodate,5,2)||''/''||SUBSTR(A.cartodate,7,2) cardate, '+
                        '    A.carjobnm    , '+
                        '    A.carduyy||''년''||A.cardumm||''월''||A.cardudd||''일'' carymd '+                        
                        '  FROM pimcarr A '+
                        ' WHERE A.empno     = ''%s''   '+
                        ' ORDER BY A.carfrdate DESC    ',
                     [FM_Main.FG_CurEmpno]);
          Open;
          if RecordCount <= 0 then
            Grid4.Visible := False
          else
            Grid4.Visible := True;

          if copy(FM_Main.FG_CurEmpno,1,1) = 'Y' then
             BT_Input.Visible := true;
        end;
    end;

  if FG_Gubun = '산휴병가사항' then
    begin
      with QR_qry do
        begin
          Close;
          ClearFieldInfo;
          AddField('hugubunnm', ftString, 30);
          AddField('hudate'   , ftString, 21);
          AddField('bigo'     , ftString, 40);

          Sql.Clear;
          Sql.Text := Format(
                        'SELECT  '+
                        '    B.codename hugubunnm , '+
                        '    SUBSTR(A.hufrdate,1,4)||''/''||SUBSTR(A.hufrdate,5,2)||''/''||SUBSTR(A.hufrdate,7,2)||''~''|| '+
                        '    SUBSTR(A.hutodate,1,4)||''/''||SUBSTR(A.hutodate,5,2)||''/''||SUBSTR(A.hutodate,7,2) hudate, '+
                        '    A.bigo '+
                        '  FROM pyccode B, pihvaca A   '+
                        ' WHERE A.empno    = ''%s''    '+
                        '   AND B.codeid(+)= ''I320''  '+
                        '   AND B.codeno(+)= A.hugubun '+
                        ' ORDER BY A.hufrdate DESC    ',
                     [FM_Main.FG_CurEmpno]);
          Open;
          if RecordCount <= 0 then
            Grid5.Visible := False
          else
            Grid5.Visible := True;
        end;
    end;

  if FG_Gubun = '인사평가사항' then
    begin
      with QR_qry do
        begin
          Close;
          ClearFieldInfo;
          AddField('rabasdate', ftString, 10);
          AddField('teamscr'  , ftFloat, 9);
          AddField('resultscr', ftFloat, 9);
          AddField('abilscr'  , ftFloat, 9);
          AddField('behavscr' , ftFloat, 9);
          AddField('insa'     , ftFloat, 9);

          Sql.Clear;
          Sql.Text := Format(
                        'SELECT '+
                        '    rabasdate,    '+
                        '    teamscr,      '+
                        '    resultscr,    '+
                        '    abilscr,      '+
                        '    behavscr,     '+
                        '    insa          '+
                        '  FROM '+
                        '    (SELECT '+
                        '        SUBSTR(rabasdate,1,4)||''/''||SUBSTR(rabasdate,5,2)||''/''||SUBSTR(rabasdate,7,2) rabasdate,'+
                        '        teamscr,      '+
                        '        resultscr,    '+
                        '        abilscr,      '+
                        '        behavscr,     '+
                        '        0 insa        '+
                        '      FROM pehfumas   '+
                        '     WHERE empno   = ''%s''   '+
                        '       AND egubun <> ''실장'' '+
                        '       AND rabasdate <=       '+
                        '          (SELECT value2 FROM pehrebas  '+
                        '            WHERE rabasdate = ''00000000'' AND gubun = ''00'' AND sgubun = ''0001'') '+
                        '    UNION  '+
                        '    SELECT '+
                        '        SUBSTR(intodate,1,4)||''/''||SUBSTR(intodate,5,2)||''/''||SUBSTR(intodate,7,2) rabasdate, '+
                        '        0 teamscr,    '+
                        '        0 resultscr,  '+
                        '        0 abilscr,    '+
                        '        0 behavscr,   '+
                        '        adjscore insa '+
                        '      FROM pihingo A          '+
                        '     WHERE A.empno  = ''%s''  '+
                        '       AND A.intodate > (SELECT orgempdate FROM pimpmas WHERE empno = A.empno)) '+
                        '    UNION  '+
                        '    SELECT SUBSTR(rabasyear,1,4)||''/''||SUBSTR(''12'',1,2)||''/''||SUBSTR(''31'',1,2) rabasdate, '+
                        '        0 teamscr,              '+
                        '        resultscr2 resultscr,   '+
                        '        abilityscr2 abilscr,    '+
                        '        0 behavscr,             '+
                        '        0 insa                  '+
                        '    FROM pehevhis               '+
                        '    WHERE rabasyear >= ''2005'' '+
                        //하은영
                        '    and rabasyear <  ''2006''   '+
                        '    AND empno = ''%s''          '+
                        ' ORDER BY rabasdate DESC  ',
                     [FM_Main.FG_CurEmpno,FM_Main.FG_CurEmpno,FM_Main.FG_CurEmpno]);
          Open;
          TFloatField(FieldByName('teamscr')).DisplayFormat     := '##0.00000';
          TFloatField(FieldByName('resultscr')).DisplayFormat   := '##0.00000';
          TFloatField(FieldByName('abilscr')).DisplayFormat     := '##0.00000';
          TFloatField(FieldByName('behavscr')).DisplayFormat    := '##0.00000';
          TFloatField(FieldByName('insa')).DisplayFormat        := '##0.00000';
          if RecordCount <= 0 then
            Grid6.Visible := False
          else
            Grid6.Visible := True;
        end;
    end;
end;

procedure TFM_SubForm3.BT_InputClick(Sender: TObject);
begin
     if FG_Gubun = '학력사항' then
     begin
          //학력구분
          FM_SubForm4_1.ED_Schgr.Session := Insa_Session;
          FM_SubForm4_1.ED_Schgr.Text    := QR_qry.FieldByName('Schgr').AsString;
          FM_SubForm4_1.ED_Schgr.PL_get_singledata;
          FM_SubForm4_1.ED_Schgrnm.Text  := FM_SubForm4_1.ED_Schgr.Codename;

          //동일학력순위
          FM_SubForm4_1.Ed_SchRank.text  := QR_qry.FieldByName('SchRank').AsString;

          //학교명
          FM_SubForm4_1.ED_SchCode.Session := Insa_Session;
          FM_SubForm4_1.ED_SchCode.Text    := QR_qry.FieldByName('SchCode').AsString;
          FM_SubForm4_1.ED_SchCode.PL_get_singledata;
          FM_SubForm4_1.ED_Schnm.Text      := QR_qry.FieldByName('Schnm').AsString;


          //전공학과
          FM_SubForm4_1.ED_Majorcode.Session := Insa_Session;
          FM_SubForm4_1.ED_Majorcode.Text    := QR_qry.FieldByName('Majorcode').AsString;
          FM_SubForm4_1.ED_Majorcode.PL_get_singledata;
          FM_SubForm4_1.ED_Majornm.Text      := FM_SubForm4_1.ED_Majorcode.Codename;

          //수학기간
          FM_SubForm4_1.ED_SchFrYM.text := Copy(QR_qry.FieldByName('schym').AsString, 1,4)+
                                           Copy(QR_qry.FieldByName('schym').AsString, 6,2);
          FM_SubForm4_1.ED_SchToYM.text := Copy(QR_qry.FieldByName('schym').AsString, 9,4)+
                                           Copy(QR_qry.FieldByName('schym').AsString,14,2);

          //수업형태
          FM_SubForm4_1.Ed_Schkind.Session := Insa_Session;
          FM_SubForm4_1.Ed_Schkind.Text    := QR_qry.FieldByName('Schkind').AsString;
          FM_SubForm4_1.Ed_Schkind.PL_get_singledata;
          FM_SubForm4_1.Ed_Schkindnm.Text  := FM_SubForm4_1.Ed_Schkind.Codename;

          //이수시기
          FM_SubForm4_1.Ed_SchgrTime.Session := Insa_Session;
          FM_SubForm4_1.Ed_SchgrTime.Text    := QR_qry.FieldByName('SchgrTime').AsString;
          FM_SubForm4_1.Ed_SchgrTime.PL_get_singledata;
          FM_SubForm4_1.Ed_SchgrTimenm.Text  := FM_SubForm4_1.Ed_SchgrTime.Codename;

          //석박사 세부전공
          FM_SubForm4_1.Ed_Smajnm.text := QR_qry.FieldByName('Smajnm').AsString;

          //논문
          FM_SubForm4_1.Ed_Stopic.text := QR_qry.FieldByName('Stopic').AsString;
{
          if (FM_Main.FG_pempno = FM_Main.ED_empno.Text) then
          begin
              FM_SubForm4_1.ED_Schgr.Enabled   :=False;
              FM_SubForm4_1.ED_Schgrnm.Enabled :=False;
              FM_SubForm4_1.Ed_SchRank.Enabled :=False;
              FM_SubForm4_1.BT_Add.Enabled     :=False;
              FM_SubForm4_1.BT_del.Enabled     :=False;
          end;

          if ((FM_Main.FG_pempno = FM_Main.ED_empno.Text) and (copy(FM_Main.FG_Grade,2,1) <= 'B')) then
          begin
              FM_SubForm4_1.ED_Schgr.Enabled   :=true;
              FM_SubForm4_1.ED_Schgrnm.Enabled :=true;
              FM_SubForm4_1.Ed_SchRank.Enabled :=true;
              FM_SubForm4_1.BT_Add.Enabled     :=true;
              FM_SubForm4_1.BT_del.Enabled     :=true;

              FM_SubForm3.BT_Input.Enabled     :=True;
          end;
}
          FM_SubForm4_1.showmodal;
     end
     else
     if FG_Gubun = '경력사항' then
     begin

          //근무처
          FM_SubForm4_4.Ed_Carplace.text  := QR_qry.FieldByName('Carplace').AsString;

          //근무부서 / 직책
          FM_SubForm4_4.Ed_Cardeptnm.text := QR_qry.FieldByName('Cardeptnm').AsString;

          //담당직무
          FM_SubForm4_4.Ed_Carjobnm.text  := QR_qry.FieldByName('Carjobnm').AsString;

          //근무기간
          FM_SubForm4_4.ED_CarFrDate.text  := Copy(QR_qry.FieldByName('cardate').AsString, 1,4)+
                                              Copy(QR_qry.FieldByName('cardate').AsString, 6,2)+
                                              Copy(QR_qry.FieldByName('cardate').AsString, 9,2);
          FM_SubForm4_4.ED_CarToDate.text  := Copy(QR_qry.FieldByName('cardate').AsString,12,4)+
                                              Copy(QR_qry.FieldByName('cardate').AsString,17,2)+
                                              Copy(QR_qry.FieldByName('cardate').AsString,20,2);
          FM_SubForm4_4.Ed_TotCarr.text    := QR_qry.FieldByName('carymd').AsString;
{
          if (FM_Main.FG_pempno = FM_Main.ED_empno.Text) then
          begin
              FM_SubForm4_4.Ed_Carplace.Enabled  :=False;
              FM_SubForm4_4.Ed_Cardeptnm.Enabled :=False;
              FM_SubForm4_4.ED_CarFrDate.Enabled :=False;
              FM_SubForm4_4.BT_Add.Enabled       :=False;
              FM_SubForm4_4.BT_del.Enabled       :=False;
          end;

          if ((FM_Main.FG_pempno = FM_Main.ED_empno.Text) and (copy(FM_Main.FG_Grade,2,1) <= 'B')) then
          begin
              FM_SubForm4_4.Ed_Carplace.Enabled  :=true;
              FM_SubForm4_4.Ed_Cardeptnm.Enabled :=true;
              FM_SubForm4_4.ED_CarFrDate.Enabled :=true;
              FM_SubForm4_4.BT_Add.Enabled       :=true;
              FM_SubForm4_4.BT_del.Enabled       :=true;

              FM_SubForm3.BT_Input.Enabled       :=True;
          end;
}
          FM_SubForm4_4.showmodal;
     end;

     PL_Select_Data;
end;

end.

