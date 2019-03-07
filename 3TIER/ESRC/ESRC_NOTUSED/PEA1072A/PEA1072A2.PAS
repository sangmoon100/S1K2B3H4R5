unit PEA1072A2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  jshape, jeonPan, ExtCtrls, Shdowpnl, Grids, DBGrids, jgrid, StdCtrls,
  Mask, HanEdit, Db, Tmax_DataSetText,OnPopupEdit,
  OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl, OnFocusButton, OnGrDBGrid,
  OnShapeLabel, OnLineLabel, DBAccess, Ora;

type
  TCodeForm = class(TForm)
    DataSource1: TDataSource;
    TDS1: TTMaxDataSet;
    RunGrid: TOnGrDbGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    BT_cancel: TOnFocusButton;
    CodeKind: TLabel;
    Memo1: TMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BT_cancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Edit      : TOnWinPopupEdit;
    CodeNo    : String;
    CodeName  : String;
    BuSeoName : String;
    CodeSql   : String;
  end;

var
   CodeForm : TCodeForm;

implementation

uses PEA1072A1;

{$R *.DFM}

procedure TCodeForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TDS1.Close;
end;


procedure TCodeForm.BT_cancelClick(Sender: TObject);
begin
  CodeNo    := '';
  CodeName  := '';
  BuSeoName := '';
//  Edit.PopupForm.ClosePopup(False);
end;

procedure TCodeForm.FormShow(Sender: TObject);
var SqlText : String;
    i       : integer;
    Field   : TField;
begin
  with TDS1 do
  begin
    ServiceName := 'HINSA_select10';
    Close;
    Sql.Clear;

    SqlText := Format('SELECT A.EMPNO, A.KORNAME, (SELECT CODENAME FROM PYCCODE WHERE CODEID = ''I113'' AND CODENO = A.PAYRA) PAYCLNAME, B.DEPTNAME,'+
                     '       decode(A.E1valconyn, ''Y'',''평가완료'',''미평가'') prog,  '+
                     '       Substr(F.RESULTSCRGRADE,1,1) RESULTSCRGRADE, Substr(F.FINALGRADE,1,1) FINALGRADE, '+
                     '       (Select codename from pyccode where codeid = ''I112'' and codeno = F.paycl)  NOWBAND, '+
                     '       (Select codename from pyccode where codeid = ''I112'' and codeno = F.npaycl) NEXTBAND,'+
                     '       A.E1valconyn '+
                     'FROM  PEHREMAS A, PYCDEPT B, PYCCODE C, PYCCODE D, PYCCODE E, PEHEVHIS F    '+
                     'WHERE  A.RABASDATE= ''%s''                                                  '+
                     '  AND  A.RESTIYN  = ''Y''                                                   '+
                     '  AND  A.DEPTCODE = B.DEPTCODE                                              '+
                     '  AND  A.ORGNUM   = B.ORGNUM                                                '+
                     '  AND  A.PAYCL    = C.CODENO(+) AND C.CODEID(+) = ''I112''                  '+
                     '  AND  A.JOBGUN   = D.CODENO(+) AND D.CODEID(+) = ''I115''                  '+
                     '  AND  A.PAYRA    = E.CODENO(+) AND E.CODEID(+) = ''I113''                  '+
//                     '  AND  exists(select empno from petremas where rabasdate = ''%s'' and empno = ''%s'')'+
                     '  AND  A.EMPNO    = F.EMPNO  '+
                     '  AND  F.RABASYEAR = ''%s'' '
//                     ,[FM_MAIN.vRabasdate,FM_MAIN.vRabasdate, FM_MAIN.AEmpno, Copy(FM_MAIN.vRabasdate,1,4)]);
                     ,[FM_MAIN.vRabasdate, Copy(FM_MAIN.vRabasdate,1,4)]);
    if (FM_MAIN.AEmpno = FM_MAIN.Workemp1) or (FM_MAIN.AEmpno = FM_MAIN.Workemp2) or
       (FM_MAIN.AEmpno = FM_MAIN.Workemp3) or (FM_MAIN.AEmpno = FM_MAIN.Workemp4) or
       (FM_MAIN.AEmpno = FM_MAIN.Workemp5) or (Copy(FM_MAIN.AEmpno,1,1)   = 'D') then
    else
    Begin
        SqlText := SqlText + Format('  AND ((A.E1EMPNO   = ''%s'')  ',[FM_MAIN.AEmpno])+
                             Format('    or (A.E2EMPNO   = ''%s'')) ',[FM_MAIN.AEmpno]);
    End;
    SqlText := SqlText + ' ORDER BY A.DEPTCODE, A.PAYRA, A.EMPNO ';
    Sql.Add(SqlText);

//memo1.text :=    SqlText;
    ClearFieldInfo;
          AddField('EMPNO'         , ftString, 100);
          AddField('KORNAME'       , ftString, 100);
          AddField('PAYCLNAME'     , ftString, 100);
          AddField('DEPTNAME'      , ftString, 100);
          AddField('prog'          , ftString, 100);
          AddField('RESULTSCRGRADE', ftString, 100);
          AddField('FINALGRADE'    , ftString, 100);
          AddField('NOWBAND'       , ftString, 100);
          AddField('NEXTBAND'      , ftString, 100);
          AddField('E1valconyn'    , ftString, 100);
    Open;
  end;
  for i := 0 to TDS1.FieldCount - 1 do
  begin
    Field := TDS1.Fields[i];
    Field.Visible := False;
    case Field.Index of
         0 : begin
                  Field.Visible      := True;
                  Field.DisplayWidth := 8;
                  Field.DisplayLabel := '사 번';
             end;
         1 : begin
                  Field.Visible      := True;
                  Field.DisplayWidth := 12;
                  Field.DisplayLabel := '성 명';
             end;
         2 : begin
                  Field.Visible      := True;
                  Field.DisplayWidth := 10;
                  Field.DisplayLabel := '직 책';
             end;
         3 : begin
                  Field.Visible      := True;
                  Field.DisplayWidth := 32;
                  Field.DisplayLabel := '부 서 명';
             end;
         4: begin
                  Field.Visible      := True;
                  Field.DisplayWidth := 16;
                  Field.DisplayLabel := '진행상황';
             end;
         5: begin
                  Field.Visible      := True;
                  Field.DisplayWidth := 8;
                  Field.DisplayLabel := '업적등급';
             end;
         6: begin
                  Field.Visible      := True;
                  Field.DisplayWidth := 8;
                  Field.DisplayLabel := '종합등급';
             end;
         7: begin
                  Field.Visible      := True;
                  Field.DisplayWidth := 8;
                  Field.DisplayLabel := Copy(FM_MAIN.vRabasdate,1,4) + '년 BAND';
             end;
         8: begin
                  Field.Visible      := True;
                  Field.DisplayWidth := 8;
                  Field.DisplayLabel := intToStr(Strtoint(Copy(FM_MAIN.vRabasdate,1,4)) + 1) + '년 BAND';
             end;
    end;
  end;
end;

end.
