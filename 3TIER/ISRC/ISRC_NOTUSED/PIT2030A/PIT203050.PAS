unit Pit203050;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl, OnPopupEdit, StdCtrls,
  ExtCtrls, OnShapeLabel,Tmax_DataSetText, OnTmaxPersonEdit, Tmax_session,
  Db, NotesHana_TLB, OnSkinBtn, Buttons, ActiveX;


//  peextcombo, peoutlookbtn,  StdCtrls, Mask, pebtnedit,
//  PeJeonLabel, OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl,
//  OnTmaxPersonEdit, OnShapeLabel, OnTmaxCodeEdit, OnTmaxDeptEdit,
//  OnFocusButton, OnEditCombo, pegradpanl, Tmax_DataSetText, Db, OnPopupEdit,
//  Classes;

type
  TFm_SubForm5 = class(TForm)
    Shape2: TShape;
    Label1: TLabel;
    P_ImasPayclname: TOnShapeLabel;
    P_ImasPayraname: TOnShapeLabel;
    P_ImasDeptname: TOnShapeLabel;
    E_Korname: TOnWinPopupEdit;
    Label2: TLabel;
    Panel3: TPanel;
    pn_4: TPanel;
    pn_5: TPanel;
    pn_1: TPanel;
    pn_2: TPanel;
    pn_3: TPanel;
    E_aftdeptname1: TOnWinPopupEdit;
    E_aftdeptname2: TOnWinPopupEdit;
    E_aftdeptname3: TOnWinPopupEdit;
    pn_memo1: TPanel;
    pn_memo2: TPanel;
    pn_memo3: TPanel;
    Panel1: TPanel;
    P_Appdate: TOnShapeLabel;
    Panel2: TPanel;
    bt_close: TOnSkinButton;
    bt_save: TOnSkinButton;
    Bt_Imsave: TOnSkinButton;
    sp_memo1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Shape6: TShape;
    Label7: TLabel;
    Shape1: TShape;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    pn_state3: TPanel;
    pn_state2: TPanel;
    pn_state1: TPanel;
    pn_6: TPanel;
    pn_7: TPanel;
    pn_aftconyn1: TPanel;
    pn_aftconyn2: TPanel;
    pn_aftconyn3: TPanel;
    procedure FormShow(Sender: TObject);
    procedure E_aftdeptname1InitPopup(Sender: TObject);
    procedure E_aftdeptname1CloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure E_Deptname2InitPopup(Sender: TObject);
    procedure E_aftdeptname2CloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure E_aftdeptname3CloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure pn_memo1DblClick(Sender: TObject);
    procedure pn_memo2DblClick(Sender: TObject);
//    procedure pInset_Update(FEmpno : string);
    Function pInset_Update(FEmpno : String; Sender: TObject ): Boolean;
    procedure Bt_ImsaveClick(Sender: TObject);
    procedure pn_memo3DblClick(Sender: TObject);
    procedure bt_saveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bt_closeClick(Sender: TObject);

  private
    gsDeptCode1 : String;
    gsDeptCode2 : String;
    gsDeptCode3 : String;

    gsEmpno          : String;
    gsPaycl          : String;
    gsPayra          : String;
    gsOrgnum         : String;
    gsDeptcode       : String;
    gsAftOrgnum      : String;

    gsMotive1        : String;
    gsMotive2        : String;
    gsMotive3        : String;
    gsEtcDesc1       : String;
    gsEtcDesc2       : String;
    gsEtcDesc3       : String;

    gsAaftreqdate    : String;
    gsAftconoppinion : String;
    gsBefreqdate     : String;
    gsBefconoppinion : String;
    gsState          : String; // 1;등록중,2;대기중,3;지원부서검토중,4;지원부서 검토완료,5;소속부서검토중,6;소속부서 검토완료,7;처리완료
    gsStatedate      : String;
    save_gu          : String;
    gbBtCheck        : Boolean;

    Inter   : ILotusNotes_Hana;

    procedure fzDataDisplay(FEmpno, FOrgnum, FDeptcode: String);
    Function  fDataCheck(sender : TObject)  : Boolean;
    procedure pClear;
    procedure pHintMail;
  public
  end;

var
  Fm_SubForm5: TFm_SubForm5;

implementation

uses pit203000, UDepForm, UEmpForm, Pit203012, pitMemoForm, Pit203013, kpaylib;

{$R *.DFM}


procedure TFm_SubForm5.FormShow(Sender: TObject);
begin
   gbBtCheck                    := False;
   E_Korname.Text               := MainForm.pkorname ;
   P_ImasPayclname.ValueCaption := MainForm.pPaycl_na;
   P_ImasPayraname.ValueCaption := MainForm.pPayra_na;
   P_ImasDeptname.ValueCaption  := MainForm.pDeptname;



   if MainForm.class_gu = '2' then  //결재자
   begin
      E_Korname.ReadOnly := False;
   end else
   begin
      E_Korname.ReadOnly := True;
   end;
   fzDataDisplay(MainForm.pEmpno, MainForm.porgnum, MainForm.pDeptcode);
   // 임시
   if Panel1.Visible then
   begin
       pn_5.Width     := 295;
       pn_memo1.Width := 295;
       pn_memo2.Width := 295;
       pn_memo3.Width := 295;
   end else
   begin
       pn_5.Width     := 430;
       pn_memo1.Width := 430;
       pn_memo2.Width := 430;
       pn_memo3.Width := 430;
   end;
end;

procedure TFm_SubForm5.fzDataDisplay(FEmpno, FOrgnum, FDeptcode: String);
var
  {Msg,} Tem : String;
begin
   pClear;
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
         '  AND a.orgnum = ''%s'' AND a.deptcode = ''%s''                                            '+
         '  AND a.monum  = ''%s''                                                                    ',
         [Fempno, FOrgnum, FDeptcode, MainForm.gsMonum ]);

  With MainForm.TCDS do
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
    Sql.Text := Tem;
//    edit1.Text := Sql.Text;
    ServiceName := 'PIT2030A_SEL3';
    open;
    //TFunc_TQueryAuto('SPIT2030S3', Tem, TuxDm.TTXCDS);

//    showmessage(Inttostr(RecordCount));

    if FieldByName('EMPNO').AsString <> '' then
    begin
      gsEmpno                  := FieldByName('EMPNO').Asstring;
      E_Korname.text           := FieldByName('KORNAME').Asstring;
      gsOrgnum                 := FieldByName('ORGNUM').Asstring;
      gsDeptcode               := FieldByName('DEPTCODE').Asstring;

      P_Appdate.ValueCaption   := copy(FieldByName('APPDATE').Asstring,1,4) + '/'
                                + copy(FieldByName('APPDATE').Asstring,5,2) + '/'
                                + copy(FieldByName('APPDATE').Asstring,7,2);

      gsDeptCode1              := FieldByName('AFTDEPTCODE1').AsString;
      gsDeptCode2              := FieldByName('AFTDEPTCODE2').AsString;
      gsDeptCode3              := FieldByName('AFTDEPTCODE3').AsString;

      E_aftdeptname1.text      := FieldByName('AFTDEPTNAME1').Asstring;
      E_aftdeptname2.text      := FieldByName('AFTDEPTNAME2').Asstring;
      E_aftdeptname3.text      := FieldByName('AFTDEPTNAME3').Asstring;

      gsMotive1                := FieldByName('MOTIVE1').Asstring;
      gsMotive2                := FieldByName('MOTIVE2').Asstring;
      gsMotive3                := FieldByName('MOTIVE3').Asstring;

      gsEtcDesc1               := FieldByName('EtcDesc1').Asstring;
      gsEtcDesc2               := FieldByName('EtcDesc2').Asstring;
      gsEtcDesc3               := FieldByName('EtcDesc3').Asstring;

      pn_state1.Caption        := FieldByName('statename1').Asstring;
      pn_state2.Caption        := FieldByName('statename2').Asstring;
      pn_state3.Caption        := FieldByName('statename3').Asstring;

      pn_aftconyn1.Caption     := FieldByName('aftconyn1').Asstring;
      pn_aftconyn2.Caption     := FieldByName('aftconyn2').Asstring;
      pn_aftconyn3.Caption     := FieldByName('aftconyn3').Asstring;

{
      gsAaftreqdate            := FieldByName('지원부서의뢰일').Asstring;
      CB_aftConyn.Text         := FieldByName('지원부서결재여부').Asstring;
      P_aftConyn.ValueCaption   := FieldByName('지원부서결재여부').Asstring;
      gsAftconoppinion         := FieldByName('지원부서의견').Asstring;
      gsBefreqdate             := FieldByName('소속부서의뢰일').Asstring;
      P_befConyn.ValueCaption   := FieldByName('소속부서결재여부').Asstring;
      gsBefconoppinion         := FieldByName('소속부서의견').Asstring;
      gsState                  := FieldByName('처리상태구분').Asstring;
      P_statename.ValueCaption  := fnSetStateName(gsState);
      gsStatedate              := FieldByName('처리상태일').Asstring;

      // 정원, 현원
      gvVariant := MainForm.fnGetInwon(FieldByName('지원조직차수').Asstring,FieldByName('지원부서코드').Asstring);
      P_Ttotal.ValueCaption     := gvVariant[0];
      P_calcPtotal.ValueCaption := gvVariant[1];
}
      save_gu := 'U';
    end;

    Close;
  end;

end;

procedure TFm_SubForm5.E_aftdeptname1InitPopup(Sender: TObject);
begin
  Fm_DestValue_dept.Edit     := TOnWinPopupEdit(Sender);
  Fm_DestValue_dept.orgnum   := MainForm.P_orgnum;

  TOnWinPopupEdit(Sender).PopupControl := Fm_DestValue_dept ;
end;

procedure TFm_SubForm5.E_aftdeptname1CloseUp(Sender: TObject;
  var Text: String; var Accept: Boolean);
begin
   gsOrgnum             := Fm_DestValue_dept.orgnum;
   E_aftdeptname1.text  := Fm_DestValue_dept.deptname;
   gsDeptCode1          := Fm_DestValue_dept.deptcode;
end;

procedure TFm_SubForm5.E_Deptname2InitPopup(Sender: TObject);
begin
  Fm_DestValue_dept.Edit     := TOnWinPopupEdit(Sender);
  Fm_DestValue_dept.orgnum   := MainForm.P_orgnum;

  TOnWinPopupEdit(Sender).PopupControl := Fm_DestValue_dept ;

end;

procedure TFm_SubForm5.E_aftdeptname2CloseUp(Sender: TObject;
  var Text: String; var Accept: Boolean);
begin
//   gsOrgnum2            := Fm_DestValue_dept.orgnum;
   E_aftdeptname2.text  := Fm_DestValue_dept.deptname;
   gsDeptCode2          := Fm_DestValue_dept.deptcode;

end;

procedure TFm_SubForm5.E_aftdeptname3CloseUp(Sender: TObject;
  var Text: String; var Accept: Boolean);
begin
//   gsOrgnum3            := Fm_DestValue_dept.orgnum;
   E_aftdeptname3.text  := Fm_DestValue_dept.deptname;
   gsDeptCode3          := Fm_DestValue_dept.deptcode;
end;

procedure TFm_SubForm5.pn_memo1DblClick(Sender: TObject);
begin
  TRY
    MainForm.gsMemoGubn := '1' ;
    Fm_SubForm11 := TFm_SubForm11.Create(self);

    Fm_SubForm11.gsMotive1  := gsMotive1;
    Fm_SubForm11.gsEtcDesc1 := gsEtcDesc1;

    Fm_SubForm11.Showmodal;

    gsMotive1  := Fm_SubForm11.gsMotive1;
    gsEtcDesc1 := Fm_SubForm11.gsEtcDesc1;

  FINALLY
    Fm_SubForm11.Free;
  END;
end;

procedure TFm_SubForm5.pn_memo2DblClick(Sender: TObject);
begin
  TRY
    MainForm.gsMemoGubn := '2' ;
    Fm_SubForm11 := TFm_SubForm11.Create(self);

    Fm_SubForm11.gsMotive2  := gsMotive2;
    Fm_SubForm11.gsEtcDesc2 := gsEtcDesc2;

    Fm_SubForm11.Showmodal;

    gsMotive2  := Fm_SubForm11.gsMotive2;
    gsEtcDesc2 := Fm_SubForm11.gsEtcDesc2;

  FINALLY
    Fm_SubForm11.Free;
  END;
end;


Function TFm_SubForm5.pInset_Update(FEmpno : String; Sender: TObject ) : Boolean;
var
   ParamVariant : String;
begin
   Try
      Result := False;
      if pos('''',gsMotive1) > 0 then
      begin
         showmessage('지원동기1  : 특수문자[작은따옴표( '' )]를 사용할 수 없습니다. ');
         Result := False;
         Exit;
      end;
      if pos('''',gsMotive2) > 0 then
      begin
         showmessage('지원동기2  : 특수문자[작은따옴표( '' )]를 사용할 수 없습니다. ');
         Result := False;
         Exit;
      end;
      if pos('''',gsMotive3) > 0 then
      begin
         showmessage('지원동기3  : 특수문자[작은따옴표( '' )]를 사용할 수 없습니다. ');
         Result := False;
         Exit;
      end;
      if pos('''',gsEtcdesc1) > 0 then
      begin
         showmessage('지원동기기타1 : 특수문자[작은따옴표( '' )]를 사용할 수 없습니다. ');
         Result := False;
         Exit;
      end;

      if pos('''',gsEtcdesc2) > 0 then
      begin
         showmessage('지원동기기타2 :특수문자[작은따옴표( '' )]를 사용할 수 없습니다. ');
         Result := False;
         Exit;
      end;

      if pos('''',gsEtcdesc3) > 0 then
      begin
         showmessage('지원동기기타3 :특수문자[작은따옴표( '' )]를 사용할 수 없습니다. ');
         Result := False;
         Exit;
      end;


      if TOnSkinButton(Sender).name = 'bt_save' then
      begin
         if save_gu = 'U'  then
         begin
           ParamVariant := Format('Update pischnmas a set                                 '+
                                  '  (orgnum     , deptcode   ,                           '+
                                  '   paycl      , payra      ,                           '+
                                  '   appdate    ,                                        '+
                                  '   aftdeptcode1            ,                           '+
                                  '   aftdeptcode2            ,                           '+
                                  '   aftdeptcode3            ,                           '+
                                  '   motive1    , etcdesc1   ,                           '+
                                  '   motive2    , etcdesc2   ,                           '+
                                  '   motive3    , etcdesc3   ,                           '+
                                  '   state1     , statedate1 ,                           '+
                                  '   state2     , statedate2 ,                           '+
                                  '   state3     , statedate3 ,                           '+
                                  '   writeemp   , writetime) =                           '+
                                  '  (select NVL(a.orgnum, i.orgnum), NVL(a.deptcode, i.deptcode), '+
                                  '          NVL(a.paycl, i.paycl), NVL(a.payra, i.payra),'+
                                  '          TO_CHAR(sysdate,''YYYYMMDD'') ,              '+
                                  '          ''%s'' ,                                     '+
                                  '          ''%s'' ,                                     '+
                                  '          ''%s'' ,                                     '+
                                  '          ''%s'', ''%s'',                              '+
                                  '          ''%s'', ''%s'',                              '+
                                  '          ''%s'', ''%s'',                              '+
                                  '          ''1'', TO_CHAR(sysdate,''YYYYMMDD''),        '+
                                  '          ''1'', TO_CHAR(sysdate,''YYYYMMDD''),        '+
                                  '          ''1'', TO_CHAR(sysdate,''YYYYMMDD''),        '+
                                  '          ''%s'',TO_CHAR(sysdate,''YYYYMMDDHH24MISS'') '+
                                  '   from pimpmas i                                      '+
                                  '   where i.empno = a.empno)                            '+
                                  'Where empno = ''%s'' and monum = ''%s''                ',
                                  [gsDeptCode1,
                                   gsDeptCode2,
                                   gsDeptCode3,
                                   gsMotive1, gsEtcdesc1,
                                   gsMotive2, gsEtcdesc2,
                                   gsMotive3, gsEtcdesc3,
                                   MainForm.pEmpno,
                                   FEmpno,MainForm.gsMonum]);
          end
          else
          begin
           ParamVariant := Format('Insert Into pischnmas                               '+
                                  '  (empno      , korname    ,                        '+
                                  '   monum      ,                                     '+
                                  '   orgnum     , deptcode   ,                        '+
                                  '   paycl      , payra      ,                        '+
                                  '   appdate    ,                                     '+
                                  '   aftdeptcode1            ,                        '+
                                  '   aftdeptcode2            ,                        '+
                                  '   aftdeptcode3            ,                        '+
                                  '   motive1    , etcdesc1   ,                        '+
                                  '   motive2    , etcdesc2   ,                        '+
                                  '   motive3    , etcdesc3   ,                        '+
                                  '   state1     , statedate1  ,                       '+
                                  '   state2     , statedate2  ,                       '+
                                  '   state3     , statedate3  ,                       '+
                                  '   writeemp   , writetime)                          '+
                                  'select ''%s'', ''%s'',                              '+
                                  '       ''%s'',                                      '+
                                  '       i.orgnum, i.deptcode,                        '+
                                  '       i.paycl,  i.payra,                           '+
                                  '       TO_CHAR(sysdate,''YYYYMMDD'') ,              '+
                                  '       ''%s'' ,                                     '+
                                  '       ''%s'' ,                                     '+
                                  '       ''%s'' ,                                     '+
                                  '       ''%s'', ''%s'',                              '+
                                  '       ''%s'', ''%s'',                              '+
                                  '       ''%s'', ''%s'',                              '+
                                  '       ''1'', TO_CHAR(sysdate,''YYYYMMDD''),        '+
                                  '       ''1'', TO_CHAR(sysdate,''YYYYMMDD''),        '+
                                  '       ''1'', TO_CHAR(sysdate,''YYYYMMDD''),        '+
                                  '       ''%s'',TO_CHAR(sysdate,''YYYYMMDDHH24MISS'') '+
                                  'from pimpmas i                                      '+
                                  'where i.empno = ''%s''                              ',
                                  [FEmpno, E_Korname.Text,
                                   MainForm.gsMonum,
                                   gsDeptCode1,
                                   gsDeptCode2,
                                   gsDeptCode3,
                                   gsMotive1, gsEtcdesc1,
                                   gsMotive2, gsEtcdesc2,
                                   gsMotive3, gsEtcdesc3,
                                   MainForm.pEmpno,
                                   FEmpno]);
          end;
      end else
      begin
         if save_gu = 'U'  then
         begin
           ParamVariant := Format('Update pischnmas a set                                 '+
                                  '  (orgnum     , deptcode   ,                           '+
                                  '   paycl      , payra      ,                           '+
                                  '   aftdeptcode1            ,                           '+
                                  '   aftdeptcode2            ,                           '+
                                  '   aftdeptcode3            ,                           '+
                                  '   motive1    , etcdesc1   ,                           '+
                                  '   motive2    , etcdesc2   ,                           '+
                                  '   motive3    , etcdesc3   ,                           '+
                                  '   writeemp   , writetime) =                           '+
                                  '  (select NVL(a.orgnum, i.orgnum), NVL(a.deptcode, i.deptcode), '+
                                  '          NVL(a.paycl, i.paycl), NVL(a.payra, i.payra),'+
                                  '          ''%s'' ,                                     '+
                                  '          ''%s'' ,                                     '+
                                  '          ''%s'' ,                                     '+
                                  '          ''%s'', ''%s'',                              '+
                                  '          ''%s'', ''%s'',                              '+
                                  '          ''%s'', ''%s'',                              '+
                                  '          ''%s'', TO_CHAR(sysdate,''YYYYMMDDHH24MISS'')'+
                                  '   from pimpmas i                                      '+
                                  '   where i.empno = a.empno)                            '+
                                  'Where empno = ''%s'' and monum = ''%s''                ',
                                  [gsDeptCode1,
                                   gsDeptCode2,
                                   gsDeptCode3,
                                   gsMotive1, gsEtcdesc1,
                                   gsMotive2, gsEtcdesc2,
                                   gsMotive3, gsEtcdesc3,
                                   MainForm.pEmpno,
                                   FEmpno, MainForm.gsMonum]);
          end
          else
          begin
           ParamVariant := Format('Insert Into pischnmas                                '+
                                  '  (empno      , korname    ,                         '+
                                  '   monum      ,                                      '+
                                  '   orgnum     , deptcode   ,                         '+
                                  '   paycl      , payra      ,                         '+
                                  '   aftdeptcode1            ,                         '+
                                  '   aftdeptcode2            ,                         '+
                                  '   aftdeptcode3            ,                         '+
                                  '   motive1    , etcdesc1   ,                         '+
                                  '   motive2    , etcdesc2   ,                         '+
                                  '   motive3    , etcdesc3   ,                         '+
                                  '   writeemp   , writetime)                           '+
                                  'select ''%s'', ''%s'',                               '+
                                  '       ''%s''                  ,                     '+
                                  '       i.orgnum, i.deptcode,                         '+
                                  '       i.paycl,  i.payra,                            '+
                                  '       ''%s'' ,                                      '+
                                  '       ''%s'' ,                                      '+
                                  '       ''%s'' ,                                      '+
                                  '       ''%s'', ''%s'',                               '+
                                  '       ''%s'', ''%s'',                               '+
                                  '       ''%s'', ''%s'',                               '+
                                  '       ''%s'', TO_CHAR(sysdate,''YYYYMMDDHH24MISS'') '+
                                  'from pimpmas i                                       '+
                                  'where i.empno = ''%s''                               ',
                                  [FEmpno, E_Korname.Text,
                                   MainForm.gsMonum,
                                   gsDeptCode1,
                                   gsDeptCode2,
                                   gsDeptCode3,
                                   gsMotive1, gsEtcdesc1,
                                   gsMotive2, gsEtcdesc2,
                                   gsMotive3, gsEtcdesc3,
                                   MainForm.pEmpno,
                                   FEmpno]);
          end;
      end;

      with MainForm.TCupd do
      begin
        Close;
        Sql.Clear;
        Sql.Text := ParamVariant;
//        edit1.Text :=  Sql.Text;
        ServiceName := 'PIT2030A_DML';
        Execute;
      end;
      Result := True;
      Showmessage('저장완료되었습니다');
   Except
      MainForm.TCupd.Close;
   end;



end;


procedure TFm_SubForm5.Bt_ImsaveClick(Sender: TObject);
begin
   gbBtCheck := True;
   if fDataCheck(Sender) = False then Exit;
   if pInset_Update(MainForm.pEmpno, Sender)  then
      fzDataDisplay(MainForm.pEmpno, MainForm.porgnum, MainForm.pDeptcode);

end;

Function TFm_SubForm5.fDataCheck(Sender : TObject)  : Boolean;
var
   gsDeptCode1Temp, gsDeptCode2Temp, gsDeptCode3Temp : String;
begin
   if pn_state1.Caption <> '' then
   begin
      showmessage('등록완료 된 상태 입니다.');
      Result := False;
      Exit;
   end;

   if gsDeptCode1 = '' then gsDeptCode1Temp := '1'
   else                     gsDeptCode1Temp :=  gsDeptCode1;

   if gsDeptCode2 = '' then gsDeptCode2Temp := '2'
   else                     gsDeptCode2Temp :=  gsDeptCode2;

   if gsDeptCode3 = '' then gsDeptCode3Temp := '3'
   else                     gsDeptCode3Temp :=  gsDeptCode3;


   if ((gsDeptCode1Temp = gsDeptCode2Temp)  or
       (gsDeptCode1Temp = gsDeptCode3Temp)  or
       (gsDeptCode2Temp = gsDeptCode3Temp)) then
   begin
      showmessage('같은 부서를 지원할 수 없습니다.');
      Result := False;
      Exit;
   end;

   if TOnSkinButton(Sender).Name = 'Bt_Imsave' then //임시버튼은 여기까지만 check;
   begin
      Result := True;
      Exit;
   end;
   
   if E_aftdeptname1.Text = '' then
   begin
      showmessage(pn_1.Caption + ' ' + pn_4.Caption + '가 입력되지 않았습니다');
      Result := False;
      Exit;
   end;
   if E_aftdeptname2.Text = '' then
   begin
      showmessage(pn_2.Caption + ' ' + pn_4.Caption + '가 입력되지 않았습니다');
      Result := False;
      Exit;
   end;
   if E_aftdeptname3.Text = '' then
   begin
      showmessage(pn_3.Caption + ' ' + pn_4.Caption + '가 입력되지 않았습니다');
      Result := False;
      Exit;
   end;
   if (gsMotive1 = '') or (gsEtcdesc1 = '') then
   begin
      showmessage(pn_1.Caption + ' ' + pn_5.Caption + ' 입력되지 않았습니다');
      Result := False;
      Exit;
   end;
   if (gsMotive2 = '') or (gsEtcdesc2 = '') then
   begin
      showmessage(pn_2.Caption + ' ' + pn_5.Caption + ' 입력되지 않았습니다');
      Result := False;
      Exit;
   end;
   if (gsMotive3 = '') or (gsEtcdesc3 = '') then
   begin
      showmessage(pn_3.Caption + ' ' + pn_5.Caption + ' 입력되지 않았습니다');
      Result := False;
      Exit;
   end;

   Result := True;

end;


procedure TFm_SubForm5.pn_memo3DblClick(Sender: TObject);
begin
  TRY
    MainForm.gsMemoGubn := '3' ;
    Fm_SubForm11 := TFm_SubForm11.Create(self);

    Fm_SubForm11.gsMotive3  := gsMotive3;
    Fm_SubForm11.gsEtcDesc3 := gsEtcDesc3;

    Fm_SubForm11.Showmodal;

    gsMotive3  := Fm_SubForm11.gsMotive3;
    gsEtcDesc3 := Fm_SubForm11.gsEtcDesc3;

  FINALLY
    Fm_SubForm11.Free;
  END;
end;

procedure TFm_SubForm5.bt_saveClick(Sender: TObject);
begin
   gbBtCheck := True;
   if fDataCheck(Sender) = False then Exit;
   if pInset_Update(MainForm.pEmpno, Sender) then
      fzDataDisplay(MainForm.pEmpno, MainForm.porgnum, MainForm.pDeptcode);
   pHintMail;
end;



procedure TFm_SubForm5.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//   Action := caFree;
end;

procedure TFm_SubForm5.bt_closeClick(Sender: TObject);
begin
   if gbBtCheck = False then
     if MessageDlg('임시저장하시겠습니까?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        Bt_ImsaveClick(Sender);
   Close;
end;

procedure TFm_SubForm5.pClear;
begin
   E_aftdeptname1.Text := '';
   E_aftdeptname2.Text := '';
   E_aftdeptname3.Text := '';
   pn_memo1.Caption    := '';
   pn_memo2.Caption    := '';
   pn_memo3.Caption    := '';
   pn_state1.Caption    := '';
   pn_state2.Caption    := '';
   pn_state3.Caption    := '';
   pn_aftconyn1.Caption    := '';
   pn_aftconyn2.Caption    := '';
   pn_aftconyn3.Caption    := '';
end;
//--------------------------------------------------------------------------------------------
procedure TFm_SubForm5.pHintMail;
var
    i : integer;
    SL_Sql : String;
var
   MailTitle, MailKorname : string;
   iIdx : Integer;
   SendProgID, SendEmpno, RcveEmpno, MailSubject, MailBody, ReceiveYN : String;
begin
   CoInitialize(nil);  //메일발송시 에러 발생하여 ...(uses ActiveX)
   MailTitle := '[ 사내공모지원자 검토 요청 ]                                                ';
   MailBody  := '안녕하십니까?                                                               ' + #13#10 +
                '귀 부서에 사내공모지원자가 접수 되었습니다.                                 ' + #13#10 +
                '종합인사시스템에서 조속히 승인 또는 반려처리 하시기 바랍니다.               ' + #13#10 +
                '수고하십시요.                                                               ' + #13#10 + #13#10 +
                '<< 승인/반려 처리화면 접속 순서 >>                                          ' + #13#10 +
                ' [종합인사시스템 로그인] ☞ [인사/인력개발] ☞ [사내인재교류] ☞ [사내공모지원] ☞ [지원내역 조회/승인] ' ;


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


end.
