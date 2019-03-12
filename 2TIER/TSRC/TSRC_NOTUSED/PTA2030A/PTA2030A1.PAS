unit PTA2030A1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, peoutlookbtn, ExtCtrls, pegradpanl, pedate,pedbutil, pedbdate, petxtwzd,
  peempnoform, StdCtrls, Mask, pebtnedit, peextcombo, Db, DBTables, Grids,
  DBGrids, Buttons, func, Ora, MemDS, DBAccess;

type
  TFm_PTA2030A1  = class(TForm)
    Pa_Title: TPeJeonGrdPanel;
    St_Help: TStatusBar;
    Pa_Work: TPeJeonGrdPanel;
    pe_Date: TPeDbDate;
    PeJeonGrdPanel1: TPeJeonGrdPanel;
    Bt_Add: TPeJeonOutLookBtn;
    Bt_Del: TPeJeonOutLookBtn;
    Bt_Save: TPeJeonOutLookBtn;
    Bt_close: TPeJeonOutLookBtn;
    Bt_batch: TPeJeonOutLookBtn;
    Panel1: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    DBGrid1: TDBGrid;
    DataSource_Grid: TDataSource;
    EC_yearyy: TPeJeonPanelComboBox;
    p2_Bt_Query: TPeJeonOutLookBtn;
    E_leveli: TPePanelEdit;
    E_toeicfr: TPePanelEdit;
    E_toeictr: TPePanelEdit;
    E_examscore: TPePanelEdit;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    EC_payclfr: TPePanelEdit;
    SpeedButton2: TSpeedButton;
    EC_payclfr_nm: TPePanelEdit;
    EC_paycltr: TPePanelEdit;
    SpeedButton3: TSpeedButton;
    EC_paycltr_nm: TPePanelEdit;
    Panel11: TPanel;
    EC_jobgun: TPeJeonPanelComboBox;
    Query_Grid: TOraQuery;
    Query_GridPAYCLFR: TStringField;
    Query_GridPAYCLFR_NM: TStringField;
    Query_GridPAYCLTR: TStringField;
    Query_GridPAYCLTR_NM: TStringField;
    Query_GridLEVELI: TIntegerField;
    Query_GridTOEICFR: TIntegerField;
    Query_GridTOEICTR: TIntegerField;
    Query_GridEXAMSCORE: TFloatField;
// Db Grid의 내용을 refresh함. 임의 생성한 procedure는 모두 'proc_'로 시작함.
    procedure proc_DBGrid_show;
    procedure proc_DBGrid_locate;
    procedure proc_insert;
    procedure proc_update;
    procedure proc_chk_number;
//
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure Bt_exitClick(Sender: TObject);
    procedure s_Form1Click(Sender: TObject);
    procedure s_Form2Click(Sender: TObject);
    procedure s_form3Click(Sender: TObject);
    procedure s_form4Click(Sender: TObject);
    procedure PeJeonOutLookBtn1Click(Sender: TObject);
    procedure Bt_AddClick(Sender: TObject);
    procedure Bt_SaveClick(Sender: TObject);
    procedure Bt_DelClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure EC_yearyyChange(Sender: TObject);
    procedure p2_Bt_QueryClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Bt_batchClick(Sender: TObject);
  private
    { Private declarations }
  public
//    Report: TQuickRep;
    pEmpno: String;     // 로그인 사번
    pKorname: String;   // 로그인 성명
    pClass: String;     // 로그인 등급
    pEmpno_ad: String;  // 로그인 사번
    isfirst : boolean;
    { Public declarations }
  end;

var
  Fm_PTA2030A1: TFm_PTA2030A1;

implementation

uses Fm_DM, keycode; //, PTA2030A1_1;

{$R *.DFM}

procedure TFm_PTA2030A1.proc_chk_number;
begin
// 숫자 필드에 공백이 들어올 경우 '0'으로 처리함.
     if E_leveli.Text    = '' then  E_leveli.Text    := '0';
     if E_toeicfr.Text   = '' then  E_toeicfr.Text   := '0';
     if E_toeictr.Text   = '' then  E_toeictr.Text   := '0';
     if E_examscore.Text = '' then  E_examscore.Text := '0';
//
end;

procedure TFm_PTA2030A1.proc_DBGrid_locate;
begin
// 숫자 필드에 '' 일경우 '0'으로 변환
     proc_chk_number;
     with Query_Grid do
     begin
          First;
          while Not Eof do
          begin
               if (FieldByName('payclfr'  ).AsString  = Trim(EC_payclfr.Text)         ) and
                  (FieldByName('paycltr'  ).AsString  = Trim(EC_paycltr.Text)         ) and
                  (FieldByName('leveli'   ).AsInteger = StrToInt(Trim(E_leveli.Text ))) and
                  (FieldByName('toeicfr'  ).AsInteger = StrToInt(Trim(E_toeicfr.Text))) and
                  (FieldByName('toeictr'  ).AsInteger = StrToInt(Trim(E_toeictr.Text))) and
                  (FieldByName('examscore').AsFloat   = StrToFloat(Trim(E_examscore.Text))) then
                begin
                     exit;
                end;
               Next;
          end;
     end;
end;

procedure TFm_PTA2030A1.proc_DBGrid_show;
begin
// DB Grid의 내용을 보여줌.
      with Query_Grid do
      begin
           Close;
           SQL.clear;
           SQL.add(' select a.PAYCLFR                                             ');
           SQL.add('       ,a.payclfr                                             ');
           SQL.add('       ,b.codename payclfr_nm                                 ');
           SQL.add('       ,a.PAYCLTR                                             ');
           SQL.add('       ,a.paycltr                                             ');
           SQL.add('       ,c.codename paycltr_nm                                 ');
           SQL.add('       ,a.LEVELI                                              ');
           SQL.add('       ,a.TOEICFR                                             ');
           SQL.add('       ,a.TOEICTR                                             ');
           SQL.add('       ,a.EXAMSCORE                                           ');
           SQL.add(' from  ptmexscr a, pyccode b, pyccode c                       ');
           SQL.add(' where a.yearyy    = :YEARYY                                  ');
           SQL.add('   and a.jobgun    = :JOBGUN                                  ');
           SQL.add('   and b.codeid(+) = ''I112''                                 '); // payclfr 명칭
           SQL.add('   and b.codeno(+) = a.payclfr                                ');
           SQL.add('   and c.codeid(+) = ''I112''                                 '); // paycltr 명칭
           SQL.add('   and c.codeno(+) = a.paycltr                                ');

           ParamByName('YEARYY').AsString := EC_yearyy.Text;
           ParamByName('JOBGUN').AsString := Copy( EC_jobgun.Text,1,2);
           Open;
      end;
end;

procedure TFm_PTA2030A1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := caFree;
end;

procedure TFm_PTA2030A1.FormCreate(Sender: TObject);
var
     qq  : TOraQuery;
begin
     isfirst := true;
   // DB Connecting.
     FormPaint(Sender);
   // 기준년도의 년도를 가져옴.
     qq  := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     with qq do
     begin
          Close;
          SQL.clear;
          SQL.add(' select distinct yearyy                                       ');
          SQL.add(' from   ptmexscr                                              ');
          Open;
          EC_yearyy.Items.Clear;
          while not Eof do
          begin
               EC_yearyy.Items.Add( FieldByName('yearyy').AsString );
               Next;
          end;

          EC_yearyy.Text := Fn_GetYYYY;

   // 직군 코드를 가져옴.
          Close;
          SQL.clear;
          SQL.add(' select codeno || ''.'' || codename jobgun                    ');
          SQL.add(' from   pyccode                                               ');
          SQL.add(' where  codeid = ''I115''                                     ');
          Open;
          EC_jobgun.Items.Clear;
          while not Eof do
          begin
            EC_jobgun.Items.Add( FieldByName('jobgun').AsString );
            Next;
          end;

   // 단 처음 표시되는 직군코드는 '10' 으로 함.
          Close;
          SQL.clear;
          SQL.add(' select codeno  || ''.'' || codename jobgun                   ');
          SQL.add(' from   pyccode                                               ');
          SQL.add(' where  codeid = ''I115''                                     ');
          SQL.add('   and  codeno = ''10''                                       ');
          Open;
          EC_jobgun.Text    := FieldByName('jobgun').AsString ;
     end;  //with..end
   // DB Grid 의 내용을 보여줌
     proc_DBGrid_show;
end;


procedure TFm_PTA2030A1.FormPaint(Sender: TObject);
begin
     if isfirst = true then
     begin
          Self.Show;
          Self.Update;
          Application.ProcessMessages;

          OraConnect;
          pEmpno_ad := pEmpno;

          St_Help.Panels[1].Text := ' ' + Fn_GetDateStr;
          UpDateWindow(St_Help.Handle);

          Application.ProcessMessages;
          isfirst := false;
      end;
end;


procedure TFm_PTA2030A1.Bt_exitClick(Sender: TObject);
begin
     St_Help.Panels[0].Text := '';
     Close;
end;

procedure TFm_PTA2030A1.s_Form1Click(Sender: TObject);
begin
//  SubFormCreate(Sender);
end;

procedure TFm_PTA2030A1.s_Form2Click(Sender: TObject);
begin
//  SubFormCreate(Sender);
end;

procedure TFm_PTA2030A1.s_form3Click(Sender: TObject);
begin
//  SubFormCreate(Sender);
end;

procedure TFm_PTA2030A1.s_form4Click(Sender: TObject);
begin
//  SubFormCreate(Sender);
end;

procedure TFm_PTA2030A1.PeJeonOutLookBtn1Click(Sender: TObject);
begin
//  SubFormCreate(Sender);
end;                        

procedure TFm_PTA2030A1.Bt_AddClick(Sender: TObject);
begin
   // 우측 각 필드를 clear;
     EC_payclfr.Text     := '';
     EC_payclfr_nm.Text  := '';
     EC_paycltr.Text     := '';
     EC_paycltr_nm.Text  := '';
     E_leveli.Text       := '';
     E_toeicfr.Text      := '';
     E_toeictr.Text      := '';
     E_examscore.Text    := '';

     EC_payclfr.Enabled  := True;
     EC_paycltr.Enabled  := True;
     E_leveli.Enabled    := True;
     E_toeicfr.Enabled   := True;

{
if E_toeictr.Text    = '' then   E_toeictr.Text    := '0';
if E_examscore.Text  = '' then   E_examscore.Text  := '0';
}
end;

procedure TFm_PTA2030A1.Bt_SaveClick(Sender: TObject);
var
     qq : TOraQuery;
begin
// 숫자 필드에 '' 일경우 '0'으로 변환
  proc_chk_number;
// 기존에 해당하는 데이터가 존재하는지 검사
// 존재할경우 update, 그렇지 않을경우 insert 함.
     qq  := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     with qq do
     begin
          Close;
          SQL.clear;
          SQL.add(' select yearyy                                  ');
          SQL.add(' from   ptmexscr                                ');
          SQL.add(' where  yearyy  = :yearyy                       ');
          SQL.add('   and  jobgun  = :jobgun                       ');
          SQL.add('   and  payclfr = :payclfr                      ');
          SQL.add('   and  paycltr = :paycltr                      ');
          SQL.add('   and  leveli  = :leveli                       ');
          SQL.add('   and  toeicfr = :toeicfr                      ');

          ParamByName('yearyy' ).AsString   := EC_yearyy.Text;
          ParamByName('jobgun' ).AsString   := Copy(EC_jobgun.Text ,1,2 );
          ParamByName('payclfr').AsString   := Copy(EC_payclfr.Text ,1,2 );
          ParamByName('paycltr').AsString   := Copy(EC_paycltr.Text ,1,2 );
          ParamByName('leveli' ).AsInteger  := StrToInt(E_leveli.Text );
          ParamByName('toeicfr').AsInteger  := StrToInt(E_toeicfr.Text );

          Open;

          if qq.eof then
             proc_insert
          else
             proc_update;
     end;

     proc_DBGrid_show;   // 변경된 내용을 refresh.
     proc_DBGrid_locate; // insert / update 된 위치로 이동.
end;

procedure TFm_PTA2030A1.proc_insert;
var
     qq : TOraQuery;
begin
     qq  := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     with qq do
     begin
          Close;
          SQL.Clear;
          SQL.Add(' insert into ptmexscr (yearyy,             ');
          SQL.Add('                       jobgun,             ');
          SQL.Add('                       payclfr,            ');
          SQL.Add('                       paycltr,            ');
          SQL.Add('                       leveli,             ');
          SQL.Add('                       toeicfr,            ');
          SQL.Add('                       toeictr,            ');
          SQL.Add('                       examscore,          ');
          SQL.Add('                       writetime,          ');
          SQL.Add('                       writeemp)           ');
          SQL.Add('              values  (:yearyy,            ');
          SQL.add('                       :jobgun,            ');
          SQL.add('                       :payclfr,           ');
          SQL.add('                       :paycltr,           ');
          SQL.add('                       :leveli,            ');
          SQL.add('                       :toeicfr,           ');
          SQL.add('                       :toeictr,           ');
          SQL.add('                       :examscore,         ');
          SQL.add('                       :writetime,         ');
          SQL.add('                       :writeemp )         ');

          ParamByName('yearyy'   ).AsString   := EC_yearyy.Text;
          ParamByName('jobgun'   ).AsString   := Copy( EC_jobgun.Text ,1,2 );
          ParamByName('payclfr'  ).AsString   := Copy( EC_payclfr.Text ,1,2 );
          ParamByName('paycltr'  ).AsString   := Copy( EC_paycltr.Text ,1,2 );
          ParamByName('leveli'   ).AsInteger  := StrToInt( E_leveli.Text );
          ParamByName('toeicfr'  ).AsInteger  := StrToInt( E_toeicfr.Text );
          ParamByName('toeictr'  ).AsInteger  := StrToInt( E_toeictr.Text );
          ParamByName('examscore').AsFloat    := StrToFloat( E_examscore.Text );
          ParamByName('writeemp' ).AsString   := pEmpno_ad;
          ParamByName('writetime').AsString   := pe_Date.DateFrm;
          try
             ExecSQL;
          except
             Messagebox(0, '외국어 기준관리 항목을 등록하는데 실패하였습니다...', '알림', MB_OK or $0020);
             Exit;
          end;

          St_Help.Panels[0].Text := '외국어 기준관리  항목을 등록하였습니다...';
     end; //with..end
end;

procedure TFm_PTA2030A1.proc_update;
var
     qq : TOraQuery;
begin
     qq  := TOraQuery.Create(nil);
     qq.Session := Ora_Session;
     with qq do
     begin
          Close;
          SQL.Clear;
          SQL.Add(' update ptmexscr set                                          ');
          SQL.Add('        toeictr   = :toeictr,                                 ');
          SQL.Add('        examscore = :examscore,                               ');
          SQL.Add('        writetime = :writetime,                               ');
          SQL.Add('        writeemp  = :writeemp,                                ');
          SQL.Add(' where  yearyy    = :YEARYY                                   ');
          SQL.Add('   and  jobgun    = :jobgun                                   ');
          SQL.Add('   and  payclfr   = :payclfr                                  ');
          SQL.Add('   and  paycltr   = :paycltr                                  ');
          SQL.Add('   and  leveli    = :leveli                                   ');
          SQL.Add('   and  toeicfr   = :toeicfr                                  ');

          ParamByName('YEARYY'   ).AsString   := EC_yearyy.Text;
          ParamByName('jobgun'   ).AsString   := Copy(EC_jobgun.Text ,1,2);
          ParamByName('payclfr'  ).AsString   := Copy(EC_payclfr.Text ,1,2);
          ParamByName('paycltr'  ).AsString   := Copy(EC_paycltr.Text ,1,2);
          ParamByName('leveli'   ).AsInteger  := StrToInt(E_leveli.Text);
          ParamByName('toeicfr'  ).AsInteger  := StrToInt(E_toeicfr.Text);
          ParamByName('toeictr'  ).AsInteger  := StrToInt(E_toeictr.Text);
          ParamByName('examscore').AsFloat    := StrToFloat(E_examscore.Text);
          ParamByName('writeemp' ).AsString   := pEmpno_ad;
          ParamByName('writetime').AsString   := fn_GetDateTimeStr;

          try
             ExecSQL;
          except
             Messagebox(0, '외국어 기준관리 항목을 등록하는데 실패하였습니다...', '알림', MB_OK or $0020);
             Exit;
          end;
          St_Help.Panels[0].Text := '외국어 기준관리  항목을 등록하였습니다...';
     end;
end;


procedure TFm_PTA2030A1.Bt_DelClick(Sender: TObject);
var
     qq : TOraQuery;
begin
// 삭제시 key 값 체크
     if MessageDlg(' 정말 삭제하시겠습니까?', mtInformation, [mbYes, mbNo], 0) = mrNo then Exit;
     qq  := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     with qq do
     begin
          Close;
          SQL.Clear;
          SQL.Add(' delete ptmexscr                                              ');
          SQL.Add(' where  yearyy    = :yearyy                                   ');
          SQL.Add('   and  jobgun    = :jobgun                                   ');
          SQL.Add('   and  payclfr   = :payclfr                                  ');
          SQL.Add('   and  paycltr   = :paycltr                                  ');
          SQL.Add('   and  leveli    = :leveli                                   ');
          SQL.Add('   and  toeicfr   = :toeicfr                                  ');

          ParamByName('yearyy' ).AsString    := EC_yearyy.Text;
          ParamByName('jobgun' ).AsString    := Copy(EC_jobgun.Text ,1,2);
          ParamByName('payclfr').AsString    := Copy(EC_payclfr.Text ,1,2);
          ParamByName('paycltr').AsString    := Copy(EC_paycltr.Text ,1,2);
          ParamByName('leveli' ).AsInteger   := StrToInt(E_leveli.Text);
          ParamByName('toeicfr').AsInteger   := StrToInt(E_toeicfr.Text);
          try
             ExecSQL;
          except
             Messagebox(0, '외국어 기준관리 항목을 삭제하는데 실패하였습니다...', '알림', MB_OK or $0020);
             Exit;
          end;
          St_Help.Panels[0].Text := '외국어 기준관리  항목을 삭제하였습니다...';
        // 필드의 내용을 깨끗이 함.
          Bt_AddClick(Sender);
        // 그리드 상의 내용을 refresh
          proc_DBGrid_show;
     end;
end;



procedure TFm_PTA2030A1.SpeedButton1Click(Sender: TObject);
begin
     FKeyCode := TFKeyCode.Create(Self);
     try
        FKeyCode.FormData  := '직군코드 열람';
        FKeyCode.DataVal1  := 'I115';

        FKeyCode.ShowModal;

        if FKeyCode.CodeName = '' then System.Exit;
        TMaskEdit(Sender).Text := FKeyCode.Code;
        EC_jobgun.Text := FKeyCode.CodeName;

     finally
        FKeyCode.Free;
     end;
end;

procedure TFm_PTA2030A1.SpeedButton2Click(Sender: TObject);
begin
     FKeyCode := TFKeyCode.Create(Self);
     try
        FKeyCode.FormData  := 'BAND코드 열람';
        FKeyCode.DataVal1  := 'I112';

        FKeyCode.ShowModal;

        if FKeyCode.CodeName = '' then System.Exit;
        EC_payclfr.text        := FKeyCode.Code;
        EC_payclfr_nm.Text     := FKeyCode.CodeName;

     finally
        FKeyCode.Free;
     end;
end;

procedure TFm_PTA2030A1.SpeedButton3Click(Sender: TObject);
begin
     FKeyCode := TFKeyCode.Create(Self);
     try
        FKeyCode.FormData  := 'BAND코드 열람';
        FKeyCode.DataVal1  := 'I112';

        FKeyCode.ShowModal;

        if FKeyCode.CodeName = '' then System.Exit;
        EC_paycltr.text        := FKeyCode.Code;
        EC_paycltr_nm.Text     := FKeyCode.CodeName;

     finally
        FKeyCode.Free;
     end;
end;


procedure TFm_PTA2030A1.EC_yearyyChange(Sender: TObject);
begin
// DB Grid의 내용을 refresh함.
     proc_DBGrid_show;
end;

procedure TFm_PTA2030A1.p2_Bt_QueryClick(Sender: TObject);
begin
// DB Grid의 내용을 refresh함.
     proc_DBGrid_show;
end;

procedure TFm_PTA2030A1.DBGrid1DblClick(Sender: TObject);
begin
   // Grid 의 내용을 우측 각 필드로 넘김.
     EC_payclfr.Text     := Query_Grid.FieldByname('payclfr').AsString;
     EC_payclfr_nm.Text  := Query_Grid.FieldByname('payclfr_nm').AsString;
     EC_paycltr.Text     := Query_Grid.FieldByname('paycltr').AsString;
     EC_paycltr_nm.Text  := Query_Grid.FieldByname('paycltr_nm').AsString;
     E_leveli.Text       := Query_Grid.FieldByname('leveli').AsString;
     E_toeicfr.Text      := IntToStr( Query_Grid.FieldByname('toeicfr').AsInteger );
     E_toeictr.Text      := IntToStr( Query_Grid.FieldByname('toeictr').AsInteger );
     E_examscore.Text    := FloatToStr( Query_Grid.FieldByname('examscore').AsFloat );

     EC_payclfr.Enabled  := False;
     EC_paycltr.Enabled  := False;
     E_leveli.Enabled    := False;
     E_toeicfr.Enabled   := False;
end;

procedure TFm_PTA2030A1.Bt_batchClick(Sender: TObject);
begin
{
     Application.CreateForm(TFm_PTA2030A1_1, Fm_PTA2030A1_1 );
     Fm_PTA2030A1_1.EC_yearyy.text  := EC_yearyy.Text;
     try
        Fm_PTA2030A1_1.ShowModal;
     finally
        Fm_PTA2030A1_1.Free;
     end;
   // 승격기준일 refresh
     FormCreate(Sender);
}
end;

end.
