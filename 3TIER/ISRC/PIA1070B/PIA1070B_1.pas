{-------------------------------------------------------------------------------
  o 프로그램명
    프로그램명을 작성한다.
    (예) 프로그램명 : 개인별 인사자료 종합열람 - PIA1070B)
  o 시스템명
    시스템명을 작성한다.
    (예) 시스템명 : 종합인사정보시스템
  o 부시스템명
    부시스템명을 작성한다.(예) 부시스템명 : 인사
  o 작성자
    최초 개발자 작성자의 정보를 작성한다.
    (예) 작성자 : 이민용 [링크웨어, 사원, 011-318-9876]
  o 버전
    프로그램 현재 버전을 작성한다.(예) 버전 : 1.0
  o 작성일자
    최초 작성일자를 작성한다.(예) 작성일자 : 2004.04.22
  o 변경 이력사항
        버전 일자       작성자   변경내용                          처리명세서 반영여부
   (예) 1.1  2004.04.22 이민용   Tmax3.8 업그레이드 관련 신규개발
        1.3  2004.07.28 이민용   사진이 없는 사원도 인사정보를 보여준다.
        1.4  2004.08.03 이민용   인적사항 변경시 사번으로 조회한 경우만 변경되도록 수정
        1.8  2005.01.24 이민용    조회시 조직도 사번에 부서코드로 검색하도록 수정

 30.01   2005.06.08    변춘미  임현수  우편번호Table 이용하여 주소입력하게 수정(본적,현주소)
-------------------------------------------------------------------------------}
unit PIA1070B_1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, OnScheme, StdCtrls, OnFocusButton, OnOneInstance,
  Tmax_session, OnSkinBtn, OnShapeLabel, OnEditBaseCtrl, OnEditStdCtrl,
  OnEditBtnCtrl, OnPopupEdit, OnEditNumCtl, OnTmaxCodeEdit,
  OnEditCombo, OnLineLabel, Db, Tmax_DataSetText, OnGraphicLib, OnInsaCommon,
  TmaxFunc, OnTmaxPersonEdit, OnTmaxDeptEdit, Pass, MemDS,
  DBAccess, Ora, OraSmart, Func, Psock, PDownLoad, NMFtp;

type
 TFM_Main = class(TForm)
    SF_Main      : TOnSchemeForm;
    PA_MainPanel : TPanel;
    PA_Buttons   : TPanel;
    BT_Exit      : TOnFocusButton;
    TMaxSession: TTMaxSession;
    PA_Client: TPanel;
    PA_MenuSelect: TPanel;
    LA_Help: TLabel;
    Image2: TImage;
    BT_Find: TOnFocusButton;
    Pa_Left: TPanel;
    Shape6: TShape;
    Shape5: TShape;
    Label1: TLabel;
    ED_payclnm: TOnShapeLabel;
    ED_payranm: TOnShapeLabel;
    ED_orgempdate: TOnShapeLabel;
    ED_pstatenm: TOnShapeLabel;
    ED_paycldate: TOnShapeLabel;
    Label6: TLabel;
    ED_korname: TOnShapeLabel;
    ED_empno: TOnWinPopupEdit;
    SB_Tab1: TOnSkinButton;
    SB_Tab2: TOnSkinButton;
    SB_Tab3: TOnSkinButton;
    SB_Tab4: TOnSkinButton;
    SB_Tab5: TOnSkinButton;
    SB_Tab6: TOnSkinButton;
    SB_Tab7: TOnSkinButton;
    SB_Tab8: TOnSkinButton;
    SB_Tab9: TOnSkinButton;
    SB_Tab10: TOnSkinButton;
    SB_Tab11: TOnSkinButton;
    QR_pimpmas: TTMaxDataSet;
    QR_adddept: TTMaxDataSet;
    QR_ADPAYR: TTMaxDataSet;
    TDml: TTMaxDataSet;
    ED_cpayradate: TOnShapeLabel;
    QR_Image: TTMaxDataSet;
    ED_dept: TOnWinPopupEdit;
    QR_Com: TTMaxDataSet;
    Shape4: TShape;
    IM_empno: TImage;
    BT_PicUpload: TOnFocusButton;
    PicPath: TOnSectionLabel;
    BT_SelfEmp: TOnFocusButton;
    SB_Tab12: TOnSkinButton;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BT_ExitClick(Sender: TObject);
    procedure SB_TabSelectClick(Sender: TObject);
    procedure BT_FindClick(Sender: TObject);
    procedure ED_empnoKeyPress(Sender: TObject; var Key: Char);
    procedure ED_empnoCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure ED_empnoInitPopup(Sender: TObject);
    procedure ED_deptCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure ED_deptInitPopup(Sender: TObject);
    procedure BT_PicUploadClick(Sender: TObject);
    procedure BT_SelfEmpClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormShow(Sender: TObject);


  private
    { Private declarations }
    FL_Start        : Boolean;
    FL_Loading      : Boolean;
    startYN         : Boolean;
    ED_empnoEnable  : Boolean;

    SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String;

    procedure PL_ShowPanel(APanel: TPanel);
    procedure PHint_mail;
    function Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String) : Boolean;

  public
    { Public declarations }
    FG_family    : string;  // 가족등록 버튼 활성화 여부
    FG_pempno    : String;  // 작업자 사번.
    FG_Grade     : String;
    FG_CurEmpno  : String;
    FG_CurTag    : Integer;
    FG_date      : String;
    FG_Group     : String;

    FG_PrgGrade  : String;
    FG_empdate   : String;
    // 권한체크용 작업자 사원정보
    FG_payrayn     : String;
    FG_jobpayrayn  : String;
    FG_deptcode    : String;
    FG_jobdept     : String;
    FG_boncode     : String;
    FG_extcode     : String;
    FG_sectcode    : String;
    FG_fieldcode   : String;
    FG_deptlevel   : String;
    FG_paycl       : string; //민용
    FG_orgnum      : string; //민용
    // 권한체크용 입력사번 사원정보
    FGIn_payrayn   : String;
    FGIn_jobpayrayn: string;
    FGIn_jobdept   : String;
    FGIn_boncode   : String;
    FGIn_extcode   : String;
    FGIn_sectcode  : String;
    FGIn_fieldcode : String;
    FGIn_deptlevel : String;
    FGIn_empno     : string; //민용
    FGIn_orgnum    : string; //민용
    FGIn_deptcode  : string; //민용
    AFGIn_deptcode  : string; //민용
    //최초 입력 사원정보
    FFG_paycl      : string;
    FFG_payrayn    : string;
    FFG_deptlevel  : string;
    FFG_deptcode   : string;
    FFG_jobpayrayn : string;
    FFG_payranm    : string; 

    // 겸직부서 체크
    addept   : array[0..1] of string;
    addept1  : string;
    addept2  : string;

    payrachdate    : String;
    SRabasdate     : String;
    SFrRabasdate   : String;
    SToRabasdate   : String;

    function  PL_Get_Image : Boolean;
    function  PL_Get_Code(Acodeid, Acodeno : String) : String;
    function  PL_Get_Dept(Acodeid, Acodeno : String) : string;
    procedure PL_Com_Contructor;
    function  RemoveSpecialChar(sSrc: string): string;
  end;

var
  FM_Main: TFM_Main;

implementation

uses PIA1070B_emp,PIA1070B_dept, PIA1070B_2, PIA1070B_3, PIA1070B_4, PIA1070B_5, PIA1070B_6, PIA1070B_7,  //file_ftpSend,
     PIA1070B_pic, PIA1070B_9;

{$R *.DFM}

function TFM_Main.PL_Get_Code(Acodeid, Acodeno : String) : String;
begin
  Result := '';
  if Trim(Acodeno) = '' then  System.Exit;
  FM_Tmax           := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := TMaxSession;
  Result            := FM_Tmax.GetData('codename' ,Acodeid,Acodeno);
end;

function TFM_Main.PL_Get_Dept(Acodeid, Acodeno : String) : String;
begin
  Result := '';
  if Trim(Acodeno) = '' then System.Exit;
  FM_Tmax           := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := TMaxSession;
  Result            := FM_Tmax.GetData('deptname',Acodeid,Acodeno);
end;

procedure TFM_Main.PL_ShowPanel(APanel: TPanel);
var
  FL_I     : Integer;
  AControl : TControl;
begin
  APanel.Parent  := PA_Client;
  APanel.Left    := 0;
  APanel.Top     := 0;
  APanel.Visible := True;
  APanel.Perform(WM_PAINT,0,0);

  for FL_I := 0 to PA_Client.ControlCount - 1 do
    begin
      AControl := PA_Client.Controls[FL_I];
      if (AControl is TPanel) and (AControl <> APanel) then
        AControl.Visible := False;
    end;
end;

procedure TFM_Main.FormCreate(Sender: TObject);
begin
  FL_Start := True;
  startYN  := True;

  FM_SubForm1 := nil;
  FM_SubForm2 := nil;
  FM_SubForm3 := nil;
  FM_SubForm4 := nil;
  FM_SubForm5 := nil;
  FM_SubForm6 := nil;
  FM_SubForm9 := nil;

  FG_CurEmpno := '';
  FG_CurTag   := 1;

  ///////////////////////////////////////////////////////////////////////
  //for test by hjku
  //TMaxSession.EnvFileName := 'd:\src\newhana.env';
  TMaxSession.EnvFileName := GetHomeDir+'\newhana.env';
  TMaxSession.LabelName   := 'HANAROHPER';
  TMaxSession.Connect  := False;

  try
    TMaxSession.Connect := True;
  except
    Application.MessageBox(PChar('APP서버 접속 실패2'),'에러',mb_ok);
    Application.Terminate;
    Exit;
  end;

  //2016.06.15.hjku.. 패러미터 변수 읽어오기 추가..
  VarLoading;    

  //2013.11. Add 파라미터와 비교하여 암호 다르면 접속 막음.
  FM_Tmax := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := TMaxSession;
  if FM_Tmax.PassWordChk(Hinsa_Param(cmdline,1), Hinsa_Param(cmdline,3)) = 0 then
    Application.Terminate;

  ///////////////////////////////////////////////////////////////////////
end;

procedure TFM_Main.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := True;
end;

procedure TFM_Main.BT_ExitClick(Sender: TObject);
begin
  Close;
end;

procedure TFM_Main.SB_TabSelectClick(Sender: TObject);
begin

  if FL_Loading then
    System.Exit;

  SB_Tab1.BtnDown  := False;
  SB_Tab2.BtnDown  := False;
  SB_Tab3.BtnDown  := False;
  SB_Tab4.BtnDown  := False;
  SB_Tab5.BtnDown  := False;
  SB_Tab6.BtnDown  := False;
  SB_Tab7.BtnDown  := False;
  SB_Tab8.BtnDown  := False;
  SB_Tab9.BtnDown  := False;
  SB_Tab10.BtnDown := False;
  SB_Tab11.BtnDown := False;
  SB_Tab12.BtnDown := False;

  if FM_SubForm1 <> nil then
    begin
      FM_SubForm1.Free;
      FM_SubForm1 := nil;
    end;

  if FM_SubForm2 <> nil then
    begin
      FM_SubForm2.Free;
      FM_SubForm2 := nil;
    end;

  if FM_SubForm3 <> nil then
    begin
      FM_SubForm3.Free;
      FM_SubForm3 := nil;
    end;

  if FM_SubForm4 <> nil then
    begin
      FM_SubForm4.Free;
      FM_SubForm4 := nil;
    end;

  if FM_SubForm5 <> nil then
    begin
      FM_SubForm5.Free;
      FM_SubForm5 := nil;
    end;

  if FM_SubForm6 <> nil then
    begin
      FM_SubForm6.Free;
      FM_SubForm6 := nil;
    end;
  if FM_SubForm9 <> nil then
    begin
      FM_SubForm9.Free;
      FM_SubForm9 := nil;
    end;

  FG_CurTag := TComponent(Sender).Tag;
  case TComponent(Sender).Tag of
   1 : begin
         if FM_SubForm1 = nil then
           Application.CreateForm(TFM_SubForm1, FM_SubForm1);
         FM_SubForm1.Insa_Session := TMaxSession;
         FM_SubForm1.PL_InitForm;

         PL_ShowPanel(FM_SubForm1.PA_Work1);
       end;
   2 : begin
         if FM_SubForm2 = nil then
           Application.CreateForm(TFM_SubForm2, FM_SubForm2);
         FM_SubForm2.Insa_Session := TMaxSession;
         FM_SubForm2.PL_InitForm;

         PL_ShowPanel(FM_SubForm2.PA_Work1);
       end;
   3 : begin
         if FM_SubForm3 = nil then
           Application.CreateForm(TFM_SubForm3, FM_SubForm3);
         FM_SubForm3.FG_Gubun     := '학력사항';
         FM_SubForm3.Insa_Session := TMaxSession;
         FM_SubForm3.PL_InitForm;

         PL_ShowPanel(FM_SubForm3.PA_Work1);
       end;
   4 : begin
         if FM_SubForm3 = nil then
           Application.CreateForm(TFM_SubForm3, FM_SubForm3);
         FM_SubForm3.FG_Gubun     := '비정규 학력사항';
         FM_SubForm3.Insa_Session := TMaxSession;
         FM_SubForm3.PL_InitForm;

         PL_ShowPanel(FM_SubForm3.PA_Work1);
       end;
   5 : begin
         if FM_SubForm3 = nil then
           Application.CreateForm(TFM_SubForm3, FM_SubForm3);
         FM_SubForm3.FG_Gubun     := '자격사항';
         FM_SubForm3.Insa_Session := TMaxSession;
         FM_SubForm3.PL_InitForm;

         PL_ShowPanel(FM_SubForm3.PA_Work1);
       end;
   6 : begin
         if FM_SubForm3 = nil then
           Application.CreateForm(TFM_SubForm3, FM_SubForm3);
         FM_SubForm3.FG_Gubun     := '경력사항';
         FM_SubForm3.Insa_Session := TMaxSession;
         FM_SubForm3.PL_InitForm;

         PL_ShowPanel(FM_SubForm3.PA_Work1);
       end;
   7 : begin
         if FM_SubForm3 = nil then
           Application.CreateForm(TFM_SubForm3, FM_SubForm3);
         FM_SubForm3.FG_Gubun     := '산휴병가사항';
         FM_SubForm3.Insa_Session := TMaxSession;
         FM_SubForm3.PL_InitForm;

         PL_ShowPanel(FM_SubForm3.PA_Work1);
       end;
   8 : begin
         if FM_SubForm4 = nil then
           Application.CreateForm(TFM_SubForm4, FM_SubForm4);
         FM_SubForm4.Insa_Session := TMaxSession;
         FM_SubForm4.PL_InitForm;

         PL_ShowPanel(FM_SubForm4.PA_Work1);
       end;
   9 : begin
         if FM_SubForm5 = nil then
           Application.CreateForm(TFM_SubForm5, FM_SubForm5);
         FM_SubForm5.Insa_Session := TMaxSession;
         FM_SubForm5.PL_InitForm;

         PL_ShowPanel(FM_SubForm5.PA_Work1);
       end;
   10 : begin
         if FM_SubForm6 = nil then
           Application.CreateForm(TFM_SubForm6, FM_SubForm6);
         FM_SubForm6.Insa_Session := TMaxSession;
         FM_SubForm6.PL_InitForm;

         PL_ShowPanel(FM_SubForm6.PA_Work1);
       end;
   11 : begin
         if FM_SubForm3 = nil then
           Application.CreateForm(TFM_SubForm3, FM_SubForm3);
         FM_SubForm3.FG_Gubun     := '인사평가사항';
         FM_SubForm3.Insa_Session := TMaxSession;
         FM_SubForm3.PL_InitForm;

         PL_ShowPanel(FM_SubForm3.PA_Work1);
       end;
   12: begin
         if FM_SubForm9 = nil then
           Application.CreateForm(TFM_SubForm9, FM_SubForm9);
         FM_SubForm9.Insa_Session := TMaxSession;
         FM_SubForm9.PL_InitForm;
//         FM_SubForm9.FormShow;

         PL_ShowPanel(FM_SubForm9.PA_Work1);
       end;
  end;

  if ED_empno.Text <> '' then
    BT_FindClick(Sender);
    ED_empno.Hint:=ED_empno.text;

  TOnSkinButton(Sender).BtnDown := True;

  //사용자 권한 체크 로직,
  if (copy(FG_Grade,2,1) <= 'C')  then  // 관리자, 사장
    begin
      system.Exit;
    end
  else if (FG_jobpayrayn = 'Y') or (trim(FFG_payranm) = 'PL') then //보임자이거나 PL이면
    begin
      ED_empno.ReadOnly := True;
      ED_empno.Enabled  := True;
    end
  else if ((copy(FG_Grade,2,1) > 'C') and (copy(FG_paycl,1,1) <> 'A') and (FG_payrayn <> 'Y'))  then  // 관리자도 아니고, 임원, 보임자도 아닌 일반사원일때 자신의 정보만 보여준다.
    begin
      if ED_empnoEnable = True then     // ED_empnoKeyPress이벤트에서  ED_empnoEnable값을 받아온다.
        begin
          ED_empno.Enabled := True;
        end
      else if ED_empnoEnable = False then
        begin
          ED_empno.Enabled := False;
        end;
    end;
end;

function TFM_Main.PL_Get_Image : Boolean;
var
  FL_Image   : TStream;
  GifHeader  : TOnGifHeader;
  JpegHeader : TOnJpegHeader;
  FL_Sql     : String;
begin
  Result := False;
  Hinsa_InitComponent(Self,99);
  IM_empno.Picture := nil;
  QR_Image.Close;
  with QR_Image do
    begin
      ParamInfo[0].Value := ED_empno.Text;
      Open;
      if QR_Image.RecordCount = 0 then
        begin
          Close;
          System.Exit;
        end;

      if FG_pempno = ED_empno.Text then  // 작업자 사번 = 최초 입력자 사번
      begin
          FFG_paycl      := FieldByName('paycl').AsString;
          FFG_payrayn    := FieldByName('payrayn').AsString;
          FFG_deptlevel  := FieldByName('deptlevel').AsString;
          FFG_deptcode   := FieldByName('deptcode').AsString;
          FFG_jobpayrayn := FieldByName('jobpayrayn').AsString;
          FFG_payranm   := FieldByName('payranm').AsString;
          FG_jobdept   := FieldByName('jobdept').AsString;
      end;

          FG_payrayn   := FieldByName('payrayn').AsString;
          FG_jobpayrayn:= FieldByName('jobpayrayn').AsString;
          FG_deptcode  := FieldByName('deptcode').AsString;
          //FG_jobdept   := FieldByName('jobdept').AsString;
          FG_boncode   := FieldByName('boncode').AsString;
          FG_extcode   := FieldByName('extcode').AsString;
          FG_sectcode  := FieldByName('sectcode').AsString;
          FG_fieldcode := FieldByName('fieldcode').AsString;
          FG_deptlevel := FieldByName('deptlevel').AsString;
          FG_empdate   := FieldByName('empdate').AsString;
          //민용
          FG_paycl     := FieldByName('paycl').AsString;
          ED_dept.text               := FieldByName('deptcode').AsString;
          ED_korname.ValueCaption    := FieldByName('korname').AsString;
          ED_pstatenm.ValueCaption   := FieldByName('pstatenm').AsString;
          ED_payclnm.ValueCaption    := FieldByName('payclnm').AsString;
          ED_payranm.ValueCaption    := FieldByName('payranm').AsString;
          ED_orgempdate.ValueCaption := Hinsa_DisplayDate(FieldByName('orgempdate').AsString,'/');
          ED_paycldate.ValueCaption  := Hinsa_DisplayDate(FieldByName('paycldate').AsString,'/');
          ED_cpayradate.ValueCaption  := Hinsa_DisplayDate(FieldByName('cpayradate').AsString,'/');

          //사진이 없어도 사원정보를 보여 준다.
          if FieldByName('photo').AsString = '' then
            begin
              QR_Image.Close;
              Result := True;
              System.exit;
            end;
            
          try
            FL_Image := nil;
            FL_Image := TDataSet(QR_Image).CreateBlobStream(TBlobField(FieldByName('photo')),bmRead);
            FL_Image.Seek(0,soFromBeginning);
            ReadPicCheck(FL_Image, GifHeader, Sizeof(GifHeader));
            if (UpperCase(GifHeader.Signature) = 'GIF') then
              ReadGifBlob(FL_Image, IM_empno)
            else
              begin
                FL_Image.Seek(0,soFromBeginning);
                ReadPicCheck(FL_Image, JpegHeader, Sizeof(JpegHeader));
                if (JpegHeader.StartImage <> $d8ff) and (JpegHeader.Reserved <> $e0ff) then
                  IM_empno.Picture.Assign(TBlobField(FieldByName('photo')))
                else
                  ReadJpegBlob(FL_Image, IM_empno);
              end;
          finally
          end;
    end;
  QR_Image.Close;
  Result := True;
end;

procedure TFM_Main.BT_FindClick(Sender: TObject);
begin
  if ED_empno.Text = '' then
    begin
      MessageDlg('사원번호를 입력하세요...', mtInformation, [mbOK], 0);
      ED_empno.SetFocus;
      System.Exit;
    end;

  if FL_Loading then System.Exit;

  LA_Help.Caption := '데이타 조회중입니다... 잠시만기다리세요...';
  PA_Buttons.Perform(WM_PAINT,0,0);
  FL_Loading := True;

  FG_CurEmpno := ED_empno.Text;

  if (startYN = true) then
  begin
      if not PL_Get_Image then
      begin
          if Copy(FG_pempno,1,1) <> 'D' then MessageDlg('존재하지 않는 사원입니다...1', mtInformation, [mbOK], 0);
          FL_Loading := False;
          System.Exit;
      end;
  end
  else if ((startYN = false) and (ED_empno.Hint <> ED_empno.Text)) then
  begin
      if not PL_Get_Image then
      begin
          MessageDlg('존재하지 않는 사원입니다...2', mtInformation, [mbOK], 0);
          FL_Loading := False;
          System.Exit;
      end;
  end;

  startYN :=False;

  case FG_CurTag of
   1 : begin
         if FM_SubForm1 <> nil then
           begin
             FM_SubForm1.Tmpaddr            := '';       //30.01
             FM_SubForm1.Tmpaddrlen         := 0;
             FM_SubForm1.Tmpregaddr         := '';
             FM_SubForm1.Tmpregaddrlen      := 0;

             Hinsa_InitComponent(FM_SubForm1,11);
             Hinsa_InitComboBox(FM_SubForm1,11,-1);
             FM_SubForm1.PL_Select_Data;

             if ((FG_pempno = ED_empno.Text) or (Copy(FG_Grade,2,1) <= 'B')) then  // 본인 or 인사등급 A,B
               FM_SubForm1.BT_Save.Enabled:=True                                   // 인적사항저장 버튼 활성화
             else
               FM_SubForm1.BT_Save.Enabled:=False;
           end;
       end;
   2 : begin
         if FM_SubForm2 <> nil then
           begin
             FM_SubForm2.PL_Select_Data;

             if ((FG_pempno = ED_empno.Text) or (Copy(FG_Grade,2,1) <= 'B')) then  // 본인 or 인사등급 A,B
               FM_SubForm2.BT_Input.Enabled:=True                                  //가족 등록 버튼 활성화
             else
               FM_SubForm2.BT_Input.Enabled:=False;
           end;
       end;
   8 : begin
         if FM_SubForm4 <> nil then
           begin
             FM_SubForm4.PL_Select_Data;
           end;
       end;
   9 : begin
         if FM_SubForm5 <> nil then
           begin
             if FM_SubForm5.FG_Gubun = 1 then
               FM_SubForm5.FG_GubunClick(FM_SubForm5.SB_Tab1);
             if FM_SubForm5.FG_Gubun = 2 then
               FM_SubForm5.FG_GubunClick(FM_SubForm5.SB_Tab2);
             if FM_SubForm5.FG_Gubun = 3 then
               FM_SubForm5.FG_GubunClick(FM_SubForm5.SB_Tab3);
           end;
       end;
   10 : begin
         if FM_SubForm6 <> nil then
           begin
             FM_SubForm6.PL_Select_Data;
           end;
       end;
   12 : begin
          if FM_SubForm9 <> nil then
          begin
            FM_SubForm9.PL_Select_Data;
          end;
       end;
   3..7, 11 :
       begin
         if FM_SubForm3 <> nil then
           FM_SubForm3.PL_Select_Data;
       end;
  end;
  LA_Help.Caption := '';
  FL_Loading := False;

end;

procedure TFM_Main.ED_empnoKeyPress(Sender: TObject; var Key: Char);
var
 orgdate  : string;
 ii       : integer;
 orgnum   : string;
 deptcode : string;
 FGIn_ejobdept : string;
begin

  if Key = #13 then
  begin
    Key := #0;
    if (copy(FG_Grade,2,1) <= 'C')  then  // 관리자, 사장
    begin
      ED_empnoEnable := True;
      BT_FindClick(Sender);
      ED_empno.Hint:=ED_empno.text;
      system.Exit;
    end;

    //jissi
    if (trim(FFG_payranm) = 'PL')  then  // PL
    begin
      ED_empno.ReadOnly := True;
      BT_FindClick(Sender);
      ED_empno.Hint:=ED_empno.text;
      system.Exit;
    end;

     //보임자이면
    with QR_pimpmas do
    begin
      Close;
      Sql.Clear;

      Sql.Text := Format(
                   'SELECT A.empno  , '+
                   '  A.korname     , '+
                   '  A.jobdept     , '+
                   '  A.deptcode    , '+ //'  decode(z.empno,null,A.jobdept,z.deptcode)     deptcode, '+//jissi 파견자 임시처리
                   '  A.orgnum      , '+
                   '  (B.deptname || '' '' || B.deptna3) deptname,  '+
                   '  A.jobplace    , '+
                   '  A.jobgun      , '+
                   '  A.jobgundate  , '+
                   '  A.jobduty     , '+
                   '  A.jobdutydate , '+
                   '  A.payclyy     , '+
                   '  A.payclmm     , '+
                   '  A.paycldd     , '+
                   '  A.comduyy     , '+
                   '  A.comdumm     , '+
                   '  A.comdudd     , '+
                   '  A.reppaycl    , '+
                   '  A.reppayfrdate, '+
                   '  A.reppaytodate, '+
                   '  A.apdpaydunm  , '+
                   '  A.apdpayfrdate, '+
                   '  A.apdpaytodate, '+
                   '  A.actpaydunm  , '+
                   '  A.actpayfrdate, '+
                   '  A.actpaytodate, '+
                   '  A.empcode     , '+
                   '  A.empdate     , '+
                   '  A.emppaycl    , '+
                   '  A.emppaygr    , '+
                   '  A.cardate     , '+
                   '  A.empschgr    , '+
                   '  A.bcaryy      , '+
                   '  A.bcarmm      , '+
                   '  A.remark      , '+
                   '  A.retdate     , '+
                   '  A.retsayu1    , '+
                   '  A.retcont     , '+
                   '  A.otdufrdate  , '+
                   '  A.otdutodate  , '+
                   '  A.ttype       , '+
                   '  A.tjobduty    , '+
                   '  A.tcontramt   , '+
                   '  A.paygr       , '+
                   '  A.chnname     , '+
                   '  A.engname     , '+
                   '  usaage korage , '+   //만나이로 변경..
                   '  A.juminid     , '+
                   '  A.eldsonyn    , '+
                   '  A.marrigeyn   , '+
                   '  A.sex         , '+
                   '  A.holdname    , '+
                   '  A.holdrel     , '+
                   '  A.housetype   , '+
                   '  A.bornarea    , '+
                   '  A.health      , '+
                   '  A.regaddr     , '+
                   '  A.curaddr     , '+
                   '  A.zipno       , '+
                   '  A.telno       , '+
                   '  A.religion    , '+
                   '  A.habit       , '+
                   '  A.ability     , '+
                   '  A.blood       , '+
                   '  A.height      , '+
                   '  A.weight      , '+
                   '  A.armydis     , '+
                   '  A.armyfield   , '+
                   '  A.armycl      , '+
                   '  A.armykind    , '+
                   '  A.armyfrdate  , '+
                   '  A.armytodate  , '+
                   '  A.bohungubun  , '+
                   '  A.bohunnm     , '+
                   '  A.bohunrel    , '+
                   '  A.obskind     , '+
                   '  A.obsstate    , '+
                   '  A.scgubun     , '+
                   '  A.scentdate   , '+
                   '  A.scpredate   , '+
                   '  A.scenddate   , '+
                   '  A.sctermyn    , '+
                   '  A.unicode     , '+
                   '  A.unimajor    , '+
                   '  A.lschnm      , '+
                   '  A.lmajorcode  , '+
                   '  A.lschgr      , '+
                   '  A.lickind     , '+
                   '  A.licalkind   , '+
                   '  A.licgr       , '+
                   '  A.e_mail      , '+
                   '  A.birthday    , '+
                   '  A.birthgubun  , '+
                   '  A.groupempdate, '+
                   '  A.groupcompany, '+
                   '  A.skemail     , '+
                   '  A.offitel     , '+
                   '  A.tcompany      '+
                   '  FROM pimpmas A, pycdept B        '+      //, pzdepth15 z
                   ' WHERE A.empno = ''%s''                         '+
//                     '   AND A.empno    = z.empno(+)                  '+
                   '   AND A.orgnum   = B.orgnum                    '+
                   '   AND A.jobdept = B.deptcode',[ED_empno.text]  );
      Open;

      FGIn_deptcode := QR_pimpmas.FieldByName('deptcode').AsString;
      AFGIn_deptcode:= QR_pimpmas.FieldByName('jobdept').AsString;
      FGIn_orgnum   := QR_pimpmas.FieldByName('orgnum').AsString;
      Close;
    end;

    (* 근태결재자(특정부서 하드코딩관리) 파견자 조회*)
    with QR_adddept do
    begin
      Close;
      ServiceName := 'SHR0SSEL';
      ClearFieldInfo;
      AddField('SEL_DATA',ftString,5000);
      sql.Clear;
      sql.Add(Format('select ejobdept from pimeempfix '+
                     'where eorgnum= ''%s'' and eempno = ''%s'' '+
                     ' and useyn = ''Y'' '
                     ,[FGIn_orgnum, FG_pempno]));
      open;

      FGIn_ejobdept :=  FieldByName('SEL_DATA').AsString;
    End;

    //보임자 또는 근무지 보임자이고, 찾는 사원과 부서코드가 같을때
    if ((FFG_payrayn    = 'Y') and (FG_deptcode = FGIn_deptcode)) or
       ((FFG_jobpayrayn = 'Y') and (FG_jobdept  = FGIn_deptcode)) then
    begin
      FM_Tmax           := TFM_Tmax.Create(Self);
      FM_Tmax.T_Session := TMaxSession;
      orgdate           := Copy(FM_Tmax.GetData('sysdate','',''),1,6);
      FGIn_empno        := ED_empno.Text;

      with QR_adddept do
      begin
        Close;
        ServiceName := 'SHR0SSEL';
        ClearFieldInfo;
        AddField('SEL_DATA',ftString,5000);
        sql.Clear;
        sql.Add(Format('select nvl(empno,''ZZZZ'')  '+
                       'from pihorga                '+
                       'where orgym= ''%s''         '+
                       '  and gubun= ''1''          '+
                       '  and payrayn=''Y''         '+
                       '  and deptcode=''%s''       '+
                       '  and pstate <= ''80''      '
                       ,[orgdate,FGIn_deptcode]));
        Open;

        FGIn_empno := FieldByName('SEL_DATA').AsString;

        if ((FieldByName('SEL_DATA').AsString = FG_pempno) or (FG_pempno = ED_empno.Text))  then
        begin
          ED_empnoEnable := True;
          BT_FindClick(Sender);
          ED_empno.Hint:=ED_empno.text;
          Close;
          system.Exit;
        end;
      end;
    end;

    //보임자가 아니고 근무지보임자 일 결우
    if ((FFG_payrayn = 'N')   and  (FG_deptcode = FGIn_deptcode)) or ((FFG_jobpayrayn = 'Y') and (FG_jobdept  = FGIn_deptcode)) then
    begin
      FM_Tmax           := TFM_Tmax.Create(Self);
      FM_Tmax.T_Session := TMaxSession;
      orgdate           := Copy(FM_Tmax.GetData('sysdate','',''),1,6);
      FGIn_empno    := ED_empno.Text;

      with QR_adddept do
      begin
        Close;
        ServiceName := 'SHR0SSEL';
        ClearFieldInfo;
        AddField('SEL_DATA',ftString,5000);
        sql.Clear;
        sql.Add(Format('select nvl(empno,''ZZZZ'') '+
                       'from pimpmas               '+
                       'where pstate <= ''80''     '+
                       '  and jobpayrayn = ''Y''   '+
                       '  and jobdept = ''%s''     '
                       ,[FGIn_deptcode]));
        Open;

        FGIn_empno := FieldByName('SEL_DATA').AsString;

        if ((FieldByName('SEL_DATA').AsString = FG_pempno) or (FG_pempno = ED_empno.Text))  then
        begin
          ED_empnoEnable := True;
          BT_FindClick(Sender);
          ED_empno.Hint:=ED_empno.text;
          Close;
          system.Exit;
        end;
      end;
    end;

      if (FFG_payrayn = 'Y') or (FFG_jobpayrayn = 'Y') then //보임자 또는 근무지 보임일경우
        begin
              FM_Tmax           := TFM_Tmax.Create(Self);
              FM_Tmax.T_Session := TMaxSession;
              orgdate           := Copy(FM_Tmax.GetData('sysdate','',''),1,6);
              FGIn_empno    := ED_empno.Text;
          while true do
            begin
              with QR_adddept do
                begin
                  Close;
                  ServiceName := 'SHR0SSEL';
                  ClearFieldInfo;
                  AddField('SEL_DATA',ftString,5000);
                  sql.Clear;
                  {sql.Add(Format('select nvl(a.empno,''ZZZZ'')  '+
                                 'from pimpmas a, pihorga b     '+
                                 'where b.orgym= ''%s''         '+
                                 '  and b.gubun= ''1''          '+
                                 '  and b.empno = ''%s''        '+
                                 '  and a.orgnum = b.orgnum     '+
                                 '  and a.deptcode = b.extcode  '+
                                 '  and a.pstate <= ''80''      '
                                 ,[orgdate,FGIn_empno]));          }

                   sql.Add(Format('select nvl(extcode,''ZZZZZ'') '+
                                  'from pihorga                  '+
                                  'where orgym= ''%s''           '+
                                  '  and orgnum= ''%s''          '+
                                  '  and deptcode = ''%s''       '+
                                  'group by extcode              '
                                  ,[orgdate,FGIn_orgnum,FGIn_deptcode]));

                  try
                    Open;

                    {FGIn_empno := FieldByName('SEL_DATA').AsString;

                    if ((FieldByName('SEL_DATA').AsString = FG_pempno) or (FG_pempno = ED_empno.Text))  then
                      begin
                        ED_empnoEnable := True;
                        BT_FindClick(Sender);
                        ED_empno.Hint:=ED_empno.text;
                        Close;
                        system.Exit;
                      end
                    //else if ((QR_adddept.RecordCount =0) or (FieldByName('SEL_DATA').AsString = 'ZZZZ'))  then
                      else if (FieldByName('SEL_DATA').AsString = 'ZZZZ') then
                      begin
                        ID_Data.Gubun := data_date;
                        orgdate       := ID_Data.data;
                        orgdate       := Copy(orgdate,1,6);          }

                    FGIn_deptcode := FieldByName('SEL_DATA').AsString;

                    // 2006. 02. 22. 추가
                    if FFG_deptcode = 'A0000' then
                    //if FGIn_deptcode = 'A0000' then
                    begin
                        ED_empnoEnable := True;
                        BT_FindClick(Sender);
                        ED_empno.Hint:=ED_empno.text;
                        system.Exit;
                        Close;
                    end;

                    if ((FFG_deptcode = FieldByName('SEL_DATA').AsString) or (FG_pempno = ED_empno.Text))  then
                      begin
                        ED_empnoEnable := True;
                        BT_FindClick(Sender);
                        ED_empno.Hint:=ED_empno.text;
                        system.Exit;
                        Close;
                    end
                    else if ((QR_adddept.RecordCount =0) or (FieldByName('SEL_DATA').AsString = 'ZZZZZ')
                             or (AFGIn_deptcode <> FieldByName('SEL_DATA').AsString))  then
                    begin
                         FM_Tmax           := TFM_Tmax.Create(Self);
                         FM_Tmax.T_Session := TMaxSession;
                         orgdate           := Copy(FM_Tmax.GetData('sysdate','',''),1,6);

                          with QR_adddept do
                            begin
                              Close;
                              ServiceName := 'SHR0SSEL';
                              ClearFieldInfo;
                              AddField('SEL_DATA',ftString,5000);
                              sql.Clear;
                              sql.Add(Format('select deptcode from pihorga '+
                                             'where orgym= ''%s'' and empno = ''%s'' '+
                                             'and ( adpayrayn = ''Y'' or payrayn = ''Y'') '+
                                             ' and gubun =''0'' '
                                             ,[orgdate,FG_pempno]));
                              try
                                Open;

                                if QR_adddept.RecordCount = 0 then
                                  begin
                                    Close;
                                    MessageDlg('권한이 없습니다1...', mtInformation, [mbOK], 0);
                                    ED_empno.Text:=FG_CurEmpno;
                                    //ED_empnoEnable := False;
                                    system.Exit;
                                  end;

                                ii := 0;
                                while not QR_adddept.Eof do
                                 begin
                                   addept[ii] := QR_adddept.FieldByName('SEL_DATA').AsString;
                                   QR_adddept.Next;
                                   Inc(ii);
                                 end;
                                    addept1 := addept[0];
                                    addept2 := addept[1];
                                except
                                  addept[ii]   := '';
                                  QR_adddept.Close;
                                  system.Exit;
                              end; // try .. end
                            end;   //with begin .. end

                            if (addept1 = AFGIn_deptcode) or (addept2 = AFGIn_deptcode) then
                            begin
                                ED_empnoEnable := True;
                                BT_FindClick(Sender);
                                ED_empno.Hint:=ED_empno.text;
                                system.Exit;
                            end;

                            orgnum := FG_orgnum;
                            deptcode:=AFGIn_deptcode;

                            while true do
                            begin
                             with QR_ADPAYR  do begin
                               Close;
                               ServiceName := 'SHR0SSEL';
                               ClearFieldInfo;
                               AddField('SEL_DATA',ftString,5000);
                               sql.Clear;
                               sql.Add(Format('select nvl(extcode,''ZZZZ'') from pycdept    '+
                                              'where orgnum= ''%s'' and deptcode = ''%s''   '
                                              ,[orgnum, deptcode]));

                               try
                                Open;

                                deptcode := FieldByName('SEL_DATA').AsString;
                                //if deptcode = 'G0000' then deptcode := 'G00K0';

                                if deptcode = 'A0000' then
                                begin
                                 Close;
                                 MessageDlg('권한이 없습니다2...', mtInformation, [mbOK], 0);
                                 ED_empno.Text:=FG_CurEmpno;
                                 system.Exit;
                                end;

                                if  ((FM_Main.FG_jobdept = 'CKC00') or (FM_Main.FG_jobdept = 'GKC00')  or (FM_Main.FG_jobdept = 'KKC00') ) and
                                    (FM_Main.FFG_payranm = '본부장') and
                                    (copy(FieldByName('SEL_DATA').AsString,1,1) = copy(FM_Main.FG_jobdept,1,1))    then
                                begin
                                  ED_empnoEnable := True;
                                  BT_FindClick(Sender);
                                  ED_empno.Hint:=ED_empno.text;
                                  Close;
                                  system.Exit;
                                end
                                //else if ((FieldByName('SEL_DATA').AsString = addept1) or (FieldByName('SEL_DATA').AsString = addept2))  then
                                else if ((deptcode = addept1) or (FieldByName('SEL_DATA').AsString = addept2))  then
                                begin
                                  ED_empnoEnable := True;
                                  BT_FindClick(Sender);
                                  ED_empno.Hint:=ED_empno.text;
                                  Close;
                                  system.Exit;
                                end
                                else if ((FGIn_deptcode = FGIn_ejobdept) or (AFGIn_deptcode  = FGIn_ejobdept)) then (* 근태결재자 - 특정부서 하드코딩관리*)
                                begin
                                  ED_empnoEnable := True;
                                  BT_FindClick(Sender);
                                  ED_empno.Hint:= ED_empno.text;
                                  Close;
                                  system.Exit;
                                end
                                else if (FieldByName('SEL_DATA').AsString = '=--')  then
                                begin
                                  Close;
                                  MessageDlg('권한이 없습니다3...', mtInformation, [mbOK], 0);
                                  ED_empno.Text:=FG_CurEmpno;
                                  //ED_empnoEnable := False;
                                  system.Exit;
                                end;

                                except
                                   Close;
                                   system.Exit;
                                end;
                               end;
                            end;  // while loop
                         Close;
                         system.Exit;
                      end;
                    except
                       Close;
                       system.Exit;
                  end;   // try .. end
                   Close;
                   MessageDlg('권한이 없습니다4...', mtInformation, [mbOK], 0);
                   ED_empno.Text:=FG_CurEmpno;
                   system.Exit;
                end;     //with begin .. end
           end;  // while begin .. end
        end; //begin .. end
   end;     // if .. end
end; //begin .. end

procedure TFM_Main.ED_empnoCloseUp(Sender: TObject; var Text: String; var Accept: Boolean);
var
  FL_Text : String;
  tmp_key : char;
begin
  tmp_key := #13;
  FL_Text := TOnWinPopupEdit(Sender).Text;
  if Accept then
    begin
      TOnWinPopupEdit(Sender).Text := FM_empno.QR_pimpmas.FieldByName('empno').AsString;
      ED_empnoKeyPress(Sender, tmp_key);
      Accept := False;
    end;
  TOnWinPopupEdit(Sender).PopupControl := nil;
end;

procedure TFM_Main.ED_empnoInitPopup(Sender: TObject);
begin
  FM_empno.Insa_Session := TMaxSession;
  FM_empno.Edit         := TOnWinPopupEdit(Sender);
  TOnWinPopupEdit(Sender).PopupControl := FM_empno;
  FM_empno.BE_Key.text  := '';
  FM_empno.Part_search;
end;


procedure TFM_Main.ED_deptCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
var
  FL_Text : String;
begin
  FL_Text := TOnWinPopupEdit(Sender).Text;
  if Accept then
    begin
      TOnWinPopupEdit(Sender).Hint := FM_Dept.QR_cod.FieldByName('deptname').AsString + ' ' +
                                      FM_Dept.QR_cod.FieldByName('deptna3').AsString;
      TOnWinPopupEdit(Sender).Text := FM_Dept.QR_cod.FieldByName('deptcode').AsString;
      Accept := False;
    end;
  TOnWinPopupEdit(Sender).PopupControl := nil;
end;

procedure TFM_Main.ED_deptInitPopup(Sender: TObject);
begin
  FM_Dept.QR_Com.Session := TMaxSession;
  FM_Dept.QR_Cod.Session := TMaxSession;
  FM_Dept.FG_empno       := FG_pempno;
  FM_Dept.FG_deptcode    := ED_dept.Text;
  FM_Dept.FG_date        := Copy(FG_date,1,8);
  FM_Dept.FG_Grade       := FG_Grade;        //Self.

  TOnWinPopupEdit(Sender).PopupControl := FM_Dept;
  FM_Dept.Edit           := TOnWinPopupEdit(Sender);
  FM_Dept.BE_Key.text    := '';
  FM_Dept.PG_Get_Dept;
  ed_empno.Text          := '';
end;

procedure TFM_Main.PL_Com_Contructor;
begin
  with QR_com do
    begin
      Close;
      ServiceName := 'HINSA_select';
      ClearFieldInfo;
      AddField('field1'  , ftString, 100);
      AddField('field2'  , ftString, 100);
      AddField('field3'  , ftString, 100);
      AddField('field4'  , ftString, 100);
      AddField('field5'  , ftString, 100);
      Sql.Clear;
    end;
end;

procedure TFM_Main.BT_PicUploadClick(Sender: TObject);
var
     ServerFileName, RetMsg : String;
     MemoryStream : TMemoryStream;
begin
///  jissi 2008.07.04 사진 저장할 수 있도록
     LA_Help.Caption := '';

      //2017.02.09.hjku.. 인사담당자2(G012) 권한 추가 .. 김진호M요청(SR-1702-0172)
     //if not ((FG_Group = 'G001') or (FG_Group = 'G011')) then
     if not ((FG_Group = 'G001') or (FG_Group = 'G011') or (FG_Group = 'G012')) then
     begin
         if  (ED_empno.Text <> FG_Pempno) then
         begin
              MessageDlg('권한이 없습니다5...', mtInformation, [mbOK], 0);
              system.Exit;
         end;
     end;

{/// jissi 잠시 막아놈~!
     Showmessage('CI변경에 따른 사원증 제작과 관련한 사진 UpLoad 기한이 종료 되었습니다.'+#13+ #13);
     system.Exit;

}
     FileListForm := TFileListForm.Create(self);
     Try
       FileListForm.ShowModal;
       if FileExists(PicPath.Caption) = True then
       begin
         ServerFileName :=ED_empno.text+'.jpg';
         LA_Help.Caption := ' PCfile을 host로 전송하고 있습니다';

         FM_DownLoad := TFM_DownLoad.Create(Application);
         FM_DownLoad.PL_UpLoad(PicPath.Caption,'/hper/insa/hperson/data/Picture/', ServerFileName, FL_UnixIP, FL_FtpUser, FL_FtpPass);
         FM_DownLoad.ShowModal;
         MessageDlg(' Upload 하였습니다.', mtInformation, [mbOk], 0);
         LA_Help.Caption := ' PCfile을 host로 전송 하였습니다.';
       end;
     Finally
       FileListForm.Free;
     End;
end;

procedure TFM_Main.PHint_mail;
var
   MailTitle, MailBody, MailKorname : string;
   iIdx : Integer;
const
     asEmpno : array[0..2] of string[5]  = ('YC76'  ,'YC94'  ,'Z7197');//'YA17'  ,'Z113'  ,'Z983'  ,);
     asKornm : array[0..2] of string[12] = ('정미정','이효진','이희용');//'김미진','강륜종','지순미',);
//Test
//     asEmpno : array[0..1] of string[4] = ('Z983',  'Z983'  );
//     asKornm : array[0..1] of string[8] = ('지순미','지순미');
begin
     MailTitle := '[ 사원사진 Upload 안내 ] ';

     MailBody  := '안녕하십니까? '        + #13#10 +
                  '사번['+ED_empno.Text+']' + '    성명['+ED_korname.ValueCaption+']' + #13#10 +
                  '위 사원의 사진이 업로드되었습니다. ' + #13#10 +
                  '사진 확인후 Update 작업해 주시기 바랍니다. ' + #13#10 +
                  '그럼 수고하십시오.' ;


    //선택된 사용자들 메일 전송 로직
    //EAI 연동을 통한 Web Hint로 메일 발송을 위하여 PZHMAIL 테이블에 Insert...2007.08.01   dsa2000

    for iIdx := 0 to 2 do
    begin
         SendProgID  := 'PIA1070A';
         SendEmpno   := FG_Pempno;
         RcveEmpno   := asEmpno[iIdx];
         MailSubject := MailTitle;
         MailBody    := MailBody;
         ReceiveYN   := 'N';
         //if ChkReceive.Checked then ReceiveYN := 'Y';

         if not Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN) then
         begin
              MessageDlg('메일 전송이 실패 하였습니다...',mtError, [mbOk], 0);
              exit;
         end;
         next;
    end; //end of for
end;

//EAI 연동을 통한 Web Hint로 메일 발송을 위하여 PZHMAIL 테이블에 Insert...2007.08.01   dsa2000
Function TFM_Main.Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String) : Boolean;
begin
  with TDml do
  begin
       Close;
       ServiceName := 'PIB3012A_dml';
       SQL.Clear;
       SQL.Add('insert into PZHMAIL                         ');
       SQL.Add('values (to_char(sysdate,''YYYYMMDDHHMISS''),');  //SENDTIME   메일발송 작업시간
       SQL.Add('        '''+ SendProgID   +''',             ');  //SENDPROG   발송프로그램 ID
       SQL.Add('        '''+ SendEmpno    +''',             ');  //SEND_PER   발신자 사번
       SQL.Add('        '''+ RcveEmpno    +''',             ');  //RCVR_PER,  수신자 사번
       SQL.Add('        ''''                  ,             ');  //REFR_PER   불필요(종합인사)
       SQL.Add('        '''+ MailSubject  +''',             ');  //SUBJECT    메일제목
       SQL.Add('        ''''                  ,             ');  //HEADER1    불필요(종합인사)
       SQL.Add('        '''+ MailBody     +''',             ');  //BODY1      메일내용
       SQL.Add('        ''''                  ,             ');  //TAIL1      불필요(종합인사)
       SQL.Add('        '''+ ReceiveYN    +''',             ');  //RECEIVEYN  'Y' 일경우 메일 읽었을경우 송신자에게 수신확인 메일 보내주기
       SQL.Add('        ''N''                 ,             ');  //EAI_FLAG
       SQL.Add('        ''''                  )             ');  //EAI_DATE

       try
            if not Execute then
            begin
                Application.Messagebox('입력에 실패했습니다.','작업안내',mb_ok+ mb_IconStop);
            end;
       except
            Result := false;
            exit;
       end;
       Result := True;
  end;
end;

//임원들 하위부서 조회후 본인 레벨로 초기화 할때 사용. 2010.01.dsa2000
procedure TFM_Main.BT_SelfEmpClick(Sender: TObject);
begin
  ED_empno.Text := FG_pempno;
  ED_dept.text  := FFG_deptcode;
  BT_FindClick(Sender);
end;

procedure TFM_Main.FormPaint(Sender: TObject);
var
  FL_Rect : TRect;
begin
  if FL_Start then
  begin
      FL_Start := False;
      SystemParametersInfo(SPI_GETWORKAREA, 0, @FL_Rect, 0);
    //Self.SetBounds(FL_Rect.Top + 10, FL_Rect.Left + 20, Self.Width, Self.Height);
      SF_Main.Refresh;
      Application.ProcessMessages;

      // ※ 주의 : 프로그램 테스트 완료후 주석 부분을 해제 후 Rebuild해서 서버에 올린다..
      //if (ONE_App.Check) or (not ONE_App.MainCheck) then Application.Terminate;
      Application.CreateForm(TFM_empno, FM_empno);

      if Hinsa_Param(CmdLine,1) = '' then  BT_ExitClick(Sender);
      FG_pempno := Hinsa_Param(CmdLine,1);
      FG_Grade  := Hinsa_Param(CmdLine,4);
      with QR_com do
      begin
        PL_Com_Contructor;
        Sql.Text := ' select To_Char(sysdate,''YYYYMMDD'') field1,null,null,null,null from dual';
        Open;
        FG_DATE  := QR_com.FieldByName('field1').AsString;
      end;
      with QR_com do
      begin
        PL_Com_Contructor;
        Sql.Text := ' select Value3 field1, Value4 field2,null,null,null from pimvari '+
                    '  where gubun = ''00'' and sgubun = ''0001''                     ';
        Open;
        payrachdate  := QR_com.FieldByName('field1').AsString;
      end;
      with QR_com do
      begin
        PL_Com_Contructor;
        Sql.Text := ' select Value1 field1,null,null,null,null from pehrebas '+
                    '  where rabasdate = ''00000000'' and gubun = ''00'' and sgubun = ''0001''                     ';
        Open;
        sRabasdate  := QR_com.FieldByName('field1').AsString;
      end;
      with QR_com do
      begin
        PL_Com_Contructor;
        Sql.Text := ' select Value1 field1,Value2 field1,null,null,null from pehrebas '+
                    '  where rabasdate = '''+sRabasdate+'''                           '+
                    '    and gubun     = ''11''    and sgubun = ''0006''              ';
        Open;
        sFrRabasdate  := QR_com.FieldByName('field1').AsString;
        sToRabasdate  := QR_com.FieldByName('field2').AsString;
      end;

      with QR_Com do
      begin
        Close;
        ServiceName := 'SHR0SSEL';
        ClearFieldInfo;
        AddField('SEL_DATA',ftString,5000);
        sql.Clear;
        sql.Add(Format('select Groupid from pymenuuser '+
                       ' Where empno =  ''%s''         '
                       ,[FM_Main.FG_pempno]));
        Open;

        FG_Group := FieldByName('SEL_DATA').AsString;
      end;

      //2017.02.09.hjku.. 인사담당자2(G012) 권한 추가 .. 김진호M요청(SR-1702-0172)
      //if (FG_Group = 'G001') or (FG_Group = 'G011') then   //if Copy(FG_Grade,1,1) > 'B'
      if (FG_Group = 'G001') or (FG_Group = 'G011') or (FG_Group = 'G012') then   //if Copy(FG_Grade,1,1) > 'B'
                      SB_Tab11.Visible := True
      else            SB_Tab11.Visible := False;

      ED_dept.ButtonWidth := 0;
      ED_dept.Enabled     := False;
      if (copy(FM_Main.FG_Grade,2,1) <= 'C') or (FG_Group = 'G002')  then
      begin
           ED_dept.ButtonWidth := 24;
           ED_dept.Enabled     := True;
      end;

      //임원들 하위부서 조회후 본인 레벨로 초기화 할때 사용. 2010.01.dsa2000
      BT_SelfEmp.Visible := False;
      if FG_Group = 'G003' then  BT_SelfEmp.Visible := True;

      ED_empno.Text := FG_pempno;  //사용자 권한 체크 로직, 최초 작업자 사번을 ED_empno.Text에 넣어서 자신의 정보를 불러온다.

      SB_TabSelectClick(SB_Tab1);//서브 폼을 불러온다.
    end;
end;

procedure TFM_Main.FormShow(Sender: TObject);
begin
  //dsa2000  2013.11. Add  평가담당자만 상향평가,인사평가 버튼 보이도록. 김현순요청.
  with QR_com do
  begin
       PL_Com_Contructor;
       Sql.Text := ' select nvl(Value1,''ZZZ''), nvl(Value2,''ZZZ''), nvl(Value3,''ZZZ''), '+
                   '        nvl(Value4,''ZZZ''), nvl(Value5,''ZZZ'')                       '+
                   '   from pehrebas                                                       '+
                   '  where rabasdate = '''+sRabasdate+'''                                 '+
                   '    and gubun     = ''11''    and sgubun = ''0005''                    ';
       Open;

       SB_Tab10.Visible := False;
       SB_Tab11.Visible := False;
       if (FG_pempno = Fields[0].AsString) or (FG_pempno = Fields[0].AsString) or
          (FG_pempno = Fields[0].AsString) or (FG_pempno = Fields[0].AsString) or
          (FG_pempno = Fields[0].AsString) or (copy(FG_pempno,1,1) = 'D') then
       begin
            SB_Tab10.Visible := True;
            SB_Tab11.Visible := True;
       end;
  end;
end;

//2015.01.08.hjku. 특수문자 제외 추가..
function TFM_Main.RemoveSpecialChar(sSrc: string): string;
var
  I: integer;
begin
  result :='';
  for I:=1 to Length(sSrc) do
    if (sSrc[I] in ['A'..'Z', 'a'..'z', '0'..'9','(',')']) or (ByteType(sSrc, I)<>mbSingleByte) then
      result := result + sSrc[I];
end;

end.


