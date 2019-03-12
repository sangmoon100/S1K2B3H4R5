unit PIA1070B_2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OnTmaxCodeEdit, OnEditNumCtl, OnEditStdCtrl, OnEditBtnCtrl, OnEditCombo,
  OnEditBaseCtrl, OnShapeLabel, OnLineLabel, ExtCtrls, Db, Tmax_DataSetText,
  Tmax_session, ImgList, OnInsaCommon, StdCtrls, OnFocusButton, OnPopupEdit;

type
  TFM_SubForm1 = class(TForm)
    PA_Work1: TPanel;
    Shape8: TShape;
    Shape6: TShape;
    OnSectionLabel2: TOnSectionLabel;
    ED_deptname: TOnShapeLabel;
    ED_jobgun: TOnShapeLabel;
    ED_jobduty: TOnShapeLabel;
    ED_jobplace: TOnShapeLabel;
    ED_jobgundate: TOnShapeLabel;
    ED_jobdutydate: TOnShapeLabel;
    ED_payclyymmdd: TOnShapeLabel;
    ED_comduyymmdd: TOnShapeLabel;
    ED_reppaycl: TOnShapeLabel;
    ED_reppaydate: TOnShapeLabel;
    ED_actpaydate: TOnShapeLabel;
    ED_actpaydunm: TOnShapeLabel;
    ED_apdpaydunm: TOnShapeLabel;
    Shape7: TShape;
    OnSectionLabel1: TOnSectionLabel;
    ED_empcode: TOnShapeLabel;
    ED_empdate: TOnShapeLabel;
    ED_emppaycl: TOnShapeLabel;
    ED_cardate: TOnShapeLabel;
    ED_bcaryymm: TOnShapeLabel;
    ED_remark: TOnShapeLabel;
    ED_retdate: TOnShapeLabel;
    ED_retsayu1: TOnShapeLabel;
    ED_ttype: TOnShapeLabel;
    ED_tcontramt: TOnShapeLabel;
    ED_paygr: TOnShapeLabel;
    OnSectionLabel3: TOnSectionLabel;
    ED_usaage: TOnShapeLabel;
    ED_juminid: TOnShapeLabel;
    ED_eldsonyn: TOnShapeLabel;
    ED_sex: TOnShapeLabel;
    ED_bornarea: TOnShapeLabel;
    ED_health: TOnShapeLabel;
    Shape9: TShape;
    OnSectionLabel4: TOnSectionLabel;
    ED_lschgr: TOnShapeLabel;
    ED_lschnm: TOnShapeLabel;
    ED_lmajorcode: TOnShapeLabel;
    ED_unicode: TOnShapeLabel;
    ED_unimajor: TOnShapeLabel;
    ED_lickind: TOnShapeLabel;
    ED_licgr: TOnShapeLabel;
    ED_licalkind: TOnShapeLabel;
    ED_scpredate: TOnShapeLabel;
    ED_bohungubun: TOnShapeLabel;
    ED_bohunrel: TOnShapeLabel;
    ED_obskind: TOnShapeLabel;
    ED_obsstate: TOnShapeLabel;
    ED_scgubun: TOnShapeLabel;
    ED_scentdate: TOnShapeLabel;
    ED_sctermyn: TOnShapeLabel;
    ED_scenddate: TOnShapeLabel;
    ED_armydate: TOnShapeLabel;
    ED_armykind: TOnShapeLabel;
    ED_armydis: TOnShapeLabel;
    ED_armycl: TOnShapeLabel;
    ED_armyfield: TOnShapeLabel;
    ED_chnname: TOnEdit;
    ED_engname: TOnEdit;
    ED_marrigeyn: TOnComboEdit;
    ED_holdname: TOnEdit;
    ED_telno: TOnEdit;
    ED_religion: TOnComboEdit;
    ED_habit: TOnEdit;
    ED_ability: TOnEdit;
    ED_blood: TOnEdit;
    ED_height: TOnNumberEdit;
    ED_weight: TOnNumberEdit;
    ED_holdrel: TTMaxCodePopupEdit;
    ED_housetype: TTMaxCodePopupEdit;
    ED_tjobduty: TOnShapeLabel;
    ED_otdudate: TOnShapeLabel;
    ED_apdpaydate: TOnShapeLabel;
    ImageList2: TImageList;
    ED_curaddr: TOnEdit;
    BT_Save: TOnFocusButton;
    ED_zipno1: TOnWinPopupEdit;
    ED_regaddr: TOnWinPopupEdit;
    ED_birthgubun: TOnComboEdit;
    ED_birthday: TOnMaskEdit;
    ED_Groupcompany: TOnShapeLabel;
    ED_Groupempdate: TOnShapeLabel;
    ED_retcont: TOnEdit;
    ED_email: TOnEdit;
    ED_SKemail: TOnEdit;
    Ed_offitel: TOnEdit;
    ed_tcompany: TOnShapeLabel;
    ED_zipno: TOnMaskEdit;
    procedure ED_marrigeynGetImageIndex(Sender: TObject; const ItemIndex: Integer; var idx: Integer);
    procedure BT_SaveClick(Sender: TObject);
    procedure ED_zipno1CloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure ED_zipno1InitPopup(Sender: TObject);
    procedure ED_regaddrCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure ED_regaddrInitPopup(Sender: TObject);
    procedure ED_curaddrExit(Sender: TObject);
    procedure ED_regaddrExit(Sender: TObject);
    procedure ED_zipnoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    Tmpregaddr, Tmpaddr, Tmpfullregaddr, Tmpfulladdr  : string;
    Tmpregaddrlen, Tmpaddrlen : integer;
    Insa_Session : TTMaxSession;
    procedure PL_InitForm;
    procedure PL_Select_Data;
  end;

var
  FM_SubForm1: TFM_SubForm1;

implementation

uses PIA1070B_1, PIA1070B_8;

{$R *.DFM}

procedure TFM_SubForm1.PL_InitForm;
begin
  ED_holdrel.Session   := Insa_Session;
  ED_housetype.Session := Insa_Session;
end;

procedure TFM_SubForm1.PL_Select_Data;
begin
  with FM_Main.QR_pimpmas do
  begin
      Close;
      Sql.Clear;
      Sql.Text := Format(
                   'SELECT A.empno  , '+
                   '  A.korname     , '+
                   '  A.jobdept     , '+
                   '  A.deptcode    , '+
                   '  A.orgnum      , '+
                   '  (B.deptname || '' '' || B.deptna3) deptname, '+
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
                   '  Substr(A.juminid, 1,6) ||''-*******'' juminid, '+
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
                   '  FROM pimpmas A, pycdept B   '+
                   ' WHERE A.empno = ''%s''       '+
      	           '   AND A.orgnum   = B.orgnum  '+
	           '   AND A.deptcode = B.deptcode',[FM_Main.FG_CurEmpno]);
      Open;
      if  FM_Main.QR_pimpmas.Recordcount < 1 then
      begin
           MessageDlg('존재하지 않는 사원입니다.', mtInformation, [mbOK], 0);
           System.exit;
      end;

      Hinsa_FieldDisplay(Self,FM_Main.QR_pimpmas,4,11);

      FM_Main.FG_orgnum    := FieldByName('orgnum').AsString;
      FM_Main.FGIn_orgnum  := FieldByName('orgnum').AsString;
      Ed_zipno.Text               := FieldByName('zipno').AsString;
      Ed_paygr.ValueCaption       := FieldByName('emppaygr').AsString+' / '+ FieldByName('paygr').AsString;
      Tmpfullregaddr := Ed_regaddr.Text;   //30.01
      Tmpfulladdr    := Ed_curaddr.Text;   //30.01
      Ed_zipno.Text               := FieldByName('zipno').AsString;
      ED_usaage.ValueCaption      := '만 '+ FieldByName('korage').AsString +' 세'; //만나이로 변경..
      ED_jobplace.ValueCaption    := FM_Main.PL_Get_Code('I160',FieldByName('jobplace').AsString);
      ED_jobgun.ValueCaption      := FM_Main.PL_Get_Code('I115',FieldByName('jobgun').AsString);
      ED_jobduty.ValueCaption     := FM_Main.PL_Get_Code('I116',FieldByName('jobduty').AsString);
      ED_reppaycl.ValueCaption    := FM_Main.PL_Get_Code('I112',FieldByName('reppaycl').AsString);
      ED_payclyymmdd.ValueCaption := FieldByName('payclyy').AsString +'년'+
                                     FieldByName('payclmm').AsString +'월'+
                                     FieldByName('paycldd').AsString +'일';
      ED_comduyymmdd.ValueCaption := FieldByName('comduyy').AsString +'년'+
                                     FieldByName('comdumm').AsString +'월'+
                                     FieldByName('comdudd').AsString +'일';
      ED_jobgundate.ValueCaption  := Hinsa_DisplayDate(FieldByName('jobgundate').AsString,'/');
      ED_jobdutydate.ValueCaption := Hinsa_DisplayDate(FieldByName('jobdutydate').AsString,'/');
      ED_reppaydate.ValueCaption  := Hinsa_DisplayDate(FieldByName('reppayfrdate').AsString,'/')+'~'+
                                     Hinsa_DisplayDate(FieldByName('reppaytodate').AsString,'/');
      ED_actpaydate.ValueCaption  := Hinsa_DisplayDate(FieldByName('actpayfrdate').AsString,'/')+'~'+
                                     Hinsa_DisplayDate(FieldByName('actpaytodate').AsString,'/');
      ED_apdpaydate.ValueCaption  := Hinsa_DisplayDate(FieldByName('apdpayfrdate').AsString,'/')+'~'+
                                     Hinsa_DisplayDate(FieldByName('apdpaytodate').AsString,'/');
      ED_empcode.ValueCaption     := FM_Main.PL_Get_Code('I101',FieldByName('empcode').AsString);
      ED_emppaycl.ValueCaption    := FM_Main.PL_Get_Code('I112',FieldByName('emppaycl').AsString);

      ED_empdate.ValueCaption     := Hinsa_DisplayDate(FieldByName('empdate').AsString,'/');
      ED_groupempdate.ValueCaption:= Hinsa_DisplayDate(FieldByName('groupempdate').AsString,'/');
      ED_cardate.ValueCaption     := Hinsa_DisplayDate(FieldByName('cardate').AsString,'/');
      ED_bcaryymm.ValueCaption    := FieldByName('bcaryy').AsString +'년'+
                                     FieldByName('bcarmm').AsString +'월';
      ED_remark.ValueCaption      := FM_Main.PL_Get_Code('I040',FieldByName('remark').AsString);
      ED_retdate.ValueCaption     := Hinsa_DisplayDate(FieldByName('retdate').AsString,'/');
      ED_retsayu1.ValueCaption    := FM_Main.PL_Get_Code('I141',FieldByName('retsayu1').AsString);
      ED_otdudate.ValueCaption    := Hinsa_DisplayDate(FieldByName('otdufrdate').AsString,'/')+'~'+
                                     Hinsa_DisplayDate(FieldByName('otdutodate').AsString,'/');
      ED_tcontramt.ValueCaption   := FormatFloat('#,##0',FieldByName('tcontramt').AsFloat);
      if copy(FM_Main.QR_pimpmas.FieldByName('empno').AsString,1,1) ='Y' then
      begin
         ED_tcompany.LabelCaption    := '파견업체';
         ED_tcompany.ValueCaption    := FM_Main.PL_Get_Code('I902',FieldByName('tcompany').AsString);
      end
      else
      begin
         ED_tcompany.LabelCaption    := '';
         ED_tcompany.ValueCaption    := '';
      end;
      ED_tjobduty.ValueCaption    := FM_Main.PL_Get_Code('I702',FieldByName('tjobduty').AsString);
      ED_sex.ValueCaption         := FM_Main.PL_Get_Code('I039',FieldByName('sex').AsString);
      ED_bornarea.ValueCaption    := FM_Main.PL_Get_Code('I001',FieldByName('bornarea').AsString);
      ED_health.ValueCaption      := FM_Main.PL_Get_Code('I502',FieldByName('health').AsString);
      ED_retCont.text             := FieldByName('retcont').AsString;
      ED_Email.text               := FieldByName('e_mail').AsString;
      ED_SKEmail.text             := FieldByName('SKemail').AsString;
      ED_Offitel.text             := FieldByName('Offitel').AsString;
      ED_birthday.Text            := FieldByName('birthday').AsString;
      if FieldByName('birthgubun').AsString = '' then
      ED_birthgubun.Text          := '음력'
      else
      ED_birthgubun.Text          := FieldByName('birthgubun').AsString;

      ED_armydis.ValueCaption     := FM_Main.PL_Get_Code('I036',FieldByName('armydis').AsString);
      ED_armykind.ValueCaption    := FM_Main.PL_Get_Code('I031',FieldByName('armykind').AsString);
      ED_armycl.ValueCaption      := FM_Main.PL_Get_Code('I034',FieldByName('armycl').AsString);
      ED_armyfield.ValueCaption   := FM_Main.PL_Get_Code('I035',FieldByName('armyfield').AsString);
      ED_armydate.ValueCaption    := Hinsa_DisplayDate(FieldByName('armyfrdate').AsString,'/')+'~'+
                                     Hinsa_DisplayDate(FieldByName('armytodate').AsString,'/');
      ED_bohungubun.ValueCaption  := FM_Main.PL_Get_Code('I015',FieldByName('bohungubun').AsString);
      ED_bohunrel.ValueCaption    := FM_Main.PL_Get_Code('I211',FieldByName('bohunrel').AsString);
      ED_obskind.ValueCaption     := FM_Main.PL_Get_Code('I012',FieldByName('obskind').AsString);
      ED_scgubun.ValueCaption     := FM_Main.PL_Get_Code('I016',FieldByName('scgubun').AsString);
      ED_unicode.ValueCaption     := FM_Main.PL_Get_Code('I223',FieldByName('unicode').AsString);
      ED_unimajor.ValueCaption    := FM_Main.PL_Get_Code('I225',FieldByName('unimajor').AsString);
      ED_lschgr.ValueCaption      := FM_Main.PL_Get_Code('I221',FieldByName('lschgr').AsString);
      ED_lmajorcode.ValueCaption  := FM_Main.PL_Get_Code('I225',FieldByName('lmajorcode').AsString);
      ED_lickind.ValueCaption     := FM_Main.PL_Get_Code('I231',FieldByName('lickind').AsString);
      ED_licalkind.ValueCaption   := FM_Main.PL_Get_Code('I231',FieldByName('licalkind').AsString);
      ED_licgr.ValueCaption       := FM_Main.PL_Get_Code('I232',FieldByName('licgr').AsString);

      ED_scentdate.ValueCaption   := Hinsa_DisplayDate(FieldByName('scentdate').AsString,'/');
      ED_scenddate.ValueCaption   := Hinsa_DisplayDate(FieldByName('scenddate').AsString,'/');
      ED_scpredate.ValueCaption   := Hinsa_DisplayDate(FieldByName('scpredate').AsString,'/');

      if ED_reppaydate.ValueCaption = '~' then ED_reppaydate.ValueCaption := '';
      if ED_actpaydate.ValueCaption = '~' then ED_actpaydate.ValueCaption := '';
      if ED_apdpaydate.ValueCaption = '~' then ED_apdpaydate.ValueCaption := '';
      if ED_otdudate.ValueCaption   = '~' then ED_otdudate.ValueCaption := '';
      if ED_armydate.ValueCaption   = '~' then ED_armydate.ValueCaption := '';

      if ED_payclyymmdd.ValueCaption = '년월일' then ED_payclyymmdd.ValueCaption := '';
      if ED_comduyymmdd.ValueCaption = '년월일' then ED_comduyymmdd.ValueCaption := '';
      if ED_bcaryymm.ValueCaption    = '년월'   then ED_bcaryymm.ValueCaption := '';
      
      Close;
  end;
end;

procedure TFM_SubForm1.ED_marrigeynGetImageIndex(Sender: TObject; const ItemIndex: Integer; var idx: Integer);
begin
  idx := 0;
end;

procedure TFM_SubForm1.BT_SaveClick(Sender: TObject);
var
  Tem , religion: String;
begin
  if not ((length(ED_zipno.Text) >= 5)and(length(ED_zipno.Text) <= 6)) then
    begin
      MessageDlg('우편번호를 입력해 주세요.', mtInformation, [mbOK], 0);
      ED_zipno.SetFocus;
      System.Exit;
    end;
{
  if  (ED_chnname.Text = '') then
    begin
      MessageDlg('한자성명을 입력해 주세요.', mtInformation, [mbOK], 0);
      ED_chnname.SetFocus;
      System.Exit;
    end;

  if  (ED_engname.Text = '') then
    begin
      MessageDlg('영문성명을 입력해 주세요.', mtInformation, [mbOK], 0);
      ED_engname.SetFocus;
      System.Exit;
    end;
}
  if ED_religion.itemindex < 0 then
    religion := ''
  else
    religion := ED_religion.KeyItems[ED_religion.itemindex];

  Tem := Format('update pimpmas set                                                  '+
                'birthday  =''%s'',birthgubun  =''%s'',                              '+
                'zipno     =''%s'',curaddr   =''%s'',retcont  =''%s'',               '+
                'writetime =to_char(sysdate, ''YYYYMMDDHH24MISS''), writeemp =''%s'','+
                'regaddr   =''%s'',SKemail   = ''%s'', offitel   =''%s''             '+
                'where empno = ''%s'' and korname = ''%s''                           ',
                [ED_birthday.Text,  ED_birthGubun.text,
                 ED_zipno.Text,     ED_curaddr.Text, ED_retcont.Text,
                 FM_Main.FG_pempno,
                 ED_regaddr.Text, ED_SKEmail.Text, Ed_offitel.Text,
                 FM_Main.ED_empno.Text, FM_Main.ED_korname.ValueCaption ]);

(* 2014.05.15 김현순 M요청
  Tem := Format('update pimpmas set                                                  '+
                'chnname   =''%s'',engname  =''%s'',                                 '+
                'marrigeyn =''%s'',holdname =''%s'',                                 '+
                'holdrel   =''%s'',housetype=''%s'',                                 '+
                'curaddr   =''%s'',zipno    =''%s'',telno  =''%s'',retcont  =''%s'', '+
                'religion  =''%s'',habit    =''%s'',ability=''%s'',                  '+
                'blood     =''%s'',height   =''%f'',weight =''%f'',                  '+
                'birthday  =''%s'',birthgubun  =''%s'',                              '+
                'writetime =to_char(sysdate, ''YYYYMMDDHH24MISS''),writeemp =''%s'', '+
                'regaddr   =''%s'',e_mail   = ''%s'',SKemail   = ''%s'',             '+
                'offitel   =''%s''                                                   '+
                'where empno = ''%s'' and korname = ''%s''                           ',
                [ED_chnname.Text,   ED_engname.Text,
                 ED_marrigeyn.Text, ED_holdname.Text,
                 ED_holdrel.codeno, ED_housetype.codeno,
                 ED_curaddr.Text,   ED_zipno.Text, ED_telno.Text, ED_retcont.Text,
                 religion, ED_habit.Text, ED_ability.Text,
                 ED_blood.Text, ED_height.value, ED_weight.value,
                 ED_birthday.Text,  ED_birthGubun.text,
                 FM_Main.FG_pempno, ED_regaddr.Text,
                 ED_Email.Text,     ED_SKEmail.Text,
                 Ed_offitel.Text,
                 FM_Main.ED_empno.Text, FM_Main.ED_korname.ValueCaption ]);
*)
  with FM_Main.TDml do
    begin
      Close;
      Sql.Clear;
      Sql.text := Tem;
      ServiceName := 'PIB3012A_dml';
      if not Execute then
        begin
          Application.Messagebox('입력에 실패했습니다.','작업안내',mb_ok+ mb_IconStop);
        end;
    end;

  MessageDlg('인적사항을 저장하였습니다.', mtInformation, [mbOK], 0);

end;

procedure TFM_SubForm1.ED_zipno1CloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
(*    //2015.02.03.hjku.. 새주소 도입에 따른 프로그램 변경 건(요청서).. 김현순M 요청
  Tmpaddr            := '';
  Tmpaddrlen         := 0;

  if ZipForm.Zipno <> '' then
    begin
      Ed_zipno.Text      := Copy(ZipForm.ZipNo,1,3)+'-'+Copy(ZipForm.ZipNo,4,3);
      Ed_curaddr.Text    := ZipForm.Addr;
      Tmpaddr            := ZipForm.Addr;
      Tmpaddrlen         := Length(ZipForm.Addr);
      Ed_curaddr.SetFocus;
{    end
  else
    begin
       MessageDlg('우편번호 검색실패!!!.  검색 재시도 또는 직접입력하시기 바랍니다',mtError, [mbOk],0);
       Ed_zipno.ReadOnly := False;}
    end;
*)    
end;

procedure TFM_SubForm1.ED_zipno1InitPopup(Sender: TObject);
begin
(*    //2015.02.03.hjku.. 새주소 도입에 따른 프로그램 변경 건(요청서).. 김현순M 요청
  ZipForm.Edit         := TOnWinPopupEdit(Sender);
  ZipForm.E_Cond.Text  := Trim(Copy(Ed_zipno.Text,1,3)+Copy(Ed_zipno.Text,5,3));
  TOnWinPopupEdit(Sender).PopupControl := ZipForm ;
*)  
end;

procedure TFM_SubForm1.ED_regaddrCloseUp(Sender: TObject; var Text: String;
  var Accept: Boolean);
begin
  Tmpregaddr         := '';
  Tmpregaddrlen      := 0;
  if ZipForm.Zipno <> '' then
    begin
      Ed_regaddr.Text    := ZipForm.Addr;
      Tmpregaddr         := ZipForm.Addr;
      Tmpregaddrlen      := Length(ZipForm.Addr);
    end;
end;

procedure TFM_SubForm1.ED_regaddrInitPopup(Sender: TObject);
begin
  ZipForm.Edit         := TOnWinPopupEdit(Sender);
  ZipForm.E_Cond.Text  := '';
  TOnWinPopupEdit(Sender).PopupControl := ZipForm ;
end;

procedure TFM_SubForm1.ED_curaddrExit(Sender: TObject);
begin
{2015.03.03.hjku.. 직접입력으로 삭제...
   if (Tmpaddr<>'') and (Copy(Ed_curaddr.Text,1,Tmpaddrlen) <> Tmpaddr) then
      begin
         Application.Messagebox('우편번호에 따른 기본주소는 수정할 수 없습니다','작업안내',mb_ok+ mb_IconStop);
         Ed_curaddr.Text := Tmpaddr;
         Ed_curaddr.SetFocus;
      end
   else if (Tmpaddr='') and (Tmpfulladdr <> Ed_curaddr.Text ) then
      begin
         Application.Messagebox('주소 직접수정 불가능합니다. 우편번호 버튼을 이용해 주세요.','작업안내',mb_ok+ mb_IconStop);
         Ed_curaddr.Text := Tmpfulladdr;
         Ed_curaddr.SetFocus;
      end;
}
end;

procedure TFM_SubForm1.ED_regaddrExit(Sender: TObject);
begin
{2015.03.03.hjku.. 직접입력으로 삭제...
   if (Tmpregaddr<>'') and  (Copy(Ed_regaddr.Text,1,Tmpregaddrlen) <> Tmpregaddr) then
      begin
         Application.Messagebox('우편번호에 따른 기본주소는 수정할 수 없습니다','작업안내',mb_ok+ mb_IconStop);
         Ed_regaddr.Text := Tmpregaddr;
         Ed_regaddr.SetFocus;
      end
   else if (Tmpregaddr='') and (Tmpfullregaddr <> Ed_regaddr.Text ) then
      begin
         Application.Messagebox('주소 직접수정 불가능합니다. 우편번호 버튼을 이용해 주세요.','작업안내',mb_ok+ mb_IconStop);
         Ed_regaddr.Text := Tmpfullregaddr;
         Ed_regaddr.SetFocus;
      end;
}      
end;

procedure TFM_SubForm1.ED_zipnoKeyPress(Sender: TObject; var Key: Char);
begin
    //2015.02.03.hjku.. 새주소 도입에 따른 프로그램 변경 건(요청서).. 김현순M 요청
    //우편번호 입력은 숫자 최대 5~6자리만 가능하도록 수정
    if not (Key in ['0'..'9', Char(VK_DELETE), Char(VK_BACK)]) then    Key := #0;
end;

end.
