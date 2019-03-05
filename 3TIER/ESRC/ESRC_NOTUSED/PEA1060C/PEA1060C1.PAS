unit pea1060c1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  pegradpanl, ExtCtrls, StdCtrls, Mask, pebtnedit, PeJeonLabel, DbTables, Db,
  peoutlookbtn, peNumedit, pedbutil, PeJeonMemo, Inifiles, kpaylib, Buttons,
  OnSkinBtn, OnEditBaseCtrl, OnEditStdCtrl, OnEditNumCtl, Grids, DBGrids,
  Tmax_DataSetText;

type
  TFm_sub_Form1 = class(TForm)
    PeJeonOutLookBtn3: TPeJeonOutLookBtn;
    Pa_Title: TPeJeonGrdPanel;
    DBSet1: TTMaxDataSet;
    sGrid1: TStringGrid;
    procedure PeJeonOutLookBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    l_rabasdtate, l_deptcode, l_taskcode : string;
    procedure Rscore;
    function  Csel_gfd(p_loc: Integer): String;

  public
    { Public declarations }
    Lempno     : string;
    Lpaycl     : string;
    Lpayra     : string;


  end;

var
  Fm_sub_Form1: TFm_sub_Form1;

implementation
{$R *.DFM}
 uses Hinsa_TmaxDM, peDm;//, pea1060b1;

procedure TFm_sub_Form1.PeJeonOutLookBtn3Click(Sender: TObject);
begin
   close;
end;

procedure TFm_sub_Form1.FormShow(Sender: TObject);
begin
   sGrid1.Cells[1,0] :=  '직무명';
   sGrid1.Cells[2,0] :=  '직종명';
   sGrid1.Cells[3,0] :=  '직무내역';
   sGrid1.Cells[4,0] :=  '비중';
   Rscore;
end;

procedure TFm_sub_Form1.Rscore;
var
  SqlText       : string;
  i : integer;
begin
{  SqlText := ' SELECT NVL(C.DUTYNAME,'''')||'';''||NVL(B.DUTYKINDNAME,'''')||'';''||NVL(D.dutytermrate,'''')  '+
               ' FROM PISHRCURR A, PISHRDUKIND B, PISHRDUTY C, PISHRMAS D '+
              ' WHERE A.EMPNO = ''' + Lempno   + ''' '+
                ' AND A.JOBFIELD = B.JOBFIELD '+
                ' AND A.DUTYKIND = B.DUTYKIND '+
                ' AND A.JOBFIELD = C.JOBFIELD '+
                ' AND A.DUTYKIND = C.DUTYKIND '+
                ' AND A.DUTY     = C.DUTY '+
                ' AND A.EMPNO    = D.EMPNO '+
                ' AND A.JOBFIELD = D.JOBFIELD '+
                ' AND A.DUTYKIND = D.DUTYKIND '+
                ' AND A.DUTY     = D.DUTY '+
                ' AND B.USEYN = ''Y'' '+
                ' AND C.USEYN = ''Y'' ';
 }
   SqlText := ' SELECT NVL(B.DUTYNAME,'''')||'';''||NVL(C.DUTYKINDNAME,'''')||'';''||NVL(A.DUTYTEXT,'''')||'';''||NVL(A.dutytermrate,'''')  '+
              ' FROM PISHRMAS A, PISHRDUTY B,PISHRDUKIND C '+
              ' WHERE A.EMPNO = ''' + Lempno   + ''' '+
              ' AND A.TODUTYDATE IS NULL '+
              ' AND A.JOBFIELD = B.JOBFIELD '+
              ' AND A.DUTYKIND = B.DUTYKIND '+
              ' AND A.DUTY     = B.DUTY '+
              ' AND A.JOBFIELD = C.JOBFIELD '+
              ' AND A.DUTYKIND = C.DUTYKIND '+
              ' AND B.USEYN = ''Y'' '+
              ' AND C.USEYN = ''Y'' ';

  with DBSet1 do
  begin
    Close;
    ServiceName := 'PEA1060A_common';
    ClearFieldInfo;
    AddField('SEL_DATA', ftString, 300);
    ClearParamInfo;
    SQL.Text := SqlText;
    Open;

    if RecordCount > 0 then
    begin
       sGrid1.RowCount := RecordCount +1;
       for i := 1 to RecordCount do
       begin
          sGrid1.Cells[1,i] :=  Csel_gfd(1);  //직무명
          sGrid1.Cells[2,i] :=  Csel_gfd(2);  //직종명
          sGrid1.Cells[3,i] :=  Csel_gfd(3);  //비중
          sGrid1.Cells[4,i] :=  Csel_gfd(4);  //비중
          //SELECT C.DUTYNAME 직무명, B.DUTYKINDNAME 직종명,  D.dutytermrate 비중
          next;
       end;
    end;
    close;
  end;
end;

function TFm_sub_Form1.Csel_gfd(p_loc: Integer): String;
var
  v_cnt, v_tmp: Integer;
  v_data: String;
begin
  Result := '';
  v_data := DBSet1.FieldByName('SEL_DATA').AsString;
  v_cnt := 1;
  while v_cnt < p_loc do
  begin
    v_tmp := Pos(';',v_data);
    if not(v_tmp > 0) then Exit;
    v_cnt := v_cnt + 1;
    Delete(v_data, 1, v_tmp);
  end;
  v_tmp := Pos(';',v_data) - 1;
  if v_tmp < 0 then v_tmp := Length(v_data);
  Result := Copy(v_data,1,v_tmp);
end;

end.
