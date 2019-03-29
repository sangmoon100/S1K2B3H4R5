{header.
-----------------------------------------------------
PROGRAM-NAME    :  PIB1020C(개인별 사진대장)
SYSTEM-NAME     : 종합인사정보
SUBSYSTEM-NAME  : 인사
Programmer      : 전철호
Version         : 1.00
Date            : 1996.08.03
Update contents
  1.00   1996.08.03    전철호  신규프로그램개발 처리명세서
 30.01   2006.07.31    H.E.S   컴버전
-----------------------------------------------------}

unit pib1021c;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Gauges, Mask, ExtCtrls, DB, DBTables,pass,timeftp,datelib,
  codeText, FileCtrl, jpeg, QuickRpt, Func, MemDS, KeyEmpno, keycode,  DeptCode,
  Sockets,Animate,Comobj, DBAccess, Ora, Grids, KeyEmpnoB;

type
  Tpib1021cForm = class(TForm)
    Panel19: TPanel;
    Lempno: TLabel;
    Lsysdate: TLabel;
    Panel11: TPanel;
    Panel2: TPanel;
    Label11: TLabel;
    Panel8: TPanel;
    Panel1: TPanel;
    Label7: TLabel;
    Panel9: TPanel;
    Panel4: TPanel;
    empno1: TMaskEdit;
    empno2: TMaskEdit;
    Panel13: TPanel;
    Panel3: TPanel;
    Gauge1: TGauge;
    Panel10: TPanel;
    Panel5: TPanel;
    Bscreen: TBitBtn;
    Bprint: TBitBtn;
    Bexit: TBitBtn;
    hp: TPanel;
    helpDsr: TLabel;
    helpLabel: TLabel;
    Panel6: TPanel;
    Panel7: TPanel;
    check3: TRadioButton;
    check4: TRadioButton;
    check5: TRadioButton;
    check1: TRadioButton;
    check2: TRadioButton;
    Panel12: TPanel;
    deptcode1: TMaskEdit;
    Label1: TLabel;
    deptcode2: TMaskEdit;
    Panel14: TPanel;
    paycl1: TMaskEdit;
    Label2: TLabel;
    paycl2: TMaskEdit;
    korname1: TPanel;
    korname2: TPanel;
    BB_SaveToFile: TBitBtn;
    Edit1: TEdit;
    QCode: TOraQuery;
    OraQuery1: TOraQuery;
    check6: TRadioButton;
    memo1: TMemo;
    BBExcel: TBitBtn;
    OpenDialog1: TOpenDialog;
    StringGrid1: TStringGrid;
    Panel15: TPanel;
    Panel16: TPanel;
    RB_filename1: TRadioButton;
    RB_filename2: TRadioButton;
    RB_filename3: TRadioButton;
    procedure BexitClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure empno1DblClick(Sender: TObject);
    procedure BscreenClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure check1Click(Sender: TObject);
    procedure deptDblClick(Sender: TObject);
    procedure codeDblClick(Sender: TObject);
    procedure empnoExit(Sender: TObject);
    procedure empnoChange(Sender: TObject);
    procedure BB_SaveToFileClick(Sender: TObject);
    procedure empno1Enter(Sender: TObject);
    procedure BBExcelClick(Sender: TObject);
  private
    { Private declarations }
    EnterKey  : integer;
    Dataempno,FreeCheck : Boolean;
    AReport :  TQuickRep;
    procedure MakeTextFile;
    function  QempDisp(str : string) : string;
    Function CheckEmpno(sEmpno:String) : Boolean;
  public
    { Public declarations }
    start    : string;
    sgubun   : integer;
    FormGu   : integer;
    msel     : Boolean;
    photoReport : TQuickRep;
    function  QCodeDisp(s1,s2 : String) : String;
    procedure ShowPreView;
  end;

var
  pib1021cForm: Tpib1021cForm;
  ErrorHelp : array[0..255] of char;
  HomeDir   : String;
  jpegimage : TJpegImage;
  qq_main : TOraQuery;
implementation

uses pib1022c,pib1023c;
{$R *.DFM}

procedure Tpib1021cForm.MakeTextFile;
var
  str : string;
begin
 codeToText(HomeDir+'\pib1020c.cod','',0);
 with OraQuery1 do
 begin
      close; sql.clear;
      sql.add('select codeid,codeno,codename from pyccode ');
      sql.add('where (codeid = ''I112'' or codeid= ''I113'' ) ');
      sql.add('order by codeid,codeno ');
      open;
      while not eof do begin
         str := '';
         str := FieldByName('codeid').AsString+','+
                FieldByName('codeno').AsString+','+
                FieldByName('codename').AsString;
         codeToText('',str,1);
         next;
      end;
      OraQuery1.close;
 end;
 codeToText('','',2);
end;

function Tpib1021cForm.QCodeDisp(s1,s2 : String) : String;
var
  str : string;
begin
 if trim(s2) <> '' then begin
    if FreeCheck = False then begin
       QCode.Close;
       QCode.Parambyname('lcodeid').AsString  := s1;
       QCode.Parambyname('lcodesub').AsString := s2;
       QCode.Open;
       QCodeDisp := Qcode.FieldByName('CodeName').AsString;
       if trim(Qcode.FieldByName('CodeName').AsString) = '' then QcodeDisp := '('+s2+')';
       Qcode.Close;
    end else begin
       str := TextCodeDisp(s1,s2,HomeDir+'\pib1020c.cod');
       QCodeDisp := str;
       if trim(str) = '' then QcodeDisp := '('+s2+')';
    end;
 end else QCodeDisp := '';
end;

function Tpib1021cForm.QempDisp(str : string) : string;
begin
   result := '';
   if trim(str) = '' then system.exit;
   OraQuery1.Sql.clear;
   OraQuery1.close;
   OraQuery1.Sql.Add('select korname from pimpmas where empno = :lempno ');
   OraQuery1.ParamByName('lempno').AsString := str;
   OraQuery1.Open;
   if   OraQuery1.recordCount > 0 then
        result := OraQuery1.FieldByName('korname').AsString
   else result := '미등록사원';
   OraQuery1.close;
end;

procedure Tpib1021cForm.ShowPreview;
begin
  pib1023cForm := Tpib1023cForm.Create(self);
  Try
    pib1023cForm.ShowModal;
  Finally
    pib1023cForm.Free;
  end;
end;

{..............................폼에 관련된 사항...............................}
procedure Tpib1021cForm.FormActivate(Sender: TObject);
begin
  HomeDir   := HomeDirOpen;

  //photoReport := pib1022cForm.photoReport;
  AReport   := pib1022cForm.photoReport;
end;

procedure Tpib1021cForm.FormCreate(Sender: TObject);
begin
  start := 'on';
end;

procedure Tpib1021cForm.BexitClick(Sender: TObject);
begin
     if MessageBox(handle,'종료하시겠습니까 ?','확 인',MB_YESNO or $0030) = ID_YES then
     begin
        codeToText(HomeDir+'\pib1020c.cod','',3);
        close;
     end;
end;

procedure Tpib1021cForm.FormPaint(Sender: TObject);
var
  CurDate : String;
  i: Integer;
begin
  if Start = 'on' then
  begin
     Start := 'off';
     HelpDsr.Caption := ' 종합인사시스템에 접속중입니다, 잠시만기다리세요...';
     Application.ProcessMessages;

     OraConnect;

     Lempno.Caption   := Pkorname + '(' + Pempno+')';
     Lsysdate.Caption := fn_GetDateStr;
     
     if copy(Pgrade,2,1) > 'C' then
     begin
          MessageBox(handle,'프로그램 사용권한이 없습니다 !!.','알 림',MB_OK or $0030);
          close;
     end;

     DataEmpno := False;
     FreeCheck := DiskSpaceCheck;
     HelpDsr.Caption := '인사코드 데이타를 다운받고 있습니다 !!(잠시만 기다리세요)';
     if FreeCheck = True then MakeTextFile;
     Check1Click(check1);
     Check3.Checked := True;
     RB_filename1.Checked := True;
     empno1.SetFocus;   HelpDsr.Caption := '';
     sgubun := 1;
  end;
end;

{.............................사원번호를 선택할경우...........................}
procedure Tpib1021cForm.empno1DblClick(Sender: TObject);
begin
  Helpdsr.Caption := '사원을 선택 하십시오..';

  {
  FKeyEmpno := TFKeyEmpno.Create(Self);
  try
       if TMaskEdit(Sender).Name = 'empno1' then
            FKeyEmpno.EdEmpno.Text := empno1.Text
       else
            FKeyEmpno.EdEmpno.Text := empno2.Text;
       FKeyEmpno.v_Table_Name := 'pkmpmas';
       FKeyEmpno.ShowModal;

       if FKeyEmpno.CloseChk = -1 then Exit;

       if FKeyEmpno.v_KeyEmpno <> '' then
       begin
           if TMaskEdit(Sender).Name = 'empno1' then
           begin
                empno1.Text      := FKeyempno.v_KeyEmpno;
                korname1.Caption := FKeyEmpno.v_KeyKorname;
           end
           else
           begin
                empno2.Text      := FKeyempno.v_KeyEmpno;
                korname2.Caption := FKeyEmpno.v_KeyKorname;
           end;
       end;
  finally
       FKeyEmpno.Free;
       Helpdsr.Caption := '';
  end;
  }

  //20180701 최성일 추가
  FKeyEmpnoB := TFKeyEmpnoB.Create(self);

  Try

    if TMaskEdit(Sender).Name = 'empno1' then
       FKeyEmpnoB.EdEmpno.Text := empno1.Text
    else
       FKeyEmpnoB.EdEmpno.Text := empno2.Text;

    FKeyEmpnoB.v_EmpGb      := 'A';   // 'M' 임원, 'Y' 파견직, 'Z' 일반직(임원 파견직 제외), 'A' 전체
    FKeyEmpnoB.v_CloseGb    := False; // True 자동닫음, False 닫지않음 - 조회대상건이 1건일때 화면을 자동으로 Close 한다.
    FKeyEmpnoB.BBrun.OnClick(Sender);
    FKeyEmpnoB.ShowModal;

    if FKeyEmpnoB.CloseChk = -1 then Exit;

    if FKeyEmpnoB.v_KeyEmpno <> '' then
    begin
      if TMaskEdit(Sender).Name = 'empno1' then
      begin
          empno1.Text      := FKeyEmpnoB.v_KeyEmpno;
          korname1.Caption := FKeyEmpnoB.v_KeyKorname;
      end
      else
      begin
          empno2.Text      := FKeyEmpnoB.v_KeyEmpno;
          korname2.Caption := FKeyEmpnoB.v_KeyKorname;
      end;
    end;

  Finally
    FKeyEmpnoB.Free;
    Helpdsr.Caption := '';
  end;


end;

{.........................데이타를 화면,프린터로 출력한다......................}
procedure Tpib1021cForm.BscreenClick(Sender: TObject);
begin
 helpDsr.Caption := '자료를 추출합니다..';
 SendMessage(hp.handle,WM_PAINT,0,0);

 helpDsr.Caption := '추출된 자료를 출력합니다..';
 SendMessage(hp.handle,WM_PAINT,0,0);

 if TBitBtn(Sender).Name = 'Bprint' then   //출력이면
 begin
    AReport.Print;
 end
 else  //화면이면
 begin
    AReport.Preview;
    pib1022cForm.Qemp1.Close;
    pib1022cForm.Qdept.Close;
    pib1022cForm.Qphoto.Close;
 end;
 helpDsr.Caption := '작업이 완료되었습니다..';
 Gauge1.Progress := 0;
 Screen.Cursors[crDefault];
end;

procedure Tpib1021cForm.check1Click(Sender: TObject);
begin
  if TRadioButton(Sender).Tag = 1 then begin
     check1.Checked    := True;
     empno1.Enabled    := True;
     empno2.Enabled    := True;
     deptcode1.Enabled := False;
     deptcode2.Enabled := False;
     paycl1.Enabled    := False;
     paycl2.Enabled    := False;
     deptcode1.Text    := '';
     deptcode2.Text    := '';
     paycl1.Text       := '';
     paycl2.Text       := '';
//     Memo1.text        := '';
//     Memo1.Enabled    := False;
  end
  else
  if TRadioButton(Sender).Tag = 2 then
  begin
     check2.Checked    := True;
     empno1.Enabled    := False;
     empno2.Enabled    := False;
     deptcode1.Enabled := True;
     deptcode2.Enabled := True;
     paycl1.Enabled    := True;
     paycl2.Enabled    := True;
     empno1.Text       := '';
     empno2.Text       := '';
     korname1.Caption  := '';
     korname2.Caption  := '';
//     Memo1.text        := '';
//     Memo1.Enabled    := False;
  end
  else
  if TRadioButton(Sender).Tag = 3 then
  begin
     check2.Checked    := False;
     empno1.Enabled    := False;
     empno2.Enabled    := False;
     deptcode1.Enabled := False;
     deptcode2.Enabled := False;
     paycl1.Enabled    := False;
     paycl2.Enabled    := False;
     empno1.Text       := '';
     empno2.Text       := '';
     korname1.Caption  := '';
     korname2.Caption  := '';
     Memo1.text        := '';
     BBExcelClick(sender);
  end;
end;

procedure Tpib1021cForm.deptDblClick(Sender: TObject);
begin
     FDeptCode := TFDeptCode.Create(Self);
     Try
          FDeptCode.ShowModal;
          if FDeptCode.GSdeptcode <> '' then
          begin
               if TMaskEdit(Sender).Name = 'deptcode1' then
                    deptcode1.Text     := FDeptCode.GSdeptcode
               else deptcode2.Text     := FDeptCode.GSdeptcode;
          end;
     Finally
          FDeptCode.Free;
     End;
end;

procedure Tpib1021cForm.codeDblClick(Sender: TObject);
begin
  Fkeycode := TFkeycode.Create(self);
  Try
    case TMaskEdit(Sender).HelpContext of
      0: begin
	  Fkeycode.FormData := 'BAND코드 열람';
	  Fkeycode.DataVal1  := 'I112';
	  end;
    end;
    Fkeycode.ShowModal;
    if Fkeycode.Code = '' then System.Exit;
    case TMaskEdit(Sender).HelpContext of
      0: begin
           if Fkeycode.Code <> '' then
           begin
              if TMaskEdit(Sender).Name = 'paycl1' then
                   paycl1.Text	 := Fkeycode.Code
              else paycl2.Text	 := Fkeycode.Code;
           end;
         end;
    end;

  Finally
    Fkeycode.Free;
  END;
end;

procedure Tpib1021cForm.empnoExit(Sender: TObject);
begin
  if Dataempno = True then begin
     if (TmaskEdit(Sender).tag = 1) then korname1.Caption := QempDisp(TmaskEdit(Sender).Text);
     if (TmaskEdit(Sender).tag = 2) then korname2.Caption := QempDisp(TmaskEdit(Sender).Text);
  end;
  if TmaskEdit(Sender).Name = 'empno1' then begin
     empno2.Text      := empno1.Text;
     korname2.Caption := Korname1.Caption;
  end;
  if TmaskEdit(Sender).Name = 'deptcode1' then deptcode2.Text := deptcode1.Text;
  if TmaskEdit(Sender).Name = 'paycl1'    then paycl2.Text    := paycl1.Text;
  //Dataempno := False;
end;

procedure Tpib1021cForm.empnoChange(Sender: TObject);
begin
  DataEmpno := True;
end;

procedure Tpib1021cForm.BB_SaveToFileClick(Sender: TObject);
var
  Dir, BMPFileName: String;
  i, cnt: Integer;
begin
  Dir := '';
  if not SelectDirectory(Dir, [sdAllowCreate, sdPerformCreate, sdPrompt], 0) then
    System.Exit;
  if Dir[Length(Dir)] <> '\'  then
    Dir := Dir + '\';

  helpDsr.Caption := '자료를 추출합니다..';
  SendMessage(hp.handle,WM_PAINT,0,0);

  OraQuery1.Close;
  OraQuery1.Sql.clear;
  OraQuery1.Sql.Add('select a.empno ');
  OraQuery1.Sql.Add('from pimpmas a ');

  if Check1.Checked = True then
  begin
    OraQuery1.Sql.Add('where (a.empno  >= :lempno1 and a.empno <= :lempno2)');
    if check3.Checked then
      OraQuery1.Sql.Add('  and (a.pstate < ''80'')')
    else if check4.Checked then
      OraQuery1.Sql.Add('  and (a.pstate >= ''80'')');
    OraQuery1.ParamByName('lempno1').AsString := empno1.Text;
    OraQuery1.ParamByName('lempno2').AsString := empno2.Text;
  end
  else
  if Check2.Checked = True then
  begin
    OraQuery1.Sql.Add('where (a.deptcode >= :ldeptcode1 and a.deptcode <= :ldeptcode2)');
    OraQuery1.Sql.Add('  and (a.paycl    >= :lpaycl1    and a.paycl    <= :lpaycl2)   ');
    if check3.Checked then
      OraQuery1.Sql.Add('  and (a.pstate < ''80'')')
    else if check4.Checked then
      OraQuery1.Sql.Add('  and (a.pstate >= ''80'')');
    OraQuery1.ParamByName('ldeptcode1').AsString := deptcode1.Text;
    OraQuery1.ParamByName('ldeptcode2').AsString := deptcode2.Text;
    OraQuery1.ParamByName('lpaycl1').AsString    := paycl1.Text;
    OraQuery1.ParamByName('lpaycl2').AsString    := paycl2.Text;
  end
  else
  if Check6.Checked = True then
  begin
    OraQuery1.Sql.Add('where (a.empno in ('+memo1.Text+'))');
    if check3.Checked then
      OraQuery1.Sql.Add('  and (a.pstate < ''80'')')
    else if check4.Checked then
      OraQuery1.Sql.Add('  and (a.pstate >= ''80'')');
    Edit1.text := OraQuery1.Sql.Text;
  end;
  OraQuery1.Open;
  cnt := OraQuery1.RecordCount;

  helpDsr.Caption := '추출된 자료를 파일로 저장합니다..';
  SendMessage(hp.handle,WM_PAINT,0,0);
  
  OraQuery1.Close;
  OraQuery1.Sql.clear;
  OraQuery1.Sql.Add('select a.empno, a.korname,a.juminid, b.photo ');
  OraQuery1.Sql.Add('from pimpmas a, cimphot b ');

  if Check1.Checked = True then
  begin
    OraQuery1.Sql.Add('where (a.empno  >= :lempno1 and a.empno <= :lempno2)');
    OraQuery1.Sql.Add('  and (a.empno = b.empno)');
    if check3.Checked then
      OraQuery1.Sql.Add('  and (a.pstate < ''80'')')
    else if check4.Checked then
      OraQuery1.Sql.Add('  and (a.pstate >= ''80'')');
    OraQuery1.ParamByName('lempno1').AsString := empno1.Text;
    OraQuery1.ParamByName('lempno2').AsString := empno2.Text;
  end
  else
  if Check2.Checked = True then
  begin
    OraQuery1.Sql.Add('where (a.deptcode >= :ldeptcode1 and a.deptcode <= :ldeptcode2)');
    OraQuery1.Sql.Add('  and (a.paycl    >= :lpaycl1    and a.paycl    <= :lpaycl2)');
    OraQuery1.Sql.Add('  and (a.empno = b.empno)');
    if check3.Checked then
      OraQuery1.Sql.Add('  and (a.pstate < ''80'')')
    else if check4.Checked then
      OraQuery1.Sql.Add('  and (a.pstate >= ''80'')');
    OraQuery1.ParamByName('ldeptcode1').AsString := deptcode1.Text;
    OraQuery1.ParamByName('ldeptcode2').AsString := deptcode2.Text;
    OraQuery1.ParamByName('lpaycl1').AsString    := paycl1.Text;
    OraQuery1.ParamByName('lpaycl2').AsString    := paycl2.Text;
  end
  else
  if Check6.Checked = True then
  begin
    OraQuery1.Sql.Add('where (a.empno in ('+memo1.Text+'))');
    OraQuery1.Sql.Add('  and (a.empno = b.empno)');
    if check3.Checked then
      OraQuery1.Sql.Add('  and (a.pstate < ''80'')')
    else if check4.Checked then
      OraQuery1.Sql.Add('  and (a.pstate >= ''80'')');
    Edit1.text := OraQuery1.Sql.Text;
  end;;
  OraQuery1.Open;

  i := 0;
  while not OraQuery1.eof do
  begin
    inc(i);
    Application.ProcessMessages;
    if  Rb_Filename1.Checked  then
         BMPFileName := Dir + Trim(OraQuery1.FieldByName('empno').AsString) + '.jpg'
    else
    if  Rb_Filename2.Checked  then
         BMPFileName := Dir + Trim(OraQuery1.FieldByName('empno').AsString) + ' ' +
                        Trim(OraQuery1.FieldByName('korname').AsString) + '.jpg'
    else
    if  Rb_Filename3.Checked  then
         BMPFileName := Dir + Trim(copy(OraQuery1.FieldByName('juminid').AsString,8,7)) + '.jpg';

    TGraphicField(OraQuery1.FieldByName('photo')).SaveToFile(BMPFileName);
    if cnt > 0 then
      Gauge1.Progress := (i * 100) div cnt;
    OraQuery1.Next;
  end;
  OraQuery1.Close;

  helpDsr.Caption := '작업이 완료되었습니다..';
  Gauge1.Progress := 0;
  Screen.Cursors[crDefault];
end;

procedure Tpib1021cForm.empno1Enter(Sender: TObject);
begin
if EnterKey <> 0 then empno2.Setfocus;
                       //EnterKey := 1;
                       empno2.Text := empno1.Text;
end;

Function Tpib1021cForm.CheckEmpno(sEmpno:String):Boolean;
Begin
     Try
          qq_main := TOraQuery.Create(pib1021cForm);
          qq_main.Session  := Ora_Session;
          qq_main.FetchAll := True;
          with qq_main do
          begin
               Close;
               SQL.Clear;
               SQL.Add('select count(*) cnt from pimpmas ');
               SQL.Add(' where empno = :p_empno          ');
               ParamByName('p_empno').AsString := sEmpno;
               Open;
               if FieldByName('CNT').AsInteger = 1 then
                    Result:= True
               else
                    Result:= False;

               Close;
          end;
     Except
          Result:= False;
     End;
End;

procedure Tpib1021cForm.BBExcelClick(Sender: TObject);
var
     v           : Variant ;
     iRow, iCol  : integer ;
     CNT, Sg_RCnt, work : integer;
     sEmpno, sImsiEmpno : String;
begin
     Work := 0;
//     Memo1.Visible := False;
     Memo1.Lines.Clear;

     Try
          v := CreateOleObject('Excel.application');
     Except
          ShowMessage('Excel이 설치되어 있어야 합니다.');
          Exit;
     end;

     if OpenDialog1.Execute then
          v.WorkBooks.open(OpenDialog1.FileName)
     else
          Exit;

     cnt := strToint(v.ActiveSheet.UsedRange.Rows.Count);

     begin
          StringGrid1.ColCount := 1;
          StringGrid1.RowCount := cnt;

          for iRow := 1 to cnt do
          begin
               sImsiEmpno := v.cells[iRow, 1];
               if      length(sImsiEmpno) = 1 then sEmpno := '000' + sImsiEmpno
               else if length(sImsiEmpno) = 2 then sEmpno := '00'  + sImsiEmpno
               else if length(sImsiEmpno) = 3 then sEmpno := '0'   + sImsiEmpno
               else if length(sImsiEmpno) = 4 then sEmpno :=         sImsiEmpno
               else
               begin
                  if  length(Memo1.Text) > 4 then
                    Memo1.Text := Copy(Memo1.Text,1,length(Memo1.Text)-4);
                    v.WorkBooks.Close;
                    v.quit ;
                    v := unassigned;
                    Exit;
               end;

               if not CheckEmpno(Uppercase(sEmpno)) then
               begin
                    ShowMessage('인사마스터에 존재하지 않는 사번입니다. [확인요망] : '+sEmpno);
                    Memo1.Lines.Clear;
                    v.WorkBooks.Close;
                    v.quit ;
                    v := unassigned;
                    Exit;
               end
               else
               begin
                    if iRow = 1 then
                         Memo1.Lines.Add('  '''+Trim(sEmpno)+''', ')
                    else if iRow = cnt then
                         Memo1.Lines.Add('  '''+Trim(sEmpno)+'''  ')
                    else
                         Memo1.Lines.Add('  '''+Trim(sEmpno)+''', ');
               end;
          end;
     end;

     v.WorkBooks.Close;
     v.quit ;
     v := unassigned;
     //////////////////////////////////////////////////////////////////////////////

//     FG_ExcelLoad := True; //엑셀파일 지정출력 여부변수 True...
end;

end.
