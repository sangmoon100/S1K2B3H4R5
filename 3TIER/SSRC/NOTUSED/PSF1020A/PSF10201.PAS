unit PSF10201;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OnSkinBtn, ExtCtrls, OnScheme, OnEditBaseCtrl, OnEditStdCtrl,
  OnEditNumCtl, StdCtrls, OnFocusButton, ComCtrls, OnEditBtnCtrl,
  OnPopupEdit, OnShapeLabel, OnEditCombo, Tmax_session, OnInsaCommon,
  OnTmaxPersonEdit, Db, Tmax_DataSetText, OnRegistry, TmaxFunc;

type
  TMainForm = class(TForm)
    SF_Main: TOnSchemeForm;
    Panel1: TPanel;
    SB_1: TOnSkinButton;
    SB_2: TOnSkinButton;
    NE_total: TOnNumberEdit;
    NE_dev: TOnNumberEdit;
    NE_ndev: TOnNumberEdit;
    NE_rem: TOnNumberEdit;
    NE_academy: TOnNumberEdit;
    NE_book: TOnNumberEdit;
    NE_ig: TOnNumberEdit;
    NE_hredu: TOnNumberEdit;
    NE_selfedu: TOnNumberEdit;
    Panel8: TPanel;
    NE_dev_tot: TOnNumberEdit;
    NE_child: TOnNumberEdit;
    NE_medi: TOnNumberEdit;
    Panel2: TPanel;
    NE_hexam: TOnNumberEdit;
    NE_physical: TOnNumberEdit;
    NE_gift: TOnNumberEdit;
    Panel3: TPanel;
    Panel4: TPanel;
    NE_insur: TOnNumberEdit;
    SB_help: TStatusBar;
    BT_academy: TOnFocusButton;
    BT_book: TOnFocusButton;
    BT_ig: TOnFocusButton;
    BT_hredu: TOnFocusButton;
    BT_selfedu: TOnFocusButton;
    BT_child: TOnFocusButton;
    BT_insur: TOnFocusButton;
    BT_medi: TOnFocusButton;
    BT_hexam: TOnFocusButton;
    BT_physical: TOnFocusButton;
    BT_hobby: TOnFocusButton;
    OnShapeLabel2: TOnShapeLabel;
    OnShapeLabel1: TOnShapeLabel;
    Label1: TLabel;
    Label3: TLabel;
    Panel23: TPanel;
    NE_hobby: TOnNumberEdit;
    BT_gift: TOnFocusButton;
    OnShapeLabel3: TOnShapeLabel;
    NE_ndev_tot: TOnNumberEdit;
    TMaxSession: TTMaxSession;
    ED_empno: TTMaxPersonPopupEdit;
    L_conyn: TOnShapeLabel;
    L_deptname: TOnShapeLabel;
    OnShapeLabel4: TOnShapeLabel;
    TDS1: TTMaxDataSet;
    SB_close: TOnSkinButton;
    Label5: TLabel;
    Panel5: TPanel;
    NE_spare: TOnNumberEdit;
    NE_condo: TOnNumberEdit;
    NE_travel: TOnNumberEdit;
    BT_spare: TOnFocusButton;
    BT_condo: TOnFocusButton;
    BT_travel: TOnFocusButton;
    Panel6: TPanel;
    OnShapeLabel5: TOnShapeLabel;
    SB_Print: TOnSkinButton;
    procedure SB_1Click(Sender: TObject);
    procedure SB_closeClick(Sender: TObject);
    procedure BT_academyClick(Sender: TObject);
    procedure ED_empnoReadEnded(Sender: TObject);
    procedure ED_empnoKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SB_PrintClick(Sender: TObject);
  private
    { Private declarations }
    SqlStr    : String;
    Re_Flag   : Boolean;

  public
    { Public declarations }
    GSyearnum : String;
    GSconyn   : String;
    GSempno   : String[4];     //Login사번
    GSkorname : String[12];    //Login성명
    GSgrade   : String[10];    //등급
    GSpass    : String;        //dsa2000  2005.03.
    FG_date   : String[8];     //Host Date
    Reg_FromDate, Reg_ToDate : String;
    Reg_Apply : Boolean;
    
    procedure Get_Data;
  end;

var
  MainForm: TMainForm;


implementation

uses PSF10202, PSF10204;

{$R *.DFM}


procedure TMainForm.SB_1Click(Sender: TObject);
begin
  SB_1.BtnDown  := False;
  SB_2.BtnDown  := False;

  TOnSkinButton(Sender).BtnDown := True;

  if TOnSkinButton(Sender).Tag = 1 then
    GSyearnum := Copy(GSyearnum,1,4)+'01'
  else if TOnSkinButton(Sender).Tag = 2 then
    GSyearnum := Copy(GSyearnum,1,4)+'02';

  if Re_Flag then
    Get_Data;       
end;

procedure TMainForm.Get_Data;
var
  tmpCode : String;
  tmpAmt  : Double;
begin
  NE_total.Value    := 0;
  NE_dev.Value      := 0;
  NE_ndev.Value     := 0;
  NE_rem.Value      := 0;
  NE_academy.Value  := 0;
  NE_book.Value     := 0;
  NE_ig.Value       := 0;
  NE_hredu.Value    := 0;
  NE_selfedu.Value  := 0;
  NE_child.Value    := 0;
  NE_insur.Value    := 0;
  NE_medi.Value     := 0;
  NE_hexam.Value    := 0;
  NE_physical.Value := 0;
  NE_hobby.Value    := 0;
  NE_gift.Value     := 0;
  NE_dev_tot.Value  := 0;
  NE_ndev_tot.Value := 0;
  L_conyn.ValueCaption := '';
  GSconyn              := '';

  NE_spare.Value    := 0;
  NE_condo.Value    := 0;
  NE_travel.Value   := 0;

  if Copy(ED_empno.empno,1,1) =  'Y' then //일반직은 IG 지원비를 입력 못하게..
    BT_ig.Enabled := False ;

//마스터 읽어오기
  SqlStr := 'select yearnum, empno, korname, nvl(devlimit,0), nvl(nondevlimit,0), '+
            '       nvl(devamt,0), nvl(nondevamt,0), nvl(conyn,''N'')             '+
            '  from psmssmas          '+
     Format(' where yearnum = ''%s''  '+
            '   and empno   = ''%s''', [GSyearnum , ED_empno.empno]) ;

  with TDS1 do
    begin
      ServiceName := 'PSF1020A_sel1';
      Close;
      Sql.Clear;
      Sql.Text := SqlStr;

      ClearFieldInfo;
      AddField('YEARNUM'    , ftString,  6);
      AddField('EMPNO'      , ftString,  4);
      AddField('KORNAME'    , ftString,  12);
      AddField('DEVLIMIT'   , ftFloat,   9);
      AddField('NONDEVLIMIT', ftFloat,   9);
      AddField('DEVAMT'     , ftFloat,   9);
      AddField('NONDEVAMT'  , ftFloat,   9);
      AddField('CONYN'      , ftString,  1);
      Open;

      if TDS1.eof then
        begin
          MessageDlg('해당하는 데이터가 존재하지 않습니다.', mtInformation , [mbOk],0);
          BT_academy.Enabled := False;
          BT_book.Enabled    := False;
          BT_ig.Enabled      := False;
          BT_hredu.Enabled   := False;
          BT_selfedu.Enabled := False;
          BT_child.Enabled   := False;
          BT_insur.Enabled   := False;
          BT_medi.Enabled    := False;
          BT_hexam.Enabled   := False;
          BT_physical.Enabled:= False;
          BT_hobby.Enabled   := False;
          BT_gift.Enabled    := False;

          //dsa2000  2005.05.09
          BT_spare.Enabled   := False;
          BT_condo.Enabled   := False;
          BT_travel.Enabled  := False;
          Exit;
        end;

      GSconyn := FieldByName('CONYN').AsString;

      if GSconyn = 'N' then
        L_conyn.ValueCaption := '미승인'
      else
        L_conyn.ValueCaption := '승인';

      NE_total.Value       := FieldByName('DEVLIMIT').AsFloat + FieldByName('NONDEVLIMIT').AsFloat ;
      NE_dev.Value         := FieldByName('DEVLIMIT').AsFloat ;
      NE_ndev.Value        := FieldByName('NONDEVLIMIT').AsFloat ;
      NE_rem.Value         := (FieldByName('DEVLIMIT').AsFloat + FieldByName('NONDEVLIMIT').AsFloat)
                             -(FieldByName('DEVAMT').AsFloat   + FieldByName('NONDEVAMT').AsFloat) ;
      NE_dev_tot.Value     := FieldByName('DEVAMT').AsFloat;
      NE_ndev_tot.Value    := FieldByName('NONDEVAMT').AsFloat;
    end;

//아이템 읽어오기
  SqlStr := 'select sscode, nvl(itemamt,0), ''field3'', ''field4'', ''field5'' '+
            '  from psmssitem '+
     Format(' where yearnum = ''%s'''+
            '   and empno   = ''%s''', [GSyearnum, ED_empno.empno]) ;

  with TDS1 do
    begin
      ServiceName := 'HINSA_select';
      Close;
      Sql.Clear;
      Sql.Text := SqlStr;

      ClearFieldInfo;
      AddField('SSCODE'     , ftString,   100);
      AddField('ITEMAMT'    , ftString,   100);
      AddField('field3'     , ftString,   100);
      AddField('field4'     , ftString,   100);
      AddField('field5'     , ftString,   100);
      Open;

      while not TDS1.Eof do
        begin
          tmpCode := Trim(FieldByName('SSCODE').AsString) ;
          tmpAmt  := FieldByName('ITEMAMT').AsFloat ;

          if tmpCode      = 'AA01' then  //ACADEMY
            NE_academy.Value := tmpAmt
          else if tmpCode = 'AA02' then //BOOK
            NE_book.Value    := tmpAmt
          else if tmpCode = 'AA03' then //IG
            NE_ig.Value      := tmpAmt
          else if tmpCode = 'AA04' then //HREDU
            NE_hredu.Value   := tmpAmt
          else if tmpCode = 'AA05' then //SELFEDU
            NE_selfedu.Value := tmpAmt
          else if tmpCode = 'BA01' then  //CHILD
            NE_child.Value   := tmpAmt
          else if tmpCode = 'BB01' then  //INSUR
            NE_insur.Value   := tmpAmt
          else if tmpCode = 'BC01' then //MEDI
            NE_medi.Value    := tmpAmt
          else if tmpCode = 'BC02' then //HEXAM
            NE_hexam.Value   := tmpAmt
          else if tmpCode = 'BD01' then //PHYSICAL
            NE_physical.Value:= tmpAmt
          else if tmpCode = 'BD02' then //HOBBY
            NE_hobby.Value   := tmpAmt
          else if tmpCode = 'BD03' then //GIFT
            NE_gift.Value    := tmpAmt

          //dsa2000  2005.05.
          else if tmpCode = 'BE01' then
            NE_spare.Value   := tmpAmt
          else if tmpCode = 'BE02' then
            NE_condo.Value   := tmpAmt
          else if tmpCode = 'BE03' then 
            NE_travel.Value  := tmpAmt;

          TDS1.Next;
        end;
    end;

  if (Reg_Apply = True) then
  begin
       BT_academy.Enabled := True;
       BT_book.Enabled    := True;
       BT_ig.Enabled      := True;
       BT_hredu.Enabled   := True;
       BT_selfedu.Enabled := True;
       BT_child.Enabled   := True;
       BT_insur.Enabled   := True;
       BT_medi.Enabled    := True;
       BT_hexam.Enabled   := True;
       BT_physical.Enabled:= True;
       BT_hobby.Enabled   := True;
       BT_gift.Enabled    := True;

       //dsa2000  2005.05.09
       BT_spare.Enabled   := True;
       BT_condo.Enabled   := True;
       BT_travel.Enabled  := True;
  end;
end;

procedure TMainForm.SB_closeClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.BT_academyClick(Sender: TObject);
begin
  case (Sender as TOnFocusButton).Tag of
    1 :  begin
           DetForm.L_item.LabelCaption   := ' = 자기계발 - 학원수강 =';
           DetForm.L_sscode.ValueCaption := 'AA01';
         end;
    2 :  begin
           DetForm.L_item.LabelCaption   := ' = 자기계발 - 도서구입 =';
           DetForm.L_sscode.ValueCaption := 'AA02';
         end;
    3 :  begin
           DetForm.L_item.LabelCaption   := ' = 자기계발 - IG지원 =';
           DetForm.L_sscode.ValueCaption := 'AA03';
         end;
    4 :  begin
           DetForm.L_item.LabelCaption   := ' = 자기계발 - 인력개발팀 주관교육 =';
           DetForm.L_sscode.ValueCaption := 'AA04';
         end;
    5 :  begin
           DetForm.L_item.LabelCaption   := ' = 자기계발 - 본인학자금 =';
           DetForm.L_sscode.ValueCaption := 'AA05';
         end;
    6 :  begin
           DetForm.L_item.LabelCaption   := ' = 자녀계발비 =';
           DetForm.L_sscode.ValueCaption := 'BA01';
         end;
    7 :  begin
           DetForm.L_item.LabelCaption := ' = 개인보험료 =';
           DetForm.L_sscode.ValueCaption := 'BB01';
         end;
    8 :  begin
           DetForm.L_item.LabelCaption := ' = 추가의료비 지원 =';
           DetForm.L_sscode.ValueCaption := 'BC01';
         end;
    9 :  begin
           DetForm.L_item.LabelCaption := ' = 건강검진 지원 =';
           DetForm.L_sscode.ValueCaption := 'BC02';
         end;
    10:  begin
           DetForm.L_item.LabelCaption := ' = 체육활동 =';
           DetForm.L_sscode.ValueCaption := 'BD01';
         end;
    11:  begin
           DetForm.L_item.LabelCaption := ' = 취미활동 =';
           DetForm.L_sscode.ValueCaption := 'BD02';
         end;
    12:  begin
           DetForm.L_item.LabelCaption := ' = 회사선물 추가구입 =';
           DetForm.L_sscode.ValueCaption := 'BD03';
         end;

    //dsa2000  2005.01차 추가...(여가취미활동, 콘도/펜션이용, 여행) 
    13:  begin
           DetForm.L_item.LabelCaption := ' = 여가취미활동 =';
           DetForm.L_sscode.ValueCaption := 'BE01';
         end;
    14:  begin
           DetForm.L_item.LabelCaption := ' = 콘도/펜션이용 =';
           DetForm.L_sscode.ValueCaption := 'BE02';
         end;
    15:  begin
           DetForm.L_item.LabelCaption := ' = 여행 =';
           DetForm.L_sscode.ValueCaption := 'BE03';
         end;
  end;

  DetForm.ShowModal;

end;

procedure TMainForm.ED_empnoReadEnded(Sender: TObject);
begin
  L_deptname.ValueCaption  := ED_empno.deptname;
  Get_Data;
end;

procedure TMainForm.ED_empnoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    begin
      ED_empno.PL_get_singledata;
      L_deptname.ValueCaption  := ED_empno.deptname;
    end;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := CaFree;
end;

procedure TMainForm.FormShow(Sender: TObject);
var
     i : integer;
     Temp : TComponent;
begin
  Self.OnPaint := Nil;
  Application.ProcessMessages;
  SF_Main.Refresh;
  SB_help.Panels[1].Text := '인사시스템에 접속 중입니다...';

  ///////////////////////////////////////////////////////////////////////
  TMaxSession.EnvFileName := GetHomeDir+'\newhana.env';
  TMaxSession.LabelName   := 'HANAROHPER';
  TMaxSession.Connect  := False;
  TMaxSession.Host     := Hinsa_Param(cmdline,10);
  TMaxSession.Port     := '9999';

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
  FM_Tmax           := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := TMaxSession;
  FG_Date           := Copy(FM_Tmax.GetData('sysdate','',''),1,8);
  ///////////////////////////////////////////////////////////////////////

  SB_help.Panels[1].Text := '';

  Application.ProcessMessages;
  GSempno   := Hinsa_Param(cmdLine,1);
  GSkorname := Hinsa_Param(cmdLine,2);
  GSpass    := Hinsa_Param(cmdLine,3);
  GSgrade   := Hinsa_Param(cmdLine,4);

      with TDS1 do
      begin
          ServiceName := 'HINSA_select';
          Close;
          Sql.Clear;
          Sql.Text := 'select yearnum, nvl(regfrom,''9''), nvl(regto,''9''), ''field4'',''field5''   '+
                      '  from pscssbas                                                               '+
                      ' where yearnum = (select cssnum from pkcpbas)                                 ';

          ClearFieldInfo;
          AddField('YEARNUM'   , ftString,  100);
          AddField('REGFROM'   , ftString,  100);
          AddField('REGTO'     , ftString,  100);
          AddField('field4'    , ftString,  100);
          AddField('field5'    , ftString,  100);
          Open;

          //if (GSgrade[3] > 'C')  //dsa2000  2004.11.15. 복리후생담당자 권한으로 변경..(박찬대리 요청)
          Reg_FromDate := FieldByName('REGFROM').AsString;
          Reg_ToDate   := FieldByName('REGTO').AsString;
          Reg_Apply := True;
          
{2008.05.09 수정
          if (GSgrade[4] > 'C') and ((Reg_FromDate >= FG_date) or (Reg_ToDate <= FG_date)) then }
          if (GSgrade[4] > 'C') and ((Reg_FromDate > FG_date) or (Reg_ToDate < FG_date)) then
          begin
              MessageDlg('복리후생비 등록기간이 아닙니다.(조회가능)', mtInformation , [mbOk],0);
              for i := 0 to MainForm.ComponentCount -1 do
              begin
                   if (MainForm.Components[i] is TOnFocusButton) then
                   begin
                        Temp := MainForm.Components[i];
                        TOnFocusButton(Temp).Enabled := False;
                   end;
              end;
              Reg_Apply := False;
              {SB_CloseClick(Self);
              Exit;}
          end;

          GSyearnum :=  FieldByName('YEARNUM').AsString;
      end;

      ED_empno.Text  := GSempno ;
      ED_empno.PL_get_singledata ;
      L_deptname.ValueCaption  := ED_empno.deptname ;

      //if (GSgrade[3] > 'C')  then //dsa2000  2004.11.15. 복리후생담당자 권한으로 변경..(박찬대리 요청)
      if (GSgrade[4] > 'C') then
        begin
          ED_empno.ButtonWidth     := 0;
          ED_empno.Enabled         := False;
        end
      else
        begin
          ED_empno.ButtonWidth     := 24;
          ED_empno.Enabled         := True;
        end;

      Re_Flag := False; //Get_Data가 두번타는 것을 방지하기 위함.

      if Copy(GSyearnum, 5,2) = '01' then
        SB_1Click(SB_1)
      else
        SB_1Click(SB_2);

      Re_Flag := True;

      SendMessage(SB_help.handle,WM_PAINT,0,0);
end;

procedure TMainForm.SB_PrintClick(Sender: TObject);
begin
  ///////////////////////////////////////////////////////////////////////
  FM_Tmax           := TFM_Tmax.Create(Self);
  FM_Tmax.T_Session := TMaxSession;
  FG_Date           := FM_Tmax.GetData('sysdate','','');
  ///////////////////////////////////////////////////////////////////////

  FM_Print := TFM_Print.Create(Application);
  FM_Print.QRCompositeReport1.Preview;
end;

end.

