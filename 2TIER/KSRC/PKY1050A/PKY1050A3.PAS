unit PKY1050A3;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, pebtnedit, ExtCtrls, Grids, DBGrids, KeyEmpno,
  Func, KeyEmpnoY,DeptCode,Formmon1, Db, Comobj;

type
  TFM_Sub2 = class(TForm)
    Phelpmsg: TPanel;
    Panel5: TPanel;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    SaveDialog1: TSaveDialog;
    GroupBox1: TGroupBox;
    Panel7: TPanel;
    MEfrdate: TMaskEdit;
    SBfrdate: TSpeedButton;
    Panel4: TPanel;
    MEfrempno: TMaskEdit;
    SBfrempno: TSpeedButton;
    Label2: TLabel;
    MEtoempno: TMaskEdit;
    SBtoempno: TSpeedButton;
    Panel18: TPanel;
    PEfrorgnum: TPeJeonEdit;
    PEfrdeptcode: TPeJeonEdit;
    SBfrdept: TSpeedButton;
    Pfrdeptname: TPanel;
    Label1: TLabel;
    PEtoorgnum: TPeJeonEdit;
    PEtodeptcode: TPeJeonEdit;
    SBtodept: TSpeedButton;
    Ptodeptname: TPanel;
    Panel3: TPanel;
    GroupBox2: TGroupBox;
    RBscreen: TRadioButton;
    RBprint: TRadioButton;
    RBfile: TRadioButton;
    Panel2: TPanel;
    GroupBox3: TGroupBox;
    RBempno: TRadioButton;
    RBdate: TRadioButton;
    Panel6: TPanel;
    GroupBox4: TGroupBox;
    RBhis: TRadioButton;
    RBsum: TRadioButton;
    BBExcel: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    procedure SBfrdateClick(Sender: TObject);
    procedure SBfrempnoClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SBfrdeptClick(Sender: TObject);
    procedure SBtodeptClick(Sender: TObject);
    procedure PEfrdeptcodeKeyPress(Sender: TObject; var Key: Char);
    procedure PEtodeptcodeKeyPress(Sender: TObject; var Key: Char);
    procedure PEfrdeptcodeExit(Sender: TObject);
    procedure PEtodeptcodeExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BBExcelClick(Sender: TObject);
  private
    { Private declarations }
    start : boolean ;
    SelForm   : TForm;
    procedure CallSaveFile(savekind : String) ;
  public
    { Public declarations }
  end;

var
  FM_Sub2: TFM_Sub2;

implementation

uses PKY1050A0, PKY1050A1, PKY1050A5, PKY1050A6;

{$R *.DFM}

procedure TFM_Sub2.CallSaveFile(savekind : String) ;
var
   i :integer;
   temp : String ;
begin

  if SaveDialog1.Execute then
  begin
       with TStringList.Create do
       try

            if savekind = 'E' then
            begin
                 Add(pchar('초과근무월,사번,성명,부서,BAND,OT시간,야근시간,휴일시간,휴식_초과(분),'+
                   '휴식_근무(분),제외_식사,제외_9이상,수당 ' ) );
                 temp := '초과근무 개인별 집계' ;
            end
            else if savekind ='D' then
            begin
                 Add(pchar('초과근무월, 부서명,인원,근무시간계,근무수당계,인당초과시간,인당초과수당 ' ) );
                 temp := '초과근무 부서별 집계' ;
            end
            else if savekind ='A' then
            begin
                 Add(pchar('사번,성명,시작시간,종료시간,근무내용,휴식_초과(분),휴식_초과수당,'+
                  '휴식_근무(분),휴식_근무수당,제외식사시간,제외식사수당,제외9이상시간,제외9이상수당,'+
                  '연장근로시간,연장근로수당,야간근로시간,야간근로수당,휴일근로시간,휴일근로수당,초과근무수당 ')) ;
                 temp := '초과근무 개인별 상세';
            end
            else if savekind ='R' then
            begin
                 Add(pchar('부서,사번,성명,BAND,통상임금,최초초과수당,대휴수,대휴수당,최종초과수당'));
                 temp := '초과근무 대휴수당 차감';
            end;


            DM.Qry_rpt.First;

            for i := 1 to DM.Qry_rpt.Recordcount do
            begin
                if savekind ='E' then
                     Add(Format('%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s',
                             [
                             DM.Qry_rpt.Fields[0].AsString,
                             DM.Qry_rpt.Fields[1].AsString,
                             DM.Qry_rpt.Fields[2].AsString,
                             DM.Qry_rpt.Fields[3].AsString,
                             DM.Qry_rpt.Fields[4].AsString,
                             DM.Qry_rpt.Fields[5].AsString,
                             DM.Qry_rpt.Fields[6].AsString,
                             DM.Qry_rpt.Fields[7].AsString,
                             DM.Qry_rpt.Fields[8].AsString,
                             DM.Qry_rpt.Fields[9].AsString,
                             DM.Qry_rpt.Fields[10].AsString,
                             DM.Qry_rpt.Fields[11].AsString,
                             DM.Qry_rpt.Fields[12].AsString
                                   ]))
                 else if savekind = 'D' then
                      Add(Format('%s,%s,%s,%s,%s,%s,%s',
                             [
                             DM.Qry_rpt.Fields[0].AsString,
                             DM.Qry_rpt.Fields[1].AsString,
                             DM.Qry_rpt.Fields[2].AsString,
                             DM.Qry_rpt.Fields[3].AsString,
                             DM.Qry_rpt.Fields[4].AsString,
                             DM.Qry_rpt.Fields[5].AsString,
                             DM.Qry_rpt.Fields[6].AsString
                                   ]))
                 else if savekind ='A' then
                      Add(Format('%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s',
                              [
                              DM.Qry_rpt.Fields[0].AsString,
                              DM.Qry_rpt.Fields[1].AsString,
                              DM.Qry_rpt.Fields[2].AsString,
                              DM.Qry_rpt.Fields[3].AsString,
                              DM.Qry_rpt.Fields[4].AsString,
                              DM.Qry_rpt.Fields[5].AsString,
                              DM.Qry_rpt.Fields[6].AsString,
                              DM.Qry_rpt.Fields[7].AsString,
                              DM.Qry_rpt.Fields[8].AsString,
                              DM.Qry_rpt.Fields[9].AsString,
                              DM.Qry_rpt.Fields[10].AsString,
                              DM.Qry_rpt.Fields[11].AsString,
                              DM.Qry_rpt.Fields[12].AsString,
                              DM.Qry_rpt.Fields[13].AsString,
                              DM.Qry_rpt.Fields[14].AsString,
                              DM.Qry_rpt.Fields[15].AsString,
                              DM.Qry_rpt.Fields[16].AsString,
                              DM.Qry_rpt.Fields[17].AsString,
                              DM.Qry_rpt.Fields[18].AsString,
                              DM.Qry_rpt.Fields[19].AsString
                                 ]))
                 else if savekind ='R' then
                      Add(Format('%s,%s,%s,%s,%s,%s,%s,%s,%s',
                              [
                              DM.Qry_rpt.Fields[0].AsString,
                              DM.Qry_rpt.Fields[1].AsString,
                              DM.Qry_rpt.Fields[2].AsString,
                              DM.Qry_rpt.Fields[3].AsString,
                              DM.Qry_rpt.Fields[4].AsString,
                              DM.Qry_rpt.Fields[5].AsString,
                              DM.Qry_rpt.Fields[6].AsString,
                              DM.Qry_rpt.Fields[7].AsString,
                              DM.Qry_rpt.Fields[8].AsString
                                 ])) ;

                 DM.Qry_rpt.Next;
            end; // end of for
            SaveToFile(SaveDialog1.FileName);
            messagebox(handle, pchar(temp+ ' 내역이 저장되었습니다.'),'알림',mb_OK+mb_Iconinformation);
            Phelpmsg.caption := '작업완료..';
       finally
            Free;
       end; // end of try
  end; //end of SaveDialog1.Execute
end;


procedure TFM_Sub2.SBfrdateClick(Sender: TObject);
begin
  Try
       MonthForm := TMonthForm.Create(Application);
       MonthForm.rDayCaption := MEfrDate.Text;
       MonthForm.ShowModal;
       MEfrdate.Text      := MonthForm.DayCaption;
  Finally
       MonthForm.Free;
  End;

end;

procedure TFM_Sub2.SBfrempnoClick(Sender: TObject);
begin
  Try
        FKeyEmpNoY := TFKeyEmpNoY.Create(Self);
        FKeyEmpNoY.ShowModal;

        If FkeyempnoY.Closechk = -1 then Exit;

        if      TComponent(Sender).Tag = 1 then MEfrempno.Text := FkeyempnoY.v_KeyEmpno
        else if TComponent(Sender).Tag = 2 then MEtoempno.Text := FkeyempnoY.v_KeyEmpno;
  Finally
        FKeyEmpNoY.Free;
  end;
end;

procedure TFM_Sub2.BitBtn2Click(Sender: TObject);
var
 sqlstr : String ;
begin
  Phelpmsg.Caption := '';

  if RBhis.Checked then  //이력(건별)
  begin
       sqlstr := Format(
                ' select  empno , korname ,  to_number(frrealtime) frrealtime , to_number(torealtime) torealtime, ovtmdesc,    ' +
                '         restmm, restamt, sprestmm , sprestamt,  ' +
                '         mealhh , mealamt, excephh ,excepamt,    ' +
                '         exthh  , extamt, nighthh , nightamt, holihh , holiamt,   ' +
                '         ovtmamt               ' +
                ' from pkhothis '+
                ' where substr(ovtmdate,1,6) = ''%s''      '+
                '   and empno    between ''%s'' and ''%s'' '+
                '   and orgnum   between ''%s'' and ''%s'' '+
                '   and deptcode between ''%s'' and ''%s'' ',
                [MEfrdate.text, MEfrempno.text, MEtoempno.text,
                 PEfrorgnum.text, PEtoorgnum.text, PEfrdeptcode.text, PEtodeptcode.text])
               +'   and empno    like    ''Y%''            ';

       if RBempno.Checked then
            sqlstr := sqlstr + 'order by empno, ovtmdate '
       else if RBdate.Checked then
            sqlstr := sqlstr + 'order by ovtmdate,empno  ' ;

       DM.Qry_rpt.Close;
       DM.Qry_rpt.Sql.Clear;
       DM.Qry_rpt.Sql.add( sqlstr);
       DM.Qry_rpt.Open;

       QuickReport1.QRdate.Caption :=  '■근무월:'+ copy(MEfrdate.text,1,4)+'년'+ copy(MEfrdate.text,5,2)+'월';

       if (RBscreen.Checked) then
            QuickReport1.preview
       else if (RBprint.Checked) then
            QuickReport1.print
       else if (RBfile.Checked) then
            CallSaveFile('A') ;
  end
  else if RBsum.Checked then  //집계(대휴)
  begin
       sqlstr := Format(
                ' select  deptname, empno , korname ,  codename, tongpay,    ' +
                '         overamt, repoffdd, repoffamt, ovtmamt              ' +
                ' from pkhotsum a, pycdept b, pyccode c      '+
                ' where ovtmyymm   = ''%s''                  '+
                '   and a.empno    between ''%s'' and ''%s'' '+
                '   and a.orgnum   between ''%s'' and ''%s'' '+
                '   and a.deptcode between ''%s'' and ''%s'' '+
                '   and a.orgnum = b.orgnum and a.deptcode = b.deptcode '+
                '   and c.codeid = ''I112'' and a.paycl = c.codeno '
                //'   and repoffamt <> 0 '+  //2015.06 jissi 이 조건에 맞는 데이터가 없어서 조건에서 삭제
               ,[MEfrdate.text, MEfrempno.text, MEtoempno.text,
                 PEfrorgnum.text, PEtoorgnum.text, PEfrdeptcode.text, PEtodeptcode.text])
                +'   and a.empno    like    ''Y%''            '
                +'  order by empno ';

       DM.Qry_rpt.Close;
       DM.Qry_rpt.Sql.Clear;
       DM.Qry_rpt.Sql.add( sqlstr);
       DM.Qry_rpt.Open;

       QuickReport2.QRdate.Caption :=  '■근무월:'+ copy(MEfrdate.text,1,4)+'년'+ copy(MEfrdate.text,5,2)+'월';

       if (RBscreen.Checked) then
            QuickReport2.preview
       else if (RBprint.Checked) then
            QuickReport2.print
       else if (RBfile.Checked) then
            CallSaveFile('R') ;
  end;
end;

procedure TFM_Sub2.FormShow(Sender: TObject);
begin
  Start   := True;
  SelForm := nil;
  if Start then Start := not Start;
  MEfrdate.text :=  copy(FM_Main.GSsysdate,1,6) ;

  MEfrempno.text := 'Y000' ;
  MEtoempno.text := 'YZZZ' ;

//Dsa2000  2003.10.13.   조직차수 하드코딩 해제...
{  PEfrorgnum.text := 'H06' ;
  PEtoorgnum.text := 'H06' ;  }

  DM.Query1.Close;
  DM.Query1.Sql.Clear;
  DM.Query1.Sql.Add (' SELECT VALUE1 FROM PIMVARI ');
  DM.Query1.Sql.Add (' WHERE GUBUN=''00'' AND SGUBUN=''0001'' ');
  DM.Query1.Open;

  PEfrorgnum.text := DM.Query1.FieldByName('Value1').AsString;
  PEtoorgnum.text := DM.Query1.FieldByName('Value1').AsString;
//Dsa2000  End..................................................................

  PEfrdeptcode.text := '00000' ; //'AAAAA';
  PEtodeptcode.text := 'ZZZZZ' ;
  Phelpmsg.caption := '  초과집계후 해당월의 부서별/개인별 초과근무 내역을 추출합니다';
end;

procedure TFM_Sub2.SBfrdeptClick(Sender: TObject);
begin
//2015.06 jissi dper 접속오류
{
  Fdept2lib := TFdept2lib.Create(Self);
  Try
       Fdept2lib.Eorgnum.Text := PEfrorgnum.Text;
       Fdept2lib.Edeptcode.Text := PEfrdeptcode.Text;
       Fdept2lib.ShowModal;
       If Fdept2lib.GIcloseChk = -1 then Exit;
       PEfrdeptcode.text := Fdept2lib.GSdeptcode;
       if Fdept2lib.GSdeptname = '' then
            Pfrdeptname.caption := '** 부서 코드 **'
       else
            Pfrdeptname.caption := Fdept2lib.GSdeptname;
       PEfrorgnum.Text := Fdept2lib.Eorgnum.Text;
  Finally
       Fdept2lib.Free;
  end;
}

  FDeptCode := TFDeptCode.Create(Self);
  Try
       FDeptCode.EdOrgnum.Text   := PEfrorgnum.Text;
       if PEfrdeptcode.Text <> '00000' then
            FDeptCode.EdDeptcode.Text := PEfrdeptcode.Text;
       FDeptCode.ShowModal;
       If FDeptCode.CloseChk = -1 then Exit;
       PEfrdeptcode.text := FDeptCode.GSdeptcode;
       if FDeptCode.GSdeptname = '' then
            Pfrdeptname.caption := '** 부서 코드 **'
       else
            Pfrdeptname.caption := FDeptCode.GSdeptname;
       PEfrorgnum.Text := FDeptCode.EdOrgnum.Text;
  Finally
       FDeptCode.Free;
  end;
end;

procedure TFM_Sub2.SBtodeptClick(Sender: TObject);
begin
//2015.06 jissi dper 접속오류
{
  Fdept2lib := TFdept2lib.Create(Self);
  Try
       Fdept2lib.Eorgnum.Text := PEtoorgnum.Text;
       Fdept2lib.Edeptcode.Text := PEtodeptcode.Text;
       Fdept2lib.ShowModal;
       If Fdept2lib.GIcloseChk = -1 then Exit;
       PEtodeptcode.text := Fdept2lib.GSdeptcode;
       if Fdept2lib.GSdeptname = '' then
            Ptodeptname.caption := '** 부서 코드 **'
       else
            Ptodeptname.caption := Fdept2lib.GSdeptname;
       PEtoorgnum.Text := Fdept2lib.Eorgnum.Text;
  Finally
       Fdept2lib.Free;
  end;
}
  FDeptCode := TFDeptCode.Create(Self);
  Try
       FDeptCode.EdOrgnum.Text   := PEtoorgnum.Text;
       if PEtodeptcode.Text <> 'ZZZZZ' then
            FDeptCode.EdDeptcode.Text := PEtodeptcode.Text;
       FDeptCode.ShowModal;
       If FDeptCode.CloseChk = -1 then Exit;
       PEtodeptcode.text := FDeptCode.GSdeptcode;
       if FDeptCode.GSdeptname = '' then
            Ptodeptname.caption := '** 부서 코드 **'
       else
            Ptodeptname.caption := FDeptCode.GSdeptname;
       PEtoorgnum.Text := FDeptCode.EdOrgnum.Text;
  Finally
       FDeptCode.Free;
  end;
end;

procedure TFM_Sub2.PEfrdeptcodeKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 then
  begin
       key := #0;
       with DM.Query1 do
       begin
            Close;
            SQL.Clear;
            SQL.ADD('   SELECT DEPTCODE, DEPTNAME FROM PYCDEPT ');
            SQL.ADD('  WHERE ORGNUM = '''+PEfrorgnum.Text+''' ');            SQL.ADD('    AND (DEPTCODE LIKE '''+PEfrdeptcode.Text+'%''  ');            SQL.ADD('     OR DEPTNAME LIKE ''%'+PEfrdeptcode.Text+'%'')  ');
            Open;

            If RecordCount < 1 then
                 Pfrdeptname.caption := '** 부서 코드 **'
            else If RecordCount = 1 then
            begin
                 PEfrdeptcode.Text := FieldByName('deptcode').AsString;
                 Pfrdeptname.caption := FieldByName('deptname').AsString;
            end
            else If RecordCount > 1 then
            begin
                 //2015.06 jissi dper 접속오류
                 {
                 Fdept2lib := TFdept2lib.Create(Self);
                 Try
                      Fdept2lib.Eorgnum.Text := PEfrorgnum.Text;
                      Fdept2lib.Edeptcode.Text := PEfrdeptcode.Text;
                      Fdept2lib.ShowModal;
                      If Fdept2lib.GIcloseChk = -1 then Exit;
                      PEfrorgnum.Text := Fdept2lib.Eorgnum.Text;
                      PEfrdeptcode.text := Fdept2lib.GSdeptcode;
                      Pfrdeptname.caption := Fdept2lib.GSdeptname;
                      if Fdept2lib.GSdeptname = '' then
                      Pfrdeptname.caption := '** 부서 코드 **';
                 Finally
                      Fdept2lib.Free;
                 end;  // try end
                 }
                 FDeptCode := TFDeptCode.Create(Self);
                 Try
                      FDeptCode.Edorgnum.Text := PEfrorgnum.Text;
                      FDeptCode.Eddeptcode.Text := PEfrdeptcode.Text;
                      FDeptCode.ShowModal;
                      If FDeptCode.closeChk = -1 then Exit;
                      PEfrorgnum.Text := FDeptCode.Edorgnum.Text;
                      PEfrdeptcode.text := FDeptCode.GSdeptcode;
                      Pfrdeptname.caption := FDeptCode.GSdeptname;
                      if FDeptCode.GSdeptname = '' then
                      Pfrdeptname.caption := '** 부서 코드 **';
                 Finally
                      FDeptCode.Free;
                 end;  // try end
            end; //if end
       end; //with dm.queyr1 end
  end; //key = #13 if end
end;

procedure TFM_Sub2.PEtodeptcodeKeyPress(Sender: TObject; var Key: Char);
begin
  If Key = #13 then
  begin
       key := #0;
       with DM.Query1 do
       begin
            Close;
            SQL.Clear;
            SQL.ADD('   SELECT DEPTCODE, DEPTNAME FROM PYCDEPT ');
            SQL.ADD('  WHERE ORGNUM = '''+PEtoorgnum.Text+''' ');            SQL.ADD('    AND (DEPTCODE LIKE '''+PEtodeptcode.Text+'%''  ');            SQL.ADD('     OR DEPTNAME LIKE ''%'+PEtodeptcode.Text+'%'')  ');
            Open;

            If RecordCount < 1 then
               Ptodeptname.caption := '** 부서 코드 **'
            else If RecordCount = 1 then
            begin
               PEtodeptcode.Text := FieldByName('deptcode').AsString;
               Ptodeptname.caption := FieldByName('deptname').AsString;
            end
            else If RecordCount > 1 then
            begin
                 //2015.06 jissi dper 접속오류
                 {
                 Fdept2lib := TFdept2lib.Create(Self);
                 Try
                      Fdept2lib.Eorgnum.Text := PEtoorgnum.Text;
                      Fdept2lib.Edeptcode.Text := PEtodeptcode.Text;
                      Fdept2lib.ShowModal;
                      If Fdept2lib.GIcloseChk = -1 then Exit;
                      PEtodeptcode.text := Fdept2lib.GSdeptcode;
                      Ptodeptname.caption := Fdept2lib.GSdeptname;
                      PEtoorgnum.Text := Fdept2lib.Eorgnum.Text;
                      if Fdept2lib.GSdeptname = '' then
                      Ptodeptname.caption := '** 부서 코드 **';
                 Finally
                      Fdept2lib.Free;
                 end;  // try end
                 }
                 FDeptCode := TFDeptCode.Create(Self);
                 Try
                      FDeptCode.Edorgnum.Text := PEtoorgnum.Text;
                      FDeptCode.Eddeptcode.Text := PEtodeptcode.Text;
                      FDeptCode.ShowModal;
                      If FDeptCode.closeChk = -1 then Exit;
                      PEtodeptcode.text := FDeptCode.GSdeptcode;
                      Ptodeptname.caption := FDeptCode.GSdeptname;
                      PEtoorgnum.Text := FDeptCode.Edorgnum.Text;
                      if FDeptCode.GSdeptname = '' then
                      Ptodeptname.caption := '** 부서 코드 **';
                 Finally
                      FDeptCode.Free;
                 end;  // try end
            end; //if end
       end;  //with dm.queyr1 end
  end;   //key = #13 if end
end;

procedure TFM_Sub2.PEfrdeptcodeExit(Sender: TObject);
begin
  with DM.Query1 do
  begin
       Close;
       SQL.Clear;
       SQL.ADD('   SELECT DEPTCODE, DEPTNAME FROM PYCDEPT ');
       SQL.ADD('  WHERE ORGNUM = '''+PEfrorgnum.Text+''' ');       SQL.ADD('    AND (DEPTCODE LIKE '''+PEfrdeptcode.Text+'%''  ');       SQL.ADD('     OR DEPTNAME LIKE ''%'+PEfrdeptcode.Text+'%'')  ');
       Open;

       If RecordCount < 1 then
            Pfrdeptname.caption := '** 부서 코드 **'
       else If RecordCount = 1 then
       begin
            PEfrdeptcode.Text := FieldByName('deptcode').AsString;
            Pfrdeptname.caption := FieldByName('deptname').AsString;
       end
       else If RecordCount > 1 then
       begin
            //2015.06 jissi dper 접속오류
            {
            Fdept2lib := TFdept2lib.Create(Self);
            Try
                 Fdept2lib.Eorgnum.Text := PEfrorgnum.Text;
                 Fdept2lib.Edeptcode.Text := PEfrdeptcode.Text;
                 Fdept2lib.ShowModal;
                 If Fdept2lib.GIcloseChk = -1 then Exit;
                 PEfrorgnum.Text := Fdept2lib.Eorgnum.Text;
                 PEfrdeptcode.text := Fdept2lib.GSdeptcode;
                 Pfrdeptname.caption := Fdept2lib.GSdeptname;
                 if Fdept2lib.GSdeptname = '' then
                 Pfrdeptname.caption := '** 부서 코드 **';
            Finally
                 Fdept2lib.Free;
            end;  // try end
            }
            FDeptCode := TFDeptCode.Create(Self);
            Try
                 FDeptCode.Edorgnum.Text := PEfrorgnum.Text;
                 FDeptCode.Eddeptcode.Text := PEfrdeptcode.Text;
                 FDeptCode.ShowModal;
                 If FDeptCode.closeChk = -1 then Exit;
                 PEfrorgnum.Text := FDeptCode.Edorgnum.Text;
                 PEfrdeptcode.text := FDeptCode.GSdeptcode;
                 Pfrdeptname.caption := FDeptCode.GSdeptname;
                 if FDeptCode.GSdeptname = '' then
                 Pfrdeptname.caption := '** 부서 코드 **';
            Finally
                 FDeptCode.Free;
            end;  // try end
       end; //if end
  end; //with dm.queyr1 end
end;

procedure TFM_Sub2.PEtodeptcodeExit(Sender: TObject);
begin
  with DM.Query1 do
  begin
       Close;
       SQL.Clear;
       SQL.ADD(' SELECT DEPTCODE, DEPTNAME FROM PYCDEPT            ');
       SQL.ADD('  WHERE ORGNUM = '''+PEtoorgnum.Text+'''           ');       SQL.ADD('    AND (DEPTCODE LIKE '''+PEtodeptcode.Text+'%''  ');       SQL.ADD('     OR DEPTNAME LIKE ''%'+PEtodeptcode.Text+'%'') ');
       Open;

       If RecordCount < 1 then
            Ptodeptname.caption := '** 부서 코드 **'
       else If RecordCount = 1 then
       begin
            PEtodeptcode.Text := FieldByName('deptcode').AsString;
            Ptodeptname.caption := FieldByName('deptname').AsString;
       end
       else If RecordCount > 1 then
       begin
            //2015.06 jissi dper 접속오류
            {
            Fdept2lib := TFdept2lib.Create(Self);
            Try
                 Fdept2lib.Eorgnum.Text := PEtoorgnum.Text;
                 Fdept2lib.Edeptcode.Text := PEtodeptcode.Text;
                 Fdept2lib.ShowModal;
                 If Fdept2lib.GIcloseChk = -1 then Exit;
                 PEtodeptcode.text := Fdept2lib.GSdeptcode;
                 Ptodeptname.caption := Fdept2lib.GSdeptname;
                 PEtoorgnum.Text := Fdept2lib.Eorgnum.Text;
                 if Fdept2lib.GSdeptname = '' then
                 Ptodeptname.caption := '** 부서 코드 **';
            Finally
                 Fdept2lib.Free;
            end;  // try end
            }
            FDeptCode := TFDeptCode.Create(Self);
            Try
                 FDeptCode.Edorgnum.Text := PEtoorgnum.Text;
                 FDeptCode.Eddeptcode.Text := PEtodeptcode.Text;
                 FDeptCode.ShowModal;
                 If FDeptCode.closeChk = -1 then Exit;
                 PEtodeptcode.text := FDeptCode.GSdeptcode;
                 Ptodeptname.caption := FDeptCode.GSdeptname;
                 PEtoorgnum.Text := FDeptCode.Edorgnum.Text;
                 if FDeptCode.GSdeptname = '' then
                 Ptodeptname.caption := '** 부서 코드 **';
            Finally
                 FDeptCode.Free;
            end;  // try end
       end; //if end
  end;  //with dm.queyr1 end
end;

procedure TFM_Sub2.BitBtn1Click(Sender: TObject);
begin
  DM.Qry_rpt.Close ;
  DM.Qry_rpt.Sql.Clear ;
  DM.Qry_rpt.Sql.Add (' select a.ovtmyymm , a.empno , a.korname , deptname , codename ,   ');
  DM.Qry_rpt.Sql.Add ('        exthh,                                                     ');
  DM.Qry_rpt.Sql.Add ('        nighthh,                                                   ');
  DM.Qry_rpt.Sql.Add ('        holihh ,                                                   ');
  DM.Qry_rpt.Sql.Add ('        nvl(e.restmm,0) restmm,                                    ');
  DM.Qry_rpt.Sql.Add ('        nvl(e.sprestmm,0) sprestmm ,                               ');
  DM.Qry_rpt.Sql.Add ('        nvl(e.mealhh,0) mealhh,                                    ');
  DM.Qry_rpt.Sql.Add ('        nvl(e.excephh,0) excephh,                                  ');
  DM.Qry_rpt.Sql.Add ('        a.ovtmamt                                                  ');
  DM.Qry_rpt.Sql.Add ('   from pkhotsum a, pkmpmas m, pycdept d, pyccode c,               ');
  DM.Qry_rpt.Sql.Add ('        (select empno,                                             ');
  DM.Qry_rpt.Sql.Add ('                sum(restmm ) restmm,                               ');
  DM.Qry_rpt.Sql.Add ('                sum(sprestmm) sprestmm,                            ');
  DM.Qry_rpt.Sql.Add ('                sum(mealhh) mealhh,                                ');
  DM.Qry_rpt.Sql.Add ('                sum(excephh) excephh                               ');
  DM.Qry_rpt.Sql.Add ('           from pkhothis                                           ');
  DM.Qry_rpt.Sql.Add ('          where substr(ovtmdate,1,6) = :ovtmyymm                   ');
  DM.Qry_rpt.Sql.Add ('          group by empno                                           ');
  DM.Qry_rpt.Sql.Add ('        ) e                                                        ');
  DM.Qry_rpt.Sql.Add ('  where a.empno between :frempno and :toempno                      ');
  DM.Qry_rpt.Sql.Add ('    and a.orgnum between :frorgnum and :toorgnum                   ');
  DM.Qry_rpt.Sql.Add ('    and a.deptcode between :frdeptcode and :todeptcode             ');
  DM.Qry_rpt.Sql.Add ('    and a.empno = e.empno(+)                                       ');
  DM.Qry_rpt.Sql.Add ('    and a.empno = m.empno                                          ');
  DM.Qry_rpt.Sql.Add ('    and a.empno like ''Y%''                                        ');
  DM.Qry_rpt.Sql.Add ('    and a.ovtmamt <> 0                                             ');
  DM.Qry_rpt.Sql.Add ('    and m.payyn =''Y''                                             ');
  DM.Qry_rpt.Sql.Add ('    and a.orgnum = d.orgnum                                        ');
  DM.Qry_rpt.Sql.Add ('    and a.deptcode = d.deptcode                                    ');
  DM.Qry_rpt.Sql.Add ('    and ovtmyymm = :ovtmyymm                                       ');
  DM.Qry_rpt.Sql.Add ('    and c.codeid =''I112''                                         ');
  DM.Qry_rpt.Sql.Add ('    and c.codeno = a.paycl                                         ');
  DM.Qry_rpt.Sql.Add ('  order by a.empno                                                 ');
  DM.Qry_rpt.Parambyname('frempno').Asstring := MEfrempno.text;
  DM.Qry_rpt.Parambyname('toempno').Asstring := MEtoempno.text;
  DM.Qry_rpt.Parambyname('frorgnum').Asstring := PEfrorgnum.text;
  DM.Qry_rpt.Parambyname('toorgnum').Asstring := PEtoorgnum.text;
  DM.Qry_rpt.Parambyname('frdeptcode').Asstring := PEfrdeptcode.text;
  DM.Qry_rpt.Parambyname('todeptcode').Asstring := PEtodeptcode.text;
  DM.Qry_rpt.Parambyname('ovtmyymm').Asstring := MEfrdate.text;

  DM.Qry_rpt.Open ;

  if DM.Qry_rpt.RecordCount = 0 then
  begin
       MessageDlg('해당되는 데이터가 없습니다.'+ #13 +
                  '확인 후 다시입력하십시요.',mtInformation,[mbOK],0);
       Screen.Cursor := crDefault;
       exit;
  end;

  CallSaveFile('E');
end;

procedure TFM_Sub2.BitBtn3Click(Sender: TObject);
begin
  DM.Qry_rpt.Close ;
  DM.Qry_rpt.Sql.Clear ;
  DM.Qry_rpt.Sql.Add ('select ovtmyymm ,                                                                 ');
  DM.Qry_rpt.Sql.Add ('       부서명,                                                                    ');
  DM.Qry_rpt.Sql.Add ('       인원,                                                                      ');
  DM.Qry_rpt.Sql.Add ('       근무시간계,                                                                ');
  DM.Qry_rpt.Sql.Add ('       근무수당계,                                                                ');
  DM.Qry_rpt.Sql.Add ('       인당초과시간,                                                              ');
  DM.Qry_rpt.Sql.Add ('       인당초과수당                                                               ');
  DM.Qry_rpt.Sql.Add ('  from (                                                                          ');
  DM.Qry_rpt.Sql.Add ('        SELECT a.ovtmyymm,                                                        ');
  DM.Qry_rpt.Sql.Add ('               NVL(DEPTNAME,''  '') 부서명,                                       ');
  DM.Qry_rpt.Sql.Add ('               COUNT(*) 인원,                                                     ');
  DM.Qry_rpt.Sql.Add ('        	      SUM(a.OVERHH-EXCEPHH-MEALHH-RESTHH-SPRESTHH) 근무시간계,           ');
  DM.Qry_rpt.Sql.Add ('        	      SUM(a.OVTMAMT) 근무수당계,                                         ');
  DM.Qry_rpt.Sql.Add ('        	      CEIL(AVG(a.OVERHH-EXCEPHH-MEALHH-RESTHH-SPRESTHH))  인당초과시간,  ');
  DM.Qry_rpt.Sql.Add ('        	      CEIL(AVG(a.OVTMAMT)) 인당초과수당                                  ');
  DM.Qry_rpt.Sql.Add ('          FROM PYCDEPT B, PKHOTSUM A, pkmpmas m,                                  ');
  DM.Qry_rpt.Sql.Add ('               (                                                                  ');
  DM.Qry_rpt.Sql.Add ('                SELECT EMPNO,                                                     ');
  DM.Qry_rpt.Sql.Add ('                       SUM(EXCEPHH) EXCEPHH,                                      ');
  DM.Qry_rpt.Sql.Add ('                       SUM(MEALHH) MEALHH,                                        ');
  DM.Qry_rpt.Sql.Add ('                       SUM(FLOOR(RESTMM/60)) RESTHH,                              ');
  DM.Qry_rpt.Sql.Add ('                       SUM(FLOOR(SPRESTMM/60)) SPRESTHH                           ');
  DM.Qry_rpt.Sql.Add ('                  FROM PKHOTHIS                                                   ');
  DM.Qry_rpt.Sql.Add ('                 WHERE SUBSTR(OVTMDATE,1,6) = :ovtmyymm                           ');
  DM.Qry_rpt.Sql.Add ('                 GROUP BY EMPNO                                                   ');
  DM.Qry_rpt.Sql.Add ('               ) H                                                                ');
  DM.Qry_rpt.Sql.Add ('         WHERE a.empno between :frempno and :toempno                              ');
  DM.Qry_rpt.Sql.Add ('           and a.orgnum between :frorgnum and :toorgnum                           ');
  DM.Qry_rpt.Sql.Add ('           and a.deptcode between :frdeptcode and :todeptcode                     ');
  DM.Qry_rpt.Sql.Add ('           and A.ORGNUM = B.ORGNUM(+)                                             ');
  DM.Qry_rpt.Sql.Add ('           and A.DEPTCODE = B.DEPTCODE(+)                                         ');
  DM.Qry_rpt.Sql.Add ('           and a.empno = m.empno                                                  ');
  DM.Qry_rpt.Sql.Add ('           and a.empno like ''Y%''                                                ');
  DM.Qry_rpt.Sql.Add ('           and a.OVTMAMT <> 0                                                     ');
  DM.Qry_rpt.Sql.Add ('           and a.empno = h.empno(+)                                               ');
  DM.Qry_rpt.Sql.Add ('           and m.payyn =''Y''                                                     ');
  DM.Qry_rpt.Sql.Add ('           and OVTMYYMM = :ovtmyymm                                               ');
  DM.Qry_rpt.Sql.Add ('         GROUP BY a.ovtmyymm,   DEPTNAME                                          ');
  DM.Qry_rpt.Sql.Add ('       )                                                                          ');
  DM.Qry_rpt.Sql.Add (' order by 인당초과수당 desc                                                       ');

  DM.Qry_rpt.Parambyname('frempno').Asstring := MEfrempno.text;
  DM.Qry_rpt.Parambyname('toempno').Asstring := MEtoempno.text;
  DM.Qry_rpt.Parambyname('frorgnum').Asstring := PEfrorgnum.text;
  DM.Qry_rpt.Parambyname('toorgnum').Asstring := PEtoorgnum.text;
  DM.Qry_rpt.Parambyname('frdeptcode').Asstring := PEfrdeptcode.text;
  DM.Qry_rpt.Parambyname('todeptcode').Asstring := PEtodeptcode.text;
  DM.Qry_rpt.Parambyname('ovtmyymm').Asstring := MEfrdate.text;

  DM.Qry_rpt.Open ;

  if DM.Qry_rpt.RecordCount = 0 then
  begin
       MessageDlg('해당되는 데이터가 없습니다.'+ #13 +
                  '확인 후 다시입력하십시요.',mtInformation,[mbOK],0);
       Screen.Cursor := crDefault;
       exit;
  end;

  CallSaveFile('D');
end;

procedure TFM_Sub2.BBExcelClick(Sender: TObject);
var XL, XArr: Variant;
    i,j,k,Cap_empno: integer;
    SavePlace: TBookmark;
begin
  Phelpmsg.Caption :=' 엑셀 변환할 자료를 검색중입니다.';
  if  (TComponent(Sender).Tag = 1) then
  begin
       with DM.Qry_rpt do
       begin
            close;
            Sql.Clear;
            Sql.Add (' select a.ovtmyymm         초과근무월,                             ');
            Sql.Add ('        a.empno    사번,   a.korname    성명,                      ');
            Sql.Add ('        deptname   부서,   codename    "BAND",                     ');
            Sql.Add ('        exthh             "OT시간",                                ');
            Sql.Add ('        nighthh            야근시간,                               ');
            Sql.Add ('        holihh             휴일시간,                               ');
            Sql.Add ('        nvl(e.restmm,0)   "휴식_초과(분)",                         ');
            Sql.Add ('        nvl(e.sprestmm,0) "휴식_근무(분)" ,                        ');
            Sql.Add ('        nvl(e.mealhh,0)   "제외_식사",                             ');
            Sql.Add ('        nvl(e.excephh,0)  "제외_9이상",                            ');
            Sql.Add ('        a.ovtmamt          초과수당                                ');
            Sql.Add ('   from pkhotsum a, pkmpmas m, pycdept d, pyccode c,               ');
            Sql.Add ('        (select empno,                                             ');
            Sql.Add ('                sum(restmm ) restmm,                               ');
            Sql.Add ('                sum(sprestmm) sprestmm,                            ');
            Sql.Add ('                sum(mealhh) mealhh,                                ');
            Sql.Add ('                sum(excephh) excephh                               ');
            Sql.Add ('           from pkhothis                                           ');
            Sql.Add ('          where substr(ovtmdate,1,6) = :ovtmyymm                   ');
            Sql.Add ('          group by empno                                           ');
            Sql.Add ('        ) e                                                        ');
            Sql.Add ('  where a.empno between :frempno and :toempno                      ');
            Sql.Add ('    and a.empno like ''Y%''                                        ');
            Sql.Add ('    and a.orgnum between :frorgnum and :toorgnum                   ');
            Sql.Add ('    and a.deptcode between :frdeptcode and :todeptcode             ');
            Sql.Add ('    and a.empno = e.empno(+)                                       ');
            Sql.Add ('    and a.empno = m.empno                                          ');
            Sql.Add ('    and a.ovtmamt <> 0                                             ');
            Sql.Add ('    and m.payyn =''Y''                                             ');
            Sql.Add ('    and a.orgnum = d.orgnum                                        ');
            Sql.Add ('    and a.deptcode = d.deptcode                                    ');
            Sql.Add ('    and ovtmyymm = :ovtmyymm                                       ');
            Sql.Add ('    and c.codeid =''I112''                                         ');
            Sql.Add ('    and c.codeno = a.paycl                                         ');
            Sql.Add ('  order by a.empno                                                 ');
            Parambyname('frempno').Asstring    := MEfrempno.text;
            Parambyname('toempno').Asstring    := MEtoempno.text;
            Parambyname('frorgnum').Asstring   := PEfrorgnum.text;
            Parambyname('toorgnum').Asstring   := PEtoorgnum.text;
            Parambyname('frdeptcode').Asstring := PEfrdeptcode.text;
            Parambyname('todeptcode').Asstring := PEtodeptcode.text;
            Parambyname('ovtmyymm').Asstring   := MEfrdate.text;

            Open ;
       end;
  end
  else if  (TComponent(Sender).Tag = 2) then
  begin
       with DM.Qry_rpt do
       begin
            close;
            Sql.Clear;
            Close ;
            Sql.Clear ;
            Sql.Add ('select ovtmyymm 초과근무월,                                                       ');
            Sql.Add ('       부서명,                                                                    ');
            Sql.Add ('       인원,                                                                      ');
            Sql.Add ('       근무시간계,                                                                ');
            Sql.Add ('       근무수당계,                                                                ');
            Sql.Add ('       인당초과시간,                                                              ');
            Sql.Add ('       인당초과수당                                                               ');
            Sql.Add ('  from (                                                                          ');
            Sql.Add ('        SELECT a.ovtmyymm,                                                        ');
            Sql.Add ('               NVL(DEPTNAME,''  '') 부서명,                                       ');
            Sql.Add ('               COUNT(*) 인원,                                                     ');
            Sql.Add ('        	     SUM(a.OVERHH-EXCEPHH-MEALHH-RESTHH-SPRESTHH) 근무시간계,           ');
            Sql.Add ('        	     SUM(a.OVTMAMT) 근무수당계,                                         ');
            Sql.Add ('        	     CEIL(AVG(a.OVERHH-EXCEPHH-MEALHH-RESTHH-SPRESTHH))  인당초과시간,  ');
            Sql.Add ('        	     CEIL(AVG(a.OVTMAMT)) 인당초과수당                                  ');
            Sql.Add ('          FROM PYCDEPT B, PKHOTSUM A, pkmpmas m,                                  ');
            Sql.Add ('               (                                                                  ');
            Sql.Add ('                SELECT EMPNO,                                                     ');
            Sql.Add ('                       SUM(EXCEPHH) EXCEPHH,                                      ');
            Sql.Add ('                       SUM(MEALHH) MEALHH,                                        ');
            Sql.Add ('                       SUM(FLOOR(RESTMM/60)) RESTHH,                              ');
            Sql.Add ('                       SUM(FLOOR(SPRESTMM/60)) SPRESTHH                           ');
            Sql.Add ('                  FROM PKHOTHIS                                                   ');
            Sql.Add ('                 WHERE SUBSTR(OVTMDATE,1,6) = :ovtmyymm                           ');
            Sql.Add ('                 GROUP BY EMPNO                                                   ');
            Sql.Add ('               ) H                                                                ');
            Sql.Add ('         WHERE a.empno between :frempno and :toempno                              ');
            Sql.Add ('           and a.empno like ''Y%''                                                ');
            Sql.Add ('           and a.orgnum between :frorgnum and :toorgnum                           ');
            Sql.Add ('           and a.deptcode between :frdeptcode and :todeptcode                     ');
            Sql.Add ('           and A.ORGNUM = B.ORGNUM(+)                                             ');
            Sql.Add ('           and A.DEPTCODE = B.DEPTCODE(+)                                         ');
            Sql.Add ('           and a.empno = m.empno                                                  ');
            Sql.Add ('           and a.OVTMAMT <> 0                                                     ');
            Sql.Add ('           and a.empno = h.empno(+)                                               ');
            Sql.Add ('           and m.payyn =''Y''                                                     ');
            Sql.Add ('           and OVTMYYMM = :ovtmyymm                                               ');
            Sql.Add ('         GROUP BY a.ovtmyymm,   DEPTNAME                                          ');
            Sql.Add ('       )                                                                          ');
            Sql.Add (' order by 인당초과수당 desc                                                       ');

            Parambyname('frempno').Asstring    := MEfrempno.text;
            Parambyname('toempno').Asstring    := MEtoempno.text;
            Parambyname('frorgnum').Asstring   := PEfrorgnum.text;
            Parambyname('toorgnum').Asstring   := PEtoorgnum.text;
            Parambyname('frdeptcode').Asstring := PEfrdeptcode.text;
            Parambyname('todeptcode').Asstring := PEtodeptcode.text;
            Parambyname('ovtmyymm').Asstring   := MEfrdate.text;

            Open ;
       end;
  end
  else if  (TComponent(Sender).Tag = 3) then
  begin
       with DM.Qry_rpt do
       begin
            Close ;
            Sql.Clear ;
            Sql.Add ('select OVTMDATE  근무일자,   EMPNO  사번,   KORNAME  성명,   PAYCL  BAND코드,   PAYRA  직책코드,               ');
            Sql.Add ('       (SELECT CODEFNAME FROM PYCCODE WHERE CODENO = a.payra AND CODEID =''I113'')     직책,                   ');
            Sql.Add ('       ORGNUM                조직차수,               DEPTCODE                          부서코드,               ');
            Sql.Add ('       (Select Deptname From Pycdept Where Orgnum = a.Orgnum And Deptcode =a.Deptcode) 부서명,                 ');
            Sql.Add ('       OVTMDESC              근무내역,                                                                         ');
            Sql.Add ('       FRREALTIME            실제개시시간,           TOREALTIME                        실제종료시간,           ');
            Sql.Add ('       EAI_DATE              연계수신일시,           WORKTYPE                          근무타입,               ');
            Sql.Add ('       NIGHTHH               야간근로시간,           HOLIHH                            휴일근로시간,           ');
            Sql.Add ('       GENEXT                일반연장시간,           HOLIEXT                           휴일연장시간,           ');
            Sql.Add ('       MEALHH                식사제외시간,           EXCEPHH                           제외9시간,              ');
            Sql.Add ('       restmm               "초과휴식(분)",          sprestmm                         "근무휴식(분)",          ');
            Sql.Add ('       OVTMAMT               초과근무수당,                                                                     ');
            Sql.Add ('       NIGHTHH*0.5          "야간근로시간*0.5",      HOLIHH*1.5                       "휴일근무시간*1.5",      ');
            Sql.Add ('       GENEXT*1.5           "일반연장시간*1.5",      HOLIEXT*0.5                      "휴일연장시간*0.5",      ');
            Sql.Add ('       MEALHH*1.5           "제외식사시간*1.5",      EXCEPHH*1.5                      "제외9이상시간*1.5",     ');
            Sql.Add ('       floor(restmm/60)*1.5 "초과휴식(시간)*1.5",    floor(sprestmm/60)               "근무휴식(시간)",        ');
            Sql.Add ('       nvl((select tongpay from Pkhotsum  where OVTMYYMM = substr(a.OVTMDATE,1,6) and empno = a.empno),        ');
            Sql.Add ('        HPER.COMMONUTIL.GET_NEWTONGPAY(empno,(select yearpaynum from pkcpbas)))        통상임금,               ');
            Sql.Add ('       NIGHTHH*0.5 + HOLIHH*1.5 + GENEXT*1.5 + HOLIEXT*0.5                            "지급시간계",            ');
            Sql.Add ('       MEALHH*1.5  + EXCEPHH*1.5 + floor(restmm/60)*1.5 + floor(sprestmm/60)          "제외시간계",            ');
            Sql.Add ('       NIGHTHH*0.5 + HOLIHH*1.5 + GENEXT*1.5 + HOLIEXT*0.5 -                                                   ');
            Sql.Add ('       (MEALHH*1.5  + EXCEPHH*1.5 + floor(restmm/60)*1.5 + floor(sprestmm/60))        "실지급시간계",          ');
            Sql.Add ('       (NIGHTHH*0.5 + HOLIHH*1.5 + GENEXT*1.5 + HOLIEXT*0.5 -                                                  ');
            Sql.Add ('       (MEALHH*1.5  + EXCEPHH*1.5 + floor(restmm/60)*1.5 + floor(sprestmm/60)))*                               ');
            Sql.Add ('        nvl((select tongpay from Pkhotsum  where OVTMYYMM = substr(a.OVTMDATE,1,6) and empno = a.empno),       ');
            Sql.Add ('        HPER.COMMONUTIL.GET_NEWTONGPAY(empno,(select yearpaynum from pkcpbas)))        시간계산값,             ');
            Sql.Add ('       OVTMAMT                                                                         시스템값,               ');
            Sql.Add ('       (NIGHTHH*0.5 + HOLIHH*1.5 + GENEXT*1.5 + HOLIEXT*0.5 -                                                  ');
            Sql.Add ('       (MEALHH*1.5  + EXCEPHH*1.5 + floor(restmm/60)*1.5 + floor(sprestmm/60)))*                               ');
            Sql.Add ('        nvl((select tongpay from Pkhotsum  where OVTMYYMM = substr(a.OVTMDATE,1,6) and empno = a.empno),       ');
            Sql.Add ('        HPER.COMMONUTIL.GET_NEWTONGPAY(empno,(select yearpaynum from pkcpbas)))                                ');
            Sql.Add ('       - OVTMAMT                                                                       차액,                   ');
            Sql.Add ('       (SELECT CODEFNAME FROM PYCCODE WHERE CODENO = a.paycl AND CODEID =''I112'')     BAND                    ');
            Sql.Add ('  from pkhothis a                                                                                              ');
            Sql.Add (' WHERE a.empno between :frempno and :toempno                                                                   ');
            Sql.Add ('   and a.empno    like ''Y%''                                                                                  ');
            Sql.Add ('   and a.orgnum   between :frorgnum   and :toorgnum                                                            ');
            Sql.Add ('   and a.deptcode between :frdeptcode and :todeptcode                                                          ');
            Sql.Add ('   and a.OVTMDATE like    :ovtmyymm||''%''                                                                     ');
            Sql.Add (' order by a.paycl, a.empno, a.OVTMDATE                                                                         ');

            Parambyname('frempno').Asstring    := MEfrempno.text;
            Parambyname('toempno').Asstring    := MEtoempno.text;
            Parambyname('frorgnum').Asstring   := PEfrorgnum.text;
            Parambyname('toorgnum').Asstring   := PEtoorgnum.text;
            Parambyname('frdeptcode').Asstring := PEfrdeptcode.text;
            Parambyname('todeptcode').Asstring := PEtodeptcode.text;
            Parambyname('ovtmyymm').Asstring   := MEfrdate.text;

            Open ;
       end;
  end;

  if DM.Qry_rpt.RecordCount < 1 then
  begin
       Phelpmsg.Caption :='';
       showmessage('엑셀 변환할 자료가 없습니다.');
       exit;
  end;
  Phelpmsg.Caption := 'Excel이 설치되어 있는지 검색하고 있습니다.';

  XArr := VarArrayCreate([1, DM.Qry_rpt.Fields.Count], VarVariant); //Gird 출력시
  try
      XL := CreateOLEObject('Excel.Application');
  except
      MessageDlg('Excel이 설치되어 있지 않습니다.', MtWarning, [mbok], 0);
      Phelpmsg.Caption := '';
      Exit;
  end;

  Phelpmsg.Caption := '자료를 변환하고 있습니다.';
  XL.WorkBooks.Add; //새로운 페이지 생성
  XL.Visible := false;
  if  (TComponent(Sender).Tag = 1) then
      XL.WorkSheets[1].Name := '초과근무 개인별 집계'
  else if  (TComponent(Sender).Tag = 2) then
      XL.WorkSheets[1].Name := '초과근무 부서별 집계'
  else if  (TComponent(Sender).Tag = 3) then
      XL.WorkSheets[1].Name := '초과근무수당 검증자료'; //시트명 부여
  //TITLE NAME 설정
  //XL.Range['A1'].value := '';
  //XL.Range['A1'].font.Size := 16;

  //컬럼명 지정_서브타이블 지정
  for i := 1 to DM.Qry_rpt.Fields.Count do
  begin
       if DM.Qry_rpt.Fields[i-1].FullName = '사번' then Cap_empno := i;
       XArr[i]  := DM.Qry_rpt.Fields[i-1].FullName;
  end;

  if DM.Qry_rpt.Fields.Count >= 235 then      //IA ~
  begin
       XL.Range['A1' , CHR(73) + CHR(64 + DM.Qry_rpt.Fields.Count-234)+'1'].Value := XArr;  //Gird 출력시
  end
  else if DM.Qry_rpt.Fields.Count >= 209 then      //HA ~
  begin
       XL.Range['A1' , CHR(72) + CHR(64 + DM.Qry_rpt.Fields.Count-208)+'1'].Value := XArr;  //Gird 출력시
  end
  else if DM.Qry_rpt.Fields.Count >= 183 then      //GA ~
  begin
       XL.Range['A1' , CHR(71) + CHR(64 + DM.Qry_rpt.Fields.Count-182)+'1'].Value := XArr;  //Gird 출력시
  end
  else if DM.Qry_rpt.Fields.Count >= 157 then      //FA ~
  begin
       XL.Range['A1' , CHR(70) + CHR(64 + DM.Qry_rpt.Fields.Count-156)+'1'].Value := XArr;  //Gird 출력시
  end
  else if DM.Qry_rpt.Fields.Count >= 131 then      //EA ~
  begin
       XL.Range['A1' , CHR(69) + CHR(64 + DM.Qry_rpt.Fields.Count-130)+'1'].Value := XArr;  //Gird 출력시
  end
  else if DM.Qry_rpt.Fields.Count >= 105 then      //DA ~
  begin
       XL.Range['A1' , CHR(68) + CHR(64 + DM.Qry_rpt.Fields.Count-104)+'1'].Value := XArr;  //Gird 출력시
  end
  else if DM.Qry_rpt.Fields.Count >= 79 then  //CA ~
  begin
       XL.Range['A1' , CHR(67) + CHR(64 + DM.Qry_rpt.Fields.Count-78)+'1'].Value := XArr;  //Gird 출력시
  end
  else if DM.Qry_rpt.Fields.Count >= 53 then  //BA ~
  begin
       XL.Range['A1' , CHR(66) + CHR(64 + DM.Qry_rpt.Fields.Count-52)+'1'].Value := XArr;  //Gird 출력시
  end
  else if DM.Qry_rpt.Fields.Count >= 27 then  //AA ~
  begin
       XL.Range['A1' , CHR(65) + CHR(64 + DM.Qry_rpt.Fields.Count-26)+'1'].Value := XArr;  //Gird 출력시
  end
  else                                       //A  ~
  begin
       XL.Range['A1' , CHR(64 + DM.Qry_rpt.Fields.Count)+'1'].Value := XArr;  //Gird 출력시
  end;


  k := 1;
  for i := 1 to DM.Qry_rpt.Fields.Count do     //Gird 출력시
  begin
       if i >= 235 then      //IA ~
       begin
            XL.Range[CHR(73) + CHR(64 + i-234) + '1'].HorizontalAlignment := 3;
            XL.Range[CHR(73) + CHR(64 + i-234) + '1'].Interior.Color      := $00CBF0B3;
            XL.Range[CHR(73) + CHR(64 + i-234) + '1'].font.Size           := 10;
            XL.Range[CHR(73) + CHR(64 + i-234) + '1'].font.Bold           := True;
       end
       else if i >= 209 then      //HA ~
       begin
            XL.Range[CHR(72) + CHR(64 + i-208) + '1'].HorizontalAlignment := 3;
            XL.Range[CHR(72) + CHR(64 + i-208) + '1'].Interior.Color      := $00CBF0B3;
            XL.Range[CHR(72) + CHR(64 + i-208) + '1'].font.Size           := 10;
            XL.Range[CHR(72) + CHR(64 + i-208) + '1'].font.Bold           := True;
       end
       else if i >= 183 then      //GA ~
       begin
            XL.Range[CHR(71) + CHR(64 + i-182) + '1'].HorizontalAlignment := 3;
            XL.Range[CHR(71) + CHR(64 + i-182) + '1'].Interior.Color      := $00CBF0B3;
            XL.Range[CHR(71) + CHR(64 + i-182) + '1'].font.Size           := 10;
            XL.Range[CHR(71) + CHR(64 + i-182) + '1'].font.Bold           := True;
       end
       else if i >= 157 then      //FA ~
       begin
            XL.Range[CHR(70) + CHR(64 + i-156) + '1'].HorizontalAlignment := 3;
            XL.Range[CHR(70) + CHR(64 + i-156) + '1'].Interior.Color      := $00CBF0B3;
            XL.Range[CHR(70) + CHR(64 + i-156) + '1'].font.Size           := 10;
            XL.Range[CHR(70) + CHR(64 + i-156) + '1'].font.Bold           := True;
       end
       else if i >= 131 then      //EA ~
       begin
            XL.Range[CHR(69) + CHR(64 + i-130) + '1'].HorizontalAlignment := 3;
            XL.Range[CHR(69) + CHR(64 + i-130) + '1'].Interior.Color      := $00CBF0B3;
            XL.Range[CHR(69) + CHR(64 + i-130) + '1'].font.Size           := 10;
            XL.Range[CHR(69) + CHR(64 + i-130) + '1'].font.Bold           := True;
       end
       else if i >= 105 then      //DA ~
       begin
            XL.Range[CHR(68) + CHR(64 + i-104) + '1'].HorizontalAlignment := 3;
            XL.Range[CHR(68) + CHR(64 + i-104) + '1'].Interior.Color      := $00CBF0B3;
            XL.Range[CHR(68) + CHR(64 + i-104) + '1'].font.Size           := 10;
            XL.Range[CHR(68) + CHR(64 + i-104) + '1'].font.Bold           := True;
       end
       else if i >= 79 then  //CA ~
       begin //Showmessage(CHR(65) + CHR(64 + i-26) + '3');
            XL.Range[CHR(67) + CHR(64 + i-78) + '1'].HorizontalAlignment := 3;
            XL.Range[CHR(67) + CHR(64 + i-78) + '1'].Interior.Color      := $00CBF0B3;
            XL.Range[CHR(67) + CHR(64 + i-78) + '1'].font.Size           := 10;
            XL.Range[CHR(67) + CHR(64 + i-78) + '1'].font.Bold           := True;
       end
       else if i >= 53 then  //BA ~
       begin
            XL.Range[CHR(66) + CHR(64 + i-52) + '1'].HorizontalAlignment := 3;
            XL.Range[CHR(66) + CHR(64 + i-52) + '1'].Interior.Color      := $00CBF0B3;
            XL.Range[CHR(66) + CHR(64 + i-52) + '1'].font.Size           := 10;
            XL.Range[CHR(66) + CHR(64 + i-52) + '1'].font.Bold           := True;
       end
       else if i >= 27 then  //AA ~
       begin //Showmessage(CHR(65) + CHR(64 + i-26) + '3');
            XL.Range[CHR(65) + CHR(64 + i-26) + '1'].HorizontalAlignment := 3;
            XL.Range[CHR(65) + CHR(64 + i-26) + '1'].Interior.Color      := $00CBF0B3;
            XL.Range[CHR(65) + CHR(64 + i-26) + '1'].font.Size           := 10;
            XL.Range[CHR(65) + CHR(64 + i-26) + '1'].font.Bold           := True;
       end
       else
       begin                 //A  ~
            XL.Range[CHR(64 + i)              + '1'].HorizontalAlignment := 3;
            XL.Range[CHR(64 + i)              + '1'].Interior.Color      := $00CBF0B3;
            XL.Range[CHR(64 + i)              + '1'].font.Size           := 10;
            XL.Range[CHR(64 + i)              + '1'].font.Bold           := True;
       end;
  end;

  //검색된 자료를 excel에 export처리 시킨다.
  SavePlace := DM.Qry_rpt.GetBookmark;
  DM.Qry_rpt.DisableControls;
  DM.Qry_rpt.First;

  for i := 1 to  DM.Qry_rpt.RecordCount do
  begin
       for j := 1 to DM.Qry_rpt.Fields.Count do
       begin
            if  (j  = Cap_empno) then   //사원번호 칼럼에 ' 문자 넣어주기 위해.
                 XArr[j]  := ''''+DM.Qry_rpt.Fields[j-1].AsString
            else XArr[j]  := DM.Qry_rpt.Fields[j-1].AsString;
       end;
       if DM.Qry_rpt.Fields.Count >= 235 then      //IA ~
       begin
            XL.Range['A' + IntToStr(k+1), CHR(73) + CHR(64 + DM.Qry_rpt.Fields.Count-234)+ IntToStr(k+1)].Value := XArr;
       end
       else if DM.Qry_rpt.Fields.Count >= 209 then      //HA ~
       begin
            XL.Range['A' + IntToStr(k+1), CHR(72) + CHR(64 + DM.Qry_rpt.Fields.Count-208)+ IntToStr(k+1)].Value := XArr;
       end
       else if DM.Qry_rpt.Fields.Count >= 183 then      //GA ~
       begin
            XL.Range['A' + IntToStr(k+1), CHR(71) + CHR(64 + DM.Qry_rpt.Fields.Count-182)+ IntToStr(k+1)].Value := XArr;
       end
       else if DM.Qry_rpt.Fields.Count >= 157 then       //FA ~
       begin
            XL.Range['A' + IntToStr(k+1), CHR(70) + CHR(64 + DM.Qry_rpt.Fields.Count-156)+ IntToStr(k+1)].Value := XArr;
       end
       else if DM.Qry_rpt.Fields.Count >= 131 then  //EA ~
       begin
            XL.Range['A' + IntToStr(k+1), CHR(69) + CHR(64 + DM.Qry_rpt.Fields.Count-130)+ IntToStr(k+1)].Value := XArr;
       end
       else if DM.Qry_rpt.Fields.Count >= 105 then  //DA ~
       begin
            XL.Range['A' + IntToStr(k+1), CHR(68) + CHR(64 + DM.Qry_rpt.Fields.Count-104)+ IntToStr(k+1)].Value := XArr;
       end
       else if DM.Qry_rpt.Fields.Count >= 79 then   //CA ~
       begin
            XL.Range['A' + IntToStr(k+1), CHR(67) + CHR(64 + DM.Qry_rpt.Fields.Count-78)+ IntToStr(k+1)].Value := XArr;
       end
       else if DM.Qry_rpt.Fields.Count >= 53 then   //BA ~
       begin
            XL.Range['A' + IntToStr(k+1), CHR(66) + CHR(64 + DM.Qry_rpt.Fields.Count-52)+ IntToStr(k+1)].Value := XArr;
       end
       else if DM.Qry_rpt.Fields.Count >= 27 then   //AA ~
       begin
            XL.Range['A' + IntToStr(k+1), CHR(65) + CHR(64 + DM.Qry_rpt.Fields.Count-26)+ IntToStr(k+1)].Value := XArr;
       end
       else
       begin                 //A  ~
            XL.Range['A' + IntToStr(k+1), CHR(64 + DM.Qry_rpt.Fields.Count) + IntToStr(k+1)].Value := XArr;
       end;

       //XL.Range['A' + IntToStr(k+1), CHR(64 + i) + IntToStr(k+1)].Value := XArr;
       inc(k);
       DM.Qry_rpt.Next;
  end;

  if DM.Qry_rpt.Fields.Count >= 235 then       //IA ~
  begin
       //여기서 부터는 EXPORT된 EXCEL자료를 예쁘게 꾸미는 부분입니다.
       XL.Range['A1', CHR(73) + CHR(64 + DM.Qry_rpt.Fields.Count-234) + IntToStr(k)].Borders.LineStyle := 1;    //테두리선을 만든다.  1은 실선
       XL.Range['A1', CHR(73) + CHR(64 + DM.Qry_rpt.Fields.Count-234) + IntToStr(k)].Borders.Weight := 2;       //테두리선 두깨 설정  2는 보통두깨, 3은 무지 두꺼움
       XL.Range['A1', CHR(73) + CHR(64 + DM.Qry_rpt.Fields.Count-234) + IntToStr(k)].Borders.ColorIndex := 1;   //테두리선 색상설정  1은 검은색
       XL.Range['A1', CHR(73) + CHR(64 + DM.Qry_rpt.Fields.Count-234) + IntToStr(k)].font.name := '굴림체';
       XL.Range['A1', 'A1'].HorizontalAlignment := 3;               //가운데 정렬
       XL.Range['A2', CHR(73) + CHR(64 + DM.Qry_rpt.Fields.Count-234) + IntToStr(k)].font.Size := 9;
       XL.Range['A2', CHR(73) + CHR(64 + DM.Qry_rpt.Fields.Count-234) + IntToStr(k)].HorizontalAlignment := 1;  //우측정렬
       XL.Range['A1', CHR(73) + CHR(64 + DM.Qry_rpt.Fields.Count-234) + IntToStr(k)].Select;                    //자료를 모두 SELECT한 후 --하는 이유:  AutoFit 처리하기 위해서임
  end
  else if DM.Qry_rpt.Fields.Count >= 209 then       //HA ~
  begin
       //여기서 부터는 EXPORT된 EXCEL자료를 예쁘게 꾸미는 부분입니다.
       XL.Range['A1', CHR(72) + CHR(64 + DM.Qry_rpt.Fields.Count-208) + IntToStr(k)].Borders.LineStyle := 1;    //테두리선을 만든다.  1은 실선
       XL.Range['A1', CHR(72) + CHR(64 + DM.Qry_rpt.Fields.Count-208) + IntToStr(k)].Borders.Weight := 2;       //테두리선 두깨 설정  2는 보통두깨, 3은 무지 두꺼움
       XL.Range['A1', CHR(72) + CHR(64 + DM.Qry_rpt.Fields.Count-208) + IntToStr(k)].Borders.ColorIndex := 1;   //테두리선 색상설정  1은 검은색
       XL.Range['A1', CHR(72) + CHR(64 + DM.Qry_rpt.Fields.Count-208) + IntToStr(k)].font.name := '굴림체';
       XL.Range['A1', 'A1'].HorizontalAlignment := 3;               //가운데 정렬
       XL.Range['A2', CHR(72) + CHR(64 + DM.Qry_rpt.Fields.Count-208) + IntToStr(k)].font.Size := 9;
       XL.Range['A2', CHR(72) + CHR(64 + DM.Qry_rpt.Fields.Count-208) + IntToStr(k)].HorizontalAlignment := 1;  //우측정렬
       XL.Range['A1', CHR(72) + CHR(64 + DM.Qry_rpt.Fields.Count-208) + IntToStr(k)].Select;                    //자료를 모두 SELECT한 후 --하는 이유:  AutoFit 처리하기 위해서임
  end
  else if DM.Qry_rpt.Fields.Count >= 183 then       //GA ~
  begin
       //여기서 부터는 EXPORT된 EXCEL자료를 예쁘게 꾸미는 부분입니다.
       XL.Range['A1', CHR(71) + CHR(64 + DM.Qry_rpt.Fields.Count-182) + IntToStr(k)].Borders.LineStyle := 1;    //테두리선을 만든다.  1은 실선
       XL.Range['A1', CHR(71) + CHR(64 + DM.Qry_rpt.Fields.Count-182) + IntToStr(k)].Borders.Weight := 2;       //테두리선 두깨 설정  2는 보통두깨, 3은 무지 두꺼움
       XL.Range['A1', CHR(71) + CHR(64 + DM.Qry_rpt.Fields.Count-182) + IntToStr(k)].Borders.ColorIndex := 1;   //테두리선 색상설정  1은 검은색
       XL.Range['A1', CHR(71) + CHR(64 + DM.Qry_rpt.Fields.Count-182) + IntToStr(k)].font.name := '굴림체';
       XL.Range['A1', 'A1'].HorizontalAlignment := 3;               //가운데 정렬
       XL.Range['A2', CHR(71) + CHR(64 + DM.Qry_rpt.Fields.Count-182) + IntToStr(k)].font.Size := 9;
       XL.Range['A2', CHR(71) + CHR(64 + DM.Qry_rpt.Fields.Count-182) + IntToStr(k)].HorizontalAlignment := 1;  //우측정렬
       XL.Range['A1', CHR(71) + CHR(64 + DM.Qry_rpt.Fields.Count-182) + IntToStr(k)].Select;                    //자료를 모두 SELECT한 후 --하는 이유:  AutoFit 처리하기 위해서임
  end
  else if DM.Qry_rpt.Fields.Count >= 157 then       //FA ~
  begin
       //여기서 부터는 EXPORT된 EXCEL자료를 예쁘게 꾸미는 부분입니다.
       XL.Range['A1', CHR(70) + CHR(64 + DM.Qry_rpt.Fields.Count-156) + IntToStr(k)].Borders.LineStyle := 1;    //테두리선을 만든다.  1은 실선
       XL.Range['A1', CHR(70) + CHR(64 + DM.Qry_rpt.Fields.Count-156) + IntToStr(k)].Borders.Weight := 2;       //테두리선 두깨 설정  2는 보통두깨, 3은 무지 두꺼움
       XL.Range['A1', CHR(70) + CHR(64 + DM.Qry_rpt.Fields.Count-156) + IntToStr(k)].Borders.ColorIndex := 1;   //테두리선 색상설정  1은 검은색
       XL.Range['A1', CHR(70) + CHR(64 + DM.Qry_rpt.Fields.Count-156) + IntToStr(k)].font.name := '굴림체';
       XL.Range['A1', 'A1'].HorizontalAlignment := 3;               //가운데 정렬
       XL.Range['A2', CHR(70) + CHR(64 + DM.Qry_rpt.Fields.Count-156) + IntToStr(k)].font.Size := 9;
       XL.Range['A2', CHR(70) + CHR(64 + DM.Qry_rpt.Fields.Count-156) + IntToStr(k)].HorizontalAlignment := 1;  //우측정렬
       XL.Range['A1', CHR(70) + CHR(64 + DM.Qry_rpt.Fields.Count-156) + IntToStr(k)].Select;                    //자료를 모두 SELECT한 후 --하는 이유:  AutoFit 처리하기 위해서임
  end
  else if DM.Qry_rpt.Fields.Count >= 131 then       //EA ~
  begin
       //여기서 부터는 EXPORT된 EXCEL자료를 예쁘게 꾸미는 부분입니다.
       XL.Range['A1', CHR(69) + CHR(64 + DM.Qry_rpt.Fields.Count-130) + IntToStr(k)].Borders.LineStyle := 1;    //테두리선을 만든다.  1은 실선
       XL.Range['A1', CHR(69) + CHR(64 + DM.Qry_rpt.Fields.Count-130) + IntToStr(k)].Borders.Weight := 2;       //테두리선 두깨 설정  2는 보통두깨, 3은 무지 두꺼움
       XL.Range['A1', CHR(69) + CHR(64 + DM.Qry_rpt.Fields.Count-130) + IntToStr(k)].Borders.ColorIndex := 1;   //테두리선 색상설정  1은 검은색
       XL.Range['A1', CHR(69) + CHR(64 + DM.Qry_rpt.Fields.Count-130) + IntToStr(k)].font.name := '굴림체';
       XL.Range['A1', 'A1'].HorizontalAlignment := 3;               //가운데 정렬
       XL.Range['A2', CHR(69) + CHR(64 + DM.Qry_rpt.Fields.Count-130) + IntToStr(k)].font.Size := 9;
       XL.Range['A2', CHR(69) + CHR(64 + DM.Qry_rpt.Fields.Count-130) + IntToStr(k)].HorizontalAlignment := 1;  //우측정렬
       XL.Range['A1', CHR(69) + CHR(64 + DM.Qry_rpt.Fields.Count-130) + IntToStr(k)].Select;                    //자료를 모두 SELECT한 후 --하는 이유:  AutoFit 처리하기 위해서임
  end
  else if DM.Qry_rpt.Fields.Count >= 105 then       //DA ~
  begin
       //여기서 부터는 EXPORT된 EXCEL자료를 예쁘게 꾸미는 부분입니다.
       XL.Range['A1', CHR(68) + CHR(64 + DM.Qry_rpt.Fields.Count-104) + IntToStr(k)].Borders.LineStyle := 1;    //테두리선을 만든다.  1은 실선
       XL.Range['A1', CHR(68) + CHR(64 + DM.Qry_rpt.Fields.Count-104) + IntToStr(k)].Borders.Weight := 2;       //테두리선 두깨 설정  2는 보통두깨, 3은 무지 두꺼움
       XL.Range['A1', CHR(68) + CHR(64 + DM.Qry_rpt.Fields.Count-104) + IntToStr(k)].Borders.ColorIndex := 1;   //테두리선 색상설정  1은 검은색
       XL.Range['A1', CHR(68) + CHR(64 + DM.Qry_rpt.Fields.Count-104) + IntToStr(k)].font.name := '굴림체';
       XL.Range['A1', 'A1'].HorizontalAlignment := 3;               //가운데 정렬
       XL.Range['A2', CHR(68) + CHR(64 + DM.Qry_rpt.Fields.Count-104) + IntToStr(k)].font.Size := 9;
       XL.Range['A2', CHR(68) + CHR(64 + DM.Qry_rpt.Fields.Count-104) + IntToStr(k)].HorizontalAlignment := 1;  //우측정렬
       XL.Range['A1', CHR(68) + CHR(64 + DM.Qry_rpt.Fields.Count-104) + IntToStr(k)].Select;                    //자료를 모두 SELECT한 후 --하는 이유:  AutoFit 처리하기 위해서임
  end
  else if DM.Qry_rpt.Fields.Count >= 79 then  //CA~
  begin
       //여기서 부터는 EXPORT된 EXCEL자료를 예쁘게 꾸미는 부분입니다.
       XL.Range['A1', CHR(67) + CHR(64 + DM.Qry_rpt.Fields.Count-78) + IntToStr(k)].Borders.LineStyle := 1;    //테두리선을 만든다.  1은 실선
       XL.Range['A1', CHR(67) + CHR(64 + DM.Qry_rpt.Fields.Count-78) + IntToStr(k)].Borders.Weight := 2;       //테두리선 두깨 설정  2는 보통두깨, 3은 무지 두꺼움
       XL.Range['A1', CHR(67) + CHR(64 + DM.Qry_rpt.Fields.Count-78) + IntToStr(k)].Borders.ColorIndex := 1;   //테두리선 색상설정  1은 검은색
       XL.Range['A1', CHR(67) + CHR(64 + DM.Qry_rpt.Fields.Count-78) + IntToStr(k)].font.name := '굴림체';
       XL.Range['A1', 'A1'].HorizontalAlignment := 3;               //가운데 정렬
       XL.Range['A2', CHR(67) + CHR(64 + DM.Qry_rpt.Fields.Count-78) + IntToStr(k)].font.Size := 9;
       XL.Range['A2', CHR(67) + CHR(64 + DM.Qry_rpt.Fields.Count-78) + IntToStr(k)].HorizontalAlignment := 1;  //우측정렬
       XL.Range['A1', CHR(67) + CHR(64 + DM.Qry_rpt.Fields.Count-78) + IntToStr(k)].Select;
  end
  else if DM.Qry_rpt.Fields.Count >= 53 then  //BA ~
  begin
       //여기서 부터는 EXPORT된 EXCEL자료를 예쁘게 꾸미는 부분입니다.
       XL.Range['A1', CHR(66) + CHR(64 + DM.Qry_rpt.Fields.Count-52) + IntToStr(k)].Borders.LineStyle := 1;    //테두리선을 만든다.  1은 실선
       XL.Range['A1', CHR(66) + CHR(64 + DM.Qry_rpt.Fields.Count-52) + IntToStr(k)].Borders.Weight := 2;       //테두리선 두깨 설정  2는 보통두깨, 3은 무지 두꺼움
       XL.Range['A1', CHR(66) + CHR(64 + DM.Qry_rpt.Fields.Count-52) + IntToStr(k)].Borders.ColorIndex := 1;   //테두리선 색상설정  1은 검은색
       XL.Range['A1', CHR(66) + CHR(64 + DM.Qry_rpt.Fields.Count-52) + IntToStr(k)].font.name := '굴림체';
       XL.Range['A1', 'A1'].HorizontalAlignment := 3;               //가운데 정렬
       XL.Range['A2', CHR(66) + CHR(64 + DM.Qry_rpt.Fields.Count-52) + IntToStr(k)].font.Size := 9;
       XL.Range['A2', CHR(66) + CHR(64 + DM.Qry_rpt.Fields.Count-52) + IntToStr(k)].HorizontalAlignment := 1;  //우측정렬
       XL.Range['A1', CHR(66) + CHR(64 + DM.Qry_rpt.Fields.Count-52) + IntToStr(k)].Select;                    //자료를 모두 SELECT한 후 --하는 이유:  AutoFit 처리하기 위해서임
  end
  else if DM.Qry_rpt.Fields.Count >= 27 then  //AA ~
  begin
       //여기서 부터는 EXPORT된 EXCEL자료를 예쁘게 꾸미는 부분입니다.
       XL.Range['A1', CHR(65) + CHR(64 + DM.Qry_rpt.Fields.Count-26) + IntToStr(k)].Borders.LineStyle := 1;    //테두리선을 만든다.  1은 실선
       XL.Range['A1', CHR(65) + CHR(64 + DM.Qry_rpt.Fields.Count-26) + IntToStr(k)].Borders.Weight := 2;       //테두리선 두깨 설정  2는 보통두깨, 3은 무지 두꺼움
       XL.Range['A1', CHR(65) + CHR(64 + DM.Qry_rpt.Fields.Count-26) + IntToStr(k)].Borders.ColorIndex := 1;   //테두리선 색상설정  1은 검은색
       XL.Range['A1', CHR(65) + CHR(64 + DM.Qry_rpt.Fields.Count-26) + IntToStr(k)].font.name := '굴림체';
       XL.Range['A1', 'A1'].HorizontalAlignment := 3;               //가운데 정렬
       XL.Range['A2', CHR(65) + CHR(64 + DM.Qry_rpt.Fields.Count-26) + IntToStr(k)].font.Size := 9;
       XL.Range['A2', CHR(65) + CHR(64 + DM.Qry_rpt.Fields.Count-26) + IntToStr(k)].HorizontalAlignment := 1;  //우측정렬
       XL.Range['A1', CHR(65) + CHR(64 + DM.Qry_rpt.Fields.Count-26) + IntToStr(k)].Select;
  end
  else                                       //A  ~
  begin
       //여기서 부터는 EXPORT된 EXCEL자료를 예쁘게 꾸미는 부분입니다.
       XL.Range['A1', CHR(64 + DM.Qry_rpt.Fields.Count) + IntToStr(k)].Borders.LineStyle := 1;    //테두리선을 만든다.  1은 실선
       XL.Range['A1', CHR(64 + DM.Qry_rpt.Fields.Count) + IntToStr(k)].Borders.Weight := 2;       //테두리선 두깨 설정  2는 보통두깨, 3은 무지 두꺼움
       XL.Range['A1', CHR(64 + DM.Qry_rpt.Fields.Count) + IntToStr(k)].Borders.ColorIndex := 1;   //테두리선 색상설정  1은 검은색
       XL.Range['A1', CHR(64 + DM.Qry_rpt.Fields.Count) + IntToStr(k)].font.name := '굴림체';
       XL.Range['A1', 'A1'].HorizontalAlignment := 3;               //가운데 정렬
       XL.Range['A2', CHR(64 + DM.Qry_rpt.Fields.Count) + IntToStr(k)].font.Size := 9;
       XL.Range['A2', CHR(64 + DM.Qry_rpt.Fields.Count) + IntToStr(k)].HorizontalAlignment := 1;  //우측정렬
       XL.Range['A1', CHR(64 + DM.Qry_rpt.Fields.Count) + IntToStr(k)].Select;
  end;
  XL.Selection.Columns.AutoFit;                                //자동정렬
  XL.Range['A2', 'A2'].Select;                                 //A2열에 커서 위치시킴

  XL.Visible := true;                                          //엑셀자료 보여줌
  Screen.Cursor := crDefault;
  DM.Qry_rpt.GotoBookmark(SavePlace);
  DM.Qry_rpt.FreeBookmark(SavePlace);
  DM.Qry_rpt.EnableControls;
  Phelpmsg.Caption := '';
end;

end.
