unit PEH1030A1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl, OnTmaxPersonEdit,
  OnShapeLabel, ComCtrls, OnRadioBtn, OnEditMemo, StdCtrls, OnLineLabel,
  OnFocusButton, Db, Tmax_DataSetText, Tmax_session, TmaxFunc, Pass, printers,
  OnEditCombo, Grids, DBGrids, OnGrDBGrid, OnPopupEdit, OnInsaCommon;

type
  TFM_Main = class(TForm)
    Panel1: TPanel;
    L_payraname: TOnShapeLabel;
    BT_Exit: TOnFocusButton;
    TMaxSession: TTMaxSession;
    TMaxDataSet: TTMaxDataSet;
    OnSectionLabel3: TOnSectionLabel;
    OnSectionLabel1: TOnSectionLabel;
    TMaxDataSet_HInsa: TTMaxDataSet;
    TDS_Works: TTMaxDataSet;
    DS_Works: TDataSource;
    TDS_Works1: TTMaxDataSet;
    DS_Works1: TDataSource;
    L_Deptname: TOnShapeLabel;
    P_Opinion: TPanel;
    Shape5: TShape;
    OnSectionLabel4: TOnSectionLabel;
    OnSectionLabel8: TOnSectionLabel;
    Shape6: TShape;
    Shape7: TShape;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    E_MIDTOTVIEW: TOnMemo;
    E_MIDCOMVIEW: TOnMemo;
    DBG_works: TOnGrDbGrid;
    On_Comp: TOnMemo;
    DBG_works1: TOnGrDbGrid;
    L_Rabasdate: TOnShapeLabel;
    TDS: TTMaxDataSet;
    OnSectionLabel5: TOnSectionLabel;
    Shape10: TShape;
    Label9: TLabel;
    E_MIDVALVIEW: TOnMemo;
    BT_Help: TOnFocusButton;
    Ed_empno: TOnWinPopupEdit;
    L_Korname: TOnShapeLabel;
    BT_Print: TOnFocusButton;
    On_Value: TOnMemo;
    Panel5: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel7: TPanel;
    Panel6: TPanel;
    Panel11: TPanel;
    Shape1: TShape;
    Shape2: TShape;
    Label2: TLabel;
    Label6: TLabel;
    Panel2: TPanel;
    Panel12: TPanel;
    Panel14: TPanel;
    Panel13: TPanel;
    Panel15: TPanel;
    Panel17: TPanel;
    Panel18: TPanel;
    Panel19: TPanel;
    Panel16: TPanel;
    Panel3: TPanel;
    Panel20: TPanel;
    Panel23: TPanel;
    Panel22: TPanel;
    Panel24: TPanel;
    Panel21: TPanel;
    procedure BT_ExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BT_HelpClick(Sender: TObject);
    procedure Ed_empnoCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure Ed_empnoInitPopup(Sender: TObject);
    procedure Ed_empnoKeyPress(Sender: TObject; var Key: Char);
    procedure BT_PrintClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    vParamSQL  : String;
    procedure OpinionView;
    procedure Csel_Open;
    function  Csel_gfd(p_loc: Integer): String;
    procedure Select_BaseData;
    procedure Works_data;

  public
    { Public declarations }
     vEmpno     : String;
     PEmpno     : String;
     Pevcno     : String;   // 평가표 번호
     Ppaycl     : string;
     Ppayra     : String;
     Pjobkind   : String;
     Porgnum    : String;
     Pdeptcode  : String;
     PFinyn     : String;
     sRabasdate : String;
     Csel_SQL   : String;
     Csel_ret   : Boolean;
     Check      : Integer;

     Workemp1   : String;
     Workemp2   : String;
  end;

var
     FM_Main: TFM_Main;

implementation

uses UHelp, UEmpForm, UPrint;

{$R *.DFM}

procedure TFM_Main.BT_ExitClick(Sender: TObject);
begin
     Close;
end;

procedure TFM_Main.FormCreate(Sender: TObject);
var
  ParamVariant: String;
begin
  Self.OnPaint := Nil;
  Application.ProcessMessages;

  TMaxSession.EnvFileName := FM_Tmax.GetHomeDir+'\newhana.env';
  TMaxSession.LabelName   := 'HANAROHPER';
  TMaxSession.Connect     := False;
  TMaxSession.Host        := Passemp(cmdline,10);
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


  // 평가기준일을 읽어온다
  ParamVariant  := 'select Value1|| '';'' ||Value2     '+
                   '  FROM pehrebas                    '+
                   ' where rabasdate = ''00000000''    '+
                   '   and gubun     = ''00''          '+
                   '   and sgubun    = ''0001''        ';
  Csel_SQL      := ParamVariant;
  Csel_Open;
  sRabasdate    := Csel_gfd(1);
//  sRabasdate   := '20081130';
  L_Rabasdate.ValueCaption  := copy(sRabasdate,1,4)+'-'+copy(sRabasdate,5,2)+'-'+copy(sRabasdate,7,2);

  // 평가담당자를 읽어온다
  ParamVariant  := 'select Value1|| '';'' ||Value3           '+
                   '  FROM pehrebas                          '+
                   ' where rabasdate = '''+sRabasdate+'''    '+
                   '   and gubun     = ''11''                '+
                   '   and sgubun    = ''0005''              ';
  Csel_SQL      := ParamVariant;
  Csel_Open;
  Workemp1      := Csel_gfd(1);
  Workemp2      := Csel_gfd(2);

  Check         := 0;
  Pempno        :=  Passemp(cmdline,1);
  Ed_empno.Text :=  Passemp(cmdline,1);
end;

procedure TFM_Main.Select_BaseData;
var
     ParamVariant: String;
     i : integer;
     vEkind : String;
begin
     ParamVariant := 'SELECT empno||'';''||korname||'';''||paycl||'';''||payra||'';''||jobkind||'';''||       '+#13+
                     '       orgnum||'';''||deptcode||'';''||                                                 '+#13+
                     '       (select codename from pyccode where codeid=''I112'' and codeno=A.paycl)||'';''|| '+#13+
                     '       (select codename from pyccode where codeid=''I113'' and codeno=A.payra)||'';''|| '+#13+
                     '       (select deptname from pycdept where orgnum=A.orgnum and deptcode=A.deptcode)     '+#13+
                     '  FROM pehremas A                                                                       '+#13+
                     ' WHERE rabasdate = '''+ sRabasDate +'''                                                 '+#13+
                     '   AND (empno like '''+ Ed_empno.Text +'''||''%''   OR  korname like '''+ Ed_empno.Text +'''||''%'')      ';

     Csel_SQL := ParamVariant; // edit1.Text :=  ParamVariant;
     Csel_Open;

     vEmpno                   := Csel_gfd(1);
     Ed_Empno.Text            := Csel_gfd(1);
     L_korname.ValueCaption   := Csel_gfd(2);
     Ppaycl                   := Csel_gfd(3);
     Ppayra                   := Csel_gfd(4);
     Pjobkind                 := Csel_gfd(5);
     Porgnum                  := Csel_gfd(6);
     Pdeptcode                := Csel_gfd(7);
     L_payraname.ValueCaption := Csel_gfd(9);
     L_Deptname.ValueCaption  := Csel_gfd(10);

     if ((Ppaycl >= '10') and (Ppaycl <= '20')) or ((Ppaycl >= 'C11') and (Ppaycl <= 'C21')) then
         Pevcno := '1'
     else
     if ((Ppaycl >= '22') and (Ppaycl <= '44')) or ((Ppaycl >= 'D11') and (Ppaycl <= 'D35'))then
         Pevcno := '2';

     Works_data;
end;

procedure TFM_Main.Works_data;
var
     SqlText : string;
begin
     with TDS_Works1 do
     begin
          SqlText := Format('SELECT TASKNAME, MAINWEIGHT, E1MIDPERVIEW1, EMPNO, TASKCODE  '+
                            '  FROM PEHREAIM_BASDET A                                    '+
                            ' WHERE A.RABASDATE = ''%s''                                 '+
                            '   AND A.EMPNO     = ''%s''                                 ',[sRabasdate,Ed_empno.Text]);
          Close;
          ServiceName := 'HINSA_select2';
          ClearFieldInfo;
          AddField('TASKNAME'       , ftString, 400);
          AddField('MAINWEIGHT'     , ftString, 400);
          AddField('E1MIDPERVIEW1'  , ftString, 400);
          AddField('EMPNO'          , ftString, 400);
          AddField('TASKCODE'       , ftString, 400);
          ClearParamInfo;
          SQL.Text := SqlText;
          Open;
     end;

     with TDS_Works do
     begin
          SqlText := Format('SELECT PROPELTASK, MAINWEIGHT, E1MIDPERVIEW1, EMPNO, SEQNO  '+
                            '  FROM PEHREAIM_DET A                                      '+
                            ' WHERE A.RABASDATE = ''%s''                                '+
                            '   AND A.EMPNO     = ''%s''                                ',[sRabasdate,Ed_empno.Text]);
          Close;
          ServiceName := 'HINSA_select2';
          ClearFieldInfo;
          AddField('PROPELTASK'   , ftString, 400);
          AddField('MAINWEIGHT'   , ftString, 400);
          AddField('E1MIDPERVIEW1', ftString, 400);
          AddField('EMPNO'        , ftString, 400);
          AddField('SEQNO'        , ftString, 400);
          ClearParamInfo;
          SQL.Text := SqlText;
          Open;
          if  (TDS_Works1.recordCount > 0) And (TDS_Works.recordCount > 0) then
          begin
               DBG_works.Top     := 385;
               DBG_works.Height  := 98;
               DBG_works.DefaultRowHeight  := 35;
               DBG_works1.DefaultRowHeight := 35;
          end
          else
          if  (TDS_Works1.recordCount > 0) And (TDS_Works.recordCount <= 0) then
          begin
               DBG_works1.Top    := 288;
               DBG_works1.Height := 270;
               DBG_works.Top     := 500;
               DBG_works.Height  := 0;
          end
          else
          if  (TDS_Works1.recordCount <= 0) then
          begin
               DBG_works.Top     := 288;
               DBG_works.Height  := 200;
          end;
     end;
end;

procedure TFM_Main.Csel_Open;
begin
     Csel_ret := False;
     with TMaxDataSet_HInsa do
     begin
          Close;
          ServiceName := 'SHR0SSEL';
          ClearFieldInfo;
          AddField('SEL_DATA', ftString, 5000);
          ClearParamInfo;
          SQL.Text := Csel_SQL;
          Open;
          if  RecordCount > 0 then     Csel_ret := True;
     end;
end;

function TFM_Main.Csel_gfd(p_loc: Integer): String;
var
     v_cnt, v_tmp: Integer;
     v_data: String;
begin
     Result := '';
     v_data := TMaxDataSet_HInsa.FieldByName('SEL_DATA').AsString;
     v_cnt := 1;
     while v_cnt < p_loc do
     begin
          v_tmp := Pos(';',v_data);
          if  not(v_tmp > 0) then     Exit;
          v_cnt := v_cnt + 1;
          Delete(v_data, 1, v_tmp);
     end;
     v_tmp := Pos(';',v_data) - 1;
     if  v_tmp < 0 then     v_tmp := Length(v_data);
     Result := Copy(v_data,1,v_tmp);
end;

procedure TFM_Main.OpinionView;
var
     i, j   : integer;
     vEkind : String;
begin
     //평가의견 Read...
     if ((Ppayra = '2C') or (Ppayra = '58')) or ((Ppayra = 'C11') or (Ppayra = 'C15')) then
     begin
          with TMaxDataSet do
          begin
               vParamSQL := 'SELECT nvl(        ekind         ,'' ''),             '+
                            '       nvl(to_char(itemno       ),''0''),             '+
                            '       nvl(        itemname      ,'' ''),             '+
                            '       nvl(        itemdesc      ,'' ''),             '+
                            '       nvl(        rabasdate     ,'' '')              '+
                            '  FROM petac                                          '+
                            ' WHERE rabasdate   = '''+sRabasdate+'''               '+
                            '   AND evcno       = '+Pevcno+'                       '+
                            '   AND ekind       in (''VALUE'')   '+
                            ' ORDER BY ekind,itemno                                ';

               ServiceName := 'HINSA_select2';
               ClearFieldInfo;
               AddField('ekind'     , ftString, 400);
               AddField('itemno'    , ftString, 400);
               AddField('itemname'  , ftString, 400);
               AddField('itemdesc'  , ftString, 400);
               AddField('rabasdate' , ftString, 400);

               Close;
               SQl.Clear;
               SQL.Text := vParamSQL;           //  edit1.Text := Sql.Text;
               Open;
               On_Value.Lines.Clear;
               i := 0;
               while not TMaxDataSet.Eof do
               begin
                    if TMaxDataSet.FieldbyName('ekind').AsString <> vekind then
                    begin
                      j := 0;
                      if  (i <> 0) and (j = 0) then
                      begin
                           On_Value.text := copy(On_Value.text,1,Length(On_Value.text)-2) + ')'+#13;
                      end;
                      On_Value.Lines.Add('※ Values');  // 항목명
                      if  j = 0 then
                      begin
                           On_Value.text := On_Value.text +'('+ TMaxDataSet.FieldbyName('itemname').AsString+', ';  // 항목내용
                      end;
                      vekind           :=   TMaxDataSet.FieldbyName('ekind').AsString;
                    end
                    else
                    begin
                         On_Value.text := On_Value.text + TMaxDataSet.FieldbyName('itemname').AsString+', ';
                    end;
                    i := i+1;
                    j := j+1;
                    TMaxDataSet.Next;
               end;
               if  (On_Value.text <> null) then
                    On_Value.text := copy(On_Value.text,1,Length(On_Value.text)-2) + ')';
               close;
          end;
          with TMaxDataSet do
          begin
               vParamSQL := 'SELECT nvl(        ekind         ,'' ''),             '+
                            '       nvl(to_char(itemno       ),''0''),             '+
                            '       nvl(        itemname      ,'' ''),             '+
                            '       nvl(        itemdesc      ,'' ''),             '+
                            '       nvl(        rabasdate     ,'' '')              '+
                            '  FROM petac                                          '+
                            ' WHERE rabasdate   = '''+sRabasdate+'''               '+
                            '   AND evcno       = '+Pevcno+'                       '+
                            '   AND ekind       in (''공통역량'',''리더십역량'')   '+
                            ' ORDER BY ekind,itemno                                ';

               ServiceName := 'HINSA_select2';
               ClearFieldInfo;
               AddField('ekind'     , ftString, 400);
               AddField('itemno'    , ftString, 400);
               AddField('itemname'  , ftString, 400);
               AddField('itemdesc'  , ftString, 400);
               AddField('rabasdate' , ftString, 400);

               Close;
               SQl.Clear;
               SQL.Text := vParamSQL;           //  edit1.Text := Sql.Text;
               Open;
               On_Comp.Lines.Clear;
               i := 0;
               while not TMaxDataSet.Eof do
               begin
                    if  TMaxDataSet.FieldbyName('ekind').AsString <> vekind then
                    begin
                         j := 0;
                         if  (i <> 0) and (j = 0) then
                         begin
                              On_Comp.text := copy(On_Comp.text,1,Length(On_Comp.text)-2) + ')'+#13;
                         end;
                         //On_Comp.Lines.Add('※ '+ TMaxDataSet.FieldbyName('ekind').AsString);  // 항목명
                         On_Comp.text := On_Comp.text + '※ '+ TMaxDataSet.FieldbyName('ekind').AsString;
                         if  j = 0 then
                         begin
                              On_Comp.text := On_Comp.text +'('+ TMaxDataSet.FieldbyName('itemname').AsString+', ';  // 항목내용
                         end;
                         vekind          :=   TMaxDataSet.FieldbyName('ekind').AsString;
                    end
                    else
                    begin
                         On_Comp.text := On_Comp.text + TMaxDataSet.FieldbyName('itemname').AsString+', ';
                    end;
                    i := i+1;
                    j := j+1;
                    TMaxDataSet.Next;
               end;
               if  (On_Comp.text <> null) then
                    On_Comp.text := copy(On_Comp.text,1,Length(On_Comp.text)-2) + ')';
               close;
          end;
     end
     else
     begin
          with TMaxDataSet do
          begin
               vParamSQL := 'SELECT nvl(        ekind         ,'' ''),             '+
                            '       nvl(to_char(itemno       ),''0''),             '+
                            '       nvl(        itemname      ,'' ''),             '+
                            '       nvl(        itemdesc      ,'' ''),             '+
                            '       nvl(        rabasdate     ,'' '')              '+
                            '  FROM pehac                                          '+
                            ' WHERE rabasdate   = '''+sRabasdate+'''               '+
                            '   AND evcno       = '+Pevcno+'                       '+
                            '   AND paycl       = '''+Ppaycl+'''                   '+
                            '   AND ekind       in (''VALUE'')                     ';

               ServiceName := 'HINSA_select2';
               ClearFieldInfo;
               AddField('ekind'     , ftString, 400);
               AddField('itemno'    , ftString, 400);
               AddField('itemname'  , ftString, 400);
               AddField('itemdesc'  , ftString, 400);
               AddField('rabasdate' , ftString, 400);

               Close;
               SQl.Clear;
               SQL.Text := vParamSQL;           //  edit1.Text := Sql.Text;
               Open;

               On_Value.Lines.Clear;
               i := 0;
               while not TMaxDataSet.Eof do
               begin
                    if  TMaxDataSet.FieldbyName('ekind').AsString <> vekind then
                    begin
                         j := 0;
                         if  (i <> 0) and (j = 0) then
                         begin
                              On_Value.text := copy(On_Value.text,1,Length(On_Value.text)-2) + ')'+#13;
                         end;
                         On_Value.text := On_Value.text + '※ Values';  // 항목명
                         if  j = 0 then
                         begin
                              On_Value.text := On_Value.text +'('+ TMaxDataSet.FieldbyName('itemname').AsString+', ';  // 항목내용
                         end;
                         vekind           :=   TMaxDataSet.FieldbyName('ekind').AsString;
                    end
                    else
                    begin
                         On_Value.text := On_Value.text + TMaxDataSet.FieldbyName('itemname').AsString+', ';
                    end;
                    i := i+1;
                    j := j+1;
                    TMaxDataSet.Next;
               end;

               if  (On_Value.text <> null) then
                    On_Value.text := copy(On_Value.text,1,Length(On_Value.text)-2) + ')';

          end;
          with TMaxDataSet do
          begin
               vParamSQL := 'SELECT nvl(        ekind         ,'' ''),             '+
                            '       nvl(to_char(itemno       ),''0''),             '+
                            '       nvl(        itemname      ,'' ''),             '+
                            '       nvl(        itemdesc      ,'' ''),             '+
                            '       nvl(        rabasdate     ,'' '')              '+
                            '  FROM pehac                                          '+
                            ' WHERE rabasdate   = '''+sRabasdate+'''               '+
                            '   AND evcno       = '+Pevcno+'                       '+
                            '   AND paycl       = '''+Ppaycl+'''                   '+
                            '   AND ekind       in (''공통역량'',''리더십역량'')   '+
                            ' union all                                            '+
                            'SELECT nvl(        a.ekind         ,'' ''),           '+
                            '       nvl(to_char(b.itemno       ),''0''),           '+
                            '       nvl(        b.itemname      ,'' ''),           '+
                            '       nvl(        b.itemdesc      ,'' ''),           '+
                            '       nvl(        a.rabasdate     ,'' '')            '+
                            '  FROM peducd a, peduc b                              '+
                            ' WHERE a.rabasdate = b.rabasdate                      '+
                            '   and a.itemno    = b.itemno                         '+
                            '   and a.rabasdate = '''+sRabasdate+'''               '+
                            '   and a.jobkind   = '''+Pjobkind+'''                 '+
                            '   and a.evcno     = '+Pevcno+'                       ';
       //                     ' ORDER BY ekind,itemno                                ';

               ServiceName := 'HINSA_select2';
               ClearFieldInfo;
               AddField('ekind'     , ftString, 400);
               AddField('itemno'    , ftString, 400);
               AddField('itemname'  , ftString, 400);
               AddField('itemdesc'  , ftString, 400);
               AddField('rabasdate' , ftString, 400);

               Close;
               SQl.Clear;
               SQL.Text := vParamSQL;           //  edit1.Text := Sql.Text;
               Open;

               On_Comp.Lines.Clear;
               i := 0;
               while not TMaxDataSet.Eof do
               begin
                    if  TMaxDataSet.FieldbyName('ekind').AsString <> vekind then
                    begin
                         j := 0;
                         if   (i <> 0) and (j = 0) then
                         begin
                              On_Comp.text := copy(On_Comp.text,1,Length(On_Comp.text)-2) + ')'+#13;
                         end;
                         On_Comp.text := On_Comp.text + '※ '+ TMaxDataSet.FieldbyName('ekind').AsString;  // 항목명
                         if  j = 0 then
                         begin
                              On_Comp.text := On_Comp.text +'('+ TMaxDataSet.FieldbyName('itemname').AsString+', ';  // 항목내용
                         end;
                         vekind              :=   TMaxDataSet.FieldbyName('ekind').AsString;
                    end
                    else
                    begin
                         On_Comp.text := On_Comp.text + TMaxDataSet.FieldbyName('itemname').AsString+', ';
                    end;
                    i := i+1;
                    j := j+1;
                    TMaxDataSet.Next;
               end;

               if  (On_Comp.text <> null) then
                    On_Comp.text := copy(On_Comp.text,1,Length(On_Comp.text)-2) + ')';

          end;
     end;
     Works_data;

     with TMaxDataSet do
     begin
          vParamSQL := 'SELECT E1MIDVALVIEW, E1MIDCOMVIEW, E1MIDTOTVIEW, null, null   '+
                       '  FROM PEHREMAS                                               '+
                       ' WHERE rabasdate = '''+ sRabasdate    +'''                    '+
                       '   AND empno     = '''+ vEmpno        +'''                    ';
          ServiceName := 'HINSA_select2';
          ClearFieldInfo;
          AddField('Field1' , ftString, 400);
          AddField('Field2' , ftString, 400);
          AddField('Field3' , ftString, 400);
          AddField('Field4' , ftString, 400);
          AddField('Field5' , ftString, 400);

          Close;
          SQl.Clear;
          SQL.Text := vParamSQL;             //Memo1.Text := Sql.Text;
          Open;
          E_MIDVALVIEW.Text := Fields[0].AsString;
          E_MIDCOMVIEW.Text := Fields[1].AsString;
          E_MIDTOTVIEW.text := Fields[2].AsString;
{
          /////////////////////////////////////////////////////////////////////////
          vParamSQL := 'SELECT E1MIDTOTVIEW '+
                       '  FROM pehremas  '+
                       ' WHERE rabasdate = '''+ sRabasdate +''' '+
                       '   AND empno     = '''+ vEmpno     +''' ';
          Close;
          ServiceName := 'PTA1010B_common';
          ClearFieldInfo;
          AddField('E1MIDTOTVIEW', ftString, 2000);
          ClearParamInfo;
          SQL.Text := vParamSQL;
          Open;
          E_MIDTOTVIEW.text := FieldByName('E1MIDTOTVIEW').AsString;
}
     end;
end;

procedure TFM_Main.BT_HelpClick(Sender: TObject);
begin
     FHelp := TFHelp.Create(nil); // 도움말
     FHelp.Show;
end;

procedure TFM_Main.Ed_empnoCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
     if  Fm_EmpForm.Korname <> '' then
     begin
          Ed_empno.Text           := Fm_EmpForm.empno;
          L_korname.ValueCaption  := Fm_EmpForm.Korname;
          PFinyn                  := Fm_EmpForm.Finyn;
          Select_BaseData;
          OpinionView;
     end;
end;

procedure TFM_Main.Ed_empnoInitPopup(Sender: TObject);
begin
     Fm_EmpForm.Edit        := TOnWinPopupEdit(Sender);
     Fm_EmpForm.empno       := Ed_empno.Text;
     Fm_EmpForm.SqlOpen;
     TOnWinPopupEdit(Sender).PopupControl := Fm_EmpForm ;
end;

procedure TFM_Main.Ed_empnoKeyPress(Sender: TObject; var Key: Char);
begin
     if Key = Chr(13) then
     begin
          Select_BaseData;
          OpinionView;
          Key := #0;
     end;
end;

procedure TFM_Main.BT_PrintClick(Sender: TObject);
begin
     if  ed_empno.Text = '' then
     begin
          MessageDlg('사원을 먼저 선택해 주시기 바랍니다.', mtWarning, [mbOK], 0);
          System.Exit;
     end;

     BT_Help.Visible      := False;
     BT_Print.Visible     := False;
     BT_Exit.Visible      := False;
{//화면 그대로 출력시
     Printer.Orientation  := poLandscape;
     FM_Main.PrintScale   := poPrintToFit;
     FM_Main.Print;
}
     QuickReport1.Preview;

     BT_Help.Visible      := True;
     BT_Print.Visible     := True;
     BT_Exit.Visible      := True;
end;

procedure TFM_Main.FormShow(Sender: TObject);
begin
     FM_Tmax                 := TFM_Tmax.Create(Self);
     FM_Tmax.T_Session       := TMaxSession;
     DBG_works.Top           := 290;
     DBG_works.Height        := 200;

     E_MIDVALVIEW.Clear;
     E_MIDCOMVIEW.Clear;
     E_MIDTOTVIEW.Clear;
     Ed_empnoInitPopup(Self);
     Select_BaseData;
     OpinionView;

     if  (Pempno = Workemp1) or (Pempno = Workemp2) or (copy(Pempno,1,1) = 'D') then
     begin
          Ed_empno.ReadOnly    := False;
          Ed_empno.ButtonWidth := 24;
     end
     else
     begin
          Ed_empno.ReadOnly   := True;
          Ed_empno.ButtonWidth := 0;
          if  Fm_EmpForm.Query1.RecordCount < 1 then
          begin
               MessageDlg('프로그램 사용 권한이 없습니다.'+#13 ,mtError,[mbOK],0);
               Close;
          end;
          if  Fm_EmpForm.Query1.FieldbyName('Finyn').AsString <> 'Y' then
          begin
               MessageDlg('팀장님께서 아직 성과 Review 의견등록을 완료하지 않으셨거나'+#13+#13+
                          '성과 Review 대상자가 아닙니다.',mtError,[mbOK],0);
               BT_ExitClick(Sender);
          end;
     end;
end;

end.
