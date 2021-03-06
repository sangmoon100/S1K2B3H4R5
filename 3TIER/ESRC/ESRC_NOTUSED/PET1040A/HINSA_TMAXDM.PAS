unit Hinsa_TmaxDM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Tmax_session, Tmax_DmlSet, Db, Tmax_DataSetText, OnRegistry,
  OnInsaCommon, TmaxFunc;

type
  TDataModule_Tmax = class(TDataModule)
    TMaxSession: TTMaxSession;
    TMaxDML_HInsa: TTMaxDML;
    TMaxDataSet_HInsa: TTMaxDataSet;
    TMaxDataSet_HInsa2: TTMaxDataSet;
    TMaxDataSet_HInsa_DML: TTMaxDataSet;
    TMaxDataSet_HInsa3: TTMaxDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
    Csel_SQL : String;
    Csel_ret : Boolean;
    Cupd_SQL : String;
    Cupd_ret : Boolean;
    function Connect_Session: String;
    function Get_Today: String;
    procedure Cupd_Exec;
    procedure Csel_Open;
    function Csel_gfd(p_loc: Integer): String;
    procedure Csel_Open2;
    function Csel_gfd2(p_loc: Integer): String;
    procedure Csel_Open3;
    function Csel_gfd3(p_loc: Integer): String;
    function Tfunc_GetTime: String;
  end;

var
  DataModule_Tmax: TDataModule_Tmax;

implementation

{$R *.DFM}

function TDataModule_Tmax.Connect_Session: String;
begin
  TMaxSession.EnvFileName := GetHomeDir+'\newhana.env';
  TMaxSession.LabelName   := 'HANAROHPER';
  TMaxSession.Connect  := False;
  TMaxSession.Host     := Hinsa_Param(cmdline,10);
  TMaxSession.Port     := '9999';

  try
       TMaxSession.Connect := True;
  except
       Application.MessageBox(PChar('APP서버 접속 실패'),'에러',mb_ok);
       Application.Terminate;
       Exit;
  end;

  //2013.11. Add 파라미터와 비교하여 암호 다르면 접속 막음.
  FM_Tmax           := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := TMaxSession;
  if FM_Tmax.PassWordChk(Hinsa_Param(cmdline,1), Hinsa_Param(cmdline,3)) = 0 then
    Application.Terminate;
end;

function TDataModule_Tmax.Get_Today: String;
begin
  Result := '';
  with TMaxDataSet_HInsa do
  begin
    Close;
    ServiceName := 'hinsa_today';
    ClearFieldInfo;
    ClearParamInfo;
    AddField('TODAY', ftString, 16);
    Open;
    if not Eof then Result := FieldByName('TODAY').AsString;
  end;
end;

procedure TDataModule_Tmax.Cupd_Exec;
begin
  Cupd_ret := False;
  with TMaxDataSet_HInsa_DML do
  begin
    ServiceName := 'PET1010A_dml';
    ClearFieldInfo;
    ClearParamInfo;
    SQL.Text := Cupd_SQL;
    if Execute then Cupd_ret := True;
  end;
end;

procedure TDataModule_Tmax.Csel_Open;
begin
  Csel_ret := False;
  with TMaxDataSet_HInsa do
  begin
    Close;
    ServiceName := 'SHR0SSEL';
    ClearFieldInfo;
    AddField('SEL_DATA', ftString, 5000);
    ClearParamInfo;
    SQL.Text := Csel_SQL;
    Open;
    if RecordCount > 0 then Csel_ret := True;
//    Close;
  end;
end;

function TDataModule_Tmax.Csel_gfd(p_loc: Integer): String;
var
  v_cnt, v_tmp: Integer;
  v_data: String;
begin
  Result := '';
  v_data := TMaxDataSet_HInsa.FieldByName('SEL_DATA').AsString;
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

procedure TDataModule_Tmax.Csel_Open2;
begin
  Csel_ret := False;
  with TMaxDataSet_HInsa2 do
  begin
    Close;
    ServiceName := 'SHR0SSEL';
    ClearFieldInfo;
    AddField('SEL_DATA', ftString, 5000);
    ClearParamInfo;
    SQL.Text := Csel_SQL;
    Open;
    if RecordCount > 0 then Csel_ret := True;
//    Close;
  end;
end;

function TDataModule_Tmax.Csel_gfd2(p_loc: Integer): String;
var
  v_cnt, v_tmp: Integer;
  v_data: String;
begin
  Result := '';
  v_data := TMaxDataSet_HInsa2.FieldByName('SEL_DATA').AsString;
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

procedure TDataModule_Tmax.Csel_Open3;
begin
  Csel_ret := False;
  with TMaxDataSet_HInsa3 do
  begin
    Close;
    ServiceName := 'SHR0SSEL';
    ClearFieldInfo;
    AddField('SEL_DATA', ftString, 5000);
    ClearParamInfo;
    SQL.Text := Csel_SQL;
    Open;
    if RecordCount > 0 then Csel_ret := True;
//    Close;
  end;
end;

function TDataModule_Tmax.Csel_gfd3(p_loc: Integer): String;
var
  v_cnt, v_tmp: Integer;
  v_data: String;
begin
  Result := '';
  v_data := TMaxDataSet_HInsa3.FieldByName('SEL_DATA').AsString;
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

function TDataModule_Tmax.Tfunc_GetTime: String;
begin
  Result := '';
  with TMaxDataSet_HInsa_DML do
  begin
    Close;
    ServiceName := 'SHR1SSYSDT';
    ClearFieldInfo;
    ClearParamInfo;
    AddField('SYS_DATE_TIME', ftString, 14);
    Open;
    Result := FieldByName('SYS_DATE_TIME').AsString;
    Close;
  end;
end;

end.
