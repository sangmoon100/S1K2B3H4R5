unit PKG5020A1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, MemDS, DBAccess, Ora, ComCtrls, StdCtrls, OnFocusButton,
  ExtCtrls, OnScheme, OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl,
  OnEditCombo, OnEditMdate, calen2, OnShapeLabel, OnPopupEdit, Pass,
  Buttons, Grids, DBGrids;

type
  TFM_MainForm = class(TForm)
    SF_Main: TOnSchemeForm;
    PA_BackWindow: TPanel;
    SB_Help: TStatusBar;
    Panel2: TPanel;
    BT_Save: TOnFocusButton;
    BT_Exit: TOnFocusButton;
    Ora_Qry1: TOraQuery;
    Ora_Grid: TOraQuery;
    Shape7: TShape;
    L_CurDate: TLabel;
    Lempno: TLabel;
    BT_Search: TOnFocusButton;
    Ora_Insert: TOraQuery;
    Ora_Session: TOraSession;
    ED_orgnum: TOnEdit;
    DBGrid1: TDBGrid;
    sGrid: TStringGrid;
    OnShapeLabel2: TOnShapeLabel;
    BT_cancel: TOnFocusButton;
    DataSource1: TDataSource;
    BT_Add: TOnFocusButton;
    BT_Del: TOnFocusButton;
    Ora_Grid2: TOraQuery;
    Ora_Order: TOraQuery;
    procedure BT_ExitClick(Sender: TObject);
    procedure BT_SaveClick(Sender: TObject);
    procedure BT_SearchClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BT_cancelClick(Sender: TObject);
    procedure sGridDblClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure ED_orgnumChange(Sender: TObject);
    procedure BT_AddClick(Sender: TObject);
    procedure BT_DelClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);

  private
    { Private declarations }
    function  GetTime : String;
    procedure InsertStdpt;
    procedure CallStdpt;
    procedure SelectGrid;
    procedure InsertGrid;
    procedure GridOrder;
    procedure Retrieve;

    function GetDeptList():String;

  public
    { Public declarations }
    GSsysdate, GSempno, GSkorname, GSgrade : String;
    GSaveChk : Integer;   // 저장변수
    Udeptcode, Fdeptcode  : String;
    LIchk : Integer;

  end;

var
  FM_MainForm: TFM_MainForm;

implementation


{$R *.DFM}

procedure TFM_MainForm.FormCreate(Sender: TObject);
begin
  Application.ProcessMessages;
  SB_Help.Panels[1].Text := ' 데이타베이스에 접속중입니다...';

  Ora_Session.Options.Net   := True;
  Ora_Session.ConnectPrompt := False;
  Ora_Session.Username      := Passemp(cmdline,5);
  Ora_Session.Password      := Passemp(cmdline,6);
  Ora_Session.Server        := Passemp(cmdline,7)+':'+Passemp(cmdline,9)+':'+Passemp(cmdline,8);
  
  try
    Ora_Session.Connected  := True;
  except on E : Exception do
    Application.MessageBox(PChar('서버에 접속할 수 없습니다...'#13#13+ E.Message),'알 림',MB_OK);
  end;
end;

procedure TFM_MainForm.FormActivate(Sender: TObject);
begin
  GSaveChk  := 0 ; // 저장변수 초기화

  GetTime;
  L_CurDate.Caption  := copy(GSsysdate,1,4)+'/'+copy(GSsysdate,5,2)+'/'+copy(GSsysdate,7,2);
  GSempno   := Passemp(cmdline,1);
  GSkorname := Passemp(cmdline,2);
  GSgrade   := copy(Passemp(cmdline,4),3,1);
  Lempno.Caption := GSkorname+'('+GSempno+')';

  Retrieve;
  CallStdpt;
  SB_Help.Panels[1].Text := '';
end;

procedure TFM_MainForm.FormShow(Sender: TObject);
begin
  with sGrid do
  begin
     Cells[1,0] := '부서';
     Cells[2,0] := '부서명';
     Cells[3,0] := '상세부서';
  end;
end;


procedure TFM_MainForm.BT_ExitClick(Sender: TObject);
begin
  if GSaveChk = 1 then
    begin
      If IDOK = Application.MessageBox('변경작업 후 자료를 저장하지 않았습니다.'+#13+
                                       '작업을 종료 하시겠습니까?','작업안내', mb_OKCancel) then
         Close;
    end
  else
    Close;
end;

procedure TFM_MainForm.BT_SaveClick(Sender: TObject);
var
  i : Integer;
begin
//  if sGrid.Cells[1,1] = '' then exit;

  SB_Help.Panels[1].Text := '';
  If IDOK = Application.MessageBox('해당 자료를 저장하시겠습니까?','안내', mb_OKCancel) then
  begin
     SB_Help.Panels[1].Text := '현 근무형태의 자료를 모두 삭제 중입니다..';
     Application.ProcessMessages;
     with Ora_Qry1 do
     begin
       Close;
       SQL.Clear;
       SQL.ADD(' DELETE FROM PKCEXDPT                   ');
       SQL.ADD('  WHERE ORGNUM ='''+ED_orgnum.text+'''  ');
       EXECSQL;
     end;

     if sGrid.Cells[1,1] <> '' then
     begin
        SB_Help.Panels[1].Text :=  '자료 입력 중입니다..';
        Application.ProcessMessages;

        i := 0;
        with sGrid do
        begin
           for i := 1  to RowCount - 1 do
           begin
             Udeptcode := Cells[1,i];
             Udeptcode := TrimRight(Udeptcode);

             InsertStdpt;
           end;
        end;

        SB_Help.Panels[1].Text := '저장 완료..';
        GSaveChk := 0;  // 저장이 완료 되었을시
     end
     else
       SB_Help.Panels[1].Text := '잘못된 데이터 입력입니다...';

     // 초기화
     with sGrid do
     begin
        RowCount := 2;
        Rows[Row].Clear;
     end;
  end;

  CallStdpt;
  Retrieve;
end;

////////////////////////////////////////////////////////////////////////////////
function  TFM_MainForm.GetTime;
begin
  with Ora_Qry1 do
    begin
      Close;
      SQL.Clear;
      SQL.ADD(' SELECT TO_CHAR(SYSDATE,''YYYYMMDDHH24MISSD'') GSsysdate ');
      SQL.ADD('   FROM DUAL ');
      Open;
      GSsysdate := FieldByName('GSsysdate').AsString;
      Close;
    end;
end;

procedure TFM_MainForm.BT_SearchClick(Sender: TObject);
begin
  CallStdpt;
  Retrieve;
end;

procedure TFM_MainForm.Panel2Click(Sender: TObject);
begin
  SB_Help.Panels[1].Text := Passemp(cmdline,7);
end;

procedure TFM_MainForm.BT_cancelClick(Sender: TObject);
begin
     SB_Help.Panels[1].Text := '';
     If IDOK = Application.MessageBox('작업을 취소하시겠습니까?','작업안내', mb_OKCancel) then
     begin
         sGrid.RowCount := 2;
         sGrid.Rows[sGrid.Row].Clear;

         CallStdpt;
         Retrieve;
         GSaveChk := 0; // 초기화
     end;
end;

procedure TFM_MainForm.sGridDblClick(Sender: TObject);
begin
   with sGrid do
   begin
      if (Cells[1,1]= '') then exit;
      Rows[Row].Clear;
      GridOrder;
      if RowCount <> 2 then
         RowCount := RowCount -1;
   end;
   GSaveChk := 1;
//   SelectGrid;
end;

procedure TFM_MainForm.DBGrid1DblClick(Sender: TObject);
var
   i, irow : integer;
   ItemChk : integer;
begin
  ItemChk := 0;
  Fdeptcode := Ora_Grid.FieldByName('DEPTCODE').AsString;

  with sGrid do
  begin
      for i := 1 to  RowCount -1 do
      begin  showmessage(Cells[1, i]+'| '+Fdeptcode);
          if Cells[1, i] = Fdeptcode then
          begin //ItemChk := 1;
              ShowMessage('선택하신 부서가 이미 교대근무부서에 등록되어있습니다.');
              Application.ProcessMessages;
              system.exit;
          end;
      end;
  end;

  InsertGrid;
//  GridOrder;
//  SelectGrid;
end;

///////////////////////////////////////////////////////////////////////////////
procedure TFM_Mainform.CallStdpt;
var i: integer;
begin
  with Ora_Grid2 do
  begin
    Close;
    SQL.Clear;
    SQL.ADD(' SELECT A.DEPTCODE, B.DEPTNAME, B.DEPTNA3  ');
    SQL.ADD('   FROM PKCEXDPT A, PYCDEPT B              ');
    SQL.ADD('  WHERE A.ORGNUM   = B.ORGNUM              ');
    SQL.ADD('    AND A.DEPTCODE = B.DEPTCODE            ');
    SQL.ADD('    AND A.ORGNUM   ='''+ED_orgnum.text+''' ');
    Open;

    with sGrid do
    begin
      for i := 1 to Ora_Grid2.RecordCount do
      begin
         Cells[1,i] := Ora_Grid2.FieldByName('DEPTCODE').AsString;
         Cells[2,i] := Ora_Grid2.FieldByName('DEPTNAME').AsString;
         Cells[3,i] := Ora_Grid2.FieldByName('DEPTNA3').AsString;
         next;
         RowCount := i +1;
      end;
    end;
  end;
end;

procedure TFM_Mainform.Retrieve;
begin
  If ED_orgnum.Text = '' then begin
     Ora_Qry1.Close;
     Ora_Qry1.SQL.Clear;
     Ora_Qry1.SQL.ADD(' select value1 from pimvari where gubun=''00'' and sgubun=''0001'' ');
     Ora_Qry1.Open;
     ED_orgnum.Text := Ora_Qry1.Fields[0].AsString;
  end;

  with Ora_Grid do
  begin
    Close;
    SQL.Clear;
    SQL.ADD(' SELECT A.DEPTCODE, A.DEPTNAME, A.DEPTNA3             ');
    SQL.ADD('   FROM PYCDEPT A                                     ');
    SQL.ADD('  WHERE A.ORGNUM = '''+ED_orgnum.Text+'''             ');
    SQL.ADD('    AND A.deptcode not in (select deptcode            ');
    SQL.ADD('                             from PKCEXDPT            ');
    SQL.ADD('                            where A.orgnum = Orgnum)  ');
    SQL.ADD('  ORDER BY A.DEPTORDER                                ');
    Open;
  end;
end;

procedure TFM_Mainform.InsertGrid;
begin
   with sGrid do
   begin
       if not ((RowCount = 1) and (Cells[1,1]= '')) or
          not ((RowCount = 0) and (Cells[1,1]= '')) then
          RowCount := RowCount + 1 ;

       Cells[1,RowCount-1] := Copy(Fdeptcode,1,5);
       Cells[2,RowCount-1] := Ora_Grid.FieldByName('DEPTNAME').AsString;
       Cells[3,RowCount-1] := Ora_Grid.FieldByName('DEPTNA3').AsString;
///       sGridClick(self);
   end;
   GSaveChk := 1;
end;

procedure TFM_Mainform.InsertStdpt;
begin
  with Ora_Insert do
  begin
    Close;
    SQL.Clear;
    SQL.ADD(' INSERT INTO PKCEXDPT                             ');
//    SQL.ADD(' (ORGNUM, DEPTCODE, STKIND, WRITETIME, WRITEMAN)  ');
    SQL.ADD(' (ORGNUM, DEPTCODE, WRITETIME, WRITEMAN)  ');
    SQL.ADD(' VALUES ('''+ED_orgnum.text+''', '''+Udeptcode+''', ');
//    SQL.ADD('      ''1'', '''+GSsysdate+''' ,'''+GSempno+''' ) ');
    SQL.ADD('         '''+GSsysdate+''' ,'''+GSempno+''' ) ');
    ExecSQL;
  end;
end;

procedure TFM_MainForm.ED_orgnumChange(Sender: TObject);
begin
     SB_Help.Panels[1].Text := '';
     if Length(ED_orgnum.text) > 0 then
     begin
          CallStdpt;
          Retrieve;
     end;
end;

function TFM_Mainform.GetDeptList:String;
   var
   i: integer;
   DeptList : String;
begin
   DeptList := '';
   with sGrid do
   begin
       for  i := 1  to RowCount - 1 do
       begin
          if Cells[1,i] <> '' then
              DeptList := DeptList+','''+Cells[1,i]+'''';
       end;
   end;
   result := DeptList;
end;

procedure TFM_Mainform.GridOrder;
  var i:integer;
begin
  // 정렬
    with sGrid, Ora_Order do
    begin
       //if Active = false then exit;
       Close;
       SQL.Clear;
       SQL.ADD(' SELECT ORGNUM,DEPTCODE,DEPTNAME,DEPTNA3  ');
       SQL.ADD('   FROM PYCDEPT                           ');
       SQL.ADD('  WHERE ORGNUM = '''+ED_orgnum.Text+'''   ');
       SQL.ADD('    AND DEPTCODE in ('''''+GetDeptList+') ');
       SQL.ADD(' ORDER BY DEPTORDER                       ');
       Open;

       for i := 1 to RecordCount do
       begin
            sGrid.Cells[1,i] := FieldByName('DEPTCODE').AsString;   
            sGrid.Cells[2,i] := FieldByName('DEPTNAME').AsString;
            sGrid.Cells[3,i] := FieldByName('DEPTNA3').AsString;
            next;
       end;
    end;
end;

procedure TFM_Mainform.SelectGrid;
begin
{  with Ora_Qry1 do
  begin
    Close;
    SQL.Clear;
    SQL.ADD(' SELECT A.DEPTCODE, A.DEPTNAME, A.DEPTNA3 ');
//    SQL.ADD('    ,(SELECT DEPTNAME FROM PYCDEPT WHERE DEPTCODE = A.EXTCODE AND ORGNUM = '''+ED_orgnum.Text+''') EXTNAME ');
    SQL.ADD('   FROM PYCDEPT A ');
    SQL.ADD('  WHERE A.ORGNUM = '''+ED_orgnum.Text+''' ');
    SQL.ADD('    AND A.DEPTCODE NOT IN ('' '''+GetDeptList+') ');
    SQL.ADD('  ORDER BY A.DEPTORDER ');
    Open;

    If RecordCount  > 0 then LIchk := 0;
    If RecordCount  < 0 then LIchk := -1;
  end; }
end;

procedure TFM_MainForm.BT_AddClick(Sender: TObject);
begin
     DBGrid1DblClick(DBGrid1);
end;

procedure TFM_MainForm.BT_DelClick(Sender: TObject);
begin
     SB_Help.Panels[1].Text := '';
     sGridDblClick(Self);
end;



end.

