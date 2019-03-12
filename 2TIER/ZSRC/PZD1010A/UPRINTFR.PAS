unit UPrintFr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, ExtCtrls, Qrctrls, jpeg, Db, MemDS, DBAccess,
  Ora, Func, OnInsaCommon;

type
  TFM_PrintF = class(TForm)
    QuickRep1: TQuickRep;
    ColumnHeaderBand1: TQRBand;
    QRImage1: TQRImage;
    QRLa_Name: TQRLabel;
    QRLa_EngName: TQRLabel;
    OraQuery1: TOraQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FM_PrintF: TFM_PrintF;

implementation

uses UMain;

{$R *.DFM}

procedure TFM_PrintF.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFM_PrintF.FormCreate(Sender: TObject);
begin
     QRLa_Name.Caption    := '';
     QRLa_EngName.Caption := '';
//     QRLa_Paycl.Caption   := '';
end;

procedure TFM_PrintF.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var
  imgJPEG   : TJPEGImage;
  Rect      : TRect;
  str       : string;
  V_korname : string;
  FistName, MiddleName, MiddleName1, LastName :string;
  qq : TOraQuery;
begin 
  if FrmMain.Flag = 'S' then
  begin
       OraQuery1.Session := Ora_Session;
       with OraQuery1 do
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
            SQL.Add('       decode(payclnm,''특정''    ,''사원'', ');
            SQL.Add('                      ''전문계약'',''사원'', ');
            SQL.Add('                      ''계약''    ,''사원'', ');
            SQL.Add('                      ''일반''    ,''사원'', ');
            SQL.Add('                      payclnm ) orders     , ');
            SQL.Add('       photo                                 ');
            SQL.Add('  from HPER.IC_PIMPMAS                       ');
            SQL.Add(' where empno =:empno                         ');
            ParamByName('empno').AsString := FrmMain.E_Search.Text;
            Open;

            if OraQuery1.Active then
            begin
                 if   (OraQuery1.RecordCount = 1) and  //저장된 사원일경우 사진을 DB에서 읽어 프린트.
                      (TBlobField(FieldByName('photo')) <> nil) then
                 begin
                      QRImage1.Picture := nil; //사진 초기화
                      imgJPEG := TJPEGImage.Create;
                      TBlobField(FieldByName('photo')).SaveToFile(GetHomeDir+'\Pic\'+ 'AAA' +'.jpg');
                      QRImage1.Picture.LoadFromFile(GetHomeDir+'\Pic\'+ 'AAA' +'.jpg');
                 end;
            end;
       end;
       //imgJPEG.Free;
  end
  else if FrmMain.Flag = 'D' then //QRImage2.Picture.LoadFromFile('.\Image\sawon_F.jpg');  //리포트 큰사진
  else if FrmMain.Flag = 'I' then
  begin
       //QRImage2.Picture.LoadFromFile('.\Image\imsicard.jpg'); //리포트 큰사진
       QRImage1.Picture := nil;                                 //리포트 증명사진 초기화
  end
  else if FrmMain.Flag = 'V' then
  begin
       //QRImage2.Picture.LoadFromFile('.\Image\visitcard.jpg'); //리포트 큰사진
       QRImage1.Picture := nil;                                //리포트 증명사진 초기화
  end;

  QRLa_Name.Caption   := FrmMain.La_Name.Caption;
  QRLa_EngName.Caption:= FrmMain.La_EngName.Caption;
//  QRLa_Paycl.Caption  := FrmMain.La_paycl.Caption;
end;

end.
