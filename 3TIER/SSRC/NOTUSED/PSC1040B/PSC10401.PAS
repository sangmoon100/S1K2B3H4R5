unit PSC10401;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ComCtrls, Db, Tmax_DataSetText,
  peoutlookbtn, OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl,
  OnTmaxPersonEdit, OnInsaCommon, OnFocusButton, OnScheme, OnEditMemo, OnShapeLabel,
  Tmax_session;

type
  TPSC1040BF = class(TForm)
    Panel_Body: TPanel;
    ScrollBox1: TScrollBox;
    Label30: TLabel;
    Label31: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label32: TLabel;
    TDS1: TTMaxDataSet;
    TDS_dml: TTMaxDataSet;
    Eempno: TTMaxPersonPopupEdit;
    Pkorname: TOnEdit;
    p_jucnt: TOnEdit;
    p_defdate: TOnEdit;
    OkButton: TOnFocusButton;
    SF_Main: TOnSchemeForm;
    OnShapeLabel2: TOnShapeLabel;
    OnShapeLabel1: TOnShapeLabel;
    M_bigo: TOnMemo;
    StatusBar1: TStatusBar;
    BB_Close: TOnFocusButton;
    TMaxSession: TTMaxSession;
    BB_Find: TOnFocusButton;
    procedure FormPaint(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure EempnoKeyPress(Sender: TObject; var Key: Char);
    procedure BB_CloseClick(Sender: TObject);
    procedure EempnoReadEnded(Sender: TObject);
    procedure BB_FindClick(Sender: TObject);
  private
    { Private declarations }
    All_Flag       :Boolean;
  public
    { Public declarations }
    Empno          :string;
    Korname        :string;
    Password       :string;
    Grade          :string;

    Procedure Get_data;
  end;

var
  PSC1040BF: TPSC1040BF;

implementation


{$R *.DFM}

procedure TPSC1040BF.FormPaint(Sender: TObject);
var
  msg: String;
begin
  Self.OnPaint := Nil;
  Application.ProcessMessages;
  SF_Main.Refresh;
  StatusBar1.Panels[1].Text := '인사 시스템에 접속 중입니다...';

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

  StatusBar1.Panels[1].Text := '';

//----> Start
  Empno          := HInsa_Param(cmdline,1);
  Korname        := HInsa_Param(cmdline,2);
  Password       := HInsa_Param(cmdline,3);
  Grade          := HInsa_Param(cmdline,4);  //급여,인사 사용권한


  if  (UpperCase(Copy(HInsa_Param(cmdline,4),2,1)) <= 'B')  or
      (UpperCase(Copy(HInsa_Param(cmdline,4),3,1)) <= 'B')  or
      (UpperCase(Copy(HInsa_Param(cmdline,4),4,1)) <= 'D')  Then   //등급
    begin
      All_Flag  := True;   //통과
      Eempno.Enabled    := True;
      BB_Find.Enabled   := True;
    end
  else
    begin
      All_Flag  := False;
      Eempno.Enabled    := False;                 //All_Flag가 False 인 경우 Panel에 이름 보이기
      BB_Find.Enabled   := False;      
    end;

  Eempno.Text   := Empno;
  Pkorname.Text := Korname;
  Get_Data;
  Application.ProcessMessages;
end;

procedure TPSC1040BF.Get_Data;
var
  SqlText : string;
begin
  SqlText :=  'SELECT  '+
              ' nvl(        defdate    ,'' ''), '+
              ' nvl(        cnt        ,'' ''), '+
              ' nvl(        empno      ,'' ''), '+
              ' nvl(        korname    ,'' ''), '+
              ' nvl(to_char(jucnt     ),''0''), '+
              ' nvl(to_char(juamt     ),''0''), '+
              ' nvl(        bigo       ,'' ''), '+
              ' nvl(        ok         ,'' ''), '+
              ' nvl(        writetime  ,'' '')  '+
              'FROM psstockopt                  '+
              'WHERE    EMPNO ='''+Eempno.Text+''' '+
              'ORDER BY Empno, Defdate, Cnt Desc       ';

  with TDS1 do
    begin
      ServiceName := 'PSC1040B_sel1';
      Close;
      Sql.Clear;
      Sql.Add( SqlText);

      ClearFieldInfo;
      AddField('DEFDATE', ftString,  8);
      AddField('CNT'    , ftString,  2);
      AddField('EMPNO'  , ftString,  4);
      AddField('KORNAME', ftString,  12);
      AddField('JUCNT'  , ftInteger, 8);
      AddField('JUAMT'  , ftInteger, 5);
      AddField('BIGO'   , ftString,  100);
      AddField('OK'     , ftString,  1);
      Open;

      p_defdate.Text := '';   //초기화
      p_jucnt.Text   := '';
    end;

  if TDS1.eof then
    begin
      MessageBox(0,'입력한 사번은 존재하지 않거나 STOCK OPTION대상자가 아닌 사원입니다.',
                    '알 림',MB_OK or $0030);
      BB_CloseClick(Self);                               // 조회 실패시 종료 2001.03.02
    end;

  Eempno.Text    := TDS1.FieldByName('EMPNO').AsString;
  Pkorname.Text  := TDS1.FieldByName('KORNAME').AsString;

  p_defdate.Text := (copy(TDS1.FieldByName('defdate').AsString,1,4) + '-' +
                     copy(TDS1.FieldByName('defdate').AsString,5,2) + '-' +
                     copy(TDS1.FieldByName('defdate').AsString,7,2));
  p_jucnt.Text   := (FormatFloat('#,###',TDS1.FieldByName('jucnt').AsFloat) + ' 주 ');
  M_bigo.Text    := TDS1.FieldByName('Bigo').Asstring;

  if TDS1.FieldByName('OK').Asstring = 'Y' then
    OKBUTTON.Enabled := False
  else
    OKBUTTON.Enabled := True;

  Application.ProcessMessages;
end;


procedure TPSC1040BF.OkButtonClick(Sender: TObject);
var
  p_time : tdatetime;
  Tem : String;
begin
  p_time := now;
  if MessageDlg('귀하는 주식매수선택권부여계약서 제3조제3항과 관련하여'+#13#13+
                '귀하에게 부여된 주식매수선택권 수량이  '
                +p_jucnt.Text+'임을'+#13#13+datetimetostr(p_time)+'에 확인합니다.',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      Tem := 'UPDATE PSSTOCKOPT                                          '+
             ' SET OK =''Y'',                                            '+
             'WRITETIME = to_char(sysdate,''YYYYMMDDHH24MISS'')          '+
             'WHERE EMPNO ='''+Eempno.Text +'''                      ';

      with TDS_dml do
        begin
          ServiceName := 'PSC1040B_dml';
          Close;
          Sql.Clear;
          Sql.Add( Tem );

          if not TDS_dml.Execute then
              Application.Messagebox('수정에 실패했습니다.','작업안내',mb_ok+ mb_IconStop);
          Get_Data;
        end;
      end    
    else
      begin
        showmessage('확인을 취소하였습니다.');
      end;  
end;

procedure TPSC1040BF.EempnoKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    begin
      Eempno.PL_get_singledata ;  //사번을 먼저 조회하고서 그에 해당하는 data가져오기.
    end;
end;

procedure TPSC1040BF.BB_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TPSC1040BF.EempnoReadEnded(Sender: TObject);
begin
  Eempno.Text   := Eempno.empno;
  Pkorname.Text := Eempno.korname;
  Get_data;
end;

procedure TPSC1040BF.BB_FindClick(Sender: TObject);
begin
  Eempno.PL_get_singledata ;  //사번을 먼저 조회하고서 그에 해당하는 data가져오기.
end;

end.
