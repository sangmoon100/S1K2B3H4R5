unit PKY1010A1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Mask, ExtCtrls, Buttons, numedit, Grids, DBGrids,
  DBTables, Db, codelib, Calen1, MemDS, DBAccess, Ora, OraError, Math, Func,
  KeyEmpnoY, ImgList, Pass;

type
  TFM_Main = class(TForm)
    Panel187: TPanel;
    Label15: TLabel;
    Label16: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    DBGrid1: TDBGrid;
    Panel188: TPanel;
    Panel189: TPanel;
    Panel190: TPanel;
    Panel196: TPanel;
    yearpaynum: TMaskEdit;
    basepay: TNumberEdit;
    ablitypay: TNumberEdit;
    totpay: TNumberEdit;
    DataSource1: TDataSource;
    ImageList1: TImageList;
    Panel19: TPanel;
    L_UserName: TLabel;
    L_CurDate: TLabel;
    maintitle: TPanel;
    Panel47: TPanel;
    empno: TMaskEdit;
    Panel48: TPanel;
    korname: TMaskEdit;
    Panel1: TPanel;
    paycl: TMaskEdit;
    b_Search: TBitBtn;
    exit: TBitBtn;
    Panel7: TPanel;
    cmb_SIMAXYN: TComboBox;
    Ora_Qry1: TOraQuery;
    GroupBox1: TGroupBox;
    chk_autocal: TCheckBox;
    b_Save: TBitBtn;
    Ora_Qry1TOTPAY: TFloatField;
    Ora_Qry1BASEPAY: TFloatField;
    Ora_Qry1ABLITYPAY: TFloatField;
    Ora_Qry1SI_TOTPAY: TFloatField;
    Ora_Qry1SI_BASEPAY: TFloatField;
    Ora_Qry1SI_ABLITYPAY: TFloatField;
    Ora_Qry1SI_SETRATE: TFloatField;
    Ora_Qry1SI_YN: TStringField;
    Ora_Qry1MAXYN: TStringField;
    Ora_Qry1YEARPAYNUM: TStringField;
    Panel2: TPanel;
    SItotpay: TNumberEdit;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    Panel3: TPanel;
    TONGAMT1: TNumberEdit;
    Panel4: TPanel;
    TONGAMT2: TNumberEdit;
    TONGAMT3: TNumberEdit;
    Panel5: TPanel;
    Ora_Qry1TONGAMT3: TFloatField;
    Ora_Qry1TONGAMT22: TFloatField;
    Ora_Qry1TONGAMT12: TFloatField;

    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure FormActivate(Sender: TObject);
    procedure exitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SelectAll(Sender: TObject);
    procedure NumberEdit_Exit(Sender: TObject);
    procedure b_SaveClick(Sender: TObject);
    procedure b_SearchClick(Sender: TObject);
    procedure empnoDblClick(Sender: TObject);
    procedure empnoKeyPress(Sender: TObject; var Key: Char);
    procedure empnoChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure ClearDataField;
    procedure Load_Data(v_empno : String);
    function  DataCheck : Boolean;
  public
    { Public declarations }
    Date_Field    : String;   //시스템날짜 임시저장변수
    CYearPayNum   : String;   //현급여지급월 저장변수
    procedure AllDataSave;
    procedure Enabled_True_False(B: Boolean);
  end;

var
  FM_Main: TFM_Main;
  //tpaycl : string;   //   연봉 계산을 위한 사원의 직급

implementation

{$R *.DFM}


procedure TFM_Main.ClearDataField;
var
     i : integer;
begin
     for i := 0 to ComponentCount - 1 do
     begin
          if (TObject(components[i]) is TMaskEdit) then
          begin
               TmaskEdit(components[i]).Text := '';
          end;
          if (TObject(components[i]) is TNumberEdit) then
               TNumberEdit(components[i]).Value := 0;
     end;
end;

procedure TFM_Main.Load_Data(v_empno : String);
var
     qq : TOraQuery;
begin
     
     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     Try
          with qq do
          begin
               Close;
               SQL.Clear;
               SQL.Add('select empno, korname, paycl from pimpmas ');
               SQL.Add(' where empno = :p_empno                   ');
               ParamByName('p_empno').AsString := v_empno;
               Open;

               if RecordCount = 0 then
               begin
                    MessageBox(handle,'해당사번이 존재하지 않습니다!','[알 림]',MB_OK or $0030);
                    Empno.SelectAll;
                    System.Exit;
               end
               else
               begin
                    korname.Text := FieldByName('korname').AsString;
                    paycl.Text   := GetCodeName('I112',FieldByName('paycl').AsString);
               end;
          end;
     Finally
          qq.Free;
     end;

     //  연봉 읽어오기
     with Ora_Qry1 do
     begin
          Close;
          SQL.Clear;
          SQL.Add('select * from pkhyphis          ');
          SQL.Add(' where empno = :p_empno         ');
          SQL.Add(' order by yearpaynum DESC       ');
          ParamByName('p_empno').AsString := v_empno;
          Open;
     end;

     if (yearpaynum.Text <> '') and (yearpaynum.Enabled = True) then b_Save.Enabled := True;
end;

function TFM_Main.DataCheck: Boolean;
begin
     Result := True;
     //검증조건 필요시 추가가능.
     if length(trim(yearpaynum.Text)) <> 6 then
     begin
          MessageBox(handle,'연봉 차수 6자리가 아닙니다.(년도(4),월(2)) '+#13+'Ex)200701','[안 내]',MB_OK or $0030);
          yearpaynum.SetFocus;
          Result := False;
          System.Exit;
     end;             
end;

procedure TFM_Main.Enabled_True_False(B: Boolean);
begin
     yearpaynum.Enabled   := B;
     totpay.Enabled       := B;
     basepay.Enabled      := B;
     ablitypay.Enabled    := B;
     chk_autocal.Enabled  := B;
     cmb_SIMAXYN.Enabled  := B;
     SItotpay.Enabled     := B; // 2009.01 SI 없음  2010.05.06 kth 파견직 수수료로 사용
     TONGAMT1.Enabled     := B; // 2014.11.04 하은영 통상임금 수당항목 추가
     TONGAMT2.Enabled     := B; // 2014.11.04 하은영 통상임금 수당항목 추가
     TONGAMT3.Enabled     := B; // 2014.11.04 하은영 통상임금 수당항목 추가
//     SIbasepay.Enabled    := B;
//     SIAblitypay.Enabled  := B;
//     SIRate.Enabled       := B;
//     cmb_SIYN.Enabled     := B;
     b_save.Enabled       := B;
end;

procedure TFM_Main.AllDataSave;
var
     qq : TOraQuery;
begin
     Date_Field := fn_GetDateTimeStr;

     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     Try
          with qq do
          begin
               Close;
               SQL.Clear;
               SQL.Add('select * from pkhyphis    ');
               SQL.Add(' where empno = :p_empno   ');
               SQL.Add('   and yearpaynum = :p_yearpaynum ');
               ParamByName('p_empno').AsString := Empno.Text;
               ParamByName('p_yearpaynum').AsString := YEARPAYNUM.Text;
               Open;

               if ReCordCount <> 0 then
               begin
                    Close;
                    SQL.Clear;
                    SQL.Add('update pkhyphis                             ');
                    SQL.Add('   set basepay = :p_basepay,                ');
                    SQL.Add('       ablitypay = :p_ablitypay,            ');
                    SQL.Add('       totpay = :p_totpay,                  ');
                    SQL.Add('       realtotpay = :p_realtotpay,          ');
                    SQL.Add('       si_totpay = :p_si_totpay,            ');   // 2009.01 SI 없음  2010.05.06 kth 파견직 수수료로 사용

                    SQL.Add('       TONGAMT1 = :p_TONGAMT1,            ');   // 2014.11.04 하은영 통상임금 수당항목 추가
                    SQL.Add('       TONGAMT2 = :p_TONGAMT2,            ');   // 2014.11.04 하은영 통상임금 수당항목 추가
                    SQL.Add('       TONGAMT3 = :p_TONGAMT3,            ');   // 2014.11.04 하은영 통상임금 수당항목 추가

//                    SQL.Add('       si_basepay = :p_si_basepay,          ');   2009.01 SI 없음
//                    SQL.Add('       si_ablitypay = :p_si_ablitypay,      ');   2009.01 SI 없음
//                    SQL.Add('       si_setrate = :p_si_setrate,          ');   2009.01 SI 없음
//                    SQL.Add('       si_yn = :p_si_yn,                    ');   2009.01 SI 없음
                    SQL.Add('       maxyn = :p_maxyn,                    ');
                    SQL.Add('       writetime = :p_writetime,            ');
                    SQL.Add('       writeman = :p_writeman               ');
                    SQL.Add(' where empno = :p_empno                     ');
                    SQL.Add('   and yearpaynum = :p_yearpaynum           ');
                    ParamByName('p_basepay').AsFloat := BASEPAY.Value;
                    ParamByName('p_ablitypay').AsFloat := ABLITYPAY.Value;
                    ParamByName('p_totpay').AsFloat := TOTPAY.Value;
                    ParamByName('p_realtotpay').AsFloat := TOTPAY.Value;
                    ParamByName('p_si_totpay').AsFloat := SITOTPAY.Value;  // 2009.01 SI 없음  2010.05.06 kth 파견직 수수료로 사용

                    ParamByName('p_TONGAMT1').AsFloat := TONGAMT1.Value;  // 2014.11.04 하은영 통상임금 수당항목 추가
                    ParamByName('p_TONGAMT2').AsFloat := TONGAMT2.Value;  // 2014.11.04 하은영 통상임금 수당항목 추가
                    ParamByName('p_TONGAMT3').AsFloat := TONGAMT3.Value;  // 2014.11.04 하은영 통상임금 수당항목 추가


//                    ParamByName('p_si_basepay').AsFloat := SIBASEPAY.Value; 2009.01 SI 없음
//                    ParamByName('p_si_ablitypay').AsFloat := SIABLITYPAY.Value;  2009.01 SI 없음
//                    ParamByName('p_si_setrate').AsString := SIRATE.Text;       2009.01 SI 없음
//                    ParamByName('p_si_yn').AsString := Trim(cmb_SIYN.Text);    2009.01 SI 없음
                    ParamByName('p_maxyn').AsString := cmb_SIMAXYN.Text;
                    ParamByName('p_writetime').AsString := copy(Date_Field,1,15);
                    ParamByName('p_writeman').AsString := Pempno;
                    ParamByName('p_empno').AsString := Empno.Text;
                    ParamByName('p_yearpaynum').AsString := YEARPAYNUM.Text;

                    {SQL.ADD('update PKHYPHIS set ');
                    SQL.ADD(Format('BASEPAY  =''%s'',ABLITYPAY  =''%s'', ',
                                   [floatToStr(BASEPAY.value), floatToStr(ABLITYPAY.value)] ));
                    SQL.ADD(Format('TOTPAY =''%s'', REALTOTPAY = ''%s'', ',
                                   [floatToStr(TOTPAY.value),floatToStr(TOTPAY.value)] ));
                    SQL.ADD(Format('SI_TOTPAY =''%s'', SI_BASEPAY = ''%s'', ',
                                   [floatToStr(SITOTPAY.value),floatToStr(SIBASEPAY.value)] ));
                    SQL.ADD(Format('SI_ABLITYPAY =''%s'', SI_SETRATE = ''%s'', ',
                                   [floatToStr(SIABLITYPAY.value),floatToStr(SIRATE.value)] ));
                    SQL.ADD(Format('SI_YN =''%s'', MAXYN = ''%s'', ',
                                   [Trim(cmb_SIYN.Text), Trim(cmb_SIMAXYN.Text)] ));
                    SQL.ADD(Format('WRITETIME =''%s'',WRITEMAN  =''%s'' ',
                                   [copy(Date_Field,1,15),PEmpno] ));
                    SQL.ADD(Format('WHERE (EMPNO = ''%s'' AND YEARPAYNUM = ''%s'') ',
                                   [EMPNO.Text, YEARPAYNUM.Text] ));}
               end
               else
               begin
                    Close;
                    SQL.Clear;
                    SQL.ADD(' INSERT INTO PKHYPHIS                                ');
                    SQL.ADD(' (BASEPAY,ABLITYPAY,TOTPAY,REALTOTPAY,               ');
                    SQL.ADD('  YEARPAYNUM,EMPNO,MAXYN,                            ');
                    SQL.ADD('  SI_TOTPAY, TONGAMT1, TONGAMT2, TONGAMT3,           ');
//                    SQL.ADD('  SI_TOTPAY, SI_BASEPAY, SI_ABLITYPAY, SI_SETRATE,   ');
//                    SQL.ADD('  SI_YN,                                       ');
                    SQL.ADD('  WRITETIME,WRITEMAN)                                ');
                    SQL.ADD(' VALUES('''+floatToStr(BASEPAY.value)+''','''+floatToStr(ABLITYPAY.value)+''', ');
                    SQL.ADD('        '''+floatToStr(TOTPAY.value) +''','''+floatToStr(TOTPAY.value)+''', ');
                    SQL.ADD('        '''+trim(YEARPAYNUM.text)+''','''+EMPNO.text+''', '''+Trim(cmb_SIMAXYN.Text)+''', ');
                    SQL.ADD('        '''+floatToStr(SITOTPAY.value) +''',                                              ');
                    SQL.ADD('        '''+floatToStr(TONGAMT1.value) +''',                                              ');  // 2014.11.04 하은영 통상임금 수당항목 추가
                    SQL.ADD('        '''+floatToStr(TONGAMT2.value) +''',                                              ');  // 2014.11.04 하은영 통상임금 수당항목 추가
                    SQL.ADD('        '''+floatToStr(TONGAMT3.value) +''',                                              ');  // 2014.11.04 하은영 통상임금 수당항목 추가
//                    SQL.ADD('        '''+floatToStr(SITOTPAY.value) +''','''+floatToStr(SIBASEPAY.value)+''', ');
//                    SQL.ADD('        '''+floatToStr(SIABLITYPAY.value) +''','''+floatToStr(SIRATE.value)+''', ');
//                    SQL.ADD('        '''+Trim(cmb_SIYN.Text) +''', ');
                    SQL.ADD('        '''+copy(Date_Field,1,15)+''',   ');
                    SQL.ADD('        '''+PEmpno+''')                    ');
               end;

               Try
                    ExecSQL;
               Except
                    MessageBox(handle,'저장에 실패하였습니다.','[안 내]',MB_OK or $0030);
               end;
          end;
     Finally
          qq.Free;
     end;
end;

procedure TFM_Main.FormActivate(Sender: TObject);
var
     qq : TOraQuery;
begin
     Pempno   := PassEmp(cmdline,1);
     Pkorname := PassEmp(cmdline,2);
     Pgrade   := Passemp(cmdline,4);

     Application.ProcessMessages;

     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;
     Try
          with qq do
          begin
               Close;
               SQL.Clear;
               SQL.ADD(' SELECT yearpaynum FROM PKCPBAS ');
               Open;
               CYearPayNum := FieldByName('yearpaynum').AsString;
          end;
     Finally
          qq.Free;
     end;

     if (Copy(Pempno,1,1) = 'D') or ((Copy(Pgrade,3,1) <= 'C') and (fn_YmanagerCheck))  then  //fn_YmanagerCheck -> Func.Pas Library에 선언.
     begin
          maintitle.Color := clTeal;
          maintitle.Caption := '연 봉 관 리[파견직]';
     end
     else
     begin
          MessageBox(handle,'파견직 관리자 외에는 열람할 수 없습니다.','알 림',MB_OK or $0030);
          Close;
     end;

     L_CurDate.Caption  := fn_GetDateStr;
     L_UserName.Caption := Pkorname+'('+PEmpno+')';
     Application.ProcessMessages;

     empno.SetFocus;

end;

procedure TFM_Main.exitClick(Sender: TObject);
begin
     if MessageBox(handle,'종료 하시겠습니까?','확 인',MB_YESNO or $0030) = ID_YES then  halt(1);
end;

procedure TFM_Main.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := CaFree;
end;

procedure TFM_Main.SelectAll(Sender: TObject);
begin
     if Sender is (TNumberEdit) then
     begin
          (Sender as TNumberEdit).SelectAll;
     end;
end;

procedure TFM_Main.NumberEdit_Exit(Sender: TObject);
var
     tmpVal : Real;
begin
     if (Sender is (TNumberEdit)) and (chk_autocal.Checked = False) then
     begin
           if (Sender as TNumberEdit).Name = 'totpay' then                  //TNumberEdit = 총연봉..
           begin
                tmpVal := totpay.Value;
                if tmpVal <> 0 then
                begin
                     //2014.12.26 하은영 기준연봉은 95, 업적가급은 5으로 계산되도록 수정
                     //basepay.Value := Ceil(tmpVal * 0.8);
                     //ablitypay.Value := tmpVal - Ceil(tmpVal * 0.8);

                     basepay.Value := Ceil(tmpVal * 0.95);
                     ablitypay.Value := tmpVal - Ceil(tmpVal * 0.95);
                end;
           end
           else if (Sender as TNumberEdit).Name = 'basepay' then            //TNumberEdit = 기본연봉..
           begin
                totpay.Value := basepay.Value + ablitypay.Value;
           end
           else if (Sender as TNumberEdit).Name = 'ablitypay' then          //TNumberEdit = 영업연봉..
           begin
                totpay.Value := basepay.Value + ablitypay.Value;
           end;
{           else if (Sender as TNumberEdit).Name = 'SItotpay' then           //TNumberEdit = SI총연봉..
           begin
                tmpVal := Ora_Qry1.FieldByName('SI_totpay').AsFloat;
                if tmpVal <> 0 then
                begin
//                     SIbasepay.Value := Ceil(tmpVal * 0.8);
//                     SIablitypay.Value := tmpVal - Ceil(tmpVal * 0.8);
                end;
           end
           else if (Sender as TNumberEdit).Name = 'SIbasepay' then          //TNumberEdit = SI기본연봉..
           begin
//                SItotpay.Value := SIbasepay.Value + SIablitypay.Value;
           end
           else if (Sender as TNumberEdit).Name = 'SIAblitypay' then        //TNumberEdit = SI영업연봉..
           begin
//                SItotpay.Value := SIbasepay.Value + SIablitypay.Value;
           end;}
     end;
end;

procedure TFM_Main.b_SaveClick(Sender: TObject);
begin
     if MessageBox(handle,'변경된 내용으로 저장하시겠습니까?','확  인',MB_YESNO or $0020) = ID_YES then
     begin
          if DataCheck = True then
          begin
               AllDataSave;//데이타를 저장한다..
               //ClearDataField;
               Empno.SetFocus;
               b_Save.Enabled := False;
               Load_Data(Empno.Text);
          end;
     end;
end;

procedure TFM_Main.DataSource1DataChange(Sender: TObject; Field: TField);
begin
     if Ora_Qry1.RecordCount > 0 then
     begin
          yearpaynum.text  := Ora_Qry1.FieldByName('yearpaynum').AsString;
          totpay.value     := Ora_Qry1.FieldByName('TOTPAY').Asfloat;
          basepay.Value    := Ora_Qry1.FieldByName('BASEPAY').AsFloat;
          ablitypay.Value  := Ora_Qry1.FieldByName('ABLITYPAY').AsFloat;
          SItotpay.Value   := Ora_Qry1.FieldByName('SI_TOTPAY').AsFloat;  // 2010.05.06 kth 파견직 수수료로 사용

          TONGAMT1.Value   := Ora_Qry1.FieldByName('TONGAMT1').AsFloat;  // 2014.11.04 하은영 통상임금 수당항목 추가
          TONGAMT2.Value   := Ora_Qry1.FieldByName('TONGAMT2').AsFloat;  // 2014.11.04 하은영 통상임금 수당항목 추가
          TONGAMT3.Value   := Ora_Qry1.FieldByName('TONGAMT3').AsFloat;  // 2014.11.04 하은영 통상임금 수당항목 추가



//          SIBasePay.Value  := Ora_Qry1.FieldByName('SI_BASEPAY').AsFloat;
//          SIAblityPay.Value:= Ora_Qry1.FieldByName('SI_ABLITYPAY').AsFloat;
//          SIRate.Value     := Ora_Qry1.FieldByName('SI_SETRATE').AsFloat;
//          cmb_SIYN.Text    := Ora_Qry1.FieldByName('SI_YN').AsString;
          cmb_SIMAXYN.Text := Ora_Qry1.FieldByName('MAXYN').AsString;
     end;

     if (Ora_Qry1.FieldByName('YEARPAYNUM').AsString <> CYearPayNum) and
        (Ora_Qry1.RecordCount <> 0) then
     begin
          Enabled_True_False(False);
     end
     else
     begin
          Enabled_True_False(True);
     end;

     if yearpaynum.Enabled = True then yearpaynum.setfocus;
end;

procedure TFM_Main.b_SearchClick(Sender: TObject);
begin
     Load_Data(Empno.Text);
end;

procedure TFM_Main.empnoDblClick(Sender: TObject);
begin
     FKeyEmpnoY := TFKeyEmpnoY.Create(self);
     Try
          FKeyEmpnoY.EdEmpno.Text := empno.Text;
          FKeyEmpnoY.ShowModal;

          if FKeyEmpnoY.CloseChk <> -1 then
          begin
               empno.TExt   := FKeyEmpnoY.v_KeyEmpno;
               korname.Text := FKeyEmpnoY.v_KeyKorname;
          end
          else
               System.Exit;
          b_SearchClick(Sender);
     Finally
          FKeyEmpnoY.Free;
     end;
end;

procedure TFM_Main.empnoKeyPress(Sender: TObject; var Key: Char);
begin
     if Key = chr(13) then
     begin
          if (Copy(Empno.Text,1,1) <> 'Y') then
          begin
               Application.MessageBox('정규직 사번에 대한 작업을'+#13+
                                      '할 수 없습니다.','작업안내',MB_OK+$0030);
               Empno.SelectAll;
               System.Exit;
          end;

          Load_Data(Empno.Text);
     end;
end;

procedure TFM_Main.empnoChange(Sender: TObject);
begin
     Enabled_True_False(False);
end;

procedure TFM_Main.FormCreate(Sender: TObject);
begin
     OraConnect;
end;

end.


