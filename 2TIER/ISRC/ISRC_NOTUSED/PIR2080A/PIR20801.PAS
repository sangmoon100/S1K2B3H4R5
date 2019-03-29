unit PIR20801;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, OnFocusButton, Grids, DBGrids, OnScheme, Db, MemDS, DBAccess,
  Ora, DBTables, ExtCtrls, Buttons, Func;

type
  TMainForm = class(TForm)
    SF_Main: TOnSchemeForm;
    Panel1: TPanel;
    DgInter: TDBGrid;
    OraQuery1: TOraQuery;
    DataSource1: TDataSource;
    Panel2: TPanel;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    OraQuery2: TOraQuery;
    DataSource2: TDataSource;
    OraQuery3: TOraQuery;
    DataSource3: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    OraQuery4: TOraQuery;
    BtClose: TBitBtn;
    Label3: TLabel;
    BtDelA: TBitBtn;
    BtDelB: TBitBtn;
    BtSave: TBitBtn;
    CbDate: TComboBox;
    Label4: TLabel;
    procedure BtCloseClick(Sender: TObject);
    procedure BtDelAClick(Sender: TObject);
    procedure BtDelBClick(Sender: TObject);
    procedure BtSaveClick(Sender: TObject);
    procedure DgInterKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure CbDateChange(Sender: TObject);
    procedure Query_View;
    procedure FormPaint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  const RabasDate = '20080501';
var
  MainForm: TMainForm;

implementation

{$R *.DFM}

procedure TMainForm.BtCloseClick(Sender: TObject);
begin
     Close;
end;

procedure TMainForm.Query_View;
begin
     With OraQuery1 do
     begin
          Close;
          SQL.Clear;
          SQL.ADD(' SELECT a.grporder, b.rid, b.fullname, b.regno, b.mobile, a.grpmain, a.rabasdate    ');
          SQL.ADD('   FROM prectgrp a,                                                                 ');
          SQL.ADD('        (SELECT rid, fullname,                                                      ');
          SQL.ADD('                substr(regno,1,6) || ''-'' || substr(regno,7,7) regno,              ');
          SQL.ADD('                mobile                                                              ');
          SQL.ADD('           FROM prectmas                                                            ');
          SQL.ADD('          WHERE rabasdate = :v_rabasdate) b                                         ');
          SQL.ADD('  WHERE a.rabasdate = :v_rabasdate                                                  ');
          SQL.ADD('    AND a.rid=b.rid                                                                 ');
          SQL.ADD('    AND a.itvdate = :v_itvdate                                                      ');
          SQL.ADD('    AND (a.grpmain is null or a.grpmain='''')                                       ');
          SQL.ADD('  ORDER BY a.grporder asc                                                           ');
          
          ParamByName('v_rabasdate').AsString := RabasDate;
          ParamByName('v_itvdate'  ).AsString := UnMask(CbDate.Text,'@@@@-@@-@@');
          Open;
     end;
                                                      
     With OraQuery2 do
     begin
          Close;
          SQL.Clear;
          SQL.ADD(' SELECT a.rid,                                                    ');
          SQL.ADD('        (select fullname from prectmas                            ');
          SQL.ADD('          where rabasdate = a.rabasdate and rid=a.rid) fullname,  ');
          SQL.ADD('        a.grpsub                                                  ');
          SQL.ADD('   FROM prectgrp a                                                ');
          SQL.ADD('  WHERE a.rabasdate = :v_rabasdate                                ');
          SQL.ADD('    AND a.itvdate   = :v_itvdate                                  ');
          SQL.ADD('    AND a.grpmain is not null                                     ');
          SQL.ADD('    AND a.grpmain = ''A''                                         ');
          SQL.ADD('  ORDER BY a.grpsub asc                                           ');

          ParamByName('v_rabasdate').AsString := RabasDate;
          ParamByName('v_itvdate'  ).AsString := UnMask(CbDate.Text,'@@@@-@@-@@');
          Open;
     end;                            

     With OraQuery3 do
     begin
          Close;
          SQL.Clear;
          SQL.ADD(' SELECT a.rid,                                                    ');
          SQL.ADD('        (select fullname from prectmas                            ');
          SQL.ADD('          where rabasdate = a.rabasdate and rid=a.rid) fullname,  ');
          SQL.ADD('        a.grpsub                                                  ');
          SQL.ADD('   FROM prectgrp a                                                ');
          SQL.ADD('  WHERE a.rabasdate = :v_rabasdate                                ');
          SQL.ADD('    AND a.itvdate   = :v_itvdate                                  ');
          SQL.ADD('    AND not a.grpmain is null                                     ');
          SQL.ADD('    AND a.grpmain = ''B''                                         ');
          SQL.ADD('  ORDER BY a.grpsub asc                                           ');

          ParamByName('v_rabasdate').AsString := RabasDate;
          ParamByName('v_itvdate'  ).AsString := UnMask(CbDate.Text,'@@@@-@@-@@');
          Open;
     end;

     if OraQuery1.RecordCount=0 then DgInter.Enabled := False
     else                            DgInter.Enabled := True;
end;

procedure TMainForm.BtDelAClick(Sender: TObject);
var
     locateval : integer;
begin
     if OraQuery2.RecordCount=0 then exit;

     DgInter.Enabled := True;

     With OraQuery4 do
     begin
          Close;
          SQL.Clear;
          SQL.ADD(' UPDATE prectgrp                  ');
          SQL.ADD('    SET grpmain = '''',           ');
          SQL.ADD('        grpsub  = ''''            ');
          SQL.ADD('  WHERE rabasdate = :v_rabasdate  ');
          SQL.ADD('    AND rid       = :v_rid        ');
          SQL.ADD('    AND itvdate   = :v_itvdate    ');
          SQL.ADD('    AND grpmain   = ''A''         ');
          
          ParamByName('v_rabasdate').AsString  := RabasDate;
          ParamByName('v_rid'      ).AsInteger := OraQuery2.FieldByName('rid').AsInteger;
          ParamByName('v_itvdate'  ).AsString  := UnMask(CbDate.Text,'@@@@-@@-@@');
          ExecSQL;

          Close;
          SQL.Clear;
          SQL.ADD(' UPDATE prectgrp                  ');
          SQL.ADD('    SET grpsub = grpsub-1         ');
          SQL.ADD('  WHERE rabasdate = :v_rabasdate  ');
          SQL.ADD('    AND itvdate   = :v_itvdate    ');
          SQL.ADD('    AND grpmain   = ''A''         ');
          SQL.ADD('    AND grpsub    >= :v_grpsub    ');

          ParamByName('v_rabasdate').AsString  := RabasDate;
          ParamByName('v_grpsub'   ).AsInteger := OraQuery2.FieldByName('grpsub').AsInteger;
          ParamByName('v_itvdate'  ).AsString  := UnMask(CbDate.Text,'@@@@-@@-@@');
          ExecSQL;
     end;

     locateval := OraQuery2.FieldByName('grpsub').AsInteger;
     OraQuery1.Refresh;
     OraQuery1.Locate('RID',OraQuery2.FieldByName('rid').AsInteger,[loPartialKey]);

     if locateval = OraQuery2.RecordCount then
     begin
          OraQuery2.Refresh;
          OraQuery2.Last;
     end
     else
     begin
          OraQuery2.Refresh;
          OraQuery2.Locate('GRPSUB',locateval,[loPartialKey]);
     end;
end;

procedure TMainForm.BtDelBClick(Sender: TObject);
var
     locateval : integer;
begin
     if OraQuery3.RecordCount = 0 then exit;

     DgInter.Enabled := True;

     With OraQuery4 do
     begin
          Close;
          SQL.Clear;
          SQL.ADD(' UPDATE prectgrp                  ');
          SQL.ADD('    SET grpmain = '''',           ');
          SQL.ADD('        grpsub  = ''''            ');
          SQL.ADD('  WHERE rabasdate = :v_rabasdate  ');
          SQL.ADD('    AND rid       = :v_rid        ');
          SQL.ADD('    AND itvdate   = :v_itvdate    ');
          SQL.ADD('    AND grpmain   = ''B''         ');

          ParamByName('v_rabasdate').AsString  := RabasDate;
          ParamByName('v_rid'      ).AsInteger := OraQuery3.FieldByName('rid').AsInteger;
          ParamByName('v_itvdate'  ).AsString  := UnMask(CbDate.Text,'@@@@-@@-@@');
          ExecSQL;

          Close;
          SQL.Clear;
          SQL.ADD(' UPDATE prectgrp                  ');
          SQL.ADD('    SET grpsub = grpsub-1         ');
          SQL.ADD('  WHERE rabasdate = :v_rabasdate  ');
          SQL.ADD('    AND itvdate   = :v_itvdate    ');
          SQL.ADD('    AND grpmain   = ''B''         ');
          SQL.ADD('    AND grpsub    >= :v_grpsub    ');

          ParamByName('v_rabasdate').AsString  := RabasDate;
          ParamByName('v_grpsub'   ).AsInteger := OraQuery3.FieldByName('grpsub').AsInteger;
          ParamByName('v_itvdate'  ).AsString  := UnMask(CbDate.Text,'@@@@-@@-@@');
          ExecSQL;
     end;

     locateval := OraQuery3.FieldByName('grpsub').AsInteger;

     OraQuery1.Refresh;
     OraQuery1.Locate('RID',OraQuery3.FieldByName('rid').AsInteger,[loPartialKey]);


     if locateval = OraQuery3.RecordCount then
     begin
          OraQuery3.Refresh;
          OraQuery3.Last;
     end
     else
     begin
          OraQuery3.Refresh;
          OraQuery3.Locate('GRPSUB',locateval,[loPartialKey]);
     end;
end;

procedure TMainForm.BtSaveClick(Sender: TObject);
var
   MaxSubA : Integer;
   MaxSubB : Integer;
   LcCursor : integer;
   locateval : integer;
   v_grpmain : String;
begin
     if OraQuery1.RecordCount = 0 then exit;

     locateval := OraQuery1.FieldByName('rid').AsInteger;
     v_grpmain := UpperCase(DgInter.Fields[0].AsString);

     if (v_grpmain = 'A') or (v_grpmain = 'B') then
     begin
          With OraQuery4 do
          begin
               Close;    //그룹 A의 MAX값 추출
               SQL.Clear;
               SQL.Add('SELECT max(nvl(grpsub,0)) Maxsub ');
               SQL.Add('  FROM prectgrp                  ');
               SQL.Add(' WHERE rabasdate = :v_rabasdate  ');
               SQL.ADD('   AND itvdate   = :v_itvdate    ');
               SQL.Add('   AND grpmain   = ''A''         ');

               ParamByName('v_rabasdate').AsString := RabasDate;
               ParamByName('v_itvdate'  ).AsString := UnMask(CbDate.Text,'@@@@-@@-@@');
               Open;

               MaxSubA := OraQuery4.FieldByName('Maxsub').AsInteger+1;

               Close;    //그룹 B의 MAX값 추출
               SQL.Clear;
               SQL.Add('SELECT Max(nvl(grpsub,0)) Maxsub ');
               SQL.Add('  FROM prectgrp                  ');
               SQL.Add(' WHERE rabasdate = :v_rabasdate  ');
               SQL.ADD('   AND itvdate   = :v_itvdate    ');
               SQL.Add('   AND grpmain   = ''B''         ');

               ParamByName('v_rabasdate').AsString := RabasDate;
               ParamByName('v_itvdate'  ).AsString := UnMask(CbDate.Text,'@@@@-@@-@@');
               Open;

               MaxSubB := OraQuery4.FieldByName('Maxsub').AsInteger+1;
                           
               Close;
               SQL.Clear;
               SQL.Add('UPDATE prectgrp                                                              ');
               SQL.Add('   SET grpmain  = DECODE(Upper(:v_grpmain),''A'', ''A'',                     ');
               SQL.Add('                                           ''B'', ''B''),                    ');
               SQL.Add('       grpsub   = DECODE(Upper(:v_grpmain),''A'', ' + IntToStr(MaxSubA) + ', ');
               SQL.Add('                                           ''B'', ' + IntToStr(MaxSubB) + ') ');
               SQL.Add(' WHERE rabasdate = :v_rabasdate                                              ');
               SQL.ADD('   AND itvdate   = :v_itvdate                                                ');
               SQL.Add('   AND rid       = :v_rid                                                    ');


               ParamByName('v_rabasdate').AsString  := RabasDate;
               ParamByName('v_itvdate'  ).AsString  := UnMask(CbDate.Text,'@@@@-@@-@@');
               ParamByName('v_rid'      ).AsInteger := OraQuery1.FieldByName('rid').AsInteger;
               ParamByName('v_grpmain'  ).AsString  := v_grpmain;

               ExecSql;
          end;

          if OraQuery1.RecordCount > 1 then OraQuery1.Next;

          LcCursor  := OraQuery1.FieldByName('rid').AsInteger;
          OraQuery1.Refresh;
          OraQuery1.Locate('rid',LcCursor,[loPartialKey]);


          if v_grpmain = 'A' then
          begin
               OraQuery2.Refresh;
               OraQuery2.Locate('rid',locateval,[loPartialKey]);
          end
          else if v_grpmain = 'B' then
          begin
               OraQuery3.Refresh;
               OraQuery3.Locate('rid',locateval,[loPartialKey]);
          end;
     end;

     if OraQuery1.RecordCount=0 then DgInter.Enabled := False
     else
     begin
          DgInter.Enabled := True;
          DgInter.SetFocus;
     end;
end;

procedure TMainForm.DgInterKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if key = 13 then
     begin
          BtSave.SetFocus;
          BtSaveClick(nil);
     end;
end;

procedure TMainForm.DataSource1DataChange(Sender: TObject; Field: TField);
begin
     if OraQuery1.eof and (OraQuery1.RecordCount<>0) then OraQuery1.Prior;
end;

procedure TMainForm.CbDateChange(Sender: TObject);
begin
     Query_View;
end;

procedure TMainForm.FormPaint(Sender: TObject);
var
    i, iToday : Integer;
begin
     OraConnect;
     
     if (Copy(Pgrade,2,1) = 'A') or (Copy(Pgrade,2,1) = 'B') then
     begin
          With OraQuery4 do
          begin
               Close;
               SQL.Clear;
               SQL.ADD(' SELECT distinct(itvdate),              ');
               SQL.ADD('        to_char(sysdate,''YYYYMMDD'') a ');
               SQL.ADD('   FROM prectgrp                        ');
               SQL.ADD('  WHERE rabasdate= :v_rabasdate         ');
               ParamByName('v_rabasdate').AsString := RabasDate;
               Open;

               CbDate.Clear;
               i := 0;
               iToday := 0;
               if RecordCount > 0 then
               begin
                    First;
                    While Not OraQuery4.Eof do
                    begin
                         CbDate.Items.Add(InMask(FieldByName('itvdate').AsString,'@@@@-@@-@@'));
                         if FieldByName('a').AsString = FieldByName('itvdate').AsString then iToday := i;
                         i := i + 1;
                         Next;
                    end;
               end;

               CbDate.ItemIndex := iToday; //ShowMessage(inttostr(iToday));
          end;

          Query_View;
     end
     else begin
          MessageBox(Self.Handle,'사용 권한이 없습니다.','종합인사',MB_OK+MB_ICONINFORMATION);
          Close;
     end;
end;

end.
