unit PKY1070A3;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Mask, StdCtrls, numedit, Buttons, ExtCtrls, DB, DBTables, calen1, kylib1,
  kycode1, dept2lib, Ora, Func, DeptCode;

type
  TFinsaedit = class(TForm)
    BBsave: TBitBtn;
    BBclose: TBitBtn;
    Epaycl: TEdit;
    Panel1: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Epayra: TEdit;
    Epstate: TEdit;
    Edeptcode: TEdit;
    PhelpMsg: TPanel;
    Pdeptname: TPanel;
    SBdeptcode: TSpeedButton;
    SBpstate: TSpeedButton;
    SBpayra: TSpeedButton;
    SBpaycl: TSpeedButton;
    SBempdate: TSpeedButton;
    SBretdate: TSpeedButton;
    MEempdate: TMaskEdit;
    MEretdate: TMaskEdit;
    Query1: TQuery;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    CBbasicamt: TCheckBox;
    CBdutyamt: TCheckBox;
    CBfixpay: TCheckBox;
    P_New: TPanel;
    P_YearPaynum: TPanel;
    L_New: TLabel;
    P_Old: TPanel;
    P_paynum: TPanel;
    L_Old: TLabel;
    Lpstate: TLabel;
    Lpayra: TLabel;
    Lpaycl: TLabel;
    Label4: TLabel;
    Porgnum: TEdit;

    procedure FormActivate(Sender: TObject);
    procedure BBcloseClick(Sender: TObject);
    procedure BBsaveClick(Sender: TObject);
    procedure SBempdateClick(Sender: TObject);
    procedure SBpayclClick(Sender: TObject);
    procedure SBpayraClick(Sender: TObject);
    procedure SBpstateClick(Sender: TObject);
    procedure SBdeptcodeClick(Sender: TObject);
    procedure EpayclKeyPress(Sender: TObject; var Key: Char);
    procedure EpayclExit(Sender: TObject);
    procedure EpayclChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SBretdateClick(Sender: TObject);

  private
    { Private declarations }
    function fnCheckTbl(const mEmpno : String; const mPaycl : String): Boolean;
    procedure fzComboOldNew(bOldNew: Boolean);

  public
    { Public declarations }
    GIcloseS : integer;
  end;

var
  Finsaedit: TFinsaedit;

implementation

{$R *.DFM}

uses PKY1070A1;

procedure TFinsaedit.FormActivate(Sender: TObject);
begin
      Epaycl.text     := FM_Main.GSpaycl;
      Epayra.text     := FM_Main.GSpayra;
      Epstate.text    := FM_Main.GSpstate;
      Porgnum.text    := FM_Main.Lorgnum.Caption;
      Edeptcode.text  := FM_Main.Ldeptcode.Caption;
      MEempdate.text  := RemoveChar(FM_Main.Lempdate.Caption, '/');
      MEretdate.text  := RemoveChar(FM_Main.Lretdate.Caption, '/');

      Lpaycl.Caption    := GetCodeName('I112', Epaycl.text);
      Lpayra.Caption    := GetCodeName('I113', Epayra.text);
      Lpstate.Caption   := GetCodeName('I114', Epstate.text);
      Pdeptname.Caption := GetDeptName(Porgnum.text, Edeptcode.text);
      PhelpMsg.Caption  := ' 인사사항이 조회되었습니다.';
      GIcloseS := -1;
end;

// 저장
procedure TFinsaedit.BBsaveClick(Sender: TObject);
var
     qq : TOraQuery;
begin
     if MEempdate.text <> '' then
     begin
          If fn_IsDate(MEempdate.text) = False then
          begin
               MessageBox(handle,'입사일자를 정확히입력하세요.','입력오류',MB_ICONWARNING);
               MEempdate.setfocus;
               exit;
          end;
     end;

     if MEretdate.text <> '' then
     begin
          If fn_IsDate(MEretdate.text) = False then
          begin
               MessageBox(handle,'퇴사일자를 정확히입력하세요..','입력오류',MB_ICONWARNING);
               MEretdate.setfocus;
               exit;
          end;
     end;

     if IDNO = Application.MessageBox('[인사사항]수정자료를 저장하시겠습니까?',
                                    '작업안내', MB_YesNo) then  Exit;
     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     Try
          with qq do
          begin
               Close;
               SQL.Clear;
               SQL.Add('update pkmpmas                         ');
               SQL.Add('   set paycl = :p_paycl,               ');
               SQL.Add('       payra = :p_payra,               ');
               SQL.Add('       pstate = :p_pstate,             ');
               SQL.Add('       orgnum = :p_orgnum,             ');
               SQL.Add('       deptcode = :p_deptcode,         ');
               SQL.Add('       empdate = :p_empdate,           ');
               SQL.Add('       retdate = :p_retdate,           ');
               SQL.Add('       yearpaynum = :p_yearpaynum      ');
               SQL.Add(' where empno = :p_empno                ');
               ParamByName('p_paycl').AsString := Epaycl.Text;
               ParamByName('p_payra').AsString := Epayra.Text;
               ParamByName('p_pstate').AsString := Epstate.Text;
               ParamByName('p_orgnum').AsString := Porgnum.Text;
               ParamByName('p_deptcode').AsString := Edeptcode.Text;
               ParamByName('p_empdate').AsString := MEempdate.Text;
               ParamByName('p_retdate').AsString := MEretdate.Text;
               ParamByname('p_yearpaynum').AsString := p_yearpaynum.Caption;
               ParamByName('p_empno').AsString := FM_Main.GSempno;
               Execsql;

               // 자료점검
               if not fnCheckTbl(FM_Main.GSempno, Epaycl.Text) then
               begin
                  GIcloseS := 0;
                  PhelpMsg.Caption := ' 인사사항 저장이 완료되었습니다.';
                  exit;
               end;

               if (Epaycl.Text >= FM_Main.gsMinPaycl) and (Epaycl.Text <= FM_Main.gsMaxPaycl) then
               begin
                    if CBbasicamt.checked = true then
                    begin
                         Close;
                         SQL.Clear;
                         SQL.Add('update pkmpmas a                                 ');
                         SQL.Add('   set basicamt = (select basicamt               ');
                         SQL.Add('                     from pkcptbl                ');
                         SQL.Add('                    where a.paynum = paynum      ');
                         SQL.Add('                      and a.paycl  = paycl)      ');
                         SQL.Add(' where a.empno = :p_empno                        ');
                         ParamByname('p_empno').AsString := FM_Main.GSempno;
                         ExecSQL;
                    end;


                    if CBdutyamt.checked = true then
                    begin
                         Close;
                         SQL.Clear;
                         SQL.Add('update pkmpmas a                                  ');
                         SQL.Add('   set a.dutyamt = (select dutyamt                ');
                         SQL.Add('                      from pkcptbl                ');
                         SQL.Add('                     where a.paynum = paynum      ');
                         SQL.Add('                       and a.paycl  = paycl)      ');
                         SQL.Add(' where a.empno = :p_empno                         ');
                         ParamByname('p_empno').AsString := FM_Main.GSempno;
                         ExecSQL;
                    end;

                    Close;
                    SQL.Clear;
                    SQL.Add('update pkmpmas                 ');
                    SQL.Add('   set fixpay = 0,             ');
                    SQL.Add('       quaterpay = 0,          ');
                    SQL.Add('       holipay = 0,            ');
                    SQL.Add('       roleamt =0              ');
                    SQL.Add(' where empno = :p_empno        ');
                    ParamByName('p_empno').AsString := FM_Main.GSempno;
                    ExecSQL;
               end
               else  // if (Epaycl.Text < '00') and (Epaycl.Text > '08') then
               begin
                    if CBfixpay.checked = true then
                    begin
                         Close;
                         SQL.Clear;
                         SQL.Add('update pkmpmas p                                                                  ');
                         SQL.Add('   set fixpay = (select ceil(totpay / deocde(yearpaydiv,0,1,nvl(yearpaydiv,1)))   ');
                         SQL.Add('                   from pkhyphis h, pkcpbas c                                     ');
                         SQL.Add('                  where h.empno = p.empno                                         ');
                         SQL.Add('                    and h.yearpaynum = c.yearpaynum),                             ');
                         SQL.Add('       basicamt = 0,                                                              ');
                         SQL.Add('       infoamt = 0,                                                               ');
                         SQL.Add('       dutyamt =0,                                                                ');
                         SQL.Add('       promamt = 0                                                                ');
                         SQL.Add(' where empno = :p_empno                                                           ');
                         ParamByName('p_empno').AsString := FM_Main.GSempno;
                         Query1.ExecSQL;
                    end;
               end;
          end; // with Method End Point;
     Finally
          qq.Free;
     end;

     GIcloseS := 0;
     PhelpMsg.Caption := ' 인사사항 저장이 완료되었습니다.';
end;


procedure TFinsaedit.SBpayclClick(Sender: TObject);
begin
     FM_Main.p_GetCodeName('BAND코드조회', 'I112', Epaycl, Lpaycl);
end;

procedure TFinsaedit.SBpayraClick(Sender: TObject);
begin
     FM_Main.p_GetCodeName('직책코드조회', 'I113', Epayra, Lpayra);
end;

procedure TFinsaedit.SBpstateClick(Sender: TObject);
begin
     FM_Main.p_GetCodeName('인사상태코드조회', 'I114', Epstate, Lpstate);
end;

// 부서코드조회
procedure TFinsaedit.SBdeptcodeClick(Sender: TObject);
begin

     FDeptCode := TFDeptCode.Create(Self);
     FDeptCode.EdOrgnum.Text := Porgnum.Text;
     FDeptCode.EdDeptcode.Text := Edeptcode.Text;

     Try
          FDeptCode.ShowModal;
          If FDeptCode.CloseChk = 0 then
          begin
               Edeptcode.text := FDeptCode.GSdeptcode;
               Pdeptname.Caption := GetDeptName(Porgnum.text, Edeptcode.text);
          end;
     Finally
          FDeptCode.Free;
     end;

end;

// field event
procedure TFinsaedit.EpayclKeyPress(Sender: TObject; var Key: Char);
begin
     if key = #13 then
     begin
          key := #10;

          if TEdit(Sender).name = 'Epaycl' then
          begin
             Epayra.setfocus;
          end else
          if TEdit(Sender).name = 'Epayra' then
          begin
             Epstate.setfocus;
          end else
          if TEdit(Sender).name = 'Epstate' then
          begin
             Edeptcode.setfocus;
          end else
          if TEdit(Sender).name = 'Edeptcode' then
          begin
             MEempdate.setfocus;
          end;

          if TMaskEdit(Sender).name = 'MEempdate' then
          begin
               If fn_IsDate(MEempdate.text) = False then
               begin
                    MessageBox(handle,'입사일자를 정확히입력하세요.','입력오류',MB_ICONWARNING);
                    MEempdate.setfocus;
                    exit;
               end;
               MEretdate.setfocus;
          end else
          if TMaskEdit(Sender).name = 'MEretdate' then
          begin
               If fn_IsDate(MEempdate.text) = False then
               begin
                    MessageBox(handle,'퇴사일자를 정확히입력하세요..','입력오류',MB_ICONWARNING);
                    MEretdate.setfocus;
                    exit;
               end;
               BBsave.setfocus;
          end;
     end;
end;

procedure TFinsaedit.EpayclExit(Sender: TObject);
begin

     if TEdit(Sender).name = 'Epaycl' then
     begin
          Lpaycl.Caption := GetCodeName('I112', Epaycl.text);
     end else
     if TEdit(Sender).name = 'Epayra' then
     begin
          Lpayra.Caption := GetCodeName('I113', Epayra.text);
     end else
     if TEdit(Sender).name = 'Epstate' then
     begin
          Lpstate.Caption := GetCodeName('I114', Epstate.text);
     end else
     if TEdit(Sender).name = 'Edeptcode' then
     begin
          Pdeptname.Caption := GetDeptName(Porgnum.text, Edeptcode.text);
     end;

end;

// 입사일자,퇴사일자
procedure TFinsaedit.SBempdateClick(Sender: TObject);
begin
     calendar := TCalendar.Create(Self);

     Try
          calendar.ShowModal;

          if calendar.DayCaption <> '' then
          begin
               MeEmpDate.text := calendar.DayCaption;
          end;
     Finally
          calendar.Free;
     end;
end;

// 종료
procedure TFinsaedit.BBcloseClick(Sender: TObject);
begin
     close;
end;


// 추가
function TFinsaedit.fnCheckTbl(const mEmpno : String; const mPaycl : String): Boolean;
var
     qq : TOraQuery;
begin
     if (CBbasicamt.Checked) or (CBdutyamt.Checked) or (CBfixpay.Checked) then
     begin
          qq := TOraQuery.Create(nil);
          qq.Session := Ora_Session;

          Try
               with qq do
               begin
                    if (mPaycl >= FM_Main.gsMinPaycl) and (mPaycl <= FM_Main.gsMaxPaycl) then
                    begin
                         Close;
                         SQL.Clear;
                         SQL.Add('select count(*) a                        ');
                         SQL.Add('  from pkmpmas p, pkcptbl t              ');
                         SQL.Add(' where t.paynum = p.paynum               ');
                         SQL.Add('   and t.paycl = :p_paycl                ');
                         SQL.Add('   and p.empno = :p_empno                ');
                         ParamByName('p_paycl').AsString := mPaycl;
                         ParamByName('p_Empno').AsString := mEmpno;
                         Open;
                    end
                    else
                    begin
                         Close;
                         SQL.Clear;
                         SQL.Add('select count(*) a                         ');
                         SQL.Add('  from pkhyphis h, pkmpmas p, pkcpbas c   ');
                         SQL.Add(' where c.yearpaynum = h.yearpaynum        ');
                         SQL.Add('   and p.empno = h.empno                  ');
                         SQL.Add('   and p.empno = :p_empno                 ');
                         ParamByName('p_empno').AsString := mEmpno;
                         Open;
                    end;

                    if FieldByName('a').AsInteger < 1 then
                    begin
                         MessageBox(handle,' 급여차수(임원:이사대우제외) 또는 연봉차수(이사대우포함한 정규직)가 부정확합니다. ','입력오류',MB_ICONWARNING);
                         Epaycl.setfocus;
                         Result := False;
                         exit;
                    end
                    else
                    if FieldByName('a').AsInteger > 1 then
                    begin
                         MessageBox(handle,' 급여표(임원:이사대우제외) 또는 연봉표(이사대우포함한 정규직)가 부정확합니다. ','입력오류',MB_ICONWARNING);
                         Epaycl.setfocus;
                         Result := False;
                         exit;
                    end;

                    Query1.Close;

                    Result := True;
               end;
          Finally
               qq.Free;
          end;
     end; // if CheckBox
end;

// 추가
procedure TFinsaedit.fzComboOldNew(bOldNew: Boolean);
begin
     CBfixpay.Checked   := False;
     CBbasicamt.Checked := False;
     CBdutyamt.Checked  := False;

     CBfixpay.Enabled   := bOldNew;
     P_New.Visible      := bOldNew;
     L_New.Visible      := bOldNew;
     P_Yearpaynum.Visible:= bOldNew;

     CBbasicamt.Enabled := not bOldNew;
     CBdutyamt.Enabled  := not bOldNew;

     P_Old.Visible      := not bOldNew;
     L_Old.Visible      := not bOldNew;
     P_paynum.Visible   := not bOldNew;
end;


// 추가
procedure TFinsaedit.EpayclChange(Sender: TObject);
var
     qq : TOraQuery;
begin
//infra     if length(Epaycl.Text) < 2 then exit;
     if length(Epaycl.Text) < 3 then exit;
     qq := TOraQuery.Create(Nil);
     qq.Session := Ora_Session;

     Try
          with qq do
          begin
               if (Epaycl.Text >= FM_Main.gsMinPaycl) and (Epaycl.Text <= FM_Main.gsMaxPaycl) then
               begin
                    Close;
                    SQL.Clear;
                    SQL.Add('select paynum from pkmpmas');
                    SQL.Add(' where empno = :p_empno   ');
                    ParamByName('p_empno').AsString := FM_Main.GSempno;
                    Open;
                    P_Paynum.Caption := Fields[0].AsString;
               end
               else
               begin
                    Close;
                    SQL.Clear;
                    SQL.Add('select max(yearpaynum) from pkcpbas ');
                    Open;
                    P_YearPaynum.Caption := Fields[0].AsString;
               end;
          end;
     Finally
          qq.Free;
     end;

     if (Epaycl.Text >= FM_Main.gsMinPaycl) and (Epaycl.Text <= FM_Main.gsMaxPaycl) then // 급여표
       fzComboOldNew(False)
     else // 연봉표
       fzComboOldNew(True);
end;

// 추가
procedure TFinsaedit.FormCreate(Sender: TObject);
begin
     P_Old.Top    := P_New.Top;
     L_Old.Top    := L_New.Top;
     P_paynum.Top := P_Yearpaynum.Top;
end;

procedure TFinsaedit.SBretdateClick(Sender: TObject);
begin
     calendar := TCalendar.Create(Self);

     Try
          calendar.ShowModal;
          if calendar.DayCaption <> '' then MeRetDate.text := calendar.DayCaption;
     Finally
          calendar.Free;
     end;
end;

end.
