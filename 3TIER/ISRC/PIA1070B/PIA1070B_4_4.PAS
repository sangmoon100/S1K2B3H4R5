unit PIA1070B_4_4;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OnEditStdCtrl, OnEditCombo, ExtCtrls, OnShapeLabel, OnEditBaseCtrl,
  OnEditBtnCtrl, OnTmaxCodeEdit, OnScheme, StdCtrls, OnFocusButton, Db, Datelib,
  Tmax_DataSetText;

type
  TFM_SubForm4_4 = class(TForm)
    FM_SubForm4_4: TOnSchemeForm;
    TDml: TTMaxDataSet;
    QR_du: TTMaxDataSet;
    Panel1: TPanel;
    OnShapeLabel4: TOnShapeLabel;
    OnShapeLabel5: TOnShapeLabel;
    ED_CarFrDate: TOnMaskEdit;
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
    ED_CarToDate: TOnMaskEdit;
    Ed_Carjobnm: TOnEdit;
    OnShapeLabel8: TOnShapeLabel;
    Ed_Carplace: TOnEdit;
    OnShapeLabel9: TOnShapeLabel;
    Ed_Cardeptnm: TOnEdit;
    OnShapeLabel1: TOnShapeLabel;
    Ed_TotCarr: TOnEdit;
    procedure BT_closeClick(Sender: TObject);
    procedure BT_saveClick(Sender: TObject);
    procedure BT_AddClick(Sender: TObject);
    procedure BT_delClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ED_CarFrDateExit(Sender: TObject);
  private
    { Private declarations }
    function BmodCheck : Boolean;

  public
    { Public declarations }
    function  Csel_gfd(p_loc: Integer): String;
    function  MyStrToDate(s : string) : TDateTime;
  end;

var
  FM_SubForm4_4: TFM_SubForm4_4;
  v_add : string;

implementation

uses PIA1070B_1, PIA1070B_4;

{$R *.DFM}

procedure TFM_SubForm4_4.BT_closeClick(Sender: TObject);
begin
  Close;
end;

// 저장 버튼 클릭시
procedure TFM_SubForm4_4.BT_saveClick(Sender: TObject);
var
  Tem, YMD, vCarfrdate : String;
begin

  PA_Buttons.Caption := ' ';
  SendMessage(PA_Buttons.handle,WM_PAINT,0,0);

  if BmodCheck = False then system.exit;  //널값 체크

  ymd := DateCal(ED_CarFrDate.Text,ED_CarToDate.Text);

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
          sql.Add(Format('select empno from pimcarr '+
                         'where (empno = ''%s'') and and (Carfrdate = ''%s'') ',
                         [FM_Main.ED_empno.Text,ED_CarFrDate.Text]));
          Open;

          if QR_du.RecordCount > 0 then
          begin
              Application.Messagebox('기존의 데이타가 존재합니다 !!','작업안내',mb_ok+ mb_IconStop);
              system.Exit;
          end;
        end;

        Tem := Format('insert into pimcarr                                     '+
                      '       (EMPNO,   KORNAME, CARFRDATE, CARTODATE,         '+
                      '        CARDUYY, CARDUMM, CARDUDD,   CARPLACE,          '+
                      '        CARDEPTNM, CARJOBNM, WRITETIME, WRITEEMP)       '+
                      'values (''%s'', ''%s'', ''%s'', ''%s'',                 '+
                      '        ''%s'', ''%s'', ''%s'', ''%s'',                 '+
                      '        ''%s'', ''%s'',                                 '+
                      '        to_char(sysdate, ''YYYYMMDDHH24MISS''),''%s'')  ',
                      [FM_Main.ED_empno.Text,FM_Main.ED_korname.valuecaption,
                       ED_CarFrDate.Text,    ED_CarToDate.Text,
                       copy(ymd,1,2),copy(ymd,3,2),copy(ymd,5,2),
                       ED_Carplace.Text,  ED_CarDeptnm.Text, ED_CarJobnm.Text,
                       FM_Main.FG_pempno]);

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

        PA_Buttons.Caption := '  ☞ 경력사항을 추가 -> 저장 하였습니다. !!. ';
        SendMessage(PA_Buttons.handle,WM_PAINT,0,0);
  end
  else
  begin
        vCarfrdate := Copy(FM_SubForm3.QR_qry.FieldByName('cardate').AsString, 1,4)+
                      Copy(FM_SubForm3.QR_qry.FieldByName('cardate').AsString, 6,2)+
                      Copy(FM_SubForm3.QR_qry.FieldByName('cardate').AsString, 9,2);
        Tem := 'update pimcarr       '+
               '   set CARFRDATE ='''+ED_CarFrDate.Text  +''',                                  '+
               '       CARTODATE ='''+ED_CarToDate.Text  +''',                                  '+
               '       CARDUYY   ='''+copy(ymd,1,2)      +''',                                  '+
               '       CARDUMM   ='''+copy(ymd,3,2)      +''',                                  '+
               '       CARDUDD   ='''+copy(ymd,5,2)      +''',                                  '+
               '       CARPLACE  ='''+ED_Carplace.Text   +''',                                  '+
               '       CARDEPTNM ='''+ED_CarDeptnm.Text  +''',                                  '+
               '       CARJOBNM  ='''+ED_CarJobnm.TExt   +''',                                  '+
               '       writetime =to_char(sysdate, ''YYYYMMDDHH24MISS''),                       '+
               '       writeemp  ='''+FM_Main.FG_pempno+'''                                     '+
               ' where (empno    ='''+FM_Main.ED_empno.Text+''')                                '+
               '   and (Carfrdate='''+vCarfrdate+''')                                           ';

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

        PA_Buttons.Caption := '  ☞ 경력사항을 수정 -> 저장 하였습니다. !!. ';
        SendMessage(PA_Buttons.handle,WM_PAINT,0,0);
  end;

  v_add := '';
end;

function TFM_SubForm4_4.Csel_gfd(p_loc: Integer): String;
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


function TFM_SubForm4_4.BmodCheck : Boolean;
var
  str  : string;
begin
  Result := True;
  str := '';
  if (trim(Ed_Carplace.Text) = '') then
    str := str+'근무처 필드에러'+chr(13)+chr(10)+chr(13)+chr(10);;
  if (trim(ED_CarFrDate.Text) = '') then
    str := str+'근무시작일 필드에러'+chr(13)+chr(10)+chr(13)+chr(10);
  if (trim(ED_CarToDate.Text) = '') then
    str := str+'근무종료일 필드에러'+chr(13)+chr(10)+chr(13)+chr(10);
  with QR_du do
  begin
       Close;
       ServiceName := 'SHR0SSEL';
       ClearFieldInfo;
       AddField('SEL_DATA',ftString,5000);
       Sql.Clear;
       Sql.Text := 'select orgempdate from pimpmas                 '+
                   ' where empno = '''+FM_Main.ED_empno.Text+'''   ';
       Open;
       if  (Csel_gfd(1) >= ED_CarFrDate.Text) and (Csel_gfd(1) <= ED_CarToDate.Text) then
           str := str+'근무기간이 입사일보다 나중입니다. 근무기간에러'+chr(13)+chr(10)+chr(13)+chr(10);
  end;

  if str <> '' then
  begin
    MessageBox(handle,pChar(str),'에  러',MB_OK or $0010);
    Result := False;
  end;
end;

//추가 버튼 클릭시
procedure TFM_SubForm4_4.BT_AddClick(Sender: TObject);
begin
  PA_Buttons.Caption := ' ';
  SendMessage(PA_Buttons.handle,WM_PAINT,0,0);

  Ed_Carplace.Text    :='';
  Ed_Cardeptnm.Text   :='';
  Ed_Carjobnm.Text    :='';
  ED_CarFrDate.Text   :='';
  ED_CarToDate.Text   :='';
  Ed_TotCarr.Text     :='';

  v_add:='A';
end;

//삭제 버튼 클릭시
procedure TFM_SubForm4_4.BT_delClick(Sender: TObject);
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
      sql.Add(Format('select empno from pimcarr '+
                     'where (empno = ''%s'') and (Carfrdate = ''%s'') ',
                     [FM_Main.ED_empno.Text,ED_CarFrDate.Text]));
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

  Tem := Format('delete from pimcarr '+
                ' where (empno = ''%s'') and (Carfrdate = ''%s'') ',
                [FM_Main.ED_empno.Text,ED_CarFrDate.Text]);

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

  Ed_Carplace.Text    :='';
  Ed_Cardeptnm.Text   :='';
  Ed_Carjobnm.Text    :='';
  ED_CarFrDate.Text   :='';
  ED_CarToDate.Text   :='';
  Ed_TotCarr.Text     :='';

  PA_Buttons.Caption := '  ☞ 경력사항을 삭제 하였습니다. !!. ';
  SendMessage(PA_Buttons.handle,WM_PAINT,0,0);

end;

procedure TFM_SubForm4_4.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  Close;
end;

procedure TFM_SubForm4_4.ED_CarFrDateExit(Sender: TObject);
var
     compname,  ymd : String;
begin
     if Sender is TOnMaskEdit then            //날짜 error 검사 처리.
     begin
          compname := (Sender as TOnMaskEdit).text;
          try
             compname := FormatDateTime('yyyymmdd',MyStrToDate(compname));
          except
             showmessage('근무기간의 ' + compname + '라는 날짜는 없습니다. 확인바랍니다.');
             exit;
          end;
     end;
     ymd := DateCal(ED_CarFrDate.Text,ED_CarToDate.Text);
     Ed_TotCarr.Text := copy(ymd,1,2)+'년'+
                        copy(ymd,3,2)+'월'+
                        copy(ymd,5,6)+'일';
end;

function TFM_SubForm4_4.MyStrToDate(s : string) : TDateTime;
var
     Year, Month, Day : word;
begin
     year := StrToInt(copy(s,1,4));
     Month:= StrToInt(copy(s,5,2));
     Day  := strToInt(copy(s,7,2));
     Result := encodedate(Year,Month,Day);
end;


end.
