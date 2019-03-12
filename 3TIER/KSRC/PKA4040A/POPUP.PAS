unit popup;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, OnFocusButton, ExtCtrls, Db, Tmax_DataSetText,func,
  OnEditBaseCtrl, OnEditStdCtrl, OnEditMemo, OnShapeLabel, PDownLoad, Pass,
  OnInsaCommon;

type
  TFM_popup = class(TForm)
    p_yearly_notice: TPanel;
    TDS_Com: TTMaxDataSet;
    Panel6: TPanel;
    TMaxDataSet1: TTMaxDataSet;
    Shape101: TShape;
    SL_Yearly_Cnt: TOnShapeLabel;
    Label64: TLabel;
    Shape8: TShape;
    SL_Yearlyplan_Cnt: TOnShapeLabel;
    Label37: TLabel;
    Shape9: TShape;
    SL_Used_Yearly_Cnt: TOnShapeLabel;
    Label38: TLabel;
    Shape10: TShape;
    SL_Unused_Yearly_Cnt: TOnShapeLabel;
    Label39: TLabel;
    Y_moveClick: TOnFocusButton;
    BB_Close: TOnFocusButton;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    p_yearly_notice2: TPanel;
    yearly_ok: TOnFocusButton;
    Label14: TLabel;
    p_yearly_notice3: TPanel;
    Label1: TLabel;
    OnFocusButton1: TOnFocusButton;
    OnFocusButton2: TOnFocusButton;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label2: TLabel;
    procedure BB_CloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Y_moveClickClick(Sender: TObject);
    procedure yearly_okClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function  update_yearly_notice : boolean;
    procedure move_yearly;
    function  update_yearly_closeyn(p_closeyn : string) : boolean;
  end;

var
  FM_popup: TFM_popup;

implementation
uses
  pka4040a1;

{$R *.DFM}

procedure TFM_popup.BB_CloseClick(Sender: TObject);
begin
    update_yearly_notice;
    update_yearly_closeyn('Y');

(*  if MessageBox(HANDLE,'연차휴가 사용계획을 등록하지 않으시겠습니까?','확인',MB_YESNO) = IDYES then
       update_yearly_closeyn('Y')
  else update_yearly_closeyn('N');
*)
  close;
end;

procedure TFM_popup.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := CaFree;
end;

procedure TFM_popup.move_yearly;
var LSfilename : string;
    LAarg : array[0..200] of char;
    ObjName    : String;
begin
  ObjName     := UpperCase('PKA4057A.EXE');
  FM_DownLoad := TFM_DownLoad.Create(Application);
  FM_DownLoad.Show;
  FM_DownLoad.PL_ReadEnv;                            //환경변수값(파라미터) 읽어온다.
  FM_DownLoad.PL_VersionCHK3(3, Copy(ObjName,1,8));  //Call하는 단위 프로그램의 버젼을 체크..

  if (not FM_DownLoad.FL_VersionCHK ) or (not FileExists(GetHomeDir+'\Bin\3tier\'+ObjName)) then //버젼 & 파일유무 Check
  begin
       FM_DownLoad.PL_DownLoad(3,'/hper/insa/hperson/usrbin/Kbin',ObjName,Copy(ObjName,1,8),FM_DownLoad.FL_ProgVer, FL_UnixIP, FL_FtpUser, FL_FtpPass); //단위 프로그램 다운받기.
  end
  else
  begin
       FM_DownLoad.PL_ProgramCall(GetHomeDir+'\Bin\3tier\'+ObjName);

       if FM_DownLoad.FL_Ret < 32 then
          MessageBox(handle,'화일이 없거나 메모리가 부족합니다..','에 러',MB_OK or $0010);

       FM_DownLoad.Close;      // 다운로드 폼 닫기.
  end;
end;


procedure TFM_popup.Y_moveClickClick(Sender: TObject);
var LSfilename : string;
    LAarg : array[0..200] of char;
begin
    update_yearly_closeyn('N');
    update_yearly_notice;

    move_yearly;

  Close;
end;

function TFM_popup.update_yearly_notice : boolean;
begin
    result := false;

    if (FM_Main.ED_empno.empno='') then
    begin
        FM_Main.ED_empno.SetFocus;
        exit;
    end ;

    if (FM_Main.FG_Empno <> FM_Main.ED_empno.empno) then
    begin
        exit;
    end
    else
    begin
        if (strtofloat(SL_Yearly_Cnt.LabelCaption) > 0)  then
        begin
            with FM_Main.QR_com do
            begin
                ServiceName := 'PKA4040A_dml';
                Close;
                SQL.Clear;
                SQL.Add('UPDATE PKYEARLT                                           ');
                SQL.Add('SET NOTICE_YN   =''Y'',                                   ');
                SQL.Add('    NOTICEEMPNO = ''' + FM_Main.FG_empno + ''',           ');
                SQL.Add('    NOTICETIME  = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'')   ');
                SQL.Add(' WHERE yearly_yy = '''+copy(FM_Main.GS_YYYYMM,1,4)+'''    ');
                SQL.Add('   AND empno = '''+FM_Main.ED_empno.empno+'''             ');
                SQL.Add('   AND nvl(NOTICE_YN,''N'') <> ''Y''                      ');

                try
                     Execute
                except
                     Exit;
                end;
            end;
        end;
    end;

    result := true;
end;

function TFM_popup.update_yearly_closeyn(p_closeyn : string) : boolean;
begin
    result := false;

    if (FM_Main.ED_empno.empno='') then
    begin
        FM_Main.ED_empno.SetFocus;
        exit;
    end ;

    if (FM_Main.FG_Empno <> FM_Main.ED_empno.empno) then
    begin
        exit;
    end
    else
    begin
        if (strtofloat(SL_Yearly_Cnt.LabelCaption) > 0)  then
        begin
            with FM_Main.QR_com do
            begin
                ServiceName := 'PKA4040A_dml';
                Close;
                SQL.Clear;
                SQL.Add('UPDATE PKYEARLT                                          ');
                SQL.Add('   SET CLOSE_YN  ='''+p_closeyn+''',                     ');
                SQL.Add('       CLOSEEMP  = '''+FM_Main.FG_Empno+''',             ');
                SQL.Add('       CLOSETIME = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'') ');
                SQL.Add(' WHERE yearly_yy = '''+copy(FM_Main.GS_YYYYMM,1,4)+'''   ');
                SQL.Add('   AND empno     = '''+FM_Main.ED_empno.empno+'''        ');
                SQL.Add('   AND nvl(CLOSE_YN,''N'') <> ''Y''                      ');

                try
                     Execute
                except
                     Exit;
                end;
            end;
        end;
    end;

    result := true;
end;


procedure TFM_popup.yearly_okClick(Sender: TObject);
begin
    move_yearly;

  Close;
end;

end.
