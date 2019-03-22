{  program ID    - TPA1030A3 ( 교육기준 관리/ 수료유형관리 )
   작성자        - 홍성일
   최초 작성일자 - 2000.01.27
   최후 수정일자 - 2000.01.27
}
unit PIC4010A3;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  peoutlookbtn, pegradpanl, Grids, DBGrids, StdCtrls, Buttons,
  ExtCtrls, Mask, pebtnedit, Db, DBCGrids, DBCtrls, PeJeonBtnDateEdit,
  peextcombo, DBTables, pevaluebtnedit, PeJeonLabel, pecodebtnedit;

type
  TFm_PIC4010A3 = class(TForm)
    PeJeonGrdPanel1: TPeJeonGrdPanel;
    Bevel1: TBevel;
    DBGrid_master: TDBGrid;
    Bevel2: TBevel;
    DataSource_Grid: TDataSource;
    Query_Grid: TQuery;
    EC_rabasdate: TPeJeonPanelComboBox;
    p2_Bt_Query: TPeJeonOutLookBtn;
    Bt_Add: TPeJeonOutLookBtn;
    Bt_Save: TPeJeonOutLookBtn;
    Bt_Del: TPeJeonOutLookBtn;
    PeJeonOutLookBtn1: TPeJeonOutLookBtn;
    E_duscore: TPePanelEdit;
    Panel13: TPanel;
    E_Dummfr: TPePanelEdit;
    E_Dummto: TPePanelEdit;
    Panel5: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    Bevel3: TBevel;
    Query_GridRABASDATE: TStringField;
    Query_GridPAYCL: TStringField;
    Query_GridPAYCL_NM: TStringField;
    Query_GridDUMMFR: TFloatField;
    Query_GridFILLER1: TStringField;
    Query_GridDUMMTO: TFloatField;
    Query_GridDUSCORE: TFloatField;
    EC_paycl: TPeCodeEdit;
    EC_paycl_nm: TPeJeonLabel;
// 임의 생성 procedure 임의 생성 procedure는 모두 'proc_'로 시작함.
//  DB Grid에 내용을 보여줌.
    procedure proc_DBGrid_show;
//  insert routine
    procedure proc_insert;
//  update routine
    procedure proc_update;
//
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Bt_master_addClick(Sender: TObject);
    procedure EC_rabasdateChange(Sender: TObject);
    procedure p2_Bt_QueryClick(Sender: TObject);
    procedure Bt_AddClick(Sender: TObject);
    procedure Bt_SaveClick(Sender: TObject);
    procedure Bt_DelClick(Sender: TObject);
    procedure PeJeonOutLookBtn1Click(Sender: TObject);
    procedure DataSource_GridDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
    bAddMode : Boolean;
  public
    { Public declarations }
  end;

var
  Fm_PIC4010A3: TFm_PIC4010A3;

implementation

uses PIC4010A1, Fm_DM, PIC4010A3_1, Codelib;

var
// 임시변수들은 모두 'm_ '로 시작함.
// save, add, delete이후 작업한 위치로 돌려놓기 위해 임시변수 사용함.
  m_pointcode   : String;   // master locate
  m_frvalue     : String;  // detail locate
{$R *.DFM}

procedure TFm_PIC4010A3.proc_DBGrid_show;
begin
// DB Grid의 내용을 보여줌
// 추후 저장, 추가, 삭제 작업이후 한번씩 실행함.
  with Query_Grid do
  begin
       close;
       sql.clear;
       sql.add(' select a.RABASDATE                                           ');
       sql.add('       ,a.PAYCL                                               ');
       sql.add('       ,b.codename                     paycl_nm               ');
       sql.add('       ,a.DUMMFR                                              ');
       sql.add('       ,''~''                          filler1                ');
       sql.add('       ,a.DUMMTO                                              ');
       sql.add('       ,a.DUSCORE                                             ');
       sql.add(' from   pimraduscr a, pyccode b                               ');
       sql.add(' where  a.rabasdate = :rabasdate                              ');
       sql.add('   and  b.codeid(+) = ''I112''                                ');
       sql.add('   and  b.codeno(+) = a.paycl                                 ');
//
       ParamByName('rabasdate').AsString := EC_rabasdate.Text;
//
       open;
  end;
{
  EC_paycl.Text     := '';
  EC_paycl_nm.textcaption  := '';
  E_Dummfr.Text     := '';
  E_Dummto.Text     := '';
  E_duscore.Text    := '';
//
}
//  DBGrid_master.SetFocus;
end;

procedure TFm_PIC4010A3.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFm_PIC4010A3.FormCreate(Sender: TObject);
begin
// 승격 기준일을 승격기준일 콤보박스에 넣음.
  with DM.Query_select do
  begin
       close;
       sql.clear;
       sql.add(' select distinct rabasdate                                    ');
       sql.add(' from   pimraduscr                                            ');
       sql.add(' order by rabasdate desc                                      ');
       open;
       EC_rabasdate.Items.Clear;
       While Not Eof do
       begin
             EC_rabasdate.Items.Add ( FieldByName('rabasdate').AsString );
             Next;
       end;
// 단 화면에 표시하는 일자는 최근일자임.
       EC_rabasdate.ItemIndex := 0;
  end;

// DB Grid의 내용을 보여줌
  proc_DBGrid_show;
end;

procedure TFm_PIC4010A3.Bt_master_addClick(Sender: TObject);
begin
  PIC4010A1.Fm_PIC4010A1.St_Help.Panels[0].Text := ' 수정화면 입니다....';

end;



procedure TFm_PIC4010A3.EC_rabasdateChange(Sender: TObject);
begin
// 승격기준일이 변할경우 DB Grid를 refresh함.
  proc_DBGrid_show;
end;

procedure TFm_PIC4010A3.p2_Bt_QueryClick(Sender: TObject);
begin
// 승격기준일이 변할경우 DB Grid를 refresh함.
  proc_DBGrid_show;
end;

procedure TFm_PIC4010A3.Bt_AddClick(Sender: TObject);
begin
// 추가할 항목을 clear함.
  EC_paycl.Enabled  := True;
  E_Dummfr.Enabled  := True;
//
  EC_paycl.Text     := '';
  EC_paycl_nm.textcaption  := '';
  E_Dummfr.Text     := '';
  E_Dummto.Text     := '';
  E_duscore.Text    := '';
//
  EC_paycl.SetFocus;
end;

procedure TFm_PIC4010A3.Bt_SaveClick(Sender: TObject);
begin
// 키값이 공백이거나 조건에 맞지않는지 체크.
  if  Trim( EC_rabasdate.Text ) = '' then
  begin
     Application.MessageBox(' 승격기준일 란이 공백입니다.'            ,'확인',MB_OK+MB_ICONQUESTION);
     EC_rabasdate.SetFocus;
     exit;
  end;
  if  Trim(EC_paycl.Text) = '' then
  begin
     Application.MessageBox(' 직급 란이 공백입니다.'                  ,'확인',MB_OK+MB_ICONQUESTION);
     EC_paycl.SetFocus;
     exit;
  end;
  if  Trim(E_Dummfr.Text) = '' then
  begin
     Application.MessageBox(' 시작 재급월수 란이 공백입니다.'         ,'확인',MB_OK+MB_ICONQUESTION);
     E_Dummfr.SetFocus;
     exit;
  end;
  if  Trim(E_Dummto.Text) = '' then
  begin
     Application.MessageBox(' 종료 재급월수 란이 공백입니다.'         ,'확인',MB_OK+MB_ICONQUESTION);
     E_Dummto.SetFocus;
     exit;
  end;
  if  strtointdef(E_Dummfr.Text,0) > strtointdef(E_Dummto.Text,0) then
  begin
     Application.MessageBox(' 재급월수 입력 오류입니다.'         ,'확인',MB_OK+MB_ICONQUESTION);
     E_Dummfr.SetFocus;
     exit;
  end;

// 값범위 체크
  if Trim(E_duscore.Text) = '' then
  begin
     Application.MessageBox(' 재급점수 범위는 0.00 ~ 100.00 입니다. ' ,'확인',MB_OK+MB_ICONQUESTION);
     E_duscore.SetFocus;
     exit;
  end;
  if ( StrToFloat(E_duscore.Text) < 0 ) or (StrToFloat(E_duscore.Text) > 100 ) then
  begin
     Application.MessageBox(' 재급점수 범위는 0.00 ~ 100.00 입니다. ' ,'확인',MB_OK+MB_ICONQUESTION);
     E_duscore.SetFocus;
     exit;
  end;


// 해당하는 키 값으로 한번 read함.
// 존재하는 경우 update/ 그렇지 않을경우 insert함.
  with DM.Query_select do
  begin
       close;
       sql.clear;
       sql.add(' select rabasdate                                             ');
       sql.add(' from   pimraduscr                                            ');
       sql.add(' where  rabasdate = :rabasdate                                ');
       sql.add('   and  paycl     = :paycl                                    ');
       sql.add('   and  dummfr    = :dummfr                                   ');
//
       ParamByName('rabasdate').AsString := EC_rabasdate.Text;
       ParamByName('paycl').AsString     := EC_paycl.Text;
       ParamByName('dummfr').AsString    := E_Dummfr.Text;
//
       open;
       if Eof then
          proc_insert
       else
          proc_update;
  end;

// DB Grid의 내용 refresh
  proc_DBGrid_show;

end;


procedure TFm_PIC4010A3.proc_insert;
begin
// insert!
  with DM.Query_exec do
  begin
       close;
       sql.clear;
       sql.add(' insert into pimraduscr                                                    ');
       sql.add(' ( rabasdate, paycl, dummfr, dummto, duscore, writeemp, writetime )        ');
       sql.add(' values                                                                    ');
       sql.add(' ( :rabasdate, :paycl, :dummfr, :dummto, :duscore, :writeemp, :writetime ) ');
//
       ParamByName('rabasdate').AsString := EC_rabasdate.Text;
       ParamByName('paycl').AsString     := EC_paycl.Text;
       ParamByName('dummfr').AsInteger   := StrToInt  ( E_dummfr.Text );
       ParamByName('dummto').AsInteger   := StrToInt  ( E_dummto.Text );
       ParamByName('duscore').AsFloat    := StrToFloat( E_duscore.Text );
       ParamByname('writeemp').AsString  := Fm_PIC4010A1.pEmpno;
       ParamByname('writetime').AsString := Fm_PIC4010A1.pe_Date.SaveDate;
//
  end;
  DM.Database1.StartTransaction;
  try
     DM.Query_exec.ExecSQL;
  except
     DM.Database1.Rollback;
     Messagebox(0, '승격기준 배점 항목을 등록하는데 실패하였습니다...', '알림', MB_OK or $0020);
     Exit;
  end;
  DM.Database1.Commit;
  Fm_PIC4010A1.St_Help.Panels[0].Text := '승격기준 배점 항목을 등록하였습니다...';
end;



procedure TFm_PIC4010A3.proc_update;
begin
  with DM.Query_exec do
  begin
       close;
       sql.clear;
       sql.add(' update pimraduscr                                           ');
       sql.add('    set dummto    = :dummto                                  ');
       sql.add('       ,duscore   = :duscore                                 ');
       sql.add('       ,writeemp  = :writeemp                                ');
       sql.add('       ,writetime = :writetime                               ');
       sql.add(' where  rabasdate = :rabasdate                               ');
       sql.add('   and  paycl     = :paycl                                   ');
       sql.add('   and  dummfr    = :dummfr                                  ');
//
       ParamByName('rabasdate').AsString := EC_rabasdate.Text;
       ParamByName('paycl').AsString     := EC_paycl.Text;
       ParamByName('dummfr').AsInteger   := StrToInt  ( E_dummfr.Text );
       ParamByName('dummto').AsInteger   := StrToInt  ( E_dummto.Text );
       ParamByName('duscore').AsFloat    := StrToFloat( E_duscore.Text );
       ParamByname('writeemp').AsString  := Fm_PIC4010A1.pEmpno;
       ParamByname('writetime').AsString := Fm_PIC4010A1.pe_Date.SaveDate;
//
  end;
  DM.Database1.StartTransaction;
  try
     DM.Query_exec.ExecSQL;
  except
     DM.Database1.Rollback;
     Messagebox(0, '승격기준 배점 항목을 수정하는데 실패하였습니다...', '알림', MB_OK or $0020);
     Exit;
  end;
  DM.Database1.Commit;
  Fm_PIC4010A1.St_Help.Panels[0].Text := '승격기준 배점 항목을 수정하였습니다...';

end;



procedure TFm_PIC4010A3.Bt_DelClick(Sender: TObject);
begin
// delete !
  if MessageDlg(' 정말 삭제하시겠습니까?', mtInformation, [mbYes, mbNo], 0) = mrNo then Exit;
  Fm_PIC4010A1.St_Help.Panels[0].Text := '해당 자료를 삭제하고 있습니다.';
//
  with DM.Query_exec do
  begin
       close;
       sql.clear;
       sql.add(' delete pimraduscr                                           ');
       sql.add(' where  rabasdate = :rabasdate                               ');
       sql.add('   and  paycl     = :paycl                                   ');
       sql.add('   and  dummfr    = :dummfr                                  ');
//
       ParamByName('rabasdate').AsString := EC_rabasdate.Text;
       ParamByName('paycl').AsString     := EC_paycl.Text;
       ParamByName('dummfr').AsInteger   := StrToInt( E_dummfr.Text );
//
  end;
  DM.Database1.StartTransaction;
  try
     DM.Query_exec.ExecSQL;
  except
     DM.Database1.Rollback;
     Messagebox(0, '승격기준 배점 항목을 삭제하는데 실패하였습니다...', '알림', MB_OK or $0020);
     Exit;
  end;
  DM.Database1.Commit;
  Fm_PIC4010A1.St_Help.Panels[0].Text := '승격기준 배점 항목을 삭제하였습니다...';
// DB Grid의 내용 refresh
  proc_DBGrid_show;
//  
  EC_paycl.Text     := '';
  EC_paycl_nm.textcaption  := '';
  E_Dummfr.Text     := '';
  E_Dummto.Text     := '';
  E_duscore.Text    := '';


end;

procedure TFm_PIC4010A3.PeJeonOutLookBtn1Click(Sender: TObject);
begin
  Application.CreateForm(TFm_PIC4010A3_1, Fm_PIC4010A3_1 );
  Fm_PIC4010A3_1.EC_rabasdate.text  := EC_rabasdate.Text;
  try
    Fm_PIC4010A3_1.ShowModal;
  finally
    Fm_PIC4010A3_1.Free;
  end;
// 승격기준일 refresh
  FormCreate(Sender);

end;

procedure TFm_PIC4010A3.DataSource_GridDataChange(Sender: TObject;
  Field: TField);
begin
// 각 항목에 데이터 값을 넘긴다.
  EC_paycl.Text    := Query_Grid.FieldByName('paycl').AsString;
  EC_paycl_nm.textcaption := Query_Grid.FieldByName('paycl_nm').AsString;
  E_Dummfr.Text    := IntToStr  ( Query_Grid.FieldByName('dummfr').AsInteger );
  E_Dummto.Text    := IntToStr  ( Query_Grid.FieldByName('dummto').AsInteger );
  E_duscore.Text   := FloatToStr( Query_Grid.FieldByName('duscore').AsFloat  );
//
  EC_paycl.Enabled := False;
  E_Dummfr.Enabled := False;
end;

end.
