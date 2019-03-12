unit USawon;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OnEditBaseCtrl, OnEditStdCtrl, jpeg, StdCtrls, ExtCtrls, Db, MemDS, DBAccess,
  Ora, Buttons, Func, OnFocusButton;

type
  TFrmSawon = class(TForm)
    GroupBox1: TGroupBox;
    OnEd_Sabun: TOnEdit;
    OnEd_Name: TOnEdit;
    OnEd_payra: TOnEdit;
    OnEd_PrtPayra: TOnEdit;
    OnEd_Jumin: TOnEdit;
    OnEd_EmpDate: TOnEdit;
    Image1: TImage;
    BT_OK: TOnFocusButton;
    BT_Close: TOnFocusButton;
    procedure OnEd_SabunKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
    procedure BT_OKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    picMem : TMemoryStream;
  public
    { Public declarations }
    GV_La_paycl:string;
  end;

var
  FrmSawon: TFrmSawon;


implementation

uses UMain;

{$R *.DFM}

procedure TFrmSawon.OnEd_SabunKeyPress(Sender: TObject; var Key: Char);
var
  imgJPEG   : TJPEGImage;
  Rect      : TRect;
  qq      : TOraQuery;
begin
  if not ( (Key = #13) and (Length(OnEd_Sabun.Text)=4) )  then exit;

  qq := TOraQuery.Create(nil);
  qq.Session := Ora_Session;
  try
       with qq do
       begin
            Close;
            SQL.Clear;
            SQL.Add('select empno,                                ');
            SQL.Add('       korname,                              ');
            SQL.Add('       engname,                              ');
            SQL.Add('       juminid,                              ');
            SQL.Add('       orgempdate,                           ');
            SQL.Add('       deptcode,                             ');
            SQL.Add('       deptname,                             ');
            SQL.Add('       payra_ic orders,                      ');
       {    SQL.Add('       decode(payclnm,''특정''    ,''사원'', ');
            SQL.Add('                      ''전문계약'',''사원'', ');
            SQL.Add('                      ''계약''    ,''사원'', ');
            SQL.Add('                      ''일반''    ,''사원'', ');
            SQL.Add('                      payclnm ) orders     , ');  }
            SQL.Add('       photo                                 ');
            SQL.Add('  from HPER.IC_PIMPMAS                       ');
            SQL.Add(' where empno =:empno                         ');
            ParamByName('empno').AsString:= OnEd_Sabun.Text;
            Open;

            OnEd_Name.Text     := FieldByName('korname').AsString;
            OnEd_payra.Text    := FieldByName('orders').AsString;
            OnEd_PrtPayra.Text := FieldByName('orders').AsString;
            OnEd_Jumin.Text    := copy(FieldByName('juminid').AsString,1,8)+'+*****';
            OnEd_EmpDate.Text  := Copy(FieldByName('orgempdate').AsString,1,4)+'년'+
                                  Copy(FieldByName('orgempdate').AsString,5,2)+'월'+
                                  Copy(FieldByName('orgempdate').AsString,7,2)+'일';

            picMem  := TMemoryStream.Create;
            imgJPEG := TJPEGImage.Create;
            Rect    := Image1.Canvas.ClipRect;

            if qq.Active then
            begin
                 if   qq.FieldByName('empno').AsString = '' then
                 begin
                      MessageDlg('존재하지 않는 사원입니다.', mtInformation, [mbOK], 0);
                      image1.Picture := nil;
                      System.Exit;
                 end
                 else if TBlobField(qq.FieldByName('photo')) <> nil then
                 begin
                      TBlobField(qq.FieldByName('photo')).SaveToStream(picMem);
                      PicMem.Position :=0;
                      imgJPEG.LoadFromStream(picMem);
                      image1.Canvas.StretchDraw(Rect,imgJPEG);
                 end;
            end;
            imgJPEG.Free;
       end;
  finally
       qq.Free;
  end;
end;

//취소 버튼 클릭시
procedure TFrmSawon.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

//확인 버튼 클릭시
procedure TFrmSawon.BT_OKClick(Sender: TObject);
begin
  if Length(OnEd_Sabun.Text) = 4 then
  begin
       FrmMain.E_Search.Text := OnEd_Sabun.Text;
       FrmMain.FindEmp('출력');
  end;

  FrmSawon.Close;
end;

procedure TFrmSawon.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
