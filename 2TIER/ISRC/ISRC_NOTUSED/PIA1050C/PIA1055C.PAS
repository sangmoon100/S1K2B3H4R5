unit Pia1055c;

interface
uses
  Forms, Dialogs, StdCtrls, ExtCtrls, Qrctrls, QuickRpt, QRPrntr;


{$I pia1050c.inc}

type
    insa4Report: TQuickRep;
    QRBand1: TQRBand;
    procedure insa4ReportAfterPrint(Sender: TObject);
    procedure insa4ReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure insa4ReportPreview(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  detail_cnt  : integer;
  F        : file of DataSource_insa4;
  P        : DataSource_insa4;

implementation
uses pia1051c, Pia1057c;
{$R *.DFM}

procedure Tpia1055cForm.insa4ReportAfterPrint(Sender: TObject);
     System.close(F);
end;

procedure Tpia1055cForm.insa4ReportNeedData(Sender: TObject;
var
     i : integer;
     PrnLabel : TQRLabel;
begin
     if not Eof(F) then
     begin
          Read(F,P);
          empno.Caption       := p.empno;
          korname.Caption     := p.korname;

          // ��������..
          for  i := 1 to 25 do
          begin
               prnLabel := FindComponent('edutype'+inttostr(i)) as TQRLabel;
               prnLabel.Caption := p.edutype[i];
               prnLabel := FindComponent('edudate'+inttostr(i)) as TQRLabel;
               prnLabel.Caption := p.edudate[i];
               prnLabel := FindComponent('edugubun'+inttostr(i)) as TQRLabel;
               prnLabel.Caption := p.edugubun[i];
               prnLabel := FindComponent('educourse'+inttostr(i)) as TQRLabel;
               prnLabel.Caption := p.educourse[i];
               prnLabel := FindComponent('edutime'+inttostr(i)) as TQRLabel;
               prnLabel.Caption := p.edutime[i];
               prnLabel := FindComponent('eduscore'+inttostr(i)) as TQRLabel;
               prnLabel.Caption := p.eduscore[i];
               prnLabel := FindComponent('edubigo'+inttostr(i)) as TQRLabel;
               prnLabel.Caption := p.edubigo[i];
          end;

          // �ܱ������
          for  i := 1 to 10 do
          begin
               prnLabel := FindComponent('langname'+inttostr(i)) as TQRLabel;
               prnLabel.Caption := p.langname[i];
               prnLabel := FindComponent('examname'+inttostr(i)) as TQRLabel;
               prnLabel.Caption := p.examname[i];
               prnLabel := FindComponent('examdate'+inttostr(i)) as TQRLabel;
               prnLabel.Caption := p.examdate[i];
               prnLabel := FindComponent('score'+inttostr(i)) as TQRLabel;
               prnLabel.Caption := p.score[i];
               prnLabel := FindComponent('examplace'+inttostr(i)) as TQRLabel;
               prnLabel.Caption := p.examplace[i];
          end;

          // �������
          for  i := 1 to 15 do
          begin
               prnLabel := FindComponent('rekindnm'+inttostr(i)) as TQRLabel;
               prnLabel.Caption := p.rekindnm[i];
               prnLabel := FindComponent('redate'+inttostr(i)) as TQRLabel;
               prnLabel.Caption := p.redate[i];
               prnLabel := FindComponent('recause'+inttostr(i)) as TQRLabel;
               prnLabel.Caption := p.recause[i];
               prnLabel := FindComponent('reorgnm'+inttostr(i)) as TQRLabel;
               prnLabel.Caption := p.reorgnm[i];
               prnLabel := FindComponent('pukindnm'+inttostr(i)) as TQRLabel;
               prnLabel.Caption := p.pukindnm[i];
               prnLabel := FindComponent('pudate'+inttostr(i)) as TQRLabel;
               prnLabel.Caption := p.pudate[i];
               prnLabel := FindComponent('pucause'+inttostr(i)) as TQRLabel;
               prnLabel.Caption := p.pucause[i];
               prnLabel := FindComponent('pucontent'+inttostr(i)) as TQRLabel;
               prnLabel.Caption := p.pucontent[i];
          end;

          QRBand1.Enabled := True;
          MoreData := True;


          if p.gubun = 'P' then
          begin
               QRBand1.Enabled := False;
               if (EOF(F) = False) then insa4Report.NewPage;
               system.Exit;
          end;
       end else MoreData := False;
end;

procedure Tpia1055cForm.insa4ReportBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
     detail_cnt := 1;
     AssignFile(F,HomeDir+'\list\pia1053c.tmp');
     System.Reset(F);
     System.Seek(F,0);
end;

procedure Tpia1055cForm.insa4ReportPreview(Sender: TObject);
begin
     //pia1057cForm := Tpia1057cForm.Create(Application);
     with pia1057cForm do
     begin
          insaReport := insa4Report;
               //insaReport�� pia1057cForm�� ����� Public ����
          QRPreview1.QRPrinter := TQRPrinter(Sender);
          Spinedit3.Value  := 1;
          Show;
     end;
end;

end.
