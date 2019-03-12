unit PSF10202;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OnEditStdCtrl, OnEditBtnCtrl, OnEditCombo, OnEditBaseCtrl, Grids,
  DBGrids, OnGrDBGrid, StdCtrls, OnShapeLabel, ExtCtrls, ComCtrls,
  OnFocusButton, OnEditNumCtl, Db, Tmax_DataSetText, OnPopupEdit;

type
  TDetForm = class(TForm)
    BT_add: TOnFocusButton;
    BT_mod: TOnFocusButton;
    BT_save: TOnFocusButton;
    BT_cancel: TOnFocusButton;
    BT_del: TOnFocusButton;
    StatusBar1: TStatusBar;
    Shape1: TShape;
    L_item: TOnShapeLabel;
    OnShapeLabel26: TOnShapeLabel;
    OnShapeLabel7: TOnShapeLabel;
    Label10: TLabel;
    Grid_lst: TOnGrDbGrid;
    CB_attach: TOnComboEdit;
    ED_contents: TOnEdit;
    NE_contamt: TOnNumberEdit;
    BT_close: TOnFocusButton;
    TDS_lst: TTMaxDataSet;
    DS_lst: TDataSource;
    L_sscode: TOnShapeLabel;
    NE_sscodenum: TOnNumberEdit;
    TDS_psmss: TTMaxDataSet;
    TDS_dml: TTMaxDataSet;
    TDS1: TTMaxDataSet;
    P_ighis: TPanel;
    L_ig: TLabel;
    L_ighis: TLabel;
    SL_faminame: TOnShapeLabel;
    ED_faminame: TOnWinPopupEdit;
    SL_contents: TOnShapeLabel;
    procedure BT_closeClick(Sender: TObject);
    procedure BT_addClick(Sender: TObject);
    procedure BT_modClick(Sender: TObject);
    procedure BT_cancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DS_lstDataChange(Sender: TObject; Field: TField);
    procedure Grid_lstCellClick(Column: TColumn);
    procedure BT_saveClick(Sender: TObject);
    procedure BT_delClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ED_faminameInitPopup(Sender: TObject);
    procedure ED_faminameCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
  private
    { Private declarations }
    JobMode : String;
    igamt   : Double;

    procedure Set_InputField(arg1, arg2 : Boolean );
    procedure Set_BtnEnable(gubun : Char);    
    procedure Retrieve;
    function  DataChk : Boolean ;
  public
    { Public declarations }
  end;

var
  DetForm: TDetForm;

implementation

uses PSF10201, PSF10203;
{$R *.DFM}

procedure TDetForm.BT_closeClick(Sender: TObject);
begin
  Close;
end;

procedure TDetForm.Set_InputField(arg1, arg2 : Boolean );
begin
  Grid_lst.Enabled         := not arg1;
  ED_contents.Enabled      := arg1;
  NE_contamt.Enabled       := arg1;
  CB_attach.Enabled        := arg1;

  if ED_faminame.Visible then
    ED_faminame.Enabled := arg1;

  if arg2 then
    begin
      NE_sscodenum.Value       := 0;
      ED_contents.Text         :='';
      NE_contamt.Value         := 0;
      CB_attach.ItemIndex      :=-1;
      ED_faminame.Text         := '';
    end;
end;

procedure TDetForm.Set_BtnEnable(gubun : Char);
begin
  if gubun ='F' then  //default
    begin
      BT_add.Enabled    := True;
      BT_mod.Enabled    := True;
      BT_save.Enabled   := False;
      BT_cancel.Enabled := False;
      BT_del.Enabled    := True;
    end
  else if gubun ='I' then //수정상태
    begin
      BT_add.Enabled    := False;
      BT_mod.Enabled    := False;
      BT_save.Enabled   := True;
      BT_cancel.Enabled := True;
      BT_del.Enabled    := False;
    end
  else if gubun ='N' then //no data
    begin
      BT_add.Enabled    := True;
      BT_mod.Enabled    := False;
      BT_save.Enabled   := False;
      BT_cancel.Enabled := False;
      BT_del.Enabled    := False;
    end;

  if MainForm.GSconyn ='Y' then  //dsa2000 2004.11.16. 추가
    begin
      BT_add.Enabled    := False;
      BT_mod.Enabled    := False;
      BT_save.Enabled   := False;
      BT_cancel.Enabled := False;
      BT_del.Enabled    := False;
    end;    
end;

procedure TDetForm.BT_addClick(Sender: TObject);
begin
  JobMode            := 'I';
  Set_InputField(True, True);
  Set_BtnEnable('I');
  ED_contents.Setfocus;
end;

procedure TDetForm.BT_modClick(Sender: TObject);
begin
  JobMode            := 'U';
  Set_InputField(True, False );
  Set_BtnEnable('I');
end;

procedure TDetForm.BT_cancelClick(Sender: TObject);
begin
  JobMode            := 'F';
  Set_InputField(False, True);
  Set_BtnEnable('N');
end;

procedure TDetForm.FormShow(Sender: TObject);
begin
  if MainForm.GSconyn ='N' then
    begin
      BT_add.Enabled    := True;
      BT_mod.Enabled    := True;
      BT_save.Enabled   := True;
      BT_cancel.Enabled := True;
      BT_del.Enabled    := True;
    end
  else
    begin
      BT_add.Enabled    := False;
      BT_mod.Enabled    := False;
      BT_save.Enabled   := False;
      BT_cancel.Enabled := False;
      BT_del.Enabled    := False;
    end;

  P_ighis.Visible             := False;
  SL_contents.Width           := 401 ;
  SL_contents.LabelWidth      := 400 ;
  ED_contents.Width           := 401 ;
  SL_faminame.Visible         := False;
  ED_faminame.Visible         := False;
  Grid_lst.Columns[0].Width   := 398 ;
  Grid_lst.Columns[1].Visible := False;

  if L_sscode.ValueCaption ='AA03' then //IG지원
    begin
      P_ighis.Visible := True;

      with TDS1 do
        begin
          ServiceName := 'HINSA_select';
          Close;
          Sql.Clear;
          //Dsa2000  전년도 11월부터의 공제금 총액을 한도로.2006.11.08. 오종석 과장 요청.
          Sql.Text := 'select nvl(sum(nvl(igamt,0)), 0) igamt, ''field2'', ''field3'', ''field4'', ''field5'''+
                      '  from pkhphis                                                                        '+
               Format(' where paydate >= (select to_char(to_char(sysdate,''YYYY'')-1)||''11'' from dual)     '+
                      '   and empno   = ''%s''        ',[MainForm.ED_empno.empno ]);
//               Format(' where paydate like ''%s''     '+
//                      '   and empno   = ''%s''        ',[Copy(MainForm.GSyearnum,1,4)+'%', MainForm.ED_empno.empno ]);



          ClearFieldInfo;
          AddField('IGAMT'      , ftFloat,    100);
          AddField('field2'     , ftString,   100);
          AddField('field3'     , ftString,   100);
          AddField('field4'     , ftString,   100);
          AddField('field5'     , ftString,   100);
          Open;
          igamt           := FieldByName('IGAMT').AsFloat;
//        L_ighis.Caption := '- 기 급여 공제한 동호회 회비 : '+ FormatFloat('#,##0', igamt);
          L_ighis.Caption := '- 기 급여 공제한 동호회 회비(전년도 11월 이후 기준) : '+ FormatFloat('#,##0', igamt) +'원';

        end;
    end
  else if (L_sscode.ValueCaption ='BC01') or (L_sscode.ValueCaption ='BC02') then //의료비
    begin
      SL_contents.Width   := 298 ;
      SL_contents.LabelWidth   := 297 ;
      ED_contents.Width   := 298 ;
      SL_faminame.Visible := True;
      ED_faminame.Visible := True;
      Grid_lst.Columns[0].Width   := 293 ;
      Grid_lst.Columns[1].Visible := True;
    end;

  BT_cancelClick(Sender);
  Retrieve;
end;

procedure TDetForm.Retrieve;
begin
  with TDS_lst do
    begin
      ServiceName := 'PSF1020A_sel2';
      Close;
      Sql.Clear;
      Sql.Text := 'select sscodenum, contents, contamt, attachtxt, faminame '+
                  '  from psmsslst '+
           Format(' where yearnum  = ''%s'' '+
                  '   and empno    = ''%s'' '+
                  '   and sscode   = ''%s'' ', [MainForm.GSyearnum, MainForm.ED_empno.empno, L_sscode.ValueCaption ] ) +
                  ' order by sscodenum ';

      ClearFieldInfo;
      AddField('SSCODENUM', ftInteger, 2);
      AddField('CONTENTS' , ftString,  100);
      AddField('CONTAMT'  , ftFloat,   9);
      AddField('ATTACHTXT', ftString,  20);
      AddField('FAMINAME' , ftString,  12);
      Open;

      TFloatField(FieldByName('CONTAMT')).DisplayFormat  := '#,##0';
    end;
end;


procedure TDetForm.DS_lstDataChange(Sender: TObject; Field: TField);
begin
  NE_sscodenum.Value := TDS_lst.FieldByName('SSCODENUM').AsInteger;
  ED_faminame.Text   := TDS_lst.FieldByName('FAMINAME').AsString;
  ED_contents.Text   := TDS_lst.FieldByName('CONTENTS').AsString;
  NE_contamt.Value   := TDS_lst.FieldByName('CONTAMT').AsFloat;
  CB_attach.Text     := TDS_lst.FieldByName('ATTACHTXT').AsString;

  if Trim(ED_contents.Text) = ''then
    Set_BtnEnable('N')
  else
    Set_BtnEnable('F');
end;

procedure TDetForm.Grid_lstCellClick(Column: TColumn);
begin
  NE_sscodenum.Value := TDS_lst.FieldByName('SSCODENUM').AsInteger;
  ED_faminame.Text   := TDS_lst.FieldByName('FAMINAME').AsString;
  ED_contents.Text   := TDS_lst.FieldByName('CONTENTS').AsString;
  NE_contamt.Value   := TDS_lst.FieldByName('CONTAMT').AsFloat;
  CB_attach.Text     := TDS_lst.FieldByName('ATTACHTXT').AsString;

  if Trim(ED_contents.Text) = ''then
    Set_BtnEnable('N')
  else
    Set_BtnEnable('F');
end;

function TDetForm.DataChk : Boolean ;
var
  selfdevyn : String[1];
  SqlStr    : String;
begin
  Result := True;

  if (JobMode = 'U') and (NE_sscodenum.Value = 0) then
    begin
      MessageDlg('번호 Error. 취소하고 작업을 다시해 주세요..', mtError, [mbok], 0) ;
      Result := False;
      exit;
    end;

  if Trim(ED_contents.Text) = '' then
    begin
      MessageDlg('내용을 정확히 입력해 주세요..', mtError, [mbok], 0) ;
      Result := False;
      exit;
    end;

  if (ED_faminame.Visible) and (Trim(ED_faminame.Text) = '') then
    begin
      MessageDlg('가족 성명을 정확히 입력해 주세요..', mtError, [mbok], 0) ;
      Result := False;
      exit;
    end;

  if NE_contamt.Value = 0 then
    begin
      MessageDlg('금액을 정확히 입력해 주세요..', mtError, [mbok], 0) ;
      Result := False;
      exit;
    end;

  if CB_attach.ItemIndex = -1 then
    begin
      MessageDlg('증빙 구분을 선택해 주세요..', mtError, [mbok], 0) ;
      Result := False;
      exit;
    end;

//ig 지원비 급여이력과 한도 체크
  if P_ighis.Visible then
    begin
      with TDS1 do
        begin
          ServiceName := 'HINSA_select';
          Close;
          Sql.Clear;

          if JobMode = 'I' then
            begin
              Sql.Text := 'select nvl(sum(nvl(contamt,0)),0) itemamt, ''field2'', ''field3'', ''field4'', ''field5'''+
                          '  from psmsslst                  '+
                   Format(' where yearnum like ''%s''       '+
                          '   and empno   = ''%s''          '+
                          '   and sscode  = ''%s''          ',
                          [Copy(MainForm.GSyearnum,1,4)+'%', MainForm.ED_empno.empno, L_sscode.ValueCaption ]);
            end
          else if JobMode = 'U' then
            begin
              Sql.Text := 'select nvl(sum(nvl(contamt,0)),0) itemamt, ''field2'', ''field3'', ''field4'', ''field5'''+
                          '  from psmsslst                  '+
                   Format(' where yearnum like ''%s''       '+
                          '   and empno   = ''%s''          '+
                          '   and sscode  = ''%s''          '+
                          '   and not (yearnum = ''%s'' and empno = ''%s'' and sscode =''%s'' and sscodenum = ''%s'')       ',
                          [Copy(MainForm.GSyearnum,1,4)+'%', MainForm.ED_empno.empno, L_sscode.ValueCaption,
                           MainForm.GSyearnum, MainForm.ED_empno.empno, L_sscode.ValueCaption, FloatToStr(NE_sscodenum.Value)]);
            end;

          ClearFieldInfo;
          AddField('ITEMAMT'    , ftFloat,    100);
          AddField('field2'     , ftString,   100);
          AddField('field3'     , ftString,   100);
          AddField('field4'     , ftString,   100);
          AddField('field5'     , ftString,   100);
          Open;

          if igamt < NE_contamt.Value + FieldByName('ITEMAMT').AsFloat then
            begin
              MessageDlg('IG지원비는 기급여 공제한 동호회 회비를 초과할수 없습니다..금액을 확인하세요.', mtError, [mbok], 0) ;
              Result := False;
              exit;
            end;
        end;
    end;

//한도금액 체크
  with TDS1 do
    begin
      SqlStr := Format('select nvl(selfdevyn, ''N'') selfdevyn, ''field2'', ''field3'', ''field4'', ''field5''  '+
                       ' from pscsscod                                                                           '+
                       'where sscode = ''%s''   ',  [L_sscode.ValueCaption]);

      ServiceName := 'HINSA_select';
      Close;
      Sql.Clear;
      Sql.Text := SqlStr;

      ClearFieldInfo;
      AddField('SELFDEVYN'  , ftString,   100);
      AddField('field2'     , ftString,   100);
      AddField('field3'     , ftString,   100);
      AddField('field4'     , ftString,   100);
      AddField('field5'     , ftString,   100);
      Open;

      selfdevyn := FieldByName('SELFDEVYN').AsString;

      if JobMode ='I' then
        begin
          SqlStr := Format('select nvl(devlimit,0) devlimit, nvl(nondevlimit,0) nondevlimit,        '+
                           '       nvl(devamt,0) devamt,     nvl(nondevamt,0) nondevamt, ''field5'' '+
                           ' from psmssmas                             '+
                           'where yearnum  = ''%s''                    '+
                           '  and empno    = ''%s''                    ',
                           [MainForm.GSyearnum, MainForm.ED_empno.empno]);
        end
      else if JobMode ='U' then
        begin
          SqlStr := Format('select nvl(a.devlimit,0) devlimit, nvl(a.nondevlimit,0) nondevlimit, '+
                           '       sum(decode(c.selfdevyn ,''Y'', c.contamt,0)) devamt,          '+
                           '       sum(decode(c.selfdevyn ,''N'', c.contamt,0)) nondevamt,       '+
                           '       ''field5''                                                    '+
                           ' from psmssmas a,                                                    '+
                           '      (select b.yearnum, b.empno, c.selfdevyn, b.contamt             '+
                           '         from psmsslst b, pscsscod c                                 '+
                           '	    where b.yearnum = ''%s''                                     '+
                           ' 	      and b.empno   = ''%s''                                     '+
                           '	      and b.sscode  = c.sscode                                   '+
                           '	      and not (b.sscode  = ''%s'' and b.sscodenum = ''%s''))  c  '+
                           'where a.yearnum = c.yearnum(+)         '+
			   '  and a.empno   = c.empno(+)           '+
                           '  and a.yearnum = ''%s''               '+
                           '  and a.empno   = ''%s''               '+
                           'group by nvl(a.devlimit,0) , nvl(a.nondevlimit,0) ',
                           [MainForm.GSyearnum, MainForm.ED_empno.empno, L_sscode.ValueCaption, FloatToStr(NE_sscodenum.Value), MainForm.GSyearnum, MainForm.ED_empno.empno ]);
        end;

      ServiceName := 'HINSA_select';
      Close;
      Sql.Clear;
      Sql.Text := SqlStr;

      ClearFieldInfo;
      AddField('DEVLIMIT'      , ftFloat,    100);
      AddField('NONDEVLIMIT'   , ftFloat,    100);
      AddField('DEVAMT'        , ftFloat,    100);
      AddField('NONDEVAMT'     , ftFloat,    100);
      AddField('field5'        , ftString,   100);
      Open;

      if selfdevyn ='Y' then
        begin
          if FieldByName('DEVAMT').AsFloat + NE_contamt.Value > FieldByName('DEVLIMIT').AsFloat + FieldByName('NONDEVLIMIT').AsFloat then
            begin
              MessageDlg('총 한도액을 초과했습니다. 금액을 확인해 주세요..', mtError, [mbok], 0) ;
              NE_contamt.SetFocus;
              Result := False;
              exit;
            end;
        end
      else
        begin
          if FieldByName('NONDEVAMT').AsFloat + NE_contamt.Value > FieldByName('NONDEVLIMIT').AsFloat then
            begin
              MessageDlg('자기계발비외 항목 한도액을 초과했습니다. 금액을 확인해 주세요..', mtError, [mbok], 0) ;
              NE_contamt.SetFocus;
              Result := False;
              exit;
            end;
        end;

      if FieldByName('DEVAMT').AsFloat + FieldByName('NONDEVAMT').AsFloat + NE_contamt.Value  >
        FieldByName('DEVLIMIT').AsFloat + FieldByName('NONDEVLIMIT').AsFloat then
        begin
          MessageDlg('총 한도액을 초과했습니다. 금액을 확인해 주세요..', mtError, [mbok], 0) ;
          NE_contamt.SetFocus;
          Result := False;
          exit;
        end;
    end;
end;


procedure TDetForm.BT_saveClick(Sender: TObject);
var
  SqlStr : String;
begin
  if not ((JobMode = 'I') or (JobMode = 'U')) then
    Exit;

  if not DataChk then EXIT ;

  if JobMode = 'I' then
    begin
      with TDS1 do
        begin
          SqlStr := Format('select nvl(max(sscodenum), 0)+1 ssnum, ''field2'', ''field3'', ''field4'', ''field5'' '+
                           '  from psmsslst               '+
                           ' where yearnum = ''%s''       '+
                           '   and empno   = ''%s''       '+
                           '   and sscode  = ''%s''        ',
                           [MainForm.GSyearnum, MainForm.ED_empno.empno, L_sscode.ValueCaption]);

          ServiceName := 'HINSA_select';
          Close;
          Sql.Clear;
          Sql.Text := SqlStr;

          ClearFieldInfo;
          AddField('SSNUM'      , ftFloat,    100);
          AddField('field2'     , ftString,   100);
          AddField('field3'     , ftString,   100);
          AddField('field4'     , ftString,   100);
          AddField('field5'     , ftString,   100);
          Open;
          NE_sscodenum.Value := FieldByName('SSNUM').AsFloat;
        end;
    end;

  with TDS_psmss do
    begin
      ServiceName := 'PSF1020A_psmss';
      Close;
      ClearParamInfo;
      AddParam('JOBMODE',   1,   JobMode);
      AddParam('YEARNUM',   6,   MainForm.GSyearnum);
      AddParam('EMPNO',     4,   MainForm.ED_empno.empno);
      AddParam('SSCODE',    4,   L_sscode.ValueCaption);
      AddParam('SSCODENUM', 2,   FloatToStr(NE_sscodenum.Value));
      AddParam('CONTENTS',  100, ED_contents.Text);
      AddParam('CONTAMT',   9,   FloatToStr(NE_contamt.Value));
      AddParam('ATTACHTXT', 20,  CB_attach.Text);
      AddParam('FAMINAME',  12,  ED_faminame.Text);
      AddParam('WRITEMAN',  4,   MainForm.GSempno);

      if not TDS_psmss.Execute then
        begin
          MessageDlg('자료를 저장 하는 중 에러가 발생했습니다.', mtError, [mbOK],0);
          Exit;
        end;
    end;

  MessageDlg('신청 내역이 저장되었습니다',mtInformation, [mbOk ],0) ;
  Retrieve;
  JobMode               := 'F';
  Set_InputField(False, False );
end;

procedure TDetForm.BT_delClick(Sender: TObject);
begin
  if NE_sscodenum.Value = 0 then
    begin
      MessageDlg('삭제할 자료를 선택해 주세요', mtError, [mbOk],0);
      Exit;
    end;

  if MessageDlg('삭제하시겠습니까?',mtConfirmation, [mbYes, mbNo ],0) <> mrYes then
    System.Exit;

  with TDS_psmss do
    begin
      ServiceName := 'PSF1020A_psmss';
      Close;
      ClearParamInfo;
      AddParam('JOBMODE',   1,   'D');
      AddParam('YEARNUM',   6,   MainForm.GSyearnum);
      AddParam('EMPNO',     4,   MainForm.ED_empno.empno);
      AddParam('SSCODE',    4,   L_sscode.ValueCaption);
      AddParam('SSCODENUM', 2,   FloatToStr(NE_sscodenum.Value));
      AddParam('CONTENTS',  100, ED_contents.Text);
      AddParam('CONTAMT',   9,   FloatToStr(NE_contamt.Value));
      AddParam('ATTACHTXT', 20,  CB_attach.Text);
      AddParam('FAMINAME',  12,  ED_faminame.Text);
      AddParam('WRITEMAN',  4,   MainForm.GSempno);

      if not TDS_psmss.Execute then
        begin
          MessageDlg('자료를 삭제 하는 중 에러가 발생했습니다.', mtError, [mbOK],0);
          Exit;
        end;
    end;

  MessageDlg('삭제 되었습니다',mtInformation, [mbOk ],0) ;
  Retrieve;
end;

procedure TDetForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  MainForm.Get_Data;
end;

procedure TDetForm.ED_faminameInitPopup(Sender: TObject);
begin
  FamiForm.Edit         := TOnWinPopupEdit(Sender);
  TOnWinPopupEdit(Sender).PopupControl := FamiForm ;

end;

procedure TDetForm.ED_faminameCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
  if FamiForm.Famirel <> '' then
    ED_faminame.Text      := FamiForm.FaName;

end;

end.
