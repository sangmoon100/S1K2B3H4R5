unit pib41902;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, Quickrpt, codetext, datelib, QRCtrls, MemDS, DBAccess, Ora;

type
  TCData = class(TDataModule)
    Qvari: TQuery;
    Database1: TDatabase;
    PrnDlg: TPrintDialog;
    Qpic: TQuery;
    Ora_Qvari: TOraQuery;
    Ora_Qpic: TOraQuery;
    Ora_Excel: TOraQuery;
    Ora_Query2: TOraQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    function PrintExecute(aRpt : TQuickRep; aPageCnt : integer) : Boolean;
    procedure PersonPic(const empno : string; var pic : TQRImage);
    function  DeptnaDisp(const orgnum,deptcode : string) : String;
    function  Deptna3Disp(const orgnum,deptcode : string) : string; //shm 2002.01.15
    function  payrachdateSelect(const gubun,sgubun:string) : String;
  end;

var
  CData: TCData;

implementation
uses
  pib41901, jpeg;
  
{$R *.DFM}

function TCData.PrintExecute(aRpt : TQuickRep; aPageCnt : integer) : Boolean;
begin
    Result := False;
    prndlg.frompage := 1;
    prndlg.topage   := aPageCnt;
    prndlg.copies := 1;
    if prndlg.Execute = True then  begin
      aRpt.PrinterSettings.firstpage := prndlg.frompage;
      aRpt.PrinterSettings.lastpage  := prndlg.topage;
      aRpt.PrinterSettings.copies    := prndlg.copies;
      Result := True;
    end;
end;

procedure TCData.PersonPic(const empno : string; var pic : TQRImage);
var
  Bitmap : TBitmap;
  JPEGImage : TJPEGImage;
begin
   with Ora_Qpic do begin
       close;
       sql.clear;
       sql.add(Format('select empno,photo from cimphot where empno = ''%s'' ',[empno] ));
       open;
       try
         if EOF then
           pic.Picture.Bitmap := nil
         else
         begin
           JPEGImage := TJPEGImage.Create;
           Bitmap := TBitmap.Create;
           TBlobField(FieldByName('photo')).SaveToFile('c:\insa\list\pib4190.jpg');
           JPEGImage.LoadFromFile('c:\insa\list\pib4190.jpg');
           Bitmap.Assign(JPEGImage);
           pic.Picture.Bitmap := Bitmap;
         end;
       finally
         if not EOF then
         begin
           JPEGImage.Free;
           Bitmap.Free;
         end;
       end;
       Close;
    end;
end;

function TCData.DeptnaDisp(const orgnum,deptcode : string) : string;
begin
  if trim(deptcode) = '' then
     Result := ''
  else begin
     with Ora_Qvari do begin
        close;
        sql.clear;
        sql.add('select decode(length(deptcode),5,nvl(deptna2,deptna1),deptna1) deptname,deptna3 from pycdept '); //deptna3 추가 shm 2002.01.15
        sql.add(Format('where (deptcode = ''%s'' and orgnum = ''%s'')',[deptcode,orgnum] ));
        Open;
// kcj 예외처리 : 국사팀은 실명을 null로 한다.
        if  (deptcode = 'QJ') then
            Result := 'tt'
        else
            Result := FieldByName('deptname').AsString;
        close;
     end;
  end; {if}
end;

function  TCData.payrachdateSelect(const gubun,sgubun:string) : String;
begin
    Result := '';
    with Ora_Qvari do begin
       close;
       sql.clear;
       sql.add(' select value1, value2, value3, value4 from pimvari ');
       sql.add(Format('where (gubun = ''%s'' and sgubun = ''%s'')   ',[gubun,sgubun] ));
       Open;
           Result := FieldByName('value3').AsString;
       close;
    end;
end;

function TCData.Deptna3Disp(const orgnum,deptcode : string) : string; //shm 2002.01.15
begin
  if trim(deptcode) = '' then
     Result := ''
  else begin
     with Ora_Qvari do begin
        close;
        sql.clear;
        sql.add('select nvl(deptna3,'' ''),deptna3 from pycdept ');
        sql.add(Format('where (deptcode = ''%s'' and orgnum = ''%s'')',[deptcode,orgnum] ));
        Open;
            Result := FieldByName('deptna3').AsString;
        close;
     end;
  end; {if}
end;

end.
