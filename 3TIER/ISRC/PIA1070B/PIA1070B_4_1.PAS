unit PIA1070B_4_1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OnEditStdCtrl, OnEditCombo, ExtCtrls, OnShapeLabel, OnEditBaseCtrl,
  OnEditBtnCtrl, OnTmaxCodeEdit, OnScheme, StdCtrls, OnFocusButton, Db,
  Tmax_DataSetText;

type
  TFM_SubForm4_1 = class(TForm)
    FM_SubForm4_1: TOnSchemeForm;
    TDml: TTMaxDataSet;
    QR_du: TTMaxDataSet;
    Panel1: TPanel;
    OnShapeLabel1: TOnShapeLabel;
    ED_Schgr: TTMaxCodePopupEdit;
    OnShapeLabel2: TOnShapeLabel;
    ED_Schnm: TOnEdit;
    OnShapeLabel3: TOnShapeLabel;
    OnShapeLabel4: TOnShapeLabel;
    ED_SchCode: TTMaxCodePopupEdit;
    OnShapeLabel5: TOnShapeLabel;
    ED_SchFrYM: TOnMaskEdit;
    OnShapeLabel6: TOnShapeLabel;
    ED_Majorcode: TTMaxCodePopupEdit;
    OnShapeLabel7: TOnShapeLabel;
    BT_Add: TOnFocusButton;
    BT_del: TOnFocusButton;
    BT_save: TOnFocusButton;
    BT_close: TOnFocusButton;
    PA_Buttons: TPanel;
    Label1: TLabel;
    Image1: TImage;
    BT_Exit: TOnFocusButton;
    OnFocusButton1: TOnFocusButton;
    BT_Find: TOnFocusButton;
    Ed_Majornm: TOnEdit;
    Ed_Schgrnm: TOnEdit;
    ED_SchToYM: TOnMaskEdit;
    Ed_Schkind: TTMaxCodePopupEdit;
    Ed_Schkindnm: TOnEdit;
    Ed_SchgrTime: TTMaxCodePopupEdit;
    Ed_SchgrTimenm: TOnEdit;
    Ed_SchRank: TOnEdit;
    OnShapeLabel8: TOnShapeLabel;
    Ed_Smajnm: TOnEdit;
    OnShapeLabel9: TOnShapeLabel;
    Ed_Stopic: TOnEdit;
    procedure BT_closeClick(Sender: TObject);
    procedure BT_saveClick(Sender: TObject);
    procedure BT_AddClick(Sender: TObject);
    procedure BT_delClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ED_SchgrChange(Sender: TObject);
  private
    { Private declarations }
    function BmodCheck : Boolean;
    procedure PimPmasUpdate;
  public
    { Public declarations }
    function  Csel_gfd(p_loc: Integer): String;
  end;

var
  FM_SubForm4_1: TFM_SubForm4_1;
  v_add : string;

implementation

uses PIA1070B_1, PIA1070B_4;

{$R *.DFM}

procedure TFM_SubForm4_1.BT_closeClick(Sender: TObject);
begin
  Close;
end;

// 저장 버튼 클릭시
procedure TFM_SubForm4_1.BT_saveClick(Sender: TObject);
var
  Tem : String;
begin

  PA_Buttons.Caption := ' ';
  SendMessage(PA_Buttons.handle,WM_PAINT,0,0);

  if BmodCheck = False then system.exit;  //널값 체크

  // 신규 데이터 추가시
  if v_add = 'A' then
    begin
    // 기존 데이터 유무 체크
      with QR_du do
        begin
          Close;
          ServiceName := 'SHR0SSEL';
          ClearFieldInfo;
          AddField('SEL_DATA',ftString,5000);
          Sql.Clear;
          sql.Add(Format('select empno from pimscho '+
                         'where (empno = ''%s'') and (Schgr = ''%s'') and (SchRank = ''%s'')',
                         [FM_Main.ED_empno.Text,ED_Schgr.codeno,ED_SchRank.text ]));
          Open;

          if QR_du.RecordCount > 0 then
            begin
              Application.Messagebox('기존의 데이타가 존재합니다 !!','작업안내',mb_ok+ mb_IconStop);
              system.Exit;
            end;
        end;

        Tem := Format('insert into pimscho '+
                      '       (EMPNO, KORNAME, SCHGR, SCHRANK, SCHCODE, SCHNM, '+
                      '        MAJORCODE, SCHFRYM, SCHTOYM, SCHKIND, SCHGRTIME,'+
                      '        SCHACKYN, SMAJNM, STOPIC, WRITETIME, WRITEEMP)  '+
                      'values (''%s'', ''%s'', ''%s'', ''%s'', ''%s'', ''%s'', '+
                      '        ''%s'', ''%s'', ''%s'', ''%s'', ''%s''          '+
                      '        ''%s'', ''%s'', ''%s'',                         '+
                      '        to_char(sysdate, ''YYYYMMDDHH24MISS''),''%s'')  ',
                      [FM_Main.ED_empno.Text,FM_Main.ED_korname.valuecaption,ED_Schgr.codeno,
                       ED_SchRank.Text,      Ed_Schcode.codeno,              Ed_SchNm.Text,
                       ED_MajorCode.codeno,  ED_schFrYm.Text,                ED_schToYm.Text,
                       ED_SchKind.codeno,    ED_Schgrtime.codeno,   'Y',     FM_Main.FG_pempno]);

        with TDml do
          begin
            Close;
            Sql.Clear;
            Sql.text := Tem;
            ServiceName := 'PIB3012A_dml';
            if not Execute then
              begin
                Application.Messagebox('저장에 실패했습니다.I','작업안내',mb_ok+ mb_IconStop);
              end;
          end;

        PA_Buttons.Caption := '  ☞ 학력사항을 추가 -> 저장 하였습니다. !!. ';
        SendMessage(PA_Buttons.handle,WM_PAINT,0,0);
      end
    else
      begin
        Tem := 'update pimscho       '+
               '   set SCHGR    ='''+ED_SchGr.codeno    +''',                               '+
               '       SCHRANK  ='''+ED_SchRank.Text    +''',                               '+
               '       SCHCODE  ='''+ED_SchCode.codeno  +''',                               '+
               '       SCHNM    ='''+ED_SchNm.Text      +''',                               '+
               '       MAJORCODE='''+ED_MajorCode.codeno+''',                               '+
               '       SCHFRYM  ='''+ED_SchFrYm.Text    +''',                               '+
               '       SCHTOYM  ='''+ED_SchToYm.Text    +''',                               '+
               '       SCHKIND  ='''+ED_SchKind.codeno  +''',                               '+
               '       SCHGRTIME='''+ED_Schgrtime.codeno+''',                               '+
               '       SCHACKYN =''Y'',                                                     '+
               '       SMAJNM   ='''+ED_SMajNm.Text     +''',                               '+
               '       STOPIC   ='''+ED_STopic.Text     +''',                               '+
               '       writetime=to_char(sysdate, ''YYYYMMDDHH24MISS''),                    '+
               '       writeemp ='''+FM_Main.FG_pempno+'''                                  '+
               ' where (empno   ='''+FM_Main.ED_empno.Text+''')                             '+
               '   and (Schgr   ='''+FM_SubForm3.QR_qry.FieldByName('Schgr').AsString+''')  '+
               '   and (SchRank ='''+FM_SubForm3.QR_qry.FieldByName('SchRank').AsString+''')';

        with TDml do
        begin
            Close;
            Sql.Clear;
            Sql.text := Tem;
            ServiceName := 'PIB3012A_dml';
            if not Execute then
              begin
                Application.Messagebox('저장에 실패했습니다.U','작업안내',mb_ok+ mb_IconStop);
              end;
        end;

        PA_Buttons.Caption := '  ☞ 학력사항을 수정 -> 저장 하였습니다. !!. ';
        SendMessage(PA_Buttons.handle,WM_PAINT,0,0);
      end;
      PimPmasUpdate;

  v_add := '';
end;

function TFM_SubForm4_1.Csel_gfd(p_loc: Integer): String;
var
  v_cnt, v_tmp: Integer;
  v_data: String;
begin
  Result := '';
  v_data := QR_du.FieldByName('SEL_DATA').AsString;
  v_cnt := 1;
  while v_cnt < p_loc do
  begin
    v_tmp := Pos(';',v_data);
    if not(v_tmp > 0) then Exit;
    v_cnt := v_cnt + 1;
    Delete(v_data, 1, v_tmp);
  end;
  v_tmp := Pos(';',v_data) - 1;
  if v_tmp < 0 then v_tmp := Length(v_data);
  Result := Copy(v_data,1,v_tmp);
end;

{인사마스터 부분 수정}
procedure TFM_SubForm4_1.PimPmasUpdate;
var
  Stemp : array[1..14] of String;
  i     : integer;
begin
     for i := 1 to 14 do Stemp[i] := '';

     Try
          with QR_du do
          begin
               Close;
               ServiceName := 'SHR0SSEL';
               ClearFieldInfo;
               AddField('SEL_DATA',ftString,5000);
               Sql.Clear;
               Sql.Text := 'select schgr from pimscho                     '+
                           ' where empno = '''+FM_Main.ED_empno.Text+'''  '+
                           '   and schgrtime = ''1''                      '+
                           ' order by schgr desc,schrank                  ';
               Open;
               Stemp[1]  := Csel_gfd(1); {입사시학력}
          end;

          with QR_du do
          begin
               Close;
               ServiceName := 'SHR0SSEL';
               ClearFieldInfo;
               AddField('SEL_DATA',ftString,5000);
               Sql.Clear;
               Sql.Text := 'select schgr||'';''||schcode||'';''||schnm||'';''|| '+
                           '       majorcode||'';''||schtoym||'';''||schfrym    '+
                           '  from pimscho                                      '+
                           ' where (empno = '''+FM_Main.ED_empno.Text+''')      '+
                           ' order by schgr desc,schrank                        ';
               Open;
               First;
               Stemp[2]  := Csel_gfd(1);  {최종학력}
               Stemp[3]  := Csel_gfd(2);  {최종학교}
               Stemp[4]  := Csel_gfd(3);  {최종학교명}
               Stemp[5]  := Csel_gfd(4);  {전공}
               Stemp[6]  := Csel_gfd(5);  {졸업}
               Stemp[7]  := Csel_gfd(6);  {입학}
          end;

          with QR_du do
          begin
               Close;
               ServiceName := 'SHR0SSEL';
               ClearFieldInfo;
               AddField('SEL_DATA',ftString,5000);
               Sql.Clear;
               Sql.Text := 'select schgr||'';''||smajnm||'';''||stopic from pimscho '+
                           ' where empno = '''+FM_Main.ED_empno.Text+'''            '+
                           '   and substr(schgr,2,1) in (''9'', ''7''))             '+
                           ' order by schgr desc, schrank                           ';
               Open;
               First;
               if (Copy(Csel_gfd(1), 2, 1) = '7') then
                    Stemp[8] := copy(Csel_gfd(1), 1, 1) + '9'
               else
                    Stemp[8] := Csel_gfd(1); {최종학위}
               Stemp[9]  := Csel_gfd(2); {세부전공}
               Stemp[10] := Csel_gfd(3); {논문}
          end;

          with QR_du do
          begin
               Close;
               ServiceName := 'SHR0SSEL';
               ClearFieldInfo;
               AddField('SEL_DATA',ftString,5000);
               Sql.Clear;
               Sql.Text := 'select schcode||'';''||majorcode||'';''||schtoym||'';''||schfrym  '+
                           '  from pimscho                                                    '+
                           ' where (empno = '''+FM_Main.ED_empno.Text+''' and schgr = ''59'') '+
                           ' order by schrank                                                 ';
               Open;
               First;
               Stemp[11] := Csel_gfd(1);
               Stemp[12] := Csel_gfd(2);
               Stemp[13] := Csel_gfd(3);
               Stemp[14] := Csel_gfd(4); {입학}
               Close;
          end;
          {인사마스터에 데이타를 업데이트 한다..}
          PA_Buttons.Caption := '인사 마스터를 수정하고 있는 중입니다..';

          with TDml do
          begin
               Close;
               Sql.Clear;
               Sql.text :='update pimpmas                                     '+
                          '   set empschgr  = '''+Stemp[1] +''',              '+
                          '       lschgr    = '''+Stemp[2] +''',              '+
                          '       lschcode  = '''+Stemp[3] +''',              '+
                          '       lschnm    = '''+Stemp[4] +''',              '+
                          '       lmajorcode= '''+Stemp[5] +''',              '+
                          '       lschgrym  = '''+Stemp[6] +''',              '+
                          '       lschfrym  = '''+Stemp[7] +''',              '+
                          '       lschdeg   = '''+Stemp[8] +''',              '+
                          '       lschmajnm = '''+Stemp[9] +''',              '+
                          '       lschtopic = '''+Stemp[10]+''',              '+
                          '       unicode   = '''+Stemp[11]+''',              '+
                          '       unimajor  = '''+Stemp[12]+''',              '+
                          '       unigrym   = '''+Stemp[13]+''',              '+
                          '       unifrym   = '''+Stemp[14]+'''               '+
                          ' where (empno    =  '''+FM_Main.ED_empno.Text+''') ';

               ServiceName := 'PIB3012A_dml';
               if not Execute then
               begin
                    Application.Messagebox('인사마스터 저장에 실패했습니다.','작업안내',mb_ok+ mb_IconStop);
               end;
          end;
     EXCEPT ON E : EDataBaseError DO
          Application.Messagebox('인사마스터 저장에 실패했습니다.','작업안내',mb_ok+ mb_IconStop);
     END;
end;

function TFM_SubForm4_1.BmodCheck : Boolean;
var
  str  : string;
begin
  Result := True;
  str := '';
  if (trim(ED_Schgr.Text) = '') then
    str := str+'학력구분 필드에러'+chr(13)+chr(10)+chr(13)+chr(10);;
  if (trim(ED_SchRank.Text) = '') then
    str := str+'동일학력순위 필드에러'+chr(13)+chr(10)+chr(13)+chr(10);

  if str <> '' then begin
    MessageBox(handle,pChar(str),'에  러',MB_OK or $0010);
    Result := False;
  end;
end;

//추가 버튼 클릭시
procedure TFM_SubForm4_1.BT_AddClick(Sender: TObject);
begin
  PA_Buttons.Caption := ' ';
  SendMessage(PA_Buttons.handle,WM_PAINT,0,0);

  ED_Schgr.Text       :='';
  Ed_Schgrnm.Text     :='';
  Ed_SchRank.Text     :='';
  ED_SchCode.Text     :='';
  ED_Schnm.Text       :='';
  ED_Majorcode.Text   :='';
  Ed_Majornm.Text     :='';
  ED_SchFrYM.Text     :='';
  ED_SchToYM.Text     :='';
  Ed_Schkind.Text     :='';
  Ed_Schkindnm.Text   :='';
  Ed_SchgrTime.Text   :='';
  Ed_SchgrTimenm.Text :='';
  Ed_Smajnm.Text      :='';
  Ed_Stopic.Text      :='';

  v_add:='A';
end;

//삭제 버튼 클릭시
procedure TFM_SubForm4_1.BT_delClick(Sender: TObject);
var
  Tem : string;
begin
  PA_Buttons.Caption := ' ';
  SendMessage(PA_Buttons.handle,WM_PAINT,0,0);

  // 기존 데이터 유무 체크
  with QR_du do
    begin
      Close;
      ServiceName := 'SHR0SSEL';
      ClearFieldInfo;
      AddField('SEL_DATA',ftString,5000);
      Sql.Clear;
      sql.Add(Format('select empno from pimscho '+
                     'where (empno = ''%s'') and (Schgr = ''%s'') and (SchRank = ''%s'')',
                     [FM_Main.ED_empno.Text,ED_Schgr.codeno,ED_SchRank.text ]));
      Open;

      if QR_du.RecordCount <= 0 then
        begin
          Application.Messagebox('데이타가 존재하지 않습니다. !!','작업안내',mb_ok+ mb_IconStop);
          system.Exit;
        end;
    end;

  if MessageBox(handle,'데이타를 삭제하시겠습니까 ?.','확 인',MB_YESNO or $0030) = ID_NO then begin
    system.exit;
  end;

  Tem := Format('delete from pimscho '+
                'where (empno = ''%s'') and (Schgr = ''%s'') and (SchRank = ''%s'')',
                [FM_Main.ED_empno.Text,ED_Schgr.codeno,ED_SchRank.text ]);

  with TDml do
    begin
      Close;
      Sql.Clear;
      Sql.text := Tem;
      ServiceName := 'PIB3012A_dml';
      if not Execute then
        begin
          Application.Messagebox('삭제에 실패했습니다.D','작업안내',mb_ok+ mb_IconStop);
        end;
    end;

  ED_Schgr.Text       :='';
  Ed_Schgrnm.Text     :='';
  Ed_SchRank.Text     :='';
  ED_SchCode.Text     :='';
  ED_Schnm.Text       :='';
  ED_Majorcode.Text   :='';
  Ed_Majornm.Text     :='';
  ED_SchFrYM.Text     :='';
  ED_SchToYM.Text     :='';
  Ed_Schkind.Text     :='';
  Ed_Schkindnm.Text   :='';
  Ed_SchgrTime.Text   :='';
  Ed_SchgrTimenm.Text :='';
  Ed_Smajnm.Text      :='';
  Ed_Stopic.Text      :='';

  PA_Buttons.Caption := '  ☞ 학력사항을 삭제 하였습니다. !!. ';
  SendMessage(PA_Buttons.handle,WM_PAINT,0,0);

end;

procedure TFM_SubForm4_1.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  Close;
end;

procedure TFM_SubForm4_1.ED_SchgrChange(Sender: TObject);
begin
     Case TTMaxCodePopupEdit(Sender).Tag of
          1: begin
                  if (Copy(Ed_Schgr.Text,1,1) = '6') or
                     (Copy(Ed_Schgr.Text,1,1) = '7') or
                     (Copy(Ed_Schgr.Text,2,1) = '' ) then
                  begin
                       Ed_Smajnm.Enabled := True;
                       Ed_Stopic.Enabled := True;
                  end
                  else
                  begin
                       Ed_Smajnm.Enabled := False;
                       Ed_Stopic.Enabled := False;
                  end;

                  Ed_Schgrnm.Text     := TTMaxCodePopupEdit(Sender).Codename;
                  with QR_du do
                  begin
                       Close;
                       ServiceName := 'SHR0SSEL';
                       ClearFieldInfo;
                       AddField('SEL_DATA',ftString,5000);
                       Sql.Clear;
                       Sql.Text := 'select Count(schgr)+1 from pimscho            '+
                                   ' where empno = '''+FM_Main.ED_empno.Text+'''  '+
                                   '   and schgr = '''+Ed_Schgr.Text+'''          ';
                       Open;
                       Ed_SchRank.Text  := Csel_gfd(1); {동일학력순위}
                  end;

             end;
          2: Ed_Schnm.Text       := TTMaxCodePopupEdit(Sender).Codename;
          3: Ed_Majornm.Text     := TTMaxCodePopupEdit(Sender).Codename;
          4: Ed_SchKindnm.Text   := TTMaxCodePopupEdit(Sender).Codename;
          5: Ed_SchGrTimenm.Text := TTMaxCodePopupEdit(Sender).Codename;
     end;
end;

end.
