unit pib1022c;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, DBCtrls, DB, DBTables, jpeg, QuickRpt, Qrctrls, QRPrntr, peprnview,
  MemDS, DBAccess, Ora;

type
  Tpib1022cForm = class(TForm)
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    photoreport: TQuickRep;
    QRBand1: TQRBand;
    payra1: TQRLabel;
    deptna11: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    deptna21: TQRLabel;
    deptna31: TQRLabel;
    QRLabel4: TQRLabel;
    payra2: TQRLabel;
    deptna12: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    deptna22: TQRLabel;
    deptna32: TQRLabel;
    QRLabel14: TQRLabel;
    payra3: TQRLabel;
    deptna13: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    deptna23: TQRLabel;
    deptna33: TQRLabel;
    QRLabel24: TQRLabel;
    empno2: TQRLabel;
    korname2: TQRLabel;
    empno1: TQRLabel;
    korname1: TQRLabel;
    empno3: TQRLabel;
    korname3: TQRLabel;
    Image1: TQRImage;
    Image2: TQRImage;
    Image3: TQRImage;
    Qdept: TOraQuery;
    Qphoto: TOraQuery;
    Qemp1: TOraQuery;
    procedure photoreportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure photoreportPreview(Sender: TObject);
  private
    { Private declarations }
   procedure  DestMake1;
   procedure  DestMake2;
   procedure  DestMake3;
   procedure JPEGLoadFromDB(BlobField: TBlobField; Image: TQrImage);
  public
    { Public declarations }
    cnt : integer;
    recCount : integer;
    stream    : TMemoryStream;
  end;

var
  pib1022cForm: Tpib1022cForm;
  jpegimage : TJpegImage;

implementation

uses pib1021c, pib1023c;

{$R *.DFM}

procedure Tpib1022cForm.DestMake1;
begin
     Qemp1.Close;
     Qemp1.Sql.clear;
     Qemp1.Sql.Add('select empno,korname,paycl,payra,orgnum,deptcode,pstate ');
     Qemp1.Sql.Add('from pimpmas ');

     if pib1021cForm.Check1.Checked = True then
     begin
        Qemp1.Sql.Add('where (empno  >= :lempno1 and empno <= :lempno2)');
        Qemp1.Sql.Add('  and (pstate < ''80'')');
        Qemp1.Sql.Add('order by empno');
     end
     else
     if pib1021cForm.Check2.Checked = True then
     begin
        Qemp1.Sql.Add('where (deptcode >= :ldeptcode1 and deptcode <= :ldeptcode2)');
        Qemp1.Sql.Add('  and (pstate < ''80'')');
        if pib1021cForm.paycl1.Text = '' then
        begin
           Qemp1.Sql.Add('   or (paycl    >= :lpaycl1    and paycl    <= :lpaycl2)');
        end
        else
        begin
           Qemp1.Sql.Add('  and (paycl    >= :lpaycl1    and paycl    <= :lpaycl2)');
        end;
        Qemp1.Sql.Add('order by deptcode,paycl,payra,paygr,empno');
     end
     else
     if pib1021cForm.Check3.Checked = True then
     begin
        Qemp1.Sql.Add('where (empno in ('+pib1021cForm.memo1.Text+'))');
        Qemp1.Sql.Add('  and (pstate < ''80'')');
        Qemp1.Sql.Add('order by empno');
     end;

     if pib1021cForm.Check1.Checked = True then
     begin
        Qemp1.ParamByName('lempno1').AsString := pib1021cForm.empno1.Text;
        Qemp1.ParamByName('lempno2').AsString := pib1021cForm.empno2.Text;
     end
     else
     if pib1021cForm.Check2.Checked = True then
     begin
        Qemp1.ParamByName('ldeptcode1').AsString := pib1021cForm.deptcode1.Text;
        Qemp1.ParamByName('ldeptcode2').AsString := pib1021cForm.deptcode2.Text;
        Qemp1.ParamByName('lpaycl1').AsString    := pib1021cForm.paycl1.Text;
        Qemp1.ParamByName('lpaycl2').AsString    := pib1021cForm.paycl2.Text;
     end;
     pib1021cForm.edit1.text := Qemp1.Sql.text;
     Qemp1.Open;

end;

procedure Tpib1022cForm.DestMake2;
begin
     Qemp1.Close;
     Qemp1.Sql.clear;
     Qemp1.Sql.Add('select empno,korname,paycl,payra,orgnum,deptcode,pstate ');
     Qemp1.Sql.Add('from pimpmas ');

     if pib1021cForm.Check1.Checked = True then
     begin
        Qemp1.Sql.Add('where (empno  >= :lempno1 and empno <= :lempno2)');
        Qemp1.Sql.Add('  and (pstate >= ''80'')');
        Qemp1.Sql.Add('order by empno');
     end
     else
     if pib1021cForm.Check2.Checked = True then
     begin
        Qemp1.Sql.Add('where (deptcode >= :ldeptcode1 and deptcode <= :ldeptcode2)');
        Qemp1.Sql.Add('  and (pstate >= ''80'')');
        if pib1021cForm.paycl1.Text = '' then
        begin
           Qemp1.Sql.Add('   or (paycl    >= :lpaycl1    and paycl    <= :lpaycl2)');
        end
        else
        begin
           Qemp1.Sql.Add('  and (paycl    >= :lpaycl1    and paycl    <= :lpaycl2)');
        end;
        Qemp1.Sql.Add('order by deptcode,paycl,payra,paygr,empno');
     end
     else
     if pib1021cForm.Check3.Checked = True then
     begin
        Qemp1.Sql.Add('where (empno in ('+pib1021cForm.memo1.Text+'))');
        Qemp1.Sql.Add('  and (pstate >= ''80'')');
        Qemp1.Sql.Add('order by empno');
     end;

     if pib1021cForm.Check1.Checked = True then
     begin
        Qemp1.ParamByName('lempno1').AsString := pib1021cForm.empno1.Text;
        Qemp1.ParamByName('lempno2').AsString := pib1021cForm.empno2.Text;
     end
     else
     if pib1021cForm.Check2.Checked = True then
     begin
        Qemp1.ParamByName('ldeptcode1').AsString := pib1021cForm.deptcode1.Text;
        Qemp1.ParamByName('ldeptcode2').AsString := pib1021cForm.deptcode2.Text;
        Qemp1.ParamByName('lpaycl1').AsString    := pib1021cForm.paycl1.Text;
        Qemp1.ParamByName('lpaycl2').AsString    := pib1021cForm.paycl2.Text;
     end;
     Qemp1.Open;
end;

procedure Tpib1022cForm.DestMake3;
begin
     Qemp1.Close;
     Qemp1.Sql.clear;
     Qemp1.Sql.Add('select empno,korname,paycl,payra,orgnum,deptcode,pstate ');
     Qemp1.Sql.Add('from pimpmas ');

     if pib1021cForm.Check1.Checked = True then
     begin
        Qemp1.Sql.Add('where (empno  >= :lempno1 and empno <= :lempno2)');
        Qemp1.Sql.Add('order by empno');
     end
     else
     if pib1021cForm.Check2.Checked = True then
     begin
        Qemp1.Sql.Add('where (deptcode >= :ldeptcode1 and deptcode <= :ldeptcode2)');
        if pib1021cForm.paycl1.Text = '' then
        begin
           Qemp1.Sql.Add('   or (paycl    >= :lpaycl1    and paycl    <= :lpaycl2)');
        end
        else
        begin
           Qemp1.Sql.Add('  and (paycl    >= :lpaycl1    and paycl    <= :lpaycl2)');
        end;
        Qemp1.Sql.Add('order by deptcode,paycl,payra,paygr,empno');
     end
     else
     if pib1021cForm.Check3.Checked = True then
     begin
        Qemp1.Sql.Add('where (empno in ('+pib1021cForm.memo1.Text+'))');
        Qemp1.Sql.Add('order by empno');
     end;

     if pib1021cForm.Check1.Checked = True then
     begin
        Qemp1.ParamByName('lempno1').AsString := pib1021cForm.empno1.Text;
        Qemp1.ParamByName('lempno2').AsString := pib1021cForm.empno2.Text;
     end
     else
     if pib1021cForm.Check2.Checked = True then
     begin
        Qemp1.ParamByName('ldeptcode1').AsString := pib1021cForm.deptcode1.Text;
        Qemp1.ParamByName('ldeptcode2').AsString := pib1021cForm.deptcode2.Text;
        Qemp1.ParamByName('lpaycl1').AsString    := pib1021cForm.paycl1.Text;
        Qemp1.ParamByName('lpaycl2').AsString    := pib1021cForm.paycl2.Text;
     end;
     Qemp1.Open;
end;

procedure Tpib1022cForm.photoreportBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin

     if pib1021cForm.Check3.Checked = True then DestMake1;

     if pib1021cForm.Check4.Checked = True then DestMake2;

     if pib1021cForm.Check5.Checked = True then DestMake3;

     RecCount := Qemp1.RecordCount;

     if RecCount = 0 then RecCount := 1;
     cnt := 1;
end;

procedure Tpib1022cForm.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  i    : integer;
  rect : TRECT;

  procedure Prog;
  begin
   if Qemp1.RecordCount <> cnt then
      pib1021cForm.Gauge1.Progress := (cnt*100) div RecCount
   else
      pib1021cForm.Gauge1.Progress := 100;
      SendMessage(pib1021cForm.panel3.handle,WM_PAINT,0,0);
  end;

begin
     empno1.Caption   := '';
     empno2.Caption   := '';
     empno3.Caption   := '';
     korname1.Caption := '';
     korname2.Caption := '';
     korname3.Caption := '';
     deptna11.Caption := '';
     deptna21.Caption := '';
     deptna31.Caption := '';
//     paycl1.Caption   := '';
     payra1.Caption   := '';
     deptna12.Caption := '';
     deptna22.Caption := '';
     deptna32.Caption := '';
//     paycl2.Caption   := '';
     payra2.Caption   := '';
     deptna13.Caption := '';
     deptna23.Caption := '';
     deptna33.Caption := '';
//     paycl3.Caption   := '';
     payra3.Caption   := '';

     if FileExists(HomeDir+'\pic\사람1.bmp') = true then
     begin
        image1.picture.LoadFromFile(HomeDir+'\pic\사람1.bmp');
        image2.picture.LoadFromFile(HomeDir+'\pic\사람1.bmp');
        image3.picture.LoadFromFile(HomeDir+'\pic\사람1.bmp');
     end
     else
     begin
        rect.left   := 0;
        rect.right  := 140;
        rect.top    := 0;
        rect.Bottom := 140;
        image1.Canvas.Brush.Color := clWindow;
        image2.Canvas.Brush.Color := clWindow;
        image3.Canvas.Brush.Color := clWindow;
        image1.Canvas.FillRect(rect);
        image2.Canvas.FillRect(rect);
        image3.Canvas.FillRect(rect);
     end;

     for i := 1 to 2 do
     begin
       Qphoto.Close;
       Qphoto.ParamByName('lempno').AsString := Qemp1.FieldByName('empno').AsString;
       Qphoto.Open;
       case i of
        1 : begin
            empno1.Caption   := Qemp1.FieldByName('empno').AsString;
            korname1.Caption := Qemp1.FieldByName('korname').AsString;

            if Qphoto.FieldByName('empno').AsString <> '' then
            begin
               stream    := TMemoryStream.Create;
               image1.picture.Graphic := nil;
               TblobField(Qphoto.FieldByName('photo')).SaveToStream(stream);
               stream.Position := 0;

               if stream.Size <> 0 then
                 JPEGLoadFromDB(TblobField(Qphoto.FieldByName('photo')), image1);
            Qphoto.Close;
            end;

            Qdept.Close;
            Qdept.ParamByName('lorg').AsString  := Qemp1.FieldByName('orgnum').AsString;
            Qdept.ParamByName('ldept').AsString := Qemp1.FieldByName('deptcode').AsString;
            Qdept.Open;
            deptna11.Caption := Qdept.FieldByName('deptna1').AsString;
            deptna21.Caption := Qdept.FieldByName('deptna2').AsString;
            deptna31.Caption := Qdept.FieldByName('deptna3').AsString;
//            paycl1.Caption := pib1021cForm.QcodeDisp('I112',Qemp1.FieldByName('paycl').AsString);
            payra1.Caption := pib1021cForm.QcodeDisp('I113',Qemp1.FieldByName('payra').AsString);
            end;  { end }

        2 : begin
            empno2.Caption   := Qemp1.FieldByName('empno').AsString;
            korname2.Caption := Qemp1.FieldByName('korname').AsString;

            if Qphoto.FieldByName('empno').AsString <> '' then
            begin
               stream    := TMemoryStream.Create;
               image2.picture.Graphic := nil;
               TblobField(Qphoto.FieldByName('photo')).SaveToStream(stream);
               stream.Position := 0;
               if stream.Size <> 0 then
                 JPEGLoadFromDB(TblobField(Qphoto.FieldByName('photo')), image2);
            Qphoto.Close;
            end;

            Qdept.Close;
            Qdept.ParamByName('lorg').AsString  := Qemp1.FieldByName('orgnum').AsString;
            Qdept.ParamByName('ldept').AsString := Qemp1.FieldByName('deptcode').AsString;
            Qdept.Open;
            deptna12.Caption := Qdept.FieldByName('deptna1').AsString;
            deptna22.Caption := Qdept.FieldByName('deptna2').AsString;
            deptna32.Caption := Qdept.FieldByName('deptna3').AsString;
//            paycl2.Caption := pib1021cForm.QcodeDisp('I112',Qemp1.FieldByName('paycl').AsString);
            payra2.Caption := pib1021cForm.QcodeDisp('I113',Qemp1.FieldByName('payra').AsString);
            end; { end}
       end;  {case .. end}
       Qemp1.Next;
       if Qemp1.Eof = True then
       begin
            prog;
            stream.free;
            System.Exit;
       end;
       prog;
       inc(cnt);
     end;  {for .. end }

     Qphoto.Close;
     Qphoto.ParamByName('lempno').AsString := Qemp1.FieldByName('empno').AsString;
     Qphoto.Open;
     empno3.Caption   := Qemp1.FieldByName('empno').AsString;
     korname3.Caption := Qemp1.FieldByName('korname').AsString;

     if Qphoto.FieldByName('empno').AsString <> '' then
     begin
        stream    := TMemoryStream.Create;
        image3.picture.Graphic := nil;
        TblobField(Qphoto.FieldByName('photo')).SaveToStream(stream);
        stream.Position := 0;
        if stream.Size <> 0 then
          JPEGLoadFromDB(TblobField(Qphoto.FieldByName('photo')), image3);
     Qphoto.Close;
     end;

     Qdept.Close;
     Qdept.ParamByName('lorg').AsString  := Qemp1.FieldByName('orgnum').AsString;
     Qdept.ParamByName('ldept').AsString := Qemp1.FieldByName('deptcode').AsString;
     Qdept.Open;
     deptna13.Caption := Qdept.FieldByName('deptna1').AsString;
     deptna23.Caption := Qdept.FieldByName('deptna2').AsString;
     deptna33.Caption := Qdept.FieldByName('deptna3').AsString;
//     paycl3.Caption   := pib1021cForm.QcodeDisp('I112',Qemp1.FieldByName('paycl').AsString);
     payra3.Caption   := pib1021cForm.QcodeDisp('I113',Qemp1.FieldByName('payra').AsString);
     prog;
     inc(cnt);
end;

procedure Tpib1022cForm.JPEGLoadFromDB(BlobField: TBlobField; Image: TQrImage);
var
   jpg: TJPEGImage;
   mem: TMemoryStream;
begin
     jpg := TJPEGImage.Create;
     mem := TMemoryStream.Create;
     try
       if BlobField.IsNull then
         Image.Picture := nil
       else begin
         BlobField.SaveToStream(mem);
         mem.Position := 0;
         jpg.LoadFromStream(mem);
         Image.Picture.Graphic := jpg;
       end;
     finally
       mem.Free;
       jpg.Free;
     end;
end;

procedure Tpib1022cForm.photoreportPreview(Sender: TObject);
begin
  Fm_PreviewForm := TFm_PreviewForm.CreatePreview(Application,photoReport);
  Fm_PreviewForm.Show;
{
     pib1023cForm := Tpib1023cForm.Create(Application);
     //pib1021cForm.ShowPreview;
     with pib1023cForm do
     begin
          photopreview := photoReport;
          QRPreview1.QRPrinter := TQRPrinter(Sender);
          Show;
     end;
}
end;

end.
