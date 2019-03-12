unit UPrintF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  jpeg, ExtCtrls, QuickRpt, Qrctrls, Db, MemDS, DBAccess, Ora,OnStringUtils,
  Func, OnInsaCommon;

type
  TFrmPrintF = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    OraQuery1: TOraQuery;
    QRImage1: TQRImage;
    QRLa_Name: TQRLabel;
    QRLa_EngName: TQRLabel;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBanC: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    picMem : TMemoryStream;
  public
    { Public declarations }
  end;
//
//Height  19
//Width   90
//Top    160
//Left   173 


var
  FrmPrintF: TFrmPrintF;

implementation

uses UInput, UMain;

{$R *.DFM}

// 사원증 출력 전에
procedure TFrmPrintF.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBanC: Boolean);
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
                 end 
                 else 
                 begin 
                      QRImage1.Picture := FrmMain.Image3.Picture; 
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

  //정상적인 영문명 출력....
  QRLa_EngName.Font.Style := [fsBold];
  //2016.01.21.hjku.. 폰트 변경 요청.. 김완기M 요청..
  //QRLa_EngName.Font.Name  := 'Gill Sans Display MT Pro Bold';
  QRLa_EngName.Font.Name  := '맑은 고딕';
  //QRLa_EngName.Font.Name  := '굴림';
  QRLa_EngName.Font.Size  := 9;

  //인턴 사원 출력....
  if Copy(FrmMain.E_Search.Text,1,1) = 'I' then
  begin
       QRLa_EngName.Font.Style := [fsBold];  
       QRLa_EngName.Font.Name  := '-윤고딕140'; //인턴사원은 인사전산등록표에서 등록한 영문명 그대로 찍히도록
       QRLa_EngName.Font.Size  := 10;
  end;
  
  QRLa_Name.Caption    := FrmMain.La_Name.Caption;
  QRLa_EngName.Caption := FrmMain.La_EngName.Caption;

//  QRLa_Paycl.Caption  := FrmMain.La_paycl.Caption;
end;

procedure TFrmPrintF.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmPrintF.FormCreate(Sender: TObject);
begin
     QRLa_Name.Caption    := '';
     QRLa_EngName.Caption := '';

  //2016.01.21.hjku.. 퀵리포트 버그로 QRLa_EngName 위치 고정.
  //증명사진 : H(120),L(173), T(22),W(90)
  //한글성명 : H(19),L(173), T(145),W(90)
  //영문성명 : H(19),L(168), T(165),W(102)
 (*2015.02.24.hjku 기존 백업
  QRImage1.Height := 120;
  QRImage1.Left   := 173;
  QRImage1.Top    := 22;
  QRImage1.Width  := 90;

  QRLa_Name.Height := 19;
  QRLa_Name.Left   := 173;
  QRLa_Name.Top    := 145;
  QRLa_Name.Width  := 90;

  QRLa_EngName.Height := 19;
  QRLa_EngName.Left   := 168;
  QRLa_EngName.Top    := 165;
  QRLa_EngName.Width  := 102;
  *)

  QRImage1.Height := 120;
  QRImage1.Left   := 167;
  QRImage1.Top    := 22;
  QRImage1.Width  := 90;

  QRLa_Name.Height := 19;
  QRLa_Name.Left   := 167;
  QRLa_Name.Top    := 145;
  QRLa_Name.Width  := 90;

  QRLa_EngName.Height := 19;
  QRLa_EngName.Left   := 161;
  QRLa_EngName.Top    := 165;
  QRLa_EngName.Width  := 102;
//     QRLa_Paycl.Caption   := '';
end;

end.
