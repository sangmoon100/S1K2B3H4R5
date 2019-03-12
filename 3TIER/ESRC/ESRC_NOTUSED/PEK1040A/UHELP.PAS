unit UHelp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Comobj,
  ExtCtrls, OnScheme, StdCtrls, OnFocusButton,OnInsaCommon,PDownLoad, Func;

type
  TFHelp = class(TForm)
    SF_Main: TOnSchemeForm;
    Panel1: TPanel;
    ExitBtn: TOnFocusButton;
    Image1: TImage;
    AllHelpBtn: TOnFocusButton;
    procedure ExitBtnClick(Sender: TObject);
    procedure AllHelpBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FHelp: TFHelp;

implementation

uses HMainForm;

{$R *.DFM}

procedure TFHelp.ExitBtnClick(Sender: TObject);
begin
     Close;
end;

procedure TFHelp.AllHelpBtnClick(Sender: TObject);
var LSfilename : string;
    XL         : Variant;
    LAarg      : array[0..200] of char;
begin
   FM_DownLoad := TFM_DownLoad.Create(Application);
   FM_DownLoad.Show;
   FM_DownLoad.PL_ReadEnv;                     //환경변수값(파라미터) 읽어온다.
   FM_DownLoad.PL_VersionCHK3(3, 'PEK1040H');  //Call하는 단위 프로그램의 버젼을 체크..
   FM_DownLoad.FL_UserID := Fm_main.GsEmpno;
   FM_DownLoad.PL_DownLoad(3,'/hper/insa/hperson/usrbin/Ebin','PEK1040H.XLS','PEK1040H',FM_DownLoad.FL_ProgVer, FL_UnixIP, FL_FtpUser, FL_FtpPass);
end;

procedure TFHelp.FormCreate(Sender: TObject);
begin
  VarLoading;
end;

end.
