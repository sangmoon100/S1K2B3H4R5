{-------------------------------------------------------------------------------
  PROGRAM-NAME   : PEF2030A(하향평가 점수등록)
  SYSTEM-NAME    : 종합인사정보
  SUBSYSTEM-NAME : 특정직평가
  Programmer     : 배준상
  Version        : 1.0.0
  Date           : 1999.07.06
  Update Contents
   Version    date(yy.mm.dd)     programmer      relevant doc.no  description
    1.00      1999.07.06         배준상          설계명세서       최초개발본
   30.10      2000.07.11         윤형식          전2000-06-       메일에러시 메시지출력 제거, 닫기시 최종완료처리 by 하병수
-------------------------------------------------------------------------------}

unit pef2030a1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, pegradpanl, StdCtrls, DB, OnInsaCommon, TmaxFunc, OnScheme;

type
  TMainForm = class(TForm)
    Pa_Work: TPanel;
    Edit1: TEdit;
    Button1: TButton;
    SF_Main: TOnSchemeForm;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
  private
    Pkorname : string;
    Gsempno   : string;
    procedure FormConnect;
    { Private declarations }
  public
    var_EmpList : String;  //피평가자 리스트(ex : 1차 아무개(0001) 미완료)
    var_rabasdate : String;
    gsGubun     : String;
    Pempno   : string;
    workemp1, workemp2 :String; //평가업무담당자
    procedure SubFormCreate(Gubun : String);
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses Hinsa_TmaxDM, pef2030a2, pef2030a3;

{$R *.DFM}

procedure TMainForm.FormActivate(Sender: TObject);
var
  msg, CompIp : String;
  ParamVariant : String;
begin
  Gsempno   := Hinsa_Param(CmdLine, 1);
  Pkorname  := Hinsa_Param(CmdLine, 2);
  CompIp    := Hinsa_Param(Cmdline,5);
  CompIP    := Copy(CompIP,2,Length(CompIP)-1);

  Application.ProcessMessages;

  msg := DataModule_Tmax.Connect_Session;
  if msg <> '' then
  begin
    Application.MessageBox(PChar(msg),'에러',mb_ok);
    Application.Terminate;
    Exit;
  end;

  //2013.11. Add 파라미터와 비교하여 암호 다르면 접속 막음.
  FM_Tmax := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := DataModule_Tmax.TMaxSession;
  if FM_Tmax.PassWordChk(Hinsa_Param(cmdline,1), Hinsa_Param(cmdline,3)) = 0 then
    Application.Terminate;

//  ParamVariant := 'SELECT MAX(RABASDATE) MAXDATE    '+
//                  'FROM PEMSPMAS             ';
  ParamVariant :=  'SELECT  '+
  ' nvl(        MAX(RABASDATE) ,'' '') MAXDATE '+
  'FROM PEMSPMAS                    ';

  DataModule_Tmax.Csel_SQL := ParamVariant;
  DataModule_Tmax.Csel_Open;
  var_rabasdate    := DataModule_Tmax.Csel_gfd(1);

  ParamVariant :=  'SELECT  e1empno                          '+
                   '  FROM  PEMSPMAS                         '+
                   ' WHERE  rabasdate = '''+var_rabasdate+''''+
                   '   and  EXYN      = ''Y''                ';

  DataModule_Tmax.Csel_SQL := ParamVariant;
  DataModule_Tmax.Csel_Open;
  Edit1.Text    := DataModule_Tmax.Csel_gfd(1);

  ParamVariant :=  'SELECT  Value1||'';''||Value3            '+
                   '  FROM  PEHREBAS                         '+
                   ' WHERE  rabasdate = '''+var_rabasdate+''''+
                   '   and  gubun  = ''11''                  '+
                   '   and  sgubun = ''0005''                ';

  DataModule_Tmax.Csel_SQL := ParamVariant;
  DataModule_Tmax.Csel_Open;
  workemp1    := DataModule_Tmax.Csel_gfd(1);
  workemp2    := DataModule_Tmax.Csel_gfd(2);

  Pempno := Gsempno;
  if (Gsempno = workemp1) or (Gsempno = workemp2) or (copy(Gsempno,1,1) = 'D') then
  begin
       edit1.Visible   := true;
       button1.Visible := true;
       Pa_Work.Align   := alBottom;
       Pempno          := edit1.Text;
  end
  else
  begin
       edit1.Visible   := false;
       button1.Visible := false;
       Pa_Work.Align   := alClient;
  end;
  //사용자에 따른 윈도우 연결..
  FormConnect;
end;

procedure TMainForm.FormConnect;
var
  ParamVariant : String;
begin
{
  ParamVariant := 'SELECT Count(EMPNO) Cnt ' +
                  '  FROM PEMSPMAS           ' +
                  ' WHERE RABASDATE = '''+var_rabasdate+''' ' +
                  '   AND E1EMPNO   = '''+Pempno+'''  '+
                  '   AND EXYN      = ''Y''           ';
  CDM.RemoteServer1.AppServer.Query_GenREQ(OLEVariant(ParamVariant));
  CDM.CDS_Gen.Open;
}
  ParamVariant :=  'SELECT  '+
  ' nvl(to_char(Count(EMPNO)),''0'') Cnt   '+
  '  FROM PEMSPMAS           ' +
  ' WHERE RABASDATE = '''+var_rabasdate+''' ' +
  '   AND E1EMPNO   = '''+Pempno+'''  '+
  '   AND EXYN      = ''Y''           ';

  DataModule_Tmax.Csel_SQL := ParamVariant;
  DataModule_Tmax.Csel_Open;

  if StrToInt(DataModule_Tmax.Csel_gfd(1)) > 0 then
    gsGubun := '1차'
  else
  begin
    {
    ParamVariant := 'SELECT Count(EMPNO) Cnt ' +
                  '  FROM PEMSPMAS           ' +
                  ' WHERE RABASDATE = '''+var_rabasdate+''' ' +
                  '   AND E2EMPNO   = '''+Pempno+'''  '+
                  '   AND EXYN      = ''Y''           ';
    CDM.RemoteServer1.AppServer.Query_GenREQ(OLEVariant(ParamVariant));
    CDM.CDS_Gen.Open;
    }
    ParamVariant :=  'SELECT  '+
    ' nvl(to_char(Count(EMPNO)),''0'') Cnt   '+
    '  FROM PEMSPMAS           ' +
    ' WHERE RABASDATE = '''+var_rabasdate+''' ' +
    '   AND E2EMPNO   = '''+Pempno+'''  '+
    '   AND EXYN      = ''Y''           ';

    DataModule_Tmax.Csel_SQL := ParamVariant;
    DataModule_Tmax.Csel_Open;

    if StrToInt(DataModule_Tmax.Csel_gfd(1)) > 0 then
      gsGubun := '2차';
  end;
  //폼을 보여준다..
  SubFormCreate(gsGubun);
end;

procedure TMainForm.SubFormCreate(Gubun : String);
begin
  if Gubun = '1차' then
  begin
    Fm_Sub1.Parent := Pa_Work;
    Fm_Sub1.WindowState := wsMaximized;
    Fm_Sub1.BorderStyle := bsNone;
    Fm_Sub2.Hide;
    Fm_Sub1.Show;
    if var_EmpList <> '' then
    begin
      Application.ProcessMessages;
      Fm_Sub1.CB_empno.ItemIndex := Fm_Sub1.CB_empno.Items.IndexOf(var_EmpList);
      Fm_Sub1.CB_empnoChange(Fm_Sub1.CB_empno);
    end;
  end
  else if Gubun = '2차' then
  begin
    Fm_Sub2.Parent := Pa_Work;
    Fm_Sub2.WindowState := wsMaximized;
    Fm_Sub2.BorderStyle := bsNone;
    Fm_Sub1.Hide;
    Fm_Sub2.Show;
    if var_EmpList <> '' then
    begin
      Application.ProcessMessages;
      Fm_Sub2.CB_empno.ItemIndex := Fm_Sub2.CB_empno.Items.IndexOf(var_EmpList);
      Fm_Sub2.CB_empnoChange(Fm_Sub2.CB_empno);
    end;
  end
  else
  begin
    MessageDlg(Pkorname + '님은 하향평가자가 아닙니다.', mtError, [mbOK], 0);
    Close;
    Exit;
  end;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TMainForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  begin
    if gsGubun = '1차' then
    begin
      Fm_Sub1.CB_ShowClass.Checked := not Fm_Sub1.CB_ShowClass.Checked;
      Fm_Sub1.SG_element.SetFocus;
    end
    else if gsGubun = '2차' then
    begin
      Fm_Sub2.CB_ShowClass.Checked := not Fm_Sub2.CB_ShowClass.Checked;
      Fm_Sub2.SG_element.SetFocus;
    end
  end;
end;

procedure TMainForm.Button1Click(Sender: TObject);
begin
     pempno := edit1.text;
     if gsGubun = '1차' then
     begin
          Fm_Sub1.running := false;
          Fm_Sub1.Hide;
     end
     else
     if gsGubun = '2차' then
     begin
          Fm_Sub2.running := false;
          Fm_Sub2.Hide;
     end;
     FormConnect;
end;

end.
