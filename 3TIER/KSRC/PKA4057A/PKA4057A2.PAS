unit pka4057a2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, OnFocusButton, Grids, DBGrids, OnGrDBGrid, ExtCtrls, Db,
  Tmax_DataSetText, OnPopupEdit, OnStringUtils;

type
  TFM_Dept = class(TForm)
    Panel1: TPanel;
    PA_grid: TPanel;
    GR_dept: TOnGrDbGrid;
    PA_buttons: TPanel;
    FB_ok: TOnFocusButton;
    FB_cancel: TOnFocusButton;
    QR_cod: TTMaxDataSet;
    DataSource1: TDataSource;
    QR_com: TTMaxDataSet;
    procedure FB_cancelClick(Sender: TObject);
    procedure FB_okClick(Sender: TObject);
    procedure GR_deptDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FG_deptcode : String;
    Edit        : TOnWinPopupEdit;
    FG_empno    : String;
    FG_date     : String;
    FG_Right    : Integer;
    FG_Grade    : String;

    procedure PG_Get_Dept;
  end;

var
  FM_Dept: TFM_Dept;

implementation

uses pka4057a1;

{$R *.DFM}

procedure TFM_Dept.PG_Get_Dept;
var
  FL_Sql : String;
  FL_Job : String;

  procedure PL_Com_Init;
  begin
    with QR_com do
      begin
        Close;
        ServiceName := 'HINSA_select';
        ClearFieldInfo;
        AddField('field1'  , ftString, 100);
        AddField('field2'  , ftString, 100);
        AddField('field3'  , ftString, 100);
        AddField('field4'  , ftString, 100);
        AddField('field5'  , ftString, 100);
        Sql.Clear;
      end;
  end;
begin
  if FG_right = 2 then
    FL_job := '대행부서'
  else
    FL_job := '근무지';

  QR_cod.ServiceName := 'HINSA_pycdept';
  if FL_job = '근무지' then
    begin
      FL_Sql := 'SELECT deptcode, deptname, deptna3, orgnum, boncode, fincode, fieldcode '+
                '  FROM pycdept '+
                ' WHERE orgnum   = (SELECT value1 FROM pimvari WHERE gubun = ''00'' AND sgubun = ''0001'') '+
                '   AND existon  = ''1''    '+
                '   AND chanmode <> ''3''   '+
                '   AND deptcode = ''%s''   '+
//                '   AND substr(deptcode,1,3) = ''%s''   '+
                '   AND substr(deptcode,1,4) = ''%s''   '+
                ' ORDER BY deptcode         ';
      FL_Sql := Format(FL_Sql, [FG_deptcode, FG_deptcode]);
    end
  else if FL_job = '대행부서' then
    begin
      FL_Sql := 'SELECT deptcode, deptname, deptna3, orgnum, boncode, fincode, fieldcode                   '+
                '  FROM pycdept                                                                            '+
                ' WHERE orgnum   = (SELECT value1 FROM pimvari WHERE gubun = ''00'' AND sgubun = ''0001'') '+
                '   AND existon  = ''1''              '+
                '   AND chanmode <> ''3''             '+
                '   AND deptcode  IN                  '+
                '      (SELECT jobdept                '+
                '         FROM pimpmas                '+
                '        WHERE empno = ''%s''         '+
                '        UNION                        '+
                '       SELECT jobdept                '+
                '         FROM pimeemp                '+
                '        WHERE eempno   = ''%s''      '+
                '        UNION                        '+
                '       SELECT deptcode               '+
                '         FROM pkcotman               '+
                '        WHERE empno   = ''%s''       '+
                '          AND jobfrdate <= ''%s''    '+
                '          AND NVL(jobtodate,''99999999'') >= ''%s'')  '+
                ' ORDER BY deptcode         ';
      FL_Sql := Format(FL_Sql, [FG_empno, FG_empno, FG_empno, FG_date, FG_Date]);
    end
  else
    System.Exit;

//2004.8.4 유효성 추가 : 운영자면 다른부서도 조회가능하게..(2Tier기능을 3Tier에)
  if (Copy(FG_Grade,3,1) <='C') and (Copy(FG_Grade,3,1) >='A') and (FG_Empno <>'2507') then
    begin
      FL_Sql := 'SELECT deptcode, deptname, deptna3, orgnum, boncode, fincode, fieldcode '+
                '  FROM pycdept '+
                ' WHERE orgnum   = (SELECT value1 FROM pimvari WHERE gubun = ''00'' AND sgubun = ''0001'') '+
                '   AND existon  = ''1''    '+
                '   AND chanmode <> ''3''   '+
                ' ORDER BY deptcode         ';
    end;
// 추가 end

  try
    with QR_cod do
      begin
        Close;
        Sql.Clear;
        Sql.Add(FL_Sql);
        Open;
      end;
  except
    QR_cod.Close;
  end;
end;

procedure TFM_Dept.FB_cancelClick(Sender: TObject);
begin
  Edit.PopupForm.ClosePopup(False);
end;

procedure TFM_Dept.FB_okClick(Sender: TObject);
begin
  Edit.PopupForm.ClosePopup(True);
end;

procedure TFM_Dept.GR_deptDblClick(Sender: TObject);
begin
  FB_okClick(Sender);
end;


{      FL_Sql := 'SELECT deptcode, deptname, deptna3, orgnum, boncode, fincode, fieldcode '+
                '  FROM pycdept '+
                ' WHERE orgnum   = (SELECT value1 FROM pimvari WHERE gubun = ''00'' AND sgubun = ''0001'') '+
                '   AND existon  = ''1''    '+
                '   AND chanmode <> ''3''   '+
                '   AND SUBSTR(deptcode,1,3)  IN      '+
                '      (SELECT SUBSTR(deptcode,1,3)   '+
                '         FROM pimpmas                '+
                '        WHERE empno = ''%s''         '+
                '        UNION                        '+
                '       SELECT SUBSTR(addeptcode,1,3) '+
                '         FROM pihanno                '+
                '        WHERE empno    = ''%s''      '+
                '          AND ancode   = ''233''     '+
                '          AND NVL(antodate,''9999999999'')  >= ''%s'' '+
                '          AND anfrdate = ''%s'')     '+
                ' ORDER BY deptcode         ';
      FL_Sql := 'SELECT deptcode, deptname, deptna3, orgnum, boncode, fincode, fieldcode '+
                '  FROM pycdept '+
                ' WHERE orgnum   = (SELECT value1 FROM pimvari WHERE gubun = ''00'' AND sgubun = ''0001'') '+
                '   AND existon  = ''1''    '+
                '   AND chanmode <> ''3''   '+
                '   AND SUBSTR(deptcode,1,3) IN (SELECT SUBSTR(deptcode,1,3) '+
                '                                  FROM pkcotman             '+
                '                                 WHERE empno = ''%s''       '+
                '                                   AND jobfrdate <= ''%s''  '+
                '                                   AND NVL(jobtodate,''99999999'') >= ''%s'')  '+
                ' ORDER BY deptcode ';
      FL_Sql := Format(FL_Sql, [FG_empno, FG_date, FG_Date]);}
end.
