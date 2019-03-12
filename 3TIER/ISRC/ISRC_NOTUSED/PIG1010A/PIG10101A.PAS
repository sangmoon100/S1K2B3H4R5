{-------------------------------------------------------------------------------
  o 프로그램명
     BAND 조정 점수조회 : PIG1010A
  o 시스템명
     종합인사정보시스템
  o 부시스템명
     BAND-UP
  o 작성자
     정규용[2004.11.25]
  o 버전
     1.0
  o 작성일자
       2004.11.25
  o 변경 이력사항
        버전 일자       작성자   변경내용                   처리명세서 반영여부
   (예) 1.1  1999.10.10 홍길동   경조금 코드 변경에 따른    반영

-------------------------------------------------------------------------------}
unit PIG10101A;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, OnScheme, StdCtrls, OnFocusButton, OnOneInstance,
  Tmax_session, OnEditStdCtrl, Grids, OnShapeLabel, OnSkinBtn, OnLineLabel,
  OnPopupEdit, OnEditBaseCtrl, OnEditBtnCtrl, OnTmaxPersonEdit,
  OnEditNumCtl, DBGrids, OnGrDBGrid, Db, Tmax_DataSetText,
  OnInsaCommon, kpaylib, OnDBGrid, DBGridEh, shellApi, OnInternetFTP,
  OnRegistry, FileCtrl, Func, TmaxFunc;

type
  TFM_Main = class(TForm)
    SF_Main      : TOnSchemeForm;
    PA_MainPanel : TPanel;
    SB_Help      : TStatusBar;
    ED_empno: TTMaxPersonPopupEdit;
    Shape1: TShape;
    OnSectionLabel1: TOnSectionLabel;
    SB_1: TOnSkinButton;
    SB_2: TOnSkinButton;
    SB_3: TOnSkinButton;
    L_edupointYN: TLabel;
    Shape2: TShape;
    OnSectionLabel2: TOnSectionLabel;
    Shape4: TShape;
    Shape5: TShape;
    OnSectionLabel4: TOnSectionLabel;
    Shape3: TShape;
    L_Deptname: TOnShapeLabel;
    L_payclname: TOnShapeLabel;
    L_payraname: TOnShapeLabel;
    L_uppoint: TOnShapeLabel;
    L_edupoint: TOnShapeLabel;
    L_shiftreq: TOnShapeLabel;
    L_payclYYMMDD: TOnShapeLabel;
    Shape6: TShape;
    L_totscr: TOnShapeLabel;
    L_payclscr: TOnShapeLabel;
    L_total: TOnShapeLabel;
    Shape7: TShape;
    L_Qpayclscr: TOnShapeLabel;
    L_uppoint2: TOnShapeLabel;
    L_prizeNsugg: TOnShapeLabel;
    L_uppoint_2year: TOnShapeLabel;
    L_reexamcnt: TOnShapeLabel;
    Notebook1: TNotebook;
    Label3: TLabel;
    Shape8: TShape;
    TMaxSession: TTMaxSession;
    DS_SELP1: TTMaxDataSet;
    DS_SELMAIN: TTMaxDataSet;
    GRD_SELP1: TOnGrDbGrid;
    OnGrDbGrid2: TOnGrDbGrid;
    OnGrDbGrid3: TOnGrDbGrid;
    DataSource1: TDataSource;
    L_paycldate: TOnShapeLabel;
    L_uppointYN: TLabel;
    Shape9: TShape;
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
    Shape10: TShape;
    Shape15: TShape;
    Shape16: TShape;
    Label16: TLabel;
    Shape18: TShape;
    Label17: TLabel;
    Shape20: TShape;
    Label19: TLabel;
    Shape23: TShape;
    Label22: TLabel;
    Label25: TLabel;
    Label27: TLabel;
    shp_C11: TShape;
    shp_C21: TShape;
    Shape31: TShape;
    Shape32: TShape;
    Label28: TLabel;
    Shape33: TShape;
    shp_D11: TShape;
    shp_D21: TShape;
    shp_D3x: TShape;
    Shape34: TShape;
    Shape35: TShape;
    Label29: TLabel;
    Shape36: TShape;
    Shape37: TShape;
    Shape38: TShape;
    Label30: TLabel;
    Shape39: TShape;
    Shape40: TShape;
    Shape41: TShape;
    Label31: TLabel;
    Shape42: TShape;
    Shape43: TShape;
    Shape44: TShape;
    Label32: TLabel;
    Shape45: TShape;
    Shape46: TShape;
    Shape47: TShape;
    Label33: TLabel;
    Shape48: TShape;
    L_C11: TLabel;
    L_C21: TLabel;
    L_D11: TLabel;
    L_D21: TLabel;
    L_D3x: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    L1_C21: TLabel;
    L1_D11: TLabel;
    L1_D21: TLabel;
    L1_D31: TLabel;
    L1_D33: TLabel;
    L1_D35: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    L2_C21: TLabel;
    L2_D11: TLabel;
    L2_D21: TLabel;
    L2_D31: TLabel;
    L2_D33: TLabel;
    L2_D35: TLabel;
    Shape49: TShape;
    Label59: TLabel;
    Label60: TLabel;
    Shape26: TShape;
    OnSectionLabel3: TOnSectionLabel;
    Btn_Help3: TOnFocusButton;
    Btn_Help2: TOnFocusButton;
    Btn_Help1: TOnFocusButton;
    Label41: TLabel;
    Label46: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Shape52: TShape;
    DS_SELEDU: TTMaxDataSet;
    DataSource2: TDataSource;
    Shp2_C11: TShape;
    Shp2_C21: TShape;
    Shape55: TShape;
    Shape56: TShape;
    Label76: TLabel;
    Shape57: TShape;
    Shp2_D11: TShape;
    Shp2_D21: TShape;
    Shp2_D3x: TShape;
    Shape61: TShape;
    Shape62: TShape;
    Label77: TLabel;
    Shape63: TShape;
    Shape64: TShape;
    Shape65: TShape;
    Label78: TLabel;
    Shape66: TShape;
    Shape67: TShape;
    Label79: TLabel;
    Shape68: TShape;
    L5_C11: TLabel;
    L5_C21: TLabel;
    L5_D11: TLabel;
    L5_D21: TLabel;
    L5_D3x: TLabel;
    Label85: TLabel;
    Label86: TLabel;
    L3_C21: TLabel;
    L3_D11: TLabel;
    L3_D21: TLabel;
    L3_D3x: TLabel;
    L4_C21: TLabel;
    L4_D11: TLabel;
    L4_D21: TLabel;
    L4_D31: TLabel;
    L4_D33: TLabel;
    L4_D35: TLabel;
    Shape69: TShape;
    Label91: TLabel;
    Shape17: TShape;
    Shape27: TShape;
    Label58: TLabel;
    Label26: TLabel;
    Shape14: TShape;
    Label15: TLabel;
    Shape11: TShape;
    Label1: TLabel;
    Shape12: TShape;
    Label2: TLabel;
    Shape13: TShape;
    Label4: TLabel;
    Shape19: TShape;
    Label18: TLabel;
    Shape21: TShape;
    Label20: TLabel;
    Shape22: TShape;
    Label21: TLabel;
    Shape24: TShape;
    Label23: TLabel;
    Shape25: TShape;
    Label24: TLabel;
    Shape28: TShape;
    Label53: TLabel;
    Shape29: TShape;
    Label54: TLabel;
    Shape30: TShape;
    Label55: TLabel;
    Shape50: TShape;
    Label56: TLabel;
    Shape51: TShape;
    Label57: TLabel;
    Shape70: TShape;
    Label92: TLabel;
    Shape71: TShape;
    Label99: TLabel;
    Shape72: TShape;
    Label100: TLabel;
    Shape73: TShape;
    Label101: TLabel;
    Shape75: TShape;
    Label103: TLabel;
    Shape76: TShape;
    Label104: TLabel;
    Label105: TLabel;
    Shape77: TShape;
    Shape78: TShape;
    Shape53: TShape;
    Shape54: TShape;
    Shape58: TShape;
    Shape59: TShape;
    Label34: TLabel;
    Shape60: TShape;
    Shape79: TShape;
    Shape80: TShape;
    Shape81: TShape;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Panel1: TPanel;
    pnl_EduPointSum: TPanel;
    pnl_PassNcnt: TPanel;
    Label70: TLabel;
    Label71: TLabel;
    Label74: TLabel;
    L_shiftYN: TLabel;
    Edit1: TEdit;
    Label68: TLabel;
    OnShapeLabel1: TOnShapeLabel;
    OnShapeLabel2: TOnShapeLabel;
    BT_close: TOnFocusButton;
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BT_closeClick(Sender: TObject);
    procedure ED_empnoKeyPress(Sender: TObject; var Key: Char);
    procedure SB_1Click(Sender: TObject);
    procedure ED_empnoChange(Sender: TObject);
    procedure Btn_Help1Click(Sender: TObject);
    procedure Btn_Help2Click(Sender: TObject);
    procedure Btn_Help3Click(Sender: TObject);
  private
    { Private declarations }
    FL_Start   : Boolean;
    procedure SEL_MAIN;
    procedure SEL_P1;
    procedure SEL_EDU;
    //procedure ChangeShapeColor(Sender1:TObject;Sender2:TObject;Sender3:TObject);
    procedure ChangeShapeColor(spaycl : String);
    procedure HelpDownLoad(FileName : String);
    function  Csel_gfd10(p_loc: Integer): String;

  public
    { Public declarations }
    GSempno   : String;     //Login사번
    GSkorname : String;    //Login성명
    GSgrade   : String[10];    //등급
  end;
var
  FM_Main: TFM_Main;
  DBtn : array [0..10] of TButton;
  sRabasdate : String;
const
  SUBKEY    : String = 'SOFTWARE\(주) 하나로\NEW종합인사정보시스템';
implementation

{$R *.DFM}

procedure TFM_Main.FormCreate(Sender: TObject);
begin
  FL_Start := True;

  //2016.06.15.hjku.. 패러미터 변수 읽어오기 추가..
  VarLoading;    
end;

procedure TFM_Main.FormPaint(Sender: TObject);
var
  FL_Rect : TRect;
  SqlText : string;
begin
  if FL_Start then
  begin
    FL_Start := False;
    SF_Main.Refresh;
    Application.ProcessMessages;

    GSempno       := Hinsa_Param(cmdLine,1);
    GSkorname     := Hinsa_Param(cmdLine,2);
    GSgrade       := Hinsa_Param(cmdLine,4);

    if Not DirectoryExists(GetHomeDir+'\helpdoc') then forceDirectories( GetHomeDir+'\helpdoc');

    if Trim(GSkorname) = '' then
    begin
         Showmessage('잘못된 경로를 통해 들어오셨습니다. 로그인후 사용하세요!');
         Application.Terminate;
         exit;
    end;

    ///////////////////////////////////////////////////////////////////////
  //for test by hjku
  //TMaxSession.EnvFileName := 'd:\src\newhana.env';
    TMaxSession.EnvFileName := GetHomeDir+'\newhana.env';
    TMaxSession.LabelName   := 'HANAROHPER';
    TMaxSession.Connect     := False;

    try
      TMaxSession.Connect := True;
    except
      Application.MessageBox(PChar('APP서버 접속 실패'),'에러',mb_ok);
      Application.Terminate;
      Exit;
    end;

    //2013.11. Add 파라미터와 비교하여 암호 다르면 접속 막음.
    FM_Tmax := TFM_Tmax.Create(Self);
    FM_Tmax.T_Session := TMaxSession;
    if FM_Tmax.PassWordChk(Hinsa_Param(cmdline,1), Hinsa_Param(cmdline,3)) = 0 then
      Application.Terminate;
    ///////////////////////////////////////////////////////////////////////

    SqlText := 'select value1 from pimupbas     '+
               ' where rabasdate = ''00000000'' '+
               '   and upcodeno  = ''00''       ';

    with DS_SELP1 do
    begin
      close;
      ServiceName := 'PEA1060A_common';
      ClearFieldInfo;
      AddField('SEL_DATA', ftString, 300);
      ClearParamInfo;
      SQL.Text := SqlText;
      Open;

      if RecordCount > 0 then  sRabasdate  := Csel_gfd10(1)
      else
      begin
        showmessage('Tmax Error! 입니다. 담당자에게 문의하세요! ');
        Close;
      end;
    end;

    //////////////////////////////////////////////////////////////////////////

    SqlText := 'select Text2||'';''||Text3 from pimupbas '+
               ' where rabasdate = ''00000000''          ';

    with DS_SELP1 do
    begin
      close;
      ServiceName := 'PEA1060A_common';
      ClearFieldInfo;
      AddField('SEL_DATA', ftString, 300);
      ClearParamInfo;
      SQL.Text := SqlText;
      Open;
    end; //      showmessage(Csel_gfd10(1));       showmessage(Csel_gfd10(2));

    //승격담당자만 접속 가능토록.... : 일반 사용자에게 오프시에는 이 구문 막음.
    if not ( (GSempno = Csel_gfd10(1)) or (GSempno = Csel_gfd10(2)) or (Copy(GSempno,1,1) = 'D') ) then
    begin
      Application.MessageBox(PChar(' BANDUP 담당자에게 문의하세요!! '+#13+#13+ '자동종료 됩니다.'),'에러',mb_ok);
      Application.Terminate;
      Exit;
    end;

    //////////////////////////////////////////////////////////////////////////

    if not ( (GSempno = Csel_gfd10(1)) or (GSempno = Csel_gfd10(2)) or (Copy(GSempno,1,1) = 'D') ) then
    begin
      ED_empno.ButtonWidth := 0;
      ED_empno.Enabled := False;
    end
    else
      ED_empno.Enabled := True;

    ED_empno.Text := GSempno;
    ED_empno.PL_get_singledata;

    PA_MainPanel.SetFocus;

    SB_1Click(SB_1);
  end;
end;

procedure TFM_Main.SB_1Click(Sender: TObject);
begin
  SB_1.BtnDown  := False;
  SB_2.BtnDown  := False;
  SB_3.BtnDown  := False;

  TOnSkinButton(Sender).BtnDown := True;
  NoteBook1.ActivePage := 'P' + IntToStr(TOnSkinButton(Sender).Tag);

 { if  NoteBook1.ActivePage = 'P2' then
       SB_Help.Panels[1].Text := '위의 교육Point는 최종 교육Point가 아닙니다. 당해의 교육기간이 모두 끝나면 최종 교육Point가 산출 됩니다. 참고하시기 바랍니다.'
  else if NoteBook1.ActivePage = 'P1' then
       SB_Help.Panels[1].Text := '기타 문의사항은 인력개발팀 손필영(6266-4482) 문의요망';}
end;

procedure TFM_Main.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := True;
end;

procedure TFM_Main.BT_closeClick(Sender: TObject);
begin
  Close;
end;

procedure TFM_Main.ED_empnoKeyPress(Sender: TObject;
  var Key: Char);
var
    tempCompName : String;
begin
  if Key = #13 then
  begin
    ED_empno.PL_get_singledata;
  end;
end;

procedure TFM_Main.SEL_P1;
var
   i,btnIndex : integer;
begin
  with DS_SELP1 do
  begin
       ServiceName := 'PIG1010A_sel1';
       Close;

       if sRabasdate <> '20060101' then //2006년부터 사용할것 2005년도 하나로와 두루넷으로 구분하여 사용함
       begin
            Sql.Text :=
               'SELECT rabasyear,empno,korname,paycl,                                     '+
               '       payra,jobgun,orgnum,deptcode,                                       '+
               '       nvl(resultscr1,0),nvl(resultscr2,0),nvl(abilityscr1,0),             '+
               '       nvl(abilityscr2,0),nvl(finalscr,0),                                 '+
               '       finalgrade,                                                         '+
             //'       decode(sign(nvl(finalscr,0)), 1, finalgrade, NULL) finalgrade,      '+  //최종점수가 0이면 NULL
               '       nvl(uppoint,0),                                                     '+
             //'       nvl(upscore,0),                                                     '+
               '       decode(finalgrade,''S'',100,''E'',90,''G+'',85,''G0'',80,''G'',80,''G-'',75,''N'',70,''U'',60, '+
               '                                   ''A'',90,''B+'',85,''B0'',80,''B'',80,''B-'',75,''C'',70,''D'',60, NULL) upscore, '+  //최종점수가 0이면 NULL
               '       exdudays,                                                           '+
               '       decode(exdudesc,NULL,NULL,                                          '+
               '       exdudesc||''(총''||exdudays||''일) ''||substr(exfrdate,1,4)||''.''||'+
               '       substr(exfrdate,5,2)||''.''||substr(exfrdate,7,2)||''~''||          '+
               '       substr(extodate,1,4)||''.''||substr(extodate,5,2)||''.''||          '+
               '       substr(extodate,7,2)) exdudesc                                      '+
               '  FROM PEHEVHIS                                                            '+
               ' WHERE empno = '''+ ED_empno.empno + '''                                   '+
               '   AND rabasyear >= (Select substr(a.paycldate,1,4)                        '+
               '                       from pimupmas a                                     '+
               '                      where a.empno = '''+ ED_empno.empno + '''            '+
               '                        and a.rabasdate = '''+ sRabasdate + ''' )          '+
               ' ORDER BY rabasyear DESC                                                   ';
       end
       else
       begin
         if ED_empno.empno <= '1931' then
         begin   // 20060101기준
              Sql.Text :=
                 'SELECT rabasyear,empno,korname,paycl,                                     '+
                 '       payra,jobgun,orgnum,deptcode,                                       '+
                 '       nvl(resultscr1,0),nvl(resultscr2,0),nvl(abilityscr1,0),             '+
                 '       nvl(abilityscr2,0),nvl(finalscr,0),                                 '+
                 '       finalgrade,                                                         '+
//               '       decode(sign(nvl(finalscr,0)), 1, finalgrade, NULL) finalgrade,      '+  //최종점수가 0이면 NULL
                 '       nvl(uppoint,0),                                                     '+
//               '       nvl(upscore,0),                                                     '+
                 '       decode(finalgrade,''S'',100,''A'',90,''B+'',85,''B0'',80,''B'',80,''B-'',75,''C'',70,''D'',60, NULL) upscore,     '+  //최종점수가 0이면 NULL
                 '       exdudays,                                                           '+
                 '       decode(exdudesc,NULL,NULL,                                          '+
                 '       exdudesc||''(총''||exdudays||''일) ''||substr(exfrdate,1,4)||''.''||'+
                 '       substr(exfrdate,5,2)||''.''||substr(exfrdate,7,2)||''~''||          '+
                 '       substr(extodate,1,4)||''.''||substr(extodate,5,2)||''.''||          '+
                 '       substr(extodate,7,2)) exdudesc                                      '+
                 '  FROM PEHEVHIS                                                            '+
                 ' WHERE empno = '''+ ED_empno.empno + '''                                   '+
                 '   AND rabasyear >=                                                        '+
                 '                   ( select substr(c.paycldate,1,4)                        '+  //BAND-UP한 사람들도 등급을 보이게 하기위해 과거 인사마스터를 기준으로함.
                 '                     from pimupmas a, pimpmas b, pihpmas c                 '+
                 '                     where a.empno = pehevhis.empno                        '+
                 '                     and   a.empno = b.empno                               '+
                 '                     and   a.empno = c.empno                               '+
                 '                     and   c.workyymm = ''200512''                         '+
                 '                     and   a.empno = '''+ ED_empno.empno + '''             '+
                 '                     and   a.rabasdate = '''+ sRabasdate + ''' )           '+
                 ' ORDER BY rabasyear DESC                                                   ';
         end
         else
         begin
              Sql.Text :=
                 'SELECT rabasyear,empno,korname,paycl,                                     '+
                 '       payra,jobgun,orgnum,deptcode,                                       '+
                 '       nvl(resultscr1,0),nvl(resultscr2,0),nvl(abilityscr1,0),             '+
                 '       nvl(abilityscr2,0),nvl(finalscr,0),                                 '+
                 '       finalgrade,                                                         '+
//               '       decode(sign(nvl(finalscr,0)), 1, finalgrade, NULL) finalgrade,      '+  //최종점수가 0이면 NULL
                 '       nvl(uppoint,0),                                                     '+
//               '       nvl(upscore,0),                                                     '+
                 '       decode(finalgrade,''S'',100,''A'',90,''B+'',85,''B0'',80,''B'',80,''B-'',75,''C'',70,''D'',60, NULL) upscore,     '+  //최종점수가 0이면 NULL
                 '       exdudays,                                                           '+
                 '       decode(exdudesc,NULL,NULL,                                          '+
                 '       exdudesc||''(총''||exdudays||''일) ''||substr(exfrdate,1,4)||''.''||'+
                 '       substr(exfrdate,5,2)||''.''||substr(exfrdate,7,2)||''~''||          '+
                 '       substr(extodate,1,4)||''.''||substr(extodate,5,2)||''.''||          '+
                 '       substr(extodate,7,2)) exdudesc                                      '+
                 '  FROM PEHEVHIS_THRU                                                       '+
                 ' WHERE empno = '''+ ED_empno.empno + '''                                   '+
                 '   and rabasyear >=                                                        '+
                 '                   ( select substr(a.paycldate,1,4)                        '+ //BAND-UP한 사람들도 등급 보이게 하기위해 BAND-UP마스터의 직급일을 기준으로 함.
                 '                     from pimupmas_thru a, pimpmas b                       '+
                 '                     where a.empno = pehevhis_thru.empno                   '+
                 '                     and   a.empno = b.empno                               '+
                 '                     and   a.empno = '''+ ED_empno.empno + '''             '+
                 '                     and   a.rabasdate = '''+ sRabasdate + ''' )           '+
                 ' ORDER BY rabasyear DESC                                                   ';
         end;
       end;

       ClearFieldInfo;
       AddField('RABASYEAR'  , ftString, 8);
       AddField('EMPNO'      , ftString, 4);
       AddField('KORNAME'    , ftString, 12);
       AddField('PAYCL'      , ftString, 3);
       AddField('PAYRA'      , ftString, 3);
       AddField('JOBGUN'     , ftString, 2);
       AddField('ORGNUM'     , ftString, 3);
       AddField('DEPTCODE'   , ftString, 6);
       AddField('RESULTSCR1' , ftFloat,  7);
       AddField('RESULTSCR2' , ftFloat,  7);
       AddField('ABILITYSCR1', ftFloat,  7);
       AddField('ABILITYSCR2', ftFloat,  7);
       AddField('FINALSCR'   , ftFloat,  7);
       AddField('FINALGRADE' , ftString, 2);
       AddField('UPPOINT'    , ftFloat,  7);
       AddField('UPSCORE'    , ftString, 7);   //위에서 null값을 받기에 string으로 정의해줌.
       AddField('EXDUDAYS'   , ftInteger,9);
       AddField('EXDUDESC'   , ftString, 50);
       Open;
       DS_SELP1.FieldByName('RABASYEAR').Alignment  := taCenter;
       DS_SELP1.FieldByName('FINALGRADE').Alignment := taCenter;
       DS_SELP1.FieldByName('UPSCORE').Alignment    := taRightJustify;
       
  {     btnIndex := 0;
       for i:= 0 to recordCount-1 do
       begin
            if FieldByName('EXDUDAYS').AsInteger > 0 then
            begin
                 btnIndex := i;
                 DBtn[btnIndex] := TButton.Create(Self);
                 DBtn[btnIndex].Parent := Notebook1;
                 DBtn[btnIndex].Left := 833;
                 DBtn[btnIndex].Width := 79;
                 DBtn[btnIndex].Height := 21;
                 DBtn[btnIndex].Top := (GRD_SELP1.TitleSize)+(GRD_SELP1.DefaultRowHeight*btnIndex)+(3+btnIndex);
                 DBtn[btnIndex].Tag := FieldByName('RABASYEAR').AsInteger;
            end
            else btnIndex := btnIndex -1;
       end;}
  end;
end;

procedure TFM_Main.SEL_MAIN;
begin

  with DS_SELMAIN do
  begin
    ServiceName := 'PIG1010A_sel2';
    Close;

    if sRabasdate <> '20060101' then  //2005년도 아닐 경우 조회
    begin
         Sql.Text := 'SELECT A.RABASDATE,                       '+
                     '       A.EMPNO,                           '+
                     '       A.KORNAME,                         '+
                     '       A.ORGNUM,                          '+
                     '       A.DEPTCODE,                        '+
                     '       decode(A.UPYN,''Y'',B.PAYCL,A.PAYCL) PAYCL, '+
                     '       decode(A.UPYN,''Y'',B.PAYRA,A.PAYRA) PAYRA, '+
                     '       A.JOBGUN,                          '+
                     '       A.PAYCLDATE,                       '+
                     '       A.PAYCLYY,                         '+
                     '       A.PAYCLMM,                         '+
                     '       A.PAYCLDD,                         '+
                     '       nvl(A.UPPOINT,0),                  '+
                     '       nvl(A.EDUPOINT,0),                 '+
                     '       A.SHIFTREQ,                        '+
                     '       A.UPPOINTYN,                       '+
                     '       A.EDUPOINTYN,                      '+
                     '       A.SHIFTYN,                         '+
                     '       A.UPYN,                            '+
                     '       nvl(A.TOTSCR,0),                   '+
                     '       nvl(A.PAYCLSCR,0),                 '+
                     '       nvl(A.QPAYCLSCR,0),                '+
                     '       nvl(A.PRIZESCR,0),                 '+
                     '       nvl(A.SUGGSCR,0),                  '+
                     '       nvl(A.UPPOINT_2YEAR,0),            '+
                     '       A.REEXAMCNT                        '+
                     '  FROM PIMUPMAS A, PIMPMAS B              '+
                     ' WHERE A.EMPNO = B.EMPNO                  '+
                     '   AND A.EMPNO ='''+ ED_empno.empno + ''' '+
                     '   AND (A.PAYCL BETWEEN ''10'' AND ''44''  Or A.PAYCL BETWEEN ''C11'' AND ''D35'' ) '+
                     '   AND A.RABASDATE = '''+ sRabasdate + ''' ';
    end
    else
    begin     //2005년도는 두루넷과 하나로 구분 때문에 이 로직을 사용하여야함
         if ED_empno.empno <= '1931' then
         begin
            Sql.Text := 'SELECT A.RABASDATE,                       '+
                        '       A.EMPNO,                           '+
                        '       A.KORNAME,                         '+
                        '       A.ORGNUM,                          '+
                        '       A.DEPTCODE,                        '+
                        '       decode(A.UPYN,''Y'',B.PAYCL,A.PAYCL) PAYCL, '+
                        '       decode(A.UPYN,''Y'',B.PAYRA,A.PAYRA) PAYRA, '+
                        '       A.JOBGUN,                          '+
                        '       A.PAYCLDATE,                       '+
                        '       A.PAYCLYY,                         '+
                        '       A.PAYCLMM,                         '+
                        '       A.PAYCLDD,                         '+
                        '       nvl(A.UPPOINT,0),                  '+
                        '       nvl(A.EDUPOINT,0),                 '+
                        '       A.SHIFTREQ,                        '+
                        '       A.UPPOINTYN,                       '+
                        '       A.EDUPOINTYN,                      '+
                        '       A.SHIFTYN,                         '+
                        '       A.UPYN,                            '+
                        '       nvl(A.TOTSCR,0),                   '+
                        '       nvl(A.PAYCLSCR,0),                 '+
                        '       nvl(A.QPAYCLSCR,0),                '+
                        '       nvl(A.PRIZESCR,0),                 '+
                        '       nvl(A.SUGGSCR,0),                  '+
                        '       nvl(A.UPPOINT_2YEAR,0),            '+
                        '       A.REEXAMCNT                        '+
                        '  FROM PIMUPMAS A, PIMPMAS B              '+
                        ' WHERE A.EMPNO = B.EMPNO                  '+
                        '   AND A.EMPNO ='''+ ED_empno.empno + ''' '+
                        '   AND A.PAYCL BETWEEN ''10'' AND ''44''  '+
                        '   AND A.RABASDATE = '''+ sRabasdate + ''' ';
         end
         else
         begin
            Sql.Text := 'SELECT A.RABASDATE,                       '+
                        '       A.EMPNO,                           '+
                        '       A.KORNAME,                         '+
                        '       A.ORGNUM,                          '+
                        '       A.DEPTCODE,                        '+
                        '       decode(A.UPYN,''Y'',B.PAYCL,A.PAYCL) PAYCL, '+
                        '       decode(A.UPYN,''Y'',B.PAYRA,A.PAYRA) PAYRA, '+
                        '       A.JOBGUN,                          '+
                        '       A.PAYCLDATE,                       '+
                        '       A.PAYCLYY,                         '+
                        '       A.PAYCLMM,                         '+
                        '       A.PAYCLDD,                         '+
                        '       nvl(A.UPPOINT,0),                  '+
                        '       nvl(A.EDUPOINT,0),                 '+
                        '       A.SHIFTREQ,                        '+
                        '       A.UPPOINTYN,                       '+
                        '       A.EDUPOINTYN,                      '+
                        '       A.SHIFTYN,                         '+
                        '       A.UPYN,                            '+
                        '       nvl(A.TOTSCR,0),                   '+
                        '       nvl(A.PAYCLSCR,0),                 '+
                        '       nvl(A.QPAYCLSCR,0),                '+
                        '       nvl(A.PRIZESCR,0),                 '+
                        '       nvl(A.SUGGSCR,0),                  '+
                        '       nvl(A.UPPOINT_2YEAR,0),            '+
                        '       A.REEXAMCNT                        '+
                        '  FROM PIMUPMAS_THRU A, PIMPMAS B         '+
                        ' WHERE A.EMPNO = B.EMPNO                  '+
                        '   AND A.EMPNO ='''+ ED_empno.empno + ''' '+
                        '   AND A.PAYCL BETWEEN ''10'' AND ''44''  '+
                        '   and A.RABASDATE = '''+ sRabasdate + ''' ';
         end;
    end;

    Close;
    ClearFieldInfo;
    AddField('RABASDATE'    , ftString, 8);
    AddField('EMPNO'        , ftString, 4);
    AddField('KORNAME'      , ftString, 12);
    AddField('ORGNUM'       , ftString, 3);
    AddField('DEPTCODE'     , ftString, 6);
    AddField('PAYCL'        , ftString, 3);
    AddField('PAYRA'        , ftString, 3);
    AddField('JOBGUN'       , ftString, 2);
    AddField('PAYCLDATE'    , ftString, 8);
    AddField('PAYCLYY'      , ftInteger, 3);
    AddField('PAYCLMM'      , ftInteger, 3);
    AddField('PAYCLDD'      , ftInteger, 3);
    AddField('UPPOINT'      , ftFloat, 7);
    AddField('EDUPOINT'     , ftFloat, 7);
    AddField('SHIFTREQ'     , ftString, 30);
    AddField('UPPOINTYN'    , ftString, 1);
    AddField('EDUPOINTYN'   , ftString, 1);
    AddField('SHIFTYN'      , ftString, 1);
    AddField('UPYN'         , ftString, 1);
    AddField('TOTSCR'       , ftFloat, 7);
    AddField('PAYCLSCR'     , ftFloat, 7);
    AddField('QPAYCLSCR'    , ftFloat, 7);
    AddField('PRIZESCR'     , ftFloat, 7);
    AddField('SUGGSCR'      , ftFloat, 7);
    AddField('UPPOINT_2YEAR', ftFloat, 7);
    AddField('REEXAMCNT'    , ftInteger, 7);
    Open;

   // if (EOF) and (not Btn_Search.Visible) then
    if  EOF then
    begin
         MessageDlg('BAND조정 대상자가 아니거나 열람하실 BAND조정점수 내용이 없습니다.'+#13+#10+''+#13+#10+'프로그램은 [자동 종료] 됩니다.', mtWarning, [mbOK], 0);
         Self.Close;
    end;

    L_paycldate.ValueCaption := Copy(FieldByName('PAYCLDATE').AsString,1,4)+'년 '+
                                Copy(FieldByName('PAYCLDATE').AsString,5,2)+'월 '+
                                Copy(FieldByName('PAYCLDATE').AsString,7,2)+'일';
    L_uppoint.ValueCaption     := FieldByName('UPPOINT').AsString;

    if   sRabasdate <> '20060101' then L_edupoint.ValueCaption := FieldByNAME('EDUPOINT').AsString  //2005년도 아닐 경우 조회
    else                               L_edupoint.ValueCaption := ''; //2005년도에 적용안함.


    if  FieldByName('UPYN').AsString = 'Y' then
    begin
       if FieldByName('PAYCLDATE').AsString <> '' then
       //L_payclYYMMDD.ValueCaption :=  ' [' + L_payclname.ValueCaption + ']';
       L_payclYYMMDD.ValueCaption := FormatFloat('00',FieldByNAME('PAYCLYY').AsInteger) + '년'+
                                     FormatFloat('00',FieldByNAME('PAYCLMM').AsInteger) + '개월'+
                                     FormatFloat('00',FieldByNAME('PAYCLDD').AsInteger) + '일' +
                                     '(재급기준일기준)';
    end
    else
    begin
       if FieldByName('PAYCLDATE').AsString <> '' then
       L_payclYYMMDD.ValueCaption := FormatFloat('00',FieldByNAME('PAYCLYY').AsInteger) + '년 '+
                                     FormatFloat('00',FieldByNAME('PAYCLMM').AsInteger) + '개월 '+
                                     FormatFloat('00',FieldByNAME('PAYCLDD').AsInteger) + '일' +
                                     ' ['+L_payclname.ValueCaption +' '+ IntToStr(2006-StrToIntDef(Copy(FieldByName('PAYCLDATE').AsString,1,4),0))+'년차]';
    end;

    //if (FieldByName('UPYN').AsString = 'Y') then //2005년도 'C','D'등급을 'B-'로 바꿔줌. 그래서 UPYN을 쓰지못함.

    if sRabasdate <> '20060101' then  //2005년도 아닐 경우 조회 하은영
    begin
{      if (FieldByName('UPPOINTYN').AsString = 'Y') and (FieldByName('EDUPOINTYN').AsString = 'Y') then //BAND-UP, 교육 둘다 확인해야 됨
      begin}
           L_totscr.ValueCaption        := FieldByName('TOTSCR').AsString;
           L_payclscr.ValueCaption      := FieldByName('PAYCLSCR').AsString;
           L_total.ValueCaption         := FloatToStr(FieldByName('TOTSCR').AsFloat + FieldByName('PAYCLSCR').AsFloat);
           L_Qpayclscr.ValueCaption     := FieldByName('QPAYCLSCR').AsString;
           L_uppoint2.ValueCaption      := FieldByName('UPPOINT').AsString;
           L_prizeNsugg.ValueCaption    := FieldByName('PRIZESCR').AsString+' / '+FieldByName('SUGGSCR').AsString;
           L_uppoint_2year.ValueCaption := FieldByName('UPPOINT_2YEAR').AsString;
           L_reexamcnt.ValueCaption     := FieldByName('REEXAMCNT').AsString;
{      end
      else
      begin
           L_totscr.ValueCaption        := '';
           L_payclscr.ValueCaption      := '';
           L_total.ValueCaption         := '';
           L_Qpayclscr.ValueCaption     := '';
           L_uppoint2.ValueCaption      := '';
           L_prizeNsugg.ValueCaption    := '';
           L_uppoint_2year.ValueCaption := '';
           L_reexamcnt.ValueCaption     := '';
      end;}
    end
    else
    begin
{      if (FieldByName('UPPOINTYN').AsString = 'Y') then //2005년도 사용함
      begin}
           L_totscr.ValueCaption        := FieldByName('TOTSCR').AsString;
           L_payclscr.ValueCaption      := FieldByName('PAYCLSCR').AsString;
           L_total.ValueCaption         := FloatToStr(FieldByName('TOTSCR').AsFloat + FieldByName('PAYCLSCR').AsFloat);
           L_Qpayclscr.ValueCaption     := FieldByName('QPAYCLSCR').AsString;
           L_uppoint2.ValueCaption      := FieldByName('UPPOINT').AsString;
           L_prizeNsugg.ValueCaption    := FieldByName('PRIZESCR').AsString+' / '+FieldByName('SUGGSCR').AsString;
           L_uppoint_2year.ValueCaption := FieldByName('UPPOINT_2YEAR').AsString;
           L_reexamcnt.ValueCaption     := FieldByName('REEXAMCNT').AsString;
{      end
      else
      begin
           L_totscr.ValueCaption        := '';
           L_payclscr.ValueCaption      := '';
           L_total.ValueCaption         := '';
           L_Qpayclscr.ValueCaption     := '';
           L_uppoint2.ValueCaption      := '';
           L_prizeNsugg.ValueCaption    := '';
           L_uppoint_2year.ValueCaption := '';
           L_reexamcnt.ValueCaption     := '';
      end;}
    end;

    // 임시로 모든 대상지들 BAND-UP점수 동점자처리기준 다 열어줌. JSH
    {L_totscr.ValueCaption       := FieldByName('TOTSCR').AsString;
    L_payclscr.ValueCaption      := FieldByName('PAYCLSCR').AsString;
    L_total.ValueCaption         := FloatToStr(FieldByName('TOTSCR').AsFloat + FieldByName('PAYCLSCR').AsFloat);
    L_Qpayclscr.ValueCaption     := FieldByName('QPAYCLSCR').AsString;
    L_uppoint2.ValueCaption      := FieldByName('UPPOINT').AsString;
    L_prizeNsugg.ValueCaption    := FieldByName('PRIZESCR').AsString+' / '+FieldByName('SUGGSCR').AsString;
    L_uppoint_2year.ValueCaption := FieldByName('UPPOINT_2YEAR').AsString;
    L_reexamcnt.ValueCaption     := FieldByName('REEXAMCNT').AsString;}

    if FieldByName('UPPOINTYN').AsString = 'Y' then
    begin
         L_uppointYN.Caption    := '충족';
         L_uppointYN.Font.Color := clBlue;
    end
    else
    begin
         L_uppointYN.Caption := '미충족';
         L_uppointYN.Font.Color   := clRed;
    end;

    if sRabasdate = '20060101' then  //2005년도 하은영
    begin
         L_edupointYN.Caption      := '적용안함'; //'미충족';
         L_edupointYN.Font.Color   := clRed;
    end
    else
    begin
         if FieldByName('EDUPOINTYN').AsString = 'Y' then
         begin
              L_edupointYN.Caption      := '충족';
              L_edupointYN.Font.Color   := clBlue;
         end
         else
         begin
              L_edupointYN.Caption      := '미충족';
              L_edupointYN.Font.Color   := clRed;
         end;
    end;


    //전환배치 여부.  하은영
    if sRabasdate = '20060101' then  //2005년도 하은영
    begin
         L_shiftYN.Caption      := '적용안함';
         L_shiftYN.Font.Color   := clRed;
    end
    else
    begin
         L_shiftYN.Caption      := '';
         L_shiftYN.Font.Color   := clBlue;
         {if FieldByName('SHIFTYN').AsString = 'Y' then
         begin
           L_shiftYN.Caption      := '충족';
           L_shiftYN.Font.Color   := clBlue;
         end
         else begin
           L_shiftYN.Caption      := '미충족';
           L_shiftYN.Font.Color   := clRed;
         end;}
    end;
  end;
end;

procedure TFM_Main.ChangeShapeColor(spaycl : String);
begin
  shp_C11.Brush.Color :=  clSilver;
  shp_C21.Brush.Color :=  clSilver;
  shp_D11.Brush.Color :=  clSilver;
  shp_D21.Brush.Color :=  clSilver;
  shp_D3X.Brush.Color :=  clSilver;
  shp2_C11.Brush.Color :=  clSilver;
  shp2_C21.Brush.Color :=  clSilver;
  shp2_D11.Brush.Color :=  clSilver;
  shp2_D21.Brush.Color :=  clSilver;
  shp2_D3X.Brush.Color :=  clSilver;
  L_C11.Font.Color   :=  clBlack;
  L_C21.Font.Color   :=  clBlack;
  L_D11.Font.Color   :=  clBlack;
  L_D21.Font.Color   :=  clBlack;
  L_D3X.Font.Color   :=  clBlack;
  L3_C21.Font.Color   :=  clBlack;
  L3_D11.Font.Color   :=  clBlack;
  L3_D21.Font.Color   :=  clBlack;
  L3_D3X.Font.Color   :=  clBlack;
  L5_C11.Font.Color   :=  clBlack;
  L5_C21.Font.Color   :=  clBlack;
  L5_D11.Font.Color   :=  clBlack;
  L5_D21.Font.Color   :=  clBlack;
  L5_D3X.Font.Color   :=  clBlack;
  L1_C21.Font.Color :=  clBlack;
  L1_D11.Font.Color :=  clBlack;
  L1_D21.Font.Color :=  clBlack;
  L1_D31.Font.Color :=  clBlack;
  L1_D33.Font.Color :=  clBlack;
  L1_D35.Font.Color :=  clBlack;
  L4_C21.Font.Color :=  clBlack;
  L4_D11.Font.Color :=  clBlack;
  L4_D21.Font.Color :=  clBlack;
  L4_D31.Font.Color :=  clBlack;
  L4_D33.Font.Color :=  clBlack;
  L4_D35.Font.Color :=  clBlack;
  L2_C21.Font.Color :=  clBlack;
  L2_D11.Font.Color :=  clBlack;
  L2_D21.Font.Color :=  clBlack;
  L2_D31.Font.Color :=  clBlack;
  L2_D33.Font.Color :=  clBlack;
  L2_D35.Font.Color :=  clBlack;

  if (spaycl ='C11') or (spaycl ='10') then
  begin
       shp_C11.Brush.Color :=$004080FF;
       Shp2_C11.Brush.Color :=$004080FF;
       L5_C11.Font.Color :=clWhite;
       L_C11.Font.Color :=clWhite;
  end
  else if (Copy(spaycl,1,2) ='D3') or (Copy(spaycl,1,1) ='4') then
  begin
       ((Self.FindComponent('shp_D3x'))  as TShape).Brush.Color :=$004080FF;
       ((Self.FindComponent('shp2_D3x')) as TShape).Brush.Color :=$004080FF;
       ((Self.FindComponent('L_D3x'))    as TLabel).Font.Color :=clWhite;
       ((Self.FindComponent('L5_D3x'))   as TLabel).Font.Color :=clWhite;
       ((Self.FindComponent('L3_D3x'))   as TLabel).Font.Color :=$004080FF;

       if (spaycl ='D31') or (spaycl ='40')  then
       begin
           ((Self.FindComponent('L1_D31') as TLabel)).Font.Color :=$004080FF;
           ((Self.FindComponent('L2_D31') as TLabel)).Font.Color :=$004080FF;
           ((Self.FindComponent('L4_D31') as TLabel)).Font.Color :=$004080FF;
       end
       else  if (spaycl ='D33') or (spaycl ='42')  then
       begin
           ((Self.FindComponent('L1_D33') as TLabel)).Font.Color :=$004080FF;
           ((Self.FindComponent('L2_D33') as TLabel)).Font.Color :=$004080FF;
           ((Self.FindComponent('L4_D33') as TLabel)).Font.Color :=$004080FF;
       end
       else  if (spaycl ='D35') or (spaycl ='44')  then
       begin
           ((Self.FindComponent('L1_D35') as TLabel)).Font.Color :=$004080FF;
           ((Self.FindComponent('L2_D35') as TLabel)).Font.Color :=$004080FF;
           ((Self.FindComponent('L4_D35') as TLabel)).Font.Color :=$004080FF;
       end;
  end
  else if (spaycl ='C21') or (spaycl ='20') then
  begin
       ((Self.FindComponent('shp_C21'))  as TShape).Brush.Color :=$004080FF;
       ((Self.FindComponent('shp2_C21')) as TShape).Brush.Color :=$004080FF;
       ((Self.FindComponent('L_C21'))    as TLabel).Font.Color  :=clWhite;
       ((Self.FindComponent('L5_C21'))   as TLabel).Font.Color  :=clWhite;
       ((Self.FindComponent('L3_C21'))   as TLabel).Font.Color  :=$004080FF;
       ((Self.FindComponent('L1_C21')    as TLabel)).Font.Color :=$004080FF;
       ((Self.FindComponent('L2_C21')    as TLabel)).Font.Color :=$004080FF;
       ((Self.FindComponent('L4_C21')    as TLabel)).Font.Color :=$004080FF;
  end
  else if (spaycl ='D11') or (spaycl ='22') then
  begin
       ((Self.FindComponent('shp_D11'))  as TShape).Brush.Color :=$004080FF;
       ((Self.FindComponent('shp2_D11')) as TShape).Brush.Color :=$004080FF;
       ((Self.FindComponent('L_D11'))    as TLabel).Font.Color  :=clWhite;
       ((Self.FindComponent('L5_D11'))   as TLabel).Font.Color  :=clWhite;
       ((Self.FindComponent('L3_D11'))   as TLabel).Font.Color  :=$004080FF;
       ((Self.FindComponent('L1_D11')    as TLabel)).Font.Color :=$004080FF;
       ((Self.FindComponent('L2_D11')    as TLabel)).Font.Color :=$004080FF;
       ((Self.FindComponent('L4_D11')    as TLabel)).Font.Color :=$004080FF;
  end
  else if (spaycl ='D21') or (spaycl ='32') then
  begin
       ((Self.FindComponent('shp_D21'))  as TShape).Brush.Color :=$004080FF;
       ((Self.FindComponent('shp2_D21')) as TShape).Brush.Color :=$004080FF;
       ((Self.FindComponent('L_D21'))    as TLabel).Font.Color := clWhite;
       ((Self.FindComponent('L5_D21'))   as TLabel).Font.Color :=clWhite;
       ((Self.FindComponent('L3_D21'))   as TLabel).Font.Color :=$004080FF;
       ((Self.FindComponent('L1_D21')    as TLabel)).Font.Color :=$004080FF;
       ((Self.FindComponent('L2_D21')    as TLabel)).Font.Color :=$004080FF;
       ((Self.FindComponent('L4_D21')    as TLabel)).Font.Color :=$004080FF;
  end;
end;
procedure TFM_Main.ED_empnoChange(Sender: TObject);
var
  tempCompName : String;
  i : integer;
begin
  if Length(ED_empno.Text) > 10 then
  begin
       L_Deptname.ValueCaption  := ED_empno.deptname;
       L_Payclname.ValueCaption := ED_empno.payclname;
       L_Payraname.ValueCaption := ED_empno.payraname;

       {for i:= 0 to DS_SELP1.recordCount-1 do
       begin
         if DBtn[i] <> nil then
          DBtn[i].Free;
       end;}

       SEL_MAIN;
       SEL_P1;
       SEL_EDU;

       if  DS_SELMAIN.FieldByName('paycl').AsString <> '' then
       ChangeShapeColor(DS_SELMAIN.FieldByName('paycl').AsString);
  end;
end;

procedure TFM_Main.SEL_EDU;
begin
  with DS_SELEDU do
  begin
    ServiceName := 'PTA3050B_sel2';
    Close;

    Sql.Text := 'SELECT a.base_yy,                                                        '+#13+
                '       nvl(a.req_sc,0),                                                  '+#13+
                '       nvl(a.opt_score,0),                                               '+#13+
                '       '''',                                                             '+#13+
                '       nvl(b.edupoint,0),                                                '+#13+
                '       decode(nvl(C.cnt,0),0,''無'',                                     '+#13+
                '              1,C.edu_title,                                             '+#13+
                '	       C.edu_title || '' 외 '' || to_char(C.cnt - 1) || ''건''), '+#13+
                '       NVL(C.cnt,0),                                                     '+#13+
                '       '''',                                                             '+#13+
                '       nvl(a.tot_score,0),                                               '+#13+
                '       '''',                                                             '+#13+
                '       '''',                                                             '+#13+
                '       ''''                                                              '+#13+
                '  from pedu2his a, pimupmas b,                                           '+#13+
                '      (select empno,                                                     '+#13+
                '              max(edu_title) edu_title,                                  '+#13+
                '              count(1) cnt                                               '+#13+
                '         from pedu2item c, pedu2type d                                   '+#13+
                '        where c.base_yy = to_char(substr('''+ sRabasdate +''',1,4) - 1)  '+#13+
                '          and c.edu_type = d.edu_type                                    '+#13+
                '	   and C.edu_pass_yn = ''N''                                      '+#13+
                '	   and d.req_yn = ''Y''                                           '+#13+
                '        group by empno ) C                                               '+#13+
                'where b.rabasdate = '''+ sRabasdate + '''                                '+#13+
                '  and a.base_yy = to_char(SUBSTR('''+ sRabasdate + ''', 1, 4) - 1)       '+#13+
                '  and a.empno = b.empno                                                  '+#13+
                '  and C.empno(+) = a.empno                                               '+#13+
                '  and a.empno ='''+ED_empno.empno+'''                                    ';  //    Edit1.Text := Sql.Text; 

    ClearFieldInfo;
    AddField('BASE_YY'    ,ftString,   4);
    AddField('REQ_SC'     ,ftString,   4);
    AddField('OPT_SCORE'  ,ftString,  12);
    AddField('ORGNUM'     ,ftString,   3);
    AddField('EDUPOINT'   ,ftString,   6);
    AddField('EDU_TITLE'  ,ftString,  60);
    AddField('CNT'        ,ftString,   6);
    //임시로 교육 서비스를 씀 추후 수정(쓰지 않는 필드들)
    AddField('PAYCL'      ,ftString,   3);
    AddField('TOT_SCORE'  ,ftString,  20);
    AddField('DEPTCODE'   ,ftString,  15);
    AddField('TEAMCODE'   ,ftString,  15);
    AddField('KORNAME'    ,ftString,  15);
    Open;

    DS_SELEDU.FieldByName('BASE_YY').Alignment   := taCenter;
    DS_SELEDU.FieldByName('REQ_SC').Alignment    := taRightJustify;
    DS_SELEDU.FieldByName('OPT_SCORE').Alignment := taRightJustify;
    DS_SELEDU.FieldByName('TOT_SCORE').Alignment := taRightJustify;
    DS_SELEDU.FieldByName('EDUPOINT').Alignment  := taCenter;
    DS_SELEDU.FieldByName('EDU_TITLE').Alignment  := taCenter;
    pnl_EduPointSum.Caption := FieldByName('EDUPOINT').AsString;
    pnl_PassNcnt.Caption    := '총 '+FieldByName('CNT').AsString+' 회';

    //if not FileExists(sHomeDir+'\helpdoc\1_기본자격요건 도움말.PDF') then
       HelpDownLoad('1_기본자격요건 도움말.PDF');
    //if not FileExists(sHomeDir+'\helpdoc\2_BAND조정점수 도움말.PDF') then
       HelpDownLoad('2_BAND조정점수 도움말.PDF');
    //if not FileExists(sHomeDir+'\helpdoc\3_동점자처리 도움말.PDF') then
       HelpDownLoad('3_동점자처리 도움말.PDF');
  end;
end;

procedure TFM_Main.HelpDownLoad(FileName : String);
var
  FL_FTP : TOnInterNetDownLoad;
begin
  FL_FTP := nil;
  FL_FTP := TOnInterNetDownLoad.Create(True);
  FL_FTP.HttpDownLoad := False;
  FL_FTP.HostName     := FL_UnixIP;
  FL_FTP.LoginName    := FL_FtpUser;
  FL_FTP.Password     := FL_FtpPass;
  FL_FTP.DestFilename := '/hper/insa/hperson/helpdoc/'+FileName;
  FL_FTP.LocalFilename:= GetHomeDir+'\helpdoc\'+FileName;
  FL_Ftp.DownUpYn     := True;

  try
    FL_FTP.Resume;
  except on E: Exception do
     MessageDlg('에러: '+E.Message,mtError,[mbOK],0);
  end;

  if FL_FTP.RetError <> '' then
    MessageDlg('에러: '+FL_FTP.RetError,mtError,[mbOK],0);

end;

procedure TFM_Main.Btn_Help1Click(Sender: TObject);
begin
  if FileExists(GetHomeDir+'\helpdoc\1_기본자격요건 도움말.PDF') then
  begin
    if ShellExecute(0,'open', PCHAR(GetHomeDir+'\helpdoc\1_기본자격요건 도움말.PDF'),nil,nil,SW_SHOW) = 0 then
       MessageDlg('도움말은 PDF화일로 되어 있습니다.'+#13+#10+''+#13+#10+'Acrobat Reader 7.0 먼저 설치하시기 바랍니다.', mtError, [mbOK], 0);
  end;
end;

procedure TFM_Main.Btn_Help2Click(Sender: TObject);
begin
  if FileExists(GetHomeDir+'\helpdoc\2_BAND조정점수 도움말.PDF') then
  begin
    if ShellExecute(0,'open', PCHAR(GetHomeDir+'\helpdoc\2_BAND조정점수 도움말.PDF'),nil,nil,SW_SHOW) = 0 then
       MessageDlg('도움말은 PDF화일로 되어 있습니다.'+#13+#10+''+#13+#10+'Acrobat Reader 7.0 먼저 설치하시기 바랍니다.', mtError, [mbOK], 0);
  end;

end;

procedure TFM_Main.Btn_Help3Click(Sender: TObject);
begin
  if FileExists(GetHomeDir+'\helpdoc\3_동점자처리 도움말.PDF') then
  begin
    if ShellExecute(0,'open', PCHAR(GetHomeDir+'\helpdoc\3_동점자처리 도움말.PDF'),nil,nil,SW_SHOW) = 0 then
       MessageDlg('도움말은 PDF화일로 되어 있습니다.'+#13+#10+''+#13+#10+'Acrobat Reader 7.0 먼저 설치하시기 바랍니다.', mtError, [mbOK], 0);
  end;
end;

function TFM_Main.Csel_gfd10(p_loc: Integer): String;
var
  v_cnt, v_tmp: Integer;
  v_data: String;
begin
  Result := '';
  v_data := DS_SELP1.FieldByName('SEL_DATA').AsString;
  v_cnt := 1;
  while v_cnt < p_loc do
  begin
    v_tmp := Pos(';',v_data);
    if not(v_tmp > 0) then Exit;
    v_cnt := v_cnt + 1;
    Delete(v_data, 1, v_tmp);
  end;
  v_tmp := Pos(';',v_data) - 1;
  if v_tmp < 0 then v_tmp := Length(v_data);
  Result := Copy(v_data,1,v_tmp);
end;


end.
