unit PIC4010A4;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  peoutlookbtn, ExtCtrls, pegradpanl, DBCGrids, StdCtrls, Mask, pebtnedit,
  peextcombo, DBCtrls, Db, DBTables, Buttons, pecodebtnedit, PeJeonLabel;

type
  TFm_PIC4010A4 = class(TForm)
    PeJeonGrdPanel1: TPeJeonGrdPanel;
    Bt_Add: TPeJeonOutLookBtn;
    Bt_Save: TPeJeonOutLookBtn;
    Bt_Del: TPeJeonOutLookBtn;
    BT_batch: TPeJeonOutLookBtn;
    EC_rabasdate: TPeJeonPanelComboBox;
    EC_ragroup: TPeJeonPanelComboBox;
    Panel5: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel16: TPanel;
    Panel17: TPanel;
    DBCtrlGrid: TDBCtrlGrid;
    Bevel1: TBevel;
    Bt_Query: TPeJeonOutLookBtn;
    Panel18: TPanel;
    Panel33: TPanel;
    Panel34: TPanel;
    Panel35: TPanel;
    Panel36: TPanel;
    Panel37: TPanel;
    Panel38: TPanel;
    Panel39: TPanel;
    Panel40: TPanel;
    Panel41: TPanel;
    Panel42: TPanel;
    Panel43: TPanel;
    Panel44: TPanel;
    E_rarate1: TPePanelEdit;
    E_rarate2: TPePanelEdit;
    E_rarate3: TPePanelEdit;
    E_myrarate1: TPePanelEdit;
    E_myrarate2: TPePanelEdit;
    E_rarate4: TPePanelEdit;
    E_rarate5: TPePanelEdit;
    E_myrarate3: TPePanelEdit;
    E_myrarate4: TPePanelEdit;
    E_myrarate5: TPePanelEdit;
    Query_Grid: TQuery;
    DataSource_Grid: TDataSource;
    Bevel2: TBevel;
    E_rajobgun_nm: TPePanelEdit;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    DBText6: TDBText;
    DBText7: TDBText;
    DBText8: TDBText;
    DBText9: TDBText;
    DBText10: TDBText;
    DBText11: TDBText;
    DBText12: TDBText;
    DBText13: TDBText;
    DBText14: TDBText;
    Query_GridRAPAYCL: TStringField;
    Query_GridPAYCL_NM: TStringField;
    Query_GridRAJOBGUN: TStringField;
    Query_GridJOBGUN_NM: TStringField;
    Query_GridEVJOBGUN: TStringField;
    Query_GridEVJOBGUNNM: TStringField;
    Query_GridRARATE1: TFloatField;
    Query_GridRARATE2: TFloatField;
    Query_GridRARATE3: TFloatField;
    Query_GridRARATE4: TFloatField;
    Query_GridRARATE5: TFloatField;
    Query_GridMYRARATE1: TFloatField;
    Query_GridMYRARATE2: TFloatField;
    Query_GridMYRARATE3: TFloatField;
    Query_GridMYRARATE4: TFloatField;
    Query_GridMYRARATE5: TFloatField;
    E_rajobgun: TPeCodeEdit;
    E_paycl: TPeCodeEdit;
    E_jobgun: TPeCodeEdit;
    E_paycl_nm: TPeJeonLabel;
    E_jobgun_nm: TPeJeonLabel;
    Panel19: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    DBText15: TDBText;
    Panel20: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    PPC_evrateyn: TPeJeonPanelComboBox;
    Query_GridEVRATEYN: TStringField;
// 임의지정 프로시져 시작
    procedure proc_insert;
    procedure proc_update;
    procedure proc_float_0;
    procedure FormCreate(Sender: TObject);
    procedure Bt_QueryClick(Sender: TObject);
    procedure DataSource_GridDataChange(Sender: TObject; Field: TField);
    procedure Bt_AddClick(Sender: TObject);
    procedure Bt_SaveClick(Sender: TObject);
    procedure Bt_DelClick(Sender: TObject);
    procedure BT_batchClick(Sender: TObject);
    procedure EC_rabasdateChange(Sender: TObject);
    procedure EC_ragroupChange(Sender: TObject);
    procedure E_payclExit(Sender: TObject);
    procedure E_jobgunExit(Sender: TObject);
    procedure E_rajobgunExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fm_PIC4010A4: TFm_PIC4010A4;

implementation

uses PIC4010A4_1, Codelib, Fm_DM, PIC4010A1;

{$R *.DFM}

procedure TFm_PIC4010A4.proc_float_0;
begin
// db insert/update 시 해당필드가 '' 일경우 0으로 변경.
  if E_rarate1.Text   = '' then  E_rarate1.Text := '0';
  if E_rarate2.Text   = '' then  E_rarate2.Text := '0';
  if E_rarate3.Text   = '' then  E_rarate3.Text := '0';
  if E_rarate4.Text   = '' then  E_rarate4.Text := '0';
  if E_rarate5.Text   = '' then  E_rarate5.Text := '0';
//
  if E_myrarate1.Text = '' then  E_myrarate1.Text := '0';
  if E_myrarate2.Text = '' then  E_myrarate2.Text := '0';
  if E_myrarate3.Text = '' then  E_myrarate3.Text := '0';
  if E_myrarate4.Text = '' then  E_myrarate4.Text := '0';
  if E_myrarate5.Text = '' then  E_myrarate5.Text := '0';

end;

procedure TFm_PIC4010A4.proc_insert;
begin
  with DM.Query_exec do
  begin
       close;
       sql.clear;
       sql.add(' insert into pimragroup                                                                                                                                                                                   ');
       sql.add(' (  RABASDATE,  RAGROUP,     RAPAYCL,    RAJOBGUN,   ');
       sql.add('    EVJOBGUN,   EVJOBGUNNM,  EVRATEYN,               ');
       sql.add('    RARATE1,    RARATE2,     RARATE3,    RARATE4 ,    RARATE5,   ');
       sql.add('    MYRARATE1,  MYRARATE2,   MYRARATE3,  MYRARATE4 ,  MYRARATE5,  ');
       sql.add('    WRITEEMP,   WRITETIME ) ');
       sql.add(' values                                                                                                                                                                                                   ');
       sql.add(' ( :RABASDATE, :RAGROUP,    :PAYCL,     :JOBGUN,  ');
       sql.add('   :RAJOBGUN,  :RAJOBGUNNM, :EVRATEYN,            ');
       sql.add('   :RARATE1,   :RARATE2,    :RARATE3,   :RARATE4 ,   :RARATE5,  ');
       sql.add('   :MYRARATE1, :MYRARATE2,  :MYRARATE3, :MYRARATE4 , :MYRARATE5, ');
       sql.add('   :WRITEEMP,  :WRITETIME ) ');
//
       ParamByName('RABASDATE').AsString   := EC_rabasdate.Text;
       ParamByName('RAGROUP').AsString     := EC_ragroup.Text;
       ParamByName('PAYCL').AsString       := E_paycl.Text;
       ParamByName('JOBGUN').AsString      := E_jobgun.Text;
       ParamByName('RAJOBGUN').AsString    := E_rajobgun.Text;
       ParamByName('RAJOBGUNNM').AsString  := E_rajobgun_nm.Text;
       ParamByName('EVRATEYN').AsString    := PPC_evrateyn.Text;
// '' 값은 0 으로 변경.
       proc_float_0;
//
       ParamByName('RARATE1').AsFloat      := StrToFloat( E_rarate1.Text );
       ParamByName('RARATE2').AsFloat      := StrToFloat( E_rarate2.Text );
       ParamByName('RARATE3').AsFloat      := StrToFloat( E_rarate3.Text );
       ParamByName('RARATE4').AsFloat      := StrToFloat( E_rarate4.Text );
       ParamByName('RARATE5').AsFloat      := StrToFloat( E_rarate5.Text );
       ParamByName('MYRARATE1').AsFloat    := StrToFloat( E_rarate1.Text );
       ParamByName('MYRARATE2').AsFloat    := StrToFloat( E_rarate2.Text );
       ParamByName('MYRARATE3').AsFloat    := StrToFloat( E_rarate3.Text );
       ParamByName('MYRARATE4').AsFloat    := StrToFloat( E_rarate4.Text );
       ParamByName('MYRARATE5').AsFloat    := StrToFloat( E_rarate5.Text );
       ParamByname('writeemp').AsString    := Fm_PIC4010A1.pEmpno;
       ParamByname('writetime').AsString   := Fm_PIC4010A1.pe_Date.SaveDate;
  end;
  DM.Database1.StartTransaction;
  try
     DM.Query_exec.ExecSQL;
  except
     DM.Database1.Rollback;
     Messagebox(0, '승격기준 항목을 등록하는데 실패하였습니다...', '알림', MB_OK or $0020);
     Exit;
  end;
  DM.Database1.Commit;
  Fm_PIC4010A1.St_Help.Panels[0].Text := '승격기준 항목을 등록하였습니다...';
//
end;

procedure TFm_PIC4010A4.proc_update;
begin
//
  with DM.Query_exec do
  begin
       close;
       sql.clear;
       sql.add(' update pimragroup                                            ');
       sql.add('    set EVJOBGUN   = :RAJOBGUN                                ');
       sql.add('       ,EVJOBGUNNM = :RAJOBGUNNM                              ');
       sql.add('       ,EVRATEYN   = :EVRATEYN                                ');
       sql.add('       ,RARATE1    = :RARATE1                                 ');
       sql.add('       ,RARATE2    = :RARATE2                                 ');
       sql.add('       ,RARATE3    = :RARATE3                                 ');
       sql.add('       ,RARATE4    = :RARATE4                                 ');
       sql.add('       ,RARATE5    = :RARATE5                                 ');
       sql.add('       ,MYRARATE1  = :MYRARATE1                               ');
       sql.add('       ,MYRARATE2  = :MYRARATE2                               ');
       sql.add('       ,MYRARATE3  = :MYRARATE3                               ');
       sql.add('       ,MYRARATE4  = :MYRARATE4                               ');
       sql.add('       ,MYRARATE5  = :MYRARATE5                               ');
       sql.add('       ,WRITEEMP   = :WRITEEMP                                ');
       sql.add('       ,WRITETIME  = :WRITETIME                               ');
       sql.add(' where rabasdate   = :rabasdate                               ');
       sql.add('   and ragroup     = :ragroup                                 ');
       sql.add('   and rapaycl     = :paycl                                   ');
       sql.add('   and rajobgun    = :jobgun                                  ');
//
       ParamByName('RABASDATE').AsString   := EC_rabasdate.Text;
       ParamByName('RAGROUP').AsString     := EC_ragroup.Text;
       ParamByName('PAYCL').AsString       := E_paycl.Text;
       ParamByName('JOBGUN').AsString      := E_jobgun.Text;
       ParamByName('RAJOBGUN').AsString    := E_rajobgun.Text;
       ParamByName('RAJOBGUNNM').AsString  := E_rajobgun_nm.Text;
       ParamByName('EVRATEYN').AsString    := PPC_evrateyn.Text;

// '' 값은 0 으로 변경.
       proc_float_0;
//
       ParamByName('RARATE1').AsFloat      := StrToFloat( E_rarate1.Text );
       ParamByName('RARATE2').AsFloat      := StrToFloat( E_rarate2.Text );
       ParamByName('RARATE3').AsFloat      := StrToFloat( E_rarate3.Text );
       ParamByName('RARATE4').AsFloat      := StrToFloat( E_rarate4.Text );
       ParamByName('RARATE5').AsFloat      := StrToFloat( E_rarate5.Text );
       ParamByName('MYRARATE1').AsFloat    := StrToFloat( E_myrarate1.Text );
       ParamByName('MYRARATE2').AsFloat    := StrToFloat( E_myrarate2.Text );
       ParamByName('MYRARATE3').AsFloat    := StrToFloat( E_myrarate3.Text );
       ParamByName('MYRARATE4').AsFloat    := StrToFloat( E_myrarate4.Text );
       ParamByName('MYRARATE5').AsFloat    := StrToFloat( E_myrarate5.Text );
       ParamByname('writeemp').AsString    := Fm_PIC4010A1.pEmpno;
       ParamByname('writetime').AsString   := Fm_PIC4010A1.pe_Date.SaveDate;
  end;
  DM.Database1.StartTransaction;
  try
     DM.Query_exec.ExecSQL;
  except
     DM.Database1.Rollback;
     Messagebox(0, '승격기준 항목을 등록하는데 실패하였습니다...', '알림', MB_OK or $0020);
     Exit;
  end;
  DM.Database1.Commit;
  Fm_PIC4010A1.St_Help.Panels[0].Text := '승격기준 항목을 등록하였습니다...';
//
end;


procedure TFm_PIC4010A4.FormCreate(Sender: TObject);
begin
// 승격기준일콤보박스에 ADD
// 모두다 add한후 표시되는 일지는 승격기준일이 '00000000', 구분, 직급, 직군 모두가 '00'인것을 표시한다.
  with DM.Query_select do
  begin
       close;
       sql.clear;
       sql.clear;
       sql.add(' select distinct rabasdate                                    ');
       sql.add(' from   pimragroup                                            ');
       sql.add(' order by rabasdate desc                                      ');
       EC_rabasdate.Items.Clear;
       open;
       While Not Eof do
       begin
             EC_rabasdate.Items.Add( FieldByName('rabasdate').AsString );
             Next;
       end;

       Ec_rabasdate.ItemIndex := 0;
       EC_rabasdate.Text := Ec_rabasdate.Items[Ec_rabasdate.ItemIndex];
  end;

{
// 단 처음 표시하는 일자및 그에 대한 Grid 자료는 value1 = '000000' , 구분, 직급, 직군 모두가 '00'인것.
  with DM.Query_select do
  begin
       close;
       sql.clear;
       sql.add(' select distinct RABASDATE                                    ');
       sql.add(' from  pimrabas                                               ');
       sql.add(' where rabasdate = ( select value1                            ');
       sql.add('                     from   pimrabas                          ');
       sql.add('                     where  rabasdate = ''00000000''          ');
       sql.add('                       and  paycl     = ''00''                ');
       sql.add('                       and  jobgun    = ''00''                ');
       sql.add('                       and  gubun     = ''00'' )              ');
       open;
       EC_rabasdate.Text := FieldByName('rabasdate').AsString;
  end;
}

// 심사그룹 콤보박스에 Add
// 표시되는 것은 해당 승급일데이터중 가장 작은 심사그룹을 표시함. Ascending sorting
  with DM.Query_select do
  begin
       close;
       sql.clear;
       sql.add(' select distinct ragroup ragroup                              ');
       sql.add(' from   pimragroup                                            ');
       sql.add(' where  rabasdate = :rabasdate                                ');
       sql.add(' order  by                                                    ');
       sql.add('        ragroup                                               ');
//
       ParamByname('rabasdate').AsString := EC_rabasdate.Text;
//
       open;
       EC_ragroup.Items.Clear;
       While Not Eof do
       begin
             EC_ragroup.Items.Add( FieldByname('ragroup').AsString );
             Next;
       end;
  end;
// 가장작은 심사그룹코드를 표시
  with DM.Query_select do
  begin
       close;
       sql.clear;
       sql.add(' select min( ragroup ) ragroup                                ');
       sql.add(' from   pimragroup                                            ');
       sql.add(' where  rabasdate = :rabasdate                                ');
//
       ParamByname('rabasdate').AsString := EC_rabasdate.Text;
//
       open;
       EC_ragroup.Text := FieldByname('ragroup').AsString ;
  end;
// DB Grid를 표시함.
  Bt_QueryClick(Sender);
end;

procedure TFm_PIC4010A4.Bt_QueryClick(Sender: TObject);
begin
// 승격기준일 , 심사그룹에 해당하는 데이터를 DB Grid상에 표시함.
  with Query_Grid do
  begin
       close;
       sql.clear;
       sql.add(' select a.RAPAYCL                                               ');
       sql.add('       ,b.codename paycl_nm                                   ');
       sql.add('       ,a.RAJOBGUN                                              ');
       sql.add('       ,c.codename jobgun_nm                                  ');
       sql.add('       ,a.EVJOBGUN                                            ');
       sql.add('       ,a.EVJOBGUNNM                                          ');
       sql.add('       ,a.evrateyn                                            ');
       sql.add('       ,a.RARATE1                                             ');
       sql.add('       ,a.RARATE2                                             ');
       sql.add('       ,a.RARATE3                                             ');
       sql.add('       ,a.RARATE4                                             ');
       sql.add('       ,a.RARATE5                                             ');
       sql.add('       ,a.MYRARATE1                                           ');
       sql.add('       ,a.MYRARATE2                                           ');
       sql.add('       ,a.MYRARATE3                                           ');
       sql.add('       ,a.MYRARATE4                                           ');
       sql.add('       ,a.MYRARATE5                                           ');
       sql.add(' from  pimragroup a, pyccode b, pyccode c                     ');
       sql.add(' where rabasdate   = :rabasdate                               ');
       sql.add('   and ragroup     = :ragroup                                 ');
//
       sql.add('   and b.codeid(+) = ''I112''                                 ');
       sql.add('   and b.codeno(+) = a.RApaycl                                  ');
//
       sql.add('   and c.codeid(+) = ''I115''                                 ');
       sql.add('   and c.codeno(+) = a.rajobgun                                 ');
//
       ParamByname('rabasdate').AsString := EC_rabasdate.Text;
       ParamByname('ragroup').AsString   := EC_ragroup.Text;
//
       open;
  end;
//  DBCtrlGrid.SetFocus;
end;

procedure TFm_PIC4010A4.DataSource_GridDataChange(Sender: TObject;
  Field: TField);
begin
// DBGrid에서 위치변화가 있는경우 해당 데이터를 아래 입력항목으로 표시함.
  E_paycl.Enabled     := False;
  E_jobgun.Enabled    := False;
//  E_rajobgun.Enabled  := False;
//  SB_rajobgun.Enabled := False;
//
  E_paycl.Text       := Query_Grid.FieldByName('rapaycl').AsString;
  E_paycl_nm.TextCaption := Query_Grid.FieldByName('paycl_nm').AsString;
  E_jobgun.Text      := Query_Grid.FieldByName('rajobgun').AsString;
  E_jobgun_nm.textcaption := Query_Grid.FieldByName('jobgun_nm').AsString;
  E_rajobgun.Text    := Query_Grid.FieldByName('evjobgun').AsString;
  E_rajobgun_nm.Text := Query_Grid.FieldByName('evjobgunnm').AsString;
  PPC_evrateyn.Text  := Query_Grid.FieldByName('evrateyn').AsString;
//
  E_rarate1.Text     := FloatToStr( Query_Grid.FieldByName('rarate1').AsFloat );
  E_rarate2.Text     := FloatToStr( Query_Grid.FieldByName('rarate2').AsFloat );
  E_rarate3.Text     := FloatToStr( Query_Grid.FieldByName('rarate3').AsFloat );
  E_rarate4.Text     := FloatToStr( Query_Grid.FieldByName('rarate4').AsFloat );
  E_rarate5.Text     := FloatToStr( Query_Grid.FieldByName('rarate5').AsFloat );
//
  E_myrarate1.Text   := FloatToStr( Query_Grid.FieldByName('myrarate1').AsFloat );
  E_myrarate2.Text   := FloatToStr( Query_Grid.FieldByName('myrarate2').AsFloat );
  E_myrarate3.Text   := FloatToStr( Query_Grid.FieldByName('myrarate3').AsFloat );
  E_myrarate4.Text   := FloatToStr( Query_Grid.FieldByName('myrarate4').AsFloat );
  E_myrarate5.Text   := FloatToStr( Query_Grid.FieldByName('myrarate5').AsFloat );
end;

procedure TFm_PIC4010A4.Bt_AddClick(Sender: TObject);
begin
// 신규입력을 할경우 입력필드를 모두 clear함.
  E_paycl.Enabled     := True;
  E_jobgun.Enabled    := True;
//  E_rajobgun.Enabled  := True;
//  SB_rajobgun.Enabled := True;

  E_paycl.Text       := '';
  E_paycl_nm.Textcaption  := '';
  E_jobgun.Text      := '';
  E_jobgun_nm.textcaption := '';
  E_rajobgun.Text    := '';
  E_rajobgun_nm.Text := '';
  PPC_evrateyn.Text  := 'N';
//
  E_rarate1.Text     := '';
  E_rarate2.Text     := '';
  E_rarate3.Text     := '';
  E_rarate4.Text     := '';
  E_rarate5.Text     := '';
//
  E_myrarate1.Text   := '';
  E_myrarate2.Text   := '';
  E_myrarate3.Text   := '';
  E_myrarate4.Text   := '';
  E_myrarate5.Text   := '';
//
  E_paycl.SetFocus;

end;

procedure TFm_PIC4010A4.Bt_SaveClick(Sender: TObject);
begin
// 저장시 key 값 체크
  if Trim( E_paycl.Text ) = '' then
  begin
     Application.MessageBox(' 심사직급 란이 공백입니다.' ,'확인',MB_OK+MB_ICONQUESTION);
     exit;
  end;
  if Trim( E_jobgun.Text ) = '' then
  begin
     Application.MessageBox(' 심사직군 란이 공백입니다.' ,'확인',MB_OK+MB_ICONQUESTION);
     exit;
  end;
  if Trim( E_rajobgun.Text ) = '' then
  begin
     Application.MessageBox(' 사정직군 란이 공백입니다.' ,'확인',MB_OK+MB_ICONQUESTION);
     exit;
  end;
  if Trim( E_rajobgun_nm.Text ) = '' then
  begin
     Application.MessageBox(' 사정직군명 란이 공백입니다.' ,'확인',MB_OK+MB_ICONQUESTION);
     exit;
  end;
  if Trim(PPC_evrateyn.Text) = '' then
  begin
     Application.MessageBox(' 사정여부 란이 공백입니다.' ,'확인',MB_OK+MB_ICONQUESTION);
     exit;
  end;

// 수치필드에 '' 인것을 모두 '0' 바꿈.
  proc_float_0;
// 율에범위는 0.00 ~ 9.99임.
  if ( StrToFloat( E_rarate1.Text ) < 0.00)  or ( StrToFloat( E_rarate1.Text ) > 1 ) then
  begin
     Application.MessageBox(' 승격율 의 범위는 0.00 ~ 1 입니다.'       ,'확인',MB_OK+MB_ICONQUESTION);
  end;
  if ( StrToFloat( E_rarate2.Text ) < 0.00)  or ( StrToFloat( E_rarate2.Text ) > 1 ) then
  begin
     Application.MessageBox(' 승격율 의 범위는 0.00 ~ 1 입니다.'       ,'확인',MB_OK+MB_ICONQUESTION);
     System.exit;
  end;
  if ( StrToFloat( E_rarate3.Text ) < 0.00)  or ( StrToFloat( E_rarate3.Text ) > 1 ) then
  begin
     Application.MessageBox(' 승격율 의 범위는 0.00 ~ 1 입니다.'       ,'확인',MB_OK+MB_ICONQUESTION);
     exit;
  end;
  if ( StrToFloat( E_rarate4.Text ) < 0.00)  or ( StrToFloat( E_rarate4.Text ) > 1 ) then
  begin
     Application.MessageBox(' 승격율 의 범위는 0.00 ~ 1 입니다.'       ,'확인',MB_OK+MB_ICONQUESTION);
     exit;
  end;
  if ( StrToFloat( E_rarate5.Text ) < 0.00)  or ( StrToFloat( E_rarate5.Text ) > 1 ) then
  begin
     Application.MessageBox(' 승격율 의 범위는 0.00 ~ 1 입니다.'       ,'확인',MB_OK+MB_ICONQUESTION);
     exit;
  end;
  if ( StrToFloat( E_myrarate1.Text ) < 0.00)  or ( StrToFloat( E_myrarate1.Text ) > 1 ) then
  begin
     Application.MessageBox(' 최소승격년한 승격율 의 범위는 0.00 ~ 1 입니다.'       ,'확인',MB_OK+MB_ICONQUESTION);
     exit;
  end;
  if ( StrToFloat( E_myrarate2.Text ) < 0.00)  or ( StrToFloat( E_myrarate2.Text ) > 1 ) then
  begin
     Application.MessageBox(' 최소승격년한 승격율 의 범위는 0.00 ~ 1 입니다.'       ,'확인',MB_OK+MB_ICONQUESTION);
     exit;
  end;
  if ( StrToFloat( E_myrarate3.Text ) < 0.00)  or ( StrToFloat( E_myrarate3.Text ) > 1 ) then
  begin
     Application.MessageBox(' 최소승격년한 승격율 의 범위는 0.00 ~ 1 입니다.'       ,'확인',MB_OK+MB_ICONQUESTION);
     exit;
  end;
  if ( StrToFloat( E_myrarate4.Text ) < 0.00)  or ( StrToFloat( E_myrarate4.Text ) > 1 ) then
  begin
     Application.MessageBox(' 최소승격년한 승격율 의 범위는 0.00 ~ 1 입니다.'       ,'확인',MB_OK+MB_ICONQUESTION);
     exit;
  end;
  if ( StrToFloat( E_myrarate5.Text ) < 0.00)  or ( StrToFloat( E_myrarate5.Text ) > 1 ) then
  begin
     Application.MessageBox(' 최소승격년한 승격율 의 범위는 0.00 ~ 1 입니다.'       ,'확인',MB_OK+MB_ICONQUESTION);
     exit;
  end;

// 저장시 현재 키값으로 한번 read함.
// 존재할경우 update, 그렇지 않을경우 insert
  with DM.Query_select do
  begin
       close;
       sql.clear;
       sql.add(' select rabasdate                                             ');
       sql.add(' from   pimragroup                                            ');
       sql.add(' where  rabasdate = :rabasdate                                ');
       sql.add('   and  ragroup   = :ragroup                                  ');
       sql.add('   and  rapaycl   = :paycl                                    ');
       sql.add('   and  rajobgun  = :jobgun                                   ');
//
       ParamByName('rabasdate').AsString   := EC_rabasdate.Text;
       ParamByName('ragroup').AsString     := EC_ragroup.Text;
       ParamByName('paycl').AsString       := E_paycl.Text;
       ParamByName('jobgun').AsString      := E_jobgun.Text;
       open;

       if   Eof then proc_insert
       else          proc_update;
  end;

//------------------------------------------------------------------------------
// 승격기준일 및 심사그룹 초기화
// 승격기준일콤보박스에 ADD
// 모두다 add한후 표시되는 일지는 승격기준일이 '00000000', 구분, 직급, 직군 모두가 '00'인것을 표시한다.
  with DM.Query_select do
  begin
       close;
       sql.clear;
       sql.add(' select distinct rabasdate                                    ');
       sql.add(' from   pimragroup                                            ');
       EC_rabasdate.Items.Clear;
       open;
       While Not Eof do
       begin
             EC_rabasdate.Items.Add( FieldByName('rabasdate').AsString );
             Next;
       end;
  end;

// 단 처음 표시하는 일자및 그에 대한 Grid 자료는 value1 = '000000' , 구분, 직급, 직군 모두가 '00'인것.
  with DM.Query_select do
  begin
       close;
       sql.clear;
       sql.add(' select distinct RABASDATE                                    ');
       sql.add(' from  pimrabas                                               ');
       sql.add(' where rabasdate = ( select value1                            ');
       sql.add('                     from   pimrabas                          ');
       sql.add('                     where  rabasdate = ''00000000''          ');
       sql.add('                       and  paycl     = ''00''                ');
       sql.add('                       and  jobgun    = ''00''                ');
       sql.add('                       and  gubun     = ''00'' )              ');
       open;
       EC_rabasdate.Text := FieldByName('rabasdate').AsString;
  end;

// 심사그룹 콤보박스에 Add
// 표시되는 것은 해당 승급일데이터중 가장 작은 심사그룹을 표시함. Ascending sorting
  with DM.Query_select do
  begin
       close;
       sql.clear;
       sql.add(' select distinct ragroup ragroup                              ');
       sql.add(' from   pimragroup                                            ');
       sql.add(' where  rabasdate = :rabasdate                                ');
       sql.add(' order  by                                                    ');
       sql.add('        ragroup                                               ');
       ParamByname('rabasdate').AsString := EC_rabasdate.Text;
       open;

       EC_ragroup.Items.Clear;
       While Not Eof do
       begin
             EC_ragroup.Items.Add( FieldByname('ragroup').AsString );
             Next;
       end;
  end;
// 가장작은 심사그룹코드를 표시
  with DM.Query_select do
  begin
       close;
       sql.clear;
       sql.add(' select min( ragroup ) ragroup                                ');
       sql.add(' from   pimragroup                                            ');
       sql.add(' where  rabasdate = :rabasdate                                ');
       ParamByname('rabasdate').AsString := EC_rabasdate.Text;
       open;
       
       EC_ragroup.Text := FieldByname('ragroup').AsString ;
  end;

  // DB Grid를 표시함.
  Bt_QueryClick(Sender);
end;

procedure TFm_PIC4010A4.Bt_DelClick(Sender: TObject);
begin
// 삭제 key 값 체크
  if Trim( E_paycl.Text ) = '' then
  begin
     Application.MessageBox(' 직급 란이 공백입니다.'       ,'확인',MB_OK+MB_ICONQUESTION);
     exit;
  end;
  if Trim( E_jobgun.Text ) = '' then
  begin
     Application.MessageBox(' 직군 란이 공백입니다.' ,'확인',MB_OK+MB_ICONQUESTION);
     exit;
  end;
  if Trim( E_rajobgun.Text ) = '' then
  begin
     Application.MessageBox(' 심사직군 란이 공백입니다.' ,'확인',MB_OK+MB_ICONQUESTION);
     exit;
  end;
  if Trim( E_rajobgun_nm.Text ) = '' then
  begin
     Application.MessageBox(' 심사직군명 란이 공백입니다.' ,'확인',MB_OK+MB_ICONQUESTION);
     exit;
  end;
  if Trim(PPC_evrateyn.Text) = '' then
  begin
     Application.MessageBox(' 사정여부 란이 공백입니다.' ,'확인',MB_OK+MB_ICONQUESTION);
     exit;
  end;

// 삭제
  with DM.Query_Exec do
  begin
       close;
       sql.clear;
       sql.add(' delete pimragroup                                            ');
       sql.add(' where  rabasdate  = :rabasdate                               ');
       sql.add('   and  ragroup    = :ragroup                                 ');
       sql.add('   and  rapaycl    = :paycl                                   ');
       sql.add('   and  rajobgun   = :jobgun                                  ');
       ParamByName('RABASDATE').AsString   := EC_rabasdate.Text;
       ParamByName('RAGROUP').AsString     := EC_ragroup.Text;
       ParamByName('PAYCL').AsString       := E_paycl.Text;
       ParamByName('JOBGUN').AsString      := E_jobgun.Text;
  end;

  DM.Database1.StartTransaction;
  try
     DM.Query_exec.ExecSQL;
  except
     DM.Database1.Rollback;
     Messagebox(0, '승격기준 항목을 등록하는데 삭제 하였습니다...', '알림', MB_OK or $0020);
     Exit;
  end;
  DM.Database1.Commit;
  Fm_PIC4010A1.St_Help.Panels[0].Text := '승격기준 항목을 삭제하였습니다...';

  // 화면을 clear함.
  Bt_AddClick(Sender);

  // 승격기준일 및 심사그룹 초기화
  FormCreate(Sender);

  // DB Grid refresh
  Bt_QueryClick(Sender);
end;

procedure TFm_PIC4010A4.BT_batchClick(Sender: TObject);
begin
  Application.CreateForm(TFm_PIC4010A4_1, Fm_PIC4010A4_1 );
  Fm_PIC4010A4_1.EC_rabasdate.text := EC_rabasdate.Text;
  Fm_PIC4010A4_1.E_ragroup.text    := EC_ragroup.Text;
  try
    Fm_PIC4010A4_1.ShowModal;
  finally
    Fm_PIC4010A4_1.Free;
  end;

  // 승격기준일 refresh
  FormCreate(Sender);
end;

procedure TFm_PIC4010A4.EC_rabasdateChange(Sender: TObject);
begin

// 심사그룹 콤보박스에 Add
// 표시되는 것은 해당 승급일데이터중 가장 작은 심사그룹을 표시함. Ascending sorting
  with DM.Query_Temp do
  begin
       close;
       sql.clear;
       sql.add(' select distinct ragroup ragroup                              ');
       sql.add(' from   pimragroup                                            ');
       sql.add(' where  rabasdate = :rabasdate                                ');
       sql.add(' order  by                                                    ');
       sql.add('        ragroup                                               ');
       ParamByname('rabasdate').AsString := EC_rabasdate.Text;
       open;
       
       EC_ragroup.Items.Clear;
       While Not Eof do
       begin
             EC_ragroup.Items.Add( FieldByname('ragroup').AsString );
             Next;
       end;
       close;
  end;

// 가장작은 심사그룹코드를 표시
  with DM.Query_Temp do
  begin
       close;
       sql.clear;
       sql.add(' select min( ragroup ) ragroup                                ');
       sql.add(' from   pimragroup                                            ');
       sql.add(' where  rabasdate = :rabasdate                                ');
       ParamByname('rabasdate').AsString := EC_rabasdate.Text;
       open;
//
       EC_ragroup.Text := FieldByname('ragroup').AsString ;
       close;
  end;
  Bt_QueryClick(Sender);
end;

procedure TFm_PIC4010A4.EC_ragroupChange(Sender: TObject);
begin
// DB Grid를 표시함.
//  Bt_QueryClick(Sender);
//
end;

procedure TFm_PIC4010A4.E_payclExit(Sender: TObject);
begin
{
// 명칭을 가져옴.
  with DM.Query_select do
  begin
       close;
       sql.clear;
       sql.add(' select codename                                              ');
       sql.add(' from   pyccode                                               ');
       sql.add(' where  codeid(+) = ''I112''                                  ');
       sql.add('   and  codeno(+) = :codeno                                   ');
       ParamByName('codeno').AsString  := E_paycl.Text;
       open;
       if Eof then
          E_paycl_nm.Textcaption := ''
       else
          E_paycl_nm.Text := FieldByName('codename').AsString;
  end;
}
end;

procedure TFm_PIC4010A4.E_jobgunExit(Sender: TObject);
begin
{
// 명칭을 가져옴.
  with DM.Query_select do
  begin
       close;
       sql.clear;
       sql.add(' select codename                                              ');
       sql.add(' from   pyccode                                               ');
       sql.add(' where  codeid(+) = ''I115''                                  ');
       sql.add('   and  codeno(+) = :codeno                                   ');
       ParamByName('codeno').AsString  := E_jobgun.Text;
       open;
       if Eof then
          E_jobgun_nm.textcaption := ''
       else
          E_jobgun_nm.textcaption := FieldByName('codename').AsString;
  end;
}
end;

procedure TFm_PIC4010A4.E_rajobgunExit(Sender: TObject);
begin
// 명칭을 가져옴.
  with DM.Query_select do
  begin
       close;
       sql.clear;
       sql.add(' select codename                                              ');
       sql.add(' from   pyccode                                               ');
       sql.add(' where  codeid(+) = ''I115''                                  ');
       sql.add('   and  codeno(+) = :codeno                                   ');
       ParamByName('codeno').AsString  := E_rajobgun.Text;
       open;
       if Eof then
          E_rajobgun_nm.Text := ''
       else
          E_rajobgun_nm.Text := FieldByName('codename').AsString;
  end;
end;

end.
