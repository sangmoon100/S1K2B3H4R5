unit PIT20503;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, OnSkinBtn, Grids, ComObj, Gauges;

type
  TFm_SubForm3 = class(TForm)
    Panel2: TPanel;
    sgd_1: TStringGrid;
    bt_excelup: TOnSkinButton;
    bt_close: TOnSkinButton;
    bt_save: TOnSkinButton;
    OpenDialog1: TOpenDialog;
    Gauge1: TGauge;
    bt_tidowun: TOnSkinButton;
    bt_delete: TOnSkinButton;
    Shape1: TShape;
    Label2: TLabel;
    cbx_monum: TComboBox;
    Label3: TLabel;
    procedure bt_excelupClick(Sender: TObject);
    procedure bt_saveClick(Sender: TObject);
    procedure bt_tidowunClick(Sender: TObject);
    procedure bt_deleteClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bt_closeClick(Sender: TObject);
  private
    { Private declarations }
     procedure ExcelToGrid(sFile : String; sGrid : TStringGrid;sCol:Integer);
     procedure SetGauge1Value(iTotCnt, iReadCnt: longint);
     function  GetGauge1Init(iTotCnt: longint): currency;
  public
    { Public declarations }
  end;

var
  Fm_SubForm3: TFm_SubForm3;

implementation

uses PIT20500;

{$R *.DFM}

procedure TFm_SubForm3.bt_excelupClick(Sender: TObject);
var
//  F : TextFile;
  ReadStr, strPSNID1, workDir : String;
  iYprocCnt, iNprocCnt, iYprocCnt1 : Integer;
begin
   MainForm.PStringGridClear(sgd_1, sgd_1.ColCount, sgd_1.RowCount);
   OpenDialog1.Title := '위탁검사자료 파일열기';

   if OpenDialog1.Execute then Panel2.Caption := OpenDialog1.Filename
   else                                             Exit;
   //===================================================
   //OpenDialog1.Execute 시킨 이후에는 자신의 디렉토리를 원위치로 갖다놓기 위해 꼭 넣어야 한다.
   SetCurrentDir('C:\insa\Bin\2Tier');
   //===================================================
   ExcelToGrid(Panel2.Caption,sgd_1,4);

end;

//------------------------------------------------------------------------------
procedure TFm_SubForm3.ExcelToGrid(sFile : String; sGrid : TStringGrid; sCol:Integer);
var
    ExcelApp, ExcelBook, ExcelSheet : Variant;
    i, j                            : Integer; // 순환변수
    s : String;
begin
   try
      ExcelApp := CreateOLEObject('Excel.Application');
   except
      ShowMessage('Excel이 설치되어 있지 않습니다!!!');
      Exit;
   end;
   Try
      ExcelApp.Visible       := False;
      ExcelApp.DisplayAlerts := False;
      ExcelBook              := ExcelApp.WorkBooks.Open(sFile);
      ExcelBook              := ExcelApp.WorkBooks.item[1];
      ExcelSheet             := ExcelBook.Worksheets.Item[1];

      sGrid.RowCount  :=  ExcelSheet.UsedRange.Rows.count;
      sGrid.ColCount  :=  sCol;

      For  i  :=  1   to  ExcelSheet.UsedRange.Rows.count   do
      begin
         For J := 1 to  sCol  do
         begin
                sGrid.Cells[j-1,i-1] := VarToStr(ExcelSheet.Cells[i,j]);

//                if j - 1 = 5 then
//                begin
//                   s := sGrid.Cells[j - 1, i-1];
//                   if length(sGrid.Cells[j - 1, i-1]) = 10 then  sGrid.Cells[j - 1, i-1] := '0' + s
//                   else                                          sGrid.Cells[j - 1, i-1] := s;
//                end;

                SetGauge1Value(ExcelSheet.UsedRange.Rows.count, i);  //건당
         end;
//         sGrid.Cells[0,i]   := IntTostr(i);
      end;
      ExcelApp.WorkBooks.Close;
      ExcelApp.quit;
      ExcelApp := unassigned;
   Except
      on err : exception do
      begin
         ExcelApp.WorkBooks.Close;
         ExcelApp.quit;
         ExcelApp := unassigned;
         ShowMessage('작업이 취소되었습니다. Data확인요망-'+err.message);
      end;
   end;
   sGrid.FixedRows  := 1;
//   lb_all.Caption := '총 ' + IntToStr(sGrid.RowCount - 1) + '건의 자료를 변환하였습니다.';
   SetGauge1Value(sGrid.RowCount, sGrid.RowCount); //토탈
End;
//------------------------------------------------------------------------------

procedure TFm_SubForm3.SetGauge1Value(iTotCnt, iReadCnt: longint);
begin
  Gauge1.Progress := Round(iReadCnt * GetGauge1Init(iTotCnt)) mod Gauge1.Width;
end;
//------------------------------------------------------------------------------
function  TFm_SubForm3.GetGauge1Init(iTotCnt: longint): currency;
begin
  try Result := Gauge1.Width / iTotCnt;
  except on EZeroDivide do Result := 0; end;
end;

//------------------------------------------------------------------------------
procedure TFm_SubForm3.bt_saveClick(Sender: TObject);
var
   iIdx : Integer;
   ParamVariant : String;
begin
   if MessageDlg('일괄저장작업을 진행하시겠습니까?', mtConfirmation,
      [mbYes, mbNo], 0) = mrNo then Exit;

   if sgd_1.Cells[0,1] = '' then
   begin
      Showmessage('저장할 자료가 존재하지 않습니다.');
      Exit;
   end;
   {
   ParamVariant := Format('Insert into pischndept          '+
                           ' (orgnum     ,                  '+
                           '  deptcode   ,                  '+
                           '  monum      ,                  '+
                           '  collectcnt ,                  '+
                           '  supplecnt  ,                  '+
                           '  dutydesc   ,                  '+
                           '  condition  ,                  '+
                           '  writeemp   ,                  '+
                           '  writetime)                    '+
                           'values (                        '+
                           '  ''%s'',                       '+
                           '  ''%s'',                       '+
                           '  ''%s'',                       '+
                           '  ''%s'',                       '+
                           '  ''%s'',                       '+
                           '  ''%s'',                       '+
                           '  ''%s'',                       '+
                           '  ''%s'',                       '+
                           '  TO_CHAR(sysdate, ''YYYYMMDDHH24MISS'') )',
                           [P_Orgnum.ValueCaption,
                            P_deptcode.ValueCaption,
                            MainForm.gsMonum,
                            E_CollectCnt.text,
                            E_Supplecnt.ValueCaption,
                            kpaylib.replace(M_dutydesc.text,'''','`'),
                            kpaylib.replace(M_Condition.text,'''','`'),
                            MainForm.pempno]);
  with MainForm.TCupd do
  begin
    Close;
    Sql.Clear;
    Sql.Text := ParamVariant;
//    edit1.Text := Sql.Text;
    ServiceName := 'PIT2030A_DML';
    Execute;
  end;
}
   For iIdx := 1 to sgd_1.RowCount -1 do
   begin
      ParamVariant := Format('insert into pischndept (orgnum    , deptcode  , monum    , writeemp,                                     '+
                             '                        writetime , collectcnt, supplecnt, dutydesc,                                     '+
                             '                        condition , conempno  , conyn    , closeyn  )                                    '+
                             '              select distinct orgnum   , ''%s''  , ''%s''    , ''%s'' ,                                  '+
                             '                     to_char(sysdate,''YYYYMMDDHH24MISS'') , nvl(''%s'',0), ''%s'', ''%s'' ,             '+
                             '                     ''%s'' , eempno, ''Y''  , ''N''                                      '+
                             '                from pimeemp                                                                             '+
                             '               where jobdept = ''%s''                                                                   '+
                             '                 and orgnum = (select value1  from pimvari  where gubun =  ''00'' and sgubun = ''0001'') ',
                             [Trim(sgd_1.Cells[0, iIdx]),  MainForm.gsMonum,  MainForm.P_SaveEmpno,
                             Trim(sgd_1.Cells[1, iIdx]), '0',Trim(sgd_1.Cells[2, iIdx]),
                              Trim(sgd_1.Cells[3, iIdx]),
                              Trim(sgd_1.Cells[0, iIdx]) ]);

      with MainForm.Qry_deptInsert do
      begin
         Close;
         Sql.Clear;
         Sql.Text := ParamVariant;
//         edit1.Text := Sql.Text ;
         Execute;
      end;
   end;
////////////////////////////////////////////////////////////////////////////
{   For iIdx := 1 to sgd_1.RowCount -1 do
   begin
     with MainForm.Qry_deptInsert do
     begin
       Close;
       Sql.Clear;                                                             //   /to_char(:pwritetime,''YYYYMMDDHH24MISS'')
       Sql.Add('insert into pischndept (orgnum    , deptcode  , monum    , writeemp,                                         ');
       Sql.Add('                        writetime , collectcnt, supplecnt, dutydesc,                                         ');
       Sql.Add('                        condition , conempno  , conyn    , closedate, closeyn  )                             ');
       Sql.Add('                select distinct orgnum   , :pdeptcode  , :pmonum    , :pwriteemp ,                           ');
       Sql.Add('                       to_char(sysdate,''YYYYMMDDHH24MISS'') , nvl(:pcollectcnt,0), :psupplecnt, :pdutydesc ,       ');
       Sql.Add('                       :pcondition , eempno, :pconyn    , :pclosedate, :pcloseyn                             ');
       Sql.Add('                  from pimeemp                                                                               ');
       Sql.Add('                 where deptcode = :pdeptcode                                                                 ');
       Sql.Add('                   and orgnum = (select value1  from pimvari  where gubun =  ''00'' and sgubun = ''0001'')   ');
//       Sql.Add('             values    (orgnum    , :pdeptcode  , :pmonum    , :pwriteemp ,           ');
//       Sql.Add('                        to_char(sysdate,''YYYYMMDDHH24MISS'') , :pcollectcnt, :psupplecnt, :pdutydesc ,           ');
//       Sql.Add('                        :pcondition , :pconempno  , :pconyn    , :pclosedate, :pcloseyn ) ');

//       select distinct eempno from pimeemp where deptcode = 'IKGG0'

//       ParamByName('porgnum'    ).AsString := Trim(sgd_1.Cells[0, iIdx]);
       ParamByName('pdeptcode'  ).AsString := Trim(sgd_1.Cells[0, iIdx]);
       ParamByName('pmonum'     ).AsString := MainForm.gsMonum;
       ParamByName('pwriteemp'  ).AsString := MainForm.P_SaveEmpno;
       ParamByName('pcollectcnt').AsString := Trim(sgd_1.Cells[1, iIdx]);
       ParamByName('psupplecnt' ).AsString := '0';
       ParamByName('pdutydesc'  ).AsString := Trim(sgd_1.Cells[2, iIdx]);
       ParamByName('pcondition' ).AsString := Trim(sgd_1.Cells[3, iIdx]);
//       ParamByName('pconempno'  ).AsString := MainForm.P_SaveEmpno;
       ParamByName('pconyn'     ).AsString := 'Y';
       ParamByName('pclosedate' ).AsString := '';
       ParamByName('pcloseyn'   ).AsString := 'N';

 showmessage( 'porgnum :'   +  'H10' + #13 + #10 +
       'pdeptcode:' +  Trim(sgd_1.Cells[0, iIdx]) + #13 + #10 +
       'pmonum :'   +   MainForm.gsMonum + #13 + #10 +
       'pwriteemp:' +  MainForm.P_SaveEmpno + #13 + #10 +
       'pcollectcnt:'+ Trim(sgd_1.Cells[1, iIdx]) + #13 + #10 +
       'psupplecnt:' + '0' + #13 + #10 +
       'pdutydesc:'  + Trim(sgd_1.Cells[2, iIdx]) + #13 + #10 +
       'pcondition:' + Trim(sgd_1.Cells[3, iIdx]) + #13 + #10 +
       'pconyn'      + 'Y'  + #13 + #10 +
       'pclosedate:' + '' + #13 + #10 +
       'pcloseyn:'  +  'N');      

       edit1.Text :=  Sql.Text;
       ExecSql;
     end;
   end; } //Row For End
   MessageDlg('총 ' + IntTostr(iIdx - 1) + '건의 데이터 저장완료.', mtInformation,[mbOK],0);
   MainForm.PStringGridClear(sgd_1, sgd_1.ColCount, sgd_1.RowCount);
end;
//------------------------------------------------------------------------------
procedure TFm_SubForm3.bt_tidowunClick(Sender: TObject);
var
   XL, XArr: Variant;
begin
   MainForm.P_helpinfo.SimpleText := 'Excel이 설치되어 있는지 검색하고 있습니다.';

   XArr := VarArrayCreate([1, 5], VarVariant);
   try
     XL := CreateOLEObject('Excel.Application');
   except
     MessageDlg('Excel이 설치되어 있지 않습니다.', MtWarning, [mbok], 0);
     MainForm.P_helpinfo.SimpleText := '';
     Exit;
   end;

   XL.WorkBooks.Add; //새로운 페이지 생성
   XL.Visible := false;
   //컬럼명 지정_서브타이블 지정

   XArr[1]  := '소속부서';
   XArr[2]  := '모집인원';
   XArr[3]  := '수행예정 직무 등록';
   XArr[4]  := '자격요건 / 우대조건 등록';
//   XArr[6]  := '결재자사번';
//   XArr[7]  := '결재여부';

   XL.Range['A1', 'D1'].Value := XArr;
   XL.Range['A1', 'D1'].Borders.LineStyle := 1;    //테두리선을 만든다.  1은 실선
   XL.Range['A1', 'D1'].Interior.Color:= $00CBF0B3;
   XL.Visible := true;                 //엑셀자료 보여줌
   MainForm.P_helpinfo.SimpleText := 'Title 다운로드 완료...';
end;
//------------------------------------------------------------------------------
procedure TFm_SubForm3.bt_deleteClick(Sender: TObject);
var
   iIdx : Integer;
begin
   if MessageDlg('일괄삭제작업을 진행하시겠습니까?', mtConfirmation,
      [mbYes, mbNo], 0) = mrNo then Exit;

   if sgd_1.Cells[0,1] = '' then
   begin
      Showmessage('저장할 자료가 존재하지 않습니다.');
      Exit;
   end;
   ////////////////////////////////////////////////////////////////////////////
   For iIdx := 1 to sgd_1.RowCount -1 do
   begin
     with MainForm.Qry_deptInsert do
     begin
       Close;
       Sql.Clear;
       Sql.Add('delete from pischndept                                                                        ');
       Sql.Add(' where orgnum    = (select value1  from pimvari  where gubun =  ''00'' and sgubun = ''0001'') ');
       Sql.Add('   and deptcode  = :pdeptcode                                                                 ');
       Sql.Add('   and monum     = :pmonum                                                                    ');

//       ParamByName('porgnum'    ).AsString := Trim(sgd_1.Cells[0, iIdx]);
       ParamByName('pdeptcode'  ).AsString := Trim(sgd_1.Cells[0, iIdx]);
       ParamByName('pmonum'     ).AsString := MainForm.gsMonum;

       ExecSql;
     end;
   end;  //Row For End
   MessageDlg('총 ' + IntTostr(iIdx - 1) + '건의 데이터 삭제완료.', mtInformation,[mbOK],0);
   MainForm.PStringGridClear(sgd_1, sgd_1.ColCount, sgd_1.RowCount);
end;
//------------------------------------------------------------------------------
procedure TFm_SubForm3.FormShow(Sender: TObject);
begin
   cbx_monum.ItemIndex :=  cbx_monum.Items.Count - 1;
end;
//------------------------------------------------------------------------------
procedure TFm_SubForm3.bt_closeClick(Sender: TObject);
begin
   Close;
end;

end.
