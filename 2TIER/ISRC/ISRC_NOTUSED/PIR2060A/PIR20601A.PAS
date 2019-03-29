{-------------------------------------------------------------------------------
  o 프로그램명
    프로그램명을 작성한다.
    (예) 프로그램명 : 상조회 경조금 신청등록 - PSA1020A)
  o 시스템명
    시스템명을 작성한다.
    (예) 시스템명 : 종합인사정보시스템
  o 부시스템명
    부시스템명을 작성한다.(예) 부시스템명 : 복리후생
  o 작성자
    최초 개발자 작성자의 정보를 작성한다.
    (예) 작성자 : 홍길동 [링크웨어, 대리, 011-318-9876]
  o 버전
    프로그램 현재 버전을 작성한다.(예) 버전 : 1.0
  o 작성일자
    최초 작성일자를 작성한다.(예) 작성일자 : 1997.10.10
  o 변경 이력사항
        버전 일자       작성자   변경내용                   처리명세서 반영여부
   (예) 1.1  1999.10.10 홍길동   경조금 코드 변경에 따른    반영
                                 수정 (직급필드 추가)
-------------------------------------------------------------------------------}
unit PIR20601A;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, OnScheme, StdCtrls, OnFocusButton, OnOneInstance,
  Tmax_session, Grids, DBGrids, OnEditStdCtrl, OnEditBaseCtrl,Pass,
  OnEditBtnCtrl, OnEditCombo, DBTables, Db, JPeg;//, rxgif;

type
  TFM_Main = class(TForm)
    SF_Main      : TOnSchemeForm;
    PA_MainPanel : TPanel;
    CB_Bumun: TOnComboEdit;
    CB_JOBKIND: TOnComboEdit;
    E_FullName: TOnEdit;
    E_Rid: TOnEdit;
    DBGrid1: TDBGrid;
    BT_Find: TOnFocusButton;
    Database1: TDatabase;
    Query1: TQuery;
    DataSource1: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    TabSheet8: TTabSheet;
    RichEdit1: TRichEdit;
    RichEdit2: TRichEdit;
    ScrollBox1: TScrollBox;
    Image1: TImage;
    ScrollBox2: TScrollBox;
    Image2: TImage;
    ScrollBox3: TScrollBox;
    Image3: TImage;
    ScrollBox4: TScrollBox;
    Image4: TImage;
    ScrollBox5: TScrollBox;
    Image5: TImage;
    ScrollBox6: TScrollBox;
    Image6: TImage;
    ScrollBox7: TScrollBox;
    Img_Toeic: TImage;
    E_UnivName: TOnEdit;
    E_GRD1NAME: TOnEdit;
    qry_Cnt: TQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BT_ExitClick(Sender: TObject);
    procedure BT_FindClick(Sender: TObject);
//    procedure CB_BumunChange(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure E_FullNameKeyPress(Sender: TObject; var Key: Char);
    procedure PageControl1Change(Sender: TObject);
  private
    { Private declarations }
    FL_Start   : Boolean;
  public
    { Public declarations }
    errorHelp : array[0..255] of char;
    p_empno   : string;
    p_korname : string;
    password  : string;
    pclass    : string;
    DBState   : string;
    strDate   : string;
    startYN   : Boolean;
    strSQL    : TStringList;
  end;

  Const RabasDate = '20080501';

var
  FM_Main: TFM_Main;

implementation

{$R *.DFM}

procedure TFM_Main.FormCreate(Sender: TObject);
begin
  StartYN   := True;
  P_empno   := PassEmp(cmdline,1);
  P_korname := PassEmp(cmdline,2);
  password  := PassEmp(cmdline,3);
  pclass    := PassEmp(cmdline,4);
  strSQL    := TStringList.Create;
end;

procedure TFM_Main.FormPaint(Sender: TObject);
var
  i : integer;
begin
  Application.ProcessMessages;
  CB_Bumun.ItemIndex := 19;
  
  if StartYN then
    begin
      if Database1.Connected then Database1.Connected := False;
      for i := 0 to Database1.Params.Count - 1 do
        begin
          if System.Pos('SERVER NAME', Database1.Params[i]) > 0 then
            Database1.Params[i] := 'SERVER NAME='+PassEmp(CmdLine,13);
          if System.Pos('USER NAME', Database1.Params[i]) > 0 then
            Database1.Params[i] := 'USER NAME='+PassEmp(CmdLine,5);
          if System.Pos('PASSWORD', Database1.Params[i]) > 0 then
            Database1.Params[i] := 'PASSWORD='+PassEmp(CmdLine,6);
        end;

        Try
           Database1.Connected := True;
        EXCEPT ON E : EDataBaseError DO
          begin
            MessageBox(handle,StrPcopy(ErrorHelp,E.Message),'에  러',MB_OK or $0010);
            halt(0);
          end;
        end;

        CB_Bumun.Items.Clear;
        CB_Bumun.Items.Add('전체선택');
        CB_Bumun.KeyItems.Add('0');

        with qry_Cnt do
        begin
             Close;
             SQL.Clear;
             SQL.Add(' SELECT * FROM pyccode WHERE (codeid=''C051'' or codeid=''C052'')  and useyn = ''Y'' order by codeid, codeno ');
             Open;

             While Not Eof do
             begin
                  CB_Bumun.Items.Add(FieldByName('codeno').AsString + ': ' + FieldByName('codefname').AsString);
                  CB_Bumun.KeyItems.Add(FieldByName('codeno').AsString);
                  Next;
             end;
        end;
        CB_Bumun.ItemIndex := 0
    end;
end;

procedure TFM_Main.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := True;
end;

procedure TFM_Main.BT_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TFM_Main.BT_FindClick(Sender: TObject);
begin
  with Query1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select  rid,fullname,strength,selfinfo,FILEBOHUN,FILEETC,FILEGRAD1,FILEGRAD2,FILEPHOTO,FILESCORE1,FILESCORE2,FILETOEIC from prectmas '+
            'where rabasdate ='''+RabasDate+'''');
//            '  and rid in (select rid from hper.prectmas_200710) ');
    if E_Rid.Text <> '' then
      SQL.Add(' and rid = '''+E_Rid.Text+'''');
    if E_FullName.Text <> '' then
      SQL.Add(' and fullname like ''%'+E_FullName.Text+'%''');
    //응시부문
    if CB_Bumun.KeyItems[CB_Bumun.ItemIndex] <> '00' then
       Sql.Add('and DEPT = '''+CB_Bumun.KeyItems[CB_Bumun.ItemIndex]+'''');
    //대학교
     if E_UnivName.Text <> '' then
       begin
         Sql.Add('and UNIVNAME like :UNIVNAME ');
         ParamByName('UNIVNAME').AsString := '%'+E_UnivName.Text+'%';
       end;

    //대학원
    if E_GRD1NAME.Text <> '' then
      begin
        Sql.Add('and GRD1NAME like :GRD1NAME');
        ParamByName('GRD1NAME').AsString := '%'+E_GRD1NAME.Text+'%';
      end;

    //응시직종
    //if (CB_JOBKIND.items.Count > 0) then
    //begin
    //  if (CB_JOBKIND.KeyItems[CB_JOBKIND.ItemIndex] <> '0') then
    //   Sql.Add('and APJOBKIND = '''+CB_JOBKIND.KeyItems[CB_JOBKIND.ItemIndex]+'''');
    //end;
    Open;
    RichEdit1.Text := Query1.FieldByName('STRENGTH').AsString;
    RichEdit2.Text := Query1.FieldByName('SELFINFO').AsString;
  end;
end;
{
procedure TFM_Main.CB_BumunChange(Sender: TObject);
begin
 CB_JOBKIND.Items.Clear;
  CB_JOBKIND.KeyItems.Clear;
  CB_JOBKIND.Enabled := True;
  CB_JOBKIND.Text := '전체선택';
  case StrToInt(CB_Bumun.KeyItems[CB_Bumun.itemindex]) of
    1: begin
         CB_JOBKIND.Items.Add('10: 경영기획');
         CB_JOBKIND.KeyItems.Add('10');
         CB_JOBKIND.Items.Add('11: 경영지원');
         CB_JOBKIND.KeyItems.Add('11');
         CB_JOBKIND.Items.Add('12: Finance');
         CB_JOBKIND.KeyItems.Add('12');
         CB_JOBKIND.Items.Add('전체선택');
         CB_JOBKIND.KeyItems.Add('0');
       end;
    2: begin
         CB_JOBKIND.Items.Add('20: 마케팅');
         CB_JOBKIND.KeyItems.Add('20');
         CB_JOBKIND.Items.Add('전체선택');
         CB_JOBKIND.KeyItems.Add('0');
       end;
    3: begin
         CB_JOBKIND.Items.Add('30: NW계획');
         CB_JOBKIND.KeyItems.Add('30');
         CB_JOBKIND.Items.Add('31: NW운용');
         CB_JOBKIND.KeyItems.Add('31');
         CB_JOBKIND.Items.Add('32: 영업기술지원');
         CB_JOBKIND.KeyItems.Add('32');
         CB_JOBKIND.Items.Add('33: IT');
         CB_JOBKIND.KeyItems.Add('33');
         CB_JOBKIND.Items.Add('전체선택');
         CB_JOBKIND.KeyItems.Add('0');
       end;
    4: begin
         CB_JOBKIND.Items.Add('40: 연구개발');
         CB_JOBKIND.KeyItems.Add('40');
         CB_JOBKIND.Items.Add('전체선택');
         CB_JOBKIND.KeyItems.Add('0');
       end;
    7: begin
         CB_JOBKIND.Items.Add('70: 보안CERT');
         CB_JOBKIND.KeyItems.Add('70');
         CB_JOBKIND.Items.Add('71: EDW');
         CB_JOBKIND.KeyItems.Add('71');
         CB_JOBKIND.Items.Add('72: ERP');
         CB_JOBKIND.KeyItems.Add('72');
         CB_JOBKIND.Items.Add('전체선택');
         CB_JOBKIND.KeyItems.Add('0');
       end;
    8: begin
         CB_JOBKIND.Items.Add('80: 사업');
         CB_JOBKIND.KeyItems.Add('80');
         CB_JOBKIND.Items.Add('81: 컨텐츠');
         CB_JOBKIND.KeyItems.Add('81');
         CB_JOBKIND.Items.Add('전체선택');
         CB_JOBKIND.KeyItems.Add('0');         
       end;
    0: begin
         CB_JOBKIND.Items.Clear;
         CB_JOBKIND.Text := '';
         CB_JOBKIND.Enabled := False;
       end;
  end;
end;
}
procedure TFM_Main.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  RichEdit1.Text := Query1.FieldByName('STRENGTH').AsString;
  RichEdit2.Text := Query1.FieldByName('SELFINFO').AsString;
  PageControl1.ActivePage := TABSHEET1;
end;

procedure TFM_Main.E_FullNameKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
     BT_FindClick(Nil);
end;

procedure TFM_Main.PageControl1Change(Sender: TObject);
var
  iJPG     : TJPEGImage;
  iBMP     : TBitmap;
  iPIC     : TPicture;
//  iGIF     : TGifImage;
  F        : File of char;
  iFSize    : integer;
  stream    : TMemoryStream;
  sFieldNM  : String;
  imgNM     : TImage;
begin
  if not Query1.Active then System.Exit; 
  case PageControl1.ActivePage.TabIndex of
    1: begin
         sFieldNM := 'FILETOEIC';
         imgNM    := Img_Toeic;
       end;
    2: begin
         sFieldNM := 'FILEGRAD1';
         imgNM    := Image1;
       end;
    3: begin
         sFieldNM := 'FILEGRAD2';
         imgNM    := Image2;
       end;
    4: begin
         sFieldNM := 'FILESCORE1';
         imgNM    := Image3;
       end;
    5: begin
         sFieldNM := 'FILESCORE2';
         imgNM    := Image4;
       end;
    6: begin
         sFieldNM := 'FILEBOHUN';
         imgNM    := Image5;
       end;
    7: begin
         sFieldNM := 'FILEETC';
         imgNM    := Image6;         
       end;
    0: begin
         System.exit;
       end;
  end;
  if (fileexists('C:\insa\'+sFieldNM+'\'+Query1.FieldByName(sFieldNM).AsString))  then
     begin
       // iPic := TPicture.Create;
       // iPIC.LoadFromFile('C:\insa\FilePhoto\'+FieldByName('FILEPHOTO').AsString);
        AssignFile(F,'C:\insa\'+sFieldNM+'\'+Query1.FieldByName(sFieldNM).AsString);
        Reset(F);
        iFSize := FileSize(F);
        CloseFile(F);
        if iFSize > 0 then
        begin
          try
            iJPG := TJPEGImage.Create;
            iJPG.LoadFromFile('C:\insa\'+sFieldNM+'\'+Query1.FieldByName(sFieldNM).AsString);

            imgNM.Picture.Assign(iJPG);
            iJPG.Free;
          except
            try
              iBMP := TBitmap.Create;
              iBMP.LoadFromFile('C:\insa\'+sFieldNM+'\'+Query1.FieldByName(sFieldNM).AsString);
              imgNM.Picture.Assign(iBmp);
              iBMP.Free;
            except
              {try
                iGIF := TGifImage.Create;
                iGIF.LoadFromFile('C:\insa\'+sFieldNM+'\'+Query1.FieldByName(sFieldNM).AsString);
                imgNM.Picture.Assign(iGIF);
              except
                imgNM.Enabled := False;
               // LPhotoErr.Caption := '사진포맷에러';
              end;}
              ShowMessage('사진포맷에러(GIF)');              
            end;
          end;
        end
        else begin
          imgNM.Enabled := False;
         // LPhotoErr.Caption := '사진사이즈0';
        end;
          //iBMP := TBitmap.Create;
          //iBMP.LoadFromFile('C:\insa\FilePhoto\'+FieldByName('FILEPHOTO').AsString);
          //QRImage2.Picture.Assign(iBMP);
        //iPic.Free;
      end
   else
   begin
     imgNM.Picture := nil;
    // LPhotoErr.Caption := '사진화일없슴';
   end;
end;

end.
