unit pib41602;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Db, DBTables,peprnview;
type
  TPrintForm = class(TForm)
    QuickRep1: TQuickRep;
    DetailBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    TitleBand1: TQRBand;
    QRShape20: TQRShape;
    QRShape17: TQRShape;
    L_Title: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape11: TQRShape;
    title_Sosok: TQRLabel;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRShape16: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    qry_Master: TQuery;
    Lsosok: TQRLabel;
    Lteamname: TQRLabel;
    Lname: TQRLabel;
    LBirth: TQRLabel;
    Lpayra: TQRLabel;
    Lempdate: TQRLabel;
    Lpaycldate: TQRLabel;
    QRLabel15: TQRLabel;
    Lschgr: TQRLabel;
    Lschname1: TQRLabel;
    Lmajor1: TQRLabel;
    QRsil_Line: TQRShape;
    QRShape4: TQRShape;
    QRall_Line: TQRShape;
    line_gubun1: TQRShape;
    QR_title_dam: TQRLabel;
    Line_gubun2: TQRShape;
    Ldamdang: TQRLabel;
    QRteam_Line: TQRShape;
    qry_Pihorga: TQuery;
    QRshp_adDept: TQRShape;
    LadDept: TQRLabel;
    PageFooterBand1: TQRBand;
    SummaryBand1: TQRBand;
    QRShape5: TQRShape;
    QRShape10: TQRShape;
    title_Total1: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel1: TQRLabel;
    qry_Total: TQuery;
    QRLabel2: TQRLabel;
    payraNM: TQRLabel;
    LTotal: TQRLabel;
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure DetailBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QuickRep1EndPage(Sender: TCustomQuickRep);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QuickRep1Preview(Sender: TObject);
    procedure SummaryBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    { Private declarations }
     DetailCount : integer;
  public
    { Public declarations }
  end;

var
  PrintForm          : TPrintForm;
  BfEmpno,BfSectcode,BfTeam,BfFieldcode,BfTeamname,BfSosok : String;
  StartYN            : Boolean;
implementation

uses pib41601;

{$R *.DFM}

procedure TPrintForm.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   Inc(DetailCount);
   if qry_Master.RecordCount >= DetailCount then
    pib4161cForm.Gr.Progress := (DetailCount * 100) div qry_Master.RecordCount else pib4161cForm.Gr.Progress := 100;
  SendMessage(pib4161cForm.panel3.handle,WM_PAINT,0,0);
  if qry_Master.FieldByName('empno').AsString = '' then
    begin
      LadDept.Enabled := True;
      QRshp_adDept.Enabled := True;
      with qry_Pihorga do
        begin
          Close;
          ParamByName('deptcode').AsString := qry_Master.FieldByName('realdept').AsString;
          Open;
          if EOF then
            begin
              LadDept.Caption := '< 공  석 >'
            end
          else
            begin
              LadDept.Caption := '< 겸  직 >  ' + FieldByName('korname').AsString +
                                           '  ' + FieldByName('payraNM').AsString +
                                         '  ( ' + FieldByName('paydunm').AsString + ' )';
            end;
        end;
    end
  else
    begin
       LadDept.Enabled := False;
       QRshp_adDept.Enabled := False;
    end;
  if (qry_Master.FieldByName('lschgr').AsString > '40') and
     (qry_Master.FieldByName('schgr').AsString = '39')  then
    begin
      qry_Master.Next;
    end;
  if (qry_Master.FieldByName('sosok').AsString = BfSosok) then
    begin
      QRsil_Line.Enabled := False;
      Lsosok.Caption := '';
    end
  else
    begin
      QRsil_Line.Enabled := True;
      Lsosok.Caption := qry_Master.FieldByName('sosok').AsString;
    end;
 if (qry_Master.FieldByName('teamname').AsString = Bfteamname) then
   begin
     QRteam_Line.Enabled := False;
     Lteamname.Caption  := '';
   end
 else
   begin
     QRteam_Line.Enabled := True;
     Lteamname.Caption   := qry_Master.FieldByName('teamname').AsString;
   end;
 if (qry_Master.FieldByName('empno').AsString  <> '') AND (qry_Master.FieldByName('empno').AsString = BfEmpno) then
    begin
      Lsosok.Caption     := '';
      Ldamdang.Caption   := '';
      Lname.Caption      := '';
      LBirth.Caption     := '';
      Lpayra.Caption     := '';
      Lempdate.Caption   := '';
      Lpaycldate.Caption := '';
      Lschgr.Caption     := '';
     QRall_Line.Enabled  := False;
    end
  else
    begin
     QRall_Line.Enabled := True;
      with qry_Master do
        begin
          Ldamdang.Caption   :=  FieldByName('deptna3').AsString;
          Lname.Caption      :=  FieldByName('name').AsString;
          LBirth.Caption     :=  FieldByName('Birth').AsString;
          Lpayra.Caption     :=  FieldByName('payra').AsString;
          Lempdate.Caption   :=  Copy(FieldByName('empdate').AsString,3,2) +'.'+
                                 Copy(FieldByName('empdate').AsString,5,2) +'.'+ Copy(FieldByName('empdate').AsString,7,2);
          Lpaycldate.Caption :=  Copy(FieldByName('paycldate').AsString,3,2) +'.'+
                                 Copy(FieldByName('paycldate').AsString,5,2) +'.'+ Copy(FieldByName('paycldate').AsString,7,2);
          Lschgr.Caption     :=  FieldByName('lschgrNM').AsString;
        end;
    end;
    Lschname1.Caption :=  qry_Master.FieldByName('schNM').AsString;
    Lmajor1.Caption   :=  qry_Master.FieldByName('major').AsString;
end;

procedure TPrintForm.DetailBand1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  BfEmpno     := qry_Master.FieldByName('empno').AsString;
  BfSectcode  := qry_Master.FieldByName('sectcode').AsString;
  BfFieldcode := qry_Master.FieldByName('fieldcode').AsString;
  BfTeam      := Copy(qry_Master.FieldByName('deptcode').AsString,1,3);
  BfTeamname  := qry_Master.FieldByName('teamname').AsString;
  BfSosok     := qry_Master.FieldByName('Sosok').AsString;
  StartYN     := False;
end;

procedure TPrintForm.QuickRep1EndPage(Sender: TCustomQuickRep);
begin
  StartYN  := True;
  pib4161cForm.Gr.Progress := 0;
end;



procedure TPrintForm.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var
  sTotal1,sTotal2 : String;
  iCnt            : integer;
begin
  Application.ProcessMessages;
   with qry_Master do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select Q.deptname sosok,P.deptcode realdept,substr(P.deptcode,1,2) sectcode, Q.fieldcode, M.SCHGR,                '+
              '       DECODE(P.deptlevel,''E0'',SUBSTR(P.deptname, INSTR(P.deptname,'' '')+1,LENGTH(P.deptname)-INSTR(P.deptname,'' '')+1),p.deptname) teamname, '+
              '       P.deptna3,M.*                                                                                      '+
              'from pycdept P,pycdept Q,                                                                                 '+
              '     (select A.empno,A.orgnum,                                                                            '+
              '             A.deptcode,                                                                                  '+
              '             A.korname name,                                                                              '+
              '             H.codename payra,                                                                            '+
              '             substr(A.juminid,1,2) birth,                                                                 '+
              '             A.orgempdate empdate,                                                                        '+
              '             A.paycldate,A.lschgr lschgr,B.codename lschgrnm,F.SCHGR SCHGR,F.SCHNM schnm,G.codename major '+
              '        from pimpmas A,pyccode B,pimscho F,pyccode G,pyccode H                                            '+
              '       where                                                                                              '+
              '             (B.codeid(+) =''I221'' and A.lschgr = B.codeno(+))                                                 '+
              '          and A.pstate < ''80''                                                                           '+
              '          and A.orgnum = (select value1 from pimvari where gubun =''00'' and sgubun =''0001'')            '+
              '          and A.payrayn = ''Y''                                                                           '+
              '          and A.empno = F.empno(+)                                                                        '+
              '          and (G.codeid(+) = ''I225'' and F.majorcode = G.codeno(+))                                      '+
              '          and (H.codeid(+) = ''I113'' and A.payra = H.codeno(+)) ) M                                       '+
              ' where P.orgnum = (select value1 from pimvari where gubun = ''00'' and sgubun =''0001'')                   '+
              '  and M.deptcode(+) = P.deptcode                                                                          '+
              '  and (not(lschgr > ''40'' and schgr = ''39'') or lschgr is null)                                         ');
      if pib4161cForm.work1.checked then
       begin
          SQL.Add('  and P.deptlevel <=''A0''                                                 '+
                  '  and RPAD(substr(P.deptcode,1,1),5,0) = Q.deptcode                       ');
              end
      else if pib4161cForm.work2.checked then
       begin
          SQL.Add('  and P.deptlevel =''B0''                                                 '+
                  '  and RPAD(substr(P.deptcode,1,1),5,0) = Q.deptcode                       ');
              end
      else if pib4161cForm.work3.checked then
        begin
          SQL.Add('  and P.deptlevel =''C0''                                                 '+
                  '  and P.extcode   = Q.deptcode                                            ');
//                  '  and RPAD(substr(P.deptcode,1,2),5,0) = Q.deptcode                       ');
        end
      else if pib4161cForm.work4.checked then
        begin
          SQL.Add('  and P.deptlevel  =''D0''                                                 '+
                  '  and P.extcode    = Q.deptcode                                            ');
//                  '  and RPAD(substr(P.deptcode,1,2),5,0) = Q.deptcode                       ');
        end;
      SQL.Add('  and P.orgnum   = M.orgnum(+)                                                '+
              '  and P.deptcode = M.deptcode(+)                                              '+
              '  and P.orgnum   = Q.orgnum                                                   '+
              ' order by realdept,teamname,M.SCHGR                                           ');
      Open;
    end;
  with qry_Total do
    begin
      Close;
      if pib4161cForm.work1.checked then
        begin
          title_Sosok.Left     := 97;
          L_Title.Caption      := '부문/단장 명단';
          QR_title_dam.Enabled := False;
          Line_Gubun1.Enabled  := False;
          Line_Gubun2.Enabled  := False;
          ParamByName('DEPTLEVEL').AsString := 'A0';
        end
      else if pib4161cForm.work2.checked then
        begin
          title_Sosok.Left     := 97;
          L_Title.Caption      := '실 장  명 단';
          QR_title_dam.Enabled := False;
          Line_Gubun1.Enabled := False;
          Line_Gubun2.Enabled := False;
          ParamByName('DEPTLEVEL').AsString := 'B0'
        end
      else if pib4161cForm.work3.checked then
        begin
          title_Sosok.Left     := 97;
          L_Title.Caption      := '본부/그룹장 명단';
          QR_title_dam.Enabled := False;
          Line_Gubun1.Enabled := False;
          Line_Gubun2.Enabled := False;
          ParamByName('DEPTLEVEL').AsString := 'C0'
        end
      else if pib4161cForm.work4.checked  then
        begin
          title_Sosok.Left     := 67;
          L_Title.Caption      := '담당/팀장 명단';
          QR_title_dam.Enabled := True;
          Line_Gubun1.Enabled  := True;
          Line_Gubun2.Enabled  := True;
          ParamByName('DEPTLEVEL').AsString := 'D0';
        end;
      Open;
      iCnt := 0;
      while not EOF do
        begin
          sTotal1 := sTotal1 + FieldByName('payraNM').AsString + ':' +
                               FieldByName('Cnt').AsString + '명 ';
          iCnt := iCnt + StrToInt(FieldByName('Cnt').AsString);
          Next;
        end;
    end;
//  title_Total1.Caption := sTotal1;
  payraNM.Caption      := L_Title.Caption ;
//  LTotal.Caption       := '(총 ' +IntToStr(iCnt)+ '명)';

end;

procedure TPrintForm.QuickRep1Preview(Sender: TObject);
begin
  Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,QuickRep1);
  pib4161cForm.HelpDsr.Caption := '작업 진행중입니다....';
end;

procedure TPrintForm.SummaryBand1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  if Fm_PreviewForm <> nil then Fm_PreviewForm.Show;
end;

end.
