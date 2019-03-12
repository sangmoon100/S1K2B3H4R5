unit PZO1030A1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, OnFocusButton, Grids, DBGrids, OnGrDBGrid, ComCtrls, OnScheme,
  Db, MemDS, DBAccess, Pass, Ora, Func, ExtCtrls, OnEditBaseCtrl,
  OnEditStdCtrl, OnEditBtnCtrl, OnPersonEdit, Mask, Buttons, comobj,
  OnPopupEdit, OnStringUtils;

type
  TFM_Mainform = class(TForm)
    SF_Main: TOnSchemeForm;
    ora_anno: TOraQuery;
    ds_anno: TDataSource;
    btn_search: TOnFocusButton;
    btn_exit: TOnFocusButton;
    btn_excel: TOnFocusButton;
    Panel40: TPanel;
    s_empno: TOnWinPopupEdit;
    s_deptcode: TOnWinPopupEdit;
    OraQuery1: TOraQuery;
    cb_chanmode: TCheckBox;
    DbGrid2: TOnGrDbGrid;
    rg_gubun: TRadioGroup;
    procedure btn_exitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_excelClick(Sender: TObject);
    procedure btn_searchClick(Sender: TObject);
    procedure s_empnoInitPopup(Sender: TObject);
    procedure s_empnoKeyPress(Sender: TObject; var Key: Char);
    procedure s_empnoCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure s_deptcodeInitPopup(Sender: TObject);
    procedure s_deptcodeKeyPress(Sender: TObject; var Key: Char);
    procedure s_deptcodeCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);

  private
    { Private declarations }
    EnterKey  : Boolean;        {엔터키를 누른가를  체크}
    procedure KeyClick(Sender : TObject);
  public
    { Public declarations }
    FGempno	  : string;         {임시저장 사원번호 }
    FGkorname	  : string;         {임시저장 사원명}
    HyunOrgNum    : String;
    InsertMode    : boolean;

  end;

var
  FM_Mainform: TFM_Mainform;

implementation

uses PZO1030A2, PZO1030A3;

{$R *.DFM}

procedure TFM_Mainform.btn_exitClick(Sender: TObject);
begin
    close;
end;


//------------------------------------------------------------------------------
procedure TFM_Mainform.KeyClick(Sender : TObject);
begin
   EnterKey       := False;
   //hjku
   //ClearDataField;
   //save.Caption   := '실행';
   //Save.Glyph     := nil;
   //ImageList1.GetBitmap(0, Save.Glyph);
   //Cancel.Enabled := False;
end;

procedure TFM_Mainform.FormCreate(Sender: TObject);
begin
    OraConnect;
    Pempno   := PassEmp(cmdline,1);
    Pkorname := PassEmp(cmdline,2);
    Pgrade   := Passemp(cmdline,4);

      OraQuery1.Close;
      OraQuery1.SQL.Clear;
      OraQuery1.SQL.Add(' select value1  from pimvari      ' +
                        '  where gubun  = ''00''           ' +
                        '    and sgubun = ''0001''         ');
      OraQuery1.Open;
      HyunOrgNum := OraQuery1.FieldByName('value1').AsString;
end;

procedure TFM_Mainform.btn_excelClick(Sender: TObject);
var XL, XArr: Variant;
    i,j,k: integer;
    SavePlace: TBookmark;
begin
{ //전체자료 추출할때..}
  if   Ora_anno.RecordCount < 1 then
  begin
       showmessage('엑셀 변환할 자료가 없습니다.');
       exit;
  end;

  XArr := VarArrayCreate([1, 8], VarVariant);
  try
       XL := CreateOLEObject('Excel.Application');
  except
       MessageDlg('Excel이 설치되어 있지 않습니다.', MtWarning, [mbok], 0);
       Exit;
  end;

  XL.WorkBooks.Add; //새로운 페이지 생성
  XL.Visible            := false;
  XL.WorkSheets[1].Name := '톡톡 연계 발령정보 전송 명단';  //시트명 부여
  XL.Range['A1:H2'].Merge;               //셀 병합

  //TITLE NAME 설정
  XL.Range['A1'].value  := '톡톡 연계 발령정보 전송 명단';
  XL.Range['A1'].font.Size := 16;
  XL.Range['A1'].font.Bold := True;

  //컬럼명 지정_서브타이블 지정

  XArr[ 1]  := '관계사'    ;
  XArr[ 2]  := '사번'      ;
  XArr[ 3]  := '성명'      ;
  XArr[ 4]  := '구분'      ;
  XArr[ 5]  := '부서코드'  ;
  XArr[ 6]  := '부서명'    ;
  XArr[ 7]  := '직책코드'  ;
  XArr[ 8]  := '직책명'    ;

  XL.Range['A3' , 'H3'].Value := XArr;
  k := 3;

  XL.Range['A3' , 'H3'].HorizontalAlignment := 3;
  XL.Range['A3' , 'H3'].Interior.Color:= $00CBF0B3;
  XL.Range['A3' , 'H3'].font.Size := 10;
  XL.Range['A3' , 'H3'].font.Bold := True;


  //검색된 자료를 excel에 export처리 시킨다.
  SavePlace :=   Ora_anno.GetBookmark;
    Ora_anno.DisableControls;
    Ora_anno.First;     //Showmessage(inttostr(  Ora_anno.RecordCount));

  for i := 1 to    Ora_anno.RecordCount do
  begin
     XArr[ 1]  :=  Ora_anno.FieldbyName('CMPCD').AsString;
     XArr[ 2]  :=  '''' + Ora_anno.FieldByName('EMPNO').AsString;
     XArr[ 3]  :=  Ora_anno.FieldbyName('KORNAME').AsString;
     XArr[ 4]  :=  Ora_anno.FieldbyName('OTYPENAME').AsString;
     XArr[ 5]  :=  Ora_anno.FieldbyName('CDEPTCD').AsString;
     XArr[ 6]  :=  Ora_anno.FieldByName('CDEPTNAME').AsString;
     XArr[ 7]  :=  Ora_anno.FieldByName('CDUTY').AsString;
     XArr[ 8]  :=  Ora_anno.FieldByName('CDUTYNAME').AsString;

     XL.Range['A' + IntToStr(k+1), 'H' + IntToStr(k+1)].Value := XArr;
     inc(k);
       Ora_anno.Next;
  end;
  //여기서 부터는 EXPORT된 EXCEL자료를 예쁘게 꾸미는 부분입니다.
  XL.Range['A1', 'H' + IntToStr(k)].Borders.LineStyle   := 1;  //테두리선을 만든다.  1은 실선
  XL.Range['A1', 'H' + IntToStr(k)].Borders.Weight      := 2;  //테두리선 두깨 설정  2는 보통두깨, 3은 무지 두꺼움
  XL.Range['A1', 'H' + IntToStr(k)].Borders.ColorIndex  := 1;  //테두리선 색상설정  1은 검은색
  XL.Range['A1', 'H' + IntToStr(k)].font.name := '맑은 고딕';//'굴림체';
  XL.Range['A1', 'A1'].HorizontalAlignment              := 3;  //가운데 정렬
  XL.Range['A3', 'H' + IntToStr(k)].font.Size           := 9;
  XL.Range['A4', 'H' + IntToStr(k)].HorizontalAlignment := 1;  //좌측정렬
  XL.Range['A1', 'H' + IntToStr(k)].Select;                    //자료를 모두 SELECT한 후 --하는 이유:  AutoFit 처리하기 위해서임
  XL.Selection.Columns.AutoFit;                                //자동정렬
  XL.Range['A4', 'A4'].Select;                                 //A4열에 커서 위치시킴
  XL.Visible := true;                                          //엑셀자료 보여줌
  Screen.Cursor := crDefault;
  Ora_anno.GotoBookmark(SavePlace);
  Ora_anno.FreeBookmark(SavePlace);
  Ora_anno.EnableControls;
end;



procedure TFM_Mainform.btn_searchClick(Sender: TObject);
begin
  with ora_anno do
  begin
    Close;
    Sql.Clear;
    sql.add('SELECT A.CMPCD,                                                                                                              ');
    sql.add('       A.EMPNO,                                                                                                              ');
    sql.add('       (SELECT KORNAME FROM PIMPMAS WHERE A.EMPNO = EMPNO) KORNAME,                                                          ');
    sql.add('       A.OTYPE,                                                                                                              ');
    sql.add('       DECODE(A.OTYPE, ''01'',''겸무/겸직'',''02'',''파견'','''') OTYPENAME,                                                 ');
    sql.add('       A.CDEPTCD,                                                                                                            ');
    sql.add('       (select DEPTNAME from pycdept b where orgnum =(SELECT VALUE1 FROM PIMVARI WHERE GUBUN =''00'' AND SGUBUN = ''0001'')  ');
    sql.add('                                         and A.CDEPTCD = B.DEPTCODE)      CDEPTNAME,                                         ');
    sql.add('       (select CHANMODE from pycdept b where orgnum =(SELECT VALUE1 FROM PIMVARI WHERE GUBUN =''00'' AND SGUBUN = ''0001'')  ');
    sql.add('                                         and A.CDEPTCD = B.DEPTCODE)      CHANMODE,                                          ');
    sql.add('       A.CDUTY,                                                                                                              ');
    sql.add('       (select CODENAME from pyccode where codeid =''I113'' and codeno = a.CDUTY) CDUTYNAME                                  ');
    sql.add('  FROM POSKANNO A                                                                                                            ');
    sql.add(' WHERE 1=1                                                                                                                   ');

    if(s_empno.text <> '') then
      SQL.Add(' and A.empno like ''' + Trim(ParseString(s_empno.text,'-',1)) + '%''  ');

    if(s_deptcode.text <> '') then
      SQL.Add(' and A.CDEPTCD like ''' + Trim(ParseString(s_deptcode.text,'-',1)) + '%''  ');

         if rg_gubun.ItemIndex = 1 then
            SQL.Add(' and A.OTYPE = ''01''  ')
    else if rg_gubun.ItemIndex = 2 then
            SQL.Add(' and A.OTYPE = ''02''  ');    


    if(cb_chanmode.Checked) then
    begin
      SQL.Add(' and exists(select 1 from pycdept b where orgnum =(SELECT VALUE1 FROM PIMVARI WHERE GUBUN =''00'' AND SGUBUN = ''0001'')  ');
      SQL.Add('                                      and A.CDEPTCD = B.DEPTCODE and chanmode =''3'')                                     ');
    end;

    Sql.Add('  ORDER BY A.CDEPTCD, A.CDUTY, A.EMPNO    ');

    Open;
  end;
end;

procedure TFM_Mainform.s_empnoInitPopup(Sender: TObject);
begin
  EmpForm.GSempnoS    := '' ;
  EmpForm.GSkornameS  := '' ;
  EmpForm.GSpstateS   := '' ;
  EmpForm.GSdeptcodeS := '' ;
  EmpForm.GSdeptnameS := '' ;
  EmpForm.E_Cond.Text := '' ;
  
  EmpForm.Edit        := TOnWinPopupEdit(Sender);
  EmpForm.E_condButtonClick(Sender,0);

  TOnWinPopupEdit(Sender).PopupControl := EmpForm ;
end;

procedure TFM_Mainform.s_empnoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
       btn_searchClick(nil);
  end;
end;

procedure TFM_Mainform.s_empnoCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
  if EmpForm.GSempnoS <> '' then
  begin
    s_empno.Text    := EmpForm.GSempnoS +' - ' + EmpForm.GSkornameS;

    btn_searchClick(nil);
  end;
end;

procedure TFM_Mainform.s_deptcodeInitPopup(Sender: TObject);
begin
  DeptForm.GSorgnum     := '';
  DeptForm.GSdeptcode   := '';
  DeptForm.GSdeptname   := '';
  DeptForm.E_cond.Text  := '';

  DeptForm.Edit         := TOnWinPopupEdit(Sender);
  DeptForm.E_condButtonClick(Sender,0);

  TOnWinPopupEdit(Sender).PopupControl := DeptForm ;
end;

procedure TFM_Mainform.s_deptcodeKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
        btn_searchClick(nil);
  end;
end;

procedure TFM_Mainform.s_deptcodeCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
  if DeptForm.GSdeptcode <> '' then
  begin
      s_deptcode.Text    := DeptForm.GSdeptcode + ' - ' + DeptForm.GSdeptname;

       btn_searchClick(nil);
  end;
end;

end.

