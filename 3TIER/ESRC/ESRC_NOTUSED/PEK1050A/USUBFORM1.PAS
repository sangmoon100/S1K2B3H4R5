unit USubForm1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, Buttons, ExtCtrls, DBGrids, Db, DBClient, peoutlookbtn,
  PeJeonVertLabel, PeJeonLabel, ComCtrls, Tmax_DataSetText, OnEditBaseCtrl,
  OnEditStdCtrl, OnEditMemo, OnShapeLabel, OnDBGrid, Psock, NMFtp, Func,
  OnFocusButton, OnLineLabel, OnRadioBtn;

type
  TSubForm1 = class(TForm)
    Panel1: TPanel;
    OnShapeLabel1: TOnShapeLabel;
    E_ActPlan1: TOnMemo;
    E_Bigo1: TOnMemo;
    OnShapeLabel3: TOnShapeLabel;
    OnShapeLabel5: TOnShapeLabel;
    OnShapeLabel4: TOnShapeLabel;
    OnShapeLabel6: TOnShapeLabel;
    E_Actcomment1: TOnMemo;
    E_Itemname2: TOnMemo;
    E_ActPlan2: TOnMemo;
    E_Bigo2: TOnMemo;
    E_Actcomment2: TOnMemo;
    E_Itemname3: TOnMemo;
    E_ActPlan3: TOnMemo;
    E_Bigo3: TOnMemo;
    E_Actcomment3: TOnMemo;
    E_Itemname4: TOnMemo;
    E_ActPlan4: TOnMemo;
    E_Bigo4: TOnMemo;
    E_Actcomment4: TOnMemo;
    E_Itemname5: TOnMemo;
    E_ActPlan5: TOnMemo;
    E_Bigo5: TOnMemo;
    E_Actcomment5: TOnMemo;
    E_itemno: TOnEdit;
    L_AppFile: TOnSectionLabel;
    Bt_FileApp: TOnFocusButton;
    NMFTP1: TNMFTP;
    OpenDialog1: TOpenDialog;
    B_Save1: TPeJeonOutLookBtn;
    E_Itemname1: TOnMemo;
    E_Self11: TOnRadioButton;
    E_Self12: TOnRadioButton;
    E_Self13: TOnRadioButton;
    E_Self14: TOnRadioButton;
    E_Self15: TOnRadioButton;
    E_E1C11: TOnRadioButton;
    E_E1C12: TOnRadioButton;
    E_E1C13: TOnRadioButton;
    E_E1C14: TOnRadioButton;
    E_E1C15: TOnRadioButton;
    E_Self21: TOnRadioButton;
    E_Self22: TOnRadioButton;
    E_Self23: TOnRadioButton;
    E_Self24: TOnRadioButton;
    E_Self25: TOnRadioButton;
    E_E1C25: TOnRadioButton;
    E_E1C24: TOnRadioButton;
    E_E1C23: TOnRadioButton;
    E_E1C22: TOnRadioButton;
    E_E1C21: TOnRadioButton;
    E_Self31: TOnRadioButton;
    E_Self32: TOnRadioButton;
    E_Self33: TOnRadioButton;
    E_Self34: TOnRadioButton;
    E_Self35: TOnRadioButton;
    E_E1C35: TOnRadioButton;
    E_E1C34: TOnRadioButton;
    E_E1C33: TOnRadioButton;
    E_E1C32: TOnRadioButton;
    E_E1C31: TOnRadioButton;
    E_Self41: TOnRadioButton;
    E_Self42: TOnRadioButton;
    E_Self43: TOnRadioButton;
    E_Self44: TOnRadioButton;
    E_Self45: TOnRadioButton;
    E_E1C45: TOnRadioButton;
    E_E1C44: TOnRadioButton;
    E_E1C43: TOnRadioButton;
    E_E1C42: TOnRadioButton;
    E_E1C41: TOnRadioButton;
    E_Self51: TOnRadioButton;
    E_Self52: TOnRadioButton;
    E_Self53: TOnRadioButton;
    E_Self54: TOnRadioButton;
    E_Self55: TOnRadioButton;
    E_E1C55: TOnRadioButton;
    E_E1C54: TOnRadioButton;
    E_E1C53: TOnRadioButton;
    E_E1C52: TOnRadioButton;
    E_E1C51: TOnRadioButton;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure E_Itemname1Exit(Sender: TObject);
    procedure B_Save1Click(Sender: TObject);
    procedure B_del1Click(Sender: TObject);
    procedure B_Cancel1Click(Sender: TObject);
    procedure E_Itemname1Enter(Sender: TObject);
    procedure E_Actcomment1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Bt_FileAppClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    F_Actcomment : Array [1..5] of String;
    F_SelfCheck  : Array [1..5] of Integer;
    F_E1Check    : Array [1..5] of Integer;

    vServerFileName, vFullPath, vFilename  : String;
    vFTPsuccess : Boolean;

    procedure TextClear(Itag : Integer);
    function  IsDataModified: Boolean;
    procedure ServerFileRead;
    procedure Subject_data;
    procedure Edit_Enabled(Ttag : integer; TFlag : Boolean);
    procedure Edit_ReadOnly(TFlag : Boolean);
    procedure FtpConnect(vWork, vServerFileName : String);
  end;


var
  SubForm1: TSubForm1;

implementation
{$R *.DFM}
uses  HMainForm;

{------------------------------- Main ----------------------------------}
procedure TSubForm1.FormShow(Sender: TObject);
begin
  Application.ProcessMessages;

  if FM_Main.LRvalConyn = 'Y' then   Edit_ReadOnly(True)
  else                               Edit_ReadOnly(False);

  ServerFileRead;
  if   vServerFileName = '' then Bt_FileApp.Caption := '파일Upload'
  else                           Bt_FileApp.Caption := 'Upload파일삭제';

  // 결재상신 안했을 경우
  if (FM_Main.ed_empno.Text = FM_Main.E_ChangeEmp.Text ) then
  begin
       if (FM_Main.Lrvalconyn <> 'Y') then
       begin
            Bt_FileApp.Enabled := true;
       end
       else
       begin
            Bt_FileApp.Caption := '파일Download';
            Bt_FileApp.Enabled := true;
       end;
  end
  else
  begin
       Bt_FileApp.Caption := '파일Download';
       if   vServerFileName = '' then Bt_FileApp.Enabled := false
       else                           Bt_FileApp.Enabled := true;
  end;

  Subject_data;
end;

{------------------------------- USER FUNCTION ----------------------------------}

procedure TSubForm1.Subject_data;
var
     FL_Comp     : TOnMemo;
     FL_CompRB   : TOnRadioButton;
     FL_i, FL_Sfchk, FL_E1chk: Integer;
begin
     TextClear(1);
     TextClear(2);
     TextClear(3);
     TextClear(4);
     TextClear(5);
     with  FM_Main.TMaxDataSet_HInsa  do
     begin
          Close;
          ServiceName := 'HINSA_select';
          ClearFieldInfo;
          AddField('DETAILTASK1'    , ftString    ,  100  );
          AddField('DETAILTASK2'    , ftString    ,  100  );
          AddField('DETAILTASK3'    , ftString    ,  100  );
          AddField('DETAILTASK4'    , ftString    ,  100  );
          AddField('DETAILTASK5'    , ftString    ,  100  );
          SQL.Text := 'select DETAILTASK1, DETAILTASK2, DETAILTASK3,              '+
                      '       DETAILTASK4, DETAILTASK5                            '+
                      '  from pehreaim_det a                                      '+
                      ' WHERE rabasdate like '''+FM_Main.LRabasYY+'''||''%''      '+
                      '   and EMPNO   = '''+FM_Main.Ed_empno.Text+'''             '+
                      '   and seqno   = 99                                        '+
                      '   and (select E1PRJCONYN from pehremas                    '+
                      '         where rabasdate = a.rabasdate                     '+
                      '           and empno     = a.empno)     = ''Y''            '+
                      '   and (select E1VALCONYN from peactfile                   '+
                      '         where rabasym   ='''+FM_Main.LRabasYY+'''||''01'' '+
                      '           and empno     = a.empno)     = ''Y''            ';
          Open;
          
          if Recordcount < 1 then
          begin
               MessageDlg('Action Contract 등록이 완료되신 후 작업하시기 바랍니다.',mtError, [mbOk],0);
               FM_Main.SB_3.Enabled := False;
               FM_Main.SB_4.Enabled := False;
               FM_Main.SB_5.Enabled := False;
               FM_Main.SB_6.Enabled := False;
               FM_Main.PageControl1.Enabled := False;
               FM_Main.BT_ExitClick(FM_Main.BT_Exit);
          end;
          E_Itemname1.Text := Fields[0].AsString;
          E_Itemname2.Text := Fields[1].AsString;
          E_Itemname3.Text := Fields[2].AsString;
          E_Itemname4.Text := Fields[3].AsString;
          E_Itemname5.Text := Fields[4].AsString;
     end;

     with  FM_Main.Q_Subject  do
     begin
          Close;
          ServiceName := 'HINSA_select3';
          ClearFieldInfo;
          AddField('ITEMNO'     , ftString,  2000);
          AddField('ITEMNAME'   , ftString,  2000);
          AddField('ACTCOMMENT' , ftString,  2000);
          AddField('SELFCHECK'  , ftinteger, 2000);
          AddField('E1CHECK'    , ftinteger, 2000);
          SQL.Text := 'select itemno, itemname, actcomment, selfcheck, e1check '+
                      '  from peAct1his a                                      '+
                      ' WHERE RabasYM  = '''+ FM_Main.LRabasYM     +'''        '+
                      '   and A.EMPNO  = '''+ FM_Main.Ed_empno.Text+'''        '+
                      ' order by ITEMNO                                        ';
          Open;

          if   trim(E_Itemname1.Text) <> '' then  Edit_Enabled(1,True)
          else                                    Edit_Enabled(1,False);
          if   trim(E_Itemname2.Text) <> '' then  Edit_Enabled(2,True)
          else                                    Edit_Enabled(2,False);
          if   trim(E_Itemname3.Text) <> '' then  Edit_Enabled(3,True)
          else                                    Edit_Enabled(3,False);
          if   trim(E_Itemname4.Text) <> '' then  Edit_Enabled(4,True)
          else                                    Edit_Enabled(4,False);
          if   trim(E_Itemname5.Text) <> '' then  Edit_Enabled(5,True)
          else                                    Edit_Enabled(5,False);

          if RecordCount < 1 then
          begin
               FM_Main.SB_Help.Panels[1].Text := FM_Main.LRabasYY+'년'+FM_Main.LRabasMM+FM_Main.Rabasname+'의 생산성 향상과제에 대한 등록내역이 없습니다.';
               Exit;
          end
          else
          begin
               FL_Comp   := nil;
               FL_CompRB := nil;
               First;
               while not eof do
               begin
                    FL_i    := Fields[0].AsInteger;
                    FL_Sfchk:= Fields[3].AsInteger;
                    FL_E1chk:= Fields[4].AsInteger;

                    FL_Comp := TOnMemo(Self.FindComponent('E_Actcomment'    +IntToStr(FL_i)));
                    FL_Comp.Text      := Fields[2].AsString;
                    F_Actcomment[FL_i]:= Fields[2].AsString;
                    if (Fields[3].AsInteger <> 0) And (Fields[3].AsString <> '') then
                    begin
                        FL_CompRB := TOnRadioButton(Self.FindComponent('E_Self' +IntToStr(FL_i) +IntToStr(FL_Sfchk)) );
                        FL_CompRB.Checked := True;
                        F_SelfCheck[FL_i] := Fields[3].AsInteger;
                    end;
                    if ((Fields[4].AsInteger <> 0) And (Fields[4].AsString <> '')) And
                       ((FM_Main.LGubun = 1) And (FM_Main.Le1valconyn = 'Y') or (FM_Main.LGubun = 2)) then
                    begin
                        FL_CompRB := TOnRadioButton(Self.FindComponent('E_E1C'  +IntToStr(FL_i) +IntToStr(FL_E1chk)) );
                        FL_CompRB.Checked := True;
                        F_E1check[FL_i]   := Fields[4].AsInteger;
                    end;
                    ///Edit_Enabled(FL_i,True);
                    Next;
               end;
          end;
     end;
end;

procedure TSubForm1.TextClear(Itag : Integer);
var  FL_Comp : TOnMemo;
     FL_i,FL_No : Integer;
     FL_CompRB : TOnRadioButton;
begin
  FL_Comp   := nil;
  FL_CompRB := nil;
  FL_i    := Itag;

  FL_Comp := TOnMemo(Self.FindComponent('E_Itemname'   +IntToStr(FL_i)));
  FL_Comp.Text := '';
  FL_Comp := TOnMemo(Self.FindComponent('E_Actcomment' +IntToStr(FL_i)));
  FL_Comp.Text := '';

  for FL_No := 1 to 5 do
  begin
       FL_CompRB := TOnRadioButton(Self.FindComponent('E_Self'+IntToStr(FL_i) +IntToStr(FL_No)) );
       FL_CompRB.Checked := False;
       FL_CompRB := TOnRadioButton(Self.FindComponent('E_E1C' +IntToStr(FL_i) +IntToStr(FL_No)) );
       FL_CompRB.Checked := False;
  end;

  F_Actcomment[FL_i] := '';
  F_SelfCheck[FL_i]  := 0;
  F_E1Check[FL_i]    := 0;
end;

function TSubForm1.IsDataModified: Boolean;
var  FL_Comp : TOnMemo;
     FL_i    : Integer;
     FL_CompRB : TOnRadioButton;
begin
  Result := false;

  FL_Comp   := nil;
  FL_CompRB := nil;
  for FL_i := 1 to 5 do
  begin
       if (F_Actcomment[FL_i] <> TOnMemo(Self.FindComponent('E_Actcomment'      +IntToStr(FL_i))).Text) //or
//          (F_SelfCheck[FL_i]  <> TOnRadioButton(Self.FindComponent('E_SelfCheck'+IntToStr(FL_i))).Text) or
//          (F_E1Check[FL_i]    <> TOnRadioButton(Self.FindComponent('E_E1Check'  +IntToStr(FL_i))).Text)
       then Result := True;
  end;
end;

procedure TSubForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if (B_Save1.Visible) and (IsDataModified) then
  begin
       MessageBox(handle,'생산성 향상과제에 변동된 자료가 있으므로 먼저 저장하세요.','작업순서오류',MB_ICONWARNING);
       CanClose := False;
       System.Exit;
  end;
  CanClose := True;
end;

procedure TSubForm1.Edit_ReadOnly(TFlag : Boolean);
var  FL_Comp   : TOnMemo;
     FL_i,FL_No: Integer;
     FL_CompRB : TOnRadioButton;
begin
  FL_Comp   := nil;
  FL_CompRB := nil;
  for FL_i := 1 to 5 do
  begin
       FL_Comp := TOnMemo(Self.FindComponent('E_Actcomment'   +IntToStr(FL_i)));
       FL_Comp.ReadOnly := TFlag;

       for FL_No := 1 to 5 do
       begin
            FL_CompRB := TOnRadioButton(Self.FindComponent('E_Self'+IntToStr(FL_i) +IntToStr(FL_No)) );
            FL_CompRB.Enabled := not TFlag ;
            FL_CompRB := TOnRadioButton(Self.FindComponent('E_E1C' +IntToStr(FL_i) +IntToStr(FL_No)) );
            FL_CompRB.Enabled := not TFlag;
       end;
  end;

  B_Save1.EnAbled  := not TFlag
end;

procedure TSubForm1.Edit_Enabled(Ttag : integer; TFlag : Boolean);
var  FL_Comp   : TOnMemo;
     FL_i,FL_No: Integer;
     FL_CompRB : TOnRadioButton;
begin
  FL_Comp   := nil;
  FL_CompRB := nil;
  FL_i    := Ttag;

  FL_Comp := TOnMemo(Self.FindComponent('E_Actcomment'+IntToStr(FL_i)));
  FL_Comp.Enabled := TFlag;
  for FL_No := 1 to 5 do
  begin
       if (TOnMemo(Self.FindComponent('E_Itemname'+IntToStr(FL_i))).Text <> '') then
       begin
            if FM_Main.LGubun = 1 then
            begin
                 if (FM_Main.Lrvalconyn <> 'Y') then
                 begin
                     FL_CompRB := TOnRadioButton(Self.FindComponent('E_Self'+IntToStr(FL_i) +IntToStr(FL_No)) );
                     FL_CompRB.Enabled := TFlag;
                 end
                 else
                 begin
                     FL_CompRB := TOnRadioButton(Self.FindComponent('E_Self'+IntToStr(FL_i) +IntToStr(FL_No)) );
                     FL_CompRB.Enabled := not TFlag;
                 end;
                 FL_CompRB := TOnRadioButton(Self.FindComponent('E_E1C' +IntToStr(FL_i) +IntToStr(FL_No)) );
                 FL_CompRB.Enabled := not TFlag;
            end
            else
            if FM_Main.LGubun = 2 then
            begin
                 FL_CompRB := TOnRadioButton(Self.FindComponent('E_Self'+IntToStr(FL_i) +IntToStr(FL_No)) );
                 FL_CompRB.Enabled := not TFlag;
                 if (FM_Main.Le1valconyn <> 'Y') then
                 begin
                     FL_CompRB := TOnRadioButton(Self.FindComponent('E_E1C' +IntToStr(FL_i) +IntToStr(FL_No)) );
                     FL_CompRB.Enabled := TFlag;
                 end
                 else
                 begin
                     FL_CompRB := TOnRadioButton(Self.FindComponent('E_E1C' +IntToStr(FL_i) +IntToStr(FL_No)) );
                     FL_CompRB.Enabled := not TFlag;
                 end;
            end;
       end
       else
       begin
            FL_CompRB := TOnRadioButton(Self.FindComponent('E_Self'+IntToStr(FL_i) +IntToStr(FL_No)) );
            FL_CompRB.Enabled := TFlag;
            FL_CompRB := TOnRadioButton(Self.FindComponent('E_E1C' +IntToStr(FL_i) +IntToStr(FL_No)) );
            FL_CompRB.Enabled := TFlag;
       end;
  end;
end;

{------------------------------ Event ---------------------------------}
procedure TSubForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := cafree;
end;

procedure TSubForm1.E_Itemname1Exit(Sender: TObject);
begin
  if  TOnMemo(Sender).lines.Count > 7  then
  begin
       MessageDlg('내용은 7줄까지만 작성가능합니다.',mtError, [mbOk],0);
       TOnMemo(Sender).SetFocus;
  end;
end;

procedure TSubForm1.B_Save1Click(Sender: TObject);
var  i, FL_No, Flag : integer;
     FL_itemno : String;
     FL_ITEMNAME   : TOnMemo;
     FL_Actcomment : TOnMemo;
     FL_CompRB     : TOnRadioButton;
     FL_SelfCheck  : integer;
     FL_E1Check    : integer;
begin
  if  (trim(E_itemname1.text) <> '') and (trim(E_Actcomment1.Text) = '')  then
  begin
       MessageDlg('ITEM 1의 실천내용이 입력되지 않았습니다.' +#13+#13  + '확인 후 다시 입력하십시오.',mtError,[mbOK],0);
       Exit;
  end;

  if  (trim(E_itemname2.text) <> '') and (trim(E_Actcomment2.Text) = '')  then
  begin
       MessageDlg('ITEM 2의 실천내용이 입력되지 않았습니다.' +#13+#13  + '확인 후 다시 입력하십시오.',mtError,[mbOK],0);
       Exit;
  end;

  if  (trim(E_itemname3.text) <> '') and (trim(E_Actcomment3.Text) = '')  then
  begin
       MessageDlg('ITEM 3의 실천내용이 입력되지 않았습니다.' +#13+#13  + '확인 후 다시 입력하십시오.',mtError,[mbOK],0);
       Exit;
  end;

  if  (trim(E_itemname4.text) <> '') and (trim(E_Actcomment4.Text) = '')  then
  begin
       MessageDlg('ITEM 4의 실천내용이 입력되지 않았습니다' +#13+#13  + '확인 후 다시 입력하십시오.',mtError,[mbOK],0);
       Exit;
  end;

  if  (trim(E_itemname5.text) <> '') and (trim(E_Actcomment5.Text) = '')  then
  begin
       MessageDlg('ITEM 5의 실천내용이 입력되지 않았습니다' +#13+#13  + '확인 후 다시 입력하십시오.',mtError,[mbOK],0);
       Exit;
  end;

  with Fm_Main.TMaxDataSet_HInsa do
  begin
       SQL.Clear;
       SQL.Text := format('select count(*) SEL_DATA from peAct1his  '+
                          ' where RabasYM   =''%s''                 '+
                          '   and empno     =''%s''                 ',[FM_Main.LRabasYM, Fm_Main.ED_empno.text ]);
       Close;
       ServiceName := 'PED0000A_common';
       ClearFieldInfo;
       AddField('SEL_DATA', ftInteger, 100);
       Open;
       Flag := Fm_Main.TMaxDataSet_HInsa.FieldByName('SEL_DATA').AsInteger;
  end;

  if  Flag <> 0 then
  begin
       with Fm_Main.TMaxDML_HInsa do
       begin
            SQL.Clear;

            SQL.Text := format('delete from peAct1his   '+
                               ' where RabasYM = ''%s'' '+
                               '   and empno   = ''%s'' ', [FM_Main.LRabasYM, Fm_Main.ED_empno.text]);
            Close;
            ServiceName := 'PEA1060A_dml';
            Execute;
       end;
  end;

  For i := 1 to 5 do
  begin
       FL_SelfCheck := 0;
       FL_E1Check   := 0;
       FL_itemno      := IntToStr(i);
       FL_ITEMNAME    := TOnMemo(Self.FindComponent('E_ITEMNAME'   +IntToStr(i)));
       FL_Actcomment  := TOnMemo(Self.FindComponent('E_Actcomment' +IntToStr(i)));
       for FL_No := 1 to 5 do
       begin
            FL_CompRB := TOnRadioButton(Self.FindComponent('E_Self'+IntToStr(i) +IntToStr(FL_No)) );
            if FL_CompRB.Checked then  FL_SelfCheck := StrToInt(Copy(FL_CompRB.Name,8,1));
            FL_CompRB := TOnRadioButton(Self.FindComponent('E_E1C' +IntToStr(i) +IntToStr(FL_No)) );
            if FL_CompRB.Checked then  FL_E1Check   := StrToInt(Copy(FL_CompRB.Name,7,1));
       end;

       if ((FM_Main.LGubun = 1) and (trim(FL_ITEMNAME.Text) <> '') and (FL_SelfCheck = 0)) or
          ((FM_Main.LGubun = 2) and (trim(FL_ITEMNAME.Text) <> '') and (FL_E1Check   = 0)) then
       begin
            MessageDlg('ITEM '+FL_itemno+' 항목이 점검되지 않았습니다' +#13+#13  + '확인 후 다시 저장하십시오.',mtError,[mbOK],0);
            System.Exit;
       end;

       if trim(FL_ITEMNAME.Text) = '' then Break;

       with Fm_Main.TMaxDML_HInsa do
       begin
            ServiceName := 'PEA1060A_dml';
            Close;
            Sql.Clear;
            SQL.Add('insert into peAct1his                         ');
            SQL.Add('       (RabasYM,     empno,      Itemno,      ');
            SQL.Add('        itemname,    Actcomment,              ');    // KeyFactor,
            SQL.Add('        SelfCheck,   E1Check,                 ');
            SQL.Add('        Writeemp,    Writetime            )   ');
            SQL.Add('Values ('''+ FM_Main.LRabasYM      +''',      ');
            SQL.Add('        '''+ Fm_Main.Ed_empno.Text +''',      ');
            SQL.Add('        '  + FL_itemno             +  ',      ');
            SQL.Add('        '''+ FL_ITEMNAME.Text      +''',      ');
            SQL.Add('        '''+ FL_Actcomment.Text    +''',      ');
            SQL.Add('        '''+ IntToStr(FL_SelfCheck)+''',      ');
            SQL.Add('        '''+ IntToStr(FL_E1Check)  +''',      ');
            SQL.Add('        '''+ Fm_Main.Pempno        +''',      ');
            SQL.Add('        to_char(sysdate,''YYYYMMDDHHMISS'') ) ');

            Execute;
       end;
  end;
  MessageDlg('성공적으로 저장하였습니다.', mtInformation, [mbOK], 0);
  B_cancel1Click(Sender);
end;

procedure TSubForm1.B_del1Click(Sender: TObject);
begin
  if  trim(E_itemno.text) = '' then
  begin
       MessageDlg('삭제할 자료가 없습니다.' +#13 + '확인 후 다시입력하십시오.',mtError,[mbOK],0);
       Exit;
  end;
  if MessageBox(handle,PChar('해당 세부과제를 삭제하시겠습니까?'), '확 인',  MB_YESNO or MB_DEFBUTTON2) <> IDYES then
  begin
       system.Exit;
  end;

  with Fm_Main.TMaxDML_HInsa do
  begin
       SQL.Clear;

       SQL.Text := format('delete from peAct1his    '+
                          ' where RabasYM   =''%s'' '+
                          '   and empno     =''%s'' '+
                          '   and itemno    =''%s'' ',[FM_Main.LRabasYM, Fm_Main.ED_empno.text,E_Itemno.Text]);
       Close;
       ServiceName := 'PEA1060A_dml';
       Execute;
  end;
  MessageDlg('해당 세부과제를 삭제하였습니다.', mtInformation, [mbOK], 0);
  B_cancel1Click(Sender);
end;

procedure TSubForm1.B_Cancel1Click(Sender: TObject);
begin
  TextClear(1);
  TextClear(2);
  TextClear(3);
  TextClear(4);
  TextClear(5);
  Subject_data;
end;

procedure TSubForm1.E_Itemname1Enter(Sender: TObject);
begin
  E_itemno.Text := IntToStr(TOnMemo(Sender).Tag);
end;

procedure TSubForm1.E_Actcomment1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var  i : word;
     ViewText : string;
begin
  i := 222;
  if  key = i then
  begin
       Messagedlg('작은따옴표는 입력하실 수 없습니다.',mtError,[mbOK],0);
       ViewText := copy(TOnMemo(Sender).text, 1, Length(TOnMemo(Sender).text)-1);
       TOnMemo(Sender).Clear;
       TOnMemo(Sender).Lines.Append(ViewText);
  end;
end;

procedure TSubForm1.ServerFileRead;
begin
  //테이블에서 파일명 Read
  FM_Main.Csel_SQL :=  'SELECT filename SEL_DATA                         '+
                       '  FROM peactfile                                 '+
                       ' WHERE RabasYM = '''+ FM_Main.LRabasYM      +''' '+
                       '   And Empno   = '''+ FM_Main.Ed_empno.Text +''' ';
  FM_Main.Csel_Open;

  vServerFileName   := FM_Main.DBcommon.FieldByName('SEL_DATA').AsString; //vRabasYY + '년_'+ ED_empno.Text +'_'+ vFilename;
  if   vServerFilename <> '' then L_AppFile.Caption := vServerFileName
  else                            L_AppFile.Caption := '첨부파일이 없습니다.';
end;

procedure TSubForm1.FtpConnect(vWork, vServerFileName : String);
begin
  FM_Main.SB_Help.Panels[1].Text := 'FTP 서버 접속중...';
  Application.ProcessMessages;

  vFTPsuccess := False;

  NMFTP1.Host     := FM_Main.PHost;
  NMFTP1.UserID   := FM_Main.PUserID;
  NMFTP1.Password := FM_Main.PPassword;
  Try
      NMFTP1.Connect;
  except
      MessageDlg('FTP 연결 실패 하였습니다...',mtError, [mbOk], 0);
      system.Exit;
  end;

  Try
      NMFTP1.Mode(MODE_image);
      if vWork = 'Upload'   then
         NMFTP1.Upload(vFullPath,'/hper/insa/HINSA/data/ActionData/' + vServerFileName);
      if vWork = 'Download' then
         NMFTP1.Download('/hper/insa/HINSA/data/ActionData/' + vServerFileName, 'C:\'+vServerFileName);
      if vWork = 'Delete'   then
         NMFTP1.Delete('/hper/insa/HINSA/data/ActionData/' + vServerFileName);
  except
      MessageDlg('FTP 작업 실패하였습니다...',mtError, [mbOk], 0);
      NMFTP1.Disconnect;
      system.Exit;
  end;
  NMFTP1.Disconnect;

  vFTPsuccess := True;

  FM_Main.SB_Help.Panels[1].Text := '작업 완료';
  Application.ProcessMessages;
end;

procedure TSubForm1.Bt_FileAppClick(Sender: TObject);
var  SqlText:String;
begin
  if TOnFocusButton(Sender).Caption = '파일Upload' then
  begin
       if MessageDlg(FM_Main.Rabasname+'별 하나의 파일만 업로드 할수 있습니다.'+#13+#13+'진행 하시겠습니까?',
          mtConfirmation, [mbYes, mbNo], 0) <> mrYes then Exit;
       if   OpenDialog1.Execute then vFullPath := OpenDialog1.FileName
       else Exit;

       vFilename := Copy(vFullPath, instr(vFullPath,'\')+1, Length(vFullPath)-instr(vFullPath,'\'));

       if FileExists(vFullPath) = True then
       begin
            FM_Main.SB_Help.Panels[1].Text := 'PC File을 서버에 전송하고 있습니다...';
            Application.ProcessMessages;

            vServerFileName    := Fm_Main.LRabasYY + '년_'+ Fm_Main.ED_empno.Text +'_'+ vFilename; //년초에 계획당시의 파일.
            FtpConnect('Upload', vServerFileName);

            if (not vFTPsuccess) then Exit;

            ////////////테이블에 Filename 1월에 저장.
            FM_Main.Csel_SQL  := 'SELECT 1 FROM peactfile                           '+
                                 ' WHERE RabasYM = '''+ FM_Main.LRabasYM       +''' '+
                                 '   And Empno   = '''+ Fm_Main.ED_empno.Text  +''' ';
            Fm_Main.Csel_Open;

            if Fm_Main.DBcommon.RecordCount = 0 then
            begin
                 SqlText  := 'Insert into peactfile (RabasYM, Empno, Filename, '+
                             '                       Writeemp, Writetime )     '+
                             ' Values (                                        '+
                             '          '''+  FM_Main.LRabasYM         +''' ,  '+
                             '          '''+  Fm_Main.ED_empno.Text    +''' ,  '+
                             '          '''+  vServerFileName  +''' ,          '+
                             '          '''+  Fm_Main.pempno           +''' ,  '+
                             '          TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'') )';
            end
            else
            begin
                 SqlText  := 'update peactfile                                          '+
                             '   set filename = '''+ vServerFileName +''',              '+
                             '       Writeemp = '''+  Fm_Main.pempno +''' ,             '+
                             '       Writetime= TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'')   '+
                             ' WHERE RabasYM  = '''+ FM_Main.LRabasYM        +'''       '+
                             '   AND empno    = '''+ Fm_Main.ED_empno.Text   +'''       ';
            end;

            Fm_Main.Cupd_SQL := Sqltext;
            Fm_Main.Cupd_Exec;

            ShowMessage(vFilename + ' 파일을 서버에 Upload 하였습니다.');
            L_AppFile.Caption              := vServerFileName;
            TOnFocusButton(Sender).Caption := 'Upload파일삭제';
       end
       else FM_Main.SB_Help.Panels[1].Text := ' 파일이 존재하지 않습니다.';
  end
  else if TOnFocusButton(Sender).Caption = '파일Download' then
  begin
       if Trim(vServerFileName) <> '' then
       begin
            FtpConnect('Download', vServerFileName);

            if (not vFTPsuccess) then Exit;

            ShowMessage(vServerFileName + ' 파일을  C:\에 Download 하였습니다.');
       end
       else FM_Main.SB_Help.Panels[1].Text := ' 파일이 존재하지 않습니다.';
  end
  else if TOnFocusButton(Sender).Caption = 'Upload파일삭제' then
  begin
       if Trim(vServerFileName) <> '' then
       begin
            FtpConnect('Delete', vServerFileName);

            if (not vFTPsuccess) then Exit;

            SqlText  := 'update peactfile                                          '+
                        '   set filename   = Null,                                 '+
                        '       Writeemp   = '''+ Fm_Main.pempno          +''' ,   '+
                        '       Writetime  = TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'') '+
                        ' WHERE RabasYM    = '''+ FM_Main.LRabasYM        +'''     '+
                        '   AND empno      = '''+ Fm_Main.ED_empno.Text   +'''     ';
            Fm_Main.Cupd_SQL := Sqltext;
            Fm_Main.Cupd_Exec;
            ShowMessage(vServerFileName + ' 파일을 서버에서 Delete 하였습니다.');
            vServerFileName                := '';
            L_AppFile.Caption              := '첨부파일이 없습니다.';
            TOnFocusButton(Sender).Caption := '파일Upload';
       end
       else FM_Main.SB_Help.Panels[1].Text := ' 파일이 존재하지 않습니다.';
  end;
end;

end.
