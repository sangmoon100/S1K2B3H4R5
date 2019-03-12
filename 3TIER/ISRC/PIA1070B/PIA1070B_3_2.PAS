unit PIA1070B_3_2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OnEditStdCtrl, OnEditCombo, ExtCtrls, OnShapeLabel, OnEditBaseCtrl,
  OnEditBtnCtrl, OnTmaxCodeEdit, OnScheme, StdCtrls, OnFocusButton, Db,
  Tmax_DataSetText, OnEditMdate,func;

type
  TFM_SubForm2_2 = class(TForm)
    FM_SubForm2_2: TOnSchemeForm;
    TDml: TTMaxDataSet;
    QR_du: TTMaxDataSet;
    Panel1: TPanel;
    OnShapeLabel1: TOnShapeLabel;
    ED_family: TTMaxCodePopupEdit;
    OnShapeLabel2: TOnShapeLabel;
    ED_korname: TOnEdit;
    OnShapeLabel3: TOnShapeLabel;
    ED_dongyn: TOnComboEdit;
    OnShapeLabel4: TOnShapeLabel;
    ED_faschgr: TTMaxCodePopupEdit;
    OnShapeLabel5: TOnShapeLabel;
    ED_bitthday: TOnMaskEdit;
    OnShapeLabel6: TOnShapeLabel;
    ED_job: TTMaxCodePopupEdit;
    OnShapeLabel7: TOnShapeLabel;
    ED_paycl: TOnEdit;
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
    Label2: TLabel;
    procedure BT_closeClick(Sender: TObject);
    procedure BT_saveClick(Sender: TObject);
    procedure BT_AddClick(Sender: TObject);
    procedure BT_delClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }

    function BmodCheck : Boolean;

  public
    { Public declarations }
    v_add : string;
    function  Insert_PIHFAMILOG(v_modflag : string) : Boolean;
    procedure Initialize_Fields(v_modflag : string);

  end;

var
  FM_SubForm2_2: TFM_SubForm2_2;


implementation

uses PIA1070B_1, PIA1070B_3;

{$R *.DFM}

procedure TFM_SubForm2_2.BT_closeClick(Sender: TObject);
begin
  Close;
end;

// 저장 버튼 클릭시
procedure TFM_SubForm2_2.BT_saveClick(Sender: TObject);
var
  Tem : String;
begin
  PA_Buttons.Caption := ' ';
  SendMessage(PA_Buttons.handle,WM_PAINT,0,0);

  if not(BmodCheck) then system.exit;  //널값 체크

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
          sql.Add(Format('select empno from pimfami '+
                         'where (empno = ''%s'') and (facode = ''%s'') and (faname = ''%s'')',
                         [FM_Main.ED_empno.Text,ED_family.codeno,ED_korname.text ]));
          Open;

          if QR_du.RecordCount > 0 then
            begin
              Application.Messagebox('기존의 데이타가 존재합니다 !!','작업안내',mb_ok+ mb_IconStop);
              system.Exit;
            end;
        end;

        Tem := Format('insert into pimfami '+
                      '(empno,korname,facode,faname,fawith, '+
                      ' faschgr,fabirthdate,faallowyn,famedyn,'+
                      ' fajobcode,faplace,writetime,writeemp) values ('+
                      ' ''%s'',''%s'',''%s'',''%s'',''%s'','+
                      //2014.12.10.hjku..가족수당여부 default'Y'로 변경.. 이명노M 요청
                      //' ''%s'',''%s'',''N'',''N'','+
                      ' ''%s'',''%s'',''Y'',''N'','+
                      ' ''%s'',''%s'',to_char(sysdate, ''YYYYMMDDHH24MISS''),''%s'')',
                      [FM_Main.ED_empno.Text,FM_Main.ED_korname.valuecaption,ED_family.codeno,ED_korname.Text,
                       ED_dongyn.KeyItems[ED_dongyn.ItemIndex],ED_faschgr.codeno,ED_bitthday.text,
                       ED_job.codeno,ED_paycl.Text,FM_Main.FG_pempno]);

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

        PA_Buttons.Caption := '  ☞ 가족사항을 추가 -> 저장 하였습니다. !!. ';
        SendMessage(PA_Buttons.handle,WM_PAINT,0,0);
      end
    else
      begin
        //2015.01.08.hjku. 변경이력 추가..전지영M 요청
        if not(Insert_PIHFAMILOG('U')) then system.exit;

        Tem := Format('update pimfami set '+
                      'facode=''%s'',faname=''%s'',fawith=''%s'','+
                      'faschgr=''%s'',fabirthdate=''%s'','+
                      'fajobcode=''%s'',faplace=''%s'',writetime=to_char(sysdate, ''YYYYMMDDHH24MISS''),writeemp=''%s'' '+
                      'where (empno=''%s'') and (facode=''%s'') and (faname = ''%s'') ',
                      [ED_family.codeno,ED_korname.Text,ED_dongyn.KeyItems[ED_dongyn.ItemIndex],
                       ED_faschgr.codeno,ED_bitthday.text,
                       ED_job.codeno,ED_paycl.Text,FM_Main.FG_pempno,
                       //2015.01.12.hjku.. 오류로 변경..
                       //FM_Main.ED_empno.Text,FM_SubForm2.QR_fa.FieldByName('facode').AsString,FM_SubForm2.QR_fa.FieldByName('faname').AsString  ]);
                       FM_Main.ED_empno.Text,ED_family.codeno,ED_korname.text  ]);

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

        PA_Buttons.Caption := '  ☞ 가족사항을 수정 -> 저장 하였습니다. !!. ';
        SendMessage(PA_Buttons.handle,WM_PAINT,0,0);
      end;
  if copy(ED_family.codeno,1,1) = '3' then
  begin
       with TDml do
       begin
            Close;
            Sql.Clear;
            ServiceName := 'PIB3012A_dml';

            Sql.Add('update  pimpmas                                             ');
            Sql.Add('   set  MARRIGEYN = ''Y'',                                  ');
            Sql.Add('        writetime = to_char(sysdate, ''YYYYMMDDHH24MISS''), ');
            Sql.Add('        writeemp  = '''+FM_Main.FG_pempno+'''               ');
            Sql.Add(' where  empno     = '''+FM_Main.ED_empno.Text+'''           ');
            if not Execute then
            begin
                Application.Messagebox('저장에 실패했습니다.A','작업안내',mb_ok+ mb_IconStop);
            end;
       end;
  end;

  //2015.01.12.hjku.. 저장후 수정 모드로...
  //v_add := '';
  Initialize_Fields('U');

  //2015.01.12.hjku.. 재 조회 추가
  FM_SubForm2.PL_Select_Data;
end;


function TFM_SubForm2_2.BmodCheck : Boolean;
var
  str  : string;
begin
{//2015.01.08.hjku. 유효성 검사 변경 및 추가
  Result := True;
  str := '';
  if (trim(ED_family.Text) = '') then
    str := str+'가족관계 필드에러'+chr(13)+chr(10)+chr(13)+chr(10);;
  if (trim(ED_korname.Text) = '') then
    str := str+'가족성명 필드에러'+chr(13)+chr(10)+chr(13)+chr(10);

  if str <> '' then begin
    MessageBox(handle,pChar(str),'에  러',MB_OK or $0010);
    Result := False;
  end;
}
  BmodCheck := false;

  //2014.01.09.hjku.. 화면에서 보여지는 값만 삭제시 오류발생하여 초기화 함..
  if(trim(ED_family.text)='')  then ED_family.codeno  := '';
  if(trim(ED_faschgr.text)='') then ED_faschgr.codeno := '';
  if(trim(ED_job.text)='')     then ED_job.codeno     := '';  

  if(trim(ED_family.codeno)='') then
  begin
      Application.Messagebox('가족관계는 반드시 입력하여야 합니다.','입력안내',mb_ok);
      ED_family.SetFocus();
      Exit;
  end;

  //특수문자(스페이스포함)  제외함.
  ED_korname.text := FM_Main.RemoveSpecialChar(ED_korname.text);

  if(trim(ED_korname.text)='') then
  begin
      Application.Messagebox('가족명은 반드시 입력하여야 합니다.','입력안내',mb_ok);
      ED_korname.SetFocus();
      Exit;
  end;

  if(trim(ED_bitthday.text)='') then
  begin
      Application.Messagebox('생년월일은 반드시 입력하여야 합니다.','입력안내',mb_ok);
      ED_bitthday.SetFocus();
      Exit;
  end;

  if not DateCheck(ED_bitthday.text) then
  begin
      Application.Messagebox('입력한 생년월일이 유효하지 않습니다.','입력안내',mb_ok);
      ED_bitthday.SetFocus();      
      Exit;
  end;

  BmodCheck := true;
end;

//추가 버튼 클릭시
procedure TFM_SubForm2_2.BT_AddClick(Sender: TObject);
begin
{2015.01.12.hjku. 함수로 묶음..
  PA_Buttons.Caption := ' ';
  SendMessage(PA_Buttons.handle,WM_PAINT,0,0);

  ED_family.Text      := '';
  ED_korname.Text     := '';
  ED_dongyn.Text      := '';
  ED_faschgr.Text     := '';
  ED_bitthday.Text    := '';
  ED_job.Text         := '';
  ED_paycl.Text       := '';

  //2015.01.08.hjku. 초기화 누락 부분 추가..
  ED_dongyn.ItemIndex := 1;
  ED_family.codeno    := '';
  ED_faschgr.codeno   := '';
  ED_job.codeno       := '';

  v_add:='A';
}
   Initialize_Fields('I');
end;

//삭제 버튼 클릭시
procedure TFM_SubForm2_2.BT_delClick(Sender: TObject);
var
  Tem : string;
begin
  PA_Buttons.Caption := ' ';
  SendMessage(PA_Buttons.handle,WM_PAINT,0,0);

  {2015.01.07.hjku.  가족수당 의미가 없어 체크 삭제.. 팀장..
  if FM_SubForm2.QR_fa.FieldByName('faallowyn').AsString = 'Y' then begin
     MessageBox(handle,'가족수당이 [Y]라 삭제할 수 없습니다 !!.','알  림',MB_OK or $0030);
     system.Exit;
  end;
  }
  if not(BmodCheck) then system.Exit;

  // 기존 데이터 유무 체크
  with QR_du do
    begin
      Close;
      ServiceName := 'SHR0SSEL';
      ClearFieldInfo;
      AddField('SEL_DATA',ftString,5000);
      Sql.Clear;
      sql.Add(Format('select empno from pimfami '+
                     'where (empno = ''%s'') and (facode = ''%s'') and (faname = ''%s'')',
                     [FM_Main.ED_empno.Text,ED_family.codeno,ED_korname.text ]));
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

  //2015.01.08.hjku. 변경이력 추가..전지영M 요청
  if not(Insert_PIHFAMILOG('D')) then system.exit;

  Tem := Format('delete from pimfami '+
                'where (empno=''%s'') and (facode=''%s'') and (faname = ''%s'')',
                [FM_Main.ED_empno.Text,ED_family.codeno,ED_korname.Text ]);

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

  if copy(ED_family.codeno,1,1) = '3' then
  begin
       with TDml do
       begin
            Close;
            Sql.Clear;
            ServiceName := 'PIB3012A_dml';

            Sql.Add('update  pimpmas                                             ');
            Sql.Add('   set  MARRIGEYN = ''N'',                                  ');
            Sql.Add('        writetime = to_char(sysdate, ''YYYYMMDDHH24MISS''), ');
            Sql.Add('        writeemp  = '''+FM_Main.FG_pempno+'''               ');
            Sql.Add(' where  empno     = '''+FM_Main.ED_empno.Text+'''           ');
            if not Execute then
            begin
                Application.Messagebox('삭제에 실패했습니다.A','작업안내',mb_ok+ mb_IconStop);
            end;
       end;
  end;


  {2015.01.12.hjku.. 삭제후에는 추가 모드로..
  ED_family.Text :='';
  ED_korname.Text :='';
  ED_dongyn.Text :='';
  ED_faschgr.Text :='';
  ED_bitthday.Text :='';
  ED_job.Text :='';
  ED_paycl.Text :='';
  }
  Initialize_Fields('I');

  PA_Buttons.Caption := '  ☞ 가족사항을 삭제 하였습니다. !!. ';
  SendMessage(PA_Buttons.handle,WM_PAINT,0,0);

  //2015.01.12.hjku.. 재 조회 추가
  FM_SubForm2.PL_Select_Data;  
end;

procedure TFM_SubForm2_2.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  Close;
end;

function  TFM_SubForm2_2.Insert_PIHFAMILOG(v_modflag : string) : Boolean;
var
    Tem : string;
begin
    Insert_PIHFAMILOG := false;

    Tem :=  'INSERT INTO PIHFAMILOG                                                       ' + #13#10 +
            'SELECT TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'') MODTIME,                        ' + #13#10 +
            '       ''' + v_modflag + ''' MODFLAG,                                        ' + #13#10 +
            '       ''' + FM_Main.FG_pempno + ''' MODEMP,                                 ' + #13#10 +
            '       ''PIA1070B'' PIPROGID,                                                ' + #13#10 +
            '       A.* FROM PIMFAMI A                                                    ' + #13#10 +
            'WHERE EMPNO  = ''' + FM_Main.ED_empno.Text + '''                             ' + #13#10 +
            '  AND FACODE = ''' + ED_family.codeno      + '''                             ' + #13#10 +
            '  AND FANAME = ''' + ED_korname.text       + '''                             ';
            //'  AND FACODE = ''' + FM_SubForm2.QR_fa.FieldByName('facode').AsString + '''  ' + #13#10 +
            //'  AND FANAME = ''' + FM_SubForm2.QR_fa.FieldByName('faname').AsString + '''  ';

    with TDml do
      begin
        Close;
        Sql.Clear;
        Sql.text := Tem;
        ServiceName := 'PIB3012A_dml';
        if not Execute then
          begin
            Application.Messagebox('수정이력 저장에 실패했습니다.I','작업안내',mb_ok+ mb_IconStop);
          end;
      end;

    Insert_PIHFAMILOG := true;      
end;

//2015.01.08.hjku.. 초기화 추가..
procedure TFM_SubForm2_2.Initialize_Fields(v_modflag : string);
begin
    if(v_modflag ='I') then
    begin
        PA_Buttons.Caption := ' ';
        SendMessage(PA_Buttons.handle,WM_PAINT,0,0);

        ED_family.Text      := '';
        ED_korname.Text     := '';
        ED_dongyn.Text      := '';
        ED_faschgr.Text     := '';
        ED_bitthday.Text    := '';
        ED_job.Text         := '';
        ED_paycl.Text       := '';

        //2015.01.08.hjku. 초기화 누락 부분 추가..
        ED_dongyn.ItemIndex := 1;
        ED_family.codeno    := '';
        ED_faschgr.codeno   := '';
        ED_job.codeno       := '';

        v_add:='A';

        ED_family.enabled   := true;
        ED_korname.enabled  := true;

        BT_Add.Enabled      := true;
        BT_del.Enabled      := false;
        BT_save.Enabled     := true;
        BT_close.Enabled    := true;
    end
    else if(v_modflag ='U') then
    begin
        v_add:='';

        ED_family.enabled   := false;
        ED_korname.enabled  := false;

        BT_Add.Enabled      := true;
        BT_del.Enabled      := true;
        BT_save.Enabled     := true;
        BT_close.Enabled    := true;
    end
    else if(v_modflag ='D') then
    begin
        v_add:='';
        ED_family.enabled   := false;
        ED_korname.enabled  := false;

        BT_Add.Enabled      := false;
        BT_del.Enabled      := false;
        BT_save.Enabled     := false;
        BT_close.Enabled    := true;
    end;

    if not((FM_Main.FG_pempno = FM_Main.ED_empno.Text) and (copy(FM_Main.FG_Grade,2,1) <= 'B')) then
    begin
        ED_family.enabled   := false;
        ED_korname.enabled  := false;

        if(ED_korname.text='') then BT_save.Enabled     := false
        else BT_save.Enabled     := true;

        BT_Add.Enabled      := false;
        BT_close.Enabled    := true;
    end;

end;
end.
