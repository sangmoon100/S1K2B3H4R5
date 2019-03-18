unit pkc11302;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Datelib, db, Func, OnEditBaseCtrl,
  OnEditStdCtrl, OnEditBtnCtrl, OnEditCombo, OnEditNumCtl, Mask;

type

  TAllData = Record
     Empno   :array[1..3000] of String[04];      { 사번 }
     Taxrate :array[1..3000] of String[03];      { 세율 }
     Taxamt  :array[1..3000] of String[10];      { 세액 }
  End;

  TFpkc11302 = class(TForm)
    Phelpmsg: TPanel;
    Panel5: TPanel;
    Panel1: TPanel;
    Label3: TLabel;
    Label5: TLabel;
    BB_Save: TBitBtn;
    OpenDialog1: TOpenDialog;
    Panel2: TPanel;
    CBpaytype: TComboBox;
    Panel3: TPanel;
    CB_Type1: TComboBox;
    Panel6: TPanel;
    Panel7: TPanel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label1: TLabel;
    Panel4: TPanel;
    Edatafile: TEdit;
    Button2: TButton;
    Label2: TLabel;
    CB_Type2: TOnNumberEdit;
    MEPaydate: TMaskEdit;
    Panel8: TPanel;
    SBfrdate: TSpeedButton;
    Eerrorfile: TEdit;
    Label8: TLabel;
    Label10: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure BB_SaveClick(Sender: TObject);
    procedure CB_Type1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SBfrdateClick(Sender: TObject);
  private
    { Private declarations }
    Function CSV_Save(Idx:Integer):Boolean;
    Function new_PassEmp(var cmd : Pchar; gu : integer; separ:String) : string;
  public
    { Public declarations }
    LastRec : Integer;
    k : integer;
    All_data : TAllData;
    F1, F2 : TextFile;
    ErrorText : string;          // 오류 내용
    Error_file : string;
    P : PChar;
    ch: string;
    A: array[0..50] of Char;
  end;

var
  Fpkc11302: TFpkc11302;

implementation

uses pkc11303, pkc11301, FormMon1;

{$R *.DFM}

procedure TFpkc11302.Button2Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    AssignFile(F1, OpenDialog1.Filename);
    Reset(F1);
    Edatafile.text := OpenDialog1.FileName;
    p := pchar(Edatafile.text);
    Eerrorfile.text := ExtractFileDir(OpenDialog1.FileName) + '\급여세금계산관리엑셀업로드.bad';
    Error_file := Eerrorfile.text;
    AssignFile(F2, Error_file);
    Rewrite(F2);
  end;
end;

procedure TFpkc11302.BB_SaveClick(Sender: TObject);
var
  Error_text: String;
  GoodData,BadData: Integer;    //정상,비정상 자료 count
  j: integer;
begin
  if IDNo = Application.MessageBox(PChar('일괄생성작업을 하시겠습니까?'),'작업안내',MB_YesNo+MB_ICONWARNING) then
    Exit;

  if (CB_Type1.ItemIndex = 3) and (Edatafile.text = '') then
  begin
    ShowMessage('엑셀 CSV 화일명이 없습니다. 확인후 다시 작업하세요.');
    Edatafile.SetFocus;
    Exit;
  end;

  Try
    Ora_Session.StartTransaction;

    //일괄삭제
    DM.Query2.Close;
    DM.Query2.SQL.Clear;
    DM.Query2.SQL.Add('delete from Pkyeartax       ');
    DM.Query2.SQL.Add(' where paydate = :paydate   ');
    DM.Query2.SQL.Add('   and paytype = :paytype   ');
    DM.Query2.ParamByName('Paydate').AsString := MEPaydate.text;
    DM.Query2.ParamByName('paytype').AsString := InttoStr(CBpaytype.ItemIndex);
    DM.Query2.ExecSQL;

    if (CB_Type1.ItemIndex = 0) or (CB_Type1.ItemIndex = 1) then  //기본세율, 세액으로 생성
    begin
      DM.Ory_Pkyeartax_Save.Close;
      DM.Ory_Pkyeartax_Save.ParamByName('workyy').AsString   := copy(MEPaydate.text,1,4);
      DM.Ory_Pkyeartax_Save.ParamByName('Paydate').AsString  := MEPaydate.text;
      DM.Ory_Pkyeartax_Save.ParamByName('paytype').AsString  := InttoStr(CBpaytype.ItemIndex);
      DM.Ory_Pkyeartax_Save.ParamByName('WRITEMAN').AsString := Pempno;
      if CB_Type1.ItemIndex = 0 then
      begin
        DM.Ory_Pkyeartax_Save.ParamByName('TaxRate').AsFloat := CB_Type2.Value;
        DM.Ory_Pkyeartax_Save.ParamByName('TaxAmt').AsFloat  := 0;
      end else
      begin
        DM.Ory_Pkyeartax_Save.ParamByName('TaxRate').AsFloat := 0;
        DM.Ory_Pkyeartax_Save.ParamByName('TaxAmt').AsFloat  := CB_Type2.Value;
      end;
      DM.Ory_Pkyeartax_Save.ExecSQL;
    end else if CB_Type1.ItemIndex = 2 then   //전월로 동일하게 생성
    begin
      DM.Ory_Pkyeartax_Save2.Close;
      DM.Ory_Pkyeartax_Save2.ParamByName('workyy').AsString    := copy(MEPaydate.text,1,4);
      DM.Ory_Pkyeartax_Save2.ParamByName('Paydate').AsString   := MEPaydate.text;
      DM.Ory_Pkyeartax_Save2.ParamByName('BPaydate').AsString  := Copy(AddMonStr(MEPaydate.text +'01',-1),1,6);  //전월
      DM.Ory_Pkyeartax_Save2.ParamByName('paytype').AsString   := InttoStr(CBpaytype.ItemIndex);
      DM.Ory_Pkyeartax_Save2.ParamByName('WRITEMAN').AsString  := Pempno;
      DM.Ory_Pkyeartax_Save2.ExecSQL;
    end else if CB_Type1.ItemIndex = 3 then   //엑셀 csv 자료를 일괄업로드
    begin
      //일괄생성
      DM.Ory_Pkyeartax_Save.Close;
      DM.Ory_Pkyeartax_Save.ParamByName('workyy').AsString   := copy(MEPaydate.text,1,4);
      DM.Ory_Pkyeartax_Save.ParamByName('Paydate').AsString  := MEPaydate.text;
      DM.Ory_Pkyeartax_Save.ParamByName('paytype').AsString  := InttoStr(CBpaytype.ItemIndex);
      DM.Ory_Pkyeartax_Save.ParamByName('WRITEMAN').AsString := Pempno;
      DM.Ory_Pkyeartax_Save.ParamByName('TaxRate').AsFloat   := 100;  //기본으로 셋팅
      DM.Ory_Pkyeartax_Save.ParamByName('TaxAmt').AsFloat    := 0;
      DM.Ory_Pkyeartax_Save.ExecSQL;

      //엑셀자료를 반영  (세율과, 세액만 갱신)
      k := 1;
      GoodData := 0;
      BadData := 0;

      while not Eof(F1) do
      begin
        with All_data do
        begin
          Readln(F1, Ch);
          StrPCopy(A,ch);
          P := A;
          Empno[k]   := new_passemp(P,0,',');     //사번
          Taxrate[k] := new_passemp(P,1,',');     //세율
          Taxamt[k]  := new_passemp(P,2,',');     //세액
          k := k+1;
        end;
      end;

      LastRec := k - 1;
      k := 1;
      For j := 1 to LastRec do
      begin
         ErrorText := '';
         PHelpMsg.Caption := '   [ ' + IntToStr(k) + ' / ' + IntToStr(LastRec) + ' ] 에 대해 저장 작업 중...';
         Application.ProcessMessages;

         if CSV_Save(k) then
            Inc(Gooddata)
         else
         begin
           Error_text := All_data.empno[k] +','+All_data.Taxrate[k] +','+ All_data.Taxamt[k]+','+ ErrorText;
           Writeln(F2, Error_text);    // Error File에 기록
           Inc(Baddata);
         end;
         Inc(k);
      end;
      CloseFIle(F2);
      PHelpMsg.Caption := Format('작업을 모두 마쳤습니다.. 총자료건수 %d 건 , 저장건수 %d 건, 오류건수 %d 건', [LastRec , GoodData, BadData]);
    end;

    Ora_Session.Commit;
  Except
    on E: EDatabaseError do
    begin
       MessageBox(handle,PChar(E.Message),'에  러',MB_OK or $0010);
       Ora_Session.Rollback;
       Exit;
    end;
  end;
  phelpmsg.caption := '생성되었습니다... ';
end;

{===============================================================================
         Insert_Record Function
================================================================================}
Function TFpkc11302.CSV_Save(Idx:Integer):Boolean;
begin
  with Dm.Query1 do
  begin
    Close;
    Sql.Clear;
    SQL.Add('update Pkyeartax set                                                ');
    SQL.Add('       TaxRate = :TaxRate,                                          ');
    SQL.Add('       TaxAmt  = :TaxAmt,                                           ');
    SQL.Add('       writetime = to_char(sysdate, ''YYYYMMDDHH24miss''),          ');
    SQL.Add('       writeman = :WRITEMAN                                         ');
    Sql.Add('where Paydate = :Paydate and paytype = :paytype and empno = :empno  ');

    ParamByName('empno').AsString    := All_Data.EmpNo[Idx];
    ParamByName('Paydate').AsString  := MEPaydate.text;
    ParamByName('paytype').AsString  := InttoStr(CBpaytype.ItemIndex);
    ParamByName('TaxRate').AsString  := All_Data.TaxRate[Idx];
    ParamByName('TaxAmt').AsString   := All_Data.TaxAmt[Idx];
    ParamByName('WRITEMAN').AsString := Pempno;

    Try
        Execsql;
    Except On E:EDATABASEERROR Do begin
        close;
        Result := False;
        ErrorText := 'SQL ERROR';
        Application.MessageBox('SQL ERROR','경고',Mb_Ok +Mb_IconError);
        end;
    end;
    Result := True;
    Close;
  end;
end;

Function TFpkc11302.new_PassEmp(var cmd : Pchar; gu : integer; separ:String) : string;
var
  str : string;
begin
  new_PassEmp := '';  str := '';
  str := strpas(cmd);
  case gu of
   0 : new_PassEmp := pasString(str,separ,1);
   1 : new_PassEmp := pasString(str,separ,2);
   2 : new_PassEmp := pasString(str,separ,3);
   3 : new_PassEmp := pasString(str,separ,4);
   4 : new_PassEmp := pasString(str,separ,5);
   5 : new_PassEmp := pasString(str,separ,6);
   6 : new_PassEmp := pasString(str,separ,7);
   7 : new_PassEmp := pasString(str,separ,8);
   8 : new_PassEmp := pasString(str,separ,9);
   9 : new_PassEmp := pasString(str,separ,10);
  end;
end;

procedure TFpkc11302.CB_Type1Change(Sender: TObject);
begin
  if CB_Type1.ItemIndex = 3 then
     Panel6.Visible := True
  else
     Panel6.Visible := False;

  if (CB_Type1.ItemIndex = 0) or (CB_Type1.ItemIndex = 1) then
  begin
     CB_Type2.Visible := True;
     if  CB_Type1.ItemIndex = 0 then
       Label2.Visible := True
     else
       Label2.Visible := False;
  end else
  begin
     CB_Type2.Visible := False;
     Label2.Visible   := False;
  end;
end;

procedure TFpkc11302.FormShow(Sender: TObject);
begin
  CBpaytype.ItemIndex  := 0;
  CB_Type1.ItemIndex   := 0;
  MEPaydate.Text := FormatDateTime('YYYYMM', Now);
end;

procedure TFpkc11302.SBfrdateClick(Sender: TObject);
begin
  Try
    MonthForm := TMonthForm.Create(Application);
    MonthForm.rDayCaption := MEPaydate.Text;
    MonthForm.ShowModal;
    MEPaydate.Text := MonthForm.DayCaption;
  Finally
    MonthForm.Free;
  End;
end;

end.
