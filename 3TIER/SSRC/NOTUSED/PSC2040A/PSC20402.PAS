unit psc20402;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Db, DBClient,
  Tmax_DataSetText, Mask, numedit, Kylib1, OnGrDBGrid, OnEditNumCtl,
  OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl, OnEditMdate, OnFocusButton,
  ComCtrls, OnShapeLabel ;

type
  TDetailForm = class(TForm)
    Panel1: TPanel;
    Panel19: TPanel;
    DS_pswddis: TDataSource;
    L_bspassyn: TLabel;
    CDS_pswddis: TTMaxDataSet;
    TDS2: TTMaxDataSet;
    TDS_dml2: TTMaxDataSet;
    DBGrid1: TOnGrDbGrid;
    M_intrtp: TMemo;
    ME_sdate: TOnDateEdit;
    NE_sseqno: TOnNumberEdit;
    NE_samt: TOnNumberEdit;
    BB_Insert: TOnFocusButton;
    BB_Save: TOnFocusButton;
    BB_delete: TOnFocusButton;
    BB_cancel: TOnFocusButton;
    BB_Close: TOnFocusButton;
    StatusBar1: TStatusBar;
    OnShapeLabel2: TOnShapeLabel;
    Panel3: TPanel;
    Panel2: TPanel;
    RB_wdispt_1: TRadioButton;
    RB_wdispt_2: TRadioButton;
    RB_wdispt_3: TRadioButton;
    OnShapeLabel1: TOnShapeLabel;
    Shape1: TShape;
    procedure FormActivate(Sender: TObject);
    procedure DS_pswddisDataChange(Sender: TObject; Field: TField);
    procedure BB_InsertClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BB_deleteClick(Sender: TObject);
    procedure BB_cancelClick(Sender: TObject);
    procedure BB_SaveClick(Sender: TObject);
    procedure BB_exitClick(Sender: TObject);
    procedure ME_sdateExit(Sender: TObject);
    procedure RB_wdispt_1Click(Sender: TObject);
  private
    { Private declarations }
    ParamVariant : String;
    sqlstr       : String;
    msg          : String;
  public
    { Public declarations }
    Save_SUBDATE, Save_WDISPT: String;
    Save_SSEQNO: Real;
    Job_mode: Integer;  {0.열람/무효, 1.입력, 2.수정}

    procedure RetrieveData;
    procedure DataAllClear;
  end;

var
  DetailForm: TDetailForm;

implementation
{$R *.DFM}
uses
  psc20401 ;

procedure TDetailForm.FormActivate(Sender: TObject);
begin
  DataAllClear;
  StatusBar1.Panels[1].Text := '세부사유 등록사항을 읽고있습니다.';
  Application.ProcessMessages;

  Save_SUBDATE := '';
  Save_WDISPT  := '';
  Save_SSEQNO  := 0;

  RetrieveData;
  StatusBar1.Panels[1].Text := '작업하세요.';
end;

procedure TDetailForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CDS_pswddis.Close;
  CanClose := True;
end;

procedure TDetailForm.RetrieveData;
var
  Par : String;
begin
  Job_mode := 0;

  DataAllClear;

  Par :=  'select  nvl(        a.empno           ,'' ''), '+
          '        nvl(        a.korname         ,'' ''), '+
          '        nvl(        a.depositno       ,'' ''), '+
          '        nvl(        a.subdate         ,'' ''), '+
          '        nvl(to_char(a.sseqno         ),''0''), '+
          '        nvl(        a.wdissue         ,'' ''), '+
          '        nvl(        a.wdispt          ,'' ''), '+
          '        nvl(decode(a.wdispt,''1'',''계약금'',''2'',''중도금'',''3'',''잔금'','' '') ,'' ''), '+
          '        nvl(        a.sdate           ,'' ''), '+
          '        nvl(to_char(a.samt           ),''0''), '+
          '        nvl(        a.bspassyn        ,'' ''), '+
          '        nvl(        a.reqdate         ,'' ''), '+
          '        nvl(        a.reqyn           ,'' ''), '+
          '        nvl(        a.reqyndate       ,'' ''), '+
          '        nvl(        a.saveyn          ,'' ''), '+
          '        nvl(        a.wddate          ,'' ''), '+
          '        nvl(        intrpt            ,'' '')  '+
          '  from  pswddis a, pswdibas b                  '+
          ' where  empno   = ''' + MainForm.E_empno.empno + '''    '+
          '   and  subdate = ''' + MainForm.ME_subdate.NoFormatDate + ''' '+
          '   and  a.wdissue = b.wdissue(+)';

  with CDS_pswddis do
    begin
      ServiceName := 'PSC2040A_sel5';
      Close;
      Sql.Clear;
      Sql.Add(Par);

      ClearFieldInfo;
      AddField('EMPNO'        , ftString,  4);
      AddField('KORNAME'      , ftString,  12);
      AddField('DEPOSITNO'    , ftString,  6);
      AddField('SUBDATE'      , ftString,  8);
      AddField('SSEQNO'       , ftInteger, 2);
      AddField('WDISSUE'      , ftString,  3);
      AddField('WDISPT'       , ftString,  1);
      AddField('WDISPTNM'     , ftString,  10);
      AddField('SDATE'        , ftString,  8);
      AddField('SAMT'         , ftInteger, 9);
      AddField('BSPASSYN'     , ftString,  1);
      AddField('REQDATE'      , ftString,  8);
      AddField('REQYN'        , ftString,  1);
      AddField('REQYNDATE'    , ftString,  8);
      AddField('SAVEYN'       , ftString,  1);
      AddField('WDDATE'       , ftString,  8);
      AddField('INTRPT'       , ftString,  300);
      Open;
    end;

  if CDS_pswddis.RecordCount > 0 then
    begin
      if CDS_pswddis.Locate('SUBDATE',VarArrayOf([Save_SUBDATE]),[loPartialKey]) then
        while Not CDS_pswddis.Eof do
          begin
            if CDS_pswddis.FieldByName('WDISPT').AsString = Save_WDISPT then
              begin
                while Not CDS_pswddis.Eof do
                  begin
                    if CDS_pswddis.FieldByName('SSEQNO').AsFloat = Save_SSEQNO then Exit;
                    CDS_pswddis.Next;
                  end;
              end;
            CDS_pswddis.Next;
          end;
      DBGrid1.SetFocus;
    end;
end;

procedure TDetailForm.DataAllClear;
begin
  RB_wdispt_1.Checked := True;
  NE_sseqno.Value     := 1;
  ME_sdate.NoFormatDate := '';
  NE_samt.Value       := 0;
  L_bspassyn.Caption  := 'N';  // 기준통과여부
  M_intrtp.Lines.Clear;
end;

procedure TDetailForm.DS_pswddisDataChange(Sender: TObject; Field: TField);
begin
  if CDS_pswddis.RecordCount = 0 then // 한건도 없음
    begin
      Job_mode := 0;
      System.Exit;
    end;
  Job_mode := 2; {수정}

  if CDS_pswddis.FieldByName('WDISPT').AsString = '1' then
    RB_wdispt_1.Checked := True
  else if CDS_pswddis.FieldByName('WDISPT').AsString = '2' then
    RB_wdispt_2.Checked := True
  else if CDS_pswddis.FieldByName('WDISPT').AsString = '3' then
    RB_wdispt_3.Checked := True
  else
    RB_wdispt_1.Checked := True;

  NE_sseqno.Value       := CDS_pswddis.FieldByName('SSEQNO').AsFloat;
  ME_sdate.NoFormatDate := CDS_pswddis.FieldByName('SDATE').AsString;
  NE_samt.Value         := CDS_pswddis.FieldByName('SAMT').AsFloat;
  L_bspassyn.Caption    := CDS_pswddis.FieldByName('BSPASSYN').AsString;  // 기준통과여부
  M_intrtp.Lines.Text   := CDS_pswddis.FieldByName('INTRPT').AsString;   // 제출서류
end;

procedure TDetailForm.ME_sdateExit(Sender: TObject);
var
  FromDate, ToDate: String;
begin
  if (Length(ME_sdate.NoFormatDate ) <> 8) or
     (ME_sdate.NoFormatDate = '00000000') or
     (Length(MainForm.ME_subdate.NoFormatDate) <> 8)or
     (MainForm.ME_subdate.NoFormatDate = '00000000') then // 메인.신청일자
    System.Exit;

  sqlstr :=  'SELECT nvl(to_char(plmonth        ),''0''),   '+
             '       nvl(to_char(flmonth        ),''0'')    '+
             ' FROM  PSWDIBAS                               '+
             ' WHERE (WDISSUE = '''+MainForm.E_wdissue.Text+''') ';

  with TDS2 do
    begin
      ServiceName := 'PSC2040A_sel6';
      Close;
      Sql.Clear;
      Sql.Add(sqlstr);

      ClearFieldInfo;
      AddField('PLMONTH'      , ftInteger   ,  2   );
      AddField('FLMONTH'      , ftInteger   ,  2   );
      Open;
    end;

  if TDS2.RecordCount > 0 then
    begin
      FromDate := CalcMonth(Copy(MainForm.ME_subdate.NoFormatDate,1,6),
                          (-1 * TDS2.FieldByName('PLMONTH').AsInteger))+
                  Copy(MainForm.ME_subdate.NoFormatDate,7,2);
      ToDate   := CalcMonth(Copy(MainForm.ME_subdate.NoFormatDate,1,6),
                          TDS2.FieldByName('FLMONTH').AsInteger)+
                  Copy(MainForm.ME_subdate.NoFormatDate,7,2);

    // 인출사유발생일이 이전,이후 한도를 벗어나면
      if (ME_sdate.NoFormatDate < FromDate) or (ME_sdate.NoFormatDate > ToDate) then
        begin
          MessageBox(Handle, '신청일을 기준으로 납입일자가 인출한도개원수를 초과했습니다.', '입력오류', MB_ICONWARNING);
          TDS2.Close;
          L_bspassyn.Caption := 'N';  // 기준통과여부
          System.Exit;
        end;

      L_bspassyn.Caption := 'Y';  // 기준통과여부
    end;

  TDS2.Close;
end;

procedure TDetailForm.BB_InsertClick(Sender: TObject);
var
   Found : Boolean;
begin
  ParamVariant :=  'select  nvl(        wdissue         ,'' ''),       '+
                   '        nvl(        codename        ,'' '')        '+
                   '  from  pswddis a, pyccode b                       '+
                   ' where  empno   = '''+MainForm.E_empno.empno+'''    '+
                   '   and  subdate = '''+MainForm.ME_subdate.NoFormatDate+''' '+
                   '   and  codeid(+) = ''S210''                       '+
                   '   and  wdissue = codeno(+)                        '+
                   'group by wdissue, codename                         ';

  with TDS2 do
    begin
      ServiceName := 'PSC2040A_sel7';
      Close;
      Sql.Clear;
      Sql.Add(ParamVariant);

      ClearFieldInfo;
      AddField('WDISSUE'      , ftString    ,  3   );
      AddField('CODENAME'     , ftString    ,  20  );
    end;

  Found := False;
  while not TDS2.eof do
    begin
      if system.pos('계약',TDS2.FieldByName('codename').AsString) <> 0 then
        begin
          Found := True;
          system.Break;
        end;
      TDS2.Next;
    end;

  TDS2.close;

  if Found then
    begin
      msg := '주택관련 계약금지급을 목적으로 인출사유가 발생한 경우는' + #13 + #13 +
             '세부사유를 2건 이상 등록하실 수 없습니다.';

      MessageBox(Handle,pchar(msg), '작업안내', MB_ICONWARNING);
      system.exit;
    end;

  Job_mode := 1; {추가}
  DataAllClear;
  // =================================================
  // 1. 수 정 일 : 1999.04.08
  // 2. 수 정 자 : 김승회
  // 3. 수정내용 : 데이콤용을 하나로용으로 Conversion
  // =================================================

  if system.pos('계약금',trim(MainForm.P_wdissueNAME.Text)) <> 0 then
     RB_wdispt_1.Checked := True
  else if system.pos('중도금',trim(MainForm.P_wdissueNAME.Text)) <> 0 then
     RB_wdispt_2.Checked := True
  else if system.pos('잔액금',trim(MainForm.P_wdissueNAME.Text)) <> 0 then
     RB_wdispt_3.Checked := True
  else
     RB_wdispt_1.Checked := True;

  ME_sdate.NoFormatDate := MainForm.ME_wdidate.NoFormatDate;
  NE_samt.value := MainForm.NE_subamt.value;
  NE_sseqno.SetFocus;
  StatusBar1.Panels[1].Text := '';
end;

procedure TDetailForm.BB_deleteClick(Sender: TObject);
begin
  if CDS_pswddis.RecordCount = 0 then
    begin
      DataAllClear;
      MessageBox(handle, '등록된 자료가 없으므로 삭제할 수 없습니다',
                         '작업안내', MB_ICONWARNING);
      System.Exit;
    end;

  if CDS_pswddis.FieldByName('REQYN').AsString <> '' then  // 접수확인이 is not null이면 삭제금지
    begin
      MessageBox(Handle, '접수확인된 자료는 삭제할 수 없습니다.', '입력오류', MB_ICONWARNING);
      System.Exit;
    end;

  if Application.MessageBox('선택한 자료를 삭제하시겠습니까?', '작업안내',
                            MB_OKCANCEL + MB_DefButton1) = IDOK then
    begin
      ParamVariant := 'DELETE FROM PSWDDIS '+
                      '  WHERE (EMPNO      = '''+CDS_pswddis.FieldByName('EMPNO').AsString+''') and '+
                      '        (SUBDATE    = '''+CDS_pswddis.FieldByName('SUBDATE').AsString+''') and '+
                      '        (SSEQNO     = '+FloatToStr(CDS_pswddis.FieldByName('SSEQNO').AsFloat)+') and '+
                      '        (WDISPT     = '''+CDS_pswddis.FieldByName('WDISPT').AsString+''') ';
      with TDS_dml2 do
        begin
          ServiceName := 'PSC2040A_dml';
          Close;
          Sql.Clear;
          Sql.Add(ParamVariant);

          if TDS_dml2.Execute then
            Showmessage('선택한 자료를 삭제하였습니다.')
          else
            begin
              Showmessage('삭제에 실패했습니다.');
              System.Exit;
            end;
        end;

      RetrieveData;
      StatusBar1.Panels[1].Text := '선택한 자료를 삭제하였습니다.';
    end;
end;

procedure TDetailForm.BB_cancelClick(Sender: TObject);
begin
  Job_mode := 0;
  DataAllClear;
  if CDS_pswddis.Locate('SUBDATE',Save_SUBDATE,[loPartialKey]) then
    while Not CDS_pswddis.Eof do
      begin
        if CDS_pswddis.FieldByName('WDISPT').AsString = Save_WDISPT then
          begin

            while Not CDS_pswddis.Eof do
              begin
                if CDS_pswddis.FieldByName('SSEQNO').AsFloat = Save_SSEQNO then
                  begin
                    DBGrid1.SetFocus;
                    Exit;
                  end;
                CDS_pswddis.Next;
              end;

          end;
        CDS_pswddis.Next;
      end;
  StatusBar1.Panels[1].Text := '  작업이 취소되었습니다.';
end;

procedure TDetailForm.BB_SaveClick(Sender: TObject);
begin
  StatusBar1.Panels[1].Text := '';
  if Job_mode = 0 then
    begin
      DataAllClear;
      MessageBox(handle, '작업한 내용이 없습니다.  저장할 수 없습니다.',
                         '작업안내', MB_ICONWARNING);
      System.Exit;
    end
  else if Job_mode = 1 then  // 추가
    begin
      if NE_sseqno.Value <= 0 then
        begin
          MessageBox(Handle, '납입회차를 정확히 입력하세요.', '입력오류', MB_ICONWARNING);
          System.Exit;
        end;

      if (Length(ME_sdate.NoFormatDate) <> 8) or
         (ME_sdate.NoFormatDate = '00000000') then
        begin
          MessageBox(Handle, '납입일자를 정확히 입력하세요.', '입력오류', MB_ICONWARNING);
          System.Exit;
        end;

      if NE_samt.Value <= 0 then
        begin
          MessageBox(Handle, '납입금액을 정확히 입력하세요.', '입력오류', MB_ICONWARNING);
          System.Exit;
        end;

      ParamVariant := 'INSERT INTO PSWDDIS '+
                     '   (EMPNO, KORNAME, DEPOSITNO, '+
                     '    SUBDATE, SSEQNO, WDISSUE, '+
                     '    WDISPT, SDATE, SAMT, '+
                     '    BSPASSYN, SAVEYN, '+
                     '    WRITETIME, WRITEMAN) '+
                     ' VALUES ('''+MainForm.E_empno.empno+''', '''+MainForm.E_empno.Korname+''', '''+MainForm.P_depositno.Text+''', ';
      ParamVariant := ParamVariant + ' '''+MainForm.ME_subdate.NoFormatDate+''', '+FloatToStr(NE_sseqno.Value)+', '''+MainForm.E_wdissue.Text+''', ';

      if RB_wdispt_1.Checked = True then
        ParamVariant := ParamVariant + ' ''1'', '
      else if RB_wdispt_2.Checked = True then
        ParamVariant := ParamVariant + ' ''2'', '
      else if RB_wdispt_3.Checked = True then
        ParamVariant := ParamVariant + ' ''3'', '
      else
        ParamVariant := ParamVariant + ' '''', ';

      ParamVariant := ParamVariant + ' '''+ME_sdate.NoFormatDate+''', '+FloatToStr(NE_samt.Value)+', '+
                    '         '''+L_bspassyn.Caption+''', ''N'', '+
                    '         to_char(sysdate,''yyyymmddhh24miss''), ''' + MainForm.Pempno + ''')';
      with TDS_dml2 do
        begin
          ServiceName := 'PSC2040A_dml';
          Close;
          Sql.Clear;
          Sql.Add(ParamVariant);
        end;

      if not TDS_dml2.Execute then
         Showmessage('신규 자료가 등록되었습니다.')
      else
        begin
          Showmessage('신규 자료 등록에 실패했습니다.');
          System.Exit;
        end;

      StatusBar1.Panels[1].Text := '  신규 자료가 등록되었습니다.';
    end
  else  // Job_mode = 2, 저장
    begin
      if CDS_pswddis.RecordCount = 0 then
        begin
          DataAllClear;
          MessageBox(handle, '등록된 자료가 없으므로 저장할 수 없습니다',
                             '작업안내', MB_ICONWARNING);
          System.Exit;
        end;

      if NE_sseqno.Value <= 0 then
        begin
          MessageBox(Handle, '납입회차를 정확히 입력하세요.', '입력오류', MB_ICONWARNING);
          System.Exit;
        end;

      if (Length(ME_sdate.NoFormatDate) <> 8) or
         (ME_sdate.NoformatDate ='00000000') then
        begin
          MessageBox(Handle, '납입일자를 정확히 입력하세요.', '입력오류', MB_ICONWARNING);
          System.Exit;
        end;

      if NE_samt.Value <= 0 then
        begin
          MessageBox(Handle, '납입금액을 정확히 입력하세요.', '입력오류', MB_ICONWARNING);
          System.Exit;
        end;

      if CDS_pswddis.FieldByName('REQYN').AsString <> '' then  // 접수확인이 is not null이면 저장금지
        begin
          MessageBox(Handle, '접수확인된 자료는 저장할 수 없습니다.', '입력오류', MB_ICONWARNING);
          System.Exit;
        end;

      ParamVariant := 'UPDATE PSWDDIS '+
                    '    SET SDATE     = '''+ME_sdate.NoFormatDate+''', '+
                    '        SAMT      = '''+FloatToStr(NE_samt.Value)+''', '+
                    '        WRITETIME = TO_CHAR(SYSDATE, ''YYYYMMDDHH24MISS''), '+
                    '        WRITEMAN  = '''+MainForm.Pempno+''' '+
                    '  WHERE (EMPNO    = '''+CDS_pswddis.FieldByName('EMPNO').AsString+''')  '+
                    '    AND (SUBDATE  = '''+CDS_pswddis.FieldByName('SUBDATE').AsString+''')  '+
                    '    AND (SSEQNO   = '+FloatToStr(CDS_pswddis.FieldByName('SSEQNO').AsFloat)+')  '+
                    '    AND (WDISPT   = '''+CDS_pswddis.FieldByName('WDISPT').AsString+''') ';

      with TDS_dml2 do
        begin
          ServiceName := 'PSC2040A_dml';
          Close;
          Sql.Clear;
          Sql.Add(ParamVariant);
        end;

      if not TDS_dml2.Execute then
         Showmessage('기존 자료를 수정하였습니다.')
      else
        begin
          Showmessage('기존 자료 수정에 실패 하였습니다.');
          System.Exit;
        end;
      StatusBar1.Panels[1].Text := '  기존 자료를 수정하였습니다.';
    end;

  Save_SUBDATE := MainForm.ME_subdate.NoFormatDate;
  if RB_wdispt_1.Checked = True then
    Save_WDISPT  := '1'
  else if RB_wdispt_2.Checked = True then
    Save_WDISPT  := '2'
  else if RB_wdispt_3.Checked = True then
    Save_WDISPT  := '3'
  else
    Save_WDISPT  := '4';
  Save_SSEQNO  := NE_sseqno.Value;
  RetrieveData;
end;

procedure TDetailForm.BB_exitClick(Sender: TObject);
begin
  Close;
end;

procedure TDetailForm.RB_wdispt_1Click(Sender: TObject);
begin
  ParamVariant :=  'SELECT   NVL(INTRPT ,'' '') '+
                  '   FROM PSWDIBAS ';
  if CDS_pswddis.FieldByName('WDISPT').AsString = '1' then
    ParamVariant := ParamVariant + ' WHERE (WDISSUE = '''+Copy(MainForm.E_wdissue.text,1,2)+'1'+''') '
  else if CDS_pswddis.FieldByName('WDISPT').AsString = '2' then
    ParamVariant := ParamVariant + ' WHERE (WDISSUE = '''+Copy(MainForm.E_wdissue.text,1,2)+'2'+''') '
  else if CDS_pswddis.FieldByName('WDISPT').AsString = '3' then
    ParamVariant := ParamVariant + ' WHERE (WDISSUE = '''+Copy(MainForm.E_wdissue.text,1,2)+'3'+''') '
  else
    ParamVariant := ParamVariant + ' WHERE (WDISSUE = '''+Copy(MainForm.E_wdissue.text,1,2)+''') ';

  with TDS2 do
    begin
      ServiceName := 'PSC2040A_common';
      Close;
      Sql.Clear;
      Sql.Add( ParamVariant );

      ClearFieldInfo;
      AddField('INTRPT'       , ftString    ,  2000 );

      Open;
    end;

  if TDS2.RecordCount > 0 then
    M_intrtp.Lines.Text :=  TDS2.FieldByName('INTRPT').AsString  // 제출서류
  else
    M_intrtp.Lines.Clear;
    
  TDS2.Close;
end;

end.
 