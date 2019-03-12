unit PTA40102;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OnScheme, OnPopupEdit, OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl,
  OnTmaxPersonEdit, Grids, DBGridEh, StdCtrls, OnFocusButton, Db,
  Tmax_DataSetText, Mask, OnEditCombo, Tmax_session;

type
  TfrmReg = class(TForm)
    SF_Sub: TOnSchemeForm;
    ED_dept: TOnWinPopupEdit;
    ED_payra: TOnWinPopupEdit;
    ED_cpdate: TOnWinPopupEdit;
    B_insert: TOnFocusButton;
    B_save: TOnFocusButton;
    OnFocusButton3: TOnFocusButton;
    B_delete: TOnFocusButton;
    B_Exit: TOnFocusButton;
    B_Batch: TOnFocusButton;
    TDS_Grid1: TTMaxDataSet;
    DS_Grid1: TDataSource;
    DBGridEh1: TDBGridEh;
    TDS_dml: TTMaxDataSet;
    ED_gubun: TOnComboEdit;
    FileOpenDlg: TOpenDialog;
    TDS_Sel: TTMaxDataSet;
    B_Search: TOnFocusButton;
    ED_empno: TTMaxPersonPopupEdit;
    B_excel: TOnFocusButton;
    SaveDialog1: TSaveDialog;
    procedure FormCreate(Sender: TObject);
    procedure ED_empnoReadEnded(Sender: TObject);
    procedure B_insertClick(Sender: TObject);
    procedure OnFocusButton3Click(Sender: TObject);
    procedure B_saveClick(Sender: TObject);
    procedure FormShow;
    procedure B_ExitClick(Sender: TObject);
    procedure B_deleteClick(Sender: TObject);
    procedure FileSave;
    procedure SaveData;
    procedure B_BatchClick(Sender: TObject);
    procedure B_SearchClick(Sender: TObject);
    procedure GridSelect;
    procedure ED_empnoSelect(Sempno : String);
    procedure EditTextClear;
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure B_excelClick(Sender: TObject);
    procedure ED_empnoExit(Sender: TObject);
  private
    ReadCnt     : integer;
    { Private declarations }
  public
    { Public declarations }
  end;

type
 errFile = record
           errlog : array[1..300] of char;
           lfcr   : array[1..2]  of char;
end;

type
  AnFile = record
           empno   : string[4];
           korname : string[12];
           cpdate  : string[8];
           gubun   : string[15];
end;

var
  frmReg: TfrmReg;
  F           : system.Text;
  Ef          : file of errFile;
  AData       : AnFile;
  ErrData     : errFile;
  HomeDir     : string;
  ErrDatacnt  : integer;
  SaveKorname : string;
  ErrSaveText : string;
implementation

uses PTA40101;
{$R *.DFM}

procedure TfrmReg.FormCreate(Sender: TObject);
begin
     DBGridEh1.RowsHeight := 22;
     FormShow;
end;

procedure TfrmReg.FormShow;
begin
     GridSelect;

     B_insert.Enabled := True;
     B_save.Enabled   := False;
     B_delete.Enabled := False;
end;

procedure TfrmReg.GridSelect;
begin
     with TDS_Grid1 do
     begin
          ServiceName := 'PTA4010B_sel1';
          Close;
          SQL.Clear;
          Sql.Text :=        'select a.empno,                                           '+
                             '       a.korname,                                         '+
                             '       (select deptname from pycdept                      '+
	                     '         where orgnum=  (select orgnum                    '+
                             '                           from pimpmas                   '+
                             '                          where empno=a.empno)            '+
                             '           and deptcode=(select deptcode                  '+
                             '                           from pimpmas                   '+
                             '                          where empno=a.empno)) deptname, '+
                             '        (select codename from pyccode                     '+
                             '          where codeid=''I113''                           '+
		             '            and codeno=(select payra                      '+
                             '                          from pimpmas                    '+
                             '                         where empno=a.empno)) codefname, '+
                             '       a.cpdate,                                          '+
                             '       a.gubun                                            '+
                             '  from pedulect a                                         '+
                             ' order by a.empno                                         ';

          ClearFieldInfo;
          AddField('EMPNO'    , ftString,  4);
          AddField('KORNAME'  , ftString, 12);
          AddField('DEPTNAME' , ftString, 60);
          AddField('CODEFNAME', ftString, 30);
          AddField('CPDATE'   , ftString,  8);
          AddField('GUBUN'    , ftString, 15);

          Open;

          FieldByName('EMPNO'      ).Alignment := taCenter;
          FieldByName('KORNAME'    ).Alignment := taCenter;
          FieldByName('DEPTNAME'   ).Alignment := taLeftJustify;
          FieldByName('CODEFNAME'  ).Alignment := taCenter;
          FieldByName('CPDATE'     ).Alignment := taCenter;
          TStringField(FieldByName('CPDATE'     )).EditMask := '!9999-99-99;0;_';
          FieldByName('GUBUN'      ).Alignment := taCenter;
     end;
end;

procedure TfrmReg.ED_empnoSelect(Sempno : String);
begin
     SaveKorname := '';

     with TDS_Sel do
     begin
          ServiceName := 'PTA4010B_sel1';
          Close;
          SQL.Clear;
          Sql.Text := Format('select a.empno,                                                              '+
                             '       a.korname,                                                            '+
                             '       (select deptname from pycdept                                         '+
                             '         where orgnum=(select value1 from pimvari                            '+
                             '                         where gubun=''00'' and sgubun=''0001'')             '+
                             '           and deptcode = a.deptcode) deptname,                              '+
                             '       (select codename from pyccode                                         '+
                             '         where codeid = ''I113''                                             '+
                             '           and codeno = a.payra) codefname,                                  '+
                             '       nvl((select CPDATE from pedulect where empno=a.empno),'''') cpdate,   '+
                             '       nvl((select GUBUN  from pedulect where empno=a.empno),'''') GUBUN     '+
                             '  from pimpmas a                                                             '+
                             ' Where a.empno  = ''%s''                                                     '+
                             '   and a.pstate < 80                                                         '+
                             ' order by a.empno                                                            '+
                             '', [Sempno]);

          ClearFieldInfo;
          AddField('EMPNO'    , ftString,  4);
          AddField('KORNAME'  , ftString, 12);
          AddField('DEPTNAME' , ftString, 60);
          AddField('CODEFNAME', ftString, 30);
          AddField('CPDATE'   , ftString,  8);
          AddField('GUBUN'    , ftString, 15);

          Open;

          SaveKorname := FieldByName('KORNAME').AsString;
     end;
end;

procedure TfrmReg.ED_empnoReadEnded(Sender: TObject);
begin
     ED_empnoSelect(copy(ED_empno.Text,1,4));
     with TDS_Sel do
     begin
          FieldByName('EMPNO'      ).Alignment := taCenter;
          FieldByName('KORNAME'    ).Alignment := taCenter;
          FieldByName('DEPTNAME'   ).Alignment := taLeftJustify;
          FieldByName('CODEFNAME'  ).Alignment := taCenter;
          FieldByName('CPDATE'     ).Alignment := taCenter;
          FieldByName('GUBUN'      ).Alignment := taCenter;

          ED_empno.Text    := FieldByName('EMPNO'    ).AsString  + ' - ' + FieldByName('KORNAME' ).AsString;
          ED_dept.Text     := FieldByName('DEPTNAME' ).AsString;
          ED_payra.Text    := FieldByName('CODEFNAME').AsString;
          ED_cpdate.Text   := FieldByName('CPDATE'   ).AsString;
          ED_gubun.Text    := FieldByName('GUBUN'    ).AsString;

          if (ED_empno.Text <> ' - ') and (FieldByName('CPDATE' ).AsString <> '') then
          begin
               B_insert.Enabled := True;
               B_delete.Enabled := True;
          end else
          begin
               B_insert.Enabled := False;
               B_delete.Enabled := False;
          end;

          B_save.Enabled := True;
     end;

end;

procedure TfrmReg.EditTextClear;
begin
     ED_empno.Text := '';
     ED_dept.Text := '';
     ED_payra.Text := '';
     ED_cpdate.Text := '';
     ED_gubun.Text := '';
end;

procedure TfrmReg.B_insertClick(Sender: TObject);
begin
     EditTextClear;

     B_insert.Enabled := False;
     B_save.Enabled   := True;
     ED_empno.SetFocus;
end;

procedure TfrmReg.OnFocusButton3Click(Sender: TObject);
begin
     EditTextClear;
     FormShow;
     ED_empno.SetFocus;
end;

procedure TfrmReg.B_saveClick(Sender: TObject);
begin
     if (ED_empno.Text = '') or (ED_empno.Text = ' - ') then
     begin
          Application.MessageBox('사원을 입력해주세요.','미입력',MB_OK);
          Exit;
     end;

     if ED_cpdate.Text = '' then
     begin
          Application.MessageBox('수료시기를 입력해주세요.','미입력',MB_OK);
          Exit;
     end;

     if ED_gubun.Text = '' then
     begin
          Application.MessageBox('강의분야를 선택해주세요.','미선택',MB_OK);
          Exit;
     end;

     if B_insert.Enabled = False then
     begin
          with TDS_sel do
          begin
               ServiceName := 'PTA4010B_sel1';
               Close;
               SQL.Clear;
               Sql.Text := Format('select empno,                                             '+
                                  '       korname,'''','''',                                 '+
                                  '       cpdate,                                            '+
                                  '       gubun                                              '+
                                  '  from pedulect a                                         '+
                                  ' where empno = ''%s''                                     '+
                                  '', [ED_empno.empno]);
               ClearFieldInfo;
               AddField('EMPNO'    , ftString,  4);
               AddField('KORNAME'  , ftString, 12);
               AddField('DEPTNAME' , ftString, 60);
               AddField('CODEFNAME', ftString, 30);
               AddField('CPDATE'   , ftString,  8);
               AddField('GUBUN'    , ftString, 15);

               Open;

               if recordcount <> 0 then
               begin
                    Application.MessageBox('이미 등록된 사내강사 입니다.','중복',MB_OK);
                    Exit;
               end;
          end;

          with TDS_dml do
          begin
               ServiceName := 'PTA4010B_dml';
               Close;
               SQL.Clear;
               Sql.Text := Format('insert into pedulect                                                                    '+
                                  'values (''%s'',''%s'',''%s'',''%s'',''%s'',To_Char(sysdate,''yyyy-mm-dd hh24:mi:ss''))  '+
                                  '', [ED_empno.empno, ED_empno.korname, ED_cpdate.Text, ED_gubun.Text, frmMain.FG_empno]);

               if not Execute then
               begin
                    Application.MessageBox('사내강사 저장에 실패했습니다.','작업실패',MB_OK);
                    Exit;
               end;

               FormShow;
          end;
     end
     else
     begin
          with TDS_dml do
          begin
               ServiceName := 'PTA4010B_dml';
               Close;
               SQL.Clear;
               Sql.Text := Format('update pedulect                                                '+
                                  '   set cpdate     = ''%s'',                                    '+
                                  '       gubun      = ''%s'',                                    '+
                                  '       writeman   = ''%s'',                                    '+
                                  '       writetime  = To_Char(sysdate,''yyyy-mm-dd hh24:mi:ss'') '+
                                  ' where empno  = ''%s''                     '
                                  , [ED_cpdate.Text, ED_gubun.Text, frmMain.FG_empno, Copy(ED_empno.Text,1,4)]);

               if not Execute then
               begin
                    Application.MessageBox('사내강사 저장에 실패했습니다.','작업실패',MB_OK);
                    Exit;
               end;

               FormShow;
          end;
     end;
     EditTextClear;
end;

procedure TfrmReg.DBGridEh1DblClick(Sender: TObject);
begin
     with TDS_Grid1 do
     begin
          Ed_empno.Text     := FieldByName('empno'    ).AsString + ' - ' + FieldByName('korname').AsString;
          Ed_dept.Text      := FieldByName('deptname' ).AsString;
          Ed_payra.Text     := FieldByName('codefname').AsString;
          ED_cpdate.Text    := FieldByName('cpdate'   ).AsString;
          ED_gubun.Text     := FieldByName('gubun'    ).AsString;
     end;

     B_insert.Enabled := True;
     B_save.Enabled   := True;
     B_delete.Enabled := True;
end;

procedure TfrmReg.B_ExitClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmReg.B_deleteClick(Sender: TObject);
begin
     if MessageDlg('해당자료를 삭제하시겠습니까?', mtInformation, [mbYes, mbNo], 0) = mrNo then Exit;

     with TDS_dml do
     begin
          ServiceName := 'PTA4010B_dml';
          Close;
          SQL.Clear;
          Sql.Text := Format('delete from pedulect                       '+
                             ' where empno  = ''%s''', [trim(Copy(ED_empno.Text,1,4))]);

          if not Execute then
          begin
               Application.MessageBox('삭제에 실패했습니다.','작업실패',MB_OK);
               Exit;
          end;

          FormShow;
          EditTextClear;
     end;
end;

procedure TfrmReg.FileSave;
var
  i                : integer;
  str, ErrDatatext : string;
  MA               : array [1..3] of string[40];     //+1 shm 2001.07.03
  CsvFile  : array [0..255] of Char; //PCSS 복호화 작업

  procedure setArray(Str:WideString);  //배열 선언.
  var
    i, Cnt     : Integer;
    S          : String;
  begin
    for i := 1 to 3 do                       //+1 shm 2001.07.03
             MA[i] := '';
  //사번,수료시기,강의분야
  //1234,20080215,강의분야
  //1    2        3
  // 엑셀에서 csv 저장시 빈칸은 스페이스 한번 눌러준다.
    Cnt := 1;
    S := '';
    for i := 1 to Length(Str) do  //wideString 문장의 총 갯수.
    begin
      if Copy(Str,i,1) = ',' then
      begin
        MA[Cnt] := S;
        Inc(Cnt);
        S := '';
            if Cnt > 3 then                  //+1 shm 2001.07.03
            begin
              MessageDlg('CSV 파일의 크기가 잘못되었습니다. ' + #13 +
                         '확인 후 다시 실행하십시요..' + #13 +
                         '시스템을 강제적으로 종료합니다.' ,mtError, [mbOK],0);
              Application.Terminate;
            end;
      end
      else
        S := S + Copy(Str,i,1);  // 누적저장.

        if i = Length(Str) Then  //마지막 처리.
          MA[Cnt] := S;
    end;
  end;

begin  //본문 시작.
  if FileExists(FileOpenDlg.FileName) = False then begin
     MessageBox(handle,'화일이 있는지 확인 하십시오..','에  러',MB_OK or $0020);
     System.Exit;
  end;

//jissi 2010.08.11 주석처리     // 데이타파일 오픈
//      System.AssignFile(F,FileOpenDlg.FileName);
//      Reset(F);

        //DRMUnit.pas 참조... : PCSS 에 의한 엑셀파일 암호화 파일 Control...
      //fnEncryptFileChorus(OraTable1PCFILE.Text);//DRM 암호화...
      StrCopy(CsvFile, PChar(FileOpenDlg.FileName));
//      fnDecryptFileChorus(CsvFile);  //DRM Excel 파일 복호화 작업....dsa2000  2006.07.  추가...

      System.AssignFile(F,CsvFile);   //System.AssignFile(F,FileOpenDlg.FileName);
      System.Reset(F);     

  i := 0;

  while not Eof(F) do
  begin
    inc(i);
    Readln(F,str);
  end;
  ReadCnt := i;
  System.Close(F);
  if ReadCnt <= 0 then begin
     MessageBox(handle,'화일에 데이타가 없습니다..','확 인',MB_OK or $0030);
     system.Exit;
  end;

  System.AssignFile(F,FileOpenDlg.FileName);
  System.Reset(F);

  ErrdataText := '';
  ErrSaveText := '';
  Errdatacnt  := 0;
  while not Eof(F) do
  begin
    Readln(F,str);
    setArray(str);
    if Length(MA[1]) = 4 then
    begin
        ED_empnoSelect(MA[1]);

        Adata.empno   := MA[1];
        Adata.korname := Savekorname;
        Adata.cpdate  := MA[2];
        Adata.gubun   := MA[3];

        SaveData;
    end
    else
    begin
        Errdatatext       := Errdatatext + MA[1] + ',';
        Errdatacnt        := Errdatacnt  + 1;
    end;
  end;

  if Errdatacnt > 0 then
  begin
    if  ErrSaveText <> '' then
        MessageDlg(ErrdataText+ #13 +'위 사번이 정확하지 않습니다.' + #13     + #13 +
                   ErrSaveText+ #13 +'위 사원은 이미 저장된 자료가 있습니다.' + #13 +   #13 + '위의 ' +
                   inttostr(Errdatacnt) +'개의 자료는 정확치 않아 저장하지 않았습니다.',mtError, [mbOK],0)
    else
        MessageDlg(ErrdataText+ #13 +'위 사번이 정확하지 않습니다.' + #13    + #13 + '위의 ' +
                  inttostr(Errdatacnt) +'개의 자료는 정확치 않아 저장하지 않았습니다.',mtError, [mbOK],0)
  end;
end;

// 데이타를 저장한다............................................................
procedure TfrmReg.SaveData;
begin

   with TDS_sel do
   begin
        ServiceName := 'PTA4010B_sel1';
        Close;
        SQL.Clear;
        Sql.Text := Format('select EMPNO,                               '+
                           '       KORNAME,                             '+
                           '       '''' DEPTNAME,                       '+
                           '       '''' CODEFNAME,                      '+
                           '       CPDATE,                              '+
                           '       GUBUN                                '+
                           '  from PEDULECT a                           '+
                           ' where EMPNO = ''%s''                       '+
                           '', [Adata.empno]);
        ClearFieldInfo;
        AddField('EMPNO'    , ftString,  4);
        AddField('KORNAME'  , ftString, 12);
        AddField('DEPTNAME' , ftString, 60);
        AddField('CODEFNAME', ftString, 30);
        AddField('CPDATE'   , ftString,  8);
        AddField('GUBUN'    , ftString, 15);

        Open;

        if TDS_sel.recordcount <> 0 then
        begin
             ErrSaveText       := ErrSaveText + Adata.empno +',';
             Errdatacnt        := Errdatacnt  + 1;
             Exit;
        end;
   end;
   with TDS_dml do
   begin
        ServiceName := 'PTA4010B_dml';
        Close;
        SQL.Clear;
        Sql.Add('        insert into PEDULECT (EMPNO,                   '+
                '                              KORNAME,                 '+
                '                              CPDATE,                  '+
                '                              GUBUN,                   '+
                '                              WRITEMAN,                '+
                '                              WRITETIME)               '+
                '               values                                  ');
        Sql.Add(Format('                      (''%s'',                  '+
                       '                       ''%s'',                  '+
                       '                       ''%s'',                  '+
                       '                       ''%s'',                  '+
                       '                       ''%s'',                  '+
                       '  To_Char(sysdate,''yyyy-mm-dd hh24:mi:ss'') )  ',
                      [Adata.empno,
                       Adata.korname,
                       Adata.cpdate,
                       Adata.gubun,
                       frmMain.FG_empno]) );

        Execute;

        FormShow;
   end;

end;

procedure TfrmReg.B_BatchClick(Sender: TObject);
begin
     MessageBox(handle,'CSV 파일(사번,수료시기,강의분야) 로 작성해주십시요.','확 인',MB_OK or $0030);

     FileOpenDlg.Execute;

     if FileOpenDlg.FileName <> '' then
     begin
          FileSave;
          FormShow;
     end;
end;

procedure TfrmReg.B_SearchClick(Sender: TObject);
begin
     if ED_empno.Text = '' then
     begin
          Application.MessageBox('사원을 입력해주세요.','미입력',MB_OK);
          Exit;
     end;

     ED_empnoReadEnded(Sender);
end;

procedure TfrmReg.B_excelClick(Sender: TObject);
begin
     if TDS_Grid1.RecordCount<=0 then exit;

     SaveDialog1.FileName :='사내강사등록.xls';
     if SaveDialog1.Execute then
     begin
         with TStringList.Create do
         try
           Add(pchar('사번'       +#9+
                     '이름'       +#9+
                     '소속'       +#9+
                     '직위'       +#9+
                     '수료시기'   +#9+
                     '강의분야'   ));

           TDS_Grid1.first;
           while not TDS_Grid1.Eof do
           begin
             Add(Format('%s'+#9+         //'사번'
                        '%s'+#9+         //'이름'
                        '%s'+#9+         //'소속'
                        '%s'+#9+         //'직위'
                        '%s'+#9+         //'수료시기'
                        '%s',            //'강의분야'
                   [ TDS_Grid1.Fields[0].AsString,        //'사번'
                     TDS_Grid1.Fields[1].AsString,        //'이름'
                     TDS_Grid1.Fields[2].AsString,        //'소속'
                     TDS_Grid1.Fields[3].AsString,        //'직위'
                     TDS_Grid1.Fields[4].AsString,        //'수료시기'
                     TDS_Grid1.Fields[5].AsString ]));    //'강의분야'
             TDS_Grid1.Next;
           end; // end of for
           SaveToFile(SaveDialog1.FileName);
         finally
         Free;
         end; // end of try
     end; //end of SaveDialog1.Execute
end;

procedure TfrmReg.ED_empnoExit(Sender: TObject);
begin
     if trim(ED_empno.Text) <> '' then
     begin
          B_SearchClick(Sender);
     end;
end;

end.
