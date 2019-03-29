unit PIR20502;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OnSkinBtn, StdCtrls, OnScheme, Grids, DBGrids, ExtCtrls, comobj, db;

type
  TFm_SubForm2 = class(TForm)
    bt_find: TOnSkinButton;
    bt_close: TOnSkinButton;
    db_user: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    bt_excel: TOnSkinButton;
    procedure bt_findClick(Sender: TObject);
    procedure bt_excelClick(Sender: TObject);
    procedure bt_closeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;



var
  Fm_SubForm2: TFm_SubForm2;


implementation

 uses PIT20500;

{$R *.DFM}

procedure TFm_SubForm2.bt_findClick(Sender: TObject);
begin
   with MainForm.Qry_empfind do
   begin
      Close;
      Sql.Clear;
      Sql.add(' select a.empno                                                          empno                                    ');
      Sql.add('      , a.korname                                                        korname                                  ');
      Sql.add('    	 , (select deptname from pycdept where deptcode = a.deptcode)       deptname                                 ');
      Sql.add('    	 , (select deptname from pycdept where deptcode = a.aftdeptcode1 )  aftdeptname1                             ');
      Sql.add('    	 , (select deptname from pycdept where deptcode = a.aftdeptcode2 )  aftdeptname2                             ');
      Sql.add('    	 , (select deptname from pycdept where deptcode = a.aftdeptcode3 )  aftdeptname3                             ');
      Sql.add('    	 , a.aftconyn1                                                      aftconyn1                                ');
      Sql.add('    	 , a.aftconyn2                                                      aftconyn2                                ');
      Sql.add('    	 , a.aftconyn3                                                      aftconyn3                                ');
      Sql.add('   		 , decode(a.state1,''1'',''대기중'',''2'',''검토중'',''3'',''처리완료'',''임시저장중'')      state1          ');
      Sql.add('    	 , decode(a.state2,''1'',''대기중'',''2'',''검토중'',''3'',''처리완료'',''임시저장중'')      state2          ');
      Sql.add('	     , decode(a.state3,''1'',''대기중'',''2'',''검토중'',''3'',''처리완료'',''임시저장중'')      state3          ');
      Sql.add('    	 , decode(sign(instr(state1 || state2 || state3, ''1'') - 0),1,''대기중''                                    ');
      Sql.add('              , decode(sign(instr(state1 || state2 || state3, ''2'') - 0),1,''검토중''                            ');
      Sql.add('                  			 , decode(sign(instr(state1 || state2 || state3, ''3'') - 0),1,''처리완료'', NULL ))) state  ');
      Sql.add('   from pischnmas a                                                                                               ');
      Sql.add('  where a.monum = :pmonum                                                                                         ');
      Sql.add('    and a.state1 is not null                                                                                      ');
      Sql.add('  order by writetime                                                                                              ');

      ParamByName('pmonum').AsString  := MainForm.gsMonum;
      Open;
   end;
end;

procedure TFm_SubForm2.bt_excelClick(Sender: TObject);
var XL, XArr: Variant;
    i,j,k: integer;
    SavePlace: TBookmark;
begin
{ //전체자료 추출할때..}
  if MainForm.Qry_empfind.RecordCount < 1 then
  begin
    showmessage('엑셀 변환할 자료가 없습니다.');
    exit;
  end;
  MainForm.P_helpinfo.SimpleText := 'Excel이 설치되어 있는지 검색하고 있습니다.';

  XArr := VarArrayCreate([1, 13], VarVariant);
  try
    XL := CreateOLEObject('Excel.Application');
  except
    MessageDlg('Excel이 설치되어 있지 않습니다.', MtWarning, [mbok], 0);
    MainForm.P_helpinfo.SimpleText := '';
    Exit;
  end;

  MainForm.P_helpinfo.SimpleText := '자료를 변환하고 있습니다.';
  XL.WorkBooks.Add; //새로운 페이지 생성
  XL.Visible := false;
  XL.WorkSheets[1].Name := 'Hout List';  //시트명 부여
  XL.Range['A1:L2'].Merge;               //셀 병합

  //TITLE NAME 설정
  XL.Range['A1'].value := '사내공모지원자명단';
  XL.Range['A1'].font.Size := 16;

  //컬럼명 지정_서브타이블 지정
  XArr[1]  := '사번';
  XArr[2]  := '성명';
  XArr[3]  := '소속부서';
  XArr[4]  := '제1지망부서';
  XArr[5]  := '결과1';
  XArr[6]  := '처리상태1';
  XArr[7]  := '제2지망부서';
  XArr[8]  := '결과2';
  XArr[9]  := '처리상태2';
  XArr[10] := '제3지망부서';
  XArr[11] := '결과3';
  XArr[12] := '처리상태3';

  XL.Range['A3' , 'L3'].Value := XArr;
  k := 3;
  for i := 1 to 12 do
  begin
     XL.Range[CHR(64 + i) + '3'].HorizontalAlignment := 3;
     XL.Range[CHR(64 + i) + '3'].Interior.Color:= $00CBF0B3;
     XL.Range[CHR(64 + i) + '3'].font.Size := 10;
     XL.Range[CHR(64 + i) + '3'].font.Bold := True;
  end;

  //검색된 자료를 excel에 export처리 시킨다.
  SavePlace := MainForm.Qry_empfind.GetBookmark;
  MainForm.Qry_empfind.DisableControls;
  MainForm.Qry_empfind.First;

  for i := 1 to  MainForm.Qry_empfind.RecordCount do
  begin
     XArr[1]  := ''''+MainForm.Qry_empfind.FieldbyName('EMPNO').AsString;
     XArr[2]  := MainForm.Qry_empfind.FieldByName('KORNAME').AsString;
     XArr[3]  := ''''+MainForm.Qry_empfind.FieldbyName('DEPTNAME').AsString;
     XArr[4]  := MainForm.Qry_empfind.FieldbyName('AFTDEPTNAME1').AsString;
     XArr[5]  := MainForm.Qry_empfind.FieldByName('AFTCONYN1').AsString;
     XArr[6]  := MainForm.Qry_empfind.FieldByName('STATE1').AsString;
     XArr[7]  := MainForm.Qry_empfind.FieldByName('AFTDEPTNAME2').AsString;
     XArr[8]  := MainForm.Qry_empfind.FieldByName('AFTCONYN2').AsString;
     XArr[9]  := MainForm.Qry_empfind.FieldByName('STATE2').AsString;
     XArr[10] := MainForm.Qry_empfind.FieldByName('AFTDEPTNAME3').AsString;
     XArr[11] := MainForm.Qry_empfind.FieldByName('AFTCONYN3').AsString;
     XArr[12] := MainForm.Qry_empfind.FieldByName('STATE3').AsString;
     XL.Range['A' + IntToStr(k+1), 'L' + IntToStr(k+1)].Value := XArr;
     inc(k);
     MainForm.Qry_empfind.Next;
  end;
  //여기서 부터는 EXPORT된 EXCEL자료를 예쁘게 꾸미는 부분입니다.
   XL.Range['A1', 'L' + IntToStr(k)].Borders.LineStyle := 1;    //테두리선을 만든다.  1은 실선
   XL.Range['A1', 'L' + IntToStr(k)].Borders.Weight := 2;       //테두리선 두깨 설정  2는 보통두깨, 3은 무지 두꺼움
   XL.Range['A1', 'L' + IntToStr(k)].Borders.ColorIndex := 1;   //테두리선 색상설정  1은 검은색
   XL.Range['A1', 'L' + IntToStr(k)].font.name := '굴림체';
   XL.Range['A1', 'A1'].HorizontalAlignment := 3;               //가운데 정렬
   XL.Range['A3', 'L' + IntToStr(k)].font.Size := 9;
   XL.Range['C4', 'L' + IntToStr(k)].HorizontalAlignment := 2;  //좌측정렬
   XL.Range['J4', 'L' + IntToStr(k)].HorizontalAlignment := 1;  //우측정렬
   XL.Range['K4', 'L' + IntToStr(k)].HorizontalAlignment := 2;  //좌측정렬
   XL.Range['A1', 'L' + IntToStr(k)].Select;                    //자료를 모두 SELECT한 후 --하는 이유:  AutoFit 처리하기 위해서임
   XL.Selection.Columns.AutoFit;                                //자동정렬
   XL.Range['A4', 'A4'].Select;                                 //A4열에 커서 위치시킴
   XL.Visible := true;                                          //엑셀자료 보여줌
   Screen.Cursor := crDefault;
   MainForm.Qry_empfind.GotoBookmark(SavePlace);
   MainForm.Qry_empfind.FreeBookmark(SavePlace);
   MainForm.Qry_empfind.EnableControls;
   MainForm.P_helpinfo.SimpleText := '';
end;



procedure TFm_SubForm2.bt_closeClick(Sender: TObject);
begin
   Close;
end;

procedure TFm_SubForm2.FormShow(Sender: TObject);
begin
   bt_findClick(Sender);
end;

end.
