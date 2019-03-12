unit Pit203011;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  peextcombo, peoutlookbtn, ExtCtrls, StdCtrls, Mask, pebtnedit,
  PeJeonLabel, OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl, ActiveX,
  OnTmaxPersonEdit, OnShapeLabel, OnTmaxCodeEdit, OnTmaxDeptEdit, NotesHana_TLB,
  OnFocusButton, OnEditCombo, pegradpanl, Tmax_DataSetText, Db, OnPopupEdit;

type
  TFm_SubForm1 = class(TForm)
    Label7: TLabel;
    P_Ttotal: TOnShapeLabel;
    P_calcPtotal: TOnShapeLabel;
    P_Appdate: TOnShapeLabel;
    sub_Form11: TOnFocusButton;
    CB_aftConyn: TOnComboEdit;
    sub_Form12: TOnFocusButton;
    Bt_Print1: TOnFocusButton;
    Bt_Print2: TOnFocusButton;
    Bt_Print3: TOnFocusButton;
    Bt_AftOppinion: TOnFocusButton;
    Bt_BefOppinion: TOnFocusButton;
    P_Statename: TOnShapeLabel;
    Panel2: TPanel;
    Bt_imsave: TOnFocusButton;
    Bt_Add: TOnFocusButton;
    Bt_Save: TOnFocusButton;
    Bt_Del: TOnFocusButton;
    Shape2: TShape;
    Label1: TLabel;
    P_ImasPayclname: TOnShapeLabel;
    P_ImasPayraname: TOnShapeLabel;
    P_ImasDeptname: TOnShapeLabel;
    P_Payclname: TOnShapeLabel;
    P_Payraname: TOnShapeLabel;
    P_Deptname: TOnShapeLabel;
    Shape3: TShape;
    Label2: TLabel;
    Shape5: TShape;
    Label3: TLabel;
    Label4: TLabel;
    P_AftDeptcode: TOnShapeLabel;
    P_AftOrgnum: TOnShapeLabel;
    L_aftConyn: TLabel;
    E_Korname: TOnWinPopupEdit;
    E_aftDeptname: TOnWinPopupEdit;
    Shape1: TShape;
    Shape4: TShape;
    Shape8: TShape;
    Bt_close: TOnFocusButton;
    procedure Bt_closeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sub_Form11Click(Sender: TObject);
    procedure Bt_SaveClick(Sender: TObject);
    procedure Bt_DelClick(Sender: TObject);
    procedure Bt_imsaveClick(Sender: TObject);
    procedure Bt_AddClick(Sender: TObject);
//    procedure E_KornameRightBtnClick(Sender: TObject);
//    procedure E_aftDeptnameRightBtnClick(Sender: TObject);
    procedure sub_Form12Click(Sender: TObject);
    procedure E_KornameExit(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure E_KornameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure E_aftDeptnameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure E_aftDeptnameExit(Sender: TObject);
    procedure E_KornameClick(Sender: TObject);
    procedure E_aftDeptnameClick(Sender: TObject);
//    procedure P_Form11Enter(Sender: TObject);
//    procedure P_Form11Exit(Sender: TObject);
//    procedure P_Form12Enter(Sender: TObject);
//    procedure P_Form12Exit(Sender: TObject);
    procedure Bt_PrintClick(Sender: TObject);
    procedure CB_aftConynChange(Sender: TObject);
    procedure E_aftDeptnameInitPopup(Sender: TObject);
    procedure E_aftDeptnameCloseUp(Sender: TObject; var Value: String;
      var CloseAccept: Boolean);
    procedure E_KornameInitPopup(Sender: TObject);
    procedure E_KornameCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure E_KornameKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
    Start       : Boolean;
    save_gu     : String;      //insert,update 구분

    giCall      : Integer;
    ParamVariant: String;      // Sqltext
    gbBtCheck   : Boolean;

    Inter       : ILotusNotes_Hana;

    procedure fzClearForm(Fgubun: Integer);
    procedure fzDisables(FDisableYN: Boolean);
    procedure fzSetButtons;
    procedure re_collect;
    procedure fzCallEmp(FEmpno: String);
    procedure fzCallDept(FOrgnum, FDeptcode: String);
    procedure fzDataDisplay(FEmpno: String);
    function  fnSetStateName(FState: String): String;
    procedure fzSetOutLookBt(mPanel: TPanel; mOutLook: TPeJeonOutLookBtn; mGrayed: Boolean);
    function  fnGetPrintData(FGubun: Integer): Boolean;
    procedure fzOpenDataSets_Det(FGubun: Integer; FEmpno: String);
    procedure pSupplecntPlus(pEmpno, pMonum : String) ;
    procedure pGumtoUpdate;
    procedure pHintMail (sDeptcode : String);
    Function pDeptcheck(sGubun : String) : String;
  public
    { Public declarations }
    SelForm     : TForm;      // 현재 작업중인 Form

    gvVariant   : OleVariant;

    gsDeptCode1 : String;
    gsDeptCode2 : String;
    gsDeptCode3 : String;

    gsEmpno          : String;
    gsPaycl          : String;
    gsPayra          : String;
    gsOrgnum         : String;
    gsDeptcode       : String;
    gsAftOrgnum      : String;

    gsMotive         : String;
    gsEtcDesc        : String;

    gsAftConynSave   : String;

    gsAaftreqdate    : String;
    gsAftconoppinion : String;
    gsBefreqdate     : String;
    gsBefconoppinion : String;
    gsState          : String; // 1;대기중,2;검토중,3;처리완료

    gsStatedate      : String;
  end;

var
  Fm_SubForm1: TFm_SubForm1;

implementation

uses
  pit203000, pit203012, pit203013, UPreview1, UPreview2, UPreview3,
  kpaylib, pit203010, UDepForm, UEmpForm;

{$R *.DFM}

procedure TFm_SubForm1.fzSetOutLookBt(mPanel: TPanel; mOutLook: TPeJeonOutLookBtn; mGrayed: Boolean);
begin
    if mGrayed then
    begin
        mPanel.Color        := $00F2F3F4;
        mOutLook.Grayed     := mGrayed;
        mOutLook.Font.Color := clNavy;
    end
    else
    begin
        //mPanel.Color        := $00E6E8EA;
        //mOutLook.Grayed     := mGrayed;
        //mOutLook.Font.Color := clPurple;
        mPanel.Color        := clActiveCaption;
        mOutLook.Grayed     := mGrayed;
        mOutLook.Font.Color := clWhite;
    end;
end;

function TFm_SubForm1.fnSetStateName(FState: String): String;
begin
  case StrToIntDef(Fstate,0) of
    1 : Result := '등록중';
    2 : Result := '대기중';
    3 : Result := '지원부서검토중';
    4 : Result := '지원부서 검토완료';
    5 : Result := '소속부서검토중';
    6 : Result := '소속부서 검토완료';
    7 : Result := '처리완료';
  else
    Result := '';
  end;
end;

// 1: All, 2: Emp, 3:Dept
procedure TFm_SubForm1.fzClearForm(Fgubun: Integer);
begin
  if Fgubun <= 3 then
  begin
    P_Appdate.ValueCaption   := '';

      gsMotive                 := '';
//    gsMotive1                := '';
//    gsMotive2                := '';
//    gsMotive3                := '';

      gsEtcDesc                := '';
//    gsEtcDesc1               := '';
//    gsEtcDesc2               := '';
//    gsEtcDesc3               := '';

    gsAaftreqdate            := '';
    CB_aftConyn.Text         := '';
//    P_aftConyn.ValueCaption  := '';
    gsAftconoppinion         := '';
    gsBefreqdate             := '';
//    P_befConyn.ValueCaption  := '';
    gsBefconoppinion         := '';
    gsState                  := '';

    P_statename.ValueCaption := '';
    gsStatedate              := '';

    if Fgubun <= 2 then
    begin
     // P_AftOrgnum.TextCaption  := ''; // 지원부서사항
     // P_aftDeptcode.TextCaption:= '';
      E_aftdeptname.text       := '';
      P_Ttotal.ValueCaption     := '';
      P_calcPtotal.ValueCaption := '';

      if Fgubun <= 1 then
      begin
        gsEmpno                     := ''; // 인사사항
        E_Korname.text              := '';
        P_ImasPayclname.ValueCaption := '';
        P_ImasPayraname.ValueCaption := '';
        P_Imasdeptname.ValueCaption  := '';

        gsPaycl                 := ''; // 소속부서사항
        P_Payclname.ValueCaption := '';
        gsPayra                 := '';
        P_Payraname.ValueCaption := '';
        gsOrgnum                := '';
        gsDeptcode              := '';
        P_deptname.ValueCaption  := '';
      end;
    end;
  end;
end;

procedure TFm_SubForm1.re_collect;
var
  Msg : String;
begin
  if to_char(Add_Months(to_date(copy(MainForm.P_Sysdate,1,8),'YYYYMMDD'),-6),'YYYYMMDD')
     >= replace(P_Appdate.ValueCaption,'/','') then // 지원한지 6개월 이상
  begin
    Msg := '[처리완료]된 부서입니다. 재지원 하시겠습니까 ?';
    if  MessageDlg(Msg,mtConfirmation,[mbYes,mbNo],0) = mrNo then
      system.exit;
    fzClearForm(3);
    E_aftDeptName.SetFocus;
  end
  else
  begin
    Msg := '처리완료부서는 6개월이내 재지원이 불가합니다.';
    MessageDlg(Msg,mtConfirmation,[mbOK],0);
    //fzClearForm(2);
    if E_aftDeptName.Enabled = True then E_aftDeptName.SetFocus;
  end;
end;

procedure TFm_SubForm1.fzDataDisplay(FEmpno : String);
var
  {Msg,} Tem : String;
begin
  // 우리부서에서 다른부서로 지원한 내역
   fzClearForm(1);
  // 우리부서에서 다른부서로 지원한 내역
  // go_DbGrid ; 부서명은 지원부서명
  Tem := '  SELECT                                                                                   '+
         '    NVL(a.empno,         '' '') empno,                                                     '+
         '    NVL(a.monum,         '' '') monum,                                                     '+
         '    NVL(a.korname,       '' '') korname,                                                   '+
         '    NVL(a.orgnum,        '' '') orgnum,                                                    '+
         '    NVL(a.deptcode,      '' '') deptcode,                                                  '+
         '    (select deptname from pycdept where deptcode = a.deptcode)  deptname,                  '+
         '    NVL(a.paycl,         '' '') paycl,                                                     '+
         '    (select codename from pyccode where codeid = ''I112'' and codeno = a.paycl) payclname, '+
         '    NVL(a.payra,         '' '') payra,                                                     '+
         '    (select codename from pyccode where codeid = ''I113'' and codeno = a.payra) payraname, '+
         '    a.appdate           ,                                                                  '+
         '    a.aftdeptcode1      ,                                                                  '+
         '    a.aftdeptcode2      ,                                                                  '+
         '    a.aftdeptcode3      ,                                                                  '+
         '    (select deptname from pycdept where deptcode = a.aftdeptcode1)  aftdeptname1,          '+
         '    (select deptname from pycdept where deptcode = a.aftdeptcode2)  aftdeptname2,          '+
         '    (select deptname from pycdept where deptcode = a.aftdeptcode3)  aftdeptname3,          '+
         '    NVL(a.motive1,       '' '') motive1,                                                   '+
         '    NVL(a.motive2,       '' '') motive2,                                                   '+
         '    NVL(a.motive3,       '' '') motive3,                                                   '+
         '    NVL(a.etcdesc1,      '' '') etcdesc1,                                                  '+
         '    NVL(a.etcdesc2,      '' '') etcdesc2,                                                  '+
         '    NVL(a.etcdesc3,      '' '') etcdesc3,                                                  '+
         '    NVL(a.aftconyn1,     '' '') aftconyn,                                                  '+
         '    NVL(a.aftconyn2,     '' '') aftconyn,                                                  '+
         '    NVL(a.aftconyn3,     '' '') aftconyn,                                                  '+
         '    NVL(a.aftconempno1,  '' '') aftconempno1,                                              '+
         '    NVL(a.aftconempno2,  '' '') aftconempno2,                                              '+
         '    NVL(a.aftconempno3,  '' '') aftconempno3,                                              '+
         '    NVL(a.aftconkorname1, '' '') aftconkorname1,                                           '+
         '    NVL(a.aftconkorname2, '' '') aftconkorname2,                                           '+
         '    NVL(a.aftconkorname3, '' '') aftconkorname3,                                           '+
         '    NVL(a.aftcondate1,    '' '') aftcondate1,                                              '+
         '    NVL(a.aftcondate2,    '' '') aftcondate2,                                              '+
         '    NVL(a.aftcondate3,    '' '') aftcondate3,                                              '+
         '    NVL(a.state1,         '' '') state1,                                                   '+
         '    NVL(a.state2,         '' '') state2,                                                   '+
         '    NVL(a.state3,         '' '') state3,                                                   '+
         '    DECODE(a.state1,''1'',''대기중'',                                                      '+
         '                    ''2'',''검토중'',                                                      '+
         '                    ''3'',''처리완료'','' '') statename1,                                  '+
         '    DECODE(a.state2,''1'',''대기중'',                                                      '+
         '                    ''2'',''검토중'',                                                      '+
         '                    ''3'',''처리완료'','' '') statename2,                                  '+
         '    DECODE(a.state3,''1'',''대기중'',                                                      '+
         '                    ''2'',''검토중'',                                                      '+
         '                    ''3'',''처리완료'','' '') statename3,                                  '+
         '    NVL(a.statedate1,       '' '') statedate1,                                             '+
         '    NVL(a.statedate2,       '' '') statedate2,                                             '+
         '    NVL(a.statedate3,       '' '') statedate3                                              '+
         'FROM  pischnmas a                                                                          '+
 Format( 'WHERE a.empno = ''%s''                                                                     '+
         '  AND a.monum  = ''%s''                                                                    ',
         [Fempno, MainForm.gsMonum ]);

  With MainForm.TCDS do
  begin
    Close;
    ClearFieldInfo;
    AddField('사번'                 ,  ftString ,  4   );   //0
    AddField('공모차수'             ,  ftString ,  3   );
    AddField('성명'                 ,  ftString ,  12  );   //2
    AddField('조직차수'             ,  ftString ,  3   );
    AddField('부서코드'             ,  ftString ,  6   );
    AddField('부서명'               ,  ftString ,  60  );
    AddField('직급'                 ,  ftString ,  2   );
    AddField('직급명'               ,  ftString ,  20  );   //7
    AddField('직위'                 ,  ftString ,  3   );
    AddField('직위명'               ,  ftString ,  20  );   //9
    AddField('지원일'               ,  ftString ,  8  );    //10
    AddField('지원부서코드1'        ,  ftString ,  6   );
    AddField('지원부서코드2'        ,  ftString ,  6   );
    AddField('지원부서코드3'        ,  ftString ,  6   );
    AddField('지원부서명1'          ,  ftString ,  60  );
    AddField('지원부서명2'          ,  ftString ,  60  );
    AddField('지원부서명3'          ,  ftString ,  60  );   //16
    AddField('지원동기1'            ,  ftString , 2000 );
    AddField('지원동기2'            ,  ftString , 2000 );
    AddField('지원동기3'            ,  ftString , 2000 );
    AddField('지원기타사항1'        ,  ftString , 2000 );
    AddField('지원기타사항2'        ,  ftString , 2000 );
    AddField('지원기타사항3'        ,  ftString , 2000 );
    AddField('지원부서결재여부1'    ,  ftString ,  1   );
    AddField('지원부서결재여부2'    ,  ftString ,  1   );
    AddField('지원부서결재여부3'    ,  ftString ,  1   );
    AddField('AFTCONEMPNO1'         ,  ftString ,  4   );
    AddField('AFTCONEMPNO2'         ,  ftString ,  4   );
    AddField('AFTCONEMPNO3'         ,  ftString ,  4   );
    AddField('AFTCONKORNAME1'       ,  ftString ,  12  );
    AddField('AFTCONKORNAME2'       ,  ftString ,  12  );
    AddField('AFTCONKORNAME3'       ,  ftString ,  12  );
    AddField('AFTCONDATE1'          ,  ftString ,  8   );
    AddField('AFTCONDATE2'          ,  ftString ,  8   );
    AddField('AFTCONDATE3'          ,  ftString ,  8   );
    AddField('STATE1'               ,  ftString ,  1   );
    AddField('STATE2'               ,  ftString ,  1   );
    AddField('STATE3'               ,  ftString ,  1   );
    AddField('처리상태1'            ,  ftString ,  20  );
    AddField('처리상태2'            ,  ftString ,  20  );
    AddField('처리상태3'            ,  ftString ,  20  ); //40
    AddField('처리상태일1'          ,  ftString ,  8   );
    AddField('처리상태일2'          ,  ftString ,  8   );
    AddField('처리상태일3'          ,  ftString ,  8   );

    Sql.Clear;
    Sql.Text := Tem;
//    edit1.Text := Sql.Text;
    ServiceName := 'PIT2030A_SEL3';
    open;
    //TFunc_TQueryAuto('SPIT2030S3', Tem, TuxDm.TTXCDS);

//    showmessage(Inttostr(RecordCount));

    if FieldByName('사번').AsString <> '' then
    begin
       gsEmpno                      := FieldByName('사번').Asstring;
       gvVariant                    := MainForm.fnGetPimpmas(gsEmpno);

       E_Korname.text               := gvVariant[2];
       P_Imasdeptname.ValueCaption  := gvVariant[5];
       P_ImasPayclname.ValueCaption := gvVariant[7];
       P_ImasPayraname.ValueCaption := gvVariant[9];

       P_AftOrgnum.ValueCaption     := FieldByName('조직차수').Asstring;
       gsPaycl                      := FieldByName('직급').Asstring;
       P_Payclname.ValueCaption     := FieldByName('직급명').Asstring;
       gsPayra                      := FieldByName('직위').Asstring;
       P_Payraname.ValueCaption     := FieldByName('직위명').Asstring;
       gsOrgnum                     := FieldByName('조직차수').Asstring;
       gsDeptcode                   := FieldByName('부서코드').Asstring;
       P_deptname.ValueCaption      := FieldByName('부서명').Asstring;

       P_Appdate.ValueCaption    := copy(FieldByName('지원일').Asstring,1,4) + '/'
                                  + copy(FieldByName('지원일').Asstring,5,2) + '/'
                                  + copy(FieldByName('지원일').Asstring,7,2);

       if self.Tag = 1 then
       begin
          P_aftDeptcode.ValueCaption  := FieldByName('지원부서코드1').Asstring;
          E_aftdeptname.text          := FieldByName('지원부서명1').Asstring;
          gsMotive                    := FieldByName('지원동기1').Asstring;
          gsEtcDesc                   := FieldByName('지원기타사항1').Asstring;

          if FieldByName('지원부서결재여부1').Asstring =  'Y' then CB_aftConyn.ItemIndex := 0
          else                                                     CB_aftConyn.ItemIndex := 1;
          CB_aftConynChange(CB_aftConyn);

          gsState                   := FieldByName('STATE1').Asstring;
          P_statename.ValueCaption  := FieldByName('처리상태1').Asstring;
          gsStatedate               := FieldByName('처리상태일1').Asstring;

       end else
       if self.Tag = 2 then
       begin
          P_aftDeptcode.ValueCaption  := FieldByName('지원부서코드2').Asstring;
          E_aftdeptname.text          := FieldByName('지원부서명2').Asstring;
          gsMotive                    := FieldByName('지원동기2').Asstring;
          gsEtcDesc                   := FieldByName('지원기타사항2').Asstring;

          if FieldByName('지원부서결재여부2').Asstring =  'Y' then CB_aftConyn.ItemIndex := 0
          else                                                    CB_aftConyn.ItemIndex := 1;

         CB_aftConynChange(CB_aftConyn);

         gsState                   := FieldByName('STATE2').Asstring;
         P_statename.ValueCaption  := FieldByName('처리상태2').Asstring;
         gsStatedate               := FieldByName('처리상태일2').Asstring;

       end else
       if self.Tag = 3 then
       begin
          P_aftDeptcode.ValueCaption  := FieldByName('지원부서코드3').Asstring;
          E_aftdeptname.text          := FieldByName('지원부서명3').Asstring;
          gsMotive                    := FieldByName('지원동기3').Asstring;
          gsEtcDesc                   := FieldByName('지원기타사항3').Asstring;

          if FieldByName('지원부서결재여부3').Asstring =  'Y' then CB_aftConyn.ItemIndex := 0
          else                                                     CB_aftConyn.ItemIndex := 1;

         CB_aftConynChange(CB_aftConyn);

         gsState                   := FieldByName('STATE3').Asstring;
         P_statename.ValueCaption  := FieldByName('처리상태3').Asstring;
         gsStatedate               := FieldByName('처리상태일3').Asstring;

       end;
       fzSetButtons;
    end;

    Close;
  end;

end;

procedure TFm_SubForm1.fzDisables(FDisableYN: Boolean);
begin
{  CB_aftConyn.Enabled    := FDisableYN;

  E_Korname.Enabled      := FDisableYN;
  E_aftDeptname.Enabled  := FDisableYN;

  sub_Form11.Enabled     := FDisableYN;
  sub_Form12.Enabled     := FDisableYN;
//  P_Form11.Enabled       := FDisableYN;
//  P_Form12.Enabled       := FDisableYN;

  Bt_Print1.Enabled      := FDisableYN;
  Bt_Print2.Enabled      := FDisableYN;
  Bt_Print3.Enabled      := FDisableYN;
  //Bt_AftOppinion.Enabled := FDisableYN;
  //Bt_BefOppinion.Enabled := FDisableYN;

  Bt_imsave.Enabled      := FDisableYN;
  Bt_Add.Enabled         := FDisableYN;
  Bt_Save.Enabled        := FDisableYN;
  Bt_Del.Enabled         := FDisableYN;    }
end;

procedure TFm_SubForm1.fzSetButtons;
begin
//   fzDisables(False); // 버튼 초기화

   E_Korname.Enabled      := True;
   E_aftDeptname.Enabled  := True;

   sub_Form11.Enabled     := True;
   sub_Form12.Enabled     := True;

   Bt_Print1.Enabled      := True;
   Bt_Print2.Enabled      := True;
   Bt_Print3.Enabled      := True;

   if gsState = '3' then
   begin
      Bt_imSave.Enabled := False;
      Bt_Save.Enabled   := False;
   end else
   begin
      Bt_imSave.Enabled := True;
      Bt_Save.Enabled   := True;
   end;
end;

procedure TFm_SubForm1.FormCreate(Sender: TObject);
begin
  Start := True;
end;

procedure TFm_SubForm1.FormPaint(Sender: TObject);
var
  TTemp: TTMaxDataSet;
begin
   if Start then
   begin
      gbBtCheck := False;

      Start := not Start;

      MainForm.gbChanged := False;

      if      self.Tag = 1 then TTemp := MainForm.TDS_F1
      else if self.Tag = 2 then TTemp := MainForm.TDS_F2
      else if self.Tag = 3 then TTemp := MainForm.TDS_F3;

      Bt_close.Visible := True;

      // 현재 인사상태
      with TTemp do
      begin
         gsEmpno                      := FieldByName('사번').Asstring;
         gvVariant                    := MainForm.fnGetPimpmas(gsEmpno);

         E_Korname.text               := gvVariant[2];
         P_Imasdeptname.ValueCaption  := gvVariant[5];
         P_ImasPayclname.ValueCaption := gvVariant[7];
         P_ImasPayraname.ValueCaption := gvVariant[9];

         P_AftOrgnum.ValueCaption     := FieldByName('조직차수').Asstring;
         gsPaycl                      := FieldByName('직급').Asstring;
         P_Payclname.ValueCaption     := FieldByName('직급명').Asstring;
         gsPayra                      := FieldByName('직위').Asstring;
         P_Payraname.ValueCaption     := FieldByName('직위명').Asstring;
         gsOrgnum                     := FieldByName('조직차수').Asstring;
         gsDeptcode                   := FieldByName('부서코드').Asstring;
         P_deptname.ValueCaption      := FieldByName('부서명').Asstring;

         P_Appdate.ValueCaption    := copy(FieldByName('지원일').Asstring,1,4) + '/'
                                    + copy(FieldByName('지원일').Asstring,5,2) + '/'
                                    + copy(FieldByName('지원일').Asstring,7,2);

         P_aftDeptcode.ValueCaption  := FieldByName('지원부서코드').Asstring;
         E_aftdeptname.text          := FieldByName('지원부서명').Asstring;
         gsMotive                    := FieldByName('지원동기').Asstring;
         gsEtcDesc                   := FieldByName('지원기타사항').Asstring;

         CB_aftConynChange(CB_aftConyn);

         if FieldByName('지원부서결재여부').Asstring =  'Y' then CB_aftConyn.ItemIndex := 0
         else                                                    CB_aftConyn.ItemIndex := 1;

         gsState                   := FieldByName('STATE').Asstring;

         P_statename.ValueCaption  := FieldByName('처리상태').Asstring;

//         gsStatedate               := FieldByName('처리상태일').Asstring;

         // 정원, 현원
//         gvVariant := MainForm.fnGetInwon(P_AftOrgnum.ValueCaption, P_aftDeptcode.ValueCaption);
//         P_Ttotal.ValueCaption     := gvVariant[0];
//         P_calcPtotal.ValueCaption := gvVariant[1];

         fzSetButtons;
         pGumtoUpdate;
      end;// end --> with of TTXtemp
   end;
end;

procedure TFm_SubForm1.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  Action := caFree;
end;

procedure TFm_SubForm1.E_KornameClick(Sender: TObject);
begin
  Exit;
  fzClearForm(1);
end;

procedure TFm_SubForm1.E_KornameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  if Key = VK_RETURN then
//    giCall := 1;
end;

procedure TFm_SubForm1.fzCallEmp(FEmpno: String);
begin
  // 건수, 사번, 성명, 조직차수, 부서코드, 부서명, 직급, 직급명, 직위, 직위명, 직군, 직군명, 보임여부
  giCall := 2;
  gvVariant := MainForm.fnGetPimpmas(FEmpno);
  if gvVariant[0] = 1 then
  begin
    gsEmpno                     := gvVariant[1];
    E_Korname.text              := gvVariant[2];
    P_ImasDeptname.ValueCaption  := gvVariant[5];
    P_ImasPayclname.ValueCaption := gvVariant[7];
    P_ImasPayraname.ValueCaption := gvVariant[9];

    fzDataDisplay(gsEmpno);
  end
  else
  E_KornameInitPopup(E_Korname);
//    E_KornameRightBtnClick(E_Korname);
end;

procedure TFm_SubForm1.E_KornameExit(Sender: TObject);
begin
//  if giCall = 1 then
//    fzCallEmp(E_Korname.Text);
end;

procedure TFm_SubForm1.E_aftDeptnameClick(Sender: TObject);
begin
  Exit;
  fzClearForm(2);
end;

procedure TFm_SubForm1.E_aftDeptnameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
    giCall := 1;
end;

procedure TFm_SubForm1.fzCallDept(FOrgnum, FDeptcode: String);
begin
  // 건수, 조직차수, 부서코드, 부서명
  giCall := 2;
  gvVariant := MainForm.fnGetPycdept(FOrgnum, FDeptcode);
  if gvVariant[0] = 1 then
  begin
    P_AftOrgnum.ValueCaption   := gvVariant[1];
    P_AftDeptcode.ValueCaption := gvVariant[2];
    E_AftDeptname.text        := gvVariant[3];
    // 정원, 현원
    gvVariant := MainForm.fnGetInwon(P_AftOrgnum.ValueCaption, P_aftDeptcode.ValueCaption);
    P_Ttotal.ValueCaption     := gvVariant[0];
    P_calcPtotal.ValueCaption := gvVariant[1];

    fzDataDisplay(gsEmpno);
  end
  else
    E_aftDeptnameInitPopup(E_aftDeptname);
//    E_aftDeptnameRightBtnClick(E_aftDeptname);
end;

procedure TFm_SubForm1.E_aftDeptnameExit(Sender: TObject);
begin
  if giCall = 1 then
    fzCallDept(P_AftOrgnum.ValueCaption, E_aftDeptname.Text);
end;

{procedure TFm_SubForm1.P_Form11Enter(Sender: TObject);
begin
  fzSetOutLookBt(TPanel(Sender), sub_Form11, False);
end;

procedure TFm_SubForm1.P_Form11Exit(Sender: TObject);
begin
  fzSetOutLookBt(TPanel(Sender), sub_Form11, True);
end;
}
procedure TFm_SubForm1.sub_Form11Click(Sender: TObject);
begin
  TRY
    Fm_SubForm11 := TFm_SubForm11.Create(self);

    if self.Tag = 1 then
    begin
       MainForm.gsMemoGubn     := '1';
       Fm_SubForm11.gsMotive1  := gsMotive;   //
       Fm_SubForm11.gsEtcDesc1 := gsEtcDesc;  //
    end;
    if self.Tag = 2 then
    begin
       MainForm.gsMemoGubn     := '2';
       Fm_SubForm11.gsMotive2  := gsMotive;   //
       Fm_SubForm11.gsEtcDesc2 := gsEtcDesc;  //
    end;
    if self.Tag = 3 then
    begin
       MainForm.gsMemoGubn     := '3';
       Fm_SubForm11.gsMotive3  := gsMotive;   //
       Fm_SubForm11.gsEtcDesc3 := gsEtcDesc;  //
    end;

    Fm_SubForm11.Showmodal;

  FINALLY
    Fm_SubForm11.Free;
  END;
end;

{procedure TFm_SubForm1.P_Form12Enter(Sender: TObject);
begin
  fzSetOutLookBt(TPanel(Sender), sub_Form12, False);
end;

procedure TFm_SubForm1.P_Form12Exit(Sender: TObject);
begin
  fzSetOutLookBt(TPanel(Sender), sub_Form12, True);
end;
}
procedure TFm_SubForm1.sub_Form12Click(Sender: TObject);
var
  Msg     : string;
begin
  TRY
    Fm_SubForm12 := TFm_SubForm12.Create(self);

    if (TPeJeonOutLookBtn(Sender).Tag = 1) then // 검토의견작성/조회
    begin
      Fm_SubForm12.gbEnabled := Bt_Save.Enabled;
      Fm_SubForm12.gsConOppinion  := gsAftConOppinion
    end
    else
    begin
      Fm_SubForm12.gbEnabled := False;
      if (TPeJeonOutLookBtn(Sender).Tag = 2) then //  지원부서의견조회
        Fm_SubForm12.gsConOppinion  := gsAftConOppinion
      else                                        //  소속부서의견조회
        Fm_SubForm12.gsConOppinion  := gsBefConOppinion;
    end;

    Fm_SubForm12.Showmodal;

    if (TPeJeonOutLookBtn(Sender).Tag < 3) then
      gsAftConOppinion := Fm_SubForm12.gsConOppinion
    else
      gsBefConOppinion := Fm_SubForm12.gsConOppinion;

  FINALLY
    Fm_SubForm12.Free;
  END;
end;



procedure TFm_SubForm1.Bt_imsaveClick(Sender: TObject);
var
  Msg : string;
begin
   gbBtCheck := True;
   Msg := '['+Bt_imsave.Caption+'] 하시겠습니까 ?';
   if MessageDlg(Msg,mtConfirmation,[mbYes,mbNo],0) = mrNo then
     System.Exit;

   if gsEmpno = '' then
   begin
     Msg := '지원사원은 누구시죠??';
     MessageDlg(Msg,mtConfirmation,[mbOk],0);
     System.Exit;
   end;
   if (trim(P_AftOrgnum.ValueCaption) = '') or (trim(P_AftDeptcode.ValueCaption) = '') then
   begin
     Msg := '지원하고자 하는 부서가 없습니다. 지원부서를 선택해 주십시오';
     MessageDlg(Msg,mtConfirmation,[mbOk],0);
     System.Exit;
   end;
   if CB_aftConyn.ItemIndex = 0 then  gsAftConynSave := 'Y'
   else                               gsAftConynSave := 'N';
{   gsEmpnoSave1   := MainForm.pEmpno;
   gsKornameSave1 := MainForm.pKorname;
   gsStateSave1   := gsState;
 }

   if self.Tag = 1 then
   begin
      ParamVariant := Format('Update pischnmas a set                                             '+
                             '  (aftconyn1     , aftconempno1 ,                                  '+
                             '   aftconkorname1, aftcondate1  ,                                  '+
                             '   writeemp   , writetime) =                                       '+
                             '  (select ''%s'' , ''%s''                                          '+
                             '        , ''%s'' , TO_CHAR(sysdate,''YYYYMMDD'')                   '+
                             '        , ''%s'' , TO_CHAR(sysdate,''YYYYMMDDHH24MISS'')           '+
                             '   from pimpmas i                                                  '+
                             '   where i.empno = a.empno)                                        '+
                             'Where empno = ''%s'' and monum = ''%s''                            ',
                             [gsAftConynSave, MainForm.pEmpno,
                              MainForm.pKorname,
                              MainForm.pEmpno,
                              gsEmpno, MainForm.gsMonum]);
   end else
   if self.Tag = 2 then
   begin
      ParamVariant := Format('Update pischnmas a set                                             '+
                             '  (aftconyn2     , aftconempno2 ,                                  '+
                             '   aftconkorname2, aftcondate2  ,                                  '+
                             '   writeemp   , writetime) =                                       '+
                             '  (select ''%s'' , ''%s''                                          '+
                             '        , ''%s'' , TO_CHAR(sysdate,''YYYYMMDD'')                   '+
                             '        , ''%s'' , TO_CHAR(sysdate,''YYYYMMDDHH24MISS'')           '+
                             '   from pimpmas i                                                  '+
                             '   where i.empno = a.empno)                                        '+
                             'Where empno = ''%s'' and monum = ''%s''                            ',
                             [gsAftConynSave, MainForm.pEmpno,
                              MainForm.pKorname,
                              MainForm.pEmpno,
                              gsEmpno, MainForm.gsMonum]);
   end else
   if self.Tag = 3 then
   begin
      ParamVariant := Format('Update pischnmas a set                                             '+
                             '  (aftconyn3     , aftconempno3 ,                                  '+
                             '   aftconkorname3, aftcondate3  ,                                  '+
                             '   writeemp      , writetime) =                                    '+
                             '  (select ''%s'' , ''%s''                                          '+
                             '        , ''%s'' , TO_CHAR(sysdate,''YYYYMMDD'')                   '+
                             '        , ''%s'' , TO_CHAR(sysdate,''YYYYMMDDHH24MISS'')           '+
                             '   from pimpmas i                                                  '+
                             '   where i.empno = a.empno)                                        '+
                             'Where empno = ''%s'' and monum = ''%s''                            ',
                             [gsAftConynSave, MainForm.pEmpno,
                              MainForm.pKorname,
                              MainForm.pEmpno,
                              gsEmpno, MainForm.gsMonum]);
   end;



   with MainForm.TCupd do
   begin
     Close;
     Sql.Clear;
     Sql.Text := ParamVariant;
//     edit1.Text  := Sql.Text;
     ServiceName := 'PIT2030A_DML';
     Execute;
   end;

   Mainform.gbChanged := True;
   Msg := '['+Bt_ImSave.Caption+'] 하였습니다.';
   MessageDlg(Msg, mtConfirmation, [mbOk], 0);

   fzDataDisplay(gsEmpno);
   fzSetButtons;
end;

procedure TFm_SubForm1.Bt_AddClick(Sender: TObject);
var
  Msg: String;
begin
  Msg := '['+Bt_Add.Caption+'] 하시겠습니까?';
  if MessageDlg(Msg,mtConfirmation,[mbYes,mbNo],0) = mrNo then
    System.Exit;

  // Check Data 등록중(1)
  if gsEmpno = '' then
  begin
    Msg := '지원사원은 누구시죠??';
    MessageDlg(Msg,mtConfirmation,[mbOk],0);
    System.Exit;
  end;
  if (trim(P_AftOrgnum.ValueCaption) = '') or (trim(P_AftDeptcode.ValueCaption) = '') then
  begin
    Msg := '지원하고자 하는 부서가 없습니다. 지원부서를 선택해 주십시오';
    MessageDlg(Msg,mtConfirmation,[mbOk],0);
    System.Exit;
  end;

  gsState := '2';
{
  if save_gu = 'U'  then
  begin
    ParamVariant := Format('Update pischnmas a set                                 '+
                           '  (appdate    ,                                        '+
                           '   orgnum     , deptcode   ,                           '+
                           '   paycl      , payra      ,                           '+
                           '   aftorgnum  , aftdeptcode,                           '+
                           '   motive1    , motive2    ,                           '+
                           '   motive3    , etcdesc1   ,                           '+
                           '   etcdesc2   , etcdesc3   ,                           '+
                           '   state      , statedate  ,                           '+
                           '   writeemp   , writetime) =                           '+
                           '  (select NVL(''%s'',TO_CHAR(sysdate,''YYYYMMDD'')),            '+
                           '          NVL(a.orgnum, i.orgnum), NVL(a.deptcode, i.deptcode), '+
                           '          NVL(a.paycl, i.paycl), NVL(a.payra, i.payra),'+
                           '          ''%s'', ''%s'',                              '+
                           '          ''%s'', ''%s'',                              '+
                           '          ''%s'', TO_CHAR(sysdate,''YYYYMMDD''),       '+
                           '          ''%s'', TO_CHAR(sysdate,''YYYYMMDD'')        '+
                           '   from pimpmas i                                      '+
                           '   where i.empno = a.empno)                            '+
                           'Where empno = ''%s'' and appdate = NVL(''%s'',''00000000'')     ',
                           [kpaylib.replace(P_Appdate.ValueCaption,'/',''),
                            P_aftOrgnum.ValueCaption, P_aftDeptcode.ValueCaption,
                            gsMotive1, gsMotive2,
                            gsMotive3, gsEtcdesc1,
                            gsEtcdesc2, gsEtcdesc3,
                            gsState,
                            MainForm.pEmpno,
                            gsEmpno, kpaylib.replace(P_Appdate.ValueCaption,'/','')]);
   end
   else
   begin
    ParamVariant := Format('Insert Into pischnmas                          '+
                           '  (empno      , korname    ,                   '+
                           '   appdate    ,                                '+
                           '   orgnum     , deptcode   ,                   '+
                           '   paycl      , payra      ,                   '+
                           '   aftorgnum  , aftdeptcode,                   '+
                           '   motive1    , motive2    ,                   '+
                           '   motive3    , etcdesc1   ,                   '+
                           '   etcdesc2   , etcdesc3   ,                   '+
                           '   state      , statedate  ,                   '+
                           '   writeemp   , writetime)                     '+
                           'select ''%s'', ''%s'',                         '+
                           '       NVL(''%s'',TO_CHAR(sysdate,''YYYYMMDD'')), '+
                           '       i.orgnum, i.deptcode,                   '+
                           '       i.paycl,  i.payra,                      '+
                           '       ''%s'', ''%s'',                         '+
                           '       ''%s'', ''%s'',                         '+
                           '       ''%s'', TO_CHAR(sysdate,''YYYYMMDD''),  '+
                           '       ''%s'', TO_CHAR(sysdate,''YYYYMMDD'')   '+
                           'from pimpmas i                                 '+
                           'where i.empno = ''%s''                         ',
                           [gsEmpno, E_Korname.Text,
                            kpaylib.replace(P_Appdate.ValueCaption,'/',''),
                            P_aftOrgnum.ValueCaption, P_aftDeptcode.ValueCaption,
                            gsMotive1, gsMotive2,
                            gsMotive3, gsEtcdesc1,
                            gsEtcdesc2, gsEtcdesc3,
                            gsState,
                            MainForm.pEmpno,
                            gsEmpno]);
   end;

  with MainForm.TCupd do
  begin
    Close;
    Sql.Clear;
    Sql.Text := ParamVariant;
    edit1.Text := Sql.Text;
    ServiceName := 'PIT2030A_DML';
    Execute;
  end;
   }

  Mainform.gbChanged := True;
  Msg := '['+Bt_Add.Caption+'] 하였습니다.';
  MessageDlg(Msg, mtConfirmation, [mbOk], 0);

  fzDataDisplay(gsEmpno);
  fzSetButtons;
end;
procedure TFm_SubForm1.pGumtoUpdate;
begin
   if self.Tag = 1 then
   begin
      ParamVariant := Format('Update pischnmas a set                                             '+
                             '  (state1        , statedate1   ,                                  '+
                             '   writeemp   , writetime) =                                       '+
                             '  (select ''2'' , TO_CHAR(sysdate,''YYYYMMDD'')                    '+
                             '        , ''%s'' , TO_CHAR(sysdate,''YYYYMMDDHH24MISS'')           '+
                             '   from pimpmas i                                                  '+
                             '   where i.empno = a.empno)                                        '+
                             'Where empno = ''%s'' and monum = ''%s''                            '+
                             '  and state1 <= ''2''                                              ',
                             [MainForm.pEmpno,
                              gsEmpno, MainForm.gsMonum]);
   end else
   if self.Tag = 2 then
   begin
      ParamVariant := Format('Update pischnmas a set                                             '+
                             '  (state2        , statedate2   ,                                  '+
                             '   writeemp   , writetime) =                                       '+
                             '  (select ''2'' , TO_CHAR(sysdate,''YYYYMMDD'')                    '+
                             '        , ''%s'' , TO_CHAR(sysdate,''YYYYMMDDHH24MISS'')           '+
                             '   from pimpmas i                                                  '+
                             '   where i.empno = a.empno)                                        '+
                             'Where empno = ''%s'' and monum = ''%s''                            '+
                             '  and state2 <= ''2''                                              ',
                             [MainForm.pEmpno,
                              gsEmpno, MainForm.gsMonum]);
   end else
   if self.Tag = 3 then
   begin
      ParamVariant := Format('Update pischnmas a set                                             '+
                             '  (state3        , statedate3   ,                                  '+
                             '   writeemp   , writetime) =                                       '+
                             '  (select ''2'' , TO_CHAR(sysdate,''YYYYMMDD'')                    '+
                             '        , ''%s'' , TO_CHAR(sysdate,''YYYYMMDDHH24MISS'')           '+
                             '   from pimpmas i                                                  '+
                             '   where i.empno = a.empno)                                        '+
                             'Where empno = ''%s'' and monum = ''%s''                            '+
                             '  and state1 <= ''2''                                              ',
                             [MainForm.pEmpno,
                              gsEmpno, MainForm.gsMonum]);
   end;

   with MainForm.TCupd do
   begin
     Close;
     Sql.Clear;
     Sql.Text := ParamVariant;
     ServiceName := 'PIT2030A_DML';
     Execute;
   end;

end;

procedure TFm_SubForm1.Bt_SaveClick(Sender: TObject);
var
  Msg : string;
begin
   gbBtCheck := True;
   Msg := '['+Bt_Save.Caption+'] 하시겠습니까?';
   if MessageDlg(Msg,mtConfirmation,[mbYes,mbNo],0) = mrNo then
     System.Exit;

   // Check Data 지원부서검토중(3) or 지원부서 검토완료(4)
{   if gsState > '4' then
   begin
     Msg := '작업할 수 시기가 지났습니다. 관리자에게 연락하여 주십시오.';
     MessageDlg(Msg,mtConfirmation,[mbOk],0);
     System.Exit;
   end; }
   if gsEmpno = '' then
   begin
     Msg := '지원사원은 누구죠??';
     MessageDlg(Msg,mtConfirmation,[mbOk],0);
     System.Exit;
   end;
   if MainForm.class_sebugu = '1' then // 운영자
   begin
     if (trim(P_AftOrgnum.ValueCaption) = '') or (trim(P_AftDeptcode.ValueCaption) = '') then
     begin
       Msg := '지원하고자 하는 부서가 없습니다. 지원부서를 선택해 주십시오';
       MessageDlg(Msg,mtConfirmation,[mbOk],0);
       System.Exit;
     end;
     //if (trim(gsMotive) = '') or (trim(gsEtcDesc) = '') then
   end;
   if (CB_aftConyn.text = '') then
   begin
     Msg := '수용승락하시겠으면 "Y"를 수용거부하시겠으면 "N"을 결정해 주십시오.';
     MessageDlg(Msg,mtConfirmation,[mbOk],0);
     System.Exit;
   end;

   if CB_aftConyn.ItemIndex = 0 then  gsAftConynSave := 'Y'
   else                               gsAftConynSave := 'N';


   if self.Tag = 1 then        //1지망
   begin
      ParamVariant := Format('Update pischnmas a set                                             '+
                             '  (state1        , statedate1   ,                                  '+
                             '   aftconyn1     , aftconempno1 ,                                  '+
                             '   aftconkorname1, aftcondate1  ,                                  '+
                             '   writeemp   , writetime) =                                       '+
                             '  (select ''3'' , TO_CHAR(sysdate,''YYYYMMDD'')                    '+
                             '        , ''%s'' , ''%s''                                          '+
                             '        , ''%s'' , TO_CHAR(sysdate,''YYYYMMDD'')                   '+
                             '        , ''%s'' , TO_CHAR(sysdate,''YYYYMMDDHH24MISS'')           '+
                             '   from pimpmas i                                                  '+
                             '   where i.empno = a.empno)                                        '+
                             'Where empno = ''%s'' and monum = ''%s''                            ',
                             [gsAftConynSave, MainForm.pEmpno,
                              MainForm.pKorname,
                              MainForm.pEmpno,
                              gsEmpno, MainForm.gsMonum]);
   end else
   if self.Tag = 2 then       //2지망
   begin
      ParamVariant := Format('Update pischnmas a set                                             '+
                             '  (state2        , statedate2   ,                                  '+
                             '   aftconyn2     , aftconempno2 ,                                  '+
                             '   aftconkorname2, aftcondate2  ,                                  '+
                             '   writeemp   , writetime) =                                       '+
                             '  (select ''3''  , TO_CHAR(sysdate,''YYYYMMDD'')                   '+
                             '        , ''%s'' , ''%s''                                          '+
                             '        , ''%s'' , TO_CHAR(sysdate,''YYYYMMDD'')                   '+
                             '        , ''%s'' , TO_CHAR(sysdate,''YYYYMMDDHH24MISS'')           '+
                             '   from pimpmas i                                                  '+
                             '   where i.empno = a.empno)                                        '+
                             'Where empno = ''%s'' and monum = ''%s''                            ',
                             [gsAftConynSave, MainForm.pEmpno,
                              MainForm.pKorname,
                              MainForm.pEmpno,
                              gsEmpno, MainForm.gsMonum]);
   end else
   if self.Tag = 3 then      //3지망
   begin
      ParamVariant := Format('Update pischnmas a set                                             '+
                             '  (state3        , statedate3   ,                                  '+
                             '   aftconyn3     , aftconempno3 ,                                  '+
                             '   aftconkorname3, aftcondate3  ,                                  '+
                             '   writeemp   , writetime) =                                       '+
                             '  (select ''3''  , TO_CHAR(sysdate,''YYYYMMDD'')                   '+
                             '        , ''%s'' , ''%s''                                          '+
                             '        , ''%s'' , TO_CHAR(sysdate,''YYYYMMDD'')                   '+
                             '        , ''%s'' , TO_CHAR(sysdate,''YYYYMMDDHH24MISS'')           '+
                             '   from pimpmas i                                                  '+
                             '   where i.empno = a.empno)                                        '+
                             'Where empno = ''%s'' and monum = ''%s''                            ',
                             [gsAftConynSave, MainForm.pEmpno,
                              MainForm.pKorname,
                              MainForm.pEmpno,
                              gsEmpno, MainForm.gsMonum]);
   end;

   with MainForm.TCupd do
   begin
     Close;
     Sql.Clear;
     Sql.Text := ParamVariant;
     ServiceName := 'PIT2030A_DML';
     Execute;
   end;


   if gsAftConynSave = 'Y' then pSupplecntPlus(gsEmpno, MainForm.gsMonum );

   if (self.Tag = 1) or (self.Tag = 2) then
      if gsAftConynSave = 'N' then pHintMail(pDeptcheck(IntToStr(self.Tag) ));

   //gsAftConynSave

   Mainform.gbChanged := True;
   Msg := '['+Bt_Save.Caption+'] 하였습니다.';
   MessageDlg(Msg, mtConfirmation, [mbOk], 0);

   fzDataDisplay(gsEmpno);
   fzSetButtons;
end;

Function TFm_SubForm1.pDeptcheck(sGubun : String) : String;
var
   SL_Sql : String;
begin
   SL_Sql := ' select aftdeptcode2  aftdeptcode2  '+
             '      , aftdeptcode3  aftdeptcode3  '+
             '      , ''field3''    field3        '+
             '      , ''field4''    field4        '+
             '      , ''field5''    field5        '+
             '   from pischnmas                   '+
             '  where monum  = ''%s''             '+
             '    and empno  = ''%s''             ';

   SL_Sql := Format(SL_Sql,[MainForm.gsMonum, gsEmpno  ]);

   with MainForm.TDSdept do
   begin
      ServiceName := 'HINSA_select';
      Close;
      Sql.Text := SL_Sql;
//      edit1.Text := Sql.Text ;
      ClearFieldInfo;
      AddField('aftdeptcode2' , ftString,  100);
      AddField('aftdeptcode3' , ftString,  100);
      AddField('field3'       , ftString,  100);
      AddField('field4'       , ftString,  100);
      AddField('field5'       , ftString,  100);
      Open;

//      showmessage(FieldByName('aftdeptcode2').AsString);
//      exit;

      if   sGubun = '1' then  Result := FieldByName('aftdeptcode2').AsString
      else                    Result := FieldByName('aftdeptcode3').AsString;
   end;
end;
///////////////////////////////////////////////////////////////////////////////
//--------------------------------------------------------------------------------------------
procedure TFm_SubForm1.pHintMail(sDeptCode : String);
var
    i : integer;
    SL_Sql : String;
var
   MailTitle, MailKorname : string;
   iIdx : Integer;
   SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String;
begin
   CoInitialize(nil);  //메일발송시 에러 발생하여 ...(uses ActiveX)
   MailTitle := '[ 사내공모지원자 검토 요청 ] ';
   MailBody  := '안녕하십니까?                               ' + #13#10 +
                '귀 부서에 사내공모지원자가 접수 되었습니다. ' + #13#10 +
                '조속히 승인 또는 반려처리 하시기 바랍니다.  ' + #13#10 +
                '수고하십시요.';


  //메일보내기
  Application.ProcessMessages;

  MessageDlg('사내공모지원을 하면 1지망부서의 팀장님께 [사내공모지원자 검토 요청] 메일이 전송됩니다.', mtInformation, [mbOK], 0) ;

  {if not Assigned(Inter) then
  begin
      try
        Inter := CoLotusNotes_Hana.Create;
      except
        begin
          MessageDlg('메일 발송 실패 ', mtInformation, [mbOK], 0);
          Inter := nil;
          System.Exit;
        end;
      end;

      try
        while not Inter.GetInstance do
      except
        begin
          MessageDlg('메일 발송 실패 ', mtInformation, [mbOK], 0);
          if Assigned(Inter) then  Inter := nil;
          System.Exit;
        end;
      end;

      SL_Sql := ' SELECT nvl(a.conempno,  '' '') conempno  '+
                '      , nvl(b.korname,  '' '')  korname   '+
                '      , ''field3''              field3    '+
                '      , ''field4''              field4    '+
                '      , ''field5''              field5    '+
                '   FROM pischndept  a, pimpmas b          '+
                '  WHERE a.orgnum   = ''%s''               '+
                '    AND a.deptcode = ''%s''               '+
                '    AND A.monum    = ''%s''               '+
                '    AND a.orgnum   = b.orgnum             '+
                '    AND a.conempno = b.empno              ';

      SL_Sql := Format(SL_Sql,[gsOrgnum, gsDeptcode1, MainForm.gsMonum]);

      with MainForm.THintMail do
      begin
         ServiceName := 'HINSA_select';
         Close;
         Sql.Text := SL_Sql;

         ClearFieldInfo;
         AddField('conempno' , ftString,  100);
         AddField('korname'  , ftString,  100);
         AddField('field3'   , ftString,  100);
         AddField('field4'   , ftString,  100);
         AddField('field5'   , ftString,  100);
         Open;

            //선택된 사용자들 메일 전송 로직
         if Inter = nil then System.exit ;
         try
//            showmessage('받을사람 : '+ FieldByName('conempno').AsString+ ' / ' + FieldByName('korname').AsString);

            Inter.SendFrom   := '오종석' + ' ' + '0219' ; //접속자
            Inter.SendTo     := FieldByName('conempno').AsString;                  //받을사람 사번
            Inter.SendToName := FieldByName('korname').AsString;                  //받을사람 이름
            Inter.CorName    := 'HANARO';
            Inter.Subject    := MailTitle;           //메일제목
            Inter.Body       := MailBody ;            //메일내용
            Inter.SendMail;
         except
            MessageDlg('노츠연동 메일 전송 서버가 등록되지 않았습니다...',mtError, [mbOk], 0);
            Halt;
         end; //try
         MessageDlg('Hint 메일이 성공적으로 발송되었습니다...',mtInformation, [mbOk], 0);
      end;
   end; }

  //////////////////////////////////////////////////////////////////////////////
  SL_Sql := ' SELECT nvl(conempno,  '' '') field1 '+
            '      , ''field2''            field2 '+
            '      , ''field3''            field3 '+
            '      , ''field4''            field4 '+
            '      , ''field5''            field5 '+
            '   FROM pischndept                   '+
            '  WHERE orgnum   = ''%s''            '+
            '    AND deptcode = ''%s''            '+
            '    AND monum    = ''%s''            ';

  SL_Sql := Format(SL_Sql,[gsOrgnum, gsDeptcode1, MainForm.gsMonum]);

  with MainForm.THintMail do
  begin
     ServiceName := 'HINSA_select';
     Close;
     Sql.Text := SL_Sql;

     ClearFieldInfo;
     AddField('conempno' , ftString,  100);
     AddField('korname'  , ftString,  100);
     AddField('field3'   , ftString,  100);
     AddField('field4'   , ftString,  100);
     AddField('field5'   , ftString,  100);
     Open;

     SendProgID  := 'PIT2030A'; //프로그램 ID
     SendEmpno   := MainForm.Pempno;     //발송자(로그인 사번)
     RcveEmpno   := FieldByName('conempno').AsString;
     MailSubject := MailTitle;
     MailBody    := MailBody;
     ReceiveYN   := 'N';
     //if ChkReceive.Checked then ReceiveYN := 'Y';

     if MainForm.Send_WebHint(SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN) then
          MessageDlg('메일 전송이 성공 하였습니다...',mtInformation, [mbOk], 0)
     else
     begin
          MessageDlg('메일 전송이 실패 하였습니다...',mtError, [mbOk], 0);
          exit;
     end
  end;
  //////////////////////////////////////////////////////////////////////////////

end;
//--------------------------------------------------------------------------------------------
/////////////////////////////////////////////////////////////////////////////////////////////


procedure TFm_SubForm1.Bt_DelClick(Sender: TObject);
var
  Msg, strsql : string;
begin
  Msg := '['+Bt_Del.Caption+'] 하시겠습니까?';
  if MessageDlg(Msg,mtConfirmation,[mbYes,mbNo],0) = mrNo then
    System.Exit;

  // Check Data 지원부서검토중(4) or 지원부서 검토완료(5)
  if gsEmpno = '' then
  begin
    Msg := '삭제대상사원은 누구죠??';
    MessageDlg(Msg,mtConfirmation,[mbOk],0);
    System.Exit;
  end;
  if gsState >= '7' then
  begin
    Msg := '작업할 수 시기가 지났습니다. 관리자에게 연락하여 주십시오.';
    MessageDlg(Msg,mtConfirmation,[mbOk],0);
    System.Exit;
  end;

  ParamVariant := Format('delete from pischnmas                     '+
                         'where  empno   = ''%s''                   '+
                         '  and  appdate = NVL(''%s'',''00000000'') ',
                         [gsEmpno,
                          kpaylib.replace(P_Appdate.ValueCaption,'/','')]);

  with MainForm.TCupd do
  begin
    Close;
    Sql.Clear;
    Sql.Text := ParamVariant;
    ServiceName := 'PIT2030A_DML';
    Execute;
  end;


  Mainform.gbChanged := True;
  Msg := '['+Bt_Del.Caption+'] 하였습니다.';
  MessageDlg(Msg, mtConfirmation, [mbOk], 0);

  fzClearForm(2);
  fzDataDisplay(gsEmpno);
  fzSetButtons;
end;
//    pSupplecntPlus(gsEmpno, MainForm.gsMonum, gsAftConynSave );
procedure TFm_SubForm1.pSupplecntPlus(pEmpno, pMonum : String);

begin
   Try
      if self.Tag = 1 then
      begin
         ParamVariant := Format('update pischndept                                          '+
                                '   set supplecnt                                           '+
                                '        = ( select max(supplecnt) + 1                      '+
                                '             from pischndept                               '+
                                '            where (deptcode , monum)                       '+
                                '                   = ( select aftdeptcode1, monum          '+
                                '                         from pischnmas                    '+
                                '                        where empno = ''%s''               '+
                                '                          and monum = ''%s''               '+
                                '                          and state1 = ''3''               '+
                                '                          and aftconyn1 = ''Y'')  )        '+
                                ' where (deptcode , monum) = ( select aftdeptcode1, monum   '+
                                '                                from pischnmas             '+
                                '                               where empno = ''%s''        '+
                                '                                 and monum = ''%s''        '+
                                '                                 and state1 = ''3''        '+
                                '                                 and aftconyn1 = ''Y'' )   ',
                                [pEmpno, pMonum, pEmpno, pMonum]);
      end else
      if self.Tag = 1 then
      begin
         ParamVariant := Format('update pischndept                                          '+
                                '   set supplecnt                                           '+
                                '        = ( select max(supplecnt) + 1                      '+
                                '             from pischndept                               '+
                                '            where (deptcode , monum)                       '+
                                '                   = ( select aftdeptcode2, monum          '+
                                '                         from pischnmas                    '+
                                '                        where empno = ''%s''               '+
                                '                          and monum = ''%s''               '+
                                '                          and state2= ''3''                '+
                                '                          and aftconyn2 = ''Y'')  )        '+
                                ' where (deptcode , monum) = ( select aftdeptcode2, monum   '+
                                '                                from pischnmas             '+
                                '                               where empno = ''%s''        '+
                                '                                 and monum = ''%s''        '+
                                '                                 and state2 = ''3''        '+
                                '                                 and aftconyn2 = ''Y'' )   ',
                                [pEmpno, pMonum, pEmpno, pMonum]);
      end else
      if self.Tag = 1 then
      begin
         ParamVariant := Format('update pischndept                                          '+
                                '   set supplecnt                                           '+
                                '        = ( select max(supplecnt) + 1                      '+
                                '             from pischndept                               '+
                                '            where (deptcode , monum)                       '+
                                '                   = ( select aftdeptcode3, monum          '+
                                '                         from pischnmas                    '+
                                '                        where empno = ''%s''               '+
                                '                          and monum = ''%s''               '+
                                '                          and state3 = ''3''               '+
                                '                          and aftconyn3 = ''Y'')  )        '+
                                ' where (deptcode , monum) = ( select aftdeptcode3, monum   '+
                                '                                from pischnmas             '+
                                '                               where empno = ''%s''        '+
                                '                                 and monum = ''%s''        '+
                                '                                 and state3 = ''3''        '+
                                '                                 and aftconyn3 = ''Y'' )   ',
                                [pEmpno, pMonum, pEmpno, pMonum]);
      end;
      with MainForm.TCupd do
      begin
        Close;
        Sql.Clear;
        Sql.Text := ParamVariant;
        ServiceName := 'PIT2030A_DML';
        Execute;
      end;
   Except
      Close;
   end;
end;


procedure TFm_SubForm1.Bt_closeClick(Sender: TObject);
begin
   if gbBtCheck = False then
     if MessageDlg('임시저장하시겠습니까?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        Bt_ImsaveClick(Sender);
   Close;

  Try
     MainForm.TCupd.Close;
     CLOSE;
  except
//     showmessage('ddd');
  end;
end;

function TFm_SubForm1.fnGetPrintData(FGubun: Integer): Boolean;
begin
  Result := False;

  case Fgubun of
    1: ParamVariant:= Format('SELECT  empno || '';'' || korname from pischnmas '+
                             'where empno = ''%s'' and monum = ''%s''' ,
                             [gsEmpno,
                              MainForm.gsMonum]);
    2: ParamVariant:= Format('SELECT  empno || '';'' || korname from pimpmas   '+
                             'where empno = ''%s''                             ',
                             [gsEmpno]);
    3: ParamVariant:= Format('SELECT  distinct empno || '';'' || korname from pishrmas '+
                             'where empno = ''%s''                             ',
                             [gsEmpno]);
  end;

  With MainForm.TCsel do begin
    Close;
    ClearFieldInfo;
    Addfield('sel_data',ftString, 300);
    Sql.Clear;
    Sql.Text := ParamVariant ;
    ServiceName := 'PIT2030A_SELZ';
    Open;
  end;

  if trim(MainForm.Csel_gfd(1)) = '' then  System.Exit;

  MainForm.TCsel.Close;

  Result := True;
end;

procedure TFm_SubForm1.fzOpenDataSets_Det(FGubun: Integer; FEmpno: String);
var
  sSql: String;
  ParamVariant: String;
begin
    case FGubun of
      1 : begin
            ssql :=
              'SELECT '+
              '  nvl(  i.empno      ,'' '') empno     ,    '+ 
              '  nvl(  i.korname    ,'' '') korname   ,    '+
              '  nvl(  i.orgnum     ,'' '') orgnum    ,    '+ 
              '  nvl(  i.deptcode   ,'' '') deptcode  ,    '+ 
              '  nvl(  d.deptname   ,'' '') deptname  ,    '+ 
              '  nvl(  i.paycl      ,'' '') imaspaycl     ,'+ 
              '  nvl(  cl.codename  ,'' '') imaspayclname ,'+ 
              '  nvl(  i.payra      ,'' '') payra     ,    '+ 
              '  nvl(  ra.codename  ,'' '') payraname ,    '+ 
              '  nvl(  i.jobgun     ,'' '') jobgun    ,    '+ 
              '  nvl(  jg.codename  ,'' '') jobgunname,    '+ 
              '  nvl(  i.lschgr     ,'' '') lschgr    ,    '+ 
              '  nvl(  sc.codename  ,'' '') schoolname,    '+ 
              '  nvl(  i.lmajorcode ,'' '') lmajorcode,    '+ 
              '  nvl(  mj.codename  ,'' '') majorname ,    '+ 
              '  nvl(  i.empdate    ,'' '') empdate   ,    '+ 
              '  nvl(  i.sex        ,'' '') sex       ,    '+
              '  nvl(to_char(i.toeicscore     ),''0'') toeicscore          '+
              'FROM pyccode cl, pyccode ra, pyccode jg, pyccode sc, pyccode mj, '+
              '     pycdept d,  pimpmas i                                       '+
              'WHERE cl.codeid = ''I112'' AND cl.codeno = i.paycl    '+
              '  AND ra.codeid = ''I113'' AND ra.codeno = i.payra    '+
              '  AND jg.codeid = ''I115'' AND jg.codeno = i.jobgun   '+
              '  AND sc.codeid (+)= ''I221'' AND sc.codeno (+)= i.lschgr     '+
              '  AND mj.codeid (+)= ''I225'' AND mj.codeno (+)= i.lmajorcode '+
              '  AND d.orgnum = i.orgnum and d.deptcode = i.deptcode '+
       Format('  AND i.empno IN ''%s''         ',[FEmpno])+
              'ORDER BY deptname, paycl, empno ';

            with MainForm.TMain do
            begin
                Close;
                ClearFieldInfo;
                ParamVariant := sSql;
                AddField('EMPNO'        , ftString,  4 );
                AddField('KORNAME'      , ftString,  12);
                AddField('ORGNUM'       , ftString,  3 );
                AddField('DEPTCODE'     , ftString,  6 );
                AddField('DEPTNAME'     , ftString,  60);
                AddField('IMASPAYCL'    , ftString,  3 );
                AddField('IMASPAYCLNAME', ftString,  20);
                AddField('PAYRA'        , ftString,  3 );
                AddField('PAYRANAME'    , ftString,  20);
                AddField('JOBGUN'       , ftString,  2 );
                AddField('JOBGUNNAME'   , ftString,  20);
                AddField('LSCHGR'       , ftString,  2 );
                AddField('SCHOOLNAME'   , ftString,  20);
                AddField('LMAJORCODE'   , ftString,  4 );
                AddField('MAJORNAME'    , ftString,  20);
                AddField('EMPDATE'      , ftString,  8 );
                AddField('SEX'          , ftString,  1 );
                AddField('TOEICSCORE'   , ftString,  7 );

                Sql.Clear;
                Sql.Text := ParamVariant;
                ServiceName := 'PIT1050C_SEL2';
                Open;
                //TFunc_TQueryAuto('SPIT1050S6', ParamVariant, MainForm.ttxMain);
            end;
          end;

      11: begin
//            sSql :=
   sSql := '  SELECT                                                                                   '+
         '    NVL(a.empno,         '' '') empno,                                                     '+
         '    NVL(a.monum,         '' '') monum,                                                     '+
         '    NVL(a.korname,       '' '') korname,                                                   '+
         '    NVL(a.orgnum,        '' '') orgnum,                                                    '+
         '    NVL(a.deptcode,      '' '') deptcode,                                                  '+
         '    (select deptname from pycdept where deptcode = a.deptcode)  deptname,                  '+
         '    NVL(a.paycl,         '' '') paycl,                                                     '+
         '    (select codename from pyccode where codeid = ''I112'' and codeno = a.paycl) payclname, '+
         '    NVL(a.payra,         '' '') payra,                                                     '+
         '    (select codename from pyccode where codeid = ''I113'' and codeno = a.payra) payraname, '+
         '    a.appdate           ,                                                                  '+
         '    a.aftdeptcode1      ,                                                                  '+
         '    a.aftdeptcode2      ,                                                                  '+
         '    a.aftdeptcode3      ,                                                                  '+
         '    (select deptname from pycdept where deptcode = a.aftdeptcode1)  aftdeptname1,          '+
         '    (select deptname from pycdept where deptcode = a.aftdeptcode2)  aftdeptname2,          '+
         '    (select deptname from pycdept where deptcode = a.aftdeptcode3)  aftdeptname3,          '+
         '    NVL(a.motive1,       '' '') motive1,                                                   '+
         '    NVL(a.motive2,       '' '') motive2,                                                   '+
         '    NVL(a.motive3,       '' '') motive3,                                                   '+
         '    NVL(a.etcdesc1,      '' '') etcdesc1,                                                  '+
         '    NVL(a.etcdesc2,      '' '') etcdesc2,                                                  '+
         '    NVL(a.etcdesc3,      '' '') etcdesc3,                                                  '+
         '    NVL(a.aftconyn1,     '' '') aftconyn,                                                  '+
         '    NVL(a.aftconyn2,     '' '') aftconyn,                                                  '+
         '    NVL(a.aftconyn3,     '' '') aftconyn,                                                  '+
         '    NVL(a.aftconempno1,  '' '') aftconempno1,                                              '+
         '    NVL(a.aftconempno2,  '' '') aftconempno2,                                              '+
         '    NVL(a.aftconempno3,  '' '') aftconempno3,                                              '+
         '    NVL(a.aftconkorname1, '' '') aftconkorname1,                                           '+
         '    NVL(a.aftconkorname2, '' '') aftconkorname2,                                           '+
         '    NVL(a.aftconkorname3, '' '') aftconkorname3,                                           '+
         '    NVL(a.aftcondate1,    '' '') aftcondate1,                                              '+
         '    NVL(a.aftcondate2,    '' '') aftcondate2,                                              '+
         '    NVL(a.aftcondate3,    '' '') aftcondate3,                                              '+
         '    NVL(a.state1,         '' '') state1,                                                   '+
         '    NVL(a.state2,         '' '') state2,                                                   '+
         '    NVL(a.state3,         '' '') state3,                                                   '+
         '    DECODE(a.state1,''1'',''대기중'',                                                      '+
         '                    ''2'',''검토중'',                                                      '+
         '                    ''3'',''처리완료'','' '') statename1,                                  '+
         '    DECODE(a.state2,''1'',''대기중'',                                                      '+
         '                    ''2'',''검토중'',                                                      '+
         '                    ''3'',''처리완료'','' '') statename2,                                  '+
         '    DECODE(a.state3,''1'',''대기중'',                                                      '+
         '                    ''2'',''검토중'',                                                      '+
         '                    ''3'',''처리완료'','' '') statename3,                                  '+
         '    NVL(a.statedate1,       '' '') statedate1,                                             '+
         '    NVL(a.statedate2,       '' '') statedate2,                                             '+
         '    NVL(a.statedate3,       '' '') statedate3                                              '+
         'FROM  pischnmas a                                                                          '+
 Format( 'WHERE a.empno = ''%s''                                                                     '+
         '  AND a.monum  = ''%s''                                                                    ',
         [FEmpno, MainForm.gsMonum ]);

  With MainForm.TMain do
  begin
    Close;
    ClearFieldInfo;
    AddField('EMPNO'             ,  ftString ,  4   );
    AddField('MONUM'             ,  ftString ,  3   );
    AddField('KORNAME'           ,  ftString ,  12  );
    AddField('ORGNUM'            ,  ftString ,  3   );
    AddField('DEPTCODE'          ,  ftString ,  6   );
    AddField('DEPTNAME'          ,  ftString ,  60  );
    AddField('PAYCL'             ,  ftString ,  3   );
    AddField('PAYCLNAME'         ,  ftString ,  20  );
    AddField('PAYRA'             ,  ftString ,  3   );
    AddField('PAYRANAME'         ,  ftString ,  20  );
    AddField('APPDATE'           ,  ftString ,  8   );
    AddField('AFTDEPTCODE1'      ,  ftString ,  6   );
    AddField('AFTDEPTCODE2'      ,  ftString ,  6   );
    AddField('AFTDEPTCODE3'      ,  ftString ,  6   );
    AddField('AFTDEPTNAME1'      ,  ftString ,  60  );
    AddField('AFTDEPTNAME2'      ,  ftString ,  60  );
    AddField('AFTDEPTNAME3'      ,  ftString ,  60  );
    AddField('MOTIVE1'           ,  ftString , 2000 );
    AddField('MOTIVE2'           ,  ftString , 2000 );
    AddField('MOTIVE3'           ,  ftString , 2000 );
    AddField('ETCDESC1'          ,  ftString , 2000 );
    AddField('ETCDESC2'          ,  ftString , 2000 );
    AddField('ETCDESC3'          ,  ftString , 2000 );
    AddField('AFTCONYN1'         ,  ftString ,  1   );
    AddField('AFTCONYN2'         ,  ftString ,  1   );
    AddField('AFTCONYN3'         ,  ftString ,  1   );
    AddField('AFTCONEMPNO1'      ,  ftString ,  4   );
    AddField('AFTCONEMPNO2'      ,  ftString ,  4   );
    AddField('AFTCONEMPNO3'      ,  ftString ,  4   );
    AddField('AFTCONKORNAME1'    ,  ftString ,  12  );
    AddField('AFTCONKORNAME2'    ,  ftString ,  12  );
    AddField('AFTCONKORNAME3'    ,  ftString ,  12  );
    AddField('AFTCONDATE1'       ,  ftString ,  8   );
    AddField('AFTCONDATE2'       ,  ftString ,  8   );
    AddField('AFTCONDATE3'       ,  ftString ,  8   );
    AddField('STATE1'            ,  ftString ,  1   );
    AddField('STATE2'            ,  ftString ,  1   );
    AddField('STATE3'            ,  ftString ,  1   );
    AddField('STATENAME1'        ,  ftString ,  20  );
    AddField('STATENAME2'        ,  ftString ,  20  );
    AddField('STATENAME3'        ,  ftString ,  20  );
    AddField('STATEDATE1'        ,  ftString ,  8   );
    AddField('STATEDATE2'        ,  ftString ,  8   );
    AddField('STATEDATE3'        ,  ftString ,  8   );

    Sql.Clear;
    Sql.Text := sSql;
//    edit1.Text := Sql.Text;
    ServiceName := 'PIT2030A_SEL3';
    open;

    //--------------------------------------------------------------------------
              //TFunc_TQueryAuto('SPIT2030S3', ParamVariant, MainForm.ttxMain);
            end;
          end;

      21: begin
            sSql := Format(
              'SELECT  '+
              ' nvl(        empno      ,'' ''),      nvl(        korname    ,'' ''),      '+
              ' nvl(        pstate     ,'' ''),      nvl(        pstateyn   ,'' ''),      '+
              ' nvl(        paycl      ,'' ''),      nvl(to_char(paygr     ),''0''),      '+
              ' nvl(        deptcode   ,'' ''),      nvl(        orgnum     ,'' ''),      '+
              ' nvl(        fieldcode  ,'' ''),      nvl(        boncode    ,'' ''),      '+
              ' nvl(        fincode    ,'' ''),      nvl(        payra      ,'' ''),      '+
              ' nvl(        paydunm    ,'' ''),      nvl(        realtrdate ,'' ''),      '+
              ' nvl(        offtrdate  ,'' ''),      nvl(        trlimfrdate ,'' ''),     '+
              ' nvl(        trlimtodate ,'' ''),     nvl(        payrayn    ,'' ''),      '+
              ' nvl(        cpayradate ,'' ''),      nvl(        jobdept    ,'' ''),      '+
              ' nvl(        jobplace   ,'' ''),      nvl(        orgempdate ,'' ''),      '+
              ' nvl(        empdate    ,'' ''),      nvl(        cpaycldate ,'' ''),      '+
              ' nvl(        paycldate  ,'' ''),      nvl(        reppaycl   ,'' ''),      '+
              ' nvl(        reppayfrdate ,'' ''),    nvl(        reppaytodate ,'' ''),    '+
              ' nvl(        apdpaydunm ,'' ''),      nvl(        apdpayfrdate ,'' ''),    '+
              ' nvl(        apdpaytodate ,'' ''),    nvl(        actpaydunm ,'' ''),      '+
              ' nvl(        actpayfrdate ,'' ''),    nvl(        actpaytodate ,'' ''),    '+
              ' nvl(        lragrdate  ,'' ''),      nvl(        remark     ,'' ''),      '+
              ' nvl(        empcode    ,'' ''),      nvl(        empterm    ,'' ''),      '+
              ' nvl(        empschgr   ,'' ''),      nvl(        emppaycl   ,'' ''),      '+
              ' nvl(to_char(emppaygr  ),''0''),      nvl(        empjobline ,'' ''),      '+
              ' nvl(        empjobplace ,'' ''),     nvl(to_char(grpaygrsum),''0''),      '+
              ' nvl(to_char(armypaygr ),''0''),      nvl(to_char(maspaygr  ),''0''),      '+
              ' nvl(to_char(carpaygr  ),''0''),      nvl(to_char(etcpaygr  ),''0''),      '+
              ' nvl(        etcpaycont ,'' ''),      nvl(to_char(bcaryy    ),''0''),      '+
              ' nvl(to_char(bcarmm    ),''0''),      nvl(        cardate    ,'' ''),      '+
              ' nvl(        jobgun     ,'' ''),      nvl(        jobgundate ,'' ''),      '+
              ' nvl(        jobline    ,'' ''),      nvl(        joblinedate ,'' ''),     '+
              ' nvl(        jobkind    ,'' ''),      nvl(        jobkinddate ,'' ''),     '+
              ' nvl(        jobduty    ,'' ''),      nvl(        jobdutydate ,'' ''),     '+
              ' nvl(        nogubun    ,'' ''),      nvl(        nojeonyn   ,'' ''),      '+
              ' nvl(        nojnfrdate ,'' ''),      nvl(        nojntodate ,'' ''),      '+
              ' nvl(        lancode    ,'' ''),      nvl(        lannono    ,'' ''),      '+
              ' nvl(        lanfrdate  ,'' ''),      nvl(        lantodate  ,'' ''),      '+
              ' nvl(to_char(exdutcnt  ),''0''),      nvl(to_char(exdutyy   ),''0''),      '+
              ' nvl(to_char(exdutmm   ),''0''),      nvl(to_char(exdutdd   ),''0''),      '+
              ' nvl(        lexfrdate  ,'' ''),      nvl(        lextodate  ,'' ''),      '+
              ' nvl(to_char(lexduyy   ),''0''),      nvl(to_char(lexdumm   ),''0''),      '+
              ' nvl(to_char(lexdudd   ),''0''),      nvl(to_char(payclyy   ),''0''),      '+
              ' nvl(to_char(payclmm   ),''0''),      nvl(to_char(paycldd   ),''0''),      '+
              ' nvl(to_char(totpaycldd),''0''),      nvl(to_char(comduyy   ),''0''),      '+
              ' nvl(to_char(comdumm   ),''0''),      nvl(to_char(comdudd   ),''0''),      '+
              ' nvl(to_char(totcomdudd),''0''),      nvl(        chnname    ,'' ''),      '+
              ' nvl(        engname    ,'' ''),      nvl(        eldsonyn   ,'' ''),      '+
              ' nvl(        marrigeyn  ,'' ''),      nvl(        juminid    ,'' ''),      '+
              ' nvl(to_char(korage    ),''0''),      nvl(to_char(usaage    ),''0''),      '+
              ' nvl(        sex        ,'' ''),      nvl(        holdname   ,'' ''),      '+
              ' nvl(        holdrel    ,'' ''),      nvl(        housetype  ,'' ''),      '+
              ' nvl(        health     ,'' ''),      nvl(        bohunyn    ,'' ''),      '+
              ' nvl(        bornarea   ,'' ''),      nvl(        regaddr    ,'' ''),      '+
              ' nvl(        curaddr    ,'' ''),      nvl(        zipno      ,'' ''),      '+
              ' nvl(        telno      ,'' ''),      nvl(        religion   ,'' ''),      '+
              ' nvl(        habit      ,'' ''),      nvl(        ability    ,'' ''),      '+
              ' nvl(        blood      ,'' ''),      nvl(to_char(height    ),''0''),      '+
              ' nvl(to_char(weight    ),''0''),      nvl(        armykind   ,'' ''),      '+
              ' nvl(        armycl     ,'' ''),      nvl(        armyfield  ,'' ''),      '+
              ' nvl(        armyfrdate ,'' ''),      nvl(        armytodate ,'' ''),      '+
              ' nvl(        armydis    ,'' ''),      nvl(        armyex     ,'' ''),      '+
              ' nvl(        lschgr     ,'' ''),      nvl(        lschdeg    ,'' ''),      '+
              ' nvl(        lschcode   ,'' ''),      nvl(        lschnm     ,'' ''),      '+
              ' nvl(        lmajorcode ,'' ''),      nvl(        lschfrym   ,'' ''),      '+
              ' nvl(        lschgrym   ,'' ''),      nvl(        unicode    ,'' ''),      '+
              ' nvl(        unimajor   ,'' ''),      nvl(        unifrym    ,'' ''),      '+
              ' nvl(        unigrym    ,'' ''),      nvl(        lschmajnm  ,'' ''),      '+
              ' nvl(        lschtopic  ,'' ''),      nvl(        lickind    ,'' ''),      '+
              ' nvl(        licgr      ,'' ''),      nvl(        licgetdate ,'' ''),      '+
              ' nvl(        licalkind  ,'' ''),      nvl(        licalgr    ,'' ''),      '+
              ' nvl(        licalgetdate ,'' ''),    nvl(        licalfield ,'' ''),      '+
              ' nvl(        licaldate  ,'' ''),      nvl(        licbigo    ,'' ''),      '+
              ' nvl(to_char(toeicscore),''0''),      nvl(to_char(toeicfull ),''0''),      '+
              ' nvl(        toeicdate  ,'' ''),      nvl(to_char(jptscore  ),''0''),      '+
              ' nvl(to_char(jptfull   ),''0''),      nvl(        jptdate    ,'' ''),      '+
              ' nvl(        edugubun   ,'' ''),      nvl(        eduplace   ,'' ''),      '+
              ' nvl(        educourse  ,'' ''),      nvl(        edufrdate  ,'' ''),      '+
              ' nvl(        edutodate  ,'' ''),      nvl(        eduarea    ,'' ''),      '+
              ' nvl(        educont    ,'' ''),      nvl(        edudufrdate ,'' ''),     '+
              ' nvl(        edudutodate ,'' ''),     nvl(        lrkind     ,'' ''),      '+
              ' nvl(        lrfrdate   ,'' ''),      nvl(        lrtodate   ,'' ''),      '+
              ' nvl(        lvfrdate   ,'' ''),      nvl(        lvtodate   ,'' ''),      '+
              ' nvl(        lsekind    ,'' ''),      nvl(        lsefrdate  ,'' ''),      '+
              ' nvl(        lsetodate  ,'' ''),      nvl(        lseplace   ,'' ''),      '+
              ' nvl(        lsesayu    ,'' ''),      nvl(        lsecont    ,'' ''),      '+
              ' nvl(        bohungubun ,'' ''),      nvl(        bohunnm    ,'' ''),      '+
              ' nvl(        bohunrel   ,'' ''),      nvl(        bohunno    ,'' ''),      '+
              ' nvl(        bohunbran  ,'' ''),      nvl(        scgubun    ,'' ''),      '+
              ' nvl(        scentdate  ,'' ''),      nvl(        scpredate  ,'' ''),      '+
              ' nvl(        scenddate  ,'' ''),      nvl(        sctermyn   ,'' ''),      '+
              ' nvl(to_char(scexyy    ),''0''),      nvl(to_char(scexmm    ),''0''),      '+
              ' nvl(to_char(scexdd    ),''0''),      nvl(        scexcause  ,'' ''),      '+
              ' nvl(        obskind    ,'' ''),      nvl(        obsgr      ,'' ''),      '+
              ' nvl(        obsstate   ,'' ''),      nvl(        hugubun    ,'' ''),      '+
              ' nvl(        hufrdate   ,'' ''),      nvl(        hutodate   ,'' ''),      '+
              ' nvl(        retdate    ,'' ''),      nvl(        retgubun   ,'' ''),      '+
              ' nvl(        retsayu1   ,'' ''),      nvl(        retsayu2   ,'' ''),      '+
              ' nvl(        retcont    ,'' ''),      nvl(        otdufrdate ,'' ''),      '+
              ' nvl(        otdutodate ,'' ''),      nvl(        tcontr     ,'' ''),      '+
              ' nvl(to_char(tcontramt ),''0''),      nvl(        ttype      ,'' ''),      '+
              ' nvl(        tjobduty   ,'' ''),      nvl(        tcond      ,'' ''),      '+
              ' nvl(        tcompany   ,'' ''),      nvl(        writetime  ,'' ''),      '+
              ' nvl(        writeemp   ,'' ''),      nvl(to_char(hanaduyy  ),''0''),      '+
              ' nvl(to_char(hanadumm  ),''0''),      nvl(to_char(hanadudd  ),''0'')       '+
              'from pimpmas                                                               '+
              'where empno = ''%s''                                                       ',
              [gsEmpno]);

            with MainForm.TMain do
            begin
              Close;
              ClearFieldInfo;
              ParamVariant := sSql;
              AddField('EMPNO'        , ftString ,  4 );
              AddField('KORNAME'      , ftString ,  12);
              AddField('PSTATE'       , ftString ,  2 );
              AddField('PSTATEYN'     , ftString ,  1 );
              AddField('PAYCL'        , ftString ,  3 );
              AddField('PAYGR'        , ftInteger,  3 );
              AddField('DEPTCODE'     , ftString ,  6 );
              AddField('ORGNUM'       , ftString ,  3 );
              AddField('FIELDCODE'    , ftString ,  3 );
              AddField('BONCODE'      , ftString ,  6 );
              AddField('FINCODE'      , ftString ,  6 );
              AddField('PAYRA'        , ftString ,  3 );
              AddField('PAYDUNM'      , ftString ,  30);
              AddField('REALTRDATE'   , ftString ,  8 );
              AddField('OFFTRDATE'    , ftString ,  8 );
              AddField('TRLIMFRDATE'  , ftString ,  8 );
              AddField('TRLIMTODATE'  , ftString ,  8 );
              AddField('PAYRAYN'      , ftString ,  1 );
              AddField('CPAYRADATE'   , ftString ,  8 );
              AddField('JOBDEPT'      , ftString ,  6 );
              AddField('JOBPLACE'     , ftString ,  2 );
              AddField('ORGEMPDATE'   , ftString ,  8 );
              AddField('EMPDATE'      , ftString ,  8 );
              AddField('CPAYCLDATE'   , ftString ,  8 );
              AddField('PAYCLDATE'    , ftString ,  8 );
              AddField('REPPAYCL'     , ftString ,  3 );
              AddField('REPPAYFRDATE' , ftString ,  8 );
              AddField('REPPAYTODATE' , ftString ,  8 );
              AddField('APDPAYDUNM'   , ftString ,  30);
              AddField('APDPAYFRDATE' , ftString ,  8 );
              AddField('APDPAYTODATE' , ftString ,  8 );
              AddField('ACTPAYDUNM'   , ftString ,  30);
              AddField('ACTPAYFRDATE' , ftString ,  8 );
              AddField('ACTPAYTODATE' , ftString ,  8 );
              AddField('LRAGRDATE'    , ftString ,  8 );
              AddField('REMARK'       , ftString ,  2 );
              AddField('EMPCODE'      , ftString ,  2 );
              AddField('EMPTERM'      , ftString ,  3 );
              AddField('EMPSCHGR'     , ftString ,  2 );
              AddField('EMPPAYCL'     , ftString ,  3 );
              AddField('EMPPAYGR'     , ftInteger,  3 );
              AddField('EMPJOBLINE'   , ftString ,  2 );
              AddField('EMPJOBPLACE'  , ftString ,  2 );
              AddField('GRPAYGRSUM'   , ftInteger,  3 );
              AddField('ARMYPAYGR'    , ftInteger,  3 );
              AddField('MASPAYGR'     , ftInteger,  3 );
              AddField('CARPAYGR'     , ftInteger,  3 );
              AddField('ETCPAYGR'     , ftInteger,  3 );
              AddField('ETCPAYCONT'   , ftString ,  30);
              AddField('BCARYY'       , ftInteger,  3 );
              AddField('BCARMM'       , ftInteger,  3 );
              AddField('CARDATE'      , ftString ,  8 );
              AddField('JOBGUN'       , ftString ,  2 );
              AddField('JOBGUNDATE'   , ftString ,  8 );
              AddField('JOBLINE'      , ftString ,  2 );
              AddField('JOBLINEDATE'  , ftString ,  8 );
              AddField('JOBKIND'      , ftString ,  2 );
              AddField('JOBKINDDATE'  , ftString ,  8 );
              AddField('JOBDUTY'      , ftString ,  3 );
              AddField('JOBDUTYDATE'  , ftString ,  8 );
              AddField('NOGUBUN'      , ftString ,  2 );
              AddField('NOJEONYN'     , ftString ,  1 );
              AddField('NOJNFRDATE'   , ftString ,  8 );
              AddField('NOJNTODATE'   , ftString ,  8 );
              AddField('LANCODE'      , ftString ,  3 );
              AddField('LANNONO'      , ftString ,  8 );
              AddField('LANFRDATE'    , ftString ,  8 );
              AddField('LANTODATE'    , ftString ,  8 );
              AddField('EXDUTCNT'     , ftInteger,  3 );
              AddField('EXDUTYY'      , ftInteger,  3 );
              AddField('EXDUTMM'      , ftInteger,  3 );
              AddField('EXDUTDD'      , ftInteger,  3 );
              AddField('LEXFRDATE'    , ftString ,  8 );
              AddField('LEXTODATE'    , ftString ,  8 );
              AddField('LEXDUYY'      , ftInteger,  3 );
              AddField('LEXDUMM'      , ftInteger,  3 );
              AddField('LEXDUDD'      , ftInteger,  3 );
              AddField('PAYCLYY'      , ftInteger,  3 );
              AddField('PAYCLMM'      , ftInteger,  3 );
              AddField('PAYCLDD'      , ftInteger,  3 );
              AddField('TOTPAYCLDD'   , ftInteger,  6 );
              AddField('COMDUYY'      , ftInteger,  3 );
              AddField('COMDUMM'      , ftInteger,  3 );
              AddField('COMDUDD'      , ftInteger,  3 );
              AddField('TOTCOMDUDD'   , ftInteger,  6 );
              AddField('CHNNAME'      , ftString ,  12);
              AddField('ENGNAME'      , ftString ,  20);
              AddField('ELDSONYN'     , ftString ,  1 );
              AddField('MARRIGEYN'    , ftString ,  1 );
              AddField('JUMINID'      , ftString ,  14);
              AddField('KORAGE'       , ftInteger,  3 );
              AddField('USAAGE'       , ftInteger,  3 );
              AddField('SEX'          , ftString ,  1 );
              AddField('HOLDNAME'     , ftString ,  12);
              AddField('HOLDREL'      , ftString ,  2 );
              AddField('HOUSETYPE'    , ftString ,  2 );
              AddField('HEALTH'       , ftString ,  1 );
              AddField('BOHUNYN'      , ftString ,  1 );
              AddField('BORNAREA'     , ftString ,  2 );
              AddField('REGADDR'      , ftString ,  50);
              AddField('CURADDR'      , ftString ,  50);
              AddField('ZIPNO'        , ftString ,  7 );
              AddField('TELNO'        , ftString ,  15);
              AddField('RELIGION'     , ftString ,  1 );
              AddField('HABIT'        , ftString ,  15);
              AddField('ABILITY'      , ftString ,  15);
              AddField('BLOOD'        , ftString ,  3 );
              AddField('HEIGHT'       , ftInteger,  4 );
              AddField('WEIGHT'       , ftInteger,  4 );
              AddField('ARMYKIND'     , ftString ,  1 );
              AddField('ARMYCL'       , ftString ,  2 );
              AddField('ARMYFIELD'    , ftString ,  2 );
              AddField('ARMYFRDATE'   , ftString ,  8 );
              AddField('ARMYTODATE'   , ftString ,  8 );
              AddField('ARMYDIS'      , ftString ,  1 );
              AddField('ARMYEX'       , ftString ,  2 );
              AddField('LSCHGR'       , ftString ,  2 );
              AddField('LSCHDEG'      , ftString ,  2 );
              AddField('LSCHCODE'     , ftString ,  4 );
              AddField('LSCHNM'       , ftString ,  30);
              AddField('LMAJORCODE'   , ftString ,  4 );
              AddField('LSCHFRYM'     , ftString ,  6 );
              AddField('LSCHGRYM'     , ftString ,  6 );
              AddField('UNICODE'      , ftString ,  4 );
              AddField('UNIMAJOR'     , ftString ,  4 );
              AddField('UNIFRYM'      , ftString ,  6 );
              AddField('UNIGRYM'      , ftString ,  6 );
              AddField('LSCHMAJNM'    , ftString ,  30);
              AddField('LSCHTOPIC'    , ftString ,  50);
              AddField('LICKIND'      , ftString ,  3 );
              AddField('LICGR'        , ftString ,  1 );
              AddField('LICGETDATE'   , ftString ,  8 );
              AddField('LICALKIND'    , ftString ,  3 );
              AddField('LICALGR'      , ftString ,  1 );
              AddField('LICALGETDATE' , ftString ,  8 );
              AddField('LICALFIELD'   , ftString ,  30);
              AddField('LICALDATE'    , ftString ,  8 );
              AddField('LICBIGO'      , ftString ,  40);
              AddField('TOEICSCORE'   , ftFloat  ,  7 );
              AddField('TOEICFULL'    , ftFloat  ,  7 );
              AddField('TOEICDATE'    , ftString ,  8 );
              AddField('JPTSCORE'     , ftFloat  ,  7 );
              AddField('JPTFULL'      , ftFloat  ,  7 );
              AddField('JPTDATE'      , ftString ,  8 );
              AddField('EDUGUBUN'     , ftString ,  2 );
              AddField('EDUPLACE'     , ftString ,  30);
              AddField('EDUCOURSE'    , ftString ,  60);
              AddField('EDUFRDATE'    , ftString ,  8 );
              AddField('EDUTODATE'    , ftString ,  8 );
              AddField('EDUAREA'      , ftString ,  10);
              AddField('EDUCONT'      , ftString ,  40);
              AddField('EDUDUFRDATE'  , ftString ,  8 );
              AddField('EDUDUTODATE'  , ftString ,  8 );
              AddField('LRKIND'       , ftString ,  2 );
              AddField('LRFRDATE'     , ftString ,  8 );
              AddField('LRTODATE'     , ftString ,  8 );
              AddField('LVFRDATE'     , ftString ,  8 );
              AddField('LVTODATE'     , ftString ,  8 );
              AddField('LSEKIND'      , ftString ,  2 );
              AddField('LSEFRDATE'    , ftString ,  8 );
              AddField('LSETODATE'    , ftString ,  8 );
              AddField('LSEPLACE'     , ftString ,  40);
              AddField('LSESAYU'      , ftString ,  40);
              AddField('LSECONT'      , ftString ,  40);
              AddField('BOHUNGUBUN'   , ftString ,  2 );
              AddField('BOHUNNM'      , ftString ,  12);
              AddField('BOHUNREL'     , ftString ,  2 );
              AddField('BOHUNNO'      , ftString ,  15);
              AddField('BOHUNBRAN'    , ftString ,  30);
              AddField('SCGUBUN'      , ftString ,  1 );
              AddField('SCENTDATE'    , ftString ,  8 );
              AddField('SCPREDATE'    , ftString ,  8 );
              AddField('SCENDDATE'    , ftString ,  8 );
              AddField('SCTERMYN'     , ftString ,  1 );
              AddField('SCEXYY'       , ftInteger,  3 );
              AddField('SCEXMM'       , ftInteger,  3 );
              AddField('SCEXDD'       , ftInteger,  3 );
              AddField('SCEXCAUSE'    , ftString ,  30);
              AddField('OBSKIND'      , ftString ,  2 );
              AddField('OBSGR'        , ftString ,  1 );
              AddField('OBSSTATE'     , ftString ,  30);
              AddField('HUGUBUN'      , ftString ,  2 );
              AddField('HUFRDATE'     , ftString ,  8 );
              AddField('HUTODATE'     , ftString ,  8 );
              AddField('RETDATE'      , ftString ,  8 );
              AddField('RETGUBUN'     , ftString ,  2 );
              AddField('RETSAYU1'     , ftString ,  2 );
              AddField('RETSAYU2'     , ftString ,  2 );
              AddField('RETCONT'      , ftString ,  40);
              AddField('OTDUFRDATE'   , ftString ,  8 );
              AddField('OTDUTODATE'   , ftString ,  8 );
              AddField('TCONTR'       , ftString ,  1 );
              AddField('TCONTRAMT'    , ftInteger,  12);
              AddField('TTYPE'        , ftString ,  20);
              AddField('TJOBDUTY'     , ftString ,  40);
              AddField('TCOND'        , ftString ,  40);
              AddField('TCOMPANY'     , ftString ,  2 );
              AddField('WRITETIME'    , ftString ,  15);
              AddField('WRITEEMP'     , ftString ,  4 );
              AddField('HANADUYY'     , ftInteger,  3 );
              AddField('HANADUMM'     , ftInteger,  3 );
              AddField('HANADUDD'     , ftInteger,  3 );

              Sql.Clear;
              Sql.Text := ParamVariant;
              ServiceName := 'PIT2030A_SEL8';
              //TFunc_TQueryAuto('SPIA1060S5', ParamVariant, MainForm.ttxMain);
            end;
          end;

      2 : begin
            sSql :=
              'SELECT  '+
              '    nvl(        a.empno         ,'' '') empno        , '+
              '    nvl(        a.korname       ,'' '') korname      , '+
              '    nvl(to_char(a.dutyno       ),''0'') dutyno       , '+
              '    nvl(        a.JobField      ,'' '') JobField     , '+
              '    nvl(        c.jobfieldname  ,'' '') jobfieldname , '+
              '    nvl(        a.dutykind      ,'' '') dutykind     , '+
              '    nvl(        d.dutykindname  ,'' '') dutykindname , '+
              '    nvl(        a.duty          ,'' '') duty         , '+
              '    nvl(        e.dutyname      ,'' '') dutyname     , '+
              '    nvl(        a.paycl         ,'' '') paycl        , '+
              '    nvl(        b.payclname     ,'' '') payclname    , '+
              '    nvl(        g.gubun         ,'' '') gubun        , '+
              '    nvl(        g.dutytext      ,'' '') dutytext     , '+
              '    nvl(        a.frdutydate    ,'' '') frdutydate   , '+
              '    nvl(        a.todutydate    ,'' '') todutydate   , '+
              '    nvl(to_char(a.dutyyy       ),''0'') dutyyy       , '+
              '    nvl(to_char(a.dutymm       ),''0'') dutymm       , '+
              '    nvl(to_char(a.dutytermrate ),''0'') dutytermrate , '+
              '    FLOOR((MONTHS_BETWEEN(TO_DATE(NVL(todutydate,TO_CHAR(sysdate,''YYYYMM'')),''YYYYMM''),     '+
              '                         TO_DATE(frdutydate,''YYYYMM''))+1) * nvl(a.dutytermrate/100,0)) dutyyymm, '+
              '    nvl(        a.dutylevel     ,'' '') dutylevel    , '+
              '    nvl(        f.dutylevelname ,'' '') dutylevelname  '+
              ' FROM                        '+
              '      (SELECT codeno, codename payclname    FROM pyccode WHERE codeid = ''I112'') b, '+ // 직급
              '      (SELECT codeno, codename jobfieldname FROM pyccode WHERE codeid = ''I116'') c, '+ // 업무분야
              '      pishrdukind d,             '+
              '      pishrduty e,               '+
              '      pishrlevel f,              '+
              '      (SELECT empno, dutyno, ''1'' gubun, dutytext    dutytext FROM pishrmas '+
       Format('       WHERE  empno IN ''%s''    ',[FEmpno])+
              '       UNION ALL                 '+
              '       SELECT empno, dutyno, ''2'' gubun, subdutytext dutytext FROM pishrsub '+
       Format('       WHERE  empno IN ''%s'') g,',[FEmpno])+
              '      pishrmas a                 '+
              ' WHERE a.empno = g.empno AND a.dutyno = g.dutyno '+
              '   AND a.paycl = b.codeno        '+
              '   AND a.JobField = c.codeno     '+
              '   AND a.JobField = d.JobField AND a.dutykind = d.dutykind '+
              '   AND a.JobField = e.JobField AND a.dutykind = e.dutykind AND a.duty = e.duty '+
              '   AND a.dutylevel = f.dutylevel '+
       Format('   AND a.empno IN ''%s''         ',[FEmpno])+
              ' ORDER BY a.empno, a.frdutydate, a.dutytermrate desc, a.duty ';


            with MainForm.TDuty do
            begin
                Close;
                ClearFieldInFo;
                ParamVariant := sSql;
                AddField('EMPNO'        , ftString ,  4 );
                AddField('KORNAME'      , ftString ,  12);
                AddField('DUTYNO'       , ftString ,  40);
                AddField('JOBFIELD'     , ftString ,  2 );
                AddField('JOBFIELDNAME' , ftString ,  20);
                AddField('DUTYKIND'     , ftString ,  10);
                AddField('DUTYKINDNAME' , ftString ,  30);
                AddField('DUTY'         , ftString ,  10);
                AddField('DUTYNAME'     , ftString ,  30);
                AddField('PAYCL'        , ftString ,  3 );
                AddField('PAYCLNAME'    , ftString ,  20);
                AddField('GUBUN'        , ftString ,  1 );
                AddField('DUTYTEXT'     , ftString ,  80);
                AddField('FRDUTYDATE'   , ftString ,  8 );
                AddField('TODUTYDATE'   , ftString ,  8 );
                AddField('DUTYYY'       , ftString ,  40);
                AddField('DUTYMM'       , ftString ,  40);
                AddField('DUTYTERMRATE' , ftString ,  40);
                AddField('DUTYYYMM'     , ftInteger,  10);
                AddField('DUTYLEVEL'    , ftString ,  2 );
                AddField('DUTYLEVELNAME', ftString ,  20);

                Sql.Clear;
                Sql.Text := ParamVariant;
                ServiceName := 'PIT1050C_SEL3';
                Open;
                //TFunc_TQueryAuto('SPIT1050S7', ParamVariant, MainForm.ttxDuty);
            end;
          end;

      3 : begin
            sSql :=
              'SELECT  '+
              '    nvl(        empno           ,'' '') empno        , '+
              '    nvl(        d.codeno        ,'' '') subid        , '+
              '    nvl(        d.codename      ,'' '') subname      , '+
              '    nvl(        eqipcode        ,'' '') eqipcode     , '+
              '    nvl(        c.codename      ,'' '') eqipname     , '+
              '    nvl(to_char(skillrate      ),'' '') skillrate    , '+
              '    nvl(to_char(useyy          ),'' '') useyy        , '+
              '    nvl(to_char(usemm          ),'' '') usemm          '+
              ' FROM           '+
              '      (select codeno, codename from pishrcode          '+
              '       where codeid = ''I711'' and codesuper = ''1'' and codemainon = ''1'') c, '+
              '      (select codeno, codename from pishrcode          '+
              '       where codeid = ''I711'' and codesuper = ''0'' and codemainon = ''1'') d, '+
              '      pishreqip '+
              ' WHERE eqipcode = c.codeno                             '+
              '   AND d.codeno = substr(c.codeno,1,length(d.codeno))  '+
       Format('   AND empno IN ''%s''                                 ',[FEmpno])+
              ' ORDER BY empno, useyy desc, usemm desc, eqipcode ';

            with MainForm.TEqip do
            begin
                Close;
                ClearFieldInfo;
                ParamVariant := sSql;
                AddField('EMPNO'        , ftString,  4 );
                AddField('SUBID'        , ftString,  10);
                AddField('SUBNAME'      , ftString,  30);
                AddField('EQIPCODE'     , ftString,  10);
                AddField('EQIPNAME'     , ftString,  30);
                AddField('SKILLRATE'    , ftString,  40);
                AddField('USEYY'        , ftString,  40);
                AddField('USEMM'        , ftString,  40);

                Sql.Clear;
                Sql.Text := ParamVariant;
                ServiceName := 'PIT1050C_SEL7';
                Open;
                //TFunc_TQueryAuto('SPIT1050SB', ParamVariant, MainForm.ttxEqip);
            end;

          end;

      4 : begin
            sSql :=
              'SELECT  '+
              '    nvl(        empno           ,'' '') empno        , '+
              '    nvl(        d.codeno        ,'' '') subid        , '+
              '    nvl(        d.codename      ,'' '') subname      , '+
              '    nvl(        progcode        ,'' '') progcode     , '+
              '    nvl(        c.codename      ,'' '') progname     , '+
              '    nvl(to_char(skillrate      ),'' '') skillrate    , '+
              '    nvl(to_char(useyy          ),'' '') useyy        , '+
              '    nvl(to_char(usemm          ),'' '') usemm          '+
              ' FROM            '+
              '      (select codeno, codename from pishrcode          '+
              '       where codeid = ''I713'' and codesuper = ''1'' and codemainon = ''1'') c, '+
              '      (select codeno, codename from pishrcode          '+
              '       where codeid = ''I713'' and codesuper = ''0'' and codemainon = ''1'') d, '+
              '      pishrprog  '+
              ' WHERE progcode = c.codeno                             '+
              '   AND d.codeno = substr(c.codeno,1,length(d.codeno))  '+
       Format('   AND empno IN ''%s''                                 ',[FEmpno])+
              ' ORDER BY empno, useyy desc, usemm desc, progcode ';

            with MainForm.TProg do
            begin
                Close;
                ClearFieldInfo;
                ParamVariant := sSql;
                AddField('EMPNO'        , ftString,  4 );
                AddField('SUBID'        , ftString,  10);
                AddField('SUBNAME'      , ftString,  30);
                AddField('PROGCODE'     , ftString,  10);
                AddField('PROGNAME'     , ftString,  30);
                AddField('SKILLRATE'    , ftString,  40);
                AddField('USEYY'        , ftString,  40);
                AddField('USEMM'        , ftString,  40);

                Sql.Clear;
                Sql.Text := ParamVariant;
                ServiceName := 'PIT1050C_SEL8';
                Open;
                //TFunc_TQueryAuto('SPIT1050SC', ParamVariant, MainForm.ttxProg);
            end;
          end;

      5 : begin  // 자격사항
            sSql :=
              'select                                               '+
               ' nvl(        empno           ,'' '') empno        , '+
               ' nvl(        lickind         ,'' '') lickind      , '+
               ' nvl(        codename        ,'' '') licename     , '+
               ' NVL(to_char(licrank        ),'' '') licrank      , '+
               ' NVL(        licgetdate      ,'' '') licgetdate   , '+
               ' NVL(        licalfield      ,'' '') licalfield     '+
              'from pyccode c, pimlice L                          '+
              'where c.codeid = ''I231'' and c.codeno = L.lickind '+
       Format('   AND empno IN ''%s''                             ',[FEmpno])+
              ' ORDER BY empno, lickind  ';

            with MainForm.TLice do
            begin
                Close;
                ClearFieldInfo;
                ParamVariant := sSql;
                AddField('EMPNO'        , ftString,  4 );
                AddField('LICKIND'      , ftString,  3 );
                AddField('LICENAME'     , ftString,  20);
                AddField('LICRANK'      , ftString,  40);
                AddField('LICGETDATE'   , ftString,  8 );
                AddField('LICALFIELD'   , ftString,  30);

                Sql.Clear;
                Sql.Text := ParamVariant;
                ServiceName := 'PIT1050C_SEL6';
                Open;
                //TFunc_TQueryAuto('SPIT1050SA', ParamVariant, MainForm.ttxLice);
            end;
          end;

      6 : begin // 교육사항
            sSql :=
              'select NVL(e.empno     , '' '') empno     ,     '+
              '       NVL(e.currcode  , '' '') currcode  ,     '+
              '       NVL(c.currname  , '' '') currname  ,     '+
              '       NVL(e.pointcode , '' '') pointcode ,     '+
              '       NVL(p.pointname , '' '') pointname ,     '+
              '       NVL(e.edufrdate , '' '') edufrdate ,     '+
              '       NVL(e.edutodate , '' '') edutodate       '+
              'from peduhis e, peducurr c, pedupoint p, pishrvari v   '+
              'where v.gubun = ''10'' and v.sgubun = ''0001''         '+
              '  and e.currcode = c.currcode                          '+
              '  and e.pointcode = p.pointcode                        '+
              '  and (e.currcode between NVL(v.value1,''0'') and NVL(v.value2, ''0'')      '+
              '       or e.currcode between NVL(v.value3,''0'') and NVL(v.value4, ''0'')   '+
              '       or e.currcode between NVL(v.value5,''0'') and NVL(v.value6, ''0'')   '+
              '       or e.currcode between NVL(v.value7,''0'') and NVL(v.value8, ''0'')   '+
              '       or e.currcode between NVL(v.value9,''0'') and NVL(v.value10,''0''))  '+
       Format('   AND e.empno IN ''%s''                               ',[FEmpno])+
              ' ORDER BY e.empno, e.edufrdate desc, e.currcode        ';

            with MainForm.TEDU do
            begin
                Close;
                ClearFieldInfo;
                ParamVariant := sSql;
                AddField('EMPNO'        , ftString,  4 );
                AddField('CURRCODE'     , ftString,  3 );
                AddField('CURRNAME'     , ftString,  30);
                AddField('POINTCODE'    , ftString,  3 );
                AddField('POINTNAME'    , ftString,  30);
                AddField('EDUFRDATE'    , ftString,  8 );
                AddField('EDUTODATE'    , ftString,  8 );

                Sql.Clear;
                Sql.Text := ParamVariant;
                ServiceName := 'PIT1050C_SEL9';
                Open;
//                TFunc_TQueryAuto('SPIT1050SD', ParamVariant, MainForm.ttxEDU);
            end;
          end;

      7 : begin // 학력사항
            sSql :=
              'select NVL(empno         , '' '') empno     ,   '+
              '       NVL(schgr         , '' '') schgr     ,   '+
              '       NVL(ch.codename   , '' '') schgrname ,   '+
              '       NVL(schcode       , '' '') schcode   ,   '+
              '       NVL(schnm         , '' '') schnm     ,   '+
              '       NVL(majorcode     , '' '') majorcode ,   '+
              '       NVL(mj.codename   , '' '') majorname ,   '+
              '       NVL(schfrym       , '' '') schfrym   ,   '+
              '       NVL(schtoym       , '' '') schtoym       '+
              'from pyccode ch, pyccode mj, pimscho c          '+
              'where ch.codeid (+) = ''I221'' and ch.codeno (+) = schgr     '+
              '  and mj.codeid (+) = ''I225'' and mj.codeno (+) = majorcode '+
       Format('   AND empno IN ''%s''                          ',[FEmpno])+
              ' ORDER BY empno, schfrym desc, schgr desc       ';

            with MainForm.TSCH do
            begin
                Close;
                ClearFieldInfo;
                ParamVariant := sSql;
                AddField('EMPNO'        , ftString,  4 );
                AddField('SCHGR'        , ftString,  2 );
                AddField('SCHGRNAME'    , ftString,  20);
                AddField('SCHCODE'      , ftString,  4 );
                AddField('SCHNM'        , ftString,  30);
                AddField('MAJORCODE'    , ftString,  4 );
                AddField('MAJORNAME'    , ftString,  20);
                AddField('SCHFRYM'      , ftString,  6 );
                AddField('SCHTOYM'      , ftString,  6 );

                Sql.Clear;
                Sql.Text := ParamVariant;
                ServiceName := 'PIT1050C_SELA';
                Open;
                //TFunc_TQueryAuto('SPIT1050SE', ParamVariant, MainForm.ttxSCH);
            end;
          end;

      8 : begin // 경력사항
            sSql :=
              'select NVL(empno         , '' '') empno     ,  '+
              '       NVL(carplace      , '' '') carplace  ,  '+
              '       NVL(carjobnm      , '' '') carjobnm  ,  '+
              '       NVL(to_char(carduyy), '' '') carduyy ,  '+
              '       NVL(to_char(cardumm), '' '') cardumm ,  '+
              '       NVL(to_char(cardudd), '' '') cardudd ,  '+
              '       NVL(carfrdate     , '' '') carfrdate ,  '+
              '       NVL(cartodate     , '' '') cartodate    '+
              'from pimcarr                                   '+
       Format('WHERE empno IN ''%s''                          ',[FEmpno])+
              'ORDER BY empno, carfrdate desc                 ';

            with MainForm.TCARR do
            begin
                Close;
                ClearFieldInfo;
                ParamVariant := sSql;
                AddField('EMPNO'        , ftString ,  4 );
                AddField('CARPLACE'     , ftString ,  30);
                AddField('CARJOBNM'     , ftString ,  30);
                AddField('CARDUYY'      , ftString ,  40);
                AddField('CARDUMM'      , ftString ,  40);
                AddField('CARDUDD'      , ftString ,  40);
                AddField('CARFRDATE'    , ftString ,  8 );
                AddField('CARTODATE'    , ftString ,  8 );

                Sql.Clear;
                Sql.Text := ParamVariant;
                ServiceName := 'PIT1050C_SELB';
                Open;
                //TFunc_TQueryAuto('SPIT1050SF', ParamVariant, MainForm.ttxCARR);
            end;
          end;
      9 : begin
            sSql :=
              'select NVL(empno         , '' '') empno     ,   '+
              '       NVL(spectext      , '' '') spectext      '+
              'from pishrspec                                  '+
       Format('WHERE empno IN ''%s''                           ',[FEmpno])+
              'ORDER BY empno                                  ';

            with MainForm.TETC do
            begin
                Close;
                ClearFieldInfo;
                ParamVariant := sSql;
                AddField('EMPNO'        , ftString ,  4  );
                AddField('SPECTEXT'     , ftString ,  300);

                Sql.Clear;
                Sql.Text := ParamVariant;
                ServiceName := 'PIT1050C_SELC';
                Open;
                //TFunc_TQueryAuto('SPIT1050SG', ParamVariant, MainForm.ttxETC);
            end;
          end;
    end;
end;

procedure TFm_SubForm1.Bt_PrintClick(Sender: TObject);
begin
  Application.Processmessages;

  if fnGetPrintData(TOnFocusButton(Sender).Tag) then
  begin
    if TOnFocusButton(Sender).Tag = 1 then
    begin
      Mainform.SB_Help.Panels[1].Text := '자료 추출중입니다... 잠시만 기달려 주십시오.';
      Application.ProcessMessages;
      fzOpenDataSets_Det(11, gsEmpno);
      Mainform.SB_Help.Panels[1].Text := '';
      Application.ProcessMessages;
      PreviewForm1.giGigubn := self.Tag;
      PreviewForm1.pequickRepPrn1.preview;
    end
    else if TOnFocusButton(Sender).Tag = 2 then
    begin
      Mainform.SB_Help.Panels[1].Text := '자료 추출중입니다... 잠시만 기달려 주십시오.';
      Application.ProcessMessages;

      Try
        // pit2030a0.pas 참고
        STB := Mainform.SB_Help;
        PrintFormInit;
        {$I-}
        AssignFile(tFile,HomeDir+'\list\pia1060c.tmp');  //임시 화일을 생성한다..
        System.ReWrite(tFile);
        {$I+}

        QmasExec(gsEmpno);
        Run_Text_Create;
      Finally
        System.Close(tFile);
      End;

      HelpHint('추출된 자료를 출력합니다 !!..');
      Report1.Preview;
      HelpHint('작업이 완료되었습니다 !!.');
      Screen.Cursor := crDefault;

      Mainform.SB_Help.Panels[1].Text := '작업이 완료되었습니다 !!.';
      Application.ProcessMessages;

      //PreviewForm2pequickRepPrn1.preview;
    end
    else if TOnFocusButton(Sender).Tag = 3 then
    begin
      Mainform.SB_Help.Panels[1].Text := '자료 추출중입니다... 잠시만 기달려 주십시오.';
      Application.ProcessMessages;
      fzOpenDataSets_Det(1, gsEmpno);
      fzOpenDataSets_Det(2, gsEmpno);
      fzOpenDataSets_Det(3, gsEmpno);
      fzOpenDataSets_Det(4, gsEmpno);
      fzOpenDataSets_Det(5, gsEmpno);
      fzOpenDataSets_Det(6, gsEmpno);
      fzOpenDataSets_Det(7, gsEmpno);
      fzOpenDataSets_Det(8, gsEmpno);
      fzOpenDataSets_Det(9, gsEmpno);
      Mainform.SB_Help.Panels[1].Text := '';
      Application.ProcessMessages;

      UPreview3.RptPerDetail.Preview
    end
    else
      ;
  end;
end;

procedure TFm_SubForm1.CB_aftConynChange(Sender: TObject);
begin
  if CB_aftConyn.Text = 'Y' then
    L_aftConyn.Caption := '수용'
  else if CB_aftConyn.Text = 'N' then
    L_aftConyn.Caption := '불수용'
  else
    L_aftConyn.Caption := ''; // 未定
end;
{// 부서조회
procedure TFm_SubForm1.E_aftDeptnameRightBtnClick(Sender: TObject);
var
  Valuer : TPeDestValuer_dept;
begin
  Try
    Valuer := TPeDestValuer_dept.Create(Self);
    if P_AftOrgnum.ValueCaption = '' then
      Valuer.orgnum := MainForm.P_orgnum
    else
      Valuer.orgnum := P_AftOrgnum.ValueCaption;

    if Valuer.Execute then
    begin
      P_AftOrgnum.ValueCaption   := Valuer.orgnum;
      P_AftDeptcode.ValueCaption := Valuer.deptcode;
      E_AftDeptname.text        := Valuer.deptname;
      // 정원, 현원
      gvVariant := MainForm.fnGetInwon(P_AftOrgnum.ValueCaption, P_aftDeptcode.ValueCaption);
      P_Ttotal.ValueCaption     := gvVariant[0];
      P_calcPtotal.ValueCaption := gvVariant[1];

      fzDataDisplay(gsEmpno, P_AftOrgnum.ValueCaption, P_aftDeptcode.ValueCaption);
    end;

  Finally
    Valuer.Free;
  End;
end;
}
procedure TFm_SubForm1.E_aftDeptnameInitPopup(Sender: TObject);
begin
  Fm_DestValue_dept.Edit         := TOnWinPopupEdit(Sender);
  if P_AftOrgnum.ValueCaption = '' then
    Fm_DestValue_dept.orgnum := MainForm.P_orgnum
  else
    Fm_DestValue_dept.orgnum := P_AftOrgnum.ValueCaption;

  TOnWinPopupEdit(Sender).PopupControl := Fm_DestValue_dept ;

end;

procedure TFm_SubForm1.E_aftDeptnameCloseUp(Sender: TObject;
  var Value: String; var CloseAccept: Boolean);
begin
      P_AftOrgnum.ValueCaption   := Fm_DestValue_dept.orgnum;
      P_AftDeptcode.ValueCaption := Fm_DestValue_dept.deptcode;
      E_AftDeptname.text        := Fm_DestValue_dept.deptname;
      // 정원, 현원
      gvVariant := MainForm.fnGetInwon(P_AftOrgnum.ValueCaption, P_aftDeptcode.ValueCaption);
      P_Ttotal.ValueCaption     := gvVariant[0];
      P_calcPtotal.ValueCaption := gvVariant[1];

      fzDataDisplay(gsEmpno);
end;
{//사원조회
procedure TFm_SubForm1.E_KornameRightBtnClick(Sender: TObject);
var
  Valuer : TPeDestValuer;
begin
  Try
    Valuer := TPeDestValuer.Create(Self);

    if Valuer.Execute then
    begin
      gsEmpno        := Valuer.empno;
      E_Korname.Text := Valuer.korname;
      P_ImasDeptname.ValueCaption  := Valuer.deptname;
      P_ImasPayclname.ValueCaption := Valuer.payclname;
      P_ImasPayraname.ValueCaption := Valuer.payraname;

      fzDataDisplay(gsEmpno, '', '');
    end;

  Finally
    Valuer.Free;
  End;
end;
}
procedure TFm_SubForm1.E_KornameInitPopup(Sender: TObject);
begin
  Fm_DestValue.Edit         := TOnWinPopupEdit(Sender);

  TOnWinPopupEdit(Sender).PopupControl := Fm_DestValue ;

end;

procedure TFm_SubForm1.E_KornameCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
      gsEmpno        := Fm_DestValue.empno;
      E_Korname.Text := Fm_DestValue.korname;
      P_ImasDeptname.ValueCaption  := Fm_DestValue.deptname;
      P_ImasPayclname.ValueCaption := Fm_DestValue.payclname;
      P_ImasPayraname.ValueCaption := Fm_DestValue.payraname;

      fzDataDisplay(gsEmpno);

end;

procedure TFm_SubForm1.E_KornameKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    fzCallEmp(E_Korname.Text);
end;

end.
