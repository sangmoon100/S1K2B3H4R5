unit PKA40523;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  jshape, jeonPan, ExtCtrls, Shdowpnl, Grids, DBGrids, jgrid, StdCtrls,
  Mask, HanEdit, Db, Tmax_DataSetText,OnPopupEdit,
  OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl, OnFocusButton, OnGrDBGrid;

type
  TDeptForm = class(TForm)
    DataSource1: TDataSource;
    TDS1: TTMaxDataSet;
    RunGrid: TOnGrDbGrid;
    Panel1: TPanel;
    FB_ok: TOnFocusButton;
    FB_cancel: TOnFocusButton;
    Panel2: TPanel;
    E_cond: TOnButtonEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure E_condButtonClick(Sender: TObject; ButtonIndex: Integer);
    procedure RunGridDblClick(Sender: TObject);
    procedure FB_cancelClick(Sender: TObject);
    procedure E_condKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    Edit        : TOnWinPopupEdit;
    GIcloseS    : Integer;
    GSdeptcodeS  : String;
    GSdeptcode   : String;
    GSdeptname   : String;

    FG_empno    : String;
    FG_date     : String;
    FG_Grade    : String;
  end;

var
   DeptForm : TDeptForm;

implementation

uses PKA40521;

{$R *.DFM}

procedure TDeptForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TDS1.Close;
end;

procedure TDeptForm.E_condButtonClick(Sender: TObject;
  ButtonIndex: Integer);
var
  ParamVariant : String;
begin

//  ParamVariant  := ' SELECT DEPTCODE, DEPTNAME||'' ''||DEPTNA3 DEPTNAME         '+
//                   '   FROM PYCDEPT B                                           '+
//                   '  WHERE B.ORGNUM  = (select value1 from pimvari where gubun = ''00'' and sgubun = ''0001'')  '+
//            Format('    AND B.DEPTCODE LIKE ''%s''', [GSdeptcodeS+'%']);

//  if ((Copy(FM_Main.GSGrade,3,1) = 'A') OR (Copy(FM_Main.GSGrade,3,1) = 'B'))  then
//       ParamVariant := ParamVariant + Format(' AND (B.DEPTCODE LIKE ''%s'' OR B.DEPTNAME LIKE  ''%s'' ) ',['%'+E_cond.Text+'%','%'+E_cond.Text+'%'])
//  else
  //2016.10.31 jissi  해당팀장님의 근태결재부서 전부 나오도록 수정
  if (FG_Grade[2] <'C') or (FG_Grade[3] <'C')   then
  begin
       ParamVariant  := ' SELECT DEPTCODE, DEPTNAME||'' ''||DEPTNA3 DEPTNAME                '+
                        '   FROM PYCDEPT B                                                  '+
                        '  WHERE B.ORGNUM  = (select value1 from pimvari                    '+
                        '                      where gubun = ''00'' and sgubun = ''0001'')  '+
                        '    AND B.existon  = ''1''                                         '+
                        '    AND B.chanmode <> ''3''                                        '+
                        '    AND B.DEPTCODE LIKE ''%s''                                     ';
       ParamVariant  := Format(ParamVariant, [GSdeptcodeS+'%']);
  end
  else
  begin
       ParamVariant  := ' SELECT DEPTCODE, DEPTNAME||'' ''||DEPTNA3 DEPTNAME                '+
                        '   FROM PYCDEPT B                                                  '+
                        '  WHERE B.ORGNUM  = (select value1 from pimvari                    '+
                        '                      where gubun = ''00'' and sgubun = ''0001'')  '+
                        '    AND B.existon  = ''1''                                         '+
                        '    AND B.chanmode <> ''3''                                        '+
                        '    AND B.DEPTCODE  IN                                             '+
                        '       (SELECT jobdept                                             '+
                        '          FROM pimpmas                                             '+
                        '         WHERE empno = ''%s''                                      '+
                        '         UNION                                                     '+
                        '        SELECT jobdept                                             '+
                        '          FROM pimeemp                                             '+
                        '         WHERE eempno   = ''%s''                                   '+
                        '         UNION                                                     '+
                        '        SELECT deptcode                                            '+
                        '          FROM pkcotman                                            '+
                        '         WHERE empno   = ''%s''                                    '+
                        '           AND jobfrdate <= ''%s''                                 '+
                        '           AND NVL(jobtodate,''99999999'') >= ''%s'')              ';
       ParamVariant  := Format(ParamVariant, [FG_empno, FG_empno, FG_empno, FG_date, FG_Date]);
  end;

  if E_cond.Text <> '' then
       ParamVariant := ParamVariant + Format(' AND (B.DEPTCODE LIKE ''%s'' OR B.DEPTNAME LIKE  ''%s'' OR B.EXTCODE LIKE  ''%s'' OR B.DEPTCODE LIKE ''%s'') ',['%'+E_cond.Text+'%','%'+E_cond.Text+'%',FM_Main.GSdeptcode2,FM_Main.GSdeptcode2]);

  ParamVariant := ParamVariant + ' ORDER BY DEPTCODE ';

  with TDS1 do
    begin
      ServiceName := 'PKA4100C_sel1';
      Close;
      Sql.Clear;
      Sql.Add(ParamVariant);

      ClearFieldInfo;
      AddField('DEPTCODE'          , ftString  ,  6   );
      AddField('DEPTNAME'          , ftString  ,  60  );
      Open;
      FieldByName('DEPTCODE').Alignment   := taCenter;
    end;
end;

procedure TDeptForm.RunGridDblClick(Sender: TObject);
begin
  if not TDS1.Eof then
  begin
    GSdeptcode   := TDS1.FieldByName('DEPTCODE').AsString;
    GSdeptname   := TDS1.FieldByName('DEPTNAME').AsString;
    GIcloseS := 0;
  end
  else
  begin
    GSdeptcode   := '';
    GSdeptname   := '';
    GIcloseS := -1;
  end;

  Edit.PopupForm.ClosePopup(False);

end;

procedure TDeptForm.FB_cancelClick(Sender: TObject);
begin
  GSdeptcode   := '';
  GSdeptname := '';
  Edit.PopupForm.ClosePopup(False);

end;

procedure TDeptForm.E_condKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    E_condButtonClick(Sender, 0);
end;

end.
 