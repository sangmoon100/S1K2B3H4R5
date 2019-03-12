unit PZE1010A1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Tmax_DataSetText, Tmax_session, StdCtrls, OnFocusButton, ExtCtrls,
  jpeg, OnEditBaseCtrl, OnEditStdCtrl, OnLineLabel, OnScheme, OnInsaCommon,
  ComCtrls, OnRegistry, OnCalendarUtil, Func, TmaxFunc;

type
  TMainForm = class(TForm)
    SF_Skin: TOnSchemeForm;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    SB_Close: TOnFocusButton;
    SB_Ok: TOnFocusButton;
    Panel1: TPanel;
    OnSectionLabel4: TOnSectionLabel;
    OnSectionLabel5: TOnSectionLabel;
    OnSectionLabel6: TOnSectionLabel;
    ED_pass: TOnEdit;
    ED_npass1: TOnEdit;
    ED_npass2: TOnEdit;
    Qr_Save: TTMaxDataSet;
    TMaxSession: TTMaxSession;
    Qr_his: TTMaxDataSet;
    Label8: TLabel;
    Qr_sysdate: TTMaxDataSet;
    TDS_dml: TTMaxDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure SB_OkClick(Sender: TObject);
    procedure SB_CloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }

    function  PLB_Pass : Boolean;
  public
    { Public declarations }
    FGB_OK   : Boolean;
    FG_Empno : String;
    FG_Result : String;
  end;

var
  MainForm: TMainForm;

const
  PASS_KEY = CHR(VK_RETURN);

implementation

{$R *.DFM}          

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  TMaxSession.EnvFileName := GetHomeDir+'\newhana.env';
  TMaxSession.LabelName   := 'HANAROHPER';
  TMaxSession.Connect     := False;
  TMaxSession.Host        := Hinsa_Param(cmdline,10);
  TMaxSession.Port        := '9999';

  try
      TMaxSession.Connect := True;
  except
      Application.MessageBox(PChar('APP서버 접속 실패'),'에러',mb_ok);
      Application.Terminate;
      Exit;
  end;                       //showmessage(cmdline);

  //dsa2000  2013.11. (Lib ~ TmaxFunc  OnInsaCommon)
  FM_Tmax           := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := TMaxSession;
  if FM_Tmax.PassWordChk(Hinsa_Param(cmdline,1), Hinsa_Param(cmdline,3)) = 0 then Application.Terminate; //암호틀리면 종료}
end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := True;
end;

procedure TMainForm.SB_CloseClick(Sender: TObject);
begin
  FGB_OK := False;
  close;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  FG_Empno := Hinsa_Param(cmdline,1);

  ED_pass.SetFocus;
end;

procedure TMainForm.SB_OkClick(Sender: TObject);
begin
  FGB_OK := True;
  if ED_npass1.Text <> ED_npass2.Text then
  begin
       MessageDlg('새로운 사용자 암호와 확인용 새로운 사용자 암호가 일치해야 합니다...',mtInformation,[mbOK],0);
       System.Exit;
  end;

  if Length(Trim(ED_npass2.Text)) < 6 then
  begin
       MessageDlg('사용자 암호를 6자리 이상 입력해 주세요...',mtInformation,[mbOK],0);
       System.Exit;
  end;

  if (IsNumber(Trim(ED_npass2.Text)) or IsAlpha(Trim(ED_npass2.Text)))then
  begin
       MessageDlg('사용자 암호를 영문자와 숫자를 조합해서 작성해 주세요...',mtInformation,[mbOK],0);
       System.Exit;
  end;

  if (not PLB_Pass) and (FG_Result = 'CURRENT') then
  begin
       MessageDlg('비밀번호를 변경할 수 없습니다...'#13#13+
                  '기존 사용자 암호가 틀렸습니다. ',mtInformation,[mbOK],0);
       System.Exit;
  end
  else if (not PLB_Pass) and (FG_Result = 'HISTORY') then
  begin
       MessageDlg('비밀번호를 변경할 수 없습니다...'#13#13+
                  '과거에 사용했던 사용자 암호와 일치하여 사용할 수 없습니다...',mtInformation,[mbOK],0);
       System.Exit;
  end;


  //Add dsa2000  2013.12.
  with Qr_his do
  begin
       Close;
       ServiceName := 'SHR0SSEL';
       ClearFieldInfo;
       AddField('SEL_DATA', ftString, 5000);
       Sql.Clear;
       Sql.Add(Format('SELECT 1 FROM ZZZLOG '+
                      ' WHERE AID = ''%s''  ',[FG_Empno]));
       Open; //       ShowMessage(inttostr(Qr_tmp.RecordCount));

       if not Qr_his.Active then Qr_his.Active := True;

       if (Qr_his.RecordCount = 0) then //Select Aid, Count(*) From Zzzlog Group By Aid Having Count(*) > 1
       begin
            TDS_dml.Sql.Text := Format('Insert Into ZZZLOG  (AID, BPW, CTIME)                          '+
                                       'Values (''%s'', ''%s'',  to_char(sysdate,''yyyymmddhh24miss''))',
                                       [FG_Empno, ED_pass.Text] ) ;
            TDS_dml.Execute;
       end
       else
       begin
            TDS_dml.Sql.Text := Format('Update ZZZLOG                                        '+
                                       '   Set BPW   = ''%s'',                               '+
                                       '       CTIME = to_char(sysdate,''yyyymmddhh24miss'') '+
                                       ' Where AID   = ''%s''                                ',
                                       [ED_pass.Text, FG_Empno] ) ;
            TDS_dml.Execute;
       end;
  end;
  /////////////////////////////////////////////////////////////////////////

  MessageDlg('비밀번호 변경 완료',mtInformation,[mbOK],0);
end;

function TMainForm.PLB_Pass : Boolean;
var
  FL_Date : String;
begin
  Result  := False;
  FG_Result := '';

  Qr_sysdate.Open; //Servicename : HINSA_sysdate
  FL_Date := Copy(Qr_sysdate.FieldByName('sysdate').AsString,1,8);
  Qr_sysdate.Close;

  with Qr_his do
  begin
       ServiceName := 'HINSA_con_his';
       Close;      //현재 암호와 비교.
       Sql.Clear;
       Sql.Add(Format('Select 1 cnt             '+
                      '  From Pymenuuser        '+
                      ' Where Empno    = ''%s'' '+
                      '   And Password = XX1.Enc_Varchar2_Ins(''%s'',11,''PWSD'',''PYMENUUSER'',''PASSWORD'') '
                      ,[FG_Empno, ED_pass.Text]));
       Open;
       IF Qr_his.RecordCount = 0 then //암호틀림.
       begin
            Close;
            FG_Result := 'CURRENT';
            System.Exit;
       end;


       Close;      //암호이력과 비교.
       Sql.Clear;
       Sql.Add(Format('SELECT 1 cnt             '+
                      '  FROM Pypasshis         '+
                      ' WHERE empno    = ''%s'' '+
                      '   And Password = XX1.Enc_Varchar2_Ins(''%s'',11,''PWSD'',''PYMENUUSER'',''PASSWORD'') '
                      ,[FG_Empno, ED_npass1.Text]));
       Open;

       IF Qr_his.RecordCount > 0 then //이력있음.
       begin
            Close;
            FG_Result := 'HISTORY';
            System.Exit;
       end;   //ShowMessage(FG_Result);
       Close;
  end;

  FL_Date := GetDateMinus(FL_Date,60);
  with Qr_Save do
  begin
       ServiceName := 'HINSA_ins_his';
       ParamInfo[0].Value := FG_Empno;
       ParamInfo[1].Value := FL_Date;
       ParamInfo[2].Value := ED_npass1.Text;
  end;

  if not Qr_Save.Execute then System.Exit;  
  Result := True;
end;

end.

