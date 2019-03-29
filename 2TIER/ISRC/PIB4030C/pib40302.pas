unit pib40302;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, QuickRpt, QRExpr, Qrctrls, StdCtrls, ExtCtrls, pib40301, DB, DBTables,
  MemDS, DBAccess, Ora, Func;

type
  TPrintForm = class(TForm)
    QRBand_Header: TQRBand;
    QRShape10: TQRShape;
    QRShape1: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape5: TQRShape;
    QRLabel6: TQRLabel;
    QRShape6: TQRShape;
    QRLabel8: TQRLabel;
    QRShape8: TQRShape;
    QRLabel10: TQRLabel;
    QRShape11: TQRShape;
    QRLabel12: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRShape12: TQRShape;
    QRLabel18: TQRLabel;
    QRShape13: TQRShape;
    QRLabel20: TQRLabel;
    QRShape14: TQRShape;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRBand_Detail: TQRBand;
    QRL_curpayra: TQRLabel;
    QRL_korname: TQRLabel;
    QRL_lschgr_name: TQRLabel;
    QRL_schnm: TQRLabel;
    QRL_major_name: TQRLabel;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRL_schtoym: TQRLabel;
    QRL_an_name: TQRLabel;
    QRL_payra_name: TQRLabel;
    QRL_anfrdate: TQRLabel;
    QRL_antodate: TQRLabel;
    QRL_carr_name: TQRLabel;
    QRBand_GroupFooter: TQRBand;
    QRShape17: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRLabel13: TQRLabel;
    QRShape3: TQRShape;
    InReport: TQuickRep;
    QRShape16: TQRShape;
    QRShape26: TQRShape;
    QRShape36: TQRShape;
    QRLabel4: TQRLabel;
    QRShape39: TQRShape;
    QRShape40: TQRShape;
    QRShape41: TQRShape;
    QRLabel7: TQRLabel;
    QRL_curdate: TQRLabel;
    QRLabel9: TQRLabel;
    QRSysData1: TQRSysData;
    QRShape15: TQRShape;
    QRShape44: TQRShape;
    QRShape45: TQRShape;
    QRShape46: TQRShape;
    QRShape47: TQRShape;
    QRShape48: TQRShape;
    QRShape2: TQRShape;
    QRShape4: TQRShape;
    QRSif: TQRShape;
    QRSlastline: TQRShape;
    QRShape9: TQRShape;
    QRShape18: TQRShape;
    QRLabel11: TQRLabel;
    QRShape19: TQRShape;
    QRShape25: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel14: TQRLabel;
    QRL_sosok: TQRLabel;
    QRL_no: TQRLabel;
    la_ju: TQRLabel;
    la_ju1: TQRLabel;
    Q_Inwon: TOraQuery;
    Q_total: TOraQuery;
    procedure InReportBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure InReportAfterPrint(Sender: TObject);
    procedure InReportNeedData(Sender: TObject; var MoreData: Boolean);
    procedure InReportPreview(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  MAXROW = 33;

var
  PrintForm: TPrintForm;
  Fin      : file of pib40301.TDataIn;
  DataIn   : pib40301.TDataIn;
  LineCnt: Integer;
  i, k, j  :integer;
  temp_empno     : string[4]; {�� ���}



implementation

{$R *.DFM}
uses peprnView;

procedure TPrintForm.InReportBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  AssignFile(Fin, HomeDir+'\list\pib4030c.tmp');
  System.Reset(Fin);   {open}
  System.Seek(Fin, 0); {FilePoint 0}
  QRL_curdate.Caption := MainForm.Lsysdate.Caption;
  LineCnt := 0;
  DataIn.Flag := '';
  k:=0;
  j:=0;

  if Job_Cond = 2 then {������}
    begin
      Q_total.Session := Ora_Session;
      with Q_total do
      begin
        Close;
        Sql.Clear;
        Sql.Add('select sum(cou) total                                '+
                '  from (                                             '+
                '  SELECT  B.CODENAME, count(*) cou                   '+
                '  FROM  PIMPMAS A, PYCCODE B                                   '+
                '  WHERE  A.PAYCL=B.CODENO                                      '+
                '   ANd   B.CODEID=''I112''                                     '+
                '   and  (( retdate <  :payrachdate and substr(a.PAYCL,1,1)  =  ''0'') or '+
                '         ( retdate >= :payrachdate and substr(a.empno,1,1)  =  ''M'' ))  '+
                '   AND   PSTATE >=''80''                             '+
                '  GROUP BY      B.CODENAME                           '+
                '  )  A                                               ');
         parambyname('payrachdate').AsString := Mainform.payrachdate;

         Open;
         la_ju.Caption := '���� ';
         la_ju.Caption := la_ju.Caption + Q_total.FieldByName('total').AsString + '��';
         Close;
      end;

      Q_Inwon.Session := Ora_Session;
      with Q_Inwon do
      begin
        Close;
        Sql.Clear;
        Sql.Add('SELECT B.CODENAME payclname , count(*) count   '+
                '  FROM  PIMPMAS A, PYCCODE B                                   '+
                '  WHERE  A.PAYCL=B.CODENO                                      '+
                '   ANd   B.CODEID=''I112''                                     '+
                '   and  (( retdate <  :payrachdate and substr(a.PAYCL,1,1)  =  ''0'') or '+
                '         ( retdate >= :payrachdate and substr(a.empno,1,1)  =  ''M'' ))  '+
                '   AND   PSTATE >=''80''                                       '+
                '  GROUP BY B.CODENAME                                          ');
        parambyname('payrachdate').AsString := Mainform.payrachdate;


         Open;
         First;
         la_ju1.Caption := '(';
         while not Eof do
         begin
            la_ju1.Caption := la_ju1.Caption + Q_Inwon.FieldByName('payclname').AsString +
            Q_Inwon.FieldByName('count').AsString + '�� ';

            Q_Inwon.Next;
         end;
         la_ju1.Caption := la_ju1.Caption + ')';
         Close;
      end;
    end
  else if Job_Cond = 1 then {������}
    begin
      with Q_total do
      begin
        Close;
        Sql.Clear;
        Sql.Add('select sum(cou) total                                '+
                '  from (                                             '+
                '  SELECT PIMPMAS."PAYRA", count(*) cou               '+
                '  FROM  PIMPMAS                                      '+
                '  WHERE  ( substr(PIMPMAS."EMPNO",1,1)  =  ''M'' )   '+
                '   AND   PSTATE <''80''                              '+
                '  GROUP BY PIMPMAS."PAYRA"                           '+
                '  )  A                                               ');

         Open;
         la_ju.Caption := '���� ';
         la_ju.Caption := la_ju.Caption + Q_total.FieldByName('total').AsString + '��';
         Close;
      end;

      with Q_Inwon do
      begin
        Close;
        Sql.Clear;
        Sql.Add('SELECT A.PAYra payra , B.CODENAME payraname , count(*) count   '+
                '  FROM  PIMPMAS A, PYCCODE B                                   '+
                '  WHERE  A.PAYRA=B.CODENO                                      '+
                '   ANd   B.CODEID=''I113''                                     '+
                '   AND   ( substr(A.empno,1,1)  =  ''M'' )                     '+
                '   AND   PSTATE <''80''                                       '+
                '  GROUP BY A.PAYra,                                            '+
                '       B.CODENAME                                              ');

         Open;
         First;
         la_ju1.Caption := '(';
         while not Eof do
         begin
            la_ju1.Caption := la_ju1.Caption + Q_Inwon.FieldByName('payraname').AsString +
            Q_Inwon.FieldByName('count').AsString + '�� ';

            Q_Inwon.Next;
         end;
         la_ju1.Caption := la_ju1.Caption + ')';
         Close;
      end;
    end
  else if Job_Cond = 3 then {��ü}
    begin
      with Q_total do
      begin
        Close;
        Sql.Clear;
        Sql.Add('select sum(cou) total                                '+
                '  from (                                             '+
                '  SELECT b.codename, count(*) cou                    '+
                '  FROM  PIMPMAS a , PYCCODE B                                  '+
                '  WHERE  A.PAYra=B.CODENO                                      '+
                '   ANd   B.CODEID=''I113''                                     '+
                '   and  (( retdate <  :payrachdate and substr(a.PAYCL,1,1)  =  ''0'') or '+
                '         ( retdate >= :payrachdate and substr(a.empno,1,1)  =  ''M'' ))  '+
                '  GROUP BY b.codename                                '+
                '  )  A                                               ');
         parambyname('payrachdate').AsString := Mainform.payrachdate;

         Open;
         la_ju.Caption := '���� ';
         la_ju.Caption := la_ju.Caption + Q_total.FieldByName('total').AsString + '��';
         Close;
      end;

      with Q_Inwon do
      begin
        Close;
        Sql.Clear;
        Sql.Add('SELECT  B.CODENAME payraname , count(*) count                  '+
                '  FROM  PIMPMAS A, PYCCODE B                                   '+
                '  WHERE  A.PAYra=B.CODENO                                      '+
                '   ANd   B.CODEID=''I113''                                     '+
                '   and  (( retdate <  :payrachdate and substr(a.PAYCL,1,1)  =  ''0'') or '+
                '         ( retdate >= :payrachdate and substr(a.EMPNO,1,1)  =  ''M'' ))  '+
                '  GROUP BY B.CODENAME                                              ');
         parambyname('payrachdate').AsString := Mainform.payrachdate;


         Open;
         First;
         la_ju1.Caption := '(';
         while not Eof do
         begin
            la_ju1.Caption := la_ju1.Caption + Q_Inwon.FieldByName('payraname').AsString +
            Q_Inwon.FieldByName('count').AsString + '�� ';

            Q_Inwon.Next;
         end;
         la_ju1.Caption := la_ju1.Caption + ')';
         Close;
      end;
    end;
end;

procedure TPrintForm.InReportAfterPrint(Sender: TObject);
begin
  //System.Close(Fin);
end;

procedure TPrintForm.InReportNeedData(Sender: TObject; var MoreData: Boolean);
begin
  if (LineCnt >= MAXROW) then
  begin
    InReport.NewPage;
    LineCnt := 0;
  end;

  if Eof(Fin) then
  begin
    MoreData := False;
  end
  else
  begin
    with DataIn do
    begin
      QRL_no.Caption          := '';           //����
//      QRL_curpaycl.Caption    := '';           //BAND
      QRL_korname.Caption     := '';           //����
      QRL_sosok.Caption       := '';           //�Ҽ�
      QRL_curpayra.Caption    := '';           //��å
      //QRL_empno.Caption       := '';
      QRL_lschgr_name.Caption := '';           //�з�
      QRL_schnm.Caption       := '';           //�б���
      QRL_major_name.Caption  := '';           //����
      QRL_schtoym.Caption     := '';           //����
      QRL_an_name.Caption     := '';           //����
      QRL_carr_name.Caption   := '';           //��å
      QRL_payra_name.Caption  := '';           //������
      QRL_anfrdate.Caption    := '';           //������
      QRL_antodate.Caption    := '';           //������ ���

      QRSif.Enabled := False;
      QRBand_Detail.Frame.DrawBottom:=False;

      Read(Fin, DataIn);

      if not Eof(Fin) then
      begin
//        QRL_curpaycl.Caption    := curpaycl;    //BAND
        QRL_korname.Caption     := korname;     //����
        QRL_sosok.Caption       := sosok;       //�Ҽ�
        QRL_curpayra.Caption    := curpayra;    //��å
        //QRL_empno.Caption     := empno;
        QRL_lschgr_name.Caption := lschgr_name; //�з�
        QRL_schnm.Caption       := schnm;       //�б���
        QRL_major_name.Caption  := major_name;  //����
        QRL_schtoym.Caption     := schtoym;     //����
        QRL_an_name.Caption     := an_name;     //����
        QRL_carr_name.Caption   := carr_name;   //��å
        QRL_payra_name.Caption  := payra_name;  //������
        QRL_anfrdate.Caption    := anfrdate;    //������
        QRL_antodate.Caption    := antodate;    //������ ���
        Inc(LineCnt);

        if (temp_empno <> empno) then
          begin
            Inc(k);
            QRL_no.Caption          := IntToStr(k);
          end;

        if LineCnt=MAXROW then
        begin
          QRBand_Detail.Frame.DrawBottom:=True;
        end;

        if (Flag = 'E') then
        begin
          QRBand_GroupFooter.Enabled := True;
          QRSif.Enabled := True;
        end
        else if (Flag = 'N') then
        begin
          QRBand_GroupFooter.Enabled := True;
          LineCnt := MAXROW;
          QRSif.Enabled := True;
        end
        else
        begin
          if (LineCnt >= MAXROW) then
            QRBand_GroupFooter.Enabled := True
          else
            QRBand_GroupFooter.Enabled := True;
        end
      end

      else
      begin
        QRBand_GroupFooter.Enabled := True;
      end;
      MoreData := True;
    end; {with}
  end;
end;

procedure TPrintForm.InReportPreview(Sender: TObject);
begin
     Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,Inreport);
     Fm_PreviewForm.Show;
end;

end.
