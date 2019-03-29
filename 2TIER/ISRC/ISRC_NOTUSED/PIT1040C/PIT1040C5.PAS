unit PIT1040C5;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  peoutlookbtn, ExtCtrls, pegradpanl, Db, StdCtrls, Mask,
  pebtnedit, Grids, DBGrids, pedbgrid, DBTables, Buttons;

type
  TPayClForm = class(TForm)
    Panel1: TPanel;
    ExitBtn: TPeJeonOutLookBtn;
    OKBtn: TPeJeonOutLookBtn;
    Pa_Title: TPeJeonGrdPanel;
    E_PayCl: TPePanelEdit;
    Search_Btn: TSpeedButton;
    DBGrid: TDBGrid;
    DataSource1: TDataSource;
    qryCODE: TQuery;
    procedure ExitBtnClick(Sender: TObject);
    procedure E_PayClKeyPress(Sender: TObject; var Key: Char);
    procedure OKBtnClick(Sender: TObject);
    procedure Grid1DblClick(Sender: TObject);
    procedure Grid1KeyPress(Sender: TObject; var Key: Char);
    procedure SGDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
      State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure Search_BtnClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure SGDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SGKeyPress(Sender: TObject; var Key: Char);
    procedure DBGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    gbSelected, START      : Boolean;

    gsCodeID: String;
    JOB_KIND : Integer;   // 작업 종류 : 1.직급, 2.직군, 3.직종

    JobField : String;  // 직군코드..


    Codeno, CodeName : String;
    { Public declarations }
  end;

var
  PayClForm: TPayClForm;

implementation

uses PIT1040C0;

{$R *.DFM}

procedure TPayClForm.ExitBtnClick(Sender: TObject);
begin
     gbSelected := False;
     Close;
end;

procedure TPayClForm.E_PayClKeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #13 then
        Search_Btn.Click;
end;

procedure TPayClForm.OKBtnClick(Sender: TObject);
begin
    gbSelected:= True;
    Codeno   := qryCODE.FieldByName('CODENO').AsString;
    CodeName := qryCODE.FieldByName('CODENAME').AsString;
    Close;
end;

procedure TPayClForm.Grid1DblClick(Sender: TObject);
begin
    OkBtn.Click;
end;

procedure TPayClForm.Grid1KeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #13 then
        OKBtn.Click;
end;

procedure TPayClForm.SGDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  Loc : Cardinal;
begin
    with (Sender as TStringGrid).Canvas do
    begin
        if ARow = 0 then
          Font.Style := [fsBold]
        else
          Font.Style := [];

        FillRect(Rect);
        Rect.Top   := Rect.Top + 2;
        Rect.Left  := Rect.Left + 2;

        if (ARow = 0) or (ACol = 0) then
          Loc := DT_CENTER or DT_WORDBREAK
        else
          Loc := DT_LEFT or DT_WORDBREAK;

        DrawText(Handle, PChar((Sender as TStringGrid).Cells[ACol, ARow]), -1, Rect, Loc);
    end;
end;

procedure TPayClForm.FormCreate(Sender: TObject);
begin
    START := True;
end;

procedure TPayClForm.FormPaint(Sender: TObject);
begin
    if START = False then System.Exit;
    START := False;
    Application.ProcessMessages;

    with DBGrid do
    begin
        if gsCodeID = 'EMP' then
        begin
            Columns[0].Visible := True;
            Columns[1].Visible := True;    Columns[1].Width := 130;
            Columns[2].Visible := True;    Columns[2].Width := 200;
            Columns[0].Title.Caption := '사번';
            Columns[1].Title.Caption := '성명';
            Columns[2].FieldName := 'name';
            Columns[2].Title.Caption := '인사상태';
        end
        else if gsCodeID = 'DEPT' then
        begin
            Columns[0].Visible := True;
            Columns[1].Visible := True;    Columns[1].Width := 230;
            Columns[2].Visible := True;    Columns[2].Width := 100;
            Columns[0].Title.Caption := '부서코드';
            Columns[1].Title.Caption := '부서명';
            Columns[2].FieldName := 'name';
            Columns[2].Title.Caption := '부서변동구분';
        end
        else if gsCodeID = 'I112' then
        begin
            Columns[0].Visible := True;    Columns[0].Width := 100;
            Columns[1].Visible := True;    Columns[1].Width := 318;
            Columns[2].Visible := False;
            Columns[0].Title.Caption := '코드';
            Columns[1].Title.Caption := 'BAND명';
        end
        else
        begin
            Columns[0].Visible := True;
            Columns[1].Visible := True;
            Columns[2].Visible := False;
            Columns[0].Title.Caption := '코드';
            Columns[1].Title.Caption := '코드명';
        end;
    end;

    Search_Btn.Click;
end;

procedure TPayClForm.Search_BtnClick(Sender: TObject);
var
  sScr : string;
begin
    if E_PayCL.Text = '' then
        sScr := '%'
    else
        sScr := '%' + E_PayCL.Text + '%';

    with qryCODE do
    begin
       CLOSE;
       SQL.Clear;
       if gsCodeID = 'EMP' then // 사번
       begin
           SQL.ADD('SELECT  '+
                   '    nvl( empno   ,'' '') codeno,            '+
                   '    nvl( korname ,'' '') codename,          '+
                   '    nvl( c.codename ,'' '') name            '+
                   'FROM  pimpmas i, pyccode c                  '+
                   'WHERE c.codeid = ''I114'' AND c.codeno = pstate '+
                   '  AND (empno LIKE Upper('''+sScr+''')       '+
                   '    OR korname LIKE   Upper('''+sScr+'''))  '+
                   ' order by codeno                            ');
       end
       else if gsCodeID = 'DEPT' then // 부서
       begin
           SQL.ADD('SELECT  '+
                   '    nvl( deptcode ,'' '') codeno,           '+
                   '    nvl( deptname ,'' '') codename,         '+
                   '    nvl( c.codename ,'' '') name            '+
                   'FROM  pycdept d, pyccode c                  '+
                   'WHERE c.codeid = ''I170'' AND c.codeno = d.chanmode '+
                   '  AND orgnum = (select value1 from pimvari where gubun = ''00'' and sgubun = ''0001'') '+
                   '  AND existon = ''1''                       '+
                   '  and  (deptname LIKE Upper('''+sScr+''')   '+
                   '        OR deptcode LIKE   Upper('''+sScr+''')) '+
                   ' order by codeno                            ');
       end
       else if gsCodeID = 'I112' then // 직급
       begin
           SQL.ADD('SELECT  '+
                   '    nvl( codeno   ,'' '') codeno,           '+
                   '    nvl( codename ,'' '') codename          '+
                   'FROM  pyccode                               '+
                   'WHERE codeid = '''+gsCodeid+'''             '+
                   '  and codeno < ''H11''                       '+ // 계약직이하삭제
                   '  and (codename LIKE Upper('''+sScr+''')    '+
                   '        OR codeno LIKE   Upper('''+sScr+''')) '+
                   ' order by codeno desc                   ');
       end
       else if gsCodeID = 'I221' then // 학력
       begin
           SQL.ADD('SELECT  '+
                   '    nvl( codeno   ,'' '') codeno,           '+
                   '    nvl( codename ,'' '') codename          '+
                   'FROM  pyccode                               '+
                   'WHERE codeid = '''+gsCodeid+'''                       '+
                   '  and codeno in (''37'',''39'',''46'',''48'',''49'',               '+
                   '   ''56'',''58'',''59'',''66'',''68'',''69'',''76'',''78'',''79'') '+
                   '  and (codename LIKE Upper('''+sScr+''')      '+
                   '        OR codeno LIKE   Upper('''+sScr+''')) '+
                   ' order by codeno                   ');
       end
       else  // 전공 I225
       begin
           SQL.ADD('SELECT  '+
                   '    nvl( codeno   ,'' '') codeno,           '+
                   '    nvl( codename ,'' '') codename          '+
                   'FROM  pyccode                               '+
                   'WHERE codeid = '''+gsCodeid+'''                       '+
                   '  and (codename LIKE Upper('''+sScr+''')      '+
                   '        OR codeno LIKE   Upper('''+sScr+''')) '+
                   ' order by codeno                   ');
       end;
//
       Open;
       if Bof AND Eof then
       begin
         MessageBox(Self.Handle, '코드가 존재하지 않습니다.', '코드오류', MB_ICONWARNING);
         Close;
         System.Exit;
       end;

    end;
     //DBGrid.Refresh;
end;

procedure TPayClForm.SGDblClick(Sender: TObject);
begin
    OKBtn.Click;
end;

procedure TPayClForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key = VK_ESCAPE then  ExitBtn.Click;
end;

procedure TPayClForm.SGKeyPress(Sender: TObject; var Key: Char);
begin
     if (Key = #13) then
     begin
         OKBtn.Click;
     end;
end;

procedure TPayClForm.DBGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key = VK_RETURN then
        OKBtnClick(Sender);
end;

procedure TPayClForm.DBGridDblClick(Sender: TObject);
begin
    OKBtnClick(Sender);
end;

end.

