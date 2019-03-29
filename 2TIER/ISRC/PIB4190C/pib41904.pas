unit pib41904;

interface
uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls, Buttons, Mask, DB, DBTables,iniFiles,timeftp,
  Calen1,codelib,Fempno,Datelib, NumCtrl, pass, numedit,codeText,jpeg,pib41901,
  ImgList, QuickRpt, Qrctrls, MemDS, DBAccess, Ora;

//uses Windows, SysUtils, Messages, Classes, Graphics, Controls, Dialogs,
//     StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, qrprntr, pib41901, Db,
//     DBTables,jpeg, ImgList; //   , Buttons

//uses   WinTypes, WinProcs
//  Buttons, Mask, DB, DBTables,iniFiles,timeftp,
//  Calen1,codelib,Fempno,Datelib, NumCtrl, pass, numedit,codeText,
//  QuickRpt, Qrctrls;


type
  TPrnForm1 = class(TQuickRep)
    dBand1: TQRBand;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRShape39: TQRShape;
    QRShape40: TQRShape;
    QRShape42: TQRShape;
    korname: TQRLabel;
    lsch: TQRLabel;
    QRShape46: TQRShape;
    QRShape63: TQRShape;
    paycl: TQRLabel;
    deptna1: TQRLabel;
    paycldate: TQRLabel;
    No: TQRLabel;
    age: TQRLabel;
    PageHeaderBand1: TQRBand;
    QRShape1: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRLabel1: TQRLabel;
    QRShape5: TQRShape;
    QRLabel3: TQRLabel;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape10: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape11: TQRShape;
    QRLabel10: TQRLabel;
    QRShape12: TQRShape;
    QRLabel11: TQRLabel;
    QRShape13: TQRShape;
    QRLabel12: TQRLabel;
    QRShape14: TQRShape;
    QRLabel14: TQRLabel;
    QRShape33: TQRShape;
    QRLabel41: TQRLabel;
    Qddf: TQRLabel;
    QRLabel22: TQRLabel;
    QRSysData1: TQRSysData;
    lineBand: TQRChildBand;
    QRLabel2: TQRLabel;
    QRShape15: TQRShape;
    school2: TQRLabel;
    school1: TQRLabel;
    major1: TQRLabel;
    major2: TQRLabel;
    gray1: TQRLabel;
    gray2: TQRLabel;
    QRShape43: TQRShape;
    QRShape44: TQRShape;
    QRShape45: TQRShape;
    line2: TQRShape;
    QRShape16: TQRShape;
    title: TQRLabel;
    deptna2: TQRLabel;
    endband: TQRChildBand;
    QRShape2: TQRShape;
    QRShape9: TQRShape;
    line1: TQRShape;
    QRLabel6: TQRLabel;
    QRShape17: TQRShape;
    doub: TQRLabel;
    school3: TQRLabel;
    major3: TQRLabel;
    gray3: TQRLabel;
    perimg: TQRImage;
    QRLabel8: TQRLabel;
    orgempdate: TQRLabel;
    deptna3: TQRLabel;
    QRLabel13: TQRLabel;
    QRSysData2: TQRSysData;
    l_payra: TQRLabel;
    SummaryBand1: TQRBand;
    Qry_Main: TQuery;
    Query2: TQuery;
    QRLabel7: TQRLabel;
    Ora_Main: TOraQuery;
    Ora_Query2: TOraQuery;
    procedure PrnForm1Preview(Sender: TObject);
    procedure PrnForm1NeedData(Sender: TObject; var MoreData: Boolean);
    procedure PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure PrnForm1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure dBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure SummaryBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
//     HeadTitle : string;
  public


  end;

var
  PrnForm1: TPrnForm1;
  RecCnt,orgRecCnt  : integer;


implementation

uses pib41903,pib41902, PePrnview;

{$R *.DFM}

procedure TPrnForm1.PrnForm1Preview(Sender: TObject);
begin
//   ViewForm.QRpreview1.QRPrinter := TQRPrinter(MainForm.Rpt.QRPrinter); //TQRPrinter(Sender);
//   ViewForm.Show;
     Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,PrnForm1);
     Fm_PreviewForm.Show;
end;

procedure TPrnForm1.PrnForm1NeedData(Sender: TObject;
  var MoreData: Boolean);
var i: integer;
begin

  if not Eof(PrnF) then
  begin
     Read(PrnF,PrnD);
     no.caption          := PrnD.no;
//     deptna1.caption     := PrnD.deptna1; 2002.05.09 shm
     if  PrnD.deptlevel  <= 'C0' then      //1.04 2002.05.09 shm 추가 
     begin
         deptna2.Font.Size   := 9;
         deptna2.caption     := PrnD.deptna2;
         deptna3.caption     := '';
         deptna2.Font.Style  := [fsBold]
     end else
     if  PrnD.deptlevel  = 'D0' then
     begin
         deptna2.Font.Style  := [];
         deptna2.caption     := PrnD.deptna1;
         deptna3.caption     := PrnD.deptna2
     end else
     if  PrnD.deptlevel  = 'E0' then
     begin
         deptna2.Font.Style  := [];
         deptna2.caption     := PrnD.deptna2;
         deptna3.caption     := PrnD.deptna3;
     end;
////////////////////////////////////////////////////////////////////////////////
//  30.06    2003.08.11  정규용   이석희 요청    공석일경우도 deptna3 찍히게
///////////////////////////////////////////////////////////////////////////////
     deptna3.caption     := PrnD.deptna3;
////////////////////////////////////////////////////////////////////////////////
     korname.caption     := PrnD.korname;
     age.Caption         := PrnD.age;
     paycl.caption       := PrnD.paycl;
     l_payra.Caption     := '('+PrnD.payra+')';      //2004.02.18 정규용 직위  추가
     orgempdate.caption  := PrnD.orgempdate;         //2002.01.14 shm 이석희씨 요청.
     paycldate.caption   := PrnD.pacldate;
     lsch.caption        := PrnD.lsch;

     school1.caption     := PrnD.school[0];
     major1.caption      := PrnD.major[0];
     gray1.caption       := PrnD.gray[0];
     school2.caption     := PrnD.school[1];
     major2.caption      := PrnD.major[1];
     gray2.caption       := PrnD.gray[1];
     school3.caption     := PrnD.school[2];
     major3.caption      := PrnD.major[2];
     gray3.caption       := PrnD.gray[2];

     doub.Caption        := PrnD.doub;
     CData.PersonPic(Prnd.empno,perimg);
     if (deptna1.Caption <> '') or (StrToInt(no.caption) mod 6 = 1) then
          line1.Enabled  := True
     else
          line1.Enabled  := False;
// kcj 예외처리 : 국사팀은 실명을 null로 display
     if deptna1.Caption = 'tt' then  deptna1.Caption := '';

     dBand1.Enabled   := True;
     if ((StrToInt(no.caption) mod 6 = 0)
        or (MainForm.tcount = StrToInt(no.Caption)))  then begin
        lineband.Enabled  := False;
        endband.Enabled   := True;
     end else begin
        lineband.Enabled  := True;
        endband.Enabled   := False;
     end;
     MoreData := True;
  end
  else
  begin
     MoreData := False;
     MainForm.Bscreen.Enabled := True;
     MainForm.BPrint.Enabled  := True;
     System.Close(PrnF);
  end;

end;

procedure TPrnForm1.PrnForm1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var
  strTemp : String;
  subSQL  : String;
begin
//  MainForm.Gr.MaxValue := 100;
//  MainForm.Gr.Progress := 0;
//  System.Assign(PrnF,HomeDir+'\list\'+HFile);
//  System.Reset(PrnF);       //open
  RecCnt := 0;
  with Ora_Main do
  begin
    subSQL := 'payra in (';
    if Mainform.Gsysdate < Mainform.payrachdate then
    begin
        if MainForm.cb_A1.Checked then
        begin
          subSQL := subSQL +'''12''';  // 부문장
        end;
        if MainForm.cb_A2.Checked then
        begin
          if MainForm.IsBefCheckedCBox(2) then
            subSQL := subSQL +',''14'''  // 본부장
          else
            subSQL := subSQL +'''14''';  // 본부장
        end;
        if MainForm.cb_A3.Checked then
        begin
          if MainForm.IsBefCheckedCBox(3) then
            subSQL := subSQL + ',''16'',''19'''  // 실/지사장
          else
            subSQL := subSQL +'''16'',''19''';   // 실/지사장
        end;
        if MainForm.cb_A4.Checked then
        begin
          if MainForm.IsBefCheckedCBox(4) then
           subSQL := subSQL + ',''2C'',''2C5'''  // 팀장,PL
          else
           subSQL := subSQL + '''2C'',''2C5''';  // 팀장,PL
        end;
    end
    else
    begin
        if MainForm.cb_A1.Checked then
        begin
             subSQL := subSQL +'''A51'',''A61'',''A65''';  // 부문장, 단장, 트라이브장
        end;
        if MainForm.cb_A2.Checked then
        begin
          if MainForm.IsBefCheckedCBox(2) then
            subSQL := subSQL +',''A71'''  // 실장
          else
            subSQL := subSQL +'''A71''';  // 실장
        end;
        if MainForm.cb_A3.Checked then
        begin
          if MainForm.IsBefCheckedCBox(3) then
            subSQL := subSQL + ',''A81'',''A84'',''A91'''  // 본부장,그룹장,담당
          else
            subSQL := subSQL +'''A81'',''A84'',''A91''';   // 본부장,그룹장,담당
        end;
        if MainForm.cb_A4.Checked then
        begin
          if MainForm.IsBefCheckedCBox(4) then
           subSQL := subSQL + ',''C11'',''C51'',''C12'',''C20'''  // 팀장,PL,챕터장,스쿼드장
          else
           subSQL := subSQL + '''C11'',''C51'',''C12'') or (jobpayra =''C20'' ';  // 팀장,PL,챕터장,스쿼드장
        end;
    end;

    subSQL := subSQL + ')';
    if MainForm.cb_A4.Checked then
      subSQL := '(' + subSQL + ')';
    subSQL := 'and ' +  subSQL;
    Close;
    SQL.Clear;
    SQL.Add('select COUNT(empno) Cnt from pimpmas  where pstate <''80'' ');
    SQL.Add(subSQL);
    Open;
    orgRecCnt := FieldByName('cnt').AsInteger;
    Close;                                                   //C.photo,
    SQL.Clear;
//    SQL.Add( '
    SQL.Add('select A.empno,A.korname,B.deptname,B.deptna3, C.photo,                '+
            '       (select codename from pyccode                                   '+
            '         where codeid=''I112''                                         '+
            '          and codeno =a.paycl)  payclnm,                               '+
            '       (select codename from pyccode                                   '+
            '         where codeid=''I113''                                         '+
            '          and codeno =a.payra) payranm,                                '+
            '       A.orgempdate,nvl(cpaycldate,cardate) paycldate,A.usaage         '+
            '  from pimpmas A, pycdept B, cimphot C                                 '+
            'where A.orgnum   = B.orgnum                                            '+
            '  and A.deptcode = B.deptcode                                          '+
            '  and A.empno    = C.empno                                             '+
            '  and A.pstate   < ''60''                                              ');
    SQL.Add(SubSQL);
    SQL.Add(' order by A.deptcode');
//    showmessage(sql.Text);

//    Exit;
    Open;
//    showmessage('open완료');



//    abort;
  end;
end;

procedure TPrnForm1.PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   title.caption := '';
   if Mainform.Gsysdate < Mainform.payrachdate then
   begin
       if MainForm.cb_A1.Checked then
       begin
         title.caption := title.caption + '부문장' ;
       end;
       if MainForm.cb_A2.Checked then
       begin
          if MainForm.IsBefCheckedCBox(2) then
            title.caption := title.caption + '/본부장'
          else
            title.caption := title.caption + '본부장';
       end;
       if MainForm.cb_A3.Checked then
       begin
         if MainForm.IsBefCheckedCBox(3) then
           title.caption := title.caption + '/실장/지사장'
         else
           title.caption := title.caption + '실장/지사장'
       end;
       if MainForm.cb_A4.Checked then
       begin
         if MainForm.IsBefCheckedCBox(4) then
           title.caption := title.caption + '/팀장'
         else
           title.caption := title.caption + '팀장';
       end;
       title.caption := title.caption + ' 명단';
   end
   else
   begin
       if MainForm.cb_A1.Checked then
       begin
         title.caption := title.caption + '부문장/단장' ;
       end;
       if MainForm.cb_A2.Checked then
       begin
          if MainForm.IsBefCheckedCBox(2) then
            title.caption := title.caption + '/실장'
          else
            title.caption := title.caption + '실장';
       end;
       if MainForm.cb_A3.Checked then
       begin
         if MainForm.IsBefCheckedCBox(3) then
           title.caption := title.caption + '/본부장/그룹장/담당'
         else
           title.caption := title.caption + '본부장/그룹장/담당'
       end;
       if MainForm.cb_A4.Checked then
       begin
         if MainForm.IsBefCheckedCBox(4) then
           title.caption := title.caption + '/팀장'
         else
           title.caption := title.caption + '팀장';
       end;
       title.caption := title.caption + ' 명단';
   end;

//   if MainForm.workgubun = 1 then
////     title.caption := '실 단 장 명 단';
//     title.caption := '부문장, 실/단장, 지사장 명단';
//   if MainForm.workgubun = 2 then
//     title.caption := '소   팀   장   명   단';
//   if MainForm.workgubun = 3 then
//     title.caption := '보 직 자 명 단';
//   if MainForm.workgubun = 4 then
//    title.caption := '담   당   명   단';
//   if MainForm.workgubun = 5 then
//     title.caption := '대   팀   장   명   단';
//   if MainForm.workgubun = 6 then
//     title.caption := '보   임   자   명   단';
end;

procedure TPrnForm1.dBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  Tempstream : TMemoryStream;
  iJPG       : TJPEGImage;
  iBMP       : TBitmap;
  rect       : TRect;
  iRoopCnt   : byte;
begin
  MainForm.HelpDsr.Caption := '레포트를 생성하고 있습니다.....';
  SendMessage(MainForm.Hp.handle,WM_PAINT,0,0);
  RecCnt := RecCnt + 1;
  Tempstream := TMemoryStream.Create;
  iJPG  := TJPEGImage.Create;
  iBMP  := TBitmap.Create;

{  with Qphoto do
    begin
         Close;
         SQL.Clear;
         showmessage('ddd');
         SQL.Add( 'select  photo from  cimphot where empno = :empno');
         ParamByName('empno').AsString :=  Qry_Main.FieldByName('empno').AsString;
//         Params.yName('empno') :=  Qry_Main.FieldByName('empno').AsString;
//         SQL.Text :=
         showmessage('xxx');
         Open;
         showmessage('open');

    end;}
  with Ora_Main do
  begin
    deptna2.Caption    := FieldByName('deptname').AsString;
    deptna3.Caption    := FieldByName('deptna3').AsString;
    korname.Caption    := FieldByName('korname').AsString;
    age.Caption        := '('+FieldByName('usaage').AsString+'세)';
    paycl.Caption      := FieldByName('payclnm').AsString;
    l_payra.Caption    := FieldByName('payranm').AsString; //'('+FieldByName('payranm').AsString+')';
    orgempdate.Caption := Copy(FieldByName('orgempdate').AsString,3,2)+'.'+
                          Copy(FieldByName('orgempdate').AsString,5,2)+'.'+
                          Copy(FieldByName('orgempdate').AsString,7,2);

    if FieldByName('paycldate').AsString <> '' then
    begin
      paycldate.Caption  := Copy(FieldByName('paycldate').AsString,3,2)+'.'+
                            Copy(FieldByName('paycldate').AsString,5,2)+'.'+
                            Copy(FieldByName('paycldate').AsString,7,2);
      paycldate.Enabled := True;
    end
    else paycldate.Enabled := False;

    No.Caption         := FloatToStr(RecCnt);
   TBLOBField(FieldByName('photo')).SaveToStream(Tempstream);
   Tempstream.Position := 0;
   iJPG.LoadFromStream(Tempstream);
   iBMP.Assign(iJPG);
   perimg.Picture.Bitmap := iBMP;

    iRoopCnt := 0;
    with Ora_Query2 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select A.empno,A.schgr,decode(D.codename,''전문대졸'',''전졸'',D.codename) schgrNM, A.schcode, '+
              '       B.codename schcodename, A.majorcode,           '+
              '       C.codename majorcodename, A.schtoym            '+
              ' from pimscho A,pyccode B, pyccode C, pyccode D       '+
              ' where (A.schgr = D.codeno and D.codeid =''I221'')    '+
              '   and (A.schcode = B.codeno and B.codeid =''I223'')  '+
              '   and (A.majorcode = C.codeno and C.codeid =''I225'')'+
              '   and A.empno = '''+Ora_Main.FieldByName('EMPNO').AsString + ''''+
              'order by A.schgr desc');
      Open;

      lsch.Caption    := '';
      school1.Caption := '';
      major1.Caption  := '';
      gray1.Caption   := '';
      school2.Caption := '';
      major2.Caption  := '';
      gray2.Caption   := '';
      school3.Caption := '';
      major3.Caption  := '';
      gray3.Caption   := '';

      while not EOF do
      begin
        iRoopCnt := iRoopCnt + 1;
        case iRoopCnt of
           1: begin
                lsch.Caption    := FieldByName('schgrNM').AsString;
                school1.Caption := FieldByName('schcodename').AsString;
                major1.Caption  := FieldByName('majorcodename').AsString;
                gray1.Caption   := Copy(FieldByName('schtoym').AsString,3,2)+'.'+
                                   Copy(FieldByName('schtoym').AsString,5,2);
              end;
           2: begin
                school2.Caption := FieldByName('schcodename').AsString;
                major2.Caption  := FieldByName('majorcodename').AsString;
                gray2.Caption   := Copy(FieldByName('schtoym').AsString,3,2)+'.'+
                                   Copy(FieldByName('schtoym').AsString,5,2);
              end;
           3: begin
                school3.Caption := FieldByName('schcodename').AsString;
                major3.Caption  := FieldByName('majorcodename').AsString;
                gray3.Caption   := Copy(FieldByName('schtoym').AsString,3,2)+'.'+
                                   Copy(FieldByName('schtoym').AsString,5,2);
              end;
        end;
        Next;
      end;
    end;
  end;
  Tempstream.Free;
  iJPG.Free;
  iBMP.Free;
  if RecCnt = orgRecCnt  then MainForm.Gr.Progress := 100
  else MainForm.Gr.Progress := Round(RecCnt/orgRecCnt*100);
  SendMessage(MainForm.Panel3.handle,WM_PAINT,0,0);
end;

procedure TPrnForm1.SummaryBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  MainForm.Gr.Progress := 0;
  //Fm_PreviewForm.Show;
end;

end.
