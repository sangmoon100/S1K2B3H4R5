unit Fm_DM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, peextcombo;

type
  TDM = class(TDataModule)
    Database1: TDatabase;
    Query_select: TQuery;
    Query_exec: TQuery;
    Query_temp: TQuery;
  private
    { Private declarations }
  public
    pEmpno: String;    // 로그인 사번
    pKorname: String;  // 로그인 성명
    pClass: String;    // 로그인 등급
    { Public declarations }
  end;

var
  DM: TDM;

implementation



{$R *.DFM}




end.
