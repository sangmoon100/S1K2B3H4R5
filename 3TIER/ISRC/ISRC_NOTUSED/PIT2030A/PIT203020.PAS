unit Pit203020;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  peextcombo, peoutlookbtn, ExtCtrls, StdCtrls, Mask, pebtnedit,
  PeJeonLabel, OnEditBaseCtrl, OnEditStdCtrl, OnEditBtnCtrl,
  OnTmaxPersonEdit, OnShapeLabel, OnTmaxCodeEdit, OnTmaxDeptEdit,
  OnFocusButton, OnEditCombo, pegradpanl, OnEditMemo, OnEditNumCtl,
  Tmax_DataSetText, Calen1, Db, OnPopupEdit;

type
  TFm_SubForm2 = class(TForm)
    Panel2: TPanel;
    Bt_ImSave: TOnFocusButton;
    Bt_Add: TOnFocusButton;
    Bt_magam: TOnFocusButton;
    Panel1: TPanel;
    M_dutydesc: TOnMemo;
    M_Condition: TOnMemo;
    Shape1: TShape;
    Label1: TLabel;
    Label2: TLabel;
    Shape2: TShape;
    Label3: TLabel;
    Shape3: TShape;
    Label4: TLabel;
    Shape4: TShape;
    P_deptcode: TOnShapeLabel;
    E_CollectCnt: TOnNumberEdit;
    Bt_close: TOnFocusButton;
    E_Deptname: TOnWinPopupEdit;
    Bt_Del: TOnFocusButton;
    Panel3: TPanel;
    Panel4: TPanel;
    bt_save2: TOnFocusButton;
    P_Orgnum: TOnShapeLabel;
    pn_gubn: TPanel;
    Panel5: TPanel;
    E_Supplecnt: TOnShapeLabel;
    E_NoSuppleCnt: TOnShapeLabel;
    Panel6: TPanel;
    procedure Bt_closeClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Bt_ImSaveClick(Sender: TObject);
    procedure E_Supplecnt1Exit(Sender: TObject);
    procedure Bt_AddClick(Sender: TObject);
    procedure Bt_DelClick(Sender: TObject);
    procedure Bt_magamClick(Sender: TObject);
    procedure E_deptnameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure E_deptnameClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure E_CollectCntKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    Start       : Boolean;
    save_gu     : String;  //insert,update 구분
    giCall      : Integer;
    gvVariant   : OleVariant;

    gbBtCheck   : Boolean;

    gsConYN     : String;
    gsrepYN     : String;
    gsCloseYN   : String;
    procedure re_collect;
    procedure fzClearForm;
    procedure fzDataDisplay(FOrgnum, FDeptcode: String);   //data 유무 check
    procedure fzCallDept(FOrgnum, FDeptcode: String);
    function  fnCheckData: Boolean;
    function  fSaveCntCheck(FOrgnum, FDeptcode: String) : String;
    procedure  pE_SupplecntCheck;
  public
    { Public declarations }
  end;

var
  Fm_SubForm2: TFm_SubForm2;
  ParamVariant : string;     //insert

implementation

uses
  PIT203000, pit203030,  UDepForm, kpaylib;
{$R *.DFM}


procedure TFm_SubForm2.re_collect;
var
  Msg : String;
begin
//  Msg := '재 모집 하시겠습니까 ?';
//  if  MessageDlg(Msg,mtConfirmation,[mbYes,mbNo],0) = mrNo then
//  begin
    //GB1.SetFocus;
//    system.exit
//  end;

//  fzClearForm(2);
//  E_CollectCnt.SetFocus;
end;

procedure TFm_SubForm2.fzDataDisplay(FOrgnum, FDeptcode: String);
var
  Tem : String;
begin
  fzClearForm;

  Tem  := 'select                                                     '+
          '  nvl(a.orgnum,    '' '') orgnum,                          '+
          '  nvl(a.deptcode,  '' '') deptcode,                        '+
          '  nvl(b.deptname,  '' '') deptname,                        '+
          '  ''''                    regdate,                         '+
          '  nvl(to_char(a.collectcnt), ''0''  ) collectcnt,          '+
          '  nvl(a.supplecnt,''0'')  supplecnt,                       '+
          '  nvl(to_char(a.collectcnt - a.supplecnt), ''0'') diffcnt, '+
          '  nvl(a.dutydesc,  '' '') dutydesc,                        '+
          '  nvl(a.condition, '' '') condition,                       '+
          '  nvl(a.repempno,  '' '') repempno,                        '+
          '  nvl(a.repyn,     '' '') repyn,                           '+
          '  nvl(a.conempno,  '' '') conempno,                        '+
          '  nvl(a.conyn,     '' '') conyn,                           '+
          '  nvl(a.closeyn,   '' '') closeyn,                         '+
          '  nvl(to_char(a.closedate),  ''0''  ) closedate,           '+
          '  nvl(a.writetime, '' '') writetime,                       '+
          '  nvl(a.writeemp,  '' '') writeemp                         '+
          'from pischndept a, pycdept b                               '+
   format('where a.orgnum = ''%s'' and a.deptcode = ''%s''            '+
          '  and a.monum  = ''%s''                                    '+
          '  and a.orgnum = b.orgnum and a.deptcode  = b.deptcode     '+
          'order by a.closeyn, a.orgnum desc                          ',
          [FOrgnum, FDeptcode, MainForm.gsMonum ]);

  With MainForm.PischnDept do
  begin
    ServiceName := 'PIT2030A_SEL2';
    Close;
    Sql.Clear;
    Sql.Text := Tem;
//    edit1.Text := Sql.Text;

    ClearFieldInfo;
    AddField('조직차수'     , ftString,  3  );
    AddField('부서코드'     , ftString,  6  );
    AddField('부서명'       , ftString,  60 );
    AddField('등록일자'     , ftString,  8  );
    AddField('모집인원'     , ftString,  40 );
    AddField('충원인원'     , ftString,  40 );
    AddField('미충원인원'   , ftString,  40 );
    AddField('수행예정직무' , ftString,  600);
    AddField('자격요건'     , ftString,  600);
    AddField('상신사번'     , ftString,  4  );
    AddField('상신여부'     , ftString,  1  );
    AddField('결재사번'     , ftString,  4  );
    AddField('결재여부'     , ftString,  1  );
    AddField('모집마감여부' , ftString,  1  );
    AddField('모집마감일'   , ftString,  40 );
    AddField('WRITETIME'    , ftString,  15 );
    AddField('WRITEEMP'     , ftString,  4  );
    Open;

    if FieldByName('조직차수').AsString <> '' then
    begin
      P_Orgnum.ValueCaption     := FieldByName('조직차수').AsString;
      P_Deptcode.ValueCaption   := FieldByName('부서코드').AsString;
      E_deptname.Text           := FieldByName('부서명').AsString;
      E_CollectCnt.Value        := StrToInt(FieldByName('모집인원').AsString);
      E_Supplecnt.ValueCaption  := FieldByName('충원인원').Asstring;
      M_dutydesc.Text           := FieldByName('수행예정직무').AsString;
      M_Condition.Text          := FieldByName('자격요건').AsString;
      gsRepYN                   := FieldByName('상신여부').AsString;
      gsConYN                   := FieldByName('결재여부').AsString;
      gsCloseYN                 := FieldByName('모집마감여부').AsString;

      if gsConYN = 'Y' then E_CollectCnt.ReadOnly := True
      else                  E_CollectCnt.ReadOnly := False;
      pE_SupplecntCheck;
    end;
  end;
end;

function TFm_SubForm2.fSaveCntCheck(FOrgnum, FDeptcode: String) : String;
var
   SL_Sql : String;
begin
     //----------------
     // 등록완료
     //----------------
   SL_Sql := ' select count(*)   CNT                      '+
             '      , ''field2'' field2                   '+
             '      , ''field3'' field3                   '+
             '      , ''field4'' field4                   '+
             '      , ''field5'' field5                   '+
             '   from pischndept                          '+
             '  where orgnum   = ''%s''                   '+
             '    and deptcode = ''%s''                   ';

   SL_Sql := Format(SL_Sql,[FOrgnum,FDeptcode]);
   try
      with MainForm.TDS1 do
      begin
         ServiceName := 'HINSA_select';
         Close;
         Sql.Text := SL_Sql;

         ClearFieldInfo;
         AddField('CNT'       , ftString,  100);
         AddField('field2'    , ftString,  100);
         AddField('field3'    , ftString,  100);
         AddField('field4'    , ftString,  100);
         AddField('field5'    , ftString,  100);
         Open;

         if FieldByName('CNT').AsFloat >= 1 then  Result := 'U'
         else                                     Result := 'I';
      end;
   finally
   end;
end;

procedure TFm_SubForm2.Bt_closeClick(Sender: TObject);
begin
   if MainForm.class_gu = '2' then // 팀장
   begin
      if gbBtCheck = False then
        if MessageDlg('임시저장하시겠습니까?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
           Bt_ImsaveClick(Sender);
      Close;
   end;

   CLOSE;
end;

procedure TFm_SubForm2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  Action := caFree;
end;

procedure TFm_SubForm2.E_deptnameClick(Sender: TObject);
begin
//  fzClearForm(1);
end;

procedure TFm_SubForm2.E_deptnameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  if (Key = VK_RETURN) then
//    giCall := 1;
end;

procedure TFm_SubForm2.fzCallDept(FOrgnum, FDeptcode: String);
begin
  // 건수, 조직차수, 부서코드, 부서명
  giCall := 2;
  gvVariant := MainForm.fnGetPycdept(FOrgnum, FDeptcode);
  if gvVariant[0] = 1 then
  begin
    P_Orgnum.ValueCaption   := gvVariant[1];
    P_Deptcode.ValueCaption := gvVariant[2];
    E_Deptname.text        := gvVariant[3];

    fzDataDisplay(P_Orgnum.ValueCaption, P_deptcode.ValueCaption);
  end
  else
end;
procedure TFm_SubForm2.E_Supplecnt1Exit(Sender: TObject);
var
  iNum, work_su : integer;
begin
  Try
    iNum := strtoint(TOnNumberEdit(sender).Text);
  Except
      iNum := 0;
  End;

  TOnNumberEdit(sender).Text := IntToStr(iNum);

  if (strtointdef(E_CollectCnt.text,0) - strtointdef(E_Supplecnt.ValueCaption,0)) > 0 then
    E_NoSuppleCnt.ValueCaption := IntToStr(strtointdef(E_CollectCnt.text,0) - strtointdef(E_Supplecnt.ValueCaption,0))
  else
    E_NoSuppleCnt.ValueCaption := '0';
    

end;

function TFm_SubForm2.fnCheckData: Boolean;
var
  Msg: String;
  iNum: Integer;
begin
  Result := False;

  if (trim(P_Orgnum.ValueCaption) = '') or (trim(P_Deptcode.ValueCaption) = '') then
  begin
    Msg := '부서를 선택해 주십시오';
    MessageDlg(Msg, mtConfirmation, [mbOk], 0);
    //E_Deptname.Setfocus;
    System.Exit;
  end;
  // aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
  //if StrToIntdef(P_Ttotal.TextCaption,0) - StrToIntdef(P_calcPtotal.TextCaption,0) < 1 then
  //begin
  //  Msg := '현원이 정원과 같거나 많습니다. 더 이상 모집할 수 없습니다.';
  //  MessageDlg(Msg, mtConfirmation, [mbOk], 0);
  //  //E_Deptname.Setfocus;
  //  System.Exit;
  //end;

  //모집인원
  Try
    iNum := strtoint(E_CollectCnt.text);
  Except
      iNum := 0;
      E_CollectCnt.Setfocus;
  End;
  E_CollectCnt.text := IntToStr(iNum);
  //충원인원
  Try
    iNum := strtoint(E_Supplecnt.ValueCaption);
  Except
      iNum := 0;
//      E_Supplecnt.Setfocus;
  End;
  E_Supplecnt.ValueCaption := IntToStr(iNum);

  //미충원인원
  if (Bt_Add.Caption <> '저장') then
  begin
    E_NoSuppleCnt.ValueCaption := IntToStr(strtointdef(E_CollectCnt.text,0) - strtointdef(E_Supplecnt.ValueCaption,0));
    if (strtointdef(E_NoSuppleCnt.ValueCaption,0) <= 0) then
    begin
      Msg := '미충원인원이 1명 이상이어야 합니다.';
      MessageDlg(Msg, mtConfirmation, [mbOk], 0);
      E_NoSuppleCnt.ValueCaption := '0';
//      E_NoSupplecnt.Setfocus;
      System.Exit;
    end;
  end;
  // 수행예정직무
  if trim(M_dutydesc.Text) = '' then
  begin
    Msg := '수행예정직무를 기입해 주십시오';
    MessageDlg(Msg, mtConfirmation, [mbOk], 0);
    System.Exit;
  end;
  // 자격요건/우대사항
  if trim(M_Condition.Text) = '' then
  begin
    Msg := '자격요건/우대사항을 기입해 주십시오';
    MessageDlg(Msg, mtConfirmation, [mbOk], 0);
    System.Exit;
  end;

  Result := True;
end;



procedure TFm_SubForm2.Bt_ImSaveClick(Sender: TObject);
var
  Msg : string;
  iNum: Integer;
  sStr : String;
begin
   gbBtCheck := True;
//  showmessage(MainForm.gsMonum);
  if E_CollectCnt.ReadOnly = True then
  begin
     MessageDlg('등록완료된 자료입니다.', mtConfirmation, [mbOk], 0) ;
     fzDataDisplay(P_Orgnum.ValueCaption, P_deptcode.ValueCaption);
     Exit;
  end;

  Msg := '['+Bt_ImSave.Caption+'] 하시겠습니까 ?';
  if MessageDlg(Msg, mtConfirmation, [mbOk], 0) = mrNo then
    System.Exit;

  save_gu := fSaveCntCheck(P_Orgnum.ValueCaption, P_deptcode.ValueCaption);

//  if fnCheckData = False then
//    System.Exit;

  if save_gu = 'U'  then
    ParamVariant := Format('Update pischndept set                                '+
                           '  monum      = ''%s'' ,                              '+
                           '  collectcnt = ''%s'' ,                              '+
                           '  supplecnt  = ''%s'' ,                              '+
                           '  dutydesc   = ''%s'' ,                              '+
                           '  condition  = ''%s'' ,                              '+
                           '  writeemp   = ''%s'' ,                              '+
                           '  writetime  = TO_CHAR(sysdate,''YYYYMMDDHH24MISS'') '+
                           'where orgnum = ''%s''                                '+
                           '  and deptcode = ''%s''                              ',
                            [MainForm.gsMonum,
                             E_CollectCnt.text,
                             E_Supplecnt.ValueCaption,
                             kpaylib.replace(M_dutydesc.text,'''','`'),
                             kpaylib.replace(M_Condition.text,'''','`'),
                             MainForm.pempno,
                             P_Orgnum.ValueCaption,
                             P_deptcode.ValueCaption             ])

  else
    ParamVariant := Format('Insert into pischndept          '+
                           ' (orgnum     ,                  '+
                           '  deptcode   ,                  '+
                           '  monum      ,                  '+
                           '  collectcnt ,                  '+
                           '  supplecnt  ,                  '+
                           '  dutydesc   ,                  '+
                           '  condition  ,                  '+
                           '  writeemp   ,                  '+
                           '  writetime)                    '+
                           'values (                        '+
                           '  ''%s'',                       '+
                           '  ''%s'',                       '+
                           '  ''%s'',                       '+
                           '  ''%s'',                       '+
                           '  ''%s'',                       '+
                           '  ''%s'',                       '+
                           '  ''%s'',                       '+
                           '  ''%s'',                       '+
                           '  TO_CHAR(sysdate, ''YYYYMMDDHH24MISS'') )',
                           [P_Orgnum.ValueCaption,
                            P_deptcode.ValueCaption,
                            MainForm.gsMonum,
                            E_CollectCnt.text,
                            E_Supplecnt.ValueCaption,
                            kpaylib.replace(M_dutydesc.text,'''','`'),
                            kpaylib.replace(M_Condition.text,'''','`'),
                            MainForm.pempno]);
  with MainForm.TCupd do
  begin
    Close;
    Sql.Clear;
    Sql.Text := ParamVariant;
//    edit1.Text := Sql.Text;
    ServiceName := 'PIT2030A_DML';
    Execute;
  end;

  Mainform.gbChanged := True;
  Msg := '['+Bt_ImSave.Caption+'] 하였습니다.';
  MessageDlg(Msg, mtConfirmation, [mbOk], 0);

  fzDataDisplay(P_Orgnum.ValueCaption, P_deptcode.ValueCaption);
end;

procedure TFm_SubForm2.Bt_AddClick(Sender: TObject);
var
  Msg: string;
  Tem, sTemp: String;
begin
  gbBtCheck := True;
  if E_CollectCnt.ReadOnly = True then
  begin
     MessageDlg('등록완료된 자료입니다.', mtConfirmation, [mbOk], 0) ;
     fzDataDisplay(P_Orgnum.ValueCaption, P_deptcode.ValueCaption);     
     Exit;
  end;
  
   Msg := '['+ TOnFocusButton(Sender).Caption +'] 하시겠습니까 ?';
   if MessageDlg(Msg,mtConfirmation,[mbYes,mbNo],0) = mrNo then
     System.Exit;

   if fnCheckData = False then
     System.Exit;

   save_gu := fSaveCntCheck(P_Orgnum.ValueCaption, P_deptcode.ValueCaption);

   if TOnFocusButton(Sender).Name = 'Bt_Add' then    //등록완료
   begin
      E_CollectCnt.ReadOnly := True;
      if save_gu = 'U' then
      begin
         ParamVariant := 'Update pischndept set                                 '+
                   Format('  collectcnt = %s     ,                              '+
                          '  monum      = ''%s'' ,                              '+
                          '  supplecnt  = %s     ,                              '+
                          '  dutydesc   = ''%s'' ,                              '+
                          '  condition  = ''%s'' ,                              '+
                          '  conempno   = ''%s'' ,                              '+
                          '  conyn      = ''Y''  ,                              '+
                          '  writeemp   = ''%s'' ,                              '+
                          '  writetime  = TO_CHAR(sysdate,''YYYYMMDDHH24MISS'') '+
                          'where orgnum = ''%s''                                '+
                          '  and deptcode = ''%s''                              ',
                          [trim(E_CollectCnt.text),
                           MainForm.gsMonum,
                           trim(E_Supplecnt.ValueCaption),
                           kpaylib.replace(M_dutydesc.text,'''','`'),
                           kpaylib.replace(M_Condition.text,'''','`'),
                           MainForm.pempno,
                           MainForm.pempno,
                           P_Orgnum.ValueCaption,
                           P_deptcode.ValueCaption]);
      end else  //Insert;
      begin
          ParamVariant := 'Insert Into Pischndept         '+
               Format(' (orgnum     ,                     '+
                      '  deptcode   ,                     '+
                      '  monum      ,                     '+
                      '  collectcnt ,                     '+
                      '  supplecnt  ,                     '+
                      '  dutydesc   ,                     '+
                      '  condition  ,                     '+
                      '  repempno   ,                     '+
                      '  repyn      ,                     '+
                      '  conempno   ,                     '+
                      '  conyn      ,                     '+
                      '  writeemp   ,                     '+
                      '  writetime  )                     '+
                      'Values                             '+
                      ' (''%s''     ,                     '+
                      '  ''%s''     ,                     '+
                      '  ''%s''     ,                     '+
                      '  %s         ,                     '+
                      '  %s         ,                     '+
                      '  ''%s''     ,                     '+
                      '  ''%s''     ,                     '+
                      '  ''%s''     ,                     '+
                      '  ''Y''      ,                     '+
                      '  ''%s''     ,                     '+
                      '  ''Y''      ,                     '+
                      '  ''%s''     ,                     '+
                      '  TO_CHAR(sysdate,''YYYYMMDDHH24MISS'') ) ',
                      [P_Orgnum.ValueCaption,
                       P_deptcode.ValueCaption,
                       MainForm.gsMonum,
                       trim(E_CollectCnt.text),
                       trim(E_Supplecnt.ValueCaption),
                       kpaylib.replace(M_dutydesc.text,'''','`'),
                       kpaylib.replace(M_Condition.text,'''','`'),
                       MainForm.pempno,
                       MainForm.pempno,
                       MainForm.pempno]);

      end;
   end ;
{   else begin      // 저장
      if save_gu = 'U' then
      begin
            ParamVariant := 'Update pischndept set                              '+
                   Format('  collectcnt = ''%s'' ,                              '+
                          '  monum      = ''%s'' ,                              '+
                          '  supplecnt  = ''%s'' ,                              '+
                          '  dutydesc   = ''%s'' ,                              '+
                          '  condition  = ''%s'' ,                              '+
                          '  repempno   = ''%s'' ,                              '+
                          '  repyn      = ''Y''  ,                              '+
                          '  writeemp   = ''%s'' ,                              '+
                          '  writetime  = TO_CHAR(sysdate,''YYYYMMDDHH24MISS'') '+
                          'where orgnum = ''%s''                                '+
                          '  and deptcode = ''%s''                              ',
                          [trim(E_CollectCnt.text),
                           MainForm.gsMonum,
                           trim(E_Supplecnt.ValueCaption),
                           kpaylib.replace(M_dutydesc.text,'''','`'),
                           kpaylib.replace(M_Condition.text,'''','`'),
                           MainForm.pempno,
                           MainForm.pempno,
                           P_Orgnum.ValueCaption,
                           P_deptcode.ValueCaption]);
      end else  //Insert;
      begin
         ParamVariant := 'Insert Into Pischndept          '+
                  Format(' (orgnum     ,                  '+
                         '  deptcode   ,                  '+
                         '  monum      ,                  '+
                         '  collectcnt ,                  '+
                         '  supplecnt  ,                  '+
                         '  dutydesc   ,                  '+
                         '  condition  ,                  '+
                         '  repempno   ,                  '+
                         '  repyn      ,                  '+
                         '  writeemp   ,                  '+
                         '  writetime  )                  '+
                         'Values                          '+
                         ' (''%s''     ,                  '+
                         '  ''%s''     ,                  '+
                         '  ''%s''     ,                  '+
                         '  ''%s''     ,                  '+
                         '  ''%s''     ,                  '+
                         '  ''%s''     ,                  '+
                         '  ''%s''     ,                  '+
                         '  ''%s''     ,                  '+
                         '  ''Y''      ,                  '+
                         '  ''%s''     ,                  '+
                         '  TO_CHAR(sysdate,''YYYYMMDDHH24MISS'') ) ',
                         [P_Orgnum.ValueCaption,
                          P_deptcode.ValueCaption,
                          MainForm.gsMonum,
                          trim(E_CollectCnt.text),
                          trim(E_Supplecnt.ValueCaption),
                          kpaylib.replace(M_dutydesc.text,'''','`'),
                          kpaylib.replace(M_Condition.text,'''','`'),
                          MainForm.pempno,
                          MainForm.pempno])
       end;
   end;
       }
  with MainForm.TCupd do
  begin
    Close;
    Sql.Clear;
    Sql.Text := ParamVariant;
//    edit1.Text :=  ParamVariant;
    ServiceName := 'PIT2030A_DML';
    Execute;
  end;

  Mainform.gbChanged := True;
  Msg := '['+TOnFocusButton(Sender).Caption+'] 하였습니다.';
  MessageDlg(Msg, mtConfirmation, [mbOk], 0);

  fzDataDisplay(P_Orgnum.ValueCaption, P_deptcode.ValueCaption);
end;

procedure TFm_SubForm2.Bt_DelClick(Sender: TObject);
var
  Msg : string;
begin
  gbBtCheck := True;
  Msg := '['+Bt_Del.Caption+'] 하시겠습니까?.';
  if MessageDlg(Msg, mtConfirmation, [mbYes,mbNo], 0) = mrNo then
    System.Exit;

   ParamVariant := Format(' select empno      cnt             '+
                          '      , ''field2'' field2          '+
                          '      , ''field3'' field3          '+
                          '      , ''field4'' field4          '+
                          '      , ''field5'' field5          '+
                          '   from pischnmas                  '+
                          '  where monum    = ''M01''         '+
                          '    and deptcode = ''IKGG0''       ',
                          [ MainForm.gsMonum,
                            P_deptcode.ValueCaption]);

   try
      with MainForm.TDS_DEL do
      begin
         ServiceName := 'HINSA_select';
         Close;
         Sql.Text := ParamVariant;

         ClearFieldInfo;
         AddField('cnt'       , ftString,  100);
         AddField('field2'    , ftString,  100);
         AddField('field3'    , ftString,  100);
         AddField('field4'    , ftString,  100);
         AddField('field5'    , ftString,  100);
         Open;

         if RecordCount >= 1 then     //결재자
         begin
            ShowMessage('이미 지원한 팀원이 있으므로, 취소 불가합니다.');
            Exit;
         end;
      end;
   finally
   end;

   ParamVariant := Format('delete from pischndept                     '+
                          'where  orgnum   = ''%s''                   '+
                          '  and  deptcode = ''%s''                   '+
                          '  and  monum    = ''%s''                   ',
                           [P_Orgnum.ValueCaption,
                            P_deptcode.ValueCaption,
                            MainForm.gsMonum]);

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

   fzDataDisplay(P_Orgnum.ValueCaption, P_deptcode.ValueCaption);

end;

procedure TFm_SubForm2.Bt_magamClick(Sender: TObject);
var
  Msg   : string;
begin
  Msg := '['+Bt_Magam.Caption+'] 하였습니다.';
  if MessageDlg(Msg,mtConfirmation,[mbYes,mbNo],0) = mrNo then
    System.Exit;

  ParamVariant := Format('Update pischndept  set                         '+
                         '  closeyn   = ''Y''                         ,  '+
                         '  closedate = TO_CHAR(sysdate, ''YYYYMMDD''),  '+
                         '  monum   =  ''%s''                         ,  '+
                         '  writeemp  = ''%s''                        ,  '+
                         '  writetime = TO_CHAR(sysdate, ''YYYYMMDDHH24MISS'') '+
                         'where orgnum   = ''%s''                       '+
                         '  and deptcode = ''%s''                       ',
                          [MainForm.gsMonum,
                           MainForm.pempno,
                           P_Orgnum.ValueCaption,
                           P_deptcode.ValueCaption]);

  with MainForm.TCupd do
  begin
    Close;
    Sql.Clear;
    Sql.Text := ParamVariant;
    ServiceName := 'PIT2030A_DML';
    Execute;
  end;

  Mainform.gbChanged := True;
  Msg := '['+Bt_Magam.Caption+'] 하였습니다.';
  MessageDlg(Msg, mtConfirmation, [mbOk], 0);

  //fzDataDisplay(P_Orgnum.Textcaption, P_deptcode.Textcaption);
  gsCloseYN := 'Y';
end;

procedure TFm_SubForm2.fzClearForm;
begin
   E_CollectCnt.Text          := '0';
   E_Supplecnt.LabelCaption   := '0';
   E_NoSuppleCnt.ValueCaption := '0';
   M_dutydesc.Text            := '';
   M_Condition.Text           := '';
end;

procedure TFm_SubForm2.FormShow(Sender: TObject);
var
  Msg     : string;
  TTemp: TTMaxDataSet;
begin
   gbBtCheck := False;

   P_Orgnum.ValueCaption      := MainForm.porgnum;
   P_deptcode.ValueCaption    := MainForm.pDeptcode;
   E_Deptname.Text            := MainForm.pDeptname;



   if MainForm.class_gu = '2' then // 팀장
   begin
      fzDataDisplay(MainForm.porgnum, MainForm.pDeptcode);
      M_dutydesc.ReadOnly   := False;
      M_Condition.ReadOnly  := False;
      Bt_ImSave.Enabled     := True;
      Bt_Add.Enabled        := True;
      Bt_Del.Enabled        := True;
      pn_gubn.Enabled       := True;
      Panel4.Width          := 190;
      E_CollectCnt.Width    := 190;
   end
   else
   begin
     TTemp := MainForm.Tcollect;
     With TTemp do
     begin
         P_Orgnum.ValueCaption     := FieldByName('조직차수').AsString;
         P_Deptcode.ValueCaption   := FieldByName('부서코드').AsString;
         E_deptname.Text           := FieldByName('부서명').AsString;
         E_CollectCnt.Value        := StrToInt(FieldByName('모집인원').AsString);
         E_Supplecnt.ValueCaption  := FieldByName('충원인원').Asstring;
         M_dutydesc.Text           := FieldByName('수행예정직무').AsString;
         M_Condition.Text          := FieldByName('자격요건').AsString;
         gsRepYN                   := FieldByName('상신여부').AsString;
         gsConYN                   := FieldByName('결재여부').AsString;
         gsCloseYN                 := FieldByName('모집마감여부').AsString;
      end;
      E_CollectCnt.ReadOnly := True;
      M_dutydesc.ReadOnly   := True;
      M_Condition.ReadOnly  := True;
      Bt_ImSave.Enabled     := False;
      Bt_Add.Enabled        := False;
      Bt_Del.Enabled        := False;
      pn_gubn.Visible       := False;
      Panel4.Width          := 568;
      E_CollectCnt.Width    := 568;
   end;

   pE_SupplecntCheck;

   {
   E_deptname.text            := MainForm.Tcollect.FieldByName('부서명').Asstring;
   E_CollectCnt.Text          := MainForm.Tcollect.FieldByName('모집인원').Asstring;
   E_Supplecnt.ValueCaption   := MainForm.Tcollect.FieldByName('충원인원').Asstring;
   E_NoSuppleCnt.ValueCaption := MainForm.Tcollect.FieldByName('미충원인원').Asstring;
   M_dutydesc.Text            := MainForm.Tcollect.FieldByName('수행예정직무').Asstring;
   M_Condition.Text           := MainForm.Tcollect.FieldByName('자격요건').Asstring;
   gsRepYN                    := MainForm.Tcollect.FieldByName('상신여부').Asstring;
   gsConYN                    := MainForm.Tcollect.FieldByName('결재여부').Asstring;
   gsCloseYN                  := MainForm.Tcollect.FieldByName('모집마감여부').Asstring;
}
end;
procedure TFm_SubForm2.pE_SupplecntCheck;
begin
   // 모집인원 - 충원인원
   if (strtointdef(E_CollectCnt.text,0) - strtointdef(E_Supplecnt.ValueCaption,0)) > 0 then
      E_NoSuppleCnt.ValueCaption := IntToStr(strtointdef(E_CollectCnt.text,0) - strtointdef(E_Supplecnt.ValueCaption,0))
   else
      E_NoSuppleCnt.ValueCaption := '0';
      

end;

procedure TFm_SubForm2.E_CollectCntKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  iNum, work_su : integer;
begin
   if Key <> VK_Return then Exit;
   Try
     iNum := strtoint(TOnNumberEdit(sender).Text);
   Except
       iNum := 0;
   End;

   TOnNumberEdit(sender).Text := IntToStr(iNum);

   if (strtointdef(E_CollectCnt.text,0) - strtointdef(E_Supplecnt.ValueCaption,0)) > 0 then
     E_NoSuppleCnt.ValueCaption := IntToStr(strtointdef(E_CollectCnt.text,0) - strtointdef(E_Supplecnt.ValueCaption,0))
   else
     E_NoSuppleCnt.ValueCaption := '0';
end;

end.
