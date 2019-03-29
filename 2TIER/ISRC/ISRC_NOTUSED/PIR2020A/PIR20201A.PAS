unit PIR20201A;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, OnFocusButton, ExtCtrls, OnScheme, OnEditBaseCtrl,
  OnEditStdCtrl, DBTables, Pass, DB, OnCheckbox, OnSkinBtn, Grids, DBGrids,
  OnEditBtnCtrl, OnEditCombo,Comobj;

type
  TMainForm = class(TForm)
    SF_Main: TOnSchemeForm;
    Panel1: TPanel;
    btn_Close: TOnFocusButton;
    P_help: TStatusBar;
    btn_preview: TOnFocusButton;
    btn_Excel: TOnFocusButton;
    Database1: TDatabase;
    Panel2: TPanel;
    dbgrd_Yu: TDBGrid;
    DataSource1: TDataSource;
    btn_search: TOnFocusButton;
    e_name: TOnEdit;
    e_univ: TOnEdit;
    e_grad: TOnEdit;
    OnEdit4: TOnEdit;
    Panel3: TPanel;
    rbtn2: TRadioButton;
    rbtn3: TRadioButton;
    rbtn4: TRadioButton;
    rbtn5: TRadioButton;
    Ltotalinwon: TLabel;
    rbtn1: TRadioButton;
    OnEdit1: TOnEdit;
    Panel4: TPanel;
    rBtn_Yu: TRadioButton;
    rBtn_Mu: TRadioButton;
    cbo_Sayu: TOnComboEdit;
    Label1: TLabel;
    Label2: TLabel;
    btn_print: TOnFocusButton;
    dbgrd_Mu: TDBGrid;
    DataSource2: TDataSource;
    PB1: TProgressBar;
    cb_gubun: TOnComboEdit;
    CB_Bumun: TOnComboEdit;
    CB_JOBKIND: TOnComboEdit;
    RadioButton1: TRadioButton;
    CB_BOHUN: TOnComboEdit;
    CB_OBS: TOnComboEdit;
    qry_Recruit: TQuery;
    qry_Cnt: TQuery;
    qry_sub: TQuery;
    Edit1: TEdit;
    OnEdit2: TOnEdit;
    OnEdit3: TOnEdit;
    RadioButton2: TRadioButton;
    qry_Main: TQuery;
    FloatField1: TFloatField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    FloatField2: TFloatField;
    StringField12: TStringField;
    StringField13: TStringField;
    StringField14: TStringField;
    StringField15: TStringField;
    StringField16: TStringField;
    StringField17: TStringField;
    StringField18: TStringField;
    StringField19: TStringField;
    StringField20: TStringField;
    StringField21: TStringField;
    StringField22: TStringField;
    StringField23: TStringField;
    StringField24: TStringField;
    StringField25: TStringField;
    StringField26: TStringField;
    StringField27: TStringField;
    StringField28: TStringField;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure btn_searchClick(Sender: TObject);
    procedure RBtnChange(Sender: TObject);
    procedure GridSelect;
    procedure EditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rBtn_YuMuClick(Sender: TObject);
    procedure cbo_SayuChange(Sender: TObject);
    procedure btn_ExcelClick(Sender: TObject);
    procedure btn_printClick(Sender: TObject);
//    procedure CB_BumunChange(Sender: TObject);
    procedure CB_JOBKINDChange(Sender: TObject);
    procedure cb_gubunChange(Sender: TObject);
    procedure btn_previewClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    errorHelp : array[0..255] of char;
    p_empno   : string;
    p_korname : string;
    password  : string;
    pclass    : string;
    DBState   : string;
    strDate   : string;
    startYN   : Boolean;
    strSQL    : TStringList;
  end;
const
  xlLeft       = -4131;
  xlRight      = -4152;
  xlTop        = -4160;
  xlBottom     = -4107;
  xlNone       = 0;
  xlCenter     = -4108;
  xlContinuous = 1;
  xlThin       = 2;
  xlAutomatic  = -4105;
  xlLandscape  = 2;
  xlColorGray  = 15;
  xlColorBlue  = 5;
  xlFirstRow   = 1;
  xlFirstCol   = 0;
  Rabasdate = '20080501';
var
  MainForm: TMainForm;
  FExcel, FWorkBook, FWorkSheet : Variant;
  sSQLText : String;

implementation

uses PIR20202A;

{$R *.DFM}

procedure TMainForm.btn_CloseClick(Sender: TObject);
begin
  strSQL.Free;
  Close;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  StartYN   := True;
  P_empno   := PassEmp(cmdline,1);
  P_korname := PassEmp(cmdline,2);
  password  := PassEmp(cmdline,3);
  pclass    := PassEmp(cmdline,4);
  strSQL    := TStringList.Create;
end;

procedure TMainForm.FormPaint(Sender: TObject);
var
  i : integer;
begin
  Application.ProcessMessages;
  if StartYN then
    begin
      if Database1.Connected then Database1.Connected := False;
      for i := 0 to Database1.Params.Count - 1 do
        begin
          if System.Pos('SERVER NAME', Database1.Params[i]) > 0 then
            Database1.Params[i] := 'SERVER NAME='+PassEmp(CmdLine,13);
          if System.Pos('USER NAME', Database1.Params[i]) > 0 then
            Database1.Params[i] := 'USER NAME='+PassEmp(CmdLine,5);
          if System.Pos('PASSWORD', Database1.Params[i]) > 0 then
            Database1.Params[i] := 'PASSWORD='+PassEmp(CmdLine,6);
        end;
        Try
           Database1.Connected := True;
        EXCEPT ON E : EDataBaseError DO
          begin
            MessageBox(handle,StrPcopy(ErrorHelp,E.Message),'에  러',MB_OK or $0010);
            halt(0);
          end;
        end;
      StartYN := False;
      cb_gubun.Text    := '전    체';
      CB_GUBUN.ItemIndex := 3;

      cb_gubunChange(nil);
      CB_Bumun.ItemIndex := 0;
    end;
end;

procedure TMainForm.btn_searchClick(Sender: TObject);
var
  icnt : integer;
begin
  GridSelect;
  icnt := 1;
  strSQL.Add(' Order by rid');
  if rBtn_Yu.Checked then
  begin
     qry_Main.SQL.Text := strSQL.Text;
     qry_Main.Open;
     Ltotalinwon.Caption := IntToStr(qry_Main.recordCount);
  end
  else if rBtn_Mu.Checked then
  begin
    qry_Sub.SQL.Text := strSQL.Text;
    qry_Sub.Open;
    qry_Sub.First;
    qry_Sub.EnableControls;
    Ltotalinwon.Caption := IntToStr(qry_Sub.recordCount);
  end;
end;

procedure TMainForm.RBtnChange(Sender: TObject);
begin
  GridSelect;
  case TRadioButton(Sender).Tag of
    0: strSQL.Add(' Order by rid');
    1: strSQL.Add(' Order by gubun');
    2: strSQL.Add(' Order by DEPT');
    3: strSQL.Add(' Order by decode(engscore,''미입'',''000'',engscore) DESC ');
    4: strSQL.Add(' Order by NVL(resultuniv,''00'') DESC');
    5: strSQL.Add(' Order by NVL(resultgrd1,''00'') DESC');
    6: strSQL.Add(' Order by univid');
  end;
  if rBtn_Yu.Checked then
  begin
     qry_Main.SQL.Text := strSQL.Text;
     qry_Main.Open;
     qry_Main.First;
     Ltotalinwon.Caption := IntToStr(qry_Main.RecordCount);
  end
  else if rBtn_Mu.Checked then
  begin
    qry_Sub.SQL.Text := strSQL.Text;
    qry_Sub.Open;
    qry_Sub.First;
    Ltotalinwon.Caption := IntToStr(qry_Sub.RecordCount);
  end;
end;

procedure TMainForm.GridSelect;
var
  TempSQL : String;
begin
  if rBtn_Yu.Checked then
  begin
    with qry_Main do
      begin
        Close;
        strSQL.Clear;
        strSQL.Add('select a.rid,a.gubun,DECODE(gubun,''1'',''신입'',''2'',''경력'') gubunNM,                                                     '+ chr(13) + chr(10) +
                   '       a.dept,                                                                                                                '+ chr(13) + chr(10) +
                   '       DECODE(gubun,''1'',(select codefname from pyccode where codeid = ''C051'' and codeno = a.dept),                        '+ chr(13) + chr(10) +
                   '                    ''2'',(select codefname from pyccode where codeid = ''C052'' and codeno = a.dept),                        '+ chr(13) + chr(10) +
                   '                    ''3'',(select codefname from pyccode where (codeid = ''C051'' or codeid = ''C052'') and codeno = a.dept)) strdept,               '+ chr(13) + chr(10) +
                   '       a.aparea,decode(a.aparea,''1'',''전국'',''2'',''서울/수도권'',''3'',''충청'',''4'',''경남'',''5'',''경북'',''6'',''전남'',''7'',''전북'') apareaNM, '+  chr(13) + chr(10) +
                   '       fullname,univname,A.univmajorid, decode(A.univmajorid,''9999'',a.UNIVMAJORNAME,B.majorname) majorname,           '+ chr(13) + chr(10) +
                   '       univscore||''/''||univscoreT univscore,                                                                        '+ chr(13) + chr(10) +
                   '       round((to_number(univscore)*100)/univscoreT,2) resultuniv,	                                                  '+ chr(13) + chr(10) +
                   '       decode(univday,''1'',''주간'',''2'',''야간'',''미입'') univday,                                                '+ chr(13) + chr(10) +
                   '       decode(univwhere,''1'',''본교'',''2'',''분교'',''미입'') univwhere,                                            '+ chr(13) + chr(10) +
                   '        grd1name, A.grd1majorid, decode(A.grd1majorid,''9999'',a.Grd1MajorName,c.majorname) majorname,                  '+ chr(13) + chr(10) +
                   '       decode(grd1score,NULL,'''',(grd1score||''/''||grd1scoreT)) grd1score,                                          '+ chr(13) + chr(10) +
                   '       decode(grd1score,NULL,'''',round(to_number(grd1score)*100/to_number(grd1scoreT),2)) resultgrd1,                '+ chr(13) + chr(10) +
                   '       decode(bohun,''1'',''Y'',''2'',''N'',NULL,''미입'') bohun,                                                     '+ chr(13) + chr(10) +
                   '       nvl(engscore,''미입'') engscore,A.badunivmajorid, D.majorname,                                                 '+ chr(13) + chr(10) +
                   '       licence1name,licence2name,badunivname,badunivscore||''/''||badunivscoreT badunivscore,obsyn,                   '+ chr(13) + chr(10) +
                   '       decode(substr(regno,8,1),''1'',''M'',''5'',''M'',''7'',''M'',''2'',''F'',''6'',''F'',''8'',''F'',NULL) sex     '+ chr(13) + chr(10) +
                   '  from prectmas A,prectmaj B, prectmaj C, prectmaj D                                                                  '+ chr(13) + chr(10) +
                   ' where RID is not NULL                                                                                                '+ chr(13) + chr(10) +
                   '   and A.univmajorid = B.majorcode(+)                                                                                 '+ chr(13) + chr(10) +
                   '   and A.grd1majorid = C.majorcode(+)                                                                                 '+ chr(13) + chr(10) +
                   '   and A.badunivmajorid = D.majorcode(+)                                                                              '+ chr(13) + chr(10) +
                   '   and A.rabasdate ='''+Rabasdate+'''                                                                                      ');
        if trim(e_name.Text) <> '' then
          strSQL.Add('  and fullname LIKE ''%' + Trim(e_name.Text) + '%''');
        if trim(e_univ.Text) <> '' then
          strSQL.Add('  and univname LIKE ''%' + Trim(e_univ.Text) + '%''');
        if trim(e_grad.Text) <> '' then
          strSQL.Add('  and grd1name LIKE ''%' + Trim(e_grad.Text) + '%''');
        if cb_gubun.KeyItems[cb_gubun.ItemIndex] <> '3' then
          strSQL.Add('  and A.gubun = '''+cb_gubun.KeyItems[cb_gubun.ItemIndex]+'''');
        if CB_Bumun.KeyItems[CB_Bumun.ItemIndex] <> '0'  then
          strSQL.Add('  and A.dept = '''+CB_Bumun.KeyItems[CB_Bumun.ItemIndex]+'''');
       if CB_BOHUN.ItemIndex <> 2 then
          strSQL.Add('and BOHUN = '''+Copy(CB_BOHUN.Text,1,1)+'''');
       if CB_OBS.ItemIndex <> 2 then
          strSQL.Add('and OBSYN = '''+CB_OBS.Text+'''');
      end;
    with qry_Cnt do
    begin
       Close;
       SQL.Clear;
       SQL.Add('select count(*) rcnt from prectmas where rabasdate ='''+Rabasdate+'''');
        if trim(e_name.Text) <> '' then
          SQL.Add('  and fullname LIKE ''%' + Trim(e_name.Text) + '%''');
        if trim(e_univ.Text) <> '' then
          SQL.Add('  and univname LIKE ''%' + Trim(e_univ.Text) + '%''');
        if trim(e_grad.Text) <> '' then
          SQL.Add('  and grd1name LIKE ''%' + Trim(e_grad.Text) + '%''');
        if cb_gubun.KeyItems[cb_gubun.ItemIndex] <> '3' then
          SQL.Add('  and gubun = '''+cb_gubun.KeyItems[cb_gubun.ItemIndex]+'''');
        if CB_Bumun.KeyItems[CB_Bumun.ItemIndex] <> '0'  then
          SQL.Add('  and dept = '''+CB_Bumun.KeyItems[CB_Bumun.ItemIndex]+'''');
        //if (CB_JOBKIND.items.Count > 0) then
        //begin
        //  if (CB_JOBKIND.KeyItems[CB_JOBKIND.ItemIndex] <> '0') then
        //  SQL.Add('and APJOBKIND = '''+CB_JOBKIND.KeyItems[CB_JOBKIND.ItemIndex]+'''');
        //end;
       if CB_BOHUN.ItemIndex <> 2 then
          SQL.Add('and BOHUN = '''+Copy(CB_BOHUN.Text,1,1)+'''');
       if CB_OBS.ItemIndex <> 2 then
          SQL.Add('and OBSYN = '''+CB_OBS.Text+'''');
    end;
  end
  else if rBtn_Mu.Checked then
  begin
    with qry_Sub do
    begin
      TempSQL :=  'select DECODE(gubun,''1'',''신입'',''2'',''경력'') gubunNM, dept,                                       '+
                   '       DECODE(gubun,''1'',(select codefname from pyccode where codeid = ''C051'' and codeno = a.dept),                        '+
                   '                    ''2'',(select codefname from pyccode where codeid = ''C052'' and codeno = a.dept),                        '+
                   '                    ''3'',(select codefname from pyccode where (codeid = ''C051'' or codeid = ''C052'') and codeno = a.dept)) strdept,               '+
                  '       fullname,regno, univname,                                                                        '+
                  '       (univscore||''/''||univscoreT) univscore,                                                        '+
                  '        round((to_number(univscore)*100)/univscoreT,2) resultuniv,	                                   '+
                  '       grd1name,(grd1score||''/''||grd1scoreT) grd1score,                                               '+
                  '        decode(grd1score,NULL,'''',round(to_number(grd1score)*100/to_number(grd1scoreT),2)) resultgrd1, '+
                  '       univoutym,grd1outym,bohun,decode(bohun,''1'',''Y'',''2'',''N'') bohunNM,                         '+
                  '       nvl(engscore,''미입'') engscore ,                                                                '+
                  '       decode(armykind,''1'',''군필'',''2'',''면제'',''3'',''미필'') armykind,                          '+
                  '       ''제외연령'' sayu,                                                                               '+
                  '       licence1name,licence2name,badunivname,badunivscore||''/''||badunivscoreT badunivscore,obsyn      '+
                  'from prectmas                                                                                           ';
      case cbo_Sayu.ItemIndex of
        0:
         begin
           TempSQL := TempSQL +
                      'where (univscore < decode(univscoret,''4.50'',''3.0'',''4.3'',''2.8'',''3.0'',''2.5'',''100'',''80'')) '+
                      '  or  ((dept in (''01'',''02'',''04'',''07'',''08'') and engscore < ''800'') or (dept =''03'' and engscore < ''700'') or engscore is null)'+
                      '  or  (univid not in (select univcode from prectuni))'+
                      '  or  (univoutym > ''200502'' or grd1outym > ''200502'' )'+
                      '  or  (univmajorid not in (select majorcode from prectmaj)) ';
         end;
         1:
          begin
            TempSQL := TempSQL +
                       ' where ((substr(regno,1,2) < ''74'' and grd1id is null)           '+
                       '         or  (substr(regno,1,2) < ''72'' and grd1id is not null)) '+
//                       '  and  rabasdate =''20061201''                                      ';
                       '  and  rabasdate ='''+Rabasdate+'''                                      ';
          end;
         2:
          begin
            TempSQL := TempSQL +
                       'where ((dept in (''01'',''02'',''04'',''07'',''08'') and engscore < ''800'')'+
                       '        or (dept =''03'' and engscore < ''700'')                        '+
                       '       or engscore is null)                                            '+
//                       '  and  rabasdate =''20061201''                                           ';
                       '  and  rabasdate ='''+Rabasdate+'''                                      ';
          end;
         3:
          begin
            TempSQL := TempSQL +
                       'where  univmajorid not in (select majorcode from prectmaj)'+
//                       '  and  rabasdate =''20061201''                              ';
                       '  and  rabasdate ='''+Rabasdate+'''                                      ';
         end;
         4:
          begin
            TempSQL := TempSQL +
                       'where univscore < decode(univscoret,''4.50'',''3.0'',  '+
                       '                                     ''4.3'',''2.8'',  '+
                       '                                     ''3.0'',''2.5'',  '+
                       '                                     ''100'',''80'')   '+
  //                     '  and  rabasdate =''20061201''                           ';
                       '  and  rabasdate ='''+Rabasdate+'''                                      ';
          end;
         5:
          begin
            TempSQL := TempSQL +
                       'where univid not in (select univcode from prectuni)'+
//                       '  and  rabasdate =''20061201''                       ';
                       '  and  rabasdate ='''+Rabasdate+'''                                      ';
          end;
         6:
          begin
            TempSQL := TempSQL +
                       'where  (armykind IS NULL and armygrade is null AND armyexcept IS NULL) '+
                       '  and substr(regno,8,1) =''1''                                         '+
//                       '  and  rabasdate =''20061201''                                           ';
                       '  and  rabasdate ='''+Rabasdate+'''                                      ';
         end;
        7:
         begin
           TempSQL := TempSQL +
                      ' where (univoutym > ''200502'' or grd1outym > ''200502'') '+
//                      '  and  rabasdate =''20061201''                              ';
                       '  and  rabasdate ='''+Rabasdate+'''                                      ';
         end;
       end;
       strSQL.Add(TempSQL);
       if trim(e_name.Text) <> '' then
         strSQL.Add('  and fullname LIKE ''%' + Trim(e_name.Text) + '%''');
       if trim(e_univ.Text) <> '' then
         strSQL.Add('  and univname LIKE ''%' + Trim(e_univ.Text) + '%''');
       if trim(e_grad.Text) <> '' then
         strSQL.Add('  and grd1name LIKE ''%' + Trim(e_grad.Text) + '%''');
       if cb_gubun.KeyItems[cb_gubun.ItemIndex] <> '3' then
         strSQL.Add('  and gubun = '''+cb_gubun.KeyItems[cb_gubun.ItemIndex]+'''');
       if CB_Bumun.KeyItems[CB_Bumun.ItemIndex] <> '0'  then
         strSQL.Add('  and dept = '''+CB_Bumun.KeyItems[CB_Bumun.ItemIndex]+'''');
       //if (CB_JOBKIND.items.Count > 0) then
       //begin
       //  if (CB_JOBKIND.KeyItems[CB_JOBKIND.ItemIndex] <> '0') then
       //   strSQL.Add('and APJOBKIND = '''+CB_JOBKIND.KeyItems[CB_JOBKIND.ItemIndex]+'''');
       //end;
       if CB_BOHUN.ItemIndex <> 2 then
          strSQL.Add('and BOHUN = '''+Copy(CB_BOHUN.Text,1,1)+'''');
       if CB_OBS.ItemIndex <> 2 then
          strSQL.Add('and OBSYN = '''+CB_OBS.Text+'''');
     end;
  end;
  edit1.Text := strSQL.Text;
  //ShowMessage(strSQL.Text);
end;

procedure TMainForm.EditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    GridSelect;
    qry_Main.SQL.Text := strSQL.Text;
    qry_Main.Open;
    Ltotalinwon.Caption := IntToStr(qry_Main.RecordCount);
  end;
end;

procedure TMainForm.rBtn_YuMuClick(Sender: TObject);
begin
  if TRadioButton(Sender).Name = 'rBtn_Yu' then
  begin
    dbgrd_Yu.Visible := True;
    dbgrd_Mu.Visible := False;
    cbo_Sayu.Visible := False;
  end
  else if  TRadioButton(Sender).Name = 'rBtn_Mu' then
  begin
    dbgrd_Mu.Visible := True;
    dbgrd_Yu.Visible := False;
    cbo_Sayu.Visible := True;
  end;
  MainForm.Repaint;
end;

procedure TMainForm.cbo_SayuChange(Sender: TObject);
begin
  GridSelect;
  qry_Sub.SQL.Text := strSQL.Text;
  qry_Sub.Open;
  qry_Sub.First;
  Ltotalinwon.Caption := IntToStr(qry_Sub.RecordCount);
end;

procedure TMainForm.btn_ExcelClick(Sender: TObject);
var
  i, j : integer;
  qry_Sel : TQuery;
  qry_GRD : TDBGRID;
begin
  if not qry_Main.Active then
  begin
    MessageDlg('조회 먼저 하세요. '+#13+#10+''+#13+#10+'조회된 데이터가 엑셀로 출력됩니다.', mtWarning, [mbOK], 0);
    System.Exit;
  end;
  if rBtn_Yu.Checked then
  begin
   qry_Sel := qry_Main;
   qry_GRD := dbgrd_Yu;
  end
  else if rBtn_Mu.Checked then
  begin
    qry_Sel := qry_Sub;
    qry_GRD := dbgrd_Mu;
  end;

  PB1.Max := qry_Sel.RecordCount;
  try
  FExcel := CreateOLEObject('Excel.Application');          //엑셀을 실행
  except on E: EOleSysError do
    begin
      try
        FExcel := CreateOLEObject('Excel.Application');          //엑셀을 실행
      except
        MessageDlg('Excel이 설치되어 있지 않습니다.', MtWarning, [mbok], 0);
        FExcel.Free;
        Exit;
      end;
    end;
  end;

  FWorkBook  := FExcel.WorkBooks.Add;
  FWorkSheet := FWorkBook.WorkSheets.Add;
  FExcel.Columns.AutoFit;
  Application.ProcessMessages;
  with qry_Sel do
  begin
     if Active = False then
     begin
       showmessage('조회먼저하세요!');
       system.Exit;
     end;
  // FExcel.Visible := True;
    DisableControls;
    for i := 1 to qry_Sel.FieldCount do
    begin
      FWorkSheet.Cells[1 , i] :=  qry_Sel.Fields[i-1].DisplayName;
      Next;
    end;
    First;
    for i := xlFirstRow + 1 to  recordCount + 1 do
    begin
      for j := 1 to qry_Sel.FieldCount do
      begin
        if Fields[j - 1].DataType = ftFloat then
          FWorkSheet.Cells[i, j] := FieldByName(Fields[j - 1].FieldName).AsFloat
        else
         FWorkSheet.Cells[i, j] := FieldByName(Fields[j - 1].FieldName).AsString;
        PB1.Position := i;
      end;
    Next;
    end;
    qry_Sel.First;
    EnableControls;
    PB1.Position := 0;
    FExcel.Range['A1'].Select;
   // FExcel.Selection.NumberFormatLocal := '0000';
   // FExcel.Selection.HorizontalAlignment := xlRight;
  end;
  FExcel.Visible := True;
  FExcel.DisplayAlerts := False;
end;

procedure TMainForm.btn_printClick(Sender: TObject);
begin
   PrintForm.Report1.Print;
end;
{
procedure TMainForm.CB_BumunChange(Sender: TObject);
begin
  CB_JOBKIND.Items.Clear;
  CB_JOBKIND.KeyItems.Clear;
  CB_JOBKIND.Enabled := True;
  CB_JOBKIND.Text := '전체선택';
  case StrToInt(CB_Bumun.KeyItems[CB_Bumun.itemindex]) of
    1: begin
         CB_JOBKIND.Items.Add('10: 경영기획');
         CB_JOBKIND.KeyItems.Add('10');
         CB_JOBKIND.Items.Add('11: 경영지원');
         CB_JOBKIND.KeyItems.Add('11');
         CB_JOBKIND.Items.Add('12: Finance');
         CB_JOBKIND.KeyItems.Add('12');
         CB_JOBKIND.Items.Add('전체선택');
         CB_JOBKIND.KeyItems.Add('0');
       end;
    2: begin
         CB_JOBKIND.Items.Add('20: 마케팅');
         CB_JOBKIND.KeyItems.Add('20');
         CB_JOBKIND.Items.Add('전체선택');
         CB_JOBKIND.KeyItems.Add('0');
       end;
    3: begin
         CB_JOBKIND.Items.Add('30: NW계획');
         CB_JOBKIND.KeyItems.Add('30');
         CB_JOBKIND.Items.Add('31: NW운용');
         CB_JOBKIND.KeyItems.Add('31');
         CB_JOBKIND.Items.Add('32: 영업기술지원');
         CB_JOBKIND.KeyItems.Add('32');
         CB_JOBKIND.Items.Add('33: IT');
         CB_JOBKIND.KeyItems.Add('33');
         CB_JOBKIND.Items.Add('전체선택');
         CB_JOBKIND.KeyItems.Add('0');
       end;
    4: begin
         CB_JOBKIND.Items.Add('40: 연구개발');
         CB_JOBKIND.KeyItems.Add('40');
         CB_JOBKIND.Items.Add('전체선택');
         CB_JOBKIND.KeyItems.Add('0');
       end;
    7: begin
         CB_JOBKIND.Items.Add('70: 보안CERT');
         CB_JOBKIND.KeyItems.Add('70');
         CB_JOBKIND.Items.Add('71: EDW');
         CB_JOBKIND.KeyItems.Add('71');
         CB_JOBKIND.Items.Add('72: ERP');
         CB_JOBKIND.KeyItems.Add('72');
         CB_JOBKIND.Items.Add('전체선택');
         CB_JOBKIND.KeyItems.Add('0');
       end;
    8: begin
         CB_JOBKIND.Items.Add('80: 사업');
         CB_JOBKIND.KeyItems.Add('80');
         CB_JOBKIND.Items.Add('81: 컨텐츠');
         CB_JOBKIND.KeyItems.Add('81');
         CB_JOBKIND.Items.Add('전체선택');
         CB_JOBKIND.KeyItems.Add('0');         
       end;
    0: begin
         CB_JOBKIND.Items.Clear;
         CB_JOBKIND.Text := '';
         CB_JOBKIND.Enabled := False;
       end;
  end;
 // btn_searchClick(Sender);
end;
}
procedure TMainForm.CB_JOBKINDChange(Sender: TObject);
begin
//  btn_searchClick(Sender);
end;

procedure TMainForm.cb_gubunChange(Sender: TObject);
begin
  CB_Bumun.Items.Clear;
  CB_Bumun.KeyItems.Clear;
  case StrToInt(CB_Gubun.KeyItems[CB_Gubun.itemindex]) of
    1: begin
            CB_Bumun.Items.Add('전체선택');
            CB_Bumun.KeyItems.Add('0');

            with qry_Cnt do
            begin
                 Close;
                 SQL.Clear;
                 SQL.Add(' SELECT * FROM pyccode WHERE codeid=''C051'' and useyn = ''Y'' order by codeno  ');
                 Open;

                 While Not Eof do
                 begin
                      CB_Bumun.Items.Add(FieldByName('codeno').AsString + ': ' + FieldByName('codefname').AsString);
                      CB_Bumun.KeyItems.Add(FieldByName('codeno').AsString);
                      Next;
                 end;
            end;
         end;
    2: begin
            CB_Bumun.Items.Add('전체선택');
            CB_Bumun.KeyItems.Add('0');

            with qry_Cnt do
            begin
                 Close;
                 SQL.Clear;
                 SQL.Add(' SELECT * FROM pyccode WHERE codeid=''C052'' and useyn = ''Y'' order by codeno ');
                 Open;

                 While Not Eof do
                 begin
                      CB_Bumun.Items.Add(FieldByName('codeno').AsString + ': ' + FieldByName('codefname').AsString);
                      CB_Bumun.KeyItems.Add(FieldByName('codeno').AsString);
                      Next;
                 end;
            end;
       end;
    3: begin
            CB_Bumun.Items.Add('전체선택');
            CB_Bumun.KeyItems.Add('0');

            with qry_Cnt do
            begin
                 Close;
                 SQL.Clear;
                 SQL.Add(' SELECT * FROM pyccode WHERE (codeid=''C051'' or codeid=''C052'')  and useyn = ''Y'' order by codeid, codeno ');
                 Open;

                 While Not Eof do
                 begin
                      CB_Bumun.Items.Add(FieldByName('codeno').AsString + ': ' + FieldByName('codefname').AsString);
                      CB_Bumun.KeyItems.Add(FieldByName('codeno').AsString);
                      Next;
                 end;
            end;
       end;
  end;
end;

procedure TMainForm.btn_previewClick(Sender: TObject);
begin
  PrintForm.Report1.Preview;
end;

end.
