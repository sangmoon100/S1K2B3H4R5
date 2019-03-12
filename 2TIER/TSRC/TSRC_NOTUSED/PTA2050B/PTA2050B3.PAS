unit pta2050b3;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TQReport1 = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRShape1: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel14: TQRLabel;
    QRLsysdate: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel15: TQRLabel;
    QRSysData1: TQRSysData;
    QRShape4: TQRShape;
    QRShape2: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRShape3: TQRShape;
    QRShape5: TQRShape;
    QRBand_detail: TQRBand;
    QRL_Empno: TQRLabel;
    QRL_Korname: TQRLabel;
    QRL_Paycl: TQRLabel;
    QRL_Examscore: TQRLabel;
    QRL_examname: TQRLabel;
    QRL_examdate: TQRLabel;
    QRL_Empdate: TQRLabel;
    QRL_Cpaycldate: TQRLabel;
    QRL_Empcode: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel16: TQRLabel;
    Ti_EmpnoFR: TQRLabel;
    QRLabel18: TQRLabel;
    Ti_EmpnoTO: TQRLabel;
    QRLabel20: TQRLabel;
    Ti_PayclFR: TQRLabel;
    Ti_PayclTO: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel24: TQRLabel;
    Ti_ExamdateFR: TQRLabel;
    Ti_ExamdateTO: TQRLabel;
    QRLabel27: TQRLabel;
    Ti_examscoreFR: TQRLabel;
    Ti_examscoreTO: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel19: TQRLabel;
    QRBand_PageFooter: TQRBand;
    QRShape8: TQRShape;
    QRLabel21: TQRLabel;
    QRLabel23: TQRLabel;
    QRLtot_cnt: TQRLabel;
    QRLabel26: TQRLabel;
    procedure QReport1Preview(Sender: TObject);
    procedure QReport1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QReport1NeedData(Sender: TObject; var MoreData: Boolean);
    procedure QReport1AfterPrint(Sender: TObject);
  private
  
  public
    Sys_date : string;
    procedure Process;
  end;

var
  QReport1: TQReport1;

implementation

uses pta2050b1,peDM,peprnView;



{$R *.DFM}

procedure TQReport1.QReport1Preview(Sender: TObject);
begin
   Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,QReport1);
   Fm_PreviewForm.Show;
end;

procedure TQReport1.QReport1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
   Ti_EmpnoFR.Caption       := Main_Form.EmpnoFR.Text;
   Ti_EmpnoTO.Caption       := Main_Form.EmpnoTO.Text;
   Ti_PayclFR.Caption       := Main_Form.PayclFR.Text+Main_Form.PayclFR_na.Caption;
   Ti_PayclTO.Caption       := Main_Form.PayclTO.Text+Main_Form.PayclTO_na.Caption;
   Ti_ExamdateFR.Caption    := Copy(Main_Form.ExamdateFR.Text,1,4) + '/' +
                               Copy(Main_Form.ExamdateFR.Text,5,2) + '/' +
                               Copy(Main_Form.ExamdateFR.Text,7,2) ;
   Ti_ExamdateTO.Caption    := Copy(Main_Form.ExamdateTO.Text,1,4) + '/' +
                               Copy(Main_Form.ExamdateTO.Text,5,2) + '/' +
                               Copy(Main_Form.ExamdateTO.Text,7,2) ;
   Ti_examscoreFR.Caption   := Main_Form.examscoreFR.Text;
   Ti_examscoreTO.Caption   := Main_Form.examscoreTO.Text;

   with DM.Q_temp do
   begin
      Close;
      SQL.Clear;
      SQL.Add( 'SELECT TO_CHAR(sysdate,''YYYYMMDDHH24MISS'') sys_date FROM DUAL');
      Open;
      Sys_Date := FieldByName('sys_date').AsString;
      Close;
   end;
   QRLsysdate.Caption := Copy(Sys_Date, 1,4) + '/' + Copy(Sys_Date, 5,2) + '/' +
                         Copy(Sys_Date, 7,2);
   Process;
end;



procedure TQReport1.Process;
begin
{   with DM.Q_Fore do
   begin
      Close;
      SQL.Clear;
      SQL.ADD('select f.empno,f.korname,i.jobgun,f.paycl,e.codename Payclname,f.examscore12,f.examname,d.codename exname,   ');
      SQL.ADD('       max(f.examdate) examdate,i.empdate,i.paycldate,i.cpaycldate,i.cardate,i.empcode,g.codename empname             ');
      SQL.ADD('from pihfore f,pimpmas i,forecode c, pyccode d, pyccode e, pyccode g,                                                 ');
      SQL.ADD('          (select yearyy,empno,max(examscore12) max_score                                                             ');
      SQL.ADD('             from(                                                                                                    ');
      SQL.ADD('                  select c.yearyy yearyy, f.empno empno, f.examdate examdate, f.examscore12 examscore12               ');
      SQL.ADD('                    from pimpmas i, pihfore f, forecode c                                                             ');
      SQL.ADD('                    where i.empno  = f.empno                                                                          ');
      SQL.ADD('                    and   i.paycl  = f.paycl                                                                          ');
      SQL.ADD('                    and   i.pstate < '80'                                                                          ');
      SQL.ADD('                    and   i.jobgun = c.jobgun                                                                         ');
      SQL.ADD('                    and   i.empno between '''+Main_form.EmpnoFR.text+''' and '''+Main_form.EmpnoTO.text+'''           ');
      SQL.ADD('                    and   i.paycl between '''+Main_form.PayclFR.text+''' and '''+Main_form.PayclTO.text+'''           ');
      SQL.ADD('                    and   f.examscore12 between '+Main_form.ExamscoreFR.text+' and '+Main_form.ExamscoreTO.text+'     ');
      SQL.ADD('                    and   decode(c.leveli,''1'','''+Main_form.ExamdateFR.text+''',f.examdate) between  '''+Main_form.ExamdateFR.text+'''  and  '''+Main_form.ExamdateTO.text+'''   ');
      SQL.ADD('					and   c.yearyy = '''+Main_form.rabasdate.Text+'''                                    ');
      SQL.ADD('                    )                                                                                                 ');
      SQL.ADD('             group by yearyy,empno                                                                                    ');
      SQL.ADD('             ) max_f                                                                                                  ');
      SQL.ADD('where i.empno    =  f.empno                                                                                           ');
      SQL.ADD('  and i.paycl    =  f.paycl                                                                                           ');
      SQL.ADD('  and i.jobgun   =  c.jobgun                                                                                          ');
      SQL.ADD('  and e.codeid   =  ''I112''                                                                                          ');
      SQL.ADD('  and i.paycl    =  e.codeno                                                                                          ');
      SQL.ADD('  and d.codeid   =  ''I611''                                                                                          ');
      SQL.ADD('  and i.empcode  =  g.codeno                                                                                          ');
      SQL.ADD('  and g.codeid   =  ''I101''                                                                                          ');
      SQL.ADD('  and f.examname =  d.codeno                                                                                          ');
      SQL.ADD('  and i.empno between '''+Main_form.EmpnoFR.text+''' and '''+Main_form.EmpnoTO.text+'''                               ');
      SQL.ADD('  and i.paycl between '''+Main_form.PayclFR.text+''' and '''+Main_form.PayclTO.text+'''                               ');
      SQL.ADD('  and f.examscore12 between '+Main_form.ExamscoreFR.text+' and '+Main_form.ExamscoreTO.text+'                 ');
      SQL.ADD('  and decode(c.leveli,''1'','''+Main_form.ExamdateFR.text+''',f.examdate) between '''+Main_form.ExamdateFR.text+'''  and  '''+Main_form.ExamdateTO.text+'''   ');
      SQL.ADD('  and c.yearyy   = '''+Main_form.rabasdate.Text+'''                                                                     ');
      SQL.ADD('  and i.empno    = max_f.empno                                                                                        ');
      SQL.ADD('  and f.examscore12 = max_f.max_score                                                                                ');
      SQL.ADD('group by f.empno, f.korname, i.jobgun, f.paycl, f.examscore12, f.examname,                ');
      SQL.ADD('         i.empdate, i.paycldate, i.cpaycldate, i.cardate, i.empcode,d.codename,e.codename,g.codename                  ');
 }

   with DM.Q_Fore do
   begin
      Close;
      SQL.Clear;
//==============================================================================//
//    1.06   2002.09.13  손종운   전산처리:2002-4636 Query 수정
//==============================================================================//
//      SQL.ADD('select empno,                                                                                               ');
//      SQL.ADD('       korname,                                                                                             ');
//      SQL.ADD('       jobgun,                                                                                              ');
//      SQL.ADD('       paycl,                                                                                               ');
//      SQL.ADD('       cl.codename payclname,                                                                               ');
////      SQL.ADD('       examscore1,                                                                                          ');
////      SQL.ADD('       examscore2,                                                                                          ');
//      SQL.ADD('       examscore12,                                                                                         ');
//      SQL.ADD('       examname,                                                                                            ');
//      SQL.ADD('       ex.codename exname,                                                                                  ');
//      SQL.ADD('       examdate,                                                                                            ');
//      SQL.ADD('       empdate,                                                                                             ');
//      SQL.ADD('       paycldate,                                                                                           ');
//      SQL.ADD('       cpaycldate,                                                                                          ');
//      SQL.ADD('       cardate,                                                                                             ');
//      SQL.ADD('       empcode,                                                                                             ');
//      SQL.ADD('       em.codename empname                                                                                 ');
////      SQL.ADD('       leveli,                                                                                              ');
////      SQL.ADD('       examscore                                                                                            ');
//      SQL.ADD('from                                                                                                        ');
//      SQL.ADD('     (                                                                                                      ');
//      SQL.ADD('      select f.empno empno,                                                                                 ');
//      SQL.ADD('             f.korname korname,                                                                             ');
//      SQL.ADD('             i.jobgun jobgun,                                                                               ');
//      SQL.ADD('             f.paycl paycl,                                                                                 ');
////      SQL.ADD('             f.examscore1 examscore1,                                                                       ');
////      SQL.ADD('             f.examscore2 examscore2,                                                                       ');
//      SQL.ADD('             f.examscore12 examscore12,                                                                     ');
//      SQL.ADD('             f.examname examname,                                                                           ');
//      SQL.ADD('             max(f.examdate) examdate,                                                                      ');
//      SQL.ADD('             i.empdate empdate,                                                                             ');
//      SQL.ADD('             i.paycldate paycldate,                                                                         ');
//      SQL.ADD('             i.cpaycldate cpaycldate,                                                                       ');
//      SQL.ADD('             i.cardate cardate,                                                                             ');
//      SQL.ADD('             i.empcode empcode                                                                             ');
////      SQL.ADD('             c.leveli leveli,                                                                               ');
////      SQL.ADD('             c.examscore examscore                                                                          ');
//      SQL.ADD('      from pihfore f, pimpmas i, forecode c,                                                                ');
//      SQL.ADD('           (                                                                                                ');
//      SQL.ADD('            select yearyy, empno, max(examscore12) max_score                                                ');
//      SQL.ADD('            from                                                                                            ');
//      SQL.ADD('                (                                                                                           ');
//      SQL.ADD('                 select c.yearyy yearyy, f.empno empno, f.examdate examdate, f.examscore12 examscore12      ');
//      SQL.ADD('                 from pimpmas i, pihfore f, forecode c                                                      ');
//      SQL.ADD('                 where i.empno = f.empno                                                                    ');
//      SQL.ADD('                   and i.pstate < ''80''                                                                    ');
//      SQL.ADD('                   and i.paycl = f.paycl  and    f.examdate >= i.EMPDATE                                    '); //응시일> 입사일 추가 shm
//      SQL.ADD('                   and i.jobgun= c.jobgun                                                                   ');
//      SQL.ADD('                   and f.paycl between c.payclfr and c.paycltr                                              ');
//      SQL.ADD('                   and f.examscore12 between c.toeicfr and c.toeictr                                        ');
//      SQL.ADD('                   and f.paycl between '''+Main_form.PayclFR.text+''' and '''+Main_form.PayclTO.text+'''                               ');
//      SQL.ADD('                   and f.examscore12 between '''+Main_form.ExamscoreFR.Text+''' and '''+Main_form.ExamscoreTO.text+'''                               ');
//      SQL.ADD('                   and decode(c.leveli,''1'', '''+Main_form.ExamdateFR.text+''', f.examdate) between '''+Main_form.ExamdateFR.text+'''  and  '''+Main_form.ExamdateTO.text+'''   ');
//      SQL.ADD('                   and c.yearyy = '''+Main_form.rabasdate.Text+'''                                                                    ');
//      SQL.ADD('                )                                                                                           ');
//      SQL.ADD('            group by yearyy, empno                                                                          ');
//      SQL.ADD('           ) max_f                                                                                          ');
//      SQL.ADD('      where i.empno = f.empno                                                                               ');
//      SQL.ADD('        and i.paycl = f.paycl                                                                               ');
//      SQL.ADD('        and i.jobgun= c.jobgun                                                                              ');
//      SQL.ADD('        and i.paycl between '''+Main_form.PayclFR.text+''' and '''+Main_form.PayclTO.text+'''                               ');
//      SQL.ADD('        and f.examscore12 between '''+Main_form.ExamscoreFR.Text+''' and '''+Main_form.ExamscoreTO.text+'''                               ');
//      SQL.ADD('        and decode(c.leveli,''1'', '''+Main_form.ExamdateFR.text+''', f.examdate) between '''+Main_form.ExamdateFR.text+'''  and  '''+Main_form.ExamdateTO.text+'''   ');
//      SQL.ADD('        and c.yearyy = '''+Main_form.rabasdate.Text+'''                                                                               ');
//      SQL.ADD('        and i.empno = max_f.empno and f.examscore12 = max_f.max_score                                       ');
//      SQL.ADD('        and i.empno between '''+Main_form.EmpnoFR.text+''' and '''+Main_form.EmpnoTO.text+'''                               ');
//      SQL.ADD('        and i.paycl between '''+Main_form.PayclFR.text+''' and '''+Main_form.PayclTO.text+'''                               ');
//      SQL.ADD('      group by f.empno,                                                                                     ');
//      SQL.ADD('             f.korname,                                                                                     ');
//      SQL.ADD('             i.jobgun,                                                                                      ');
//      SQL.ADD('             f.paycl,                                                                                       ');
////      SQL.ADD('             f.examscore1,                                                                                  ');
////      SQL.ADD('             f.examscore2,                                                                                  ');
//      SQL.ADD('             f.examscore12,                                                                                 ');
//      SQL.ADD('             f.examname,                                                                                    ');
//      SQL.ADD('             i.empdate,                                                                                     ');
//      SQL.ADD('             i.paycldate,                                                                                   ');
//      SQL.ADD('             i.cpaycldate,                                                                                  ');
//      SQL.ADD('             i.cardate,                                                                                     ');
//      SQL.ADD('             i.empcode                                                                                      ');
////      SQL.ADD('             c.leveli,                                                                                    ');
////      SQL.ADD('             c.examscore                                                                                  ');
//      SQL.ADD('     ) fore, pyccode cl, pyccode ex, pyccode em                                                             ');
//      SQL.ADD('where fore.empcode  = em.codeno and em.codeid = ''I101''                                                    ');
//      SQL.ADD('  and fore.examname = ex.codeno and ex.codeid = ''I611''                                                    ');
//      SQL.ADD('  and fore.paycl    = cl.codeno and cl.codeid = ''I112''                                                    ');
{jissi 2009.01.20
      SQL.ADD('select i.empno       empno,                                              ');
      SQL.ADD('       i.korname     korname,                                            ');
      SQL.ADD('       i.jobgun      jobgun,                                             ');
      SQL.ADD('       i.paycl       paycl,                                              ');
      SQL.ADD('       e.codename    payclname,                                          ');
      SQL.ADD('       f.examscore12 examscore12,                                        ');
      SQL.ADD('       f.examname    examname,                                           ');
      SQL.ADD('       g.codename    exname,                                             ');
      SQL.ADD('       f.examdate    examdate,                                           ');
      SQL.ADD('       i.empdate     empdate,                                            ');
      SQL.ADD('       i.paycldate   paycldate,                                          ');
      SQL.ADD('       i.cpaycldate  cpaycldate,                                         ');
      SQL.ADD('       i.cardate     cardate,                                            ');
      SQL.ADD('       i.empcode     empcode,                                            ');
      SQL.ADD('       d.codename    empname                                             ');
      SQL.ADD('  from (select f.empno           empno,                                  ');
      SQL.ADD('               f.paycl           paycl,                                  ');
      SQL.ADD('               max_s.examname    examname,                               ');
      SQL.ADD('               max_s.examscore12 examscore12,                            ');
      SQL.ADD('               max(f.examdate)   examdate                                ');
      SQL.ADD('          from pihfore f,                                                ');
      SQL.ADD('               (select f.empno            empno,                         ');
      SQL.ADD('                       i.paycl            paycl,                         ');
      SQL.ADD('                       f.examname         examname,                      ');
      SQL.ADD('                       max(f.examscore12) examscore12                    ');
      SQL.ADD('                  from pimpmas i, pihfore f, forecode c                  ');
      SQL.ADD('                 where i.empno       = f.empno                           ');
      SQL.ADD('                   and i.paycl       = f.paycl                           ');
      SQL.ADD('                   and c.yearyy      = '''+Main_form.rabasdate.Text+'''    ');
      SQL.ADD('                   and i.jobgun      = c.jobgun                          ');
      SQL.ADD('                   and i.paycl       between c.payclfr and c.paycltr     ');
      SQL.ADD('                   and f.examscore12 between c.toeicfr and c.toeictr     ');
      SQL.ADD('                   and decode(c.leveli, ''1'', '''+Main_form.ExamdateFR.text+''', f.examdate) ');
      SQL.ADD('                                     between '''+Main_form.ExamdateFR.text+'''                ');
      SQL.ADD('                                         and '''+Main_form.ExamdateTO.text+'''                ');
      SQL.ADD('                 group by c.yearyy, f.empno, i.paycl, f.examname, f.examname) max_s         ');
      SQL.ADD('         where f.empno       = max_s.empno                               ');
      SQL.ADD('           and f.paycl       = max_s.paycl                               ');
      SQL.ADD('           and f.examscore12 = max_s.examscore12                         ');
      SQL.ADD('           and max_s.examscore12 between '''+Main_form.ExamscoreFR.Text+''' ');
      SQL.ADD('                                     and '''+Main_form.ExamscoreTO.text+'''   ');
      SQL.ADD('         group by f.empno, f.paycl, max_s.examname, max_s.examscore12) m,');
      SQL.ADD('        pihfore f, pimpmas i, pyccode d, pyccode e, pyccode g            ');
      SQL.ADD(' where m.empno       = f.empno                                           ');
      SQL.ADD('   and m.paycl       = f.paycl                                           ');
      SQL.ADD('   and m.examname    = f.examname                                        ');
      SQL.ADD('   and m.examdate    = f.examdate                                        ');
      SQL.ADD('   and m.examscore12 = f.examscore12                                     ');
      SQL.ADD('   and m.empno       = i.empno                                           ');
      SQL.ADD('   and d.codeid      = ''I101''                                          ');
      SQL.ADD('   and i.empcode     = d.codeno                                          ');
      SQL.ADD('   and i.pstate      < ''80''                                            ');
      SQL.ADD('   and e.codeid      = ''I112''                                          ');
      SQL.ADD('   and i.paycl       = e.codeno                                          ');
      SQL.ADD('   and g.codeid      = ''I611''                                          ');
      SQL.ADD('   and f.examname    = g.codeno                                          ');
      SQL.ADD('   and i.paycl       between '''+Main_form.PayclFR.text+'''                ');
      SQL.ADD('                         and '''+Main_form.PayclTO.text+'''                ');
      SQL.ADD('   and i.empno       between '''+Main_form.EmpnoFR.text+'''                ');
      SQL.ADD('                         and '''+Main_form.EmpnoTO.text+'''                ');
}
     SQL.text := 'select i.empno       empno,                                               '
               + '       i.korname     korname,                                             '
               + '       i.jobgun      jobgun,                                              '
               + '       i.paycl       paycl,                                               '
               + '       (select codename from pyccode where codeid = ''I112''              '
               + '                                       and codeno = i.paycl)  payclname,  '
               + '       f.examscore12 examscore12,                                         '
               + '       f.examname    examname,                                            '
               + '       (select codename from pyccode where codeid = ''I611''              '
               + '                                       and codeno = f.examname)  exname,  '
               + '       f.examdate    examdate,                                            '
               + '       i.empdate     empdate,                                             '
               + '       i.paycldate   paycldate,                                           '
               + '       i.cpaycldate  cpaycldate,                                          '
               + '       i.cardate     cardate,                                             '
               + '       i.empcode     empcode,                                             '
               + '       (select codename from pyccode where codeid = ''I101''              '
               +'                                        and codeno = i.empcode)  empname   '
               + ' from  (select * from pihfore) f, pimpmas i                               '
               + ' where i.empno = f.empno                                                  '
               + '   and i.paycl       between '''+Main_form.PayclFR.text+'''               '
               + '                         and '''+Main_form.PayclTO.text+'''               '
               + '   and i.empno       between '''+Main_form.EmpnoFR.text+'''               '
               + '                         and '''+Main_form.EmpnoTO.text+'''               '
               + '   and f.examdate    between '''+Main_form.ExamdateFR.text+'''            '
               + '                         and '''+Main_form.ExamdateTO.text+'''	    '
               + '   and f.examscore12 between '''+Main_form.ExamscoreFR.Text+'''           '
               + '                         and '''+Main_form.ExamscoreTO.text+'''           '
               ;

//==============================================================================//
   DM.Q_Fore.Open;
   end;
end;

procedure TQReport1.QReport1NeedData(Sender: TObject;
  var MoreData: Boolean);
var
  i_Examdate    : string;
  i_Empdate     : string;
  i_Cpaycldate  : string;
begin
  QRLtot_cnt.Caption        := InttoStr(DM.Q_Fore.RecordCount);
  if DM.Q_Fore.eof then
  begin
    MoreData := False;
  end
  else
  begin
    QRL_Empno.Caption       := DM.Q_Fore.FieldByName('Empno').AsString;
    QRL_Korname.Caption     := DM.Q_Fore.FieldByName('Korname').AsString;
    QRL_Paycl.Caption       := DM.Q_Fore.FieldByName('Payclname').AsString;
    QRL_Examscore.Caption   := DM.Q_Fore.FieldByName('Examscore12').AsString;
    QRL_Examname.Caption    := DM.Q_Fore.FieldByName('Exname').AsString;
    QRL_Empcode.Caption     := DM.Q_Fore.FieldByName('Empname').AsString;
    i_Examdate              := DM.Q_Fore.FieldByName('Examdate').AsString;
    i_Empdate               := DM.Q_Fore.FieldByName('Empdate').AsString;
    i_Cpaycldate            := DM.Q_Fore.FieldByName('Cpaycldate').AsString;
    QRL_Examdate.Caption    := Copy(i_Examdate, 1,4)   + '/' + Copy(i_Examdate, 5,2)   + '/' +
                               Copy(i_Examdate, 7,2);
    QRL_Empdate.Caption     := Copy(i_Empdate, 1,4)    + '/' + Copy(i_Empdate, 5,2)    + '/' +
                               Copy(i_Empdate, 7,2);
    QRL_Cpaycldate.Caption  := Copy(i_Cpaycldate, 1,4) + '/' + Copy(i_Cpaycldate, 5,2) + '/' +
                               Copy(i_Cpaycldate, 7,2);

    DM.Q_Fore.next;
    MoreData := True;
  end;

end;

procedure TQReport1.QReport1AfterPrint(Sender: TObject);
begin
  DM.Q_Fore.Close;
end;

end.



