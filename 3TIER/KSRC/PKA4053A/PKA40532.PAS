unit PKA40532;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  jshape, jeonPan, ExtCtrls, Shdowpnl, Grids, DBGrids, jgrid, StdCtrls,
  Mask, HanEdit, Db, Tmax_DataSetText,OnPopupEdit,
  OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl, OnFocusButton, OnGrDBGrid;

type
  TEmpForm = class(TForm)
    DataSource1: TDataSource;
    TDS1: TTMaxDataSet;
    RunGrid: TOnGrDbGrid;
    Panel1: TPanel;
    BT_Ok: TOnFocusButton;
    BT_Cancel: TOnFocusButton;
    Panel2: TPanel;
    E_cond: TOnButtonEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure E_condButtonClick(Sender: TObject; ButtonIndex: Integer);
    procedure RunGridDblClick(Sender: TObject);
    procedure BT_CancelClick(Sender: TObject);
    procedure E_condKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    Edit        : TOnWinPopupEdit;
    GIcloseS    : Integer;
    GSempnoS    : String;
    GSkornameS  : String;
    GSorgnumS   : String;
    GSdeptcodeS : String;
    GSdeptnameS : String;
  end;

var
   EmpForm : TEmpForm;

implementation

uses PKA40531;

{$R *.DFM}

procedure TEmpForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TDS1.Close;
end;

procedure TEmpForm.E_condButtonClick(Sender: TObject;
  ButtonIndex: Integer);
var
  ParamVariant, ParamVariant2, key_empno : String;
begin

  ParamVariant  := ' SELECT nvl(A.EMPNO,'' ''),  nvl(A.KORNAME,'' '') KORNAME, '+
                   '        nvl(A.ORGNUM,'' ''), nvl(A.JOBDEPT,'' ''),   '+
                   '        NVL(B.DEPTNAME, '' '')                       '+
                   '   FROM PYCDEPT B, PIMPMAS A                         '+
                   '  WHERE B.ORGNUM  = A.ORGNUM                         '+
                   '    AND B.DEPTCODE = A.JOBDEPT                       ';
   if E_cond.Text <> '' then
      ParamVariant := ParamVariant +'    AND A.ORGNUM = '''+GSorgnumS+'''                 '
   else
      ParamVariant := ParamVariant +'    AND A.ORGNUM = (select value1 from pimvari where sgubun =''0001'' and gubun =''00'') ';
   if E_cond.Text <> '' then
    ParamVariant := ParamVariant + ' and (EMPNO LIKE '''+E_cond.Text+'%'' '+
                                   ' OR KORNAME LIKE '''+E_cond.Text+'%'') ';

    ParamVariant := ParamVariant + ' ORDER BY EMPNO ';


  key_empno := FM_Main.GSempno;
  ParamVariant2  := ' select nvl(a.empno,'' ''),  nvl(a.korname,'' ''),                                  '+#13+
                   '        nvl(a.orgnum,'' ''), nvl(a.jobdept,'' ''), nvl(c.deptname,'' '')             '+#13+
                   '   from pimpmas a, pycdept c,                                                        '+#13+
                   '        (select max(decode(mod(no,5),1,replace(a.deptcode,''0'',''''))) deptcode1,   '+#13+
                   '                max(decode(mod(no,5),2,replace(a.deptcode,''0'',''''))) deptcode2,   '+#13+
                   '                max(decode(mod(no,5),3,replace(a.deptcode,''0'',''''))) deptcode3,   '+#13+
                   '                max(decode(mod(no,5),4,replace(a.deptcode,''0'',''''))) deptcode4,   '+#13+
                   '                max(decode(mod(no,5),0,replace(a.deptcode,''0'',''''))) deptcode5    '+#13+
                   '           from (select rownum no, deptcode                                          '+#13+
                   '                   from pihorga a                                                    '+#13+
                   '                  where a.orgym = to_char(sysdate,''YYYYMM'')                        '+#13+
                   '                    and a.gubun = ''0''                                              '+#13+
                   '                    and ( a.empno like '''+key_empno+'%'' ) or                       '+#13+
                   '                        ( a.korname like '''+key_empno+'%'' )                        '+#13+
                   '                ) a                                                                  '+#13+
                   '          group by ceil(no/5)) b                                                     '+#13+
                   '  where a.orgnum =(select value1 from  PIMVARI where GUBUN=''00'' and  SGUBUN=''0001'')   '+#13+
                   '    and a.pstate < ''80''                                                            '+#13+
                   '    and a.empno not like ''Y%''                                                      '+#13+
                   '    and ((a.deptcode like nvl(b.deptcode1,''ZZZZZ'')||''%'') or                      '+#13+
                   '         (a.deptcode like nvl(b.deptcode2,''ZZZZZ'')||''%'') or                      '+#13+
                   '         (a.deptcode like nvl(b.deptcode3,''ZZZZZ'')||''%'') or                      '+#13+
                   '         (a.deptcode like nvl(b.deptcode4,''ZZZZZ'')||''%'') or                      '+#13+
                   '         (a.deptcode like nvl(b.deptcode5,''ZZZZZ'')||''%'')                         '+#13+
                   '        )                                                                            '+#13+
                   '    and c.orgnum = a.orgnum                                                          '+#13+
                   '    and c.deptcode = a.deptcode                                                      '+#13+
                   '  union                                                                              '+#13+
                   ' select nvl(a.empno,'' ''),   nvl(a.korname,'' ''),                                  '+#13+
                   '        nvl(a.orgnum, '' ''), nvl(a.jobdept,'' ''), nvl(c.deptname, '' '')           '+#13+
                   '   from pimpmas a, pycdept c                                                         '+#13+
                   '  where a.orgnum = (select value1 from  PIMVARI where GUBUN=''00'' and  SGUBUN=''0001'')  '+#13+
                   '    and a.pstate < ''80''                                                            '+#13+
                   '    and ( (a.empno like '''+key_empno+'%'') or                                       '+#13+
                   '          (a.korname like '''+key_empno+'%'') )                                      '+#13+
                   '    and c.orgnum = a.orgnum                                                          '+#13+
                   '    and c.deptcode = a.deptcode                                                      ';

  with TDS1 do
    begin
      ServiceName := 'PKA4080B_sel3';
      Close;
      Sql.Clear;

      if (FM_Main.All_Flag) then
           Sql.Add(ParamVariant)
      else
           Sql.Add(ParamVariant2);

      ClearFieldInfo;
      AddField('EMPNO'             , ftString  ,  4   );
      AddField('KORNAME'           , ftString  ,  12  );
      AddField('ORGNUM'            , ftString  ,  3   );
      AddField('JOBDEPT'           , ftString  ,  6   );
      AddField('DEPTNAME'          , ftString  ,  60  );
      Open;
      FieldByName('EMPNO').Alignment   := taCenter;
      FieldByName('KORNAME').Alignment := taCenter;
    end;
end;

procedure TEmpForm.RunGridDblClick(Sender: TObject);
begin
  if not TDS1.Eof then
  begin
    GSempnoS    := TDS1.FieldByName('empno').AsString;
    GSkornameS  := TDS1.FieldByName('korname').AsString;
    GSorgnumS   := TDS1.FieldByName('orgnum').AsString;
    GSdeptnameS := TDS1.FieldByName('deptname').AsString;
    GIcloseS := 0;
  end
  else
  begin
    GSempnoS    := '';
    GSkornameS  := '';
    GSorgnumS   := '';
    GSdeptnameS := '';
    GIcloseS := -1;
  end;

  Edit.PopupForm.ClosePopup(False);

end;

procedure TEmpForm.BT_CancelClick(Sender: TObject);
begin
  GSempnoS    := '';
  GSkornameS  := '';
  GSorgnumS   := '';
  GSdeptnameS := '';
  Edit.PopupForm.ClosePopup(False);

end;

procedure TEmpForm.E_condKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    E_condButtonClick(Sender, 0);
end;

end.
 