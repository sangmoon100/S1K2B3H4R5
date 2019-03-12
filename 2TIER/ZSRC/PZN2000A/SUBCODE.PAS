unit SubCode;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, OnFocusButton, ExtCtrls, OnShapeLabel,
  OnEditBaseCtrl, OnEditStdCtrl, Grids, DBGrids, Db, MemDS, DBAccess, Ora,
  OnEditBtnCtrl, OnEditMdate, OnEditNumCtl, OnEditCombo,
  Func, comobj, OnScheme; //엑셀..

type
  TFM_code = class(TForm)
    Qry_code: TOraQuery;
    Qry_codeCODEID: TStringField;
    Qry_codeCODENO: TStringField;
    Qry_codeCODENAME: TStringField;
    Qry_codeUSEYN: TStringField;
    Qry_codeCODEORDER: TIntegerField;
    Qry_codeCODEREGDAY: TStringField;
    Qry_codeWRITETIME: TStringField;
    Qry_codeWRITEMAN: TStringField;
    DataSource1: TDataSource;
    OnShapeLabel1: TOnShapeLabel;
    L_CurDate: TLabel;
    OnShapeLabel2: TOnShapeLabel;
    OnShapeLabel3: TOnShapeLabel;
    L_writeman: TOnShapeLabel;
    L_writetime: TOnShapeLabel;
    OnShapeLabel4: TOnShapeLabel;
    OnShapeLabel5: TOnShapeLabel;
    OnShapeLabel6: TOnShapeLabel;
    OnShapeLabel7: TOnShapeLabel;
    OnShapeLabel8: TOnShapeLabel;
    OnShapeLabel9: TOnShapeLabel;
    P_helpinfo: TStatusBar;
    RadioButton1: TRadioButton;
    Rbtn_Y: TRadioButton;
    Rbtn_N: TRadioButton;
    DBG_user: TDBGrid;
    E_codeno: TOnEdit;
    E_codename: TOnEdit;
    E_UseYN: TOnComboEdit;
    ME_coderegday: TOnEdit;
    cbx_codeid: TOnComboEdit;
    SF_Main: TOnSchemeForm;
    ED_codename: TOnEdit;
    ED_codeno: TOnEdit;
    E_Codeid: TOnComboEdit;
    OnShapeLabel10: TOnShapeLabel;
    BB_exit: TOnFocusButton;
    BB_cancel: TOnFocusButton;
    BB_save: TOnFocusButton;
    BB_delete: TOnFocusButton;
    BB_input: TOnFocusButton;
    BB_Excel: TOnFocusButton;
    bb_find: TOnFocusButton;
    OnShapeLabel11: TOnShapeLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ED_codenoKeyPress(Sender: TObject; var Key: Char);
    procedure ED_codenameKeyPress(Sender: TObject; var Key: Char);
    procedure Rbtn_YClick(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure BB_inputClick(Sender: TObject);
    procedure BB_deleteClick(Sender: TObject);
    procedure BB_saveClick(Sender: TObject);
    procedure BB_cancelClick(Sender: TObject);
    procedure BB_ExcelClick(Sender: TObject);
    procedure BB_exitClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    function  fQryCheck : Boolean;
    procedure Update_Retdate;
    procedure cbx_codeidChange(Sender: TObject);
    procedure bb_findClick(Sender: TObject);
    procedure ED_codenameMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ME_coderegdayMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure E_codenameMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure OnShapeLabel2MouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
  private
    { Private declarations }
    FL_OPstate: Integer; {0:비어있는상태, 1:입력상태, 2:열람상태}
    FL_LastCodeno: string;
    FL_sysdate : String;
  public
    { Public declarations }
    procedure Select_Query;

  end;

var
  FM_code: TFM_code;

implementation

uses PZN2000A1;

{$R *.DFM}

procedure TFM_code.Select_Query;
var
  SearchOptions: TLocateOptions;
begin
  FL_OPstate := 2; {열람상태}
  P_helpinfo.SimpleText := '해당 코드분류의 자료를 조회하고 있습니다.';
  Application.ProcessMessages;

  with Qry_code do
  begin
       Close;
       SQL.Clear;
       Sql.Add('    Select CODEID,                                        ');
       Sql.Add('           CODENO,                                        ');
       Sql.Add('           CODENAME,                                      ');
       Sql.Add('           USEYN,                                         ');
       Sql.Add('           CODEORDER,                                     ');
       Sql.Add('           CODEREGDAY,                                    ');
       Sql.Add('           WRITETIME,                                     ');
       Sql.Add('           WRITEMAN                                       ');
       Sql.Add('      From PZSUBCODE                                      ');
       Sql.Add('     Where codeid =  '''+ Copy(E_codeid.Text,1,4) +'''    ');

       if ED_codeno.Text <> '' then
          Sql.Add('  And CODENO LIKE '''+ED_codeno.Text+'%'+'''         ');

       if ED_codename.Text <> '' then
          Sql.Add('  And CODENAME LIKE '''+'%'+ED_codename.Text+'%'+''' ');

       if Rbtn_Y.Checked = True then
          Sql.Add('  And USEYN  = ''Y''                                 ');

       if Rbtn_N.Checked = True then
          Sql.Add('  And USEYN  = ''N''                                 ');

       Sql.Add('     ORDER BY CODEID, CODEORDER, CODENO               ');
       Open;

       if RecordCount = 0 then
            P_helpinfo.SimpleText := '해당 코드분류의 자료가 없습니다.'
       else
       begin
            if FL_LastCodeno <> '' then
            begin
                 SearchOptions := [loPartialKey];
                 if Qry_code.Locate('CODENO', FL_LastCodeno, SearchOptions) then
                      DBG_user.SetFocus;
            end;
            P_helpinfo.SimpleText := '해당 코드분류의 자료가 조회되었습니다.';
       end;
  end;
end;

procedure TFM_code.Rbtn_YClick(Sender: TObject);
begin
  Select_Query;
end;

procedure TFM_code.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Qry_code.Close;
  Action := CaFree;
end;

procedure TFM_code.FormShow(Sender: TObject);
begin
  FM_code.Left := FM_MainMenu.Left + 45;
  FM_code.Top  := FM_MainMenu.Top  + 55;
  Application.ProcessMessages;

  FL_sysdate := Fn_GetDateTimeStr;
  L_CurDate.Caption := Copy(FL_sysdate,1,4)+'-'+
                       Copy(FL_sysdate,5,2)+'-'+
                       Copy(FL_sysdate,7,2);

  cbx_codeidChange(Sender);

  P_helpinfo.SimpleText := '추가 버튼을 클릭후 입력하세요';
  ED_codeno.SetFocus;
end;

procedure TFM_code.ED_codenoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key <> #13 then     System.Exit;
  Key := #0;
  Select_Query;
end;

procedure TFM_code.ED_codenameKeyPress(Sender: TObject; var Key: Char);
begin
  if Key <> #13 then     System.Exit;
  Key := #0;
  Select_Query;
end;                            

procedure TFM_code.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  E_codeno.Text      := Qry_codeCODENO.AsString;
  E_codename.Text    := Qry_codeCODENAME.AsString;
  ME_coderegday.Text := Copy(Qry_codeCODEREGDAY.AsString,1,4)+'-'+
                        Copy(Qry_codeCODEREGDAY.AsString,5,2)+'-'+
                        Copy(Qry_codeCODEREGDAY.AsString,7,2);

  if Qry_codeWRITETIME.AsString <> '' then
       L_writetime.ValueCaption := Copy(Qry_codeWRITETIME.AsString,1,4)+'.'+
                                   Copy(Qry_codeWRITETIME.AsString,5,2)+'.'+
                                   Copy(Qry_codeWRITETIME.AsString,7,2)+' '+
                                   Copy(Qry_codeWRITETIME.AsString,9,2)+':'+
                                   Copy(Qry_codeWRITETIME.AsString,11,2)+':'+
                                   Copy(Qry_codeWRITETIME.AsString,13,2)
  else
       L_writetime.ValueCaption := '';

  with FM_MainMenu.Ora_Qry1 do
  begin
       close;
       Sql.Clear;
       Sql.Add('Select korname From pimpmas                        ');
       Sql.Add(' Where empno = '''+ Qry_codeWRITEMAN.AsString +''' ');
       Open;
       
       L_WRITEMAN.ValueCaption := Qry_codeWRITEMAN.AsString+' - '+
                                  FieldByName('korname').AsString;;
  end;
  if Copy(Qry_codeWRITEMAN.AsString,1,1) = 'D' then L_WRITEMAN.ValueCaption := '초기설정';

  E_UseYN.Text := '';
  if Qry_codeUSEYN.AsString = 'Y' then       E_UseYN.ItemIndex := 0
  else if  Qry_codeUSEYN.AsString ='N' then  E_UseYN.ItemIndex := 1;

  P_helpinfo.SimpleText := '';
  if Qry_code.BOF then       P_helpinfo.SimpleText := '자료의 처음입니다.'
  else if Qry_code.EOF then  P_helpinfo.SimpleText := '자료의 마지막입니다.';

  FL_OPstate := 2; {열람상태} 
end;

procedure TFM_code.BB_inputClick(Sender: TObject);
begin
  FL_OPstate               := 1; {입력상태}
  P_helpinfo.SimpleText    := '새로운 자료를 등록하십시요.';
  E_codeno.Text            := '';
  E_codename.Text          := '';
  L_writetime.ValueCaption := '';
  L_WRITEMAN.ValueCaption  := '';
  E_UseYN.Text             := 'Y';
  E_codeno.Enabled         := True;
  E_codeno.SetFocus;
  ME_coderegday.Text       := Copy(FL_sysdate,1,4)+'-'+
                              Copy(FL_sysdate,5,2)+'-'+
                              Copy(FL_sysdate,7,2);
end;

procedure TFM_code.BB_deleteClick(Sender: TObject);
var
  Save_codeid, Save_codeno, Jump_codeno: string;
  SearchOptions: TLocateOptions;
begin
  if fQryCheck = False then
  begin
       MessageBox(HAndle, '사용중인 자료가 있으므로 삭제 불가합니다.', '경고', MB_ICONWARNING);
       Exit;
  end;

  if FL_OPstate <> 2 then {열람상태가 아니면}
  begin
       P_helpinfo.SimpleText := '선택된 자료가 없으므로 삭제할 수 없습니다.';
       System.Exit;
  end;

  if Application.MessageBox('정말 삭제하시겠습니까?', '확인',
                            MB_OKCANCEL + MB_DEFBUTTON1) = 2 then system.Exit;

  try
       Save_codeid := Copy(E_codeid.Text,1,4);
       Save_codeno := E_codeno.Text;
       Qry_code.Next;
       if Qry_code.eof then
       begin
            Qry_code.Prior;
            Jump_codeno := Qry_codeCODENO.AsString;
       end
       else
       begin
            Jump_codeno := Qry_codeCODENO.AsString;
       end;

       with FM_MainMenu.Ora_Qry1 do
       begin
            Close;
            SQL.Clear;
            Sql.Add('DELETE From PZSUBCODE                  ');
            Sql.Add(' Where CODEID = '''+ Save_codeid +'''  ');
            Sql.Add('   And CODENO = '''+ Save_codeno +'''  ');
            EXECSQL;
       end;
       FL_LastCodeno := '';
       Select_Query;

       SearchOptions := [loPartialKey];
       if Qry_code.Locate('CODENO', Jump_codeno, SearchOptions) then
            DBG_user.SetFocus;

       P_helpinfo.SimpleText := '기존자료가 삭제되었습니다.';
  except on E: Exception do
       begin
            MessageDlg(E.Message, mtError, [mbOk], 0);
            BB_cancelClick(Sender);
       end;
  end;

end;

procedure TFM_code.BB_saveClick(Sender: TObject);
begin
  if (FL_OPstate    = 0 ) or
     (E_codeid.Text = '') or
     (E_codeno.Text = '') then  {비어있는상태}
  begin
       System.Exit;
       P_helpinfo.SimpleText := '자료가 없어 저장할 수 없습니다.';
  end;

  try
       if FL_OPstate = 1 then {입력상태}
       begin
            with FM_MainMenu.Ora_Qry1 do
            begin
                 Close;
                 SQL.Clear;
                 Sql.Add('Select CODENO                                   ');
                 Sql.Add('  From PZSUBCODE                                ');
                 Sql.Add(' Where CODEID = '''+Copy(E_codeid.Text,1,4)+''' ');
                 Sql.Add('   And CODENO = '''+E_codeno.Text+'''           ');
                 Open;
                 if RecordCount > 0 then
                 begin
                      Close;
                      MessageBox(HAndle, '이미 코드가 존재합니다.', '입력오류', MB_ICONWARNING);
                      System.Exit;
                 end;
            end;

            FL_LastCodeno := E_codeno.Text;
            with FM_MainMenu.Ora_Qry1 do
            begin
                 Close;
                 SQL.Clear;
                 Sql.Add('INSERT INTO PZSUBCODE (CODEID,       ');
                 Sql.Add('                       CODENO,       ');
                 Sql.Add('                       CODENAME,     ');
                 Sql.Add('                       CODEREGDAY,   ');
                 Sql.Add('                       WRITETIME,    ');
                 Sql.Add('                       WRITEMAN,     ');
                 Sql.Add('                       USEYN       ) ');
                 Sql.Add('             VALUES  (:Pcodeid,      ');
                 Sql.Add('                      :Pcodeno,      ');
                 Sql.Add('                      :Pcodename,    ');
                 Sql.Add('                      :Pcoderegday,  ');
                 Sql.Add('                      :Pwritetime,   ');
                 Sql.Add('                      :PWRITEMAN,    ');
                 Sql.Add('                      :Puseyn      ) ');
                 ParamByName('Pcodeid').AsString    := Copy(E_codeid.Text,1,4);
                 ParamByName('Pcodeno').AsString    := E_codeno.Text;
                 ParamByName('Pcodename').AsString  := E_codename.Text;
                 ParamByName('Pcoderegday').AsString:= Copy(ME_coderegday.Text,1,4)+
                                                       Copy(ME_coderegday.Text,6,2)+
                                                       Copy(ME_coderegday.Text,9,2);
                 ParamByName('Pwritetime').AsString := Fn_GetDateTimeStr;
                 ParamByName('PWRITEMAN').AsString  := FM_MainMenu.FG_Empno;
                 ParamByName('PuseYN').AsString     := E_UseYN.Text;
                 EXECSQL;
                 Select_Query;
                 P_helpinfo.SimpleText := '새로운 자료를 입력했습니다.';
            end;
       end
       else  //{수정상태}
       begin
            if E_codeno.Text = Qry_codeCODENO.AsString then {내용만 변경}
            begin
                 if fQryCheck = False then
                     if Application.MessageBox('이미 사용하고 있는 코드입니다. 그래도, 수정하시겠습니까?', '확인',
                                                MB_OKCANCEL + MB_DEFBUTTON1) = 2 then system.Exit;

                 if (Copy(E_codeid.Text,1,4) = 'A001') And (E_UseYN.Text = 'N') then
                 begin
                      if Application.MessageBox('동일회사에 재직중인 사원은 퇴직처리됩니다. 수정하시겠습니까?', '확인',
                                                 MB_OKCANCEL + MB_DEFBUTTON1) = 2 then system.Exit;
                 end;
                 
                 FL_LastCodeno := E_codeno.Text;

                 with FM_MainMenu.Ora_Qry1 do
                 begin
                      Close;
                      SQL.Clear;
                      Sql.Add('Update PZSUBCODE                 ');
                      Sql.Add('   SET CODENAME  =:Pcodename,    '); // CODEORDER =:Pcodeorder, ');
                      Sql.Add('       WRITETIME =:Pwritetime,   ');
                      Sql.Add('       WRITEMAN  =:PWRITEMAN,    ');
                      Sql.Add('       USEYN     =:Puseyn        ');
                      Sql.Add(' Where CODEID    =:Pcodeid       ');
                      Sql.Add('   And CODENO    =:Pcodeno       ');
                      ParamByName('Pcodeid').AsString     := Copy(E_codeid.Text,1,4);
                      ParamByName('Pcodeno').AsString     := E_codeno.Text;
                      ParamByName('Pcodename').AsString   := E_codename.Text;
                      ParamByName('Pwritetime').AsString  := Fn_GetDateTimeStr;
                      ParamByName('PWRITEMAN').AsString   := FM_MainMenu.FG_Empno;
                      ParamByName('PuseYN').AsString      := E_UseYN.Text;
                      EXECSQL;

                      Select_Query;

                      if (Copy(E_codeid.Text,1,4) = 'A001') And (E_UseYN.Text = 'N') then
                         Update_Retdate;

                      P_helpinfo.SimpleText := '기존의 자료를 수정했습니다.';
                 end;
            end
            else   //코드변경
            begin
                 if (Copy(E_codeid.Text,1,4) = 'A001') And (E_UseYN.Text = 'N') then
                 begin
                      if Application.MessageBox('동일회사에 재직중인 사원은 퇴직처리됩니다. 수정하시겠습니까?', '확인',
                                                 MB_OKCANCEL + MB_DEFBUTTON1) = 2 then system.Exit;
                 end;
                             
                 with FM_MainMenu.Ora_Qry1 do
                 begin
                      Close;
                      SQL.Clear;
                      Sql.Add('Select CODENO                                   ');
                      Sql.Add('  From PZSUBCODE                                ');
                      Sql.Add(' Where CODEID = '''+ Copy(E_codeid.Text,1,4)+'''');
                      Sql.Add('   And CODENO = '''+ E_codeno.Text+'''          ');
                      Open;
                      if RecordCount > 0 then
                      begin
                           Close;
                           MessageBox(HAndle, '이미 코드가 존재합니다.', '입력오류', MB_ICONWARNING);
                           System.Exit;
                      end;

                      FL_LastCodeno := E_codeno.Text;
                      Close;
                      SQL.Clear;
                      Sql.Add('Update PZSUBCODE               ');
                      Sql.Add('   SET CODENO   = :PNEWcodeno, ');
                      Sql.Add('       CODENAME = :Pcodename,  ');
                      Sql.Add('       WRITETIME= :Pwritetime, ');
                      Sql.Add('       WRITEMAN = :PWRITEMAN   ');
                      Sql.Add(' Where CODEID = :Pcodeid       ');
                      Sql.Add('   And CODENO = :POLDcodeno    ');
                      ParamByName('Pcodeid').AsString    := Copy(E_codeid.Text,1,4);
                      ParamByName('POLDcodeno').AsString := Qry_codeCODENO.AsString;
                      ParamByName('PNEWcodeno').AsString := E_codeno.Text;
                      ParamByName('Pcodename').AsString  := E_codename.Text;
                      ParamByName('Pwritetime').AsString := Fn_GetDateTimeStr;
                      ParamByName('PWRITEMAN').AsString  := FM_MainMenu.FG_Empno;
                      ParamByName('PuseYN').AsString     := E_UseYN.Text;
                      EXECSQL;

                      Select_Query;

                      if (Copy(E_codeid.Text,1,4) = 'A001') And (E_UseYN.Text = 'N') then
                         Update_Retdate;
                         
                      P_helpinfo.SimpleText := '새로운 코드로 변경되었습니다.';
                 end;
            end;
       end;

       E_codeno.Enabled := False
  except on E: Exception do
       begin
            MessageDlg(E.Message, mtError, [mbOk], 0);
            BB_cancelClick(Sender);
       end;
  end;
end;

procedure TFM_code.BB_cancelClick(Sender: TObject);
begin
  FL_OPstate               := 0; {비어있는상태}
  ED_codeno.Text           := '';
  ED_codename.Text         := '';
  E_codeno.Text            := '';
  E_codename.Text          := '';
  L_writetime.ValueCaption := '';
  L_WRITEMAN.ValueCaption  := '';

  ME_coderegday.Text       := Copy(FL_sysdate,1,4)+
                              Copy(FL_sysdate,6,2)+
                              Copy(FL_sysdate,9,2);
  Select_Query;

  P_helpinfo.SimpleText    := '';
  E_codeno.Enabled         := False;
end;

procedure TFM_code.BB_ExcelClick(Sender: TObject);
var XL, XArr: Variant;
    i,k: integer;
begin
  if Qry_code.RecordCount < 1 then
  begin
       showmessage('엑셀 변환할 자료가 없습니다.');
       exit;
  end;

  XArr := VarArrayCreate([1, 4], VarVariant);
  try
       XL := CreateOLEObject('Excel.Application');
  except
       MessageDlg('Excel이 설치되어 있지 않습니다.', MtWarning, [mbok], 0);
       Exit;
  end;
  screen.cursor := crHourGlass;

  XL.WorkBooks.Add; //새로운 페이지 생성
  XL.Visible            := false;
  XL.WorkSheets[1].Name := 'Code List';  //시트명 부여
  XL.Range['A1:E2'].Merge;               //셀 병합

  //TITLE NAME 설정
  XL.Range['A1'].value := '코드내역 리스트';
  XL.Range['A1'].font.Size := 16;

  //컬럼명 지정_서브타이블 지정
  XArr[1] := '코드ID';
  XArr[2] := '코드';
  XArr[3] := '코드명';
  XArr[4] := '사용여부';
  XL.Range['A3' , 'D3'].Value := XArr;
  k := 3;
  for i := 1 to 4 do
  begin
       XL.Range[CHR(64 + i) + '3'].HorizontalAlignment := 3;
       XL.Range[CHR(64 + i) + '3'].Interior.Color:= $00CBF0B3;
       XL.Range[CHR(64 + i) + '3'].font.Size := 10;
       XL.Range[CHR(64 + i) + '3'].font.Bold := True;
  end;

  //검색된 자료를 excel에 export처리 시킨다.
  Qry_code.First;

  for i := 1 to  Qry_code.RecordCount do
  begin
       if Qry_code.FieldbyName('CODEID').AsString = 'A001' then
            XArr[1] := Qry_code.FieldbyName('CODEID').AsString + '-' + '회사코드'
       else XArr[1] := Qry_code.FieldbyName('CODEID').AsString;
       XArr[2] := Qry_code.FieldbyName('CODENO').AsString;
       XArr[3] := Qry_code.FieldbyName('CODENAME').AsString;;
       XArr[4] := Qry_code.FieldbyName('USEYN').AsString;;
       XL.Range['A' + IntToStr(k+1), 'D' + IntToStr(k+1)].Value := XArr;
       inc(k);
       Qry_code.Next;
  end;

  //여기서 부터는 EXPORT된 EXCEL자료를 예쁘게 꾸미는 부분입니다.
  XL.Range['A1', 'D' + IntToStr(k)].Borders.LineStyle := 1;    //테두리선을 만든다.  1은 실선
  XL.Range['A1', 'D' + IntToStr(k)].Borders.Weight := 2;       //테두리선 두깨 설정  2는 보통두깨, 3은 무지 두꺼움
  XL.Range['A1', 'D' + IntToStr(k)].Borders.ColorIndex := 1;   //테두리선 색상설정  1은 검은색
  XL.Range['A1', 'D' + IntToStr(k)].font.name := '굴림체';
  XL.Range['A1', 'A1'].HorizontalAlignment := 3;               //가운데 정렬
  XL.Range['A3', 'D' + IntToStr(k)].font.Size := 9;
  XL.Range['B3', 'C' + IntToStr(k)].HorizontalAlignment := 2;  //좌측정렬
  XL.Range['D3', 'D' + IntToStr(k)].HorizontalAlignment := 1;  //우측정렬
  XL.Range['A1', 'D' + IntToStr(k)].Select;                    //자료를 모두 Select한 후 --하는 이유:  AutoFit 처리하기 위해서임
  XL.Selection.Columns.AutoFit;                                //자동정렬
  XL.Range['A4', 'A4'].Select;                                 //A4열에 커서 위치시킴
  XL.Visible    := true;                                       //엑셀자료 보여줌
  Screen.Cursor := crDefault;
end;

procedure TFM_code.BB_exitClick(Sender: TObject);
begin
  Close;
end;

//----------------------------------------------------------
// 회사코드를 사용하고 있는 user가 있을시에는 삭제 불가 처리
//----------------------------------------------------------
Function TFM_code.fQryCheck : Boolean;
begin
  with FM_MainMenu.Ora_Qry1 do
  begin
       Close;
       SQL.Clear;
       Sql.Add('Select COMCODE                                   ');
       Sql.Add('  From PZSUBMAS                                  ');
       Sql.Add(' Where COMCODE = ''' + E_codeno.Text + '''       ');
       Open;

       if RecordCount = 0 then Result := True
       else                    Result := False;
  end;
end;

//-----------------------------------------------------------------
// 회사코드가 미사용으로 수정될 경우 회사 직원 정보는 퇴사자로 처리
//-----------------------------------------------------------------
procedure TFM_code.Update_Retdate;
begin
  with FM_MainMenu.Ora_Qry1 do
  begin
       Close;
       SQL.Clear;
       Sql.Add('Update PZSUBMAS                                          ');
       Sql.Add('   SET Retdate   = To_Char(Sysdate,''YYYYMMDD''),        ');
       Sql.Add('       WRITETIME = To_Char(Sysdate,''yyyymmddhh24miss''),');
       Sql.Add('       WRITEMAN  = '''+ FM_MainMenu.FG_Empno +'''        ');
       Sql.Add(' Where COMCODE   = '''+ E_codeno.Text        +'''        ');
       EXECSQL;

       P_helpinfo.SimpleText := '퇴직처리 완료되었습니다.';
  end;
end;

procedure TFM_code.cbx_codeidChange(Sender: TObject);
begin
  if cbx_codeid.ItemIndex = 0 then ED_codename.EditLabel.Caption := '회사명'
  else                             ED_codename.EditLabel.Caption := '코드명';
  
  Select_Query;
end;

procedure TFM_code.bb_findClick(Sender: TObject);
begin
  Select_Query;
end;

procedure TFM_code.ED_codenameMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if cbx_codeid.ItemIndex = 0 then ED_codename.Hint   := '회사명'
  else                             ED_codename.Hint   := '코드명'       ;
end;

procedure TFM_code.ME_coderegdayMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if cbx_codeid.ItemIndex = 0 then ME_coderegday.Hint := '정보등록일'
  else                             ME_coderegday.Hint := '코드등록일'   ;
end;

procedure TFM_code.E_codenameMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if cbx_codeid.ItemIndex = 0 then E_codename.Hint    := '회사명'
  else                             E_codename.Hint    := '코드명'       ;
end;

procedure TFM_code.OnShapeLabel2MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if cbx_codeid.ItemIndex = 0 then OnShapeLabel2.Hint := '회사정보 등록'
  else                             OnShapeLabel2.Hint := '코드 등록'    ;
end;

end.
