unit PTA40201;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGridEh, OnTmaxCodeEdit, OnEditBaseCtrl, OnEditStdCtrl,
  OnEditBtnCtrl, OnTmaxPersonEdit, OnScheme, OnEditCombo, OnFocusButton,
  ExtCtrls, Tmax_session, OnInsaCommon, Db, Tmax_DataSetText, OnPopupEdit,
  Mask,func, pebtnedit, peNumedit, TmaxFunc,ComObj;

type
  TfrmMain = class(TForm)
    SF_Sub: TOnSchemeForm;
    ED_empno: TTMaxPersonPopupEdit;
    DBGridEh1: TDBGridEh;
    ED_year: TOnComboEdit;
    Ed_Grade: TOnComboEdit;
    Ed_Month: TOnComboEdit;
    BBmodify: TOnFocusButton;
    OnFocusButton1: TOnFocusButton;
    OnFocusButton2: TOnFocusButton;
    OnFocusButton4: TOnFocusButton;
    Panel7: TPanel;
    Panel8: TPanel;
    OnFocusButton3: TOnFocusButton;
    TMaxSession: TTMaxSession;
    DS_Grid1: TDataSource;
    ED_Edugubun: TOnWinPopupEdit;
    TDS_Grid1: TTMaxDataSet;
    Pn_In: TPanel;
    Pn_Ch: TPanel;
    Pn_Intime: TPanel;
    Pn_Chtime: TPanel;
    Pn_Chcost: TPanel;
    Pn_Incost: TPanel;
    Pn_Insat: TPanel;
    Pn_Chsat: TPanel;
    TDS_Label: TTMaxDataSet;
    TDS_dml: TTMaxDataSet;
    Ed_Give: TOnComboEdit;
    SaveDialog1: TSaveDialog;
    Panel1: TPanel;
    ED_RabasYM: TOnWinPopupEdit;
    OnFocusButton5: TOnFocusButton;
    OnFocusButton6: TOnFocusButton;
    TDS1: TTMaxDataSet;
    Ed_Part: TOnComboEdit;
    ED_Eduname: TOnComboEdit;
    NE_insat: TPeJeonNumEdit;
    NE_chsat: TPeJeonNumEdit;
    NE_chcost: TPeJeonNumEdit;
    NE_incost: TPeJeonNumEdit;
    NE_chtime: TPeJeonNumEdit;
    NE_intime: TPeJeonNumEdit;
    NE_ch: TPeJeonNumEdit;
    NE_in: TPeJeonNumEdit;
    Shape1: TShape;
    ED_leccost: TOnWinPopupEdit;
    Label1: TLabel;
    OnFocusButton7: TOnFocusButton;
    Edit1: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure OnFocusButton2Click(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure BBmodifyClick(Sender: TObject);
    procedure ED_EdugubunInitPopup(Sender: TObject);
    procedure ED_EdugubunCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure OnFocusButton4Click(Sender: TObject);
    procedure OnFocusButton1Click(Sender: TObject);
    procedure OnFocusButton3Click(Sender: TObject);
    procedure OnFocusButton6Click(Sender: TObject);
    procedure OnFocusButton5Click(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure OnFocusButton7Click(Sender: TObject);
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
        FG_deptname: string;
        FG_Dept    : TStringList;
  end;

var
  frmMain: TfrmMain;

implementation

uses PTA40202, PTA40203;
{$R *.DFM}

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  ///////////////////////////////////////////////////////////////////////
  //for test by hjku
  //TMaxSession.EnvFileName := 'd:\src\newhana.env';
  TMaxSession.EnvFileName := GetHomeDir+'\newhana.env';
  TMaxSession.LabelName   := 'HANAROHPER';
  TMaxSession.Connect     := False;
  FG_empno                := HInsa_param(cmdline,1);
  FG_grade                := HInsa_param(cmdline,4);
  TMaxSession.Host        := Hinsa_Param(cmdline,10);
  TMaxSession.Port        := '9999';

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

  DBGridEh1.RowsHeight := 22;


  with TDS1 do
  begin
    ServiceName := 'HINSA_select';
    Close;
    Sql.Clear;
    Sql.Add(' SELECT DISTINCT(SUBSTR(RABASYM, 1,4))||''년'' RABASYM,      ');
    Sql.Add('       ''field2'', ''field3'', ''field4'',''field5'' ');
    Sql.Add(' FROM PEDULHIS             ');
    Sql.Add(' WHERE RABASYM IS NOT NULL ');
    Sql.Add(' ORDER BY RABASYM      ');

    ClearFieldInfo;
    AddField('RABASYM', ftString,  100);
    AddField('field2' , ftString,  100);
    AddField('field3' , ftString,  100);
    AddField('field4' , ftString,  100);
    AddField('field5' , ftString,  100);
    Open;

    ED_year.Items.Clear;
    while not TDS1.Eof do
    begin
      ED_year.Items.Add(FieldByName('RABASYM').AsString);
      next;
    end;
  end;

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
      ED_year.Items.Add(copy(FieldbyName('FGSYSDATE').AsString,1,4)+'년');
      ED_year.Text    := copy(FieldbyName('FGSYSDATE').AsString,1,4)+'년';
      ED_RabasYM.Text := copy(FieldbyName('FGSYSDATE').AsString,1,6);
    end;
  end;

  with TDS1 do
  begin
    ServiceName := 'HINSA_select';
    Close;
    Sql.Clear;
    //교육과정
    Sql.Add('select distinct Eduname,                               ');
    Sql.Add('       ''field2'', ''field3'', ''field4'',''field5''   ');
    Sql.Add('  from pedulhis                                        ');

    ClearFieldInfo;
    AddField('Eduname' , ftString,  100);
    AddField('field2'    , ftString,  100);
    AddField('field3'    , ftString,  100);
    AddField('field4'    , ftString,  100);
    AddField('field5'    , ftString,  100);
    Open;

    ED_Eduname.Items.Add('');
    while not TDS1.eof do
    begin
      ED_Eduname.Items.Add(FieldbyName('Eduname').AsString);
      next;
    end;
  end;

  with TDS1 do
  begin
    ServiceName := 'HINSA_select';
    Close;
    Sql.Clear;
    //현재날짜
    Sql.Add('select distinct LOGEMP,                                              ');
    Sql.Add('       (Select KORNAME from pimpmas Where empno = a.logemp) KORNAME, ');
    Sql.Add('       ''field3'', ''field4'',''field5''                             ');
    Sql.Add('  from pedulhis a                                                    ');

    ClearFieldInfo;
    AddField('LOGEMP'    , ftString,  100);
    AddField('KORNAME'   , ftString,  100);
    AddField('field3'    , ftString,  100);
    AddField('field4'    , ftString,  100);
    AddField('field5'    , ftString,  100);
    Open;

    while not TDS1.eof do
    begin
      ED_Part.Items.Add(FieldbyName('Logemp').AsString + ' - ' + FieldbyName('KORNAME').AsString);
      next;
    end;
    Ed_Part.Text := '전체'
  end;

end;

procedure TfrmMain.OnFocusButton2Click(Sender: TObject);
begin
     if (copy(FG_grade,5,1) <= 'C') and (FG_grade <> '') then
     begin
          frmReg := TfrmReg.Create(Self);
          frmReg.ShowModal;
     end else
     begin
          MessageBox(handle,'권한이 없습니다.','에러',mb_ok);
     end;
end;

procedure TfrmMain.FormPaint(Sender: TObject);
begin
     begin
     Self.OnPaint := Nil;
     Application.ProcessMessages;
     if (copy(FG_grade,5,1) <= 'C') and (FG_grade <> '') then
     begin
          frmMain.Refresh ;
     end else
     begin
          MessageBox(handle,'권한이 없습니다.','에러',mb_ok);
          frmMain.close;
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
     end;
end;

procedure TfrmMain.BBmodifyClick(Sender: TObject);
begin
(* 년도별 총 교육시간을 20시간 기준으로 차등해서 지급함.
   권M 요청으로 일괄등록 시 금액을 변경하여 등록하므로 아래로직 삭제함. (2017.01.10 HeeYong)
      DECODE(A.RABASYM, '',
              CASE WHEN (A.SUMTIME =   0 ) THEN 20000
                   WHEN (A.SUMTIME <  20 ) THEN 30000
                   WHEN ((A.SUMTIME - A.LECTIME) <  20) THEN
                        TRUNC(((20 - (A.SUMTIME - A.LECTIME)) * 30000 + (A.SUMTIME - 20) * 20000) / A.LECTIME)
          			   WHEN ((A.SUMTIME - A.LECTIME) >= 20) THEN 20000
              END,
              A.LECCOST) LECCOST,
       DECODE(A.RABASYM, '',
              CASE WHEN (A.SUMTIME =   0 ) THEN A.LECTIME * 20000
                   WHEN (A.SUMTIME <  20 ) THEN A.LECTIME * 30000
                   WHEN ((A.SUMTIME - A.LECTIME) <  20) THEN (20 - (A.SUMTIME - A.LECTIME)) * 30000 + (A.SUMTIME - 20) * 20000
                   WHEN ((A.SUMTIME - A.LECTIME) >= 20) THEN A.LECTIME * 20000
              END,
              A.COST) COSTSUM,
*)

     with TDS_Grid1 do
     begin
          ServiceName := 'PTA4020B_sel3';
          Close;
          SQL.Clear;
          Sql.Add('select giveyn, rabasym, empno, korname,                                                                                      ');
          Sql.Add('       (select deptname from pycdept                                                                                         ');
          Sql.Add('         where orgnum=(select value1 from pimvari                                                                            ');
          Sql.Add('                        where gubun=''00'' and sgubun=''0001'')                                                              ');
          Sql.Add('           and deptcode=(select deptcode from pimpmas                                                                        ');
          Sql.Add('                          where empno=a.empno)) deptname,                                                                    ');
          Sql.Add('        (select codename from pyccode                                                                                        ');
          Sql.Add('          where codeid=''I113''                                                                                              ');
          Sql.Add('            and codeno=(select payra from pimpmas                                                                            ');
          Sql.Add('                         where empno=a.empno)) codefname,                                                                    ');
          Sql.Add('       gubun, grade, edugubun, eduname, educoment, rabasdate, lectime, stime,                                                ');
          Sql.Add('       a.leccost, ROUND(DECODE(A.RABASYM, '''', (A.LECTIME * A.LECCOST), A.COST), -1) COSTSUM,                               ');
          Sql.Add('       satper, (select korname from pimpmas where empno=a.logemp) logemp, coment                                             ');
          Sql.Add(' from (select m.RABASYM, m.EMPNO, m.KORNAME, m.GUBUN, m.GRADE, m.EDUGUBUN, m.EDUNAME,                                        ');
          Sql.Add('                m.EDUCOMENT, m.RABASDATE, m.STIME, m.LECTIME, m.SATPER,                                                      ');
          Sql.Add('        	       m.LOGEMP, m.RELATE, m.COMENT, m.GIVEYN, m.COST, m.LECCOST,                                               ');
          Sql.Add('         nvl((Select sum(lectime) sumtime from pedulhis a, pedulect b                                                        ');
          Sql.Add('               where ((rabasYM like ''' + copy(ED_year.Text,1,4) + '''||''%'') or                                            ');
          Sql.Add(' 			 ((giveyn = ''N'')and ((a.rabasdate < m.RABASDATE)  or                                                  ');
          Sql.Add(' 			 ((a.rabasdate = m.RABASDATE) and (a.stime   <=  m.stime))) ) )                                         ');
          Sql.Add('                 and a.empno   = b.empno                                                                                     ');
          Sql.Add('        	        and substr(b.cpdate,1,6) <= substr(a.rabasdate,1,6)                                                     ');
          Sql.Add('        	        and a.empno   = m.empno                                                                                 ');
          Sql.Add('               Group by m.empno),0) sumtime                                                                                  ');
          Sql.Add('          from pedulhis m ) a                                                                                                ');
          Sql.Add(' where ((substr(a.rabasdate,1,4) = ''' + copy(ED_year.Text,1,4) + ''') or (nvl(rabasym,'' '')  = '' ''))                     ');

        if ED_empno.Text <> '전체' then
          Sql.Add('   and a.empno = ''' + Ed_empno.empno + '''                                                                                  ');

        if Ed_Grade.Text <> '전체' then
          Sql.Add('   and a.grade = ''' + Ed_grade.text + '''                                                                                   ');

        if Ed_Give.Text <> '전체' then
          Sql.Add('   and a.giveyn = ''' + Ed_Give.text + '''                                                                                   ');

        if Ed_Month.Text <> '전체' then
          Sql.Add('   and substr(a.rabasdate,5,2) = ''' + copy(ED_Month.Text,1,2) + '''                                                         ');

        if ED_Edugubun.Text <> '' then
        begin
          if copy(ED_Edugubun.Text,1,4) = '0000' then
             Sql.Add('   and a.edugubun  <> ''9001''                                                                                            ')
          else
             Sql.Add('   and a.edugubun = ''' + copy(ED_Edugubun.Text,1,4) + '''                                                                ');
        end;
        if ED_Eduname.Text <> '' then
          Sql.Add('   and a.eduname like ''%' + ED_Eduname.Text + '%''                                                                          ');

        if Ed_Part.Text <> '전체' then
          Sql.Add('   and a.logemp = ''' + copy(Ed_Part.Text,1,4) + '''                                                                         ');
          Sql.Add(' Order by giveyn,a.rabasYM desc, a.empno, a.rabasdate, a.stime                                                               ');

          ClearFieldInfo;
          AddField('GIVEYN'   , ftString,   1);            //  '확정여부'
          AddField('RABASYM'  , ftString,   6);            //  '지급년월'
          AddField('EMPNO'    , ftString,   4);            //  '사번'
          AddField('KORNAME'  , ftString,  12);            //  '성명'
          AddField('DEPTNAME' , ftString,  60);            //  '소속'
          AddField('CODEFNAME', ftString,  30);            //  '직위'
          AddField('GUBUN'    , ftString,  15);
          AddField('GRADE'    , ftString,   8);            //  '등급'
          AddField('EDUGUBUN' , ftString,   4);            //  '교육유형'
          AddField('EDUNAME'  , ftString, 100);            //  '과정명'
          AddField('EDUCOMENT', ftString, 100);            //  '교육내용'
          AddField('RABASDATE', ftString,   8);            //  '날짜'
          AddField('LECTIME'  , ftFloat,    4);            //  '시간'
          AddField('STIME'    , ftString,   4);
          AddField('LECCOST'  , ftFloat,    6);            //  '단가'
          AddField('COSTSUM'  , ftFloat,   11);            //  '지급액'
          AddField('SATPER'   , ftFloat,    3);            //  '만족도'
          AddField('LOGEMP'   , ftString,  12);            //  '담당자'
          AddField('COMENT'   , ftString,  50);            //  '비고'

edit1.text := sql.text;
          Open;
          TFloatField(FieldByName('LECTIME')).DisplayFormat := '##0.0';
          TFloatField(FieldByName('LECCOST')).DisplayFormat := '#,##0';
          TFloatField(FieldByName('COSTSUM')).DisplayFormat := '#,##0';
          TFloatField(FieldByName('SATPER')).DisplayFormat  := '0.0'  ;
          TStringField(FieldByName('RABASDATE')).EditMask   := '!0000-00-00;0;_';
     end;

     if TDS_Grid1.RecordCount<=0 then
     begin
          MessageBox(handle,'조회 결과가 없습니다.','조회',MB_OK);
          ED_empno.Text :=  '전체';
          exit;
     end;

     with TDS_Label do
     begin
          ServiceName := 'PTA4020B_sel4';
          Close;
          SQL.Clear;
          Sql.Add('select * from                                                                    ');
          Sql.Add('       (select nvl(count(distinct empno),0) incount, nvl(sum(lectime),0) intime, ');
          Sql.Add('       	       nvl(sum(cost),0) insum,                                      ');
          Sql.Add('               nvl(avg(satper),0) inper                                          ');
          Sql.Add('          from pedulhis                                                          ');
          Sql.Add('         where edugubun  <> ''9001''                                             ');
          Sql.Add('           and ((substr(rabasdate,1,4) = ''' + copy(ED_year.Text,1,4) + ''')     ');
          Sql.Add('                or (nvl(rabasym,'' '') = '' '' ))                                ');
          if ED_empno.Text <> '전체' then
             Sql.Add('        and empno = ''' + Ed_empno.empno + '''                                ');

          if Ed_Grade.Text <> '전체' then
             Sql.Add('        and grade = ''' + Ed_grade.text + '''                                 ');

          if Ed_Give.Text <> '전체' then
             Sql.Add('        and giveyn = ''' + Ed_Give.text + '''                                 ');

          if Ed_Month.Text <> '전체' then
             Sql.Add('        and substr(rabasdate,5,2) = ''' + copy(ED_Month.Text,1,2) + '''       ');

          if ED_Eduname.Text <> '' then
             Sql.Add('         and eduname like ''%' + ED_Eduname.Text + '%''                       ');

          if Ed_Part.Text <> '전체' then
             Sql.Add('         and logemp = ''' + copy(Ed_Part.Text,1,4) + '''                      ');
          Sql.Add('       ) a,                                                                      ');
          Sql.Add('       (select nvl(count(distinct empno),0) chcount, nvl(sum(lectime),0) chtime, ');
          Sql.Add('       	        nvl(sum(cost),0) chsum,                                     ');
          Sql.Add('                nvl(avg(satper),0) chper                                         ');
          Sql.Add('          from  pedulhis                                                         ');
          Sql.Add('         where  edugubun  = ''9001''                                             ');
          Sql.Add('           and ((substr(rabasdate,1,4) = ''' + copy(ED_year.Text,1,4) + ''')     ');
          Sql.Add('                or (nvl(rabasym,'' '') = '' '' ))                                ');
          if ED_empno.Text <> '전체' then
             Sql.Add('        and empno = ''' + Ed_empno.empno + '''                                ');

          if Ed_Grade.Text   <> '전체' then
             Sql.Add('        and grade = ''' + Ed_grade.text + '''                                 ');

          if Ed_Give.Text    <> '전체' then
             Sql.Add('        and giveyn = ''' + Ed_Give.text + '''                                 ');

          if Ed_Month.Text   <> '전체' then
             Sql.Add('        and substr(rabasdate,5,2) = ''' + copy(ED_Month.Text,1,2) + '''       ');

          if ED_Eduname.Text <> '' then
             Sql.Add('         and eduname like ''%' + ED_Eduname.Text + '%''                       ');

          if Ed_Part.Text    <> '전체' then
             Sql.Add('         and logemp = ''' + copy(Ed_Part.Text,1,4) + '''                      ');
          Sql.Add('       ) b                                                                       ');
          ClearFieldInfo;
          AddField('INCOUNT', ftFloat,  5);
          AddField('INTIME' , ftFloat, 10);
          AddField('INSUM'  , ftFloat, 10);
          AddField('INPER'  , ftFloat,  5);
          AddField('CHCOUNT', ftFloat,  5);
          AddField('CHTIME' , ftFloat, 10);
          AddField('CHSUM'  , ftFloat, 10);
          AddField('CHPER'  , ftFloat,  5);

          Open;

          NE_In.Value      := FieldByName('INCOUNT').AsFloat;
          NE_Ch.Value      := FieldByName('CHCOUNT').AsFloat;
          NE_Intime.Value  := FieldByName('INTIME').AsFloat;
          NE_Chtime.Value  := FieldByName('CHTIME').AsFloat;
          NE_InCost.Value  := FieldByName('INSUM').AsFloat;
          NE_ChCost.Value  := FieldByName('CHSUM').AsFloat;
          NE_Insat.Value   := FieldByName('INPER').AsFloat;
          NE_Chsat.Value   := FieldByName('CHPER').AsFloat;
     end;
end;

procedure TfrmMain.ED_EdugubunInitPopup(Sender: TObject);
begin
     CForm.Edit          := TOnWinPopupEdit(Sender);
     TOnWinPopupEdit(Sender).PopupControl := CForm ;
end;

procedure TfrmMain.ED_EdugubunCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
     if CForm.Code <> '' then
     begin
          ED_Edugubun.Text          := CForm.Code + ' - ' + CForm.CodeName;
     end;
end;

procedure TfrmMain.OnFocusButton4Click(Sender: TObject);
begin
     Close;
end;

procedure TfrmMain.OnFocusButton1Click(Sender: TObject);
begin
     if TDS_Grid1.RecordCount<=0 then exit;
     ED_leccost.Text := '';
     panel1.Visible := True;
end;

procedure TfrmMain.OnFocusButton3Click(Sender: TObject);
var XL, XArr: Variant;
    i,j,k: integer;
    SavePlace: TBookmark;
begin
     if TDS_Grid1.RecordCount<=0 then exit;

     SaveDialog1.FileName :='강의이력.xls';
     if SaveDialog1.Execute then
     begin
         with TStringList.Create do
         try

           Add(pchar('확정여부'+#9+
                     '지급년월'+#9+
                     '사번'    +#9+
                     '성명'    +#9+
                     '소속'    +#9+
                     '직위'    +#9+
                     '등급'    +#9+
                     '교육유형'+#9+
                     '과정명'  +#9+
                     '교육내용'+#9+
                     '날짜'    +#9+
                     '시간'    +#9+
                     '단가'    +#9+
                     '지급액'  +#9+
                     '만족도'  +#9+
                     '담당자'  +#9+
                     '비고'    ));

           TDS_Grid1.first;
           while not TDS_Grid1.Eof do
           begin
             Add(Format('%s'+#9+         //  '확정여부'
                        '%s'+#9+         //  '지급년월'
                        '%s'+#9+         //  '사번'
                        '%s'+#9+         //  '성명'
                        '%s'+#9+         //  '소속'
                        '%s'+#9+         //  '직위'
                        '%s'+#9+         //  '등급'
                        '%s'+#9+         //  '교육유형'
                        '%s'+#9+         //  '과정명'
                        '%s'+#9+         //  '교육내용'
                        '%s'+#9+         //  '날짜'
                        '%s'+#9+         //  '시간'
                        '%s'+#9+         //  '단가'
                        '%s'+#9+         //  '지급액'
                        '%s'+#9+         //  '만족도'
                        '%s'+#9+         //  '담당자'
                        '%s',            //  '비고'
                   [ TDS_Grid1.Fields[ 0].AsString,           //  '확정여부'
                     TDS_Grid1.Fields[ 1].AsString,           //  '지급년월'
                     TDS_Grid1.Fields[ 2].AsString,           //  '사번'
                     TDS_Grid1.Fields[ 3].AsString,           //  '성명'
                     TDS_Grid1.Fields[ 4].AsString,           //  '소속'
                     TDS_Grid1.Fields[ 5].AsString,           //  '직위'
                     TDS_Grid1.Fields[ 7].AsString,           //  '등급'
                     TDS_Grid1.Fields[ 8].AsString,           //  '교육유형'
                     TDS_Grid1.Fields[ 9].AsString,           //  '과정명'
                     TDS_Grid1.Fields[10].AsString,           //  '교육내용'
                     TDS_Grid1.Fields[11].AsString,           //  '날짜'
                     TDS_Grid1.Fields[12].AsString,           //  '시간'
                     TDS_Grid1.Fields[14].AsString,           //  '단가'
                     TDS_Grid1.Fields[15].AsString,           //  '지급액'
                     TDS_Grid1.Fields[16].AsString,           //  '만족도'
                     TDS_Grid1.Fields[17].AsString,           //  '담당자'
                     TDS_Grid1.Fields[18].AsString ]));       //  '비고'
             TDS_Grid1.Next;
           end; // end of for
           SaveToFile(SaveDialog1.FileName);
         finally
         Free;
         end; // end of try
     end; //end of SaveDialog1.Execute

(*
{ //전체자료 추출할때..}
  if TDS_Grid1.RecordCount < 1 then
  begin
       showmessage('엑셀 변환할 자료가 없습니다.');
       exit;
  end;

  XArr := VarArrayCreate([1, 17], VarVariant);
  try
       XL := CreateOLEObject('Excel.Application');
  except
       MessageDlg('Excel이 설치되어 있지 않습니다.', MtWarning, [mbok], 0);
       Exit;
  end;

  XL.WorkBooks.Add; //새로운 페이지 생성
  XL.Visible            := false;
  XL.WorkSheets[1].Name := 'HOUT List';  //시트명 부여
  XL.Range['A1:q2'].Merge;               //셀 병합

  //TITLE NAME 설정
  XL.Range['A1'].value  := '외주인력등록내역';
  XL.Range['A1'].font.Size := 16;

  //컬럼명 지정_서브타이블 지정

  XArr[ 1]  := '확정여부'      ;
  XArr[ 2]  := '지급년월'      ;
  XArr[ 3]  := '사번'  ;
  XArr[ 4]  := '성명'  ;
  XArr[ 5]  := '소속'    ;
  XArr[ 6]  := '직위'      ;
  XArr[ 7]  := '등급'          ;
  XArr[ 8]  := '교육유형'  ;
  XArr[ 9]  := '과정명'    ;
  XArr[10]  := '교육내용'      ;
  XArr[11]  := '날짜'        ;
  XArr[12]  := '시간'        ;
  XArr[13]  := '단가'      ;
  XArr[14]  := '지급액';
  XArr[15]  := '만족도';
  XArr[16]  := '담당자'    ;
  XArr[17]  := '비고'    ;


  XL.Range['A3' , 'Q3'].Value := XArr;
  k := 3;
  for i := 1 to 17 do
  begin
     XL.Range[CHR(64 + i) + '3'].HorizontalAlignment := 3;
     XL.Range[CHR(64 + i) + '3'].Interior.Color:= $00CBF0B3;
     XL.Range[CHR(64 + i) + '3'].font.Size := 10;
     XL.Range[CHR(64 + i) + '3'].font.Bold := True;
  end;

  //검색된 자료를 excel에 export처리 시킨다.
  SavePlace := TDS_Grid1.GetBookmark;
  TDS_Grid1.DisableControls;
  TDS_Grid1.First;     //Showmessage(inttostr(TDS_Grid1.RecordCount));

  for i := 1 to  TDS_Grid1.RecordCount do
  begin
     XArr[ 1]  := TDS_Grid1.Fields[ 0].AsString;
     XArr[ 2]  := TDS_Grid1.Fields[ 1].AsString;
     XArr[ 3]  := ''''+TDS_Grid1.Fields[ 2].AsString;
     XArr[ 4]  := TDS_Grid1.Fields[ 3].AsString;
     XArr[ 5]  := TDS_Grid1.Fields[ 4].AsString;
     XArr[ 6]  := TDS_Grid1.Fields[ 5].AsString;
     XArr[ 7]  := TDS_Grid1.Fields[ 7].AsString;
     XArr[ 8]  := TDS_Grid1.Fields[ 8].AsString;
     XArr[ 9]  := TDS_Grid1.Fields[ 9].AsString;
     XArr[10]  := TDS_Grid1.Fields[10].AsString;
     XArr[11]  := TDS_Grid1.Fields[11].AsString;
     XArr[12]  := TDS_Grid1.Fields[12].AsString;
     XArr[13]  := TDS_Grid1.Fields[14].AsString;
     XArr[14]  := TDS_Grid1.Fields[15].AsString;
     XArr[15]  := TDS_Grid1.Fields[16].AsString;
     XArr[16]  := TDS_Grid1.Fields[17].AsString;
     XArr[17]  := TDS_Grid1.Fields[18].AsString;

     XL.Range['A' + IntToStr(k+1), 'Q' + IntToStr(k+1)].Value := XArr;
     inc(k);
     TDS_Grid1.Next;
  end;
  //여기서 부터는 EXPORT된 EXCEL자료를 예쁘게 꾸미는 부분입니다.
   XL.Range['A1', 'Q' + IntToStr(k)].Borders.LineStyle   := 1;  //테두리선을 만든다.  1은 실선
   XL.Range['A1', 'Q' + IntToStr(k)].Borders.Weight      := 2;  //테두리선 두깨 설정  2는 보통두깨, 3은 무지 두꺼움
   XL.Range['A1', 'Q' + IntToStr(k)].Borders.ColorIndex  := 1;  //테두리선 색상설정  1은 검은색
   XL.Range['A1', 'Q' + IntToStr(k)].font.name := '굴림체';
   XL.Range['A1', 'A1'].HorizontalAlignment              := 3;  //가운데 정렬
   XL.Range['A3', 'Q' + IntToStr(k)].font.Size           := 9;
   XL.Range['A4', 'Q' + IntToStr(k)].HorizontalAlignment := 1;  //좌측정렬
   //XL.Range['J4', 'J' + IntToStr(k)].HorizontalAlignment := 1;  //우측정렬
   //XL.Range['K4', 'V' + IntToStr(k)].HorizontalAlignment := 2;  //좌측정렬
   XL.Range['A1', 'Q' + IntToStr(k)].Select;                    //자료를 모두 SELECT한 후 --하는 이유:  AutoFit 처리하기 위해서임
   XL.Selection.Columns.AutoFit;                                //자동정렬
   XL.Range['A4', 'A4'].Select;                                 //A4열에 커서 위치시킴
   XL.Visible := true;                                          //엑셀자료 보여줌
   Screen.Cursor := crDefault;
   TDS_Grid1.GotoBookmark(SavePlace);
   TDS_Grid1.FreeBookmark(SavePlace);
   TDS_Grid1.EnableControls;
*)
end;

procedure TfrmMain.OnFocusButton6Click(Sender: TObject);
var
   RowCnt : integer;
begin
     if DBGridEh1.SelectedRows.Count < 1 then
     begin
          ShowMessage( '지급확정할 행을 선택하십시오.' );
          panel1.Visible := False;
          Exit;
     end;

     RowCnt := 0;
     with DBGridEh1.DataSource.DataSet do
     begin
       while DBGridEh1.SelectedRows.Count > RowCnt do
       begin
           GotoBookmark(pointer(DBGridEh1.SelectedRows.Items[RowCnt]));
           if DBGridEh1.Fields[0].AsString = 'N' then
           with TDS_dml do
           begin
                ServiceName := 'PTA4020B_dml';
                Close;
                SQL.Clear;
                if  trim(ED_leccost.text) = '' then
                begin
                    Sql.Add('update pedulhis                                           ');
                    Sql.Add('   set rabasym   = '''+ED_RabasYM.Text+''',               ');
                    Sql.Add(Format('cost      =  %f,                                   '
                                      ,[DBGridEh1.Fields[13].AsFloat]                  ));
                    Sql.Add(Format('leccost   =  %f,                                   '
                                      ,[DBGridEh1.Fields[12].AsFloat]                  ));
                    Sql.Add('       giveyn    = ''Y'',                                 ');
                    Sql.Add('	writedate = TO_char(sysdate,''YYYYMMDDHH24MISS''), ');
                    Sql.Add('       writeman  = '''+FG_empno+'''                       ');
                    Sql.Add(' where rabasdate = '''+DBGridEh1.Fields[10].AsString+'''  ');
                    Sql.Add('   and empno     = '''+DBGridEh1.Fields[ 2].AsString+'''  ');
//                    Sql.Add('   and eduname   = '''+DBGridEh1.Fields[ 8].AsString+'''  ');
                    Sql.Add('   and Stime     = '''+TDS_Grid1.fieldbyname('Stime').AsString+'''  ');
                    Sql.Add('   and giveyn    = ''N''                                  ');
                    Sql.Add(Format('   and lectime   = %f                              '+
                                   '   and satper    = %f                              '
                                       , [DBGridEh1.Fields[11].AsFloat ,
                                          DBGridEh1.Fields[14].AsFloat ]               ));
                end
                else
                begin
                    Sql.Add('update pedulhis                                           ');
                    Sql.Add('   set rabasym   = '''+ED_RabasYM.Text+''',               ');
                    Sql.Add(Format('cost      =  %f,                                   '
                                      ,[strtofloat(DBGridEh1.Fields[11].AsString)*strtofloat(ED_leccost.text)]));
                    Sql.Add(Format('leccost   =  %f,                                   '
                                      ,[strtofloat(ED_leccost.text)]                  ));
                    Sql.Add('       giveyn    = ''Y'',                                 ');
                    Sql.Add('	writedate = TO_char(sysdate,''YYYYMMDDHH24MISS''), ');
                    Sql.Add('       writeman  = '''+FG_empno+'''                       ');
                    Sql.Add(' where rabasdate = '''+DBGridEh1.Fields[10].AsString+'''  ');
                    Sql.Add('   and empno     = '''+DBGridEh1.Fields[ 2].AsString+'''  ');
//                    Sql.Add('   and eduname   = '''+DBGridEh1.Fields[ 8].AsString+'''  ');
                    Sql.Add('   and Stime     = '''+TDS_Grid1.fieldbyname('Stime').AsString+'''  ');
                    Sql.Add('   and giveyn    = ''N''                                  ');
                    Sql.Add(Format('   and lectime   = %f                              '+
                                   '   and satper    = %f                              '
                                       , [DBGridEh1.Fields[11].AsFloat ,
                                          DBGridEh1.Fields[14].AsFloat ]               ));
                end;

                if not Execute then
                begin
                     Application.MessageBox('지급확정 저장에 실패했습니다.1','작업실패',MB_OK);
                     Exit;
                end;

                ServiceName := 'PTA4020B_dml';
                Close;
                SQL.Clear;
                Sql.Add('delete from pedulsum                                      ');
                Sql.Add(' where rabasym = '''+ED_RabasYM.Text+'''                  ');
                Sql.Add('   and empno   = '''+DBGridEh1.Fields[ 2].AsString+'''    ');
                if not Execute then
                begin
                     Application.MessageBox('지급확정 저장에 실패했습니다.2','작업실패',MB_OK);
                     Exit;
                end;

                ServiceName := 'PTA4020B_dml';
                Close;
                SQL.Clear;
                Sql.Add('insert into pedulsum                                      ');
                Sql.Add('select rabasym,                                           ');
                Sql.Add('       empno,                                             ');
                Sql.Add('       korname,                                           ');
                Sql.Add('       sum(lectime) Slectime,                             ');
                Sql.Add('       round(avg(satper),1),                              ');
                Sql.Add('       sum(cost),                                         ');
                Sql.Add('	TO_char(sysdate,''YYYYMMDDHH24MISS'') writetime,   ');
                Sql.Add('       '''+FG_empno+''' writeman                          ');
                Sql.Add('  from pedulhis                                           ');
                Sql.Add(' where giveyn  = ''Y''                                    ');
                Sql.Add('   and rabasym = '''+ED_RabasYM.Text+'''                  ');
                Sql.Add('   and empno   = '''+DBGridEh1.Fields[ 2].AsString+'''    ');
                Sql.Add(' group by rabasym,empno,korname                           ');
                if not Execute then
                begin
                     Application.MessageBox('지급확정 저장에 실패했습니다.3','작업실패',MB_OK);
                     Exit;
                end;
           end;
           Inc(RowCnt);
       end;
    end;

    BBmodifyClick(Self);
    panel1.Visible := False;
end;

procedure TfrmMain.OnFocusButton5Click(Sender: TObject);
begin
     panel1.Visible := False;
end;

procedure TfrmMain.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin

  PN_in.width     := DBGridEh1.Columns[2].Width+2;
  NE_in.width     := PN_in.width;
  PN_ch.width     := PN_in.width;
  NE_ch.width     := PN_in.width;

  Panel7.Left     := PN_in.Left + PN_in.width + DBGridEh1.Columns[3].Width;
  Panel8.Left     := Panel7.Left;
  Panel7.width    := DBGridEh1.Columns[4].Width+2;
  Panel8.width    := Panel7.width;

  PN_intime.Left  := Panel7.Left    + Panel7.width +  5 +
                     DBGridEh1.Columns[ 5].Width + DBGridEh1.Columns[ 6].Width +
                     DBGridEh1.Columns[ 7].Width + DBGridEh1.Columns[ 8].Width +
                     DBGridEh1.Columns[ 9].Width + DBGridEh1.Columns[10].Width;
  PN_chtime.Left  := PN_intime.Left;
  PN_intime.width := DBGridEh1.Columns[11].Width+2;
  NE_intime.width := PN_intime.width;
  PN_chtime.width := PN_intime.width;
  NE_chtime.width := PN_intime.width;

  PN_incost.Left  := PN_intime.Left + PN_intime.width +
                     DBGridEh1.Columns[12].Width;
  PN_chcost.Left  := PN_incost.Left;
  PN_incost.width := DBGridEh1.Columns[13].Width+2;
  NE_incost.width := PN_incost.width;
  PN_chcost.width := PN_incost.width;
  NE_chcost.width := PN_incost.width;

  PN_insat.Left   := PN_incost.Left + PN_incost.width - 1;
  PN_chsat.Left   := PN_insat.Left;
  PN_insat.width  := DBGridEh1.Columns[14].Width+2;
  NE_insat.width  := PN_insat.width;
  PN_chsat.width  := PN_insat.width;
  NE_chsat.width  := PN_insat.width;

end;

procedure TfrmMain.OnFocusButton7Click(Sender: TObject);
var
   RowCnt : integer;
begin
     if DBGridEh1.SelectedRows.Count < 1 then
     begin
          ShowMessage( '지급취소할 행을 선택하십시오.' );
          Exit;
     end;

     if MessageDlg('강의료를 이미 지급한 자료를 취소할 경우 문제가 될 수 있습니다. 그래도 선택한 자료를 지급취소하시겠습니까?', mtWarning, [mbYes,mbNo], 0) = mrNo then Exit;

     RowCnt := 0;
     with DBGridEh1.DataSource.DataSet do
     begin
       while DBGridEh1.SelectedRows.Count > RowCnt do
       begin
           GotoBookmark(pointer(DBGridEh1.SelectedRows.Items[RowCnt]));
           if DBGridEh1.Fields[0].AsString = 'Y' then
           with TDS_dml do
           begin
                ServiceName := 'PTA4020B_dml';
                Close;
                SQL.Clear;
                Sql.Add('update pedulhis                                           ');
                Sql.Add('   set rabasym   = '''',                                  ');
                Sql.Add('       cost      = '''',                                  ');
                Sql.Add('       leccost   = '''',                                  ');
                Sql.Add('       giveyn    = ''N'',                                 ');
                Sql.Add('	writedate = TO_char(sysdate,''YYYYMMDDHH24MISS''), ');
                Sql.Add('       writeman  = '''+FG_empno+'''                       ');
                Sql.Add(' where rabasdate = '''+DBGridEh1.Fields[10].AsString+'''  ');
                Sql.Add('   and empno     = '''+DBGridEh1.Fields[ 2].AsString+'''  ');
//                Sql.Add('   and eduname   = '''+DBGridEh1.Fields[ 8].AsString+'''  ');
                Sql.Add('   and Stime     = '''+TDS_Grid1.fieldbyname('Stime').AsString+'''  ');
                Sql.Add('   and giveyn    = ''Y''                                  ');
                Sql.Add(Format('   and lectime   = %f                              '+
                               '   and satper    = %f                              '
                                   , [DBGridEh1.Fields[11].AsFloat ,
                                      DBGridEh1.Fields[14].AsFloat ]               ));
                if not Execute then
                begin
                     Application.MessageBox('지급취소 작업이 실패했습니다.1','작업실패',MB_OK);
                     Exit;
                end;

                ServiceName := 'PTA4020B_dml';
                Close;
                SQL.Clear;
                Sql.Add('delete from pedulsum                                      ');
                Sql.Add(' where rabasym = '''+ED_RabasYM.Text+'''                  ');
                Sql.Add('   and empno   = '''+DBGridEh1.Fields[ 2].AsString+'''    ');
                if not Execute then
                begin
                     Application.MessageBox('지급취소 작업이 실패했습니다.2','작업실패',MB_OK);
                     Exit;
                end;

                ServiceName := 'PTA4020B_dml';
                Close;
                SQL.Clear;
                Sql.Add('insert into pedulsum                                      ');
                Sql.Add('select rabasym,                                           ');
                Sql.Add('       empno,                                             ');
                Sql.Add('       korname,                                           ');
                Sql.Add('       sum(lectime) Slectime,                             ');
                Sql.Add('       round(avg(satper),1),                              ');
                Sql.Add('       sum(cost),                                         ');
                Sql.Add('	TO_char(sysdate,''YYYYMMDDHH24MISS'') writetime,   ');
                Sql.Add('       '''+FG_empno+''' writeman                          ');
                Sql.Add('  from pedulhis                                           ');
                Sql.Add(' where giveyn  = ''Y''                                    ');
                Sql.Add('   and rabasym = '''+ED_RabasYM.Text+'''                  ');
                Sql.Add('   and empno   = '''+DBGridEh1.Fields[ 2].AsString+'''    ');
                Sql.Add(' group by rabasym,empno,korname                           ');
                if not Execute then
                begin
                     Application.MessageBox('지급취소 작업이 실패했습니다.3','작업실패',MB_OK);
                     Exit;
                end;
           end;
           Inc(RowCnt);
       end;
    end;
    BBmodifyClick(Self);
end;

end.
