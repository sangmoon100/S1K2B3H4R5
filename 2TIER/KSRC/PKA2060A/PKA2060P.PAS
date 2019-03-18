unit Pka2060p;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, DB, Grids, DBGrids, DBTables,
  Mask, DBCtrls, Calen1, numedit, DateLib, MemDS,
  DBAccess, Ora, Func, ComCtrls;

type
  TFpka2060a = class(TForm)
    Panel8: TPanel;
    Panel19: TPanel;
    Lempinfo: TLabel;
    Lsysdate: TLabel;
    s: TPanel;
    Label13: TLabel;
    Lcretime: TLabel;
    Panel4: TPanel;
    BBfirst: TBitBtn;
    BBprior: TBitBtn;
    BBnext: TBitBtn;
    BBlast: TBitBtn;
    BBclose: TBitBtn;
    BBinsert: TBitBtn;
    BBdelete: TBitBtn;
    BBcancel: TBitBtn;
    BBupdate: TBitBtn;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    MeExfrdate: TMaskEdit;
    MeExtodate: TMaskEdit;
    EdExdesc: TEdit;
    Lexdays: TLabel;
    SbEmpno: TSpeedButton;
    SbExfrdate: TSpeedButton;
    SBextodate: TSpeedButton;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel1: TPanel;
    Panel9: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Panel21: TPanel;
    EdEmpno: TEdit;
    Panel3: TPanel;
    Panel10: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    NeExyy: TNumberEdit;
    NeExmm: TNumberEdit;
    NeExdd: TNumberEdit;
    PnKorname: TPanel;
    Panel2: TPanel;
    EdEmpnoFind: TEdit;
    EdKornameFind: TEdit;
    Lcurrow: TLabel;
    EdExkind: TEdit;
    SBexkind: TSpeedButton;
    Pexkind: TPanel;
    EdExanno: TEdit;
    SBexanno: TSpeedButton;
    Pexanno: TPanel;
    Panel15: TPanel;
    OraQuery1: TOraQuery;
    RgOrder: TRadioGroup;
    RbExfix: TRadioGroup;
    OraQuery1CNT: TFloatField;
    OraQuery1EMPNO: TStringField;
    OraQuery1KORNAME: TStringField;
    OraQuery1EXKIND: TStringField;
    OraQuery1EXANNO: TStringField;
    OraQuery1EXANNONO: TStringField;
    OraQuery1EXFRDATE: TStringField;
    OraQuery1EXTODATE: TStringField;
    OraQuery1EXYY: TIntegerField;
    OraQuery1EXMM: TIntegerField;
    OraQuery1EXDD: TIntegerField;
    OraQuery1EXDAYS: TIntegerField;
    OraQuery1EXDESC: TStringField;
    OraQuery1EXFIXYN: TStringField;
    OraQuery1CRETIME: TStringField;
    OraQuery1WRITETIME: TStringField;
    OraQuery1WRITEMAN: TStringField;
    OraQuery1Texkind: TStringField;
    OraQuery1Texanno: TStringField;
    SB_Help: TStatusBar;
    procedure FormActivate(Sender: TObject);
    procedure BBfirstClick(Sender: TObject);
    procedure BBpriorClick(Sender: TObject);
    procedure BBnextClick(Sender: TObject);
    procedure BBlastClick(Sender: TObject);
    procedure BBcancelClick(Sender: TObject);
    procedure BBupdateClick(Sender: TObject);
    procedure BBcloseClick(Sender: TObject);
    procedure BBinsertClick(Sender: TObject);
    procedure BBdeleteClick(Sender: TObject);
    procedure EdEmpnoKeyPress(Sender: TObject; var Key: Char);
    procedure MeExfrdateExit(Sender: TObject);
    procedure MeExfrdateKeyPress(Sender: TObject; var Key: Char);
    procedure MeExtodateKeyPress(Sender: TObject; var Key: Char);
    procedure SbEmpnoClick(Sender: TObject);
    procedure SbExfrdateClick(Sender: TObject);
    procedure SBextodateClick(Sender: TObject);
    procedure MeExtodateExit(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure MeExfrdateChange(Sender: TObject);
    procedure MeExtodateChange(Sender: TObject);
    procedure EdEmpnoChange(Sender: TObject);
    procedure EdEmpnoFindKeyPress(Sender: TObject; var Key: Char);
    procedure EdKornameFindKeyPress(Sender: TObject; var Key: Char);
    procedure EdEmpnoFindClick(Sender: TObject);
    procedure EdKornameFindClick(Sender: TObject);
    procedure SBexkindClick(Sender: TObject);
    procedure SBexannoClick(Sender: TObject);
    procedure EdExkindKeyPress(Sender: TObject; var Key: Char);
    procedure EdExannoKeyPress(Sender: TObject; var Key: Char);
    procedure OraQuery1CalcFields(DataSet: TDataSet);
    procedure RgOrderClick(Sender: TObject);
  private
    { Private declarations }
    SDFM : string;                                      // System Date Format Mask
    LSempno : String;
    LSkorname : String;
    LSexkind : String;
    LSexanno : String;
    LSexannono : String;
    LSexfrdate : String;
    LSextodate : String;
    LSexdays : String;
    LSexdesc : String;
    LSexfixyn : String;
    LScretime : String;
    LSwritetime : String;
    LSwriteman : String;
    LSexkindN : String;
    LSexannoN : String;
    LIbutnstatus : Integer;
    SearchFlag   : integer;
    LIchk  : Integer; {Edit Mode Calender Check}
    LRexyy : Real;
    LRexmm : Real;
    LRexdd : Real;
    Procedure Retrieve;
    Procedure CalcExdays;
    Function  DuplicateCheck : Boolean;
 public
    { Public declarations }
    Function SetEmpTime  : Integer;
  end;

var
  Fpka2060a: TFpka2060a;
  CodeString: TStringList;  // codeno list
  DataString: TStringList;  // codename list

implementation

uses KeyEmpno, KeyCode;

{$R *.DFM}

Function TFpka2060a.SetEmpTime;
begin
     Application.ProcessMessages;
     OraConnect;
     Lempinfo.Caption := Pkorname + '(' + Pempno + ')' ;
     Lsysdate.caption := fn_GetDateStr;
end;

procedure TFpka2060a.FormActivate(Sender: TObject);
var
   i : integer;
begin
     SB_Help.Panels[1].Text := ' 작업자,작업일설정 및 등록자료를 조회하고 있습니다.';

     SetEmpTime;

     Retrieve;

     SB_Help.Panels[1].Text := ' 작업자,작업일설정 및 등록자료 조회를 완료했습니다.';
end;

// 자료조회
procedure TFpka2060a.Retrieve;
begin
     with OraQuery1 do
     begin
          Close;
          SQL.Clear;
          SQL.Add('select rownum cnt, a.*  ');
          SQL.Add('from (select * from pkhexdd          ');

          if RgOrder.ItemIndex = 0 then SQL.Add('order by empno, exfrdate) a ')
          else                          SQL.Add('order by exfrdate, empno) a ');

          Open;

          LIbutnstatus := 0;
          EdEmpno.Enabled := False;
          SbEmpno.Enabled := False;
          MeExfrdate.Enabled := False;
          SbExfrdate.Enabled := False;
     end;
end;

// 근속제외기간일수 계산
Procedure TFpka2060a.CalcExdays;
var
     tmp_Date : String;
begin
     Lexdays.Caption := IntToStr(DayCountInt(MeExfrdate.Text, MeExtodate.Text));

     //년,월,일 계산 ----- 인사일수계산방법
     tmp_Date := DateCal(MeExfrdate.Text,MeExtodate.Text);
     NeExyy.Value := StrToFloat(Copy(tmp_Date,1,2));
     NeExmm.Value := StrToFloat(Copy(tmp_Date,3,2));
     NeExdd.Value := StrToFloat(Copy(tmp_Date,5,2));
end;

//---------------------------------- MAIN --------------------------------------

//사번조회
procedure TFpka2060a.SbEmpnoClick(Sender: TObject);
begin
     FKeyEmpno := TFKeyEmpno.Create(Self);

     try
          FKeyEmpno.EdEmpno.Text := EdEmpno.Text;
          FKeyEmpno.ShowModal;

          if FKeyEmpno.CloseChk = -1 then Exit;

          EdEmpno.Text     := FKeyEmpno.v_KeyEmpno;
          PnKorname.Caption := FKeyEmpno.v_KeyKorname;
     finally
          FKeyEmpno.Free;
     end;
end;

//입력시사번조회
procedure TFpka2060a.EdEmpnoChange(Sender: TObject);
begin
     If Length(EdEmpno.Text) = 4 then PnKorname.Caption := GetKorName(EdEmpno.Text);
end;

procedure TFpka2060a.EdEmpnoKeyPress(Sender: TObject; var Key: Char);
begin
     If key = #13 then
     begin
          key := #0;
          if GetKorName(EdEmpno.Text) = '' then
          begin
               MessageBox(handle,'입력한 사번이 존재하지않습니다. 다시입력하세요!','사번입력오류',MB_ICONWARNING);
               EdEmpno.SetFocus;
               Exit;
          end;
          PnKorname.Caption := GetKorName(EdEmpno.Text);
          EdExkind.SetFocus;
     end;
end;

// 중복자료 Check
Function TFpka2060a.DuplicateCheck : Boolean;
var
     qq : TOraQuery;
begin
     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     try
          with qq do
          begin
               Close;
               SQL.Clear;
               SQL.Add('select empno                ');
               SQL.Add('from pkhexdd                ');
               SQL.Add('where empno = :empno        ');
               SQL.Add('  and exfrdate = :exfrdate  ');

               ParamByName('empno'   ).AsString := EdEmpno.Text;
               ParamByName('exfrdate').AsString := MeExfrdate.Text;
               Open;

               If RecordCount = 0 then Result := True
               else                    Result := False;
          end;
     finally
          qq.Free;
     end;
end;

//달력 from Call & Check
procedure TFpka2060a.SbExfrdateClick(Sender: TObject);
begin
     Calendar := TCalendar.Create(Self);

     try
          Calendar.ShowModal;
          If Calendar.DayCaption = '' then Exit;
          MeExfrdate.Text := Calendar.DayCaption;
     finally
          Calendar.Free;
     end;
end;

procedure TFpka2060a.SBextodateClick(Sender: TObject);
begin
     LIchk := 1;
     Calendar := TCalendar.Create(Self);

     try
          Calendar.ShowModal;
          If Calendar.DayCaption = '' then exit;
          MeExtodate.Text := Calendar.DayCaption;
     finally
          Calendar.Free;
     end;
     MeExtodate.Setfocus;
end;

procedure TFpka2060a.MeExfrdateChange(Sender: TObject);
begin
     If Length(Trim(MeExfrdate.Text)) = 8 then
     begin
          if DateCheck(MeExfrdate.Text) = False then
          begin
               MessageBox(handle,'지급년월일From을 정확히 입력하세요.','날짜입력오류',MB_ICONWARNING);
               MeExfrdate.SetFocus;
               Exit;
          end;
     end;
end;

procedure TFpka2060a.MeExtodateChange(Sender: TObject);
begin
     If Length(Trim(MeExtodate.Text)) = 8 then
     begin
          if DateCheck(MeExtodate.Text) = False then
          begin
               MessageBox(handle,'지급년월일From을 정확히 입력하세요.','날짜입력오류',MB_ICONWARNING);
               MeExtodate.SetFocus;
               Exit;
          end;
     end;
end;

procedure TFpka2060a.MeExfrdateExit(Sender: TObject);
begin
     If DuplicateCheck = False then
     begin
         MessageBox(handle,'동일자료가 이미 존재합니다. 다시확인후 작업하세요!','작업조건입력오류',MB_ICONWARNING);
         EdEmpno.SetFocus;
         Exit;
     end;

     If Length(Trim(MeExtodate.Text)) = 8 then
     begin
          if DateCheck(MeExtodate.Text) = True then CalcExdays;
     end;
end;

//사번,특이기간
procedure TFpka2060a.MeExfrdateKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 then
     begin
          key := #0;
          If Length(EdEmpno.Text) < 4 then
          begin
               MessageBox(handle,'입력한 사번이 존재하지않습니다. 다시입력하세요!','사번입력오류',MB_ICONWARNING);
               EdEmpno.SetFocus;
               Exit;
          end;

          If DateCheck(MeExfrdate.Text) = False then
          begin
               MessageBox(handle,'특이기간From을 정확히 입력하세요.','날짜입력오류',MB_ICONWARNING);
               MeExfrdate.SetFocus;
               Exit;
          end;
          MeExtodate.SetFocus;
     end;
end;

procedure TFpka2060a.MeExtodateExit(Sender: TObject);
begin
     If Length(Trim(MeExfrdate.Text)) = 8 then
     begin
          If DateCheck(MeExtodate.Text) = True then CalcExdays;
     end;
     LIchk := 0;
end;

procedure TFpka2060a.MeExtodateKeyPress(Sender: TObject; var Key: Char);
begin
     If Key = #13 then
     begin
          key := #0;
          If Length(EdEmpno.Text) < 4 then
          begin
               MessageBox(handle,'사번을 정확히 입력하세요.','사번입력오류',MB_ICONWARNING);
               EdEmpno.SetFocus;
               Exit;
          end;

          If DateCheck(MeExfrdate.Text) = False then
          begin
               MessageBox(handle,'특이기간From을 정확히 입력하세요.','날짜입력오류',MB_ICONWARNING);
               MeExfrdate.SetFocus;
               Exit;
          end;

          If DateCheck(MeExtodate.Text) = False then
          begin
               MessageBox(handle,'특이기간To를 정확히 입력하세요.','날짜입력오류',MB_ICONWARNING);
               MeExtodate.SetFocus;
               Exit;
          end;

          If MeExfrdate.Text > MeExtodate.Text then
          begin
               MessageBox(handle,'특이기간[From > To]를 정확히 입력하세요.','날짜입력오류',MB_ICONWARNING);
               MeExtodate.SetFocus;
               Exit;
          end;
          EdExdesc.SetFocus;
     end;
end;

procedure TFpka2060a.BBfirstClick(Sender: TObject);
begin
     OraQuery1.First;
     DBGrid1.SetFocus;
end;

procedure TFpka2060a.BBpriorClick(Sender: TObject);
begin
     OraQuery1.Prior;
     DBGrid1.SetFocus;
end;

procedure TFpka2060a.BBnextClick(Sender: TObject);
begin
     OraQuery1.Next;
     DBGrid1.SetFocus;
end;

procedure TFpka2060a.BBlastClick(Sender: TObject);
begin
     OraQuery1.Last;
     DBGrid1.SetFocus;
end;

//CANCEL
procedure TFpka2060a.BBcancelClick(Sender: TObject);
begin
     If IDNO = Application.MessageBox('작업을 취소하시겠습니까?','작업안내', MB_YesNo) then  Exit;

     with OraQuery1 do
     begin
          EdEmpno.Text       := FieldByName('empno'   ).AsString;
          PnKorname.Caption  := FieldByName('korname' ).AsString;
          MeExfrdate.Text    := FieldByName('exfrdate').AsString;
          MeExtodate.Text    := FieldByName('extodate').AsString;

          If FieldByName('exfixyn').AsString = 'Y' then RbExfix.ItemIndex := 0
          else                                          RbExfix.ItemIndex := 1;

          Lexdays.Caption    := FieldByName('exdays').AsString;
          EdExdesc.Text       := FieldByName('exdesc').AsString;
          Lcretime.Caption   := Copy((FieldByName('cretime').AsString),1,4) + '/' +
                                Copy((FieldByName('cretime').AsString),5,2) + '/' +
                                Copy((FieldByName('cretime').AsString),7,2);
          EdExkind.Text      := FieldByName('exkind').AsString;
          EdExanno.Text       := FieldByName('exanno').AsString;
          EdEmpno.Enabled    := False;
          SBempno.Enabled    := False;
          MeExfrdate.Enabled := False;
          SbExfrdate.Enabled := False;
          Pexkind.Caption    := GetCodeName('K215',EdExkind.Text);
          Pexanno.Caption    := GetCodeName('I300',EdExanno.Text);
          NeExyy.Value       := FieldByName('exyy').AsFloat;
          NeExmm.Value       := FieldByName('exmm').AsFloat;
          NeExdd.Value       := FieldByName('exdd').AsFloat;
          LIbutnstatus       := 0;
          SB_Help.Panels[1].Text := ' 작업이 취소되었습니다.!';
          DBGrid1.SetFocus;
     end;
end;

//실행 UPDATE / INSERT
procedure TFpka2060a.BBupdateClick(Sender: TObject);
var
     qq : TOraQuery;
     iKey : Char;
begin
     iKey := #13;

     If Length(EdEmpno.Text) <> 4 then
     begin
          MessageBox(handle,'사번을 정확히 입력하세요.','사번입력오류',MB_ICONWARNING);
          Exit;
     end;

     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     try
          with qq do
          begin
               Close;
               SQL.Clear;
               SQL.Add('select korname        ');
               SQL.Add('  from pkhexdd        ');
               SQL.Add(' where empno = :empno ');

               ParamByName('empno').AsString := EdEmpno.Text;
               Open;

               If RecordCount < 1 then
               begin
                    MessageBox(handle,'사번을 정확히 입력하세요.','사번입력오류',MB_ICONWARNING);
                    Exit;
               end;

               MeExtodateKeyPress(Sender,iKey);

               Close;
               SQL.Clear;
               SQL.Add('select max(extodate) extodate ');
               SQL.Add('  from pkhexdd                ');
               SQL.Add(' where empno = :empno         ');

               ParamByName('empno').AsString := EdEmpno.Text;
               Open;

               If LIbutnstatus = 1 then
               begin
                    If FieldByName('extodate').AsString >= MeExfrdate.Text then
                    begin
                         MessageBox(handle,'최종 특이기간 이후로만 입력할 수 있습니다.','특이기간입력오류',MB_ICONWARNING);
                         Exit;
                    end;
               end;

               //생성일수 계산을 위한 날짜변환  LDt - LDf + 1
               Lexdays.Caption := IntToStr(DayCountInt(MeExfrdate.Text,MeExtodate.Text));

               //년,월,일 계산 ----- 인사일수계산방법
               NeExyy.Value := StrToFloat(Copy(DateCal(MeExfrdate.Text,MeExtodate.Text),1,2));
               NeExmm.Value := StrToFloat(Copy(DateCal(MeExfrdate.Text,MeExtodate.Text),3,2));
               NeExdd.Value := StrToFloat(Copy(DateCal(MeExfrdate.Text,MeExtodate.Text),5,2));

               If LIbutnstatus = 0 then
               begin //Update
                    If IDNO = Application.MessageBox('저장 하시겠습니까?','저장작업안내', MB_YesNo) then Exit;

                    Close;
                    SQL.Clear;
                    SQL.Add('update pkhexdd set exkind    = :exkind   , ');
                    SQL.Add('                   exanno    = :exanno   , ');
                    SQL.Add('                   extodate  = :extodate , ');
                    SQL.Add('                   exdays    = :exdays   , ');
                    SQL.Add('                   exdesc    = :exdesc   , ');
                    SQL.Add('                   exfixyn   = :exfixyn  , ');
                    SQL.Add('                   exyy      = :exyy     , ');
                    SQL.Add('                   exmm      = :exmm     , ');
                    SQL.Add('                   exdd      = :exdd     , ');
                    SQL.Add('                   cretime   = :cretime  , ');
                    SQL.Add('                   writetime = :writetime, ');
                    SQL.Add('                   writeman  = :writeman   ');
                    SQL.Add('where empno    = :empno                    ');
                    SQL.Add('  and exfrdate = :exfrdate                 ');

                    ParamByName('exkind'   ).AsString := EdExkind.Text;
                    ParamByName('exanno'   ).AsString := EdExanno.Text;
                    ParamByName('extodate' ).AsString := MeExtodate.Text;
                    ParamByName('exdays'   ).AsFloat  := DayCountInt(MeExfrdate.Text,MeExtodate.Text);
                    ParamByName('exdesc'   ).AsString := EdExdesc.Text;
                    If RbExfix.ItemIndex = 0 then ParamByName('exfixyn'  ).AsString := 'Y'
                    else                          ParamByName('exfixyn'  ).AsString := 'N';
                    ParamByName('exyy'     ).AsString := FloatToStr(NeExyy.Value);
                    ParamByName('exmm'     ).AsString := FloatToStr(NeExmm.Value);
                    ParamByName('exdd'     ).AsString := FloatToStr(NeExdd.Value);
                    ParamByName('cretime'  ).AsString := fn_GetDateTimeStr;
                    ParamByName('writetime').AsString := fn_GetDateTimeStr;
                    ParamByName('writeman' ).AsString := Pempno;
                    ParamByName('empno'    ).AsString := EdEmpno.Text;
                    ParamByName('exfrdate' ).AsString := MeExfrdate.Text;
                    ExecSQL;
                    Retrieve;

                    OraQuery1.Locate('EMPNO',EdEmpno.Text,[loPartialKey]);
                    DBGrid1.SetFocus;
                    SB_Help.Panels[1].Text := ' 수정자료 저장이 완료되었습니다!';
                    Exit;
               end
               else
               begin //Insert
                    If IDNO = Application.MessageBox('신규등록 하시겠습니까?','신규등록작업안내', MB_YesNo) then
                    begin
                         BBcancelClick(Fpka2060a);
                         Exit;
                    end;

                    // Function DuplicateCheck
                    If DuplicateCheck = False then
                    begin
                         MessageBox(handle,'동일자료가 이미 존재합니다. 다시확인후 작업하세요!','작업조건입력오류',MB_ICONWARNING);
                         EdEmpno.SetFocus;
                         Exit;
                    end;

                    Close;
                    SQL.Clear;
                    SQL.Add('insert into pkhexdd ( empno,     ');
                    SQL.Add('                      korname,   ');
                    SQL.Add('                      exkind,    ');
                    SQL.Add('                      exanno,    ');
                    SQL.Add('                      exannono,  ');
                    SQL.Add('                      exfrdate,  ');
                    SQL.Add('                      extodate,  ');
                    SQL.Add('                      exdays,    ');
                    SQL.Add('                      exdesc,    ');
                    SQL.Add('                      exfixyn,   ');
                    SQL.Add('                      cretime,   ');
                    SQL.Add('                      writetime, ');
                    SQL.Add('                      writeman,  ');
                    SQL.Add('                      exyy,      ');
                    SQL.Add('                      exmm,      ');
                    SQL.Add('                      exdd )     ');
                    SQL.Add('             values (:empno,     ');
                    SQL.Add('                     :korname,   ');
                    SQL.Add('                     :exkind,    ');
                    SQL.Add('                     :exanno,    ');
                    SQL.Add('                     :exannono,  ');
                    SQL.Add('                     :exfrdate,  ');
                    SQL.Add('                     :extodate,  ');
                    SQL.Add('                     :exdays,    ');
                    SQL.Add('                     :exdesc,    ');
                    SQL.Add('                     :exfixyn,   ');
                    SQL.Add('                     :cretime,   ');
                    SQL.Add('                     :writetime, ');
                    SQL.Add('                     :writeman,  ');
                    SQL.Add('                     :exyy,      ');
                    SQL.Add('                     :exmm,      ');
                    SQL.Add('                     :exdd )     ');

                    ParamByName('empno'    ).AsString := EdEmpno.Text;
                    ParamByName('korname'  ).AsString := PnKorname.Caption;
                    ParamByName('exkind'   ).AsString := EdExkind.Text;
                    ParamByName('exanno'   ).AsString := EdExanno.Text;
                    ParamByName('exfrdate' ).AsString := MeExfrdate.Text;
                    ParamByName('extodate' ).AsString := MeExtodate.Text;
                    ParamByName('exdays'   ).AsFloat  := DayCountInt(MeExfrdate.Text,MeExtodate.Text);
                    ParamByName('exdesc'   ).AsString := EdExdesc.Text;
                    If RbExfix.ItemIndex = 0 then ParamByName('exfixyn'  ).AsString := 'Y'
                    else                          ParamByName('exfixyn'  ).AsString := 'N';
                    ParamByName('cretime'  ).AsString := fn_GetDateTimeStr;
                    ParamByName('writetime').AsString := fn_GetDateTimeStr;
                    ParamByName('writeman' ).AsString := Pempno;
                    ParamByName('exyy'     ).AsString := FloatToStr(NeExyy.Value);
                    ParamByName('exmm'     ).AsString := FloatToStr(NeExmm.Value);
                    ParamByName('exdd'     ).AsString := FloatToStr(NeExdd.Value);

                    ExecSQL;
                    Retrieve;

                    OraQuery1.Locate('EMPNO',EdEmpno.Text,[loPartialKey]);
                    DBGrid1.SetFocus;
                    SB_Help.Panels[1].Text := ' 신규입력자료 저장이 완료되었습니다!';
                    Exit;
               end;
          end;
     finally
          qq.Free;
     end;
end;

//SELECT INSERT
procedure TFpka2060a.BBinsertClick(Sender: TObject);
begin
     LIbutnstatus       := 1;
     EdEmpno.Enabled    := True;
     SBempno.Enabled    := True;
     MeExfrdate.Enabled := True;
     SbExfrdate.Enabled := True;
     EdEmpno.Text       := '';
     PnKorname.Caption  := '';
     MeExfrdate.Text    := '';
     MeExtodate.Text    := '';
     Lexdays.Caption    := '';
     RbExfix.ItemIndex  := 1;
     EdExdesc.Text      := '';
     Lcretime.Caption   := '';
     EdExkind.Text      := '';
     EdExanno.Text      := '';
     Pexkind.Caption    := '';
     Pexanno.Caption    := '';
     NeExyy.Value       := 0;
     NeExmm.Value       := 0;
     NeExdd.Value       := 0;
     EdEmpno.SetFocus;
     SB_Help.Panels[1].Text := ' 사번(KEY),특이기간From(KEY), 특이기간To(필수), 기타항목 입력후 저장하세요!';
end;

//DELETE
procedure TFpka2060a.BBdeleteClick(Sender: TObject);
var
     qq : TOraQuery;
begin
     If LIbutnstatus = 1 then Exit;  //입력작업 선택시
     If IDNO = Application.MessageBox('자료를 삭제하시겠습니까?','작업안내', MB_YesNo) then Exit;

     qq := TOraQuery.Create(nil);
     qq.Session := Ora_Session;

     try
          with qq do
          begin
               Close;
               SQL.Clear;
               SQL.Add('delete from pkhexdd         ');
               SQL.Add('where empno    = :empno     ');
               SQL.Add('  and exfrdate = :exfrdate  ');

               ParamByName('empno'   ).AsString := EdEmpno.Text;
               ParamByName('exfrdate').AsString := MeExfrdate.Text;

               ExecSql;

               Retrieve;
               SB_Help.Panels[1].Text := ' 선택자료삭제가 완료되었습니다!';
          end;
     finally
          qq.Free;
     end;
end;

//DBG자료이동시 데이타필드변환
procedure TFpka2060a.DataSource1DataChange(Sender: TObject; Field: TField);
begin
     If LIbutnstatus = 1 then Exit;  //Insert
     If LIchk = 1 then Exit;         //Edit Date

     If SearchFlag = 0 then
     begin
          with OraQuery1 do
          begin
               EdEmpno.Text      := FieldByName('empno').AsString;
               PnKorname.Caption := FieldByName('korname').AsString;
               MeExfrdate.Text   := FieldByName('exfrdate').AsString;
               MeExtodate.Text   := FieldByName('extodate').AsString;
               Lexdays.Caption   := FieldByName('exdays').AsString;

               If FieldByName('exfixyn').AsString = 'Y' then RbExfix.ItemIndex := 0
               else                                          RbExfix.ItemIndex := 1;

               EdExdesc.Text     := FieldByName('exdesc').AsString;
               Lcretime.Caption  := Copy((FieldByName('cretime').AsString),1,4) + '/' +
                                    Copy((FieldByName('cretime').AsString),5,2) + '/' +
                                    Copy((FieldByName('cretime').AsString),7,2);
               EdExkind.Text     := FieldByName('exkind').AsString;
               EdExanno.Text     := FieldByName('exanno').AsString;
               Pexkind.Caption   := GetCodeName('K215',FieldByName('exkind').AsString);
               Pexanno.Caption   := GetCodeName('I300',FieldByName('exanno').AsString);
               NeExyy.Value      := FieldByName('exyy').AsFloat;
               NeExmm.Value      := FieldByName('exmm').AsFloat;
               NeExdd.Value      := FieldByName('exdd').AsFloat;
               Lcurrow.Caption := '['+IntToStr(OraQuery1CNT.AsInteger)+' / '+
                                      IntToStr(OraQuery1.RecordCount)+']';
          end;
     end;
end;

// 특이구분, 발령구분
procedure TFpka2060a.OraQuery1CalcFields(DataSet: TDataSet);
begin
     OraQuery1.FieldByName('Texkind').AsString := GetCodeName('K215',OraQuery1.FieldByName('exkind').AsString);
     OraQuery1.FieldByName('Texanno').AsString := GetCodeName('I300',OraQuery1.FieldByName('exanno').AsString);
end;

//CLOSE
procedure TFpka2060a.BBcloseClick(Sender: TObject);
begin
     If IDYES = Application.MessageBox('작업을 종료하시겠습니까?','작업안내', MB_YesNo) then  Close;
end;

// 사번 찾기
procedure TFpka2060a.EdEmpnoFindClick(Sender: TObject);
begin
    SB_Help.Panels[1].Text := ' 찾을사원의 사번을 모두 입력한 후 Enter Key 를 누르세요.';
end;

procedure TFpka2060a.EdEmpnoFindKeyPress(Sender: TObject; var Key: Char);
var SearchOptions : TLocateOptions;
begin
     SearchOptions := [loPartialKey];
     If key = #13 then
     begin
          key := #0;
          If OraQuery1.Locate('EMPNO',EdEmpnoFind.Text,SearchOptions) then
          begin
               DBGrid1.SetFocus;
               EdEmpnoFind.Text := '';
               EdKornameFind.Text := '';
               SB_Help.Panels[1].Text := ' 해당사원이 조회되었습니다.';
          end
          else SB_Help.Panels[1].Text := ' 해당사원이 존재하지 않습니다.';
     end;
end;

// 사원 성명찾기
procedure TFpka2060a.EdKornameFindClick(Sender: TObject);
begin
     If LIbutnstatus = 1 then
     begin
          SB_Help.Panels[1].Text := ' 입력상태에서는 사원[성명]찾기를 할 수 없습니다.';
          exit;
     end;
     SB_Help.Panels[1].Text := ' 찾을사원의 성명을 입력한후 Enter Key 를 누르세요.';
end;

procedure TFpka2060a.EdKornameFindKeyPress(Sender: TObject; var Key: Char);
begin
     If key = #13 then
     begin
          key := #0;
          If LIbutnstatus = 1 then
          begin
               SB_Help.Panels[1].Text := ' 입력상태에서는 사원[성명]찾기를 할 수 없습니다.';
               Exit;
          end;

          SearchFlag := 1;
          with OraQuery1 do
          begin
               First;

               while not Eof do
               begin
                    If Copy(EdKornameFind.Text,1,Length(EdKornameFind.Text)) = Copy(OraQuery1KORNAME.AsString,1,Length(EdKornameFind.Text)) then
                    begin
                         SB_Help.Panels[1].Text := ' 찾는사원 '+OraQuery1KORNAME.AsString+'['+OraQuery1EMPNO.AsString+'] 이(가) 조회되었습니다.';

                         EdEmpno.Text      := FieldByName('empno'   ).AsString;
                         PnKorname.Caption := FieldByName('korname' ).AsString;
                         MeExfrdate.Text   := FieldByName('exfrdate').AsString;
                         MeExtodate.Text   := FieldByName('extodate').AsString;
                         Lexdays.Caption   := FieldByName('exdays'  ).AsString;
                         If FieldByName('exfixyn').AsString = 'Y' then RbExfix.ItemIndex := 0
                         else                                          RbExfix.ItemIndex := 1;

                         EdExdesc.Text     := FieldByName('exdesc').AsString;
                         Lcretime.Caption  := Copy((FieldByName('cretime').AsString),1,4) + '/' +
                                              Copy((FieldByName('cretime').AsString),5,2) + '/' +
                                              Copy((FieldByName('cretime').AsString),7,2);
                         EdExkind.Text     := FieldByName('exkind').AsString;
                         EdExanno.Text     := FieldByName('exanno').AsString;
                         Pexkind.Caption   := GetCodeName('K215',FieldByName('exkind').AsString);
                         Pexanno.Caption   := GetCodeName('I300',FieldByName('exanno').AsString);
                         NeExyy.Value      := FieldByName('exyy').AsInteger;
                         NeExmm.Value      := FieldByName('exmm').AsInteger;
                         NeExdd.Value      := FieldByName('exdd').AsInteger;
                         Lcurrow.Caption := '['+IntToStr(OraQuery1CNT.AsInteger)+' / '+
                                                IntToStr(RecordCount)+']';
                         DBGrid1.SetFocus;
                         If IDNO = Application.MessageBox('다음사원을 계속 검색하시습니까?','작업안내', MB_YesNo) then
                         begin
                              EdEmpnoFind.Text := '';
                              EdKornameFind.Text := '';
                              SearchFlag := 0;
                              Exit;
                         end;
                    end;
                    Next;
               end;

               SB_Help.Panels[1].Text := ' 찾는사원이 존재하지 않습니다.';

               EdEmpno.Text      := FieldByName('empno'   ).AsString;
               PnKorname.Caption := FieldByName('korname' ).AsString;
               MeExfrdate.Text   := FieldByName('exfrdate').AsString;
               MeExtodate.Text   := FieldByName('extodate').AsString;
               Lexdays.Caption   := FieldByName('exdays'  ).AsString;
               If FieldByName('exfixyn').AsString = 'Y' then RbExfix.ItemIndex := 0
               else                                          RbExfix.ItemIndex := 1;

               EdExdesc.Text     := FieldByName('exdesc').AsString;
               Lcretime.Caption  := Copy((FieldByName('cretime').AsString),1,4) + '/' +
                                    Copy((FieldByName('cretime').AsString),5,2) + '/' +
                                    Copy((FieldByName('cretime').AsString),7,2);
               EdExkind.Text     := FieldByName('exkind').AsString;
               EdExanno.Text     := FieldByName('exanno').AsString;
               Pexkind.Caption   := GetCodeName('K215',FieldByName('exkind').AsString);
               Pexanno.Caption   := GetCodeName('I300',FieldByName('exanno').AsString);
               NeExyy.Value      := FieldByName('exyy').AsInteger;
               NeExmm.Value      := FieldByName('exmm').AsInteger;
               NeExdd.Value      := FieldByName('exdd').AsInteger;
               Lcurrow.Caption := '['+IntToStr(OraQuery1CNT.AsInteger)+' / '+
                                      IntToStr(RecordCount)+']';
               SearchFlag := 0;
          end;
    end;
end;

procedure TFpka2060a.SBexkindClick(Sender: TObject);
begin
     FKeyCode := TFKeyCode.Create(Self);

     try
          FKeyCode.FormData := '특이구분코드조회';
          FKeyCode.Dataval1 := 'K215';
          FKeyCode.ShowModal;
          If FKeyCode.CloseChk = -1 then Exit;  {선택없이종료...}
          EdExkind.Text   := FKeyCode.Code;
          Pexkind.Caption := FKeyCode.Codename;
     finally
          FKeyCode.Free;
     end;
end;

procedure TFpka2060a.SBexannoClick(Sender: TObject);
begin
     FKeyCode := TFKeyCode.Create(Self);

     try
          FKeyCode.FormData := '인사발령구분코드조회';
          FKeyCode.Dataval1 := 'I300';
          FKeyCode.ShowModal;
          If FKeyCode.CloseChk = -1 then Exit;  {선택없이종료...}
          EdExanno.Text   := FKeyCode.Code;
          Pexanno.Caption := FKeyCode.Codename;
     Finally
          FKeyCode.Free;
     end;
end;

procedure TFpka2060a.EdExkindKeyPress(Sender: TObject; var Key: Char);
begin
     If key = #13 then
     begin
          key := #0;
          Pexkind.Caption := GetCodeName('K215',EdExkind.Text);
     end;
end;

procedure TFpka2060a.EdExannoKeyPress(Sender: TObject; var Key: Char);
begin
     If key = #13 then
     begin
          key := #0;
          Pexanno.Caption := GetCodeName('I300',EdExanno.Text);
     end;
end;

procedure TFpka2060a.RgOrderClick(Sender: TObject);
begin
     LIbutnstatus := 0;
     
     Retrieve;

     if RgOrder.ItemIndex = 0 then SB_Help.Panels[1].Text := ' 사번순으로 재정렬되었습니다.'
     else                          SB_Help.Panels[1].Text := ' 발령기간순 으로 재정렬되었습니다.';
end;

end.

